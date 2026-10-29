#!/usr/bin/env python3
"""Evaluate a completed EVT ledger against the canonical template and raw evidence.

This tool never turns NOT_RUN data into evidence. Every row must have a numeric
value, matching computed PASS/FAIL, complete traceability fields, and a local raw
evidence file whose SHA-256 matches the ledger.
"""
from pathlib import Path
import argparse
import csv
import datetime as dt
import hashlib
import json
import math
import importlib.util

ROOT = Path(__file__).resolve().parents[2]
TEMPLATE = ROOT / "docs/validation/xe-evt1-results-template.csv"
PLAN = ROOT / "docs/validation/xe-current-five-unit-evt-plan.json"
PCB = ROOT / "hardware/xe-minimal/pendant-xe-minimal.kicad_pcb"
BOM = ROOT / "docs/procurement/xe-production-bom-2026-10-28.csv"
CASE_REVIEW = ROOT / "mechanical/xe-minimal/prototype-v1/case-pebble-v4-review.json"
SOURCE_LOCK = ROOT / "hardware/xe-minimal/factory-programming/source-toolchain-lock.json"
HOST_IMPORTER = ROOT / "host/import_recordings.py"
PROGRAMMING_EVALUATOR = ROOT / "hardware/xe-minimal/factory-programming/evaluate_five_unit_programming_record.py"
CUTOFF_EVALUATOR = ROOT / "docs/validation/evaluate_xe_battery_cutoff_results.py"
HARDWARE_REVISION = json.loads((ROOT / "hardware/xe-minimal/prototype-architecture-v1.json").read_text())["version"]
CASE_MATERIAL = "Bambu PETG Basic"
LOWER_PRINT_ORIENTATION = "CAD X/hole axis rotated onto build Z"
UPPER_PRINT_ORIENTATION = "CAD Z is build Z"
LAYER_HEIGHT_MM = 0.16
WALL_COUNT = 6
SUPPORT = "enabled"
IDENTITY = ("plan_id", "gate", "unit_id", "condition", "metric")
TRACE_FIELDS = (
    "pcb_sha256", "firmware_sha256", "bom_revision", "case_revision", "case_material",
    "pcb_serial", "mcu_uid_hex", "storage_device_identity",
    "lower_print_orientation", "upper_print_orientation", "layer_height_mm", "wall_count",
    "support", "battery_serial_or_lot", "instrument_model_serial", "calibration_due_date",
    "ambient_C", "humidity_percent", "start_utc", "end_utc", "operator",
)

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def rows(path):
    with path.open(newline="") as stream:
        return list(csv.DictReader(stream))

def key(row):
    return tuple(row[field] for field in IDENTITY)

def finite_number(text, label):
    try:
        value = float(text)
    except (TypeError, ValueError):
        raise ValueError(f"non-numeric {label}: {text!r}") from None
    if not math.isfinite(value):
        raise ValueError(f"non-finite {label}: {text!r}")
    return value

def utc(text, label):
    try:
        parsed = dt.datetime.fromisoformat(text.replace("Z", "+00:00"))
    except ValueError:
        raise ValueError(f"invalid ISO timestamp {label}: {text!r}") from None
    if parsed.tzinfo is None or parsed.utcoffset() != dt.timedelta(0):
        raise ValueError(f"timestamp must be UTC {label}: {text!r}")
    return parsed

def checked_artifact(manifest_path, relative, expected, label):
    path = Path(relative)
    if not path.is_absolute():
        path = manifest_path.parent / path
    if not path.is_file() or sha(path) != expected:
        raise ValueError(f"missing or mismatched programming artifact: {label}")
    return path

def evaluate(input_path, output_path, programming_manifest_path, programming_record_path):
    plan = json.loads(PLAN.read_text())
    cord_assignment = plan["gates"][5]["cord_diameter_assignment_mm"]
    if cord_assignment != {"U1": 2.0, "U2": 2.0, "U3": 3.0, "U4": 3.0, "U5": 2.5}:
        raise ValueError("canonical cord-diameter assignment changed")
    pack_assignment = plan["gates"][2]["cutoff_pack_to_completed_unit_assignment"]
    if pack_assignment != {f"U{i}": f"P{i}" for i in range(1, 6)}:
        raise ValueError("canonical cutoff-pack assignment changed")
    expected_pcb_sha = sha(PCB)
    expected_bom_sha = sha(BOM)
    expected_case_revision = json.loads(CASE_REVIEW.read_text())["version"]
    source_lock = json.loads(SOURCE_LOCK.read_text())
    programming = json.loads(programming_manifest_path.read_text())
    spec = importlib.util.spec_from_file_location("factory_programming_acceptance", PROGRAMMING_EVALUATOR)
    factory = importlib.util.module_from_spec(spec); spec.loader.exec_module(factory)
    try:
        factory.evaluate(programming_manifest_path, programming_record_path)
    except AssertionError as exc:
        raise ValueError("factory programming record failed acceptance") from exc
    programming_rows = rows(programming_record_path)
    programmed_units = {row["unit_id"]: row for row in programming_rows}
    if programming.get("status") != "EVT_IMAGE_COMPLETE_WITH_ALLOCATED_USB_IDS":
        raise ValueError("programming manifest is not an EVT-complete image")
    if programming.get("target_mpn") != "STM32U585CIU6" or programming.get("hardware_revision") != HARDWARE_REVISION:
        raise ValueError("programming manifest target or hardware revision mismatch")
    if programming.get("source_tree_sha256") != source_lock["source_tree_sha256"]:
        raise ValueError("programming image source tree does not match the locked source tree")
    if programming.get("private_key_included") is not False or programming.get("common_firmware_per_buyer") is not True:
        raise ValueError("programming image violates common public-only firmware policy")
    if programming.get("usb_hardware_profile") != "fixed-100" or programming.get("usb_descriptor_max_power_mA") != 100:
        raise ValueError("programming image does not match canonical fixed-100 USB input hardware")
    if programming.get("charging_enabled_for_physical_evt") is not True or programming.get("charging_release_status") != "UNQUALIFIED_UNTIL_PHYSICAL_EVT_PASSES":
        raise ValueError("programming image cannot exercise the mandatory charge path under EVT hold")
    vid, pid = programming.get("usb_vid"), programming.get("usb_pid")
    if not isinstance(vid, int) or not isinstance(pid, int) or not 0 < vid < 65536 or not 0 < pid < 65536 or (vid, pid) in ((1, 2), (0x1234, 0x5678)):
        raise ValueError("missing or fixture USB VID/PID")
    firmware_path = checked_artifact(programming_manifest_path, programming["firmware_image"], programming["firmware_sha256"], "firmware")
    checked_artifact(programming_manifest_path, programming["elf"], programming["elf_sha256"], "ELF")
    checked_artifact(programming_manifest_path, programming["map"], programming["map_sha256"], "MAP")
    checked_artifact(programming_manifest_path, programming["usb_id_allocation_evidence"], programming["usb_id_allocation_evidence_sha256"], "USB ID allocation evidence")
    cutoff_path = checked_artifact(programming_manifest_path, programming["battery_cutoff_evidence"], programming["battery_cutoff_evidence_sha256"], "battery cutoff evidence")
    cutoff = json.loads(cutoff_path.read_text())
    cutoff_spec = importlib.util.spec_from_file_location("battery_cutoff_acceptance", CUTOFF_EVALUATOR)
    cutoff_module = importlib.util.module_from_spec(cutoff_spec); cutoff_spec.loader.exec_module(cutoff_module)
    cutoff = cutoff_module.validate_result(cutoff_path)
    if cutoff.get("status") != "BATTERY_CUTOFF_SELECTED_FROM_FIVE_PACK_PHYSICAL_CHARACTERIZATION":
        raise ValueError("battery cutoff evidence status is not physically qualified")
    if programming.get("battery_cutoff_mv") != cutoff.get("selected_cutoff_mv") or not isinstance(programming.get("battery_cutoff_mv"), int) or not 3000 <= programming["battery_cutoff_mv"] <= 4200:
        raise ValueError("programmed battery cutoff does not match qualified evidence")
    if cutoff.get("battery_mpn") != "DTP401525-XE" or cutoff.get("capacity_mAh") != 110 or cutoff.get("tested_pack_ids") != [f"P{i}" for i in range(1, 6)]:
        raise ValueError("battery cutoff evidence does not cover the fixed five-pack characterization scope")
    if cutoff.get("minimum_safe_cutoff_mv", 9999) > programming["battery_cutoff_mv"] or cutoff.get("minimum_usable_capacity_to_selected_cutoff_mAh", 0) < 70.4:
        raise ValueError("battery cutoff characterization is unsafe or cannot preserve the capacity allocation")
    if cutoff.get("load_average_mA", 0) < 4.4 or cutoff.get("load_peak_mA", 0) < 110 or cutoff.get("all_packs_passed") is not True:
        raise ValueError("battery cutoff characterization load or result is incomplete")
    expected = rows(TEMPLATE)
    actual = rows(input_path)
    if len(actual) != len(expected):
        raise ValueError(f"row count {len(actual)} != canonical {len(expected)}")
    expected_by_key = {key(row): row for row in expected}
    actual_by_key = {key(row): row for row in actual}
    if len(expected_by_key) != len(expected) or len(actual_by_key) != len(actual):
        raise ValueError("duplicate row identity")
    if set(actual_by_key) != set(expected_by_key):
        missing = sorted(set(expected_by_key) - set(actual_by_key))
        extra = sorted(set(actual_by_key) - set(expected_by_key))
        raise ValueError(f"row identity mismatch missing={missing[:3]} extra={extra[:3]}")

    failures = []
    gate_counts = {gate: {"PASS": 0, "FAIL": 0} for gate in "ABCDEF"}
    run_owners = {}
    unit_identity = {}
    cord_identity = {}
    uid_owner = {}
    pcb_serial_owner = {}
    battery_owner = {}
    raw_evidence_owner = {}
    os_run_ids = set()
    abnormal_runs = {}
    abnormal_run_owners = {}
    rail_fault_runs = {}
    rail_fault_run_owners = {}
    tps_short_runs = {}
    tps_short_run_owners = {}
    cable_profiles = {}
    unit_cables = {unit: set() for unit in (f"U{i}" for i in range(1, 6))}
    ntc_resistance = {unit: {} for unit in (f"U{i}" for i in range(1, 6))}
    temperature_switch = {unit: {} for unit in (f"U{i}" for i in range(1, 6))}
    runtime_conditions = ("16h_continuous_recording_25C", "16h_endpoint_repeat_10C", "16h_endpoint_repeat_35C")
    runtime_metrics = {(unit, condition): {} for unit in (f"U{i}" for i in range(1, 6)) for condition in runtime_conditions}
    runtime_intervals = {(unit, condition): set() for unit in (f"U{i}" for i in range(1, 6)) for condition in runtime_conditions}
    storage_metrics = {}
    storage_sessions = {}
    storage_session_runs = set()
    global_identity = None
    for identity, expected_row in expected_by_key.items():
        row = actual_by_key[identity]
        label = "/".join(identity[1:])
        for fixed in ("plan_id", "gate", "unit_id", "condition", "metric", "unit", "lower_limit", "upper_limit"):
            if row[fixed] != expected_row[fixed]:
                raise ValueError(f"canonical field changed {label}: {fixed}")
        value = finite_number(row["value"], label)
        if not row["run_id"].strip():
            raise ValueError(f"missing run_id {label}")
        owner = (row["gate"], row["unit_id"])
        previous_owner = run_owners.setdefault(row["run_id"], owner)
        if previous_owner != owner:
            raise ValueError(f"run_id reused across gate/unit: {row['run_id']}")
        lower = finite_number(row["lower_limit"], label) if row["lower_limit"] else None
        upper = finite_number(row["upper_limit"], label) if row["upper_limit"] else None
        if lower is None and upper is None:
            raise ValueError(f"metric has no acceptance boundary {label}")
        computed = "PASS" if (lower is None or value >= lower) and (upper is None or value <= upper) else "FAIL"
        if row["result_PASS_FAIL_NOT_RUN"] != computed:
            raise ValueError(f"declared result does not match limits {label}: declared={row['result_PASS_FAIL_NOT_RUN']} computed={computed}")
        for field in TRACE_FIELDS:
            if not row[field].strip():
                raise ValueError(f"missing traceability {label}: {field}")
        if row["pcb_sha256"] != expected_pcb_sha:
            raise ValueError(f"PCB hash is not the canonical candidate {label}")
        if row["bom_revision"] != expected_bom_sha:
            raise ValueError(f"BOM revision is not the canonical BOM SHA-256 {label}")
        if row["case_revision"] != expected_case_revision:
            raise ValueError(f"case revision is not the canonical case {label}")
        if row["case_material"] != CASE_MATERIAL:
            raise ValueError(f"case material is not the canonical sliced material {label}")
        if row["lower_print_orientation"] != LOWER_PRINT_ORIENTATION:
            raise ValueError(f"lower print orientation is not canonical {label}")
        if row["upper_print_orientation"] != UPPER_PRINT_ORIENTATION:
            raise ValueError(f"upper print orientation is not canonical {label}")
        if abs(finite_number(row["layer_height_mm"], label) - LAYER_HEIGHT_MM) > 0.001:
            raise ValueError(f"layer height is not canonical {label}")
        if finite_number(row["wall_count"], label) != WALL_COUNT:
            raise ValueError(f"wall count is not canonical {label}")
        if row["support"] != SUPPORT:
            raise ValueError(f"support setting is not canonical {label}")
        if row["firmware_sha256"] != programming["firmware_sha256"]:
            raise ValueError(f"firmware hash is not the programmed EVT image {label}")
        uid = row["mcu_uid_hex"]
        if len(uid) != 24 or any(c not in "0123456789abcdef" for c in uid):
            raise ValueError(f"invalid STM32 96-bit UID {label}")
        previous_uid_owner = uid_owner.setdefault(uid, row["unit_id"])
        if previous_uid_owner != row["unit_id"]:
            raise ValueError(f"MCU UID reused across units {label}")
        previous_serial_owner = pcb_serial_owner.setdefault(row["pcb_serial"], row["unit_id"])
        if previous_serial_owner != row["unit_id"]:
            raise ValueError(f"PCB serial reused across units {label}")
        programmed = programmed_units.get(row["unit_id"])
        if not programmed or programmed["pcb_serial"] != row["pcb_serial"] or programmed["mcu_uid_hex"].lower() != uid:
            raise ValueError(f"EVT unit is not the accepted factory-programmed unit {label}")
        if programmed["firmware_sha256"] != row["firmware_sha256"]:
            raise ValueError(f"EVT unit firmware differs from factory programming record {label}")
        if row["battery_serial_or_lot"] != pack_assignment[row["unit_id"]]:
            raise ValueError(f"EVT unit does not retain its cutoff-characterized pack {label}")
        previous_battery_owner = battery_owner.setdefault(row["battery_serial_or_lot"], row["unit_id"])
        if previous_battery_owner != row["unit_id"]:
            raise ValueError(f"battery serial reused across units {label}")
        if row["gate"] == "F":
            for field in (
                "cord_material", "cord_diameter_mm", "cord_lot", "cord_mpn",
                "cord_breakaway_claim_reference", "cord_breakaway_claim_sha256",
                "cord_risk_assessment_id", "approved_breakaway_min_N", "approved_breakaway_max_N",
            ):
                if not row[field].strip():
                    raise ValueError(f"missing cord traceability {label}: {field}")
            approved_min = finite_number(row["approved_breakaway_min_N"], label)
            approved_max = finite_number(row["approved_breakaway_max_N"], label)
            if approved_min <= 0 or approved_max <= approved_min:
                raise ValueError(f"invalid approved breakaway window {label}")
            claim_hash = row["cord_breakaway_claim_sha256"]
            if len(claim_hash) != 64 or any(c not in "0123456789abcdef" for c in claim_hash):
                raise ValueError(f"invalid cord claim evidence SHA-256 {label}")
            cord_diameter = finite_number(row["cord_diameter_mm"], label)
            if not 2.0 <= cord_diameter <= 3.0:
                raise ValueError(f"cord diameter is outside canonical 2-3 mm range {label}")
            if abs(cord_diameter - cord_assignment[row["unit_id"]]) > 0.01:
                raise ValueError(f"cord diameter does not match the per-unit endpoint/nominal assignment {label}")
            this_cord = (
                row["cord_material"], row["cord_diameter_mm"], row["cord_lot"], row["cord_mpn"],
                row["cord_breakaway_claim_reference"], row["cord_breakaway_claim_sha256"],
                row["cord_risk_assessment_id"], row["approved_breakaway_min_N"], row["approved_breakaway_max_N"],
            )
            previous_cord = cord_identity.setdefault(row["unit_id"], this_cord)
            if previous_cord != this_cord:
                raise ValueError(f"mixed cord identity within unit {label}")
        os_conditions = {"macOS_C_to_C":"macOS", "Windows_C_to_C":"Windows", "Linux_C_to_C":"Linux"}
        if row["gate"] == "E" and row["condition"] in os_conditions:
            if row["host_os_name"] != os_conditions[row["condition"]] or not row["host_os_version"].strip():
                raise ValueError(f"missing or wrong host OS identity {label}")
            if row["host_importer_sha256"] != sha(HOST_IMPORTER):
                raise ValueError(f"host importer is not the current release source {label}")
            if not row["age_tool_version"].strip() or not row["ffmpeg_version"].strip():
                raise ValueError(f"missing host decrypt/decode tool version {label}")
            if row["run_id"] in os_run_ids:
                raise ValueError(f"three-OS tests do not have independent run IDs {label}")
            os_run_ids.add(row["run_id"])
        if row["gate"] == "E" and row["condition"].startswith("USB_cable_"):
            for field in ("usb_cable_id", "usb_cable_type", "usb_overmold_width_mm", "usb_overmold_height_mm"):
                if not row[field].strip():
                    raise ValueError(f"missing USB cable fit traceability {label}: {field}")
            if row["usb_cable_type"] not in ("C-to-C", "A-to-C"):
                raise ValueError(f"invalid USB cable type {label}")
            width = finite_number(row["usb_overmold_width_mm"], label)
            height = finite_number(row["usb_overmold_height_mm"], label)
            if width <= 0 or height <= 0:
                raise ValueError(f"invalid USB overmold dimensions {label}")
            profile = (row["usb_cable_type"], width, height)
            previous_profile = cable_profiles.setdefault(row["usb_cable_id"], profile)
            if previous_profile != profile:
                raise ValueError(f"USB cable identity has inconsistent profile {label}")
            unit_cables[row["unit_id"]].add(row["usb_cable_id"])
        for field in ("pcb_sha256", "firmware_sha256", "raw_data_sha256"):
            if len(row[field]) != 64 or any(c not in "0123456789abcdef" for c in row[field]):
                raise ValueError(f"invalid SHA-256 {label}: {field}")
        raw_name = Path(row["raw_data_path"])
        if raw_name.is_absolute() or ".." in raw_name.parts:
            raise ValueError(f"raw evidence path must remain inside ledger directory {label}")
        raw = (input_path.parent / raw_name).resolve()
        if not raw.is_relative_to(input_path.parent.resolve()):
            raise ValueError(f"raw evidence escapes ledger directory {label}")
        if not raw.is_file() or sha(raw) != row["raw_data_sha256"]:
            raise ValueError(f"missing or mismatched raw evidence {label}: {raw}")
        raw_identity = row["raw_data_sha256"]
        previous_raw_owner = raw_evidence_owner.setdefault(raw_identity, row["run_id"])
        if previous_raw_owner != row["run_id"]:
            raise ValueError(f"raw evidence reused across distinct runs {label}")
        if row["gate"] == "B" and row["condition"].startswith("NCP360_abnormal_input_"):
            abnormal_key = (row["unit_id"], row["condition"])
            this_abnormal = (row["run_id"], raw_identity)
            previous_abnormal = abnormal_runs.setdefault(abnormal_key, this_abnormal)
            if previous_abnormal != this_abnormal:
                raise ValueError(f"one abnormal-input condition lacks one coherent waveform {label}")
            previous_condition = abnormal_run_owners.setdefault(row["run_id"], abnormal_key)
            if previous_condition != abnormal_key:
                raise ValueError(f"abnormal-input run reused across conditions {label}")
        if row["gate"] == "A" and row["condition"].startswith("current_limited_battery_simulator_"):
            rail_fault_key = (row["unit_id"], row["condition"])
            this_rail_fault = (row["run_id"], raw_identity)
            previous_rail_fault = rail_fault_runs.setdefault(rail_fault_key, this_rail_fault)
            if previous_rail_fault != this_rail_fault:
                raise ValueError(f"one rail-fault condition lacks one coherent record {label}")
            previous_rail_condition = rail_fault_run_owners.setdefault(row["run_id"], rail_fault_key)
            if previous_rail_condition != rail_fault_key:
                raise ValueError(f"rail-fault run reused across conditions {label}")
        if row["gate"] == "B" and row["condition"] == "TPS2552_output_short_latch_and_USB_power_cycle_recovery":
            tps_short_key = (row["unit_id"], row["condition"])
            this_tps_short = (row["run_id"], raw_identity)
            previous_tps_short = tps_short_runs.setdefault(tps_short_key, this_tps_short)
            if previous_tps_short != this_tps_short:
                raise ValueError(f"TPS2552 short test lacks one coherent record {label}")
            previous_tps_owner = tps_short_run_owners.setdefault(row["run_id"], tps_short_key)
            if previous_tps_owner != tps_short_key:
                raise ValueError(f"TPS2552 short run reused across units {label}")
        start, end = utc(row["start_utc"], label), utc(row["end_utc"], label)
        if end < start:
            raise ValueError(f"end before start {label}")
        if row["metric"] == "elapsed_recording_time":
            wall_seconds = (end - start).total_seconds()
            if abs(wall_seconds - value) > 5:
                raise ValueError(f"recorded duration disagrees with UTC timestamps {label}: value={value} wall={wall_seconds}")
        if row["gate"] == "C" and row["condition"] in runtime_conditions:
            runtime_key = (row["unit_id"], row["condition"])
            runtime_metrics[runtime_key][row["metric"]] = value
            runtime_intervals[runtime_key].add((start, end))
        if row["gate"] == "D" and row["unit_id"] == "U1" and row["condition"] == "36h_encrypted_storage":
            storage_metrics[row["metric"]] = value
        if row["gate"] == "D" and row["unit_id"] == "U1" and row["condition"].startswith("36h_recording_session_"):
            storage_sessions[row["condition"]] = value
            storage_session_runs.add(row["run_id"])
        if row["gate"] == "B" and row["metric"] == "pack_NTC_resistance":
            temperature = int(row["condition"].split("_")[2][:-1])
            ntc_resistance[row["unit_id"]][temperature] = value
        if row["gate"] == "B" and row["condition"] in {
            "cold_temperature_down_sweep", "cold_temperature_up_sweep",
            "hot_temperature_up_sweep", "hot_temperature_down_sweep",
        }:
            temperature_switch[row["unit_id"]][row["condition"]] = value
        ambient = finite_number(row["ambient_C"], label)
        if row["gate"] == "C":
            required_ambient = {"16h_continuous_recording_25C": 25, "16h_endpoint_repeat_10C": 10, "16h_endpoint_repeat_35C": 35}[row["condition"]]
            if abs(ambient - required_ambient) > 2:
                raise ValueError(f"runtime ambient is outside {required_ambient}C +/-2C {label}")
        humidity = finite_number(row["humidity_percent"], label)
        if not 0 <= humidity <= 100:
            raise ValueError(f"invalid humidity {label}")
        try:
            calibration_due = dt.date.fromisoformat(row["calibration_due_date"])
        except ValueError:
            raise ValueError(f"invalid calibration due date {label}") from None
        if calibration_due < start.date():
            raise ValueError(f"instrument calibration expired before run {label}")
        if row["deviation_and_failure_notes"].strip():
            raise ValueError(f"undispositioned deviation blocks release {label}")
        this_global = (row["pcb_sha256"], row["firmware_sha256"], row["bom_revision"], row["case_revision"])
        if global_identity is None:
            global_identity = this_global
        elif global_identity != this_global:
            raise ValueError(f"mixed design or firmware revisions {label}")
        this_unit = (row["pcb_serial"], row["mcu_uid_hex"], row["storage_device_identity"], row["battery_serial_or_lot"], row["case_material"], row["lower_print_orientation"],
                     row["upper_print_orientation"], row["layer_height_mm"], row["wall_count"], row["support"])
        previous_unit = unit_identity.setdefault(row["unit_id"], this_unit)
        if previous_unit != this_unit:
            raise ValueError(f"mixed unit construction identity {label}")
        gate_counts[row["gate"]][computed] += 1
        if computed == "FAIL":
            failures.append({"gate": row["gate"], "unit_id": row["unit_id"], "condition": row["condition"], "metric": row["metric"], "value": value})

    for unit_id, measurements in ntc_resistance.items():
        if set(measurements) != {0, 10, 25, 35, 45}:
            raise ValueError(f"incomplete pack NTC temperature curve {unit_id}")
        ordered = [measurements[temperature] for temperature in (0, 10, 25, 35, 45)]
        if not all(left > right for left, right in zip(ordered, ordered[1:])):
            raise ValueError(f"pack NTC resistance is not strictly decreasing with temperature {unit_id}: {ordered}")
    required_switches = {
        "cold_temperature_down_sweep", "cold_temperature_up_sweep",
        "hot_temperature_up_sweep", "hot_temperature_down_sweep",
    }
    for unit_id, measurements in temperature_switch.items():
        if set(measurements) != required_switches:
            raise ValueError(f"incomplete bidirectional temperature switching evidence {unit_id}")
        if measurements["cold_temperature_down_sweep"] > measurements["cold_temperature_up_sweep"]:
            raise ValueError(f"cold charge recovery precedes cold charge stop {unit_id}")
        if measurements["hot_temperature_down_sweep"] > measurements["hot_temperature_up_sweep"]:
            raise ValueError(f"hot charge recovery follows hot charge stop {unit_id}")

    required_runtime = {
        "elapsed_recording_time", "average_battery_current", "integrated_battery_charge",
        "instantaneous_battery_current_max", "decoded_sample_count", "decoded_sample_rate",
        "decoded_channel_count", "recording_pause_duration", "scheduled_silence_recorded_duration",
        "file_sequence_gap_count", "duplicate_sample_count", "reset_count", "unfinished_file_count",
        "storage_reinitialization_count", "battery_replacement_count", "external_power_present_duration",
        "external_time_reference_full_duration_match",
        "assigned_cutoff_characterization_pack_match", "onboard_BQ25185_charge_only",
        "pre_run_charge_current", "charge_termination_observed",
        "USB_removed_before_temperature_conditioning", "target_temperature_stabilization",
        "battery_surface_temperature_within_target", "pre_run_OCV_recorded",
        "pack_cycle_count_recorded", "declared_per_unit_temperature_order_followed",
    }
    for (unit_id, condition), metrics in runtime_metrics.items():
        if set(metrics) != required_runtime:
            raise ValueError(f"incomplete 16h runtime metrics {unit_id}/{condition}")
        if len(runtime_intervals[(unit_id, condition)]) != 1:
            raise ValueError(f"16h runtime rows do not share one continuous interval {unit_id}/{condition}")
        elapsed = metrics["elapsed_recording_time"]
        decoded_seconds = metrics["decoded_sample_count"] / metrics["decoded_sample_rate"]
        if decoded_seconds + 1 < elapsed or decoded_seconds < 57600:
            raise ValueError(f"decoded audio duration is shorter than continuous run {unit_id}/{condition}")
        expected_charge = metrics["average_battery_current"] * elapsed / 3600
        tolerance = max(0.5, expected_charge * 0.02)
        if metrics["average_battery_current"] <= 0 or metrics["integrated_battery_charge"] <= 0 or metrics["instantaneous_battery_current_max"] <= 0:
            raise ValueError(f"zero or negative runtime-current evidence {unit_id}/{condition}")
        if abs(metrics["integrated_battery_charge"] - expected_charge) > tolerance:
            raise ValueError(f"average current and integrated charge disagree {unit_id}/{condition}")
        if metrics["instantaneous_battery_current_max"] < metrics["average_battery_current"]:
            raise ValueError(f"peak current is below average current {unit_id}/{condition}")
        if metrics["scheduled_silence_recorded_duration"] > decoded_seconds:
            raise ValueError(f"recorded silence exceeds decoded audio duration {unit_id}/{condition}")

    condition_by_temperature = {25: "16h_continuous_recording_25C", 10: "16h_endpoint_repeat_10C", 35: "16h_endpoint_repeat_35C"}
    for unit_id, order in plan["gates"][2]["temperature_run_order_by_unit"].items():
        starts = []
        for temperature in order:
            intervals = runtime_intervals[(unit_id, condition_by_temperature[temperature])]
            if len(intervals) != 1:
                raise ValueError(f"missing unique runtime interval for declared temperature order {unit_id}/{temperature}")
            starts.append(next(iter(intervals))[0])
        if not all(left < right for left, right in zip(starts, starts[1:])):
            raise ValueError(f"runtime temperature order differs from declared anti-confounding order {unit_id}")

    required_storage = {
        "cumulative_recording_time", "recording_session_count", "inter_session_charge_count",
        "battery_replacement_count", "external_power_present_during_recording",
        "storage_format_delete_or_cleanup_count", "completed_encrypted_file_count", "successfully_decrypted_file_count",
        "decoded_sample_count", "decoded_sample_rate", "decoded_channel_count", "file_sequence_gap_count",
        "duplicate_sample_count", "unfinished_file_count", "decryption_failure_count",
        "decoded_sample_count_match", "persistent_plaintext_audio_count", "completed_file_loss_count",
    }
    if set(storage_metrics) != required_storage:
        raise ValueError("36h cumulative encrypted-storage evidence is incomplete")
    expected_sessions = {f"36h_recording_session_{index}" for index in range(1, 4)}
    if set(storage_sessions) != expected_sessions or len(storage_session_runs) != 3:
        raise ValueError("three independent battery-only storage recording sessions are incomplete")
    if abs(sum(storage_sessions.values()) - storage_metrics["cumulative_recording_time"]) > 5:
        raise ValueError("storage session durations do not equal cumulative 36h recording time")
    if storage_metrics["completed_encrypted_file_count"] != storage_metrics["successfully_decrypted_file_count"]:
        raise ValueError("not every completed encrypted file was successfully decrypted")
    expected_files = math.ceil(storage_metrics["cumulative_recording_time"] / 5)
    if storage_metrics["completed_encrypted_file_count"] < expected_files:
        raise ValueError("encrypted file count cannot cover the measured 36h interval")
    decoded_seconds = storage_metrics["decoded_sample_count"] / storage_metrics["decoded_sample_rate"]
    if decoded_seconds + 1 < storage_metrics["cumulative_recording_time"] or decoded_seconds < 129600:
        raise ValueError("decoded encrypted audio is shorter than the cumulative 36h storage recording")
    if len(os_run_ids) != 3:
        raise ValueError("macOS, Windows and Linux independent runs are incomplete")
    if len(cable_profiles) != 6:
        raise ValueError("six distinct USB cable profiles are required")
    if sorted(profile[0] for profile in cable_profiles.values()) != ["A-to-C"] * 3 + ["C-to-C"] * 3:
        raise ValueError("USB cable set must contain three A-to-C and three C-to-C cables")
    expected_cable_ids = set(cable_profiles)
    if any(cables != expected_cable_ids for cables in unit_cables.values()):
        raise ValueError("the same six-cable fit set was not completed on every unit")
    if len(abnormal_runs) != 5 * 4 * 3 or len(abnormal_run_owners) != len(abnormal_runs):
        raise ValueError("independent abnormal-input voltage/slew runs are incomplete")
    if len(rail_fault_runs) != 5 * 4 or len(rail_fault_run_owners) != len(rail_fault_runs):
        raise ValueError("independent BAT/SYS/V3V3/SD_V3 rail-fault runs are incomplete")
    if len(tps_short_runs) != 5 or len(tps_short_run_owners) != len(tps_short_runs):
        raise ValueError("independent TPS2552 latch-off short runs are incomplete")

    status = "PASS_ALL_EVT_GATES" if not failures else "FAIL_ONE_OR_MORE_EVT_GATES"
    report = {
        "status": status,
        "release_evidence_complete": not failures,
        "plan_id": plan["plan_id"],
        "input": str(input_path),
        "input_sha256": sha(input_path),
        "canonical_template_sha256": sha(TEMPLATE),
        "canonical_pcb_sha256": expected_pcb_sha,
        "canonical_bom_sha256": expected_bom_sha,
        "canonical_case_revision": expected_case_revision,
        "programming_manifest": str(programming_manifest_path),
        "programming_manifest_sha256": sha(programming_manifest_path),
        "factory_programming_record": str(programming_record_path),
        "factory_programming_record_sha256": sha(programming_record_path),
        "firmware_image": str(firmware_path),
        "firmware_sha256": programming["firmware_sha256"],
        "usb_vid": vid,
        "usb_pid": pid,
        "battery_cutoff_mv": programming["battery_cutoff_mv"],
        "rows": len(actual),
        "gate_counts": gate_counts,
        "failures": failures,
        "limitations": [
            "This validates evidence completeness, hashes and numeric limits; it cannot prove instrument correctness or operator truthfulness.",
            "A PASS report is necessary but not sufficient for manufacturing release; external DFM, procurement and programming gates remain separate.",
        ],
    }
    output_path.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
    return report

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--programming-manifest", type=Path, required=True)
    parser.add_argument("--programming-record", type=Path, required=True)
    args = parser.parse_args()
    try:
        result = evaluate(args.input.resolve(), args.output.resolve(), args.programming_manifest.resolve(), args.programming_record.resolve())
    except (ValueError, OSError, KeyError) as exc:
        parser.exit(1, f"HOLD_INVALID_OR_INCOMPLETE_EVT_EVIDENCE: {exc}\n")
    print(json.dumps({"status": result["status"], "rows": result["rows"], "failures": len(result["failures"])}))

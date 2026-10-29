#!/usr/bin/env python3
"""Self-test the EVT evaluator with synthetic local evidence only."""
from pathlib import Path
import csv
import hashlib
import importlib.util
import tempfile

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("evt", HERE / "evaluate_xe_evt1_results.py")
evt = importlib.util.module_from_spec(spec); spec.loader.exec_module(evt)

with tempfile.TemporaryDirectory() as directory:
    work = Path(directory)
    firmware = work / "firmware.bin"; firmware.write_bytes(b"synthetic firmware self-test only")
    elf = work / "firmware.elf"; elf.write_bytes(b"synthetic ELF self-test only")
    map_file = work / "firmware.map"; map_file.write_text("synthetic MAP self-test only\n")
    allocation = work / "usb-allocation.txt"; allocation.write_text("synthetic allocation evidence self-test only\n")
    cutoff_spec=importlib.util.spec_from_file_location("cutoff",HERE/"evaluate_xe_battery_cutoff_results.py")
    cutoff_module=importlib.util.module_from_spec(cutoff_spec);cutoff_spec.loader.exec_module(cutoff_module)
    cutoff_csv=work/"cutoff.csv"; cutoff_fields=next(csv.reader((HERE/"xe-battery-cutoff-results.template.csv").open())); cutoff_rows=[]
    for i in range(1,6):
        pack_raw=work/f"cutoff-pack-{i}.csv";pack_raw.write_text(f"synthetic cutoff pack {i}\n")
        cutoff_row={k:"" for k in cutoff_fields};cutoff_row.update(pack_id=f"P{i}",evaluated_cutoff_mv="3400",minimum_stable_terminal_mv="3300",adc_error_margin_mv="20",rail_transient_margin_mv="20",repeatability_margin_mv="10",usable_capacity_to_cutoff_mAh="75",load_average_mA="4.4",load_peak_mA="110",peak_duration_ms="200",peak_repetition_s="5",continuous_discharge="1",storage_finalize_success="1",protection_trip_occurred="0",standby_entry_success="1",standby_current_uA="120",vbus_wakeup_reset_success="1",wake_to_charge_ms="500",post_wake_charge_current_mA="10",temperature_C="25",instrument_model_serial="SELFTEST",calibration_due_date="2099-01-01",start_utc="2026-01-01T00:00:00Z",end_utc="2026-01-01T20:00:00Z",raw_data_path=pack_raw.name,raw_data_sha256=evt.sha(pack_raw),result_PASS_FAIL_NOT_RUN="PASS");cutoff_rows.append(cutoff_row)
    with cutoff_csv.open("w",newline="") as stream:writer=csv.DictWriter(stream,fieldnames=cutoff_fields);writer.writeheader();writer.writerows(cutoff_rows)
    cutoff = work / "cutoff.json"; cutoff.write_text(__import__('json').dumps(cutoff_module.evaluate(cutoff_csv,3400),indent=2)+"\n")
    source_lock = __import__('json').loads(evt.SOURCE_LOCK.read_text())
    programming = work / "programming-manifest.json"
    programming.write_text(__import__('json').dumps({
        "status":"EVT_IMAGE_COMPLETE_WITH_ALLOCATED_USB_IDS", "target_mpn":"STM32U585CIU6",
        "hardware_revision":evt.HARDWARE_REVISION, "source_tree_sha256":source_lock["source_tree_sha256"],
        "private_key_included":False, "buyer_public_key_included":False, "common_firmware_per_buyer":True, "usb_vid":0xCAFE, "usb_pid":0xBABE,
        "usb_hardware_profile":"fixed-100", "usb_descriptor_max_power_mA":100,
        "charging_enabled_for_physical_evt":True, "charging_release_status":"UNQUALIFIED_UNTIL_PHYSICAL_EVT_PASSES",
        "firmware_image":firmware.name, "firmware_sha256":evt.sha(firmware), "elf":elf.name,
        "elf_sha256":evt.sha(elf), "map":map_file.name, "map_sha256":evt.sha(map_file),
        "usb_id_allocation_evidence":allocation.name, "usb_id_allocation_evidence_sha256":evt.sha(allocation)
        ,"battery_cutoff_mv":3400, "battery_cutoff_evidence":cutoff.name, "battery_cutoff_evidence_sha256":evt.sha(cutoff),
        "option_bytes":{"BOR":"LEVEL_4"}, "orders_payments_uploads_vendor_contacts_performed":False
    })+"\n")
    source = list(csv.DictReader(evt.TEMPLATE.open()))
    fields = list(source[0])
    for row in source:
        lower, upper = row["lower_limit"], row["upper_limit"]
        row["value"] = lower or upper or "0"
        if row["gate"] == "C" and row["metric"] == "average_battery_current": row["value"] = "4"
        if row["gate"] == "C" and row["metric"] == "integrated_battery_charge": row["value"] = "64"
        if row["gate"] == "C" and row["metric"] == "instantaneous_battery_current_max": row["value"] = "100"
        if row["gate"] == "D" and row["condition"].startswith("36h_recording_session_"):
            row["value"] = "43200"
        if row["metric"] == "pack_NTC_resistance":
            temperature = int(row["condition"].split("_")[2][:-1])
            row["value"] = str({0: 30000, 10: 20000, 25: 10000, 35: 6500, 45: 4500}[temperature])
        row["run_id"] = f"{row['gate']}-{row['unit_id']}"
        if row["condition"].startswith("current_limited_battery_simulator_"):
            row["run_id"] += "-" + row["condition"]
        if row["condition"] == "TPS2552_output_short_latch_and_USB_power_cycle_recovery":
            row["run_id"] += "-TPS2552-short"
        if row["condition"].startswith("NCP360_abnormal_input_"):
            row["run_id"] += "-" + row["condition"]
        if row["gate"] == "D" and row["condition"].startswith("36h_recording_session_"):
            row["run_id"] += "-" + row["condition"]
        os_names={"macOS_C_to_C":"macOS","Windows_C_to_C":"Windows","Linux_C_to_C":"Linux"}
        if row["condition"] in os_names:
            row["run_id"] += "-" + os_names[row["condition"]]
            row["host_os_name"] = os_names[row["condition"]]; row["host_os_version"] = "SELFTEST"
            row["host_importer_sha256"] = evt.sha(evt.HOST_IMPORTER)
            row["age_tool_version"] = "SELFTEST"; row["ffmpeg_version"] = "SELFTEST"
        if row["gate"] == "E" and row["condition"].startswith("USB_cable_"):
            cable_number = int(row["condition"].rsplit("_", 1)[1])
            row["usb_cable_id"] = f"CABLE-{cable_number}"
            row["usb_cable_type"] = "C-to-C" if cable_number <= 3 else "A-to-C"
            row["usb_overmold_width_mm"] = str(9 + cable_number)
            row["usb_overmold_height_mm"] = str(5 + cable_number / 10)
        row["result_PASS_FAIL_NOT_RUN"] = "PASS"
        raw = work / f"raw-{row['run_id']}.txt"
        if not raw.exists(): raw.write_text(f"synthetic evidence for {row['run_id']} only\n")
        row["raw_data_path"] = raw.name; row["raw_data_sha256"] = hashlib.sha256(raw.read_bytes()).hexdigest()
        row["pcb_sha256"] = evt.sha(evt.PCB); row["firmware_sha256"] = evt.sha(firmware)
        row["bom_revision"] = evt.sha(evt.BOM); row["case_revision"] = __import__('json').loads(evt.CASE_REVIEW.read_text())["version"]; row["case_material"] = evt.CASE_MATERIAL
        unit_number = int(row["unit_id"][1:]); row["pcb_serial"] = f"XE-EVT1-U{unit_number}"; row["mcu_uid_hex"] = f"{unit_number:024x}"
        row["storage_device_identity"] = f"U11-CSNP32GCR01-BOW-LOT-SELFTEST-{unit_number}"
        row["lower_print_orientation"] = evt.LOWER_PRINT_ORIENTATION; row["upper_print_orientation"] = evt.UPPER_PRINT_ORIENTATION
        row["layer_height_mm"] = str(evt.LAYER_HEIGHT_MM); row["wall_count"] = str(evt.WALL_COUNT); row["support"] = evt.SUPPORT
        row["battery_serial_or_lot"] = f"P{unit_number}"; row["cord_material"] = "TEST"
        row["cord_diameter_mm"] = str({1:2.0, 2:2.0, 3:3.0, 4:3.0, 5:2.5}[unit_number]); row["cord_lot"] = "TEST"
        row["cord_mpn"] = "SELFTEST-BREAKAWAY-CORD"
        row["cord_breakaway_claim_reference"] = "SELFTEST-ONLY"
        row["cord_breakaway_claim_sha256"] = "a" * 64
        row["cord_risk_assessment_id"] = "SELFTEST-RISK"
        row["approved_breakaway_min_N"] = "1"
        row["approved_breakaway_max_N"] = "2"
        row["instrument_model_serial"] = "SYNTHETIC"; row["calibration_due_date"] = "2099-01-01"
        row["ambient_C"] = ({"16h_endpoint_repeat_10C":"10", "16h_endpoint_repeat_35C":"35"}.get(row["condition"], "25")); row["humidity_percent"] = "50"
        temperature_by_condition = {
            "16h_continuous_recording_25C": 25,
            "16h_endpoint_repeat_10C": 10,
            "16h_endpoint_repeat_35C": 35,
        }
        start_offset_days = 0
        if row["gate"] == "C":
            order = __import__('json').loads(evt.PLAN.read_text())["gates"][2]["temperature_run_order_by_unit"][row["unit_id"]]
            start_offset_days = order.index(temperature_by_condition[row["condition"]]) * 2
        import datetime as dt
        row["start_utc"] = (dt.datetime(2026,10,28,tzinfo=dt.timezone.utc)+dt.timedelta(days=start_offset_days)).isoformat().replace("+00:00","Z")
        elapsed = (57600 if row["gate"] == "C" else
                   float(row["value"]) if row["metric"] == "elapsed_recording_time" else 1)
        row["end_utc"] = (dt.datetime.fromisoformat(row["start_utc"].replace("Z", "+00:00"))+dt.timedelta(seconds=elapsed)).isoformat().replace("+00:00","Z")
        row["operator"] = "SELFTEST"
    completed = work / "completed.csv"
    with completed.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    programming_record = work / "programming-record.csv"
    programming_fields = next(csv.reader((evt.ROOT / "hardware/xe-minimal/factory-programming/five-unit-programming-record.template.csv").open()))
    programming_rows = []
    manifest = __import__('json').loads(programming.read_text())
    for unit_number in range(1, 6):
        log = work / f"program-U{unit_number}.log"; log.write_text(f"program U{unit_number}\n")
        row = {field:"" for field in programming_fields}; row.update({
            "unit_id":f"U{unit_number}", "pcb_serial":f"XE-EVT1-U{unit_number}", "mcu_uid_hex":f"{unit_number:024x}",
            "hardware_revision":evt.HARDWARE_REVISION, "firmware_sha256":manifest["firmware_sha256"],
            "elf_sha256":manifest["elf_sha256"], "map_sha256":manifest["map_sha256"], "usb_vid":hex(manifest["usb_vid"]),
            "usb_pid":hex(manifest["usb_pid"]), "battery_cutoff_mv":"3400", "programmer_model_serial":"SELFTEST",
            "fixture_id":"SELFTEST", "program_start_utc":"2026-10-27T00:00:00Z", "program_end_utc":"2026-10-27T00:01:00Z",
            "pogo_contact_attempts":"10", "pogo_contact_successes":"10", "vtref_mV":"3300", "current_limit_trip":"0",
            "flash_verify":"PASS", "BOR4_readback":"PASS", "formal_usb_enumeration":"PASS",
            "charge_request_low_while_reset_asserted":"PASS", "storage_rail_default_off":"PASS",
            "program_power_loss_injection_count":"1", "power_loss_recovery":"PASS", "raw_log_path":log.name,
            "raw_log_sha256":evt.sha(log), "result_PASS_FAIL_NOT_RUN":"PASS"})
        programming_rows.append(row)
    with programming_record.open("w", newline="") as stream:
        writer=csv.DictWriter(stream,fieldnames=programming_fields); writer.writeheader(); writer.writerows(programming_rows)
    report = evt.evaluate(completed, work / "report.json", programming, programming_record)
    assert report["status"] == "PASS_ALL_EVT_GATES" and report["rows"] == len(source)
    saved_programmed_serial = programming_rows[0]["pcb_serial"]
    programming_rows[0]["pcb_serial"] = "DIFFERENT-PROGRAMMED-BOARD"
    with programming_record.open("w", newline="") as stream:
        writer=csv.DictWriter(stream,fieldnames=programming_fields); writer.writeheader(); writer.writerows(programming_rows)
    try: evt.evaluate(completed, work / "different-programmed-unit-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("EVT evidence from a different board than the programming record was accepted")
    programming_rows[0]["pcb_serial"] = saved_programmed_serial
    with programming_record.open("w", newline="") as stream:
        writer=csv.DictWriter(stream,fieldnames=programming_fields); writer.writeheader(); writer.writerows(programming_rows)
    invalid = work / "invalid.csv"
    mac_row=next(row for row in source if row["condition"]=="macOS_C_to_C")
    saved_importer=mac_row["host_importer_sha256"];mac_row["host_importer_sha256"]="0"*64
    with invalid.open("w",newline="") as stream:
        writer=csv.DictWriter(stream,fieldnames=fields);writer.writeheader();writer.writerows(source)
    try:evt.evaluate(invalid,work/"wrong-host-importer-report.json",programming,programming_record)
    except ValueError:pass
    else:raise AssertionError("wrong host importer was accepted")
    mac_row["host_importer_sha256"]=saved_importer
    linux_row=next(row for row in source if row["condition"]=="Linux_C_to_C")
    saved_linux_run=linux_row["run_id"];linux_row["run_id"]=mac_row["run_id"]
    with invalid.open("w",newline="") as stream:
        writer=csv.DictWriter(stream,fieldnames=fields);writer.writeheader();writer.writerows(source)
    try:evt.evaluate(invalid,work/"shared-os-run-report.json",programming,programming_record)
    except ValueError:pass
    else:raise AssertionError("shared three-OS run identity was accepted")
    linux_row["run_id"]=saved_linux_run
    abnormal_conditions=sorted({row["condition"] for row in source if row["condition"].startswith("NCP360_abnormal_input_")})
    first_abnormal_run=next(row["run_id"] for row in source if row["unit_id"]=="U1" and row["condition"]==abnormal_conditions[0])
    second_abnormal_rows=[row for row in source if row["unit_id"]=="U1" and row["condition"]==abnormal_conditions[1]]
    saved_abnormal_runs=[row["run_id"] for row in second_abnormal_rows]
    for row in second_abnormal_rows:row["run_id"]=first_abnormal_run
    with invalid.open("w",newline="") as stream:
        writer=csv.DictWriter(stream,fieldnames=fields);writer.writeheader();writer.writerows(source)
    try:evt.evaluate(invalid,work/"shared-abnormal-input-run-report.json",programming,programming_record)
    except ValueError:pass
    else:raise AssertionError("one abnormal-input run reused across voltage/slew conditions was accepted")
    for row,run_id in zip(second_abnormal_rows,saved_abnormal_runs):row["run_id"]=run_id
    # Values that each satisfy their own row limits must still be rejected when
    # they cannot describe one coherent battery-only continuous run.
    average = next(row for row in source if row["gate"] == "C" and row["unit_id"] == "U1" and row["metric"] == "average_battery_current")
    average["value"] = "1"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "incoherent-charge-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("incoherent average current and integrated charge were accepted")
    average["value"] = "4"
    charge = next(row for row in source if row["gate"] == "C" and row["unit_id"] == "U1" and row["metric"] == "integrated_battery_charge")
    saved_average, saved_charge = average["value"], charge["value"]
    average["value"] = "0"; charge["value"] = "0"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "zero-current-instrument-failure-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("zero-current runtime evidence was accepted")
    average["value"], charge["value"] = saved_average, saved_charge
    runtime_row = next(row for row in source if row["gate"] == "C" and row["unit_id"] == "U1" and row["metric"] == "decoded_sample_rate")
    saved_runtime_end = runtime_row["end_utc"]; runtime_row["end_utc"] = "2026-10-28T00:00:01Z"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "split-runtime-interval-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("split 16h runtime evidence intervals were accepted")
    runtime_row["end_utc"] = saved_runtime_end
    decrypted_count = next(row for row in source if row["gate"] == "D" and row["condition"] == "36h_encrypted_storage" and row["metric"] == "successfully_decrypted_file_count")
    saved_decrypted_count = decrypted_count["value"]; decrypted_count["value"] = "25921"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "mismatched-encrypted-file-count-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("mismatched encrypted and decrypted file counts were accepted")
    decrypted_count["value"] = saved_decrypted_count
    storage_session = next(row for row in source if row["condition"] == "36h_recording_session_1")
    saved_session_duration = storage_session["value"]; storage_session["value"] = "43190"
    storage_session["end_utc"] = "2026-10-28T11:59:50Z"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "mismatched-cumulative-storage-duration-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("storage session durations inconsistent with cumulative duration were accepted")
    storage_session["value"] = saved_session_duration; storage_session["end_utc"] = "2026-10-28T12:00:00Z"
    second_run = next(row for row in source if row["run_id"] != source[0]["run_id"])
    saved_raw = (second_run["raw_data_path"], second_run["raw_data_sha256"])
    copied_raw = work / "different-name-same-content.txt"
    copied_raw.write_bytes((work / source[0]["raw_data_path"]).read_bytes())
    second_run["raw_data_path"] = copied_raw.name; second_run["raw_data_sha256"] = source[0]["raw_data_sha256"]
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "reused-raw-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("raw evidence reused across distinct runs was accepted")
    second_run["raw_data_path"], second_run["raw_data_sha256"] = saved_raw
    u2 = next(row for row in source if row["unit_id"] == "U2")
    saved_battery = u2["battery_serial_or_lot"]; u2["battery_serial_or_lot"] = source[0]["battery_serial_or_lot"]
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "duplicate-battery-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("one battery serial reused across units was accepted")
    u2["battery_serial_or_lot"] = saved_battery
    saved_storage = u2["storage_device_identity"]; u2["storage_device_identity"] = "DIFFERENT-U11-LOT"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "changed-storage-device-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("storage device changed within one EVT unit was accepted")
    u2["storage_device_identity"] = saved_storage
    saved_due = source[0]["calibration_due_date"]; source[0]["calibration_due_date"] = "2020-01-01"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "expired-calibration-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("expired instrument calibration was accepted")
    source[0]["calibration_due_date"] = saved_due
    source[0]["deviation_and_failure_notes"] = "unresolved deviation"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "deviation-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("undispositioned deviation was accepted")
    source[0]["deviation_and_failure_notes"] = ""
    manifest_data = __import__('json').loads(programming.read_text())
    manifest_data["usb_hardware_profile"] = "switched"
    programming.write_text(__import__('json').dumps(manifest_data)+"\n")
    try: evt.evaluate(completed, work / "wrong-usb-profile-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("non-canonical switched USB profile was accepted")
    manifest_data["usb_hardware_profile"] = "fixed-100"
    programming.write_text(__import__('json').dumps(manifest_data)+"\n")
    bounded = next(row for row in source if row["upper_limit"])
    bounded["value"] = str(float(bounded["upper_limit"]) + 1); bounded["result_PASS_FAIL_NOT_RUN"] = "PASS"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "invalid-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("mismatched declared PASS was accepted")
    # Restore the bounded row, then prove time and revision inconsistencies fail closed.
    bounded["value"] = bounded["lower_limit"] or bounded["upper_limit"]
    bounded["result_PASS_FAIL_NOT_RUN"] = "PASS"
    elapsed_row = next(row for row in source if row["metric"] == "elapsed_recording_time")
    saved_end = elapsed_row["end_utc"]; elapsed_row["end_utc"] = "2026-10-28T00:00:01Z"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "invalid-time-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("impossible elapsed time was accepted")
    elapsed_row["end_utc"] = saved_end
    source[-1]["firmware_sha256"] = "3" * 64
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "invalid-revision-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("mixed firmware revisions were accepted")
    source[-1]["firmware_sha256"] = evt.sha(firmware)
    f_row = next(row for row in source if row["gate"] == "F")
    f_row["cord_diameter_mm"] = "1.5"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "invalid-cord-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("undersized cord was accepted")
    f_row["cord_diameter_mm"] = "2"
    u3_f_rows = [row for row in source if row["gate"] == "F" and row["unit_id"] == "U3"]
    saved_u3_cords = [row["cord_diameter_mm"] for row in u3_f_rows]
    for row in u3_f_rows: row["cord_diameter_mm"] = "2.5"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "missing-cord-endpoint-assignment-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("wrong per-unit cord endpoint assignment was accepted")
    for row, diameter in zip(u3_f_rows, saved_u3_cords): row["cord_diameter_mm"] = diameter
    source[0]["case_material"] = "generic PETG"
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "invalid-case-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("non-canonical case material was accepted")
    source[0]["case_material"] = evt.CASE_MATERIAL
    other_unit = next(row for row in source if row["unit_id"] == "U2")
    other_unit["mcu_uid_hex"] = source[0]["mcu_uid_hex"]
    with invalid.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fields); writer.writeheader(); writer.writerows(source)
    try: evt.evaluate(invalid, work / "invalid-uid-report.json", programming, programming_record)
    except ValueError: pass
    else: raise AssertionError("duplicate MCU UID across units was accepted")
print("PASS_EVT_EVALUATOR_SELF_TEST")

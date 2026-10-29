#!/usr/bin/env python3
"""Build a public-only EVT image only from allocated IDs and qualified cutoff evidence.

This creates local EVT artifacts; it never flashes, uploads, orders or claims that
physical qualification passed.
"""
from pathlib import Path
import argparse
import hashlib
import json
import shutil
import subprocess
import sys
import importlib.util

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
FIRMWARE = ROOT / "firmware/stm32"
HARDWARE_REVISION = json.loads((ROOT / "hardware/xe-minimal/prototype-architecture-v1.json").read_text())["version"]

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def evidence(path, status):
    path = Path(path).resolve()
    data = json.loads(path.read_text())
    if data.get("status") != status:
        raise ValueError(f"wrong evidence status: {path}")
    return path, data

def validate_inputs(usb_path, cutoff_path, vid, pid):
    usb_path, usb = evidence(usb_path, "ALLOCATED_USB_ID_EVIDENCE")
    cutoff_path, cutoff = evidence(cutoff_path, "BATTERY_CUTOFF_SELECTED_FROM_FIVE_PACK_PHYSICAL_CHARACTERIZATION")
    evaluator_path = ROOT / "docs/validation/evaluate_xe_battery_cutoff_results.py"
    spec = importlib.util.spec_from_file_location("cutoff_evaluator", evaluator_path)
    evaluator = importlib.util.module_from_spec(spec); spec.loader.exec_module(evaluator)
    cutoff = evaluator.validate_result(cutoff_path)
    if not isinstance(vid, int) or not isinstance(pid, int) or not 0 < vid < 65536 or not 0 < pid < 65536:
        raise ValueError("VID/PID out of range")
    if (vid, pid) in ((1, 2), (0x1234, 0x5678), (0x1209, 0x0001)):
        raise ValueError("fixture or example VID/PID forbidden")
    if usb.get("usb_vid") != vid or usb.get("usb_pid") != pid:
        raise ValueError("USB allocation evidence does not match requested VID/PID")
    for field in ("allocation_owner", "allocation_reference", "evidence_date", "evidence_source"):
        if not str(usb.get(field, "")).strip():
            raise ValueError(f"missing USB allocation field: {field}")
    cutoff_mv = cutoff.get("selected_cutoff_mv")
    if not isinstance(cutoff_mv, int) or not 3000 <= cutoff_mv <= 4200:
        raise ValueError("cutoff evidence outside supported range")
    if cutoff.get("battery_mpn") != "DTP401525-XE" or cutoff.get("capacity_mAh") != 110:
        raise ValueError("cutoff evidence is not for the fixed battery")
    if cutoff.get("tested_pack_ids") != [f"P{i}" for i in range(1, 6)]:
        raise ValueError("cutoff evidence must cover canonical P1-P5")
    minimum_safe = cutoff.get("minimum_safe_cutoff_mv")
    if not isinstance(minimum_safe, int) or not 3000 <= minimum_safe <= cutoff_mv:
        raise ValueError("selected cutoff is below the measured worst-pack safe minimum")
    if cutoff.get("minimum_usable_capacity_to_selected_cutoff_mAh", 0) < 70.4:
        raise ValueError("five-pack characterization does not preserve the 16-hour capacity allocation")
    if cutoff.get("load_average_mA", 0) < 4.4 or cutoff.get("load_peak_mA", 0) < 110:
        raise ValueError("cutoff characterization load is not conservative")
    raw_hash = str(cutoff.get("raw_evidence_manifest_sha256", ""))
    if cutoff.get("all_packs_passed") is not True or len(raw_hash) != 64 or any(c not in "0123456789abcdef" for c in raw_hash):
        raise ValueError("cutoff physical result or raw-evidence SHA-256 missing")
    return usb_path, usb, cutoff_path, cutoff

def build(args):
    usb_path, usb, cutoff_path, cutoff = validate_inputs(args.usb_allocation_evidence, args.cutoff_evidence, args.vid, args.pid)
    lock_path = HERE / "source-toolchain-lock.json"
    lock = json.loads(lock_path.read_text())
    regression = json.loads((FIRMWARE / "tests/prototype-v1-regression.json").read_text())
    if lock["source_files_sha256"] != regression["source_sha256"]:
        raise ValueError("source lock does not match current regression manifest")
    for relative, expected in lock["source_files_sha256"].items():
        if sha(ROOT / relative) != expected:
            raise ValueError(f"source changed after lock: {relative}")
    output = Path(args.output).resolve()
    output.mkdir(parents=False, exist_ok=False)
    config = output / "public-common-config"
    build_dir = output / "build"
    prepare = ROOT / "host/prepare_factory_config.py"
    subprocess.run([
        sys.executable, str(prepare), "--directory", str(config), "--vid", hex(args.vid), "--pid", hex(args.pid),
        "--cutoff-mv", str(cutoff["selected_cutoff_mv"]), "--usb-profile", "fixed-100", "--experimental-charging",
        "--indicator-profile", "button",
        "--firmware-version", args.firmware_version, "--source-revision", args.source_revision,
    ], check=True)
    subprocess.run(["sh", str(FIRMWARE / "app/build_configured.sh"), str(config), str(build_dir)], check=True)
    source_bin = build_dir / "application-UNQUALIFIED.bin"
    source_elf = build_dir / "candidate-NOT-FOR-FLASH.elf"
    source_map = build_dir / "candidate.map"
    evt_bin, evt_elf, evt_map = output / "xe-evt-image.bin", output / "xe-evt-image.elf", output / "xe-evt-image.map"
    shutil.copyfile(source_bin, evt_bin); shutil.copyfile(source_elf, evt_elf); shutil.copyfile(source_map, evt_map)
    binary = evt_bin.read_bytes()
    if b"AGE-SECRET-KEY-" in binary or b"age1" in binary:
        raise ValueError("buyer or private key marker found in common image")
    config_manifest = json.loads((config / "config-manifest.json").read_text())
    if config_manifest["profile"] != "FIRST_USE_HID_RECIPIENT" or config_manifest["private_key_included"] is not False or config_manifest["buyer_public_key_included"] is not False:
        raise ValueError("configuration is not public-only common firmware")
    if config_manifest["usb_hardware_profile"] != "fixed-100" or config_manifest["experimental_charging"] is not True:
        raise ValueError("EVT image does not match canonical fixed-100 hardware with charge qualification enabled")
    manifest = {
        "status": "EVT_IMAGE_COMPLETE_WITH_ALLOCATED_USB_IDS",
        "target_mpn": "STM32U585CIU6", "hardware_revision": HARDWARE_REVISION,
        "hardware_revision_source_sha256": sha(ROOT / "hardware/xe-minimal/prototype-architecture-v1.json"),
        "source_tree_sha256": lock["source_tree_sha256"], "common_firmware_per_buyer": True,
        "private_key_included": False, "buyer_public_key_included": False,
        "usb_vid": args.vid, "usb_pid": args.pid,
        "usb_hardware_profile": "fixed-100", "usb_descriptor_max_power_mA": 100,
        "charging_enabled_for_physical_evt": True,
        "charging_release_status": "UNQUALIFIED_UNTIL_PHYSICAL_EVT_PASSES",
        "usb_id_allocation_evidence": str(usb_path), "usb_id_allocation_evidence_sha256": sha(usb_path),
        "battery_cutoff_mv": cutoff["selected_cutoff_mv"], "battery_cutoff_evidence": str(cutoff_path), "battery_cutoff_evidence_sha256": sha(cutoff_path),
        "firmware_image": evt_bin.name, "firmware_sha256": sha(evt_bin),
        "elf": evt_elf.name, "elf_sha256": sha(evt_elf), "map": evt_map.name, "map_sha256": sha(evt_map),
        "option_bytes": {"BOR": "LEVEL_4"}, "physical_flash_and_EVT": "NOT_RUN",
        "orders_payments_uploads_vendor_contacts_performed": False,
    }
    (output / "evt-programming-manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n")
    print(json.dumps({"status": manifest["status"], "firmware_sha256": manifest["firmware_sha256"], "physical": "NOT_RUN"}))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--usb-allocation-evidence", required=True); parser.add_argument("--cutoff-evidence", required=True)
    parser.add_argument("--vid", required=True, type=lambda value: int(value, 0)); parser.add_argument("--pid", required=True, type=lambda value: int(value, 0))
    parser.add_argument("--firmware-version", required=True); parser.add_argument("--source-revision", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    try: build(args)
    except (ValueError, OSError, subprocess.CalledProcessError, KeyError) as exc: parser.exit(1, f"HOLD_EVT_IMAGE_INPUT_OR_BUILD_FAILURE: {exc}\n")

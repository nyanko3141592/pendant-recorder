#!/usr/bin/env python3
"""Build a current, fail-closed programming-readiness record; never emits firmware."""
from pathlib import Path
import hashlib
import json

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


active = json.loads((HERE.parent / "active-design.json").read_text())
architecture_path = HERE.parent / "prototype-architecture-v1.json"
hardware_revision = json.loads(architecture_path.read_text())["version"]
regression_path = ROOT / "firmware/stm32/tests/prototype-v1-regression.json"
regression = json.loads(regression_path.read_text())
interface = HERE / "j3-swd-interface.svg"
template = HERE / "programming-manifest.template.json"
evt_template = HERE / "evt-programming-manifest.template.json"
lock_path = HERE / "source-toolchain-lock.json"
programming_record = HERE / "five-unit-programming-record.template.csv"
record_evaluator = HERE / "evaluate_five_unit_programming_record.py"
record_evaluator_test = HERE / "test_evaluate_five_unit_programming_record.py"

assert regression["status"] == "PASS_NON_HARDWARE_REGRESSION"
assert regression["shell_checks_passed"] == 39
assert active["pcb_outline_mm"] == [27.5, 27.5]
lock = json.loads(lock_path.read_text())
assert lock["status"] == "PREBUILD_SOURCE_AND_TOOLCHAIN_CONTENT_LOCKED_NOT_FLASHABLE"
assert lock["source_file_count"] == len(regression["source_sha256"])

source_paths = [
    HERE.parent / "active-design.json",
    architecture_path,
    regression_path,
    interface,
    template,
    evt_template,
    lock_path,
    HERE / "build_evt_image.py",
    programming_record,
    record_evaluator,
    record_evaluator_test,
]
record = {
    "status": "HOLD_FACTORY_PROGRAMMING_RELEASE_INPUTS_INCOMPLETE",
    "hardware_revision": hardware_revision,
    "target_mpn": "STM32U585CIU6",
    "interface": "J3 SWD 5-pad",
    "common_firmware_per_buyer": True,
    "buyer_flashing_required": False,
    "recipient_provisioning": "FIRST_USE_USB_HID_WRITE_ONCE_PUBLIC_KEY_ONLY",
    "private_key_in_factory_inputs": False,
    "buyer_public_key_in_factory_inputs": False,
    "nonhardware_regression": {
        "status": regression["status"],
        "checks": regression["shell_checks_passed"],
        "source_hashes": len(regression["source_sha256"]),
    },
    "completed_prebuild_inputs": {
        "source_tree_sha256": lock["source_tree_sha256"],
        "source_file_count": lock["source_file_count"],
        "toolchain_lock": str(lock_path.relative_to(ROOT)),
        "toolchain_lock_sha256": sha(lock_path),
        "evt_programming_manifest_template": str(evt_template.relative_to(ROOT)),
        "evt_programming_manifest_template_sha256": sha(evt_template),
        "five_unit_programming_record_template": str(programming_record.relative_to(ROOT)),
        "five_unit_programming_record_template_sha256": sha(programming_record),
        "five_unit_programming_record_evaluator": str(record_evaluator.relative_to(ROOT)),
        "five_unit_programming_record_evaluator_sha256": sha(record_evaluator),
        "five_unit_programming_record_evaluator_selftest": str(record_evaluator_test.relative_to(ROOT)),
        "five_unit_programming_record_evaluator_selftest_sha256": sha(record_evaluator_test),
    },
    "root_release_blockers": {
        "allocated_production_usb_identity": {
            "status": "MISSING_EXTERNAL_ALLOCATION_EVIDENCE",
            "resolves": ["production_usb_vid", "production_usb_pid"],
        },
        "five_pack_battery_cutoff_characterization": {
            "status": "NOT_RUN_PHYSICAL_EVIDENCE_REQUIRED",
            "resolves": ["battery_stop_threshold_mV", "battery_stop_threshold_five_pack_characterization_evidence"],
        },
        "standard_pcba_programming_workflow_acceptance": {
            "status": "NOT_VERIFIED_IN_AUTOMATIC_ORDER_FLOW",
            "resolves": ["factory_programming_acceptance"],
        },
    },
    "derived_outputs_after_root_inputs": {
        "flashable_image": "generated_by_build_evt_image.py_after_USB_identity_and_cutoff_evidence_pass",
        "flashable_image_sha256": "generated_with_flashable_image",
        "elf_sha256": "generated_with_flashable_image",
        "map_sha256": "generated_with_flashable_image",
    },
    "required_missing_inputs": {
        "production_usb_vid": None,
        "production_usb_pid": None,
        "battery_stop_threshold_mV": None,
        "battery_stop_threshold_five_pack_characterization_evidence": None,
        "flashable_image": None,
        "flashable_image_sha256": None,
        "elf_sha256": None,
        "map_sha256": None,
        "factory_programming_acceptance": None,
    },
    "required_physical_evidence": [
        "J3 pogo continuity and contact repeatability",
        "VTREF 3.0-3.6 V and no programmer current-limit trip",
        "flash verify",
        "BOR level 4 option-byte readback",
        "MCU UID capture and unique PCB serial binding",
        "formal VID/PID USB enumeration",
        "charge request LOW while reset is asserted; fixed-100mA preconfiguration grant after firmware start is allowed",
        "storage rail default off",
        "power-loss during programming recovery",
    ],
    "sources_sha256": {str(path.relative_to(ROOT)): sha(path) for path in source_paths},
    "orders_payments_uploads_vendor_contacts_performed": False,
}
(HERE / "programming-readiness.json").write_text(
    json.dumps(record, ensure_ascii=False, indent=2) + "\n"
)
print(json.dumps({
    "status": record["status"],
    "root_release_blockers": len(record["root_release_blockers"]),
    "null_fields_including_derived_outputs": len(record["required_missing_inputs"]),
    "physical_evidence": len(record["required_physical_evidence"]),
}))

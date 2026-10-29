"""Fail closed until a real, qualified product programming manifest exists."""

import json
import hashlib
from pathlib import Path


HERE = Path(__file__).resolve().parent
template = json.loads((HERE / "programming-manifest.template.json").read_text())
evt_template = json.loads((HERE / "evt-programming-manifest.template.json").read_text())
readiness = json.loads((HERE / "programming-readiness.json").read_text())
architecture = json.loads((HERE.parent / "prototype-architecture-v1.json").read_text())
assert template["status"] == "TEMPLATE_NOT_FLASHABLE"
assert evt_template["status"] == "TEMPLATE_INCOMPLETE_DO_NOT_FLASH"
assert evt_template["required_status_after_completion"] == "EVT_IMAGE_COMPLETE_WITH_ALLOCATED_USB_IDS"
assert evt_template["usb_vid"] is None and evt_template["firmware_sha256"] is None
assert evt_template["usb_hardware_profile"] == "fixed-100"
assert evt_template["usb_descriptor_max_power_mA"] == 100
assert evt_template["charging_enabled_for_physical_evt"] is True
assert evt_template["charging_release_status"] == "UNQUALIFIED_UNTIL_PHYSICAL_EVT_PASSES"
assert evt_template["battery_cutoff_mv"] is None and evt_template["battery_cutoff_evidence"] is None
assert template["firmware_hex_or_bin"] is None
assert template["hardware_revision"] is None
assert template["firmware_version"] is None
assert template["source_revision"] is None and template["source_commit"] is None
assert template["usb_vid"] is None and template["usb_pid"] is None
assert template["recipient_provisioning"] == "FIRST_USE_USB_HID_WRITE_ONCE_IMPLEMENTED_NONHARDWARE_TEST_ONLY"
assert "PRIVATE_DECRYPTION_KEY" in template["forbidden_inputs"]
assert "BUYER_PUBLIC_RECIPIENT" in template["forbidden_inputs"]
assert "PENDANT_JSON_REVISION_MATCH" in template["post_program_checks"]
assert not list(HERE.glob("*.hex")) and not list(HERE.glob("*.bin"))
assert readiness["status"] == "HOLD_FACTORY_PROGRAMMING_RELEASE_INPUTS_INCOMPLETE"
assert readiness["hardware_revision"] == architecture["version"]
assert readiness["target_mpn"] == "STM32U585CIU6"
assert readiness["common_firmware_per_buyer"] is True
assert readiness["buyer_flashing_required"] is False
assert readiness["private_key_in_factory_inputs"] is False
assert readiness["buyer_public_key_in_factory_inputs"] is False
assert readiness["completed_prebuild_inputs"]["source_file_count"] == 343
assert len(readiness["completed_prebuild_inputs"]["source_tree_sha256"]) == 64
assert set(readiness["root_release_blockers"]) == {
    "allocated_production_usb_identity",
    "five_pack_battery_cutoff_characterization",
    "standard_pcba_programming_workflow_acceptance",
}
assert readiness["root_release_blockers"]["allocated_production_usb_identity"]["resolves"] == ["production_usb_vid", "production_usb_pid"]
assert readiness["root_release_blockers"]["five_pack_battery_cutoff_characterization"]["resolves"] == ["battery_stop_threshold_mV", "battery_stop_threshold_five_pack_characterization_evidence"]
assert readiness["root_release_blockers"]["standard_pcba_programming_workflow_acceptance"]["resolves"] == ["factory_programming_acceptance"]
assert set(readiness["derived_outputs_after_root_inputs"]) == {
    "flashable_image", "flashable_image_sha256", "elf_sha256", "map_sha256",
}
assert all(value is None for value in readiness["required_missing_inputs"].values())
assert readiness["orders_payments_uploads_vendor_contacts_performed"] is False
ROOT = HERE.parents[2]
for relative, expected in readiness["sources_sha256"].items():
    path = ROOT / relative
    assert hashlib.sha256(path.read_bytes()).hexdigest() == expected, relative
print(json.dumps({"status": "HOLD_PRODUCT_PROGRAMMING_INPUTS_INCOMPLETE", "j3_interface": "DEFINED", "flashable_binary": False, "production_usb_ids": False, "battery_cutoff_physical_evidence": False, "first_use_hid_recipient_provisioning": False, "buyer_flashing_allowed": False}, ensure_ascii=False))

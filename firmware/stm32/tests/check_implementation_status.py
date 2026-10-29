"""Reject firmware status metadata that regresses to superseded integration claims."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
status = json.loads((ROOT / "implementation-status.json").read_text())
charge_review = json.loads((ROOT / "usb/charge-request-review.json").read_text())

assert status["target"] == "STM32U585CIU6 / xe-minimal production candidate"
assert status["flashable"] is False
assert status["handoff"]["hardware_hooks_implemented"] is True
assert status["charge_inhibit"]["startup_integrated"] is True
assert status["charge_inhibit"]["hardware_validated"] is False
assert status["hardware_rng_adapter"]["init_integrated"] is True
assert status["hardware_rng_adapter"]["age_call_integrated"] is True
assert status["sd_device_context"]["main_integrated"] is True
assert status["fatfs"]["diskio_integrated"] is True
assert status["fatfs"]["filesystem_tested"] == "Synthetic RAM FAT16 and FAT32"
assert status["fatfs_recording_hooks"]["main_integrated"] is True
capacity_gate = status["fatfs_recording_hooks"]["capacity_gate"]
assert "ceil64KiB/cluster" in capacity_gate["implemented"]
assert "Current5s encrypted segment estimate is41472bytes" in capacity_gate["implemented"]
assert "128KiB" not in capacity_gate["implemented"] and "Current10s" not in capacity_gate["implemented"]
assert status["fatfs_handoff"]["main_integrated"] is True
assert status["host_block_backend"]["usb_integrated"] is True
assert "composite read-only MSC plus vendor HID" in status["usb_stack"]["configuration"]
assert status["storage_mount_adapter"]["main_integrated"] is True
assert status["usb_stack"]["descriptors"]["production_vid_pid_allocated"] is False
assert status["age_adapter"]["real_device_tested"] is False
storage_power = status["storage_power_startup"]
assert "PB5->SD_EN->U10 TPS22917DBVT" in storage_power["hardware"]
assert "C27 4.7uF" in storage_power["hardware"]
assert "PB5 low" in storage_power["sequence"] and "PB5 high" in storage_power["sequence"]
assert "https://www.ti.com/lit/gpn/TPS22917" in storage_power["sources"]
storage_power_text = json.dumps(storage_power)
for superseded in ("PB0", "TPS22916", "22uF", "mini-rect-v12"):
    assert superseded not in storage_power_text
assert charge_review["policy"]["canonical_descriptor_ma"] == 100
assert charge_review["policy"]["canonical_independent_input_limit_guaranteed_min_ma"] == 50
assert charge_review["policy"]["canonical_independent_input_limit_guaranteed_max_ma"] == 100
assert charge_review["policy"]["canonical_input_limit_mode"] == "TPS2552DBVR-1_ACTIVE_LOW_LATCH_OFF"
assert charge_review["policy"]["canonical_default_charging_enabled"] is False
assert "canonical fixed-100mA hardware grant" in charge_review["conditions"][1]
assert "not mount/configuration ACK" in charge_review["policy"]["gate"]
assert charge_review["full_link"]["result"] == "HISTORICAL_LINK_PASS_SOURCE_MISMATCH"

print("PASS: firmware status matches integrated non-hardware candidate and retains physical/release holds")

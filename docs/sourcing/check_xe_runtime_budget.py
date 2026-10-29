"""Check that the canonical 16 h allocation matches release firmware and hardware."""

import json
import hashlib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
budget = json.loads((ROOT / "docs/sourcing/xe-integrated-16h-budget.json").read_text())
design = json.loads((ROOT / "hardware/xe-minimal/design.json").read_text())
config = (ROOT / "firmware/stm32/tests/u585_candidate_config.h").read_text()
storage = json.loads((ROOT / "firmware/stm32/tests/storage-36h-result.json").read_text())

allocation = budget["adopted_design_allocation"]
current = budget["current_allocation_mA"]
u3 = next(part for part in design["parts"] if part["ref"] == "U3")

assert allocation["whole_device_average_target_mA"] == 4.4
assert allocation["charge_for_16h_mAh"] == 70.4
assert current["indicator_during_ordinary_recording_duty"] == 0.0
assert current["indicator_during_ordinary_recording_mA"] == 0.0
assert "#define PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS 0U" in config
assert "R42=130k selects 4.1V nominal" in u3["note"]
assert "4.1V nominal on-board charging profile" in budget["battery"]["usable_capacity_definition"]
assert "8Gbit MKDV8GIL-AST" in budget["record_encrypt_store_path"]["capacity_conclusion"]
observation = budget["firmware_test_observation"]
assert observation["files"] == 10800 and observation["ciphertext_fixture_bytes_per_file"] == 82180
assert observation["physical_write_or_readback_performed"] is False
for relative, expected in observation["source_sha256"].items():
    assert hashlib.sha256((ROOT / relative).read_bytes()).hexdigest() == expected, relative
assert budget["record_encrypt_store_path"]["segment_seconds"] == 10
assert budget["record_encrypt_store_path"]["encrypted_30h_bytes"] == 876657600
assert current["storage_payload_only_lower_bound_under_published_CSNP32_maxima"] is None
assert current["storage_headroom_for_commands_metadata_busy_startup_amortization"] is None
assert "No 16h runtime has been measured." in budget["not_claimed"]
assert budget["status"] == "ALLOCATION_UNMEASURED_WITH_SEPARATE_CONDITIONAL_PROTOTYPE_ESTIMATE"
assert budget["stage1_gate"]["proceed"] == "CONDITIONAL_PROTOTYPE_DESIGN"
assert budget["stage1_gate"]["blocking_evidence"] is None

print("PASS_CANONICAL_RUNTIME_BUDGET_UNMEASURED")

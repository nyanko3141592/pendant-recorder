"""Fail when the XE canonical release metadata drifts from generated evidence."""

from __future__ import annotations

import hashlib
import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
HW = ROOT / "hardware/xe-minimal"
KICAD_PYTHON = "/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


active = json.loads((HW / "active-design.json").read_text())
drc = json.loads((HW / "current-drc.json").read_text())
erc = json.loads((HW / "current-erc.json").read_text())
via = json.loads((HW / "exact-via-pad-overlap-audit.json").read_text())
legacy_budget = json.loads((ROOT / "docs/procurement/xe-five-unit-budget-review.json").read_text())
order_readiness = json.loads((ROOT / "docs/prototype-v1-order-readiness-2026-10-28.json").read_text())
assembly_test = (ROOT / "docs/prototype-v1-assembly-and-test.md").read_text()
requirements = (ROOT / "docs/requirements.md").read_text()
architecture = json.loads((HW / "prototype-architecture-v1.json").read_text())
demand = json.loads((ROOT / "docs/procurement/prototype-v1-five-unit-installed-demand.json").read_text())
pad_counts = json.loads((ROOT / "docs/procurement/xe-current-assembly-pad-counts.json").read_text())
assembly_cost = json.loads((ROOT / "docs/procurement/xe-current-assembly-cost.json").read_text())

assert not drc["violations"]
assert not drc["schematic_parity"]
assert not drc["unconnected_items"]
assert not any(sheet["violations"] for sheet in erc["sheets"])
assert via["board_sha256"] == sha256(HW / active["board"])
assert via["hole_over_pad_vias"] == active["manufacturing_pad_via_flags"] == 4
assert legacy_budget["status"] == "SUPERSEDED_HISTORICAL_BUDGET_DO_NOT_USE_FOR_XE_PROTOTYPE_V1"
assert any("DTP401525-XE battery is not in the JLC assembly boundary" in blocker for blocker in order_readiness["current_blockers"])
assert any("36 MPN lines and 68 JLC-assembled references" in blocker for blocker in order_readiness["current_blockers"])
assert any(
    "1.1V" in blocker
    and "strictly below 6.5V" in blocker
    and "require redesign" in blocker
    for blocker in order_readiness["current_blockers"]
)
assert "電池も含めた調達ゼロ構成ではない" in assembly_test
assert "購入者公開鍵と秘密鍵は工場媒体へ置かない" in assembly_test
assert "vendor HID経由でwrite-once領域へ登録" in assembly_test
assert "現行の単一候補は27.5×27.5mm・6層基板、68 JLC実装リファレンス、pack内蔵NTC、case-pebble-v5" in requirements
assert "現行case v4は紐受けの疲労・摩耗・耐熱と積層方向を優先してBambu PETG Basic" in requirements
assert "50N proof、15N/10,000-cycle疲労" in requirements
assert architecture["version"] == "XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH"
assert architecture["hardware_version"] == "HW-V1.0"
assert architecture["manufacturing"]["pcb_mm"] == [27.5, 27.5]
assert architecture["manufacturing"]["jlc_positions"] == 68
assert architecture["manufacturing"]["pofv"] == 4
assert all(item["reference"] != "TH1" for item in architecture["architecture"])
for rel, expected_hash in architecture["source_sha256"].items():
    assert sha256(ROOT / rel) == expected_hash, rel
assert demand["pcb_assembly_positions_per_device"] == 68
assert demand["pcb_assembly_installed_five"] == 340
assert demand["seller_external_sensor_positions_per_device"] == 0
assert demand["buyer_board_component_sourcing"] is False
assert pad_counts["board_sha256"] == sha256(HW / active["board"])
assert len(pad_counts["rows"]) == 68
assert pad_counts["installed_demand_sha256"] == sha256(ROOT / "docs/procurement/prototype-v1-five-unit-installed-demand.json")
assert assembly_cost["status"] == "CURRENT_CAD_RATE_ARITHMETIC_NOT_JLC_QUOTE"
assert assembly_cost["board_sha256"] == pad_counts["board_sha256"]
assert assembly_cost["jlc_positions_per_unit"] == 68
assert assembly_cost["complete_assembly_USD"] is None
assert assembly_cost["complete_five_unit_landed_total"] is None
assert assembly_cost["programming_public_price_USD"]["engineering_fee_approx"] == 8
assert assembly_cost["programming_public_price_USD"]["operator_labor_per_hour_approx"] == 8
assert assembly_cost["programming_public_price_USD"]["exact_total"] is None
assert assembly_cost["programming_exact_workflow_acceptance"] is False

subprocess.run([sys.executable, str(HW / "check_production_bom_boundary.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(HW / "check_design_bom_parity.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([KICAD_PYTHON, str(HW / "check_via_in_pad_release_intent.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(HW / "check_current_cam_review.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/validation/check_current_evt_plan.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/validation/check_xe_carrier_manufacturing_qualification.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/validation/check_xe_battery_cutoff_characterization_plan.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/validation/test_evaluate_xe_battery_cutoff_results.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/validation/test_evaluate_xe_evt1_results.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/validation/check_xe_release_evidence_matrix.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/validation/check_xe_storage_36h_capacity.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(HW / "check_hardware_revision_alignment.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/check_current_authority_markers.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/sourcing/check_xe_runtime_budget.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/sourcing/check_xe_nonstorage_current_ledger.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/sourcing/check_xe_recording_current_coverage.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/sourcing/check_xe_power_fit.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/sourcing/check_xe_storage_energy.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/sourcing/check_xe_indicator_energy_sensitivity.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/sourcing/check_xe_cs32_energy.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/sourcing/check_xe_spi_energy.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/sourcing/check_xe_battery_contract.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/sourcing/check_xe_breakaway_cord_candidate.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/sourcing/check_xe_charge_voltage_safety.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/safety/check_xe_usb_overvoltage_gap_review.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/procurement/check_xe_storage_second_source.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/procurement/check_xe_tps2552_continuity.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/procurement/check_xe_five_unit_procurement_gap.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/procurement/check_xe_five_unit_estimate.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([KICAD_PYTHON, str(HW / "check_canonical_single_carrier.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(HW / "build_canonical_carrier_cam_review.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(HW / "build_canonical_carrier_bom_cpl_review.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/procurement/build_xe_panel_readiness.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/procurement/check_xe_panel_readiness.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/procurement/check_xe_jlc_programming_service_review.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run(["sh", str(ROOT / "firmware/stm32/tests/check_recipient_record.sh")], check=True, stdout=subprocess.DEVNULL)
subprocess.run(["sh", str(ROOT / "firmware/stm32/tests/check_recipient_hid.sh")], check=True, stdout=subprocess.DEVNULL)
subprocess.run(["sh", str(ROOT / "firmware/stm32/tests/check_recipient_provisioning.sh")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "firmware/stm32/tests/check_recipient_flash_layout.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run(["sh", str(ROOT / "firmware/stm32/tests/check_msc_storage.sh")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "firmware/stm32/tests/check_implementation_status.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "firmware/stm32/tests/check_prototype_regression_fresh.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "mechanical/xe-minimal/prototype-v1/check_case_pebble_v4.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([KICAD_PYTHON, str(HW / "factory-programming/check_j3_swd_interface.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([KICAD_PYTHON, str(HW / "factory-programming/build_vendor_programming_instruction.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(HW / "factory-programming/check_vendor_programming_instruction.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(HW / "factory-programming/check_programming_release_inputs.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(HW / "factory-programming/test_build_evt_image_inputs.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(HW / "factory-programming/check_five_unit_programming_record_template.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(HW / "factory-programming/test_evaluate_five_unit_programming_record.py")], check=True, stdout=subprocess.DEVNULL)

# Several checks above deterministically refresh carrier/programming review files.
# Rebuild the fail-closed decision only after every evidence producer has run so
# its evidence hashes remain valid when this command returns.
subprocess.run([sys.executable, str(ROOT / "docs/build_prototype_v1_order_decision.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/check_prototype_v1_order_decision.py")], check=True, stdout=subprocess.DEVNULL)

# The programming-instruction producer above changes a source embedded in the
# local review package.  Build and verify that package last so a successful
# consistency run cannot leave its manifest stale.
subprocess.run([sys.executable, str(ROOT / "docs/procurement/build_xe_canonical_local_review_package.py")], check=True, stdout=subprocess.DEVNULL)
subprocess.run([sys.executable, str(ROOT / "docs/procurement/check_xe_canonical_local_review_package.py")], check=True, stdout=subprocess.DEVNULL)

expected = {
    "pendant-xe-minimal.kicad_pcb": HW / "pendant-xe-minimal.kicad_pcb",
    "pendant-xe-minimal.kicad_sch": HW / "pendant-xe-minimal.kicad_sch",
    "pendant-xe-minimal.kicad_pro": HW / "pendant-xe-minimal.kicad_pro",
    "current-drc.json": HW / "current-drc.json",
    "current-erc.json": HW / "current-erc.json",
    "exact-via-pad-overlap-audit.json": HW / "exact-via-pad-overlap-audit.json",
    "../../firmware/stm32/tests/prototype-v1-regression.json": ROOT
    / "firmware/stm32/tests/prototype-v1-regression.json",
}
for key, path in expected.items():
    assert active["sha256"][key] == sha256(path), (key, active["sha256"][key], sha256(path))

for key, expected_hash in active["sha256"].items():
    path = (HW / key).resolve()
    assert path.exists(), key
    assert expected_hash == sha256(path), (key, expected_hash, sha256(path))

print(
    json.dumps(
        {
            "status": "PASS_CANONICAL_BOARD_VENDOR_BOUNDARY_EXTERNAL_BATTERY_DECLARED_AND_POFV_CONSISTENCY",
            "erc_violations": 0,
            "drc_violations": 0,
            "schematic_parity_violations": 0,
            "unconnected_items": 0,
            "hole_over_pad_vias": via["hole_over_pad_vias"],
            "jlc_assembled_references": 68,
            "five_device_jlc_installed_positions": 340,
            "standard_pcba_carrier": "CANONICAL_CAD_DRC_EQUIVALENCE_AND_CAM_PASS_PHYSICAL_AND_EXTERNAL_HOLD",
            "buyer_final_assembly": ["BAT1", "CASE", "CORD"],
            "buyer_fixed_battery_sourcing_required": True,
            "buyer_board_component_sourcing": False,
            "physical_evt_gates": "A_TO_F_COMPLETE_SPECIFICATION_NOT_RUN",
            "factory_programming": "INTERFACE_READY_PRODUCT_INPUTS_HOLD",
            "charge_voltage": "4P1V_AND_10MA_TPS2552_50_TO_100MA_LATCH_WITH_LOCAL_CIN_COUT_INTEGRATED_PHYSICAL_PENDING",
            "recording_export": "MSC_READ_ONLY_TESTED",
            "verified_cleanup": "HID_RANGE_QUEUE_AND_DEVICE_OWNERSHIP_DELETE_NONHARDWARE_TESTED",
            "recipient_provisioning": "COMMON_IMAGE_HID_WRITE_ONCE_FLASH_PATH_NONHARDWARE_TESTED_PHYSICAL_PENDING",
        },
        ensure_ascii=False,
    )
)

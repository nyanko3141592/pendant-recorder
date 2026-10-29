"""Generate the current fail-closed prototype-v1 decision. Never uploads or orders."""
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[1]
active = json.loads((ROOT / "hardware/xe-minimal/active-design.json").read_text())
review_dir = ROOT / "hardware/xe-minimal" / active["manufacturing_review_directory"]
manifest = json.loads((review_dir / "prototype-v1-manifest.json").read_text())
case = json.loads((ROOT / "mechanical/xe-minimal/prototype-v1/case-pebble-v5-review.json").read_text())
slice_review = json.loads((ROOT / "mechanical/xe-minimal/prototype-v1/pebble-v5-slice-review/review.json").read_text())
regression = json.loads((ROOT / "firmware/stm32/tests/prototype-v1-regression.json").read_text())
evt = json.loads((ROOT / "docs/validation/xe-current-five-unit-evt-plan.json").read_text())
panel = json.loads((ROOT / "docs/procurement/xe-panel-readiness.json").read_text())
carrier_qualification = json.loads((ROOT / "docs/validation/xe-carrier-manufacturing-qualification.json").read_text())
cutoff_characterization = json.loads((ROOT / "docs/validation/xe-battery-cutoff-characterization-plan.json").read_text())
programming_service = json.loads((ROOT / "docs/procurement/xe-jlc-programming-service-review-2026-10-28.json").read_text())
usb_ovp = json.loads((ROOT / "docs/safety/xe-usb-overvoltage-gap-review.json").read_text())
architecture = json.loads((ROOT / "hardware/xe-minimal/prototype-architecture-v1.json").read_text())

files = [
    "hardware/xe-minimal/prototype-architecture-v1.json",
    "hardware/xe-minimal/active-design.json",
    f"hardware/xe-minimal/{active['manufacturing_review_directory']}/prototype-v1-manifest.json",
    "docs/procurement/xe-production-bom-2026-10-28.csv",
    "docs/procurement/xe-production-readiness-2026-10-28.md",
    "mechanical/xe-minimal/prototype-v1/case-pebble-v5-review.json",
    "mechanical/xe-minimal/prototype-v1/pebble-v5-slice-review/review.json",
    "firmware/stm32/tests/prototype-v1-regression.json",
    "docs/prototype-v1-assembly-and-test.md",
    "docs/validation/xe-current-five-unit-evt-plan.json",
    "docs/procurement/xe-panel-readiness.json",
    "docs/validation/xe-carrier-manufacturing-qualification.json",
    "docs/validation/xe-battery-cutoff-characterization-plan.json",
    "docs/procurement/xe-jlc-programming-service-review-2026-10-28.json",
    "docs/safety/xe-usb-overvoltage-gap-review.json",
]
for name in files:
    assert (ROOT / name).is_file(), name
assert active["pcb_outline_mm"] == [27.5, 27.5]
assert manifest["assembly_positions"] == 68 and manifest["external_sensor_positions"] == 0
assert case["version"] == slice_review["case_revision"]
assert regression["shell_checks_passed"] == 39
assert all(gate["result"] == "NOT_RUN" for gate in evt["gates"])

report = {
    "version": architecture["version"],
    "date": "2026-10-28",
    "decision": "HOLD_DO_NOT_ORDER_PHYSICAL_EVT_AND_LIVE_PROCUREMENT_PENDING",
    "release_allowed": False,
    "coherent_baseline": {
        "battery": "DTP401525-XE 110mAh with factory 781720003 plug and internal 10k NTC",
        "battery_procurement": "buyer separately procures exact connectorized pack; no solder, crimp or wiring",
        "runtime_design_target": "<=4.4mA average, <=70.4mAh/16h, <=110mA peak; physical result NOT_RUN",
        "pcb_mm": active["pcb_outline_mm"],
        "pcb_layers": 6,
        "jlc_assembly_positions_per_unit": 68,
        "external_sensor_positions_per_unit": 0,
        "pofv_count": active["manufacturing_pad_via_flags"],
        "pcba_route": panel["assembly_route"],
        "carrier_status": panel["status"],
        "carrier_physical_qualification": carrier_qualification["status"],
        "battery_cutoff_characterization": cutoff_characterization["status"],
        "jlc_programming_service": programming_service["status"],
        "case_revision": case["version"],
        "case_complete_bbox_mm": case["complete_bbox_mm"],
        "case_slice_status": slice_review["status"],
        "firmware_shell_checks_passed": regression["shell_checks_passed"],
        "firmware_source_hashes": len(regression["source_sha256"]),
        "physical_evt_gates": {gate["id"]: gate["result"] for gate in evt["gates"]},
    },
    "local_review": {
        "directory": active["manufacturing_review_directory"],
        "status": manifest["status"],
        "archive_or_upload_package_created": manifest["archive_or_upload_package_created"],
        "upload_or_order_performed": manifest["upload_or_order_performed"],
    },
    "remaining_release_blockers": [
        "Safety priority 1 HOLD: NCP360SNT1G overvoltage protection is integrated ahead of a TPS2552DBVR-1 latch-off 50-100mA limiter. The TPS2552 recommended-input ceiling is 6.5V and absolute maximum is 7.0V, giving 1.1V from the NCP360 guaranteed 5.9V maximum OVLO threshold to absolute maximum. CAD checks pass, but the NCP360 published 1.5us turn-off limit does not cover the required 1uF output capacitor, so physical qualification remains NOT_RUN. At 6/9/12/20V and 0.1/1/10V/us, measured peaks at both /VBUS_OVP and /VBUS_CHARGER plus measurement uncertainty must remain strictly below 6.5V. Sustained short must latch off at 50-100mA and recover only after USB power-cycle; otherwise redesign is mandatory.",
        "Public JLC pages now provide exact-model prices and public orderable flags for all 36 MPN lines, including NCP360 C603707, Murata 35V C33 C6628588 and Molex battery header C564183. Live BOM-tool recognition, reservation, substitutions and an exact quotation remain unverified.",
        "The fixed DTP401525-XE pack remains separate buyer procurement because it is outside the JLC assembly boundary.",
        "JLC automatic-flow acceptance of the six-layer stackup and four POFV features is unverified; upload is prohibited in this task.",
        "Double-sided placement requires the generated 70x70mm Standard-PCBA carrier; CAD DRC, unit equivalence, unarchived CAM review and local 36-line/68-placement BOM/CPL reference matching must pass on the current board, while live BOM-tool recognition, viewer rotation/pin-1 review, five-carrier reflow/depanelization/edge/case-fit qualification and supplier acceptance remain incomplete.",
        "JLC publishes a selectable Standard-PCBA programming option, so buyer flashing is not inherently required; however exact STM32U585/J3 SWD, BOR4 readback, UID-to-PCB binding and raw-record delivery remain subject to order-flow engineering acceptance. Product VID/PID, five-pack cutoff evidence and the common EVT image are also incomplete; final-image EVT C remains separately mandatory.",
        "Physical EVT gates A-F are all NOT_RUN: safety, 16h runtime, 30h storage, three-OS USB, and enclosure/necklace durability remain unproven.",
    ],
    "release_rule": "release_allowed remains false until every blocker is resolved and EVT A-F have complete passing raw evidence",
    "evidence_sha256": {name: hashlib.sha256((ROOT / name).read_bytes()).hexdigest() for name in files},
    "orders_payments_uploads_contacts_performed": False,
}
(ROOT / "docs/prototype-v1-order-decision.json").write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"decision": report["decision"], "evidence_files": len(files), "remaining_blockers": len(report["remaining_release_blockers"])}))

"""Finalize canonical metadata after the pack-NTC electrical adoption."""

import hashlib
import json
import subprocess
from pathlib import Path


HERE = Path(__file__).resolve().parent
PYTHON = "/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3"


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


subprocess.run([PYTHON, str(HERE / "audit_exact_via_pad_overlap.py")], check=True)
drc = json.loads((HERE / "current-drc.json").read_text())
erc = json.loads((HERE / "current-erc.json").read_text())
via = json.loads((HERE / "exact-via-pad-overlap-audit.json").read_text())
assert not drc["violations"] and not drc["schematic_parity"] and not drc["unconnected_items"]
assert not any(sheet["violations"] for sheet in erc["sheets"])
assert via["hole_over_pad_vias"] == 3

design = json.loads((HERE / "design.json").read_text())
refs = {part["ref"] for part in design["parts"]}
assert "TH1" not in refs
j2 = next(part for part in design["parts"] if part["ref"] == "J2")
assert next(pin for pin in j2["pins"] if pin["number"] == "2")["net"] == "BAT_TS"

active_path = HERE / "active-design.json"
active = json.loads(active_path.read_text())
active.update(
    status="U585_TPS22917_PACK_NTC_27P5X27P5_THREE_HOLE_OVER_PAD_PHYSICAL_EVT_REQUIRED_ORDER_HOLD",
    temperature_sensor=(
        "DTP401525-XE internal 10k NTC on J2 pin2 drives TLV7042 hardware hot/cold inhibit; "
        "board TH1 and case thermal pad removed; R-T lot characterization and installed cutoff/recovery EVT pending; charging default disabled"
    ),
    pcb_outline_mm=[27.5, 27.5],
    warning=(
        "Pack NTC electrical path is synchronized and ERC/DRC/parity/unconnected are zero. "
        "Order remains prohibited because CAM/panel/case are superseded, three hole-over-pad vias remain, "
        "and safety/runtime/USB/PDM/temperature/lanyard claims require physical EVT."
    ),
    manufacturing_export_status="ALL_EXISTING_CAM_SUPERSEDED_BY_PACK_NTC_27P5X27P5_REVISION",
    panel_revision_status=(
        "All earlier panels/order files are superseded; regenerate for 27.5 x 27.5 mm only after release gates pass."
    ),
    mechanical_candidate="../../mechanical/xe-minimal/prototype-v1/case-pebble-v4-assembly.step",
    mechanical_status=(
        "PACK_NTC_CASE_V4_CAD_SYNCHRONIZED; nominal lower/upper/lug intersections zero; "
        "USB datum retained; print fit, pouch swelling, cable fit, hang orientation and lug fatigue unverified"
    ),
    via_pad_audit_status=(
        "THREE_0P15MM_FILLED_CAPPED_POFV_MATCH_PUBLISHED_JLC_SIX_LAYER_CAPABILITY; "
        "ordinary-via local reroutes rejected by DRC; physical planarity, solder voiding, opens, shorts and yield require five-unit EVT"
    ),
    via_in_pad_process_review="via-in-pad-process-review.json",
    factory_programming_status=(
        "JLC_STANDARD_PCBA_PROGRAMMING_OPTION_DOCUMENTED; J3 SWD CAD verified; "
        "common flashable production binary and legal VID/PID pending; first-use HID recipient provisioning "
        "implemented but physical three-OS/power-loss qualification pending; vendor acceptance and physical pogo test pending; buyer flashing prohibited"
    ),
)
active["u10_load_switch"]["ct"] = "OPEN_PER_TI_DATASHEET_INTENTIONAL_NO_CONNECT"
active["sha256"].pop("../../mechanical/xe-minimal/prototype-v1/case-pebble-v3-assembly.step", None)
for key in list(active["sha256"]):
    path = (HERE / key).resolve()
    if path.exists():
        active["sha256"][key] = sha(path)
for key in (
    "via-in-pad-process-review.json",
    "check_via_in_pad_release_intent.py",
    "../../docs/procurement/xe-u585-current-public-status.json",
    "check_production_bom_boundary.py",
    "../../docs/validation/xe-current-five-unit-evt-plan.json",
    "../../docs/validation/check_current_evt_plan.py",
    "../../docs/sourcing/xe-integrated-16h-budget.json",
    "../../docs/sourcing/xe-integrated-16h-budget.md",
    "../../docs/sourcing/check_xe_runtime_budget.py",
    "../../docs/manufacturing/xe-jlc-programming-readiness-2026-10-28.md",
    "../../docs/decisions/0013-production-key-provisioning-and-read-only-export.md",
    "../../docs/procurement/xe-production-readiness-2026-10-28.md",
    "../../docs/requirements.md",
    "../../firmware/stm32/usb/msc_storage.c",
    "../../firmware/stm32/usb/msc_storage.h",
    "../../firmware/stm32/tests/test_msc_storage.c",
    "../../firmware/stm32/core/recipient_record.c",
    "../../firmware/stm32/core/recipient_record.h",
    "../../firmware/stm32/tests/test_recipient_record.c",
    "../../firmware/stm32/tests/check_recipient_record.sh",
    "../../firmware/stm32/usb/recipient_hid.c",
    "../../firmware/stm32/usb/recipient_hid.h",
    "../../firmware/stm32/board/recipient_flash.c",
    "../../firmware/stm32/board/recipient_flash.h",
    "../../firmware/stm32/board/recipient_provisioning.c",
    "../../firmware/stm32/board/recipient_provisioning.h",
    "../../firmware/stm32/tests/check_recipient_hid.sh",
    "../../firmware/stm32/tests/check_recipient_provisioning.sh",
    "../../firmware/stm32/tests/check_recipient_flash_layout.py",
    "../../firmware/stm32/tests/check_common_factory_build.sh",
    "../../host/provision_recipient_hid.py",
    "../../host/test_provision_recipient_hid.py",
    "../../host/import_recordings.py",
    "../../host/README.md",
    "../../firmware/stm32/crypto/fatfs_recording.c",
    "../../firmware/stm32/crypto/fatfs_recording.h",
    "../../firmware/stm32/board/recorder_runtime.c",
    "../../firmware/stm32/board/recorder_runtime.h",
    "../../firmware/stm32/implementation-status.json",
    "../../firmware/stm32/vendor/tinyusb/provenance.json",
    "factory-programming/programming-manifest.template.json",
    "factory-programming/check_j3_swd_interface.py",
    "factory-programming/check_programming_release_inputs.py",
    "factory-programming/j3-swd-interface.svg",
    "../../mechanical/xe-minimal/prototype-v1/integrated-assembly-v1.step",
    "../../mechanical/xe-minimal/prototype-v1/integrated-assembly-v1-review.json",
    "../../mechanical/xe-minimal/prototype-v1/case-pebble-v4-assembly.step",
    "../../mechanical/xe-minimal/prototype-v1/case-pebble-v4-review.json",
):
    active["sha256"][key] = sha((HERE / key).resolve())
active_path.write_text(json.dumps(active, ensure_ascii=False, indent=2) + "\n")

review_path = HERE / "pack-ntc-candidate/review.json"
review = json.loads(review_path.read_text())
review["status"] = "ADOPTED_ELECTRICALLY_CLEAN_PHYSICAL_TEMPERATURE_EVT_REQUIRED"
review["adopted_board_sha256"] = sha(HERE / "pendant-xe-minimal.kicad_pcb")
review_path.write_text(json.dumps(review, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": active["status"], "erc": 0, "drc": 0, "parity": 0, "unconnected": 0, "hole_over_pad": 3}))

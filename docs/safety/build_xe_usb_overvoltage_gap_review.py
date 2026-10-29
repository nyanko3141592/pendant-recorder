#!/usr/bin/env python3
"""Record the adopted USB OVP/current-limit chain and its physical release gate."""
from pathlib import Path
import hashlib
import json

ROOT = Path(__file__).resolve().parents[2]
HW = ROOT / "hardware/xe-minimal"
OUT = ROOT / "docs/safety/xe-usb-overvoltage-gap-review.json"
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()

report = {
    "status": "NCP360_OVP_TPS2552_LATCH_CAD_INTEGRATED_PHYSICAL_ABNORMAL_INPUT_EVT_NOT_RUN",
    "date": "2026-10-28",
    "finding": "U14 NCP360SNT1G disconnects raw USB VBUS before U13 TPS2552DBVR-1. The redesign raises the downstream absolute input rating from 6.0V to 7.0V, provides a guaranteed 50..100mA latch-off limit, and raises the guaranteed OVLO-to-absolute-maximum margin from 0.1V to 1.1V. CAD checks pass; physical qualification is unverified.",
    "current_candidate_release_allowed": False,
    "current_path": ["J1 raw VBUS", "U14 NCP360 OVP", "U13 TPS2552 50..100mA latch-off limiter", "U3 BQ25185 charger"],
    "authoritative_component_limits": {
        "TPS2552DBVR-1": {
            "recommended_VIN_max_V": 6.5,
            "absolute_VIN_max_V": 7.0,
            "current_limit_min_typ_max_mA_with_ILIM_short_to_IN": [50, 75, 100],
            "overcurrent_behavior": "latch-off until input power cycle",
            "source": "https://www.ti.com/lit/ds/symlink/tps2552.pdf",
            "manufacturer_status_source": "https://www.ti.com/lit/gpn/TPS2552"
        },
        "BQ25185DLHR": {
            "recommended_VIN_max_V": 5.5,
            "absolute_input_tolerance_V": 25.0,
            "input_overvoltage_protection": True,
            "source": "https://www.ti.com/lit/ds/symlink/bq25185.pdf",
            "local_source": "hardware/mini-usb-v9/reference/bq25185.pdf"
        },
        "NCP360SNT1G": {
            "recommended_input_max_V": 20.0,
            "OVLO_rising_min_typ_max_V": [5.43, 5.675, 5.9],
            "output_turn_off_max_us": 1.5,
            "turn_off_spec_condition": "VIN rising at 1V/us and no output capacitor",
            "required_output_capacitor_uF": 1.0,
            "source": "https://www.onsemi.com/download/data-sheet/pdf/ncp360-d.pdf"
        }
    },
    "adopted_redesign": {
        "ovp_mpn": "NCP360SNT1G", "ovp_reference": "U14", "ovp_jlc_part": "C603707",
        "limiter_mpn": "TPS2552DBVR-1", "limiter_reference": "U13", "limiter_jlc_part": "C140331",
        "input_capacitor": "C33 GRT155R6YA105KE13D / C6628588 1uF 35V X5R 0402",
        "cad_checks": {"erc": 0, "drc": 0, "schematic_parity": 0, "unconnected": 0},
        "assembly_positions": 68,
        "carrier_bom_lines": 36,
        "guaranteed_OVLO_to_limiter_absolute_max_margin_V": 1.1,
        "guaranteed_OVLO_to_limiter_recommended_max_margin_V": 0.6,
        "current_limit_guaranteed_mA": [50, 100],
        "overcurrent_recovery": "remove and reapply USB input",
        "margin_interpretation": "The former 0.1V margin is now 1.1V. NCP360 turn-off timing still excludes the required 1uF output capacitor, so physical peak-voltage qualification remains mandatory."
    },
    "physical_release_gate": {
        "normal_input_V": [4.75, 5.0, 5.25],
        "abnormal_input_V": [6, 9, 12, 20],
        "input_slew_V_per_us": [0.1, 1, 10],
        "TPS2552_VIN_peak_plus_measurement_uncertainty_must_be_strictly_below_V": 6.5,
        "also_require": ["No unsafe current or temperature behavior", "50..100mA current-limit bound", "Latch-off on sustained short or overcurrent", "No spontaneous restart while the fault remains", "Recovery only after USB input power cycle", "Dead-battery startup and normal 9..11mA charging after recovery"],
        "failure_action": "redesign; no waiver",
        "status": "NOT_RUN"
    },
    "interpretation": "Replacing TPS22950 with TPS2552DBVR-1 structurally removes the former 100mV rating margin while retaining the same outline and four-POFV process count. This is a safer CAD candidate, not physical proof. Release remains HOLD pending quantitative abnormal-input, latch, short, recovery and thermal evidence.",
    "source_sha256": {
        "hardware/xe-minimal/pendant-xe-minimal.kicad_pcb": sha(HW / "pendant-xe-minimal.kicad_pcb"),
        "hardware/xe-minimal/pendant-xe-minimal.kicad_sch": sha(HW / "pendant-xe-minimal.kicad_sch"),
        "hardware/mini-usb-v9/reference/bq25185.pdf": sha(ROOT / "hardware/mini-usb-v9/reference/bq25185.pdf"),
        "docs/safety/xe-tps2552-latch-candidate-review.json": sha(ROOT / "docs/safety/xe-tps2552-latch-candidate-review.json")
    },
    "orders_payments_uploads_contacts_performed": False
}
OUT.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": report["status"], "release_allowed": False, "limiter": "TPS2552DBVR-1"}))

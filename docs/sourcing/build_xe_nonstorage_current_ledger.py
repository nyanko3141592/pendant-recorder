#!/usr/bin/env python3
"""Build an explicit non-storage allocation; this is not runtime proof."""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "docs/sourcing/xe-nonstorage-current-ledger.json"
BUDGET = ROOT / "hardware/xe-minimal/recording-current-budget.json"

def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()

budget = json.loads(BUDGET.read_text())
scenario70 = next(row for row in budget["scenarios"] if row["usable_fraction_hypothesis"] == 0.7)
base_mA = scenario70["base_nonstorage_allocation_mA"]
incremental = budget["incremental_budget"]

mic_max_mA = 0.380
charger_battery_iq_max_mA = 0.005
dual_comparator_max_mA = 2 * 0.000750
known_inside_base_mA = mic_max_mA + charger_battery_iq_max_mA + dual_comparator_max_mA
remaining_base_mA = base_mA - known_inside_base_mA
explicit_guard_bor_mA = incremental["additional_total_mA"]
nonstorage_total_mA = base_mA + explicit_guard_bor_mA

report = {
    "status": "ALLOCATION_DECOMPOSED_NOT_MEASURED_NOT_RUNTIME_PROOF",
    "scope": "Battery-side-equivalent average allocation during ordinary continuous recording",
    "allocation_mA": {
        "original_base_nonstorage": base_mA,
        "published_maxima_deducted_from_base": known_inside_base_mA,
        "remaining_for_mcu_codec_crypto_regulator_load_switch_and_misc": remaining_base_mA,
        "divider_short_case": incremental["divider_short_case_mA"],
        "comparator_engineering_reserve": incremental["comparator_engineering_reserve_mA"],
        "BOR_engineering_reserve": incremental["BOR_engineering_reserve_mA"],
        "explicit_guard_and_BOR_total": explicit_guard_bor_mA,
        "nonstorage_total": nonstorage_total_mA
    },
    "published_rows": [
        {"reference":"U8","mpn":"IM69D130V01","value_mA":mic_max_mA,"kind":"maximum","condition":"VDD=3.3V, clock=768kHz, datasheet stated test conditions","source":"hardware/mini-rect-v13/reference/infineon-im69d130-v1-timing.pdf","source_location":"electrical characteristics IDD row","accounting":"deducted_from_base"},
        {"reference":"U3","mpn":"BQ25185DLHR","value_mA":charger_battery_iq_max_mA,"kind":"maximum","condition":"VIN below UVLO, VBAT=3.6V, 0..85C","source":"hardware/mini-usb-v9/reference/bq25185.pdf","source_location":"battery quiescent current IBAT_Q row","accounting":"deducted_from_base"},
        {"reference":"U12","mpn":"TLV7042DDFR","value_mA":dual_comparator_max_mA,"kind":"maximum","condition":"two channels, VS=1.8V, datasheet stated test conditions","source":"hardware/xe-minimal/evidence/TLV7042-SLVSE13J.pdf","source_location":"supply current per channel maximum 750nA row","accounting":"deducted_from_base"},
        {"reference":"U4","mpn":"TPS7A0233PDBVR","value_mA":0.000025,"kind":"typical_only_not_a_bound","condition":"TI published typical IQ; maximum at final operating condition not established here","source":"https://www.ti.com/lit/ds/symlink/tps7a02.pdf","accounting":"not_deducted_remaining_allocation_covers_it"},
        {"reference":"U10","mpn":"TPS22917DBVT","value_mA":0.0005,"kind":"typical_only_not_a_bound","condition":"ON-state typical supply current from TI documentation","source":"https://www.ti.com/lit/ds/symlink/tps22917.pdf","accounting":"not_deducted_remaining_allocation_covers_it"},
        {"reference":"U1","mpn":"STM32U585CIU6","value_mA":None,"kind":"unresolved_dynamic_average","condition":"actual clocks, MDF/PDM, DMA, IMA ADPCM, age encryption, USB-off recording build","source":"https://www.st.com/resource/en/datasheet/stm32u585ci.pdf","accounting":"remaining_allocation_and_physical_measurement_required","why_no_datasheet_scalar":"Average depends on final clock tree, peripheral duty and firmware workload; a mode-table value is not a completed-device measurement."}
    ],
    "interpretation": {
        "known_maxima_are_not_a_complete_sum": True,
        "remaining_allocation_is_not_a_measurement": True,
        "authoritative_acceptance": "Measured battery-side integral for a complete 16h continuous encrypted recording, plus rail diagnostics",
        "failure_rule": "If the listed loads plus MCU/regulator/misc do not fit, optimize the design; do not relax battery, duration, safety or continuous recording."
    },
    "source_sha256": {
        str(BUDGET.relative_to(ROOT)): sha256(BUDGET),
        "hardware/mini-rect-v13/reference/infineon-im69d130-v1-timing.pdf": sha256(ROOT / "hardware/mini-rect-v13/reference/infineon-im69d130-v1-timing.pdf"),
        "hardware/mini-usb-v9/reference/bq25185.pdf": sha256(ROOT / "hardware/mini-usb-v9/reference/bq25185.pdf"),
        "hardware/xe-minimal/evidence/TLV7042-SLVSE13J.pdf": sha256(ROOT / "hardware/xe-minimal/evidence/TLV7042-SLVSE13J.pdf")
    }
}

assert abs(nonstorage_total_mA - 2.9007248062015503) < 1e-12
assert remaining_base_mA > 0
OUT.write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n")
print(json.dumps({"status": report["status"], "output": str(OUT)}, ensure_ascii=False))

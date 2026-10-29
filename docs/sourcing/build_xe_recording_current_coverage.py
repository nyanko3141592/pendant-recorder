#!/usr/bin/env python3
"""Map every populated board reference to the 16 h recording-current budget."""
from __future__ import annotations

import csv
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BOM = ROOT / "docs/procurement/xe-production-bom-2026-10-28.csv"
LEDGER = ROOT / "docs/sourcing/xe-nonstorage-current-ledger.json"
OUT = ROOT / "docs/sourcing/xe-recording-current-coverage.json"


def refs(text: str) -> set[str]:
    return {item.strip() for item in text.split(",") if item.strip()}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


rows = list(csv.DictReader(BOM.open(newline="")))
board_refs: set[str] = set()
for row in rows:
    if int(row["qty_per_device"]) > 0 and row["route"] != "BUYER_FINAL_ASSEMBLY":
        board_refs |= refs(row["references"])

groups = [
    {
        "name": "explicit_active_semiconductors",
        "references": sorted(refs("U1,U3,U4,U8,U10,U11,U12")),
        "recording_state": "powered",
        "accounting": "U11 and its traffic are in the storage allocation; U1/U4/U10 plus unresolved dynamic and leakage loads are in the remaining non-storage allocation; U3/U8/U12 published rows are explicit.",
        "physical_acceptance_required": True,
    },
    {
        "name": "usb_only_path",
        "references": sorted(refs("J1,U2,U14,U13,R6,R7,R13,R14,R15,C13,C31,C32,C33")),
        "recording_state": "USB detached; VBUS and VBUS_CHARGER unpowered",
        "accounting": "No intentional battery-fed DC path. Leakage/backfeed is covered by the remaining non-storage/misc allocation and must be checked on hardware.",
        "physical_acceptance_required": True,
    },
    {
        "name": "explicit_guard_dividers",
        "references": sorted(refs("R37,R38,R39,R40,R41")),
        "recording_state": "powered from V3V3",
        "accounting": "Included by divider_short_case in explicit_guard_and_BOR_total; this intentionally over-bounds the ordinary NTC/reference branches.",
        "physical_acceptance_required": True,
    },
    {
        "name": "battery_measurement_divider",
        "references": sorted(refs("R33,R34,C28")),
        "recording_state": "R33/R34 continuously across BAT; C28 has no ideal DC load",
        "accounting": "Divider current and capacitor leakage are covered by the remaining non-storage/misc allocation; battery-side whole-device measurement is authoritative.",
        "physical_acceptance_required": True,
    },
    {
        "name": "control_bias_and_signal_resistors",
        "references": sorted(refs("R1,R2,R3,R4,R10,R11,R12,R21,R22,R23,R24,R25,R28,R32,R35,R36,R42,R43")),
        "recording_state": "mixed static bias, series signal, or charger-programming networks",
        "accounting": "Any recording-state DC or switching loss is inside the remaining non-storage/misc allocation; charger-input-only branches have no source with USB detached.",
        "physical_acceptance_required": True,
    },
    {
        "name": "discrete_semiconductors",
        "references": sorted(refs("Q3,Q4,D6")),
        "recording_state": "D6 commanded off; Q3 VBUS detector off; Q4 state controlled but charger input absent",
        "accounting": "Leakage and any GPIO/control loss are inside the remaining non-storage/misc allocation; the indicator allocation is explicitly zero only for commanded ordinary recording duty.",
        "physical_acceptance_required": True,
    },
    {
        "name": "capacitors",
        "references": sorted(refs("C1,C2,C3,C4,C5,C6,C7,C9,C14,C15,C16,C22,C25,C26,C27,C29,C30")),
        "recording_state": "rail decoupling, filtering, or transient storage",
        "accounting": "No ideal steady-state DC load; dielectric leakage and charge/discharge losses are inside the remaining non-storage/misc or storage allocation according to rail.",
        "physical_acceptance_required": True,
    },
    {
        "name": "passive_interfaces",
        "references": sorted(refs("J2,SW1")),
        "recording_state": "battery connector closed; button normally open",
        "accounting": "No independent load; contact loss is included only by battery-side whole-device measurement.",
        "physical_acceptance_required": True,
    },
]

assigned = [ref for group in groups for ref in group["references"]]
duplicates = sorted({ref for ref in assigned if assigned.count(ref) > 1})
missing = sorted(board_refs - set(assigned))
extra = sorted(set(assigned) - board_refs)
ledger = json.loads(LEDGER.read_text())

report = {
    "status": "COMPLETE_REFERENCE_COVERAGE_NOT_MEASURED_NOT_RUNTIME_PROOF" if not (duplicates or missing or extra) else "COVERAGE_ERROR",
    "scope": "Every populated canonical board reference during ordinary continuous recording with USB detached and the indicator commanded off",
    "board_reference_count": len(board_refs),
    "assigned_reference_count": len(set(assigned)),
    "duplicates": duplicates,
    "missing": missing,
    "extra": extra,
    "groups": groups,
    "budget_boundary": {
        "remaining_nonstorage_misc_allocation_mA": ledger["allocation_mA"]["remaining_for_mcu_codec_crypto_regulator_load_switch_and_misc"],
        "warning": "Coverage is bookkeeping, not evidence that the allocation is sufficient. It must not be used to claim 16 h runtime.",
        "authoritative_acceptance": "Measure battery-side charge over a complete 16 h encrypted recording on qualified hardware and verify continuous recording plus rail diagnostics.",
    },
    "source_sha256": {
        str(BOM.relative_to(ROOT)): sha256(BOM),
        str(LEDGER.relative_to(ROOT)): sha256(LEDGER),
    },
}

assert not duplicates and not missing and not extra, (duplicates, missing, extra)
OUT.write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n")
print(json.dumps({"status": report["status"], "references": len(board_refs), "output": str(OUT)}, ensure_ascii=False))

#!/usr/bin/env python3
"""Reject drift or overclaim in the non-storage allocation ledger."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ledger = json.loads((ROOT / "docs/sourcing/xe-nonstorage-current-ledger.json").read_text())
assert ledger["status"] == "ALLOCATION_DECOMPOSED_NOT_MEASURED_NOT_RUNTIME_PROOF"
a = ledger["allocation_mA"]
assert abs(a["original_base_nonstorage"] + a["explicit_guard_and_BOR_total"] - a["nonstorage_total"]) < 1e-12
assert abs(a["published_maxima_deducted_from_base"] + a["remaining_for_mcu_codec_crypto_regulator_load_switch_and_misc"] - a["original_base_nonstorage"]) < 1e-12
assert any(row["mpn"] == "STM32U585CIU6" and row["value_mA"] is None for row in ledger["published_rows"])
assert ledger["interpretation"]["remaining_allocation_is_not_a_measurement"] is True
for rel, expected in ledger["source_sha256"].items():
    assert hashlib.sha256((ROOT / rel).read_bytes()).hexdigest() == expected, rel
print("PASS_XE_NONSTORAGE_ALLOCATION_LEDGER_NOT_MEASUREMENT")

#!/usr/bin/env python3
"""Tie the canonical BOM, codec budget and conservative FAT32 test together."""
from pathlib import Path
import csv
import hashlib
import json

ROOT = Path(__file__).resolve().parents[2]
result_path = ROOT / "firmware/stm32/tests/storage-36h-result.json"
budget_path = ROOT / "docs/sourcing/xe-integrated-16h-budget.json"
bom_path = ROOT / "docs/procurement/xe-production-bom-2026-10-28.csv"
second_path = ROOT / "docs/procurement/xe-storage-second-source-review-2026-10-28.json"
result = json.loads(result_path.read_text())
budget = json.loads(budget_path.read_text())["record_encrypt_store_path"]
second = json.loads(second_path.read_text())
with bom_path.open(newline="") as stream:
    bom = list(csv.DictReader(stream))
u11 = next(row for row in bom if row["references"] == "U11")

assert result["status"] == "PASS_SYNTHETIC_CAPACITY_ONLY"
assert result["represented_seconds"] == 30 * 3600
assert budget["sample_rate_Hz"] >= 16000 and budget["channels"] == 1
assert result["files"] == result["represented_seconds"] // 10 == 10800
assert result["bytes_per_file"] == 82180
assert result["observed_full_ciphertext_bytes"] == 81172 < result["bytes_per_file"]
assert result["payload_bytes"] == result["files"] * result["bytes_per_file"]
assert result["free_bytes_after"] > 0
assert result["volume_bytes"] == 963_999_744
assert u11["mpn"] == second["selected"]["mpn"] == "MKDV8GIL-AST"
assert u11["jlc_part"] == second["selected"]["jlc_part"] == "C26159627"
assert second["selected"]["capacity_Gbit"] == 8
assert result["volume_bytes"] <= second["selected"]["actual_capacity_MByte"] * 1_000_000
for relative, expected in result["source_sha256"].items():
    path = ROOT / "firmware/stm32" / relative
    assert hashlib.sha256(path.read_bytes()).hexdigest() == expected, relative
print(json.dumps({
    "status": "PASS_CONSERVATIVE_964MB_SYNTHETIC_CAPACITY_FOR_30H_PHYSICAL_STORAGE_HOLD",
    "selected_nominal_Gbit": 8,
    "synthetic_volume_bytes": result["volume_bytes"],
    "files": result["files"],
    "ceiling_bytes_per_file": result["bytes_per_file"],
    "estimated_bytes_per_file": result["observed_full_ciphertext_bytes"],
    "free_bytes_after": result["free_bytes_after"],
    "physical_30h_result": "NOT_RUN"
}))

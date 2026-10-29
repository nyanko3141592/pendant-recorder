#!/usr/bin/env python3
"""Reject BOM/current-budget coverage drift and runtime overclaim."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
report = json.loads((ROOT / "docs/sourcing/xe-recording-current-coverage.json").read_text())
assert report["status"] == "COMPLETE_REFERENCE_COVERAGE_NOT_MEASURED_NOT_RUNTIME_PROOF"
assert report["board_reference_count"] == report["assigned_reference_count"] == 68
assert report["duplicates"] == report["missing"] == report["extra"] == []
assert all(group["physical_acceptance_required"] is True for group in report["groups"])
assert "not evidence" in report["budget_boundary"]["warning"]
assert "16 h" in report["budget_boundary"]["authoritative_acceptance"]
for rel, expected in report["source_sha256"].items():
    assert hashlib.sha256((ROOT / rel).read_bytes()).hexdigest() == expected, rel
print("PASS_XE_RECORDING_CURRENT_ALL_68_REFERENCES_COVERED_NOT_RUNTIME_PROOF")

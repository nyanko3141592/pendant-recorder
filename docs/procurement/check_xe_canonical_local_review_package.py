#!/usr/bin/env python3
"""Fail closed if the canonical local package drifts or overclaims readiness."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "outputs/xe-canonical-local-review-v1"
manifest = json.loads((OUT / "manifest.json").read_text())
architecture = json.loads((ROOT / "hardware/xe-minimal/prototype-architecture-v1.json").read_text())
assert manifest["status"] == "CANONICAL_LOCAL_REVIEW_PACKAGE_HOLD_NOT_UPLOAD_OR_ORDER_READY"
assert manifest["candidate"] == architecture["version"]
assert "TPS22950" not in manifest["candidate"] and "OVP-LATCH" in manifest["candidate"]
assert manifest["board"]["assembled_references"] == 68
assert manifest["board"]["bom_lines"] == 36
assert manifest["case"]["revision"] == "XE-PROTOTYPE-V1-CASE-PEBBLE-V4-PACK-NTC"
assert manifest["programming"]["target"] == "STM32U585CIU6"
assert manifest["release_gates"]["decision"] == "HOLD_DO_NOT_ORDER"
assert set(manifest["external_actions_performed"].values()) == {False}
assert "NO_RELEASE_BINARY" in manifest["programming"]["artifact_state"]
for rel, expected in manifest["source_sha256"].items():
    assert hashlib.sha256((ROOT / rel).read_bytes()).hexdigest() == expected, rel
for name, expected in manifest["files_sha256"].items():
    assert hashlib.sha256((OUT / name).read_bytes()).hexdigest() == expected, name
assert set(manifest["files_sha256"]) == {
    "xe-carrier-gerber-drill.zip", "jlc-bom.csv", "jlc-cpl.csv",
    "vendor-programming-instruction.json", "vendor-programming-carrier.svg",
    "evt-programming-manifest.template.json", "xe-case-v4-local-print-files.zip",
    "firmware-source-toolchain-lock.json",
    "programming-readiness.json", "five-unit-programming-record.template.csv",
    "evaluate-five-unit-programming-record.py",
}
print("PASS_XE_CANONICAL_LOCAL_REVIEW_PACKAGE_HASH_LOCKED_HOLD")

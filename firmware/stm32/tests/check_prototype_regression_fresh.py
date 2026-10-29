#!/usr/bin/env python3
"""Reject a prototype regression report recorded against different sources."""

import hashlib
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
REPORT = Path(__file__).resolve().with_name("prototype-v1-regression.json")
report = json.loads(REPORT.read_text())

assert report["status"] == "PASS_NON_HARDWARE_REGRESSION"
assert report["prototype_version"] == "XE-PROTOTYPE-V1"

current = {}
for folder in (ROOT / "firmware/stm32", ROOT / "host"):
    for path in folder.rglob("*"):
        if path.is_file() and path.suffix in (".c", ".h", ".py", ".sh"):
            relative = str(path.relative_to(ROOT))
            current[relative] = hashlib.sha256(path.read_bytes()).hexdigest()

recorded = report["source_sha256"]
assert set(recorded) == set(current), (
    "regression source inventory drift",
    sorted(set(current) - set(recorded)),
    sorted(set(recorded) - set(current)),
)
for relative, digest in current.items():
    assert recorded[relative] == digest, (relative, recorded[relative], digest)

assert report["shell_checks_passed"] == len(report["commands"])
print(
    f"PASS: prototype regression is fresh for {len(current)} sources and "
    f"{report['shell_checks_passed']} shell checks"
)

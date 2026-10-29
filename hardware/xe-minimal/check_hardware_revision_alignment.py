#!/usr/bin/env python3
"""Fail if any release-critical artifact identifies a different hardware revision."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[2]
HW = ROOT / "hardware/xe-minimal"
architecture = json.loads((HW / "prototype-architecture-v1.json").read_text())
revision = architecture["version"]

artifacts = {
    HW / "factory-programming/programming-readiness.json": "hardware_revision",
    HW / "factory-programming/vendor-programming-instruction.json": "hardware_revision",
    HW / "factory-programming/evt-programming-manifest.template.json": "hardware_revision",
    ROOT / "docs/prototype-v1-order-decision.json": "version",
    ROOT / "docs/validation/xe-release-evidence-matrix.json": "candidate",
}
for path, field in artifacts.items():
    value = json.loads(path.read_text())[field]
    assert value == revision, (path.relative_to(ROOT), field, value, revision)

# The mounted-volume identity and the factory build configuration must carry
# the same complete revision, not a legacy shortened case-only identifier.
text_sources = [
    ROOT / "firmware/stm32/core/recording_handoff.c",
    ROOT / "host/prepare_factory_config.py",
    ROOT / "host/device_discovery.py",
]
for path in text_sources:
    text = path.read_text()
    assert revision in text, (path.relative_to(ROOT), revision)
    assert 'XE-27P5-PACK-NTC-CASE-V4' not in text, path.relative_to(ROOT)

assert revision.endswith("-OVP-LATCH")
assert architecture["manufacturing"]["jlc_positions"] == 68
assert any(
    item["reference"] == "U14" and item["part"] == "NCP360SNT1G"
    for item in architecture["architecture"]
)
print(json.dumps({
    "status": "PASS_RELEASE_CRITICAL_HARDWARE_REVISION_ALIGNMENT",
    "revision": revision,
    "artifacts": len(artifacts) + len(text_sources),
}))

#!/usr/bin/env python3
"""Prevent superseded design notes from presenting themselves as manufacturing authority."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[1]

readme = (ROOT / "README.md").read_text()
for token in (
    "XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH",
    "fabrication-review-d0c7ca1c4a31",
    "canonical-single-carrier-v1/carrier.kicad_pcb",
    "case-pebble-v5-review.json",
    "約29.91 × 36.35 × 12.98mm",
    "JLCで出荷前パネル分割",
    "release_allowed=false",
):
    assert token in readme, ("README.md", token)
for stale in (
    "film-integration-trial",
    "diagonal-retainer-design-review",
    "current-single-carrier-trial",
    "約26.2×29.6×12.97mm",
    "全体として採用した一式はまだありません",
):
    assert stale not in readme, ("README.md", stale)

firmware_readme = (ROOT / "firmware/README.md").read_text()
assert "現行製品ファームの正本" in firmware_readme
assert "stm32/" in firmware_readme
legacy_firmware = ["firmware/platformio.ini", "firmware/include/config.h", "firmware/include/modules.h"]
legacy_firmware += [str(path.relative_to(ROOT)) for path in sorted((ROOT / "firmware/src").glob("*.cpp"))]
for relative in legacy_firmware:
    text = (ROOT / relative).read_text()[:300]
    assert "HISTORICAL / NON-PRODUCTION" in text, relative
historical = [
    "docs/bom.md", "docs/custom-pcb.md", "docs/open-questions.md", "docs/omi-reference.md",
    "docs/v1-build.md", "docs/jlcpcb-assembly.md", "docs/density-study.md", "docs/runtime-target.md",
    "docs/battery-sourcing.md", "docs/validation/rev-b0-cad.md",
]
for relative in historical:
    text = (ROOT / relative).read_text()
    assert "履歴" in text[:1200], relative
    assert "現行" in text[:1600] or "正本" in text[:1600], relative

authoritative = {
    "docs/requirements.md": ("DTP401525-XE", "27.5×27.5mm", "68 JLC実装リファレンス", "case-pebble-v5"),
    "docs/prototype-v1-order-decision.md": ("27.5 × 27.5 mm", "68リファレンス", "36 MPN行", "DTP401525-XE", "TPS2552DBVR-1", "fabrication-review-d0c7ca1c4a31", "HOLD"),
    "docs/procurement/xe-production-readiness-2026-10-28.md": ("STM32U585CIU6", "TPS2552DBVR-1", "68実装位置", "全36行", "USD 318.31", "USD 723.81", "発注不可"),
}
for relative, tokens in authoritative.items():
    text = (ROOT / relative).read_text()
    for token in tokens:
        assert token in text, (relative, token)

for relative in ("docs/bom.md", "docs/custom-pcb.md", "docs/open-questions.md", "docs/omi-reference.md"):
    text = (ROOT / relative).read_text()[:1800]
    assert "最新の回路原本は [hardware/rev-a" not in text, relative
    assert "矛盾時はRev A0を優先" not in text, relative

legacy_release_audit = json.loads((ROOT / "docs/sourcing/current-release-audit.json").read_text())
assert legacy_release_audit["status"] == "SUPERSEDED_HISTORICAL_V15_AUDIT_DO_NOT_USE_FOR_CURRENT_XE"
assert legacy_release_audit["superseded_by"]["candidate"] == "XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH"
assert legacy_release_audit["superseded_by"]["order_decision"] == "docs/prototype-v1-order-decision.json"

for relative in authoritative:
    text = (ROOT / relative).read_text()
    for stale in ("67リファレンス", "67部品", "67実装位置", "全34行", "USD 313.52", "fabrication-review-21b4536919ef"):
        assert stale not in text, (relative, stale)

assembly = (ROOT / "docs/prototype-v1-assembly-and-test.md").read_text()
assert "fabrication-review-d0c7ca1c4a31" in assembly
assert "68実装位置・36 MPN行" in assembly

print("PASS_CURRENT_AUTHORITY_MARKERS_SUPERSEDED_NOTES_FAIL_CLOSED")

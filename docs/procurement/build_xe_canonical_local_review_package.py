#!/usr/bin/env python3
"""Build a local, hash-locked review package from the one canonical candidate.

This creates no vendor session, upload, order, payment, or contact.  The output
remains HOLD until the documented external and physical gates pass.
"""
from __future__ import annotations

import hashlib
import json
import shutil
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HW = ROOT / "hardware/xe-minimal"
CARRIER = HW / "canonical-single-carrier-v1"
CAM_REVIEW = json.loads((CARRIER / "carrier-cam-review.json").read_text())
CAM = ROOT / CAM_REVIEW["cam_directory"]
CASE = ROOT / "mechanical/xe-minimal/prototype-v1"
PROGRAM = HW / "factory-programming"
OUT = ROOT / "outputs/xe-canonical-local-review-v1"
ARCHITECTURE = json.loads((HW / "prototype-architecture-v1.json").read_text())


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def deterministic_zip(path: Path, members: list[tuple[Path, str]]) -> None:
    with zipfile.ZipFile(path, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for source, arcname in sorted(members, key=lambda item: item[1]):
            info = zipfile.ZipInfo(arcname, (2026, 10, 28, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o100644 << 16
            archive.writestr(info, source.read_bytes())


if OUT.exists():
    shutil.rmtree(OUT)
OUT.mkdir(parents=True)

fabrication_suffixes = {".gtl", ".gbl", ".g1", ".g2", ".g3", ".g4", ".gts", ".gbs", ".gtp", ".gbp", ".gto", ".gbo", ".gm1", ".drl", ".gbrjob"}
fab_members = [(p, p.name) for p in CAM.iterdir() if p.is_file() and p.suffix.lower() in fabrication_suffixes]
assert len(fab_members) == 16, len(fab_members)
deterministic_zip(OUT / "xe-carrier-gerber-drill.zip", fab_members)

copy_map = {
    CARRIER / "jlc-review-bom.csv": "jlc-bom.csv",
    CARRIER / "jlc-review-cpl.csv": "jlc-cpl.csv",
    PROGRAM / "vendor-programming-instruction.json": "vendor-programming-instruction.json",
    PROGRAM / "vendor-programming-carrier.svg": "vendor-programming-carrier.svg",
    PROGRAM / "evt-programming-manifest.template.json": "evt-programming-manifest.template.json",
    PROGRAM / "source-toolchain-lock.json": "firmware-source-toolchain-lock.json",
    PROGRAM / "programming-readiness.json": "programming-readiness.json",
    PROGRAM / "five-unit-programming-record.template.csv": "five-unit-programming-record.template.csv",
    PROGRAM / "evaluate_five_unit_programming_record.py": "evaluate-five-unit-programming-record.py",
}
for source, name in copy_map.items():
    shutil.copyfile(source, OUT / name)

case_sources = [
    CASE / "case-pebble-v4-lower.stl",
    CASE / "case-pebble-v4-upper.stl",
    CASE / "case-pebble-v4-lower.step",
    CASE / "case-pebble-v4-upper.step",
    CASE / "case-pebble-v4-print-profile.json",
]
assert all(p.is_file() for p in case_sources)
deterministic_zip(OUT / "xe-case-v4-local-print-files.zip", [(p, p.name) for p in case_sources])

case_review = json.loads((CASE / "case-pebble-v4-review.json").read_text())
bom_review = json.loads((CARRIER / "jlc-bom-cpl-review.json").read_text())
manifest = {
    "status": "CANONICAL_LOCAL_REVIEW_PACKAGE_HOLD_NOT_UPLOAD_OR_ORDER_READY",
    "candidate": ARCHITECTURE["version"],
    "created_date": "2026-10-28",
    "board": {
        "finished_mm": [27.5, 27.5],
        "layers": 6,
        "source_sha256": sha(HW / "pendant-xe-minimal.kicad_pcb"),
        "carrier_sha256": sha(CARRIER / "carrier.kicad_pcb"),
        "assembled_references": bom_review["unique_references"],
        "bom_lines": bom_review["bom_lines"],
    },
    "case": {
        "revision": case_review["version"],
        "material": "PETG",
        "print_profile": "0.16mm layers, 6 walls, 40% gyroid; lower oriented with cord-hole axis on build Z",
    },
    "programming": {
        "target": "STM32U585CIU6",
        "artifact_state": "TEMPLATE_AND_FIXTURE_INSTRUCTION_ONLY_NO_RELEASE_BINARY",
        "acceptance_record": "five-unit-programming-record.template.csv; all five units must pass evaluate-five-unit-programming-record.py",
        "release_binary_blocker": "EVT image remains conditional on physical battery-cutoff characterization and the full EVT gate.",
    },
    "buyer_final_assembly": ["DTP401525-XE unmodified 3-wire pack", "case v4", "2-3mm cord"],
    "prohibited_interpretation": [
        "This package is not permission to upload, quote, order, pay, or contact a vendor.",
        "Local CAD/CAM/hash consistency is not physical safety, runtime, DFM, programming-service acceptance, or a live quote.",
    ],
    "release_gates": {
        "physical_evt_A_to_F": "NOT_RUN",
        "factory_programming_exact_vendor_acceptance": "NOT_VERIFIED",
        "live_stock_and_quote": "NOT_VERIFIED",
        "vendor_CAM_DFM_BOM_CPL_preview": "NOT_VERIFIED",
        "decision": "HOLD_DO_NOT_ORDER",
    },
    "source_sha256": {
        str((HW / "pendant-xe-minimal.kicad_pcb").relative_to(ROOT)): sha(HW / "pendant-xe-minimal.kicad_pcb"),
        str((HW / "pendant-xe-minimal.kicad_sch").relative_to(ROOT)): sha(HW / "pendant-xe-minimal.kicad_sch"),
        str((HW / "design.json").relative_to(ROOT)): sha(HW / "design.json"),
        str((HW / "active-design.json").relative_to(ROOT)): sha(HW / "active-design.json"),
        str((ROOT / "docs/procurement/xe-production-bom-2026-10-28.csv").relative_to(ROOT)): sha(ROOT / "docs/procurement/xe-production-bom-2026-10-28.csv"),
        str((CARRIER / "carrier.kicad_pcb").relative_to(ROOT)): sha(CARRIER / "carrier.kicad_pcb"),
        str((CASE / "case-pebble-v4-review.json").relative_to(ROOT)): sha(CASE / "case-pebble-v4-review.json"),
        str((PROGRAM / "vendor-programming-instruction.json").relative_to(ROOT)): sha(PROGRAM / "vendor-programming-instruction.json"),
        str((PROGRAM / "source-toolchain-lock.json").relative_to(ROOT)): sha(PROGRAM / "source-toolchain-lock.json"),
        str((PROGRAM / "programming-readiness.json").relative_to(ROOT)): sha(PROGRAM / "programming-readiness.json"),
        str((PROGRAM / "five-unit-programming-record.template.csv").relative_to(ROOT)): sha(PROGRAM / "five-unit-programming-record.template.csv"),
        str((PROGRAM / "evaluate_five_unit_programming_record.py").relative_to(ROOT)): sha(PROGRAM / "evaluate_five_unit_programming_record.py"),
    },
    "files_sha256": {},
    "external_actions_performed": {"upload": False, "order": False, "payment": False, "vendor_contact": False},
}
for path in sorted(OUT.iterdir()):
    if path.is_file() and path.name != "manifest.json":
        manifest["files_sha256"][path.name] = sha(path)
(OUT / "manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": manifest["status"], "files": len(manifest["files_sha256"]), "output": str(OUT)}, ensure_ascii=False))

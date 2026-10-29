#!/usr/bin/env python3
"""Prove that the 4-layer cost-down candidate still fits Case V3.

Electrical release is a separate gate.  This check locks the mechanical
contract: outline, thickness, footprint poses and USB connector pose must stay
identical to the canonical board used to build the existing case.
"""
from pathlib import Path
import hashlib
import json

import wx
import pcbnew as k

app = wx.App(False)
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
canonical_path = HERE / "pendant-xe-minimal.kicad_pcb"
candidate_path = HERE / "costdown/HW-V1.4-EVT-4LAYER-27P5/route/hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb"
case_review_path = ROOT / "mechanical/xe-minimal/prototype-v1/actual-fit-case-v3/review.json"
out_path = candidate_path.parent / "case-compatibility-review.json"

canonical = k.LoadBoard(str(canonical_path))
candidate = k.LoadBoard(str(candidate_path))
case = json.loads(case_review_path.read_text())

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def outline_bbox(board):
    box = board.GetBoardEdgesBoundingBox()
    return [round(k.ToMM(box.GetWidth()), 6), round(k.ToMM(box.GetHeight()), 6)]

def pose(fp):
    p = fp.GetPosition()
    return {
        "x_mm": round(k.ToMM(p.x), 6),
        "y_mm": round(k.ToMM(p.y), 6),
        "rotation_deg": round(fp.GetOrientationDegrees(), 6),
        "side": "top" if fp.GetLayer() == k.F_Cu else "bottom",
    }

canonical_poses = {fp.GetReference(): pose(fp) for fp in canonical.GetFootprints()}
candidate_poses = {fp.GetReference(): pose(fp) for fp in candidate.GetFootprints()}
pose_changes = {
    ref: {"canonical": canonical_poses.get(ref), "candidate": candidate_poses.get(ref)}
    for ref in sorted(set(canonical_poses) | set(candidate_poses))
    if canonical_poses.get(ref) != candidate_poses.get(ref)
}

checks = {
    # KiCad's edge bounding box includes the 0.05 mm Edge.Cuts stroke, hence
    # 27.55 mm here for the nominal 27.5 mm outline.  Equality to the exact
    # case-source board is the relevant mechanical contract.
    "outline_identical": outline_bbox(canonical) == outline_bbox(candidate),
    "board_thickness_identical": canonical.GetDesignSettings().GetBoardThickness() == candidate.GetDesignSettings().GetBoardThickness(),
    "footprint_set_identical": set(canonical_poses) == set(candidate_poses),
    "all_footprint_poses_identical": not pose_changes,
    "usb_j1_pose_identical": canonical_poses.get("J1") == candidate_poses.get("J1"),
    "case_internal_bbox_covers_board_outline": case["actual_internal_bbox_mm"][1] >= 27.5 and case["actual_internal_bbox_mm"][3] - case["actual_internal_bbox_mm"][2] >= 27.5,
    "case_cad_collision_checks_zero": all(abs(float(v)) < 1e-8 for key,v in case["checks"].items() if key != "lower_material_removed_by_cord_tunnel_mm3"),
}

report = {
    "version": "HW-V1.4-EVT-4LAYER-27P5",
    "status": "MECHANICALLY_COMPATIBLE_WITH_EXISTING_CASE_V3" if all(checks.values()) else "CASE_COMPATIBILITY_FAILED",
    "canonical_board": str(canonical_path.relative_to(ROOT)),
    "candidate_board": str(candidate_path.relative_to(ROOT)),
    "case_review": str(case_review_path.relative_to(ROOT)),
    "canonical_outline_mm": outline_bbox(canonical),
    "candidate_outline_mm": outline_bbox(candidate),
    "nominal_outline_mm": [27.5, 27.5],
    "canonical_thickness_mm": round(k.ToMM(canonical.GetDesignSettings().GetBoardThickness()), 6),
    "candidate_thickness_mm": round(k.ToMM(candidate.GetDesignSettings().GetBoardThickness()), 6),
    "copper_layer_change": [canonical.GetCopperLayerCount(), candidate.GetCopperLayerCount()],
    "footprint_pose_changes": pose_changes,
    "usb_pose": candidate_poses.get("J1"),
    "checks": checks,
    "cad_compatibility_pass": all(checks.values()),
    "mechanical_release_allowed": False,
    "physical_gates": case["physical_gates"],
    "electrical_release_allowed": False,
    "reason": "The layer-count reduction changes internal copper only; the case-driving external geometry is unchanged. Electrical USB/power review remains open.",
    "sha256": {
        "canonical_board": sha(canonical_path),
        "candidate_board": sha(candidate_path),
        "case_review": sha(case_review_path),
    },
    "external_actions": {"upload": False, "order": False, "payment": False, "supplier_contact": False},
}
out_path.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps(report, ensure_ascii=False))
raise SystemExit(0 if all(checks.values()) else 1)

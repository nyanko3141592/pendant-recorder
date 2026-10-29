"""Reject stale panel provenance; no geometry or order is changed."""
from pathlib import Path
import json,hashlib
R=Path(__file__).resolve().parents[2]
current=R/'hardware/xe-minimal/fixed-usb-limit-trial/ncu-sensor-trial/pendant-xe-minimal.kicad_pcb'
parent=R/'hardware/xe-minimal/fixed-usb-limit-trial/usb-margin-detour-trial/pendant-xe-minimal.kicad_pcb'
merge=R/'hardware/xe-minimal/electrical-panel-candidate-v3/merge-review.json';m=json.loads(merge.read_text())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
source=m['source_pcb_sha256'];matches={'NCU_candidate':source==sha(current),'canonical_engineering_parent':source==sha(parent)}
r={'status':'PANEL_SOURCE_STALE_REGENERATION_REQUIRED' if not any(matches.values()) else 'SOURCE_MATCH_REQUIRES_GEOMETRIC_REVIEW','observed_date':'2026-10-27','capabilities_source':'https://jlcpcb.com/capabilities/pcb-assembly-capabilities','standard_PCBA_minimum_carrier_mm':[70,70],'edge_rails_and_fiducials_required':True,'unit_finished_outline_mm':[24,27],'existing_panel_merge_source_sha256':source,'current_source_matches':matches,'sources_sha256':{str(p.relative_to(R)):sha(p) for p in [current,parent,merge]},'order_quantity_gate':{'requested_finished_units':5,'existing_study_positions_per_panel':6,'approved_populated_positions':None,'minimum_purchased_panels':None,'required_action':'Determine whether five selected positions can be populated, or design a one-unit carrier and assemble five carriers. Do not silently bill or build six.'},'required_before_release':['Select current electrical source and regenerate panel copper, masks, rules and assembly placement data','Recheck routed tab sites against current copper and component courtyards','Verify per-unit equivalence, net isolation, panel DRC and drill/mask alignment','Include rails/fiducials and depanelization process','Establish PCB/panel purchase quantities and populated positions before complete cost estimate'],'limits':['Stale provenance is sufficient to reject reuse; does not diagnose all geometry differences','Current unit fabrication output is engineering review data, not a Standard PCBA-ready panel','No change to finished product size, no upload or order']}
(R/'docs/procurement/xe-panel-source-readiness.json').write_text(json.dumps(r,indent=2)+'\n');print(r['status'],matches)

# Keep the stale six-up result above as historical evidence. Independently
# validate the newer one-unit carrier without promoting it to an order target.
carrier=R/'hardware/xe-minimal/current-single-carrier-trial'
bundle=carrier/'rounded-fabrication-review'
manifest_path=bundle/'REVIEW-ONLY.json'
manifest=json.loads(manifest_path.read_text())
board=(bundle/manifest['candidate_pcb']).resolve()
checks={
    'carrier_board_hash': sha(board)==manifest['candidate_sha256'],
    'source_unit_hash': sha(current)==manifest['source_unit_pcb_sha256'],
}
file_checks={name: (bundle/name).is_file() and sha(bundle/name)==expected
             for name,expected in manifest['files_sha256'].items()}
review_paths={name: str((bundle/path).resolve().relative_to(R))
              for name,path in manifest['checks'].items()}
checks['all_review_paths_exist']=all((R/path).is_file() for path in review_paths.values())
checks['all_manifest_file_hashes_match']=all(file_checks.values())
placements=json.loads((bundle/'assembly-reconciliation.json').read_text())
checks['placement_source_hash']=placements['source_pcb_sha256']==sha(board)
drc=json.loads((carrier/'drc-rounded.json').read_text())
checks['reported_drc_has_no_violations']=not drc['violations']
checks['reported_drc_has_no_unconnected']=not drc['unconnected_items']
r['status']='CURRENT_SINGLE_UNIT_CARRIER_REVIEW_ONLY' if all(checks.values()) else 'CURRENT_CARRIER_EVIDENCE_MISMATCH'
r['historical_six_up_status']='PANEL_SOURCE_STALE_DO_NOT_REUSE'
r['current_single_unit_carrier']={
    'board':str(board.relative_to(R)), 'board_sha256':sha(board),
    'manifest':str(manifest_path.relative_to(R)), 'manifest_sha256':sha(manifest_path),
    'integrity_checks':checks, 'files_checked':len(file_checks),
    'file_hash_mismatches':[name for name,ok in file_checks.items() if not ok],
    'review_paths':review_paths,
    'units_per_carrier':manifest['units_per_carrier'],
    'intended_prototype_units':manifest['intended_prototype_units'],
    'adopted':False, 'order_ready':False,
    'unresolved':manifest['unresolved'],
    'limits':['Hashes establish current bundle integrity, not independent correctness of the reports.',
              'DRC report is existing evidence, not a new DRC run.',
              'Exact unit zone serialization differs; inspect zone geometry review.',
              'Canonical preorder target remains unchanged.'],
}
r['order_quantity_gate']['required_action']='One-unit carrier candidate now exists. Confirm adoption, supplier minimum carrier quantity and purchase/assembly quantities for five finished units.'
r['required_before_release']=[
    'Review and adopt the current electrical and single-carrier candidates explicitly',
    'Resolve carrier tooling, support, depanelization and edge finishing process',
    'Resolve feeder rotations/pin1 and via fill/cap manufacturing qualification',
    'Establish purchase quantities, sourcing, attrition and complete five-unit cost',
    'Resolve original battery plug/leads, thermal interface, outer-size and physical validation gates',
]
r['limits'][1]='Current one-unit carrier has review outputs; manufacturing acceptance and release remain unproven.'
(R/'docs/procurement/xe-panel-source-readiness.json').write_text(json.dumps(r,indent=2)+'\n')
print(r['status'],checks)
assert all(checks.values()), 'Current carrier evidence mismatch; do not use bundle'

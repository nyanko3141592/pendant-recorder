#!/usr/bin/env python3
"""Ensure the completion matrix remains complete and fail-closed."""
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[2]
matrix=json.loads((ROOT/'docs/validation/xe-release-evidence-matrix.json').read_text())
evt=json.loads((ROOT/'docs/validation/xe-current-five-unit-evt-plan.json').read_text())
active=json.loads((ROOT/'hardware/xe-minimal/active-design.json').read_text())
demand=json.loads((ROOT/'docs/procurement/prototype-v1-five-unit-installed-demand.json').read_text())
case=json.loads((ROOT/'mechanical/xe-minimal/prototype-v1/case-pebble-v4-review.json').read_text())
carrier=json.loads((ROOT/'docs/validation/xe-carrier-manufacturing-qualification.json').read_text())
architecture=json.loads((ROOT/'hardware/xe-minimal/prototype-architecture-v1.json').read_text())
assert matrix['candidate']==architecture['version']
assert matrix['release_allowed'] is False
assert [r['priority'] for r in matrix['requirements']]==list(range(1,9))
assert all(r['release_status']=='HOLD' for r in matrix['requirements'])
assert all(g['result']=='NOT_RUN' for g in evt['gates'])
assert active['pcb_outline_mm']==[27.5,27.5] and active['manufacturing_pad_via_flags']==4
assert demand['pcb_assembly_positions_per_device']==68 and demand['pcb_assembly_installed_five']==340
assert case['complete_bbox_mm']==[29.90812902996393,36.354064614981965,12.978110549125205]
assert carrier['status']=='READY_FOR_EXTERNAL_AND_PHYSICAL_EXECUTION_NOT_RUN'
assert carrier['release_allowed'] is False
assert 'all_68_placements_and_both_reflow_sides_accepted' in carrier['supplier_DFM_acceptance']['required']
assert not any('67' in item for item in carrier['supplier_DFM_acceptance']['required'])
assert matrix['requirements'][2]['physical_status']=='NOT_RUN'
assert matrix['requirements'][0]['design_status']=='PASS_CAD_NCP360_OVP_INTEGRATED_PHYSICAL_ABNORMAL_INPUT_EVT_NOT_RUN'
assert '1.1V' in matrix['requirements'][0]['design_evidence']
assert 'TPS2552DBVR-1' in matrix['requirements'][0]['design_evidence']
assert '0.1/1/10V-per-us' in matrix['requirements'][0]['design_evidence']
assert all('67-position' not in r['design_evidence'] for r in matrix['requirements'])
assert '68-position' in matrix['requirements'][4]['design_evidence']
assert '68-position' in matrix['requirements'][7]['design_evidence']
assert matrix['orders_payments_uploads_vendor_contacts_performed'] is False
print(json.dumps({'status':'PASS_COMPLETE_FAIL_CLOSED_EVIDENCE_MATRIX','priorities':8,'release_allowed':False,'physical_evt':'A_F_NOT_RUN'}))

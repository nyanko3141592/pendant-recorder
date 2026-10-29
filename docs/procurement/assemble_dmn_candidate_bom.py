"""Candidate overlay bound to the DMN land trial; never a purchase BOM."""
from pathlib import Path
import csv,json,hashlib
R=Path(__file__).resolve().parents[2];H=R/'hardware/xe-minimal/fixed-usb-limit-trial';D=H/'dmn-land-trial'
source=H/'usb-reference-via-small-trial/fabrication-review-10f561cc51b6/mpn-reconciled-candidates.csv'
p=R/'docs/procurement/xe-q6-q7-dmn2056u-review.json';d=json.loads(p.read_text())
d['pin_orientation_review']={'source_page':1,'visual_top_view':'Single drain at top; gate lower-left and source lower-right. Rotating into footprint axes puts gate upper-left, source lower-left, drain right.','footprint_pins':{'1':'gate','2':'source','3':'drain'},'result':'Top-view function mapping matches Q7; Q6 is mirrored for bottom placement. Assembly-machine rotation still requires vendor preview.'}
p.write_text(json.dumps(d,indent=2)+'\n')
rows=list(csv.DictReader(source.open()));assert len(rows)==75
for r in rows:
 r['Candidate_footprint_override']=''
 if r['Reference'] in ['Q6','Q7']:
  assert r['Value']=='2N7002'
  r['MPN_written_in_source']=d['mpn'];r['Status']='PROPOSED_REPLACEMENT_NOT_ADOPTED';r['Source']=str(p.relative_to(R));r['Candidate_footprint_override']='DiodesTrial:SOT23_DMN2056U_DS38480'
  r['Remaining']='Temperature/leakage/pulse/reset/BOR qualification, stock/price, assembly rotation; schematic value still generic'
output=D/'candidate-mpn-review.csv'
with output.open('w') as f:
 w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
report={'status':'75_CANDIDATES_NOT_A_PURCHASE_OR_ASSEMBLY_RELEASE','candidate_count':sum(bool(r['MPN_written_in_source']) for r in rows),'proposed_replacements':['Q6','Q7'],'source_sha256':{str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [source,p,D/'pendant-xe-minimal.kicad_pcb',D/'registered-review.json',D/'land-delta-review.json',D/'paste-review/review.json',D/'body-envelope-review.json',R/'mechanical/xe-minimal/dmn-case-envelope-review.json']},'limitations':['Candidate completeness is not qualification completeness','Other73 entries inherited from source candidate reconciliation without renewed supply validation','This file is separate from prior fabrication bundle; do not submit it as an assembly BOM','Q6/Q7 generic values intentionally remain in schematic until adoption decision']}
assert report['candidate_count']==75
(D/'candidate-mpn-review.json').write_text(json.dumps(report,indent=2)+'\n');print('75/75 assembly references have candidate MPNs; Q6/Q7 remain proposed replacements.')

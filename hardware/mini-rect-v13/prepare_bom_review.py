"""Carry forward exact unchanged candidates only; never certify live sourcing."""
from pathlib import Path
import json,csv,hashlib
P=Path(__file__).resolve().parent;old=P.parent/'mini-rect-v12'
a={p['ref']:p for p in json.loads((old/'design.json').read_text())['parts']}
b=json.loads((P/'design.json').read_text())['parts']
source=old/'manufacturing-review-storage-r6/BOM-JLC-CANDIDATE-NOT-RELEASED.csv'
legacy={}
for r in csv.DictReader(source.open()):
 for ref in r['Designator'].split(','):legacy[ref.strip()]=r
out=P/'procurement-review';out.mkdir(exist_ok=True)
reviewed=json.loads((out/'reviewed-candidates.json').read_text())
rows=[];audit=[]
for p in b:
 ref=p['ref'];prev=a.get(ref);candidate=legacy.get(ref)
 same=prev is not None and all(prev.get(k)==p.get(k) for k in ['value','footprint'])
 passive_target=ref.startswith('TP') or ref=='J3'
 if ref in reviewed:
  chosen=reviewed[ref]
  assert p['value']==chosen['expected_value'] and p['footprint']==chosen['expected_footprint'],f'{ref}: candidate review invalidated by design change'
  rows.append([p['value'],ref,p['footprint'],chosen['jlc_id']]);status=chosen['status']
 elif same and candidate:
  rows.append([candidate['Comment'],ref,p['footprint'],candidate['LCSC Part #']]);status='INHERITED_CANDIDATE_NOT_LIVE_MATCHED'
 elif passive_target:status='PCB_FEATURE_NO_COMPONENT'
 else:
  rows.append([p['value'],ref,p['footprint'],'']);status='NEW_OR_CHANGED_REQUIRES_SELECTION'
 audit.append(dict(ref=ref,status=status,unchanged_value_and_footprint=same))
with (out/'BOM-JLC-REVIEW-ONLY.csv').open('w',newline='') as f:
 w=csv.writer(f);w.writerow(['Comment','Designator','Footprint','LCSC Part #']);w.writerows(rows)
report=dict(status='NOT_ORDER_RELEASE',source_board='power-width-candidate.kicad_pcb',board_sha256=hashlib.sha256((P/'power-width-candidate.kicad_pcb').read_bytes()).hexdigest(),legacy_bom_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),parts=audit,limitations=['Inherited IDs are prior candidates, not current price/stock/assembly confirmation','No placement/CPL approval, package rotation review or live JLC BOM matching','Battery and external microSD are not included','Known storage/power/USB/manufacturing blockers remain'])
(out/'bom-audit.json').write_text(json.dumps(report,indent=2)+'\n')
from collections import Counter
print(Counter(p['status'] for p in audit));print([p['ref'] for p in audit if p['status']=='NEW_OR_CHANGED_REQUIRES_SELECTION'])

"""One lid-side adhesive layer; typical thickness is not a tolerance bound."""
from pathlib import Path
import json,itertools,hashlib
P=Path(__file__).resolve().parent
src=P/'poron236-balanced-fit-review.json';r=json.loads(src.read_text())
a=r['retention'];z=r['board_origin_case_mm'][2]
rows=[]
for shift in [0,.13]:
 vals=[]
 for pcb,pe,le,pf in itertools.product([.8,.93],[-.2,.2],[-.2,.2],[.9,1.1]):
  gap=a['post_tip_case_Z_mm']+shift+pe-z-le-pcb-.13
  vals.append(1-gap/(2.36*pf))
 rows.append(dict(post_tip_shift_mm=shift,post_tip_Z_mm=a['post_tip_case_Z_mm']+shift,foam_compression_min=min(vals),foam_compression_max=max(vals)))
out=dict(status='ADHESIVE_STACK_SENSITIVITY_NOT_QUALIFIED',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),candidate='3M Adhesive Transfer Tape 950',manufacturer_source='https://multimedia.3m.com/mws/media/2365991O/3M-Adhesive-Transfer-Tape-950.pdf?pif=000254%3Flocale%3Den-US',source_evidence='Manufacturer indexed TDS September2024, retrieved2026-10-26',nominal_adhesive_layer_mm=.13,adhesive_thickness_tolerance_mm=None,liner_mm=.08,liner_removed_before_assembly=True,adhesive_layers=1,location='Lid post to foam only; board-side pad face unbonded',cases=rows,limitations=['Manufacturer mentions foam generally; exact PORON4701-30 and selected SLA resin pairing unqualified.','Representative thickness only; no zero-tolerance assumption allowed for release.','Peel data on metal/ABS/PP cannot establish strength of 2x2mm foam/post joint.','No adhesive price, die-cutting method, creep or aging qualification.','No CAD change or final material selection.'],rejected_evidence_inference='9471LE product page foam statement belongs to comparison table row300MP, not proof9471LE is qualified for this foam. 9471LE web metric thickness also conflicts with its TDS.',release_allowed=False)
assert rows[0]['foam_compression_max']>rows[1]['foam_compression_max']
(P/'retention-adhesive-review.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(rows,indent=2))

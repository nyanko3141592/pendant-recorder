"""Package-only envelopes; not an assembled-height or fit guarantee."""
from pathlib import Path
import json,hashlib
import cadquery as cq
O=Path(__file__).resolve().parent
D=json.loads((O/'u11-drawing-dimensions.json').read_text())
I=json.loads((O/'board-inventory.json').read_text())
p=next(x for x in I['parts'] if x['ref']=='U11')
assert p['rotation_deg']==0 and p['side']=='B'
# PDF p5 top view: D spans left/right pad columns, E spans the four-pad rows.
assert abs(next(x for x in p['pads'] if x['number']=='8')['position_mm'][0]-next(x for x in p['pads'] if x['number']=='1')['position_mm'][0]-7)<1e-6
out=[]
for variant in ['nom','max']:
 d,e,h=[D['dimensions_mm'][n][variant] for n in ['D','E','H']]
 body=cq.Workplane('XY').box(d,e,h,centered=(True,True,False)).val()
 assert body.isValid()
 path=O/f'u11-package-body-{variant}.step';cq.exporters.export(body,str(path))
 bb=body.BoundingBox();assert all(abs(a-b)<1e-6 for a,b in zip([bb.xlen,bb.ylen,bb.zlen],[d,e,h]))
 out.append({'file':path.name,'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'dimensions_mm':[d,e,h],'solid_valid':body.isValid()})
report={'status':'PACKAGE_ONLY_ENVELOPES_NOT_COMPLETE_ASSEMBLY','source_pdf':D['source_pdf'],'source_sha256':D['source_sha256'],'axis_evidence':'PDF p5 top-view D left-right pad columns; E across row stack; p6 dimension table. Canonical bottom footprint pad1/8 span x by7mm.','local_frame':'XY package center; body z=0..H; no solder stand-off.','board_reference':{'pcb_sha256':I['pcb_sha256'],'position_mm':p['position_mm'],'rotation_deg':0,'side':'B'},'models':out,'limitations':['Envelope cuboids represent package body only; no terminals, texture, pin1 marking or auxiliary land geometry.','Solder stand-off, tolerances beyond package maxima, insulation and assembly margins must be added separately.','Not positioned in complete recorder assembly; no case or battery fit claim.']}
(O/'u11-body-model-review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(out,indent=2))

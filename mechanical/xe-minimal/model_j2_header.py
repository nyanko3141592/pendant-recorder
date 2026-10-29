"""Drawing-based header envelopes. No claim for the mated battery plug."""
from pathlib import Path
import json,hashlib,cadquery as cq
O=Path(__file__).resolve().parent;root=O.parent.parent
d=json.loads((O/'j2-drawing-dimensions.json').read_text());source=root/d['source_pdf'];assert hashlib.sha256(source.read_bytes()).hexdigest()==d['sha256']
rows=[]
for name,xyz in [('nominal',[5.4,4.5,1.4]),('tolerance',[5.6,4.7,1.6])]:
 solid=cq.Workplane('XY').box(*xyz,centered=(True,True,False)).val();assert solid.isValid();bb=solid.BoundingBox();assert all(abs(a-b)<1e-7 for a,b in zip(xyz,[bb.xlen,bb.ylen,bb.zlen]));f=O/f'j2-header-envelope-{name}.step';cq.exporters.export(solid,str(f));rows.append({'file':f.name,'dimensions_mm':xyz,'sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'valid':True})
r={'status':'HEADER_ENVELOPE_ONLY_NOT_MATED_ASSEMBLY','drawing':d['source_pdf'],'drawing_sha256':d['sha256'],'models':rows,'axes':'X across three contacts; Y header depth; Z body height. XY origin at envelope center, Z0 at envelope bottom. Not yet placed at footprint origin.','tolerance_method':'Add drawing general +/-0.2 mm once to each overall dimension for maximum dimension; this is not position tolerance.','stand_off_mm':{'nominal':.05,'min':.02,'max':.12},'limitations':['Solid cuboids are interference envelopes, not detailed connector geometry.','Header drawing reviewed visually: 5.4 overall width,4.5 depth,1.4 height.','Do not assume the 1.55 parenthesized mating height is a maximum.','78172 housing, terminals, AWG30 leads, insertion/extraction space and board-relative pose remain to be modeled.','Solder stand-off is separately recorded; exact datum relation must be checked before stacking height.']}
(O/'j2-header-model-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))

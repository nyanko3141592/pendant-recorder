from pathlib import Path
import json,hashlib,cadquery as cq
from shapely.geometry import shape,box
from shapely.affinity import translate,scale
P=Path(__file__).resolve().parent;src=P.parents[1]/'hardware/xe-minimal/single-carrier-router-radius-review.json';r=json.loads(src.read_text());files=['tab-clearance-upper-trial.step','wider-right-support-lower-trial.step'];cases={f:cq.importers.importStep(str(P/f)).val() for f in files};rows=[]
for v in r['rows']:
 local=translate(shape(v['remaining_outline']),xoff=-23,yoff=-21.5)
 for depth in [.1,.2,.3]:
  strip=local.intersection(box(0,27,24,27+depth));parts=list(strip.geoms) if hasattr(strip,'geoms') else [strip];solids=[]
  for part in parts:
   if part.area<1e-9:continue
   assert not part.interiors
   poly=scale(part,xfact=1,yfact=-1,origin=(0,0));solid=cq.Workplane('XY').polyline(list(poly.exterior.coords)[:-1]).close().extrude(.93).val();assert solid.isValid();solids.append(solid)
  overlaps={name:sum(s.intersect(case).Volume() for s in solids) for name,case in cases.items()}
  rows.append({'assumed_router_diameter_mm':v['assumed_tool_diameter_mm'],'remaining_depth_mm':depth,'final_overlap_mm3':overlaps})
out={'status':'ROUNDED_RESIDUAL_NOMINAL_SCREEN_NOT_CUT_APPROVAL','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'case_sha256':{f:hashlib.sha256((P/f).read_bytes()).hexdigest() for f in files},'rows':rows,'limits':['Assumes a straight depanel cut across the full root width at stated depth.','No actual cut path, tool access, tolerances, burrs, strength or print accuracy qualified.']};(P/'rounded-tab-residual-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(rows,indent=2))

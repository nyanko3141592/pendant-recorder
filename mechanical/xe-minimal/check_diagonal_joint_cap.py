"""Adhesively attached open-channel retention cap budget; not axial strain relief."""
from pathlib import Path
import cadquery as cq,json,hashlib
from wire_geometry import rounded
O=Path(__file__).resolve().parent
files={'lower':'diagonal-tapered-tray-lower-trial.step','board':'film-sensor-depopulated-board-study.step','separator':'diagonal-bridge-separator-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def box(w,l,h,x,y,z):return cq.Workplane('XY').box(w,l,h,centered=(True,False,False)).translate((x,y,z)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
joints=cq.Compound.makeCompound([pose(box(.9,3,.8,x,23,-2.32)) for x in [-.9,.9]])
route_path=O/'diagonal-wire-offset-overpass-review.json';r=json.loads(route_path.read_text());selected=r['rows'][r['selected_row']]
wires=cq.Compound.makeCompound([rounded(p,rad)[0] for p,rad in zip(selected['paths_mm'],selected['radii_mm'])])
obstacles={**s,'joints':joints,'wires':wires};rows=[];models={}
for y in [22.8,23.2,23.6,24.0]:
 cap=pose(box(3.7,1.2,.4,0,y,-1.12))
 checks={k:{'overlap_mm3':cap.intersect(v).Volume(),'gap_mm':cap.distance(v)} for k,v in obstacles.items()}
 # Geometric face contact at tray rail top; no adhesive layer assumed here.
 bottom=[f for f in cap.Faces() if abs(f.BoundingBox().zmin+1.12)<1e-7 and abs(f.BoundingBox().zmax+1.12)<1e-7]
 tops=[f for f in s['lower'].Faces() if abs(f.BoundingBox().zmin+1.12)<1e-7 and abs(f.BoundingBox().zmax+1.12)<1e-7]
 area=sum(a.intersect(b).Area() for a in bottom for b in tops)
 row={'local_y_start_mm':y,'checks':checks,'nominal_bond_face_area_mm2':area}
 if max(x['overlap_mm3'] for x in checks.values())<1e-8 and area>0:models[len(rows)]=cap
 rows.append(row)
chosen=max(models,key=lambda i:min(v['gap_mm'] for k,v in rows[i]['checks'].items() if k!='lower')) if models else None
if chosen is not None:cq.exporters.export(models[chosen],str(O/'diagonal-joint-cap-trial.step'))
out={'status':'JOINT_CAP_SPACE_TRIAL_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'route_sha256':hashlib.sha256(route_path.read_bytes()).hexdigest(),'rows':rows,'selected_row':chosen,'limits':['Cap only limits upward motion; no proven axial strain relief or joint adhesion.','Bond face area is nominal without glue thickness, squeeze-out or strength specification.','Installation access with board in place remains unverified.','Part is 0.4 mm thick, 3.7 by 1.2 mm; printing and handling unqualified.']}
(O/'diagonal-joint-cap-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))

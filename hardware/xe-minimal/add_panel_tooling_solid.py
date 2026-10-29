"""Integrate proposed rail patches and tooling holes into the nominal carrier."""
from pathlib import Path
import json,hashlib,math
import cadquery as cq
p=Path(__file__).resolve().parent;t=p/'panel-tooling-layout-study.json';r=json.loads(t.read_text());top=json.loads((p/'supported-panel-topology-study.json').read_text());assert hashlib.sha256((p/'supported-panel-topology-study.json').read_bytes()).hexdigest()==r['source_topology_sha256']
source=p/'supported-panel-nominal-carrier.step';shape=cq.importers.importStep(str(source)).val();before=shape.Volume();h=.8264
for x,y,X,Y in r['required_corner_material_patches_mm']:
 shape=shape.fuse(cq.Workplane('XY').box(X-x,Y-y,h,centered=(False,False,False)).translate((x,y,0)).val())
after_patch=shape.Volume()
for hole in r['tooling_holes']:
 x,y=hole['center_mm'];rad=hole['drill_diameter_mm']/2
 tool=cq.Workplane('XY').circle(rad).extrude(h+2).translate((x,y,-1)).val();shape=shape.cut(tool)
shape=shape.clean();assert shape.isValid() and len(shape.Solids())==1
expected=after_patch-sum(math.pi*(v['drill_diameter_mm']/2)**2*h for v in r['tooling_holes']);assert abs(shape.Volume()-expected)<1e-6
unit_checks=[]
for u in top['units']:
 x,y,X,Y=u['bounds_mm'];part=cq.Workplane('XY').box(X-x,Y-y,h,centered=(False,False,False)).translate((x,y,0)).val();missing=part.cut(shape).Volume();assert missing<1e-6;unit_checks.append({'unit':u['unit'],'missing_volume_mm3':missing})
cq.exporters.export(shape,str(p/'supported-panel-tooled-carrier.step'))
face=next(f for f in shape.Faces() if abs(f.Center().z-h)<1e-7 and abs(f.normalAt().z)>.999);wires=face.Wires();assert all(w.IsClosed() for w in wires)
cq.exporters.export(cq.Workplane('XY').newObject(wires),str(p/'supported-panel-tooled-outline.dxf'))
report={'status':'TOOLING_INTEGRATED_NOMINAL_SOLID_NOT_RELEASED','source_step_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'tooling_layout_sha256':hashlib.sha256(t.read_bytes()).hexdigest(),'valid_solid':True,'solid_count':1,'closed_top_face_wires':len(wires),'patch_added_volume_mm3':after_patch-before,'tooling_hole_removed_volume_mm3':after_patch-shape.Volume(),'unit_material_checks':unit_checks,'limitations':['Fiducials are copper features and are not represented in this mechanical solid.','Perforation holes and electrical PCB geometry have not been merged.','Sharp cutout corners remain unmachinable with finite-radius router without relief or accepted radii.','Connectivity and preserved unit volumes do not establish strength or manufacturing acceptance.']}
(p/'supported-panel-tooled-solid-review.json').write_text(json.dumps(report,indent=2)+'\n');print('valid single solid;',len(wires),'closed wires; all six board volumes preserved')

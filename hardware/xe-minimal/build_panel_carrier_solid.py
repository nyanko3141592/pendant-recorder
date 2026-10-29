"""Build nominal support geometry for inspection, not CNC toolpath generation."""
from pathlib import Path
import json,hashlib
import cadquery as cq
p=Path(__file__).resolve().parent;s=p/'supported-panel-topology-study.json';r=json.loads(s.read_text());thickness=.8264
rects=r['rail_bounds_mm']+[u['bounds_mm'] for u in r['units']]+[t['bounds_mm'] for t in r['tabs']]
shape=None
for x,y,X,Y in rects:
 part=cq.Workplane('XY').box(X-x,Y-y,thickness,centered=(False,False,False)).translate((x,y,0)).val()
 shape=part if shape is None else shape.fuse(part)
shape=shape.clean();assert shape.isValid() and len(shape.Solids())==1
faces=[f for f in shape.Faces() if abs(f.Center().z-thickness)<1e-7 and abs(f.normalAt().z)>.999]
assert len(faces)==1
face=faces[0];wires=face.Wires();assert all(w.IsClosed() for w in wires)
cq.exporters.export(shape,str(p/'supported-panel-nominal-carrier.step'))
# Keep CAD's exact wires for downstream edge conversion; export top-face outline as DXF.
cq.exporters.export(cq.Workplane('XY').newObject(wires),str(p/'supported-panel-nominal-outline.dxf'))
report={'status':'VALID_NOMINAL_SOLID_NOT_ROUTER_COMPENSATED_OR_RELEASED','topology_sha256':hashlib.sha256(s.read_bytes()).hexdigest(),'source_pcb_sha256':r['source_pcb_sha256'],'nominal_thickness_mm':thickness,'valid_solid':True,'solid_count':1,'closed_top_face_wire_count':len(wires),'internal_cutout_count':len(wires)-1,'volume_mm3':shape.Volume(),'bounding_box_mm':[shape.BoundingBox().xlen,shape.BoundingBox().ylen,shape.BoundingBox().zlen],'limitations':['No electrical PCB data merged.','Sharp internal corners cannot be produced exactly by a finite-diameter router; relief or accepted corner radii required.','No perforation holes, tooling holes or fiducials included.','Solid connectivity is not evidence of mechanical strength or process suitability.','Coordinates use drawing Y down; STEP model therefore is a planar fabrication study, not an assembled recorder.']}
(p/'supported-panel-carrier-solid-review.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))

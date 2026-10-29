"""Round concave material corners; radius is a study parameter, not approved tool."""
from pathlib import Path
import json,hashlib
import cadquery as cq
p=Path(__file__).resolve().parent;src=p/'supported-panel-tooled-carrier.step';shape=cq.importers.importStep(str(src)).val();h=.8264;selected=[];positions=[]
for edge in shape.Edges():
 if edge.geomType()!='LINE':continue
 vv=edge.Vertices()
 if len(vv)!=2:continue
 a,b=vv[0].Center(),vv[1].Center()
 if abs(a.x-b.x)>1e-6 or abs(a.y-b.y)>1e-6 or abs(abs(a.z-b.z)-h)>1e-6:continue
 x,y=a.x,a.y
 count=sum(shape.isInside(cq.Vector(x+dx*.01,y+dy*.01,h/2),1e-7) for dx,dy in [(-1,-1),(-1,1),(1,-1),(1,1)])
 if count==3:selected.append(edge);positions.append([x,y])
assert selected
rounded=shape.fillet(.5,selected).clean();assert rounded.isValid() and len(rounded.Solids())==1
lost=shape.cut(rounded).Volume();assert lost<1e-6
cq.exporters.export(rounded,str(p/'supported-panel-radius-study.step'))
face=next(f for f in rounded.Faces() if abs(f.Center().z-h)<1e-7 and abs(f.normalAt().z)>.999)
wires=face.Wires();assert all(w.IsClosed() for w in wires)
cq.exporters.export(cq.Workplane('XY').newObject(wires),str(p/'supported-panel-radius-outline.dxf'))
r={'status':'CONCAVE_CORNER_RADIUS_STUDY_NOT_RELEASED','source_step_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'radius_mm':.5,'concave_vertical_edges_rounded':len(selected),'corner_xy_mm':positions,'valid_single_solid':True,'source_material_removed_mm3':lost,'added_volume_mm3':rounded.Volume()-shape.Volume(),'closed_face_wires':len(wires),'limitations':['Radius 0.5 mm is a proposed geometric parameter, not a selected qualified routing tool.','Router center path, entry, runout, tolerance and reachability not yet verified.','Added corner material can alter tab fracture behavior and post-cut burr envelope.','Electrical panel, perforation holes and fiducial copper not integrated.']}
(p/'supported-panel-radius-review.json').write_text(json.dumps(r,indent=2)+'\n');print(len(selected),'concave corners rounded; original material preserved; valid single solid')

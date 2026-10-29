from pathlib import Path
import cadquery as cq
import json,hashlib,math
p=Path(__file__).resolve().parent;src=p/'supported-panel-radius-study.step';shape=cq.importers.importStep(str(src)).val();h=.8264
face=next(f for f in shape.Faces() if abs(f.Center().z-h)<1e-7 and abs(f.normalAt().z)>.999)
edges=[];holes=[]
for wire in face.Wires():
 for e in wire.Edges():
  typ=e.geomType();assert typ in ('LINE','CIRCLE'),typ
  def xy(v):return [round(v.x,8),round(v.y,8)]
  if typ=='CIRCLE' and abs(e.Length()-2*math.pi*e.radius())<1e-6:
   holes.append({'center_mm':xy(e.arcCenter()),'diameter_mm':2*e.radius()});continue
  edges.append({'type':'line' if typ=='LINE' else 'arc','start_mm':xy(e.positionAt(0)),'mid_mm':xy(e.positionAt(.5)),'end_mm':xy(e.positionAt(1))})
assert len(holes)==3
(p/'panel-edge-geometry.json').write_text(json.dumps({'status':'MECHANICAL_TRANSFER_NOT_ELECTRICAL_PANEL','source_step_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'edges':edges,'tooling_holes':holes},indent=2)+'\n');print(len(edges),'edges',len(holes),'holes')

"""Exact circular fillets of convex void corners, assumed radius .8mm."""
from pathlib import Path
import cadquery as cq,json,hashlib
from shapely.geometry import Polygon
from shapely.geometry.polygon import orient
P=Path(__file__).resolve().parent;src=P/'single-carrier-outline-rings.json';rings=json.loads(src.read_text());edges=[]
def export(wire):
 for e in wire.Edges():
  a,m,z=[list(e.positionAt(t).toTuple())[:2] for t in [0,.5,1]]
  assert e.geomType() in ['LINE','CIRCLE']
  edges.append({'type':'line' if e.geomType()=='LINE' else 'arc','start_mm':a,'mid_mm':m,'end_mm':z})
export(cq.Workplane('XY').polyline(rings[0][:-1]).close().val())
checks=[]
for ring in rings[1:]:
 pts=list(orient(Polygon(ring),sign=1).exterior.coords)[:-1]
 wire=cq.Workplane('XY').polyline(pts).close().val();face=cq.Face.makeFromWires(wire);convex=[]
 for i,b in enumerate(pts):
  a=pts[i-1];c=pts[(i+1)%len(pts)];cross=(b[0]-a[0])*(c[1]-b[1])-(b[1]-a[1])*(c[0]-b[0])
  if cross>0:convex.append(min(face.Vertices(),key=lambda v:(v.X-b[0])**2+(v.Y-b[1])**2))
 rounded=face.fillet2D(.8,convex);assert rounded.isValid();outside=rounded.cut(face).Area();assert outside<1e-7
 checks.append({'filleted_convex_corners':len(convex),'outside_original_void_mm2':outside,'unremoved_corner_area_mm2':face.Area()-rounded.Area()});export(rounded.outerWire())
r={'status':'EXACT_ARC_OUTLINE_CANDIDATE_NOT_CAM_APPROVAL','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'assumed_internal_corner_radius_mm':.8,'edges':edges,'void_checks':checks,'limits':['Radius is a study assumption, not supplier tool confirmation.','Only convex void corners rounded; unit material is not removed.','Final depanelization, residual tolerance and fixture strength unresolved.']};(P/'single-carrier-rounded-edge-geometry.json').write_text(json.dumps(r,indent=2)+'\n');print(len(edges),checks)

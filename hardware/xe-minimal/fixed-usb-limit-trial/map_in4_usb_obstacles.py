"""Identify candidate copper-clearance contributors below B.Cu USB segments."""
from pathlib import Path
import pcbnew as k,wx,json,hashlib,math
app=wx.App(False);O=Path(__file__).resolve().parent/'in4-ground-trial';p=O/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p));layer=k.In4_Cu
zone=next(z for z in b.Zones()if z.IsOnLayer(layer)and z.GetNetname()=='/GND');clearance=zone.GetLocalClearance();ground=zone.GetFilledPolysList(layer)
items=[t for t in b.GetTracks()if t.IsOnLayer(layer)and t.GetNetname()!='/GND']
items += [pad for f in b.GetFootprints()for pad in f.Pads()if pad.IsOnLayer(layer)and pad.GetNetname()!='/GND']
rows=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA)or t.GetLayer()!=k.B_Cu or t.GetNetname()not in ['/USB_DP','/USB_DM']:continue
 a,z=t.GetStart(),t.GetEnd();dx,dy=z.x-a.x,z.y-a.y;length=math.hypot(dx,dy);nx,ny=-dy/length,dx/length;half=t.GetWidth()/2
 rectangle=k.SHAPE_POLY_SET();rectangle.NewOutline()
 for point,side in [(a,1),(z,1),(z,-1),(a,-1)]:rectangle.Append(round(point.x+nx*half*side),round(point.y+ny*half*side))
 missing=k.SHAPE_POLY_SET();missing.BooleanSubtract(rectangle,ground);contributors=[];covered=k.SHAPE_POLY_SET()
 for obj in items:
  poly=k.SHAPE_POLY_SET();obj.TransformShapeToPolygon(poly,layer,clearance,k.FromMM(.001),k.ERROR_OUTSIDE)
  overlap=k.SHAPE_POLY_SET();overlap.BooleanIntersection(missing,poly)
  if overlap.Area()<100:continue
  covered.BooleanAdd(overlap);q=obj.GetPosition()
  contributors.append({'uuid':obj.m_Uuid.AsString(),'kind':type(obj).__name__,'net':obj.GetNetname(),'xy_mm':[k.ToMM(q.x),k.ToMM(q.y)],'overlap_with_uncovered_mm2':overlap.Area()/1e12,'is_USB_net':obj.GetNetname()in ['/USB_DP','/USB_DM']})
 remainder=k.SHAPE_POLY_SET();remainder.BooleanSubtract(missing,covered)
 rows.append({'usb_uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'missing_mm2':missing.Area()/1e12,'contributors':contributors,'unattributed_mm2':remainder.Area()/1e12})
r={'status':'CLEARANCE_CONTRIBUTOR_SCREEN_NOT_COMPLETE_RULE_SOLVER','source_pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'zone_local_clearance_mm':k.ToMM(clearance),'polygon_error_mm':.001,'rows':rows,'limits':['Uses zone local clearance only; object/netclass/custom-rule differences may explain residuals','Overlaps from separate obstacles may overlap; do not sum as union','USB via antipads are required; do not fill or remove clearance to obtain geometric coverage','Ground connectivity and 3D fields not evaluated']}
(O/'usb-obstacle-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

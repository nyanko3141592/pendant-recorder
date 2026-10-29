"""Filled-copper delta and signal projection screen; not return-current qualification."""
from pathlib import Path
import pcbnew as k,wx,json,hashlib,math
app=wx.App(False);O=Path(__file__).resolve().parent;src=O.parent/'fixed-usb-limit-trial/ncu-sensor-trial/pendant-xe-minimal.kicad_pcb';dst=O/'pendant-xe-film-lap-guarded-multilayer-trial.kicad_pcb';boards={'source':k.LoadBoard(str(src)),'candidate':k.LoadBoard(str(dst))}
def ground(b,l):
 out=k.SHAPE_POLY_SET()
 for z in b.Zones():
  if z.GetNetname()=='/GND'and z.IsOnLayer(l):out.BooleanAdd(z.GetFilledPolysList(l))
 return out
def rectangle(t,margin=0):
 a,z=t.GetStart(),t.GetEnd();dx,dy=z.x-a.x,z.y-a.y;length=math.hypot(dx,dy)
 if length==0:return None
 nx,ny=-dy/length,dx/length;half=t.GetWidth()/2+k.FromMM(margin);p=k.SHAPE_POLY_SET();p.NewOutline()
 for point,side in [(a,1),(z,1),(z,-1),(a,-1)]:p.Append(round(point.x+nx*half*side),round(point.y+ny*half*side))
 return p
def points(line):return [[k.ToMM(line.CPoint(i).x),k.ToMM(line.CPoint(i).y)]for i in range(line.PointCount())]
def polygons(poly):return [{'outer':points(poly.COutline(i)),'holes':[points(poly.CHole(i,j))for j in range(poly.HoleCount(i))]}for i in range(poly.OutlineCount())]
g0=ground(boards['source'],k.In3_Cu);g1=ground(boards['candidate'],k.In3_Cu);lost=k.SHAPE_POLY_SET();lost.BooleanSubtract(g0,g1);gained=k.SHAPE_POLY_SET();gained.BooleanSubtract(g1,g0);affected=[]
for t in boards['candidate'].GetTracks():
 if isinstance(t,k.PCB_VIA)or t.GetLayer()not in [k.In2_Cu,k.In4_Cu]or t.GetNetname()=='/GND':continue
 rect=rectangle(t)
 if rect is None:continue
 overlap=k.SHAPE_POLY_SET();overlap.BooleanIntersection(rect,lost)
 if not overlap.IsEmpty():affected.append({'net':t.GetNetname(),'uuid':t.m_Uuid.AsString(),'signal_layer':boards['candidate'].GetLayerName(t.GetLayer()),'newly_uncovered_rectangle_area_mm2':overlap.Area()/1e12,'xy_mm':[[k.ToMM(p.x),k.ToMM(p.y)]for p in [t.GetStart(),t.GetEnd()]]})
usb=[]
for name,b in boards.items():
 refs={l:ground(b,l)for l in [k.In1_Cu,k.In3_Cu,k.In4_Cu]}
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA)or t.GetNetname()not in ['/USB_DP','/USB_DM']:continue
  rect=rectangle(t,.025)
  if rect is None:continue
  for l in {k.F_Cu:[k.In1_Cu],k.B_Cu:[k.In4_Cu],k.In2_Cu:[k.In1_Cu,k.In3_Cu],k.In4_Cu:[k.In3_Cu]}.get(t.GetLayer(),[]):
   missing=k.SHAPE_POLY_SET();missing.BooleanSubtract(rect,refs[l]);usb.append({'board':name,'uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'reference':b.GetLayerName(l),'uncovered_area_mm2':missing.Area()/1e12})
previous={(x['uuid'],x['reference']):x for x in usb if x['board']=='source'};changed=[{**x,'previous_uncovered_area_mm2':previous.get((x['uuid'],x['reference']),{}).get('uncovered_area_mm2')}for x in usb if x['board']=='candidate'and (x['uuid'],x['reference'])in previous and abs(x['uncovered_area_mm2']-previous[(x['uuid'],x['reference'])]['uncovered_area_mm2'])>1e-9]
r={'status':'REFERENCE_PLANE_DELTA_SCREEN_NOT_SI_OR_RETURN_CURRENT_ACCEPTANCE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(dst.read_bytes()).hexdigest(),'In3_GND':{'source_area_mm2':g0.Area()/1e12,'candidate_area_mm2':g1.Area()/1e12,'removed_area_mm2':lost.Area()/1e12,'added_area_mm2':gained.Area()/1e12,'source_outlines':g0.OutlineCount(),'candidate_outlines':g1.OutlineCount()},'affected_signal_rectangles':affected,'usb_checks':usb,'usb_changed_checks':changed,'geometry':{'source_ground':polygons(g0),'candidate_ground':polygons(g1),'removed_ground':polygons(lost)},'limits':['Includes all candidate changes and zone refills, not exclusively the added BAT_TS trace.','Rectangle projections exclude track end caps, pads, vias and 3D coupling.','USB comparison uses 0.025 mm margin, a geometric screen rather than an impedance acceptance criterion.','No continuity graph, reference-via inductance, field solution or physical measurement.','Any newly uncovered signal needs review even with DRC zero.']};(O/'guarded-multilayer-in3-reference-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:v for k,v in r.items()if k not in ['geometry','usb_checks']},indent=2))

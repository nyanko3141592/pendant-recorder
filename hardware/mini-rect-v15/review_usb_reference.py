"""Geometric USB return-path screen; not impedance or signal-integrity simulation."""
from pathlib import Path
import json,hashlib,math,wx,sys
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;src=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else P/'charger-vbus-route.kicad_pcb';b=k.LoadBoard(str(src))
gnd=b.FindNet('/GND').GetNetCode();zones=[z for z in b.Zones() if z.GetNetCode()==gnd];gv=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetCode()==gnd];rows=[]
uncovered=[]
for net in ['/USB_DP','/USB_DM']:
 bylayer={};vias=[]
 for t in b.GetTracks():
  if t.GetNetname()!=net:continue
  if isinstance(t,k.PCB_VIA):
   q=t.GetPosition();dist=min((math.hypot(k.ToMM(q.x-v.GetPosition().x),k.ToMM(q.y-v.GetPosition().y)) for v in gv),default=None)
   vias.append(dict(x_mm=k.ToMM(q.x),y_mm=k.ToMM(q.y),nearest_ground_via_mm=round(dist,3) if dist is not None else None));continue
  layer=t.GetLayer();name=b.GetLayerName(layer);r=bylayer.setdefault(name,dict(length_mm=0,samples=0,covered_by_adjacent_gnd_zone=0))
  r['length_mm']+=k.ToMM(t.GetLength());a,z=t.GetStart(),t.GetEnd();n=max(2,math.ceil(k.ToMM(t.GetLength())/.05))
  # F references L2; B references L3; L3 may reference L2 or B, not a guarantee of continuous plane.
  refs=({k.F_Cu:[k.In1_Cu],k.B_Cu:[k.In4_Cu],k.In2_Cu:[k.In1_Cu,k.In3_Cu],k.In4_Cu:[k.In3_Cu,k.B_Cu],k.In1_Cu:[k.F_Cu,k.In2_Cu],k.In3_Cu:[k.In2_Cu,k.In4_Cu]} if b.GetCopperLayerCount()==6 else {k.F_Cu:[k.In1_Cu],k.B_Cu:[k.In2_Cu],k.In2_Cu:[k.In1_Cu,k.B_Cu]})[layer]
  for i in range(n):
   u=(i+.5)/n;q=k.VECTOR2I(round(a.x+(z.x-a.x)*u),round(a.y+(z.y-a.y)*u));r['samples']+=1
   if any(zone.GetLayer() in refs and zone.HitTestFilledArea(zone.GetLayer(),q) for zone in zones):r['covered_by_adjacent_gnd_zone']+=1
   else:uncovered.append(dict(net=net,layer=name,x_mm=k.ToMM(q.x),y_mm=k.ToMM(q.y),trace_width_mm=k.ToMM(t.GetWidth()),reference_layers=[b.GetLayerName(l) for l in refs]))
 for r in bylayer.values():r['length_mm']=round(r['length_mm'],3)
 rows.append(dict(net=net,layers=bylayer,vias=vias))
r=dict(status='REFERENCE_SCREEN_REQUIRES_REDESIGN_REVIEW',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),rows=rows,uncovered_samples=uncovered,limitations=['Checks ground zones only; ground traces/pads not counted as continuous planes','Point sampling omits copper clearance around trace width and does not prove return quality','Nearest ground via is geometric distance, not proof it joins required planes','Actual laminate and paired routing not yet applied'])
src.with_suffix('.usb-reference-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

"""Move USB connector with ESD/CC components, retaining local fanout topology."""
from pathlib import Path
import wx,pcbnew as k,json,shutil
app=wx.App(False);P=Path(__file__).resolve().parent;src=P/'domestic-pack-routed-candidate.kicad_pcb';out=P/'usb-edge-cluster-candidate.kicad_pcb';b=k.LoadBoard(str(src));f={a.GetReference():a for a in b.GetFootprints()}
def v(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def route(net,layer,width,pts):
 for a,c in zip(pts,pts[1:]):
  t=k.PCB_TRACK(b);t.SetStart(v(*a));t.SetEnd(v(*c));t.SetWidth(k.FromMM(width));t.SetLayer(layer);t.SetNet(b.FindNet('/'+net));b.Add(t)
def via(net,x,y):
 t=k.PCB_VIA(b);t.SetPosition(v(x,y));t.SetWidth(k.FromMM(.45));t.SetDrill(k.FromMM(.2));t.SetViaType(k.VIATYPE_THROUGH);t.SetLayerPair(k.F_Cu,k.B_Cu);t.SetNet(b.FindNet('/'+net));b.Add(t)
for ref in ['J1','U2','R6','R7']:f[ref].Move(v(0,20))
for ref in ['J2','TH1']:f[ref].Flip(f[ref].GetPosition(),False)
f['J2'].SetPosition(v(26,31))
moved=[]
for t in list(b.GetTracks()):
 net=t.GetNetname();yy=min(t.GetStart().y,t.GetEnd().y)
 if t.m_Uuid.AsString() in ['1538f0b5-3534-4f0b-b67f-3e3e609aef0e', '2979b29a-447a-4d25-962f-4173ea7d303e', '2eea9269-c65f-4c04-a529-773770f43668', '4a4e2e07-5550-436a-8a6e-74c4a97eda94', '534dac92-f2c9-46c1-ad1c-7e8067d58ca0', '54682708-bca6-47bc-a0cb-8c1d3befdbd7', '5839c514-1ca5-4a51-ac2e-fe27e1a2cd13', '62f08933-edbb-4286-8b3d-ed4c70bb4bac', '6d407fc4-9c3a-4a8f-9793-637a861b103a', '7b2e0ff9-c508-4feb-8313-dd1901fda7d8', '869b4dbb-7eed-48fd-af17-9ab154f1b792', '8ce07536-def1-41d8-a314-9ec7b0a592e3', '9534c3e2-228e-43bc-866e-d4bd65f08a96', '9c12b57e-0907-426e-9cb6-765d103fe2e2', 'af83b098-c87c-427f-aa4e-0b2a667919f4', 'b2e7bc18-ed9b-4f81-9fa3-f029c36a93df', 'c76d9e95-ab42-4853-83a9-ed853c87666e', 'd35a48c3-329b-40a0-9f7f-99b214edeed4', 'fa576669-7e11-4901-bd37-84477340294d']:b.DeleteNative(t);continue
 if net in ['/CC1','/CC2'] or (net in ['/USB_DP','/USB_DM'] and yy>k.FromMM(14) and (isinstance(t,k.PCB_VIA) or t.GetLayer() in [k.F_Cu,k.B_Cu])):
  t.Move(v(0,20));moved.append(t.m_Uuid.AsString())
 # Rework old external temperature via + end leg after mirrored footprint.
 elif net=='/BAT_TS' and yy>k.FromMM(23):b.DeleteNative(t)
 elif net=='/GND' and isinstance(t,k.PCB_VIA) and t.GetPosition()==v(11.325,30.3):b.DeleteNative(t)
 # Remove battery branch in extension, avoiding MP pad after flip.
 elif net=='/BAT' and yy>=k.FromMM(7.3652) and t.GetStart().x>=k.FromMM(22) and t.GetEnd().x>=k.FromMM(22):b.DeleteNative(t)
# Restore old reference transition points, now serving the long inner-layer pair.
via('USB_DP',10.4011,16.7731);via('USB_DM',10.4011,16.2149)
route('USB_DP',k.In4_Cu,.1171,[(10.4011,16.7731),(13,19.372),(13,34.1742),(10.4011,36.7731)])
route('USB_DM',k.In4_Cu,.1171,[(10.4011,16.2149),(9.9,16.716),(9.9,17.1),(12.763,19.963),(12.763,33.853),(10.4011,36.2149)])
route('BAT_TS',k.In2_Cu,.127,[(4.8051,23),(11.325,29.5199),(11.325,30.2)])
via('BAT_TS',11.325,30.2);route('BAT_TS',k.B_Cu,.127,[(11.325,30.2),(11.325,31)])
# Battery pad is now on B; approach outside the mounting-pad corridor.
via('BAT',22,7.3652)
pad=next(p for p in f['J2'].Pads() if p.GetNumber()=='1');xy=(k.ToMM(pad.GetPosition().x),k.ToMM(pad.GetPosition().y))
route('BAT',k.In2_Cu,.3,[(22,7.3652),(22,25),(28.85,31.85),xy]);via('BAT',*xy)
for xx,yy in [(6.18,15.885),(6.18,20.065),(14.82,15.885),(14.82,20.065)]:via('GND',xx,yy)
route('VBUS',k.F_Cu,.25,[(8.1,35.31),(8.1,34.3)]);via('VBUS',8.1,34.3)
route('VBUS',k.F_Cu,.25,[(12.9,35.31),(12.9,34.4),(12.3,33.8),(12.3,33.5)]);via('VBUS',12.3,33.5)
route('VBUS',k.B_Cu,.2,[(11.2,35.375),(12.2,35.375),(13.7,33.875)]);via('VBUS',13.7,33.875)
route('VBUS',k.In2_Cu,.3,[(11.8184,22.1525),(14,24.3341),(14,33.575),(13.7,33.875),(12.3,33.5)])
route('VBUS',k.In2_Cu,.3,[(8.1,34.3),(8.6,33.8),(13.625,33.8),(13.7,33.875)])
# Correct board length to match original USB edge distance, not just connector centre.
for a in b.GetDrawings():
 if a.GetLayer()!=k.Edge_Cuts:continue
 for get,setter in [(a.GetStart,a.SetStart),(a.GetEnd,a.SetEnd)]:
  q=get()
  if q.x==k.FromMM(30):setter(v(31,k.ToMM(q.y)));q=get()
  if q.y==k.FromMM(40):setter(v(k.ToMM(q.x),43))
# Enlarge only extension-zone vertices; other reference-plane outlines stay intact.
for z in b.Zones():
 if z.GetAssignedPriority()==1:
  o=z.Outline();o.RemoveAllContours();o.NewOutline()
  for xy in [(.3,22),(20.8,22),(20.8,.3),(30.7,.3),(30.7,42.7),(.3,42.7)]:o.Append(v(*xy).x,v(*xy).y)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
(P/'usb-cluster-move.json').write_text(json.dumps(dict(status='ROUTING_IN_PROGRESS_NOT_RELEASED',moved_components=['J1','U2','R6','R7'],moved_tracks_and_vias=moved,board_mm=[30,43],remaining=['VBUS/GND reconnection','DRC','USB pair geometry/reference','Case update47mm length and connector access']),indent=2)+'\n')

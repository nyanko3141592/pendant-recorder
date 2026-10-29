"""Symmetric offset pair trial, fixed existing vias; no SI or release claim."""
from pathlib import Path
import wx,pcbnew as k,math,json,hashlib,shutil
app=wx.App(False);P=Path(__file__).resolve().parent;src=P/'acoustic-r13-placement-candidate.kicad_pcb';b=k.LoadBoard(str(src))
center=[(16.3659,8.87515),(15.7659,8.87515),(15.04655,8.87515),(12.10795,11.81375),(12.10795,12.58725),(12.32525,12.80455),(12.32525,14.56985),(10.825364,16.069736),(10.4011,16.494)]
width=.1171;gap=.1199;offset=(width+gap)/2
normals=[]
for a,z in zip(center,center[1:]):
 dx,dy=z[0]-a[0],z[1]-a[1];length=math.hypot(dx,dy);normals.append((-dy/length,dx/length))
paths={}
for name,sign,first,last in [('/USB_DP',-1,(16.3606,9.155),(10.4011,16.7731)),('/USB_DM',1,(16.3712,8.5953),(10.4011,16.2149))]:
 path=[first]
 for i in range(1,len(center)-1):
  n,m=normals[i-1],normals[i];den=1+n[0]*m[0]+n[1]*m[1];assert den>.1
  path.append((center[i][0]+sign*offset*(n[0]+m[0])/den,center[i][1]+sign*offset*(n[1]+m[1])/den))
 if name=='/USB_DP':path.append((10.60,16.7731))
 path.append(last);paths[name]=path
 for t in list(b.GetTracks()):
  if not isinstance(t,k.PCB_VIA) and t.GetNetname()==name and t.GetLayer()==k.In2_Cu:b.DeleteNative(t)
 for a,z in zip(path,path[1:]):
  t=k.PCB_TRACK(b);t.SetLayer(k.In2_Cu);t.SetNetCode(b.FindNet(name).GetNetCode());t.SetWidth(k.FromMM(width));t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));b.Add(t)
for zone in list(b.Zones()):
 if zone.GetLayer()==k.In2_Cu and zone.GetNetname()=='/GND':b.DeleteNative(zone)
k.ZONE_FILLER(b).Fill(b.Zones());out=P/'usb-stripline-pair-candidate.kicad_pcb';k.SaveBoard(str(out),b);shutil.copyfile(src.with_suffix('.kicad_pro'),out.with_suffix('.kicad_pro'))
(P/'usb-stripline-pair-review.json').write_text(json.dumps({'status':'TRIAL_NOT_RELEASED','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'width_mm':width,'target_edge_gap_mm':gap,'paths':paths,'limitations':['Fixed via fanouts are not uniformly spaced','Miter bends and nearby coplanar copper need SI review','DRC/parity/reference checks pending; do not manufacture']},indent=2)+'\n')

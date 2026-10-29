"""Reserve L2 under F.Cu USB and rip up crossing connected components in a trial."""
from pathlib import Path
import math,json,hashlib,shutil
import pcbnew as k,wx
app=wx.App(False)
w=Path(__file__).resolve().parent;src=w/'ilim-main-connected.kicad_pcb'
b=k.LoadBoard(str(src));digest=hashlib.sha256(src.read_bytes()).hexdigest()
xy=lambda v:(k.ToMM(v.x),k.ToMM(v.y))
def dist(p,a,c):
 d=(c[0]-a[0],c[1]-a[1]);n=d[0]**2+d[1]**2
 t=max(0,min(1,((p[0]-a[0])*d[0]+(p[1]-a[1])*d[1])/n)) if n else 0
 return math.hypot(p[0]-a[0]-t*d[0],p[1]-a[1]-t*d[1])
usb=[t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetLayer()==k.B_Cu and t.GetNetname() in ('/USB_DP','/USB_DM','/PDM_CLK_MCU','/PDM_CLK','/PDM_DATA','/SD_CLK_MCU','/SD_CLK','/SD_MOSI','/SD_MISO','/SD_CS_N')]
# 0.5 mm beyond signal copper: geometric reservation, not impedance certification.
polygons=[]
for t in usb:
 a,c=xy(t.GetStart()),xy(t.GetEnd());dx,dy=c[0]-a[0],c[1]-a[1];length=math.hypot(dx,dy)
 if length==0:continue
 r=.3+k.ToMM(t.GetWidth())/2;u=(dx/length,dy/length);v=(-u[1],u[0])
 pts=[(a[0]-u[0]*r+v[0]*r,a[1]-u[1]*r+v[1]*r),(c[0]+u[0]*r+v[0]*r,c[1]+u[1]*r+v[1]*r),(c[0]+u[0]*r-v[0]*r,c[1]+u[1]*r-v[1]*r),(a[0]-u[0]*r-v[0]*r,a[1]-u[1]*r-v[1]*r)]
 z=k.ZONE(b);z.SetLayer(k.In1_Cu if t.GetLayer()==k.F_Cu else k.In2_Cu);z.SetIsRuleArea(True);z.SetDoNotAllowTracks(True);z.SetDoNotAllowVias(False);z.SetDoNotAllowZoneFills(False);z.SetDoNotAllowPads(False);z.SetDoNotAllowFootprints(False)
 z.Outline().NewOutline()
 for x,y in pts:z.Outline().Append(k.FromMM(float(x)),k.FromMM(float(y)))
 b.AddNative(z);z.thisown=False;polygons.append(pts)
tracks=[t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetLayer() in (k.In1_Cu,k.In2_Cu) and t.GetNetname()!='/GND'];groups=[]
while tracks:
 group=[tracks.pop()];ends={(group[0].GetStart().x,group[0].GetStart().y),(group[0].GetEnd().x,group[0].GetEnd().y)}
 while True:
  matches=[t for t in tracks if t.GetLayer()==group[0].GetLayer() and t.GetNetCode()==group[0].GetNetCode() and ((t.GetStart().x,t.GetStart().y) in ends or (t.GetEnd().x,t.GetEnd().y) in ends)]
  if not matches:break
  for t in matches:tracks.remove(t);group.append(t);ends.update([(t.GetStart().x,t.GetStart().y),(t.GetEnd().x,t.GetEnd().y)])
 hit=False
 for t in group:
  a,c=xy(t.GetStart()),xy(t.GetEnd());n=max(1,math.ceil(k.ToMM(t.GetLength())/.02))
  for i in range(n+1):
   p=(a[0]+(c[0]-a[0])*i/n,a[1]+(c[1]-a[1])*i/n)
   if any(dist(p,xy(u.GetStart()),xy(u.GetEnd())) < .3+(k.ToMM(u.GetWidth())+k.ToMM(t.GetWidth()))/2+.1 for u in usb if (k.In1_Cu if u.GetLayer()==k.F_Cu else k.In2_Cu)==t.GetLayer()):hit=True;break
  if hit:break
 if hit:groups.append(group)
rows=[]
for group in groups:
 rows.append({'net':str(group[0].GetNetname()),'segments':len(group),'length_mm':sum(k.ToMM(t.GetLength()) for t in group)})
 for t in group:b.RemoveNative(t)
out=w/'fixed-critical-corridor-unrouted.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ('.kicad_pro','.kicad_dru','.kicad_sch'):shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
assert k.ExportSpecctraDSN(b,str(out.with_suffix('.dsn')))
s=out.with_suffix('.dsn').read_text().replace('(layer In1.Cu\n      (type signal)','(layer In1.Cu\n      (type power)')
s='\n'.join(line for line in s.splitlines() if not ('(wire_keepout ' in line and 'In1.Cu' in line))+'\n'
s=s.replace('(class kicad_default /BAT ','(class kicad_default ')
s=s.replace('    (class USB_FS_PAIR','    (class BAT_POWER /BAT (circuit (use_via "Via[0-3]_450:200_um")) (rule (width 150) (clearance 100)))\n    (class USB_FS_PAIR')
out.with_suffix('.dsn').write_text(s)
assert hashlib.sha256(src.read_bytes()).hexdigest()==digest
r={'status':'PARTIALLY_UNROUTED_TRIAL_NOT_FOR_FABRICATION','source_sha256':digest,'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'reserved_rule_areas':len(polygons),'margin_beyond_signal_copper_mm':.3,'removed_components':rows,'via_count_changed':False,'layers':4,'limitations':['Existing via antipads remain; track corridor does not certify full GND continuity','DSN keepout handling must be inspected before routing','Existing pours require refill after rerouting','All branch endpoints must reconnect; no local whole-net layer swaps'],'release_allowed':False}
(w/'fixed-critical-corridor-preparation.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))

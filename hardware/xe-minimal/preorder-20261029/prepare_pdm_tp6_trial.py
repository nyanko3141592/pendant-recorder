from pathlib import Path
import pcbnew as k,wx,json,shutil,re
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'mixed-global-routed.kicad_pcb';b=k.LoadBoard(str(src))
for t in list(b.GetTracks()):
 if t.GetNetname() not in ['/USB_DP','/USB_DM','/GND','/SD_CLK_MCU']:b.RemoveNative(t)
for z in list(b.Zones()):
 if z.GetIsRuleArea() and z.GetLayer()==k.In2_Cu:b.RemoveNative(z)
f=next(f for f in b.GetFootprints() if f.GetReference()=='R21');f.SetOrientationDegrees(0);f.SetPosition(k.VECTOR2I(k.FromMM(19.1),k.FromMM(12.5)))
a=next(p for f in b.GetFootprints() if f.GetReference()=='U1' for p in f.Pads() if p.GetNumber()=='39');c=next(p for p in f.Pads() if p.GetNetname()=='/PDM_CLK_MCU')
t=k.PCB_TRACK(b);t.SetStart(a.GetPosition());t.SetEnd(c.GetPosition());t.SetLayer(k.B_Cu);t.SetWidth(k.FromMM(.127));t.SetNetCode(a.GetNetCode());b.AddNative(t);t.thisown=False
# Relocate TP6 on its existing side; keep its pad/net and probe courtyard.
import math
f=next(f for f in b.GetFootprints() if f.GetReference()=='TP6');old=f.GetPosition();layer=f.GetLayer()
def bbox(fp):
 boxes=[g.GetBoundingBox() for g in fp.GraphicalItems() if g.GetLayer()==(k.B_CrtYd if layer==k.B_Cu else k.F_CrtYd)]
 assert boxes,fp.GetReference()
 return min(q.GetLeft() for q in boxes),max(q.GetRight() for q in boxes),min(q.GetTop() for q in boxes),max(q.GetBottom() for q in boxes)
obstacles=[u for u in b.GetFootprints() if u.GetReference()!='TP6'];rects=[bbox(u) for u in obstacles if u.GetLayer()==layer];sites=[]
for xi in range(130,240,2):
 for yi in range(115,230,2):
  sites.append((math.hypot(xi/10-k.ToMM(old.x),yi/10-k.ToMM(old.y)),xi/10,yi/10))
chosen=None
for distance,x,y in sorted(sites):
 f.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));r=bbox(f)
 if any(r[0]<q[1] and q[0]<r[1] and r[2]<q[3] and q[2]<r[3] for q in rects):continue
 good=True
 for p in f.Pads():
  shape=p.GetEffectiveShape(layer)
  for u in obstacles:
   for q in u.Pads():
    if q.IsOnLayer(layer) and q.GetNetname()!=p.GetNetname() and shape.Collide(q.GetEffectiveShape(layer),k.FromMM(.101)):good=False
  for t in b.GetTracks():
   if t.IsOnLayer(layer) and t.GetNetname()!=p.GetNetname() and shape.Collide(t.GetEffectiveShape(layer),k.FromMM(.101)):good=False
   if isinstance(t,k.PCB_VIA) and shape.Collide(t.GetPosition(),t.GetDrillValue()//2+k.FromMM(.201)):good=False
 if good:chosen={'old_xy':[k.ToMM(old.x),k.ToMM(old.y)],'new_xy':[x,y],'displacement_mm':distance,'net':str(next(iter(f.Pads())).GetNetname())};break
assert chosen,'No TP6 placement'
(w/'pdm-tp6-move.json').write_text(json.dumps(chosen,indent=2)+'\n');print(chosen)
out=w/'pdm-tp6-unrouted.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
assert k.ExportSpecctraDSN(b,str(out.with_suffix('.dsn')))
s=out.with_suffix('.dsn').read_text().replace('(layer In1.Cu\n      (type signal)','(layer In1.Cu\n      (type power)')
s='\n'.join(x for x in s.splitlines() if '(wire_keepout ' not in x)+'\n'
critical=['/PDM_CLK','/PDM_CLK_MCU','/PDM_DATA','/SD_CLK','/SD_CLK_MCU','/SD_MOSI','/SD_MISO','/SD_CS_N']
a=s.index('(class kicad_default ');end=s.index('(circuit',a);head=s[a:end]
for net in ['/BAT',*critical]:head=re.sub(r'(?<!\S)'+re.escape(net)+r'(?=\s)','',head)
s=s[:a]+head+s[end:]
classes='    (class BAT_POWER /BAT (circuit (use_via "Via[0-3]_450:200_um")) (rule (width 150) (clearance 100)))\n'
classes+='    (class CRITICAL_OUTER '+' '.join(critical)+' (circuit (use_via "Via[0-3]_450:200_um") (use_layer F.Cu B.Cu)) (rule (width 127) (clearance 100)))\n'
s=s.replace('    (class USB_FS_PAIR',classes+'    (class USB_FS_PAIR');s=s.replace('(class USB_FS_PAIR /USB_DM /USB_DP\n      (circuit','(class USB_FS_PAIR /USB_DM /USB_DP\n      (circuit (use_layer F.Cu B.Cu)')
out.with_suffix('.dsn').write_text(s)
(w/'pdm-tp6-preparation.json').write_text(json.dumps({'L2':'GND dedicated power layer','L3':'GND pour with power/slow signal routing allowed','critical_nets_outer_only':critical,'staging':'If connected, freeze critical routes and protect their B.Cu reference from L3 slow/power crossings in a second stage','release_allowed':False},indent=2)+'\n')

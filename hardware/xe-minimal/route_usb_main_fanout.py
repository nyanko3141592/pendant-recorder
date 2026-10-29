"""Short connector-to-ESD transitions only; not a completed controlled-impedance USB pair."""
import pcbnew as k
import wx
app=wx.App(False)
import json,math,subprocess,shutil,hashlib
from pathlib import Path
O=Path(__file__).resolve().parent;cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';src=O/'pendant-xe-minimal';out=O/'usb-main-fanout-candidate';trial=O/'usb-main-fanout-trial';b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));fps={f.GetReference():f for f in b.GetFootprints()}
for base in [out,trial]:
 for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),base.with_suffix(ext))
def pad(ref,num):return next(p for p in fps[ref].Pads() if p.GetNumber()==num)
def near(v):
 for f in b.GetFootprints():
  for p in f.Pads():
   bb=p.GetBoundingBox();d=math.hypot(max(bb.GetX()-v.x,0,v.x-bb.GetRight()),max(bb.GetY()-v.y,0,v.y-bb.GetBottom()))
   if d<k.FromMM(.2):return True
 return False
accepted=[];deferred=[];failed=[]
for ref,nums in [('U2',('6','4')),('U1',('33','32'))]:
 ps=[pad(ref,n) for n in nums];ok=False;tests=0
 for dx,dy in sorted([(x,y) for x in [.6,.8,1.,1.2,1.4,1.6,1.8,2.] for y in [0.,.4,-.4,.8,-.8,1.2,-1.2,1.6,-1.6]],key=lambda xy:math.hypot(*xy)):
  vs=[k.VECTOR2I(p.GetPosition().x+k.FromMM(dx),p.GetPosition().y+k.FromMM(dy)) for p in ps]
  if any(near(v) for v in vs):continue
  items=[]
  for p,v in zip(ps,vs):
   via=k.PCB_VIA(b);via.SetPosition(v);via.SetWidth(k.FromMM(.35));via.SetDrill(k.FromMM(.15));via.SetViaType(k.VIATYPE_THROUGH);via.SetLayerPair(k.F_Cu,k.B_Cu);via.SetNet(p.GetNet());b.AddNative(via);via.thisown=False;items.append(via)
   points=[p.GetPosition(),v] if ref=='U1' else [p.GetPosition(),k.VECTOR2I(p.GetPosition().x+k.FromMM(.4),p.GetPosition().y),v]
   for start,end in zip(points,points[1:]):
    t=k.PCB_TRACK(b);t.SetStart(start);t.SetEnd(end);t.SetLayer(k.B_Cu);t.SetWidth(k.FromMM(.1171));t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False;items.append(t)
  k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(trial.with_suffix('.kicad_pcb')),b);tests+=1
  subprocess.run([cli,'pcb','drc',str(trial.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/'usb-main-fanout-trial-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  r=json.loads((O/'usb-main-fanout-trial-drc.json').read_text())
  if not [v for v in r['violations'] if v['type']!='via_dangling']:
   accepted.append({'ref':ref,'pins':nums,'via_mm':[[k.ToMM(v.x),k.ToMM(v.y)] for v in vs],'stub_length_each_mm':(math.hypot(dx,dy) if ref=='U1' else .4+math.hypot(dx-.4,dy)),'tested':tests});ok=True;break
  failed.append({'ref':ref,'offset_mm':[dx,dy],'violations':[{'type':v['type'],'items':[i['description'] for i in v['items']]} for v in r['violations']]})
  for item in items:b.RemoveNative(item)
 if not ok:deferred.append({'ref':ref,'pins':nums,'tested':tests})
 print(ref,'accepted' if ok else 'deferred','tests',tests,flush=True)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out.with_suffix('.kicad_pcb')),b)
subprocess.run([cli,'pcb','drc',str(out.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/'usb-main-fanout-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'usb-main-fanout-drc.json').read_text());assert not [v for v in r['violations'] if v['type']!='via_dangling']
(O/'usb-main-fanout-review.json').write_text(json.dumps({'status':'PARTIAL_USB_FANOUT_NOT_QUALIFIED','accepted':accepted,'deferred':deferred,'failed_trials':failed,'physical_drc_violations':len(r['violations']),'temporary_via_dangling':sum(v['type']=='via_dangling' for v in r['violations']),'unconnected_items':len(r['unconnected_items']),'limits':['Main inner-layer pair is not yet routed','Reference stitching and impedance of layer changes remain unqualified','Not evidence of USB compliance or measured ESD immunity']},indent=2)+'\n')

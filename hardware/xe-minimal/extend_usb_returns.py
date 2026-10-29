"""Add nearby ground-plane stitching at USB transitions; geometry, not SI qualification."""
import pcbnew as k
import wx
app=wx.App(False)
import math,json,subprocess,shutil,hashlib
from pathlib import Path
O=Path(__file__).resolve().parent;cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';src=O/'usb-return-candidate';dst=O/'usb-return-candidate';trial=O/'usb-return-trial'
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
for base in [dst,trial]:
 for ext in ['.kicad_pro','.kicad_dru']:
  if src!=base:shutil.copyfile(src.with_suffix(ext),base.with_suffix(ext))
usb=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname() in ['/USB_DP','/USB_DM']];gnd=next(p.GetNet() for f in b.GetFootprints() for p in f.Pads() if p.GetNetname()=='/GND')
def xy(v):return [k.ToMM(v.GetPosition().x),k.ToMM(v.GetPosition().y)]
def near_pad(x,y):
 for f in b.GetFootprints():
  for p in f.Pads():
   bb=p.GetBoundingBox();gap=math.hypot(max(k.ToMM(bb.GetX())-x,0,x-k.ToMM(bb.GetRight())),max(k.ToMM(bb.GetY())-y,0,y-k.ToMM(bb.GetBottom())))
   if gap<.2:return True
 return False
results=[]
for u in usb:
 pos=xy(u);existing=[v for v in b.GetTracks() if isinstance(v,k.PCB_VIA) and v.GetNetname()=='/GND'];nearest=min(existing,key=lambda v:math.dist(pos,xy(v)));distance=math.dist(pos,xy(nearest))
 if distance<=.7:
  results.append({'usb_net':u.GetNetname(),'usb_via_mm':pos,'action':'reuse','ground_via_mm':xy(nearest),'distance_mm':distance});continue
 accepted=None;tests=0
 for radius in [.5,.6,.7,.8,1.,1.2,1.4,1.6,1.8,2.]:
  for angle in range(0,360,15):
   x=pos[0]+radius*math.cos(math.radians(angle));y=pos[1]+radius*math.sin(math.radians(angle))
   if near_pad(x,y):continue
   v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(gnd);b.AddNative(v);v.thisown=False
   k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(trial.with_suffix('.kicad_pcb')),b);tests+=1
   subprocess.run([cli,'pcb','drc',str(trial.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/'usb-return-trial-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
   r=json.loads((O/'usb-return-trial-drc.json').read_text())
   if not r['violations']:
    accepted={'usb_net':u.GetNetname(),'usb_via_mm':pos,'action':'added','ground_via_mm':xy(v),'distance_mm':radius,'trials':tests};break
   b.RemoveNative(v)
  if accepted:break
 results.append(accepted or {'usb_net':u.GetNetname(),'usb_via_mm':pos,'action':'deferred','nearest_existing_mm':distance,'trials':tests});print(results[-1],flush=True)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/'usb-return-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'usb-return-drc.json').read_text());assert not r['violations']
(O/'usb-return-review.json').write_text(json.dumps({'status':'GEOMETRY_CHECKED_NOT_SI_QUALIFIED','results':results,'physical_drc_violations':0,'unconnected_items':len(r['unconnected_items']),'limits':['0.7mm reuse threshold is a layout heuristic, not a verified electrical limit','Only ground-plane stitching; outer-surface return paths and ESD still require review','No measured impedance, USB compliance or ESD immunity']},indent=2)+'\n')

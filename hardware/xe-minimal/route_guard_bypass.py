"""Short connector-to-ESD transitions only; not a completed controlled-impedance USB pair."""
import pcbnew as k
import wx
app=wx.App(False)
import json,math,subprocess,shutil,hashlib
from pathlib import Path
O=Path(__file__).resolve().parent;cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';src=O/'guard-local-candidate';out=O/'guard-bypass-candidate';trial=O/'guard-bypass-trial';b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));fps={f.GetReference():f for f in b.GetFootprints()}
for base in [out,trial]:
 for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),base.with_suffix(ext))
def pad(ref,num):return next(p for p in fps[ref].Pads() if p.GetNumber()==num)
def near(v):
 for f in b.GetFootprints():
  for p in f.Pads():
   bb=p.GetBoundingBox();d=math.hypot(max(bb.GetX()-v.x,0,v.x-bb.GetRight()),max(bb.GetY()-v.y,0,v.y-bb.GetBottom()))
   if d<k.FromMM(.2):return True
 return False
accepted=[];deferred=[]
for akey,ckey in [('1','8')]:
 p,q=pad('C29',akey),pad('U12',ckey);assert p.GetNetname()==q.GetNetname();a,c=p.GetPosition(),q.GetPosition();mid=((a.x+c.x)//2,(a.y+c.y)//2)
 candidates=[k.VECTOR2I(mid[0]+k.FromMM(ix*.4),mid[1]+k.FromMM(iy*.4)) for ix in range(-4,5) for iy in range(-4,5)];candidates.sort(key=lambda v:math.hypot(v.x-a.x,v.y-a.y)+math.hypot(v.x-c.x,v.y-c.y));ok=False;tests=0
 for v in candidates:
  if near(v):continue
  # Direct stubs on each surface keep this transition local.
  items=[];via=k.PCB_VIA(b);via.SetPosition(v);via.SetWidth(k.FromMM(.35));via.SetDrill(k.FromMM(.15));via.SetViaType(k.VIATYPE_THROUGH);via.SetLayerPair(k.F_Cu,k.B_Cu);via.SetNet(p.GetNet());b.AddNative(via);via.thisown=False;items.append(via)
  for start,end,layer in [(a,v,k.F_Cu),(v,c,k.B_Cu)]:
   t=k.PCB_TRACK(b);t.SetStart(start);t.SetEnd(end);t.SetLayer(layer);t.SetWidth(k.FromMM(.15));t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False;items.append(t)
  k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(trial.with_suffix('.kicad_pcb')),b);tests+=1
  subprocess.run([cli,'pcb','drc',str(trial.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/'guard-bypass-trial-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  r=json.loads((O/'guard-bypass-trial-drc.json').read_text())
  if not r['violations']:
   accepted.append({'connector_pin':akey,'esd_pin':ckey,'net':p.GetNetname(),'via_mm':[k.ToMM(v.x),k.ToMM(v.y)],'tested':tests});ok=True;break
  for item in items:b.RemoveNative(item)
 if not ok:deferred.append({'connector_pin':akey,'esd_pin':ckey,'tested':tests})
 print(akey,'accepted' if ok else 'deferred','tests',tests,flush=True)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out.with_suffix('.kicad_pcb')),b)
subprocess.run([cli,'pcb','drc',str(out.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/'guard-bypass-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'guard-bypass-drc.json').read_text());assert not r['violations'];(O/'guard-bypass-review.json').write_text(json.dumps({'status':'GUARD_BYPASS_ROUTING_NOT_TRANSIENT_QUALIFIED','accepted':accepted,'deferred':deferred,'physical_drc_violations':0,'unconnected_items':len(r['unconnected_items']),'board_sha256':hashlib.sha256(out.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'limits':['Opposite-face bypass remains longer than ideal same-face placement','No transient, temperature or runtime qualification']},indent=2)+'\n')

from pathlib import Path
import json,shutil,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'ground-finish.kicad_pcb';out=P/'r10-ground-shift.kicad_pcb';attempts=[]
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
for dx,dy in [(1.15,.2),(1.2,.2),(1.1,.3),(1.2,.3),(1.3,.2),(1.15,.1),(1.15,0),(.9,.4),(1.,.4),(1.1,.4)]:
 b=k.LoadBoard(str(src));f=next(f for f in b.GetFootprints() if f.GetReference()=='R10');pads=list(f.Pads());delta=k.VECTOR2I(k.FromMM(dx),k.FromMM(dy));ends=[]
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA):continue
  for attr in ['Start','End']:
   pos=getattr(t,'Get'+attr)()
   if any(p.GetNetCode()==t.GetNetCode() and p.IsOnLayer(t.GetLayer()) and p.HitTest(pos) for p in pads):ends.append((t,attr,pos))
 f.SetPosition(f.GetPosition()+delta)
 for t,attr,pos in ends:getattr(t,'Set'+attr)(pos+delta)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);report=out.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'-o',str(report),'--format','json'],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL);d=json.loads(report.read_text());ok=not d['violations'] and len(d['unconnected_items'])<3;r=dict(dx=dx,dy=dy,accepted=ok,violations=len(d['violations']),remaining=len(d['unconnected_items']));attempts.append(r);print(r,flush=True)
 if ok:break
(P/'r10-ground-shift-review.json').write_text(json.dumps(attempts,indent=2)+'\n')

from pathlib import Path
import json,shutil,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'input-boot-underpass.kicad_pcb';out=P/'input-boot-via-moved.kicad_pcb';trial=P/'boot-via-trial.kicad_pcb'
for f in [out,trial]:
 for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),f.with_suffix(ext))
old=k.VECTOR2I(k.FromMM(12.9639),k.FromMM(12.1492));results=[]
for x,y in [(14.4,12.15),(14,12.15),(14.4,12.4),(14,12.4),(13.9,11.95),(14.4,11.95),(14.7,12.15),(14.7,12.4),(13.8,12.15)]:
 b=k.LoadBoard(str(src));p=k.VECTOR2I(k.FromMM(x),k.FromMM(y));changed=0
 for t in b.GetTracks():
  if t.GetNetname()!='/BOOT0':continue
  if isinstance(t,k.PCB_VIA) and t.GetPosition()==old:t.SetPosition(p);changed+=1
  elif not isinstance(t,k.PCB_VIA):
   if t.GetStart()==old:t.SetStart(p);changed+=1
   if t.GetEnd()==old:t.SetEnd(p);changed+=1
 assert changed==3,changed
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(trial),b);rp=trial.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(trial),'-o',str(rp),'--format','json'],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL);d=json.loads(rp.read_text());r={'via':[x,y],'violations':len(d['violations']),'unconnected':len(d['unconnected_items'])};results.append(r);print(r,flush=True)
 if not d['violations'] and len(d['unconnected_items'])==3:
  k.SaveBoard(str(out),b);shutil.copyfile(rp,out.with_suffix('.drc.json'));(P/'boot-via-move-review.json').write_text(json.dumps({'status':'ACCEPTED_GEOMETRY_ONLY','attempts':results},indent=2)+'\n');raise SystemExit(0)
(P/'boot-via-move-review.json').write_text(json.dumps({'status':'NO_ACCEPTED_ROUTE','attempts':results},indent=2)+'\n');raise SystemExit(1)

from pathlib import Path
import json,shutil,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'last-ground.kicad_pcb';out=P/'usb-reference-power.kicad_pcb';attempts=[]
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
for x,y0,y1 in [(14.9,7.7,9.6),(14.7,7.5,9.6),(15.1,8.,9.6),(14.9,7.7,9.9),(14.5,7.3,9.8),(16.5,7.3,9.8),(16.7,7.1,9.8)]:
 b=k.LoadBoard(str(src));net=b.FindNet('/V3V3')
 for t in list(b.GetTracks()):
  if t.m_Uuid.AsString() in ['130692f1-a8fd-4bba-b85c-a4727d04cee8','61b37719-8aab-41e6-b051-5a00c49ffd4e']:b.DeleteNative(t)
 points=[(15.4856,4.6182),(15.4856,y0),(x,y0+abs(x-15.4856)),(x,y1),(16.3579,10.1143)]
 for a,z in zip(points,points[1:]):
  t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));t.SetWidth(k.FromMM(.127));t.SetLayer(k.In4_Cu);t.SetNet(net);b.Add(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);report=out.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'-o',str(report),'--format','json'],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL);d=json.loads(report.read_text());ok=not d['violations'] and not d['unconnected_items'];r=dict(x=x,y0=y0,y1=y1,accepted=ok,violations=len(d['violations']),remaining=len(d['unconnected_items']));attempts.append(r);print(r,flush=True)
 if ok:break
(P/'usb-reference-power-review.json').write_text(json.dumps(attempts,indent=2)+'\n')

from pathlib import Path
import wx,json,shutil,subprocess
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
results=[]
for index,(x,y,rot,back) in enumerate([(16.3,11.4,90,False)]):
 name='lse-mic-shift';b=k.LoadBoard(str(P/'usb-lse-repair.kicad_pcb'))
 for t in list(b.GetTracks()):
  if t.GetNetname() in ['/LSE_IN','/LSE_OUT']:b.DeleteNative(t)
 mic=next(f for f in b.GetFootprints() if f.GetReference()=='U8');mic.Move(k.VECTOR2I(k.FromMM(.35),0))
 f=next(f for f in b.GetFootprints() if f.GetReference()=='Y1')
 if back:f.Flip(f.GetPosition(),False)
 f.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));f.SetOrientationDegrees(rot)
 for ext in ['kicad_pro']:shutil.copy2(P/('usb-lse-repair.'+ext),P/(name+'.'+ext))
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(P/(name+'.kicad_pcb')),'--format','json','-o',str(P/(name+'-drc.json'))],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 d=json.loads((P/(name+'-drc.json')).read_text());v=[v for v in d['violations'] if any('Y1' in i['description'] for i in v['items'])];results.append(dict(name=name,x=x,y=y,rot=rot,back=back,crystal_violations=v));print(name,len(v),flush=True)
(P/'lse-mic-shift-review.json').write_text(json.dumps(results,indent=2)+'\n')

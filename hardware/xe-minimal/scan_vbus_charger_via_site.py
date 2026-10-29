#!/usr/bin/env python3
from pathlib import Path
import concurrent.futures,json,subprocess
import wx,pcbnew as k
H=Path(__file__).resolve().parent; CLI='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
def one(a):
 x,y,i=a; wx.App(False); b=k.LoadBoard(str(H/'pendant-xe-minimal.kicad_pcb')); old=k.VECTOR2I(k.FromMM(11.5375),k.FromMM(1.249999)); new=k.VECTOR2I(k.FromMM(x),k.FromMM(y)); found=False
 for q in b.GetTracks():
  if type(q) is k.PCB_VIA and q.GetPosition()==old: q.SetPosition(new);found=True
  elif q.GetStart()==old:q.SetStart(new)
  elif q.GetEnd()==old:q.SetEnd(new)
 assert found
 pcb=H/f'vbus-via-{i}.kicad_pcb';out=H/f'vbus-via-{i}.json';k.SaveBoard(str(pcb),b)
 subprocess.run([CLI,'pcb','drc',str(pcb),'--format','json','--severity-all','-o',str(out)],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 d=json.loads(out.read_text());pcb.unlink();out.unlink();return {'x':x,'y':y,'v':len(d['violations']),'u':len(d['unconnected_items'])}
if __name__=='__main__':
 a=[];i=0
 for x in [10.8+n*.1 for n in range(16)]:
  for y in [.8+n*.1 for n in range(15)]:a.append((x,y,i));i+=1
 with concurrent.futures.ProcessPoolExecutor(max_workers=8) as e:r=list(e.map(one,a))
 r.sort(key=lambda z:(z['v'],z['u'],abs(z['x']-11.5375)+abs(z['y']-1.25)));print(json.dumps(r[:20],indent=2))

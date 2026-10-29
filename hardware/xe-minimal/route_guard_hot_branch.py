"""Join remaining hot-reference pad to existing copper; never relax DRC."""
import pcbnew as k, wx
app=wx.App(False)
import json, subprocess, shutil
from pathlib import Path
O=Path(__file__).resolve().parent
src=O/'pendant-xe-minimal'; dst=O/'guard-hot-branch-candidate'
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
p=next(p for f in b.GetFootprints() if f.GetReference()=='R41' for p in f.Pads() if p.GetNumber()=='1')
a=p.GetPosition(); a=(a.x,a.y)
ends=set()
for t in b.GetTracks():
 if t.GetNetname()==p.GetNetname() and t.GetLayer()==k.B_Cu:
  s,e=t.GetStart(),t.GetEnd()
  for frac in [0,.25,.5,.75,1]:ends.add((round(s.x+(e.x-s.x)*frac),round(s.y+(e.y-s.y)*frac)))
paths=[]
for c in ends:
 paths.extend([[a,c],[a,(a[0],c[1]),c],[a,(c[0],a[1]),c]])
 for dx in [-.8,.8,-1.5,1.5]:
  x=a[0]+k.FromMM(dx);paths.append([a,(x,a[1]),(x,c[1]),c])
paths.sort(key=lambda path:sum(((u[0]-v[0])**2+(u[1]-v[1])**2)**.5 for u,v in zip(path,path[1:])))
accepted=None
for i,path in enumerate(paths):
 added=[]
 for s,e in zip(path,path[1:]):
  if s==e:continue
  t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(*s));t.SetEnd(k.VECTOR2I(*e));t.SetWidth(k.FromMM(.15));t.SetLayer(k.B_Cu);t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False;added.append(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'guard-hot-branch-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'guard-hot-branch-drc.json').read_text())
 if not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])<105:
  accepted={'trial':i+1,'path_mm':[[k.ToMM(x),k.ToMM(y)] for x,y in path],'unconnected_items':len(r['unconnected_items'])};break
 for t in added:b.RemoveNative(t)
 if i%20==0:print('trial',i+1,'of',len(paths),flush=True)
review={'accepted':accepted,'candidate_paths':len(paths),'scope':'R41.1 to existing TS_HOT_REF copper; partial PCB only'}
(O/'guard-hot-branch-review.json').write_text(json.dumps(review,indent=2)+'\n');print(review,flush=True)

"""Replace the rejected straight inner trace with a DRC-checked detour."""
import pcbnew as k,wx
app=wx.App(False)
from pathlib import Path
import json,shutil,subprocess
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'guard-supply-join-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
a=k.VECTOR2I(k.FromMM(19.1375),k.FromMM(20.822916));c=k.VECTOR2I(k.FromMM(22.91411),k.FromMM(18.169519))
tracks=[t for t in b.GetTracks() if t.GetNetname()=='/V3V3' and t.GetLayer()==k.In2_Cu]
for pos in [a,c]:assert any(t.GetStart()==pos or t.GetEnd()==pos for t in tracks)
net=tracks[0].GetNet()
paths=[[a,c],[a,k.VECTOR2I(a.x,c.y),c],[a,k.VECTOR2I(c.x,a.y),c]]
for d in [.4,-.4,.8,-.8,1.2,-1.2,2,-2]:
 x=(a.x+c.x)//2+k.FromMM(d);y=(a.y+c.y)//2+k.FromMM(d)
 paths.extend([[a,k.VECTOR2I(x,a.y),k.VECTOR2I(x,c.y),c],[a,k.VECTOR2I(a.x,y),k.VECTOR2I(c.x,y),c],[a,k.VECTOR2I(x,y),c]])
accepted=None
for idx,path in enumerate(paths):
 added=[]
 for s,e in zip(path,path[1:]):
  if s==e:continue
  t=k.PCB_TRACK(b);t.SetStart(s);t.SetEnd(e);t.SetLayer(k.In2_Cu);t.SetWidth(k.FromMM(.15));t.SetNet(net);b.AddNative(t);t.thisown=False;added.append(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'guard-supply-join-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'guard-supply-join-drc.json').read_text())
 if not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])<99:
  accepted={'trial':idx+1,'path_mm':[[k.ToMM(p.x),k.ToMM(p.y)] for p in path],'unconnected_items':len(r['unconnected_items'])};break
 for t in added:b.RemoveNative(t)
result={'accepted':accepted,'scope':'Existing divider supply branch to comparator supply branch; no supply source continuity claim'};(O/'guard-supply-join-review.json').write_text(json.dumps(result,indent=2)+'\n');print(result,flush=True)

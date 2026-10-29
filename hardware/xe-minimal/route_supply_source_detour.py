"""Replace the rejected straight inner trace with a DRC-checked detour."""
import pcbnew as k,wx
app=wx.App(False)
from pathlib import Path
import json,shutil,subprocess
O=Path(__file__).resolve().parent;src=O/'supply-source-inner-candidate';dst=O/'supply-source-detour-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));r=json.loads((O/'supply-source-inner-drc.json').read_text());assert len(r['violations'])==1
ids={i['uuid'] for i in r['violations'][0]['items']}
t=next(t for t in b.GetTracks() if t.m_Uuid.AsString() in ids and t.GetNetname()=='/V3V3' and not isinstance(t,k.PCB_VIA));assert t.GetNetname()=='/V3V3' and t.GetLayer()==k.In2_Cu
a,c=t.GetStart(),t.GetEnd();net=t.GetNet();b.RemoveNative(t)
paths=[[a,c],[a,k.VECTOR2I(a.x,c.y),c],[a,k.VECTOR2I(c.x,a.y),c]]
for d in [.4,-.4,.8,-.8,1.2,-1.2,2,-2]:
 x=(a.x+c.x)//2+k.FromMM(d);y=(a.y+c.y)//2+k.FromMM(d)
 paths.extend([[a,k.VECTOR2I(x,a.y),k.VECTOR2I(x,c.y),c],[a,k.VECTOR2I(a.x,y),k.VECTOR2I(c.x,y),c],[a,k.VECTOR2I(x,y),c]])
accepted=None
for idx,path in enumerate(paths):
 added=[]
 for s,e in zip(path,path[1:]):
  if s==e:continue
  t=k.PCB_TRACK(b);t.SetStart(s);t.SetEnd(e);t.SetLayer(k.In4_Cu);t.SetWidth(k.FromMM(.15));t.SetNet(net);b.AddNative(t);t.thisown=False;added.append(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'supply-source-detour-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'supply-source-detour-drc.json').read_text())
 if not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])<98:
  accepted={'trial':idx+1,'path_mm':[[k.ToMM(p.x),k.ToMM(p.y)] for p in path],'unconnected_items':len(r['unconnected_items'])};break
 for t in added:b.RemoveNative(t)
result={'accepted':accepted,'scope':'U4.5 to guard supply over In4.Cu; transient and power qualification pending'};(O/'supply-source-detour-review.json').write_text(json.dumps(result,indent=2)+'\n');print(result,flush=True)

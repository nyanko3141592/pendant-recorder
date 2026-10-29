import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'r13-up-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
results=[]
for x,y in [(14.8,1.2),(14.8,.8),(14,1),(13,1),(12,1),(14.5,1.5),(13.5,1.5)]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='R13');p=next(p for p in f.Pads() if p.GetNumber()=='1');f.SetPosition(f.GetPosition()+k.VECTOR2I(k.FromMM(x),k.FromMM(y))-p.GetPosition())
 for t in list(b.GetTracks()):
  if t.m_Uuid.AsString() in ['513effad-def5-4364-82fd-7a0a85e187ed','a2b78be4-a345-4814-ad4b-057c38ac511d']:b.RemoveNative(t)
 t=k.PCB_TRACK(b);t.SetStart(p.GetPosition());t.SetEnd(k.VECTOR2I(k.FromMM(12.646924),k.FromMM(4.294999)));t.SetLayer(k.B_Cu);t.SetWidth(k.FromMM(.15));t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'r13-up-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'r13-up-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==64
 entry={'pad1_mm':[x,y],'accepted':ok,'violations':len(r['violations']),'details':r['violations']};results.append(entry);print(x,y,len(r['violations']),ok,flush=True)
 if ok:break
(O/'r13-up-review.json').write_text(json.dumps(results,indent=2)+'\n')

import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'c4-via-relocation-candidate';out=[]
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
for x,y in [(20.9,.45),(20.4,.5),(21.5,.45),(20.5,1),(20.5,.5),(21,.45)]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='f8274bf8-2322-49ed-80d6-54702794632c');old=v.GetPosition();pos=k.VECTOR2I(round(x*1e6),round(y*1e6));v.SetPosition(pos)
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA):continue
  if t.GetStart()==old:t.SetStart(pos)
  if t.GetEnd()==old:t.SetEnd(pos)
 p=next(p for f in b.GetFootprints() if f.GetReference()=='C4' for p in f.Pads() if p.GetNumber()=='1')
 q=k.PCB_TRACK(b);q.SetStart(p.GetPosition());q.SetEnd(pos);q.SetLayer(k.B_Cu);q.SetWidth(k.FromMM(.25));q.SetNet(p.GetNet());b.AddNative(q);q.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'c4-via-relocation-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'c4-via-relocation-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==27;out.append({'xy_mm':[x,y],'accepted':ok,'violations':r['violations']});print(x,y,ok,len(r['violations']),flush=True)
 if ok:break
(O/'c4-via-relocation-review.json').write_text(json.dumps(out,indent=2)+'\n')

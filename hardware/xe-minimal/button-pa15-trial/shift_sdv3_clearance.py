import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'pa15-sdv3-clearance-candidate';out=[]
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
for x,y in [(19.5,12.0),(19.6,12.0),(19.5,12.2),(18.5,12.0),(19.5,11.9)]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='bbde48de-b2d2-4e50-8259-f523a61f78cf');old=v.GetPosition();pos=k.VECTOR2I(round(x*1e6),round(y*1e6));v.SetPosition(pos)
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA):continue
  if t.GetStart()==old:t.SetStart(pos)
  if t.GetEnd()==old:t.SetEnd(pos)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa15-sdv3-clearance-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'pa15-sdv3-clearance-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==27;out.append({'xy_mm':[x,y],'accepted':ok,'violations':r['violations']});print(x,y,ok,len(r['violations']),flush=True)
 if ok:break
(O/'pa15-sdv3-clearance-review.json').write_text(json.dumps(out,indent=2)+'\n')

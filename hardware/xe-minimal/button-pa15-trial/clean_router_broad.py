from pathlib import Path
import pcbnew as k,wx,json,shutil,subprocess
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pa15-router-broad-candidate';dst=O/'pa15-router-broad-clean-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));r=json.loads((O/'pa15-router-broad-drc.json').read_text());removed=[]
for _ in range(30):
 if not r['violations']:break
 assert len(r['violations'])==1 and not r['schematic_parity'] and len(r['unconnected_items'])==21
 v=r['violations'][0];assert v['type'] in ['via_dangling','track_dangling']
 t=next(t for t in b.GetTracks() if t.m_Uuid.AsString()==v['items'][0]['uuid']);assert t.GetNetname()=='/SWDIO' and not t.IsLocked()
 removed.append(v);b.RemoveNative(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa15-router-broad-clean-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'pa15-router-broad-clean-drc.json').read_text())
(O/'router-broad-clean-review.json').write_text(json.dumps({'removed':removed,'violations':r['violations'],'parity':r['schematic_parity'],'unconnected':len(r['unconnected_items']),'adopted':False},indent=2)+'\n')
print(len(r['violations']),len(r['schematic_parity']),len(r['unconnected_items']))

import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pa15-r4-escape-candidate';dst=O/'pa15-r4-ground-clear-candidate'
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='26e96317-db00-40c9-b3b8-a96726bf704a');assert v.GetNetname()=='/GND';b.RemoveNative(v)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa15-r4-ground-clear-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'pa15-r4-ground-clear-drc.json').read_text());print([(v['type'],v['description']) for v in r['violations']],len(r['schematic_parity']),len(r['unconnected_items']))

import pcbnew as k,wx,json,shutil,subprocess,math
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'sd-mosi-pullup-escape-candidate';dst=O/'sd-mosi-pullup-join-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
r=json.loads((O/'sd-mosi-pullup-escape-drc.json').read_text());assert [v['type'] for v in r['violations']]==['via_dangling'];uid=r['violations'][0]['items'][0]['uuid']
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()==uid);p=v.GetPosition();targets=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname()==v.GetNetname() and t.m_Uuid.AsString()!=uid];w=min(targets,key=lambda t:math.hypot(t.GetPosition().x-p.x,t.GetPosition().y-p.y))
t=k.PCB_TRACK(b);t.SetStart(p);t.SetEnd(w.GetPosition());t.SetLayer(k.In2_Cu);t.SetWidth(k.FromMM(.15));t.SetNet(v.GetNet());b.AddNative(t);t.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'sd-mosi-pullup-join-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'sd-mosi-pullup-join-drc.json').read_text());print(len(r['violations']),len(r['schematic_parity']),len(r['unconnected_items']))

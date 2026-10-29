from pathlib import Path
import pcbnew as k,wx,shutil,subprocess,json,collections
app=wx.App(False);d=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');b=k.LoadBoard(str(d/'tp-clearance.kicad_pcb'));base=d/'local-route'
for ext in ['kicad_pro','kicad_dru','kicad_sch']:shutil.copyfile(d/f'tp-clearance.{ext}',base.with_suffix('.'+ext))
def pt(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def tr(net,a,c,layer=k.F_Cu):
 t=k.PCB_TRACK(b);t.SetStart(pt(*a));t.SetEnd(pt(*c));t.SetLayer(layer);t.SetWidth(k.FromMM(.15));t.SetNet(b.FindNet('/'+net));b.AddNative(t);t.thisown=False
tr('GND',(8.825,10.692499),(9.475,10.692499));tr('GND',(9.475,10.692499),(9.495,11.745))
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString()=='b24b8433-7141-4a13-a521-71a8e7c418da':b.RemoveNative(t)
tr('BAT',(11,10),(10.2929,10.3),k.B_Cu)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(base.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(base.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(d/'local-route-drc.json')],check=True)
q=json.loads((d/'local-route-drc.json').read_text());print(collections.Counter(v['type'] for v in q['violations']),len(q['unconnected_items']))
for v in q['violations']:
 if v['type'] not in ['track_dangling','via_dangling']:print(v)

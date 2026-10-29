from pathlib import Path
import pcbnew as k,wx,shutil,subprocess,json,collections
app=wx.App(False);d=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');b=k.LoadBoard(str(d/'local-route.kicad_pcb'));base=d/'cap-ground-route'
for ext in ['kicad_pro','kicad_dru','kicad_sch']:shutil.copyfile(d/f'local-route.{ext}',base.with_suffix('.'+ext))
def pt(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def tr(net,a,c,layer=k.F_Cu):
 t=k.PCB_TRACK(b);t.SetStart(pt(*a));t.SetEnd(pt(*c));t.SetLayer(layer);t.SetWidth(k.FromMM(.15));t.SetNet(b.FindNet('/'+net));b.AddNative(t);t.thisown=False
def via(net,x,y):
 v=k.PCB_VIA(b);v.SetPosition(pt(x,y));v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(b.FindNet('/'+net));b.AddNative(v);v.thisown=False
tr('GND',(8.175,9.0375),(10.955,9.0375),k.B_Cu)
tr('GND',(10.955,9.0375),(10.955,7.7675),k.B_Cu)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(base.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(base.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(d/'cap-ground-route-drc.json')],check=True)
q=json.loads((d/'cap-ground-route-drc.json').read_text());print(collections.Counter(v['type'] for v in q['violations']),len(q['unconnected_items']))
for v in q['violations']:
 if v['type'] not in ['track_dangling','via_dangling']:print(v)

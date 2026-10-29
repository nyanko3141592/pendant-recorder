from pathlib import Path
import pcbnew as k,wx,json,shutil,subprocess,collections
app=wx.App(False);d=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');src=d/'ground-island-join';dst=d/'ti-land';b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
for ext in ['.kicad_pro','.kicad_sch','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
f=next(f for f in b.GetFootprints() if f.GetReference()=='U16');center=f.GetPosition()
for p in f.Pads():
 pos=p.GetPosition();sign=1 if pos.y>center.y else -1;p.SetPosition(k.VECTOR2I(pos.x,center.y+sign*k.FromMM(1.1)));p.SetSize(k.VECTOR2I(k.FromMM(.95),k.FromMM(.4)));p.SetRoundRectCornerRadius(k.FromMM(.05))
# Expand courtyard along row-separation axis; retain existing transverse margin.
for item in f.GraphicalItems():
 if item.GetLayer()!=k.F_CrtYd:continue
 for name in ['Start','End']:
  pos=getattr(item,'Get'+name)();sign=1 if pos.y>center.y else -1;getattr(item,'Set'+name)(k.VECTOR2I(pos.x,center.y+sign*k.FromMM(1.825)))
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(d/'ti-land-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
q=json.loads((d/'ti-land-drc.json').read_text());print(collections.Counter(v['type'] for v in q['violations']),len(q['unconnected_items']),len(q['schematic_parity']))
for v in q['violations']:print(v)

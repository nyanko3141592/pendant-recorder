import pcbnew as k,wx,json
from pathlib import Path
app=wx.App(False);d=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');b=k.LoadBoard(str(d/'ground-island-join.kicad_pcb'));f=next(f for f in b.GetFootprints() if f.GetReference()=='U16');rows=[]
for p in f.Pads():rows.append({'number':p.GetNumber(),'net':p.GetNetname(),'position_mm':list(k.ToMM(p.GetPosition())),'size_mm':list(k.ToMM(p.GetSize())),'roundrect_radius_mm':k.ToMM(p.GetRoundRectCornerRadius())})
(d/'u16-pad-audit.json').write_text(json.dumps(rows,indent=2)+'\n');print(rows)

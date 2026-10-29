"""Preserve reviewed USB candidate; move TP3 away from acoustic seal land."""
from pathlib import Path
import wx,pcbnew as k,json,shutil
app=wx.App(False);P=Path(__file__).resolve().parent
b=k.LoadBoard(str(P/'xe-terminal-candidate.kicad_pcb'))
f=next(f for f in b.GetFootprints() if f.GetReference()=='TP3');old=f.GetPosition();new=k.VECTOR2I(old.x-k.FromMM(.6),old.y)
changed=0
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA):continue
 if t.GetStart()==old:t.SetStart(new);changed+=1
 if t.GetEnd()==old:t.SetEnd(new);changed+=1
assert changed==1,changed
f.SetPosition(new);k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'acoustic-clearance-candidate.kicad_pcb'),b)
print(json.dumps({'TP3_delta_mm':[-.6,0],'track_endpoints_moved':changed}))

for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(P/('xe-terminal-candidate'+ext),P/('acoustic-clearance-candidate'+ext))

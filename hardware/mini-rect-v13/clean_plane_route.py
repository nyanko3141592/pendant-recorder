"""Remove DRC-confirmed dangling vias, widen necks, refill after SES import."""
from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;b=k.LoadBoard(str(P/'plane-continuation.kicad_pcb'))
d=json.loads((P/'plane-continuation-drc.json').read_text())
ids={i['uuid'] for v in d['violations'] if v['type']=='via_dangling' for i in v['items']}
removed=0;widened=0
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in ids:
  assert isinstance(t,k.PCB_VIA);b.DeleteNative(t);removed+=1
 elif not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):t.SetWidth(k.FromMM(.1));widened+=1
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'plane-clean-candidate.kicad_pcb'),b)
shutil.copyfile(P/'plane-continuation.kicad_pro',P/'plane-clean-candidate.kicad_pro')
print('Removed',removed,'dangling vias; widened',widened,'necks; zones refilled. Recheck connectivity.')

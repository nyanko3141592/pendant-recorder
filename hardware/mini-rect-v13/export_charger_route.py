"""Prepare routing experiment; no stackup or impedance approval implied."""
from pathlib import Path
import re,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent
b=k.LoadBoard(str(P/'charger-packing-candidate.kicad_pcb'))
f=next(f for f in b.GetFootprints() if f.GetReference()=='J4');f.Reference().SetVisible(False)
n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass()
n.SetTrackWidth(k.FromMM(.127));n.SetClearance(k.FromMM(.1));n.SetViaDiameter(k.FromMM(.45));n.SetViaDrill(k.FromMM(.2))
k.SaveBoard(str(P/'charger-route-source.kicad_pcb'),b)
shutil.copyfile(P/'pendant-mini-rect-v13.kicad_pro',P/'charger-route-source.kicad_pro')
assert k.ExportSpecctraDSN(b,str(P/'charger-route-trial.dsn'))
f=P/'charger-route-trial.dsn';s=f.read_text()
# Keep In1 free of signal traces for future ground plane. In2 usage is provisional.
s=s.replace('(circuit\n','(circuit\n        (use_layer F.Cu In2.Cu B.Cu)\n')
f.write_text(s)
print('Exported4-layer routing experiment;0.45/0.20mm vias,0.127mm signals. In1 reserved.')

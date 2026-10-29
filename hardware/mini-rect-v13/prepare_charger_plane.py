"""Add reference plane, retain current routing and prepare continuation experiment."""
from pathlib import Path
import shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent
b=k.LoadBoard(str(P/'charger-width-candidate.kicad_pcb'))
z=k.ZONE(b);z.SetLayer(k.In1_Cu);z.SetNetCode(b.FindNet('/GND').GetNetCode());z.SetLocalClearance(k.FromMM(.15));z.SetPadConnection(k.ZONE_CONNECTION_FULL);z.SetMinThickness(k.FromMM(.1))
o=z.Outline();o.NewOutline()
for x,y in [(-1,-1),(22,-1),(22,24),(-1,24)]:o.Append(k.FromMM(x),k.FromMM(y))
b.Add(z);k.ZONE_FILLER(b).Fill(b.Zones())
n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetTrackWidth(k.FromMM(.127));n.SetClearance(k.FromMM(.1));n.SetViaDiameter(k.FromMM(.45));n.SetViaDrill(k.FromMM(.2))
k.SaveBoard(str(P/'charger-plane-source.kicad_pcb'),b)
shutil.copyfile(P/'charger-width-candidate.kicad_pro',P/'charger-plane-source.kicad_pro')
assert k.ExportSpecctraDSN(b,str(P/'charger-plane-continuation.dsn'))
p=P/'charger-plane-continuation.dsn';s=p.read_text().replace('(circuit\n','(circuit\n        (use_layer F.Cu In2.Cu B.Cu)\n');p.write_text(s)
print('In1 GND plane added; current routes preserved. Reference quality not yet verified.')

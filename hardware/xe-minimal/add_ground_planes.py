import pcbnew as k
import wx
app=wx.App(False)
import shutil,json
from pathlib import Path
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';out=O/'ground-plane-candidate';b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
gnd=next(p.GetNet() for f in b.GetFootprints() for p in f.Pads() if p.GetNetname()=='/GND')
assert not list(b.Zones())
for layer in [k.In1_Cu,k.In3_Cu]:
 z=k.ZONE(b);z.SetLayer(layer);z.SetNet(gnd);z.SetLocalClearance(k.FromMM(.15));z.SetPadConnection(k.ZONE_CONNECTION_FULL);z.SetMinThickness(k.FromMM(.1));o=z.Outline();o.NewOutline()
 for x,y in [(.3,.3),(23.7,.3),(23.7,26.7),(.3,26.7)]:o.Append(k.FromMM(x),k.FromMM(y))
 b.AddNative(z);z.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out.with_suffix('.kicad_pcb')),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
print('Two filled internal GND planes saved.')

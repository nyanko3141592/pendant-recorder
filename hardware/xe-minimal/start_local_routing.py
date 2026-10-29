import pcbnew
import wx
app=wx.App(False)
from pathlib import Path
import shutil
O=Path(__file__).resolve().parent;src=O/'through-signal-block-packing-24x27-NOT-ROUTED';out=O/'local-routing-candidate'
b=pcbnew.LoadBoard(str(src.with_suffix('.kicad_pcb')));fps={f.GetReference():f for f in b.GetFootprints()}
for ref in ['J3','TH1']:
 f=fps[ref];f.Reference().SetLayer(pcbnew.B_Fab if f.IsFlipped() else pcbnew.F_Fab);f.Reference().SetTextSize(pcbnew.VECTOR2I(pcbnew.FromMM(1),pcbnew.FromMM(1)))
p=next(p for p in fps['C13'].Pads() if p.GetNumber()=='1');q=next(p for p in fps['U3'].Pads() if p.GetNumber()=='10');assert p.GetNetname()==q.GetNetname() and fps['C13'].IsFlipped()==fps['U3'].IsFlipped()
t=pcbnew.PCB_TRACK(b);t.SetStart(p.GetPosition());t.SetEnd(q.GetPosition());t.SetWidth(pcbnew.FromMM(.15));t.SetLayer(pcbnew.B_Cu if fps['U3'].IsFlipped() else pcbnew.F_Cu);t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False
pcbnew.SaveBoard(str(out.with_suffix('.kicad_pcb')),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
print('C13 input capacitor to U3 input: trial track saved.')

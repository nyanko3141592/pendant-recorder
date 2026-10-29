from pathlib import Path
import shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'global-route-widths.kicad_pcb';out=P/'global-route-neck.kicad_pcb'
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
b=k.LoadBoard(str(src));old=k.VECTOR2I(k.FromMM(16.9506),k.FromMM(7.9347));new=k.VECTOR2I(k.FromMM(16.9706),k.FromMM(7.9447));n=0
for t in b.GetTracks():
 if t.GetNetname()!='/STATUS_LED':continue
 if isinstance(t,k.PCB_VIA):
  if t.GetPosition()==old:t.SetPosition(new)
  continue
 if t.GetStart()==old:t.SetStart(new);n+=1
 if t.GetEnd()==old:t.SetEnd(new);n+=1
assert n==2
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)

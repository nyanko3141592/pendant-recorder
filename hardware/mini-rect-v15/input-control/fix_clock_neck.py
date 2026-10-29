from pathlib import Path
import shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'input-route-widths.kicad_pcb';out=P/'input-route-neck.kicad_pcb'
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
b=k.LoadBoard(str(src));old=k.VECTOR2I(k.FromMM(21.9768),k.FromMM(8.379));new=k.VECTOR2I(k.FromMM(21.9968),k.FromMM(8.399));n=0
for t in b.GetTracks():
 if t.GetNetname()!='/USB_LATCH_CLOCK' or t.GetLayer()!=k.B_Cu:continue
 if t.GetStart()==old:t.SetStart(new);n+=1
 if t.GetEnd()==old:t.SetEnd(new);n+=1
assert n==2
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)

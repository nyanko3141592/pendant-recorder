"""Restore proven charger SYS escape and move crossing segment to another signal layer."""
from pathlib import Path
import shutil,json
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'usb-ground-extension.kicad_pcb';out=P/'usb-sys-escape.kicad_pcb';b=k.LoadBoard(str(src));old=k.LoadBoard(str(P/'acoustic-clearance-candidate.kicad_pcb'));net=b.FindNet('/SYS')
for t in list(b.GetTracks()):
 if t.GetNetname()=='/SYS':b.DeleteNative(t)
moved=[]
for t in old.GetTracks():
 if t.GetNetname()!='/SYS':continue
 c=t.Duplicate();c.SetNet(net)
 if not isinstance(t,k.PCB_VIA) and t.GetLayer()==k.In2_Cu and k.ToMM(t.GetLength())>5 and min(t.GetStart().y,t.GetEnd().y)>k.FromMM(16):
  moved.append(t.m_Uuid.AsString());continue
 b.Add(c)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
print('Moved long SYS segments',moved)

"""Repair imported sub-minimum neck widths without relaxing board constraints."""
from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'xe-route.kicad_pcb';out=P/'xe-route-widths.kicad_pcb';b=k.LoadBoard(str(src));n=0
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):t.SetWidth(k.FromMM(.1));n+=1
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
print('Widened',n,'necks to existing minimum 0.1mm; DRC required')

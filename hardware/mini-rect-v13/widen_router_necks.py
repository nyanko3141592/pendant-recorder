"""Correct router neck-downs below existing0.1mm board rule, never relax rule."""
from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent
b=k.LoadBoard(str(P/'route-trial.kicad_pcb'));changed=0
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):
  t.SetWidth(k.FromMM(.1));changed+=1
k.SaveBoard(str(P/'route-width-candidate.kicad_pcb'),b)
shutil.copyfile(P/'route-trial.kicad_pro',P/'route-width-candidate.kicad_pro')
print('Widened',changed,'neck-downs to existing0.1mm minimum; DRC must check new clearance')

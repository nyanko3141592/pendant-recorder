#!/usr/bin/env python3
import wx,pcbnew as k
from pathlib import Path
wx.App(False);p=Path(__file__).with_name('pendant-xe-minimal.kicad_pcb');b=k.LoadBoard(str(p));n=0
for v in b.GetTracks():
 if type(v) is not k.PCB_VIA:continue
 q=v.GetPosition()
 if ((abs(k.ToMM(q.x)-11.3625)<.001 and abs(k.ToMM(q.y)-0.95)<.001) or
     (abs(k.ToMM(q.x)-18.1)<.001 and abs(k.ToMM(q.y)-11.5)<.001)):
  assert v.GetNetname() in ('/VBUS_OVP','/PDM_DATA');v.SetFillingMode(k.FILLING_MODE_FILLED);v.SetCappingMode(k.CAPPING_MODE_CAPPED);n+=1
assert n==2;k.SaveBoard(str(p),b)

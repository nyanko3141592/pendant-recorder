#!/usr/bin/env python3
import wx, pcbnew as k
from pathlib import Path
wx.App(False)
p=Path(__file__).with_name('pendant-xe-minimal.kicad_pcb'); b=k.LoadBoard(str(p))
fps={f.GetReference():f for f in b.GetFootprints()}
fps['R51'].SetFPID(k.LIB_ID('Resistor_SMD','R_0402_1005Metric'))
fps['U13'].SetFPID(k.LIB_ID('Package_TO_SOT_SMD','SOT-23-6'))
k.SaveBoard(str(p),b)

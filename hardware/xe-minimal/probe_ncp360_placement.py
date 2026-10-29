#!/usr/bin/env python3
"""Create one unrouted NCP360 placement probe for DRC screening."""
import sys
import wx
import pcbnew as k

app=wx.App(False)
src,out,x,y,rotation,*cap_xy=sys.argv[1:]
b=k.LoadBoard(src)
lib="/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Package_TO_SOT_SMD.pretty"
u=k.FootprintLoad(lib,"SOT-23-5")
u.SetReference("U14"); u.SetValue("NCP360SNT1G")
u.SetPosition(k.VECTOR2I(k.FromMM(float(x)),k.FromMM(float(y))))
u.SetOrientationDegrees(float(rotation)); b.Add(u); k.SaveBoard(out,b)
if cap_xy:
    c=k.Cast_to_FOOTPRINT(b.FindFootprintByReference("C31").Duplicate(False))
    c.SetReference("C33"); c.SetValue("1u 35V X5R")
    c.SetPosition(k.VECTOR2I(k.FromMM(float(cap_xy[0])),k.FromMM(float(cap_xy[1]))))
    c.SetOrientationDegrees(0); b.Add(c); k.SaveBoard(out,b)

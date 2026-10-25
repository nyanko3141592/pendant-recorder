"""Local clearance repair after route import, preserving the 0.10mm rule."""
from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parents[1]/'compact-b/electrical-placement-v3/compact-b.kicad_pcb'
b=k.LoadBoard(str(P));changes=0
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA):continue
 for getter,setter in [(t.GetStart,t.SetStart),(t.GetEnd,t.SetEnd)]:
  pt=getter();x,y=k.ToMM(pt.x),k.ToMM(pt.y)
  if abs(x-5.6479)<.0002 and any(abs(y-yy)<.0002 for yy in [6.7921,6.8007]):
   setter(k.VECTOR2I(pt.x-k.FromMM(.060),pt.y));changes+=1
print('Moved shared V3V3 segment endpoints:',changes)
assert changes==4, 'Unexpected input board; do not apply twice'
k.SaveBoard(str(P),b)

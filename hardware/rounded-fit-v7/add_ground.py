from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;fn=P/'pendant-compact-100-v5.kicad_pcb';b=k.LoadBoard(str(fn))
assert b.GetAreaCount()==0,'Refuse duplicate zones'
for layer in [k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu]:
 z=k.ZONE(b);z.SetLayer(layer);z.SetNetCode(b.FindNet('/GND').GetNetCode());z.SetLocalClearance(k.FromMM(.1));z.SetPadConnection(k.ZONE_CONNECTION_FULL);z.SetMinThickness(k.FromMM(.1));o=z.Outline();o.NewOutline()
 for x,y in [(0,0),(24,0),(24,27),(0,27)]:o.Append(k.FromMM(x),k.FromMM(y))
 b.Add(z)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(fn),b)
print('Added six ground pours; not continuous reference planes, require review')

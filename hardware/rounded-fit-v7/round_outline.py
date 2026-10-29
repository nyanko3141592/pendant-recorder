from pathlib import Path
import math,wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;f=P/'pendant-compact-100-v5.kicad_pcb';b=k.LoadBoard(str(f))
for d in list(b.GetDrawings()):
 if d.GetLayer()==k.Edge_Cuts:b.Remove(d)
def pt(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def line(a,z):
 s=k.PCB_SHAPE();s.SetShape(k.SHAPE_T_SEGMENT);s.SetStart(pt(*a));s.SetEnd(pt(*z));s.SetLayer(k.Edge_Cuts);s.SetWidth(k.FromMM(.05));b.Add(s)
def arc(cx,cy,a,z):
 def p(v):return pt(cx+4*math.cos(math.radians(v)),cy+4*math.sin(math.radians(v)))
 s=k.PCB_SHAPE();s.SetShape(k.SHAPE_T_ARC);s.SetArcGeometry(p(a),p((a+z)/2),p(z));s.SetLayer(k.Edge_Cuts);s.SetWidth(k.FromMM(.05));b.Add(s)
x=4-math.sqrt(12)
line((x,0),(24-x,0));arc(20,2,-30,0);line((24,2),(24,23));arc(20,23,0,90);line((20,27),(4,27));arc(4,23,90,180);line((0,23),(0,2));arc(4,2,180,210)
k.SaveBoard(str(f),b)

"""Export conservative object boxes and actual filled-zone polygons for tab screening."""
from pathlib import Path
import json,hashlib
import pcbnew as k,wx
app=wx.App(False);P=Path(__file__).resolve().parent
src=P/'fixed-usb-limit-trial/ncu-sensor-trial/pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(src))
def box(o):
 v=o.GetBoundingBox();return [k.ToMM(v.GetX()),k.ToMM(v.GetY()),k.ToMM(v.GetRight()),k.ToMM(v.GetBottom())]
def ring(c):return [[k.ToMM(c.CPoint(i).x),k.ToMM(c.CPoint(i).y)] for i in range(c.PointCount())]
objects=[]
for f in b.GetFootprints():
 for p in f.Pads():
  if p.GetLayerSet().CuStack():objects.append({'kind':'pad_box','ref':f.GetReference()+'.'+p.GetNumber(),'net':p.GetNetname(),'bounds':box(p)})
for t in b.GetTracks():objects.append({'kind':'via_box' if isinstance(t,k.PCB_VIA) else 'track_box','net':t.GetNetname(),'bounds':box(t)})
zones=[]
for z in b.Zones():
 for l in z.GetLayerSet().CuStack():
  ps=z.GetFilledPolysList(l)
  for i in range(ps.OutlineCount()):zones.append({'net':z.GetNetname(),'layer':b.GetLayerName(l),'outer':ring(ps.COutline(i)),'holes':[ring(ps.CHole(i,j)) for j in range(ps.HoleCount(i))]})
r={'source':str(src),'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'objects':objects,'zones':zones}
(P/'current-carrier-copper-geometry.json').write_text(json.dumps(r)+'\n');print(len(objects),'objects',len(zones),'zone islands')

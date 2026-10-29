from pathlib import Path
import json,math
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;b=k.LoadBoard(str(P/'pb1-rejected-SD_EN.kicad_pcb'));nodes=[]
for z in b.Zones():
 if z.GetNetname()!='/GND':continue
 p=z.GetFilledPolysList(z.GetLayer())
 for i in range(p.OutlineCount()):nodes.append((z.GetLayer(),p,i))
parent=list(range(len(nodes)))
def root(i):
 while parent[i]!=i:parent[i]=parent[parent[i]];i=parent[i]
 return i
def join(ids):
 if ids:
  a=root(ids[0])
  for i in ids[1:]:parent[root(i)]=a
for t in b.GetTracks():
 if t.GetNetname()!='/GND':continue
 if isinstance(t,k.PCB_VIA):pts=[t.GetPosition()];layers=set(b.GetEnabledLayers().CuStack())
 else:
  a,z=t.GetStart(),t.GetEnd();n=max(1,math.ceil(k.ToMM(t.GetLength())/.1));pts=[k.VECTOR2I(round(a.x+(z.x-a.x)*u/n),round(a.y+(z.y-a.y)*u/n)) for u in range(n+1)];layers={t.GetLayer()}
 ids=[j for j,(l,p,i) in enumerate(nodes) if l in layers and any(p.Contains(q,i) for q in pts)];join(ids)
for f in b.GetFootprints():
 for pad in f.Pads():
  if pad.GetNetname()!='/GND':continue
  join([j for j,(l,p,i) in enumerate(nodes) if pad.IsOnLayer(l) and p.Contains(pad.GetPosition(),i)])
groups={}
for j,(l,p,i) in enumerate(nodes):
 bb=p.COutline(i).BBox();groups.setdefault(root(j),[]).append(dict(layer=b.GetLayerName(l),node=j,box_mm=[k.ToMM(bb.GetX()),k.ToMM(bb.GetY()),k.ToMM(bb.GetWidth()),k.ToMM(bb.GetHeight())]))

for f in b.GetFootprints():
 for pad in f.Pads():
  if pad.GetNetname()=='/GND':
   ids=[j for j,(l,p,i) in enumerate(nodes) if pad.IsOnLayer(l) and p.Contains(pad.GetPosition(),i)]
   print('PAD',f.GetReference(),pad.GetNumber(),ids)
(P/'ground-islands.json').write_text(json.dumps({'status':'SAMPLED_CONNECTIVITY_DIAGNOSTIC','groups':list(groups.values())},indent=2)+'\n');print(json.dumps(list(groups.values()),indent=2))

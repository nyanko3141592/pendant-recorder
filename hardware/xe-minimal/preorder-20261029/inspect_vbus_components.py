from pathlib import Path
import pcbnew as k,wx,json
app=wx.App(False);w=Path(__file__).resolve().parent;b=k.LoadBoard(str(w/'corridor-multilayer-centered.kicad_pcb'));net='/VBUS_CHARGER';layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu];items=[t for t in b.GetTracks() if t.GetNetname()==net]+[p for f in b.GetFootprints() for p in f.Pads() if p.GetNetname()==net];shapes=[{l:t.GetEffectiveShape(l) for l in layers if t.IsOnLayer(l)} for t in items];groups=[];unseen=set(range(len(items)))
while unseen:
 group={unseen.pop()};queue=list(group)
 while queue:
  i=queue.pop()
  for j in list(unseen):
   if any(shapes[i][l].Collide(shapes[j][l],0) for l in shapes[i].keys()&shapes[j].keys()):group.add(j);unseen.remove(j);queue.append(j)
 groups.append(group)
r=[]
for g in groups:
 rows=[]
 for i in g:
  t=items[i];row={'uuid':str(t.m_Uuid.AsString()),'kind':type(t).__name__,'layers':[b.GetLayerName(l) for l in shapes[i]]}
  if isinstance(t,k.PAD):row.update(ref=t.GetParentFootprint().GetReference(),pin=t.GetNumber(),xy=[k.ToMM(t.GetPosition().x),k.ToMM(t.GetPosition().y)])
  else:row.update(start=[k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y)],end=[k.ToMM(t.GetEnd().x),k.ToMM(t.GetEnd().y)])
  rows.append(row)
 r.append(rows)
(w/'vbus-connected-components.json').write_text(json.dumps(r,indent=2)+'\n');print([(len(g),[r for r in g if r['kind']=='PAD']) for g in r])

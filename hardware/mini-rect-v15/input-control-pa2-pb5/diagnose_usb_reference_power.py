"""Classify missing adjacent ground coverage without treating it as an SI pass."""
from pathlib import Path
import wx,pcbnew as k,json,hashlib,collections
app=wx.App(False);P=Path(__file__).resolve().parent;src=P/'usb-reference-power.kicad_pcb';b=k.LoadBoard(str(src));r=json.loads(src.with_suffix('.usb-reference-review.json').read_text());assert r['source_sha256']==hashlib.sha256(src.read_bytes()).hexdigest()
layer_ids={b.GetLayerName(l):l for l in b.GetEnabledLayers().CuStack()};rows=[];counts=collections.Counter();details={}
for s in r['uncovered_samples']:
 q=k.VECTOR2I(k.FromMM(s['x_mm']),k.FromMM(s['y_mm']));hits=[]
 for lname in s['reference_layers']:
  layer=layer_ids[lname];zones=[z for z in b.Zones() if z.GetLayer()==layer and z.GetNetname()=='/GND'];clear=max((k.ToMM(z.GetLocalClearance()) for z in zones),default=.15)
  items=[t for t in b.GetTracks() if t.GetNetname()!='/GND' and (isinstance(t,k.PCB_VIA) or t.GetLayer()==layer)]
  items += [p for f in b.GetFootprints() for p in f.Pads() if p.IsOnLayer(layer) and p.GetNetname()!='/GND']
  for t in items:
   if not t.HitTest(q,k.FromMM(clear+.001)):continue
   uid=t.m_Uuid.AsString();key=(s['layer'],t.GetNetname(),uid);counts[key]+=1;hits.append(dict(uuid=uid,reference_layer=lname,net=t.GetNetname(),kind=type(t).__name__))
   details[uid]=dict(position_mm=[k.ToMM(t.GetPosition().x),k.ToMM(t.GetPosition().y)],kind=type(t).__name__)
 rows.append(dict(**s,obstacles=hits))
summary=[dict(signal_layer=l,obstacle_net=n,uuid=u,samples=c,**details[u]) for (l,n,u),c in counts.most_common()]
out=dict(status='DIAGNOSTIC_NOT_SI_APPROVAL',source_sha256=r['source_sha256'],summary=summary,samples=rows,samples_without_local_obstacle=sum(not x['obstacles'] for x in rows),limitations=['Point/HitTest diagnostic only; holes, isolation, plane edges and geometry tolerances need review','Obstacle counts can overlap across references','USB own via clearance is expected at transitions but does not prove a good return path']);(P/'usb-reference-power-obstacles.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(summary,indent=2));print('without obstacle',out['samples_without_local_obstacle'])

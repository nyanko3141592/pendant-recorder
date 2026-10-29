"""Identify copper clearance obstacles at uncovered B.Cu USB centerline samples."""
from pathlib import Path
import wx,pcbnew as k,json,hashlib,collections
app=wx.App(False);P=Path(__file__).resolve().parent
src=P/'usb-cc2-search-candidate.kicad_pcb';b=k.LoadBoard(str(src))
r=json.loads(src.with_suffix('.usb-reference-review.json').read_text());assert r['source_sha256']==hashlib.sha256(src.read_bytes()).hexdigest()
zone_clearance=max(k.ToMM(z.GetLocalClearance()) for z in b.Zones() if z.GetLayer()==k.In2_Cu and z.GetNetname()=='/GND')
items=[]
for t in b.GetTracks():
 if t.GetNetname()=='/GND':continue
 if isinstance(t,k.PCB_VIA) or t.GetLayer()==k.In2_Cu:items.append(t)
for f in b.GetFootprints():
 for p in f.Pads():
  if p.IsOnLayer(k.In2_Cu) and p.GetNetname()!='/GND':items.append(p)
rows=[];counts=collections.Counter();details={}
for s in r['uncovered_samples']:
 if s['layer']!='B.Cu':continue
 q=k.VECTOR2I(k.FromMM(s['x_mm']),k.FromMM(s['y_mm']));hits=[]
 for t in items:
  if not t.HitTest(q,k.FromMM(zone_clearance+.001)):continue
  uid=t.m_Uuid.AsString();key=(s['net'],t.GetNetname(),uid);counts[key]+=1;hits.append(uid)
  details[uid]={'net':t.GetNetname(),'kind':type(t).__name__,'position_mm':[k.ToMM(t.GetPosition().x),k.ToMM(t.GetPosition().y)]}
  if isinstance(t,k.PCB_TRACK) and not isinstance(t,k.PCB_VIA):details[uid].update(start_mm=[k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y)],end_mm=[k.ToMM(t.GetEnd().x),k.ToMM(t.GetEnd().y)])
 rows.append(dict(signal=s['net'],x_mm=s['x_mm'],y_mm=s['y_mm'],clearance_obstacles=hits))
summary=[dict(signal=a,obstacle_net=n,uuid=u,samples=c,**{k:v for k,v in details[u].items() if k!='net'}) for (a,n,u),c in counts.most_common()]
out={'source_sha256':r['source_sha256'],'zone_clearance_mm':zone_clearance,'status':'DIAGNOSTIC_NOT_SIGNAL_INTEGRITY_PROOF','summary':summary,'uncovered_without_local_obstacle':sum(not s['clearance_obstacles'] for s in rows),'samples':rows,'limitations':['HitTest uses zone local clearance plus 1 um around item geometry, not full trace width','Missing island connectivity may create a gap even without a nearby obstacle','Counts overlap where multiple obstacles hit one sample']}
(P/'usb-reference-gap-obstacles.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='samples'},indent=2))

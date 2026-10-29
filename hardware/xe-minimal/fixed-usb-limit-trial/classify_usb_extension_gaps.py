from pathlib import Path
import pcbnew as k,wx,json,math,hashlib
from collections import Counter
app=wx.App(False);O=Path(__file__).resolve().parent/'usb-pair-far-extension-trial';p=O/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p));d=json.loads((O/'delta-plane-review.json').read_text());assert d['source_sha256'][O.name]==hashlib.sha256(p.read_bytes()).hexdigest()
def xy(v):return [k.ToMM(v.x),k.ToMM(v.y)]
def dist(p,a,c):
 dx,dy=c[0]-a[0],c[1]-a[1];l=dx*dx+dy*dy;t=max(0,min(1,((p[0]-a[0])*dx+(p[1]-a[1])*dy)/l))if l else 0
 return math.dist(p,[a[0]+dx*t,a[1]+dy*t])
rows=[]
for r in d['reference_samples']:
 if r['board']!=O.name:continue
 for q in r['missing']:
  layer=b.GetLayerID(q['reference']);matches=[]
  for t in b.GetTracks():
   via=isinstance(t,k.PCB_VIA)
   if t.GetNetname()=='/GND' or not t.IsOnLayer(layer):continue
   edge=dist(q['xy_mm'],xy(t.GetStart()),xy(t.GetEnd()))-k.ToMM(t.GetWidth(layer)if via else t.GetWidth())/2
   if edge<=.151:matches.append({'net':t.GetNetname(),'uuid':t.m_Uuid.AsString(),'type':'via'if via else'track','position_mm':xy(t.GetStart()),'edge_distance_mm':edge})
  rows.append({'signal':r['net'],'track_uuid':r['uuid'],**q,'sources':matches})
sources={}
for r in rows:
 for m in r['sources']:
  x=sources.setdefault(m['uuid'],{**m,'sample_count':0,'signals':set()});x['sample_count']+=1;x['signals'].add(r['signal'])
for x in sources.values():x['signals']=sorted(x['signals'])
out={'status':'GEOMETRIC_ATTRIBUTION_NOT_FIELD_ANALYSIS','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'sources':sources,'unattributed_samples':sum(not r['sources']for r in rows),'samples':rows,'limits':['0.151mm clearance-radius screen is attribution only','Pads and zone boundaries not included; unmatched points remain unresolved','Do not reduce required copper clearance to hide missing ground']};(O/'gap-source-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'sources':sources,'unattributed':out['unattributed_samples']},indent=2))

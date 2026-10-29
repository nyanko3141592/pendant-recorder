"""Attribute sampled reference-copper gaps; not a field/impedance solution."""
from pathlib import Path
import pcbnew as k,wx,json,math,hashlib
from collections import Counter
app=wx.App(False);O=Path(__file__).resolve().parent/'led-land-trial';p=O/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p));prior=O/'route-delta-plane-review.json';report=json.loads(prior.read_text())
assert hashlib.sha256(p.read_bytes()).hexdigest()in report['source_sha256'].values()
def xy(v):return [k.ToMM(v.x),k.ToMM(v.y)]
def distance(p,a,z):
 dx,dy=z[0]-a[0],z[1]-a[1];t=max(0,min(1,((p[0]-a[0])*dx+(p[1]-a[1])*dy)/(dx*dx+dy*dy)))if dx or dy else 0
 return math.dist(p,[a[0]+t*dx,a[1]+t*dy])
rows=[]
for net in ['/USB_DP','/USB_DM']:
 for point in report['filled_ground_centerline_comparison'][net]['absent_before_and_after_samples']:
  pos=point['point_mm'];layer=b.GetLayerID(point['reference_layer']);matches=[]
  for t in b.GetTracks():
   via=isinstance(t,k.PCB_VIA)
   if t.GetNetname()=='/GND' or (not via and t.GetLayer()!=layer):continue
   radius=k.ToMM(t.GetWidth(layer)if via else t.GetWidth())/2
   edge=distance(pos,xy(t.GetStart()),xy(t.GetEnd()))-radius
   if edge<=.151:matches.append({'type':'via'if via else'track','net':t.GetNetname(),'uuid':t.m_Uuid.AsString(),'edge_distance_mm':edge,'start_mm':xy(t.GetStart()),'end_mm':xy(t.GetEnd())})
  for f in b.GetFootprints():
   for q in f.Pads():
    if q.GetNetname()=='/GND' or not q.IsOnLayer(layer):continue
    box=q.GetBoundingBox();left,top,right,bottom=[k.ToMM(v)for v in [box.GetX(),box.GetY(),box.GetRight(),box.GetBottom()]]
    edge=math.hypot(max(left-pos[0],0,pos[0]-right),max(top-pos[1],0,pos[1]-bottom))
    if edge<=.151:matches.append({'type':'pad_bbox','net':q.GetNetname(),'ref':f.GetReference(),'pad':q.GetNumber(),'uuid':q.m_Uuid.AsString(),'edge_distance_mm':edge})
  category='own_signal_clearance' if matches and all(m['net']==net for m in matches)else 'other_net_or_mixed' if matches else 'unattributed'
  rows.append({'signal':net,**point,'category':category,'potential_clearance_sources':matches})
signal_vias={m['uuid'] for row in rows for m in row['potential_clearance_sources'] if m['type']=='via'}
stitches=[t for t in b.GetTracks()if isinstance(t,k.PCB_VIA)and t.GetNetname()=='/GND']
transitions=[]
for t in b.GetTracks():
 if t.m_Uuid.AsString()not in signal_vias:continue
 closest=sorted(stitches,key=lambda g:math.dist(xy(g.GetPosition()),xy(t.GetPosition())))[:3]
 transitions.append({'signal':t.GetNetname(),'via_uuid':t.m_Uuid.AsString(),'point_mm':xy(t.GetPosition()),'nearest_GND_vias':[{'point_mm':xy(g.GetPosition()),'distance_mm':math.dist(xy(g.GetPosition()),xy(t.GetPosition())),'uuid':g.m_Uuid.AsString()}for g in closest]})
r={'status':'USB_GAP_GEOMETRY_CLASSIFICATION_NOT_SI_QUALIFIED','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'input_sha256':hashlib.sha256(prior.read_bytes()).hexdigest(),'counts':dict(Counter(row['category']for row in rows)),'rows':rows,'transition_ground_vias':transitions,'limitations':['Uses centerline samples and 0.15mm zone-clearance geometry with 0.001mm screening allowance.','Pad bbox checks are conservative; vias use circular copper radius.','Attribution to own signal vias does not prove acceptable transition inductance, differential impedance or ground stitching.','Nearest GND via distance is only layout evidence, not an acceptance threshold or proof of plane connectivity.','Does not remove, refill or waive any required clearance.']}
(O/'usb-ground-gap-classification.json').write_text(json.dumps(r,indent=2)+'\n');print(r['counts']);print('Source items:',sorted({(m['type'],m['net'],m['uuid'])for row in rows for m in row['potential_clearance_sources']}))

print('Nearest GND distances:', [(t['signal'],t['point_mm'],t['nearest_GND_vias'][0]['distance_mm']) for t in transitions])

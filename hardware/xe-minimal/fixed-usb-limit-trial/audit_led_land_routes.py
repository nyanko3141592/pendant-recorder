from pathlib import Path
import pcbnew as k,wx,json,hashlib,math
app=wx.App(False);D=Path(__file__).resolve().parent;O=D/'led-land-trial'
paths=[D/'buttonless-trial/pendant-xe-minimal.kicad_pcb',O/'pendant-xe-minimal.kicad_pcb'];old,b=[k.LoadBoard(str(p))for p in paths]
def xy(v):return [k.ToMM(v.x),k.ToMM(v.y)]
def data(t):
 via=isinstance(t,k.PCB_VIA)
 return [t.GetNetname(),xy(t.GetStart()),xy(t.GetEnd()),k.ToMM(t.GetWidth(t.TopLayer()) if via else t.GetWidth()),b.GetLayerName(t.GetLayer()),k.ToMM(t.GetDrillValue())if via else None]
a={t.m_Uuid.AsString():data(t)for t in old.GetTracks()};z={t.m_Uuid.AsString():data(t)for t in b.GetTracks()}
removed=sorted(a.keys()-z.keys());added=sorted(z.keys()-a.keys());changed=sorted(u for u in a.keys()&z.keys() if a[u]!=z[u])
assert all(a[u][0]in ['/STATUS_LED_A','/GND']for u in removed+changed)
assert all(z[u][0]in ['/STATUS_LED_A','/GND']for u in added+changed)
def nets(board):return sorted((f.GetReference(),p.GetNumber(),p.GetNetname())for f in board.GetFootprints()for p in f.Pads())
assert nets(old)==nets(b)
def dpt(p,a,z):
 dx,dy=z[0]-a[0],z[1]-a[1];t=max(0,min(1,((p[0]-a[0])*dx+(p[1]-a[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.dist(p,[a[0]+t*dx,a[1]+t*dy])
def cross(a,b,c):return (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0])
def ds(a,z,c,d):
 if cross(a,z,c)*cross(a,z,d)<0 and cross(c,d,a)*cross(c,d,z)<0:return 0
 return min(dpt(a,c,d),dpt(z,c,d),dpt(c,a,z),dpt(d,a,z))
controls=[t for t in b.GetTracks()if t.GetNetname()=='/STATUS_LED_A']
signals=[t for t in b.GetTracks()if t.GetNetname() in ['/USB_DP','/USB_DM','/PDM_CLK','/PDM_DATA','/SD_CLK']]
rows=[]
for t in controls:
 for u in signals:
  td,ud=data(t),data(u);distance=ds(td[1],td[2],ud[1],ud[2]);rows.append({'signal':ud[0],'signal_layer':ud[4],'LED_layer':td[4],'LED_is_via':isinstance(t,k.PCB_VIA),'signal_is_via':isinstance(u,k.PCB_VIA),'projected_edge_gap_mm':distance-(td[3]+ud[3])/2,'LED_start_end_mm':td[1:3],'signal_start_end_mm':ud[1:3]})
nearest={net:sorted((r for r in rows if r['signal']==net),key=lambda r:r['projected_edge_gap_mm'])[:3]for net in sorted({r['signal']for r in rows})}
zones=[{'layer':b.GetLayerName(q.GetLayer()),'net':q.GetNetname(),'clearance_mm':k.ToMM(q.GetLocalClearance())}for q in b.Zones()]
# Compare actual filled GND copper under sampled signal centerlines.
# F references nearest GND In1; B/In4 reference GND In3 through intervening routing layer.
reference={k.F_Cu:k.In1_Cu,k.B_Cu:k.In3_Cu,k.In4_Cu:k.In3_Cu}
def covered(board,layer,point):
 return any(q.GetNetname()=='/GND' and q.GetLayer()==layer and q.GetFilledPolysList(layer).Contains(point) for q in board.Zones())
coverage={}
for t in signals:
 if isinstance(t,k.PCB_VIA) or t.GetLayer() not in reference:continue
 layer=reference[t.GetLayer()];net=t.GetNetname();entry=coverage.setdefault(net,{'samples':0,'lost_ground_samples':[],'gained_ground_samples':[],'absent_before_and_after_count':0,'absent_before_and_after_samples':[]})
 start,end=t.GetStart(),t.GetEnd();steps=max(1,math.ceil(math.dist(xy(start),xy(end))/.05))
 for n in range(steps+1):
  point=k.VECTOR2I(round(start.x+(end.x-start.x)*n/steps),round(start.y+(end.y-start.y)*n/steps))
  was,now=covered(old,layer,point),covered(b,layer,point);entry['samples']+=1
  item={'point_mm':xy(point),'reference_layer':b.GetLayerName(layer)}
  if was and not now:entry['lost_ground_samples'].append(item)
  if now and not was:entry['gained_ground_samples'].append(item)
  if not was and not now:
   entry['absent_before_and_after_count']+=1;entry['absent_before_and_after_samples'].append(item)
r={'status':'EXPECTED_NET_DELTA_PASS_GEOMETRIC_PLANE_SCREEN_ONLY','source_sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest()for p in paths},'pad_net_assignments_unchanged':True,'retained_unmodified_routes':len(a.keys()&z.keys())-len(changed),'removed_routes':[{'uuid':u,'data':a[u]}for u in removed],'added_routes':[{'uuid':u,'data':z[u]}for u in added],'changed_routes':[{'uuid':u,'before':a[u],'after':z[u]}for u in changed],'nearest_projections':nearest,'zones':zones,'filled_ground_centerline_comparison':coverage,'limits':['Negative projected edge gaps on different layers are not shorts; they identify locations for return-path review.','Includes complete LED net, not only new segments.','Zone slots, via antipads, stackup, stitch paths and impedance require separate verification.','Ground coverage sampled every <=0.05mm at centerline only; not a trace-width corridor or continuous field solution.','No signal-integrity or runtime qualification.']}
(O/'route-delta-plane-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'delta_counts':[len(removed),len(added),len(changed)],'nearest':{n:v[0]for n,v in nearest.items()},'zones':zones,'ground_coverage':{n:{'samples':v['samples'],'lost':len(v['lost_ground_samples']),'gained':len(v['gained_ground_samples']),'preexisting_absent':v['absent_before_and_after_count']}for n,v in coverage.items()}},indent=2))

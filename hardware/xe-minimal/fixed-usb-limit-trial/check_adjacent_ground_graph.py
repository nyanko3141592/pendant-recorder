"""Check filled ground region connectivity through plated through-via centers."""
from pathlib import Path
import pcbnew as k,wx,json,hashlib,collections,math
app=wx.App(False);O=Path(__file__).resolve().parent/(__import__('sys').argv[1] if len(__import__('sys').argv)>1 else 'usb-adjacent-via-trial');p=O/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p));regions=[]
for layer in [k.In1_Cu,k.In3_Cu,k.In4_Cu]:
 for z in b.Zones():
  if z.GetNetname()!='/GND'or not z.IsOnLayer(layer):continue
  poly=z.GetFilledPolysList(layer)
  for i in range(poly.OutlineCount()):regions.append((f'{b.GetLayerName(layer)}:{z.m_Uuid.AsString()}:{i}',layer,poly,i))
def memberships(point,layer=None):return[n for n,l,poly,i in regions if (layer is None or l==layer)and poly.Contains(point,i)]
graph=collections.defaultdict(list);vias={}
for v in b.GetTracks():
 if not isinstance(v,k.PCB_VIA)or v.GetNetname()!='/GND':continue
 assert v.TopLayer()==k.F_Cu and v.BottomLayer()==k.B_Cu
 uid=v.m_Uuid.AsString();mem=memberships(v.GetPosition());vias[uid]={'xy_mm':[k.ToMM(v.GetPosition().x),k.ToMM(v.GetPosition().y)],'regions':mem}
 for a in mem:
  for z in mem:
   if a!=z:graph[a].append((z,uid))
anchor=k.VECTOR2I(k.FromMM(17.5),k.FromMM(13));targets=memberships(anchor,k.In3_Cu);assert len(targets)==1;target=targets[0]
rows=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA)or t.GetLayer()!=k.B_Cu or t.GetNetname()not in ['/USB_DP','/USB_DM']:continue
 a,z=t.GetStart(),t.GetEnd();mid=k.VECTOR2I((a.x+z.x)//2,(a.y+z.y)//2);dx,dy=z.x-a.x,z.y-a.y;length=math.hypot(dx,dy);nx,ny=-dy/length,dx/length
 rectangle=k.SHAPE_POLY_SET();rectangle.NewOutline()
 for point,side in [(a,1),(z,1),(z,-1),(a,-1)]:rectangle.Append(round(point.x+nx*t.GetWidth()/2*side),round(point.y+ny*t.GetWidth()/2*side))
 starts=[]
 for name,layer,poly,i in regions:
  if layer!=k.In4_Cu:continue
  region=k.SHAPE_POLY_SET();region.AddOutline(poly.COutline(i))
  for j in range(poly.HoleCount(i)):region.AddHole(poly.CHole(i,j),0)
  hit=k.SHAPE_POLY_SET();hit.BooleanIntersection(rectangle,region)
  if hit.Area()>100:starts.append(name)
 assert starts
 for start in starts:
  queue=collections.deque([(start,[])]);seen={start};path=None
  while queue:
   node,edges=queue.popleft()
   if node==target:path=edges;break
   for nxt,uid in sorted(graph[node],key=lambda edge:math.dist(vias[edge[1]]['xy_mm'],[k.ToMM(mid.x),k.ToMM(mid.y)])):
    if nxt not in seen:seen.add(nxt);queue.append((nxt,edges+[{'from':node,'to':nxt,'via':uid,'xy_mm':vias[uid]['xy_mm']}]))
  rows.append({'usb_uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'track_midpoint_for_path_sort_mm':[k.ToMM(mid.x),k.ToMM(mid.y)],'start_region':start,'path_to_anchor_region':path})
assert len({x['usb_uuid']for x in rows})==6 and all(x['path_to_anchor_region']is not None for x in rows)
r={'status':'ALL_INTERSECTING_REGIONS_FOR_SIX_SEGMENTS_CONNECTED_NOT_USB_RETURN_PATH_QUALIFICATION','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'anchor_mm':[17.5,13],'target_region':target,'ground_vias_examined':len(vias),'regions':len(regions),'rows':rows,'limits':['All In4 ground regions intersecting six track rectangles are checked; uncovered areas, end caps and via barrels are not treated as ground','Graph models via-center membership only; plated barrel continuity is assumed','Paths minimize hop count then proximity, not inductance or return-current distribution','Ground traces, pads and same-layer narrow neck impedances are not modeled','No physical measurement, field solution or USB eye qualification']}
(O/'ground-connectivity-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

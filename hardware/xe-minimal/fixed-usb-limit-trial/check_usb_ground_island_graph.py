from pathlib import Path
import pcbnew as k,wx,json,hashlib,collections,math
app=wx.App(False);O=Path(__file__).resolve().parent/'usb-reference-via-small-trial';p=O/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p));regions=[]
for layer in [k.In1_Cu,k.In3_Cu]:
 for z in b.Zones():
  if z.GetNetname()!='/GND'or not z.IsOnLayer(layer):continue
  poly=z.GetFilledPolysList(layer)
  for i in range(poly.OutlineCount()):regions.append((f'{b.GetLayerName(layer)}:{z.m_Uuid.AsString()}:{i}',layer,poly,i))
def memberships(point):return [n for n,_,poly,i in regions if poly.Contains(point,i)]
graph=collections.defaultdict(list);via_info={}
for v in b.GetTracks():
 if not isinstance(v,k.PCB_VIA)or v.GetNetname()!='/GND':continue
 uid=v.m_Uuid.AsString();mem=memberships(v.GetPosition());via_info[uid]={'position_mm':[k.ToMM(v.GetPosition().x),k.ToMM(v.GetPosition().y)],'regions':mem}
 for a in mem:
  for c in mem:
   if a!=c:graph[a].append((c,uid))
anchor=k.VECTOR2I(k.FromMM(17.5),k.FromMM(13));target=next(n for n in memberships(anchor)if n.startswith('In3.Cu:'));local_uid='28e662aa-59b0-4121-9606-0d311a774d58';start=next(n for n in via_info[local_uid]['regions']if n.startswith('In3.Cu:'))
queue=collections.deque([(start,[])]);seen={start};path=None
while queue:
 node,edges=queue.popleft()
 if node==target:path=edges;break
 # Prioritize the known local transition stitch for the first hop.
 edges_out=sorted(graph[node],key=lambda x:(x[1]!=local_uid,math.dist(via_info[x[1]]['position_mm'],via_info[local_uid]['position_mm'])))
 for other,uid in edges_out:
  if other not in seen:seen.add(other);queue.append((other,edges+[{'from':node,'to':other,'via_uuid':uid,'via_position_mm':via_info[uid]['position_mm']}]))
r={'status':'FILLED_REGION_VIA_TOPOLOGY_PATH_FOUND'if path is not None else'NO_PATH_IN_LIMITED_GRAPH','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'start_region':start,'target_region':target,'path':path,'region_count':len(regions),'ground_vias_examined':len(via_info),'limits':['Graph uses filled polygon membership of via centers on In1/In3 only','Assumes normal plated through-via electrical continuity; physical plating unmeasured','Path minimizes graph hops, not geometric distance, loop area or inductance','A connection path does not qualify USB return currents or signal integrity']};(O/'usb-ground-island-graph.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

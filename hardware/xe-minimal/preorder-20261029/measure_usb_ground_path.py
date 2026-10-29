from pathlib import Path
import pcbnew as k,wx,json,math,heapq
app=wx.App(False);w=Path(__file__).resolve().parent;b=k.LoadBoard(str(w/'local-return-centered.kicad_pcb'));zones={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if z.GetNetname()=='/GND' and not z.GetIsRuleArea()};poly=zones[k.In2_Cu];start=(20.42765,9.0175);a=k.VECTOR2I(k.FromMM(start[0]),k.FromMM(start[1]));assert poly.Contains(a);targets=[v.GetPosition() for v in b.GetTracks() if isinstance(v,k.PCB_VIA) and v.GetNetname()=='/GND' and all(z.Contains(v.GetPosition()) for z in zones.values())];step=.025
point=lambda n:k.VECTOR2I(a.x+k.FromMM(n[0]*step),a.y+k.FromMM(n[1]*step))
def h(n):p=point(n);return min(k.ToMM((p-v).EuclideanNorm()) for v in targets)
queue=[(h((0,0)),0.,(0,0))];cost={(0,0):0};parent={};count=0;found=None;cache={}
def inside(n):
 if n not in cache:
  p=point(n);cache[n]=15<k.ToMM(p.x)<23.5 and 1<k.ToMM(p.y)<11 and poly.Contains(p)
 return cache[n]
while queue:
 _,dist,n=heapq.heappop(queue)
 if dist!=cost[n]:continue
 count+=1
 if h(n)<.025:
  found=n;break
 for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
  q=(n[0]+dx,n[1]+dy);nd=dist+math.hypot(dx,dy)*step
  if nd>=cost.get(q,float('inf')) or not inside(q):continue
  if dx and dy and (not inside((n[0]+dx,n[1])) or not inside((n[0],n[1]+dy))):continue
  cost[q]=nd;parent[q]=n;heapq.heappush(queue,(nd+h(q),nd,q))
path=[]
if found is not None:
 n=found
 while True:
  p=point(n);path.append([k.ToMM(p.x),k.ToMM(p.y)])
  if n==(0,0):break
  n=parent[n]
 path.reverse()
sections=[]
for y in [3.452,3.502,3.552,3.602,3.652]:
 xs=[17.1+i*.001 for i in range(551)];runs=[];run=[]
 for x in xs:
  if poly.Contains(k.VECTOR2I(k.FromMM(x),k.FromMM(y))):run.append(x)
  elif run:runs.append([run[0],run[-1],run[-1]-run[0]]);run=[]
 if run:runs.append([run[0],run[-1],run[-1]-run[0]])
 sections.append({'y':y,'filled_x_intervals_mm':runs})
r={'source_point_mm':start,'roi':[15,23.5,1,11],'grid_mm':step,'visited':count,'shortest_grid_path_mm':cost[found] if found is not None else None,'path':path,'neck_sections':sections,'limitations':['One L3 copper path only; does not model return-current distribution, interplane capacitance or impedance','Point-grid path has no required width margin and is not a release pass'],'release_allowed':False};(w/'usb-ground-path-diagnostic.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items() if k!='path'})

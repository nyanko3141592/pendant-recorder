from pathlib import Path
import pcbnew as k,wx,json,math,heapq,sys
app=wx.App(False);w=Path(__file__).resolve().parent;b=k.LoadBoard(str(w/'c32-ground-short-trial.kicad_pcb'));zones={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if z.GetNetname()=='/GND' and not z.GetIsRuleArea()};radius=float(sys.argv[1]);poly=k.SHAPE_POLY_SET(zones[k.In1_Cu]);poly.Deflate(k.FromMM(radius),k.CORNER_STRATEGY_ROUND_ALL_CORNERS,k.FromMM(.001));start=(11.4523,2.9226);a=k.VECTOR2I(k.FromMM(start[0]),k.FromMM(start[1]));assert poly.Contains(a);targets=[k.VECTOR2I(k.FromMM(12.8375),k.FromMM(.25))];step=.025
point=lambda n:k.VECTOR2I(a.x+k.FromMM(n[0]*step),a.y+k.FromMM(n[1]*step))
def h(n):p=point(n);return min(k.ToMM((p-v).EuclideanNorm()) for v in targets)
queue=[(h((0,0)),0.,(0,0))];cost={(0,0):0};parent={};count=0;found=None;cache={}
def inside(n):
 if n not in cache:
  p=point(n);cache[n]=9<k.ToMM(p.x)<17 and -.4<k.ToMM(p.y)<5 and poly.Contains(p)
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
r={'edge_margin_mm':radius,'nominal_channel_width_mm':2*radius,'source_point_mm':start,'roi':[9,17,-.4,5],'grid_mm':step,'visited':count,'shortest_grid_path_mm':cost[found] if found is not None else None,'path':path,'limitations':['One L2 copper path only; does not model return-current distribution, interplane capacitance or impedance','Deflated polygon sampled on grid; approximate width margin only, no return-current certification'],'release_allowed':False};(w/('c32-loop-plane-width-'+str(radius)+'.json')).write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items() if k!='path'})

from pathlib import Path
import pcbnew as k,wx,json,math,heapq,functools,shutil,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'power-ground-access-trial.kicad_pcb';b=k.LoadBoard(str(src));f=next(f for f in b.GetFootprints() if f.GetReference()=='C32');p=next(p for p in f.Pads() if p.GetNumber()=='2');origin=p.GetPosition();layer=k.B_Cu
planes={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if z.GetNetname()=='/GND' and not z.GetIsRuleArea()}
tracks=list(b.GetTracks());pads=[p for f in b.GetFootprints() for p in f.Pads()];obstacles=[t.GetEffectiveShape(layer) for t in tracks+pads if t.GetNetname()!='/GND' and t.IsOnLayer(layer)]
sites=[t.GetPosition() for t in tracks if isinstance(t,k.PCB_VIA) and t.GetNetname()=='/GND' and k.ToMM((t.GetPosition()-origin).EuclideanNorm())<3 and all(planes[l].Contains(t.GetPosition()) for l in [k.In1_Cu,k.In2_Cu])]
step=k.FromMM(.05)
def point(n):return origin+k.VECTOR2I(n[0]*step,n[1]*step)
@functools.lru_cache(None)
def clear(a,z):return not any(s.Collide(k.SEG(point(a),point(z)),k.FromMM(.1645)) for s in obstacles)
q=[(0,(0,0))];cost={(0,0):0};prev={};found=None;visited=0
while q:
 d,n=heapq.heappop(q)
 if d!=cost[n]:continue
 visited+=1;pn=point(n)
 for site in sites:
  tail=k.ToMM((pn-site).EuclideanNorm())
  if tail<.075 and not any(s.Collide(k.SEG(pn,site),k.FromMM(.1645)) for s in obstacles):found=(n,site,d+tail);break
 if found:break
 for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(-1,1),(1,-1),(-1,-1)]:
  z=(n[0]+dx,n[1]+dy)
  if abs(z[0])>60 or abs(z[1])>60 or point(z).y<k.FromMM(-.05) or not clear(n,z):continue
  nd=d+.05*math.hypot(dx,dy)
  if nd<cost.get(z,1e99):cost[z]=nd;prev[z]=n;heapq.heappush(q,(nd,z))
o={'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'existing_via_targets':len(sites),'visited':visited,'found':bool(found),'release_allowed':False}
if found:
 n,site,length=found;path=[point(n)]
 while n in prev:n=prev[n];path.append(point(n))
 path.reverse();path.append(site);clean=[path[0]]
 for i in range(1,len(path)-1):
  a,m,z=clean[-1],path[i],path[i+1]
  if (m.x-a.x)*(z.y-m.y)!=(m.y-a.y)*(z.x-m.x):clean.append(m)
 clean.append(path[-1])
 for a,z in zip(clean,clean[1:]):
  if a==z:continue
  t=k.PCB_TRACK(b);t.SetStart(a);t.SetEnd(z);t.SetLayer(layer);t.SetWidth(k.FromMM(.127));t.SetNetCode(p.GetNetCode());b.AddNative(t);t.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());target=w/'c32-ground-short-trial.kicad_pcb';k.SaveBoard(str(target),b)
 for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),target.with_suffix(ext))
 o.update({'track_length_mm':length,'path_mm':[[k.ToMM(a.x),k.ToMM(a.y)] for a in clean],'candidate_sha256':hashlib.sha256(target.read_bytes()).hexdigest()})
(w/'c32-ground-route.json').write_text(json.dumps(o,indent=2)+'\n');print(json.dumps(o),flush=True)

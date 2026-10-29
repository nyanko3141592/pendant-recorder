from pathlib import Path
import heapq,functools,shutil
exec((Path(__file__).parent/'screen_c32_short_bypass.py').read_text().split('center=u.GetPosition();')[0])
center=u.GetPosition();sites=[]
for ix in range(-40,41):
 for iy in range(-40,41):
  if math.hypot(ix*.05,iy*.05)>2:continue
  q=k.VECTOR2I(center.x+k.FromMM(ix*.05),center.y+k.FromMM(iy*.05))
  if q.y<k.FromMM(-.05) or q.x<k.FromMM(.45):continue
  if any(s.Collide(q,k.FromMM(.326)) for ss in copper.values() for s in ss):continue
  if any(p.GetEffectiveShape(p.GetParentFootprint().GetLayer()).Collide(q,k.FromMM(.101)) for p in pads):continue
  if any((q-v.GetPosition()).EuclideanNorm()<k.FromMM(.351)+v.GetDrillValue()/2 for v in vias):continue
  if any(s.Collide(k.SEG(u.GetPosition(),q),k.FromMM(.1645)) for s in copper[k.F_Cu]):continue
  sites.append(q)
# Route on B from capacitor center, .05mm grid, connect nearby clear via sites.
origin=c.GetPosition();step=k.FromMM(.05)
def point(n):return k.VECTOR2I(origin.x+n[0]*step,origin.y+n[1]*step)
@functools.lru_cache(None)
def edge(a,z):
 seg=k.SEG(point(a),point(z));return not any(s.Collide(seg,k.FromMM(.1645)) for s in copper[k.B_Cu])
def dist(a,z):return k.ToMM((a-z).EuclideanNorm())
q=[(0,(0,0))];cost={(0,0):0};prev={};found=None;visited=0
while q:
 d,n=heapq.heappop(q)
 if d!=cost[n]:continue
 visited+=1;pnt=point(n)
 for site in sites:
  tail=dist(pnt,site)
  if tail<.075 and not any(s.Collide(k.SEG(pnt,site),k.FromMM(.1645)) for s in copper[k.B_Cu]):found=(n,site,d+tail);break
 if found:break
 for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(-1,1),(1,-1),(-1,-1)]:
  z=(n[0]+dx,n[1]+dy)
  if abs(z[0])>60 or abs(z[1])>60 or point(z).y<k.FromMM(-.05):continue
  if not edge(n,z):continue
  nd=d+.05*math.hypot(dx,dy)
  if nd<cost.get(z,1e99):cost[z]=nd;prev[z]=n;heapq.heappush(q,(nd,z))
out={'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'via_sites_with_front_escape':len(sites),'visited':visited,'found':bool(found),'release_allowed':False}
if found:
 n,site,length=found;path=[point(n)]
 while n in prev:n=prev[n];path.append(point(n))
 path.reverse();path.append(site)
 # Simplify collinear grid runs.
 clean=[path[0]]
 for i in range(1,len(path)-1):
  a=clean[-1];m=path[i];z=path[i+1]
  if (m.x-a.x)*(z.y-m.y)!=(m.y-a.y)*(z.x-m.x):clean.append(m)
 clean.append(path[-1]);netcode=u.GetNetCode()
 for layer,pts in [(k.B_Cu,clean),(k.F_Cu,[u.GetPosition(),site])]:
  for a,z in zip(pts,pts[1:]):
   if a==z:continue
   t=k.PCB_TRACK(b);t.SetStart(a);t.SetEnd(z);t.SetLayer(layer);t.SetWidth(k.FromMM(.127));t.SetNetCode(netcode);b.AddNative(t);t.thisown=False
 v=k.PCB_VIA(b);v.SetPosition(site);v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(netcode);b.AddNative(v);v.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());target=w/'c32-short-bypass-trial.kicad_pcb';k.SaveBoard(str(target),b)
 for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),target.with_suffix(ext))
 out.update({'via_xy_mm':[k.ToMM(site.x),k.ToMM(site.y)],'B_length_mm':length,'F_length_mm':dist(u.GetPosition(),site),'B_path_mm':[[k.ToMM(a.x),k.ToMM(a.y)] for a in clean],'candidate_sha256':hashlib.sha256(target.read_bytes()).hexdigest()})
(w/'c32-bent-bypass-route.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)

from pathlib import Path
import pcbnew as k,wx,math,json
app=wx.App(False);d=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');b=k.LoadBoard(str(d/'sel-connected.kicad_pcb'))
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def dist(p,s,e):
 dx,dy=e[0]-s[0],e[1]-s[1];q=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(p[0]-s[0]-q*dx,p[1]-s[1]-q*dy)
result={}
for net,a in [('/USB_HIGH_BUDGET_DRAIN',(8.175,10.692499))]:
 obs=[];rect=[];holes=[]
 for t in b.GetTracks():
  via=isinstance(t,k.PCB_VIA)
  if via:holes.append((xy(t.GetPosition()),k.ToMM(t.GetDrillValue())/2+.1+.25))
  if t.GetNetname()==net:continue
  obs.append((xy(t.GetStart()),xy(t.GetEnd()),k.ToMM(t.GetWidth(k.F_Cu) if via else t.GetWidth())/2+.3))
 for f in b.GetFootprints():
  for p in f.Pads():
   if p.GetNetname()==net:continue
   bb=p.GetBoundingBox();rect.append((k.ToMM(bb.GetX())-.3,k.ToMM(bb.GetY())-.3,k.ToMM(bb.GetRight())+.3,k.ToMM(bb.GetBottom())+.3))
 candidates=[]; ranked=[]
 for ix in range(round((a[0]-2)*20),round((a[0]+2)*20)):
  for iy in range(round((a[1]-2)*20),round((a[1]+2)*20)):
   p=(ix/20,iy/20)
   if any(l<p[0]<r and u<p[1]<v for l,u,r,v in rect):continue
   if any(math.dist(p,h)<rad for h,rad in holes):continue
   hits=sum(dist(p,s,e)<rad for s,e,rad in obs)
   ranked.append((hits,math.dist(a,p),p))
   if hits:continue
   candidates.append(p)
 ranked.sort();print('least collisions',net,ranked[:6],flush=True);candidates.sort(key=lambda p:math.dist(a,p));result[net]={'pad':a,'all_layer_clear_candidates':candidates[:40],'count':len(candidates),'least_collisions':ranked[:20]};print(net,len(candidates),candidates[:8],flush=True)
(d/'drain-current-via-rank.json').write_text(json.dumps(result,indent=2)+'\n')

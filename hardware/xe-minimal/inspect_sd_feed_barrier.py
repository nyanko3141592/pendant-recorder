from pathlib import Path
import json
O=Path(__file__).resolve().parent
exec((O/'route_sd_input_feed_escaped_four.py').read_text())
tracks=[];pads=[]
for tr in b.GetTracks():
 if tr.GetNetname()=='/V3V3':continue
 via=isinstance(tr,k.PCB_VIA)
 tracks.append((tr,xy(tr.GetStart()),xy(tr.GetEnd()),k.ToMM(tr.GetWidth(k.In2_Cu) if via else tr.GetWidth())/2+.24,via))
for f in b.GetFootprints():
 for pp in f.Pads():
  if pp.GetNetname()=='/V3V3':continue
  bb=pp.GetBoundingBox();pads.append((f.GetReference(),pp,(k.ToMM(bb.GetX())-.24,k.ToMM(bb.GetY())-.24,k.ToMM(bb.GetRight())+.24,k.ToMM(bb.GetBottom())+.24)))
near=sorted(closed,key=lambda z:math.dist(points[z],c))[:30];out=[]
for z in near:
 for dx,dy in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]:
  pos=((z[0]+dx)*.1,(z[1]+dy)*.1);l=z[2]
  if math.dist(pos,c)>=math.dist(points[z],c) or clear(pos,l):continue
  blockers=[{'kind':'track','uuid':tr.m_Uuid.AsString(),'net':tr.GetNetname(),'via':via,'start':s,'end':e} for tr,s,e,r,via in tracks if (via or tr.GetLayer()==l) and dist(pos,s,e)<r]
  blockers += [{'kind':'pad','ref':ref,'pad':pp.GetNumber(),'net':pp.GetNetname()} for ref,pp,(left,up,right,down) in pads if pp.IsOnLayer(l) and left<pos[0]<right and up<pos[1]<down]
  out.append({'from':points[z],'layer':l,'toward':pos,'blockers':blockers})
r={'start':a,'goal':c,'reachable_bounds':{str(l):{'count':sum(z[2]==l for z in closed),'x':[min(points[z][0] for z in closed if z[2]==l),max(points[z][0] for z in closed if z[2]==l)],'y':[min(points[z][1] for z in closed if z[2]==l),max(points[z][1] for z in closed if z[2]==l)]} for l in layers if any(z[2]==l for z in closed)},'nearest_barriers':out}
(O/'sd-feed-barrier-diagnostic.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2)[:14000])

from pathlib import Path
import pcbnew as k,wx,json,math,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'ground-islands-centered.kicad_pcb';b=k.LoadBoard(str(src));via=min((t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname()=='/SWDIO'),key=lambda t:math.hypot(k.ToMM(t.GetPosition().x)-21.1,k.ToMM(t.GetPosition().y)-9.3));old=via.GetPosition();net=str(via.GetNetname());ends=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetNetname()!=net:continue
 for attr in ['Start','End']:
  if getattr(t,'Get'+attr)()==old:ends.append((t,attr))
assert ends
obs={l:[] for l in [k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu]};pads=[];others=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) and t!=via:others.append(t)
 if t.GetNetname()!=net:
  for l in obs:
   if t.IsOnLayer(l):obs[l].append(t.GetEffectiveShape(l))
for f in b.GetFootprints():
 for p in f.Pads():
  for l in [k.F_Cu,k.B_Cu]:
   if p.IsOnLayer(l):
    shape=p.GetEffectiveShape(l);pads.append((shape,.101 if p.GetNetname()==net else .301))
    if p.GetNetname()!=net:obs[l].append(shape)
usb=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname() in ['/USB_DP','/USB_DM']];rules={l:[z.Outline() for z in b.Zones() if z.GetIsRuleArea() and z.IsOnLayer(l) and z.GetDoNotAllowTracks()] for l in obs};candidates=[];clear_via_sites=[]
for dx in range(-20,21):
 for dy in range(-20,21):
  distance=math.hypot(dx*.05,dy*.05)
  if distance==0 or distance>1:continue
  q=k.VECTOR2I(old.x+k.FromMM(dx*.05),old.y+k.FromMM(dy*.05))
  if min((q-v.GetPosition()).EuclideanNorm() for v in usb)<k.FromMM(.95):continue
  if any(s.Collide(q,k.FromMM(.326)) for shapes in obs.values() for s in shapes):continue
  if any(s.Collide(q,k.FromMM(r)) for s,r in pads):continue
  if any((q-v.GetPosition()).EuclideanNorm()<k.FromMM(.351)+v.GetDrillValue()/2 for v in others):continue
  clear_via_sites.append([k.ToMM(q.x),k.ToMM(q.y)])
  good=True
  for t,attr in ends:
   other=t.GetEnd() if attr=='Start' else t.GetStart();seg=k.SEG(q,other);l=t.GetLayer()
   if any(s.Collide(seg,t.GetWidth()//2+k.FromMM(.101)) for s in obs[l]) or any(r.Collide(seg,t.GetWidth()//2+k.FromMM(.001)) for r in rules[l]):good=False;break
  if good:candidates.append((distance,q.x,q.y))
candidates.sort();record={'old_xy_mm':[k.ToMM(old.x),k.ToMM(old.y)],'attached_track_endpoints':len(ends),'clear_via_sites':clear_via_sites,'candidate_count':len(candidates),'best_xy_mm':[[k.ToMM(x),k.ToMM(y)] for _,x,y in candidates[:10]],'release_allowed':False};(w/'swdio-ground-neck-screen.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
if candidates:
 _,x,y=candidates[0];q=k.VECTOR2I(x,y);via.SetPosition(q)
 for t,attr in ends:getattr(t,'Set'+attr)(q)
 out=w/'swdio-ground-neck.kicad_pcb';k.SaveBoard(str(out),b)
 for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))

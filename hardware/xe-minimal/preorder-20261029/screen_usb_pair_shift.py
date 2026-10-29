from pathlib import Path
import pcbnew as k,wx,json,math,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'local-return-centered.kicad_pcb';b=k.LoadBoard(str(src));layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu];moving=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname() in ['/USB_DP','/USB_DM'] and t.GetPosition().x>k.FromMM(20)];assert len(moving)==2;original={str(v.m_Uuid.AsString()):v.GetPosition() for v in moving};ends=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA):continue
 for v in moving:
  if t.GetNetname()!=v.GetNetname():continue
  for attr in ['Start','End']:
   if getattr(t,'Get'+attr)()==v.GetPosition():ends.append((t,attr,str(v.m_Uuid.AsString())))
changed={str(t.m_Uuid.AsString()):t for t,_,_ in ends};ids=set(changed)|set(original);obs={l:[] for l in layers};pads=[];holes=[]
for t in b.GetTracks():
 if str(t.m_Uuid.AsString()) in ids:continue
 if isinstance(t,k.PCB_VIA):holes.append(t)
 for l in layers:
  if t.IsOnLayer(l):obs[l].append((str(t.GetNetname()),t.GetEffectiveShape(l)))
for f in b.GetFootprints():
 for p in f.Pads():
  for l in [k.F_Cu,k.B_Cu]:
   if p.IsOnLayer(l):obs[l].append((str(p.GetNetname()),p.GetEffectiveShape(l)));pads.append((str(p.GetNetname()),p.GetEffectiveShape(l)))
rules={l:[z.Outline() for z in b.Zones() if z.GetIsRuleArea() and z.IsOnLayer(l) and z.GetDoNotAllowTracks()] for l in layers};swd=next(t for t in holes if t.GetNetname()=='/SWDIO' and abs(k.ToMM(t.GetPosition().x)-21.1103)<.01);candidates=[];details=[];via_clear=[];track_blockers={}
for _,dx,dy in sorted((math.hypot(x*.025,y*.025),x*.025,y*.025) for x in range(-20,21) for y in range(-20,21) if x or y):
 shift=k.VECTOR2I(k.FromMM(dx),k.FromMM(dy))
 for v in moving:v.SetPosition(original[str(v.m_Uuid.AsString())]+shift)
 for t,attr,uid in ends:getattr(t,'Set'+attr)(original[uid]+shift)
 dp=next(v for v in moving if v.GetNetname()=='/USB_DP');gap=k.ToMM((dp.GetPosition()-swd.GetPosition()).EuclideanNorm())-k.ToMM(dp.GetWidth(k.F_Cu)+swd.GetWidth(k.F_Cu))/2-.3
 if gap<.18:continue
 good=True
 for v in moving:
  q=v.GetPosition();net=str(v.GetNetname());rad=v.GetWidth(k.F_Cu)//2+k.FromMM(.101)
  if any(n!=net and s.Collide(q,rad) for shapes in obs.values() for n,s in shapes):good=False;break
  if any(s.Collide(q,v.GetDrillValue()//2+k.FromMM(.001 if n==net else .201)) for n,s in pads):good=False;break
  if any((q-h.GetPosition()).EuclideanNorm()<(v.GetDrillValue()+h.GetDrillValue())/2+k.FromMM(.251) for h in holes):good=False;break
 if not good:continue
 via_clear.append([dx,dy])
 objects=list(moving)+list(changed.values())
 for t in changed.values():
  l=t.GetLayer();shape=t.GetEffectiveShape(l);net=str(t.GetNetname())
  for n,s in obs[l]:
   if n!=net and shape.Collide(s,k.FromMM(.101)):track_blockers[n]=track_blockers.get(n,0)+1
  if any(n!=net and shape.Collide(s,k.FromMM(.101)) for n,s in obs[l]) or any(r.Collide(k.SEG(t.GetStart(),t.GetEnd()),t.GetWidth()//2+k.FromMM(.001)) for r in rules[l]):good=False;break
 for i,t in enumerate(objects):
  for q in objects[i+1:]:
   if t.GetNetname()==q.GetNetname():continue
   for l in layers:
    if t.IsOnLayer(l) and q.IsOnLayer(l) and t.GetEffectiveShape(l).Collide(q.GetEffectiveShape(l),k.FromMM(.101)):good=False
 if good:candidates.append({'delta_mm':[dx,dy],'USB_DP_to_SWDIO_clearance_neck_mm':gap})
record={'source':'local-return-centered.kicad_pcb','via_only_clear_count':len(via_clear),'via_only_clear_deltas':via_clear[:20],'track_blocker_counts':track_blockers,'candidate_count':len(candidates),'best':candidates[:20],'attached_endpoints':len(ends),'release_allowed':False};(w/'usb-pair-shift-screen.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
if candidates:
 dx,dy=candidates[0]['delta_mm'];shift=k.VECTOR2I(k.FromMM(dx),k.FromMM(dy))
 for v in moving:v.SetPosition(original[str(v.m_Uuid.AsString())]+shift)
 for t,attr,uid in ends:getattr(t,'Set'+attr)(original[uid]+shift)
 out=w/'usb-pair-shift.kicad_pcb';k.SaveBoard(str(out),b)
 for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))

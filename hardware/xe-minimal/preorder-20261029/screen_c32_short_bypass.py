from pathlib import Path
import pcbnew as k,wx,json,math,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'l3-ground-011-trial.kicad_pcb';b=k.LoadBoard(str(src));fps={f.GetReference():f for f in b.GetFootprints()};u=next(p for p in fps['U13'].Pads() if p.GetNumber()=='6');c=next(p for p in fps['C32'].Pads() if p.GetNumber()=='1');net=u.GetNetname();assert c.GetNetname()==net
layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu];tracks=list(b.GetTracks());pads=[p for f in b.GetFootprints() for p in f.Pads()];vias=[t for t in tracks if isinstance(t,k.PCB_VIA)];copper={l:[] for l in layers}
for o in tracks+pads:
 if o.GetNetname()!=net:
  for l in layers:
   if o.IsOnLayer(l):copper[l].append(o.GetEffectiveShape(l))
# Physical same-layer shape contact inventory independently identifies immediate copper.
contacts={}
for name,p in [('U13.6',u),('C32.1',c)]:
 contacts[name]=[{'type':'via' if isinstance(t,k.PCB_VIA) else 'track','start':[k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y)],'end':[k.ToMM(t.GetEnd().x),k.ToMM(t.GetEnd().y)],'layer':b.GetLayerName(t.GetLayer())} for t in tracks if t.GetNetname()==net and t.IsOnLayer(p.GetParentFootprint().GetLayer()) and p.GetEffectiveShape(p.GetParentFootprint().GetLayer()).Collide(t.GetEffectiveShape(p.GetParentFootprint().GetLayer()))]
center=u.GetPosition();counts={'grid':0,'copper_clear':0,'pad_hole_clear':0,'drill_clear':0,'segments_clear':0};candidates=[]
for ix in range(-40,41):
 for iy in range(-40,41):
  if math.hypot(ix*.05,iy*.05)>2:continue
  q=k.VECTOR2I(center.x+k.FromMM(ix*.05),center.y+k.FromMM(iy*.05));counts['grid']+=1
  if q.y<k.FromMM(-.05) or q.x<k.FromMM(.45):continue
  if any(s.Collide(q,k.FromMM(.326)) for ss in copper.values() for s in ss):continue
  counts['copper_clear']+=1
  if any(p.GetEffectiveShape(p.GetParentFootprint().GetLayer()).Collide(q,k.FromMM(.101)) for p in pads):continue
  counts['pad_hole_clear']+=1
  if any((q-v.GetPosition()).EuclideanNorm()<k.FromMM(.351)+v.GetDrillValue()/2 for v in vias):continue
  counts['drill_clear']+=1
  if any(s.Collide(k.SEG(p.GetPosition(),q),k.FromMM(.1645)) for p in [u,c] for s in copper[p.GetParentFootprint().GetLayer()]):continue
  counts['segments_clear']+=1
  candidates.append({'via_xy_mm':[k.ToMM(q.x),k.ToMM(q.y)],'total_segment_mm':sum(k.ToMM((q-p.GetPosition()).EuclideanNorm()) for p in [u,c])})
candidates.sort(key=lambda x:x['total_segment_mm']);out={'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'net':net,'u_layer':b.GetLayerName(u.GetParentFootprint().GetLayer()),'c_layer':b.GetLayerName(c.GetParentFootprint().GetLayer()),'physical_pad_contacts':contacts,'screen_counts':counts,'candidates':candidates[:20],'limitations':['Screen only; rule areas, GND reference and full DRC not yet certified','Via .45/.2, trace .127, clearance .101, grid .05, radius2mm','Filled GND excluded as connectable clearance cut; refill required if candidate created'],'release_allowed':False};(w/'c32-short-bypass-screen.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))

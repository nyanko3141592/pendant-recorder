from pathlib import Path
import pcbnew as k,wx,json,math,shutil,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'c32-short-bypass-trial.kicad_pcb';b=k.LoadBoard(str(src));fps={f.GetReference():f for f in b.GetFootprints()};layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu];planes={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if z.GetNetname()=='/GND' and not z.GetIsRuleArea()};copper={l:[] for l in layers};pads=[p for f in b.GetFootprints() for p in f.Pads()];vias=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA)]
for t in list(b.GetTracks())+pads:
 if t.GetNetname()!='/GND':
  for l in layers:
   if t.IsOnLayer(l):copper[l].append(t.GetEffectiveShape(l))
offsets=sorted((math.hypot(x*.1,y*.1),x,y) for x in range(-15,16) for y in range(-15,16) if .3<=math.hypot(x*.1,y*.1)<=1.5);rows=[]
for ref,num in [('C14','2'),('C32','2'),('U13','2'),('U3','11'),('U3','5'),('C13','2'),('C15','2')]:
 pad=next(p for p in fps[ref].Pads() if p.GetNumber()==num);layer=fps[ref].GetLayer();chosen=None
 for distance,x,y in offsets:
  q=pad.GetPosition()+k.VECTOR2I(k.FromMM(x*.1),k.FromMM(y*.1))
  if not all(planes[l].Contains(q) for l in [k.In1_Cu,k.In2_Cu]):continue
  if any(s.Collide(q,k.FromMM(.326)) for ss in copper.values() for s in ss):continue
  if any(p.GetEffectiveShape(p.GetParentFootprint().GetLayer()).Collide(q,k.FromMM(.101)) for p in pads):continue
  if any((q-v.GetPosition()).EuclideanNorm()<k.FromMM(.351)+v.GetDrillValue()/2 for v in vias):continue
  if any(s.Collide(k.SEG(pad.GetPosition(),q),k.FromMM(.1645)) for s in copper[layer]):continue
  v=k.PCB_VIA(b);v.SetPosition(q);v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(pad.GetNetCode());b.AddNative(v);v.thisown=False;vias.append(v)
  t=k.PCB_TRACK(b);t.SetStart(pad.GetPosition());t.SetEnd(q);t.SetWidth(k.FromMM(.127));t.SetLayer(layer);t.SetNetCode(pad.GetNetCode());b.AddNative(t);t.thisown=False
  chosen={'via_mm':[k.ToMM(q.x),k.ToMM(q.y)],'track_mm':distance};break
 rows.append({'ref':ref,'pin':num,'added':chosen})
k.ZONE_FILLER(b).Fill(b.Zones());out=w/'power-ground-access-trial.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
r={'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'rows':rows,'release_allowed':False};(w/'power-ground-access-additions.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))

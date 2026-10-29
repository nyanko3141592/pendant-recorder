from pathlib import Path
import pcbnew as k,wx,math,json,collections
app=wx.App(False);w=Path(__file__).resolve().parent;b=k.LoadBoard(str(w/'mixed-global-routed.kicad_pcb'));result={}
for number in ['16','40']:
 p=next(p for f in b.GetFootprints() if f.GetReference()=='U1' for p in f.Pads() if p.GetNumber()==number);a=p.GetPosition();net=str(p.GetNetname());layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu];copper=[];back=[];pads=[]
 for t in b.GetTracks():
  if t.GetNetname()==net:continue
  for layer in layers:
   if t.IsOnLayer(layer):
    shape=t.GetEffectiveShape(layer);entry=(str(t.GetNetname()),shape)
    copper.append(entry)
    if layer==k.B_Cu:back.append(entry)
 for f in b.GetFootprints():
  for q in f.Pads():
   for layer in [k.F_Cu,k.B_Cu]:
    if not q.IsOnLayer(layer):continue
    shape=q.GetEffectiveShape(layer);pads.append((str(q.GetNetname()),shape))
    if q.GetNetname()!=net:
     copper.append((f.GetReference()+'.'+q.GetNumber(),shape))
     if layer==k.B_Cu:back.append((f.GetReference()+'.'+q.GetNumber(),shape))
 candidates=[];blocked=collections.Counter()
 for dx in range(-40,41):
  for dy in range(-40,41):
   length=math.hypot(dx*.05,dy*.05)
   if length<.35 or length>2:continue
   pt=k.VECTOR2I(a.x+k.FromMM(dx*.05),a.y+k.FromMM(dy*.05));segment=k.SEG(a,pt)
   blockers=[n for n,s in back if s.Collide(segment,k.FromMM(.127/2+.101))]
   if blockers:blocked.update(set(blockers));continue
   if any(s.Collide(pt,k.FromMM(.326)) for n,s in copper):continue
   if any(s.Collide(pt,k.FromMM(.101 if n==net else .301)) for n,s in pads):continue
   candidates.append({'xy_mm':[k.ToMM(pt.x),k.ToMM(pt.y)],'length_mm':length})
 candidates.sort(key=lambda x:x['length_mm']);result[net]={'pin':number,'pad_xy_mm':[k.ToMM(a.x),k.ToMM(a.y)],'candidate_count':len(candidates),'best_sites':candidates[:12],'direct_line_blockers':blocked.most_common(10)}
(w/'missing-escape-screen.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result),flush=True)

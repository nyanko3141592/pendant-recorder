from pathlib import Path
import pcbnew as k,wx,json,math,shutil,collections
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'corridor-connected-clean.kicad_pcb';b=k.LoadBoard(str(src));diag=k.LoadBoard(str(w/'ground-islands-diagnostic.kicad_pcb'));zones={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if z.GetNetname()=='/GND' and not z.GetIsRuleArea()};dz={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in diag.Zones() if z.GetNetname()=='/GND' and not z.GetIsRuleArea()};samples=json.loads((w/'corridor-return-gap-classification.json').read_text())['samples'];groups=collections.defaultdict(list)
for s in samples:
 if s['category']!='not_explained_by_0p15_clearance':continue
 layer=k.In1_Cu if s['reference']=='In1.Cu' else k.In2_Cu;q=k.VECTOR2I(k.FromMM(s['xy_mm'][0]),k.FromMM(s['xy_mm'][1]))
 if not dz[layer].Contains(q):continue
 for i in range(dz[layer].OutlineCount()):
  if dz[layer].Contains(q,i):groups[layer,i].append(s);break
copper=[];pads=[];vias=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA)]
for t in b.GetTracks():
 if t.GetNetname()!='/GND':
  for l in [k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu]:
   if t.IsOnLayer(l):copper.append(t.GetEffectiveShape(l))
for f in b.GetFootprints():
 for p in f.Pads():
  for l in [k.F_Cu,k.B_Cu]:
   if p.IsOnLayer(l):
    shape=p.GetEffectiveShape(l);pads.append((shape,.101 if p.GetNetname()=='/GND' else .301))
    if p.GetNetname()!='/GND':copper.append(shape)
rows=[]
for (layer,i),points in sorted(groups.items(),key=lambda item:-sum(s['weight_mm'] for s in item[1])):
 candidates=set()
 for s in points[::max(1,len(points)//50)]:
  x,y=s['xy_mm']
  for dx in range(-10,11):
   for dy in range(-10,11):
    if dx*dx+dy*dy<=100:candidates.add((round(x/.1)+dx,round(y/.1)+dy))
 chosen=None;other=k.In1_Cu if layer==k.In2_Cu else k.In2_Cu
 for x,y in sorted(candidates,key=lambda p:min((p[0]*.1-s['xy_mm'][0])**2+(p[1]*.1-s['xy_mm'][1])**2 for s in points[::max(1,len(points)//20)])):
  q=k.VECTOR2I(k.FromMM(x*.1),k.FromMM(y*.1))
  if not dz[layer].Contains(q,i) or not zones[other].Contains(q):continue
  if not(.5<x*.1<27 and 0<y*.1<26.5):continue
  if any(shape.Collide(q,k.FromMM(.326)) for shape in copper):continue
  if any(shape.Collide(q,k.FromMM(r)) for shape,r in pads):continue
  if any((q-v.GetPosition()).EuclideanNorm()<k.FromMM(.351)+v.GetDrillValue()/2 for v in vias):continue
  v=k.PCB_VIA(b);v.SetPosition(q);v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet('/GND').GetNetCode());b.AddNative(v);v.thisown=False;vias.append(v);chosen=[round(x*.1,4),round(y*.1,4)];break
 rows.append({'reference_layer':b.GetLayerName(layer),'diagnostic_outline':i,'missing_signal_mm':sum(s['weight_mm'] for s in points),'signals':sorted(set(s['signal'] for s in points)),'via_xy_mm':chosen})
 print(rows[-1],flush=True)
out=w/'ground-islands-stitched.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
(w/'ground-island-stitches.json').write_text(json.dumps({'groups':rows,'original_island_removal_preserved':True,'release_allowed':False},indent=2)+'\n')

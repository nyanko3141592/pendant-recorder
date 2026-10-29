from pathlib import Path
import pcbnew as k,wx,json,math,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'chg-via-ground-neck.kicad_pcb';b=k.LoadBoard(str(src));zones={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if z.GetNetname()=='/GND' and not z.GetIsRuleArea()};critical=set(json.loads((w/'pdm-tp6-preparation.json').read_text())['critical_nets_outer_only'])|{'/USB_DP','/USB_DM'};vias=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA)];ground=[t for t in vias if t.GetNetname()=='/GND'];signals=[t for t in vias if t.GetNetname() in critical];copper=[];pads=[]
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
def distance(v):return min(k.ToMM((v.GetPosition()-g.GetPosition()).EuclideanNorm()) for g in ground)
offsets=sorted((math.hypot(x*.05,y*.05),x,y) for x in range(-30,31) for y in range(-30,31) if .45<=math.hypot(x*.05,y*.05)<=1.5);rows=[]
for v in sorted(signals,key=distance,reverse=True):
 old=distance(v);chosen=None
 if old>.8:
  for dist,x,y in offsets:
   if dist>=old:break
   pos=v.GetPosition();q=k.VECTOR2I(pos.x+k.FromMM(x*.05),pos.y+k.FromMM(y*.05))
   if not(k.FromMM(.45)<q.x<k.FromMM(27.05) and k.FromMM(-.05)<q.y<k.FromMM(26.55)):continue
   if not all(zones[l].Contains(q) for l in [k.In1_Cu,k.In2_Cu]):continue
   if any(s.Collide(q,k.FromMM(.326)) for s in copper):continue
   if any(s.Collide(q,k.FromMM(r)) for s,r in pads):continue
   if any((q-g.GetPosition()).EuclideanNorm()<k.FromMM(.351)+g.GetDrillValue()/2 for g in vias):continue
   g=k.PCB_VIA(b);g.SetPosition(q);g.SetWidth(k.FromMM(.45));g.SetDrill(k.FromMM(.2));g.SetViaType(k.VIATYPE_THROUGH);g.SetLayerPair(k.F_Cu,k.B_Cu);g.SetNetCode(b.FindNet('/GND').GetNetCode());b.AddNative(g);g.thisown=False;ground.append(g);vias.append(g);chosen=[k.ToMM(q.x),k.ToMM(q.y)];break
  rows.append({'signal':str(v.GetNetname()),'signal_via':[k.ToMM(v.GetPosition().x),k.ToMM(v.GetPosition().y)],'old_nearest_mm':old,'new_nearest_mm':distance(v),'added_ground_via':chosen})
 print(str(v.GetNetname()),round(old,3),round(distance(v),3),chosen,flush=True)
out=w/'local-return-stitched.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
(w/'local-return-stitches.json').write_text(json.dumps({'engineering_target_mm':.8,'search_radius_mm':1.5,'rows':rows,'limits':['Euclidean distance is not return-loop inductance','Both-plane local fill required; connected path and width need review'],'release_allowed':False},indent=2)+'\n')

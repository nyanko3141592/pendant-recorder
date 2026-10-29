from pathlib import Path
import pcbnew as k,wx,json,math,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'ground-islands-centered.kicad_pcb';b=k.LoadBoard(str(src));net='/CHG_ALLOW';layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu];obs=[];pads=[];vias=[];critical=set(json.loads((w/'pdm-tp6-preparation.json').read_text())['critical_nets_outer_only'])|{'/USB_DP','/USB_DM'};protected=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA):vias.append(t)
 if t.GetNetname()!=net:
  for l in layers:
   if t.IsOnLayer(l):obs.append(t.GetEffectiveShape(l))
 if not isinstance(t,k.PCB_VIA) and t.GetNetname() in critical:protected.append(t.GetEffectiveShape(t.GetLayer()))
for f in b.GetFootprints():
 for p in f.Pads():
  for l in [k.F_Cu,k.B_Cu]:
   if p.IsOnLayer(l):
    shape=p.GetEffectiveShape(l);pads.append((shape,.101 if p.GetNetname()==net else .301))
    if p.GetNetname()!=net:obs.append(shape)
choices=[]
for yi in range(153,231):
 y=yi*.05;q=k.VECTOR2I(k.FromMM(21.9766),k.FromMM(y))
 if any(s.Collide(q,k.FromMM(.326)) for s in obs):continue
 if any(s.Collide(q,k.FromMM(r)) for s,r in pads):continue
 if any((q-v.GetPosition()).EuclideanNorm()<k.FromMM(.351)+v.GetDrillValue()/2 for v in vias):continue
 if any(s.Collide(q,k.FromMM(.426)) for s in protected):continue
 choices.append([21.9766,round(y,4)])
(w/'chg-allow-bridge-sites.json').write_text(json.dumps({'sites':choices,'release_allowed':False},indent=2)+'\n');print(choices,flush=True)
if not choices:raise SystemExit(0)
x,y=choices[0];q=k.VECTOR2I(k.FromMM(x),k.FromMM(y));removed=[];trimmed=0
for t in list(b.GetTracks()):
 if isinstance(t,k.PCB_VIA) or t.GetNetname()!=net or t.GetLayer()!=k.In2_Cu:continue
 if max(t.GetStart().y,t.GetEnd().y)<=k.FromMM(7.60291):removed.append(str(t.m_Uuid.AsString()));b.RemoveNative(t)
 elif t.GetStart()==k.VECTOR2I(k.FromMM(21.9766),k.FromMM(7.6029)):
  t.SetStart(q);trimmed+=1
assert trimmed==1
v=k.PCB_VIA(b);v.SetPosition(q);v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet(net).GetNetCode());b.AddNative(v);v.thisown=False
out=w/'chg-allow-bridge-open.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
(w/'chg-allow-bridge-preparation.json').write_text(json.dumps({'source_via':[17.6025,3.552],'new_via':choices[0],'removed_tracks':removed,'trimmed_tracks':trimmed,'release_allowed':False},indent=2)+'\n')

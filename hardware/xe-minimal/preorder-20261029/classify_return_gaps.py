from pathlib import Path
import pcbnew as k,wx,math,json,hashlib,collections
app=wx.App(False);w=Path(__file__).resolve().parent;p=w/'ilim-main-connected.kicad_pcb';b=k.LoadBoard(str(p))
names=['/USB_DP','/USB_DM','/PDM_CLK','/PDM_CLK_MCU','/PDM_DATA','/SD_CLK_MCU','/SD_CLK','/SD_MOSI','/SD_MISO','/SD_CS_N']
zones={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if z.GetNetname()=='/GND' and not z.GetIsRuleArea()}
obstacles={layer:[(t,t.GetEffectiveShape(layer)) for t in b.GetTracks() if t.IsOnLayer(layer) and t.GetNetname()!='/GND'] for layer in [k.In1_Cu,k.In2_Cu]}
rows={};samples=[];blockers=collections.Counter()
for net in names:
 counts=collections.Counter()
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetNetname()!=net or t.GetLayer() not in [k.F_Cu,k.B_Cu]:continue
  layer=k.In1_Cu if t.GetLayer()==k.F_Cu else k.In2_Cu;a,e=t.GetStart(),t.GetEnd();length=k.ToMM(t.GetLength());n=max(1,math.ceil(length/.025))
  for i in range(n):
   q=k.VECTOR2I(round(a.x+(e.x-a.x)*(i+.5)/n),round(a.y+(e.y-a.y)*(i+.5)/n))
   if zones[layer].Contains(q):continue
   hits=[]
   for o,s in obstacles[layer]:
    if s.Collide(q,k.FromMM(.151)):
     kind='own_signal_via' if isinstance(o,k.PCB_VIA) and o.GetNetname()==net else 'other_via' if isinstance(o,k.PCB_VIA) else 'inner_track'
     hits.append({'kind':kind,'net':str(o.GetNetname()),'uuid':str(o.m_Uuid.AsString())});blockers[kind+':'+str(o.GetNetname())]+=length/n
   # Exclusive priority categories; per-obstacle totals intentionally overlap.
   category=next((c for c in ['inner_track','other_via','own_signal_via'] if any(h['kind']==c for h in hits)),'not_explained_by_0p15_clearance')
   counts[category]+=length/n;samples.append({'signal':net,'reference':b.GetLayerName(layer),'xy_mm':[k.ToMM(q.x),k.ToMM(q.y)],'weight_mm':length/n,'category':category,'hits':hits})
 rows[net]={k:round(v,4) for k,v in counts.items()}
r={'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'sampling_mm':.025,'obstacle_clearance_mm':.151,'exclusive_categories_mm':rows,'overlapping_blocker_totals_mm':dict(blockers.most_common()),'samples':samples,'limitations':['Copper proximity explains geometric exclusion only, not return impedance','Unexplained gaps may be minimum-width fill pruning or disconnected fill regions; must inspect','Own signal antipads still require a return-via assessment'],'release_allowed':False};(w/'return-gap-classification.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'rows':rows,'top_blockers':blockers.most_common(15)},indent=2))

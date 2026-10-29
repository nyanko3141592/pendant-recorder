"""Conditional trace-only DC estimate; no noise or thermal qualification."""
from pathlib import Path
import pcbnew as k,wx,json,hashlib,re,math,heapq,collections
app=wx.App(False);O=Path(__file__).resolve().parent;rows=[];rho=2.2e-8
for name in ['guarded','anynet']:
 src=O/f'pendant-xe-film-lap-{name}-footprint-trial.kicad_pcb';b=k.LoadBoard(str(src));thickness={n:float(v)for n,v in re.findall(r'\(layer "(F\.Cu|In[1-4]\.Cu|B\.Cu)"\s+\(type "copper"\)\s+\(thickness ([\d.]+)\)',src.read_text())};assert len(thickness)==6
 ts=[t for t in b.GetTracks()if t.GetNetname()=='/BAT_TS'];viaxy={(t.GetPosition().x,t.GetPosition().y)for t in ts if isinstance(t,k.PCB_VIA)}
 def node(p,l):return(p.x,p.y,-1 if (p.x,p.y)in viaxy else l)
 adj=collections.defaultdict(list)
 for t in ts:
  if isinstance(t,k.PCB_VIA):continue
  a,z=t.GetStart(),t.GetEnd();length=math.hypot(k.ToMM(z.x-a.x),k.ToMM(z.y-a.y));width=k.ToMM(t.GetWidth());layer=b.GetLayerName(t.GetLayer());res=rho*(length*.001)/(width*.001*thickness[layer]*.001)
  u,v=node(a,t.GetLayer()),node(z,t.GetLayer());data={'uuid':t.m_Uuid.AsString(),'layer':layer,'length_mm':length,'width_mm':width,'copper_thickness_mm':thickness[layer],'resistance_ohm':res}
  adj[u].append((v,data));adj[v].append((u,data))
 pads=[(f,p)for f in b.GetFootprints()for p in f.Pads()if p.GetNetname()=='/BAT_TS'];f,p=next((f,p)for f,p in pads if f.GetReference()=='TH1');start=node(p.GetPosition(),p.GetLayer());dist={start:0};paths={start:[]};queue=[(0,start)]
 while queue:
  d,u=heapq.heappop(queue)
  if d!=dist[u]:continue
  for v,data in adj[u]:
   nd=d+data['resistance_ohm']
   if nd<dist.get(v,1e99):dist[v]=nd;paths[v]=paths[u]+[data];heapq.heappush(queue,(nd,v))
 results=[]
 for f,p in pads:
  if f.GetReference()=='TH1':continue
  options=[node(p.GetPosition(),l)for l in [k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu]if p.IsOnLayer(l)];valid=[n for n in options if n in dist];assert valid,(name,f.GetReference(),p.GetNumber(),options);n=min(valid,key=lambda n:dist[n])
  results.append({'ref':f.GetReference(),'value':f.GetValue(),'pad':p.GetNumber(),'path_length_mm':sum(t['length_mm']for t in paths[n]),'trace_resistance_ohm':dist[n],'path':paths[n]})
 rows.append({'candidate':name,'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'copper_thickness_mm':thickness,'paths':results})
# At this hypothetical hot-side NTC resistance, extra series copper has dT/dR ~= -T^2/(B R).
assumed={'copper_resistivity_ohm_m':rho,'ntc_ohm':6500,'temperature_K':310,'beta_K':3435,'pullup_ohm':100000,'supply_V':3.3}
for row in rows:
 for path in row['paths']:
  R=path['trace_resistance_ohm'];path['conditional_delta_temperature_C']=R*assumed['temperature_K']**2/(assumed['beta_K']*assumed['ntc_ohm']);path['conditional_divider_delta_mV']=1000*assumed['supply_V']*assumed['pullup_ohm']*R/((assumed['pullup_ohm']+assumed['ntc_ohm'])*(assumed['pullup_ohm']+assumed['ntc_ohm']+R))
r={'status':'CONDITIONAL_DC_TRACE_COMPARISON_NOT_ERROR_BOUND','assumptions':assumed,'candidates':rows,'limits':['Declared resistivity scenario and nominal CAD copper geometry; not supplier worst-case process limits.','Vias treated as ideal; external wires, joints, contact and ground-return resistance excluded.','Each endpoint path is an isolated series-resistance sensitivity, not a full distributed circuit solution.','Beta sensitivity is approximate and does not bound the actual thermistor R-T curve.','No capacitance, inductive/capacitive pickup, comparator common-mode guarantees, leakage or PDN solution.','Longer path alone is not a rejection criterion; geometry/DRC alone is not acceptance.']}
(O/'batts-dc-path-comparison.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps([{**x,'paths':[{a:b for a,b in p.items()if a!='path'}for p in x['paths']]}for x in rows],indent=2))

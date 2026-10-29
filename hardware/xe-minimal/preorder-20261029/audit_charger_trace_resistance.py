from pathlib import Path
import pcbnew as k,wx,json,heapq,hashlib,collections
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'c32-branch-clean-trial.kicad_pcb';b=k.LoadBoard(str(src));fps={f.GetReference():f for f in b.GetFootprints()};layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu];thickness={k.F_Cu:.035,k.B_Cu:.035,k.In1_Cu:.0152,k.In2_Cu:.0152};rho=.01724 # ohm mm2/m, assumed copper at20C
pairs=[('U13','6','U3','10'),('J2','1','U3','2')];rows=[]
for ar,ap,br,bp in pairs:
 a=next(p for p in fps[ar].Pads() if p.GetNumber()==ap);z=next(p for p in fps[br].Pads() if p.GetNumber()==bp);net=a.GetNetname();assert net==z.GetNetname();adj={};edges={}
 def node(q,l):return(q.x,q.y,l)
 def link(n,m,res,data):
  adj.setdefault(n,[]).append((m,res));adj.setdefault(m,[]).append((n,res));edges[(n,m)]=edges[(m,n)]=data
 for t in b.GetTracks():
  if t.GetNetname()!=net:continue
  if isinstance(t,k.PCB_VIA):
   for l,h in zip(layers,layers[1:]):link(node(t.GetPosition(),l),node(t.GetPosition(),h),0,{'via_uuid':t.m_Uuid.AsString(),'trace_length_mm':0,'resistance_ohm':0})
  else:
   l=t.GetLayer();length=k.ToMM(t.GetLength());width=k.ToMM(t.GetWidth());res=rho*(length/1000)/(width*thickness[l]);data={'uuid':t.m_Uuid.AsString(),'layer':b.GetLayerName(l),'trace_length_mm':length,'width_mm':width,'copper_thickness_mm':thickness[l],'resistance_ohm':res};link(node(t.GetStart(),l),node(t.GetEnd(),l),res,data)
 for f in fps.values():
  for p in f.Pads():
   if p.GetNetname()!=net:continue
   for l in layers:
    if not p.IsOnLayer(l):continue
    for n in list(adj):
     if n[2]==l and p.GetEffectiveShape(l).Collide(k.VECTOR2I(n[0],n[1])):link(node(p.GetPosition(),l),n,0,{'trace_length_mm':0,'resistance_ohm':0,'pad':f.GetReference()+'.'+p.GetNumber()})
 # Include endpoint/pad/via joins on track interiors, omitted by the first graph.
 graph_nodes=list(adj)
 for t in b.GetTracks():
  if t.GetNetname()!=net or isinstance(t,k.PCB_VIA):continue
  l=t.GetLayer();shape=t.GetEffectiveShape(l);width=k.ToMM(t.GetWidth())
  for n in graph_nodes:
   if n[2]!=l or n in [node(t.GetStart(),l),node(t.GetEnd(),l)]:continue
   q=k.VECTOR2I(n[0],n[1])
   if not shape.Collide(q):continue
   for end in [t.GetStart(),t.GetEnd()]:
    length=k.ToMM((q-end).EuclideanNorm());res=rho*(length/1000)/(width*thickness[l]);link(n,node(end,l),res,{'uuid':t.m_Uuid.AsString(),'layer':b.GetLayerName(l),'trace_length_mm':length,'width_mm':width,'copper_thickness_mm':thickness[l],'resistance_ohm':res,'interior_join':True})
 starts=[node(a.GetPosition(),l) for l in layers if a.IsOnLayer(l)];ends={node(z.GetPosition(),l) for l in layers if z.IsOnLayer(l)};cost={n:0 for n in starts};queue=[(0,n) for n in starts];heapq.heapify(queue);prev={};found=None
 while queue:
  d,n=heapq.heappop(queue)
  if d!=cost[n]:continue
  if n in ends:found=n;break
  for m,r in adj.get(n,[]):
   nd=d+r
   if nd<cost.get(m,1e99):cost[m]=nd;prev[m]=n;heapq.heappush(queue,(nd,m))
 assert found is not None,(ar,br,'graph path missing')
 path=[];n=found
 while n in prev:path.append(edges[(prev[n],n)]);n=prev[n]
 tracks=[e for e in path if 'width_mm' in e];res=cost[found];bylayer=collections.defaultdict(float)
 for e in tracks:bylayer[e['layer']]+=e['trace_length_mm']
 rows.append({'from':ar+'.'+ap,'to':br+'.'+bp,'net':net,'selected_graph_trace_length_mm':sum(bylayer.values()),'length_by_layer_mm':dict(bylayer),'minimum_trace_width_mm':min(e['width_mm'] for e in tracks),'via_count':len({e['via_uuid'] for e in path if 'via_uuid' in e}),'nominal_trace_only_ohm_20C':res,'nominal_trace_only_drop_mV_at_100mA':res*100,'illustrative_80C_and_20pct_thinner_drop_mV_at_100mA':res*(1+.00393*60)/.8*100,'path':path[::-1]})
out={'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'status':'NOMINAL_TRACE_RESISTANCE_ESTIMATE_NOT_STARTUP_QUALIFICATION','assumptions':{'copper_resistivity_ohm_mm2_per_m_at20C':rho,'copper_temperature_coefficient_per_C':.00393,'outer_copper_mm':.035,'inner_copper_mm':.0152,'illustrative_temperature_C':80,'illustrative_thickness_factor':.8,'current_A':.1},'paths':rows,'limitations':['Nominal straight copper resistance model; stackup manufacturing values not accepted','Via barrels, solder, pads, connector, IC resistances and GND return excluded','No capacitance/inrush/transient or thermal model','Graph includes endpoint-to-track copper contacts but omits parallel conduction; selected path is not exact network equivalent','80C/20pct thinner example is sensitivity, not a manufacturer tolerance or pass limit'],'release_allowed':False};(w/'charger-trace-resistance.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps([{k:v for k,v in r.items() if k!='path'} for r in rows],indent=2))

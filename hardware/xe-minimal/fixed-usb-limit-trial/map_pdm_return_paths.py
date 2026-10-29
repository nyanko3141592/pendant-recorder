"""Map actual reference-copper gaps by routed segment, without waiving SI review."""
from pathlib import Path
import pcbnew as k, wx, json, hashlib, math
app=wx.App(False)
O=Path(__file__).resolve().parent/'led-land-trial'
p=O/'pendant-xe-minimal.kicad_pcb'; b=k.LoadBoard(str(p))
def xy(v): return [k.ToMM(v.x),k.ToMM(v.y)]
refs={k.F_Cu:k.In1_Cu,k.B_Cu:k.In3_Cu,k.In4_Cu:k.In3_Cu}
rows=[]
candidates=[t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetNetname() in ['/PDM_CLK','/PDM_DATA']]
for t,ref in [(t,r) for t in candidates for r in ([k.In1_Cu,k.In3_Cu] if t.GetLayer()==k.In2_Cu else [refs.get(t.GetLayer())])]:
 if isinstance(t,k.PCB_VIA) or t.GetNetname() not in ['/PDM_CLK','/PDM_DATA']: continue
 layer=t.GetLayer()
 if ref is None:
  rows.append({'uuid':t.m_Uuid.AsString(),'signal':t.GetNetname(),'layer':b.GetLayerName(layer),'status':'REFERENCE_NOT_ASSIGNED'});continue
 a,z=xy(t.GetStart()),xy(t.GetEnd());length=math.dist(a,z);n=max(1,math.ceil(length/.01)); intervals=[];start=None
 for i in range(n+1):
  point=[a[j]+(z[j]-a[j])*i/n for j in (0,1)];v=k.VECTOR2I(*(k.FromMM(x)for x in point))
  covered=any(q.GetNetname()=='/GND' and q.GetLayer()==ref and q.GetFilledPolysList(ref).Contains(v) for q in b.Zones())
  if not covered and start is None: start=i
  if start is not None and (covered or i==n):
   end=i-1 if covered else i
   intervals.append({'start_mm':[a[j]+(z[j]-a[j])*start/n for j in (0,1)],'end_mm':[a[j]+(z[j]-a[j])*end/n for j in (0,1)],'sampled_span_mm':length*(end-start)/n,'boundary_uncertainty_each_mm':length/n})
   start=None
 rows.append({'uuid':t.m_Uuid.AsString(),'signal':t.GetNetname(),'layer':b.GetLayerName(layer),'reference':b.GetLayerName(ref),'start_mm':a,'end_mm':z,'length_mm':length,'gaps':intervals})
both=[]
for uid in {x['uuid'] for x in rows if x['layer']=='In2.Cu'}:
 pair=[x for x in rows if x['uuid']==uid];assert len(pair)==2
 for g in pair[0]['gaps']:
  for h in pair[1]['gaps']:
   base=pair[0]['start_mm'];lo=max(math.dist(base,g['start_mm']),math.dist(base,h['start_mm']));hi=min(math.dist(base,g['end_mm']),math.dist(base,h['end_mm']))
   if hi>=lo:both.append({'uuid':uid,'signal':pair[0]['signal'],'distance_from_segment_start_mm':[lo,hi],'sampled_overlap_mm':hi-lo,'segment_start_mm':base,'segment_end_mm':pair[0]['end_mm']})
both.sort(key=lambda x:x['sampled_overlap_mm'],reverse=True)
r={'pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'status':'RETURN_PATH_REVIEW_REQUIRED','segments':rows,'In2_both_reference_planes_absent_intervals':both,'limitations':['Centerline only; maximum sampling step 0.01 mm.','Intervals stop at segment boundaries; lengths are not whole-net slot spans.','Absent reference copper includes necessary own-net via clearances.','In2 routes screened against both adjacent GND planes; other routes use nearest GND plane. Actual return-current distribution is unverified.']}
(O/'pdm-return-path-map.json').write_text(json.dumps(r,indent=2)+'\n')
print('segments',len(rows),'unassigned',sum('gaps' not in x for x in rows),'gap intervals',sum(len(x.get('gaps',[]))for x in rows))
print('largest sampled gap',max(g['sampled_span_mm']for x in rows for g in x.get('gaps',[])))

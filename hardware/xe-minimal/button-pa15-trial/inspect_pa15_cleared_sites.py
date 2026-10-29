from pathlib import Path
import runpy,json,math
O=Path(__file__).resolve().parent;g=runpy.run_path(str(O/'route_button_pa15_cleared_escape.py'));k=g['k'];b=g['b'];dist=g['dist'];xy=g['xy'];points=g['points'];a=g['a'];out=[]
for z in g['closed']:
 pos=points[z]
 if math.dist(pos,a)<.2:continue
 blocked=[]
 for f in b.GetFootprints():
  for p in f.Pads():
   bb=p.GetBoundingBox();r=(k.ToMM(bb.GetX()),k.ToMM(bb.GetY()),k.ToMM(bb.GetRight()),k.ToMM(bb.GetBottom()));d=math.hypot(max(r[0]-pos[0],0,pos[0]-r[2]),max(r[1]-pos[1],0,pos[1]-r[3]))
   if d<.28:blocked.append({'kind':'pad','ref':f.GetReference(),'pad':p.GetNumber(),'net':p.GetNetname(),'distance':d})
 for t in b.GetTracks():
  if t.GetNetname()=='/BUTTON_N':continue
  via=isinstance(t,k.PCB_VIA);rad=k.ToMM(t.GetWidth(k.In2_Cu) if via else t.GetWidth())/2+.28
  if dist(pos,xy(t.GetStart()),xy(t.GetEnd()))<rad:blocked.append({'kind':'via' if via else 'track','net':t.GetNetname(),'layer':t.GetLayer(),'uuid':t.m_Uuid.AsString(),'start':xy(t.GetStart()),'end':xy(t.GetEnd())})
 out.append({'pos':pos,'blocked':blocked,'distance':math.dist(pos,a)})
out=[q for q in out if not any(i.get('kind')=='pad' for i in q['blocked'])]
out.sort(key=lambda q:(len(q['blocked']),q['distance']));(O/'button-pa15-cleared-via-site-obstacles.json').write_text(json.dumps(out[:30],indent=2)+'\n');print(json.dumps(out[:5],indent=2))

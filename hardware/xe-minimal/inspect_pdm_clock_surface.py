from pathlib import Path
import runpy,json
O=Path(__file__).resolve().parent;g=runpy.run_path(str(O/'route_pdm_clock_fine_escape.py'));k=g['k'];b=g['b'];dist=g['dist'];xy=g['xy'];out=[]
for pos in [(18.6,y) for y in [11.6,11.7,11.8,11.9,12,12.1,12.2]]:
 obs=[]
 for t in b.GetTracks():
  via=isinstance(t,k.PCB_VIA)
  if not via and t.GetLayer()!=k.B_Cu:continue
  if dist(pos,xy(t.GetStart()),xy(t.GetEnd()))<k.ToMM(t.GetWidth(k.B_Cu) if via else t.GetWidth())/2+.18:obs.append({'uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'via':via,'start':xy(t.GetStart()),'end':xy(t.GetEnd())})
 out.append({'pos':pos,'obstacles':obs})
(O/'pdm-clock-surface-obstacles.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))

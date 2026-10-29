import json,math
from pathlib import Path
from scipy.optimize import linear_sum_assignment
O=Path(__file__).resolve().parent;rows=json.loads((O/'decoupling-distances.json').read_text())['rows'];groups={}
for r in rows:groups.setdefault((r['side'],*r['size']),[]).append(r)
changes=[]
for group in groups.values():
 costs=[[math.hypot(*( (slot['origin'][i]+p['pad_offset'][i]-p['target_position'][i])/1e6 for i in [0,1])) for slot in group] for p in group]
 a,b=linear_sum_assignment(costs)
 for i,j in zip(a,b):changes.append({'ref':group[i]['ref'],'slot_from':group[j]['ref'],'origin_nm':group[j]['origin'],'before_mm':group[i]['distance_mm'],'after_mm':costs[i][j]})
report={'status':'CAPACITOR_SLOT_ASSIGNMENT_ONLY_NOT_ROUTED','before_sum_mm':sum(x['before_mm'] for x in changes),'after_sum_mm':sum(x['after_mm'] for x in changes),'worst_after_mm':max(x['after_mm'] for x in changes),'changes':changes,'decision':'Even improved assignment is insufficient for close decoupling; build IC+capacitor placement blocks instead of accepting rectangle packing. No distance here is a datasheet pass threshold.'}
(O/'capacitor-slot-screen.json').write_text(json.dumps(report,indent=2)+'\n');print({k:v for k,v in report.items() if k!='changes'})

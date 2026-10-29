from pathlib import Path
import runpy,json,math
O=Path(__file__).resolve().parent;g=runpy.run_path(str(O/'route_button_alt_four_layer.py'));points=g['points'];closed=g['closed'];out={'a':g['a'],'c':g['c'],'goal_count':len(g['goals']),'regions':{}}
for l in g['layers']:
 pts=[points[z] for z in closed if z[2]==l];out['regions'][str(l)]={'count':len(pts),'bounds':[min(p[0] for p in pts),min(p[1] for p in pts),max(p[0] for p in pts),max(p[1] for p in pts)] if pts else None}
(O/'button-search-region.json').write_text(json.dumps(out,indent=2)+'\n');print(out)

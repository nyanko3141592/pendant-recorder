"""Explicit rail/tab topology proposal, not fabrication geometry."""
from pathlib import Path
import json,hashlib
p=Path(__file__).resolve().parent
b=p/'pendant-xe-minimal.kicad_pcb'
s=json.loads((p/'assembly-panel-tab-site-screen-5mm.json').read_text())
assert hashlib.sha256(b.read_bytes()).hexdigest()==s['source_pcb_sha256']
centers=[sum(v)/2 for v in s['edges']['bottom']['possible_tab_center_intervals_mm']]
rails=[[0,0,90,5],[0,72,90,77],[0,5,5,72],[85,5,90,72],[5,36,85,41]]
units=[];tabs=[]
for row,y in enumerate([7,43]):
 for col,x in enumerate([7,33,59]):
  unit=row*3+col+1;units.append({'unit':unit,'bounds_mm':[x,y,x+24,y+27]})
  for c in centers:tabs.append({'unit':unit,'bounds_mm':[x+c-2.5,y+27,x+c+2.5,y+29]})
# Rectangle adjacency graph: shared edges need positive overlap, not just a point.
rects=rails+[u['bounds_mm'] for u in units]+[t['bounds_mm'] for t in tabs]
def connected(a,b):
 dx=min(a[2],b[2])-max(a[0],b[0]);dy=min(a[3],b[3])-max(a[1],b[1])
 return dx>=-1e-8 and dy>=-1e-8 and max(dx,dy)>1e-8
seen={0};todo=[0]
while todo:
 i=todo.pop()
 for j,r in enumerate(rects):
  if j not in seen and connected(rects[i],r):seen.add(j);todo.append(j)
assert len(seen)==len(rects)
r={'status':'CONNECTED_RECTANGULAR_SUPPORT_TOPOLOGY_NOT_FABRICATION_DATA','source_pcb_sha256':s['source_pcb_sha256'],'panel_size_mm':[90,77],'rail_bounds_mm':rails,'units':units,'tabs':tabs,'all_rectangles_connected':True,'nominal_gap_mm':2,'limitations':['Square corners are illustrative: router diameter, relief and closed contour construction remain undesigned.','Two bottom tabs per board only; stiffness, vibration, reflow and cutting-force qualification absent.','Perforations from offset candidate not incorporated in this topology graph.','Fiducials, tooling holes, component and fixture sweeps remain to be added.','Panel dimensions affect production area only; finished board stays 24 x 27 mm.']}
(p/'supported-panel-topology-study.json').write_text(json.dumps(r,indent=2)+'\n')
svg=['<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="960" viewBox="-5 -8 100 96"><rect x="-5" y="-8" width="100" height="96" fill="white"/><text x="0" y="-3" font-size="2.5">90 x 77 mm support topology — NOT FOR FABRICATION</text>']
for group,color in [(rails,'#b7c4d1'),([u['bounds_mm'] for u in units],'#cbe5ff'),([t['bounds_mm'] for t in tabs],'#edac49')]:
 for x,y,X,Y in group:svg.append(f'<rect x="{x}" y="{y}" width="{X-x}" height="{Y-y}" fill="{color}" stroke="#333" stroke-width=".15"/>')
for u in units:
 x,y,X,Y=u['bounds_mm'];svg.append(f'<text x="{x+12}" y="{y+14}" font-size="3" text-anchor="middle">Unit {u["unit"]}</text>')
svg+=['<text x="0" y="82" font-size="1.8">Blue: 24 x 27 mm boards. Orange: two 5 mm bottom tabs per board.</text>','<text x="0" y="85" font-size="1.8">Grey: connected rails. Router geometry and mechanical strength unqualified.</text></svg>']
(p/'supported-panel-topology-study.svg').write_text('\n'.join(svg))
print(len(units),'boards',len(tabs),'tabs; connected support graph')

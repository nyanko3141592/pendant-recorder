"""Connected components of commanded part-bead prisms; no strength guarantee."""
from pathlib import Path
import argparse,runpy,contextlib,io,sys,json
O=Path(__file__).resolve().parent
parser=argparse.ArgumentParser();parser.add_argument('--trimmed',action='store_true');args=parser.parse_args()
sys.argv=['check','--lower','ntcaflex-relocated-support-lower-first018','--separator','ntcaflex-board-relief-supported-flipped-separator','--output','ntcaflex-printed-mating-review.json']
if args.trimmed:
 sys.argv[sys.argv.index('--separator')+1]='ntcaflex-trimmed-supported-flipped-separator'
 sys.argv[sys.argv.index('--output')+1]='ntcaflex-trimmed-mating-review.json'
with contextlib.redirect_stdout(io.StringIO()):state=runpy.run_path(str(O/'check_lead_wrap_full_mating.py'))
nodes=[]
for layer in state['parts']['separator']:
 area=layer['area'];polys=list(area.geoms) if hasattr(area,'geoms') else [area]
 for p in polys:
  if p.area>1e-9:nodes.append({'polygon':p,'bottom':layer['bottom'],'top':layer['top'],'print_z':layer['print_z']})
parent=list(range(len(nodes)))
def root(i):
 while parent[i]!=i:parent[i]=parent[parent[i]];i=parent[i]
 return i
edges=0
for i,a in enumerate(nodes):
 for j in range(i):
  b=nodes[j]
  if min(a['top'],b['top'])<max(a['bottom'],b['bottom'])-1e-7:continue
  if a['polygon'].intersection(b['polygon']).area<=1e-9:continue
  parent[root(i)]=root(j);edges+=1
groups={}
for i,node in enumerate(nodes):groups.setdefault(root(i),[]).append(node)
components=[]
for group in groups.values():
 components.append({'prism_count':len(group),'summed_prism_volume_mm3':sum(q['polygon'].area*(q['top']-q['bottom'])for q in group),'bounds_mm':[min(q['polygon'].bounds[0]for q in group),min(q['polygon'].bounds[1]for q in group),min(q['bottom']for q in group),max(q['polygon'].bounds[2]for q in group),max(q['polygon'].bounds[3]for q in group),max(q['top']for q in group)]})
components.sort(key=lambda q:-q['summed_prism_volume_mm3'])
r={'status':'NOMINAL_BEAD_CONNECTIVITY_NOT_STRENGTH','sources':state['sources'],'node_count':len(nodes),'edge_count':edges,'connected_components':components,'limits':['Requires positive XY overlap between prisms with touching/overlapping Z; point contacts excluded.','Commanded rectangular bead model, not actual fusion or adhesion.','Removable supports excluded.','Finite geometric precision can create small disconnected slivers; all are reported without silently discarding them.']}
(O/('ntcaflex-trimmed-connectivity.json' if args.trimmed else 'ntcaflex-print-connectivity.json')).write_text(json.dumps(r,indent=2)+'\n');print('nodes',len(nodes),'components',len(components));print(json.dumps(components[:8],indent=2))

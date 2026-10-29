"""Conservative axis-aligned courtyard screening, not assembly tooling approval."""
from pathlib import Path
import json,hashlib
import pcbnew as k,wx
app=wx.App(False)
p=Path(__file__).resolve().parent;layout=json.loads((p/'assembly-panel-layout-study.json').read_text());board=p/'pendant-xe-minimal.kicad_pcb';assert hashlib.sha256(board.read_bytes()).hexdigest()==layout['source_pcb_sha256'];b=k.LoadBoard(str(board));parts=[];missing=[]
for f in b.GetFootprints():
 ref=f.GetReference()
 if ref=='J3' or ref.startswith('TP'):continue
 items=[s for s in f.GraphicalItems() if s.GetLayer() in (k.F_CrtYd,k.B_CrtYd)]
 if not items:missing.append(ref);continue
 boxes=[s.GetBoundingBox() for s in items]
 parts.append({'ref':ref,'side':'B' if f.IsFlipped() else 'F','bounds':[min(k.ToMM(v.GetX()) for v in boxes),min(k.ToMM(v.GetY()) for v in boxes),max(k.ToMM(v.GetRight()) for v in boxes),max(k.ToMM(v.GetBottom()) for v in boxes)]})
placed=[]
for unit in layout['placements']:
 assert unit['rotation_degrees']==0
 for part in parts:
  x0,y0,x1,y1=part['bounds'];placed.append({'unit':unit['unit'],'ref':part['ref'],'side':part['side'],'bounds':[x0+unit['x_mm'],y0+unit['y_mm'],x1+unit['x_mm'],y1+unit['y_mm']]})
def overlap(a,b):return min(a[2],b[2])>max(a[0],b[0]) and min(a[3],b[3])>max(a[1],b[1])
conflicts=[]
for i,a in enumerate(placed):
 for c in placed[i+1:]:
  if a['unit']!=c['unit'] and a['side']==c['side'] and overlap(a['bounds'],c['bounds']):conflicts.append([a,c])
rails=[[0,0,5,70],[81,0,86,70],[0,0,86,7],[0,63,86,70]]
rail_conflicts=[{'part':a,'rail':r} for a in placed for r in rails if overlap(a['bounds'],r)]
r={'status':'COURTYARD_BOUNDING_BOX_SCREEN_ONLY','source_pcb_sha256':layout['source_pcb_sha256'],'parts_with_courtyard':len(parts),'parts_without_courtyard':missing,'cross_unit_same_side_conflicts':conflicts,'courtyard_to_provisional_rail_conflicts':rail_conflicts,'local_courtyards':parts,'limitations':['Courtyard is a library design envelope, not a verified component body/nozzle envelope.','No depanelization tabs, router, clamps or fixture sweep evaluated.','Overlapping courtyard with empty rail material indicates a review region, not necessarily actual body collision.']}
(p/'assembly-panel-courtyard-screen.json').write_text(json.dumps(r,indent=2)+'\n');print('Courtyards',len(parts),'missing',missing,'cross-unit',len(conflicts),'rail',len(rail_conflicts))

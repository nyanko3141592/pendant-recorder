"""Screen short edge-bearing sites against pad envelopes and component bodies."""
from pathlib import Path
import json,hashlib,cadquery as cq
O=Path(__file__).resolve().parent;I=json.loads((O/'board-inventory.json').read_text());f=O/'pcb-partial-with-body-envelopes.step';s=cq.importers.importStep(str(f)).val();th=I['board_thickness_mm'];bodies=[]
for v in s.Solids():
 b=v.BoundingBox()
 if abs(b.xlen-24)<1e-4 and abs(b.ylen-27)<1e-4 and abs(b.zlen-th)<1e-4:continue
 bodies.append(b)
def intersects(a,b):return a[0]<b[1] and a[1]>b[0] and a[2]<b[3] and a[3]>b[2]
rows=[]
for side in ['left','right','front','rear']:
 for i in range(2,51 if side in ['left','right'] else 45):
  c=i*.5
  # Board-coordinate pad screen; STEP Y is negative board Y.
  rect=[0,.7,c-.75,c+.75] if side=='left' else [23.3,24,c-.75,c+.75] if side=='right' else [c-.75,c+.75,0,.7] if side=='front' else [c-.75,c+.75,26.3,27]
  hits=[]
  for p in I['parts']:
   for pad in p['pads']:
    x,y=pad['position_mm'];w,h=pad['size_mm'];r=[x-w/2-.2,x+w/2+.2,y-h/2-.2,y+h/2+.2]
    if intersects(rect,r):hits.append(p['ref']+':'+pad['number'])
  r=[rect[0],rect[1],-rect[3],-rect[2]]
  bodyhits=sum(intersects(r,[b.xmin,b.xmax,b.ymin,b.ymax]) and ((b.zmin<0 and b.zmax>-.3) or (b.zmin<th+.3 and b.zmax>th)) for b in bodies)
  if not hits and not bodyhits:rows.append({'side':side,'center_along_edge_mm':c,'bearing_rect_board_xy_mm':rect,'bearing_area_mm2':1.05})
r={'status':'EDGE_SUPPORT_SCREEN_NOT_RETENTION_APPROVAL','pcb_sha256':I['pcb_sha256'],'source_step_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'candidate_sites':rows,'limitations':['Pads use unrotated size bounding boxes; selected sites require exact KiCad pad-shape confirmation','Component bodies are approximate; solder fillets omitted','Case clip insertion path, board tolerance and retention loads unverified','0.7mm inward by1.5mm bearing and0.2mm pad margin are study assumptions']};(O/'pcb-support-screen.json').write_text(json.dumps(r,indent=2)+'\n');print(rows)

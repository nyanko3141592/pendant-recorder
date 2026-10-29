"""Local pad-site search on unchanged board; supports require CAD recheck."""
from pathlib import Path
import json, math, hashlib
P=Path(__file__).resolve().parent
src=P.parents[1]/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json'
h=json.loads(src.read_text())
def margin(x,y,side):
 values=[]
 for p in h['parts']:
  if p['side']!=side:continue
  dx=abs(x-p['x_mm'])-1-p['w_mm']/2
  dy=abs(y-p['y_mm'])-1-p['d_mm']/2
  dist=math.hypot(max(dx,0),max(dy,0)) if max(dx,dy)>=0 else max(dx,dy)
  values.append((dist,p['ref']))
 return min(values)
rows=[]
all_candidates=[]
for ox,oy in [(1.5,20.5),(20,23.5),(17.5,27)]:
 candidates=[]
 for ix in range(-15,16):
  for iy in range(-15,16):
   x,y=round(ox+ix*.1,4),round(oy+iy*.1,4)
   if x<1 or y<1 or x>25 or y>28:continue
   f,fr=margin(x,y,'F');b,br=margin(x,y,'B')
   if b<.2-1e-9:continue
   # Require room for pad widening in all directions including board edge.
   edge=min(x-1,25-x,y-1,28-y)
   score=min(f,b,edge)
   candidates.append(dict(center_board_mm=[x,y],F_margin_mm=f,F_nearest=fr,B_margin_mm=b,B_nearest=br,board_edge_margin_mm=edge,usable_lateral_margin_mm=score,distance_from_original_mm=math.hypot(x-ox,y-oy)))
 candidates.sort(key=lambda c:(-c['usable_lateral_margin_mm'],c['distance_from_original_mm']))
 all_candidates.append(candidates)
 rows.append(dict(original_center_board_mm=[ox,oy],original_F_margin_mm=margin(ox,oy,'F')[0],best=candidates[0],top_five=candidates[:5]))
# Joint screen: separate 2x2 pads by at least1.0mm; independent maxima can overlap.
first=all_candidates[0][0]
def separation(a,b):
 x,y=a['center_board_mm'];u,v=b['center_board_mm']
 return math.hypot(max(abs(x-u)-2,0),max(abs(y-v)-2,0))
pairs=[]
for b in all_candidates[1]:
 for c in all_candidates[2]:
  if min(separation(first,b),separation(first,c),separation(b,c)) < 1.0-1e-9:continue
  pairs.append((min(b['usable_lateral_margin_mm'],c['usable_lateral_margin_mm']),b['usable_lateral_margin_mm']+c['usable_lateral_margin_mm'],b,c))
best=max(pairs,key=lambda x:x[:2])
joint=[first,best[2],best[3]]
out=dict(status='BALANCED_RETENTION_SITE_SEARCH_NOT_ADOPTED',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),grid_mm=.1,search_radius_each_axis_mm=1.5,pad_square_mm=2,minimum_B_margin_mm=.2,sites=rows,limitations=['Component envelopes only; pad bulging and placement not modeled.','All lower support bridges must be regenerated and checked at proposed locations.','No stiffness, electrical surface, wire, adhesive or assembly tolerance qualification.'],release_allowed=False)
out['joint_selection']=joint
out['minimum_pad_pair_separation_mm']=min(separation(joint[i],joint[j]) for i,j in [(0,1),(0,2),(1,2)])
print('Joint:',joint)
(P/'retention-balanced-clearance-review.json').write_text(json.dumps(out,indent=2)+'\n')
for row in rows: print(row['original_center_board_mm'],row['best'])

"""Find nominal component-free lid-contact squares; not load approval."""
from pathlib import Path
import json,hashlib
P=Path(__file__).resolve().parent
src=P.parents[1]/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json'
h=json.loads(src.read_text());rows=[]
for size in [1.6,2.0]:
 for iy in range(3,55):
  y=iy*.5
  for ix in range(3,49):
   x=ix*.5
   if x-size/2<0 or x+size/2>26 or y-size/2<0 or y+size/2>29:continue
   hits=[p['ref'] for p in h['parts'] if p['side']=='F' and abs(p['x_mm']-x)<size/2+.2+p['w_mm']/2 and abs(p['y_mm']-y)<size/2+.2+p['d_mm']/2]
   if not hits:rows.append(dict(square_size_mm=size,center_board_mm=[x,y]))
both=[]
for row in rows:
 if row['square_size_mm']!=2.:continue
 x,y=row['center_board_mm']
 if any(p['side']=='B' and abs(p['x_mm']-x)<1.2+p['w_mm']/2 and abs(p['y_mm']-y)<1.2+p['d_mm']/2 for p in h['parts']):continue
 # Original mechanical datum: PCB offset2/1.5, pack XY1.5..17/1.5..28.5.
 # Any vertical floor post overlapping that pack rectangle is unsuitable.
 cx,cy=x+2,y+1.5
 battery_overlap=(cx+1>1.5 and cx-1<17 and cy+1>1.5 and cy-1<28.5)
 both.append(dict(center_board_mm=[x,y],vertical_floor_post_would_overlap_pack=battery_overlap))
r=dict(status='RETENTION_CONTACT_SITE_SCREEN_NOT_CLAMP_DESIGN',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),grid_step_mm=.5,additional_planar_component_clearance_mm=.2,sites=rows,site_counts={str(s):sum(r['square_size_mm']==s for r in rows) for s in [1.6,2.]},front_half_counts={str(s):sum(r['square_size_mm']==s and r['center_board_mm'][1]<14.5 for r in rows) for s in [1.6,2.]},existing_bottom_support_contact_area_screen_mm2=5.0,area_basis='Two right tabs overlap board by1x2mm and left tab by0.5x2mm at nominal coordinates.',limitations=['Top component envelopes only; copper, test features, solder mask strength, PCB flex and clamping force not qualified.','Nominal contact area on bottom tabs is not adhesive bond strength or a tolerance guarantee.','No pad/foam material, compression range, preload or hold-down placement selected.','Discrete grid cannot prove no continuous feasible location.','Any retention approach must preserve microphone alignment, battery clearance and unchanged30x32x15 external limit.'])
r['both_side_two_mm_sites']=both
r['both_side_two_mm_count']=len(both)
r['both_side_earliest_Y_mm']=min(x['center_board_mm'][1] for x in both)
r['floor_post_pack_clear_count']=sum(not x['vertical_floor_post_would_overlap_pack'] for x in both)
r['limitations'].append('Floor-post screen uses pack XY only; other structures, body stiffness and electrical clearances still require CAD/DFM review.')
(P/'pcb-retention-sites.json').write_text(json.dumps(r,indent=2)+'\n')
print('Sites:',r['site_counts'],'front-half:',r['front_half_counts'])

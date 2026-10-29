"""Nominal planar placement search; envelopes are explicit engineering screens."""
from pathlib import Path
import json,math
from shapely.geometry import box,Point
from shapely.affinity import rotate,translate
O=Path(__file__).resolve().parent
battery=box(.9,-27,16.4,0)
# Nominal reference STEP: head centered at origin; tail stiffener x=-20..-16.
head=Point(0,0).buffer(3.25,resolution=32)
tail=box(-20,-2,-16,2)
body=head.union(box(-20,-2,5,2))
outer=box(-1.1,-28.3,25.1,1.3)
rows=[]
for deg in range(0,360,5):
 rh,rt,rb=[rotate(s,deg,origin=(0,0))for s in (head,tail,body)]
 for ix in range(8,27):
  x=ix*.5
  for iy in range(-47,-6):
   y=iy*.5;h,t,b=[translate(s,xoff=x,yoff=y)for s in (rh,rt,rb)]
   if not battery.covers(h) or not outer.covers(b):continue
   gap=t.distance(battery)
   if gap<.2:continue
   rows.append({'head_center_xy_mm':[x,y],'rotation_deg':deg,'tail_battery_xy_gap_mm':gap,'sensor_planar_bounds_mm':list(b.bounds)})
rows.sort(key=lambda q:-q['tail_battery_xy_gap_mm'])
r={'status':'PLANAR_SEARCH_NOT_3D_FIT','candidate_count':len(rows),'candidates':rows[:30],'grid':{'angle_step_deg':5,'xy_step_mm':.5},'assumptions':['Head radius3.25 uses datasheet maximum diameter.','Tail rectangle uses nominal related-HH STEP stiffener extent; tolerance not included.','Body planar union is a conservative simple envelope, not exact curved outline.','Head entirely inside battery footprint, tail >=0.2mm outside; both conditions are engineering search constraints.','Outer rectangle is case bounding box, not usable interior.'],'limits':['Board, walls, separator, solder, harness and supports excluded.','Search does not establish global optimality or impossibility.','No bending or physical qualification.']}
(O/'ntcaflex-planar-search.json').write_text(json.dumps(r,indent=2)+'\n');print('candidates',len(rows));print(json.dumps(rows[:3],indent=2))

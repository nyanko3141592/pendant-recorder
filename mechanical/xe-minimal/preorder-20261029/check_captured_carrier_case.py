from pathlib import Path
import json,cadquery as cq
H=Path(__file__).resolve().parent;O=H/'captured-carrier-case';FIT=H.parents[2]/'hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/fit-kit'
load=lambda n:cq.importers.importStep(str(O/(n+'.step'))).val()
lower,upper,carrier,battery,gauge=[load(n) for n in ['case-lower','case-upper','carrier','battery-max-positioned','pcba-max-gauge']]
def box(a):
 x0,x1,y0,y1,z0,z1=a;return cq.Workplane('XY').box(x1-x0,y1-y0,z1-z0).val().translate(((x0+x1)/2,(y0+y1)/2,(z0+z1)/2))
def sweep(q):
 b=q.BoundingBox();return box([b.xmin,b.xmax,b.ymin,b.ymax,b.zmin,12])
checks={'battery_body_insertion_sweep_overlap_mm3':lower.intersect(sweep(battery)).Volume(),'carrier_insertion_sweep_overlap_mm3':lower.intersect(sweep(carrier)).Volume()}
# Every conservative component box swept upward individually, plus board slab.
boxes=json.loads((FIT/'connected-gauge-review.json').read_text())['component_boxes'];obstacles=lower.fuse(carrier)
hits=[]
for r in boxes:
 a=r['bbox_mm'][:];a[5]=12;v=obstacles.intersect(box(a)).Volume()
 if v>1e-8:hits.append({'source_solid':r['source_solid'],'overlap_mm3':v})
checks['pcba_component_insertion_sweep_hits']=hits;checks['pcb_slab_insertion_sweep_overlap_mm3']=obstacles.intersect(box([0,27.5,-27,.5,-.035,12])).Volume()
# Check closed-lid capture against all four support lands, at maximum thickness.
checks['upward_stop_contact_at_0p101mm_mm3']=gauge.translate((0,0,.101)).intersect(upper).Volume()
checks['carrier_and_board_upward_stop_contact_at_0p101mm_mm3']=gauge.fuse(carrier).translate((0,0,.101)).intersect(upper).Volume()
checks['nominal_support_contact_mm3']=carrier.intersect(gauge.translate((0,0,-.001))).Volume()
rows=[]
for dx,dy in [(-.1,-.1),(-.1,.1),(.1,-.1),(.1,.1)]:
 moved=gauge.fuse(carrier).translate((dx,dy,0));rows.append({'xy_offset_mm':[dx,dy],'lower_overlap_mm3':moved.intersect(lower).Volume(),'upper_overlap_mm3':moved.intersect(upper).Volume()})
checks['common_xy_offset_corner_checks']=rows
r={'checks':checks,'scope':'Conservative straight +Z swept body envelopes. Harness omitted. XY offset checks are four discrete corner cases, not certified manufacturing tolerances.','original_harness_insertion_verified':False,'physical_qualification':False}
(O/'capture-and-insertion-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

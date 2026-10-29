from pathlib import Path
import cadquery as cq,json
p=Path(__file__).resolve().parent/'retained-battery-case'
def load(n):return cq.importers.importStep(str(p/(n+'.step'))).val()
lower=load('case-lower'); battery=load('battery-max-positioned'); sep=load('separator')
# Conservative full rectangular swept envelopes, not sparse position sampling.
def up_sweep(shape):
 b=shape.BoundingBox();return cq.Workplane('XY').box(b.xlen,b.ylen,12-b.zmin).val().translate(((b.xmin+b.xmax)/2,(b.ymin+b.ymax)/2,(12+b.zmin)/2))
r={'battery_body_vertical_insertion_overlap_mm3':lower.intersect(up_sweep(battery)).Volume(),'separator_vertical_insertion_overlap_mm3':lower.intersect(up_sweep(sep)).Volume(),'harness_insertion_verified':False,'separator_positive_retention_verified':False}
gauge=cq.importers.importStep(str(Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/fit-kit/pcba-max-thickness-connected-gauge.step'))).val();r['max_board_gauge_lower_overlap_mm3']=lower.intersect(gauge).Volume();r['max_board_gauge_separator_overlap_mm3']=sep.intersect(gauge).Volume()
(p/'assembly-path-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)

"""Bounded comparison with unchanged internals; no replacement of Case V3."""
from pathlib import Path
import json,math,hashlib
import cadquery as cq
HERE=Path(__file__).resolve().parent
OUT=HERE/'fixed-board-compact-review';OUT.mkdir(exist_ok=True)
source=HERE/'build_actual_fit_case_v3.py';text=source.read_text()
prefix=text[:text.index('W = D = 31.4')]
# Run only shared construction; never run baseline exports.
ns={'__file__':str(source),'__name__':'comparison'};exec(compile(prefix,str(source),'exec'),ns)
body=text[text.index('W = D = 31.4'):text.index('\nfiles=[]')]
def outline(w,d,r):
 pts=[]
 for cx,cy,start in [(w/2-r,d/2-r,0),(-w/2+r,d/2-r,90),(-w/2+r,-d/2+r,180),(w/2-r,-d/2+r,270)]:
  for i in range(101):
   a=math.radians(start+i*.9);pts.append((cx+r*math.cos(a),cy+r*math.sin(a)))
 return pts
def clearance(w,r,points):
 def margin(p):
  x,y=abs(p[0])-(w/2-r),abs(p[1])-(w/2-r)
  return r-math.hypot(max(x,0),max(y,0))-min(max(x,y),0)
 return min(margin(p) for p in points)
results=[]
for label,w,r in [('baseline',31.4,3.2),('compact-rounded',30.8,2.2),('compact-soft-square',30.6,1.8)]:
 local=dict(ns);code=body.replace('W = D = 31.4',f'W = D = {w}').replace('PLAN_R, EDGE_R = 3.2, 1.2',f'PLAN_R, EDGE_R = {r}, 1.2')
 exec(compile(code,str(source),'exec'),local)
 lower,upper=local['lower'],local['upper'];outer=outline(w,w,r);cavity=outline(28,28.2,.55);groove=outline(29.25,29.45,1.17)
 row={'variant':label,'width_depth_nominal_mm':w,'height_nominal_mm':13.9,'plan_radius_mm':r,'internal_poses_changed':False,'cad_checks':local['checks'],'shell_volume_mm3':lower.Volume()+upper.Volume(),'minimum_plan_wall_mm':clearance(w,r,cavity),'minimum_plan_seam_wall_mm':clearance(w,r,groove),'volume_bbox_reduction_percent':100*(1-(w/31.4)**2),'cord_tunnel_intersects_geometric_cavity_mm3':local['cord_tunnel'].intersect(local['cavity']).Volume(),'battery_floor_clearance_mm':.25,'physical_release_allowed':False}
 for name,shape in [('lower',lower),('upper',upper)]:
  p=OUT/f'{label}-{name}.step';cq.exporters.export(shape,str(p));row[name+'_sha256']=hashlib.sha256(p.read_bytes()).hexdigest()
 results.append(row);print(json.dumps(row),flush=True)
report={'board_mm':[27.5,27.5],'baseline_preserved':True,'comparison':results,'selection':'NOT_SELECTED_PENDING_RETENTION_AND_CORD_REVIEW','limitations':['Unchanged 0.25 mm battery-floor clearance is not demonstrated shock cushioning or swelling allowance.','Rounded cavity and tongue/groove wall distances are 2D seam screens, not minimum 3D ligaments at USB/cord openings.','Cord tunnel can enter empty cavity without hitting current internals; qualify battery retention and cord isolation before selection.','No drop/fatigue/thermal/print tests have run.'],'external_actions':{'order':False,'upload':False,'payment':False,'supplier_contact':False}}
(OUT/'review.json').write_text(json.dumps(report,indent=2)+'\n')

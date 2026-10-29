"""Nominal case fit of external PCB tab remnants; no depanelization approval."""
from pathlib import Path
import cadquery as cq,json,hashlib,argparse
a=argparse.ArgumentParser();a.add_argument("--upper",default="thickness-clearance-upper-trial.step");a.add_argument("--output",default="carrier-tab-residual-fit-review.json");args=a.parse_args()
P=Path(__file__).resolve().parent
files={'lower':'wider-right-support-lower-trial.step','upper':args.upper,'separator':'support-notched-separator-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(P/v)).val() for k,v in files.items()}
rows=[]
# PCB origin: KiCad(x,y) -> assembly(x,-y); underside z=0.
for edge,center,width in [('bottom',3.8,5.),('bottom',20.2,5.),('bottom',3.8,4.),('bottom',20.2,4.),('left',7.735,3.)]:
 for residual in [.05,.1,.15,.2,.25,.3,.4,.5]:
  if edge=='bottom':dims=(width,residual,.93);pos=(center-width/2,-27-residual,0)
  else:dims=(residual,width,.93);pos=(-residual,-center-width/2,0)
  tab=cq.Workplane('XY').box(*dims,centered=(False,False,False)).translate(pos).val()
  overlaps={k:round(tab.intersect(v).Volume(),9) for k,v in s.items()}
  sweep=cq.Workplane('XY').box(dims[0],dims[1],20+.93,centered=(False,False,False)).translate(pos).val()
  rows.append({'edge':edge,'center_mm':center,'tab_width_mm':width,'residual_mm':residual,'pcb_thickness_mm':.93,'nominal_final_overlap_mm3':overlaps,'vertical_insertion_overlap_lower_mm3':round(sweep.intersect(s['lower']).Volume(),9),'minimum_distance_to_case_mm':round(min(tab.distance(s[k]) for k in ['lower','upper']),6)})
r={'status':'RESIDUAL_TAB_GEOMETRY_SCREEN_NOT_CUT_OR_ASSEMBLY_APPROVAL','sources_sha256':{k:hashlib.sha256((P/v).read_bytes()).hexdigest() for k,v in files.items()},'coordinate_map':'KiCad(x,y) -> case(x,-y), PCB underside z=0','rows':rows,'limits':['Rectangular residual envelopes, no cut roughness or burrs.','Nominal CAD only; no printing tolerances, board outline tolerances, tool positioning or flex accounted.','PCB thickness .93 mm is existing upper envelope, no substrate compliance modeled.','No tool access, fixture or support strength validated.','No geometry changed.']}
(P/args.output).write_text(json.dumps(r,indent=2)+'\n')
for x in rows:print(x['edge'],x['center_mm'],x['residual_mm'],x['nominal_final_overlap_mm3'],'insert',x['vertical_insertion_overlap_lower_mm3'],'distance',x['minimum_distance_to_case_mm'])

"""Raised separator ribs over sensor; nominal geometry only."""
from pathlib import Path
import cadquery as cq,json,hashlib,argparse
O=Path(__file__).resolve().parent
parser=argparse.ArgumentParser();parser.add_argument('--width',type=float,default=1.2);parser.add_argument('--prefix',default='film-bridge');args=parser.parse_args();assert args.width>0
w=args.width
files={'separator':'film-slot-separator-trial.step','board':'ncu-candidate-integrated-board.step','lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
film=cq.Workplane('XY').box(4.1,26,.5,centered=(True,True,False)).translate((9,-13.5,-2.32)).val()
def box(x,y,z,dx,dy,dz):return cq.Workplane('XY').box(dx,dy,dz,centered=(False,False,False)).translate((x,y,z)).val()
def rib(y):
 # Roof .30 above max sensor top; feet outside slot; overlaps original separator.
 roof=box(6.05,y-w/2,-1.52,5.9,w,.4)
 left=box(6.05,y-w/2,-2.22,.6,w,.8)
 right=box(11.35,y-w/2,-2.22,.6,w,.8)
 return roof.fuse(left,right)
rows=[]
for y in [-2,-4,-6,-8,-10,-12,-14,-16,-18,-20,-22,-24,-25]:
 r=rib(y);rows.append({'center_y_mm':y,'overlap_mm3':{k:r.intersect(s[k]).Volume() for k in ['board','lower','upper']},'sensor_overlap_mm3':r.intersect(film).Volume()})
safe=[x for x in rows if max(x['overlap_mm3'].values())<1e-7 and x['sensor_overlap_mm3']<1e-7]
selected=[safe[0]['center_y_mm'],safe[-1]['center_y_mm']] if len(safe)>=2 else []
new=s['separator']
for y in selected:new=new.fuse(rib(y))
assert new.isValid() and len(new.Solids())==1
cq.exporters.export(new,str(O/(args.prefix+'-separator-trial.step')))
a=cq.Assembly(name='raised_rib_study');a.add(new,name='separator',color=cq.Color('#d8b84e'));a.add(film,name='sensor_envelope',color=cq.Color('#ee8866'));a.export(str(O/(args.prefix+'-separator-study.step')))
r={'status':'RAISED_RIB_GEOMETRY_CANDIDATE_NOT_QUALIFIED','source_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'rows':rows,'selected_rib_centers_y_mm':selected,'roof_thickness_mm':.4,'rib_width_y_mm':w,'nominal_sensor_to_roof_gap_mm':.3,'valid_solids':len(new.Solids()),'added_volume_mm3':new.Volume()-s['separator'].Volume(),'limitations':['Ribs improve geometric section only; strength and PLA creep not measured.','No printer support/orientation qualification; roof creates4.7mm bridge span.','Sensor installation path with solder joints and wires not proven; no pressing or clamping approved.','Adhesive, cell and print tolerances may consume clearance.','Exposed-lead insulation still needed; current PCB still includes TH1.','No adoption, printing or purchase.']}
(O/(args.prefix+'-separator-review.json')).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

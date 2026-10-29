"""Two open channels for insulated joint budgets. No retention qualification."""
from pathlib import Path
import cadquery as cq,json,hashlib
from wire_geometry import rounded
O=Path(__file__).resolve().parent
files={'board':'film-sensor-depopulated-board-study.step','separator':'diagonal-bridge-separator-trial.step','lower':'diagonal-film-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def box(w,l,h,x,y,z):return cq.Workplane('XY').box(w,l,h,centered=(True,False,False)).translate((x,y,z)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
# 0.4 mm outside walls, 0.7 mm central wall, 0.1 mm side/floor allowance.
blank=box(3.7,3.8,1.7,0,22.6,-2.82)
channels=[box(1.1,4,1.4,x,22.5,-2.42) for x in [-.9,.9]]
# Open the last 0.9 mm above the floor so rounded wires can turn without wall contact.
exit_relief=box(4,1.0,1.5,0,25.5,-2.42)
return_wire_notch=box(.6,1.2,.8,-1.65,24.3,-1.73)
tray=pose(blank.cut(*channels,exit_relief,return_wire_notch).clean())
joints=[pose(box(.9,3,.8,x,23,-2.32)) for x in [-.9,.9]]
body=pose(box(4.1,22,.5,0,0,-2.32))
leads=[pose(box(.7,4,.5,x,22,-2.32)) for x in [-.95,.95]]
route_path=O/'diagonal-wire-wide-lanes-review.json';route=json.loads(route_path.read_text());selected=route['rows'][route['selected_row']]
wires=[rounded(p,selected['radius_mm'])[0] for p in selected['paths_mm']]
checks={k:{'overlap_mm3':tray.intersect(q).Volume(),'clearance_mm':tray.distance(q)} for k,q in s.items()}
for k,q in [('joints',cq.Compound.makeCompound(joints)),('sensor',cq.Compound.makeCompound([body]+leads)),('wires',cq.Compound.makeCompound(wires))]:checks[k]={'overlap_mm3':tray.intersect(q).Volume(),'clearance_mm':tray.distance(q)}
wire_contacts=[]
for i,w in enumerate(wires):
 contact=tray.intersect(w)
 for solid in contact.Solids():
  local=solid.translate((-7.6,25.5,0)).rotate((0,0,0),(0,0,1),28);b=local.BoundingBox()
  wire_contacts.append({'wire_index':i,'volume_mm3':solid.Volume(),'local_bounds_mm':[b.xmin,b.ymin,b.zmin,b.xmax,b.ymax,b.zmax]})
cq.exporters.export(tray,str(O/'diagonal-joint-tray-trial.step'))
a=cq.Assembly(name='diagonal_joint_tray_trial')
for k,q in {**s,'tray':tray,'joints':cq.Compound.makeCompound(joints),'sensor':cq.Compound.makeCompound([body]+leads),'wires':cq.Compound.makeCompound(wires)}.items():a.add(q,name=k)
a.export(str(O/'diagonal-joint-tray-study.step'))
r={'status':'OPEN_JOINT_TRAY_GEOMETRY_TRIAL_NOT_ADOPTED','source_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'route_source_sha256':hashlib.sha256(route_path.read_bytes()).hexdigest(),'valid':tray.isValid(),'solid_count':len(tray.Solids()),'outer_width_mm':3.7,'length_mm':3.8,'height_mm':1.7,'floor_mm':.4,'outer_wall_mm':.4,'central_wall_mm':.7,'channel_width_mm':1.1,'open_exit_length_mm':.9,'joint_side_floor_allowance_mm':.1,'checks':checks,'wire_contacts':wire_contacts,'wire_to_other_joint_overlap_mm3':[wires[i].intersect(joints[1-i]).Volume() for i in range(2)],'limits':['Open tray has no lid or axial strain relief, and is not attached to the case.','Joint dimensions are provisional insulated envelopes, not a validated solder/wrap process.','Wire route remains provisional and has only 0.099 mm inter-wire gap.','No print or assembly qualification.','Lead width is an allowance, not manufacturer guaranteed maximum.']}
(O/'diagonal-joint-tray-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

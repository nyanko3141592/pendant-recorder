"""Expand provisional insulated joint space; retain original candidates separately."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'film-axial-stop-seat-clearance-lower-trial.step','separator':'film-bottom-slot-separator-trial.step','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
def box(w,l,h,x,y,z):return pose(cq.Workplane('XY').box(w,l,h,centered=(True,False,True)).translate((x,y,z)).val())
# Larger joint with 0.1 radial/axial nominal allowance; 0.1 stop gap at y26.1.
joints=[box(1.1,2.8,1.1,x,23.2,-1.92)for x in [-.9,.9]]
cuts=[box(1.3,3.,1.3,x,23.1,-1.92)for x in [-.9,.9]]
new={k:s[k].cut(*cuts).clean()for k in ['lower','separator']}
q=cq.Compound.makeCompound(joints)
report={'status':'ROOMIER_JOINT_GEOMETRY_TRIAL_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/f).read_bytes()).hexdigest()for k,f in files.items()},'joint_envelope_mm':[1.1,2.8,1.1],'joint_local_y_start_mm':23.2,'joint_center_z_mm':-1.92,'nominal_clearance_mm':.1,'parts':{},'checks':{}}
for k,v in new.items():
 report['parts'][k]={'valid':v.isValid(),'solid_count':len(v.Solids()),'removed_volume_mm3':s[k].Volume()-v.Volume()}
 path=O/f'film-roomier-joint-{k}-trial.step';cq.exporters.export(v,str(path));report['parts'][k]['sha256']=hashlib.sha256(path.read_bytes()).hexdigest()
for k,v in {**s,**new}.items():report['checks'][k]={'joint_overlap_mm3':q.intersect(v).Volume(),'joint_gap_mm':q.distance(v)}
report['limits']=['Enlarged envelope is a process budget, not a manufactured insulated joint.','Minimum retaining collar, actual wrapping/solder process, load and printability unqualified.','Cutting near rails can weaken or disconnect retention; inspect solid count and dimensions before adoption.']
(O/'film-roomier-joint-review.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))

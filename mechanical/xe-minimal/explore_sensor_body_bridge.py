"""Screen broad body-side retention bridges independently of thin terminal rails."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'separator':'film-sensor-clearance-200um-separator-trial.step','lower':'film-sensor-clearance-200um-lower-trial.step','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step','insulation':'film-sensor-insulation-transition.step'}
s={k:cq.importers.importStep(str(O/f)).val() for k,f in files.items()}
def pose(a):return a.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
def box(x,y,z,dx,dy,dz):return cq.Workplane('XY').box(dx,dy,dz,centered=False).translate((x,y,z)).val()
rows=[]
bridges={}
for y in (4,8,12,16,20):
 # 0.2mm nominal body-top gap, 0.6mm roof and 0.8mm side legs.
 bridge=pose(box(-3.05,y-.6,-1.62,6.1,1.2,.6).fuse(box(-3.05,y-.6,-2.22,.8,1.2,1.2),box(2.25,y-.6,-2.22,.8,1.2,1.2)).clean())
 bridges[y]=bridge
 union=s['separator'].fuse(bridge).clean()
 checks={k:{'gap_mm':bridge.distance(v),'overlap_mm3':bridge.intersect(v).Volume()} for k,v in s.items() if k!='separator'}
 rows.append({'sensor_local_y_mm':y,'fused_solid_count':len(union.Solids()),'valid':union.isValid(),'anchor_overlap_mm3':bridge.intersect(s['separator']).Volume(),'checks':checks})
candidate=s['separator'].fuse(bridges[4],bridges[12]).clean()
assert candidate.isValid() and len(candidate.Solids())==1
output=O/'film-sensor-body-bridge-separator-trial.step'
cq.exporters.export(candidate,str(output))
r={'output':output.name,'output_sha256':hashlib.sha256(output.read_bytes()).hexdigest(),'selected_positions_mm':[4,12],'status':'BODY_BRIDGE_SPACE_SCREEN_NOT_ADOPTED','sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest() for f in files.values()},'bridge_dimensions':{'width_mm':6.1,'axial_length_mm':1.2,'roof_thickness_mm':.6,'leg_width_mm':.8,'body_top_gap_mm':.2},'candidates':rows,'limits':['Nominal body-top gap does not clamp or establish thermal contact.','Axial sliding, sensor insertion, printed tolerances and strength remain unresolved.','Exported two-bridge candidate remains unadopted; new slicing and complete assembly checks required.','Body geometry and board component envelopes remain provisional; stock harness excluded.']}
(O/'film-sensor-body-bridge-space-review.json').write_text(json.dumps(r,indent=2)+'\n')
for row in rows:print(row['sensor_local_y_mm'],'solids',row['fused_solid_count'],'anchor',row['anchor_overlap_mm3'],'overlaps',{k:round(v['overlap_mm3'],5) for k,v in row['checks'].items()})

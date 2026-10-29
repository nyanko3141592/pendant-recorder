"""Current geometry and evidence needed before claiming tool-free battery fit."""
from pathlib import Path
import argparse,json,hashlib,cadquery as cq
from OCP.BRepExtrema import BRepExtrema_DistShapeShape
O=Path(__file__).resolve().parent
R=O.parents[1]
parser=argparse.ArgumentParser()
parser.add_argument('--wide350',action='store_true')
args=parser.parse_args()
manifest_path=O/('film-wide350-integration-candidate.json' if args.wide350 else 'film-current-integration-candidate.json')
manifest=json.loads(manifest_path.read_text())
files={'battery':'offset-pack-assembly-trial.step','header':'j2-header-positioned-study.step'}
for key in ('separator','lower','upper','board_model','sensor_insulation_envelope'):
 entry=manifest['artifacts'][key];p=R/entry['path']
 assert hashlib.sha256(p.read_bytes()).hexdigest()==entry['sha256'],key
 files[key]=str(p.relative_to(O))
shapes={}
geometry={}
for name,file in files.items():
 p=O/file;s=cq.importers.importStep(str(p)).val();b=s.BoundingBox();shapes[name]=s
 geometry[name]={'source':file,'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'bounds_mm':{'x':[b.xmin,b.xmax],'y':[b.ymin,b.ymax],'z':[b.zmin,b.zmax]}}
r={'status':'UNQUALIFIED_NO_MODIFICATION_BATTERY_ASSEMBLY','geometry':geometry,'stock_battery':'DTP401525-XE / DTP401525(EZ3)','user_operations':['Plug original battery connector into board with correct polarity','Seat battery and board in insulated supports without loading connector','Inspect seating and wire clearance before adhesive closure'],'measurements_required':[
 {'item':'Original connector complete envelope','needed':'Maximum width including side ears, depth, height and position relative to header PCB pads; include mated tolerances','why':'3.8mm main body width excludes protrusions and cannot establish clearance'},
 {'item':'Original lead usable free length','needed':'Insulated flexible length between pack strain relief and housing exit for all three conductors, shortest and longest supplied condition','why':'Published 15+/-3mm is pack-to-housing drawing dimension, not free wire length'},
 {'item':'Wire route','needed':'Wire outside diameter, exit locations and directions, allowable bend radius, strain relief length','why':'A center-to-center straight distance omits bends and terminal strain'},
 {'item':'Assembly movement','needed':'Check premating outside case, full seating inspection, then insertion with no pinch or tension','why':'Collision-free final pose alone does not establish user assembly'},
 {'item':'Printed tolerance','needed':'A1 mini PLA 0.4mm fit sample, measured walls/stops and adhesive intrusion','why':'Nominal CAD does not establish printed clearance'}],
 'acceptance':['Original battery and original connector remain unmodified','Full connector engagement is visible before closure','No lead is trapped between PCB, separator, stops or case seam','Battery support carries load without pressing on connector or components','Specified minimum bend radius and strain relief are satisfied throughout assembly','Five prototype assemblies document actual dimensions and photos; variation beyond sampled units remains bounded by supplier tolerances'],
 'not_proven':['Electrical polarity and battery-protection verification are separate from geometric fit','No measured assembly exists','No full plug or lead model is present; do not call current assembled STEP complete']}
r['integration_manifest']=str(manifest_path.relative_to(R))
r['integration_manifest_sha256']=hashlib.sha256(manifest_path.read_bytes()).hexdigest()
r['nominal_battery_body_clearance']={}
for name in ('header','separator','lower','upper','board_model','sensor_insulation_envelope'):
 other=shapes[name]
 r['nominal_battery_body_clearance'][name]={'distance_mm':shapes['battery'].distance(other),'intersection_volume_mm3':shapes['battery'].intersect(other).Volume()}
distance=BRepExtrema_DistShapeShape(shapes['battery'].wrapped,shapes['lower'].wrapped);distance.Perform()
r['lower_closest_points_mm']=[{'battery':[distance.PointOnShape1(i).X(),distance.PointOnShape1(i).Y(),distance.PointOnShape1(i).Z()],'lower':[distance.PointOnShape2(i).X(),distance.PointOnShape2(i).Y(),distance.PointOnShape2(i).Z()]} for i in range(1,distance.NbSolution()+1)]
r['fit_risk']='Nominal longitudinal clearance is only 0.05mm per end at the modeled maximum battery length. Printed dimensional error, adhesive intrusion and insertion margin are unqualified; zero CAD intersection is not assembly approval.'
r['not_proven'].extend(['Clearance applies only to the modeled battery body in its final pose; original harness, mating plug and assembly sweep are excluded.','Integrated board models are not guaranteed maximum component envelopes; printed tolerance and battery retention load are not validated.'])
if args.wide350:
 r['fit_risk']='Wide350 body-only CAD and nominal printed-envelope screens are not assembly approval. Original harness and plug, printed dimensional variation, retention, adhesive intrusion and insertion sweep remain unqualified.'
 r['candidate_status']=manifest['status']
(O/('battery-fit-wide350-release-gate.json' if args.wide350 else 'battery-fit-release-gate.json')).write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(r['nominal_battery_body_clearance'],indent=2))

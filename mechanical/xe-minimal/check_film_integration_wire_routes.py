"""Test an explicit rise before return wire crosses the other joint."""
from pathlib import Path
import cadquery as cq,json,math,hashlib
from wire_geometry import rounded
from OCP.BRepExtrema import BRepExtrema_DistShapeShape
O=Path(__file__).resolve().parent
files={'board':'film-integration-integrated-board.step','separator':'diagonal-entry-notched-separator-trial.step','lower':'diagonal-recessed-cap-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
c=math.cos(math.radians(28));t=math.sin(math.radians(28))
def point(x,y,z):return [7.6+c*x+t*y,-25.5-t*x+c*y,z]
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
joints=[pose(cq.Workplane('XY').box(.9,3,.8,centered=(True,False,False)).translate((x,23,-2.32)).val()) for x in [-.9,.9]]
base_path=O/'diagonal-wire-wide-lanes-review.json';base=json.loads(base_path.read_text());first=base['rows'][base['selected_row']]['paths_mm'][0]
first[-2]=[14.5,-1.5,first[-2][2]];first[-1]=[14.5,-1.5,first[-1][2]]
w0,l0=rounded(first,.75)
rows=[];models={}
exit_y=27.4
for lane in [-3.0,-2.6,-2.2,-1.8]:
 for h in [-1.35,-1.25,-1.15,-1.05]:
  for radius in [.3]:
   p=[point(.9,25.5,-1.92),point(.9,exit_y,-1.92),point(.9,exit_y,h),[13.95,lane,h],[12.75,-1.5,h],[12.75,-1.5,-.2]]
   row={'return_lane_y_mm':lane,'exit_local_y_mm':exit_y,'return_height_mm':h,'radius_mm':radius,'paths_mm':[first,p],'radii_mm':[.75,radius]}
   try:
    w1,l1=rounded(p,radius);wires=[w0,w1];q=cq.Compound.makeCompound(wires)
    row.update(valid=all(w.isValid() for w in wires),overlap_mm3={k:q.intersect(v).Volume() for k,v in s.items()},clearance_mm={k:q.distance(v) for k,v in s.items()},other_joint_overlap_mm3=[wires[i].intersect(joints[1-i]).Volume() for i in range(2)],other_joint_clearance_mm=[wires[i].distance(joints[1-i]) for i in range(2)],wire_gap_mm=w0.distance(w1),lengths_mm=[l0,l1])
    row['nominal_clear']=row['valid'] and max(list(row['overlap_mm3'].values())+row['other_joint_overlap_mm3'])<1e-8 and row['wire_gap_mm']>1e-6
    if row['nominal_clear']:models[len(rows)]=q
   except ValueError as e:row['error']=str(e)
   rows.append(row)
selected=max(models,key=lambda i:min(list(rows[i]['clearance_mm'].values())+rows[i]['other_joint_clearance_mm']+[rows[i]['wire_gap_mm']])) if models else None
closest={}
if selected is not None:
 for k,v in s.items():
  d=BRepExtrema_DistShapeShape(models[selected].wrapped,v.wrapped);d.Perform()
  if d.IsDone() and d.NbSolution():
   p1=d.PointOnShape1(1);p2=d.PointOnShape2(1)
   closest[k]={'distance_mm':d.Value(),'wire_point_mm':[p1.X(),p1.Y(),p1.Z()],'obstacle_point_mm':[p2.X(),p2.Y(),p2.Z()]}
 a=cq.Assembly(name='return_wire_overpass_trial')
 for k,q in s.items():a.add(q,name=k)
 a.add(models[selected],name='wires');a.add(cq.Compound.makeCompound(joints),name='joint_budgets');a.export(str(O/'film-integration-wire-routes-study.step'))
r={'status':'WIRE_OVERPASS_SCREEN_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'base_route_sha256':hashlib.sha256(base_path.read_bytes()).hexdigest(),'rows':rows,'selected_row':selected,'clear_count':len(models),'selected_closest_points':closest,'limits':['Own joint overlap at starting point is intentional; actual solder/insulation transition absent.','Bend radii and nominal diameter are not manufacturing tolerance specifications.','New wire endpoints follow provisional film PCB pads; solder and axial strain relief remain unqualified.','No original battery harness, retention cap or assembly qualification.']}
(O/'film-integration-wire-routes-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'clear_count':len(models),'selected':rows[selected] if selected is not None else None},indent=2))

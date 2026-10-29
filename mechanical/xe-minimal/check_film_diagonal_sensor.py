"""Whole sensor diagonal placement; provisional rectangles, not qualified geometry."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
O=Path(__file__).resolve().parent
files={'board':'film-sensor-depopulated-board-study.step','lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step','separator':'film-wide-bridge-separator-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()};rows=[];models=[]
# Head datum at localY0, terminal tips atY26; body treated conservatively uniform.
film=cq.Workplane('XY').box(4.1,26,.5,centered=(True,False,False)).translate((0,0,-2.32)).val()
joints=cq.Compound.makeCompound([cq.Workplane('XY').box(.9,3,.8,centered=(True,False,False)).translate((x,23,-2.32)).val() for x in [-.9,.9]])
for head_x in [6.,8.]:
 for angle in [20.,25.,30.]:
  pose=lambda shape:shape.rotate((0,0,0),(0,0,1),-angle).translate((head_x,-25.5,0))
  f,j=pose(film),pose(joints);rows.append({'head_xy_mm':[head_x,-25.5],'angle_deg':angle,'film_overlap_mm3':{k:f.intersect(v).Volume() for k,v in s.items()},'joint_overlap_mm3':{k:j.intersect(v).Volume() for k,v in s.items()},'joint_battery_distance_mm':j.distance(s['battery']),'terminal_midpoint_xy_mm':[head_x+26*math.sin(math.radians(angle)),-25.5+26*math.cos(math.radians(angle))]});models.append((f,j))
clear=[i for i,r in enumerate(rows) if max(r['film_overlap_mm3'][k] for k in ['board','lower','upper','battery'])<1e-8 and max(r['joint_overlap_mm3'][k] for k in ['board','lower','upper','battery'])<1e-8]
chosen=max(clear,key=lambda i:rows[i]['joint_battery_distance_mm']) if clear else None
if chosen is not None:
 a=cq.Assembly(name='diagonal_sensor_trial');a.add(s['board'],name='board',color=cq.Color('#328866'));a.add(s['battery'],name='battery',color=cq.Color('#6daed5'));a.add(models[chosen][0],name='sensor_envelope',color=cq.Color('#ef9850'));a.add(models[chosen][1],name='joint_budgets',color=cq.Color('#af72bd'));a.export(str(O/'film-diagonal-sensor-study.step'))
out={'status':'DIAGONAL_SENSOR_SCREEN_NOT_ADOPTED','rows':rows,'clear_without_separator_rows':clear,'displayed_row':chosen,'sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'limits':['Existing separator interference requires redesign, not omission.','Sensor head position is a placement datum, actual sensing region and contact patch need verification.','Joint shell, wires, original battery leads, retention and assembly path absent.','Zero overlap is nominal only.']}
(O/'film-diagonal-sensor-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))

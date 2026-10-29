"""Trade locator-to-cell clearance against sensor-to-case clearance."""
from pathlib import Path
import cadquery as cq,json,math,hashlib,itertools
O=Path(__file__).resolve().parent
files={'sensor':'vendor/ntcaflex/NTCAFLEX05103HH.STEP','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step','lower':'ntcaflex-relocated-support-lower-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()};flat=s['sensor'].rotate((0,0,0),(1,0,0),90);rows=[]
for x,angle in itertools.product((12.9,13.1),(117,118,119,120)):
 sensor=flat.rotate((0,0,0),(0,0,1),angle).translate((x,-5,-2.32));px=x-8*math.cos(math.radians(angle));py=-5-8*math.sin(math.radians(angle));peg=cq.Workplane('XY').circle(.3).extrude(.96).translate((px,py,-2.38)).val()
 row={'head_xy_mm':[x,-5],'rotation_deg':angle,'peg_battery_distance_mm':peg.distance(s['battery']),'sensor_lower_overlap_mm3':sensor.intersect(s['lower']).Volume(),'sensor_lower_distance_mm':sensor.distance(s['lower']),'sensor_board_overlap_mm3':sensor.intersect(s['board']).Volume(),'sensor_board_distance_mm':sensor.distance(s['board']),'head_max_radius_to_battery_right_margin_mm':16.4-(x+3.25)};rows.append(row);print(row,flush=True)
r={'status':'LOCATOR_POSE_TRADEOFF_NOT_ADOPTED','sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'cases':rows,'limits':['Related HH nominal foil geometry; GL tolerances and sensor mounting load unqualified.','Existing separator and peg anchoring not checked for shifted pose.','Maximum head edge margin uses nominal placement and published head diameter only.','No printer tolerances, solder, wire routing or harness.']}
(O/'ntcaflex-locator-pose-search.json').write_text(json.dumps(r,indent=2)+'\n')

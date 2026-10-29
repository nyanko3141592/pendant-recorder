"""Locate the current NTC relative to battery and separator; no material adoption."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent;i=json.loads((O/'dmn-candidate-board-inventory.json').read_text());p=next(p for p in i['parts']if p['ref']=='TH1');assert p['side']=='B';x,y=p['position_mm'];y=-y
files={'separator':'support-notched-separator-trial.step','battery':'offset-pack-assembly-trial.step','lower':'offset-pack-lower-trial.step'};shapes={n:cq.importers.importStep(str(O/f)).val()for n,f in files.items()};b=shapes['battery'].BoundingBox()
# Probe is a defined geometric investigation volume, not a selected thermal pad.
probe=cq.Workplane('XY').box(2,2,3,centered=(True,True,False)).translate((x,y,-3)).val()
rows={n:probe.intersect(s).Volume()for n,s in shapes.items()}
near=[{'ref':q['ref'],'xy_mm':q['position_mm'],'side':q['side'],'footprint':q['footprint']}for q in i['parts']if q['side']=='B'and abs(q['position_mm'][0]-x)<2 and abs(q['position_mm'][1]+y)<2]
r={'status':'THERMAL_CONTACT_GEOMETRY_SCREEN_NOT_DESIGN_APPROVAL','pcb_sha256':i['pcb_sha256'],'TH1':p,'assembly_center_xy_mm':[x,y],'probe_size_mm':[2,2,3],'probe_z_mm':[-3,0],'intersection_mm3':rows,'battery_top_z_mm':b.zmax,'board_bottom_datum_z_mm':0,'board_to_battery_nominal_gap_mm':-b.zmax,'nearest_battery_x_edge_distance_from_sensor_center_mm':min(x-b.xmin,b.xmax-x),'nearby_bottom_components':near,'source_sha256':{n:hashlib.sha256((O/f).read_bytes()).hexdigest()for n,f in files.items()},'limits':['Probe dimensions are an investigation choice, not a thermal pad specification','Actual NTC body height, solder standoff and compressed interface thickness not qualified','Intervening PLA cannot be treated as characterized thermal contact','Need source-backed interface material, contact pressure and measured thermal lag before charge qualification']}
(O/'temperature-contact-space-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:r[k]for k in ['assembly_center_xy_mm','intersection_mm3','board_to_battery_nominal_gap_mm','nearest_battery_x_edge_distance_from_sensor_center_mm','nearby_bottom_components']},indent=2))

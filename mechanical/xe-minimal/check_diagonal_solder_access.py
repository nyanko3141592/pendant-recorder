"""Seller solder-tool space study; hypothetical cone is not a selected tip."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
O=Path(__file__).resolve().parent;mapping=O/'film-pad-mapping-review.json';pads=json.loads(mapping.read_text())['pads'];files={'board':'film-sensor-depopulated-board-study.step','separator':'diagonal-entry-notched-separator-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val()for k,v in files.items()};rows=[];a=cq.Assembly(name='seller_tool_space_trial')
for k,v in s.items():a.add(v,name=k,color=cq.Color('#328866'if k=='board'else'#bbc4cc'))
for pad in pads:
 x,y=pad['assembly_xy_mm']
 for angle in [0,30,45,60]:
  for side in ([1]if angle==0 else [-1,1]):
   theta=math.radians(angle);away=cq.Vector(0,side*math.sin(theta),-math.cos(theta));tip=cq.Vector(x,y,-.1)
   # Small end at the solder budget, widening away from board. Axial path from below/outside.
   q=cq.Solid.makeCone(.15,.65,4,tip,away)
   checks={k:{'overlap_mm3':q.intersect(v).Volume(),'gap_mm':q.distance(v)}for k,v in s.items()}
   row={'pad':pad['number'],'net':pad['net'],'tilt_from_downward_z_deg':angle,'y_side':side,'tool_hypothesis_mm':{'tip_diameter':.3,'diameter_at_4mm':1.3,'length':4},'checks':checks,'body_clear':all(c['overlap_mm3']<1e-8 for c in checks.values())};rows.append(row)
   if row['body_clear']:a.add(q,name=f'pad{pad["number"]}_angle{angle}_side{side}',color=cq.Color('#d69a4b'))
a.export(str(O/'diagonal-solder-access-study.step'))
r={'status':'HYPOTHETICAL_TOOL_ENVELOPE_SCREEN_NOT_SOLDER_PROCESS_QUALIFICATION','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest()for k,v in files.items()},'pad_mapping_sha256':hashlib.sha256(mapping.read_bytes()).hexdigest(),'rows':rows,'limits':['Cone dimensions are engineering hypotheses, not a purchased or manufacturer-approved solder tip.','Tip placed in intended joint region; wire interference, solder feed, visibility, fixture and operator approach not modeled.','Board and separator only; no battery or case should be present during seller soldering.','PLA heat exposure, sensor solder-temperature limits and thermal shielding require process validation.','Existing end-on wire termination remains mechanically unqualified; geometric access does not resolve that problem.']}
(O/'diagonal-solder-access-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps([{'pad':r['pad'],'angle':r['tilt_from_downward_z_deg'],'side':r['y_side'],'clear':r['body_clear'],'sep_overlap':r['checks']['separator']['overlap_mm3']}for r in rows],indent=2))

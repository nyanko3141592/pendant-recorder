"""Lap solder envelope and seller tool-space screen for diversified PCB locations."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
O=Path(__file__).resolve().parent;source=O/'film-lap-pad-reroute-locations-review.json';pairs=json.loads(source.read_text())['distinct_signal_pad_pairs'];files={'board':'film-sensor-depopulated-board-study.step','separator':'diagonal-entry-notched-separator-trial.step'};s={k:cq.importers.importStep(str(O/v)).val()for k,v in files.items()};cache={};rows=[]
for index,pair in enumerate(pairs):
 results=[]
 for pad in pair['pads']:
  key=tuple(pad['pcb_center_mm']+pad['size_mm'])
  if key not in cache:
   x,py=pad['pcb_center_mm'];y=-py;w,h=pad['size_mm'];budget=cq.Workplane('XY').box(w-.2,h-.2,.25,centered=(True,True,False)).translate((x,y,-.25)).val();body={k:budget.intersect(v).Volume()for k,v in s.items()};tools=[]
   for angle in [0,30,45,60]:
    for side in ([1]if angle==0 else[-1,1]):
     theta=math.radians(angle);q=cq.Solid.makeCone(.15,.65,4,cq.Vector(x,y,-.2),cq.Vector(0,side*math.sin(theta),-math.cos(theta)));overlap={k:q.intersect(v).Volume()for k,v in s.items()};tools.append({'angle_deg':angle,'y_side':side,'overlap_mm3':overlap,'clear':max(overlap.values())<1e-8})
   cache[key]={'pcb_center_mm':[x,py],'pad_size_mm':[w,h],'solder_budget_mm':[w-.2,h-.2,.25],'solder_overlap_mm3':body,'tool_trials':tools,'nominal_space_and_one_tool_clear':max(body.values())<1e-8 and any(t['clear']for t in tools)}
  results.append({'net':pad['net'],**cache[key]})
 rows.append({'pair_index':index,'pads':results,'both_nominally_accessible':all(p['nominal_space_and_one_tool_clear']for p in results)});print(index,rows[-1]['both_nominally_accessible'],flush=True)
r={'status':'LAP_PAD_MECHANICAL_SCREEN_NOT_PROCESS_OR_ROUTING_ACCEPTANCE','location_source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest()for k,v in files.items()},'tool_hypothesis':{'tip_diameter_mm':.3,'diameter_at_4mm':1.3,'length_mm':4,'contact_axis_z_mm':-.2,'note':'Tool is positioned inside the 0.25 mm lap-solder packaging budget; different from earlier end-on study at z=-0.1.'},'rows':rows,'limits':['No tool manufacturer selected; envelope is hypothetical.','Actual wire, solder feed, heat, fixture, line of sight and strain relief not modeled.','Board body model is TH1-depopulated source; new pad copper does not alter modeled body but final PCB must be re-exported.','Geometry clear alone does not prove solderability or copper routing.','Does not authorize manual operations for buyer.']};(O/'film-lap-pad-mechanical-candidates-review.json').write_text(json.dumps(r,indent=2)+'\n')

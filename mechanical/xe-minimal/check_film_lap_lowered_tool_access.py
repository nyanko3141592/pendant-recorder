"""Conservative axial approach envelope for seller lap soldering."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
from wire_geometry import rounded
O=Path(__file__).resolve().parent;source=O/'film-lap-lowered-terminals-review.json';r=json.loads(source.read_text());files={'board':'film-integration-integrated-board.step','separator':'diagonal-entry-notched-separator-trial.step'};s={n:cq.importers.importStep(str(O/f)).val()for n,f in files.items()};wires=[]
for row in r['rows']:
 insulated=rounded(row['insulated_centerline_mm'],row['insulated_corner_radii_mm'])[0];bare=rounded(row['bare_centerline_mm'],row['bare_corner_radius_mm'],wire_radius=.075)[0];x=row['bare_centerline_mm'][0][0];solder=cq.Workplane('XY').box(.6,1.6,.25,centered=(True,True,False)).translate((x,-1.5,-.25)).val();wires.append({'insulated':insulated,'bare':bare,'solder':solder})
rows=[];selected={};selected_tools={};assembly=cq.Assembly(name='film_lap_solder_tool_trial')
for name,q in s.items():assembly.add(q,name=name)
for i,wire in enumerate(wires):
 for name,q in wire.items():assembly.add(q,name=f'wire{i}_{name}')
for i,row in enumerate(r['rows']):
 x=row['bare_centerline_mm'][0][0]
 for y in [-1.1,-1.3,-1.7,-2.0]:
  for angle in [0,30,45,60]:
   for azimuth in ([0]if angle==0 else range(0,360,30)):
    theta=math.radians(angle);phi=math.radians(azimuth);away=cq.Vector(math.sin(theta)*math.sin(phi),math.sin(theta)*math.cos(phi),-math.cos(theta));tip=cq.Vector(x,y,-.25);cone=cq.Solid.makeCone(.15,.65,4,tip,away)
    # Translation away by 0..4 mm is contained in this cone + far cylinder envelope.
    sweep=cone.fuse(cq.Solid.makeCylinder(.65,4,tip+away.multiply(4),away))
    obstacles={**s,'own_insulation':wires[i]['insulated'],'other_wire':cq.Compound.makeCompound(list(wires[1-i].values()))}
    checks={name:{'overlap_mm3':sweep.intersect(q).Volume(),'gap_mm':sweep.distance(q)}for name,q in obstacles.items()}
    clear=all(x['overlap_mm3']<1e-8 for x in checks.values());entry={'wire_index':i,'pad':row['pad'],'contact_mm':[x,y,-.25],'tilt_deg':angle,'azimuth_from_plus_y_deg':azimuth,'swept_checks':checks,'clear':clear,'own_solder_contact_volume_mm3':cone.intersect(wires[i]['solder']).Volume()};rows.append(entry)
    if clear and (i not in selected or min(v['gap_mm']for v in checks.values())>min(v['gap_mm']for v in rows[selected[i]]['swept_checks'].values())):selected[i]=len(rows)-1;selected_tools[i]=sweep
for i,q in selected_tools.items():assembly.add(q,name=f'wire{i}_best_approach')
out=O/'film-lap-lowered-tool-access-study.step';assembly.export(str(out))
review={'status':'HYPOTHETICAL_TOOL_APPROACH_SCREEN_NOT_PROCESS_QUALIFICATION','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'sources_sha256':{n:hashlib.sha256((O/f).read_bytes()).hexdigest()for n,f in files.items()},'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'tool_hypothesis_mm':{'tip_diameter':.3,'diameter_at_4mm':1.3,'cone_length':4,'axial_approach_distance':4},'rows':rows,'selected_rows':selected,'limits':['Hypothetical tool envelope; no tip product or holder/hand/fixture clearance qualified.','Own bare wire and solder overlap are intentional; own insulation and the other complete wire are collision obstacles.','Conservative axial swept envelope covers 0..4 mm translation; other operator motions not assessed.','No solder feed, heat transfer, PLA protection, wetting, wicking, visual access or joint strength proof.','Battery and case excluded from seller soldering setup.']}
(O/'film-lap-lowered-tool-access-review.json').write_text(json.dumps(review,indent=2)+'\n');print(json.dumps({'clear_counts':{str(i):sum(x['clear']for x in rows if x['wire_index']==i)for i in [0,1]},'selected':[rows[j]for j in selected.values()]},indent=2))

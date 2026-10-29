"""Seller solder-lap terminal envelope; dimensions are trial process assumptions."""
from pathlib import Path
import cadquery as cq,json,hashlib
from wire_geometry import rounded
O=Path(__file__).resolve().parent
route_file=O/'film-integration-wire-routes-review.json';rr=json.loads(route_file.read_text());base=rr['rows'][rr['selected_row']]
files={'board':'film-integration-integrated-board.step','separator':'diagonal-entry-notched-separator-trial.step','lower':'diagonal-recessed-cap-lower-trial.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
inventory=json.loads((O/'film-integration-board-inventory.json').read_text());assert inventory['pcb_sha256']==rr['pcb_sha256']
pads={p['number']:p for p in next(f for f in inventory['parts']if f['ref']=='TH1')['pads']}
s={key:cq.importers.importStep(str(O/file)).val()for key,file in files.items()};rows=[];wires=[];solids={}
for i,x in enumerate([14.5,12.75]):
 path=base['paths_mm'][i][:-2]+[[x,-.8,-1.25],[x,-.8,-.8]]
 radii=[base['radii_mm'][i]]*(len(path)-2);radii[-1]=.25
 insulated,ilen=rounded(path,radii)
 bare_path=[[x,-.8,-.8],[x,-.8,-.075],[x,-2.2,-.075]]
 bare,blen=rounded(bare_path,.25,wire_radius=.075)
 solder=cq.Workplane('XY').box(.6,1.6,.25,centered=(True,True,False)).translate((x,-1.5,-.25)).val()
 pad=pads['2'if i==0 else'1'];px,py=pad['position_mm'];pw,ph=pad['size_mm']
 for q in [bare,solder]:
  bb=q.BoundingBox();assert bb.xmin>=px-pw/2-1e-7 and bb.xmax<=px+pw/2+1e-7 and bb.ymin>=-py-ph/2-1e-7 and bb.ymax<=-py+ph/2+1e-7,'Terminal leaves its pad projection'
 combined=cq.Compound.makeCompound([insulated,bare,solder]);wires.append(combined)
 checks={part:{key:{'overlap_mm3':q.intersect(v).Volume(),'gap_mm':q.distance(v)}for key,v in s.items()}for part,q in [('insulated',insulated),('bare',bare),('solder_budget',solder)]}
 rows.append({'wire_index':i,'pad':'2'if i==0 else'1','net':'/GND'if i==0 else'/BAT_TS','insulated_centerline_mm':path,'insulated_corner_radii_mm':radii,'bare_centerline_mm':bare_path,'bare_corner_radius_mm':.25,'insulated_length_mm':ilen,'bare_length_mm':blen,'lap_straight_length_mm':1.15,'static':checks,'valid':combined.isValid()})
 solids.update({f'wire_{i}_insulated':insulated,f'wire_{i}_bare':bare,f'wire_{i}_solder_budget':solder})
a=cq.Assembly(name='film_lap_terminal_trial')
for key,q in {**s,**solids}.items():a.add(q,name=key)
out=O/'film-lap-terminals-study.step';a.export(str(out))
r={'status':'LAP_TERMINAL_GEOMETRY_TRIAL_NOT_PROCESS_QUALIFICATION','pcb_sha256':rr['pcb_sha256'],'route_sha256':hashlib.sha256(route_file.read_bytes()).hexdigest(),'sources_sha256':{key:hashlib.sha256((O/file).read_bytes()).hexdigest()for key,file in files.items()},'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'assumptions':{'wire_nominal_OD_mm':.31,'conductor_nominal_diameter_mm':.15,'bare_bend_radius_mm':.25,'solder_budget_mm':[.6,1.6,.25]},'rows':rows,'between_wires_overlap_mm3':wires[0].intersect(wires[1]).Volume(),'between_wires_gap_mm':wires[0].distance(wires[1]),'limits':['Conductor treated as solid nominal envelope; actual stranded-wire forming, strip length tolerance and solder wicking not qualified.','Tangent contact to nominal board surface is intended; copper/soldermask thickness and plating flatness omitted.','Bend radii and solder budgets are trial assumptions, not manufacturer-approved process limits.','Axial strain relief, tool access, sensor-end insulation and thermal effects remain unresolved.','No buyer soldering: these are seller preassembly operations.']}
(O/'film-lap-terminals-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'valid':[x['valid']for x in rows],'max_static_overlap_mm3':max(v['overlap_mm3']for x in rows for p in x['static'].values()for v in p.values()),'wire_gap_mm':r['between_wires_gap_mm'],'wire_overlap_mm3':r['between_wires_overlap_mm3'],'rows':[{k:v for k,v in x.items()if k!='static'}for x in rows]},indent=2))

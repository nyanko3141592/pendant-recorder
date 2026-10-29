"""Extract slicer estimates, keeping actual cash outlay and physical cost unknown."""
from pathlib import Path
import json,hashlib
R=Path(__file__).resolve().parents[2];M=R/'mechanical/xe-minimal';D=M/'home-case-slice-review'
parts={'lower':'film-battery-end-wide-350um-lower-first018','separator':'film-roomier-joint-supported-flipped-separator','upper':'tab-clearance-upper'}
rows=[];sources={}
for label,name in parts.items():
 p=D/name/'result.json';result=json.loads(p.read_text());assert result['return_code']==0
 review_path=D/name/'review.json';review=json.loads(review_path.read_text())
 source=M/(review.get('source') or 'tab-clearance-upper-trial.step')
 assert hashlib.sha256(source.read_bytes()).hexdigest()==review['source_sha256']
 plates=result['sliced_plates'];assert len(plates)==1
 plate=plates[0];mass=sum(f['total_used_g'] for f in plate['filaments'])
 assert mass>0 and plate['total_predication']>0
 rows.append({'part':label,'slice_directory':str((D/name).relative_to(R)),'estimated_material_g':mass,'estimated_print_seconds':plate['total_predication'],'slicer_warning':plate.get('warning_message','')})
 for f in (p,review_path,source,D/name/'plate_1.gcode'):sources[str(f.relative_to(R))]=hashlib.sha256(f.read_bytes()).hexdigest()
material=sum(x['estimated_material_g'] for x in rows);seconds=sum(x['estimated_print_seconds']for x in rows)
r={'status':'SLICER_RESOURCE_ESTIMATE_NOT_PRICE_QUOTE_OR_PRINT_RESULT','candidate_manifest':'mechanical/xe-minimal/film-wide350-integration-candidate.json','source_sha256':sources,'parts_per_device':rows,'one_device_estimate':{'material_g':material,'print_seconds':seconds},'five_devices_separate_single_part_jobs_estimate':{'job_count':15,'material_g':material*5,'print_seconds':seconds*5},'material_only_hypothetical_rates':[{'assumed_JPY_per_kg':rate,'five_device_consumption_JPY':material*5*rate/1000}for rate in (2000,3000,4000)],'cash_purchase_JPY':None,'electricity_JPY':None,'labor_JPY':None,'complete_case_cost_JPY':None,'limits':['Slicer estimates only; not measured consumption, print time or a supplier quote.','Five-device figures repeat each existing one-part plate five times; do not describe this as a batched five-device plate.','Support and extrusion reported by the slicer are included, but unreported startup/purge, failed prints, reprints and manual waste are not assumed zero.','Hypothetical JPY/kg rates are sensitivity inputs, not researched product prices; owning a spool does not make material free.','Machine warmup/cooldown, operator preparation, support removal, inspection, adhesive and assembly work remain unpriced.','No printing or purchasing performed.']}
out=R/'docs/procurement/xe-wide350-case-resource-estimate.json';out.write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({'parts':rows,'five':r['five_devices_separate_single_part_jobs_estimate'],'material_scenarios':r['material_only_hypothetical_rates']},indent=2))

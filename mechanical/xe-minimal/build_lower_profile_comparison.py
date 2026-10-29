"""Compare offline slice evidence without promoting a print profile."""
from pathlib import Path
import json,hashlib
D=Path(__file__).resolve().parent/'home-case-slice-review'
rows=[]
for name in ['fine-lower','solid-fine-lower','four-wall-lower','arachne-lower','arachne-four-wall-lower']:
 p=D/name
 cross=json.loads((p/'cross-section-review.json').read_text())
 for file,digest in cross['sources_sha256'].items():
  assert hashlib.sha256((p/file).read_bytes()).hexdigest()==digest
 seat=json.loads((p/'pcb-seat-layer-review.json').read_text())
 profile=json.loads((p/'process.json').read_text())
 result=json.loads((p/'result.json').read_text())
 assert result['return_code']==0
 target=next(r for r in cross['rows'] if abs(r['layer_top_mm']-7.64)<1e-6)
 rows.append({'candidate':name,'wall_generator':profile.get('wall_generator'),'wall_loops':result['wall_loops'],'infill_percent':result['sparse_infill_density'],'layer_count':len(cross['rows']),'seat_height_differences_mm':[r['nominal_height_difference_mm'] for r in seat['rows']],'critical_section':target,'estimated_filament_g':result['sliced_plates'][0]['filaments'][0]['total_used_g'],'estimated_seconds':result['sliced_plates'][0]['total_predication']})
r={'status':'DIAGNOSTIC_COMPARISON_NO_PROFILE_ADOPTED','rows':rows,'conclusion':['All candidates align four sampled PCB seat tops to CAD nominal 7.72 mm.','Classic 100 percent infill and four walls did not remove the support interior voids.','Arachne reduces total uncovered area at the critical section, but the right support retains a 0.7155 mm2 connected uncovered region. Four Arachne walls do not remove it.','Next investigate the local support geometry or slicer thin-region thresholds; do not enlarge overall case or move PCB seat without checking component clearances.'],'limitations':['Nominal line-width buffers versus mesh mid-layer sections, not measured plastic or strength.','Percentage coverage is a diagnostic, not a print acceptance criterion.','Existing print manifest remains unqualified for the previously observed seat overheight.']}
(D/'lower-profile-comparison.json').write_text(json.dumps(r,indent=2)+'\n')
for r in rows:print(r['candidate'],round(r['critical_section']['uncovered_area_mm2'],6),round(r['critical_section']['largest_uncovered_region_mm2'],6))

from pathlib import Path
import json,hashlib
D=Path(__file__).resolve().parent/'glue-case-trial/fabrication-review-9b65897c16ed';a=json.loads((D/'exact-via-pad-overlap-audit.json').read_text());v=json.loads((D/'via-process-intent.json').read_text());vm={x['uuid']:x for x in v['vias']};rows=[]
assert a['board_sha256']==v['source_pcb_sha256']
for x in a['vias']:
 process=vm[x['uuid']];hole=any(h['hole_overlaps_pad']for h in x['hits']);copper=any(h['copper_overlap']for h in x['hits']);rows.append({**x,'category':'hole_over_pad'if hole else'annulus_over_pad'if copper else'near_pad','filled':process['filled'],'capped':process['capped'],'review':'Fill/cap manufacturing qualification required'if hole else'Soldermask opening and registration review required'})
holes=[x for x in rows if x['category']=='hole_over_pad'];assert all(x['filled']and x['capped']for x in holes)
flagged={x['uuid']for x in rows};extra=[x for x in v['vias']if x['filled']and x['capped']and x['uuid']not in flagged]
r={'status':'PROCESS_INTENT_RECONCILED_NOT_FAB_APPROVED','pcb_sha256':a['board_sha256'],'total_vias':v['via_count'],'filled_capped_vias':v['explicit_filled_capped_count'],'hole_over_pad_count':len(holes),'rows':rows,'additional_filled_capped_vias':extra,'limits':['Fill/cap properties are design intent, not manufacturer approval','Copper pad shape is not soldermask geometry','No automatic removal of extra fill/cap specifications','Via registration and solderability require fabrication process qualification']};(D/'via-process-reconciliation.json').write_text(json.dumps(r,indent=2)+'\n')
p=D/'REVIEW-ONLY.json';m=json.loads(p.read_text());m['files_sha256']={str(x.relative_to(D)):hashlib.sha256(x.read_bytes()).hexdigest()for x in sorted(D.rglob('*'))if x.is_file()and x!=p};p.write_text(json.dumps(m,indent=2)+'\n');print('holes',len(holes),'additional filled/capped',len(extra),'manifest',len(m['files_sha256']))

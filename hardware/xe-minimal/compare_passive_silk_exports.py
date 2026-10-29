from pathlib import Path
import json,hashlib
from gerbonara import GerberFile
p=Path(__file__).resolve().parent/'electrical-panel-candidate-v3';c=p/'passive-silk-candidate-v3';source=p/'fabrication-review-ac715808f9dc/gerbers';changes=json.loads((c/'review.json').read_text());refs={r['ref'] for r in changes['changes']};rows=[]
for f in sorted(source.glob('panel-*')):
 if f.suffix=='.gbrjob':continue
 a,b=GerberFile.open(f),GerberFile.open(c/'gerbers'/f.name)
 silk='Silkscreen' in f.name
 if silk:a.objects=[o for o in a.objects if not (o.polarity_dark and (o.attrs if isinstance(o.attrs,dict) else {}).get('.C',('',))[0] in refs)]
 equal=str(a.to_svg())==str(b.to_svg());rows.append({'file':f.name,'comparison':'source minus eligible passive shapes' if silk else 'unchanged source','equal':equal})
r={'status':'EXPORTED_GEOMETRY_CHANGE_SCOPE_CHECK','source_pcb_sha256':hashlib.sha256((p/'panel.kicad_pcb').read_bytes()).hexdigest(),'candidate_pcb_sha256':hashlib.sha256((c/'panel.kicad_pcb').read_bytes()).hexdigest(),'layers':rows,'all_equal':all(r['equal'] for r in rows),'limitations':['Scope acceptance requires all_equal; remaining markings and line widths still need review.','Not physical manufacturing qualification.']};(c/'export-comparison.json').write_text(json.dumps(r,indent=2)+'\n');print(rows);assert len(rows)==13 and r['all_equal']

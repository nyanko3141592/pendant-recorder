from pathlib import Path
import json,hashlib
from gerbonara import GerberFile
p=Path(__file__).resolve().parent/'electrical-panel-candidate-v3';q=p/'mask-explicit-candidate';rows=[]
for a in sorted((p/'mask-comparison-gerbers').glob('panel-*')):
 if a.suffix=='.gbrjob':continue
 b=q/'mask-comparison-gerbers'/a.name
 ga,gb=GerberFile.open(a),GerberFile.open(b)
 # Stable ordered SVG comparison includes polarity/geometry, excludes Gerber metadata.
 sa,sb=str(ga.to_svg()),str(gb.to_svg())
 rows.append({'file':a.name,'geometry_equal':sa==sb,'source_sha256':hashlib.sha256(a.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(b.read_bytes()).hexdigest()})
r={'status':'GERBER_GEOMETRY_COMPARISON','source_pcb_sha256':hashlib.sha256((p/'panel.kicad_pcb').read_bytes()).hexdigest(),'candidate_pcb_sha256':hashlib.sha256((q/'panel.kicad_pcb').read_bytes()).hexdigest(),'layers':rows,'all_equal':all(v['geometry_equal'] for v in rows),'limitations':['Stable SVG comparison of plotted geometry, not independent manufacturing qualification.','Drill files and non-exported silkscreen layers not covered.']};(q/'gerber-equivalence-review.json').write_text(json.dumps(r,indent=2)+'\n');print([(v['file'],v['geometry_equal']) for v in rows]);assert len(rows)==11 and r['all_equal']

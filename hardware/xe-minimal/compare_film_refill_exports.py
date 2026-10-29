"""Compare plotted geometry after refill, keeping raw hashes for provenance."""
from pathlib import Path
import json,hashlib
from gerbonara import GerberFile,ExcellonFile
P=Path(__file__).resolve().parent/'film-single-carrier-trial'
rows=[]
for a in sorted((P/'panel-explicit-pad-full-export').iterdir()):
 if a.suffix=='.gbrjob':continue
 b=P/'panel-refilled-full-export'/a.name.replace('panel-explicit-pad','panel-refilled')
 assert b.is_file(),b
 parser=ExcellonFile if a.suffix=='.drl' else GerberFile
 ga,gb=parser.open(a),parser.open(b)
 rows.append({'suffix':a.name.removeprefix('panel-explicit-pad'),'geometry_equal':str(ga.to_svg())==str(gb.to_svg()),'before_sha256':hashlib.sha256(a.read_bytes()).hexdigest(),'after_sha256':hashlib.sha256(b.read_bytes()).hexdigest()})
assert len(rows)==15
r={'status':'FULL_EXPORT_GEOMETRY_COMPARISON','board_sha256':{s:hashlib.sha256((P/(s+'.kicad_pcb')).read_bytes()).hexdigest()for s in ['panel-explicit-pad','panel-refilled']},'rows':rows,'all_equal':all(x['geometry_equal']for x in rows),'scope':'13 Gerber layers and2 drill files parsed to SVG geometry; excludes nongeometric metadata and job settings. Not supplier CAM or hardware qualification.'}
(P/'refill-export-comparison.json').write_text(json.dumps(r,indent=2)+'\n');print([(x['suffix'],x['geometry_equal'])for x in rows]);assert r['all_equal']

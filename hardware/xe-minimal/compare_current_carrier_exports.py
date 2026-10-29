from pathlib import Path
import json,hashlib,re
from gerbonara import GerberFile
P=Path(__file__).resolve().parent/'current-single-carrier-trial';rows=[]
for a in sorted((P/'full-export-metadata').glob('panel-metadata-*')):
 suffix=a.name.removeprefix('panel-metadata-');b=P/'full-export-explicit-pad'/('panel-explicit-pad-'+suffix)
 if a.suffix in ['.gbrjob','.drl']:continue
 assert b.exists()
 sa,sb=str(GerberFile.open(a).to_svg()),str(GerberFile.open(b).to_svg())
 rows.append({'layer_file_suffix':suffix,'equal_geometry':sa==sb,'source_sha256':hashlib.sha256(a.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(b.read_bytes()).hexdigest()})
drills=[]
for a in sorted((P/'full-export-metadata').glob('*.drl')):
 b=P/'full-export-explicit-pad'/a.name.replace('panel-metadata','panel-explicit-pad')
 # Comments may carry source/time; tool, units, plating and all commands retained.
 norm=lambda f:'\n'.join(l for l in f.read_text().splitlines() if not l.startswith('; #@! TF.CreationDate') and not l.startswith(';DRILL file'))
 drills.append({'file':a.name,'equal_commands':norm(a)==norm(b),'source_sha256':hashlib.sha256(a.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(b.read_bytes()).hexdigest()})
r={'status':'EXPORTED_GEOMETRY_EQUIVALENCE_NOT_FABRICATION_APPROVAL','gerber_layers':rows,'drill_files':drills,'all_equal':all(x['equal_geometry'] for x in rows) and all(x['equal_commands'] for x in drills),'limits':['Comparison to pre-definition-change carrier; does not independently approve manufacturability.','SVG geometry comparison excludes file metadata; drill comparison retains all non-date/non-generator commands.','Nominal sharp slot outline still requires routing design.']}
(P/'explicit-pad-full-export-comparison.json').write_text(json.dumps(r,indent=2)+'\n');print([(x['layer_file_suffix'],x['equal_geometry']) for x in rows]);print(drills);assert len(rows)==13 and len(drills)==2 and r['all_equal']

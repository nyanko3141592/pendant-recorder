"""Offline A1 mini slicing of current candidate parts; no printer operation."""
from pathlib import Path
import cadquery as cq,json,hashlib,subprocess,shutil
O=Path(__file__).resolve().parent;D=O/'home-case-slice-review';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();rows=[]
for name,source,first in [('arachne-lower','offset-pack-lower-trial.step','0.28')]:
 out=D/name;out.mkdir(exist_ok=True);p=O/source;s=cq.importers.importStep(str(p)).val();assert s.isValid();b=s.BoundingBox();s=s.translate((-b.xmin,-b.ymin,-b.zmin));stl=out/(name+'.stl');cq.exporters.export(s,str(stl),tolerance=.01,angularTolerance=.1)
 profile=json.loads((D/'process.json').read_text());profile['initial_layer_print_height']=first;profile['layer_height']='0.08';profile['wall_generator']='arachne';(out/'process.json').write_text(json.dumps(profile,indent=2)+'\n')
 cmd=['/Applications/BambuStudio.app/Contents/MacOS/BambuStudio','--debug','1','--load-settings',str(D/'machine.json')+';'+str(out/'process.json'),'--load-filaments',str(D/'filament.json'),'--arrange','1','--orient','0','--slice','0','--export-3mf',name+'.3mf','--outputdir',str(out),str(stl)]
 run=subprocess.run(cmd,cwd=out,capture_output=True,text=True);(out/'slice.log').write_text(run.stdout+run.stderr);assert run.returncode==0
 result=json.loads((out/'result.json').read_text());assert result['return_code']==0
 row={'part':name,'source':source,'source_sha256':sha(p),'stl_sha256':sha(stl),'3mf_sha256':sha(out/(name+'.3mf')),'first_layer_mm':float(first),'regular_layer_mm':float(profile['layer_height']),'CAD_height_mm':b.zlen,'translation_mm':[-b.xmin,-b.ymin,-b.zmin],'slice_result':result,'profile_sha256':{'machine':sha(D/'machine.json'),'process':sha(out/'process.json'),'filament':sha(D/'filament.json')}};rows.append(row);(out/'review.json').write_text(json.dumps(row,indent=2)+'\n')
(D/'arachne-lower-slice-review.json').write_text(json.dumps({'status':'SLICED_NOT_PRINTED_OR_FIT_QUALIFIED','parts':rows,'limits':['Toolpath review still required','Separator0.3mm thickness and strength not physically verified','Current plug and original lead fit unresolved','No print job sent']},indent=2)+'\n');print([(r['part'],r['slice_result']['return_code'])for r in rows])

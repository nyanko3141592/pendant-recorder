"""Offline A1 mini slicing of current candidate parts; no printer operation."""
from pathlib import Path
import cadquery as cq,json,hashlib,subprocess,shutil,argparse
parser=argparse.ArgumentParser();parser.add_argument('--prefix',default='film-bridge');parser.add_argument('--supports',action='store_true');parser.add_argument('--no-floating-shell',action='store_true');parser.add_argument('--fine-layers',action='store_true');parser.add_argument('--flip',action='store_true');args=parser.parse_args()
variant=args.prefix+('-supported' if args.supports else '')+('-no-floating-shell' if args.no_floating_shell else '')+('-fine' if args.fine_layers else '')+('-flipped' if args.flip else '')
O=Path(__file__).resolve().parent;D=O/'home-case-slice-review';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();rows=[]
for name,source,first in [(variant+'-separator',args.prefix+'-separator-trial.step','0.08' if args.fine_layers else '0.14')]:
 out=D/name;out.mkdir(exist_ok=True);p=O/source;s=cq.importers.importStep(str(p)).val();assert s.isValid();s=s.rotate((0,0,0),(1,0,0),180) if args.flip else s;b=s.BoundingBox();s=s.translate((-b.xmin,-b.ymin,-b.zmin));stl=out/(name+'.stl');cq.exporters.export(s,str(stl),tolerance=.01,angularTolerance=.1)
 profile=json.loads((D/'process.json').read_text());profile['initial_layer_print_height']=first;
 if args.fine_layers:profile['layer_height']='0.08'
 if args.no_floating_shell:profile['detect_floating_vertical_shell']='0'
 if args.supports:profile.update(enable_support='1',support_type='normal(auto)',support_on_build_plate_only='1',support_threshold_angle='30')
 (out/'process.json').write_text(json.dumps(profile,indent=2)+'\n')
 cmd=['/Applications/BambuStudio.app/Contents/MacOS/BambuStudio','--debug','1','--load-settings',str(D/'machine.json')+';'+str(out/'process.json'),'--load-filaments',str(D/'filament.json'),'--arrange','1','--orient','0','--slice','0','--export-3mf',name+'.3mf','--outputdir',str(out),str(stl)]
 run=subprocess.run(cmd,cwd=out,capture_output=True,text=True);(out/'slice.log').write_text(run.stdout+run.stderr);assert run.returncode==0
 result=json.loads((out/'result.json').read_text());assert result['return_code']==0
 row={'part':name,'export_rotation_x_deg':180 if args.flip else 0,'source':source,'source_sha256':sha(p),'stl_sha256':sha(stl),'3mf_sha256':sha(out/(name+'.3mf')),'first_layer_mm':float(first),'regular_layer_mm':float(profile['layer_height']),'CAD_height_mm':b.zlen,'translation_mm':[-b.xmin,-b.ymin,-b.zmin],'slice_result':result,'profile_sha256':{'machine':sha(D/'machine.json'),'process':sha(out/'process.json'),'filament':sha(D/'filament.json')}};rows.append(row);(out/'review.json').write_text(json.dumps(row,indent=2)+'\n')
(D/(variant+'-separator-slice-review.json')).write_text(json.dumps({'status':'SLICED_NOT_PRINTED_OR_FIT_QUALIFIED','parts':rows,'limits':['Toolpath review still required','Raised rib bridge sag, fine webs and strength not physically verified','Current plug and original lead fit unresolved','No print job sent']},indent=2)+'\n');print([(r['part'],r['slice_result']['return_code'])for r in rows])

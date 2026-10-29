from pathlib import Path
import cadquery as cq,json,hashlib,shutil,subprocess
O=Path(__file__).resolve().parent;D=O/'home-case-slice-review';D.mkdir(exist_ok=True)
rows=[]
for name in ['upper','lower']:
 src=O/f'rounded-glue-reinforced-{name}-study.step';s=cq.importers.importStep(str(src)).val()
 if name=='upper':s=s.rotate((0,0,0),(1,0,0),180)
 b=s.BoundingBox();s=s.translate((-b.xmin,-b.ymin,-b.zmin));out=D/f'{name}.stl';cq.exporters.export(s,str(out),tolerance=.01,angularTolerance=.1)
 rows.append({'part':name,'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'valid_solid':s.isValid(),'stl_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'rotation_x_deg':180 if name=='upper'else 0,'bounds_mm':[b.xlen,b.ylen,b.zlen]})
for f in ['machine.json','process.json','filament.json']:shutil.copyfile(O/'home-fit-coupons/slice-review'/f,D/f)
for name in ['upper','lower']:
 out=D/name;out.mkdir(exist_ok=True)
 cmd=['/Applications/BambuStudio.app/Contents/MacOS/BambuStudio','--debug','1','--load-settings',str(D/'machine.json')+';'+str(D/'process.json'),'--load-filaments',str(D/'filament.json'),'--arrange','1','--orient','0','--slice','0','--export-3mf',name+'.3mf','--outputdir',str(out),str(D/(name+'.stl'))]
 run=subprocess.run(cmd,cwd=out,capture_output=True,text=True);(out/'slice.log').write_text(run.stdout+run.stderr);assert run.returncode==0,run.stderr
 result=json.loads((out/'result.json').read_text());assert result['return_code']==0;rows[['upper','lower'].index(name)]['slice_result']=result
(D/'review.json').write_text(json.dumps({'status':'CANDIDATE_SLICED_NOT_PRINTED','parts':rows,'limits':['Original battery leads and mating plug unresolved','Adhesive joint not qualified','Toolpaths and thin duct require review','No physical fit or strength validation']},indent=2))
print(json.dumps(rows,indent=2))

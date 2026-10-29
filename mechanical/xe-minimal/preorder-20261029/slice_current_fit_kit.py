from pathlib import Path
import cadquery as cq,json,shutil,subprocess,hashlib
w=Path(__file__).resolve().parent;case=w.parent/'prototype-v1/fixed-board-compact-v1';job=w/'fit-kit-a1mini';job.mkdir(exist_ok=True)
inputs=[]
for name,path,flip in [('case-lower',case/'case-compact-v1-lower.step',False),('case-upper',case/'case-compact-v1-upper.step',True),('pcba-max-gauge',w/'pcba-max-thickness-connected-gauge.step',False),('battery-max',case/'dtp401525-xe-max-body.step',False)]:
 s=cq.importers.importStep(str(path)).val()
 if flip:s=s.rotate((0,0,0),(1,0,0),180)
 b=s.BoundingBox();s=s.translate((-b.xmin,-b.ymin,-b.zmin));p=job/f'{name}.stl';cq.exporters.export(s,str(p),tolerance=.02,angularTolerance=.1);inputs.append(p)
for name in ['machine.json','process.json','filament-petg-a1.json']:shutil.copy2(case/'a1mini-4objects'/name,job/name)
cmd=['/Applications/BambuStudio.app/Contents/MacOS/BambuStudio','--debug','1','--load-settings',f'{job}/machine.json;{job}/process.json','--load-filaments',str(job/'filament-petg-a1.json'),'--arrange','1','--orient','0','--slice','0','--export-3mf','current-fit-kit.3mf','--outputdir',str(job),*[str(p) for p in inputs]]
r=subprocess.run(cmd,cwd=job,capture_output=True,text=True);(job/'slice.log').write_text(r.stdout+r.stderr)
assert r.returncode==0,r.stderr[-2000:]
d=json.loads((job/'result.json').read_text());out={'status':'OFFLINE_SLICE_COMPLETE_NOT_PHYSICAL_QUALIFICATION','slice_result':d,'files':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [*inputs,job/'current-fit-kit.3mf']},'limitations':['Case retention and battery protection not finalized','Gauge has solid USB and J2 cavities; no mating test','Nominal parts with max board thickness; assembly tolerances not certified','No printing performed'],'release_allowed':False};(job/'review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(d))

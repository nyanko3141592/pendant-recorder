from pathlib import Path
import cadquery as cq,json,shutil,subprocess,hashlib
w=Path(__file__).resolve().parent;case=w.parent/'prototype-v1/fixed-board-compact-v1';job=w/'captured-carrier-case/a1mini-fit-kit';job.mkdir(exist_ok=True)
inputs=[]
for name,path,flip in [('case-lower',w/'captured-carrier-case/case-lower.step',False),('case-upper',w/'captured-carrier-case/case-upper.step',True),('pcba-max-gauge',Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/fit-kit/pcba-max-thickness-connected-gauge.step'),False),('battery-max',w/'captured-carrier-case/battery-max-positioned.step',False),('carrier',w/'captured-carrier-case/carrier.step',False)]:
 s=cq.importers.importStep(str(path)).val()
 if flip:s=s.rotate((0,0,0),(1,0,0),180)
 b=s.BoundingBox();s=s.translate((-b.xmin,-b.ymin,-b.zmin));p=job/f'{name}.stl';cq.exporters.export(s,str(p),tolerance=.02,angularTolerance=.1);inputs.append(p)
for name in ['machine.json','process.json','filament-petg-a1.json']:shutil.copy2(case/'a1mini-4objects'/name,job/name)
cmd=['/Applications/BambuStudio.app/Contents/MacOS/BambuStudio','--debug','1','--load-settings',f'{job}/machine.json;{job}/process.json','--load-filaments',str(job/'filament-petg-a1.json'),'--arrange','1','--orient','0','--slice','0','--export-3mf','captured-carrier-fit-kit.3mf','--outputdir',str(job),*[str(p) for p in inputs]]
r=subprocess.run(cmd,cwd=job,capture_output=True,text=True);(job/'slice.log').write_text(r.stdout+r.stderr)
assert r.returncode==0,r.stderr[-2000:]
d=json.loads((job/'result.json').read_text());out={'status':'OFFLINE_SLICE_COMPLETE_NOT_PHYSICAL_QUALIFICATION','slice_result':d,'files':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [*inputs,job/'captured-carrier-fit-kit.3mf']},'limitations':['Geometric board/carrier capture only; physical strength, tolerances and original harness not qualified','Gauge has solid USB and J2 cavities; no mating test','Nominal parts with max board thickness; assembly tolerances not certified','No printing performed'],'release_allowed':False};(job/'review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(d))

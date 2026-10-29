from pathlib import Path
import cadquery as cq,json,hashlib,subprocess
O=Path(__file__).resolve().parent;D=O/'home-case-slice-review';out=D/'thickness-clearance-upper';out.mkdir(exist_ok=True)
p=O/'thickness-clearance-upper-trial.step';s=cq.importers.importStep(str(p)).val();original=s.BoundingBox();s=s.rotate((0,0,0),(1,0,0),180);b=s.BoundingBox();s=s.translate((-b.xmin,-b.ymin,-b.zmin));stl=out/'upper.stl';cq.exporters.export(s,str(stl),tolerance=.01,angularTolerance=.1)
cmd=['/Applications/BambuStudio.app/Contents/MacOS/BambuStudio','--debug','1','--load-settings',str(D/'machine.json')+';'+str(D/'process.json'),'--load-filaments',str(D/'filament.json'),'--arrange','1','--orient','0','--slice','0','--export-3mf','upper.3mf','--outputdir',str(out),str(stl)]
r=subprocess.run(cmd,cwd=out,capture_output=True,text=True);(out/'slice.log').write_text(r.stdout+r.stderr);assert r.returncode==0
result=json.loads((out/'result.json').read_text());assert result['return_code']==0
review={'status':'SLICED_NOT_PRINTED','source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'original_zmax_mm':original.zmax,'stop_original_z_mm':1.03,'stop_print_z_mm':original.zmax-1.03,'rotation_x_deg':180,'print_xyz_translation_mm':[-b.xmin,-b.ymin,-b.zmin],'profile_sha256':{f:hashlib.sha256((D/f).read_bytes()).hexdigest() for f in ['machine.json','process.json','filament.json']},'slice_result':result,'limitations':['Toolpath stop height must be inspected separately','No printer operation or physical verification']}
(out/'review.json').write_text(json.dumps(review,indent=2)+'\n');print(json.dumps(review,indent=2))

from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'case':'rounded-glue-reinforced-lower-study.step','board':'glue-case-candidate-integrated-board.step','separator':'battery-separator-study.step','pack':'dtp401525-xe-pack-max.step'}
s={k:cq.importers.importStep(str(O/v)).val()for k,v in files.items()};s['pack']=s['pack'].translate((8.25,-13.5,-6.62));rows=[]
for dz in [0,.25,.5,1,2,3,4,5,6,7,8,10,12,15,20]:
 row={'z_offset_mm':dz,'overlap_mm3':{}}
 for name in ['board','separator','pack']:row['overlap_mm3'][name]=s[name].translate((0,0,dz)).intersect(s['case']).Volume()
 rows.append(row);print(row,flush=True)
r={'status':'SAMPLED_VERTICAL_INSERTION_SCREEN','source_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest()for k,v in files.items()},'pack_pose_mm':[8.25,-13.5,-6.62],'samples':rows,'limits':['Sampled offsets cannot prove collision-free continuous sweep','Original mating housing and wires excluded','Generic component bodies do not all represent maximum tolerances','Rigid relative stack pose assumed; does not establish how to hold the loose parts','No insertion force, finger access, tolerances or physical assembly qualification']};(O/'premated-stack-insertion-review.json').write_text(json.dumps(r,indent=2))

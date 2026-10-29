from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'film-lead-wrap-clearance-lower-trial.step','separator':'film-roomier-joint-separator-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()};rows=[]
for dz in [-.001,-.01,-.05,.01]:
 common=s['separator'].translate((0,0,dz)).intersect(s['lower']);islands=[]
 for q in common.Solids():
  b=q.BoundingBox();islands.append({'volume_mm3':q.Volume(),'bounds_mm':[b.xmin,b.ymin,b.zmin,b.xmax,b.ymax,b.zmax]})
 rows.append({'separator_dz_mm':dz,'overlap_mm3':common.Volume(),'overlap_divided_by_displacement_mm2':common.Volume()/abs(dz),'islands':islands})
r={'status':'SMALL_DISPLACEMENT_SUPPORT_SCREEN_NOT_LOAD_QUALIFICATION','sources_sha256':{k:hashlib.sha256((O/f).read_bytes()).hexdigest()for k,f in files.items()},'rows':rows,'limits':['Volume/displacement is only a local contact-area proxy; inclined walls may contribute.','Does not establish static stability, clamping, vibration resistance or printed fit.']}
(O/'film-lead-wrap-support-displacement-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

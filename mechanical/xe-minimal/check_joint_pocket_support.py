from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
sep=cq.importers.importStep(str(O/'film-roomier-joint-separator-trial.step')).val();rows=[]
for f in ['film-roomier-joint-lower-trial.step','film-open-joint-pockets-lower-trial.step']:
 s=cq.importers.importStep(str(O/f)).val();common=s.intersect(sep)
 rows.append({'lower':f,'sha256':hashlib.sha256((O/f).read_bytes()).hexdigest(),'common_volume_mm3':common.Volume(),'common_face_area_mm2':sum(face.Area()for face in common.Faces()),'face_count':len(common.Faces())})
r={'status':'EXACT_CAD_CONTACT_SCREEN_NOT_LOAD_QUALIFICATION','rows':rows,'limits':['Exact coincident nominal faces only; no print tolerance or seating force.','Contact area does not prove stability, glue strength or load capacity.']}
(O/'film-joint-pocket-support-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

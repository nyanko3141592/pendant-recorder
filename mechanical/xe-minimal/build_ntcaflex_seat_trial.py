"""Explore a connected receiving ledge above relocated lower support."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'separator':'film-sensor-clearance-200um-separator-trial.step','lower':'ntcaflex-relocated-support-lower-trial.step','sensor':'ntcaflex-diagonal-positioned-reference.step','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val() for k,f in files.items()}
rows=[]
for x0 in (14,15,16):
 pad=cq.Workplane('XY').box(17.6-x0,2,.4,centered=False).translate((x0,-25,-2.22)).val()
 candidate=s['separator'].fuse(pad).clean()
 checks={k:{'pad_overlap_mm3':pad.intersect(s[k]).Volume(),'pad_distance_mm':pad.distance(s[k])}for k in ('sensor','board','battery','lower')}
 rows.append({'pad_x_start_mm':x0,'valid':candidate.isValid(),'solid_count':len(candidate.Solids()),'anchor_overlap_mm3':pad.intersect(s['separator']).Volume(),'lower_seat_proxy_mm3':pad.translate((0,0,-.001)).intersect(s['lower']).Volume(),'checks':checks})
 if x0==15:
  out=O/'ntcaflex-receiving-seat-separator-trial.step';cq.exporters.export(candidate,str(out))
r={'status':'RECEIVING_SEAT_TRIAL_NOT_SENSOR_CARRIER','source_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'cases':rows,'exported_x_start_mm':15,'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'limits':['Only added ledge is checked against obstacles; existing separator has not been relieved for this sensor.','Downward 1um proxy is nominal contact geometry, not strength or printed seating.','New carrier opening, retention, GL tolerances, solder, harness and thermal coupling unresolved.']}
(O/'ntcaflex-receiving-seat-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))

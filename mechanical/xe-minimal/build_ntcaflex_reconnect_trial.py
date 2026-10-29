"""Bridge above flex foil to reconnect split separator; trial geometry only."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'separator':'ntcaflex-open-separator-trial.step','sensor':'ntcaflex-diagonal-positioned-reference.step','board':'film-integration-integrated-board.step','lower':'ntcaflex-relocated-support-lower-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
rows=[]
for width in (6.4,8.0):
 bridges=[]
 for x in (-12,-8,4):
  a=cq.Workplane('XY').box(.8,width,.4,centered=False).translate((x-.4,-width/2,-1.94)).val().rotate((0,0,0),(0,0,1),120).translate((12.5,-5,0));bridges.append(a)
 candidate=s['separator'].fuse(*bridges).clean()
 checks={k:{'overlap_mm3':candidate.intersect(v).Volume(),'distance_mm':candidate.distance(v)}for k,v in s.items()if k!='separator'}
 rows.append({'bridge_span_mm':width,'valid':candidate.isValid(),'solid_count':len(candidate.Solids()),'checks':checks})
 out=O/f'ntcaflex-reconnect-{round(width*10)}-separator-trial.step';cq.exporters.export(candidate,str(out))
 rows[-1]['output']=out.name;rows[-1]['output_sha256']=hashlib.sha256(out.read_bytes()).hexdigest()
r={'status':'RECONNECTION_TRIAL_NOT_ADOPTED','sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'cases':rows,'limits':['Nominal related HH sensor; no GL tolerance envelope.','Bridge positions and dimensions provisional; no printed strength or load qualification.','Complete carrier/thermal contact/strain relief and harness remain unresolved.']}
(O/'ntcaflex-reconnection-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))

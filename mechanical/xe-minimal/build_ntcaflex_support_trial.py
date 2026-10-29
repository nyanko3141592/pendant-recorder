"""Move nominal separator support away from the diagonal flex sensor."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'film-sensor-clearance-200um-lower-trial.step','sensor':'ntcaflex-diagonal-positioned-reference.step','battery':'offset-pack-assembly-trial.step','board':'film-integration-integrated-board.step','separator':'film-sensor-clearance-200um-separator-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
def box(x,y,z,dx,dy,dz):return cq.Workplane('XY').box(dx,dy,dz,centered=False).translate((x,y,z)).val()
# Lower top of existing middle1 pedestal; preserve floor and wall below.
cut=box(16.59,-16.01,-2.72,1.02,2.02,.6)
base=s['lower'].cut(cut).clean();rows=[]
for y in (-25,-24,-10,-8):
 post=box(16.6,y,-7,1,2,4.78)
 candidate=base.fuse(post).clean()
 checks={k:{'overlap_mm3':candidate.intersect(s[k]).Volume(),'distance_mm':candidate.distance(s[k])}for k in ('sensor','battery','board','separator')}
 rows.append({'post_y_start_mm':y,'valid':candidate.isValid(),'solids':len(candidate.Solids()),'checks':checks,'post_seat_proxy_mm3':post.intersect(s['separator'].translate((0,0,-.001))).Volume()})
 if y==-25:
  out=O/'ntcaflex-relocated-support-lower-trial.step';cq.exporters.export(candidate,str(out))
r={'status':'SUPPORT_RELOCATION_TRIAL_NOT_ADOPTED','sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'exported_y_start_mm':-25,'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'cases':rows,'limits':['Current separator was designed for JT and still needs replacement for NTCAFLEX.','Downshift contact proxy is not measured seating or strength.','Nominal related-part sensor, no tolerance or thermal-contact qualification.','Slicing, wall continuity, full sensor carrier, harness and assembly remain unchecked.']}
(O/'ntcaflex-support-relocation-review.json').write_text(json.dumps(r,indent=2)+'\n')
for row in rows:print(row,flush=True)

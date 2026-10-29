"""Provisional planar sensor opening, deliberately not a qualified GL envelope."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'separator':'ntcaflex-receiving-seat-separator-trial.step','sensor':'ntcaflex-diagonal-positioned-reference.step','lower':'ntcaflex-relocated-support-lower-trial.step','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
# Local X follows foil length; union spans conservative flat nominal outline.
# Head radius includes published max diameter + 0.2mm engineering clearance.
head=cq.Workplane('XY').circle(3.45).extrude(4).translate((0,0,-3)).val()
foil=cq.Workplane('XY').box(25.4,4.4,4,centered=False).translate((-20.2,-2.2,-3)).val()
cut=head.fuse(foil).rotate((0,0,0),(0,0,1),120).translate((12.5,-5,0))
a=s['separator'].cut(cut).clean();p=O/'ntcaflex-open-separator-trial.step';cq.exporters.export(a,str(p))
checks={k:{'overlap_mm3':a.intersect(s[k]).Volume(),'distance_mm':a.distance(s[k])}for k in ('sensor','lower','board','battery')}
r={'status':'SENSOR_OPENING_TRIAL_NOT_ADOPTED','sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'output_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'valid':a.isValid(),'solid_count':len(a.Solids()),'solid_volumes_mm3':[v.Volume()for v in a.Solids()],'removed_volume_mm3':s['separator'].Volume()-a.Volume(),'checks':checks,'lower_seat_proxy_mm3':a.translate((0,0,-.001)).intersect(s['lower']).Volume(),'limits':['Foil envelope is simplified nominal related-HH outline plus 0.2mm, not all published GL tolerances.','Full-height opening deliberately removes old material; head retention, thermal load path and insulation bridge must be designed separately.','Solid connectivity does not prove minimum web strength or printability.','Original harness and complete assembly sequence omitted.']}
(O/'ntcaflex-open-separator-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

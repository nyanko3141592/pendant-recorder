"""Connect measured gaps; keep all source pieces and check surrounding solids."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
O=Path(__file__).resolve().parent
files={'separator':'ntcaflex-reconnect-64-separator-trial.step','sensor':'ntcaflex-diagonal-positioned-reference.step','board':'film-integration-integrated-board.step','lower':'ntcaflex-relocated-support-lower-trial.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
# Extend isolated X=-8 bridge upward by 0.1mm through its measured 0.02mm gap.
a=cq.Workplane('XY').box(.8,6.4,.1,centered=False).translate((-8.4,-3.2,-1.54)).val().rotate((0,0,0),(0,0,1),120).translate((12.5,-5,0))
p=(14.105,-1.946072201246);q=(14.58985047312,-2.255);dx,dy=q[0]-p[0],q[1]-p[1];length=math.hypot(dx,dy)
b=cq.Workplane('XY').box(length+.6,.6,.4,centered=False).translate((-.3,-.3,-1.94)).val().rotate((0,0,0),(0,0,1),math.degrees(math.atan2(dy,dx))).translate((p[0],p[1],0))
result=s['separator'].fuse(a,b).clean();out=O/'ntcaflex-targeted-links-separator-trial.step';cq.exporters.export(result,str(out))
checks={k:{'overlap_mm3':result.intersect(v).Volume(),'distance_mm':result.distance(v)}for k,v in s.items()if k!='separator'}
r={'status':'TARGETED_LINK_TRIAL_NOT_ADOPTED','sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'valid':result.isValid(),'solids':len(result.Solids()),'checks':checks,'limits':['Nominal topology only, no print strength or GL tolerance qualification.','Current board nearest gap may come from old features.','Sensor carrier load, thermal coupling, harness and assembly still incomplete.']}
(O/'ntcaflex-targeted-links-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

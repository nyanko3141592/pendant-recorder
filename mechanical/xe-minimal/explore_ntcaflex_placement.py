"""Related-part nominal packing screen; no mechanical adoption."""
from pathlib import Path
import cadquery as cq,json,hashlib,itertools
O=Path(__file__).resolve().parent
files={'sensor':'vendor/ntcaflex/NTCAFLEX05103HH.STEP','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step','lower':'film-sensor-clearance-200um-lower-trial.step','upper':'tab-clearance-upper-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
pack=s['battery'].BoundingBox();outer=s['lower'].BoundingBox()
# Source Y is thickness; sensing head bottom at Y=-0.1, center X=Z=0.
flat=s['sensor'].rotate((0,0,0),(1,0,0),90).rotate((0,0,0),(0,0,1),90)
rows=[]
for x,y in itertools.product((4.5,8,12.5),(-5,-6,-7)):
 sensor=flat.translate((x,y,pack.zmax+.1));b=sensor.BoundingBox()
 checks={k:{'distance_mm':sensor.distance(s[k]),'overlap_mm3':sensor.intersect(s[k]).Volume()}for k in ('board','battery','lower','upper')}
 rows.append({'head_center_xy_mm':[x,y],'bounds_mm':[b.xmin,b.ymin,b.zmin,b.xmax,b.ymax,b.zmax],'within_case_xy_bbox':b.xmin>=outer.xmin and b.xmax<=outer.xmax and b.ymin>=outer.ymin and b.ymax<=outer.ymax,'checks':checks})
r={'status':'RELATED_HH_NOMINAL_PACKING_SCREEN_NOT_GL_FIT','sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'placement':'Flat unbent reference model, head bottom nominally touching maximum battery top; no pressure implied.','cases':rows,'limits':['Exact GL envelope and dimensional tolerances unresolved.','Existing separator intentionally omitted because replacement sensor needs new carrier.','No lead bends, solder, insulation, foam, fastener, harness or assembly sweep.','Flat model bottom stiffeners may extend below head contact plane; intersections must not be ignored.']}
(O/'ntcaflex-placement-screen.json').write_text(json.dumps(r,indent=2)+'\n')
for row in rows:print(row['head_center_xy_mm'],'bbox',row['within_case_xy_bbox'],'overlap',{k:round(v['overlap_mm3'],4)for k,v in row['checks'].items()})

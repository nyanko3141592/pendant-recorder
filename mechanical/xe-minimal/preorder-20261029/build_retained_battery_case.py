"""Integrated cradle candidate. No manufacturing/physical qualification implied."""
from pathlib import Path
import cadquery as cq
import json, hashlib
HERE=Path(__file__).resolve().parent
BASE=HERE.parent/'prototype-v1'
FIT=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/fit-kit')
OUT=HERE/'retained-battery-case'
OUT.mkdir(exist_ok=True)
source=BASE/'build_actual_fit_case_v3.py'
s=source.read_text()
s=s.replace('OUT = HERE / "actual-fit-case-v3"',f'OUT = Path({str(OUT)!r})')
s=s.replace('W = D = 31.4','W = D = 30.8').replace('PLAN_R, EDGE_R = 3.2, 1.2','PLAN_R, EDGE_R = 2.1, 1.2')
s=s.replace('ZMIN, ZMAX, SEAM = -7.72, 6.18, 0.10','ZMIN, ZMAX, SEAM = -8.02, 6.18, 0.10')
s=s.replace('CAV_BOTTOM, CAV_TOP = -6.87, 5.28','CAV_BOTTOM, CAV_TOP = -7.17, 5.28')
s=s.replace('pcb = cq.Compound.makeCompound([pcb_native, *missing])',f'pcb = load(Path({str(FIT/"current-pcba-envelope.step")!r}))')
s=s.replace('battery_source.translate((8.25, -13.5, -6.62))','battery_source.translate((8.25, -13.5, -6.92))')
s=s.replace('lower = lower.cut(cord_tunnel).clean()', '''cord_sleeve = cq.Workplane(cord_plane).circle(1.8).extrude(9.0).val().intersect(outer).intersect(lower_half)
lower = lower.fuse(cord_sleeve).cut(cord_tunnel).clean()
''')
# Avoid producing old report claims; execute construction only.
s=s.split('assert lower.isValid()')[0]
ns={'__file__':str(source),'__name__':'retained_battery_geometry'}
exec(compile(s,str(source),'exec'),ns)
lower,upper,pcb,battery,separator,harness=[ns[k] for k in ['lower','upper','pcb','battery','separator','harness']]
def box(x0,x1,y0,y1,z0,z1):
 return cq.Workplane('XY').box(x1-x0,y1-y0,z1-z0).val().translate(((x0+x1)/2,(y0+y1)/2,(z0+z1)/2))
# Battery resting floor is broad and flat; +Z growth remains unobstructed.
# Guides are 0.25 mm clear of maximum pouch, no point preload.
seat=box(.25,16.25,-27.25,.25,-7.18,-6.92)
right=box(16.25,17.05,-26.5,-.5,-7.18,-2.72)
left=box(-.35,.25,-26.5,-.5,-7.18,-2.72)
# Guides meet the existing lower shell. End clearance is 0.25 mm.
ends=[box(.25,16.25,-27.65,-27.25,-7.18,-2.72),box(.25,16.25,.25,.65,-7.18,-2.72)]
# Separator seats on four broad ledges outside maximum battery footprint.
ledges=[box(16.25,17.45,y,y+2,-7.18,-2.22) for y in [-24,-8]]
ledges += [box(-.35,.5,y,y+2,-7.18,-2.22) for y in [-24,-8]]
added=cq.Compound.makeCompound([seat,right,left,*ends,*ledges])
lower=lower.fuse(seat,right,left,*ends,*ledges).clean()
# Growing only toward separator: reserve 0.5 mm beyond maximum pack thickness.
growth=box(.5,16,-27,0,-6.92,-2.22)
checks={}
for name,shape in [('pcb',pcb),('battery',battery),('separator',separator),('harness_provisional',harness),('growth_reserve',growth),('upper',upper)]:
 checks['lower_overlap_'+name+'_mm3']=lower.intersect(shape).Volume()
checks['separator_pcb_overlap_mm3']=separator.intersect(pcb).Volume()
checks['separator_growth_overlap_mm3']=separator.intersect(growth).Volume()
checks['battery_separator_distance_mm']=battery.distance(separator)
checks['separator_support_contact_proxy_mm3']=lower.intersect(separator.translate((0,0,-.001))).Volume()
checks['battery_floor_contact_proxy_mm3']=lower.intersect(battery.translate((0,0,-.001))).Volume()
checks['lower_valid']=lower.isValid();checks['lower_solids']=len(lower.Solids())
checks['upper_valid']=upper.isValid();checks['upper_solids']=len(upper.Solids())
parts={'case-lower':lower,'case-upper':upper,'separator':separator,'pcba-dummy':pcb,'battery-max-positioned':battery,'battery-growth-reserve':growth}
for n,shape in parts.items():
 cq.exporters.export(shape,str(OUT/(n+'.step')))
 cq.exporters.export(shape,str(OUT/(n+'.stl')),tolerance=.02,angularTolerance=.1)
a=cq.Assembly(name='retained_battery_candidate')
for n,shape in parts.items():
 if n!='battery-growth-reserve':a.add(shape,name=n)
a.save(str(OUT/'assembly.step'))
b=lower.fuse(upper).BoundingBox()
report={'status':'CAD_CANDIDATE_NOT_ADOPTED_PENDING_ASSEMBLY_PATH_AND_RETENTION','source_pcb_sha256':json.loads((FIT/'current-pcba-envelope-review.json').read_text())['source_pcb_sha256'],'source_pcba_sha256':hashlib.sha256((FIT/'current-pcba-envelope.step').read_bytes()).hexdigest(),'bbox_mm':[b.xlen,b.ylen,b.zlen],'battery_max_mm':[15.5,27,4.2],'growth_reservation_mm':.5,'growth_reservation_is_manufacturer_qualification':False,'checks':checks,'remaining':['Verify battery/connector insertion and separator retention without pouch preload; separator is currently a separate case insert.','Verify original harness sweep and mated connector dimensions; current harness envelope is provisional.','Verify separator flexure, insulation, drop/cord/thermal and actual printed fit; no physical tests performed.'],'order_allowed':False,'files':{}}
for p in sorted(OUT.glob('*')):
 if p.suffix in ['.step','.stl']:report['files'][p.name]=hashlib.sha256(p.read_bytes()).hexdigest()
(OUT/'review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))

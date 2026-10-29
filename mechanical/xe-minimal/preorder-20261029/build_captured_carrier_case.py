"""One-piece separator/carrier inserted after battery; lid captures board stack."""
from pathlib import Path
import cadquery as cq,json,hashlib
H=Path(__file__).resolve().parent;S=H/'retained-battery-case';O=H/'captured-carrier-case';O.mkdir(exist_ok=True)
FIT=H.parents[2]/'hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/fit-kit'
def load(p):return cq.importers.importStep(str(p)).val()
def box(x0,x1,y0,y1,z0,z1):return cq.Workplane('XY').box(x1-x0,y1-y0,z1-z0).val().translate(((x0+x1)/2,(y0+y1)/2,(z0+z1)/2))
lower=load(S/'case-lower.step');upper=load(S/'case-upper.step');sep=load(S/'separator.step');battery=load(S/'battery-max-positioned.step');growth=load(S/'battery-growth-reserve.step');pcb=load(FIT/'current-pcba-envelope.step');gauge=load(FIT/'pcba-max-thickness-connected-gauge.step')
screen=json.loads((S/'footprint-support-screen.json').read_text())
assert screen['source_pcb_sha256']==json.loads((FIT/'current-pcba-envelope-review.json').read_text())['source_pcb_sha256']
rows=screen['footprints']
# Outside frame reinforces the existing separator without reducing reserved growth.
frame=box(0,27.5,-27.2,-26.4,-2.22,-1.42).fuse(box(0,.8,-27.2,-6.5,-2.22,-1.42),box(26.7,27.5,-27.2,-10,-2.22,-1.42),box(6.8,8.4,-.7,.3,-2.22,-1.42)).clean()
for r in rows:
 if r['side']=='B.Cu':
  x0,x1,y0,y1=r['bounds'];frame=frame.cut(box(x0-.2,x1+.2,y0-.2,y1+.2,-2.3,-1.3))
carrier=sep.fuse(frame).clean()
centers=[(.6,-26),(26.9,-26),(26.9,-11),(7.6,-.1)]
pad_audit=[]
for x,y in centers:
 a=[x-.4,x+.4,y-.6,y+.6]
 hits=[r['ref'] for r in rows if a[0]<r['bounds'][1]+.2 and a[1]>r['bounds'][0]-.2 and a[2]<r['bounds'][3]+.2 and a[3]>r['bounds'][2]-.2]
 assert not hits,(x,y,hits)
 # Post starts at original separator bottom; extends frame where required.
 carrier=carrier.fuse(box(*a,-2.22,-.035)).clean()
 # Upper stop leaves .1mm above the .9mm maximum PCB top.
 upper=upper.fuse(box(*a,.965,5.30)).clean()
 pad_audit.append({'xy_rect_mm':a,'footprint_bbox_margin_mm':.2,'hits':hits})
# Support the widened carrier along right wall and enlarge left seating contact.
for y in [-24,-8]:lower=lower.fuse(box(26.7,27.9,y,y+2,-7.18,-2.22)).clean()
# Relieve the two PCB front corners for the observed +/-0.1 mm offset.
# .18 radius pockets stay within shell material; no external silhouette change.
for x in [0,27.5]:
 relief=cq.Workplane('XY').workplane(offset=-.15).center(x,.5).circle(.18).extrude(1.35).val()
 lower=lower.cut(relief).clean();upper=upper.cut(relief).clean()
# Carrier rear frame square corners caused the other offset interference.
for x0,x1 in [(0,.3),(27.2,27.5)]:carrier=carrier.cut(box(x0,x1,-27.2,-26.9,-2.3,-1.3)).clean()
checks={}
for name,shape in [('lower',lower),('upper',upper),('carrier',carrier)]:
 checks[name+'_valid']=shape.isValid();checks[name+'_solid_count']=len(shape.Solids())
 for other,q in [('pcb',pcb),('max_gauge',gauge),('battery',battery),('growth',growth)]:checks[name+'_overlap_'+other+'_mm3']=shape.intersect(q).Volume()
checks['lower_carrier_overlap_mm3']=lower.intersect(carrier).Volume();checks['upper_carrier_overlap_mm3']=upper.intersect(carrier).Volume();checks['lower_upper_overlap_mm3']=lower.intersect(upper).Volume()
checks['carrier_seat_contact_proxy_mm3']=lower.intersect(carrier.translate((0,0,-.001))).Volume()
checks['pcb_carrier_contact_proxy_mm3']=carrier.intersect(gauge.translate((0,0,-.001))).Volume()
checks['carrier_upper_distance_mm']=carrier.distance(upper)
for name,q in [('case-lower',lower),('case-upper',upper),('carrier',carrier),('pcba-max-gauge',gauge),('battery-max-positioned',battery),('battery-growth-reserve',growth)]:
 for ext in ['step','stl']:cq.exporters.export(q,str(O/f'{name}.{ext}'))
a=cq.Assembly(name='captured_carrier_case')
for name,q in [('lower',lower),('upper',upper),('carrier',carrier),('pcba',pcb),('battery',battery)]:a.add(q,name=name)
a.save(str(O/'assembly.step'))
r={'status':'CANDIDATE_GEOMETRY_PENDING_CHECKS','source_pcb_sha256':json.loads((FIT/'current-pcba-envelope-review.json').read_text())['source_pcb_sha256'],'source_envelope_sha256':hashlib.sha256((FIT/'current-pcba-envelope.step').read_bytes()).hexdigest(),'board_supports':pad_audit,'nominal_board_upper_stop_clearance_mm':.2008,'max_board_upper_stop_clearance_mm':.1,'carrier_post_top_z_mm':-.035,'carrier_bottom_z_mm':-2.22,'growth_reserve_mm':.5,'checks':checks,'limitations':['Nominal geometric capture depends on closed lid; lid joint strength and print tolerances unqualified.','Frame stiffness, positive support under lateral tolerance, and physical drop testing unqualified.','Original harness/mated connector/insertion route still unverified.','0.5mm growth allowance is an engineering reservation, not battery manufacturer qualification.'],'order_allowed':False}
(O/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

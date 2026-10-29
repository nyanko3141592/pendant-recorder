"""Selected first-prototype wire bay and adhesive-pocket case; engineering envelopes."""
from pathlib import Path
import cadquery as cq, json, math, hashlib
H=Path(__file__).resolve().parent; S=H/'captured-carrier-case'; O=H/'prototype-case'; O.mkdir(exist_ok=True)
FIT=H.parents[2]/'hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/fit-kit'
def load(p):return cq.importers.importStep(str(p)).val()
def box(x0,x1,y0,y1,z0,z1):return cq.Workplane('XY').box(x1-x0,y1-y0,z1-z0).val().translate(((x0+x1)/2,(y0+y1)/2,(z0+z1)/2))
lower=load(S/'case-lower.step'); upper=load(S/'case-upper.step'); carrier=load(S/'carrier.step'); battery=load(S/'battery-max-positioned.step'); gauge=load(S/'pcba-max-gauge.step'); pcb=load(FIT/'current-pcba-envelope.step')
# Conservative substitute C30 body with seating allowance; PCB copper unchanged.
c30=box(20.405,21.605,-13.135,-12.435,-.785,-.035)
gauge=gauge.fuse(c30).clean()
# Local wire bay. Rounded exterior; existing principal case and PCB positions unchanged.
outer=cq.Workplane('XY').box(13,8.05,6.9).edges('|Z').fillet(1.2).val().translate((6.5,4.675,-3.35))
inner=box(.5,12.5,-2.1,7.9,-5.8,-.8)
lower=lower.fuse(outer).cut(inner).clean()
# Open roof for placing already connected stack; lid covers bay with >=0.8mm roof.
lower=lower.cut(box(.5,12.5,-.7,7.9,-.81,.11)).clean()
roof=cq.Workplane(obj=box(0,13,.65,8.7,.1,.95)).edges('|Z').fillet(1.2).edges('>Z').fillet(.2).val()
upper=upper.fuse(roof).clean()
# Wide root passage, no clamp on wires, and no sharp separator edge in corridor.
root=box(6.1,10.4,-.01,1,-5.6,-3.9)
lower=lower.cut(root).clean()
# Adhesive stays in six recessed outer seam pads, away from ports and wire bay.
pockets=[]
for x0,x1,y0,y1 in [(-1.1,-.45,-22,-17),(-1.1,-.45,-13,-8),(27.95,28.6,-23,-18),(27.95,28.6,-13,-8),(18,23,.9,1.55),(1,6,-28.4,-27.75)]:
 p=box(x0,x1,y0,y1,-.05,.101); lower=lower.cut(p).clean();pockets.append([x0,x1,y0,y1])
# The battery wrapper remains intact. Factory-applied 0.10 mm insulation on carrier underside.
insulation=box(1,15.5,-26.5,-1,-2.32,-2.22)
carrier=carrier.cut(box(1.7,5.4,-1.31,.6,-2.33,-.8)).clean()
lower=lower.cut(upper).clean()
# Three wires: 0.8mm OD assumption +0.2mm radial clearance. Root straight allowance >=1.0mm at each end; not manufacturer guaranteed.
# Longer leads use a larger U-loop height with constant2.887mm bend radius.
paths=[]; wires=[]; stats=[]
radius=math.hypot(8.25-3.525,4.82-1.5)/2
for length in [12,15,18]:
 height=(length-.7-math.pi*radius)/2
 start=cq.Vector(8.25,height,-4.82); end=cq.Vector(3.525,height,-1.5)
 e=cq.Edge.makeThreePointArc(start,cq.Vector((8.25+3.525)/2,height+radius,(-4.82-1.5)/2),end)
 edges=[cq.Edge.makeLine(cq.Vector(8.25,0,-4.82),start),e,cq.Edge.makeLine(end,cq.Vector(3.525,-.7,-1.5))]
 path=cq.Wire.assembleEdges(edges)
 for dx in [-1.2,0,1.2]:
  pp=path.translate((dx,0,0)); w=cq.Workplane(cq.Plane(origin=(8.25+dx,0,-4.82),normal=(0,1,0))).circle(.6).sweep(cq.Workplane(obj=pp),isFrenet=True).val();wires.append(w)
 paths.append(path)
 stats.append({'lead_length_mm':length,'modeled_centerline_mm':path.Length(),'straight_battery_root_mm':height,'straight_plug_root_mm':height+.7,'bend_radius_mm':radius,'note':'Bundle routing corridor, translated curves are envelope samples, not exact simultaneous conductor placement.'})
wire=cq.Compound.makeCompound(wires)
# Conservative mated region, excludes the nominal header itself in clash reporting.
plug=box(.625,6.425,-5.85,-.65,-1.9,-.1)
checks={}
for n,q in [('lower',lower),('upper',upper),('carrier',carrier)]:
 checks[n+'_valid']=q.isValid();checks[n+'_solids']=len(q.Solids())
 for m,r in [('battery',battery),('gauge',gauge),('wire',wire),('insulation',insulation)]:checks[n+'_'+m+'_overlap_mm3']=q.intersect(r).Volume()
checks['lower_upper_overlap_mm3']=lower.intersect(upper).Volume()
checks['lower_carrier_overlap_mm3']=lower.intersect(carrier).Volume()
checks['wire_battery_overlap_mm3']=wire.intersect(battery).Volume()
checks['wire_pcb_overlap_mm3']=wire.intersect(pcb).Volume()
checks['plug_carrier_overlap_mm3']=plug.intersect(carrier).Volume()
# Connected stack lowered as one unit: no relative battery/connector motion or lead tension.
stack=cq.Compound.makeCompound([battery,carrier,gauge,wire,insulation])
checks['connected_stack_vertical_insertion_samples_mm3']={str(z):lower.intersect(stack.translate((0,0,z))).Volume() for z in [0,.1,.5,1,2,4,8,12]}
parts={'case-lower':lower,'case-upper':upper,'carrier':carrier,'battery-max':battery,'pcba-max-gauge':gauge,'harness-clearance-envelope':wire,'mated-connector-envelope':plug,'insulation':insulation}
for n,q in parts.items():
 for ext in ['step','stl']:cq.exporters.export(q,str(O/f'{n}.{ext}'),**({'tolerance':.02,'angularTolerance':.1} if ext=='stl' else {}))
for name,offsets in [('assembly',{}),('exploded',{'battery-max':8,'carrier':15,'pcba-max-gauge':22,'case-upper':32,'harness-clearance-envelope':22,'mated-connector-envelope':22,'insulation':15})]:
 a=cq.Assembly(name=name)
 for n,q in parts.items():a.add(q.translate((0,0,offsets.get(n,0))),name=n)
 a.save(str(O/f'{name}.step'))
b=lower.fuse(upper).BoundingBox()
r={'status':'ENGINEERING_PROTOTYPE_CONDITIONAL_ENVELOPES','pcb_sha256':'b3cdfc064b4321aa6d32c2ff579efeaaf709f36dbfe7255380feec880741eee0','bbox_mm':[b.xlen,b.ylen,b.zlen],'harness':stats,'checks':checks,'assumptions':{'wire_OD_mm':.8,'wire_radial_clearance_mm':.2,'minimum_root_straight_assumption_mm':1.0,'battery_exit_xyz_mm':[8.25,0,-4.82],'plug_entry_xyz_mm':[3.525,-.7,-1.5],'mated_envelope_is_manufacturer_maximum':False,'root_datum_is_dimensioned_by_manufacturer':False},'joint':{'method':'six recessed adhesive pads, untouched seam is hard stop','pocket_depth_mm':.15,'pockets_xy_mm':pockets,'adhesive':'Cemedine Super X2 Clear AX-083; PETG coupon and unpopulated-case qualification before populated closure','physical_strength_verified':False},'insulation_thickness_mm':.1,'remaining_growth_reservation_mm':.4,'physical_print_performed':False,'order_allowed':False}
(O/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

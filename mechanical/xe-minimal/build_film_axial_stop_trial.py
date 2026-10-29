"""Positive end-stop geometry around provisional joint envelopes; not pull qualification."""
from pathlib import Path
import cadquery as cq,json,hashlib
from wire_geometry import rounded
O=Path(__file__).resolve().parent
files={'separator':'diagonal-entry-notched-separator-trial.step','lower':'diagonal-recessed-cap-lower-trial.step','board':'film-integration-integrated-board.step','upper':'tab-clearance-upper-trial.step','battery':'offset-pack-assembly-trial.step'}
s={n:cq.importers.importStep(str(O/f)).val()for n,f in files.items()}
def box(w,l,h,x,y,z):return cq.Workplane('XY').box(w,l,h,centered=(True,False,False)).translate((x,y,z)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
wall=box(3.7,.4,1.15,0,26.1,-2.42)
for x in [-.9,.9]:wall=wall.cut(cq.Solid.makeCylinder(.25,.8,cq.Vector(x,25.9,-1.92),cq.Vector(0,1,0)))
rails=[box(.4,3.,.45,x,23.5,-1.72)for x in [-1.65,1.65]]
stop=pose(wall.fuse(*rails).clean());separator=s['separator'].fuse(stop).clean()
relief=pose(cq.Compound.makeCompound([box(.6,3.2,.65,x,23.4,-1.82)for x in [-1.65,1.65]]));lower=s['lower'].cut(relief).clean()
wirefile=O/'film-lap-lowered-terminals-review.json';wr=json.loads(wirefile.read_text());wireparts=[]
for row in wr['rows']:
 wireparts += [rounded(row['insulated_centerline_mm'],row['insulated_corner_radii_mm'])[0],rounded(row['bare_centerline_mm'],row['bare_corner_radius_mm'],wire_radius=.075)[0]]
joints=[pose(box(.9,3,.8,x,23,-2.32))for x in [-.9,.9]]
body=pose(box(4.1,22,.5,0,0,-2.32));leads=[pose(box(.7,4,.5,x,22,-2.32))for x in [-.95,.95]]
obstacles={'lower':lower,'board':s['board'],'upper':s['upper'],'battery':s['battery'],'wires':cq.Compound.makeCompound(wireparts),'sensor':cq.Compound.makeCompound([body]+leads),'joints':cq.Compound.makeCompound(joints)}
checks={n:{'overlap_mm3':separator.intersect(q).Volume(),'gap_mm':separator.distance(q)}for n,q in obstacles.items()}
# Translation along outgoing lead axis tests only the stated max joint-box hypothesis.
axis=pose(cq.Vertex.makeVertex(0,1,0)).Center()-pose(cq.Vertex.makeVertex(0,0,0)).Center()
rows=[{'joint_translation_mm':d,'intersection_with_stop_mm3':[q.translate(axis.multiply(d)).intersect(stop).Volume()for q in joints]}for d in [0,.05,.1,.2,.5,1]]
a=cq.Assembly(name='film_axial_stop_trial')
for n,q in {**obstacles,'separator_with_stop':separator}.items():a.add(q,name=n)
output=O/'film-axial-stop-study.step';a.export(str(output))
for name,q in [('separator',separator),('lower',lower)]:cq.exporters.export(q,str(O/f'film-axial-stop-{name}-trial.step'))
r={'status':'AXIAL_STOP_GEOMETRY_TRIAL_NOT_RETENTION_QUALIFICATION','sources_sha256':{n:hashlib.sha256((O/f).read_bytes()).hexdigest()for n,f in files.items()},'wire_review_sha256':hashlib.sha256(wirefile.read_bytes()).hexdigest(),'valid':{'separator':separator.isValid(),'lower':lower.isValid()},'solid_count':{'separator':len(separator.Solids()),'lower':len(lower.Solids())},'stop_hole_diameter_mm':.5,'wall_thickness_mm':.4,'joint_to_stop_gap_mm':.1,'checks':checks,'joint_translation_screen':rows,'limits':['Retention screen uses provisional maximum joint boxes, not a guaranteed minimum finished joint size. Actual joint/insulation collar must be dimensioned and pull-tested before claiming retention.','Wire holes require seller threading before PCB soldering; assembly sequence not yet verified.','No force, PLA creep, fracture, print tolerance, insulation crush or thermal process qualification.','Lower rail relief and new separator must be re-sliced and assembly/tool-clearance checked.','Battery and case outside dimensions are unchanged by intended local relief, but complete envelope/assembly validation remains required.']}
(O/'film-axial-stop-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

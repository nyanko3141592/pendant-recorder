"""Open axial stop wire holes downward; compare rigid preformed-wire insertion."""
from pathlib import Path
import cadquery as cq,json,hashlib
from wire_geometry import rounded
O=Path(__file__).resolve().parent
source=O/'film-axial-stop-relieved-separator-trial.step';original=cq.importers.importStep(str(source)).val()
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
cuts=[pose(cq.Workplane('XY').box(.5,.6,1,centered=(True,False,False)).translate((x,26,-2.92)).val())for x in [-.9,.9]]
sep=original.cut(*cuts).clean();assert sep.isValid() and len(sep.Solids())==1
out=O/'film-bottom-slot-separator-trial.step';cq.exporters.export(sep,str(out))
wirefile=O/'film-lap-lowered-terminals-review.json';wr=json.loads(wirefile.read_text());wires=cq.Compound.makeCompound([rounded(r['insulated_centerline_mm'],r['insulated_corner_radii_mm'])[0]for r in wr['rows']])
rows=[]
for dz in [0,-.1,-.2,-.4,-.8,-1.5,-3,-5,-8]:
 moving=wires.translate((0,0,dz))
 rows.append({'z_translation_mm':dz,'original_overlap_mm3':moving.intersect(original).Volume(),'slotted_overlap_mm3':moving.intersect(sep).Volume()})
joints=[pose(cq.Workplane('XY').box(.9,3,.8,centered=(True,False,False)).translate((x,23,-2.32)).val())for x in [-.9,.9]]
a=pose(cq.Vertex.makeVertex(0,1,0)).Center()-pose(cq.Vertex.makeVertex(0,0,0)).Center()
retention=[{'translation_mm':d,'max_joint_box_overlap_mm3':[j.translate(a.multiply(d)).intersect(sep).Volume()for j in joints]}for d in [0,.2,.5]]
r={'status':'BOTTOM_SLOT_COMPARISON_NOT_ADOPTED','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'wire_source_sha256':hashlib.sha256(wirefile.read_bytes()).hexdigest(),'valid':sep.isValid(),'solid_count':len(sep.Solids()),'slot_width_mm':.5,'removed_volume_mm3':original.Volume()-sep.Volume(),'sampled_rigid_wire_insertion':rows,'retention_max_box_screen':retention,'limits':['Sampled positions do not prove continuous insertion clearance.','Preformed wires are treated rigidly; bare PCB tails, joint insulation and tools omitted.','Opening holes removes threading requirement at stop but does not establish full assembly feasibility.','Max joint envelope is not a minimum retention collar; no retention or printed strength qualification.']}
(O/'film-bottom-slot-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

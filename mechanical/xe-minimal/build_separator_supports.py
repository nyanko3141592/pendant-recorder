"""Case-supported separator end rails; geometric experiment, not load-qualified."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
lower=cq.importers.importStep(str(O/'separator-case-lower-study.step')).val();upper=cq.importers.importStep(str(O/'separator-case-upper-study.step')).val();plate=cq.importers.importStep(str(O/'battery-separator-study.step')).val();electronics=cq.importers.importStep(str(O/'separator-stack-study.step')).val();bottom=lower.BoundingBox().zmin;top=plate.BoundingBox().zmin
rails=[];checks=[]
for name,y in [('front',.35),('rear',-27.35)]:
 rail=cq.Workplane('XY').box(15.9,.6,top-bottom,centered=(True,True,False)).translate((8.25,y,bottom)).val()
 overlap=rail.intersect(lower).Volume();collision=sum(rail.intersect(s).Volume() for s in electronics.Solids());distance=rail.distance(plate)
 assert overlap>0 and collision<1e-5 and distance<1e-6
 checks.append({'name':name,'case_overlap_mm3':overlap,'electronics_intersection_mm3':collision,'separator_distance_mm':distance,'nominal_end_bearing_width_mm':.15});rails.append(rail)
for ey in [-7,-20]:
 post=cq.Workplane('XY').box(1,2,top-bottom,centered=(True,True,False)).translate((16.7,ey,bottom)).val()
 overlap=post.intersect(lower).Volume();collision=sum(post.intersect(t).Volume() for t in electronics.Solids());distance=post.distance(plate)
 assert overlap>0 and collision<1e-5 and distance<1e-6
 checks.append({'name':'side_post_'+str(ey),'case_overlap_mm3':overlap,'electronics_intersection_mm3':collision,'separator_distance_mm':distance,'bearing_area_mm2':2.0});rails.append(post)
for rail in rails:lower=lower.fuse(rail)
lower=lower.clean();assert lower.isValid() and len(lower.Solids())==1
cq.exporters.export(lower,str(O/'supported-lower-case-study.step'));a=cq.Assembly(name='supported_separator_case');a.add(lower,name='lower_with_rails',color=cq.Color(.7,.7,.75,.35));a.add(upper,name='upper_shell',color=cq.Color(.7,.7,.75,.35));a.add(electronics,name='electronics_separator_pack');out=O/'supported-case-assembly-study.step';a.export(str(out));assert cq.importers.importStep(str(out)).val().isValid()
r={'status':'GEOMETRIC_SUPPORT_ONLY_NOT_MANUFACTURING_RELEASE','source_files_sha256':{n:hashlib.sha256((O/n).read_bytes()).hexdigest() for n in ['separator-case-lower-study.step','separator-case-upper-study.step','separator-stack-study.step','battery-separator-study.step']},'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'checks':checks,'lower_single_connected_solid':True,'limitations':['0.15mm end bearing width is small and not tolerance or load qualified','0.6mm rail thickness and0.3mm separator stiffness require material/process selection','No PCB supports, closure, battery retention, thermal pad or cable channel yet','No physical assembly or drop test','Mating housing and wire geometry remain incomplete']};(O/'separator-support-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)

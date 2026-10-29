"""USB shoulder relief comparison, bounded cable envelope only, not release."""
from pathlib import Path
import hashlib,itertools,json,shutil
import cadquery as cq
from OCP.Bnd import Bnd_Box
from OCP.BRepBndLib import BRepBndLib
P=Path(__file__).resolve().parent
S=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-removable-ledge')
O=S.with_name('Pendant-v15-XE-usb-relief');O.mkdir(exist_ok=True)
rp=P/'usb-mating-recess-review.json';r=json.loads(rp.read_text())
for source,digest in r['source_sha256'].items():assert hashlib.sha256(Path(source).read_bytes()).hexdigest()==digest
sources=[S/(n+'-NOT-MANUFACTURING.step') for n in ['body','lid','key']]
original={n:cq.importers.importStep(str(p)).val() for n,p in zip(['body','lid','key'],sources)}
def box(x,y,z,w,d,t):return cq.Workplane('XY').box(w,d,t).val().translate((x+w/2,y+d/2,z+t/2))
def bounds(shape):
 b=Bnd_Box();BRepBndLib.AddOptimal_s(shape.wrapped,b,False,False);return list(b.Get())
# Open through the lid edge; avoid leaving a fragile thin roof over the plug.
cut=box(6.3,30.1,7.4,12,2,7.6)
shapes={n:shape.cut(cut).clean() if n!='key' else shape for n,shape in original.items()}
checks=[]
for delta,dx,dz in itertools.product([0,.2,.4,.6],[-.2,0,.2],[-.2,0,.2]):
 #11.2mm width is an explicit selection envelope, not a universal USB-C dimension.
 shoulder_y=r['mouth_plane_y_mm']+r['drawing']['minimum_mated_plug_shoulder_standoff_mm']-delta
 x=r['axis_case_mm'][0]+dx;z=r['axis_case_mm'][2]+dz
 sweep=box(x-5.6,shoulder_y,z-3.25,11.2,14,6.5)
 row=dict(additional_recess_mm=delta,lateral_offset_mm=dx,vertical_offset_mm=dz,original_overlap_mm3={},relieved_overlap_mm3={})
 for name in ['body','lid']:
  row['original_overlap_mm3'][name]=sweep.intersect(original[name]).Volume()
  row['relieved_overlap_mm3'][name]=sweep.intersect(shapes[name]).Volume()
 checks.append(row)
# Confirm the defined PCB supports/posts remain outside the removed volume.
supports={'right_lower':box(21,24.7,6.2,7.8,2,1.6).fuse(box(21,24.7,7.8,2,2,.8)),'rear_lower':box(18.4,27.5,7,2,3.3,1.6)}
for i,(x,y) in enumerate([(3.6,22),(22,25.7),(19.4,28.5)]):supports['lid_post_'+str(i+1)]=box(x-1,y-1,11.03,2,2,2.57)
support_hits={name:cut.intersect(solid).Volume() for name,solid in supports.items()}
assert all(v<1e-6 for v in support_hits.values())
assert all(all(v<1e-6 for v in row['relieved_overlap_mm3'].values()) for row in checks)
exported={}
for name,shape in shapes.items():
 assert shape.isValid() and len(shape.Solids())==1,name
 b=bounds(shape)
 assert all(abs(x-y)<1e-6 for x,y in zip(b,bounds(original[name]))),(name,b)
 for extension in ['step','stl']:
  p=O/(name+'-NOT-MANUFACTURING.'+extension);cq.exporters.export(shape,str(p));exported[p.name]=hashlib.sha256(p.read_bytes()).hexdigest()
 imported=cq.importers.importStep(str(O/(name+'-NOT-MANUFACTURING.step'))).val()
 assert imported.isValid() and len(imported.Solids())==1
report=dict(status='USB_RELIEF_COMPARISON_BOUNDED_CABLE_ENVELOPE_CLEAR',source_sha256={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [*sources,rp,Path(__file__)]},nominal_outer_mm=[29.6,31.6,14.6],cut_box_case_mm=[6.3,30.1,7.4,12,2,7.6],tested_shoulder_envelope_mm=[11.2,14,6.5],sensitivity_cases=checks,original_colliding_cases=sum(any(v>1e-6 for v in row['original_overlap_mm3'].values()) for row in checks),relieved_colliding_cases=0,support_removed_volume_mm3=support_hits,removed_case_volume_mm3={n:original[n].Volume()-shapes[n].Volume() for n in ['body','lid']},files=exported,limitations=['Cable shoulder width11.2mm is an assumed selection limit; no actual cable selected or measured. GCT mating illustration height6.5mm and standoff1.85mm do not establish every cable geometry.','Recess and X/Z offsets are sensitivities, not a validated dimensional tolerance stack.','Cut opens the rear lid edge and enlarges an acoustic/debris path; stiffness, cord/handling noise and tape routing need review.','Defined support solids untouched; case strength and closure retention are not established.','Material removal cannot introduce positive overlap with existing components, but loss of shielding/support/contact area still requires review.','Battery harness, key assembly fixture and thermal interface remain unresolved.','Parent fit-dummy/archive files still describe the previous case; do not mix revisions.'],adopted=False,release_allowed=False)
(P/'usb-relief-fit-review.json').write_text(json.dumps(report,indent=2)+'\n');(O/'review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({k:report[k] for k in ['original_colliding_cases','relieved_colliding_cases','support_removed_volume_mm3','removed_case_volume_mm3']},indent=2))

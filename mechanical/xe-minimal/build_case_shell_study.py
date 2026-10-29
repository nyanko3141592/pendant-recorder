"""Parametric enclosure envelope, deliberately not a printable release."""
from pathlib import Path
import json,hashlib,cadquery as cq
O=Path(__file__).resolve().parent
f=O/'battery-over-connector-study.step';assembly=cq.importers.importStep(str(f)).val();assert assembly.isValid();b=assembly.BoundingBox()
clear=.3;wall=.8;seam=.4
xmin,xmax=b.xmin-clear-wall,b.xmax+clear+wall
ymin,ymax=b.ymin-clear-wall,b.ymax+clear+wall
zmin,zmax=b.zmin-clear-wall,b.zmax+clear+wall
cx,cy=(xmin+xmax)/2,(ymin+ymax)/2
outer=cq.Workplane('XY').box(xmax-xmin,ymax-ymin,zmax-zmin,centered=(True,True,False)).edges('|Z').fillet(1.2).translate((cx,cy,zmin))
inner=cq.Workplane('XY').box(b.xlen+2*clear,b.ylen+2*clear,b.zlen+2*clear,centered=(True,True,False)).translate((cx,cy,b.zmin-clear))
shell=outer.cut(inner)
# Preliminary USB plug access window. Actual plug overmold clearance remains unverified.
usb=cq.Workplane('XY').box(10,5,4.4).translate((12,ymin+1,2.45));shell=shell.cut(usb)
lo=cq.Workplane('XY').box(100,100,seam-zmin,centered=(True,True,False)).translate((cx,cy,zmin));hi=cq.Workplane('XY').box(100,100,zmax-seam,centered=(True,True,False)).translate((cx,cy,seam))
parts={'lower':shell.intersect(lo).val(),'upper':shell.intersect(hi).val()};a=cq.Assembly(name='case_shell_study');a.add(assembly,name='provisional_electronics_and_pack')
vol={}
for name,s in parts.items():
 assert s.isValid() and s.Volume()>0
 vol[name]=sum(s.intersect(t).Volume() for t in assembly.Solids())
 assert vol[name]<1e-5,vol
 cq.exporters.export(s,str(O/('case-'+name+'-study.step')));a.add(s,name=name+'_shell',color=cq.Color(.7,.7,.75,.35))
out=O/'case-shell-assembly-study.step';a.export(str(out));assert cq.importers.importStep(str(out)).val().isValid()
r={'status':'CASE_ENVELOPE_STUDY_NOT_FOR_MANUFACTURE','source_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'outer_size_mm':[xmax-xmin,ymax-ymin,zmax-zmin],'wall_assumption_mm':wall,'clearance_assumption_mm':clear,'seam_z_mm':seam,'shell_intersection_volume_mm3':vol,'usb_window_assumption_mm':[10,4.4],'not_yet_included':['Actual mated housing and original leads','Battery separator and connector load protection','PCB support and retention','Closure features and tolerance stack','Thermal sensor contact','Button actuator and acoustic port/seal','USB plug overmold and insertion travel verification','Battery swelling allowance'],'qualification':'Zero model intersection only; approximate envelopes and missing mechanisms prevent assembly-fit approval.'};(O/'case-shell-study-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)

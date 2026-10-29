from pathlib import Path
import cadquery as cq,json,hashlib
w=Path(__file__).resolve().parent;mech=Path('/Users/takahashinaoki/Dev/pendant-recorder/mechanical/xe-minimal')
load=lambda p:cq.importers.importStep(str(p)).val()
native=load(w/'current-populated-native.step')
parts={'U1':load(w/'u1-max-body.step'),'U11':load(w/'u11-max-body.step'),'U8':load(mech/'u8-body-positioned-study.step'),'J2':load(mech/'j2-header-positioned-study.step')}
# Export dielectric Z0..0.7292; outer Cu .035 each side gives -.035.. .7642.
parts['U1']=parts['U1'].translate((0,0,-.035))
parts['U11']=parts['U11'].translate((0,0,-.035))
parts['U8']=parts['U8'].translate((0,0,.7642-.8264))
parts['J2']=parts['J2'].translate((0,0,-.035))
solids=native.Solids();hits=[]
for ref,s in parts.items():
 for i,t in enumerate(solids):
  a,b=s.BoundingBox(),t.BoundingBox()
  if a.xmax<b.xmin or b.xmax<a.xmin or a.ymax<b.ymin or b.ymax<a.ymin or a.zmax<b.zmin or b.zmax<a.zmin:continue
  vol=s.intersect(t).Volume()
  if vol>1e-6:hits.append({'ref':ref,'native_solid':i,'overlap_mm3':vol,'native_bbox':[b.xmin,b.xmax,b.ymin,b.ymax,b.zmin,b.zmax]})
combined=cq.Compound.makeCompound([native,*parts.values()])
cq.exporters.export(combined,str(w/'current-pcba-envelope.step'))
cq.exporters.export(combined,str(w/'current-pcba-envelope.stl'),tolerance=.02,angularTolerance=.1)
# The assembly compound preserves physical component separation; do not call it a printable solid.
case=mech/'prototype-v1/fixed-board-compact-v1'
checks={n:combined.intersect(load(case/f'case-compact-v1-{n}.step')).Volume() for n in ['lower','upper']}
out={'status':'CURRENT_PCBA_ENVELOPE_NOT_PRINT_READY','source_pcb_sha256':hashlib.sha256((Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/design/pendant-review.kicad_pcb')).read_bytes()).hexdigest(),'datum':{'dielectric_z_mm':[0,.7292],'outer_copper_z_mm':[-.035,.7642],'total_nominal_mm':.7992,'U8_z_correction_mm':-.0622,'bottom_supplement_z_correction_mm':-.035},'native_solids':len(solids),'combined_solids':len(combined.Solids()),'valid':combined.isValid(),'supplement_vs_native_overlaps':hits,'case_overlap_mm3':checks,'limitations':['Existing U8/J2 supplements retained; dimensional/pose provenance requires recheck','Nominal native component models mixed with maximum U1/U11 envelopes','Solder standoff and placement tolerance absent','Disconnected component solids require designed bridges for print gauge; no print authorization','PCB native dielectric thickness .7292; finished-thickness tolerance not incorporated'],'release_allowed':False}
(w/'current-pcba-envelope-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))

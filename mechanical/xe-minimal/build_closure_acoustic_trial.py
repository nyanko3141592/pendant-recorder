"""Candidate straight acoustic bore: geometry screen, no acoustic qualification."""
from pathlib import Path
import json,hashlib,cadquery as cq,sys
O=Path(__file__).resolve().parent
x,y=21.93,-4.565
lower=cq.importers.importStep(str(O/'clearance-hook-lower-trial.step')).val();bb=lower.BoundingBox()
board=cq.importers.importStep(str(O/'screw-candidate-integrated-board.step')).val()
# Engineering assumptions: 1.2mm bore, 2.4mm duct OD, 0.15mm seal gap under PCB.
slim='--slim' in sys.argv
inner=.5 if slim else .6;outer=.9 if slim else 1.2;top=-.15;bottom=bb.zmin
stem='closure-acoustic-slim' if slim else 'closure-acoustic'
ring=cq.Workplane('XY').circle(outer).circle(inner).extrude(top-bottom).val().translate((x,y,bottom))
bore=cq.Workplane('XY').circle(inner).extrude(top-bottom+1).val().translate((x,y,bottom-.5))
candidate=lower.fuse(ring).cut(bore).clean();assert candidate.isValid()
obstacles=[('board',board),('separator',cq.importers.importStep(str(O/'battery-separator-study.step')).val()),('battery',cq.importers.importStep(str(O/'dtp401525-xe-pack-max.step')).val().translate((8.25,-13.5,-6.62)))]
checks=[{'object':name,'duct_intersection_mm3':ring.intersect(s).Volume(),'duct_distance_mm':ring.distance(s)} for name,s in obstacles]
file=O/(stem+'-lower-case-trial.step');cq.exporters.export(candidate,str(file));cq.exporters.export(ring,str(O/(stem+'-duct-trial.step')))
r={'status':'ACOUSTIC_GEOMETRY_TRIAL_NOT_QUALIFIED','board_sha256':json.loads((O/'screw-candidate-board-inventory.json').read_text())['pcb_sha256'],'pcb_acoustic_hole':{'center_pcb_mm':[x,-y],'drill_diameter_mm':.8,'evidence':'Read U8 NPTH from candidate KiCad board'},'engineering_assumptions':{'bore_diameter_mm':inner*2,'duct_outer_diameter_mm':outer*2,'duct_top_z_mm':top,'duct_bottom_z_mm':bottom,'pcb_seal_gap_mm':.15},'checks':checks,'output':file.name,'shape_valid':True,'solid_count':len(candidate.Solids()),'limitations':['Duct and housing are trial geometry, not adopted case','Acoustic resonance, sensitivity and frequency response must be evaluated','Gasket material, compression, sealing land and board tolerances unresolved','Dust/water membrane and its acoustic loss not selected','No wire path or full assembly sequence validation'],'source_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest() for f in ['clearance-hook-lower-trial.step','screw-candidate-integrated-board.step']}}
(O/(stem+'-path-trial.json')).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

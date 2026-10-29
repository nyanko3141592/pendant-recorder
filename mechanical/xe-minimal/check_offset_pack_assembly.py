from pathlib import Path
import cadquery as cq,json
O=Path(__file__).resolve().parent
case=cq.importers.importStep(str(O/'adhesive-pocket-032-lower-trial.step')).val();board=cq.importers.importStep(str(O/'glue-case-candidate-integrated-board.step')).val();sep=cq.importers.importStep(str(O/'battery-separator-study.step')).val();pack=cq.importers.importStep(str(O/'dtp401525-xe-pack-max.step')).val().translate((8.65,-13.5,-6.62));original=sep
for yc in [-3,-22]:sep=sep.cut(cq.Workplane('XY').box(1.0,1.9,1,centered=(False,True,False)).translate((-.1,yc,-2.6)).val())
sep=sep.clean();assert sep.isValid()and len(sep.Solids())==1
rows=[]
for name,part in [('pack',pack),('separator',sep)]:
 # Extrude every planar footprint face normal to Z to enclose a continuous20mm translation.
 sweeps=[]
 for f in part.Faces():
  if f.geomType()=='PLANE' and abs(abs(f.normalAt().z)-1)<1e-7:
   sweeps.append(cq.Solid.extrudeLinear(f.outerWire(),f.innerWires(),cq.Vector(0,0,20)))
 hits=[case.intersect(part).Volume()]+[case.intersect(t).Volume()for t in sweeps]
 rows.append({'part':name,'max_individual_sweep_overlap_mm3':max(hits),'sweep_face_count':len(sweeps),'final_board_overlap_mm3':part.intersect(board).Volume(),'final_case_overlap_mm3':part.intersect(case).Volume()})
cq.exporters.export(sep,str(O/'support-notched-separator-trial.step'));cq.exporters.export(pack,str(O/'offset-pack-assembly-trial.step'))
r={'status':'OFFSET_PACK_AND_NOTCHED_SEPARATOR_TRIAL','pack_center_mm':[8.65,-13.5,-6.62],'pack_shift_x_mm':.4,'separator_removed_mm3':original.Volume()-sep.Volume(),'separator_pack_overlap_mm3':sep.intersect(pack).Volume(),'screens':rows,'limits':['Exact wire reach and mating housing still absent; pack shift not adopted until original lead reach verified','No tolerances, strength, temperature contact or physical assembly validation','Continuous extrusion screen uses all horizontal faces; intended for these prismatic solids only','Original full-width PCB supports retained; no0.2mm bearing reliance']};(O/'offset-pack-assembly-review.json').write_text(json.dumps(r,indent=2));print(json.dumps(r,indent=2))

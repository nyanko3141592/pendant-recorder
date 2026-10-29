from pathlib import Path
import cadquery as cq,json,hashlib
w=Path(__file__).resolve().parent
# Body maxima, not solder-joint or placement tolerance. B.Cu datum Z=0.
specs={'U1':{'mpn':'STM32U585CIU6','body_max_mm':[7.1,7.1,.6],'envelope_mm':[7.4,7.4,.6],'center_xy_mm':[16.8525,-7.7675],'source':'https://www.st.com/resource/en/datasheet/stm32u585ai.pdf','page':312,'note':'DS13086 Rev10 Table156; D/E exclude <=.15 mold protrusion. Conservatively add .15 each side. Same envelope size as old U535, now independently supported for U585.'},'U11':{'mpn':'MKDV8GIL-AST','body_max_mm':[8.1,6.1,.9],'envelope_mm':[8.1,6.1,.9],'center_xy_mm':[4.575,-14.175],'source':'https://datasheet.lcsc.com/datasheet/pdf/61bfef9e1fb8ace7e6d0d3d43cbccc88.pdf?productCode=C26159627','page':22,'note':'Manufacturer package drawing visually checked: Dmax8.1 Emax6.1 Amax.9; replaces assumed8.2x6.4x1.2.'}}
case=w.parent/'prototype-v1/fixed-board-compact-v1';parts={n:cq.importers.importStep(str(case/f'case-compact-v1-{n}.step')).val() for n in ['lower','upper']}
parts['separator']=cq.importers.importStep(str(w.parent/'battery-separator-study.step')).val()
parts['battery']=cq.importers.importStep(str(w.parent/'dtp401525-xe-pack-max.step')).val().translate((8.25,-13.5,-6.62))
for ref,d in specs.items():
 x,y,h=d['envelope_mm'];px,py=d['center_xy_mm'];s=cq.Workplane('XY').box(x,y,h).val().translate((px,py,-h/2))
 for ext in ['step','stl']:cq.exporters.export(s,str(w/f'{ref.lower()}-max-body.{ext}'))
 d['case_overlap_mm3']={n:s.intersect(v).Volume() for n,v in parts.items()};d['case_distance_mm']={n:s.distance(v) for n,v in parts.items()};d['valid']=s.isValid()
out={'status':'PART_BODY_ENVELOPES_NOT_ASSEMBLY_QUALIFICATION','parts':specs,'limitations':['Mounted solder stand-off and placement tolerances not yet included','No interference test against other populated components or harness; separator and battery nominal envelopes checked','U1 source text/table verified; local PDF download unavailable; U11 page visually checked'],'release_allowed':False}
(w/'package-envelope-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))

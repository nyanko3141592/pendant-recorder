from pathlib import Path
import json,cadquery as cq
O=Path(__file__).resolve().parent
s=cq.importers.importStep(str(O/'tps-candidate-integrated-board.step')).val()
def cyl(radius,z0,z1):return cq.Workplane('XY').circle(radius).extrude(z1-z0).translate((18,-26,z0)).val()
rows=[]
for radius in [.65,1.9]:
 rows.append({'radius_mm':radius,'above_PCB_components_mm3':s.intersect(cyl(radius,.827,4.5)).Volume(),'below_PCB_components_mm3':s.intersect(cyl(radius,-2.3,-.001)).Volume()})
r={'status':'SCREW_STACK_POSITION_SCREEN','center_PCB_mm':[18,26],'checks':rows,'limitations':['Generic component models; not maximum-dimension qualification','Bare PCB intentionally excluded from vertical bands','No drill or routing changes made','Large boss would overlap board edge and must merge into case wall']}
(O/'screw-stack-screen.json').write_text(json.dumps(r,indent=2)+'\n');print(r)

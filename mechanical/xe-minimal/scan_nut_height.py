from pathlib import Path
import json,math,cadquery as cq
O=Path(__file__).resolve().parent
b=cq.importers.importStep(str(O/'tps-candidate-integrated-board.step')).val();lo=cq.importers.importStep(str(O/'retained-lower-case-study.step')).val()
def cyl(r,a,z):return cq.Workplane('XY').circle(r).extrude(z-a).translate((18.1,-26,a)).val()
rows=[]
for top in [-2.4,-2.3,-2.2,-2.1,-2.0]:
 bottom=top-.8;roof=top+.6
 pocket=cq.Workplane('XY').polygon(6,2.7/math.cos(math.pi/6)).extrude(.9).translate((18.1,-26,top-.9)).val()
 slot=cq.Workplane('XY').box(5,2.7,.9,centered=(False,True,False)).translate((18.1,-26,top-.9)).val()
 post=cyl(1.9,lo.BoundingBox().zmin,roof).cut(pocket).cut(slot).cut(cyl(.65,top-1.1,roof+.1))
 gap=post.distance(b);overlap=post.intersect(b).Volume()
 rows.append({'nut_top_z_mm':top,'roof_top_z_mm':roof,'nominal_tip_projection_mm':bottom-(-3.3),'component_distance_mm':gap,'component_overlap_mm3':overlap})
 if top==-2.1:
  candidate=lo.fuse(post).clean();cq.exporters.export(candidate,str(O/'raised-nut-lower-trial.step'))
r={'status':'NUT_HEIGHT_SCREEN_NOT_ADOPTED','rows':rows,'roof_thickness_mm':.6,'screw_tip_z_mm':-3.3,'limitations':['Distances to generic/partial component models, not validated manufacturing clearance','Nut insertion retention and side-slot strength unresolved','Raised nut model must be used with matching screw upper case and drilled PCB','No tolerance-qualified release']}
(O/'nut-height-screen.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

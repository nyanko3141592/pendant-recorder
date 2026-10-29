from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
paths={'lower':'rounded-glue-reinforced-lower-study.step','board':'glue-case-candidate-integrated-board.step','separator':'battery-separator-study.step','pack':'dtp401525-xe-pack-max.step'}
s={n:cq.importers.importStep(str(O/f)).val()for n,f in paths.items()};s['pack']=s['pack'].translate((8.25,-13.5,-6.62));bottom=s['lower'].BoundingBox().zmin
rows=[]
for top in [-.15,-.35,-.55,-.75,-1.0]:
 ring=cq.Workplane('XY').circle(1.3).circle(.5).extrude(top-bottom).translate((21.93,-4.565,bottom)).val()
 row={'top_z_mm':top,'wall_mm':.8,'outer_diameter_mm':2.6,'bore_diameter_mm':1.0,'obstacles':{n:{'overlap_mm3':ring.intersect(v).Volume(),'distance_mm':ring.distance(v)}for n,v in s.items()if n!='lower'}};rows.append(row)
 if top==-.15:cq.exporters.export(ring,str(O/'thick-acoustic-duct-envelope.step'))
r={'status':'THICK_DUCT_CLEARANCE_SCREEN_NOT_ACOUSTIC_APPROVAL','sources':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in paths.values()},'candidates':rows,'limits':['Lower duct top creates larger unsealed gap, not an acoustic solution','Original leads omitted','Distances based on component model envelopes, not manufactured tolerances','DMM PA12 wall guideline alone does not qualify dimensional fit']};(O/'thick-acoustic-duct-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))

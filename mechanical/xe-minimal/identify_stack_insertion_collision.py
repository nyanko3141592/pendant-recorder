from pathlib import Path
import cadquery as cq,json
O=Path('/Users/takahashinaoki/Dev/pendant-recorder/mechanical/xe-minimal');case=cq.importers.importStep(str(O/'rounded-glue-reinforced-lower-study.step')).val();rows=[]
for name,dz,fn,offset in [('separator',2,'battery-separator-study.step',(0,0,0)),('pack',4,'dtp401525-xe-pack-max.step',(8.25,-13.5,-6.62))]:
 s=cq.importers.importStep(str(O/fn)).val().translate(offset).translate((0,0,dz));hit=s.intersect(case)
 for solid in hit.Solids():
  b=solid.BoundingBox();rows.append({'part':name,'offset_z':dz,'overlap_volume_mm3':solid.Volume(),'bbox_mm':[b.xmin,b.xmax,b.ymin,b.ymax,b.zmin,b.zmax]})
 cq.exporters.export(hit,str(O/f'{name}-insertion-collision.step'))
(O/'premated-stack-collision-locations.json').write_text(json.dumps(rows,indent=2));print(rows)

from pathlib import Path
import cadquery as cq,json,hashlib
w=Path(__file__).resolve().parent
load=lambda p:cq.importers.importStep(str(p)).val()
source=load(w/'current-pcba-envelope.step')
# Maximum finished board thickness with lower copper datum held fixed.
board=load(w/'board-envelope-max.step').translate((0,0,-.035))
blocks=[];records=[];delta=.9-.7992
for i,s in enumerate(source.Solids()):
 b=s.BoundingBox()
 if b.xlen>27 and b.ylen>27 and b.zlen<1:continue
 top=(b.zmin+b.zmax)/2>0
 zlo,zhi=(min(.4,b.zmin+delta),b.zmax+delta) if top else (b.zmin,max(.4,b.zmax))
 block=cq.Workplane('XY').box(b.xlen,b.ylen,zhi-zlo).val().translate(((b.xmin+b.xmax)/2,(b.ymin+b.ymax)/2,(zlo+zhi)/2))
 blocks.append(block);records.append({'source_solid':i,'side':'top' if top else 'bottom','bbox_mm':[b.xmin,b.xmax,b.ymin,b.ymax,zlo,zhi]})
print('Fusing',len(blocks),'component boxes',flush=True)
gauge=board.fuse(*blocks).clean()
case=w.parent/'prototype-v1/fixed-board-compact-v1';checks={n:gauge.intersect(load(case/f'case-compact-v1-{n}.step')).Volume() for n in ['lower','upper']}
for ext in ['step','stl']:cq.exporters.export(gauge,str(w/f'pcba-max-thickness-connected-gauge.{ext}'))
out={'status':'CONSERVATIVE_BOX_GAUGE_NOT_ELECTRICAL_MODEL','valid':gauge.isValid(),'solid_count':len(gauge.Solids()),'board_finished_thickness_mm':.9,'bottom_copper_datum_mm':-.035,'top_component_shift_mm':delta,'case_overlap_mm3':checks,'component_boxes':records,'source_sha256':hashlib.sha256((w/'current-pcba-envelope.step').read_bytes()).hexdigest(),'limitations':['Component bounding boxes deliberately fill body detail, cavities and undercuts','USB socket and J2 mating are solid; do not use this gauge to certify cable or connector insertion','Native components nominal; no assembly XY tolerance','CAD connectivity only; slicer bead connectivity and printability remain to verify','Cannot certify retention, battery swelling or impact protection'],'release_allowed':False}
(w/'connected-gauge-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='component_boxes'}),flush=True)

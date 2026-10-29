"""Removable separator geometry study; support and thermal design still pending."""
from pathlib import Path
import json,hashlib,cadquery as cq
O=Path(__file__).resolve().parent;source=O/'pcb-partial-with-body-envelopes.step';board=cq.importers.importStep(str(source)).val();I=json.loads((O/'board-inventory.json').read_text());th=next(p for p in I['parts'] if p['ref']=='TH1')
# Same x0.5 battery placement. Preserve0.2 clearance to existing lowest header.
plate_top=-1.92;thickness=.3;gap=.2;plate_bottom=plate_top-thickness;pack_top=plate_bottom-gap;pack_bottom=pack_top-4.2
plate=cq.Workplane('XY').box(15.9,27.4,thickness,centered=(True,True,False)).edges('|Z').fillet(.2).translate((8.25,-13.5,plate_bottom))
# Two support ears outside the battery envelope; matching case posts required.
for ey in [-7,-20]:
 ear=cq.Workplane('XY').box(1.6,2.4,thickness,centered=(True,True,False)).translate((16.6,ey,plate_bottom))
 plate=plate.union(ear)
# Thermal interface aperture; pad material, compression, lag and retention unqualified.
hole=cq.Workplane('XY').box(2.4,2.4,2).translate((th['position_mm'][0],-th['position_mm'][1],plate_top));plate=plate.cut(hole).val();assert plate.isValid()
pack=cq.importers.importStep(str(O/'dtp401525-xe-pack-max.step')).val().translate((8.25,-13.5,pack_bottom));a=cq.Assembly(name='separator_stack_study');a.add(board,name='provisional_board');a.add(plate,name='separator',color=cq.Color(.9,.8,.4));a.add(pack,name='battery_envelope',color=cq.Color(.4,.65,.85))
collision=sum(plate.intersect(t).Volume() for t in board.Solids());assert collision<1e-5;assert plate.intersect(pack).Volume()<1e-5
cq.exporters.export(plate,str(O/'battery-separator-study.step'));out=O/'separator-stack-study.step';a.export(str(out));s=cq.importers.importStep(str(out)).val();assert s.isValid();b=s.BoundingBox()
r={'status':'SEPARATOR_GEOMETRY_STUDY_NOT_LOAD_OR_THERMAL_QUALIFIED','pcb_sha256':I['pcb_sha256'],'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'separator_thickness_mm':thickness,'separator_z_range_mm':[plate_bottom,plate_top],'battery_z_range_mm':[pack_bottom,pack_top],'battery_to_separator_gap_mm':gap,'union_size_mm':[b.xlen,b.ylen,b.zlen],'separator_board_intersection_mm3':collision,'thermal_aperture_mm':[2.4,2.4],'remaining':['Material, edge finish, stiffness and flammability selection','Case-supported separator ledges; plate must not load connector','Mated housing and full cable path including removal access','Thermal pad material, compression, contact loss and response test','Battery retention and swelling tolerance','Case update to actual separator stack']};(O/'separator-study-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)

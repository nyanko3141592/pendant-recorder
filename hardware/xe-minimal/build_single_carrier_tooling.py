"""Standard-assembly tooling study based on public JLC guidance."""
from pathlib import Path
import json,hashlib,cadquery as cq
from shapely.geometry import box,Point
from itertools import combinations
P=Path(__file__).resolve().parent;src=P/'single-unit-carrier-study.step';base=cq.importers.importStep(str(src)).val();frame=box(0,0,70,70).difference(box(21,19.5,49,50.5))
fids=[{'id':f'FID{i+1}','center_mm':list(xy),'copper_diameter_mm':1,'mask_opening_diameter_mm':2,'clearance_envelope_diameter_mm':3,'sides':['F','B']} for i,xy in enumerate([(6,6),(64,6),(6,64)])]
holes=[{'id':f'TOOL{i+1}','center_mm':list(xy),'drill_mm':2,'plated':False,'copper_clearance_radial_mm':.5} for i,xy in enumerate([(12,6),(58,6),(12,64)])]
envelopes=[(v['id'],Point(v['center_mm']).buffer(1.5)) for v in fids+holes];assert all(frame.covers(e) for _,e in envelopes)
assert all(a.intersection(b).area<1e-9 for (_,a),(_,b) in combinations(envelopes,2))
for h in holes:
 x,y=h['center_mm'];base=base.cut(cq.Workplane('XY').center(x,y).circle(1).extrude(.8264).val())
base=base.clean();assert base.isValid() and len(base.Solids())==1
out=P/'single-carrier-tooled-study.step';cq.exporters.export(base,str(out))
r={'status':'STANDARD_TOOLING_LAYOUT_STUDY_NOT_RELEASE','checked_date':'2026-10-27','source_step_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'fiducials':fids,'tooling_holes':holes,'all_envelopes_in_frame_and_disjoint':True,'fiducial_envelope_to_outer_edge_min_mm':4.5,'sources':[{'url':'https://jlcpcb.com/help/article/specifications-for-adding-process-edges-and-positioning-holes','supports':'General SMT recommendation: 2mm holes, 1mm fiducials, 5mm process edges.'},{'url':'https://jlcpcb.com/help/article/how-to-add-edge-rails-fiducials-for-pcb-assembly-order','supports':'Standard requires rails/fiducials; 1mm copper/2mm mask; three or four markers. Rails ship attached by default; removal is requested at order and incurs extra processing fees.'},{'url':'https://jlcpcb.com/help/article/how-to-add-tooling-holes-for-pcb-assembly-order','supports':'1.152mm NPTH with .148mm mask expansion; opening paragraph scopes mandatory holes to Economic PCBA. Do not replace Standard study diameter based solely on this page.'}],'manufacturing_responsibility':'Seller must supply separated, finished assembled boards. Buyer only plugs battery and closes case. Depanelization must not be shifted to buyer.','limits':['Fiducial copper and mask geometry specified in JSON, not included in substrate STEP.','No PCB merge, CAM approval, tooling tolerance or fixture validation.','2mm tooling holes are provisional under general SMT recommendation; exact Standard acceptance not confirmed.','Depanelization fee is not yet in the five-unit total.','Original sharp-slot nominal carrier retained; finite router geometry remains a separate study.']}
(P/'single-carrier-tooling-review.json').write_text(json.dumps(r,indent=2)+'\n');print('3 holes; 3 fiducials per side; all envelopes inside carrier and disjoint')

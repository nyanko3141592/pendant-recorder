from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent;f=O/'pcb-partial-with-body-envelopes.step';s=cq.importers.importStep(str(f)).val();assert s.isValid();bbs=[q.BoundingBox() for q in s.Solids()];rows=[]
# Axis-aligned pack27mm along PCB Y; slide15.5mm width within24mm PCB width.
for n in range(35):
 x=n*.25;y0=-27;y1=0;hits=[(i,b) for i,b in enumerate(bbs) if b.xmax>x and b.xmin<x+15.5 and b.ymax>y0 and b.ymin<y1]
 top=max(b.zmax for i,b in hits);bottom=min(b.zmin for i,b in hits)
 for side,near,far in [('F',top+.2,top+.2+4.2),('B',bottom-.2,bottom-.2-4.2)]:
  rows.append({'side':side,'pack_x_min_mm':x,'pack_y_range_mm':[y0,y1],'pack_z_range_mm':sorted([near,far]),'assumed_clearance_mm':.2,'total_z_extent_without_case_mm':max(max(b.zmax for b in bbs),near,far)-min(min(b.zmin for b in bbs),near,far),'limiting_solid_indices':[i for i,b in hits if abs((b.zmax if side=='F' else b.zmin)-(top if side=='F' else bottom))<1e-5]})
rows.sort(key=lambda x:x['total_z_extent_without_case_mm']);r={'status':'BOUNDING_BOX_STACK_SCREEN_NOT_CASE_DESIGN','step_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'pack_max_mm':[15.5,27,4.2],'clearance_hypothesis_mm':.2,'best_candidates':rows[:12],'all_candidates':rows,'limitations':['Bounding-box overlap is conservative; not exact solid collision.','No lead path, connector mating, assembly access, swelling, insulation thickness, retention, acoustic seal or case walls.','0.2mm gap is a study assumption, not qualified clearance.','Package geometries include provisional envelopes; this cannot establish final product size.']};(O/'battery-stack-screen.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows[:4],indent=2))

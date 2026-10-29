from pathlib import Path
import cadquery as cq,json,math,hashlib
O=Path(__file__).resolve().parent
files={'separator':'film-axial-stop-relieved-separator-trial.step','lower':'film-axial-stop-relieved-lower-trial.step','old_lower':'diagonal-recessed-cap-lower-trial.step','upper':'tab-clearance-upper-trial.step'}
s={n:cq.importers.importStep(str(O/f)).val()for n,f in files.items()}
def bbox(q):
 b=q.BoundingBox();return [b.xmin,b.ymin,b.zmin,b.xmax,b.ymax,b.zmax]
t=O/'film-lap-lowered-tool-access-review.json';tool=json.loads(t.read_text());checks=[]
for i,j in tool['selected_rows'].items():
 row=tool['rows'][j];theta=math.radians(row['tilt_deg']);phi=math.radians(row['azimuth_from_plus_y_deg']);away=cq.Vector(math.sin(theta)*math.sin(phi),math.sin(theta)*math.cos(phi),-math.cos(theta));tip=cq.Vector(*row['contact_mm']);q=cq.Solid.makeCone(.15,.65,4,tip,away).fuse(cq.Solid.makeCylinder(.65,4,tip+away.multiply(4),away))
 checks.append({'wire_index':int(i),'overlap_mm3':q.intersect(s['separator']).Volume(),'gap_mm':q.distance(s['separator'])})
old_bbox=bbox(cq.Compound.makeCompound([s['old_lower'],s['upper']]));new_bbox=bbox(cq.Compound.makeCompound([s['lower'],s['upper'],s['separator']]))
r={'status':'LOCAL_CASE_AND_TOOL_GEOMETRY_RECHECK_NOT_ASSEMBLY_QUALIFICATION','sources_sha256':{n:hashlib.sha256((O/f).read_bytes()).hexdigest()for n,f in files.items()},'tool_review_sha256':hashlib.sha256(t.read_bytes()).hexdigest(),'original_shell_bbox_mm':old_bbox,'new_shell_and_separator_bbox_mm':new_bbox,'bbox_unchanged':all(abs(a-b)<1e-7 for a,b in zip(old_bbox,new_bbox)),'selected_tool_vs_new_separator':checks,'limits':['Previous board and wire tool clearances are unchanged; only separator geometry rechecked here.','Static and bounding-box checks do not prove assembly sequence, printability or retention force.','Battery original lead/plug and finished sensor joint dimensions remain unqualified.']}
(O/'film-axial-stop-integration-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

"""Swept disk accessibility of nominal slot void; tool diameters are hypotheses."""
from pathlib import Path
import json,hashlib
from shapely.geometry import box,LineString,mapping
from shapely.ops import unary_union
P=Path(__file__).resolve().parent;src=P/'single-unit-carrier-study.json';r=json.loads(src.read_text());ox,oy=r['unit_origin_mm'];outer=box(0,0,70,70);window=box(ox-2,oy-2,ox+26,oy+29);unit=box(ox,oy,ox+24,oy+27);tabs=unary_union([box(*t['bounds_mm']) for t in r['tabs']]);void=window.difference(unary_union([unit,tabs]));rows=[]
for diameter in [1.,1.6,1.9]:
 radius=diameter/2
 # Every disk center in the erosion may be visited. This is accessible area,
 # not an ordered CNC path, feed plan or proof of access from the panel edge.
 centers=void.buffer(-radius,quad_segs=64);raw_removed=centers.buffer(radius,quad_segs=64);raw_outside_area=raw_removed.difference(void).area;removed=raw_removed.intersection(void);remaining=outer.difference(removed)
 assert removed.intersection(unit).area<1e-8
 samples=[]
 for depth in [.001,.1,.2,.3]:
  line=LineString([(ox,oy+27+depth),(ox+24,oy+27+depth)])
  segs=remaining.intersection(line);parts=list(segs.geoms) if hasattr(segs,'geoms') else [segs]
  samples.append({'distance_outside_bottom_mm':depth,'remaining_x_intervals_local_mm':[[round(v.bounds[0]-ox,6),round(v.bounds[2]-ox,6)] for v in parts if not v.is_empty]})
 rows.append({'assumed_tool_diameter_mm':diameter,'raw_buffer_outside_void_area_mm2':raw_outside_area,'unremoved_nominal_void_area_mm2':void.difference(removed).area,'unit_copper_board_area_cut_mm2':removed.intersection(unit).area,'bottom_samples':samples,'remaining_outline':mapping(remaining)})
out={'status':'TOOL_RADIUS_STUDY_NOT_CAM_OR_CASE_APPROVAL','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'rows':rows,'finding':'Rounded slot ends widen the connected tab near its root. Prior rectangular 5mm remnant case checks do not cover this geometry.','limits':['Tool diameters are assumptions, not confirmed supplier tools.','2mm exact-width erosion degenerates to lines and is not modeled with polygon erosion.','Polygon buffers approximate circles; raw outside-void area recorded and clipped to nominal void. No runout or positional tolerance.','No final depanelization cut modeled. Extra material could be removed by a separate qualified cut.']}
(P/'single-carrier-router-radius-review.json').write_text(json.dumps(out,indent=2)+'\n')
for row in rows:print(row['assumed_tool_diameter_mm'],row['bottom_samples'])

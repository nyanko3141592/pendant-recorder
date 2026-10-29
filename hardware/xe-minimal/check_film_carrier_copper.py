"""Screen assumed inboard tab machining strips; not fabrication approval."""
from pathlib import Path
import hashlib,json
from shapely.geometry import box,Polygon,LineString
from shapely import make_valid
P=Path(__file__).resolve().parent;g=json.loads((P/'film-carrier-copper-geometry.json').read_text());c=json.loads((P/'film-carrier-tab-screen.json').read_text())
assert g['source_sha256']==c['source_sha256']==hashlib.sha256(Path(g['source']).read_bytes()).hexdigest()
objects=[(o,box(*o['bounds'])) for o in g['objects']]
zones=[(z,Polygon(z['outer'],z['holes'])) for z in g['zones']]
invalid_count=sum(not p.is_valid for _,p in zones)
zones=[(z,make_valid(p)) for z,p in zones]
assert all(p.is_valid for _,p in zones)
results=[]
for edge,center,width in [('bottom',3.8,5),('bottom',20.2,5),('left',7.735,3)]:
 allowed=next(r for r in c['results'] if r['edge']==edge and r['tab_width_mm']==width)
 assert any(a<=center<=b for a,b in allowed['center_intervals_mm'])
 edge_line=LineString([(center-width/2,27),(center+width/2,27)]) if edge=='bottom' else LineString([(0,center-width/2),(0,center+width/2)])
 for depth in [.25,.5,1.]:
  strip=box(center-width/2,27-depth,center+width/2,27) if edge=='bottom' else box(0,center-width/2,depth,center+width/2)
  hits=[{k:v for k,v in o.items()} for o,p in objects if strip.intersection(p).area>1e-10]
  zh=[{'net':z['net'],'layer':z['layer'],'overlap_mm2':round(strip.intersection(p).area,6)} for z,p in zones if strip.intersection(p).area>1e-10]
  results.append({'edge':edge,'center_mm':center,'width_mm':width,'assumed_inboard_depth_mm':depth,'object_box_hits':hits,'filled_copper_hits':zh,'min_object_box_distance_from_edge_mm':round(min(edge_line.distance(p) for _,p in objects),6),'min_filled_copper_distance_from_edge_mm':round(min(edge_line.distance(p) for _,p in zones),6)})
r={'status':'MACHINING_ENVELOPE_SCREEN_NOT_RELEASE','source_sha256':g['source_sha256'],'zone_polygons_repaired_for_linked_or_touching_contours':invalid_count,'results':results,'limits':['Tool depths are hypotheses, not manufacturer-approved dimensions.','Track and pad bounding boxes are conservative, not exact copper outlines.','Filled copper is from saved board; no fill was changed. Invalid exported polygon contours normalized with Shapely make_valid; machining approval needs native CAD/CAM verification.','No panel created; residual tabs, cutter access, stress and support strength remain unqualified.']}
(P/'film-carrier-copper-screen.json').write_text(json.dumps(r,indent=2)+'\n')
for x in results:print(x['edge'],x['center_mm'],x['assumed_inboard_depth_mm'],'object hits',len(x['object_box_hits']),'zone hits',[(z['layer'],z['net']) for z in x['filled_copper_hits']])

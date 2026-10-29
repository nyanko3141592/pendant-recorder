from pathlib import Path
import json,hashlib
from shapely.geometry import Polygon
from shapely import make_valid
from shapely.ops import unary_union
P=Path(__file__).resolve().parent/'current-single-carrier-trial';src=P/'zone-comparison-geometry.json';r=json.loads(src.read_text());a={z['uuid']:z for z in r['source']['zones']};b={z['uuid']:z for z in r['panel']['zones']};assert a.keys()==b.keys()
def geom(items):
 raw=[Polygon(x['outer'],x['holes']) for x in items];invalid=sum(not p.is_valid for p in raw);return unary_union([make_valid(p) for p in raw]),invalid
rows=[]
for uid,z in a.items():
 other=b[uid];assert z['net']==other['net'];assert z['fills'].keys()==other['fills'].keys()
 for name,x,y in [('outline',z['outline'],other['outline'])]+[(l,z['fills'][l],other['fills'][l]) for l in z['fills']]:
  ga,ia=geom(x);gb,ib=geom(y);diff=ga.symmetric_difference(gb)
  rows.append({'zone_uuid':uid,'net':z['net'],'layer_or_outline':name,'equal_geometry':ga.equals(gb),'difference_area_mm2':diff.area/1e12,'difference_length_mm':diff.length/1e6,'boundary_hausdorff_distance_mm':ga.boundary.hausdorff_distance(gb.boundary)/1e6,'difference_bounds_mm':None if diff.is_empty else [v/1e6 for v in diff.bounds],'source_invalid_contours_normalized':ia,'panel_invalid_contours_normalized':ib,'source_area_mm2':ga.area/1e12,'panel_area_mm2':gb.area/1e12})
out={'status':'ZONE_INTEGER_COORDINATE_GEOMETRY_COMPARISON','input_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'source_pcb_sha256':r['source']['sha256'],'panel_pcb_sha256':r['panel']['sha256'],'rows':rows,'all_equal':all(x['equal_geometry'] for x in rows),'limits':['KiCad linked/touching contours normalized with make_valid, counts reported.','Coordinates compared in integer nanometers with inverse panel translation; no tolerance-based acceptance.','This comparison does not verify electrical performance or manufacturing tolerances.']};(P/'zone-geometry-comparison.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(rows,indent=2));assert out['all_equal']

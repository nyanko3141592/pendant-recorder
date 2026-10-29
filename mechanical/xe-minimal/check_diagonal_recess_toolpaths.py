"""Compare nominal toolpaths before/after the 0.2 mm cap recess."""
from pathlib import Path
import json,hashlib,math,zipfile,xml.etree.ElementTree as ET
from shapely.geometry import Polygon,LineString
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from gcode_extrusion_paths import read_paths
O=Path(__file__).resolve().parent; D=O/'home-case-slice-review'
names=['diagonal-tapered-tray-lower','diagonal-recessed-cap-lower']; records={};paths={};sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
ns={'c':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
for name in names:
 d=D/name;r=json.loads((d/'review.json').read_text());assert r['source_sha256']==sha(O/r['source'])
 with zipfile.ZipFile(d/(name+'.3mf')) as z:
  root=ET.fromstring(z.read('3D/3dmodel.model'));build=[float(x)for x in root.find('c:build/c:item',ns).attrib['transform'].split()];component=[float(x)for x in root.find('c:resources/c:object/c:components/c:component',ns).attrib['transform'].split()]
  verts=ET.fromstring(z.read('3D/Objects/object_1.model')).findall('.//c:vertex',ns)
  # Verify the stored mesh + component restores the translated input STL bounds.
  for axis,k in enumerate('xyz'):
   assert abs(min(float(v.attrib[k])for v in verts)+component[9+axis])<1e-5
  assert all(abs(a-b)<1e-5 for a,b in zip(build,[-1,0,0,0,-1,0,0,0,1,103.1,104.8,0]))
  assert z.read('Metadata/plate_1.gcode')==(d/'plate_1.gcode').read_bytes()
 assert all(abs(a-b)<1e-6 for a,b in zip(r['translation_mm'],[1.1,28.3,7.72]))
 paths[name]=read_paths(d/'plate_1.gcode');records[name]={'source_sha256':r['source_sha256'],'gcode_sha256':sha(d/'plate_1.gcode'),'3mf_sha256':sha(d/(name+'.3mf'))}
def bed(x,y):
 a=math.radians(-28);cx=7.6+x*math.cos(a)-y*math.sin(a);cy=-25.5+x*math.sin(a)+y*math.cos(a)
 return (102-cx,76.5-cy)
roi=Polygon([bed(x,y)for x,y in [(-1.95,22.7),(1.95,22.7),(1.95,24.1),(-1.95,24.1)]])
heights=sorted(h for h in paths[names[1]] if 6.27<h<6.70);fig,axes=plt.subplots(2,len(heights),figsize=(3*len(heights),6),squeeze=False);rows=[]
for c,h in enumerate(heights):
 row={'layer_top_mm':h,'nominal_recess_floor_mm':6.4,'nominal_original_rail_top_mm':6.6}
 for i,name in enumerate(names):
  beads=unary_union([LineString(pts).buffer(w/2)for pts,w,f in paths[name].get(h,[]) ]).intersection(roi)
  row[name+'_bead_area_inside_cut_xy_mm2']=beads.area
  ax=axes[i,c];ax.plot(*roi.exterior.xy,color='black',linewidth=.6)
  for g in ([beads]if beads.geom_type=='Polygon'else getattr(beads,'geoms',[])):
   if g.geom_type=='Polygon':ax.fill(*g.exterior.xy,color=['#8b929b','#248c80'][i],alpha=.8)
  ax.set_aspect('equal');ax.set_title(f'{"Before" if i==0 else "Recess"} Z={h:.2f}')
 rows.append(row)
fig.suptitle('Commanded bead footprints inside recess cut XY; not measured print');fig.tight_layout();out=D/names[1];fig.savefig(out/'recess-toolpath-review.png',dpi=160)
r={'status':'RECESS_TOOLPATH_COMPARISON_NOT_PHYSICAL_QUALIFICATION','sources':records,'cad_to_bed':'(102-x,76.5-y,z+7.72), verified from both 3mf meshes/component/build transforms and export translation','rows':rows,'limits':['Commanded bead width is a geometric approximation; actual swelling and flow are unmeasured.','Cut XY includes pre-existing channels; areas are not the full rail surface.','Layer tops straddle CAD boundaries; this is not a dimensional tolerance acceptance.','No printer operation.']}
(out/'recess-toolpath-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))

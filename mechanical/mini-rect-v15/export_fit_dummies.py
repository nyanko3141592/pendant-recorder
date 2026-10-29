"""Separate rigid fit dummies from current handoff; never manufacturing geometry."""
from pathlib import Path
import hashlib,json,zipfile,struct,collections
import cadquery as cq
from OCP.Bnd import Bnd_Box
from OCP.BRepBndLib import BRepBndLib
P=Path(__file__).resolve().parent;ROOT=P.parents[1]
source=ROOT/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json'
h=json.loads(source.read_text());board_path=Path(h['source_board'])
assert hashlib.sha256(board_path.read_bytes()).hexdigest()==h['source_sha256']
O=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-removable-ledge/fit-dummies');O.mkdir(exist_ok=True)
def box(x,y,z,w,d,t):return cq.Workplane('XY').box(w,d,t).val().translate((x+w/2,y+d/2,z+t/2))
def bounds(s):
 b=Bnd_Box();BRepBndLib.AddOptimal_s(s.wrapped,b,False,False);return list(b.Get())
board=box(1.8,1.3,8.6,*h['board_mm'])
for hole in h['round_npth_holes']:
 board=board.cut(cq.Solid.makeCylinder(hole['diameter_mm']/2,1.13,cq.Vector(1.8+hole['x_mm'],1.3+hole['y_mm'],8.5)))
parts=[]
for p in h['parts']:
 z=8.6+h['board_mm'][2] if p['side']=='F' else 8.6-p['height_mm']
 parts.append(box(1.8+p['x_mm']-p['w_mm']/2,1.3+p['y_mm']-p['d_mm']/2,z,p['w_mm'],p['d_mm'],p['height_mm']))
populated=board.fuse(*parts).clean()
pack=box(1.3,1.3,1.5,15.5,27,4.2)
case_files=[O.parent/(name+'-NOT-MANUFACTURING.'+ext) for name in ['body','lid','key'] for ext in ['step','stl']]
report=dict(status='RIGID_FIT_DUMMIES_NOT_MANUFACTURING',units='mm',source_sha256={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [source,board_path,Path(__file__),*case_files]},board_thickness_mm=.93,component_envelopes=len(parts),items=[],limitations=['Component shapes include courtyard rectangles; these are conservative envelopes rather than actual bodies.','Fused dummy includes modeled test/programming envelopes and may obscure PCB bores; unsuitable for acoustic or connector insertion tests.','Pack dummy excludes harness, plug, pouch compliance/swelling and thermal behavior. Never infer complete battery fit from rigid dummy fit.','PCB dummy uses0.93mm thickness assumption, not nominal0.8mm.','STL has no intrinsic unit; import as millimetres at100 percent scale. STEP preserves assembly coordinates; each STL is translated to minimumXYZ zero.','Print orientation, supports, dimensional compensation and process/material remain to be selected. Geometry validity does not establish printability.'],release_allowed=False)
for name,shape in [('bare-board-envelope',board),('populated-board-envelope',populated),('XE-max-pack-envelope',pack)]:
 assert shape.isValid(),name
 assert len(shape.Solids())==1,(name,len(shape.Solids()))
 b=bounds(shape);translation=[-x for x in b[:3]]
 step=O/(name+'-NOT-MANUFACTURING.step');stl=O/(name+'-NOT-MANUFACTURING.stl')
 cq.exporters.export(shape,str(step))
 cq.exporters.export(shape.translate(tuple(translation)),str(stl),tolerance=.01,angularTolerance=.1)
 data=stl.read_bytes();triangles=struct.unpack_from('<I',data,80)[0]
 assert len(data)==84+50*triangles,'Unexpected STL encoding'
 edges=collections.Counter();direction=collections.Counter();vertices=[]
 for i in range(triangles):
  record=struct.unpack_from('<12fH',data,84+50*i)
  points=[tuple(round(v,5) for v in record[j:j+3]) for j in [3,6,9]]
  assert len(set(points))==3,'Degenerate triangle'
  vertices.extend(points)
  for va,vb in zip(points,points[1:]+points[:1]):
   edge=tuple(sorted([va,vb]));edges[edge]+=1;direction[edge]+=1 if va<vb else -1
 assert all(n==2 for n in edges.values()),'STL boundary or non-manifold edge'
 assert all(n==0 for n in direction.values()),'STL inconsistent winding'
 assert all(abs(min(v[j] for v in vertices))<1e-4 for j in range(3))
 imported=cq.importers.importStep(str(step)).val()
 assert imported.isValid() and len(imported.Solids())==1
 assert max(abs(a-b) for a,b in zip(bounds(imported),bounds(shape)))<1e-6
 report['items'].append(dict(name=name,assembly_bounds_mm=b,size_mm=[b[i+3]-b[i] for i in range(3)],stl_translation_from_assembly_mm=translation,valid=True,solids=1,stl_triangles=triangles,stl_closed_oriented_edges=True,stl_edge_quantization_mm=.00001,volume_mm3=shape.Volume(),files={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [step,stl]}))
(O/'review.json').write_text(json.dumps(report,indent=2)+'\n')
(P/'fit-dummies-review.json').write_text(json.dumps(report,indent=2)+'\n')
zip_path=O.parent/'RIGID-FIT-REVIEW-NOT-FOR-ORDER.zip'
with zipfile.ZipFile(zip_path,'w',compression=zipfile.ZIP_DEFLATED) as z:
 for item in report['items']:
  for name in item['files']:z.write(O/name,'fit-dummies/'+name)
 z.write(O/'review.json','fit-dummies/review.json')
 for name in ['body','lid','key']:
  for ext in ['step','stl']:
   p=O.parent/(name+'-NOT-MANUFACTURING.'+ext);z.write(p,p.name)
with zipfile.ZipFile(zip_path) as z:assert z.testzip() is None
print(json.dumps({'items':[{'name':x['name'],'size_mm':x['size_mm']} for x in report['items']],'archive':str(zip_path)},indent=2))

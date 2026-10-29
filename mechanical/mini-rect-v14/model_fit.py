"""V14 four-part geometry study from actual placement. UNSLICED, not released."""
from pathlib import Path
import json,hashlib,struct,zipfile,xml.etree.ElementTree as E
import cadquery as cq
P=Path(__file__).resolve().parent;R=P.parents[1];src=R/'hardware/mini-rect-v14/case-fit-placement-candidate.mechanical-handoff.json';d=json.loads(src.read_text())
O=Path('/Users/takahashinaoki/Downloads/Pendant-v14-domestic-pack-fit-r1');O.mkdir(exist_ok=True)
W,L,H=35,45.5,14.8;wall=1.2;zpcb=8.6;offset=1.7

def box(x,y,z,w,l,h):return cq.Workplane('XY').box(w,l,h).val().translate((x+w/2,y+l/2,z+h/2))
def rounded(w,l,h,r,z=0):return cq.Workplane('XY').box(w,l,h).edges('|Z').fillet(r).val().translate((w/2,l/2,z+h/2))
outer=rounded(W,L,H,2.5);cavity=rounded(W-2*wall,L-2*wall,H,1.3,wall).translate((wall,wall,0));body=outer.cut(cavity).intersect(box(0,0,0,W,L,13.6))
lid=outer.intersect(box(0,0,13.6,W,L,1.2))
# USB opening follows moved connector; acoustic opening follows existing mic bore.
body=body.cut(box(6.2,L-2,9,12.6,3,4.4))
# Acoustic bore is through lid from the PCB microphone port; gasket/channel not yet engineered.
mic=cq.Solid.makeCylinder(.6,2,cq.Vector(19.13+offset,16.2+offset,13.3));lid=lid.cut(mic)
pcb=box(offset,offset,zpcb,30,40,.93)
parts=[]
for a in d['parts']:
 h=a['height_mm'];z=zpcb+.93 if a['side']=='F' else zpcb-h
 s=box(a['x_mm']+offset-a['w_mm']/2,a['y_mm']+offset-a['d_mm']/2,z,a['w_mm'],a['d_mm'],h);parts.append((a['ref'],s))
battery=box(2,2,1.5,20.5,37,5.2)
assembly=cq.Compound.makeCompound([pcb]+[s for _,s in parts])
checks=[]
for name,s in parts+[('PCB',pcb),('battery',battery)]:
 for target,t in [('body',body),('lid',lid),('battery',battery)]:
  if name=='battery' and target=='battery':continue
  c=s.intersect(t)
  if c.Volume()>1e-5:checks.append({'part':name,'target':target,'overlap_mm3':c.Volume()})
shapes=[('01_case_body',body),('02_lid',lid.translate((0,0,-13.6))),('03_pcb_component_envelopes',assembly),('04_DTP502035_PHR_max_pack',battery)]
ns='http://schemas.microsoft.com/3dmanufacturing/core/2015/02';E.register_namespace('',ns)
def tag(n):return '{'+ns+'}'+n
objects=[]
for name,s in shapes:
 cq.exporters.export(s,str(O/(name+'.step')));cq.exporters.export(s,str(O/(name+'.stl')),tolerance=.02,angularTolerance=.1)
 data=(O/(name+'.stl')).read_bytes();n=struct.unpack_from('<I',data,80)[0];assert len(data)==84+50*n
 vertices={};tris=[]
 for i in range(n):
  vals=struct.unpack_from('<12f',data,84+i*50)[3:];tri=[]
  for j in [0,3,6]:tri.append(vertices.setdefault(tuple(vals[j:j+3]),len(vertices)))
  tris.append(tri)
 obj=E.Element(tag('object'),id='1',type='model',name=name);mesh=E.SubElement(obj,tag('mesh'));vv=E.SubElement(mesh,tag('vertices'));tt=E.SubElement(mesh,tag('triangles'))
 for x,y,z in vertices:E.SubElement(vv,tag('vertex'),x=str(x),y=str(y),z=str(z))
 for a,b,c in tris:E.SubElement(tt,tag('triangle'),v1=str(a),v2=str(b),v3=str(c))
 objects.append(obj)
 def write3mf(path,objs):
  model=E.Element(tag('model'),unit='millimeter');res=E.SubElement(model,tag('resources'));build=E.SubElement(model,tag('build'))
  for i,obj in enumerate(objs,1):obj.set('id',str(i));res.append(obj);E.SubElement(build,tag('item'),objectid=str(i),transform=f'1 0 0 0 1 0 0 0 1 {(i-1)*45} 0 0')
  with zipfile.ZipFile(path,'w',zipfile.ZIP_DEFLATED) as z:
   z.writestr('[Content_Types].xml','<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="model" ContentType="application/vnd.ms-package.3dmanufacturing-3dmodel+xml"/></Types>')
   z.writestr('_rels/.rels','<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Target="/3D/3dmodel.model" Id="rel0" Type="http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel"/></Relationships>');z.writestr('3D/3dmodel.model',E.tostring(model,encoding='utf-8',xml_declaration=True))
 write3mf(O/(name+'.3mf'),[obj])
write3mf(O/'four-parts-UNSLICED.3mf',objects)
cq.exporters.export(cq.Compound.makeCompound([body,lid,assembly,battery]),str(O/'ASSEMBLY-FIT-ONLY.step'))
r=dict(status='GEOMETRY_STUDY_NOT_PRINT_OR_MANUFACTURING_RELEASE',source_handoff_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),source_board_sha256=d['source_sha256'],case_mm=[W,L,H],pcb_bottom_z_mm=zpcb,battery_max_mm=[20.5,37,5.2],intersections=checks,case_valid=body.isValid(),lid_valid=lid.isValid(),case_lid_overlap_mm3=body.intersect(lid).Volume(),limitations=['Actual moved placement is not electrically routed','Body/lid have no qualified closure or PCB supports yet','No100mm harness or matedPH housing solid; room must be checked next','Sensor bottom8.0mm versus pouch top6.7mm leaves1.3mm thermal-interface gap; pad not selected','Lid bore is reserved location only; full bottom-port mic acoustic seal/channel missing','Rectangular part envelopes include courtyards and are not detailed solids','No swelling tolerance, manufacturing tolerance or strength validation','No slicing or physical printing performed;3MF contains mesh only'])
(O/'geometry-review.json').write_text(json.dumps(r,indent=2)+'\n');(P/'geometry-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(r,indent=2))

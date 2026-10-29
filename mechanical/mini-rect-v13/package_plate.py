"""Combine verified component geometry; no machine G-code or print command."""
from pathlib import Path
import sys
import xml.etree.ElementTree as E,zipfile,json,hashlib
P=Path(sys.argv[1]) if len(sys.argv)>1 else Path('/Users/takahashinaoki/Downloads/Pendant-mini-rect-v13-fit-study-r3')
revision=P.name.rsplit('-',1)[-1]
assert revision in ('r3','r4','r5','r8')
ns='http://schemas.microsoft.com/3dmanufacturing/core/2015/02';E.register_namespace('',ns)
def tag(s):return '{'+ns+'}'+s
root=E.Element(tag('model'),unit='millimeter');res=E.SubElement(root,tag('resources'));build=E.SubElement(root,tag('build'))
manifest=[]
for idx,(name,x,y) in enumerate([('01_hollow_case_body',30,30),('02_case_lid_open_side_up',65,30),('03_pcb_components_FIT_ONLY',30,70),('04_battery_pack_15x17x6',65,70)],1):
 path=P/'print'/(name+'.3mf')
 with zipfile.ZipFile(path) as z:
  m=E.fromstring(z.read('3D/3dmodel.model'))
  obj=m.find(tag('resources')).find(tag('object'));obj.set('id',str(idx));obj.attrib.pop('pid',None);obj.attrib.pop('pindex',None)
  res.append(obj);E.SubElement(build,tag('item'),objectid=str(idx),transform=f'1 0 0 0 1 0 0 0 1 {x} {y} 0')
  if idx==1:content=z.read('[Content_Types].xml');rels=z.read('_rels/.rels')
 manifest.append(dict(file=path.name,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),offset_mm=[x,y,0]))
out=P/f'V13-{revision}-four-parts-UNSLICED.3mf'
with zipfile.ZipFile(out,'w',zipfile.ZIP_DEFLATED) as z:
 z.writestr('[Content_Types].xml',content);z.writestr('_rels/.rels',rels);z.writestr('3D/3dmodel.model',E.tostring(root,encoding='utf-8',xml_declaration=True))
with zipfile.ZipFile(out) as z:assert z.testzip() is None
(P/'plate-manifest.json').write_text(json.dumps(dict(status='GEOMETRY_ONLY_UNSLICED',parts=manifest,sha256=hashlib.sha256(out.read_bytes()).hexdigest(),reference_printer='Existing saved project: A1 mini 0.4mm, PLA, 0.2mm layers, classic walls; not certified for this plate',limitations=['No G-code or printer profile embedded','0.3mm acoustic wall must be checked in slicer','PCB dummy underside needs support strategy','Tape closure, unqualified harness/gasket/battery tolerances']),indent=2)+'\n')
print(out)

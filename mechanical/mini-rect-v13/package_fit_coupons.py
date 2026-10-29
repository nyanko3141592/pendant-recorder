"""Combine verified component geometry; no machine G-code or print command."""
from pathlib import Path
import xml.etree.ElementTree as E,zipfile,json,hashlib
P=Path('/Users/takahashinaoki/Downloads/Pendant-v13-lid-fit-coupons')
ns='http://schemas.microsoft.com/3dmanufacturing/core/2015/02';E.register_namespace('',ns)
def tag(s):return '{'+ns+'}'+s
root=E.Element(tag('model'),unit='millimeter');res=E.SubElement(root,tag('resources'));build=E.SubElement(root,tag('build'))
manifest=[]
for idx,(name,x,y) in enumerate([(f'{i+1}_{sex}_gap_{gap:.2f}',30+i*15,30+j*14) for i,gap in enumerate([.2,.25,.3]) for j,sex in enumerate(['male','female'])],1):
 path=P/'print'/(name+'.3mf')
 with zipfile.ZipFile(path) as z:
  m=E.fromstring(z.read('3D/3dmodel.model'))
  obj=m.find(tag('resources')).find(tag('object'));obj.set('id',str(idx));obj.attrib.pop('pid',None);obj.attrib.pop('pindex',None)
  res.append(obj);E.SubElement(build,tag('item'),objectid=str(idx),transform=f'1 0 0 0 1 0 0 0 1 {x} {y} 0')
  if idx==1:content=z.read('[Content_Types].xml');rels=z.read('_rels/.rels')
 manifest.append(dict(file=path.name,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),offset_mm=[x,y,0]))
out=P/'V13-six-fit-coupons-UNSLICED.3mf'
with zipfile.ZipFile(out,'w',zipfile.ZIP_DEFLATED) as z:
 z.writestr('[Content_Types].xml',content);z.writestr('_rels/.rels',rels);z.writestr('3D/3dmodel.model',E.tostring(root,encoding='utf-8',xml_declaration=True))
with zipfile.ZipFile(out) as z:assert z.testzip() is None
(P/'plate-manifest.json').write_text(json.dumps(dict(status='GEOMETRY_ONLY_UNSLICED',parts=manifest,sha256=hashlib.sha256(out.read_bytes()).hexdigest(),reference_printer='Existing saved project: A1 mini 0.4mm, PLA, 0.2mm layers, classic walls; not certified for this plate',limitations=['No G-code or printer profile embedded','Print matching-number pairs; columns are0.20/0.25/0.30mm per-side clearances','Sliding fit only; not a retained latch','Final case orientation and strength still require testing']),indent=2)+'\n')
print(out)

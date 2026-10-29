from pathlib import Path
import json,zipfile,xml.etree.ElementTree as E
P=Path('/Users/takahashinaoki/Downloads/Pendant-mini-usb-v9');src=P/'print'
ns='http://schemas.microsoft.com/3dmanufacturing/core/2015/02';E.register_namespace('',ns)
def tag(n):return '{'+ns+'}'+n
root=E.Element(tag('model'),{'unit':'millimeter'});E.SubElement(root,tag('metadata'),{'name':'Title'}).text='Pendant mini USB v9 - case lid PCB battery'
r=E.SubElement(root,tag('resources'));b=E.SubElement(root,tag('build'))
for i,(name,x,y) in enumerate([('01_hollow_case_body',40,45),('02_case_lid_open_side_up',83,45),('03_pcb_components_UNROUTED',40,97),('04_battery_pack_15x17x6',90,97)],1):
 with zipfile.ZipFile(src/(name+'.3mf')) as z:
  m=E.fromstring(z.read('3D/3dmodel.model')).find('.//'+tag('mesh'));ct=z.read('[Content_Types].xml');rel=z.read('_rels/.rels')
 for v in m.find(tag('vertices')):
  v.set('x',str(float(v.get('x'))+x));v.set('y',str(float(v.get('y'))+y))
 obj=E.SubElement(r,tag('object'),{'id':str(i),'type':'model','name':name});obj.append(m);E.SubElement(b,tag('item'),{'objectid':str(i)})
with zipfile.ZipFile(P/'layout.3mf','w',zipfile.ZIP_DEFLATED) as z:
 z.writestr('[Content_Types].xml',ct);z.writestr('_rels/.rels',rel);z.writestr('3D/3dmodel.model',E.tostring(root,encoding='utf-8',xml_declaration=True))
base=Path('/Applications/BambuStudio.app/Contents/Resources/profiles/BBL')
def resolve(kind,name):
 d=json.loads((base/kind/(name+'.json')).read_text());parent=d.get('inherits');a=resolve(kind,parent) if parent else {};
 for inc in d.get('include',[]):
  v=resolve(kind,inc);a.update({k:w for k,w in v.items() if k not in ['name','instantiation','type','from','setting_id']})
 a.update(d);a.pop('inherits',None);a.pop('include',None);return a
for kind,name,out in [('machine','Bambu Lab A1 mini 0.4 nozzle','machine'),('process','0.20mm Standard @BBL A1M','process'),('filament','Bambu PLA Basic @BBL A1M','filament')]:
 d=resolve(kind,name)
 if kind=='process':d.update(wall_loops='3',sparse_infill_density='15%',enable_support='1',support_type='normal(auto)',support_style='snug',support_on_build_plate_only='0',brim_type='outer_only',brim_width='3',curr_bed_type='Textured PEI Plate')
 (P/(out+'.json')).write_text(json.dumps(d,indent=2))

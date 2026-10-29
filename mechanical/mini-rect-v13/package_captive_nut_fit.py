"""Local unsliced fit models. No printer command, manufacturing release or upload."""
from pathlib import Path
import cadquery as cq,json,hashlib,struct,zipfile,shutil,xml.etree.ElementTree as E
R=Path(__file__).resolve().parent
src=R/'captive-nut-thicker-trial/ASSEMBLY-NOT-RELEASED.step';sha=hashlib.sha256(src.read_bytes()).hexdigest()
assert sha=='88c116a1e09d129e9d96ba1485b13d64efdc849bc5d0dbc51b20c3bb57946360'
P=Path('/Users/takahashinaoki/Downloads/Pendant-v13-captive-nut-fit-r9');P.mkdir(exist_ok=True);dest=P/'print';dest.mkdir(exist_ok=True)
old=Path('/Users/takahashinaoki/Downloads/Pendant-mini-rect-v13-six-layer-fit-study-r8/print')
s=cq.importers.importStep(str(src)).val().Solids();assert len(s)==86
names=['01_hollow_case_body','02_case_lid_open_side_up','03_pcb_components_FIT_ONLY','04_battery_pack_15x17x6']
for name,shape in zip(names[:2],[s[0],s[1].rotate((0,0,0),(1,0,0),180).translate((0,25,14.81))]):
 cq.exporters.export(shape,str(dest/(name+'.stl')),tolerance=.01,angularTolerance=.1)
 cq.exporters.export(shape,str(dest/(name+'.step')))
for name in names[2:]:
 for ext in ['stl','step','3mf']:shutil.copy2(old/(name+'.'+ext),dest/(name+'.'+ext))
ns='http://schemas.microsoft.com/3dmanufacturing/core/2015/02';E.register_namespace('',ns)
def tag(n):return '{'+ns+'}'+n
with zipfile.ZipFile(old/(names[2]+'.3mf')) as z:ct=z.read('[Content_Types].xml');rel=z.read('_rels/.rels')
def save3mf(path,objects):
 model=E.Element(tag('model'),unit='millimeter');resources=E.SubElement(model,tag('resources'));build=E.SubElement(model,tag('build'))
 for i,(obj,x,y) in enumerate(objects,1):
  obj.set('id',str(i));obj.attrib.pop('pid',None);obj.attrib.pop('pindex',None);resources.append(obj)
  E.SubElement(build,tag('item'),objectid=str(i),transform=f'1 0 0 0 1 0 0 0 1 {x} {y} 0')
 with zipfile.ZipFile(path,'w',zipfile.ZIP_DEFLATED) as z:
  z.writestr('[Content_Types].xml',ct);z.writestr('_rels/.rels',rel);z.writestr('3D/3dmodel.model',E.tostring(model,encoding='utf-8',xml_declaration=True))
for name in names[:2]:
 data=(dest/(name+'.stl')).read_bytes();n=struct.unpack_from('<I',data,80)[0];assert len(data)==84+50*n
 vertices={};tris=[]
 for i in range(n):
  vals=struct.unpack_from('<12f',data,84+50*i)[3:];tri=[]
  for j in [0,3,6]:
   pt=tuple(vals[j:j+3]);tri.append(vertices.setdefault(pt,len(vertices)))
  tris.append(tri)
 obj=E.Element(tag('object'),type='model',name=name);mesh=E.SubElement(obj,tag('mesh'));vv=E.SubElement(mesh,tag('vertices'));tt=E.SubElement(mesh,tag('triangles'))
 for x,y,z in vertices:E.SubElement(vv,tag('vertex'),x=str(x),y=str(y),z=str(z))
 for a,b,c in tris:E.SubElement(tt,tag('triangle'),v1=str(a),v2=str(b),v3=str(c))
 save3mf(dest/(name+'.3mf'),[(obj,0,0)])
objects=[]
for name,(x,y) in zip(names,[(30,30),(65,30),(30,70),(65,70)]):
 with zipfile.ZipFile(dest/(name+'.3mf')) as z:obj=E.fromstring(z.read('3D/3dmodel.model')).find(tag('resources')).find(tag('object'))
 objects.append((obj,x,y))
save3mf(P/'V13-r9-four-parts-UNSLICED-FIT-TRIAL.3mf',objects)
files=[dict(name=str(f.relative_to(P)),sha256=hashlib.sha256(f.read_bytes()).hexdigest()) for f in sorted(P.rglob('*')) if f.is_file()]
(P/'manifest.json').write_text(json.dumps(dict(status='UNSLICED_GEOMETRY_TRIAL_NOT_MANUFACTURING_RELEASE',source_step_sha256=sha,files=files),indent=2)+'\n')
(P/'READ-ME-FIRST.txt').write_text('V13 r9 組立形状の検討用模型（未スライス・製造未承認）\nケース外形23×25×14.81mm。旧r8は比較用に保持。ケース・蓋は新設計、部品付き基板と電池はr8と同じ寸法模型。実部品の代用品ではありません。\nM1ねじSNZS-M1-2とSHNS-M1ナットを想定。購入・締結強度・締付けトルクは未確定。模型だけで無理に締めないでください。\n保持上板0.4mm、蓋座面・抜止め約0.3mm、音道壁最小0.3mm。ねじ頭の外形余裕は名目0.06mmで公差未検証。\nBambu Studio CLIはCocoa画面エラー、GUI接続もタイムアウトし、スライス未確認です。3MFは機種設定もG-codeも含みません。レイヤー表示で薄肉と支えを確認してから印刷してください。基板模型の下面もサポート検討が必要です。\nナット連続挿入経路と蓋離散lift検査は名目寸法で合格。工具アクセス・実公差・ハーネス・電池膨張・固定強度は未確認です。\n')
print(P)

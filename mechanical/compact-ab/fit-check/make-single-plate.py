"""Combine validated FC1 meshes as 13 independent objects, single 180mm layout."""
from pathlib import Path
import xml.etree.ElementTree as E
import zipfile,json,hashlib
P=Path(__file__).resolve().parent
NS='http://schemas.microsoft.com/3dmanufacturing/core/2015/02'
E.register_namespace('',NS)
def tag(n):return '{'+NS+'}'+n
model=E.Element(tag('model'),{'unit':'millimeter','{http://www.w3.org/XML/1998/namespace}lang':'en-US'})
E.SubElement(model,tag('metadata'),{'name':'Title'}).text='Pendant A+B FC1 - single plate - 13 separate objects'
E.SubElement(model,tag('metadata'),{'name':'Description'}).text='A+B bodies, lids, batteries, PCB envelopes, harness gauges and 12/15/18mm lead gauges. PCB rotated 90 degrees for edge printing; enable supports and brim. Select your own printer and filament. No G-code.'
resources=E.SubElement(model,tag('resources'));build=E.SubElement(model,tag('build'));items=[]
for v,y in [('A',20),('B',85)]:
 for part,x,dy in [('body',20,0),('lid',65,0),('battery',115,0),('pcb_components',145,0),('harness_reservation',115,40)]:items.append((v+'/'+part+'.3mf',v+'_'+part,x,y+dy,part=='pcb_components'))
for L,x in [(12,20),(15,50),(18,80)]:items.append((f'gauges/lead_{L}mm.3mf',f'lead_{L}mm',x,145,False))
report=[]
for idx,(src,name,tx,ty,rotate) in enumerate(items,1):
 with zipfile.ZipFile(P/src) as z:
  root=E.fromstring(z.read('3D/3dmodel.model'));meshes=root.findall('.//'+tag('mesh'));assert len(meshes)==1;mesh=meshes[0]
 verts=mesh.find(tag('vertices'));points=[]
 for vertex in verts:
  x,y,z=[float(vertex.get(k)) for k in ['x','y','z']]
  points.append([x,-z,y] if rotate else [x,y,z])
 mins=[min(p[j] for p in points) for j in range(3)]
 points=[[p[0]-mins[0]+tx,p[1]-mins[1]+ty,p[2]-mins[2]] for p in points]
 for vertex,point in zip(verts,points):
  for key,value in zip(['x','y','z'],point):vertex.set(key,f'{value:.8f}')
 obj=E.SubElement(resources,tag('object'),{'id':str(idx),'type':'model','name':name});obj.append(mesh)
 E.SubElement(build,tag('item'),{'objectid':str(idx)})
 bounds=[[min(p[j] for p in points),max(p[j] for p in points)] for j in range(3)]
 assert bounds[2][0]==0 and bounds[0][0]>=8 and bounds[1][0]>=8 and bounds[0][1]<=172 and bounds[1][1]<=172
 report.append({'object':name,'source':src,'source_sha256':hashlib.sha256((P/src).read_bytes()).hexdigest(),'rotation_x_deg':90 if rotate else 0,'bounds_mm':bounds,'triangles':len(mesh.find(tag('triangles')))})
# At least 5mm XY box separation; leaves room for brim around edge-printed boards.
for i,a in enumerate(report):
 for b in report[i+1:]:
  gap=max(b['bounds_mm'][0][0]-a['bounds_mm'][0][1],a['bounds_mm'][0][0]-b['bounds_mm'][0][1],b['bounds_mm'][1][0]-a['bounds_mm'][1][1],a['bounds_mm'][1][0]-b['bounds_mm'][1][1])
  assert gap>=5-1e-5,(a['object'],b['object'],gap)
with zipfile.ZipFile(P/'A/body.3mf') as z:content=z.read('[Content_Types].xml');rels=z.read('_rels/.rels')
out=P/'Pendant_AB_FC1_Bambu_single-plate.3mf'
with zipfile.ZipFile(out,'w',zipfile.ZIP_DEFLATED) as z:
 z.writestr('[Content_Types].xml',content);z.writestr('_rels/.rels',rels);z.writestr('3D/3dmodel.model',E.tostring(model,encoding='utf-8',xml_declaration=True))
with zipfile.ZipFile(out) as z:assert z.testzip() is None
(P/'single-plate-validation.json').write_text(json.dumps({'file':out.name,'objects':len(report),'unit':'millimeter','layout_bed_mm':[180,180],'all_on_bed':True,'minimum_xy_bbox_gap_mm':5,'printer_profile_embedded':False,'gcode_included':False,'parts':report},indent=2))
print(out)

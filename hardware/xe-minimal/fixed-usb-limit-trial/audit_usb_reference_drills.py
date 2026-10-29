"""Compare exported drill centers/tools with PCB, not a full CAM review."""
from pathlib import Path
import hashlib, json, re, math
import pcbnew
import wx
app=wx.App(False)
o=Path(__file__).resolve().parent/'usb-reference-via-small-trial'
f=o/'fabrication-review-10f561cc51b6'
b=pcbnew.LoadBoard(str(o/'pendant-xe-minimal.kicad_pcb'))
mm=lambda n: round(pcbnew.ToMM(n),4)
expected=[];expected_slots=[];actual_slots=[]
for track in b.GetTracks():
 if isinstance(track,pcbnew.PCB_VIA):
  p=track.GetPosition();expected.append(('PTH',mm(p.x),-mm(p.y),mm(track.GetDrillValue()),0.0))
for fp in b.GetFootprints():
 for pad in fp.Pads():
  d=pad.GetDrillSize()
  if not d.x:continue
  p=pad.GetPosition();kind='NPTH' if pad.GetAttribute()==pcbnew.PAD_ATTRIB_NPTH else 'PTH'
  if d.x!=d.y:
   angle=(pad.GetOrientationDegrees()+(90 if d.y>d.x else 0))%180
   expected_slots.append({'ref':fp.GetReference(),'pad':pad.GetNumber(),'center':[mm(p.x),-mm(p.y)],'angle_degrees':angle})
  expected.append((kind,mm(p.x),-mm(p.y),min(mm(d.x),mm(d.y)),round(abs(mm(d.x)-mm(d.y)),4)))
actual=[]
for path in sorted((f/'drill').glob('*.drl')):
 kind='NPTH' if '-NPTH' in path.name else 'PTH'; tools={};tool=None
 text=path.read_text();assert 'METRIC' in text and 'G90' in text
 for line in text.splitlines():
  m=re.fullmatch(r'T(\d+)C([\d.]+)',line)
  if m:tools[m[1]]=float(m[2]);continue
  m=re.fullmatch(r'T(\d+)',line)
  if m:tool=m[1];continue
  if line.startswith('X'):
   points=re.findall(r'X([-\d.]+)Y([-\d.]+)',line);assert len(points) in (1,2)
   coords=[tuple(map(float,p)) for p in points]
   x=sum(p[0] for p in coords)/len(coords);y=sum(p[1] for p in coords)/len(coords)
   length=0.0 if len(coords)==1 else ((coords[1][0]-coords[0][0])**2+(coords[1][1]-coords[0][1])**2)**.5
   if len(coords)==2:
    angle=math.degrees(math.atan2(coords[1][1]-coords[0][1],coords[1][0]-coords[0][0]))%180
    actual_slots.append({'center':[x,y],'angle_degrees':angle})
   actual.append((kind,round(x,4),round(y,4),tools[tool],round(length,4)))
remaining=list(actual)
max_error=0.0
for feature in expected:
 matches=[(i,item) for i,item in enumerate(remaining) if item[0]==feature[0] and all(abs(item[j]-feature[j])<=0.000501 for j in range(1,5))]
 assert len(matches)==1, ('Missing or ambiguous drill',feature,matches)
 i,item=matches[0];max_error=max(max_error,max(abs(item[j]-feature[j]) for j in range(1,5)));remaining.pop(i)
assert not remaining
assert len(expected_slots)==len(actual_slots)
for slot in expected_slots:
 matches=[v for v in actual_slots if max(abs(v['center'][i]-slot['center'][i]) for i in (0,1))<=0.000501]
 assert len(matches)==1
 delta=abs((matches[0]['angle_degrees']-slot['angle_degrees']+90)%180-90)
 assert delta<=0.01,(slot,matches[0])
 slot['export_angle_degrees']=matches[0]['angle_degrees']
 slot['angle_error_degrees']=delta

job=json.loads(next((f/'gerbers').glob('*.gbrjob')).read_text())
assert job['GeneralSpecs']['LayerNumber']==6
r={'status':'DRILL_CENTER_DIAMETER_SLOT_LENGTH_ORIENTATION_MATCH_NOT_FULL_CAM_APPROVAL','pcb_sha256':hashlib.sha256((o/'pendant-xe-minimal.kicad_pcb').read_bytes()).hexdigest(),'slots_orientation_checked':expected_slots,'coordinate_tolerance_mm':0.000501,'maximum_component_difference_mm':max_error,'drill_features':len(actual),'plated':sum(x[0]=='PTH' for x in actual),'nonplated':sum(x[0]=='NPTH' for x in actual),'copper_layers':6,'profile_centerline_mm':[24,27],'gerber_job_size_mm':job['GeneralSpecs']['Size'],'surface_finish_metadata':job['GeneralSpecs'].get('Finish'),'export_input_sha256':{str(v.relative_to(f)):hashlib.sha256(v.read_bytes()).hexdigest() for v in sorted(list((f/'drill').glob('*.drl'))+list((f/'gerbers').glob('*.gbrjob')))},'size_note':'Job bounds include 0.05 mm outline stroke; physical profile centerline is 24 x 27 mm.','limitations':['Copper/paste/mask geometry and CAM visual review remain incomplete.','Surface finish metadata records design intent only; fabrication process qualification remains incomplete.']}
(f/'drill-coordinate-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

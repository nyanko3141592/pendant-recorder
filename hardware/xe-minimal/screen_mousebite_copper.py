"""Screen two hypothetical perforations against current copper without editing PCB."""
from pathlib import Path
import json,hashlib
import pcbnew as k,wx
app=wx.App(False)
p=Path(__file__).resolve().parent;board=p/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(board))
s=json.loads((p/'assembly-panel-tab-site-screen-5mm.json').read_text());assert hashlib.sha256(board.read_bytes()).hexdigest()==s['source_pcb_sha256']
layers=list(b.GetEnabledLayers().CuStack());shapes=[]
for f in b.GetFootprints():
 for pad in f.Pads():
  for layer in layers:
   if pad.IsOnLayer(layer):shapes.append((f'{f.GetReference()}.{pad.GetNumber()}',pad.GetNetname(),layer,pad.GetEffectiveShape(layer)))
for t in b.GetTracks():
 for layer in layers:
  if t.IsOnLayer(layer):shapes.append((t.m_Uuid.AsString(),t.GetNetname(),layer,t.GetEffectiveShape(layer)))
for z in b.Zones():
 for layer in layers:
  if z.IsOnLayer(layer):shapes.append(('zone:'+z.m_Uuid.AsString(),z.GetNetname(),layer,z.GetFilledPolysList(layer)))
rows=[]
for lo,hi in s['edges']['bottom']['possible_tab_center_intervals_mm']:
 center=(lo+hi)/2
 # Six 0.5 mm holes at 0.75 pitch span 4.25 mm within a 5 mm tab.
 for i in range(6):
  x=center+(i-2.5)*.75;y=26.75
  point=k.VECTOR2I(k.FromMM(x),k.FromMM(y));hits=[]
  for ident,net,layer,shape in shapes:
   if shape.Collide(point,k.FromMM(.25)):
    hits.append({'item':ident,'net':net,'layer':b.GetLayerName(layer)})
  rows.append({'tab_center_x_mm':center,'hole_center_mm':[x,y],'copper_intersections':hits})
r={'status':'HYPOTHETICAL_HOLE_COPPER_INTERSECTION_SCREEN_ONLY','source_pcb_sha256':s['source_pcb_sha256'],'hole_diameter_mm':.5,'hole_pitch_mm':.75,'hole_center_inset_mm':.25,'holes':rows,'limitations':['No PCB changes; tab centers and inset remain hypotheses.','Filled copper polygons are read as saved; no new holes or zone refill performed.','No manufacturing copper clearance margin applied: reports direct drill-radius intersections only.','No stress, fixture, profile residual or hole-to-hole qualification.']}
(p/'assembly-mousebite-copper-screen.json').write_text(json.dumps(r,indent=2)+'\n')
print('holes',len(rows),'holes intersecting copper',sum(bool(v['copper_intersections']) for v in rows))
print('nets',sorted({h['net'] for v in rows for h in v['copper_intersections']}))

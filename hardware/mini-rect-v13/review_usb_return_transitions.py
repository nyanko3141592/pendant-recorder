"""Inventory USB transitions and nearby plane-connected ground vias; no SI pass claim."""
from pathlib import Path
import wx,pcbnew as k,json,math,hashlib
app=wx.App(False)
P=Path(__file__).resolve().parent
src=P/'usb-ground-plane-candidate.kicad_pcb'
b=k.LoadBoard(str(src));tracks=list(b.GetTracks())
refs=[k.In1_Cu,k.In3_Cu,k.In4_Cu]
zones=[z for z in b.Zones() if z.GetNetname()=='/GND' and z.GetLayer() in refs]
def xy(p):return [k.ToMM(p.x),k.ToMM(p.y)]
def contacts(v):
 result={}
 for layer in refs:
  hits=0
  radius=(k.ToMM(v.GetDrillValue())+k.ToMM(v.GetWidth(layer)))/4
  for i in range(32):
   p=v.GetPosition();q=k.VECTOR2I(p.x+k.FromMM(radius*math.cos(i*math.pi/16)),p.y+k.FromMM(radius*math.sin(i*math.pi/16)))
   hits+=any(z.GetFilledPolysList(layer).Contains(q) for z in zones if z.GetLayer()==layer)
  result[b.GetLayerName(layer)]=hits
 return result
ground=[]
for v in tracks:
 if isinstance(v,k.PCB_VIA) and v.GetNetname()=='/GND':
  c=contacts(v)
  ground.append({'uuid':v.m_Uuid.AsString(),'xy_mm':xy(v.GetPosition()),'annulus_samples_in_plane':c,'all_three_planes_sampled_connected':all(c.values())})
rows=[]
for v in tracks:
 if not isinstance(v,k.PCB_VIA) or v.GetNetname() not in ('/USB_DP','/USB_DM'):continue
 pos=v.GetPosition();layers=set()
 for t in tracks:
  if isinstance(t,k.PCB_VIA) or t.GetNetname()!=v.GetNetname():continue
  if min(math.hypot(q.x-pos.x,q.y-pos.y) for q in (t.GetStart(),t.GetEnd()))<=2:layers.add(b.GetLayerName(t.GetLayer()))
 candidates=[]
 for g in ground:
  if not g['all_three_planes_sampled_connected']:continue
  dist=math.hypot(g['xy_mm'][0]-k.ToMM(pos.x),g['xy_mm'][1]-k.ToMM(pos.y))
  candidates.append(dict(g,center_distance_mm=round(dist,6)))
 candidates.sort(key=lambda g:g['center_distance_mm'])
 rows.append({'net':v.GetNetname(),'uuid':v.m_Uuid.AsString(),'xy_mm':xy(pos),'attached_track_layers':sorted(layers),'nearest_plane_connected_ground_vias':candidates[:3]})
out={'status':'GEOMETRIC_TRANSITION_INVENTORY_NOT_SI_APPROVAL','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'rows':rows,'ground_vias':ground,'limitations':['Distance is Euclidean, not current-path length through ground copper','32 annulus samples per plane do not measure impedance, neck width, inductance or thermal spokes','No ground-pad or through-hole connector return contacts included','No arbitrary distance threshold used to declare USB compliance']}
(P/'usb-return-transition-review.json').write_text(json.dumps(out,indent=2)+'\n')
for r in rows:print(r['net'],r['xy_mm'],r['attached_track_layers'],[(g['xy_mm'],g['center_distance_mm']) for g in r['nearest_plane_connected_ground_vias']])

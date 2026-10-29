from pathlib import Path
import pcbnew as k,wx,json,hashlib,math
app=wx.App(False);O=Path(__file__).resolve().parent/'usb-reference-via-small-trial';p=O/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p));vias=[t for t in b.GetTracks()if isinstance(t,k.PCB_VIA)];gnd=[v for v in vias if v.GetNetname()=='/GND'];usb=[v for v in vias if v.GetNetname()in ['/USB_DP','/USB_DM']]
def xy(v):return [k.ToMM(v.x),k.ToMM(v.y)]
center=k.VECTOR2I(k.FromMM(17.5),k.FromMM(13.0));refs={}
for layer in [k.In1_Cu,k.In3_Cu]:
 zs=[z for z in b.Zones()if z.GetNetname()=='/GND'and z.IsOnLayer(layer)];parts=[]
 for z in zs:
  polys=z.GetFilledPolysList(layer)
  for i in range(polys.OutlineCount()):
   if polys.Contains(center,i):parts.append((z.m_Uuid.AsString(),i,polys))
 assert parts,'Anchor is not in ground copper';refs[layer]=parts
rows=[]
for v in usb:
 near=sorted(gnd,key=lambda g:math.dist(xy(v.GetPosition()),xy(g.GetPosition())))[:4];candidates=[]
 for g in near:
  candidates.append({'uuid':g.m_Uuid.AsString(),'position_mm':xy(g.GetPosition()),'center_in_any_filled_ground':{b.GetLayerName(l):any(z.GetFilledPolysList(l).Contains(g.GetPosition()) for z in b.Zones() if z.GetNetname()=='/GND'and z.IsOnLayer(l)) for l in refs},'center_distance_mm':math.dist(xy(v.GetPosition()),xy(g.GetPosition())),'on_same_ground_subpolygon_as_anchor':{b.GetLayerName(l):any(poly.Contains(g.GetPosition(),idx)for _,idx,poly in parts)for l,parts in refs.items()}})
 rows.append({'net':v.GetNetname(),'via_uuid':v.m_Uuid.AsString(),'position_mm':xy(v.GetPosition()),'nearest_ground_vias':candidates})
r={'status':'GROUND_POLYGON_CONNECTIVITY_SCREEN_NOT_TRANSITION_QUALIFICATION','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'anchor_mm':xy(center),'anchor_ground_polygons':{b.GetLayerName(l):[{'zone_uuid':u,'polygon_index':i}for u,i,_ in ps]for l,ps in refs.items()},'transitions':rows,'limits':['Same connected filled polygon is layout topology evidence, not return inductance or impedance proof','Via plating and electrical contacts not measured','Only four nearest ground vias checked; distance is not an acceptance threshold','F/B reference path and intervening layers require separate treatment']};(O/'usb-transition-ground-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))

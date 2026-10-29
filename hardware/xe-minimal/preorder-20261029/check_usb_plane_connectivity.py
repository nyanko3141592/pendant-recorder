from pathlib import Path
import pcbnew as k,wx,json,math,hashlib,ast
app=wx.App(False);w=Path(__file__).resolve().parent;p=w/'usb-return-via.kicad_pcb';b=k.LoadBoard(str(p));old=k.LoadBoard(str(w.parent/'costdown/HW-V1.4-EVT-4LAYER-27P5/route/hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb'))
xy=lambda q:[k.ToMM(q.x),k.ToMM(q.y)]
zones={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if not z.GetIsRuleArea() and z.GetNetname()=='/GND'}
ids=lambda layer,p:[i for i in range(zones[layer].OutlineCount()) if zones[layer].Contains(p,i)]
gnd=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname()=='/GND'];usbvias=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname() in ['/USB_DP','/USB_DM']]
returns=[]
for t in usbvias:
 q=min(gnd,key=lambda g:math.dist(xy(t.GetPosition()),xy(g.GetPosition())))
 returns.append({'usb_net':str(t.GetNetname()),'usb_xy':xy(t.GetPosition()),'gnd_xy':xy(q.GetPosition()),'distance_mm':math.dist(xy(t.GetPosition()),xy(q.GetPosition())),'gnd_polygon_ids':{b.GetLayerName(l):ids(l,q.GetPosition()) for l in zones}})
missing=[];covered=collections=None;covered_rows=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetNetname() not in ['/USB_DP','/USB_DM'] or t.GetLayer() not in [k.F_Cu,k.B_Cu]:continue
 layer=k.In1_Cu if t.GetLayer()==k.F_Cu else k.In2_Cu;a=t.GetStart();e=t.GetEnd();n=max(1,math.ceil(k.ToMM(t.GetLength())/.025))
 for i in range(n):
  q=k.VECTOR2I(round(a.x+(e.x-a.x)*(i+.5)/n),round(a.y+(e.y-a.y)*(i+.5)/n));poly=ids(layer,q)
  if poly:covered_rows.append({'net':str(t.GetNetname()),'layer':b.GetLayerName(layer),'polygon_ids':poly});continue
  via=min(usbvias,key=lambda v:math.dist(xy(q),xy(v.GetPosition())))
  missing.append({'net':str(t.GetNetname()),'layer':b.GetLayerName(layer),'xy':xy(q),'nearest_usb_via':xy(via.GetPosition()),'distance_from_via_center_mm':math.dist(xy(q),xy(via.GetPosition())),'via_radius_mm':k.ToMM(via.GetWidth(layer))/2})
import collections
counts=collections.Counter((a['net'],a['layer'],tuple(a['polygon_ids'])) for a in covered_rows)
# Reuse exact USB geometry comparator without its executable audit body.
module=ast.parse((w/'compare_usb_trial.py').read_text());node=next(n for n in module.body if isinstance(n,ast.FunctionDef) and n.name=='signature');exec(compile(ast.Module(body=[node],type_ignores=[]),'<signature>','exec'))
r={'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'usb_geometry_unchanged':{n:signature(old,n)==signature(b,n) for n in ['/USB_DP','/USB_DM']},'return_vias':returns,'covered_polygon_samples':{str(key):v for key,v in counts.items()},'missing_samples':missing,'missing_max_distance_from_nearest_usb_via_mm':max(m['distance_from_via_center_mm'] for m in missing),'limitations':['Filled polygon membership at center samples proves local copper continuity within each polygon, not field impedance','Nearest USB-via distance does not alone prove every missing sample is a legitimate antipad','Plane bottlenecks, via return inductance, fabrication stackup and physical USB remain unqualified'],'release_allowed':False}
(w/'usb-plane-connectivity.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({key:v for key,v in r.items() if key!='missing_samples'}))

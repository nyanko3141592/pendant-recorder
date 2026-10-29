from pathlib import Path
import pcbnew as k,wx,json,math,collections,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent
src=w.parent/'costdown/HW-V1.4-EVT-4LAYER-27P5/route/hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb';dst=w/'usb-corridor-routed.kicad_pcb';old=k.LoadBoard(str(src));b=k.LoadBoard(str(dst))
xy=lambda p:[k.ToMM(p.x),k.ToMM(p.y)]
def signature(board,name):
 out=[]
 for t in board.GetTracks():
  if t.GetNetname()!=name:continue
  if isinstance(t,k.PCB_VIA):out.append(('via',t.GetPosition().x,t.GetPosition().y,t.GetWidth(k.F_Cu),t.GetDrillValue()))
  else:out.append(('track',t.GetLayer(),*sorted(((t.GetStart().x,t.GetStart().y),(t.GetEnd().x,t.GetEnd().y))),t.GetWidth()))
 return sorted(out)
def route(board,name):
 ts=[t for t in board.GetTracks() if t.GetNetname()==name and not isinstance(t,k.PCB_VIA)]
 return {'length_mm':sum(k.ToMM(t.GetLength()) for t in ts),'min_width_mm':min(k.ToMM(t.GetWidth()) for t in ts),'width_length_mm':{str(a):sum(k.ToMM(t.GetLength()) for t in ts if k.ToMM(t.GetWidth())==a) for a in sorted({k.ToMM(t.GetWidth()) for t in ts})}}
power={n:{'before':route(old,n),'after':route(b,n)} for n in ['/BAT','/SYS','/V3V3','/SD_V3','/VBUS','/VBUS_CHARGER']}
zones={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if not z.GetIsRuleArea() and z.GetNetname()=='/GND'}
missing=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetNetname() not in ['/USB_DP','/USB_DM'] or t.GetLayer() not in [k.F_Cu,k.B_Cu]:continue
 ref=k.In1_Cu if t.GetLayer()==k.F_Cu else k.In2_Cu;a=t.GetStart();e=t.GetEnd();n=max(1,math.ceil(k.ToMM(t.GetLength())/.025))
 for i in range(n):
  p=k.VECTOR2I(round(a.x+(e.x-a.x)*(i+.5)/n),round(a.y+(e.y-a.y)*(i+.5)/n))
  if zones[ref].Contains(p):continue
  hits=[]
  for q in b.GetTracks():
   if q.GetNetname()=='/GND' or not q.IsOnLayer(ref):continue
   if q.GetEffectiveShape(ref).Collide(p,k.FromMM(.11)):hits.append({'net':str(q.GetNetname()),'kind':'via' if isinstance(q,k.PCB_VIA) else 'track','xy':xy(q.GetPosition())})
  missing.append({'net':str(t.GetNetname()),'ref':b.GetLayerName(ref),'xy':xy(p),'nearby_copper':hits})
r={'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'trial_sha256':hashlib.sha256(dst.read_bytes()).hexdigest(),'usb_exact_geometry_preserved':{n:signature(old,n)==signature(b,n) for n in ['/USB_DP','/USB_DM']},'power':power,'vias':dict(collections.Counter((str(t.GetViaType()),b.GetLayerName(t.TopLayer()),b.GetLayerName(t.BottomLayer())) for t in b.GetTracks() if isinstance(t,k.PCB_VIA))),'missing_samples':missing,'limitations':'Nearby copper within0.11mm is a locator only; absent hits may be pad antipads, polygon clearance, islands or edge.'}
r['vias']={str(a):v for a,v in r['vias'].items()}
(w/'usb-trial-comparison.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:v for k,v in r.items() if k!='missing_samples'}));print('missing_sample_causes',collections.Counter((h['net'],h['kind']) for m in missing for h in m['nearby_copper']))

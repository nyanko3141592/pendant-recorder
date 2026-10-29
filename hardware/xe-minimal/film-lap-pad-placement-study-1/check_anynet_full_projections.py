"""Projected copper including track caps, pads and vias; not an SI solution."""
from pathlib import Path
import pcbnew as k, wx, json, hashlib
app=wx.App(False);O=Path(__file__).resolve().parent
src=O.parent/'fixed-usb-limit-trial/ncu-sensor-trial/pendant-xe-minimal.kicad_pcb';dst=O/'pendant-xe-film-lap-anynet-footprint-trial.kicad_pcb'
a=k.LoadBoard(str(src));b=k.LoadBoard(str(dst))
def ground(board,l):
 p=k.SHAPE_POLY_SET()
 for z in board.Zones():
  if z.GetNetname()=='/GND' and z.IsOnLayer(l):p.BooleanAdd(z.GetFilledPolysList(l))
 return p
rows=[]
for plane,adj in [(k.In1_Cu,[k.F_Cu,k.In2_Cu]),(k.In3_Cu,[k.In2_Cu,k.In4_Cu])]:
 old=ground(a,plane);new=ground(b,plane);lost=k.SHAPE_POLY_SET();lost.BooleanSubtract(old,new);hits=[]
 items=list(b.GetTracks())+[pad for f in b.GetFootprints()for pad in f.Pads()]
 for item in items:
  if item.GetNetname()=='/GND':continue
  for l in adj:
   if not item.IsOnLayer(l):continue
   poly=k.SHAPE_POLY_SET();item.TransformShapeToPolygon(poly,l,0,k.FromMM(.001),k.ERROR_OUTSIDE)
   overlap=k.SHAPE_POLY_SET();overlap.BooleanIntersection(poly,lost);area=overlap.Area()/1e12
   if area>1e-7:hits.append({'net':item.GetNetname(),'uuid':item.m_Uuid.AsString(),'kind':type(item).__name__,'layer':b.GetLayerName(l),'removed_projection_mm2':area})
 fast=[h for h in hits if h['net'].startswith(('/PDM_','/SD_')) or h['net']in ['/USB_DP','/USB_DM']]
 rows.append({'plane':b.GetLayerName(plane),'lost_area_mm2':lost.Area()/1e12,'hits':hits,'fast_hits':fast})
dual=[]
for item in b.GetTracks():
 if isinstance(item,k.PCB_VIA) or item.GetLayer()!=k.In2_Cu or item.GetNetname()not in ['/SYS','/V3V3','/VBUS_LIMITED']:continue
 poly=k.SHAPE_POLY_SET();item.TransformShapeToPolygon(poly,k.In2_Cu,0,k.FromMM(.001),k.ERROR_OUTSIDE)
 areas={}
 for label,board in [('source',a),('candidate',b)]:
  combined=k.SHAPE_POLY_SET();combined.BooleanAdd(ground(board,k.In1_Cu),ground(board,k.In3_Cu))
  missing=k.SHAPE_POLY_SET();missing.BooleanSubtract(poly,combined);areas[label]=missing.Area()/1e12
 if areas['candidate']-areas['source']>1e-7:dual.append({'net':item.GetNetname(),'uuid':item.m_Uuid.AsString(),'simultaneously_uncovered_mm2':areas})
r={'status':'FULL_COPPER_PROJECTION_SCREEN_NOT_RELEASE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(dst.read_bytes()).hexdigest(),'polygon_error_mm':.001,'planes':rows,'In2_power_newly_missing_both_adjacent_references':dual,'limits':['Projection includes track end caps, pads and vias using outward polygon approximation.','No field solution, return-via inductance, PDN impedance or physical verification.','Power/control projections with removed ground need separate review.','Unchanged missing reference areas are not detected by a delta screen.']}
(O/'anynet-full-projections-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({'In2_power_newly_missing_both_adjacent_references':dual,'planes':[{'plane':x['plane'],'fast_hits':x['fast_hits'],'affected_nets':sorted(set(h['net']for h in x['hits']))}for x in rows]},indent=2))

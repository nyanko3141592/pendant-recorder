#!/usr/bin/env python3
"""Evidence-only routing audit: no SI, thermal or fabrication qualification claim."""
from pathlib import Path
import pcbnew as k,wx
import json,math,hashlib,collections,heapq
app=wx.App(False)
D=Path(__file__).resolve().parent/'costdown/HW-V1.4-EVT-4LAYER-27P5/route';P=D/'hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb'
b=k.LoadBoard(str(P));old=k.LoadBoard(str(D/'pre-manual-refinement'/P.name))
def signature(board):
 return sorted((f.GetReference(),p.GetNumber(),str(p.GetNetname()),p.GetPosition().x,p.GetPosition().y) for f in board.GetFootprints() for p in f.Pads())
def reference(board,names):
 zones={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in board.Zones() if z.GetNetname()=='/GND'};out={}
 for name in names:
  total=missing=0.;spans=[]
  for t in board.GetTracks():
   if isinstance(t,k.PCB_VIA) or t.GetNetname()!=name:continue
   layer=t.GetLayer();ref={k.F_Cu:k.In1_Cu,k.B_Cu:k.In2_Cu}.get(layer)
   if ref is None:continue
   a=t.GetStart();e=t.GetEnd();length=k.ToMM(t.GetLength());n=max(1,math.ceil(length/.025));total+=length;bad=0
   for i in range(n):
    q=k.VECTOR2I(round(a.x+(e.x-a.x)*(i+.5)/n),round(a.y+(e.y-a.y)*(i+.5)/n))
    if not zones[ref].Contains(q):bad+=1
   missing+=length*bad/n
   if bad:spans.append({'layer':board.GetLayerName(layer),'start_mm':[k.ToMM(a.x),k.ToMM(a.y)],'end_mm':[k.ToMM(e.x),k.ToMM(e.y)],'missing_centerline_mm':round(length*bad/n,4)})
  out[name]={'outer_route_mm':round(total,4),'missing_centerline_reference_mm':round(missing,4),'continuous_reference_pass':missing==0,'affected_segments':spans}
 return out
names=['/USB_DP','/USB_DM','/PDM_CLK','/PDM_DATA','/SD_CLK_MCU','/SD_CLK','/SD_MOSI','/SD_MISO','/SD_CS_N']
power={}
for name in ['/VBUS','/VBUS_OVP','/VBUS_CHARGER','/BAT','/SYS','/V3V3','/SD_V3']:
 ts=[t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetNetname()==name]
 # Sum of all branch resistances is a conservative trace-only series bound,
 # not a simulated load path; vias, temperature and regulator headroom excluded.
 resistance=sum(.01724*k.ToMM(t.GetLength())/(k.ToMM(t.GetWidth())*(35 if t.GetLayer() in [k.F_Cu,k.B_Cu] else 15.2)) for t in ts)
 power[name]={'length_mm':round(sum(k.ToMM(t.GetLength()) for t in ts),3),'minimum_width_mm':round(min(k.ToMM(t.GetWidth()) for t in ts),4),'length_below_0p15_mm':round(sum(k.ToMM(t.GetLength()) for t in ts if t.GetWidth()<k.FromMM(.15)),3),'sum_trace_resistance_ohm_20C_assumed_copper':round(resistance,4),'voltage_at_110mA_mV_trace_only_bound':round(110*resistance,2)}
# Capacitor to IC same-net geometric separation is a review locator, not loop inductance.
loops=[]
for f in b.GetFootprints():
 if not f.GetReference().startswith('C'):continue
 nets={str(p.GetNetname()) for p in f.Pads()}
 if '/GND' not in nets:continue
 for p in f.Pads():
  if str(p.GetNetname()) not in power:continue
  candidates=[(math.hypot(k.ToMM(p.GetPosition().x-q.GetPosition().x),k.ToMM(p.GetPosition().y-q.GetPosition().y)),g.GetReference(),q.GetNumber()) for g in b.GetFootprints() if g.GetReference() in ['U1','U3','U7','U8','U11','U14'] for q in g.Pads() if q.GetNetname()==p.GetNetname()]
  if candidates:
   dist,ic,pin=min(candidates);loops.append({'capacitor':f.GetReference(),'net':str(p.GetNetname()),'nearest_ic':ic,'pin':pin,'straight_pad_separation_mm':round(dist,3),'loop_qualified':False})
report={'status':'LOCAL_IMPROVEMENT_RETURN_PATH_AND_STACKUP_HOLD','candidate_sha256':hashlib.sha256(P.read_bytes()).hexdigest(),'pad_net_position_fingerprint_unchanged':signature(old)==signature(b),'reference_sampling_step_mm':.025,'reference_limitations':'Centerline sampling only, adjacent-layer copper existence; no edge margin, plane connectivity, via return or impedance certification. Inner-layer signal return not certified.','before_reference':reference(old,names),'after_reference':reference(b,names),'power':power,'power_limitations':'Widths improved where DRC permits; remaining necks and startup transient headroom require load-path analysis. Resistance assumes 35/15.2 um copper at 20 C, excludes vias.','capacitor_review_locators':loops,'stackup':{'thickness_mm':.8264,'copper_um':[35,15.2,15.2,35],'dielectric_mm':[.1164,.4932,.1164],'supplier_qualified':False},'release_allowed':False,'remaining_gates':['Re-route inner-layer signals crossing USB/PDM/SPI reference paths; qualify continuous GND and adjacent return vias.','Select fabricator 4-layer stackup within case thickness tolerance; recalculate USB width/gap for 90 ohm target.','Complete charger/decoupling current-loop and power neck/startup droop review.','Resolve library provenance, preserve verified schematic parity, then synchronized CAM/BOM/CPL and DFM.','Check live exact-MPN procurement and full quote; physical EVT remains required.']}
(D/'manual-routing-review.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'pad_map_unchanged':report['pad_net_position_fingerprint_unchanged'],'power':power,'usb_reference':{n:{s:report[s+'_reference'][n]['missing_centerline_reference_mm'] for s in ['before','after']} for n in names[:2]}},indent=2))

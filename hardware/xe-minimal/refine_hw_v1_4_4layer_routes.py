#!/usr/bin/env python3
"""Reproducible local USB/power refinement; never produces manufacturing release."""
from pathlib import Path
import collections, hashlib, json, math, shutil, subprocess, re
import pcbnew as k
import wx
app=wx.App(False)
HERE=Path(__file__).resolve().parent
OUT=HERE/'costdown/HW-V1.4-EVT-4LAYER-27P5/route'
BASE=OUT/'hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb'
BACKUP=OUT/'pre-manual-refinement'
BACKUP.mkdir(exist_ok=True)
for ext in ('.kicad_pcb','.kicad_pro','.kicad_dru'):
 p=BASE.with_suffix(ext)
 if not (BACKUP/p.name).exists():shutil.copy2(p,BACKUP/p.name)
WORK=OUT/'manual-refinement';WORK.mkdir(exist_ok=True)
P=WORK/'refined.kicad_pcb'
for ext in ('.kicad_pro','.kicad_dru'):shutil.copy2(BASE.with_suffix(ext),P.with_suffix(ext))
b=k.LoadBoard(str(BACKUP/BASE.name))
keepalive=list(b.GetTracks())
for t in keepalive:
 if t.GetNetname()=='/USB_DP' and t.GetLayer()==k.In2_Cu and not isinstance(t,k.PCB_VIA):
  net=t.GetNetCode();b.Remove(t)
# Hand-defined parallel main route; retain existing connector/ESD and MCU escapes.
points=[(12.4823,18.0767),(12.4823,17.4997),(15.7,14.282),(15.7,13.7382),(20.864,8.5742),(21.0086,8.5742)]
for a,z in zip(points,points[1:]):
 t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(*[k.FromMM(v) for v in a]));t.SetEnd(k.VECTOR2I(*[k.FromMM(v) for v in z]));t.SetWidth(k.FromMM(.1172));t.SetLayer(k.F_Cu);t.SetNetCode(net);b.Add(t)
power={'/VBUS','/VBUS_OVP','/VBUS_CHARGER','/BAT','/SYS','/V3V3','/SD_V3'}
original={}
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and str(t.GetNetname()) in power:
  original[t.m_Uuid.AsString()]=t.GetWidth()
  t.SetWidth(max(t.GetWidth(),k.FromMM(.25)))
k.SaveBoard(str(P),b)
# Replace malformed inherited six-layer stackup with an explicitly provisional,
# symmetric four-layer stackup retaining the mechanical thickness contract.
s=P.read_text(); start=s.index('\t\t(stackup'); end=s.index('\n\t\t(pad_to_mask_clearance',start)
layers=[('F.Cu','copper',.035),('dielectric 1','prepreg',.1164),('In1.Cu','copper',.0152),('dielectric 2','core',.4932),('In2.Cu','copper',.0152),('dielectric 3','prepreg',.1164),('B.Cu','copper',.035)]
stack='\t\t(stackup\n'
for name,kind,thickness in layers:
 stack+=f'\t\t\t(layer "{name}" (type "{kind}") (thickness {thickness})'
 if kind!='copper':stack+=' (material "FR4 - PROVISIONAL NOT FAB QUALIFIED") (epsilon_r 4.5) (loss_tangent 0.02)'
 stack+=')\n'
stack+='\t\t\t(copper_finish "ENIG")\n\t\t\t(dielectric_constraints no)\n\t\t)'
P.write_text(s[:start]+stack+s[end:])
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
iterations=[]
for iteration in range(40):
 subprocess.run([cli,'pcb','drc','--refill-zones','--save-board','--format','json','--severity-all','--output',str(WORK/'drc.json'),str(P)],check=True,stdout=subprocess.DEVNULL)
 drc=json.loads((WORK/'drc.json').read_text());bad=[v for v in drc['violations'] if v['type']!='lib_footprint_issues']
 iterations.append({'iteration':iteration,'geometric':len(bad),'unconnected':len(drc['unconnected_items'])})
 print(iterations[-1],flush=True)
 if not bad and not drc['unconnected_items']:break
 b=k.LoadBoard(str(P));tracks={t.m_Uuid.AsString():t for t in b.GetTracks()};changed=0
 for uuid in {i['uuid'] for v in bad for i in v['items']}:
  if uuid in original and uuid in tracks:
   t=tracks[uuid];new=max(original[uuid],t.GetWidth()-k.FromMM(.025))
   if new<t.GetWidth():t.SetWidth(new);changed+=1
 if not changed:raise RuntimeError('Unresolved violations; candidate not replaced')
 k.SaveBoard(str(P),b)
else:raise RuntimeError('No DRC-clean width solution')
b=k.LoadBoard(str(P));widths=[]
for t in b.GetTracks():
 uid=t.m_Uuid.AsString()
 if uid in original:widths.append({'uuid':uid,'net':str(t.GetNetname()),'layer':b.GetLayerName(t.GetLayer()),'length_mm':k.ToMM(t.GetLength()),'before_mm':k.ToMM(original[uid]),'after_mm':k.ToMM(t.GetWidth())})
(WORK/'width-changes.json').write_text(json.dumps({'iterations':iterations,'tracks':widths},indent=2)+'\n')
shutil.copy2(P,BASE)
shutil.copy2(WORK/'drc.json',OUT/'candidate-drc.json')
print(json.dumps({'iterations':iterations,'widened_segments':sum(t['after_mm']>t['before_mm'] for t in widths),'candidate_sha256':hashlib.sha256(BASE.read_bytes()).hexdigest()}))

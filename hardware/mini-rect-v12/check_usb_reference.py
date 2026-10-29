from pathlib import Path
import json,math,hashlib
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;src=P/'pofv-final-trial.kicad_pcb';b=k.LoadBoard(str(src))
zones=[z for z in b.Zones() if z.GetNetname()=='/GND']
results=[]
for t in b.GetTracks():
 if t.GetNetname() not in ['/USB_DP','/USB_DM'] or isinstance(t,k.PCB_VIA):continue
 layer=t.GetLayer()
 if layer not in [k.F_Cu,k.B_Cu]:continue
 ref=k.In1_Cu if layer==k.F_Cu else k.In4_Cu
 a=t.GetStart();e=t.GetEnd();dx=e.x-a.x;dy=e.y-a.y;length=math.hypot(dx,dy)
 if not length:continue
 n=max(1,math.ceil(k.ToMM(length)/.025));samples=[]
 for i in range(n+1):
  x=a.x+dx*i/n;y=a.y+dy*i/n
  missing=[]
  for offset in [0,-.15,.15]:
   u=k.FromMM(offset);point=k.VECTOR2I(round(x-dy/length*u),round(y+dx/length*u))
   if not any(z.HitTestFilledArea(ref,point) for z in zones):missing.append(offset)
  if missing:samples.append({'xy_mm':[round(k.ToMM(x),4),round(k.ToMM(y),4)],'missing_offsets_mm':missing})
 results.append({'net':t.GetNetname(),'layer':b.GetLayerName(layer),'reference':b.GetLayerName(ref),'uuid':t.m_Uuid.AsString(),'length_mm':k.ToMM(length),'samples':n+1,'center_missing_samples':sum(0 in p['missing_offsets_mm'] for p in samples),'corridor_missing_samples':len(samples),'gaps':samples})
d={'source':src.name,'sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'scope':'Sample stored GND zone fills every<=0.025mm along USB copper and +/-0.15mm transverse. Includes branches. No impedance solver, no exact polygon coverage or longitudinal return-path connectivity proof. Ground pads/tracks outside zones not counted.','tracks':results,'center_missing_total':sum(v['center_missing_samples'] for v in results),'corridor_missing_total':sum(v['corridor_missing_samples'] for v in results),'qualified':False}
(P/'usb-reference-screen.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps({key:d[key] for key in ['center_missing_total','corridor_missing_total']}));print([(v['net'],v['layer'],round(v['length_mm'],3),v['center_missing_samples']) for v in results if v['center_missing_samples']])

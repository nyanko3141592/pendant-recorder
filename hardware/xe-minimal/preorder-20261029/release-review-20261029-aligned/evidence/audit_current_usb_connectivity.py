from pathlib import Path
import wx,pcbnew as k,json,hashlib
app=wx.App(False);p=Path('hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned');src=p/'design/pendant-review.kicad_pcb';b=k.LoadBoard(str(src));rows=[]
for f in b.GetFootprints():
 pads=[{'pin':x.GetNumber(),'net':x.GetNetname(),'xy_mm':[k.ToMM(x.GetPosition().x),k.ToMM(x.GetPosition().y)]} for x in f.Pads()]
 if any(x['net'] in ['/USB_DP','/USB_DM','/VBUS_N','/VBUS_GATE'] for x in pads):rows.append({'ref':f.GetReference(),'value':f.GetValue(),'pads':pads})
(p/'evidence/current-usb-pin-connectivity.json').write_text(json.dumps({'pcb_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'components':rows},indent=2)+'\n')
for x in rows:print(x['ref'],x['value'],[(p['pin'],p['net']) for p in x['pads'] if x['ref']!='U1' or p['net'] in ['/USB_DP','/USB_DM','/VBUS_N','/VBUS_GATE']])

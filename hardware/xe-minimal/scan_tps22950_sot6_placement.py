#!/usr/bin/env python3
from pathlib import Path
import json, subprocess, wx, pcbnew as k

HERE=Path(__file__).resolve().parent
app=wx.App(False)
base=k.LoadBoard(str(HERE/'pendant-xe-minimal.kicad_pcb'))
old=next(f for f in base.GetFootprints() if f.GetReference()=='R51')
base.Remove(old)
lib='/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Package_TO_SOT_SMD.pretty'
u=k.FootprintLoad(lib,'SOT-23-6');u.SetReference('U13');u.SetValue('TPS22950CDDCR');base.Add(u)
nets={n:base.FindNet(n) for n in ['/VBUS','/VBUS_CHARGER','/GND']}
pin={'1':'/VBUS','2':'/VBUS','3':'/GND','5':'/VBUS_CHARGER'}
for p in u.Pads():
    if p.GetNumber() in pin:p.SetNet(nets[pin[p.GetNumber()]])
rows=[]
for x in [11.5,12.0,12.5,13.0,13.5,14.0,14.5,15.0,15.5,16.0]:
  for y in [0.65,0.85,1.05,1.25,1.45]:
    for a in [0,180]:
      u.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));u.SetOrientationDegrees(a)
      k.ZONE_FILLER(base).Fill(base.Zones());k.SaveBoard(str(HERE/'tps22950-placement-scan.kicad_pcb'),base)
      subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(HERE/'tps22950-placement-scan.kicad_pcb'),'--format','json','--severity-all','-o',str(HERE/'tps22950-placement-scan-drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,check=True)
      d=json.loads((HERE/'tps22950-placement-scan-drc.json').read_text())
      hard=[v for v in d['violations'] if v['type'] not in ('track_dangling','via_dangling')]
      rows.append({'x':x,'y':y,'angle':a,'hard':len(hard),'all':len(d['violations']),'unconnected':len(d['unconnected_items'])})
rows.sort(key=lambda r:(r['hard'],r['all'],r['unconnected']))
(HERE/'tps22950-placement-search.json').write_text(json.dumps({'best':rows[:20],'all':rows},indent=2)+'\n')
print(json.dumps(rows[:20],indent=2))

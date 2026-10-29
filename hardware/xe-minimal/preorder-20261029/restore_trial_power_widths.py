from pathlib import Path
import wx,pcbnew as k,shutil,json,subprocess
app=wx.App(False);w=Path(__file__).resolve().parent;p=w/'usb-corridor-routed.kicad_pcb';out=w/'usb-corridor-power-width.kicad_pcb';b=k.LoadBoard(str(p));changed=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA):continue
 target={'/BAT':.15,'/V3V3':.125,'/VBUS_CHARGER':.127}.get(str(t.GetNetname()))
 if target and t.GetWidth()<k.FromMM(target):changed.append({'net':str(t.GetNetname()),'from':k.ToMM(t.GetWidth()),'to':target});t.SetWidth(k.FromMM(target))
k.SaveBoard(str(out),b)
for ext in ('.kicad_pro','.kicad_dru','.kicad_sch'):shutil.copy2(p.with_suffix(ext),out.with_suffix(ext))
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--refill-zones','--save-board','--schematic-parity','--severity-all','--format','json','-o',str(w/'usb-corridor-power-width-drc.json'),str(out)],check=True)
d=json.loads((w/'usb-corridor-power-width-drc.json').read_text());bad=[v for v in d['violations'] if v['type']!='lib_footprint_issues']
r={'changed':changed,'geometric':len(bad),'unconnected':len(d['unconnected_items']),'parity':len(d['schematic_parity']),'adopted':False};(w/'usb-corridor-power-width-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))

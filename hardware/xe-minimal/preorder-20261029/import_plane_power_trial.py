from pathlib import Path
import json,hashlib,shutil,subprocess,collections
import wx,pcbnew as k
app=wx.App(False);w=Path(__file__).resolve().parent
src=w/'plane-first-unrouted.kicad_pcb';out=w/'plane-power-routed.kicad_pcb'
b=k.LoadBoard(str(src));assert k.ImportSpecctraSES(b,str(w/'plane-power-routed.ses'));
for z in b.Zones():
 if not z.GetIsRuleArea() and z.GetNetname()=='/GND':
  z.Outline().RemoveAllContours();z.Outline().NewOutline()
  for x,y in [(.3,-.2),(27.2,-.2),(27.2,26.7),(.3,26.7)]:z.Outline().Append(k.FromMM(x),k.FromMM(y))
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA):
  minimum={'/BAT':.15,'/SYS':.125,'/V3V3':.125,'/SD_V3':.127,'/VBUS':.127,'/VBUS_CHARGER':.127}.get(str(t.GetNetname()),.1)
  if t.GetWidth()<k.FromMM(minimum):t.SetWidth(k.FromMM(minimum))
k.SaveBoard(str(out),b)
for ext in ('.kicad_pro','.kicad_dru','.kicad_sch'):shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--refill-zones','--save-board','--schematic-parity','--severity-all','--format','json','-o',str(w/'plane-power-drc.json'),str(out)],check=True)
d=json.loads((w/'plane-power-drc.json').read_text());types=collections.Counter(v['type'] for v in d['violations']);b=k.LoadBoard(str(out))
r={'status':'ROUTING_TRIAL_NOT_ADOPTED','sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'types':dict(types),'geometric':sum(n for t,n in types.items() if t!='lib_footprint_issues'),'unconnected':len(d['unconnected_items']),'parity':len(d['schematic_parity']),'vias':sum(isinstance(t,k.PCB_VIA) for t in b.GetTracks()),'release_allowed':False}
(w/'plane-power-route-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))

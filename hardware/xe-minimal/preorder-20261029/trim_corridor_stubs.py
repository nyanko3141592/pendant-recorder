from pathlib import Path
import pcbnew as k,wx,json,subprocess,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;p=w/'corridor-connected-clean.kicad_pcb';r=w/'corridor-connected-clean-drc.json';shutil.copy2(p,w/'corridor-before-stub-trim.kicad_pcb');removed=[];critical=set(json.loads((w/'pdm-tp6-preparation.json').read_text())['critical_nets_outer_only'])|{'/USB_DP','/USB_DM'}
for attempt in range(8):
 d=json.loads(r.read_text());ids={i['uuid'] for v in d['violations'] if v['type']=='track_dangling' for i in v['items']}
 if not ids:break
 b=k.LoadBoard(str(p))
 for t in list(b.GetTracks()):
  if str(t.m_Uuid.AsString()) in ids:
   assert not isinstance(t,k.PCB_VIA) and t.GetNetname() not in critical;removed.append({'uuid':str(t.m_Uuid.AsString()),'net':str(t.GetNetname()),'length_mm':k.ToMM(t.GetLength())});b.RemoveNative(t)
 k.SaveBoard(str(p),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--refill-zones','--save-board','--schematic-parity','--severity-all','--format','json','-o',str(r),str(p)],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 assert not json.loads(r.read_text())['unconnected_items'],'Trim broke connectivity'
(w/'corridor-stub-trim.json').write_text(json.dumps({'removed':removed,'release_allowed':False},indent=2)+'\n')

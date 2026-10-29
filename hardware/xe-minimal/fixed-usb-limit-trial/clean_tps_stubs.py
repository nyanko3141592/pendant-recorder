from pathlib import Path
import json,shutil,subprocess,pcbnew as k,wx,hashlib
app=wx.App(False);D=Path(__file__).resolve().parent/'tps22950-placement';src='ground-final';dst='routed-clean'
for ext in ['kicad_pro','kicad_sch','kicad_dru']:shutil.copyfile(D/(src+'.'+ext),D/(dst+'.'+ext))
b=k.LoadBoard(str(D/(src+'.kicad_pcb')));q=json.loads((D/(src+'-drc.json')).read_text());removed=[]
for attempt in range(6):
 if not q['violations']:break
 assert not q['unconnected_items'] and not q['schematic_parity']
 ids=[]
 for v in q['violations']:
  assert v['type'] in ['track_dangling','via_dangling'],v
  ids.extend(i['uuid']for i in v['items'])
 for t in list(b.GetTracks()):
  if t.m_Uuid.AsString() in ids:
   assert t.GetNetname()=='/GND';removed.append(t.m_Uuid.AsString());b.RemoveNative(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(D/(dst+'.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(D/(dst+'.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(D/(dst+'-drc.json'))],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 q=json.loads((D/(dst+'-drc.json')).read_text())
assert all(not q[x]for x in ['violations','unconnected_items','schematic_parity'])
out={'status':'ROUTED_CANDIDATE_NOT_ADOPTED','checks':{x:len(q[x])for x in ['violations','unconnected_items','schematic_parity']},'pcb_sha256':hashlib.sha256((D/(dst+'.kicad_pcb')).read_bytes()).hexdigest(),'removed_GND_stub_uuids':removed,'remaining':['Resistor MPN/tolerance/TCR qualification','Electrical power path and charge completion validation','WCSP assembly process','Changed PDM reference plane and edge review','Mechanical integration','No measured runtime or production release']}
(D/'routed-clean-review.json').write_text(json.dumps(out,indent=2)+'\n');print(out)

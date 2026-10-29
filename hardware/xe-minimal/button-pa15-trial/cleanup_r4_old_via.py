import pcbnew as k,wx,json,shutil,subprocess,itertools
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pa15-r4-back-power-candidate';dst=O/'pa15-button-complete-candidate';out=[]
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
b.RemoveNative(next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='295a6c4c-e332-4989-81bf-5236e9e9f5d8'))
b.RemoveNative(next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='90736a28-fc55-4859-ad1b-f113d4d037c7'))
b.RemoveNative(next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='e8c153df-0961-4f9c-99ec-8f07b79d5cde'))
b.RemoveNative(next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='9d1a08a4-80b0-40cb-9f28-83f3e8bd52b6'))
b.RemoveNative(next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='0552f15a-c8f5-4fda-9f8f-bd86aecbb65f'))
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa15-button-complete-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'pa15-button-complete-drc.json').read_text());print('violations',len(r['violations']),'parity',len(r['schematic_parity']),'unconnected',len(r['unconnected_items']))

removed=[]
for attempt in range(20):
 r=json.loads((O/'pa15-button-complete-drc.json').read_text())
 if not r['violations']:break
 assert not r['schematic_parity'] and len(r['unconnected_items'])==25
 assert len(r['violations'])==1
 v=r['violations'][0];assert v['type'] in ('track_dangling','via_dangling')
 uid=v['items'][0]['uuid'];t=next(t for t in b.GetTracks() if t.m_Uuid.AsString()==uid)
 assert t.GetNetname()=='/V3V3'
 removed.append({'uuid':uid,'violation':v});b.RemoveNative(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa15-button-complete-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'pa15-button-complete-drc.json').read_text())
(O/'pa15-button-cleanup-review.json').write_text(json.dumps({'removed_additional_stubs':removed,'violations':r['violations'],'parity':r['schematic_parity'],'unconnected':len(r['unconnected_items'])},indent=2)+'\n')
print('FINAL',len(r['violations']),len(r['schematic_parity']),len(r['unconnected_items']),flush=True)

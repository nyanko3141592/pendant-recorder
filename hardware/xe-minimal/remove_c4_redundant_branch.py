import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'c4-redundant-branch-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));uid='f8274bf8-2322-49ed-80d6-54702794632c';v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()==uid);b.RemoveNative(v);removed=[uid]
for _ in range(20):
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'c4-redundant-branch-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'c4-redundant-branch-drc.json').read_text());print(len(r['violations']),len(r['unconnected_items']),flush=True)
 if not r['violations'] or r['schematic_parity'] or len(r['unconnected_items'])!=21:break
 if any(v['type'] not in ['track_dangling','via_dangling'] for v in r['violations']):break
 ids={v['items'][0]['uuid'] for v in r['violations']};items=[t for t in b.GetTracks() if t.m_Uuid.AsString() in ids]
 if any(t.GetNetname()!='/V3V3' for t in items):break
 for t in items:removed.append(t.m_Uuid.AsString());b.RemoveNative(t)
accepted=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==21
(O/'c4-redundant-branch-review.json').write_text(json.dumps({'accepted':accepted,'removed':removed,'violations':r['violations'],'unconnected':len(r['unconnected_items']),'scope':'Connectivity and geometry only; power integrity pending'},indent=2)+'\n');print('accepted',accepted)

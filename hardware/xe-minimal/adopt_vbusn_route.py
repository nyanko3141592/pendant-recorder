from pathlib import Path
import json,hashlib,shutil,subprocess
O=Path(__file__).resolve().parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
r=json.loads((O/'vbusn-adoption-review.json').read_text());a=json.loads((O/'active-design.json').read_text());board=O/'pendant-xe-minimal.kicad_pcb';candidate=O/'vbusn-current-joined-candidate.kicad_pcb'
assert sha(board)==r['source_sha256']==a['sha256'][board.name]
assert sha(candidate)==r['candidate_sha256']
d=json.loads((O/'vbusn-current-joined-drc.json').read_text());assert not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==6
backup=O/'pre-vbusn-adoption';backup.mkdir(exist_ok=False)
for name in [board.name,'active-design.json','current-drc.json','design-goal.json','fabrication-process-notes.txt','exact-via-pad-overlap-audit.json']:shutil.copyfile(O/name,backup/name)
shutil.copyfile(candidate,board)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(board),'--schematic-parity','--format','json','--severity-all','-o',str(O/'current-drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((O/'current-drc.json').read_text());assert not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==6
for name in a['sha256']:a['sha256'][name]=sha(O/name)
a['unconnected_items']=6;a['vbus_n_unconnected_items']=0;a['latest_candidate_review']='vbusn-adoption-review.json';a['vbusn_route_qualification']='ROUTED_NOT_MEASURED; Plane slots and eleven capped vias require qualification'
(O/'active-design.json').write_text(json.dumps(a,indent=2)+'\n')
g=json.loads((O/'design-goal.json').read_text());g['current_stage']=g['current_stage'].replace('7 unconnected','6 unconnected');(O/'design-goal.json').write_text(json.dumps(g,indent=2)+'\n')
r['adopted']=True;r['usb_projection_screen']=['vbusn-plane-review.json','vbusn-clock-length-review.json'];(O/'vbusn-adoption-review.json').write_text(json.dumps(r,indent=2)+'\n')
shutil.copyfile(O/'vbusn-via-audit.json',O/'exact-via-pad-overlap-audit.json')
inv=O.parent.parent/'mechanical/xe-minimal/board-inventory.json';i=json.loads(inv.read_text());assert i['pcb_sha256']==r['source_sha256'];i['pcb_sha256']=sha(board);inv.write_text(json.dumps(i,indent=2)+'\n')
with (O/'fabrication-process-notes.txt').open('a') as h:h.write('\nVBUS_N adds filled/capped via at U1.10 (13.15,5.95mm), copper0.35/drill0.15mm. Total eleven flagged overlap vias; resin-fill, planarize, copper-cap and stencil qualification required. Not manufacturing-qualified.\n')
print('Adopted VBUS_N; DRC0 parity0 unconnected6; hardware qualification pending')

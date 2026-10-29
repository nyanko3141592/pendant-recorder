from pathlib import Path
import json,hashlib,shutil,subprocess
O=Path(__file__).resolve().parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
r=json.loads((O/'hbudget-current-adoption-review.json').read_text());a=json.loads((O/'active-design.json').read_text());board=O/'pendant-xe-minimal.kicad_pcb';candidate=O/'hbudget-current-shortened-candidate.kicad_pcb'
assert sha(board)==r['source_sha256']==a['sha256'][board.name]
assert sha(candidate)==r['candidate_sha256']
d=json.loads((O/'hbudget-current-shortened-drc.json').read_text());assert not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==7
backup=O/'pre-hbudget-adoption';backup.mkdir(exist_ok=False)
for name in [board.name,'active-design.json','current-drc.json','design-goal.json','fabrication-process-notes.txt','exact-via-pad-overlap-audit.json']:shutil.copyfile(O/name,backup/name)
shutil.copyfile(candidate,board)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(board),'--schematic-parity','--format','json','--severity-all','-o',str(O/'current-drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((O/'current-drc.json').read_text());assert not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==7
for name in a['sha256']:a['sha256'][name]=sha(O/name)
a['unconnected_items']=7;a['usb_high_budget_unconnected_items']=0;a['latest_candidate_review']='hbudget-current-adoption-review.json';a['hbudget_route_qualification']='ROUTED_NOT_MEASURED; Plane slots and ten capped vias require qualification'
(O/'active-design.json').write_text(json.dumps(a,indent=2)+'\n')
g=json.loads((O/'design-goal.json').read_text());g['current_stage']=g['current_stage'].replace('9 unconnected','7 unconnected');(O/'design-goal.json').write_text(json.dumps(g,indent=2)+'\n')
r['adopted']=True;r['usb_projection_screen']=['hbudget-current-reference-plane-review.json','hbudget-usb-ground-screen.json'];(O/'hbudget-current-adoption-review.json').write_text(json.dumps(r,indent=2)+'\n')
shutil.copyfile(O/'hbudget-current-via-audit.json',O/'exact-via-pad-overlap-audit.json')
inv=O.parent.parent/'mechanical/xe-minimal/board-inventory.json';i=json.loads(inv.read_text());assert i['pcb_sha256']==r['source_sha256'];i['pcb_sha256']=sha(board);inv.write_text(json.dumps(i,indent=2)+'\n')
with (O/'fabrication-process-notes.txt').open('a') as h:h.write('\nUSB_HIGH_BUDGET adds filled/capped vias at Q5.1 (9.9,6.8mm) and U1.42 (17.1,11.15mm), copper0.35/drill0.15mm. Total ten flagged overlap vias; resin-fill, planarize, copper-cap and stencil qualification required. Not manufacturing-qualified.\n')
print('Adopted USB_HIGH_BUDGET; DRC0 parity0 unconnected7; hardware qualification pending')

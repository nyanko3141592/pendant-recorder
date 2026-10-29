from pathlib import Path
import json,hashlib,shutil,subprocess
O=Path(__file__).resolve().parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
r=json.loads((O/'chg-adoption-review.json').read_text());a=json.loads((O/'active-design.json').read_text());board=O/'pendant-xe-minimal.kicad_pcb';candidate=O/'chg-latest-combined-candidate.kicad_pcb'
assert sha(board)==r['source_sha256']==a['sha256'][board.name]
assert sha(candidate)==r['candidate_sha256']
d=json.loads((O/'chg-latest-combined-drc.json').read_text());assert not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==3
backup=O/'pre-chg-adoption';backup.mkdir(exist_ok=False)
for name in [board.name,'active-design.json','current-drc.json','design-goal.json','fabrication-process-notes.txt','exact-via-pad-overlap-audit.json']:shutil.copyfile(O/name,backup/name)
shutil.copyfile(candidate,board)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(board),'--schematic-parity','--format','json','--severity-all','-o',str(O/'current-drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((O/'current-drc.json').read_text());assert not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==3
for name in a['sha256']:a['sha256'][name]=sha(O/name)
a['unconnected_items']=3;a['chg_n_unconnected_items']=0;a['latest_candidate_review']='chg-adoption-review.json';a['chg_route_qualification']='ROUTED_NOT_MEASURED; Plane slots and thirteen capped vias require qualification'
(O/'active-design.json').write_text(json.dumps(a,indent=2)+'\n')
g=json.loads((O/'design-goal.json').read_text());g['current_stage']=g['current_stage'].replace('5 unconnected','3 unconnected');(O/'design-goal.json').write_text(json.dumps(g,indent=2)+'\n')
r['adopted']=True;r['usb_projection_screen']=['chg-reference-plane-review.json','chg-u1-ts-length-review.json','chg-u3-ts-length-review.json','chg-u3-power-length-review.json'];(O/'chg-adoption-review.json').write_text(json.dumps(r,indent=2)+'\n')
shutil.copyfile(O/'chg-via-audit.json',O/'exact-via-pad-overlap-audit.json')
inv=O.parent.parent/'mechanical/xe-minimal/board-inventory.json';i=json.loads(inv.read_text());assert i['pcb_sha256']==r['source_sha256'];i['pcb_sha256']=sha(board);inv.write_text(json.dumps(i,indent=2)+'\n')
with (O/'fabrication-process-notes.txt').open('a') as h:h.write('\nCHG_N adds filled/capped via at U3.9 (21.35,15.2mm), copper0.35/drill0.15mm. Total thirteen flagged overlap vias; resin-fill, planarize, copper-cap and stencil qualification required. Not manufacturing-qualified.\n')
print('Adopted CHG_N; DRC0 parity0 unconnected3; hardware qualification pending')

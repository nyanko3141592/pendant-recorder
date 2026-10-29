from pathlib import Path
import json,hashlib,shutil,subprocess
O=Path(__file__).resolve().parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
r=json.loads((O/'lclk-adoption-review.json').read_text());a=json.loads((O/'active-design.json').read_text());board=O/'pendant-xe-minimal.kicad_pcb';candidate=O/'lclk-q6-joined-candidate.kicad_pcb'
assert sha(board)==r['source_sha256']==a['sha256'][board.name]
assert sha(candidate)==r['candidate_sha256']
d=json.loads((O/'lclk-q6-joined-drc.json').read_text());assert not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==9
backup=O/'pre-lclk-adoption';backup.mkdir(exist_ok=False)
for name in [board.name,'active-design.json','current-drc.json','design-goal.json','fabrication-process-notes.txt','exact-via-pad-overlap-audit.json']:shutil.copyfile(O/name,backup/name)
shutil.copyfile(candidate,board)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(board),'--schematic-parity','--format','json','--severity-all','-o',str(O/'current-drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((O/'current-drc.json').read_text());assert not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==9
for name in a['sha256']:a['sha256'][name]=sha(O/name)
a['unconnected_items']=9;a['usb_latch_clock_unconnected_items']=0;a['latest_candidate_review']='lclk-adoption-review.json';a['lclk_route_qualification']='ROUTED_NOT_MEASURED; Plane slots and eight capped vias require qualification'
(O/'active-design.json').write_text(json.dumps(a,indent=2)+'\n')
g=json.loads((O/'design-goal.json').read_text());g['current_stage']=g['current_stage'].replace('11 unconnected','9 unconnected');(O/'design-goal.json').write_text(json.dumps(g,indent=2)+'\n')
r['adopted']=True;r['usb_projection_screen']=['lclk-q6-plane-review.json','lclk-r47-joined-plane-review.json','lclk-vbus-multilayer-restored-plane-review.json'];(O/'lclk-adoption-review.json').write_text(json.dumps(r,indent=2)+'\n')
print('Adopted USB_LATCH_CLOCK; DRC0 parity0 unconnected9; no hardware qualification')

with (O/'fabrication-process-notes.txt').open('a') as h:h.write('\nUSB_LATCH_CLOCK adds filled/capped via at U14.3(2.8,20.7 mm), copper0.35/drill0.15mm. Total eight flagged overlap vias; same resin-fill, planarize, copper-cap and stencil qualification requirements. Not manufacturing-qualified.\n')

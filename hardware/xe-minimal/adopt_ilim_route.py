from pathlib import Path
import json,hashlib,shutil,subprocess
O=Path(__file__).resolve().parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
r=json.loads((O/'ilim-adoption-review.json').read_text());a=json.loads((O/'active-design.json').read_text());board=O/'pendant-xe-minimal.kicad_pcb';candidate=O/'ilim-r44-joined-candidate.kicad_pcb'
assert sha(board)==r['source_sha256']==a['sha256'][board.name]
assert sha(candidate)==r['candidate_sha256']
d=json.loads((O/'ilim-r44-joined-drc.json').read_text());assert not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==16
backup=O/'pre-ilim-adoption';backup.mkdir(exist_ok=False)
for name in [board.name,'active-design.json','current-drc.json','design-goal.json','fabrication-process-notes.txt','exact-via-pad-overlap-audit.json']:shutil.copyfile(O/name,backup/name)
shutil.copyfile(candidate,board)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(board),'--schematic-parity','--format','json','--severity-all','-o',str(O/'current-drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((O/'current-drc.json').read_text());assert not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==16
for name in a['sha256']:a['sha256'][name]=sha(O/name)
a['unconnected_items']=16;a['usb_ilim_set_unconnected_items']=0;a['latest_candidate_review']='ilim-adoption-review.json';a['ilim_route_qualification']='ROUTED_NOT_MEASURED; Plane slots, SPI MOSI reroute and six capped vias require qualification'
(O/'active-design.json').write_text(json.dumps(a,indent=2)+'\n')
g=json.loads((O/'design-goal.json').read_text());g['current_stage']=g['current_stage'].replace('18 unconnected','16 unconnected');(O/'design-goal.json').write_text(json.dumps(g,indent=2)+'\n')
r['adopted']=True;r['usb_projection_screen']=['ilim-r45-plane-review.json','ilim-r44-plane-review.json'];(O/'ilim-adoption-review.json').write_text(json.dumps(r,indent=2)+'\n')
f=O/'fabrication-process-notes.txt'
with f.open('a') as h:h.write('\nUSB_ILIM_SET route adds filled/capped via at R45.1 (12.35,10.2 mm), copper diameter0.35 mm/drill0.15 mm. Total six flagged pad-overlap vias. Same resin fill, planarization, copper cap, ENIG and stencil qualification requirements apply; not fabrication-qualified.\n')
print('Adopted USB_ILIM_SET; DRC0 parity0 unconnected16; no hardware qualification')

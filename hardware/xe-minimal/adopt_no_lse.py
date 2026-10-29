"""One-shot adoption of verified no-LSE design; not manufacturing release."""
from pathlib import Path
import json,hashlib,shutil,subprocess
O=Path(__file__).resolve().parent;C=O/'no-lse-candidate';B=O/'pre-no-lse-adoption';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
a=json.loads((O/'active-design.json').read_text());r=json.loads((C/'adoption-readiness.json').read_text())
assert sha(O/a['board'])==a['sha256'][a['board']]==json.loads((C/'change-review.json').read_text())['source_pcb_sha256']
assert sha(C/'joined.kicad_pcb')==r['candidate_sha256']
for n,h in r['evidence'].items():assert sha(C/n)==h
B.mkdir(exist_ok=False)
names=['pendant-xe-minimal.kicad_pcb','pendant-xe-minimal.kicad_sch','design.json','bom.csv','connections.csv','Pendant.kicad_sym','sym-lib-table','active-design.json','current-drc.json','design-goal.json','exact-via-pad-overlap-audit.json']
for n in names:shutil.copyfile(O/n,B/n)
for n in ['design.json','bom.csv','connections.csv','Pendant.kicad_sym','sym-lib-table','pendant-xe-minimal.kicad_sch']:shutil.copyfile(C/n,O/n)
shutil.copyfile(C/'joined.kicad_pcb',O/a['board'])
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for args in [['pcb','drc',str(O/a['board']),'--schematic-parity','--format','json','--severity-all','-o',str(O/'current-drc.json')],['sch','erc',str(O/a['schematic']),'--format','json','--severity-all','-o',str(O/'current-erc.json')]]:subprocess.run([cli]+args,check=True,stdout=subprocess.DEVNULL)
d=json.loads((O/'current-drc.json').read_text());assert all(not d[k] for k in ['violations','schematic_parity','unconnected_items'])
e=json.loads((O/'current-erc.json').read_text());assert not any(s['violations'] for s in e['sheets'])
a.update(status='ROUTED_NOT_RELEASED',unconnected_items=0,physical_drc_violations=0,schematic_parity_violations=0,footprint_count=86,oscillator_status='LSE_Y1_C11_C12_REMOVED; AUDIO_MSIK_USB_HSI48_SYSTEM_HSI16',manufacturing_pad_via_flags=r['flagged_vias'],via_pad_audit_status='THIRTEEN_FLAGGED_VIAS_MANUFACTURING_QUALIFICATION_PENDING',latest_candidate_review='no-lse-candidate/adoption-readiness.json',warning='Routed engineering design; enclosure fit, runtime and hardware/manufacturing qualification remain. No production release.')
for n in list(a['sha256'])+['design.json','bom.csv','current-erc.json']:a['sha256'][n]=sha(O/n)
(O/'active-design.json').write_text(json.dumps(a,indent=2)+'\n')
g=json.loads((O/'design-goal.json').read_text());g['current_stage']='86-footprint 24x27mm PCB routed; DRC/ERC/parity/unconnected zero. Complete case dimensions, Omi fit and runtime are not established.';(O/'design-goal.json').write_text(json.dumps(g,indent=2)+'\n')
shutil.copyfile(C/'via-audit.json',O/'exact-via-pad-overlap-audit.json')
r['adopted']=True;r['canonical_pcb_sha256']=sha(O/a['board']);(C/'adoption-readiness.json').write_text(json.dumps(r,indent=2)+'\n')
print('Adopted 86 footprint routed design; ERC0 DRC0 parity0 opens0; not released.')

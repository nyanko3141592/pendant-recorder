"""Promote partial design only; not manufacturing release or hardware validation."""
from pathlib import Path
import json,hashlib,shutil
T=Path(__file__).resolve().parent;O=T.parent;root=O.parent.parent
m=json.loads((O/'active-design.json').read_text())
for name,digest in m['sha256'].items():assert hashlib.sha256((O/name).read_bytes()).hexdigest()==digest,name
r=json.loads((T/'pa15-router-screen-drc.json').read_text());assert not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==22
assert json.loads((T/'router-screen-review.json').read_text())['fixed_existing_copper_preserved']
backup=T/'pre-adoption-pb13';backup.mkdir(exist_ok=False)
files=['pendant-xe-minimal.kicad_pcb','pendant-xe-minimal.kicad_sch','design.json','connections.csv','active-design.json','current-drc.json']
for name in files:shutil.copy2(O/name,backup/name)
fw=root/'firmware/stm32/board/battery_io.c';shutil.copy2(fw,backup/'battery_io.c')
shutil.copy2(T/'pa15-router-screen-candidate.kicad_pcb',O/'pendant-xe-minimal.kicad_pcb')
shutil.copy2(T/'pa15-router-screen-candidate.kicad_sch',O/'pendant-xe-minimal.kicad_sch')
for name in ['design.json','connections.csv']:shutil.copy2(T/name,O/name)
shutil.copy2(T/'battery_io_pa15.c',fw)
(T/'adoption-pending-validation.json').write_text(json.dumps({'status':'PARTIAL_DESIGN_PROMOTED_PENDING_POSTCOPY_VALIDATION','backup':str(backup),'candidate':'pa15-router-screen-candidate','unconnected_expected':22,'hardware_tests':'Not performed; SWD held-button/reset and runtime pending.'},indent=2)+'\n')
print('Copied coherent PA15 design and firmware; metadata awaits validation')

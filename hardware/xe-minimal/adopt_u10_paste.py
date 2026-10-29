"""One-shot adoption of the independently verified U10 paste candidate."""
from pathlib import Path
import json,hashlib,shutil,subprocess
p=Path(__file__).resolve().parent;d=p/'u10-paste-candidate';sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
r=json.loads((d/'change-review.json').read_text());board=p/'pendant-xe-minimal.kicad_pcb'
assert sha(board)==r['source_pcb_sha256']
assert sha(d/board.name)==r['candidate_pcb_sha256']
assert r['other_bottom_paste_render_geometry_unchanged'] and all(r['unchanged_render_geometry'].values())
x=json.loads((d/'drc.json').read_text());assert all(not x[k] for k in ('violations','schematic_parity','unconnected_items'))
backup=p/'pre-u10-paste-adoption';backup.mkdir()
for name in (board.name,'fp-lib-table','active-design.json','current-drc.json'):shutil.copyfile(p/name,backup/name)
shutil.copytree(d/'Pendant.pretty',p/'PendantXE.pretty')
t=p/'fp-lib-table';s=t.read_text();old='${KIPRJMOD}/../mini-rect-v15/Pendant.pretty';assert old in s;t.write_text(s.replace(old,'${KIPRJMOD}/PendantXE.pretty'))
shutil.copyfile(d/board.name,board)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(board),'--schematic-parity','--format','json','--severity-all','-o',str(p/'current-drc.json')],check=True)
x=json.loads((p/'current-drc.json').read_text());assert all(not x[k] for k in ('violations','schematic_parity','unconnected_items'))
a=json.loads((p/'active-design.json').read_text())
for name in (board.name,'current-drc.json','fp-lib-table','PendantXE.pretty/TPS22916_YFP4.kicad_mod'):a['sha256'][name]=sha(p/name)
a['latest_candidate_review']='u10-paste-candidate/change-review.json';a['paste_revision']='U10 manufacturer-example 0.25 mm R0.05 apertures; electrical and body geometry unchanged'
a['previous_geometry_evidence_pcb_sha256']=r['source_pcb_sha256'];a['manufacturing_export_status']='REEXPORT_REQUIRED_AFTER_PASTE_REVISION'
(p/'active-design.json').write_text(json.dumps(a,indent=2)+'\n');r['status']='ADOPTED_NOT_MANUFACTURING_QUALIFIED';r['adopted_pcb_sha256']=sha(board);(d/'change-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(sha(board))

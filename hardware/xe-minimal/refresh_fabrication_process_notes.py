"""Write the current four-POFV local review schedule. Never uploads or orders."""
from pathlib import Path
import json,hashlib,shutil
p=Path(__file__).resolve().parent;a=json.loads((p/'active-design.json').read_text());d=p/a['manufacturing_review_directory'];review=json.loads((p/'via-in-pad-process-review.json').read_text());audit=json.loads((p/'exact-via-pad-overlap-audit.json').read_text());sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
board_hash=sha(p/a['board']);assert audit['board_sha256']==board_hash
notes=p/'fabrication-process-notes.txt';backup=p/'fabrication-process-notes-historical-pre-refresh.txt'
if not backup.exists():shutil.copyfile(notes,backup)
rows=review['current_vias'];assert len(rows)==audit['hole_over_pad_vias']==4
assert all(r['filled'] and r['capped'] and r['drill_mm']==0.15 for r in rows)
intent={'status':'FOUR_PUBLISHED_POFV_PROCESS_INTENT_REVIEW_ONLY_DO_NOT_UPLOAD_OR_ORDER','source_pcb_sha256':board_hash,'copper_layers':6,'surface_finish_intent':'ENIG','process':review['process'],'hole_over_pad_vias':4,'vias':rows,'physical_acceptance':'NOT_RUN','upload_or_order_performed':False}
(d/'via-process-intent.json').write_text(json.dumps(intent,indent=2)+'\n')
text=['DRAFT — ENGINEERING REVIEW ONLY — DO NOT UPLOAD OR ORDER',
      'Source PCB SHA256: '+board_hash,
      'This schedule supersedes historical via counts and coordinates.',
      '',
      'Six copper layers; nominal design thickness 0.8264 mm. Stackup/impedance and production tolerances remain unapproved.',
      'Required process for the four listed through vias: epoxy fill, planarization, copper cap, ENIG finish.',
      'Solder-mask ink plugging or tenting alone is not a substitute. Process capability and surface flatness remain unqualified.',
      'Coordinates: KiCad board X right/Y down in mm, top view for both sides. Excellon/position export uses negative Y.',
      'Only these four current hole-over-pad vias receive this POFV intent; do not infer old totals or coordinates.',
      '',
      'Net | Pad | X mm | Y board mm | Drill mm | Copper diameter mm | Via UUID']
for r in rows:text.append(f"{r['net']} | {r['pad']} | {r['xy_mm'][0]:.6f} | {r['xy_mm'][1]:.6f} | {r['drill_mm']:.3f} | {r['diameter_mm']:.3f} | {r['uuid']}")
text += ['', 'Use the current exported paste apertures; do not add paste apertures at filled vias.',
         'U10 paste uses four 0.25 mm rounded squares R0.05 per manufacturer example. Stencil thickness remains to be qualified for the whole board.',
         'Gerber job and board metadata specify ENIG consistently; process capability remains unqualified.',
         'Remaining: exact BOM and assembly orientation, solder-mask registration, stencil/paste process, stackup/impedance, thermal/runtime tests and final enclosure.',
         'No fabrication, assembly or purchase approval is granted by this draft.']
notes.write_text('\n'.join(text)+'\n');shutil.copyfile(notes,d/notes.name)
r=json.loads((d/'REVIEW-ONLY.json').read_text());r['unresolved']=[x for x in r['unresolved'] if not x.startswith('Raw position file')];r['files_sha256']={str(f.relative_to(d)):sha(f) for f in sorted(d.rglob('*')) if f.is_file() and f.name not in ('REVIEW-ONLY.json','prototype-v1-manifest.json')};(d/'REVIEW-ONLY.json').write_text(json.dumps(r,indent=2)+'\n')
print('Current process notes regenerated for',len(rows),'vias')

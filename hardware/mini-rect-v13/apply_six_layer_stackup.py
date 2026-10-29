"""Apply observed JLC06081H-2116 dimensions to a comparison copy, not a release."""
from pathlib import Path
import json,shutil,hashlib
P=Path(__file__).resolve().parent
r=json.loads((P/'jlc-six-layer-stackup.json').read_text());th=r['layers_top_to_bottom_mm'];total=round(sum(th),6)
src=P/'six-layer-topology-study.kicad_pcb';s=src.read_text();assert '(stackup' not in s
copper=['F.Cu','In1.Cu','In2.Cu','In3.Cu','In4.Cu','B.Cu'];dielectric=['prepreg','core','prepreg','core','prepreg'];materials=['2116 RC54%','FR4 core','7628 RC49%','FR4 core','2116 RC54%']
lines=['\t\t(stackup']
for i,t in enumerate(th):
 if i%2==0:lines.append(f'\t\t\t(layer "{copper[i//2]}" (type "copper") (thickness {t}))')
 else:
  j=i//2;lines.append(f'\t\t\t(layer "dielectric {j+1}" (type "{dielectric[j]}") (thickness {t}) (material "{materials[j]}"))')
lines.append('\t\t)');s=s.replace('(thickness 0.8)',f'(thickness {total})',1).replace('\t(setup\n','\t(setup\n'+'\n'.join(lines)+'\n',1)
f=P/'six-layer-stackup-candidate.kicad_pcb';f.write_text(s);shutil.copyfile(src.with_suffix('.kicad_pro'),f.with_suffix('.kicad_pro'))
(P/'six-layer-stackup-application.json').write_text(json.dumps({'status':'STACKUP_DIMENSIONS_APPLIED_NOT_RELEASED','stackup':r['recommended'],'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'sum_of_published_layers_mm':total,'manufacturer_finished_nominal_mm':.83,'manufacturer_finished_range_mm':[.73,.93],'limitations':['Published layer thicknesses sum to 0.8264 mm, rounded finished nominal is 0.83 mm','Dielectric constants/loss tangents not qualified in this candidate; no impedance claim','Mechanical fit must be evaluated up to 0.93 mm','Six-layer pricing and design selection pending']},indent=2)+'\n')
print(total)

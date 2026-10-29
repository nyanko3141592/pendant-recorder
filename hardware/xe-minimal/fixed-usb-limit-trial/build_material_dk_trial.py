"""Correct candidate material metadata without altering routing or dimensions."""
from pathlib import Path
import shutil,re,hashlib,json,subprocess
O=Path(__file__).resolve().parent;S=O/'dmn-land-trial';D=O/'material-dk-trial';D.mkdir(exist_ok=False)
for name in ['pendant-xe-minimal.kicad_pcb','pendant-xe-minimal.kicad_sch','pendant-xe-minimal.kicad_pro','pendant-xe-minimal.kicad_dru','fp-lib-table']:
 shutil.copy2(S/name,D/name)
for p in S.glob('*.pretty'):shutil.copytree(p,D/p.name)
p=D/'pendant-xe-minimal.kicad_pcb';original=p.read_text();updated=original;changes=[]
for material,dk,count in [('2116 RC54%',4.16,2),('FR4 core',4.6,2),('7628 RC49%',4.4,1)]:
 pattern=r'(\(material "'+re.escape(material)+r'"\)\s*\(epsilon_r )4\.5(\))'
 updated,n=re.subn(pattern,lambda m:m[1]+str(dk)+m[2],updated);assert n==count
 changes.append({'material':material,'old_epsilon_r':4.5,'new_epsilon_r':dk,'layers_changed':n})
restored=updated
for row in changes:
 pattern=r'(\(material "'+re.escape(row['material'])+r'"\)\s*\(epsilon_r )'+re.escape(str(row['new_epsilon_r']))+r'(\))'
 restored=re.sub(pattern,lambda m:m[1]+'4.5'+m[2],restored)
assert restored==original
p.write_text(updated)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(p),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,capture_output=True)
d=json.loads((D/'drc.json').read_text());assert all(not d[k]for k in ['violations','unconnected_items','schematic_parity'])
r={'status':'MATERIAL_METADATA_CORRECTED_NOT_IMPEDANCE_QUALIFIED','source_pcb_sha256':hashlib.sha256(original.encode()).hexdigest(),'output_pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'source':'https://jlcpcb.com/impedance','observed_date':'2026-10-27','changes':changes,'exact_inverse_text_comparison':True,'drc_violations':0,'unconnected_items':0,'schematic_parity':0,'limits':['Only nominal public Dk values changed; frequency, material tolerance and actual fabrication are not qualified','Layer thicknesses, tracks, zones, pads and placement unchanged byte-for-byte','Existing loss tangent0.02 remains an unqualified placeholder','USB fanouts, reference transitions and impedance not qualified','Previous manufacturing package remains linked to its previous hash; this is a separate candidate']}
(D/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

from pathlib import Path
import json,shutil,subprocess,sys
R=Path(__file__).resolve().parents[2];P=Path(__file__).parent;S=R/'hardware/charge-guard-v4'
d=json.loads((S/'design.json').read_text());d['revision']='compact-100-v5'
for p in d['parts']:
 if p['ref']=='J2':p['note']='Required finished YDL601515 100mAh pack with short 3-wire NTC harness and matching Molex plug. NOT standard PH2 stock configuration; supply and pinout unconfirmed.'
 if p['ref']=='R10':p['note']='Approx22mA nominal versus listed100mAh pack max50mA; voltage/termination acceptance and actual pack datasheet remain unresolved.'
 if p['ref'] in ['R39','R41']:p['note']='Provisional external temperature window; requires actual supplied NTC R-T and tolerance. Do not authorize charging from this design alone.'
(P/'design.json').write_text(json.dumps(d,indent=2)+'\n')
s=(S/'generate_schematic.py').read_text().replace('charge-guard-v4','compact-100-v5');(P/'generate_schematic.py').write_text(s)
for name in ['fp-lib-table']:shutil.copy(S/name,P/name)
shutil.copytree(S/'PendantD1.pretty',P/'PendantD1.pretty',dirs_exist_ok=True)
shutil.copytree(R/'hardware/rev-c/Pendant.pretty',P/'Pendant.pretty',dirs_exist_ok=True)
f=P/'fp-lib-table';f.write_text(f.read_text().replace('${KIPRJMOD}/../rev-c/Pendant.pretty','${KIPRJMOD}/Pendant.pretty'))
shutil.copy(S/'pendant-charge-guard-v4.kicad_pro',P/'pendant-compact-100-v5.kicad_pro')
subprocess.run([sys.executable,str(P/'generate_schematic.py'),'compact-100-v5',str(P)],check=True)

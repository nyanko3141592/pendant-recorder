"""Two-wire domestic battery candidate. No release or implicit pinout approval."""
import json, hashlib, shutil
from pathlib import Path
P=Path(__file__).resolve().parent
S=P.parent/'mini-rect-v13'
src=S/'design.json'
d=json.loads(src.read_text())
d.update(revision='mini-rect-v14 domestic battery electrical draft',status='UNPLACED_UNROUTED_NOT_RELEASED',release_status='NOT_RELEASED')
d['source']={'path':str(src),'sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'routed_comparison':'../mini-rect-v13/mic-jlc-overlap-candidate.kicad_pcb'}
ps={p['ref']:p for p in d['parts']}
ps['U8']['footprint']='Pendant:IM69D130_JLC_SMD_trial'
ps['J2'].update(value='S2B-PH-SM4-TB / DTP502035(PHR) PINOUT NOT QUALIFIED',footprint='Connector_JST:JST_PH_S2B-PH-SM4-TB_1x02-1MP_P2.00mm_Horizontal',pins=[dict(number='1',name='PACK_PLUS_CANDIDATE',net='BAT',type='passive'),dict(number='2',name='PACK_MINUS_CANDIDATE',net='GND',type='passive')],note='PH2 electrical candidate only: connector numbering versus completed pack polarity MUST be visually verified before PCB placement/release. Reverse polarity protection not yet designed. Do not attach battery.')
ps['R37'].update(value='100k 1%',note='Reduce thermistor excitation; 5.25V and99k gives52.99uA maximum branch current and69.60uW maximum thermistor power. Only powered from USB.')
ps['R38']['value']=ps['R40']['value']='100k 1%'
ps['R39'].update(value='20k 1%',note='Cold threshold candidate. Beta-model sensitivity is not full manufacturer R-T qualification. See temperature-screen.json.')
ps['R41'].update(value='7.5k 1%',note='Hot threshold candidate. Reserve margin for contact sensor lag; physical thermal qualification required.')
ps['U12']['note']='Open-drain wired-AND temperature permission. Either fault pulls Q4 gate low. Board NTC replaces undocumented pack NTC; exact R-T, common-mode error and thermal contact not qualified.'
ps['Q4']['note']='Pulls BQ25185 CE_N low only when MCU and wired-AND comparator outputs permit. R36 defaults gate low. Startup, leakage and gate-voltage behavior need review.'
ps['R10'].update(value='3.32k 1%',note='Prototype3.32k: nominal90.36mA, conservative+10%IC/-1%R bound100.41mA below pack150mA max. Input80mA minimum minusSYS limits actual charge; termination nominal9.04mA differs from pack3mA capacity test. See charger-prototype-selection.json; charging stays inhibited until qualification.')
ps['U3']['note']='Prototype90mA setting with100mA input selection; independent NTC guard. Charge voltage, thermal contact, full-cycle timing and usable capacity qualification remain; firmware charge-inhibited.'
assert 'TH1' not in ps
d['parts'].append(dict(ref='TH1',value='NCP18XH103F03RB 10k 1% B3380 candidate',section=2,footprint='Resistor_SMD:R_0603_1608Metric',pins=[dict(number='1',name='SENSE',net='BAT_TS',type='passive'),dict(number='2',name='RETURN',net='GND',type='passive')],note='Factory-mounted contact sensor beneath insulated compliant thermal interface to pouch. Manufacturer reference-only sheet; lifecycle/current R-T table and JLC supply not qualified. No user soldering.',assembly_status='NOT_RELEASED'))
(P/'design.json').write_text(json.dumps(d,indent=2)+'\n')
# Isolate generator and all local libraries; never modify V13 sources.
s=(S/'generate_schematic.py').read_text().replace("'mini-rect-v13'", "'mini-rect-v13','mini-rect-v14'")
(P/'generate_schematic.py').write_text(s)
for name in ['Pendant.pretty','PendantD1.pretty']:
 if (S/name).exists():shutil.copytree(S/name,P/name,dirs_exist_ok=True)
shutil.copyfile(S/'fp-lib-table',P/'fp-lib-table')
pro=json.loads((S/'pendant-mini-rect-v13.kicad_pro').read_text())
pro['meta']['filename']='pendant-mini-rect-v14.kicad_pro'
(P/pro['meta']['filename']).write_text(json.dumps(pro,indent=2)+'\n')
print('Created',len(d['parts']),'part V14 electrical draft; no PCB or manufacturing data generated.')

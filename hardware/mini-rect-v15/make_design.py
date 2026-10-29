"""XE-first electrical draft. Existing revisions are never modified."""
from pathlib import Path
import json,hashlib,shutil
P=Path(__file__).resolve().parent;S=P.parent/'mini-rect-v14';src=S/'design.json'
d=json.loads(src.read_text());d.update(revision='mini-rect-v15 XE110mAh30x32 draft',status='ELECTRICAL_DRAFT_NOT_ROUTED_NOT_RELEASED',release_status='NOT_RELEASED')
d['source']={'path':str(src),'sha256':hashlib.sha256(src.read_bytes()).hexdigest()};d['battery_model']='DTP401525-XE';d['case_limit_mm']=[30,32,15]
ps={p['ref']:p for p in d['parts']}
ps['J2'].update(value='Molex781710003 / DTP401525-XE',footprint='Connector_Molex:Molex_Pico-EZmate_78171-0003_1x03-1MP_P1.20mm_Vertical',pins=[dict(number='1',name='PACK_PLUS',net='BAT',type='passive'),dict(number='2',name='PACK_NTC_UNUSED',net=None,type='passive'),dict(number='3',name='PACK_MINUS',net='GND',type='passive')],note='Pack manufacturer p9:1red+,2NTC,3black-. Header mating-view pad alignment still requires validation. Built-in NTC has no identified R-T curve; pin2 deliberately NC. Independent factory-mountedTH1 contact sensor is mandatory; no user soldering. Reverse polarity protection review pending.')
ps['R10'].update(value='6.8k 1%',note='XE prototype44.12mA nominal;10%IC/1%R screen39.31..49.02mA below110mA pack maximum. Nominal4.41mA termination exceeds manufacturer1.1mA reference; capacity/16h not guaranteed. No charge enable.')
ps['R42'].update(value='130k 1%',note='4.1V/ILIM500; USB startup/suspend policy pending; no charge release.')
ps['U3']['note']='XE4.1V ±0.5% /44.12mA nominal; ILIM500; USB power policy and thermal qualification pending; CE inhibited.'
ps['TH1']['note']='Independent factory-mounted contactNTC required because pack NTC exactR-T unspecified. Electrically insulated compliant contact to pouch and retention must be engineered and tested; no ambient-only charging approval.'
(P/'design.json').write_text(json.dumps(d,indent=2)+'\n')
s=(S/'generate_schematic.py').read_text().replace("'mini-rect-v14'","'mini-rect-v14','mini-rect-v15'");(P/'generate_schematic.py').write_text(s)
for name in ['Pendant.pretty','PendantD1.pretty']:
 if (S/name).exists():shutil.copytree(S/name,P/name,dirs_exist_ok=True)
shutil.copyfile(S/'fp-lib-table',P/'fp-lib-table')
pro=json.loads((S/'pendant-mini-rect-v14.kicad_pro').read_text());pro['meta']['filename']='pendant-mini-rect-v15.kicad_pro';(P/pro['meta']['filename']).write_text(json.dumps(pro,indent=2)+'\n')
for name in ['check_temperature.py','check_board_parity.py']:
 if not (P/name).exists():shutil.copyfile(S/name,P/name)
I=300/6800*1000
r=dict(status='XE_PROTOTYPE_SETTINGS_NOT_CHARGE_RELEASE',battery='DTP401525-XE',R10_ohms=6800,charge_nominal_mA=I,charge_tolerance_screen_mA=[I*.9/1.01,I*1.1/.99],charge_max_pack_mA=110,termination_nominal_mA=I*.1,pack_end_current_mA=1.1,ideal_CC_only_hours=110/I,safety_timer_typical_hours=6,R42_ohms=130000,input_minimum_mA=450,input_typical_mA=475,input_maximum_mA=498,nonstorage_SYS_reserve_mA=20,charge_plus_reserve_upper_screen_mA=I*1.1/.99+20,voltage_status='4.1V±0.5% gives4.1205V upper; ILIM500 requires USB power policy; charging remains inhibited',temperature_status='IndependentTH1; packpin2NC; exactsensor/thermal implementation unqualified',runtime_status='110mAh70%usable/16h4.8125mA allocation only; earlytermination andLDO cutoff require measurements',release_allowed=False)
(P/'electrical-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

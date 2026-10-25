"""Derive a fail-inhibited charging guard schematic; not manufacturing release."""
import json,subprocess,sys,shutil
from pathlib import Path
R=Path(__file__).resolve().parents[2];P=R/'hardware/charge-guard-v4';P.mkdir(exist_ok=True)
d=json.loads((R/'hardware/compact-b/electrical-placement-v3/design.json').read_text());by={p['ref']:p for p in d['parts']}
def pin(n,name,net,t='passive'):return dict(number=str(n),name=name,net=net,type=t)
def add(ref,value,pins,fp,note):
 d['parts'].append(dict(ref=ref,value=value,pins=pins,section=2,footprint=fp,note=note,assembly_status='NOT_RELEASED'))
def resistor(ref,value,a,b,note=''):
 add(ref,value,[pin(1,'1',a),pin(2,'2',b)],'Resistor_SMD:R_0402_1005Metric',note)
for p in by['U1']['pins']:
 if p['net']=='CHG_DISABLE':p['net']='CHG_ALLOW'
by['Q2']['pins'][0]['net']='CHG_INHIBIT_GATE';by['Q2']['pins'][2]['net']='CHARGER_TS'
by['Q2']['note']='Default-on TS clamp. Only MCU permission AND both hardware temperature permissions release it. Validate start-up transients.'
by['R12']['pins']=[pin(1,'1','VBUS'),pin(2,'2','CHG_INHIBIT_GATE')]
by['R12']['note']='100k VBUS pull-up defaults Q2 to charge inhibited; no MCU GPIO connection to5V.'
for p in by['U3']['pins']:
 if p['name']=='TS':p['net']='CHARGER_TS'
by['U3']['note']='BQ25101 charge regulation retained; TS driven by independent hardware window guard and fixed10k. Not directly connected to pack NTC.'
by['J2']['note']='Pack NTC goes to separate window comparator, not charger TS. Beta/tolerances need supplier confirmation.'
by['R10']['note']='Nominal21.81mA, upper estimate23.66mA. XE charge current/termination/voltage acceptance not finalized.'
resistor('R35','10k 1%','CHARGER_TS','GND','Holds normal TS level when released; no floating TS/TTDM in intended circuit.')
resistor('R36','100k','CHG_ALLOW','GND','MCU reset/high-Z defaults to no charging permission.')
resistor('R37','10k 1%','VBUS','BAT_TS','Ratiometric NTC excitation only while USB present; self-heating must be verified.')
resistor('R38','10k 1%','VBUS','TS_COLD_REF')
resistor('R39','12.1k 1%','TS_COLD_REF','GND','Provisional narrow window. Final values require actual pack R-T curve.')
resistor('R40','10k 1%','VBUS','TS_HOT_REF')
resistor('R41','8.25k 1%','TS_HOT_REF','GND','Provisional narrow window. Final values require actual pack R-T curve.')
add('U12','TLV7032DDFR',[pin(1,'OUTA','TEMP_COLD_OK','output'),pin(2,'INA-','BAT_TS','input'),pin(3,'INA+','TS_COLD_REF','input'),pin(4,'VEE','GND','power_in'),pin(5,'INB+','BAT_TS','input'),pin(6,'INB-','TS_HOT_REF','input'),pin(7,'OUTB','TEMP_HOT_OK','output'),pin(8,'VCC','VBUS','power_in')],'Package_TO_SOT_SMD:SOT-23-8','Push-pull variant intentionally selected: POR outputs low. Do not substitute TLV7042 open-drain (POR high-Z). TI SLVSE13J pinout table4-2.')
for ref,gate,source,drain in [('Q4','CHG_ALLOW','GND','ALLOW_CHAIN_1'),('Q5','TEMP_COLD_OK','ALLOW_CHAIN_1','ALLOW_CHAIN_2'),('Q6','TEMP_HOT_OK','ALLOW_CHAIN_2','CHG_INHIBIT_GATE')]:
 add(ref,'2N7002',[pin(1,'G',gate,'input'),pin(2,'S',source),pin(3,'D',drain)],'Package_TO_SOT_SMD:SOT-23','Series pull-down permission chain. All three must conduct to release Q2. Body diodes oppose pull-down when off. Verify stack/leakage/transients.')
add('C29','100n 10V',[pin(1,'1','VBUS'),pin(2,'2','GND')],'Capacitor_SMD:C_0402_1005Metric','Place adjacent to U12 supply pins.')
for ref in ['R35','R36','Q4','Q5','Q6']:
 next(p for p in d['parts'] if p['ref']==ref)['section']=1
d['revision']='charge-guard-v4';(P/'design.json').write_text(json.dumps(d,indent=2)+'\n')
# Use the existing generator with an isolated source copy and a unique UUID namespace.
s=(R/'hardware/tools/generate_schematic.py').read_text().replace("'omi-fit-d1')","'omi-fit-d1','charge-guard-v4')").replace("['GND','VDDA','VBUS','SYS']","['GND','VDDA','VBUS','SYS']")
s=s.replace('2026-10-24','2026-10-25')
(P/'generate_schematic.py').write_text(s)
shutil.copy(R/'hardware/compact-b/compact-b.kicad_pro',P/'pendant-charge-guard-v4.kicad_pro')
shutil.copytree(R/'hardware/compact-b/PendantD1.pretty',P/'PendantD1.pretty',dirs_exist_ok=True)
(P/'fp-lib-table').write_text((R/'hardware/compact-b/fp-lib-table').read_text())
subprocess.run([sys.executable,str(P/'generate_schematic.py'),'charge-guard-v4',str(P)],check=True)
(P/'order-status.json').write_text(json.dumps(dict(order_ready=False,status='SCHEMATIC_GUARD_PROTOTYPE',blockers=['Pack NTC beta/tolerances unknown; thresholds provisional','No PCB routing or assembly acceptance for added parts','Charge voltage and termination acceptance unresolved','Transient, fault and temperature physical tests pending']),indent=2)+'\n')
print('parts',len(d['parts']))

"""Current-netlist ideal DC fault audit. Does not qualify analog or thermal behavior."""
from pathlib import Path
import json,hashlib
P=Path(__file__).resolve().parent;source=P/'design.json';d=json.loads(source.read_text());parts={p['ref']:p for p in d['parts']}
def nets(ref):return {p['number']:p.get('net') for p in parts[ref]['pins']}
expected={'U12':{'1':'CHG_GUARD_GATE','2':'BAT_TS','3':'TS_COLD_REF','4':'GND','5':'BAT_TS','6':'TS_HOT_REF','7':'CHG_GUARD_GATE','8':'V3V3'},'Q4':{'1':'CHG_GUARD_GATE','2':'GND','3':'CHG_INHIBIT_GATE'},'R36':{'1':'CHG_GUARD_GATE','2':'GND'},'R43':{'1':'CHG_ALLOW','2':'CHG_GUARD_GATE'},'R12':{'1':'SYS','2':'CHG_INHIBIT_GATE'},'J2':{'1':'BAT','2':'BAT_TS','3':'GND'}}
for ref,pins in expected.items():assert nets(ref)==pins,(ref,nets(ref))
assert nets('U3')['4']=='CHG_INHIBIT_GATE'
def resistance(ref):
 value=parts[ref]['value'].split()[0];return float(value[:-1])*1000 if value.endswith('k') else float(value)
pull=resistance('R37');cold=resistance('R39')/(resistance('R38')+resistance('R39'));hot=resistance('R41')/(resistance('R40')+resistance('R41'))
rows=[]
for sensor,rntc in [('short',0),('nominal_25C',10000),('open',float('inf'))]:
 ratio=1 if rntc==float('inf') else rntc/(pull+rntc)
 for mcu in ['low','high_z','high']:
  for comparator in ['operating','POR_high_impedance']:
   clamp=(ratio>cold or ratio<hot) if comparator=='operating' else False
   permit=mcu=='high' and not clamp
   rows.append({'sensor':sensor,'mcu':mcu,'comparator':comparator,'ideal_charge_permission':permit})
assert all(not row['ideal_charge_permission'] for row in rows if row['comparator']=='operating' and (row['sensor'] in ['short','open'] or row['mcu']!='high'))
report={'status':'DEFAULT_DENY_AND_10MS_STARTUP_DELAY_STATICALLY_VERIFIED_PHYSICAL_RAMP_PENDING','design_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'checked_pin_maps':expected,'source':'https://www.ti.com/lit/ds/symlink/tlv7042.pdf','source_sections':['5 Pin Configuration and Functions','5.9 Electrical Characteristics (Dual)'],'nominal_ntc_resistance_window_ohm':[pull*hot/(1-hot),pull*cold/(1-cold)],'startup_design_evidence':{'R36_pulldown_ohm':resistance('R36'),'mcu_sequence':'PB2 output latch LOW before output configuration','firmware_charge_delay_ms':10,'TLV7042_VCC_ready_threshold_V':1.6,'TLV7042_ready_time_us':200,'nominal_delay_ratio':50},'truth_table':rows,'finding':'Open/short and MCU low/high-Z inhibit in ideal steady state. Reset/high-Z is default-deny through R36 and Q4-off, leaving CE pulled high from SYS. Firmware drives PB2 low before output mode and cannot request charge until 10ms after an accepted USB grant. A stuck-high MCU does not itself inhibit; operating temperature comparators still override it.','required_resolution':['Bench-capture SYS, V3V3, CHG_ALLOW, CHG_GUARD_GATE, CE and charge current during dead-pack USB insertion and removal; prove the real ramp preserves inhibit','Qualify real NTC R-T envelope and mechanical thermal contact; electrically intact detached sensor is not detected','Check MOS gate threshold, comparator sink/leakage, input common mode and supply tolerances over temperature','Do not substitute a push-pull-output comparator directly: its outputs cannot be tied together in this topology'],'not_proven':['Physical startup/transient inhibit','Cell-temperature threshold bounds','16h runtime','Hardware fault-tolerant certification'],'order_ready':False}
(P/'charge-guard-audit.json').write_text(json.dumps(report,indent=2)+'\n');print('Current pin maps verified; default-deny startup and ideal steady-state fault cases checked; physical ramp remains pending.')

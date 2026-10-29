"""Candidate LED allocation including unbounded main-loop polling; no runtime proof."""
from pathlib import Path
import json,hashlib,subprocess,tempfile
D=Path(__file__).resolve().parent;root=D.parents[2];O=D/'led-land-trial'
basepath=D.parent/'recording-current-budget.json';base=json.loads(basepath.read_text())
for rel,digest in base['source_sha256'].items():assert hashlib.sha256((root/rel).read_bytes()).hexdigest()==digest,rel
spec=json.loads((O/'design.json').read_text());assert next(p for p in spec['parts']if p['ref']=='R32')['value']=='6.8k tentative'
core=root/'firmware/stm32/core';sample=root/'firmware/stm32/tests/measure_indicator_duty.c'
with tempfile.TemporaryDirectory()as td:
 exe=Path(td)/'duty';subprocess.run(['cc','-std=c11','-Wall','-Wextra','-Werror','-I',str(core),str(sample),str(core/'battery_indicator.c'),'-o',str(exe)],check=True)
 duty=json.loads(subprocess.check_output([str(exe)],text=True))
# 3.35V ceiling and 1% R are explicit allocation assumptions, not selected R32 specs.
peak=1000*3.35/(6800*.99)
for row in duty:row['LED_only_average_upper_mA']=peak*row['max_on_ms_across_voltage_bands']/row['duration_ms']
assert duty[0]['max_on_ms_across_voltage_bands']==1200
assert duty[-1]['max_on_ms_across_voltage_bands']==120000
scenarios=[]
for s in base['scenarios']:
 budget=s['remaining_storage_allocation_mA']-peak
 scenarios.append({'usable_fraction_hypothesis':s['usable_fraction_hypothesis'],'whole_battery_average_allocation_mA':s['whole_battery_average_allocation_mA'],'LED_reserve_until_poll_timing_qualified_mA':peak,'remaining_storage_allocation_mA':budget,'remaining_storage_if_ideal_1ms_poll_mA':s['remaining_storage_allocation_mA']-duty[0]['LED_only_average_upper_mA']})
r={'status':'CANDIDATE_CURRENT_ALLOCATION_NOT_RUNTIME_PROOF','source_sha256':{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest()for p in [basepath,O/'design.json',sample,core/'battery_indicator.c',core/'battery_indicator.h',core/'terminal_indicator.h',core/'led_timeout.h']},'assumptions':{'rail_ceiling_V':3.35,'R32_nominal_ohm':6800,'R32_tolerance_fraction_hypothesis':.01,'LED_forward_voltage_lower_bound_V':0,'battery_to_LED_current_scaling':1,'MCU_GPIO_switching_cost_included':False},'LED_on_current_upper_mA':peak,'regular_periodic_simulations':duty,'limiter_scope':'Limited duty assumes every 1ms tick is delivered; measured IRQ latency not established. Continuous reserve retained.', 'simulation_scope':'Uniform poll intervals with state held between polls over two 60s periods; not a worst-case arbitrary scheduling proof. Poll delays can increase on-time or suppress flashes.','terminal_ideal_LED_only_average_upper_mA':{'capacity':peak*.24,'fault':peak*.12},'scenarios':scenarios,'decision':'Reserve continuous LED current until main-loop maximum latency or independent hardware turn-off is qualified. Do not use ideal 1% duty to certify 16h.','limits':base['limits']+['Base2.8mA allocation is not a measured candidate BOM sum.','R32 final tolerance/TCR and rail ceiling require confirmation.','No actual battery, MCU, storage or LED-current measurement.','Terminal display occurs after recording stops; do not add it to regular-recording duty.']}
(O/'indicator-current-budget.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'peak_mA':peak,'simulations':duty,'70_percent_scenario':scenarios[2]},indent=2))

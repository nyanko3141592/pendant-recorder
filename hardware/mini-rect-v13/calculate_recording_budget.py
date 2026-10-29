"""Design allocations and sensitivities, deliberately not runtime predictions."""
from pathlib import Path
import json,hashlib
P=Path(__file__).resolve().parent; root=P.parents[1]
capacity=100;usable=.70;hours=16;period=5;storage_budget=1.2
rows=[]
for active,idle in [(50,.25),(115,.265),(218.18,.25)]:
 duty=(storage_budget-idle)/(active-idle)
 rows.append(dict(active_mA_hypothesis=active,idle_mA_hypothesis=idle,max_active_fraction=duty,max_active_ms_per_5s=1000*period*duty,note='Two-state sensitivity, not actual card performance or a peak-current approval'))
sources=['firmware/stm32/board/system_clock.c','firmware/stm32/app/main.c','firmware/stm32/app/cooperative-link-result.json']
r=dict(status='ALLOCATION_ONLY_NOT_16H_PREDICTION',battery_mAh=capacity,usable_fraction_assumed=usable,required_hours=hours,maximum_average_battery_mA=capacity*usable/hours,
 allocations_mA=dict(microphone_and_clock=.5,mcu_dma_codec_crypto_ram=1.6,storage=storage_budget,power_support=.4,reserve=.3),
 firmware=dict(cpu_Hz=16000000,source='HSI',voltage_scaling='Range4',idle='WFI Sleep, not Stop2',systick_period_ms=1,cooperative_chunk_seconds=period,files_per_16h=int(hours*3600/period),files_per_36h=int(36*3600/period),fixed_per_file_work_rate_vs_legacy=2,default_configuration='Legacy10s unless cooperative flags supplied'),
 storage_sensitivity=rows,
 illustrative_total_current_runtime=[dict(average_battery_mA=i,hours=capacity*usable/i) for i in [4,4.375,5,6,8]],
 source_sha256={s:hashlib.sha256((root/s).read_bytes()).hexdigest() for s in sources},
 caveats=['Usable70% is an assumption, not measured capacity above regulator dropout','No exact card qualified for peak current or average storage allocation','HSI and enabled peripherals differ from datasheet MSI/all-peripherals-disabled Sleep tables; do not use those figures as application current','Five-second buffering improves finite stall tolerance but has no demonstrated energy savings','Include crypto setup, RNG startup, FAT metadata, flush/busy, standby and startup in complete-cycle measurement','16h and36h uninterrupted recording still require physical qualification'])
(P/'recording-power-budget.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({'average_limit_mA':r['maximum_average_battery_mA'],'storage_sensitivity':rows},indent=2))

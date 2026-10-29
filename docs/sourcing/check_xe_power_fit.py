"""Battery-side screening under existing linear-regulator topology; no measurements."""
from pathlib import Path
import json,hashlib
P=Path(__file__).resolve().parent
root=P.parents[1];source=root/'docs/sourcing/xe-integrated-16h-budget.json'
current=json.loads(source.read_text())
capacity=current['battery']['nominal_capacity_mAh'];usable=current['battery']['planning_usable_fraction'];hours=16;average_limit=current['adopted_design_allocation']['whole_device_average_target_mA']
# Allocation reserves: hypotheses, not measured guaranteed values.
allocation=current['current_allocation_mA']
assert allocation['indicator_during_ordinary_recording_duty']==0.0
assert allocation['indicator_during_ordinary_recording_mA']==0.0
nonstorage_average=allocation['nonstorage_subtotal_hypothesis'];nonstorage_peak_reserve=20;pack_max=current['adopted_design_allocation']['whole_device_peak_limit_mA']
rows=[]
for active,idle in [(34,.06),(50,.1),(80,.135),(115,.265),(218.2,.25)]:
 budget=average_limit-nonstorage_average
 fraction=max(0,min(1,(budget-idle)/(active-idle)))
 rows.append(dict(storage_active_mA_hypothesis=active,storage_idle_mA_hypothesis=idle,total_peak_with20mA_reserve=active+nonstorage_peak_reserve,within110mA_peak_allocation=active+nonstorage_peak_reserve<=pack_max,max_active_ms_per5s_for_average_budget=round(fraction*5000,3),important='Active/idle examples are not guaranteed startup or programming bounds; no card approved.'))
r=dict(status='BATTERY_SELECTION_POWER_SCREEN_NOT_QUALIFIED',battery='DTP401525-XE',capacity_mAh=capacity,usable_fraction_hypothesis=usable,average_battery_limit_mA=average_limit,nonstorage_average_allocation_mA=nonstorage_average,storage_average_allocation_mA=average_limit-nonstorage_average,nonstorage_peak_reserve_mA=nonstorage_peak_reserve,storage_peak_allocation_mA=pack_max-nonstorage_peak_reserve,topology='Existing linear regulator: card current substantially passes through to battery; do not multiply by3.3/3.7 as if buck efficiency were known.',scenarios=rows,decision='110mAh is potentially feasible only with controlled storage power; generic microSD is not qualified. Prefer exact SKU with bound<=90mA inclusive startup or revise buffering/power architecture before selecting battery as fully compatible.',bench_acceptance=['Whole-system battery current never exceeds110mA over supplier specified conditions; no unsupported pulse allowance','Average<=4.4mA and <=70.4mAh/16h are design allocations only: actual16h acceptance uses measured usable pack energy and selected voltage cutoff','Record16h continuously and preserve>=36h storage without overflow or corruption','Capture startup, each write/busy interval, nearly full card, temperature/voltage endpoints and USB detach','Include connector/protection/LDO drops; pack2.4V cutoff cannot be assumed usable with3.3V regulator'],no_PCB_or_case_change=True)
r['current_budget_source']={'path':str(source.relative_to(root)),'sha256':hashlib.sha256(source.read_bytes()).hexdigest()}
r['additional_guard_and_BOR_reserve_mA']=allocation['temperature_guard_and_BOR_reserve']
r['LED_during_ordinary_recording_mA']=allocation['indicator_during_ordinary_recording_mA']
assert abs(r['storage_average_allocation_mA']-allocation['storage_total_allocation_at_4p4mA_target'])<1e-12
(P/'xe-power-fit.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

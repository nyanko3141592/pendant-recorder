"""Keep conservative budget; expose conditional benefit of verified indicator duty."""
from pathlib import Path
import json,hashlib
R=Path(__file__).resolve().parents[2]
bp=R/'hardware/xe-minimal/recording-current-budget.json';lp=R/'hardware/xe-minimal/fixed-usb-limit-trial/led-land-trial/indicator-current-budget.json'
b=json.loads(bp.read_text());l=json.loads(lp.read_text())
for report in [b,l]:
 for p,h in report['source_sha256'].items():assert hashlib.sha256((R/p).read_bytes()).hexdigest()==h,p
base=b['scenarios'][0]['base_nonstorage_allocation_mA']+b['scenarios'][0]['additional_guard_and_BOR_reserve_mA'];led=l['LED_on_current_upper_mA'];rows=[]
for fraction in [.6,.7,.8]:
 for duty in [1,.1,.01]:
  total_limit=110*fraction/16;storage=total_limit-base-led*duty
  active_ms=5000*(storage-.2)/(25-.2)
  rows.append({'usable_capacity_fraction_hypothesis':fraction,'LED_duty_hypothesis':duty,'nonstorage_allocation_mA':base+led*duty,'storage_budget_mA':storage,'max_storage_active_ms_per_5s_hypothesis':active_ms,'remaining_after_payload_only_ms':active_ms-b['payload_only_4MHz_ms']})
r={'status':'SENSITIVITY_NOT_ADOPTED_POWER_BUDGET','source_sha256':{str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest()for p in [bp,lp]},'rows':rows,'saved_16h_charge_1percent_vs_continuous_LED_mAh':led*.99*16,'limits':['The existing conservative screen remains unchanged.','1% duty is a scenario informed by periodic indicator simulations, not a guarantee for every terminal/fault/scheduling state.','2.8 mA base remains unmeasured; startup and storage busy energy unqualified.','Usable fraction after 4.1 V charge and 3.6 V stop is unknown.','No runtime or battery capacity claim follows from this sensitivity.']}
Path(__file__).with_name('xe-indicator-energy-sensitivity.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

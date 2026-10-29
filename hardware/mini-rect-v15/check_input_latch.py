"""Event-level check of candidate wiring. No analog/timing/USB compliance claim."""
from pathlib import Path
import json
P=Path(__file__).resolve().parent/'input-control';d=json.loads((P/'design.json').read_text());parts={p['ref']:p for p in d['parts']}
def net(r,n):return next(p['net'] for p in parts[r]['pins'] if p['number']==str(n))
assert net('U14',2)==net('U14',4)==net('U14',14)=='VBUS'
assert net('U14',6)==net('U13',4)=='USB_INPUT_ON'
assert net('U14',1)==net('U15',2)==net('Q7',3)=='USB_LATCH_CLEAR_N'
assert net('U14',3)==net('Q6',3)=='USB_LATCH_CLOCK'
assert net('Q6',1)==net('U1',12)=='USB_SUSPEND_PULSE'
assert net('Q7',1)==net('U1',19)=='USB_RESUME_PULSE'
assert net('Q5',1)==net('U1',13)=='USB_HIGH_BUDGET'
assert net('U13',5)=='VBUS' and net('U13',1)==net('U3',10)=='VBUS_LIMITED'
for r in ['R12','R37','R38','R40','C13','C29']:assert net(r,1)=='VBUS_LIMITED'
assert net('U12',8)=='VBUS_LIMITED'
assert net('R13',1)==net('U2',5)=='VBUS'
for r,g in [('R46','USB_HIGH_BUDGET'),('R49','USB_SUSPEND_PULSE'),('R50','USB_RESUME_PULSE')]:assert [net(r,1),net(r,2)]==[g,'GND']
# GPIO reset releases NMOS gates to pulldowns. RawVBUS/POR remains independent.
class Latch:
 def __init__(self):self.q=None;self.clock=1;self.trace=[]
 def step(self,name,por=False,suspend=False,resume=False,high=False):
  clock=int(not suspend);clear=int(not(por or resume))
  if not clear:self.q=0
  elif self.clock==0 and clock==1:self.q=1
  self.clock=clock
  enabled=None if self.q is None else not self.q
  self.trace.append(dict(event=name,POR_asserted=por,suspend_GPIO=suspend,resume_GPIO=resume,high_budget_GPIO=high,Q=self.q,input_enabled=enabled))
  return enabled
scenarios=[]
for reset_phase in ['after_pulse','during_low_phase']:
 x=Latch();assert x.step('attach_POR',por=True) is True;assert x.step('POR_release') is True
 assert x.step('configured',high=True) is True
 assert x.step('suspend_begin_inhibit_charge_and_low_budget') is True
 assert x.step('suspend_clock_low',suspend=True) is True
 if reset_phase=='after_pulse':assert x.step('suspend_clock_release') is False
 assert x.step('MCU_reset_or_battery_brownout') is False
 assert x.step('MCU_still_off_or_boot_defaults') is False
 assert x.step('valid_resume_clear',resume=True) is True
 assert x.step('resume_clear_release') is True
 assert x.step('suspend_low_again',suspend=True) is True
 assert x.step('suspend_release_again') is False
 assert x.step('VBUS_removed_below_supervisor_threshold',por=True) is True # logic only: no input power when detached
 assert x.step('VBUS_reattach_POR_release') is True
 scenarios.append({'name':reset_phase,'events':x.trace})
report={'status':'PASS_IDEAL_EVENT_MODEL','physical_parts':len(parts),'checks':['actual candidate net mapping','separate raw and limitedVBUS consumers','hardwareGPIO pulldowns','suspendOFF retained afterMCUreset','resetduringclocklow completesOFF','explicitresume and freshattach enable'], 'scenarios':scenarios,'limits':['Not transistor SPICE or measured electrical behavior','POR supply ramp/dip and timing not simulated','A crash before issuing suspend command is not handled by this latch','VBUS below supervisor threshold deliberately reinitializes; briefdip classification needs bench review','No proof of5Vcurrentbounds, USBsuspend timing, latch recovery margins or thermalguardpoweroffbackfeed']}
(P/'latch-event-review.json').write_text(json.dumps(report,indent=2)+'\n');print(report['status'],len(scenarios),'scenarios; wiring assertions passed')

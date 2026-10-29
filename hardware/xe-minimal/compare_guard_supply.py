"""Sensitivity comparison for a shared MCU/temperature-guard supply; not qualification."""
import json,itertools,math,hashlib
from pathlib import Path
P=Path(__file__).resolve().parent;raw=(P/'design.json').read_bytes();d=json.loads(raw);parts={p['ref']:p for p in d['parts']}
def r(ref):return float(parts[ref]['value'].split()[0].rstrip('k'))*1000
results={}
for name,supply in [('present_usb',[4.75,5.25]),('shared_logic_exploratory_5pct',[3.135,3.465])]:
 results[name]={}
 for label,top,bottom in [('cold','R38','R39'),('hot','R40','R41')]:
  rs=[];ts=[]
  for v,rt,rb,rpull,err in itertools.product(supply,[r(top)*.99,r(top)*1.01],[r(bottom)*.99,r(bottom)*1.01],[r('R37')*.99,r('R37')*1.01],[-.033,.033]):
   q=rb/(rt+rb)+err/v;rn=rpull*q/(1-q);rs.append(rn)
   for r25,beta in itertools.product([9900,10100],[3380*.99,3380*1.01]):ts.append(1/(1/298.15+math.log(rn/r25)/beta)-273.15)
  results[name][label]={'resistance_ohm':[min(rs),max(rs)],'constant_beta_temperature_C':[min(ts),max(ts)]}
 # NTC short maximizes divider current; comparator current excluded, separately budgeted.
 max_v=max(supply);imax=max_v/(r('R37')*.99)+max_v/((r('R38')+r('R39'))*.99)+max_v/((r('R40')+r('R41'))*.99)
 results[name]['divider_upper_current_uA']=imax*1e6;results[name]['logic_rail_charge_16h_mAh']=imax*1000*16
report={'status':'SHARED_SUPPLY_CANDIDATE_NOT_APPLIED','design_sha256':hashlib.sha256(raw).hexdigest(),'results':results,'proposed_net_changes':['U12.8, R37.1, R38.1, R40.1 and U12 local bypass positive to V3V3 together','Keep R12 charge-disable pullup on VBUS_LIMITED'],'advantage':'With a live MCU rail, USB insertion no longer power-cycles the comparator or divider references.','required_before_adoption':['Check actual 3.3V regulator tolerance and startup/brownout waveform','Specify and enforce MCU BOR threshold above comparator minimum operating voltage plus margin','Keep CHG_ALLOW low during reset/boot and until comparator readiness delay expires','Verify removal of USB also clears permission; retained-high hotplug is handled only if logic supply remains valid','Recalculate qualified sensor R-T envelope and comparator error at actual input common mode','Add comparator and divider consumption to battery-side budget through actual regulator efficiency'],'limits':['33mV offset-plus-hysteresis is a sensitivity allowance, not a guaranteed composite bound','Constant beta approximation and +/-1% NTC assumptions do not replace manufacturer R-T tolerances','3.3V +/-5% is an exploration range, not a measured or sourced rail specification','Logic-rail mAh is not battery mAh; regulator loss and voltage conversion not included','No hardware startup or cell temperature qualification claim']}
(P/'guard-supply-comparison.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(results,indent=2))

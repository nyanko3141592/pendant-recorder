"""DC interval/truth-table audit. Does not simulate MOS transients or qualify pack."""
import itertools,json,math
from pathlib import Path
P=Path(__file__).resolve().parent
d=json.loads((P/'design.json').read_text());ps={p['ref']:p for p in d['parts']}
def nets(ref):return {p['number']:p['net'] for p in ps[ref]['pins']}
assert nets('Q2')=={'1':'CHG_INHIBIT_GATE','2':'GND','3':'CHARGER_TS'}
assert nets('U12')['2']=='BAT_TS' and nets('U12')['3']=='TS_COLD_REF'
assert nets('U12')['5']=='BAT_TS' and nets('U12')['6']=='TS_HOT_REF'
assert nets('R12')=={'1':'VBUS','2':'CHG_INHIBIT_GATE'}
assert nets('Q4')=={'1':'CHG_ALLOW','2':'GND','3':'ALLOW_CHAIN_1'}
assert nets('Q5')=={'1':'TEMP_COLD_OK','2':'ALLOW_CHAIN_1','3':'ALLOW_CHAIN_2'}
assert nets('Q6')=={'1':'TEMP_HOT_OK','2':'ALLOW_CHAIN_2','3':'CHG_INHIBIT_GATE'}
truth=[dict(mcu_allow=a,cold_ok=c,hot_ok=h,charge_permitted=bool(a and c and h)) for a,c,h in itertools.product([0,1],repeat=3)]
# Ratio error covers divider resistors; +/-33mV is a conservative design allowance,
# not a published guaranteed total-error specification at every common-mode/VBUS.
res={}
for label,rbot in [('cold',12100),('hot',8250)]:
 vals=[]
 for rt,rb,rpull,vbus,error in itertools.product([9900,10100],[rbot*.99,rbot*1.01],[9900,10100],[4.75,5.25],[-.033,.033]):
  ratio=rb/(rt+rb)+error/vbus
  vals.append(rpull*ratio/(1-ratio))
 res[label]={'resistance_ohms_min':min(vals),'resistance_ohms_max':max(vals)}
 temps=[1/(1/298.15+math.log(r/r25)/beta)-273.15 for r,r25,beta in itertools.product(vals,[9000,11000],[2000,5000])]
 res[label]['temperature_c_sensitivity']=[min(temps),max(temps)]
assert res['cold']['temperature_c_sensitivity'][0]>0
assert res['hot']['temperature_c_sensitivity'][1]<45
assert res['hot']['resistance_ohms_max']<res['cold']['resistance_ohms_min']
# Open/short force comparator failure independently of MCU permission.
for vntc in [0,5]:assert not (vntc<5*12100/22100 and vntc>5*8250/18250)
report={'status':'CONDITIONAL_ANALYTICAL_PASS_NOT_RELEASE','truth_table':truth,'corners':res,'faults':{'ntc_open':'cold comparator low => inhibit','ntc_short':'hot comparator low => inhibit','mcu_reset':'R36 low => inhibit','comparator_por':'TLV7032 outputs low => inhibit','usb_absent':'charger has no input'},'assumptions':['NTC R25 9..11kohm, beta2000..5000K are exploratory bounds NOT supplier specs','Resistance1%; comparator effective error allowance33mV NOT a certified bound','VBUS4.75..5.25V; comparator table limits characterized1.8..5V, extend only after manufacturer confirmation','DC ideal switch logic only; off leakage, gate thresholds, startup timing and hardware failures require bench tests','Sensor thermal lag and self-heating not modeled'],'order_ready':False}
(P/'guard-analysis.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(res,indent=2))

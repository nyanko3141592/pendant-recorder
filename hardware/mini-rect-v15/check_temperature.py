"""Static candidate sensitivity. Does not qualify cell temperature or enable charge."""
import argparse,itertools,json,math,hashlib
from pathlib import Path
P=Path(__file__).resolve().parent
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--design',type=Path,default=P/'input-control-pa2-pb5/design.json')
parser.add_argument('--output',type=Path,default=P/'input-control-pa2-pb5/temperature-screen.json')
parser.add_argument('--candidate',choices=['NCP18XH103F03RB','NCU18XH103F60RB'],default='NCP18XH103F03RB')
args=parser.parse_args()
d=json.loads(args.design.read_text());ps={x['ref']:x for x in d['parts']}
assert ps['TH1']['value'].startswith('NCP18XH103F03RB'), 'Recheck model after actual sensor substitution'

def ohms(ref):
 s=ps[ref]['value'].split()[0]
 return float(s.rstrip('k'))*(1000 if s.endswith('k') else 1)
def nets(ref):return {x['number']:x['net'] for x in ps[ref]['pins']}
assert nets('TH1')=={'1':'BAT_TS','2':'GND'}
assert nets('U12')['2']=='BAT_TS' and nets('U12')['3']=='TS_COLD_REF'
assert nets('U12')['5']=='BAT_TS' and nets('U12')['6']=='TS_HOT_REF'
assert nets('U12')['1']==nets('U12')['7']=='CHG_GUARD_GATE'
assert nets('Q4')=={'1':'CHG_GUARD_GATE','2':'GND','3':'CHG_INHIBIT_GATE'}
assert nets('U3')['4']=='CHG_INHIBIT_GATE'
rows={}
for label,top,bottom in [('cold','R38','R39'),('hot','R40','R41')]:
 ts=[];rs=[]
 for a,b,c,r,beta,v,e in itertools.product([.99,1.01],[.99,1.01],[.99,1.01],[.99,1.01],[.99,1.01],[4.75,5.25],[-.033,.033]):
  rb=ohms(bottom)*b;rt=ohms(top)*a
  q=rb/(rt+rb)+e/v
  assert 0<q<1
  R=ohms('R37')*c*q/(1-q)
  T=1/(1/298.15+math.log(R/(10000*r))/(3380*beta))-273.15
  ts.append(T);rs.append(R)
 rows[label]={'corner_count':len(ts),'resistance_ohms':[min(rs),max(rs)],'sensor_temperature_beta_model_C':[min(ts),max(ts)]}
assert rows['cold']['sensor_temperature_beta_model_C'][0]>0
assert rows['hot']['sensor_temperature_beta_model_C'][1]<45
assert rows['cold']['sensor_temperature_beta_model_C'][1]<rows['hot']['sensor_temperature_beta_model_C'][0]
pmax=5.25**2/(4*ohms('R37')*.99)
faults={}
for label,ratio in [('open',1),('short',0)]:
 cold=ohms('R39')/(ohms('R38')+ohms('R39'));hot=ohms('R41')/(ohms('R40')+ohms('R41'))
 faults[label]={'ideal_charge_permission':hot<ratio<cold}
 assert not faults[label]['ideal_charge_permission']
r=dict(status='SENSITIVITY_ONLY_NOT_CHARGE_RELEASE',source_sha256=hashlib.sha256(args.design.read_bytes()).hexdigest(),corners=rows,excitation={'maximum_branch_uA':5.25/(ohms('R37')*.99)*1e6,'maximum_ntc_power_uW':pmax*1e6,'approx_unmounted_self_heating_C':pmax/.001},faults=faults,sources=[{'url':'https://datasheet.octopart.com/NCP18XV103E03RB-Murata-datasheet-137871357.pdf','author':'Murata','page':1,'qualification':'Manufacturer-authored Reference Only sheet, exact NCP18XH103F03RB row; not current guaranteed full R-T table'},{'url':'https://www.ti.com/lit/ds/symlink/tlv7042.pdf','page':9,'revision':'SLVSE13J','limits':'Dual comparator:8mV offset,25mV hysteresis maximum at stated test conditions'}],limitations=['B25/50 constant approximation below25C is not a guaranteed R-T tolerance curve','33mV allowance adds full25mV hysteresis and8mV offset; not a manufacturer-guaranteed total error at the actual low common-mode voltage or5.25V','Input-bias/leakage maxima over actual conditions not established','Temperature is sensor temperature; pad compression, PCB heating, thermal lag and sensor detachment can invalidate cell temperature inference','NTC open/short detected ideally; detached but electrically intact sensor is not detected','Manufacturer lifecycle and JLC supply not confirmed; do not release legacy part solely from this calculation','No charger permission firmware changed; actual charge current and termination pending'],order_ready=False)
r['source_design']=str(args.design.resolve())
r['candidate_model']=args.candidate
r['installed_design_value']=ps['TH1']['value']
r['supply_assumption_V']=[4.75,5.25]
r['temperature_excitation_beta_model']=[]
for temperature in [-40,-25,0,5,10,25,37,45,60,85]:
 values=[]
 for r25,beta,series,v in itertools.product([9900,10100],[3380*.99,3380*1.01],[ohms('R37')*.99,ohms('R37')*1.01],[4.75,5.25]):
  resistance=r25*math.exp(beta*(1/(temperature+273.15)-1/298.15))
  current=v/(series+resistance)
  values.append((current*1e6,current*resistance,current*current*resistance*1e6))
 r['temperature_excitation_beta_model'].append(dict(temperature_C=temperature,current_uA=[min(x[0] for x in values),max(x[0] for x in values)],voltage_V=[min(x[1] for x in values),max(x[1] for x in values)],max_power_uW=max(x[2] for x in values),qualified=False))
if args.candidate=='NCU18XH103F60RB':
 r['sources'][0]={'url':'https://www.mouser.com/datasheet/3/76/1/NCU18XH103F60RB.pdf','author':'Murata','printed_date':'05/02/2025','page':2,'qualification':'Distributor mirror; matching R25/B25-50 scalars do not prove full-temperature equivalence'}
 r['limitations'].append('NCU current/voltage derating curves not digitized or guaranteed here; no full-temperature limit PASS inferred')
r['limitations'].append('Sweep is a constant-beta sensitivity model, not measured data or a guaranteed R-T envelope')
args.output.write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({'corners':rows,'excitation':r['excitation'],'faults':faults},indent=2))

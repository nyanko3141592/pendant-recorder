"""Static candidate sensitivity. Does not qualify cell temperature or enable charge."""
import itertools,json,math,hashlib
from pathlib import Path
P=Path(__file__).resolve().parent
d=json.loads((P/'design.json').read_text());ps={x['ref']:x for x in d['parts']}
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
r=dict(status='SENSITIVITY_ONLY_NOT_CHARGE_RELEASE',source_sha256=hashlib.sha256((P/'design.json').read_bytes()).hexdigest(),corners=rows,excitation={'maximum_branch_uA':5.25/(ohms('R37')*.99)*1e6,'maximum_ntc_power_uW':pmax*1e6,'approx_unmounted_self_heating_C':pmax/.001},faults=faults,sources=[{'url':'https://datasheet.octopart.com/NCP18XV103E03RB-Murata-datasheet-137871357.pdf','author':'Murata','page':1,'qualification':'Manufacturer-authored Reference Only sheet, exact NCP18XH103F03RB row; not current guaranteed full R-T table'},{'url':'https://www.ti.com/lit/ds/symlink/tlv7042.pdf','page':9,'revision':'SLVSE13J','limits':'Dual comparator:8mV offset,25mV hysteresis maximum at stated test conditions'}],limitations=['B25/50 constant approximation below25C is not a guaranteed R-T tolerance curve','33mV allowance adds full25mV hysteresis and8mV offset; not a manufacturer-guaranteed total error at the actual low common-mode voltage or5.25V','Input-bias/leakage maxima over actual conditions not established','Temperature is sensor temperature; pad compression, PCB heating, thermal lag and sensor detachment can invalidate cell temperature inference','NTC open/short detected ideally; detached but electrically intact sensor is not detected','Manufacturer lifecycle and JLC supply not confirmed; do not release legacy part solely from this calculation','No charger permission firmware changed; actual charge current and termination pending'],order_ready=False)
(P/'temperature-screen.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({'corners':rows,'excitation':r['excitation'],'faults':faults},indent=2))

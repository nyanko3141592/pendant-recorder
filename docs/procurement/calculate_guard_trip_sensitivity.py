"""Current BOM, constant-beta sensitivity; NOT battery temperature qualification."""
import csv, hashlib, itertools, json, math
from pathlib import Path
root=Path(__file__).resolve().parents[2]
bom=root/'hardware/xe-minimal/bom.csv'
parts={r['Reference']:r for r in csv.DictReader(bom.open())}
def value(ref):
 s=parts[ref]['Part/value'].split()[0]
 return float(s[:-1])*1000 if s.endswith('k') else float(s)
rows=[]
for supply in [2.9,3.0,3.3*(1-.015),3.3*(1+.015)]:
 for error_mv in [0,8,22,33,39,50,72]:
  item={'supply_V':supply,'hypothetical_total_trip_error_mV':error_mv}
  for label,top,bottom in [('cold','R38','R39'),('hot','R40','R41')]:
   temperatures=[]
   for rt,rb,re,r25,beta,sign in itertools.product([.99,1.01],[.99,1.01],[.99,1.01],[9900,10100],[3380*.99,3380*1.01],[-1,1]):
    q=value(bottom)*rb/(value(top)*rt+value(bottom)*rb)+sign*error_mv/1000/supply
    if not 0<q<1:raise ValueError('Invalid threshold ratio')
    resistance=value('R37')*re*q/(1-q)
    temperatures.append(1/(1/298.15+math.log(resistance/r25)/beta)-273.15)
   item[label+'_sensor_C']=[min(temperatures),max(temperatures)]
  item['inside_0_to_45C_in_this_model']=item['cold_sensor_C'][0]>0 and item['hot_sensor_C'][1]<45
  rows.append(item)
result={'status':'SENSITIVITY_ONLY_NOT_QUALIFIED','source_bom_sha256':hashlib.sha256(bom.read_bytes()).hexdigest(),'sensor':parts['TH1']['Part/value'],'resistors_ohm':{ref:value(ref) for ref in ['R37','R38','R39','R40','R41']},'rows':rows,'limitations':['Supply values are scenarios, not a verified rail envelope during startup or brownout.','Error budgets are independent hypotheses; 39 mV does NOT bound TLV3691 because its 17 mV hysteresis is typical-only.','Constant B3380 model with +/-1% R25 and beta is not full manufacturer R-T tolerance data.','Comparator bias, common-mode effects, PCB leakage, contact lag and detachment are not included.','Temperatures describe sensor model, not measured cell temperature.','No circuit changes or charge authorization result from passing these scenario checks.']}
(root/'docs/procurement/xe-guard-trip-sensitivity.json').write_text(json.dumps(result,indent=2)+'\n')
for row in rows:
 if row['supply_V']==2.9:print(row)

"""Sensitivity only: offset at25C and beta approximation cannot certify trip limits."""
from pathlib import Path
import itertools,math,json
O=Path(__file__).resolve().parent
rows=[]
for supply in [2.9,3.3]:
 for name,bottom in [('cold',20000),('hot',7500)]:
  for offset in [0,.008,.0205]:
   temps=[];res=[]
   for a,b,c,r,beta,sign in itertools.product([.99,1.01],repeat=6):
    # first three independent divider tolerances, then R25/B tolerances.
    delta=-offset if sign==.99 else offset
    v=supply*(bottom*c)/(100000*b+bottom*c)+delta
    rt=100000*a*v/(supply-v)
    temps.append(1/(1/298.15+math.log(rt/(10000*r))/(3435*beta))-273.15);res.append(rt)
   rows.append({'assumed_supply_V':supply,'boundary':name,'assumed_total_input_error_V':offset,'sensor_resistance_range_ohm':[min(res),max(res)],'approximate_temperature_range_C':[min(temps),max(temps)]})
r={'status':'OFFSET_AND_SUPPLY_SENSITIVITY_NOT_THERMAL_QUALIFICATION','sensor':'103JT-025','rows':rows,'evidence':{'TI_product_page':'https://www.ti.com/product/TLV7042','listed_offset_max_at25C_mV':8},'assumptions':['2.9V and3.3V are sensitivity points, not qualified supply extrema.','20.5mV=8mV offset+25mV/2 hysteresis per RevJ at specified supply/common-mode conditions; application common-mode bound remains unverified.','Beta3435 with independent1% B andR25 is approximate, particularly below25C.','Divider resistors independently1%.'], 'excluded':['Actual common-mode and supply dependence beyond datasheet test conditions','Bias/leakage and PCB contamination','Sensor R-T tolerance curve and installed thermal lag','Measured trip/recovery and cell temperature'],'no_circuit_change':True}
(O/'film-temperature-offset-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))

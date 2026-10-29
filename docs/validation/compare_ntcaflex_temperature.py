"""Same-circuit beta sensitivity: 1% JT versus 2% NTCAFLEX R25."""
from pathlib import Path
import itertools,math,json,hashlib
O=Path(__file__).resolve().parent;R=O.parents[1]
rows=[]
for label,tol in [('103JT-025',.01),('NTCAFLEX05103GL',.02)]:
 for name,bottom,sign in [('cold_stop',20000,1),('cold_recover',20000,-1),('hot_stop',7500,-1),('hot_recover',7500,1)]:
  temps=[]
  for a,b,c,r,beta,offset,hys in itertools.product([.99,1.01],[.99,1.01],[.99,1.01],[1-tol,1+tol],[.99,1.01],[-.008,.008],[.003,.025]):
   v=3.3*bottom*c/(100000*b+bottom*c)+offset+sign*hys/2
   rt=100000*a*v/(3.3-v)
   temps.append(1/(1/298.15+math.log(rt/(10000*r))/(3435*beta))-273.15)
  rows.append({'sensor':label,'transition':name,'temperature_range_C':[min(temps),max(temps)]})
files=['docs/sourcing/xe-ntcaflex-alternative-review.json','hardware/xe-minimal/film-integration-trial/reconciled-candidate-bom.csv','docs/validation/check_film_temperature_direction.py']
result={'status':'COMPARATIVE_BETA_SENSITIVITY_NOT_CHARGE_LIMITS','rows':rows,'source_sha256':{p:hashlib.sha256((R/p).read_bytes()).hexdigest()for p in files},'model':{'supply_V':3.3,'sensor_pullup_ohm':100000,'reference_top_ohm':100000,'cold_bottom_ohm':20000,'hot_bottom_ohm':7500,'divider_tolerance_fraction':.01,'B_K':3435,'B_tolerance_fraction':.01,'offset_assumed_V':[-.008,.008],'hysteresis_assumed_V':[.003,.025]},'limits':['Same nominal circuit model, not fresh netlist validation or measured trip limits.','Comparator extrema at specified datasheet conditions do not bound application common-mode behavior.','Independent beta/R25 model is a screen; full manufacturer R-T tolerance and aging not included.','Thermal contact, lag, leakage, resistor temperature coefficients and rail variation excluded.','No sensor adoption or protection qualification.']}
(O/'xe-ntcaflex-temperature-comparison.json').write_text(json.dumps(result,indent=2)+'\n')
for row in rows:print(row)

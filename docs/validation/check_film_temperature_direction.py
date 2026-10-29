"""Directional comparator corner calculations for test planning, not cell limits."""
from pathlib import Path
import itertools,math,json,hashlib
O=Path(__file__).resolve().parent;root=O.parents[1]
p=root/'hardware/xe-minimal/fixed-usb-limit-trial/ncu-sensor-trial/pendant-xe-minimal.kicad_pcb'
rows=[]
for name,bottom,sign,sweep in [('cold_stop',20000,1,'increase resistance'),('cold_recover',20000,-1,'decrease resistance'),('hot_stop',7500,-1,'decrease resistance'),('hot_recover',7500,1,'increase resistance')]:
 rs=[];ts=[]
 for a,b,c,r,beta,offset,hys in itertools.product([.99,1.01],[.99,1.01],[.99,1.01],[.99,1.01],[.99,1.01],[-.008,.008],[.003,.025]):
  voltage=3.3*bottom*c/(100000*b+bottom*c)+offset+sign*hys/2
  resistance=100000*a*voltage/(3.3-voltage);rs.append(resistance);ts.append(1/(1/298.15+math.log(resistance/(10000*r))/(3435*beta))-273.15)
 rows.append({'transition':name,'resistance_sweep':sweep,'corner_resistance_ohm':[min(rs),max(rs)],'beta_temperature_C':[min(ts),max(ts)]})
r={'status':'DIRECTIONAL_TEST_PREDICTION_NOT_ACCEPTANCE_LIMIT','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'comparator':'U12 TLV7042DDFR','verified_pins':{'1':'CHG_GUARD_GATE','2':'BAT_TS','3':'TS_COLD_REF','4':'GND','5':'BAT_TS','6':'TS_HOT_REF','7':'CHG_GUARD_GATE','8':'V3V3'},'pin_definition_source':'TI RevJ Table4-2','assumed_supply_V':3.3,'rows':rows,'test_sequence':['Use a battery simulator and current-limited bench supply; no real cell for fault sweeps.','Start10kohm; verify gate and charge behavior, then increase to47kohm and sweep back through cold recovery.','Return10kohm; decrease to4.7kohm and sweep back through hot recovery.','Record measured resistance, BAT_TS, both reference voltages, rail, guard gate and charge current for each transition.','Repeat open/short sensor faults and power-up/brownout cases.'],'acceptance':'Stop transitions must inhibit charging and recovery must not oscillate. Numeric thresholds remain provisional until actual common-mode comparator error, sensor R-T bounds and cell thermal lag are resolved.','limits':['Comparator extrema taken from datasheet test conditions; actual common-mode bound not established.','Beta approximation and independent1% tolerances are only a screening model.','No physical results or charge-safety approval.']}
(O/'film-temperature-direction-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))

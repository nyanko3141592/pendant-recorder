"""Screening calculations only; assumed NTC values are NOT pack specifications."""
from pathlib import Path
import math,itertools,json
P=Path(__file__).parent
out={'assumptions':{'ntc_R25_ohm':10000,'ntc_R25_tolerance':.05,'beta_K':3370,'beta_tolerance':.03,'resistor_tolerance':.01,'comparator_offset_V':.010,'VBUS_V':[4.5,5.5]},'qualified':False}
for name,bottom in [('cold',12100),('hot',8250)]:
 vals=[]
 for rtop,rbottom,rpull,r25,beta,vbus,offset in itertools.product([9900,10100],[bottom*.99,bottom*1.01],[9900,10100],[9500,10500],[3370*.97,3370*1.03],[4.5,5.5],[-.010,.010]):
  ratio=rbottom/(rtop+rbottom)+offset/vbus;R=rpull*ratio/(1-ratio);T=1/(1/298.15+math.log(R/r25)/beta)-273.15;vals.append(T)
 out[name]={'nominal_C':round(1/(1/298.15+math.log(bottom/10000)/3370)-273.15,2),'assumed_tolerance_range_C':[round(min(vals),2),round(max(vals),2)]}
out['runtime']={'capacity_mAh':100,'usable_fraction_assumption':.70,'target_hours':16,'average_current_limit_mA':100*.7/16,'proven':False}
out['limitations']=['No thermal lag/self-heating/NTC curve deviation/comparator hysteresis or transient simulation','Battery vendor values and charging envelope unknown','100mAh capacity and70% usable fraction are assumptions; firmware and cell testing required']
(P/'review-calculations.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))

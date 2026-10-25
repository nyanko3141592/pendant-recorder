"""Analytical sensitivity only; XE beta/tolerances unknown, not a safety validation."""
import itertools,json,math
from pathlib import Path
def temperature(r,r25,beta):
 return 1/(1/298.15+math.log(r/r25)/beta)-273.15
out={'status':'NOT_QUALIFIED','assumptions':['10k NTC, beta3435K hypothetical; XE beta not specified','Illustrative R25 +/-1%, beta +/-1%; not confirmed pack tolerances','Independent worst-case IC limits; no SPICE or measurements'], 'source':'https://www.ti.com/lit/ds/symlink/bq25170.pdf'}
for label,volts in [('cold',[.990,1.090]),('hot',[.176,.200])]:
 vals=[temperature(v/i,r,b) for v,i,r,b in itertools.product(volts,[36.5e-6,39.5e-6],[9900,10100],[3435*.99,3435*1.01])]
 out[label+'_trip_c']={'min':round(min(vals),2),'max':round(max(vals),2)}
out['charge_ma_with_13k7_1pct']={'min':round(270/(13700*1.01)*1000,3),'typ':round(300/13700*1000,3),'max':round(330/(13700*.99)*1000,3)}
out['conclusion']='Direct NTC connection does not establish a guaranteed 0..45C charging window. Need confirmed NTC curve and margin design.'
Path(__file__).with_name('temperature-corners.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))

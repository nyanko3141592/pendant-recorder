"""MAX4995C resistor-corner screen, NOT USB compliance or circuit simulation.

Datasheet Rev3 p3-4 gives (R[kohm]+2.48)*I[mA] =26138/29042/31946
at VIN=3.3V, VIN-VOUT=1V. Do not extrapolate bounds to 5V as guarantees.
"""
from pathlib import Path
import itertools,json
P=Path(__file__).resolve().parent

def current(r,k): return k/(r+2.48)
def parallel(a,b): return a*b/(a+b)
rows=[]
for mode in ['startup','configured']:
    values=[]
    for ta,tb,k in itertools.product([.99,1.01],[.99,1.01],[26138,31946]):
        r=390*ta if mode=='startup' else parallel(390*ta,100*tb)
        values.append(current(r,k))
    r=390 if mode=='startup' else parallel(390,100)
    rows.append(dict(mode=mode,nominal_mA=current(r,29042),min_mA=min(values),max_mA=max(values)))
result={
 'status':'ENGINEERING_SCREEN_NOT_5V_GUARANTEE',
 'source':'https://www.analog.com/media/en/technical-documentation/data-sheets/max4995a-max4995c.pdf',
 'part':'MAX4995CAUT+T','package':'SOT-23-6',
 'resistors_kohm':{'permanent':390,'switched_parallel':100,'tolerance_percent':1},
 'conditions':'VIN=3.3V,VIN-VOUT=1V; full datasheet temperature range; switch resistance/leakage and PCB parasitics not included',
 'modes':rows,
 'operating_policy':'Low mode until configured; high mode only under500mA configuration; suspend switch off with retained shutdown state',
 'limitations':[
 '3.3V specified current-limit extrema are not guaranteed5V extrema',
 'Iq300uA maximum is specified at3.3V, not a full5V total-input bound',
 'SETI capacitance must remain below20pF; switched resistor path leakage/capacitance must be reviewed',
 'Transient overshoot and capacitor charging are not bounded by this DC calculation',
 'Suspend shutdown must survive MCU brownout/reset, so a simple GPIO pull-down alone is insufficient',
 'No schematic/PCB/FW integration or charging permission is provided by this screen']}
(P/'input-limiter-screen.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))

#!/usr/bin/env python3
"""Parameter sweep, not SPICE or a measured hardware prediction."""
import csv,json
from pathlib import Path
p=Path(__file__).parent
rows=[dict(capacity_mAh=c,usable_fraction=f,average_mA=i,runtime_h=round(c*f/i,3),passes_16h=c*f/i>=16) for c in [110,150] for f in [.6,.7,.8] for i in [3,3.5,4,4.5,5,5.5,6,6.5,7,8]]
with (p/'runtime.csv').open('w') as o:
 w=csv.DictWriter(o,fieldnames=rows[0]);w.writeheader();w.writerows(rows)
# Explicit workload assumptions; no typical current is silently represented as measured.
scenarios={'target':{'base_mA':.8,'cpu_increment_mA':8,'cpu_duty':.1,'sd_increment_mA':30,'sd_duty':.05},'sd_busy':{'base_mA':.8,'cpu_increment_mA':8,'cpu_duty':.1,'sd_increment_mA':30,'sd_duty':.12},'cpu_and_sd_busy':{'base_mA':.8,'cpu_increment_mA':8,'cpu_duty':.2,'sd_increment_mA':30,'sd_duty':.12}}
for s in scenarios.values():
 s['average_mA']=s['base_mA']+s['cpu_increment_mA']*s['cpu_duty']+s['sd_increment_mA']*s['sd_duty']
 s['110mAh_70pct_hours']=77/s['average_mA']
result={'status':'ASSUMPTION_SWEEP_NOT_HARDWARE_SIMULATION','scenarios':scenarios,'storage_36h_ADPCM_payload_bytes':1024*16000/2041*36*3600,'note':'base and incremental currents are budget scenarios at battery terminals, not component datasheet claims. No measured duty cycles, voltage curve, LDO dropout, temperature or firmware timing model.'}
(p/'results.json').write_text(json.dumps(result,indent=2)+'\n')
svg=['<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="640" viewBox="0 0 1000 640"><rect width="1000" height="640" fill="#101827"/><g font-family="sans-serif" fill="white"><text x="60" y="48" font-size="25">Recording runtime: sensitivity analysis</text><text x="60" y="78" font-size="16">70% usable capacity assumed / NOT measured or SPICE</text>']
x=lambda i:100+(i-3)*155
y=lambda h:530-h*11
for h in [0,8,16,24,32]:
 svg.append(f'<path d="M100 {y(h)} H875" stroke="{"#efbc50" if h==16 else "#334155"}"/><text x="48" y="{y(h)+5}">{h} h</text>')
for i in range(3,9):svg.append(f'<text x="{x(i)-12}" y="560">{i}</text>')
for c,col in [(110,'#52d9c1'),(150,'#91aaff')]:
 pts=' '.join(f'{x(i/10)},{y(c*.7/(i/10))}' for i in range(30,81))
 svg.append(f'<polyline points="{pts}" fill="none" stroke="{col}" stroke-width="4"/>')
svg+=['<text x="400" y="595">Average battery current (mA)</text><text x="620" y="110" fill="#52d9c1">110mAh: 16h at 4.81mA</text><text x="620" y="138" fill="#91aaff">150mAh: 16h at 6.56mA</text></g></svg>']
(p/'runtime.svg').write_text(''.join(svg))
print(json.dumps(result,indent=2))

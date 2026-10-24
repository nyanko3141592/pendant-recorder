import json,math
from pathlib import Path
P=Path(__file__).parent
out={'method':'Arithmetic and axis-aligned envelope checks, NOT SPICE, battery discharge simulation or measurements','assumptions':{'capacity_mah':110,'nominal_usable_fraction':.7,'target_battery_current_ma':4,'height_tolerance_mm':.2,'case_tolerance_mm':.2,'continuous_recording':True},'storage':{}}
# 1024-byte standard IMA ADPCM blocks contain 2041 mono samples. Per 10s independent file rounded upward.
blocks=math.ceil(16000*10/2041);size=blocks*1024+60;age_overhead=512+16*math.ceil(size/65536);fsbytes=math.ceil((size+age_overhead)/4096)*4096
out['storage']={'sample_rate':16000,'channels':1,'ima_block_bytes':1024,'samples_per_block':2041,'segment_seconds_assumed':10,'age_header_budget_bytes':512,'allocated_bytes_per_segment_4k':fsbytes,'hours36_bytes':fsbytes*360*36,'capacity_4GB_hours_before_reserve':4e9/fsbytes/360,'note':'Header size and allocation are budget assumptions. Firmware/crypto integration not implemented; no silence omission.'}
out['workload_sensitivity']=[]
for base in [.8,1.2,2]:
 for cpu in [.05,.1,.2]:
  for sd in [.02,.05,.12]:
   i=base+8*cpu+30*sd
   out['workload_sensitivity'].append({'base_ma_assumed':base,'cpu_extra_ma_assumed':8,'cpu_duty':cpu,'sd_extra_ma_assumed':30,'sd_duty':sd,'average_ma':i,'runtime_h':77/i})
for v,pz,T,px in [('a',2.9,8.9,19),('b',8.6,14.5,1)]:
 parts=json.loads((P/f'{v}-envelopes.json').read_text());mic=next(p for p in parts if p['ref']=='U8');port=json.loads((P.parents[1]/f'hardware/compact-{v}/mic-port.json').read_text())[0];mic['x']=px+port['x'];mic['y']=4+port['y'];collisions=[]
 # Duct from mic envelope center to outer side, conservative full-volume reservation.
 for p in parts:
  if p['ref']=='U8':continue
  if v=='b' and p['x']+p['w']/2>mic['x'] and p['x']-p['w']/2<px+19 and abs(p['y']-mic['y'])<(p['d']+1.6)/2 and p['z']<6.9 and p['z']+p['h']>5.8:collisions.append(p['ref'])
 out[v]={'usb_to_lid_nominal_mm':round(T-1-(pz+.8+3.56),3),'usb_to_lid_after_assumed_tolerances_mm':round(T-1-(pz+.8+3.56)-.4,3),'duct_envelope_conflicts':collisions,'battery_top_mm':5.5,'pcb_bottom_mm':pz,'mic_hole_position':'Registered to KiCad U8 NPTH pad, 0.6mm','fit_status':'NOT_QUALIFIED'}
(P/'analysis.json').write_text(json.dumps(out,indent=2))
# Standalone vector arithmetic plot
s=['<svg xmlns="http://www.w3.org/2000/svg" width="900" height="500" viewBox="0 0 900 500"><rect width="900" height="500" fill="#f4f6f8"/><g font-family="sans-serif" fill="#23313e"><text x="60" y="35" font-size="23">110 mAh: continuous-recording runtime sensitivity</text><text x="60" y="62" font-size="15">Arithmetic assumptions only / identical battery in A and B / not measured</text>']
for h in [8,12,16,20,24,28,32]:
 y=430-(h-8)*12;s.append(f'<path d="M80 {y} H820" stroke="#ccd3da"/><text x="35" y="{y+5}">{h}h</text>')
for u,col in [(.6,'#b07040'),(.7,'#27786c'),(.8,'#4779a8')]:
 pts=' '.join(f'{80+(i-3)*148},{430-(110*u/i-8)*12}' for i in [3,3.5,4,4.5,5,5.5,6,7,8]);s.append(f'<polyline points="{pts}" fill="none" stroke="{col}" stroke-width="3"/><text x="{100+int((u-.6)*2000)}" y="90" fill="{col}">Usable {u:.0%}</text>')
for i in range(3,9):s.append(f'<text x="{80+(i-3)*148}" y="460">{i}mA</text>')
s.append('</g></svg>');(P/'runtime.svg').write_text(''.join(s))
print(json.dumps(out['storage']));print(out['a']);print(out['b'])

from pathlib import Path
import json,hashlib
P=Path(__file__).parent
source=Path('/tmp/pendant-cap.html').read_text()
pos=source.index('"graphType" : "DCBias"');start=source.rfind('{',0,pos)
graph,_=json.JSONDecoder().raw_decode(source[start:])
part=graph['selectPartsList'][0];assert part['partsName']=='CL10A106KP8NNN'
points=[(float(p['x']),float(p['y'])) for p in part['chartList'][0]['data']]
def interp(v):
 for (x,y),(xx,yy) in zip(points,points[1:]):
  if x<=v<=xx:return y+(yy-y)*(v-x)/(xx-x)
 raise ValueError(v)
values=[]
for v in [3.3,4.2,4.5,4.65,5.0]:
 delta=interp(v);typical=10*(1+delta/100)
 values.append({'bias_V':v,'typical_delta_percent':delta,'typical_uF':typical,'screen_with_minus10pct_tolerance_minus15pct_temperature_uF':typical*.9*.85})
r={'part':'CL10A106KP8NNNC','refs':['C4','C15'],'source':'https://product.samsungsem.com/mlcc/CL10A106KP8NNN.do','retrieved':'2026-10-25','source_sha256':hashlib.sha256(source.encode()).hexdigest(),'manufacturer_nominal':'10uF 10V X5R +/-10percent 0603','measurement':{'temperature_C':part['degC'],'frequency_Hz':part['dsDcFre'],'AC_Vrms':part['dsDcSign']},'interpolated_values':values,'requirement':'BQ25185 SYS nominal10uF and effective >=1uF','conclusion':'Typical-curve screening has margin above1uF; not guaranteed minimum capacitance. Combined voltage/temperature effects, aging and lot spread require qualification.','qualified':False}
(P/'evidence/sys-cap-dc-bias.json').write_text(json.dumps(graph,indent=2)+'\n')
(P/'sys-capacitance-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(values,indent=2))

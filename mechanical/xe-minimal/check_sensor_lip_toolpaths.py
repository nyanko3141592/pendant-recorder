"""Check whether sampled thin CAD intervals survive nominal slicing."""
from pathlib import Path
import runpy,contextlib,io,sys,json,math,hashlib
from shapely.geometry import LineString
O=Path(__file__).resolve().parent
sys.argv=['check','--lower','film-sensor-clearance-200um-lower-first018','--separator','film-sensor-clearance-200um-supported-flipped-separator','--output','film-sensor-clearance-200um-mating-review.json']
with contextlib.redirect_stdout(io.StringIO()):state=runpy.run_path(str(O/'check_lead_wrap_full_mating.py'))
p=O/'film-sensor-clearance-200um-sections.json';sections=json.loads(p.read_text());angle=math.radians(-28)
def xy(x,y):return (7.6+x*math.cos(angle)-y*math.sin(angle),-25.5+x*math.sin(angle)+y*math.cos(angle))
rows=[]
for row in sections['changed_probes']:
 for x0,x1 in row['intervals_x_mm']['after']:
  if x1-x0>.301:continue
  ray=LineString([xy(x0,row['sensor_local_y_mm']),xy(x1,row['sensor_local_y_mm'])]);z=row['assembly_z_mm']
  layers=[q for q in state['parts'][row['part']] if q['bottom']+1e-7<z<q['top']-1e-7]
  if not layers:continue
  covered=max(q['area'].intersection(ray).length for q in layers)
  rows.append({'part':row['part'],'local_y_mm':row['sensor_local_y_mm'],'z_mm':z,'x_interval_mm':[x0,x1],'cad_length_mm':x1-x0,'commanded_bead_coverage_mm':covered,'fraction':covered/(x1-x0)})
r={'status':'THIN_INTERVAL_TOOLPATH_SCREEN_NOT_RETENTION_APPROVAL','sources':state['sources'],'sections_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'probes':rows,'missing_probes':sum(q['commanded_bead_coverage_mm']<1e-7 for q in rows),'limits':['Only changed CAD intervals <=0.301mm at sampled transverse planes.','Layer boundaries are excluded to avoid double counting.','Commanded bead coverage is not measured material or retention strength.','Support residue, sag, shrinkage and load paths are excluded.']}
(O/'film-sensor-clearance-200um-lip-toolpaths.json').write_text(json.dumps(r,indent=2)+'\n')
print('probes',len(rows),'missing',r['missing_probes'])
for part in ('lower','separator'):
 subset=[q for q in rows if q['part']==part];print(part,'count',len(subset),'missing',sum(q['commanded_bead_coverage_mm']<1e-7 for q in subset),'min fraction',min(q['fraction'] for q in subset))

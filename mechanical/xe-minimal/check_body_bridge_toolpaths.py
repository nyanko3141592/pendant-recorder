"""Screen body bridge roof continuity in nominal part beads, not supports."""
from pathlib import Path
import runpy,contextlib,io,sys,json,math
from shapely.geometry import LineString
O=Path(__file__).resolve().parent
sys.argv=['check','--lower','film-sensor-clearance-200um-lower-first018','--separator','film-sensor-body-bridge-supported-flipped-separator','--output','film-sensor-body-bridge-mating-review.json']
with contextlib.redirect_stdout(io.StringIO()):state=runpy.run_path(str(O/'check_lead_wrap_full_mating.py'))
a=math.radians(-28)
def xy(x,y):return (7.6+x*math.cos(a)-y*math.sin(a),-25.5+x*math.sin(a)+y*math.cos(a))
rows=[]
for center in (4,12):
 for dy in (-.4,0,.4):
  ray=LineString([xy(-2.65,center+dy),xy(2.65,center+dy)])
  for layer in state['parts']['separator']:
   z=(layer['bottom']+layer['top'])/2
   if not -1.62+1e-7<z<-1.02-1e-7:continue
   hit=layer['area'].intersection(ray)
   rows.append({'bridge_y_mm':center,'axial_offset_mm':dy,'z_mid_mm':z,'coverage_mm':hit.length,'required_span_mm':ray.length,'missing_span_mm':max(0,ray.length-hit.length)})
assert rows
r={'status':'NOMINAL_BRIDGE_ROOF_SCREEN_NOT_RETENTION_APPROVAL','sources':state['sources'],'probes':rows,'incomplete_span_probes':sum(q['missing_span_mm']>.01 for q in rows),'limits':['Three transverse rays per bridge at layer midplanes; does not prove continuous 3D strength.','Supports excluded; sag and support residue unmeasured.','Axial restraint, body contact, assembly and force still unresolved.']}
(O/'film-sensor-body-bridge-toolpaths.json').write_text(json.dumps(r,indent=2)+'\n')
print('roof probes',len(rows),'incomplete',r['incomplete_span_probes'])
print('mating overlaps',len(state['r']['overlaps']),'contact area',sum(q['contact_area_mm2'] for q in state['r']['contacts']))

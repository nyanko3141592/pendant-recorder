"""Compare provisional joint boxes to transformed printed part bead prisms."""
from pathlib import Path
import runpy,contextlib,io,json,math
from shapely.geometry import Polygon
O=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):state=runpy.run_path(str(O/'check_flipped_full_mating.py'))
rows=[];a=math.radians(-28)
def xy(x,y):return (7.6+x*math.cos(a)-y*math.sin(a),-25.5+x*math.sin(a)+y*math.cos(a))
for center in [-.9,.9]:
 poly=Polygon([xy(x,y)for x,y in [(center-.55,23.2),(center+.55,23.2),(center+.55,26),(center-.55,26)]])
 zmin,zmax=-2.47,-1.37
 for name,layers in state['parts'].items():
  collisions=[];gaps=[]
  for layer in layers:
   depth=min(zmax,layer['top'])-max(zmin,layer['bottom'])
   if depth<=1e-7:continue
   area=poly.intersection(layer['area']).area
   if area>1e-7:collisions.append({'print_z_mm':layer['print_z'],'depth_mm':depth,'area_mm2':area,'volume_mm3':depth*area})
   gaps.append(poly.distance(layer['area']))
  rows.append({'joint_center_local_x_mm':center,'part':name,'collisions':collisions,'minimum_xy_gap_over_shared_z_mm':min(gaps)if gaps else None})
r={'status':'PRINTED_JOINT_BUDGET_SCREEN_NOT_INSULATION_QUALIFICATION','sources':state['sources'],'joint_envelope_mm':[1.1,2.8,1.1],'joint_center_z_mm':-1.92,'rows':rows,'limits':['Joint is a maximum process budget, not modeled actual tape/solder.','Rectangular bead sections and commanded widths are nominal.','Supports are excluded; removal residue, warping and joint tolerances untested.']}
(O/'film-printed-joint-envelope-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

from pathlib import Path
import json,re,math,hashlib,zipfile,xml.etree.ElementTree as ET
O=Path(__file__).resolve().parent;D=O/'home-case-slice-review/current-lower';p=D/'plate_1.gcode'
with zipfile.ZipFile(D/'current-lower.3mf') as archive:
 tree=ET.fromstring(archive.read('3D/3dmodel.model'));m=list(map(float,tree.find('.//{*}build/{*}item').attrib['transform'].split()))
x=y=z=0.;layer=None;width=.42;feature='';relative=False;old_e=0;paths={}
for line in p.read_text().splitlines():
 if line.startswith('; Z_HEIGHT:'):layer=float(line.split(':')[1])
 if line.startswith('; LINE_WIDTH:'):width=float(line.split(':')[1])
 if line.startswith('; FEATURE:'):feature=line.split(':',1)[1].strip()
 code=line.split(';')[0].strip();cmd=code.split(' ')[0];v={k:float(n)for k,n in re.findall(r'([XYZIJEF])(-?\d*\.?\d+)',code)}
 if cmd=='M83':relative=True
 if cmd=='M82':relative=False
 if cmd=='G92':old_e=v.get('E',old_e);continue
 if cmd not in ['G0','G1','G2','G3']:continue
 nx,ny,nz=v.get('X',x),v.get('Y',y),v.get('Z',z);de=v.get('E',0) if relative else v.get('E',old_e)-old_e
 if 'E'in v:old_e=v['E'] if not relative else old_e+v['E']
 points=[(x,y),(nx,ny)]
 if cmd in ['G2','G3'] and ('I'in v or 'J'in v):
  cx,cy=x+v.get('I',0),y+v.get('J',0);rad=math.hypot(x-cx,y-cy);a=math.atan2(y-cy,x-cx);end=math.atan2(ny-cy,nx-cx);sweep=(end-a)%(2*math.pi) if cmd=='G3'else-((a-end)%(2*math.pi));steps=max(2,math.ceil(abs(sweep)*rad/.01));points=[(cx+rad*math.cos(a+sweep*i/steps),cy+rad*math.sin(a+sweep*i/steps))for i in range(steps+1)]
 if de>0 and layer is not None and feature!='Custom' and any(math.dist(a,b)>1e-7 for a,b in zip(points,points[1:])):paths.setdefault(layer,[]).append((points,width,feature))
 x,y,z=nx,ny,nz

from shapely.geometry import LineString
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
heights=sorted(paths);assert len(heights)==50
selected=[heights[i]for i in [0,4,5,6,47,49]]
fig,axes=plt.subplots(2,3,figsize=(12,8));rows=[]
for height in heights:
 segments=paths[height];walls=[(pts,w,f)for pts,w,f in segments if 'wall' in f.lower()]
 assert walls,('no commanded wall paths',height)
 bead=unary_union([LineString(pts).buffer(w/2)for pts,w,f in walls])
 counts={}
 for pts,w,f in segments:counts[f]=counts.get(f,0)+1
 rows.append({'layer_top_mm':height,'wall_path_count':len(walls),'feature_path_counts':counts,'wall_bead_area_mm2':bead.area,'wall_bead_bounds_mm':list(bead.bounds)})
for ax,height in zip(axes.flat,selected):
 for pts,w,f in paths[height]:ax.plot(*zip(*pts),linewidth=.7,color='#247b87'if 'wall'in f.lower()else'#b6b6b6')
 ax.set_aspect('equal');ax.set_title(f'Layer top {height:.2f} mm');ax.set_xlabel('Bed X / mm');ax.set_ylabel('Bed Y / mm')
fig.suptitle('Lower case: commanded wall paths (teal) and other extrusion (gray)')
fig.tight_layout();fig.savefig(D/'wall-toolpath-review.png',dpi=140);plt.close(fig)
r={'status':'COMMAND_PATH_INVENTORY_NOT_MODEL_COVERAGE_OR_PRINT_APPROVAL','layers':rows,'rendered_layer_tops_mm':selected,'sources_sha256':{f:hashlib.sha256((D/f).read_bytes()).hexdigest()for f in ['plate_1.gcode','current-lower.3mf']},'limits':['Checks presence of commanded wall paths on all50layers, not wall continuity or STL coverage','Layers shown include bottom, floor transition and top closure region','Bead envelopes are nominal commanded width, not measured plastic','Pocket depth, print tolerances, adhesive intrusion and mechanical strength remain unqualified','No print job sent']}
(D/'wall-toolpath-review.json').write_text(json.dumps(r,indent=2)+'\n');print('Checked wall-path presence on',len(rows),'layers; rendered',selected)

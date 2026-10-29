from pathlib import Path
import json,re,math,hashlib,zipfile,xml.etree.ElementTree as ET,argparse
parser=argparse.ArgumentParser();parser.add_argument('--prefix',default='film-bridge');args=parser.parse_args()
O=Path(__file__).resolve().parent;D=O/('home-case-slice-review/'+args.prefix+'-separator');p=D/'plate_1.gcode'
with zipfile.ZipFile(D/(args.prefix+'-separator.3mf')) as archive:
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

from shapely.geometry import LineString,Point
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
assert paths, 'No extrusion layers parsed'
all_points=[p for segments in paths.values() for points,_,_ in segments for p in points]
x_bounds=(min(p[0] for p in all_points)-1,max(p[0] for p in all_points)+1)
y_bounds=(min(p[1] for p in all_points)-1,max(p[1] for p in all_points)+1)
plot_rows=math.ceil(len(paths)/4)
fig,axes=plt.subplots(plot_rows,4,figsize=(14,4*plot_rows),squeeze=False);rows=[];previous=None;anchors=[];ordered_anchors=[]
for ax,(height,segments) in zip(axes.flat,sorted(paths.items())):
 beads=unary_union([LineString(points).buffer(width/2)for points,width,feature in segments])
 unsupported=beads.difference(previous) if previous is not None else None
 if previous is not None:
  for points,width,feature in segments:
   if feature=='Bridge':
    line=LineString(points)
    anchors.append({'layer_top_mm':height,'start_xy':points[0],'end_xy':points[-1],'width_mm':width,'start_center_on_previous_bead':previous.covers(Point(points[0])),'end_center_on_previous_bead':previous.covers(Point(points[-1])),'start_distance_to_previous_bead_mm':previous.distance(Point(points[0])),'end_distance_to_previous_bead_mm':previous.distance(Point(points[-1])),'centerline_length_mm':line.length,'centerline_length_over_previous_bead_mm':line.intersection(previous).length})
 if previous is not None:
  earlier=[]
  for index,(points,width,feature) in enumerate(segments):
   line=LineString(points);bead=line.buffer(width/2)
   if feature=='Bridge':
    prior=unary_union(earlier) if earlier else None
    ends=[]
    for point in [points[0],points[-1]]:
     disk=Point(point).buffer(width/2)
     ends.append({'xy':point,'previous_layer_endpoint_bead_overlap_mm2':disk.intersection(previous).area,'earlier_same_layer_endpoint_bead_overlap_mm2':disk.intersection(prior).area if prior is not None else 0,'distance_to_earlier_same_layer_mm':Point(point).distance(prior) if prior is not None else None})
    ordered_anchors.append({'layer_top_mm':height,'extrusion_segment_index':index,'length_mm':line.length,'earlier_segments':len(earlier),'endpoints':ends})
   earlier.append(bead)
 features={}
 for points,width,feature in segments:
  features[feature]=features.get(feature,0)+1
  ax.plot(*zip(*points),color='#247b87',linewidth=.6)
 if unsupported is not None:
  for poly in ([unsupported] if unsupported.geom_type=='Polygon' else getattr(unsupported,'geoms',[])):
   if poly.geom_type=='Polygon' and not poly.is_empty:ax.fill(*poly.exterior.xy,color='#dc745d',alpha=.8)
 ax.set_aspect('equal');ax.set_title(f'Layer top {height:.2f} mm');ax.set_xlim(*x_bounds);ax.set_ylim(*y_bounds)
 rows.append({'layer_top_mm':height,'paths':len(segments),'features':features,'bead_area_mm2':beads.area,'area_without_previous_layer_bead_mm2':unsupported.area if unsupported is not None else None})
 previous=beads
for ax in list(axes.flat)[len(rows):]:ax.set_visible(False)
fig.suptitle('Raised-rib separator: paths / unsupported nominal bead area');fig.text(.05,.015,'Orange: no commanded bead directly below. Includes boundary differences; not predicted sag or physical support.',fontsize=10)
fig.tight_layout(rect=(0,.04,1,.95));fig.savefig(D/'rib-toolpath-review.png',dpi=150);plt.close(fig)
r={'status':'LAYER_SUPPORT_SCREEN_NOT_PRINT_QUALIFICATION','rows':rows,'bridge_endpoint_support':anchors,'ordered_same_layer_bridge_connections':ordered_anchors,'sources_sha256':{f:hashlib.sha256((D/f).read_bytes()).hexdigest() for f in ['plate_1.gcode',args.prefix+'-separator.3mf']},'limits':['Comparison is in bed coordinates; per-layer adjacent bead overlap only.','Extrusion width is nominal; unsupported area includes perimeter offsets and does not by itself mean failure.','Bridge orientation, anchoring, sag and retained sensor gap need review or physical test.','No printer operated.']}
r['bridge_support_interpretation']='Endpoint checks use previous-layer material only. Same-layer walls may anchor infill; absence of direct previous-layer support is not by itself an unanchored-print finding. Ordered same-layer bead overlaps are recorded separately; geometric connection does not prove deposited support or strength.'
bridge_rows=[(i,x) for i,x in enumerate(rows) if 'Bridge' in x['features']]
first_i,first_row=bridge_rows[0] if bridge_rows else (None,None)
r['findings']={'visual_review':'See PNG; visual inspection is recorded separately from generated metrics.','first_bridge_classified_layer_top_mm':first_row['layer_top_mm'] if first_row else None,'previous_layer_top_mm':rows[first_i-1]['layer_top_mm'] if first_i is not None and first_i>0 else None,'first_bridge_layer_unsupported_bead_area_mm2':first_row['area_without_previous_layer_bead_mm2'] if first_row else None,'slicer_bridge_feature_present':any('bridge' in f.lower() for x in rows for f in x['features']),'disposition':'Do not mark print-ready. A Bridge feature, if present, establishes slicer classification only. Actual4.7mm-span sag and anchoring need validation.'}
(D/'rib-toolpath-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))

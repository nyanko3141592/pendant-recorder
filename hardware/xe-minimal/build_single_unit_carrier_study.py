"""One current unit in a 70 mm carrier. Geometry study, not manufacturing data."""
from pathlib import Path
import json,hashlib
import cadquery as cq
from shapely.geometry import box
from shapely.ops import unary_union
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
P=Path(__file__).resolve().parent;s=P/'current-carrier-tab-screen.json';screen=json.loads(s.read_text());src=Path(screen['source'])
assert hashlib.sha256(src.read_bytes()).hexdigest()==screen['source_sha256']
ox,oy=23.,21.5;t=.8264
outer=box(0,0,70,70);window=box(ox-2,oy-2,ox+26,oy+29);unit=box(ox,oy,ox+24,oy+27)
tabs=[box(ox+c-2.5,oy+27,ox+c+2.5,oy+29) for c in [3.8,20.2]]
frame=outer.difference(window);carrier=unary_union([frame,unit]+tabs)
assert carrier.geom_type=='Polygon' and carrier.is_valid
hits=[]
for part in screen['local_courtyards']:
 x,y,X,Y=part['bounds'];area=box(x+ox,y+oy,X+ox,Y+oy).intersection(unary_union([frame]+tabs)).area
 if area>1e-8:hits.append({'ref':part['ref'],'overlap_mm2':area})
def block(bounds):
 x,y,X,Y=bounds;return cq.Workplane('XY').box(X-x,Y-y,t,centered=(False,False,False)).translate((x,y,0)).val()
shape=block(outer.bounds).cut(block(window.bounds)).fuse(block(unit.bounds))
for tab in tabs:shape=shape.fuse(block(tab.bounds))
shape=shape.clean();assert shape.isValid() and len(shape.Solids())==1
out=P/'single-unit-carrier-study.step';cq.exporters.export(shape,str(out))
fig,ax=plt.subplots(figsize=(7,7));ax.fill(*carrier.exterior.xy,color='#bbc7cc')
for ring in carrier.interiors:ax.fill(*ring.xy,color='white')
ax.fill(*unit.exterior.xy,color='#b5d8be');ax.text(35,35,'Current PCB\n24 x 27 mm',ha='center',va='center')
for tab in tabs:ax.fill(*tab.exterior.xy,color='#e9b560')
for part in screen['local_courtyards']:
 x,y,X,Y=part['bounds'];ax.plot([x+ox,X+ox,X+ox,x+ox,x+ox],[y+oy,y+oy,Y+oy,Y+oy,y+oy],color='#5d7267',lw=.35)
ax.set_aspect('equal');ax.set_xlim(-3,73);ax.set_ylim(73,-3);ax.set_xlabel('mm');ax.set_ylabel('mm');ax.set_title('One-unit carrier: 70 x 70 mm\nGeometry study — not released')
fig.text(.1,.015,'Orange: two 5 mm tabs. Sharp corners, tooling, fiducials and cutting process unresolved.',fontsize=8);fig.savefig(P/'single-unit-carrier-study.png',dpi=160);plt.close(fig)
r={'status':'CONNECTED_GEOMETRY_STUDY_NOT_MANUFACTURING_DATA','source_pcb_sha256':screen['source_sha256'],'carrier_size_mm':[70,70],'unit_origin_mm':[ox,oy],'unit_size_mm':[24,27],'nominal_route_gap_mm':2,'tabs':[{'bounds_mm':list(v.bounds),'width_mm':5} for v in tabs],'nominal_thickness_mm':t,'courtyard_frame_tab_overlaps':hits,'step_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'limits':['No current electrical PCB merged; STEP contains substrate only.','Sharp internal slot corners require router compensation/relief.','No tooling holes or fiducials included.','Two bottom tabs only: connectivity does not prove strength, vibration resistance or placement support.','Cut method, residual length tolerance and assembler acceptance not qualified.','One unit per carrier permits a five-unit population plan, but supplier minimum quantity and price remain unconfirmed.','Product board outline unchanged; external tab remnants require separate case fit review.']}
(P/'single-unit-carrier-study.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

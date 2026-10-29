"""Shared wire guide and separate cap; retention/friction not qualified."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
source=O/'film-wire-guide-space-review.json';r=json.loads(source.read_text())
files={'board':'film-sensor-depopulated-board-study.step','separator':'film-wide-bridge-separator-trial.step','lower':'wider-right-support-lower-trial.step','upper':'tab-clearance-upper-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()};rows=[];models=[]
for item in r['rows']:
 x=item['x_mm'];low=min(v[0] for v in item['channel_intervals_y_mm']);high=max(v[1] for v in item['channel_intervals_y_mm']);top=item['guide_top_z_mm'];bottom=-1.97
 blank=cq.Workplane('XY').box(.6,high-low+.8,top-bottom).translate((x,(low+high)/2,(top+bottom)/2)).val()
 # Shared slot extends down to-1.705; nominal wire floor .1mm below-1.605.
 floor=item['shared_floor_z_mm']
 cut=cq.Workplane('XY').box(.8,high-low,top-floor+.2).translate((x,(low+high)/2,(top+floor+.2)/2)).val()
 guide=blank.cut(cut);cap=cq.Workplane('XY').box(.6,high-low+.8,.4).translate((x,(low+high)/2,top+.2)).val()
 combined=guide.fuse(s['separator']);row={'x_mm':x,'shared_slot_y_mm':[low,high],'cap_thickness_mm':.4,'cap_top_z_mm':top+.4,'guide_board_overlap_mm3':guide.intersect(s['board']).Volume(),'cap_board_overlap_mm3':cap.intersect(s['board']).Volume(),'separator_solid_count':len(combined.Solids()),'valid':combined.isValid() and cap.isValid()};rows.append(row);models.append((combined,cap))
clear=[i for i,v in enumerate(rows) if v['guide_board_overlap_mm3']<1e-8 and v['cap_board_overlap_mm3']<1e-8 and v['valid'] and v['separator_solid_count']==1]
if clear:
 i=clear[0];guide,cap=models[i];cq.exporters.export(guide,str(O/'film-common-guide-separator-trial.step'));cq.exporters.export(cap,str(O/'film-common-guide-cap-trial.step'))
 a=cq.Assembly(name='common_wire_guide_candidate');a.add(guide,name='separator',color=cq.Color('#ddbb55'));a.add(cap,name='cap',color=cq.Color('#cc7799'));a.add(s['board'],name='board',color=cq.Color('#328866'));a.export(str(O/'film-common-guide-study.step'))
out={'status':'SHARED_GUIDE_GEOMETRY_NOT_STRAIN_RELIEF','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'rows':rows,'clear_rows':clear,'selected_row':clear[0] if clear else None,'limits':['Shared slot allows wire movement and cap does not establish frictional retention.','Cap attachment, glue thickness and assembly access not designed.','No qualified bend, print or placement tolerance.','0.6mm cap width is small; strength and handling remain unverified.','Do not transfer cap force to film sensor or battery.']}
(O/'film-common-guide-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))

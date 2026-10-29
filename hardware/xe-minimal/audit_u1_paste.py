"""Calculate U1 exposed-pad paste geometry from exported Gerber flashes."""
from pathlib import Path
import math,json,hashlib
from gerbonara import GerberFile
p=Path(__file__).resolve().parent/'fabrication-review-31ebfc3b1041'
copper=p/'gerbers/pendant-xe-minimal-B_Cu.gbl';paste=p/'gerbers/pendant-xe-minimal-B_Paste.gbp'
c=GerberFile.open(copper);g=GerberFile.open(paste)
ep=[o for o in c.objects if o.attrs.get('.P')==('U1','49')];assert len(ep)==1
assert type(ep[0].aperture).__name__=='RectangleAperture'
bounds=ep[0].bounding_box();(x0,y0),(x1,y1)=bounds
windows=[]
for o in g.objects:
 if o.attrs.get('.C')!=('U1',):continue
 (a,b),(d,e)=o.bounding_box()
 if a>=x0 and b>=y0 and d<=x1 and e<=y1:
  assert o.polarity_dark and o.aperture.macro.name=='RoundRect'
  radius=o.aperture.parameters[0];w=d-a;h=e-b
  area=w*h-(4-math.pi)*radius**2
  perimeter=2*(w+h)-8*radius+2*math.pi*radius
  windows.append({'bounds':[[a,b],[d,e]],'width_mm':w,'height_mm':h,'radius_mm':radius,'area_mm2':area,'perimeter_mm':perimeter})
assert len(windows)==16
for i,a in enumerate(windows):
 for b in windows[i+1:]:
  assert min(a['bounds'][1][0],b['bounds'][1][0])<=max(a['bounds'][0][0],b['bounds'][0][0]) or min(a['bounds'][1][1],b['bounds'][1][1])<=max(a['bounds'][0][1],b['bounds'][0][1])
ep_area=(x1-x0)*(y1-y0)
r={'status':'GEOMETRY_ONLY_STENCIL_NOT_QUALIFIED','source_sha256':{q.name:hashlib.sha256(q.read_bytes()).hexdigest() for q in (copper,paste)},'exposed_pad_bounds_mm':bounds,'exposed_pad_rectangle_area_mm2':ep_area,'window_count':len(windows),'total_paste_area_mm2':sum(w['area_mm2'] for w in windows),'paste_to_copper_area_ratio':sum(w['area_mm2'] for w in windows)/ep_area,'windows':windows,'minimum_area_to_wall_area_ratio_by_hypothetical_stencil_mm':{str(t):min(w['area_mm2']/(w['perimeter_mm']*t) for w in windows) for t in (.08,.10,.12)},'limitations':['Exposed copper pad treated as rectangle; no assembly acceptance claimed.','Stencil thickness, paste type, voiding, thermal result and other pads remain unqualified.']}
(p/'u1-paste-area-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r['window_count'],r['paste_to_copper_area_ratio'])

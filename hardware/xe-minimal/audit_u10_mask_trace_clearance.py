"""Local circular opening to straight-track clearance screen on bottom copper."""
from pathlib import Path
import json,hashlib,math
import pcbnew as k,wx
app=wx.App(False)
p=Path(__file__).resolve().parent;path=p/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(path));f=next(f for f in b.GetFootprints() if f.GetReference()=='U10');mm=k.ToMM
rows=[]
def distance(px,py,ax,ay,bx,by):
 dx=bx-ax;dy=by-ay;t=0 if dx*dx+dy*dy==0 else max(0,min(1,((px-ax)*dx+(py-ay)*dy)/(dx*dx+dy*dy)))
 return math.hypot(px-ax-t*dx,py-ay-t*dy)
for pad in f.Pads():
 if not pad.GetNumber():continue
 pos=pad.GetPosition();radius=mm(pad.GetSize().x)/2;assert pad.GetShape()==k.PAD_SHAPE_CIRCLE
 checked=[];connected=[]
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.B_Cu:continue
  assert not isinstance(t,k.PCB_ARC),'Arcs require separate geometric handling'
  a=t.GetStart();z=t.GetEnd();gap=distance(mm(pos.x),mm(pos.y),mm(a.x),mm(a.y),mm(z.x),mm(z.y))-radius-mm(t.GetWidth())/2
  row={'uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'gap_mm':gap}
  if t.GetNetCode()==pad.GetNetCode() and gap<=0:connected.append(row)
  else:checked.append(row)
 checked.sort(key=lambda x:x['gap_mm']);rows.append({'pad':pad.GetNumber(),'net':pad.GetNetname(),'nominal_opening_diameter_mm':2*radius,'minimum_nonoverlapping_track_gap_mm':checked[0]['gap_mm'],'minimum_different_net_track_gap_mm':min(t['gap_mm'] for t in checked if t['net']!=pad.GetNetname()),'nearest_tracks':checked[:3],'excluded_same_net_overlapping_tracks':connected})
r={'status':'LOCAL_STRAIGHT_TRACK_SCREEN_NOT_FULL_MASK_QUALIFICATION','source_pcb_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'source_mask_review':'u10-mask-source-review.json','screening_threshold_mm':.09,'all_different_net_gaps_at_least_threshold':all(row['minimum_different_net_track_gap_mm']>=.09-1e-6 for row in rows),'pads':rows,'limitations':['Uses current 1:1 circular mask openings; recheck if mask changes.','Tracks overlapping their own pad on the same net are excluded as intentional connections.','Other pads, vias, zones, registration shifts and mask fabrication tolerances are not covered.']}
(p/'u10-mask-trace-clearance.json').write_text(json.dumps(r,indent=2)+'\n');print([(row['pad'],row['minimum_different_net_track_gap_mm']) for row in rows])

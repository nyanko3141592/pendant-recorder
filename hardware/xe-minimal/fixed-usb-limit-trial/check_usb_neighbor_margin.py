"""Nominal cross-layer projection margin and hypothetical registration sensitivity."""
from pathlib import Path
import pcbnew as k,wx,json,math,hashlib,argparse
parser=argparse.ArgumentParser();parser.add_argument("--directory",default="usb-inner-neighbor-trial");args=parser.parse_args()
app=wx.App(False);O=Path(__file__).resolve().parent/args.directory;p=O/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p));rows=[]
for uid in ['02c2326c-3b01-4e6c-b9de-fc24784970d4','2a7ff8bf-961b-4c3b-a1fc-dad001d91a29']:
 v=next(t for t in b.GetTracks()if t.m_Uuid.AsString()==uid);q=v.GetPosition()
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA)or t.GetLayer()!=k.In2_Cu or t.GetNetname()not in ['/USB_DP','/USB_DM']:continue
  a,z=t.GetStart(),t.GetEnd();dx,dy=z.x-a.x,z.y-a.y;u=max(0,min(1,((q.x-a.x)*dx+(q.y-a.y)*dy)/(dx*dx+dy*dy)));d=math.hypot(q.x-(a.x+u*dx),q.y-(a.y+u*dy))
  if d>k.FromMM(.6):continue
  # Zone uses0.15mm clearance. Circular envelope is only a local screen.
  clearance=.15;distance=k.ToMM(d);radius=k.ToMM(v.GetWidth(k.In1_Cu))/2;half=k.ToMM(t.GetWidth())/2;margin=distance-radius-clearance-half
  rows.append({'via_uuid':uid,'via_net':v.GetNetname(),'via_xy_mm':[k.ToMM(q.x),k.ToMM(q.y)],'USB_uuid':t.m_Uuid.AsString(),'USB_net':t.GetNetname(),'nearest_segment_fraction':u,'center_to_segment_mm':distance,'via_copper_radius_mm':radius,'zone_clearance_mm':clearance,'USB_half_width_mm':half,'nominal_projection_margin_mm':margin,'sensitivity':[{'hypothetical_lateral_registration_shift_mm':shift,'remaining_margin_mm':margin-shift,'positive_margin':margin>shift}for shift in [0,.025,.05]]})
assert rows
r={'status':'NOMINAL_MARGIN_SCREEN_NOT_MANUFACTURING_TOLERANCE_APPROVAL','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'rows':rows,'limits':['25um and50um shifts are sensitivity cases, not vendor-guaranteed registration limits','Assumes circular via copper plus zone clearance envelope; actual filled polygon and custom rules may differ','Does not include etch, drill registration, pad-stack variation or signal field extent','Positive projection margin alone does not prove90ohm; negative sensitivity margin means the no-overlap geometric claim is not robust to that assumed shift']}
(O/'usb-neighbor-margin-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))

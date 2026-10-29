"""Subtract filled reference copper from exact rectangular straight-track footprint."""
from pathlib import Path
import pcbnew as k,wx,json,hashlib,math
app=wx.App(False);O=Path(__file__).resolve().parent;rows=[];sources={}
for directory in ['material-dk-trial']:
 p=O/directory/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p));sources[directory]=hashlib.sha256(p.read_bytes()).hexdigest()
 for uid in [t.m_Uuid.AsString()for t in b.GetTracks()if not isinstance(t,k.PCB_VIA)and t.GetNetname()in ['/USB_DP','/USB_DM']]:
  t=next(t for t in b.GetTracks()if t.m_Uuid.AsString()==uid);a,z=t.GetStart(),t.GetEnd();dx,dy=z.x-a.x,z.y-a.y;length=math.hypot(dx,dy);nx,ny=-dy/length,dx/length
  for margin in [0,.025]:
   half=t.GetWidth()/2+k.FromMM(margin);poly=k.SHAPE_POLY_SET();poly.NewOutline()
   for point,side in [(a,1),(z,1),(z,-1),(a,-1)]:poly.Append(round(point.x+nx*half*side),round(point.y+ny*half*side))
   for layer in ({k.F_Cu:[k.In1_Cu],k.B_Cu:[k.In4_Cu],k.In2_Cu:[k.In1_Cu,k.In3_Cu]}[t.GetLayer()]):
    ground=k.SHAPE_POLY_SET()
    for zone in b.Zones():
     if zone.GetNetname()=='/GND'and zone.IsOnLayer(layer):ground.BooleanAdd(zone.GetFilledPolysList(layer))
    missing=k.SHAPE_POLY_SET();missing.BooleanSubtract(poly,ground)
    rows.append({'board':directory,'net':t.GetNetname(),'uuid':uid,'signal_layer':b.GetLayerName(t.GetLayer()),'reference':b.GetLayerName(layer),'extra_margin_each_side_mm':margin,'rectangle_area_mm2':poly.Area()/1e12,'uncovered_area_mm2':missing.Area()/1e12,'empty_difference':missing.IsEmpty()})
r={'status':'CONTINUOUS_POLYGON_FOOTPRINT_CHECK_NOT_IMPEDANCE_QUALIFICATION','source_sha256':sources,'rows':rows,'scope':'All USB straight track rectangles, excluding semicircular end caps and fanouts','limits':['Uses KiCad integer polygon clipping and filled copper already in PCB file','Copper connectivity and manufacturing registration/etch tolerance unverified','Geometric margin is not an electrical acceptance criterion','No field solution, USB measurement or full route qualification']};(O/'material-dk-trial/usb-all-segment-reference-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'checks':len(rows),'zero_margin_uncovered':[r for r in rows if r['extra_margin_each_side_mm']==0 and not r['empty_difference']]},indent=2))

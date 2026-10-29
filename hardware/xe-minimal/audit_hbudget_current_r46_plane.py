import pcbnew as k,wx,json,math
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;b=k.LoadBoard(str(O/'hbudget-current-r46-joined-candidate.kicad_pcb'));r=json.loads((O/'hbudget-current-r46-joined-review.json').read_text())
def xy(v):return [k.ToMM(v.x),k.ToMM(v.y)]
def dpt(p,a,z):
 dx,dy=z[0]-a[0],z[1]-a[1];t=max(0,min(1,((p[0]-a[0])*dx+(p[1]-a[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0;return math.dist(p,[a[0]+t*dx,a[1]+t*dy])
def cross(a,b,c):return (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0])
def ds(a,z,c,d):
 if cross(a,z,c)*cross(a,z,d)<0 and cross(c,d,a)*cross(c,d,z)<0:return 0
 return min(dpt(a,c,d),dpt(z,c,d),dpt(c,a,z),dpt(d,a,z))
rows=[]
for run in r['paths']:
 for a,z in zip(run['points'],run['points'][1:]):
  for t in b.GetTracks():
   if isinstance(t,k.PCB_VIA) or t.GetNetname() not in ['/USB_DP','/USB_DM']:continue
   d=ds(a,z,xy(t.GetStart()),xy(t.GetEnd()));rows.append({'signal':t.GetNetname(),'usb_layer':b.GetLayerName(t.GetLayer()),'control_layer':b.GetLayerName(run['layer']),'centerline_distance_mm':d,'control_segment':[a,z],'usb_segment':[xy(t.GetStart()),xy(t.GetEnd())]})
rows.sort(key=lambda r:r['centerline_distance_mm']);d=json.loads((O/'hbudget-current-r46-joined-drc.json').read_text());out={'status':'GEOMETRIC_RETURN_PATH_SCREEN_NOT_SI_QUALIFICATION','nearest_usb_projections':rows[:10],'ground_unconnected_items':sum(any('[/GND]' in i['description'] for i in x['items']) for x in d['unconnected_items']),'all_unconnected_items':len(d['unconnected_items']),'control_layers':[b.GetLayerName(x['layer']) for x in r['paths']],'warning':'A signal trace in a GND plane creates a slot. Centerline distances alone do not prove adequate return current or impedance; check USB reference stackup and actual zone copper.'};(O/'hbudget-current-r46-plane-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))

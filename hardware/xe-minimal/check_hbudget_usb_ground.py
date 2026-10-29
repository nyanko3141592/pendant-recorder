import pcbnew as k,wx,json,math,hashlib
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent
boards={n:k.LoadBoard(str(O/f)) for n,f in [('baseline','pendant-xe-minimal.kicad_pcb'),('candidate','hbudget-current-shortened-candidate.kicad_pcb')]}
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def dist(p,a,b):
 dx,dy=b[0]-a[0],b[1]-a[1];u=max(0,min(1,((p[0]-a[0])*dx+(p[1]-a[1])*dy)/(dx*dx+dy*dy)));return math.dist(p,(a[0]+u*dx,a[1]+u*dy))
b=boards['candidate'];usb=[t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetNetname() in ['/USB_DP','/USB_DM'] and t.GetLayer()==k.In2_Cu];surface=[t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetNetname()=='/USB_HIGH_BUDGET' and t.GetLayer()==k.F_Cu];samples=set()
for t in usb:
 a,c=xy(t.GetStart()),xy(t.GetEnd());n=math.ceil(math.dist(a,c)/.025)
 for j in range(n+1):
  p=(a[0]+(c[0]-a[0])*j/n,a[1]+(c[1]-a[1])*j/n)
  if min(dist(p,xy(s.GetStart()),xy(s.GetEnd())) for s in surface)>.5:continue
  for dx in [-.2,-.1,0,.1,.2]:
   for dy in [-.2,-.1,0,.1,.2]:samples.add((round((p[0]+dx)*1e6),round((p[1]+dy)*1e6)))
results={}
for name,board in boards.items():
 polys=[z.GetFilledPolysList(k.In1_Cu) for z in board.Zones() if z.GetNetname()=='/GND' and z.IsOnLayer(k.In1_Cu)]
 missing=[p for p in samples if not any(poly.Contains(k.VECTOR2I(*p)) for poly in polys)]
 results[name]={'sample_count':len(samples),'missing_ground_count':len(missing),'missing_positions_mm':[[x/1e6,y/1e6] for x,y in missing[:20]]}
r={'status':'SAMPLED_GEOMETRY_SCREEN_NOT_SIGNAL_INTEGRITY_PROOF','results':results,'method':'USB In2 segment center samples every <=0.025mm near F HIGH_BUDGET (<0.5mm); offsets +/-0.2mm in both axes; actual saved filled In1 GND polygon containment.','limitations':['Finite sampling does not prove continuous coverage or impedance.','Stackup and measured USB signal integrity remain unqualified.']};(O/'hbudget-usb-ground-screen.json').write_text(json.dumps(r,indent=2)+'\n');print(r)

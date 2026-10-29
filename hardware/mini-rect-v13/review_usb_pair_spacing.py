from pathlib import Path
import wx,json,math,hashlib,sys
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;src=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else P/'usb-esd-ground.kicad_pcb';b=k.LoadBoard(str(src))
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)
def dist(q,a,c):
 dx,dy=c[0]-a[0],c[1]-a[1];u=max(0,min(1,((q[0]-a[0])*dx+(q[1]-a[1])*dy)/(dx*dx+dy*dy)));return math.hypot(q[0]-a[0]-u*dx,q[1]-a[1]-u*dy)
tracks={n:[t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetNetname()==n and t.GetLayer()==k.In2_Cu] for n in ['/USB_DP','/USB_DM']};rows=[]
for name,other in [('/USB_DP','/USB_DM'),('/USB_DM','/USB_DP')]:
 samples=[];bins={'gap_0.10_to_0.15_mm':0,'gap_0.15_to_0.30_mm':0,'gap_above_0.30_mm':0,'gap_below_0.10_mm':0};total=0
 for t in tracks[name]:
  a,c=xy(t.GetStart()),xy(t.GetEnd());length=k.ToMM(t.GetLength());n=max(1,math.ceil(length/.025))
  for i in range(n):
   u=(i+.5)/n;q=(a[0]+u*(c[0]-a[0]),a[1]+u*(c[1]-a[1]));gap=min(dist(q,xy(v.GetStart()),xy(v.GetEnd()))-(k.ToMM(t.GetWidth())+k.ToMM(v.GetWidth()))/2 for v in tracks[other]);samples.append(gap);w=length/n;total+=w
   key='gap_below_0.10_mm' if gap<.0999 else 'gap_0.10_to_0.15_mm' if gap<=.15 else 'gap_0.15_to_0.30_mm' if gap<=.3 else 'gap_above_0.30_mm';bins[key]+=w
 rows.append(dict(net=name,inner_length_mm=round(total,3),edge_gap_range_mm=[round(min(samples),4),round(max(samples),4)],length_by_gap_mm={x:round(y,3) for x,y in bins.items()}))
r=dict(status='GEOMETRIC_SPACING_SCREEN_NOT_IMPEDANCE_APPROVAL',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),rows=rows,limitations=['Nearest opposite-net segment distance, not proof of parallel orientation or coupling','Via transitions and outer-layer branches excluded','No selected laminate or field-solver validation; constant trace width alone does not establish90ohm'])
src.with_suffix('.usb-pair-spacing.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))

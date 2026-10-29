"""Check both reference planes across USB trace width, sampled geometry only."""
from pathlib import Path
import wx,pcbnew as k,math,json,hashlib,sys
app=wx.App(False);P=Path(__file__).resolve().parent;src=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else P/'usb-stripline-pair-candidate.kicad_pcb';b=k.LoadBoard(str(src));rows=[]
zones={l:[z for z in b.Zones() if z.GetLayer()==l and z.GetNetname()=='/GND'] for l in [k.In1_Cu,k.In3_Cu]}
for net in ['/USB_DP','/USB_DM']:
 counts={'both':0,'top_only':0,'bottom_only':0,'neither':0};missing=[]
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.In2_Cu or t.GetNetname()!=net:continue
  a,z=t.GetStart(),t.GetEnd();dx,dy=k.ToMM(z.x-a.x),k.ToMM(z.y-a.y);length=math.hypot(dx,dy);n=max(1,math.ceil(length/.05));half=k.ToMM(t.GetWidth())/2
  for i in range(n):
   u=(i+.5)/n;x,y=k.ToMM(a.x)+u*dx,k.ToMM(a.y)+u*dy;cover=[]
   for l in [k.In1_Cu,k.In3_Cu]:
    tests=[]
    for offset in [-half,0,half]:
     q=k.VECTOR2I(k.FromMM(x-dy/length*offset),k.FromMM(y+dx/length*offset));tests.append(any(g.HitTestFilledArea(l,q) for g in zones[l]))
    cover.append(all(tests))
   key='both' if all(cover) else 'top_only' if cover[0] else 'bottom_only' if cover[1] else 'neither';counts[key]+=1
   if key!='both':missing.append({'xy_mm':[x,y],'top_bottom':cover})
 rows.append({'net':net,'counts':counts,'not_both':missing})
r={'status':'BOTH_PLANE_SAMPLED_SCREEN_NOT_SI_APPROVAL','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'rows':rows,'limitations':['Samples at center and both edges every 0.05 mm; no finite field width or via model','Via antipads may explain missing reference and need separate transition review','Other same-layer signal coupling and impedance tolerances not modeled']};src.with_suffix('.both-reference-review.json').write_text(json.dumps(r,indent=2)+'\n');print([(r['net'],r['counts']) for r in rows])

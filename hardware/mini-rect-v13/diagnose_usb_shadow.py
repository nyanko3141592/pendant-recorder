from pathlib import Path
import json,math,collections,wx,hashlib
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;src=P/'usb-ground-return.kicad_pcb';b=k.LoadBoard(str(src));g=b.FindNet('/GND').GetNetCode();z=next(z for z in b.Zones() if z.GetLayer()==k.In2_Cu)
rows=[]
for name in ['/USB_DP','/USB_DM']:
 counts=collections.Counter();length=0
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetNetname()!=name or t.GetLayer()!=k.B_Cu:continue
  a,c=t.GetStart(),t.GetEnd();n=max(2,math.ceil(k.ToMM(t.GetLength())/.025));length+=k.ToMM(t.GetLength())
  for i in range(n):
   u=(i+.5)/n;q=k.VECTOR2I(round(a.x+(c.x-a.x)*u),round(a.y+(c.y-a.y)*u))
   if z.HitTestFilledArea(k.In2_Cu,q):counts['ground_zone']+=1;continue
   near={v.GetNetname() for v in b.GetTracks() if (isinstance(v,k.PCB_VIA) or v.GetLayer()==k.In2_Cu) and v.GetNetCode()!=g and v.HitTest(q,k.FromMM(.15))}
   if name in near:counts['same_signal_copper_or_clearance']+=1
   elif near:counts['other_signal_copper_or_clearance']+=1
   else:counts['unexplained_void']+=1
 rows.append(dict(net=name,back_length_mm=round(length,3),samples=dict(counts)))
r=dict(status='DIAGNOSTIC_NOT_SI_APPROVAL',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),rows=rows,method='B.Cu trace center sampled at <=0.025mm; In2 GND polygon and signal copper expanded by zone clearance0.15mm; nearest physical plane not automatically valid reference',decision='Do not add more pours blindly; route USB pair with a defined continuous reference and minimize ESD branch/stub geometry')
(P/'usb-shadow-diagnosis.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

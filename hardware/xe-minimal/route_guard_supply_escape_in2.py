"""Two through-via hot-reference connection, with full DRC acceptance."""
import pcbnew as k, wx
app=wx.App(False)
import json,subprocess,shutil,math
from pathlib import Path
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'guard-supply-escape-in2-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));fps={f.GetReference():f for f in b.GetFootprints()}
def pad(r,n):return next(p for p in fps[r].Pads() if p.GetNumber()==n)
p,q=pad('R38','1'),pad('R40','1');assert p.GetNetname()==q.GetNetname()
def point_segment(v,s,e):
 dx,dy=e.x-s.x,e.y-s.y
 t=max(0,min(1,((v.x-s.x)*dx+(v.y-s.y)*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(v.x-s.x-t*dx,v.y-s.y-t*dy)
def candidates(p):
 a=p.GetPosition();out=[]
 for rad in [.65,.9,1.2,1.6,2.0]:
  for deg in range(0,360,15):
   v=k.VECTOR2I(a.x+k.FromMM(rad*math.cos(math.radians(deg))),a.y+k.FromMM(rad*math.sin(math.radians(deg))))
   blocked=False
   for f in b.GetFootprints():
    for pp in f.Pads():
     bb=pp.GetBoundingBox();d=math.hypot(max(bb.GetX()-v.x,0,v.x-bb.GetRight()),max(bb.GetY()-v.y,0,v.y-bb.GetBottom()))
     if d<k.FromMM(.28):blocked=True;break
    if blocked:break
   if not blocked:
    for tr in b.GetTracks():
     if tr.GetNetname()==p.GetNetname():continue
     width=tr.GetWidth(k.In2_Cu) if isinstance(tr,k.PCB_VIA) else tr.GetWidth()
     if point_segment(v,tr.GetStart(),tr.GetEnd())<width/2+k.FromMM(.28):blocked=True;break
     if isinstance(tr,k.PCB_VIA) and point_segment(tr.GetPosition(),a,v)<width/2+k.FromMM(.18):blocked=True;break
   if not blocked:
    for f in b.GetFootprints():
     for pp in f.Pads():
      if pp.GetNetname()==p.GetNetname() or not pp.IsOnLayer(k.B_Cu):continue
      bb=pp.GetBoundingBox()
      for j in range(41):
       x=a.x+(v.x-a.x)*j/40;y=a.y+(v.y-a.y)*j/40
       if math.hypot(max(bb.GetX()-x,0,x-bb.GetRight()),max(bb.GetY()-y,0,y-bb.GetBottom()))<k.FromMM(.18):blocked=True;break
      if blocked:break
     if blocked:break
   if not blocked:out.append(v)
 return out
pairs=[(v,w) for v in candidates(p) for w in candidates(q)]
pairs.sort(key=lambda z:math.hypot(z[0].x-z[1].x,z[0].y-z[1].y))
accepted=None
print('via pairs',len(pairs),flush=True)
for i,(v,w) in enumerate(pairs):
 items=[]
 for pos in [v,w]:
  t=k.PCB_VIA(b);t.SetPosition(pos);t.SetWidth(k.FromMM(.35));t.SetDrill(k.FromMM(.15));t.SetViaType(k.VIATYPE_THROUGH);t.SetLayerPair(k.F_Cu,k.B_Cu);t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False;items.append(t)
 for s,e,layer in [(p.GetPosition(),v,k.B_Cu),(v,w,k.In2_Cu),(w,q.GetPosition(),k.B_Cu)]:
  t=k.PCB_TRACK(b);t.SetStart(s);t.SetEnd(e);t.SetWidth(k.FromMM(.15));t.SetLayer(layer);t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False;items.append(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'guard-supply-escape-in2-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'guard-supply-escape-in2-drc.json').read_text())
 if not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])<101:
  accepted={'trial':i+1,'vias_mm':[[k.ToMM(z.x),k.ToMM(z.y)] for z in [v,w]],'unconnected_items':len(r['unconnected_items'])};break
 for t in items:b.RemoveNative(t)
 if i%20==0:print('tested',i+1,flush=True)
review={'accepted':accepted,'candidate_pairs':len(pairs),'scope':'R38.1 to R40.1 via In2.Cu; no thermal qualification'}
(O/'guard-supply-escape-in2-review.json').write_text(json.dumps(review,indent=2)+'\n');print(review,flush=True)

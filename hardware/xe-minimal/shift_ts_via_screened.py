"""Two through-via hot-reference connection, with full DRC acceptance."""
import pcbnew as k, wx
app=wx.App(False)
import json,subprocess,shutil,math
from pathlib import Path
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'ts-via-screened-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));fps={f.GetReference():f for f in b.GetFootprints()}
def pad(r,n):return next(p for p in fps[r].Pads() if p.GetNumber()==n)
p,q=pad('TH1','1'),pad('R37','2');assert p.GetNetname()==q.GetNetname()
def point_segment(v,s,e):
 dx,dy=e.x-s.x,e.y-s.y
 t=max(0,min(1,((v.x-s.x)*dx+(v.y-s.y)*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(v.x-s.x-t*dx,v.y-s.y-t*dy)
def candidates(p):
 a=p.GetPosition();out=[]
 for rad in [.4,.5,.65,.9,1.2,1.6,2.0,2.5,3.0]:
  for deg in range(0,360,15):
   v=k.VECTOR2I(a.x+k.FromMM(rad*math.cos(math.radians(deg))),a.y+k.FromMM(rad*math.sin(math.radians(deg))))
   if not (k.FromMM(.5)<v.x<k.FromMM(23.5) and k.FromMM(.5)<v.y<k.FromMM(26.5)):continue
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
      if pp.GetNetname()==p.GetNetname() or not pp.IsOnLayer(k.B_Cu if p.GetParentFootprint().IsFlipped() else k.F_Cu):continue
      bb=pp.GetBoundingBox()
      for j in range(41):
       x=a.x+(v.x-a.x)*j/40;y=a.y+(v.y-a.y)*j/40
       if math.hypot(max(bb.GetX()-x,0,x-bb.GetRight()),max(bb.GetY()-y,0,y-bb.GetBottom()))<k.FromMM(.18):blocked=True;break
      if blocked:break
     if blocked:break
   if not blocked:
    face=k.B_Cu if p.GetParentFootprint().IsFlipped() else k.F_Cu
    for tr in b.GetTracks():
     if tr.GetNetname()==p.GetNetname() or isinstance(tr,k.PCB_VIA) or tr.GetLayer()!=face:continue
     for j in range(41):
      vv=k.VECTOR2I(round(a.x+(v.x-a.x)*j/40),round(a.y+(v.y-a.y)*j/40))
      if point_segment(vv,tr.GetStart(),tr.GetEnd())<tr.GetWidth()/2+k.FromMM(.18):blocked=True;break
     if blocked:break
   if not blocked:out.append(v)
 return out

positions=[v for v in candidates(p) if k.ToMM(v.y)>.8]
positions.sort(key=lambda v:math.hypot(v.x-p.GetPosition().x,v.y-p.GetPosition().y))
results=[];print('screened positions',len(positions),flush=True)
for new in positions[:20]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
 v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='6b61731b-4d54-48b8-979f-5bcc40bfd38d');old=v.GetPosition()
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetNetname()!=v.GetNetname():continue
  if t.GetStart()==old:t.SetStart(new)
  if t.GetEnd()==old:t.SetEnd(new)
 v.SetPosition(new);k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'ts-via-screened-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'ts-via-screened-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==53
 results.append({'position':[k.ToMM(new.x),k.ToMM(new.y)],'accepted':ok,'violations':r['violations']});print(results[-1]['position'],ok,len(r['violations']),flush=True)
 if ok:break
(O/'ts-via-screened-review.json').write_text(json.dumps(results,indent=2)+'\n')

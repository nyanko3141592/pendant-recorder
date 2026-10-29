from pathlib import Path
import json,math,wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;b=k.LoadBoard(str(P/'power-width-candidate.kicad_pcb'))
gnd=b.FindNet('/GND').GetNetCode();inner=next(z for z in b.Zones() if z.GetLayer()==k.In1_Cu);inner2=next(z for z in b.Zones() if z.GetLayer()==k.In2_Cu)
pads=[p for f in b.GetFootprints() for p in f.Pads()];tracks=list(b.GetTracks());rules=[z for f in b.GetFootprints() for z in f.Zones() if z.GetIsRuleArea() and z.GetDoNotAllowVias()]
rows=[]
for target in [(15.8,9.155),(10.4,16.0)]:
 candidates=[]
 for dx in range(-15,16):
  for dy in range(-15,16):
   if dx*dx+dy*dy>225:continue
   x,y=target[0]+dx*.1,target[1]+dy*.1;q=k.VECTOR2I(k.FromMM(x),k.FromMM(y))
   if not inner.HitTestFilledArea(k.In1_Cu,q) or inner2.HitTestFilledArea(k.In2_Cu,q):continue
   if any(p.HitTest(q,k.FromMM(.326)) for p in pads):continue
   if any(z.GetBoundingBox().Contains(q) for z in rules):continue
   blockers=[];via_conflict=False
   for t in tracks:
    if isinstance(t,k.PCB_VIA):
     if math.hypot(k.ToMM(q.x-t.GetPosition().x),k.ToMM(q.y-t.GetPosition().y))<max(.451,max(k.ToMM(t.GetWidth(l)) for l in [k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu])/2+.225+.101):via_conflict=True;break
    elif t.GetNetCode()!=gnd and t.HitTest(q,k.FromMM(.326)):
     blockers.append({'net':t.GetNetname(),'layer':b.GetLayerName(t.GetLayer()),'uuid':t.m_Uuid.AsString(),'start_mm':[k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y)],'end_mm':[k.ToMM(t.GetEnd().x),k.ToMM(t.GetEnd().y)]})
   if not via_conflict:candidates.append({'xy_mm':[x,y],'blockers':blockers,'count':len(blockers),'distance_mm':math.hypot(dx*.1,dy*.1)})
 candidates.sort(key=lambda r:(r['count'],r['distance_mm']));rows.append({'target':target,'candidates':candidates[:8]})
(P/'usb-via-obstacle-ranking.json').write_text(json.dumps({'status':'GEOMETRIC_SCREEN_NOT_DRC','via_diameter_mm':.45,'rows':rows},indent=2)+'\n');print(json.dumps(rows,indent=2))

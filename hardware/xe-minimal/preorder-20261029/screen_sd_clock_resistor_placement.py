from pathlib import Path
import pcbnew as k,wx,math,json
app=wx.App(False);w=Path(__file__).resolve().parent;b=k.LoadBoard(str(w/'expanded-ground-trial.kicad_pcb'));f=next(f for f in b.GetFootprints() if f.GetReference()=='R23');source=next(p for u in b.GetFootprints() if u.GetReference()=='U1' for p in u.Pads() if p.GetNetname()=='/SD_CLK_MCU');xy=lambda p:(k.ToMM(p.x),k.ToMM(p.y))
def bounds(fp):
 pts=[]
 for g in fp.GraphicalItems():
  if g.GetLayer()==k.B_CrtYd:
   pts.extend([xy(g.GetStart()),xy(g.GetEnd())])
 return [min(x for x,y in pts),max(x for x,y in pts),min(y for x,y in pts),max(y for x,y in pts)] if pts else None
obstacles=[(u.GetReference(),bounds(u)) for u in b.GetFootprints() if u.GetReference()!='R23' and u.GetLayer()==k.B_Cu];missing=[n for n,q in obstacles if q is None];original={'center':xy(f.GetPosition()),'angle':f.GetOrientationDegrees(),'source_pin':xy(source.GetPosition())};sites=[]
for angle in [0,90,180,270]:
 f.SetOrientationDegrees(angle)
 for xi in range(100,181):
  for yi in range(5,44):
   f.SetPosition(k.VECTOR2I(k.FromMM(xi/10),k.FromMM(yi/10)));r=bounds(f)
   if r is None or r[0]<.3 or r[1]>27.2 or r[2]<-.2 or r[3]>26.7:continue
   if any(q and r[0]<q[1] and q[0]<r[1] and r[2]<q[3] and q[2]<r[3] for _,q in obstacles):continue
   pad=next(p for p in f.Pads() if p.GetNetname()=='/SD_CLK_MCU');a,c=xy(pad.GetPosition()),xy(source.GetPosition());dist=math.dist(a,c)
   sites.append({'center_mm':xy(f.GetPosition()),'angle_deg':angle,'source_pad_distance_mm':dist})
sites.sort(key=lambda q:q['source_pad_distance_mm']);out={'original':original,'sites':sites[:20],'total_clear_sites':len(sites),'footprints_missing_bottom_courtyard':missing,'limits':['Courtyard screen only; copper routing and escape not checked','No footprint moved in saved candidate','Source proximity does not qualify ringing/series value'],'release_allowed':False};(w/'sd-clock-placement-screen.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'original':original,'best':sites[:3],'missing_courtyard':missing}))

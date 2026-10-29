from pathlib import Path
import pcbnew as k,wx,math,json
app=wx.App(False);w=Path(__file__).resolve().parent;b=k.LoadBoard(str(w/'mixed-global-routed.kicad_pcb'));f=next(f for f in b.GetFootprints() if f.GetReference()=='R21');source=next(p for u in b.GetFootprints() if u.GetReference()=='U1' for p in u.Pads() if p.GetNetname()=='/PDM_CLK_MCU');xy=lambda p:(k.ToMM(p.x),k.ToMM(p.y))
for t in list(b.GetTracks()):
 if t.GetNetname() in ['/PDM_CLK_MCU','/PDM_CLK','/PDM_DATA','/SD_MOSI','/SD_MISO']:b.RemoveNative(t)
def bounds(fp):
 pts=[]
 for g in fp.GraphicalItems():
  if g.GetLayer()==k.B_CrtYd:
   box=g.GetBoundingBox();pts.extend([xy(box.GetOrigin()),xy(box.GetEnd())])
 return [min(x for x,y in pts),max(x for x,y in pts),min(y for x,y in pts),max(y for x,y in pts)] if pts else None
obstacles=[(u.GetReference(),bounds(u)) for u in b.GetFootprints() if u.GetReference()!='R21' and u.GetLayer()==k.B_Cu];missing=[n for n,q in obstacles if q is None];original={'center':xy(f.GetPosition()),'angle':f.GetOrientationDegrees(),'source_pin':xy(source.GetPosition())};sites=[]
for angle in [0,90,180,270]:
 f.SetOrientationDegrees(angle)
 for xi in range(150,222):
  for yi in range(115,151):
   f.SetPosition(k.VECTOR2I(k.FromMM(xi/10),k.FromMM(yi/10)));r=bounds(f)
   if r is None or r[0]<.3 or r[1]>27.2 or r[2]<-.2 or r[3]>26.7:continue
   if any(q and r[0]<q[1] and q[0]<r[1] and r[2]<q[3] and q[2]<r[3] for _,q in obstacles):continue
   pad=next(p for p in f.Pads() if p.GetNetname()=='/PDM_CLK_MCU');a,c=xy(pad.GetPosition()),xy(source.GetPosition());dist=math.dist(a,c)
   padshape=pad.GetEffectiveShape(k.B_Cu);seg=k.SEG(pad.GetPosition(),source.GetPosition());bad=False
   for u in b.GetFootprints():
    if u.GetReference()=='R21':continue
    for q in u.Pads():
     if not q.IsOnLayer(k.B_Cu):continue
     for rp in f.Pads():
      if q.GetNetname()!=rp.GetNetname() and q.GetEffectiveShape(k.B_Cu).Collide(rp.GetEffectiveShape(k.B_Cu),k.FromMM(.101)):bad=True
     if q.GetNetname()!=source.GetNetname() and q.GetEffectiveShape(k.B_Cu).Collide(seg,k.FromMM(.1645)):bad=True
   for t in b.GetTracks():
    if not t.IsOnLayer(k.B_Cu):continue
    for rp in f.Pads():
     if t.GetNetname()!=rp.GetNetname() and t.GetEffectiveShape(k.B_Cu).Collide(rp.GetEffectiveShape(k.B_Cu),k.FromMM(.101)):bad=True
    if t.GetNetname()!=source.GetNetname() and t.GetEffectiveShape(k.B_Cu).Collide(seg,k.FromMM(.1645)):bad=True
   if bad:continue
   sites.append({'center_mm':xy(f.GetPosition()),'angle_deg':angle,'source_pad_distance_mm':dist})
sites.sort(key=lambda q:q['source_pad_distance_mm']);out={'original':original,'sites':sites[:20],'total_clear_sites':len(sites),'footprints_missing_bottom_courtyard':missing,'limits':['Courtyard screen only; copper routing and escape not checked','No footprint moved in saved candidate','Source proximity does not qualify ringing/series value'],'release_allowed':False};(w/'pdm-clock-placement-screen.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'original':original,'best':sites[:3],'missing_courtyard':missing}))

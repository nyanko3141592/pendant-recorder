from pathlib import Path
import pcbnew as k,wx,json,math
app=wx.App(False);O=Path(__file__).resolve().parent;b=k.LoadBoard(str(O/'glue-case-trial/pendant-xe-minimal.kicad_pcb'));layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu];obstacles=[];pads=[]
for t in b.GetTracks():
 if t.GetNetname()!='/GND':obstacles.append(t.GetEffectiveShape(t.GetLayer()))
for f in b.GetFootprints():
 for p in f.Pads():
  if p.GetAttribute()==k.PAD_ATTRIB_NPTH:continue
  for l in layers:
   if p.IsOnLayer(l):
    shape=p.GetEffectiveShape(l)
    if p.GetNetname()!='/GND':obstacles.append(shape)
    if l in [k.F_Cu,k.B_Cu]:pads.append(shape)
rows=[]
for ix in range(290,401):
 for iy in range(8,101):
  x,y=ix*.05,iy*.05;p=k.VECTOR2I(k.FromMM(x),k.FromMM(y))
  if any(s.Collide(p,k.FromMM(.275))for s in obstacles):continue
  if any(s.Collide(p,k.FromMM(.255))for s in pads):continue
  rows.append({'x_mm':x,'y_mm':y,'distance_mm':math.hypot(x-17.3025,y-1.029999)})
rows.sort(key=lambda r:r['distance_mm']);r={'status':'GEOMETRIC_SCREEN_REQUIRES_DRC','candidates':rows[:30],'count':len(rows),'method':'All nonGND copper shapes projected,0.175via radius+0.1clearance; all surface pads avoid0.075hole+0.03maskexpansion+0.15gap','limits':['No connecting track check, plane clearance, edge or holeclearance qualification']};(O/'r44-position-screen.json').write_text(json.dumps(r,indent=2));print(rows[:8])

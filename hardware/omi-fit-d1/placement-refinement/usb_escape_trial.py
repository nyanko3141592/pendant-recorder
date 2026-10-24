import pcbnew as p,json,math,shutil
from pathlib import Path
P=Path(__file__).resolve().parent;s='candidate6v4';dst='candidate6usb'
b=p.LoadBoard(str(P/(s+'.kicad_pcb')))
for t in list(b.GetTracks()):b.Delete(t)
fs={f.GetReference():f for f in b.GetFootprints()};f=fs['R4'];options=[]
for side in [p.F_Cu,p.B_Cu]:
 f.SetOrientationDegrees(0)
 if f.IsFlipped()!=(side==p.B_Cu):f.Flip(f.GetPosition(),False)
 f.SetPosition(p.VECTOR2I(0,0));bb=f.GetBoundingBox(False,False);w,h=p.ToMM(bb.GetWidth()),p.ToMM(bb.GetHeight())
 for ix in range(-100,101):
  for iy in range(-100,101):
   x,y=ix/10,iy/10
   if max(math.hypot(x+dx*w/2,y+dy*h/2) for dx in [-1,1] for dy in [-1,1])>11.25:continue
   if x< -8 and -4<y<1:continue
   good=True
   for other in fs.values():
    if other==f or (other.GetLayer()!=side and other.GetReference()!='J3'):continue
    ob=other.GetBoundingBox(False,False);ox,oy,ow,oh=[p.ToMM(v) for v in [ob.GetX(),ob.GetY(),ob.GetWidth(),ob.GetHeight()]]
    if x+100+w/2+.08>ox and x+100-w/2-.08<ox+ow and y+100+h/2+.08>oy and y+100-h/2-.08<oy+oh:good=False;break
   if good:options.append((math.hypot(x+6,y+5),side,x,y))
assert options
_,side,x,y=min(options)
if f.IsFlipped()!=(side==p.B_Cu):f.Flip(f.GetPosition(),False)
f.SetOrientationDegrees(0);f.SetPosition(p.VECTOR2I(0,0));bb=f.GetBoundingBox(False,False);f.SetPosition(p.VECTOR2I(p.FromMM(x+100)-bb.GetCenter().x,p.FromMM(y+100)-bb.GetCenter().y))
print('R4 moved',side,x,y)
p.SaveBoard(str(P/(dst+'.kicad_pcb')),b)
for ext in ['kicad_sch','kicad_pro']:shutil.copyfile(P/(s+'.'+ext),P/(dst+'.'+ext))
assert p.ExportSpecctraDSN(b,str(P/(dst+'.dsn')))
(P/'usb-escape-change.json').write_text(json.dumps({'reference':'R4','side':'B' if side==p.B_Cu else 'F','center':[x,y],'reason':'Free left-side MCU USB escape beyond opposite SD pads'},indent=2))

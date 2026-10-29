from pathlib import Path
import pcbnew as k,wx,math,json,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'source-clock-unrouted.kicad_pcb';b=k.LoadBoard(str(src));moving=['R28','R24','R25'];xy=lambda p:(k.ToMM(p.x),k.ToMM(p.y))
for t in list(b.GetTracks()):
 if t.GetNetname()=='/SD_V3':b.RemoveNative(t)
def bounds(fp):
 pts=[]
 for g in fp.GraphicalItems():
  if g.GetLayer()==(k.F_CrtYd if fp.GetLayer()==k.F_Cu else k.B_CrtYd):pts.extend([xy(g.GetStart()),xy(g.GetEnd())])
 assert pts,fp.GetReference()
 return [min(x for x,y in pts),max(x for x,y in pts),min(y for x,y in pts),max(y for x,y in pts)]
placed=[];rows=[]
for ref,net in [('R28','/SD_CS_N'),('R24','/SD_MOSI'),('R25','/SD_MISO')]:
 f=next(f for f in b.GetFootprints() if f.GetReference()==ref);old={'xy':xy(f.GetPosition()),'layer':b.GetLayerName(f.GetLayer()),'angle':f.GetOrientationDegrees()}
 target=next(p for u in b.GetFootprints() if u.GetReference()=='U11' for p in u.Pads() if p.GetNetname()==net);targetxy=xy(target.GetPosition())
 if f.GetLayer()!=k.F_Cu:f.Flip(f.GetPosition(),False)
 obstacles=[u for u in b.GetFootprints() if u.GetReference()!=ref and (u.GetReference() not in moving or u.GetReference() in placed)]
 rectangles=[bounds(u) for u in obstacles if u.GetLayer()==k.F_Cu]
 copper=[(str(t.GetNetname()),t.GetEffectiveShape(k.F_Cu)) for t in b.GetTracks() if t.IsOnLayer(k.F_Cu)]
 copper.extend((str(p.GetNetname()),p.GetEffectiveShape(k.F_Cu)) for u in obstacles for p in u.Pads() if p.IsOnLayer(k.F_Cu))
 vias=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA)]
 candidates=[]
 for angle in [0,90,180,270]:
  f.SetOrientationDegrees(angle)
  for xi in range(8,116,2):
   for yi in range(95,190,2):
    f.SetPosition(k.VECTOR2I(k.FromMM(xi/10),k.FromMM(yi/10)));r=bounds(f)
    if r[0]<.3 or r[1]>27.2 or r[2]<-.2 or r[3]>26.7:continue
    if any(r[0]<q[1] and q[0]<r[1] and r[2]<q[3] and q[2]<r[3] for q in rectangles):continue
    pad=next(p for p in f.Pads() if p.GetNetname()==net);score=math.dist(xy(pad.GetPosition()),targetxy)
    candidates.append((score,xi/10,yi/10,angle))
 chosen=None
 for score,x,y,angle in sorted(candidates):
  f.SetOrientationDegrees(angle);f.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));good=True
  for pad in f.Pads():
   shape=pad.GetEffectiveShape(k.F_Cu)
   if any(n!=pad.GetNetname() and shape.Collide(s,k.FromMM(.101)) for n,s in copper):good=False;break
   if any(shape.Collide(v.GetPosition(),v.GetDrillValue()//2+k.FromMM(.201)) for v in vias):good=False;break
  if good:chosen={'xy':[x,y],'angle':angle,'layer':'F.Cu','signal_pad_xy_distance_to_U11_mm':score};break
 assert chosen,ref
 placed.append(ref);rows.append({'ref':ref,'old':old,'new':chosen})
out=w/'spi-cluster-unrouted.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
assert k.ExportSpecctraDSN(b,str(out.with_suffix('.dsn')))
s=out.with_suffix('.dsn').read_text()
for layer in ['In1.Cu','In2.Cu']:s=s.replace(f'(layer {layer}\n      (type signal)',f'(layer {layer}\n      (type power)')
s='\n'.join(x for x in s.splitlines() if '(wire_keepout ' not in x)+'\n';s=s.replace('(class kicad_default /BAT ','(class kicad_default ');s=s.replace('    (class USB_FS_PAIR','    (class BAT_POWER /BAT (circuit (use_via "Via[0-3]_450:200_um")) (rule (width 150) (clearance 100)))\n    (class USB_FS_PAIR');out.with_suffix('.dsn').write_text(s)
(w/'spi-cluster-placement.json').write_text(json.dumps({'moves':rows,'status':'UNROUTED_TRIAL','release_allowed':False},indent=2)+'\n');print(json.dumps(rows))

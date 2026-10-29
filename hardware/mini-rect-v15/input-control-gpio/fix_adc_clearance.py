from pathlib import Path
import shutil,math
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'global-route-widths.kicad_pcb';out=P/'global-route-clear.kicad_pcb'
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
b=k.LoadBoard(str(src));center=(16.9506,7.9347);moves={}
for t in b.GetTracks():
 if t.GetNetname()!='/BAT_ADC' or isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.In4_Cu:continue
 for p in [t.GetStart(),t.GetEnd()]:
  x,y=k.ToMM(p.x),k.ToMM(p.y);dx,dy=x-center[0],y-center[1];r=math.hypot(dx,dy)
  if 0<r<.5:moves[(p.x,p.y)]=k.VECTOR2I(k.FromMM(x+.005*dx/r),k.FromMM(y+.005*dy/r))
for t in b.GetTracks():
 if t.GetNetname()!='/BAT_ADC':continue
 if isinstance(t,k.PCB_VIA):assert (t.GetPosition().x,t.GetPosition().y) not in moves;continue
 p=t.GetStart();q=t.GetEnd()
 if (p.x,p.y) in moves:t.SetStart(moves[p.x,p.y])
 if (q.x,q.y) in moves:t.SetEnd(moves[q.x,q.y])
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);print('Moved BAT_ADC vertices',len(moves),'by0.005mm awayfromSTATUS_LEDvia; no rulechanges')

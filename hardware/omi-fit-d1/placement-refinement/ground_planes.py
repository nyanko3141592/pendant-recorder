import pcbnew as p,math,shutil
from pathlib import Path
P=Path(__file__).resolve().parent
src='candidate6-grid';dst='candidate6-ground';b=p.LoadBoard(str(P/(src+'.kicad_pcb')))
removed=0
for t in list(b.GetTracks()):
 if not isinstance(t,p.PCB_VIA) and t.GetNetname()=='/GND':b.Delete(t);removed+=1
for layer in [p.F_Cu,p.B_Cu]:
 z=p.ZONE(b);z.SetLayer(layer);z.SetNetCode(b.FindNet('/GND').GetNetCode());z.SetLocalClearance(p.FromMM(.15));z.SetPadConnection(p.ZONE_CONNECTION_FULL);z.SetMinThickness(p.FromMM(.1));o=z.Outline();o.NewOutline()
 for i in range(160):
  a=i*2*math.pi/160;o.Append(p.FromMM(100+11.25*math.cos(a)),p.FromMM(100+11.25*math.sin(a)))
 b.Add(z)
p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(P/(dst+'.kicad_pcb')),b)
for ext in ['kicad_pro','kicad_sch']:shutil.copyfile(P/('candidate6.'+ext),P/(dst+'.'+ext))
print('Removed long GND routing segments:',removed)

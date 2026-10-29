from pathlib import Path
import wx,shutil
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='ldo-shift'
shutil.copy2(P/'clock-repair.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'clock-repair.kicad_pcb'))
f=next(f for f in b.GetFootprints() if f.GetReference()=='U4')
pads=list(f.Pads());tracks=list(b.GetTracks());remove=[]
for t in tracks:
 if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.F_Cu:continue
 if any(p.HitTest(t.GetStart()) or p.HitTest(t.GetEnd()) for p in pads):remove.append(t)
for t in remove:b.DeleteNative(t)
f.Move(k.VECTOR2I(k.FromMM(-.9),0))
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
print('Moved U4 left0.9mm; removed',len(remove),'old pad-entry segments')

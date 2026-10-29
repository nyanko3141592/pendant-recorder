from pathlib import Path
import wx,shutil
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='clock-repair'
shutil.copy2(P/'escape-repair.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'escape-repair.kicad_pcb'))
tracks=list(b.GetTracks())
for t in tracks:
 if t.GetNetname()!='/SD_CLK_MCU':continue
 if isinstance(t,k.PCB_VIA) and abs(k.ToMM(t.GetPosition().x)-13.5)<.001 and abs(k.ToMM(t.GetPosition().y)-6.4625)<.001:continue
 b.DeleteNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)

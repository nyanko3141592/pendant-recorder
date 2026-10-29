from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;b=k.LoadBoard(str(P/'mic-ground-route.kicad_pcb'))
rip={'/SD_DAT1','/SD_DAT2','/USB_DP','/USB_DM','/PDM_CLK_MCU'};counts={}
for t in list(b.GetTracks()):
 if t.GetNetname() in rip:
  counts[t.GetNetname()]=counts.get(t.GetNetname(),0)+1;b.DeleteNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'escape-repair.kicad_pcb'),b)
shutil.copyfile(P/'mic-ground-route.kicad_pro',P/'escape-repair.kicad_pro')
(P/'escape-ripup.json').write_text(json.dumps(dict(status='EXPERIMENT_NOT_ADOPTED',removed_track_via_counts=counts,reason='Free MCU/gate escape corridors; USB old multilayer unpaired routing needs replacement regardless'),indent=2)+'\n')
print(counts)

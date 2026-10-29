from pathlib import Path
import wx,shutil
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='charge-via-probe'
shutil.copy2(P/'local-repair.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'local-repair.kicad_pcb'))
v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(4.3275),k.FromMM(15.9)));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet('/CHG_N').GetNetCode());b.Add(v)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)

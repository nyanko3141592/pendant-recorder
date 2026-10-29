from pathlib import Path
import pcbnew as k,wx,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'usb-island-local-open.kicad_pcb';b=k.LoadBoard(str(src));z=k.ZONE(b);z.SetLayer(k.In2_Cu);z.SetIsRuleArea(True);z.SetDoNotAllowTracks(True);z.SetDoNotAllowVias(False);z.SetDoNotAllowZoneFills(False);z.SetDoNotAllowPads(False);z.SetDoNotAllowFootprints(False);z.Outline().NewOutline()
for x,y in [(16.5,3.5),(21.5,3.5),(21.5,9.55),(16.5,9.55)]:z.Outline().Append(k.FromMM(x),k.FromMM(y))
b.AddNative(z);z.thisown=False;out=w/'usb-ground-bridge-open.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))

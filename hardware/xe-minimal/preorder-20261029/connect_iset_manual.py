from pathlib import Path
import pcbnew as k,wx,json,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'iset-ilim-routed.kicad_pcb';b=k.LoadBoard(str(src));path=json.loads((w/'iset-connect-screen.json').read_text())['F.Cu']['paths'][0]['path_mm']
for a,c in zip(path,path[1:]):
 t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(c[0]),k.FromMM(c[1])));t.SetWidth(k.FromMM(.127));t.SetLayer(k.F_Cu);t.SetNetCode(b.FindNet('/ISET').GetNetCode());b.AddNative(t);t.thisown=False
out=w/'iset-manual-connected.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))

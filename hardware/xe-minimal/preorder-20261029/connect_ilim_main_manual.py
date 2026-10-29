from pathlib import Path
import pcbnew as k,wx,json,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'r42-escape-unrouted.kicad_pcb';b=k.LoadBoard(str(src));routes=json.loads((w/'ilim-main-connect-screen.json').read_text());layer=next(name for name in ['F.Cu','In2.Cu'] if routes[name]['paths']);path=routes[layer]['paths'][0]['path_mm']
path.append([10.845,22.065]) # Terminate at the target via centre, not merely its copper edge.
for a,c in zip(path,path[1:]):
 t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(c[0]),k.FromMM(c[1])));t.SetWidth(k.FromMM(.127));t.SetLayer(k.F_Cu if layer=='F.Cu' else k.In2_Cu);t.SetNetCode(b.FindNet('/ILIM_VSET').GetNetCode());b.AddNative(t);t.thisown=False
out=w/'ilim-main-connected.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))

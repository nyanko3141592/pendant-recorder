from pathlib import Path
import pcbnew as k,wx,json,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'ground-islands-centered.kicad_pcb';b=k.LoadBoard(str(src));removed=[]
for t in list(b.GetTracks()):
 if not isinstance(t,k.PCB_VIA) and t.GetNetname()=='/SWDIO' and t.GetLayer()==k.In2_Cu:
  removed.append({'start':[k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y)],'end':[k.ToMM(t.GetEnd().x),k.ToMM(t.GetEnd().y)],'length_mm':k.ToMM(t.GetLength())});b.RemoveNative(t)
out=w/'usb-island-boundary-open.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
(w/'usb-island-boundary-open.json').write_text(json.dumps({'status':'DISCONNECTED_DIAGNOSTIC','removed':removed,'release_allowed':False},indent=2)+'\n')

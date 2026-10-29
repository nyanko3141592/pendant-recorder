from pathlib import Path
import pcbnew as k,wx,json,shutil,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'ilim-main-connected.kicad_pcb';b=k.LoadBoard(str(src));removed=[]
for t in list(b.GetTracks()):
 if not isinstance(t,k.PCB_VIA) and t.GetLayer()==k.In2_Cu and t.GetNetname()!='/GND':
  removed.append({'uuid':str(t.m_Uuid.AsString()),'net':str(t.GetNetname()),'length_mm':k.ToMM(t.GetLength())});b.RemoveNative(t)
out=w/'l3-empty-diagnostic.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
(w/'l3-empty-diagnostic.json').write_text(json.dumps({'status':'DIAGNOSTIC_DISCONNECTED_DO_NOT_ADOPT','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'removed':removed,'release_allowed':False},indent=2)+'\n')

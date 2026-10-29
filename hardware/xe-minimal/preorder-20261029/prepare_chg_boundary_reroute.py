from pathlib import Path
import pcbnew as k,wx,json,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'ground-islands-centered.kicad_pcb';b=k.LoadBoard(str(src));removed=[]
for t in list(b.GetTracks()):
 if not isinstance(t,k.PCB_VIA) and t.GetNetname()=='/CHG_ALLOW' and t.GetLayer()==k.In2_Cu and max(t.GetStart().y,t.GetEnd().y)<=k.FromMM(11.88151):
  removed.append({'uuid':str(t.m_Uuid.AsString()),'length_mm':k.ToMM(t.GetLength())});b.RemoveNative(t)
out=w/'chg-boundary-open.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
(w/'chg-boundary-open.json').write_text(json.dumps({'removed':removed,'source':[17.6025,3.552],'target':[21.9766,11.8815],'release_allowed':False},indent=2)+'\n')

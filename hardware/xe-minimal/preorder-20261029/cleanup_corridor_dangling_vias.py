from pathlib import Path
import pcbnew as k,wx,json,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'vbus-component-centered.kicad_pcb';b=k.LoadBoard(str(src));d=json.loads((w/'vbus-component-centered-drc.json').read_text());ids={i['uuid'] for v in d['violations'] if v['type']=='via_dangling' for i in v['items']};removed=[]
for t in list(b.GetTracks()):
 if str(t.m_Uuid.AsString()) in ids:
  assert isinstance(t,k.PCB_VIA) and t.GetNetname()!='/GND';removed.append({'uuid':str(t.m_Uuid.AsString()),'net':str(t.GetNetname()),'xy':[k.ToMM(t.GetPosition().x),k.ToMM(t.GetPosition().y)]});b.RemoveNative(t)
assert len(removed)==len(ids)
out=w/'corridor-connected-clean.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
(w/'corridor-dangling-via-cleanup.json').write_text(json.dumps({'removed':removed,'connectivity_requires_post_DRC':True,'release_allowed':False},indent=2)+'\n')

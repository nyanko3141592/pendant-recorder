from pathlib import Path
import pcbnew as k,wx,json,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'ground-islands-stitched.kicad_pcb';b=k.LoadBoard(str(src));original=k.LoadBoard(str(w/'corridor-connected-clean.kicad_pcb'));fixed={str(t.m_Uuid.AsString()) for t in original.GetTracks()};d=json.loads((w/'ground-islands-stitched-drc.json').read_text());items={str(t.m_Uuid.AsString()):t for t in b.GetTracks()};changes=[]
for v in d['violations']:
 if v['type']!='track_not_centered_on_via':continue
 a,c=[items[i['uuid']] for i in v['items']];t,via=(a,c) if not isinstance(a,k.PCB_VIA) else (c,a)
 assert str(t.m_Uuid.AsString()) not in fixed or t.GetNetname()=='/GND'
 pos=via.GetPosition();radius=via.GetWidth(k.F_Cu)/2+t.GetWidth()/2
 for attr in ['Start','End']:
  endpoint=getattr(t,'Get'+attr)()
  if 0<(endpoint-pos).EuclideanNorm()<radius:
   changes.append({'track':str(t.m_Uuid.AsString()),'endpoint':attr,'via':str(via.m_Uuid.AsString())});getattr(t,'Set'+attr)(pos)
for t in list(b.GetTracks()):
 if not isinstance(t,k.PCB_VIA) and t.GetStart()==t.GetEnd():
  assert str(t.m_Uuid.AsString()) not in fixed or t.GetNetname()=='/GND';b.RemoveNative(t)
out=w/'ground-islands-centered.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
(w/'ground-island-via-centering.json').write_text(json.dumps({'changes':changes,'release_allowed':False},indent=2)+'\n')

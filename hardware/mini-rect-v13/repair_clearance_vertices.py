from pathlib import Path
import wx,json,shutil,subprocess,math
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';src=P/'charger-plane-source.kicad_pcb';out=P/'charger-clearance.kicad_pcb';report=P/'charger-clearance-drc.json'
b=k.LoadBoard(str(src));shutil.copy2(src.with_suffix('.kicad_pro'),out.with_suffix('.kicad_pro'))
def run():
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
 subprocess.run([cli,'pcb','drc',str(out),'--format','json','-o',str(report)],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,check=True)
 return json.loads(report.read_text())
def xy(p):return p.x,p.y
history=[];d=run()
for iteration in range(6):
 tracks=list(b.GetTracks());by={t.m_Uuid.AsString():t for t in tracks};pads=[p for f in b.GetFootprints() for p in f.Pads()];sites=[]
 for v in d['violations']:
  if v['type']!='clearance':continue
  for item in v['items']:
   t=by.get(item['uuid'])
   if t is None or isinstance(t,k.PCB_VIA):continue
   for q in [t.GetStart(),t.GetEnd()]:
    if any(p.IsOnLayer(t.GetLayer()) and p.HitTest(q) for p in pads):continue
    if any(isinstance(z,k.PCB_VIA) and xy(z.GetPosition())==xy(q) for z in tracks):continue
    site=(xy(q),t.GetNetCode(),t.GetLayer())
    if site not in sites:sites.append(site)
 accepted=False
 for (x,y),net,layer in sites:
  attached=[(t,which) for t in tracks if not isinstance(t,k.PCB_VIA) and t.GetNetCode()==net and t.GetLayer()==layer for which,p in [('start',t.GetStart()),('end',t.GetEnd())] if xy(p)==(x,y)]
  for dx,dy in [(0,.01),(0,-.01),(.01,0),(-.01,0),(.01,.01),(-.01,.01),(.01,-.01),(-.01,-.01)]:
   q=k.VECTOR2I(x+k.FromMM(dx),y+k.FromMM(dy))
   for t,which in attached:(t.SetStart if which=='start' else t.SetEnd)(q)
   trial=run()
   if len(trial['violations'])<len(d['violations']) and len(trial['unconnected_items'])<=len(d['unconnected_items']):
    history.append(dict(x_mm=k.ToMM(x),y_mm=k.ToMM(y),dx_mm=dx,dy_mm=dy,remaining=len(trial['violations'])));d=trial;accepted=True;print(history[-1],flush=True);break
   for t,which in attached:(t.SetStart if which=='start' else t.SetEnd)(k.VECTOR2I(x,y))
  if accepted:break
 if not accepted or not d['violations']:break
d=run();(P/'charger-clearance-changes.json').write_text(json.dumps(history,indent=2)+'\n');print('RESULT',len(d['violations']),len(d['unconnected_items']),flush=True)

"""Continue from saved cleanup board, removing DRC-seeded dead-end chains."""
from pathlib import Path
import json,shutil,collections,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'input-route-source.kicad_pcb';out=P/'input-route-pruned.kicad_pcb'
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
b=k.LoadBoard(str(src));audit=[]
for step in range(15):
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
 rp=out.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'-o',str(rp),'--format','json'],check=True,stdout=subprocess.DEVNULL)
 d=json.loads(rp.read_text());ids={i['uuid'] for v in d['violations'] if v['type']=='track_dangling' for i in v['items']}
 tracks=list(b.GetTracks());ts={t.m_Uuid.AsString():t for t in tracks if not isinstance(t,k.PCB_VIA)};adj=collections.defaultdict(set)
 def key(t,p):return t.GetNetCode(),t.GetLayer(),p.x,p.y
 for uid,t in ts.items():
  adj[key(t,t.GetStart())].add(uid);adj[key(t,t.GetEnd())].add(uid)
 pads=[p for f in b.GetFootprints() for p in f.Pads()];vias=[t for t in tracks if isinstance(t,k.PCB_VIA)]
 def terminal(t,p):
  return any(x.GetNetCode()==t.GetNetCode() and x.IsOnLayer(t.GetLayer()) and x.HitTest(p) for x in pads) or any(x.GetNetCode()==t.GetNetCode() and x.HitTest(p) for x in vias)
 remove=set()
 for uid in ids:
  if uid not in ts:continue
  t=ts[uid];assert t.GetNetname() not in ['/USB_DP','/USB_DM']
  starts=[p for p in [t.GetStart(),t.GetEnd()] if len(adj[key(t,p)])==1 and not terminal(t,p)]
  if not starts:remove.add(uid);continue
  p=starts[0]
  while uid not in remove:
   remove.add(uid);t=ts[uid];q=t.GetEnd() if p==t.GetStart() else t.GetStart()
   if terminal(t,q):break
   neighbors=adj[key(t,q)]
   if len(neighbors)!=2:break
   uid2=next(i for i in neighbors if i!=uid)
   if uid2 in remove:break
   uid=uid2;p=q
 audit.append({'pass':step,'drc':len(d['violations']),'unconnected':len(d['unconnected_items']),'chain_segments_removed':len(remove)})
 print(audit[-1],flush=True)
 if not remove:break
 for uid in remove:b.DeleteNative(ts[uid])
else:raise RuntimeError('Chainprune notconverged')
for t in b.GetTracks():
 if t.GetNetname() in ['/USB_DP','/USB_DM']:t.SetLocked(True)
n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetTrackWidth(k.FromMM(.127));n.SetClearance(k.FromMM(.1));n.SetViaDiameter(k.FromMM(.45));n.SetViaDrill(k.FromMM(.2))
k.SaveBoard(str(out),b);dsn=P/'input-route.dsn';assert k.ExportSpecctraDSN(b,str(dsn));s=dsn.read_text().replace('(circuit\n','(circuit\n        (use_layer F.Cu In2.Cu In4.Cu B.Cu)\n');dsn.write_text(s)
(P/'chain-prune-review.json').write_text(json.dumps({'status':'UNROUTED','passes':audit,'USB_geometry_locked':True},indent=2)+'\n')

import pcbnew as k
import wx
app=wx.App(False)
import json
from pathlib import Path
P=Path(__file__).resolve().parent;b=k.LoadBoard(str(P/'before-shared-guard/pendant-xe-minimal.kicad_pcb'));fps={f.GetReference():f for f in b.GetFootprints()};newnet=next(p.GetNet() for f in b.GetFootprints() for p in f.Pads() if p.GetNetname()=='/V3V3');changes={'U12':'8','R37':'1','R38':'1','R40':'1','C29':'1'}
pads=[p for ref,n in changes.items() for p in fps[ref].Pads() if p.GetNumber()==n];tracks=[t for t in b.GetTracks() if t.GetNetname()=='/VBUS_LIMITED'];remove=[];front=[]
for t in tracks:
 if any(p.HitTest(t.GetStart()) or p.HitTest(t.GetEnd()) for p in pads):remove.append(t);front.extend([t.GetStart(),t.GetEnd()])
while True:
 more=[t for t in tracks if t not in remove and any(t.GetStart()==pt or t.GetEnd()==pt for pt in front)]
 if not more:break
 for t in more:remove.append(t);front.extend([t.GetStart(),t.GetEnd()])
for t in remove:b.RemoveNative(t)
for p in pads:assert p.GetNetname()=='/VBUS_LIMITED';p.SetNet(newnet)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'pendant-xe-minimal.kicad_pcb'),b)
(P/'guard-supply-application.json').write_text(json.dumps({'status':'APPLIED_PENDING_QUALIFICATION','changed_pads':changes,'old_net':'VBUS_LIMITED','new_net':'V3V3','old_tracks_removed':len(remove),'limits':['BOR4 factory programming/readback not implemented','Added always-on load and cell-temperature threshold tolerances require budget/qualification','Power-rail transient and startup timing not measured']},indent=2)+'\n');print('changed',len(pads),'removed tracks',len(remove))

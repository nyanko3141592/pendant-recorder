from pathlib import Path
import json
import wx
app=wx.App(False)
import pcbnew as k
R=Path.cwd()
for v in 'ab':
 P=R/f'hardware/compact-{v}';b=k.LoadBoard(str(P/f'compact-{v}.kicad_pcb'))
 assert k.ImportSpecctraSES(b,str(P/'route.ses'))
 for f in b.GetFootprints():
  if f.GetReference()=='J2':f.SetValue('0781710003 / DTP401525-XE')
  if f.GetReference()=='U8':
   pads=[p for p in f.Pads() if p.GetDrillSize().x>0]
   (P/'mic-port.json').write_text(json.dumps([dict(x=k.ToMM(p.GetPosition().x),y=k.ToMM(p.GetPosition().y),diameter=k.ToMM(p.GetDrillSize().x)) for p in pads]))
 for t in b.GetTracks():
  if not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):t.SetWidth(k.FromMM(.1))
 k.SaveBoard(str(P/f'compact-{v}.kicad_pcb'),b)
 d=json.loads((P/'order-status.json').read_text());d.update(tracks_and_vias=len(list(b.GetTracks())),status='PARTIALLY_ROUTED_REVIEW_NOT_FOR_ORDER',case_mm=[38,39,8.9] if v=='a' else [20,39,14.5]);(P/'order-status.json').write_text(json.dumps(d,indent=2))
 print(v,d['tracks_and_vias'])

"""Import router output into separate unqualified board and report geometry."""
from pathlib import Path
import json,shutil,hashlib
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent
b=k.LoadBoard(str(P/'charger-route-source.kicad_pcb'))
assert k.ImportSpecctraSES(b,str(P/'charger-route-trial.ses'))
k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(P/'charger-route-trial.kicad_pcb'),b)
shutil.copyfile(P/'charger-route-source.kicad_pro',P/'charger-route-trial.kicad_pro')
nets={}
for t in b.GetTracks():
 d=nets.setdefault(t.GetNetname(),dict(length_mm=0,vias=0,layers=[],widths_mm=[]))
 if isinstance(t,k.PCB_VIA):d['vias']+=1
 else:
  d['length_mm']+=k.ToMM(t.GetLength())
  d['layers'].append(b.GetLayerName(t.GetLayer()));d['widths_mm'].append(round(k.ToMM(t.GetWidth()),4))
for d in nets.values():
 d['length_mm']=round(d['length_mm'],3);d['layers']=sorted(set(d['layers']));d['widths_mm']=sorted(set(d['widths_mm']))
r=dict(status='AUTOROUTED_TRIAL_NOT_RELEASED',source_sha256=hashlib.sha256((P/'charger-route-source.kicad_pcb').read_bytes()).hexdigest(),board_sha256=hashlib.sha256((P/'charger-route-trial.kicad_pcb').read_bytes()).hexdigest(),nets=nets,limitations=['No ground planes or return path qualification yet','USB pair routing/impedance not approved','Supply widths and decoupling loops need review','KiCad DRC and actual schematic parity still required','Layer stackup not selected with fabricator'])
(P/'charger-route-geometry.json').write_text(json.dumps(r,indent=2)+'\n')
print(len(b.GetTracks()),'track/via objects; imported trial only')

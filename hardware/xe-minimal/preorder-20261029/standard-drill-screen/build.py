from pathlib import Path
import json,hashlib,shutil
import wx,pcbnew as k
app=wx.App(False)
w=Path(__file__).resolve().parent
src=w.parent/'release-review-20261029-aligned/design'
for name in ['pendant-review.kicad_sch','pendant-review.kicad_pro','pendant-review.kicad_dru','fp-lib-table']:
 if (src/name).exists():shutil.copy2(src/name,w/name)
shutil.copytree(src/'footprints',w/'footprints',dirs_exist_ok=True)
b=k.LoadBoard(str(src/'pendant-review.kicad_pcb'));rows=[]
for v in b.GetTracks():
 if isinstance(v,k.PCB_VIA) and v.GetDrillValue()<k.FromMM(.2):
  rows.append({'uuid':str(v.m_Uuid.AsString()),'net':v.GetNetname(),'xy_mm':[k.ToMM(v.GetPosition().x),k.ToMM(v.GetPosition().y)],'old_diameter_mm':k.ToMM(v.GetWidth(k.F_Cu)),'old_drill_mm':k.ToMM(v.GetDrillValue())})
  v.SetDrill(k.FromMM(.2));v.SetWidth(k.F_Cu,k.FromMM(.45))
assert len(rows)==6
k.SaveBoard(str(w/'pendant-review.kicad_pcb'),b)
(w/'changes.json').write_text(json.dumps({'source_sha256':hashlib.sha256((src/'pendant-review.kicad_pcb').read_bytes()).hexdigest(),'changes':rows,'new_drill_mm':.2,'new_diameter_mm':.45,'position_and_tracks_unchanged':True},indent=2)+'\n')
print('Expanded six vias in separate candidate')

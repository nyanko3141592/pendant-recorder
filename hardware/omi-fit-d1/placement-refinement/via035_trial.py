from pathlib import Path
import pcbnew as p,json,shutil
P=Path(__file__).resolve().parent;s='candidate6v4';t='candidate6v35'
b=p.LoadBoard(str(P/(s+'.kicad_pcb')))
for tr in list(b.GetTracks()):b.Delete(tr)
n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetViaDiameter(p.FromMM(.35));n.SetViaDrill(p.FromMM(.15))
p.SaveBoard(str(P/(t+'.kicad_pcb')),b)
d=json.load(open(P/(s+'.kicad_pro')));d['board']['design_settings']['rules']['min_via_diameter']=.35;d['board']['design_settings']['rules']['min_through_hole_diameter']=.15
for nc in d['net_settings']['classes']:nc['via_diameter']=.35;nc['via_drill']=.15
(P/(t+'.kicad_pro')).write_text(json.dumps(d,indent=2));shutil.copyfile(P/(s+'.kicad_sch'),P/(t+'.kicad_sch'))
assert p.ExportSpecctraDSN(b,str(P/(t+'.dsn')))

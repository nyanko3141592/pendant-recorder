import pcbnew as p, json,shutil
from pathlib import Path
P=Path(__file__).resolve().parent
for layers in [4,6]:
 src='candidate' if layers==4 else 'candidate6';dst=f'candidate{layers}v4';b=p.LoadBoard(str(P/(src+'.kicad_pcb')))
 for t in list(b.GetTracks()):b.Delete(t)
 n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetViaDiameter(p.FromMM(.4));n.SetViaDrill(p.FromMM(.2));n.SetTrackWidth(p.FromMM(.1));n.SetClearance(p.FromMM(.1))
 p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(P/(dst+'.kicad_pcb')),b)
 pro=json.load(open(P/(src+'.kicad_pro')));pro['board']['design_settings']['rules']['min_via_diameter']=.4
 for nc in pro['net_settings']['classes']:nc['via_diameter']=.4
 (P/(dst+'.kicad_pro')).write_text(json.dumps(pro,indent=2));shutil.copyfile(P/(src+'.kicad_sch'),P/(dst+'.kicad_sch'));assert p.ExportSpecctraDSN(b,str(P/(dst+'.dsn')))

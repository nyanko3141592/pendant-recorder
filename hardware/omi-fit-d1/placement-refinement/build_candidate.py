from pathlib import Path
import json,shutil
import pcbnew as p
P=Path(__file__).resolve().parent;S=P.parent;b=p.LoadBoard(str(S/'omi-fit-d1.kicad_pcb'));d=json.load(open(P/'candidate.json'))['placements']
for t in list(b.GetTracks()):b.Delete(t)
for f in b.GetFootprints():
 v=d[f.GetReference()]
 if f.IsFlipped()!=(v['side']=='B'):f.Flip(f.GetPosition(),False)
 f.SetOrientationDegrees(v['rotation']);f.SetPosition(p.VECTOR2I(0,0));bb=f.GetBoundingBox(False,False)
 f.SetPosition(p.VECTOR2I(p.FromMM(100+v['x'])-bb.GetCenter().x,p.FromMM(100+v['y'])-bb.GetCenter().y))
n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetClearance(p.FromMM(.1));n.SetTrackWidth(p.FromMM(.1));n.SetViaDiameter(p.FromMM(.5));n.SetViaDrill(p.FromMM(.2))
p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(P/'candidate.kicad_pcb'),b)
shutil.copyfile(S/'omi-fit-d1.kicad_pro',P/'candidate.kicad_pro');shutil.copyfile(S/'omi-fit-d1.kicad_sch',P/'candidate.kicad_sch')
assert p.ExportSpecctraDSN(b,str(P/'candidate.dsn'))
print('candidate exported; main PCB unchanged')

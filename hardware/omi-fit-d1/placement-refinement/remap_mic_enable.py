from pathlib import Path
import pcbnew as p,shutil
P=Path(__file__).resolve().parent;s='candidate6v35-grid';dst='candidate6gpio'
b=p.LoadBoard(str(P/(s+'.kicad_pcb')))
u=next(f for f in b.GetFootprints() if f.GetReference()=='U1');pads={a.GetNumber():a for a in u.Pads()};mic=pads['19'].GetNet();nc=pads['41'].GetNet();nc.SetNetname('unconnected-(U1-PB1-Pad19)');pads['19'].SetNet(nc);pads['41'].SetNet(mic)
b.BuildListOfNets();p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(P/(dst+'.kicad_pcb')),b)
shutil.copyfile(P/'candidate6v35.kicad_pro',P/(dst+'.kicad_pro'));shutil.copyfile(P/'pin-remap/omi-fit-d1.kicad_sch',P/(dst+'.kicad_sch'))

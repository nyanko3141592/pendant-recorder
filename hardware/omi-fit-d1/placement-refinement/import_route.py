from pathlib import Path
import pcbnew as p,sys
P=Path(__file__).resolve().parent
s=sys.argv[1];b=p.LoadBoard(str(P/(s+'.kicad_pcb')))
assert p.ImportSpecctraSES(b,str(P/(s+'.ses')))
n=0
for t in b.GetTracks():
 if type(t)==p.PCB_TRACK and t.GetWidth()<p.FromMM(.1):t.SetWidth(p.FromMM(.1));n+=1
p.ZONE_FILLER(b).Fill(b.Zones())
p.SaveBoard(str(P/(s+'.kicad_pcb')),b)
print('Normalized tracks',n)

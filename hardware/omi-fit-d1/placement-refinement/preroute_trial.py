import pcbnew as p,json,shutil
from pathlib import Path
P=Path(__file__).resolve().parent;s='candidate6gpio';dst='candidate6pre';b=p.LoadBoard(str(P/(s+'.kicad_pcb')))
for tr in list(b.GetTracks()):b.Delete(tr)
other=p.LoadBoard(str(P/'candidate6usb.kicad_pcb'))
f=next(f for f in b.GetFootprints() if f.GetReference()=='R4');g=next(f for f in other.GetFootprints() if f.GetReference()=='R4')
if f.IsFlipped()!=g.IsFlipped():f.Flip(f.GetPosition(),False)
f.SetOrientationDegrees(g.GetOrientationDegrees());f.SetPosition(g.GetPosition())
p.SaveBoard(str(P/(dst+'.kicad_pcb')),b)
for ext in ['kicad_sch','kicad_pro']:shutil.copyfile(P/(s+'.'+ext),P/(dst+'.'+ext))
pads={(f.GetReference(),a.GetNumber()):a for f in b.GetFootprints() for a in f.Pads()}
a=pads['U1','41'];z=pads['U6','3']
items=[{'uuid':i.m_Uuid.AsString(),'pos':{'x':p.ToMM(i.GetPosition().x),'y':p.ToMM(i.GetPosition().y)}} for i in [a,z]]
(P/'pre-target.json').write_text(json.dumps({'unconnected_items':[{'items':items}]}))

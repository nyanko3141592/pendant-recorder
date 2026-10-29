"""Isolated U10 paste-only revision; no canonical files changed."""
from pathlib import Path
import shutil,json,hashlib,subprocess
import pcbnew as k,wx
app=wx.App(False)
o=Path(__file__).resolve().parent;d=o/'u10-paste-candidate';d.mkdir(exist_ok=False)
base=o/'pendant-xe-minimal';dest=d/'pendant-xe-minimal'
for ext in ('.kicad_pro','.kicad_dru','.kicad_sch'):shutil.copyfile(base.with_suffix(ext),dest.with_suffix(ext))
(d/'fp-lib-table').write_text((o/'fp-lib-table').read_text().replace('${KIPRJMOD}',str(o)))
b=k.LoadBoard(str(base.with_suffix('.kicad_pcb')))
f=next(f for f in b.GetFootprints() if f.GetReference()=='U10')
original=list(f.Pads());assert len(original)==4
for p in original:
 layers=p.GetLayerSet();assert layers.Contains(k.B_Paste);layers.RemoveLayer(k.B_Paste);p.SetLayerSet(layers)
 aperture=k.PAD(f);aperture.SetNumber('');aperture.SetAttribute(k.PAD_ATTRIB_SMD);aperture.SetShape(k.PAD_SHAPE_ROUNDRECT)
 aperture.SetSize(k.VECTOR2I(250000,250000));aperture.SetRoundRectRadiusRatio(.2)
 ls=k.LSET();ls.AddLayer(k.B_Paste);aperture.SetLayerSet(ls);aperture.SetPosition(p.GetPosition());aperture.SetOrientation(p.GetOrientation())
 f.AddNative(aperture);aperture.thisown=False
k.SaveBoard(str(dest.with_suffix('.kicad_pcb')),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(dest.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(d/'drc.json')],check=True)
subprocess.run([cli,'pcb','export','gerbers',str(dest.with_suffix('.kicad_pcb')),'-l','F.Cu,In1.Cu,In2.Cu,In3.Cu,In4.Cu,B.Cu,F.Mask,B.Mask,F.Paste,B.Paste','-o',str(d/'gerbers')+'/'],check=True)
(d/'change-review.json').write_text(json.dumps({'status':'CANDIDATE_NOT_ADOPTED','source_pcb_sha256':hashlib.sha256(base.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'change':'U10 four copper pads lose B.Paste membership; four unnumbered paste-only 0.25 mm rounded squares R0.05 at same centers','candidate_pcb_sha256':hashlib.sha256(dest.with_suffix('.kicad_pcb').read_bytes()).hexdigest()},indent=2)+'\n')

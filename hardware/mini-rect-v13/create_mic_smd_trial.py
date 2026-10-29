"""Isolated SMD-mask/stencil candidate, no release replacement."""
from pathlib import Path
import wx,pcbnew as k,shutil,json,hashlib
app=wx.App(False);p=Path(__file__).resolve().parent;src=p/'usb-ground-plane-candidate.kicad_pcb';out=p/'mic-smd-mask-candidate.kicad_pcb';b=k.LoadBoard(str(src));fp=next(f for f in b.GetFootprints() if f.GetReference()=='U8');electrical={a.GetNumber():a for a in fp.Pads() if a.GetNumber()}
for n in ['1','2','3','4']:
 a=electrical[n];a.SetSize(k.VECTOR2I(k.FromMM(.55),k.FromMM(.85)));a.SetLocalSolderMaskMargin(k.FromMM(-.05))
# Same nominal mask ring: R.58..1.03; copper overlap .05 at both edges.
a=electrical['5'];a.SetLocalSolderMaskMargin(k.FromMM(-.05))
count=0
for a in fp.Pads():
 if a.GetNumber() or not a.IsOnLayer(k.F_Paste):continue
 pos=a.GetPosition()
 nearest=min((electrical[n] for n in ['1','2','3','4']),key=lambda q:(q.GetPosition().x-pos.x)**2+(q.GetPosition().y-pos.y)**2)
 q=nearest.GetPosition()
 if (q.x-pos.x)**2+(q.y-pos.y)**2<k.FromMM(.2)**2:
  a.SetShape(k.PAD_SHAPE_OVAL);a.SetSize(k.VECTOR2I(k.FromMM(.4),k.FromMM(.6)));a.SetPosition(q);count+=1
assert count==4
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
text=out.read_text();old='(end 0.81 0.81)\n\t\t\t\t\t(width 0.46)';assert text.count(old)==1;text=text.replace(old,'(end 0.805 0.81)\n\t\t\t\t\t(width 0.55)');out.write_text(text)
updated=k.LoadBoard(str(out));k.ZONE_FILLER(updated).Fill(updated.Zones());k.SaveBoard(str(out),updated)
shutil.copy2(src.with_suffix('.kicad_pro'),out.with_suffix('.kicad_pro'))
(p/'mic-smd-mask-trial.json').write_text(json.dumps(dict(status='ISOLATED_CANDIDATE_NOT_ADOPTED',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),candidate_sha256=hashlib.sha256(out.read_bytes()).hexdigest(),signal_copper_mm=[.55,.85],signal_mask_mm=[.45,.75],paste_mm=[.4,.6],ring_copper_radii_mm=[.53,1.08],ring_mask_radii_mm=[.58,1.03],mask_overlap_mm=.05,limitations=['Copper overlap is engineering proposal, supplier mask registration not approved','DRC, net parity and emitted mask/paste geometry must be checked','Unchanged ring paste segments still need full drawing comparison']),indent=2)+'\n')

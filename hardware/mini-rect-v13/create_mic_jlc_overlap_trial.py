"""Raise SMD copper overlap to 0.08 mm against JLC's 0.076 mm guidance."""
from pathlib import Path
import wx,pcbnew as k,shutil,json,hashlib
app=wx.App(False);p=Path(__file__).resolve().parent
src=p/'mic-smd-ground-candidate.kicad_pcb';out=p/'mic-jlc-overlap-candidate.kicad_pcb'
b=k.LoadBoard(str(src));fp=next(f for f in b.GetFootprints() if f.GetReference()=='U8')
for pad in fp.Pads():
 if pad.GetNumber() in ['1','2','3','4']:pad.SetSize(k.VECTOR2I(k.FromMM(.61),k.FromMM(.91)))
 if pad.GetNumber():pad.SetLocalSolderMaskMargin(k.FromMM(-.08))
k.SaveBoard(str(out),b)
s=out.read_text();old='(end 0.805 0.81)\n\t\t\t\t\t(width 0.55)';assert s.count(old)==1
out.write_text(s.replace(old,'(end 0.805 0.81)\n\t\t\t\t\t(width 0.61)'))
b=k.LoadBoard(str(out));fp=next(f for f in b.GetFootprints() if f.GetReference()=='U8');fp.SetFPID(k.LIB_ID('Pendant','IM69D130_JLC_SMD_trial'));k.FootprintSave(str(p/'Pendant.pretty'),fp)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);shutil.copy2(src.with_suffix('.kicad_pro'),out.with_suffix('.kicad_pro'))
report=dict(status='ISOLATED_TRIAL_NOT_RELEASED',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),candidate_sha256=hashlib.sha256(out.read_bytes()).hexdigest(),copper_overlap_mm=.08,jlc_minimum_mm=.076,signal_copper_mm=[.61,.91],target_signal_mask_mm=[.45,.75],target_ring_mask_radii_mm=[.58,1.03],source_url='https://jlcpcb.com/help/article/how-to-order-boards-with-solder-mask-defined-pads',remaining=['DRC','Emitted mask geometry','Net parity','CAM note and supplier confirmation'])
(p/'mic-jlc-overlap-trial.json').write_text(json.dumps(report,indent=2)+'\n')

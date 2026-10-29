"""Same nominal 1mm copper / 2mm mask using explicit mask-only pads."""
from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);P=Path(__file__).resolve().parent/'current-single-carrier-trial';src=P/'panel-metadata.kicad_pcb';b=k.LoadBoard(str(src));changed=[]
for f in b.GetFootprints():
 if not f.GetReference().startswith('FID'):continue
 layer=f.GetLayer();mask=k.F_Mask if layer==k.F_Cu else k.B_Mask
 for pad in f.Pads():
  ls=k.LSET();ls.AddLayer(layer);pad.SetLayerSet(ls);pad.SetLocalSolderMaskMargin(0)
 aperture=k.PAD(f);aperture.SetNumber('');aperture.SetAttribute(k.PAD_ATTRIB_SMD);aperture.SetShape(k.PAD_SHAPE_CIRCLE);aperture.SetSize(k.VECTOR2I(k.FromMM(2),k.FromMM(2)));aperture.SetPosition(f.GetPosition());ls=k.LSET();ls.AddLayer(mask);aperture.SetLayerSet(ls);f.Add(aperture);changed.append(f.GetReference())
out=P/'panel-explicit-pad.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:(P/('panel-explicit-pad'+ext)).write_bytes((P/('panel-metadata'+ext)).read_bytes())
(P/'explicit-pad-trial-review.json').write_text(json.dumps({'status':'SAME_NOMINAL_MASK_GEOMETRY_TRIAL_PENDING_EXPORT_CHECK','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'changed':changed,'nominal_fiducial_copper_mm':1,'nominal_fiducial_mask_opening_mm':2,'limits':['No DRC exclusion changes.','Gerber equivalence and DRC pending.','No microphone pad dimensions changed.']},indent=2)+'\n')

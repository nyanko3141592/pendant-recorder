from pathlib import Path
exec(open(str(Path(__file__).with_name('isolate_panel_mask.py'))).read().split("for f in list(b.GetFootprints()):")[0].replace("'mask-isolation'","'mask-explicit-candidate'"))
for f in b.GetFootprints():
 if not f.GetReference().startswith('FID'):continue
 q=list(f.Pads())[0];mask=k.F_Mask if q.IsOnLayer(k.F_Cu) else k.B_Mask
 ls=q.GetLayerSet();ls.RemoveLayer(mask);q.SetLayerSet(ls);q.SetLocalSolderMaskMargin(0)
 aperture=k.PAD(f);aperture.SetNumber('');aperture.SetAttribute(k.PAD_ATTRIB_SMD);aperture.SetShape(k.PAD_SHAPE_CIRCLE);aperture.SetSize(k.VECTOR2I(2000000,2000000));aperture.SetPosition(q.GetPosition());ml=k.LSET();ml.AddLayer(mask);aperture.SetLayerSet(ml);f.AddNative(aperture);aperture.thisown=False
k.SaveBoard(str(d/'panel.kicad_pcb'),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(d/'panel.kicad_pcb'),'--format','json','--severity-all','-o',str(d/'drc.json')],check=True)

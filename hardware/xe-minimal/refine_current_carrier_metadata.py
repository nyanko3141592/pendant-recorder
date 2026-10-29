from pathlib import Path
import json,hashlib
import pcbnew as k,wx
app=wx.App(False);P=Path(__file__).resolve().parent/'current-single-carrier-trial';src=P/'panel.kicad_pcb';b=k.LoadBoard(str(src));before=hashlib.sha256(src.read_bytes()).hexdigest();changed=[]
for f in b.GetFootprints():
 if not (f.GetReference().startswith('TOOL') or f.GetReference().startswith('FID')):continue
 f.Reference().SetVisible(False);f.Value().SetVisible(False)
 layers=[k.F_CrtYd,k.B_CrtYd] if f.GetReference().startswith('TOOL') else [k.B_CrtYd if f.GetLayer()==k.B_Cu else k.F_CrtYd]
 for layer in layers:
  sh=k.PCB_SHAPE(f);sh.SetShape(k.SHAPE_T_CIRCLE);sh.SetCenter(f.GetPosition());sh.SetEnd(f.GetPosition()+k.VECTOR2I(k.FromMM(1.5),0));sh.SetLayer(layer);sh.SetWidth(k.FromMM(.05));f.Add(sh)
 changed.append(f.GetReference())
out=P/'panel-metadata.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:
 source=P/('panel'+ext)
 if source.exists():(P/('panel-metadata'+ext)).write_bytes(source.read_bytes())
(P/'metadata-refinement-review.json').write_text(json.dumps({'source_sha256':before,'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'changed_references':changed,'changes':['Hide reference/value fields on mechanical-only carrier items','Add 3mm diameter courtyard envelopes on relevant sides'],'status':'METADATA_REFINEMENT_PENDING_DRC'},indent=2)+'\n');print(changed)

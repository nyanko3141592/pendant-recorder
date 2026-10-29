"""Change only R42 selection; no charging release or USB power approval."""
from pathlib import Path
import json,shutil,hashlib
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'usb-return-candidate.kicad_pcb';out=P/'charger-4v1-candidate.kicad_pcb';b=k.LoadBoard(str(src));f=next(f for f in b.GetFootprints() if f.GetReference()=='R42');assert f.GetValue()=='24k 1%';f.SetValue('130k 1%');k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
(P/'charger-4v1-review.json').write_text(json.dumps({'status':'NOT_RELEASED','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'changed':'R42 value24k->130k1%; copper unchanged','charge_enabled':False,'remaining':['USB preconfiguration and suspend input current control','500mA configuration negotiation','Independent temperature sensor contact and faults','4.1V charge cycle/termination/runtime and overshoot validation']},indent=2)+'\n')

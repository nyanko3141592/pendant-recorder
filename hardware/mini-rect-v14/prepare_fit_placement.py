import wx,pcbnew as k,shutil,json,hashlib
from pathlib import Path
app=wx.App(False);P=Path(__file__).resolve().parent;src=P/'domestic-pack-routed-candidate.kicad_pcb';out=P/'case-fit-placement-candidate.kicad_pcb'
b=k.LoadBoard(str(src));f={x.GetReference():x for x in b.GetFootprints()}
changes=[]
for ref in ['J2','TH1']:
 x=f[ref];x.Flip(x.GetPosition(),False)
 if ref=='J2':x.SetPosition(k.VECTOR2I(k.FromMM(26),k.FromMM(31)))
 changes.append({'ref':ref,'change':'F to B'+('; x26' if ref=='J2' else '')})
f['J1'].Move(k.VECTOR2I(0,k.FromMM(20)));changes.append({'ref':'J1','change':'y+20mm to new board end; all old tracks need rerouting'})
k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
(P/'case-fit-placement-review.json').write_text(json.dumps(dict(status='MECHANICAL_PLACEMENT_NOT_ROUTED_NOT_RELEASED',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),candidate_sha256=hashlib.sha256(out.read_bytes()).hexdigest(),changes=changes,reason='F-side PH breaks15mm stack; old USB location becomes recessed behind extended board;TH1 must face battery',electrical_status='Old tracks retained only as routing reference, disconnected at moved pads. No DRC pass claimed.'),indent=2)+'\n')

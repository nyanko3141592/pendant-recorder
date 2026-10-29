"""Local clearance trial; preserves original board. Not a manufacturing release."""
from pathlib import Path
import wx,pcbnew as k,shutil,json,hashlib
app=wx.App(False);P=Path(__file__).resolve().parent
src=P/'six-layer-stackup-candidate.kicad_pcb';b=k.LoadBoard(str(src));changes=[]
for ref,dy in [('R13',.175),('Q3',-.125)]:
 f=next(f for f in b.GetFootprints() if f.GetReference()==ref);delta=k.VECTOR2I(0,k.FromMM(dy));pads=list(f.Pads());moved=[]
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA):continue
  for endpoint in ['Start','End']:
   q=getattr(t,'Get'+endpoint)()
   if any(p.GetNetCode()==t.GetNetCode() and p.IsOnLayer(t.GetLayer()) and p.HitTest(q) for p in pads):
    getattr(t,'Set'+endpoint)(q+delta);moved.append([t.m_Uuid.AsString(),endpoint])
 before=f.GetPosition();f.SetPosition(before+delta);changes.append({'ref':ref,'delta_y_mm':dy,'shifted_track_endpoints':moved})
k.ZONE_FILLER(b).Fill(b.Zones());out=P/'acoustic-clearance-placement-candidate.kicad_pcb';k.SaveBoard(str(out),b);shutil.copyfile(src.with_suffix('.kicad_pro'),out.with_suffix('.kicad_pro'))
(P/'acoustic-clearance-placement-review.json').write_text(json.dumps({'status':'PLACEMENT_TRIAL_NOT_RELEASED','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'changes':changes,'limitations':['Moves connected track ends only; DRC/parity and route review required','Mechanical model and design placement source not updated; candidate only','Goal is 0.30 mm nominal gap to existing acoustic riser']},indent=2)+'\n')

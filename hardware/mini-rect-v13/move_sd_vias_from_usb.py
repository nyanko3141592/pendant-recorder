from pathlib import Path
import wx,pcbnew as k,json,hashlib,shutil
app=wx.App(False);P=Path(__file__).resolve().parent;src=P/'usb-stripline-pair-candidate.kicad_pcb';b=k.LoadBoard(str(src));changes=[]
for uid in ['6fc3c13d-6bc9-4768-b85a-b4214e23291f']:
 v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()==uid);a=v.GetPosition();z=k.VECTOR2I(a.x-k.FromMM(.12),a.y);ends=0
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetNetCode()!=v.GetNetCode():continue
  if t.GetStart()==a:t.SetStart(z);ends+=1
  if t.GetEnd()==a:t.SetEnd(z);ends+=1
 assert ends>=2,(uid,ends)
 v.SetPosition(z);changes.append({'net':v.GetNetname(),'uuid':uid,'delta_x_mm':-.12,'track_ends':ends})
k.ZONE_FILLER(b).Fill(b.Zones());out=P/'usb-sd-via-clearance-candidate.kicad_pcb';k.SaveBoard(str(out),b);shutil.copyfile(src.with_suffix('.kicad_pro'),out.with_suffix('.kicad_pro'))
(P/'usb-sd-via-clearance-review.json').write_text(json.dumps({'status':'VIA_RELOCATION_TRIAL_NOT_RELEASED','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'changes':changes},indent=2)+'\n')

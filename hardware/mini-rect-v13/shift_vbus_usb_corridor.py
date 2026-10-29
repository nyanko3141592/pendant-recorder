from pathlib import Path
import wx,pcbnew as k,json,hashlib,shutil
app=wx.App(False);P=Path(__file__).resolve().parent;src=P/'usb-pair-sden-clearance-candidate.kicad_pcb';b=k.LoadBoard(str(src));vertices=[(12.451,12.4452),(12.451,11.9558),(12.8888,11.518)];moved=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetNetname()!='/VBUS_N' or t.GetLayer()!=k.In2_Cu:continue
 for end in ['Start','End']:
  q=getattr(t,'Get'+end)()
  if any(q==k.VECTOR2I(k.FromMM(x),k.FromMM(y)) for x,y in vertices):
   getattr(t,'Set'+end)(k.VECTOR2I(q.x+k.FromMM(.10),q.y));moved.append([t.m_Uuid.AsString(),end])
assert len(moved)==6
v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='1953967b-eb92-4259-b22c-319852e85c71');a=v.GetPosition();z=k.VECTOR2I(a.x+k.FromMM(.10),a.y)
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetNetCode()!=v.GetNetCode():continue
 if t.GetStart()==a:t.SetStart(z)
 if t.GetEnd()==a:t.SetEnd(z)
v.SetPosition(z)
k.ZONE_FILLER(b).Fill(b.Zones());out=P/'usb-vbus-corridor-candidate.kicad_pcb';k.SaveBoard(str(out),b);shutil.copyfile(src.with_suffix('.kicad_pro'),out.with_suffix('.kicad_pro'))
(P/'usb-vbus-corridor-review.json').write_text(json.dumps({'status':'TRIAL_NOT_RELEASED','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'moved_vertices_mm':vertices,'delta_x_mm':.10,'BOOT0_delta_x_mm':.10,'track_end_updates':moved,'width_preserved':True},indent=2)+'\n')

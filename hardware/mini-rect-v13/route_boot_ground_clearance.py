from pathlib import Path
import wx,pcbnew as k,json,hashlib,shutil
app=wx.App(False);P=Path(__file__).resolve().parent;src=P/'usb-vbus-corridor-candidate.kicad_pcb';b=k.LoadBoard(str(src));t=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='44e52ca4-2b96-4600-a2ba-8471534903d3');width=t.GetWidth();net=t.GetNetCode();b.DeleteNative(t)
points=[(13.2598,12.93),(13.3798,12.81),(13.3798,10.3485),(13.2598,10.2285)]
for a,z in zip(points,points[1:]):
 t=k.PCB_TRACK(b);t.SetLayer(k.F_Cu);t.SetNetCode(net);t.SetWidth(width);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));b.Add(t)
k.ZONE_FILLER(b).Fill(b.Zones());out=P/'usb-boot-ground-candidate.kicad_pcb';k.SaveBoard(str(out),b);shutil.copyfile(src.with_suffix('.kicad_pro'),out.with_suffix('.kicad_pro'))
(P/'usb-boot-ground-review.json').write_text(json.dumps({'status':'TRIAL_NOT_RELEASED','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'ground_path_mm':points,'width_mm':k.ToMM(width)},indent=2)+'\n')

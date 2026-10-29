"""Reroute two GND segments around widened microphone pads; candidate only."""
from pathlib import Path
import wx,pcbnew as k,shutil,json,hashlib
app=wx.App(False);p=Path(__file__).resolve().parent;src=p/'mic-smd-mask-candidate.kicad_pcb';out=p/'mic-smd-ground-candidate.kicad_pcb';b=k.LoadBoard(str(src))
ids={'40e10feb-41b7-42e8-a4c3-aa0709305e42','6da3d55d-df84-4914-adf2-807cf2a2d223'};old=[t for t in b.GetTracks() if t.m_Uuid.AsString() in ids];assert len(old)==2
net=old[0].GetNetCode();assert all(t.GetNetCode()==net and t.GetLayer()==k.F_Cu for t in old)
for t in old:b.DeleteNative(t)
points=[(15.6938,14.9902),(16.4,15.6964),(16.4,16.2),(16.6,16.4),(17.65,16.4),(17.65,16.5348)]
for a,z in zip(points,points[1:]):
 t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));t.SetWidth(k.FromMM(.127));t.SetLayer(k.F_Cu);t.SetNetCode(net);b.Add(t)
fp=next(f for f in b.GetFootprints() if f.GetReference()=='U8');fp.SetFPIDAsString('Pendant:IM69D130_SMD_mask_trial');k.FootprintSave(str(p/'Pendant.pretty'),fp)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);shutil.copy2(src.with_suffix('.kicad_pro'),out.with_suffix('.kicad_pro'))
(p/'mic-smd-ground-trial.json').write_text(json.dumps(dict(status='ROUTING_TRIAL_NOT_RELEASED',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),candidate_sha256=hashlib.sha256(out.read_bytes()).hexdigest(),removed_segment_uuids=sorted(ids),replacement_polyline_mm=points,width_mm=.127),indent=2)+'\n')

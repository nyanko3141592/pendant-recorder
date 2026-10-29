from pathlib import Path
import pcbnew as k,wx,json,hashlib,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'c32-ground-wide-trial.kicad_pcb';b=k.LoadBoard(str(src));audit=json.loads((w/'c32-old-branch-inspection.json').read_text());ids=set(audit['uuids']);removed=[]
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in ids:
  assert not isinstance(t,k.PCB_VIA) and t.GetLayer()==k.B_Cu and t.GetNetname()=='/VBUS_CHARGER';removed.append(t.m_Uuid.AsString());b.RemoveNative(t)
assert len(removed)==len(ids)
k.ZONE_FILLER(b).Fill(b.Zones());out=w/'c32-branch-clean-trial.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
r={'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'removed_old_B_track_segments':len(removed),'removed_length_mm':audit['old_branch_length_mm'],'release_allowed':False};(w/'c32-old-branch-removal.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))

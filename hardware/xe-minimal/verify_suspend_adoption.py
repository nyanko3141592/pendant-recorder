import pcbnew as k,wx,json,hashlib
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;old=O/'pendant-xe-minimal.kicad_pcb';new=O/'suspend-current-joined-candidate.kicad_pcb';a=k.LoadBoard(str(old));b=k.LoadBoard(str(new))
def tracks(board):
 out={}
 for t in board.GetTracks():
  v=isinstance(t,k.PCB_VIA);p,q=t.GetStart(),t.GetEnd();out[t.m_Uuid.AsString()]=(t.GetNetname(),v,t.GetLayer(),p.x,p.y,q.x,q.y,t.GetWidth(k.F_Cu) if v else t.GetWidth(),t.GetDrillValue() if v else 0)
 return out
x,y=tracks(a),tracks(b);removed=['529ee416-8edc-453e-937c-f2e3f3834d83','87957707-2634-4c85-a819-ae9ae61c5e0a','bc61ce2f-4af3-4039-9b54-d24ab2fd8813','de9ea054-7ecd-4068-a6f4-af0df9466521'];assert all(i in x and i not in y for i in removed);assert all(y.get(i)==v for i,v in x.items() if i not in removed);added=[i for i in y if i not in x];assert all(y[i][0] in ['/USB_SUSPEND_PULSE','/BUTTON_N'] for i in added)
for board in [a,b]:assert len(list(board.GetFootprints()))==89
fp=lambda board:sorted((f.GetReference(),f.GetPosition().x,f.GetPosition().y,f.GetOrientationDegrees(),f.GetLayer(),f.GetValue()) for f in board.GetFootprints())
assert fp(a)==fp(b)
for v in b.GetTracks():
 if isinstance(v,k.PCB_VIA) and v.GetNetname()=='/USB_SUSPEND_PULSE' and any(abs(k.ToMM(v.GetPosition().x)-x)<1e-6 for x in [13.0]):
  assert v.GetFillingMode()==k.FILLING_MODE_FILLED and v.GetCappingMode()==k.CAPPING_MODE_CAPPED
r={'status':'PARTIAL_LAYOUT_ACCEPTABLE_WITH_SI_QUALIFICATION_PENDING','source_sha256':hashlib.sha256(old.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(new.read_bytes()).hexdigest(),'all_existing_tracks_vias_preserved_except_four_button_segments':True,'removed_button_segment_uuids':removed,'footprint_placement_unchanged':True,'added_items':len(added),'usb_projection_screen':'suspend-plane-review.json','limitations':['GND DC connectivity is not an impedance or return-current simulation.','New control routing and rerouted button input require noise testing; not a manufacturing release.'],'adopted':False};(O/'suspend-adoption-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)

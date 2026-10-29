import pcbnew as k,wx,json,hashlib
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;old=O/'pendant-xe-minimal.kicad_pcb';new=O/'led-branch-rerouted-candidate.kicad_pcb';a=k.LoadBoard(str(old));b=k.LoadBoard(str(new))
def tracks(board):
 out={}
 for t in board.GetTracks():
  v=isinstance(t,k.PCB_VIA);p,q=t.GetStart(),t.GetEnd();out[t.m_Uuid.AsString()]=(t.GetNetname(),v,t.GetLayer(),p.x,p.y,q.x,q.y,t.GetWidth(k.F_Cu) if v else t.GetWidth(),t.GetDrillValue() if v else 0)
 return out
x,y=tracks(a),tracks(b);removed={'5cc594d5-b246-43e6-ab71-9aafc28f28cf','ac67f771-11d7-487a-a0a1-85b20e789f18','7dc9572c-1c6d-4b91-96fc-af7a78d86e6c'};changed={'04cd1f40-0c78-4f3a-bc9d-ffe5c9d268c9','23d9fbb0-2824-4103-8635-bffdf0c21446','d07ee42b-d474-4d0e-96ec-1b5326850753'};assert set(x)-set(y)==removed;assert {i for i in set(x)&set(y) if x[i]!=y[i]}==changed;assert all(y.get(i)==v for i,v in x.items() if i not in removed|changed);added=[i for i in y if i not in x];assert all(y[i][0] in ['/STATUS_LED','/SD_V3'] for i in added)
for board in [a,b]:assert len(list(board.GetFootprints()))==89
fp=lambda board:sorted((f.GetReference(),f.GetPosition().x,f.GetPosition().y,f.GetOrientationDegrees(),f.GetLayer(),f.GetValue()) for f in board.GetFootprints())
assert fp(a)==fp(b)
r={'status':'PARTIAL_LAYOUT_ACCEPTABLE_WITH_SI_QUALIFICATION_PENDING','source_sha256':hashlib.sha256(old.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(new.read_bytes()).hexdigest(),'all_other_existing_tracks_vias_preserved':True,'removed_power_segments':sorted(removed),'shifted_miso_items':sorted(changed),'footprint_placement_unchanged':True,'added_items':len(added),'usb_projection_screen':'led-branch-plane-review.json','limitations':['GND DC connectivity is not an impedance or return-current simulation.','In1 control route near oscillator requires noise testing; not a manufacturing release.'],'adopted':False};(O/'led-branch-adoption-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)

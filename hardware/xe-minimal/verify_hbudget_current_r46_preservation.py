import pcbnew as k,wx,json,hashlib
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;old=O/'pendant-xe-minimal.kicad_pcb';new=O/'hbudget-current-r46-joined-candidate.kicad_pcb';a=k.LoadBoard(str(old));b=k.LoadBoard(str(new))
def tracks(board):
 out={}
 for t in board.GetTracks():
  v=isinstance(t,k.PCB_VIA);p,q=t.GetStart(),t.GetEnd();out[t.m_Uuid.AsString()]=(t.GetNetname(),v,t.GetLayer(),p.x,p.y,q.x,q.y,t.GetWidth(k.F_Cu) if v else t.GetWidth(),t.GetDrillValue() if v else 0)
 return out
x,y=tracks(a),tracks(b);removed='065a6fcd-84f7-40ae-82de-750a79aa8318';assert removed in x and removed not in y;assert all(y.get(i)==v for i,v in x.items() if i!=removed);added=[i for i in y if i not in x];assert all(y[i][0] in ['/USB_HIGH_BUDGET','/BAT_ADC'] for i in added)
for board in [a,b]:assert len(list(board.GetFootprints()))==89
fp=lambda board:sorted((f.GetReference(),f.GetPosition().x,f.GetPosition().y,f.GetOrientationDegrees(),f.GetLayer(),f.GetValue()) for f in board.GetFootprints())
assert fp(a)==fp(b)
for v in b.GetTracks():
 if isinstance(v,k.PCB_VIA) and v.GetNetname()=='/USB_HIGH_BUDGET' and any(abs(k.ToMM(v.GetPosition().x)-x)<1e-6 for x in [9.9,17.1]):
  assert v.GetFillingMode()==k.FILLING_MODE_FILLED and v.GetCappingMode()==k.CAPPING_MODE_CAPPED
r={'status':'PARTIAL_LAYOUT_ACCEPTABLE_WITH_SI_QUALIFICATION_PENDING','source_sha256':hashlib.sha256(old.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(new.read_bytes()).hexdigest(),'all_existing_tracks_vias_preserved_except_one_bat_adc_segment':True,'removed_adc_segment_uuid':removed,'footprint_placement_unchanged':True,'added_items':len(added),'usb_projection_screen':'hbudget-current-r46-plane-review.json + MCU plane audit pending','limitations':['GND DC connectivity is not an impedance or return-current simulation.','New control routing and rerouted battery ADC require noise testing; not a manufacturing release.'],'adopted':False};(O/'hbudget-current-r46-preservation-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)

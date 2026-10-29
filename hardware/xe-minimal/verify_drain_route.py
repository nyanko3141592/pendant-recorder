import pcbnew as k,wx,json,hashlib
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;old=O/'pendant-xe-minimal.kicad_pcb';new=O/'drain-current-joined-candidate.kicad_pcb';a=k.LoadBoard(str(old));b=k.LoadBoard(str(new))
def tracks(board):
 out={}
 for t in board.GetTracks():
  v=isinstance(t,k.PCB_VIA);p,q=t.GetStart(),t.GetEnd();out[t.m_Uuid.AsString()]=(t.GetNetname(),v,t.GetLayer(),p.x,p.y,q.x,q.y,t.GetWidth(k.F_Cu) if v else t.GetWidth(),t.GetDrillValue() if v else 0)
 return out
x,y=tracks(a),tracks(b);removed={'5873b0a9-e596-46b1-823c-93375957f08b','daf16ff4-6333-407d-9d2d-8773b3a3ebb9','8288d200-a549-4c39-bcf0-29c52ec326ed'}
assert all(i in x and i not in y and x[i][0]=='/BAT' for i in removed)
assert all(y.get(i)==v for i,v in x.items() if i not in removed)
added=[i for i in y if i not in x];assert all(y[i][0] in ['/BAT','/USB_HIGH_BUDGET_DRAIN','/USB_ILIM_SET'] for i in added)
fp=lambda board:{f.GetReference():(f.GetPosition().x,f.GetPosition().y,f.GetOrientationDegrees(),f.GetLayer(),f.GetValue()) for f in board.GetFootprints()}
u,v=fp(a),fp(b);assert len(u)==len(v)==89;assert all(v.get(i)==q for i,q in u.items() if i!='R45')
f=next(f for f in b.GetFootprints() if f.GetReference()=='R45');pads={p.GetNumber():(k.ToMM(p.GetPosition().x),k.ToMM(p.GetPosition().y)) for p in f.Pads()};assert all(abs(z-w)<1e-6 for z,w in zip(pads['1'],(12.345,10.265)));assert all(abs(z-w)<1e-6 for z,w in zip(pads['2'],(12.345,11.285)))
for t in b.GetTracks():
 if t.m_Uuid.AsString() in added and t.GetNetname()=='/BAT':assert not isinstance(t,k.PCB_VIA) and t.GetWidth()==k.FromMM(.25)
r={'status':'ROUTED_CANDIDATE_INTEGRITY_VERIFIED_NOT_QUALIFIED','source_sha256':hashlib.sha256(old.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(new.read_bytes()).hexdigest(),'removed_bat_segments':sorted(removed),'unchanged_other_copper':True,'unchanged_other_88_footprints':True,'r45_old':u['R45'],'r45_new':v['R45'],'r45_pads_mm':pads,'bat_width_mm':.25,'added_bat_vias':0,'added_items':len(added),'limitations':['DRC zero; bench qualification and adoption remain.','Power impedance, signal integrity and complete mechanical fit unqualified.']};(O/'drain-route-integrity-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)

import pcbnew as k,wx,json,hashlib,math
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent
base=O/'pendant-xe-minimal.kicad_pcb';a=k.LoadBoard(str(base));ids={t.m_Uuid.AsString() for t in a.GetTracks()}
removed={'5873b0a9-e596-46b1-823c-93375957f08b','daf16ff4-6333-407d-9d2d-8773b3a3ebb9','8288d200-a549-4c39-bcf0-29c52ec326ed'}
def row(t,b):
 return {'layer':b.GetLayerName(t.GetLayer()),'length_mm':k.ToMM(t.GetLength()),'width_mm':k.ToMM(t.GetWidth()),'start_mm':[k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y)],'end_mm':[k.ToMM(t.GetEnd().x),k.ToMM(t.GetEnd().y)]}
old=[row(t,a) for t in a.GetTracks() if t.m_Uuid.AsString() in removed]
path=O/'drain-current-joined-candidate.kicad_pcb';b=k.LoadBoard(str(path));new=[row(t,b) for t in b.GetTracks() if t.m_Uuid.AsString() not in ids and t.GetNetname()=='/BAT' and not isinstance(t,k.PCB_VIA)]
lo=sum(r['length_mm'] for r in old);ln=sum(r['length_mm'] for r in new)
r={'status':'GEOMETRIC_COMPARISON_REJECTED_USB_CROSSING_CANDIDATE','source_sha256':hashlib.sha256(base.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'old_segments':old,'new_segments':new,'old_length_mm':lo,'new_length_mm':ln,'delta_mm':ln-lo,'limitations':['Candidate BAT crosses USB projection on adjacent reference layer; not adopted.','Copper thickness, resistance, transient voltage and return current are not measured.','Do not transfer these numbers to a different candidate.']};(O/'drain-bat-length-review.json').write_text(json.dumps(r,indent=2)+'\n');print(lo,ln,ln-lo)

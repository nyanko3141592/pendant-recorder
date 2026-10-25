import json,hashlib
from pathlib import Path
import pcbnew as k
P=Path(__file__).resolve().parent
f=P/'source/compact-b-v3.kicad_pcb';b=k.LoadBoard(str(f));out=[]
for p in b.GetFootprints():
 q=p.GetBoundingBox(False,False);ref=p.GetReference();h=.6
 if ref.startswith('U'):h=1.2
 if ref in ['U4','U6']:h=1.5
 if ref=='J1':h=3.56
 if ref=='J2':h=1.4
 if ref=='SW1':h=1.6
 if ref=='J3' or ref.startswith('TP'):h=.05
 out.append(dict(ref=ref,value=p.GetValue(),footprint=str(p.GetFPID().GetLibItemName()),x=k.ToMM(q.GetX()),y=k.ToMM(q.GetY()),w=k.ToMM(q.GetWidth()),d=k.ToMM(q.GetHeight()),height=h,side='B' if p.IsFlipped() else 'F',height_status='assumed envelope, not manufacturer-qualified'))
assert len(out)==75
(P/'source/components.json').write_text(json.dumps(out,indent=2))
(P/'source/provenance.json').write_text(json.dumps(dict(source='hardware/compact-b/electrical-placement-v3/compact-b.kicad_pcb',sha256=hashlib.sha256(f.read_bytes()).hexdigest(),snapshot_date='2026-10-25',base_commit='6e84b9a',extractor='KiCad pcbnew GetBoundingBox(False,False), actual saved board',pcb_mm=[18,33,.8],count=len(out)),indent=2))
print([(x['ref'],x['x'],x['y'],x['w'],x['d']) for x in out if x['ref'] in ['J1','J2']])

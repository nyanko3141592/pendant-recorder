"""Verify raw placement export against current PCB; not assembler rotation approval."""
from pathlib import Path
import csv,json,hashlib,pcbnew as k,wx
app=wx.App(False);S=Path(__file__).resolve().parent/(__import__('sys').argv[1] if len(__import__('sys').argv)>1 else 'dmn-land-trial');pcb=S/'pendant-xe-minimal.kicad_pcb';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();D=S/('fabrication-review-'+sha(pcb)[:12]);b=k.LoadBoard(str(pcb));fps={f.GetReference():f for f in b.GetFootprints()};excluded={'J3','TP1','TP2','TP3','TP5','TP6'}
pos=list(csv.DictReader((D/'positions-raw.csv').open()));bom=list(csv.DictReader((D/'candidate-mpn-review.csv').open()))
assert len(pos)==len(bom)==75
assert len({r['Ref']for r in pos})==75
assert {r['Ref']for r in pos}=={r['Reference']for r in bom}==set(fps)-excluded
for r in pos:
 f=fps[r['Ref']];p=f.GetPosition()
 assert abs(float(r['PosX'])-k.ToMM(p.x))<1e-6
 assert abs(float(r['PosY'])+k.ToMM(p.y))<1e-6
 assert abs((float(r['Rot'])-f.GetOrientationDegrees()+180)%360-180)<1e-6
 assert r['Side']==('bottom'if f.IsFlipped()else'top')
 assert r['Package']==str(f.GetFPID().GetLibItemName())
 assert r['Val']==str(f.GetValue())
report={'status':'RAW_PLACEMENTS_MATCH_PCB_NOT_ASSEMBLY_APPROVAL','source_pcb_sha256':sha(pcb),'positions':75,'candidate_mpn_rows':75,'excluded_bare_board_features':sorted(excluded),'coordinate_convention':'Absolute origin; CSVY=-KiCadY; no bottom X mirroring; rotation equals KiCad orientation','verified':['reference sets','XY position','rotation','side','footprint package name','raw schematic value'],'limits':['Assembler feeder orientation and pin1 verification are pending','Candidate MPN mapping does not prove electrical suitability or stock','Q6/Q7 raw value remains generic2N7002; DMN2056U-7 remains unadopted proposal']}
(D/'placement-reconciliation.json').write_text(json.dumps(report,indent=2)+'\n')
p=D/'REVIEW-ONLY.json';m=json.loads(p.read_text());m['unresolved']=[v for v in m['unresolved']if v!='Raw placements include bare-board features until filtered'];m['files_sha256']={str(f.relative_to(D)):sha(f)for f in sorted(D.rglob('*'))if f.is_file()and f!=p};p.write_text(json.dumps(m,indent=2)+'\n');print(json.dumps(report,indent=2))

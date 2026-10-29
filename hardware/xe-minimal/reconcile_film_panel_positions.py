"""Bind panel positions to reviewed unit BOM; no assembly-machine rotation approval."""
from pathlib import Path
import csv,json,hashlib
from decimal import Decimal
P=Path(__file__).resolve().parent;D=P/'film-single-carrier-trial';U=P/'film-integration-trial'
def read(path,key):
 with path.open() as f:
  rows=list(csv.DictReader(f))
 assert len(rows)==len({r[key]for r in rows})
 return {r[key]:r for r in rows}
a=read(U/'candidate-assembly-positions-NOT-RELEASE.csv','Ref');b=read(D/'panel-refilled-all-positions.csv','Ref');bom=read(U/'reconciled-candidate-bom.csv','Reference')
expected={k for k,v in bom.items() if v['Assembly_process']=='PCB_ASSEMBLY_CANDIDATE'}
assert set(a)==expected and expected<=set(b)
selected=[]
for ref in sorted(expected):
 x,y=a[ref],b[ref]
 for key in ['Val','Package','Rot','Side']:assert x[key]==y[key],(ref,key)
 assert Decimal(y['PosX'])-Decimal(x['PosX'])==Decimal('23'),ref
 assert Decimal(y['PosY'])-Decimal(x['PosY'])==Decimal('-21.5'),ref
 selected.append(y)
assert len(selected)==74 and 'TH1'not in expected
out=D/'candidate-panel-assembly-positions-NOT-RELEASE.csv'
with out.open('w',newline='') as f:
 w=csv.DictWriter(f,fieldnames=list(selected[0]));w.writeheader();w.writerows(selected)
paths=[U/'pendant-xe-minimal.kicad_pcb',D/'panel-refilled.kicad_pcb',U/'reconciled-candidate-bom.csv',U/'candidate-assembly-positions-NOT-RELEASE.csv',D/'panel-refilled-all-positions.csv',out]
r={'status':'PANEL_UNIT_PLACEMENT_MATCH_NOT_ASSEMBLER_APPROVAL','source_sha256':{str(p.relative_to(P)):hashlib.sha256(p.read_bytes()).hexdigest()for p in paths},'matched_components':len(selected),'position_csv_offset_mm':[23,-21.5],'pcb_coordinate_translation_mm':[23,21.5],'explanation':'KiCad position CSV uses upward-positive Y; PCB editor coordinates use downward-positive Y. All values, packages, rotations and sides match unit CSV.','excluded_export_refs':sorted(set(b)-expected),'seller_only_ref':'TH1','limitations':['No vendor rotation conventions, pin1/nozzle inspection or bottom-side preview approval.','Component placement does not qualify mechanical panel cutting or support.','Exact MPN choices and costs remain provisional.']}
(D/'panel-placement-reconciliation.json').write_text(json.dumps(r,indent=2)+'\n');print('74 references: coordinates, rotations, sides and identities matched')

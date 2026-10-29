"""Local review export only. No order, upload or release."""
from pathlib import Path
import json,hashlib,subprocess,csv,re
p=Path(__file__).resolve().parent/'electrical-panel-candidate-v3';pcb=p/'panel.kicad_pcb';sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest();state=json.loads((p/'current-state.json').read_text());assert sha(pcb)==state['panel_sha256'];drc=json.loads((p/'current-drc.json').read_text());assert not drc['violations'] and not drc['unconnected_items']
d=p/('fabrication-review-'+sha(pcb)[:12]);d.mkdir(exist_ok=False);cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
commands=[['pcb','export','gerbers','--layers','F.Cu,In1.Cu,In2.Cu,In3.Cu,In4.Cu,B.Cu,F.Paste,B.Paste,F.Mask,B.Mask,F.Silkscreen,B.Silkscreen,Edge.Cuts','--subtract-soldermask','--output',str(d/'gerbers'),str(pcb)],['pcb','export','drill','--format','excellon','--drill-origin','absolute','--excellon-units','mm','--excellon-separate-th','--generate-map','--map-format','pdf','--generate-report','--report-path',str(d/'drill-report.txt'),'--output',str(d/'drill'),str(pcb)],['pcb','export','pos','--format','csv','--units','mm','--side','both','--exclude-dnp','--output',str(d/'positions-raw.csv'),str(pcb)]]
for cmd in commands:subprocess.run([cli]+cmd,check=True)
with (d/'positions-raw.csv').open() as f:
 reader=csv.DictReader(f);fields=reader.fieldnames;rows=list(reader)
assembly=[];excluded=[]
for row in rows:
 m=re.fullmatch(r'P([1-6])_(.+)',row['Ref'])
 if m and m[2]!='J3' and not m[2].startswith('TP'):assembly.append(row)
 else:excluded.append(row['Ref'])
assert len(assembly)==480
assert all(sum(v['Ref'].startswith(f'P{n}_') for v in assembly)==80 for n in range(1,7))
with (d/'positions-assembly-review.csv').open('w',newline='') as f:
 w=csv.DictWriter(f,fieldnames=fields);w.writeheader();w.writerows(assembly)
assert sha(pcb)==state['panel_sha256']
r={'status':'PANEL_ENGINEERING_REVIEW_ONLY_DO_NOT_ORDER','source_pcb_sha256':sha(pcb),'commands':commands,'assembly_positions':480,'units':6,'purchased_parts_per_unit':80,'excluded_raw_position_refs':excluded,'coordinate_convention':'KiCad absolute XY, position export Y negated; bottom is not mirrored. Assembler rotation convention unqualified.','files_sha256':{str(f.relative_to(d)):sha(f) for f in sorted(d.rglob('*')) if f.is_file()},'unresolved':['Independent CAM/drill/orientation checks','Panel tool clearance, stiffness, fracture and burr qualification','Exact BOM/MPN availability, purchase quantity and cost','Filled/capped via map translated to all six units','Source standalone graphics not yet copied; assembly labeling review','Runtime, thermal, enclosure and Omi-size decision'],'upload_or_order_performed':False}
(d/'REVIEW-ONLY.json').write_text(json.dumps(r,indent=2)+'\n');print(d)

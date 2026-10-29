"""Official-column CPL review; no inferred package rotation corrections."""
from pathlib import Path
import csv,json,hashlib
P=Path(__file__).resolve().parent;F=P/'fabrication-review';B=P/'procurement-review/BOM-JLC-REVIEW-ONLY.csv';raw=F/'RAW-KICAD-POSITIONS-NOT-JLC-APPROVED.csv'
bom=list(csv.DictReader(B.open()));positions=list(csv.DictReader(raw.open()));refs=[x['Designator'] for x in bom];assert len(refs)==len(set(refs))
by={x['Ref']:x for x in positions};assert len(by)==len(positions)
index=json.loads((P/'current-candidate-index.json').read_text());parts={x['ref']:x for x in index['parts']}
assert set(by)==set(refs)
excluded=set(parts)-set(refs);assert excluded=={'J3','TP1','TP2','TP3','TP5','TP6'}
rows=[]
for ref in refs:
 r=by[ref];part=parts[ref]
 assert abs(float(r['PosX'])-part['x_mm'])<1e-6 and abs(float(r['PosY'])+part['y_mm'])<1e-6
 assert r['Side']==('bottom' if part['side']=='B' else 'top')
 rows.append({'Designator':ref,'Mid X':r['PosX'],'Mid Y':r['PosY'],'Rotation':r['Rot'],'Layer':r['Side']})
out=F/'CPL-JLC-REVIEW-ONLY.csv'
with out.open('w',newline='') as f:
 w=csv.DictWriter(f,fieldnames=['Designator','Mid X','Mid Y','Rotation','Layer']);w.writeheader();w.writerows(rows)
report={'status':'BOM_CPL_REFS_AND_SOURCE_COORDINATES_PASS_ROTATIONS_UNAPPROVED','rows':len(rows),'excluded_pcb_features':sorted(excluded),'unresolved_part_ids':[r['Designator'] for r in bom if not r['LCSC Part #']],'coordinate_units':'mm','transform':'Header rename only; retain exported KiCad signed coordinates, angles and board side','source':'https://jlcpcb.com/help/article/how-to-generate-the-bom-and-centroid-file-from-kicad','board_sha256':index['sha256'],'input_sha256':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [raw,B]},'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'limitations':['BOM identities and stock not fully approved','Footprint origins may need package centroid offsets; no offset inferred','Part rotations need JLC model/pin1 preview review before ordering','No uploaded assembly preview or manufacturing approval']}
(F/'cpl-review.json').write_text(json.dumps(report,indent=2)+'\n');print(report['rows'], 'assembly rows; unresolved IDs',report['unresolved_part_ids'])

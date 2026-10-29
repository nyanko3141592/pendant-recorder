from pathlib import Path
import csv,json,hashlib,re
O=Path(__file__).resolve().parent/'usb-reference-via-small-trial/fabrication-review-10f561cc51b6'
bom=list(csv.DictReader((O/'bom-engineering.csv').open()));pos=list(csv.DictReader((O/'positions-raw.csv').open()));excluded={'J3','TP1','TP2','TP3','TP5','TP6'}
assert len({r['Reference']for r in bom})==len(bom);assert len({r['Ref']for r in pos})==len(pos)
assembly=[r for r in bom if r['Reference']not in excluded];assert {r['Reference']for r in assembly}=={r['Ref']for r in pos}
with (O/'bom-assembly-candidates.csv').open('w')as f:w=csv.DictWriter(f,fieldnames=list(bom[0]));w.writeheader();w.writerows(assembly)
# Detect exact ordering strings only when explicitly written, without inventing purchase specs.
rows=[]
for r in assembly:
 ref=r['Reference'];value=r['Part/value'];note=r['Design note'];mpn=''
 match=re.search(r'\b(?:RC0402FR-[A-Z0-9]+|TNPW0402[A-Z0-9]+)\b',note)
 if match:mpn=match.group()
 elif ref.startswith(('U','D')):mpn=value.split(' candidate')[0].strip()
 elif ref in ['Q3','Q4']:mpn=value
 elif ref=='J1':mpn='USB4105-GF-A'
 elif ref=='J2':mpn='781710003'
 elif ref=='TH1':mpn='NCP18XH103F03RB'
 rows.append({'Reference':ref,'Value':value,'MPN_written_in_source':mpn,'Status':'EXPLICIT_CANDIDATE_NOT_QUALIFIED'if mpn else'EXACT_ORDERING_PART_MISSING','Source':'bom-engineering.csv','Remaining':'Supplier SKU, availability, price, electrical and assembly qualification'})
with(O/'mpn-gap-review.csv').open('w')as f:w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
r={'status':'ASSEMBLY_REFERENCE_SETS_MATCH_NOT_PURCHASE_READY','bom_rows':len(bom),'assembly_rows':len(assembly),'position_rows':len(pos),'bare_board_excluded':sorted(excluded),'explicit_candidate_mpn_count':sum(bool(x['MPN_written_in_source'])for x in rows),'missing_exact_mpn_refs':[x['Reference']for x in rows if not x['MPN_written_in_source']],'limits':['Only explicit strings in engineering BOM; other selection records may exist and need reconciliation','Candidate string does not prove footprint/pinout or purchasing availability','Q6/Q7 generic2N7002 not treated as vendor-qualified order code','Rotation convention, prices and assembly quote unresolved']}
(O/'assembly-bom-reconciliation.json').write_text(json.dumps(r,indent=2)+'\n')
p=O/'REVIEW-ONLY.json';m=json.loads(p.read_text());m['files_sha256']={str(f.relative_to(O)):hashlib.sha256(f.read_bytes()).hexdigest()for f in sorted(O.rglob('*'))if f.is_file()and f!=p};p.write_text(json.dumps(m,indent=2)+'\n');print(json.dumps(r,indent=2))

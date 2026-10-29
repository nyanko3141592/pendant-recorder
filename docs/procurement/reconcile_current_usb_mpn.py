from pathlib import Path
import csv,json,hashlib
O=Path(__file__).resolve().parent;root=O.parents[1];D=root/'hardware/xe-minimal/fixed-usb-limit-trial/usb-reference-via-small-trial/fabrication-review-10f561cc51b6';oldp=root/'hardware/mini-rect-v15/design.json';old={r['ref']:r for r in json.loads(oldp.read_text())['parts']};costp=O/'v15-five-unit-cost-review.json';cost=json.loads(costp.read_text());byref={ref:r for r in cost['rows']for ref in r['references']};base=list(csv.DictReader((D/'mpn-gap-review.csv').open()));bom={r['Reference']:r for r in csv.DictReader((D/'bom-assembly-candidates.csv').open())};addedp=O/'xe-added-parts-procurement-review.json';added={r['ref']:r for r in json.loads(addedp.read_text())['shared_passive_candidates']};matches=[];conflicts=[]
for row in base:
 ref=row['Reference'];cur=bom[ref];candidate=None;source=None
 if ref in old and ref in byref and cur['Part/value']==old[ref]['value'] and cur['Footprint']==old[ref]['footprint']:
  candidate=byref[ref]['mpn'];source=str(costp.relative_to(root))
 if ref in added and cur['Part/value']==added[ref]['value']and cur['Footprint']==added[ref]['footprint']:
  candidate=added[ref]['candidate_mpn'];source=str(addedp.relative_to(root))
 if candidate:
  if row['MPN_written_in_source']and row['MPN_written_in_source']!=candidate:conflicts.append({'ref':ref,'current':row['MPN_written_in_source'],'historical':candidate,'action':'retain current explicit candidate; review historical mismatch'})
  elif not row['MPN_written_in_source']:
   row['MPN_written_in_source']=candidate;row['Source']=source;row['Status']='HISTORICAL_VALUE_AND_FOOTPRINT_MATCH_NOT_QUALIFIED';matches.append(ref)
c31p=O/'xe-c31-candidate-review.json'
if c31p.exists():
 c31=json.loads(c31p.read_text())
 row=next(r for r in base if r['Reference']=='C31');row['MPN_written_in_source']=c31['mpn'];row['Source']=str(c31p.relative_to(root));row['Status']=c31['status']
with(D/'mpn-reconciled-candidates.csv').open('w')as f:w=csv.DictWriter(f,fieldnames=list(base[0]));w.writeheader();w.writerows(base)
r={'status':'CANDIDATE_MPN_RECONCILIATION_NOT_PURCHASE_RELEASE','source_sha256':{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest()for p in [oldp,costp,addedp,c31p,D/'bom-assembly-candidates.csv',D/'mpn-gap-review.csv']},'newly_reconciled_refs':matches,'conflicts':conflicts,'candidate_count':sum(bool(r['MPN_written_in_source'])for r in base),'missing_refs':[r['Reference']for r in base if not r['MPN_written_in_source']],'limits':['Historical source identity preserved; no current stock/price claim','Exact value string and footprint required; no inferred substitution','Circuit qualification, manufacturer tolerances and assembler SKU acceptance remain open']};(D/'mpn-reconciliation-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))

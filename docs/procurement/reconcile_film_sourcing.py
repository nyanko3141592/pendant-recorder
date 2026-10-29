"""Exact-MPN evidence index for current BOM; no inferred stock or quote."""
from pathlib import Path
import csv,json,hashlib
R=Path(__file__).resolve().parents[2];D=Path(__file__).resolve().parent
bom=R/'hardware/xe-minimal/film-integration-trial/five-unit-candidate-quantities.csv'
index={}
for p in sorted(D.glob('xe-*-availability.json')):
 d=json.loads(p.read_text());mpn=d.get('mpn')
 if not isinstance(mpn,str):continue
 index.setdefault(mpn,[]).append({'path':str(p.relative_to(R)),'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'status':d.get('status'),'url':d.get('url')or d.get('source'),'observation_date':d.get('observed_date')or d.get('date')})
# Recent retail observations use a structured item list, not top-level MPN.
p=D/'xe-film-r13-th1-retail-prices.json';d=json.loads(p.read_text())
for item in d['items']:
 index.setdefault(item['mpn'],[]).append({'path':str(p.relative_to(R)),'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'status':d['status'],'url':item['source'],'observation_date':d['checked_date']})
p=D/'v15-price-observations.json';historical=json.loads(p.read_text())
for item in historical['parts']:
 if not item.get('tiers_ex_tax_JPY'):continue
 index.setdefault(item['mpn'],[]).append({'path':str(p.relative_to(R)),'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'status':'HISTORICAL_RETAIL_PRICE_NOT_LIVE_INVENTORY','url':item['url'],'observation_date':historical['observed_date']})
rows=[]
for b in csv.DictReader(bom.open()):
 mpn=b['Candidate_MPN'];e=index.get(mpn,[])
 rows.append({'mpn':mpn,'references':b['References'],'installed_quantity_five':int(b['Installed_qty_five_devices']),'assembly_process':b['Assembly_process'],'evidence':e,'coverage':'EXACT_MPN_RECORDS_EXIST_REVIEW_STATUS' if e else 'NO_EXACT_MPN_RECORD_IN_INDEX','purchase_quantity':None,'complete_delivered_cost':None})
assert len(rows)==39 and sum(r['installed_quantity_five'] for r in rows)==375
r={'status':'CURRENT_BOM_SOURCING_EVIDENCE_INDEX_NOT_PROCUREMENT_APPROVAL','bom_sha256':hashlib.sha256(bom.read_bytes()).hexdigest(),'rows':rows,'counts':{'groups':len(rows),'with_records':sum(bool(r['evidence'])for r in rows),'without_records':sum(not r['evidence']for r in rows)},'limits':['Record presence does not mean stock, purchasability, assembly acceptance or qualified part selection.','Historical records are indexed as dated observations, not revalidated live inventory.','Index searches explicit availability records, recent R13/TH1 retail record and dated v15 price tables; no record means this index lacks evidence, not proof no other file or supplier exists.','Quotes and attrition, feeder fees, freight, taxes and full manufacturing costs remain unresolved.']}
(D/'xe-film-sourcing-coverage.json').write_text(json.dumps(r,indent=2)+'\n')
print(r['counts']);print('Missing:',', '.join(row['mpn'] for row in rows if not row['evidence']))

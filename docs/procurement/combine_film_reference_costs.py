"""Nonoverlapping dated JPY retail and USD observations; not a delivered quote."""
from pathlib import Path
import json,hashlib
from decimal import Decimal
D=Path(__file__).resolve().parent;R=D.parents[1]
base=D/'xe-film-reference-parts-cost.json';b=json.loads(base.read_text());rows=b['rows'];priced={r['mpn'] for r in rows if r['reference_cost_JPY_ex_tax']is not None}
map_=[('xe-u11-jlc-availability.json','unit_USD_at1'),('xe-dmn-jlc-availability.json','unit_USD_at1'),('xe-dmn63-jlc-availability.json','unit_USD_displayed'),('xe-tps22950-jlc-availability.json','unit_USD_displayed'),('xe-r44-retail-availability.json','unit_USD_displayed'),('xe-c31-retail-availability.json','unit_USD_displayed')]
added=[];sources={str(base.relative_to(R)):hashlib.sha256(base.read_bytes()).hexdigest()}
for name,key in map_:
 p=D/name;d=json.loads(p.read_text());mpn=d['mpn'];assert mpn not in priced
 row=next(r for r in rows if r['mpn']==mpn);qty=row['installed_five'];unit=Decimal(str(d[key]));amount=unit*qty
 added.append({'mpn':mpn,'references':row['references'],'quantity_installed_five':qty,'unit_USD_observed':str(unit),'reference_extension_USD':str(amount),'source':str(p.relative_to(R)),'date':d['observed_date'],'url':d['url'],'status':d['status']});priced.add(mpn);sources[str(p.relative_to(R))]=hashlib.sha256(p.read_bytes()).hexdigest()
out={'status':'PARTIAL_MIXED_ROUTE_REFERENCE_NOT_DELIVERED_QUOTE','priced_groups':len(priced),'total_groups':len(rows),'JPY_reference':{'source':str(base.relative_to(R)),'subtotal_ex_tax':b['partial_subtotal_JPY_ex_tax']},'USD_additional_rows':added,'USD_partial_subtotal':str(sum(Decimal(r['reference_extension_USD'])for r in added)),'unpriced_mpns':[r['mpn']for r in rows if r['mpn']not in priced],'complete_total':None,'sources_sha256':sources,'limits':['All rows are nonoverlapping exact MPNs from current demand. No old whole-budget subtotal is imported.','USD rows use installed quantities at displayed one-piece price, not final purchase quantity or an attrition-inclusive quote.','JPY retail and USD assembler/US-retail routes are not a confirmed coherent procurement plan.','No FX conversion or tax normalization; currencies remain separate.','No live stock reservation, orders, shipping, PCB, assembly, inspection, handling, case or labor included.']}
(D/'xe-film-combined-reference-cost.json').write_text(json.dumps(out,indent=2)+'\n');print(out['priced_groups'],out['JPY_reference'],out['USD_partial_subtotal'],out['unpriced_mpns'])

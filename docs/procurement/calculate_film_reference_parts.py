"""Current installed demand against dated retail price tables; not a purchase BOM."""
from pathlib import Path
from decimal import Decimal
import csv,json,hashlib
R=Path(__file__).resolve().parents[2];D=Path(__file__).resolve().parent
bom=R/'hardware/xe-minimal/film-integration-trial/five-unit-candidate-quantities.csv'
old_path=D/'v15-price-observations.json';old=json.loads(old_path.read_text());assert old['currency']=='JPY' and old['tax_basis']=='Exclusive'
index={p['mpn']:{'tiers':p['tiers_ex_tax_JPY'],'source':str(old_path.relative_to(R)),'url':p['url'],'date':old['observed_date']}for p in old['parts'] if p.get('tiers_ex_tax_JPY')}
recent_path=D/'xe-film-r13-th1-retail-prices.json';recent=json.loads(recent_path.read_text())
for p in recent['items']:
 tiers=([{'min_quantity':p['price_break_quantity'],'unit_price':p['display_unit_JPY_ex_tax']}] if p['reference']=='TH1' else [{'min_quantity':t['quantity'],'unit_price':t['unit']}for t in p['tiers_JPY_ex_tax']])
 index[p['mpn']]={'tiers':tiers,'source':str(recent_path.relative_to(R)),'url':p['source'],'date':recent['checked_date']}
extra_path=D/'xe-film-additional-retail-prices.json';extra=json.loads(extra_path.read_text())
for p in extra['parts']:
 index[p['mpn']]={'tiers':p['tiers_ex_tax_JPY'],'source':str(extra_path.relative_to(R)),'url':p['url'],'date':extra['observed_date']}
rows=[];subtotal=Decimal(0)
for b in csv.DictReader(bom.open()):
 mpn=b['Candidate_MPN'];demand=int(b['Installed_qty_five_devices']);p=index.get(mpn)
 row={'mpn':mpn,'references':b['References'],'installed_five':demand,'status':'NO_RETAIL_JPY_TABLE_IN_THIS_CALCULATION','reference_cost_JPY_ex_tax':None}
 if p:
  tiers=sorted(p['tiers'],key=lambda t:t['min_quantity']);options=[]
  for qty in sorted({demand}|{t['min_quantity']for t in tiers if t['min_quantity']>=demand}):
   valid=[t for t in tiers if t['min_quantity']<=qty]
   if not valid:continue
   unit=Decimal(str(valid[-1]['unit_price']));options.append((Decimal(qty)*unit,qty,unit))
  assert options,mpn
  cost,qty,unit=min(options);subtotal+=cost
  row.update(status='DATED_PRICE_SCENARIO_NO_ATTRITION',reference_quantity=qty,reference_unit_JPY_ex_tax=str(unit),reference_cost_JPY_ex_tax=str(cost),price_source=p)
 rows.append(row)
assert len(rows)==39 and sum(x['installed_five']for x in rows)==375
out={'status':'PARTIAL_REFERENCE_PARTS_COST_NOT_QUOTE','rows':rows,'priced_groups':sum(r['reference_cost_JPY_ex_tax']is not None for r in rows),'unpriced_mpns':[r['mpn']for r in rows if r['reference_cost_JPY_ex_tax']is None],'partial_subtotal_JPY_ex_tax':str(subtotal),'complete_total':None,'sources_sha256':{str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest()for p in (bom,old_path,recent_path,extra_path)},'rules':['Use current exact-MPN installed demand; never transfer old whole-budget subtotals.','Choose cheapest listed quantity at or above installed demand from the available tiers; no attrition or assembly minimum is implied.','Prices are dated retail observations, not current availability or selected procurement routes.','Unknown rows remain null, not zero. This subtotal is not a lower or upper bound on delivered cost.','Excludes PCB, assembly, fees, shipment, tax, wire/insulation, case, labor, testing and battery; battery is not sold.','No order performed.']}
(D/'xe-film-reference-parts-cost.json').write_text(json.dumps(out,indent=2)+'\n');print(out['priced_groups'],'priced groups; partial JPY ex tax',subtotal);print('unpriced',out['unpriced_mpns'])

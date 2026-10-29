"""Price observed candidate parts at aggregate five-board demand; unknown is never zero."""
from pathlib import Path
from decimal import Decimal
import json,collections
P=Path(__file__).resolve().parent
qty=json.loads((P/'v15-five-unit-quantity-review.json').read_text())
observations=json.loads((P/'v15-price-observations.json').read_text())
prices={x['mpn']:x for x in observations['parts']}
groups=collections.defaultdict(lambda:dict(refs=[],quantity=0))
for line in qty['lines']:
 g=groups[line['candidate_mpn']];g['refs']+=line['references'];g['quantity']+=line['installed_quantity_for_five']
rows=[];subtotal=Decimal('0')
for mpn,g in groups.items():
 row=dict(mpn=mpn,references=sorted(g['refs']),installed_quantity=g['quantity'],procurement_quantity=None,line_total_ex_tax_JPY=None,stock_status='NOT_OBSERVED',displayed_stock=None,estimated_restock_date=None)
 if mpn in prices:
  p=prices[mpn];stock=p.get('displayed_stock')
  if p.get('lifecycle_warning'): row['lifecycle_warning']=p['lifecycle_warning']
  row.update(stock_requires_recheck=True,source_crawl_label=p.get('source_crawl_label'),displayed_stock=stock,estimated_restock_date=p.get('estimated_restock_date'),stock_status=('NOT_OBSERVED' if stock is None else 'SUFFICIENT_FOR_INSTALLED_QUANTITY' if stock>=g['quantity'] else 'INSUFFICIENT_FOR_INSTALLED_QUANTITY'))
  eligible=[t for t in p['tiers_ex_tax_JPY'] if t['min_quantity']<=g['quantity']]
  assert eligible
  tier=max(eligible,key=lambda t:t['min_quantity']);total=Decimal(str(tier['unit_price']))*g['quantity'];subtotal+=total
  row.update(reference_unit_price_ex_tax_JPY=tier['unit_price'],line_total_ex_tax_JPY=float(total),source_url=p['url'],basis='Installed quantities only; supplier attrition and assembly sourcing not quoted')
  # Buying up to a published breakpoint can cost less than exact demand.
  # Keep this proposal separate from installed-only totals and actual orders.
  options=[]
  for t in p['tiers_ex_tax_JPY']:
   quantity=max(g['quantity'],t['min_quantity'])
   applicable=max((v for v in p['tiers_ex_tax_JPY'] if v['min_quantity']<=quantity),key=lambda v:v['min_quantity'])
   options.append((Decimal(str(applicable['unit_price']))*quantity,quantity))
  cheapest,proposed=min(options)
  row['price_break_purchase_proposal']=dict(quantity=proposed,excess_over_installed=proposed-g['quantity'],total_ex_tax_JPY=float(cheapest),savings_against_exact_installed_JPY=float(total-cheapest),status='REFERENCE_ONLY_NOT_ORDERED_NO_ATTRITION_ALLOWANCE')
 rows.append(row)
r=dict(status='PARTIAL_DISTRIBUTOR_REFERENCE_NOT_PROTOTYPE_TOTAL',observed_date=observations['observed_date'],prototype_units=5,unique_candidate_mpns=len(rows),priced_mpns=sum(x['line_total_ex_tax_JPY'] is not None for x in rows),priced_installed_units=sum(x['installed_quantity'] for x in rows if x['line_total_ex_tax_JPY'] is not None),known_parts_subtotal_ex_tax_JPY=float(subtotal),complete_parts_subtotal_JPY=None,complete_prototype_total_JPY=None,rows=rows,excluded=qty['unpriced_services']+['All unpriced board parts','All non-PCBA items','Attrition and minimum supplier quantities','Consigned-part handling/acceptance'],limitations=['Public price observation is not a quotation, reservation or purchase.','Distributor retail sourcing does not prove assembler consignment acceptance.','Aggregate identicalMPNs before applying quantity tiers even when design values have different annotations.'])
r['limitations'].append('Stock status describes the retrieved page only. Cached source crawl labels may predate observation; all stock and price require recheck before procurement.')
r['stock_status_counts']=dict(collections.Counter(x['stock_status'] for x in rows))
r['stock_shortfall_mpns']=[x['mpn'] for x in rows if x['stock_status']=='INSUFFICIENT_FOR_INSTALLED_QUANTITY']
r['limitations'].append('Known subtotal includes out-of-stock reference prices; stock checks cover installed demand only, not attrition, reservation or assembly availability.')
(P/'v15-five-unit-cost-review.json').write_text(json.dumps(r,indent=2)+'\n')
assert sum(g['quantity'] for g in groups.values())==425
print({k:r[k] for k in ['unique_candidate_mpns','priced_mpns','priced_installed_units','known_parts_subtotal_ex_tax_JPY']})

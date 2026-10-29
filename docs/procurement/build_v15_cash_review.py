"""Consolidate saved price observations, not a live quote or procurement approval."""
from pathlib import Path
from decimal import Decimal as D
import hashlib,json
P=Path(__file__).resolve().parent
names=['v15-five-unit-cost-review.json','v15-five-unit-quantity-review.json','v15-supplemental-cost-review.json','v15-assembly-rate-review.json','v15-retention-pad-candidates.json']
sources={name:json.loads((P/name).read_text()) for name in names}
cost,qty,sup,assembly,pads=[sources[n] for n in names]
assert cost['prototype_units']==qty['prototype_units']==sup['prototype_units']==assembly['prototype_units']==5
priced=[r for r in cost['rows'] if r['line_total_ex_tax_JPY'] is not None]
installed=sum((D(str(r['line_total_ex_tax_JPY'])) for r in priced),D(0))
assert installed==D(str(cost['known_parts_subtotal_ex_tax_JPY']))
proposal=sum((D(str(r['price_break_purchase_proposal']['total_ex_tax_JPY'])) for r in priced),D(0))
res=sup['foreign_currency_board_parts'][0]
pad=next(p for p in pads['candidates'] if p['mpn']=='4701-30-20093-04')
r=dict(status='INCOMPLETE_CASH_REQUIREMENT_SAVED_PRICE_SNAPSHOT_NOT_QUOTE',prototype_units=5,source_sha256={n:hashlib.sha256((P/n).read_bytes()).hexdigest() for n in names},complete_total_JPY=None,complete_per_unit_JPY=None,release_allowed=False)
r['separate_reference_buckets']=[
 dict(item='37 board MPNs, installed demand only',currency='JPY',tax_basis='exclusive',amount=float(installed),actual_procurement_cost=False),
 dict(item='Five XE batteries',currency='JPY',tax_basis='inclusive',amount=sup['battery']['total_JPY_tax_included'],actual_procurement_cost=False),
 dict(item='Remaining board resistor, five installed',currency='USD',tax_basis='destination charges excluded',amount=res['installed_total_USD'],actual_procurement_cost=False),
]
r['alternative_purchase_quantities']=[dict(item='Same37 JPY board MPNs, listed price-break proposals',currency='JPY',tax_basis='exclusive',amount=float(proposal),extra_units=sum(x['price_break_purchase_proposal']['excess_over_installed'] for x in priced),replaces='37 board MPNs, installed demand only',attrition_included=False),dict(item='390k resistor10-piece price break',currency='USD',amount=res['price_break_purchase_proposal']['total_USD'],replaces='Remaining board resistor, five installed',attrition_included=False)]
r['conditional_assembly_scenarios']=assembly['scenarios']
r['candidate_material_purchase']=dict(item=pad['mpn'],currency='USD',full_sheet_price=pad['price_per_sheet'],sheet_count=1,consumption_mm2=pads['five_unit_pad_consumption_mm2'],shipping_tax_excluded=True,adopted=False,not_prorated=True,alternative_3_18mm_sheet_excluded=True)
r['unpriced_items']=qty['non_pcba_items'][1:]
r['unpriced_services']=['Six-layer PCB fabrication and panelization','Assembler attrition, sourcing and consignment acceptance/fees','Case print material/process and finishing','Shipping for each supplier','Destination taxes, import fees and payment conversion','Any additional inspection/process fees required by supplier']
r['known_stock_shortfalls']=cost['stock_shortfall_mpns']
r['interpretation']=[
 'Reference buckets are deliberately not summed across currency or tax bases. No exchange rate or destination tax is assumed.',
 '37 JPY MPN prices include unavailable parts. A price is not evidence of stock, assembly acceptance or correct electrical qualification.',
 'Price-break alternatives replace installed-demand rows; never add both. Proposed quantities contain no supplier-confirmed attrition allowance.',
 'Assembly scenarios include setup/stencil/fixtures/feeder and soldering proxies; do not add these services again. X-ray columns are alternative scenarios, not cumulative charges.',
 'The five-unit cash requirement includes the entire material sheet/roll purchase, even where only small pieces are consumed. Retention and closure materials are not yet adopted.',
 'Tools and fixtures are one-time costs; reuse and compatibility are not confirmed. Do not assign zero merely because an item might already be owned.',
 '5000JPY product target is separate from five-prototype expenditure. This file neither proves the target nor provides a complete spending ceiling.',
 'All prices come from saved observations. No new availability check, quote request, order, payment or upload occurred.'
]
(P/'v15-five-unit-cash-review.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'installed_JPY_ex_tax':float(installed),'price_break_proposal_JPY_ex_tax':float(proposal),'extra_board_parts':r['alternative_purchase_quantities'][0]['extra_units'],'battery_JPY_tax_included':sup['battery']['total_JPY_tax_included'],'complete_total':None}))

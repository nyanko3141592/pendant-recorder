"""Historical-price coverage for current candidate BOM, not a supplier quote."""
from pathlib import Path
from collections import defaultdict
from decimal import Decimal
import csv,json,hashlib
R=Path(__file__).resolve().parents[2];D=R/'hardware/xe-minimal/fixed-usb-limit-trial/dmn-land-trial';src=D/'candidate-mpn-review.csv';prior=Path(__file__).with_name('v15-five-unit-cost-review.json');old=json.loads(prior.read_text());prices={r['mpn']:r for r in old['rows']};groups=defaultdict(list)
for row in csv.DictReader(src.open()):groups[row['MPN_written_in_source']].append(row['Reference'])
rows=[];subtotal=Decimal(0);covered=0
for mpn,refs in sorted(groups.items()):
 oldrow=prices.get(mpn,{});price=oldrow.get('reference_unit_price_ex_tax_JPY');qty=len(refs)*5
 total=None if price is None else Decimal(str(price))*qty
 if total is not None:subtotal+=total;covered+=len(refs)
 rows.append({'mpn':mpn,'references':sorted(refs),'installed_quantity_for_5':qty,'historical_unit_price_ex_tax_JPY':price,'historical_linear_extension_JPY':float(total) if total is not None else None,'price_source':oldrow.get('source_url'),'price_observed_date':old.get('observed_date') if price is not None else None,'current_stock':None,'purchase_quantity':None,'status':'HISTORICAL_REFERENCE_REQUOTE_REQUIRED' if price is not None else 'PRICE_MISSING','quantity_matches_historical_installed':qty==oldrow.get('installed_quantity') if oldrow else None})
assert sum(len(r['references']) for r in rows)==75
r={'status':'PARTIAL_HISTORICAL_REFERENCE_NOT_FIVE_UNIT_QUOTE','prototype_count':5,'candidate_references':75,'unique_mpns':len(groups),'historically_priced_references':covered,'references_without_historical_JPY_price':75-covered,'historical_parts_extension_ex_tax_JPY':float(subtotal),'complete_parts_total_JPY':None,'complete_five_unit_prototype_total_JPY':None,'rows':rows,'source_sha256':{str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [src,prior]},'excluded':['PCB manufacture including 6-layer0.8mm/ENIG/filled-capped vias','Assembly setup, stencil, extended parts fees, attrition and packaging minimums','Case printing material/time and adhesive/insulation','Programming, fixture and test labor','Shipping, tax and exchange-rate costs','Battery purchased separately by users'], 'limits':['Exact MPN matching only; installed quantity is not purchase quantity','Historical unit rates extended linearly, not current quantity-break prices','Mixed sourcing and assembler availability are not established; total remains null until all costs are available']}
u11path=Path(__file__).with_name('xe-u11-current-price.json');u11=json.loads(u11path.read_text())
u11row=next(x for x in rows if x['mpn']==u11['mpn'])
u11row['separate_currency_observation']={'currency':'USD','unit_price':u11['price_breaks'][0]['unit_price'],'five_installed_parts':u11['five_installed_parts_only'],'source_url':u11['source_url'],'observed_date':u11['observed_date'],'note':'LCSC component-only observation, not assembler quote; no FX conversion'}
u11row['status']='USD_OBSERVATION_AVAILABLE_NOT_JPY_QUOTE'
r['known_price_references_all_currencies']=covered+len(u11row['references'])
r['no_price_evidence_references']=75-r['known_price_references_all_currencies']
r['separate_USD_parts_observation']=u11['five_installed_parts_only']
r['source_sha256'][str(u11path.relative_to(R))]=hashlib.sha256(u11path.read_bytes()).hexdigest()
followp=Path(__file__).with_name('xe-dmn-price-followup.json');follow=json.loads(followp.read_text())
for observation in follow['rows']:
 row=next(x for x in rows if x['mpn']==observation['mpn']);assert row['installed_quantity_for_5']==observation['quantity']
 row['latest_listing_observation']=observation
 row['status']=observation['status']
r['known_price_references_all_currencies']+=sum(len(x['references']) for x in follow['rows'])
r['no_price_evidence_references']=75-r['known_price_references_all_currencies']
r['followup_subtotals_by_currency']={c:sum(x['total'] for x in follow['rows'] if x['currency']==c) for c in ['JPY','USD']}
r['source_sha256'][str(followp.relative_to(R))]=hashlib.sha256(followp.read_bytes()).hexdigest()
# Compare only observed price breaks; proposals are neither orders nor assembly kits.
proposal_totals={'JPY':Decimal(0),'USD':Decimal(0)}
for row in rows:
 observation=row.get('latest_listing_observation')
 if not observation:continue
 candidates=[{'quantity':observation['quantity'],'unit_price':observation['unit_price'],'total':observation['total']}]
 if observation.get('next_break'):candidates.append(observation['next_break'])
 for c in candidates:
  assert c['quantity']>=row['installed_quantity_for_5']
  assert Decimal(str(c['unit_price']))*c['quantity']==Decimal(str(c['total']))
 choice=min(candidates,key=lambda c:Decimal(str(c['total'])))
 row['purchase_quantity_proposal']={**choice,'currency':observation['currency'],'surplus_over_installed':choice['quantity']-row['installed_quantity_for_5'],'basis':'Lowest total among recorded breaks only; excludes assembler attrition/MOQ','availability_status':observation['status']}
 proposal_totals[observation['currency']]+=Decimal(str(choice['total']))
r['followup_purchase_proposal_subtotals_by_currency']={c:float(v) for c,v in proposal_totals.items()}
r['mixed_date_parts_reference_subtotals_by_currency']={'JPY':float(subtotal+Decimal(str(r['followup_subtotals_by_currency']['JPY']))),'USD':float(Decimal(str(r['separate_USD_parts_observation']))+Decimal(str(r['followup_subtotals_by_currency']['USD'])))}
r['mixed_date_quantity_proposal_reference_subtotals_by_currency']={'JPY':float(subtotal+proposal_totals['JPY']),'USD':float(Decimal(str(r['separate_USD_parts_observation']))+proposal_totals['USD'])}
r['limits'].append('Mixed-date reference subtotals include historical rates and out-of-stock listings; neither complete quotations nor procurable assembly kits')
assert r['known_price_references_all_currencies']==75 and r['no_price_evidence_references']==0
(D/'five-unit-cost-coverage.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:r[k] for k in ['unique_mpns','historically_priced_references','no_price_evidence_references','mixed_date_parts_reference_subtotals_by_currency','mixed_date_quantity_proposal_reference_subtotals_by_currency']}))
print('Unpriced:',[(x['mpn'],x['references']) for x in rows if x['status']=='PRICE_MISSING'])

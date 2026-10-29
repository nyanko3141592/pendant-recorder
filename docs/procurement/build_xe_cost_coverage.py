"""Map historical price evidence only where current value and footprint match."""
from pathlib import Path
import json,hashlib
O=Path(__file__).resolve().parent;root=O.parents[1];current=root/'hardware/xe-minimal/design.json';old=root/'hardware/mini-rect-v15/design.json';cost=O/'v15-five-unit-cost-review.json';C={p['ref']:p for p in json.loads(current.read_text())['parts']};V={p['ref']:p for p in json.loads(old.read_text())['parts']};prices=json.loads(cost.read_text());mapped={};excluded=[]
for row in prices['rows']:
 for ref in row['references']:
  if ref not in C:excluded.append({'ref':ref,'reason':'Not populated in current design'});continue
  if ref not in V or any(C[ref][k]!=V[ref][k] for k in ['value','footprint']):continue
  unit=row.get('reference_unit_price_ex_tax_JPY')
  mapped[ref]={'ref':ref,'value':C[ref]['value'],'footprint':C[ref]['footprint'],'candidate_mpn':row['mpn'],'historical_unit_price_ex_tax_JPY':unit,'five_installed_price_ex_tax_JPY':unit*5 if unit is not None else None,'source_url':row.get('source_url'),'status':'HISTORICAL_REFERENCE_REQUIRES_CURRENT_MPN_STOCK_PRICE_AND_PROCESS_REVIEW'}
nonbom=[ref for ref in C if ref=='J3' or ref.startswith('TP')];missing=[{'ref':ref,'value':p['value'],'footprint':p['footprint'],'reason':'No matching value-and-footprint historical price row; select/verify exact MPN'} for ref,p in C.items() if ref not in mapped and ref not in nonbom]
r={'status':'PARTIAL_HISTORICAL_COVERAGE_NOT_FIVE_UNIT_QUOTE','units':5,'current_design_sha256':hashlib.sha256(current.read_bytes()).hexdigest(),'historical_sources_sha256':{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [old,cost]},'historical_observation_date':prices['observed_date'],'physical_footprints':len(C),'bare_board_features_not_purchased':nonbom,'matched_reference_count':len(mapped),'unmatched_reference_count':len(missing),'historical_matched_installed_subtotal_ex_tax_JPY':sum(x['five_installed_price_ex_tax_JPY'] or 0 for x in mapped.values()),'current_parts_total_JPY':None,'five_prototype_total_JPY':None,'mapped_rows':list(mapped.values()),'unmatched_rows':missing,'obsolete_refs_excluded':excluded,'other_unpriced_costs':['Assembly attrition/minimum order quantities','6layerPCB with specified via filling/capping','Stencil/double-sided assembly/inspection','Case, separator, retention and acoustic materials','Factory programming/provisioning fixture and labor','Shipping/tax','Prototype validation batteries purchased separately from sale kit','Test instruments and engineering labor if included in budget'],'limitations':['Reference mapping does not qualify part substitution','No old price or stock is represented as current','No purchase or supplier inquiry performed']};(O/'xe-five-unit-cost-coverage.json').write_text(json.dumps(r,indent=2)+'\n');print({k:r[k] for k in ['matched_reference_count','unmatched_reference_count','historical_matched_installed_subtotal_ex_tax_JPY']});print([(x['ref'],x['value']) for x in missing])

# Keep fresh component observations separate from historical JPY coverage.
fresh=O/'xe-u11-current-price.json'
if fresh.exists():
 evidence=json.loads(fresh.read_text())
 r['current_component_observations']=[{'ref':'U11','evidence_file':fresh.name,'currency':evidence['currency'],'five_installed_parts_only':evidence['five_installed_parts_only'],'six_panel_positions_parts_only':evidence['six_panel_positions_parts_only'],'stock':evidence['displayed_stock'],'full_assembly_quote':False}]
 (O/'xe-five-unit-cost-coverage.json').write_text(json.dumps(r,indent=2)+'\n')

spirit=O/'xe-u14-spirit-observation.json'
if spirit.exists():
 observation=json.loads(spirit.read_text())
 r.setdefault('current_component_observations',[]).append({'ref':'U14','evidence_file':spirit.name,'currency':'USD','five_installed_parts_only':observation['five_parts_only_USD'],'six_panel_positions_parts_only':observation['six_parts_only_USD'],'displayed_stock':observation['displayed_stock'],'availability_qualified':False,'stock_refresh_result':observation['stock_refresh_result'],'full_assembly_quote':False})
 (O/'xe-five-unit-cost-coverage.json').write_text(json.dumps(r,indent=2)+'\n')

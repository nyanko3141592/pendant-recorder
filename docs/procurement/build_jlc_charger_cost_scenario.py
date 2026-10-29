"""Replace the U3 historical extension in both cost scenarios; no orders."""
from pathlib import Path
from decimal import Decimal as D
import json,hashlib
R=Path(__file__).resolve().parents[2]
paths=['docs/procurement/xe-jlc-sensor-memory-mosfet-cost-scenario.json','docs/procurement/xe-bq25185-jlc-availability.json','hardware/xe-minimal/fixed-usb-limit-trial/dmn-land-trial/five-unit-cost-coverage.json','docs/procurement/cost_dmn_candidate_bom.py']
p,s,old=[json.loads((R/f).read_text()) for f in paths[:3]]
row=next(r for r in old['rows'] if r['mpn']==s['mpn'])
assert row['references']==['U3'] and row['installed_quantity_for_5']==5
# Both parent totals share the same historical subtotal. Only followup rows
# contribute quantity-price alternatives, and U3 is not a followup row.
assert 'latest_listing_observation' not in row and 'purchase_quantity_proposal' not in row
removed=D(str(row['historical_linear_extension_JPY']))
assert removed==D(str(row['historical_unit_price_ex_tax_JPY']))*5
added=D(str(s['unit_USD_displayed']))*5
assert added==D(str(s['five_installed_parts_USD']))
sub={k:{'JPY':float(D(str(v['JPY']))-removed),'USD':float(D(str(v['USD']))+added)} for k,v in p['subtotals'].items()}
r={'status':'CONDITIONAL_JLC_CHARGER_SENSOR_MEMORY_MOSFET_SCENARIO_NOT_QUOTE','sources_sha256':{f:hashlib.sha256((R/f).read_bytes()).hexdigest() for f in paths},'charger_replacement':{'mpn':s['mpn'],'installed_quantity':5,'removed_historical_JPY':float(removed),'added_PCBA_USD':float(added),'purchase_quantity_including_attrition':None,'quantity_basis':'U3 contributes five times historical unit price to shared historical subtotal in both parent scenarios; no followup purchase quantity applies.'},'subtotals':sub,'complete_five_unit_total_JPY':None,'limits':p['limits']+['Charger cost is five installed pieces only; attrition and final purchase quantity unknown']}
(R/'docs/procurement/xe-jlc-charger-cost-scenario.json').write_text(json.dumps(r,indent=2)+'\n');print(sub)

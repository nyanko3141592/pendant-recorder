from pathlib import Path
from decimal import Decimal as D
import json,hashlib
R=Path(__file__).resolve().parents[2]
paths=['docs/procurement/xe-jlc-charger-cost-scenario.json','docs/procurement/xe-tps22950-jlc-availability.json','hardware/xe-minimal/fixed-usb-limit-trial/dmn-land-trial/five-unit-cost-coverage.json']
p,s,old=[json.loads((R/f).read_text()) for f in paths]
row=next(r for r in old['rows'] if r['mpn']==s['mpn']);assert row['references']==['U13'] and row['installed_quantity_for_5']==5
ob=row['latest_listing_observation'];proposal=row['purchase_quantity_proposal'];assert ob['currency']==proposal['currency']=='JPY' and ob['quantity']==proposal['quantity']==5
assert row['historical_linear_extension_JPY'] is None
added=D(str(s['unit_USD_displayed']))*5
sub={}
for key,v in p['subtotals'].items():
 removed=D(str(proposal['total'] if 'quantity_proposal' in key else ob['total']))
 sub[key]={'JPY':float(D(str(v['JPY']))-removed),'USD':float(D(str(v['USD']))+added)}
r={'status':'CONDITIONAL_JLC_SWITCH_CHARGER_SENSOR_MEMORY_MOSFET_SCENARIO_NOT_QUOTE','sources_sha256':{f:hashlib.sha256((R/f).read_bytes()).hexdigest() for f in paths},'switch_replacement':{'mpn':s['mpn'],'installed_quantity':5,'removed_retail_JPY':ob['total'],'removed_quantity_proposal_JPY':proposal['total'],'added_PCBA_USD':float(added)},'subtotals':sub,'complete_five_unit_total_JPY':None,'limits':p['limits']+['U13 requires Standard PCBA and X-ray inspection per listing; inspection cost remains unpriced','No TPS22950L substitution; same exact part retained']}
(R/'docs/procurement/xe-jlc-switch-cost-scenario.json').write_text(json.dumps(r,indent=2)+'\n');print(sub)

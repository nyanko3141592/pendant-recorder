"""Replace the historical five-sensor retail cost with observed PCBA stock pricing."""
from pathlib import Path
from decimal import Decimal as D
import json,hashlib
R=Path(__file__).resolve().parents[2]
paths=['docs/procurement/xe-jlc-memory-mosfet-cost-scenario.json','docs/procurement/xe-ncu-jlc-availability.json','hardware/xe-minimal/fixed-usb-limit-trial/ncu-sensor-trial/five-unit-cost-delta.json']
p,s,d=[json.loads((R/f).read_text()) for f in paths]
assert s['mpn']==d['candidate_mpn']=='NCU18XH103F60RB'
assert d['only_changed_reference']=='TH1' and d['prototype_count']==5
qty=5;removed=D(str(d['candidate_five_part_JPY']));added=D(str(s['unit_USD_displayed']))*qty
assert qty>=s['minimum_quantity'] and qty<=s['available_order_quantity']
sub={k:{'JPY':float(D(str(v['JPY']))-removed),'USD':float(D(str(v['USD']))+added)} for k,v in p['subtotals'].items()}
r={'status':'CONDITIONAL_JLC_SENSOR_MEMORY_MOSFET_SCENARIO_NOT_QUOTE','sources_sha256':{f:hashlib.sha256((R/f).read_bytes()).hexdigest() for f in paths},'sensor_replacement':{'mpn':s['mpn'],'installed_quantity':qty,'removed_retail_JPY':float(removed),'added_PCBA_USD':float(added),'price_observed_date':s['observed_date'],'purchase_quantity_including_attrition':None},'subtotals':sub,'complete_five_unit_total_JPY':None,'limits':p['limits']+['Five sensors price only; assembler attrition and purchasing quantity remain unknown','Stock and prices are recorded observations, not freshly reserved or quoted']}
(R/'docs/procurement/xe-jlc-sensor-memory-mosfet-cost-scenario.json').write_text(json.dumps(r,indent=2)+'\n');print(sub)

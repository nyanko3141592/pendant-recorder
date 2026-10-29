from pathlib import Path
from decimal import Decimal as D
import json,hashlib
R=Path(__file__).resolve().parents[2]
paths=['docs/procurement/xe-jlc-switch-cost-scenario.json','hardware/xe-minimal/fixed-usb-limit-trial/dmn-land-trial/five-unit-cost-coverage.json','docs/procurement/xe-tps7a02-jlc-availability.json','docs/procurement/xe-tps22916-jlc-availability.json','docs/procurement/xe-microphone-retail-availability.json','docs/procurement/xe-tlv7042-retail-availability.json','docs/procurement/xe-dmn63-jlc-availability.json','docs/procurement/xe-tlv803-jlc-availability.json','docs/procurement/xe-hcs74-jlc-availability.json','docs/procurement/xe-usblc6-jlc-availability.json','docs/procurement/xe-battery-header-jlc-availability.json','docs/procurement/xe-usb4105-retail-availability.json','docs/procurement/xe-led-retail-availability.json']
p,old,*obs=[json.loads((R/f).read_text()) for f in paths];delta={'JPY':D(0),'USD':D(0)};changes=[]
for s in obs:
 row=next(r for r in old['rows'] if r['mpn']==s['mpn']);quantity=row['installed_quantity_for_5']
 if 'latest_listing_observation' in row:
  ob=row['latest_listing_observation'];proposal=row['purchase_quantity_proposal']
  assert ob['quantity']==proposal['quantity']==quantity and ob['total']==proposal['total'] and ob['currency']==proposal['currency']=='JPY'
  removed=D(str(ob['total']))
 else:
  removed=D(str(row['historical_linear_extension_JPY']))
 delta['JPY']-=removed
 currency='USD' if 'unit_USD_displayed' in s else 'JPY';amount=D(str(s.get('unit_USD_displayed',s.get('unit_JPY_at1'))))*quantity;delta[currency]+=amount
 changes.append({'mpn':s['mpn'],'removed_JPY':float(removed),'added_currency':currency,'added_amount':float(amount),'quantity':quantity})
sub={k:{c:float(D(str(v[c]))+delta[c]) for c in delta} for k,v in p['subtotals'].items()}
r={'status':'CONDITIONAL_MIXED_SOURCE_POWER_MIC_REFERENCE_NOT_QUOTE','sources_sha256':{f:hashlib.sha256((R/f).read_bytes()).hexdigest() for f in paths},'replacements':changes,'subtotals':sub,'complete_five_unit_total_JPY':None,'limits':p['limits']+['Microphone, TLV7042 comparator USB4105 connector and D6 LED use retail cut-tape pricing; assembler acceptance, shipping and handling not included','Replacements use installed quantities for five boards; attrition quantities not established']}
(R/'docs/procurement/xe-power-mic-cost-scenario.json').write_text(json.dumps(r,indent=2)+'\n');print(sub)

"""Inspection cost sensitivity from recorded public tariff, not a quotation."""
from pathlib import Path
from decimal import Decimal as D
import json,hashlib
R=Path(__file__).resolve().parents[2]
ip=R/'mechanical/xe-minimal/ncu-candidate-board-inventory.json';inv=json.loads(ip.read_text());parts={p['ref']:p for p in inv['parts']}
selection={'U1':'QFN hidden pad package','U3':'WSON exposed-pad package','U8':'Bottom-land microphone package; supplier classification unconfirmed','U10':'Wafer-level 4-ball package','U11':'LGA hidden lands','U13':'JLC exact-part listing explicitly requires X-ray'}
rows=[{'reference':ref,'value':parts[ref]['value'],'footprint':parts[ref]['footprint'],'reason':why,'five_unit_component_count':5}for ref,why in selection.items()]
def fee(n):
 rate=D('1.64') if n<=10 else D('.82') if n<=50 else D('.49')
 return rate*n
n=sum(r['five_unit_component_count'] for r in rows)
r={'status':'CONDITIONAL_XRAY_SCOPE_AND_TARIFF_NOT_QUOTE','observed_date':'2026-10-27','source_url':'https://jlcpcb.com/help/article/pcb-assembly-price','source_update_date':'2026-10-22','tariff_basis':'Component Quantity; published text does not resolve grouping across part numbers','tariff_USD_per_component':{'1-10':1.64,'11-50':.82,'51-200':.49},'inventory_sha256':hashlib.sha256(ip.read_bytes()).hexdigest(),'pcb_sha256':inv['pcb_sha256'],'candidate_scope':rows,'scenarios':[{'assumption':'All six candidate references aggregated across five boards','components':n,'USD':float(fee(n))},{'assumption':'Five units priced separately for each of six reference groups','components':n,'USD':float(sum((fee(x['five_unit_component_count']) for x in rows),D(0)))}],'confirmed_complete_inspection_USD':None,'limits':['Candidate scope is based on package geometry, not supplier BOM acceptance','U10 and U13 have explicit exact-part listing evidence captured for required X-ray','Scenarios are alternative grouping interpretations, not proven lower/upper bounds','Do not add the U13-only charge to a full-scope scenario; it is already included','No price added to the main subtotal until scope/grouping are confirmed','No upload, inquiry or order']}
(R/'docs/procurement/xe-xray-cost-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r['scenarios'])

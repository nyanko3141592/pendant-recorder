"""Conditional NCU trial cost; preserve parent and its mixed-date limitations."""
from pathlib import Path
import json, hashlib, csv
from decimal import Decimal
R=Path(__file__).resolve().parents[2]
H=R/'hardware/xe-minimal/fixed-usb-limit-trial'
base=H/'dmn-land-trial/five-unit-cost-coverage.json'
sensor=R/'docs/procurement/xe-ncu-sensor-review.json'
trial=H/'ncu-sensor-trial'
b=json.loads(base.read_text()); s=json.loads(sensor.read_text())
old=[r for r in b['rows'] if r['references']==['TH1']]
assert len(old)==1 and old[0]['mpn']==s['old_part']
rows=list(csv.DictReader((trial/'candidate-mpn-review.csv').open()))
assert len(rows)==75
th=[r for r in rows if r['Reference']=='TH1']; assert len(th)==1
assert s['new_part'] in th[0].values()
old_total=Decimal(str(old[0]['historical_linear_extension_JPY']))
new_total=Decimal(str(s['retail_observation']['five_part_subtotal_ex_tax_JPY']))
delta=new_total-old_total
subtotals={}
for key in ['mixed_date_parts_reference_subtotals_by_currency','mixed_date_quantity_proposal_reference_subtotals_by_currency']:
 subtotals[key]=dict(b[key]);subtotals[key]['JPY']=float(Decimal(str(b[key]['JPY']))+delta)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
sources=[base,sensor,trial/'candidate-mpn-review.csv',trial/'pendant-xe-minimal.kicad_pcb']
out={'status':'CONDITIONAL_NCU_TRIAL_MIXED_DATE_REFERENCE_NOT_QUOTE','prototype_count':5,'source_sha256':{str(p.relative_to(R)):sha(p) for p in sources},'only_changed_reference':'TH1','old_mpn':s['old_part'],'candidate_mpn':s['new_part'],'old_five_part_JPY':float(old_total),'candidate_five_part_JPY':float(new_total),'difference_JPY':float(delta),'candidate_price_observation':s['retail_observation'],**subtotals,'complete_five_unit_total_JPY':None,'excluded':b['excluded'],'limits':b['limits']+['NCU candidate is not adopted; this report does not authorize production.','Other part availability and prices were not refreshed by this calculation.','DMN2056U-7 stock gate remains unresolved; these subtotals do not represent a purchasable kit.','Assembly costs, source currency conversion and whole-project cost remain separate.']}
p=trial/'five-unit-cost-delta.json';p.write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n');print(p);print(json.dumps(subtotals))

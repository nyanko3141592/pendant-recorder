"""Identify current-film costs that cannot inherit the historical NCU budget."""
from pathlib import Path
import csv,json,hashlib
R=Path(__file__).resolve().parents[2]
old='hardware/xe-minimal/fixed-usb-limit-trial/ncu-sensor-trial/candidate-mpn-review.csv'
new='hardware/xe-minimal/film-integration-trial/candidate-mpn-review.csv'
budget='docs/procurement/xe-five-unit-budget-review.json'
materials='docs/procurement/xe-film-sensor-joining-materials.json'
def read_rows(path):
 with (R/path).open() as f:return {r['Reference']:r for r in csv.DictReader(f)}
a,b=read_rows(old),read_rows(new)
assert set(a)==set(b)
changes=[]
for ref in sorted(b):
 if a[ref]['MPN_written_in_source']!=b[ref]['MPN_written_in_source']:
  changes.append({'reference':ref,'previous_mpn':a[ref]['MPN_written_in_source'],'current_candidate_mpn':b[ref]['MPN_written_in_source'],'installed_quantity_five':5,'price_delta':None})
m=json.loads((R/materials).read_text());wire=m['fine_wire_candidate']['retail'];tape=m['tape_candidate']['alternative_retail_observation']
r={'status':'CURRENT_FILM_BUDGET_DELTA_NOT_COMPLETE_QUOTE','prototype_count':5,'source_sha256':{p:hashlib.sha256((R/p).read_bytes()).hexdigest()for p in [old,new,budget,materials]},'changed_mpn_references':changes,'unchanged_mpn_references':len(b)-len(changes),'cost_transfer_policy':'Do not label historical whole-budget subtotals as current-film totals. Unchanged MPN does not imply unchanged procurement quantity, availability, assembly or price.','historical_material_purchase_scenario':{'wire':{'quantity':1,'package_m':wire['length_m'],'JPY_including_tax':wire['price_JPY_including_tax'],'observation_date':wire['date']},'tape':{'quantity':1,'width_mm':tape['width_mm'],'length_m':tape['length_m'],'JPY_including_tax':tape['displayed_price_JPY_including_tax'],'observation_date':tape['date']},'subtotal_JPY_including_tax':wire['price_JPY_including_tax']+tape['displayed_price_JPY_including_tax'],'scope':'Full package cash outlay for candidate materials, not five-device consumption cost; excludes shipping and price changes; material process remains unqualified. Not added to old subtotal.'},'required_recalculation':['Remove historical NCU18XH103F60RB line, add5 installed103JT-025 plus process spares.','Split R13 from100k0402 purchase group into100k0201; other0402 resistors remain.','Remove TH1 from automated placement and SMT feeder count; add seller wire cutting/stripping/soldering/insulation/inspection labor.','Recalculate actual per-side SMT feeder and attrition categories;39 grouped BOM rows are not39 feeders.','Add current six-layer panel fabrication, filled/capped vias, inspection and seller depanelization.','Add case material/print time, adhesives, fixtures/programming/test labor, shipping and taxes.'],'complete_five_unit_total':None,'order_ready':False}
(R/'docs/procurement/xe-film-five-unit-budget-delta.json').write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'changes':changes,'historical_full_package_material_JPY':r['historical_material_purchase_scenario']['subtotal_JPY_including_tax']}))

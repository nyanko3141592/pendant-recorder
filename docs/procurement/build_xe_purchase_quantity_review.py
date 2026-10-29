"""Keep installed demand separate from unknown per-side assembly losses."""
from pathlib import Path
import csv,json,hashlib,collections
R=Path(__file__).resolve().parents[2]
mp=R/'hardware/xe-minimal/fixed-usb-limit-trial/ncu-sensor-trial/candidate-mpn-review.csv';ip=R/'mechanical/xe-minimal/ncu-candidate-board-inventory.json'
rows=list(csv.DictReader(mp.open()));inv=json.loads(ip.read_text());parts={p['ref']:p for p in inv['parts']};groups=collections.defaultdict(list)
for row in rows:groups[(row['MPN_written_in_source'],parts[row['Reference']]['side'])].append(row['Reference'])
lines=[{'mpn':mpn,'side':side,'references':sorted(refs),'per_board':len(refs),'installed_for_five':len(refs)*5,'assembly_attrition':None,'assembly_minimum':None,'purchase_quantity':None}for (mpn,side),refs in sorted(groups.items())]
assert sum(x['installed_for_five'] for x in lines)==375 and len(rows)==75
by=collections.defaultdict(list)
for row in lines:by[row['mpn']].append(row['side'])
r={'status':'DEMAND_RECONCILED_PURCHASE_QUANTITY_NOT_ESTABLISHED','prototype_boards':5,'assembly_references_per_board':75,'installed_components':375,'unique_mpns':len(by),'mpn_side_groups':len(lines),'both_side_mpns':[m for m,s in by.items() if len(s)>1],'lines':lines,'sources_sha256':{str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [mp,ip]},'policy_evidence':{'url':'https://jlcpcb.com/blog/reduce-pcb-assembly-cost-prototype','observed_date':'2026-10-27','facts':['Attrition is calculated separately for each board side','Global Sourcing purchase quantities are calculated by order system and shown at BOM matching','Published article describes feeder loading per unique part number per order; side attrition is not evidence for two feeder fees']},'limits':['No universal numerical attrition allowance found in reviewed public pages','Part-page purchase minimum is not assembly minimum','No BOM upload or purchasing operation','375 is installed demand only; do not buy exactly this total assuming assembly losses are zero','User assembly remains battery connection only']}
(R/'docs/procurement/xe-purchase-quantity-review.json').write_text(json.dumps(r,indent=2)+'\n')
with (R/'docs/procurement/xe-purchase-quantity-review.csv').open('w') as f:
 w=csv.writer(f);w.writerow(['MPN','Side','References','Installed for 5','Assembly attrition (unknown)','Assembly minimum (unknown)','Purchase quantity (unknown)'])
 for x in lines:w.writerow([x['mpn'],x['side'],' '.join(x['references']),x['installed_for_five'],'','',''])
print(len(by),len(lines),sum(x['installed_for_five'] for x in lines))

"""Build current five-device installed demand from the canonical production BOM."""
from pathlib import Path
import csv, hashlib, json

ROOT=Path(__file__).resolve().parents[2]; OUT=ROOT/'docs/procurement'; source=OUT/'xe-production-bom-2026-10-28.csv'
rows=list(csv.DictReader(source.open())); lines=[]; refs=set()
for row in rows:
    current=[x.strip() for x in row['references'].split(',') if x.strip()]
    if int(row['qty_per_device']) == 0:
        assert row['route'] == 'PCB_FEATURE'
        continue
    if row['route'] == 'BUYER_FINAL_ASSEMBLY':
        continue
    assert row['qty_per_device']==str(len(current)); assert not refs.intersection(current); refs.update(current)
    lines.append({'route':row['route'],'mpn':row['mpn'],'jlc_part':row['jlc_part'],'references':','.join(current),'qty_per_device':len(current),'installed_qty_five_devices':5*len(current),'purchase_qty':None,'status':row['status']})
assert len(refs)==68 and all(r['route'].startswith('JLC_') for r in lines)
fields=list(lines[0]);
with (OUT/'prototype-v1-five-unit-installed-demand.csv').open('w',newline='') as stream:
    w=csv.DictWriter(stream,fieldnames=fields);w.writeheader();w.writerows(lines)
report={'status':'CURRENT_68_JLC_POSITION_FIVE_DEVICE_DEMAND_NOT_ORDER_QUANTITY','prototype_devices':5,'pcb_assembly_positions_per_device':68,'pcb_assembly_installed_five':340,'seller_external_sensor_positions_per_device':0,'buyer_final_assembly':['DTP401525-XE','CASE-PEBBLE-V4','CORD-2-3MM'],'buyer_board_component_sourcing':False,'lines':lines,'sources_sha256':{str(source.relative_to(ROOT)):hashlib.sha256(source.read_bytes()).hexdigest()},'no_order_or_upload_performed':True}
(OUT/'prototype-v1-five-unit-installed-demand.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'status':report['status'],'positions_per_device':68,'installed_five':340}))

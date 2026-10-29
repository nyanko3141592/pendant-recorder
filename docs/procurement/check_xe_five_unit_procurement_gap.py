#!/usr/bin/env python3
import csv, hashlib, json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]; OUT=ROOT/'docs/procurement'
r=json.loads((OUT/'xe-five-unit-procurement-gap.json').read_text()); rows=list(csv.DictReader((OUT/'xe-five-unit-procurement-gap.csv').open()))
assert r['status']=='COMPLETE_QUANTITY_COVERAGE_PUBLIC_PART_PRICES_NOT_COMPLETE_QUOTE_DO_NOT_ORDER'
assert r['jlc_positions_per_unit']==68 and r['jlc_installed_five']==340
assert r['complete_five_unit_landed_USD'] is None
assert all((row['observed_unit_price_USD']=='' and row['extended_five_USD']=='') or (float(row['observed_unit_price_USD'])>0 and float(row['extended_five_USD'])>0) for row in rows)
assert r['table_sha256']==hashlib.sha256((OUT/'xe-five-unit-procurement-gap.csv').read_bytes()).hexdigest()
assert r['source_bom_sha256']==hashlib.sha256((OUT/'xe-production-bom-2026-10-28.csv').read_bytes()).hexdigest()
assert r['orders_payments_uploads_vendor_contacts_performed'] is False
print(json.dumps({'status':'PASS_FIVE_UNIT_QUANTITY_COVERAGE_PRICE_FAIL_CLOSED','installed':340,'complete_total':None}))

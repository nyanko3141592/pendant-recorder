#!/usr/bin/env python3
"""Read public JLC pages only; never equate overseas stock with total assembly stock."""
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime,timezone
from pathlib import Path
import csv,hashlib,json,re,time,urllib.error,urllib.request
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'docs/procurement';rows=[r for r in csv.DictReader((OUT/'xe-production-bom-2026-10-28.csv').open()) if r['route'].startswith('JLC_')]
def fetch(row):
 req=urllib.request.Request(row['source'],headers={'User-Agent':'Mozilla/5.0 procurement-readonly-audit'})
 try:
  for attempt in range(3):
   try:
    with urllib.request.urlopen(req,timeout=25) as response:raw=response.read();code=response.status
    break
   except urllib.error.HTTPError as exc:
    if exc.code!=429 or attempt==2:raise
    time.sleep(2*(attempt+1))
  text=raw.decode('utf-8','replace').replace('\\"','"');part=row['jlc_part'];mpn=row['mpn'];models=re.findall(r'"componentCode":"'+re.escape(part)+r'","componentModelEn":"([^"]+)"',text);exact_model=mpn in models;page_model=mpn if exact_model else (models[0] if models else None)
  prefix=r'"componentCode":"'+re.escape(part)+r'","componentModelEn":"'+re.escape(mpn)+r'"'
  candidates=[text[m.start():m.start()+6000] for m in re.finditer(prefix,text)]
  main=next((candidate for candidate in candidates if '"isBuyComponent"' in candidate),'')
  buy=re.search(r'"isBuyComponent":"([01])"',main);minimum=re.search(r'"preMinPurchaseNum":("\$undefined"|\d+)',main);overseas=re.search(r'"overseasStockCount":(\d+)',main);reason=re.search(r'"noBuyReason":(null|"[^"]*")',main);tiers=[]
  for start,end,price in re.findall(r'"componentCode":"'+re.escape(part)+r'","startNumber":(\d+),"endNumber":(-?\d+),"productPrice":([0-9.]+)',text):
   item={'start':int(start),'end':int(end),'USD':float(price)}
   if item not in tiers:tiers.append(item)
  qty=5*int(row['qty_per_device']);min_qty=int(minimum.group(1)) if minimum and minimum.group(1).isdigit() else None;billed_qty=max(qty,min_qty or qty);tier=next((x for x in tiers if billed_qty>=x['start'] and (x['end']==-1 or billed_qty<=x['end'])),None)
  return {'jlc_part':part,'expected_mpn':mpn,'page_model':page_model,'model_match':exact_model,'http_status':code,'orderable_flag':buy.group(1)=='1' if buy else None,'minimum_purchase_qty':min_qty,'overseas_stock_count':int(overseas.group(1)) if overseas else None,'no_buy_reason':json.loads(reason.group(1)) if reason else None,'price_tiers':tiers,'five_unit_installed_qty':qty,'five_unit_billed_purchase_qty':billed_qty,'applicable_unit_price_USD':tier['USD'] if tier else None,'extended_five_USD':round(billed_qty*tier['USD'],6) if tier else None,'page_sha256':hashlib.sha256(raw).hexdigest(),'source':row['source'],'error':None}
 except Exception as exc:return {'jlc_part':row['jlc_part'],'expected_mpn':row['mpn'],'page_model':None,'model_match':False,'http_status':None,'orderable_flag':None,'minimum_purchase_qty':None,'overseas_stock_count':None,'no_buy_reason':None,'price_tiers':[],'five_unit_installed_qty':5*int(row['qty_per_device']),'applicable_unit_price_USD':None,'extended_five_USD':None,'page_sha256':None,'source':row['source'],'error':type(exc).__name__+': '+str(exc)}
with ThreadPoolExecutor(max_workers=3) as pool:items=sorted(pool.map(fetch,rows),key=lambda x:x['jlc_part'])
complete=all(x['extended_five_USD'] is not None for x in items);summary={'requested':len(items),'http_200':sum(x['http_status']==200 for x in items),'exact_model_matches':sum(x['model_match'] for x in items),'prices_for_five_unit_qty':sum(x['applicable_unit_price_USD'] is not None for x in items),'orderable_flags_true':sum(x['orderable_flag'] is True for x in items),'orderable_flags_false':sum(x['orderable_flag'] is False for x in items),'price_subtotal_USD':round(sum(x['extended_five_USD'] or 0 for x in items),6) if complete else None}
report={'status':'PUBLIC_JLC_PAGE_SNAPSHOT_NOT_QUOTE_OR_RESERVATION','retrieved_at_utc':datetime.now(timezone.utc).isoformat(),'method':'anonymous HTTP GET of canonical BOM part-detail pages','items':items,'summary':summary,'limitations':['overseas_stock_count is not total JLC assembly inventory and is not used as an in-stock decision.','isBuyComponent and public prices do not reserve inventory or prove BOM acceptance.','Part prices exclude PCB, assembly, POFV, inspection, programming, freight, tax, battery, case and cord.'],'orders_payments_uploads_vendor_contacts_performed':False}
(OUT/'xe-jlc-public-snapshot.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n');print(json.dumps(summary))

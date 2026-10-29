"""Reviewable conditional budget; never turn unknown costs into zero."""
from pathlib import Path
from decimal import Decimal as D
import json, hashlib, csv
R=Path(__file__).resolve().parents[2]
read=lambda p:json.loads((R/p).read_text())
parts_path='docs/procurement/xe-power-mic-cost-scenario.json'
assembly_path='docs/procurement/xe-current-assembly-cost.json'
p=read(parts_path);a=read(assembly_path)
H=R/'hardware/xe-minimal/fixed-usb-limit-trial'
new=H/'ncu-sensor-trial/pendant-xe-minimal.kicad_pcb';old=H/'usb-margin-detour-trial/pendant-xe-minimal.kicad_pcb'
assert new.read_text().replace('NCU18XH103F60RB 10k 1% B3380 candidate','NCP18XH103F03RB 10k 1% B3380 candidate')==old.read_text()
assert hashlib.sha256(old.read_bytes()).hexdigest()==a['board_sha256']
rows=list(csv.DictReader((H/'ncu-sensor-trial/candidate-mpn-review.csv').open()))
by={}
for row in rows:by.setdefault(row['MPN_written_in_source'],[]).append(row['Reference'])
known={'DMN2056U-7':'docs/procurement/xe-dmn-jlc-availability.json','CSNP32GCR01-BOW':'docs/procurement/xe-u11-jlc-availability.json'}
known.update({'STM32U535CEU6':'docs/procurement/xe-mcu-jlc-availability.json','NCU18XH103F60RB':'docs/procurement/xe-ncu-jlc-availability.json'})
known['BQ25185DLHR']='docs/procurement/xe-bq25185-jlc-availability.json'
known['TPS22950YBHR']='docs/procurement/xe-tps22950-jlc-availability.json'
known.update({'TPS7A0233PDBVR':'docs/procurement/xe-tps7a02-jlc-availability.json','TPS22916CYFPR':'docs/procurement/xe-tps22916-jlc-availability.json','IM69D130V01XTSA1':'docs/procurement/xe-microphone-jlc-availability.json'})
known['TLV7042DDFR']='docs/procurement/xe-tlv7042-jlc-availability.json'
known['DMN63D8L-7']='docs/procurement/xe-dmn63-jlc-availability.json'
known['TLV803EB29DBZR']='docs/procurement/xe-tlv803-jlc-availability.json'
known['SN74HCS74DYYR']='docs/procurement/xe-hcs74-jlc-availability.json'
known['USBLC6-2P6']='docs/procurement/xe-usblc6-jlc-availability.json'
known['781710003']='docs/procurement/xe-battery-header-jlc-availability.json'
known['USB4105-GF-A']='docs/procurement/xe-usb4105-jlc-availability.json'
known['APHHS1005LSYCK/J3-PF']='docs/procurement/xe-led-jlc-availability.json'
coverage=[]
for mpn,refs in sorted(by.items()):
 evidence=known.get(mpn)
 coverage.append({'mpn':mpn,'references':sorted(refs),'five_installed_quantity':len(refs)*5,'JLC_stock_evidence':evidence,'status':('CONSIGNMENT_SERVICE_NOT_COMPONENT_STOCK' if read(evidence)['status']=='CONSIGNMENT_SERVICE_ENTRY_NOT_PURCHASABLE_COMPONENT' else 'OUT_OF_STOCK_PREORDER_ONLY' if read(evidence)['stock_displayed']==0 else 'OBSERVED_NOT_RESERVED')if evidence else'NOT_VERIFIED_IN_THIS_RECONCILIATION'})
base=p['subtotals']['mixed_date_quantity_proposal_reference_subtotals_by_currency']
scenarios=[{'feeder_load_assumption':s['assumed_feeder_loads'],'reference_parts_JPY':base['JPY'],'reference_parts_and_partial_assembly_USD':float(D(str(base['USD']))+D(str(s['partial_assembly_USD'])))}for s in a['scenarios']]
unknown=['Carrier removal / depanelization and edge finishing by seller or assembler (not buyer)', 'Bare PCB including six-layer stack and filled/capped vias','Assembly attrition and purchasing minimums for every part','Sourcing or consignment costs for other BOM entries','X-ray and required assembly inspection','Printed case material, adhesive, insulation and thermal contact material','Firmware programming and test fixture/labor','Shipping, tax and currency conversion']
retail_paths={'TNPW040219K1BEED':'docs/procurement/xe-r44-retail-availability.json','APHHS1005LSYCK/J3-PF':'docs/procurement/xe-led-retail-availability.json','USB4105-GF-A':'docs/procurement/xe-usb4105-retail-availability.json','TLV7042DDFR':'docs/procurement/xe-tlv7042-retail-availability.json'}
r={'status':'PARTIAL_BUDGET_REVIEW_NOT_ORDER_READY','prototype_count':5,'pcb_sha256':hashlib.sha256(new.read_bytes()).hexdigest(),'sources_sha256':{s:hashlib.sha256((R/s).read_bytes()).hexdigest()for s in [parts_path,assembly_path,*known.values(),*retail_paths.values()]},'assembly_count_transfer_basis':'Inverse TH1 value substitution exactly reproduces parent PCB; geometry unchanged. MPN feeder cost remains hypothetical.','conditional_scenarios':scenarios,'scenario_warning':'Not lower/upper bounds, quotation or fully procurable kit; currencies intentionally separate.','JLC_inventory_reconciliation':coverage,'reviewed_JLC_unique_MPNs':len(known),'in_stock_JLC_unique_MPNs':sum(read(v)['stock_displayed']>0 for v in known.values()),'total_unique_MPNs':len(by),'unknown_cost_items':unknown,'purchase_quantity_review':'docs/procurement/xe-purchase-quantity-review.json','feeder_interpretation':'Published supplier article says per unique part per order; 38 is supported as the planning assumption. 46 remains an unconfirmed sensitivity, not required by per-side attrition.','inspection_sensitivity_review':'docs/procurement/xe-xray-cost-review.json','retail_fallbacks':{mpn:{'evidence':path,'status':read(path)['status'],'assembler_acceptance':None} for mpn,path in retail_paths.items()},'complete_five_unit_total':None}
out=R/'docs/procurement/xe-five-unit-budget-review.json';out.write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n')
lines=['5台試作費：未確定（発注判断に必要な費用の棚卸し）','',f'候補基板: {r["pcb_sha256"]}',f'実装用在庫状況を今回照合できた型番: {len(known)}/{len(by)}。他の型番が欠品という意味ではない。','', '条件付き参考小計（異なる日時・販売店の部品価格を含む）']
for s in scenarios:lines.append(f'フィーダー{s["feeder_load_assumption"]}本を仮定: JPY {s["reference_parts_JPY"]} + USD {s["reference_parts_and_partial_assembly_USD"]}')
out_of_stock=[mpn for mpn,path in known.items() if read(path)['stock_displayed']==0 and read(path)['status']!='CONSIGNMENT_SERVICE_ENTRY_NOT_PURCHASABLE_COMPONENT']
lines += ['在庫表示あり: '+str(r['in_stock_JLC_unique_MPNs'])+'型番。在庫0・予約見積のみ: '+', '.join(out_of_stock)+'。マイクの確認済掲載は持込実装用で、部品在庫ではない。']
lines += ['先行調達の表示最小数量: TLV7042DDFRは11個、USB4105-GF-Aは7個、APHHS1005LSYCK/J3-PFは27個。各5台分の実装必要数は5個。最終購入数と納期は未確定。USBコネクターは実装難度High表示で、見積への影響も未確定。']
lines+=['TLV7042DDFRは同型番のDigiKeyカットテープ在庫3431個を確認。5個1535円（税抜）を参考部品小計に反映。実装業者の調達・持込受入は未確定。']
lines+=['USB4105-GF-Aは同型番のDigiKeyカットテープ在庫87848個を確認。5個660円（税抜）を参考部品小計に反映。実装業者の受入・予備数・追加費用は未確定。']
lines+=['数量表: 38型番・5台で375個実装。表裏別の実装ロス確認は46区分。購入個数は未確定。公開記事ではフィーダー料は型番ごとで、表裏別の実装ロスとは区別する。46本の費用は未確認の感度比較。']
lines+=['X線検査は別レビュー: 対象候補6部品×5台=30個。合算課金の仮定24.60USD、型番別課金の仮定49.20USD。対象と課金単位は未確定、小計へ未加算。']
lines+=['これは上下限でも見積金額でもない。円換算していない。未確定費用を0円としていない。','','未算入・未確定:']+unknown+['','電池は販売・同梱しない。購入者が別途調達する。注文・支払い・見積依頼は実施していない。']
(R/'docs/procurement/xe-five-unit-budget-review-ja.txt').write_text('\n'.join(lines)+'\n')
print(json.dumps({'scenarios':scenarios,'verified_MPNs':len(known),'total_MPNs':len(by)}))


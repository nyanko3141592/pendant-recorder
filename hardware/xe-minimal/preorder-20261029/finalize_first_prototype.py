"""Synchronize selected prototype deliverables without manufacturing actions."""
from pathlib import Path
import json,shutil,hashlib,csv,subprocess
R=Path(__file__).resolve().parents[3];P=Path(__file__).resolve().parent/'release-review-20261029-aligned';O=P/'first-prototype';M=R/'mechanical/xe-minimal/preorder-20261029'
def read(p):return json.loads(p.read_text())
def write(p,v):p.write_text(json.dumps(v,indent=2,ensure_ascii=False)+'\n')
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
# Selected mechanical delivery: history directories remain intact.
shutil.copytree(M/'prototype-case',P/'mechanical-first-prototype',dirs_exist_ok=True)
for n in ['build_prototype_case.py','slice_prototype_fit_kit.py','render_prototype_case.py','audit_prototype_fit_kit.py','compare_prototype_omi.py']:shutil.copy2(M/n,P/'mechanical-first-prototype'/n)
for n in ['xe-integrated-16h-budget.json','xe-integrated-16h-budget.md']:shutil.copy2(R/'docs/sourcing'/n,P/'evidence'/n)
# The old stock snapshot is historical evidence, not the adopted C30.
live=read(P/'live-full-bom-summary.json')
for row in live['rows']:
 if row['references']=='C30':row.update(jlc_part='C501830',mpn='0402CG500J500NT',stock=48280,available_order_qty=45731,status='PUBLIC_ORDERABLE_NOT_RESERVED',source='https://jlcpcb.com/partdetail/514589-0402CG500J500NT/C501830',observed_at='2026-10-29 (current-session browser)',supersedes='C576707: orderable5, retained in live-full-bom-browser-observations.json')
live['limited_references']=[];live['status']='SELECTED_BOM_WITH_NORMAL_PREORDER_CONDITIONS';write(P/'live-full-bom-summary.json',live)
(P/'START-HERE.txt').write_text('初号試作パッケージの入口: first-prototype/README.md\n\n採用PCB b3cdfc064b4321aa6d32c2ff579efeaaf709f36dbfe7255380feec880741eee0\n27.5mm角/4層/通常through via/固定110mAh/30h保存。C30のみ同定格C501830へBOM置換。\n現機構: mechanical-first-prototype/ASSEMBLY.md と a1mini-fit-kit/prototype-fit-kit.3mf\n旧mechanical-captured-carrier/fit-kit/cradleは履歴。\n\n条件付き理論見積りとCAD・ソフト検証を備えた初号試作用の設計。実測保証/量産releaseではない。\n未完: 正式USB ID・cutoff/初回通電・工場format/identity/readbackの実行条件、部品入庫、注文時DFM/placement確認。\n注文・支払い・製造upload・業者連絡・実印刷は禁止。Git pushのみ許可済み。\n')
old=read(P/'release-gates.json');old['status']='CONDITIONAL_FIRST_PROTOTYPE_DESIGN_EXECUTION_NOT_RELEASED'
old['issues']=[
 {'id':'PROCUREMENT','stage':'before_order_execution','issue':'U1/U12/J1 normal Pre-order chosen; no guaranteed delivery. C30 replaced by available C501830. All required assembly quantities must be in stock before PCB ordering.','evidence':'first-prototype/cost-and-supply.json'},
 {'id':'FAB_ASSEMBLY','stage':'before_order_execution','issue':'General4L0.8mm non-certified-impedance prototype selected. Verify actual stackup/surcharge/DFM and physical placement preview using terminal map. No upload performed.','evidence':'first-prototype/electrical-and-execution.md'},
 {'id':'MECHANICAL_FIT','stage':'prototype_fit_before_populated_closure','issue':'Wire bay and adhesive pockets implemented. Wire OD/root/mating envelope are assumptions; check unmodified pack and dummy fit, insulation, cure, retention before populated closure.','evidence':'mechanical-first-prototype/review.json'},
 {'id':'POWER_USB','stage':'after_prototype','issue':'Conditional3.863mA/19.93h room-temperature estimate, not current bound. Verify peak<=110mA, charge safety, actual16h and FS USB.','evidence':'first-prototype/performance.json'},
 {'id':'FACTORY_FIRMWARE','stage':'before_programming_and_buyer_delivery','issue':'No flashable image. Authorized USB IDs, cutoff configuration, safe initial power, actual media sectors/format/identity/readback and normal factory-service acceptance remain required.','evidence':'first-prototype/electrical-and-execution.md'},
 {'id':'PHYSICAL','stage':'after_prototype','issue':'30h actual media,3OS, thermal, sound, wear, glue/cord/drop unmeasured. Not manufacturing-precondition measurements.'}]
old['selected_mechanical']='mechanical-first-prototype';old['design_review']='first-prototype/README.md';write(P/'release-gates.json',old)
# Original detailed qualification procedure retained with explicit current scope override.
p=P/'ASSEMBLY-AND-EVT.txt';s=p.read_text();marker='【初号試作版の適用優先】'
if marker not in s:p.write_text(marker+'\n現採用ケースと組立順はmechanical-first-prototype/ASSEMBLY.md。初号の試験順/実行条件はfirst-prototype/electrical-and-execution.mdを優先する。以下は詳細な後続EVT参考仕様で、4.4mAは設計配分目標。実測未了を基板発注前の停止条件にはしない。旧ケースの指示は現版へ流用しない。\n\n'+s)
# Circuit and manufacturing outputs remain byte-identical to the checked handoff.
base_commit='e818c7fc8ffcc9175b55c4293c7d4b4d5ebde961'
unchanged=[]
for pattern in ['design/pendant-review.kicad_pcb','design/pendant-review.kicad_sch','design/pendant-review.kicad_pro','design/pendant-review.kicad_dru','gerbers/*','drills/*','cpl-review-unverified-rotation.csv']:
 for p in P.glob(pattern):
  if p.is_file():
   old_bytes=subprocess.check_output(['git','show',base_commit+':'+str(p.relative_to(R))],cwd=R)
   assert hashlib.sha256(old_bytes).hexdigest()==sha(p),p
   unchanged.append(str(p.relative_to(P)))
drc=read(P/'drc.json');assert not drc['violations'] and not drc['unconnected_items'] and not drc['schematic_parity']
erc=read(P/'erc.json');assert all(not sheet['violations'] for sheet in erc['sheets'])
# Current firmware and CAD source matching; no tests rerun for unchanged files.
fw=read(P/'evidence/current-firmware-regression/result.json');mismatches=[f for f,h in fw['source_sha256'].items() if sha(R/f)!=h];assert not mismatches,mismatches
for t in fw['results']:assert t['returncode']==0;assert sha(P/'evidence/current-firmware-regression'/t['log'])==t['log_sha256']
mechanical=read(P/'mechanical-first-prototype/review.json')
for k,v in mechanical['checks'].items():
 if k.endswith('_valid'):assert v,k
 elif k.endswith('_solids'):assert v==1,k
 elif k.endswith('_mm3') and isinstance(v,(int,float)):assert abs(v)<1e-7,(k,v)
 elif isinstance(v,dict):assert all(abs(x)<1e-7 for x in v.values()),(k,v)
kit=read(P/'mechanical-first-prototype/geometry-correspondence.json');assert kit['status'].startswith('PASS_')
assert sha(P/'mechanical-first-prototype/a1mini-fit-kit/prototype-fit-kit.3mf')==kit['three_mf_sha256']
for row in kit['objects']:
 assert sha(P/'mechanical-first-prototype'/(Path(row['name']).stem+'.step'))==row['step_sha256']
 assert sha(P/'mechanical-first-prototype/a1mini-fit-kit'/row['name'])==row['stl_sha256']
assert sha(P/'design/pendant-review.kicad_pcb')==mechanical['pcb_sha256']
bom=list(csv.DictReader((P/'assembly-bom-review.csv').open()));sourcing=list(csv.DictReader((P/'sourcing-bom.csv').open()))
assert len(bom)==68
for r in sourcing:
 if r['jlc_part']:
  match=[b for b in bom if b['LCSC Part #']==r['jlc_part']];assert len(match)==int(r['qty_per_device']),(r,match)
  assert {b['Designator'] for b in match}==set(r['references'].split(','))
verification={'status':'PASS_DESIGN_ARTIFACT_CONSISTENCY_NOT_PHYSICAL_RELEASE','pcb_sha256':sha(P/'design/pendant-review.kicad_pcb'),'firmware_source_files_checked':len(fw['source_sha256']),'firmware_prior_checks_passed':len(fw['results']),'firmware_reexecuted':False,'firmware_source_changed':False,'pcb_geometry_changed':False,'bom_placements':len(bom),'bom_unique_parts':len({b['LCSC Part #'] for b in bom}),'bom_substitution':'C30 equivalent C501830','mechanical_checks':mechanical['checks'],'kit_correspondence':kit['status'],'slice':read(P/'mechanical-first-prototype/a1mini-fit-kit/result.json'),'ERC_violations':0,'DRC_violations':0,'unconnected':0,'parity':0,'unchanged_from_checked_handoff':unchanged,'ERC_ignored_checks':erc['ignored_checks'],'physical_tests_performed':False,'flashable_product_image':None,'source_sha256':{str(p.relative_to(R)):sha(p) for p in [Path(__file__),M/'build_prototype_case.py',M/'slice_prototype_fit_kit.py',M/'audit_prototype_fit_kit.py',P/'first-prototype/performance.json',P/'first-prototype/cost-and-supply.json']}}
write(O/'verification.json',verification)
completion={'status':'CONDITIONAL_DESIGN_PACKAGE_COMPLETE_EXECUTION_AND_PHYSICAL_VALIDATION_INCOMPLETE','stages':[{'id':1,'status':'conditional_design_decision_complete','evidence':'first-prototype/README.md'},{'id':2,'status':'cad_and_procedure_complete_under_explicit_envelopes_physical_fit_pending','evidence':'mechanical-first-prototype/ASSEMBLY.md'},{'id':3,'status':'artifacts_verified_git_delivery_record_in_commit_history','evidence':'first-prototype/verification.json'}],'not_claimed':['Immediately orderable programmed product','Manufacturer-guaranteed harness geometry','Physical16h or30h result','Manufacturing release'],'order_allowed':False}
write(P/'completion-audit.json',completion)
manifest=read(P/'manifest.json');manifest.update(status='CONDITIONAL_FIRST_PROTOTYPE_DESIGN_DO_NOT_ORDER',preferred_mechanical_candidate='mechanical-first-prototype',entrypoint='first-prototype/README.md',selected_bom_change='C30:C501830',assembly_rotation_verified=False)
manifest['files']={str(p.relative_to(P)):sha(p) for p in sorted(P.rglob('*')) if p.is_file() and p.name!='manifest.json' and p.suffix not in ('.kicad_prl','.pyc') and p.name!='.DS_Store'}
write(P/'manifest.json',manifest)
print(json.dumps({'files':len(manifest['files']),'firmware_checks':len(fw['results']),'firmware_files':len(fw['source_sha256']),'geometry':'pass'},indent=2))

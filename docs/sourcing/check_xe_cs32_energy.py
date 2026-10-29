"""Exact storage candidate conditional energy screen, not SPI or runtime qualification."""
from pathlib import Path
import hashlib,json
R=Path(__file__).resolve().parents[2]
base=R/'hardware/xe-minimal/recording-current-budget.json'
nonstorage_source=R/'docs/sourcing/xe-nonstorage-current-ledger.json'
pdf=R/'hardware/mini-rect-v12/reference/csnp32gcr01-bow.pdf'
b=json.loads(base.read_text());nonstorage_report=json.loads(nonstorage_source.read_text())
for report in [b,nonstorage_report]:
 for path,digest in report['source_sha256'].items():assert hashlib.sha256((R/path).read_bytes()).hexdigest()==digest,path
assert hashlib.sha256(pdf.read_bytes()).hexdigest()=='966792b6c65fd066decbb1d7e058a68d2896b4d50a6bcf6bf45722a709f25df0'
active,idle=25.,.2;period=5.;wire_ms=b['payload_only_4MHz_ms'];rows=[]
nonstorage=nonstorage_report['allocation_mA']['nonstorage_total']
for usable_fraction in (.5,.6,.7,.8,.9):
 budget=110*usable_fraction/16-nonstorage
 raw_ms=period*(budget-idle)/(active-idle)*1000
 rows.append({'usable_capacity_fraction_assumed':usable_fraction,'storage_average_budget_mA':budget,'idle_alone_exceeds_budget':budget<idle,'maximum_active_ms_per_5s':max(0,raw_ms),'payload_only_ms':wire_ms,'remaining_ms_for_commands_metadata_busy_and_gaps':raw_ms-wire_ms,'wire_only_pass_under_assumed_currents':raw_ms>=wire_ms})
wire_storage_average=idle+(active-idle)*wire_ms/5000
r={'status':'CONDITIONAL_EXACT_PART_SCREEN_NOT_16H_PROOF','part':'CSNP32GCR01-BOW','source_pdf_page':6,'printed_page':5,'published_values':{'operation_typical_mA':15,'operation_max_mA':25,'operation_condition':'3.3V,50MHz, read/write; no separate SPI4MHz/startup guarantee stated','standby_typical_mA':.15,'standby_max_mA':.2,'standby_condition':'3.3V,clock stopped'},'hypothesis':'Borrow the published maxima as active/idle states at SPI4MHz for screening only; transfer to actual operating conditions is unproven','ordinary_recording_indicator_mA':0.0,'adopted_4p4mA_target':{'storage_average_budget_mA':4.4-nonstorage,'wire_only_pass_under_assumed_currents':(4.4-nonstorage)>=wire_storage_average},'rows':rows,'payload_only_lower_bound_under_hypothesis':{'storage_average_mA':wire_storage_average,'whole_system_average_mA':nonstorage+wire_storage_average,'required_usable_mAh_for_16h':16*(nonstorage+wire_storage_average),'fraction_of_110mAh':16*(nonstorage+wire_storage_average)/110},'limits':['No commands, metadata, internal busy, recovery, startup or final commit energy included in the payload-only lower bound','Nonstorage allocation is unmeasured; ordinary recording indicator is disabled rather than continuously reserved','Actual on-board4.2V charge regulation, charger termination and the loaded recording stop do not establish any usable-capacity fraction without measurement','Read/write current guarantees at full voltage and temperature range and SPI mode remain unverified','Any alternate storage part must fit the same 4.4mA whole-device target and 110mA complete-pack peak limit; capacity or pin compatibility alone is insufficient'], 'source_sha256':{str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest()for p in [base,nonstorage_source,pdf]}}
r['limits']=[text.replace('on-board4.2V','4.1V nominal on-board') for text in r['limits']]
Path(__file__).with_name('xe-cs32-energy-screen.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(r,indent=2))

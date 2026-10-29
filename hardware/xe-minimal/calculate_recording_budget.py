"""Battery-side allocation ledger, separating engineering assumptions from evidence."""
from pathlib import Path
import json,hashlib,math
P=Path(__file__).resolve().parent;root=P.parents[1];design=P/'design.json';d=json.loads(design.read_text());parts={x['ref']:x for x in d['parts']}
def resistance(ref):return float(parts[ref]['value'].split()[0].rstrip('k'))*1000
for ref,pin in [('U12','8'),('R37','1'),('R38','1'),('R40','1'),('C29','1')]:assert next(x for x in parts[ref]['pins'] if x['number']==pin)['net']=='V3V3'
assert parts['U4']['value']=='TPS7A0233PDBVR', 'Recalculate battery current conversion if regulator topology changes'
# Keep the exploratory +/-5% rail envelope from guard-supply-comparison;
# not an assertion about dropout or transient regulation.
vmax=3.465;tol=.01
refs=vmax/((resistance('R38')+resistance('R39'))*(1-tol))+vmax/((resistance('R40')+resistance('R41'))*(1-tol))
sensor_short=vmax/(resistance('R37')*(1-tol));divider_ma=(refs+sensor_short)*1000
# Explicit engineering reserves, not datasheet max claims under all conditions.
comparator_reserve_ma=.002;bor_reserve_ma=.002
added_ma=divider_ma+comparator_reserve_ma+bor_reserve_ma
observed_path=root/'firmware/stm32/tests/five-second-import-result.json';observed=json.loads(observed_path.read_text());assert observed['chunk_samples']==80000
sector_bytes=math.ceil(max(observed['ciphertext_sizes_bytes'])/512)*512
spi_profile=root/'firmware/stm32/board/storage_spi.h';assert '#define PENDANT_STORAGE_SPI_TRANSFER_MHZ 4' in spi_profile.read_text()
base_allocation=2.8;capacity=110;hours=16;wire_ms=sector_bytes*8/4e6*1000
scenarios=[]
for usable in [.5,.6,.7,.8,.9]:
 total=capacity*usable/hours;storage=total-base_allocation-added_ma
 row={'usable_fraction_hypothesis':usable,'whole_battery_average_allocation_mA':total,'base_nonstorage_allocation_mA':base_allocation,'additional_guard_and_BOR_reserve_mA':added_ma,'remaining_storage_allocation_mA':storage}
 # These are conditional frequency-independent current examples, not approved memory guarantees.
 row['storage_sensitivity']=[]
 for active,idle in [(25,.2),(50,.25),(80,.135)]:
  allowed=5000*(storage-idle)/(active-idle)
  row['storage_sensitivity'].append({'active_current_hypothesis_mA':active,'idle_current_hypothesis_mA':idle,'max_active_ms_per_5s':max(0,min(5000,allowed)),'remaining_active_ms_after_payload_only_4MHz':allowed-wire_ms,'assumed_idle_alone_exceeds_allocation':storage<idle})
 scenarios.append(row)
report={'status':'ALLOCATION_UPDATED_NOT_RUNTIME_PROOF','battery':'DTP401525-XE','capacity_mAh':capacity,'continuous_recording_target_h':hours,'source_sha256':{str(f.relative_to(root)):hashlib.sha256(f.read_bytes()).hexdigest() for f in [design,observed_path,spi_profile]},'incremental_budget':{'divider_short_case_mA':divider_ma,'comparator_engineering_reserve_mA':comparator_reserve_ma,'BOR_engineering_reserve_mA':bor_reserve_ma,'additional_total_mA':added_ma,'additional_charge_16h_mAh':added_ma*hours,'accounting':'Linear regulator: conservatively carry output current to battery one-for-one, plus IQ elsewhere. Do not scale by3.3/3.7. Existing2.8mA allocation is unmeasured; adding explicit reserves does not validate it.'},'scenarios':scenarios,'encrypted_sector_payload_per_5s_bytes':sector_bytes,'payload_only_4MHz_ms':wire_ms,'limits':['Usable battery fraction is hypothetical and must include the actual on-board4.2V charge regulation and early termination, BOR4, LDO dropout, temperature and ageing','Guard reserve includes shorted NTC as electrical worst case; no assertion this is ordinary recording consumption','Base2.8mA excludes new explicit reserves by accounting choice, not by an established measurement','Comparator/BOR2uA entries are reserves requiring later verification against final conditions','Storage current examples omit startup, metadata, busy and frequency dependence; not part qualification','MCU microphone codec encryption and actual storage integrated charge remain unmeasured','Final16h test starts from the actual approved on-board4.2V charging profile, not an external laboratory charge'],'required_measurements':['Whole battery current and voltage during continuous recording, write bursts and storage startup','Usable discharge duration/energy after on-board charge at temperature endpoints','Recording continuity, buffer overruns and successful decryption across16h'],'order_ready':False}
report['limits']=[text.replace('on-board4.2V','4.1V nominal on-board') for text in report['limits']]
(P/'recording-current-budget.json').write_text(json.dumps(report,indent=2)+'\n');print('Additional reserve mA',added_ma,'16h mAh',added_ma*hours);print(json.dumps(scenarios[2],indent=2))

"""Derive measurable storage charge allocation; no card or runtime qualification."""
from pathlib import Path
import json,hashlib
P=Path(__file__).resolve().parent;root=P.parents[1]
files=['firmware/stm32/crypto/fatfs_recording.h','firmware/stm32/crypto/fatfs_recording.c','docs/sourcing/xe-integrated-16h-budget.json']
power_report=json.loads((root/files[2]).read_text())
allocation=power_report['current_allocation_mA']
assert allocation['indicator_during_ordinary_recording_mA']==0.0
power={'storage_average_allocation_mA':allocation['storage_total_allocation_at_4p4mA_target'],'average_battery_limit_mA':power_report['adopted_design_allocation']['whole_device_average_target_mA']}
header=(root/files[0]).read_text();commit=(root/files[1]).read_text()
assert 'WAV_CHUNK_SAMPLES != 160000U' in header and '#define FATFS_RECORDING_MAX_BYTES 131072u' in header
assert all(t in commit for t in ['f_sync(&s->file)','f_close(&s->file)','f_rename(s->pending,s->final)','disk_ioctl(0,CTRL_SYNC,0)'])
period=10.;budget=power['storage_average_allocation_mA'];rows=[]
for active,idle in [(40.,.13),(60.,1.05),(80.,.2),(90.,.2)]:
 duration=period*(budget-idle)/(active-idle)
 assert 0<duration<period
 wire_ms=power_report['record_encrypt_store_path']['encrypted_bytes_per_segment']*8/4_000_000*1000
 assert abs((active*duration+idle*(period-duration))/period-budget)<1e-10
 rows.append(dict(active_current_hypothesis_mA=active,idle_current_hypothesis_mA=idle,max_aggregate_active_ms_per_10s=1000*duration,payload_only_4MHz_ms=wire_ms,remaining_ms_after_payload_only=1000*duration-wire_ms,payload_only_fits_assumed_current_budget=1000*duration>=wire_ms,ceiling_131072_byte_file_min_effective_service_rate_Bps=131072/duration,peak_with_20mA_nonstorage_reserve=active+20))
r=dict(status='MEASUREMENT_ALLOCATION_NOT_RUNTIME_PROOF',source_hashes={f:hashlib.sha256((root/f).read_bytes()).hexdigest() for f in files},profile='PENDANT_COOPERATIVE_SAVE with 160000 samples at assumed/required 16000 Hz',period_s=period,storage_average_allocation_mA=budget,storage_charge_per_period_mC=period*budget,system_average_allocation_mA=power['average_battery_limit_mA'],system_charge_per_period_mC=period*power['average_battery_limit_mA'],rows=rows,bench_method=['Integrate storage-rail current over complete consecutive 10-second periods, including wake, data, metadata, sync, close, rename and final CTRL_SYNC; mA*s equals mC.','Separately integrate whole-system battery current; do not infer MCU encryption, microphone or regulator loss from storage-rail current.','Retain waveform sample rate/bandwidth, board/ELF/card revision, battery voltage, temperature and filesystem occupancy.','Capture initial boot/mount/recovery and final commit separately and include their charge in full-session total.','Run selected card through nearly-full and aged/fragmented media as well as empty media; average over complete sessions and inspect peaks.'],limits=['110mAh x 70% usable is an assumption; the adopted 4.4mA target does not prove16h at actual voltage cutoff.','Hypothetical active/idle levels are not guaranteed card limits; peak remains independently limited by pack and regulator.','131072 bytes is a firmware safety ceiling, not an observed file size. Effective service rate includes all overhead and is not a card advertised sequential speed.','A 10-second local allocation can be exceeded transiently if measured full-session charge and buffering remain within independently verified limits; this is a design screen, not an invented battery peak rating.','Selected storage candidate remains unqualified; no measured charge, validated usable battery energy or runtime result.'])
r['limits'].append('Payload-only comparison assumes the hypothetical active current applies throughout SPI transfer; negative remaining time rejects that scenario, not the actual unmeasured storage part. Metadata, busy and commands add time beyond this lower bound.')
r['usable_fraction_hypothesis']=power_report['battery']['planning_usable_fraction']
r['nonstorage_base_allocation_mA']=allocation['mcu_mic_codec_crypto_regulators_base_hypothesis']
r['additional_guard_and_BOR_reserve_mA']=allocation['temperature_guard_and_BOR_reserve']
r['LED_during_ordinary_recording_mA']=allocation['indicator_during_ordinary_recording_mA']
assert abs(r['storage_average_allocation_mA']-allocation['storage_total_allocation_at_4p4mA_target'])<1e-12
(P/'xe-storage-energy-screen.json').write_text(json.dumps(r,indent=2)+'\n')
print('Storage allocation:',r['storage_charge_per_period_mC'],'mC per 10s')
for row in rows:print(row)

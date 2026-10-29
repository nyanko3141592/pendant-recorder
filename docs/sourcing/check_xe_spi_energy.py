"""Ideal SPI wire-time lower bound against storage current hypotheses."""
from pathlib import Path
import json,hashlib,math
P=Path(__file__).resolve().parent;root=P.parents[1]
spi=root/'firmware/stm32/board/storage_spi.c';wav=root/'firmware/stm32/core/wav_chunk.h'
s=spi.read_text();w=wav.read_text()
assert 'clock.Spi1ClockSelection=RCC_SPI1CLKSOURCE_PCLK2;' in s
assert 'bus.Init.BaudRatePrescaler=PENDANT_STORAGE_SPI_PRESCALER;' in s
profile=root/'firmware/stm32/board/storage_spi.h'
assert '#define PENDANT_STORAGE_SPI_TRANSFER_MHZ 4' in profile.read_text()
assert '(60U+((WAV_CHUNK_SAMPLES+2040U)/2041U)*1024U)' in w
clock_hz=16000000;divider=4;spi_hz=clock_hz/divider
plain_bytes=60+math.ceil(160000/2041)*1024
minimum_wire_s=plain_bytes*8/spi_hz
energy=json.loads((P/'xe-storage-energy-screen.json').read_text());rows=[]
for row in energy['rows']:
 allowed=row['max_aggregate_active_ms_per_10s']/1000
 active=row['active_current_hypothesis_mA'];idle=row['idle_current_hypothesis_mA']
 rows.append(dict(active_mA=active,idle_mA=idle,allowed_active_ms=allowed*1000,plaintext_only_wire_time_ms=minimum_wire_s*1000,remaining_time_for_encryption_framing_metadata_commands_busy_and_HAL_gaps_ms=(allowed-minimum_wire_s)*1000,ideal_storage_average_lower_bound_mA=(active*minimum_wire_s+idle*(10-minimum_wire_s))/10,ideal_wire_time_alone_exceeds_allocation=minimum_wire_s>allowed))
r=dict(status='IDEAL_WIRE_TIME_SCREEN_NOT_CURRENT_MEASUREMENT',source_hashes={str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [spi,profile,wav,P/'xe-storage-energy-screen.json']},nominal_HSI_hz=clock_hz,prescaler=divider,nominal_SPI_hz=spi_hz,cooperative_plaintext_bytes=plain_bytes,rows=rows,limitations=['HSI16 nominal only; no measured SPI clock or timing tolerance included.','Plaintext count is a lower bound on encrypted bytes; no plaintext is written to storage.','Assumes the hypothetical active current applies for the whole wire-transfer interval. Actual current waveform may differ, so failing this model does not disqualify a real card without evidence.','Encryption framing, sector rounding, metadata reads/writes, card busy, commands and CPU HAL gaps all require additional time/charge.','Do not raise SPI clock solely from this model; exact card timing, GPIO/PCB signal integrity and firmware timing need validation.','16h usable battery energy and non-storage allocation remain unverified.'])
# New evidence: real ten-second codec/age output; preserve historical plaintext screen.
observed_path=root/'firmware/stm32/tests/storage-36h-result.json'
observed=json.loads(observed_path.read_text())
assert observed['represented_seconds']//observed['files']==10
for rel,digest in observed['source_sha256'].items():
 assert hashlib.sha256((root/'firmware/stm32'/rel).read_bytes()).hexdigest()==digest,rel
cipher_bytes=observed['observed_full_ciphertext_bytes']
sector_bytes=math.ceil(cipher_bytes/512)*512
profiles=[]
for mhz,div in [(4,4),(8,2)]:
 assert f'SPI_BAUDRATEPRESCALER_{div}' in profile.read_text()
 hz=clock_hz/div
 wire=sector_bytes*8/hz
 cases=[]
 for row in energy['rows']:
  allowed=row['max_aggregate_active_ms_per_10s']
  active=row['active_current_hypothesis_mA'];idle=row['idle_current_hypothesis_mA']
  cases.append(dict(active_mA=active,idle_mA=idle,allowed_active_ms=allowed,
   remaining_other_active_ms=allowed-wire*1000,
   sector_payload_only_average_mA=(active*wire+idle*(10-wire))/10,
   wire_time_alone_exceeds_allocation=wire*1000>allowed))
 profiles.append(dict(nominal_SPI_MHz=mhz,bench_only=mhz==8,
  ciphertext_byte_only_wire_ms=cipher_bytes*8/hz*1000,
  sector_payload_only_wire_ms=wire*1000,rows=cases))
r['observed_ciphertext_profiles']=dict(evidence_path=str(observed_path.relative_to(root)),
 evidence_sha256=hashlib.sha256(observed_path.read_bytes()).hexdigest(),
 ciphertext_bytes=cipher_bytes,sector_bytes=sector_bytes,profiles=profiles,
 limitations=['Observed ciphertext size comes from host execution, not physical SD timing.',
 'Sector payload excludes command/token/CRC, FAT and directory traffic, read-modify-write, busy and HAL gaps.',
 '8MHz is a compile-checked comparison profile, not adopted operational speed.',
 'Both speed cases reuse identical hypothetical current; frequency-dependent actual current is unknown.'])
assert cipher_bytes==81172 and sector_bytes==81408
print('Encrypted sector payload profiles:',json.dumps(profiles,indent=2))
(P/'xe-spi-energy-screen.json').write_text(json.dumps(r,indent=2)+'\n')
assert plain_bytes==80956 and abs(minimum_wire_s-.161912)<1e-12
print('Nominal SPI:',spi_hz,'Hz; plaintext lower-bound wire time:',minimum_wire_s*1000,'ms')
for row in rows:print(row)

"""Synthetic C recorder -> standard age -> production host importer -> PCM WAV.
Only temporary fixtures; no real device or user recordings are accessed.
"""
from pathlib import Path
import tempfile
import subprocess as sp
import sys
import wave
import os
import hashlib
import json
root=Path(__file__).resolve().parents[1];repo=root.parents[1]
age=str(Path(sys.argv[1]).resolve());keygen=str(Path(age).with_name('age-keygen'))
storage_arrivals='--storage-arrivals' in sys.argv[2:]
cooperative='--cooperative' in sys.argv[2:] or storage_arrivals
five_second='--five-second' in sys.argv[2:]
expected_samples=331776 if storage_arrivals else 328704 if cooperative else 327680
expected_tail=11776 if storage_arrivals else 8704 if cooperative else 7680
expected_files=5 if five_second else 3
chunk_samples=80000 if five_second else 160000
use_fat32='--fat32' in sys.argv[2:] or storage_arrivals
use_fatfs='--fatfs' in sys.argv[2:] or use_fat32
source=r'''
#include "recording_pipeline.h"
#include "recording_store.h"
#include <unistd.h>
#include "agec.h"
#include <assert.h>
static recording_pipeline pipeline;
static audio_queue queue;
static uint8_t recipient[32];
static FILE *out;
static unsigned files;
static bool rng(void *v,uint8_t *p,size_t n){(void)v;arc4random_buf(p,n);return true;}
static bool writer(void *v,const uint8_t *p,size_t n){(void)v;return fwrite(p,1,n,out)==n;}
static char pending[1024],final[1024];
static bool begin(void *v){
 snprintf(pending,sizeof(pending),"%s/%03u.partial",(char *)v,files);
 snprintf(final,sizeof(final),"%s/%03u.age",(char *)v,files);
 out=fopen(pending,"wbx");return out!=NULL;
}
static bool commit(void *v){
 (void)v;if(fflush(out)!=0||fsync(fileno(out))!=0)return false;
 int result=fclose(out);out=NULL;if(result!=0)return false;
 if(rename(pending,final)!=0)return false;
 files++;return true;
}
static void abort_file(void *v){(void)v;if(out){fclose(out);out=NULL;}}
int main(int argc,char **argv){
 if(argc!=3)return 2;assert(x25519pubkey(argv[1],recipient));
 storage_owner owner;owner_init(&owner,true);
 recording_store store={.owner=&owner,.recipient_provisioned=true,.rng=rng,
 .begin=begin,.write=writer,.commit=commit,.abort=abort_file,.io_ctx=argv[2]};
 memcpy(store.recipient,recipient,32);
 recording_pipeline_init(&pipeline);audio_queue_init(&queue);
 int16_t block[AUDIO_BLOCK_SAMPLES];
 for(unsigned b=0;b<320;b++){
  for(unsigned i=0;i<AUDIO_BLOCK_SAMPLES;i++)block[i]=(int16_t)((((b*AUDIO_BLOCK_SAMPLES+i)%320)*100)-16000);
  assert(audio_queue_push(&queue,block));
  assert(recording_pipeline_service(&pipeline,&queue,recording_store_save,&store));
 }
 assert(owner_step(&owner,USB_CONFIGURED)==ACT_STOP_AND_FLUSH);
 assert(recording_pipeline_finish(&pipeline,&queue,recording_store_save,&store));
 assert(pipeline.committed_samples==327680&&files==3);return 0;
}
'''
if use_fatfs:
 # Reuse the RAM-only block fixture; extraction never touches a physical disk.
 fixture=(root/'tests/test_fatfs_volume.c').read_text().split('int main(void)')[0]
 fixture=fixture.replace('#include "../board/storage_mount.h"','#include "storage_mount.h"')
 fixture=fixture.replace('#include "../board/storage_handoff.h"','#include "storage_handoff.h"')
 fixture=fixture.replace('#include "../board/storage_diskio.h"','#include "storage_diskio.h"').replace('#include "../crypto/fatfs_recording.h"','#include "fatfs_recording.h"')
 start=source.index('static FILE *out;')
 end=source.index('int main(int argc',start)
 source=source[:start]+fixture+"\nstatic bool rng(void *v,uint8_t *p,size_t n){(void)v;arc4random_buf(p,n);return true;}\n"+source[end:]
 source=source.replace('recording_store store={','''create_fixture();
 board_storage disk={.owner=&owner,.info={TEST_SECTORS*512,false},.ready=true};
 storage_diskio_bind(&disk);FATFS fs;assert(f_mount(&fs,"0:",1)==FR_OK);
 fatfs_recording files={0};assert(fatfs_recording_recover(&files));
 recording_store store={''')
 source=source.replace('.begin=begin,.write=writer,.commit=commit,.abort=abort_file,.io_ctx=argv[2]',
 '.begin=fatfs_recording_begin,.write=fatfs_recording_write,.commit=fatfs_recording_commit,.abort=fatfs_recording_abort,.io_ctx=&files')
 source=source.replace('#include "recording_pipeline.h"','#include "recording_pipeline.h"\n#include "recording_session.h"')
 source=source.replace('int main(int argc', 'static bool stopped(void *ctx){(void)ctx;return true;}\nint main(int argc')
 source=source.replace('memcpy(store.recipient,recipient,32);','''memcpy(store.recipient,recipient,32);
 storage_handoff filesystem={.owner=&owner,.recording=&files,.mounted=true};
 recording_session session={.store=&store,.filesystem=&filesystem,.stop_and_drain=stopped};''')
 source=source.replace('int16_t block[AUDIO_BLOCK_SAMPLES];','''assert(recording_session_can_start(&session,&pipeline,&queue));
 store.recipient_provisioned=false;assert(!recording_session_can_start(&session,&pipeline,&queue));
 store.recipient_provisioned=true;
 pipeline.chunk.samples=1;assert(!recording_session_can_start(&session,&pipeline,&queue));pipeline.chunk.samples=0;
 int16_t block[AUDIO_BLOCK_SAMPLES];''')
 source=source.replace('assert(audio_queue_push(&queue,block));','assert(audio_queue_push(&queue,block));assert(!recording_session_can_start(&session,&pipeline,&queue));')
 source=source.replace('recording_pipeline_service(&pipeline,&queue,recording_store_save,&store)',
                       'recording_session_service(&session,&pipeline,&queue)')
 source=source.replace('assert(recording_pipeline_finish(&pipeline,&queue,recording_store_save,&store));','''
 assert(recording_session_handoff(&session,&pipeline,&queue)==ACT_EXPOSE_MSC);
 assert(owner.state==OWN_HOST&&!filesystem.mounted);
 assert(!recording_session_service(&session,&pipeline,&queue));
 assert(disk_status(0)&STA_NOINIT);
 assert(owner_step(&owner,USB_DISCONNECTED)==ACT_REVOKE_MSC);
 /* Synthetic transport has no callbacks/endpoints in flight. */
 assert(owner_step(&owner,HOST_RELEASED)==ACT_RECOVER_FS);
 uint64_t available;
 assert(storage_mount_recordings(&disk,&fs,&files,&filesystem,&available));
 assert(owner_step(&owner,RECOVERY_OK)==ACT_RESUME_RECORDING);
 assert(recording_session_can_start(&session,&pipeline,&queue));''')
 source=source.replace('&&files==3);return 0;','''&&files.next_id==3&&!files.open);
 assert(f_mount(0,"0:",0)==FR_OK);assert(f_mount(&fs,"0:",1)==FR_OK);
 assert(fatfs_recording_recover(&files)&&files.next_id==3);
 FIL marker;UINT marker_size;char marker_data[256]={0};
 assert(f_open(&marker,"0:/PENDANT.JSON",FA_READ)==FR_OK);
 assert(f_read(&marker,marker_data,sizeof(marker_data)-1,&marker_size)==FR_OK);
 assert(f_close(&marker)==FR_OK);
 assert(strstr(marker_data,"pendant-recorder")&&strstr(marker_data,"ima16k-mono-1024-age-v1"));
 for(unsigned id=0;id<3;id++){
  char path[1024];FIL file;FILINFO info;UINT got;uint8_t bytes[1024];
  snprintf(path,sizeof(path),"0:/REC/%08X.TMP",id);assert(f_stat(path,&info)==FR_NO_FILE);
  snprintf(path,sizeof(path),"0:/REC/%08X.AGE",id);assert(f_open(&file,path,FA_READ)==FR_OK);
  snprintf(path,sizeof(path),"%s/%08X.AGE",argv[2],id);FILE *out=fopen(path,"wbx");assert(out);
  do{assert(f_read(&file,bytes,sizeof(bytes),&got)==FR_OK);assert(fwrite(bytes,1,got,out)==got);}while(got);
  assert(f_close(&file)==FR_OK);assert(fclose(out)==0);
 }
 /* Failure to establish capture stop must never grant host access. */
 assert(owner_step(&owner,USB_CONFIGURED)==ACT_STOP_AND_FLUSH);
 session.stop_and_drain=NULL;
 assert(recording_session_handoff(&session,&pipeline,&queue)==ACT_REPORT_FAULT);
 assert(owner.state==OWN_FAULT&&filesystem.mounted&&!files.open);
 assert(f_mount(0,"0:",0)==FR_OK);storage_diskio_bind(0);free(image);return 0;''')
if five_second:
 # Exercise the same codec/store/age bytes at5s; this is not the cooperative scheduler.
 source=source.replace('files==3','files==5').replace('files.next_id==3','files.next_id==5').replace('id<3','id<5')
reference_source=source
if cooperative:
 source=source.replace('pipeline.chunk.samples','pipeline.chunks[pipeline.active].samples')
 source=source.replace('pipeline.committed_samples==327680','pipeline.committed_samples==328704')
 # Exactly one synthetic DMA block arrives while real encryption owns frozen WAV.
 source=source.replace('arc4random_buf(p,n);return true;', '''static bool injected=false;
 if(!injected){
  assert(pipeline.saving);int16_t arriving[AUDIO_BLOCK_SAMPLES]={0};
  assert(audio_queue_push(&queue,arriving));
  assert(cooperative_pipeline_pump(&pipeline,&queue));injected=true;
 }
 arc4random_buf(p,n);return true;''')
if cooperative:
 reference_source=reference_source.replace('pipeline.committed_samples==327680','pipeline.committed_samples==328704')
 reference_source=reference_source.replace('arc4random_buf(p,n);return true;', '''static bool injected=false;
 if(!injected){int16_t arriving[AUDIO_BLOCK_SAMPLES]={0};
  assert(audio_queue_push(&queue,arriving));injected=true;}
 arc4random_buf(p,n);return true;''')
if storage_arrivals:
 # One distinct block at each first-transaction storage callback boundary.
 # Retain the existing RNG arrival as a fourth block; reference defers all
 # queued arrivals until its synchronous save returns.
 hooks=r'''bool raw_recording_begin(void *);
bool raw_recording_write(void *,const uint8_t *,size_t);
bool raw_recording_commit(void *);
static unsigned storage_arrival_mask;
static void inject_storage_arrival(unsigned stage){
 unsigned bit=1U<<stage;if(storage_arrival_mask&bit)return;
 storage_arrival_mask|=bit;
 int16_t arriving[AUDIO_BLOCK_SAMPLES];
 for(unsigned i=0;i<AUDIO_BLOCK_SAMPLES;i++)arriving[i]=(int16_t)(1000*(stage+1)+i);
 assert(audio_queue_push(&queue,arriving));
#ifdef PENDANT_COOPERATIVE_SAVE
 assert(pipeline.saving);assert(cooperative_pipeline_pump(&pipeline,&queue));
#endif
}
bool fatfs_recording_begin(void *ctx){
 bool ok=raw_recording_begin(ctx);if(ok)inject_storage_arrival(0);return ok;
}
bool fatfs_recording_write(void *ctx,const uint8_t *data,size_t size){
 bool ok=raw_recording_write(ctx,data,size);if(ok)inject_storage_arrival(1);return ok;
}
bool fatfs_recording_commit(void *ctx){
 inject_storage_arrival(2);return raw_recording_commit(ctx);
}
'''
 def add_storage_hooks(text):
  text=text.replace('int main(int argc',hooks+'int main(int argc')
  text=text.replace('assert(pipeline.committed_samples==328704',
                    'assert(storage_arrival_mask==7);assert(pipeline.committed_samples==331776')
  return text
 source=add_storage_hooks(source)
 reference_source=add_storage_hooks(reference_source)
with tempfile.TemporaryDirectory(prefix='pendant-end-to-end-') as td:
 p=Path(td);volume=p/'volume';volume.mkdir();dest=p/'imported';(p/'main.c').write_text(source)
 vendor=root/'vendor/agec';sources=list(vendor.glob('*.c'))+list((vendor/'crypto').glob('*.c'))
 sources += ([root/'core/cooperative_pipeline.c'] if cooperative else [])
 sources += [root/'crypto/age_writer.c',root/'crypto/recording_store.c']+[root/'core'/f for f in ['recording_pipeline.c','storage_owner.c','audio_queue.c','wav_chunk.c','ima_adpcm.c']]
 if use_fatfs:
  sources += [root/'board/recording_session.c',root/'core/recording_handoff.c',root/'board/storage_mount.c',root/'board/storage_handoff.c',root/'crypto/fatfs_recording.c',root/'board/storage_diskio.c',root/'vendor/fatfs/ff.c',root/'vendor/fatfs/ffunicode.c']
 if storage_arrivals:
  # Keep the session's exact function-identity guard. Instrument only this
  # temporary test build, forwarding to unmodified FatFs recording code.
  real_fatfs=root/'crypto/fatfs_recording.c'
  defines=''.join('#define fatfs_recording_'+name+' raw_recording_'+name+'\n' for name in ['begin','write','commit'])
  instrumented=p/'fatfs_instrumented.c'
  instrumented.write_text(defines+real_fatfs.read_text())
  sources=[instrumented if x==real_fatfs else x for x in sources]
 build_command=[
  'cc',
  *(['-DPENDANT_COOPERATIVE_SAVE'] if cooperative else []),
  '-DPENDANT_FIRMWARE_VERSION="synthetic-e2e"',
  '-DPENDANT_SOURCE_REVISION="local-test"',
  '-DPENDANT_HARDWARE_REVISION="HW-V1.0"',
  '-DWAV_CHUNK_SAMPLES='+str(chunk_samples)+'U',
  '-DTEST_FAT32='+str(int(use_fat32)),
  '-I',str(root/'board'),'-I',str(root/'vendor/fatfs'),
  '-O2','-g','-fsanitize=address,undefined','-iquote',str(vendor),
  '-I',str(root/'crypto'),'-I',str(root/'core'),str(p/'main.c'),
  *[str(s) for s in sources],'-o',str(p/'recorder')
 ]
 sp.run(build_command,check=True)
 sp.run([keygen,'-o',str(p/'key')],check=True,capture_output=True)
 recipient=sp.check_output([keygen,'-y',str(p/'key')],text=True).strip()
 sp.run([str(p/'recorder'),recipient,str(volume)],check=True)
 command=[sys.executable,str(repo/'host/import_recordings.py'),'--volume',str(volume),'--destination',str(dest),'--identity',str(p/'key'),'--age',age]
 sp.run(command,check=True)
 wavs=list(dest.rglob('*.wav'));assert len(wavs)==expected_files,(wavs,dest)
 counts=[]
 for wav in wavs:
  with wave.open(str(wav),'rb') as f:
   assert (f.getnchannels(),f.getsampwidth(),f.getframerate())==(1,2,16000)
   counts.append(f.getnframes())
 assert sorted(counts)==[expected_tail]+[chunk_samples]*(expected_files-1),counts
 if cooperative:
  # Reference queues the identical arrival but processes it after encryption.
  # Compare ordered files, not unordered sample counts or random ciphertext.
  (p/'reference.c').write_text(reference_source)
  reference_command=[x for x in build_command if x not in ['-DPENDANT_COOPERATIVE_SAVE',str(root/'core/cooperative_pipeline.c')]]
  reference_command=[str(p/'reference.c') if x==str(p/'main.c') else str(p/'reference') if x==str(p/'recorder') else x for x in reference_command]
  sp.run(reference_command,check=True)
  ref_volume=p/'reference-volume';ref_volume.mkdir();ref_dest=p/'reference-import'
  sp.run([str(p/'reference'),recipient,str(ref_volume)],check=True)
  sp.run([sys.executable,str(repo/'host/import_recordings.py'),'--volume',str(ref_volume),'--destination',str(ref_dest),'--identity',str(p/'key'),'--age',age],check=True,capture_output=True)
  actual=sorted(f for f in volume.iterdir() if f.suffix.lower()=='.age')
  expected=sorted(f for f in ref_volume.iterdir() if f.suffix.lower()=='.age')
  assert len(actual)==len(expected)==expected_files
  for af,ef in zip(actual,expected):
   ad=sp.check_output([age,'-d','-i',str(p/'key'),str(af)])
   ed=sp.check_output([age,'-d','-i',str(p/'key'),str(ef)])
   assert ad==ed,('Encoded WAV mismatch',af.name,ef.name)
   ah=hashlib.sha256(af.read_bytes()).hexdigest();eh=hashlib.sha256(ef.read_bytes()).hexdigest()
   assert (dest/ah/'audio.wav').read_bytes()==(ref_dest/eh/'audio.wav').read_bytes(),('PCM mismatch',af.name)
  print('PASS ordered encoded WAV and imported PCM match synchronous reference for every file')
 # Replay actual importer to ensure completed output is safely deduplicated.
 sp.run(command,check=True);assert len(list(dest.rglob('*.wav')))==expected_files
 assert not list(volume.glob('*.partial'))
 assert len([f for f in volume.iterdir() if f.suffix.lower()=='.age'])==expected_files # default source preservation
 sizes=sorted(f.stat().st_size for f in volume.iterdir() if f.suffix.lower()=='.age')
 if five_second: assert max(sizes)<=65536,sizes
 if cooperative:
  # Fixed-rate ADPCM: 79 blocks * 1024 + 60 WAV bytes; one binary
  # X25519 age recipient adds 216 bytes for this two-payload-chunk file.
  assert max(sizes)==81172,sizes
  assert max(sizes)<=82180  # Conservative 30-hour capacity fixture.
 print('Ciphertext bytes:',sizes,'chunk_samples:',chunk_samples,'cooperative:',cooperative,'storage_arrivals:',storage_arrivals)
 print('Storage backend:', ('real FatFs on synthetic RAM FAT32' if use_fat32 else 'real FatFs on synthetic RAM FAT16') if use_fatfs else 'POSIX fixture')
 print(f'PASS: C capture/ADPCM/WAV/store/age -> host PCM WAV,{expected_samples} samples,{expected_files}files,retry/source preservation')
 if five_second and use_fat32 and not cooperative:
  evidence_sources=[
   Path(__file__),root/'core/wav_chunk.c',root/'core/wav_chunk.h',
   root/'crypto/age_writer.c',root/'crypto/fatfs_recording.c',
   root/'core/recording_pipeline.c'
  ]
  result={
   'status':'PASS_FIVE_SECOND_CODEC_STORE_IMPORT_RAM_FAT32',
   'command':'python3 firmware/stm32/tests/check_recording_end_to_end.py /tmp/pendant-host-tools/age --fat32 --five-second',
   'chunk_samples':chunk_samples,'sample_rate':16000,'files':expected_files,
   'decoded_samples':sum(counts),'ciphertext_sizes_bytes':sizes,
   'full_chunk_plaintext_bytes':41020,
   'observed_encryption_overhead_bytes':max(sizes)-41020,
   'storage_ceiling_bytes':65536,'full_chunks_for_36h':25920,
   'derived_ciphertext_payload_36h_bytes':max(sizes)*25920,
   'derived_16KiB_cluster_file_allocation_36h_bytes':49152*25920,
   'scope':['Real C codec/store/age writer and FatFs on synthetic RAM FAT32','Standard age decryption and production host importer','ASan and UBSan','Five decoded files with expected sample counts','Retry deduplication and source preservation'],
   'limitations':['Five-second codec exercised through synchronous pipeline; cooperative save scheduling is not exercised.','36h sizes are arithmetic extrapolation, not a 36h physical encryption/capture test.','Cluster allocation excludes FAT/directories/marker/other files.','No physical storage timing, capacity, power, endurance or uninterrupted ADC capture validation.'],
   'source_sha256':{str(path.relative_to(root)):hashlib.sha256(path.read_bytes()).hexdigest() for path in evidence_sources},
   'release_allowed':False,
  }
  (root/'tests/five-second-import-result.json').write_text(json.dumps(result,indent=2)+'\n')

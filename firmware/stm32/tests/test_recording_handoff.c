#include "../core/recording_handoff.h"
#include <assert.h>
#include <string.h>
#include <stdio.h>
static storage_owner owner;
static recording_pipeline pipeline;
static audio_queue queue;
static int16_t pcm[AUDIO_BLOCK_SAMPLES];
static unsigned stage,stop_calls,sink_calls,unmount_calls,identity_calls,fail_at,disconnect_at;
static uint64_t samples;
static bool controlled_stop;
static const char *marker_output;
static bool stop(void *ctx){
 (void)ctx;assert(stage==0&&!owner_host_can_access(&owner));stage=1;stop_calls++;
 if(disconnect_at==1)owner_step(&owner,USB_DISCONNECTED);
 if(fail_at==1)return false;
 /* Driver's final partial block: no padding is valid audio. */
 return audio_queue_push_samples(&queue,pcm,137);
}
static bool sink(void *ctx,const uint8_t *data,size_t size,uint32_t n){
 (void)ctx;assert(data&&size&&stage==1&&owner_device_can_finalize(&owner));
 assert(!owner_host_can_access(&owner));sink_calls++;samples+=n;
 if(disconnect_at==2)owner_step(&owner,USB_DISCONNECTED);
 return fail_at!=2;
}
static bool write_identity(void *ctx,const char *name,const uint8_t *data,size_t size){
 (void)ctx;assert(stage==1&&sink_calls&&owner_device_can_finalize(&owner));
 assert(!owner_host_can_access(&owner));
 const char expected[]="{\"product\":\"pendant-recorder\",\"schema_version\":2,\"hardware_revision\":\"XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH\",\"firmware_version\":\"LINK-FIXTURE\",\"source_revision\":\"UNQUALIFIED\",\"audio_profile\":\"ima16k-mono-1024-age-v1\"}\n";
 assert(strcmp(name,"PENDANT.JSON")==0);
 assert(size==sizeof(expected)-1&&memcmp(data,expected,size)==0);
 if(marker_output){FILE *f=fopen(marker_output,"wb");assert(f);assert(fwrite(data,1,size,f)==size);assert(fclose(f)==0);}
 identity_calls++;stage=2;
 if(disconnect_at==3)owner_step(&owner,USB_DISCONNECTED);
 return fail_at!=3;
}
static bool unmount(void *ctx){
 (void)ctx;assert(stage==2&&identity_calls&&owner_device_can_finalize(&owner));
 assert(!owner_host_can_access(&owner));stage=3;unmount_calls++;
 if(disconnect_at==4)owner_step(&owner,USB_DISCONNECTED);
 return fail_at!=4;
}
static void reset(void){
 owner_init(&owner,true);recording_pipeline_init(&pipeline);audio_queue_init(&queue);
 stage=stop_calls=sink_calls=unmount_calls=identity_calls=0;samples=0;
 /* Already captured sample block must precede the final driver tail. */
 assert(audio_queue_push(&queue,pcm));
 assert(owner_step(&owner,controlled_stop?STOP_RECORDING:USB_CONFIGURED)==ACT_STOP_AND_FLUSH);
}
int main(int argc,char **argv){
 marker_output=argc==2?argv[1]:0;
 recording_handoff_ops ops={stop,sink,write_identity,unmount,0};
 for(disconnect_at=0;disconnect_at<=4;disconnect_at++){
  fail_at=0;reset();unsigned a=recording_handoff_finish(&owner,&pipeline,&queue,&ops);
  assert(samples==1024+137&&pipeline.committed_samples==samples);
  assert(stop_calls==1&&sink_calls==1&&unmount_calls==1);
  assert(a==(disconnect_at?ACT_RECOVER_FS:ACT_EXPOSE_MSC));
  assert(owner_host_can_access(&owner)==!disconnect_at);
  assert(recording_handoff_finish(&owner,&pipeline,&queue,&ops)==ACT_NONE);
  assert(stop_calls==1); /* duplicate completion cannot re-expose or save twice */
 }
 disconnect_at=0;
 for(fail_at=1;fail_at<=4;fail_at++){
  reset();assert(recording_handoff_finish(&owner,&pipeline,&queue,&ops)==ACT_REPORT_FAULT);
  assert(owner.state==OWN_FAULT&&!owner_host_can_access(&owner));
  assert(sink_calls==(fail_at!=1));assert(identity_calls==(fail_at>=3));assert(unmount_calls==(fail_at==4));
 }
 reset();assert(recording_handoff_finish(&owner,&pipeline,&queue,0)==ACT_REPORT_FAULT);
 assert(!stop_calls&&!sink_calls&&!unmount_calls);
 owner_init(&owner,true);
 assert(recording_handoff_finish(&owner,&pipeline,&queue,&ops)==ACT_NONE);
 /* Real tail pipeline for controlled stop, including every callback failure.
  * The encrypted sink and filesystem hooks remain native fakes. */
 controlled_stop=true;disconnect_at=0;fail_at=0;reset();
 assert(recording_handoff_finish(&owner,&pipeline,&queue,&ops)==ACT_NONE);
 assert(owner.state==OWN_STOPPED&&!owner_host_can_access(&owner));
 assert(samples==1161&&pipeline.committed_samples==1161);
 assert(stop_calls==1&&sink_calls==1&&identity_calls==1&&unmount_calls==1);
 assert(recording_handoff_finish(&owner,&pipeline,&queue,&ops)==ACT_NONE);
 assert(stop_calls==1&&sink_calls==1);
 for(fail_at=1;fail_at<=4;fail_at++) {
  reset();assert(recording_handoff_finish(&owner,&pipeline,&queue,&ops)==ACT_REPORT_FAULT);
  assert(owner.state==OWN_FAULT&&!owner_host_can_access(&owner));
  assert(sink_calls==(fail_at!=1));assert(identity_calls==(fail_at>=3));assert(unmount_calls==(fail_at==4));
 }
 return 0;
}

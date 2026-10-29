#include "recording_handoff.h"
#if !defined(PENDANT_FIRMWARE_VERSION) || !defined(PENDANT_SOURCE_REVISION)
#if defined(PENDANT_LINK_FIXTURE)
#define PENDANT_FIRMWARE_VERSION "LINK-FIXTURE"
#define PENDANT_SOURCE_REVISION "UNQUALIFIED"
#else
#error Explicit firmware version and source revision required
#endif
#endif
#if !defined(PENDANT_HARDWARE_REVISION)
#if defined(PENDANT_LINK_FIXTURE)
#define PENDANT_HARDWARE_REVISION "XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH"
#else
#error Explicit canonical hardware revision required
#endif
#endif
static const uint8_t identity[] =
 "{\"product\":\"pendant-recorder\",\"schema_version\":2,"
 "\"hardware_revision\":\"" PENDANT_HARDWARE_REVISION "\","
 "\"firmware_version\":\"" PENDANT_FIRMWARE_VERSION "\","
 "\"source_revision\":\"" PENDANT_SOURCE_REVISION "\","
 "\"audio_profile\":\"ima16k-mono-1024-age-v1\"}\n";
unsigned recording_handoff_finish(storage_owner *o,recording_pipeline *p,
                                  audio_queue *q,const recording_handoff_ops *ops){
 if(!o || !owner_device_can_finalize(o))return ACT_NONE;
 if(!p || !q || !ops || !ops->stop_and_drain || !ops->encrypted_sink ||
    !ops->write_identity || !ops->sync_and_unmount)return owner_step(o,IO_FAILED);
 if(!ops->stop_and_drain(ops->ctx))return owner_step(o,IO_FAILED);
 if(!owner_device_can_finalize(o))return ACT_REPORT_FAULT;
 if(!recording_pipeline_finish(p,q,ops->encrypted_sink,ops->ctx))
  return owner_step(o,IO_FAILED);
 if(!owner_device_can_finalize(o))return ACT_REPORT_FAULT;
 if(!ops->write_identity(ops->ctx,"PENDANT.JSON",identity,sizeof(identity)-1))
  return owner_step(o,IO_FAILED);
 if(!owner_device_can_finalize(o))return ACT_REPORT_FAULT;
 if(!ops->sync_and_unmount(ops->ctx))return owner_step(o,IO_FAILED);
 if(!owner_device_can_finalize(o))return ACT_REPORT_FAULT;
 return owner_step(o,DEVICE_RELEASED);
}

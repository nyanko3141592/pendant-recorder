#include "recording_capture.h"
bool recording_capture_start(recording_session *s,recording_pipeline *p,audio_queue *q,
                             MDF_HandleTypeDef *audio,const MDF_FilterConfigTypeDef *filter){
 if(!audio||!filter||__get_IPSR()||__get_PRIMASK()||
    audio->State!=HAL_MDF_STATE_READY||!pendant_audio_dma_owns(audio)||
    !recording_session_can_start(s,p,q))return false;
 int16_t *buffer=pendant_audio_bind_queue(audio,q);
 if(!buffer)return false;
 s->stop_and_drain=pendant_audio_stop_and_drain;s->capture_ctx=audio;
 if(pendant_audio_dma_start(audio,filter,buffer,2*AUDIO_BLOCK_SAMPLES)==HAL_OK)return true;
 pendant_audio_fault_stop(audio);
 audio_queue_fail(q);
 (void)owner_step(s->store->owner,IO_FAILED);return false;
}

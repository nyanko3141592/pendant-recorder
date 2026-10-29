#include "../board/recording_capture.h"
#include <assert.h>
static MDF_HandleTypeDef device;
static MDF_FilterConfigTypeDef filter;
static audio_queue q;
static recording_pipeline pipeline;
static storage_owner owner;
static recording_store store;
static recording_session session;
static bool ready,fail_start;
static unsigned starts,ipsr,mask,fault_stops;
void pendant_audio_fault_stop(MDF_HandleTypeDef *h){assert(h==&device);fault_stops++;}
unsigned __get_IPSR(void){return ipsr;}
unsigned __get_PRIMASK(void){return mask;}
bool pendant_audio_dma_owns(MDF_HandleTypeDef *h){return h==&device;}
/* Preconditions are exercised separately against actual FatFs/store in the
 * end-to-end test; this fixture controls their result to inject failures. */
bool recording_session_can_start(recording_session *s,recording_pipeline *p,audio_queue *queue){
 assert(s==&session&&p==&pipeline&&queue==&q);return ready;
}
bool pendant_audio_stop_and_drain(void *ctx){return ctx==&device;}
HAL_StatusTypeDef pendant_audio_dma_start(MDF_HandleTypeDef *h,const MDF_FilterConfigTypeDef *f,int16_t *buffer,uint32_t samples){
 assert(h==&device&&f==&filter&&pendant_audio_claim_buffer(h,buffer,samples));starts++;
 if(fail_start)return HAL_ERROR;
 device.State=HAL_MDF_STATE_ACQUISITION;return HAL_OK;
}
static void setup(void){
 device.State=HAL_MDF_STATE_READY;owner_init(&owner,true);audio_queue_init(&q);
 store=(recording_store){.owner=&owner};session=(recording_session){.store=&store};
 ready=true;fail_start=false;starts=ipsr=mask=fault_stops=0;pipeline.committed_samples=123456;
}
int main(void){
 setup();assert(recording_capture_start(&session,&pipeline,&q,&device,&filter));
 assert(starts==1&&session.capture_ctx==&device&&session.stop_and_drain==pendant_audio_stop_and_drain);
 assert(pipeline.committed_samples==123456&&owner.state==OWN_DEVICE);
 assert(!recording_capture_start(&session,&pipeline,&q,&device,&filter)&&starts==1);
 /* Failed hardware start is sticky at owner and queue, never reported running. */
 setup();fail_start=true;assert(!recording_capture_start(&session,&pipeline,&q,&device,&filter));
 assert(starts==1&&fault_stops==1&&owner.state==OWN_FAULT&&audio_queue_failed(&q));
 /* A rejected precondition must not erase pending audio by rebinding. */
 setup();ready=false;int16_t block[AUDIO_BLOCK_SAMPLES]={0};assert(audio_queue_push(&q,block));
 assert(!recording_capture_start(&session,&pipeline,&q,&device,&filter));
 assert(!starts&&atomic_load(&q.produced)==1&&atomic_load(&q.consumed)==0);
 setup();ipsr=1;assert(!recording_capture_start(&session,&pipeline,&q,&device,&filter)&&!starts);
 setup();mask=1;assert(!recording_capture_start(&session,&pipeline,&q,&device,&filter)&&!starts);
 setup();MDF_HandleTypeDef other={.State=HAL_MDF_STATE_READY};
 assert(!recording_capture_start(&session,&pipeline,&q,&other,&filter)&&!starts);
 return 0;
}

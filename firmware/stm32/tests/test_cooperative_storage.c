/* Real board storage adapter + real cooperative pipeline; protocol/HAL simulated.
 * Three successful 400ms exchanges model cumulative storage stalls. */
#include "../board/storage_probe.h"
#include "../board/storage_spi.h"
#include "../core/recording_pipeline.h"
#include <assert.h>
#include <string.h>
#include <stdio.h>
static recording_pipeline pipeline;
static audio_queue queue;
static board_storage disk;
static int16_t pcm[AUDIO_BLOCK_SAMPLES];
static uint32_t ticks,next_dma=1;
static uint64_t produced,stored;
static unsigned stalls,pumps;
static bool failing;
static void capture(void){assert(audio_queue_push(&queue,pcm));produced+=AUDIO_BLOCK_SAMPLES;}
static bool progress(void *ctx){assert(ctx==&pipeline);pumps++;return !failing&&cooperative_pipeline_pump(&pipeline,&queue);}
uint32_t HAL_GetTick(void){return ticks;}
HAL_StatusTypeDef storage_spi_init_low_speed(void){return HAL_OK;}
HAL_StatusTypeDef storage_spi_set_transfer_speed(void){return HAL_OK;}
void storage_spi_select(bool selected){(void)selected;}
HAL_StatusTypeDef storage_spi_exchange(uint8_t *tx,uint8_t *rx,uint16_t n,uint32_t timeout){
 assert(timeout==20);memcpy(rx,tx,n);
 /* Advance simulated external waiting at the mocked transaction boundary.
  * Not a claim that the real20ms HAL timeout permits a400ms SPI exchange. */
 if(stalls){stalls--;uint32_t end=ticks+400;
  while(next_dma<=end){capture();next_dma+=64;}ticks=end;
 }
 return HAL_OK;
}
bool sd_initialize_card(const sd_transport *io,sd_card_info *info){(void)io;*info=(sd_card_info){4096,true};return true;}
bool sd_read_sector(const sd_transport *io,bool addressed,uint64_t capacity,uint64_t lba,uint8_t out[512]){
 (void)io;(void)addressed;(void)capacity;(void)lba;(void)out;return false;
}
bool sd_write_sector(const sd_transport *io,bool addressed,uint64_t capacity,uint64_t lba,const uint8_t data[512]){
 assert(addressed&&capacity==4096&&lba==1&&data);
 uint8_t tx=255,rx;
 for(unsigned i=0;i<4;i++)if(!io->exchange(io->ctx,&tx,&rx,1))return false;
 return true;
}
static bool sink(void *ctx,const uint8_t *data,size_t size,uint32_t samples){
 (void)ctx;assert(size>=512);
 if(!board_storage_write(&disk,1,data))return false;
 stored+=samples;return true;
}
int main(void){
 storage_owner owner;owner_init(&owner,true);audio_queue_init(&queue);recording_pipeline_init(&pipeline);
 assert(board_storage_open(&disk,&owner));board_storage_set_progress(&disk,progress,&pipeline);
 for(unsigned i=0;i<156;i++){capture();assert(recording_pipeline_service(&pipeline,&queue,sink,0));}
 stalls=3;capture();assert(recording_pipeline_service(&pipeline,&queue,sink,0));
 assert(ticks==1200&&pumps>=4&&!audio_queue_failed(&queue));
 assert(recording_pipeline_finish(&pipeline,&queue,sink,0));
 assert(stored==produced&&pipeline.committed_samples==produced);
 /* A failed capture pump aborts both the storage transaction and pipeline. */
 capture();assert(recording_pipeline_service(&pipeline,&queue,sink,0));failing=true;
 assert(!recording_pipeline_finish(&pipeline,&queue,sink,0));
 assert(pipeline.failed&&!disk.ready&&owner.fault_pending);
 puts("PASS real SD adapter/pipeline progress integration; simulated cumulative1200ms stall and pump failure");
}

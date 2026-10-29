#include "storage_probe.h"
#include "storage_spi.h"
#include "../core/sd_init.h"
#include <string.h>
static bool allowed(storage_owner *o){return owner_device_can_access(o)||owner_device_can_finalize(o)||owner_device_can_recover(o);}
typedef struct { storage_owner *owner; bool host; board_storage *disk; } storage_access;
static bool nonrecursive(board_storage *d){
 if(d&&d->progress_active){d->progress_failed=true;return false;}
 return d!=NULL;
}
void board_storage_set_progress(board_storage *d,bool (*pump)(void *),void *ctx){
 if(!nonrecursive(d))return;
 d->progress=pump;d->progress_ctx=ctx;d->progress_failed=false;
}
static bool progress(storage_access *a){
 board_storage *d=a->disk;
 if(a->host||a->owner->state!=OWN_DEVICE||!d->progress)return true;
 d->progress_active=true;
 bool ok=d->progress(d->progress_ctx);
 d->progress_active=false;
 return ok&&!d->progress_failed&&a->owner->state==OWN_DEVICE;
}
static bool access_allowed(const storage_access *a){return a&&a->owner&&(!a->disk->io_power_good||a->disk->io_power_good())&&(a->host?owner_host_can_access(a->owner):allowed(a->owner));}
static bool exchange(void *ctx,const uint8_t *tx,uint8_t *rx,size_t n){
 storage_access *a=ctx;
 /* Commands/polls stay small; payload transfers use bounded32byte chunks.
  * Copy avoids casting away const for HAL's mutable transmit buffer API. */
 uint8_t buffer[SD_TRANSFER_CHUNK];
 if(!access_allowed(a)||!tx||!rx||!n||n>sizeof(buffer))return false;
 if(!progress(a)||!access_allowed(a))return false;
 memcpy(buffer,tx,n);
 return storage_spi_exchange(buffer,rx,(uint16_t)n,20)==HAL_OK && access_allowed(a);
}
static void select_card(void *ctx,bool selected){
 if(!selected||access_allowed(ctx))storage_spi_select(selected);
}
static uint32_t milliseconds(void *ctx){(void)ctx;return HAL_GetTick();}
bool board_storage_open(board_storage *d,storage_owner *owner){
 if(!nonrecursive(d)||!owner||!(owner_device_can_access(owner)||owner_device_can_recover(owner)))return false;
 d->ready=false;d->owner=owner;d->progress=NULL;d->progress_ctx=NULL;d->progress_active=false;d->progress_failed=false;
 storage_access access={owner,false,d};
 sd_transport io={exchange,select_card,milliseconds,&access};sd_card_info info;
 if(!access_allowed(&access)||storage_spi_init_low_speed()!=HAL_OK || !sd_initialize_card(&io,&info) || !access_allowed(&access)||storage_spi_set_transfer_speed()!=HAL_OK){
  owner_step(owner,IO_FAILED);return false;
 }
 d->info=info;d->ready=true;return true;
}
static bool finish(board_storage *d,bool ok){
 if(!ok){d->ready=false;owner_step(d->owner,IO_FAILED);}return ok;
}
bool board_storage_read(board_storage *d,uint64_t lba,uint8_t out[512]){
 if(!nonrecursive(d)||!d->ready||!d->owner||!allowed(d->owner)||!out)return false;
 storage_access access={d->owner,false,d};
 sd_transport io={exchange,select_card,milliseconds,&access};
 return finish(d,sd_read_sector(&io,d->info.block_addressed,d->info.capacity_bytes,lba,out));
}
bool board_storage_write(board_storage *d,uint64_t lba,const uint8_t data[512]){
 if(!nonrecursive(d)||!d->ready||!d->owner||!allowed(d->owner)||!data)return false;
 storage_access access={d->owner,false,d};
 sd_transport io={exchange,select_card,milliseconds,&access};
 return finish(d,sd_write_sector(&io,d->info.block_addressed,d->info.capacity_bytes,lba,data));
}

bool board_storage_host_read(board_storage *d,uint64_t lba,uint8_t out[512]){
 if(!nonrecursive(d)||!d->ready||!d->owner||!owner_host_can_access(d->owner)||!out)return false;
 storage_access access={d->owner,true,d};
 sd_transport io={exchange,select_card,milliseconds,&access};
 return finish(d,sd_read_sector(&io,d->info.block_addressed,d->info.capacity_bytes,lba,out));
}
bool board_storage_host_write(board_storage *d,uint64_t lba,const uint8_t data[512]){
 if(!nonrecursive(d)||!d->ready||!d->owner||!owner_host_can_access(d->owner)||!data)return false;
 storage_access access={d->owner,true,d};
 sd_transport io={exchange,select_card,milliseconds,&access};
 return finish(d,sd_write_sector(&io,d->info.block_addressed,d->info.capacity_bytes,lba,data));
}

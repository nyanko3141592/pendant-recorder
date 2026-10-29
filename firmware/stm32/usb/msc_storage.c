#include "msc_storage.h"
#include "tusb.h"
#include <string.h>
#include <limits.h>
static board_storage *disk;
static unsigned actions;
void msc_storage_bind(board_storage *device){disk=device;actions=0;}
unsigned msc_storage_take_actions(void){unsigned a=actions;actions=0;return a;}
static bool ready(uint8_t lun){
 if(lun||!disk||!disk->owner||!disk->ready||!owner_host_can_access(disk->owner)){
  tud_msc_set_sense(lun,SCSI_SENSE_NOT_READY,0x3a,0);return false;
 }
 return true;
}
bool tud_msc_test_unit_ready_cb(uint8_t lun){return ready(lun);}
bool tud_msc_is_writable_cb(uint8_t lun){(void)lun;return false;}
void tud_msc_inquiry_cb(uint8_t lun,uint8_t vendor[8],uint8_t product[16],uint8_t revision[4]){
 (void)lun;memcpy(vendor,"PENDANT ",8);memcpy(product,"Audio Recorder  ",16);memcpy(revision,"0012",4);
}
void tud_msc_capacity_cb(uint8_t lun,uint32_t *count,uint16_t *size){
 *count=0;*size=512;if(!ready(lun))return;
 uint64_t n=disk->info.capacity_bytes/512;
 if(!n||n>UINT32_MAX){tud_msc_set_sense(lun,SCSI_SENSE_NOT_READY,0x30,0);return;}*count=(uint32_t)n;
}
static bool request(uint8_t lun,uint32_t lba,uint32_t offset,const void *buffer,uint32_t size){
 if(!ready(lun))return false;
 if(!buffer||offset||size!=512){tud_msc_set_sense(lun,SCSI_SENSE_ILLEGAL_REQUEST,0x24,0);return false;}
 if(lba>=disk->info.capacity_bytes/512){tud_msc_set_sense(lun,SCSI_SENSE_ILLEGAL_REQUEST,0x21,0);return false;}
 return true;
}
static int32_t result(uint8_t lun,bool ok,bool write){
 if(ok)return 512;
 /* Backend normally transitions owner itself. Cover any failed backend. */
 disk->ready=false;
 if(owner_host_can_access(disk->owner))owner_step(disk->owner,IO_FAILED);
 actions|=ACT_REVOKE_MSC|ACT_REPORT_FAULT;
 tud_msc_set_sense(lun,SCSI_SENSE_MEDIUM_ERROR,write?0x0c:0x11,0);return -1;
}
int32_t tud_msc_read10_cb(uint8_t lun,uint32_t lba,uint32_t offset,void *buffer,uint32_t size){
 if(!request(lun,lba,offset,buffer,size))return -1;
 return result(lun,board_storage_host_read(disk,lba,buffer),false);
}
int32_t tud_msc_write10_cb(uint8_t lun,uint32_t lba,uint32_t offset,uint8_t *buffer,uint32_t size){
 (void)lba;(void)offset;(void)buffer;(void)size;
 if(!ready(lun))return -1;
 /* The recording LUN is export-only. Host metadata writes, formatting and an
  * accidental overwrite must not mutate the only encrypted copy. Public-key
  * provisioning requires a separate authenticated/control path. */
 tud_msc_set_sense(lun,SCSI_SENSE_DATA_PROTECT,0x27,0);return -1;
}
bool tud_msc_start_stop_cb(uint8_t lun,uint8_t power,bool start,bool eject){
 (void)power;if(!ready(lun))return false;
 if(eject&&!start)actions|=owner_step(disk->owner,HOST_EJECTED);
 return true;
}
int32_t tud_msc_scsi_cb(uint8_t lun,const uint8_t command[16],void *buffer,uint16_t size){
 (void)buffer;(void)size;if(!ready(lun))return -1;
 /* SYNCHRONIZE CACHE(10): no write cache, each sector awaits busy/CMD13.
  * Reject IMMED/reserved flags rather than promise asynchronous durability. */
 if(command[0]==0x35&&command[1]==0)return 0;
 tud_msc_set_sense(lun,SCSI_SENSE_ILLEGAL_REQUEST,0x20,0);return -1;
}

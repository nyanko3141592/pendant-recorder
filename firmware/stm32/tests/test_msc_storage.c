#include "../usb/msc_storage.h"
#include "tusb.h"
#include <assert.h>
#include <string.h>
static bool fail;
static unsigned calls;
static uint8_t sense,asc;
bool tud_msc_set_sense(uint8_t lun,uint8_t key,uint8_t code,uint8_t q){(void)lun;(void)q;sense=key;asc=code;return true;}
bool board_storage_host_read(board_storage *d,uint64_t lba,uint8_t out[512]){assert(owner_host_can_access(d->owner)&&lba<8);calls++;memset(out,0x55,512);return !fail;}
int main(void){
 storage_owner owner;owner_init(&owner,true);board_storage disk={.owner=&owner,.ready=true,.info={4096,true}};uint8_t data[512],cmd[16]={0x35};uint32_t count;uint16_t size;
 msc_storage_bind(&disk);assert(!tud_msc_test_unit_ready_cb(0)&&sense==SCSI_SENSE_NOT_READY);
 assert(tud_msc_read10_cb(0,0,0,data,512)==-1&&!calls);
 owner_step(&owner,USB_CONFIGURED);owner_step(&owner,DEVICE_RELEASED);
 tud_msc_capacity_cb(0,&count,&size);assert(count==8&&size==512);
 assert(!tud_msc_is_writable_cb(0));
 assert(tud_msc_read10_cb(0,7,0,data,512)==512&&data[0]==0x55);
 assert(tud_msc_write10_cb(0,7,0,data,512)==-1&&sense==SCSI_SENSE_DATA_PROTECT&&asc==0x27);
 assert(tud_msc_read10_cb(0,8,0,data,512)==-1&&asc==0x21);
 assert(tud_msc_read10_cb(0,0,1,data,511)==-1&&asc==0x24);
 assert(tud_msc_read10_cb(1,0,0,data,512)==-1&&calls==1);
 assert(tud_msc_scsi_cb(0,cmd,0,0)==0);cmd[0]=0xff;assert(tud_msc_scsi_cb(0,cmd,0,0)==-1);
 assert(tud_msc_start_stop_cb(0,0,false,true));assert(msc_storage_take_actions()==ACT_REVOKE_MSC);assert(msc_storage_take_actions()==0);
 assert(tud_msc_write10_cb(0,0,0,data,512)==-1&&calls==1);
 owner_init(&owner,true);owner_step(&owner,USB_CONFIGURED);owner_step(&owner,DEVICE_RELEASED);fail=true;
 assert(tud_msc_read10_cb(0,0,0,data,512)==-1&&!disk.ready&&owner.fault_pending&&sense==SCSI_SENSE_MEDIUM_ERROR);
 assert(msc_storage_take_actions()==(ACT_REVOKE_MSC|ACT_REPORT_FAULT));assert(msc_storage_take_actions()==0);
 return 0;
}

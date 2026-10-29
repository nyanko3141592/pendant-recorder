#include "../board/storage_diskio.h"
#include "ff.h"
#include "diskio.h"
#include <assert.h>
#include <string.h>
static unsigned calls,fail_at;
bool board_storage_read(board_storage *d,uint64_t lba,uint8_t out[512]){
 assert(lba<8);if(++calls==fail_at){d->ready=false;return false;}memset(out,(int)lba,512);return true;
}
bool board_storage_write(board_storage *d,uint64_t lba,const uint8_t data[512]){
 assert(lba<8&&data);if(++calls==fail_at){d->ready=false;return false;}return true;
}
int main(void){
 storage_owner owner;owner_init(&owner,true);board_storage d={.owner=&owner,.info={4096,false},.ready=true};uint8_t buf[1024];
 storage_diskio_bind(&d);assert(disk_initialize(0)==0);assert(disk_read(0,buf,2,2)==RES_OK&&calls==2&&buf[0]==2&&buf[512]==3);
 calls=0;assert(disk_write(0,buf,7,2)==RES_PARERR&&!calls);assert(disk_read(0,buf,0,0)==RES_PARERR);
 LBA_t count=0;assert(disk_ioctl(0,GET_SECTOR_COUNT,&count)==RES_OK&&count==8);
 assert(disk_ioctl(0,CTRL_SYNC,0)==RES_OK);assert(disk_ioctl(0,CTRL_TRIM,buf)==RES_PARERR);
 owner_step(&owner,USB_CONFIGURED);assert(disk_status(0)==0);owner_step(&owner,DEVICE_RELEASED);
 assert(disk_read(0,buf,0,1)==RES_NOTRDY&&disk_ioctl(0,CTRL_SYNC,0)==RES_NOTRDY&&!calls);
 owner_step(&owner,USB_DISCONNECTED);assert(disk_status(0)==STA_NOINIT);
 owner_step(&owner,HOST_RELEASED);assert(disk_status(0)==0);
 fail_at=2;assert(disk_write(0,buf,0,2)==RES_ERROR&&calls==2);assert(disk_ioctl(0,CTRL_SYNC,0)==RES_NOTRDY);
 storage_diskio_bind(0);assert(disk_initialize(0)==STA_NOINIT);return 0;
}

#include "storage_diskio.h"
#include "ff.h"
#include "diskio.h"
#include <limits.h>
static board_storage *device;
void storage_diskio_bind(board_storage *d){device=d;}
static bool available(void){
 return device&&device->ready&&device->owner&&
 (owner_device_can_access(device->owner)||owner_device_can_finalize(device->owner)||owner_device_can_recover(device->owner));
}
DSTATUS disk_status(BYTE drive){return drive||!available()?STA_NOINIT:0;}
/* Power sequencing and probing are explicit startup/recovery operations. */
DSTATUS disk_initialize(BYTE drive){return disk_status(drive);}
static bool valid_range(LBA_t sector,UINT count){
 uint64_t total=device->info.capacity_bytes/512;
 return count && (uint64_t)sector<total && (uint64_t)count<=total-sector && (uint64_t)count*512<=SIZE_MAX;
}
DRESULT disk_read(BYTE drive,BYTE *buffer,LBA_t sector,UINT count){
 if(drive||!buffer)return RES_PARERR;if(!available())return RES_NOTRDY;
 if(!valid_range(sector,count))return RES_PARERR;
 for(UINT i=0;i<count;i++)if(!board_storage_read(device,(uint64_t)sector+i,buffer+(size_t)i*512))return RES_ERROR;
 return RES_OK;
}
DRESULT disk_write(BYTE drive,const BYTE *buffer,LBA_t sector,UINT count){
 if(drive||!buffer)return RES_PARERR;if(!available())return RES_NOTRDY;
 if(!valid_range(sector,count))return RES_PARERR;
 for(UINT i=0;i<count;i++)if(!board_storage_write(device,(uint64_t)sector+i,buffer+(size_t)i*512))return RES_ERROR;
 return RES_OK;
}
DRESULT disk_ioctl(BYTE drive,BYTE cmd,void *buffer){
 if(drive)return RES_PARERR;if(!available())return RES_NOTRDY;
 switch(cmd){
 case CTRL_SYNC:
  /* Every write synchronously waits for card busy to clear and CMD13 success.
   * No adapter cache; errors invalidate device. Does not prove powerfail safety. */
  return RES_OK;
 case GET_SECTOR_COUNT:
  if(!buffer||device->info.capacity_bytes/512>UINT32_MAX)return RES_PARERR;
  *(LBA_t *)buffer=(LBA_t)(device->info.capacity_bytes/512);return RES_OK;
 case GET_SECTOR_SIZE:
  if(!buffer)return RES_PARERR;*(WORD *)buffer=512;return RES_OK;
 default:return RES_PARERR; /* no format, trim, power or speculative erase geometry */
 }
}

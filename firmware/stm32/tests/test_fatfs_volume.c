/* Synthetic RAM FAT16/FAT32 image only. Never opens a host disk or device. */
#include "../board/storage_diskio.h"
#include "ff.h"
#include "../board/storage_handoff.h"
#include "../board/storage_mount.h"
#include "diskio.h"
#include "../crypto/fatfs_recording.h"
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#ifndef TEST_FAT32
#define TEST_FAT32 0
#endif
#define TEST_SECTORS (TEST_FAT32 ? 131072u : 8192u)
static uint8_t *image;
static void put16(unsigned at,unsigned v){image[at]=v;image[at+1]=v>>8;}
static void put32(unsigned at,uint32_t v){put16(at,v);put16(at+2,v>>16);}
static void create_fixture(void){
 image=calloc(TEST_SECTORS,512);assert(image);
 if(TEST_FAT32){
  /* 64MiB superfloppy, 32 reserved sectors, two 1024-sector FATs,
   * one sector/cluster, root cluster2. FSInfo disabled (0xffff). */
  image[0]=0xeb;image[1]=0x58;image[2]=0x90;memcpy(image+3,"MSDOS5.0",8);
  put16(11,512);image[13]=1;put16(14,32);image[16]=2;image[21]=0xf8;
  put32(32,TEST_SECTORS);put32(36,1024);put32(44,2);put16(48,0xffff);put16(50,6);
  image[66]=0x29;memcpy(image+71,"PENDANTTEST",11);memcpy(image+82,"FAT32   ",8);put16(510,0xaa55);
  memcpy(image+6*512,image,512);
  for(unsigned fat=0;fat<2;fat++){unsigned at=(32+fat*1024)*512;put32(at,0x0ffffff8);put32(at+4,0x0fffffff);put32(at+8,0x0fffffff);}
  return;
 }
 image[0]=0xeb;image[1]=0x3c;image[2]=0x90;memcpy(image+3,"MSDOS5.0",8);
 put16(11,512);image[13]=1;put16(14,1);image[16]=2;put16(17,512);put16(19,8192);
 image[21]=0xf8;put16(22,32);put16(24,32);put16(26,64);image[38]=0x29;
 memcpy(image+43,"PENDANTTEST",11);memcpy(image+54,"FAT16   ",8);put16(510,0xaa55);
 for(unsigned fat=0;fat<2;fat++){unsigned at=(1+fat*32)*512;put16(at,0xfff8);put16(at+2,0xffff);}
}
bool board_storage_read(board_storage *d,uint64_t lba,uint8_t out[512]){
 (void)d;if(lba>=TEST_SECTORS)return false;memcpy(out,image+lba*512,512);return true;
}
bool board_storage_write(board_storage *d,uint64_t lba,const uint8_t in[512]){
 (void)d;if(lba>=TEST_SECTORS)return false;memcpy(image+lba*512,in,512);return true;
}
int main(void){
 create_fixture();storage_owner owner;owner_init(&owner,true);
 board_storage disk={.owner=&owner,.info={TEST_SECTORS*512,false},.ready=true};storage_diskio_bind(&disk);
 FATFS fs;FIL file;UINT amount;char got[256];
 const char marker[]="{\"product\":\"pendant-recorder\",\"schema_version\":2,\"hardware_revision\":\"XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH\",\"firmware_version\":\"LINK-FIXTURE\",\"source_revision\":\"UNQUALIFIED\",\"audio_profile\":\"ima16k-mono-1024-age-v1\"}\n";
 assert(f_mount(&fs,"0:",1)==FR_OK);assert(fs.fs_type==(TEST_FAT32?FS_FAT32:FS_FAT16));
 assert(f_open(&file,"0:/PENDANT.JSON",FA_WRITE|FA_CREATE_NEW)==FR_OK);
 assert(f_write(&file,marker,sizeof(marker)-1,&amount)==FR_OK&&amount==sizeof(marker)-1);
 assert(f_sync(&file)==FR_OK);assert(f_close(&file)==FR_OK);
 uint8_t payload[1600];for(unsigned i=0;i<sizeof(payload);i++)payload[i]=(uint8_t)i;
 assert(f_open(&file,"0:/00000001.TMP",FA_WRITE|FA_CREATE_NEW)==FR_OK);
 assert(f_write(&file,payload,sizeof(payload),&amount)==FR_OK&&amount==sizeof(payload));
 assert(f_close(&file)==FR_OK);assert(f_rename("0:/00000001.TMP","0:/00000001.AGE")==FR_OK);
 assert(f_open(&file,"0:/00000001.AGE",FA_WRITE|FA_CREATE_NEW)==FR_EXIST);
 assert(f_mount(0,"0:",0)==FR_OK);memset(&fs,0,sizeof(fs));assert(f_mount(&fs,"0:",1)==FR_OK);
 assert(f_open(&file,"0:/PENDANT.JSON",FA_READ)==FR_OK);
 assert(f_read(&file,got,sizeof(got),&amount)==FR_OK&&amount==sizeof(marker)-1&&!memcmp(got,marker,amount));assert(f_close(&file)==FR_OK);
 uint8_t readback[1600];assert(f_open(&file,"0:/00000001.AGE",FA_READ)==FR_OK);
 assert(f_read(&file,readback,sizeof(readback),&amount)==FR_OK&&amount==sizeof(payload)&&!memcmp(payload,readback,amount));assert(f_close(&file)==FR_OK);
 fatfs_recording store={0};
 assert(fatfs_recording_recover(&store)&&store.next_id==2&&!store.exhausted);
 assert(fatfs_recording_begin(&store));assert(!fatfs_recording_write(&store,payload,FATFS_RECORDING_MAX_BYTES+1));assert(store.written_bytes==0);assert(fatfs_recording_write(&store,payload,sizeof(payload)));assert(fatfs_recording_commit(&store));
 assert(f_open(&file,"0:/REC/00000002.AGE",FA_READ)==FR_OK);
 assert(f_read(&file,readback,sizeof(readback),&amount)==FR_OK&&amount==sizeof(payload)&&!memcmp(payload,readback,amount));assert(f_close(&file)==FR_OK);
 store.next_id=2;assert(!fatfs_recording_begin(&store));
 store.next_id=3;assert(fatfs_recording_begin(&store));assert(fatfs_recording_write(&store,payload,100));fatfs_recording_abort(&store);
 FILINFO entry;assert(f_stat("0:/REC/00000003.TMP",&entry)==FR_OK&&entry.fsize==100);assert(f_stat("0:/REC/00000003.AGE",&entry)==FR_NO_FILE);
 assert(fatfs_recording_recover(&store)&&store.next_id==4&&!store.exhausted);
 assert(!fatfs_recording_delete_range(&store,4,4));
 assert(fatfs_recording_delete_range(&store,1,2));
 assert(f_stat("0:/REC/00000002.AGE",&entry)==FR_NO_FILE);
 assert(f_stat("0:/REC/00000003.TMP",&entry)==FR_OK&&entry.fsize==100);
 assert(fatfs_recording_delete_range(&store,1,2)); /* idempotent */
 assert(f_mkdir("0:/0000000a.AGE")==FR_OK);
 assert(f_open(&file,"0:/ABC.TMP",FA_WRITE|FA_CREATE_NEW)==FR_OK);assert(f_close(&file)==FR_OK);
 assert(f_open(&file,"0:/FFFFFFFE.txt",FA_WRITE|FA_CREATE_NEW)==FR_OK);assert(f_close(&file)==FR_OK);
 assert(fatfs_recording_recover(&store)&&store.next_id==11&&!store.exhausted);
 assert(fatfs_recording_begin(&store));assert(!fatfs_recording_recover(&store));fatfs_recording_abort(&store);
 assert(f_open(&file,"0:/ffffffff.tmp",FA_WRITE|FA_CREATE_NEW)==FR_OK);assert(f_close(&file)==FR_OK);
 assert(fatfs_recording_recover(&store)&&store.exhausted);assert(!fatfs_recording_begin(&store));
 disk.ready=false;store.exhausted=false;assert(!fatfs_recording_recover(&store)&&store.exhausted);disk.ready=true;
 DWORD clusters;FATFS *mounted;assert(f_getfree("0:",&clusters,&mounted)==FR_OK&&clusters>0);
 storage_handoff handoff={.owner=&owner,.recording=&store,.mounted=true};
 assert(!storage_handoff_identity(&handoff,"PENDANT.JSON",(const uint8_t *)marker,sizeof(marker)-1));
 assert(owner_step(&owner,USB_CONFIGURED)==ACT_STOP_AND_FLUSH);
 assert(!storage_handoff_identity(&handoff,"../BAD.JSON",(const uint8_t *)marker,sizeof(marker)-1));
 store.open=true;assert(!storage_handoff_unmount(&handoff));store.open=false;
 assert(storage_handoff_identity(&handoff,"PENDANT.JSON",(const uint8_t *)marker,sizeof(marker)-1));
 disk.ready=false;assert(!storage_handoff_unmount(&handoff)&&handoff.mounted);disk.ready=true;
 assert(storage_handoff_unmount(&handoff)&&!handoff.mounted);
 assert(disk_status(0)&STA_NOINIT);assert(!storage_handoff_unmount(&handoff));
 /* Explicit rebind/remount to verify persisted marker, still in DRAINING. */
 storage_diskio_bind(&disk);assert(f_mount(&fs,"0:",1)==FR_OK);
 assert(f_open(&file,"0:/PENDANT.JSON",FA_READ)==FR_OK);
 assert(f_read(&file,got,sizeof(got),&amount)==FR_OK&&amount==sizeof(marker)-1&&!memcmp(got,marker,amount));assert(f_close(&file)==FR_OK);
 assert(f_mount(0,"0:",0)==FR_OK);storage_diskio_bind(0);
 /* Exceed FAT16's 512-entry root limit through the production recording API.
  * Small payloads test directory scaling, not 36-hour byte capacity. */
 free(image);create_fixture();owner_init(&owner,true);memset(&store,0,sizeof(store));
 storage_diskio_bind(&disk);assert(f_mount(&fs,"0:",1)==FR_OK);
 assert(fatfs_recording_recover(&store));
 for(unsigned i=0;i<520;i++){
  assert(fatfs_recording_begin(&store));
  assert(fatfs_recording_write(&store,payload,1));
  assert(fatfs_recording_commit(&store));
 }
 assert(f_mount(0,"0:",0)==FR_OK);assert(f_mount(&fs,"0:",1)==FR_OK);
 assert(fatfs_recording_recover(&store)&&store.next_id==520&&!store.exhausted);
 assert(f_stat("0:/REC/00000207.AGE",&entry)==FR_OK&&entry.fsize==1);
 assert(f_mount(0,"0:",0)==FR_OK);storage_diskio_bind(0);
 /* A host-created ordinary file named REC must not be overwritten. */
 free(image);create_fixture();storage_diskio_bind(&disk);assert(f_mount(&fs,"0:",1)==FR_OK);
 assert(f_open(&file,"0:/REC",FA_WRITE|FA_CREATE_NEW)==FR_OK);assert(f_close(&file)==FR_OK);
 memset(&store,0,sizeof(store));assert(!fatfs_recording_begin(&store)&&!store.open&&store.next_id==0&&!store.capacity_exhausted);
 assert(f_stat("0:/REC",&entry)==FR_OK&&!(entry.fattrib&AM_DIR));
 assert(f_mount(0,"0:",0)==FR_OK);storage_diskio_bind(0);
 /* Fresh image for startup/recovery tests, existing fixture retained above. */
 free(image);create_fixture();owner_init(&owner,true);memset(&store,0,sizeof(store));handoff.mounted=false;
 uint64_t free_bytes=123;
 assert(storage_mount_recordings(&disk,&fs,&store,&handoff,&free_bytes));
 assert(handoff.mounted&&free_bytes>0&&free_bytes<(uint64_t)TEST_SECTORS*512&&store.next_id==0);
 assert(!storage_mount_recordings(&disk,&fs,&store,&handoff,&free_bytes));
 /* Allocate real FAT clusters until less than the bounded chunk remains. */
 assert(f_open(&file,"0:/FILL.BIN",FA_WRITE|FA_CREATE_NEW)==FR_OK);
 assert(f_lseek(&file,(FSIZE_t)(free_bytes-65536))==FR_OK);assert(f_close(&file)==FR_OK);
 assert(f_getfree("0:",&clusters,&mounted)==FR_OK);
 assert((uint64_t)clusters*fs.csize*512<FATFS_RECORDING_MAX_BYTES);
 uint32_t before_id=store.next_id;assert(!fatfs_recording_begin(&store)&&store.next_id==before_id&&!store.open&&store.capacity_exhausted);
 fatfs_recording_abort(&store);assert(store.capacity_exhausted);
 assert(f_stat("0:/REC/00000000.TMP",&entry)==FR_NO_PATH);
 owner_step(&owner,USB_CONFIGURED);assert(storage_handoff_unmount(&handoff));owner_step(&owner,DEVICE_RELEASED);
 assert(!storage_mount_recordings(&disk,&fs,&store,&handoff,&free_bytes));
 owner_step(&owner,USB_DISCONNECTED);assert(!storage_mount_recordings(&disk,&fs,&store,&handoff,&free_bytes));
 owner_step(&owner,HOST_RELEASED);assert(storage_mount_recordings(&disk,&fs,&store,&handoff,&free_bytes));
 assert(owner.state==OWN_RECOVERING);assert(owner_step(&owner,RECOVERY_OK)==ACT_RESUME_RECORDING);
 owner_step(&owner,USB_CONFIGURED);assert(storage_handoff_unmount(&handoff));owner_init(&owner,true);
 put16(11,0);free_bytes=123;
 assert(!storage_mount_recordings(&disk,&fs,&store,&handoff,&free_bytes));
 assert(!handoff.mounted&&owner.state==OWN_FAULT&&store.exhausted&&free_bytes==123&&(disk_status(0)&STA_NOINIT));
 assert(image[11]==0&&image[12]==0); /* no automatic formatting/repair */
 free(image);return 0;
}

/* 30-hour directory/capacity test on a synthetic 964,000,000-byte FAT32 volume.
 * The canonical build writes a conservative 82,180-byte ciphertext fixture for
 * all 10,800 ten-second chunks, not real audio. 4KiB clusters bound allocation
 * overhead. Never opens a host disk/device; ~964MB host RAM required. */
#include "../board/storage_diskio.h"
#include "ff.h"
#include "../board/storage_handoff.h"
#include "../board/storage_mount.h"
#include "diskio.h"
#include "../crypto/fatfs_recording.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef TEST_FAT32
#define TEST_FAT32 0
#endif
#ifndef TEST_FILES
#define TEST_FILES 10800U
#endif
#define TEST_PAYLOAD_BYTES 82180U
#ifndef TEST_SECTORS
#define TEST_SECTORS 1882812u
#endif
#ifndef TEST_FAT_SECTORS
#define TEST_FAT_SECTORS 1900U
#endif
_Static_assert((TEST_SECTORS-32U-2U*TEST_FAT_SECTORS)/8U+2U <= TEST_FAT_SECTORS*128U, "fixture FAT too small");
static uint8_t *image;
static void put16(unsigned at,unsigned v){image[at]=v;image[at+1]=v>>8;}
static void put32(unsigned at,uint32_t v){put16(at,v);put16(at+2,v>>16);}
static void create_fixture(void){
 image=calloc(TEST_SECTORS,512);assert(image);
 if(TEST_FAT32){
  /* 964MB superfloppy, 32 reserved sectors, two 1900-sector FATs,
   * 8 sectors/cluster (4KiB), root cluster2. FSInfo disabled. */
  image[0]=0xeb;image[1]=0x58;image[2]=0x90;memcpy(image+3,"MSDOS5.0",8);
  put16(11,512);image[13]=8;put16(14,32);image[16]=2;image[21]=0xf8;
  put32(32,TEST_SECTORS);put32(36,TEST_FAT_SECTORS);put32(44,2);put16(48,0xffff);put16(50,6);
  image[66]=0x29;memcpy(image+71,"PENDANTTEST",11);memcpy(image+82,"FAT32   ",8);put16(510,0xaa55);
  memcpy(image+6*512,image,512);
  for(unsigned fat=0;fat<2;fat++){unsigned at=(32+fat*TEST_FAT_SECTORS)*512;put32(at,0x0ffffff8);put32(at+4,0x0fffffff);put32(at+8,0x0fffffff);}
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
int main(int argc, char **argv){
 create_fixture();
 if(argc == 2){
  /* Host-only compatibility test: load a complete regular factory image into
   * RAM. All subsequent firmware writes affect RAM, never the input file. */
  FILE *input=fopen(argv[1],"rb");assert(input);
  assert(fread(image,512,TEST_SECTORS,input)==TEST_SECTORS);
  assert(fgetc(input)==EOF);assert(fclose(input)==0);
 } else { assert(argc == 1); }
storage_owner owner;owner_init(&owner,true);
 board_storage disk={.owner=&owner,.info={(uint64_t)TEST_SECTORS*512,false},.ready=true};storage_diskio_bind(&disk);
 FATFS fs;assert(f_mount(&fs,"0:",1)==FR_OK&&fs.fs_type==FS_FAT32);
 fatfs_recording store={0};assert(fatfs_recording_recover(&store));
 uint8_t payload[TEST_PAYLOAD_BYTES];memset(payload,0xa5,sizeof(payload));
 for(unsigned i=0;i<TEST_FILES;i++){
  assert(fatfs_recording_begin(&store));assert(fatfs_recording_write(&store,payload,sizeof(payload)));assert(fatfs_recording_commit(&store));
  if(i%1000==0){fprintf(stderr,"created %u/%u\n",i+1,TEST_FILES);}
 }
 assert(f_mount(0,"0:",0)==FR_OK);assert(f_mount(&fs,"0:",1)==FR_OK);
 assert(fatfs_recording_recover(&store)&&store.next_id==TEST_FILES&&!store.exhausted);
 /* After the required duration, retain a maximum-sized incomplete file and
  * remount. Recovery must reserve its ID without consuming more clusters;
  * another maximum-sized recording must still commit. This is orderly
  * close/remount coverage, not power-loss or flash atomicity coverage. */
 DWORD baseline_clusters, pending_clusters, recovered_clusters;FATFS *volume;
 assert(f_getfree("0:",&baseline_clusters,&volume)==FR_OK);
 uint64_t cluster_bytes=(uint64_t)fs.csize*512;
 uint64_t max_clusters=(FATFS_RECORDING_MAX_BYTES+cluster_bytes-1)/cluster_bytes;
 assert(baseline_clusters>=2*max_clusters+6);
 assert(fatfs_recording_begin(&store));
 uint8_t bounded[4096];memset(bounded,0x5a,sizeof bounded);
 for(unsigned offset=0;offset<FATFS_RECORDING_MAX_BYTES;offset+=sizeof bounded)
  assert(fatfs_recording_write(&store,bounded,sizeof bounded));
 fatfs_recording_abort(&store);
 assert(f_getfree("0:",&pending_clusters,&volume)==FR_OK);
 assert(f_mount(0,"0:",0)==FR_OK);assert(f_mount(&fs,"0:",1)==FR_OK);
 assert(fatfs_recording_recover(&store)&&store.next_id==TEST_FILES+1);
 assert(f_getfree("0:",&recovered_clusters,&volume)==FR_OK);
 assert(recovered_clusters==pending_clusters);
 assert(fatfs_recording_begin(&store));
 for(unsigned offset=0;offset<FATFS_RECORDING_MAX_BYTES;offset+=sizeof bounded)
  assert(fatfs_recording_write(&store,bounded,sizeof bounded));
 assert(fatfs_recording_commit(&store));
 printf("RESERVE baseline_bytes=%llu two_file_budget_bytes=%llu recovery_allocated_bytes=0\n",
  (unsigned long long)baseline_clusters*cluster_bytes,
  (unsigned long long)(2*max_clusters+6)*cluster_bytes);
 for(unsigned i=0;i<TEST_FILES;i++){
  char path[40];snprintf(path,sizeof(path),"0:/REC/%08X.AGE",i);
  FIL f;UINT n;uint8_t got[4096];
  assert(f_open(&f,path,FA_READ)==FR_OK&&f_size(&f)==sizeof(payload));
  unsigned offset=0;
  while(offset<sizeof(payload)){
   unsigned want=sizeof(payload)-offset;if(want>sizeof(got))want=sizeof(got);
   assert(f_read(&f,got,want,&n)==FR_OK&&n==want&&!memcmp(got,payload+offset,n));offset+=n;
  }
  assert(f_close(&f)==FR_OK);
 }
 DWORD clusters;FATFS *mounted;assert(f_getfree("0:",&clusters,&mounted)==FR_OK);
 printf("PASS files=%u bytes_per_file=%u free_bytes=%llu volume_bytes=%llu\n",TEST_FILES,TEST_PAYLOAD_BYTES,(unsigned long long)clusters*fs.csize*512,(unsigned long long)TEST_SECTORS*512);
 assert(f_mount(0,"0:",0)==FR_OK);storage_diskio_bind(0);free(image);return 0;
}

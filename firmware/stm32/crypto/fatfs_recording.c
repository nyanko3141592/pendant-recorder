#include "fatfs_recording.h"
#include "diskio.h"
#include <stdio.h>
#include <limits.h>
#include <string.h>
#include <ctype.h>
/* Only our exact 8-hex-digit namespace; case-insensitive as FAT is. */
static bool recording_id(const char *name,uint32_t *id){
 if(strlen(name)!=12||name[8]!='.')return false;
 char ext[4];for(unsigned i=0;i<3;i++)ext[i]=(char)toupper((unsigned char)name[9+i]);ext[3]=0;
 if(strcmp(ext,"TMP")&&strcmp(ext,"AGE"))return false;
 uint32_t value=0;
 for(unsigned i=0;i<8;i++){
  unsigned c=(unsigned char)toupper((unsigned char)name[i]);
  unsigned digit=c>='0'&&c<='9'?c-'0':c>='A'&&c<='F'?c-'A'+10:16;
  if(digit==16)return false;value=(value<<4)|digit;
 }
 *id=value;return true;
}
bool fatfs_recording_recover(fatfs_recording *s){
 if(!s||s->open)return false;
 /* Failure leaves begin disabled, even if a previous scan succeeded. */
 s->exhausted=true;s->capacity_exhausted=false;
 uint32_t next=0;bool exhausted=false;
 /* Scan legacy root and current REC directory; never move/delete recordings. */
 const char *paths[]={"0:/","0:/REC"};
 for(unsigned location=0;location<2;location++){
  DIR dir;FILINFO entry;FRESULT result=f_opendir(&dir,paths[location]);
  if(location==1&&result==FR_NO_PATH)continue;
  if(result!=FR_OK)return false;
  for(;;){
   result=f_readdir(&dir,&entry);
   if(result!=FR_OK||!entry.fname[0])break;
   uint32_t id;
   if(recording_id(entry.fname,&id)){
    if(id==UINT32_MAX)exhausted=true;else if(id>=next)next=id+1;
   }
  }
  FRESULT closed=f_closedir(&dir);
  if(result!=FR_OK||closed!=FR_OK)return false;
 }
 s->next_id=next;s->exhausted=exhausted;return true;
}
bool fatfs_recording_begin(void *ctx){
 fatfs_recording *s=ctx;if(!s||s->open||s->exhausted)return false;
 s->capacity_exhausted=false;
 DWORD free_clusters;FATFS *fs;
 if(f_getfree("0:",&free_clusters,&fs)!=FR_OK||!fs||!fs->csize)return false;
 uint64_t cluster_bytes=(uint64_t)fs->csize*512u;
 /* Reserve full bounded file plus three clusters for REC/directory/identity growth.
  * Exclusive FS access prevents competing allocation, but not IO failures or
  * FAT16 fixed-root exhaustion. This is a capacity screen, not preallocation. */
 uint64_t needed=(FATFS_RECORDING_MAX_BYTES+cluster_bytes-1)/cluster_bytes+3;
 if(free_clusters<needed){s->capacity_exhausted=true;return false;}
 FILINFO directory;
 FRESULT dir_result=f_stat("0:/REC",&directory);
 if(dir_result==FR_NO_FILE){if(f_mkdir("0:/REC")!=FR_OK)return false;}
 else if(dir_result!=FR_OK||!(directory.fattrib&AM_DIR))return false;
 uint32_t id=s->next_id;if(id==UINT32_MAX)s->exhausted=true;else s->next_id++;
 snprintf(s->pending,sizeof(s->pending),"0:/REC/%08lX.TMP",(unsigned long)id);
 snprintf(s->final,sizeof(s->final),"0:/REC/%08lX.AGE",(unsigned long)id);
 FILINFO info;FRESULT found=f_stat(s->final,&info);
 if(found!=FR_NO_FILE)return false;
 if(f_open(&s->file,s->pending,FA_WRITE|FA_CREATE_NEW)!=FR_OK)return false;
 s->written_bytes=0;s->open=true;return true;
}
bool fatfs_recording_write(void *ctx,const uint8_t *data,size_t size){
 fatfs_recording *s=ctx;if(!s||!s->open||(!data&&size)||size>UINT_MAX)return false;
 if(s->written_bytes>FATFS_RECORDING_MAX_BYTES||size>FATFS_RECORDING_MAX_BYTES-s->written_bytes)return false;
 UINT written=0;FRESULT result=f_write(&s->file,data,(UINT)size,&written);
 s->written_bytes+=written;return result==FR_OK&&written==size;
}
bool fatfs_recording_commit(void *ctx){
 fatfs_recording *s=ctx;if(!s||!s->open)return false;
 if(f_sync(&s->file)!=FR_OK)return false;
 if(f_close(&s->file)!=FR_OK)return false;s->open=false;
 if(f_rename(s->pending,s->final)!=FR_OK)return false;
 return disk_ioctl(0,CTRL_SYNC,0)==RES_OK;
}
void fatfs_recording_abort(void *ctx){
 fatfs_recording *s=ctx;if(s&&s->open){(void)f_close(&s->file);s->open=false;}
 /* Leave incomplete TMP for explicit recovery; never advertise or delete it. */
}
bool fatfs_recording_delete_range(fatfs_recording *s,uint32_t first,uint32_t last){
 if(!s||s->open||first>last||last>=s->next_id)return false;
 for(uint32_t id=first;;id++){
  char path[24];snprintf(path,sizeof path,"0:/REC/%08lX.AGE",(unsigned long)id);
  FILINFO info;FRESULT found=f_stat(path,&info);
  if(found==FR_OK){if(info.fattrib&AM_DIR||f_unlink(path)!=FR_OK)return false;}
  else if(found!=FR_NO_FILE)return false;
  if(id==last)break;
 }
 if(disk_ioctl(0,CTRL_SYNC,0)!=RES_OK)return false;
 s->capacity_exhausted=false;return true;
}

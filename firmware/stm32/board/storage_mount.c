#include "storage_mount.h"
#include "storage_diskio.h"
bool storage_mount_recordings(board_storage *disk,FATFS *fs,fatfs_recording *recording,
                              storage_handoff *handoff,uint64_t *free_bytes){
 if(!disk||!disk->owner||!disk->ready||!fs||!recording||!handoff||!free_bytes||
    recording->open||handoff->mounted)return false;
 if(!owner_device_can_access(disk->owner)&&!owner_device_can_recover(disk->owner))return false;
 recording->exhausted=true;storage_diskio_bind(disk);
 DWORD free_clusters=0;FATFS *mounted=0;
 if(f_mount(fs,"0:",1)!=FR_OK||
    !fatfs_recording_recover(recording)||recording->exhausted||
    f_getfree("0:",&free_clusters,&mounted)!=FR_OK||mounted!=fs||!fs->csize||
    fs->n_fatent<2||free_clusters>fs->n_fatent-2){
  (void)f_mount(0,"0:",0);storage_diskio_bind(0);recording->exhausted=true;
  owner_step(disk->owner,IO_FAILED);return false;
 }
 *free_bytes=(uint64_t)free_clusters*fs->csize*512u;
 *handoff=(storage_handoff){.owner=disk->owner,.recording=recording,.mounted=true};
 return true;
}

#include "storage_handoff.h"
#include "storage_diskio.h"
#include "diskio.h"
#include <string.h>
static bool ready(storage_handoff *s){
 return s&&s->owner&&s->recording&&s->mounted&&!s->recording->open&&
        owner_device_can_finalize(s->owner);
}
bool storage_handoff_identity(void *ctx,const char *name,const uint8_t *data,size_t size){
 storage_handoff *s=ctx;
 if(!ready(s)||!name||strcmp(name,"PENDANT.JSON")||!data||!size||size>4096)return false;
 FIL file;UINT written=0;
 if(f_open(&file,"0:/PENDANT.JSON",FA_WRITE|FA_CREATE_ALWAYS)!=FR_OK)return false;
 bool ok=f_write(&file,data,(UINT)size,&written)==FR_OK&&written==size;
 if(ok)ok=f_sync(&file)==FR_OK;
 /* Close even after an error; caller must fault rather than expose MSC. */
 FRESULT closed=f_close(&file);return ok&&closed==FR_OK;
}
bool storage_handoff_unmount(void *ctx){
 storage_handoff *s=ctx;if(!ready(s))return false;
 if(disk_ioctl(0,CTRL_SYNC,0)!=RES_OK)return false;
 if(f_mount(0,"0:",0)!=FR_OK)return false;
 s->mounted=false;
 /* Disable filesystem auto-mount/IO until explicit recovery binds it again. */
 storage_diskio_bind(0);return true;
}

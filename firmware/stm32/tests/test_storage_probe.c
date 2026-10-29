#include "../board/storage_probe.h"
#include "../board/storage_spi.h"
#include <assert.h>
#include <string.h>
static unsigned transfers,reads,writes;
static bool fail;
static bool supply=true,drop_during_transfer;
static bool power_good(void){return supply;}
uint32_t HAL_GetTick(void){return 0;}
HAL_StatusTypeDef storage_spi_init_low_speed(void){return HAL_OK;}
HAL_StatusTypeDef storage_spi_set_transfer_speed(void){return HAL_OK;}
void storage_spi_select(bool selected){(void)selected;}
HAL_StatusTypeDef storage_spi_exchange(uint8_t *tx,uint8_t *rx,uint16_t n,uint32_t timeout){
 assert(timeout==20);transfers++;if(drop_during_transfer)supply=false;memcpy(rx,tx,n);return fail?HAL_ERROR:HAL_OK;
}
bool sd_initialize_card(const sd_transport *io,sd_card_info *info){(void)io;*info=(sd_card_info){4096,true};return true;}
static bool transfer(const sd_transport *io){uint8_t tx=0xff,rx=0;io->select(io->ctx,true);bool ok=io->exchange(io->ctx,&tx,&rx,1);io->select(io->ctx,false);return ok;}
bool sd_read_sector(const sd_transport *io,bool block,uint64_t capacity,uint64_t lba,uint8_t out[512]){
 assert(block&&capacity==4096&&lba==1);reads++;memset(out,0x42,512);return transfer(io);
}
bool sd_write_sector(const sd_transport *io,bool block,uint64_t capacity,uint64_t lba,const uint8_t data[512]){
 assert(block&&capacity==4096&&lba==1&&data);writes++;return transfer(io);
}
static unsigned pumped;
static bool pump_ok=true,reenter;
static bool pump(void *ctx){
 pumped++;
 if(reenter){uint8_t b[512];assert(!board_storage_read(ctx,1,b));}
 return pump_ok;
}
int main(void){
 storage_owner owner;owner_init(&owner,true);board_storage disk={0};uint8_t buffer[512]={0};
 assert(board_storage_open(&disk,&owner));
 assert(!board_storage_host_read(&disk,1,buffer)&&!board_storage_host_write(&disk,1,buffer)&&!transfers);
 assert(board_storage_read(&disk,1,buffer));
 assert(owner_step(&owner,USB_CONFIGURED)==ACT_STOP_AND_FLUSH);
 assert(!board_storage_host_read(&disk,1,buffer));assert(board_storage_write(&disk,1,buffer));
 assert(owner_step(&owner,DEVICE_RELEASED)==ACT_EXPOSE_MSC);
 unsigned before=transfers;
 assert(!board_storage_read(&disk,1,buffer)&&!board_storage_write(&disk,1,buffer)&&transfers==before);
 assert(board_storage_host_read(&disk,1,buffer)&&board_storage_host_write(&disk,1,buffer));
 assert(owner_step(&owner,USB_DISCONNECTED)==ACT_REVOKE_MSC);
 assert(!board_storage_host_read(&disk,1,buffer)&&!board_storage_read(&disk,1,buffer));
 assert(owner_step(&owner,HOST_RELEASED)==ACT_RECOVER_FS);assert(board_storage_read(&disk,1,buffer));
 assert(owner_step(&owner,RECOVERY_OK)==ACT_RESUME_RECORDING);
 owner_step(&owner,USB_CONFIGURED);owner_step(&owner,DEVICE_RELEASED);fail=true;
 assert(!board_storage_host_write(&disk,1,buffer)&&!disk.ready&&owner.fault_pending&&owner.state==OWN_RECOVERING);
 before=transfers;assert(!board_storage_host_read(&disk,1,buffer)&&transfers==before);
 assert(reads==3&&writes==3);
 /* Hook runs on device IO only, including read paths for FAT metadata. */
 owner_init(&owner,true);fail=false;assert(board_storage_open(&disk,&owner));
 board_storage_set_progress(&disk,pump,&disk);
 assert(board_storage_write(&disk,1,buffer)&&pumped==1);
 owner_step(&owner,USB_CONFIGURED);owner_step(&owner,DEVICE_RELEASED);
 assert(board_storage_host_read(&disk,1,buffer)&&pumped==1);
 /* Even a callback that ignores recursive-read failure must abort outer IO. */
 owner_init(&owner,true);assert(board_storage_open(&disk,&owner));
 board_storage_set_progress(&disk,pump,&disk);reenter=true;before=transfers;
 assert(!board_storage_write(&disk,1,buffer)&&transfers==before&&!disk.ready);
 reenter=false;owner_init(&owner,true);assert(board_storage_open(&disk,&owner));
 board_storage_set_progress(&disk,pump,&disk);pump_ok=false;before=transfers;
 assert(!board_storage_write(&disk,1,buffer)&&transfers==before&&!disk.ready);
 /* Export supply guard remains installed across probe and checks both
  * sides of a blocking SPI transfer. Failed transfer invalidates ownership. */
 owner_init(&owner,false);disk=(board_storage){.io_power_good=power_good};
 supply=false;before=transfers;
 assert(!board_storage_open(&disk,&owner)&&!disk.ready&&transfers==before);
 owner_init(&owner,false);supply=true;
 assert(board_storage_open(&disk,&owner)&&disk.io_power_good==power_good);
 assert(owner_prepare_export(&owner));owner_step(&owner,USB_CONFIGURED);
 supply=false;before=transfers;
 assert(!board_storage_host_read(&disk,1,buffer)&&transfers==before&&!disk.ready);
 owner_init(&owner,false);supply=true;
 assert(board_storage_open(&disk,&owner));assert(owner_prepare_export(&owner));
 owner_step(&owner,USB_CONFIGURED);drop_during_transfer=true;before=transfers;
 assert(!board_storage_host_read(&disk,1,buffer)&&transfers==before+1&&!disk.ready);
 assert(owner.fault_pending&&!owner_host_can_access(&owner));
 before=transfers;assert(!board_storage_host_write(&disk,1,buffer)&&transfers==before);
 return 0;
}

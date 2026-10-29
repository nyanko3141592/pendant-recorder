#include "../crypto/recording_store.h"
#include <assert.h>
static unsigned phase,fail_at,aborted,committed;
static bool begin(void *ctx){(void)ctx;assert(phase==0);phase=1;return fail_at!=1;}
static bool rng(void *ctx,uint8_t *out,size_t n){(void)ctx;assert(phase==1);phase=2;while(n--)*out++=1;return fail_at!=2;}
static bool write_cipher(void *ctx,const uint8_t *data,size_t n){(void)ctx;assert(phase==2&&n==1&&data[0]==42);phase=3;return fail_at!=3;}
static bool commit(void *ctx){(void)ctx;assert(phase==3);committed++;return fail_at!=4;}
static void abort_file(void *ctx){(void)ctx;aborted++;}
/* Transaction ordering test, not cryptographic implementation test. */
bool age_write_recording(const uint8_t key[32],const uint8_t *p,size_t n,age_rng_fn random,age_write_fn write,void *ctx){
 assert(key&&p&&n);uint8_t r;const uint8_t cipher=42;
 return random(ctx,&r,1)&&write(ctx,&cipher,1);
}
int main(void){
 storage_owner owner;uint8_t wav=0;
 for(unsigned draining=0;draining<2;draining++)for(fail_at=0;fail_at<=4;fail_at++){
  owner_init(&owner,true);if(draining)owner_step(&owner,USB_CONFIGURED);
  recording_store s={.owner=&owner,.recipient_provisioned=true,.rng=rng,.begin=begin,.write=write_cipher,.commit=commit,.abort=abort_file};
  phase=aborted=committed=0;
  assert(recording_store_save(&s,&wav,1,1)==(fail_at==0));
  assert(aborted==(fail_at!=0));assert(committed==(fail_at==0||fail_at==4));
  if(fail_at){unsigned before=phase;assert(!recording_store_save(&s,&wav,1,1));assert(phase==before);}
 }
 owner_init(&owner,true);owner_step(&owner,USB_CONFIGURED);owner_step(&owner,DEVICE_RELEASED);
 recording_store s={.owner=&owner,.recipient_provisioned=true,.rng=rng,.begin=begin,.write=write_cipher,.commit=commit,.abort=abort_file};
 phase=0;assert(!recording_store_save(&s,&wav,1,1));assert(!phase);
 return 0;
}

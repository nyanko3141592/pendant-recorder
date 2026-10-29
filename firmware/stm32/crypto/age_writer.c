#include "age_writer.h"
#include "agec.h"
#include "agecore.h"
#include <stdatomic.h>
/* agec has shared diagnostics. Serialize the complete operation. */
static atomic_flag busy=ATOMIC_FLAG_INIT;
static struct {
 const uint8_t *plain;
 size_t length,offset;
 age_rng_fn rng;
 age_write_fn write;
 void *ctx;
 bool failed;
} active;
extern char ebuf[EBUFSIZE];
const char *argv0="pendant-age";
const char *eget(void){return *ebuf?ebuf:"recording IO failure";}
int randombuf(uchar *buf,int n){
 if(n<0 || !active.rng || !active.rng(active.ctx,buf,(size_t)n)){
  active.failed=true;eset("hardware RNG failed");return 0;
 }
 return 1;
}
ssize ageread(int fd,void *buf,usize n){
 if(fd!=1 || active.failed)return -1;
 size_t remain=active.length-active.offset;
 if(n>remain)n=remain;
 if(n)memcpy(buf,active.plain+active.offset,n);
 active.offset+=n;return (ssize)n;
}
ssize agewrite(int fd,const void *buf,usize n){
 if(fd!=2 || active.failed)return -1;
 if(n && !active.write(active.ctx,buf,n)){
  active.failed=true;eset("ciphertext writer failed");return -1;
 }
 return (ssize)n;
}
bool age_write_recording(const uint8_t recipient[32],const uint8_t *plain,size_t length,
                         age_rng_fn rng,age_write_fn writer,void *ctx){
 if(!recipient || (!plain && length) || !rng || !writer)return false;
 if(atomic_flag_test_and_set_explicit(&busy,memory_order_acquire))return false;
 memset(&active,0,sizeof(active));ebuf[0]=0;
 active.plain=plain;active.length=length;active.rng=rng;active.write=writer;active.ctx=ctx;
 Ibuf input;Obuf output={0};ibinit(&input,1);output.fd=2;
 /* Plain binary WAV, not armored ciphertext. Header replay recording is
  * a decryption feature and would allocate a copy of the whole input. */
 input.recording=0;input.isarmor=0;
 const char *error=age_encipher(&input,&output,recipient,1);
 bool ok=!error&&!active.failed&&active.offset==length;
 ibfree(&input);wipe(&input,sizeof(input));wipe(&output,sizeof(output));
 wipe(&active,sizeof(active));
 atomic_flag_clear_explicit(&busy,memory_order_release);return ok;
}

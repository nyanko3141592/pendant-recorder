"""Native interop/fault tests for the actual firmware age adapter."""
from pathlib import Path
import subprocess as sp
import tempfile
import sys
root=Path(__file__).resolve().parents[1]
age=str(Path(sys.argv[1]).resolve())
source=r'''
#include "age_writer.h"
#include "agec.h"
#include <assert.h>
extern unsigned allocation_calls;
typedef struct {FILE *out;int rng_fail,write_fail;} context;
static bool rng(void *v,uint8_t *p,size_t n){
 context *c=v;if(c->rng_fail)return false;arc4random_buf(p,n);return true;
}
static bool output(void *v,const uint8_t *p,size_t n){
 context *c=v;if(c->write_fail)return false;return fwrite(p,1,n,c->out)==n;
}
int main(int argc,char **argv){
 if(argc!=4)return 2;
 uint8_t recipient[32];assert(x25519pubkey(argv[1],recipient));
 FILE *in=fopen(argv[2],"rb");assert(in);fseek(in,0,SEEK_END);long size=ftell(in);assert(size>=0);rewind(in);
 uint8_t *plain=malloc((size_t)size+1);assert(plain);assert(fread(plain,1,(size_t)size,in)==(size_t)size);fclose(in);
 context c={tmpfile(),1,0};assert(c.out);
 unsigned allocations_before=allocation_calls;
 assert(!age_write_recording(recipient,plain,(size_t)size,rng,output,&c));
 c.rng_fail=0;c.write_fail=1;
 assert(!age_write_recording(recipient,plain,(size_t)size,rng,output,&c));
 fclose(c.out);c.out=fopen(argv[3],"wb");assert(c.out);c.write_fail=0;
 assert(age_write_recording(recipient,plain,(size_t)size,rng,output,&c));
 assert(allocation_calls==allocations_before);
 assert(fclose(c.out)==0);free(plain);return 0;
}
'''
with tempfile.TemporaryDirectory(prefix='pendant-age-port-') as td:
 p=Path(td);(p/'main.c').write_text(source)
 (p/'alloc.c').write_text('#include <stdlib.h>\nunsigned allocation_calls;\nvoid *test_malloc(size_t n){allocation_calls++;return malloc(n); }\nvoid *test_realloc(void *p,size_t n){allocation_calls++;return realloc(p,n); }\nvoid test_free(void *p){free(p); }\n')
 sp.run(['cc','-fsanitize=address,undefined','-c',str(p/'alloc.c'),'-o',str(p/'alloc.o')],check=True)
 vendor=root/'vendor/agec'
 sources=list(vendor.glob('*.c'))+list((vendor/'crypto').glob('*.c'))+[root/'crypto/age_writer.c']
 sp.run(['cc','-O2','-g','-Dmalloc=test_malloc','-Drealloc=test_realloc','-Dfree=test_free','-fsanitize=address,undefined','-iquote',str(vendor),'-I',str(root/'crypto'),str(p/'main.c'),*[str(s) for s in sources],str(p/'alloc.o'),'-o',str(p/'enc')],check=True)
 keygen=str(Path(age).with_name('age-keygen'));sp.run([keygen,'-o',str(p/'key')],check=True,capture_output=True)
 recipient=sp.check_output([keygen,'-y',str(p/'key')],text=True).strip()
 for n in [0,1,41020,65535,65536,65537,80956,131072]:
  plain=bytes((i*137+19)%256 for i in range(n));(p/'plain').write_bytes(plain)
  sp.run([str(p/'enc'),recipient,str(p/'plain'),str(p/'cipher')],check=True)
  if n==41020:
   assert (p/'cipher').stat().st_size<=65536
   print(f'Five-second chunk ciphertext: {(p/"cipher").stat().st_size} bytes, below64KiB ceiling')
  got=sp.check_output([age,'-d','-i',str(p/'key'),str(p/'cipher')]);assert got==plain
  print(f'{n} bytes: RNG/writer failures rejected, retry and standard age decode PASS')

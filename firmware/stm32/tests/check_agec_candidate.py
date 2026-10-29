"""Evaluate a separately checked-out agecrypt library; not firmware integration.
Usage: python3 check_agec_candidate.py /path/to/agecrypt /path/to/age
No network, device or production recording access.
"""
from pathlib import Path
import subprocess as sp
import sys
import shutil
import tempfile

root = Path(sys.argv[1]).resolve()
age = str(Path(sys.argv[2]).resolve())
source = r'''
#include "agec.h"
#include "agecore.h"
#include <fcntl.h>
/* Test uses OS file descriptors, no growable in-memory output. */
ssize ageread(int fd,void *p,usize n){return read(fd,p,n);}
ssize agewrite(int fd,const void *p,usize n){return write(fd,p,n);}
int main(int argc,char **argv){
 if(argc!=4)return 2;
 uchar recipient[32];
 if(!x25519pubkey(argv[1],recipient))return 3;
 int infd=open(argv[2],O_RDONLY),outfd=open(argv[3],O_CREAT|O_EXCL|O_WRONLY,0600);
 if(infd<0||outfd<0)return 4;
 Ibuf in; Obuf out={0};ibinit(&in,infd);out.fd=outfd;
 const char *err=age_encipher(&in,&out,recipient,1);
 if(err){fprintf(stderr,"%s\n",err);return 5;}
 if(bflush(&out)<0)return 6;
 ibfree(&in);close(infd);return close(outfd)!=0;
}
'''
with tempfile.TemporaryDirectory(prefix='pendant-agec-') as td:
 p=Path(td); (p/'main.c').write_text(source)
 src=root/'src'
 if '--inplace' in sys.argv[3:]:
  shutil.copytree(src,p/'candidate'); src=p/'candidate'
  payload=src/'agec/payload.c'; code=payload.read_text()
  old='uchar inbuf[CHUNKLEN], outbuf[CHUNKLEN + TAGLEN];'
  assert code.count(old)==1
  code=code.replace(old,'uchar inbuf[CHUNKLEN + TAGLEN];\n\tuchar *outbuf = inbuf;')
  payload.write_text(code)
  print('Experimental in-place payload encryption: saves65536 bytes; not production firmware')
  if '--smallio' in sys.argv[3:]:
   io=src/'agec/io.h'; code=io.read_text()
   code=code.replace('#define IOBUFSIZE 8*1024','#define IOBUFSIZE 512')
   code=code.replace('#define IOABUFRAWSIZE 48*256','#define IOABUFRAWSIZE 48*8')
   code=code.replace('#define IOABUFREADSIZE 65*126','#define IOABUFREADSIZE 65*8')
   io.write_text(code)
   print('Experimental reduced I/O buffers; binary X25519 encryption tested only')
 files=list((src/'agec').glob('*.c'))+list((src/'agec/crypto').glob('*.c'))+[src/'platform.c']
 sp.run(['cc','-O2','-g','-fsanitize=address,undefined','-iquote',str(src/'agec'),'-iquote',str(src),str(p/'main.c'),*[str(f) for f in files],'-o',str(p/'enc')],check=True)
 keygen=str(Path(age).with_name('age-keygen'))
 sp.run([keygen,'-o',str(p/'key')],check=True,capture_output=True)
 recipient=sp.check_output([keygen,'-y',str(p/'key')],text=True).strip()
 for size in [0,1,65535,65536,65537,80956,131072]:
  raw=bytes((i*137+19)%256 for i in range(size)); (p/'plain').write_bytes(raw)
  enc=p/f'{size}.age'
  sp.run([str(p/'enc'),recipient,str(p/'plain'),str(enc)],check=True)
  recovered=sp.check_output([age,'-d','-i',str(p/'key'),str(enc)])
  assert recovered==raw, size
  print(f'agec -> age: {size} bytes PASS')

#!/usr/bin/env python3
"""Host codec compatibility check on synthetic audio; not an MCU/power test."""
import argparse,json,math,struct,subprocess,tempfile,wave,hashlib
from pathlib import Path
RATE=16000;BLOCK=1024;SAMPLES=2*(BLOCK-4)+1

def run(*args):
 return subprocess.run(args,check=True,capture_output=True).stdout

def chunks(data):
 assert data[:4]==b'RIFF' and data[8:12]==b'WAVE'
 out={};off=12
 while off+8<=len(data):
  key=data[off:off+4].decode('ascii');n=struct.unpack_from('<I',data,off+4)[0]
  assert off+8+n<=len(data);out[key]=data[off+8:off+8+n];off+=8+n+(n&1)
 return out

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--report',type=Path,required=True);args=ap.parse_args()
 with tempfile.TemporaryDirectory() as td:
  p=Path(td);src=p/'source.wav';enc=p/'ima.wav';dec=p/'decoded.wav'
  pcm=[int(10000*math.sin(2*math.pi*(440 if i<RATE*5 else 880)*i/RATE)) if i<RATE*8 else 0 for i in range(RATE*10)]
  with wave.open(str(src),'wb') as w:
   w.setparams((1,2,RATE,0,'NONE','not compressed'));w.writeframes(struct.pack('<'+'h'*len(pcm),*pcm))
  run('ffmpeg','-v','error','-i',str(src),'-c:a','adpcm_ima_wav','-block_size',str(BLOCK),str(enc))
  cs=chunks(enc.read_bytes());fmt=struct.unpack_from('<HHIIHH',cs['fmt ']);spb=struct.unpack_from('<H',cs['fmt '],18)[0]
  assert fmt[0]==0x11 and fmt[1]==1 and fmt[2]==RATE and fmt[4]==BLOCK and fmt[5]==4 and spb==SAMPLES
  assert len(cs['data'])%BLOCK==0
  run('ffmpeg','-v','error','-i',str(enc),'-c:a','pcm_s16le',str(dec))
  with wave.open(str(dec),'rb') as w:
   assert w.getnchannels()==1 and w.getframerate()==RATE and w.getsampwidth()==2
   frames=w.getnframes();assert len(pcm)<=frames<len(pcm)+SAMPLES
   decoded_valid=w.readframes(len(pcm));assert len(decoded_valid)==len(pcm)*2
  trimmed=p/'trimmed.wav'
  with wave.open(str(trimmed),'wb') as w:
   w.setparams((1,2,RATE,0,'NONE','not compressed'));w.writeframes(decoded_valid)
  with wave.open(str(trimmed),'rb') as w:assert w.getnframes()==len(pcm)
  blocks_per_day=math.ceil(RATE*86400/SAMPLES)
  report={'status':'PASS_HOST_FORMAT_ONLY','ffmpeg':run('ffmpeg','-version').decode().splitlines()[0],'profile':{'format':'WAVE_FORMAT_IMA_ADPCM','sample_rate_hz':RATE,'channels':1,'bits_per_code':4,'block_align_bytes':BLOCK,'samples_per_block':SAMPLES},'synthetic_test':{'source_samples':len(pcm),'decoded_samples':frames,'trimmed_valid_samples':len(pcm),'encoded_file_bytes':enc.stat().st_size,'encoded_sha256':hashlib.sha256(enc.read_bytes()).hexdigest()},'budget':{'data_bytes_per_24h':blocks_per_day*BLOCK,'effective_bits_per_second':BLOCK*8*RATE/SAMPLES,'pcm16_bytes_per_24h':RATE*2*86400,'chunk_encryption_example':'4096 plaintext bytes + 17-byte secretstream tag + 4-byte framing length; candidate only','example_chunk_overhead_fraction':21/4096},'not_tested':['MCU codec implementation','Encryption implementation','Speech recognition accuracy','Power use','Windows/Linux decoder execution']}
  args.report.write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()

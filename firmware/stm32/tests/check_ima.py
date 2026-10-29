"""Decode our C encoder with ffmpeg; synthetic audio only, not MCU power proof."""
import ctypes,math,struct,subprocess,tempfile,wave,json
from pathlib import Path
root=Path(__file__).resolve().parents[3]
with tempfile.TemporaryDirectory() as td:
 p=Path(td);lib=p/'ima.dylib'
 subprocess.run(['cc','-shared','-fPIC','-Wall','-Wextra','-Werror',str(root/'firmware/stm32/core/ima_adpcm.c'),'-o',str(lib)],check=True)
 f=ctypes.CDLL(str(lib)).pendant_ima_block;f.argtypes=[ctypes.POINTER(ctypes.c_int16),ctypes.c_size_t,ctypes.POINTER(ctypes.c_uint8),ctypes.POINTER(ctypes.c_int)];f.restype=ctypes.c_int
 results=[]
 for name,pcm in [('silence',[0]*16000),('tone',[int(10000*math.sin(2*math.pi*440*i/16000)) for i in range(16000)]),('extremes',[-32768,32767]*2041),('short',[123])]:
  blocks=[];idx=ctypes.c_int(0)
  for start in range(0,len(pcm),2041):
   chunk=pcm[start:start+2041];a=(ctypes.c_int16*len(chunk))(*chunk);o=(ctypes.c_uint8*1024)();assert f(a,len(chunk),o,ctypes.byref(idx))==0;blocks.append(bytes(o))
  audio=b''.join(blocks);fmt=struct.pack('<HHIIHHHH',17,1,16000,8027,1024,4,2,2041)
  payload=b'WAVEfmt '+struct.pack('<I',len(fmt))+fmt+b'fact'+struct.pack('<II',4,len(pcm))+b'data'+struct.pack('<I',len(audio))+audio
  wav=p/(name+'.wav');wav.write_bytes(b'RIFF'+struct.pack('<I',len(payload))+payload);out=p/(name+'-pcm.wav')
  subprocess.run(['ffmpeg','-v','error','-xerror','-i',str(wav),'-af',f'atrim=end_sample={len(pcm)}','-c:a','pcm_s16le',str(out)],check=True)
  with wave.open(str(out),'rb') as w:
   assert w.getnframes()==len(pcm);decoded=struct.unpack('<'+'h'*len(pcm),w.readframes(len(pcm)))
  error=sum((a-b)**2 for a,b in zip(pcm,decoded))/len(pcm)
  if name=='silence':assert error==0
  if name=='tone':assert error<100000
  if name=='short':assert decoded[0]==123
  results.append({'case':name,'samples':len(pcm),'blocks':len(blocks),'mse':error})
 print(json.dumps(results,indent=2))

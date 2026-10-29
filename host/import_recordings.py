#!/usr/bin/env python3
"""Import standard age-encrypted IMA WAV chunks. Verified cleanup is opt-in while platform durability is being qualified.
Requires age and ffmpeg executables. --watch polls mounted devices or an explicitly selected volume.
The device must give MSC exclusive ownership before mounting this volume.
"""
from import_lock import destination_lock
import argparse,hashlib,json,os,shutil,struct,subprocess,tempfile,time,wave,sys
from pathlib import Path
from device_discovery import discover

def digest(p):
 h=hashlib.sha256()
 with p.open('rb') as f:
  for b in iter(lambda:f.read(65536),b''):h.update(b)
 return h.hexdigest()

def durable(p):
 with p.open('rb') as f:
  os.fsync(f.fileno())
  if sys.platform=='darwin':
   import fcntl
   fcntl.fcntl(f.fileno(),fcntl.F_FULLFSYNC)

def sync_dir(p):
 if os.name!='nt':
  fd=os.open(p,os.O_RDONLY)
  try:os.fsync(fd)
  finally:os.close(fd)

def profile(p):
 d=p.read_bytes()
 if len(d)<12 or d[:4]!=b'RIFF' or d[8:12]!=b'WAVE' or struct.unpack_from('<I',d,4)[0]+8!=len(d):raise ValueError('Invalid RIFF length/header')
 chunks={};i=12
 while i<len(d):
  if i+8>len(d):raise ValueError('Truncated WAV chunk')
  n=struct.unpack_from('<I',d,i+4)[0];key=d[i:i+4]
  if i+8+n>len(d) or key in chunks:raise ValueError('Invalid/duplicate WAV chunk')
  chunks[key]=d[i+8:i+8+n];i+=8+n+(n&1)
 f=chunks.get(b'fmt ',b'');fact=chunks.get(b'fact',b'');audio=chunks.get(b'data',b'')
 if len(f)<20 or len(fact)<4:raise ValueError('Missing IMA profile')
 codec,ch,rate,_,block,bits=struct.unpack_from('<HHIIHH',f)
 samples=struct.unpack_from('<H',f,18)[0];count=struct.unpack_from('<I',fact)[0]
 if (codec,ch,rate,block,bits,samples)!=(17,1,16000,1024,4,2041):raise ValueError('Unsupported audio profile')
 if not audio or len(audio)%block or not 0<count<=len(audio)//block*samples:raise ValueError('Invalid sample count')
 return count

def import_one(src,dest,identity,age='age',ffmpeg='ffmpeg'):
 if src.is_symlink() or not src.is_file() or src.stat().st_size>2*1024*1024:raise ValueError('Invalid source file')
 dest.mkdir(parents=True,exist_ok=True,mode=0o700)
 # Identify duplicates before allocating a temporary copy. Re-read content on
 # every scan: FAT timestamps are too weak to use as an integrity cache.
 h=digest(src);out=dest/h
 if out.exists():
  if out.is_symlink() or any((out/n).is_symlink() for n in ['receipt.json','recording.age','audio.wav']):raise ValueError('Unsafe existing import path')
  r=json.loads((out/'receipt.json').read_text())
  if r['cipher_sha256']!=h or digest(out/'recording.age')!=h or digest(out/'audio.wav')!=r['wav_sha256']:raise ValueError('Existing import damaged; source preserved')
  return {'status':'already_imported','path':str(out/'audio.wav')}
 with tempfile.TemporaryDirectory(prefix='.import-',dir=dest) as td:
  t=Path(td);cipher=t/'recording.age';shutil.copyfile(src,cipher)
  if digest(cipher)!=h or digest(src)!=h:raise ValueError('Source changed during copy')
  plain=t/'decoded-ima.wav'
  subprocess.run([age,'--decrypt','-i',str(identity),'-o',str(plain),str(cipher)],check=True,capture_output=True)
  count=profile(plain);wav=t/'audio.wav'
  subprocess.run([ffmpeg,'-nostdin','-v','error','-xerror','-protocol_whitelist','file,pipe','-f','wav','-i',str(plain),'-af',f'atrim=end_sample={count}','-c:a','pcm_s16le',str(wav)],check=True,capture_output=True)
  with wave.open(str(wav),'rb') as w:
   if (w.getnchannels(),w.getsampwidth(),w.getframerate(),w.getnframes())!=(1,2,16000,count):raise ValueError('Decoded WAV mismatch')
   if len(w.readframes(count))!=count*2:raise ValueError('Truncated decoded PCM')
  plain.unlink();r={'cipher_sha256':h,'wav_sha256':digest(wav),'samples':count,'sample_rate':16000,'source_relative_name':src.name,'source_deleted':False}
  (t/'receipt.json').write_text(json.dumps(r,indent=2)+'\n')
  for f in t.iterdir():os.chmod(f,0o600);durable(f)
  sync_dir(t)
  # Caller holds destination lock. Hash directory never overwrites recordings.
  os.rename(t,out);sync_dir(dest)
  return {'status':'imported','path':str(out/'audio.wav'),'samples':count}

def cleanup_verified(src,dest,identity,age='age',ffmpeg='ffmpeg'):
 """Reauthenticate the exact source and return its generated ID for HID cleanup.
 The read-only MSC source is never unlinked by the host.
 """
 if src.is_symlink() or not src.is_file():raise ValueError('Unsafe source')
 before=src.stat();h=digest(src);saved=dest/h
 if saved.is_symlink():raise ValueError('Unsafe destination')
 for name in ['audio.wav','recording.age','receipt.json']:
  if (saved/name).is_symlink():raise ValueError('Unsafe destination file')
 # Recompute from authenticated ciphertext; never trust a receipt alone.
 with tempfile.TemporaryDirectory(prefix='.verify-',dir=dest) as td:
  check=import_one(src,Path(td),identity,age,ffmpeg)
  if digest(saved/'recording.age')!=h or digest(saved/'audio.wav')!=digest(Path(check['path'])):raise ValueError('Saved content does not match authenticated source')
 for name in ['audio.wav','recording.age','receipt.json']:durable(saved/name)
 sync_dir(saved);sync_dir(dest)
 after=src.stat()
 if (before.st_dev,before.st_ino,before.st_size,before.st_mtime_ns)!=(after.st_dev,after.st_ino,after.st_size,after.st_mtime_ns) or digest(src)!=h:raise ValueError('Source changed before cleanup')
 try:recording_id=int(src.stem,16)
 except ValueError as e:raise ValueError('Recorder filename is not an 8-hex ID') from e
 if len(src.stem)!=8 or src.suffix.lower()!='.age':raise ValueError('Recorder filename is not an 8-hex AGE ID')
 return {'status':'cleanup_verified','cipher_sha256':h,'path':str(saved/'audio.wav'),'recording_id':recording_id,'source_preserved_until_device_cleanup':True}

def main():
 ap=argparse.ArgumentParser(description=__doc__);source=ap.add_mutually_exclusive_group(required=True);source.add_argument('--volume',type=Path);source.add_argument('--discover',action='store_true');ap.add_argument('--destination',type=Path,required=True);ap.add_argument('--identity',type=Path,required=True);ap.add_argument('--watch',action='store_true');ap.add_argument('--cleanup-verified',action='store_true');ap.add_argument('--vid',type=lambda s:int(s,0));ap.add_argument('--pid',type=lambda s:int(s,0));ap.add_argument('--serial');ap.add_argument('--age',default='age');ap.add_argument('--ffmpeg',default='ffmpeg');a=ap.parse_args()
 if a.cleanup_verified and (a.vid is None or a.pid is None):ap.error('--cleanup-verified requires the product --vid and --pid')
 if a.volume and (a.destination.resolve().is_relative_to(a.volume.resolve()) or a.volume.resolve().is_relative_to(a.destination.resolve())):ap.error('Volume and destination must be separate directory trees')
 a.destination.mkdir(parents=True,exist_ok=True,mode=0o700)
 # Refuse overlap with an older importer using the directory-lock protocol.
 if (a.destination/'.import-lock').exists():ap.error('Legacy import lock exists; stop old importer and investigate before removing it')
 with destination_lock(a.destination):
  while True:
   failures=0
   try:
    volumes=discover() if a.discover else [a.volume]
   except OSError as e:
    print(json.dumps({'status':'discovery_failed','error':type(e).__name__}),flush=True)
    if not a.watch:return 1
    time.sleep(3);continue
   if not volumes and not a.watch:
    print(json.dumps({'status':'device_not_found'}),flush=True);return 3
   for volume in volumes:
    cleanup_ids=[]
    try:
     if a.destination.resolve().is_relative_to(volume.resolve()) or volume.resolve().is_relative_to(a.destination.resolve()):
      failures+=1;print(json.dumps({'status':'unsafe_destination'}),flush=True);continue
     if not volume.is_dir():
      failures+=1;continue
     # FAT names may be uppercase; materialize while handling removal races.
     sources=sorted(p for p in volume.rglob('*') if p.suffix.lower()=='.age')
    except OSError as e:
     failures+=1;print(json.dumps({'status':'scan_failed','volume':str(volume),'error':type(e).__name__}),flush=True);continue
    for src in sources:
     try:
      if not src.resolve().is_relative_to(volume.resolve()):raise ValueError('Source escapes volume')
      print(json.dumps(import_one(src,a.destination,a.identity,a.age,a.ffmpeg)),flush=True)
      if a.cleanup_verified:
       verified=cleanup_verified(src,a.destination,a.identity,a.age,a.ffmpeg);cleanup_ids.append(verified['recording_id']);print(json.dumps(verified),flush=True)
     except (OSError,ValueError,KeyError,subprocess.CalledProcessError) as e:
      failures+=1;print(json.dumps({'status':'failed','source':str(src),'error':type(e).__name__,'source_preserved':True}),flush=True)
    if a.cleanup_verified and cleanup_ids and not failures:
     try:
      import hid
      from provision_recipient_hid import queue_cleanup
      matches=[d for d in hid.enumerate(a.vid,a.pid) if not a.serial or d.get('serial_number')==a.serial]
      if len(matches)!=1:raise OSError(f'Expected one recorder HID, found {len(matches)}')
      device=hid.device();device.open_path(matches[0]['path'])
      try:
       ids=sorted(set(cleanup_ids));start,last=ids[0],ids[-1]
       print(json.dumps({'status':queue_cleanup(device,start,last),'first_id':start,'last_id':last,'verified_file_count':len(ids),'source_preserved_until_eject':True}),flush=True)
      finally:device.close()
     except (ImportError,OSError,RuntimeError,ValueError) as e:
      failures+=1;print(json.dumps({'status':'cleanup_queue_failed','error':type(e).__name__,'detail':str(e),'source_preserved':True}),flush=True)
   if not a.watch:return 1 if failures else 0
   time.sleep(3)
if __name__=='__main__':raise SystemExit(main())

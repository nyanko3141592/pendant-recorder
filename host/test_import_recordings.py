import tempfile,subprocess,wave,unittest,os,shutil
from pathlib import Path
from import_recordings import import_one,cleanup_verified
AGE=os.environ.get('AGE_BIN') or shutil.which('age');KEYGEN=os.environ.get('AGE_KEYGEN_BIN') or shutil.which('age-keygen')
@unittest.skipUnless(AGE and KEYGEN and shutil.which('ffmpeg'),'age, age-keygen and ffmpeg required')
class ImportTests(unittest.TestCase):
 def test_roundtrip_retry_corruption_wrong_key(self):
  with tempfile.TemporaryDirectory() as td:
   p=Path(td);key=p/'key';wrong=p/'wrong';wav=p/'source.wav';ima=p/'ima.wav';enc=p/'00000001.age';out=p/'out'
   subprocess.run([KEYGEN,'-o',str(key)],check=True,capture_output=True)
   subprocess.run([KEYGEN,'-o',str(wrong)],check=True,capture_output=True)
   pub=subprocess.check_output([KEYGEN,'-y',str(key)],text=True).strip()
   with wave.open(str(wav),'wb') as w:w.setparams((1,2,16000,0,'NONE','NONE'));w.writeframes(b'\0\0'*16000)
   subprocess.run(['ffmpeg','-v','error','-i',str(wav),'-c:a','adpcm_ima_wav','-block_size','1024',str(ima)],check=True)
   subprocess.run([AGE,'-r',pub,'-o',str(enc),str(ima)],check=True)
   r=import_one(enc,out,key,AGE);self.assertEqual(r['status'],'imported');self.assertTrue(enc.exists())
   from unittest.mock import patch
   with patch('import_recordings.shutil.copyfile',side_effect=AssertionError('duplicate must not be copied')):
    self.assertEqual(import_one(enc,out,key,AGE)['status'],'already_imported')
   with self.assertRaises(subprocess.CalledProcessError):import_one(enc,p/'bad-key',wrong,AGE)
   truncated=p/'broken.age';truncated.write_bytes(enc.read_bytes()[:-1])
   with self.assertRaises(subprocess.CalledProcessError):import_one(truncated,p/'broken-out',key,AGE)
   self.assertTrue(truncated.exists());self.assertEqual(list((p/'broken-out').iterdir()),[])
   original=Path(r['path']).read_bytes()
   Path(r['path']).write_bytes(b'damaged')
   with self.assertRaises(ValueError):import_one(enc,out,key,AGE)
   with self.assertRaises(ValueError):cleanup_verified(enc,out,key,AGE)
   self.assertTrue(enc.exists())
   Path(r['path']).write_bytes(original)
   result=cleanup_verified(enc,out,key,AGE);self.assertEqual(result['status'],'cleanup_verified');self.assertTrue(enc.exists())
   self.assertTrue(enc.exists());self.assertTrue(Path(r['path']).exists())
class ImportMutationTests(unittest.TestCase):
 def test_change_between_initial_hash_and_copy_is_rejected(self):
  import import_recordings as app
  from unittest.mock import patch
  with tempfile.TemporaryDirectory() as td:
   p=Path(td);src=p/'source.age';src.write_bytes(b'original');dest=p/'saved'
   copy=shutil.copyfile
   def mutate(source,target):
    source.write_bytes(b'changed')
    return copy(source,target)
   with patch.object(app.shutil,'copyfile',side_effect=mutate),patch.object(app.subprocess,'run') as codec:
    with self.assertRaisesRegex(ValueError,'Source changed'):
     import_one(src,dest,p/'identity')
    codec.assert_not_called()
   self.assertEqual(src.read_bytes(),b'changed')
   self.assertEqual(list(dest.iterdir()),[])

class RecordingDiscoveryTests(unittest.TestCase):
 def test_cli_mixed_case_and_incomplete_files(self):
  # Exercise CLI enumeration without external codecs using mocked importer.
  import import_recordings as app
  from unittest.mock import patch
  with tempfile.TemporaryDirectory() as td:
   p=Path(td);volume=p/'volume';volume.mkdir();(volume/'nested').mkdir()
   names=['00000000.AGE','00000001.age','nested/00000002.AgE']
   for name in names:(volume/name).write_bytes(b'cipher fixture')
   (volume/'00000003.TMP').write_bytes(b'incomplete')
   seen=[]
   def capture(src,*args):seen.append(src.relative_to(volume).as_posix());return {'status':'fixture'}
   argv=['import_recordings','--volume',str(volume),'--destination',str(p/'dest'),'--identity',str(p/'key')]
   with patch('sys.argv',argv),patch.object(app,'import_one',side_effect=capture),patch('builtins.print'):
    self.assertEqual(app.main(),0)
   self.assertEqual(sorted(seen),names)
   self.assertTrue((volume/'00000003.TMP').exists())
class HotplugTests(unittest.TestCase):
 def test_discovery_failure_then_reconnect(self):
  import import_recordings as app
  from unittest.mock import patch
  with tempfile.TemporaryDirectory() as td:
   p=Path(td);v=p/'volume';v.mkdir();(v/'00000000.AGE').write_bytes(b'fixture')
   argv=['import_recordings','--discover','--watch','--destination',str(p/'dest'),'--identity',str(p/'key')]
   with patch('sys.argv',argv),patch.object(app,'discover',side_effect=[OSError('mount list unavailable'),[v]]),patch.object(app,'import_one',return_value={'status':'fixture'}) as imp,patch.object(app.time,'sleep',side_effect=[None,KeyboardInterrupt]),patch('builtins.print'):
    with self.assertRaises(KeyboardInterrupt):app.main()
    self.assertEqual(imp.call_count,1)
 def test_scan_failure_then_reconnect(self):
  import import_recordings as app
  from unittest.mock import patch
  with tempfile.TemporaryDirectory() as td:
   p=Path(td);v=p/'volume';v.mkdir();src=v/'00000000.AGE';src.write_bytes(b'fixture')
   argv=['import_recordings','--volume',str(v),'--watch','--destination',str(p/'dest'),'--identity',str(p/'key')]
   with patch('sys.argv',argv),patch.object(Path,'rglob',side_effect=[OSError('device removed'),iter([src])]),patch.object(app,'import_one',return_value={'status':'fixture'}) as imp,patch.object(app.time,'sleep',side_effect=[None,KeyboardInterrupt]),patch('builtins.print'):
    with self.assertRaises(KeyboardInterrupt):app.main()
    self.assertEqual(imp.call_count,1)

if __name__=='__main__':unittest.main()

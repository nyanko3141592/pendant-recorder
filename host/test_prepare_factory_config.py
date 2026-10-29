import unittest,tempfile,subprocess,json,shutil,os
from pathlib import Path
from prepare_factory_config import prepare,recipient_bytes
KEYGEN=os.environ.get('AGE_KEYGEN_BIN') or shutil.which('age-keygen')
@unittest.skipUnless(KEYGEN,'age-keygen required for independent public-key fixture')
class FactoryConfig(unittest.TestCase):
 def test_public_only_checksum_and_no_overwrite(self):
  with tempfile.TemporaryDirectory() as td:
   p=Path(td);key=p/'private';subprocess.run([KEYGEN,'-o',str(key)],check=True,capture_output=True);pub=subprocess.check_output([KEYGEN,'-y',str(key)],text=True).strip()
   self.assertEqual(len(recipient_bytes(pub)),32)
   bad=pub[:-1]+('q' if pub[-1]!='q' else 'p')
   with self.assertRaisesRegex(ValueError,'checksum'):recipient_bytes(bad)
   with self.assertRaises(ValueError):prepare(p/'bad',pub,0x1234,0x5678,3600)
   self.assertFalse((p/'bad').exists())
   # Numeric IDs are test inputs only, not an allocation assertion.
   out=prepare(p/'public',pub,1,2,3600);joined=''.join(x.read_text() for x in out.iterdir());self.assertNotIn('AGE-SECRET-KEY-',joined)
   with self.assertRaises(FileExistsError):prepare(out,pub,1,2,3600)
   m=json.loads((out/'config-manifest.json').read_text());self.assertFalse(m['private_key_included'])

   fixed=prepare(p/'fixed',pub,1,2,3600,'fixed-100',True)
   h=(fixed/'device-config.h').read_text()
   self.assertIn('#define PENDANT_FIXED_USB_LIMIT 1',h)
   self.assertIn('#define PENDANT_USB_MAX_POWER_MA 100',h)
   self.assertIn('#define PENDANT_EXPERIMENTAL_USB_CHARGING 1',h)
   with self.assertRaises(ValueError):prepare(p/'wrong',pub,1,2,3600,'unknown')
   self.assertFalse((p/'wrong').exists())

   periodic=prepare(p/'periodic',pub,1,2,3600,'fixed-100',True,'periodic-60s')
   header=(periodic/'device-config.h').read_bytes()
   import hashlib
   pm=json.loads((periodic/'config-manifest.json').read_text())
   self.assertEqual(pm['header_sha256'],hashlib.sha256(header).hexdigest())
   self.assertEqual(pm['automatic_battery_indicator_ms'],60000)
   self.assertIn(b'#define PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS 60000U',header)
   self.assertIn('#define PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS 0U',(out/'device-config.h').read_text())
   with self.assertRaises(ValueError):prepare(p/'bad-indicator',pub,1,2,3600,indicator_profile='invalid')
   self.assertFalse((p/'bad-indicator').exists())

class CommonFactoryConfig(unittest.TestCase):
 def test_common_image_contains_no_buyer_key(self):
  with tempfile.TemporaryDirectory() as td:
   p=Path(td);common=prepare(p/'common',None,1,2,3600,'fixed-100',False)
   header=(common/'device-config.h').read_text();manifest=json.loads((common/'config-manifest.json').read_text())
   self.assertIn('#define PENDANT_FACTORY_COMMON_FIRMWARE 1',header)
   self.assertNotIn('PENDANT_AGE_RECIPIENT',header)
   self.assertEqual(manifest['profile'],'FIRST_USE_HID_RECIPIENT')
   self.assertFalse(manifest['buyer_public_key_included'])
   self.assertEqual(manifest['hardware_revision'],'XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH')
   self.assertEqual(manifest['firmware_version'],'XE-EVT1-UNQUALIFIED')
   self.assertEqual(manifest['source_revision'],'UNCOMMITTED')
   with self.assertRaises(ValueError):prepare(p/'bad-version',None,1,2,3600,firmware_version='bad version')
   with self.assertRaises(ValueError):prepare(p/'bad-source',None,1,2,3600,source_revision='main')

import hashlib
import os
from pathlib import Path
import shutil
import stat
import subprocess
import tempfile
import unittest
from prepare_recipient import prepare

KEYGEN = os.environ.get('AGE_KEYGEN_BIN') or shutil.which('age-keygen')
AGE = os.environ.get('AGE_BIN') or shutil.which('age')

@unittest.skipUnless(KEYGEN and AGE and os.name == 'posix', 'POSIX and age tools required')
class ProvisionTest(unittest.TestCase):
    def test_roundtrip_and_preserve(self):
        with tempfile.TemporaryDirectory() as root:
            output = prepare(Path(root) / 'keys with spaces', KEYGEN)
            self.assertEqual(stat.S_IMODE(output.stat().st_mode), 0o700)
            for p in output.iterdir():
                self.assertEqual(stat.S_IMODE(p.stat().st_mode), 0o600)
            identity_digest = hashlib.sha256((output/'identity.txt').read_bytes()).digest()
            recipient = (output/'recipient.txt').read_text().strip()
            header = (output/'firmware-recipient.h').read_text()
            self.assertIn(recipient, header)
            self.assertNotIn('AGE-SECRET-KEY', header)
            instructions = (output/'README.txt').read_text()
            self.assertIn('common public-only firmware', instructions)
            self.assertIn('provision_recipient_hid.py', instructions)
            self.assertIn('Do not send recipient.txt or identity.txt', instructions)
            self.assertNotIn('factory provisioning', instructions)
            cipher = subprocess.run([AGE, '-r', recipient], input=b'recording fixture', capture_output=True, check=True).stdout
            plain = subprocess.run([AGE, '-d', '-i', str(output/'identity.txt')], input=cipher, capture_output=True, check=True).stdout
            self.assertEqual(plain, b'recording fixture')
            with self.assertRaises(FileExistsError): prepare(output, KEYGEN)
            self.assertEqual(hashlib.sha256((output/'identity.txt').read_bytes()).digest(), identity_digest)
            link = Path(root)/'symlink';link.symlink_to(output, target_is_directory=True)
            with self.assertRaises(FileExistsError): prepare(link, KEYGEN)

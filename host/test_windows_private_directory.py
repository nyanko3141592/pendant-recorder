import hashlib
import os
from pathlib import Path
import tempfile
import unittest
from windows_private_directory import create_private_directory

class PlatformGuardTest(unittest.TestCase):
    @unittest.skipIf(os.name == 'nt', 'non-Windows rejection only')
    def test_other_platform_fails_without_creating_directory(self):
        with tempfile.TemporaryDirectory() as parent:
            target = Path(parent)/'private'
            with self.assertRaises(OSError):
                create_private_directory(target)
            self.assertFalse(target.exists())

@unittest.skipUnless(os.name == 'nt', 'requires native Windows ACLs')
class WindowsDirectoryTest(unittest.TestCase):
    def test_create_and_refuse_existing(self):
        with tempfile.TemporaryDirectory() as parent:
            target = Path(parent)/'private with spaces'
            self.assertEqual(create_private_directory(target), target.absolute())
            with self.assertRaises(OSError):
                create_private_directory(target)
            self.assertTrue(target.is_dir())

    def test_reject_network_before_creation(self):
        with self.assertRaises(ValueError):
            create_private_directory(r'\\localhost\nonexistent-share\keys')

@unittest.skipUnless(os.name == 'nt', 'requires native Windows ACLs and age')
class WindowsRecipientTest(unittest.TestCase):
    def test_identity_inherits_only_current_user_and_roundtrips(self):
        import json
        import shutil
        import subprocess
        from prepare_recipient import prepare
        age = os.environ.get('AGE_BIN') or shutil.which('age')
        keygen = os.environ.get('AGE_KEYGEN_BIN') or shutil.which('age-keygen')
        if not age or not keygen:
            self.skipTest('age and age-keygen required')
        powershell = Path(os.environ['SystemRoot'])/'System32/WindowsPowerShell/v1.0/powershell.exe'
        if not powershell.is_file():
            self.skipTest('Windows PowerShell required for independent ACL inspection')
        # Only public ACL metadata crosses stdout. The identity contents stay in age.
        script = r'''
$ErrorActionPreference = 'Stop'
$acl = Get-Acl -LiteralPath $env:PENDANT_TEST_IDENTITY_PATH
$rules = @($acl.GetAccessRules($true, $true, [System.Security.Principal.SecurityIdentifier]) |
  ForEach-Object { @{ sid = $_.IdentityReference.Value; type = $_.AccessControlType.ToString(); rights = [int]$_.FileSystemRights; inherited = $_.IsInherited } })
@{ current_sid = [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value; rules = $rules } | ConvertTo-Json -Depth 4 -Compress
'''
        with tempfile.TemporaryDirectory() as parent:
            directory = prepare(Path(parent)/'keys with spaces', keygen)
            identity = directory/'identity.txt'
            env = dict(os.environ, PENDANT_TEST_IDENTITY_PATH=str(identity))
            result = subprocess.run([str(powershell), '-NoProfile', '-NonInteractive', '-Command', script],
                                    env=env, capture_output=True, check=True, text=True)
            acl = json.loads(result.stdout)
            self.assertEqual(len(acl['rules']), 1)
            rule = acl['rules'][0]
            self.assertEqual(rule['sid'], acl['current_sid'])
            self.assertEqual(rule['type'], 'Allow')
            self.assertEqual(rule['rights'], 0x1f01ff)
            self.assertTrue(rule['inherited'])
            recipient = (directory/'recipient.txt').read_text().strip()
            encrypted = subprocess.run([age, '-r', recipient], input=b'Windows recorder fixture',
                                       capture_output=True, check=True).stdout
            decrypted = subprocess.run([age, '-d', '-i', str(identity)], input=encrypted,
                                       capture_output=True, check=True).stdout
            self.assertEqual(decrypted, b'Windows recorder fixture')
            before = hashlib.sha256(identity.read_bytes()).digest()
            with self.assertRaises(OSError):
                prepare(directory, keygen)
            self.assertEqual(hashlib.sha256(identity.read_bytes()).digest(), before)

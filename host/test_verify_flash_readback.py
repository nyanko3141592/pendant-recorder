import hashlib
import json
from pathlib import Path
import tempfile
import unittest
from verify_flash_readback import verify


class ReadbackTest(unittest.TestCase):
    def test_match_and_corruption(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            image = root / 'application-UNQUALIFIED.bin'
            original = bytes(range(256)) * 4
            image.write_bytes(original)
            (root / 'build-manifest.json').write_text(json.dumps({
                'status': 'ENGINEERING_BUILD_UNQUALIFIED_NOT_FOR_FLASH',
                'artifacts_sha256': {image.name: hashlib.sha256(original).hexdigest()}}))
            readback = root / 'readback.bin'
            readback.write_bytes(original)
            self.assertEqual(verify(root, readback)['bytes_compared'], 1024)
            for invalid in (original[:-1], original + b'\xff', b'\xff' * len(original),
                            original[:500] + b'\x00' + original[501:]):
                readback.write_bytes(invalid)
                with self.assertRaises(ValueError):
                    verify(root, readback)
            image.write_bytes(b'changed')
            readback.write_bytes(b'changed')
            with self.assertRaises(ValueError):
                verify(root, readback)


if __name__ == '__main__':
    unittest.main()

import json
from pathlib import Path
import tempfile
import unittest
from device_discovery import discover, MARKER, HARDWARE_REVISION

class DiscoveryTests(unittest.TestCase):
    def test_marker_validation(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            marker = root / MARKER
            valid = dict(product='pendant-recorder', schema_version=2,
                         hardware_revision=HARDWARE_REVISION,
                         firmware_version='XE-EVT1',source_revision='333cefe',
                         audio_profile='ima16k-mono-1024-age-v1')
            for value in [None, [], {}, dict(valid, schema_version=True),
                          dict(valid, schema_version=1), dict(valid, product='other'),
                          dict(valid, hardware_revision='other'),dict(valid,firmware_version=''),
                          dict(valid, audio_profile='unknown')]:
                marker.write_text(json.dumps(value))
                self.assertEqual(discover([root]), [])
            marker.write_text(json.dumps(valid))
            self.assertEqual(discover([root, root]), [root])
            marker.write_bytes(b'\xff')
            self.assertEqual(discover([root]), [])
            marker.write_text(' ' * 4097)
            self.assertEqual(discover([root]), [])
            marker.unlink()
            target = root / 'real.json'
            target.write_text(json.dumps(valid))
            marker.symlink_to(target)
            self.assertEqual(discover([root]), [])
            marker.unlink()
            marker.mkdir()
            self.assertEqual(discover([root]), [])
            self.assertEqual(discover([root / 'missing']), [])

if __name__ == '__main__':
    unittest.main()

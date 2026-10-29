import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from import_lock import destination_lock

class LockTests(unittest.TestCase):
    def test_contention_and_forced_exit(self):
        with tempfile.TemporaryDirectory() as td:
            path = Path(td)
            code = "from import_lock import destination_lock; from pathlib import Path; import sys,time\nwith destination_lock(Path(sys.argv[1])):\n print('locked',flush=True)\n time.sleep(60)"
            p = subprocess.Popen([sys.executable, '-c', code, td], cwd=Path(__file__).parent, stdout=subprocess.PIPE, text=True)
            try:
                self.assertEqual(p.stdout.readline().strip(), 'locked')
                with self.assertRaises(OSError):
                    with destination_lock(path):
                        self.fail('second importer acquired lock')
                p.kill();p.wait(timeout=5)
                with destination_lock(path):
                    self.assertTrue((path/'.import-lock-v2').is_file())
                with destination_lock(path):
                    pass
            finally:
                if p.poll() is None:p.kill();p.wait()
                p.stdout.close()

if __name__ == '__main__':unittest.main()

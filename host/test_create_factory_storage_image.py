import tempfile
import unittest
from pathlib import Path
from create_factory_storage_image import create

class FactoryImage(unittest.TestCase):
    def test_create_and_refuse_overwrite(self):
        with tempfile.TemporaryDirectory() as tmp:
            p=Path(tmp)/'empty.img'
            r=create(p,1882812)
            self.assertEqual(r['free_clusters'],234886)
            self.assertFalse(r['identity_provisioned'])
            with self.assertRaises(FileExistsError):create(p,1882812)
            self.assertEqual(p.stat().st_size,1882812*512)
    def test_reject_invalid_size_before_creation(self):
        with tempfile.TemporaryDirectory() as tmp:
            p=Path(tmp)/'empty.img'
            with self.assertRaises(ValueError):create(p,1000000)
            self.assertFalse(p.exists())
    def test_refuse_symlink(self):
        with tempfile.TemporaryDirectory() as tmp:
            p=Path(tmp)/'existing';p.write_bytes(b'KEEP')
            link=Path(tmp)/'link';link.symlink_to(p)
            with self.assertRaises(FileExistsError):create(link,1882812)
            self.assertEqual(p.read_bytes(),b'KEEP')

if __name__=='__main__':unittest.main()

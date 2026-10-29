import struct
import tempfile
import unittest
from pathlib import Path
from verify_factory_storage import audit

class StorageReadback(unittest.TestCase):
    def fixture(self, p, sectors=1882812):
        b = bytearray(512)
        b[0:3]=b'\xeb\x58\x90';b[510:]=b'\x55\xaa'
        struct.pack_into('<H',b,11,512);b[13]=8
        struct.pack_into('<H',b,14,32);b[16]=2
        struct.pack_into('<I',b,32,sectors);struct.pack_into('<I',b,36,1900)
        struct.pack_into('<I',b,44,2)
        with p.open('wb') as f:
            f.truncate(sectors*512);f.write(b)
            for n in range(2):
                f.seek((32+n*1900)*512);f.write(struct.pack('<III',0x0ffffff8,0x0fffffff,0x0fffffff))
    def test_blank_capacity_and_corruption(self):
        with tempfile.TemporaryDirectory() as tmp:
            p=Path(tmp)/'readback.img';self.fixture(p)
            r=audit(p);self.assertEqual(r['status'],'PASS_FACTORY_CAPACITY_READBACK')
            self.assertEqual(r['free_clusters'],r['data_clusters']-1)
            with p.open('r+b') as f:
                f.seek(32*512+12);f.write(struct.pack('<I',0x0fffffff))
            with self.assertRaisesRegex(ValueError,'copies disagree'):audit(p)
            with p.open('r+b') as f:
                f.seek((32+1900)*512+12);f.write(struct.pack('<I',0x0fffffff))
            with self.assertRaisesRegex(ValueError,'Orphan'):audit(p)
    def test_capacity_failure(self):
        with tempfile.TemporaryDirectory() as tmp:
            p=Path(tmp)/'small.img';self.fixture(p,1000000)
            self.assertEqual(audit(p)['status'],'FAIL_CAPACITY')
    def test_existing_file_is_charged_and_crosslinks_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            p=Path(tmp)/'file.img';self.fixture(p)
            entry=bytearray(32);entry[:11]=b'EXISTINGBIN';entry[11]=32
            struct.pack_into('<H',entry,26,3);struct.pack_into('<I',entry,28,4096)
            with p.open('r+b') as f:
                for n in range(2):
                    f.seek((32+n*1900)*512+12);f.write(struct.pack('<I',0x0fffffff))
                f.seek((32+3800)*512);f.write(entry)
            r=audit(p);self.assertEqual(r['free_clusters'],r['data_clusters']-2)
            self.assertEqual(r['files'][0]['bytes'],4096)
            entry[:8]=b'SECOND  '
            with p.open('r+b') as f:
                f.seek((32+3800)*512+32);f.write(entry)
            with self.assertRaisesRegex(ValueError,'cross-linked'):audit(p)

    def test_cycle(self):
        with tempfile.TemporaryDirectory() as tmp:
            p=Path(tmp)/'cycle.img';self.fixture(p)
            with p.open('r+b') as f:
                for n in range(2):
                    f.seek((32+n*1900)*512+8);f.write(struct.pack('<I',2))
            with self.assertRaisesRegex(ValueError,'cyclic'):audit(p)

if __name__=='__main__':unittest.main()

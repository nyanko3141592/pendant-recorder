"""Create a NEW empty FAT32 superfloppy image; never format an existing path.
Sector count must come from the selected medium's measured addressable capacity.
This creates no product identity and does not write to a device.
"""
import argparse
import json
from pathlib import Path
import struct
from verify_factory_storage import audit


def create(path, sectors):
    # Bound this factory profile to the selected <=1 GB medium.
    if not 1820000 <= sectors <= 1953125:
        raise ValueError('Sector count outside selected 30h / 1GB profile')
    reserved = 32
    fat_sectors = ((sectors // 8 + 2) + 127) // 128
    b = bytearray(512)
    b[:3] = b'\xeb\x58\x90'; b[3:11] = b'MSDOS5.0'
    struct.pack_into('<H', b, 11, 512); b[13] = 8
    struct.pack_into('<H', b, 14, reserved); b[16] = 2; b[21] = 0xf8
    struct.pack_into('<H', b, 24, 63); struct.pack_into('<H', b, 26, 255)
    struct.pack_into('<I', b, 32, sectors); struct.pack_into('<I', b, 36, fat_sectors)
    struct.pack_into('<I', b, 44, 2)
    # No cached free-count hints; consumers scan the FAT. Backup boot at sector6.
    struct.pack_into('<H', b, 48, 0xffff); struct.pack_into('<H', b, 50, 6)
    b[64] = 0x80; b[66] = 0x29
    b[71:82] = b'NO NAME    '; b[82:90] = b'FAT32   '; b[510:] = b'\x55\xaa'
    # Exclusive creation also rejects symlinks, devices and existing images.
    with Path(path).open('xb') as f:
        f.truncate(sectors * 512); f.write(b); f.seek(6 * 512); f.write(b)
        for n in range(2):
            f.seek((reserved + n * fat_sectors) * 512)
            f.write(struct.pack('<III', 0x0ffffff8, 0x0fffffff, 0x0fffffff))
    result = audit(path)
    if result['status'] != 'PASS_FACTORY_CAPACITY_READBACK':
        raise ValueError('Generated image fails capacity budget; do not use')
    result['status'] = 'EMPTY_FACTORY_IMAGE_CREATED_AND_READBACK_VERIFIED'
    result['identity_provisioned'] = False
    return result

if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('new_image', type=Path); p.add_argument('--sectors', type=int, required=True)
    a = p.parse_args()
    try: print(json.dumps(create(a.new_image, a.sectors), indent=2))
    except (ValueError, OSError) as e: p.exit(1, str(e)+'\n')

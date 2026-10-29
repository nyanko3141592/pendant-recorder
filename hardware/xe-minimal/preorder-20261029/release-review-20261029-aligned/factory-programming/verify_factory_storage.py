"""Read-only FAT32 superfloppy image audit. Never formats or opens devices.
Run on an unmounted, complete factory readback image before recording.
"""
import argparse
import hashlib
import json
from pathlib import Path
import stat
import struct


def audit(path):
    path = Path(path)
    if not stat.S_ISREG(path.stat().st_mode):
        raise ValueError('Only regular readback image files are accepted')
    with path.open('rb') as f:
        import os
        st = os.fstat(f.fileno())
        if not stat.S_ISREG(st.st_mode):
            raise ValueError('Only regular readback image files are accepted')
        b = f.read(512)
        def u16(n): return struct.unpack_from('<H', b, n)[0]
        def u32(n): return struct.unpack_from('<I', b, n)[0]
        if len(b) != 512 or b[510:] != b'\x55\xaa':
            raise ValueError('Missing FAT boot signature')
        sector, spc, reserved, fats = u16(11), b[13], u16(14), b[16]
        total, fat_sectors, root = u32(32), u32(36), u32(44)
        if (sector != 512 or spc != 8 or reserved < 1 or fats != 2
                or u16(17) or u16(19) or u16(22) or u16(40) or u16(42)
                or u32(28) or not fat_sectors):
            raise ValueError('Requires mirrored two-FAT FAT32 superfloppy, 512-byte sectors, 4KiB clusters')
        if st.st_size != total * sector:
            raise ValueError('Readback size does not match volume size')
        data_start = reserved + fats * fat_sectors
        clusters = (total - data_start) // spc
        if not 65525 <= clusters < 0x0ffffff5 or fat_sectors * 128 < clusters + 2:
            raise ValueError('Invalid FAT32 data/FAT geometry')
        f.seek(reserved * sector)
        fat = f.read(fat_sectors * sector)
        if fat != f.read(fat_sectors * sector):
            raise ValueError('FAT copies disagree')
        entries = [v[0] & 0x0fffffff for v in struct.iter_unpack('<I', fat)]
        if entries[0] < 0x0ffffff8 or entries[1] < 0x0ffffff8:
            raise ValueError('Invalid reserved FAT entries')
        used = set()
        files = []
        directories = []
        def chain(start):
            result = []
            while True:
                if not 2 <= start < clusters + 2 or start in used:
                    raise ValueError('Invalid, cyclic or cross-linked cluster chain')
                used.add(start); result.append(start)
                nxt = entries[start]
                if nxt >= 0x0ffffff8:
                    return result
                start = nxt
        def read_cluster(c):
            f.seek((data_start + (c - 2) * spc) * sector)
            value = f.read(4096)
            if len(value) != 4096: raise ValueError('Truncated cluster')
            return value
        pending = [('/', root)]
        while pending:
            dirname, start = pending.pop()
            cs = chain(start)
            directories.append({'path': dirname, 'clusters': len(cs)})
            ended = False
            for c in cs:
                if ended: break
                data = read_cluster(c)
                for at in range(0, 4096, 32):
                    ent = data[at:at+32]
                    if ent[0] == 0: ended = True; break
                    if ent[0] == 0xe5 or ent[11] == 0x0f: continue
                    if ent[11] & 8: continue
                    name = ent[:8].decode('ascii', errors='backslashreplace').rstrip()
                    ext = ent[8:11].decode('ascii', errors='backslashreplace').rstrip()
                    if name in ('.', '..'): continue
                    name += ('.' + ext) if ext else ''
                    location = dirname + name
                    first = (struct.unpack_from('<H', ent, 20)[0] << 16) | struct.unpack_from('<H', ent, 26)[0]
                    size = struct.unpack_from('<I', ent, 28)[0]
                    if ent[11] & 16:
                        pending.append((location + '/', first))
                    else:
                        allocated = chain(first) if first else []
                        if len(allocated) != (size + 4095) // 4096:
                            raise ValueError('File allocation/size mismatch: ' + location)
                        files.append({'short_path': location, 'bytes': size, 'clusters': len(allocated)})
        allocated = {i for i in range(2, clusters + 2) if entries[i] != 0}
        if allocated != used:
            raise ValueError('Orphan, bad or reserved data clusters found')
        free = clusters - len(used)
        # Full 30h incremental allocation, plus REC directory growth and two-file reserve.
        # Existing allocations (including REC/identity) are already excluded from free.
        required_free = 226842 + 85 + 70
        result = {'status': 'PASS_FACTORY_CAPACITY_READBACK' if clusters >= 226999 and free >= required_free else 'FAIL_CAPACITY',
                  'data_clusters': clusters, 'free_clusters': free, 'minimum_free_clusters_before_recording': required_free,
                  'cluster_bytes': 4096, 'files': files, 'directories': directories,
                  'limits': ['Short 8.3 aliases listed; LFN presentation is not validated.',
                             'Capacity and allocation integrity only; no audio, media reliability or power-loss qualification.',
                             'Superfloppy profile only; partitioned media rejected. No image/device writes.']}
        f.seek(0); h = hashlib.sha256()
        for block in iter(lambda: f.read(1024 * 1024), b''): h.update(block)
        result['image_sha256'] = h.hexdigest()
        return result

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('image', type=Path)
    args = parser.parse_args()
    try:
        result = audit(args.image)
    except (ValueError, OSError, struct.error) as error:
        parser.exit(1, str(error) + '\n')
    print(json.dumps(result, indent=2))
    raise SystemExit(0 if result['status'].startswith('PASS') else 1)

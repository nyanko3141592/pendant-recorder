"""Mounted-volume discovery. Marker is a routing hint, never authentication."""
import json
import os
import stat
import sys
from pathlib import Path

MARKER = 'PENDANT.JSON'
HARDWARE_REVISION = 'XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH'

def identify(volume):
    try:
        if volume.is_symlink() or not volume.is_dir():
            return None
        marker = volume / MARKER
        info = marker.lstat()
        if not stat.S_ISREG(info.st_mode) or info.st_size > 4096:
            return None
        with marker.open('rb') as stream:
            raw = stream.read(4097)
        if len(raw) > 4096:
            return None
        data = json.loads(raw)
        if not isinstance(data, dict):
            return None
        if data.get('product') != 'pendant-recorder' or type(data.get('schema_version')) is not int or data['schema_version'] != 2:
            return None
        if data.get('audio_profile') != 'ima16k-mono-1024-age-v1':
            return None
        if data.get('hardware_revision') != HARDWARE_REVISION:
            return None
        for field in ('firmware_version','source_revision'):
            if not isinstance(data.get(field),str) or not 1<=len(data[field])<=64:
                return None
        return volume
    except (OSError, ValueError, UnicodeError):
        return None

def mounted_candidates():
    if sys.platform == 'darwin':
        return list(Path('/Volumes').iterdir())
    if os.name == 'nt':
        import ctypes
        mask = ctypes.windll.kernel32.GetLogicalDrives()
        return [Path(f'{chr(65+i)}:/') for i in range(26) if mask & (1 << i)]
    # Kernel mount list includes user automounts and manually mounted media.
    paths = []
    for line in Path('/proc/self/mountinfo').read_text().splitlines():
        fields = line.split()
        if len(fields) >= 6:
            value = fields[4]
            for escaped, decoded in [('\\040', ' '), ('\\011', '\t'), ('\\012', '\n'), ('\\134', '\\')]:
                value = value.replace(escaped, decoded)
            paths.append(Path(value))
    return paths

def discover(candidates=None):
    found = []
    for volume in mounted_candidates() if candidates is None else candidates:
        if identify(volume) is not None and volume not in found:
            found.append(volume)
    return found

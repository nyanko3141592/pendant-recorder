#!/usr/bin/env python3
"""Generate a launchd agent without installing or starting it. Requires Python 3.9+."""
import argparse
import os
from pathlib import Path
import plistlib
import sys

LABEL = 'local.pendant-recorder.import'

def executable(value):
    path = Path(value).expanduser().resolve(strict=True)
    if not path.is_file() or not os.access(path, os.X_OK):
        raise argparse.ArgumentTypeError(f'Not executable: {path}')
    return path

def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--identity', type=Path, required=True)
    ap.add_argument('--destination', type=Path, required=True)
    ap.add_argument('--age', type=executable, required=True)
    ap.add_argument('--ffmpeg', type=executable, required=True)
    ap.add_argument('--output', type=Path, required=True)
    args = ap.parse_args()
    identity = args.identity.expanduser().resolve(strict=True)
    if not identity.is_file():ap.error('Identity must be an existing file')
    if os.name != 'nt' and identity.stat().st_mode & 0o077:
        ap.error('Identity must be private (chmod 600); permissions are not changed automatically')
    destination = args.destination.expanduser().resolve()
    if identity == destination or identity.is_relative_to(destination):
        ap.error('Keep the private identity outside the recordings destination')
    script = Path(__file__).with_name('import_recordings.py').resolve(strict=True)
    config = {
        'Label': LABEL,
        'ProgramArguments': [str(Path(sys.executable).resolve()), str(script),
                             '--discover', '--watch', '--destination', str(destination),
                             '--identity', str(identity), '--age', str(args.age),
                             '--ffmpeg', str(args.ffmpeg)],
        'RunAtLoad': True, 'KeepAlive': True, 'ThrottleInterval': 30,
        'ProcessType': 'Background', 'Umask': 0o077,
        # Omit unbounded per-scan logs; inspect status via foreground CLI/launchctl.
    }
    output = args.output.expanduser().resolve()
    with output.open('xb') as stream:
        os.chmod(output, 0o600)
        plistlib.dump(config, stream)
    print(f'Created {output}; NOT installed or started. Private key contents were not read.')
    return 0

if __name__ == '__main__':raise SystemExit(main())

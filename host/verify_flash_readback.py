"""Read-only byte comparison; no connection, flashing, or release approval."""
import argparse
import hashlib
import json
from pathlib import Path


def verify(build_directory, readback):
    directory = Path(build_directory)
    manifest = json.loads((directory / 'build-manifest.json').read_text())
    if manifest.get('status') != 'ENGINEERING_BUILD_UNQUALIFIED_NOT_FOR_FLASH':
        raise ValueError('Unsupported manifest status')
    image = directory / 'application-UNQUALIFIED.bin'
    expected = manifest['artifacts_sha256'][image.name]
    original = image.read_bytes()
    if not original or hashlib.sha256(original).hexdigest() != expected:
        raise ValueError('Image empty or changed since manifest creation')
    actual = Path(readback).read_bytes()
    if len(actual) != len(original):
        raise ValueError('Readback length must exactly equal image length')
    if actual != original:
        raise ValueError('Readback differs from image')
    return {'status': 'BYTE_MATCH_ONLY_NOT_RELEASE_APPROVAL',
            'bytes_compared': len(actual), 'image_sha256': expected,
            'limitations': ['Physical readback origin, device identity and start address are not verified.',
                           'Option bytes, recipient ownership and hardware operation are not verified.',
                           'A copied image passes; this alone does not prove physical flashing.']}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--build-directory', required=True)
    parser.add_argument('--readback', required=True)
    args = parser.parse_args()
    try:
        print(json.dumps(verify(args.build_directory, args.readback), indent=2))
    except (OSError, ValueError, KeyError) as exc:
        parser.exit(1, f'Readback verification failed: {exc}\n')

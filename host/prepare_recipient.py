"""Create a new local age identity and matching firmware header; never flash/install."""
import argparse
import os
from pathlib import Path
import re
import shutil
import subprocess


def exclusive_write(path, data):
    fd = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o600)
    with os.fdopen(fd, 'wb') as f:
        f.write(data)
        f.flush()
        os.fsync(f.fileno())


def prepare(directory, keygen):
    if os.name not in ('posix', 'nt'):
        raise ValueError('Unsupported operating system for private key provisioning.')
    executable = shutil.which(keygen)
    if not executable:
        raise ValueError('age-keygen executable not found')
    directory = Path(directory).expanduser().absolute()
    # Refuse existing paths, including symlinks. A fresh private directory keeps
    # identity creation separate from repositories and ordinary output folders.
    if os.name == 'nt':
        from windows_private_directory import create_private_directory
        create_private_directory(directory)
    else:
        directory.mkdir(mode=0o700, parents=False, exist_ok=False)
    result = subprocess.run([executable], capture_output=True, check=False)
    if result.returncode:
        raise ValueError('age-keygen failed; no error output is printed to avoid key disclosure')
    identity = directory / 'identity.txt'
    exclusive_write(identity, result.stdout)
    result = subprocess.run([executable, '-y', str(identity)], capture_output=True, check=False)
    recipient = result.stdout.decode('ascii').strip() if not result.returncode else ''
    if not re.fullmatch(r'age1[023456789acdefghjklmnpqrstuvwxyz]{58}', recipient):
        raise ValueError('Invalid X25519 recipient; identity retained for recovery')
    exclusive_write(directory / 'recipient.txt', (recipient + '\n').encode())
    exclusive_write(directory / 'firmware-recipient.h',
                    ('/* Public recipient only. Keep identity.txt on host. */\n'
                     '#define PENDANT_AGE_RECIPIENT "' + recipient + '"\n').encode())
    exclusive_write(directory / 'README.txt',
                    b'Keep this directory outside version control. Back up identity.txt securely before recording.\n'
                    b'Loss of identity.txt makes recordings encrypted to its recipient unrecoverable.\n'
                    b'Do not send recipient.txt or identity.txt to the factory or seller.\n'
                    b'The factory flashes one common public-only firmware image for every unit.\n'
                    b'On first USB connection, hold the recorder button continuously for 2 seconds while provision_recipient_hid.py registers only recipient.txt in the device write-once slot and verifies its fingerprint.\n'
                    b'The buyer does not build firmware, use a debugger, solder, crimp, or modify wiring.\n'
                    b'firmware-recipient.h is a developer artifact, not a buyer installation step.\n'
                    b'Use identity.txt only with the host importer and secure backup after provisioning.\n'
                    b'This does not assign USB IDs, flash a device, install a watcher, or qualify hardware.\n')
    return directory


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--directory', required=True, help='New private directory outside source control')
    parser.add_argument('--age-keygen', default='age-keygen')
    args = parser.parse_args()
    try:
        output = prepare(args.directory, args.age_keygen)
    except (OSError, ValueError, UnicodeError) as error:
        parser.exit(1, f'Provisioning failed: {error}\n')
    print(f'Created private identity and public firmware header in {output}')

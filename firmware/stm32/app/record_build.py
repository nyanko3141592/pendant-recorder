#!/usr/bin/env python3
"""Record local engineering build inputs and outputs; never a release approval."""
import hashlib
import json
from pathlib import Path
import shlex
import shutil
import subprocess
import sys


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    out, root, config = map(lambda value: Path(value).resolve(), sys.argv[1:])
    config_manifest = json.loads((config / 'config-manifest.json').read_text())
    inputs = {root / 'linkcheck/build.sh', root / 'linkcheck/build_u585_candidate.sh',
              root / 'linkcheck/STM32U585CI.ld', root / 'vendor/tinyusb/provenance.json',
              root / 'app/build_configured.sh', Path(__file__).resolve(),
              config / 'device-config.h', config / 'config-manifest.json'}
    dependencies = list(out.glob('*.o.d'))
    if not dependencies:
        raise RuntimeError('Compiler dependency records missing')
    for dependency in dependencies:
        # GCC makefile dependencies: join continuations before unescaping paths.
        body = dependency.read_text().replace('\\\n', ' ')
        inputs.update(Path(p).resolve() for p in shlex.split(body.split(':', 1)[1]))
    artifacts = [out / name for name in ('candidate-NOT-FOR-FLASH.elf',
                 'application-UNQUALIFIED.bin', 'candidate.map',
                 'public-config-manifest.json')]
    tools = {}
    for name in ('arm-none-eabi-gcc', 'arm-none-eabi-objcopy', 'arm-none-eabi-ld'):
        path = Path(shutil.which(name)).resolve()
        tools[name] = {'path': str(path), 'sha256': digest(path),
                       'version': subprocess.check_output([name, '--version'], text=True).splitlines()[0]}
    record = {
        'status': 'ENGINEERING_BUILD_UNQUALIFIED_NOT_FOR_FLASH',
        'hardware_revision': config_manifest['hardware_revision'],
        'firmware_version': config_manifest['firmware_version'],
        'source_revision': config_manifest['source_revision'],
        'configuration_profile': config_manifest['profile'],
        'inputs_sha256': {str(p): digest(p) for p in sorted(inputs)},
        'artifacts_sha256': {p.name: digest(p) for p in artifacts},
        'tools': tools,
        'compiler_dependency_records': len(dependencies),
        'limitations': ['Hashes describe files observed after the build; concurrent edits are not excluded.',
                       'Toolchain runtime archives and environment are not fully captured; reproducibility is not proven.',
                       'USB allocation, hardware operation, battery runtime and production flashing are not qualified.'],
    }
    (out / 'build-manifest.json').write_text(json.dumps(record, indent=2) + '\n')


if __name__ == '__main__':
    main()

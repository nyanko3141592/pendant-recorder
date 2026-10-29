"""Record the current prototype-v1 non-hardware regression run."""
from pathlib import Path
import datetime
import hashlib
import json
import re

ROOT = Path(__file__).resolve().parents[3]
log_path = Path("/tmp/xe-firmware-regression.log")
log = log_path.read_text()
runs = re.findall(r"^RUN (.+)$", log, re.M)
expected = sorted(
    str(path.relative_to(ROOT)) for path in (ROOT / "firmware/stm32/tests").glob("*.sh")
) + ["firmware/stm32/compile_age_check.sh", "firmware/stm32/compile_audio_check.sh"]
assert sorted(runs) == sorted(expected), (runs, expected)
assert "error:" not in log.lower() and "failed" not in log.lower()

sources = []
for folder in [ROOT / "firmware/stm32", ROOT / "host"]:
    for path in folder.rglob("*"):
        if path.is_file() and path.suffix in (".c", ".h", ".py", ".sh"):
            sources.append(path)

report = {
    "status": "PASS_NON_HARDWARE_REGRESSION",
    "prototype_version": "XE-PROTOTYPE-V1",
    "recorded_at": datetime.datetime.now(datetime.timezone.utc).isoformat(),
    "shell_checks_passed": len(runs),
    "commands": runs,
    "not_proven": [
        "MCU execution on the routed PCB",
        "Physical microphone/audio quality and uninterrupted 16-hour capture",
        "Physical managed-flash startup/write/busy current and latency",
        "Physical USB enumeration, suspend current and three-OS import",
        "Battery usable capacity, charger behavior, BOR/cutoff and thermal guard",
    ],
    "source_sha256": {
        str(path.relative_to(ROOT)): hashlib.sha256(path.read_bytes()).hexdigest()
        for path in sorted(sources)
    },
}
out = Path(__file__).resolve().parent / "prototype-v1-regression.json"
out.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": report["status"], "shell_checks": len(runs), "sources": len(sources)}))

#!/usr/bin/env python3
"""Fail-closed acceptance of a completed five-unit factory programming run."""
from pathlib import Path
from datetime import datetime, timezone
import argparse, csv, hashlib, json, re

if not __debug__:
    raise RuntimeError("optimized Python disables fail-closed acceptance assertions")

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
HEX64 = re.compile(r"[0-9a-f]{64}")
UID = re.compile(r"[0-9A-Fa-f]{24}")

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def truth(v): return v.strip().upper() == "PASS"
def number(v): return v if isinstance(v, int) else int(v, 0)
def utc(v):
    t = datetime.fromisoformat(v.replace("Z", "+00:00"))
    assert t.tzinfo is not None and t.utcoffset() == timezone.utc.utcoffset(t)
    return t

def evaluate(manifest_path, record_path):
    m = json.loads(manifest_path.read_text())
    assert m["status"] == "EVT_IMAGE_COMPLETE_WITH_ALLOCATED_USB_IDS"
    assert m["target_mpn"] == "STM32U585CIU6"
    assert m["hardware_revision"] == json.loads((HERE.parent / "prototype-architecture-v1.json").read_text())["version"]
    lock = json.loads((HERE / "source-toolchain-lock.json").read_text())
    assert m["source_tree_sha256"] == lock["source_tree_sha256"]
    assert m["common_firmware_per_buyer"] is True and m["private_key_included"] is False
    assert m["buyer_public_key_included"] is False
    assert m["usb_hardware_profile"] == "fixed-100" and m["usb_descriptor_max_power_mA"] == 100
    assert m["charging_enabled_for_physical_evt"] is True
    assert m["charging_release_status"] == "UNQUALIFIED_UNTIL_PHYSICAL_EVT_PASSES"
    assert m["orders_payments_uploads_vendor_contacts_performed"] is False
    assert m["option_bytes"] == {"BOR": "LEVEL_4"}
    for k in ("source_tree_sha256", "firmware_sha256", "elf_sha256", "map_sha256",
              "usb_id_allocation_evidence_sha256", "battery_cutoff_evidence_sha256"):
        assert isinstance(m[k], str) and HEX64.fullmatch(m[k])
    assert 0 < number(m["usb_vid"]) <= 0xffff and 0 < number(m["usb_pid"]) <= 0xffff
    assert 2500 <= int(m["battery_cutoff_mv"]) <= 3500
    for path_key, hash_key in (("firmware_image","firmware_sha256"), ("elf","elf_sha256"),
                               ("map","map_sha256"), ("usb_id_allocation_evidence","usb_id_allocation_evidence_sha256"),
                               ("battery_cutoff_evidence","battery_cutoff_evidence_sha256")):
        p = (manifest_path.parent / m[path_key]).resolve()
        assert p.is_file() and sha(p) == m[hash_key]
    rows = list(csv.DictReader(record_path.open(newline="")))
    assert [r["unit_id"] for r in rows] == [f"U{i}" for i in range(1,6)]
    assert len({r["pcb_serial"] for r in rows}) == 5 and all(r["pcb_serial"] for r in rows)
    assert len({r["mcu_uid_hex"].lower() for r in rows}) == 5 and all(UID.fullmatch(r["mcu_uid_hex"]) for r in rows)
    accepted_log_hashes = set()
    for r in rows:
        assert r["hardware_revision"] == m["hardware_revision"]
        for rk, mk in (("firmware_sha256","firmware_sha256"),("elf_sha256","elf_sha256"),("map_sha256","map_sha256")):
            assert r[rk] == m[mk]
        assert int(r["usb_vid"],0) == number(m["usb_vid"]) and int(r["usb_pid"],0) == number(m["usb_pid"])
        assert int(r["battery_cutoff_mv"]) == int(m["battery_cutoff_mv"])
        assert r["programmer_model_serial"] and r["fixture_id"]
        assert utc(r["program_start_utc"]) < utc(r["program_end_utc"])
        assert int(r["pogo_contact_attempts"]) >= 10
        assert int(r["pogo_contact_successes"]) == int(r["pogo_contact_attempts"])
        assert 3000 <= int(r["vtref_mV"]) <= 3600 and r["current_limit_trip"].strip() == "0"
        for k in ("flash_verify","BOR4_readback","formal_usb_enumeration",
                  "charge_request_low_while_reset_asserted","storage_rail_default_off","power_loss_recovery"):
            assert truth(r[k]), k
        assert int(r["program_power_loss_injection_count"]) >= 1
        log_name = Path(r["raw_log_path"])
        assert not log_name.is_absolute() and ".." not in log_name.parts
        log = (record_path.parent / log_name).resolve()
        assert log.is_relative_to(record_path.parent.resolve())
        assert log.is_file() and HEX64.fullmatch(r["raw_log_sha256"]) and sha(log) == r["raw_log_sha256"]
        assert r["raw_log_sha256"] not in accepted_log_hashes
        accepted_log_hashes.add(r["raw_log_sha256"])
        assert r["result_PASS_FAIL_NOT_RUN"] == "PASS" and not r["deviation_notes"].strip()
    return {"status":"PASS_FIVE_UNIT_FACTORY_PROGRAMMING_ACCEPTANCE", "units":5}

if __name__ == "__main__":
    ap=argparse.ArgumentParser(); ap.add_argument("manifest",type=Path); ap.add_argument("record",type=Path); a=ap.parse_args()
    print(json.dumps(evaluate(a.manifest.resolve(), a.record.resolve())))

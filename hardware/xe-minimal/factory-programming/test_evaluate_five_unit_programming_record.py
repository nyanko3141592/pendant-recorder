#!/usr/bin/env python3
from pathlib import Path
import csv, hashlib, json, tempfile
from evaluate_five_unit_programming_record import evaluate

HERE=Path(__file__).resolve().parent
REV=json.loads((HERE.parent/"prototype-architecture-v1.json").read_text())["version"]
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()

with tempfile.TemporaryDirectory() as td:
    d=Path(td)
    artifacts={}
    for name in ("fw.bin","fw.elf","fw.map","usb.txt","cutoff.json"):
        p=d/name; p.write_text(name); artifacts[name]=sha(p)
    m={"status":"EVT_IMAGE_COMPLETE_WITH_ALLOCATED_USB_IDS","target_mpn":"STM32U585CIU6",
       "hardware_revision":REV,"source_tree_sha256":json.loads((HERE/"source-toolchain-lock.json").read_text())["source_tree_sha256"],
       "common_firmware_per_buyer":True,"private_key_included":False,"buyer_public_key_included":False,
       "usb_vid":0x1209,"usb_pid":0x0001,"usb_hardware_profile":"fixed-100","usb_descriptor_max_power_mA":100,
       "charging_enabled_for_physical_evt":True,"charging_release_status":"UNQUALIFIED_UNTIL_PHYSICAL_EVT_PASSES",
       "usb_id_allocation_evidence":"usb.txt","usb_id_allocation_evidence_sha256":artifacts["usb.txt"],
       "battery_cutoff_mv":3000,"battery_cutoff_evidence":"cutoff.json","battery_cutoff_evidence_sha256":artifacts["cutoff.json"],
       "firmware_image":"fw.bin","firmware_sha256":artifacts["fw.bin"],"elf":"fw.elf","elf_sha256":artifacts["fw.elf"],
       "map":"fw.map","map_sha256":artifacts["fw.map"],"option_bytes":{"BOR":"LEVEL_4"},
       "orders_payments_uploads_vendor_contacts_performed":False}
    mp=d/"manifest.json"; mp.write_text(json.dumps(m))
    fields=next(csv.reader((HERE/"five-unit-programming-record.template.csv").open()))
    rows=[]
    for i in range(1,6):
        lp=d/f"u{i}.log"; lp.write_text(f"log{i}")
        r={k:"" for k in fields}; r.update({"unit_id":f"U{i}","pcb_serial":f"PCB{i}","mcu_uid_hex":f"{i:024x}",
          "hardware_revision":REV,"firmware_sha256":m["firmware_sha256"],"elf_sha256":m["elf_sha256"],"map_sha256":m["map_sha256"],
          "usb_vid":hex(m["usb_vid"]),"usb_pid":hex(m["usb_pid"]),"battery_cutoff_mv":"3000","programmer_model_serial":"STLINK-1",
          "fixture_id":"FIX-1","program_start_utc":"2026-01-01T00:00:00Z","program_end_utc":"2026-01-01T00:01:00Z",
          "pogo_contact_attempts":"10","pogo_contact_successes":"10","vtref_mV":"3300","current_limit_trip":"0",
          "flash_verify":"PASS","BOR4_readback":"PASS","formal_usb_enumeration":"PASS",
          "charge_request_low_while_reset_asserted":"PASS","storage_rail_default_off":"PASS",
          "program_power_loss_injection_count":"1","power_loss_recovery":"PASS","raw_log_path":lp.name,
          "raw_log_sha256":sha(lp),"result_PASS_FAIL_NOT_RUN":"PASS"}); rows.append(r)
    rp=d/"record.csv"
    def write():
        with rp.open("w",newline="") as f: w=csv.DictWriter(f,fieldnames=fields); w.writeheader(); w.writerows(rows)
    write(); assert evaluate(mp,rp)["units"]==5
    mutations=[("duplicate_uid",lambda: rows[1].update(mcu_uid_hex=rows[0]["mcu_uid_hex"])),
               ("wrong_revision",lambda: rows[1].update(hardware_revision="WRONG")),
               ("wrong_hash",lambda: rows[1].update(firmware_sha256="0"*64)),
               ("failed_check",lambda: rows[1].update(flash_verify="FAIL")),
               ("duplicate_log_content",lambda: rows[1].update(raw_log_path=rows[0]["raw_log_path"],raw_log_sha256=rows[0]["raw_log_sha256"])),
               ("missing_log",lambda: rows[1].update(raw_log_path="missing.log")),
               ("path_traversal",lambda: rows[1].update(raw_log_path="../escape.log")),
               ("reverse_time",lambda: rows[1].update(program_end_utc="2025-01-01T00:00:00Z"))]
    for name,mutate in mutations:
        saved=dict(rows[1]); mutate(); write()
        try: evaluate(mp,rp); raise RuntimeError(name+" accepted")
        except AssertionError: pass
        rows[1]=saved
print("PASS_FACTORY_PROGRAMMING_EVALUATOR_SELFTEST")

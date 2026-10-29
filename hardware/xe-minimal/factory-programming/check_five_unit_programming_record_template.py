#!/usr/bin/env python3
from pathlib import Path
import csv

HERE = Path(__file__).resolve().parent
with (HERE / "five-unit-programming-record.template.csv").open(newline="") as stream:
    rows = list(csv.DictReader(stream))
assert [row["unit_id"] for row in rows] == [f"U{i}" for i in range(1, 6)]
assert all(row["result_PASS_FAIL_NOT_RUN"] == "NOT_RUN" for row in rows)
assert all(not row["pcb_serial"] and not row["mcu_uid_hex"] and not row["firmware_sha256"] for row in rows)
required = {"pcb_serial", "mcu_uid_hex", "hardware_revision", "firmware_sha256", "elf_sha256", "map_sha256",
            "usb_vid", "usb_pid", "battery_cutoff_mv", "programmer_model_serial", "fixture_id",
            "flash_verify", "BOR4_readback", "charge_request_low_while_reset_asserted", "storage_rail_default_off",
            "pogo_contact_attempts", "pogo_contact_successes", "vtref_mV", "current_limit_trip",
            "formal_usb_enumeration", "program_power_loss_injection_count", "power_loss_recovery",
            "raw_log_path", "raw_log_sha256", "result_PASS_FAIL_NOT_RUN"}
assert required <= set(rows[0])
print("PASS_FIVE_UNIT_PROGRAMMING_RECORD_TEMPLATE_COMPLETE_NOT_RUN")

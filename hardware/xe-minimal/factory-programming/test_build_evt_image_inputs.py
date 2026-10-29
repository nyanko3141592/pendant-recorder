#!/usr/bin/env python3
from pathlib import Path
import importlib.util
import json
import tempfile
import csv
from types import SimpleNamespace

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("builder", HERE / "build_evt_image.py")
builder = importlib.util.module_from_spec(spec); spec.loader.exec_module(builder)

with tempfile.TemporaryDirectory() as directory:
    root = Path(directory)
    usb = root / "usb.json"; cutoff = root / "cutoff.json"
    usb.write_text(json.dumps({"status":"ALLOCATED_USB_ID_EVIDENCE","usb_vid":0xCAFE,"usb_pid":0xBABE,"allocation_owner":"TEST","allocation_reference":"TEST-ONLY","evidence_date":"2099-01-01","evidence_source":"synthetic self-test"}))
    cutoff_spec = importlib.util.spec_from_file_location("cutoff", builder.ROOT / "docs/validation/evaluate_xe_battery_cutoff_results.py")
    cutoff_module = importlib.util.module_from_spec(cutoff_spec); cutoff_spec.loader.exec_module(cutoff_module)
    cutoff_csv = root / "cutoff.csv"; fields=next(csv.reader((builder.ROOT/"docs/validation/xe-battery-cutoff-results.template.csv").open())); cutoff_rows=[]
    for i in range(1,6):
        raw=root/f"pack{i}.csv";raw.write_text(f"synthetic pack {i}\n")
        row={k:"" for k in fields};row.update(pack_id=f"P{i}",evaluated_cutoff_mv="3400",minimum_stable_terminal_mv="3300",adc_error_margin_mv="20",rail_transient_margin_mv="20",repeatability_margin_mv="10",usable_capacity_to_cutoff_mAh="75",load_average_mA="4.4",load_peak_mA="110",peak_duration_ms="200",peak_repetition_s="5",continuous_discharge="1",storage_finalize_success="1",protection_trip_occurred="0",standby_entry_success="1",standby_current_uA="120",vbus_wakeup_reset_success="1",wake_to_charge_ms="500",post_wake_charge_current_mA="10",temperature_C="25",instrument_model_serial="SELFTEST",calibration_due_date="2099-01-01",start_utc="2026-01-01T00:00:00Z",end_utc="2026-01-01T20:00:00Z",raw_data_path=raw.name,raw_data_sha256=builder.sha(raw),result_PASS_FAIL_NOT_RUN="PASS");cutoff_rows.append(row)
    with cutoff_csv.open("w",newline="") as stream: writer=csv.DictWriter(stream,fieldnames=fields);writer.writeheader();writer.writerows(cutoff_rows)
    cutoff.write_text(json.dumps(cutoff_module.evaluate(cutoff_csv,3400),indent=2)+"\n")
    result = builder.validate_inputs(usb, cutoff, 0xCAFE, 0xBABE)
    assert result[3]["selected_cutoff_mv"] == 3400
    for vid, pid in ((1,2),(0x1234,0x5678),(0x1209,0x0001)):
        try: builder.validate_inputs(usb, cutoff, vid, pid)
        except ValueError: pass
        else: raise AssertionError("fixture/example IDs accepted")
    bad = json.loads(cutoff.read_text()); bad["tested_pack_ids"] = ["P1"]; cutoff.write_text(json.dumps(bad))
    try: builder.validate_inputs(usb, cutoff, 0xCAFE, 0xBABE)
    except ValueError: pass
    else: raise AssertionError("single-unit cutoff evidence accepted")
    # Restore valid synthetic evidence and execute the complete compiler/linker
    # path in a disposable directory.  The resulting image is deleted with the
    # temporary tree and is never a product allocation or physical result.
    bad["tested_pack_ids"] = [f"P{i}" for i in range(1,6)]; cutoff.write_text(json.dumps(bad))
    output = root / "evt-build"
    builder.build(SimpleNamespace(
        usb_allocation_evidence=str(usb), cutoff_evidence=str(cutoff), vid=0xCAFE, pid=0xBABE,
        output=str(output), firmware_version="XE-EVT-SELFTEST", source_revision="abcdef0"
    ))
    manifest = json.loads((output / "evt-programming-manifest.json").read_text())
    assert manifest["status"] == "EVT_IMAGE_COMPLETE_WITH_ALLOCATED_USB_IDS"
    assert manifest["hardware_revision"] == builder.HARDWARE_REVISION
    assert manifest["hardware_revision_source_sha256"] == builder.sha(builder.ROOT / "hardware/xe-minimal/prototype-architecture-v1.json")
    assert manifest["battery_cutoff_mv"] == 3400 and manifest["physical_flash_and_EVT"] == "NOT_RUN"
    assert manifest["usb_hardware_profile"] == "fixed-100"
    assert manifest["usb_descriptor_max_power_mA"] == 100
    assert manifest["charging_enabled_for_physical_evt"] is True
    assert manifest["charging_release_status"] == "UNQUALIFIED_UNTIL_PHYSICAL_EVT_PASSES"
    assert (output / manifest["firmware_image"]).is_file() and manifest["private_key_included"] is False
print("PASS_EVT_IMAGE_INPUT_VALIDATION_FAILS_CLOSED")

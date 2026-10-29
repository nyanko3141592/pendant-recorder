#!/usr/bin/env python3
from pathlib import Path
import csv,hashlib,tempfile
import evaluate_xe_battery_cutoff_results as e
HERE=Path(__file__).resolve().parent
with tempfile.TemporaryDirectory() as td:
 d=Path(td); fields=next(csv.reader((HERE/"xe-battery-cutoff-results.template.csv").open())); rows=[]
 for i in range(1,6):
  raw=d/f"p{i}.csv";raw.write_text(f"physical synthetic selftest pack {i}\n")
  r={k:"" for k in fields};r.update(pack_id=f"P{i}",evaluated_cutoff_mv="3400",minimum_stable_terminal_mv=str(3300+i),adc_error_margin_mv="20",rail_transient_margin_mv="30",repeatability_margin_mv="10",usable_capacity_to_cutoff_mAh="75",load_average_mA="4.4",load_peak_mA="110",peak_duration_ms="200",peak_repetition_s="5",continuous_discharge="1",storage_finalize_success="1",protection_trip_occurred="0",standby_entry_success="1",standby_current_uA="120",vbus_wakeup_reset_success="1",wake_to_charge_ms="500",post_wake_charge_current_mA="10",temperature_C="25",instrument_model_serial="SELFTEST",calibration_due_date="2099-01-01",start_utc="2026-01-01T00:00:00Z",end_utc="2026-01-01T20:00:00Z",raw_data_path=raw.name,raw_data_sha256=hashlib.sha256(raw.read_bytes()).hexdigest(),result_PASS_FAIL_NOT_RUN="PASS");rows.append(r)
 source=d/"cutoff.csv"
 def write():
  with source.open("w",newline="") as f:w=csv.DictWriter(f,fieldnames=fields);w.writeheader();w.writerows(rows)
 write(); result=e.evaluate(source,3400); out=d/"result.json";out.write_text(__import__('json').dumps(result,indent=2)+"\n");assert e.validate_result(out)==result
 for name,mutate in (("low_capacity",lambda:rows[0].update(usable_capacity_to_cutoff_mAh="70")),("reused_raw",lambda:rows[1].update(raw_data_path=rows[0]["raw_data_path"],raw_data_sha256=rows[0]["raw_data_sha256"])),("unsafe_threshold",lambda:rows[0].update(minimum_stable_terminal_mv="3390")),("negative_margin",lambda:rows[0].update(adc_error_margin_mv="-1")),("short_peak",lambda:rows[0].update(peak_duration_ms="199")),("protection_trip",lambda:rows[0].update(protection_trip_occurred="1")),("standby_high",lambda:rows[0].update(standby_current_uA="151")),("wake_failed",lambda:rows[0].update(vbus_wakeup_reset_success="0")),("charge_failed",lambda:rows[0].update(post_wake_charge_current_mA="8.9"))):
  saved=dict(rows[0]),dict(rows[1]);mutate();write()
  try:e.evaluate(source,3400);raise RuntimeError(name+" accepted")
  except ValueError:pass
  rows[0],rows[1]=saved;write()
print("PASS_FIVE_PACK_CUTOFF_EVALUATOR_SELFTEST")

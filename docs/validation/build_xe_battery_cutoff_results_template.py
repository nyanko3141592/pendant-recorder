#!/usr/bin/env python3
from pathlib import Path
import csv
HERE=Path(__file__).resolve().parent
fields="pack_id evaluated_cutoff_mv minimum_stable_terminal_mv adc_error_margin_mv rail_transient_margin_mv repeatability_margin_mv usable_capacity_to_cutoff_mAh load_average_mA load_peak_mA peak_duration_ms peak_repetition_s continuous_discharge storage_finalize_success protection_trip_occurred standby_entry_success standby_current_uA vbus_wakeup_reset_success wake_to_charge_ms post_wake_charge_current_mA temperature_C instrument_model_serial calibration_due_date start_utc end_utc raw_data_path raw_data_sha256 result_PASS_FAIL_NOT_RUN deviation_notes".split()
with (HERE/"xe-battery-cutoff-results.template.csv").open("w",newline="") as f:
 w=csv.DictWriter(f,fieldnames=fields);w.writeheader()
 for i in range(1,6):
  r={k:"" for k in fields};r.update(pack_id=f"P{i}",result_PASS_FAIL_NOT_RUN="NOT_RUN");w.writerow(r)
print("GENERATED_FIVE_PACK_CUTOFF_TEMPLATE_NOT_RUN")

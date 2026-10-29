#!/usr/bin/env python3
from pathlib import Path
from datetime import datetime,date
import argparse,csv,hashlib,json,math
HERE=Path(__file__).resolve().parent
PLAN=HERE/"xe-battery-cutoff-characterization-plan.json"
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def num(r,k):
 v=float(r[k]);
 if not math.isfinite(v): raise ValueError(k)
 return v
def evaluate(source,selected):
 plan=json.loads(PLAN.read_text()); rows=list(csv.DictReader(source.open(newline="")))
 if [r["pack_id"] for r in rows] != [f"P{i}" for i in range(1,6)]: raise ValueError("exact P1-P5 required")
 if not isinstance(selected,int) or not 3000<=selected<=4200: raise ValueError("selected cutoff range")
 safe=[]; capacities=[]; averages=[]; peaks=[]; standby_currents=[]; wake_times=[]; wake_charge=[]; raw_hashes=[]
 for r in rows:
  if int(r["evaluated_cutoff_mv"])!=selected: raise ValueError("mixed evaluated cutoff")
  margins=[num(r,"adc_error_margin_mv"),num(r,"rail_transient_margin_mv"),num(r,"repeatability_margin_mv")]
  if any(v<0 for v in margins): raise ValueError("negative margin")
  stable=num(r,"minimum_stable_terminal_mv")
  if not 2500<=stable<=4200: raise ValueError("minimum stable voltage range")
  safe.append(math.ceil(stable+sum(margins)))
  capacities.append(num(r,"usable_capacity_to_cutoff_mAh"));averages.append(num(r,"load_average_mA"));peaks.append(num(r,"load_peak_mA"))
  if num(r,"peak_duration_ms")<200 or not 0<num(r,"peak_repetition_s")<=5: raise ValueError("peak timing")
  if r["continuous_discharge"]!="1" or r["storage_finalize_success"]!="1" or r["protection_trip_occurred"]!="0": raise ValueError("unsafe pack result")
  if r["standby_entry_success"]!="1" or r["vbus_wakeup_reset_success"]!="1": raise ValueError("low-battery standby/wake failure")
  standby_currents.append(num(r,"standby_current_uA"));wake_times.append(num(r,"wake_to_charge_ms"));wake_charge.append(num(r,"post_wake_charge_current_mA"))
  if not 0<=standby_currents[-1]<=150 or not 0<wake_times[-1]<=1000 or not 9<=wake_charge[-1]<=11: raise ValueError("low-battery standby current or USB recovery")
  if not 23<=num(r,"temperature_C")<=27: raise ValueError("temperature outside 25C characterization")
  start=datetime.fromisoformat(r["start_utc"].replace("Z","+00:00"));end=datetime.fromisoformat(r["end_utc"].replace("Z","+00:00"))
  if start.utcoffset() is None or start.utcoffset().total_seconds()!=0 or end.utcoffset() is None or end.utcoffset().total_seconds()!=0 or end<=start: raise ValueError("timestamps")
  if date.fromisoformat(r["calibration_due_date"])<start.date() or not r["instrument_model_serial"].strip(): raise ValueError("calibration")
  raw_name=Path(r["raw_data_path"])
  if raw_name.is_absolute() or ".." in raw_name.parts: raise ValueError("raw path")
  raw=(source.parent/raw_name).resolve()
  if not raw.is_relative_to(source.parent.resolve()) or not raw.is_file() or sha(raw)!=r["raw_data_sha256"]: raise ValueError("raw evidence")
  if r["raw_data_sha256"] in raw_hashes: raise ValueError("raw evidence reused")
  raw_hashes.append(r["raw_data_sha256"])
  if r["result_PASS_FAIL_NOT_RUN"]!="PASS" or r["deviation_notes"].strip(): raise ValueError("result or deviation")
 worst=max(safe);minimum_capacity=min(capacities)
 if selected<worst or minimum_capacity<70.4 or min(averages)<4.4 or min(peaks)<110: raise ValueError("cutoff unsafe or insufficient capacity")
 return {"status":"BATTERY_CUTOFF_SELECTED_FROM_FIVE_PACK_PHYSICAL_CHARACTERIZATION","battery_mpn":"DTP401525-XE","capacity_mAh":110,
  "tested_pack_ids":[f"P{i}" for i in range(1,6)],"selected_cutoff_mv":selected,"minimum_safe_cutoff_mv":worst,
  "minimum_usable_capacity_to_selected_cutoff_mAh":minimum_capacity,"load_average_mA":min(averages),"load_peak_mA":min(peaks),
  "load_peak_duration_ms_min":min(num(r,"peak_duration_ms") for r in rows),"load_peak_repetition_s_max":max(num(r,"peak_repetition_s") for r in rows),
  "standby_current_uA_max":max(standby_currents),"wake_to_charge_ms_max":max(wake_times),"post_wake_charge_current_mA_min":min(wake_charge),"post_wake_charge_current_mA_max":max(wake_charge),
  "all_packs_passed":True,"input_csv":source.name,"input_csv_sha256":sha(source),"raw_evidence_manifest_sha256":sha(source)}
def validate_result(path):
 saved=json.loads(path.read_text()); source=(path.parent/saved["input_csv"]).resolve()
 rebuilt=evaluate(source,saved["selected_cutoff_mv"])
 if saved!=rebuilt: raise ValueError("cutoff result is not reproducible from raw ledger")
 return saved
if __name__=="__main__":
 ap=argparse.ArgumentParser();ap.add_argument("--input",type=Path,required=True);ap.add_argument("--selected-cutoff-mv",type=int,required=True);ap.add_argument("--output",type=Path,required=True);a=ap.parse_args()
 try:
  result=evaluate(a.input.resolve(),a.selected_cutoff_mv);a.output.resolve().write_text(json.dumps(result,indent=2)+"\n")
 except (ValueError,OSError,KeyError) as e: ap.exit(1,f"HOLD_INVALID_CUTOFF_EVIDENCE: {e}\n")
 print(json.dumps({"status":result["status"],"selected_cutoff_mv":result["selected_cutoff_mv"]}))

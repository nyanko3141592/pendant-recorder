#!/usr/bin/env python3
"""Generate the complete five-unit EVT evidence ledger. No physical result is implied."""
from pathlib import Path
import csv
import json

ROOT = Path(__file__).resolve().parents[2]
PLAN_PATH = ROOT / "docs/validation/xe-current-five-unit-evt-plan.json"
OUT = ROOT / "docs/validation/xe-evt1-results-template.csv"
plan = json.loads(PLAN_PATH.read_text())
plan_id = plan["plan_id"]
units = [f"U{i}" for i in range(1, 6)]

fields = [
    "plan_id", "gate", "unit_id", "run_id", "condition", "metric", "value", "unit",
    "lower_limit", "upper_limit", "result_PASS_FAIL_NOT_RUN", "raw_data_path",
    "raw_data_sha256", "pcb_sha256", "firmware_sha256", "bom_revision", "case_revision",
    "pcb_serial", "mcu_uid_hex", "storage_device_identity",
    "case_material", "lower_print_orientation", "upper_print_orientation", "layer_height_mm",
    "wall_count", "support", "battery_serial_or_lot", "cord_material", "cord_diameter_mm",
    "cord_lot", "cord_mpn", "cord_breakaway_claim_reference", "cord_breakaway_claim_sha256",
    "cord_risk_assessment_id", "approved_breakaway_min_N", "approved_breakaway_max_N",
    "instrument_model_serial", "calibration_due_date", "ambient_C",
    "humidity_percent", "start_utc", "end_utc", "operator", "deviation_and_failure_notes",
    "host_os_name", "host_os_version", "host_importer_sha256", "age_tool_version", "ffmpeg_version",
    "usb_cable_id", "usb_cable_type", "usb_overmold_width_mm", "usb_overmold_height_mm",
]
rows = []

def add(gate, unit_id, condition, metric, measurement_unit, lower="", upper=""):
    row = {field: "" for field in fields}
    row.update({"plan_id": plan_id, "gate": gate, "unit_id": unit_id,
                "condition": condition, "metric": metric, "unit": measurement_unit,
                "lower_limit": str(lower), "upper_limit": str(upper),
                "result_PASS_FAIL_NOT_RUN": "NOT_RUN"})
    rows.append(row)

for u in units:
    # Receiving inspection is a safety gate: an exact, finished three-wire pack
    # must be identified before any powered test.  These limits mirror the
    # controlled DTP401525-XE purchase specification.
    for condition, metric, measurement_unit, lower, upper in [
        ("battery_receiving_identity", "exact_DTP401525_XE_finished_pack", "boolean", 1, 1),
        ("battery_receiving_connector", "Molex_781720003_match", "boolean", 1, 1),
        ("battery_receiving_pinout", "pin1_BATplus_pin2_NTC_pin3_BATminus_match", "boolean", 1, 1),
        ("battery_receiving_dimensions", "battery_width", "mm", 0, 15.5),
        ("battery_receiving_dimensions", "battery_length", "mm", 0, 27.0),
        ("battery_receiving_dimensions", "battery_thickness", "mm", 0, 4.2),
        ("battery_receiving_harness", "lead_length", "mm", 12, 18),
        ("battery_receiving_harness", "protection_and_finished_harness_present", "boolean", 1, 1),
        ("battery_receiving_condition", "damage_or_swelling_present", "boolean", 0, 0),
    ]: add("A", u, condition, metric, measurement_unit, lower, upper)
    for condition, metric, measurement_unit, lower, upper in [
        ("unpowered_rail_resistance_raw_evidence", "no_unintended_short", "boolean", 1, 1),
        ("MCU_held_reset", "charge_permission", "boolean", 0, 0),
        ("firmware_absent", "charge_permission", "boolean", 0, 0),
        ("brownout", "charge_permission", "boolean", 0, 0),
        ("pack_NTC_open", "battery_charge_current", "mA", 0, 0),
        ("pack_NTC_short", "battery_charge_current", "mA", 0, 0),
        ("comparator_input_open", "charge_permission", "boolean", 0, 0),
        ("comparator_input_short", "charge_permission", "boolean", 0, 0),
        ("Q4_gate_stuck_low_equivalent", "charge_permission", "boolean", 0, 0),
        ("current_limited_0_to_5p25V_startup", "no_current_limit_trip_during_nominal_startup", "boolean", 1, 1),
        ("current_limited_0_to_5p25V_startup", "no_rail_overvoltage", "boolean", 1, 1),
        ("thermal_image_raw_evidence", "no_smoke_odor_damage_or_abnormal_heating", "boolean", 1, 1),
    ]: add("A", u, condition, metric, measurement_unit, lower, upper)
    for rail in ("BAT", "SYS", "V3V3", "SD_V3"):
        condition = f"current_limited_battery_simulator_{rail}_to_GND_short"
        for metric, measurement_unit, lower, upper in [
            ("real_cell_connected", "boolean", 0, 0),
            ("charge_permission", "boolean", 0, 0),
            ("simulator_voltage", "V", 4.15, 4.25),
            ("simulator_current_limit", "mA", 100, 110),
            ("fault_duration", "s", 1, ""),
            ("peak_surface_temperature", "C", "", 60),
            ("smoke_fire_odor_rupture_or_leakage", "boolean", 0, 0),
            ("safe_recovery_after_fault_removal", "boolean", 1, 1),
        ]: add("A", u, condition, metric, measurement_unit, lower, upper)
    for condition, metric, measurement_unit, lower, upper in [
        ("USB_4p75V_normal", "USB_input_current_max", "mA", 0, 100),
        ("USB_5p00V_normal", "USB_input_current_max", "mA", 0, 100),
        ("USB_5p25V_normal", "USB_input_current_max", "mA", 0, 100),
        ("TPS2552_forced_current_limit", "USB_input_current", "mA", 50, 100),
        ("TPS2552_output_short_latch_and_USB_power_cycle_recovery", "real_cell_connected", "boolean", 0, 0),
        ("TPS2552_output_short_latch_and_USB_power_cycle_recovery", "current_limited_source_used", "boolean", 1, 1),
        ("TPS2552_output_short_latch_and_USB_power_cycle_recovery", "sustained_short_duration", "s", 1, ""),
        ("TPS2552_output_short_latch_and_USB_power_cycle_recovery", "USB_input_current_during_short", "mA", 50, 100),
        ("TPS2552_output_short_latch_and_USB_power_cycle_recovery", "latch_off_on_sustained_short", "boolean", 1, 1),
        ("TPS2552_output_short_latch_and_USB_power_cycle_recovery", "restart_before_USB_power_cycle", "boolean", 0, 0),
        ("TPS2552_output_short_latch_and_USB_power_cycle_recovery", "recovery_after_USB_power_cycle", "boolean", 1, 1),
        ("TPS2552_output_short_latch_and_USB_power_cycle_recovery", "damage_smoke_odor_or_abnormal_heating", "boolean", 0, 0),
        ("TPS2552_output_short_latch_and_USB_power_cycle_recovery", "peak_surface_temperature", "C", "", 60),
        ("dead_battery_startup", "safe_recovery", "boolean", 1, 1),
        ("dead_battery_startup", "peak_BQ25185_CE_plus_measurement_uncertainty", "mV", 0, 5499),
        ("dead_battery_startup", "BQ25185_CE_min_after_SYS_reaches_1p8V_until_firmware_grant", "mV", 1400, ""),
        ("dead_battery_startup", "battery_charge_current_before_firmware_grant", "mA", 0, 0),
        ("dead_battery_startup", "firmware_charge_grant_delay_after_accepted_USB_input", "ms", 10, ""),
        ("low_battery_controlled_stop_no_VBUS", "standby_entry_success", "boolean", 1, 1),
        ("low_battery_controlled_stop_no_VBUS", "completed_device_battery_current", "uA", 0, 150),
        ("low_battery_USB_attach_wakeup", "vbus_wakeup_reset_success", "boolean", 1, 1),
        ("low_battery_USB_attach_wakeup", "wake_to_charge", "ms", 0, 1000),
        ("low_battery_USB_attach_wakeup", "battery_charge_current", "mA", 9, 11),
        ("low_battery_USB_attach_wakeup", "completed_file_loss_count", "count", 0, 0),
        ("terminal_recording_fault_no_VBUS", "standby_entry_success", "boolean", 1, 1),
        ("terminal_recording_fault_no_VBUS", "completed_device_battery_current", "uA", 0, 150),
        ("terminal_recording_fault_no_VBUS", "SD_EN_low_before_standby", "boolean", 1, 1),
        ("terminal_recording_fault_no_VBUS", "completed_file_loss_count", "count", 0, 0),
        ("runtime_battery_ADC_three_consecutive_failures", "terminal_fault_entered_within", "ms", 0, 3500),
        ("runtime_battery_ADC_three_consecutive_failures", "completed_device_battery_current", "uA", 0, 150),
        ("runtime_battery_ADC_three_consecutive_failures", "completed_file_loss_count", "count", 0, 0),
        ("runtime_battery_measurement_starved", "terminal_fault_entered_within", "ms", 0, 5500),
        ("runtime_battery_measurement_starved", "completed_device_battery_current", "uA", 0, 150),
        ("runtime_battery_measurement_starved", "completed_file_loss_count", "count", 0, 0),
        ("J2_empty_USB_power_for_factory_programming", "safe_powerup_and_stable_VTREF", "boolean", 1, 1),
        ("USB_insert_remove_and_brownout", "safe_recovery", "boolean", 1, 1),
        ("USB_attached_before_configuration", "battery_charge_current", "mA", 9, 11),
        ("USB_deconfigured", "battery_charge_current", "mA", 9, 11),
        ("power_only_USB_C_to_C_adapter", "battery_charge_current", "mA", 9, 11),
        ("power_only_USB_C_to_C_adapter", "USB_input_current_max", "mA", 0, 100),
        ("power_only_USB_A_to_C_adapter", "battery_charge_current", "mA", 9, 11),
        ("power_only_USB_A_to_C_adapter", "USB_input_current_max", "mA", 0, 100),
        ("USB_detached", "battery_charge_current", "mA", 0, 0),
        ("charge_start_stop_transient", "no_chatter_or_dangerous_overshoot", "boolean", 1, 1),
        ("charge_start_stop_transient", "peak_BQ25185_CE_plus_measurement_uncertainty", "mV", 0, 5499),
        ("Dplus_Dminus_short", "safe_behavior", "boolean", 1, 1),
        ("CC_open", "charge_permission", "boolean", 0, 0),
        ("suspend_resume", "safe_recovery", "boolean", 1, 1),
        ("USB_suspended", "battery_charge_current", "mA", 0, 0),
        ("MCU_reset", "charge_permission", "boolean", 0, 0),
        ("NTC_open", "battery_charge_current", "mA", 0, 0),
        ("NTC_short", "battery_charge_current", "mA", 0, 0),
        ("NTC_0C", "battery_charge_current", "mA", 0, 0),
        ("NTC_10C", "battery_charge_current", "mA", 9, 11),
        ("NTC_45C", "battery_charge_current", "mA", 0, 0),
        ("NTC_25C", "battery_charge_current", "mA", 9, 11),
        ("NTC_35C", "battery_charge_current", "mA", 9, 11),
        ("cold_temperature_down_sweep", "charge_stop_surface_temperature", "C", 0, 5),
        ("cold_temperature_up_sweep", "charge_recovery_surface_temperature", "C", 5, 10),
        ("hot_temperature_up_sweep", "charge_stop_surface_temperature", "C", 40, 45),
        ("hot_temperature_down_sweep", "charge_recovery_surface_temperature", "C", 35, 40),
        ("cold_temperature_bidirectional_sweep", "charge_enable_chatter_count", "count", 0, 0),
        ("hot_temperature_bidirectional_sweep", "charge_enable_chatter_count", "count", 0, 0),
        ("USB_suspend_raw_current_evidence", "safe_suspend_behavior", "boolean", 1, 1),
        ("C31_C32_5p25V_raw_capacitance_evidence", "effective_capacitance_requirement_met", "boolean", 1, 1),
        ("C33_20V_DC_bias_raw_capacitance_evidence", "effective_capacitance_and_voltage_rating_requirement_met", "boolean", 1, 1),
        ("VIN_VOUT_transient", "sustained_oscillation", "boolean", 0, 0),
        ("thermal_image_raw_evidence", "no_pack_or_case_temperature_violation", "boolean", 1, 1),
    ]: add("B", u, condition, metric, measurement_unit, lower, upper)
    for temperature in (0, 10, 25, 35, 45):
        add("B", u, f"pack_NTC_{temperature}C_raw_resistance", "pack_NTC_resistance", "ohm", 1, "")
    add("B", u, "pack_NTC_0_10_25_35_45C_curve", "NTC_resistance_strictly_decreases_with_temperature", "boolean", 1, 1)
    for voltage in (6, 9, 12, 20):
        for slew in ("0p1", "1", "10"):
            condition = f"NCP360_abnormal_input_{voltage}V_slew_{slew}V_per_us_current_limited_battery_simulator"
            add("B", u, condition, "NCP360_disconnect_success", "boolean", 1, 1)
            add("B", u, condition, "real_cell_connected", "boolean", 0, 0)
            add("B", u, condition, "downstream_absolute_maximum_violation", "boolean", 0, 0)
            add("B", u, condition, "damage_smoke_odor_or_abnormal_heating", "boolean", 0, 0)
            add("B", u, condition, "peak_VBUS_OVP_plus_measurement_uncertainty", "mV", 0, 6499)
            add("B", u, condition, "peak_VBUS_CHARGER_plus_measurement_uncertainty", "mV", 0, 6499)
    runtime_metrics = [
        ("elapsed_recording_time", "s", 57600, ""),
        ("average_battery_current", "mA", 0, 4.4),
        ("integrated_battery_charge", "mAh", 0, 70.4),
        ("instantaneous_battery_current_max", "mA", 0, 110),
        ("decoded_sample_count", "samples", 921600000, ""),
        ("decoded_sample_rate", "Hz", 16000, ""),
        ("decoded_channel_count", "channels", 1, 1),
        ("recording_pause_duration", "s", 0, 0),
        ("scheduled_silence_recorded_duration", "s", 43200, ""),
        ("file_sequence_gap_count", "count", 0, 0),
        ("duplicate_sample_count", "count", 0, 0),
        ("reset_count", "count", 0, 0),
        ("unfinished_file_count", "count", 0, 0),
        ("storage_reinitialization_count", "count", 0, 0),
        ("battery_replacement_count", "count", 0, 0),
        ("external_power_present_duration", "s", 0, 0),
        ("external_time_reference_full_duration_match", "boolean", 1, 1),
    ]
    for condition in ("16h_continuous_recording_25C", "16h_endpoint_repeat_10C", "16h_endpoint_repeat_35C"):
        for metric, measurement_unit, lower, upper in runtime_metrics:
            add("C", u, condition, metric, measurement_unit, lower, upper)
        for metric, measurement_unit, lower, upper in [
            ("assigned_cutoff_characterization_pack_match", "boolean", 1, 1),
            ("onboard_BQ25185_charge_only", "boolean", 1, 1),
            ("pre_run_charge_current", "mA", 9, 11),
            ("charge_termination_observed", "boolean", 1, 1),
            ("USB_removed_before_temperature_conditioning", "boolean", 1, 1),
            ("target_temperature_stabilization", "s", 1800, ""),
            ("battery_surface_temperature_within_target", "C_delta_abs", 0, 2),
            ("pre_run_OCV_recorded", "boolean", 1, 1),
            ("pack_cycle_count_recorded", "boolean", 1, 1),
            ("declared_per_unit_temperature_order_followed", "boolean", 1, 1),
        ]: add("C", u, condition, metric, measurement_unit, lower, upper)

# U1 accumulates 36 h over three battery-only recording sessions on one unchanged
# storage device and the same recharged pack. Continuous 16 h remains Gate C.
# U2-U5 still prove decrypt/export/storage recovery functionality.
for metric, measurement_unit, lower, upper in [
    ("cumulative_recording_time", "s", 129600, ""),
    ("recording_session_count", "count", 3, 3),
    ("inter_session_charge_count", "count", 2, 2),
    ("battery_replacement_count", "count", 0, 0),
    ("external_power_present_during_recording", "s", 0, 0),
    ("storage_format_delete_or_cleanup_count", "count", 0, 0),
    ("completed_encrypted_file_count", "count", 25920, ""),
    ("successfully_decrypted_file_count", "count", 25920, ""),
    ("decoded_sample_count", "samples", 2073600000, ""),
    ("decoded_sample_rate", "Hz", 16000, ""),
    ("decoded_channel_count", "channels", 1, 1),
    ("file_sequence_gap_count", "count", 0, 0),
    ("duplicate_sample_count", "count", 0, 0),
    ("unfinished_file_count", "count", 0, 0),
    ("decryption_failure_count", "count", 0, 0),
    ("decoded_sample_count_match", "boolean", 1, 1),
    ("persistent_plaintext_audio_count", "count", 0, 0),
    ("completed_file_loss_count", "count", 0, 0),
]: add("D", "U1", "36h_encrypted_storage", metric, measurement_unit, lower, upper)
for session in range(1, 4):
    add("D", "U1", f"36h_recording_session_{session}", "elapsed_recording_time", "s", 1, "")
add("D", "U1", "power_loss_injected", "completed_file_loss_count", "count", 0, 0)
add("D", "U1", "power_loss_injected", "only_incomplete_tail_lost", "boolean", 1, 1)
add("D", "U1", "capacity_limit_reached", "completed_file_loss_count", "count", 0, 0)
add("D", "U1", "capacity_limit_reached", "capacity_limit_physically_reached", "boolean", 1, 1)
add("D", "U1", "capacity_limit_reached", "new_recording_refused_without_overwrite", "boolean", 1, 1)
add("D", "U1", "capacity_limit_reached", "preexisting_encrypted_file_hash_mismatch_count", "count", 0, 0)
for u in units[1:]:
    add("D", u, "functional_confirmation", "encrypt_import_decrypt_match", "boolean", 1, 1)
    add("D", u, "power_loss_recovery", "completed_file_loss_count", "count", 0, 0)

for u in units:
    add("E", u, "USB_enumeration", "composite_MSC_HID_enumeration", "boolean", 1, 1)
    add("E", u, "first_use_HID", "recipient_write_once_and_readback", "boolean", 1, 1)
    add("E", u, "first_use_HID_without_button_hold", "recipient_commit_occurred", "boolean", 0, 0)
    add("E", u, "first_use_HID_continuous_2s_button_hold", "recipient_write_once_and_readback", "boolean", 1, 1)
    add("E", u, "unprovisioned_device", "plaintext_recording_created", "boolean", 0, 0)
    add("E", u, "MSC_read_only", "write_and_format_rejected", "boolean", 1, 1)
    add("E", u, "verified_cleanup_without_two_second_hold", "cleanup_accepted", "boolean", 0, 0)
    add("E", u, "verified_cleanup_after_two_second_hold", "queued_then_applied_after_device_ownership", "boolean", 1, 1)
    add("E", u, "failed_or_incomplete_import", "source_preserved", "boolean", 1, 1)
    add("E", u, "dual_mount_attempt", "dual_mount_occurred", "boolean", 0, 0)
    add("E", u, "storage_ownership_return", "recording_resumed_only_after_return", "boolean", 1, 1)
for condition in ("macOS_C_to_C", "Windows_C_to_C", "Linux_C_to_C"):
    add("E", "U1", condition, "enumerate_import_decrypt_play", "boolean", 1, 1)
for u in units:
    for cable in range(1, 7):
        add("E", u, f"USB_cable_{cable}", "full_insertion_charge_and_data", "boolean", 1, 1)

for u in units:
    for condition, metric, measurement_unit, lower, upper in [
        ("cord_proof_vertical", "proof_load", "N", 50, ""),
        ("cord_proof_vertical", "proof_duration", "s", 10, ""),
        ("cord_proof_lateral", "proof_load", "N", 50, ""),
        ("cord_proof_lateral", "proof_duration", "s", 10, ""),
        ("cord_proof_torsional", "proof_load", "N", 50, ""),
        ("cord_proof_torsional", "proof_duration", "s", 10, ""),
        ("cord_fatigue_15N", "fatigue_load", "N", 15, ""),
        ("cord_fatigue_15N", "fatigue_cycles", "cycles", 10000, ""),
        ("cord_sliding", "sliding_cycles", "cycles", 10000, ""),
        ("drop_all_faces_edges_corners", "drop_height", "m", 1.0, ""),
        ("drop_all_faces_edges_corners", "drop_orientations_completed", "count", 26, ""),
        ("worn_orientation", "USB_axis_parallel_to_body", "boolean", 1, 1),
        ("worn_orientation", "sideways_or_backwards_hang", "boolean", 0, 0),
        ("post_durability_inspection", "crack_whitening_delamination_or_case_opening", "boolean", 0, 0),
        ("post_durability_inspection", "dangerous_hole_wear", "boolean", 0, 0),
        ("loaded_internal_inspection", "load_transfer_to_pouch_or_harness", "boolean", 0, 0),
        ("post_durability_USB_fit", "USB_half_insertion", "boolean", 0, 0),
    ]: add("F", u, condition, metric, measurement_unit, lower, upper)
    for cable in range(1, 7):
        add("F", u, f"USB_cable_{cable}_physical_fit", "connector_shell_fully_seated_without_case_or_overmold_interference", "boolean", 1, 1)
        add("F", u, f"USB_cable_{cable}_physical_fit", "charge_and_data_after_full_insertion", "boolean", 1, 1)
    for state in ("new", "after_sweat_equivalent", "after_10000_hole_slides"):
        for pull in range(1, 11):
            add("F", u, f"breakaway_{state}_pull_{pull}", "release_force_within_approved_manufacturer_and_risk_window", "boolean", 1, 1)
    add("F", u, "breakaway_post_test", "dangerous_detached_small_part_or_sharp_conductive_exposure", "boolean", 0, 0)

with OUT.open("w", newline="") as stream:
    writer = csv.DictWriter(stream, fieldnames=fields)
    writer.writeheader()
    writer.writerows(rows)
print(json.dumps({"status": "GENERATED_NOT_RUN", "rows": len(rows), "units": units}))

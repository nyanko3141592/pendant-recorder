"""Fail closed when the current five-unit EVT plan loses a required release gate."""

import csv
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
PLAN = ROOT / "docs/validation/xe-current-five-unit-evt-plan.json"
PROCEDURE = ROOT / "docs/prototype-v1-assembly-and-test.md"
RESULT_TEMPLATE = ROOT / "docs/validation/xe-evt1-results-template.csv"

plan = json.loads(PLAN.read_text())
procedure = PROCEDURE.read_text()
gates = {gate["id"]: gate for gate in plan["gates"]}
with RESULT_TEMPLATE.open(newline="") as stream:
    result_rows = list(csv.DictReader(stream))

assert plan["status"] == "READY_FOR_PHYSICAL_EXECUTION_NOT_RUN"
assert plan["prototype_count"] == 5
assert "pcb_serial_unique_and_bound_to_unit_id" in plan["common_evidence_fields"]
assert "STM32_96bit_mcu_uid_unique_and_bound_to_unit_id" in plan["common_evidence_fields"]
assert set(gates) == set("ABCDEF")
assert all(gate["result"] == "NOT_RUN" for gate in gates.values())
assert plan["execution_order"] == [
    "A_receiving_unpowered_and_current_limited_non_destructive_fault_screen_all_5",
    "B_charge_temperature_and_USB_fault_safety_all_5_without_real_cell_for_abnormal_voltage",
    "C_three_16h_temperature_runs_all_5_before_any_mechanical_destructive_test",
    "D_36h_storage_and_controlled_power_loss_then_E_three_OS_USB",
    "F_mechanical_proof_fatigue_wear_and_drop_last",
]
assert "never_reuse_a_failed_or_mechanically_destructively_tested_unit_for_gate_C" in plan["stop_rule"]
assert gates["C"]["duration_s_min"] >= 16 * 3600
assert gates["C"]["cutoff_pack_to_completed_unit_assignment"] == {f"U{i}": f"P{i}" for i in range(1, 6)}
assert set(tuple(order) for order in gates["C"]["temperature_run_order_by_unit"].values()) >= {(25, 10, 35), (10, 35, 25), (35, 25, 10)}
assert all(sorted(order) == [10, 25, 35] for order in gates["C"]["temperature_run_order_by_unit"].values())
assert gates["C"]["pre_run_conditioning"]["target_ambient_stabilization_s_min"] == 1800
assert gates["C"]["pre_run_conditioning"]["charger"] == "same_completed_device_onboard_BQ25185_only"
assert gates["C"]["audio"]["sample_rate_Hz_min"] >= 16000
assert gates["C"]["audio"]["channels"] == 1
assert gates["C"]["audio"]["VAD_or_pause"] is False
assert gates["C"]["electrical_limits"] == {
    "average_battery_current_mA_max": 4.4,
    "integrated_charge_mAh_max": 70.4,
    "instantaneous_battery_current_mA_max": 110,
}
assert gates["D"]["duration_s_min"] >= 36 * 3600
assert "TPS2552_VIN_and_VOUT_oscilloscope_waveforms" in gates["B"]["required_measurements"]
assert "C31_C32_5p25V_effective_capacitance_evidence" in gates["B"]["required_measurements"]
assert "C33_20V_DC_bias_effective_capacitance_and_voltage_rating_evidence" in gates["B"]["required_measurements"]
assert "C33_35V_rating_and_20V_DC_bias_effective_capacitance_are_supported_by_lot_specific_evidence" in gates["B"]["acceptance"]
assert "TPS2552_output_short_latch_and_USB_power_cycle_recovery" in gates["B"]["faults"]
for voltage in (6, 9, 12, 20):
    assert f"NCP360_abnormal_input_{voltage}V_current_limited_battery_simulator" in gates["B"]["faults"]
assert "NCP360_VIN_and_VOUT_oscilloscope_waveforms_at_0p1_1_and_10V_per_us_input_slew" in gates["B"]["required_measurements"]
assert "peak_VBUS_OVP_and_VBUS_CHARGER_plus_measurement_uncertainty_strictly_below_6p5V_for_0p1_1_and_10V_per_us_slew" in gates["B"]["acceptance"]
assert "TPS2552_latches_off_on_sustained_short_and_does_not_restart_until_USB_power_cycle" in gates["B"]["acceptance"]
assert "NCP360_disconnects_VBUS_OVP_and_VBUS_CHARGER_at_6_9_12_20V_without_real_cell" in gates["B"]["acceptance"]
assert "dead_battery_startup" in gates["B"]["faults"]
assert "low_battery_controlled_stop_no_VBUS" in gates["B"]["faults"]
assert "low_battery_USB_attach_wakeup" in gates["B"]["faults"]
assert "low_battery_standby_current_le_150uA_and_VBUS_reset_wake_to_9_11mA_charge_le_1000ms" in gates["B"]["acceptance"]
assert "J2_empty_USB_power_for_factory_programming" in gates["B"]["faults"]
assert "J2_empty_USB_power_provides_stable_VTREF_without_charge_permission" in gates["B"]["acceptance"]
for condition in ("USB_attached_before_configuration", "USB_deconfigured", "USB_detached", "USB_suspended", "power_only_USB_C_to_C_adapter", "power_only_USB_A_to_C_adapter"):
    assert condition in gates["B"]["faults"]
assert "fixed_100mA_path_charges_at_9_to_11mA_before_configuration_and_when_deconfigured" in gates["B"]["acceptance"]
assert "power_only_C_to_C_and_A_to_C_adapters_charge_without_USB_enumeration" in gates["B"]["acceptance"]
assert "charge_current_zero_when_USB_detached_or_suspended" in gates["B"]["acceptance"]
assert "input_current_between_50_and_100mA_during_forced_current_limit_at_5p25V" in gates["B"]["acceptance"]
assert "no_sustained_oscillation_or_dangerous_VOUT_overshoot" in gates["B"]["acceptance"]
assert "macOS_Windows_Linux" in gates["E"]["sample_scope"]
for required in (
    "enumerate_composite_read_only_MSC_and_HID_with_OS_standard_drivers",
    "first_use_public_recipient_requires_continuous_two_second_button_hold_then_write_once_and_readback",
    "verified_cleanup_is_queued_over_HID_and_applied_only_after_device_ownership_returns",
    "MSC_WRITE_and_format_are_rejected",
):
    assert required in gates["E"]["acceptance"]
assert any(row["condition"] == "first_use_HID_without_button_hold" and row["upper_limit"] == "0" for row in result_rows)
assert any(row["condition"] == "first_use_HID_continuous_2s_button_hold" and row["lower_limit"] == "1" for row in result_rows)
assert gates["F"]["loads"]["proof_N"] == 50
assert gates["F"]["loads"]["fatigue_cycles"] == 10000
assert gates["F"]["loads"]["cord_sliding_cycles"] == 10000
assert gates["F"]["cord_diameters_mm"] == [2, 2.5, 3]
assert gates["F"]["wearable_cord_safety"]["production_cord"] == "RNST04BK_single_retail_candidate_selected_not_adopted"
assert gates["F"]["wearable_cord_safety"]["release_repeats_per_state_per_unit"] == 10
assert gates["F"]["USB_fit"] == {
    "cables_per_unit_min": 6,
    "required_types": ["USB_C_to_C", "USB_A_to_C"],
    "record_each_overmold_width_and_height": True,
    "universal_USB_C_fit_claimed": False,
}
assert plan["release_rule"] == "release_false_if_any_gate_or_required_evidence_is_NOT_RUN_FAIL_or_missing"
assert plan["orders_payments_uploads_vendor_contacts_performed"] is False
assert {row["gate"] for row in result_rows} == set("ABCDEF")
assert all(row["plan_id"] == plan["plan_id"] for row in result_rows)
assert all(row["result_PASS_FAIL_NOT_RUN"] == "NOT_RUN" for row in result_rows)
assert all(not row["value"] and not row["raw_data_path"] and not row["raw_data_sha256"] for row in result_rows)
assert len(result_rows) >= 180
assert set(result_rows[0]) >= {
    "pcb_sha256", "firmware_sha256", "bom_revision", "case_revision", "case_material",
    "lower_print_orientation", "upper_print_orientation", "layer_height_mm", "wall_count",
    "support", "battery_serial_or_lot", "cord_material", "cord_diameter_mm", "cord_lot",
    "pcb_serial", "mcu_uid_hex",
    "host_os_name", "host_os_version", "host_importer_sha256", "age_tool_version", "ffmpeg_version",
}
units = {f"U{i}" for i in range(1, 6)}
for gate in "ABCF":
    assert {row["unit_id"] for row in result_rows if row["gate"] == gate} == units
assert {row["unit_id"] for row in result_rows if row["gate"] == "D"} == units
assert {row["unit_id"] for row in result_rows if row["gate"] == "E"} == units
metrics = {(row["gate"], row["metric"]): row for row in result_rows}
assert metrics[("C", "elapsed_recording_time")]["lower_limit"] == "57600"
assert metrics[("C", "average_battery_current")]["upper_limit"] == "4.4"
assert metrics[("C", "integrated_battery_charge")]["upper_limit"] == "70.4"
assert metrics[("D", "cumulative_recording_time")]["lower_limit"] == "129600"
assert sum(row["gate"] == "D" and row["condition"].startswith("36h_recording_session_") and row["metric"] == "elapsed_recording_time" for row in result_rows) == 3
assert sum(row["gate"] == "D" and row["condition"] == "36h_encrypted_storage" and row["metric"] == "completed_encrypted_file_count" and row["lower_limit"] == "25920" for row in result_rows) == 1
assert sum(row["gate"] == "D" and row["condition"] == "36h_encrypted_storage" and row["metric"] == "successfully_decrypted_file_count" and row["lower_limit"] == "25920" for row in result_rows) == 1
assert sum(row["gate"] == "D" and row["condition"] == "36h_encrypted_storage" and row["metric"] == "decoded_sample_count" and row["lower_limit"] == "2073600000" for row in result_rows) == 1
for condition in ("USB_attached_before_configuration", "USB_deconfigured", "power_only_USB_C_to_C_adapter", "power_only_USB_A_to_C_adapter"):
    assert sum(row["gate"] == "B" and row["condition"] == condition and row["metric"] == "battery_charge_current" and row["lower_limit"] == "9" and row["upper_limit"] == "11" for row in result_rows) == 5
for condition in ("power_only_USB_C_to_C_adapter", "power_only_USB_A_to_C_adapter"):
    assert sum(row["gate"] == "B" and row["condition"] == condition and row["metric"] == "USB_input_current_max" and row["upper_limit"] == "100" for row in result_rows) == 5
for condition in ("USB_detached", "USB_suspended"):
    assert sum(row["gate"] == "B" and row["condition"] == condition and row["metric"] == "battery_charge_current" and row["upper_limit"] == "0" for row in result_rows) == 5
assert sum(row["gate"] == "B" and row["condition"] == "J2_empty_USB_power_for_factory_programming" and row["metric"] == "safe_powerup_and_stable_VTREF" for row in result_rows) == 5
assert sum(row["gate"] == "B" and row["condition"] == "low_battery_controlled_stop_no_VBUS" and row["metric"] == "completed_device_battery_current" and row["upper_limit"] == "150" for row in result_rows) == 5
assert sum(row["gate"] == "B" and row["condition"] == "low_battery_USB_attach_wakeup" and row["metric"] == "wake_to_charge" and row["upper_limit"] == "1000" for row in result_rows) == 5
assert sum(row["gate"] == "B" and row["condition"] == "C33_20V_DC_bias_raw_capacitance_evidence" and row["metric"] == "effective_capacitance_and_voltage_rating_requirement_met" and row["lower_limit"] == row["upper_limit"] == "1" for row in result_rows) == 5
assert sum(row["gate"] == "B" and row["condition"] == "TPS2552_forced_current_limit" and row["metric"] == "USB_input_current" and row["lower_limit"] == "50" and row["upper_limit"] == "100" for row in result_rows) == 5
tps_short = "TPS2552_output_short_latch_and_USB_power_cycle_recovery"
for metric, lower, upper in (
    ("real_cell_connected", "0", "0"),
    ("current_limited_source_used", "1", "1"),
    ("sustained_short_duration", "1", ""),
    ("USB_input_current_during_short", "50", "100"),
    ("latch_off_on_sustained_short", "1", "1"),
    ("restart_before_USB_power_cycle", "0", "0"),
    ("recovery_after_USB_power_cycle", "1", "1"),
    ("damage_smoke_odor_or_abnormal_heating", "0", "0"),
    ("peak_surface_temperature", "", "60"),
):
    assert sum(row["gate"] == "B" and row["condition"] == tps_short and row["metric"] == metric and row["lower_limit"] == lower and row["upper_limit"] == upper for row in result_rows) == 5
for rail in ("BAT", "SYS", "V3V3", "SD_V3"):
    condition = f"current_limited_battery_simulator_{rail}_to_GND_short"
    assert sum(row["gate"] == "A" and row["condition"] == condition and row["metric"] == "real_cell_connected" and row["lower_limit"] == row["upper_limit"] == "0" for row in result_rows) == 5
    assert sum(row["gate"] == "A" and row["condition"] == condition and row["metric"] == "charge_permission" and row["lower_limit"] == row["upper_limit"] == "0" for row in result_rows) == 5
    assert sum(row["gate"] == "A" and row["condition"] == condition and row["metric"] == "simulator_current_limit" and row["lower_limit"] == "100" and row["upper_limit"] == "110" for row in result_rows) == 5
    assert sum(row["gate"] == "A" and row["condition"] == condition and row["metric"] == "fault_duration" and row["lower_limit"] == "1" for row in result_rows) == 5
    assert sum(row["gate"] == "A" and row["condition"] == condition and row["metric"] == "peak_surface_temperature" and row["upper_limit"] == "60" for row in result_rows) == 5
    assert sum(row["gate"] == "A" and row["condition"] == condition and row["metric"] == "safe_recovery_after_fault_removal" and row["lower_limit"] == row["upper_limit"] == "1" for row in result_rows) == 5
assert sum(row["gate"] == "B" and row["condition"] == "dead_battery_startup" and row["metric"] == "peak_BQ25185_CE_plus_measurement_uncertainty" and row["upper_limit"] == "5499" for row in result_rows) == 5
assert sum(row["gate"] == "B" and row["condition"] == "dead_battery_startup" and row["metric"] == "BQ25185_CE_min_after_SYS_reaches_1p8V_until_firmware_grant" and row["lower_limit"] == "1400" for row in result_rows) == 5
assert sum(row["gate"] == "B" and row["condition"] == "dead_battery_startup" and row["metric"] == "battery_charge_current_before_firmware_grant" and row["upper_limit"] == "0" for row in result_rows) == 5
assert sum(row["gate"] == "B" and row["condition"] == "dead_battery_startup" and row["metric"] == "firmware_charge_grant_delay_after_accepted_USB_input" and row["lower_limit"] == "10" for row in result_rows) == 5
assert sum(row["gate"] == "B" and row["condition"] == "charge_start_stop_transient" and row["metric"] == "peak_BQ25185_CE_plus_measurement_uncertainty" and row["upper_limit"] == "5499" for row in result_rows) == 5
for voltage in (6, 9, 12, 20):
    for slew in ("0p1", "1", "10"):
        condition = f"NCP360_abnormal_input_{voltage}V_slew_{slew}V_per_us_current_limited_battery_simulator"
        assert sum(row["gate"] == "B" and row["condition"] == condition and row["metric"] == "downstream_absolute_maximum_violation" and row["upper_limit"] == "0" for row in result_rows) == 5
        assert sum(row["gate"] == "B" and row["condition"] == condition and row["metric"] == "damage_smoke_odor_or_abnormal_heating" and row["upper_limit"] == "0" for row in result_rows) == 5
        for metric in ("peak_VBUS_OVP_plus_measurement_uncertainty", "peak_VBUS_CHARGER_plus_measurement_uncertainty"):
            assert sum(row["gate"] == "B" and row["condition"] == condition and row["metric"] == metric and row["upper_limit"] == "6499" for row in result_rows) == 5
for temperature in (0, 10, 25, 35, 45):
    assert sum(row["gate"] == "B" and row["condition"] == f"pack_NTC_{temperature}C_raw_resistance" and row["metric"] == "pack_NTC_resistance" and row["lower_limit"] == "1" for row in result_rows) == 5
assert sum(row["gate"] == "B" and row["metric"] == "NTC_resistance_strictly_decreases_with_temperature" and row["lower_limit"] == row["upper_limit"] == "1" for row in result_rows) == 5
assert metrics[("F", "fatigue_cycles")]["lower_limit"] == "10000"
runtime_conditions = {"16h_continuous_recording_25C", "16h_endpoint_repeat_10C", "16h_endpoint_repeat_35C"}
assert gates["C"]["ambient_runs"] == ["25C +/-2C primary run on all 5 units", "10C +/-2C endpoint repeat on all 5 units", "35C +/-2C endpoint repeat on all 5 units"]
assert {row["condition"] for row in result_rows if row["gate"] == "C"} == runtime_conditions
assert sum(row["gate"] == "C" and row["metric"] == "elapsed_recording_time" for row in result_rows) == 15
assert sum(row["gate"] == "C" and row["metric"] == "decoded_sample_rate" and row["lower_limit"] == "16000" for row in result_rows) == 15
assert sum(row["gate"] == "C" and row["metric"] == "decoded_channel_count" and row["lower_limit"] == row["upper_limit"] == "1" for row in result_rows) == 15
assert sum(row["gate"] == "C" and row["metric"] == "recording_pause_duration" and row["upper_limit"] == "0" for row in result_rows) == 15
assert sum(row["gate"] == "C" and row["metric"] == "battery_replacement_count" and row["upper_limit"] == "0" for row in result_rows) == 15
assert sum(row["gate"] == "C" and row["metric"] == "external_power_present_duration" and row["upper_limit"] == "0" for row in result_rows) == 15
for metric in (
    "assigned_cutoff_characterization_pack_match", "onboard_BQ25185_charge_only",
    "charge_termination_observed", "USB_removed_before_temperature_conditioning",
    "pre_run_OCV_recorded", "pack_cycle_count_recorded",
    "declared_per_unit_temperature_order_followed",
):
    assert sum(row["gate"] == "C" and row["metric"] == metric and row["lower_limit"] == row["upper_limit"] == "1" for row in result_rows) == 15
assert sum(row["gate"] == "C" and row["metric"] == "pre_run_charge_current" and row["lower_limit"] == "9" and row["upper_limit"] == "11" for row in result_rows) == 15
assert sum(row["gate"] == "C" and row["metric"] == "target_temperature_stabilization" and row["lower_limit"] == "1800" for row in result_rows) == 15
assert sum(row["gate"] == "C" and row["metric"] == "battery_surface_temperature_within_target" and row["upper_limit"] == "2" for row in result_rows) == 15
assert sum(row["gate"] == "F" and row["metric"] == "proof_load" for row in result_rows) == 15
assert sum(row["gate"] == "F" and row["metric"] == "proof_duration" and row["lower_limit"] == "10" for row in result_rows) == 15
assert sum(row["gate"] == "F" and row["metric"] == "fatigue_load" and row["lower_limit"] == "15" for row in result_rows) == 5
assert sum(row["gate"] == "F" and row["metric"] == "drop_orientations_completed" and row["lower_limit"] == "26" for row in result_rows) == 5
for metric in (
    "connector_shell_fully_seated_without_case_or_overmold_interference",
    "charge_and_data_after_full_insertion",
):
    assert sum(
        row["gate"] == "F" and row["condition"].startswith("USB_cable_")
        and row["metric"] == metric and row["lower_limit"] == row["upper_limit"] == "1"
        for row in result_rows
    ) == 30
assert sum(row["gate"] == "F" and row["metric"] == "release_force_within_approved_manufacturer_and_risk_window" and row["lower_limit"] == row["upper_limit"] == "1" for row in result_rows) == 150
assert sum(row["gate"] == "F" and row["metric"] == "dangerous_detached_small_part_or_sharp_conductive_exposure" and row["upper_limit"] == "0" for row in result_rows) == 5
for metric, lower, upper in (
    ("exact_DTP401525_XE_finished_pack", "1", "1"),
    ("Molex_781720003_match", "1", "1"),
    ("pin1_BATplus_pin2_NTC_pin3_BATminus_match", "1", "1"),
    ("battery_width", "0", "15.5"),
    ("battery_length", "0", "27.0"),
    ("battery_thickness", "0", "4.2"),
    ("lead_length", "12", "18"),
    ("protection_and_finished_harness_present", "1", "1"),
    ("damage_or_swelling_present", "0", "0"),
):
    assert sum(
        row["gate"] == "A" and row["metric"] == metric
        and row["lower_limit"] == lower and row["upper_limit"] == upper
        for row in result_rows
    ) == 5, metric
for metric in ("crack_whitening_delamination_or_case_opening", "dangerous_hole_wear", "load_transfer_to_pouch_or_harness", "USB_half_insertion"):
    assert sum(row["gate"] == "F" and row["metric"] == metric and row["upper_limit"] == "0" for row in result_rows) == 5
assert any(row["gate"] == "D" and row["condition"] == "capacity_limit_reached" and row["metric"] == "completed_file_loss_count" for row in result_rows)
assert any(row["gate"] == "D" and row["condition"] == "power_loss_injected" and row["metric"] == "only_incomplete_tail_lost" for row in result_rows)
assert sum(row["gate"] == "E" and row["condition"].startswith("USB_cable_") for row in result_rows) >= 6
for fault in gates["A"]["faults"]:
    assert any(row["gate"] == "A" and row["condition"] == fault for row in result_rows), fault
for fault in gates["B"]["faults"]:
    if fault.startswith("NCP360_abnormal_input_"):
        voltage = fault.split("_")[3]
        assert any(row["gate"] == "B" and row["condition"].startswith(f"NCP360_abnormal_input_{voltage}_slew_") for row in result_rows), fault
    else:
        assert any(row["gate"] == "B" and row["condition"] == fault for row in result_rows), fault

for required in (
    "case-pebble-v5-{lower,upper,assembly}.step",
    "1:+、2:10kΩ NTC、3:-",
    "熱伝導パッドと基板TH1は使用しない",
    "5台全て16時間以上停止なし",
    "36時間分を全て復号・照合",
    "macOS・Windows・Linux",
    "50Nを10秒×3方向",
    "C31/C32各1µF",
    "C33（GRT155R6YA105KE13D、1µF、35V）",
    "100mA超",
):
    assert required in procedure, required
for forbidden in (
    "case-pebble-v2",
    "JLC実装NCU18XH103F60RB",
    "2:NC、3:-",
    "パッドlot",
    "パッド仕様は不採用",
):
    assert forbidden not in procedure, forbidden

print(json.dumps({
    "status": "PASS_CURRENT_FIVE_UNIT_EVT_PLAN_COMPLETE_NOT_RUN",
    "plan_id": plan["plan_id"],
    "gates": sorted(gates),
    "prototype_count": plan["prototype_count"],
    "physical_results": "NOT_RUN"
}, ensure_ascii=False))

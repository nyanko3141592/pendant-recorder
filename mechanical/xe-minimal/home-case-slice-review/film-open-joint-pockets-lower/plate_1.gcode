; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 15m 52s; total estimated time: 16m 11s
; total layer number: 99
; total filament length [mm] : 560.70
; total filament volume [cm^3] : 1348.65
; total filament weight [g] : 1.67
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 8.12
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; additional_fan_full_speed_layer = 0
; alternate_extra_wall = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.7,0.5
; bottom_color_penetration_layers = 4
; bottom_shell_layers = 4
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM109 S[nozzle_temperature_range_high]\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 1
; close_fan_the_first_x_layers = 1
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10
; cooling_slowdown_logic = uniform_cooling
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Cool Plate
; default_acceleration = 6000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL A1M"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1M
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = ;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 180
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = 
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80
; fan_direction = undefine
; fan_max_speed = 80
; fan_min_speed = 60
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_bridge_speed = 25
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #00AE42
; filament_cooling_before_tower = 0
; filament_cost = 20
; filament_density = 1.24
; filament_dev_ams_drying_ams_limitations = 1
; filament_dev_ams_drying_heat_distortion_temperature = 45
; filament_dev_ams_drying_temperature = 45
; filament_dev_ams_drying_time = 12
; filament_dev_chamber_drying_bed_temperature = 70
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 45
; filament_dev_drying_softening_temperature = 50
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFL99
; filament_is_mixed = 0
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12
; filament_metal_stickiness = None
; filament_minimal_purge_on_wipe_tower = 15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_notes = 
; filament_nozzle_map = 0
; filament_overhang_1_4_speed = 0
; filament_overhang_2_4_speed = 50
; filament_overhang_3_4_speed = 30
; filament_overhang_4_4_speed = 10
; filament_overhang_totally_speed = 10
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_preheat_temperature_delta = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_scarf_gap = 15%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic PLA @BBL A1M"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = Generic
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; first_x_layer_part_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0,280,280,280,280,0,280,280,280,280,0,280,280,280,280,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 300
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 156x152,180x152,180x180,156x180
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; hot_plate_temp = 60
; hot_plate_temp_initial_layer = 60
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.28
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 300
; ironing_direction = 45
; ironing_fan_speed = -1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.08
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_bed_mass_Y = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of \"timelapse_record_flag\"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X128 Y250 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 28
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 6000,6000
; machine_max_acceleration_x = 6000,6000
; machine_max_acceleration_y = 6000,6000
; machine_max_acceleration_z = 1500,1500
; machine_max_force_Y = 0
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 5,5
; machine_max_printed_mass = 0
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = G0 Z20 F9000\nG92 E0; G1 E-10 F1200\nG28\nM970 Q1 A10 B10 C130 K0\nM970 Q1 A10 B131 C250 K1\nM974 Q1 S1 P0\nM970 Q0 A10 B10 C130 H20 K0\nM970 Q0 A10 B131 C250 K1\nM974 Q0 S1 P0\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nG29 ;Home\nG90;\nG92 E0 ;Reset Extruder \nG1 Z2.0 F3000 ;Move Z Axis up \nG1 X10.1 Y20 Z0.28 F5000.0 ;Move to start position\nM109 S205;\nG1 X10.1 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line\nG1 X10.4 Y200.0 Z0.28 F5000.0 ;Move to side a little\nG1 X10.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line\nG92 E0 ;Reset Extruder \nG1 X110 Y110 Z2.0 F3000 ;Move Z Axis up
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 34
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 60
; overhang_2_4_speed = 30
; overhang_3_4_speed = 10
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab A1 mini 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = 0.16mm Optimal @BBL A1M
; printable_area = 0x0,180x0,180x180,0x180
; printable_height = 180
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1 mini
; printer_notes = 
; printer_settings_id = Bambu Lab A1 mini 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 179
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 8
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 330
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.16
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_fast_purge_mode = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 25
; support_top_z_distance = 0.16
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400 P300\nM971 S11 C10 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 6
; top_one_wall_type = all top
; top_shell_layers = 6
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle";"Bambu Lab A2L 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = arachne
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 220
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R16
M201 X6000 Y6000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z5.00 E3.00
M106 S0
M190 S35 ; set bed temperature and wait for it to be reached
; FEATURE: Custom
G0 Z20 F9000
G92 E0; G1 E-10 F1200
G28
M970 Q1 A10 B10 C130 K0
M970 Q1 A10 B131 C250 K1
M974 Q1 S1 P0
M970 Q0 A10 B10 C130 H20 K0
M970 Q0 A10 B131 C250 K1
M974 Q0 S1 P0
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
G29 ;Home
G90;
G92 E0 ;Reset Extruder 
G1 Z2.0 F3000 ;Move Z Axis up 
G1 X10.1 Y20 Z0.28 F5000.0 ;Move to start position
M109 S205;
G1 X10.1 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line
G1 X10.4 Y200.0 Z0.28 F5000.0 ;Move to side a little
G1 X10.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line
G92 E0 ;Reset Extruder 
G1 X110 Y110 Z2.0 F3000 ;Move Z Axis up
; MACHINE_START_GCODE_END
; filament start gcode
;Prevent PLA from jamming


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.28
; LAYER_HEIGHT: 0.28
G1 E-.8 F1800
; layer num/total_layer_count: 1/99
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P1 R15
G1 X77.927 Y103.792 F42000
M204 S6000
G1 Z.4
G1 Z.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.499999
G1 F3000
M204 S500
G1 X77.763 Y103.603 E.01254
G1 X77.686 Y103.279 E.0167
G1 X77.686 Y76.79 E1.32935
G1 X77.712 Y76.528 E.01324
G1 X77.87 Y76.231 E.01688
M73 P2 R15
G1 X78.133 Y76.06 E.01573
G1 X78.433 Y75.986 E.01553
G1 X101.586 Y75.987 E1.16195
G1 X101.887 Y76.063 E.01559
G1 X102.096 Y76.215 E.01296
G1 X102.265 Y76.462 E.01503
G1 X102.312 Y76.775 E.0159
G1 X102.312 Y103.225 E1.32739
G1 X102.286 Y103.436 E.01071
G1 X102.168 Y103.721 E.01547
G1 X101.93 Y103.916 E.01544
G1 X101.602 Y104.012 E.01712
G1 X78.49 Y104.014 E1.1599
G1 X78.228 Y103.988 E.01324
G1 X77.984 Y103.858 E.01388
G1 X77.966 Y103.837 E.00138
M204 S6000
G1 X77.568 Y104.093 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X77.563 Y104.09 E.00031
G1 X77.36 Y103.792 E.01808
G1 X77.246 Y103.292 E.02573
G1 X77.246 Y76.714 E1.33386
G1 X77.332 Y76.292 E.02164
G1 X77.545 Y75.929 E.02111
G1 X77.806 Y75.714 E.01697
G1 X78.183 Y75.569 E.02028
G1 X78.412 Y75.546 E.01152
G1 X101.523 Y75.547 E1.15985
G1 X101.933 Y75.598 E.02075
G1 X102.237 Y75.742 E.0169
G1 X102.526 Y76.016 E.02
G1 X102.684 Y76.312 E.01683
G1 X102.752 Y76.775 E.02349
G1 X102.752 Y103.225 E1.32739
G1 X102.684 Y103.688 E.0235
G1 X102.525 Y103.986 E.01696
G1 X102.286 Y104.225 E.01694
G1 X101.988 Y104.384 E.01697
G1 X101.646 Y104.452 E.01751
G1 X78.49 Y104.454 E1.16207
G1 X78.28 Y104.437 E.01058
G1 X77.861 Y104.318 E.02187
G1 X77.616 Y104.13 E.01551
; WIPE_START
G1 X77.563 Y104.09 E-.02514
G1 X77.36 Y103.792 E-.13693
G1 X77.246 Y103.292 E-.1948
G1 X77.246 Y102.232 E-.40314
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X77.842 Y94.622 Z.68 F42000
G1 X78.92 Y80.86 Z.68
G1 Z.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X79.024 Y80.51 E.01833
G1 X79.321 Y80.147 E.02355
G1 X79.588 Y79.989 E.01556
G1 X80.057 Y79.875 E.02423
G1 X80.434 Y79.942 E.01919
G1 X80.818 Y80.139 E.02168
G1 X81.085 Y80.461 E.02096
G1 X81.205 Y80.729 E.01475
G1 X81.258 Y81.12 E.01983
G1 X81.149 Y81.565 E.02296
G1 X80.835 Y81.973 E.02589
G1 X80.459 Y82.183 E.02159
G1 X80.204 Y82.242 E.01312
G1 X79.737 Y82.202 E.02353
G1 X79.323 Y81.984 E.02349
G1 X79.024 Y81.62 E.02363
G1 X78.9 Y81.284 E.01795
G1 X78.89 Y80.96 E.01628
G1 X78.903 Y80.918 E.00221
M204 S6000
G1 X79.342 Y80.967 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X79.348 Y80.875 E.00464
G1 X79.478 Y80.609 E.01485
G1 X79.718 Y80.409 E.01564
G1 X80.074 Y80.316 E.01848
G1 X80.253 Y80.342 E.00908
G1 X80.576 Y80.518 E.01846
G1 X80.774 Y80.816 E.01796
G1 X80.816 Y81.109 E.01485
G1 X80.731 Y81.408 E.0156
G1 X80.47 Y81.696 E.01952
G1 X80.193 Y81.802 E.01485
G1 X79.898 Y81.792 E.01485
G1 X79.63 Y81.668 E.01481
G1 X79.429 Y81.449 E.01491
G1 X79.33 Y81.17 E.01485
G1 X79.339 Y81.027 E.00721
; WIPE_START
G1 X79.348 Y80.875 E-.05793
G1 X79.478 Y80.609 E-.11247
G1 X79.718 Y80.409 E-.11839
G1 X80.074 Y80.316 E-.13991
G1 X80.253 Y80.342 E-.06878
G1 X80.576 Y80.518 E-.13979
G1 X80.755 Y80.787 E-.12273
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.68 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X101.517 Y76.163
G1 Z.28
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.502828
G1 F5807.988
M204 S500
G1 X101.871 Y76.518 E.02532
G3 X101.938 Y76.734 I-.324 J.219 E.01164
G1 X101.938 Y77.211 E.02407
G1 X101.088 Y76.361 E.06071
G1 X100.462 Y76.361 E.03163
G1 X101.938 Y77.837 E.10544
G1 X101.938 Y78.463 E.03163
G1 X99.836 Y76.361 E.15016
G1 X99.21 Y76.361 E.03163
G1 X101.938 Y79.089 E.19489
G1 X101.938 Y79.715 E.03162
G1 X98.584 Y76.361 E.23962
G1 X97.958 Y76.361 E.03163
G1 X101.938 Y80.342 E.28434
G1 X101.938 Y80.968 E.03163
G1 X97.331 Y76.361 E.32907
G1 X96.705 Y76.361 E.03163
G1 X101.938 Y81.594 E.3738
G1 X101.938 Y82.22 E.03163
G1 X96.079 Y76.361 E.41852
G1 X95.453 Y76.361 E.03163
G1 X101.938 Y82.846 E.46325
G1 X101.938 Y83.472 E.03163
G1 X94.827 Y76.361 E.50798
G1 X94.201 Y76.361 E.03163
G1 X101.938 Y84.098 E.5527
G1 X101.938 Y84.724 E.03163
G1 X93.575 Y76.361 E.59743
G1 X92.948 Y76.361 E.03163
G1 X101.938 Y85.351 E.64215
G1 X101.938 Y85.977 E.03163
G1 X92.322 Y76.361 E.68688
G1 X91.696 Y76.361 E.03163
G1 X101.938 Y86.603 E.73161
G1 X101.938 Y87.229 E.03163
G1 X91.07 Y76.361 E.77633
G1 X90.444 Y76.361 E.03163
G1 X101.938 Y87.855 E.82106
M73 P3 R15
G1 X101.938 Y88.481 E.03163
G1 X89.818 Y76.36 E.86579
G1 X89.191 Y76.36 E.03163
G1 X101.938 Y89.107 E.91051
G1 X101.938 Y89.733 E.03162
G1 X88.565 Y76.36 E.95524
G1 X87.939 Y76.36 E.03163
G1 X101.938 Y90.36 E.99997
G1 X101.938 Y90.986 E.03163
G1 X87.313 Y76.36 E1.04469
G1 X86.687 Y76.36 E.03163
G1 X101.938 Y91.612 E1.08942
G1 X101.938 Y92.238 E.03163
G1 X86.061 Y76.36 E1.13415
G1 X85.434 Y76.36 E.03163
G1 X101.938 Y92.864 E1.17887
G1 X101.938 Y93.49 E.03163
G1 X84.808 Y76.36 E1.2236
G1 X84.182 Y76.36 E.03163
G1 X101.938 Y94.116 E1.26833
G1 X101.938 Y94.743 E.03163
G1 X83.556 Y76.36 E1.31305
G1 X82.93 Y76.36 E.03163
G1 X101.938 Y95.369 E1.35778
G1 X101.938 Y95.995 E.03163
G1 X82.304 Y76.36 E1.4025
G1 X81.678 Y76.36 E.03163
G1 X101.938 Y96.621 E1.44723
G1 X101.938 Y97.247 E.03163
G1 X81.051 Y76.36 E1.49196
G1 X80.425 Y76.36 E.03163
G1 X101.938 Y97.873 E1.53668
G1 X101.938 Y98.499 E.03163
G1 X79.799 Y76.36 E1.58141
G2 X79.177 Y76.364 I-.077 J38.584 E.03144
G1 X101.938 Y99.125 E1.62587
G1 X101.938 Y99.752 E.03163
G1 X78.556 Y76.369 E1.67024
G2 X78.106 Y76.546 I-.091 J.427 E.02584
G1 X101.938 Y100.378 E1.70233
G1 X101.938 Y101.004 E.03163
G1 X78.06 Y77.126 E1.70563
M73 P4 R15
G1 X78.06 Y77.752 E.03163
G1 X79.838 Y79.529 E.12697
G1 X79.462 Y79.636 E.01973
G1 X79.372 Y79.69 E.00529
G1 X78.06 Y78.378 E.09371
G1 X78.06 Y79.004 E.03163
G1 X78.997 Y79.941 E.06695
G2 X78.724 Y80.294 I.736 J.853 E.02269
G1 X78.06 Y79.63 E.04742
G1 X78.06 Y80.256 E.03163
G1 X78.724 Y80.92 E.0474
; WIPE_START
G1 X78.06 Y80.256 E-.35658
G1 X78.06 Y79.63 E-.23793
G1 X78.368 Y79.938 E-.1655
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X81.432 Y81.124 Z.68 F42000
G1 Z.28
G1 E.8 F1800
G1 F5807.988
M204 S500
G1 X101.938 Y101.63 E1.46477
G1 X101.938 Y102.256 E.03163
G1 X81.456 Y81.774 E1.46306
G1 X81.413 Y81.854 E.00462
G1 X81.19 Y82.134 E.01806
G1 X101.938 Y102.882 E1.48204
G1 X101.938 Y103.265 E.01935
G3 X101.886 Y103.456 I-.34 J.008 E.01011
G1 X80.845 Y82.415 E1.50295
G1 X80.441 Y82.586 E.02215
G1 X80.394 Y82.59 E.00239
G1 X101.442 Y103.638 E1.50349
G1 X100.816 Y103.638 E.03162
G1 X79.758 Y82.58 E1.50417
G3 X78.9 Y82.094 I.265 J-1.467 E.05081
G1 X78.683 Y81.776 E.01943
G1 X78.532 Y81.354 E.02265
G1 X78.06 Y80.882 E.03368
G1 X78.06 Y81.508 E.03162
G1 X100.19 Y103.638 E1.58075
G1 X99.564 Y103.638 E.03162
G1 X78.06 Y82.135 E1.53603
G1 X78.06 Y82.761 E.03163
G1 X98.938 Y103.639 E1.49131
G1 X98.312 Y103.639 E.03162
G1 X78.06 Y83.387 E1.44659
G1 X78.06 Y84.013 E.03163
G1 X97.686 Y103.639 E1.40187
G1 X97.06 Y103.639 E.03162
G1 X78.06 Y84.639 E1.35715
G1 X78.06 Y85.265 E.03163
G1 X96.434 Y103.639 E1.31242
G1 X95.807 Y103.639 E.03162
G1 X78.06 Y85.891 E1.2677
G1 X78.06 Y86.517 E.03163
G1 X95.181 Y103.639 E1.22298
G1 X94.555 Y103.639 E.03162
G1 X78.06 Y87.144 E1.17826
G1 X78.06 Y87.77 E.03163
G1 X93.929 Y103.639 E1.13354
G1 X93.303 Y103.639 E.03162
G1 X78.06 Y88.396 E1.08882
M73 P5 R15
G1 X78.06 Y89.022 E.03163
G1 X92.677 Y103.639 E1.0441
G1 X92.051 Y103.639 E.03162
G1 X78.06 Y89.648 E.99938
G1 X78.06 Y90.274 E.03163
G1 X91.425 Y103.639 E.95465
G1 X90.799 Y103.639 E.03162
G1 X78.06 Y90.9 E.90993
G1 X78.06 Y91.526 E.03163
G1 X90.173 Y103.639 E.86521
G1 X89.547 Y103.639 E.03162
G1 X78.06 Y92.153 E.82049
G1 X78.06 Y92.779 E.03162
G1 X88.921 Y103.639 E.77577
G1 X88.294 Y103.639 E.03162
G1 X78.06 Y93.405 E.73105
G1 X78.06 Y94.031 E.03163
G1 X87.668 Y103.639 E.68633
G1 X87.042 Y103.639 E.03162
G1 X78.06 Y94.657 E.64161
G1 X78.06 Y95.283 E.03163
G1 X86.416 Y103.639 E.59688
G1 X85.79 Y103.639 E.03162
G1 X78.06 Y95.909 E.55216
G1 X78.06 Y96.536 E.03163
G1 X85.164 Y103.64 E.50744
G1 X84.538 Y103.64 E.03162
G1 X78.06 Y97.162 E.46272
G1 X78.06 Y97.788 E.03163
G1 X83.912 Y103.64 E.418
G1 X83.286 Y103.64 E.03162
G1 X78.06 Y98.414 E.37328
G1 X78.06 Y99.04 E.03163
G1 X82.66 Y103.64 E.32856
G1 X82.034 Y103.64 E.03162
G1 X78.06 Y99.666 E.28384
G1 X78.06 Y100.292 E.03163
G1 X81.408 Y103.64 E.23911
G1 X80.781 Y103.64 E.03162
G1 X78.06 Y100.918 E.19439
G1 X78.06 Y101.545 E.03163
G1 X80.155 Y103.64 E.14967
G1 X79.529 Y103.64 E.03162
G1 X78.06 Y102.171 E.10495
G1 X78.06 Y102.797 E.03163
G1 X79.101 Y103.838 E.07437
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F5807.988
G1 X78.06 Y102.797 E-.5595
G1 X78.06 Y102.269 E-.20051
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/99
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.68 I-1.208 J-.15 P1  F42000
G1 X77.851 Y103.943 Z.68
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F18000
M204 S6000
G1 X77.62 Y103.66 E.00515
G1 X77.536 Y103.269 E.00564
G1 X77.538 Y77.269 E.36681
G3 X77.593 Y76.411 I2.907 J-.243 E.01216
G1 X77.8 Y76.1 E.00527
G1 X78.118 Y75.889 E.00538
G1 X78.416 Y75.836 E.00427
G1 X101.534 Y75.838 E.32616
G1 X101.843 Y75.877 E.00438
G1 X102.169 Y76.072 E.00537
G1 X102.373 Y76.326 E.00459
G1 X102.462 Y76.676 E.00509
G1 X102.464 Y103.262 E.37508
G1 X102.389 Y103.612 E.00505
G1 X102.207 Y103.908 E.0049
G1 X101.917 Y104.087 E.00481
G1 X101.561 Y104.164 E.00514
G1 X78.497 Y104.164 E.32538
G1 X78.199 Y104.135 E.00423
G1 X77.9 Y103.976 E.00477
M204 S250
G1 X77.524 Y104.218 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2700
M204 S5000
G1 X77.452 Y104.159 E.00122
G1 X77.39 Y104.067 E.00146
G1 F3150
G3 X77.188 Y103.68 I4.044 J-2.362 E.00575
G1 F2700
G1 X77.118 Y103.29 E.0052
G1 X77.12 Y77.29 E.34139
G3 X77.195 Y76.269 I3.515 J-.254 E.01349
G1 X77.372 Y75.938 E.00493
G1 X77.638 Y75.672 E.00493
G1 X77.971 Y75.494 E.00496
G1 X78.406 Y75.418 E.00579
G1 X101.535 Y75.42 E.30369
G1 X101.969 Y75.474 E.00575
G1 X102.311 Y75.636 E.00496
G1 X102.389 Y75.707 E.00139
G1 F3150
G3 X102.801 Y76.298 I-.928 J1.085 E.00956
G1 X102.831 Y76.441 E.00192
G1 F2700
G1 X102.88 Y76.676 E.00315
G1 X102.882 Y102.676 E.34139
G3 X102.865 Y103.425 I-4.856 J.263 E.00985
G1 F3150
M73 P6 R15
G1 X102.864 Y103.434 E.00012
G3 X102.597 Y104.089 I-1.391 J-.186 E.00939
G1 X102.536 Y104.144 E.00107
G1 F2700
G1 X102.266 Y104.393 E.00483
G1 X101.915 Y104.541 E.005
G1 X101.587 Y104.582 E.00434
G1 X78.497 Y104.582 E.30317
G1 X78.091 Y104.542 E.00536
G1 X77.742 Y104.398 E.00496
G1 X77.57 Y104.256 E.00292
; WIPE_START
M204 S6000
G1 X77.452 Y104.159 E-.05806
G1 X77.39 Y104.067 E-.04213
G1 X77.188 Y103.68 E-.16627
G1 X77.118 Y103.29 E-.15049
G1 X77.118 Y102.387 E-.34306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.772 Y94.782 Z.76 F42000
G1 X78.952 Y81.055 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F18000
M204 S6000
G1 X78.952 Y80.964 E.00128
G1 X79.079 Y80.538 E.00627
G1 X79.362 Y80.194 E.00628
G1 X79.612 Y80.046 E.0041
G1 X80.057 Y79.937 E.00647
G1 X80.363 Y79.982 E.00436
G1 X80.761 Y80.181 E.00627
G3 X81.112 Y80.634 I-.746 J.94 E.00817
G1 X81.197 Y81.035 E.00578
G1 X81.114 Y81.492 E.00656
G1 X80.848 Y81.881 E.00664
G1 X80.525 Y82.096 E.00548
G1 X80.318 Y82.155 E.00304
G1 X79.912 Y82.181 E.00574
G1 X79.568 Y82.069 E.00511
G1 X79.217 Y81.795 E.00627
G1 X79.001 Y81.406 E.00628
G3 X78.952 Y81.166 I1.069 J-.341 E.00347
G1 X78.952 Y81.115 E.00071
M204 S250
G1 X79.37 Y81.055 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.37 Y80.964 E.0012
G1 X79.509 Y80.634 E.0047
G1 X79.735 Y80.445 E.00387
G1 X80.092 Y80.358 E.00483
G1 X80.365 Y80.422 E.00368
G1 X80.592 Y80.587 E.00368
G1 X80.736 Y80.827 E.00368
G1 X80.776 Y81.105 E.00368
G1 X80.705 Y81.376 E.00368
G1 X80.534 Y81.598 E.00368
G1 X80.276 Y81.739 E.00386
G1 X79.908 Y81.753 E.00484
G1 X79.653 Y81.636 E.00367
G1 X79.464 Y81.43 E.00368
G1 X79.37 Y81.166 E.00368
G1 X79.37 Y81.115 E.00066
; WIPE_START
M204 S6000
G1 X79.37 Y80.964 E-.05739
G1 X79.509 Y80.634 E-.13605
G1 X79.735 Y80.445 E-.11187
G1 X80.092 Y80.358 E-.13987
G1 X80.365 Y80.422 E-.10649
G1 X80.592 Y80.587 E-.10645
G1 X80.73 Y80.817 E-.10188
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X77.709 Y81.873
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424018
G1 F18000
M204 S6000
G1 X78.6 Y80.982 E.01671
G1 X78.613 Y81.336 E.0047
G1 X78.668 Y81.49 E.00216
G1 X77.89 Y82.267 E.01458
G1 X77.89 Y82.842 E.00763
G1 X78.853 Y81.88 E.01806
G2 X79.118 Y82.19 I.901 J-.498 E.00545
G1 X77.89 Y83.418 E.02302
G1 X77.89 Y83.993 E.00763
G1 X79.473 Y82.411 E.02968
G2 X79.875 Y82.534 I.669 J-1.464 E.00559
G1 X79.928 Y82.531 E.00071
G1 X77.709 Y84.75 E.04162
M204 S10000
G1 X77.712 Y76.692 F42000
G1 F18000
M204 S6000
G1 X78.11 Y76.294 E.00746
G1 X78.24 Y76.224 E.00195
G3 X78.79 Y76.189 I.372 J1.485 E.00735
G1 X77.891 Y77.088 E.01687
G1 X77.891 Y77.664 E.00763
G1 X79.365 Y76.189 E.02766
G1 X79.941 Y76.189 E.00763
G1 X77.891 Y78.239 E.03845
G1 X77.89 Y78.815 E.00763
G1 X80.516 Y76.189 E.04924
G1 X81.091 Y76.189 E.00763
G1 X77.89 Y79.39 E.06003
G1 X77.89 Y79.965 E.00763
G1 X81.667 Y76.189 E.07082
G1 X82.242 Y76.189 E.00763
G1 X77.89 Y80.541 E.08161
G1 X77.89 Y81.116 E.00763
G1 X82.817 Y76.189 E.0924
G1 X83.393 Y76.189 E.00763
G1 X79.993 Y79.589 E.06377
G1 X80.061 Y79.584 E.00091
G1 X80.436 Y79.636 E.00502
G1 X80.498 Y79.66 E.00088
G1 X83.968 Y76.189 E.06509
G1 X84.543 Y76.189 E.00763
G1 X80.889 Y79.843 E.06853
G3 X81.191 Y80.117 I-.555 J.915 E.00543
G1 X85.119 Y76.189 E.07366
G1 X85.694 Y76.189 E.00763
G1 X81.42 Y80.464 E.08016
G1 X81.536 Y80.923 E.00628
G1 X86.269 Y76.189 E.08878
G1 X86.845 Y76.189 E.00763
G1 X77.89 Y85.144 E.16794
G1 X77.89 Y85.72 E.00763
G1 X87.42 Y76.189 E.17873
G1 X87.995 Y76.19 E.00763
G1 X77.89 Y86.295 E.18952
G1 X77.89 Y86.87 E.00763
G1 X88.571 Y76.19 E.20031
G1 X89.146 Y76.19 E.00763
G1 X77.89 Y87.446 E.2111
G1 X77.89 Y88.021 E.00763
G1 X89.721 Y76.19 E.22189
G1 X90.297 Y76.19 E.00763
G1 X77.89 Y88.597 E.23268
G1 X77.89 Y89.172 E.00763
G1 X90.872 Y76.19 E.24347
G1 X91.447 Y76.19 E.00763
G1 X77.89 Y89.747 E.25426
G1 X77.89 Y90.323 E.00763
G1 X92.023 Y76.19 E.26505
G1 X92.598 Y76.19 E.00763
G1 X77.89 Y90.898 E.27585
G1 X77.89 Y91.474 E.00763
G1 X93.173 Y76.19 E.28664
G1 X93.749 Y76.19 E.00763
G1 X77.89 Y92.049 E.29743
G1 X77.89 Y92.624 E.00763
G1 X94.324 Y76.19 E.30822
G1 X94.899 Y76.19 E.00763
G1 X77.89 Y93.2 E.31901
G1 X77.89 Y93.775 E.00763
G1 X95.475 Y76.19 E.3298
G1 X96.05 Y76.19 E.00763
G1 X77.889 Y94.351 E.34059
G1 X77.889 Y94.926 E.00763
G1 X96.625 Y76.19 E.35138
G1 X97.201 Y76.19 E.00763
G1 X77.889 Y95.502 E.36217
G1 X77.889 Y96.077 E.00763
G1 X97.776 Y76.19 E.37296
G1 X98.351 Y76.19 E.00763
G1 X77.889 Y96.652 E.38375
G1 X77.889 Y97.228 E.00763
G1 X98.927 Y76.19 E.39454
G1 X99.502 Y76.19 E.00763
G1 X77.889 Y97.803 E.40533
G1 X77.889 Y98.379 E.00763
G1 X100.077 Y76.19 E.41612
G1 X100.653 Y76.19 E.00763
G1 X77.889 Y98.954 E.42691
G1 X77.889 Y99.529 E.00763
G1 X101.228 Y76.19 E.4377
G1 X101.583 Y76.19 E.00471
G3 X101.764 Y76.23 I.02 J.343 E.00249
G1 X77.889 Y100.105 E.44776
G1 X77.889 Y100.68 E.00763
G1 X102.059 Y76.51 E.45329
G1 X102.109 Y76.687 E.00244
G1 X102.109 Y77.035 E.00461
G1 X77.889 Y101.256 E.45423
G1 X77.889 Y101.831 E.00763
G1 X102.109 Y77.611 E.45424
G1 X102.109 Y78.186 E.00763
G1 X77.889 Y102.406 E.45424
G1 X77.889 Y102.982 E.00763
G1 X102.11 Y78.761 E.45424
G1 X102.11 Y79.337 E.00763
G1 X77.941 Y103.505 E.45325
G2 X78.248 Y103.773 I.488 J-.249 E.00554
G1 X102.11 Y79.912 E.4475
G1 X102.11 Y80.487 E.00763
G1 X78.786 Y103.811 E.43742
G1 X79.361 Y103.811 E.00763
G1 X102.11 Y81.063 E.42663
G1 X102.11 Y81.638 E.00763
G1 X79.936 Y103.811 E.41584
G1 X80.512 Y103.811 E.00763
G1 X102.11 Y82.213 E.40505
G1 X102.11 Y82.789 E.00763
G1 X81.087 Y103.811 E.39426
G1 X81.663 Y103.811 E.00763
G1 X102.11 Y83.364 E.38347
G1 X102.11 Y83.939 E.00763
G1 X82.238 Y103.811 E.37268
G1 X82.813 Y103.811 E.00763
G1 X102.11 Y84.515 E.36189
G1 X102.11 Y85.09 E.00763
G1 X83.389 Y103.811 E.3511
G1 X83.964 Y103.811 E.00763
G1 X102.11 Y85.665 E.34031
M73 P7 R15
G1 X102.11 Y86.241 E.00763
G1 X84.539 Y103.811 E.32952
G1 X85.115 Y103.811 E.00763
G1 X102.11 Y86.816 E.31873
G1 X102.11 Y87.391 E.00763
G1 X85.69 Y103.811 E.30794
G1 X86.266 Y103.811 E.00763
G1 X102.11 Y87.967 E.29715
G1 X102.11 Y88.542 E.00763
G1 X86.841 Y103.811 E.28636
G1 X87.416 Y103.811 E.00763
G1 X102.11 Y89.117 E.27557
G1 X102.11 Y89.693 E.00763
G1 X87.992 Y103.811 E.26478
G1 X88.567 Y103.811 E.00763
G1 X102.11 Y90.268 E.25399
G1 X102.11 Y90.843 E.00763
G1 X89.142 Y103.811 E.2432
G1 X89.718 Y103.811 E.00763
G1 X102.11 Y91.419 E.23241
G1 X102.11 Y91.994 E.00763
G1 X90.293 Y103.811 E.22162
G1 X90.869 Y103.811 E.00763
G1 X102.11 Y92.569 E.21083
G1 X102.11 Y93.145 E.00763
G1 X91.444 Y103.811 E.20004
G1 X92.019 Y103.811 E.00763
G1 X102.111 Y93.72 E.18925
G1 X102.111 Y94.295 E.00763
G1 X92.595 Y103.811 E.17846
G1 X93.17 Y103.811 E.00763
G1 X102.111 Y94.871 E.16767
G1 X102.111 Y95.446 E.00763
G1 X93.745 Y103.811 E.15688
G1 X94.321 Y103.811 E.00763
G1 X102.111 Y96.021 E.14609
G1 X102.111 Y96.597 E.00763
G1 X94.896 Y103.811 E.1353
G1 X95.472 Y103.811 E.00763
G1 X102.111 Y97.172 E.12451
G1 X102.111 Y97.747 E.00763
G1 X96.047 Y103.811 E.11372
G1 X96.622 Y103.811 E.00763
G1 X102.111 Y98.323 E.10293
G1 X102.111 Y98.898 E.00763
G1 X97.198 Y103.811 E.09214
G1 X97.773 Y103.811 E.00763
G1 X102.111 Y99.473 E.08135
G1 X102.111 Y100.049 E.00763
G1 X98.348 Y103.811 E.07056
G1 X98.924 Y103.811 E.00763
G1 X102.111 Y100.624 E.05977
G1 X102.111 Y101.199 E.00763
G1 X99.499 Y103.811 E.04898
G1 X100.075 Y103.811 E.00763
G1 X102.111 Y101.775 E.03819
G1 X102.111 Y102.35 E.00763
G1 X100.65 Y103.811 E.0274
G1 X101.225 Y103.811 E.00763
G1 X102.111 Y102.925 E.01661
G1 X102.111 Y103.24 E.00417
G3 X102.025 Y103.569 I-.637 J.008 E.00456
G3 X101.629 Y103.982 I-1.877 J-1.397 E.00761
; CHANGE_LAYER
; Z_HEIGHT: 0.44
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X102.025 Y103.569 E-.21746
G1 X102.09 Y103.411 E-.065
G1 X102.111 Y103.24 E-.06528
G1 X102.111 Y102.925 E-.11959
G1 X101.567 Y103.47 E-.29267
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/99
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I-.024 J-1.217 P1  F42000
G1 X77.831 Y103.928 Z.76
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14959
M204 S6000
G1 X77.756 Y103.864 E.00139
G1 X77.608 Y103.626 E.00396
G1 X77.528 Y103.261 E.00526
G1 X77.528 Y77.261 E.36681
G3 X77.635 Y76.291 I2.349 J-.232 E.01387
G1 X77.836 Y76.056 E.00436
G1 X78.074 Y75.908 E.00396
G1 X78.439 Y75.828 E.00526
G1 X101.518 Y75.83 E.32561
G1 X101.892 Y75.885 E.00532
M73 P7 R14
G1 X102.194 Y76.076 E.00504
G1 X102.404 Y76.376 E.00516
G1 X102.47 Y76.68 E.0044
G1 X102.472 Y102.68 E.36681
G3 X102.465 Y103.321 I-5.221 J.261 E.00905
G1 X102.365 Y103.709 E.00566
G1 X102.164 Y103.944 E.00436
G1 X101.926 Y104.092 E.00396
G1 X101.561 Y104.172 E.00526
G1 X78.498 Y104.172 E.32538
G1 X78.379 Y104.165 E.00168
G1 X77.991 Y104.065 E.00566
G1 X77.877 Y103.967 E.00212
M204 S250
G1 X77.552 Y104.265 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X77.537 Y104.256 E.00023
G1 X77.295 Y103.962 E.005
G1 X77.15 Y103.611 E.00499
G1 X77.11 Y103.287 E.00428
G1 X77.11 Y77.287 E.34139
G3 X77.21 Y76.231 I2.863 J-.261 E.014
G1 X77.444 Y75.837 E.00602
G1 X77.738 Y75.595 E.005
G1 X78.089 Y75.45 E.00499
G1 X78.413 Y75.41 E.00428
G1 X101.518 Y75.412 E.30338
G1 X102.034 Y75.487 E.00684
G1 X102.369 Y75.667 E.00499
G1 X102.594 Y75.881 E.00408
G1 X102.791 Y76.21 E.00503
G1 X102.888 Y76.68 E.00631
G1 X102.89 Y102.68 E.34139
G3 X102.79 Y103.769 I-3.129 J.261 E.01443
G1 X102.556 Y104.163 E.00602
G1 X102.262 Y104.405 E.005
G1 X101.911 Y104.55 E.00499
G1 X101.587 Y104.59 E.00428
G1 X78.498 Y104.59 E.30316
G3 X77.931 Y104.49 I.025 J-1.794 E.00759
G1 X77.603 Y104.296 E.005
; WIPE_START
M204 S6000
G1 X77.537 Y104.256 E-.02944
G1 X77.295 Y103.962 E-.14463
G1 X77.15 Y103.611 E-.1445
G1 X77.11 Y103.287 E-.1239
G1 X77.11 Y102.451 E-.31752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.771 Y94.848 Z.84 F42000
G1 X78.987 Y80.848 Z.84
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14959
M204 S6000
G1 X79.079 Y80.538 E.00457
G1 X79.252 Y80.304 E.0041
G1 X79.629 Y80.027 E.0066
G1 X80.158 Y79.945 E.00756
G1 X80.385 Y79.988 E.00325
G1 X80.778 Y80.195 E.00627
G1 X81.005 Y80.435 E.00467
G1 X81.173 Y80.829 E.00604
G1 X81.156 Y81.355 E.00742
G1 X81.076 Y81.562 E.00313
G1 X80.841 Y81.885 E.00565
G1 X80.512 Y82.102 E.00555
G1 X80.098 Y82.193 E.00598
G1 X79.945 Y82.177 E.00218
G3 X79.079 Y81.592 I.138 J-1.137 E.01531
G1 X78.962 Y81.273 E.0048
G1 X78.952 Y80.964 E.00436
G1 X78.97 Y80.906 E.00086
M204 S250
G1 X79.382 Y80.95 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.386 Y80.886 E.00085
G1 X79.52 Y80.624 E.00386
G1 X79.785 Y80.415 E.00444
G1 X80.193 Y80.366 E.00539
G1 X80.487 Y80.494 E.0042
G1 X80.676 Y80.7 E.00368
G1 X80.769 Y80.979 E.00386
G1 X80.72 Y81.344 E.00483
G1 X80.56 Y81.575 E.00368
G1 X80.324 Y81.725 E.00368
G1 X80.038 Y81.77 E.0038
G1 X79.705 Y81.669 E.00457
G1 X79.464 Y81.43 E.00445
G1 X79.37 Y81.166 E.00368
G1 X79.379 Y81.01 E.00204
; WIPE_START
M204 S6000
G1 X79.386 Y80.886 E-.0473
G1 X79.52 Y80.624 E-.11179
G1 X79.785 Y80.415 E-.12845
G1 X80.193 Y80.366 E-.15605
G1 X80.487 Y80.494 E-.12164
G1 X80.676 Y80.7 E-.10642
G1 X80.75 Y80.921 E-.08835
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.84 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X80.067 Y79.78
G1 Z.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424248
G1 F14959
M204 S6000
G1 X77.881 Y77.594 E.04102
G1 X77.881 Y78.169 E.00764
G1 X79.442 Y79.731 E.0293
G2 X79.104 Y79.968 I.578 J1.187 E.00551
G1 X77.881 Y78.745 E.02295
G1 X77.881 Y79.321 E.00764
G1 X78.839 Y80.279 E.01798
G2 X78.656 Y80.671 I.855 J.639 E.00579
G1 X77.881 Y79.896 E.01454
G1 X77.881 Y80.472 E.00764
G1 X78.839 Y81.431 E.01799
M204 S10000
G1 X78.372 Y103.991 F42000
G1 F14959
M204 S6000
G3 X77.964 Y103.561 I1.975 J-2.284 E.00787
G3 X77.881 Y102.924 I1.193 J-.479 E.00862
G1 X78.776 Y103.819 E.01679
G1 X79.351 Y103.819 E.00764
G1 X77.881 Y102.349 E.0276
G1 X77.881 Y101.773 E.00764
G1 X79.927 Y103.819 E.0384
G1 X80.503 Y103.819 E.00764
G1 X77.881 Y101.197 E.0492
G1 X77.881 Y100.622 E.00764
G1 X81.078 Y103.819 E.06
G1 X81.654 Y103.819 E.00764
G1 X77.881 Y100.046 E.07081
G1 X77.881 Y99.47 E.00764
G1 X82.23 Y103.819 E.08161
G1 X82.806 Y103.819 E.00764
G1 X77.881 Y98.894 E.09241
G1 X77.881 Y98.319 E.00764
G1 X83.381 Y103.819 E.10322
G1 X83.957 Y103.819 E.00764
G1 X77.881 Y97.743 E.11402
G1 X77.881 Y97.167 E.00764
G1 X84.533 Y103.819 E.12482
G1 X85.108 Y103.819 E.00764
G1 X77.881 Y96.592 E.13562
G1 X77.881 Y96.016 E.00764
G1 X85.684 Y103.819 E.14643
G1 X86.26 Y103.819 E.00764
G1 X77.881 Y95.44 E.15723
G1 X77.881 Y94.865 E.00764
G1 X86.835 Y103.819 E.16803
G1 X87.411 Y103.819 E.00764
G1 X77.881 Y94.289 E.17884
G1 X77.881 Y93.713 E.00764
G1 X87.987 Y103.819 E.18964
G1 X88.563 Y103.819 E.00764
G1 X77.881 Y93.138 E.20044
G1 X77.881 Y92.562 E.00764
G1 X89.138 Y103.819 E.21124
G1 X89.714 Y103.819 E.00764
G1 X77.881 Y91.986 E.22205
G1 X77.881 Y91.41 E.00764
G1 X90.29 Y103.819 E.23285
G1 X90.865 Y103.819 E.00764
G1 X77.881 Y90.835 E.24365
G1 X77.881 Y90.259 E.00764
G1 X91.441 Y103.819 E.25446
G1 X92.017 Y103.819 E.00764
G1 X77.881 Y89.683 E.26526
G1 X77.881 Y89.108 E.00764
G1 X92.592 Y103.819 E.27606
G1 X93.168 Y103.819 E.00764
G1 X77.881 Y88.532 E.28686
G1 X77.881 Y87.956 E.00764
G1 X93.744 Y103.819 E.29767
G1 X94.319 Y103.819 E.00764
G1 X77.881 Y87.381 E.30847
G1 X77.881 Y86.805 E.00764
G1 X94.895 Y103.819 E.31927
G1 X95.471 Y103.819 E.00764
G1 X77.881 Y86.229 E.33008
G1 X77.881 Y85.653 E.00764
G1 X96.047 Y103.819 E.34088
G1 X96.622 Y103.819 E.00764
G1 X77.881 Y85.078 E.35168
G1 X77.881 Y84.502 E.00764
G1 X97.198 Y103.819 E.36249
G1 X97.774 Y103.819 E.00764
M73 P8 R14
G1 X77.881 Y83.926 E.37329
G1 X77.881 Y83.351 E.00764
G1 X98.349 Y103.819 E.38409
G1 X98.925 Y103.819 E.00764
G1 X77.881 Y82.775 E.39489
G1 X77.881 Y82.199 E.00764
G1 X99.501 Y103.819 E.4057
G1 X100.076 Y103.819 E.00764
G1 X77.881 Y81.624 E.4165
G1 X77.881 Y81.048 E.00764
G1 X100.652 Y103.819 E.4273
G1 X101.228 Y103.819 E.00764
G1 X79.938 Y82.529 E.3995
G2 X80.463 Y82.478 I.152 J-1.152 E.00705
G1 X101.762 Y103.778 E.39968
G2 X102.065 Y103.505 I-.127 J-.446 E.0056
G1 X80.863 Y82.303 E.39786
G2 X81.179 Y82.043 I-.717 J-1.197 E.00545
G1 X102.119 Y102.984 E.39294
G1 X102.119 Y102.408 E.00764
G1 X81.404 Y81.693 E.38871
G2 X81.522 Y81.235 I-1.046 J-.511 E.00632
G1 X102.119 Y101.832 E.38651
G1 X102.119 Y101.256 E.00764
G1 X77.881 Y77.018 E.45483
G3 X77.934 Y76.496 I1.266 J-.134 E.00702
G1 X102.119 Y100.681 E.45383
G1 X102.119 Y100.105 E.00764
G1 X78.237 Y76.223 E.44814
G3 X78.771 Y76.181 I.371 J1.295 E.00715
G1 X102.119 Y99.529 E.43813
G1 X102.119 Y98.953 E.00764
G1 X79.346 Y76.181 E.42732
G1 X79.922 Y76.181 E.00764
G1 X102.119 Y98.378 E.41652
G1 X102.119 Y97.802 E.00764
G1 X80.498 Y76.181 E.40572
G1 X81.074 Y76.181 E.00764
G1 X102.119 Y97.226 E.39491
G1 X102.119 Y96.65 E.00764
G1 X81.649 Y76.181 E.38411
G1 X82.225 Y76.181 E.00764
G1 X102.119 Y96.075 E.3733
G1 X102.119 Y95.499 E.00764
G1 X82.801 Y76.181 E.3625
G1 X83.377 Y76.181 E.00764
G1 X102.119 Y94.923 E.35169
G1 X102.119 Y94.348 E.00764
G1 X83.952 Y76.181 E.34089
G1 X84.528 Y76.181 E.00764
G1 X102.119 Y93.772 E.33008
G1 X102.119 Y93.196 E.00764
G1 X85.104 Y76.181 E.31928
G1 X85.68 Y76.181 E.00764
G1 X102.119 Y92.62 E.30848
G1 X102.119 Y92.045 E.00764
G1 X86.255 Y76.181 E.29767
G1 X86.831 Y76.181 E.00764
G1 X102.118 Y91.469 E.28687
G1 X102.118 Y90.893 E.00764
G1 X87.407 Y76.181 E.27606
G1 X87.983 Y76.181 E.00764
G1 X102.118 Y90.317 E.26526
G1 X102.118 Y89.742 E.00764
G1 X88.558 Y76.182 E.25445
G1 X89.134 Y76.182 E.00764
G1 X102.118 Y89.166 E.24365
G1 X102.118 Y88.59 E.00764
G1 X89.71 Y76.182 E.23284
G1 X90.285 Y76.182 E.00764
G1 X102.118 Y88.014 E.22204
G1 X102.118 Y87.439 E.00764
G1 X90.861 Y76.182 E.21124
G1 X91.437 Y76.182 E.00764
G1 X102.118 Y86.863 E.20043
G1 X102.118 Y86.287 E.00764
G1 X92.013 Y76.182 E.18963
G1 X92.588 Y76.182 E.00764
G1 X102.118 Y85.711 E.17882
G1 X102.118 Y85.136 E.00764
G1 X93.164 Y76.182 E.16802
G1 X93.74 Y76.182 E.00764
G1 X102.118 Y84.56 E.15721
G1 X102.118 Y83.984 E.00764
G1 X94.316 Y76.182 E.14641
G1 X94.891 Y76.182 E.00764
G1 X102.118 Y83.409 E.1356
G1 X102.118 Y82.833 E.00764
G1 X95.467 Y76.182 E.1248
G1 X96.043 Y76.182 E.00764
G1 X102.118 Y82.257 E.114
G1 X102.118 Y81.681 E.00764
G1 X96.619 Y76.182 E.10319
G1 X97.194 Y76.182 E.00764
G1 X102.118 Y81.106 E.09239
G1 X102.118 Y80.53 E.00764
G1 X97.77 Y76.182 E.08158
G1 X98.346 Y76.182 E.00764
G1 X102.118 Y79.954 E.07078
G1 X102.118 Y79.378 E.00764
G1 X98.922 Y76.182 E.05997
G1 X99.497 Y76.182 E.00764
G1 X102.118 Y78.803 E.04917
G1 X102.118 Y78.227 E.00764
G1 X100.073 Y76.182 E.03836
G1 X100.649 Y76.182 E.00764
G1 X102.118 Y77.651 E.02756
G1 X102.118 Y77.075 E.00764
G1 X101.225 Y76.183 E.01676
G1 X101.577 Y76.183 E.00468
G3 X101.914 Y76.297 I-.021 J.612 E.00478
G3 X102.299 Y76.681 I-7.626 J8.036 E.00721
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X101.914 Y76.297 E-.20658
G1 X101.771 Y76.221 E-.06135
G1 X101.577 Y76.183 E-.07514
G1 X101.225 Y76.183 E-.13406
G1 X101.751 Y76.709 E-.28288
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/99
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.84 I-.915 J-.803 P1  F42000
G1 X77.849 Y103.949 Z.84
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14957
M204 S6000
G1 X77.821 Y103.931 E.00047
G1 X77.616 Y103.671 E.00467
G1 X77.528 Y103.269 E.0058
G1 X77.528 Y77.269 E.36681
G3 X77.594 Y76.398 I2.675 J-.236 E.01238
G1 X77.793 Y76.082 E.00527
G1 X78.077 Y75.907 E.0047
G1 X78.438 Y75.828 E.00522
G1 X101.482 Y75.828 E.3251
G3 X101.966 Y75.926 I-.029 J1.386 E.00701
G1 X102.269 Y76.151 E.00533
G1 X102.404 Y76.376 E.00369
G1 X102.47 Y76.68 E.0044
G1 X102.47 Y102.68 E.36681
G3 X102.413 Y103.599 I-3.093 J.269 E.01304
G1 X102.259 Y103.848 E.00413
G1 X101.977 Y104.08 E.00515
G1 X101.577 Y104.172 E.0058
G1 X78.482 Y104.17 E.32583
G1 X78.101 Y104.113 E.00543
G1 X77.899 Y103.982 E.0034
M204 S250
G1 X77.614 Y104.306 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X77.403 Y104.115 E.00374
G1 X77.189 Y103.71 E.00602
G1 X77.11 Y103.29 E.00561
G1 X77.11 Y77.29 E.34139
G3 X77.132 Y76.535 I4.542 J-.246 E.00992
G1 X77.263 Y76.095 E.00604
G1 X77.491 Y75.787 E.00502
G1 X77.735 Y75.597 E.00407
G1 X78.089 Y75.45 E.00504
G1 X78.413 Y75.41 E.00428
G1 X101.482 Y75.41 E.3029
G1 X101.974 Y75.468 E.00651
G1 X102.315 Y75.629 E.00496
G1 X102.596 Y75.883 E.00497
G1 X102.791 Y76.21 E.005
G1 X102.888 Y76.68 E.00631
G1 X102.888 Y102.68 E.34139
G3 X102.849 Y103.549 I-3.713 J.269 E.01144
G1 X102.742 Y103.875 E.00451
G1 X102.568 Y104.129 E.00404
G1 X102.284 Y104.38 E.00499
G1 X102.004 Y104.508 E.00404
G1 X101.592 Y104.59 E.00552
G1 X78.482 Y104.588 E.30345
G1 X77.964 Y104.512 E.00687
G1 X77.686 Y104.372 E.00408
G1 X77.658 Y104.347 E.0005
; WIPE_START
M204 S6000
G1 X77.403 Y104.115 E-.13102
G1 X77.189 Y103.71 E-.17426
G1 X77.11 Y103.29 E-.16239
G1 X77.11 Y102.52 E-.29233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.769 Y94.916 Z.92 F42000
G1 X78.985 Y80.867 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14957
M204 S6000
G1 X79.068 Y80.566 E.00439
G3 X79.612 Y80.046 I1.006 J.506 E.01082
G1 X80.057 Y79.937 E.00647
G1 X80.286 Y79.961 E.00324
M73 P9 R14
G1 X80.735 Y80.165 E.00696
G1 X80.937 Y80.352 E.00388
G1 X81.113 Y80.635 E.0047
G1 X81.197 Y81.035 E.00577
G1 X81.114 Y81.492 E.00655
G1 X80.851 Y81.879 E.0066
G1 X80.402 Y82.14 E.00732
G1 X80.168 Y82.18 E.00336
G1 X79.778 Y82.154 E.00551
G1 X79.622 Y82.091 E.00238
G3 X79.203 Y81.778 I.476 J-1.073 E.00743
G1 X78.991 Y81.369 E.00649
G1 X78.945 Y81.014 E.00505
G1 X78.969 Y80.925 E.00131
M204 S250
G1 X79.376 Y80.963 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.375 Y80.946 E.00023
G1 X79.509 Y80.634 E.00446
G1 X79.735 Y80.445 E.00386
G1 X80.083 Y80.357 E.00471
G1 X80.309 Y80.401 E.00303
G1 X80.592 Y80.587 E.00444
G1 X80.736 Y80.828 E.00368
G1 X80.776 Y81.105 E.00367
G1 X80.705 Y81.376 E.00368
G1 X80.521 Y81.606 E.00387
G1 X80.178 Y81.762 E.00495
G1 X79.831 Y81.729 E.00458
G1 X79.548 Y81.543 E.00444
G1 X79.402 Y81.292 E.00381
G1 X79.381 Y81.023 E.00355
; WIPE_START
M204 S6000
G1 X79.375 Y80.946 E-.02935
G1 X79.509 Y80.634 E-.12894
G1 X79.735 Y80.445 E-.11171
G1 X80.083 Y80.357 E-.13643
G1 X80.309 Y80.401 E-.08775
G1 X80.592 Y80.587 E-.12853
G1 X80.736 Y80.828 E-.10661
G1 X80.748 Y80.908 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.92 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X77.699 Y80.71
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424238
G1 F14957
M204 S6000
G1 X82.228 Y76.181 E.08498
G1 X81.653 Y76.181 E.00764
G1 X77.881 Y79.953 E.07078
G1 X77.881 Y79.377 E.00764
G1 X81.077 Y76.181 E.05998
G1 X80.501 Y76.181 E.00764
G1 X77.881 Y78.801 E.04917
G1 X77.881 Y78.226 E.00764
G1 X79.926 Y76.181 E.03837
G1 X79.35 Y76.181 E.00764
G1 X77.881 Y77.65 E.02757
G1 X77.881 Y77.074 E.00764
G1 X78.774 Y76.181 E.01677
G2 X78.127 Y76.269 I-.157 J1.27 E.00877
G1 X77.709 Y76.67 E.00769
M204 S10000
G1 X77.699 Y84.739 F42000
G1 F14957
M204 S6000
G1 X79.913 Y82.526 E.04153
G3 X79.46 Y82.403 I.098 J-1.256 E.00626
G1 X77.881 Y83.982 E.02963
G1 X77.881 Y83.407 E.00764
G1 X79.116 Y82.171 E.02318
G3 X78.84 Y81.872 I.518 J-.755 E.00545
G1 X77.881 Y82.831 E.018
G1 X77.881 Y82.255 E.00764
G1 X78.662 Y81.474 E.01467
G1 X78.641 Y81.42 E.00076
G1 X78.59 Y81.011 E.00547
G1 X78.599 Y80.961 E.00067
G1 X77.881 Y81.68 E.01348
G1 X77.881 Y81.104 E.00764
G1 X82.804 Y76.181 E.09238
G1 X83.38 Y76.181 E.00764
G1 X79.969 Y79.591 E.064
G3 X80.478 Y79.658 I.076 J1.399 E.00685
G1 X83.955 Y76.181 E.06525
G1 X84.531 Y76.181 E.00764
G1 X80.874 Y79.838 E.06862
G3 X81.186 Y80.102 I-.643 J1.073 E.00544
G1 X85.107 Y76.181 E.07358
G1 X85.682 Y76.181 E.00764
G1 X81.411 Y80.452 E.08015
G1 X81.441 Y80.5 E.00075
G1 X81.535 Y80.904 E.0055
G1 X86.258 Y76.181 E.08863
G1 X86.834 Y76.181 E.00764
G1 X77.881 Y85.134 E.168
G1 X77.881 Y85.71 E.00764
G1 X87.41 Y76.181 E.1788
G1 X87.985 Y76.181 E.00764
G1 X77.881 Y86.285 E.1896
G1 X77.881 Y86.861 E.00764
G1 X88.561 Y76.181 E.20041
G1 X89.137 Y76.181 E.00764
G1 X77.881 Y87.437 E.21121
G1 X77.881 Y88.012 E.00764
G1 X89.712 Y76.181 E.22201
G1 X90.288 Y76.181 E.00764
G1 X77.881 Y88.588 E.23281
G1 X77.881 Y89.164 E.00764
G1 X90.864 Y76.181 E.24362
G1 X91.439 Y76.181 E.00764
G1 X77.881 Y89.739 E.25442
G1 X77.881 Y90.315 E.00764
G1 X92.015 Y76.181 E.26522
G1 X92.591 Y76.181 E.00764
G1 X77.881 Y90.891 E.27602
G1 X77.881 Y91.466 E.00764
G1 X93.166 Y76.181 E.28682
G1 X93.742 Y76.181 E.00764
G1 X77.881 Y92.042 E.29763
G1 X77.881 Y92.618 E.00764
G1 X94.318 Y76.181 E.30843
G1 X94.893 Y76.181 E.00764
G1 X77.881 Y93.193 E.31923
G1 X77.881 Y93.769 E.00764
G1 X95.469 Y76.181 E.33003
G1 X96.045 Y76.181 E.00764
G1 X77.881 Y94.345 E.34084
G1 X77.881 Y94.92 E.00764
G1 X96.62 Y76.181 E.35164
G1 X97.196 Y76.181 E.00764
G1 X77.881 Y95.496 E.36244
G1 X77.881 Y96.072 E.00764
G1 X97.772 Y76.181 E.37324
G1 X98.347 Y76.181 E.00764
G1 X77.881 Y96.648 E.38405
G1 X77.881 Y97.223 E.00764
G1 X98.923 Y76.181 E.39485
G1 X99.499 Y76.181 E.00764
G1 X77.881 Y97.799 E.40565
G1 X77.881 Y98.375 E.00764
G1 X100.075 Y76.181 E.41645
G1 X100.65 Y76.181 E.00764
G1 X77.881 Y98.95 E.42726
G1 X77.881 Y99.526 E.00764
G1 X101.226 Y76.181 E.43806
G3 X101.748 Y76.213 I.151 J1.771 E.00696
G1 X101.762 Y76.22 E.00021
G1 X77.881 Y100.102 E.44812
G1 X77.881 Y100.677 E.00764
G1 X102.063 Y76.495 E.45377
G3 X102.117 Y76.685 I-.284 J.183 E.00266
G1 X102.117 Y77.016 E.0044
G1 X77.881 Y101.253 E.45479
G1 X77.881 Y101.829 E.00764
G1 X102.117 Y77.592 E.45479
G1 X102.117 Y78.168 E.00764
G1 X77.881 Y102.404 E.45479
G1 X77.881 Y102.98 E.00764
G1 X102.117 Y78.743 E.45479
G1 X102.117 Y79.319 E.00764
G1 X77.932 Y103.504 E.45382
G2 X78.232 Y103.78 I.522 J-.267 E.00552
G1 X102.117 Y79.895 E.44819
G1 X102.117 Y80.47 E.00764
G1 X78.77 Y103.817 E.43809
G1 X79.346 Y103.818 E.00764
G1 X102.117 Y81.046 E.42729
G1 X102.117 Y81.622 E.00764
G1 X79.922 Y103.818 E.41649
G1 X80.497 Y103.818 E.00764
G1 X102.117 Y82.197 E.40569
G1 X102.117 Y82.773 E.00764
G1 X81.073 Y103.818 E.39489
G1 X81.649 Y103.818 E.00764
G1 X102.117 Y83.349 E.38409
G1 X102.117 Y83.924 E.00764
G1 X82.224 Y103.818 E.37329
G1 X82.8 Y103.818 E.00764
G1 X102.117 Y84.5 E.36248
G1 X102.117 Y85.076 E.00764
G1 X83.375 Y103.818 E.35168
G1 X83.951 Y103.818 E.00764
G1 X102.117 Y85.652 E.34088
G1 X102.117 Y86.227 E.00764
G1 X84.527 Y103.818 E.33008
G1 X85.102 Y103.818 E.00764
G1 X102.117 Y86.803 E.31928
G1 X102.117 Y87.379 E.00764
G1 X85.678 Y103.818 E.30848
G1 X86.254 Y103.818 E.00764
G1 X102.117 Y87.954 E.29767
G1 X102.117 Y88.53 E.00764
G1 X86.829 Y103.818 E.28687
G1 X87.405 Y103.818 E.00764
G1 X102.117 Y89.106 E.27607
G1 X102.117 Y89.681 E.00764
M73 P10 R14
G1 X87.981 Y103.818 E.26527
G1 X88.556 Y103.818 E.00764
G1 X102.117 Y90.257 E.25447
G1 X102.117 Y90.833 E.00764
G1 X89.132 Y103.818 E.24367
G1 X89.707 Y103.818 E.00764
G1 X102.117 Y91.408 E.23287
G1 X102.117 Y91.984 E.00764
G1 X90.283 Y103.818 E.22206
G1 X90.859 Y103.818 E.00764
G1 X102.117 Y92.56 E.21126
G1 X102.117 Y93.135 E.00764
G1 X91.434 Y103.818 E.20046
G1 X92.01 Y103.819 E.00764
G1 X102.117 Y93.711 E.18966
G1 X102.117 Y94.287 E.00764
G1 X92.586 Y103.819 E.17886
G1 X93.161 Y103.819 E.00764
G1 X102.117 Y94.862 E.16806
G1 X102.117 Y95.438 E.00764
G1 X93.737 Y103.819 E.15725
G1 X94.313 Y103.819 E.00764
G1 X102.117 Y96.014 E.14645
G1 X102.117 Y96.59 E.00764
G1 X94.888 Y103.819 E.13565
G1 X95.464 Y103.819 E.00764
G1 X102.117 Y97.165 E.12485
G1 X102.117 Y97.741 E.00764
G1 X96.039 Y103.819 E.11405
G1 X96.615 Y103.819 E.00764
G1 X102.117 Y98.317 E.10325
G1 X102.117 Y98.892 E.00764
G1 X97.191 Y103.819 E.09245
G1 X97.766 Y103.819 E.00764
G1 X102.117 Y99.468 E.08164
G1 X102.117 Y100.044 E.00764
G1 X98.342 Y103.819 E.07084
G1 X98.918 Y103.819 E.00764
G1 X102.117 Y100.619 E.06004
G1 X102.117 Y101.195 E.00764
G1 X99.493 Y103.819 E.04924
G1 X100.069 Y103.819 E.00764
G1 X102.117 Y101.771 E.03844
G1 X102.117 Y102.346 E.00764
G1 X100.645 Y103.819 E.02764
G1 X101.22 Y103.819 E.00764
G1 X102.117 Y102.922 E.01684
G1 X102.117 Y103.278 E.00472
G3 X102.031 Y103.574 I-.578 J-.008 E.00414
G3 X101.618 Y103.997 I-4.512 J-3.986 E.00785
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X102.031 Y103.574 E-.22478
G1 X102.077 Y103.483 E-.03837
G1 X102.117 Y103.278 E-.07961
G1 X102.117 Y102.922 E-.1352
G1 X101.593 Y103.447 E-.28204
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/99
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I-.026 J-1.217 P1  F42000
G1 X77.865 Y103.959 Z.92
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14986
M204 S6000
G1 X77.821 Y103.93 E.00075
G1 X77.616 Y103.671 E.00467
G1 X77.528 Y103.269 E.0058
G1 X77.528 Y77.269 E.36681
G3 X77.594 Y76.397 I2.674 J-.236 E.01239
G1 X77.793 Y76.082 E.00526
G1 X78.077 Y75.907 E.00471
G1 X78.438 Y75.828 E.00522
G1 X101.483 Y75.828 E.32511
G1 X101.851 Y75.872 E.00524
G1 X102.175 Y76.066 E.00533
G1 X102.38 Y76.324 E.00465
G1 X102.47 Y76.676 E.00513
G1 X102.472 Y103.202 E.37423
G1 X102.406 Y103.602 E.00572
G1 X102.207 Y103.918 E.00527
G1 X101.924 Y104.092 E.00469
G1 X101.562 Y104.172 E.00523
G1 X78.482 Y104.17 E.32562
G1 X78.101 Y104.113 E.00543
G1 X77.916 Y103.992 E.00312
M204 S250
G1 X77.629 Y104.32 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X77.402 Y104.114 E.00403
G1 X77.189 Y103.71 E.006
G1 X77.11 Y103.29 E.00562
G1 X77.11 Y77.29 E.34139
G3 X77.132 Y76.534 I4.525 J-.246 E.00994
G1 X77.263 Y76.094 E.00603
G1 X77.491 Y75.788 E.00501
G1 X77.736 Y75.596 E.00408
G1 X78.089 Y75.45 E.00503
G1 X78.413 Y75.41 E.00428
G1 X101.483 Y75.41 E.30291
G1 X101.974 Y75.468 E.00649
G1 X102.316 Y75.629 E.00496
G3 X102.681 Y76.017 I-1.405 J1.69 E.00701
G1 X102.809 Y76.297 E.00405
G1 X102.888 Y76.676 E.00508
G1 X102.89 Y102.676 E.34139
G3 X102.868 Y103.467 I-4.727 J.263 E.01041
G1 X102.737 Y103.905 E.006
G1 X102.509 Y104.213 E.00503
G1 X102.265 Y104.403 E.00406
G1 X101.911 Y104.55 E.00504
G1 X101.587 Y104.59 E.00428
G1 X78.482 Y104.588 E.30338
G1 X77.964 Y104.512 E.00687
G1 X77.687 Y104.373 E.00408
G1 X77.674 Y104.361 E.00023
; WIPE_START
M204 S6000
G1 X77.402 Y104.114 E-.13943
G1 X77.189 Y103.71 E-.17358
G1 X77.11 Y103.29 E-.16254
G1 X77.11 Y102.541 E-.28446
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.772 Y94.937 Z1 F42000
G1 X79.008 Y80.743 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14986
M204 S6000
G1 X79.033 Y80.643 E.00145
G3 X79.499 Y80.099 I1.047 J.424 E.01029
G1 X79.869 Y79.976 E.00549
G1 X80.265 Y79.954 E.0056
G1 X80.572 Y80.061 E.00458
G1 X80.923 Y80.335 E.00627
G3 X81.177 Y80.852 I-.916 J.773 E.0082
G1 X81.172 Y81.304 E.00638
G1 X80.942 Y81.777 E.00742
G1 X80.585 Y82.067 E.00649
G3 X79.777 Y82.148 I-.524 J-1.149 E.01167
G3 X79.107 Y81.641 I.427 J-1.26 E.01207
G1 X78.967 Y81.298 E.00522
G1 X78.958 Y80.939 E.00506
G1 X78.993 Y80.801 E.00201
M204 S250
G1 X79.4 Y80.843 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.579 Y80.556 E.00445
G1 X79.836 Y80.402 E.00393
G1 X80.232 Y80.377 E.00521
G1 X80.487 Y80.494 E.00368
G1 X80.676 Y80.7 E.00368
G1 X80.77 Y80.964 E.00368
G1 X80.748 Y81.258 E.00386
G1 X80.561 Y81.574 E.00483
G1 X80.324 Y81.725 E.00368
G1 X80.048 Y81.772 E.00368
G1 X79.85 Y81.737 E.00264
G1 X79.543 Y81.533 E.00484
G1 X79.379 Y81.226 E.00457
G1 X79.397 Y80.903 E.00424
; WIPE_START
M204 S6000
G1 X79.579 Y80.556 E-.14914
G1 X79.836 Y80.402 E-.11362
G1 X80.232 Y80.377 E-.15091
G1 X80.487 Y80.494 E-.10639
G1 X80.676 Y80.7 E-.10653
G1 X80.77 Y80.964 E-.1065
G1 X80.765 Y81.035 E-.02691
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X77.699 Y77.411
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424188
G1 F14986
M204 S6000
G1 X79.904 Y79.616 E.04137
G2 X79.456 Y79.744 I.026 J.943 E.00625
G1 X77.881 Y78.168 E.02956
G1 X77.881 Y78.744 E.00764
G1 X79.098 Y79.961 E.02283
G1 X78.834 Y80.272 E.00542
G1 X77.881 Y79.319 E.01788
G1 X77.881 Y79.895 E.00764
G1 X78.667 Y80.681 E.01474
G2 X78.605 Y81.195 I.978 J.378 E.00694
G1 X77.881 Y80.471 E.01359
G1 X77.881 Y81.046 E.00764
G1 X100.654 Y103.819 E.42727
G1 X101.229 Y103.819 E.00764
G1 X79.933 Y82.523 E.39957
G2 X80.464 Y82.478 I.18 J-1.031 E.00715
G1 X101.763 Y103.777 E.39961
G2 X102.066 Y103.504 I-.114 J-.431 E.00562
G1 X80.865 Y82.304 E.39777
G1 X81.179 Y82.042 E.00542
G1 X102.119 Y102.982 E.39289
G1 X102.119 Y102.407 E.00764
G1 X81.392 Y81.679 E.38889
G2 X81.535 Y81.247 I-.914 J-.543 E.00609
G1 X102.119 Y101.831 E.3862
G1 X102.119 Y101.255 E.00764
G1 X77.881 Y77.017 E.45476
G3 X77.935 Y76.495 I1.262 J-.133 E.00701
G1 X102.119 Y100.68 E.45375
G1 X102.119 Y100.104 E.00764
G1 X78.238 Y76.223 E.44806
G3 X78.771 Y76.181 I.371 J1.3 E.00715
G1 X102.119 Y99.528 E.43805
G1 X102.119 Y98.953 E.00764
G1 X79.347 Y76.181 E.42725
G1 X79.923 Y76.181 E.00764
G1 X102.119 Y98.377 E.41645
G1 X102.119 Y97.801 E.00764
G1 X80.498 Y76.181 E.40565
G1 X81.074 Y76.181 E.00764
G1 X102.119 Y97.226 E.39485
G1 X102.119 Y96.65 E.00764
G1 X81.649 Y76.181 E.38405
G1 X82.225 Y76.181 E.00764
G1 X102.119 Y96.074 E.37325
G1 X102.119 Y95.499 E.00764
G1 X82.801 Y76.181 E.36245
G1 X83.376 Y76.181 E.00764
G1 X102.119 Y94.923 E.35165
G1 X102.119 Y94.348 E.00764
G1 X83.952 Y76.181 E.34085
G1 X84.528 Y76.181 E.00764
G1 X102.119 Y93.772 E.33005
G1 X102.119 Y93.196 E.00764
G1 X85.103 Y76.181 E.31925
G1 X85.679 Y76.181 E.00764
G1 X102.119 Y92.621 E.30845
G1 X102.119 Y92.045 E.00764
G1 X86.254 Y76.181 E.29764
G1 X86.83 Y76.181 E.00764
G1 X102.118 Y91.469 E.28684
G1 X102.118 Y90.894 E.00764
G1 X87.406 Y76.181 E.27604
G1 X87.981 Y76.181 E.00764
G1 X102.118 Y90.318 E.26524
G1 X102.118 Y89.742 E.00764
G1 X88.557 Y76.181 E.25444
M73 P11 R14
G1 X89.132 Y76.181 E.00764
G1 X102.118 Y89.167 E.24364
G1 X102.118 Y88.591 E.00764
G1 X89.708 Y76.181 E.23284
G1 X90.284 Y76.181 E.00764
G1 X102.118 Y88.015 E.22204
G1 X102.118 Y87.44 E.00764
G1 X90.859 Y76.181 E.21124
G1 X91.435 Y76.181 E.00764
G1 X102.118 Y86.864 E.20044
G1 X102.118 Y86.288 E.00764
G1 X92.011 Y76.181 E.18964
G1 X92.586 Y76.181 E.00764
G1 X102.118 Y85.713 E.17884
G1 X102.118 Y85.137 E.00764
G1 X93.162 Y76.181 E.16804
G1 X93.737 Y76.181 E.00764
G1 X102.118 Y84.561 E.15724
G1 X102.118 Y83.986 E.00764
G1 X94.313 Y76.181 E.14644
G1 X94.889 Y76.181 E.00764
G1 X102.118 Y83.41 E.13564
G1 X102.118 Y82.834 E.00764
G1 X95.464 Y76.181 E.12484
G1 X96.04 Y76.181 E.00764
G1 X102.118 Y82.259 E.11404
G1 X102.118 Y81.683 E.00764
G1 X96.615 Y76.181 E.10324
G1 X97.191 Y76.181 E.00764
G1 X102.118 Y81.108 E.09244
G1 X102.118 Y80.532 E.00764
G1 X97.767 Y76.181 E.08164
G1 X98.342 Y76.181 E.00764
G1 X102.118 Y79.956 E.07084
G1 X102.118 Y79.381 E.00764
G1 X98.918 Y76.181 E.06003
G1 X99.493 Y76.181 E.00764
G1 X102.118 Y78.805 E.04923
G1 X102.118 Y78.229 E.00764
G1 X100.069 Y76.181 E.03843
G1 X100.645 Y76.181 E.00764
G1 X102.118 Y77.654 E.02763
G1 X102.118 Y77.078 E.00764
G1 X101.22 Y76.181 E.01683
G3 X101.883 Y76.277 I.163 J1.206 E.009
G3 X102.299 Y76.684 I-3.934 J4.444 E.00772
M204 S10000
G1 X100.259 Y104 F42000
G1 F14986
M204 S6000
G1 X77.881 Y81.622 E.41987
G1 X77.881 Y82.197 E.00764
G1 X99.502 Y103.819 E.40567
G1 X98.927 Y103.819 E.00764
G1 X77.881 Y82.773 E.39487
G1 X77.881 Y83.349 E.00764
G1 X98.351 Y103.819 E.38407
G1 X97.775 Y103.819 E.00764
G1 X77.881 Y83.924 E.37327
G1 X77.881 Y84.5 E.00764
G1 X97.2 Y103.819 E.36247
G1 X96.624 Y103.819 E.00764
G1 X77.881 Y85.076 E.35166
G1 X77.881 Y85.651 E.00764
G1 X96.048 Y103.819 E.34086
G1 X95.473 Y103.819 E.00764
G1 X77.881 Y86.227 E.33006
G1 X77.881 Y86.802 E.00764
G1 X94.897 Y103.819 E.31926
G1 X94.321 Y103.819 E.00764
G1 X77.881 Y87.378 E.30846
G1 X77.881 Y87.954 E.00764
G1 X93.746 Y103.819 E.29766
G1 X93.17 Y103.819 E.00764
G1 X77.881 Y88.529 E.28686
G1 X77.881 Y89.105 E.00764
G1 X92.594 Y103.819 E.27606
G1 X92.019 Y103.819 E.00764
G1 X77.881 Y89.68 E.26526
G1 X77.881 Y90.256 E.00764
G1 X91.443 Y103.818 E.25446
G1 X90.868 Y103.818 E.00764
G1 X77.881 Y90.832 E.24366
G1 X77.881 Y91.407 E.00764
G1 X90.292 Y103.818 E.23286
G1 X89.716 Y103.818 E.00764
G1 X77.881 Y91.983 E.22206
G1 X77.881 Y92.558 E.00764
G1 X89.141 Y103.818 E.21126
G1 X88.565 Y103.818 E.00764
G1 X77.881 Y93.134 E.20046
G1 X77.881 Y93.71 E.00764
G1 X87.989 Y103.818 E.18966
G1 X87.414 Y103.818 E.00764
G1 X77.881 Y94.285 E.17886
G1 X77.881 Y94.861 E.00764
G1 X86.838 Y103.818 E.16806
G1 X86.262 Y103.818 E.00764
G1 X77.881 Y95.437 E.15725
G1 X77.881 Y96.012 E.00764
G1 X85.687 Y103.818 E.14645
G1 X85.111 Y103.818 E.00764
G1 X77.881 Y96.588 E.13565
G1 X77.881 Y97.163 E.00764
G1 X84.535 Y103.818 E.12485
G1 X83.96 Y103.818 E.00764
G1 X77.881 Y97.739 E.11405
G1 X77.881 Y98.315 E.00764
G1 X83.384 Y103.818 E.10325
G1 X82.808 Y103.818 E.00764
G1 X77.881 Y98.89 E.09245
G1 X77.881 Y99.466 E.00764
G1 X82.233 Y103.818 E.08165
G1 X81.657 Y103.818 E.00764
G1 X77.881 Y100.041 E.07085
G1 X77.881 Y100.617 E.00764
G1 X81.081 Y103.818 E.06005
G1 X80.506 Y103.818 E.00764
G1 X77.881 Y101.193 E.04925
G1 X77.881 Y101.768 E.00764
G1 X79.93 Y103.818 E.03845
G1 X79.354 Y103.818 E.00764
G1 X77.881 Y102.344 E.02765
G1 X77.881 Y102.92 E.00764
G1 X78.779 Y103.818 E.01685
G3 X78.217 Y103.777 I-.178 J-1.433 E.00752
G3 X78.02 Y103.634 I.158 J-.426 E.00327
G1 X77.705 Y103.32 E.0059
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X78.02 Y103.634 E-.16894
G1 X78.127 Y103.731 E-.05497
G1 X78.217 Y103.777 E-.03829
G1 X78.423 Y103.817 E-.07974
G1 X78.779 Y103.818 E-.13533
G1 X78.253 Y103.291 E-.28273
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/99
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1 I-1.077 J-.567 P1  F42000
G1 X77.89 Y103.979 Z1
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14856
M204 S6000
G1 X77.755 Y103.863 E.00252
G1 X77.609 Y103.626 E.00393
G1 X77.528 Y103.262 E.00527
G1 X77.528 Y77.262 E.36681
G3 X77.594 Y76.397 I2.649 J-.232 E.01229
G1 X77.793 Y76.082 E.00525
G1 X78.076 Y75.908 E.00468
G1 X78.438 Y75.828 E.00524
G1 X101.483 Y75.828 E.32512
G3 X101.966 Y75.926 I-.029 J1.378 E.00699
G1 X102.269 Y76.151 E.00533
G1 X102.404 Y76.376 E.00369
G1 X102.47 Y76.68 E.0044
G1 X102.47 Y102.68 E.36681
G3 X102.452 Y103.406 I-3.683 J.27 E.01027
G1 X102.356 Y103.703 E.00439
G1 X102.115 Y103.995 E.00534
G1 X101.885 Y104.118 E.00369
G1 X101.585 Y104.172 E.0043
G1 X78.498 Y104.172 E.3257
G1 X78.379 Y104.165 E.00169
G1 X77.99 Y104.064 E.00567
G1 X77.936 Y104.018 E.001
M204 S250
G1 X77.613 Y104.301 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X77.536 Y104.255 E.00118
G1 X77.296 Y103.962 E.00497
G1 X77.15 Y103.611 E.005
G1 X77.11 Y103.287 E.00428
G1 X77.11 Y77.287 E.34139
G3 X77.132 Y76.533 I4.501 J-.245 E.00992
G1 X77.264 Y76.093 E.00603
G1 X77.491 Y75.787 E.005
G1 X77.734 Y75.598 E.00405
G1 X78.092 Y75.449 E.00509
G1 X78.413 Y75.41 E.00425
G1 X101.483 Y75.41 E.30292
G1 X101.974 Y75.468 E.00649
G1 X102.315 Y75.629 E.00496
G1 X102.596 Y75.883 E.00496
G1 X102.791 Y76.21 E.005
G1 X102.888 Y76.68 E.00631
G1 X102.888 Y102.68 E.34139
G3 X102.813 Y103.734 I-3.621 J.27 E.01392
G1 X102.636 Y104.065 E.00493
G1 X102.367 Y104.334 E.00499
G1 X102.032 Y104.514 E.00499
G1 X101.595 Y104.59 E.00582
G1 X78.498 Y104.59 E.30326
G3 X77.93 Y104.489 I.025 J-1.796 E.00761
G1 X77.664 Y104.331 E.00406
; WIPE_START
M204 S6000
G1 X77.536 Y104.255 E-.05687
G1 X77.296 Y103.962 E-.14386
G1 X77.15 Y103.611 E-.14457
G1 X77.11 Y103.287 E-.1238
G1 X77.11 Y102.522 E-.2909
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.77 Y94.918 Z1.08 F42000
G1 X78.997 Y80.777 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14856
M204 S6000
G1 X79.021 Y80.681 E.00138
G3 X79.784 Y79.987 I1.068 J.407 E.01511
G1 X80.265 Y79.954 E.00681
G1 X80.572 Y80.061 E.00459
G1 X80.923 Y80.335 E.00627
G1 X81.061 Y80.538 E.00346
G1 X81.187 Y80.926 E.00575
G1 X81.142 Y81.415 E.00693
G1 X80.922 Y81.803 E.0063
G1 X80.585 Y82.067 E.00604
G1 X80.22 Y82.177 E.00537
G1 X79.975 Y82.183 E.00346
G1 X79.548 Y82.059 E.00627
G3 X79.186 Y81.752 I.491 J-.946 E.00675
G1 X78.974 Y81.322 E.00677
G1 X78.952 Y80.964 E.00506
G1 X78.983 Y80.835 E.00187
M204 S250
G1 X79.392 Y80.872 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.58 Y80.556 E.00483
G1 X79.836 Y80.401 E.00393
G1 X80.232 Y80.377 E.00521
G1 X80.487 Y80.494 E.00368
G1 X80.676 Y80.7 E.00368
G1 X80.769 Y80.979 E.00386
G1 X80.72 Y81.344 E.00483
G1 X80.56 Y81.575 E.00369
G1 X80.324 Y81.725 E.00368
G1 X80.048 Y81.772 E.00368
G1 X79.775 Y81.708 E.00368
G1 X79.543 Y81.534 E.0038
G1 X79.383 Y81.225 E.00457
G1 X79.391 Y80.932 E.00385
; WIPE_START
M204 S6000
G1 X79.58 Y80.556 E-.16006
G1 X79.836 Y80.401 E-.11364
G1 X80.232 Y80.377 E-.15075
G1 X80.487 Y80.494 E-.10658
G1 X80.676 Y80.7 E-.10647
G1 X80.769 Y80.979 E-.11183
G1 X80.766 Y81.007 E-.01066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.08 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X77.699 Y80.709
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424188
G1 F14856
M204 S6000
G1 X82.227 Y76.181 E.08495
G1 X81.652 Y76.181 E.00764
G1 X77.881 Y79.952 E.07075
G1 X77.881 Y79.376 E.00764
G1 X81.076 Y76.181 E.05995
G1 X80.5 Y76.181 E.00764
G1 X77.881 Y78.8 E.04915
G1 X77.881 Y78.225 E.00764
G1 X79.925 Y76.181 E.03835
G1 X79.349 Y76.181 E.00764
G1 X77.881 Y77.649 E.02755
G1 X77.881 Y77.074 E.00764
G1 X78.774 Y76.181 E.01675
G2 X78.126 Y76.27 I-.157 J1.264 E.00878
G1 X77.709 Y76.669 E.00766
M204 S10000
M73 P12 R14
G1 X77.699 Y84.738 F42000
G1 F14856
M204 S6000
G1 X79.917 Y82.521 E.0416
G3 X79.462 Y82.399 I.009 J-.944 E.0063
G1 X77.881 Y83.981 E.02967
G1 X77.881 Y83.405 E.00764
G1 X79.112 Y82.174 E.02311
G1 X78.893 Y81.949 E.00416
G1 X78.843 Y81.867 E.00127
G1 X77.881 Y82.83 E.01806
G1 X77.881 Y82.254 E.00764
G1 X78.659 Y81.476 E.0146
G1 X78.626 Y81.389 E.00124
G1 X78.609 Y80.95 E.00582
G1 X77.881 Y81.679 E.01367
G1 X77.881 Y81.103 E.00764
G1 X82.803 Y76.181 E.09235
G1 X83.379 Y76.181 E.00764
G1 X79.949 Y79.611 E.06435
G3 X80.484 Y79.651 I.177 J1.235 E.00718
G1 X83.954 Y76.181 E.0651
G1 X84.53 Y76.181 E.00764
G1 X80.871 Y79.839 E.06864
G3 X81.179 Y80.107 I-.374 J.74 E.00547
G1 X85.105 Y76.181 E.07367
G1 X85.681 Y76.181 E.00764
G1 X81.404 Y80.458 E.08025
G3 X81.539 Y80.898 I-.966 J.539 E.00615
G1 X86.257 Y76.181 E.0885
G1 X86.832 Y76.181 E.00764
G1 X77.881 Y85.132 E.16795
G1 X77.881 Y85.708 E.00764
G1 X87.408 Y76.181 E.17875
G1 X87.983 Y76.181 E.00764
G1 X77.881 Y86.283 E.18955
G1 X77.881 Y86.859 E.00764
G1 X88.559 Y76.181 E.20035
G1 X89.135 Y76.181 E.00764
G1 X77.881 Y87.435 E.21115
G1 X77.881 Y88.01 E.00764
G1 X89.71 Y76.181 E.22195
G1 X90.286 Y76.181 E.00764
G1 X77.881 Y88.586 E.23275
G1 X77.881 Y89.162 E.00764
G1 X90.861 Y76.181 E.24355
G1 X91.437 Y76.181 E.00764
G1 X77.881 Y89.737 E.25435
G1 X77.881 Y90.313 E.00764
G1 X92.013 Y76.181 E.26515
G1 X92.588 Y76.181 E.00764
G1 X77.881 Y90.888 E.27595
G1 X77.881 Y91.464 E.00764
G1 X93.164 Y76.181 E.28674
G1 X93.74 Y76.181 E.00764
G1 X77.881 Y92.04 E.29754
G1 X77.881 Y92.615 E.00764
G1 X94.315 Y76.181 E.30834
G1 X94.891 Y76.181 E.00764
G1 X77.881 Y93.191 E.31914
G1 X77.881 Y93.766 E.00764
G1 X95.466 Y76.181 E.32994
G1 X96.042 Y76.181 E.00764
G1 X77.881 Y94.342 E.34074
G1 X77.881 Y94.918 E.00764
G1 X96.618 Y76.181 E.35154
G1 X97.193 Y76.181 E.00764
G1 X77.881 Y95.493 E.36234
G1 X77.881 Y96.069 E.00764
G1 X97.769 Y76.181 E.37314
G1 X98.344 Y76.181 E.00764
G1 X77.881 Y96.645 E.38394
G1 X77.881 Y97.22 E.00764
G1 X98.92 Y76.181 E.39474
G1 X99.496 Y76.181 E.00764
G1 X77.881 Y97.796 E.40554
G1 X77.881 Y98.371 E.00764
G1 X100.071 Y76.181 E.41634
G1 X100.647 Y76.181 E.00764
G1 X77.881 Y98.947 E.42714
G1 X77.881 Y99.523 E.00764
G1 X101.223 Y76.181 E.43794
G3 X101.747 Y76.213 I.154 J1.778 E.007
G1 X101.76 Y76.219 E.00018
G1 X77.881 Y100.098 E.44802
G1 X77.881 Y100.674 E.00764
G1 X102.062 Y76.492 E.45369
G3 X102.117 Y76.685 I-.286 J.187 E.00269
G1 X102.117 Y77.013 E.00435
G1 X77.881 Y101.249 E.45473
G1 X77.881 Y101.825 E.00764
G1 X102.117 Y77.588 E.45473
G1 X102.117 Y78.164 E.00764
G1 X77.881 Y102.401 E.45473
G1 X77.881 Y102.976 E.00764
G1 X102.117 Y78.74 E.45473
G1 X102.117 Y79.315 E.00764
G1 X77.937 Y103.496 E.45368
G2 X78.229 Y103.779 I.414 J-.136 E.00562
G1 X102.117 Y79.891 E.44819
G1 X102.117 Y80.466 E.00764
G1 X78.765 Y103.819 E.43815
G1 X79.34 Y103.819 E.00764
G1 X102.117 Y81.042 E.42735
G1 X102.117 Y81.618 E.00764
G1 X79.916 Y103.819 E.41655
G1 X80.491 Y103.819 E.00764
G1 X102.117 Y82.193 E.40575
G1 X102.117 Y82.769 E.00764
G1 X81.067 Y103.819 E.39495
G1 X81.643 Y103.819 E.00764
G1 X102.117 Y83.344 E.38415
G1 X102.117 Y83.92 E.00764
G1 X82.218 Y103.819 E.37335
G1 X82.794 Y103.819 E.00764
G1 X102.117 Y84.496 E.36255
G1 X102.117 Y85.071 E.00764
G1 X83.369 Y103.819 E.35175
G1 X83.945 Y103.819 E.00764
G1 X102.117 Y85.647 E.34095
G1 X102.117 Y86.223 E.00764
G1 X84.521 Y103.819 E.33015
G1 X85.096 Y103.819 E.00764
G1 X102.117 Y86.798 E.31935
G1 X102.117 Y87.374 E.00764
G1 X85.672 Y103.819 E.30855
G1 X86.248 Y103.819 E.00764
G1 X102.117 Y87.949 E.29775
G1 X102.117 Y88.525 E.00764
G1 X86.823 Y103.819 E.28695
G1 X87.399 Y103.819 E.00764
G1 X102.117 Y89.101 E.27615
G1 X102.117 Y89.676 E.00764
G1 X87.974 Y103.819 E.26535
G1 X88.55 Y103.819 E.00764
G1 X102.117 Y90.252 E.25455
G1 X102.117 Y90.827 E.00764
G1 X89.126 Y103.819 E.24375
G1 X89.701 Y103.819 E.00764
G1 X102.117 Y91.403 E.23295
G1 X102.117 Y91.979 E.00764
G1 X90.277 Y103.819 E.22215
G1 X90.852 Y103.819 E.00764
G1 X102.117 Y92.554 E.21135
G1 X102.117 Y93.13 E.00764
G1 X91.428 Y103.819 E.20055
G1 X92.004 Y103.819 E.00764
G1 X102.117 Y93.706 E.18975
M73 P13 R14
G1 X102.117 Y94.281 E.00764
G1 X92.579 Y103.819 E.17895
G1 X93.155 Y103.819 E.00764
G1 X102.117 Y94.857 E.16815
G1 X102.117 Y95.432 E.00764
G1 X93.73 Y103.819 E.15736
G1 X94.306 Y103.819 E.00764
G1 X102.117 Y96.008 E.14656
G1 X102.117 Y96.584 E.00764
G1 X94.882 Y103.819 E.13576
G1 X95.457 Y103.819 E.00764
G1 X102.117 Y97.159 E.12496
G1 X102.117 Y97.735 E.00764
G1 X96.033 Y103.819 E.11416
G1 X96.609 Y103.819 E.00764
G1 X102.117 Y98.31 E.10336
G1 X102.117 Y98.886 E.00764
G1 X97.184 Y103.819 E.09256
G1 X97.76 Y103.819 E.00764
G1 X102.117 Y99.462 E.08176
G1 X102.117 Y100.037 E.00764
G1 X98.335 Y103.819 E.07096
G1 X98.911 Y103.819 E.00764
G1 X102.117 Y100.613 E.06016
G1 X102.117 Y101.189 E.00764
G1 X99.487 Y103.819 E.04936
G1 X100.062 Y103.819 E.00764
G1 X102.117 Y101.764 E.03856
G1 X102.117 Y102.34 E.00764
G1 X100.638 Y103.819 E.02776
G1 X101.213 Y103.819 E.00764
G1 X102.117 Y102.915 E.01696
G1 X102.117 Y103.279 E.00483
G3 X102.013 Y103.596 I-.576 J-.015 E.00449
G1 X101.613 Y103.995 E.00749
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X102.013 Y103.596 E-.21462
G1 X102.079 Y103.471 E-.05349
G1 X102.117 Y103.279 E-.07449
G1 X102.117 Y102.915 E-.13826
G1 X101.598 Y103.435 E-.27913
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/99
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I.946 J-.765 P1  F42000
G1 X82.919 Y80.331 Z1.08
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.357168
G1 F18000
M204 S6000
G1 X82.855 Y80.368 E.00082
G1 X82.919 Y80.405 E.00082
G1 X82.94 Y80.368 E.00047
; WIPE_START
G1 X82.919 Y80.405 E-.17025
G1 X82.855 Y80.368 E-.29487
G1 X82.919 Y80.331 E-.29487
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.368 Y81.01 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.497 Y80.653 E.00498
G1 X79.761 Y80.431 E.00453
G1 X80.072 Y80.356 E.00421
G1 X80.241 Y80.381 E.00224
G1 X80.548 Y80.546 E.00457
G1 X80.736 Y80.828 E.00445
G1 X80.776 Y81.105 E.00368
G1 X80.696 Y81.388 E.00386
G1 X80.45 Y81.662 E.00483
G1 X80.188 Y81.762 E.00368
G1 X79.899 Y81.75 E.0038
G1 X79.592 Y81.584 E.00458
G1 X79.404 Y81.302 E.00445
G1 X79.375 Y81.07 E.00308
; WIPE_START
M204 S6000
G1 X79.497 Y80.653 E-.16483
G1 X79.761 Y80.431 E-.13121
G1 X80.072 Y80.356 E-.12172
G1 X80.241 Y80.381 E-.06483
G1 X80.548 Y80.546 E-.13229
G1 X80.736 Y80.828 E-.12883
G1 X80.742 Y80.87 E-.01629
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.64 Y87.931 Z1.16 F42000
G1 X84.9 Y91 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.357168
G1 F18000
M204 S6000
G1 X84.9 Y92 E.01108
; WIPE_START
G1 X84.9 Y91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.9 Y96 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F18000
M204 S6000
G1 X84.9 Y97 E.01108
; WIPE_START
G1 X84.9 Y96 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.898 Y101.765 Z1.16 F42000
G1 X77.657 Y104.346 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X77.403 Y104.115 E.00451
G1 X77.189 Y103.709 E.00603
G1 X77.11 Y103.29 E.0056
G1 X77.11 Y77.29 E.34139
G3 X77.132 Y76.535 I4.544 J-.246 E.00993
G1 X77.263 Y76.095 E.00603
G1 X77.491 Y75.787 E.00503
G1 X77.736 Y75.596 E.00407
G1 X78.09 Y75.45 E.00503
G1 X78.413 Y75.41 E.00427
G1 X101.484 Y75.41 E.30293
G1 X101.974 Y75.468 E.00648
G1 X102.315 Y75.629 E.00496
G3 X102.681 Y76.017 I-1.399 J1.684 E.00702
G3 X102.888 Y76.676 I-1.347 J.786 E.00914
G1 X102.888 Y102.676 E.34139
G3 X102.849 Y103.549 I-3.73 J.271 E.0115
G1 X102.742 Y103.875 E.00451
G1 X102.568 Y104.129 E.00404
G1 X102.284 Y104.38 E.00498
G1 X102.004 Y104.508 E.00404
G1 X101.592 Y104.59 E.00552
G1 X78.482 Y104.588 E.30344
G1 X77.964 Y104.512 E.00687
G1 X77.705 Y104.382 E.0038
; WIPE_START
M204 S6000
G1 X77.403 Y104.115 E-.15309
G1 X77.189 Y103.709 E-.17438
G1 X77.11 Y103.29 E-.16221
G1 X77.11 Y102.578 E-.27032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.294 Y96.977 Z1.16 F42000
G1 X101.864 Y75.828 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.405748
G1 F18000
M204 S6000
G1 X101.559 Y75.806 E.00388
G1 X86.444 Y75.806 E.19144
; WIPE_START
G1 X88.444 Y75.806 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.908 Y83.419 Z1.16 F42000
G1 X86.444 Y104.194 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.404668
G1 F18000
M204 S6000
G1 X87.503 Y104.194 E.01338
; LINE_WIDTH: 0.404818
G1 X89.503 Y104.194 E.02527
; LINE_WIDTH: 0.404968
G1 X91.503 Y104.194 E.02528
; LINE_WIDTH: 0.405128
G1 X93.503 Y104.194 E.02529
; LINE_WIDTH: 0.405278
G1 X95.503 Y104.194 E.0253
; LINE_WIDTH: 0.405438
G1 X97.503 Y104.194 E.02531
; LINE_WIDTH: 0.405588
G1 X99.503 Y104.194 E.02532
; LINE_WIDTH: 0.405748
G1 X101.503 Y104.194 E.02533
G1 X101.81 Y104.174 E.0039
; WIPE_START
G1 X101.503 Y104.194 E-.11687
G1 X99.811 Y104.194 E-.64313
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.16 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X102.667 Y76.746
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X101.941 Y76.02 E.01348
G1 X101.371 Y76.02
G1 X102.667 Y77.316 E.02406
G1 X102.667 Y77.885
G1 X100.801 Y76.02 E.03463
G1 X100.232 Y76.02
G1 X102.667 Y78.455 E.04521
G1 X102.667 Y79.025
G1 X99.662 Y76.02 E.05579
G1 X99.092 Y76.02
G1 X102.667 Y79.594 E.06637
G1 X102.667 Y80.164
G1 X98.523 Y76.02 E.07695
G1 X97.953 Y76.02
G1 X102.667 Y80.734 E.08753
G1 X102.667 Y81.303
G1 X97.383 Y76.02 E.09811
G1 X96.814 Y76.02
G1 X102.667 Y81.873 E.10868
G1 X102.667 Y82.443
G1 X96.244 Y76.02 E.11926
G1 X95.674 Y76.02
G1 X102.667 Y83.013 E.12984
M73 P13 R13
G1 X102.667 Y83.582
G1 X95.105 Y76.02 E.14042
G1 X94.535 Y76.02
G1 X102.667 Y84.152 E.151
G1 X102.667 Y84.722
G1 X93.965 Y76.02 E.16158
G1 X93.396 Y76.02
G1 X102.667 Y85.291 E.17216
G1 X102.667 Y85.861
G1 X92.826 Y76.02 E.18273
G1 X92.256 Y76.02
G1 X102.667 Y86.431 E.19331
G1 X102.667 Y87
G1 X91.686 Y76.02 E.20389
G1 X91.117 Y76.02
G1 X102.667 Y87.57 E.21447
G1 X102.667 Y88.14
G1 X90.547 Y76.02 E.22505
G1 X89.977 Y76.02
G1 X102.667 Y88.709 E.23563
G1 X102.667 Y89.279
G1 X89.408 Y76.02 E.24621
G1 X88.838 Y76.02
G1 X102.667 Y89.849 E.25678
G1 X102.667 Y90.418
G1 X88.268 Y76.02 E.26736
G1 X87.699 Y76.02
G1 X102.667 Y90.988 E.27794
G1 X102.667 Y91.558
G1 X87.129 Y76.02 E.28852
G1 X86.559 Y76.02
G1 X102.667 Y92.128 E.2991
G1 X102.667 Y92.697
G1 X85.601 Y75.632 E.31689
G1 X85.031 Y75.632
G1 X102.667 Y93.267 E.32747
G1 X102.667 Y93.837
G1 X84.462 Y75.632 E.33805
G1 X83.892 Y75.632
G1 X102.667 Y94.406 E.34863
G1 X102.667 Y94.976
G1 X83.322 Y75.632 E.35921
M73 P14 R13
G1 X82.753 Y75.632
G1 X102.667 Y95.546 E.36978
G1 X102.667 Y96.115
G1 X82.183 Y75.632 E.38036
G1 X81.613 Y75.632
G1 X102.667 Y96.685 E.39094
G1 X102.667 Y97.255
G1 X81.044 Y75.632 E.40152
G1 X80.474 Y75.632
G1 X102.667 Y97.824 E.4121
G1 X102.667 Y98.394
G1 X79.904 Y75.632 E.42268
G1 X79.334 Y75.632
G1 X102.667 Y98.964 E.43326
G1 X102.667 Y99.533
G1 X78.765 Y75.632 E.44383
G1 X78.22 Y75.657
G1 X82.794 Y80.23 E.08493
G1 X83.046 Y80.482
G1 X102.667 Y100.103 E.36434
G1 X102.667 Y100.673
G1 X77.812 Y75.818 E.46153
G1 X77.53 Y76.106
G1 X102.667 Y101.243 E.46676
G1 X102.667 Y101.812
G1 X77.359 Y76.504 E.46994
G1 X77.332 Y77.047
G1 X80.593 Y80.309 E.06057
G1 X79.88 Y80.165
G1 X77.332 Y77.616 E.04733
G1 X77.332 Y78.186
G1 X79.493 Y80.348 E.04014
G1 X79.24 Y80.664
G1 X77.332 Y78.756 E.03544
G1 X77.332 Y79.326
G1 X79.145 Y81.139 E.03367
; WIPE_START
M204 S6000
G1 X77.731 Y79.725 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.826 Y80.541 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X102.667 Y102.382 E.40556
G1 X102.667 Y102.952
G1 X80.971 Y81.256 E.40287
G1 X80.786 Y81.641
G1 X102.635 Y103.49 E.40571
G1 X102.476 Y103.9
G1 X80.468 Y81.893 E.40866
G1 X79.995 Y81.989
G1 X101.986 Y103.98 E.40836
G1 X101.416 Y103.98
G1 X77.332 Y79.895 E.44723
G1 X77.332 Y80.465
G1 X100.847 Y103.98 E.43665
G1 X100.277 Y103.98
G1 X77.332 Y81.035 E.42607
G1 X77.332 Y81.604
G1 X99.707 Y103.98 E.41549
G1 X99.137 Y103.98
G1 X77.332 Y82.174 E.40491
G1 X77.332 Y82.744
G1 X98.568 Y103.98 E.39434
G1 X97.998 Y103.98
G1 X84.97 Y90.952 E.24192
G1 X84.97 Y91.522
G1 X97.428 Y103.98 E.23134
G1 X96.859 Y103.98
G1 X84.949 Y92.07 E.22115
G1 X84.948 Y90.93
G1 X77.332 Y83.313 E.14143
G1 X77.332 Y83.883
G1 X84.83 Y91.381 E.13924
G1 X84.83 Y91.951
G1 X77.332 Y84.453 E.13924
G1 X77.332 Y85.022
G1 X96.289 Y103.98 E.35202
G1 X95.719 Y103.98
G1 X77.332 Y85.592 E.34144
G1 X77.332 Y86.162
G1 X95.15 Y103.98 E.33086
G1 X94.58 Y103.98
G1 X77.332 Y86.731 E.32029
G1 X77.332 Y87.301
G1 X94.01 Y103.98 E.30971
G1 X93.441 Y103.98
G1 X77.332 Y87.871 E.29913
G1 X77.332 Y88.441
G1 X84.83 Y95.939 E.13924
M73 P15 R13
G1 X84.83 Y96.509
G1 X77.332 Y89.01 E.13924
; WIPE_START
M204 S6000
G1 X78.746 Y90.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.395 Y95.557 Z1.16 F42000
G1 X84.97 Y96.079 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X92.871 Y103.98 E.14671
G1 X92.301 Y103.98
G1 X84.97 Y96.649 E.13613
; WIPE_START
M204 S6000
G1 X86.384 Y98.063 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.502 Y103.726 Z1.16 F42000
G1 X91.732 Y103.98 Z1.16
G1 Z.76
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X77.332 Y89.58 E.26739
G1 X77.332 Y90.15
G1 X91.162 Y103.98 E.25681
G1 X90.592 Y103.98
G1 X77.332 Y90.719 E.24624
G1 X77.332 Y91.289
G1 X90.022 Y103.98 E.23566
G1 X89.453 Y103.98
G1 X77.332 Y91.859 E.22508
G1 X77.332 Y92.428
G1 X88.883 Y103.98 E.2145
G1 X88.313 Y103.98
G1 X77.332 Y92.998 E.20392
G1 X77.332 Y93.568
G1 X87.744 Y103.98 E.19334
G1 X87.174 Y103.98
G1 X77.332 Y94.137 E.18276
G1 X77.332 Y94.707
G1 X86.604 Y103.98 E.17219
G1 X86.23 Y104.175
G1 X77.332 Y95.277 E.16523
G1 X77.332 Y95.846
G1 X85.852 Y104.367 E.15822
G1 X85.283 Y104.367
G1 X77.332 Y96.416 E.14764
G1 X77.332 Y96.986
G1 X84.713 Y104.367 E.13706
G1 X84.143 Y104.367
G1 X77.332 Y97.556 E.12648
G1 X77.332 Y98.125
G1 X83.573 Y104.367 E.11591
G1 X83.004 Y104.367
G1 X77.332 Y98.695 E.10533
G1 X77.332 Y99.265
G1 X82.434 Y104.367 E.09475
G1 X81.864 Y104.367
G1 X77.332 Y99.834 E.08417
G1 X77.332 Y100.404
G1 X81.294 Y104.367 E.07359
G1 X80.725 Y104.367
G1 X77.332 Y100.974 E.06301
G1 X77.332 Y101.543
G1 X80.155 Y104.367 E.05243
G1 X79.585 Y104.367
G1 X77.332 Y102.113 E.04185
G1 X77.332 Y102.683
G1 X79.016 Y104.367 E.03127
G1 X78.446 Y104.367
G1 X77.332 Y103.252 E.02069
; WIPE_START
M204 S6000
G1 X78.446 Y104.367 E-.59881
G1 X78.87 Y104.367 E-.1612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.402 Y98.226 Z1.16 F42000
G1 X85.033 Y96.016 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0846896
G1 F18000
M204 S6000
G1 X85.065 Y95.937 E.00019
G1 X84.946 Y95.822 E.00036
; WIPE_START
G1 X85.065 Y95.937 E-.50063
G1 X85.033 Y96.016 E-.25937
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.851 Y92.169 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.0762144
G1 F18000
M204 S6000
G1 X84.729 Y92.093 E.00027
G1 X84.735 Y92.045 E.00009
; WIPE_START
G1 X84.729 Y92.093 E-.19242
G1 X84.851 Y92.169 E-.56758
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.503 Y85.309 Z1.16 F42000
G1 X79.919 Y82.064 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.13199
G1 F18000
M204 S6000
G3 X79.724 Y81.942 I1.998 J-3.396 E.00086
; LINE_WIDTH: 0.0805586
G1 X79.616 Y81.865 E.00027
M204 S10000
G1 X79.261 Y81.512 F42000
; LINE_WIDTH: 0.0795082
G1 F18000
M204 S6000
G1 X79.21 Y81.438 E.00018
; LINE_WIDTH: 0.118656
G3 X79.068 Y81.215 I1.866 J-1.344 E.00087
; WIPE_START
G1 X79.21 Y81.438 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.815 Y80.553 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.175292
G1 F18000
M204 S6000
G1 X80.82 Y80.43 E.00063
; LINE_WIDTH: 0.220239
G2 X80.754 Y80.331 I-.163 J.037 E.00081
G1 X80.736 Y80.311 E.00018
; LINE_WIDTH: 0.19682
G1 X80.704 Y80.308 E.00019
; LINE_WIDTH: 0.159076
G1 X80.647 Y80.31 E.00026
; LINE_WIDTH: 0.132281
G1 X80.59 Y80.312 E.00021
; WIPE_START
G1 X80.647 Y80.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.444 Y76.305 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.0716979
G1 F18000
M204 S6000
G1 X77.358 Y76.483 E.00035
; WIPE_START
G1 X77.444 Y76.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.618 Y83.936 Z1.16 F42000
G1 X78.083 Y104.313 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.0725498
G1 F18000
M204 S6000
G1 X78.04 Y104.29 E.00009
; LINE_WIDTH: 0.0990626
G1 X77.941 Y104.218 E.00033
; LINE_WIDTH: 0.138
G1 X77.841 Y104.146 E.00048
; LINE_WIDTH: 0.154187
G3 X77.377 Y103.633 I1.657 J-1.964 E.0031
; WIPE_START
G1 X77.618 Y103.934 E-.42229
G1 X77.841 Y104.146 E-.33771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.472 Y104.328 Z1.16 F42000
G1 X86.25 Y104.346 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.0989744
G1 F18000
M204 S6000
G1 X85.873 Y104.346 E.00101
; WIPE_START
G1 X86.25 Y104.346 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.103 Y97.758 Z1.16 F42000
G1 X102.617 Y76.361 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.131631
G1 F18000
M204 S6000
G1 X102.473 Y76.18 E.00086
; LINE_WIDTH: 0.157024
G1 X102.329 Y76 E.00105
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X102.473 Y76.18 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/99
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.16 I-.913 J-.805 P1  F42000
G1 X77.65 Y104.326 Z1.16
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.411588
G1 F2152
M204 S5000
G1 X77.564 Y104.274 E.00129
; LINE_WIDTH: 0.403058
G1 X77.303 Y103.974 E.005
; LINE_WIDTH: 0.411568
G1 X77.138 Y103.571 E.0056
G1 X77.105 Y103.29 E.00363
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00722
G1 X77.188 Y76.273 E.00585
; LINE_WIDTH: 0.402918
G1 X77.397 Y75.894 E.00544
; LINE_WIDTH: 0.408278
G1 X77.698 Y75.618 E.0052
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409808
G1 X82.412 Y75.405 E.0256
; LINE_WIDTH: 0.409348
G1 X84.412 Y75.404 E.02557
; LINE_WIDTH: 0.408888
G1 X85.808 Y75.404 E.01783
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.6 J-1947.915 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.574 Y75.404 I.348 J-43.014 E.01539
; LINE_WIDTH: 0.407068
G1 X101.881 Y75.445 E.00394
G1 X102.27 Y75.601 E.00532
; LINE_WIDTH: 0.415148
G1 X102.579 Y75.865 E.00528
G1 X102.77 Y76.148 E.00443
; LINE_WIDTH: 0.409398
G1 X102.894 Y76.646 E.00657
G1 X102.894 Y80.646 E.05114
; LINE_WIDTH: 0.409268
G1 X102.894 Y84.646 E.05112
; LINE_WIDTH: 0.409148
G1 X102.894 Y88.646 E.05111
; LINE_WIDTH: 0.409028
G1 X102.895 Y92.646 E.05109
; LINE_WIDTH: 0.408898
G1 X102.895 Y96.646 E.05107
; LINE_WIDTH: 0.408778
G1 X102.895 Y100.646 E.05106
; LINE_WIDTH: 0.408658
G1 X102.896 Y103.276 E.03355
G1 X102.872 Y103.501 E.00289
; LINE_WIDTH: 0.411258
G1 X102.751 Y103.882 E.00515
G1 X102.61 Y104.09 E.00323
; LINE_WIDTH: 0.403788
G1 X102.307 Y104.373 E.00521
; LINE_WIDTH: 0.407238
G1 X101.888 Y104.556 E.00582
; LINE_WIDTH: 0.409828
G1 X101.6 Y104.594 E.00372
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.656 J1989.968 E.08536
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.64 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.411588
G1 X77.962 Y104.516 E.00528
G1 X77.701 Y104.358 E.00393
; WIPE_START
G1 F12000
M204 S6000
G1 X77.564 Y104.274 E-.06097
G1 X77.303 Y103.974 E-.15109
G1 X77.138 Y103.571 E-.16567
G1 X77.105 Y103.29 E-.10731
G1 X77.105 Y102.567 E-.27497
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.292 Y96.967 Z1.24 F42000
G1 X101.49 Y76.24 Z1.24
G1 Z.84
M73 P16 R13
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2152
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.634 Y75.808 E.00248
; LINE_WIDTH: 0.407558
G1 X101.853 Y75.835 E.0028
G1 X102.167 Y76.003 E.00453
G1 X102.411 Y76.308 E.00498
; LINE_WIDTH: 0.409398
G1 X102.501 Y76.646 E.00447
G1 X102.502 Y80.646 E.05114
; LINE_WIDTH: 0.409268
G1 X102.502 Y84.646 E.05112
; LINE_WIDTH: 0.409148
G1 X102.503 Y88.646 E.05111
; LINE_WIDTH: 0.409028
G1 X102.503 Y92.646 E.05109
; LINE_WIDTH: 0.408898
G1 X102.504 Y96.646 E.05107
; LINE_WIDTH: 0.408778
G1 X102.504 Y100.646 E.05106
; LINE_WIDTH: 0.408658
G1 X102.504 Y103.276 E.03355
G1 X102.475 Y103.514 E.00306
; LINE_WIDTH: 0.408188
G1 X102.322 Y103.835 E.00454
; LINE_WIDTH: 0.406888
G1 X102.028 Y104.092 E.00496
G1 X101.71 Y104.198 E.00425
; LINE_WIDTH: 0.409828
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.411588
G1 X78.116 Y104.152 E.00327
G1 X77.805 Y103.974 E.00461
; LINE_WIDTH: 0.411608
G1 X77.598 Y103.706 E.00435
G1 X77.5 Y103.37 E.0045
; LINE_WIDTH: 0.410298
G3 X77.498 Y101.28 I42.472 J-1.093 E.02677
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.28 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.28 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.28 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.28 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.28 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.28 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.28 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.0071
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.411388
G1 X77.754 Y76.076 E.00494
G1 X78.01 Y75.89 E.00407
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409808
G1 X82.424 Y75.797 E.0256
; LINE_WIDTH: 0.409348
G1 X84.424 Y75.796 E.02557
; LINE_WIDTH: 0.408888
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11714
G1 X101.634 Y75.808 E-.07191
G1 X101.853 Y75.835 E-.08357
G1 X102.167 Y76.003 E-.13533
G1 X102.411 Y76.308 E-.1486
G1 X102.501 Y76.646 E-.13286
G1 X102.501 Y76.832 E-.07059
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.629 Y83.409 Z1.24 F42000
G1 X86.402 Y104.174 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2152
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.636 Y96.561 Z1.24 F42000
G1 X101.099 Y75.825 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F2152
M204 S6000
G1 X86.402 Y75.825 E.20462
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.763 Y79.59 Z1.24 F42000
G1 X79.402 Y80.928 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.398068
G1 F2152
M204 S5000
G1 X79.402 Y80.877 E.00063
; LINE_WIDTH: 0.398288
G1 X79.535 Y80.62 E.0036
; LINE_WIDTH: 0.403368
G1 X79.721 Y80.464 E.00305
G1 X79.979 Y80.377 E.00343
; LINE_WIDTH: 0.402208
G1 X80.288 Y80.409 E.0039
; LINE_WIDTH: 0.392388
G1 X80.527 Y80.543 E.00335
G1 X80.694 Y80.762 E.00336
; LINE_WIDTH: 0.396128
G1 X80.768 Y81.065 E.00386
G1 X80.723 Y81.3 E.00295
; LINE_WIDTH: 0.394668
G1 X80.562 Y81.559 E.00375
G1 X80.273 Y81.725 E.0041
; LINE_WIDTH: 0.391608
G1 X79.986 Y81.75 E.00352
; LINE_WIDTH: 0.385708
G1 X79.727 Y81.664 E.00328
G1 X79.521 Y81.484 E.00329
G1 X79.402 Y81.238 E.00328
; LINE_WIDTH: 0.398068
G1 X79.402 Y80.988 E.0031
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y80.877 E-.04222
G1 X79.535 Y80.62 E-.11002
G1 X79.721 Y80.464 E-.09199
G1 X79.979 Y80.377 E-.10355
G1 X80.288 Y80.409 E-.11822
G1 X80.527 Y80.543 E-.1042
G1 X80.694 Y80.762 E-.1044
G1 X80.747 Y80.98 E-.08541
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2152
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2152
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z1.24 F42000
G1 X84.654 Y92.246 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2152
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F2152
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.24 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.92
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 9/99
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2103
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.635 Y75.808 E.00249
; LINE_WIDTH: 0.407548
G1 X101.853 Y75.835 E.0028
G1 X102.167 Y76.003 E.00453
; LINE_WIDTH: 0.406688
G1 X102.411 Y76.308 E.00496
; LINE_WIDTH: 0.409398
G1 X102.501 Y76.642 E.00441
G1 X102.501 Y78.642 E.02557
; LINE_WIDTH: 0.409268
G1 X102.502 Y80.642 E.02556
; LINE_WIDTH: 0.409138
G1 X102.502 Y82.642 E.02555
; LINE_WIDTH: 0.409008
G1 X102.502 Y84.642 E.02554
; LINE_WIDTH: 0.408878
G1 X102.502 Y86.642 E.02554
; LINE_WIDTH: 0.408748
G1 X102.502 Y88.642 E.02553
; LINE_WIDTH: 0.408628
G1 X102.503 Y90.641 E.02552
; LINE_WIDTH: 0.408498
G1 X102.503 Y92.641 E.02551
; LINE_WIDTH: 0.408368
G1 X102.503 Y94.641 E.0255
; LINE_WIDTH: 0.408238
G1 X102.503 Y96.641 E.02549
; LINE_WIDTH: 0.408108
G1 X102.503 Y98.641 E.02549
; LINE_WIDTH: 0.407978
G1 X102.504 Y100.641 E.02548
; LINE_WIDTH: 0.407858
G1 X102.504 Y102.641 E.02547
; LINE_WIDTH: 0.407728
G1 X102.504 Y103.3 E.00839
; LINE_WIDTH: 0.410678
G3 X102.322 Y103.835 I-.962 J-.029 E.00736
; LINE_WIDTH: 0.411108
G1 X102.002 Y104.104 E.00537
G1 X101.71 Y104.198 E.00393
; LINE_WIDTH: 0.409838
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X78.057 Y104.132 E.00403
; LINE_WIDTH: 0.411598
G1 X77.718 Y103.884 E.00539
G1 X77.542 Y103.572 E.00461
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00376
G1 X77.496 Y76.729 E.33875
G1 X77.551 Y76.403 E.00422
; LINE_WIDTH: 0.406718
G1 X77.68 Y76.159 E.00351
; LINE_WIDTH: 0.408188
G1 X78.005 Y75.889 E.00537
; LINE_WIDTH: 0.410258
G1 X78.42 Y75.798 E.00544
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409798
G1 X82.42 Y75.797 E.0256
; LINE_WIDTH: 0.409338
G1 X84.42 Y75.796 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.146 Y75.551 F42000
; LINE_WIDTH: 0.407088
G1 F2103
M204 S5000
G1 X102.27 Y75.601 E.00169
; LINE_WIDTH: 0.414858
G1 X102.576 Y75.862 E.00521
G1 X102.779 Y76.181 E.0049
; LINE_WIDTH: 0.410668
G1 X102.894 Y76.641 E.00609
; LINE_WIDTH: 0.409398
G1 X102.894 Y78.641 E.02557
; LINE_WIDTH: 0.409268
G1 X102.894 Y80.641 E.02556
; LINE_WIDTH: 0.409138
G1 X102.894 Y82.641 E.02555
; LINE_WIDTH: 0.409008
G1 X102.894 Y84.641 E.02554
; LINE_WIDTH: 0.408878
G1 X102.894 Y86.641 E.02554
; LINE_WIDTH: 0.408748
G1 X102.894 Y88.641 E.02553
; LINE_WIDTH: 0.408628
G1 X102.894 Y90.641 E.02552
; LINE_WIDTH: 0.408498
G1 X102.894 Y92.641 E.02551
; LINE_WIDTH: 0.408368
G1 X102.894 Y94.641 E.0255
; LINE_WIDTH: 0.408238
G1 X102.894 Y96.641 E.02549
; LINE_WIDTH: 0.408108
G1 X102.894 Y98.641 E.02549
; LINE_WIDTH: 0.407978
M73 P17 R13
G1 X102.894 Y100.641 E.02548
; LINE_WIDTH: 0.407858
G1 X102.894 Y102.641 E.02547
; LINE_WIDTH: 0.407728
G1 X102.894 Y103.3 E.00839
; LINE_WIDTH: 0.410678
G1 X102.816 Y103.738 E.0057
G1 X102.619 Y104.085 E.00512
; LINE_WIDTH: 0.404238
G1 X102.273 Y104.398 E.00589
; LINE_WIDTH: 0.408088
G1 X101.884 Y104.559 E.00536
; LINE_WIDTH: 0.409838
G1 X101.6 Y104.594 E.00366
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.655 J1985.099 E.08536
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.641 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.048 Y104.537 E.00411
; LINE_WIDTH: 0.415248
G1 X77.709 Y104.386 E.00481
G1 X77.399 Y104.118 E.00532
; LINE_WIDTH: 0.411598
G1 X77.183 Y103.72 E.00582
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00558
G1 X77.104 Y77.29 E.33172
G3 X77.161 Y76.324 I3.47 J-.281 E.01239
; LINE_WIDTH: 0.406448
G1 X77.383 Y75.914 E.00592
; LINE_WIDTH: 0.405498
G1 X77.716 Y75.611 E.0057
; LINE_WIDTH: 0.411328
G1 X78.129 Y75.438 E.00576
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410258
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.41 Y75.405 E.0256
; LINE_WIDTH: 0.409338
G1 X84.41 Y75.404 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.404 E.01786
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.603 J-1952.803 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.575 Y75.404 I.348 J-43.244 E.0154
; LINE_WIDTH: 0.407088
G1 X101.881 Y75.445 E.00393
G1 X102.091 Y75.529 E.00287
; WIPE_START
G1 F12000
M204 S6000
G1 X102.27 Y75.601 E-.07331
G1 X102.576 Y75.862 E-.15286
G1 X102.779 Y76.181 E-.14374
G1 X102.894 Y76.641 E-.18047
G1 X102.894 Y77.193 E-.20962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z1.32 F42000
G1 Z.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444308
G1 F2103
M204 S6000
G1 X86.402 Y75.825 E.20462
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z1.32 F42000
G1 X86.402 Y104.174 Z1.32
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2103
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.157 Y98.358 Z1.32 F42000
G1 X79.386 Y80.973 Z1.32
G1 Z.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.388088
G1 F2103
M204 S5000
G1 X79.499 Y80.676 E.00385
; LINE_WIDTH: 0.389408
G1 X79.741 Y80.459 E.00394
; LINE_WIDTH: 0.410808
G1 X80.088 Y80.375 E.00457
G1 X80.355 Y80.433 E.00352
; LINE_WIDTH: 0.405268
G1 X80.578 Y80.594 E.00348
; LINE_WIDTH: 0.405628
G1 X80.722 Y80.829 E.0035
G1 X80.75 Y80.932 E.00135
; LINE_WIDTH: 0.389448
G1 X80.734 Y81.253 E.0039
G1 X80.601 Y81.508 E.00348
; LINE_WIDTH: 0.388228
G1 X80.387 Y81.679 E.00331
G1 X80.124 Y81.754 E.00331
G1 X79.852 Y81.721 E.00331
G1 X79.614 Y81.585 E.00331
; LINE_WIDTH: 0.398068
G1 X79.421 Y81.314 E.00413
G1 X79.392 Y81.033 E.00351
; WIPE_START
G1 F12000
M204 S6000
G1 X79.499 Y80.676 E-.14174
G1 X79.741 Y80.459 E-.1235
G1 X80.088 Y80.375 E-.13548
G1 X80.355 Y80.433 E-.10418
G1 X80.578 Y80.594 E-.10445
G1 X80.722 Y80.829 E-.10498
G1 X80.75 Y80.932 E-.04046
G1 X80.75 Y80.946 E-.00522
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.32 F42000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2103
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2103
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z1.32 F42000
G1 X84.654 Y92.246 Z1.32
G1 Z.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2103
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.32 F42000
G1 Z.92
G1 E.8 F1800
G1 F2103
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.32 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 10/99
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G1 X102.031 Y75.496 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.414828
G1 F2111
M204 S5000
G1 X102.29 Y75.614 E.0037
G1 X102.535 Y75.817 E.00412
; LINE_WIDTH: 0.411188
G1 X102.769 Y76.15 E.00522
G1 X102.893 Y76.646 E.00657
; LINE_WIDTH: 0.409518
G1 X102.894 Y76.7 E.00068
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.895 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.895 Y103.275 E.033
; LINE_WIDTH: 0.413698
G1 X102.856 Y103.585 E.00403
G1 X102.666 Y104.025 E.0062
; LINE_WIDTH: 0.405448
G1 X102.348 Y104.349 E.00574
; LINE_WIDTH: 0.411078
G1 X101.937 Y104.544 E.00585
G1 X101.6 Y104.594 E.00436
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.502 J419.113 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.175 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
; LINE_WIDTH: 0.411508
G1 X78.086 Y104.554 E.00438
G1 X77.663 Y104.351 E.00604
; LINE_WIDTH: 0.406568
G1 X77.357 Y104.053 E.00542
; LINE_WIDTH: 0.413728
G1 X77.157 Y103.636 E.00597
G1 X77.105 Y103.288 E.00456
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.288 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.288 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.288 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.288 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.288 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.288 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.288 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.288 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.288 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.288 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.288 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.288 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G3 X77.161 Y76.324 I3.463 J-.279 E.01236
; LINE_WIDTH: 0.406438
G1 X77.382 Y75.914 E.0059
; LINE_WIDTH: 0.405368
G1 X77.716 Y75.611 E.00571
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00576
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409808
G1 X82.41 Y75.405 E.0256
; LINE_WIDTH: 0.409348
G1 X84.41 Y75.404 E.02557
; LINE_WIDTH: 0.408888
G1 X85.808 Y75.404 E.01786
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.603 J-1949.378 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.575 Y75.404 I.348 J-43.14 E.01541
; LINE_WIDTH: 0.407348
G1 X101.947 Y75.457 E.00478
; LINE_WIDTH: 0.414828
G1 X101.976 Y75.471 E.00042
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2111
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.635 Y75.808 E.00249
; LINE_WIDTH: 0.407028
G1 X101.919 Y75.858 E.00366
; LINE_WIDTH: 0.407898
G1 X102.265 Y76.093 E.00533
G1 X102.457 Y76.428 E.00491
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00351
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413698
G1 X102.472 Y103.498 E.00291
G1 X102.348 Y103.8 E.00422
; LINE_WIDTH: 0.407158
G1 X102.062 Y104.073 E.00502
G1 X101.715 Y104.196 E.00468
; LINE_WIDTH: 0.409088
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
M73 P18 R13
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411508
G1 X78.206 Y104.177 E.00283
G1 X77.866 Y104.022 E.00479
; LINE_WIDTH: 0.406818
G1 X77.626 Y103.767 E.00446
G1 X77.501 Y103.37 E.00529
; LINE_WIDTH: 0.410298
G1 X77.498 Y101.276 E.02683
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.276 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.276 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.276 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.276 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.276 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.276 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.276 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.276 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.276 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.276 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.276 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.276 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.729 E.00697
G1 X77.551 Y76.403 E.00422
; LINE_WIDTH: 0.404588
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.408258
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409798
G1 X82.42 Y75.797 E.0256
; LINE_WIDTH: 0.409338
G1 X84.42 Y75.796 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11715
G1 X101.635 Y75.808 E-.07215
G1 X101.919 Y75.858 E-.10958
G1 X102.265 Y76.093 E-.15889
G1 X102.457 Y76.428 E-.14655
G1 X102.504 Y76.7 E-.10489
G1 X102.504 Y76.833 E-.05078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.456 Z1.4 F42000
G1 X101.099 Y104.175 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2111
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z1.4 F42000
G1 X101.099 Y75.825 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.444308
G1 F2111
M204 S6000
G1 X86.402 Y75.825 E.20462
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.791 Y79.639 Z1.4 F42000
G1 X79.377 Y81.031 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.405248
G1 F2111
M204 S5000
G1 X79.445 Y80.764 E.00348
; LINE_WIDTH: 0.414748
G1 X79.614 Y80.549 E.00354
G1 X79.837 Y80.412 E.00339
; LINE_WIDTH: 0.399768
G1 X80.199 Y80.386 E.00453
; LINE_WIDTH: 0.385608
G1 X80.519 Y80.539 E.00426
; LINE_WIDTH: 0.398408
G1 X80.725 Y80.827 E.0044
G1 X80.76 Y81.028 E.00254
; LINE_WIDTH: 0.404528
G1 X80.694 Y81.369 E.00438
; LINE_WIDTH: 0.405768
G1 X80.555 Y81.561 E.00301
G1 X80.323 Y81.71 E.0035
; LINE_WIDTH: 0.405248
G1 X80.053 Y81.758 E.00348
G1 X79.785 Y81.697 E.00348
G1 X79.562 Y81.537 E.00347
G1 X79.418 Y81.302 E.00348
G1 X79.386 Y81.09 E.00271
; WIPE_START
G1 F12000
M204 S6000
G1 X79.445 Y80.764 E-.12588
G1 X79.614 Y80.549 E-.10394
G1 X79.837 Y80.412 E-.09942
G1 X80.199 Y80.386 E-.13795
G1 X80.519 Y80.539 E-.13466
G1 X80.725 Y80.827 E-.13464
G1 X80.736 Y80.888 E-.0235
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2111
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2111
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z1.4 F42000
G1 X84.654 Y92.246 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2111
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F2111
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.08
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 11/99
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G1 X102.226 Y75.586 F42000
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.410718
G1 F2110
M204 S5000
G1 X102.292 Y75.613 E.00092
; LINE_WIDTH: 0.411728
G1 X102.58 Y75.864 E.00492
G1 X102.77 Y76.15 E.00442
; LINE_WIDTH: 0.411368
G1 X102.894 Y76.646 E.00656
; LINE_WIDTH: 0.409398
G1 X102.894 Y78.646 E.02557
; LINE_WIDTH: 0.409268
G1 X102.894 Y80.646 E.02556
; LINE_WIDTH: 0.409138
G1 X102.894 Y82.646 E.02555
; LINE_WIDTH: 0.409008
G1 X102.894 Y84.646 E.02554
; LINE_WIDTH: 0.408878
G1 X102.894 Y86.646 E.02554
; LINE_WIDTH: 0.408748
G1 X102.894 Y88.646 E.02553
; LINE_WIDTH: 0.408628
G1 X102.894 Y90.646 E.02552
; LINE_WIDTH: 0.408498
G1 X102.894 Y92.646 E.02551
; LINE_WIDTH: 0.408368
G1 X102.894 Y94.646 E.0255
; LINE_WIDTH: 0.408238
G1 X102.894 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.894 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.894 Y100.646 E.02548
; LINE_WIDTH: 0.407858
G1 X102.894 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.894 Y103.3 E.00833
; LINE_WIDTH: 0.415308
G1 X102.814 Y103.737 E.00576
G1 X102.619 Y104.084 E.00517
; LINE_WIDTH: 0.404248
G1 X102.272 Y104.398 E.00589
G1 X101.878 Y104.555 E.00536
; LINE_WIDTH: 0.417368
G1 X101.6 Y104.591 E.00365
; LINE_WIDTH: 0.419998
G2 X97.099 Y104.59 I-2.501 J1464.189 E.0591
G1 X87.099 Y104.59 E.1313
G2 X85.809 Y104.596 I-.347 J67.277 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X77.982 Y104.516 E.00573
; LINE_WIDTH: 0.406418
G1 X77.607 Y104.31 E.00544
; LINE_WIDTH: 0.408268
G1 X77.318 Y104.002 E.00537
; LINE_WIDTH: 0.412798
G1 X77.157 Y103.636 E.00516
G1 X77.105 Y103.288 E.00455
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.288 E.02563
; LINE_WIDTH: 0.410088
G1 X77.105 Y99.288 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y97.288 E.0256
; LINE_WIDTH: 0.409698
G1 X77.105 Y95.288 E.02559
; LINE_WIDTH: 0.409508
G1 X77.105 Y93.288 E.02558
; LINE_WIDTH: 0.409308
G1 X77.105 Y91.288 E.02556
; LINE_WIDTH: 0.409118
G1 X77.105 Y89.288 E.02555
; LINE_WIDTH: 0.408918
G1 X77.105 Y87.288 E.02554
; LINE_WIDTH: 0.408728
G1 X77.105 Y85.288 E.02553
; LINE_WIDTH: 0.408528
G1 X77.106 Y83.288 E.02551
; LINE_WIDTH: 0.408338
G1 X77.106 Y81.288 E.0255
; LINE_WIDTH: 0.408138
G1 X77.106 Y79.288 E.02549
; LINE_WIDTH: 0.407948
G1 X77.106 Y77.288 E.02547
; LINE_WIDTH: 0.407748
G1 X77.106 Y76.7 E.00748
; LINE_WIDTH: 0.408208
G1 X77.182 Y76.262 E.00567
G1 X77.414 Y75.873 E.00577
; LINE_WIDTH: 0.403068
G1 X77.745 Y75.595 E.00544
; LINE_WIDTH: 0.407618
G1 X78.16 Y75.434 E.00567
; LINE_WIDTH: 0.410268
G1 X78.408 Y75.405 E.00319
G1 X80.408 Y75.405 E.02563
; LINE_WIDTH: 0.409808
G1 X82.408 Y75.405 E.0256
; LINE_WIDTH: 0.409348
G1 X84.408 Y75.404 E.02557
; LINE_WIDTH: 0.408888
G1 X85.808 Y75.404 E.01788
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.603 J-1945.974 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.576 Y75.404 I.348 J-43.364 E.01542
; LINE_WIDTH: 0.407058
G1 X101.881 Y75.445 E.00391
; LINE_WIDTH: 0.410718
G1 X102.17 Y75.563 E.004
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2110
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.635 Y75.808 E.0025
; LINE_WIDTH: 0.407578
G1 X101.857 Y75.837 E.00284
G1 X102.194 Y76.025 E.0049
; LINE_WIDTH: 0.411368
G1 X102.402 Y76.295 E.00438
G1 X102.501 Y76.646 E.00469
; LINE_WIDTH: 0.409398
G1 X102.501 Y78.646 E.02557
; LINE_WIDTH: 0.409268
G1 X102.502 Y80.646 E.02556
; LINE_WIDTH: 0.409138
G1 X102.502 Y82.646 E.02555
; LINE_WIDTH: 0.409008
G1 X102.502 Y84.646 E.02554
; LINE_WIDTH: 0.408878
G1 X102.502 Y86.646 E.02554
; LINE_WIDTH: 0.408748
G1 X102.502 Y88.646 E.02553
; LINE_WIDTH: 0.408628
G1 X102.503 Y90.646 E.02552
; LINE_WIDTH: 0.408498
G1 X102.503 Y92.646 E.02551
; LINE_WIDTH: 0.408368
G1 X102.503 Y94.646 E.0255
; LINE_WIDTH: 0.408238
G1 X102.503 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.503 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.504 Y100.646 E.02548
; LINE_WIDTH: 0.407858
G1 X102.504 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.504 Y103.3 E.00833
; LINE_WIDTH: 0.415308
G3 X102.322 Y103.835 I-1.157 J-.095 E.00741
; LINE_WIDTH: 0.410538
G1 X102.006 Y104.102 E.0053
; LINE_WIDTH: 0.417368
G1 X101.638 Y104.198 E.00496
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.14 Y104.161 E.00367
; LINE_WIDTH: 0.406868
G1 X77.8 Y103.971 E.00495
G1 X77.597 Y103.708 E.00422
; LINE_WIDTH: 0.404518
G1 X77.501 Y103.37 E.00444
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.275 E.02683
; LINE_WIDTH: 0.410088
G1 X77.498 Y99.275 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y97.275 E.0256
; LINE_WIDTH: 0.409698
G1 X77.498 Y95.275 E.02559
; LINE_WIDTH: 0.409508
G1 X77.497 Y93.275 E.02558
; LINE_WIDTH: 0.409308
G1 X77.497 Y91.275 E.02556
; LINE_WIDTH: 0.409118
G1 X77.497 Y89.276 E.02555
; LINE_WIDTH: 0.408918
M73 P19 R13
G1 X77.497 Y87.276 E.02554
; LINE_WIDTH: 0.408728
G1 X77.497 Y85.276 E.02553
; LINE_WIDTH: 0.408528
G1 X77.497 Y83.276 E.02551
; LINE_WIDTH: 0.408338
G1 X77.497 Y81.276 E.0255
; LINE_WIDTH: 0.408138
G1 X77.496 Y79.276 E.02549
; LINE_WIDTH: 0.407948
G1 X77.496 Y77.276 E.02547
; LINE_WIDTH: 0.407748
G1 X77.496 Y76.7 E.00733
; LINE_WIDTH: 0.408228
G1 X77.55 Y76.402 E.00386
G1 X77.729 Y76.1 E.00447
; LINE_WIDTH: 0.407388
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.415 Y75.798 E.00533
G1 X80.415 Y75.798 E.02563
; LINE_WIDTH: 0.409808
G1 X82.415 Y75.797 E.0256
; LINE_WIDTH: 0.409348
G1 X84.415 Y75.796 E.02557
; LINE_WIDTH: 0.408888
G1 X85.808 Y75.796 E.01779
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11713
G1 X101.635 Y75.808 E-.07227
G1 X101.857 Y75.837 E-.08493
G1 X102.194 Y76.025 E-.14643
G1 X102.402 Y76.295 E-.12948
G1 X102.501 Y76.646 E-.13875
G1 X102.501 Y76.833 E-.07101
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.11 Y84.455 Z1.48 F42000
G1 X101.099 Y104.175 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2110
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z1.48 F42000
G1 X101.099 Y75.825 Z1.48
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.444188
G1 F2110
M204 S6000
G1 X100.402 Y75.825 E.0097
; LINE_WIDTH: 0.444288
G1 X86.402 Y75.825 E.19491
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.773 Y79.608 Z1.48 F42000
G1 X79.386 Y80.97 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.391208
G1 F2110
M204 S5000
G1 X79.386 Y80.964 E.00008
; LINE_WIDTH: 0.388668
G1 X79.486 Y80.694 E.00348
; LINE_WIDTH: 0.387628
G1 X79.742 Y80.46 E.0042
; LINE_WIDTH: 0.390668
G1 X80.016 Y80.374 E.00349
G1 X80.288 Y80.409 E.00334
; LINE_WIDTH: 0.397928
G1 X80.571 Y80.584 E.00413
; LINE_WIDTH: 0.408288
G1 X80.72 Y80.828 E.00365
G1 X80.737 Y80.883 E.00073
; LINE_WIDTH: 0.391248
G1 X80.746 Y81.211 E.004
; LINE_WIDTH: 0.387628
G1 X80.608 Y81.496 E.00382
G1 X80.387 Y81.678 E.00346
; LINE_WIDTH: 0.390868
G1 X80.124 Y81.756 E.00333
G1 X79.852 Y81.721 E.00334
; LINE_WIDTH: 0.398108
G1 X79.569 Y81.546 E.00413
G1 X79.403 Y81.247 E.00425
; LINE_WIDTH: 0.391208
G1 X79.39 Y81.03 E.00265
; WIPE_START
G1 F12000
M204 S6000
G1 X79.386 Y80.964 E-.02519
G1 X79.486 Y80.694 E-.10931
G1 X79.742 Y80.46 E-.13204
G1 X80.016 Y80.374 E-.10906
G1 X80.288 Y80.409 E-.10431
G1 X80.571 Y80.584 E-.12639
G1 X80.72 Y80.828 E-.1089
G1 X80.737 Y80.883 E-.02169
G1 X80.739 Y80.944 E-.02312
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.37 Y80.207 Z1.48 F42000
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2110
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2110
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z1.48 F42000
G1 X84.654 Y92.246 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2110
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.48 F42000
G1 Z1.08
G1 E.8 F1800
G1 F2110
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.48 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 12/99
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G1 X102.098 Y75.526 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.414838
G1 F2110
M204 S5000
G1 X102.29 Y75.614 E.00274
G1 X102.535 Y75.817 E.00412
; LINE_WIDTH: 0.411068
G1 X102.77 Y76.151 E.00524
G1 X102.893 Y76.646 E.00655
; LINE_WIDTH: 0.409518
G1 X102.894 Y76.7 E.00068
; LINE_WIDTH: 0.407878
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408078
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408468
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408668
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408858
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409058
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409258
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409448
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409648
G1 X102.895 Y96.7 E.02559
; LINE_WIDTH: 0.409848
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410038
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410238
G1 X102.895 Y103.275 E.033
; LINE_WIDTH: 0.414278
G1 X102.851 Y103.62 E.00449
G1 X102.671 Y104.01 E.00556
; LINE_WIDTH: 0.404018
G1 X102.349 Y104.348 E.00589
; LINE_WIDTH: 0.411098
G1 X101.937 Y104.544 E.00586
G1 X101.6 Y104.594 E.00436
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.502 J418.02 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.277 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408818
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X78.017 Y104.53 E.00526
; LINE_WIDTH: 0.405538
G1 X77.634 Y104.33 E.00547
; LINE_WIDTH: 0.406168
G1 X77.35 Y104.045 E.0051
; LINE_WIDTH: 0.413698
G1 X77.157 Y103.636 E.00584
G1 X77.105 Y103.287 E.00456
; LINE_WIDTH: 0.410308
G1 X77.105 Y101.287 E.02563
; LINE_WIDTH: 0.410178
G1 X77.105 Y99.287 E.02562
; LINE_WIDTH: 0.410048
G1 X77.105 Y97.287 E.02561
; LINE_WIDTH: 0.409918
G1 X77.105 Y95.287 E.0256
; LINE_WIDTH: 0.409788
G1 X77.105 Y93.287 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.287 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.287 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.287 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.287 E.02556
; LINE_WIDTH: 0.409148
G1 X77.105 Y83.287 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.287 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.287 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.287 E.02553
; LINE_WIDTH: 0.408628
G3 X77.161 Y76.324 I3.456 J-.279 E.01235
; LINE_WIDTH: 0.406448
G1 X77.382 Y75.914 E.00591
; LINE_WIDTH: 0.405378
G1 X77.716 Y75.611 E.00571
; LINE_WIDTH: 0.411358
G1 X78.129 Y75.438 E.00575
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410248
G1 X80.41 Y75.405 E.02562
; LINE_WIDTH: 0.409788
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409328
G1 X84.41 Y75.404 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.404 E.01786
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.607 J-1947.444 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.577 Y75.404 I.348 J-43.252 E.01542
; LINE_WIDTH: 0.407348
G1 X101.947 Y75.457 E.00476
; LINE_WIDTH: 0.414838
G1 X102.044 Y75.501 E.00137
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2110
M204 S5000
G1 X101.498 Y75.939 E.00395
M73 P19 R12
G1 X101.636 Y75.808 E.0025
; LINE_WIDTH: 0.407008
G1 X101.919 Y75.858 E.00365
; LINE_WIDTH: 0.407868
G1 X102.265 Y76.093 E.00533
G1 X102.457 Y76.427 E.00491
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407878
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408078
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408468
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408668
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408858
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409058
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409258
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409448
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409648
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409848
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410038
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410238
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.414278
G3 X102.347 Y103.798 I-1.084 J-.036 E.00713
; LINE_WIDTH: 0.407158
G1 X102.062 Y104.072 E.00503
G1 X101.715 Y104.196 E.00468
; LINE_WIDTH: 0.409108
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408818
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.145 Y104.163 E.0036
; LINE_WIDTH: 0.406028
G1 X77.834 Y103.999 E.00446
; LINE_WIDTH: 0.406168
G1 X77.648 Y103.795 E.0035
G1 X77.503 Y103.393 E.00541
; LINE_WIDTH: 0.410308
G1 X77.498 Y101.275 E.02714
; LINE_WIDTH: 0.410178
G1 X77.498 Y99.275 E.02562
; LINE_WIDTH: 0.410048
G1 X77.498 Y97.275 E.02561
; LINE_WIDTH: 0.409918
G1 X77.498 Y95.275 E.0256
; LINE_WIDTH: 0.409788
G1 X77.497 Y93.275 E.02559
; LINE_WIDTH: 0.409658
G1 X77.497 Y91.275 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.275 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.275 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.275 E.02556
; LINE_WIDTH: 0.409148
G1 X77.496 Y83.275 E.02555
; LINE_WIDTH: 0.409018
G1 X77.496 Y81.275 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.275 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.275 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.729 E.00697
G1 X77.551 Y76.403 E.00422
; LINE_WIDTH: 0.404578
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.408248
G1 X78.01 Y75.888 E.00448
; LINE_WIDTH: 0.410248
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02562
; LINE_WIDTH: 0.409788
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409328
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
M73 P20 R12
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11715
G1 X101.636 Y75.808 E-.07239
G1 X101.919 Y75.858 E-.10927
G1 X102.265 Y76.093 E-.15894
G1 X102.457 Y76.427 E-.14651
G1 X102.504 Y76.7 E-.105
G1 X102.504 Y76.833 E-.05075
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.456 Z1.56 F42000
G1 X101.099 Y104.175 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2110
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z1.56 F42000
G1 X101.099 Y75.825 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.444188
G1 F2110
M204 S6000
G1 X98.402 Y75.825 E.03754
; LINE_WIDTH: 0.444288
G1 X86.402 Y75.825 E.16706
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.773 Y79.608 Z1.56 F42000
G1 X79.386 Y80.97 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.405248
G1 F2110
M204 S5000
G1 X79.386 Y80.964 E.00007
; LINE_WIDTH: 0.388628
G1 X79.486 Y80.694 E.00348
; LINE_WIDTH: 0.387608
G1 X79.742 Y80.46 E.00419
; LINE_WIDTH: 0.390588
G1 X80.016 Y80.375 E.00349
G1 X80.288 Y80.409 E.00334
; LINE_WIDTH: 0.388308
G1 X80.526 Y80.545 E.00331
; LINE_WIDTH: 0.398428
G1 X80.725 Y80.827 E.00429
G1 X80.76 Y81.024 E.00249
; LINE_WIDTH: 0.404548
G1 X80.695 Y81.366 E.0044
G1 X80.53 Y81.586 E.00347
; LINE_WIDTH: 0.402948
G1 X80.289 Y81.725 E.00349
; LINE_WIDTH: 0.405848
G1 X80.055 Y81.758 E.003
G1 X79.785 Y81.697 E.00351
; LINE_WIDTH: 0.405248
G1 X79.562 Y81.537 E.00347
G1 X79.418 Y81.302 E.00348
G1 X79.392 Y81.03 E.00347
; WIPE_START
G1 F12000
M204 S6000
G1 X79.386 Y80.964 E-.02497
G1 X79.486 Y80.694 E-.10931
G1 X79.742 Y80.46 E-.13199
G1 X80.016 Y80.375 E-.10906
G1 X80.288 Y80.409 E-.10431
G1 X80.526 Y80.545 E-.10412
G1 X80.725 Y80.827 E-.13111
G1 X80.746 Y80.944 E-.04514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2110
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2110
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z1.56 F42000
G1 X84.654 Y92.246 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2110
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F2110
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.56 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.24
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 13/99
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z1.24
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2084
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.636 Y75.808 E.00251
; LINE_WIDTH: 0.407018
G1 X101.957 Y75.874 E.00417
; LINE_WIDTH: 0.406448
G1 X102.298 Y76.126 E.00538
G1 X102.457 Y76.428 E.00432
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00351
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407818
G1 X102.504 Y82.7 E.05093
; LINE_WIDTH: 0.407948
G1 X102.504 Y86.7 E.05095
; LINE_WIDTH: 0.408088
G1 X102.504 Y90.7 E.05097
; LINE_WIDTH: 0.408218
G1 X102.504 Y94.7 E.05098
; LINE_WIDTH: 0.408348
G1 X102.504 Y98.7 E.051
; LINE_WIDTH: 0.408488
G1 X102.504 Y103.276 E.05837
G1 X102.463 Y103.556 E.00361
; LINE_WIDTH: 0.406178
G1 X102.297 Y103.869 E.00449
; LINE_WIDTH: 0.407968
G1 X102.028 Y104.093 E.00446
G1 X101.715 Y104.196 E.00421
; LINE_WIDTH: 0.409178
G1 X101.635 Y104.193 E.00102
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.057 Y104.132 E.00478
; LINE_WIDTH: 0.406838
G1 X77.735 Y103.905 E.005
; LINE_WIDTH: 0.404868
G1 X77.543 Y103.572 E.00486
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00376
G1 X77.496 Y76.724 E.33882
G1 X77.551 Y76.403 E.00415
; LINE_WIDTH: 0.413598
G1 X77.61 Y76.283 E.00173
G1 X77.755 Y76.075 E.00327
; LINE_WIDTH: 0.411218
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405378
G1 X78.33 Y75.802 E.00421
; LINE_WIDTH: 0.410268
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.409798
G1 X82.429 Y75.797 E.0256
; LINE_WIDTH: 0.409338
G1 X84.429 Y75.796 E.02557
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.796 E.01761
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.06 Y75.517 F42000
; LINE_WIDTH: 0.403398
G1 F2084
M204 S5000
G1 X102.207 Y75.569 E.00195
; LINE_WIDTH: 0.404208
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407298
G1 X102.773 Y76.167 E.00536
; LINE_WIDTH: 0.409848
G1 X102.893 Y76.642 E.00626
G1 X102.894 Y76.7 E.00074
; LINE_WIDTH: 0.407748
G1 X102.895 Y80.7 E.05092
; LINE_WIDTH: 0.407888
G1 X102.895 Y84.7 E.05094
; LINE_WIDTH: 0.408018
G1 X102.895 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.895 Y92.7 E.05098
; LINE_WIDTH: 0.408288
G1 X102.895 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.896 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.896 Y102.7 E.02551
G3 X102.866 Y103.544 I-3.769 J.288 E.0108
; LINE_WIDTH: 0.413248
G1 X102.75 Y103.881 E.0046
G1 X102.588 Y104.12 E.00372
; LINE_WIDTH: 0.403408
G1 X102.307 Y104.373 E.00476
; LINE_WIDTH: 0.410818
G1 X101.93 Y104.547 E.00533
G1 X101.6 Y104.594 E.00427
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J416.933 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.177 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X77.953 Y104.507 E.00612
; LINE_WIDTH: 0.404348
G1 X77.553 Y104.267 E.00588
; LINE_WIDTH: 0.413528
G1 X77.279 Y103.932 E.00559
G1 X77.191 Y103.732 E.00282
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00575
G1 X77.104 Y76.724 E.33894
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403948
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408228
G1 X77.697 Y75.619 E.00538
; LINE_WIDTH: 0.413578
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410268
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.415 Y75.405 E.0256
; LINE_WIDTH: 0.409338
G1 X84.415 Y75.405 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.404 E.01779
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.61 J-1948.916 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.578 Y75.404 I.348 J-43.347 E.01543
; LINE_WIDTH: 0.407018
G1 X101.832 Y75.437 E.00326
; LINE_WIDTH: 0.403398
G1 X102.004 Y75.497 E.00229
M204 S10000
M73 P21 R12
G1 X101.099 Y75.825 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444188
G1 F2084
M204 S6000
G1 X98.402 Y75.825 E.03754
; LINE_WIDTH: 0.444288
G1 X86.402 Y75.825 E.16706
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z1.64 F42000
G1 X101.099 Y104.175 Z1.64
G1 Z1.24
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2084
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.638 Y97.061 Z1.64 F42000
G1 X79.386 Y80.969 Z1.64
G1 Z1.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.405268
G1 F2084
M204 S5000
G1 X79.386 Y80.964 E.00006
; LINE_WIDTH: 0.388628
G1 X79.486 Y80.694 E.00348
; LINE_WIDTH: 0.387588
G1 X79.742 Y80.46 E.00419
; LINE_WIDTH: 0.390508
G1 X80.016 Y80.375 E.00349
G1 X80.288 Y80.409 E.00334
; LINE_WIDTH: 0.388328
G1 X80.526 Y80.545 E.00331
; LINE_WIDTH: 0.398448
G1 X80.725 Y80.827 E.00429
G1 X80.76 Y81.028 E.00254
; LINE_WIDTH: 0.388208
G1 X80.721 Y81.299 E.00331
; LINE_WIDTH: 0.404528
G1 X80.529 Y81.585 E.00434
G1 X80.289 Y81.725 E.00351
; LINE_WIDTH: 0.405868
G1 X80.055 Y81.758 E.00299
G1 X79.785 Y81.697 E.00351
; LINE_WIDTH: 0.405268
G1 X79.562 Y81.537 E.00347
G1 X79.418 Y81.302 E.00348
G1 X79.392 Y81.029 E.00348
; WIPE_START
G1 F12000
M204 S6000
G1 X79.386 Y80.964 E-.02464
G1 X79.486 Y80.694 E-.10933
G1 X79.742 Y80.46 E-.13195
G1 X80.016 Y80.375 E-.10902
G1 X80.288 Y80.409 E-.10425
G1 X80.526 Y80.545 E-.10409
G1 X80.725 Y80.827 E-.13113
G1 X80.746 Y80.945 E-.04558
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.37 Y80.207 Z1.64 F42000
G1 Z1.24
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2084
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2084
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z1.64 F42000
G1 X84.654 Y92.246 Z1.64
G1 Z1.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2084
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.64 F42000
G1 Z1.24
G1 E.8 F1800
G1 F2084
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.64 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 14/99
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G1 X102.079 Y75.526 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.410748
G1 F2105
M204 S5000
G1 X102.292 Y75.613 E.00295
G1 X102.482 Y75.77 E.00317
; LINE_WIDTH: 0.406728
G1 X102.773 Y76.151 E.00609
; LINE_WIDTH: 0.409498
G1 X102.893 Y76.646 E.00652
G1 X102.894 Y76.7 E.00068
; LINE_WIDTH: 0.407738
G1 X102.895 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.895 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.895 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.895 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.895 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.896 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.896 Y103.276 E.03287
; LINE_WIDTH: 0.411158
G1 X102.854 Y103.614 E.00437
G1 X102.671 Y104.011 E.00562
; LINE_WIDTH: 0.404098
G1 X102.347 Y104.349 E.0059
; LINE_WIDTH: 0.411088
G1 X101.936 Y104.544 E.00584
G1 X101.6 Y104.594 E.00436
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J417.993 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.278 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.429 Y104.596 E.04316
G1 X78.1 Y104.551 E.00424
; LINE_WIDTH: 0.410718
G1 X77.704 Y104.385 E.00551
; LINE_WIDTH: 0.413738
G1 X77.445 Y104.169 E.00436
G1 X77.204 Y103.771 E.00601
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.292 E.00624
G1 X77.104 Y76.729 E.33891
G1 X77.173 Y76.298 E.00556
; LINE_WIDTH: 0.406448
G1 X77.415 Y75.871 E.00623
; LINE_WIDTH: 0.402808
G1 X77.746 Y75.594 E.00542
; LINE_WIDTH: 0.411318
G1 X78.129 Y75.438 E.00532
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.41 Y75.405 E.0256
; LINE_WIDTH: 0.409338
G1 X84.41 Y75.405 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.404 E.01786
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.613 J-1946.973 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.578 Y75.404 I.348 J-43.567 E.01544
; LINE_WIDTH: 0.407038
G1 X101.882 Y75.445 E.00389
; LINE_WIDTH: 0.410748
G1 X102.023 Y75.503 E.00197
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2105
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.636 Y75.808 E.00251
; LINE_WIDTH: 0.407588
G1 X101.857 Y75.837 E.00283
G1 X102.2 Y76.032 E.00502
; LINE_WIDTH: 0.405248
G1 X102.43 Y76.354 E.005
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407808
G1 X102.504 Y82.7 E.05093
; LINE_WIDTH: 0.407948
G1 X102.504 Y86.7 E.05095
; LINE_WIDTH: 0.408078
G1 X102.504 Y90.7 E.05097
; LINE_WIDTH: 0.408218
G1 X102.504 Y94.7 E.05098
; LINE_WIDTH: 0.408348
G1 X102.504 Y98.7 E.051
; LINE_WIDTH: 0.408488
G1 X102.504 Y103.276 E.05837
; LINE_WIDTH: 0.411158
G1 X102.476 Y103.499 E.00288
G1 X102.347 Y103.799 E.0042
; LINE_WIDTH: 0.406998
G1 X102.06 Y104.074 E.00505
G1 X101.715 Y104.196 E.00465
; LINE_WIDTH: 0.409128
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.429 Y104.204 E.04316
G1 X78.103 Y104.149 E.00422
; LINE_WIDTH: 0.406818
G1 X77.797 Y103.968 E.00452
G1 X77.57 Y103.645 E.00501
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.285 E.00469
G1 X77.496 Y76.729 E.33881
G1 X77.551 Y76.403 E.00421
; LINE_WIDTH: 0.405568
G1 X77.729 Y76.1 E.00444
; LINE_WIDTH: 0.408248
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409798
G1 X82.42 Y75.797 E.0256
; LINE_WIDTH: 0.409338
G1 X84.42 Y75.796 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11712
G1 X101.636 Y75.808 E-.07262
G1 X101.857 Y75.837 E-.08465
G1 X102.2 Y76.032 E-.14992
G1 X102.43 Y76.354 E-.15007
G1 X102.504 Y76.7 E-.13443
G1 X102.504 Y76.834 E-.05119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.457 Z1.72 F42000
G1 X101.099 Y104.175 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2105
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z1.72 F42000
G1 X101.099 Y75.825 Z1.72
G1 Z1.32
M73 P22 R12
G1 E.8 F1800
; LINE_WIDTH: 0.444168
G1 F2105
M204 S6000
G1 X96.402 Y75.825 E.06537
; LINE_WIDTH: 0.444268
G1 X86.402 Y75.825 E.13921
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.773 Y79.609 Z1.72 F42000
G1 X79.387 Y80.97 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.388028
G1 F2105
M204 S5000
G1 X79.387 Y80.964 E.00007
; LINE_WIDTH: 0.400588
G1 X79.527 Y80.632 E.00451
; LINE_WIDTH: 0.403448
G1 X79.72 Y80.465 E.00322
; LINE_WIDTH: 0.415658
G1 X79.947 Y80.395 E.00307
; LINE_WIDTH: 0.417448
G3 X80.025 Y80.39 I.046 J.089 E.00106
; LINE_WIDTH: 0.415818
G1 X80.328 Y80.422 E.00395
; LINE_WIDTH: 0.406128
G1 X80.554 Y80.569 E.00342
G1 X80.709 Y80.796 E.00349
; LINE_WIDTH: 0.406068
G1 X80.738 Y80.893 E.00128
; LINE_WIDTH: 0.386008
G1 X80.753 Y81.166 E.00329
G1 X80.643 Y81.451 E.00367
; LINE_WIDTH: 0.389508
G1 X80.399 Y81.671 E.00399
; LINE_WIDTH: 0.394188
G1 X80.125 Y81.757 E.00354
G1 X79.852 Y81.723 E.00338
; LINE_WIDTH: 0.396248
G1 X79.57 Y81.546 E.00411
G1 X79.404 Y81.246 E.00423
; LINE_WIDTH: 0.388028
G1 X79.391 Y81.03 E.00262
; WIPE_START
G1 F12000
M204 S6000
G1 X79.387 Y80.964 E-.02515
G1 X79.527 Y80.632 E-.13704
G1 X79.72 Y80.465 E-.09726
G1 X79.947 Y80.395 E-.0899
G1 X80.025 Y80.39 E-.03008
G1 X80.328 Y80.422 E-.11551
G1 X80.554 Y80.569 E-.10237
G1 X80.709 Y80.796 E-.10463
G1 X80.738 Y80.893 E-.03825
G1 X80.741 Y80.945 E-.01981
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2105
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2105
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z1.72 F42000
G1 X84.654 Y92.246 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2105
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
G1 F2105
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.72 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 15/99
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2085
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.407578
G1 X101.857 Y75.837 E.00221
G1 X102.2 Y76.032 E.00502
; LINE_WIDTH: 0.405278
G1 X102.43 Y76.354 E.00499
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00451
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407808
G1 X102.504 Y82.7 E.05093
; LINE_WIDTH: 0.407948
G1 X102.504 Y86.7 E.05095
; LINE_WIDTH: 0.408078
G1 X102.504 Y90.7 E.05097
; LINE_WIDTH: 0.408218
G1 X102.504 Y94.7 E.05098
; LINE_WIDTH: 0.408348
G1 X102.504 Y98.7 E.051
; LINE_WIDTH: 0.408488
G1 X102.504 Y103.276 E.05836
G1 X102.475 Y103.517 E.0031
; LINE_WIDTH: 0.408028
G1 X102.325 Y103.831 E.00444
; LINE_WIDTH: 0.408248
G1 X102.062 Y104.073 E.00455
G1 X101.719 Y104.194 E.00463
; LINE_WIDTH: 0.408418
G1 X101.632 Y104.192 E.00111
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00247
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
G1 X78.021 Y104.116 E.00452
; LINE_WIDTH: 0.411558
G1 X77.718 Y103.884 E.0049
G1 X77.543 Y103.572 E.00461
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.285 E.0037
G1 X77.496 Y76.724 E.33887
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413498
G1 X77.614 Y76.276 E.00182
G1 X77.755 Y76.076 E.00317
; LINE_WIDTH: 0.411228
G1 X78.01 Y75.889 E.00406
; LINE_WIDTH: 0.405388
G1 X78.33 Y75.802 E.00421
; LINE_WIDTH: 0.410258
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.409788
G1 X82.429 Y75.797 E.02559
; LINE_WIDTH: 0.409328
G1 X84.429 Y75.796 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.796 E.01761
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.082 Y75.527 F42000
; LINE_WIDTH: 0.410758
G1 F2085
M204 S5000
G1 X102.292 Y75.613 E.00291
G1 X102.482 Y75.77 E.00317
; LINE_WIDTH: 0.406708
G1 X102.773 Y76.152 E.0061
; LINE_WIDTH: 0.409518
G1 X102.893 Y76.646 E.00651
G1 X102.894 Y76.7 E.00068
; LINE_WIDTH: 0.407738
G1 X102.895 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.895 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.895 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.895 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.895 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.896 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.896 Y102.7 E.02551
G3 X102.856 Y103.615 I-3.888 J.288 E.01171
; LINE_WIDTH: 0.408128
G1 X102.651 Y104.037 E.00598
; LINE_WIDTH: 0.403998
G1 X102.349 Y104.348 E.00546
; LINE_WIDTH: 0.414128
G1 X102.002 Y104.524 E.00504
G1 X101.6 Y104.594 E.00527
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.538 J460.618 E.08537
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.64 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.005 Y104.527 E.00467
; LINE_WIDTH: 0.413588
G1 X77.709 Y104.387 E.00424
G1 X77.419 Y104.136 E.00495
; LINE_WIDTH: 0.411558
G1 X77.202 Y103.767 E.0055
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.292 E.00619
G1 X77.104 Y76.724 E.33896
G1 X77.182 Y76.284 E.00571
; LINE_WIDTH: 0.403698
G1 X77.391 Y75.906 E.00544
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00536
; LINE_WIDTH: 0.413578
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410258
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.415 Y75.405 E.02559
; LINE_WIDTH: 0.409328
G1 X84.415 Y75.405 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.404 E.01779
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.613 J-1946.973 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.579 Y75.404 I.348 J-43.526 E.01545
; LINE_WIDTH: 0.407018
G1 X101.882 Y75.445 E.00388
; LINE_WIDTH: 0.410758
G1 X102.026 Y75.504 E.002
M204 S10000
G1 X101.099 Y75.825 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444158
G1 F2085
M204 S6000
G1 X96.402 Y75.825 E.06537
; LINE_WIDTH: 0.444268
G1 X86.402 Y75.825 E.13921
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z1.8 F42000
G1 X86.402 Y104.174 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2085
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.149 Y98.365 Z1.8 F42000
G1 X79.378 Y81.029 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.405248
M73 P23 R12
G1 F2085
M204 S5000
G1 X79.479 Y80.706 E.00427
; LINE_WIDTH: 0.388668
G1 X79.676 Y80.496 E.00349
; LINE_WIDTH: 0.392008
G1 X80.002 Y80.377 E.00424
G1 X80.259 Y80.401 E.00316
; LINE_WIDTH: 0.385548
G1 X80.514 Y80.535 E.00346
; LINE_WIDTH: 0.396188
G1 X80.726 Y80.826 E.00445
; LINE_WIDTH: 0.404008
G1 X80.763 Y81.1 E.00348
G1 X80.696 Y81.366 E.00347
; LINE_WIDTH: 0.402988
G1 X80.528 Y81.588 E.00349
; LINE_WIDTH: 0.405888
G1 X80.326 Y81.71 E.003
G1 X80.053 Y81.758 E.00351
; LINE_WIDTH: 0.405248
G1 X79.785 Y81.697 E.00348
G1 X79.562 Y81.537 E.00347
G1 X79.418 Y81.302 E.00348
G1 X79.386 Y81.088 E.00274
; WIPE_START
G1 F12000
M204 S6000
G1 X79.479 Y80.706 E-.14911
G1 X79.676 Y80.496 E-.10946
G1 X80.002 Y80.377 E-.13196
G1 X80.259 Y80.401 E-.09819
G1 X80.514 Y80.535 E-.10934
G1 X80.726 Y80.826 E-.13698
G1 X80.735 Y80.891 E-.02495
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2085
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2085
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z1.8 F42000
G1 X84.654 Y92.246 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2085
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
G1 F2085
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 16/99
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2109
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.403698
G1 X101.94 Y75.869 E.00329
; LINE_WIDTH: 0.407878
G1 X102.265 Y76.093 E.00503
G1 X102.457 Y76.428 E.00491
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.414228
G3 X102.348 Y103.8 I-1.09 J-.036 E.00715
; LINE_WIDTH: 0.406948
G1 X102.059 Y104.074 E.00506
G1 X101.715 Y104.196 E.00464
; LINE_WIDTH: 0.409108
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406568
G1 X77.629 Y103.767 E.00549
; LINE_WIDTH: 0.405918
G1 X77.5 Y103.37 E.00529
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.28 I42.492 J-1.093 E.02677
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y95.28 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.28 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.28 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.28 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.28 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.28 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.28 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.0071
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411228
G1 X77.755 Y76.076 E.00495
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404538
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410258
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409328
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.108 Y75.531 F42000
; LINE_WIDTH: 0.414828
G1 F2109
M204 S5000
G1 X102.29 Y75.615 E.00261
G1 X102.487 Y75.771 E.00325
; LINE_WIDTH: 0.411508
G1 X102.767 Y76.145 E.00601
G1 X102.893 Y76.646 E.00664
; LINE_WIDTH: 0.409528
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.895 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.024 J.288 E.0095
; LINE_WIDTH: 0.408478
G1 X102.761 Y103.859 E.00554
G1 X102.647 Y104.047 E.00281
; LINE_WIDTH: 0.406118
G1 X102.356 Y104.339 E.00522
; LINE_WIDTH: 0.411068
G1 X101.937 Y104.544 E.006
G1 X101.6 Y104.594 E.00436
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.534 J419.054 E.08537
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.64 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.415268
G1 X77.963 Y104.514 E.00532
G1 X77.615 Y104.318 E.00519
; LINE_WIDTH: 0.404118
G1 X77.302 Y103.973 E.00587
; LINE_WIDTH: 0.411558
G1 X77.138 Y103.571 E.00558
G1 X77.105 Y103.29 E.00363
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00722
G1 X77.182 Y76.283 E.00571
; LINE_WIDTH: 0.403678
G1 X77.39 Y75.906 E.00543
; LINE_WIDTH: 0.408238
G1 X77.697 Y75.619 E.00536
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00517
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410258
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409328
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.613 J-1943.578 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.58 Y75.404 I.348 J-43.551 E.01546
; LINE_WIDTH: 0.407388
G1 X101.947 Y75.457 E.00472
; LINE_WIDTH: 0.414828
G1 X102.053 Y75.506 E.00151
; WIPE_START
G1 F12000
M204 S6000
G1 X102.29 Y75.615 E-.09924
G1 X102.487 Y75.771 E-.09543
G1 X102.767 Y76.145 E-.1777
G1 X102.893 Y76.646 E-.19629
G1 X102.894 Y76.7 E-.0204
G1 X102.894 Y77.15 E-.17094
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444158
G1 F2109
M204 S6000
G1 X96.402 Y75.825 E.06537
; LINE_WIDTH: 0.444268
G1 X86.402 Y75.825 E.13921
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z1.88 F42000
G1 X86.402 Y104.174 Z1.88
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2109
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.161 Y98.355 Z1.88 F42000
G1 X79.391 Y80.949 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2109
M204 S5000
G1 X79.391 Y80.937 E.00015
; LINE_WIDTH: 0.392828
G1 X79.53 Y80.633 E.00409
; LINE_WIDTH: 0.399188
G1 X79.749 Y80.446 E.00359
; LINE_WIDTH: 0.403208
G1 X79.979 Y80.376 E.00302
G1 X80.289 Y80.404 E.00392
; LINE_WIDTH: 0.398228
G1 X80.529 Y80.541 E.00343
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.38 E.00447
; LINE_WIDTH: 0.389228
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.389368
G1 X80.26 Y81.731 E.00332
G1 X79.987 Y81.75 E.00332
; LINE_WIDTH: 0.384968
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.393 Y81.009 E.00273
; WIPE_START
G1 F12000
M204 S6000
G1 X79.391 Y80.937 E-.02757
G1 X79.53 Y80.633 E-.1269
G1 X79.749 Y80.446 E-.10952
G1 X79.979 Y80.376 E-.09115
G1 X80.289 Y80.404 E-.11834
G1 X80.529 Y80.541 E-.1048
G1 X80.696 Y80.76 E-.10482
G1 X80.747 Y80.956 E-.07689
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2109
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2109
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z1.88 F42000
G1 X84.654 Y92.246 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2109
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
M73 P24 R12
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
G1 F2109
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.88 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.56
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 17/99
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2093
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.405108
G1 X102.02 Y75.905 E.00441
G1 X102.315 Y76.154 E.00488
; LINE_WIDTH: 0.404878
G1 X102.458 Y76.427 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00556
; LINE_WIDTH: 0.403958
G1 X102.093 Y104.055 E.00526
; LINE_WIDTH: 0.403788
G1 X101.71 Y104.198 E.00514
; LINE_WIDTH: 0.409828
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.411188
G1 X78.111 Y104.15 E.00333
G1 X77.835 Y103.999 E.00405
; LINE_WIDTH: 0.411568
G1 X77.598 Y103.706 E.00484
G1 X77.5 Y103.37 E.0045
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.28 I42.527 J-1.094 E.02678
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.28 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.28 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.28 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.28 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.28 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.28 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.28 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00709
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413478
G1 X77.614 Y76.275 E.00184
G1 X77.755 Y76.076 E.00315
; LINE_WIDTH: 0.411228
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404538
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409798
G1 X82.424 Y75.797 E.0256
; LINE_WIDTH: 0.409328
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.072 Y75.521 F42000
; LINE_WIDTH: 0.403398
G1 F2093
M204 S5000
G1 X102.207 Y75.569 E.00179
; LINE_WIDTH: 0.404238
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407748
G1 X102.783 Y76.184 E.00561
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.415218
G1 X102.82 Y103.71 E.00497
G1 X102.678 Y104.017 E.00438
; LINE_WIDTH: 0.407698
G1 X102.299 Y104.381 E.00669
; LINE_WIDTH: 0.408218
G1 X101.892 Y104.557 E.00565
; LINE_WIDTH: 0.409828
G1 X101.6 Y104.594 E.00376
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.655 J1985.099 E.08536
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.64 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.411188
G1 X77.962 Y104.516 E.00527
G1 X77.59 Y104.297 E.00555
; LINE_WIDTH: 0.403098
G1 X77.303 Y103.974 E.00543
; LINE_WIDTH: 0.411568
G1 X77.138 Y103.571 E.0056
G1 X77.105 Y103.29 E.00364
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00721
G1 X77.182 Y76.284 E.00571
; LINE_WIDTH: 0.403658
G1 X77.391 Y75.906 E.00544
; LINE_WIDTH: 0.408238
G1 X77.698 Y75.619 E.00536
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.412 Y75.405 E.0256
; LINE_WIDTH: 0.409328
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.616 J-1948.445 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.58 Y75.404 I.348 J-43.641 E.01547
; LINE_WIDTH: 0.406998
G1 X101.832 Y75.437 E.00323
; LINE_WIDTH: 0.403398
G1 X102.016 Y75.501 E.00245
M204 S10000
G1 X101.099 Y75.825 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444158
G1 F2093
M204 S6000
G1 X94.402 Y75.825 E.09321
; LINE_WIDTH: 0.444268
G1 X86.402 Y75.825 E.11137
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z1.96 F42000
G1 X86.402 Y104.174 Z1.96
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2093
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.158 Y98.358 Z1.96 F42000
G1 X79.388 Y80.969 Z1.96
G1 Z1.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2093
M204 S5000
G1 X79.388 Y80.964 E.00005
G1 X79.48 Y80.707 E.00328
G1 X79.687 Y80.489 E.0036
; LINE_WIDTH: 0.392868
G1 X80.002 Y80.377 E.00409
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00359
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398168
G1 X80.696 Y80.76 E.00342
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.38 E.00447
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00349
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.391 Y81.029 E.0025
; WIPE_START
G1 F12000
M204 S6000
G1 X79.388 Y80.964 E-.02451
G1 X79.48 Y80.707 E-.10385
G1 X79.687 Y80.489 E-.11424
G1 X80.002 Y80.377 E-.12698
G1 X80.289 Y80.403 E-.1095
G1 X80.528 Y80.541 E-.10488
G1 X80.696 Y80.76 E-.10473
G1 X80.743 Y80.941 E-.07131
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2093
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2093
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z1.96 F42000
G1 X84.654 Y92.246 Z1.96
G1 Z1.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2093
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
G1 F2093
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.96 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 18/99
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2089
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.405108
G1 X102.02 Y75.905 E.00441
G1 X102.315 Y76.154 E.00487
; LINE_WIDTH: 0.402778
G1 X102.457 Y76.428 E.00387
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00352
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407808
G1 X102.504 Y82.7 E.05093
; LINE_WIDTH: 0.407948
G1 X102.504 Y86.7 E.05095
; LINE_WIDTH: 0.408078
M73 P25 R12
G1 X102.504 Y90.7 E.05097
; LINE_WIDTH: 0.408218
G1 X102.504 Y94.7 E.05098
; LINE_WIDTH: 0.408348
G1 X102.504 Y98.7 E.051
; LINE_WIDTH: 0.408488
G1 X102.504 Y103.276 E.05836
G1 X102.472 Y103.523 E.00318
; LINE_WIDTH: 0.408168
G1 X102.296 Y103.87 E.00497
; LINE_WIDTH: 0.404428
G1 X102.028 Y104.091 E.00438
G1 X101.715 Y104.196 E.00417
; LINE_WIDTH: 0.409098
G1 X101.634 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.187 Y104.176 E.00305
; LINE_WIDTH: 0.408248
G1 X77.866 Y104.023 E.00453
; LINE_WIDTH: 0.407218
G1 X77.607 Y103.726 E.00501
G1 X77.5 Y103.369 E.00473
; LINE_WIDTH: 0.410278
G3 X77.498 Y101.281 I43.922 J-1.092 E.02676
; LINE_WIDTH: 0.410148
G1 X77.498 Y99.281 E.02562
; LINE_WIDTH: 0.410018
G1 X77.498 Y97.281 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.281 E.0256
; LINE_WIDTH: 0.409768
G1 X77.497 Y93.281 E.02559
; LINE_WIDTH: 0.409638
G1 X77.497 Y91.281 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.281 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.281 E.02557
; LINE_WIDTH: 0.409258
G1 X77.497 Y85.281 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.281 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.281 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.281 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.281 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.0071
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411188
G1 X77.754 Y76.076 E.00495
G1 X78.01 Y75.89 E.00406
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.425 Y75.798 E.02684
; LINE_WIDTH: 0.409798
G1 X82.425 Y75.797 E.0256
; LINE_WIDTH: 0.409328
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.079 Y75.518 F42000
; LINE_WIDTH: 0.400498
G1 F2089
M204 S5000
G1 X102.147 Y75.539 E.00088
; LINE_WIDTH: 0.408318
G1 X102.515 Y75.792 E.00569
; LINE_WIDTH: 0.410118
G1 X102.769 Y76.147 E.00559
G1 X102.893 Y76.646 E.00658
; LINE_WIDTH: 0.409528
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407738
G1 X102.895 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.895 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.895 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.895 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.895 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.896 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.896 Y103.276 E.03286
G1 X102.833 Y103.673 E.00514
; LINE_WIDTH: 0.408168
G1 X102.628 Y104.069 E.00567
; LINE_WIDTH: 0.406198
G1 X102.342 Y104.351 E.0051
; LINE_WIDTH: 0.410658
G1 X101.937 Y104.544 E.00576
G1 X101.6 Y104.594 E.00437
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J416.503 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.276 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.191 Y104.571 E.003
; LINE_WIDTH: 0.411198
G1 X77.818 Y104.451 E.00503
; LINE_WIDTH: 0.414848
G1 X77.511 Y104.23 E.0049
G1 X77.276 Y103.934 E.0049
; LINE_WIDTH: 0.410318
G1 X77.137 Y103.56 E.00511
G1 X77.105 Y103.29 E.00348
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410148
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410018
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409768
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409638
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409258
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408878
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00722
G1 X77.182 Y76.283 E.00572
; LINE_WIDTH: 0.403638
G1 X77.391 Y75.906 E.00543
; LINE_WIDTH: 0.408238
G1 X77.697 Y75.619 E.00536
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.413 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.413 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.413 Y75.405 E.0256
; LINE_WIDTH: 0.409328
G1 X84.413 Y75.405 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.616 J-1945.034 E.11284
G1 X100.402 Y75.41 E.07878
G3 X101.778 Y75.428 I.348 J27.014 E.01806
; LINE_WIDTH: 0.400498
G1 X102.022 Y75.501 E.00319
M204 S10000
G1 X101.099 Y75.825 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444118
G1 F2089
M204 S6000
G1 X96.402 Y75.825 E.06536
; LINE_WIDTH: 0.444248
G1 X86.402 Y75.825 E.13921
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z2.04 F42000
G1 X101.099 Y104.175 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2089
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.642 Y97.059 Z2.04 F42000
G1 X79.391 Y80.943 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384988
G1 F2089
M204 S5000
G1 X79.391 Y80.937 E.00008
; LINE_WIDTH: 0.392868
G1 X79.53 Y80.633 E.00409
; LINE_WIDTH: 0.396088
G1 X79.783 Y80.429 E.00402
G1 X80.154 Y80.378 E.00462
; LINE_WIDTH: 0.394028
G1 X80.493 Y80.518 E.00451
; LINE_WIDTH: 0.403808
G1 X80.696 Y80.765 E.00403
; LINE_WIDTH: 0.410868
G1 X80.76 Y81.03 E.00351
G1 X80.757 Y81.122 E.00118
; LINE_WIDTH: 0.388008
G1 X80.677 Y81.393 E.00341
; LINE_WIDTH: 0.389388
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00327
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.393 Y81.003 E.00281
; WIPE_START
G1 F12000
M204 S6000
G1 X79.391 Y80.937 E-.02525
G1 X79.53 Y80.633 E-.12698
G1 X79.783 Y80.429 E-.12359
G1 X80.154 Y80.378 E-.14226
G1 X80.493 Y80.518 E-.13954
G1 X80.696 Y80.765 E-.12137
G1 X80.746 Y80.972 E-.08101
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2089
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2089
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z2.04 F42000
G1 X84.654 Y92.246 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2089
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
G1 F2089
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.04 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.72
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 19/99
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z1.72
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2090
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.405108
G1 X102.02 Y75.905 E.00441
; LINE_WIDTH: 0.405928
G1 X102.316 Y76.153 E.00489
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
M73 P25 R11
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413708
G1 X102.472 Y103.498 E.00291
G1 X102.348 Y103.8 E.00422
; LINE_WIDTH: 0.406838
G1 X102.058 Y104.075 E.00507
G1 X101.715 Y104.196 E.00462
; LINE_WIDTH: 0.409118
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
M73 P26 R11
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
G1 X78.103 Y104.149 E.00417
; LINE_WIDTH: 0.411208
G1 X77.776 Y103.946 E.00495
G1 X77.59 Y103.69 E.00405
; LINE_WIDTH: 0.404508
G1 X77.501 Y103.37 E.0042
; LINE_WIDTH: 0.410278
G1 X77.498 Y101.276 E.02683
; LINE_WIDTH: 0.410148
G1 X77.498 Y99.276 E.02562
; LINE_WIDTH: 0.410018
G1 X77.498 Y97.276 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.276 E.0256
; LINE_WIDTH: 0.409768
G1 X77.497 Y93.276 E.02559
; LINE_WIDTH: 0.409638
G1 X77.497 Y91.276 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.276 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.276 E.02557
; LINE_WIDTH: 0.409258
G1 X77.497 Y85.276 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.276 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.276 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.276 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.276 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.00703
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411208
G1 X77.754 Y76.076 E.00495
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404538
G1 X78.331 Y75.801 E.0042
; LINE_WIDTH: 0.410258
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.094 Y75.529 F42000
; LINE_WIDTH: 0.403388
G1 F2090
M204 S5000
G1 X102.207 Y75.569 E.00151
; LINE_WIDTH: 0.404788
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.410658
G1 X102.768 Y76.145 E.00549
G1 X102.893 Y76.646 E.00662
; LINE_WIDTH: 0.409538
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.895 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.895 Y103.275 E.033
; LINE_WIDTH: 0.413708
G1 X102.857 Y103.585 E.00403
G1 X102.667 Y104.023 E.00618
; LINE_WIDTH: 0.405558
G1 X102.346 Y104.35 E.00579
; LINE_WIDTH: 0.411088
G1 X101.937 Y104.544 E.00582
G1 X101.6 Y104.594 E.00436
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J420.157 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.177 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X77.983 Y104.518 E.00573
; LINE_WIDTH: 0.403598
G1 X77.606 Y104.309 E.00543
; LINE_WIDTH: 0.408238
G1 X77.319 Y104.003 E.00535
; LINE_WIDTH: 0.412808
G1 X77.157 Y103.636 E.00516
G1 X77.105 Y103.288 E.00455
; LINE_WIDTH: 0.410278
G1 X77.105 Y101.288 E.02563
; LINE_WIDTH: 0.410148
G1 X77.105 Y99.288 E.02562
; LINE_WIDTH: 0.410018
G1 X77.105 Y97.288 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.288 E.0256
; LINE_WIDTH: 0.409768
G1 X77.105 Y93.288 E.02559
; LINE_WIDTH: 0.409638
G1 X77.105 Y91.288 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.288 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.288 E.02557
; LINE_WIDTH: 0.409258
G1 X77.105 Y85.288 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.288 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.288 E.02554
; LINE_WIDTH: 0.408878
G1 X77.104 Y79.288 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00718
G1 X77.182 Y76.283 E.00572
; LINE_WIDTH: 0.403618
G1 X77.391 Y75.906 E.00543
; LINE_WIDTH: 0.408228
G1 X77.698 Y75.619 E.00536
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00517
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410258
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.62 J-1943.109 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.582 Y75.404 I.348 J-43.888 E.01549
; LINE_WIDTH: 0.406998
G1 X101.832 Y75.437 E.00321
; LINE_WIDTH: 0.403388
G1 X102.037 Y75.509 E.00274
M204 S10000
G1 X101.099 Y75.825 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444138
G1 F2090
M204 S6000
G1 X94.402 Y75.825 E.0932
; LINE_WIDTH: 0.444248
G1 X86.402 Y75.825 E.11136
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z2.12 F42000
G1 X101.099 Y104.175 Z2.12
G1 Z1.72
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2090
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.642 Y97.059 Z2.12 F42000
G1 X79.391 Y80.943 Z2.12
G1 Z1.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384988
G1 F2090
M204 S5000
G1 X79.391 Y80.937 E.00008
; LINE_WIDTH: 0.392868
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392388
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398228
G1 X80.512 Y81.593 E.0045
; LINE_WIDTH: 0.387528
G1 X80.259 Y81.728 E.00346
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00327
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.393 Y81.003 E.00281
; WIPE_START
G1 F12000
M204 S6000
G1 X79.391 Y80.937 E-.02522
G1 X79.53 Y80.633 E-.12699
G1 X79.751 Y80.449 E-.10943
G1 X80.016 Y80.374 E-.10444
G1 X80.289 Y80.403 E-.10454
G1 X80.528 Y80.541 E-.1049
G1 X80.696 Y80.76 E-.10485
G1 X80.749 Y80.963 E-.07963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.12 F42000
G1 Z1.72
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2090
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2090
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z2.12 F42000
G1 X84.654 Y92.246 Z2.12
G1 Z1.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2090
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.12 F42000
G1 Z1.72
G1 E.8 F1800
G1 F2090
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.12 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 20/99
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2092
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.407568
G1 X101.857 Y75.838 E.00221
G1 X102.201 Y76.032 E.00502
; LINE_WIDTH: 0.405458
G1 X102.43 Y76.354 E.005
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00451
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408858
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409058
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409448
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409648
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410038
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410238
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413698
G1 X102.472 Y103.498 E.0029
G1 X102.348 Y103.8 E.00422
; LINE_WIDTH: 0.406818
G1 X102.058 Y104.075 E.00507
G1 X101.715 Y104.196 E.00462
; LINE_WIDTH: 0.409108
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406568
G1 X77.626 Y103.763 E.00554
; LINE_WIDTH: 0.406088
G1 X77.5 Y103.37 E.00524
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.281 I44.119 J-1.093 E.02677
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.281 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.281 E.02561
; LINE_WIDTH: 0.409898
M73 P27 R11
G1 X77.497 Y95.281 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.281 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.281 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.281 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.281 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.281 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.281 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.281 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.281 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.281 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.0071
G1 X77.551 Y76.403 E.00417
; LINE_WIDTH: 0.410718
G1 X77.751 Y76.079 E.00489
G1 X78.01 Y75.889 E.00411
; LINE_WIDTH: 0.405568
G1 X78.33 Y75.801 E.00421
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409798
G1 X82.424 Y75.797 E.0256
; LINE_WIDTH: 0.409328
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.097 Y75.533 F42000
; LINE_WIDTH: 0.410778
G1 F2092
M204 S5000
G1 X102.292 Y75.613 E.0027
; LINE_WIDTH: 0.415238
G1 X102.578 Y75.864 E.00495
G1 X102.774 Y76.155 E.00455
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00646
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408858
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409058
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409448
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409648
G1 X102.895 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410038
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410238
G1 X102.895 Y103.275 E.033
; LINE_WIDTH: 0.413698
G1 X102.857 Y103.585 E.00403
G1 X102.667 Y104.024 E.00618
; LINE_WIDTH: 0.405568
G1 X102.346 Y104.35 E.0058
; LINE_WIDTH: 0.411028
G1 X101.936 Y104.544 E.00582
G1 X101.6 Y104.594 E.00436
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.589 I-3.534 J417.789 E.08536
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.64 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.415278
G1 X77.963 Y104.514 E.00532
G1 X77.614 Y104.317 E.0052
; LINE_WIDTH: 0.404058
G1 X77.299 Y103.969 E.00593
; LINE_WIDTH: 0.410718
G1 X77.136 Y103.559 E.00566
G1 X77.105 Y103.29 E.00347
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00722
G1 X77.182 Y76.283 E.00572
; LINE_WIDTH: 0.403588
G1 X77.391 Y75.906 E.00543
; LINE_WIDTH: 0.405138
G1 X77.704 Y75.62 E.00536
; LINE_WIDTH: 0.413138
G1 X78.063 Y75.456 E.0051
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.412 Y75.405 E.0256
; LINE_WIDTH: 0.409328
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.62 J-1943.109 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.583 Y75.404 I.348 J-43.719 E.0155
; LINE_WIDTH: 0.406948
G1 X101.882 Y75.445 E.00384
; LINE_WIDTH: 0.410778
G1 X102.041 Y75.51 E.00221
M204 S10000
G1 X101.099 Y75.825 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444118
G1 F2092
M204 S6000
G1 X94.402 Y75.825 E.0932
; LINE_WIDTH: 0.444228
G1 X86.402 Y75.825 E.11136
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z2.2 F42000
G1 X86.402 Y104.174 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2092
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443518
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443828
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443978
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444128
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444288
G1 X101.099 Y104.175 E.02784
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.162 Y98.354 Z2.2 F42000
G1 X79.391 Y80.941 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2092
M204 S5000
G1 X79.391 Y80.937 E.00005
; LINE_WIDTH: 0.392868
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392368
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399208
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398208
G1 X80.514 Y81.595 E.00451
; LINE_WIDTH: 0.392408
G1 X80.259 Y81.729 E.00352
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00327
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.393 Y81.001 E.00283
; WIPE_START
G1 F12000
M204 S6000
G1 X79.391 Y80.937 E-.02453
G1 X79.53 Y80.633 E-.12694
G1 X79.751 Y80.449 E-.10938
G1 X80.016 Y80.374 E-.10446
G1 X80.289 Y80.403 E-.10446
G1 X80.529 Y80.541 E-.10499
G1 X80.696 Y80.76 E-.10483
G1 X80.749 Y80.965 E-.08041
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2092
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2092
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z2.2 F42000
G1 X84.654 Y92.246 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2092
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F2092
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.88
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 21/99
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2090
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.405118
G1 X102.02 Y75.906 E.00441
; LINE_WIDTH: 0.405928
G1 X102.316 Y76.154 E.00489
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407878
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408078
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408468
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408858
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409448
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.413718
G1 X102.471 Y103.498 E.0029
G1 X102.347 Y103.8 E.00422
; LINE_WIDTH: 0.405508
G1 X102.057 Y104.074 E.00505
G1 X101.71 Y104.198 E.00466
; LINE_WIDTH: 0.409838
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.103 Y104.149 E.00416
; LINE_WIDTH: 0.411198
G1 X77.775 Y103.945 E.00496
G1 X77.591 Y103.69 E.00404
; LINE_WIDTH: 0.404748
G1 X77.501 Y103.37 E.0042
; LINE_WIDTH: 0.410298
G1 X77.498 Y101.276 E.02682
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.276 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.276 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.276 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.276 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.276 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.276 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.276 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.276 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.276 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.276 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.276 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.276 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00705
G1 X77.531 Y76.457 E.00344
; LINE_WIDTH: 0.406858
G1 X77.729 Y76.1 E.00518
G1 X78.01 Y75.889 E.00446
; LINE_WIDTH: 0.405388
G1 X78.33 Y75.802 E.00421
; LINE_WIDTH: 0.410248
M73 P28 R11
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.409778
G1 X82.429 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.429 Y75.796 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.796 E.01761
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.1 Y75.531 F42000
; LINE_WIDTH: 0.403398
G1 F2090
M204 S5000
G1 X102.207 Y75.569 E.00143
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.410658
G1 X102.768 Y76.145 E.00549
G1 X102.893 Y76.646 E.00663
; LINE_WIDTH: 0.409528
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407878
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408078
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408468
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408858
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409448
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.895 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.441 I-4.018 J.288 E.00951
; LINE_WIDTH: 0.404398
G1 X102.744 Y103.888 E.00589
; LINE_WIDTH: 0.414088
G1 X102.485 Y104.234 E.00559
G1 X102.308 Y104.371 E.00291
; LINE_WIDTH: 0.408208
G1 X101.892 Y104.557 E.00581
; LINE_WIDTH: 0.409838
G1 X101.6 Y104.594 E.00376
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1988.047 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.177 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X77.985 Y104.519 E.00568
; LINE_WIDTH: 0.403918
G1 X77.608 Y104.31 E.00544
; LINE_WIDTH: 0.408248
G1 X77.319 Y104.003 E.00538
; LINE_WIDTH: 0.412368
G1 X77.153 Y103.624 E.00532
G1 X77.105 Y103.288 E.00437
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.288 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.288 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.288 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.288 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.288 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.288 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.288 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.288 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.288 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.288 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.288 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.288 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.0072
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408238
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.413578
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410248
G1 X80.415 Y75.405 E.02562
; LINE_WIDTH: 0.409778
G1 X82.415 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.415 Y75.405 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.404 E.01779
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.623 J-1944.575 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.583 Y75.404 I.349 J-43.831 E.01551
; LINE_WIDTH: 0.406958
G1 X101.832 Y75.437 E.00319
; LINE_WIDTH: 0.403398
G1 X102.043 Y75.511 E.00281
M204 S10000
G1 X101.099 Y75.825 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444108
G1 F2090
M204 S6000
G1 X94.402 Y75.825 E.09319
; LINE_WIDTH: 0.444228
G1 X86.402 Y75.825 E.11136
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z2.28 F42000
G1 X101.099 Y104.175 Z2.28
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2090
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.642 Y97.059 Z2.28 F42000
G1 X79.391 Y80.939 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2090
M204 S5000
G1 X79.391 Y80.937 E.00002
; LINE_WIDTH: 0.392848
G1 X79.53 Y80.633 E.00409
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00402
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389428
G1 X80.464 Y80.498 E.00403
; LINE_WIDTH: 0.397708
G1 X80.69 Y80.752 E.00423
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00358
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398248
G1 X80.58 Y81.541 E.0035
; LINE_WIDTH: 0.397828
G1 X80.273 Y81.723 E.00443
; LINE_WIDTH: 0.387848
G1 X79.986 Y81.75 E.00348
; LINE_WIDTH: 0.384948
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.393 Y80.999 E.00286
; WIPE_START
G1 F12000
M204 S6000
G1 X79.391 Y80.937 E-.02359
G1 X79.53 Y80.633 E-.12695
G1 X79.783 Y80.429 E-.12356
G1 X80.154 Y80.378 E-.14232
G1 X80.464 Y80.498 E-.1262
G1 X80.69 Y80.752 E-.12953
G1 X80.751 Y80.975 E-.08784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.28 F42000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2090
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394328
G1 F2090
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z2.28 F42000
G1 X84.654 Y92.246 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2090
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.28 F42000
G1 Z1.88
G1 E.8 F1800
G1 F2090
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.28 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 22/99
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2085
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.405118
G1 X102.02 Y75.905 E.00441
G1 X102.315 Y76.154 E.00488
; LINE_WIDTH: 0.404858
G1 X102.458 Y76.428 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407878
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408078
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408468
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408858
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409448
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.414098
G1 X102.47 Y103.502 E.00295
G1 X102.347 Y103.799 E.00417
; LINE_WIDTH: 0.406768
G1 X102.057 Y104.075 E.00508
G1 X101.715 Y104.196 E.00461
; LINE_WIDTH: 0.409118
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.103 Y104.149 E.00416
; LINE_WIDTH: 0.411608
G1 X77.779 Y103.949 E.00489
G1 X77.571 Y103.645 E.00474
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.276 E.00481
G1 X77.496 Y76.724 E.33876
G1 X77.551 Y76.403 E.00415
; LINE_WIDTH: 0.413398
G1 X77.615 Y76.274 E.00187
G1 X77.764 Y76.068 E.00328
; LINE_WIDTH: 0.411658
G1 X78.01 Y75.89 E.0039
; LINE_WIDTH: 0.404538
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410258
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.088 Y75.527 F42000
; LINE_WIDTH: 0.403408
G1 F2085
M204 S5000
G1 X102.207 Y75.569 E.00158
; LINE_WIDTH: 0.404238
M73 P29 R11
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407748
G1 X102.783 Y76.184 E.00561
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407878
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408078
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408468
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408858
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409448
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.895 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.895 Y103.276 E.033
; LINE_WIDTH: 0.414098
G1 X102.853 Y103.613 E.0044
G1 X102.67 Y104.012 E.00567
; LINE_WIDTH: 0.404238
G1 X102.345 Y104.351 E.00593
; LINE_WIDTH: 0.411068
G1 X101.937 Y104.544 E.0058
G1 X101.6 Y104.594 E.00436
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.502 J420.166 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.177 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X77.983 Y104.518 E.00572
; LINE_WIDTH: 0.403558
G1 X77.606 Y104.309 E.00543
; LINE_WIDTH: 0.411608
G1 X77.309 Y103.988 E.00562
; LINE_WIDTH: 0.415258
G1 X77.158 Y103.636 E.00496
G1 X77.104 Y103.288 E.00458
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.33891
G1 X77.182 Y76.283 E.00571
; LINE_WIDTH: 0.403578
G1 X77.394 Y75.903 E.00547
; LINE_WIDTH: 0.408378
G1 X77.698 Y75.618 E.00532
; LINE_WIDTH: 0.412828
G1 X78.064 Y75.457 E.00515
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410258
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.623 J-1941.178 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.584 Y75.404 I.349 J-43.852 E.01552
; LINE_WIDTH: 0.406938
G1 X101.833 Y75.437 E.00319
; LINE_WIDTH: 0.403408
G1 X102.032 Y75.507 E.00266
M204 S10000
G1 X101.099 Y75.825 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444088
G1 F2085
M204 S6000
G1 X94.402 Y75.825 E.09319
; LINE_WIDTH: 0.444228
G1 X86.402 Y75.825 E.11136
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z2.36 F42000
G1 X101.099 Y104.175 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2085
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.65 Y97.056 Z2.36 F42000
G1 X79.403 Y80.895 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392368
G1 F2085
M204 S5000
G1 X79.407 Y80.863 E.00039
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00349
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.703 Y81.651 E.0036
; LINE_WIDTH: 0.392888
G1 X79.471 Y81.41 E.00409
G1 X79.38 Y81.137 E.00353
; LINE_WIDTH: 0.392368
G1 X79.398 Y80.955 E.00223
; WIPE_START
G1 F12000
M204 S6000
G1 X79.407 Y80.863 E-.03493
G1 X79.537 Y80.621 E-.10448
G1 X79.751 Y80.449 E-.10443
G1 X80.016 Y80.374 E-.10445
G1 X80.289 Y80.403 E-.10449
G1 X80.528 Y80.541 E-.10491
G1 X80.696 Y80.76 E-.10493
G1 X80.76 Y81.008 E-.09738
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2085
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2085
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z2.36 F42000
G1 X84.654 Y92.246 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2085
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
G1 F2085
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.36 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.04
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 23/99
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2110
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.403688
G1 X101.94 Y75.869 E.00329
; LINE_WIDTH: 0.407888
G1 X102.265 Y76.093 E.00503
G1 X102.457 Y76.428 E.00491
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.699 E.00351
G1 X102.504 Y78.699 E.02546
; LINE_WIDTH: 0.407818
G1 X102.504 Y82.699 E.05093
; LINE_WIDTH: 0.407948
G1 X102.504 Y86.699 E.05095
; LINE_WIDTH: 0.408088
G1 X102.504 Y90.699 E.05097
; LINE_WIDTH: 0.408218
G1 X102.504 Y94.699 E.05098
; LINE_WIDTH: 0.408348
G1 X102.504 Y98.699 E.051
; LINE_WIDTH: 0.408488
G1 X102.504 Y103.276 E.05837
; LINE_WIDTH: 0.410748
G1 X102.478 Y103.494 E.00282
G1 X102.344 Y103.805 E.00435
; LINE_WIDTH: 0.406738
G1 X102.057 Y104.075 E.005
G1 X101.715 Y104.196 E.0046
; LINE_WIDTH: 0.409128
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406568
G1 X77.629 Y103.768 E.00548
; LINE_WIDTH: 0.406118
G1 X77.5 Y103.369 E.00531
; LINE_WIDTH: 0.410278
G3 X77.498 Y101.281 I44.433 J-1.093 E.02676
; LINE_WIDTH: 0.410148
G1 X77.498 Y99.281 E.02562
; LINE_WIDTH: 0.410018
G1 X77.498 Y97.281 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.281 E.0256
; LINE_WIDTH: 0.409768
G1 X77.497 Y93.281 E.02559
; LINE_WIDTH: 0.409638
G1 X77.497 Y91.281 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.281 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.281 E.02557
; LINE_WIDTH: 0.409258
G1 X77.497 Y85.281 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.281 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.281 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.281 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.281 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.0071
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411188
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404848
G1 X78.33 Y75.802 E.0042
; LINE_WIDTH: 0.410268
G1 X80.428 Y75.798 E.02688
; LINE_WIDTH: 0.409788
G1 X82.428 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.428 Y75.796 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.796 E.01762
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.126 Y75.539 F42000
; LINE_WIDTH: 0.414828
G1 F2110
M204 S5000
G1 X102.29 Y75.614 E.00233
G1 X102.487 Y75.772 E.00326
; LINE_WIDTH: 0.411508
G1 X102.767 Y76.145 E.00601
G1 X102.893 Y76.646 E.00664
; LINE_WIDTH: 0.409498
G1 X102.894 Y76.699 E.00068
; LINE_WIDTH: 0.407748
G1 X102.895 Y80.699 E.05092
; LINE_WIDTH: 0.407888
G1 X102.895 Y84.699 E.05094
; LINE_WIDTH: 0.408018
G1 X102.895 Y88.699 E.05096
; LINE_WIDTH: 0.408148
G1 X102.895 Y92.699 E.05098
; LINE_WIDTH: 0.408288
G1 X102.895 Y96.699 E.05099
; LINE_WIDTH: 0.408418
G1 X102.896 Y100.699 E.05101
; LINE_WIDTH: 0.408558
G1 X102.896 Y103.276 E.03287
; LINE_WIDTH: 0.410748
G1 X102.858 Y103.585 E.004
G1 X102.663 Y104.028 E.00621
; LINE_WIDTH: 0.405288
M73 P30 R11
G1 X102.345 Y104.351 E.00574
; LINE_WIDTH: 0.411058
G1 X101.936 Y104.544 E.0058
G1 X101.6 Y104.594 E.00436
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.589 I-3.534 J419.027 E.08537
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.641 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.415278
G1 X77.963 Y104.514 E.00532
G1 X77.616 Y104.319 E.00516
; LINE_WIDTH: 0.404328
G1 X77.303 Y103.974 E.00588
; LINE_WIDTH: 0.410608
G1 X77.135 Y103.557 E.00577
G1 X77.105 Y103.29 E.00344
; LINE_WIDTH: 0.410278
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410148
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410018
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409768
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409638
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409258
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408878
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00722
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408228
G1 X77.697 Y75.619 E.00538
; LINE_WIDTH: 0.413428
G1 X78.012 Y75.472 E.00448
G1 X78.414 Y75.405 E.00527
; LINE_WIDTH: 0.410268
G1 X80.414 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.414 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.414 Y75.405 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.404 E.0178
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.626 J-1942.641 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.585 Y75.404 I.349 J-44.07 E.01553
; LINE_WIDTH: 0.407418
G1 X101.947 Y75.457 E.00466
; LINE_WIDTH: 0.414828
G1 X102.072 Y75.514 E.00178
; WIPE_START
G1 F12000
M204 S6000
G1 X102.29 Y75.614 E-.09123
G1 X102.487 Y75.772 E-.09559
G1 X102.767 Y76.145 E-.17759
G1 X102.893 Y76.646 E-.19633
G1 X102.894 Y76.699 E-.02021
G1 X102.894 Y77.171 E-.17904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444008
G1 F2110
M204 S6000
G1 X98.402 Y75.825 E.03752
; LINE_WIDTH: 0.444118
G1 X92.402 Y75.825 E.0835
; LINE_WIDTH: 0.444228
G1 X86.402 Y75.825 E.08352
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z2.44 F42000
G1 X86.402 Y104.174 Z2.44
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2110
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443518
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443828
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443978
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444128
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444288
G1 X101.099 Y104.175 E.02784
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.162 Y98.354 Z2.44 F42000
G1 X79.391 Y80.937 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392848
G1 F2110
M204 S5000
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392348
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.397968
G1 X80.767 Y81.03 E.00346
; LINE_WIDTH: 0.397488
G1 X80.684 Y81.38 E.00445
; LINE_WIDTH: 0.389608
G1 X80.503 Y81.605 E.0035
; LINE_WIDTH: 0.389388
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.393 Y80.997 E.00288
; WIPE_START
G1 F12000
M204 S6000
G1 X79.53 Y80.633 E-.14765
G1 X79.751 Y80.449 E-.10946
G1 X80.016 Y80.374 E-.10444
G1 X80.289 Y80.403 E-.10447
G1 X80.528 Y80.541 E-.10493
G1 X80.696 Y80.76 E-.10492
G1 X80.752 Y80.974 E-.08413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2110
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394328
G1 F2110
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z2.44 F42000
G1 X84.654 Y92.246 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2110
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
G1 F2110
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.44 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 24/99
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2110
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.403698
G1 X101.94 Y75.869 E.00329
; LINE_WIDTH: 0.407888
G1 X102.265 Y76.093 E.00503
G1 X102.457 Y76.428 E.00491
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00351
; LINE_WIDTH: 0.407788
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407898
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408008
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408128
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408238
G1 X102.503 Y86.7 E.02549
; LINE_WIDTH: 0.408348
G1 X102.502 Y88.7 E.0255
; LINE_WIDTH: 0.408468
G1 X102.502 Y90.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408688
G1 X102.502 Y94.7 E.02552
; LINE_WIDTH: 0.408808
G1 X102.501 Y96.7 E.02553
; LINE_WIDTH: 0.408918
G1 X102.501 Y98.7 E.02554
; LINE_WIDTH: 0.409028
G1 X102.501 Y100.7 E.02555
; LINE_WIDTH: 0.409148
G1 X102.5 Y103.349 E.03385
G1 X102.364 Y103.781 E.00579
; LINE_WIDTH: 0.407018
G1 X102.056 Y104.076 E.00541
G1 X101.706 Y104.199 E.00472
; LINE_WIDTH: 0.417358
G1 X101.638 Y104.198 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.408218
G1 X78.102 Y104.15 E.00342
G1 X77.798 Y103.967 E.00453
; LINE_WIDTH: 0.406148
G1 X77.57 Y103.646 E.00499
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00474
G1 X77.496 Y99.281 E.05103
; LINE_WIDTH: 0.408448
G1 X77.496 Y95.281 E.05101
; LINE_WIDTH: 0.408308
G1 X77.496 Y91.281 E.051
; LINE_WIDTH: 0.408178
G1 X77.496 Y87.281 E.05098
; LINE_WIDTH: 0.408038
G1 X77.496 Y83.281 E.05096
; LINE_WIDTH: 0.407908
G1 X77.496 Y79.281 E.05094
; LINE_WIDTH: 0.407768
G1 X77.496 Y76.7 E.03287
; LINE_WIDTH: 0.408248
G1 X77.549 Y76.402 E.00386
G1 X77.73 Y76.101 E.00447
; LINE_WIDTH: 0.407488
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.416 Y75.798 E.00534
G1 X80.416 Y75.798 E.02563
; LINE_WIDTH: 0.409788
G1 X82.416 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.416 Y75.796 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.796 E.01778
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.131 Y75.541 F42000
; LINE_WIDTH: 0.414828
G1 F2110
M204 S5000
G1 X102.29 Y75.615 E.00228
G1 X102.535 Y75.817 E.00412
; LINE_WIDTH: 0.410508
G1 X102.774 Y76.159 E.00534
G1 X102.893 Y76.646 E.00644
; LINE_WIDTH: 0.409498
G1 X102.894 Y76.7 E.00068
; LINE_WIDTH: 0.407788
G1 X102.894 Y78.7 E.02546
; LINE_WIDTH: 0.407898
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408008
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408128
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408238
G1 X102.894 Y86.7 E.02549
; LINE_WIDTH: 0.408348
G1 X102.894 Y88.7 E.0255
; LINE_WIDTH: 0.408468
G1 X102.893 Y90.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.893 Y92.7 E.02552
; LINE_WIDTH: 0.408688
G1 X102.893 Y94.7 E.02552
; LINE_WIDTH: 0.408808
G1 X102.893 Y96.7 E.02553
; LINE_WIDTH: 0.408918
G1 X102.893 Y98.7 E.02554
; LINE_WIDTH: 0.409028
G1 X102.893 Y100.7 E.02555
; LINE_WIDTH: 0.409148
G1 X102.892 Y103.349 E.03385
; LINE_WIDTH: 0.415008
G1 X102.82 Y103.711 E.00478
G1 X102.66 Y104.037 E.00471
; LINE_WIDTH: 0.407728
G1 X102.297 Y104.382 E.00638
; LINE_WIDTH: 0.404438
G1 X101.885 Y104.553 E.00563
; LINE_WIDTH: 0.417358
G1 X101.6 Y104.591 E.00375
; LINE_WIDTH: 0.419998
G2 X97.099 Y104.59 I-2.62 J1483.778 E.0591
G1 X87.099 Y104.589 E.1313
G2 X85.809 Y104.595 I-.353 J63.64 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.091 Y104.546 E.00355
; LINE_WIDTH: 0.411188
G1 X77.708 Y104.388 E.00532
; LINE_WIDTH: 0.415278
M73 P31 R11
G1 X77.421 Y104.135 E.00497
G1 X77.206 Y103.782 E.00536
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.291 E.00641
G1 X77.105 Y99.291 E.05103
; LINE_WIDTH: 0.408448
G1 X77.105 Y95.291 E.05101
; LINE_WIDTH: 0.408308
G1 X77.105 Y91.291 E.051
; LINE_WIDTH: 0.408178
G1 X77.105 Y87.291 E.05098
; LINE_WIDTH: 0.408038
G1 X77.105 Y83.291 E.05096
; LINE_WIDTH: 0.407908
G1 X77.106 Y79.291 E.05094
; LINE_WIDTH: 0.407768
G1 X77.106 Y76.7 E.03298
; LINE_WIDTH: 0.408228
G1 X77.182 Y76.262 E.00567
G1 X77.426 Y75.864 E.00594
; LINE_WIDTH: 0.403938
G1 X77.756 Y75.585 E.00545
; LINE_WIDTH: 0.408138
G1 X78.159 Y75.434 E.00549
; LINE_WIDTH: 0.410268
G1 X78.408 Y75.405 E.00321
G1 X80.408 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.408 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.408 Y75.405 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.404 E.01788
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.626 J-1942.65 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.585 Y75.404 I.349 J-44.098 E.01554
; LINE_WIDTH: 0.407418
G1 X101.947 Y75.457 E.00465
; LINE_WIDTH: 0.414828
G1 X102.076 Y75.516 E.00184
; WIPE_START
G1 F12000
M204 S6000
G1 X102.29 Y75.615 E-.08961
G1 X102.535 Y75.817 E-.12082
G1 X102.774 Y76.159 E-.15823
G1 X102.893 Y76.646 E-.1908
G1 X102.894 Y76.7 E-.0203
G1 X102.894 Y77.174 E-.18025
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443988
G1 F2110
M204 S6000
G1 X98.402 Y75.825 E.03752
; LINE_WIDTH: 0.444098
G1 X92.402 Y75.825 E.08349
; LINE_WIDTH: 0.444208
G1 X86.402 Y75.825 E.08352
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z2.52 F42000
G1 X86.402 Y104.174 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2110
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.16 Y98.356 Z2.52 F42000
G1 X79.39 Y80.952 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.388208
G1 F2110
M204 S5000
G1 X79.479 Y80.707 E.00316
; LINE_WIDTH: 0.404488
G1 X79.723 Y80.464 E.00435
G1 X79.981 Y80.376 E.00344
; LINE_WIDTH: 0.402448
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398188
G1 X80.528 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398268
G1 X80.587 Y81.53 E.00333
; LINE_WIDTH: 0.396648
G1 X80.275 Y81.726 E.00457
; LINE_WIDTH: 0.395668
G1 X79.986 Y81.753 E.00357
; LINE_WIDTH: 0.390828
G1 X79.726 Y81.665 E.00334
; LINE_WIDTH: 0.388208
G1 X79.52 Y81.484 E.00331
G1 X79.4 Y81.238 E.00332
G1 X79.388 Y81.011 E.00274
; WIPE_START
G1 F12000
M204 S6000
G1 X79.479 Y80.707 E-.12075
G1 X79.723 Y80.464 E-.13086
G1 X79.981 Y80.376 E-.10353
G1 X80.289 Y80.404 E-.1175
G1 X80.528 Y80.541 E-.10465
G1 X80.696 Y80.76 E-.10494
G1 X80.747 Y80.958 E-.07778
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2110
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2110
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z2.52 F42000
G1 X84.654 Y92.246 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2110
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
G1 F2110
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.52 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 25/99
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2090
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.407508
G1 X101.853 Y75.836 E.00215
G1 X102.164 Y76 E.00447
; LINE_WIDTH: 0.405158
G1 X102.391 Y76.274 E.0045
; LINE_WIDTH: 0.409398
G1 X102.501 Y76.646 E.00496
G1 X102.501 Y78.646 E.02557
; LINE_WIDTH: 0.409268
G1 X102.502 Y80.646 E.02556
; LINE_WIDTH: 0.409138
G1 X102.502 Y82.646 E.02555
; LINE_WIDTH: 0.409008
G1 X102.502 Y84.646 E.02554
; LINE_WIDTH: 0.408878
G1 X102.502 Y86.646 E.02554
; LINE_WIDTH: 0.408748
G1 X102.502 Y88.646 E.02553
; LINE_WIDTH: 0.408628
G1 X102.503 Y90.646 E.02552
; LINE_WIDTH: 0.408498
G1 X102.503 Y92.646 E.02551
; LINE_WIDTH: 0.408368
G1 X102.503 Y94.646 E.0255
; LINE_WIDTH: 0.408238
G1 X102.503 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.503 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.504 Y100.646 E.02548
; LINE_WIDTH: 0.407858
G1 X102.504 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.504 Y103.301 E.00833
; LINE_WIDTH: 0.413608
G3 X102.348 Y103.801 I-1.141 J-.082 E.00683
; LINE_WIDTH: 0.407298
G1 X102.056 Y104.076 E.0051
G1 X101.706 Y104.199 E.00472
; LINE_WIDTH: 0.417428
G1 X101.638 Y104.198 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
G1 X78.14 Y104.161 E.00367
; LINE_WIDTH: 0.411568
G1 X77.779 Y103.949 E.00538
G1 X77.571 Y103.645 E.00474
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.276 E.00481
G1 X77.496 Y99.276 E.05103
; LINE_WIDTH: 0.408448
G1 X77.496 Y95.276 E.05101
; LINE_WIDTH: 0.408308
G1 X77.496 Y91.276 E.051
; LINE_WIDTH: 0.408178
G1 X77.496 Y87.276 E.05098
; LINE_WIDTH: 0.408038
G1 X77.496 Y83.276 E.05096
; LINE_WIDTH: 0.407908
G1 X77.496 Y79.276 E.05094
; LINE_WIDTH: 0.407768
G1 X77.496 Y76.7 E.03279
; LINE_WIDTH: 0.408228
G1 X77.55 Y76.402 E.00386
G1 X77.73 Y76.102 E.00447
; LINE_WIDTH: 0.407498
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.416 Y75.798 E.00534
G1 X80.416 Y75.798 E.02563
; LINE_WIDTH: 0.409788
G1 X82.416 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.416 Y75.796 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.796 E.01778
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.099 Y75.532 F42000
; LINE_WIDTH: 0.407158
G1 F2090
M204 S5000
G1 X102.27 Y75.601 E.00235
; LINE_WIDTH: 0.412518
G1 X102.577 Y75.861 E.00518
; LINE_WIDTH: 0.414128
G1 X102.794 Y76.208 E.0053
G1 X102.894 Y76.646 E.00581
; LINE_WIDTH: 0.409398
G1 X102.894 Y78.646 E.02557
; LINE_WIDTH: 0.409268
G1 X102.894 Y80.646 E.02556
; LINE_WIDTH: 0.409138
G1 X102.894 Y82.646 E.02555
; LINE_WIDTH: 0.409008
G1 X102.894 Y84.646 E.02554
; LINE_WIDTH: 0.408878
G1 X102.894 Y86.646 E.02554
; LINE_WIDTH: 0.408748
G1 X102.894 Y88.646 E.02553
; LINE_WIDTH: 0.408628
G1 X102.894 Y90.646 E.02552
; LINE_WIDTH: 0.408498
G1 X102.894 Y92.646 E.02551
; LINE_WIDTH: 0.408368
G1 X102.894 Y94.646 E.0255
; LINE_WIDTH: 0.408238
G1 X102.894 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.894 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.894 Y100.646 E.02548
; LINE_WIDTH: 0.407858
G1 X102.894 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.894 Y103.3 E.00833
; LINE_WIDTH: 0.413608
G1 X102.82 Y103.711 E.00539
G1 X102.659 Y104.037 E.0047
; LINE_WIDTH: 0.407618
G1 X102.295 Y104.385 E.00641
; LINE_WIDTH: 0.404448
G1 X101.885 Y104.553 E.00559
; LINE_WIDTH: 0.417428
G1 X101.599 Y104.591 E.00376
; LINE_WIDTH: 0.419998
G2 X97.099 Y104.59 I-2.5 J1542.74 E.05909
G1 X87.099 Y104.59 E.1313
G2 X85.809 Y104.596 I-.348 J67.177 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X77.982 Y104.516 E.00575
; LINE_WIDTH: 0.406138
G1 X77.605 Y104.309 E.00545
; LINE_WIDTH: 0.411618
G1 X77.309 Y103.988 E.00561
; LINE_WIDTH: 0.415268
G1 X77.158 Y103.636 E.00497
G1 X77.104 Y103.288 E.00458
; LINE_WIDTH: 0.408588
G1 X77.105 Y99.288 E.05103
; LINE_WIDTH: 0.408448
G1 X77.105 Y95.288 E.05101
; LINE_WIDTH: 0.408308
G1 X77.105 Y91.288 E.051
; LINE_WIDTH: 0.408178
G1 X77.105 Y87.288 E.05098
; LINE_WIDTH: 0.408038
G1 X77.105 Y83.288 E.05096
; LINE_WIDTH: 0.407908
G1 X77.106 Y79.288 E.05094
; LINE_WIDTH: 0.407768
G1 X77.106 Y76.7 E.03295
; LINE_WIDTH: 0.408208
M73 P32 R11
G1 X77.194 Y76.238 E.00599
G1 X77.429 Y75.862 E.00565
; LINE_WIDTH: 0.404228
G1 X77.758 Y75.583 E.00544
; LINE_WIDTH: 0.408168
G1 X78.159 Y75.434 E.00546
; LINE_WIDTH: 0.410268
G1 X78.408 Y75.405 E.00321
G1 X80.408 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.408 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.408 Y75.405 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.404 E.01788
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.629 J-1940.73 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.586 Y75.404 I.349 J-44.053 E.01555
; LINE_WIDTH: 0.406918
G1 X101.883 Y75.445 E.0038
; LINE_WIDTH: 0.407158
G1 X102.043 Y75.509 E.0022
M204 S10000
G1 X101.099 Y75.825 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.443988
G1 F2090
M204 S6000
G1 X98.402 Y75.825 E.03752
; LINE_WIDTH: 0.444098
G1 X92.402 Y75.825 E.08349
; LINE_WIDTH: 0.444208
G1 X86.402 Y75.825 E.08352
; WIPE_START
M73 P32 R10
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z2.6 F42000
G1 X101.099 Y104.175 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2090
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.648 Y97.057 Z2.6 F42000
G1 X79.398 Y80.901 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.404468
G1 F2090
M204 S5000
G1 X79.398 Y80.894 E.00009
G1 X79.516 Y80.645 E.00347
; LINE_WIDTH: 0.402708
G1 X79.723 Y80.463 E.00346
G1 X79.981 Y80.376 E.00343
; LINE_WIDTH: 0.402448
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398228
G1 X80.529 Y80.541 E.00343
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.392748
G1 X80.505 Y81.606 E.00352
G1 X80.26 Y81.731 E.00336
; LINE_WIDTH: 0.390868
G1 X79.986 Y81.751 E.00335
; LINE_WIDTH: 0.388208
G1 X79.726 Y81.665 E.00332
G1 X79.52 Y81.484 E.00331
G1 X79.401 Y81.238 E.00331
; LINE_WIDTH: 0.404468
G1 X79.398 Y80.961 E.0035
; WIPE_START
G1 F12000
M204 S6000
G1 X79.398 Y80.894 E-.0254
G1 X79.516 Y80.645 E-.10456
G1 X79.723 Y80.463 E-.10459
G1 X79.981 Y80.376 E-.10363
G1 X80.289 Y80.404 E-.11742
G1 X80.529 Y80.541 E-.10481
G1 X80.696 Y80.76 E-.10485
G1 X80.759 Y81.001 E-.09474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2090
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394328
G1 F2090
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z2.6 F42000
G1 X84.654 Y92.246 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2090
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F2090
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 26/99
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
G1 X102.115 Y75.536 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.403388
G1 F2112
M204 S5000
G1 X102.207 Y75.569 E.00123
; LINE_WIDTH: 0.404808
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.409928
G1 X102.775 Y76.16 E.00568
G1 X102.893 Y76.646 E.00641
; LINE_WIDTH: 0.409508
G1 X102.894 Y76.7 E.00068
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.415658
G1 X102.819 Y103.711 E.00498
G1 X102.66 Y104.037 E.00472
; LINE_WIDTH: 0.407428
G1 X102.296 Y104.383 E.00638
; LINE_WIDTH: 0.404438
G1 X101.885 Y104.553 E.00562
; LINE_WIDTH: 0.417378
G1 X101.6 Y104.591 E.00375
; LINE_WIDTH: 0.419998
G2 X97.099 Y104.59 I-2.621 J1502.83 E.0591
G1 X87.099 Y104.589 E.1313
G2 X85.809 Y104.595 I-.353 J63.64 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.415288
G1 X77.963 Y104.514 E.00532
G1 X77.616 Y104.319 E.00516
; LINE_WIDTH: 0.404328
G1 X77.3 Y103.968 E.00597
; LINE_WIDTH: 0.410438
G1 X77.135 Y103.555 E.00571
G1 X77.105 Y103.29 E.00341
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410088
G1 X77.105 Y99.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y97.29 E.0256
; LINE_WIDTH: 0.409698
G1 X77.105 Y95.29 E.02559
; LINE_WIDTH: 0.409508
G1 X77.105 Y93.29 E.02558
; LINE_WIDTH: 0.409308
G1 X77.105 Y91.29 E.02556
; LINE_WIDTH: 0.409118
G1 X77.105 Y89.29 E.02555
; LINE_WIDTH: 0.408918
G1 X77.105 Y87.29 E.02554
; LINE_WIDTH: 0.408728
G1 X77.105 Y85.29 E.02553
; LINE_WIDTH: 0.408528
G1 X77.106 Y83.29 E.02551
; LINE_WIDTH: 0.408338
G1 X77.106 Y81.29 E.0255
; LINE_WIDTH: 0.408138
G1 X77.106 Y79.29 E.02549
; LINE_WIDTH: 0.407948
G1 X77.106 Y77.29 E.02547
; LINE_WIDTH: 0.407748
G1 X77.106 Y76.7 E.00751
; LINE_WIDTH: 0.408218
G1 X77.177 Y76.288 E.00533
G1 X77.382 Y75.914 E.00543
; LINE_WIDTH: 0.405378
G1 X77.716 Y75.611 E.00571
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00576
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410258
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.404 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.632 J-1942.182 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.587 Y75.404 I.349 J-44.217 E.01556
; LINE_WIDTH: 0.406908
G1 X101.833 Y75.437 E.00315
; LINE_WIDTH: 0.403388
G1 X102.059 Y75.516 E.00302
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2112
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.405108
G1 X102.02 Y75.905 E.00441
; LINE_WIDTH: 0.405538
G1 X102.316 Y76.154 E.00489
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00351
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.699 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.699 E.02552
; LINE_WIDTH: 0.408838
G1 X102.502 Y94.699 E.02553
; LINE_WIDTH: 0.408968
G1 X102.502 Y96.699 E.02554
; LINE_WIDTH: 0.409098
G1 X102.502 Y98.699 E.02555
; LINE_WIDTH: 0.409228
G1 X102.502 Y100.699 E.02556
; LINE_WIDTH: 0.409348
G1 X102.501 Y103.335 E.03368
G1 X102.377 Y103.758 E.00564
; LINE_WIDTH: 0.404278
G1 X102.09 Y104.057 E.00523
; LINE_WIDTH: 0.405738
G1 X101.706 Y104.199 E.00519
; LINE_WIDTH: 0.417378
G1 X101.638 Y104.198 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406578
G1 X77.865 Y104.022 E.00109
; LINE_WIDTH: 0.410788
G1 X77.598 Y103.708 E.00529
G1 X77.5 Y103.37 E.00452
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.281 I44.651 J-1.092 E.02677
; LINE_WIDTH: 0.410088
G1 X77.498 Y99.281 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y97.281 E.0256
; LINE_WIDTH: 0.409698
G1 X77.498 Y95.281 E.02559
; LINE_WIDTH: 0.409508
G1 X77.497 Y93.281 E.02558
; LINE_WIDTH: 0.409308
G1 X77.497 Y91.281 E.02556
; LINE_WIDTH: 0.409118
G1 X77.497 Y89.281 E.02555
; LINE_WIDTH: 0.408918
G1 X77.497 Y87.281 E.02554
; LINE_WIDTH: 0.408728
G1 X77.497 Y85.281 E.02553
; LINE_WIDTH: 0.408528
G1 X77.497 Y83.281 E.02551
; LINE_WIDTH: 0.408338
G1 X77.497 Y81.281 E.0255
; LINE_WIDTH: 0.408138
G1 X77.496 Y79.281 E.02549
; LINE_WIDTH: 0.407948
G1 X77.496 Y77.281 E.02547
; LINE_WIDTH: 0.407748
G1 X77.496 Y76.7 E.0074
; LINE_WIDTH: 0.408228
G1 X77.55 Y76.402 E.00386
G1 X77.73 Y76.101 E.00447
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410258
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11712
M73 P33 R10
G1 X101.687 Y75.802 E-.08894
G1 X102.02 Y75.905 E-.13251
G1 X102.316 Y76.154 E-.14664
G1 X102.457 Y76.428 E-.11714
G1 X102.504 Y76.7 E-.10482
G1 X102.504 Y76.839 E-.05283
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.63 Y83.415 Z2.68 F42000
G1 X86.402 Y104.174 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2112
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.636 Y96.561 Z2.68 F42000
G1 X101.099 Y75.825 Z2.68
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.443978
G1 F2112
M204 S6000
G1 X98.402 Y75.825 E.03752
; LINE_WIDTH: 0.444088
G1 X92.402 Y75.825 E.08349
; LINE_WIDTH: 0.444208
G1 X86.402 Y75.825 E.08352
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.766 Y79.595 Z2.68 F42000
G1 X79.396 Y80.941 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384988
G1 F2112
M204 S5000
G1 X79.48 Y80.707 E.00298
G1 X79.687 Y80.489 E.0036
; LINE_WIDTH: 0.392848
G1 X80.002 Y80.377 E.00409
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00359
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00342
; LINE_WIDTH: 0.413108
G1 X80.759 Y81.031 E.00359
G1 X80.758 Y81.118 E.00112
; LINE_WIDTH: 0.389268
G1 X80.677 Y81.393 E.00348
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.389 Y81 E.00285
; WIPE_START
G1 F12000
M204 S6000
G1 X79.48 Y80.707 E-.11638
G1 X79.687 Y80.489 E-.11418
G1 X80.002 Y80.377 E-.12696
G1 X80.289 Y80.403 E-.1096
G1 X80.529 Y80.541 E-.1049
G1 X80.696 Y80.76 E-.10472
G1 X80.745 Y80.973 E-.08327
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2112
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F2112
M204 S6000
G1 X82.851 Y80.368 E.001
G1 X82.922 Y80.409 E.001
G1 X82.945 Y80.368 E.00058
; WIPE_START
G1 F18000
G1 X82.922 Y80.409 E-.17024
G1 X82.851 Y80.368 E-.29488
G1 X82.922 Y80.327 E-.29488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.02 Y87.88 Z2.68 F42000
G1 X84.654 Y92.246 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2112
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F2112
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.68 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.36
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 27/99
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
G1 X102.134 Y75.543 F42000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.403398
G1 F2114
M204 S5000
G1 X102.207 Y75.569 E.00097
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00486
; LINE_WIDTH: 0.409898
G1 X102.775 Y76.16 E.00569
G1 X102.893 Y76.646 E.0064
; LINE_WIDTH: 0.409538
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.894 Y103.335 E.03368
G1 X102.862 Y103.529 E.00252
; LINE_WIDTH: 0.403948
G1 X102.726 Y103.926 E.00529
; LINE_WIDTH: 0.414778
G1 X102.486 Y104.234 E.00506
G1 X102.25 Y104.408 E.0038
; LINE_WIDTH: 0.404438
G1 X101.885 Y104.553 E.00496
; LINE_WIDTH: 0.417368
G1 X101.6 Y104.591 E.00375
; LINE_WIDTH: 0.419998
G2 X97.099 Y104.59 I-2.618 J1464.438 E.0591
G1 X87.099 Y104.589 E.1313
G2 X85.809 Y104.595 I-.353 J63.641 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.413048
G1 X77.963 Y104.515 E.00529
G1 X77.596 Y104.304 E.00547
; LINE_WIDTH: 0.406668
G1 X77.31 Y103.978 E.0055
; LINE_WIDTH: 0.410408
G1 X77.135 Y103.554 E.00588
G1 X77.105 Y103.291 E.0034
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.291 E.02563
; LINE_WIDTH: 0.410038
G1 X77.105 Y99.291 E.02561
; LINE_WIDTH: 0.409798
G1 X77.105 Y97.291 E.0256
; LINE_WIDTH: 0.409548
G1 X77.106 Y95.291 E.02558
; LINE_WIDTH: 0.409308
G1 X77.106 Y93.291 E.02556
; LINE_WIDTH: 0.409068
G1 X77.106 Y91.291 E.02555
; LINE_WIDTH: 0.408818
G1 X77.106 Y89.291 E.02553
; LINE_WIDTH: 0.408578
G1 X77.106 Y87.291 E.02552
; LINE_WIDTH: 0.408338
G1 X77.106 Y85.291 E.0255
; LINE_WIDTH: 0.408088
G1 X77.106 Y83.291 E.02548
; LINE_WIDTH: 0.407848
G1 X77.106 Y81.291 E.02547
; LINE_WIDTH: 0.407598
G1 X77.106 Y79.291 E.02545
; LINE_WIDTH: 0.407358
G1 X77.107 Y77.291 E.02544
; LINE_WIDTH: 0.407118
G1 X77.107 Y76.7 E.00751
; LINE_WIDTH: 0.408238
G1 X77.182 Y76.262 E.00566
G1 X77.426 Y75.864 E.00595
; LINE_WIDTH: 0.403908
G1 X77.756 Y75.585 E.00545
; LINE_WIDTH: 0.407298
G1 X78.161 Y75.435 E.00549
; LINE_WIDTH: 0.410268
G1 X78.407 Y75.405 E.00319
G1 X80.407 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.407 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.407 Y75.405 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.404 E.01789
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.632 J-1942.182 E.11284
G1 X100.402 Y75.41 E.07878
G3 X101.832 Y75.437 I.348 J20.031 E.01878
; LINE_WIDTH: 0.403398
G1 X102.078 Y75.523 E.00328
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2114
M204 S5000
G1 X101.498 Y75.94 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.405128
G1 X102.021 Y75.906 E.00441
; LINE_WIDTH: 0.405518
G1 X102.316 Y76.154 E.00488
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00556
; LINE_WIDTH: 0.403948
G1 X102.093 Y104.053 E.00525
; LINE_WIDTH: 0.405748
G1 X101.706 Y104.199 E.00524
; LINE_WIDTH: 0.417368
G1 X101.638 Y104.198 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09483
; LINE_WIDTH: 0.413048
G3 X77.865 Y104.023 I.111 J-1.092 E.00693
; LINE_WIDTH: 0.410738
G1 X77.597 Y103.704 E.00534
G1 X77.5 Y103.37 E.00446
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.281 I44.822 J-1.091 E.02676
; LINE_WIDTH: 0.410038
G1 X77.498 Y99.281 E.02561
; LINE_WIDTH: 0.409798
G1 X77.498 Y97.281 E.0256
; LINE_WIDTH: 0.409548
G1 X77.498 Y95.281 E.02558
; LINE_WIDTH: 0.409308
G1 X77.498 Y93.281 E.02556
; LINE_WIDTH: 0.409068
G1 X77.497 Y91.281 E.02555
; LINE_WIDTH: 0.408818
G1 X77.497 Y89.281 E.02553
; LINE_WIDTH: 0.408578
G1 X77.497 Y87.281 E.02552
; LINE_WIDTH: 0.408328
G1 X77.497 Y85.281 E.0255
; LINE_WIDTH: 0.408088
G1 X77.497 Y83.281 E.02548
; LINE_WIDTH: 0.407848
G1 X77.497 Y81.281 E.02547
; LINE_WIDTH: 0.407598
G1 X77.497 Y79.281 E.02545
; LINE_WIDTH: 0.407358
G1 X77.497 Y77.281 E.02544
; LINE_WIDTH: 0.407118
G1 X77.496 Y76.7 E.00739
; LINE_WIDTH: 0.408248
G1 X77.549 Y76.402 E.00385
G1 X77.73 Y76.101 E.00447
; LINE_WIDTH: 0.407318
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.415 Y75.798 E.00532
G1 X80.415 Y75.798 E.02563
; LINE_WIDTH: 0.409788
G1 X82.415 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.415 Y75.796 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.796 E.01779
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.94 E-.11701
G1 X101.687 Y75.802 E-.08894
G1 X102.021 Y75.906 E-.13258
G1 X102.316 Y76.154 E-.14654
G1 X102.457 Y76.428 E-.11712
G1 X102.504 Y76.7 E-.10495
G1 X102.504 Y76.839 E-.05286
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.63 Y83.415 Z2.76 F42000
G1 X86.402 Y104.174 Z2.76
G1 Z2.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2114
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443518
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443828
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443978
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444128
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444288
M73 P34 R10
G1 X101.099 Y104.175 E.02784
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.636 Y96.561 Z2.76 F42000
G1 X101.099 Y75.825 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.443958
G1 F2114
M204 S6000
G1 X98.402 Y75.825 E.03752
; LINE_WIDTH: 0.444068
G1 X92.402 Y75.825 E.08349
; LINE_WIDTH: 0.444188
G1 X86.402 Y75.825 E.08351
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.767 Y79.598 Z2.76 F42000
G1 X79.392 Y80.949 Z2.76
G1 Z2.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.404508
G1 F2114
M204 S5000
G1 X79.517 Y80.646 E.00414
G1 X79.772 Y80.439 E.00415
; LINE_WIDTH: 0.387628
G1 X80.136 Y80.382 E.00444
; LINE_WIDTH: 0.384928
G1 X80.413 Y80.467 E.00348
; LINE_WIDTH: 0.388608
G1 X80.653 Y80.696 E.00402
; LINE_WIDTH: 0.398428
G1 X80.766 Y81.03 E.00439
G1 X80.683 Y81.38 E.00447
; LINE_WIDTH: 0.389228
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.392688
G1 X80.26 Y81.732 E.00335
G1 X79.986 Y81.753 E.00336
; LINE_WIDTH: 0.390888
G1 X79.726 Y81.665 E.00334
; LINE_WIDTH: 0.388208
G1 X79.52 Y81.484 E.00331
G1 X79.401 Y81.238 E.00331
G1 X79.388 Y81.008 E.00279
; WIPE_START
G1 F12000
M204 S6000
G1 X79.517 Y80.646 E-.14588
G1 X79.772 Y80.439 E-.12503
G1 X80.136 Y80.382 E-.13969
G1 X80.413 Y80.467 E-.11024
G1 X80.653 Y80.696 E-.12602
G1 X80.748 Y80.978 E-.11315
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.357 Y80.202 Z2.76 F42000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2114
M204 S5000
G1 X83.063 Y79.827 E.01049
G1 X83.251 Y80.18 E.00525
G1 X83.438 Y80.533 E.00526
G1 X82.733 Y80.908 E.01049
G1 X82.386 Y80.255 E.00971
; WIPE_START
G1 F12000
M204 S6000
G1 X83.063 Y79.827 E-.30451
G1 X83.251 Y80.18 E-.15183
G1 X83.438 Y80.533 E-.15211
G1 X83.086 Y80.721 E-.15155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.115 Y88.283 Z2.76 F42000
G1 X84.654 Y92.246 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2114
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.76 F42000
G1 Z2.36
G1 E.8 F1800
G1 F2114
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.76 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 28/99
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2097
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.403178
G1 X101.936 Y75.866 E.00323
; LINE_WIDTH: 0.404148
G1 X102.23 Y76.059 E.00443
; LINE_WIDTH: 0.405698
G1 X102.43 Y76.354 E.00451
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00451
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.501 Y103.335 E.03368
G1 X102.377 Y103.756 E.00561
; LINE_WIDTH: 0.403038
G1 X102.089 Y104.057 E.00524
; LINE_WIDTH: 0.405678
G1 X101.706 Y104.199 E.00518
; LINE_WIDTH: 0.417298
G1 X101.638 Y104.198 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
G1 X78.14 Y104.161 E.00367
; LINE_WIDTH: 0.410658
G1 X77.779 Y103.949 E.00537
G1 X77.59 Y103.69 E.00412
; LINE_WIDTH: 0.410278
G1 X77.498 Y103.28 E.00538
G1 X77.498 Y101.28 E.02563
; LINE_WIDTH: 0.410148
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410018
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.28 E.0256
; LINE_WIDTH: 0.409768
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409638
G1 X77.497 Y91.28 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.28 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.28 E.02557
; LINE_WIDTH: 0.409258
G1 X77.497 Y85.28 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.28 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.28 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.00709
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413388
G1 X77.618 Y76.269 E.00194
G1 X77.754 Y76.076 E.00305
; LINE_WIDTH: 0.411218
G1 X78.01 Y75.891 E.00406
; LINE_WIDTH: 0.404848
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.423 Y75.798 E.02682
; LINE_WIDTH: 0.409788
G1 X82.423 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.423 Y75.796 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.796 E.01768
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.093 Y75.524 F42000
; LINE_WIDTH: 0.412518
G1 F2097
M204 S5000
G1 X102.291 Y75.614 E.0028
G1 X102.51 Y75.794 E.00365
; LINE_WIDTH: 0.406698
G1 X102.763 Y76.138 E.00542
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00671
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.414878
G1 X102.821 Y103.706 E.0049
G1 X102.637 Y104.072 E.00532
; LINE_WIDTH: 0.411568
G1 X102.296 Y104.383 E.00593
; LINE_WIDTH: 0.404368
G1 X101.885 Y104.553 E.00561
; LINE_WIDTH: 0.417298
G1 X101.6 Y104.591 E.00375
; LINE_WIDTH: 0.419998
G2 X97.099 Y104.59 I-2.501 J1427.279 E.0591
G1 X87.099 Y104.59 E.1313
G2 X85.809 Y104.596 I-.348 J67.175 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X77.982 Y104.516 E.00575
; LINE_WIDTH: 0.406078
G1 X77.605 Y104.309 E.00545
; LINE_WIDTH: 0.404598
G1 X77.32 Y103.995 E.00535
; LINE_WIDTH: 0.410838
G1 X77.139 Y103.57 E.00592
G1 X77.105 Y103.29 E.00362
; LINE_WIDTH: 0.410278
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410148
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410018
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409768
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409638
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409258
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408878
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00721
G1 X77.183 Y76.282 E.00574
; LINE_WIDTH: 0.403458
G1 X77.391 Y75.905 E.00543
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.619 E.00534
; LINE_WIDTH: 0.412188
G1 X78.081 Y75.452 E.00538
G1 X78.412 Y75.405 E.0043
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.404 E.01783
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.632 J-1935.436 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.588 Y75.404 I.349 J-44.202 E.01558
; LINE_WIDTH: 0.407438
G1 X101.947 Y75.457 E.00461
; LINE_WIDTH: 0.412518
G1 X102.039 Y75.499 E.0013
M204 S10000
G1 X101.099 Y75.825 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.443918
G1 F2097
M204 S6000
G1 X98.402 Y75.825 E.03751
; LINE_WIDTH: 0.444048
G1 X92.402 Y75.825 E.08348
; LINE_WIDTH: 0.444188
G1 X86.402 Y75.825 E.08351
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z2.84 F42000
G1 X101.099 Y104.175 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2097
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
M73 P35 R10
G1 E-.04 F1800
M204 S10000
G1 X85.651 Y97.056 Z2.84 F42000
G1 X79.401 Y80.88 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.402828
G1 F2097
M204 S5000
G1 X79.516 Y80.646 E.00328
G1 X79.723 Y80.463 E.00347
; LINE_WIDTH: 0.402708
G1 X79.979 Y80.377 E.00339
; LINE_WIDTH: 0.402248
G1 X80.288 Y80.409 E.0039
; LINE_WIDTH: 0.392368
G1 X80.527 Y80.543 E.00335
G1 X80.694 Y80.762 E.00336
; LINE_WIDTH: 0.397168
G1 X80.769 Y81.07 E.00392
G1 X80.724 Y81.3 E.00291
; LINE_WIDTH: 0.394828
G1 X80.552 Y81.561 E.00384
; LINE_WIDTH: 0.387928
G1 X80.273 Y81.723 E.0039
G1 X79.986 Y81.75 E.00348
; LINE_WIDTH: 0.385728
G1 X79.727 Y81.664 E.00329
; LINE_WIDTH: 0.398068
G1 X79.469 Y81.412 E.00447
; LINE_WIDTH: 0.398228
G1 X79.377 Y81.137 E.00359
; LINE_WIDTH: 0.402268
G1 X79.394 Y80.939 E.00249
; WIPE_START
G1 F12000
M204 S6000
G1 X79.516 Y80.646 E-.12083
G1 X79.723 Y80.463 E-.10484
G1 X79.979 Y80.377 E-.10265
G1 X80.288 Y80.409 E-.11819
G1 X80.527 Y80.543 E-.10414
G1 X80.694 Y80.762 E-.10449
G1 X80.759 Y81.03 E-.10486
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.305 Y80.185 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2097
M204 S5000
G1 X83.078 Y79.774 E.01149
G1 X83.2 Y80.004 E.00342
G1 X83.284 Y80.161 E.00233
G1 X83.368 Y80.32 E.00236
G1 X83.491 Y80.55 E.00343
G1 X82.718 Y80.961 E.01149
G1 X82.333 Y80.238 E.01076
; WIPE_START
G1 F5700
M204 S6000
G1 X83.078 Y79.774 E-.33344
G1 X83.2 Y80.004 E-.09889
G1 X83.284 Y80.161 E-.06745
G1 X83.368 Y80.32 E-.06841
G1 X83.491 Y80.55 E-.09937
G1 X83.276 Y80.665 E-.09244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.178 Y88.244 Z2.84 F42000
G1 X84.654 Y92.246 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2097
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F2097
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.84 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.52
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 29/99
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
G1 X102.095 Y75.529 F42000
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.403398
G1 F2120
M204 S5000
G1 X102.207 Y75.569 E.00149
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.410658
G1 X102.768 Y76.145 E.00548
G1 X102.893 Y76.646 E.00663
; LINE_WIDTH: 0.409538
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.415188
G1 X102.82 Y103.711 E.00497
G1 X102.637 Y104.065 E.00517
; LINE_WIDTH: 0.408408
G1 X102.305 Y104.373 E.00577
; LINE_WIDTH: 0.408278
G1 X101.891 Y104.557 E.00578
; LINE_WIDTH: 0.409898
G1 X101.6 Y104.594 E.00375
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1997.75 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.281 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X78.235 Y104.577 E.00244
; LINE_WIDTH: 0.407368
G1 X77.791 Y104.433 E.00593
; LINE_WIDTH: 0.415378
G1 X77.467 Y104.185 E.0053
G1 X77.309 Y103.977 E.00338
; LINE_WIDTH: 0.410288
G1 X77.134 Y103.552 E.00589
G1 X77.105 Y103.291 E.00337
G1 X77.105 Y101.291 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.291 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.291 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.291 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.291 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.291 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.291 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.291 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.291 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.291 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.291 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.291 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.291 E.02553
; LINE_WIDTH: 0.408628
G3 X77.143 Y76.412 I3.591 J-.282 E.01125
; LINE_WIDTH: 0.412668
G1 X77.281 Y76.063 E.00483
G1 X77.457 Y75.829 E.00378
; LINE_WIDTH: 0.404218
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410258
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.404 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.632 J-1938.803 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.589 Y75.404 I.349 J-44.693 E.01559
; LINE_WIDTH: 0.406978
G1 X101.833 Y75.437 E.00312
; LINE_WIDTH: 0.403398
G1 X102.039 Y75.509 E.00275
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2120
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00307
; LINE_WIDTH: 0.405118
G1 X102.02 Y75.906 E.00441
; LINE_WIDTH: 0.405908
G1 X102.316 Y76.154 E.00489
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00556
; LINE_WIDTH: 0.403948
G1 X102.092 Y104.054 E.00526
G1 X101.71 Y104.198 E.00514
; LINE_WIDTH: 0.409898
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
; LINE_WIDTH: 0.410958
G1 X78.21 Y104.179 E.00278
G1 X77.865 Y104.022 E.00486
; LINE_WIDTH: 0.403858
G1 X77.648 Y103.79 E.00401
; LINE_WIDTH: 0.405358
G1 X77.502 Y103.388 E.00542
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.281 E.02699
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.281 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.281 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.281 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.281 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.281 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.281 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.281 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.281 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.281 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.281 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.281 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.281 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.726 E.00709
G1 X77.551 Y76.403 E.00418
; LINE_WIDTH: 0.404218
G1 X77.729 Y76.101 E.00442
; LINE_WIDTH: 0.408228
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410258
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11707
G1 X101.687 Y75.802 E-.08898
G1 X102.02 Y75.906 E-.13251
G1 X102.316 Y76.154 E-.14665
G1 X102.457 Y76.428 E-.11704
G1 X102.504 Y76.7 E-.10499
G1 X102.504 Y76.839 E-.05276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.461 Z2.92 F42000
G1 X101.099 Y104.175 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2120
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z2.92 F42000
G1 X101.099 Y75.825 Z2.92
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.443918
G1 F2120
M204 S6000
G1 X98.402 Y75.825 E.03752
; LINE_WIDTH: 0.444048
G1 X92.402 Y75.825 E.08348
; LINE_WIDTH: 0.444188
G1 X86.402 Y75.825 E.08351
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.759 Y79.584 Z2.92 F42000
G1 X79.399 Y80.919 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392888
G1 F2120
M204 S5000
G1 X79.53 Y80.633 E.00386
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392348
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398128
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.413068
G1 X80.759 Y81.031 E.00358
G1 X80.758 Y81.118 E.00112
; LINE_WIDTH: 0.389248
G1 X80.677 Y81.393 E.00348
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.728 E.00332
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.392 Y80.978 E.00311
; WIPE_START
G1 F12000
M204 S6000
G1 X79.53 Y80.633 E-.14094
G1 X79.751 Y80.449 E-.10946
G1 X80.016 Y80.374 E-.10438
G1 X80.289 Y80.403 E-.10452
G1 X80.528 Y80.541 E-.10483
G1 X80.696 Y80.76 E-.10493
G1 X80.75 Y80.993 E-.09094
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.253 Y80.168 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2120
M204 S5000
G1 X83.093 Y79.721 E.0125
G1 X83.225 Y79.969 E.00369
G1 X83.317 Y80.141 E.00256
G1 X83.41 Y80.317 E.00262
G1 X83.543 Y80.568 E.00372
G1 X82.703 Y81.014 E.0125
G1 X82.281 Y80.221 E.0118
; WIPE_START
G1 F5700
M204 S6000
G1 X83.093 Y79.721 E-.36239
M73 P36 R10
G1 X83.225 Y79.969 E-.10687
G1 X83.317 Y80.141 E-.07397
G1 X83.41 Y80.317 E-.0757
G1 X83.543 Y80.568 E-.10774
G1 X83.466 Y80.609 E-.03333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.241 Y88.202 Z2.92 F42000
G1 X84.654 Y92.246 Z2.92
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2120
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
G1 F2120
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.92 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 30/99
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
G1 X102.099 Y75.531 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.403398
G1 F2123
M204 S5000
G1 X102.207 Y75.569 E.00144
; LINE_WIDTH: 0.404238
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407738
G1 X102.783 Y76.184 E.00561
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407878
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.015 J.288 E.0095
; LINE_WIDTH: 0.407368
G1 X102.759 Y103.859 E.00554
; LINE_WIDTH: 0.415538
G1 X102.53 Y104.189 E.00521
G1 X102.274 Y104.396 E.00428
; LINE_WIDTH: 0.407338
G1 X101.895 Y104.554 E.00523
; LINE_WIDTH: 0.409838
G1 X101.6 Y104.594 E.00381
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1983.198 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.277 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
; LINE_WIDTH: 0.411368
G1 X78.087 Y104.554 E.00437
G1 X77.66 Y104.35 E.00608
; LINE_WIDTH: 0.406568
G1 X77.357 Y104.053 E.00539
; LINE_WIDTH: 0.413728
G1 X77.157 Y103.636 E.00597
G1 X77.105 Y103.288 E.00456
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.288 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.288 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.288 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.288 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.288 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.288 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.288 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.288 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.288 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.288 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.288 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.288 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00719
G1 X77.183 Y76.282 E.00573
; LINE_WIDTH: 0.403398
G1 X77.391 Y75.904 E.00542
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.619 E.00534
; LINE_WIDTH: 0.412798
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.636 J-1940.253 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.59 Y75.404 I.349 J-44.65 E.0156
; LINE_WIDTH: 0.406928
G1 X101.833 Y75.437 E.00311
; LINE_WIDTH: 0.403398
G1 X102.042 Y75.511 E.0028
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2123
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.687 Y75.802 E.00308
; LINE_WIDTH: 0.405118
G1 X102.02 Y75.906 E.00441
G1 X102.315 Y76.154 E.00488
; LINE_WIDTH: 0.404868
G1 X102.458 Y76.427 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407878
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.414068
G1 X102.471 Y103.501 E.00294
G1 X102.347 Y103.8 E.00418
; LINE_WIDTH: 0.409988
G1 X102.046 Y104.081 E.00527
G1 X101.71 Y104.198 E.00455
; LINE_WIDTH: 0.409838
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411368
G1 X78.207 Y104.178 E.00281
G1 X77.866 Y104.023 E.00481
; LINE_WIDTH: 0.406568
G1 X77.651 Y103.799 E.00394
G1 X77.503 Y103.393 E.00548
; LINE_WIDTH: 0.410298
G1 X77.498 Y101.276 E.02713
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.276 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.276 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.276 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.276 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.276 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.276 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.276 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.276 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.276 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.276 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.276 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.276 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00704
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411208
G1 X77.754 Y76.076 E.00494
G1 X78.01 Y75.89 E.00406
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.1171
G1 X101.687 Y75.802 E-.08901
G1 X102.02 Y75.906 E-.13249
G1 X102.315 Y76.154 E-.14656
G1 X102.458 Y76.427 E-.1172
G1 X102.504 Y76.7 E-.10503
G1 X102.504 Y76.838 E-.05262
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.461 Z3 F42000
G1 X101.099 Y104.175 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2123
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z3 F42000
G1 X101.099 Y75.825 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.443888
G1 F2123
M204 S6000
G1 X98.402 Y75.825 E.03751
; LINE_WIDTH: 0.444028
G1 X92.402 Y75.825 E.08348
; LINE_WIDTH: 0.444168
G1 X86.402 Y75.825 E.08351
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.764 Y79.592 Z3 F42000
G1 X79.399 Y80.935 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2123
M204 S5000
G1 X79.494 Y80.683 E.00322
; LINE_WIDTH: 0.392908
G1 X79.74 Y80.457 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398228
G1 X80.589 Y81.528 E.00331
; LINE_WIDTH: 0.396248
G1 X80.274 Y81.725 E.00458
; LINE_WIDTH: 0.392788
G1 X79.986 Y81.75 E.00354
; LINE_WIDTH: 0.384968
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.389 Y80.993 E.00294
; WIPE_START
G1 F12000
M204 S6000
G1 X79.494 Y80.683 E-.12412
G1 X79.74 Y80.457 E-.127
G1 X80.016 Y80.374 E-.10942
G1 X80.289 Y80.403 E-.10452
G1 X80.529 Y80.541 E-.10494
G1 X80.696 Y80.76 E-.10488
G1 X80.752 Y80.977 E-.08514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.2 Y80.151 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2123
M204 S5000
G1 X83.108 Y79.668 E.0135
G1 X83.252 Y79.938 E.00402
G1 X83.35 Y80.122 E.00273
G1 X83.449 Y80.31 E.00279
G1 X83.595 Y80.585 E.00409
G1 X82.688 Y81.067 E.0135
G1 X82.229 Y80.204 E.01284
; WIPE_START
G1 F5700
M204 S6000
G1 X83.108 Y79.668 E-.39135
G1 X83.252 Y79.938 E-.11622
G1 X83.35 Y80.122 E-.07912
G1 X83.449 Y80.31 E-.08083
G1 X83.564 Y80.525 E-.09248
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.271 Y88.124 Z3 F42000
G1 X84.654 Y92.246 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2123
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F2123
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P37 R10
G3 Z3 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.68
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 31/99
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
G1 X102.82 Y103.711 F42000
G1 Z2.68
G1 E.8 F1800
; LINE_WIDTH: 0.415198
G1 F2162
M204 S5000
G1 X102.66 Y104.037 E.00471
; LINE_WIDTH: 0.407718
G1 X102.295 Y104.384 E.00641
; LINE_WIDTH: 0.404248
G1 X101.885 Y104.553 E.0056
; LINE_WIDTH: 0.417168
G1 X101.6 Y104.591 E.00375
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J1894.053 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.171 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.234 Y104.577 E.00244
; LINE_WIDTH: 0.411568
G1 X77.818 Y104.451 E.00559
G1 X77.609 Y104.31 E.00324
; LINE_WIDTH: 0.403998
G1 X77.323 Y104.001 E.0053
; LINE_WIDTH: 0.410998
G1 X77.139 Y103.57 E.00602
G1 X77.105 Y103.29 E.00362
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00722
G1 X77.183 Y76.282 E.00574
; LINE_WIDTH: 0.403398
G1 X77.391 Y75.904 E.00543
; LINE_WIDTH: 0.408238
G1 X77.697 Y75.619 E.00533
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00517
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410248
G1 X80.412 Y75.405 E.02562
; LINE_WIDTH: 0.409768
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409298
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.636 J-1940.253 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.59 Y75.404 I.349 J-42.572 E.01561
; LINE_WIDTH: 0.406238
G1 X101.835 Y75.437 E.00313
; LINE_WIDTH: 0.403398
G1 X102.207 Y75.569 E.00497
; LINE_WIDTH: 0.404238
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407728
G1 X102.783 Y76.184 E.0056
; LINE_WIDTH: 0.409518
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407798
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407928
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408058
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408188
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408568
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408698
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.415198
G1 X102.831 Y103.652 E.00419
; WIPE_START
G1 F12000
M204 S6000
G1 X102.66 Y104.037 E-.1601
G1 X102.295 Y104.384 E-.19138
G1 X101.885 Y104.553 E-.16861
G1 X101.6 Y104.591 E-.1092
G1 X101.256 Y104.591 E-.13071
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.319 Y96.959 Z3.08 F42000
G1 X101.49 Y76.24 Z3.08
G1 Z2.68
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2162
M204 S5000
G1 X101.498 Y75.938 E.00396
G1 X101.688 Y75.801 E.00308
; LINE_WIDTH: 0.405128
G1 X102.02 Y75.906 E.00441
G1 X102.315 Y76.154 E.00488
; LINE_WIDTH: 0.404848
G1 X102.458 Y76.427 E.0039
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407798
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407928
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408058
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408188
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408568
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408698
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00556
; LINE_WIDTH: 0.403968
G1 X102.088 Y104.058 E.00533
; LINE_WIDTH: 0.405538
G1 X101.706 Y104.199 E.00517
; LINE_WIDTH: 0.417168
G1 X101.638 Y104.199 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
; LINE_WIDTH: 0.411558
G1 X78.205 Y104.177 E.00284
G1 X77.866 Y104.022 E.0048
; LINE_WIDTH: 0.404058
G1 X77.647 Y103.789 E.00402
; LINE_WIDTH: 0.404978
G1 X77.502 Y103.389 E.00539
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.28 E.02701
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.28 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.28 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.28 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.28 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.28 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.28 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.28 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.0071
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411228
G1 X77.754 Y76.076 E.00495
G1 X78.01 Y75.891 E.00406
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410248
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409768
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.938 E-.11753
G1 X101.688 Y75.801 E-.08911
G1 X102.02 Y75.906 E-.13264
G1 X102.315 Y76.154 E-.1465
G1 X102.458 Y76.427 E-.11717
G1 X102.504 Y76.7 E-.10504
G1 X102.504 Y76.837 E-.05201
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.459 Z3.08 F42000
G1 X101.099 Y104.175 Z3.08
G1 Z2.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2162
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z3.08 F42000
G1 X101.099 Y75.825 Z3.08
G1 Z2.68
G1 E.8 F1800
; LINE_WIDTH: 0.443888
G1 F2162
M204 S6000
G1 X98.402 Y75.825 E.03751
; LINE_WIDTH: 0.444028
G1 X92.402 Y75.825 E.08348
; LINE_WIDTH: 0.444168
G1 X86.402 Y75.825 E.08351
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.74 Y79.55 Z3.08 F42000
G1 X79.413 Y80.852 Z3.08
G1 Z2.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392368
G1 F2162
M204 S5000
G1 X79.537 Y80.621 E.0032
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399208
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389368
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.729 E.00332
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.703 Y81.651 E.0036
; LINE_WIDTH: 0.392888
G1 X79.471 Y81.41 E.00409
G1 X79.38 Y81.137 E.00353
; LINE_WIDTH: 0.392368
G1 X79.402 Y80.91 E.00279
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.12105
G1 X79.751 Y80.449 E-.10438
G1 X80.016 Y80.374 E-.10448
G1 X80.289 Y80.403 E-.10447
G1 X80.529 Y80.541 E-.10501
G1 X80.696 Y80.76 E-.10481
G1 X80.766 Y81.03 E-.10602
G1 X80.76 Y81.055 E-.00979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.658 Y80.29 Z3.08 F42000
G1 Z2.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.367968
G1 F2162
M204 S6000
G1 X82.967 Y80.125 E.00401
G1 X83.05 Y80.28 E.00201
G1 X83.138 Y80.446 E.00215
G1 X82.828 Y80.611 E.00401
G1 X82.686 Y80.343 E.00347
M204 S250
G1 X82.148 Y80.134 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2162
M204 S5000
G1 X83.123 Y79.615 E.0145
G1 X83.275 Y79.901 E.00425
G1 X83.382 Y80.103 E.003
G1 X83.492 Y80.309 E.00307
G1 X83.648 Y80.602 E.00435
G1 X82.673 Y81.12 E.0145
G1 X82.176 Y80.187 E.01388
; WIPE_START
G1 F5700
M204 S6000
G1 X83.123 Y79.615 E-.4203
G1 X83.275 Y79.901 E-.12292
G1 X83.382 Y80.103 E-.08693
G1 X83.492 Y80.309 E-.08888
G1 X83.543 Y80.405 E-.04097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.256 Y88.004 Z3.08 F42000
G1 X84.654 Y92.246 Z3.08
G1 Z2.68
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2162
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.08 F42000
G1 Z2.68
G1 E.8 F1800
G1 F2162
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.08 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 32/99
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
G1 X102.107 Y75.533 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.403388
G1 F2135
M204 S5000
G1 X102.207 Y75.569 E.00134
; LINE_WIDTH: 0.404238
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407748
G1 X102.783 Y76.184 E.0056
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407878
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
M73 P38 R10
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y103.275 E.033
; LINE_WIDTH: 0.414048
G1 X102.853 Y103.613 E.0044
G1 X102.67 Y104.013 E.00569
; LINE_WIDTH: 0.404428
G1 X102.342 Y104.353 E.00596
; LINE_WIDTH: 0.410928
G1 X101.937 Y104.544 E.00576
G1 X101.6 Y104.594 E.00437
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J416.817 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.173 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.005 Y104.526 E.00543
; LINE_WIDTH: 0.404718
G1 X77.604 Y104.309 E.00576
; LINE_WIDTH: 0.411588
G1 X77.309 Y103.988 E.0056
; LINE_WIDTH: 0.415268
G1 X77.158 Y103.636 E.00496
G1 X77.104 Y103.287 E.00458
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.726 E.33888
G1 X77.183 Y76.278 E.00581
; LINE_WIDTH: 0.404158
G1 X77.395 Y75.901 E.00545
; LINE_WIDTH: 0.408468
G1 X77.699 Y75.617 E.0053
; LINE_WIDTH: 0.412788
G1 X78.064 Y75.457 E.00514
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.639 J-1938.337 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.591 Y75.404 I.349 J-44.497 E.01561
; LINE_WIDTH: 0.406808
G1 X101.833 Y75.437 E.0031
; LINE_WIDTH: 0.403388
M73 P38 R9
G1 X102.05 Y75.513 E.00289
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2135
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.802 E.00308
; LINE_WIDTH: 0.405118
G1 X102.021 Y75.906 E.00441
G1 X102.315 Y76.154 E.00487
; LINE_WIDTH: 0.404868
G1 X102.458 Y76.428 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00351
; LINE_WIDTH: 0.407878
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.414048
G1 X102.471 Y103.501 E.00295
G1 X102.346 Y103.8 E.00418
; LINE_WIDTH: 0.406468
G1 X102.053 Y104.077 E.00512
G1 X101.715 Y104.196 E.00455
; LINE_WIDTH: 0.409058
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.131 Y104.158 E.0038
; LINE_WIDTH: 0.411608
G1 X77.78 Y103.949 E.00525
G1 X77.596 Y103.707 E.00391
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.275 E.00565
G1 X77.496 Y76.726 E.33873
G1 X77.551 Y76.403 E.00418
; LINE_WIDTH: 0.405678
G1 X77.729 Y76.1 E.00445
G1 X78.01 Y75.89 E.00444
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11717
G1 X101.688 Y75.802 E-.08906
G1 X102.021 Y75.906 E-.13255
G1 X102.315 Y76.154 E-.14647
G1 X102.458 Y76.428 E-.11729
G1 X102.504 Y76.7 E-.10491
G1 X102.504 Y76.838 E-.05256
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.461 Z3.16 F42000
G1 X101.099 Y104.175 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2135
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z3.16 F42000
G1 X101.099 Y75.825 Z3.16
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.443918
G1 F2135
M204 S6000
G1 X96.402 Y75.825 E.06533
; LINE_WIDTH: 0.444018
G1 X92.402 Y75.825 E.05565
; LINE_WIDTH: 0.444168
G1 X86.402 Y75.825 E.08351
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.744 Y79.557 Z3.16 F42000
G1 X79.411 Y80.865 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392868
G1 F2135
M204 S5000
G1 X79.537 Y80.621 E.00336
; LINE_WIDTH: 0.392348
G1 X79.751 Y80.449 E.00336
; LINE_WIDTH: 0.415328
G1 X80.056 Y80.376 E.00406
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405188
G1 X80.529 Y80.545 E.00429
; LINE_WIDTH: 0.405368
G1 X80.696 Y80.767 E.00351
; LINE_WIDTH: 0.409668
G1 X80.76 Y81.03 E.00348
G1 X80.735 Y81.253 E.00286
; LINE_WIDTH: 0.399228
G1 X80.606 Y81.511 E.00359
G1 X80.391 Y81.683 E.00343
; LINE_WIDTH: 0.398288
G1 X80.125 Y81.759 E.00343
G1 X79.775 Y81.691 E.00443
; LINE_WIDTH: 0.386568
G1 X79.528 Y81.49 E.00383
G1 X79.394 Y81.211 E.00373
; LINE_WIDTH: 0.392868
G1 X79.403 Y80.923 E.00352
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.12559
G1 X79.751 Y80.449 E-.10437
G1 X80.056 Y80.376 E-.11888
G1 X80.227 Y80.39 E-.06525
G1 X80.529 Y80.545 E-.12901
G1 X80.696 Y80.767 E-.10544
G1 X80.76 Y81.03 E-.10325
G1 X80.758 Y81.052 E-.00821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.631 Y80.28 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.406138
G1 F2135
M204 S6000
G1 X82.975 Y80.098 E.00493
G1 X83.066 Y80.269 E.00247
G1 X83.165 Y80.455 E.00267
G1 X82.821 Y80.638 E.00493
G1 X82.659 Y80.333 E.00437
M204 S250
G1 X82.096 Y80.117 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2135
M204 S5000
G1 X83.138 Y79.562 E.0155
G1 X83.303 Y79.872 E.0046
G1 X83.415 Y80.084 E.00315
G1 X83.531 Y80.302 E.00324
G1 X83.7 Y80.619 E.00472
G1 X82.658 Y81.173 E.0155
G1 X82.124 Y80.17 E.01493
; WIPE_START
G1 F5700
M204 S6000
G1 X83.138 Y79.562 E-.44927
G1 X83.303 Y79.872 E-.13311
G1 X83.415 Y80.084 E-.09124
G1 X83.522 Y80.284 E-.08638
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.241 Y87.883 Z3.16 F42000
G1 X84.654 Y92.246 Z3.16
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2135
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F2135
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.16 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.84
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 33/99
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2141
M204 S5000
G1 X101.498 Y75.939 E.00396
G1 X101.688 Y75.801 E.00308
; LINE_WIDTH: 0.403698
G1 X101.94 Y75.869 E.00329
; LINE_WIDTH: 0.407928
G1 X102.265 Y76.094 E.00504
G1 X102.457 Y76.428 E.00491
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00351
; LINE_WIDTH: 0.407878
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.414208
G1 X102.47 Y103.503 E.00297
G1 X102.346 Y103.8 E.00416
; LINE_WIDTH: 0.406428
M73 P39 R9
G1 X102.053 Y104.077 E.00512
G1 X101.715 Y104.196 E.00455
; LINE_WIDTH: 0.409028
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
; LINE_WIDTH: 0.411348
G1 X78.207 Y104.178 E.00282
G1 X77.865 Y104.022 E.00483
; LINE_WIDTH: 0.404638
G1 X77.603 Y103.716 E.00508
; LINE_WIDTH: 0.404528
G1 X77.501 Y103.37 E.00456
; LINE_WIDTH: 0.410298
G1 X77.498 Y101.276 E.02683
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.276 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.276 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.276 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.276 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.276 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.276 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.276 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.276 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.276 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.276 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.276 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.276 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00703
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411208
G1 X77.754 Y76.076 E.00494
G1 X78.01 Y75.89 E.00406
; LINE_WIDTH: 0.404538
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.112 Y75.533 F42000
; LINE_WIDTH: 0.414848
G1 F2141
M204 S5000
G1 X102.29 Y75.614 E.00254
G1 X102.535 Y75.818 E.00413
; LINE_WIDTH: 0.410098
G1 X102.777 Y76.164 E.00541
G1 X102.893 Y76.646 E.00635
; LINE_WIDTH: 0.409528
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407878
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.023 J.288 E.0095
; LINE_WIDTH: 0.408478
G1 X102.761 Y103.858 E.00554
G1 X102.64 Y104.049 E.00288
; LINE_WIDTH: 0.404438
G1 X102.342 Y104.353 E.00537
; LINE_WIDTH: 0.410898
G1 X101.936 Y104.544 E.00575
G1 X101.6 Y104.594 E.00436
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.502 J414.891 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.174 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
; LINE_WIDTH: 0.411348
G1 X78.087 Y104.554 E.00437
G1 X77.659 Y104.35 E.00608
; LINE_WIDTH: 0.407148
G1 X77.35 Y104.043 E.00555
; LINE_WIDTH: 0.413508
G1 X77.157 Y103.636 E.00581
G1 X77.105 Y103.288 E.00455
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.288 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.288 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.288 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.288 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.288 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.288 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.288 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.288 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.288 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.288 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.288 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.288 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00719
G1 X77.183 Y76.281 E.00574
; LINE_WIDTH: 0.403348
G1 X77.391 Y75.904 E.00543
; LINE_WIDTH: 0.408218
G1 X77.697 Y75.619 E.00533
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.642 J-1936.425 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.592 Y75.404 I.349 J-43.802 E.01562
; LINE_WIDTH: 0.407418
G1 X101.947 Y75.457 E.00457
; LINE_WIDTH: 0.414848
G1 X102.057 Y75.508 E.00157
; WIPE_START
G1 F12000
M204 S6000
G1 X102.29 Y75.614 E-.09736
G1 X102.535 Y75.818 E-.12103
G1 X102.777 Y76.164 E-.16044
G1 X102.893 Y76.646 E-.18848
G1 X102.894 Y76.7 E-.0204
G1 X102.894 Y77.153 E-.17229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z3.24 F42000
G1 Z2.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443898
G1 F2141
M204 S6000
G1 X96.402 Y75.825 E.06533
; LINE_WIDTH: 0.443998
G1 X92.402 Y75.825 E.05565
; LINE_WIDTH: 0.444148
G1 X86.402 Y75.825 E.0835
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z3.24 F42000
G1 X101.099 Y104.175 Z3.24
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2141
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.646 Y97.057 Z3.24 F42000
G1 X79.401 Y80.927 Z3.24
G1 Z2.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384988
G1 F2141
M204 S5000
G1 X79.494 Y80.683 E.00313
; LINE_WIDTH: 0.392868
G1 X79.74 Y80.458 E.00409
; LINE_WIDTH: 0.415288
G1 X80.056 Y80.376 E.00423
G1 X80.226 Y80.39 E.00223
; LINE_WIDTH: 0.405248
G1 X80.529 Y80.545 E.0043
; LINE_WIDTH: 0.405368
G1 X80.696 Y80.767 E.00351
G1 X80.763 Y81.03 E.00344
; LINE_WIDTH: 0.405268
G1 X80.752 Y81.166 E.00172
; LINE_WIDTH: 0.384968
G1 X80.66 Y81.423 E.00327
; LINE_WIDTH: 0.399468
G1 X80.402 Y81.675 E.0045
G1 X80.125 Y81.759 E.00361
; LINE_WIDTH: 0.398268
G1 X79.775 Y81.691 E.00443
; LINE_WIDTH: 0.386548
G1 X79.527 Y81.49 E.00383
G1 X79.402 Y81.237 E.0034
; LINE_WIDTH: 0.384988
G1 X79.389 Y80.985 E.00303
; WIPE_START
G1 F12000
M204 S6000
G1 X79.494 Y80.683 E-.12136
G1 X79.74 Y80.458 E-.12696
G1 X80.056 Y80.376 E-.12384
G1 X80.226 Y80.39 E-.06516
G1 X80.529 Y80.545 E-.12913
G1 X80.696 Y80.767 E-.10543
G1 X80.753 Y80.991 E-.08812
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.605 Y80.271 Z3.24 F42000
G1 Z2.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444308
G1 F2141
M204 S6000
G1 X82.982 Y80.071 E.00595
G1 X83.082 Y80.259 E.00297
G1 X83.191 Y80.465 E.00324
G1 X82.814 Y80.665 E.00595
G1 X82.633 Y80.324 E.00538
M204 S250
G1 X82.043 Y80.099 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2141
M204 S5000
G1 X83.153 Y79.509 E.01651
G1 X83.326 Y79.835 E.00484
G1 X83.448 Y80.064 E.00341
G1 X83.573 Y80.299 E.00348
G1 X83.752 Y80.636 E.00502
G1 X82.643 Y81.226 E.01651
G1 X82.072 Y80.152 E.01597
; WIPE_START
G1 F5700
M204 S6000
G1 X83.153 Y79.509 E-.47825
G1 X83.326 Y79.835 E-.14012
G1 X83.448 Y80.064 E-.09873
G1 X83.501 Y80.164 E-.0429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.226 Y87.762 Z3.24 F42000
G1 X84.654 Y92.246 Z3.24
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2141
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.24 F42000
G1 Z2.84
G1 E.8 F1800
G1 F2141
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.24 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 34/99
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2147
M204 S5000
G1 X101.498 Y75.939 E.00396
G1 X101.688 Y75.801 E.00308
; LINE_WIDTH: 0.403688
G1 X101.94 Y75.869 E.00329
; LINE_WIDTH: 0.407888
G1 X102.265 Y76.093 E.00503
G1 X102.457 Y76.428 E.00491
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00555
; LINE_WIDTH: 0.403938
G1 X102.087 Y104.059 E.00536
; LINE_WIDTH: 0.405598
G1 X101.706 Y104.199 E.00514
; LINE_WIDTH: 0.417218
G1 X101.638 Y104.199 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.411208
G1 X78.111 Y104.15 E.00333
G1 X77.832 Y103.995 E.0041
; LINE_WIDTH: 0.408218
M73 P40 R9
G1 X77.588 Y103.691 E.00497
; LINE_WIDTH: 0.410298
G1 X77.498 Y103.28 E.00538
G1 X77.498 Y101.28 E.02563
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.28 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.28 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.28 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.28 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.28 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.28 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.28 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.0071
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.412798
G1 X77.64 Y76.228 E.00254
G1 X77.748 Y76.082 E.00234
; LINE_WIDTH: 0.410738
G1 X78.01 Y75.89 E.00417
; LINE_WIDTH: 0.410258
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.116 Y75.534 F42000
; LINE_WIDTH: 0.414838
G1 F2147
M204 S5000
G1 X102.29 Y75.614 E.00249
G1 X102.487 Y75.772 E.00326
; LINE_WIDTH: 0.411528
G1 X102.767 Y76.145 E.006
G1 X102.893 Y76.646 E.00664
; LINE_WIDTH: 0.409548
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.415178
G1 X102.82 Y103.711 E.00497
G1 X102.659 Y104.036 E.00471
; LINE_WIDTH: 0.407578
G1 X102.291 Y104.387 E.00647
; LINE_WIDTH: 0.404298
G1 X101.884 Y104.553 E.00555
; LINE_WIDTH: 0.417218
G1 X101.6 Y104.591 E.00374
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.655 J1960.705 E.08536
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.636 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.411208
G1 X77.962 Y104.516 E.00527
G1 X77.587 Y104.293 E.00561
; LINE_WIDTH: 0.404348
G1 X77.282 Y103.942 E.00587
; LINE_WIDTH: 0.411308
G1 X77.138 Y103.571 E.00511
G1 X77.105 Y103.29 E.00363
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00722
G1 X77.188 Y76.273 E.00585
; LINE_WIDTH: 0.403068
G1 X77.396 Y75.895 E.00543
; LINE_WIDTH: 0.404578
G1 X77.705 Y75.62 E.00522
; LINE_WIDTH: 0.410828
G1 X78.13 Y75.439 E.00593
G1 X78.41 Y75.405 E.00362
; LINE_WIDTH: 0.410258
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409298
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.404 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.642 J-1936.415 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.593 Y75.404 I.349 J-43.895 E.01563
; LINE_WIDTH: 0.407428
G1 X101.947 Y75.457 E.00456
; LINE_WIDTH: 0.414838
G1 X102.061 Y75.509 E.00163
; WIPE_START
G1 F12000
M204 S6000
G1 X102.29 Y75.614 E-.09576
G1 X102.487 Y75.772 E-.09571
G1 X102.767 Y76.145 E-.17742
G1 X102.893 Y76.646 E-.19633
G1 X102.894 Y76.7 E-.02051
G1 X102.894 Y77.159 E-.17426
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443898
G1 F2147
M204 S6000
G1 X96.402 Y75.825 E.06533
; LINE_WIDTH: 0.443998
G1 X92.402 Y75.825 E.05565
; LINE_WIDTH: 0.444148
G1 X86.402 Y75.825 E.0835
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z3.32 F42000
G1 X86.402 Y104.174 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2147
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.179 Y98.34 Z3.32 F42000
G1 X79.42 Y80.837 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392388
G1 F2147
M204 S5000
G1 X79.537 Y80.621 E.003
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00347
G1 X80.685 Y81.381 E.00448
; LINE_WIDTH: 0.392388
G1 X80.502 Y81.603 E.00352
; LINE_WIDTH: 0.384968
G1 X80.259 Y81.729 E.00328
G1 X79.986 Y81.75 E.00328
G1 X79.703 Y81.651 E.0036
; LINE_WIDTH: 0.392908
G1 X79.471 Y81.41 E.00409
G1 X79.38 Y81.137 E.00353
; LINE_WIDTH: 0.392388
G1 X79.404 Y80.894 E.00299
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.1152
G1 X79.751 Y80.449 E-.10446
G1 X80.016 Y80.374 E-.10446
G1 X80.289 Y80.403 E-.10457
G1 X80.529 Y80.541 E-.10487
G1 X80.696 Y80.76 E-.10488
G1 X80.766 Y81.03 E-.10596
G1 X80.757 Y81.07 E-.01561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.578 Y80.262 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.482488
G1 F2147
M204 S6000
G1 X82.989 Y80.043 E.00706
G1 X83.098 Y80.249 E.00353
G1 X83.218 Y80.474 E.00386
G1 X82.807 Y80.692 E.00706
G1 X82.606 Y80.315 E.00648
M204 S250
G1 X81.991 Y80.082 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2147
M204 S5000
G1 X83.168 Y79.456 E.01751
G1 X83.355 Y79.807 E.00522
G1 X83.481 Y80.045 E.00353
G1 X83.614 Y80.294 E.0037
G1 X83.805 Y80.653 E.00534
G1 X82.627 Y81.279 E.01751
G1 X82.019 Y80.135 E.01701
; WIPE_START
G1 F5700
M204 S6000
G1 X83.168 Y79.456 E-.50722
G1 X83.355 Y79.807 E-.15113
G1 X83.481 Y80.044 E-.10165
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.211 Y87.641 Z3.32 F42000
G1 X84.654 Y92.246 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2147
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.32 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 35/99
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
G1 X102.118 Y75.537 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.403378
G1 F2152
M204 S5000
G1 X102.207 Y75.569 E.00118
; LINE_WIDTH: 0.404248
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407758
G1 X102.783 Y76.184 E.00561
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.441 I-4.026 J.288 E.0095
; LINE_WIDTH: 0.407178
G1 X102.759 Y103.86 E.00555
G1 X102.64 Y104.051 E.00287
; LINE_WIDTH: 0.404698
G1 X102.327 Y104.358 E.00554
; LINE_WIDTH: 0.411508
G1 X101.937 Y104.545 E.00556
G1 X101.6 Y104.594 E.00438
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J415.468 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.174 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X78.234 Y104.577 E.00244
; LINE_WIDTH: 0.410048
G1 X77.797 Y104.44 E.00586
G1 X77.607 Y104.309 E.00296
; LINE_WIDTH: 0.404698
G1 X77.323 Y104 E.00531
; LINE_WIDTH: 0.409398
G1 X77.136 Y103.554 E.00618
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.291 E.0034
G1 X77.105 Y101.291 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.291 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.291 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.291 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.291 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.291 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.291 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.291 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.291 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.291 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.291 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.291 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.291 E.02553
; LINE_WIDTH: 0.408628
M73 P41 R9
G3 X77.141 Y76.413 I3.74 J-.283 E.01123
; LINE_WIDTH: 0.413068
G3 X77.456 Y75.833 I1.224 J.289 E.00862
; LINE_WIDTH: 0.402958
G1 X77.745 Y75.595 E.00471
; LINE_WIDTH: 0.411298
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409298
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408818
G1 X85.808 Y75.404 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.642 J-1936.405 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.593 Y75.404 I.349 J-44.637 E.01564
; LINE_WIDTH: 0.406778
G1 X101.833 Y75.436 E.00308
; LINE_WIDTH: 0.403378
G1 X102.062 Y75.517 E.00305
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2152
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.802 E.00308
; LINE_WIDTH: 0.405128
G1 X102.021 Y75.906 E.00441
G1 X102.315 Y76.154 E.00488
; LINE_WIDTH: 0.404868
G1 X102.458 Y76.428 E.0039
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.03299
; LINE_WIDTH: 0.414008
G1 X102.471 Y103.501 E.00295
G1 X102.346 Y103.8 E.00419
; LINE_WIDTH: 0.410478
G1 X102.042 Y104.084 E.00533
G1 X101.715 Y104.196 E.00444
; LINE_WIDTH: 0.409068
G1 X101.634 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411348
G1 X78.207 Y104.178 E.00281
G1 X77.865 Y104.022 E.00483
; LINE_WIDTH: 0.404698
G1 X77.632 Y103.77 E.00433
; LINE_WIDTH: 0.406278
G1 X77.5 Y103.37 E.00535
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.282 I45.637 J-1.092 E.02676
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.282 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.282 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y95.282 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.282 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.282 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.282 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.282 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.282 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.282 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.282 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.282 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.282 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.00711
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.404578
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.408258
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00539
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408818
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11717
G1 X101.688 Y75.802 E-.08911
G1 X102.021 Y75.906 E-.13248
G1 X102.315 Y76.154 E-.14653
G1 X102.458 Y76.428 E-.11723
G1 X102.504 Y76.7 E-.10495
G1 X102.504 Y76.838 E-.05253
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.461 Z3.4 F42000
G1 X101.099 Y104.175 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2152
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z3.4 F42000
G1 X101.099 Y75.825 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.443818
G1 F2152
M204 S6000
G1 X98.402 Y75.825 E.03751
; LINE_WIDTH: 0.443928
G1 X94.402 Y75.825 E.05564
; LINE_WIDTH: 0.444038
G1 X90.402 Y75.825 E.05566
; LINE_WIDTH: 0.444148
G1 X86.402 Y75.825 E.05567
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.76 Y79.585 Z3.4 F42000
G1 X79.405 Y80.918 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2152
M204 S5000
G1 X79.494 Y80.683 E.00301
; LINE_WIDTH: 0.392908
G1 X79.74 Y80.457 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00342
; LINE_WIDTH: 0.412968
G1 X80.526 Y80.548 E.00358
G1 X80.696 Y80.767 E.00357
; LINE_WIDTH: 0.406128
G1 X80.762 Y81.03 E.00345
G1 X80.757 Y81.131 E.00128
; LINE_WIDTH: 0.385968
G1 X80.677 Y81.393 E.00329
; LINE_WIDTH: 0.389428
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.728 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00327
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.975 E.00315
; WIPE_START
G1 F12000
M204 S6000
G1 X79.494 Y80.683 E-.11795
G1 X79.74 Y80.457 E-.12695
G1 X80.016 Y80.374 E-.10952
G1 X80.289 Y80.403 E-.10444
G1 X80.526 Y80.548 E-.10553
G1 X80.696 Y80.767 E-.10515
G1 X80.754 Y80.998 E-.09046
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.552 Y80.253 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.520628
G1 F2152
M204 S6000
G1 X82.996 Y80.016 E.00826
G1 X83.114 Y80.238 E.00413
G1 X83.244 Y80.483 E.00454
G1 X82.8 Y80.719 E.00826
G1 X82.58 Y80.306 E.00769
M204 S250
G1 X81.939 Y80.065 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2152
M204 S5000
G1 X83.183 Y79.403 E.01851
G1 X83.377 Y79.767 E.00541
G1 X83.514 Y80.026 E.00384
G1 X83.655 Y80.291 E.00394
G1 X83.857 Y80.67 E.00564
G1 X82.612 Y81.332 E.01851
G1 X81.967 Y80.118 E.01805
; WIPE_START
G1 F5700
M204 S6000
G1 X83.183 Y79.403 E-.5362
G1 X83.377 Y79.767 E-.15663
G1 X83.46 Y79.923 E-.06717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.196 Y87.52 Z3.4 F42000
G1 X84.654 Y92.246 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2152
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F2152
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 36/99
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
G1 X102.122 Y75.539 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.403418
G1 F2151
M204 S5000
G1 X102.207 Y75.569 E.00113
; LINE_WIDTH: 0.404808
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.409598
G1 X102.778 Y76.166 E.00577
G1 X102.893 Y76.646 E.00631
; LINE_WIDTH: 0.409538
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.895 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.022 J.288 E.0095
; LINE_WIDTH: 0.408478
G1 X102.761 Y103.858 E.00554
G1 X102.64 Y104.05 E.00289
; LINE_WIDTH: 0.403838
G1 X102.331 Y104.357 E.00549
; LINE_WIDTH: 0.411268
G1 X101.937 Y104.545 E.00561
G1 X101.6 Y104.594 E.00437
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.534 J415.703 E.08537
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.637 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.005 Y104.527 E.00467
; LINE_WIDTH: 0.413598
G1 X77.709 Y104.387 E.00424
G1 X77.399 Y104.118 E.0053
; LINE_WIDTH: 0.411598
G1 X77.183 Y103.715 E.00588
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.291 E.0055
G1 X77.104 Y77.291 E.33172
G3 X77.141 Y76.413 I3.737 J-.283 E.01123
; LINE_WIDTH: 0.413468
G1 X77.25 Y76.12 E.00404
G1 X77.451 Y75.834 E.00453
; LINE_WIDTH: 0.407748
G1 X77.824 Y75.546 E.00599
; LINE_WIDTH: 0.408618
G1 X78.159 Y75.433 E.0045
; LINE_WIDTH: 0.410268
G1 X78.408 Y75.405 E.00322
G1 X80.408 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.408 Y75.405 E.02559
; LINE_WIDTH: 0.409298
G1 X84.408 Y75.405 E.02556
; LINE_WIDTH: 0.408818
G1 X85.808 Y75.404 E.01787
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.645 J-1934.497 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.594 Y75.404 I.349 J-44.071 E.01565
; LINE_WIDTH: 0.406608
M73 P42 R9
G1 X101.834 Y75.436 E.00308
; LINE_WIDTH: 0.403418
G1 X102.066 Y75.519 E.00309
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2151
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.801 E.00308
; LINE_WIDTH: 0.405148
G1 X102.021 Y75.906 E.00441
; LINE_WIDTH: 0.405378
G1 X102.316 Y76.154 E.00488
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.414208
G1 X102.47 Y103.503 E.00297
G1 X102.346 Y103.8 E.00416
; LINE_WIDTH: 0.408868
G1 X102.053 Y104.079 E.00517
G1 X101.715 Y104.196 E.00457
; LINE_WIDTH: 0.409038
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X78.021 Y104.116 E.00452
; LINE_WIDTH: 0.411598
G1 X77.718 Y103.884 E.0049
G1 X77.579 Y103.664 E.00335
; LINE_WIDTH: 0.411578
G1 X77.496 Y103.282 E.00503
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.33883
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.410818
G1 X77.764 Y76.068 E.0051
G1 X78.009 Y75.888 E.0039
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00535
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408818
G1 X85.808 Y75.796 E.01777
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11727
G1 X101.688 Y75.801 E-.08916
G1 X102.021 Y75.906 E-.13257
G1 X102.316 Y76.154 E-.14652
G1 X102.457 Y76.428 E-.11713
G1 X102.504 Y76.7 E-.10494
G1 X102.504 Y76.838 E-.05242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.63 Y83.414 Z3.48 F42000
G1 X86.402 Y104.174 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2151
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.636 Y96.561 Z3.48 F42000
G1 X101.099 Y75.825 Z3.48
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.443798
G1 F2151
M204 S6000
G1 X98.402 Y75.825 E.0375
; LINE_WIDTH: 0.443908
G1 X94.402 Y75.825 E.05564
; LINE_WIDTH: 0.444018
G1 X90.402 Y75.825 E.05565
; LINE_WIDTH: 0.444128
G1 X86.402 Y75.825 E.05567
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.759 Y79.584 Z3.48 F42000
G1 X79.406 Y80.915 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2151
M204 S5000
G1 X79.494 Y80.683 E.00297
; LINE_WIDTH: 0.392888
G1 X79.74 Y80.458 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398628
G1 X80.767 Y81.033 E.0035
; LINE_WIDTH: 0.403448
G1 X80.735 Y81.267 E.00298
G1 X80.602 Y81.512 E.0035
; LINE_WIDTH: 0.402648
G1 X80.369 Y81.692 E.00371
; LINE_WIDTH: 0.395008
G1 X80.002 Y81.75 E.00458
; LINE_WIDTH: 0.387988
G1 X79.727 Y81.663 E.00349
; LINE_WIDTH: 0.384948
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.971 E.00319
; WIPE_START
G1 F12000
M204 S6000
G1 X79.494 Y80.683 E-.1167
G1 X79.74 Y80.458 E-.12686
G1 X80.016 Y80.374 E-.1095
G1 X80.289 Y80.403 E-.10454
G1 X80.529 Y80.541 E-.10491
G1 X80.696 Y80.76 E-.10483
G1 X80.757 Y80.996 E-.09266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.525 Y80.243 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.558798
G1 F2151
M204 S6000
G1 X83.003 Y79.989 E.00956
G1 X83.13 Y80.228 E.00478
G1 X83.271 Y80.492 E.00528
G1 X82.793 Y80.747 E.00956
G1 X82.553 Y80.296 E.009
M204 S250
G1 X81.886 Y80.048 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2151
M204 S5000
G1 X83.199 Y79.35 E.01951
G1 X83.403 Y79.735 E.00571
G1 X83.547 Y80.006 E.00404
G1 X83.698 Y80.289 E.00421
G1 X83.909 Y80.687 E.00592
G1 X82.597 Y81.385 E.01951
G1 X81.915 Y80.101 E.0191
; WIPE_START
G1 F5700
M204 S6000
G1 X83.199 Y79.35 E-.56518
G1 X83.403 Y79.735 E-.16537
G1 X83.439 Y79.803 E-.02946
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.181 Y87.399 Z3.48 F42000
G1 X84.654 Y92.246 Z3.48
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2151
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
G1 F2151
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.48 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.16
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 37/99
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
G1 X102.126 Y75.54 F42000
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.403378
G1 F2153
M204 S5000
G1 X102.207 Y75.569 E.00108
; LINE_WIDTH: 0.404808
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.409598
G1 X102.778 Y76.167 E.00577
G1 X102.893 Y76.646 E.0063
; LINE_WIDTH: 0.409528
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407728
G1 X102.894 Y80.7 E.05092
; LINE_WIDTH: 0.407848
G1 X102.894 Y84.7 E.05094
; LINE_WIDTH: 0.407958
G1 X102.893 Y88.7 E.05095
; LINE_WIDTH: 0.408068
G1 X102.893 Y92.7 E.05097
; LINE_WIDTH: 0.408188
G1 X102.893 Y96.7 E.05098
; LINE_WIDTH: 0.408298
G1 X102.892 Y100.7 E.051
; LINE_WIDTH: 0.408418
G1 X102.892 Y103.359 E.03391
; LINE_WIDTH: 0.415308
G1 X102.82 Y103.711 E.00466
G1 X102.636 Y104.065 E.00519
; LINE_WIDTH: 0.408448
G1 X102.303 Y104.374 E.0058
; LINE_WIDTH: 0.408058
G1 X101.89 Y104.557 E.00575
; LINE_WIDTH: 0.409748
G1 X101.6 Y104.594 E.00374
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1964.113 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.272 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X78.133 Y104.562 E.00375
; LINE_WIDTH: 0.414108
G1 X77.802 Y104.44 E.00456
G1 X77.443 Y104.166 E.00585
; LINE_WIDTH: 0.413428
G1 X77.205 Y103.78 E.00585
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.291 E.00637
G1 X77.104 Y76.725 E.33894
G1 X77.184 Y76.281 E.00575
; LINE_WIDTH: 0.403298
G1 X77.392 Y75.903 E.00542
; LINE_WIDTH: 0.408238
G1 X77.698 Y75.619 E.00533
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409298
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408818
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.645 J-1934.497 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.595 Y75.404 I.349 J-44.165 E.01566
; LINE_WIDTH: 0.406608
G1 X101.834 Y75.436 E.00307
; LINE_WIDTH: 0.403378
G1 X102.07 Y75.52 E.00315
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2153
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.801 E.00308
; LINE_WIDTH: 0.405138
G1 X102.021 Y75.906 E.00441
; LINE_WIDTH: 0.405348
G1 X102.316 Y76.154 E.00488
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00351
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407788
G1 X102.503 Y82.7 E.05093
; LINE_WIDTH: 0.407898
G1 X102.503 Y86.7 E.05094
; LINE_WIDTH: 0.408018
G1 X102.502 Y90.7 E.05096
; LINE_WIDTH: 0.408128
M73 P43 R9
G1 X102.502 Y94.7 E.05097
; LINE_WIDTH: 0.408248
G1 X102.501 Y98.7 E.05099
; LINE_WIDTH: 0.408358
G1 X102.501 Y103.359 E.05941
G1 X102.36 Y103.787 E.00575
; LINE_WIDTH: 0.408238
G1 X102.052 Y104.078 E.0054
; LINE_WIDTH: 0.405718
G1 X101.71 Y104.198 E.00458
; LINE_WIDTH: 0.409748
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
G1 X78.129 Y104.157 E.00383
; LINE_WIDTH: 0.405448
G1 X77.798 Y103.967 E.00483
; LINE_WIDTH: 0.404858
G1 X77.607 Y103.722 E.00392
; LINE_WIDTH: 0.407758
G1 X77.496 Y103.3 E.00555
; LINE_WIDTH: 0.408588
G3 X77.496 Y101.282 I43.727 J-1.018 E.02575
G1 X77.496 Y76.725 E.31331
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411208
G1 X77.754 Y76.076 E.00494
G1 X78.01 Y75.89 E.00407
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409778
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408818
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11727
G1 X101.688 Y75.801 E-.08917
G1 X102.021 Y75.906 E-.13257
G1 X102.316 Y76.154 E-.14657
G1 X102.457 Y76.428 E-.11713
G1 X102.504 Y76.7 E-.10487
G1 X102.504 Y76.838 E-.05242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.46 Z3.56 F42000
G1 X101.099 Y104.175 Z3.56
G1 Z3.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2153
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z3.56 F42000
G1 X101.099 Y75.825 Z3.56
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.443778
G1 F2153
M204 S6000
G1 X98.402 Y75.825 E.0375
; LINE_WIDTH: 0.443898
G1 X94.402 Y75.825 E.05564
; LINE_WIDTH: 0.444008
G1 X90.402 Y75.825 E.05565
; LINE_WIDTH: 0.444128
G1 X86.402 Y75.825 E.05567
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.499 Y80.234 Z3.56 F42000
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.596978
G1 F2153
M204 S6000
G1 X83.01 Y79.962 E.01096
G1 X83.147 Y80.218 E.00548
G1 X83.297 Y80.501 E.00607
G1 X82.785 Y80.774 E.01096
G1 X82.527 Y80.287 E.01042
M204 S250
G1 X81.834 Y80.031 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2153
M204 S5000
G1 X83.214 Y79.297 E.02052
G1 X83.432 Y79.709 E.00612
G1 X83.58 Y79.987 E.00414
G1 X83.736 Y80.279 E.00435
G1 X83.962 Y80.705 E.00632
G1 X82.582 Y81.438 E.02052
G1 X81.862 Y80.084 E.02014
; WIPE_START
G1 F5700
M204 S6000
G1 X83.214 Y79.297 E-.59417
G1 X83.418 Y79.683 E-.16583
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.419 Y80.848 Z3.56 F42000
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.392928
G1 F2153
M204 S5000
G1 X79.537 Y80.621 E.00313
; LINE_WIDTH: 0.392388
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399188
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398468
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392928
G1 X79.404 Y80.905 E.00375
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.11907
G1 X79.751 Y80.449 E-.10446
G1 X80.016 Y80.374 E-.10441
G1 X80.289 Y80.403 E-.10444
G1 X80.528 Y80.541 E-.10496
G1 X80.696 Y80.76 E-.10491
G1 X80.766 Y81.03 E-.10598
G1 X80.759 Y81.06 E-.01179
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.269 Y88.268 Z3.56 F42000
G1 X84.654 Y92.246 Z3.56
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2153
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.56 F42000
G1 Z3.16
G1 E.8 F1800
G1 F2153
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.56 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 38/99
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2157
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.801 E.00308
; LINE_WIDTH: 0.405128
G1 X102.021 Y75.906 E.00441
; LINE_WIDTH: 0.405328
G1 X102.316 Y76.154 E.00488
G1 X102.457 Y76.427 E.00389
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.699 E.00351
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.699 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.699 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.699 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.699 E.02549
; LINE_WIDTH: 0.408318
G1 X102.503 Y86.699 E.0255
; LINE_WIDTH: 0.408448
G1 X102.503 Y88.699 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.699 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.699 E.02552
; LINE_WIDTH: 0.408828
G1 X102.502 Y94.699 E.02553
; LINE_WIDTH: 0.408958
G1 X102.502 Y96.699 E.02554
; LINE_WIDTH: 0.409088
G1 X102.502 Y98.699 E.02555
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.699 E.02556
; LINE_WIDTH: 0.409338
G1 X102.501 Y103.335 E.03368
G1 X102.377 Y103.755 E.00561
; LINE_WIDTH: 0.401708
G1 X102.074 Y104.066 E.00543
; LINE_WIDTH: 0.411218
G1 X101.663 Y104.201 E.00555
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00284
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408478
G1 X83.809 Y104.204 E.02551
; LINE_WIDTH: 0.408668
G1 X81.809 Y104.204 E.02552
; LINE_WIDTH: 0.408858
G1 X79.809 Y104.204 E.02553
; LINE_WIDTH: 0.408998
G1 X78.424 Y104.204 E.01768
G1 X78.14 Y104.161 E.00367
; LINE_WIDTH: 0.405898
G1 X77.798 Y103.967 E.00499
G1 X77.57 Y103.646 E.00499
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.282 E.00474
G1 X77.496 Y76.724 E.33883
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.404488
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.403008
G1 X77.959 Y75.915 E.00372
; LINE_WIDTH: 0.405918
G1 X78.33 Y75.8 E.00492
; LINE_WIDTH: 0.410268
G3 X80.42 Y75.798 I1.104 J42.355 E.02678
; LINE_WIDTH: 0.409778
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.13 Y75.542 F42000
; LINE_WIDTH: 0.403408
G1 F2157
M204 S5000
G1 X102.207 Y75.569 E.00103
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.409528
G1 X102.778 Y76.167 E.00578
G1 X102.893 Y76.646 E.0063
; LINE_WIDTH: 0.409508
G1 X102.894 Y76.7 E.00068
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.414878
G1 X102.821 Y103.706 E.0049
G1 X102.682 Y103.995 E.00415
; LINE_WIDTH: 0.408718
M73 P44 R9
G1 X102.402 Y104.307 E.00536
; LINE_WIDTH: 0.414288
G1 X102.061 Y104.501 E.00509
G1 X101.634 Y104.593 E.00564
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.589 I-4.389 J1884.078 E.08581
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.343 J65.477 E.01695
; LINE_WIDTH: 0.408478
G1 X83.809 Y104.595 E.02551
; LINE_WIDTH: 0.408668
G1 X81.809 Y104.595 E.02552
; LINE_WIDTH: 0.408858
G1 X79.809 Y104.595 E.02553
; LINE_WIDTH: 0.408998
G1 X78.424 Y104.596 E.01768
G1 X78.147 Y104.564 E.00356
; LINE_WIDTH: 0.414508
G1 X77.802 Y104.439 E.00476
G1 X77.442 Y104.166 E.00585
; LINE_WIDTH: 0.413428
G1 X77.205 Y103.78 E.00585
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.291 E.00637
G1 X77.104 Y77.291 E.33172
G3 X77.141 Y76.413 I3.74 J-.283 E.01123
; LINE_WIDTH: 0.413028
G3 X77.456 Y75.832 I1.226 J.29 E.00863
; LINE_WIDTH: 0.403008
G1 X77.745 Y75.595 E.0047
; LINE_WIDTH: 0.411298
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409298
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.648 J-1935.94 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.596 Y75.404 I.349 J-44.321 E.01567
; LINE_WIDTH: 0.406598
G1 X101.834 Y75.436 E.00306
; LINE_WIDTH: 0.403408
G1 X102.074 Y75.521 E.0032
; WIPE_START
G1 F12000
M204 S6000
G1 X102.207 Y75.569 E-.05377
G1 X102.515 Y75.8 E-.14639
G1 X102.778 Y76.167 E-.17165
G1 X102.893 Y76.646 E-.1871
G1 X102.894 Y76.7 E-.02033
G1 X102.894 Y77.175 E-.18075
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443768
G1 F2157
M204 S6000
G1 X98.402 Y75.825 E.0375
; LINE_WIDTH: 0.443888
G1 X94.402 Y75.825 E.05564
; LINE_WIDTH: 0.444008
G1 X90.402 Y75.825 E.05565
; LINE_WIDTH: 0.444128
G1 X86.402 Y75.825 E.05567
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z3.64 F42000
G1 X86.402 Y104.175 Z3.64
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.443668
G1 F2157
M204 S6000
G1 X89.099 Y104.175 E.0375
; LINE_WIDTH: 0.443518
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443358
G1 X93.099 Y104.174 E.02778
; LINE_WIDTH: 0.443208
G1 X95.099 Y104.174 E.02777
; LINE_WIDTH: 0.443048
G1 X97.099 Y104.174 E.02776
; LINE_WIDTH: 0.442898
G1 X99.099 Y104.174 E.02775
; LINE_WIDTH: 0.442738
G1 X101.099 Y104.174 E.02774
; WIPE_START
G1 F18000
G1 X99.099 Y104.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.747 Y97.905 Z3.64 F42000
G1 X82.472 Y80.225 Z3.64
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.635158
G1 F2157
M204 S6000
G1 X83.018 Y79.935 E.01245
G1 X83.163 Y80.208 E.00622
G1 X83.324 Y80.511 E.00692
G1 X82.778 Y80.801 E.01245
G1 X82.5 Y80.278 E.01193
M204 S250
G1 X81.782 Y80.014 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2157
M204 S5000
G1 X83.229 Y79.244 E.02152
G1 X83.455 Y79.671 E.00634
G1 X83.613 Y79.968 E.00442
G1 X83.777 Y80.275 E.00457
G1 X84.014 Y80.722 E.00664
G1 X82.567 Y81.491 E.02152
G1 X81.81 Y80.067 E.02118
; WIPE_START
G1 F5700
M204 S6000
G1 X83.229 Y79.244 E-.62316
G1 X83.398 Y79.562 E-.13685
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.415 Y80.887 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.384968
G1 F2157
M204 S5000
G1 X79.48 Y80.707 E.00229
G1 X79.687 Y80.489 E.0036
; LINE_WIDTH: 0.392828
G1 X80.002 Y80.377 E.00409
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00359
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398268
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.413088
G1 X80.759 Y81.03 E.00358
G1 X80.758 Y81.118 E.00112
; LINE_WIDTH: 0.389248
G1 X80.677 Y81.393 E.00348
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.729 E.00332
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.395 Y80.943 E.00026
; WIPE_START
G1 F12000
M204 S6000
G1 X79.48 Y80.707 E-.09554
G1 X79.687 Y80.489 E-.11411
G1 X80.002 Y80.377 E-.12696
G1 X80.289 Y80.403 E-.10958
G1 X80.529 Y80.541 E-.10493
G1 X80.696 Y80.76 E-.10479
G1 X80.758 Y81.027 E-.10409
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.262 Y88.237 Z3.64 F42000
G1 X84.654 Y92.246 Z3.64
G1 Z3.24
M73 P44 R8
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2157
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F2157
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.32
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 39/99
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
G1 X102.134 Y75.543 F42000
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.403398
G1 F2168
M204 S5000
G1 X102.207 Y75.569 E.00097
; LINE_WIDTH: 0.404808
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.409518
G1 X102.778 Y76.168 E.00578
G1 X102.893 Y76.646 E.00629
; LINE_WIDTH: 0.409498
G1 X102.894 Y76.699 E.00068
; LINE_WIDTH: 0.407878
G1 X102.894 Y78.699 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.699 E.02548
; LINE_WIDTH: 0.408268
G1 X102.894 Y82.699 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.699 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.699 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.699 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.699 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.699 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.699 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.699 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.699 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.699 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.699 E.02562
G3 X102.88 Y103.44 I-4.023 J.288 E.00951
; LINE_WIDTH: 0.408488
G1 X102.761 Y103.858 E.00554
; LINE_WIDTH: 0.415668
G1 X102.53 Y104.188 E.00524
G1 X102.271 Y104.398 E.00432
; LINE_WIDTH: 0.404278
G1 X101.89 Y104.551 E.00519
; LINE_WIDTH: 0.410128
G1 X101.6 Y104.594 E.00376
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1935.786 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.172 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.005 Y104.524 E.00543
; LINE_WIDTH: 0.404328
G1 X77.594 Y104.304 E.00588
; LINE_WIDTH: 0.411578
G1 X77.309 Y103.988 E.00548
; LINE_WIDTH: 0.415268
G1 X77.158 Y103.636 E.00497
G1 X77.104 Y103.288 E.00457
; LINE_WIDTH: 0.408588
G1 X77.104 Y77.288 E.33172
G3 X77.141 Y76.414 I3.722 J-.282 E.01118
; LINE_WIDTH: 0.412688
G1 X77.282 Y76.06 E.00491
G1 X77.453 Y75.828 E.00372
; LINE_WIDTH: 0.407758
G1 X77.825 Y75.546 E.00594
; LINE_WIDTH: 0.408738
G1 X78.159 Y75.433 E.0045
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00323
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409298
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01787
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.652 J-1934.032 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.596 Y75.404 I.35 J-44.161 E.01568
; LINE_WIDTH: 0.406558
G1 X101.834 Y75.436 E.00305
; LINE_WIDTH: 0.403398
G1 X102.078 Y75.523 E.00325
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2168
M204 S5000
G1 X101.498 Y75.939 E.00396
G1 X101.688 Y75.801 E.00308
; LINE_WIDTH: 0.405148
G1 X102.021 Y75.906 E.00441
; LINE_WIDTH: 0.405318
G1 X102.316 Y76.154 E.00488
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.699 E.00351
; LINE_WIDTH: 0.407878
G1 X102.504 Y78.699 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.699 E.02548
; LINE_WIDTH: 0.408268
G1 X102.503 Y82.699 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.699 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.699 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.699 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.699 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.699 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.699 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.699 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.699 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.699 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.414198
G1 X102.47 Y103.503 E.00297
G1 X102.346 Y103.8 E.00416
; LINE_WIDTH: 0.409218
G1 X102.05 Y104.08 E.00522
G1 X101.708 Y104.199 E.00463
; LINE_WIDTH: 0.410128
G1 X101.638 Y104.195 E.00089
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00255
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.337 Y104.199 E.04433
; LINE_WIDTH: 0.404848
G1 X78.141 Y104.16 E.00253
; LINE_WIDTH: 0.411578
M73 P45 R8
G1 X77.782 Y103.952 E.00533
G1 X77.571 Y103.645 E.00479
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.276 E.00481
G1 X77.496 Y76.724 E.33875
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.406338
G1 X77.729 Y76.1 E.00445
; LINE_WIDTH: 0.407618
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00535
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.796 E.01776
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11729
G1 X101.688 Y75.801 E-.08921
G1 X102.021 Y75.906 E-.13247
G1 X102.316 Y76.154 E-.14665
G1 X102.457 Y76.428 E-.11706
G1 X102.504 Y76.699 E-.10478
G1 X102.504 Y76.838 E-.05254
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.46 Z3.72 F42000
G1 X101.099 Y104.175 Z3.72
G1 Z3.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2168
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z3.72 F42000
G1 X101.099 Y75.825 Z3.72
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.443748
G1 F2168
M204 S6000
G1 X98.402 Y75.825 E.0375
; LINE_WIDTH: 0.443868
G1 X94.402 Y75.825 E.05563
; LINE_WIDTH: 0.443988
G1 X90.402 Y75.825 E.05565
; LINE_WIDTH: 0.444108
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.294 Y80.169 Z3.72 F42000
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2168
M204 S6000
G1 X83.071 Y79.757 E.01241
G1 X83.277 Y80.145 E.0062
G1 X83.501 Y80.566 E.00673
G1 X82.725 Y80.979 E.01241
G1 X82.323 Y80.222 E.01209
M204 S250
G1 X81.729 Y79.997 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2168
M204 S5000
G1 X83.244 Y79.192 E.02252
G1 X83.478 Y79.632 E.00656
G1 X83.646 Y79.949 E.0047
G1 X83.819 Y80.273 E.00482
G1 X84.067 Y80.739 E.00693
G1 X82.552 Y81.544 E.02252
G1 X81.758 Y80.05 E.02222
; WIPE_START
G1 F5700
M204 S6000
G1 X83.244 Y79.192 E-.65215
G1 X83.377 Y79.442 E-.10786
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.423 Y80.842 Z3.72 F42000
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.392868
G1 F2168
M204 S5000
G1 X79.537 Y80.621 E.00305
; LINE_WIDTH: 0.392408
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389388
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.728 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392868
G1 X79.404 Y80.898 E.00383
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.11671
G1 X79.751 Y80.449 E-.10446
G1 X80.016 Y80.374 E-.10442
G1 X80.289 Y80.403 E-.10449
G1 X80.528 Y80.541 E-.10489
G1 X80.696 Y80.76 E-.10491
G1 X80.766 Y81.03 E-.10597
G1 X80.757 Y81.066 E-.01416
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.27 Y88.274 Z3.72 F42000
G1 X84.654 Y92.246 Z3.72
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2168
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.72 F42000
G1 Z3.32
G1 E.8 F1800
G1 F2168
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.72 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 40/99
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2177
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.802 E.00308
; LINE_WIDTH: 0.405138
G1 X102.021 Y75.906 E.00441
; LINE_WIDTH: 0.405918
G1 X102.316 Y76.154 E.00489
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00351
; LINE_WIDTH: 0.407878
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.03299
; LINE_WIDTH: 0.413978
G1 X102.471 Y103.501 E.00295
G1 X102.346 Y103.8 E.00419
; LINE_WIDTH: 0.404768
G1 X102.05 Y104.078 E.00513
; LINE_WIDTH: 0.405638
G1 X101.706 Y104.199 E.00463
; LINE_WIDTH: 0.417328
G1 X101.638 Y104.198 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
; LINE_WIDTH: 0.411308
G1 X78.207 Y104.178 E.00282
G1 X77.866 Y104.023 E.00481
; LINE_WIDTH: 0.404858
G1 X77.608 Y103.725 E.00498
G1 X77.501 Y103.369 E.00469
; LINE_WIDTH: 0.410278
G1 X77.498 Y101.275 E.02683
; LINE_WIDTH: 0.410148
G1 X77.498 Y99.275 E.02562
; LINE_WIDTH: 0.410018
G1 X77.498 Y97.275 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.275 E.0256
; LINE_WIDTH: 0.409768
G1 X77.497 Y93.275 E.02559
; LINE_WIDTH: 0.409638
G1 X77.497 Y91.275 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.275 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.275 E.02557
; LINE_WIDTH: 0.409258
G1 X77.497 Y85.275 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.275 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.275 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.275 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.275 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.00703
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413318
G1 X77.622 Y76.262 E.00204
G1 X77.75 Y76.08 E.00288
; LINE_WIDTH: 0.410638
G1 X78.01 Y75.89 E.00412
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00535
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.796 E.01776
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.138 Y75.544 F42000
; LINE_WIDTH: 0.403398
G1 F2177
M204 S5000
G1 X102.207 Y75.569 E.00092
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.410658
G1 X102.768 Y76.145 E.00548
G1 X102.893 Y76.646 E.00663
; LINE_WIDTH: 0.409518
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407878
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.024 J.288 E.0095
; LINE_WIDTH: 0.406978
G1 X102.758 Y103.86 E.00554
; LINE_WIDTH: 0.415068
G1 X102.514 Y104.204 E.00547
G1 X102.253 Y104.404 E.00428
; LINE_WIDTH: 0.404318
G1 X101.884 Y104.553 E.00502
; LINE_WIDTH: 0.417328
G1 X101.599 Y104.591 E.00374
; LINE_WIDTH: 0.419998
G2 X97.099 Y104.59 I-2.501 J1444.102 E.05909
G1 X87.099 Y104.59 E.1313
G2 X85.809 Y104.596 I-.348 J67.174 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
; LINE_WIDTH: 0.411308
G1 X78.087 Y104.554 E.00437
G1 X77.659 Y104.35 E.0061
; LINE_WIDTH: 0.406568
G1 X77.357 Y104.053 E.00538
; LINE_WIDTH: 0.413728
G1 X77.157 Y103.636 E.00597
G1 X77.105 Y103.287 E.00456
; LINE_WIDTH: 0.410278
G1 X77.105 Y101.287 E.02563
; LINE_WIDTH: 0.410148
G1 X77.105 Y99.287 E.02562
; LINE_WIDTH: 0.410018
G1 X77.105 Y97.287 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.287 E.0256
; LINE_WIDTH: 0.409768
G1 X77.105 Y93.287 E.02559
; LINE_WIDTH: 0.409638
G1 X77.105 Y91.287 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.287 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.287 E.02557
; LINE_WIDTH: 0.409258
G1 X77.105 Y85.287 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.287 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.287 E.02554
; LINE_WIDTH: 0.408878
M73 P46 R8
G1 X77.104 Y79.287 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.287 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00718
G1 X77.184 Y76.28 E.00576
; LINE_WIDTH: 0.403228
G1 X77.392 Y75.903 E.00542
; LINE_WIDTH: 0.404358
G1 X77.72 Y75.609 E.00556
; LINE_WIDTH: 0.408008
G1 X78.154 Y75.436 E.00595
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00329
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409298
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01787
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.652 J-1934.032 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.597 Y75.404 I.35 J-44.835 E.01569
; LINE_WIDTH: 0.406758
G1 X101.834 Y75.436 E.00304
; LINE_WIDTH: 0.403398
G1 X102.082 Y75.524 E.00331
; WIPE_START
G1 F12000
M204 S6000
G1 X102.207 Y75.569 E-.05051
G1 X102.515 Y75.8 E-.1464
G1 X102.768 Y76.145 E-.16248
G1 X102.893 Y76.646 E-.19634
G1 X102.894 Y76.7 E-.02037
G1 X102.894 Y77.184 E-.18391
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443728
G1 F2177
M204 S6000
G1 X98.402 Y75.825 E.0375
; LINE_WIDTH: 0.443848
G1 X94.402 Y75.825 E.05563
; LINE_WIDTH: 0.443978
G1 X90.402 Y75.825 E.05565
; LINE_WIDTH: 0.444108
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z3.8 F42000
G1 X101.099 Y104.175 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2177
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.506 Y96.782 Z3.8 F42000
G1 X82.242 Y80.152 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2177
M204 S6000
G1 X83.086 Y79.704 E.01348
G1 X83.31 Y80.126 E.00674
G1 X83.554 Y80.583 E.00731
G1 X82.71 Y81.032 E.01348
G1 X82.27 Y80.205 E.01321
M204 S250
G1 X81.677 Y79.98 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2177
M204 S5000
G1 X83.259 Y79.139 E.02352
G1 X83.509 Y79.609 E.00699
G1 X83.679 Y79.929 E.00477
G1 X83.858 Y80.265 E.00499
G1 X84.119 Y80.756 E.0073
G1 X82.537 Y81.597 E.02352
G1 X81.705 Y80.033 E.02327
; WIPE_START
G1 F5700
M204 S6000
G1 X83.259 Y79.139 E-.68114
G1 X83.356 Y79.322 E-.07887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.421 Y80.844 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.404488
G1 F2177
M204 S5000
G1 X79.516 Y80.646 E.00278
; LINE_WIDTH: 0.402688
G1 X79.723 Y80.463 E.00346
G1 X79.981 Y80.376 E.00342
; LINE_WIDTH: 0.402448
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398208
G1 X80.528 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.392728
G1 X80.505 Y81.606 E.00351
G1 X80.26 Y81.731 E.00337
; LINE_WIDTH: 0.390888
G1 X79.986 Y81.751 E.00334
; LINE_WIDTH: 0.388168
G1 X79.726 Y81.665 E.00331
G1 X79.52 Y81.484 E.00331
G1 X79.401 Y81.238 E.00331
; LINE_WIDTH: 0.404488
G1 X79.398 Y80.899 E.00428
; WIPE_START
G1 F12000
M204 S6000
G1 X79.516 Y80.646 E-.10628
G1 X79.723 Y80.463 E-.1047
G1 X79.981 Y80.376 E-.10357
G1 X80.289 Y80.404 E-.11749
G1 X80.528 Y80.541 E-.10472
G1 X80.696 Y80.76 E-.10486
G1 X80.766 Y81.03 E-.10599
G1 X80.759 Y81.062 E-.01239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.269 Y88.27 Z3.8 F42000
G1 X84.654 Y92.246 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2177
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2177
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.48
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 41/99
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2182
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.801 E.00308
; LINE_WIDTH: 0.405138
G1 X102.021 Y75.906 E.00441
G1 X102.316 Y76.154 E.00488
; LINE_WIDTH: 0.404858
G1 X102.458 Y76.428 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00351
; LINE_WIDTH: 0.407878
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413708
G1 X102.471 Y103.498 E.00291
G1 X102.346 Y103.8 E.00422
; LINE_WIDTH: 0.405738
G1 X102.05 Y104.078 E.00515
G1 X101.706 Y104.199 E.00463
; LINE_WIDTH: 0.417238
G1 X101.638 Y104.199 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
; LINE_WIDTH: 0.410388
G1 X78.206 Y104.18 E.00282
G1 X77.865 Y104.021 E.00482
; LINE_WIDTH: 0.404218
G1 X77.602 Y103.713 E.00511
; LINE_WIDTH: 0.404528
G1 X77.501 Y103.37 E.00452
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.276 E.02683
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.276 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.276 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.276 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.276 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.276 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.276 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.276 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.276 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.276 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.276 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.276 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.276 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00703
; LINE_WIDTH: 0.408598
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.404418
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.407618
G1 X78.01 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00535
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.796 E.01776
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.142 Y75.546 F42000
; LINE_WIDTH: 0.403398
G1 F2182
M204 S5000
G1 X102.207 Y75.569 E.00086
; LINE_WIDTH: 0.404248
G1 X102.537 Y75.82 E.00523
; LINE_WIDTH: 0.407748
G1 X102.783 Y76.184 E.0056
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407878
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408268
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.023 J.288 E.0095
; LINE_WIDTH: 0.404358
G1 X102.744 Y103.887 E.00589
; LINE_WIDTH: 0.414698
G1 X102.485 Y104.233 E.0056
G1 X102.245 Y104.411 E.00387
; LINE_WIDTH: 0.404248
G1 X101.884 Y104.553 E.0049
; LINE_WIDTH: 0.417238
G1 X101.6 Y104.591 E.00374
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J1938.107 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.273 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
; LINE_WIDTH: 0.410388
G1 X78.086 Y104.555 E.00437
G1 X77.663 Y104.352 E.00601
; LINE_WIDTH: 0.407328
G1 X77.347 Y104.04 E.00564
; LINE_WIDTH: 0.413428
G1 X77.157 Y103.636 E.00577
G1 X77.105 Y103.288 E.00455
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.288 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.288 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.288 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.288 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.288 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.288 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.288 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.288 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.288 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.288 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.288 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.288 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.413 I3.725 J-.282 E.01119
; LINE_WIDTH: 0.413018
G3 X77.456 Y75.832 I1.227 J.29 E.00863
; LINE_WIDTH: 0.403068
G1 X77.745 Y75.595 E.0047
; LINE_WIDTH: 0.408818
G1 X78.158 Y75.433 E.00566
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00323
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409298
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01786
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.652 J-1930.681 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.598 Y75.404 I.35 J-44.407 E.0157
; LINE_WIDTH: 0.406568
M73 P47 R8
G1 X101.834 Y75.436 E.00303
; LINE_WIDTH: 0.403398
G1 X102.086 Y75.526 E.00336
; WIPE_START
G1 F12000
M204 S6000
G1 X102.207 Y75.569 E-.04887
G1 X102.537 Y75.82 E-.15749
G1 X102.783 Y76.184 E-.16721
G1 X102.893 Y76.646 E-.18046
G1 X102.894 Y76.7 E-.02037
G1 X102.894 Y77.188 E-.18559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z3.88 F42000
G1 Z3.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443728
G1 F2182
M204 S6000
G1 X98.402 Y75.825 E.0375
; LINE_WIDTH: 0.443848
G1 X94.402 Y75.825 E.05563
; LINE_WIDTH: 0.443978
G1 X90.402 Y75.825 E.05565
; LINE_WIDTH: 0.444108
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z3.88 F42000
G1 X101.099 Y104.175 Z3.88
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2182
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.492 Y96.785 Z3.88 F42000
G1 X82.19 Y80.135 Z3.88
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2182
M204 S6000
G1 X83.101 Y79.651 E.01456
G1 X83.343 Y80.106 E.00728
G1 X83.606 Y80.6 E.00789
G1 X82.695 Y81.085 E.01456
G1 X82.218 Y80.188 E.01433
M204 S250
G1 X81.625 Y79.962 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2182
M204 S5000
G1 X83.274 Y79.086 E.02452
G1 X83.532 Y79.572 E.00723
G1 X83.712 Y79.91 E.00503
G1 X83.898 Y80.259 E.00519
G1 X84.171 Y80.773 E.00765
G1 X82.522 Y81.65 E.02452
G1 X81.653 Y80.015 E.02431
; WIPE_START
G1 F5700
M204 S6000
G1 X83.274 Y79.086 E-.71013
G1 X83.336 Y79.201 E-.04987
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.422 Y80.844 Z3.88 F42000
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.392908
G1 F2182
M204 S5000
G1 X79.537 Y80.621 E.00308
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00385
G1 X80.186 Y80.381 E.00501
; LINE_WIDTH: 0.395288
G1 X80.499 Y80.522 E.00423
; LINE_WIDTH: 0.413928
G1 X80.692 Y80.769 E.00405
G1 X80.763 Y81.033 E.00353
; LINE_WIDTH: 0.406648
G1 X80.759 Y81.132 E.00125
; LINE_WIDTH: 0.389428
G1 X80.677 Y81.393 E.00333
; LINE_WIDTH: 0.384948
G1 X80.502 Y81.603 E.00328
G1 X80.259 Y81.729 E.00328
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00327
G1 X79.521 Y81.483 E.00328
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392908
G1 X79.404 Y80.9 E.0038
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.11753
G1 X79.783 Y80.429 E-.11854
G1 X80.186 Y80.381 E-.15429
G1 X80.499 Y80.522 E-.13046
G1 X80.692 Y80.769 E-.1191
G1 X80.763 Y81.033 E-.10375
G1 X80.761 Y81.076 E-.01635
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.273 Y88.283 Z3.88 F42000
G1 X84.654 Y92.246 Z3.88
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2182
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.88 F42000
G1 Z3.48
G1 E.8 F1800
G1 F2182
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.88 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 42/99
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2205
M204 S5000
G1 X101.498 Y75.939 E.00396
G1 X101.688 Y75.801 E.00308
; LINE_WIDTH: 0.403038
G1 X101.935 Y75.866 E.00321
; LINE_WIDTH: 0.403958
G1 X102.22 Y76.049 E.00427
; LINE_WIDTH: 0.408468
G1 X102.431 Y76.354 E.00473
G1 X102.504 Y76.7 E.00451
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413708
G1 X102.472 Y103.498 E.0029
G1 X102.346 Y103.8 E.00423
; LINE_WIDTH: 0.405758
G1 X102.05 Y104.079 E.00515
G1 X101.71 Y104.198 E.00456
; LINE_WIDTH: 0.409718
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.058 Y104.13 E.00478
; LINE_WIDTH: 0.404648
G1 X77.735 Y103.905 E.00497
; LINE_WIDTH: 0.405168
G1 X77.542 Y103.572 E.00487
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00376
G1 X77.496 Y76.724 E.33881
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.406218
G1 X77.729 Y76.1 E.00445
G1 X77.957 Y75.917 E.00371
; LINE_WIDTH: 0.405928
G1 X78.33 Y75.8 E.00496
; LINE_WIDTH: 0.410268
G3 X80.42 Y75.798 I1.103 J42.362 E.02677
; LINE_WIDTH: 0.409778
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
M204 S250
G1 X102.147 Y75.548 F42000
; LINE_WIDTH: 0.411718
G1 F2205
M204 S5000
G1 X102.291 Y75.613 E.00203
; LINE_WIDTH: 0.413518
G1 X102.576 Y75.861 E.00488
G1 X102.783 Y76.184 E.00495
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.895 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.029 J.288 E.0095
; LINE_WIDTH: 0.404368
G1 X102.744 Y103.887 E.00589
; LINE_WIDTH: 0.414728
G1 X102.485 Y104.233 E.0056
G1 X102.301 Y104.375 E.00301
; LINE_WIDTH: 0.407998
G1 X101.89 Y104.557 E.00573
; LINE_WIDTH: 0.409718
G1 X101.6 Y104.594 E.00374
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1959.413 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.173 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
; LINE_WIDTH: 0.410108
G1 X78.115 Y104.558 E.00399
; LINE_WIDTH: 0.415088
G1 X77.735 Y104.406 E.0053
G1 X77.421 Y104.131 E.00542
; LINE_WIDTH: 0.404488
G1 X77.183 Y103.72 E.00599
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00558
G1 X77.104 Y76.724 E.33893
G1 X77.188 Y76.273 E.00585
; LINE_WIDTH: 0.402208
G1 X77.401 Y75.891 E.0055
; LINE_WIDTH: 0.401958
G1 X77.739 Y75.601 E.00558
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00544
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.655 J-1932.119 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.598 Y75.404 I.35 J-44.432 E.01571
; LINE_WIDTH: 0.407458
G1 X101.947 Y75.457 E.00449
; LINE_WIDTH: 0.411718
G1 X102.093 Y75.523 E.00206
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.613 E-.08279
G1 X102.576 Y75.861 E-.14367
G1 X102.783 Y76.184 E-.14571
G1 X102.893 Y76.646 E-.18037
G1 X102.894 Y76.7 E-.02044
G1 X102.894 Y77.192 E-.18702
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443708
G1 F2205
M204 S6000
G1 X98.402 Y75.825 E.03749
; LINE_WIDTH: 0.443828
G1 X94.402 Y75.825 E.05563
; LINE_WIDTH: 0.443958
G1 X90.402 Y75.825 E.05564
; LINE_WIDTH: 0.444088
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
M73 P48 R8
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z3.96 F42000
G1 X101.099 Y104.175 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2205
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.479 Y96.789 Z3.96 F42000
G1 X82.137 Y80.118 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2205
M204 S6000
G1 X83.116 Y79.598 E.01564
G1 X83.376 Y80.087 E.00782
G1 X83.658 Y80.618 E.00848
G1 X82.68 Y81.138 E.01564
G1 X82.166 Y80.171 E.01545
M204 S250
G1 X81.572 Y79.945 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2205
M204 S5000
G1 X83.289 Y79.033 E.02553
G1 X83.559 Y79.541 E.00756
G1 X83.745 Y79.891 E.00521
G1 X83.941 Y80.258 E.00546
G1 X84.224 Y80.79 E.00791
G1 X82.507 Y81.703 E.02553
G1 X81.601 Y79.998 E.02535
; WIPE_START
G1 F5700
M204 S6000
G1 X83.289 Y79.033 E-.73913
G1 X83.315 Y79.081 E-.02087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.137 Y80.458
G1 Z3.56
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.354998
G1 F2205
M204 S6000
G1 X82.957 Y80.119 E.00423
G1 X82.659 Y80.277 E.00372
G1 X82.839 Y80.617 E.00423
G1 X83.084 Y80.486 E.00306
; WIPE_START
G1 F18000
G1 X82.839 Y80.617 E-.15252
G1 X82.659 Y80.277 E-.211
G1 X82.957 Y80.119 E-.18546
G1 X83.137 Y80.458 E-.21101
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.428 Y80.833 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392888
G1 F2205
M204 S5000
G1 X79.537 Y80.621 E.00292
; LINE_WIDTH: 0.392388
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398468
G1 X80.766 Y81.03 E.00346
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.728 E.00332
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392888
G1 X79.404 Y80.887 E.00396
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.11308
G1 X79.751 Y80.449 E-.10439
G1 X80.016 Y80.374 E-.10445
G1 X80.289 Y80.403 E-.10456
G1 X80.529 Y80.541 E-.10492
G1 X80.696 Y80.76 E-.10488
G1 X80.766 Y81.03 E-.10591
G1 X80.755 Y81.076 E-.01782
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.271 Y88.282 Z3.96 F42000
G1 X84.654 Y92.246 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2205
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F2205
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 3.64
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/99
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.96 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z3.96
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2238
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.801 E.00308
; LINE_WIDTH: 0.405138
G1 X102.021 Y75.906 E.00441
; LINE_WIDTH: 0.405918
G1 X102.316 Y76.154 E.00488
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413968
G1 X102.471 Y103.501 E.00294
G1 X102.346 Y103.8 E.00419
; LINE_WIDTH: 0.410178
G1 X102.043 Y104.084 E.00532
G1 X101.715 Y104.196 E.00444
; LINE_WIDTH: 0.409048
G1 X101.634 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
G1 X78.143 Y104.162 E.00363
; LINE_WIDTH: 0.405678
G1 X77.821 Y103.989 E.00463
G1 X77.601 Y103.712 E.00448
; LINE_WIDTH: 0.406358
G1 X77.5 Y103.37 E.00453
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.282 I46.496 J-1.092 E.02676
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.282 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.282 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.282 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.282 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.282 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.282 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.282 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.282 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.282 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.282 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.282 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.282 E.02553
; LINE_WIDTH: 0.408628
G3 X77.496 Y76.7 I9.628 J-.28 E.00742
; LINE_WIDTH: 0.407088
G1 X77.551 Y76.403 E.00384
; LINE_WIDTH: 0.404368
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.407688
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00535
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.796 E.01776
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11727
G1 X101.688 Y75.801 E-.08928
G1 X102.021 Y75.906 E-.13253
G1 X102.316 Y76.154 E-.14648
G1 X102.457 Y76.428 E-.11709
G1 X102.504 Y76.7 E-.10494
G1 X102.504 Y76.838 E-.05241
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.171 Y75.556 Z4.04 F42000
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.403398
G1 F2238
M204 S5000
G1 X102.207 Y75.569 E.00049
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00486
; LINE_WIDTH: 0.410668
G1 X102.768 Y76.145 E.00548
G1 X102.893 Y76.646 E.00663
; LINE_WIDTH: 0.409528
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.031 J.288 E.0095
; LINE_WIDTH: 0.406838
G1 X102.758 Y103.859 E.00554
G1 X102.64 Y104.052 E.00287
; LINE_WIDTH: 0.404978
G1 X102.325 Y104.36 E.00557
; LINE_WIDTH: 0.411448
G1 X101.937 Y104.545 E.00552
G1 X101.6 Y104.594 E.00438
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J415.494 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.173 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X78.012 Y104.528 E.00533
; LINE_WIDTH: 0.405088
G1 X77.62 Y104.321 E.00561
; LINE_WIDTH: 0.403008
G1 X77.321 Y103.998 E.00554
; LINE_WIDTH: 0.408988
G1 X77.137 Y103.553 E.00614
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.291 E.00339
G1 X77.105 Y101.291 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.291 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.291 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.291 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.291 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.291 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.291 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.291 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.291 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.291 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.291 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.291 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.291 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.413 I3.743 J-.283 E.01123
; LINE_WIDTH: 0.412998
G3 X77.456 Y75.832 I1.228 J.29 E.00863
; LINE_WIDTH: 0.403088
G1 X77.745 Y75.595 E.0047
; LINE_WIDTH: 0.408938
G1 X78.158 Y75.433 E.00567
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00323
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01787
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.658 J-1933.568 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.599 Y75.404 I.35 J-44.589 E.01572
; LINE_WIDTH: 0.406558
G1 X101.835 Y75.436 E.00302
; LINE_WIDTH: 0.403398
G1 X102.114 Y75.536 E.00373
; WIPE_START
G1 F12000
M204 S6000
G1 X102.207 Y75.569 E-.03764
G1 X102.515 Y75.8 E-.14627
G1 X102.768 Y76.145 E-.16241
G1 X102.893 Y76.646 E-.19637
G1 X102.894 Y76.7 E-.02044
G1 X102.894 Y77.218 E-.19687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z4.04 F42000
G1 Z3.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443688
G1 F2238
M204 S6000
G1 X98.402 Y75.825 E.03749
; LINE_WIDTH: 0.443818
G1 X94.402 Y75.825 E.05563
; LINE_WIDTH: 0.443948
G1 X90.402 Y75.825 E.05564
; LINE_WIDTH: 0.444088
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z4.04 F42000
G1 X101.099 Y104.175 Z4.04
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2238
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
M73 P49 R8
G1 E-.04 F1800
M204 S10000
G1 X86.465 Y96.792 Z4.04 F42000
G1 X82.085 Y80.101 Z4.04
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2238
M204 S6000
G1 X83.131 Y79.545 E.01672
G1 X83.409 Y80.068 E.00836
G1 X83.711 Y80.635 E.00906
G1 X82.665 Y81.191 E.01672
G1 X82.113 Y80.154 E.01657
M204 S250
G1 X81.539 Y79.964 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2238
M204 S5000
G1 X81.52 Y79.928 E.00054
G1 X83.304 Y78.98 E.02653
G1 X83.58 Y79.499 E.00773
G1 X83.778 Y79.872 E.00554
G1 X83.982 Y80.255 E.00569
G1 X84.276 Y80.807 E.00822
G1 X82.492 Y81.756 E.02653
G1 X81.94 Y80.718 E.01543
G1 X81.752 Y80.365 E.00525
G1 X81.567 Y80.017 E.00517
; WIPE_START
G1 F7800
M204 S6000
G1 X81.52 Y79.928 E-.03836
G1 X83.197 Y79.037 E-.72164
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.04 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.164 Y80.467
G1 Z3.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.393158
G1 F2238
M204 S6000
G1 X82.964 Y80.092 E.00522
G1 X82.632 Y80.268 E.00461
G1 X82.832 Y80.644 E.00522
G1 X83.111 Y80.496 E.00387
; WIPE_START
G1 F18000
G1 X82.832 Y80.644 E-.15562
G1 X82.632 Y80.268 E-.20961
G1 X82.964 Y80.092 E-.18516
G1 X83.164 Y80.467 E-.20961
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.415 Y80.891 Z4.04 F42000
G1 Z3.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2238
M204 S5000
G1 X79.494 Y80.683 E.00267
; LINE_WIDTH: 0.392868
G1 X79.74 Y80.458 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399168
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398248
G1 X80.583 Y81.536 E.00343
G1 X80.358 Y81.696 E.00343
; LINE_WIDTH: 0.393168
G1 X80 Y81.75 E.00443
; LINE_WIDTH: 0.387528
G1 X79.727 Y81.663 E.00346
; LINE_WIDTH: 0.384968
G1 X79.521 Y81.483 E.00327
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.394 Y80.947 E.00021
; WIPE_START
G1 F12000
M204 S6000
G1 X79.494 Y80.683 E-.10733
G1 X79.74 Y80.458 E-.12692
G1 X80.016 Y80.374 E-.10947
G1 X80.289 Y80.403 E-.10447
G1 X80.529 Y80.541 E-.10499
G1 X80.696 Y80.76 E-.10479
G1 X80.763 Y81.02 E-.10203
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.263 Y88.232 Z4.04 F42000
G1 X84.654 Y92.246 Z4.04
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2238
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.04 F42000
G1 Z3.64
G1 E.8 F1800
G1 F2238
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/99
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.04 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z4.04
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2244
M204 S5000
G1 X101.498 Y75.939 E.00396
G1 X101.688 Y75.801 E.00309
; LINE_WIDTH: 0.405138
G1 X102.021 Y75.906 E.00441
; LINE_WIDTH: 0.405908
G1 X102.316 Y76.154 E.00489
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.414188
G1 X102.47 Y103.503 E.00297
G1 X102.346 Y103.8 E.00417
; LINE_WIDTH: 0.410158
G1 X102.043 Y104.084 E.00532
G1 X101.715 Y104.196 E.00444
; LINE_WIDTH: 0.409028
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.145 Y104.162 E.00361
; LINE_WIDTH: 0.406818
G1 X77.83 Y103.996 E.00452
G1 X77.59 Y103.69 E.00494
; LINE_WIDTH: 0.404518
G1 X77.501 Y103.37 E.0042
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.276 E.02683
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.276 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.276 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.276 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.276 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.276 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.276 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.276 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.276 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.276 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.276 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.276 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.276 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00703
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413888
G1 X77.612 Y76.279 E.00179
G1 X77.728 Y76.1 E.00276
; LINE_WIDTH: 0.407338
G1 X78.01 Y75.89 E.00446
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410258
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.409768
G1 X82.425 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.1173
G1 X101.688 Y75.801 E-.0893
G1 X102.021 Y75.906 E-.13248
G1 X102.316 Y76.154 E-.14656
G1 X102.457 Y76.428 E-.11704
G1 X102.504 Y76.7 E-.10497
G1 X102.504 Y76.838 E-.05236
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.174 Y75.557 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.403398
G1 F2244
M204 S5000
G1 X102.207 Y75.569 E.00044
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.410648
G1 X102.768 Y76.145 E.00548
G1 X102.893 Y76.646 E.00662
; LINE_WIDTH: 0.409538
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.026 J.288 E.0095
; LINE_WIDTH: 0.408478
G1 X102.761 Y103.858 E.00554
; LINE_WIDTH: 0.415778
G1 X102.53 Y104.188 E.00524
G1 X102.325 Y104.36 E.00348
; LINE_WIDTH: 0.411418
G1 X101.937 Y104.545 E.00552
G1 X101.6 Y104.594 E.00437
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J413.652 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.273 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.063 Y104.546 E.00465
; LINE_WIDTH: 0.406818
G1 X77.622 Y104.326 E.00627
; LINE_WIDTH: 0.408448
G1 X77.324 Y104.01 E.00553
; LINE_WIDTH: 0.412798
G1 X77.157 Y103.636 E.00528
G1 X77.105 Y103.288 E.00455
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.288 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.288 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.288 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.288 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.288 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.288 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.288 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.288 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.288 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.288 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.288 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.288 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00719
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.378 Y75.917 E.00528
; LINE_WIDTH: 0.407278
G1 X77.695 Y75.623 E.00549
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00522
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410258
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.658 J-1933.578 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.6 Y75.404 I.35 J-44.417 E.01573
; LINE_WIDTH: 0.406498
G1 X101.835 Y75.436 E.00301
; LINE_WIDTH: 0.403398
G1 X102.117 Y75.537 E.00378
; WIPE_START
G1 F12000
M204 S6000
G1 X102.207 Y75.569 E-.0362
G1 X102.515 Y75.8 E-.14633
G1 X102.768 Y76.145 E-.16246
G1 X102.893 Y76.646 E-.19628
G1 X102.894 Y76.7 E-.02047
G1 X102.894 Y77.222 E-.19826
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443678
G1 F2244
M204 S6000
G1 X98.402 Y75.825 E.03749
; LINE_WIDTH: 0.443808
G1 X94.402 Y75.825 E.05563
; LINE_WIDTH: 0.443948
G1 X90.402 Y75.825 E.05564
; LINE_WIDTH: 0.444088
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z4.12 F42000
G1 X101.099 Y104.175 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2244
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.451 Y96.796 Z4.12 F42000
G1 X82.033 Y80.084 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2244
M204 S6000
M73 P50 R8
G1 X83.146 Y79.492 E.01779
G1 X83.442 Y80.049 E.0089
G1 X83.763 Y80.652 E.00964
G1 X82.65 Y81.244 E.01779
G1 X82.061 Y80.137 E.01769
M204 S250
G1 X81.509 Y79.99 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2244
M204 S5000
G1 X81.468 Y79.911 E.00117
G1 X83.319 Y78.927 E.02753
G1 X83.608 Y79.471 E.00809
G1 X83.811 Y79.852 E.00568
G1 X84.023 Y80.251 E.00593
G1 X84.328 Y80.825 E.00852
G1 X82.477 Y81.809 E.02753
G1 X81.924 Y80.768 E.01548
G1 X81.736 Y80.415 E.00525
G1 X81.538 Y80.043 E.00554
; WIPE_START
G1 F7800
M204 S6000
G1 X81.468 Y79.911 E-.05659
G1 X83.102 Y79.042 E-.70341
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.19 Y80.477
G1 Z3.72
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.431318
G1 F2244
M204 S6000
G1 X82.971 Y80.064 E.0063
G1 X82.606 Y80.259 E.00559
G1 X82.825 Y80.671 E.0063
G1 X83.137 Y80.505 E.00478
; WIPE_START
G1 F18000
G1 X82.825 Y80.671 E-.15814
G1 X82.606 Y80.259 E-.20846
G1 X82.971 Y80.064 E-.18494
G1 X83.19 Y80.477 E-.20846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.431 Y80.827 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392868
G1 F2244
M204 S5000
G1 X79.537 Y80.621 E.00283
; LINE_WIDTH: 0.392408
G1 X79.751 Y80.449 E.00337
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398468
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.728 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.881 E.00405
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.11057
G1 X79.751 Y80.449 E-.10455
G1 X80.016 Y80.374 E-.1044
G1 X80.289 Y80.403 E-.10451
G1 X80.529 Y80.541 E-.10492
G1 X80.696 Y80.76 E-.1048
G1 X80.766 Y81.03 E-.10601
G1 X80.754 Y81.082 E-.02023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.271 Y88.287 Z4.12 F42000
G1 X84.654 Y92.246 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2244
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F2244
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/99
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.12 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z4.12
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2252
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.802 E.00309
; LINE_WIDTH: 0.405128
G1 X102.021 Y75.906 E.00441
; LINE_WIDTH: 0.405238
G1 X102.316 Y76.154 E.00487
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00556
; LINE_WIDTH: 0.403938
G1 X102.087 Y104.057 E.00533
; LINE_WIDTH: 0.403688
G1 X101.71 Y104.198 E.00507
; LINE_WIDTH: 0.409768
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406588
G1 X77.633 Y103.771 E.00542
; LINE_WIDTH: 0.407178
G1 X77.5 Y103.37 E.00537
; LINE_WIDTH: 0.410278
G3 X77.498 Y101.285 I56.606 J-1.09 E.02671
; LINE_WIDTH: 0.410148
G1 X77.498 Y99.285 E.02562
; LINE_WIDTH: 0.410018
G1 X77.498 Y97.285 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.285 E.0256
; LINE_WIDTH: 0.409768
G1 X77.497 Y93.285 E.02559
; LINE_WIDTH: 0.409638
G1 X77.497 Y91.285 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.285 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.285 E.02557
; LINE_WIDTH: 0.409258
G1 X77.497 Y85.285 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.285 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.285 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.285 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.285 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00716
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.405278
G1 X77.729 Y76.1 E.00444
; LINE_WIDTH: 0.407538
G1 X78 Y75.891 E.00435
; LINE_WIDTH: 0.410268
G1 X78.415 Y75.798 E.00545
G1 X80.415 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.415 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.415 Y75.796 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.796 E.01779
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11716
G1 X101.688 Y75.802 E-.08929
G1 X102.021 Y75.906 E-.13253
G1 X102.316 Y76.154 E-.14637
G1 X102.457 Y76.428 E-.11714
G1 X102.504 Y76.7 E-.10496
G1 X102.504 Y76.838 E-.05257
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.178 Y75.559 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.403388
G1 F2252
M204 S5000
G1 X102.207 Y75.569 E.00039
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00486
; LINE_WIDTH: 0.409298
G1 X102.78 Y76.172 E.00584
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00623
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.415178
G1 X102.82 Y103.711 E.00497
G1 X102.636 Y104.066 E.00519
; LINE_WIDTH: 0.408458
G1 X102.3 Y104.376 E.00582
; LINE_WIDTH: 0.408068
G1 X101.89 Y104.557 E.00572
; LINE_WIDTH: 0.409768
G1 X101.6 Y104.594 E.00374
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.654 J1965.969 E.08537
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.637 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
M73 P50 R7
G1 X78.184 Y104.566 E.00234
; LINE_WIDTH: 0.406588
G1 X77.778 Y104.426 E.00544
; LINE_WIDTH: 0.415278
G1 X77.466 Y104.186 E.00512
G1 X77.259 Y103.895 E.00463
; LINE_WIDTH: 0.408008
G1 X77.138 Y103.548 E.00468
; LINE_WIDTH: 0.410278
G1 X77.105 Y103.292 E.00331
G1 X77.105 Y101.292 E.02563
; LINE_WIDTH: 0.410148
G1 X77.105 Y99.292 E.02562
; LINE_WIDTH: 0.410018
G1 X77.105 Y97.292 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.292 E.0256
; LINE_WIDTH: 0.409768
G1 X77.105 Y93.292 E.02559
; LINE_WIDTH: 0.409638
G1 X77.105 Y91.292 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.292 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.292 E.02557
; LINE_WIDTH: 0.409258
G1 X77.105 Y85.292 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.292 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.292 E.02554
; LINE_WIDTH: 0.408878
G1 X77.104 Y79.292 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.292 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.413 I3.749 J-.284 E.01125
; LINE_WIDTH: 0.413128
G3 X77.453 Y75.831 I1.265 J.304 E.00861
; LINE_WIDTH: 0.407538
G1 X77.823 Y75.547 E.00594
G1 X78.161 Y75.435 E.00453
; LINE_WIDTH: 0.410268
G1 X78.407 Y75.405 E.00318
G1 X80.407 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.407 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.407 Y75.405 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.404 E.01788
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.661 J-1931.675 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.6 Y75.404 I.35 J-45.224 E.01574
; LINE_WIDTH: 0.406728
G1 X101.834 Y75.436 E.00299
; LINE_WIDTH: 0.403388
G1 X102.121 Y75.538 E.00384
; WIPE_START
G1 F12000
M204 S6000
G1 X102.207 Y75.569 E-.03472
G1 X102.515 Y75.8 E-.14621
G1 X102.78 Y76.172 E-.1736
G1 X102.893 Y76.646 E-.18521
G1 X102.894 Y76.7 E-.02046
G1 X102.894 Y77.226 E-.1998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443658
G1 F2252
M204 S6000
G1 X98.402 Y75.825 E.03749
; LINE_WIDTH: 0.443788
G1 X94.402 Y75.825 E.05562
; LINE_WIDTH: 0.443928
G1 X90.402 Y75.825 E.05564
; LINE_WIDTH: 0.444068
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z4.2 F42000
G1 X86.402 Y104.174 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2252
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.68 Y97.952 Z4.2 F42000
G1 X81.98 Y80.067 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2252
M204 S6000
G1 X83.161 Y79.439 E.01887
G1 X83.475 Y80.029 E.00943
G1 X83.815 Y80.669 E.01022
G1 X82.635 Y81.297 E.01887
G1 X82.009 Y80.12 E.01881
M204 S250
G1 X81.478 Y80.012 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2252
M204 S5000
G1 X81.415 Y79.894 E.00176
G1 X83.334 Y78.874 E.02853
G1 X83.639 Y79.448 E.00854
G1 X83.844 Y79.833 E.00573
G1 X84.06 Y80.239 E.00603
G1 X84.381 Y80.842 E.00897
G1 X82.462 Y81.862 E.02853
G1 X81.913 Y80.83 E.01535
G1 X81.725 Y80.477 E.00525
G1 X81.506 Y80.065 E.00612
; WIPE_START
G1 F7800
M204 S6000
G1 X81.415 Y79.894 E-.07366
M73 P51 R7
G1 X83.01 Y79.046 E-.68634
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.217 Y80.486
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.469498
G1 F2252
M204 S6000
G1 X82.978 Y80.037 E.00749
G1 X82.579 Y80.25 E.00667
G1 X82.818 Y80.698 E.00749
G1 X83.164 Y80.514 E.00578
; WIPE_START
G1 F18000
G1 X82.818 Y80.698 E-.16024
G1 X82.579 Y80.25 E-.20751
G1 X82.978 Y80.037 E-.18474
G1 X83.217 Y80.486 E-.20751
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.449 Y80.784 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392328
G1 F2252
M204 S5000
G1 X79.537 Y80.621 E.00226
; LINE_WIDTH: 0.392428
G1 X79.751 Y80.449 E.00336
; LINE_WIDTH: 0.415308
G1 X80.056 Y80.376 E.00406
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405148
G1 X80.529 Y80.545 E.00429
; LINE_WIDTH: 0.405428
G1 X80.696 Y80.768 E.00353
G1 X80.763 Y81.03 E.00343
; LINE_WIDTH: 0.405288
G1 X80.749 Y81.193 E.00207
; LINE_WIDTH: 0.396888
G1 X80.581 Y81.54 E.00477
G1 X80.275 Y81.725 E.00443
; LINE_WIDTH: 0.392968
G1 X79.986 Y81.75 E.00355
; LINE_WIDTH: 0.384928
G1 X79.703 Y81.651 E.0036
; LINE_WIDTH: 0.392888
G1 X79.471 Y81.41 E.00409
G1 X79.38 Y81.137 E.00353
; LINE_WIDTH: 0.392328
G1 X79.407 Y80.863 E.00336
G1 X79.421 Y80.837 E.00037
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.09305
G1 X79.751 Y80.449 E-.10451
G1 X80.056 Y80.376 E-.11887
G1 X80.227 Y80.39 E-.06524
G1 X80.529 Y80.545 E-.12891
G1 X80.696 Y80.768 E-.10601
G1 X80.763 Y81.03 E-.10293
G1 X80.754 Y81.136 E-.04049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.282 Y88.338 Z4.2 F42000
G1 X84.654 Y92.246 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2252
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F2252
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/99
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.2 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z4.2
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2258
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.802 E.00309
; LINE_WIDTH: 0.403198
G1 X101.935 Y75.866 E.0032
; LINE_WIDTH: 0.403948
G1 X102.218 Y76.048 E.00425
; LINE_WIDTH: 0.406338
G1 X102.43 Y76.354 E.00472
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.03299
; LINE_WIDTH: 0.414188
G1 X102.47 Y103.503 E.00297
G1 X102.346 Y103.8 E.00417
; LINE_WIDTH: 0.408128
G1 X102.049 Y104.081 E.00521
G1 X101.715 Y104.196 E.00451
; LINE_WIDTH: 0.409048
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
G1 X78.14 Y104.161 E.00367
; LINE_WIDTH: 0.410668
G1 X77.78 Y103.95 E.00536
G1 X77.59 Y103.69 E.00413
; LINE_WIDTH: 0.410288
G1 X77.498 Y103.282 E.00536
G1 X77.498 Y101.282 E.02563
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.282 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.282 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.282 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.282 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.282 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.282 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.282 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.282 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.282 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.282 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.282 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.282 E.02553
; LINE_WIDTH: 0.408628
G3 X77.496 Y76.7 I9.63 J-.28 E.00743
; LINE_WIDTH: 0.407088
G1 X77.551 Y76.403 E.00384
; LINE_WIDTH: 0.404318
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.407698
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.418 Y75.798 E.00536
G1 X80.418 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.418 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.418 Y75.796 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.796 E.01775
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11717
G1 X101.688 Y75.802 E-.08932
G1 X101.935 Y75.866 E-.09677
G1 X102.218 Y76.048 E-.12798
G1 X102.43 Y76.354 E-.14154
G1 X102.504 Y76.7 E-.13447
G1 X102.504 Y76.839 E-.05276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.201 Y75.572 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.411598
G1 F2258
M204 S5000
G1 X102.291 Y75.613 E.00127
G1 X102.499 Y75.784 E.00346
; LINE_WIDTH: 0.406828
G1 X102.768 Y76.15 E.00576
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00655
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.027 J.288 E.0095
; LINE_WIDTH: 0.408458
G1 X102.761 Y103.858 E.00554
G1 X102.64 Y104.05 E.0029
; LINE_WIDTH: 0.403918
G1 X102.33 Y104.359 E.00551
; LINE_WIDTH: 0.411148
G1 X101.936 Y104.545 E.00559
G1 X101.6 Y104.594 E.00436
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.502 J414.891 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.274 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X78.012 Y104.528 E.00534
; LINE_WIDTH: 0.405028
G1 X77.602 Y104.308 E.00588
; LINE_WIDTH: 0.404338
G1 X77.309 Y103.98 E.00556
; LINE_WIDTH: 0.408908
G1 X77.135 Y103.547 E.00596
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.291 E.00331
G1 X77.105 Y101.291 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.291 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.291 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.291 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.291 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.291 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.291 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.291 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.291 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.291 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.291 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.291 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.291 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.413 I3.743 J-.283 E.01123
; LINE_WIDTH: 0.412998
G3 X77.457 Y75.832 I1.23 J.291 E.00864
; LINE_WIDTH: 0.403158
G1 X77.745 Y75.595 E.0047
; LINE_WIDTH: 0.409078
G1 X78.158 Y75.433 E.00566
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00324
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.404 E.01786
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.661 J-1931.675 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.601 Y75.404 I.35 J-45.318 E.01575
; LINE_WIDTH: 0.407528
G1 X101.947 Y75.457 E.00445
; LINE_WIDTH: 0.411598
G1 X102.146 Y75.547 E.00281
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.613 E-.06048
G1 X102.499 Y75.784 E-.1023
G1 X102.768 Y76.15 E-.17243
G1 X102.893 Y76.646 E-.19452
G1 X102.894 Y76.7 E-.0205
G1 X102.894 Y77.252 E-.20976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443638
G1 F2258
M204 S6000
G1 X98.402 Y75.825 E.03749
; LINE_WIDTH: 0.443778
G1 X94.402 Y75.825 E.05562
; LINE_WIDTH: 0.443918
G1 X90.402 Y75.825 E.05564
; LINE_WIDTH: 0.444068
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z4.28 F42000
G1 X101.099 Y104.175 Z4.28
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2258
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.424 Y96.803 Z4.28 F42000
G1 X81.928 Y80.05 Z4.28
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2258
M204 S6000
G1 X83.176 Y79.386 E.01995
G1 X83.508 Y80.01 E.00997
G1 X83.868 Y80.686 E.0108
G1 X82.619 Y81.35 E.01995
G1 X81.956 Y80.103 E.01993
M204 S250
G1 X81.449 Y80.038 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2258
M204 S5000
G1 X81.363 Y79.877 E.0024
G1 X83.349 Y78.821 E.02954
G1 X83.655 Y79.396 E.00855
G1 X83.877 Y79.814 E.00622
G1 X84.107 Y80.246 E.00643
G1 X84.433 Y80.859 E.00911
G1 X82.447 Y81.915 E.02954
G1 X81.896 Y80.879 E.01541
G1 X81.708 Y80.525 E.00525
G1 X81.477 Y80.091 E.00646
; WIPE_START
G1 F7800
M204 S6000
G1 X81.363 Y79.877 E-.09214
G1 X82.915 Y79.052 E-.66786
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.28 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.243 Y80.495
G1 Z3.88
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.507662
G1 F2258
M204 S6000
G1 X82.986 Y80.01 E.00878
G1 X82.552 Y80.24 E.00784
G1 X82.81 Y80.725 E.00878
G1 X83.19 Y80.523 E.00688
; WIPE_START
G1 F18000
G1 X82.81 Y80.725 E-.16359
G1 X82.552 Y80.24 E-.20873
G1 X82.986 Y80.01 E-.18639
G1 X83.234 Y80.478 E-.20129
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.422 Y80.868 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392828
G1 F2258
M204 S5000
G1 X79.53 Y80.633 E.00316
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392348
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00343
M73 P52 R7
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00346
G1 X80.726 Y81.3 E.00339
; LINE_WIDTH: 0.398208
G1 X80.514 Y81.595 E.00451
; LINE_WIDTH: 0.392388
G1 X80.259 Y81.728 E.00352
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392828
G1 X79.397 Y80.922 E.0002
; WIPE_START
G1 F12000
M204 S6000
G1 X79.53 Y80.633 E-.12083
G1 X79.751 Y80.449 E-.10944
G1 X80.016 Y80.374 E-.1044
G1 X80.289 Y80.403 E-.10455
G1 X80.529 Y80.541 E-.10491
G1 X80.696 Y80.76 E-.10486
G1 X80.766 Y81.03 E-.1059
G1 X80.764 Y81.043 E-.0051
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.268 Y88.253 Z4.28 F42000
G1 X84.654 Y92.246 Z4.28
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2258
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F2258
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 3.96
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/99
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.28 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z4.28
G1 Z3.96
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2265
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.801 E.00309
; LINE_WIDTH: 0.403008
G1 X101.934 Y75.866 E.0032
; LINE_WIDTH: 0.403968
G1 X102.218 Y76.047 E.00425
; LINE_WIDTH: 0.406358
G1 X102.43 Y76.354 E.00473
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.414178
G1 X102.47 Y103.503 E.00297
G1 X102.346 Y103.8 E.00417
; LINE_WIDTH: 0.410048
G1 X102.043 Y104.084 E.00532
G1 X101.715 Y104.196 E.00444
; LINE_WIDTH: 0.409038
G1 X101.634 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
; LINE_WIDTH: 0.410968
G1 X78.21 Y104.179 E.00277
G1 X77.864 Y104.022 E.00488
; LINE_WIDTH: 0.406368
G1 X77.6 Y103.711 E.00518
; LINE_WIDTH: 0.405478
G1 X77.501 Y103.37 E.00449
; LINE_WIDTH: 0.410298
G1 X77.498 Y101.276 E.02683
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.276 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.276 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.276 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.276 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.276 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.276 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.276 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.276 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.276 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.276 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.276 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.276 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00703
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413568
G1 X77.61 Y76.283 E.00172
G1 X77.755 Y76.075 E.00328
; LINE_WIDTH: 0.411198
G1 X78.01 Y75.89 E.00404
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.409768
G1 X82.425 Y75.797 E.02559
; LINE_WIDTH: 0.409278
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11727
G1 X101.688 Y75.801 E-.08935
G1 X101.934 Y75.866 E-.09668
G1 X102.218 Y76.047 E-.12795
G1 X102.43 Y76.354 E-.14172
G1 X102.504 Y76.7 E-.13442
G1 X102.504 Y76.838 E-.05261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.204 Y75.574 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
; LINE_WIDTH: 0.411578
G1 F2265
M204 S5000
G1 X102.291 Y75.613 E.00123
G1 X102.499 Y75.784 E.00345
; LINE_WIDTH: 0.406838
G1 X102.768 Y76.15 E.00577
; LINE_WIDTH: 0.409548
G1 X102.893 Y76.646 E.00654
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.441 I-4.024 J.288 E.0095
; LINE_WIDTH: 0.408458
G1 X102.761 Y103.858 E.00554
; LINE_WIDTH: 0.415858
G1 X102.53 Y104.188 E.00524
G1 X102.324 Y104.361 E.00349
; LINE_WIDTH: 0.411428
G1 X101.937 Y104.545 E.00551
G1 X101.6 Y104.594 E.00438
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J413.394 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.273 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
; LINE_WIDTH: 0.410968
G1 X78.088 Y104.555 E.00435
G1 X77.649 Y104.347 E.00624
; LINE_WIDTH: 0.405928
G1 X77.346 Y104.034 E.00552
; LINE_WIDTH: 0.413558
G1 X77.157 Y103.637 E.00569
G1 X77.105 Y103.288 E.00455
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.288 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.288 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.288 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.288 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.288 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.288 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.288 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.288 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.288 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.288 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.288 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.288 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00719
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403918
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408238
G1 X77.697 Y75.619 E.00538
; LINE_WIDTH: 0.412798
G1 X78.064 Y75.457 E.00517
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.661 J-1928.323 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.602 Y75.404 I.35 J-44.811 E.01576
; LINE_WIDTH: 0.407488
G1 X101.947 Y75.457 E.00444
; LINE_WIDTH: 0.411578
G1 X102.15 Y75.549 E.00286
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.613 E-.05911
G1 X102.499 Y75.784 E-.10212
G1 X102.768 Y76.15 E-.17277
G1 X102.893 Y76.646 E-.19429
G1 X102.894 Y76.7 E-.02051
G1 X102.894 Y77.256 E-.2112
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443638
G1 F2265
M204 S6000
G1 X98.402 Y75.825 E.03749
; LINE_WIDTH: 0.443778
G1 X94.402 Y75.825 E.05562
; LINE_WIDTH: 0.443918
G1 X90.402 Y75.825 E.05564
; LINE_WIDTH: 0.444068
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z4.36 F42000
G1 X101.099 Y104.175 Z4.36
G1 Z3.96
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2265
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.41 Y96.807 Z4.36 F42000
G1 X81.876 Y80.032 Z4.36
G1 Z3.96
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2265
M204 S6000
G1 X83.192 Y79.333 E.02102
G1 X83.541 Y79.991 E.01051
G1 X83.92 Y80.703 E.01138
G1 X82.604 Y81.403 E.02102
G1 X81.904 Y80.085 E.02105
M204 S250
G1 X81.418 Y80.061 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2265
M204 S5000
G1 X81.311 Y79.86 E.00299
G1 X83.364 Y78.768 E.03054
G1 X83.688 Y79.377 E.00906
G1 X83.91 Y79.795 E.00621
G1 X84.144 Y80.235 E.00655
G1 X84.485 Y80.876 E.00953
G1 X82.432 Y81.968 E.03054
G1 X81.886 Y80.941 E.01527
G1 X81.698 Y80.588 E.00525
G1 X81.446 Y80.114 E.00706
; WIPE_START
G1 F7800
M204 S6000
G1 X81.311 Y79.86 E-.10925
G1 X82.823 Y79.056 E-.65075
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.36 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.27 Y80.504
G1 Z3.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.545828
G1 F2265
M204 S6000
G1 X82.993 Y79.983 E.01018
G1 X82.526 Y80.231 E.00911
G1 X82.803 Y80.753 E.01018
G1 X83.217 Y80.533 E.00808
; WIPE_START
G1 F17024.174
G1 X82.803 Y80.753 E-.17809
G1 X82.526 Y80.231 E-.22439
G1 X82.993 Y79.983 E-.20089
G1 X83.186 Y80.347 E-.15663
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.434 Y80.818 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.404468
G1 F2265
M204 S5000
G1 X79.516 Y80.646 E.00241
; LINE_WIDTH: 0.402708
G1 X79.723 Y80.463 E.00346
G1 X79.981 Y80.376 E.00343
; LINE_WIDTH: 0.402428
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398208
G1 X80.529 Y80.541 E.00343
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.00346
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.392728
G1 X80.505 Y81.606 E.00352
G1 X80.26 Y81.731 E.00336
; LINE_WIDTH: 0.390868
G1 X79.986 Y81.751 E.00334
; LINE_WIDTH: 0.388228
G1 X79.726 Y81.665 E.00332
G1 X79.52 Y81.484 E.00331
G1 X79.401 Y81.238 E.00331
; LINE_WIDTH: 0.404468
G1 X79.398 Y80.894 E.00434
G1 X79.408 Y80.872 E.0003
; WIPE_START
G1 F12000
M204 S6000
G1 X79.516 Y80.646 E-.09547
G1 X79.723 Y80.463 E-.10468
G1 X79.981 Y80.376 E-.1036
G1 X80.289 Y80.404 E-.11735
G1 X80.529 Y80.541 E-.10487
G1 X80.696 Y80.76 E-.10488
G1 X80.766 Y81.03 E-.10592
G1 X80.752 Y81.09 E-.02323
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.272 Y88.294 Z4.36 F42000
G1 X84.654 Y92.246 Z4.36
G1 Z3.96
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2265
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
M73 P53 R7
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
G1 F2265
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/99
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.36 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z4.36
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2277
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.801 E.00309
; LINE_WIDTH: 0.403008
G1 X101.935 Y75.866 E.0032
; LINE_WIDTH: 0.403958
G1 X102.218 Y76.047 E.00424
; LINE_WIDTH: 0.406408
G1 X102.43 Y76.354 E.00474
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407798
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407928
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408058
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408188
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408568
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408698
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.501 Y103.335 E.03368
G1 X102.377 Y103.755 E.00561
; LINE_WIDTH: 0.401588
G1 X102.07 Y104.067 E.00548
; LINE_WIDTH: 0.406448
G1 X101.693 Y104.2 E.00508
; LINE_WIDTH: 0.410118
G1 X101.641 Y104.196 E.00066
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00259
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406568
G1 X77.629 Y103.768 E.00548
; LINE_WIDTH: 0.406438
G1 X77.5 Y103.37 E.00531
; LINE_WIDTH: 0.410298
G3 X77.498 Y101.282 I47.142 J-1.092 E.02675
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.282 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.282 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.282 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.282 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.282 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.282 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.282 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.282 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.282 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.282 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.282 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.282 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.00712
G1 X77.551 Y76.403 E.00417
; LINE_WIDTH: 0.411208
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.89 E.00404
; LINE_WIDTH: 0.404538
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409768
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409278
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11727
G1 X101.688 Y75.801 E-.08938
G1 X101.935 Y75.866 E-.09677
G1 X102.218 Y76.047 E-.12771
G1 X102.43 Y76.354 E-.14182
G1 X102.504 Y76.7 E-.13431
G1 X102.504 Y76.838 E-.05274
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.208 Y75.575 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.411568
G1 F2277
M204 S5000
G1 X102.291 Y75.613 E.00118
G1 X102.498 Y75.784 E.00345
; LINE_WIDTH: 0.406858
G1 X102.769 Y76.151 E.00579
; LINE_WIDTH: 0.409498
G1 X102.893 Y76.646 E.00653
G1 X102.894 Y76.7 E.00068
; LINE_WIDTH: 0.407798
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407928
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408058
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408188
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408568
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408698
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.414878
G1 X102.821 Y103.706 E.0049
G1 X102.682 Y103.995 E.00415
; LINE_WIDTH: 0.409108
G1 X102.399 Y104.31 E.00542
; LINE_WIDTH: 0.414418
G1 X102.033 Y104.516 E.00544
G1 X101.6 Y104.595 E.0057
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.589 I-4.635 J1727.479 E.08536
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.636 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.415258
G1 X77.963 Y104.514 E.00532
G1 X77.616 Y104.32 E.00516
; LINE_WIDTH: 0.404328
G1 X77.303 Y103.974 E.00588
; LINE_WIDTH: 0.409448
G1 X77.135 Y103.552 E.00581
; LINE_WIDTH: 0.410298
G1 X77.105 Y103.291 E.00336
G1 X77.105 Y101.291 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.291 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.291 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.291 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.291 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.291 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.291 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.291 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.291 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.291 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.291 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.291 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.291 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00723
G1 X77.181 Y76.285 E.00569
; LINE_WIDTH: 0.403918
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408228
G1 X77.697 Y75.619 E.00538
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.664 J-1929.766 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.603 Y75.404 I.35 J-44.897 E.01576
; LINE_WIDTH: 0.407488
G1 X101.947 Y75.457 E.00444
; LINE_WIDTH: 0.411568
G1 X102.153 Y75.55 E.00291
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.613 E-.05766
G1 X102.498 Y75.784 E-.10203
G1 X102.769 Y76.151 E-.17318
G1 X102.893 Y76.646 E-.19405
G1 X102.894 Y76.7 E-.02029
G1 X102.894 Y77.26 E-.21278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443608
G1 F2277
M204 S6000
G1 X98.402 Y75.825 E.03749
; LINE_WIDTH: 0.443758
G1 X94.402 Y75.825 E.05562
; LINE_WIDTH: 0.443908
G1 X90.402 Y75.825 E.05564
; LINE_WIDTH: 0.444068
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z4.44 F42000
G1 X86.402 Y104.174 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2277
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443518
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443828
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443978
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444128
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444288
G1 X101.099 Y104.175 E.02784
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.659 Y97.966 Z4.44 F42000
G1 X81.823 Y80.015 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2277
M204 S6000
G1 X83.207 Y79.28 E.0221
G1 X83.574 Y79.971 E.01105
G1 X83.972 Y80.72 E.01197
G1 X82.589 Y81.456 E.0221
G1 X81.852 Y80.068 E.02217
M204 S250
G1 X81.388 Y80.087 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2277
M204 S5000
G1 X81.258 Y79.843 E.00363
G1 X83.379 Y78.715 E.03154
G1 X83.707 Y79.332 E.00918
G1 X83.943 Y79.775 E.0066
G1 X84.188 Y80.236 E.00685
G1 X84.538 Y80.893 E.00977
G1 X82.417 Y82.021 E.03154
G1 X81.863 Y80.98 E.01548
G1 X81.675 Y80.626 E.00525
G1 X81.416 Y80.14 E.00723
; WIPE_START
G1 F7800
M204 S6000
G1 X81.258 Y79.843 E-.12796
G1 X82.727 Y79.062 E-.63204
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.44 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.407 Y80.548
G1 Z4.04
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2277
M204 S6000
G1 X83.034 Y79.845 E.01045
G1 X82.389 Y80.188 E.0096
G1 X82.762 Y80.891 E.01045
G1 X83.354 Y80.576 E.00881
; WIPE_START
G1 F18000
G1 X82.762 Y80.891 E-.25492
G1 X82.389 Y80.188 E-.30237
G1 X82.86 Y79.938 E-.20271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.45 Y80.783 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.402728
G1 F2277
M204 S5000
G1 X79.516 Y80.646 E.00191
G1 X79.723 Y80.463 E.00346
; LINE_WIDTH: 0.416018
G1 X79.949 Y80.394 E.00308
; LINE_WIDTH: 0.417948
G3 X80.021 Y80.387 I.045 J.088 E.00097
; LINE_WIDTH: 0.416298
G1 X80.293 Y80.409 E.00355
; LINE_WIDTH: 0.405188
G1 X80.529 Y80.545 E.00344
; LINE_WIDTH: 0.405448
G1 X80.696 Y80.768 E.00353
G1 X80.763 Y81.03 E.00342
; LINE_WIDTH: 0.405308
G1 X80.749 Y81.193 E.00207
; LINE_WIDTH: 0.396788
G1 X80.581 Y81.54 E.00477
G1 X80.276 Y81.726 E.00443
; LINE_WIDTH: 0.395948
G1 X79.986 Y81.753 E.00359
; LINE_WIDTH: 0.390888
G1 X79.726 Y81.665 E.00334
; LINE_WIDTH: 0.404488
G1 X79.478 Y81.427 E.00434
G1 X79.383 Y81.169 E.00347
; LINE_WIDTH: 0.402728
G1 X79.397 Y80.894 E.00346
G1 X79.424 Y80.837 E.0008
; WIPE_START
G1 F12000
M204 S6000
G1 X79.516 Y80.646 E-.0806
G1 X79.723 Y80.463 E-.10467
G1 X79.949 Y80.394 E-.09001
G1 X80.021 Y80.387 E-.02748
G1 X80.293 Y80.409 E-.10361
G1 X80.529 Y80.545 E-.1035
G1 X80.696 Y80.768 E-.10597
G1 X80.763 Y81.03 E-.10281
G1 X80.754 Y81.139 E-.04135
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.283 Y88.34 Z4.44 F42000
G1 X84.654 Y92.246 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2277
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F2277
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.12
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/99
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.44 I.918 J.798 P1  F42000
G1 X102.211 Y75.577 Z4.44
G1 Z4.12
G1 E.8 F1800
; LINE_WIDTH: 0.411538
M73 P54 R7
G1 F2269
M204 S5000
G1 X102.291 Y75.613 E.00113
G1 X102.498 Y75.784 E.00345
; LINE_WIDTH: 0.406868
G1 X102.769 Y76.151 E.0058
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00652
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.026 J.288 E.0095
; LINE_WIDTH: 0.408458
G1 X102.761 Y103.858 E.00554
G1 X102.64 Y104.05 E.0029
; LINE_WIDTH: 0.404708
G1 X102.337 Y104.356 E.00543
; LINE_WIDTH: 0.408758
G1 X101.905 Y104.553 E.00606
; LINE_WIDTH: 0.409338
G1 X101.6 Y104.594 E.00393
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J403.352 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.274 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X78.235 Y104.577 E.00244
; LINE_WIDTH: 0.407358
G1 X77.791 Y104.434 E.00592
G1 X77.602 Y104.308 E.00289
; LINE_WIDTH: 0.406378
G1 X77.32 Y103.996 E.00534
; LINE_WIDTH: 0.412478
G1 X77.148 Y103.605 E.0055
G1 X77.105 Y103.289 E.00411
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.289 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.289 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.289 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.289 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.289 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.289 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.289 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.289 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.289 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.289 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.289 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.289 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.289 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.413 I3.733 J-.282 E.01121
; LINE_WIDTH: 0.413418
G1 X77.249 Y76.121 E.00402
G1 X77.452 Y75.834 E.00454
; LINE_WIDTH: 0.404508
G1 X77.74 Y75.601 E.00467
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00543
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410258
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.405 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.664 J-1929.766 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.603 Y75.404 I.35 J-45.518 E.01577
; LINE_WIDTH: 0.407548
G1 X101.947 Y75.457 E.00442
; LINE_WIDTH: 0.411538
G1 X102.157 Y75.552 E.00296
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2269
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.801 E.00309
; LINE_WIDTH: 0.403268
G1 X101.935 Y75.866 E.00321
; LINE_WIDTH: 0.403958
G1 X102.217 Y76.047 E.00423
; LINE_WIDTH: 0.406438
G1 X102.43 Y76.354 E.00474
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.03299
; LINE_WIDTH: 0.414198
G1 X102.47 Y103.503 E.00297
G1 X102.346 Y103.8 E.00417
; LINE_WIDTH: 0.405288
G1 X102.048 Y104.08 E.00518
G1 X101.713 Y104.197 E.00448
; LINE_WIDTH: 0.409338
G1 X101.636 Y104.194 E.00099
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00251
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
; LINE_WIDTH: 0.410968
G1 X78.21 Y104.179 E.00278
G1 X77.864 Y104.022 E.00488
; LINE_WIDTH: 0.406378
G1 X77.63 Y103.766 E.0044
; LINE_WIDTH: 0.405118
G1 X77.501 Y103.37 E.00527
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.277 E.02681
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.277 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.277 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y95.277 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.277 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.277 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.277 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.277 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.277 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.277 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.277 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.277 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.277 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.00705
G1 X77.551 Y76.403 E.00417
; LINE_WIDTH: 0.405378
G1 X77.729 Y76.101 E.00444
; LINE_WIDTH: 0.408248
G1 X78.009 Y75.888 E.00449
; LINE_WIDTH: 0.410258
G1 X78.42 Y75.798 E.00539
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409278
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.796 E.01772
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11717
G1 X101.688 Y75.801 E-.08936
G1 X101.935 Y75.866 E-.0968
G1 X102.217 Y76.047 E-.12756
G1 X102.43 Y76.354 E-.14194
G1 X102.504 Y76.7 E-.13443
G1 X102.504 Y76.839 E-.05275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.461 Z4.52 F42000
G1 X101.099 Y104.175 Z4.52
G1 Z4.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2269
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z4.52 F42000
G1 X101.099 Y75.825 Z4.52
G1 Z4.12
G1 E.8 F1800
; LINE_WIDTH: 0.443588
G1 F2269
M204 S6000
G1 X98.402 Y75.825 E.03749
; LINE_WIDTH: 0.443738
G1 X94.402 Y75.825 E.05562
; LINE_WIDTH: 0.443888
G1 X90.402 Y75.825 E.05564
; LINE_WIDTH: 0.444048
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.942 Y79.89 Z4.52 F42000
G1 X81.771 Y79.998 Z4.52
G1 Z4.12
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2269
M204 S6000
G1 X83.222 Y79.227 E.02318
G1 X83.607 Y79.952 E.01159
G1 X84.025 Y80.737 E.01255
G1 X82.574 Y81.509 E.02318
G1 X81.799 Y80.051 E.02329
M204 S250
G1 X81.358 Y80.111 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2269
M204 S5000
G1 X81.206 Y79.825 E.00425
G1 X83.394 Y78.662 E.03254
G1 X83.739 Y79.31 E.00964
G1 X83.976 Y79.756 E.00663
G1 X84.225 Y80.224 E.00696
G1 X84.59 Y80.91 E.0102
G1 X82.401 Y82.074 E.03254
G1 X81.851 Y81.038 E.0154
G1 X81.663 Y80.685 E.00525
G1 X81.386 Y80.164 E.00775
; WIPE_START
G1 F7800
M204 S6000
G1 X81.206 Y79.825 E-.14571
G1 X82.633 Y79.066 E-.61429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.52 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.46 Y80.565
G1 Z4.12
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2269
M204 S6000
G1 X83.049 Y79.792 E.01149
G1 X82.336 Y80.171 E.0106
G1 X82.747 Y80.944 E.01149
G1 X83.407 Y80.593 E.00981
; WIPE_START
G1 F18000
G1 X82.747 Y80.944 E-.28393
G1 X82.336 Y80.171 E-.33254
G1 X82.67 Y79.994 E-.14353
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.427 Y80.858 Z4.52 F42000
G1 Z4.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392828
G1 F2269
M204 S5000
G1 X79.53 Y80.633 E.00303
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392388
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398308
G1 X80.583 Y81.537 E.00343
G1 X80.358 Y81.696 E.00342
; LINE_WIDTH: 0.393188
G1 X80 Y81.75 E.00444
; LINE_WIDTH: 0.387568
G1 X79.727 Y81.663 E.00346
; LINE_WIDTH: 0.384948
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00327
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392828
G1 X79.402 Y80.913 E.00032
; WIPE_START
G1 F12000
M204 S6000
G1 X79.53 Y80.633 E-.11692
G1 X79.751 Y80.449 E-.10944
G1 X80.016 Y80.374 E-.10443
G1 X80.289 Y80.403 E-.10455
G1 X80.529 Y80.541 E-.10492
G1 X80.696 Y80.76 E-.10481
G1 X80.766 Y81.03 E-.10595
G1 X80.763 Y81.053 E-.00898
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.269 Y88.263 Z4.52 F42000
G1 X84.654 Y92.246 Z4.52
G1 Z4.12
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2269
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.52 F42000
G1 Z4.12
G1 E.8 F1800
G1 F2269
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/99
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.52 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z4.52
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2290
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.801 E.00309
; LINE_WIDTH: 0.407578
G1 X101.861 Y75.839 E.00224
G1 X102.217 Y76.047 E.00525
; LINE_WIDTH: 0.406458
G1 X102.43 Y76.354 E.00475
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
G1 X102.502 Y88.7 E.15274
; LINE_WIDTH: 0.407798
G1 X102.501 Y100.7 E.15279
; LINE_WIDTH: 0.407908
G1 X102.501 Y103.37 E.034
G1 X102.352 Y103.796 E.00575
; LINE_WIDTH: 0.407258
M73 P55 R7
G1 X102.047 Y104.081 E.0053
G1 X101.706 Y104.199 E.0046
; LINE_WIDTH: 0.417308
G1 X101.638 Y104.198 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.410028
G1 X78.206 Y104.18 E.00281
G1 X77.867 Y104.022 E.0048
; LINE_WIDTH: 0.407408
G1 X77.607 Y103.726 E.00501
G1 X77.5 Y103.369 E.00473
; LINE_WIDTH: 0.410278
G3 X77.498 Y101.282 I47.521 J-1.092 E.02674
; LINE_WIDTH: 0.410148
G1 X77.498 Y99.282 E.02562
; LINE_WIDTH: 0.410018
G1 X77.498 Y97.282 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.282 E.0256
; LINE_WIDTH: 0.409768
G1 X77.497 Y93.282 E.02559
; LINE_WIDTH: 0.409638
G1 X77.497 Y91.282 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.282 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.282 E.02557
; LINE_WIDTH: 0.409258
G1 X77.497 Y85.282 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.282 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.282 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.282 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.282 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00712
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413588
G1 X77.61 Y76.283 E.00173
G1 X77.755 Y76.075 E.00328
; LINE_WIDTH: 0.411218
G1 X78.01 Y75.89 E.00404
; LINE_WIDTH: 0.404538
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409768
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409278
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11716
G1 X101.688 Y75.801 E-.08939
G1 X101.861 Y75.839 E-.06703
G1 X102.217 Y76.047 E-.15663
G1 X102.43 Y76.354 E-.14219
G1 X102.504 Y76.7 E-.13444
G1 X102.504 Y76.84 E-.05317
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.203 Y75.577 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.412808
G1 F2290
M204 S5000
G1 X102.291 Y75.614 E.00122
G1 X102.498 Y75.783 E.00345
; LINE_WIDTH: 0.406888
G1 X102.769 Y76.152 E.00581
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00651
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407708
G1 X102.894 Y84.7 E.10184
; LINE_WIDTH: 0.407828
G1 X102.893 Y90.7 E.0764
; LINE_WIDTH: 0.407928
G1 X102.892 Y98.7 E.10189
; LINE_WIDTH: 0.408048
G1 X102.892 Y103.368 E.05947
; LINE_WIDTH: 0.415348
G1 X102.82 Y103.711 E.00454
G1 X102.641 Y104.058 E.00507
; LINE_WIDTH: 0.407208
G1 X102.289 Y104.387 E.00613
; LINE_WIDTH: 0.404288
G1 X101.883 Y104.554 E.00554
; LINE_WIDTH: 0.417308
G1 X101.6 Y104.591 E.00373
; LINE_WIDTH: 0.419998
G2 X97.099 Y104.59 I-2.501 J1408.844 E.0591
G1 X87.099 Y104.59 E.1313
G2 X85.809 Y104.596 I-.347 J67.275 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X78.214 Y104.574 E.00271
; LINE_WIDTH: 0.411398
G1 X77.82 Y104.452 E.00529
; LINE_WIDTH: 0.414438
G1 X77.492 Y104.209 E.00529
G1 X77.261 Y103.897 E.00502
; LINE_WIDTH: 0.409358
G1 X77.135 Y103.552 E.0047
; LINE_WIDTH: 0.410278
G1 X77.105 Y103.291 E.00336
G1 X77.105 Y101.291 E.02563
; LINE_WIDTH: 0.410148
G1 X77.105 Y99.291 E.02562
; LINE_WIDTH: 0.410018
G1 X77.105 Y97.291 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.291 E.0256
; LINE_WIDTH: 0.409768
G1 X77.105 Y93.291 E.02559
; LINE_WIDTH: 0.409638
G1 X77.105 Y91.291 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.291 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.291 E.02557
; LINE_WIDTH: 0.409258
G1 X77.105 Y85.291 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.291 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.291 E.02554
; LINE_WIDTH: 0.408878
G1 X77.104 Y79.291 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.291 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00723
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.405 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.664 J-1929.766 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.604 Y75.404 I.35 J-45.608 E.01578
; LINE_WIDTH: 0.406688
G1 X101.886 Y75.445 E.00361
; LINE_WIDTH: 0.412808
G1 X102.148 Y75.554 E.00366
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.614 E-.05886
G1 X102.498 Y75.783 E-.10174
G1 X102.769 Y76.152 E-.17393
G1 X102.893 Y76.646 E-.19354
G1 X102.894 Y76.7 E-.02053
G1 X102.894 Y77.256 E-.21141
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443588
G1 F2290
M204 S6000
G1 X98.402 Y75.825 E.03749
; LINE_WIDTH: 0.443738
G1 X94.402 Y75.825 E.05562
; LINE_WIDTH: 0.443888
G1 X90.402 Y75.825 E.05564
; LINE_WIDTH: 0.444048
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z4.6 F42000
G1 X101.099 Y104.175 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2290
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.37 Y96.818 Z4.6 F42000
G1 X81.719 Y79.981 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2290
M204 S6000
G1 X83.237 Y79.174 E.02425
G1 X83.64 Y79.933 E.01213
G1 X84.077 Y80.755 E.01313
G1 X82.559 Y81.562 E.02425
G1 X81.747 Y80.034 E.02441
M204 S250
G1 X81.327 Y80.133 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2290
M204 S5000
G1 X81.154 Y79.808 E.00483
G1 X83.409 Y78.609 E.03355
G1 X83.762 Y79.272 E.00986
G1 X84.009 Y79.737 E.00692
G1 X84.267 Y80.221 E.00721
G1 X84.642 Y80.927 E.0105
G1 X82.386 Y82.127 E.03355
G1 X81.836 Y81.091 E.0154
G1 X81.648 Y80.738 E.00525
G1 X81.355 Y80.186 E.0082
; WIPE_START
G1 F7800
M204 S6000
G1 X81.154 Y79.808 E-.16271
G1 X82.542 Y79.07 E-.59729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.512 Y80.582
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2290
M204 S6000
G1 X83.064 Y79.739 E.01253
G1 X82.284 Y80.154 E.0116
G1 X82.732 Y80.997 E.01253
G1 X83.459 Y80.61 E.01081
; WIPE_START
G1 F18000
G1 X82.732 Y80.997 E-.31294
G1 X82.284 Y80.154 E-.36271
G1 X82.48 Y80.05 E-.08436
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.432 Y80.854 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.404508
G1 F2290
M204 S5000
G1 X79.517 Y80.646 E.00283
G1 X79.723 Y80.463 E.00347
; LINE_WIDTH: 0.402708
G1 X79.981 Y80.376 E.00343
; LINE_WIDTH: 0.402428
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398188
G1 X80.528 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398868
G1 X80.767 Y81.035 E.00353
G1 X80.707 Y81.338 E.00385
; LINE_WIDTH: 0.389428
G1 X80.512 Y81.594 E.0039
G1 X80.259 Y81.73 E.00349
; LINE_WIDTH: 0.388208
G1 X79.986 Y81.751 E.00331
G1 X79.726 Y81.665 E.00331
G1 X79.52 Y81.484 E.00331
G1 X79.4 Y81.238 E.00331
G1 X79.386 Y80.964 E.00331
; LINE_WIDTH: 0.404508
G1 X79.409 Y80.909 E.00075
; WIPE_START
G1 F12000
M204 S6000
G1 X79.517 Y80.646 E-.10806
G1 X79.723 Y80.463 E-.10456
G1 X79.981 Y80.376 E-.10361
G1 X80.289 Y80.404 E-.11739
G1 X80.528 Y80.541 E-.10478
G1 X80.696 Y80.76 E-.10495
G1 X80.767 Y81.035 E-.10776
G1 X80.763 Y81.058 E-.00889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.27 Y88.267 Z4.6 F42000
G1 X84.654 Y92.246 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2290
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2290
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.28
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/99
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z4.6
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2300
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.688 Y75.801 E.00309
; LINE_WIDTH: 0.403118
G1 X101.935 Y75.866 E.0032
; LINE_WIDTH: 0.403938
G1 X102.217 Y76.046 E.00422
; LINE_WIDTH: 0.404888
G1 X102.429 Y76.354 E.00473
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00555
; LINE_WIDTH: 0.403948
G1 X102.071 Y104.066 E.00555
; LINE_WIDTH: 0.406448
G1 X101.692 Y104.2 E.0051
; LINE_WIDTH: 0.410098
G1 X101.642 Y104.196 E.00065
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00259
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
M73 P56 R7
G1 X78.365 Y104.203 E.09482
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406578
G1 X77.634 Y103.771 E.00541
; LINE_WIDTH: 0.408338
G1 X77.499 Y103.37 E.0054
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.29 I84.103 J-1.087 E.02665
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.29 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.29 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00722
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411208
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409768
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409278
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11727
G1 X101.688 Y75.801 E-.08943
G1 X101.935 Y75.866 E-.09668
G1 X102.217 Y76.046 E-.12727
G1 X102.429 Y76.354 E-.14218
G1 X102.504 Y76.7 E-.13447
G1 X102.504 Y76.839 E-.05271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.217 Y75.58 Z4.68 F42000
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.411488
G1 F2300
M204 S5000
G1 X102.291 Y75.613 E.00104
G1 X102.498 Y75.783 E.00344
; LINE_WIDTH: 0.406808
G1 X102.769 Y76.144 E.00574
; LINE_WIDTH: 0.409548
G1 X102.893 Y76.646 E.00661
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.894 Y103.335 E.03368
G1 X102.862 Y103.529 E.00252
; LINE_WIDTH: 0.403948
G1 X102.726 Y103.926 E.00529
; LINE_WIDTH: 0.410558
G1 X102.416 Y104.295 E.00618
; LINE_WIDTH: 0.414198
G1 X102.031 Y104.517 E.00575
G1 X101.6 Y104.595 E.00567
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.589 I-4.635 J1727.676 E.08536
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.636 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.119 Y104.551 E.00318
; LINE_WIDTH: 0.405628
G1 X77.744 Y104.41 E.00507
; LINE_WIDTH: 0.413418
G1 X77.406 Y104.116 E.00579
; LINE_WIDTH: 0.414178
G1 X77.183 Y103.731 E.00575
G1 X77.105 Y103.295 E.00574
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.295 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.295 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.295 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.295 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.295 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.295 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.295 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.295 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.295 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.295 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.295 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.295 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.295 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00728
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.405 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.671 J-1932.649 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.605 Y75.404 I.35 J-45.238 E.01579
; LINE_WIDTH: 0.407518
G1 X101.947 Y75.457 E.00441
; LINE_WIDTH: 0.411488
G1 X102.163 Y75.555 E.00305
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.613 E-.05364
G1 X102.498 Y75.783 E-.10162
G1 X102.769 Y76.144 E-.17171
G1 X102.893 Y76.646 E-.19645
G1 X102.894 Y76.7 E-.02051
G1 X102.894 Y77.269 E-.21607
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z4.68 F42000
G1 Z4.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443568
G1 F2300
M204 S6000
G1 X98.402 Y75.825 E.03748
; LINE_WIDTH: 0.443728
G1 X94.402 Y75.825 E.05561
; LINE_WIDTH: 0.443888
G1 X90.402 Y75.825 E.05564
; LINE_WIDTH: 0.444048
G1 X86.402 Y75.825 E.05566
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z4.68 F42000
G1 X86.402 Y104.174 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2300
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443518
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443828
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443978
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444128
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444288
G1 X101.099 Y104.175 E.02784
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.639 Y97.981 Z4.68 F42000
G1 X81.666 Y79.964 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2300
M204 S6000
G1 X83.252 Y79.121 E.02533
G1 X83.673 Y79.914 E.01267
G1 X84.129 Y80.772 E.01371
G1 X82.544 Y81.615 E.02533
G1 X81.695 Y80.017 E.02553
M204 S250
G1 X81.242 Y80.055 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2300
M204 S5000
G1 X81.101 Y79.791 E.00393
G1 X83.425 Y78.556 E.03455
G1 X83.788 Y79.239 E.01015
G1 X84.042 Y79.717 E.00712
G1 X84.309 Y80.22 E.00747
G1 X84.695 Y80.944 E.01078
G1 X82.371 Y82.18 E.03455
G1 X81.817 Y81.136 E.01552
G1 X81.629 Y80.783 E.00525
G1 X81.486 Y80.515 E.00399
G1 X81.298 Y80.162 E.00525
G1 X81.27 Y80.108 E.0008
; WIPE_START
G1 F5700
M204 S6000
G1 X81.101 Y79.791 E-.13646
G1 X82.55 Y79.021 E-.62354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.68 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.564 Y80.599
G1 Z4.28
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2300
M204 S6000
G1 X83.079 Y79.686 E.01358
G1 X82.232 Y80.137 E.0126
G1 X82.717 Y81.05 E.01358
G1 X83.511 Y80.627 E.01182
; WIPE_START
G1 F18000
G1 X82.717 Y81.05 E-.34194
G1 X82.232 Y80.137 E-.39288
G1 X82.29 Y80.106 E-.02518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.456 Y80.771 Z4.68 F42000
G1 Z4.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392348
G1 F2300
M204 S5000
G1 X79.537 Y80.621 E.00208
G1 X79.751 Y80.449 E.00336
; LINE_WIDTH: 0.415348
G1 X80.055 Y80.376 E.00406
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405168
G1 X80.529 Y80.545 E.00429
; LINE_WIDTH: 0.405448
G1 X80.697 Y80.768 E.00354
G1 X80.763 Y81.03 E.00342
; LINE_WIDTH: 0.405308
G1 X80.749 Y81.193 E.00207
; LINE_WIDTH: 0.392868
G1 X80.61 Y81.497 E.00409
G1 X80.389 Y81.681 E.00353
; LINE_WIDTH: 0.395168
G1 X80.092 Y81.762 E.00379
G1 X79.747 Y81.676 E.00439
; LINE_WIDTH: 0.384848
G1 X79.489 Y81.441 E.00417
; LINE_WIDTH: 0.392568
G1 X79.383 Y81.146 E.00385
G1 X79.407 Y80.863 E.00347
; LINE_WIDTH: 0.392348
G1 X79.428 Y80.824 E.00055
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.08733
G1 X79.751 Y80.449 E-.10444
G1 X80.055 Y80.376 E-.11886
G1 X80.227 Y80.39 E-.0653
G1 X80.529 Y80.545 E-.12895
G1 X80.697 Y80.768 E-.10615
G1 X80.763 Y81.03 E-.10268
G1 X80.753 Y81.152 E-.04629
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.285 Y88.352 Z4.68 F42000
G1 X84.654 Y92.246 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2300
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
M73 P56 R6
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.68 F42000
G1 Z4.28
G1 E.8 F1800
G1 F2300
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/99
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.68 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z4.68
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2307
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.00309
; LINE_WIDTH: 0.407568
G1 X101.861 Y75.839 E.00224
G1 X102.216 Y76.046 E.00524
; LINE_WIDTH: 0.404868
G1 X102.43 Y76.354 E.00473
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00555
; LINE_WIDTH: 0.403928
G1 X102.085 Y104.058 E.00536
; LINE_WIDTH: 0.403678
G1 X101.71 Y104.198 E.00504
; LINE_WIDTH: 0.409768
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.103 Y104.149 E.00416
; LINE_WIDTH: 0.404148
M73 P57 R6
G1 X77.801 Y103.97 E.00442
; LINE_WIDTH: 0.408228
G1 X77.588 Y103.691 E.00448
; LINE_WIDTH: 0.410298
G1 X77.498 Y103.28 E.00539
G1 X77.498 Y101.28 E.02563
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.28 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.28 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.28 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.28 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.28 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.28 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.28 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.00709
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.405848
G1 X77.729 Y76.1 E.00445
G1 X77.957 Y75.917 E.00371
; LINE_WIDTH: 0.405928
G1 X78.33 Y75.8 E.00495
; LINE_WIDTH: 0.410268
G3 X80.42 Y75.798 I1.103 J42.357 E.02677
; LINE_WIDTH: 0.409768
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11715
G1 X101.689 Y75.801 E-.08942
G1 X101.861 Y75.839 E-.06704
G1 X102.216 Y76.046 E-.15639
G1 X102.43 Y76.354 E-.14227
G1 X102.504 Y76.7 E-.13429
G1 X102.504 Y76.84 E-.05344
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.21 Y75.58 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.412748
G1 F2307
M204 S5000
G1 X102.291 Y75.614 E.00112
G1 X102.497 Y75.783 E.00344
; LINE_WIDTH: 0.406808
G1 X102.769 Y76.144 E.00574
; LINE_WIDTH: 0.409518
G1 X102.893 Y76.646 E.00661
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.894 Y103.335 E.03368
G1 X102.862 Y103.529 E.00252
; LINE_WIDTH: 0.403928
G1 X102.726 Y103.926 E.00529
; LINE_WIDTH: 0.415528
G1 X102.486 Y104.234 E.00507
G1 X102.298 Y104.377 E.00307
; LINE_WIDTH: 0.408048
G1 X101.889 Y104.558 E.0057
; LINE_WIDTH: 0.409768
G1 X101.6 Y104.594 E.00373
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1968.389 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.173 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X78.112 Y104.559 E.00401
; LINE_WIDTH: 0.412928
G3 X77.532 Y104.244 I.294 J-1.233 E.00862
; LINE_WIDTH: 0.403248
G1 X77.295 Y103.955 E.0047
; LINE_WIDTH: 0.411318
G1 X77.138 Y103.571 E.00533
G1 X77.105 Y103.29 E.00363
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.414 I3.734 J-.283 E.0112
; LINE_WIDTH: 0.412668
G1 X77.282 Y76.061 E.0049
G1 X77.454 Y75.828 E.00373
; LINE_WIDTH: 0.405848
G1 X77.74 Y75.6 E.00463
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00542
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.405 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.671 J-1925.969 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.605 Y75.404 I.35 J-45.789 E.0158
; LINE_WIDTH: 0.406698
G1 X101.886 Y75.445 E.0036
; LINE_WIDTH: 0.412748
G1 X102.155 Y75.557 E.00376
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.614 E-.05593
G1 X102.497 Y75.783 E-.10152
G1 X102.769 Y76.144 E-.17177
G1 X102.893 Y76.646 E-.19643
G1 X102.894 Y76.7 E-.02037
G1 X102.894 Y77.263 E-.21397
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.825 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443538
G1 F2307
M204 S6000
G1 X98.402 Y75.825 E.03748
; LINE_WIDTH: 0.443698
G1 X94.402 Y75.825 E.05561
; LINE_WIDTH: 0.443858
G1 X90.402 Y75.825 E.05563
; LINE_WIDTH: 0.444028
G1 X86.402 Y75.825 E.05565
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z4.76 F42000
G1 X101.099 Y104.175 Z4.76
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2307
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.343 Y96.826 Z4.76 F42000
G1 X81.614 Y79.947 Z4.76
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2307
M204 S6000
G1 X83.267 Y79.068 E.02641
G1 X83.706 Y79.894 E.0132
G1 X84.182 Y80.789 E.01429
G1 X82.529 Y81.668 E.02641
G1 X81.642 Y80 E.02665
M204 S250
G1 X81.352 Y79.613 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2307
M204 S5000
G1 X83.44 Y78.503 E.03105
G1 X83.812 Y79.203 E.01041
G1 X84.075 Y79.698 E.00737
G1 X84.353 Y80.22 E.00776
G1 X84.747 Y80.962 E.01103
G1 X82.356 Y82.233 E.03555
G1 X81.808 Y81.201 E.01534
G1 X81.62 Y80.848 E.00525
G1 X81.455 Y80.537 E.00463
G1 X81.267 Y80.184 E.00525
G1 X81.049 Y79.774 E.0061
G1 X81.299 Y79.641 E.00371
; WIPE_START
G1 F5700
M204 S6000
G1 X83.064 Y78.702 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.617 Y80.616
G1 Z4.36
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2307
M204 S6000
G1 X83.094 Y79.633 E.01462
G1 X82.179 Y80.12 E.01361
G1 X82.702 Y81.103 E.01462
G1 X83.564 Y80.644 E.01282
; WIPE_START
G1 F18000
G1 X82.702 Y81.103 E-.37095
G1 X82.221 Y80.199 E-.38905
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.444 Y80.802 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392868
G1 F2307
M204 S5000
G1 X79.537 Y80.621 E.00249
; LINE_WIDTH: 0.392348
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398288
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.00346
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398208
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389288
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385908
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389428
G1 X79.726 Y81.666 E.00332
G1 X79.521 Y81.483 E.00333
; LINE_WIDTH: 0.384968
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.877 E.00409
G1 X79.416 Y80.855 E.0003
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.10007
G1 X79.751 Y80.449 E-.1044
G1 X80.016 Y80.374 E-.10447
G1 X80.289 Y80.403 E-.10453
G1 X80.529 Y80.541 E-.10494
G1 X80.696 Y80.76 E-.10486
G1 X80.766 Y81.03 E-.10588
G1 X80.754 Y81.11 E-.03084
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.277 Y88.314 Z4.76 F42000
G1 X84.654 Y92.246 Z4.76
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2307
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F2307
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.44
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/99
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I.918 J.799 P1  F42000
G1 X102.215 Y75.582 Z4.76
G1 Z4.44
G1 E.8 F1800
; LINE_WIDTH: 0.412798
G1 F2312
M204 S5000
G1 X102.295 Y75.616 E.00112
G1 X102.49 Y75.77 E.0032
; LINE_WIDTH: 0.406448
G1 X102.77 Y76.146 E.00596
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00658
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407698
G1 X102.893 Y86.7 E.12729
; LINE_WIDTH: 0.407818
G1 X102.892 Y96.7 E.12733
; LINE_WIDTH: 0.407948
G1 X102.891 Y103.37 E.08496
G1 X102.873 Y103.489 E.00154
; LINE_WIDTH: 0.403938
G1 X102.726 Y103.926 E.0058
; LINE_WIDTH: 0.415578
G1 X102.486 Y104.234 E.00507
G1 X102.298 Y104.377 E.00307
; LINE_WIDTH: 0.408028
G1 X101.889 Y104.558 E.0057
; LINE_WIDTH: 0.409748
G1 X101.6 Y104.594 E.00373
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1968.422 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.173 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X78.125 Y104.561 E.00385
; LINE_WIDTH: 0.413088
G1 X77.763 Y104.419 E.00502
G1 X77.529 Y104.243 E.00378
; LINE_WIDTH: 0.404218
G1 X77.295 Y103.955 E.00468
; LINE_WIDTH: 0.411318
G1 X77.138 Y103.571 E.00533
G1 X77.105 Y103.29 E.00363
; LINE_WIDTH: 0.410278
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.409978
G1 X77.106 Y99.29 E.02561
; LINE_WIDTH: 0.409678
G1 X77.106 Y97.29 E.02559
; LINE_WIDTH: 0.409378
G1 X77.106 Y95.29 E.02557
; LINE_WIDTH: 0.409078
G1 X77.106 Y93.29 E.02555
; LINE_WIDTH: 0.408778
G1 X77.106 Y91.29 E.02553
; LINE_WIDTH: 0.408478
G1 X77.107 Y89.29 E.02551
; LINE_WIDTH: 0.408178
G1 X77.107 Y87.29 E.02549
; LINE_WIDTH: 0.407888
G1 X77.107 Y85.29 E.02547
; LINE_WIDTH: 0.407588
M73 P58 R6
G1 X77.107 Y83.29 E.02545
; LINE_WIDTH: 0.407288
G1 X77.107 Y81.29 E.02543
; LINE_WIDTH: 0.406988
G1 X77.107 Y79.29 E.02541
; LINE_WIDTH: 0.406688
G1 X77.108 Y77.29 E.02539
; LINE_WIDTH: 0.406388
G1 X77.108 Y76.7 E.00749
G1 X77.151 Y76.398 E.00387
; LINE_WIDTH: 0.411198
G1 X77.312 Y76.008 E.00542
; LINE_WIDTH: 0.413228
G1 X77.561 Y75.724 E.00488
G1 X77.905 Y75.506 E.00526
; LINE_WIDTH: 0.410608
G1 X78.405 Y75.405 E.00654
; LINE_WIDTH: 0.410268
G1 X80.405 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.405 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.405 Y75.405 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.405 E.01791
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.671 J-1922.646 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.606 Y75.404 I.35 J-45.884 E.01581
; LINE_WIDTH: 0.406688
G1 X101.886 Y75.445 E.00359
; LINE_WIDTH: 0.412798
G1 X102.16 Y75.559 E.00382
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2312
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.00309
; LINE_WIDTH: 0.407558
G1 X101.861 Y75.839 E.00224
G1 X102.217 Y76.045 E.00524
; LINE_WIDTH: 0.407238
G1 X102.429 Y76.354 E.00477
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
G1 X102.503 Y84.7 E.10183
; LINE_WIDTH: 0.407798
G1 X102.502 Y92.7 E.10186
; LINE_WIDTH: 0.407898
G1 X102.501 Y102.7 E.12736
; LINE_WIDTH: 0.408008
G1 X102.501 Y103.37 E.00854
; LINE_WIDTH: 0.408128
G1 X102.356 Y103.792 E.00569
G1 X102.046 Y104.081 E.00539
; LINE_WIDTH: 0.405948
G1 X101.71 Y104.198 E.00451
; LINE_WIDTH: 0.409748
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.122 Y104.155 E.00391
; LINE_WIDTH: 0.404218
G1 X77.801 Y103.971 E.00467
; LINE_WIDTH: 0.408158
G1 X77.589 Y103.695 E.00442
; LINE_WIDTH: 0.410278
G1 X77.498 Y103.281 E.00544
G1 X77.498 Y101.281 E.02563
; LINE_WIDTH: 0.409978
G1 X77.498 Y99.281 E.02561
; LINE_WIDTH: 0.409678
G1 X77.498 Y97.281 E.02559
; LINE_WIDTH: 0.409378
G1 X77.498 Y95.281 E.02557
; LINE_WIDTH: 0.409078
G1 X77.498 Y93.281 E.02555
; LINE_WIDTH: 0.408778
G1 X77.498 Y91.281 E.02553
; LINE_WIDTH: 0.408478
G1 X77.498 Y89.281 E.02551
; LINE_WIDTH: 0.408178
G1 X77.497 Y87.281 E.02549
; LINE_WIDTH: 0.407888
G1 X77.497 Y85.281 E.02547
; LINE_WIDTH: 0.407588
G1 X77.497 Y83.281 E.02545
; LINE_WIDTH: 0.407288
G1 X77.497 Y81.281 E.02543
; LINE_WIDTH: 0.406988
G1 X77.497 Y79.281 E.02541
; LINE_WIDTH: 0.406688
G1 X77.497 Y77.281 E.02539
; LINE_WIDTH: 0.406388
G1 X77.497 Y76.7 E.00736
; LINE_WIDTH: 0.408238
G1 X77.549 Y76.402 E.00386
G1 X77.73 Y76.101 E.00447
; LINE_WIDTH: 0.410608
G1 X78.038 Y75.878 E.00489
G1 X78.41 Y75.798 E.00487
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.41 Y75.797 E.02559
; LINE_WIDTH: 0.409278
G1 X84.41 Y75.796 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.796 E.01785
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11716
G1 X101.689 Y75.801 E-.08944
G1 X101.861 Y75.839 E-.06697
G1 X102.217 Y76.045 E-.15645
G1 X102.429 Y76.354 E-.14251
G1 X102.504 Y76.7 E-.1344
G1 X102.504 Y76.84 E-.05307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.462 Z4.84 F42000
G1 X101.099 Y104.175 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2312
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z4.84 F42000
G1 X101.099 Y75.825 Z4.84
G1 Z4.44
G1 E.8 F1800
; LINE_WIDTH: 0.443538
G1 F2312
M204 S6000
G1 X98.402 Y75.825 E.03748
; LINE_WIDTH: 0.443698
G1 X94.402 Y75.825 E.05561
; LINE_WIDTH: 0.443858
G1 X90.402 Y75.825 E.05563
; LINE_WIDTH: 0.444028
G1 X86.402 Y75.825 E.05565
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.857 Y79.752 Z4.84 F42000
G1 X81.562 Y79.93 Z4.84
G1 Z4.44
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2312
M204 S6000
G1 X83.282 Y79.015 E.02748
G1 X83.739 Y79.875 E.01374
G1 X84.234 Y80.806 E.01487
G1 X82.514 Y81.721 E.02748
G1 X81.59 Y79.983 E.02777
M204 S250
G1 X81.356 Y79.566 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2312
M204 S5000
G1 X83.455 Y78.45 E.0312
G1 X83.836 Y79.167 E.01066
G1 X84.108 Y79.679 E.00762
G1 X84.203 Y79.858 E.00267
G1 X84.391 Y80.211 E.00525
G1 X84.799 Y80.979 E.01141
G1 X82.341 Y82.286 E.03655
G1 X82.311 Y82.23 E.00083
G1 X82.124 Y81.877 E.00525
G1 X81.983 Y81.613 E.00393
G1 X81.796 Y81.259 E.00525
G1 X81.655 Y80.995 E.00393
G1 X81.467 Y80.642 E.00525
G1 X81.293 Y80.314 E.00488
G1 X81.151 Y80.048 E.00396
G1 X81.01 Y79.781 E.00396
G1 X80.997 Y79.757 E.00036
G1 X81.303 Y79.594 E.00456
; WIPE_START
G1 F5700
M204 S6000
G1 X83.069 Y78.655 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.84 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.669 Y80.633
G1 Z4.44
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2312
M204 S6000
G1 X83.109 Y79.58 E.01566
G1 X82.127 Y80.102 E.01461
G1 X82.687 Y81.155 E.01566
G1 X83.616 Y80.661 E.01382
M204 S10000
G1 X83.157 Y80.477 F42000
; LINE_WIDTH: 0.371998
G1 F2312
M204 S6000
G1 X82.952 Y80.092 E.00503
G1 X82.639 Y80.259 E.0041
G1 X82.843 Y80.643 E.00503
G1 X83.104 Y80.505 E.00341
; WIPE_START
G1 F18000
G1 X82.843 Y80.643 E-.14745
G1 X82.639 Y80.259 E-.21755
G1 X82.952 Y80.092 E-.17746
G1 X83.157 Y80.477 E-.21755
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.428 Y80.857 Z4.84 F42000
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384948
G1 F2312
M204 S5000
G1 X79.494 Y80.683 E.00223
; LINE_WIDTH: 0.392828
G1 X79.74 Y80.458 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.00346
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398288
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389248
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385908
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.665 E.00332
G1 X79.521 Y81.483 E.00333
; LINE_WIDTH: 0.384948
G1 X79.402 Y81.237 E.00327
G1 X79.388 Y80.964 E.00328
G1 X79.407 Y80.914 E.00065
; WIPE_START
G1 F12000
M204 S6000
G1 X79.494 Y80.683 E-.09353
G1 X79.74 Y80.458 E-.12697
G1 X80.016 Y80.374 E-.10948
G1 X80.289 Y80.403 E-.10455
G1 X80.529 Y80.541 E-.10495
G1 X80.696 Y80.76 E-.10482
G1 X80.766 Y81.03 E-.10591
G1 X80.762 Y81.056 E-.0098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.27 Y88.264 Z4.84 F42000
G1 X84.654 Y92.246 Z4.84
G1 Z4.44
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2312
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.84 F42000
G1 Z4.44
G1 E.8 F1800
G1 F2312
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/99
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.84 I.918 J.799 P1  F42000
G1 X102.218 Y75.583 Z4.84
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.412668
G1 F2321
M204 S5000
G1 X102.291 Y75.614 E.00102
G1 X102.497 Y75.783 E.00343
; LINE_WIDTH: 0.406818
G1 X102.769 Y76.144 E.00575
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00661
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.441 I-4.024 J.288 E.0095
; LINE_WIDTH: 0.406428
G1 X102.758 Y103.86 E.00554
; LINE_WIDTH: 0.414818
G1 X102.485 Y104.233 E.00599
G1 X102.298 Y104.377 E.00306
; LINE_WIDTH: 0.408008
G1 X101.889 Y104.558 E.00569
; LINE_WIDTH: 0.409738
G1 X101.6 Y104.594 E.00373
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.589 I-4.653 J1956.553 E.08537
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.636 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.415288
G1 X77.963 Y104.514 E.00532
G1 X77.616 Y104.319 E.00516
; LINE_WIDTH: 0.404328
G1 X77.303 Y103.974 E.00588
; LINE_WIDTH: 0.409178
G1 X77.136 Y103.551 E.00581
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.291 E.00336
G1 X77.105 Y101.291 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.291 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.291 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.291 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.291 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.291 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.291 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.291 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.291 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.291 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.291 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.291 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.291 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.413 I3.739 J-.283 E.01123
; LINE_WIDTH: 0.412918
G3 X77.457 Y75.831 I1.232 J.292 E.00864
; LINE_WIDTH: 0.403288
G1 X77.745 Y75.595 E.0047
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408778
M73 P59 R6
G1 X85.808 Y75.405 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.671 J-1925.969 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.607 Y75.404 I.35 J-45.902 E.01582
; LINE_WIDTH: 0.406668
G1 X101.886 Y75.445 E.00358
; LINE_WIDTH: 0.412668
G1 X102.163 Y75.56 E.00386
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2321
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.00309
; LINE_WIDTH: 0.407558
G1 X101.861 Y75.839 E.00224
G1 X102.216 Y76.046 E.00523
; LINE_WIDTH: 0.404858
G1 X102.43 Y76.354 E.00475
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413908
G1 X102.471 Y103.5 E.00293
G1 X102.345 Y103.8 E.0042
; LINE_WIDTH: 0.405958
G1 X102.046 Y104.081 E.00521
G1 X101.71 Y104.198 E.0045
; LINE_WIDTH: 0.409738
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.415288
G1 X78.1 Y104.139 E.00354
G1 X77.866 Y104.023 E.00339
; LINE_WIDTH: 0.411228
G1 X77.599 Y103.709 E.00529
G1 X77.5 Y103.37 E.00454
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.282 I47.875 J-1.092 E.02675
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.282 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.282 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.282 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.282 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.282 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.282 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.282 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.282 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.282 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.282 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.282 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.282 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00712
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.404128
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.408228
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11717
G1 X101.689 Y75.801 E-.08947
G1 X101.861 Y75.839 E-.06694
G1 X102.216 Y76.046 E-.15612
G1 X102.43 Y76.354 E-.14269
G1 X102.504 Y76.7 E-.13434
G1 X102.504 Y76.84 E-.05328
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.63 Y83.416 Z4.92 F42000
G1 X86.402 Y104.174 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2321
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443518
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443828
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443978
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444128
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444288
G1 X101.099 Y104.175 E.02784
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.636 Y96.561 Z4.92 F42000
G1 X101.099 Y75.825 Z4.92
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.443538
G1 F2321
M204 S6000
G1 X98.402 Y75.825 E.03748
; LINE_WIDTH: 0.443698
G1 X94.402 Y75.825 E.05561
; LINE_WIDTH: 0.443858
G1 X90.402 Y75.825 E.05563
; LINE_WIDTH: 0.444028
G1 X86.402 Y75.825 E.05565
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.837 Y79.718 Z4.92 F42000
G1 X81.509 Y79.913 Z4.92
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2321
M204 S6000
G1 X83.297 Y78.962 E.02856
G1 X83.772 Y79.856 E.01428
G1 X84.286 Y80.823 E.01545
G1 X82.499 Y81.774 E.02856
G1 X81.538 Y79.965 E.02889
M204 S250
G1 X81.101 Y80.034 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2321
M204 S5000
G1 X80.957 Y79.764 E.00401
G1 X80.944 Y79.74 E.00036
G1 X83.47 Y78.397 E.03755
G1 X83.867 Y79.144 E.01111
G1 X84.141 Y79.66 E.00767
G1 X84.244 Y79.854 E.00288
G1 X84.432 Y80.207 E.00525
G1 X84.852 Y80.996 E.01173
G1 X82.326 Y82.339 E.03755
G1 X82.299 Y82.288 E.00075
G1 X82.112 Y81.935 E.00525
G1 X81.995 Y81.717 E.00325
G1 X81.808 Y81.363 E.00525
G1 X81.691 Y81.145 E.00325
G1 X81.504 Y80.791 E.00525
G1 X81.244 Y80.303 E.00726
G1 X81.129 Y80.087 E.00322
; WIPE_START
G1 F9900
M204 S6000
G1 X80.957 Y79.764 E-.13882
G1 X80.944 Y79.74 E-.01043
G1 X82.363 Y78.985 E-.61075
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.92 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.721 Y80.65
G1 Z4.52
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2321
M204 S6000
G1 X83.124 Y79.527 E.0167
G1 X82.074 Y80.085 E.01561
G1 X82.672 Y81.208 E.0167
G1 X83.668 Y80.678 E.01482
M204 S10000
G1 X83.183 Y80.486 F42000
; LINE_WIDTH: 0.410198
G1 F2321
M204 S6000
G1 X82.96 Y80.065 E.0061
G1 X82.613 Y80.25 E.00503
G1 X82.836 Y80.67 E.0061
G1 X83.13 Y80.514 E.00427
; WIPE_START
G1 F18000
G1 X82.836 Y80.67 E-.15079
G1 X82.613 Y80.25 E-.21563
G1 X82.96 Y80.065 E-.17796
G1 X83.183 Y80.486 E-.21563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.455 Y80.773 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392388
G1 F2321
M204 S5000
G1 X79.537 Y80.621 E.00211
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399148
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398248
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389248
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385908
G1 X79.986 Y81.75 E.00329
G1 X79.727 Y81.664 E.00329
G1 X79.504 Y81.459 E.00364
; LINE_WIDTH: 0.394628
G1 X79.382 Y81.146 E.00413
G1 X79.407 Y80.863 E.00349
; LINE_WIDTH: 0.392388
G1 X79.427 Y80.826 E.00051
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.08838
G1 X79.751 Y80.449 E-.10446
G1 X80.016 Y80.374 E-.10448
G1 X80.289 Y80.403 E-.1044
G1 X80.528 Y80.541 E-.10503
G1 X80.696 Y80.76 E-.10485
G1 X80.766 Y81.03 E-.10594
G1 X80.749 Y81.141 E-.04248
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.281 Y88.341 Z4.92 F42000
G1 X84.654 Y92.246 Z4.92
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2321
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F2321
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/99
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.92 I.918 J.799 P1  F42000
G1 X102.223 Y75.585 Z4.92
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.412608
G1 F2327
M204 S5000
G1 X102.291 Y75.614 E.00096
G1 X102.497 Y75.782 E.00343
; LINE_WIDTH: 0.406958
G1 X102.771 Y76.156 E.00588
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00647
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407698
G1 X102.893 Y88.7 E.15275
; LINE_WIDTH: 0.407818
G1 X102.892 Y100.7 E.1528
; LINE_WIDTH: 0.407938
G1 X102.891 Y103.367 E.03397
; LINE_WIDTH: 0.413298
G1 X102.799 Y103.765 E.00528
G1 X102.665 Y104.017 E.00368
; LINE_WIDTH: 0.410118
G1 X102.394 Y104.317 E.00518
; LINE_WIDTH: 0.414338
G1 X102.033 Y104.516 E.00535
G1 X101.6 Y104.595 E.00569
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1737.301 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.173 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X78.234 Y104.577 E.00244
; LINE_WIDTH: 0.411568
G1 X77.818 Y104.451 E.00559
G1 X77.607 Y104.308 E.00327
; LINE_WIDTH: 0.404228
G1 X77.318 Y103.994 E.00538
; LINE_WIDTH: 0.410968
G1 X77.139 Y103.57 E.0059
G1 X77.105 Y103.29 E.00362
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00721
G1 X77.181 Y76.286 E.00569
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.405 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.674 J-1924.072 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.608 Y75.404 I.35 J-46.131 E.01583
; LINE_WIDTH: 0.406698
G1 X101.886 Y75.445 E.00357
; LINE_WIDTH: 0.412608
M73 P60 R6
G1 X102.167 Y75.562 E.00392
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2327
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.00309
; LINE_WIDTH: 0.407528
G1 X101.861 Y75.839 E.00224
G1 X102.215 Y76.045 E.00522
; LINE_WIDTH: 0.406648
G1 X102.43 Y76.354 E.00478
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
G1 X102.503 Y86.7 E.12729
; LINE_WIDTH: 0.407798
G1 X102.501 Y96.7 E.12733
; LINE_WIDTH: 0.407898
G1 X102.501 Y103.367 E.08491
G1 X102.354 Y103.791 E.00572
; LINE_WIDTH: 0.403388
G1 X102.045 Y104.08 E.00532
; LINE_WIDTH: 0.406478
G1 X101.692 Y104.2 E.00473
; LINE_WIDTH: 0.410128
G1 X101.642 Y104.196 E.00065
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00259
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411558
G1 X78.205 Y104.177 E.00284
G1 X77.864 Y104.021 E.00482
; LINE_WIDTH: 0.404228
G1 X77.628 Y103.764 E.0044
; LINE_WIDTH: 0.405918
G1 X77.5 Y103.37 E.00525
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.28 I42.472 J-1.093 E.02677
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y95.28 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.28 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.28 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.28 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.28 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.28 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.28 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.00709
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411218
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.89 E.00404
; LINE_WIDTH: 0.404538
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409768
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11715
G1 X101.689 Y75.801 E-.08948
G1 X101.861 Y75.839 E-.06698
G1 X102.215 Y76.045 E-.15586
G1 X102.43 Y76.354 E-.14303
G1 X102.504 Y76.7 E-.13433
G1 X102.504 Y76.84 E-.05317
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.462 Z5 F42000
G1 X101.099 Y104.175 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2327
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z5 F42000
G1 X101.099 Y75.825 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.443498
G1 F2327
M204 S6000
G1 X98.402 Y75.825 E.03748
; LINE_WIDTH: 0.443668
G1 X94.402 Y75.825 E.05561
; LINE_WIDTH: 0.443838
G1 X90.402 Y75.825 E.05563
; LINE_WIDTH: 0.444008
G1 X86.402 Y75.825 E.05565
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.817 Y79.684 Z5 F42000
G1 X81.457 Y79.895 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2327
M204 S6000
G1 X83.312 Y78.909 E.02964
G1 X83.805 Y79.837 E.01482
G1 X84.339 Y80.84 E.01604
G1 X82.484 Y81.826 E.02964
G1 X81.485 Y79.948 E.03001
M204 S250
G1 X81.061 Y80.041 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2327
M204 S5000
G1 X80.906 Y79.749 E.00435
G1 X80.892 Y79.723 E.00039
G1 X83.485 Y78.344 E.03856
G1 X83.89 Y79.106 E.01133
G1 X84.078 Y79.459 E.00525
G1 X84.174 Y79.64 E.0027
G1 X84.283 Y79.846 E.00305
G1 X84.471 Y80.199 E.00525
G1 X84.904 Y81.013 E.0121
G1 X82.311 Y82.392 E.03856
G1 X82.284 Y82.341 E.00076
G1 X82.096 Y81.987 E.00525
G1 X81.98 Y81.769 E.00325
G1 X81.792 Y81.416 E.00525
G1 X81.676 Y81.197 E.00325
G1 X81.488 Y80.844 E.00525
G1 X81.217 Y80.333 E.00759
G1 X81.09 Y80.094 E.00356
; WIPE_START
G1 F9900
M204 S6000
G1 X80.906 Y79.749 E-.14857
G1 X80.892 Y79.723 E-.01135
G1 X82.286 Y78.981 E-.60009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.774 Y80.667
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2327
M204 S6000
G1 X83.139 Y79.474 E.01774
G1 X82.022 Y80.068 E.01661
G1 X82.657 Y81.261 E.01774
G1 X83.721 Y80.696 E.01582
M204 S10000
G1 X83.21 Y80.495 F42000
; LINE_WIDTH: 0.448348
G1 F2327
M204 S6000
G1 X82.967 Y80.038 E.00727
G1 X82.586 Y80.241 E.00606
G1 X82.829 Y80.697 E.00727
G1 X83.157 Y80.523 E.00522
; WIPE_START
G1 F18000
G1 X82.829 Y80.697 E-.15354
G1 X82.586 Y80.241 E-.21405
G1 X82.967 Y80.038 E-.17836
G1 X83.21 Y80.495 E-.21405
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.44 Y80.81 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392868
G1 F2327
M204 S5000
G1 X79.537 Y80.621 E.0026
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00385
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389408
G1 X80.464 Y80.498 E.00403
; LINE_WIDTH: 0.397048
G1 X80.69 Y80.753 E.00422
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00357
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389228
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385948
G1 X80.259 Y81.729 E.00328
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.666 E.00332
G1 X79.521 Y81.483 E.00333
; LINE_WIDTH: 0.384968
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.877 E.00409
G1 X79.412 Y80.863 E.00019
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.10349
G1 X79.783 Y80.429 E-.11854
G1 X80.154 Y80.378 E-.14239
G1 X80.464 Y80.498 E-.12619
G1 X80.69 Y80.753 E-.12956
G1 X80.766 Y81.03 E-.10925
G1 X80.748 Y81.108 E-.03058
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.274 Y88.311 Z5 F42000
G1 X84.654 Y92.246 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2327
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F2327
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/99
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5 I.918 J.799 P1  F42000
G1 X102.226 Y75.587 Z5
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.412598
G1 F2337
M204 S5000
G1 X102.291 Y75.614 E.0009
G1 X102.496 Y75.782 E.00342
; LINE_WIDTH: 0.406978
G1 X102.771 Y76.156 E.00589
; LINE_WIDTH: 0.409548
G1 X102.893 Y76.646 E.00646
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.441 I-4.017 J.288 E.0095
; LINE_WIDTH: 0.406328
G1 X102.758 Y103.86 E.00554
; LINE_WIDTH: 0.414918
G1 X102.485 Y104.233 E.00599
G1 X102.297 Y104.378 E.00308
; LINE_WIDTH: 0.408028
G1 X101.889 Y104.558 E.00568
; LINE_WIDTH: 0.409758
G1 X101.6 Y104.594 E.00373
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1963.656 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.274 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X78.234 Y104.577 E.00244
; LINE_WIDTH: 0.411588
G1 X77.818 Y104.451 E.0056
G1 X77.611 Y104.311 E.00321
; LINE_WIDTH: 0.403788
G1 X77.328 Y104.009 E.00522
; LINE_WIDTH: 0.411048
G1 X77.139 Y103.57 E.00613
G1 X77.105 Y103.29 E.00363
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G3 X77.161 Y76.324 I3.468 J-.28 E.01238
; LINE_WIDTH: 0.406438
G1 X77.414 Y75.872 E.00657
; LINE_WIDTH: 0.403068
G1 X77.745 Y75.595 E.00543
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409268
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.405 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.674 J-1924.072 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.608 Y75.404 I.35 J-46.153 E.01584
; LINE_WIDTH: 0.406678
G1 X101.886 Y75.445 E.00357
; LINE_WIDTH: 0.412598
G1 X102.171 Y75.564 E.00398
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2337
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.00309
; LINE_WIDTH: 0.407548
G1 X101.861 Y75.839 E.00224
G1 X102.215 Y76.045 E.00522
; LINE_WIDTH: 0.406698
G1 X102.43 Y76.354 E.00478
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
M73 P61 R6
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.413908
G1 X102.471 Y103.5 E.00293
G1 X102.345 Y103.8 E.0042
; LINE_WIDTH: 0.405978
G1 X102.045 Y104.082 E.00522
G1 X101.71 Y104.198 E.00449
; LINE_WIDTH: 0.409758
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411568
G1 X78.205 Y104.177 E.00284
G1 X77.866 Y104.022 E.00479
; LINE_WIDTH: 0.407378
G1 X77.607 Y103.726 E.00501
G1 X77.5 Y103.369 E.00473
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.28 I42.611 J-1.093 E.02678
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.28 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.28 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.28 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.28 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.28 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.28 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.28 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.729 E.00703
G1 X77.551 Y76.403 E.00422
; LINE_WIDTH: 0.405938
G1 X77.729 Y76.1 E.00445
; LINE_WIDTH: 0.408248
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11716
G1 X101.689 Y75.801 E-.0895
G1 X101.861 Y75.839 E-.06691
G1 X102.215 Y76.045 E-.15581
G1 X102.43 Y76.354 E-.14302
G1 X102.504 Y76.7 E-.13446
G1 X102.504 Y76.84 E-.05314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.462 Z5.08 F42000
G1 X101.099 Y104.175 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2337
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z5.08 F42000
G1 X101.099 Y75.825 Z5.08
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.443478
G1 F2337
M204 S6000
G1 X98.402 Y75.825 E.03748
; LINE_WIDTH: 0.443658
G1 X94.402 Y75.825 E.05561
; LINE_WIDTH: 0.443828
G1 X90.402 Y75.825 E.05563
; LINE_WIDTH: 0.444008
G1 X86.402 Y75.825 E.05565
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.797 Y79.651 Z5.08 F42000
G1 X81.405 Y79.878 Z5.08
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2337
M204 S6000
G1 X83.327 Y78.856 E.03072
G1 X83.838 Y79.817 E.01536
G1 X84.391 Y80.857 E.01662
G1 X82.469 Y81.879 E.03072
G1 X81.433 Y79.931 E.03113
M204 S250
G1 X81.022 Y80.049 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2337
M204 S5000
G1 X80.855 Y79.734 E.00468
G1 X80.84 Y79.705 E.00042
G1 X83.5 Y78.291 E.03956
G1 X83.912 Y79.067 E.01153
G1 X84.1 Y79.42 E.00525
G1 X84.207 Y79.621 E.003
G1 X84.329 Y79.851 E.00342
G1 X84.517 Y80.204 E.00525
G1 X84.956 Y81.03 E.01228
G1 X82.296 Y82.445 E.03956
G1 X82.269 Y82.394 E.00075
G1 X82.082 Y82.041 E.00525
G1 X81.965 Y81.822 E.00325
G1 X81.778 Y81.469 E.00525
G1 X81.661 Y81.251 E.00325
G1 X81.473 Y80.897 E.00525
G1 X81.377 Y80.717 E.00268
G1 X81.19 Y80.364 E.00525
G1 X81.05 Y80.102 E.00389
; WIPE_START
G1 F9900
M204 S6000
G1 X80.855 Y79.734 E-.15831
G1 X80.84 Y79.705 E-.01228
G1 X82.209 Y78.977 E-.5894
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.826 Y80.685
G1 Z4.68
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2337
M204 S6000
G1 X83.154 Y79.421 E.01879
G1 X81.97 Y80.051 E.01761
G1 X82.642 Y81.314 E.01879
G1 X83.773 Y80.713 E.01683
M204 S10000
G1 X83.236 Y80.504 F42000
; LINE_WIDTH: 0.486524
G1 F2337
M204 S6000
G1 X82.974 Y80.011 E.00855
G1 X82.56 Y80.231 E.00718
G1 X82.822 Y80.725 E.00855
G1 X83.183 Y80.532 E.00626
; WIPE_START
G1 F18000
G1 X82.822 Y80.725 E-.15587
G1 X82.56 Y80.231 E-.21271
G1 X82.974 Y80.011 E-.17871
G1 X83.236 Y80.504 E-.21271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.438 Y80.836 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.404508
G1 F2337
M204 S5000
G1 X79.517 Y80.646 E.0026
G1 X79.723 Y80.463 E.00347
; LINE_WIDTH: 0.402668
G1 X79.981 Y80.376 E.00343
; LINE_WIDTH: 0.402428
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398188
G1 X80.528 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398528
G1 X80.766 Y81.03 E.00346
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398208
G1 X80.583 Y81.536 E.00343
G1 X80.359 Y81.699 E.00343
G1 X80 Y81.751 E.00451
; LINE_WIDTH: 0.389228
G1 X79.727 Y81.664 E.00348
; LINE_WIDTH: 0.385948
G1 X79.521 Y81.484 E.00329
; LINE_WIDTH: 0.392728
G1 X79.398 Y81.239 E.00335
G1 X79.385 Y80.964 E.00337
; LINE_WIDTH: 0.404508
G1 X79.415 Y80.892 E.00099
; WIPE_START
G1 F12000
M204 S6000
G1 X79.517 Y80.646 E-.10109
G1 X79.723 Y80.463 E-.10452
G1 X79.981 Y80.376 E-.10364
G1 X80.289 Y80.404 E-.11742
G1 X80.528 Y80.541 E-.10478
G1 X80.696 Y80.76 E-.10492
G1 X80.766 Y81.03 E-.10588
G1 X80.759 Y81.076 E-.01776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.272 Y88.283 Z5.08 F42000
G1 X84.654 Y92.246 Z5.08
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2337
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F2337
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.76
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/99
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.08 I.918 J.799 P1  F42000
G1 X102.23 Y75.588 Z5.08
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.412548
G1 F2347
M204 S5000
G1 X102.291 Y75.614 E.00085
G1 X102.496 Y75.782 E.00342
; LINE_WIDTH: 0.406998
G1 X102.771 Y76.157 E.00591
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00645
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.894 Y103.335 E.03368
G1 X102.862 Y103.529 E.00252
; LINE_WIDTH: 0.403948
G1 X102.726 Y103.926 E.00529
; LINE_WIDTH: 0.415688
G1 X102.486 Y104.234 E.00507
G1 X102.297 Y104.378 E.00309
; LINE_WIDTH: 0.407998
G1 X101.889 Y104.558 E.00568
; LINE_WIDTH: 0.409738
G1 X101.6 Y104.594 E.00372
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.589 I-4.653 J1961.25 E.08537
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.636 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.184 Y104.565 E.00234
; LINE_WIDTH: 0.406558
G1 X77.779 Y104.426 E.00543
; LINE_WIDTH: 0.415258
G1 X77.466 Y104.186 E.00512
G1 X77.259 Y103.896 E.00463
; LINE_WIDTH: 0.409058
G1 X77.136 Y103.551 E.00467
; LINE_WIDTH: 0.410298
G1 X77.105 Y103.291 E.00336
G1 X77.105 Y101.291 E.02563
; LINE_WIDTH: 0.410098
G1 X77.105 Y99.291 E.02562
; LINE_WIDTH: 0.409898
G1 X77.105 Y97.291 E.0256
; LINE_WIDTH: 0.409708
G1 X77.105 Y95.291 E.02559
; LINE_WIDTH: 0.409508
G1 X77.105 Y93.291 E.02558
; LINE_WIDTH: 0.409308
G1 X77.105 Y91.291 E.02556
; LINE_WIDTH: 0.409118
G1 X77.105 Y89.291 E.02555
; LINE_WIDTH: 0.408918
G1 X77.105 Y87.291 E.02554
; LINE_WIDTH: 0.408718
G1 X77.105 Y85.291 E.02553
; LINE_WIDTH: 0.408528
G1 X77.106 Y83.291 E.02551
; LINE_WIDTH: 0.408328
G1 X77.106 Y81.291 E.0255
; LINE_WIDTH: 0.408138
G1 X77.106 Y79.291 E.02549
; LINE_WIDTH: 0.407938
G1 X77.106 Y77.291 E.02547
; LINE_WIDTH: 0.407738
G1 X77.106 Y76.7 E.00752
; LINE_WIDTH: 0.408218
G1 X77.182 Y76.262 E.00567
G1 X77.426 Y75.864 E.00595
; LINE_WIDTH: 0.403908
G1 X77.756 Y75.585 E.00545
; LINE_WIDTH: 0.409538
G1 X78.157 Y75.432 E.00549
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00324
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409268
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.405 E.01786
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.677 J-1928.841 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.609 Y75.404 I.351 J-46.125 E.01585
; LINE_WIDTH: 0.406668
G1 X101.886 Y75.445 E.00356
; LINE_WIDTH: 0.412548
G1 X102.175 Y75.565 E.00403
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2347
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.00309
; LINE_WIDTH: 0.407518
G1 X101.861 Y75.839 E.00224
G1 X102.215 Y76.045 E.00521
; LINE_WIDTH: 0.406728
G1 X102.43 Y76.354 E.00479
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409228
M73 P62 R6
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00555
; LINE_WIDTH: 0.403948
G1 X102.084 Y104.059 E.00538
; LINE_WIDTH: 0.403648
G1 X101.71 Y104.198 E.00502
; LINE_WIDTH: 0.409738
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406558
G1 X77.865 Y104.023 E.00108
; LINE_WIDTH: 0.411188
G1 X77.598 Y103.704 E.00535
G1 X77.5 Y103.37 E.00447
; LINE_WIDTH: 0.410298
G3 X77.498 Y101.282 I48.544 J-1.091 E.02675
; LINE_WIDTH: 0.410098
G1 X77.498 Y99.282 E.02562
; LINE_WIDTH: 0.409898
G1 X77.498 Y97.282 E.0256
; LINE_WIDTH: 0.409708
G1 X77.498 Y95.282 E.02559
; LINE_WIDTH: 0.409508
G1 X77.497 Y93.282 E.02558
; LINE_WIDTH: 0.409308
G1 X77.497 Y91.282 E.02556
; LINE_WIDTH: 0.409118
G1 X77.497 Y89.282 E.02555
; LINE_WIDTH: 0.408918
G1 X77.497 Y87.282 E.02554
; LINE_WIDTH: 0.408718
G1 X77.497 Y85.282 E.02553
; LINE_WIDTH: 0.408528
G1 X77.497 Y83.282 E.02551
; LINE_WIDTH: 0.408328
G1 X77.497 Y81.282 E.0255
; LINE_WIDTH: 0.408128
G1 X77.496 Y79.282 E.02549
; LINE_WIDTH: 0.407938
G1 X77.496 Y77.282 E.02547
; LINE_WIDTH: 0.407738
G1 X77.496 Y76.7 E.00741
; LINE_WIDTH: 0.408238
G1 X77.549 Y76.402 E.00386
G1 X77.73 Y76.101 E.00447
; LINE_WIDTH: 0.407808
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.418 Y75.798 E.00536
G1 X80.418 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.418 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.418 Y75.796 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.796 E.01775
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11716
G1 X101.689 Y75.801 E-.08952
G1 X101.861 Y75.839 E-.06693
G1 X102.215 Y76.045 E-.1556
G1 X102.43 Y76.354 E-.14325
G1 X102.504 Y76.7 E-.13441
G1 X102.504 Y76.84 E-.05314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.63 Y83.416 Z5.16 F42000
G1 X86.402 Y104.174 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2347
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443518
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443828
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443978
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444128
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444288
G1 X101.099 Y104.175 E.02784
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.636 Y96.561 Z5.16 F42000
G1 X101.099 Y75.825 Z5.16
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.443478
G1 F2347
M204 S6000
G1 X98.402 Y75.825 E.03748
; LINE_WIDTH: 0.443658
G1 X94.402 Y75.825 E.05561
; LINE_WIDTH: 0.443828
G1 X90.402 Y75.825 E.05563
; LINE_WIDTH: 0.444008
G1 X86.402 Y75.825 E.05565
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.778 Y79.617 Z5.16 F42000
G1 X81.352 Y79.861 Z5.16
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2347
M204 S6000
G1 X83.342 Y78.803 E.03179
G1 X83.871 Y79.798 E.0159
G1 X84.443 Y80.874 E.0172
G1 X82.454 Y81.932 E.03179
G1 X81.381 Y79.914 E.03225
M204 S250
G1 X80.803 Y79.719 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2347
M204 S5000
G1 X80.787 Y79.688 E.00045
G1 X83.515 Y78.238 E.04056
G1 X83.939 Y79.036 E.01187
G1 X84.127 Y79.389 E.00525
G1 X84.24 Y79.602 E.00316
G1 X84.366 Y79.838 E.00351
G1 X84.554 Y80.191 E.00525
G1 X85.009 Y81.047 E.01273
G1 X82.281 Y82.497 E.04056
G1 X82.254 Y82.446 E.00076
G1 X82.066 Y82.093 E.00525
G1 X81.95 Y81.875 E.00325
G1 X81.762 Y81.521 E.00525
G1 X81.646 Y81.303 E.00325
G1 X81.458 Y80.95 E.00525
G1 X81.35 Y80.747 E.00302
G1 X81.163 Y80.394 E.00525
G1 X80.983 Y80.056 E.00502
G1 X80.832 Y79.772 E.00423
; WIPE_START
G1 F7800
M204 S6000
G1 X80.787 Y79.688 E-.03581
G1 X82.47 Y78.794 E-.72419
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.16 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.878 Y80.702
G1 Z4.76
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2347
M204 S6000
G1 X83.169 Y79.368 E.01983
G1 X81.918 Y80.034 E.01862
G1 X82.627 Y81.367 E.01983
G1 X83.825 Y80.73 E.01783
M204 S10000
G1 X83.263 Y80.513 F42000
; LINE_WIDTH: 0.524678
G1 F2347
M204 S6000
G1 X82.981 Y79.984 E.00992
G1 X82.533 Y80.222 E.0084
G1 X82.815 Y80.752 E.00992
G1 X83.21 Y80.542 E.0074
; WIPE_START
G1 F17733.64
G1 X82.815 Y80.752 E-.17005
G1 X82.533 Y80.222 E-.22796
G1 X82.981 Y79.984 E-.19285
G1 X83.19 Y80.377 E-.16914
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.461 Y80.762 Z5.16 F42000
G1 Z4.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392408
G1 F2347
M204 S5000
G1 X79.537 Y80.621 E.00195
G1 X79.751 Y80.449 E.00336
; LINE_WIDTH: 0.415308
G1 X80.055 Y80.376 E.00406
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405168
G1 X80.529 Y80.545 E.00429
; LINE_WIDTH: 0.405528
G1 X80.697 Y80.769 E.00355
G1 X80.763 Y81.03 E.00341
; LINE_WIDTH: 0.404728
G1 X80.751 Y81.184 E.00194
; LINE_WIDTH: 0.393008
G1 X80.611 Y81.495 E.00418
G1 X80.389 Y81.681 E.00355
; LINE_WIDTH: 0.395168
G1 X80.092 Y81.762 E.00379
G1 X79.775 Y81.691 E.00401
; LINE_WIDTH: 0.385688
G1 X79.504 Y81.462 E.00426
; LINE_WIDTH: 0.392848
G1 X79.384 Y81.15 E.00409
G1 X79.407 Y80.863 E.00353
; LINE_WIDTH: 0.392408
G1 X79.433 Y80.815 E.00067
; WIPE_START
G1 F12000
M204 S6000
G1 X79.537 Y80.621 E-.08343
G1 X79.751 Y80.449 E-.10449
G1 X80.055 Y80.376 E-.11884
G1 X80.227 Y80.39 E-.06522
G1 X80.529 Y80.545 E-.12895
G1 X80.697 Y80.769 E-.1065
G1 X80.763 Y81.03 E-.10241
G1 X80.753 Y81.162 E-.05016
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.287 Y88.361 Z5.16 F42000
G1 X84.654 Y92.246 Z5.16
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2347
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.16 F42000
G1 Z4.76
G1 E.8 F1800
G1 F2347
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/99
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.16 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z5.16
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2365
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.00309
; LINE_WIDTH: 0.407538
G1 X101.861 Y75.839 E.00224
G1 X102.214 Y76.045 E.00521
; LINE_WIDTH: 0.406748
G1 X102.43 Y76.354 E.00479
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00555
; LINE_WIDTH: 0.403928
G1 X102.08 Y104.063 E.00545
; LINE_WIDTH: 0.404398
G1 X101.709 Y104.199 E.00499
; LINE_WIDTH: 0.410028
G1 X101.638 Y104.195 E.00091
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00254
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
G1 X78.103 Y104.149 E.00417
; LINE_WIDTH: 0.411598
G1 X77.779 Y103.948 E.0049
G1 X77.571 Y103.645 E.00473
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.275 E.00482
G1 X77.496 Y77.275 E.33172
G3 X77.528 Y76.467 I3.214 J-.275 E.01035
; LINE_WIDTH: 0.408208
G1 X77.729 Y76.101 E.00532
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.796 E.01772
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11715
G1 X101.689 Y75.801 E-.08954
G1 X101.861 Y75.839 E-.06679
G1 X102.214 Y76.045 E-.15554
G1 X102.43 Y76.354 E-.14343
G1 X102.504 Y76.7 E-.13434
G1 X102.504 Y76.84 E-.0532
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.234 Y75.59 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.412518
G1 F2365
M204 S5000
G1 X102.291 Y75.614 E.0008
G1 X102.496 Y75.782 E.00341
; LINE_WIDTH: 0.406998
G1 X102.771 Y76.157 E.00592
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00644
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.415168
G1 X102.82 Y103.711 E.00497
G1 X102.641 Y104.058 E.00506
; LINE_WIDTH: 0.407248
M73 P62 R5
G1 X102.286 Y104.389 E.00617
; LINE_WIDTH: 0.406248
G1 X101.886 Y104.556 E.00551
; LINE_WIDTH: 0.410028
G1 X101.6 Y104.594 E.00369
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1944.811 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.274 E.01694
; LINE_WIDTH: 0.408698
M73 P63 R5
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X77.986 Y104.519 E.00569
; LINE_WIDTH: 0.403948
G1 X77.608 Y104.31 E.00545
; LINE_WIDTH: 0.411618
G1 X77.309 Y103.988 E.00565
; LINE_WIDTH: 0.415278
G1 X77.158 Y103.636 E.00497
G1 X77.104 Y103.287 E.00458
; LINE_WIDTH: 0.408588
G1 X77.104 Y77.287 E.33172
G3 X77.141 Y76.414 I3.724 J-.281 E.01118
; LINE_WIDTH: 0.412578
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.829 E.00378
; LINE_WIDTH: 0.404238
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411298
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409268
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.405 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.68 J-1926.948 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.61 Y75.404 I.351 J-46.355 E.01586
; LINE_WIDTH: 0.406678
G1 X101.886 Y75.445 E.00355
; LINE_WIDTH: 0.412518
G1 X102.179 Y75.567 E.00408
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.614 E-.04627
G1 X102.496 Y75.782 E-.10061
G1 X102.771 Y76.157 E-.17702
G1 X102.893 Y76.646 E-.19146
G1 X102.894 Y76.7 E-.02045
G1 X102.894 Y77.29 E-.22418
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.826 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443458
G1 F2365
M204 S6000
G1 X98.402 Y75.825 E.03748
; LINE_WIDTH: 0.443638
G1 X94.402 Y75.825 E.0556
; LINE_WIDTH: 0.443808
G1 X90.402 Y75.825 E.05563
; LINE_WIDTH: 0.443988
G1 X86.402 Y75.825 E.05565
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z5.24 F42000
G1 X101.099 Y104.175 Z5.24
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2365
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.264 Y96.848 Z5.24 F42000
G1 X81.3 Y79.844 Z5.24
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2365
M204 S6000
G1 X83.357 Y78.75 E.03287
G1 X83.904 Y79.779 E.01643
G1 X84.496 Y80.892 E.01778
G1 X82.439 Y81.985 E.03287
G1 X81.328 Y79.897 E.03337
M204 S250
G1 X80.752 Y79.703 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2365
M204 S5000
G1 X80.735 Y79.671 E.00048
G1 X83.53 Y78.185 E.04156
G1 X83.968 Y79.009 E.01226
G1 X84.156 Y79.362 E.00525
G1 X84.273 Y79.583 E.00327
G1 X84.407 Y79.835 E.00376
G1 X84.595 Y80.188 E.00525
G1 X85.061 Y81.064 E.01303
G1 X82.266 Y82.55 E.04156
G1 X82.239 Y82.5 E.00075
G1 X82.051 Y82.147 E.00525
G1 X81.935 Y81.928 E.00325
G1 X81.747 Y81.575 E.00525
G1 X81.631 Y81.356 E.00325
G1 X81.443 Y81.003 E.00525
G1 X81.323 Y80.777 E.00336
G1 X81.135 Y80.424 E.00525
G1 X80.944 Y80.064 E.00536
G1 X80.78 Y79.756 E.00457
; WIPE_START
G1 F7800
M204 S6000
G1 X80.735 Y79.671 E-.03668
G1 X82.416 Y78.778 E-.72332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.24 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.931 Y80.719
G1 Z4.84
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2365
M204 S6000
G1 X83.184 Y79.315 E.02087
G1 X81.865 Y80.017 E.01962
G1 X82.611 Y81.42 E.02087
G1 X83.878 Y80.747 E.01883
M204 S10000
G1 X83.289 Y80.523 F42000
; LINE_WIDTH: 0.562848
G1 F2365
M204 S6000
G1 X82.988 Y79.957 E.0114
G1 X82.507 Y80.213 E.00971
G1 X82.808 Y80.779 E.0114
G1 X83.236 Y80.551 E.00864
; WIPE_START
G1 F16493.182
G1 X82.808 Y80.779 E-.18456
G1 X82.507 Y80.213 E-.24362
G1 X82.988 Y79.957 E-.20736
G1 X83.142 Y80.246 E-.12446
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.434 Y80.841 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2365
M204 S5000
G1 X79.494 Y80.683 E.00202
; LINE_WIDTH: 0.392888
G1 X79.74 Y80.458 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399188
G1 X80.289 Y80.403 E.00342
G1 X80.52 Y80.535 E.00331
; LINE_WIDTH: 0.413368
G1 X80.693 Y80.771 E.00379
G1 X80.762 Y81.03 E.00347
; LINE_WIDTH: 0.406188
G1 X80.757 Y81.132 E.00129
; LINE_WIDTH: 0.385948
G1 X80.677 Y81.393 E.00329
G1 X80.502 Y81.603 E.00329
G1 X80.259 Y81.729 E.00329
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.665 E.00332
G1 X79.521 Y81.483 E.00332
; LINE_WIDTH: 0.384968
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.413 Y80.897 E.00086
; WIPE_START
G1 F12000
M204 S6000
G1 X79.494 Y80.683 E-.08676
G1 X79.74 Y80.458 E-.12696
G1 X80.016 Y80.374 E-.10946
G1 X80.289 Y80.403 E-.10449
G1 X80.52 Y80.535 E-.10089
G1 X80.693 Y80.771 E-.11138
G1 X80.762 Y81.03 E-.102
G1 X80.76 Y81.078 E-.01806
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.273 Y88.285 Z5.24 F42000
G1 X84.654 Y92.246 Z5.24
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2365
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F2365
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.92
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/99
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.24 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z5.24
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2384
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.0031
; LINE_WIDTH: 0.403318
G1 X101.934 Y75.866 E.00319
; LINE_WIDTH: 0.403908
G1 X102.214 Y76.044 E.00419
; LINE_WIDTH: 0.408418
G1 X102.431 Y76.354 E.00482
G1 X102.504 Y76.7 E.00451
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.414198
G1 X102.47 Y103.503 E.00297
G1 X102.345 Y103.8 E.00418
; LINE_WIDTH: 0.409618
G1 X102.044 Y104.084 E.0053
G1 X101.715 Y104.196 E.00445
; LINE_WIDTH: 0.409018
G1 X101.634 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.103 Y104.149 E.00416
; LINE_WIDTH: 0.411238
G1 X77.777 Y103.947 E.00492
G1 X77.59 Y103.69 E.00408
; LINE_WIDTH: 0.404528
G1 X77.501 Y103.37 E.0042
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.276 E.02683
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.276 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.276 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y95.276 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.276 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.276 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.276 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.276 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.276 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.276 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.276 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.276 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.276 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00704
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.404008
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.407288
G1 X77.997 Y75.893 E.00431
; LINE_WIDTH: 0.410268
G1 X78.413 Y75.798 E.00546
G1 X80.413 Y75.798 E.02563
; LINE_WIDTH: 0.409758
G1 X82.413 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.413 Y75.796 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.796 E.01781
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11727
G1 X101.689 Y75.801 E-.08959
G1 X101.934 Y75.866 E-.09646
G1 X102.214 Y76.044 E-.12616
G1 X102.431 Y76.354 E-.14373
G1 X102.504 Y76.7 E-.13431
G1 X102.504 Y76.838 E-.05249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.246 Y75.593 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.411278
G1 F2384
M204 S5000
G1 X102.291 Y75.613 E.00063
; LINE_WIDTH: 0.413948
G1 X102.576 Y75.861 E.00488
G1 X102.783 Y76.184 E.00496
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.441 I-4.023 J.288 E.0095
; LINE_WIDTH: 0.408478
G1 X102.761 Y103.858 E.00554
; LINE_WIDTH: 0.416118
G1 X102.53 Y104.188 E.00524
G1 X102.32 Y104.363 E.00355
; LINE_WIDTH: 0.411338
G1 X101.937 Y104.545 E.00545
G1 X101.6 Y104.594 E.00438
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J412.356 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.272 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X77.978 Y104.515 E.00579
; LINE_WIDTH: 0.402898
M73 P64 R5
G1 X77.601 Y104.307 E.00541
; LINE_WIDTH: 0.408248
G1 X77.319 Y104.002 E.00529
; LINE_WIDTH: 0.412808
G1 X77.157 Y103.636 E.00516
G1 X77.105 Y103.288 E.00455
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.288 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.288 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.288 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.288 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.288 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.288 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.288 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.288 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.288 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.288 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.288 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.288 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.413 I3.725 J-.282 E.01119
; LINE_WIDTH: 0.412878
G1 X77.267 Y76.088 E.0045
G1 X77.457 Y75.831 E.00412
; LINE_WIDTH: 0.403388
G1 X77.745 Y75.595 E.0047
; LINE_WIDTH: 0.404588
G1 X78.165 Y75.438 E.00566
; LINE_WIDTH: 0.410268
G1 X78.407 Y75.405 E.00313
G1 X80.407 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.407 Y75.405 E.02559
; LINE_WIDTH: 0.409268
G1 X84.407 Y75.405 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.405 E.01789
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.68 J-1923.612 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.61 Y75.404 I.35 J-45.702 E.01587
; LINE_WIDTH: 0.407548
G1 X101.947 Y75.457 E.00434
; LINE_WIDTH: 0.411278
G1 X102.192 Y75.568 E.00345
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.613 E-.04154
G1 X102.576 Y75.861 E-.14353
G1 X102.783 Y76.184 E-.14576
G1 X102.893 Y76.646 E-.18043
G1 X102.894 Y76.7 E-.02045
G1 X102.894 Y77.301 E-.22829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.826 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443448
G1 F2384
M204 S6000
G1 X98.402 Y75.825 E.03747
; LINE_WIDTH: 0.443628
G1 X94.402 Y75.825 E.0556
; LINE_WIDTH: 0.443808
G1 X90.402 Y75.825 E.05563
; LINE_WIDTH: 0.443988
G1 X86.402 Y75.825 E.05565
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z5.32 F42000
G1 X101.099 Y104.175 Z5.32
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2384
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.25 Y96.852 Z5.32 F42000
G1 X81.248 Y79.827 Z5.32
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2384
M204 S6000
G1 X83.372 Y78.697 E.03395
G1 X83.937 Y79.76 E.01697
G1 X84.548 Y80.909 E.01836
G1 X82.424 Y82.038 E.03395
G1 X81.276 Y79.88 E.03449
M204 S250
G1 X80.695 Y79.678 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2384
M204 S5000
G1 X80.683 Y79.654 E.00035
G1 X83.545 Y78.132 E.04257
G1 X84.001 Y78.989 E.01274
G1 X84.188 Y79.342 E.00525
G1 X84.306 Y79.563 E.00329
G1 X84.445 Y79.824 E.00387
G1 X84.632 Y80.177 E.00525
G1 X85.113 Y81.081 E.01345
G1 X82.251 Y82.603 E.04257
G1 X82.126 Y82.368 E.0035
G1 X81.938 Y82.015 E.00525
G1 X81.376 Y80.957 E.01573
G1 X81.245 Y80.711 E.00366
G1 X80.974 Y80.203 E.00756
G1 X80.835 Y79.94 E.0039
G1 X80.723 Y79.731 E.00312
; WIPE_START
G1 F7800
M204 S6000
G1 X80.683 Y79.654 E-.03296
G1 X82.372 Y78.756 E-.72704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.41 Y80.897 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.388668
G1 F2384
M204 S5000
G1 X79.481 Y80.702 E.00251
; LINE_WIDTH: 0.392688
G1 X79.739 Y80.459 E.00434
; LINE_WIDTH: 0.396328
G1 X80.015 Y80.372 E.00358
; LINE_WIDTH: 0.400788
G1 X80.275 Y80.4 E.00327
G1 X80.528 Y80.541 E.00362
; LINE_WIDTH: 0.410568
G1 X80.687 Y80.735 E.00321
G1 X80.765 Y81.027 E.00388
; LINE_WIDTH: 0.398468
G1 X80.725 Y81.3 E.00343
; LINE_WIDTH: 0.398288
G1 X80.58 Y81.534 E.00342
; LINE_WIDTH: 0.391248
G1 X80.357 Y81.695 E.00335
; LINE_WIDTH: 0.399408
G1 X80.001 Y81.756 E.0045
; LINE_WIDTH: 0.403608
G1 X79.753 Y81.684 E.00325
; LINE_WIDTH: 0.405848
G1 X79.563 Y81.538 E.00303
G1 X79.418 Y81.302 E.00351
; LINE_WIDTH: 0.405248
G1 X79.386 Y80.964 E.00429
; LINE_WIDTH: 0.388668
G1 X79.39 Y80.953 E.00015
; WIPE_START
G1 F12000
M204 S6000
G1 X79.481 Y80.702 E-.10154
G1 X79.739 Y80.459 E-.13473
G1 X80.015 Y80.372 E-.1101
G1 X80.275 Y80.4 E-.09945
G1 X80.528 Y80.541 E-.11007
G1 X80.687 Y80.735 E-.09518
G1 X80.761 Y81.012 E-.10894
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.32 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.983 Y80.736
G1 Z4.92
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F2384
M204 S6000
G1 X83.2 Y79.262 E.02191
G1 X81.813 Y80 E.02062
G1 X82.596 Y81.473 E.02191
G1 X83.93 Y80.764 E.01983
M204 S10000
G1 X83.438 Y80.569 F42000
G1 F2384
M204 S6000
G1 X83.033 Y79.807 E.01134
G1 X82.358 Y80.166 E.01004
G1 X82.763 Y80.928 E.01134
G1 X83.385 Y80.598 E.00926
M204 S10000
G1 X82.921 Y80.411 F42000
; LINE_WIDTH: 0.379208
G1 F2384
M204 S6000
G1 X82.903 Y80.377 E.00045
; WIPE_START
G1 F18000
G1 X82.921 Y80.411 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.027 Y87.963 Z5.32 F42000
G1 X84.654 Y92.246 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2384
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
G1 F2384
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/99
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.32 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z5.32
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2391
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.0031
; LINE_WIDTH: 0.407538
G1 X101.861 Y75.839 E.00224
G1 X102.214 Y76.044 E.0052
; LINE_WIDTH: 0.406838
G1 X102.43 Y76.354 E.0048
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00555
; LINE_WIDTH: 0.403938
G1 X102.08 Y104.063 E.00546
; LINE_WIDTH: 0.404338
G1 X101.709 Y104.199 E.00498
; LINE_WIDTH: 0.409978
G1 X101.638 Y104.195 E.00091
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00254
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X78.102 Y104.15 E.00342
; LINE_WIDTH: 0.407658
G1 X77.802 Y103.97 E.00446
; LINE_WIDTH: 0.404228
G1 X77.59 Y103.69 E.00443
; LINE_WIDTH: 0.410288
G1 X77.498 Y103.29 E.00526
G1 X77.498 Y101.29 E.02563
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.29 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.29 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.00721
G1 X77.552 Y76.404 E.00416
; LINE_WIDTH: 0.404238
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.408238
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409758
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11716
G1 X101.689 Y75.801 E-.08959
G1 X101.861 Y75.839 E-.06679
G1 X102.214 Y76.044 E-.15523
G1 X102.43 Y76.354 E-.14367
G1 X102.504 Y76.7 E-.13443
G1 X102.504 Y76.84 E-.05313
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.242 Y75.593 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.412458
G1 F2391
M204 S5000
G1 X102.291 Y75.614 E.00069
G1 X102.497 Y75.783 E.00344
; LINE_WIDTH: 0.407048
G1 X102.772 Y76.159 E.00591
; LINE_WIDTH: 0.409548
G1 X102.893 Y76.646 E.00642
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408328
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.415168
G1 X102.82 Y103.711 E.00497
G1 X102.641 Y104.058 E.00506
; LINE_WIDTH: 0.407278
G1 X102.286 Y104.389 E.00618
; LINE_WIDTH: 0.406308
G1 X101.886 Y104.556 E.0055
; LINE_WIDTH: 0.409978
G1 X101.6 Y104.594 E.00369
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.652 J1947.116 E.08537
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.636 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.091 Y104.546 E.00355
; LINE_WIDTH: 0.408888
G1 X77.678 Y104.368 E.00574
; LINE_WIDTH: 0.412368
G1 X77.384 Y104.09 E.00522
; LINE_WIDTH: 0.413048
G1 X77.183 Y103.733 E.00529
G1 X77.105 Y103.295 E.00574
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.295 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.295 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.295 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.295 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.295 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.295 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.295 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.295 E.02557
; LINE_WIDTH: 0.409268
M73 P65 R5
G1 X77.105 Y85.295 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.295 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.295 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.295 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.295 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.414 I3.755 J-.285 E.01127
; LINE_WIDTH: 0.412568
G1 X77.281 Y76.063 E.00488
G1 X77.457 Y75.828 E.00378
; LINE_WIDTH: 0.404238
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409758
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409258
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.405 E.01785
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.683 J-1925.048 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.611 Y75.404 I.351 J-46.487 E.01588
; LINE_WIDTH: 0.406658
G1 X101.887 Y75.445 E.00353
; LINE_WIDTH: 0.412458
G1 X102.186 Y75.57 E.00418
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.614 E-.04313
G1 X102.497 Y75.783 E-.10143
G1 X102.772 Y76.159 E-.17684
G1 X102.893 Y76.646 E-.19082
G1 X102.894 Y76.7 E-.02051
G1 X102.894 Y77.298 E-.22727
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.826 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443428
G1 F2391
M204 S6000
G1 X98.402 Y75.825 E.03747
; LINE_WIDTH: 0.443608
G1 X94.402 Y75.825 E.0556
; LINE_WIDTH: 0.443798
G1 X90.402 Y75.825 E.05562
; LINE_WIDTH: 0.443988
G1 X86.402 Y75.825 E.05565
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z5.4 F42000
G1 X86.402 Y104.174 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2391
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.583 Y98.022 Z5.4 F42000
G1 X81.222 Y79.818 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2391
M204 S6000
G1 X83.38 Y78.671 E.03448
G1 X83.954 Y79.75 E.01724
G1 X84.574 Y80.917 E.01865
G1 X82.416 Y82.065 E.03448
G2 X81.466 Y80.322 I-28.368 J14.334 E.028
G1 X81.248 Y79.872 E.00706
M204 S250
G1 X80.697 Y79.722 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2391
M204 S5000
G1 X80.657 Y79.646 E.00114
G1 X83.553 Y78.106 E.04307
G1 X84.323 Y79.554 E.02153
G1 X85.139 Y81.09 E.02285
G1 X82.243 Y82.63 E.04307
G1 X82.157 Y82.467 E.00242
G1 X81.969 Y82.114 E.00525
G1 X81.176 Y80.626 E.02214
G1 X81 Y80.57 E.00242
G1 X81.06 Y80.418 E.00215
G1 X80.725 Y79.775 E.00952
M204 S250
G1 X80.861 Y80.644 F42000
; LINE_WIDTH: 0.357198
G1 F2391
M204 S5000
G1 X80.861 Y80.644 E0
G1 F12000
G1 X80.861 Y80.644 E0
; LINE_WIDTH: 0.404558
G1 F2391
G1 X80.783 Y80.685 E.00111
G1 X80.861 Y80.644 E.00111
; WIPE_START
G1 F12000
G1 X80.861 Y80.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.402 Y80.877 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.398228
G1 F2391
M204 S5000
G1 X79.535 Y80.62 E.00359
G1 X79.75 Y80.447 E.00343
; LINE_WIDTH: 0.403388
G1 X79.981 Y80.376 E.00305
G1 X80.258 Y80.396 E.0035
; LINE_WIDTH: 0.403508
G1 X80.51 Y80.526 E.00357
; LINE_WIDTH: 0.451948
G1 X80.706 Y80.727 E.00397
G1 X80.783 Y80.685 E.00125
G1 X80.706 Y80.727 E.00125
G1 X80.734 Y80.877 E.00217
; LINE_WIDTH: 0.420928
G1 X80.761 Y81.028 E.00202
; LINE_WIDTH: 0.394168
G1 X80.723 Y81.3 E.00337
; LINE_WIDTH: 0.399188
G1 X80.583 Y81.536 E.00343
G1 X80.272 Y81.724 E.00452
; LINE_WIDTH: 0.389368
G1 X79.986 Y81.752 E.00349
G1 X79.727 Y81.663 E.00332
; LINE_WIDTH: 0.389248
G1 X79.52 Y81.485 E.00332
G1 X79.402 Y81.238 E.00332
; LINE_WIDTH: 0.398108
G1 X79.402 Y80.937 E.00373
; WIPE_START
G1 F12000
M204 S6000
G1 X80.783 Y80.685 E-.53355
G1 X80.861 Y80.644 E-.0334
G1 X80.359 Y80.724 E-.19305
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X84.009 Y80.745
G1 Z5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F2391
M204 S6000
G1 X83.207 Y79.236 E.02244
G1 X81.787 Y79.991 E.02112
G1 X82.589 Y81.5 E.02244
G1 X83.956 Y80.773 E.02033
M204 S10000
G1 X83.464 Y80.578 F42000
G1 F2391
M204 S6000
G1 X83.04 Y79.781 E.01186
G1 X82.331 Y80.158 E.01054
G1 X82.755 Y80.955 E.01186
G1 X83.411 Y80.606 E.00976
; WIPE_START
G1 F18000
G1 X82.755 Y80.955 E-.28236
G1 X82.331 Y80.158 E-.34315
G1 X82.644 Y79.991 E-.13449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.88 Y87.523 Z5.4 F42000
G1 X84.654 Y92.246 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2391
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2391
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 5.08
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/99
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.4 I.917 J.8 P1  F42000
G1 X102.253 Y75.595 Z5.4
G1 Z5.08
G1 E.8 F1800
; LINE_WIDTH: 0.411208
G1 F2358
M204 S5000
G1 X102.292 Y75.613 E.00055
G1 X102.497 Y75.783 E.00342
; LINE_WIDTH: 0.407078
G1 X102.772 Y76.159 E.00593
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00641
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407808
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.894 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.894 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.894 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.415158
G1 X102.82 Y103.711 E.00497
G1 X102.641 Y104.058 E.00506
; LINE_WIDTH: 0.407238
G1 X102.286 Y104.389 E.00618
; LINE_WIDTH: 0.407988
G1 X101.888 Y104.558 E.0055
; LINE_WIDTH: 0.409748
G1 X101.6 Y104.594 E.00372
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1963.678 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.172 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X77.986 Y104.519 E.00568
; LINE_WIDTH: 0.403918
G1 X77.608 Y104.31 E.00545
; LINE_WIDTH: 0.403438
G1 X77.317 Y103.992 E.00543
; LINE_WIDTH: 0.408058
G1 X77.137 Y103.55 E.00608
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.291 E.00334
G1 X77.105 Y101.291 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.291 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.291 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.291 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.291 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.291 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.291 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.291 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.291 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.291 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.291 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.291 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.291 E.02553
; LINE_WIDTH: 0.408628
G3 X77.147 Y76.409 I3.291 J-.281 E.0113
; LINE_WIDTH: 0.410538
G1 X77.311 Y76.011 E.00552
; LINE_WIDTH: 0.412408
G1 X77.59 Y75.701 E.00537
; LINE_WIDTH: 0.412968
G1 X77.968 Y75.483 E.00564
G1 X78.405 Y75.405 E.00573
; LINE_WIDTH: 0.410268
G1 X80.405 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.405 Y75.405 E.02559
; LINE_WIDTH: 0.409268
G1 X84.405 Y75.405 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.405 E.01791
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.683 J-1921.729 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.612 Y75.404 I.351 J-46.039 E.01589
; LINE_WIDTH: 0.407568
G1 X101.947 Y75.457 E.00432
; LINE_WIDTH: 0.411208
G1 X102.198 Y75.571 E.00354
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2358
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.0031
; LINE_WIDTH: 0.403408
G1 X101.934 Y75.865 E.00319
; LINE_WIDTH: 0.403898
G1 X102.213 Y76.044 E.00418
; LINE_WIDTH: 0.406878
G1 X102.431 Y76.354 E.00481
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407808
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.407938
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.503 Y82.7 E.02548
; LINE_WIDTH: 0.408198
G1 X102.503 Y84.7 E.02549
; LINE_WIDTH: 0.408318
G1 X102.503 Y86.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.503 Y88.7 E.02551
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408828
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408958
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409088
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409338
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00555
; LINE_WIDTH: 0.403938
G1 X102.079 Y104.063 E.00546
; LINE_WIDTH: 0.403638
G1 X101.71 Y104.198 E.00495
; LINE_WIDTH: 0.409748
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.103 Y104.149 E.00416
; LINE_WIDTH: 0.410458
G1 X77.777 Y103.947 E.00491
G1 X77.597 Y103.705 E.00387
; LINE_WIDTH: 0.406608
G1 X77.5 Y103.369 E.00444
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.283 I49.055 J-1.091 E.02674
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.283 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.283 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.283 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.283 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.283 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.283 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.283 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.283 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.283 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.283 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.283 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.283 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.729 E.00707
M73 P66 R5
G1 X77.551 Y76.403 E.00422
; LINE_WIDTH: 0.404578
G1 X77.731 Y76.102 E.00443
; LINE_WIDTH: 0.403438
G1 X78.01 Y75.89 E.00441
; LINE_WIDTH: 0.408348
G1 X78.33 Y75.799 E.00425
; LINE_WIDTH: 0.410268
G3 X80.41 Y75.798 I1.108 J84.485 E.02665
; LINE_WIDTH: 0.409758
G1 X82.41 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.41 Y75.796 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.796 E.01785
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11726
G1 X101.689 Y75.801 E-.08962
G1 X101.934 Y75.865 E-.09634
G1 X102.213 Y76.044 E-.1259
G1 X102.431 Y76.354 E-.14392
G1 X102.504 Y76.7 E-.13435
G1 X102.504 Y76.838 E-.05261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.461 Z5.48 F42000
G1 X101.099 Y104.175 Z5.48
G1 Z5.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2358
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z5.48 F42000
G1 X101.099 Y75.826 Z5.48
G1 Z5.08
G1 E.8 F1800
; LINE_WIDTH: 0.443388
G1 F2358
M204 S6000
G1 X98.402 Y75.825 E.03747
; LINE_WIDTH: 0.443578
G1 X94.402 Y75.825 E.0556
; LINE_WIDTH: 0.443768
G1 X90.402 Y75.825 E.05562
; LINE_WIDTH: 0.443968
G1 X86.402 Y75.825 E.05565
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.732 Y79.535 Z5.48 F42000
G1 X81.222 Y79.818 Z5.48
G1 Z5.08
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2358
M204 S6000
G1 X83.38 Y78.671 E.03448
G1 X83.954 Y79.75 E.01724
G1 X84.574 Y80.917 E.01865
G1 X82.416 Y82.065 E.03449
G2 X81.466 Y80.323 I-28.39 J14.346 E.028
G1 X81.248 Y79.872 E.00706
M204 S250
G1 X80.657 Y79.646 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2358
M204 S5000
G1 X83.553 Y78.106 E.04307
G1 X84.323 Y79.554 E.02153
G1 X85.139 Y81.09 E.02285
G1 X82.243 Y82.63 E.04307
G2 X81.176 Y80.626 I-293.533 J155.089 E.02982
G1 X81 Y80.57 E.00242
G1 X81.06 Y80.418 E.00215
G1 X80.684 Y79.699 E.01066
M204 S250
G1 X80.861 Y80.644 F42000
; LINE_WIDTH: 0.357198
G1 F2358
M204 S5000
G1 X80.861 Y80.644 E0
G1 F12000
G1 X80.861 Y80.644 E0
M204 S250
G1 X80.135 Y80.38 F42000
; LINE_WIDTH: 0.388488
G1 F2358
M204 S5000
G1 X80.413 Y80.466 E.00352
; LINE_WIDTH: 0.416948
G1 X80.561 Y80.596 E.00256
; LINE_WIDTH: 0.448208
G1 X80.708 Y80.726 E.00276
G1 X80.785 Y80.685 E.00122
G1 X80.708 Y80.726 E.00122
G1 X80.733 Y80.86 E.00192
; LINE_WIDTH: 0.418088
G1 X80.758 Y80.994 E.00178
; LINE_WIDTH: 0.390848
G1 X80.733 Y81.267 E.00334
; LINE_WIDTH: 0.394168
G1 X80.604 Y81.509 E.00337
G1 X80.389 Y81.681 E.00338
; LINE_WIDTH: 0.395188
G1 X80.092 Y81.762 E.00379
G1 X79.779 Y81.694 E.00395
; LINE_WIDTH: 0.389408
G1 X79.527 Y81.49 E.00393
; LINE_WIDTH: 0.386868
G1 X79.402 Y81.237 E.0034
; LINE_WIDTH: 0.398068
G1 X79.402 Y80.877 E.00448
; LINE_WIDTH: 0.398228
G1 X79.535 Y80.62 E.00359
G1 X79.775 Y80.434 E.00377
; LINE_WIDTH: 0.393208
G1 X80.135 Y80.38 E.00446
M204 S250
G1 X80.861 Y80.644 F42000
; LINE_WIDTH: 0.402688
G1 F2358
M204 S5000
G1 X80.785 Y80.685 E.00109
G1 X80.808 Y80.672 E.00033
; WIPE_START
G1 F12000
M204 S6000
G1 X80.413 Y80.466 E-.16922
G1 X80.561 Y80.596 E-.07457
G1 X80.708 Y80.726 E-.07457
G1 X80.785 Y80.685 E-.03292
G1 X80.708 Y80.726 E-.03292
G1 X80.733 Y80.86 E-.05187
G1 X80.758 Y80.994 E-.05187
G1 X80.733 Y81.267 E-.10412
G1 X80.604 Y81.509 E-.10436
G1 X80.473 Y81.614 E-.06358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.48 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X84.009 Y80.745
G1 Z5.08
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F2358
M204 S6000
G1 X83.207 Y79.236 E.02244
G1 X81.787 Y79.991 E.02112
G1 X82.589 Y81.5 E.02244
G1 X83.956 Y80.773 E.02033
M204 S10000
G1 X83.464 Y80.578 F42000
G1 F2358
M204 S6000
G1 X83.04 Y79.781 E.01186
G1 X82.331 Y80.158 E.01054
G1 X82.755 Y80.955 E.01186
G1 X83.411 Y80.606 E.00976
; WIPE_START
G1 F18000
G1 X82.755 Y80.955 E-.28236
G1 X82.331 Y80.158 E-.34316
G1 X82.644 Y79.991 E-.13449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.88 Y87.523 Z5.48 F42000
G1 X84.654 Y92.246 Z5.48
G1 Z5.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2358
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.48 F42000
G1 Z5.08
G1 E.8 F1800
G1 F2358
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/99
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.48 I.917 J.8 P1  F42000
G1 X102.256 Y75.597 Z5.48
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.411178
G1 F2416
M204 S5000
G1 X102.291 Y75.613 E.0005
; LINE_WIDTH: 0.414158
G1 X102.577 Y75.862 E.00491
G1 X102.773 Y76.16 E.00461
; LINE_WIDTH: 0.409548
G1 X102.893 Y76.646 E.0064
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.441 I-4.022 J.288 E.0095
; LINE_WIDTH: 0.408438
G1 X102.762 Y103.858 E.00553
G1 X102.644 Y104.05 E.00286
; LINE_WIDTH: 0.406488
G1 X102.343 Y104.349 E.00539
; LINE_WIDTH: 0.410768
G1 X101.937 Y104.544 E.00579
G1 X101.6 Y104.594 E.00437
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.534 J414.403 E.08536
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.636 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.091 Y104.546 E.00355
; LINE_WIDTH: 0.411258
G1 X77.703 Y104.386 E.00539
; LINE_WIDTH: 0.413748
G1 X77.465 Y104.186 E.00402
G1 X77.206 Y103.786 E.00617
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00645
G1 X77.104 Y76.724 E.33894
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408228
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.413 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.413 Y75.405 E.02563
; LINE_WIDTH: 0.409758
G1 X82.413 Y75.405 E.02559
; LINE_WIDTH: 0.409258
G1 X84.413 Y75.405 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.405 E.01781
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.687 J-1926.487 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.613 Y75.404 I.351 J-46.127 E.0159
; LINE_WIDTH: 0.407568
G1 X101.947 Y75.457 E.00431
; LINE_WIDTH: 0.411178
G1 X102.201 Y75.572 E.00358
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2416
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.0031
; LINE_WIDTH: 0.403428
G1 X101.934 Y75.866 E.00319
; LINE_WIDTH: 0.403878
G1 X102.213 Y76.043 E.00417
; LINE_WIDTH: 0.406918
G1 X102.431 Y76.354 E.00482
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.414188
G1 X102.47 Y103.503 E.00297
G1 X102.346 Y103.801 E.00418
; LINE_WIDTH: 0.406488
G1 X102.043 Y104.083 E.00525
; LINE_WIDTH: 0.405628
G1 X101.715 Y104.196 E.0044
; LINE_WIDTH: 0.409038
G1 X101.634 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.408238
G1 X78.102 Y104.151 E.00342
G1 X77.797 Y103.968 E.00454
; LINE_WIDTH: 0.406808
G1 X77.598 Y103.71 E.00413
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00564
G1 X77.496 Y76.724 E.33881
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411208
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404508
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.425 Y75.798 E.02684
; LINE_WIDTH: 0.409758
G1 X82.425 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408748
G1 X85.808 Y75.796 E.01766
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11726
M73 P67 R5
G1 X101.689 Y75.801 E-.08965
G1 X101.934 Y75.866 E-.09641
G1 X102.213 Y76.043 E-.12563
G1 X102.431 Y76.354 E-.14408
G1 X102.504 Y76.7 E-.13442
G1 X102.504 Y76.838 E-.05255
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.63 Y83.415 Z5.56 F42000
G1 X86.402 Y104.174 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2416
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.636 Y96.561 Z5.56 F42000
G1 X101.099 Y75.826 Z5.56
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.443388
G1 F2416
M204 S6000
G1 X98.402 Y75.825 E.03747
; LINE_WIDTH: 0.443578
G1 X94.402 Y75.825 E.0556
; LINE_WIDTH: 0.443768
G1 X90.402 Y75.825 E.05562
; LINE_WIDTH: 0.443968
G1 X86.402 Y75.825 E.05565
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.732 Y79.535 Z5.56 F42000
G1 X81.222 Y79.818 Z5.56
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.449998
G1 F2416
M204 S6000
G1 X83.38 Y78.671 E.03449
G1 X83.954 Y79.75 E.01724
G1 X84.574 Y80.917 E.01865
G1 X82.416 Y82.065 E.03448
G2 X81.466 Y80.323 I-28.383 J14.343 E.028
G1 X81.248 Y79.872 E.00706
M204 S250
G1 X80.657 Y79.646 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2416
M204 S5000
G1 X83.553 Y78.106 E.04307
G1 X84.323 Y79.554 E.02153
G1 X85.139 Y81.09 E.02285
G1 X82.243 Y82.63 E.04307
G2 X81.176 Y80.626 I-292.889 J154.748 E.02982
G1 X81 Y80.57 E.00242
G1 X81.06 Y80.418 E.00215
G1 X80.684 Y79.699 E.01066
M204 S250
G1 X80.861 Y80.644 F42000
; LINE_WIDTH: 0.357188
G1 F2416
M204 S5000
G1 X80.861 Y80.644 E0
G1 F12000
G1 X80.861 Y80.644 E0
; LINE_WIDTH: 0.404538
G1 F2416
G1 X80.783 Y80.685 E.00111
; LINE_WIDTH: 0.451908
G1 X80.706 Y80.727 E.00125
G1 X80.734 Y80.877 E.00217
; LINE_WIDTH: 0.420908
G1 X80.761 Y81.028 E.00202
; LINE_WIDTH: 0.404468
G1 X80.695 Y81.366 E.00435
G1 X80.53 Y81.586 E.00347
; LINE_WIDTH: 0.402948
G1 X80.289 Y81.725 E.0035
; LINE_WIDTH: 0.405848
G1 X80.055 Y81.758 E.00299
G1 X79.785 Y81.697 E.00351
; LINE_WIDTH: 0.405268
G1 X79.52 Y81.484 E.0043
; LINE_WIDTH: 0.388628
G1 X79.397 Y81.224 E.00349
; LINE_WIDTH: 0.392428
G1 X79.405 Y80.877 E.00425
G1 X79.539 Y80.622 E.00352
; LINE_WIDTH: 0.388208
G1 X79.753 Y80.451 E.00331
; LINE_WIDTH: 0.394208
G1 X80.015 Y80.373 E.00337
G1 X80.288 Y80.407 E.00338
; LINE_WIDTH: 0.392388
G1 X80.527 Y80.543 E.00336
; LINE_WIDTH: 0.422148
G1 X80.616 Y80.635 E.00169
; LINE_WIDTH: 0.451908
G1 X80.706 Y80.727 E.00181
G1 X80.783 Y80.685 E.00125
; LINE_WIDTH: 0.404538
G1 X80.808 Y80.672 E.00035
; WIPE_START
G1 F12000
M204 S6000
G1 X80.783 Y80.685 E-.0106
G1 X80.706 Y80.727 E-.0334
G1 X80.734 Y80.877 E-.05821
G1 X80.761 Y81.028 E-.05821
G1 X80.695 Y81.366 E-.1309
G1 X80.53 Y81.586 E-.1045
G1 X80.289 Y81.725 E-.10564
G1 X80.055 Y81.758 E-.08974
G1 X79.785 Y81.697 E-.10539
G1 X79.655 Y81.593 E-.06342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X82.673 Y81.66
G1 Z5.16
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2416
M204 S2000
G1 X83.997 Y80.336 E.02458
G1 X83.8 Y79.964
G1 X82.342 Y81.422 E.02707
G1 X82.144 Y81.05
G1 X83.602 Y79.592 E.02707
G1 X83.404 Y79.22
G1 X81.947 Y80.678 E.02707
G1 X81.746 Y80.309
G1 X82.817 Y79.238 E.01989
M204 S10000
G1 X82.145 Y79.596 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0869718
G1 F2416
M204 S6000
G1 X82.001 Y79.703 E.00041
; LINE_WIDTH: 0.129903
G1 X81.857 Y79.809 E.00066
; LINE_WIDTH: 0.172835
G1 X81.712 Y79.916 E.00091
; LINE_WIDTH: 0.215767
G1 X81.568 Y80.023 E.00116
; WIPE_START
G1 F18000
G1 X81.712 Y79.916 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.37 Y79.157 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.0912884
G1 F2416
M204 S6000
G2 X83.27 Y79.03 I-.444 J.245 E.00039
G1 X83.23 Y79.046 E.0001
; LINE_WIDTH: 0.131595
G1 X83.056 Y79.175 E.00081
; LINE_WIDTH: 0.181408
G1 X82.882 Y79.304 E.00116
; WIPE_START
G1 F18000
G1 X83.056 Y79.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.198 Y80.671 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.304216
G1 F2416
M204 S6000
G1 X84.056 Y80.776 E.00165
; LINE_WIDTH: 0.260814
G1 X83.914 Y80.882 E.0014
; LINE_WIDTH: 0.217412
G1 X83.772 Y80.987 E.00115
; LINE_WIDTH: 0.17401
G1 X83.63 Y81.092 E.0009
; LINE_WIDTH: 0.130609
G1 X83.488 Y81.197 E.00065
; LINE_WIDTH: 0.0872067
G1 X83.345 Y81.302 E.0004
; WIPE_START
G1 F18000
G1 X83.488 Y81.197 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.289 Y88.787 Z5.56 F42000
G1 X84.654 Y92.246 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2416
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F2416
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 5.24
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/99
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.56 I.922 J.795 P1  F42000
G1 X101.49 Y76.24 Z5.56
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2268
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.0031
; LINE_WIDTH: 0.407488
G1 X101.861 Y75.839 E.00223
G1 X102.213 Y76.043 E.00518
; LINE_WIDTH: 0.406938
G1 X102.431 Y76.354 E.00482
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408058
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409428
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409618
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409818
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410008
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410208
G1 X102.502 Y103.275 E.03299
; LINE_WIDTH: 0.413868
G1 X102.471 Y103.5 E.00293
G1 X102.345 Y103.8 E.00421
; LINE_WIDTH: 0.406098
G1 X102.043 Y104.083 E.00525
G1 X101.706 Y104.199 E.00452
; LINE_WIDTH: 0.417268
G1 X101.638 Y104.198 E.00088
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00258
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.103 Y104.149 E.00416
; LINE_WIDTH: 0.403918
G1 X77.801 Y103.97 E.00442
; LINE_WIDTH: 0.407318
G1 X77.589 Y103.691 E.00447
; LINE_WIDTH: 0.410298
G1 X77.498 Y103.285 E.00533
G1 X77.498 Y101.285 E.02563
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.285 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.285 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.285 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.285 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.285 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.285 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.285 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.285 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.285 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.285 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.285 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.285 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.00715
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.403908
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.403468
G1 X77.959 Y75.915 E.00372
; LINE_WIDTH: 0.407198
G1 X78.33 Y75.8 E.00495
; LINE_WIDTH: 0.410268
G3 X80.415 Y75.798 I1.103 J56.286 E.02671
; LINE_WIDTH: 0.409758
G1 X82.415 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.415 Y75.796 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.796 E.01779
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11715
G1 X101.689 Y75.801 E-.08964
G1 X101.861 Y75.839 E-.06674
G1 X102.213 Y76.043 E-.15476
G1 X102.431 Y76.354 E-.14426
G1 X102.504 Y76.7 E-.13433
G1 X102.504 Y76.84 E-.05312
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.253 Y75.598 Z5.64 F42000
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.412308
G1 F2268
M204 S5000
G1 X102.291 Y75.614 E.00053
; LINE_WIDTH: 0.414168
G1 X102.577 Y75.862 E.00491
G1 X102.773 Y76.161 E.00462
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00639
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408058
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408448
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409428
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409618
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409818
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410008
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410208
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.024 J.288 E.0095
; LINE_WIDTH: 0.406108
G1 X102.757 Y103.86 E.00554
; LINE_WIDTH: 0.415128
G1 X102.485 Y104.233 E.00599
G1 X102.239 Y104.415 E.00397
; LINE_WIDTH: 0.404228
G1 X101.882 Y104.554 E.00483
; LINE_WIDTH: 0.417268
G1 X101.6 Y104.591 E.00371
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J1985.335 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.274 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.113 Y104.559 E.00401
; LINE_WIDTH: 0.412858
G1 X77.786 Y104.431 E.00453
G1 X77.531 Y104.243 E.00408
; LINE_WIDTH: 0.403458
G1 X77.295 Y103.955 E.00469
; LINE_WIDTH: 0.407318
G1 X77.135 Y103.539 E.00566
; LINE_WIDTH: 0.410298
G1 X77.105 Y103.292 E.00319
G1 X77.105 Y101.292 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.292 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.292 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.292 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.292 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.292 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.292 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.292 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.292 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.292 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.292 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.292 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.292 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.413 I3.748 J-.284 E.01125
; LINE_WIDTH: 0.412848
G1 X77.269 Y76.086 E.00453
G1 X77.457 Y75.831 E.00408
; LINE_WIDTH: 0.403468
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.407308
G1 X78.161 Y75.435 E.00566
; LINE_WIDTH: 0.410268
G1 X78.407 Y75.405 E.00319
G1 X80.407 Y75.405 E.02563
; LINE_WIDTH: 0.409758
M73 P68 R5
G1 X82.407 Y75.405 E.02559
; LINE_WIDTH: 0.409258
G1 X84.407 Y75.405 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.405 E.01788
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.69 J-1924.588 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.613 Y75.404 I.351 J-46.617 E.01591
; LINE_WIDTH: 0.406668
G1 X101.887 Y75.445 E.00351
; LINE_WIDTH: 0.412308
G1 X102.198 Y75.575 E.00434
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.614 E-.03843
G1 X102.577 Y75.862 E-.14407
G1 X102.773 Y76.161 E-.13559
G1 X102.893 Y76.646 E-.19001
G1 X102.894 Y76.7 E-.02051
G1 X102.894 Y77.309 E-.2314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.826 Z5.64 F42000
G1 Z5.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443258
G1 F2268
M204 S6000
G1 X100.402 Y75.826 E.00968
; LINE_WIDTH: 0.443458
G1 X96.402 Y75.825 E.05558
; LINE_WIDTH: 0.443658
G1 X92.402 Y75.825 E.05561
; LINE_WIDTH: 0.443858
G1 X88.402 Y75.825 E.05563
; LINE_WIDTH: 0.443968
G1 X86.402 Y75.825 E.02782
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z5.64 F42000
G1 X101.099 Y104.175 Z5.64
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2268
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.561 Y96.768 Z5.64 F42000
G1 X82.125 Y78.914 Z5.64
G1 Z5.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.506088
G1 F2268
M204 S5000
G1 X82.069 Y78.918 E.00089
; LINE_WIDTH: 0.474433
G1 X82.014 Y78.923 E.00083
; LINE_WIDTH: 0.442778
G1 X81.958 Y78.928 E.00077
; LINE_WIDTH: 0.411123
G1 X81.902 Y78.933 E.00072
; LINE_WIDTH: 0.379468
G1 X81.863 Y78.936 E.00046
; LINE_WIDTH: 0.357168
G1 X80.686 Y79.566 E.01479
G1 X80.647 Y79.598 E.00056
G1 X80.608 Y79.631 E.00056
G1 X80.622 Y79.68 E.00056
G1 X80.637 Y79.728 E.00056
G2 X80.694 Y79.843 I.305 J-.08 E.00143
G1 X80.841 Y80.12 E.00348
G1 X80.988 Y80.397 E.00348
; LINE_WIDTH: 0.388628
G1 X81.024 Y80.558 E.00199
G1 X81.137 Y80.677 E.00199
; LINE_WIDTH: 0.357168
G1 X81.528 Y81.413 E.00924
G1 X81.92 Y82.149 E.00924
G1 X82.058 Y82.41 E.00327
; LINE_WIDTH: 0.379128
G1 X82.089 Y82.434 E.00046
; LINE_WIDTH: 0.410168
G1 X82.132 Y82.469 E.00071
; LINE_WIDTH: 0.441208
G1 X82.175 Y82.504 E.00076
; LINE_WIDTH: 0.472248
G1 X82.218 Y82.539 E.00082
; LINE_WIDTH: 0.503288
G1 X82.261 Y82.574 E.00088
G1 X82.296 Y82.556 E.00063
; LINE_WIDTH: 0.500028
G1 X83.459 Y81.938 E.02073
; LINE_WIDTH: 0.540261
G1 X83.521 Y81.882 E.00141
; LINE_WIDTH: 0.580495
G1 X83.583 Y81.827 E.00152
; LINE_WIDTH: 0.620728
G1 X83.644 Y81.771 E.00163
; WIPE_START
G1 F12000
M204 S6000
G1 X83.583 Y81.827 E-.03152
G1 X83.521 Y81.882 E-.03152
G1 X83.459 Y81.938 E-.03152
G1 X82.296 Y82.556 E-.50052
G1 X82.261 Y82.574 E-.01513
G1 X82.218 Y82.539 E-.02102
G1 X82.175 Y82.504 E-.02102
G1 X82.132 Y82.469 E-.02102
G1 X82.089 Y82.434 E-.02102
G1 X82.058 Y82.41 E-.01487
G1 X81.995 Y82.292 E-.05081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.901 Y81.734 Z5.64 F42000
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.390048
G1 F2268
M204 S5000
G1 X80.188 Y81.746 E.00349
; LINE_WIDTH: 0.386908
G1 X80.443 Y81.646 E.0033
; LINE_WIDTH: 0.398068
G1 X80.688 Y81.381 E.00448
; LINE_WIDTH: 0.398248
G1 X80.765 Y81.103 E.00359
; LINE_WIDTH: 0.433108
G1 X80.711 Y80.75 E.00484
G1 X81.024 Y80.558 E.00498
; LINE_WIDTH: 0.420268
G1 X80.865 Y80.642 E.00236
; LINE_WIDTH: 0.451908
G1 X80.706 Y80.727 E.00255
G1 X80.644 Y80.66 E.00129
; LINE_WIDTH: 0.424528
G1 X80.582 Y80.594 E.00121
; LINE_WIDTH: 0.397148
G1 X80.356 Y80.437 E.00341
; LINE_WIDTH: 0.388928
G1 X80.09 Y80.373 E.00332
; LINE_WIDTH: 0.389088
G1 X79.82 Y80.42 E.00332
; LINE_WIDTH: 0.394188
G1 X79.587 Y80.566 E.00337
G1 X79.432 Y80.793 E.00338
; LINE_WIDTH: 0.392368
G1 X79.376 Y81.062 E.00336
; LINE_WIDTH: 0.399288
G1 X79.427 Y81.333 E.00343
G1 X79.583 Y81.561 E.00344
; LINE_WIDTH: 0.395408
G1 X79.901 Y81.734 E.00446
; WIPE_START
G1 F12000
M204 S6000
G1 X79.583 Y81.561 E-.13755
G1 X79.427 Y81.333 E-.10482
G1 X79.376 Y81.062 E-.10468
G1 X79.432 Y80.793 E-.10443
G1 X79.587 Y80.566 E-.10458
G1 X79.82 Y80.42 E-.10429
G1 X80.078 Y80.375 E-.09966
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.073 Y80.963 Z5.64 F42000
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.472233
G1 F2268
M204 S5000
G1 X85.078 Y81.018 E.00082
; LINE_WIDTH: 0.503288
G1 X85.083 Y81.073 E.00088
G1 X85.049 Y81.093 E.00063
; LINE_WIDTH: 0.500008
G1 X83.886 Y81.711 E.02073
; LINE_WIDTH: 0.540235
G1 X83.805 Y81.731 E.00141
; LINE_WIDTH: 0.580481
G1 X83.725 Y81.751 E.00152
; LINE_WIDTH: 0.620728
G1 X83.644 Y81.771 E.00163
G1 X83.616 Y81.718 E.00119
; LINE_WIDTH: 0.580495
G1 X83.588 Y81.665 E.00111
; LINE_WIDTH: 0.540261
G1 X83.559 Y81.611 E.00103
; LINE_WIDTH: 0.500028
G1 X82.143 Y78.948 E.04749
; LINE_WIDTH: 0.506088
G1 X82.125 Y78.914 E.00061
G1 X82.16 Y78.87 E.00089
; LINE_WIDTH: 0.474428
G1 X82.195 Y78.827 E.00083
; LINE_WIDTH: 0.442768
G1 X82.23 Y78.783 E.00077
; LINE_WIDTH: 0.411108
G1 X82.265 Y78.74 E.00072
; LINE_WIDTH: 0.379448
G1 X82.29 Y78.709 E.00046
; LINE_WIDTH: 0.357168
G1 X83.47 Y78.086 E.01479
G1 X83.519 Y78.072 E.00056
G1 X83.567 Y78.057 E.00056
G1 X83.6 Y78.096 E.00056
G1 X83.632 Y78.136 E.00056
G1 X83.821 Y78.489 E.00443
G1 X84.872 Y80.46 E.02477
G1 X85.06 Y80.813 E.00443
; LINE_WIDTH: 0.379068
G1 X85.064 Y80.852 E.00046
; LINE_WIDTH: 0.410123
G1 X85.068 Y80.903 E.00065
; WIPE_START
G1 F8432.859
M204 S6000
G1 X85.078 Y81.018 E-.04383
G1 X85.083 Y81.073 E-.02103
G1 X85.049 Y81.093 E-.01513
G1 X83.886 Y81.711 E-.50052
G1 X83.805 Y81.731 E-.03152
G1 X83.725 Y81.751 E-.03152
G1 X83.644 Y81.771 E-.03152
G1 X83.616 Y81.718 E-.02293
G1 X83.588 Y81.665 E-.02294
G1 X83.559 Y81.611 E-.02294
G1 X83.539 Y81.574 E-.01612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.332 Y89.165 Z5.64 F42000
G1 X84.654 Y92.246 Z5.64
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2268
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.64 F42000
G1 Z5.24
G1 E.8 F1800
G1 F2268
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.64 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 64/99
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 15
G1 X102.263 Y75.6 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.411118
G1 F2222
M204 S5000
G1 X102.292 Y75.613 E.0004
; LINE_WIDTH: 0.414058
G1 X102.576 Y75.861 E.00489
G1 X102.783 Y76.184 E.00496
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y103.275 E.033
; LINE_WIDTH: 0.413698
G1 X102.857 Y103.585 E.00403
G1 X102.667 Y104.023 E.00618
; LINE_WIDTH: 0.405588
G1 X102.327 Y104.362 E.00607
; LINE_WIDTH: 0.410938
G1 X101.937 Y104.545 E.00554
G1 X101.6 Y104.594 E.00437
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-3.501 J413.67 E.08537
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.347 J67.273 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.006 Y104.524 E.00543
; LINE_WIDTH: 0.404358
G1 X77.594 Y104.304 E.00589
; LINE_WIDTH: 0.407388
G1 X77.295 Y103.959 E.00581
G1 X77.2 Y103.753 E.00289
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00603
G1 X77.104 Y76.724 E.33894
G1 X77.186 Y76.277 E.0058
; LINE_WIDTH: 0.402798
G1 X77.393 Y75.9 E.00542
; LINE_WIDTH: 0.406768
G1 X77.701 Y75.619 E.00528
; LINE_WIDTH: 0.412938
G1 X78.064 Y75.456 E.00513
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410258
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409748
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409248
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408748
G1 X85.808 Y75.405 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.69 J-1924.588 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.614 Y75.404 I.351 J-46.241 E.01592
; LINE_WIDTH: 0.407578
G1 X101.947 Y75.457 E.00429
; LINE_WIDTH: 0.411118
G1 X102.209 Y75.575 E.00369
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2222
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.0031
; LINE_WIDTH: 0.403488
G1 X101.934 Y75.865 E.00319
; LINE_WIDTH: 0.403868
G1 X102.213 Y76.043 E.00416
; LINE_WIDTH: 0.408448
G1 X102.431 Y76.354 E.00485
G1 X102.504 Y76.7 E.00451
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413698
G1 X102.472 Y103.498 E.0029
G1 X102.346 Y103.801 E.00424
; LINE_WIDTH: 0.406878
G1 X102.043 Y104.084 E.00527
G1 X101.715 Y104.196 E.0044
; LINE_WIDTH: 0.409028
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.141 Y104.161 E.00367
; LINE_WIDTH: 0.410968
G1 X77.785 Y103.956 E.00526
G1 X77.606 Y103.723 E.00377
; LINE_WIDTH: 0.407608
G1 X77.496 Y103.301 E.00555
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.33907
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411028
G1 X77.751 Y76.079 E.0049
G1 X78.01 Y75.89 E.00411
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410258
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.409748
G1 X82.425 Y75.797 E.02559
; LINE_WIDTH: 0.409248
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408748
G1 X85.808 Y75.796 E.01766
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11726
M73 P69 R5
G1 X101.689 Y75.801 E-.08968
G1 X101.934 Y75.865 E-.09629
G1 X102.213 Y76.043 E-.12541
G1 X102.431 Y76.354 E-.14451
G1 X102.504 Y76.7 E-.13441
G1 X102.504 Y76.838 E-.05244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.112 Y84.46 Z5.72 F42000
G1 X101.099 Y104.175 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2222
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z5.72 F42000
G1 X101.099 Y75.826 Z5.72
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.443358
G1 F2222
M204 S6000
G1 X98.402 Y75.826 E.03747
; LINE_WIDTH: 0.443548
G1 X94.402 Y75.825 E.05559
; LINE_WIDTH: 0.443748
G1 X90.402 Y75.825 E.05562
; LINE_WIDTH: 0.443948
G1 X86.402 Y75.825 E.05564
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.125 Y78.914 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.506068
G1 F2222
M204 S5000
G1 X82.069 Y78.918 E.00089
; LINE_WIDTH: 0.474418
M73 P69 R4
G1 X82.014 Y78.923 E.00083
; LINE_WIDTH: 0.442768
G1 X81.958 Y78.928 E.00077
; LINE_WIDTH: 0.411118
G1 X81.902 Y78.933 E.00072
; LINE_WIDTH: 0.379468
G1 X81.863 Y78.936 E.00046
; LINE_WIDTH: 0.357168
G1 X80.686 Y79.566 E.01479
G1 X80.647 Y79.598 E.00056
G1 X80.608 Y79.631 E.00056
G1 X80.622 Y79.68 E.00056
G1 X80.637 Y79.728 E.00056
G1 X80.988 Y80.397 E.00837
; LINE_WIDTH: 0.361898
G1 X80.994 Y80.422 E.00028
; LINE_WIDTH: 0.375258
G1 X81.009 Y80.49 E.00082
; LINE_WIDTH: 0.388608
G1 X81.024 Y80.558 E.00085
; LINE_WIDTH: 0.422268
G1 X80.863 Y80.643 E.00239
; LINE_WIDTH: 0.455928
G1 X80.703 Y80.728 E.00259
G1 X80.56 Y80.596 E.00278
; LINE_WIDTH: 0.430438
G1 X80.417 Y80.464 E.00262
; LINE_WIDTH: 0.404948
G1 X80.09 Y80.372 E.0043
; LINE_WIDTH: 0.391268
G1 X79.819 Y80.42 E.00335
; LINE_WIDTH: 0.399388
G1 X79.527 Y80.632 E.0045
G1 X79.396 Y80.89 E.0036
; LINE_WIDTH: 0.398248
G1 X79.381 Y81.166 E.00343
; LINE_WIDTH: 0.403428
G1 X79.459 Y81.395 E.00305
G1 X79.639 Y81.61 E.00353
; LINE_WIDTH: 0.403008
G1 X79.913 Y81.74 E.00382
; LINE_WIDTH: 0.391268
G1 X80.188 Y81.745 E.00335
; LINE_WIDTH: 0.389428
G1 X80.443 Y81.648 E.00332
G1 X80.654 Y81.438 E.0036
; LINE_WIDTH: 0.396208
G1 X80.762 Y81.122 E.00413
; LINE_WIDTH: 0.426068
G1 X80.732 Y80.925 E.00265
; LINE_WIDTH: 0.455928
G1 X80.703 Y80.728 E.00285
G1 X80.863 Y80.643 E.00259
; LINE_WIDTH: 0.422268
G1 X81.024 Y80.558 E.00239
; LINE_WIDTH: 0.388608
G1 X81.072 Y80.608 E.00085
; LINE_WIDTH: 0.375238
G1 X81.12 Y80.659 E.00082
; LINE_WIDTH: 0.361878
G1 X81.137 Y80.677 E.00028
; LINE_WIDTH: 0.357168
G1 X82.058 Y82.41 E.02175
; LINE_WIDTH: 0.378998
G1 X82.088 Y82.434 E.00046
; LINE_WIDTH: 0.410073
G1 X82.131 Y82.469 E.00071
; LINE_WIDTH: 0.441148
G1 X82.174 Y82.504 E.00077
; LINE_WIDTH: 0.472218
G1 X82.218 Y82.539 E.00082
; LINE_WIDTH: 0.503288
G1 X82.261 Y82.574 E.00088
G1 X82.296 Y82.556 E.00063
; LINE_WIDTH: 0.500008
G1 X83.459 Y81.938 E.02073
; LINE_WIDTH: 0.540241
G1 X83.521 Y81.882 E.00141
; LINE_WIDTH: 0.580475
G1 X83.583 Y81.827 E.00152
; LINE_WIDTH: 0.620708
G1 X83.644 Y81.771 E.00163
; WIPE_START
G1 F12000
M204 S6000
G1 X83.583 Y81.827 E-.03152
G1 X83.521 Y81.882 E-.03152
G1 X83.459 Y81.938 E-.03152
G1 X82.296 Y82.556 E-.50051
G1 X82.261 Y82.574 E-.01515
G1 X82.218 Y82.539 E-.02104
G1 X82.174 Y82.504 E-.02105
G1 X82.131 Y82.469 E-.02105
G1 X82.088 Y82.434 E-.02105
G1 X82.058 Y82.41 E-.01478
G1 X81.995 Y82.291 E-.05082
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.125 Y78.914 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.506068
G1 F2222
M204 S5000
G1 X82.16 Y78.87 E.00089
; LINE_WIDTH: 0.474418
G1 X82.195 Y78.827 E.00083
; LINE_WIDTH: 0.442768
G1 X82.23 Y78.783 E.00077
; LINE_WIDTH: 0.411118
G1 X82.265 Y78.74 E.00072
; LINE_WIDTH: 0.379468
G1 X82.29 Y78.709 E.00046
; LINE_WIDTH: 0.357168
G1 X83.47 Y78.086 E.01479
G1 X83.519 Y78.072 E.00056
G1 X83.567 Y78.057 E.00056
G1 X83.6 Y78.096 E.00056
G1 X83.632 Y78.136 E.00056
G1 X83.821 Y78.489 E.00443
G1 X84.872 Y80.46 E.02477
G1 X85.06 Y80.813 E.00443
; LINE_WIDTH: 0.379128
G1 X85.064 Y80.852 E.00046
; LINE_WIDTH: 0.410168
G1 X85.069 Y80.907 E.00071
; LINE_WIDTH: 0.441208
G1 X85.073 Y80.963 E.00076
; LINE_WIDTH: 0.472248
G1 X85.078 Y81.018 E.00082
; LINE_WIDTH: 0.503288
G1 X85.083 Y81.073 E.00088
G1 X85.049 Y81.093 E.00063
; LINE_WIDTH: 0.500028
G1 X84.696 Y81.281 E.0063
G1 X83.886 Y81.711 E.01444
; LINE_WIDTH: 0.540228
G1 X83.805 Y81.731 E.00141
; LINE_WIDTH: 0.580468
G1 X83.725 Y81.751 E.00152
; LINE_WIDTH: 0.620708
G1 X83.644 Y81.771 E.00163
G1 X83.616 Y81.718 E.00119
; LINE_WIDTH: 0.580468
G1 X83.588 Y81.665 E.00111
; LINE_WIDTH: 0.540228
G1 X83.559 Y81.611 E.00103
; LINE_WIDTH: 0.499998
G1 X82.153 Y78.967 E.04714
; WIPE_START
G1 F12000
M204 S6000
G1 X82.16 Y78.87 E-.03672
G1 X82.195 Y78.827 E-.0212
G1 X82.23 Y78.783 E-.0212
G1 X82.265 Y78.74 E-.0212
G1 X82.29 Y78.709 E-.01494
G1 X83.47 Y78.086 E-.50718
G1 X83.519 Y78.072 E-.01933
G1 X83.567 Y78.057 E-.01933
G1 X83.6 Y78.096 E-.01932
G1 X83.632 Y78.136 E-.01932
G1 X83.707 Y78.275 E-.06024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.223 Y85.89 Z5.72 F42000
G1 X84.654 Y92.246 Z5.72
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2222
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F2222
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.72 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 65/99
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y76.24 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2175
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.0031
; LINE_WIDTH: 0.407488
G1 X101.861 Y75.839 E.00223
G1 X102.212 Y76.042 E.00517
; LINE_WIDTH: 0.404878
G1 X102.43 Y76.354 E.0048
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.413708
G1 X102.471 Y103.498 E.0029
G1 X102.347 Y103.801 E.00424
; LINE_WIDTH: 0.408668
G1 X102.043 Y104.085 E.0053
G1 X101.71 Y104.198 E.00448
; LINE_WIDTH: 0.409758
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X78.021 Y104.115 E.00452
; LINE_WIDTH: 0.405838
G1 X77.735 Y103.905 E.0045
G1 X77.541 Y103.572 E.00488
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.29 E.00364
G1 X77.496 Y76.724 E.33894
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413598
G1 X77.61 Y76.283 E.00173
G1 X77.755 Y76.075 E.00327
; LINE_WIDTH: 0.411208
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409758
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408748
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11715
G1 X101.689 Y75.801 E-.08968
G1 X101.861 Y75.839 E-.06671
G1 X102.212 Y76.042 E-.15434
G1 X102.43 Y76.354 E-.14448
G1 X102.504 Y76.7 E-.13437
G1 X102.504 Y76.84 E-.05328
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.261 Y75.601 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.412228
G1 F2175
M204 S5000
G1 X102.291 Y75.613 E.00043
G1 X102.494 Y75.78 E.00337
; LINE_WIDTH: 0.406798
G1 X102.77 Y76.144 E.00581
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00661
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409048
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409248
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409638
G1 X102.895 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.44 I-4.022 J.288 E.0095
; LINE_WIDTH: 0.404858
G1 X102.755 Y103.861 E.00554
; LINE_WIDTH: 0.416648
G1 X102.531 Y104.189 E.00518
G1 X102.264 Y104.403 E.00445
; LINE_WIDTH: 0.407208
G1 X101.892 Y104.555 E.00511
; LINE_WIDTH: 0.409758
G1 X101.6 Y104.594 E.00377
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.589 I-4.653 J1961.227 E.08537
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.637 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.005 Y104.527 E.00467
; LINE_WIDTH: 0.412908
G1 X77.675 Y104.364 E.00475
G1 X77.436 Y104.149 E.00415
; LINE_WIDTH: 0.406718
G1 X77.193 Y103.757 E.00586
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.295 E.006
G1 X77.104 Y76.724 E.339
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403948
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409758
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409258
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.405 E.01782
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.69 J-1921.27 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.615 Y75.405 I.351 J-46.936 E.01593
; LINE_WIDTH: 0.406678
G1 X101.887 Y75.445 E.00349
; LINE_WIDTH: 0.412228
G1 X102.205 Y75.578 E.00444
; WIPE_START
G1 F12000
M204 S6000
G1 X102.291 Y75.613 E-.03543
G1 X102.494 Y75.78 E-.09958
G1 X102.77 Y76.144 E-.17373
G1 X102.893 Y76.646 E-.19637
G1 X102.894 Y76.7 E-.0205
G1 X102.894 Y77.317 E-.23439
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.099 Y75.826 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2175
M204 S6000
G1 X100.402 Y75.826 E.00968
; LINE_WIDTH: 0.443318
G1 X98.402 Y75.826 E.02778
; LINE_WIDTH: 0.443528
G1 X94.402 Y75.825 E.05559
; LINE_WIDTH: 0.443628
G1 X92.402 Y75.825 E.0278
; LINE_WIDTH: 0.443838
G1 X88.402 Y75.825 E.05563
; LINE_WIDTH: 0.443948
M73 P70 R4
G1 X86.402 Y75.825 E.02782
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.865 Y83.439 Z5.8 F42000
G1 X86.402 Y104.174 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2175
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443518
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443828
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443978
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444128
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444288
G1 X101.099 Y104.175 E.02784
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.152 Y97.642 Z5.8 F42000
G1 X85.153 Y81.094 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.399988
G1 F2175
M204 S5000
G1 X85.114 Y80.975 E.00157
; LINE_WIDTH: 0.381788
G1 X85.074 Y80.856 E.00149
; LINE_WIDTH: 0.363588
G1 X85.06 Y80.813 E.0005
; LINE_WIDTH: 0.357168
G1 X84 Y78.819 E.02503
; WIPE_START
G1 F12000
M204 S6000
G1 X84.939 Y80.585 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.644 Y81.771 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.620708
G1 F2175
M204 S5000
G1 X83.619 Y81.724 E.00105
; LINE_WIDTH: 0.581088
G1 X83.594 Y81.677 E.00098
; LINE_WIDTH: 0.541468
G1 X83.569 Y81.63 E.00091
; LINE_WIDTH: 0.501848
G1 X83.485 Y81.471 E.00284
; LINE_WIDTH: 0.501688
G1 X82.546 Y79.706 E.03159
; WIPE_START
G1 F12000
M204 S6000
G1 X83.485 Y81.471 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.239 Y82.643 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.400008
G1 F2175
M204 S5000
G1 X82.162 Y82.544 E.00157
; LINE_WIDTH: 0.381798
G1 X82.085 Y82.445 E.00149
; LINE_WIDTH: 0.363588
G1 X82.058 Y82.41 E.0005
; LINE_WIDTH: 0.357168
G1 X81.137 Y80.677 E.02175
; LINE_WIDTH: 0.361858
G1 X81.12 Y80.659 E.00028
; LINE_WIDTH: 0.375228
G1 X81.072 Y80.609 E.00082
; LINE_WIDTH: 0.388588
G1 X81.024 Y80.558 E.00085
; LINE_WIDTH: 0.420828
G1 X80.864 Y80.643 E.00237
; LINE_WIDTH: 0.453068
G1 X80.705 Y80.727 E.00256
G1 X80.591 Y80.615 E.00227
; LINE_WIDTH: 0.422878
G1 X80.477 Y80.503 E.00211
; LINE_WIDTH: 0.392688
G1 X80.206 Y80.388 E.0036
; LINE_WIDTH: 0.398348
G1 X79.809 Y80.418 E.00495
G1 X79.527 Y80.63 E.00439
; LINE_WIDTH: 0.395848
G1 X79.393 Y80.916 E.00389
G1 X79.389 Y81.2 E.00351
; LINE_WIDTH: 0.400128
G1 X79.492 Y81.456 E.00344
G1 X79.773 Y81.686 E.00453
; LINE_WIDTH: 0.389268
G1 X80.05 Y81.757 E.00348
G1 X80.32 Y81.708 E.00333
; LINE_WIDTH: 0.399268
G1 X80.595 Y81.521 E.00413
; LINE_WIDTH: 0.409968
G2 X80.763 Y81.1 I-.565 J-.47 E.0059
; LINE_WIDTH: 0.453068
G1 X80.705 Y80.727 E.00537
; WIPE_START
G1 F12000
M204 S6000
G1 X80.763 Y81.1 E-.14358
G1 X80.707 Y81.336 E-.09206
G1 X80.595 Y81.521 E-.08235
G1 X80.32 Y81.708 E-.1261
G1 X80.05 Y81.757 E-.10425
G1 X79.773 Y81.686 E-.1089
G1 X79.564 Y81.514 E-.10276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.835 Y88.41 Z5.8 F42000
G1 X84.654 Y92.246 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2175
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2175
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 66/99
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 15
G1 X102.264 Y75.602 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.412178
G1 F2164
M204 S5000
G1 X102.291 Y75.614 E.00037
G1 X102.495 Y75.781 E.0034
; LINE_WIDTH: 0.406188
G1 X102.769 Y76.153 E.00586
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.0065
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.895 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.895 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.895 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.895 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.441 I-4.024 J.288 E.0095
; LINE_WIDTH: 0.404358
G1 X102.744 Y103.887 E.00589
; LINE_WIDTH: 0.415428
G1 X102.485 Y104.233 E.00561
G1 X102.294 Y104.38 E.00313
; LINE_WIDTH: 0.407998
G1 X101.888 Y104.558 E.00565
; LINE_WIDTH: 0.409748
G1 X101.6 Y104.594 E.00372
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.653 J1965.519 E.08536
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.636 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.048 Y104.537 E.00411
; LINE_WIDTH: 0.415118
G1 X77.712 Y104.388 E.00476
G1 X77.439 Y104.15 E.00471
; LINE_WIDTH: 0.406718
G1 X77.193 Y103.757 E.00589
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.295 E.00601
G1 X77.104 Y77.295 E.33172
G3 X77.141 Y76.414 I3.754 J-.285 E.01127
; LINE_WIDTH: 0.412578
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.828 E.00378
; LINE_WIDTH: 0.404218
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.409928
G1 X78.153 Y75.433 E.00561
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00331
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409758
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409248
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408748
G1 X85.808 Y75.405 E.01786
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.689 J-1917.963 E.11284
G1 X100.402 Y75.411 E.07878
G2 X101.616 Y75.405 I.351 J-47.031 E.01594
; LINE_WIDTH: 0.406658
G1 X101.887 Y75.445 E.00349
; LINE_WIDTH: 0.412178
G1 X102.209 Y75.579 E.00449
M204 S250
G1 X101.49 Y76.24 F42000
; LINE_WIDTH: 0.419998
G1 F2164
M204 S5000
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.0031
; LINE_WIDTH: 0.407478
G1 X101.861 Y75.839 E.00223
G1 X102.212 Y76.042 E.00516
; LINE_WIDTH: 0.407048
G1 X102.431 Y76.354 E.00484
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408648
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408848
G1 X102.503 Y88.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409238
G1 X102.503 Y92.7 E.02556
; LINE_WIDTH: 0.409438
G1 X102.502 Y94.7 E.02557
; LINE_WIDTH: 0.409628
G1 X102.502 Y96.7 E.02558
; LINE_WIDTH: 0.409828
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410018
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413698
G1 X102.472 Y103.498 E.0029
G1 X102.346 Y103.801 E.00424
; LINE_WIDTH: 0.406128
G1 X102.042 Y104.084 E.00527
G1 X101.71 Y104.198 E.00444
; LINE_WIDTH: 0.409748
G1 X101.637 Y104.194 E.00094
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00253
G1 X101.49 Y103.76 E.00395
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X78.057 Y104.132 E.00403
; LINE_WIDTH: 0.406568
G1 X77.735 Y103.905 E.005
; LINE_WIDTH: 0.405868
G1 X77.541 Y103.572 E.00488
; LINE_WIDTH: 0.408338
G1 X77.496 Y103.3 E.00351
; LINE_WIDTH: 0.408588
G3 X77.496 Y101.29 I80.338 J-1.01 E.02565
G1 X77.496 Y76.724 E.31341
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.404218
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.407878
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.418 Y75.798 E.00537
G1 X80.418 Y75.798 E.02563
; LINE_WIDTH: 0.409758
G1 X82.418 Y75.797 E.02559
; LINE_WIDTH: 0.409248
G1 X84.418 Y75.796 E.02556
; LINE_WIDTH: 0.408748
G1 X85.808 Y75.796 E.01774
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.498 Y75.939 E-.11715
G1 X101.689 Y75.801 E-.0897
G1 X101.861 Y75.839 E-.06668
G1 X102.212 Y76.042 E-.15424
G1 X102.431 Y76.354 E-.14473
G1 X102.504 Y76.7 E-.13439
G1 X102.504 Y76.84 E-.05311
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.63 Y83.416 Z5.88 F42000
G1 X86.402 Y104.174 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2164
M204 S6000
G1 X87.099 Y104.174 E.00968
; LINE_WIDTH: 0.443368
G1 X89.099 Y104.175 E.02778
; LINE_WIDTH: 0.443528
G1 X91.099 Y104.175 E.02779
; LINE_WIDTH: 0.443678
G1 X93.099 Y104.175 E.0278
; LINE_WIDTH: 0.443838
G1 X95.099 Y104.175 E.02781
; LINE_WIDTH: 0.443988
G1 X97.099 Y104.175 E.02782
; LINE_WIDTH: 0.444148
G1 X99.099 Y104.175 E.02783
; LINE_WIDTH: 0.444308
G1 X101.099 Y104.175 E.02785
; WIPE_START
G1 F18000
G1 X99.099 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.636 Y96.561 Z5.88 F42000
G1 X101.099 Y75.826 Z5.88
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.443218
G1 F2164
M204 S6000
G1 X100.402 Y75.826 E.00968
; LINE_WIDTH: 0.443318
M73 P71 R4
G1 X98.402 Y75.826 E.02778
; LINE_WIDTH: 0.443528
G1 X94.402 Y75.825 E.05559
; LINE_WIDTH: 0.443628
G1 X92.402 Y75.825 E.0278
; LINE_WIDTH: 0.443838
G1 X88.402 Y75.825 E.05563
; LINE_WIDTH: 0.443948
G1 X86.402 Y75.825 E.02782
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.284 Y81.487 Z5.88 F42000
G1 X82.239 Y82.643 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.400008
G1 F2164
M204 S5000
G1 X82.162 Y82.544 E.00157
; LINE_WIDTH: 0.381788
G1 X82.085 Y82.445 E.00149
; LINE_WIDTH: 0.363578
G1 X82.058 Y82.41 E.0005
; LINE_WIDTH: 0.357168
G1 X81.137 Y80.677 E.02175
; LINE_WIDTH: 0.361868
G1 X81.12 Y80.659 E.00028
; LINE_WIDTH: 0.375238
G1 X81.072 Y80.609 E.00082
; LINE_WIDTH: 0.388608
G1 X81.024 Y80.558 E.00085
; LINE_WIDTH: 0.420848
G1 X80.864 Y80.643 E.00237
; LINE_WIDTH: 0.453088
G1 X80.705 Y80.727 E.00256
G1 X80.591 Y80.615 E.00227
; LINE_WIDTH: 0.422898
G1 X80.477 Y80.503 E.00211
; LINE_WIDTH: 0.392708
G1 X80.206 Y80.388 E.0036
; LINE_WIDTH: 0.397128
G1 X79.837 Y80.413 E.00458
G1 X79.587 Y80.566 E.00363
; LINE_WIDTH: 0.393708
G1 X79.423 Y80.81 E.0036
; LINE_WIDTH: 0.395368
G1 X79.383 Y81.152 E.00425
; LINE_WIDTH: 0.395888
G1 X79.475 Y81.425 E.00356
; LINE_WIDTH: 0.399248
G1 X79.661 Y81.629 E.00343
G1 X79.912 Y81.743 E.00344
; LINE_WIDTH: 0.398228
G1 X80.246 Y81.732 E.00415
; LINE_WIDTH: 0.396608
G1 X80.546 Y81.57 E.00421
; LINE_WIDTH: 0.413988
G1 X80.706 Y81.333 E.0037
G1 X80.763 Y81.1 E.0031
; LINE_WIDTH: 0.453088
G1 X80.705 Y80.727 E.00537
; WIPE_START
G1 F12000
M204 S6000
G1 X80.763 Y81.1 E-.14355
G1 X80.706 Y81.333 E-.09108
G1 X80.546 Y81.57 E-.10874
G1 X80.246 Y81.732 E-.12943
G1 X79.912 Y81.743 E-.12692
G1 X79.661 Y81.629 E-.10495
G1 X79.563 Y81.521 E-.05533
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.500138
G1 F2164
M204 S5000
G1 X82.63 Y79.864 E.00283
; LINE_WIDTH: 0.501848
G1 X83.569 Y81.63 E.0316
; LINE_WIDTH: 0.541468
G1 X83.594 Y81.677 E.00091
; LINE_WIDTH: 0.581088
G1 X83.619 Y81.724 E.00098
; LINE_WIDTH: 0.620708
G1 X83.644 Y81.771 E.00105
; WIPE_START
G1 F12000
M204 S6000
G1 X83.619 Y81.724 E-.02026
G1 X83.594 Y81.677 E-.02026
G1 X83.569 Y81.63 E-.02026
G1 X82.705 Y80.005 E-.69922
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.153 Y81.094 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.400008
G1 F2164
M204 S5000
G1 X85.114 Y80.975 E.00157
; LINE_WIDTH: 0.381788
G1 X85.074 Y80.855 E.00149
; LINE_WIDTH: 0.363578
G1 X85.06 Y80.813 E.0005
; LINE_WIDTH: 0.357168
G1 X84 Y78.819 E.02503
; WIPE_START
G1 F12000
M204 S6000
G1 X84.939 Y80.585 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.753 Y88.215 Z5.88 F42000
G1 X84.654 Y92.246 Z5.88
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2164
M204 S5000
G1 X84.654 Y90.754 E.02389
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.714 Y92.246 E.00691
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y90.754 E-.5672
G1 X85.146 Y90.754 E-.18674
G1 X85.146 Y90.77 E-.00606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F2164
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.88 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.56
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 67/99
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 15
G1 X102.266 Y75.601 F42000
G1 Z5.56
G1 E.8 F1800
; LINE_WIDTH: 0.408568
G1 F1776
M204 S5000
G1 X102.279 Y75.606 E.00018
; LINE_WIDTH: 0.413098
G1 X102.578 Y75.862 E.00507
G1 X102.785 Y76.187 E.00497
; LINE_WIDTH: 0.412068
G1 X102.894 Y76.646 E.00608
; LINE_WIDTH: 0.409378
G1 X102.894 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.894 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.894 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.894 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.894 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.894 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.894 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.894 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.894 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.894 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.894 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.894 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.894 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.894 Y103.3 E.00832
; LINE_WIDTH: 0.412708
G1 X102.815 Y103.738 E.00573
G1 X102.582 Y104.127 E.00585
; LINE_WIDTH: 0.403628
G1 X102.254 Y104.409 E.00545
; LINE_WIDTH: 0.407508
G1 X101.84 Y104.565 E.00563
; LINE_WIDTH: 0.410178
G1 X101.592 Y104.595 E.0032
G1 X99.592 Y104.595 E.02562
; LINE_WIDTH: 0.410038
G1 X97.592 Y104.595 E.02561
; LINE_WIDTH: 0.409898
G1 X95.592 Y104.595 E.0256
; LINE_WIDTH: 0.409758
G1 X93.592 Y104.595 E.02559
; LINE_WIDTH: 0.409628
G1 X91.592 Y104.595 E.02558
; LINE_WIDTH: 0.409488
G1 X89.592 Y104.595 E.02558
; LINE_WIDTH: 0.409348
G1 X87.592 Y104.595 E.02557
; LINE_WIDTH: 0.409208
G1 X85.592 Y104.595 E.02556
; LINE_WIDTH: 0.409078
G1 X83.592 Y104.596 E.02555
; LINE_WIDTH: 0.408938
G1 X81.592 Y104.596 E.02554
; LINE_WIDTH: 0.408798
G1 X79.592 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.376 Y104.592 E.01552
; LINE_WIDTH: 0.407098
G1 X77.941 Y104.499 E.00566
; LINE_WIDTH: 0.406568
G1 X77.571 Y104.284 E.00543
; LINE_WIDTH: 0.415278
G1 X77.311 Y103.987 E.00512
G1 X77.171 Y103.68 E.00438
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.287 E.00508
G1 X77.104 Y77.287 E.33172
G3 X77.141 Y76.414 I3.72 J-.282 E.01117
; LINE_WIDTH: 0.412548
G1 X77.281 Y76.063 E.00488
G1 X77.457 Y75.829 E.00378
; LINE_WIDTH: 0.404208
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.407298
G1 X78.161 Y75.435 E.00566
; LINE_WIDTH: 0.410278
G1 X78.407 Y75.405 E.00319
G1 X80.407 Y75.405 E.02563
; LINE_WIDTH: 0.410078
G1 X82.407 Y75.405 E.02561
; LINE_WIDTH: 0.409878
G1 X84.407 Y75.405 E.0256
; LINE_WIDTH: 0.409678
G1 X86.407 Y75.405 E.02559
; LINE_WIDTH: 0.409488
G1 X88.407 Y75.405 E.02558
; LINE_WIDTH: 0.409288
G1 X90.407 Y75.405 E.02556
; LINE_WIDTH: 0.409088
G1 X92.407 Y75.405 E.02555
; LINE_WIDTH: 0.408888
G1 X94.407 Y75.405 E.02554
; LINE_WIDTH: 0.408698
G1 X96.407 Y75.405 E.02552
; LINE_WIDTH: 0.408498
G1 X98.407 Y75.405 E.02551
; LINE_WIDTH: 0.408298
G1 X100.407 Y75.405 E.0255
; LINE_WIDTH: 0.408098
G1 X101.6 Y75.405 E.0152
; LINE_WIDTH: 0.407988
G1 X101.843 Y75.437 E.00312
; LINE_WIDTH: 0.408568
G1 X102.21 Y75.579 E.00502
M204 S250
G1 X101.684 Y75.808 F42000
; LINE_WIDTH: 0.409848
G1 F1776
M204 S5000
G1 X101.833 Y75.83 E.00193
G1 X102.176 Y76.011 E.00498
; LINE_WIDTH: 0.406878
G1 X102.399 Y76.286 E.0045
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.00478
G1 X102.501 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.502 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.502 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.502 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.502 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.502 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.503 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.503 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.503 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.503 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.503 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.504 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.504 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.504 Y103.3 E.00832
; LINE_WIDTH: 0.412708
G1 X102.449 Y103.587 E.00377
G1 X102.28 Y103.887 E.00444
; LINE_WIDTH: 0.408538
G1 X102.002 Y104.106 E.00451
; LINE_WIDTH: 0.410178
G1 X101.585 Y104.202 E.00548
G1 X99.585 Y104.202 E.02562
; LINE_WIDTH: 0.410038
G1 X97.585 Y104.202 E.02561
; LINE_WIDTH: 0.409898
G1 X95.585 Y104.203 E.0256
; LINE_WIDTH: 0.409758
G1 X93.585 Y104.203 E.02559
; LINE_WIDTH: 0.409628
G1 X91.585 Y104.203 E.02558
; LINE_WIDTH: 0.409488
G1 X89.585 Y104.203 E.02558
; LINE_WIDTH: 0.409348
G1 X87.585 Y104.203 E.02557
; LINE_WIDTH: 0.409208
G1 X85.585 Y104.204 E.02556
; LINE_WIDTH: 0.409078
G1 X83.585 Y104.204 E.02555
; LINE_WIDTH: 0.408938
G1 X81.585 Y104.204 E.02554
; LINE_WIDTH: 0.408798
G1 X79.585 Y104.204 E.02553
; LINE_WIDTH: 0.408658
G1 X78.424 Y104.204 E.01481
G1 X78.058 Y104.131 E.00477
; LINE_WIDTH: 0.406578
G1 X77.735 Y103.905 E.005
G1 X77.542 Y103.572 E.00489
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.275 E.00383
G1 X77.496 Y76.724 E.33875
G1 X77.552 Y76.404 E.00415
; LINE_WIDTH: 0.404208
G1 X77.729 Y76.101 E.00443
; LINE_WIDTH: 0.407298
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410278
G1 X78.415 Y75.798 E.00532
G1 X80.415 Y75.798 E.02563
; LINE_WIDTH: 0.410078
G1 X82.415 Y75.798 E.02561
; LINE_WIDTH: 0.409878
G1 X84.415 Y75.798 E.0256
; LINE_WIDTH: 0.409678
G1 X86.415 Y75.798 E.02559
; LINE_WIDTH: 0.409478
G1 X88.415 Y75.797 E.02557
; LINE_WIDTH: 0.409288
G1 X90.415 Y75.797 E.02556
; LINE_WIDTH: 0.409088
G1 X92.415 Y75.797 E.02555
; LINE_WIDTH: 0.408888
G1 X94.415 Y75.797 E.02554
; LINE_WIDTH: 0.408688
G1 X96.415 Y75.797 E.02552
; LINE_WIDTH: 0.408498
G1 X98.415 Y75.796 E.02551
; LINE_WIDTH: 0.408298
G1 X100.415 Y75.796 E.0255
; LINE_WIDTH: 0.408098
G1 X101.6 Y75.796 E.0151
; LINE_WIDTH: 0.409848
G1 X101.624 Y75.8 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.83 E-.08
G1 X102.176 Y76.011 E-.14774
G1 X102.399 Y76.286 E-.13455
G1 X102.501 Y76.646 E-.14216
G1 X102.501 Y77.319 E-.25557
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.043 Y78.942 Z5.96 F42000
G1 X85.153 Y81.094 Z5.96
G1 Z5.56
G1 E.8 F1800
; LINE_WIDTH: 0.400028
G1 F1776
M204 S5000
G1 X85.113 Y80.975 E.00157
; LINE_WIDTH: 0.381788
G1 X85.074 Y80.855 E.00149
; LINE_WIDTH: 0.363558
G1 X85.06 Y80.813 E.0005
; LINE_WIDTH: 0.357168
G1 X84 Y78.819 E.02503
; WIPE_START
G1 F12000
M204 S6000
G1 X84.939 Y80.585 E-.76
; WIPE_END
M73 P72 R4
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z5.96 F42000
G1 Z5.56
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1776
M204 S5000
G1 X82.63 Y79.864 E.00283
; LINE_WIDTH: 0.501828
G1 X83.569 Y81.63 E.03159
; LINE_WIDTH: 0.541455
G1 X83.594 Y81.677 E.00091
; LINE_WIDTH: 0.581081
G1 X83.619 Y81.724 E.00098
; LINE_WIDTH: 0.620708
G1 X83.644 Y81.771 E.00105
; WIPE_START
G1 F12000
M204 S6000
G1 X83.619 Y81.724 E-.02026
G1 X83.594 Y81.677 E-.02026
G1 X83.569 Y81.63 E-.02026
G1 X82.705 Y80.005 E-.69922
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.239 Y82.643 Z5.96 F42000
G1 Z5.56
G1 E.8 F1800
; LINE_WIDTH: 0.399988
G1 F1776
M204 S5000
G1 X82.162 Y82.544 E.00157
; LINE_WIDTH: 0.381788
G1 X82.085 Y82.445 E.00149
; LINE_WIDTH: 0.363588
G1 X82.058 Y82.41 E.0005
; LINE_WIDTH: 0.357168
G1 X81.137 Y80.677 E.02175
; LINE_WIDTH: 0.361878
G1 X81.12 Y80.659 E.00028
; LINE_WIDTH: 0.375228
G1 X81.072 Y80.609 E.00082
; LINE_WIDTH: 0.388568
G1 X81.024 Y80.558 E.00085
; LINE_WIDTH: 0.420208
G1 X80.865 Y80.642 E.00236
; LINE_WIDTH: 0.451848
G1 X80.706 Y80.727 E.00255
G1 X80.392 Y80.449 E.00594
; LINE_WIDTH: 0.404068
G1 X80.112 Y80.371 E.00366
; LINE_WIDTH: 0.400988
G1 X79.819 Y80.416 E.00372
; LINE_WIDTH: 0.397408
G1 X79.528 Y80.633 E.0045
; LINE_WIDTH: 0.404368
G1 X79.405 Y80.86 E.00325
G1 X79.384 Y81.166 E.00387
; LINE_WIDTH: 0.395848
G1 X79.475 Y81.425 E.00339
G1 X79.663 Y81.627 E.0034
; LINE_WIDTH: 0.399248
G1 X79.912 Y81.744 E.00342
; LINE_WIDTH: 0.403368
G1 X80.154 Y81.755 E.00305
G1 X80.422 Y81.665 E.00356
; LINE_WIDTH: 0.403188
G1 X80.64 Y81.457 E.00379
; LINE_WIDTH: 0.399408
G1 X80.763 Y81.117 E.0045
; LINE_WIDTH: 0.425628
G1 X80.734 Y80.922 E.00262
; LINE_WIDTH: 0.451848
G1 X80.706 Y80.727 E.00279
; WIPE_START
G1 F12000
M204 S6000
G1 X80.734 Y80.922 E-.07489
G1 X80.763 Y81.117 E-.07489
G1 X80.64 Y81.457 E-.13732
G1 X80.422 Y81.665 E-.11461
G1 X80.154 Y81.755 E-.10733
G1 X79.912 Y81.744 E-.0922
G1 X79.663 Y81.627 E-.10448
G1 X79.566 Y81.522 E-.05428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.96 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 68/99
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 15
G1 X102.293 Y75.617 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.416448
G1 F1774
M204 S5000
G1 X102.576 Y75.863 E.00488
G1 X102.774 Y76.164 E.00469
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00635
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407738
G1 X102.895 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.895 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.895 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.895 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.895 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.896 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.896 Y102.7 E.02551
G3 X102.872 Y103.5 I-3.773 J.288 E.01023
; LINE_WIDTH: 0.413278
G1 X102.719 Y103.937 E.00598
G1 X102.556 Y104.156 E.00352
; LINE_WIDTH: 0.403538
G1 X102.264 Y104.399 E.00478
; LINE_WIDTH: 0.411528
G1 X101.871 Y104.562 E.00547
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410218
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410068
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409928
G1 X95.59 Y104.595 E.0256
; LINE_WIDTH: 0.409788
G1 X93.59 Y104.595 E.02559
; LINE_WIDTH: 0.409648
G1 X91.59 Y104.595 E.02559
; LINE_WIDTH: 0.409508
G1 X89.59 Y104.595 E.02558
; LINE_WIDTH: 0.409368
G1 X87.59 Y104.595 E.02557
; LINE_WIDTH: 0.409228
G1 X85.59 Y104.595 E.02556
; LINE_WIDTH: 0.409088
G1 X83.59 Y104.596 E.02555
; LINE_WIDTH: 0.408948
G1 X81.59 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.59 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.596 E.01488
; LINE_WIDTH: 0.415268
G1 X78.116 Y104.556 E.00404
G1 X77.713 Y104.39 E.00565
; LINE_WIDTH: 0.410938
G1 X77.372 Y104.071 E.006
; LINE_WIDTH: 0.402218
G1 X77.182 Y103.71 E.00511
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.292 E.00543
G1 X77.104 Y77.292 E.33172
G3 X77.141 Y76.414 I3.74 J-.284 E.01123
; LINE_WIDTH: 0.412558
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.829 E.00378
; LINE_WIDTH: 0.404228
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.410018
G1 X78.152 Y75.433 E.0056
; LINE_WIDTH: 0.410278
G1 X78.409 Y75.405 E.00332
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.410078
G1 X82.409 Y75.405 E.02561
; LINE_WIDTH: 0.409878
G1 X84.409 Y75.405 E.0256
; LINE_WIDTH: 0.409678
G1 X86.409 Y75.405 E.02559
; LINE_WIDTH: 0.409478
G1 X88.409 Y75.405 E.02557
; LINE_WIDTH: 0.409278
G1 X90.409 Y75.405 E.02556
; LINE_WIDTH: 0.409078
G1 X92.409 Y75.405 E.02555
; LINE_WIDTH: 0.408888
G1 X94.409 Y75.405 E.02554
; LINE_WIDTH: 0.408688
G1 X96.409 Y75.405 E.02552
; LINE_WIDTH: 0.408488
G1 X98.409 Y75.405 E.02551
; LINE_WIDTH: 0.408288
G1 X100.409 Y75.405 E.0255
; LINE_WIDTH: 0.408088
G1 X101.6 Y75.405 E.01517
; LINE_WIDTH: 0.407978
G1 X101.843 Y75.437 E.00312
; LINE_WIDTH: 0.408538
G1 X102.24 Y75.591 E.00543
M204 S250
G1 X101.687 Y75.809 F42000
; LINE_WIDTH: 0.409888
G1 F1774
M204 S5000
G1 X101.832 Y75.83 E.00188
G1 X102.181 Y76.016 E.00507
; LINE_WIDTH: 0.407138
G1 X102.431 Y76.354 E.00534
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407808
G1 X102.504 Y82.7 E.05093
; LINE_WIDTH: 0.407948
G1 X102.504 Y86.7 E.05095
; LINE_WIDTH: 0.408078
G1 X102.504 Y90.7 E.05097
; LINE_WIDTH: 0.408218
G1 X102.504 Y94.7 E.05098
; LINE_WIDTH: 0.408348
G1 X102.504 Y98.7 E.051
; LINE_WIDTH: 0.408488
G1 X102.504 Y103.276 E.05836
G1 X102.472 Y103.521 E.00315
; LINE_WIDTH: 0.407448
G1 X102.28 Y103.888 E.00527
; LINE_WIDTH: 0.409288
G1 X102.002 Y104.107 E.00452
G1 X101.668 Y104.2 E.00443
; LINE_WIDTH: 0.410218
G3 X99.58 Y104.202 I-1.092 J-42.416 E.02675
; LINE_WIDTH: 0.410068
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409928
G1 X95.58 Y104.202 E.0256
; LINE_WIDTH: 0.409788
G1 X93.58 Y104.203 E.02559
; LINE_WIDTH: 0.409648
G1 X91.58 Y104.203 E.02559
; LINE_WIDTH: 0.409508
G1 X89.58 Y104.203 E.02558
; LINE_WIDTH: 0.409368
G1 X87.58 Y104.203 E.02557
; LINE_WIDTH: 0.409228
G1 X85.58 Y104.204 E.02556
; LINE_WIDTH: 0.409088
G1 X83.58 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.58 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.58 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.204 E.01475
G1 X78.024 Y104.118 E.00523
; LINE_WIDTH: 0.402218
G1 X77.692 Y103.857 E.0053
; LINE_WIDTH: 0.404478
G1 X77.561 Y103.627 E.00334
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.284 E.00446
G1 X77.496 Y76.724 E.33885
G1 X77.552 Y76.403 E.00415
; LINE_WIDTH: 0.404228
G1 X77.729 Y76.101 E.00443
; LINE_WIDTH: 0.407928
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.418 Y75.798 E.00537
G1 X80.418 Y75.798 E.02563
; LINE_WIDTH: 0.410078
G1 X82.418 Y75.798 E.02561
; LINE_WIDTH: 0.409878
G1 X84.418 Y75.798 E.0256
; LINE_WIDTH: 0.409678
G1 X86.418 Y75.798 E.02559
; LINE_WIDTH: 0.409478
G1 X88.418 Y75.797 E.02557
; LINE_WIDTH: 0.409278
G1 X90.418 Y75.797 E.02556
; LINE_WIDTH: 0.409078
G1 X92.418 Y75.797 E.02555
; LINE_WIDTH: 0.408888
G1 X94.418 Y75.797 E.02554
; LINE_WIDTH: 0.408688
G1 X96.418 Y75.797 E.02552
; LINE_WIDTH: 0.408488
G1 X98.418 Y75.796 E.02551
; LINE_WIDTH: 0.408288
G1 X100.418 Y75.796 E.0255
; LINE_WIDTH: 0.408088
G1 X101.6 Y75.796 E.01506
; LINE_WIDTH: 0.409888
G1 X101.628 Y75.8 E.00036
; WIPE_START
G1 F12000
M204 S6000
G1 X101.832 Y75.83 E-.07866
G1 X102.181 Y76.016 E-.15041
G1 X102.431 Y76.354 E-.15954
G1 X102.504 Y76.7 E-.13432
G1 X102.504 Y77.324 E-.23708
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.045 Y78.944 Z6.04 F42000
G1 X85.153 Y81.094 Z6.04
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.400008
G1 F1774
M204 S5000
G1 X85.114 Y80.975 E.00157
; LINE_WIDTH: 0.381788
G1 X85.074 Y80.855 E.00149
; LINE_WIDTH: 0.363578
G1 X85.06 Y80.813 E.0005
; LINE_WIDTH: 0.357168
G1 X84 Y78.819 E.02503
; WIPE_START
G1 F12000
M204 S6000
G1 X84.939 Y80.585 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.644 Y81.771 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.620728
G1 F1774
M204 S5000
G1 X83.619 Y81.724 E.00105
; LINE_WIDTH: 0.581101
G1 X83.594 Y81.677 E.00098
; LINE_WIDTH: 0.541475
G1 X83.569 Y81.63 E.00091
; LINE_WIDTH: 0.501848
G1 X83.485 Y81.471 E.00284
; LINE_WIDTH: 0.501688
G1 X82.546 Y79.706 E.03159
; WIPE_START
G1 F12000
M204 S6000
G1 X83.485 Y81.471 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.239 Y82.643 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.400008
G1 F1774
M204 S5000
G1 X82.162 Y82.544 E.00157
; LINE_WIDTH: 0.381788
G1 X82.085 Y82.445 E.00149
; LINE_WIDTH: 0.363578
G1 X82.058 Y82.41 E.0005
; LINE_WIDTH: 0.357168
G1 X81.137 Y80.677 E.02175
; LINE_WIDTH: 0.361878
G1 X81.12 Y80.659 E.00028
; LINE_WIDTH: 0.375218
G1 X81.072 Y80.609 E.00082
; LINE_WIDTH: 0.388548
G1 X81.024 Y80.558 E.00085
; LINE_WIDTH: 0.420798
G1 X80.864 Y80.643 E.00237
; LINE_WIDTH: 0.453048
G1 X80.705 Y80.727 E.00256
G1 X80.591 Y80.615 E.00227
; LINE_WIDTH: 0.422878
G1 X80.477 Y80.503 E.00211
; LINE_WIDTH: 0.392708
G1 X80.175 Y80.381 E.00399
; LINE_WIDTH: 0.396488
G1 X79.837 Y80.413 E.0042
G1 X79.587 Y80.565 E.00362
G1 X79.43 Y80.792 E.00341
; LINE_WIDTH: 0.400108
G1 X79.38 Y81.166 E.00471
G1 X79.504 Y81.462 E.004
; LINE_WIDTH: 0.382928
G1 X79.747 Y81.676 E.00386
; LINE_WIDTH: 0.397008
G1 X80.087 Y81.763 E.00435
G1 X80.418 Y81.662 E.00428
; LINE_WIDTH: 0.385088
G1 X80.641 Y81.454 E.00365
; LINE_WIDTH: 0.391268
G1 X80.756 Y81.166 E.00379
; LINE_WIDTH: 0.422158
G1 X80.73 Y80.946 E.00291
; LINE_WIDTH: 0.453048
G1 X80.705 Y80.727 E.00314
; WIPE_START
G1 F12000
M204 S6000
G1 X80.73 Y80.946 E-.08388
G1 X80.756 Y81.166 E-.08388
G1 X80.641 Y81.454 E-.11802
G1 X80.418 Y81.662 E-.11578
G1 X80.087 Y81.763 E-.13145
G1 X79.747 Y81.676 E-.13361
G1 X79.562 Y81.513 E-.09339
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.72
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 69/99
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 15
G1 X102.295 Y75.62 F42000
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.413068
G1 F1775
M204 S5000
G1 X102.577 Y75.862 E.0048
G1 X102.786 Y76.188 E.005
; LINE_WIDTH: 0.412188
G1 X102.894 Y76.646 E.00606
; LINE_WIDTH: 0.409398
G1 X102.894 Y80.646 E.05114
; LINE_WIDTH: 0.409268
G1 X102.894 Y84.646 E.05112
; LINE_WIDTH: 0.409148
G1 X102.894 Y88.646 E.05111
; LINE_WIDTH: 0.409028
G1 X102.895 Y92.646 E.05109
; LINE_WIDTH: 0.408898
M73 P73 R4
G1 X102.895 Y96.646 E.05107
; LINE_WIDTH: 0.408778
G1 X102.895 Y100.646 E.05106
; LINE_WIDTH: 0.408658
G1 X102.896 Y103.276 E.03355
G1 X102.872 Y103.5 E.00288
; LINE_WIDTH: 0.415988
G1 X102.749 Y103.881 E.0052
G1 X102.576 Y104.136 E.00401
; LINE_WIDTH: 0.403678
G1 X102.289 Y104.385 E.00479
; LINE_WIDTH: 0.409718
G1 X101.849 Y104.566 E.00608
; LINE_WIDTH: 0.410178
G1 X101.591 Y104.595 E.00333
G1 X99.591 Y104.595 E.02562
; LINE_WIDTH: 0.409958
G1 X97.591 Y104.595 E.02561
; LINE_WIDTH: 0.409748
G1 X95.591 Y104.595 E.02559
; LINE_WIDTH: 0.409528
G1 X93.591 Y104.595 E.02558
; LINE_WIDTH: 0.409318
G1 X91.591 Y104.595 E.02556
; LINE_WIDTH: 0.409098
G1 X89.591 Y104.595 E.02555
; LINE_WIDTH: 0.408888
G1 X87.591 Y104.595 E.02554
; LINE_WIDTH: 0.408668
G1 X85.591 Y104.595 E.02552
; LINE_WIDTH: 0.408458
G1 X83.591 Y104.594 E.02551
; LINE_WIDTH: 0.408238
G1 X81.591 Y104.594 E.02549
; LINE_WIDTH: 0.408028
G1 X79.591 Y104.594 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.594 E.01516
; LINE_WIDTH: 0.410978
G1 X77.988 Y104.522 E.00536
; LINE_WIDTH: 0.414218
G1 X77.683 Y104.374 E.0044
G1 X77.372 Y104.07 E.00562
; LINE_WIDTH: 0.402188
G1 X77.182 Y103.71 E.00511
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.291 E.00543
G1 X77.104 Y77.291 E.33172
G3 X77.141 Y76.413 I3.743 J-.283 E.01124
; LINE_WIDTH: 0.413568
G3 X77.449 Y75.833 I1.277 J.306 E.00857
; LINE_WIDTH: 0.406768
G1 X77.72 Y75.609 E.00447
; LINE_WIDTH: 0.409568
G1 X78.151 Y75.434 E.00595
; LINE_WIDTH: 0.410278
G1 X78.409 Y75.405 E.00333
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.410078
G1 X82.409 Y75.405 E.02561
; LINE_WIDTH: 0.409878
G1 X84.409 Y75.405 E.0256
; LINE_WIDTH: 0.409678
G1 X86.409 Y75.405 E.02559
; LINE_WIDTH: 0.409478
G1 X88.409 Y75.405 E.02557
; LINE_WIDTH: 0.409278
G1 X90.409 Y75.405 E.02556
; LINE_WIDTH: 0.409078
G1 X92.409 Y75.405 E.02555
; LINE_WIDTH: 0.408878
G1 X94.409 Y75.405 E.02554
; LINE_WIDTH: 0.408678
G1 X96.409 Y75.405 E.02552
; LINE_WIDTH: 0.408478
G1 X98.409 Y75.405 E.02551
; LINE_WIDTH: 0.408278
G1 X100.409 Y75.405 E.0255
; LINE_WIDTH: 0.408078
G1 X101.6 Y75.405 E.01517
; LINE_WIDTH: 0.407968
G1 X101.843 Y75.437 E.00312
; LINE_WIDTH: 0.408498
G1 X102.243 Y75.592 E.00548
M204 S250
G1 X101.691 Y75.809 F42000
; LINE_WIDTH: 0.409928
G1 F1775
M204 S5000
G1 X101.832 Y75.83 E.00183
G1 X102.176 Y76.01 E.00496
; LINE_WIDTH: 0.406748
G1 X102.399 Y76.286 E.0045
; LINE_WIDTH: 0.409398
G1 X102.501 Y76.646 E.00479
G1 X102.502 Y80.646 E.05114
; LINE_WIDTH: 0.409268
G1 X102.502 Y84.646 E.05112
; LINE_WIDTH: 0.409148
G1 X102.503 Y88.646 E.05111
; LINE_WIDTH: 0.409028
G1 X102.503 Y92.646 E.05109
; LINE_WIDTH: 0.408898
G1 X102.504 Y96.646 E.05107
; LINE_WIDTH: 0.408778
G1 X102.504 Y100.646 E.05106
; LINE_WIDTH: 0.408658
G1 X102.504 Y103.276 E.03355
G1 X102.472 Y103.521 E.00316
G1 X102.28 Y103.889 E.0053
; LINE_WIDTH: 0.405878
G1 X102.001 Y104.105 E.00447
; LINE_WIDTH: 0.406248
G1 X101.668 Y104.2 E.00439
; LINE_WIDTH: 0.410178
G3 X99.582 Y104.202 I-1.09 J-45.406 E.02673
; LINE_WIDTH: 0.409958
G1 X97.582 Y104.202 E.02561
; LINE_WIDTH: 0.409748
G1 X95.582 Y104.202 E.02559
; LINE_WIDTH: 0.409528
G1 X93.582 Y104.203 E.02558
; LINE_WIDTH: 0.409318
G1 X91.582 Y104.203 E.02556
; LINE_WIDTH: 0.409098
G1 X89.582 Y104.203 E.02555
; LINE_WIDTH: 0.408888
G1 X87.582 Y104.203 E.02554
; LINE_WIDTH: 0.408668
G1 X85.582 Y104.203 E.02552
; LINE_WIDTH: 0.408458
G1 X83.582 Y104.203 E.02551
; LINE_WIDTH: 0.408238
G1 X81.582 Y104.204 E.02549
; LINE_WIDTH: 0.408028
G1 X79.582 Y104.204 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.204 E.01504
; LINE_WIDTH: 0.407688
G1 X77.977 Y104.094 E.00556
; LINE_WIDTH: 0.406808
G1 X77.685 Y103.845 E.00489
; LINE_WIDTH: 0.403158
G1 X77.543 Y103.572 E.00387
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.283 E.00373
G1 X77.496 Y76.724 E.33884
G1 X77.541 Y76.425 E.00387
; LINE_WIDTH: 0.410608
G1 X77.751 Y76.079 E.00519
G1 X78.01 Y75.89 E.0041
; LINE_WIDTH: 0.410278
G1 X78.418 Y75.798 E.00537
G1 X80.418 Y75.798 E.02563
; LINE_WIDTH: 0.410078
G1 X82.418 Y75.798 E.02561
; LINE_WIDTH: 0.409878
G1 X84.418 Y75.798 E.0256
; LINE_WIDTH: 0.409678
G1 X86.418 Y75.797 E.02559
; LINE_WIDTH: 0.409478
G1 X88.418 Y75.797 E.02557
; LINE_WIDTH: 0.409278
G1 X90.418 Y75.797 E.02556
; LINE_WIDTH: 0.409078
G1 X92.418 Y75.797 E.02555
; LINE_WIDTH: 0.408878
G1 X94.418 Y75.797 E.02554
; LINE_WIDTH: 0.408678
G1 X96.418 Y75.797 E.02552
; LINE_WIDTH: 0.408478
G1 X98.418 Y75.796 E.02551
; LINE_WIDTH: 0.408278
G1 X100.418 Y75.796 E.0255
; LINE_WIDTH: 0.408078
G1 X101.6 Y75.796 E.01506
; LINE_WIDTH: 0.409928
G1 X101.631 Y75.801 E.0004
; WIPE_START
G1 F12000
M204 S6000
G1 X101.832 Y75.83 E-.07724
G1 X102.176 Y76.01 E-.14736
G1 X102.399 Y76.286 E-.13463
G1 X102.501 Y76.646 E-.14244
G1 X102.501 Y77.326 E-.25834
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.043 Y78.946 Z6.12 F42000
G1 X85.153 Y81.094 Z6.12
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.400008
G1 F1775
M204 S5000
G1 X85.114 Y80.975 E.00157
; LINE_WIDTH: 0.381798
G1 X85.074 Y80.856 E.00149
; LINE_WIDTH: 0.363588
G1 X85.06 Y80.813 E.0005
; LINE_WIDTH: 0.357168
G1 X84 Y78.819 E.02503
; WIPE_START
G1 F12000
M204 S6000
G1 X84.939 Y80.585 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.12 F42000
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1775
M204 S5000
G1 X82.63 Y79.864 E.00283
; LINE_WIDTH: 0.501828
G1 X83.569 Y81.63 E.03159
; LINE_WIDTH: 0.541461
G1 X83.594 Y81.677 E.00091
; LINE_WIDTH: 0.581095
G1 X83.619 Y81.724 E.00098
; LINE_WIDTH: 0.620728
G1 X83.644 Y81.771 E.00105
; WIPE_START
G1 F12000
M204 S6000
G1 X83.619 Y81.724 E-.02026
G1 X83.594 Y81.677 E-.02026
G1 X83.569 Y81.63 E-.02026
G1 X82.705 Y80.005 E-.69921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.239 Y82.643 Z6.12 F42000
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.399988
G1 F1775
M204 S5000
G1 X82.162 Y82.544 E.00157
; LINE_WIDTH: 0.381788
G1 X82.085 Y82.445 E.00149
; LINE_WIDTH: 0.363588
G1 X82.058 Y82.41 E.0005
; LINE_WIDTH: 0.357168
G1 X81.137 Y80.677 E.02175
; LINE_WIDTH: 0.361878
G1 X81.12 Y80.659 E.00028
; LINE_WIDTH: 0.375228
G1 X81.072 Y80.609 E.00082
; LINE_WIDTH: 0.388568
G1 X81.024 Y80.558 E.00085
; LINE_WIDTH: 0.420818
G1 X80.864 Y80.643 E.00237
; LINE_WIDTH: 0.453068
G1 X80.705 Y80.727 E.00256
G1 X80.591 Y80.615 E.00227
; LINE_WIDTH: 0.422888
G1 X80.477 Y80.503 E.00211
; LINE_WIDTH: 0.392708
G1 X80.176 Y80.381 E.00398
; LINE_WIDTH: 0.396448
G1 X79.837 Y80.413 E.0042
G1 X79.587 Y80.565 E.00362
G1 X79.43 Y80.792 E.00341
; LINE_WIDTH: 0.400568
G1 X79.38 Y81.151 E.00453
G1 X79.479 Y81.424 E.00362
; LINE_WIDTH: 0.390668
G1 X79.714 Y81.658 E.00404
; LINE_WIDTH: 0.392568
G1 X80.041 Y81.756 E.00417
G1 X80.321 Y81.712 E.00347
; LINE_WIDTH: 0.399188
G1 X80.554 Y81.566 E.00342
; LINE_WIDTH: 0.414608
G1 X80.706 Y81.33 E.00363
G1 X80.757 Y81.158 E.00232
; LINE_WIDTH: 0.422448
G1 X80.731 Y80.943 E.00287
; LINE_WIDTH: 0.453068
G1 X80.705 Y80.727 E.00309
; WIPE_START
G1 F12000
M204 S6000
G1 X80.731 Y80.943 E-.08254
G1 X80.757 Y81.158 E-.08254
G1 X80.706 Y81.33 E-.06813
G1 X80.554 Y81.566 E-.10652
G1 X80.321 Y81.712 E-.10451
G1 X80.041 Y81.756 E-.10783
G1 X79.714 Y81.658 E-.12956
G1 X79.568 Y81.512 E-.07837
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.12 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 70/99
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 15
G1 X102.298 Y75.623 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.416478
G1 F1752
M204 S5000
G1 X102.576 Y75.863 E.00478
G1 X102.775 Y76.165 E.00471
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00633
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.3 E.33858
; LINE_WIDTH: 0.412578
G1 X102.816 Y103.737 E.00573
G1 X102.581 Y104.128 E.00587
; LINE_WIDTH: 0.403648
G1 X102.253 Y104.41 E.00545
; LINE_WIDTH: 0.407458
G1 X101.84 Y104.565 E.00561
; LINE_WIDTH: 0.410198
G1 X101.592 Y104.595 E.0032
G1 X99.592 Y104.595 E.02562
; LINE_WIDTH: 0.409978
G1 X97.592 Y104.595 E.02561
; LINE_WIDTH: 0.409758
G1 X95.592 Y104.595 E.02559
; LINE_WIDTH: 0.409548
G1 X93.592 Y104.595 E.02558
; LINE_WIDTH: 0.409328
G1 X91.592 Y104.595 E.02556
; LINE_WIDTH: 0.409108
G1 X89.592 Y104.595 E.02555
; LINE_WIDTH: 0.408898
G1 X87.592 Y104.595 E.02554
; LINE_WIDTH: 0.408678
G1 X85.592 Y104.595 E.02552
; LINE_WIDTH: 0.408458
G1 X83.592 Y104.594 E.02551
; LINE_WIDTH: 0.408248
G1 X81.592 Y104.594 E.02549
; LINE_WIDTH: 0.408028
M73 P74 R4
G1 X79.592 Y104.594 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.594 E.01518
; LINE_WIDTH: 0.407688
G1 X78.058 Y104.539 E.00442
; LINE_WIDTH: 0.413058
G1 X77.708 Y104.387 E.00491
G1 X77.42 Y104.135 E.00495
G1 X77.206 Y103.786 E.00529
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00646
G1 X77.104 Y76.724 E.33893
G1 X77.186 Y76.276 E.00581
; LINE_WIDTH: 0.402698
G1 X77.394 Y75.899 E.00542
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.618 E.00527
; LINE_WIDTH: 0.412798
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.412 Y75.405 E.02561
; LINE_WIDTH: 0.409868
G1 X84.412 Y75.405 E.0256
; LINE_WIDTH: 0.409668
G1 X86.412 Y75.405 E.02559
; LINE_WIDTH: 0.409468
G1 X88.412 Y75.405 E.02557
; LINE_WIDTH: 0.409268
G1 X90.412 Y75.405 E.02556
; LINE_WIDTH: 0.409068
G1 X92.412 Y75.405 E.02555
; LINE_WIDTH: 0.408878
G1 X94.412 Y75.405 E.02554
; LINE_WIDTH: 0.408678
G1 X96.412 Y75.405 E.02552
; LINE_WIDTH: 0.408478
G1 X98.412 Y75.405 E.02551
; LINE_WIDTH: 0.408278
G1 X100.412 Y75.405 E.0255
; LINE_WIDTH: 0.408078
G1 X101.6 Y75.405 E.01513
; LINE_WIDTH: 0.407968
G1 X101.842 Y75.437 E.00311
; LINE_WIDTH: 0.408458
G1 X102.247 Y75.593 E.00554
M204 S250
G1 X101.694 Y75.81 F42000
; LINE_WIDTH: 0.409968
G1 F1752
M204 S5000
G1 X101.833 Y75.83 E.00179
G1 X102.181 Y76.016 E.00505
; LINE_WIDTH: 0.407228
G1 X102.431 Y76.354 E.00535
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
G1 X102.504 Y103.3 E.33858
; LINE_WIDTH: 0.412578
G1 X102.449 Y103.586 E.00376
G1 X102.279 Y103.888 E.00446
; LINE_WIDTH: 0.408458
G1 X102.001 Y104.107 E.00451
; LINE_WIDTH: 0.410198
G1 X101.585 Y104.202 E.00547
G1 X99.585 Y104.202 E.02562
; LINE_WIDTH: 0.409978
G1 X97.585 Y104.202 E.02561
; LINE_WIDTH: 0.409758
G1 X95.585 Y104.202 E.02559
; LINE_WIDTH: 0.409548
G1 X93.585 Y104.203 E.02558
; LINE_WIDTH: 0.409328
G1 X91.585 Y104.203 E.02556
; LINE_WIDTH: 0.409108
G1 X89.585 Y104.203 E.02555
; LINE_WIDTH: 0.408898
G1 X87.585 Y104.203 E.02554
; LINE_WIDTH: 0.408678
G1 X85.585 Y104.203 E.02552
; LINE_WIDTH: 0.408458
G1 X83.585 Y104.203 E.02551
; LINE_WIDTH: 0.408248
G1 X81.585 Y104.204 E.02549
; LINE_WIDTH: 0.408028
G1 X79.585 Y104.204 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.204 E.01509
; LINE_WIDTH: 0.407688
G1 X78.061 Y104.134 E.0044
; LINE_WIDTH: 0.406158
G1 X77.769 Y103.94 E.00445
; LINE_WIDTH: 0.406568
G1 X77.569 Y103.646 E.00451
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.28 E.00476
G1 X77.496 Y76.724 E.33881
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.411228
G1 X77.752 Y76.077 E.00491
G1 X78.01 Y75.89 E.00409
; LINE_WIDTH: 0.404528
G1 X78.331 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.410068
G1 X82.424 Y75.798 E.02561
; LINE_WIDTH: 0.409868
G1 X84.424 Y75.798 E.0256
; LINE_WIDTH: 0.409668
G1 X86.424 Y75.797 E.02559
; LINE_WIDTH: 0.409468
G1 X88.424 Y75.797 E.02557
; LINE_WIDTH: 0.409268
G1 X90.424 Y75.797 E.02556
; LINE_WIDTH: 0.409068
G1 X92.424 Y75.797 E.02555
; LINE_WIDTH: 0.408878
G1 X94.424 Y75.797 E.02554
; LINE_WIDTH: 0.408678
G1 X96.424 Y75.797 E.02552
; LINE_WIDTH: 0.408478
G1 X98.424 Y75.796 E.02551
; LINE_WIDTH: 0.408278
G1 X100.424 Y75.796 E.0255
; LINE_WIDTH: 0.408078
G1 X101.6 Y75.796 E.01498
; LINE_WIDTH: 0.409968
G1 X101.635 Y75.801 E.00045
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.83 E-.07599
G1 X102.181 Y76.016 E-.15002
G1 X102.431 Y76.354 E-.15981
G1 X102.504 Y76.7 E-.13434
G1 X102.504 Y77.331 E-.23985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.045 Y78.949 Z6.2 F42000
G1 X85.153 Y81.094 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.400008
G1 F1752
M204 S5000
G1 X85.116 Y80.978 E.00152
; LINE_WIDTH: 0.380768
G1 X85.079 Y80.862 E.00144
; LINE_WIDTH: 0.361528
G1 X85.071 Y80.835 E.00031
; LINE_WIDTH: 0.357168
G1 X84.986 Y80.673 E.00203
; WIPE_START
G1 F12000
M204 S6000
G1 X85.071 Y80.835 E-.30608
G1 X85.079 Y80.862 E-.04627
G1 X85.116 Y80.978 E-.20383
G1 X85.153 Y81.094 E-.20383
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.644 Y81.771 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.620648
G1 F1752
M204 S5000
G1 X83.616 Y81.718 E.00119
; LINE_WIDTH: 0.580428
G1 X83.588 Y81.665 E.00111
; LINE_WIDTH: 0.540208
G1 X83.559 Y81.611 E.00103
; LINE_WIDTH: 0.500008
G1 X82.546 Y79.706 E.03397
; WIPE_START
G1 F12000
M204 S6000
G1 X83.485 Y81.471 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.984 Y82.27 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1752
M204 S5000
G1 X82.071 Y82.431 E.00203
; LINE_WIDTH: 0.361558
G1 X82.088 Y82.453 E.00031
; LINE_WIDTH: 0.380778
G1 X82.164 Y82.548 E.00144
; LINE_WIDTH: 0.399988
G1 X82.239 Y82.643 E.00152
; WIPE_START
G1 F12000
M204 S6000
G1 X82.164 Y82.548 E-.2036
G1 X82.088 Y82.453 E-.20361
G1 X82.071 Y82.431 E-.04651
G1 X81.984 Y82.27 E-.30628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.258 Y80.403 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.395888
G1 F1752
M204 S5000
G1 X80.288 Y80.407 E.00038
; LINE_WIDTH: 0.394768
G1 X80.552 Y80.561 E.00375
; LINE_WIDTH: 0.404088
G1 X80.743 Y80.902 E.00494
G1 X80.759 Y81.029 E.00161
; LINE_WIDTH: 0.385028
G1 X80.719 Y81.299 E.00328
G1 X80.577 Y81.533 E.00328
G1 X80.331 Y81.705 E.00361
; LINE_WIDTH: 0.392908
G1 X80 Y81.753 E.00409
; LINE_WIDTH: 0.404288
G1 X79.755 Y81.685 E.00321
; LINE_WIDTH: 0.405848
G1 X79.563 Y81.539 E.00306
G1 X79.418 Y81.302 E.00352
; LINE_WIDTH: 0.405208
G1 X79.386 Y80.964 E.00429
; LINE_WIDTH: 0.388668
G1 X79.486 Y80.694 E.00349
; LINE_WIDTH: 0.387608
G1 X79.742 Y80.46 E.00419
; LINE_WIDTH: 0.395888
G1 X80.015 Y80.372 E.00354
G1 X80.199 Y80.395 E.00228
; WIPE_START
G1 F12000
M204 S6000
G1 X80.288 Y80.407 E-.0344
G1 X80.552 Y80.561 E-.11591
G1 X80.743 Y80.902 E-.1488
G1 X80.759 Y81.029 E-.04837
G1 X80.719 Y81.299 E-.10384
G1 X80.577 Y81.533 E-.10384
G1 X80.331 Y81.705 E-.11427
G1 X80.095 Y81.739 E-.09058
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.88
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 71/99
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 15
G1 X102.301 Y75.625 F42000
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.413048
G1 F1754
M204 S5000
G1 X102.577 Y75.862 E.0047
G1 X102.787 Y76.19 E.00501
; LINE_WIDTH: 0.412328
G1 X102.894 Y76.646 E.00604
; LINE_WIDTH: 0.409378
G1 X102.894 Y80.646 E.05114
; LINE_WIDTH: 0.409248
G1 X102.894 Y84.646 E.05112
; LINE_WIDTH: 0.409128
G1 X102.895 Y88.646 E.0511
; LINE_WIDTH: 0.409008
G1 X102.895 Y92.646 E.05109
; LINE_WIDTH: 0.408888
G1 X102.895 Y96.646 E.05107
; LINE_WIDTH: 0.408768
G1 X102.895 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.896 Y103.276 E.03355
G1 X102.846 Y103.637 E.00465
; LINE_WIDTH: 0.406808
G1 X102.625 Y104.079 E.00628
; LINE_WIDTH: 0.403708
G1 X102.288 Y104.386 E.00574
; LINE_WIDTH: 0.411048
G1 X101.871 Y104.561 E.00582
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410198
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410058
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409918
G1 X95.59 Y104.595 E.0256
; LINE_WIDTH: 0.409778
G1 X93.59 Y104.595 E.02559
; LINE_WIDTH: 0.409638
G1 X91.59 Y104.595 E.02559
; LINE_WIDTH: 0.409498
G1 X89.59 Y104.595 E.02558
; LINE_WIDTH: 0.409358
G1 X87.59 Y104.595 E.02557
; LINE_WIDTH: 0.409218
G1 X85.59 Y104.595 E.02556
; LINE_WIDTH: 0.409078
G1 X83.59 Y104.596 E.02555
; LINE_WIDTH: 0.408938
G1 X81.59 Y104.596 E.02554
; LINE_WIDTH: 0.408798
G1 X79.59 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.596 E.01487
G1 X77.953 Y104.507 E.00612
; LINE_WIDTH: 0.404858
G1 X77.576 Y104.284 E.00553
; LINE_WIDTH: 0.415268
G1 X77.311 Y103.987 E.00517
G1 X77.171 Y103.68 E.00438
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.288 E.00507
G1 X77.104 Y77.288 E.33172
G3 X77.141 Y76.413 I3.725 J-.282 E.01119
; LINE_WIDTH: 0.412858
G1 X77.272 Y76.08 E.00462
M73 P75 R4
G1 X77.455 Y75.83 E.00399
; LINE_WIDTH: 0.404658
G1 X77.742 Y75.598 E.00466
; LINE_WIDTH: 0.411318
G1 X78.129 Y75.438 E.00538
G1 X78.41 Y75.405 E.00364
; LINE_WIDTH: 0.410278
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409868
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409668
G1 X86.41 Y75.405 E.02559
; LINE_WIDTH: 0.409468
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409268
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.409068
G1 X92.41 Y75.405 E.02555
; LINE_WIDTH: 0.408868
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408668
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408468
G1 X98.41 Y75.405 E.02551
; LINE_WIDTH: 0.408268
G1 X100.41 Y75.405 E.0255
; LINE_WIDTH: 0.408068
G1 X101.6 Y75.405 E.01516
; LINE_WIDTH: 0.407958
G1 X101.842 Y75.437 E.00311
; LINE_WIDTH: 0.408448
G1 X102.25 Y75.594 E.00558
M204 S250
G1 X101.698 Y75.81 F42000
; LINE_WIDTH: 0.410008
G1 F1754
M204 S5000
G1 X101.833 Y75.83 E.00174
G1 X102.175 Y76.01 E.00495
; LINE_WIDTH: 0.406638
G1 X102.398 Y76.285 E.0045
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.0048
G1 X102.502 Y80.646 E.05114
; LINE_WIDTH: 0.409248
G1 X102.502 Y84.646 E.05112
; LINE_WIDTH: 0.409128
G1 X102.503 Y88.646 E.0511
; LINE_WIDTH: 0.409008
G1 X102.503 Y92.646 E.05109
; LINE_WIDTH: 0.408888
G1 X102.504 Y96.646 E.05107
; LINE_WIDTH: 0.408768
G1 X102.504 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.504 Y103.276 E.03355
G1 X102.462 Y103.555 E.00361
; LINE_WIDTH: 0.406578
G1 X102.297 Y103.869 E.0045
G1 X102 Y104.105 E.00481
; LINE_WIDTH: 0.405898
G1 X101.668 Y104.2 E.00438
; LINE_WIDTH: 0.410198
G3 X99.58 Y104.202 I-1.093 J-42.543 E.02675
; LINE_WIDTH: 0.410058
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409918
G1 X95.58 Y104.202 E.0256
; LINE_WIDTH: 0.409778
G1 X93.58 Y104.203 E.02559
; LINE_WIDTH: 0.409638
G1 X91.58 Y104.203 E.02559
; LINE_WIDTH: 0.409498
G1 X89.58 Y104.203 E.02558
; LINE_WIDTH: 0.409358
G1 X87.58 Y104.203 E.02557
; LINE_WIDTH: 0.409218
G1 X85.58 Y104.204 E.02556
; LINE_WIDTH: 0.409078
G1 X83.58 Y104.204 E.02555
; LINE_WIDTH: 0.408938
G1 X81.58 Y104.204 E.02554
; LINE_WIDTH: 0.408798
G1 X79.58 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.204 E.01475
G1 X78.057 Y104.132 E.00478
; LINE_WIDTH: 0.406808
G1 X77.735 Y103.905 E.00501
; LINE_WIDTH: 0.406578
G1 X77.542 Y103.572 E.00489
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.276 E.00383
G1 X77.496 Y76.724 E.33875
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.404658
G1 X77.729 Y76.101 E.00443
; LINE_WIDTH: 0.408228
M73 P75 R3
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.42 Y75.798 E.00539
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.410068
G1 X82.42 Y75.798 E.02561
; LINE_WIDTH: 0.409868
G1 X84.42 Y75.798 E.0256
; LINE_WIDTH: 0.409668
G1 X86.42 Y75.798 E.02559
; LINE_WIDTH: 0.409468
G1 X88.42 Y75.797 E.02557
; LINE_WIDTH: 0.409268
G1 X90.42 Y75.797 E.02556
; LINE_WIDTH: 0.409068
G1 X92.42 Y75.797 E.02555
; LINE_WIDTH: 0.408868
G1 X94.42 Y75.797 E.02553
; LINE_WIDTH: 0.408668
G1 X96.42 Y75.797 E.02552
; LINE_WIDTH: 0.408468
G1 X98.42 Y75.796 E.02551
; LINE_WIDTH: 0.408268
G1 X100.42 Y75.796 E.0255
; LINE_WIDTH: 0.408068
G1 X101.6 Y75.796 E.01504
; LINE_WIDTH: 0.410008
G1 X101.638 Y75.802 E.0005
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.83 E-.07457
G1 X102.175 Y76.01 E-.14704
G1 X102.398 Y76.285 E-.13461
G1 X102.501 Y76.646 E-.1427
G1 X102.501 Y77.333 E-.26108
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.042 Y78.95 Z6.28 F42000
G1 X85.153 Y81.094 Z6.28
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.400008
G1 F1754
M204 S5000
G1 X85.116 Y80.978 E.00152
; LINE_WIDTH: 0.380768
G1 X85.079 Y80.862 E.00144
; LINE_WIDTH: 0.361538
G1 X85.071 Y80.836 E.00031
; LINE_WIDTH: 0.357168
G1 X84.986 Y80.673 E.00203
; WIPE_START
G1 F12000
M204 S6000
G1 X85.071 Y80.836 E-.30636
G1 X85.079 Y80.862 E-.04635
G1 X85.116 Y80.978 E-.20363
G1 X85.153 Y81.094 E-.20365
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.28 F42000
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1754
M204 S5000
G1 X82.63 Y79.864 E.00283
; LINE_WIDTH: 0.501828
G1 X83.569 Y81.63 E.03159
; LINE_WIDTH: 0.541455
G1 X83.594 Y81.677 E.00091
; LINE_WIDTH: 0.581081
G1 X83.619 Y81.724 E.00098
; LINE_WIDTH: 0.620708
G1 X83.644 Y81.771 E.00105
; WIPE_START
G1 F12000
M204 S6000
G1 X83.619 Y81.724 E-.02026
G1 X83.594 Y81.677 E-.02026
G1 X83.569 Y81.63 E-.02026
G1 X82.705 Y80.005 E-.69922
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.984 Y82.27 Z6.28 F42000
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1754
M204 S5000
G1 X82.071 Y82.431 E.00203
; LINE_WIDTH: 0.361538
G1 X82.088 Y82.452 E.00031
; LINE_WIDTH: 0.380778
G1 X82.164 Y82.548 E.00144
; LINE_WIDTH: 0.400008
G1 X82.239 Y82.643 E.00152
; WIPE_START
G1 F12000
M204 S6000
G1 X82.164 Y82.548 E-.20372
G1 X82.088 Y82.452 E-.20372
G1 X82.071 Y82.431 E-.04621
G1 X81.984 Y82.27 E-.30634
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.25 Y80.402 Z6.28 F42000
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.398988
G1 F1754
M204 S5000
G1 X80.289 Y80.407 E.00049
; LINE_WIDTH: 0.394768
G1 X80.552 Y80.561 E.00375
; LINE_WIDTH: 0.404088
G1 X80.743 Y80.902 E.00494
G1 X80.759 Y81.029 E.00161
; LINE_WIDTH: 0.385048
G1 X80.711 Y81.325 E.0036
; LINE_WIDTH: 0.392908
G1 X80.514 Y81.595 E.00409
G1 X80.26 Y81.732 E.00353
; LINE_WIDTH: 0.392388
G1 X79.986 Y81.753 E.00336
; LINE_WIDTH: 0.399188
G1 X79.724 Y81.67 E.00343
G1 X79.472 Y81.409 E.00452
; LINE_WIDTH: 0.389208
G1 X79.383 Y81.136 E.00348
; LINE_WIDTH: 0.385928
G1 X79.41 Y80.864 E.00329
G1 X79.54 Y80.623 E.00329
G1 X79.753 Y80.452 E.00329
; LINE_WIDTH: 0.398988
G1 X80.015 Y80.37 E.00341
G1 X80.19 Y80.394 E.0022
; WIPE_START
G1 F12000
M204 S6000
G1 X80.289 Y80.407 E-.03768
G1 X80.552 Y80.561 E-.11583
G1 X80.743 Y80.902 E-.14878
G1 X80.759 Y81.029 E-.04837
G1 X80.711 Y81.325 E-.11413
G1 X80.514 Y81.595 E-.12698
G1 X80.26 Y81.732 E-.1095
G1 X80.106 Y81.744 E-.05874
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.28 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 72/99
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 15
G1 X102.304 Y75.628 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.413018
G1 F1752
M204 S5000
G1 X102.577 Y75.862 E.00465
G1 X102.787 Y76.19 E.00502
; LINE_WIDTH: 0.412418
G1 X102.894 Y76.646 E.00603
; LINE_WIDTH: 0.409378
G1 X102.894 Y80.646 E.05114
; LINE_WIDTH: 0.409248
G1 X102.894 Y84.646 E.05112
; LINE_WIDTH: 0.409128
G1 X102.895 Y88.646 E.0511
; LINE_WIDTH: 0.409008
G1 X102.895 Y92.646 E.05109
; LINE_WIDTH: 0.408888
G1 X102.895 Y96.646 E.05107
; LINE_WIDTH: 0.408768
G1 X102.895 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.896 Y103.276 E.03355
G1 X102.866 Y103.543 E.00344
; LINE_WIDTH: 0.414678
G1 X102.749 Y103.881 E.00463
G1 X102.575 Y104.137 E.00401
; LINE_WIDTH: 0.403738
G1 X102.288 Y104.386 E.00479
; LINE_WIDTH: 0.409828
G1 X101.851 Y104.565 E.00605
; LINE_WIDTH: 0.410188
G1 X101.59 Y104.595 E.00336
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410048
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409908
G1 X95.59 Y104.595 E.0256
; LINE_WIDTH: 0.409768
G1 X93.59 Y104.595 E.02559
; LINE_WIDTH: 0.409628
G1 X91.59 Y104.595 E.02558
; LINE_WIDTH: 0.409488
G1 X89.59 Y104.595 E.02558
; LINE_WIDTH: 0.409358
G1 X87.59 Y104.595 E.02557
; LINE_WIDTH: 0.409218
G1 X85.59 Y104.595 E.02556
; LINE_WIDTH: 0.409078
G1 X83.59 Y104.596 E.02555
; LINE_WIDTH: 0.408938
G1 X81.59 Y104.596 E.02554
; LINE_WIDTH: 0.408798
G1 X79.59 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.596 E.01488
G1 X78.003 Y104.523 E.00545
; LINE_WIDTH: 0.405398
G1 X77.605 Y104.311 E.00571
; LINE_WIDTH: 0.411208
G1 X77.309 Y103.988 E.00563
; LINE_WIDTH: 0.415258
G1 X77.158 Y103.636 E.00497
G1 X77.104 Y103.287 E.00458
; LINE_WIDTH: 0.408588
G1 X77.104 Y77.287 E.33172
G3 X77.141 Y76.414 I3.724 J-.281 E.01118
; LINE_WIDTH: 0.412558
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.829 E.00378
; LINE_WIDTH: 0.404218
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.410168
G1 X78.149 Y75.434 E.00557
; LINE_WIDTH: 0.410278
G1 X78.41 Y75.405 E.00336
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409868
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409668
G1 X86.41 Y75.405 E.02559
; LINE_WIDTH: 0.409468
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409268
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.409068
G1 X92.41 Y75.405 E.02555
; LINE_WIDTH: 0.408868
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408668
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408468
G1 X98.41 Y75.405 E.02551
; LINE_WIDTH: 0.408268
G1 X100.41 Y75.405 E.0255
; LINE_WIDTH: 0.408058
G1 X101.6 Y75.405 E.01517
; LINE_WIDTH: 0.407948
G1 X101.842 Y75.437 E.00311
; LINE_WIDTH: 0.408398
G1 X102.254 Y75.596 E.00563
M204 S250
G1 X101.701 Y75.811 F42000
; LINE_WIDTH: 0.410008
G1 F1752
M204 S5000
G1 X101.832 Y75.83 E.0017
G1 X102.175 Y76.009 E.00495
; LINE_WIDTH: 0.406578
G1 X102.398 Y76.284 E.0045
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.00481
G1 X102.502 Y80.646 E.05114
; LINE_WIDTH: 0.409248
G1 X102.502 Y84.646 E.05112
; LINE_WIDTH: 0.409128
G1 X102.503 Y88.646 E.0511
; LINE_WIDTH: 0.409008
M73 P76 R3
G1 X102.503 Y92.646 E.05109
; LINE_WIDTH: 0.408888
G1 X102.504 Y96.646 E.05107
; LINE_WIDTH: 0.408768
G1 X102.504 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.504 Y103.276 E.03355
G1 X102.462 Y103.559 E.00365
; LINE_WIDTH: 0.406448
G1 X102.279 Y103.89 E.0048
; LINE_WIDTH: 0.405988
G1 X102 Y104.105 E.00447
; LINE_WIDTH: 0.406198
G1 X101.668 Y104.2 E.00438
; LINE_WIDTH: 0.410188
G3 X99.581 Y104.202 I-1.091 J-44.984 E.02673
; LINE_WIDTH: 0.410048
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409908
G1 X95.581 Y104.203 E.0256
; LINE_WIDTH: 0.409768
G1 X93.581 Y104.203 E.02559
; LINE_WIDTH: 0.409628
G1 X91.581 Y104.203 E.02558
; LINE_WIDTH: 0.409488
G1 X89.581 Y104.203 E.02558
; LINE_WIDTH: 0.409358
G1 X87.581 Y104.203 E.02557
; LINE_WIDTH: 0.409218
G1 X85.581 Y104.204 E.02556
; LINE_WIDTH: 0.409078
G1 X83.581 Y104.204 E.02555
; LINE_WIDTH: 0.408938
G1 X81.581 Y104.204 E.02554
; LINE_WIDTH: 0.408798
G1 X79.581 Y104.204 E.02553
; LINE_WIDTH: 0.408658
G1 X78.424 Y104.204 E.01476
G1 X78.062 Y104.133 E.00471
; LINE_WIDTH: 0.408228
G1 X77.767 Y103.941 E.00449
G1 X77.571 Y103.645 E.00453
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.275 E.00482
G1 X77.496 Y76.725 E.33874
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.404218
G1 X77.729 Y76.101 E.00443
; LINE_WIDTH: 0.407948
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.419 Y75.798 E.00537
G1 X80.419 Y75.798 E.02563
; LINE_WIDTH: 0.410068
G1 X82.419 Y75.798 E.02561
; LINE_WIDTH: 0.409868
G1 X84.419 Y75.798 E.0256
; LINE_WIDTH: 0.409668
G1 X86.419 Y75.798 E.02559
; LINE_WIDTH: 0.409468
G1 X88.419 Y75.797 E.02557
; LINE_WIDTH: 0.409268
G1 X90.419 Y75.797 E.02556
; LINE_WIDTH: 0.409068
G1 X92.419 Y75.797 E.02555
; LINE_WIDTH: 0.408868
G1 X94.419 Y75.797 E.02553
; LINE_WIDTH: 0.408668
G1 X96.419 Y75.797 E.02552
; LINE_WIDTH: 0.408468
G1 X98.419 Y75.796 E.02551
; LINE_WIDTH: 0.408258
G1 X100.419 Y75.796 E.0255
; LINE_WIDTH: 0.408058
G1 X101.6 Y75.796 E.01505
; LINE_WIDTH: 0.410008
G1 X101.642 Y75.802 E.00054
; WIPE_START
G1 F12000
M204 S6000
G1 X101.832 Y75.83 E-.0732
G1 X102.175 Y76.009 E-.14692
G1 X102.398 Y76.284 E-.13458
G1 X102.501 Y76.646 E-.14292
G1 X102.501 Y77.337 E-.26238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.042 Y78.952 Z6.36 F42000
G1 X85.153 Y81.094 Z6.36
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.400008
G1 F1752
M204 S5000
G1 X85.116 Y80.978 E.00152
; LINE_WIDTH: 0.380758
G1 X85.079 Y80.862 E.00144
; LINE_WIDTH: 0.361508
G1 X85.071 Y80.836 E.00031
; LINE_WIDTH: 0.357168
G1 X84.986 Y80.673 E.00203
; WIPE_START
G1 F12000
M204 S6000
G1 X85.071 Y80.836 E-.30637
G1 X85.079 Y80.862 E-.04603
G1 X85.116 Y80.978 E-.20379
G1 X85.153 Y81.094 E-.20381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1752
M204 S5000
G1 X82.63 Y79.864 E.00283
; LINE_WIDTH: 0.501828
G1 X83.569 Y81.63 E.03159
; LINE_WIDTH: 0.541455
G1 X83.594 Y81.677 E.00091
; LINE_WIDTH: 0.581081
G1 X83.619 Y81.724 E.00098
; LINE_WIDTH: 0.620708
G1 X83.644 Y81.771 E.00105
; WIPE_START
G1 F12000
M204 S6000
G1 X83.619 Y81.724 E-.02026
G1 X83.594 Y81.677 E-.02026
G1 X83.569 Y81.63 E-.02026
G1 X82.705 Y80.005 E-.69922
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.984 Y82.27 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1752
M204 S5000
G1 X82.071 Y82.431 E.00203
; LINE_WIDTH: 0.361528
G1 X82.088 Y82.452 E.00031
; LINE_WIDTH: 0.380768
G1 X82.164 Y82.548 E.00144
; LINE_WIDTH: 0.400008
G1 X82.239 Y82.643 E.00152
; WIPE_START
G1 F12000
M204 S6000
G1 X82.164 Y82.548 E-.20375
G1 X82.088 Y82.452 E-.20376
G1 X82.071 Y82.431 E-.04614
G1 X81.984 Y82.27 E-.30634
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.288 Y80.407 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.394768
G1 F1752
M204 S5000
G1 X80.552 Y80.561 E.00376
; LINE_WIDTH: 0.404108
G1 X80.743 Y80.902 E.00494
G1 X80.759 Y81.029 E.0016
; LINE_WIDTH: 0.385048
G1 X80.711 Y81.325 E.0036
; LINE_WIDTH: 0.392888
G1 X80.514 Y81.595 E.00409
G1 X80.261 Y81.732 E.00353
; LINE_WIDTH: 0.392388
G1 X79.986 Y81.753 E.00336
; LINE_WIDTH: 0.396248
G1 X79.675 Y81.635 E.00412
G1 X79.452 Y81.376 E.00423
; LINE_WIDTH: 0.391248
G1 X79.379 Y81.08 E.00372
; LINE_WIDTH: 0.392968
G1 X79.455 Y80.75 E.00415
; LINE_WIDTH: 0.404048
G1 X79.665 Y80.501 E.0041
G1 X80.005 Y80.372 E.00459
; LINE_WIDTH: 0.400168
G1 X80.229 Y80.399 E.00281
; WIPE_START
G1 F12000
M204 S6000
G1 X80.552 Y80.561 E-.13716
G1 X80.743 Y80.902 E-.1488
G1 X80.759 Y81.029 E-.04835
G1 X80.711 Y81.325 E-.11417
G1 X80.514 Y81.595 E-.12691
G1 X80.261 Y81.732 E-.10939
G1 X80.063 Y81.747 E-.07523
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.36 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.04
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 73/99
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 15
G1 X102.307 Y75.631 F42000
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.416818
G1 F1752
M204 S5000
G1 X102.579 Y75.866 E.00467
G1 X102.769 Y76.144 E.0044
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00661
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.3 E.33858
; LINE_WIDTH: 0.412498
G1 X102.816 Y103.738 E.00573
G1 X102.581 Y104.129 E.00588
; LINE_WIDTH: 0.403668
G1 X102.252 Y104.41 E.00545
; LINE_WIDTH: 0.411518
G1 X101.871 Y104.562 E.00528
G1 X101.59 Y104.595 E.00364
; LINE_WIDTH: 0.410198
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.409978
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409758
G1 X95.59 Y104.595 E.02559
; LINE_WIDTH: 0.409548
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409328
G1 X91.59 Y104.595 E.02556
; LINE_WIDTH: 0.409108
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408898
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408678
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408458
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408248
G1 X81.59 Y104.594 E.02549
; LINE_WIDTH: 0.408028
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.407688
G1 X78.057 Y104.539 E.00442
; LINE_WIDTH: 0.414688
G1 X77.709 Y104.387 E.00492
G1 X77.419 Y104.136 E.00497
; LINE_WIDTH: 0.411458
G1 X77.207 Y103.789 E.00522
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.289 E.00651
G1 X77.104 Y77.289 E.33172
G3 X77.141 Y76.413 I3.733 J-.282 E.01121
; LINE_WIDTH: 0.412778
G1 X77.272 Y76.079 E.00463
G1 X77.457 Y75.83 E.004
; LINE_WIDTH: 0.403668
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.410228
G1 X78.148 Y75.434 E.00556
G1 X78.41 Y75.405 E.00338
G1 X80.41 Y75.405 E.02562
; LINE_WIDTH: 0.410068
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409868
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409668
G1 X86.41 Y75.405 E.02559
; LINE_WIDTH: 0.409468
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409268
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.409058
G1 X92.41 Y75.405 E.02555
; LINE_WIDTH: 0.408858
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408658
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408458
G1 X98.41 Y75.405 E.02551
; LINE_WIDTH: 0.408258
G1 X100.41 Y75.405 E.0255
; LINE_WIDTH: 0.408058
G1 X101.6 Y75.405 E.01517
; LINE_WIDTH: 0.407938
G1 X101.842 Y75.437 E.0031
; LINE_WIDTH: 0.408358
G1 X102.259 Y75.598 E.0057
M204 S250
G1 X101.704 Y75.811 F42000
; LINE_WIDTH: 0.410058
G1 F1752
M204 S5000
G1 X101.832 Y75.83 E.00166
G1 X102.18 Y76.015 E.00504
; LINE_WIDTH: 0.404878
G1 X102.43 Y76.354 E.00532
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
G1 X102.504 Y103.3 E.33858
; LINE_WIDTH: 0.412498
G1 X102.449 Y103.586 E.00375
G1 X102.278 Y103.889 E.00448
; LINE_WIDTH: 0.409118
G1 X102 Y104.108 E.00452
; LINE_WIDTH: 0.410198
G1 X101.58 Y104.202 E.00551
G1 X99.58 Y104.202 E.02562
; LINE_WIDTH: 0.409978
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409758
G1 X95.58 Y104.202 E.02559
; LINE_WIDTH: 0.409548
G1 X93.58 Y104.203 E.02558
; LINE_WIDTH: 0.409328
G1 X91.58 Y104.203 E.02556
; LINE_WIDTH: 0.409108
G1 X89.58 Y104.203 E.02555
; LINE_WIDTH: 0.408898
G1 X87.58 Y104.203 E.02554
; LINE_WIDTH: 0.408678
M73 P77 R3
G1 X85.58 Y104.203 E.02552
; LINE_WIDTH: 0.408458
G1 X83.58 Y104.203 E.02551
; LINE_WIDTH: 0.408248
G1 X81.58 Y104.204 E.02549
; LINE_WIDTH: 0.408028
G1 X79.58 Y104.204 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.407688
G1 X78.058 Y104.132 E.00444
; LINE_WIDTH: 0.406448
G1 X77.749 Y103.921 E.00476
; LINE_WIDTH: 0.407178
G1 X77.583 Y103.686 E.00366
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.279 E.00531
G1 X77.496 Y76.724 E.33879
G1 X77.551 Y76.403 E.00415
; LINE_WIDTH: 0.403708
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.407968
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.419 Y75.798 E.00537
G1 X80.419 Y75.798 E.02563
; LINE_WIDTH: 0.410068
G1 X82.419 Y75.798 E.02561
; LINE_WIDTH: 0.409868
G1 X84.419 Y75.798 E.0256
; LINE_WIDTH: 0.409668
G1 X86.419 Y75.798 E.02559
; LINE_WIDTH: 0.409468
G1 X88.419 Y75.797 E.02557
; LINE_WIDTH: 0.409268
G1 X90.419 Y75.797 E.02556
; LINE_WIDTH: 0.409058
G1 X92.419 Y75.797 E.02555
; LINE_WIDTH: 0.408858
G1 X94.419 Y75.797 E.02553
; LINE_WIDTH: 0.408658
G1 X96.419 Y75.797 E.02552
; LINE_WIDTH: 0.408458
G1 X98.419 Y75.796 E.02551
; LINE_WIDTH: 0.408258
G1 X100.419 Y75.796 E.0255
; LINE_WIDTH: 0.408048
G1 X101.6 Y75.796 E.01505
; LINE_WIDTH: 0.410058
G1 X101.645 Y75.803 E.00058
; WIPE_START
G1 F12000
M204 S6000
G1 X101.832 Y75.83 E-.072
G1 X102.18 Y76.015 E-.14964
G1 X102.43 Y76.354 E-.16003
G1 X102.504 Y76.7 E-.13432
G1 X102.504 Y77.342 E-.24401
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.044 Y78.955 Z6.44 F42000
G1 X85.153 Y81.094 Z6.44
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.400008
G1 F1752
M204 S5000
G1 X85.116 Y80.978 E.00152
; LINE_WIDTH: 0.380778
G1 X85.079 Y80.862 E.00144
; LINE_WIDTH: 0.361548
G1 X85.071 Y80.836 E.00031
; LINE_WIDTH: 0.357168
G1 X84.986 Y80.673 E.00203
; WIPE_START
G1 F12000
M204 S6000
G1 X85.071 Y80.836 E-.30638
G1 X85.079 Y80.862 E-.04641
G1 X85.116 Y80.978 E-.2036
G1 X85.153 Y81.094 E-.20362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.644 Y81.771 Z6.44 F42000
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.620708
G1 F1752
M204 S5000
G1 X83.619 Y81.724 E.00105
; LINE_WIDTH: 0.581088
G1 X83.594 Y81.677 E.00098
; LINE_WIDTH: 0.541468
G1 X83.569 Y81.63 E.00091
; LINE_WIDTH: 0.501848
G1 X83.485 Y81.471 E.00284
; LINE_WIDTH: 0.501688
G1 X82.546 Y79.706 E.03159
; WIPE_START
G1 F12000
M204 S6000
G1 X83.485 Y81.471 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.984 Y82.27 Z6.44 F42000
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1752
M204 S5000
G1 X82.071 Y82.431 E.00203
; LINE_WIDTH: 0.361528
G1 X82.088 Y82.452 E.00031
; LINE_WIDTH: 0.380768
G1 X82.164 Y82.548 E.00144
; LINE_WIDTH: 0.400008
G1 X82.239 Y82.643 E.00152
; WIPE_START
G1 F12000
M204 S6000
G1 X82.164 Y82.548 E-.20376
G1 X82.088 Y82.452 E-.20376
G1 X82.071 Y82.431 E-.04613
G1 X81.984 Y82.27 E-.30634
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.262 Y80.403 Z6.44 F42000
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.395888
G1 F1752
M204 S5000
G1 X80.288 Y80.407 E.00033
; LINE_WIDTH: 0.394808
G1 X80.551 Y80.561 E.00375
; LINE_WIDTH: 0.404068
G1 X80.743 Y80.902 E.00494
G1 X80.759 Y81.029 E.0016
; LINE_WIDTH: 0.385028
G1 X80.711 Y81.325 E.0036
; LINE_WIDTH: 0.392888
G1 X80.514 Y81.595 E.00409
G1 X80.26 Y81.732 E.00353
; LINE_WIDTH: 0.404268
G1 X80.02 Y81.759 E.00305
; LINE_WIDTH: 0.405868
G1 X79.787 Y81.698 E.00306
G1 X79.562 Y81.537 E.00351
; LINE_WIDTH: 0.405248
G1 X79.418 Y81.302 E.00348
G1 X79.386 Y80.964 E.00429
; LINE_WIDTH: 0.388668
G1 X79.486 Y80.695 E.00348
; LINE_WIDTH: 0.387568
G1 X79.742 Y80.46 E.00419
; LINE_WIDTH: 0.395888
G1 X80.015 Y80.372 E.00355
G1 X80.202 Y80.396 E.00233
; WIPE_START
G1 F12000
M204 S6000
G1 X80.288 Y80.407 E-.03305
G1 X80.551 Y80.561 E-.11584
G1 X80.743 Y80.902 E-.14889
G1 X80.759 Y81.029 E-.04836
G1 X80.711 Y81.325 E-.11419
G1 X80.514 Y81.595 E-.12697
G1 X80.26 Y81.732 E-.10939
G1 X80.095 Y81.75 E-.06332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.44 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 74/99
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 15
G1 X102.309 Y75.633 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.412998
G1 F1752
M204 S5000
G1 X102.577 Y75.862 E.00455
G1 X102.787 Y76.191 E.00504
; LINE_WIDTH: 0.412528
G1 X102.894 Y76.646 E.00602
; LINE_WIDTH: 0.409388
G1 X102.894 Y80.646 E.05114
; LINE_WIDTH: 0.409258
G1 X102.894 Y84.646 E.05112
; LINE_WIDTH: 0.409138
G1 X102.894 Y88.646 E.0511
; LINE_WIDTH: 0.409018
G1 X102.895 Y92.646 E.05109
; LINE_WIDTH: 0.408898
G1 X102.895 Y96.646 E.05107
; LINE_WIDTH: 0.408778
G1 X102.895 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.896 Y103.276 E.03356
G1 X102.827 Y103.685 E.0053
; LINE_WIDTH: 0.405168
G1 X102.61 Y104.098 E.0059
; LINE_WIDTH: 0.407648
G1 X102.314 Y104.373 E.00514
; LINE_WIDTH: 0.413948
G1 X102.019 Y104.518 E.00425
G1 X101.585 Y104.595 E.0057
; LINE_WIDTH: 0.410188
G1 X99.585 Y104.595 E.02562
; LINE_WIDTH: 0.409968
G1 X97.585 Y104.595 E.02561
; LINE_WIDTH: 0.409748
G1 X95.585 Y104.595 E.02559
; LINE_WIDTH: 0.409538
G1 X93.585 Y104.595 E.02558
; LINE_WIDTH: 0.409318
G1 X91.585 Y104.595 E.02556
; LINE_WIDTH: 0.409108
G1 X89.585 Y104.595 E.02555
; LINE_WIDTH: 0.408888
G1 X87.585 Y104.595 E.02554
; LINE_WIDTH: 0.408678
G1 X85.585 Y104.595 E.02552
; LINE_WIDTH: 0.408458
G1 X83.585 Y104.594 E.02551
; LINE_WIDTH: 0.408238
G1 X81.585 Y104.594 E.02549
; LINE_WIDTH: 0.408028
G1 X79.585 Y104.594 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.594 E.01508
; LINE_WIDTH: 0.410918
G1 X77.992 Y104.522 E.00531
; LINE_WIDTH: 0.411798
G1 X77.667 Y104.359 E.00469
G1 X77.434 Y104.153 E.00399
; LINE_WIDTH: 0.408678
G1 X77.205 Y103.795 E.00543
G1 X77.104 Y103.295 E.00652
G1 X77.104 Y76.724 E.33907
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408238
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.413358
G1 X77.981 Y75.482 E.00407
G1 X78.415 Y75.405 E.00569
; LINE_WIDTH: 0.410278
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409868
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409668
G1 X86.415 Y75.405 E.02559
; LINE_WIDTH: 0.409458
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409258
G1 X90.415 Y75.405 E.02556
; LINE_WIDTH: 0.409058
G1 X92.415 Y75.405 E.02555
; LINE_WIDTH: 0.408858
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408648
G1 X96.415 Y75.405 E.02552
; LINE_WIDTH: 0.408448
G1 X98.415 Y75.405 E.02551
; LINE_WIDTH: 0.408248
G1 X100.415 Y75.405 E.02549
; LINE_WIDTH: 0.408048
G1 X101.6 Y75.405 E.01509
; LINE_WIDTH: 0.407928
G1 X101.842 Y75.436 E.0031
; LINE_WIDTH: 0.408298
G1 X102.261 Y75.598 E.00573
M204 S250
G1 X101.708 Y75.812 F42000
; LINE_WIDTH: 0.410118
G1 F1752
M204 S5000
G1 X101.833 Y75.83 E.00161
G1 X102.174 Y76.009 E.00494
; LINE_WIDTH: 0.406488
G1 X102.398 Y76.284 E.0045
; LINE_WIDTH: 0.409388
G1 X102.501 Y76.646 E.00482
G1 X102.502 Y80.646 E.05114
; LINE_WIDTH: 0.409258
G1 X102.502 Y84.646 E.05112
; LINE_WIDTH: 0.409138
G1 X102.503 Y88.646 E.0511
; LINE_WIDTH: 0.409018
G1 X102.503 Y92.646 E.05109
; LINE_WIDTH: 0.408898
G1 X102.504 Y96.646 E.05107
; LINE_WIDTH: 0.408778
G1 X102.504 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.504 Y103.276 E.03356
G1 X102.464 Y103.548 E.00351
; LINE_WIDTH: 0.407268
G1 X102.279 Y103.891 E.00496
G1 X101.999 Y104.106 E.00449
; LINE_WIDTH: 0.406118
G1 X101.668 Y104.198 E.00436
; LINE_WIDTH: 0.410188
G1 X99.569 Y104.202 E.02689
; LINE_WIDTH: 0.409968
G1 X97.569 Y104.202 E.02561
; LINE_WIDTH: 0.409748
G1 X95.569 Y104.202 E.02559
; LINE_WIDTH: 0.409538
G1 X93.569 Y104.203 E.02558
; LINE_WIDTH: 0.409318
G1 X91.569 Y104.203 E.02556
; LINE_WIDTH: 0.409108
G1 X89.569 Y104.203 E.02555
; LINE_WIDTH: 0.408888
G1 X87.569 Y104.203 E.02554
; LINE_WIDTH: 0.408668
G1 X85.569 Y104.203 E.02552
; LINE_WIDTH: 0.408458
G1 X83.569 Y104.203 E.02551
; LINE_WIDTH: 0.408238
G1 X81.569 Y104.204 E.02549
; LINE_WIDTH: 0.408028
G1 X79.569 Y104.204 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.204 E.01489
; LINE_WIDTH: 0.407688
G1 X77.986 Y104.098 E.00544
; LINE_WIDTH: 0.410988
G1 X77.723 Y103.891 E.0043
G1 X77.543 Y103.572 E.0047
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.29 E.00365
G1 X77.496 Y76.724 E.33893
G1 X77.541 Y76.425 E.00387
; LINE_WIDTH: 0.411208
G1 X77.755 Y76.075 E.00526
M73 P78 R3
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405868
G1 X78.331 Y75.802 E.00421
; LINE_WIDTH: 0.410278
G1 X80.431 Y75.798 E.02691
; LINE_WIDTH: 0.410068
G1 X82.431 Y75.798 E.02561
; LINE_WIDTH: 0.409868
G1 X84.431 Y75.798 E.0256
; LINE_WIDTH: 0.409668
G1 X86.431 Y75.798 E.02559
; LINE_WIDTH: 0.409458
G1 X88.431 Y75.797 E.02557
; LINE_WIDTH: 0.409258
G1 X90.431 Y75.797 E.02556
; LINE_WIDTH: 0.409058
G1 X92.431 Y75.797 E.02555
; LINE_WIDTH: 0.408858
G1 X94.431 Y75.797 E.02553
; LINE_WIDTH: 0.408648
G1 X96.431 Y75.797 E.02552
; LINE_WIDTH: 0.408448
G1 X98.431 Y75.796 E.02551
; LINE_WIDTH: 0.408248
G1 X100.431 Y75.796 E.02549
; LINE_WIDTH: 0.408038
G1 X101.6 Y75.796 E.0149
; LINE_WIDTH: 0.410118
G1 X101.649 Y75.803 E.00063
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.83 E-.07061
G1 X102.174 Y76.009 E-.14647
G1 X102.398 Y76.284 E-.13463
G1 X102.501 Y76.646 E-.14324
G1 X102.501 Y77.344 E-.26506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.041 Y78.956 Z6.52 F42000
G1 X85.153 Y81.094 Z6.52
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.400008
G1 F1752
M204 S5000
G1 X85.116 Y80.978 E.00152
; LINE_WIDTH: 0.380768
G1 X85.079 Y80.862 E.00144
; LINE_WIDTH: 0.361528
G1 X85.071 Y80.836 E.00031
; LINE_WIDTH: 0.357168
G1 X84.986 Y80.673 E.00203
; WIPE_START
G1 F12000
M204 S6000
G1 X85.071 Y80.836 E-.30636
G1 X85.079 Y80.862 E-.04625
G1 X85.116 Y80.978 E-.20368
G1 X85.153 Y81.094 E-.2037
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1752
M204 S5000
G1 X82.63 Y79.864 E.00283
; LINE_WIDTH: 0.501828
G1 X83.569 Y81.63 E.03159
; LINE_WIDTH: 0.541455
G1 X83.594 Y81.677 E.00091
; LINE_WIDTH: 0.581081
G1 X83.619 Y81.724 E.00098
; LINE_WIDTH: 0.620708
G1 X83.644 Y81.771 E.00105
; WIPE_START
G1 F12000
M204 S6000
G1 X83.619 Y81.724 E-.02026
G1 X83.594 Y81.677 E-.02026
G1 X83.569 Y81.63 E-.02026
G1 X82.705 Y80.005 E-.69922
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.984 Y82.27 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1752
M204 S5000
G1 X82.071 Y82.431 E.00203
; LINE_WIDTH: 0.361568
G1 X82.088 Y82.453 E.00031
; LINE_WIDTH: 0.380788
G1 X82.164 Y82.548 E.00144
; LINE_WIDTH: 0.400008
G1 X82.239 Y82.643 E.00152
; WIPE_START
G1 F12000
M204 S6000
G1 X82.164 Y82.548 E-.20356
G1 X82.088 Y82.453 E-.20358
G1 X82.071 Y82.431 E-.04651
G1 X81.984 Y82.27 E-.30635
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.254 Y80.402 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.398988
G1 F1752
M204 S5000
G1 X80.288 Y80.407 E.00043
; LINE_WIDTH: 0.394788
G1 X80.551 Y80.561 E.00375
; LINE_WIDTH: 0.404088
G1 X80.743 Y80.902 E.00494
G1 X80.759 Y81.029 E.0016
; LINE_WIDTH: 0.385028
G1 X80.719 Y81.299 E.00328
G1 X80.577 Y81.533 E.00328
G1 X80.331 Y81.705 E.0036
; LINE_WIDTH: 0.392908
G1 X80 Y81.753 E.00409
; LINE_WIDTH: 0.399228
G1 X79.724 Y81.67 E.00359
G1 X79.517 Y81.488 E.00344
; LINE_WIDTH: 0.398188
G1 X79.386 Y81.15 E.00451
; LINE_WIDTH: 0.389208
G1 X79.41 Y80.863 E.00348
; LINE_WIDTH: 0.385948
G1 X79.54 Y80.623 E.00329
G1 X79.753 Y80.452 E.00329
; LINE_WIDTH: 0.398988
G1 X80.015 Y80.37 E.00341
G1 X80.195 Y80.394 E.00226
; WIPE_START
G1 F12000
M204 S6000
G1 X80.288 Y80.407 E-.036
G1 X80.551 Y80.561 E-.11576
G1 X80.743 Y80.902 E-.14888
G1 X80.759 Y81.029 E-.04836
G1 X80.719 Y81.299 E-.10395
G1 X80.577 Y81.533 E-.10383
G1 X80.331 Y81.705 E-.11417
G1 X80.099 Y81.739 E-.08905
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 75/99
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 15
G1 X102.312 Y75.635 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.412928
G1 F1758
M204 S5000
G1 X102.576 Y75.861 E.00449
; LINE_WIDTH: 0.413388
G1 X102.794 Y76.208 E.00529
G1 X102.894 Y76.646 E.0058
; LINE_WIDTH: 0.409378
G1 X102.894 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.894 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.894 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.894 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.894 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.894 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.894 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.894 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.894 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.894 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.894 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.894 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.894 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.894 Y103.3 E.00832
G1 X102.848 Y103.6 E.00386
; LINE_WIDTH: 0.410478
G1 X102.688 Y103.992 E.00543
; LINE_WIDTH: 0.413248
G1 X102.439 Y104.276 E.00488
G1 X102.094 Y104.494 E.00526
; LINE_WIDTH: 0.411408
G1 X101.595 Y104.595 E.00655
; LINE_WIDTH: 0.410208
G1 X99.595 Y104.595 E.02562
; LINE_WIDTH: 0.409988
G1 X97.595 Y104.595 E.02561
; LINE_WIDTH: 0.409768
G1 X95.595 Y104.595 E.02559
; LINE_WIDTH: 0.409548
G1 X93.595 Y104.595 E.02558
; LINE_WIDTH: 0.409338
G1 X91.595 Y104.595 E.02557
; LINE_WIDTH: 0.409118
G1 X89.595 Y104.595 E.02555
; LINE_WIDTH: 0.408898
G1 X87.595 Y104.595 E.02554
; LINE_WIDTH: 0.408678
G1 X85.595 Y104.595 E.02552
; LINE_WIDTH: 0.408468
G1 X83.595 Y104.594 E.02551
; LINE_WIDTH: 0.408248
G1 X81.595 Y104.594 E.02549
; LINE_WIDTH: 0.408028
G1 X79.595 Y104.594 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.594 E.01521
; LINE_WIDTH: 0.407688
G1 X78.15 Y104.559 E.00322
; LINE_WIDTH: 0.408418
G1 X77.731 Y104.401 E.0057
; LINE_WIDTH: 0.414428
G1 X77.478 Y104.199 E.0042
G1 X77.246 Y103.876 E.00514
; LINE_WIDTH: 0.408548
G1 X77.135 Y103.543 E.00448
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.292 E.00325
G1 X77.105 Y101.292 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.292 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.292 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.292 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.292 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.292 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.292 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.292 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.292 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.292 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.292 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.292 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.292 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00724
G1 X77.187 Y76.276 E.00582
; LINE_WIDTH: 0.402608
G1 X77.394 Y75.898 E.00541
; LINE_WIDTH: 0.408238
G1 X77.698 Y75.619 E.00526
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.413 Y75.405 E.00455
; LINE_WIDTH: 0.410278
G1 X80.413 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.413 Y75.405 E.02561
; LINE_WIDTH: 0.409868
G1 X84.413 Y75.405 E.0256
; LINE_WIDTH: 0.409658
G1 X86.413 Y75.405 E.02559
; LINE_WIDTH: 0.409458
G1 X88.413 Y75.405 E.02557
; LINE_WIDTH: 0.409258
G1 X90.413 Y75.405 E.02556
; LINE_WIDTH: 0.409048
G1 X92.413 Y75.405 E.02555
; LINE_WIDTH: 0.408848
G1 X94.413 Y75.405 E.02553
; LINE_WIDTH: 0.408648
G1 X96.413 Y75.405 E.02552
; LINE_WIDTH: 0.408438
G1 X98.413 Y75.405 E.02551
; LINE_WIDTH: 0.408238
G1 X100.413 Y75.405 E.02549
; LINE_WIDTH: 0.408038
G1 X101.6 Y75.405 E.01513
; LINE_WIDTH: 0.407918
G1 X101.842 Y75.436 E.0031
; LINE_WIDTH: 0.408278
G1 X102.264 Y75.6 E.00577
M204 S250
G1 X101.711 Y75.812 F42000
; LINE_WIDTH: 0.410138
G1 F1758
M204 S5000
G1 X101.833 Y75.83 E.00157
G1 X102.174 Y76.009 E.00493
; LINE_WIDTH: 0.405558
G1 X102.397 Y76.284 E.00449
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.00482
G1 X102.501 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.502 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.502 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.502 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.502 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.502 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.503 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.503 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.503 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.503 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.503 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.504 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.504 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.504 Y103.3 E.00832
; LINE_WIDTH: 0.408188
G1 X102.451 Y103.597 E.00385
G1 X102.278 Y103.89 E.00434
; LINE_WIDTH: 0.411408
G1 X101.96 Y104.121 E.00505
G1 X101.59 Y104.202 E.00487
; LINE_WIDTH: 0.410208
G1 X99.59 Y104.202 E.02562
; LINE_WIDTH: 0.409988
G1 X97.59 Y104.202 E.02561
; LINE_WIDTH: 0.409768
G1 X95.59 Y104.202 E.02559
; LINE_WIDTH: 0.409548
G1 X93.59 Y104.203 E.02558
; LINE_WIDTH: 0.409338
G1 X91.59 Y104.203 E.02557
; LINE_WIDTH: 0.409118
G1 X89.59 Y104.203 E.02555
; LINE_WIDTH: 0.408898
G1 X87.59 Y104.203 E.02554
; LINE_WIDTH: 0.408678
G1 X85.59 Y104.203 E.02552
; LINE_WIDTH: 0.408468
G1 X83.59 Y104.203 E.02551
; LINE_WIDTH: 0.408248
G1 X81.59 Y104.204 E.02549
; LINE_WIDTH: 0.408028
G1 X79.59 Y104.204 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.204 E.01515
; LINE_WIDTH: 0.414078
G3 X77.831 Y103.997 I.068 J-1.072 E.00794
; LINE_WIDTH: 0.408498
G1 X77.593 Y103.7 E.00486
; LINE_WIDTH: 0.410288
G1 X77.498 Y103.284 E.00547
G1 X77.498 Y101.284 E.02563
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.284 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.284 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y95.284 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.284 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.284 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.284 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.284 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.284 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.284 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.284 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.284 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.284 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00714
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.412998
G1 X77.633 Y76.242 E.00233
G1 X77.752 Y76.078 E.00262
; LINE_WIDTH: 0.411258
G1 X78.01 Y75.89 E.00409
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410278
G1 X80.425 Y75.798 E.02684
; LINE_WIDTH: 0.410068
G1 X82.425 Y75.798 E.02561
; LINE_WIDTH: 0.409868
G1 X84.425 Y75.798 E.0256
; LINE_WIDTH: 0.409658
G1 X86.425 Y75.798 E.02559
; LINE_WIDTH: 0.409458
G1 X88.425 Y75.797 E.02557
; LINE_WIDTH: 0.409258
G1 X90.425 Y75.797 E.02556
; LINE_WIDTH: 0.409048
G1 X92.425 Y75.797 E.02555
; LINE_WIDTH: 0.408848
G1 X94.425 Y75.797 E.02553
; LINE_WIDTH: 0.408648
G1 X96.425 Y75.797 E.02552
; LINE_WIDTH: 0.408438
G1 X98.425 Y75.796 E.02551
; LINE_WIDTH: 0.408238
G1 X100.425 Y75.796 E.02549
; LINE_WIDTH: 0.408028
G1 X101.6 Y75.796 E.01497
; LINE_WIDTH: 0.410138
G1 X101.652 Y75.804 E.00067
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.83 E-.06935
G1 X102.174 Y76.009 E-.14628
G1 X102.397 Y76.284 E-.13463
G1 X102.501 Y76.646 E-.14331
G1 X102.501 Y77.347 E-.26643
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.041 Y78.959 Z6.6 F42000
G1 X85.153 Y81.094 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.400008
M73 P79 R3
G1 F1758
M204 S5000
G1 X85.116 Y80.978 E.00152
; LINE_WIDTH: 0.380768
G1 X85.079 Y80.862 E.00144
; LINE_WIDTH: 0.361538
G1 X85.071 Y80.836 E.00031
; LINE_WIDTH: 0.357168
G1 X84.986 Y80.673 E.00203
; WIPE_START
G1 F12000
M204 S6000
G1 X85.071 Y80.836 E-.30638
G1 X85.079 Y80.862 E-.04627
G1 X85.116 Y80.978 E-.20367
G1 X85.153 Y81.094 E-.20368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1758
M204 S5000
G1 X82.63 Y79.864 E.00283
; LINE_WIDTH: 0.501828
G1 X83.569 Y81.63 E.03159
; LINE_WIDTH: 0.541455
G1 X83.594 Y81.677 E.00091
; LINE_WIDTH: 0.581081
G1 X83.619 Y81.724 E.00098
; LINE_WIDTH: 0.620708
G1 X83.644 Y81.771 E.00105
; WIPE_START
G1 F12000
M204 S6000
G1 X83.619 Y81.724 E-.02026
G1 X83.594 Y81.677 E-.02026
G1 X83.569 Y81.63 E-.02026
G1 X82.705 Y80.005 E-.69921
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.984 Y82.27 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1758
M204 S5000
G1 X82.071 Y82.431 E.00203
; LINE_WIDTH: 0.361508
G1 X82.088 Y82.452 E.00031
; LINE_WIDTH: 0.380758
G1 X82.163 Y82.548 E.00144
; LINE_WIDTH: 0.400008
G1 X82.239 Y82.643 E.00152
; WIPE_START
G1 F12000
M204 S6000
G1 X82.163 Y82.548 E-.20389
G1 X82.088 Y82.452 E-.2039
G1 X82.071 Y82.431 E-.04587
G1 X81.984 Y82.27 E-.30635
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.235 Y80.395 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.396248
G1 F1758
M204 S5000
G1 X80.538 Y80.553 E.00423
; LINE_WIDTH: 0.404088
G1 X80.743 Y80.902 E.00511
G1 X80.759 Y81.029 E.0016
; LINE_WIDTH: 0.385028
G1 X80.719 Y81.299 E.00328
G1 X80.559 Y81.554 E.0036
; LINE_WIDTH: 0.392928
G1 X80.273 Y81.726 E.00409
G1 X79.986 Y81.753 E.00353
; LINE_WIDTH: 0.392368
G1 X79.725 Y81.667 E.00336
; LINE_WIDTH: 0.399228
G1 X79.516 Y81.488 E.00342
G1 X79.396 Y81.24 E.00344
; LINE_WIDTH: 0.398268
G1 X79.381 Y80.964 E.00343
G1 X79.474 Y80.705 E.00343
; LINE_WIDTH: 0.413008
G1 X79.668 Y80.505 E.00358
; LINE_WIDTH: 0.417378
G1 X79.89 Y80.407 E.00318
; LINE_WIDTH: 0.418088
G3 X79.938 Y80.391 I.041 J.045 E.00068
; LINE_WIDTH: 0.416938
G1 X80.175 Y80.394 E.00308
; WIPE_START
G1 F12000
M204 S6000
G1 X80.538 Y80.553 E-.15075
G1 X80.743 Y80.902 E-.15393
G1 X80.759 Y81.029 E-.04836
G1 X80.719 Y81.299 E-.1039
G1 X80.559 Y81.554 E-.11417
G1 X80.273 Y81.726 E-.12695
G1 X80.111 Y81.741 E-.06194
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.28
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 76/99
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 15
G1 X102.315 Y75.638 F42000
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.412968
G1 F1752
M204 S5000
G1 X102.577 Y75.862 E.00445
G1 X102.788 Y76.193 E.00506
; LINE_WIDTH: 0.412638
G1 X102.894 Y76.646 E.006
; LINE_WIDTH: 0.409378
G1 X102.894 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.894 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.894 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.894 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.894 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.894 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.894 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.894 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.894 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.894 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.894 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.894 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.894 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.894 Y103.3 E.00832
G1 X102.818 Y103.738 E.00567
; LINE_WIDTH: 0.407018
G1 X102.58 Y104.13 E.00582
; LINE_WIDTH: 0.403688
G1 X102.251 Y104.411 E.00545
; LINE_WIDTH: 0.412098
G1 X101.887 Y104.558 E.00506
G1 X101.589 Y104.595 E.00385
; LINE_WIDTH: 0.410208
G1 X99.589 Y104.595 E.02562
; LINE_WIDTH: 0.409988
G1 X97.589 Y104.595 E.02561
; LINE_WIDTH: 0.409768
G1 X95.589 Y104.595 E.02559
; LINE_WIDTH: 0.409548
G1 X93.589 Y104.595 E.02558
; LINE_WIDTH: 0.409338
G1 X91.589 Y104.595 E.02557
; LINE_WIDTH: 0.409118
G1 X89.589 Y104.595 E.02555
; LINE_WIDTH: 0.408898
G1 X87.589 Y104.595 E.02554
; LINE_WIDTH: 0.408678
G1 X85.589 Y104.595 E.02552
; LINE_WIDTH: 0.408468
G1 X83.589 Y104.594 E.02551
; LINE_WIDTH: 0.408248
G1 X81.589 Y104.594 E.02549
; LINE_WIDTH: 0.408028
G1 X79.589 Y104.594 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.410958
G1 X77.988 Y104.522 E.00536
; LINE_WIDTH: 0.414208
G1 X77.704 Y104.385 E.00408
G1 X77.411 Y104.125 E.00507
; LINE_WIDTH: 0.405148
G1 X77.184 Y103.723 E.00584
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00563
G1 X77.104 Y76.724 E.33893
G1 X77.181 Y76.285 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.413 Y75.405 E.00455
; LINE_WIDTH: 0.410278
G1 X80.413 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.413 Y75.405 E.02561
; LINE_WIDTH: 0.409868
G1 X84.413 Y75.405 E.0256
; LINE_WIDTH: 0.409658
G1 X86.413 Y75.405 E.02559
; LINE_WIDTH: 0.409458
G1 X88.413 Y75.405 E.02557
; LINE_WIDTH: 0.409248
G1 X90.413 Y75.405 E.02556
; LINE_WIDTH: 0.409048
G1 X92.413 Y75.405 E.02555
; LINE_WIDTH: 0.408838
G1 X94.413 Y75.405 E.02553
; LINE_WIDTH: 0.408638
G1 X96.413 Y75.405 E.02552
; LINE_WIDTH: 0.408438
G1 X98.413 Y75.405 E.02551
; LINE_WIDTH: 0.408228
G1 X100.413 Y75.405 E.02549
; LINE_WIDTH: 0.408028
G1 X101.6 Y75.405 E.01513
; LINE_WIDTH: 0.407908
G1 X101.841 Y75.436 E.0031
; LINE_WIDTH: 0.408248
G1 X102.268 Y75.601 E.00583
M204 S250
G1 X101.715 Y75.813 F42000
; LINE_WIDTH: 0.410188
G1 F1752
M204 S5000
G1 X101.833 Y75.83 E.00153
G1 X102.173 Y76.008 E.00492
; LINE_WIDTH: 0.406378
G1 X102.397 Y76.283 E.0045
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.00483
G1 X102.501 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.502 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.502 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.502 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.502 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.502 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.503 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.503 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.503 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.503 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.503 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.504 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.504 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.504 Y103.3 E.00832
G1 X102.44 Y103.624 E.0042
; LINE_WIDTH: 0.406408
G1 X102.277 Y103.89 E.00396
; LINE_WIDTH: 0.409168
G1 X101.999 Y104.108 E.00451
G1 X101.668 Y104.199 E.00439
; LINE_WIDTH: 0.410208
G1 X99.579 Y104.202 E.02676
; LINE_WIDTH: 0.409988
G1 X97.579 Y104.202 E.02561
; LINE_WIDTH: 0.409768
G1 X95.579 Y104.202 E.02559
; LINE_WIDTH: 0.409548
G1 X93.579 Y104.203 E.02558
; LINE_WIDTH: 0.409338
G1 X91.579 Y104.203 E.02557
; LINE_WIDTH: 0.409118
G1 X89.579 Y104.203 E.02555
; LINE_WIDTH: 0.408898
G1 X87.579 Y104.203 E.02554
; LINE_WIDTH: 0.408678
G1 X85.579 Y104.203 E.02552
; LINE_WIDTH: 0.408468
G1 X83.579 Y104.203 E.02551
; LINE_WIDTH: 0.408248
G1 X81.579 Y104.204 E.02549
; LINE_WIDTH: 0.408028
G1 X79.579 Y104.204 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.204 E.01501
; LINE_WIDTH: 0.407688
G1 X77.977 Y104.094 E.00556
; LINE_WIDTH: 0.406808
G1 X77.685 Y103.845 E.00488
; LINE_WIDTH: 0.405708
G1 X77.541 Y103.572 E.0039
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.279 E.00378
G1 X77.496 Y76.724 E.3388
G1 X77.531 Y76.457 E.00344
; LINE_WIDTH: 0.406858
G1 X77.729 Y76.1 E.00518
G1 X78.01 Y75.89 E.00446
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410278
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.410068
G1 X82.425 Y75.798 E.02561
; LINE_WIDTH: 0.409868
G1 X84.425 Y75.798 E.0256
; LINE_WIDTH: 0.409658
G1 X86.425 Y75.798 E.02559
; LINE_WIDTH: 0.409458
G1 X88.425 Y75.797 E.02557
; LINE_WIDTH: 0.409248
G1 X90.425 Y75.797 E.02556
; LINE_WIDTH: 0.409048
G1 X92.425 Y75.797 E.02555
; LINE_WIDTH: 0.408838
G1 X94.425 Y75.797 E.02553
; LINE_WIDTH: 0.408638
G1 X96.425 Y75.797 E.02552
; LINE_WIDTH: 0.408428
G1 X98.425 Y75.796 E.02551
; LINE_WIDTH: 0.408228
G1 X100.425 Y75.796 E.02549
; LINE_WIDTH: 0.408028
G1 X101.6 Y75.796 E.01497
; LINE_WIDTH: 0.410188
G1 X101.655 Y75.804 E.00072
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.83 E-.06806
G1 X102.173 Y76.008 E-.14609
G1 X102.397 Y76.283 E-.13467
G1 X102.501 Y76.646 E-.14352
G1 X102.501 Y77.35 E-.26766
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.041 Y78.96 Z6.68 F42000
G1 X85.153 Y81.094 Z6.68
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.400008
G1 F1752
M204 S5000
G1 X85.116 Y80.978 E.00152
; LINE_WIDTH: 0.380768
G1 X85.079 Y80.862 E.00144
; LINE_WIDTH: 0.361528
G1 X85.071 Y80.836 E.00031
; LINE_WIDTH: 0.357168
G1 X84.986 Y80.673 E.00203
; WIPE_START
G1 F12000
M204 S6000
G1 X85.071 Y80.836 E-.30637
G1 X85.079 Y80.862 E-.04621
G1 X85.116 Y80.978 E-.2037
G1 X85.153 Y81.094 E-.20372
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.644 Y81.771 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.620708
G1 F1752
M204 S5000
G1 X83.619 Y81.724 E.00105
; LINE_WIDTH: 0.581088
G1 X83.594 Y81.677 E.00098
; LINE_WIDTH: 0.541468
G1 X83.569 Y81.63 E.00091
; LINE_WIDTH: 0.501848
G1 X83.485 Y81.471 E.00284
; LINE_WIDTH: 0.501688
G1 X82.546 Y79.706 E.03159
; WIPE_START
G1 F12000
M204 S6000
G1 X83.485 Y81.471 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.984 Y82.27 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1752
M204 S5000
G1 X82.071 Y82.431 E.00203
; LINE_WIDTH: 0.361558
G1 X82.088 Y82.453 E.00031
; LINE_WIDTH: 0.380788
G1 X82.164 Y82.548 E.00144
; LINE_WIDTH: 0.400008
G1 X82.239 Y82.643 E.00152
; WIPE_START
G1 F12000
M204 S6000
G1 X82.164 Y82.548 E-.20355
G1 X82.088 Y82.453 E-.20357
G1 X82.071 Y82.431 E-.04649
G1 X81.984 Y82.27 E-.3064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.265 Y80.404 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.395908
G1 F1752
M204 S5000
G1 X80.288 Y80.407 E.00029
; LINE_WIDTH: 0.394768
G1 X80.552 Y80.561 E.00376
; LINE_WIDTH: 0.404088
G1 X80.743 Y80.902 E.00494
G1 X80.759 Y81.029 E.0016
; LINE_WIDTH: 0.385048
G1 X80.719 Y81.299 E.00328
G1 X80.559 Y81.553 E.0036
; LINE_WIDTH: 0.392888
G1 X80.273 Y81.726 E.00409
; LINE_WIDTH: 0.404268
G1 X80.021 Y81.759 E.00321
; LINE_WIDTH: 0.405868
G1 X79.787 Y81.698 E.00306
G1 X79.562 Y81.537 E.00351
; LINE_WIDTH: 0.405248
G1 X79.418 Y81.302 E.00348
G1 X79.386 Y80.964 E.00429
; LINE_WIDTH: 0.388628
G1 X79.486 Y80.694 E.00348
; LINE_WIDTH: 0.387588
G1 X79.742 Y80.459 E.0042
; LINE_WIDTH: 0.395908
G1 X80.015 Y80.372 E.00354
G1 X80.205 Y80.396 E.00236
; WIPE_START
G1 F12000
M204 S6000
G1 X80.288 Y80.407 E-.03186
G1 X80.552 Y80.561 E-.11598
G1 X80.743 Y80.902 E-.14879
G1 X80.759 Y81.029 E-.04836
G1 X80.719 Y81.299 E-.10394
G1 X80.559 Y81.553 E-.1141
G1 X80.273 Y81.726 E-.12698
G1 X80.09 Y81.75 E-.06998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.68 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.36
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 77/99
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 15
G1 X102.318 Y75.64 F42000
G1 Z6.36
G1 E.8 F1800
; LINE_WIDTH: 0.412958
G1 F1711
M204 S5000
G1 X102.577 Y75.862 E.0044
G1 X102.788 Y76.193 E.00507
; LINE_WIDTH: 0.412708
G1 X102.894 Y76.646 E.00599
; LINE_WIDTH: 0.409378
G1 X102.894 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.894 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.894 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.894 Y84.646 E.02554
; LINE_WIDTH: 0.408868
M73 P80 R3
G1 X102.894 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.894 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.894 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.894 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.894 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.894 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.894 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.894 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.894 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.894 Y103.3 E.00832
G1 X102.818 Y103.738 E.00567
; LINE_WIDTH: 0.406998
G1 X102.58 Y104.13 E.00582
; LINE_WIDTH: 0.403728
G1 X102.251 Y104.411 E.00545
; LINE_WIDTH: 0.411478
G1 X101.871 Y104.562 E.00526
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410208
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.409988
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409768
G1 X95.59 Y104.595 E.02559
; LINE_WIDTH: 0.409558
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409338
G1 X91.59 Y104.595 E.02557
; LINE_WIDTH: 0.409118
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408908
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408688
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408468
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408258
G1 X81.59 Y104.594 E.0255
; LINE_WIDTH: 0.408038
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.414088
G1 X77.963 Y104.515 E.00575
G1 X77.59 Y104.297 E.00559
; LINE_WIDTH: 0.403068
G1 X77.303 Y103.974 E.00543
; LINE_WIDTH: 0.412318
G1 X77.142 Y103.586 E.00541
G1 X77.105 Y103.289 E.00385
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.289 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.289 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.289 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.289 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.289 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.289 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.289 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.289 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.289 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.289 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.289 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.289 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.289 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00721
G1 X77.181 Y76.285 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408218
G1 X77.697 Y75.619 E.00538
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00516
G1 X78.413 Y75.405 E.00455
; LINE_WIDTH: 0.410278
G1 X80.413 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.413 Y75.405 E.02561
; LINE_WIDTH: 0.409858
G1 X84.413 Y75.405 E.0256
; LINE_WIDTH: 0.409658
G1 X86.413 Y75.405 E.02559
; LINE_WIDTH: 0.409448
G1 X88.413 Y75.405 E.02557
; LINE_WIDTH: 0.409248
G1 X90.413 Y75.405 E.02556
; LINE_WIDTH: 0.409038
G1 X92.413 Y75.405 E.02555
; LINE_WIDTH: 0.408838
G1 X94.413 Y75.405 E.02553
; LINE_WIDTH: 0.408628
G1 X96.413 Y75.405 E.02552
; LINE_WIDTH: 0.408428
G1 X98.413 Y75.405 E.02551
; LINE_WIDTH: 0.408218
G1 X100.413 Y75.405 E.02549
; LINE_WIDTH: 0.408018
G1 X101.6 Y75.405 E.01513
; LINE_WIDTH: 0.407898
G1 X101.841 Y75.436 E.0031
; LINE_WIDTH: 0.408188
G1 X102.271 Y75.602 E.00588
M204 S250
G1 X101.718 Y75.813 F42000
; LINE_WIDTH: 0.410218
G1 F1711
M204 S5000
G1 X101.833 Y75.83 E.00148
G1 X102.173 Y76.008 E.00492
; LINE_WIDTH: 0.406318
G1 X102.397 Y76.283 E.0045
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.00483
G1 X102.501 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.502 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.502 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.502 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.502 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.502 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.503 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.503 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.503 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.503 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.503 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.504 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.504 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.504 Y103.3 E.00832
G1 X102.44 Y103.625 E.00421
; LINE_WIDTH: 0.406378
G1 X102.277 Y103.891 E.00396
; LINE_WIDTH: 0.408988
G1 X101.999 Y104.108 E.00451
; LINE_WIDTH: 0.410208
G1 X101.58 Y104.202 E.00549
G1 X99.58 Y104.202 E.02562
; LINE_WIDTH: 0.409988
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409768
G1 X95.58 Y104.202 E.02559
; LINE_WIDTH: 0.409558
G1 X93.58 Y104.203 E.02558
; LINE_WIDTH: 0.409338
G1 X91.58 Y104.203 E.02557
; LINE_WIDTH: 0.409118
G1 X89.581 Y104.203 E.02555
; LINE_WIDTH: 0.408908
G1 X87.581 Y104.203 E.02554
; LINE_WIDTH: 0.408688
G1 X85.581 Y104.203 E.02552
; LINE_WIDTH: 0.408468
G1 X83.581 Y104.203 E.02551
; LINE_WIDTH: 0.408258
G1 X81.581 Y104.204 E.0255
; LINE_WIDTH: 0.408038
G1 X79.581 Y104.204 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.414088
G3 X77.835 Y103.999 I.066 J-1.063 E.00789
; LINE_WIDTH: 0.411698
G1 X77.598 Y103.705 E.00485
G1 X77.501 Y103.369 E.00449
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.279 E.02679
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.279 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.279 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y95.279 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.279 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.279 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.279 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.279 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.279 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.279 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.279 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.279 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.279 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00708
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411208
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.89 E.00404
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410278
G1 X80.425 Y75.798 E.02684
; LINE_WIDTH: 0.410068
G1 X82.425 Y75.798 E.02561
; LINE_WIDTH: 0.409858
G1 X84.425 Y75.798 E.0256
; LINE_WIDTH: 0.409658
G1 X86.425 Y75.798 E.02559
; LINE_WIDTH: 0.409448
G1 X88.425 Y75.797 E.02557
; LINE_WIDTH: 0.409248
G1 X90.425 Y75.797 E.02556
; LINE_WIDTH: 0.409038
G1 X92.425 Y75.797 E.02555
; LINE_WIDTH: 0.408838
G1 X94.425 Y75.797 E.02553
; LINE_WIDTH: 0.408628
G1 X96.425 Y75.797 E.02552
; LINE_WIDTH: 0.408428
G1 X98.425 Y75.796 E.02551
; LINE_WIDTH: 0.408218
G1 X100.425 Y75.796 E.02549
; LINE_WIDTH: 0.408018
G1 X101.6 Y75.796 E.01497
; LINE_WIDTH: 0.410218
G1 X101.659 Y75.805 E.00076
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.83 E-.06684
G1 X102.173 Y76.008 E-.14583
G1 X102.397 Y76.283 E-.13471
G1 X102.501 Y76.646 E-.14368
G1 X102.501 Y77.354 E-.26895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.966 Y78.568 Z6.76 F42000
G1 X82.968 Y80.5 Z6.76
G1 Z6.36
G1 E.8 F1800
; LINE_WIDTH: 0.500008
G1 F1711
M204 S5000
G1 X82.546 Y79.706 E.01416
; WIPE_START
G1 F12000
M204 S6000
G1 X82.968 Y80.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.283 Y80.414 Z6.76 F42000
G1 Z6.36
G1 E.8 F1800
; LINE_WIDTH: 0.417628
G1 F1711
M204 S5000
G1 X80.323 Y80.42 E.00053
; LINE_WIDTH: 0.406108
G1 X80.548 Y80.564 E.00339
; LINE_WIDTH: 0.404588
G1 X80.747 Y80.901 E.00494
; LINE_WIDTH: 0.396008
G1 X80.754 Y80.955 E.00067
; LINE_WIDTH: 0.388028
G1 X80.728 Y81.277 E.00391
; LINE_WIDTH: 0.386588
G1 X80.583 Y81.525 E.00346
G1 X80.331 Y81.705 E.00372
; LINE_WIDTH: 0.392908
G1 X80 Y81.753 E.00409
; LINE_WIDTH: 0.396588
G1 X79.689 Y81.65 E.00406
G1 X79.472 Y81.409 E.00401
; LINE_WIDTH: 0.389248
G1 X79.383 Y81.136 E.00348
; LINE_WIDTH: 0.385928
G1 X79.41 Y80.863 E.00329
G1 X79.54 Y80.623 E.00329
G1 X79.753 Y80.452 E.00329
; LINE_WIDTH: 0.416888
G1 X80.032 Y80.379 E.00375
; LINE_WIDTH: 0.418088
G1 X80.054 Y80.378 E.00028
; LINE_WIDTH: 0.417628
G1 X80.224 Y80.405 E.00225
; WIPE_START
G1 F12000
M204 S6000
G1 X80.323 Y80.42 E-.03814
G1 X80.548 Y80.564 E-.10156
G1 X80.747 Y80.901 E-.14865
G1 X80.754 Y80.955 E-.02071
G1 X80.728 Y81.277 E-.12285
G1 X80.583 Y81.525 E-.10922
G1 X80.331 Y81.705 E-.11748
G1 X80.067 Y81.743 E-.10139
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.76 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.44
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 78/99
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 15
G1 X102.32 Y75.643 F42000
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.412928
G1 F1705
M204 S5000
G1 X102.577 Y75.862 E.00436
G1 X102.788 Y76.194 E.00507
; LINE_WIDTH: 0.412778
G1 X102.894 Y76.646 E.00599
; LINE_WIDTH: 0.409378
G1 X102.894 Y80.646 E.05114
; LINE_WIDTH: 0.409248
G1 X102.894 Y84.646 E.05112
; LINE_WIDTH: 0.409128
G1 X102.895 Y88.646 E.0511
; LINE_WIDTH: 0.409008
G1 X102.895 Y92.646 E.05109
; LINE_WIDTH: 0.408888
G1 X102.895 Y96.646 E.05107
; LINE_WIDTH: 0.408768
G1 X102.895 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.896 Y103.276 E.03356
G1 X102.824 Y103.695 E.00542
; LINE_WIDTH: 0.404328
G1 X102.609 Y104.099 E.00579
; LINE_WIDTH: 0.403868
G1 X102.286 Y104.387 E.00545
; LINE_WIDTH: 0.410058
G1 X101.855 Y104.564 E.00597
; LINE_WIDTH: 0.410208
G1 X101.591 Y104.595 E.00341
G1 X99.591 Y104.595 E.02562
; LINE_WIDTH: 0.410068
G1 X97.591 Y104.595 E.02561
; LINE_WIDTH: 0.409928
G1 X95.591 Y104.595 E.0256
; LINE_WIDTH: 0.409788
G1 X93.591 Y104.595 E.02559
; LINE_WIDTH: 0.409648
G1 X91.591 Y104.595 E.02559
; LINE_WIDTH: 0.409508
G1 X89.591 Y104.595 E.02558
; LINE_WIDTH: 0.409368
G1 X87.591 Y104.595 E.02557
; LINE_WIDTH: 0.409228
G1 X85.591 Y104.595 E.02556
; LINE_WIDTH: 0.409088
M73 P81 R3
G1 X83.591 Y104.596 E.02555
; LINE_WIDTH: 0.408948
G1 X81.591 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.591 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.376 Y104.592 E.0155
; LINE_WIDTH: 0.407088
G1 X77.943 Y104.501 E.00562
; LINE_WIDTH: 0.405808
G1 X77.58 Y104.29 E.00532
; LINE_WIDTH: 0.415688
G1 X77.311 Y103.987 E.00526
G1 X77.171 Y103.68 E.00439
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.287 E.00507
G1 X77.104 Y76.724 E.3389
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410278
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.412 Y75.405 E.02561
; LINE_WIDTH: 0.409858
G1 X84.412 Y75.405 E.0256
; LINE_WIDTH: 0.409658
G1 X86.412 Y75.405 E.02559
; LINE_WIDTH: 0.409448
G1 X88.412 Y75.405 E.02557
; LINE_WIDTH: 0.409238
G1 X90.412 Y75.405 E.02556
; LINE_WIDTH: 0.409038
G1 X92.412 Y75.405 E.02555
; LINE_WIDTH: 0.408828
G1 X94.412 Y75.405 E.02553
; LINE_WIDTH: 0.408628
G1 X96.412 Y75.405 E.02552
; LINE_WIDTH: 0.408418
G1 X98.412 Y75.405 E.02551
; LINE_WIDTH: 0.408208
G1 X100.412 Y75.405 E.02549
; LINE_WIDTH: 0.408008
G1 X101.6 Y75.405 E.01513
; LINE_WIDTH: 0.407888
G1 X101.841 Y75.436 E.0031
; LINE_WIDTH: 0.408158
G1 X102.274 Y75.603 E.00591
; LINE_WIDTH: 0.412928
G1 X102.275 Y75.604 E.00001
M204 S250
G1 X101.721 Y75.814 F42000
; LINE_WIDTH: 0.410228
G1 F1705
M204 S5000
G1 X101.833 Y75.83 E.00144
G1 X102.173 Y76.008 E.00491
; LINE_WIDTH: 0.406288
G1 X102.397 Y76.282 E.0045
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.00484
G1 X102.502 Y80.646 E.05114
; LINE_WIDTH: 0.409248
G1 X102.502 Y84.646 E.05112
; LINE_WIDTH: 0.409128
G1 X102.503 Y88.646 E.0511
; LINE_WIDTH: 0.409008
G1 X102.503 Y92.646 E.05109
; LINE_WIDTH: 0.408888
G1 X102.504 Y96.646 E.05107
; LINE_WIDTH: 0.408768
G1 X102.504 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.504 Y103.276 E.03356
G1 X102.461 Y103.558 E.00365
; LINE_WIDTH: 0.407338
G1 X102.278 Y103.893 E.00485
G1 X101.998 Y104.106 E.00448
; LINE_WIDTH: 0.406138
G1 X101.668 Y104.2 E.00434
; LINE_WIDTH: 0.410208
G3 X99.581 Y104.202 I-1.092 J-44.239 E.02674
; LINE_WIDTH: 0.410068
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409928
G1 X95.581 Y104.202 E.0256
; LINE_WIDTH: 0.409788
G1 X93.581 Y104.203 E.02559
; LINE_WIDTH: 0.409648
G1 X91.581 Y104.203 E.02559
; LINE_WIDTH: 0.409508
G1 X89.581 Y104.203 E.02558
; LINE_WIDTH: 0.409368
G1 X87.581 Y104.203 E.02557
; LINE_WIDTH: 0.409228
G1 X85.581 Y104.204 E.02556
; LINE_WIDTH: 0.409088
G1 X83.581 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.581 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.581 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.204 E.01476
G1 X78.059 Y104.131 E.00476
; LINE_WIDTH: 0.407068
G1 X77.741 Y103.912 E.00491
G1 X77.541 Y103.572 E.00501
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.275 E.00383
G1 X77.496 Y76.724 E.33875
G1 X77.541 Y76.425 E.00386
; LINE_WIDTH: 0.411208
G1 X77.755 Y76.075 E.00526
M73 P81 R2
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404538
G1 X78.331 Y75.801 E.0042
; LINE_WIDTH: 0.410278
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.410068
G1 X82.424 Y75.798 E.02561
; LINE_WIDTH: 0.409858
G1 X84.424 Y75.798 E.0256
; LINE_WIDTH: 0.409658
G1 X86.424 Y75.798 E.02559
; LINE_WIDTH: 0.409448
G1 X88.424 Y75.797 E.02557
; LINE_WIDTH: 0.409238
G1 X90.424 Y75.797 E.02556
; LINE_WIDTH: 0.409038
G1 X92.424 Y75.797 E.02555
; LINE_WIDTH: 0.408828
G1 X94.424 Y75.797 E.02553
; LINE_WIDTH: 0.408618
G1 X96.424 Y75.797 E.02552
; LINE_WIDTH: 0.408418
G1 X98.424 Y75.796 E.02551
; LINE_WIDTH: 0.408208
G1 X100.424 Y75.796 E.02549
; LINE_WIDTH: 0.408008
G1 X101.6 Y75.796 E.01498
; LINE_WIDTH: 0.410228
G1 X101.662 Y75.805 E.0008
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.83 E-.06557
G1 X102.173 Y76.008 E-.14573
G1 X102.397 Y76.282 E-.13469
G1 X102.501 Y76.646 E-.14383
G1 X102.501 Y77.357 E-.27018
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.966 Y78.57 Z6.84 F42000
G1 X82.968 Y80.5 Z6.84
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.500008
G1 F1705
M204 S5000
G1 X82.546 Y79.706 E.01416
; WIPE_START
G1 F12000
M204 S6000
G1 X82.968 Y80.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.26 Y80.403 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.398988
G1 F1705
M204 S5000
G1 X80.289 Y80.407 E.00036
; LINE_WIDTH: 0.394848
G1 X80.552 Y80.561 E.00375
; LINE_WIDTH: 0.404088
G1 X80.743 Y80.902 E.00494
G1 X80.759 Y81.029 E.0016
; LINE_WIDTH: 0.385028
G1 X80.711 Y81.325 E.0036
; LINE_WIDTH: 0.392868
G1 X80.514 Y81.595 E.00409
G1 X80.261 Y81.732 E.00353
; LINE_WIDTH: 0.392388
G1 X79.986 Y81.753 E.00336
G1 X79.725 Y81.667 E.00336
; LINE_WIDTH: 0.399188
G1 X79.516 Y81.488 E.00342
G1 X79.396 Y81.24 E.00344
; LINE_WIDTH: 0.398248
G1 X79.381 Y80.969 E.00337
; LINE_WIDTH: 0.397288
G1 X79.531 Y80.635 E.00454
; LINE_WIDTH: 0.389408
G1 X79.753 Y80.452 E.00349
; LINE_WIDTH: 0.398988
G1 X80.015 Y80.37 E.00341
G1 X80.201 Y80.395 E.00233
; WIPE_START
G1 F12000
M204 S6000
G1 X80.289 Y80.407 E-.03374
G1 X80.552 Y80.561 E-.11577
G1 X80.743 Y80.902 E-.14886
G1 X80.759 Y81.029 E-.04836
G1 X80.711 Y81.325 E-.11419
G1 X80.514 Y81.595 E-.12682
G1 X80.261 Y81.732 E-.10944
G1 X80.096 Y81.745 E-.06282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.84 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.52
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 79/99
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 15
G1 X102.323 Y75.645 F42000
G1 Z6.52
G1 E.8 F1800
; LINE_WIDTH: 0.412918
G1 F1710
M204 S5000
G1 X102.577 Y75.862 E.00431
G1 X102.789 Y76.195 E.00509
G1 X102.894 Y76.646 E.00598
; LINE_WIDTH: 0.409378
G1 X102.894 Y80.646 E.05114
; LINE_WIDTH: 0.409248
G1 X102.894 Y84.646 E.05112
; LINE_WIDTH: 0.409128
G1 X102.895 Y88.646 E.0511
; LINE_WIDTH: 0.409008
G1 X102.895 Y92.646 E.05109
; LINE_WIDTH: 0.408888
G1 X102.895 Y96.646 E.05107
; LINE_WIDTH: 0.408768
G1 X102.895 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.896 Y103.275 E.03355
G1 X102.818 Y103.716 E.00571
; LINE_WIDTH: 0.406468
G1 X102.615 Y104.086 E.00536
; LINE_WIDTH: 0.407778
G1 X102.311 Y104.375 E.00533
; LINE_WIDTH: 0.414018
G1 X102.002 Y104.524 E.00444
G1 X101.585 Y104.595 E.00547
; LINE_WIDTH: 0.410218
G1 X99.585 Y104.595 E.02562
; LINE_WIDTH: 0.410068
G1 X97.585 Y104.595 E.02561
; LINE_WIDTH: 0.409928
G1 X95.585 Y104.595 E.0256
; LINE_WIDTH: 0.409788
G1 X93.585 Y104.595 E.02559
; LINE_WIDTH: 0.409648
G1 X91.585 Y104.595 E.02559
; LINE_WIDTH: 0.409508
G1 X89.585 Y104.595 E.02558
; LINE_WIDTH: 0.409368
G1 X87.585 Y104.595 E.02557
; LINE_WIDTH: 0.409228
G1 X85.585 Y104.595 E.02556
; LINE_WIDTH: 0.409088
G1 X83.585 Y104.596 E.02555
; LINE_WIDTH: 0.408948
G1 X81.585 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.585 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.596 E.01481
G1 X78.085 Y104.556 E.00436
; LINE_WIDTH: 0.407228
G1 X77.645 Y104.342 E.00623
; LINE_WIDTH: 0.406748
G1 X77.335 Y104.02 E.00568
; LINE_WIDTH: 0.413978
G1 X77.176 Y103.702 E.0046
G1 X77.105 Y103.285 E.00547
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.285 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.285 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.285 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.285 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.285 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.285 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.285 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.285 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.285 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.285 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.285 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.285 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.285 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00716
M73 P82 R2
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408208
G1 X77.697 Y75.619 E.00538
; LINE_WIDTH: 0.413578
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410278
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409858
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409648
G1 X86.415 Y75.405 E.02559
; LINE_WIDTH: 0.409448
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409238
G1 X90.415 Y75.405 E.02556
; LINE_WIDTH: 0.409028
G1 X92.415 Y75.405 E.02555
; LINE_WIDTH: 0.408828
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408618
G1 X96.415 Y75.405 E.02552
; LINE_WIDTH: 0.408408
G1 X98.415 Y75.405 E.0255
; LINE_WIDTH: 0.408198
G1 X100.415 Y75.405 E.02549
; LINE_WIDTH: 0.407998
G1 X101.6 Y75.405 E.0151
; LINE_WIDTH: 0.407878
G1 X101.841 Y75.436 E.00309
; LINE_WIDTH: 0.408128
G1 X102.274 Y75.603 E.00591
; LINE_WIDTH: 0.412918
G1 X102.277 Y75.606 E.00006
M204 S250
G1 X101.724 Y75.814 F42000
; LINE_WIDTH: 0.410278
G1 F1710
M204 S5000
G1 X101.833 Y75.83 E.0014
G1 X102.172 Y76.007 E.00491
; LINE_WIDTH: 0.406208
G1 X102.396 Y76.282 E.00449
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.00484
G1 X102.502 Y80.646 E.05114
; LINE_WIDTH: 0.409248
G1 X102.502 Y84.646 E.05112
; LINE_WIDTH: 0.409128
G1 X102.503 Y88.646 E.0511
; LINE_WIDTH: 0.409008
G1 X102.503 Y92.646 E.05109
; LINE_WIDTH: 0.408888
G1 X102.504 Y96.646 E.05107
; LINE_WIDTH: 0.408768
G1 X102.504 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.504 Y103.275 E.03355
G1 X102.462 Y103.559 E.00366
; LINE_WIDTH: 0.406468
G1 X102.277 Y103.893 E.00484
; LINE_WIDTH: 0.406168
G1 X101.998 Y104.107 E.00447
; LINE_WIDTH: 0.405608
G1 X101.668 Y104.198 E.00432
; LINE_WIDTH: 0.410218
G1 X99.571 Y104.202 E.02687
; LINE_WIDTH: 0.410068
G1 X97.571 Y104.202 E.02561
; LINE_WIDTH: 0.409928
G1 X95.571 Y104.202 E.0256
; LINE_WIDTH: 0.409788
G1 X93.571 Y104.203 E.02559
; LINE_WIDTH: 0.409648
G1 X91.571 Y104.203 E.02559
; LINE_WIDTH: 0.409508
G1 X89.571 Y104.203 E.02558
; LINE_WIDTH: 0.409368
G1 X87.571 Y104.203 E.02557
; LINE_WIDTH: 0.409228
G1 X85.571 Y104.204 E.02556
; LINE_WIDTH: 0.409088
G1 X83.571 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.571 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.571 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.204 E.01463
G1 X78.153 Y104.166 E.0035
; LINE_WIDTH: 0.410928
G1 X77.817 Y103.985 E.0049
G1 X77.593 Y103.698 E.00467
; LINE_WIDTH: 0.405628
G1 X77.502 Y103.37 E.00432
; LINE_WIDTH: 0.410298
G1 X77.498 Y101.271 E.02689
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.271 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.271 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.271 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.271 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.271 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.271 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.271 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.271 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.271 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.271 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.271 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.271 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00697
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411198
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405388
G1 X78.33 Y75.802 E.00421
; LINE_WIDTH: 0.410278
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.410068
G1 X82.429 Y75.798 E.02561
; LINE_WIDTH: 0.409858
G1 X84.429 Y75.798 E.0256
; LINE_WIDTH: 0.409648
G1 X86.429 Y75.798 E.02559
; LINE_WIDTH: 0.409448
G1 X88.429 Y75.797 E.02557
; LINE_WIDTH: 0.409238
G1 X90.429 Y75.797 E.02556
; LINE_WIDTH: 0.409028
G1 X92.429 Y75.797 E.02555
; LINE_WIDTH: 0.408818
G1 X94.429 Y75.797 E.02553
; LINE_WIDTH: 0.408618
G1 X96.429 Y75.797 E.02552
; LINE_WIDTH: 0.408408
G1 X98.429 Y75.796 E.0255
; LINE_WIDTH: 0.408198
G1 X100.429 Y75.796 E.02549
; LINE_WIDTH: 0.407998
G1 X101.6 Y75.796 E.01492
; LINE_WIDTH: 0.410278
G1 X101.665 Y75.806 E.00084
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.83 E-.06433
G1 X102.172 Y76.007 E-.14559
G1 X102.396 Y76.282 E-.13469
G1 X102.501 Y76.646 E-.14396
G1 X102.501 Y77.36 E-.27142
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.966 Y78.572 Z6.92 F42000
G1 X82.968 Y80.5 Z6.92
G1 Z6.52
G1 E.8 F1800
; LINE_WIDTH: 0.500008
G1 F1710
M204 S5000
G1 X82.546 Y79.706 E.01416
; WIPE_START
G1 F12000
M204 S6000
G1 X82.968 Y80.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.267 Y80.404 Z6.92 F42000
G1 Z6.52
G1 E.8 F1800
; LINE_WIDTH: 0.398968
G1 F1710
M204 S5000
G1 X80.288 Y80.407 E.00026
; LINE_WIDTH: 0.394808
G1 X80.552 Y80.561 E.00375
; LINE_WIDTH: 0.404088
G1 X80.743 Y80.902 E.00494
G1 X80.759 Y81.029 E.0016
; LINE_WIDTH: 0.385028
G1 X80.712 Y81.322 E.00356
; LINE_WIDTH: 0.392928
G1 X80.514 Y81.595 E.00413
G1 X80.26 Y81.732 E.00353
; LINE_WIDTH: 0.392408
G1 X79.986 Y81.753 E.00336
G1 X79.725 Y81.667 E.00336
G1 X79.519 Y81.486 E.00336
; LINE_WIDTH: 0.399208
G1 X79.395 Y81.24 E.00342
G1 X79.381 Y80.964 E.00344
; LINE_WIDTH: 0.398248
G1 X79.474 Y80.704 E.00343
G1 X79.741 Y80.459 E.00451
; LINE_WIDTH: 0.398968
G1 X80.015 Y80.37 E.00358
G1 X80.208 Y80.396 E.00242
; WIPE_START
G1 F12000
M204 S6000
G1 X80.288 Y80.407 E-.03085
G1 X80.552 Y80.561 E-.11592
G1 X80.743 Y80.902 E-.14875
G1 X80.759 Y81.029 E-.04835
G1 X80.712 Y81.322 E-.11278
G1 X80.514 Y81.595 E-.12808
G1 X80.26 Y81.732 E-.10967
G1 X80.088 Y81.745 E-.06559
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.92 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 80/99
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 15
G1 X102.326 Y75.647 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.412368
G1 F1706
M204 S5000
G1 X102.577 Y75.861 E.00426
; LINE_WIDTH: 0.413488
G1 X102.789 Y76.196 E.00511
G1 X102.894 Y76.646 E.00598
; LINE_WIDTH: 0.409378
G1 X102.894 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.894 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.894 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.894 Y84.646 E.02554
; LINE_WIDTH: 0.408858
G1 X102.894 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.894 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.894 Y90.646 E.02552
; LINE_WIDTH: 0.408478
G1 X102.894 Y92.646 E.02551
; LINE_WIDTH: 0.408348
G1 X102.894 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.894 Y96.646 E.02549
; LINE_WIDTH: 0.408098
G1 X102.894 Y98.646 E.02548
; LINE_WIDTH: 0.407968
G1 X102.894 Y100.646 E.02548
; LINE_WIDTH: 0.407838
G1 X102.894 Y102.646 E.02547
; LINE_WIDTH: 0.407718
G1 X102.894 Y103.3 E.00833
; LINE_WIDTH: 0.411498
G1 X102.816 Y103.738 E.00571
G1 X102.579 Y104.131 E.0059
; LINE_WIDTH: 0.403738
G1 X102.25 Y104.412 E.00545
; LINE_WIDTH: 0.411458
G1 X101.871 Y104.562 E.00524
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410228
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410008
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409788
G1 X95.59 Y104.595 E.02559
; LINE_WIDTH: 0.409568
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409348
G1 X91.59 Y104.595 E.02557
; LINE_WIDTH: 0.409128
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408918
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408698
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408478
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408258
G1 X81.59 Y104.594 E.0255
; LINE_WIDTH: 0.408038
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.407698
G1 X78.123 Y104.553 E.00357
; LINE_WIDTH: 0.411648
G1 X77.708 Y104.388 E.00574
; LINE_WIDTH: 0.415288
G1 X77.421 Y104.135 E.00497
G1 X77.206 Y103.786 E.00532
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00646
G1 X77.104 Y77.29 E.33172
G3 X77.141 Y76.413 I3.733 J-.283 E.01122
; LINE_WIDTH: 0.412718
G1 X77.274 Y76.075 E.00469
G1 X77.457 Y75.83 E.00394
; LINE_WIDTH: 0.403808
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.411298
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410278
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409858
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409648
G1 X86.41 Y75.405 E.02559
; LINE_WIDTH: 0.409438
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409238
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.409028
G1 X92.41 Y75.405 E.02555
; LINE_WIDTH: 0.408818
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408608
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408398
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408198
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.407988
G1 X101.6 Y75.405 E.01516
; LINE_WIDTH: 0.407868
G1 X101.841 Y75.436 E.00309
; LINE_WIDTH: 0.408088
G1 X102.273 Y75.603 E.00591
; LINE_WIDTH: 0.412368
G1 X102.28 Y75.608 E.00012
M204 S250
G1 X101.728 Y75.815 F42000
; LINE_WIDTH: 0.410308
G1 F1706
M204 S5000
G1 X101.833 Y75.83 E.00136
G1 X102.171 Y76.006 E.00489
; LINE_WIDTH: 0.405838
G1 X102.392 Y76.274 E.0044
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.00495
G1 X102.501 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.502 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.502 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.502 Y84.646 E.02554
; LINE_WIDTH: 0.408858
G1 X102.502 Y86.646 E.02553
; LINE_WIDTH: 0.408738
M73 P83 R2
G1 X102.502 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.503 Y90.646 E.02552
; LINE_WIDTH: 0.408478
G1 X102.503 Y92.646 E.02551
; LINE_WIDTH: 0.408348
G1 X102.503 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.503 Y96.646 E.02549
; LINE_WIDTH: 0.408098
G1 X102.503 Y98.646 E.02548
; LINE_WIDTH: 0.407968
G1 X102.504 Y100.646 E.02548
; LINE_WIDTH: 0.407838
G1 X102.504 Y102.646 E.02547
; LINE_WIDTH: 0.407718
G1 X102.504 Y103.3 E.00833
; LINE_WIDTH: 0.411498
G1 X102.451 Y103.585 E.00373
G1 X102.276 Y103.892 E.00454
; LINE_WIDTH: 0.408888
G1 X101.998 Y104.109 E.00451
; LINE_WIDTH: 0.410228
G1 X101.58 Y104.202 E.00548
G1 X99.58 Y104.202 E.02562
; LINE_WIDTH: 0.410008
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409788
G1 X95.58 Y104.202 E.02559
; LINE_WIDTH: 0.409568
G1 X93.58 Y104.203 E.02558
; LINE_WIDTH: 0.409348
G1 X91.58 Y104.203 E.02557
; LINE_WIDTH: 0.409128
G1 X89.581 Y104.203 E.02555
; LINE_WIDTH: 0.408918
G1 X87.581 Y104.203 E.02554
; LINE_WIDTH: 0.408698
G1 X85.581 Y104.203 E.02552
; LINE_WIDTH: 0.408478
G1 X83.581 Y104.203 E.02551
; LINE_WIDTH: 0.408258
G1 X81.581 Y104.204 E.0255
; LINE_WIDTH: 0.408038
G1 X79.581 Y104.204 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.412388
G1 X78.115 Y104.15 E.00374
G1 X77.798 Y103.967 E.00472
; LINE_WIDTH: 0.406558
G1 X77.569 Y103.646 E.005
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.28 E.00476
G1 X77.496 Y79.28 E.3062
G3 X77.496 Y76.7 I519.832 J-1.139 E.03292
; LINE_WIDTH: 0.407098
G1 X77.552 Y76.403 E.00384
; LINE_WIDTH: 0.403808
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.408258
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.410068
G1 X82.42 Y75.798 E.02561
; LINE_WIDTH: 0.409858
G1 X84.42 Y75.798 E.0256
; LINE_WIDTH: 0.409648
G1 X86.42 Y75.798 E.02559
; LINE_WIDTH: 0.409438
G1 X88.42 Y75.797 E.02557
; LINE_WIDTH: 0.409238
G1 X90.42 Y75.797 E.02556
; LINE_WIDTH: 0.409028
G1 X92.42 Y75.797 E.02555
; LINE_WIDTH: 0.408818
G1 X94.42 Y75.797 E.02553
; LINE_WIDTH: 0.408608
G1 X96.42 Y75.797 E.02552
; LINE_WIDTH: 0.408398
G1 X98.42 Y75.796 E.0255
; LINE_WIDTH: 0.408198
G1 X100.42 Y75.796 E.02549
; LINE_WIDTH: 0.407988
G1 X101.6 Y75.796 E.01504
; LINE_WIDTH: 0.410308
G1 X101.668 Y75.806 E.00088
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.83 E-.06311
G1 X102.171 Y76.006 E-.14494
G1 X102.392 Y76.274 E-.132
G1 X102.501 Y76.646 E-.14725
G1 X102.501 Y77.364 E-.2727
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.965 Y78.574 Z7 F42000
G1 X82.968 Y80.5 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.500008
G1 F1706
M204 S5000
G1 X82.546 Y79.706 E.01416
; WIPE_START
G1 F12000
M204 S6000
G1 X82.968 Y80.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.234 Y80.395 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.396268
G1 F1706
M204 S5000
G1 X80.538 Y80.553 E.00423
; LINE_WIDTH: 0.404068
G1 X80.743 Y80.902 E.00511
G1 X80.759 Y81.029 E.00161
; LINE_WIDTH: 0.385048
G1 X80.719 Y81.299 E.00328
G1 X80.577 Y81.532 E.00327
G1 X80.331 Y81.705 E.00361
; LINE_WIDTH: 0.392888
G1 X80.001 Y81.753 E.00409
; LINE_WIDTH: 0.399128
G1 X79.725 Y81.67 E.00359
; LINE_WIDTH: 0.413068
G1 X79.52 Y81.481 E.00359
G1 X79.398 Y81.236 E.00354
; LINE_WIDTH: 0.406108
G1 X79.385 Y80.962 E.00348
G1 X79.479 Y80.704 E.00348
G1 X79.665 Y80.502 E.00348
; LINE_WIDTH: 0.417608
G1 X79.916 Y80.396 E.00356
; LINE_WIDTH: 0.418088
G1 X79.938 Y80.391 E.00029
; LINE_WIDTH: 0.416958
G1 X80.174 Y80.394 E.00308
; WIPE_START
G1 F12000
M204 S6000
G1 X80.538 Y80.553 E-.15086
G1 X80.743 Y80.902 E-.15387
G1 X80.759 Y81.029 E-.04837
G1 X80.719 Y81.299 E-.10389
G1 X80.577 Y81.532 E-.10373
G1 X80.331 Y81.705 E-.11429
G1 X80.11 Y81.737 E-.08499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.68
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 81/99
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 15
G1 X102.328 Y75.646 F42000
G1 Z6.68
G1 E.8 F1800
; LINE_WIDTH: 0.414848
G1 F1685
M204 S5000
G1 X102.536 Y75.818 E.00349
; LINE_WIDTH: 0.407588
G1 X102.778 Y76.172 E.00546
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00624
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407738
G1 X102.895 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.895 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.895 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.895 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.895 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.896 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.896 Y102.7 E.02551
G3 X102.867 Y103.535 I-3.772 J.288 E.01068
; LINE_WIDTH: 0.415188
G1 X102.749 Y103.881 E.00474
G1 X102.573 Y104.14 E.00406
; LINE_WIDTH: 0.403918
G1 X102.285 Y104.388 E.00479
; LINE_WIDTH: 0.411458
G1 X101.883 Y104.558 E.00562
G1 X101.589 Y104.595 E.0038
; LINE_WIDTH: 0.410218
G1 X99.589 Y104.595 E.02562
; LINE_WIDTH: 0.410068
G1 X97.589 Y104.595 E.02561
; LINE_WIDTH: 0.409928
G1 X95.589 Y104.595 E.0256
; LINE_WIDTH: 0.409788
G1 X93.589 Y104.595 E.02559
; LINE_WIDTH: 0.409648
G1 X91.589 Y104.595 E.02559
; LINE_WIDTH: 0.409508
G1 X89.589 Y104.595 E.02558
; LINE_WIDTH: 0.409368
G1 X87.589 Y104.595 E.02557
; LINE_WIDTH: 0.409228
G1 X85.589 Y104.595 E.02556
; LINE_WIDTH: 0.409088
G1 X83.589 Y104.596 E.02555
; LINE_WIDTH: 0.408948
G1 X81.589 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.589 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.596 E.01486
; LINE_WIDTH: 0.410268
G1 X78.115 Y104.558 E.004
; LINE_WIDTH: 0.415728
G1 X77.759 Y104.416 E.00497
G1 X77.441 Y104.162 E.00529
; LINE_WIDTH: 0.405818
G1 X77.204 Y103.776 E.00573
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.285 E.0064
G1 X77.104 Y76.729 E.33881
G1 X77.197 Y76.246 E.00627
; LINE_WIDTH: 0.404338
G1 X77.424 Y75.865 E.0056
; LINE_WIDTH: 0.404878
G1 X77.715 Y75.612 E.00488
; LINE_WIDTH: 0.411758
G1 X78.117 Y75.441 E.00561
G1 X78.41 Y75.405 E.0038
; LINE_WIDTH: 0.410278
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409858
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409648
G1 X86.41 Y75.405 E.02559
; LINE_WIDTH: 0.409438
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409228
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.409018
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408808
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408608
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408398
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408188
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.407978
G1 X101.6 Y75.405 E.01515
G1 X101.937 Y75.455 E.00434
; LINE_WIDTH: 0.414848
G1 X102.281 Y75.61 E.00489
M204 S250
G1 X101.74 Y75.826 F42000
; LINE_WIDTH: 0.407858
G1 F1685
M204 S5000
G1 X101.941 Y75.869 E.00262
; LINE_WIDTH: 0.405618
G1 X102.26 Y76.087 E.00488
; LINE_WIDTH: 0.407658
G1 X102.431 Y76.354 E.00404
G1 X102.504 Y76.7 E.0045
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407808
G1 X102.504 Y82.7 E.05093
; LINE_WIDTH: 0.407948
G1 X102.504 Y86.7 E.05095
; LINE_WIDTH: 0.408078
G1 X102.504 Y90.7 E.05097
; LINE_WIDTH: 0.408218
G1 X102.504 Y94.7 E.05098
; LINE_WIDTH: 0.408348
G1 X102.504 Y98.7 E.051
; LINE_WIDTH: 0.408488
G1 X102.504 Y103.275 E.05836
G1 X102.464 Y103.551 E.00356
; LINE_WIDTH: 0.406888
G1 X102.277 Y103.893 E.00495
; LINE_WIDTH: 0.406218
G1 X101.997 Y104.107 E.00447
; LINE_WIDTH: 0.405598
G1 X101.669 Y104.199 E.00432
; LINE_WIDTH: 0.410218
G1 X99.579 Y104.202 E.02677
; LINE_WIDTH: 0.410068
G1 X97.579 Y104.202 E.02561
; LINE_WIDTH: 0.409928
G1 X95.579 Y104.202 E.0256
; LINE_WIDTH: 0.409788
G1 X93.579 Y104.203 E.02559
; LINE_WIDTH: 0.409648
G1 X91.579 Y104.203 E.02559
; LINE_WIDTH: 0.409508
G1 X89.579 Y104.203 E.02558
; LINE_WIDTH: 0.409368
G1 X87.579 Y104.203 E.02557
; LINE_WIDTH: 0.409228
G1 X85.579 Y104.204 E.02556
; LINE_WIDTH: 0.409088
G1 X83.579 Y104.204 E.02555
; LINE_WIDTH: 0.408948
M73 P84 R2
G1 X81.579 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.579 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.204 E.01473
G1 X78.065 Y104.133 E.00467
; LINE_WIDTH: 0.406828
G1 X77.734 Y103.905 E.0051
; LINE_WIDTH: 0.407348
G1 X77.541 Y103.572 E.0049
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.271 E.00389
G1 X77.496 Y79.271 E.3062
G3 X77.497 Y76.7 I360.158 J-1.135 E.0328
; LINE_WIDTH: 0.406448
G1 X77.551 Y76.403 E.00383
; LINE_WIDTH: 0.404578
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.408388
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.421 Y75.798 E.0054
G1 X80.421 Y75.798 E.02563
; LINE_WIDTH: 0.410068
G1 X82.421 Y75.798 E.02561
; LINE_WIDTH: 0.409858
G1 X84.421 Y75.798 E.0256
; LINE_WIDTH: 0.409648
G1 X86.421 Y75.798 E.02559
; LINE_WIDTH: 0.409438
G1 X88.421 Y75.797 E.02557
; LINE_WIDTH: 0.409228
G1 X90.421 Y75.797 E.02556
; LINE_WIDTH: 0.409018
G1 X92.421 Y75.797 E.02554
; LINE_WIDTH: 0.408808
G1 X94.421 Y75.797 E.02553
; LINE_WIDTH: 0.408598
G1 X96.421 Y75.797 E.02552
; LINE_WIDTH: 0.408398
G1 X98.421 Y75.796 E.0255
; LINE_WIDTH: 0.408188
G1 X100.421 Y75.796 E.02549
; LINE_WIDTH: 0.407978
G1 X101.6 Y75.796 E.01502
; LINE_WIDTH: 0.407858
G1 X101.681 Y75.814 E.00106
; WIPE_START
G1 F12000
M204 S6000
G1 X101.941 Y75.869 E-.10101
G1 X102.26 Y76.087 E-.14649
G1 X102.431 Y76.354 E-.1206
G1 X102.504 Y76.7 E-.13432
G1 X102.504 Y77.378 E-.25758
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.942 Y78.415 Z7.08 F42000
G1 X80.323 Y80.42 Z7.08
G1 Z6.68
G1 E.8 F1800
; LINE_WIDTH: 0.406108
G1 F1685
M204 S5000
G1 X80.548 Y80.564 E.00339
; LINE_WIDTH: 0.404628
G1 X80.747 Y80.901 E.00494
; LINE_WIDTH: 0.398288
G1 X80.759 Y81.166 E.00329
G1 X80.648 Y81.45 E.00379
; LINE_WIDTH: 0.394648
G1 X80.395 Y81.673 E.00415
; LINE_WIDTH: 0.387988
G1 X80.124 Y81.753 E.00342
; LINE_WIDTH: 0.386848
G1 X79.797 Y81.698 E.00399
; LINE_WIDTH: 0.399228
G1 X79.523 Y81.495 E.00424
G1 X79.396 Y81.24 E.00355
; LINE_WIDTH: 0.398268
G1 X79.381 Y80.964 E.00343
G1 X79.474 Y80.705 E.00343
G1 X79.658 Y80.504 E.00338
; LINE_WIDTH: 0.401068
G1 X80 Y80.373 E.00458
; LINE_WIDTH: 0.406108
G1 X80.264 Y80.411 E.00338
; WIPE_START
G1 F12000
M204 S6000
G1 X80.548 Y80.564 E-.12261
G1 X80.747 Y80.901 E-.14875
G1 X80.759 Y81.166 E-.10067
G1 X80.648 Y81.45 E-.11589
G1 X80.395 Y81.673 E-.12824
G1 X80.124 Y81.753 E-.10742
G1 X80.029 Y81.737 E-.03641
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.08 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.76
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 82/99
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 15
G1 X102.337 Y75.657 F42000
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.414618
G1 F1685
M204 S5000
G1 X102.576 Y75.862 E.00408
G1 X102.791 Y76.196 E.00514
; LINE_WIDTH: 0.410488
G1 X102.894 Y76.646 E.00592
; LINE_WIDTH: 0.409378
G1 X102.894 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.894 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.894 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.894 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.894 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.894 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.894 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.894 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.894 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.894 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.894 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.894 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.894 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.894 Y103.3 E.00832
G1 X102.818 Y103.739 E.00567
; LINE_WIDTH: 0.406978
G1 X102.579 Y104.131 E.00584
; LINE_WIDTH: 0.403768
G1 X102.25 Y104.412 E.00545
; LINE_WIDTH: 0.410698
G1 X101.858 Y104.564 E.00539
G1 X101.59 Y104.595 E.00346
; LINE_WIDTH: 0.410228
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410008
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409788
G1 X95.59 Y104.595 E.02559
; LINE_WIDTH: 0.409568
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409348
G1 X91.59 Y104.595 E.02557
; LINE_WIDTH: 0.409128
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408918
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408698
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408478
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408258
G1 X81.59 Y104.594 E.0255
; LINE_WIDTH: 0.408038
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.407698
G1 X78.1 Y104.548 E.00386
; LINE_WIDTH: 0.414098
G1 X77.709 Y104.387 E.00547
G1 X77.42 Y104.136 E.00495
; LINE_WIDTH: 0.413038
G1 X77.206 Y103.786 E.00529
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00646
G1 X77.104 Y76.724 E.33893
G1 X77.181 Y76.285 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.907 E.00545
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.618 E.00538
; LINE_WIDTH: 0.413408
G1 X77.986 Y75.48 E.00413
G1 X78.416 Y75.405 E.00563
; LINE_WIDTH: 0.410278
G1 X80.416 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.416 Y75.405 E.02561
; LINE_WIDTH: 0.409858
G1 X84.416 Y75.405 E.0256
; LINE_WIDTH: 0.409648
G1 X86.416 Y75.405 E.02559
; LINE_WIDTH: 0.409438
G1 X88.416 Y75.405 E.02557
; LINE_WIDTH: 0.409228
G1 X90.416 Y75.405 E.02556
; LINE_WIDTH: 0.409018
G1 X92.416 Y75.405 E.02554
; LINE_WIDTH: 0.408808
G1 X94.416 Y75.405 E.02553
; LINE_WIDTH: 0.408598
G1 X96.416 Y75.405 E.02552
; LINE_WIDTH: 0.408388
G1 X98.416 Y75.405 E.0255
; LINE_WIDTH: 0.408178
G1 X100.416 Y75.405 E.02549
; LINE_WIDTH: 0.407968
G1 X101.6 Y75.405 E.01509
; LINE_WIDTH: 0.407848
G1 X101.84 Y75.436 E.00309
; LINE_WIDTH: 0.408028
G1 X102.272 Y75.602 E.00589
; LINE_WIDTH: 0.414618
G1 X102.291 Y75.618 E.00032
M204 S250
G1 X101.734 Y75.816 F42000
; LINE_WIDTH: 0.410378
G1 F1685
M204 S5000
G1 X101.833 Y75.831 E.00128
G1 X102.174 Y76.009 E.00493
; LINE_WIDTH: 0.410488
G1 X102.42 Y76.332 E.00521
G1 X102.501 Y76.646 E.00415
; LINE_WIDTH: 0.409378
G1 X102.501 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.502 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.502 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.502 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.502 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.502 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.503 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.503 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.503 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.503 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.503 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.504 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.504 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.504 Y103.3 E.00832
G1 X102.439 Y103.627 E.00424
; LINE_WIDTH: 0.406288
G1 X102.275 Y103.892 E.00396
; LINE_WIDTH: 0.408648
G1 X101.997 Y104.109 E.0045
; LINE_WIDTH: 0.410228
G1 X101.581 Y104.202 E.00546
G1 X99.581 Y104.202 E.02562
; LINE_WIDTH: 0.410008
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409788
G1 X95.581 Y104.202 E.02559
; LINE_WIDTH: 0.409568
G1 X93.581 Y104.203 E.02558
; LINE_WIDTH: 0.409348
G1 X91.581 Y104.203 E.02557
; LINE_WIDTH: 0.409128
G1 X89.581 Y104.203 E.02555
; LINE_WIDTH: 0.408918
G1 X87.581 Y104.203 E.02554
; LINE_WIDTH: 0.408698
G1 X85.581 Y104.203 E.02552
; LINE_WIDTH: 0.408478
G1 X83.581 Y104.203 E.02551
; LINE_WIDTH: 0.408258
G1 X81.581 Y104.204 E.0255
; LINE_WIDTH: 0.408038
G1 X79.581 Y104.204 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.204 E.01504
; LINE_WIDTH: 0.408408
G1 X78.098 Y104.148 E.00392
G1 X77.769 Y103.94 E.00496
; LINE_WIDTH: 0.406568
G1 X77.57 Y103.646 E.00451
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.28 E.00476
G1 X77.496 Y76.724 E.33881
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413588
G1 X77.61 Y76.283 E.00172
M73 P85 R2
G1 X77.755 Y76.075 E.00327
; LINE_WIDTH: 0.411188
G1 X78.01 Y75.889 E.00406
; LINE_WIDTH: 0.405728
G1 X78.33 Y75.802 E.00421
; LINE_WIDTH: 0.410278
G1 X80.431 Y75.798 E.02691
; LINE_WIDTH: 0.410068
G1 X82.431 Y75.798 E.02561
; LINE_WIDTH: 0.409858
G1 X84.431 Y75.798 E.0256
; LINE_WIDTH: 0.409648
G1 X86.431 Y75.798 E.02559
; LINE_WIDTH: 0.409438
G1 X88.431 Y75.797 E.02557
; LINE_WIDTH: 0.409228
G1 X90.431 Y75.797 E.02556
; LINE_WIDTH: 0.409018
G1 X92.431 Y75.797 E.02554
; LINE_WIDTH: 0.408808
G1 X94.431 Y75.797 E.02553
; LINE_WIDTH: 0.408598
G1 X96.431 Y75.797 E.02552
; LINE_WIDTH: 0.408388
G1 X98.431 Y75.796 E.0255
; LINE_WIDTH: 0.408178
G1 X100.431 Y75.796 E.02549
; LINE_WIDTH: 0.407968
G1 X101.6 Y75.796 E.0149
; LINE_WIDTH: 0.410378
G1 X101.674 Y75.807 E.00096
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.831 E-.06087
G1 X102.174 Y76.009 E-.14628
G1 X102.42 Y76.332 E-.15446
G1 X102.501 Y76.646 E-.12311
G1 X102.501 Y77.37 E-.27527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.939 Y78.399 Z7.16 F42000
G1 X80.229 Y80.401 Z7.16
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.392868
G1 F1685
M204 S5000
G1 X80.289 Y80.407 E.00073
; LINE_WIDTH: 0.392408
G1 X80.527 Y80.543 E.00336
; LINE_WIDTH: 0.396888
G1 X80.659 Y80.713 E.00266
; LINE_WIDTH: 0.398168
G3 X80.711 Y80.819 I-.097 J.114 E.00152
; LINE_WIDTH: 0.398528
G1 X80.766 Y81.03 E.00271
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398288
G1 X80.582 Y81.537 E.00343
G1 X80.359 Y81.698 E.00342
G1 X80 Y81.751 E.00451
; LINE_WIDTH: 0.389408
G1 X79.726 Y81.666 E.00348
G1 X79.521 Y81.483 E.00333
; LINE_WIDTH: 0.384968
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.48 Y80.707 E.00328
G1 X79.687 Y80.489 E.0036
; LINE_WIDTH: 0.392868
G1 X80.002 Y80.377 E.00409
G1 X80.169 Y80.394 E.00206
; WIPE_START
G1 F12000
M204 S6000
G1 X80.289 Y80.407 E-.04551
G1 X80.527 Y80.543 E-.10432
G1 X80.659 Y80.713 E-.08162
G1 X80.696 Y80.76 E-.02289
G1 X80.711 Y80.819 E-.0232
G1 X80.766 Y81.03 E-.08276
G1 X80.725 Y81.3 E-.10396
G1 X80.582 Y81.537 E-.10488
G1 X80.359 Y81.698 E-.10471
G1 X80.135 Y81.731 E-.08615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.16 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.84
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 83/99
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 15
G1 X102.34 Y75.66 F42000
G1 Z6.84
G1 E.8 F1800
; LINE_WIDTH: 0.412848
G1 F1690
M204 S5000
G1 X102.577 Y75.861 E.00402
; LINE_WIDTH: 0.413108
G1 X102.79 Y76.198 E.00513
G1 X102.894 Y76.646 E.00594
; LINE_WIDTH: 0.409378
G1 X102.894 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.894 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.894 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.894 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.894 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.894 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.894 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.894 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.894 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.894 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.894 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.894 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.894 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.894 Y103.3 E.00832
; LINE_WIDTH: 0.412168
G1 X102.816 Y103.738 E.00572
G1 X102.592 Y104.122 E.00573
; LINE_WIDTH: 0.403498
G1 X102.262 Y104.4 E.00544
; LINE_WIDTH: 0.411438
G1 X101.871 Y104.562 E.00544
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410218
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.409998
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409778
G1 X95.59 Y104.595 E.02559
; LINE_WIDTH: 0.409558
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409348
G1 X91.59 Y104.595 E.02557
; LINE_WIDTH: 0.409128
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408908
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408688
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408478
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408258
G1 X81.59 Y104.594 E.0255
; LINE_WIDTH: 0.408038
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.410988
G1 X77.989 Y104.522 E.00536
; LINE_WIDTH: 0.412008
G1 X77.703 Y104.385 E.00407
G1 X77.436 Y104.158 E.00452
; LINE_WIDTH: 0.407728
G1 X77.183 Y103.722 E.00641
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.289 E.00562
G1 X77.105 Y99.289 E.05103
; LINE_WIDTH: 0.408448
G1 X77.105 Y95.289 E.05101
; LINE_WIDTH: 0.408308
G1 X77.105 Y91.289 E.051
; LINE_WIDTH: 0.408178
G1 X77.105 Y87.289 E.05098
; LINE_WIDTH: 0.408038
G1 X77.105 Y83.289 E.05096
; LINE_WIDTH: 0.407908
G1 X77.106 Y79.289 E.05094
; LINE_WIDTH: 0.407768
G1 X77.106 Y76.7 E.03297
G1 X77.155 Y76.382 E.0041
; LINE_WIDTH: 0.407288
G1 X77.336 Y75.975 E.00566
; LINE_WIDTH: 0.412568
G1 X77.61 Y75.683 E.00515
; LINE_WIDTH: 0.413058
G1 X77.944 Y75.496 E.00494
G1 X78.405 Y75.405 E.00607
; LINE_WIDTH: 0.410278
G1 X80.405 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.405 Y75.405 E.02561
; LINE_WIDTH: 0.409848
G1 X84.405 Y75.405 E.0256
; LINE_WIDTH: 0.409638
G1 X86.405 Y75.405 E.02559
; LINE_WIDTH: 0.409428
G1 X88.405 Y75.405 E.02557
; LINE_WIDTH: 0.409218
G1 X90.405 Y75.405 E.02556
; LINE_WIDTH: 0.409008
G1 X92.405 Y75.405 E.02554
; LINE_WIDTH: 0.408798
G1 X94.405 Y75.405 E.02553
; LINE_WIDTH: 0.408588
G1 X96.405 Y75.405 E.02552
; LINE_WIDTH: 0.408378
G1 X98.405 Y75.405 E.0255
; LINE_WIDTH: 0.408168
G1 X100.405 Y75.405 E.02549
; LINE_WIDTH: 0.407958
G1 X101.6 Y75.405 E.01522
; LINE_WIDTH: 0.407838
G1 X101.84 Y75.436 E.00308
; LINE_WIDTH: 0.407978
G1 X102.272 Y75.602 E.00589
; LINE_WIDTH: 0.412848
G1 X102.294 Y75.621 E.00038
M204 S250
G1 X101.737 Y75.816 F42000
; LINE_WIDTH: 0.410428
G1 F1690
M204 S5000
G1 X101.833 Y75.831 E.00124
G1 X102.171 Y76.006 E.00489
; LINE_WIDTH: 0.405998
G1 X102.396 Y76.281 E.00449
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.00486
G1 X102.501 Y78.646 E.02557
; LINE_WIDTH: 0.409248
G1 X102.502 Y80.646 E.02556
; LINE_WIDTH: 0.409118
G1 X102.502 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.502 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.502 Y86.646 E.02553
; LINE_WIDTH: 0.408738
G1 X102.502 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.503 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.503 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.503 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.503 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.503 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.504 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.504 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.504 Y103.3 E.00832
; LINE_WIDTH: 0.412168
G1 X102.45 Y103.585 E.00374
G1 X102.276 Y103.894 E.00456
; LINE_WIDTH: 0.408778
G1 X101.997 Y104.109 E.0045
; LINE_WIDTH: 0.410218
G1 X101.581 Y104.202 E.00546
G1 X99.581 Y104.202 E.02562
; LINE_WIDTH: 0.409998
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409778
G1 X95.581 Y104.202 E.02559
; LINE_WIDTH: 0.409558
G1 X93.581 Y104.203 E.02558
; LINE_WIDTH: 0.409348
G1 X91.581 Y104.203 E.02557
; LINE_WIDTH: 0.409128
G1 X89.581 Y104.203 E.02555
; LINE_WIDTH: 0.408908
G1 X87.581 Y104.203 E.02554
; LINE_WIDTH: 0.408688
G1 X85.581 Y104.203 E.02552
; LINE_WIDTH: 0.408478
G1 X83.581 Y104.203 E.02551
; LINE_WIDTH: 0.408258
G1 X81.581 Y104.204 E.0255
; LINE_WIDTH: 0.408038
G1 X79.581 Y104.204 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.407698
G1 X77.986 Y104.1 E.00543
; LINE_WIDTH: 0.407188
G1 X77.739 Y103.911 E.00395
G1 X77.541 Y103.572 E.00499
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.279 E.00378
G1 X77.496 Y99.279 E.05103
; LINE_WIDTH: 0.408448
G1 X77.496 Y95.279 E.05101
; LINE_WIDTH: 0.408308
G1 X77.496 Y91.279 E.051
; LINE_WIDTH: 0.408178
G1 X77.496 Y87.279 E.05098
; LINE_WIDTH: 0.408038
G1 X77.496 Y83.279 E.05096
; LINE_WIDTH: 0.407908
G1 X77.496 Y79.279 E.05094
; LINE_WIDTH: 0.407768
G1 X77.496 Y76.7 E.03284
G1 X77.55 Y76.402 E.00385
; LINE_WIDTH: 0.407298
G1 X77.693 Y76.139 E.00381
; LINE_WIDTH: 0.405138
G1 X78.01 Y75.89 E.00509
; LINE_WIDTH: 0.410278
G1 X78.41 Y75.798 E.00526
G1 X80.41 Y75.798 E.02563
; LINE_WIDTH: 0.410058
G1 X82.41 Y75.798 E.02561
; LINE_WIDTH: 0.409848
G1 X84.41 Y75.798 E.0256
; LINE_WIDTH: 0.409638
G1 X86.41 Y75.798 E.02559
; LINE_WIDTH: 0.409428
G1 X88.41 Y75.797 E.02557
; LINE_WIDTH: 0.409218
G1 X90.41 Y75.797 E.02556
; LINE_WIDTH: 0.409008
G1 X92.41 Y75.797 E.02554
; LINE_WIDTH: 0.408798
G1 X94.41 Y75.797 E.02553
; LINE_WIDTH: 0.408588
G1 X96.41 Y75.797 E.02552
; LINE_WIDTH: 0.408378
G1 X98.41 Y75.796 E.0255
; LINE_WIDTH: 0.408168
G1 X100.41 Y75.796 E.02549
; LINE_WIDTH: 0.407958
G1 X101.6 Y75.796 E.01516
; LINE_WIDTH: 0.410428
G1 X101.678 Y75.808 E.001
; WIPE_START
G1 F12000
M204 S6000
G1 X101.833 Y75.831 E-.05961
G1 X102.171 Y76.006 E-.14484
G1 X102.396 Y76.281 E-.13474
G1 X102.501 Y76.646 E-.14457
G1 X102.501 Y77.373 E-.27624
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.938 Y78.4 Z7.24 F42000
G1 X80.221 Y80.399 Z7.24
G1 Z6.84
G1 E.8 F1800
; LINE_WIDTH: 0.392388
G1 F1690
M204 S5000
G1 X80.288 Y80.407 E.00083
G1 X80.527 Y80.543 E.00336
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00341
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398208
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389228
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385908
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389428
G1 X79.726 Y81.666 E.00332
G1 X79.522 Y81.483 E.00333
; LINE_WIDTH: 0.384988
G1 X79.395 Y81.213 E.00358
; LINE_WIDTH: 0.392928
G1 X79.405 Y80.878 E.00412
G1 X79.537 Y80.621 E.00354
; LINE_WIDTH: 0.392388
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
G1 X80.162 Y80.391 E.0018
; WIPE_START
G1 F12000
M204 S6000
G1 X80.288 Y80.407 E-.04845
G1 X80.527 Y80.543 E-.10446
G1 X80.696 Y80.76 E-.10443
G1 X80.766 Y81.03 E-.10604
G1 X80.725 Y81.3 E-.10382
G1 X80.512 Y81.594 E-.13795
G1 X80.259 Y81.729 E-.10906
G1 X80.139 Y81.738 E-.0458
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.24 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 84/99
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; OBJECT_ID: 15
G1 X102.336 Y75.652 F42000
G1 Z6.92
M73 P86 R2
G1 E.8 F1800
; LINE_WIDTH: 0.414828
G1 F1680
M204 S5000
G1 X102.536 Y75.818 E.00337
; LINE_WIDTH: 0.407678
G1 X102.779 Y76.174 E.00549
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00621
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.3 E.33858
G1 X102.818 Y103.738 E.00566
; LINE_WIDTH: 0.406938
G1 X102.578 Y104.132 E.00586
; LINE_WIDTH: 0.403778
G1 X102.249 Y104.412 E.00545
; LINE_WIDTH: 0.411418
G1 X101.871 Y104.562 E.00523
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410238
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410018
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409798
G1 X95.59 Y104.595 E.0256
; LINE_WIDTH: 0.409578
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409358
G1 X91.59 Y104.595 E.02557
; LINE_WIDTH: 0.409138
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408918
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408698
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408478
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408258
G1 X81.59 Y104.594 E.0255
; LINE_WIDTH: 0.408038
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407828
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.408448
G1 X78.327 Y104.59 E.00093
G1 X77.837 Y104.458 E.00648
; LINE_WIDTH: 0.404318
G1 X77.462 Y104.18 E.00588
; LINE_WIDTH: 0.407648
G1 X77.205 Y103.795 E.00589
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.295 E.00651
G1 X77.104 Y77.295 E.33172
G3 X77.141 Y76.414 I3.753 J-.285 E.01128
; LINE_WIDTH: 0.412678
G1 X77.276 Y76.073 E.00473
G1 X77.457 Y75.83 E.00391
; LINE_WIDTH: 0.403898
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.411698
G1 X78.119 Y75.441 E.0052
G1 X78.41 Y75.405 E.00377
; LINE_WIDTH: 0.410278
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409848
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409638
G1 X86.41 Y75.405 E.02559
; LINE_WIDTH: 0.409428
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409218
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.409008
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408798
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408578
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408368
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408158
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.407948
G1 X101.6 Y75.405 E.01516
G1 X101.938 Y75.455 E.00435
; LINE_WIDTH: 0.414828
G1 X102.29 Y75.614 E.00501
M204 S250
G1 X101.748 Y75.828 F42000
; LINE_WIDTH: 0.407828
G1 F1680
M204 S5000
G1 X101.942 Y75.869 E.00252
; LINE_WIDTH: 0.405628
G1 X102.26 Y76.087 E.00488
; LINE_WIDTH: 0.407778
G1 X102.431 Y76.354 E.00404
G1 X102.504 Y76.7 E.0045
G1 X102.504 Y103.3 E.33867
G1 X102.439 Y103.628 E.00425
; LINE_WIDTH: 0.406208
G1 X102.275 Y103.893 E.00396
; LINE_WIDTH: 0.408758
G1 X101.996 Y104.109 E.0045
; LINE_WIDTH: 0.410238
G1 X101.58 Y104.202 E.00546
G1 X99.58 Y104.202 E.02562
; LINE_WIDTH: 0.410018
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409798
G1 X95.58 Y104.202 E.0256
; LINE_WIDTH: 0.409578
G1 X93.58 Y104.203 E.02558
; LINE_WIDTH: 0.409358
G1 X91.58 Y104.203 E.02557
; LINE_WIDTH: 0.409138
G1 X89.58 Y104.203 E.02555
; LINE_WIDTH: 0.408918
G1 X87.58 Y104.203 E.02554
; LINE_WIDTH: 0.408698
G1 X85.58 Y104.203 E.02552
; LINE_WIDTH: 0.408478
G1 X83.58 Y104.203 E.02551
; LINE_WIDTH: 0.408258
G1 X81.58 Y104.204 E.0255
; LINE_WIDTH: 0.408038
G1 X79.58 Y104.204 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.407698
G1 X77.977 Y104.094 E.00556
; LINE_WIDTH: 0.406798
G1 X77.684 Y103.845 E.00489
; LINE_WIDTH: 0.405118
G1 X77.556 Y103.618 E.0033
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.29 E.00425
G1 X77.496 Y76.724 E.33893
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.403898
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.408358
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.42 Y75.798 E.00539
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.410058
G1 X82.42 Y75.798 E.02561
; LINE_WIDTH: 0.409848
G1 X84.42 Y75.798 E.0256
; LINE_WIDTH: 0.409638
G1 X86.42 Y75.798 E.02559
; LINE_WIDTH: 0.409428
G1 X88.42 Y75.797 E.02557
; LINE_WIDTH: 0.409218
G1 X90.42 Y75.797 E.02556
; LINE_WIDTH: 0.409008
G1 X92.42 Y75.797 E.02554
; LINE_WIDTH: 0.408798
G1 X94.42 Y75.797 E.02553
; LINE_WIDTH: 0.408578
G1 X96.42 Y75.797 E.02552
; LINE_WIDTH: 0.408368
G1 X98.42 Y75.796 E.0255
; LINE_WIDTH: 0.408158
G1 X100.42 Y75.796 E.02549
; LINE_WIDTH: 0.407948
G1 X101.6 Y75.796 E.01503
; LINE_WIDTH: 0.407828
G1 X101.689 Y75.815 E.00116
; WIPE_START
G1 F12000
M204 S6000
G1 X101.942 Y75.869 E-.09813
G1 X102.26 Y76.087 E-.14634
G1 X102.431 Y76.354 E-.12064
G1 X102.504 Y76.7 E-.13423
G1 X102.504 Y77.386 E-.26066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.94 Y78.409 Z7.32 F42000
G1 X80.23 Y80.4 Z7.32
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.392388
G1 F1680
M204 S5000
G1 X80.288 Y80.407 E.00072
G1 X80.525 Y80.542 E.00333
; LINE_WIDTH: 0.413588
G1 X80.692 Y80.768 E.00363
G1 X80.762 Y81.03 E.00351
; LINE_WIDTH: 0.406168
G1 X80.757 Y81.132 E.00129
; LINE_WIDTH: 0.385988
G1 X80.678 Y81.393 E.00328
G1 X80.502 Y81.603 E.00329
G1 X80.259 Y81.729 E.00329
; LINE_WIDTH: 0.389388
G1 X79.986 Y81.752 E.00332
G1 X79.727 Y81.663 E.00333
; LINE_WIDTH: 0.384988
G1 X79.521 Y81.483 E.00328
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392388
G1 X79.751 Y80.449 E.00336
G1 X80.015 Y80.374 E.00336
G1 X80.171 Y80.393 E.00191
; WIPE_START
G1 F12000
M204 S6000
G1 X80.288 Y80.407 E-.04508
G1 X80.525 Y80.542 E-.10338
G1 X80.692 Y80.768 E-.10689
G1 X80.762 Y81.03 E-.10328
G1 X80.757 Y81.132 E-.03858
G1 X80.678 Y81.393 E-.10376
G1 X80.502 Y81.603 E-.10404
G1 X80.259 Y81.729 E-.10407
G1 X80.125 Y81.74 E-.05093
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.32 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 85/99
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; OBJECT_ID: 15
G1 X102.339 Y75.655 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.414828
G1 F1690
M204 S5000
G1 X102.536 Y75.818 E.00332
; LINE_WIDTH: 0.407718
G1 X102.779 Y76.175 E.0055
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.0062
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407738
G1 X102.895 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.895 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.895 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.895 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.895 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.896 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.896 Y102.7 E.02551
G3 X102.867 Y103.537 I-3.773 J.288 E.01071
; LINE_WIDTH: 0.413268
G1 X102.718 Y103.938 E.00552
G1 X102.554 Y104.16 E.00357
; LINE_WIDTH: 0.403798
G1 X102.261 Y104.401 E.00478
; LINE_WIDTH: 0.411418
G1 X101.871 Y104.562 E.00543
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410228
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410008
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409788
G1 X95.59 Y104.595 E.02559
; LINE_WIDTH: 0.409568
M73 P87 R2
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409348
G1 X91.59 Y104.595 E.02557
; LINE_WIDTH: 0.409128
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408918
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408698
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408478
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408258
G1 X81.59 Y104.594 E.0255
; LINE_WIDTH: 0.408038
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.407698
G1 X78.057 Y104.539 E.00442
; LINE_WIDTH: 0.415538
G1 X77.704 Y104.384 E.00501
G1 X77.435 Y104.157 E.00458
; LINE_WIDTH: 0.407358
G1 X77.183 Y103.72 E.00641
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00558
G1 X77.105 Y99.29 E.05103
; LINE_WIDTH: 0.408448
G1 X77.105 Y95.29 E.05101
; LINE_WIDTH: 0.408308
G1 X77.105 Y91.29 E.051
; LINE_WIDTH: 0.408178
G1 X77.105 Y87.29 E.05098
; LINE_WIDTH: 0.408038
G1 X77.105 Y83.29 E.05096
; LINE_WIDTH: 0.407908
G1 X77.106 Y79.29 E.05094
; LINE_WIDTH: 0.407768
G1 X77.106 Y76.7 E.03298
G1 X77.152 Y76.4 E.00386
; LINE_WIDTH: 0.411218
G1 X77.312 Y76.007 E.00545
; LINE_WIDTH: 0.413108
G1 X77.554 Y75.73 E.00474
G1 X77.906 Y75.506 E.00539
; LINE_WIDTH: 0.410568
G1 X78.405 Y75.405 E.00653
; LINE_WIDTH: 0.410278
G1 X80.405 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.405 Y75.405 E.02561
; LINE_WIDTH: 0.409848
G1 X84.405 Y75.405 E.0256
; LINE_WIDTH: 0.409638
G1 X86.405 Y75.405 E.02559
; LINE_WIDTH: 0.409428
G1 X88.405 Y75.405 E.02557
; LINE_WIDTH: 0.409208
G1 X90.405 Y75.405 E.02556
; LINE_WIDTH: 0.408998
G1 X92.405 Y75.405 E.02554
; LINE_WIDTH: 0.408788
G1 X94.405 Y75.405 E.02553
; LINE_WIDTH: 0.408578
G1 X96.405 Y75.405 E.02552
; LINE_WIDTH: 0.408368
G1 X98.405 Y75.405 E.0255
; LINE_WIDTH: 0.408148
G1 X100.405 Y75.405 E.02549
; LINE_WIDTH: 0.407938
G1 X101.6 Y75.405 E.01522
G1 X101.938 Y75.455 E.00435
; LINE_WIDTH: 0.414828
G1 X102.29 Y75.614 E.00502
G1 X102.292 Y75.616 E.00003
M204 S250
G1 X101.751 Y75.828 F42000
; LINE_WIDTH: 0.407818
G1 F1690
M204 S5000
G1 X101.942 Y75.869 E.00249
; LINE_WIDTH: 0.405618
G1 X102.26 Y76.087 E.00488
; LINE_WIDTH: 0.407828
G1 X102.431 Y76.354 E.00404
G1 X102.504 Y76.7 E.0045
G1 X102.504 Y82.7 E.0764
; LINE_WIDTH: 0.407948
G1 X102.504 Y86.7 E.05095
; LINE_WIDTH: 0.408078
G1 X102.504 Y90.7 E.05097
; LINE_WIDTH: 0.408218
G1 X102.504 Y94.7 E.05098
; LINE_WIDTH: 0.408348
G1 X102.504 Y98.7 E.051
; LINE_WIDTH: 0.408488
G1 X102.504 Y103.275 E.05836
G1 X102.463 Y103.553 E.00358
; LINE_WIDTH: 0.405218
G1 X102.275 Y103.894 E.00493
; LINE_WIDTH: 0.408718
G1 X101.996 Y104.11 E.0045
; LINE_WIDTH: 0.410228
G1 X101.581 Y104.202 E.00545
G1 X99.581 Y104.202 E.02562
; LINE_WIDTH: 0.410008
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409788
G1 X95.581 Y104.202 E.02559
; LINE_WIDTH: 0.409568
G1 X93.581 Y104.203 E.02558
; LINE_WIDTH: 0.409348
G1 X91.581 Y104.203 E.02557
; LINE_WIDTH: 0.409128
G1 X89.581 Y104.203 E.02555
; LINE_WIDTH: 0.408918
G1 X87.581 Y104.203 E.02554
; LINE_WIDTH: 0.408698
G1 X85.581 Y104.203 E.02552
; LINE_WIDTH: 0.408478
G1 X83.581 Y104.203 E.02551
; LINE_WIDTH: 0.408258
G1 X81.581 Y104.204 E.0255
; LINE_WIDTH: 0.408038
G1 X79.581 Y104.204 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.407698
G1 X78.057 Y104.132 E.00446
; LINE_WIDTH: 0.415538
G1 X77.9 Y104.038 E.00237
G1 X77.735 Y103.905 E.00276
; LINE_WIDTH: 0.406638
G1 X77.542 Y103.572 E.00489
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00376
G1 X77.496 Y99.281 E.05103
; LINE_WIDTH: 0.408448
G1 X77.496 Y95.281 E.05101
; LINE_WIDTH: 0.408308
G1 X77.496 Y91.281 E.051
; LINE_WIDTH: 0.408178
G1 X77.496 Y87.281 E.05098
; LINE_WIDTH: 0.408038
G1 X77.496 Y83.281 E.05096
; LINE_WIDTH: 0.407908
G1 X77.496 Y79.281 E.05094
; LINE_WIDTH: 0.407768
G1 X77.496 Y76.7 E.03286
; LINE_WIDTH: 0.408228
G1 X77.55 Y76.402 E.00386
G1 X77.73 Y76.101 E.00447
; LINE_WIDTH: 0.410568
G1 X78.039 Y75.878 E.00489
G1 X78.41 Y75.798 E.00486
; LINE_WIDTH: 0.410278
G1 X80.41 Y75.798 E.02563
; LINE_WIDTH: 0.410058
G1 X82.41 Y75.798 E.02561
; LINE_WIDTH: 0.409848
G1 X84.41 Y75.798 E.0256
; LINE_WIDTH: 0.409638
G1 X86.41 Y75.798 E.02559
; LINE_WIDTH: 0.409428
G1 X88.41 Y75.797 E.02557
; LINE_WIDTH: 0.409208
G1 X90.41 Y75.797 E.02556
; LINE_WIDTH: 0.408998
G1 X92.41 Y75.797 E.02554
; LINE_WIDTH: 0.408788
G1 X94.41 Y75.797 E.02553
; LINE_WIDTH: 0.408578
G1 X96.41 Y75.797 E.02552
; LINE_WIDTH: 0.408368
G1 X98.41 Y75.796 E.0255
; LINE_WIDTH: 0.408148
G1 X100.41 Y75.796 E.02549
; LINE_WIDTH: 0.407938
G1 X101.6 Y75.796 E.01516
; LINE_WIDTH: 0.407818
G1 X101.692 Y75.816 E.0012
; WIPE_START
G1 F12000
M204 S6000
G1 X101.942 Y75.869 E-.09706
G1 X102.26 Y76.087 E-.14638
G1 X102.431 Y76.354 E-.12066
G1 X102.504 Y76.7 E-.13426
G1 X102.504 Y77.388 E-.26163
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.94 Y78.413 Z7.4 F42000
G1 X80.247 Y80.403 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.392908
G1 F1690
M204 S5000
G1 X80.289 Y80.407 E.00051
; LINE_WIDTH: 0.392388
G1 X80.527 Y80.543 E.00336
; LINE_WIDTH: 0.398448
G1 X80.696 Y80.76 E.00341
G1 X80.766 Y81.03 E.00347
; LINE_WIDTH: 0.398468
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389228
M73 P87 R1
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385948
G1 X80.259 Y81.729 E.00329
; LINE_WIDTH: 0.389368
G1 X79.986 Y81.752 E.00332
G1 X79.727 Y81.663 E.00332
; LINE_WIDTH: 0.388848
G1 X79.487 Y81.435 E.00401
; LINE_WIDTH: 0.398388
G1 X79.374 Y81.1 E.0044
G1 X79.452 Y80.754 E.0044
; LINE_WIDTH: 0.385648
G1 X79.688 Y80.489 E.00426
; LINE_WIDTH: 0.392908
G1 X80.002 Y80.377 E.00409
G1 X80.187 Y80.396 E.00228
; WIPE_START
G1 F12000
M204 S6000
G1 X80.289 Y80.407 E-.03868
G1 X80.527 Y80.543 E-.10439
G1 X80.696 Y80.76 E-.10438
G1 X80.766 Y81.03 E-.10616
G1 X80.683 Y81.381 E-.13681
G1 X80.502 Y81.603 E-.10908
G1 X80.259 Y81.729 E-.10395
G1 X80.111 Y81.741 E-.05655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.08
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 86/99
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; OBJECT_ID: 15
G1 X102.341 Y75.657 F42000
G1 Z7.08
G1 E.8 F1800
; LINE_WIDTH: 0.414818
G1 F1690
M204 S5000
G1 X102.536 Y75.818 E.00328
; LINE_WIDTH: 0.408068
G1 X102.779 Y76.175 E.00551
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00619
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407738
G1 X102.895 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.895 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.895 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.895 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.895 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.896 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.896 Y102.7 E.02551
G3 X102.866 Y103.544 I-3.775 J.288 E.01079
; LINE_WIDTH: 0.414958
G1 X102.749 Y103.881 E.00463
G1 X102.572 Y104.141 E.00408
; LINE_WIDTH: 0.404008
G1 X102.284 Y104.389 E.00479
; LINE_WIDTH: 0.410928
G1 X101.87 Y104.561 E.00575
G1 X101.59 Y104.595 E.00362
; LINE_WIDTH: 0.410238
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410088
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409948
G1 X95.59 Y104.595 E.02561
; LINE_WIDTH: 0.409808
G1 X93.59 Y104.595 E.0256
; LINE_WIDTH: 0.409668
G1 X91.59 Y104.595 E.02559
; LINE_WIDTH: 0.409518
G1 X89.59 Y104.595 E.02558
; LINE_WIDTH: 0.409378
G1 X87.59 Y104.595 E.02557
; LINE_WIDTH: 0.409238
G1 X85.59 Y104.595 E.02556
; LINE_WIDTH: 0.409098
G1 X83.59 Y104.596 E.02555
; LINE_WIDTH: 0.408948
G1 X81.59 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.59 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.596 E.01487
G1 X78.157 Y104.566 E.00344
; LINE_WIDTH: 0.410918
G1 X77.771 Y104.424 E.00528
G1 X77.564 Y104.272 E.00329
; LINE_WIDTH: 0.403288
G1 X77.297 Y103.959 E.00518
; LINE_WIDTH: 0.411358
G1 X77.138 Y103.571 E.00539
G1 X77.105 Y103.29 E.00363
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409018
M73 P88 R1
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00721
G1 X77.181 Y76.285 E.00569
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.410048
G1 X82.412 Y75.405 E.02561
; LINE_WIDTH: 0.409838
G1 X84.412 Y75.405 E.0256
; LINE_WIDTH: 0.409628
G1 X86.412 Y75.405 E.02558
; LINE_WIDTH: 0.409418
G1 X88.412 Y75.405 E.02557
; LINE_WIDTH: 0.409198
G1 X90.412 Y75.405 E.02556
; LINE_WIDTH: 0.408988
G1 X92.412 Y75.405 E.02554
; LINE_WIDTH: 0.408778
G1 X94.412 Y75.405 E.02553
; LINE_WIDTH: 0.408568
G1 X96.412 Y75.405 E.02552
; LINE_WIDTH: 0.408358
G1 X98.412 Y75.405 E.0255
; LINE_WIDTH: 0.408138
G1 X100.412 Y75.405 E.02549
; LINE_WIDTH: 0.407928
G1 X101.6 Y75.405 E.01513
G1 X101.938 Y75.455 E.00434
; LINE_WIDTH: 0.414818
G1 X102.29 Y75.614 E.00502
G1 X102.295 Y75.618 E.00008
M204 S250
G1 X101.751 Y75.828 F42000
; LINE_WIDTH: 0.407808
G1 F1690
M204 S5000
G1 X101.941 Y75.869 E.00248
; LINE_WIDTH: 0.411038
G1 X102.279 Y76.112 E.00534
G1 X102.458 Y76.428 E.00466
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00351
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407808
G1 X102.504 Y82.7 E.05093
; LINE_WIDTH: 0.407948
G1 X102.504 Y86.7 E.05095
; LINE_WIDTH: 0.408078
G1 X102.504 Y90.7 E.05097
; LINE_WIDTH: 0.408218
G1 X102.504 Y94.7 E.05098
; LINE_WIDTH: 0.408348
G1 X102.504 Y98.7 E.051
; LINE_WIDTH: 0.408488
G1 X102.504 Y103.275 E.05836
G1 X102.462 Y103.559 E.00366
; LINE_WIDTH: 0.406508
G1 X102.275 Y103.895 E.00487
; LINE_WIDTH: 0.406368
G1 X101.995 Y104.108 E.00447
; LINE_WIDTH: 0.405908
G1 X101.669 Y104.2 E.00429
; LINE_WIDTH: 0.410238
G3 X99.58 Y104.202 I-1.093 J-42.603 E.02676
; LINE_WIDTH: 0.410088
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409948
G1 X95.58 Y104.202 E.02561
; LINE_WIDTH: 0.409808
G1 X93.58 Y104.203 E.0256
; LINE_WIDTH: 0.409658
G1 X91.58 Y104.203 E.02559
; LINE_WIDTH: 0.409518
G1 X89.58 Y104.203 E.02558
; LINE_WIDTH: 0.409378
G1 X87.58 Y104.203 E.02557
; LINE_WIDTH: 0.409238
G1 X85.58 Y104.204 E.02556
; LINE_WIDTH: 0.409088
G1 X83.58 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.58 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.58 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.204 E.01475
G1 X78.145 Y104.163 E.00361
; LINE_WIDTH: 0.404768
G1 X77.832 Y103.996 E.00448
; LINE_WIDTH: 0.408698
G1 X77.59 Y103.696 E.00492
; LINE_WIDTH: 0.410298
G1 X77.498 Y103.28 E.00546
G1 X77.498 Y101.28 E.02563
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.28 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.28 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.28 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.28 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.28 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.28 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.28 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G3 X77.529 Y76.464 I3.235 J-.278 E.01045
; LINE_WIDTH: 0.408288
G1 X77.729 Y76.1 E.00529
; LINE_WIDTH: 0.406778
G1 X78.01 Y75.89 E.00446
; LINE_WIDTH: 0.404528
G1 X78.331 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.410048
G1 X82.425 Y75.798 E.02561
; LINE_WIDTH: 0.409838
G1 X84.425 Y75.798 E.0256
; LINE_WIDTH: 0.409628
G1 X86.425 Y75.798 E.02558
; LINE_WIDTH: 0.409418
G1 X88.425 Y75.797 E.02557
; LINE_WIDTH: 0.409198
G1 X90.424 Y75.797 E.02556
; LINE_WIDTH: 0.408988
G1 X92.424 Y75.797 E.02554
; LINE_WIDTH: 0.408778
G1 X94.424 Y75.797 E.02553
; LINE_WIDTH: 0.408568
G1 X96.424 Y75.797 E.02552
; LINE_WIDTH: 0.408348
G1 X98.424 Y75.796 E.0255
; LINE_WIDTH: 0.408138
G1 X100.424 Y75.796 E.02549
; LINE_WIDTH: 0.407928
G1 X101.6 Y75.796 E.01497
; LINE_WIDTH: 0.407808
G1 X101.692 Y75.816 E.0012
; WIPE_START
G1 F12000
M204 S6000
G1 X101.941 Y75.869 E-.09685
G1 X102.279 Y76.112 E-.15811
G1 X102.458 Y76.428 E-.13788
G1 X102.504 Y76.7 E-.10472
G1 X102.504 Y77.39 E-.26244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.939 Y78.405 Z7.48 F42000
G1 X80.173 Y80.386 Z7.48
G1 Z7.08
G1 E.8 F1800
; LINE_WIDTH: 0.395268
G1 F1690
M204 S5000
G1 X80.19 Y80.384 E.00021
; LINE_WIDTH: 0.389468
G1 X80.488 Y80.516 E.00395
; LINE_WIDTH: 0.404328
G1 X80.696 Y80.765 E.00409
; LINE_WIDTH: 0.410888
G1 X80.76 Y81.031 E.00351
G1 X80.757 Y81.122 E.00117
; LINE_WIDTH: 0.388088
G1 X80.66 Y81.425 E.00385
; LINE_WIDTH: 0.384888
G1 X80.431 Y81.655 E.00389
; LINE_WIDTH: 0.395148
G1 X80.092 Y81.762 E.00438
G1 X79.77 Y81.686 E.00408
; LINE_WIDTH: 0.389208
G1 X79.542 Y81.51 E.00349
; LINE_WIDTH: 0.386828
G1 X79.397 Y81.213 E.00399
; LINE_WIDTH: 0.392628
G1 X79.405 Y80.872 E.00417
G1 X79.537 Y80.621 E.00347
; LINE_WIDTH: 0.395268
G1 X79.787 Y80.427 E.0039
G1 X80.113 Y80.393 E.00404
; WIPE_START
G1 F12000
M204 S6000
G1 X80.19 Y80.384 E-.02929
G1 X80.488 Y80.516 E-.12366
G1 X80.696 Y80.765 E-.12326
G1 X80.76 Y81.031 E-.10392
G1 X80.757 Y81.122 E-.03477
G1 X80.66 Y81.425 E-.12092
G1 X80.431 Y81.655 E-.12339
G1 X80.178 Y81.735 E-.10079
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.48 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.16
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 87/99
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; OBJECT_ID: 15
G1 X102.351 Y75.67 F42000
G1 Z7.16
G1 E.8 F1800
; LINE_WIDTH: 0.412428
G1 F1685
M204 S5000
G1 X102.577 Y75.861 E.00382
; LINE_WIDTH: 0.413708
G1 X102.79 Y76.2 E.00517
G1 X102.894 Y76.646 E.00592
; LINE_WIDTH: 0.409368
G1 X102.894 Y80.646 E.05113
; LINE_WIDTH: 0.409248
G1 X102.894 Y84.646 E.05112
; LINE_WIDTH: 0.409128
G1 X102.895 Y88.646 E.0511
; LINE_WIDTH: 0.409008
G1 X102.895 Y92.646 E.05109
; LINE_WIDTH: 0.408888
G1 X102.895 Y96.646 E.05107
; LINE_WIDTH: 0.408768
G1 X102.895 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.896 Y103.275 E.03355
G1 X102.826 Y103.689 E.00535
; LINE_WIDTH: 0.404898
G1 X102.608 Y104.1 E.00589
; LINE_WIDTH: 0.404058
G1 X102.284 Y104.389 E.00548
; LINE_WIDTH: 0.410908
G1 X101.87 Y104.561 E.00575
G1 X101.59 Y104.595 E.00362
; LINE_WIDTH: 0.410228
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410078
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409938
G1 X95.59 Y104.595 E.0256
; LINE_WIDTH: 0.409798
G1 X93.59 Y104.595 E.0256
; LINE_WIDTH: 0.409658
G1 X91.59 Y104.595 E.02559
; LINE_WIDTH: 0.409518
G1 X89.59 Y104.595 E.02558
; LINE_WIDTH: 0.409378
G1 X87.59 Y104.595 E.02557
; LINE_WIDTH: 0.409228
G1 X85.59 Y104.595 E.02556
; LINE_WIDTH: 0.409088
G1 X83.59 Y104.596 E.02555
; LINE_WIDTH: 0.408948
G1 X81.59 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.59 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.596 E.01488
G1 X77.957 Y104.509 E.00606
; LINE_WIDTH: 0.404338
G1 X77.553 Y104.268 E.00594
; LINE_WIDTH: 0.413748
G1 X77.283 Y103.94 E.00549
G1 X77.193 Y103.734 E.00291
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00577
G1 X77.104 Y77.29 E.33172
G3 X77.141 Y76.414 I3.736 J-.283 E.01122
; LINE_WIDTH: 0.412668
G1 X77.277 Y76.071 E.00476
G1 X77.457 Y75.829 E.00388
; LINE_WIDTH: 0.403978
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410258
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410038
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409828
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409618
G1 X86.41 Y75.405 E.02558
; LINE_WIDTH: 0.409408
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409188
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.408978
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408768
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408558
G1 X96.41 Y75.405 E.02551
; LINE_WIDTH: 0.408348
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408128
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.407918
G1 X101.6 Y75.405 E.01516
; LINE_WIDTH: 0.407798
G1 X101.839 Y75.436 E.00307
G1 X102.27 Y75.601 E.00587
; LINE_WIDTH: 0.412428
G1 X102.305 Y75.631 E.0006
M204 S250
G1 X102.301 Y76.164 F42000
; LINE_WIDTH: 0.405618
G1 F1685
M204 S5000
G1 X102.392 Y76.274 E.00181
; LINE_WIDTH: 0.409368
G1 X102.501 Y76.646 E.00495
G1 X102.502 Y80.646 E.05113
; LINE_WIDTH: 0.409248
M73 P89 R1
G1 X102.502 Y84.646 E.05112
; LINE_WIDTH: 0.409128
G1 X102.503 Y88.646 E.0511
; LINE_WIDTH: 0.409008
G1 X102.503 Y92.646 E.05109
; LINE_WIDTH: 0.408888
G1 X102.504 Y96.646 E.05107
; LINE_WIDTH: 0.408768
G1 X102.504 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.504 Y103.275 E.03355
G1 X102.462 Y103.554 E.00359
; LINE_WIDTH: 0.407368
G1 X102.275 Y103.896 E.00496
G1 X101.995 Y104.108 E.00448
; LINE_WIDTH: 0.405908
G1 X101.669 Y104.2 E.00429
; LINE_WIDTH: 0.410228
G3 X99.581 Y104.202 I-1.093 J-42.503 E.02676
; LINE_WIDTH: 0.410078
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409938
G1 X95.581 Y104.202 E.0256
; LINE_WIDTH: 0.409798
G1 X93.581 Y104.203 E.0256
; LINE_WIDTH: 0.409658
G1 X91.581 Y104.203 E.02559
; LINE_WIDTH: 0.409518
G1 X89.581 Y104.203 E.02558
; LINE_WIDTH: 0.409378
G1 X87.581 Y104.203 E.02557
; LINE_WIDTH: 0.409228
G1 X85.581 Y104.204 E.02556
; LINE_WIDTH: 0.409088
G1 X83.581 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.581 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.581 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.204 E.01476
G1 X78.062 Y104.134 E.00471
; LINE_WIDTH: 0.406778
G1 X77.735 Y103.905 E.00507
; LINE_WIDTH: 0.405068
G1 X77.543 Y103.572 E.00486
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00376
G1 X77.496 Y76.724 E.33881
G1 X77.552 Y76.403 E.00415
; LINE_WIDTH: 0.403978
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.408228
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410258
G1 X78.419 Y75.798 E.00538
G1 X80.419 Y75.798 E.02563
; LINE_WIDTH: 0.410038
G1 X82.419 Y75.798 E.02561
; LINE_WIDTH: 0.409828
G1 X84.419 Y75.798 E.0256
; LINE_WIDTH: 0.409618
G1 X86.419 Y75.798 E.02558
; LINE_WIDTH: 0.409408
G1 X88.419 Y75.797 E.02557
; LINE_WIDTH: 0.409188
G1 X90.419 Y75.797 E.02556
; LINE_WIDTH: 0.408978
G1 X92.419 Y75.797 E.02554
; LINE_WIDTH: 0.408768
G1 X94.419 Y75.797 E.02553
; LINE_WIDTH: 0.408558
G1 X96.419 Y75.797 E.02551
; LINE_WIDTH: 0.408338
G1 X98.419 Y75.796 E.0255
; LINE_WIDTH: 0.408128
G1 X100.419 Y75.796 E.02549
; LINE_WIDTH: 0.407918
G1 X101.6 Y75.796 E.01504
; LINE_WIDTH: 0.410558
G1 X101.833 Y75.831 E.00302
G1 X102.169 Y76.005 E.00485
; LINE_WIDTH: 0.405618
G1 X102.263 Y76.118 E.00186
; WIPE_START
G1 F12000
M204 S6000
G1 X102.392 Y76.274 E-.07714
G1 X102.501 Y76.646 E-.14718
G1 X102.501 Y78.056 E-.53568
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.909 Y78.837 Z7.56 F42000
G1 X80.053 Y80.367 Z7.56
G1 Z7.16
G1 E.8 F1800
; LINE_WIDTH: 0.396088
G1 F1685
M204 S5000
G1 X80.402 Y80.458 E.00446
; LINE_WIDTH: 0.388988
G1 X80.658 Y80.698 E.00425
; LINE_WIDTH: 0.398468
G1 X80.766 Y81.03 E.00434
G1 X80.697 Y81.359 E.00418
; LINE_WIDTH: 0.387928
G1 X80.494 Y81.611 E.00391
; LINE_WIDTH: 0.382968
G1 X80.199 Y81.744 E.00385
; LINE_WIDTH: 0.392928
G1 X79.865 Y81.725 E.0041
G1 X79.613 Y81.587 E.00352
; LINE_WIDTH: 0.399108
G1 X79.444 Y81.371 E.00342
G1 X79.375 Y81.07 E.00384
; LINE_WIDTH: 0.390928
G1 X79.48 Y80.705 E.00464
; LINE_WIDTH: 0.384888
G1 X79.709 Y80.475 E.00388
; LINE_WIDTH: 0.396088
G1 X79.995 Y80.385 E.00371
; WIPE_START
G1 F12000
M204 S6000
G1 X80.402 Y80.458 E-.157
G1 X80.658 Y80.698 E-.13323
G1 X80.766 Y81.03 E-.13274
G1 X80.697 Y81.359 E-.12777
G1 X80.494 Y81.611 E-.12297
G1 X80.287 Y81.705 E-.08629
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.56 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.24
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 88/99
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; OBJECT_ID: 15
G1 X102.354 Y75.672 F42000
G1 Z7.24
G1 E.8 F1800
; LINE_WIDTH: 0.412748
G1 F1690
M204 S5000
G1 X102.577 Y75.861 E.00377
; LINE_WIDTH: 0.413388
G1 X102.791 Y76.201 E.00518
G1 X102.894 Y76.646 E.0059
; LINE_WIDTH: 0.409388
G1 X102.894 Y80.646 E.05114
; LINE_WIDTH: 0.409258
G1 X102.894 Y84.646 E.05112
; LINE_WIDTH: 0.409138
G1 X102.894 Y88.646 E.0511
; LINE_WIDTH: 0.409018
G1 X102.895 Y92.646 E.05109
; LINE_WIDTH: 0.408898
G1 X102.895 Y96.646 E.05107
; LINE_WIDTH: 0.408778
G1 X102.895 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.896 Y103.275 E.03355
G1 X102.819 Y103.711 E.00564
; LINE_WIDTH: 0.406768
G1 X102.613 Y104.089 E.00547
; LINE_WIDTH: 0.407968
G1 X102.307 Y104.378 E.00535
; LINE_WIDTH: 0.412958
G1 X101.936 Y104.543 E.00524
G1 X101.588 Y104.595 E.00455
; LINE_WIDTH: 0.410238
G1 X99.588 Y104.595 E.02562
; LINE_WIDTH: 0.410088
G1 X97.588 Y104.595 E.02561
; LINE_WIDTH: 0.409948
G1 X95.588 Y104.595 E.02561
; LINE_WIDTH: 0.409808
G1 X93.588 Y104.595 E.0256
; LINE_WIDTH: 0.409668
G1 X91.588 Y104.595 E.02559
; LINE_WIDTH: 0.409518
G1 X89.588 Y104.595 E.02558
; LINE_WIDTH: 0.409378
G1 X87.588 Y104.595 E.02557
; LINE_WIDTH: 0.409238
G1 X85.588 Y104.595 E.02556
; LINE_WIDTH: 0.409098
G1 X83.588 Y104.596 E.02555
; LINE_WIDTH: 0.408948
G1 X81.588 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.588 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.596 E.01484
G1 X78.088 Y104.556 E.00433
; LINE_WIDTH: 0.407848
G1 X77.624 Y104.326 E.00659
; LINE_WIDTH: 0.408478
G1 X77.328 Y104.015 E.00548
; LINE_WIDTH: 0.412878
G1 X77.157 Y103.636 E.00536
G1 X77.105 Y103.288 E.00455
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.288 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.288 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.288 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.288 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.288 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.288 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.288 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.288 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.288 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.288 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.288 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.288 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.288 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.414 I3.723 J-.282 E.01118
; LINE_WIDTH: 0.412678
G1 X77.277 Y76.07 E.00477
G1 X77.457 Y75.829 E.00387
; LINE_WIDTH: 0.403998
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.410838
G1 X78.137 Y75.436 E.00543
G1 X78.41 Y75.405 E.00352
; LINE_WIDTH: 0.410278
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409848
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409628
G1 X86.41 Y75.405 E.02558
; LINE_WIDTH: 0.409418
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409198
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.408988
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408768
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408558
G1 X96.41 Y75.405 E.02551
; LINE_WIDTH: 0.408338
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408128
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.407908
G1 X101.6 Y75.405 E.01516
; LINE_WIDTH: 0.407788
G1 X101.839 Y75.436 E.00307
G1 X102.269 Y75.601 E.00586
; LINE_WIDTH: 0.412748
G1 X102.308 Y75.634 E.00066
M204 S250
G1 X102.301 Y76.165 F42000
; LINE_WIDTH: 0.405768
G1 F1690
M204 S5000
G1 X102.394 Y76.279 E.00186
; LINE_WIDTH: 0.409388
G1 X102.501 Y76.646 E.00489
G1 X102.502 Y80.646 E.05114
; LINE_WIDTH: 0.409258
G1 X102.502 Y84.646 E.05112
; LINE_WIDTH: 0.409138
G1 X102.503 Y88.646 E.0511
; LINE_WIDTH: 0.409018
G1 X102.503 Y92.646 E.05109
; LINE_WIDTH: 0.408898
G1 X102.504 Y96.646 E.05107
; LINE_WIDTH: 0.408778
G1 X102.504 Y100.646 E.05106
; LINE_WIDTH: 0.408648
G1 X102.504 Y103.275 E.03355
G1 X102.463 Y103.554 E.0036
; LINE_WIDTH: 0.406768
G1 X102.275 Y103.896 E.00495
; LINE_WIDTH: 0.406418
G1 X101.994 Y104.108 E.00446
; LINE_WIDTH: 0.404518
G1 X101.669 Y104.199 E.00426
; LINE_WIDTH: 0.410238
G1 X99.575 Y104.202 E.02682
; LINE_WIDTH: 0.410088
G1 X97.575 Y104.202 E.02561
; LINE_WIDTH: 0.409948
G1 X95.575 Y104.202 E.02561
; LINE_WIDTH: 0.409808
G1 X93.575 Y104.203 E.0256
; LINE_WIDTH: 0.409658
G1 X91.575 Y104.203 E.02559
; LINE_WIDTH: 0.409518
G1 X89.575 Y104.203 E.02558
; LINE_WIDTH: 0.409378
G1 X87.575 Y104.203 E.02557
; LINE_WIDTH: 0.409238
G1 X85.575 Y104.204 E.02556
; LINE_WIDTH: 0.409088
M73 P90 R1
G1 X83.575 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.575 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.575 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.204 E.01469
G1 X78.183 Y104.173 E.00311
; LINE_WIDTH: 0.407488
G1 X77.831 Y103.997 E.00501
; LINE_WIDTH: 0.406498
G1 X77.593 Y103.694 E.00488
; LINE_WIDTH: 0.404528
G1 X77.501 Y103.37 E.00426
; LINE_WIDTH: 0.410298
G1 X77.498 Y101.275 E.02683
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.275 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.275 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.275 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.275 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.275 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.275 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.275 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.275 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.275 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.275 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.275 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.275 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00703
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.403998
G1 X77.73 Y76.101 E.00442
G1 X77.959 Y75.915 E.00372
; LINE_WIDTH: 0.406048
G1 X78.33 Y75.8 E.00493
; LINE_WIDTH: 0.410278
G3 X80.419 Y75.798 I1.093 J43.432 E.02677
; LINE_WIDTH: 0.410058
G1 X82.419 Y75.798 E.02561
; LINE_WIDTH: 0.409848
G1 X84.419 Y75.798 E.0256
; LINE_WIDTH: 0.409628
G1 X86.419 Y75.798 E.02558
; LINE_WIDTH: 0.409418
G1 X88.419 Y75.797 E.02557
; LINE_WIDTH: 0.409198
G1 X90.419 Y75.797 E.02556
; LINE_WIDTH: 0.408988
G1 X92.419 Y75.797 E.02554
; LINE_WIDTH: 0.408768
G1 X94.419 Y75.797 E.02553
; LINE_WIDTH: 0.408558
G1 X96.419 Y75.797 E.02551
; LINE_WIDTH: 0.408338
G1 X98.419 Y75.796 E.0255
; LINE_WIDTH: 0.408128
G1 X100.419 Y75.796 E.02549
; LINE_WIDTH: 0.407908
G1 X101.6 Y75.796 E.01504
; LINE_WIDTH: 0.410578
G1 X101.833 Y75.831 E.00302
G1 X102.169 Y76.005 E.00485
; LINE_WIDTH: 0.405768
G1 X102.263 Y76.119 E.00187
; WIPE_START
G1 F12000
M204 S6000
G1 X102.394 Y76.279 E-.0787
G1 X102.501 Y76.646 E-.14537
G1 X102.501 Y78.056 E-.53593
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.91 Y78.849 Z7.64 F42000
G1 X80.161 Y80.388 Z7.64
G1 Z7.24
G1 E.8 F1800
; LINE_WIDTH: 0.400838
G1 F1690
M204 S5000
G1 X80.18 Y80.388 E.00024
; LINE_WIDTH: 0.386928
G1 X80.463 Y80.499 E.00367
; LINE_WIDTH: 0.398728
G1 X80.691 Y80.752 E.00423
G1 X80.766 Y81.03 E.00358
; LINE_WIDTH: 0.398448
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389188
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385968
G1 X80.259 Y81.729 E.00329
; LINE_WIDTH: 0.392868
G1 X79.986 Y81.754 E.00336
; LINE_WIDTH: 0.399268
G1 X79.674 Y81.636 E.00415
G1 X79.452 Y81.375 E.00427
; LINE_WIDTH: 0.391208
G1 X79.379 Y81.057 E.00399
; LINE_WIDTH: 0.384788
G1 X79.47 Y80.72 E.00418
; LINE_WIDTH: 0.392528
G1 X79.684 Y80.49 E.00384
; LINE_WIDTH: 0.409868
G1 X79.843 Y80.436 E.00215
; LINE_WIDTH: 0.424868
G3 X80.073 Y80.388 I.185 J.316 E.00318
; LINE_WIDTH: 0.400838
G1 X80.101 Y80.388 E.00035
; WIPE_START
G1 F10293.739
M204 S6000
G1 X80.18 Y80.388 E-.0301
G1 X80.463 Y80.499 E-.11556
G1 X80.691 Y80.752 E-.12939
G1 X80.766 Y81.03 E-.10947
G1 X80.683 Y81.381 E-.13682
G1 X80.502 Y81.603 E-.10901
G1 X80.259 Y81.729 E-.104
G1 X80.192 Y81.735 E-.02564
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.64 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.32
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 89/99
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
; OBJECT_ID: 15
G1 X102.348 Y75.662 F42000
G1 Z7.32
G1 E.8 F1800
; LINE_WIDTH: 0.414828
G1 F1691
M204 S5000
G1 X102.536 Y75.818 E.00316
; LINE_WIDTH: 0.407828
G1 X102.78 Y76.177 E.00553
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00617
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.3 E.33858
; LINE_WIDTH: 0.411978
G1 X102.816 Y103.738 E.00572
G1 X102.577 Y104.133 E.00594
; LINE_WIDTH: 0.403848
G1 X102.248 Y104.413 E.00545
; LINE_WIDTH: 0.411398
G1 X101.871 Y104.562 E.00521
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410228
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410008
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409788
G1 X95.59 Y104.595 E.02559
; LINE_WIDTH: 0.409568
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409348
G1 X91.59 Y104.595 E.02557
; LINE_WIDTH: 0.409128
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408918
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408698
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408478
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408258
G1 X81.59 Y104.594 E.0255
; LINE_WIDTH: 0.408038
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.411968
G1 X77.963 Y104.516 E.00572
G1 X77.567 Y104.277 E.00595
; LINE_WIDTH: 0.403828
G1 X77.287 Y103.948 E.00545
; LINE_WIDTH: 0.411368
G1 X77.138 Y103.571 E.00521
G1 X77.105 Y103.29 E.00363
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.729 E.00716
G1 X77.171 Y76.305 E.00547
; LINE_WIDTH: 0.406388
G1 X77.414 Y75.872 E.00629
; LINE_WIDTH: 0.403068
G1 X77.745 Y75.595 E.00543
; LINE_WIDTH: 0.411318
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410278
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409838
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409628
G1 X86.41 Y75.405 E.02558
; LINE_WIDTH: 0.409408
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409198
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.408978
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408768
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408548
G1 X96.41 Y75.405 E.02551
; LINE_WIDTH: 0.408328
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408118
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.407898
G1 X101.6 Y75.406 E.01516
; LINE_WIDTH: 0.408058
G1 X101.938 Y75.455 E.00435
; LINE_WIDTH: 0.414828
G1 X102.29 Y75.614 E.00501
G1 X102.302 Y75.624 E.0002
M204 S250
G1 X102.224 Y76.063 F42000
; LINE_WIDTH: 0.405618
G1 F1691
M204 S5000
G1 X102.26 Y76.087 E.00054
; LINE_WIDTH: 0.407968
G1 X102.431 Y76.354 E.00405
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407678
G1 X102.504 Y103.3 E.33858
; LINE_WIDTH: 0.411978
G1 X102.451 Y103.585 E.00373
G1 X102.273 Y103.895 E.00459
; LINE_WIDTH: 0.408578
G1 X101.994 Y104.11 E.0045
; LINE_WIDTH: 0.410228
G1 X101.581 Y104.202 E.00543
G1 X99.581 Y104.202 E.02562
; LINE_WIDTH: 0.410008
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409788
G1 X95.581 Y104.202 E.02559
; LINE_WIDTH: 0.409568
G1 X93.581 Y104.203 E.02558
; LINE_WIDTH: 0.409348
G1 X91.581 Y104.203 E.02557
; LINE_WIDTH: 0.409128
G1 X89.581 Y104.203 E.02555
; LINE_WIDTH: 0.408918
G1 X87.581 Y104.203 E.02554
; LINE_WIDTH: 0.408698
G1 X85.581 Y104.203 E.02552
; LINE_WIDTH: 0.408478
G1 X83.581 Y104.203 E.02551
; LINE_WIDTH: 0.408258
G1 X81.581 Y104.204 E.0255
; LINE_WIDTH: 0.408038
G1 X79.581 Y104.204 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.411968
G1 X78.115 Y104.151 E.00373
G1 X77.805 Y103.973 E.00459
; LINE_WIDTH: 0.405428
G1 X77.628 Y103.761 E.0035
; LINE_WIDTH: 0.405928
G1 X77.5 Y103.369 E.00522
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.28 I42.606 J-1.093 E.02677
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y95.28 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.28 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.28 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.28 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.28 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.28 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.28 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.729 E.00704
G1 X77.551 Y76.403 E.00421
; LINE_WIDTH: 0.405928
M73 P91 R1
G1 X77.729 Y76.1 E.00445
; LINE_WIDTH: 0.408278
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.410058
G1 X82.42 Y75.798 E.02561
; LINE_WIDTH: 0.409838
G1 X84.42 Y75.798 E.0256
; LINE_WIDTH: 0.409628
G1 X86.42 Y75.798 E.02558
; LINE_WIDTH: 0.409408
G1 X88.42 Y75.797 E.02557
; LINE_WIDTH: 0.409198
G1 X90.42 Y75.797 E.02556
; LINE_WIDTH: 0.408978
G1 X92.42 Y75.797 E.02554
; LINE_WIDTH: 0.408768
G1 X94.42 Y75.797 E.02553
; LINE_WIDTH: 0.408548
G1 X96.42 Y75.797 E.02551
; LINE_WIDTH: 0.408328
G1 X98.42 Y75.796 E.0255
; LINE_WIDTH: 0.408118
G1 X100.42 Y75.796 E.02549
; LINE_WIDTH: 0.407898
G1 X101.6 Y75.796 E.01503
; LINE_WIDTH: 0.407778
G1 X101.942 Y75.869 E.00445
; LINE_WIDTH: 0.405618
G1 X102.175 Y76.029 E.00357
; WIPE_START
G1 F12000
M204 S6000
G1 X102.26 Y76.087 E-.03907
G1 X102.431 Y76.354 E-.1207
G1 X102.504 Y76.7 E-.1342
G1 X102.504 Y77.926 E-.46603
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.917 Y78.757 Z7.72 F42000
G1 X80.091 Y80.38 Z7.72
G1 Z7.32
G1 E.8 F1800
; LINE_WIDTH: 0.392368
G1 F1691
M204 S5000
G1 X80.231 Y80.393 E.00171
; LINE_WIDTH: 0.392588
G1 X80.519 Y80.538 E.00395
; LINE_WIDTH: 0.398888
G1 X80.696 Y80.76 E.00353
G1 X80.766 Y81.03 E.00347
; LINE_WIDTH: 0.398468
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398248
G1 X80.583 Y81.536 E.00343
G1 X80.272 Y81.724 E.00451
; LINE_WIDTH: 0.389208
G1 X79.987 Y81.75 E.00348
; LINE_WIDTH: 0.385968
G1 X79.727 Y81.664 E.00329
; LINE_WIDTH: 0.389408
G1 X79.52 Y81.485 E.00332
G1 X79.394 Y81.211 E.00365
; LINE_WIDTH: 0.392908
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00352
; LINE_WIDTH: 0.392368
G1 X79.751 Y80.449 E.00336
G1 X80.015 Y80.374 E.00336
G1 X80.031 Y80.375 E.00019
; WIPE_START
G1 F12000
M204 S6000
G1 X80.231 Y80.393 E-.07607
G1 X80.519 Y80.538 E-.12274
G1 X80.696 Y80.76 E-.10788
G1 X80.766 Y81.03 E-.106
G1 X80.725 Y81.3 E-.10383
G1 X80.583 Y81.536 E-.10483
G1 X80.272 Y81.724 E-.13794
G1 X80.27 Y81.724 E-.00069
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.72 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 90/99
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
; OBJECT_ID: 15
G1 X102.35 Y75.664 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.414818
G1 F1685
M204 S5000
G1 X102.536 Y75.818 E.00312
; LINE_WIDTH: 0.407978
G1 X102.78 Y76.178 E.00555
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00616
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.3 E.33858
; LINE_WIDTH: 0.411558
G1 X102.816 Y103.738 E.00572
G1 X102.588 Y104.125 E.00577
; LINE_WIDTH: 0.403158
G1 X102.255 Y104.405 E.00549
; LINE_WIDTH: 0.411358
G1 X101.871 Y104.562 E.00533
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410238
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410018
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409798
G1 X95.59 Y104.595 E.0256
; LINE_WIDTH: 0.409578
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409358
G1 X91.59 Y104.595 E.02557
; LINE_WIDTH: 0.409138
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408918
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408698
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408478
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408258
G1 X81.59 Y104.594 E.0255
; LINE_WIDTH: 0.408038
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407828
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.410988
G1 X77.989 Y104.522 E.00536
G1 X77.77 Y104.422 E.00309
; LINE_WIDTH: 0.406818
G1 X77.417 Y104.137 E.00576
G1 X77.203 Y103.771 E.00539
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.292 E.00624
G1 X77.104 Y76.724 E.33896
G1 X77.188 Y76.274 E.00584
; LINE_WIDTH: 0.402848
G1 X77.395 Y75.896 E.00543
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00523
; LINE_WIDTH: 0.413488
G1 X77.992 Y75.478 E.00421
G1 X78.415 Y75.405 E.00555
; LINE_WIDTH: 0.410258
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410038
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409828
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409608
G1 X86.415 Y75.405 E.02558
; LINE_WIDTH: 0.409398
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409188
G1 X90.415 Y75.405 E.02556
; LINE_WIDTH: 0.408968
G1 X92.415 Y75.405 E.02554
; LINE_WIDTH: 0.408758
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408538
G1 X96.415 Y75.405 E.02551
; LINE_WIDTH: 0.408328
G1 X98.415 Y75.405 E.0255
; LINE_WIDTH: 0.408118
G1 X100.415 Y75.406 E.02549
; LINE_WIDTH: 0.407898
G1 X101.6 Y75.406 E.01509
; LINE_WIDTH: 0.408068
G1 X101.938 Y75.455 E.00435
; LINE_WIDTH: 0.414818
G1 X102.29 Y75.614 E.00501
G1 X102.304 Y75.626 E.00024
M204 S250
G1 X102.196 Y76.053 F42000
; LINE_WIDTH: 0.410998
G1 F1685
M204 S5000
G1 X102.279 Y76.112 E.00131
G1 X102.458 Y76.428 E.00466
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00351
G1 X102.504 Y103.3 E.33858
; LINE_WIDTH: 0.411558
G1 X102.452 Y103.585 E.00372
G1 X102.274 Y103.897 E.00462
; LINE_WIDTH: 0.408208
G1 X101.99 Y104.112 E.00454
; LINE_WIDTH: 0.410238
G1 X101.58 Y104.202 E.00538
G1 X99.58 Y104.202 E.02562
; LINE_WIDTH: 0.410018
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409798
G1 X95.58 Y104.202 E.0256
; LINE_WIDTH: 0.409578
G1 X93.58 Y104.202 E.02558
; LINE_WIDTH: 0.409358
G1 X91.58 Y104.203 E.02557
; LINE_WIDTH: 0.409138
G1 X89.58 Y104.203 E.02555
; LINE_WIDTH: 0.408918
G1 X87.58 Y104.203 E.02554
; LINE_WIDTH: 0.408698
G1 X85.58 Y104.203 E.02552
; LINE_WIDTH: 0.408478
G1 X83.58 Y104.203 E.02551
; LINE_WIDTH: 0.408258
G1 X81.58 Y104.204 E.0255
; LINE_WIDTH: 0.408038
G1 X79.58 Y104.204 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.407698
G1 X77.977 Y104.094 E.00556
; LINE_WIDTH: 0.406818
G1 X77.683 Y103.846 E.00489
; LINE_WIDTH: 0.405868
G1 X77.543 Y103.572 E.0039
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.284 E.00372
G1 X77.496 Y76.724 E.33886
G1 X77.529 Y76.466 E.00333
; LINE_WIDTH: 0.408108
G1 X77.728 Y76.1 E.00531
; LINE_WIDTH: 0.407718
G1 X78.01 Y75.889 E.00447
; LINE_WIDTH: 0.405578
G1 X78.331 Y75.802 E.00421
; LINE_WIDTH: 0.410258
G1 X80.43 Y75.798 E.0269
; LINE_WIDTH: 0.410038
G1 X82.43 Y75.798 E.02561
; LINE_WIDTH: 0.409828
G1 X84.43 Y75.798 E.0256
; LINE_WIDTH: 0.409608
G1 X86.43 Y75.798 E.02558
; LINE_WIDTH: 0.409398
G1 X88.43 Y75.797 E.02557
; LINE_WIDTH: 0.409178
G1 X90.43 Y75.797 E.02555
; LINE_WIDTH: 0.408968
G1 X92.43 Y75.797 E.02554
; LINE_WIDTH: 0.408758
G1 X94.43 Y75.797 E.02553
; LINE_WIDTH: 0.408538
G1 X96.43 Y75.797 E.02551
; LINE_WIDTH: 0.408328
G1 X98.43 Y75.796 E.0255
; LINE_WIDTH: 0.408108
G1 X100.43 Y75.796 E.02549
; LINE_WIDTH: 0.407898
G1 X101.6 Y75.796 E.0149
; LINE_WIDTH: 0.407778
G1 X101.942 Y75.869 E.00445
; LINE_WIDTH: 0.410998
G1 X102.148 Y76.018 E.00326
; WIPE_START
G1 F12000
M204 S6000
G1 X102.279 Y76.112 E-.06147
G1 X102.458 Y76.428 E-.13798
G1 X102.504 Y76.7 E-.10474
G1 X102.504 Y77.899 E-.45582
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.918 Y78.74 Z7.8 F42000
G1 X80.074 Y80.384 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.402168
G1 F1685
M204 S5000
G1 X80.23 Y80.396 E.00197
; LINE_WIDTH: 0.405748
G1 X80.501 Y80.52 E.00377
G1 X80.662 Y80.703 E.00308
G1 X80.756 Y80.961 E.00348
; LINE_WIDTH: 0.405288
G1 X80.721 Y81.299 E.0043
; LINE_WIDTH: 0.388648
G1 X80.546 Y81.566 E.00386
; LINE_WIDTH: 0.387628
G1 X80.272 Y81.724 E.00382
; LINE_WIDTH: 0.390808
G1 X79.987 Y81.753 E.00349
G1 X79.726 Y81.665 E.00335
; LINE_WIDTH: 0.388268
G1 X79.52 Y81.484 E.00331
; LINE_WIDTH: 0.404528
G1 X79.384 Y81.168 E.00434
G1 X79.397 Y80.894 E.00347
; LINE_WIDTH: 0.402708
G1 X79.516 Y80.645 E.00346
G1 X79.723 Y80.463 E.00346
G1 X79.979 Y80.377 E.0034
; LINE_WIDTH: 0.402168
G1 X80.014 Y80.38 E.00044
; WIPE_START
G1 F12000
M204 S6000
G1 X80.23 Y80.396 E-.08241
G1 X80.501 Y80.52 E-.11319
G1 X80.662 Y80.703 E-.09241
G1 X80.756 Y80.961 E-.10449
G1 X80.721 Y81.299 E-.12914
G1 X80.546 Y81.566 E-.12107
G1 X80.279 Y81.72 E-.11729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.48
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 91/99
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
; OBJECT_ID: 15
M73 P92 R1
G1 X77.9 Y84.156 F42000
G1 Z7.48
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.505758
M106 S255
G1 F600
M204 S5000
G1 X78.044 Y84.156 E.0023
G1 X78.044 Y84.844 E.01097
G1 X77.9 Y84.844 E.0023
M106 S201.45
; FEATURE: Inner wall
G1 F658.269
M204 S6000
G1 X77.883 Y84.844 E.00027
G1 F771.319
G1 X77.853 Y84.844 E.00049
G1 F893.323
G1 X77.822 Y84.844 E.00049
G1 F1024.236
G1 X77.792 Y84.844 E.00049
G1 F1164.144
G1 X77.761 Y84.844 E.00049
G1 F1313.006
G1 X77.731 Y84.844 E.00049
G1 F1344.643
G1 X77.7 Y84.844 E.00049
G1 X77.672 Y84.864 E.00055
G1 X77.644 Y84.892 E.00062
G1 X77.617 Y84.919 E.00062
G1 X77.589 Y84.947 E.00062
G1 F2123
G1 X77.561 Y84.974 E.00062
G1 X77.556 Y84.042 E.01485
G1 X77.561 Y84.047 E.00012
G1 X77.589 Y84.07 E.00057
G1 X77.617 Y84.093 E.00057
G1 X77.644 Y84.116 E.00057
G1 X77.672 Y84.139 E.00057
G2 X77.7 Y84.156 I.024 J-.009 E.00057
G1 X77.731 Y84.156 E.00049
G1 X77.761 Y84.156 E.00049
G1 X77.792 Y84.156 E.00049
G1 X77.822 Y84.156 E.00049
G1 X77.84 Y84.156 E.00028
; WIPE_START
G1 F3600
G1 X78.044 Y84.156 E-.07763
G1 X78.044 Y84.844 E-.26167
G1 X77.9 Y84.844 E-.05483
G1 X77.883 Y84.844 E-.00637
G1 X77.853 Y84.844 E-.01161
G1 X77.822 Y84.844 E-.01161
G1 X77.792 Y84.844 E-.0116
G1 X77.761 Y84.844 E-.01161
G1 X77.731 Y84.844 E-.01161
G1 X77.7 Y84.844 E-.01161
G1 X77.672 Y84.864 E-.01315
G1 X77.644 Y84.892 E-.0148
G1 X77.617 Y84.919 E-.0148
G1 X77.589 Y84.947 E-.0148
G1 X77.561 Y84.974 E-.0148
G1 X77.558 Y84.402 E-.21751
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.88 I.391 J1.152 P1  F42000
G1 X102.188 Y76.038 Z7.88
G1 Z7.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.405618
G1 F2123
M204 S5000
G1 X102.26 Y76.087 E.0011
G1 X102.428 Y76.35 E.00396
; LINE_WIDTH: 0.408098
G1 X102.503 Y76.665 E.00413
G1 X102.504 Y78.665 E.02548
; LINE_WIDTH: 0.407698
G1 X102.504 Y78.759 E.00119
; LINE_WIDTH: 0.408778
G1 X102.487 Y78.776 E.00031
; LINE_WIDTH: 0.409868
G1 X102.471 Y78.794 E.00031
; LINE_WIDTH: 0.410968
G1 X102.455 Y78.812 E.00031
; LINE_WIDTH: 0.412058
G1 X102.438 Y78.83 E.00031
; LINE_WIDTH: 0.413158
G1 X102.422 Y78.848 E.00031
; LINE_WIDTH: 0.414248
G1 X102.405 Y78.866 E.00031
; LINE_WIDTH: 0.415348
G1 X102.389 Y78.884 E.00032
; LINE_WIDTH: 0.416438
G1 X102.372 Y78.902 E.00032
; LINE_WIDTH: 0.417538
G1 X102.356 Y78.92 E.00032
; LINE_WIDTH: 0.418628
G1 X102.339 Y78.937 E.00032
; LINE_WIDTH: 0.419728
G1 X102.323 Y78.955 E.00032
; LINE_WIDTH: 0.419998
G1 X102.3 Y78.96 E.00031
G1 X102.275 Y78.96 E.00033
G1 X102.25 Y78.96 E.00033
G1 X102.224 Y78.96 E.00033
G1 X102.199 Y78.96 E.00033
G1 F984.366
G1 X102.174 Y78.96 E.00033
G1 F877.942
G1 X102.149 Y78.96 E.00033
G1 F777.604
G1 X102.124 Y78.96 E.00033
G1 F683.39
G1 X102.1 Y78.96 E.00031
; FEATURE: Overhang wall
M106 S255
G1 F600
G1 X101.51 Y78.96 E.00775
G1 X101.51 Y80.04 E.01418
G1 X102.1 Y80.04 E.00775
M106 S201.45
; FEATURE: Outer wall
G1 F683.354
G1 X102.124 Y80.04 E.00031
G1 F777.566
G1 X102.149 Y80.04 E.00033
G1 F877.901
G1 X102.174 Y80.04 E.00033
G1 F984.322
G1 X102.199 Y80.04 E.00033
G1 F1096.785
G1 X102.224 Y80.04 E.00033
G1 F1215.377
G1 X102.25 Y80.04 E.00033
G1 F1340.057
G1 X102.275 Y80.04 E.00033
G1 F1470.823
G1 X102.3 Y80.04 E.00033
G1 F1593.776
G1 X102.32 Y80.051 E.0003
; LINE_WIDTH: 0.419308
G1 F1729.682
G1 X102.336 Y80.069 E.00032
; LINE_WIDTH: 0.418248
G1 F1871.105
G1 X102.353 Y80.086 E.00031
; LINE_WIDTH: 0.417198
G1 F2018.13
G1 X102.37 Y80.103 E.00031
; LINE_WIDTH: 0.416138
G1 F2123
G1 X102.387 Y80.12 E.00031
; LINE_WIDTH: 0.415078
G1 X102.403 Y80.138 E.00031
; LINE_WIDTH: 0.414028
G1 X102.42 Y80.155 E.00031
; LINE_WIDTH: 0.412968
G1 X102.437 Y80.172 E.00031
; LINE_WIDTH: 0.411908
G1 X102.454 Y80.19 E.00031
; LINE_WIDTH: 0.410858
G1 X102.47 Y80.207 E.00031
; LINE_WIDTH: 0.409798
G1 X102.487 Y80.224 E.00031
; LINE_WIDTH: 0.408738
G1 X102.504 Y80.241 E.00031
; LINE_WIDTH: 0.407678
G1 X102.504 Y80.641 E.00509
G1 X102.504 Y81.041 E.00509
G1 X102.504 Y97.759 E.21279
; LINE_WIDTH: 0.408768
G1 X102.487 Y97.776 E.00031
; LINE_WIDTH: 0.409868
G1 X102.471 Y97.794 E.00031
; LINE_WIDTH: 0.410958
G1 X102.455 Y97.812 E.00031
; LINE_WIDTH: 0.412058
G1 X102.438 Y97.83 E.00031
; LINE_WIDTH: 0.413148
G1 X102.422 Y97.848 E.00031
; LINE_WIDTH: 0.414248
G1 X102.405 Y97.866 E.00031
; LINE_WIDTH: 0.415348
G1 X102.389 Y97.884 E.00032
; LINE_WIDTH: 0.416438
G1 X102.372 Y97.902 E.00032
; LINE_WIDTH: 0.417538
G1 X102.356 Y97.92 E.00032
; LINE_WIDTH: 0.418628
G1 X102.339 Y97.937 E.00032
; LINE_WIDTH: 0.419728
G1 X102.323 Y97.955 E.00032
; LINE_WIDTH: 0.419998
G1 X102.3 Y97.96 E.00031
G1 X102.275 Y97.96 E.00033
G1 X102.25 Y97.96 E.00033
G1 X102.224 Y97.96 E.00033
G1 X102.199 Y97.96 E.00033
G1 F984.366
G1 X102.174 Y97.96 E.00033
G1 F877.942
G1 X102.149 Y97.96 E.00033
G1 F777.604
G1 X102.124 Y97.96 E.00033
G1 F683.39
G1 X102.1 Y97.96 E.00031
; FEATURE: Overhang wall
M106 S255
G1 F600
G1 X101.51 Y97.96 E.00775
G1 X101.51 Y99.04 E.01418
G1 X102.1 Y99.04 E.00775
M106 S201.45
; FEATURE: Outer wall
G1 F683.354
G1 X102.124 Y99.04 E.00031
G1 F777.566
G1 X102.149 Y99.04 E.00033
G1 F877.901
G1 X102.174 Y99.04 E.00033
G1 F984.322
G1 X102.199 Y99.04 E.00033
G1 F1096.785
G1 X102.224 Y99.04 E.00033
G1 F1215.377
G1 X102.25 Y99.04 E.00033
G1 F1340.057
G1 X102.275 Y99.04 E.00033
G1 F1470.823
G1 X102.3 Y99.04 E.00033
G1 F1593.804
G1 X102.32 Y99.051 E.0003
; LINE_WIDTH: 0.419308
G1 F1729.711
G1 X102.336 Y99.069 E.00032
; LINE_WIDTH: 0.418248
G1 F1871.137
G1 X102.353 Y99.086 E.00031
; LINE_WIDTH: 0.417198
G1 F2018.118
G1 X102.37 Y99.103 E.00031
; LINE_WIDTH: 0.416138
G1 F2123
G1 X102.387 Y99.121 E.00031
; LINE_WIDTH: 0.415088
G1 X102.403 Y99.138 E.00031
; LINE_WIDTH: 0.414028
G1 X102.42 Y99.155 E.00031
; LINE_WIDTH: 0.412968
G1 X102.437 Y99.172 E.00031
; LINE_WIDTH: 0.411918
G1 X102.454 Y99.19 E.00031
; LINE_WIDTH: 0.410858
G1 X102.47 Y99.207 E.00031
; LINE_WIDTH: 0.409808
G1 X102.487 Y99.224 E.00031
; LINE_WIDTH: 0.408748
G1 X102.504 Y99.241 E.00031
; LINE_WIDTH: 0.407888
G1 X102.504 Y99.641 E.00509
G1 X102.504 Y100.041 E.00509
G1 X102.504 Y101.241 E.01528
; LINE_WIDTH: 0.408088
G1 X102.503 Y103.335 E.02667
; LINE_WIDTH: 0.411578
G1 X102.452 Y103.584 E.00328
G1 X102.271 Y103.9 E.00467
; LINE_WIDTH: 0.408568
G1 X101.994 Y104.111 E.00445
; LINE_WIDTH: 0.410248
G1 X101.58 Y104.202 E.00543
G1 X99.58 Y104.202 E.02562
; LINE_WIDTH: 0.410078
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409908
G1 X95.58 Y104.203 E.0256
; LINE_WIDTH: 0.409748
G1 X93.58 Y104.203 E.02559
; LINE_WIDTH: 0.409578
G1 X91.58 Y104.203 E.02558
; LINE_WIDTH: 0.409408
G1 X89.58 Y104.203 E.02557
; LINE_WIDTH: 0.409248
G1 X87.58 Y104.204 E.02556
; LINE_WIDTH: 0.409078
G1 X85.58 Y104.204 E.02555
; LINE_WIDTH: 0.408908
G1 X83.58 Y104.204 E.02554
; LINE_WIDTH: 0.408748
G1 X81.741 Y104.204 E.02347
; LINE_WIDTH: 0.409568
G1 X81.724 Y104.188 E.00031
; LINE_WIDTH: 0.410548
G1 X81.707 Y104.171 E.00031
; LINE_WIDTH: 0.411528
G1 X81.69 Y104.154 E.00031
; LINE_WIDTH: 0.412508
G1 X81.672 Y104.137 E.00031
; LINE_WIDTH: 0.413478
G1 X81.655 Y104.12 E.00031
; LINE_WIDTH: 0.414458
G1 X81.638 Y104.104 E.00031
; LINE_WIDTH: 0.415438
G1 X81.621 Y104.087 E.00031
; LINE_WIDTH: 0.416418
G1 X81.603 Y104.07 E.00031
; LINE_WIDTH: 0.417388
G1 X81.586 Y104.053 E.00031
; LINE_WIDTH: 0.418368
G1 X81.569 Y104.036 E.00031
; LINE_WIDTH: 0.419348
G1 X81.551 Y104.02 E.00032
; LINE_WIDTH: 0.419998
G1 X81.54 Y104 E.0003
G1 X81.54 Y103.975 E.00033
G1 X81.54 Y103.95 E.00033
G1 X81.54 Y103.924 E.00033
G1 X81.54 Y103.899 E.00033
G1 F984.366
G1 X81.54 Y103.874 E.00033
G1 F877.942
G1 X81.54 Y103.849 E.00033
G1 F777.604
G1 X81.54 Y103.824 E.00033
G1 F683.39
G1 X81.54 Y103.8 E.00031
; FEATURE: Overhang wall
M106 S255
G1 F600
G1 X81.54 Y103.01 E.01037
G1 X80.46 Y103.01 E.01418
G1 X80.46 Y103.8 E.01037
M106 S201.45
; FEATURE: Outer wall
G1 F683.354
G1 X80.46 Y103.824 E.00031
G1 F777.566
G1 X80.46 Y103.849 E.00033
G1 F877.901
G1 X80.46 Y103.874 E.00033
G1 F984.322
G1 X80.46 Y103.899 E.00033
G1 F1096.785
G1 X80.46 Y103.924 E.00033
G1 F1215.377
G1 X80.46 Y103.95 E.00033
G1 F1340.057
G1 X80.46 Y103.975 E.00033
G1 F1470.823
G1 X80.46 Y104 E.00033
G1 F1588.551
G1 X80.451 Y104.02 E.00029
; LINE_WIDTH: 0.419528
G1 F1712.306
G1 X80.436 Y104.036 E.00029
; LINE_WIDTH: 0.418798
G1 F1840.656
G1 X80.422 Y104.053 E.00029
; LINE_WIDTH: 0.418078
G1 F1973.692
G1 X80.407 Y104.07 E.00029
; LINE_WIDTH: 0.417358
G1 F2111.411
G1 X80.393 Y104.086 E.00029
; LINE_WIDTH: 0.416628
G1 F2123
G1 X80.379 Y104.103 E.00029
; LINE_WIDTH: 0.415908
G1 X80.364 Y104.12 E.00029
; LINE_WIDTH: 0.415178
G1 X80.35 Y104.136 E.00029
; LINE_WIDTH: 0.414458
G1 X80.336 Y104.153 E.00028
; LINE_WIDTH: 0.413738
G1 X80.321 Y104.169 E.00028
; LINE_WIDTH: 0.413008
G1 X80.307 Y104.186 E.00028
; LINE_WIDTH: 0.412288
G1 X80.293 Y104.203 E.00028
; LINE_WIDTH: 0.411558
G1 X80.259 Y104.204 E.00044
; LINE_WIDTH: 0.408588
G1 X79.859 Y104.204 E.0051
G1 X79.459 Y104.204 E.0051
G1 X78.424 Y104.204 E.0132
G1 X78.103 Y104.148 E.00416
; LINE_WIDTH: 0.405038
G1 X77.798 Y103.967 E.00449
; LINE_WIDTH: 0.406688
G1 X77.569 Y103.646 E.005
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.28 E.00477
G1 X77.496 Y85.491 E.22695
; LINE_WIDTH: 0.409558
G1 X77.512 Y85.474 E.00031
; LINE_WIDTH: 0.410538
G1 X77.529 Y85.457 E.00031
; LINE_WIDTH: 0.411518
G1 X77.546 Y85.44 E.00031
; LINE_WIDTH: 0.412498
G1 X77.563 Y85.422 E.00031
; LINE_WIDTH: 0.413478
G1 X77.58 Y85.405 E.00031
; LINE_WIDTH: 0.414458
G1 X77.596 Y85.388 E.00031
; LINE_WIDTH: 0.415438
G1 X77.613 Y85.371 E.00031
; LINE_WIDTH: 0.416408
G1 X77.63 Y85.353 E.00031
; LINE_WIDTH: 0.417388
G1 X77.647 Y85.336 E.00031
; LINE_WIDTH: 0.418368
G1 X77.664 Y85.319 E.00031
; LINE_WIDTH: 0.419348
G1 X77.68 Y85.301 E.00032
; LINE_WIDTH: 0.419998
G1 X77.7 Y85.29 E.0003
G1 X77.725 Y85.29 E.00033
G1 X77.75 Y85.29 E.00033
G1 X77.776 Y85.29 E.00033
G1 X77.801 Y85.29 E.00033
G1 F984.366
G1 X77.826 Y85.29 E.00033
G1 F877.942
G1 X77.851 Y85.29 E.00033
G1 F777.604
G1 X77.876 Y85.29 E.00033
G1 F683.39
G1 X77.9 Y85.29 E.00031
; FEATURE: Overhang wall
M106 S255
G1 F600
G1 X78.49 Y85.29 E.00775
G1 X78.49 Y83.71 E.02075
G1 X77.9 Y83.71 E.00775
M106 S201.45
; FEATURE: Outer wall
G1 F683.354
G1 X77.876 Y83.71 E.00031
G1 F777.566
G1 X77.851 Y83.71 E.00033
G1 F877.901
G1 X77.826 Y83.71 E.00033
G1 F984.322
G1 X77.801 Y83.71 E.00033
G1 F1096.785
G1 X77.776 Y83.71 E.00033
G1 F1215.377
G1 X77.75 Y83.71 E.00033
G1 F1340.057
G1 X77.725 Y83.71 E.00033
G1 F1470.823
G1 X77.7 Y83.71 E.00033
G1 F1593.919
G1 X77.68 Y83.699 E.0003
; LINE_WIDTH: 0.419358
G1 F1729.992
G1 X77.664 Y83.681 E.00032
; LINE_WIDTH: 0.418378
G1 F1871.553
G1 X77.647 Y83.664 E.00031
; LINE_WIDTH: 0.417398
G1 F2018.768
G1 X77.63 Y83.647 E.00031
; LINE_WIDTH: 0.416418
G1 F2123
G1 X77.613 Y83.63 E.00031
; LINE_WIDTH: 0.415448
G1 X77.596 Y83.612 E.00031
; LINE_WIDTH: 0.414468
G1 X77.58 Y83.595 E.00031
; LINE_WIDTH: 0.413488
G1 X77.563 Y83.578 E.00031
; LINE_WIDTH: 0.412508
G1 X77.546 Y83.56 E.00031
; LINE_WIDTH: 0.411528
G1 X77.529 Y83.543 E.00031
; LINE_WIDTH: 0.410548
G1 X77.513 Y83.526 E.00031
; LINE_WIDTH: 0.409568
G1 X77.496 Y83.509 E.00031
; LINE_WIDTH: 0.408588
G1 X77.496 Y83.109 E.0051
G1 X77.496 Y82.709 E.0051
G1 X77.499 Y76.671 E.07703
; LINE_WIDTH: 0.405648
G1 X77.552 Y76.403 E.00346
; LINE_WIDTH: 0.404048
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.408308
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410258
G1 X78.42 Y75.798 E.00539
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.410038
G1 X82.42 Y75.798 E.02561
; LINE_WIDTH: 0.409828
G1 X84.42 Y75.798 E.0256
; LINE_WIDTH: 0.409608
G1 X86.42 Y75.798 E.02558
; LINE_WIDTH: 0.409398
G1 X88.42 Y75.797 E.02557
; LINE_WIDTH: 0.409178
G1 X90.42 Y75.797 E.02555
; LINE_WIDTH: 0.408968
G1 X92.42 Y75.797 E.02554
; LINE_WIDTH: 0.408748
G1 X94.42 Y75.797 E.02553
; LINE_WIDTH: 0.408538
G1 X96.42 Y75.797 E.02551
; LINE_WIDTH: 0.408318
G1 X98.42 Y75.796 E.0255
; LINE_WIDTH: 0.408108
G1 X100.42 Y75.796 E.02549
; LINE_WIDTH: 0.407888
G1 X101.6 Y75.796 E.01503
; LINE_WIDTH: 0.407768
G1 X101.942 Y75.869 E.00445
; LINE_WIDTH: 0.405618
G1 X102.139 Y76.004 E.00302
M204 S250
G1 X102.354 Y75.666 F42000
; LINE_WIDTH: 0.414818
G1 F2123
M204 S5000
G1 X102.487 Y75.772 E.00221
; LINE_WIDTH: 0.406808
G1 X102.769 Y76.144 E.00593
; LINE_WIDTH: 0.408338
G1 X102.894 Y76.646 E.00659
G1 X102.894 Y76.665 E.00024
; LINE_WIDTH: 0.408098
G1 X102.894 Y78.665 E.02548
; LINE_WIDTH: 0.407698
G1 X102.894 Y78.758 E.00119
; LINE_WIDTH: 0.410638
G1 X102.893 Y78.827 E.00087
; LINE_WIDTH: 0.419998
G2 X102.894 Y80.241 I46.363 J.659 E.01858
; LINE_WIDTH: 0.407678
G1 X102.894 Y97.759 E.22297
; LINE_WIDTH: 0.410628
G1 X102.893 Y97.827 E.00087
; LINE_WIDTH: 0.419998
G2 X102.894 Y99.242 I46.41 J.659 E.01858
; LINE_WIDTH: 0.407888
G1 X102.894 Y101.241 E.02547
; LINE_WIDTH: 0.408088
G1 X102.894 Y103.335 E.02667
; LINE_WIDTH: 0.411578
G1 X102.816 Y103.738 E.00528
G1 X102.586 Y104.128 E.00582
; LINE_WIDTH: 0.403058
G1 X102.257 Y104.404 E.0054
; LINE_WIDTH: 0.411608
G1 X101.876 Y104.56 E.0053
G1 X101.59 Y104.595 E.00371
; LINE_WIDTH: 0.410248
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410078
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409908
G1 X95.59 Y104.595 E.0256
; LINE_WIDTH: 0.409748
G1 X93.59 Y104.595 E.02559
; LINE_WIDTH: 0.409578
G1 X91.59 Y104.595 E.02558
; LINE_WIDTH: 0.409408
G1 X89.59 Y104.595 E.02557
; LINE_WIDTH: 0.409248
G1 X87.59 Y104.595 E.02556
; LINE_WIDTH: 0.409078
G1 X85.59 Y104.596 E.02555
; LINE_WIDTH: 0.408908
G1 X83.59 Y104.596 E.02554
; LINE_WIDTH: 0.408748
G1 X81.741 Y104.596 E.02359
; LINE_WIDTH: 0.419998
G1 X81.741 Y104.59 E.00007
G2 X80.259 Y104.596 I-.372 J96.105 E.01947
; LINE_WIDTH: 0.408588
G1 X78.424 Y104.596 E.0234
G1 X78.114 Y104.559 E.00399
; LINE_WIDTH: 0.412618
G1 X77.768 Y104.422 E.00479
; LINE_WIDTH: 0.413538
G1 X77.466 Y104.185 E.00496
G1 X77.206 Y103.787 E.00615
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00648
G1 X77.104 Y85.491 E.22707
; LINE_WIDTH: 0.419998
G2 X77.104 Y83.509 I-82.401 J-.991 E.02604
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.725 E.08655
G1 X77.141 Y76.414 E.00399
; LINE_WIDTH: 0.412638
G1 X77.278 Y76.068 E.00479
G1 X77.457 Y75.829 E.00385
; LINE_WIDTH: 0.404048
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411528
G1 X78.124 Y75.44 E.00526
G1 X78.41 Y75.405 E.00371
; LINE_WIDTH: 0.410258
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410038
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409828
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409608
G1 X86.41 Y75.405 E.02558
; LINE_WIDTH: 0.409398
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409178
G1 X90.41 Y75.405 E.02555
; LINE_WIDTH: 0.408968
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408748
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408538
G1 X96.41 Y75.405 E.02551
; LINE_WIDTH: 0.408318
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408108
G1 X100.41 Y75.406 E.02549
; LINE_WIDTH: 0.407888
G1 X101.6 Y75.406 E.01515
; LINE_WIDTH: 0.408068
G1 X101.938 Y75.455 E.00435
; LINE_WIDTH: 0.414818
G1 X102.29 Y75.614 E.00501
G1 X102.307 Y75.628 E.00028
; WIPE_START
G1 F12000
M204 S6000
G1 X102.487 Y75.772 E-.08763
G1 X102.769 Y76.144 E-.17737
G1 X102.894 Y76.646 E-.19647
G1 X102.894 Y76.665 E-.0073
G1 X102.894 Y77.432 E-.29122
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.347 Y79.5 Z7.88 F42000
G1 Z7.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696388
M204 S6000
G1 X102.342 Y79.5 E.00011
; LINE_WIDTH: 0.696838
G1 X102.3 Y79.5 E.00094
; LINE_WIDTH: 0.697278
G1 X102.257 Y79.5 E.00094
; LINE_WIDTH: 0.697718
G1 X102.215 Y79.5 E.00094
; LINE_WIDTH: 0.698158
G1 X102.172 Y79.5 E.00094
; LINE_WIDTH: 0.698598
G1 X102.13 Y79.5 E.00095
; LINE_WIDTH: 0.698908
G1 X102.1 Y79.5 E.00066
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X102.05 Y79.5 E.00111
M106 S201.45
; WIPE_START
M204 S6000
G1 X102.1 Y79.5 E-.12786
G1 X102.13 Y79.5 E-.07557
G1 X102.172 Y79.5 E-.10889
G1 X102.215 Y79.5 E-.10886
G1 X102.257 Y79.5 E-.10889
G1 X102.3 Y79.5 E-.10889
G1 X102.342 Y79.5 E-.10889
G1 X102.347 Y79.5 E-.01215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.88 I-1.217 J0 P1  F42000
G1 X102.347 Y98.5 Z7.88
G1 Z7.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696388
M204 S6000
G1 X102.342 Y98.5 E.00011
; LINE_WIDTH: 0.696838
G1 X102.3 Y98.5 E.00094
; LINE_WIDTH: 0.697278
G1 X102.257 Y98.5 E.00094
; LINE_WIDTH: 0.697718
G1 X102.215 Y98.5 E.00094
; LINE_WIDTH: 0.698158
G1 X102.172 Y98.5 E.00094
; LINE_WIDTH: 0.698598
G1 X102.13 Y98.5 E.00095
; LINE_WIDTH: 0.698908
G1 X102.1 Y98.5 E.00066
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X102.05 Y98.5 E.00111
M106 S201.45
; WIPE_START
M204 S6000
G1 X102.1 Y98.5 E-.12786
G1 X102.13 Y98.5 E-.07557
G1 X102.172 Y98.5 E-.10889
G1 X102.215 Y98.5 E-.10886
G1 X102.257 Y98.5 E-.10889
G1 X102.3 Y98.5 E-.10889
G1 X102.342 Y98.5 E-.10889
G1 X102.347 Y98.5 E-.01215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.88 I-.306 J-1.178 P1  F42000
G1 X81 Y104.049 Z7.88
G1 Z7.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696528
M204 S6000
G1 X81 Y104.042 E.00014
; LINE_WIDTH: 0.696438
G1 X81 Y104 E.00094
; LINE_WIDTH: 0.695908
G1 X81 Y103.958 E.00094
; LINE_WIDTH: 0.695368
G1 X81 Y103.916 E.00094
; LINE_WIDTH: 0.694828
G1 X81 Y103.873 E.00093
; LINE_WIDTH: 0.694298
G1 X81 Y103.831 E.00093
; LINE_WIDTH: 0.693758
G1 X81 Y103.8 E.00068
; FEATURE: Overhang wall
; LINE_WIDTH: 0.694348
M106 S255
G1 F3000
M204 S5000
G1 X81 Y103.55 E.00552
M106 S201.45
; WIPE_START
M204 S6000
G1 X81 Y103.8 E-.38084
G1 X81 Y103.831 E-.04718
G1 X81 Y103.873 E-.06444
G1 X81 Y103.916 E-.06445
G1 X81 Y103.958 E-.06444
G1 X81 Y104 E-.06444
G1 X81 Y104.042 E-.06444
G1 X81 Y104.049 E-.00978
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.88 I1.216 J-.044 P1  F42000
G1 X80.146 Y80.388 Z7.88
G1 Z7.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392788
G1 F2123
M204 S5000
G1 X80.415 Y80.463 E.00342
; LINE_WIDTH: 0.399008
G1 X80.657 Y80.692 E.00415
; LINE_WIDTH: 0.408348
G1 X80.754 Y80.962 E.00366
G1 X80.761 Y81.074 E.00144
; LINE_WIDTH: 0.387608
G1 X80.682 Y81.38 E.00382
G1 X80.502 Y81.603 E.00346
; LINE_WIDTH: 0.385748
G1 X80.259 Y81.729 E.00328
G1 X79.987 Y81.75 E.00329
; LINE_WIDTH: 0.390848
G1 X79.726 Y81.666 E.00334
G1 X79.52 Y81.484 E.00334
; LINE_WIDTH: 0.388208
G1 X79.401 Y81.238 E.00331
; LINE_WIDTH: 0.404568
G1 X79.398 Y80.894 E.00434
G1 X79.537 Y80.621 E.00387
; LINE_WIDTH: 0.393148
G1 X79.802 Y80.427 E.00403
; LINE_WIDTH: 0.384828
G1 X80.086 Y80.391 E.00343
; WIPE_START
G1 F12000
M204 S6000
G1 X80.415 Y80.463 E-.1277
G1 X80.657 Y80.692 E-.12663
G1 X80.754 Y80.962 E-.10898
G1 X80.761 Y81.074 E-.04279
G1 X80.682 Y81.38 E-.12022
G1 X80.502 Y81.603 E-.1089
G1 X80.259 Y81.729 E-.10386
G1 X80.204 Y81.733 E-.02092
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.88 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.56
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 92/99
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
; OBJECT_ID: 15
G1 X77.556 Y84.042 F42000
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.505758
G1 F1883
M204 S6000
G1 X77.691 Y84.156 E.00282
G1 X78.044 Y84.156 E.00562
G1 X78.044 Y84.844 E.01097
G1 X77.691 Y84.844 E.00562
G1 X77.556 Y84.98 E.00306
G1 X77.556 Y84.102 E.01399
; WIPE_START
G1 F18000
G1 X77.691 Y84.156 E-.0555
G1 X78.044 Y84.156 E-.13409
G1 X78.044 Y84.844 E-.26167
G1 X77.691 Y84.844 E-.13409
G1 X77.556 Y84.98 E-.07294
G1 X77.556 Y84.712 E-.1017
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I-.589 J1.065 P1  F42000
G1 X101.51 Y97.96 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1883
M204 S5000
G1 X101.51 Y99.04 E.01418
G1 X102.309 Y99.04 E.01049
G1 X102.504 Y99.241 E.00369
; LINE_WIDTH: 0.408708
G1 X102.504 Y101.241 E.02552
; LINE_WIDTH: 0.408978
G1 X102.504 Y103.241 E.02554
G3 X102.461 Y103.56 I-1.087 J.017 E.00412
; LINE_WIDTH: 0.410548
G1 X102.248 Y103.921 E.00538
G1 X101.993 Y104.109 E.00407
; LINE_WIDTH: 0.405918
G1 X101.669 Y104.2 E.00426
; LINE_WIDTH: 0.410258
G3 X99.581 Y104.202 I-1.093 J-42.468 E.02676
; LINE_WIDTH: 0.410008
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409768
G1 X95.581 Y104.202 E.02559
; LINE_WIDTH: 0.409518
M73 P93 R1
G1 X93.581 Y104.203 E.02558
; LINE_WIDTH: 0.409278
G1 X91.581 Y104.203 E.02556
; LINE_WIDTH: 0.409028
G1 X89.581 Y104.203 E.02555
; LINE_WIDTH: 0.408788
G1 X87.581 Y104.203 E.02553
; LINE_WIDTH: 0.408538
G1 X85.581 Y104.203 E.02551
; LINE_WIDTH: 0.408298
G1 X83.581 Y104.204 E.0255
; LINE_WIDTH: 0.408048
G1 X81.741 Y104.204 E.02343
; LINE_WIDTH: 0.419998
G1 X81.54 Y104.009 E.00368
G1 X81.54 Y103.01 E.01311
G1 X80.46 Y103.01 E.01418
G1 X80.46 Y104.009 E.01311
G1 X80.293 Y104.202 E.00336
; LINE_WIDTH: 0.410728
G1 X80.259 Y104.204 E.00044
; LINE_WIDTH: 0.407758
G1 X78.4 Y104.204 E.02366
; LINE_WIDTH: 0.408228
G1 X78.102 Y104.15 E.00386
G1 X77.802 Y103.97 E.00446
; LINE_WIDTH: 0.410828
G1 X77.578 Y103.661 E.0049
G1 X77.498 Y103.29 E.00487
; LINE_WIDTH: 0.410298
G1 X77.498 Y101.29 E.02563
; LINE_WIDTH: 0.410098
G1 X77.498 Y99.29 E.02562
; LINE_WIDTH: 0.409908
G1 X77.497 Y97.29 E.0256
; LINE_WIDTH: 0.409718
G1 X77.497 Y95.29 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y93.29 E.02558
; LINE_WIDTH: 0.409328
G1 X77.497 Y91.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y89.29 E.02555
; LINE_WIDTH: 0.408948
G1 X77.496 Y87.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y85.491 E.02296
; LINE_WIDTH: 0.419998
G1 X77.691 Y85.29 E.00369
G1 X78.49 Y85.29 E.01049
G1 X78.49 Y83.71 E.02075
G1 X77.691 Y83.71 E.01049
G1 X77.496 Y83.509 E.00369
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.08656
G1 X77.552 Y76.404 E.00415
; LINE_WIDTH: 0.404078
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.408158
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410258
G1 X78.419 Y75.798 E.00538
G1 X80.419 Y75.798 E.02563
; LINE_WIDTH: 0.410038
G1 X82.419 Y75.798 E.02561
; LINE_WIDTH: 0.409818
G1 X84.419 Y75.798 E.0256
; LINE_WIDTH: 0.409608
G1 X86.419 Y75.798 E.02558
; LINE_WIDTH: 0.409388
G1 X88.419 Y75.797 E.02557
; LINE_WIDTH: 0.409178
G1 X90.419 Y75.797 E.02555
; LINE_WIDTH: 0.408958
G1 X92.419 Y75.797 E.02554
; LINE_WIDTH: 0.408748
G1 X94.419 Y75.797 E.02553
; LINE_WIDTH: 0.408528
G1 X96.419 Y75.797 E.02551
; LINE_WIDTH: 0.408308
G1 X98.419 Y75.796 E.0255
; LINE_WIDTH: 0.408098
G1 X100.419 Y75.796 E.02548
; LINE_WIDTH: 0.407878
G1 X101.6 Y75.796 E.01504
; LINE_WIDTH: 0.407758
G1 X101.938 Y75.867 E.0044
; LINE_WIDTH: 0.405328
G1 X102.237 Y76.065 E.00454
; LINE_WIDTH: 0.405588
G1 X102.444 Y76.386 E.00483
; LINE_WIDTH: 0.408098
G1 X102.503 Y76.665 E.00363
G1 X102.504 Y78.665 E.02548
; LINE_WIDTH: 0.407758
G1 X102.504 Y78.759 E.00119
; LINE_WIDTH: 0.419998
G1 X102.319 Y78.96 E.00359
G1 X101.51 Y78.96 E.01062
G1 X101.51 Y80.04 E.01418
G1 X102.309 Y80.04 E.01049
G1 X102.504 Y80.241 E.00368
; LINE_WIDTH: 0.407858
G1 X102.504 Y84.241 E.05094
; LINE_WIDTH: 0.407998
G1 X102.504 Y88.241 E.05096
; LINE_WIDTH: 0.408138
G1 X102.504 Y92.241 E.05097
; LINE_WIDTH: 0.408268
G1 X102.504 Y96.241 E.05099
; LINE_WIDTH: 0.408398
G1 X102.504 Y97.759 E.01935
; LINE_WIDTH: 0.419998
G1 X102.319 Y97.96 E.00359
G1 X101.57 Y97.96 E.00984
; WIPE_START
G1 F12000
M204 S6000
G1 X101.51 Y99.04 E-.41105
G1 X102.309 Y99.04 E-.30346
G1 X102.392 Y99.126 E-.04549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I1.217 J-.002 P1  F42000
G1 X102.355 Y75.667 Z7.96
G1 Z7.56
G1 E.8 F1800
; LINE_WIDTH: 0.412768
G1 F1883
M204 S5000
G1 X102.513 Y75.797 E.00263
; LINE_WIDTH: 0.406748
G1 X102.782 Y76.179 E.00594
; LINE_WIDTH: 0.408338
G1 X102.894 Y76.646 E.00612
G1 X102.894 Y76.665 E.00024
; LINE_WIDTH: 0.408098
G1 X102.894 Y78.665 E.02548
; LINE_WIDTH: 0.407758
G1 X102.894 Y78.758 E.00119
; LINE_WIDTH: 0.410698
G1 X102.893 Y78.827 E.00087
; LINE_WIDTH: 0.419998
G2 X102.895 Y80.241 I46.769 J.656 E.01858
; LINE_WIDTH: 0.407858
G1 X102.895 Y84.241 E.05094
; LINE_WIDTH: 0.407998
G1 X102.895 Y88.241 E.05096
; LINE_WIDTH: 0.408138
G1 X102.895 Y92.241 E.05097
; LINE_WIDTH: 0.408268
G1 X102.895 Y96.241 E.05099
; LINE_WIDTH: 0.408398
G1 X102.895 Y97.759 E.01935
; LINE_WIDTH: 0.411348
G1 X102.894 Y97.827 E.00087
; LINE_WIDTH: 0.419998
G2 X102.896 Y99.241 I49.851 J.653 E.01858
; LINE_WIDTH: 0.408708
G1 X102.896 Y101.241 E.02552
; LINE_WIDTH: 0.408978
G1 X102.896 Y103.241 E.02554
G3 X102.864 Y103.553 I-1.407 J.017 E.00401
; LINE_WIDTH: 0.415278
G3 X102.569 Y104.145 I-1.265 J-.261 E.00869
; LINE_WIDTH: 0.404188
G1 X102.282 Y104.39 E.00476
; LINE_WIDTH: 0.410878
G1 X101.87 Y104.561 E.00572
G1 X101.59 Y104.595 E.00362
; LINE_WIDTH: 0.410258
G1 X99.59 Y104.595 E.02563
; LINE_WIDTH: 0.410008
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409768
G1 X95.59 Y104.595 E.02559
; LINE_WIDTH: 0.409518
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409278
G1 X91.59 Y104.595 E.02556
; LINE_WIDTH: 0.409028
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408788
G1 X87.59 Y104.595 E.02553
; LINE_WIDTH: 0.408538
G1 X85.59 Y104.595 E.02551
; LINE_WIDTH: 0.408298
G1 X83.59 Y104.595 E.0255
; LINE_WIDTH: 0.408048
G1 X81.741 Y104.595 E.02355
; LINE_WIDTH: 0.419998
G1 X81.741 Y104.588 E.00008
G2 X80.259 Y104.594 I-.378 J89.673 E.01947
; LINE_WIDTH: 0.407758
G1 X78.4 Y104.594 E.02366
G1 X78.1 Y104.548 E.00386
; LINE_WIDTH: 0.411188
G1 X77.708 Y104.388 E.00544
; LINE_WIDTH: 0.413118
G1 X77.423 Y104.139 E.00488
G1 X77.206 Y103.795 E.00525
; LINE_WIDTH: 0.410828
G1 X77.105 Y103.295 E.00654
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.295 E.02563
; LINE_WIDTH: 0.410098
G1 X77.105 Y99.295 E.02562
; LINE_WIDTH: 0.409908
G1 X77.105 Y97.295 E.0256
; LINE_WIDTH: 0.409718
G1 X77.105 Y95.295 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y93.295 E.02558
; LINE_WIDTH: 0.409328
G1 X77.105 Y91.295 E.02556
; LINE_WIDTH: 0.409138
G1 X77.104 Y89.295 E.02555
; LINE_WIDTH: 0.408948
G1 X77.104 Y87.295 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y85.491 E.02302
; LINE_WIDTH: 0.419998
G2 X77.104 Y83.509 I-82.401 J-.991 E.02604
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.08656
G1 X77.141 Y76.414 E.00399
; LINE_WIDTH: 0.412628
G1 X77.279 Y76.068 E.0048
G1 X77.457 Y75.829 E.00384
; LINE_WIDTH: 0.404078
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411008
G1 X78.135 Y75.437 E.00539
G1 X78.41 Y75.405 E.00355
; LINE_WIDTH: 0.410258
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410038
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409818
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409608
G1 X86.41 Y75.405 E.02558
; LINE_WIDTH: 0.409388
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409178
G1 X90.41 Y75.405 E.02555
; LINE_WIDTH: 0.408958
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408748
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408528
G1 X96.41 Y75.405 E.02551
; LINE_WIDTH: 0.408308
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408098
G1 X100.41 Y75.406 E.02548
; LINE_WIDTH: 0.407878
G1 X101.6 Y75.406 E.01516
; LINE_WIDTH: 0.408078
G1 X101.938 Y75.455 E.00435
; LINE_WIDTH: 0.412768
G1 X102.291 Y75.614 E.00499
G1 X102.309 Y75.629 E.0003
; WIPE_START
G1 F12000
M204 S6000
G1 X102.513 Y75.797 E-.10028
G1 X102.782 Y76.179 E-.17774
G1 X102.894 Y76.646 E-.18238
G1 X102.894 Y76.665 E-.00718
G1 X102.894 Y77.434 E-.29241
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I-1.127 J-.46 P1  F42000
G1 X102.05 Y79.5 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696368
G1 F1883
M204 S6000
G1 X102.347 Y79.5 E.00658
; WIPE_START
G1 F13250.883
G1 X102.05 Y79.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.05 Y87.132 Z7.96 F42000
G1 X102.05 Y98.5 Z7.96
G1 Z7.56
G1 E.8 F1800
; LINE_WIDTH: 0.696508
G1 F1883
M204 S6000
G1 X102.349 Y98.5 E.00661
; WIPE_START
G1 F13248.152
G1 X102.05 Y98.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I-.31 J-1.177 P1  F42000
G1 X81 Y104.047 Z7.96
G1 Z7.56
G1 E.8 F1800
; LINE_WIDTH: 0.696368
G1 F1883
M204 S6000
G1 X81 Y103.55 E.01101
; WIPE_START
G1 F13250.883
G1 X81 Y104.047 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I1.216 J-.044 P1  F42000
G1 X80.152 Y80.386 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.396708
G1 F1883
M204 S5000
G1 X80.465 Y80.494 E.0041
; LINE_WIDTH: 0.408908
G1 X80.66 Y80.703 E.00364
G1 X80.756 Y80.962 E.00353
; LINE_WIDTH: 0.405268
G1 X80.721 Y81.299 E.00429
; LINE_WIDTH: 0.388688
G1 X80.546 Y81.566 E.00387
; LINE_WIDTH: 0.387628
G1 X80.272 Y81.724 E.00382
; LINE_WIDTH: 0.390808
G1 X79.986 Y81.753 E.00349
G1 X79.727 Y81.665 E.00334
; LINE_WIDTH: 0.388208
G1 X79.52 Y81.484 E.00332
G1 X79.401 Y81.238 E.00331
G1 X79.386 Y80.964 E.00332
; LINE_WIDTH: 0.398428
G1 X79.515 Y80.644 E.00428
G1 X79.802 Y80.427 E.00447
; LINE_WIDTH: 0.384888
G1 X80.093 Y80.392 E.00351
; WIPE_START
G1 F12000
M204 S6000
G1 X80.465 Y80.494 E-.1468
G1 X80.66 Y80.703 E-.10824
G1 X80.756 Y80.962 E-.10492
G1 X80.721 Y81.299 E-.12899
G1 X80.546 Y81.566 E-.12131
G1 X80.272 Y81.724 E-.12014
G1 X80.194 Y81.731 E-.0296
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.64
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 93/99
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
; OBJECT_ID: 15
G1 X77.556 Y84.042 F42000
G1 Z7.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.505758
G1 F1822
M204 S6000
G1 X77.691 Y84.156 E.00282
G1 X78.044 Y84.156 E.00562
G1 X78.044 Y84.844 E.01097
G1 X77.691 Y84.844 E.00562
G1 X77.556 Y84.98 E.00306
G1 X77.556 Y84.102 E.01399
; WIPE_START
G1 F18000
G1 X77.691 Y84.156 E-.0555
M73 P93 R0
G1 X78.044 Y84.156 E-.13409
G1 X78.044 Y84.844 E-.26167
G1 X77.691 Y84.844 E-.13409
G1 X77.556 Y84.98 E-.07294
G1 X77.556 Y84.712 E-.1017
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.04 I-.589 J1.065 P1  F42000
G1 X101.51 Y97.96 Z8.04
G1 Z7.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1822
M204 S5000
G1 X101.51 Y99.04 E.01418
G1 X102.309 Y99.04 E.01049
G1 X102.504 Y99.241 E.00369
; LINE_WIDTH: 0.408708
G1 X102.504 Y101.241 E.02552
; LINE_WIDTH: 0.408978
G1 X102.504 Y103.241 E.02554
G3 X102.461 Y103.56 I-1.087 J.017 E.00412
; LINE_WIDTH: 0.406758
G1 X102.271 Y103.9 E.00495
G1 X101.99 Y104.111 E.00446
; LINE_WIDTH: 0.405368
G1 X101.669 Y104.198 E.00421
; LINE_WIDTH: 0.410258
G1 X99.571 Y104.202 E.02689
; LINE_WIDTH: 0.410008
G1 X97.571 Y104.202 E.02561
; LINE_WIDTH: 0.409758
G1 X95.571 Y104.202 E.02559
; LINE_WIDTH: 0.409518
G1 X93.571 Y104.203 E.02558
; LINE_WIDTH: 0.409268
G1 X91.571 Y104.203 E.02556
; LINE_WIDTH: 0.409028
G1 X89.571 Y104.203 E.02555
; LINE_WIDTH: 0.408778
G1 X87.571 Y104.203 E.02553
; LINE_WIDTH: 0.408538
G1 X85.571 Y104.203 E.02551
; LINE_WIDTH: 0.408288
G1 X83.571 Y104.204 E.0255
; LINE_WIDTH: 0.408048
G1 X81.741 Y104.204 E.02331
; LINE_WIDTH: 0.419998
G1 X81.54 Y104.009 E.00368
G1 X81.54 Y103.01 E.01311
M73 P94 R0
G1 X80.46 Y103.01 E.01418
G1 X80.46 Y104.009 E.01311
G1 X80.293 Y104.202 E.00336
; LINE_WIDTH: 0.410728
G1 X80.259 Y104.204 E.00044
; LINE_WIDTH: 0.407758
G1 X78.4 Y104.204 E.02366
; LINE_WIDTH: 0.408228
G1 X78.102 Y104.151 E.00386
G1 X77.798 Y103.967 E.00453
; LINE_WIDTH: 0.406538
G1 X77.569 Y103.645 E.00501
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00475
G1 X77.496 Y85.491 E.22696
; LINE_WIDTH: 0.419998
G1 X77.691 Y85.29 E.00369
G1 X78.49 Y85.29 E.01049
G1 X78.49 Y83.71 E.02075
G1 X77.8 Y83.71 E.00906
G1 X77.691 Y83.71 E.00143
G1 X77.496 Y83.509 E.00369
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.08656
G1 X77.552 Y76.403 E.00415
; LINE_WIDTH: 0.404308
G1 X77.729 Y76.101 E.00443
; LINE_WIDTH: 0.408258
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.419 Y75.798 E.00538
G1 X80.419 Y75.798 E.02563
; LINE_WIDTH: 0.410058
G1 X82.419 Y75.798 E.02561
; LINE_WIDTH: 0.409838
G1 X84.419 Y75.798 E.0256
; LINE_WIDTH: 0.409618
G1 X86.419 Y75.798 E.02558
; LINE_WIDTH: 0.409398
G1 X88.419 Y75.797 E.02557
; LINE_WIDTH: 0.409178
G1 X90.419 Y75.797 E.02555
; LINE_WIDTH: 0.408968
G1 X92.419 Y75.797 E.02554
; LINE_WIDTH: 0.408748
G1 X94.419 Y75.797 E.02553
; LINE_WIDTH: 0.408528
G1 X96.419 Y75.797 E.02551
; LINE_WIDTH: 0.408308
G1 X98.419 Y75.796 E.0255
; LINE_WIDTH: 0.408088
G1 X100.419 Y75.796 E.02548
; LINE_WIDTH: 0.407868
G1 X101.6 Y75.796 E.01504
; LINE_WIDTH: 0.407748
G1 X101.942 Y75.869 E.00445
; LINE_WIDTH: 0.405628
G1 X102.26 Y76.087 E.00488
; LINE_WIDTH: 0.408268
G1 X102.43 Y76.349 E.00399
G1 X102.503 Y76.665 E.00413
; LINE_WIDTH: 0.408098
G1 X102.504 Y78.665 E.02548
; LINE_WIDTH: 0.407758
G1 X102.504 Y78.759 E.00119
; LINE_WIDTH: 0.419998
G1 X102.319 Y78.96 E.00359
G1 X101.51 Y78.96 E.01062
G1 X101.51 Y80.04 E.01418
G1 X102.309 Y80.04 E.01049
G1 X102.504 Y80.241 E.00368
; LINE_WIDTH: 0.407858
G1 X102.504 Y84.241 E.05094
; LINE_WIDTH: 0.407998
G1 X102.504 Y88.241 E.05096
; LINE_WIDTH: 0.408138
G1 X102.504 Y92.241 E.05097
; LINE_WIDTH: 0.408268
G1 X102.504 Y96.241 E.05099
; LINE_WIDTH: 0.408398
G1 X102.504 Y97.759 E.01935
; LINE_WIDTH: 0.419998
G1 X102.319 Y97.96 E.00359
G1 X101.57 Y97.96 E.00984
; WIPE_START
G1 F12000
M204 S6000
G1 X101.51 Y99.04 E-.41105
G1 X102.309 Y99.04 E-.30346
G1 X102.392 Y99.126 E-.04549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.04 I1.217 J-.002 P1  F42000
G1 X102.357 Y75.67 Z8.04
G1 Z7.64
G1 E.8 F1800
; LINE_WIDTH: 0.414848
G1 F1822
M204 S5000
G1 X102.536 Y75.818 E.00302
; LINE_WIDTH: 0.408238
G1 X102.783 Y76.184 E.00563
; LINE_WIDTH: 0.408338
G1 X102.894 Y76.646 E.00606
G1 X102.894 Y76.665 E.00024
; LINE_WIDTH: 0.408098
G1 X102.894 Y78.665 E.02548
; LINE_WIDTH: 0.407758
G1 X102.894 Y78.758 E.00119
; LINE_WIDTH: 0.410698
G1 X102.893 Y78.827 E.00087
; LINE_WIDTH: 0.419998
G2 X102.895 Y80.241 I46.769 J.656 E.01858
; LINE_WIDTH: 0.407858
G1 X102.895 Y84.241 E.05094
; LINE_WIDTH: 0.407998
G1 X102.895 Y88.241 E.05096
; LINE_WIDTH: 0.408138
G1 X102.895 Y92.241 E.05097
; LINE_WIDTH: 0.408268
G1 X102.895 Y96.241 E.05099
; LINE_WIDTH: 0.408398
G1 X102.895 Y97.759 E.01935
; LINE_WIDTH: 0.411348
G1 X102.894 Y97.827 E.00087
; LINE_WIDTH: 0.419998
G2 X102.896 Y99.241 I49.851 J.653 E.01858
; LINE_WIDTH: 0.408708
G1 X102.896 Y101.241 E.02552
; LINE_WIDTH: 0.408978
G1 X102.896 Y103.276 E.02598
G1 X102.817 Y103.717 E.00573
; LINE_WIDTH: 0.406558
G1 X102.61 Y104.092 E.00544
; LINE_WIDTH: 0.408238
G1 X102.302 Y104.381 E.00538
; LINE_WIDTH: 0.413588
G1 X102.002 Y104.524 E.0043
G1 X101.585 Y104.595 E.00546
; LINE_WIDTH: 0.410258
G1 X99.585 Y104.595 E.02563
; LINE_WIDTH: 0.410008
G1 X97.585 Y104.595 E.02561
; LINE_WIDTH: 0.409768
G1 X95.585 Y104.595 E.02559
; LINE_WIDTH: 0.409518
G1 X93.585 Y104.595 E.02558
; LINE_WIDTH: 0.409278
G1 X91.585 Y104.595 E.02556
; LINE_WIDTH: 0.409028
G1 X89.585 Y104.595 E.02555
; LINE_WIDTH: 0.408788
G1 X87.585 Y104.595 E.02553
; LINE_WIDTH: 0.408538
G1 X85.585 Y104.595 E.02551
; LINE_WIDTH: 0.408298
G1 X83.585 Y104.595 E.0255
; LINE_WIDTH: 0.408048
G1 X81.741 Y104.595 E.02349
; LINE_WIDTH: 0.419998
G1 X81.741 Y104.588 E.00008
G2 X80.259 Y104.594 I-.378 J89.673 E.01947
; LINE_WIDTH: 0.407758
G1 X78.4 Y104.594 E.02366
G1 X78.1 Y104.548 E.00386
; LINE_WIDTH: 0.411188
G1 X77.708 Y104.388 E.00544
; LINE_WIDTH: 0.415288
G1 X77.421 Y104.135 E.00497
G1 X77.206 Y103.786 E.00532
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00645
G1 X77.104 Y85.491 E.22708
; LINE_WIDTH: 0.419998
G2 X77.104 Y83.509 I-82.401 J-.991 E.02604
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.08656
G1 X77.141 Y76.414 E.00398
; LINE_WIDTH: 0.412638
G1 X77.279 Y76.067 E.00482
G1 X77.457 Y75.829 E.00383
; LINE_WIDTH: 0.404308
G1 X77.744 Y75.596 E.00467
; LINE_WIDTH: 0.411298
G1 X78.13 Y75.438 E.00535
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410278
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409838
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409618
G1 X86.41 Y75.405 E.02558
; LINE_WIDTH: 0.409398
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409178
G1 X90.41 Y75.405 E.02555
; LINE_WIDTH: 0.408968
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408748
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408528
G1 X96.41 Y75.405 E.02551
; LINE_WIDTH: 0.408308
G1 X98.41 Y75.406 E.0255
; LINE_WIDTH: 0.408088
G1 X100.41 Y75.406 E.02548
; LINE_WIDTH: 0.407868
G1 X101.6 Y75.406 E.01516
; LINE_WIDTH: 0.408118
G1 X101.938 Y75.455 E.00436
; LINE_WIDTH: 0.414848
G1 X102.29 Y75.614 E.00501
G1 X102.311 Y75.631 E.00035
; WIPE_START
G1 F12000
M204 S6000
G1 X102.536 Y75.818 E-.11123
G1 X102.783 Y76.184 E-.16772
G1 X102.894 Y76.646 E-.18049
G1 X102.894 Y76.665 E-.00719
G1 X102.894 Y77.437 E-.29336
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.04 I-1.126 J-.461 P1  F42000
G1 X102.05 Y79.5 Z8.04
G1 Z7.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696368
G1 F1822
M204 S6000
G1 X102.347 Y79.5 E.00658
; WIPE_START
G1 F13250.883
G1 X102.05 Y79.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.05 Y87.132 Z8.04 F42000
G1 X102.05 Y98.5 Z8.04
G1 Z7.64
G1 E.8 F1800
; LINE_WIDTH: 0.696508
G1 F1822
M204 S6000
G1 X102.349 Y98.5 E.00661
; WIPE_START
G1 F13248.152
G1 X102.05 Y98.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.04 I-.31 J-1.177 P1  F42000
G1 X81 Y104.047 Z8.04
G1 Z7.64
G1 E.8 F1800
; LINE_WIDTH: 0.696368
G1 F1822
M204 S6000
G1 X81 Y103.55 E.01101
; WIPE_START
G1 F13250.883
G1 X81 Y104.047 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.04 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.72
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 94/99
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
; OBJECT_ID: 15
G1 X77.556 Y84.042 F42000
G1 Z7.72
G1 E.8 F1800
; LINE_WIDTH: 0.505758
G1 F1828
M204 S6000
G1 X77.691 Y84.156 E.00282
G1 X78.044 Y84.156 E.00562
G1 X78.044 Y84.844 E.01097
G1 X77.691 Y84.844 E.00562
G1 X77.556 Y84.98 E.00306
G1 X77.556 Y84.102 E.01399
; WIPE_START
G1 F18000
G1 X77.691 Y84.156 E-.0555
G1 X78.044 Y84.156 E-.13409
G1 X78.044 Y84.844 E-.26167
G1 X77.691 Y84.844 E-.13409
G1 X77.556 Y84.98 E-.07294
G1 X77.556 Y84.712 E-.1017
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I-.589 J1.065 P1  F42000
G1 X101.51 Y97.96 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1828
M204 S5000
G1 X101.51 Y99.04 E.01418
G1 X102.309 Y99.04 E.01049
G1 X102.504 Y99.241 E.00369
; LINE_WIDTH: 0.408708
G1 X102.504 Y101.241 E.02552
; LINE_WIDTH: 0.408978
G1 X102.504 Y103.275 E.02597
; LINE_WIDTH: 0.411608
G1 X102.477 Y103.495 E.00285
G1 X102.322 Y103.834 E.00479
; LINE_WIDTH: 0.407288
G1 X102.025 Y104.093 E.00501
G1 X101.669 Y104.2 E.00472
; LINE_WIDTH: 0.410258
G3 X99.581 Y104.202 I-1.094 J-42.994 E.02676
; LINE_WIDTH: 0.410088
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409918
G1 X95.581 Y104.203 E.0256
; LINE_WIDTH: 0.409748
G1 X93.581 Y104.203 E.02559
; LINE_WIDTH: 0.409588
G1 X91.581 Y104.203 E.02558
; LINE_WIDTH: 0.409418
G1 X89.581 Y104.203 E.02557
; LINE_WIDTH: 0.409248
G1 X87.581 Y104.204 E.02556
; LINE_WIDTH: 0.409078
G1 X85.581 Y104.204 E.02555
; LINE_WIDTH: 0.408918
G1 X83.581 Y104.204 E.02554
; LINE_WIDTH: 0.408748
G1 X81.741 Y104.204 E.02348
; LINE_WIDTH: 0.419998
G1 X81.54 Y104.009 E.00369
G1 X81.54 Y103.01 E.01311
G1 X80.46 Y103.01 E.01418
G1 X80.46 Y104.009 E.01311
G1 X80.293 Y104.203 E.00337
; LINE_WIDTH: 0.411558
G1 X80.259 Y104.204 E.00044
; LINE_WIDTH: 0.408588
G1 X78.425 Y104.204 E.0234
G1 X78.021 Y104.116 E.00527
; LINE_WIDTH: 0.407368
G1 X77.734 Y103.905 E.00453
G1 X77.543 Y103.572 E.00489
G1 X77.497 Y103.315 E.00332
; LINE_WIDTH: 0.408588
G1 X77.496 Y85.491 E.2274
; LINE_WIDTH: 0.419998
G1 X77.691 Y85.29 E.00369
G1 X78.49 Y85.29 E.01049
M73 P95 R0
G1 X78.49 Y83.71 E.02075
G1 X77.691 Y83.71 E.01049
G1 X77.496 Y83.509 E.00369
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.08656
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.404248
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.408238
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410288
G1 X78.419 Y75.798 E.00538
G1 X80.419 Y75.798 E.02563
; LINE_WIDTH: 0.410058
G1 X82.419 Y75.798 E.02561
; LINE_WIDTH: 0.409838
G1 X84.419 Y75.798 E.0256
; LINE_WIDTH: 0.409618
G1 X86.419 Y75.798 E.02558
; LINE_WIDTH: 0.409398
G1 X88.419 Y75.797 E.02557
; LINE_WIDTH: 0.409178
G1 X90.419 Y75.797 E.02555
; LINE_WIDTH: 0.408958
G1 X92.419 Y75.797 E.02554
; LINE_WIDTH: 0.408738
G1 X94.419 Y75.797 E.02553
; LINE_WIDTH: 0.408518
G1 X96.419 Y75.797 E.02551
; LINE_WIDTH: 0.408298
G1 X98.419 Y75.796 E.0255
; LINE_WIDTH: 0.408078
G1 X100.419 Y75.796 E.02548
; LINE_WIDTH: 0.407858
G1 X101.6 Y75.796 E.01504
; LINE_WIDTH: 0.407738
G1 X101.86 Y75.838 E.00334
; LINE_WIDTH: 0.407398
G1 X102.199 Y76.03 E.00495
; LINE_WIDTH: 0.411328
G1 X102.421 Y76.335 E.00485
G1 X102.503 Y76.665 E.00437
; LINE_WIDTH: 0.408098
G1 X102.504 Y78.665 E.02548
; LINE_WIDTH: 0.407758
G1 X102.504 Y78.759 E.00119
; LINE_WIDTH: 0.419998
G1 X102.319 Y78.96 E.00359
G1 X101.51 Y78.96 E.01062
G1 X101.51 Y80.04 E.01418
G1 X102.309 Y80.04 E.01049
G1 X102.504 Y80.241 E.00368
; LINE_WIDTH: 0.407858
G1 X102.504 Y84.241 E.05094
; LINE_WIDTH: 0.407998
G1 X102.504 Y88.241 E.05096
; LINE_WIDTH: 0.408138
G1 X102.504 Y92.241 E.05097
; LINE_WIDTH: 0.408268
G1 X102.504 Y96.241 E.05099
; LINE_WIDTH: 0.408398
G1 X102.504 Y97.759 E.01935
; LINE_WIDTH: 0.419998
G1 X102.319 Y97.96 E.00359
G1 X101.57 Y97.96 E.00984
; WIPE_START
G1 F12000
M204 S6000
G1 X101.51 Y99.04 E-.41105
G1 X102.309 Y99.04 E-.30346
G1 X102.392 Y99.126 E-.04549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I1.217 J-.001 P1  F42000
G1 X102.367 Y75.678 Z8.12
G1 Z7.72
G1 E.8 F1800
; LINE_WIDTH: 0.413218
G1 F1828
M204 S5000
G1 X102.576 Y75.861 E.00359
G1 X102.78 Y76.181 E.00489
; LINE_WIDTH: 0.411328
G1 X102.894 Y76.646 E.00615
; LINE_WIDTH: 0.408338
G1 X102.894 Y76.665 E.00024
; LINE_WIDTH: 0.408098
G1 X102.894 Y78.665 E.02548
; LINE_WIDTH: 0.407758
G1 X102.894 Y78.758 E.00119
; LINE_WIDTH: 0.410698
G1 X102.893 Y78.827 E.00087
; LINE_WIDTH: 0.419998
G2 X102.895 Y80.241 I46.769 J.656 E.01858
; LINE_WIDTH: 0.407858
G1 X102.895 Y84.241 E.05094
; LINE_WIDTH: 0.407998
G1 X102.895 Y88.241 E.05096
; LINE_WIDTH: 0.408138
G1 X102.895 Y92.241 E.05097
; LINE_WIDTH: 0.408268
G1 X102.895 Y96.241 E.05099
; LINE_WIDTH: 0.408398
G1 X102.895 Y97.759 E.01935
; LINE_WIDTH: 0.411348
G1 X102.894 Y97.827 E.00087
; LINE_WIDTH: 0.419998
G2 X102.896 Y99.241 I49.851 J.653 E.01858
; LINE_WIDTH: 0.408708
G1 X102.896 Y101.241 E.02552
; LINE_WIDTH: 0.408978
G1 X102.896 Y103.241 E.02554
G3 X102.877 Y103.465 I-1.13 J.017 E.00287
; LINE_WIDTH: 0.411578
G1 X102.751 Y103.882 E.0056
; LINE_WIDTH: 0.414838
G1 X102.53 Y104.189 E.00489
G1 X102.253 Y104.411 E.0046
; LINE_WIDTH: 0.410808
G1 X101.867 Y104.562 E.00533
G1 X101.59 Y104.595 E.00357
; LINE_WIDTH: 0.410258
G1 X99.59 Y104.595 E.02563
; LINE_WIDTH: 0.410088
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409918
G1 X95.59 Y104.595 E.0256
; LINE_WIDTH: 0.409748
G1 X93.59 Y104.595 E.02559
; LINE_WIDTH: 0.409588
G1 X91.59 Y104.595 E.02558
; LINE_WIDTH: 0.409418
G1 X89.59 Y104.595 E.02557
; LINE_WIDTH: 0.409248
G1 X87.59 Y104.595 E.02556
; LINE_WIDTH: 0.409078
G1 X85.59 Y104.596 E.02555
; LINE_WIDTH: 0.408918
G1 X83.59 Y104.596 E.02554
; LINE_WIDTH: 0.408748
G1 X81.741 Y104.596 E.0236
; LINE_WIDTH: 0.419998
G1 X81.741 Y104.59 E.00007
G2 X80.259 Y104.596 I-.372 J96.105 E.01947
; LINE_WIDTH: 0.408588
G1 X78.425 Y104.596 E.0234
; LINE_WIDTH: 0.413038
G3 X77.84 Y104.455 I.01 J-1.329 E.00783
; LINE_WIDTH: 0.407638
G1 X77.441 Y104.169 E.00624
G1 X77.203 Y103.77 E.00591
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.292 E.00622
G1 X77.104 Y85.491 E.22711
; LINE_WIDTH: 0.419998
G2 X77.104 Y83.509 I-82.401 J-.991 E.02604
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.08656
G1 X77.141 Y76.414 E.00398
; LINE_WIDTH: 0.412578
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.828 E.00379
; LINE_WIDTH: 0.404248
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411298
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410288
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409848
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409628
G1 X86.41 Y75.405 E.02558
; LINE_WIDTH: 0.409408
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409188
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.408968
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408748
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408528
G1 X96.41 Y75.405 E.02551
; LINE_WIDTH: 0.408308
G1 X98.41 Y75.406 E.0255
; LINE_WIDTH: 0.408088
G1 X100.41 Y75.406 E.02548
; LINE_WIDTH: 0.407868
G1 X101.6 Y75.406 E.01516
; LINE_WIDTH: 0.407738
G1 X101.852 Y75.438 E.00323
; LINE_WIDTH: 0.410908
G1 X102.292 Y75.613 E.00607
; LINE_WIDTH: 0.413218
G1 X102.322 Y75.639 E.00051
; WIPE_START
G1 F12000
M204 S6000
G1 X102.576 Y75.861 E-.12849
G1 X102.78 Y76.181 E-.14409
G1 X102.894 Y76.646 E-.18184
G1 X102.894 Y76.665 E-.00722
G1 X102.894 Y77.45 E-.29837
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I-1.125 J-.463 P1  F42000
G1 X102.05 Y79.5 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696368
G1 F1828
M204 S6000
G1 X102.347 Y79.5 E.00658
; WIPE_START
G1 F13250.883
G1 X102.05 Y79.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.05 Y87.132 Z8.12 F42000
G1 X102.05 Y98.5 Z8.12
G1 Z7.72
G1 E.8 F1800
; LINE_WIDTH: 0.696488
G1 F1828
M204 S6000
G1 X102.349 Y98.5 E.00661
; WIPE_START
G1 F13248.543
G1 X102.05 Y98.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I-.31 J-1.177 P1  F42000
G1 X81 Y104.049 Z8.12
G1 Z7.72
G1 E.8 F1800
; LINE_WIDTH: 0.696528
G1 F1828
M204 S6000
G1 X81 Y103.55 E.01105
; WIPE_START
G1 F13247.763
G1 X81 Y104.049 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 95/99
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; OBJECT_ID: 15
G1 X102.36 Y75.685 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.403798
G1 F1657
M204 S5000
G1 X102.536 Y75.818 E.00278
; LINE_WIDTH: 0.407888
G1 X102.782 Y76.181 E.00558
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00611
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407738
G1 X102.895 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.895 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.895 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.895 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.895 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.896 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.896 Y102.7 E.02551
G3 X102.856 Y103.615 I-3.941 J.288 E.01171
; LINE_WIDTH: 0.407098
G1 X102.642 Y104.056 E.00624
; LINE_WIDTH: 0.404338
G1 X102.333 Y104.357 E.00545
; LINE_WIDTH: 0.413738
G1 X101.936 Y104.543 E.00566
G1 X101.588 Y104.595 E.00455
; LINE_WIDTH: 0.410258
G1 X99.588 Y104.595 E.02563
; LINE_WIDTH: 0.410108
G1 X97.588 Y104.595 E.02562
; LINE_WIDTH: 0.409968
G1 X95.588 Y104.595 E.02561
; LINE_WIDTH: 0.409818
G1 X93.588 Y104.595 E.0256
; LINE_WIDTH: 0.409678
G1 X91.588 Y104.595 E.02559
; LINE_WIDTH: 0.409528
G1 X89.588 Y104.595 E.02558
; LINE_WIDTH: 0.409388
G1 X87.588 Y104.595 E.02557
; LINE_WIDTH: 0.409248
G1 X85.588 Y104.595 E.02556
; LINE_WIDTH: 0.409098
G1 X83.588 Y104.596 E.02555
; LINE_WIDTH: 0.408958
G1 X81.588 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.588 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.429 Y104.596 E.01479
G1 X78.144 Y104.559 E.00367
; LINE_WIDTH: 0.410878
G1 X77.708 Y104.387 E.00601
; LINE_WIDTH: 0.415288
G1 X77.421 Y104.135 E.00496
G1 X77.206 Y103.786 E.00532
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00645
G1 X77.104 Y76.729 E.33888
G1 X77.173 Y76.301 E.00553
; LINE_WIDTH: 0.406408
G1 X77.414 Y75.872 E.00624
; LINE_WIDTH: 0.403078
M73 P96 R0
G1 X77.745 Y75.595 E.00544
; LINE_WIDTH: 0.411298
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410288
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409838
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409618
G1 X86.41 Y75.405 E.02558
; LINE_WIDTH: 0.409398
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409178
G1 X90.41 Y75.405 E.02555
; LINE_WIDTH: 0.408958
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408738
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408518
G1 X96.41 Y75.406 E.02551
; LINE_WIDTH: 0.408298
G1 X98.41 Y75.406 E.0255
; LINE_WIDTH: 0.408078
G1 X100.41 Y75.406 E.02548
; LINE_WIDTH: 0.407858
G1 X101.6 Y75.406 E.01516
; LINE_WIDTH: 0.414008
G3 X102.207 Y75.569 I-.025 J1.304 E.00822
; LINE_WIDTH: 0.403798
G1 X102.313 Y75.649 E.00166
; WIPE_START
G1 F12000
M204 S6000
G1 X102.536 Y75.818 E-.10663
G1 X102.782 Y76.181 E-.16664
G1 X102.893 Y76.646 E-.18157
G1 X102.894 Y76.7 E-.02043
G1 X102.894 Y77.449 E-.28474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.646 Y85.078 Z8.2 F42000
G1 X102.025 Y104.092 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.404868
G1 F1657
M204 S5000
G1 X101.669 Y104.199 E.0047
; LINE_WIDTH: 0.410258
G1 X99.576 Y104.202 E.02682
; LINE_WIDTH: 0.410108
G1 X97.576 Y104.202 E.02562
; LINE_WIDTH: 0.409968
G1 X95.576 Y104.202 E.02561
; LINE_WIDTH: 0.409818
G1 X93.576 Y104.203 E.0256
; LINE_WIDTH: 0.409678
G1 X91.576 Y104.203 E.02559
; LINE_WIDTH: 0.409528
G1 X89.576 Y104.203 E.02558
; LINE_WIDTH: 0.409388
G1 X87.576 Y104.203 E.02557
; LINE_WIDTH: 0.409238
G1 X85.576 Y104.204 E.02556
; LINE_WIDTH: 0.409098
G1 X83.576 Y104.204 E.02555
; LINE_WIDTH: 0.408958
G1 X81.576 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.576 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.429 Y104.204 E.01464
G1 X78.14 Y104.162 E.00372
; LINE_WIDTH: 0.407178
G1 X77.798 Y103.967 E.00501
; LINE_WIDTH: 0.406558
G1 X77.57 Y103.646 E.005
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00475
G1 X77.496 Y76.729 E.33876
G1 X77.551 Y76.403 E.00422
; LINE_WIDTH: 0.405948
G1 X77.729 Y76.1 E.00445
; LINE_WIDTH: 0.408258
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410288
G1 X78.419 Y75.798 E.00538
G1 X80.419 Y75.798 E.02563
; LINE_WIDTH: 0.410058
G1 X82.419 Y75.798 E.02561
; LINE_WIDTH: 0.409838
G1 X84.419 Y75.798 E.0256
; LINE_WIDTH: 0.409618
G1 X86.419 Y75.798 E.02558
; LINE_WIDTH: 0.409398
G1 X88.419 Y75.797 E.02557
; LINE_WIDTH: 0.409178
G1 X90.419 Y75.797 E.02555
; LINE_WIDTH: 0.408958
G1 X92.419 Y75.797 E.02554
; LINE_WIDTH: 0.408738
G1 X94.419 Y75.797 E.02553
; LINE_WIDTH: 0.408518
G1 X96.419 Y75.797 E.02551
; LINE_WIDTH: 0.408298
G1 X98.419 Y75.796 E.0255
; LINE_WIDTH: 0.408078
G1 X100.419 Y75.796 E.02548
; LINE_WIDTH: 0.407858
G1 X101.6 Y75.796 E.01503
; LINE_WIDTH: 0.407728
G1 X102.014 Y75.901 E.00544
; LINE_WIDTH: 0.410928
G1 X102.279 Y76.112 E.00434
G1 X102.458 Y76.428 E.00467
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0035
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407808
G1 X102.504 Y82.7 E.05093
; LINE_WIDTH: 0.407948
G1 X102.504 Y86.7 E.05095
; LINE_WIDTH: 0.408078
G1 X102.504 Y90.7 E.05097
; LINE_WIDTH: 0.408218
G1 X102.504 Y94.7 E.05098
; LINE_WIDTH: 0.408348
G1 X102.504 Y98.7 E.051
; LINE_WIDTH: 0.408488
G1 X102.504 Y103.275 E.05836
G1 X102.464 Y103.554 E.00359
; LINE_WIDTH: 0.410798
G1 X102.28 Y103.887 E.00489
G1 X102.072 Y104.054 E.00342
; WIPE_START
G1 F12000
M204 S6000
G1 X101.669 Y104.199 E-.16264
G1 X100.097 Y104.201 E-.59736
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.88
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 96/99
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
M106 S204
; OBJECT_ID: 15
G1 X102.271 Y103.9 F42000
G1 Z7.88
G1 E.8 F1800
; LINE_WIDTH: 0.407368
G1 F1200
M204 S5000
G1 X102.462 Y103.56 E.00495
; LINE_WIDTH: 0.408998
G1 X102.504 Y103.271 E.00373
G1 X102.504 Y101.271 E.02554
; LINE_WIDTH: 0.408658
G1 X102.504 Y101.004 E.0034
G1 X102.896 Y101.004 E.00499
G1 X102.896 Y101.2 E.0025
; LINE_WIDTH: 0.408978
G1 X102.896 Y103.2 E.02554
G3 X102.847 Y103.623 I-1.572 J.035 E.00545
; LINE_WIDTH: 0.410968
G1 X102.685 Y103.996 E.00522
G1 X102.542 Y104.177 E.00296
; LINE_WIDTH: 0.408308
G1 X102.149 Y104.472 E.00626
; LINE_WIDTH: 0.409378
G1 X101.661 Y104.594 E.00643
G1 X99.661 Y104.595 E.02557
; LINE_WIDTH: 0.408748
G1 X99.304 Y104.596 E.00455
G1 X99.304 Y104.204 E.005
G1 X99.5 Y104.204 E.0025
; LINE_WIDTH: 0.409328
G1 X101.649 Y104.201 E.02747
G1 X101.991 Y104.112 E.00452
; LINE_WIDTH: 0.408338
G1 X102.223 Y103.936 E.00372
; WIPE_START
G1 F12000
M204 S6000
G1 X102.462 Y103.56 E-.16914
G1 X102.504 Y103.271 E-.11112
G1 X102.504 Y102.008 E-.47974
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.91 Y102.773 Z8.28 F42000
G1 X80.696 Y104.204 Z8.28
G1 Z7.88
G1 E.8 F1800
; LINE_WIDTH: 0.408588
G1 F1200
M204 S5000
G1 X80.696 Y104.4 E.0025
G1 X80.696 Y104.596 E.0025
G1 X78.425 Y104.596 E.02898
; LINE_WIDTH: 0.410698
G1 X78.063 Y104.544 E.00468
G1 X77.64 Y104.338 E.00604
; LINE_WIDTH: 0.405868
G1 X77.345 Y104.038 E.00534
; LINE_WIDTH: 0.413778
G1 X77.158 Y103.638 E.0057
G1 X77.105 Y103.288 E.00458
; LINE_WIDTH: 0.410238
G1 X77.104 Y101.288 E.02562
; LINE_WIDTH: 0.408908
G1 X77.104 Y101.004 E.00362
G1 X77.496 Y101.004 E.005
G1 X77.496 Y101.2 E.0025
; LINE_WIDTH: 0.410178
G1 X77.498 Y103.2 E.02562
G2 X77.501 Y103.37 I2.74 J.035 E.00218
; LINE_WIDTH: 0.404918
G1 X77.608 Y103.725 E.00469
; LINE_WIDTH: 0.410838
G1 X77.775 Y103.945 E.00354
G1 X78.066 Y104.135 E.00446
; LINE_WIDTH: 0.408588
G1 X78.425 Y104.204 E.00466
G1 X80.636 Y104.204 E.02821
; WIPE_START
G1 F12000
M204 S6000
G1 X80.696 Y104.4 E-.07779
G1 X80.696 Y104.596 E-.07437
G1 X79.096 Y104.596 E-.60784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.519 Y96.975 Z8.28 F42000
G1 X80.696 Y75.796 Z8.28
G1 Z7.88
G1 E.8 F1800
; LINE_WIDTH: 0.408648
G1 F1200
M204 S5000
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.419 Y75.796 E.02657
G1 X78.087 Y75.857 E.00431
; LINE_WIDTH: 0.408078
G1 X77.791 Y76.036 E.00441
G1 X77.585 Y76.321 E.00448
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.00527
G1 X77.496 Y78.996 E.02898
G1 X77.104 Y78.996 E.00499
G1 X77.104 Y76.724 E.02898
; LINE_WIDTH: 0.413058
G3 X77.245 Y76.139 I1.329 J.01 E.00783
; LINE_WIDTH: 0.404248
G1 X77.452 Y75.832 E.00468
; LINE_WIDTH: 0.411168
G1 X77.767 Y75.577 E.0052
G1 X77.98 Y75.488 E.00296
; LINE_WIDTH: 0.408998
G1 X78.409 Y75.404 E.00559
G1 X80.409 Y75.404 E.02554
; LINE_WIDTH: 0.408658
G1 X80.696 Y75.404 E.00365
G1 X80.696 Y75.6 E.0025
; LINE_WIDTH: 0.408648
G1 X80.696 Y75.736 E.00173
; WIPE_START
G1 F12000
M204 S6000
G1 X80.5 Y75.796 E-.07778
G1 X78.705 Y75.796 E-.68222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.336 Y75.904 Z8.28 F42000
G1 X102.273 Y76.129 Z8.28
G1 Z7.88
G1 E.8 F1800
; LINE_WIDTH: 0.404228
G1 F1200
M204 S5000
G1 X102.199 Y76.03 E.00156
; LINE_WIDTH: 0.404388
G1 X101.934 Y75.864 E.00394
; LINE_WIDTH: 0.408148
G1 X101.632 Y75.797 E.00394
; LINE_WIDTH: 0.408488
G1 X99.304 Y75.796 E.02969
G1 X99.304 Y75.404 E.00499
G1 X101.5 Y75.406 E.02801
; LINE_WIDTH: 0.408168
G3 X101.952 Y75.463 I.065 J1.288 E.00583
; LINE_WIDTH: 0.407368
G1 X102.334 Y75.641 E.00536
; LINE_WIDTH: 0.412558
G1 X102.617 Y75.91 E.00503
G1 X102.802 Y76.239 E.00487
G1 X102.894 Y76.665 E.00562
; LINE_WIDTH: 0.409358
G1 X102.895 Y78.665 E.02557
; LINE_WIDTH: 0.408738
G1 X102.896 Y78.996 E.00421
G1 X102.504 Y78.996 E.005
G1 X102.504 Y78.8 E.0025
; LINE_WIDTH: 0.409308
G1 X102.501 Y76.666 E.02728
G1 X102.41 Y76.31 E.0047
; LINE_WIDTH: 0.404228
G1 X102.31 Y76.177 E.00211
; WIPE_START
G1 F12000
M204 S6000
G1 X102.199 Y76.03 E-.0699
G1 X101.934 Y75.864 E-.11862
G1 X101.632 Y75.797 E-.1176
G1 X100.438 Y75.796 E-.45388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.28 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.96
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 97/99
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
; OBJECT_ID: 15
G1 X102.27 Y103.899 F42000
G1 Z7.96
G1 E.8 F1800
; LINE_WIDTH: 0.402998
G1 F1200
M204 S5000
G1 X102.435 Y103.634 E.00392
; LINE_WIDTH: 0.408998
G1 X102.504 Y103.27 E.00472
G1 X102.504 Y101.27 E.02554
; LINE_WIDTH: 0.408658
G1 X102.504 Y101.004 E.0034
G1 X102.896 Y101.004 E.00499
G1 X102.896 Y101.2 E.0025
; LINE_WIDTH: 0.408978
G1 X102.896 Y103.2 E.02554
G3 X102.843 Y103.643 I-1.605 J.035 E.00572
; LINE_WIDTH: 0.410148
G1 X102.687 Y103.992 E.00489
; LINE_WIDTH: 0.413548
G1 X102.436 Y104.28 E.00494
G1 X102.152 Y104.471 E.00441
; LINE_WIDTH: 0.409378
G1 X101.661 Y104.594 E.00647
G1 X99.661 Y104.595 E.02557
; LINE_WIDTH: 0.408748
G1 X99.304 Y104.596 E.00455
G1 X99.304 Y104.204 E.005
G1 X99.5 Y104.204 E.0025
; LINE_WIDTH: 0.409328
G1 X101.649 Y104.201 E.02747
G1 X101.991 Y104.112 E.00452
; LINE_WIDTH: 0.408298
G1 X102.223 Y103.935 E.00372
; WIPE_START
M73 P97 R0
G1 F12000
M204 S6000
G1 X102.435 Y103.634 E-.14013
G1 X102.504 Y103.27 E-.14041
G1 X102.504 Y102.009 E-.47946
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.91 Y102.773 Z8.36 F42000
G1 X80.696 Y104.204 Z8.36
G1 Z7.96
G1 E.8 F1800
; LINE_WIDTH: 0.408588
G1 F1200
M204 S5000
G1 X80.696 Y104.4 E.0025
G1 X80.696 Y104.596 E.0025
G1 X78.696 Y104.596 E.02552
G3 X78.022 Y104.538 I-.133 J-2.424 E.00866
; LINE_WIDTH: 0.406818
G1 X77.595 Y104.304 E.00619
; LINE_WIDTH: 0.404548
G1 X77.32 Y103.995 E.00521
; LINE_WIDTH: 0.410838
G1 X77.139 Y103.57 E.00593
G1 X77.105 Y103.29 E.00362
; LINE_WIDTH: 0.410248
G1 X77.104 Y101.29 E.02562
; LINE_WIDTH: 0.408908
G1 X77.104 Y101.004 E.00365
G1 X77.496 Y101.004 E.005
G1 X77.496 Y101.2 E.0025
; LINE_WIDTH: 0.410188
G1 X77.498 Y103.28 E.02665
G1 X77.59 Y103.691 E.00539
; LINE_WIDTH: 0.410728
G1 X77.782 Y103.952 E.00417
G1 X78.103 Y104.15 E.00483
; LINE_WIDTH: 0.408588
G1 X78.429 Y104.204 E.00423
G1 X80.636 Y104.204 E.02815
; WIPE_START
G1 F12000
M204 S6000
G1 X80.696 Y104.4 E-.07779
G1 X80.696 Y104.596 E-.07437
G1 X79.096 Y104.596 E-.60784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.519 Y96.975 Z8.36 F42000
G1 X80.696 Y75.796 Z8.36
G1 Z7.96
G1 E.8 F1800
; LINE_WIDTH: 0.408648
G1 F1200
M204 S5000
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.424 Y75.796 E.02651
G1 X78.015 Y75.889 E.00536
; LINE_WIDTH: 0.411218
G1 X77.755 Y76.075 E.00411
G1 X77.551 Y76.403 E.00496
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.725 E.00416
G1 X77.496 Y78.996 E.02898
G1 X77.104 Y78.996 E.00499
G1 X77.104 Y76.996 E.02552
G3 X77.181 Y76.286 I2.081 J-.136 E.00916
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.618 E.00538
; LINE_WIDTH: 0.415118
G1 X78.064 Y75.458 E.00518
G1 X78.412 Y75.404 E.00457
; LINE_WIDTH: 0.408998
G1 X80.412 Y75.404 E.02554
; LINE_WIDTH: 0.408658
G1 X80.696 Y75.404 E.00362
G1 X80.696 Y75.6 E.0025
; LINE_WIDTH: 0.408648
G1 X80.696 Y75.736 E.00173
; WIPE_START
G1 F12000
M204 S6000
G1 X80.5 Y75.796 E-.07778
G1 X78.705 Y75.796 E-.68222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.336 Y75.904 Z8.36 F42000
G1 X102.274 Y76.13 Z8.36
G1 Z7.96
G1 E.8 F1800
; LINE_WIDTH: 0.404228
G1 F1200
M204 S5000
G1 X102.199 Y76.03 E.00159
; LINE_WIDTH: 0.404378
G1 X101.934 Y75.864 E.00393
; LINE_WIDTH: 0.408128
G1 X101.633 Y75.797 E.00394
; LINE_WIDTH: 0.408488
G1 X99.304 Y75.796 E.0297
G1 X99.304 Y75.404 E.00499
G1 X101.5 Y75.406 E.02801
; LINE_WIDTH: 0.408148
G3 X101.952 Y75.463 I.066 J1.287 E.00584
; LINE_WIDTH: 0.407348
G1 X102.334 Y75.641 E.00535
; LINE_WIDTH: 0.412588
G1 X102.617 Y75.91 E.00504
G1 X102.802 Y76.239 E.00487
G1 X102.894 Y76.665 E.00562
; LINE_WIDTH: 0.409378
G1 X102.895 Y78.665 E.02557
; LINE_WIDTH: 0.408738
G1 X102.896 Y78.996 E.00421
G1 X102.504 Y78.996 E.005
G1 X102.504 Y78.8 E.0025
; LINE_WIDTH: 0.409328
G1 X102.501 Y76.666 E.02728
G1 X102.41 Y76.31 E.00469
; LINE_WIDTH: 0.404228
G1 X102.31 Y76.178 E.00209
; WIPE_START
G1 F12000
M204 S6000
G1 X102.199 Y76.03 E-.07055
G1 X101.934 Y75.864 E-.11845
G1 X101.633 Y75.797 E-.11741
G1 X100.439 Y75.796 E-.45359
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.36 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 8.04
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 98/99
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
; OBJECT_ID: 15
G1 X101.991 Y104.112 F42000
G1 Z8.04
G1 E.8 F1800
; LINE_WIDTH: 0.408278
G1 F1200
M204 S5000
G1 X102.27 Y103.899 E.00448
; LINE_WIDTH: 0.403008
G1 X102.435 Y103.634 E.00392
; LINE_WIDTH: 0.408998
G1 X102.504 Y103.271 E.00472
G1 X102.504 Y101.271 E.02554
; LINE_WIDTH: 0.408658
G1 X102.504 Y101.004 E.0034
G1 X102.896 Y101.004 E.00499
G1 X102.896 Y101.2 E.0025
; LINE_WIDTH: 0.408978
G1 X102.896 Y103.2 E.02554
G3 X102.843 Y103.643 I-1.604 J.035 E.00572
; LINE_WIDTH: 0.410138
G1 X102.687 Y103.992 E.00489
; LINE_WIDTH: 0.413558
G1 X102.435 Y104.28 E.00494
G1 X102.152 Y104.47 E.00441
; LINE_WIDTH: 0.409368
G1 X101.661 Y104.594 E.00648
G1 X99.661 Y104.595 E.02557
; LINE_WIDTH: 0.408738
G1 X99.304 Y104.596 E.00455
G1 X99.304 Y104.204 E.005
G1 X99.5 Y104.204 E.0025
; LINE_WIDTH: 0.409318
G1 X101.649 Y104.201 E.02747
G1 X101.933 Y104.127 E.00375
; WIPE_START
G1 F12000
M204 S6000
G1 X102.27 Y103.899 E-.15486
G1 X102.435 Y103.634 E-.11854
G1 X102.504 Y103.271 E-.14042
G1 X102.504 Y102.36 E-.34618
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.899 Y103.003 Z8.44 F42000
G1 X80.696 Y104.204 Z8.44
G1 Z8.04
G1 E.8 F1800
; LINE_WIDTH: 0.408408
G1 F1200
M204 S5000
G1 X80.696 Y104.4 E.00249
; LINE_WIDTH: 0.408448
G1 X80.696 Y104.596 E.0025
G1 X78.5 Y104.594 E.028
; LINE_WIDTH: 0.407738
G1 X78.4 Y104.594 E.00128
; LINE_WIDTH: 0.408178
G1 X78.061 Y104.545 E.00436
; LINE_WIDTH: 0.412578
G1 X77.709 Y104.386 E.00498
; LINE_WIDTH: 0.413048
G1 X77.4 Y104.118 E.00529
G1 X77.204 Y103.772 E.00513
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.292 E.00624
G1 X77.104 Y101.004 E.02919
G1 X77.496 Y101.004 E.00499
G1 X77.496 Y103.004 E.02552
G2 X77.57 Y103.645 I1.585 J.141 E.00829
; LINE_WIDTH: 0.404848
G1 X77.769 Y103.94 E.00449
; LINE_WIDTH: 0.404228
G1 X78.062 Y104.133 E.00443
; LINE_WIDTH: 0.407708
G1 X78.4 Y104.204 E.00439
; LINE_WIDTH: 0.408408
G1 X80.636 Y104.204 E.02851
; WIPE_START
G1 F12000
M204 S6000
G1 X80.696 Y104.4 E-.07776
G1 X80.696 Y104.596 E-.0744
G1 X79.096 Y104.595 E-.60784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.519 Y96.974 Z8.44 F42000
G1 X80.696 Y75.796 Z8.44
G1 Z8.04
G1 E.8 F1800
; LINE_WIDTH: 0.408648
G1 F1200
M204 S5000
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.419 Y75.796 E.02657
G1 X78.087 Y75.857 E.00432
; LINE_WIDTH: 0.404548
G1 X77.792 Y76.038 E.00437
G1 X77.584 Y76.321 E.00443
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.00527
G1 X77.496 Y78.996 E.02898
G1 X77.104 Y78.996 E.00499
G1 X77.104 Y76.996 E.02552
G3 X77.113 Y76.629 I1.995 J-.136 E.00469
; LINE_WIDTH: 0.405628
G1 X77.214 Y76.209 E.00547
; LINE_WIDTH: 0.406158
G1 X77.422 Y75.863 E.00512
; LINE_WIDTH: 0.410588
G1 X77.767 Y75.577 E.00574
G1 X77.98 Y75.488 E.00295
; LINE_WIDTH: 0.408998
G1 X78.41 Y75.404 E.0056
G1 X80.41 Y75.404 E.02554
; LINE_WIDTH: 0.408658
G1 X80.696 Y75.404 E.00365
G1 X80.696 Y75.6 E.0025
; LINE_WIDTH: 0.408648
G1 X80.696 Y75.736 E.00173
; WIPE_START
G1 F12000
M204 S6000
G1 X80.5 Y75.796 E-.07778
G1 X78.705 Y75.796 E-.68222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.336 Y75.914 Z8.44 F42000
G1 X102.297 Y76.16 Z8.44
G1 Z8.04
G1 E.8 F1800
; LINE_WIDTH: 0.404228
G1 F1200
M204 S5000
G1 X102.199 Y76.03 E.00205
; LINE_WIDTH: 0.410908
G1 X101.88 Y75.847 E.00472
G1 X101.633 Y75.797 E.00323
; LINE_WIDTH: 0.408488
G1 X99.304 Y75.796 E.02971
G1 X99.304 Y75.404 E.00499
G1 X101.5 Y75.406 E.02801
; LINE_WIDTH: 0.408148
G1 X101.634 Y75.406 E.0017
G1 X101.986 Y75.472 E.00457
; LINE_WIDTH: 0.407998
G1 X102.317 Y75.632 E.00468
; LINE_WIDTH: 0.412558
G1 X102.617 Y75.91 E.00527
G1 X102.802 Y76.239 E.00486
G1 X102.894 Y76.665 E.00563
; LINE_WIDTH: 0.409358
G1 X102.895 Y78.665 E.02557
; LINE_WIDTH: 0.408738
G1 X102.896 Y78.996 E.00421
G1 X102.504 Y78.996 E.005
G1 X102.504 Y78.8 E.0025
; LINE_WIDTH: 0.409308
G1 X102.501 Y76.666 E.02728
G1 X102.41 Y76.31 E.0047
; LINE_WIDTH: 0.404228
G1 X102.333 Y76.207 E.00162
; WIPE_START
G1 F12000
M204 S6000
G1 X102.199 Y76.03 E-.08462
G1 X101.88 Y75.847 E-.13965
G1 X101.633 Y75.797 E-.0956
G1 X100.475 Y75.796 E-.44013
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.44 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 8.12
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 99/99
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
; OBJECT_ID: 15
G1 X102.27 Y103.898 F42000
G1 Z8.12
G1 E.8 F1800
; LINE_WIDTH: 0.403038
G1 F1200
M204 S5000
G1 X102.435 Y103.634 E.00392
; LINE_WIDTH: 0.408998
G1 X102.504 Y103.27 E.00472
G1 X102.504 Y101.27 E.02554
; LINE_WIDTH: 0.408658
G1 X102.504 Y101.004 E.0034
G1 X102.896 Y101.004 E.00499
G1 X102.896 Y101.2 E.0025
; LINE_WIDTH: 0.408978
G1 X102.896 Y103.2 E.02554
G3 X102.843 Y103.644 I-1.605 J.035 E.00572
; LINE_WIDTH: 0.410128
M73 P98 R0
G1 X102.687 Y103.992 E.00489
; LINE_WIDTH: 0.413578
G1 X102.436 Y104.28 E.00494
G1 X102.153 Y104.47 E.0044
; LINE_WIDTH: 0.409378
G1 X101.661 Y104.594 E.00649
G1 X99.661 Y104.595 E.02557
; LINE_WIDTH: 0.408748
G1 X99.304 Y104.596 E.00456
G1 X99.304 Y104.204 E.005
G1 X99.5 Y104.204 E.0025
; LINE_WIDTH: 0.409328
G1 X101.649 Y104.201 E.02747
G1 X101.991 Y104.112 E.00452
; LINE_WIDTH: 0.408228
G1 X102.223 Y103.935 E.00372
; WIPE_START
G1 F12000
M204 S6000
G1 X102.435 Y103.634 E-.14002
G1 X102.504 Y103.27 E-.14049
G1 X102.504 Y102.009 E-.47948
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.91 Y102.773 Z8.52 F42000
G1 X80.696 Y104.204 Z8.52
G1 Z8.12
G1 E.8 F1800
; LINE_WIDTH: 0.408588
G1 F1200
M204 S5000
G1 X80.696 Y104.4 E.0025
G1 X80.696 Y104.596 E.0025
G1 X78.696 Y104.596 E.02552
G3 X78.022 Y104.538 I-.133 J-2.423 E.00866
; LINE_WIDTH: 0.406808
G1 X77.595 Y104.304 E.00619
; LINE_WIDTH: 0.411568
G1 X77.306 Y103.984 E.00554
G1 X77.201 Y103.767 E.00309
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.286 E.00627
G1 X77.104 Y101.004 E.02911
G1 X77.496 Y101.004 E.00499
G1 X77.496 Y103.004 E.02552
G2 X77.569 Y103.646 I1.668 J.133 E.00829
; LINE_WIDTH: 0.411598
G1 X77.782 Y103.952 E.0048
G1 X78.103 Y104.15 E.00484
; LINE_WIDTH: 0.408588
G1 X78.429 Y104.204 E.00423
G1 X80.636 Y104.204 E.02815
; WIPE_START
G1 F12000
M204 S6000
G1 X80.696 Y104.4 E-.07779
G1 X80.696 Y104.596 E-.07437
G1 X79.096 Y104.596 E-.60784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.519 Y96.975 Z8.52 F42000
G1 X80.696 Y75.796 Z8.52
G1 Z8.12
G1 E.8 F1800
; LINE_WIDTH: 0.408648
G1 F1200
M204 S5000
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.419 Y75.796 E.02657
G1 X78.087 Y75.857 E.00431
; LINE_WIDTH: 0.404588
G1 X77.791 Y76.038 E.00437
; LINE_WIDTH: 0.407838
G1 X77.583 Y76.32 E.00447
; LINE_WIDTH: 0.408598
G1 X77.496 Y76.725 E.00528
G1 X77.496 Y78.996 E.02898
G1 X77.104 Y78.996 E.00499
G1 X77.104 Y76.996 E.02552
G3 X77.106 Y76.701 I2.401 J-.136 E.00377
G1 X77.205 Y76.22 E.00626
; LINE_WIDTH: 0.404578
G1 X77.421 Y75.868 E.00522
; LINE_WIDTH: 0.410638
G1 X77.767 Y75.578 E.00579
G1 X77.98 Y75.488 E.00296
; LINE_WIDTH: 0.408998
G1 X78.41 Y75.404 E.00559
G1 X80.41 Y75.404 E.02554
; LINE_WIDTH: 0.408658
G1 X80.696 Y75.404 E.00365
G1 X80.696 Y75.6 E.0025
; LINE_WIDTH: 0.408648
G1 X80.696 Y75.736 E.00173
; WIPE_START
G1 F12000
M204 S6000
G1 X80.5 Y75.796 E-.07778
G1 X78.705 Y75.796 E-.68222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.336 Y75.905 Z8.52 F42000
G1 X102.276 Y76.132 Z8.52
G1 Z8.12
G1 E.8 F1800
; LINE_WIDTH: 0.404238
G1 F1200
M204 S5000
G1 X102.199 Y76.03 E.00162
; LINE_WIDTH: 0.404378
G1 X101.934 Y75.864 E.00394
; LINE_WIDTH: 0.408098
G1 X101.634 Y75.797 E.00392
; LINE_WIDTH: 0.408488
G1 X99.304 Y75.796 E.02972
G1 X99.304 Y75.404 E.00499
G1 X101.5 Y75.406 E.02801
; LINE_WIDTH: 0.408118
G3 X101.952 Y75.463 I.066 J1.284 E.00584
; LINE_WIDTH: 0.407368
G1 X102.334 Y75.641 E.00536
; LINE_WIDTH: 0.412588
G1 X102.617 Y75.91 E.00503
G1 X102.802 Y76.239 E.00487
G1 X102.894 Y76.665 E.00562
; LINE_WIDTH: 0.409358
G1 X102.895 Y78.665 E.02557
; LINE_WIDTH: 0.408738
G1 X102.896 Y78.996 E.00422
G1 X102.504 Y78.996 E.005
G1 X102.504 Y78.8 E.0025
; LINE_WIDTH: 0.409308
G1 X102.501 Y76.666 E.02728
G1 X102.41 Y76.31 E.00469
; LINE_WIDTH: 0.404238
G1 X102.312 Y76.18 E.00206
; WIPE_START
G1 F12000
M204 S6000
G1 X102.199 Y76.03 E-.07146
G1 X101.934 Y75.864 E-.1186
G1 X101.634 Y75.797 E-.11691
G1 X100.442 Y75.796 E-.45304
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.52 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; close powerlost recovery
M1003 S0
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z8.62 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z108.12 F600
    G1 Z106.12

M400 P100
M17 R ; restore z current

G90
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END


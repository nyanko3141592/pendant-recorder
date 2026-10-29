; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 11m 52s; total estimated time: 12m 11s
; total layer number: 30
; total filament length [mm] : 715.23
; total filament volume [cm^3] : 1720.34
; total filament weight [g] : 2.15
; filament_density: 1.25
; filament_diameter: 1.75
; max_z_height: 4.84
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 0
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
; bottom_shell_layers = 6
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
; close_additional_fan_first_x_layers = 3
; close_fan_the_first_x_layers = 3
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 0
; cool_plate_temp_initial_layer = 0
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10
; cooling_slowdown_logic = uniform_cooling
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
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
; enable_support = 1
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 70
; eng_plate_temp_initial_layer = 70
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
; fan_cooling_layer_time = 30
; fan_direction = undefine
; fan_max_speed = 50
; fan_min_speed = 30
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 300
; filament_bridge_speed = 25
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #00AE42
; filament_cooling_before_tower = 0
; filament_cost = 24.99
; filament_density = 1.25
; filament_dev_ams_drying_ams_limitations = 1
; filament_dev_ams_drying_heat_distortion_temperature = 75
; filament_dev_ams_drying_temperature = 65
; filament_dev_ams_drying_time = 12
; filament_dev_chamber_drying_bed_temperature = 80
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 55
; filament_dev_drying_softening_temperature = 60
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.94
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFG00
; filament_is_mixed = 0
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 13
; filament_metal_stickiness = High
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
; filament_retraction_distances_when_cut = 18
; filament_retraction_length = 0.4
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Bambu PETG Basic @BBL A1"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PETG
; filament_velocity_adaptation_factor = 1
; filament_vendor = "Bambu Lab"
; filament_volume_map = 0
; filament_wipe = 1
; filament_wipe_distance = 1
; filament_z_hop_types = Spiral Lift
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
; hot_plate_temp = 70
; hot_plate_temp_initial_layer = 70
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 13.6
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
; initial_layer_print_height = 0.2
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
; layer_height = 0.16
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
; nozzle_temperature = 245
; nozzle_temperature_initial_layer = 245
; nozzle_temperature_range_high = 270
; nozzle_temperature_range_low = 230
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
; overhang_fan_speed = 50
; overhang_fan_threshold = 10%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 2
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
; slow_down_layer_time = 12
; slow_down_min_speed = 10
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
; sparse_infill_density = 40%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 330
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 70
; supertack_plate_temp_initial_layer = 70
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
; temperature_vitrification = 60
; template_custom_gcode = 
; textured_plate_temp = 70
; textured_plate_temp_initial_layer = 70
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
; wall_generator = classic
; wall_loops = 6
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
M73 P0 R12
M201 X6000 Y6000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z5.00 E3.00
M106 S0
M190 S70 ; set bed temperature and wait for it to be reached
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
M73 P1 R12
G1 X110 Y110 Z2.0 F3000 ;Move Z Axis up
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S180


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.4 F1800
; layer num/total_layer_count: 1/30
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P2 R11
G1 X76.796 Y76.306 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X76.796 Y103.489 E.97114
G1 X77.304 Y103.489 E.01814
G1 X77.304 Y76.511 E.96379
G1 X77.811 Y76.511 E.01814
G1 X77.811 Y103.489 E.96379
G1 X78.319 Y103.489 E.01814
G1 X78.319 Y76.511 E.96379
G1 X78.827 Y76.511 E.01814
G1 X78.827 Y103.489 E.96379
G1 X79.335 Y103.489 E.01814
G1 X79.335 Y76.511 E.96379
M73 P3 R11
G1 X79.843 Y76.511 E.01814
G1 X79.843 Y103.489 E.96379
G1 X80.351 Y103.489 E.01814
G1 X80.351 Y76.511 E.96379
G1 X80.859 Y76.511 E.01814
G1 X80.859 Y103.489 E.96379
G1 X81.366 Y103.489 E.01814
G1 X81.366 Y76.511 E.96379
G1 X81.507 Y76.511 E.00502
G1 X81.874 Y76.144 E.01857
G1 X81.874 Y103.489 E.97692
G1 X82.382 Y103.489 E.01814
G1 X82.382 Y75.23 E1.00956
G1 X82.89 Y74.749 E.025
G1 X82.89 Y103.489 E1.02676
G1 X83.398 Y103.489 E.01814
G1 X83.398 Y74.4 E1.03923
G3 X83.906 Y74.157 I.887 J1.204 E.02023
G1 X83.906 Y103.489 E1.0479
G1 X84.414 Y103.489 E.01814
G1 X84.414 Y73.989 E1.05389
G3 X84.921 Y73.911 I.486 J1.455 E.01845
G1 X84.921 Y103.489 E1.0567
M73 P4 R11
G1 X85.429 Y103.489 E.01814
G1 X85.429 Y73.885 E1.05761
G3 X85.937 Y73.937 I.117 J1.365 E.01835
G1 X85.937 Y103.489 E1.05576
G1 X86.445 Y103.489 E.01814
G1 X86.445 Y74.046 E1.05187
G1 X86.953 Y74.255 E.01962
G1 X86.953 Y103.489 E1.04441
G1 X87.461 Y103.489 E.01814
G1 X87.461 Y74.167 E1.04756
G1 X87.969 Y74.043 E.01867
G1 X87.969 Y103.489 E1.05196
G1 X88.476 Y103.489 E.01814
G1 X88.476 Y73.967 E1.05469
G2 X88.984 Y73.704 I.137 J-.356 E.02309
G1 X88.984 Y103.489 E1.06409
G1 X89.492 Y103.489 E.01814
G1 X89.492 Y73.12 E1.08496
G3 X90 Y72.678 I1.485 J1.193 E.02418
G1 X90 Y103.489 E1.10076
G1 X90.508 Y103.489 E.01814
G1 X90.508 Y72.346 E1.11259
M73 P5 R11
G3 X91.016 Y72.106 I1.276 J2.037 E.02012
G1 X91.016 Y103.489 E1.12119
G1 X91.524 Y103.489 E.01814
G1 X91.524 Y71.951 E1.12671
G3 X92.031 Y71.877 I.493 J1.606 E.01841
G1 X92.031 Y103.489 E1.12935
G1 X92.539 Y103.489 E.01814
G1 X92.539 Y71.877 E1.12936
G3 X93.047 Y71.891 I.209 J1.653 E.01822
G1 X93.047 Y103.489 E1.12886
G1 X93.555 Y103.489 E.01814
G1 X93.555 Y71.952 E1.12666
G1 X94.063 Y72.061 E.01856
G1 X94.063 Y103.489 E1.12277
G1 X94.571 Y103.489 E.01814
G1 X94.571 Y72.236 E1.11652
G3 X95.079 Y72.494 I-1.032 J2.658 E.02039
G1 X95.079 Y103.489 E1.1073
G1 X95.586 Y103.489 E.01814
G1 X95.586 Y72.824 E1.09552
M73 P6 R11
G3 X96.094 Y73.294 I-2.724 J3.456 E.02473
G1 X96.094 Y103.489 E1.07875
G1 X96.602 Y103.489 E.01814
G1 X96.602 Y76.511 E.96379
G1 X97.11 Y76.511 E.01814
G1 X97.11 Y103.489 E.96379
G1 X97.618 Y103.489 E.01814
G1 X97.618 Y76.511 E.96379
G1 X98.126 Y76.512 E.01814
G1 X98.126 Y103.489 E.96378
G1 X98.634 Y103.489 E.01814
G1 X98.634 Y76.512 E.96378
G1 X99.141 Y76.512 E.01814
G1 X99.141 Y103.489 E.96378
G1 X99.649 Y103.489 E.01814
G1 X99.649 Y76.512 E.96378
G1 X100.157 Y76.512 E.01814
G1 X100.157 Y103.489 E.96377
G1 X100.665 Y103.489 E.01814
G1 X100.665 Y76.512 E.96377
G1 X101.173 Y76.512 E.01814
G1 X101.173 Y103.489 E.96377
M73 P7 R11
G1 X101.681 Y103.489 E.01814
G1 X101.681 Y76.512 E.96377
G1 X102.189 Y76.512 E.01814
G1 X102.189 Y103.489 E.96377
G1 X102.697 Y103.489 E.01814
G1 X102.697 Y76.512 E.96376
G1 X103.204 Y76.512 E.01814
G1 X103.204 Y103.694 E.97111
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S6000
G17
G3 Z.6 I1.188 J-.266 P1  F42000
G1 X96.602 Y74.194 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X96.602 Y73.561 E.02263
M204 S6000
G1 X93.19 Y71.497 F42000
G1 F3000
M204 S500
G3 X97.326 Y74.4 I-.403 J4.973 E.18932
G1 X96.664 Y74.4 E.02366
G1 X96.4 Y74.664 E.01332
G1 X96.4 Y75.836 E.0419
G1 X96.664 Y76.1 E.01332
G1 X103.457 Y76.101 E.24269
G3 X103.7 Y76.367 I-.01 J.253 E.01432
G1 X103.7 Y102.934 E.94913
G2 X103.672 Y103.31 I.85 J.252 E.0136
G1 X103.668 Y103.77 E.01642
G1 X103.511 Y103.892 E.00712
G3 X103.433 Y103.9 I-.071 J-.309 E.0028
G1 X76.567 Y103.9 E.95982
G3 X76.332 Y103.77 I-.011 J-.259 E.0101
G1 X76.365 Y103.264 E.01814
G3 X76.3 Y102.934 I1.097 J-.388 E.01206
G1 X76.305 Y76.307 E.95127
G3 X76.561 Y76.1 I.25 J.048 E.01281
G1 X81.336 Y76.1 E.17059
G1 X81.6 Y75.836 E.01332
G1 X81.6 Y75.073 E.02726
G3 X81.834 Y75.183 I-.095 J.511 E.00934
G1 X82.797 Y74.27 E.04739
G3 X87.095 Y73.868 I2.504 J3.604 E.16124
G3 X88.58 Y73.55 I1.852 J5.019 E.05443
G3 X93.122 Y71.486 I3.884 J2.517 E.18823
; WIPE_START
G1 X94.107 Y71.66 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.253 J-1.19 P1  F42000
G1 X77.128 Y75.262 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X78.053 Y75.1 I.949 J2.694 E.03371
G1 X80.9 Y75.1 E.1017
G1 X80.9 Y75.4 E.01072
M73 P8 R11
G1 X76.803 Y75.4 E.14637
G3 X77.072 Y75.283 I1.275 J2.557 E.01049
; WIPE_START
G1 X77.382 Y75.183 E-.12365
G1 X77.78 Y75.113 E-.1538
G1 X78.05 Y75.1 E-.10255
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.008 J1.217 P1  F42000
G1 X102.876 Y75.262 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X103.199 Y75.401 I-.933 J2.606 E.01256
G1 X97.1 Y75.4 E.21788
G1 X97.1 Y75.1 E.01072
G1 X102.085 Y75.103 E.17809
G3 X102.819 Y75.242 I-.141 J2.764 E.02679
; WIPE_START
G1 X103.199 Y75.401 E-.1563
G1 X102.61 Y75.401 E-.22371
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.215 J.076 P1  F42000
G1 X104.371 Y103.454 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G3 X104.4 Y102.959 I3.403 J-.05 E.01772
G1 X104.4 Y76.603 E.94159
G1 X104.436 Y76.674 E.00285
G3 X104.7 Y77.853 I-2.521 J1.184 E.04352
G1 X104.7 Y102.147 E.8679
G3 X104.399 Y103.4 I-2.775 J-.004 E.04648
; WIPE_START
G1 X104.374 Y103.165 E-.09008
G1 X104.4 Y102.959 E-.07884
G1 X104.4 Y102.403 E-.21108
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.067 J-.585 P1  F42000
G1 X103.197 Y104.6 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X103.126 Y104.636 E.00286
G3 X101.947 Y104.9 I-1.184 J-2.521 E.04351
G1 X78.053 Y104.9 E.85361
G3 X76.803 Y104.6 I.024 J-2.855 E.04634
G1 X103.137 Y104.6 E.94081
; WIPE_START
G1 X103.126 Y104.636 E-.01433
G1 X102.876 Y104.739 E-.1025
G1 X102.487 Y104.847 E-.15372
G1 X102.22 Y104.887 E-.10259
G1 X102.202 Y104.888 E-.00686
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.886 J-.834 P1  F42000
G1 X75.6 Y76.603 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X75.6 Y102.959 E.94159
G3 X75.629 Y103.453 I-3.374 J.445 E.01772
G1 X75.625 Y103.446 E.0003
G3 X75.3 Y102.147 I2.538 J-1.325 E.04831
G1 X75.3 Y77.853 E.8679
G3 X75.574 Y76.657 I2.857 J.024 E.04419
; WIPE_START
G1 X75.575 Y77.657 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 2/30
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G1 X92.344 Y73.86 F42000
G1 Z.36
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X95.379 Y76.694 I.41 J2.603 E.11532
G1 X96.554 Y77.16 E.03048
G3 X97.32 Y77.856 I-1.096 J1.974 E.02519
G1 X98.064 Y78.069 E.01867
G3 X99.127 Y77.864 I.978 J2.214 E.02633
G1 X100.3 Y78.085 E.02877
G3 X102.81 Y78.491 I1.028 J1.611 E.06711
G3 X102.009 Y81.274 I-1.679 J1.023 E.0785
G1 X101.998 Y81.941 E.0161
G1 X102.339 Y82.597 E.01781
G3 X102.038 Y85.69 I-1.031 J1.461 E.09083
G1 X102.038 Y86.363 E.01623
G2 X102.744 Y87.357 I2.053 J-.711 E.0298
G3 X101.812 Y90.129 I-1.427 J1.063 E.08279
G1 X101.701 Y90.576 E.01109
G1 X101.758 Y91.345 E.0186
G3 X102.263 Y92.114 I-.552 J.912 E.02293
G3 X101.797 Y92.801 I-.909 J-.115 E.02078
G1 X101.686 Y93.554 E.01835
G3 X101.543 Y95.881 I-2.822 J.995 E.05775
G2 X102.449 Y97.208 I1.495 J-.048 E.04091
G3 X102.926 Y99.349 I-1.12 J1.373 E.05702
G1 X102.557 Y99.962 E.01726
G3 X102.85 Y101.416 I-27.375 J6.276 E.03577
G3 X99.717 Y102.559 I-1.787 J-.033 E.10367
G1 X98.977 Y102.385 E.01833
G3 X96.267 Y102.085 I-1.117 J-2.294 E.06935
G2 X95.73 Y102.047 I-.358 J1.246 E.01308
G1 X95.088 Y102.308 E.01673
G3 X92.13 Y102.748 I-1.643 J-.881 E.08368
G1 X91.251 Y101.924 E.02906
G1 X90.653 Y101.742 E.01508
G1 X89.969 Y102.157 E.0193
G2 X89.484 Y102.776 I1.804 J1.911 E.01901
G3 X88.163 Y102.257 I-.245 J-1.319 E.03607
G1 X87.742 Y102.062 E.01119
G1 X86.882 Y102.326 E.02169
G3 X83.782 Y102.424 I-1.577 J-.794 E.09133
G1 X83.354 Y101.498 E.02461
G1 X82.261 Y102.072 E.02978
G3 X80.151 Y102.702 I-1.327 J-.596 E.06022
G1 X79.378 Y102.032 E.02467
G1 X79.183 Y102.246 E.00697
G2 X78.553 Y102.305 I-.162 J1.669 E.01536
G3 X77.913 Y101.622 I.275 J-.898 E.0236
G1 X77.799 Y101.468 E.00462
G3 X78.141 Y100.77 I1.284 J.195 E.01905
G2 X78.075 Y99.562 I-1.928 J-.499 E.02963
G3 X78.427 Y98.153 I2.316 J-.169 E.03562
G1 X78.442 Y97.679 E.01145
G1 X78.053 Y97.008 E.01871
G3 X77.773 Y93.861 I.742 J-1.652 E.09258
G1 X77.574 Y92.918 E.02323
G3 X77.261 Y90.452 I1.098 J-1.393 E.06644
G2 X77.335 Y89.233 I-1.765 J-.719 E.02997
G3 X77.408 Y88.521 I3.355 J-.013 E.01728
G1 X77.276 Y87.878 E.01583
G3 X77.073 Y86.021 I1.372 J-1.089 E.04751
G1 X77.079 Y85.359 E.01597
G3 X77.59 Y83.102 I1.713 J-.799 E.06006
G1 X78.356 Y82.612 E.02193
G3 X78.069 Y81.479 I9.162 J-2.926 E.02822
G3 X78.595 Y79.977 I1.903 J-.176 E.03958
G1 X79.46 Y79.243 E.02734
G1 X78.531 Y78.582 E.02748
G1 X77.84 Y78.465 E.0169
G3 X78.156 Y77.424 I-.262 J-.648 E.0758
G1 X78.418 Y77.991 E.01507
G1 X79.516 Y77.867 E.02665
G3 X81.498 Y77.914 I.975 J.686 E.05644
G1 X81.718 Y78.47 E.01443
M73 P9 R11
G1 X82.75 Y78.8 E.02612
G1 X83.323 Y77.927 E.0252
G3 X84.79 Y76.042 I2.135 J.149 E.06109
G3 X84.967 Y75.904 I.162 J.025 E.00596
G3 X86.799 Y76.508 I.303 J2.163 E.04818
G3 X88.521 Y75.957 I495.65 J1544.514 E.04359
G3 X89.874 Y76.06 I.41 J3.563 E.03294
G3 X91.036 Y74.352 I5.169 J2.267 E.05008
G3 X92.286 Y73.86 I1.338 J1.564 E.03301
M204 S10000
G1 X93.01 Y73.442 F42000
G1 F9000
M204 S6000
G3 X95.782 Y76.402 I-.178 J2.946 E.10781
G1 X96.751 Y76.786 E.02513
G3 X97.548 Y77.485 I-1.085 J2.042 E.02579
G1 X98.065 Y77.632 E.01297
G3 X99.156 Y77.442 I.96 J2.283 E.02694
G1 X100.252 Y77.649 E.02689
G3 X103.097 Y80.888 I1.112 J1.892 E.14624
G3 X102.425 Y81.501 I-1.679 J-1.164 E.02212
G1 X102.42 Y81.842 E.00822
G1 X102.663 Y82.309 E.01269
G3 X102.458 Y85.913 I-1.333 J1.732 E.10242
G2 X102.693 Y86.702 I.862 J.173 E.02068
G3 X102.168 Y90.44 I-1.366 J1.713 E.10965
G2 X102.166 Y91.164 I1.102 J.365 E.01776
G3 X102.587 Y91.699 I-.681 J.97 E.01666
G3 X102.192 Y93.002 I-.967 J.418 E.03571
G2 X102.25 Y94.034 I1.219 J.449 E.02563
G3 X101.976 Y95.932 I-3.102 J.522 E.04699
G2 X102.716 Y96.881 I1.246 J-.208 E.03024
G3 X102.998 Y100.043 I-1.458 J1.724 E.08491
G3 X103.272 Y101.416 I-15.218 J3.758 E.03376
G3 X99.522 Y102.945 I-2.198 J-.028 E.12417
G1 X99.003 Y102.822 E.01285
G3 X96.099 Y102.481 I-1.153 J-2.715 E.07378
G2 X95.345 Y102.657 I-.185 J.91 E.01928
G3 X91.85 Y103.062 I-1.909 J-1.198 E.09732
G1 X91.036 Y102.297 E.02695
G1 X90.71 Y102.198 E.00819
G2 X89.716 Y103.15 I1.259 J2.312 E.03358
G3 X87.925 Y102.61 I-.491 J-1.609 E.04782
G1 X87.712 Y102.511 E.00567
G1 X87.157 Y102.681 E.01398
G3 X83.158 Y102.075 I-1.867 J-1.181 E.12326
G1 X82.547 Y102.396 E.01663
G3 X79.412 Y102.618 I-1.641 J-.932 E.08955
G1 X79.34 Y102.697 E.00259
G2 X78.521 Y102.729 I-.334 J1.974 E.01989
G3 X77.547 Y101.833 I.168 J-1.161 E.03391
G3 X77.48 Y101.033 I.556 J-.45 E.02056
G2 X77.774 Y100.131 I-.725 J-.735 E.02377
G3 X78.01 Y98.055 I2.291 J-.79 E.05208
G1 X78.019 Y97.786 E.00651
G1 X77.748 Y97.32 E.01299
G3 X77.315 Y93.724 I.999 J-1.944 E.10292
G1 X77.191 Y93.136 E.0145
G3 X76.868 Y90.28 I1.447 J-1.61 E.07579
G2 X76.914 Y89.251 I-1.498 J-.582 E.02528
G3 X76.983 Y88.537 I3.364 J-.038 E.01733
G1 X76.882 Y88.049 E.01203
G3 X76.654 Y85.935 I1.717 J-1.254 E.05368
G2 X76.482 Y84.778 I-2.998 J-.147 E.02839
G3 X77.873 Y82.423 I2.441 J-.147 E.07001
G1 X77.797 Y82.128 E.00735
G1 X77.63 Y82.117 E.00402
G2 X77.649 Y81.519 I-.546 J-.316 E.01504
G3 X78.776 Y79.272 I2.5 J-.152 E.06352
G2 X77.712 Y78.934 I-.875 J.909 E.02791
G3 X78.672 Y77.54 I-.139 J-1.124 E.12546
G1 X79.316 Y77.467 E.01562
G3 X82.036 Y78.131 I1.193 J1.015 E.0835
G1 X82.574 Y78.303 E.01363
G1 X82.916 Y77.781 E.01505
G3 X84.487 Y75.728 I2.429 J.23 E.06571
G3 X84.889 Y75.489 I.37 J.166 E.012
G3 X86.875 Y76.052 I.371 J2.48 E.05132
G3 X88.46 Y75.539 I13.709 J39.646 E.04018
G3 X89.654 Y75.604 I.429 J3.128 E.029
G3 X91.145 Y73.768 I4.115 J1.819 E.05772
G3 X92.254 Y73.44 I1.027 J1.434 E.02842
G1 X92.952 Y73.442 E.01682
; WIPE_START
G1 X93.515 Y73.503 E-.21534
G1 X93.922 Y73.651 E-.16466
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-.116 J-1.211 P1  F42000
G1 X76.983 Y75.273 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1111
M204 S5000
G3 X78.053 Y75.06 I1.072 J2.59 E.02648
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10355
G3 X76.928 Y75.297 I1.409 J2.423 E.00763
; WIPE_START
G1 F12000
M204 S6000
G1 X77.372 Y75.144 E-.17848
G1 X77.777 Y75.073 E-.15615
G1 X77.896 Y75.068 E-.04537
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-.01 J1.217 P1  F42000
G1 X103.016 Y75.275 Z.76
G1 Z.36
G1 E.4 F1800
G1 F1111
M204 S5000
G3 X103.356 Y75.441 I-1.104 J2.697 E.00911
G1 X97.06 Y75.44 E.15183
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X102.961 Y75.253 I-.175 J2.909 E.02164
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16624
G1 X102.793 Y75.441 E-.21377
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z.76
G1 Z.36
G1 E.4 F1800
G1 F1111
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.958 I-.681 J-.192 E.00494
G1 X104.36 Y76.446 E.63934
G1 X104.41 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.022 E.03551
; WIPE_START
G1 F12000
M204 S6000
M73 P9 R10
G1 X104.334 Y103.16 E-.14978
G1 X104.36 Y102.958 E-.07755
G1 X104.36 Y102.556 E-.15268
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.088 J-.546 P1  F42000
G1 X103.354 Y104.56 Z.76
G1 Z.36
G1 E.4 F1800
G1 F1111
M204 S5000
G1 X103.265 Y104.61 E.00247
G3 X101.947 Y104.94 I-1.342 J-2.569 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.005 J-2.814 E.03556
G1 X103.294 Y104.56 E.64264
; WIPE_START
M73 P10 R10
G1 F12000
M204 S6000
G1 X103.265 Y104.61 E-.02213
G1 X103.018 Y104.728 E-.10412
G1 X102.628 Y104.856 E-.15599
G1 X102.374 Y104.9 E-.09776
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I.887 J-.833 P1  F42000
G1 X75.64 Y76.446 Z.76
G1 Z.36
G1 E.4 F1800
G1 F1111
M204 S5000
G1 X75.64 Y102.958 E.63934
G3 X75.67 Y103.605 I-3.912 J.507 E.01565
G3 X75.26 Y102.147 I2.463 J-1.48 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.61 Y76.498 I2.805 J.003 E.03411
; WIPE_START
G1 F12000
M204 S6000
G1 X75.612 Y77.498 E-.38
; WIPE_END
G1 E-.02 F1800
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

; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 3/30
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
G1 X77.717 Y77.116 F42000
G1 Z.52
G1 E.4 F1800
; FEATURE: Support
G1 F1148
M204 S6000
G3 X78.163 Y77.422 I-.184 J.746 E.01332
G1 X78.522 Y78.209 E.02085
G2 X77.858 Y78.462 I-.089 J.766 E.01783
G3 X77.662 Y77.1 I-.294 J-.653 E.06389
; WIPE_START
G1 F9000
G1 X78.03 Y77.268 E-.15354
G1 X78.163 Y77.422 E-.07755
G1 X78.326 Y77.779 E-.1489
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I.312 J1.176 P1  F42000
G1 X93.073 Y73.865 Z.92
G1 Z.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X95.364 Y76.278 I-.21 J2.493 E.0878
G2 X96.562 Y77.167 I1.811 J-1.19 E.0367
G3 X97.385 Y78.065 I-1.044 J1.783 E.02983
G1 X98.24 Y78.095 E.02065
G3 X99.812 Y78.082 I.806 J2.417 E.03854
G2 X101.064 Y77.773 I-.624 J-5.215 E.03118
G3 X102.078 Y81.193 I.282 J1.777 E.12493
G2 X102.367 Y82.587 I1.313 J.455 E.03604
G3 X102.481 Y85.385 I-1.07 J1.445 E.0774
G1 X101.659 Y85.942 E.02395
G1 X102.254 Y86.929 E.02779
G3 X101.622 Y90.201 I-.98 J1.508 E.10278
G2 X101.909 Y91.422 I2.737 J.003 E.03053
G3 X102.232 Y92.472 I-.404 J.699 E.02915
G1 X101.939 Y92.76 E.00991
G1 X101.658 Y93.466 E.01832
G3 X101.525 Y95.878 I-2.553 J1.069 E.06027
G1 X101.591 Y96.322 E.01083
G1 X101.962 Y96.905 E.01665
G3 X102.61 Y99.888 I-.766 J1.729 E.08571
G2 X102.806 Y101.037 I2.239 J.209 E.02842
G3 X99.678 Y102.521 I-1.744 J.362 E.11447
G1 X98.927 Y102.404 E.01832
G3 X96.235 Y102.062 I-1.073 J-2.314 E.06902
G1 X95.701 Y102.036 E.0129
G1 X95.023 Y102.4 E.01854
G3 X91.753 Y102.107 I-1.566 J-.922 E.09886
G2 X90.508 Y101.581 I-3.525 J6.607 E.03264
G1 X90.045 Y102.051 E.0159
G3 X88.489 Y102.525 I-2.837 J-6.519 E.03931
G3 X87.911 Y101.801 I1.681 J-1.933 E.02245
G1 X86.886 Y102.31 E.02761
G3 X83.554 Y101.725 I-1.579 J-.787 E.10908
G1 X83.554 Y100.672 E.02541
G1 X82.342 Y100.626 E.02926
M73 P11 R10
G1 X82.238 Y102.001 E.03325
G3 X80.126 Y102.59 I-1.312 J-.626 E.05988
G1 X79.917 Y102.404 E.00675
G1 X79.165 Y102.184 E.0189
G3 X78.07 Y102.109 I-.508 J-.606 E.02925
G3 X78.146 Y100.804 I1.206 J-.584 E.03294
G3 X78.301 Y100.227 I.448 J-.189 E.0155
G3 X78.759 Y97.917 I1.943 J-.815 E.06027
G1 X78.185 Y97.078 E.02452
G3 X77.607 Y93.985 I.64 J-1.72 E.09116
G1 X77.688 Y93.537 E.01098
G2 X77.149 Y92.433 I-1.745 J.167 E.03027
G3 X77.382 Y90.309 I1.513 J-.909 E.05532
G3 X77.381 Y88.661 I14.968 J-.836 E.03977
G1 X77.383 Y88.004 E.01585
G3 X77.017 Y86.083 I1.471 J-1.276 E.04941
G1 X77.081 Y85.388 E.01683
G3 X78.148 Y82.789 I1.757 J-.797 E.07589
G1 X78.451 Y82.042 E.01943
G3 X78.852 Y79.953 I2.359 J-.63 E.05307
G1 X79.729 Y79.426 E.02468
G1 X79.451 Y78.933 E.01365
G1 X79.701 Y77.8 E.02797
G3 X81.605 Y78.672 I.789 J.792 E.06539
G1 X82.625 Y79.071 E.02641
G1 X83.133 Y78.52 E.01807
G2 X83.395 Y77.26 I-3.491 J-1.385 E.03119
G3 X85.159 Y75.98 I2.096 J1.032 E.05467
G1 X85.185 Y75.931 E.00133
G3 X86.714 Y76.477 I.151 J1.991 E.04031
G1 X87.471 Y76.434 E.01828
G3 X89.841 Y76.118 I1.557 J2.636 E.05924
G3 X90.747 Y74.649 I38.099 J22.483 E.04162
G3 X92.413 Y73.872 I1.609 J1.275 E.04597
G1 X93.016 Y73.862 E.01453
M204 S10000
G1 X93.179 Y73.449 F42000
G1 F9000
M204 S6000
G3 X95.767 Y76.123 I-.349 J2.928 E.09713
G2 X96.759 Y76.793 I1.448 J-1.073 E.02943
G3 X97.627 Y77.653 I-1.153 J2.031 E.02981
G2 X98.655 Y77.544 I.341 J-1.683 E.02532
G3 X99.844 Y77.655 I.363 J2.54 E.02907
G2 X101.004 Y77.356 I-1.002 J-6.29 E.02893
G3 X102.454 Y81.451 I.356 J2.178 E.14826
G2 X102.702 Y82.329 I.875 J.227 E.02304
G3 X102.225 Y86.066 I-1.418 J1.718 E.1083
G1 X102.566 Y86.633 E.01596
G3 X102.077 Y90.472 I-1.269 J1.789 E.1143
G2 X102.57 Y91.508 I1.525 J-.09 E.02838
G3 X102.296 Y92.998 I-.871 J.61 E.04065
G1 X102.099 Y93.493 E.01286
G3 X101.958 Y95.935 I-2.828 J1.062 E.06072
G2 X102.729 Y96.905 I1.283 J-.228 E.03114
G3 X103.038 Y99.998 I-1.46 J1.707 E.08278
G2 X103.218 Y100.946 I1.859 J.138 E.02355
G3 X99.496 Y102.918 I-2.141 J.458 E.13666
G1 X98.97 Y102.836 E.01285
G3 X96.091 Y102.475 I-1.12 J-2.729 E.07315
G1 X95.797 Y102.461 E.0071
G1 X95.325 Y102.715 E.01293
G3 X91.435 Y102.421 I-1.862 J-1.24 E.11425
G2 X90.616 Y102.069 I-2.35 J4.342 E.02153
G3 X89.958 Y102.541 I-.889 J-.544 E.02007
G1 X89.033 Y102.806 E.0232
G1 X89.533 Y103.02 E.01312
G3 X88.972 Y103.189 I-.424 J-.394 E.0148
G3 X87.775 Y102.338 I.347 J-1.756 E.0365
G1 X87.182 Y102.632 E.01596
G3 X83.134 Y101.771 I-1.88 J-1.108 E.13131
G1 X83.134 Y101.076 E.01676
G1 X82.73 Y101.061 E.00976
G1 X82.644 Y102.195 E.02743
G3 X82.064 Y102.862 I-17.038 J-14.224 E.02133
G3 X79.709 Y102.781 I-1.132 J-1.352 E.06225
G1 X79.189 Y102.629 E.01305
G3 X77.542 Y101.302 I-.576 J-.97 E.06609
G3 X77.714 Y100.723 I.881 J-.053 E.01486
G3 X77.855 Y100.154 I.437 J-.194 E.01524
G3 X78.241 Y97.904 I2.2 J-.78 E.05751
G1 X77.892 Y97.394 E.0149
G3 X77.212 Y93.81 I.895 J-2.026 E.10335
G1 X77.257 Y93.562 E.00609
G2 X76.788 Y92.65 I-1.452 J.171 E.02525
G3 X76.961 Y90.169 I1.852 J-1.117 E.06391
G3 X76.961 Y88.643 I12.751 J-.766 E.03682
G1 X76.962 Y88.144 E.01203
G3 X76.607 Y85.952 I1.936 J-1.439 E.05567
G2 X76.503 Y84.89 I-2.12 J-.328 E.02599
G3 X77.81 Y82.504 I2.336 J-.271 E.06997
G1 X78.017 Y81.996 E.01323
G3 X78.57 Y79.633 I2.472 J-.667 E.06096
G1 X79.163 Y79.277 E.01669
G1 X79.007 Y78.999 E.00768
G1 X79.1 Y78.577 E.01042
G1 X78.348 Y78.647 E.01822
G3 X78.662 Y77.503 I-.769 J-.826 E.14094
G1 X78.864 Y77.561 E.00507
G1 X79.442 Y77.469 E.01411
G3 X81.977 Y78.367 I1.042 J1.085 E.08023
G1 X82.51 Y78.575 E.01382
G2 X82.93 Y77.522 I-.932 J-.982 E.02822
G3 X84.394 Y75.774 I2.106 J.277 E.05802
G1 X84.874 Y75.628 E.01209
G3 X85.878 Y75.548 I.608 J1.286 E.02483
G3 X86.83 Y76.05 I-.694 J2.471 E.02617
G2 X87.864 Y75.773 I.188 J-1.367 E.02651
G3 X89.628 Y75.669 I1.072 J3.182 E.0431
G3 X90.427 Y74.374 I22.466 J12.975 E.0367
G3 X92.378 Y73.452 I1.929 J1.555 E.05384
G3 X93.121 Y73.446 I.423 J6.465 E.01793
; WIPE_START
G1 X93.599 Y73.529 E-.18457
G1 X94.081 Y73.71 E-.19543
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-.111 J-1.212 P1  F42000
G1 X76.982 Y75.273 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1148
M204 S5000
G3 X78.053 Y75.06 I1.073 J2.592 E.0265
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.927 Y75.297 I1.41 J2.425 E.00762
; WIPE_START
G1 F12000
M204 S6000
G1 X77.371 Y75.144 E-.17859
G1 X77.776 Y75.073 E-.15621
G1 X77.895 Y75.068 E-.0452
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-.01 J1.217 P1  F42000
G1 X103.016 Y75.276 Z.92
G1 Z.52
G1 E.4 F1800
G1 F1148
M204 S5000
G3 X103.356 Y75.441 I-1.107 J2.705 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X102.961 Y75.253 I-.177 J2.918 E.02164
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.1662
G1 X102.793 Y75.441 E-.2138
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z.92
G1 Z.52
G1 E.4 F1800
G1 F1148
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.68 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.411 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.892 J-.027 E.03551
; WIPE_START
G1 F12000
M204 S6000
M73 P12 R10
G1 X104.334 Y103.16 E-.14975
G1 X104.36 Y102.957 E-.0777
G1 X104.36 Y102.556 E-.15255
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.088 J-.546 P1  F42000
G1 X103.354 Y104.56 Z.92
G1 Z.52
G1 E.4 F1800
G1 F1148
M204 S5000
G1 X103.265 Y104.61 E.00247
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.006 J-2.818 E.03556
G1 X103.294 Y104.56 E.64264
; WIPE_START
G1 F12000
M204 S6000
G1 X103.265 Y104.61 E-.02212
G1 X103.018 Y104.728 E-.1041
G1 X102.628 Y104.856 E-.156
G1 X102.374 Y104.9 E-.09778
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I.887 J-.833 P1  F42000
G1 X75.64 Y76.446 Z.92
G1 Z.52
G1 E.4 F1800
G1 F1148
M204 S5000
G1 X75.64 Y102.957 E.63934
G3 X75.67 Y103.605 I-3.929 J.508 E.01566
G3 X75.26 Y102.147 I2.463 J-1.48 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.61 Y76.498 I2.805 J.003 E.03411
; WIPE_START
G1 F12000
M204 S6000
G1 X75.612 Y77.498 E-.38
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 4/30
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
G1 X76.951 Y77.434 F42000
G1 Z.68
G1 E.4 F1800
; FEATURE: Support
G1 F1457
M204 S6000
G3 X77.662 Y77.1 I.628 J.413 E.01993
G1 X77.778 Y76.696 E.01013
G1 X77.878 Y76.726 E.00252
G3 X77.398 Y76.68 I-.345 J1.08 E.16008
G1 X77.722 Y76.68 E.00783
; WIPE_START
G1 F9000
G1 X77.878 Y76.726 E-.06173
G1 X78.307 Y76.947 E-.18348
G1 X78.52 Y77.193 E-.12344
G1 X78.53 Y77.221 E-.01134
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I.279 J1.185 P1  F42000
G1 X92.805 Y73.862 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X95.394 Y76.511 I.02 J2.571 E.09975
G2 X96.525 Y77.164 I1.693 J-1.627 E.0319
G3 X97.329 Y77.988 I-.985 J1.765 E.02815
G1 X98.2 Y78.182 E.02153
G3 X99.795 Y78.03 I.955 J1.569 E.03998
G2 X100.894 Y77.824 I.268 J-1.601 E.02751
G3 X102.885 Y80.476 I.492 J1.704 E.10336
G3 X102.157 Y81.136 I-1.568 J-.999 E.02398
G1 X101.967 Y81.51 E.01013
G1 X102.005 Y82.016 E.01223
G2 X102.721 Y82.97 I2.182 J-.893 E.02907
G3 X102.013 Y85.69 I-1.441 J1.077 E.0778
G1 X102.013 Y86.363 E.01623
G2 X102.721 Y87.354 I2.008 J-.686 E.0298
G3 X102.451 Y89.776 I-1.423 J1.068 E.06474
G1 X101.9 Y90.136 E.01588
G2 X101.778 Y90.804 I.906 J.511 E.01666
G1 X101.992 Y91.432 E.01601
G3 X102.408 Y92.313 I-.52 J.785 E.0247
G3 X101.843 Y93.011 I-4.274 J-2.883 E.02168
G1 X101.701 Y93.729 E.01763
M73 P13 R10
G3 X101.538 Y95.813 I-2.409 J.86 E.05194
G1 X101.53 Y96.295 E.01162
G1 X101.946 Y96.918 E.01805
G3 X102.601 Y99.915 I-.741 J1.732 E.08645
G2 X102.833 Y101.416 I12.706 J-1.198 E.03664
G3 X100.046 Y102.821 I-1.749 J-.003 E.09297
G1 X99.606 Y102.424 E.0143
G1 X98.839 Y102.437 E.0185
G3 X96.088 Y101.965 I-1.011 J-2.355 E.07116
G1 X95.155 Y102.21 E.02327
G3 X91.874 Y102.344 I-1.672 J-.704 E.09902
G1 X91.501 Y101.805 E.01582
G1 X90.935 Y101.596 E.01453
G1 X90.152 Y101.859 E.01994
G3 X89.42 Y102.355 I-.878 J-.507 E.02206
G1 X88.954 Y102.672 E.01359
G3 X88.184 Y102.176 I.214 J-1.179 E.02267
G2 X87.299 Y102.136 I-.476 J.726 E.02242
G2 X86.415 Y102.887 I1.349 J2.485 E.02818
G3 X83.744 Y102.341 I-1.106 J-1.394 E.07487
G1 X83.478 Y101.624 E.01845
G1 X82.773 Y101.595 E.01702
G1 X82.115 Y101.925 E.01776
G3 X79.824 Y102.082 I-1.187 J-.534 E.06779
G3 X78.509 Y102.462 I-4.363 J-12.635 E.03304
G3 X77.937 Y101.42 I.157 J-.764 E.03259
G2 X78.4 Y100.159 I-3.033 J-1.83 E.03261
G3 X78.563 Y98.276 I1.643 J-.806 E.04788
G1 X78.651 Y97.812 E.01139
G1 X78.24 Y97.102 E.01978
G3 X77.626 Y94.031 I.591 J-1.715 E.09114
G1 X77.686 Y93.413 E.01497
G2 X77.042 Y92.184 I-6.413 J2.575 E.03352
G3 X77.309 Y90.394 I1.68 J-.664 E.0457
G1 X77.416 Y89.733 E.01616
G3 X77.449 Y88.45 I2.737 J-.572 E.03123
G2 X76.977 Y87.261 I-8.508 J2.691 E.03087
G3 X77.003 Y86.197 I1.866 J-.487 E.02601
G3 X77.024 Y85.234 I2.85 J-.419 E.02334
G3 X78.199 Y82.804 I1.844 J-.607 E.07195
G2 X78.558 Y80.499 I-4.784 J-1.926 E.05675
G3 X79.215 Y79.673 I2.978 J1.693 E.02556
G1 X79.637 Y79.073 E.01768
G3 X79.616 Y78.393 I1.084 J-.374 E.01667
G2 X79.917 Y78.006 I-.143 J-.422 E.01252
G3 X80.952 Y77.846 I.572 J.274 E.0297
G3 X81.553 Y78.741 I-1.691 J1.786 E.02621
G1 X82.488 Y79.088 E.02405
G1 X83.045 Y78.724 E.01604
G1 X83.383 Y78.046 E.01829
G3 X84.843 Y76.075 I1.638 J-.314 E.06645
G3 X86.686 Y76.482 I.564 J1.82 E.04763
G1 X86.924 Y76.44 E.00583
G1 X87.497 Y76.578 E.0142
G3 X89.408 Y76.185 I1.449 J2.2 E.04822
G2 X90.267 Y75.508 I-.387 J-1.374 E.02706
G3 X91.318 Y74.172 I3.309 J1.52 E.04136
G3 X92.747 Y73.861 I1.897 J5.282 E.03538
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.044 Y73.445 F42000
G1 F9000
M204 S6000
G3 X95.787 Y76.28 I-.287 J3.022 E.10356
G2 X96.716 Y76.787 I1.34 J-1.351 E.02584
G3 X97.591 Y77.616 I-1.132 J2.073 E.02941
G1 X98.153 Y77.741 E.01387
G3 X99.84 Y77.608 I.998 J1.894 E.04197
G2 X100.776 Y77.419 I.209 J-1.371 E.0235
G3 X103.264 Y80.661 I.609 J2.109 E.12675
G3 X102.482 Y81.423 I-1.812 J-1.078 E.02663
G2 X102.417 Y81.888 I.35 J.287 E.01192
G2 X103.054 Y82.708 I1.887 J-.808 E.02531
G3 X102.433 Y85.913 I-1.735 J1.326 E.08889
G2 X102.668 Y86.703 I.863 J.173 E.0207
G3 X102.25 Y90.41 I-1.357 J1.724 E.10754
G2 X102.198 Y90.734 I.445 J.238 E.00808
G2 X102.658 Y91.521 I1.075 J-.101 E.02268
G3 X102.389 Y93.004 I-.869 J.609 E.04044
G1 X102.235 Y93.195 E.00591
G1 X102.133 Y93.708 E.01263
G3 X101.956 Y95.902 I-2.766 J.881 E.05443
G1 X101.952 Y96.171 E.00648
G2 X102.744 Y96.93 I1.261 J-.523 E.02723
G3 X103.029 Y100.023 I-1.53 J1.7 E.08234
G2 X103.255 Y101.416 I21.285 J-2.745 E.03404
G3 X99.447 Y102.847 I-2.18 J-.018 E.12647
G2 X98.164 Y103.052 I.153 J5.077 E.03142
G3 X96.01 Y102.42 I-.3 J-2.966 E.05551
G1 X95.428 Y102.572 E.01451
G3 X91.514 Y102.563 I-1.954 J-1.051 E.11556
G1 X91.231 Y102.153 E.01202
G1 X90.929 Y102.041 E.00776
G1 X90.402 Y102.218 E.01339
G3 X89.608 Y102.735 I-1.034 J-.719 E.02344
G2 X89.103 Y103.088 I58.669 J84.485 E.01486
G3 X87.953 Y102.54 I-.079 J-1.314 E.03206
G2 X87.468 Y102.53 I-.251 J.404 E.01229
G2 X86.685 Y103.212 I1.235 J2.207 E.02519
G3 X83.182 Y102.032 I-1.377 J-1.705 E.10611
G1 X82.864 Y102.019 E.00766
G2 X82.111 Y102.645 I.228 J1.041 E.02453
G3 X79.693 Y102.556 I-1.169 J-1.128 E.06583
G3 X78.495 Y102.887 I-2.51 J-6.743 E.03002
G3 X77.48 Y101.686 I.091 J-1.107 E.04213
G3 X77.856 Y100.693 I1.776 J.105 E.02602
G1 X77.965 Y100.186 E.0125
G3 X78.165 Y98.12 I2.018 J-.847 E.05216
G1 X78.209 Y97.887 E.00571
G1 X77.932 Y97.408 E.01335
G3 X77.222 Y93.84 I.855 J-2.025 E.10333
G2 X76.879 Y92.759 I-1.306 J-.181 E.02827
G3 X76.908 Y90.243 I1.797 J-1.238 E.06468
G2 X76.931 Y89.086 I-3.222 J-.642 E.02806
G1 X77.02 Y88.484 E.01468
G2 X76.572 Y87.376 I-11.278 J3.912 E.02882
G3 X76.581 Y86.16 I2.218 J-.592 E.02967
G2 X76.496 Y84.733 I-6.816 J-.311 E.03455
G3 X77.856 Y82.52 I2.286 J-.119 E.0666
G2 X78.134 Y80.426 I-4.692 J-1.687 E.05131
G3 X78.9 Y79.39 I3.334 J1.665 E.03125
G1 X79.202 Y78.961 E.01265
G3 X79.472 Y77.984 I.826 J-.298 E.02607
G3 X81.5 Y77.868 I1.036 J.325 E.06337
G3 X81.871 Y78.411 I-.437 J.697 E.01631
G1 X82.435 Y78.621 E.01451
G1 X82.72 Y78.435 E.00819
G1 X82.958 Y77.958 E.01285
G3 X84.491 Y75.736 I1.969 J-.282 E.07157
G3 X86.317 Y75.74 I.907 J2.426 E.045
G1 X86.777 Y76.04 E.01323
G1 X86.938 Y76.012 E.00394
G1 X87.439 Y76.133 E.01245
G3 X89.328 Y75.758 I1.441 J2.32 E.04744
G2 X90.152 Y74.79 I-.722 J-1.449 E.03152
G3 X92.472 Y73.465 I2.318 J1.366 E.06742
G3 X92.986 Y73.444 I.356 J2.466 E.01244
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.65 Y73.546 E-.25504
G1 X93.957 Y73.664 E-.12496
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-.468 J-1.123 P1  F42000
G1 X75.668 Y81.289 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1457
M204 S6000
G1 X75.668 Y81.011 E.00724
G1 F600
G1 X76.05 Y81.011 E.00994
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G1 X76.239 Y81.011 E.00492
G1 X76.239 Y81.289 E.00724
M106 S124.95
M106 S127.5
G1 F3000
G1 X76.05 Y81.289 E.00492
M106 S124.95
M106 S127.5
; FEATURE: Inner wall
G1 F600
M204 S6000
G1 X75.728 Y81.289 E.00838
M106 S124.95
M106 S127.5
; WIPE_START
G1 X75.668 Y81.011 E-.10833
G1 X76.05 Y81.011 E-.14535
G1 X76.239 Y81.011 E-.07195
G1 X76.239 Y81.154 E-.05438
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-1.216 J-.036 P1  F42000
G1 X75.668 Y100.289 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F1457
M204 S6000
G1 X75.668 Y100.011 E.00724
G1 F600
G1 X76.05 Y100.011 E.00994
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G1 X76.239 Y100.011 E.00492
G1 X76.239 Y100.289 E.00724
M106 S124.95
M106 S127.5
G1 F3000
G1 X76.05 Y100.289 E.00492
M106 S124.95
M106 S127.5
; FEATURE: Inner wall
G1 F600
M204 S6000
G1 X75.728 Y100.289 E.00838
M106 S124.95
M106 S127.5
M204 S250
G1 X75.681 Y100.69 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1457
M204 S5000
G1 X75.64 Y100.69 E.00099
G1 X75.64 Y102.957 E.05468
G3 X75.67 Y103.605 I-3.922 J.507 E.01565
G3 X75.26 Y102.147 I2.463 J-1.48 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.805 J.003 E.03556
G1 X75.64 Y79.41 E.07149
G1 X75.64 Y79.81 E.00965
G1 X75.64 Y80.21 E.00965
G1 X75.64 Y80.61 E.00965
G1 F747.227
G1 X75.681 Y80.61 E.00099
G1 F600
G1 X76.05 Y80.61 E.0089
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X76.64 Y80.61 E.01533
G1 X76.64 Y81.69 E.02807
G1 X76.05 Y81.69 E.01533
M106 S124.95
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X75.681 Y81.69 E.0089
M106 S124.95
M106 S127.5
G1 F747.227
G1 X75.64 Y81.69 E.00099
G1 F1457
G1 X75.64 Y82.09 E.00965
G1 X75.64 Y82.49 E.00965
G1 X75.64 Y82.89 E.00965
G1 X75.64 Y98.41 E.37427
G1 X75.64 Y98.81 E.00965
G1 X75.64 Y99.21 E.00965
G1 X75.64 Y99.61 E.00965
G1 F747.227
G1 X75.681 Y99.61 E.00099
G1 F600
G1 X76.05 Y99.61 E.0089
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X76.64 Y99.61 E.01533
G1 X76.64 Y100.69 E.02807
G1 X76.05 Y100.69 E.01533
M106 S124.95
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X75.741 Y100.69 E.00745
M106 S124.95
M106 S127.5
; WIPE_START
M204 S6000
G1 X75.64 Y100.69 E-.03838
G1 X75.64 Y101.589 E-.34162
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.215 J.062 P1  F42000
G1 X76.982 Y75.273 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F1457
M204 S5000
G3 X78.053 Y75.06 I1.074 J2.592 E.0265
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.927 Y75.297 I1.41 J2.426 E.00761
; WIPE_START
G1 F12000
M204 S6000
G1 X77.372 Y75.144 E-.179
M73 P14 R10
G1 X77.777 Y75.073 E-.15593
G1 X77.895 Y75.068 E-.04508
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-.021 J1.217 P1  F42000
G1 X100.711 Y75.468 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1457
M204 S6000
G1 X100.989 Y75.468 E.00724
G1 F600
G1 X100.989 Y75.851 E.00994
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall
G1 F3000
M204 S5000
G1 X100.989 Y76.239 E.01011
M106 S124.95
M106 S127.5
G1 F600
G1 X100.711 Y76.239 E.00724
G1 X100.711 Y75.85 E.01011
M106 S124.95
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X100.711 Y75.528 E.00838
M106 S124.95
M106 S127.5
M204 S250
G1 X100.31 Y75.481 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1457
M204 S5000
G1 X100.31 Y75.44 E.001
G1 X97.06 Y75.44 E.07837
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X103.354 Y75.44 I-.17 J2.893 E.03217
G1 X102.59 Y75.44 E.01843
G1 X102.19 Y75.44 E.00965
G1 X101.79 Y75.44 E.00965
G1 X101.39 Y75.44 E.00965
G1 F749.426
G1 X101.39 Y75.482 E.001
G1 F600
G1 X101.39 Y75.851 E.0089
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X101.39 Y76.64 E.02052
G1 X100.31 Y76.64 E.02807
G1 X100.31 Y75.85 E.02052
M106 S124.95
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X100.31 Y75.541 E.00745
M106 S124.95
M106 S127.5
; WIPE_START
M204 S6000
G1 X100.31 Y75.44 E-.03855
G1 X99.411 Y75.44 E-.34145
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-1.186 J.271 P1  F42000
G1 X103.95 Y95.289 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
M204 S5000
G1 X103.761 Y95.289 E.00492
G1 X103.761 Y95.011 E.00724
G1 X103.95 Y95.011 E.00492
M106 S124.95
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X104.333 Y95.011 E.00994
M106 S124.95
M106 S127.5
G1 F1182.642
G1 X104.339 Y95.289 E.00725
G1 F623.509
G1 X104.333 Y95.289 E.00018
G1 F600
G1 X104.01 Y95.289 E.00838
M106 S124.95
M106 S127.5
M204 S250
G1 X104.319 Y95.69 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X103.95 Y95.69 E.0089
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X103.36 Y95.69 E.01533
G1 X103.36 Y94.61 E.02807
G1 X103.95 Y94.61 E.01533
M106 S124.95
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X104.319 Y94.61 E.0089
M106 S124.95
G1 F747.227
G1 X104.36 Y94.61 E.00099
G1 F1457
G1 X104.36 Y94.21 E.00965
G1 X104.36 Y93.81 E.00965
G1 X104.36 Y93.41 E.00965
G1 X104.36 Y76.446 E.4091
G1 X104.411 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.33 Y103.605 I-2.898 J-.029 E.03695
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y95.709 E.1748
; WIPE_START
G1 F12000
M204 S6000
G1 X103.95 Y95.69 E-.15597
G1 X103.36 Y95.69 E-.22403
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-1.217 J-.001 P1  F42000
G1 X103.354 Y104.56 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F1457
M204 S5000
G1 X103.265 Y104.61 E.00247
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.003 J-2.806 E.03556
G1 X103.294 Y104.56 E.64264
; WIPE_START
G1 F12000
M204 S6000
G1 X103.265 Y104.61 E-.02212
G1 X102.994 Y104.737 E-.11375
G1 X102.628 Y104.856 E-.14639
G1 X102.374 Y104.9 E-.09773
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 5/30
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G1 X93.093 Y73.895 F42000
G1 Z.84
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X95.368 Y76.543 I-.311 J2.568 E.09241
G2 X96.488 Y77.161 I1.645 J-1.656 E.03126
G3 X97.346 Y78.047 I-.957 J1.784 E.03022
G1 X98.237 Y78.126 E.02158
G3 X99.813 Y78.006 I.907 J1.502 E.03953
G2 X100.869 Y77.839 I.326 J-1.357 E.02645
G3 X102.259 Y77.95 I.536 J2.055 E.03427
G3 X102.5 Y80.87 I-.951 J1.548 E.08219
G1 X101.884 Y81.351 E.01886
G1 X101.958 Y82.029 E.01645
G2 X102.698 Y82.963 I2.294 J-1.059 E.02901
G3 X102.059 Y85.625 I-1.383 J1.076 E.07578
G2 X102.148 Y86.853 I1.979 J.473 E.03015
G3 X102.422 Y89.783 I-.872 J1.559 E.08338
G1 X101.768 Y90.194 E.01862
G1 X101.758 Y90.882 E.01661
M73 P15 R10
G2 X102.402 Y91.782 I1.884 J-.669 E.02703
G3 X101.966 Y92.801 I-.62 J.337 E.03073
G1 X101.658 Y93.662 E.02207
G3 X101.771 Y95.192 I-1.772 J.901 E.03799
G1 X101.441 Y95.972 E.02041
G1 X101.593 Y96.497 E.01317
G2 X102.479 Y97.272 I1.97 J-1.356 E.02868
G3 X102.694 Y99.776 I-1.326 J1.375 E.06613
G1 X102.579 Y100.482 E.01726
G3 X99.815 Y102.585 I-1.468 J.939 E.12515
G1 X99.072 Y102.333 E.01892
G3 X96.257 Y102.073 I-1.209 J-2.281 E.07214
G1 X95.778 Y102.019 E.01163
G1 X95.075 Y102.388 E.01914
G3 X91.794 Y102.136 I-1.582 J-.893 E.09928
G1 X91.188 Y101.39 E.02318
G1 X90.228 Y101.838 E.02554
G3 X89.241 Y102.367 I-.869 J-.436 E.02879
G1 X88.769 Y102.533 E.01207
G3 X88.137 Y102.056 I.524 J-1.353 E.01935
G1 X87.607 Y101.961 E.01298
G1 X86.87 Y102.287 E.01942
G3 X83.508 Y101.573 I-1.586 J-.803 E.11244
G2 X81.947 Y101.885 I-.58 J1.162 E.04133
G3 X80.073 Y102.177 I-1.041 J-.522 E.05343
G1 X79.242 Y102.141 E.02006
G3 X78.258 Y102.485 I-.794 J-.691 E.02631
G3 X78.013 Y101.254 I.503 J-.74 E.03353
G1 X78.24 Y100.97 E.00876
G1 X78.458 Y100.258 E.01796
G3 X78.397 Y98.58 I1.712 J-.902 E.04189
G1 X78.865 Y97.836 E.02119
G1 X78.236 Y97.066 E.02396
G3 X77.817 Y93.871 I.592 J-1.703 E.09617
G1 X77.646 Y92.948 E.02263
G3 X77.406 Y90.28 I1.11 J-1.445 E.07256
G3 X77.443 Y88.091 I68.943 J.083 E.05281
G3 X77.04 Y86.199 I1.383 J-1.284 E.04896
G1 X77.146 Y85.575 E.01528
G3 X78.444 Y82.81 I1.658 J-.909 E.08574
G1 X78.698 Y81.919 E.02235
G3 X78.614 Y80.865 I1.102 J-.618 E.02631
G2 X78.842 Y80.112 I-1.458 J-.853 E.01914
G2 X79.749 Y78.97 I-2.273 J-2.736 E.03541
G3 X80.055 Y77.74 I1.609 J-.253 E.03141
G3 X81.205 Y78.323 I.429 J.578 E.03848
G1 X81.403 Y78.667 E.00959
G1 X81.999 Y79.057 E.01716
G1 X82.948 Y79.188 E.02311
G1 X83.409 Y78.279 E.02457
G3 X83.649 Y76.723 I3.573 J-.246 E.03829
G3 X86.755 Y76.67 I1.578 J1.451 E.0838
G1 X87.6 Y76.693 E.02039
G3 X89.836 Y76.439 I1.363 J2.028 E.0564
G3 X90.763 Y74.705 I10.717 J4.611 E.04748
G3 X92.022 Y73.995 I1.73 J1.595 E.03543
G3 X93.036 Y73.886 I.848 J3.129 E.0247
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.444 Y73.524 F42000
G1 F9000
M204 S6000
G3 X95.76 Y76.305 I-.593 J2.849 E.0942
G2 X96.672 Y76.78 I1.289 J-1.362 E.02512
G3 X97.591 Y77.647 I-1.064 J2.049 E.03086
G1 X98.166 Y77.698 E.01393
G3 X99.877 Y77.586 I.979 J1.833 E.04261
G2 X100.747 Y77.435 I.252 J-1.125 E.02186
G3 X102.516 Y77.612 I.652 J2.422 E.04382
G3 X103.246 Y80.687 I-1.297 J1.932 E.08378
G3 X102.327 Y81.538 I-3.29 J-2.63 E.03034
G2 X102.626 Y82.306 I.944 J.074 E.02057
G3 X102.453 Y85.874 I-1.303 J1.725 E.10137
G2 X102.53 Y86.614 I1.205 J.249 E.01824
G3 X102.184 Y90.428 I-1.241 J1.81 E.1122
G1 X102.18 Y90.775 E.00838
G2 X102.746 Y91.532 I1.597 J-.606 E.02309
G3 X102.307 Y93.093 I-.842 J.606 E.04491
G1 X102.102 Y93.667 E.01469
G3 X101.886 Y95.998 I-2.364 J.957 E.05866
G2 X102.303 Y96.652 I.876 J-.098 E.01936
G3 X103.095 Y99.927 I-1.063 J1.991 E.09175
G2 X103.177 Y100.875 I.861 J.403 E.02401
G3 X99.588 Y102.951 I-2.059 J.581 E.13634
G1 X99.075 Y102.777 E.01306
G3 X96.116 Y102.479 I-1.231 J-2.621 E.07531
G1 X95.859 Y102.451 E.00623
G1 X95.377 Y102.704 E.01313
G3 X91.435 Y102.36 I-1.881 J-1.208 E.11717
G1 X91.069 Y101.909 E.01401
G1 X90.499 Y102.175 E.01517
G3 X89.307 Y102.789 I-1.03 J-.536 E.03447
G1 X88.798 Y102.969 E.013
G3 X87.945 Y102.449 I.362 J-1.555 E.0245
G1 X87.659 Y102.397 E.007
G1 X87.157 Y102.619 E.01323
G3 X83.143 Y101.909 I-1.879 J-1.083 E.12789
G2 X82.243 Y102.189 I-.264 J.738 E.02439
G3 X79.936 Y102.591 I-1.325 J-.779 E.0642
G1 X79.38 Y102.567 E.01341
G3 X77.505 Y101.39 I-.832 J-.758 E.07553
G3 X77.861 Y100.771 I1.226 J.294 E.01748
G1 X78.016 Y100.267 E.01272
G3 X78.348 Y97.868 I2.089 J-.933 E.06155
G2 X77.418 Y97.084 I-2.028 J1.463 E.02963
G3 X77.365 Y93.733 I1.337 J-1.697 E.09249
G1 X77.257 Y93.153 E.01424
G3 X76.989 Y90.155 I1.442 J-1.64 E.08008
G3 X77.02 Y88.206 I58.236 J-.049 E.04699
G3 X76.632 Y86.094 I1.728 J-1.409 E.05403
G2 X76.562 Y85.181 I-.858 J-.394 E.02306
G3 X78.099 Y82.487 I2.163 J-.552 E.08269
G1 X78.261 Y81.922 E.01418
G3 X78.327 Y80.539 I1.145 J-.638 E.03517
G3 X79.043 Y79.35 I1.378 J.02 E.03506
G1 X79.312 Y78.887 E.01291
G3 X79.762 Y77.433 I2.027 J-.169 E.03763
G3 X81.61 Y78.185 I.734 J.844 E.05946
G1 X81.717 Y78.371 E.00516
G2 X82.709 Y78.731 I.877 J-.87 E.0263
G1 X82.984 Y78.188 E.01468
G3 X83.297 Y76.483 I3.263 J-.283 E.0423
G3 X86.926 Y76.254 I1.928 J1.687 E.09752
G1 X87.485 Y76.27 E.01349
G3 X89.61 Y75.962 I1.418 J2.295 E.05326
G2 X90.157 Y74.808 I-14.904 J-7.761 E.0308
G3 X91.921 Y73.586 I2.202 J1.294 E.05342
G3 X93.387 Y73.515 I.898 J3.386 E.03565
M106 S124.95
; WIPE_START
G1 X93.828 Y73.618 E-.17207
G1 X94.26 Y73.825 E-.18191
G1 X94.317 Y73.862 E-.02602
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.245 J-1.192 P1  F42000
G1 X76.951 Y77.434 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F1300
M204 S6000
G3 X77.662 Y77.1 I.628 J.413 E.01993
G1 X77.778 Y76.696 E.01013
G1 X77.878 Y76.726 E.00252
G3 X77.398 Y76.68 I-.345 J1.08 E.16008
G1 X77.722 Y76.68 E.00783
; WIPE_START
G1 F9000
G1 X77.878 Y76.726 E-.06173
G1 X78.307 Y76.947 E-.18348
G1 X78.52 Y77.193 E-.12344
G1 X78.53 Y77.221 E-.01134
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.953 J-.757 P1  F42000
G1 X76.982 Y75.273 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1300
M204 S5000
G3 X78.053 Y75.06 I1.073 J2.592 E.02649
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.927 Y75.297 I1.41 J2.425 E.00762
; WIPE_START
G1 F12000
M204 S6000
G1 X77.372 Y75.144 E-.17876
G1 X77.777 Y75.073 E-.156
G1 X77.896 Y75.068 E-.04525
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-1.216 J-.06 P1  F42000
G1 X76.64 Y100.69 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F1300
M204 S5000
G1 X75.64 Y100.69 E.02412
G1 X75.64 Y102.957 E.05468
G3 X75.67 Y103.605 I-3.927 J.507 E.01565
G3 X75.26 Y102.147 I2.463 J-1.479 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.805 J.003 E.03556
G1 X75.64 Y80.61 E.10042
G1 X76.64 Y80.61 E.02412
G1 X76.64 Y81.69 E.02604
G1 X75.64 Y81.69 E.02412
G1 X75.64 Y99.61 E.43214
G1 X76.64 Y99.61 E.02412
G1 X76.64 Y100.63 E.0246
; WIPE_START
G1 F12000
M204 S6000
G1 X75.642 Y100.69 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.852 J.869 P1  F42000
G1 X101.39 Y75.44 Z1.24
G1 Z.84
M73 P16 R10
G1 E.4 F1800
G1 F1300
M204 S5000
G1 X101.39 Y76.64 E.02894
G1 X100.31 Y76.64 E.02604
G1 X100.31 Y75.44 E.02894
G1 X97.06 Y75.44 E.07837
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X103.354 Y75.44 I-.17 J2.893 E.03217
G1 X101.45 Y75.44 E.04592
; WIPE_START
G1 F12000
M204 S6000
G1 X101.4 Y76.439 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-1.21 J.131 P1  F42000
G1 X103.36 Y94.61 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F1300
M204 S5000
G1 X104.36 Y94.61 E.02412
G1 X104.36 Y76.446 E.43804
G1 X104.411 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.574 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.33 Y103.605 I-2.873 J-.021 E.03696
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y95.69 E.17525
G1 X103.36 Y95.69 E.02412
G1 X103.36 Y94.67 E.0246
; WIPE_START
G1 F12000
M204 S6000
G1 X104.358 Y94.61 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-1.211 J-.122 P1  F42000
G1 X103.354 Y104.56 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F1300
M204 S5000
G1 X103.265 Y104.611 E.00248
G3 X101.947 Y104.94 I-1.343 J-2.574 E.03306
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.009 J-2.827 E.03555
G1 X103.294 Y104.56 E.64264
; WIPE_START
G1 F12000
M204 S6000
G1 X103.265 Y104.611 E-.02226
G1 X102.89 Y104.777 E-.15584
G1 X102.628 Y104.856 E-.1041
G1 X102.374 Y104.9 E-.09781
; WIPE_END
G1 E-.02 F1800
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

G1 X104.477 Y95.478
G1 Z.84
G1 E.4 F1800
; FEATURE: Top surface
G1 F1300
M204 S2000
G1 X103.821 Y94.822 E.02237
G1 X103.572 Y95.118
G1 X103.932 Y95.478 E.01226
; WIPE_START
G1 F12000
M204 S6000
G1 X103.572 Y95.118 E-.19319
G1 X103.821 Y94.822 E-.1471
G1 X103.895 Y94.896 E-.03971
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I1.205 J-.172 P1  F42000
G1 X101.178 Y75.817 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F1300
M204 S2000
G1 X100.633 Y75.272 E.01857
G1 X100.522 Y75.706
G1 X101.178 Y76.362 E.02237
; WIPE_START
G1 F12000
M204 S6000
G1 X100.522 Y75.706 E-.35242
G1 X100.54 Y75.636 E-.02758
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.248 J-1.191 P1  F42000
G1 X75.641 Y80.822 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F1300
M204 S2000
G1 X76.296 Y81.478 E.02237
; WIPE_START
G1 F12000
M204 S6000
G1 X75.641 Y80.822 E-.38
; WIPE_END
M73 P17 R10
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.148 J-1.208 P1  F42000
G1 X75.483 Y80.803 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0945649
G1 F1300
M204 S6000
G1 X75.483 Y81.497 E.00261
; WIPE_START
G1 F18000
G1 X75.483 Y80.803 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-1.217 J.004 P1  F42000
G1 X75.551 Y99.822 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1300
M204 S2000
G1 X76.207 Y100.478 E.02237
M204 S10000
G1 X76.34 Y100.497 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.158238
G1 F1300
M204 S6000
G1 X76.387 Y100.384 E.00095
G1 X76.387 Y99.803 E.00451
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X76.387 Y100.384 E-.31405
G1 X76.34 Y100.497 E-.06595
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 6/30
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I1.217 J.032 P1  F42000
G1 X76.951 Y77.434 Z1.24
G1 Z1
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F1169
M204 S6000
G3 X77.662 Y77.1 I.628 J.413 E.01993
G1 X77.778 Y76.696 E.01013
G1 X77.878 Y76.726 E.00252
G3 X77.398 Y76.68 I-.345 J1.08 E.16008
G1 X77.722 Y76.68 E.00783
; WIPE_START
G1 F9000
G1 X77.878 Y76.726 E-.06173
G1 X78.307 Y76.947 E-.18348
G1 X78.52 Y77.193 E-.12344
G1 X78.53 Y77.221 E-.01134
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.268 J1.187 P1  F42000
G1 X93.136 Y73.921 Z1.4
G1 Z1
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X95.253 Y75.83 I-.352 J2.519 E.07296
G1 X95.344 Y76.605 E.01882
G2 X96.809 Y77.379 I20.922 J-37.805 E.03994
G3 X97.335 Y78.055 I-1.218 J1.491 E.02083
G1 X98.218 Y78.097 E.02132
G3 X100.019 Y78.072 I.924 J1.655 E.04528
G3 X101.431 Y77.782 I2.933 J10.705 E.03478
G3 X102.091 Y77.792 I.221 J7.068 E.01593
G3 X102.498 Y78.181 I-.22 J.638 E.014
G3 X102.17 Y81.06 I-1.153 J1.326 E.08211
G1 X101.32 Y81.475 E.02283
G1 X101.649 Y82.511 E.02622
G1 X102.148 Y82.431 E.01219
G3 X103.017 Y84.424 I-1.151 J1.689 E.0553
G3 X101.948 Y85.678 I-1.837 J-.483 E.04111
G1 X102.121 Y86.791 E.02714
G3 X102.947 Y89.008 I-.934 J1.611 E.06183
G3 X101.749 Y90.196 I-2.188 J-1.008 E.04159
G1 X101.793 Y90.905 E.01713
G1 X102.178 Y91.531 E.01771
G3 X102.318 Y92.663 I-.259 J.607 E.03326
G1 X101.899 Y92.896 E.01155
G1 X101.737 Y93.759 E.02117
G3 X101.787 Y95.203 I-1.759 J.784 E.03572
G1 X101.381 Y95.947 E.02045
G1 X101.535 Y96.476 E.01328
G1 X101.983 Y97.02 E.017
G3 X102.553 Y99.986 I-.829 J1.697 E.08443
G2 X102.868 Y101.443 I28.71 J-5.435 E.03593
G3 X99.704 Y102.459 I-1.749 J-.012 E.10571
G1 X98.931 Y102.354 E.01883
G3 X96.274 Y102.042 I-1.094 J-2.152 E.06836
G1 X95.819 Y102.051 E.01099
G1 X95.129 Y102.372 E.01835
G3 X91.757 Y101.965 I-1.603 J-.896 E.10459
G1 X91.277 Y101.416 E.01757
G2 X89.932 Y102.291 I.525 J2.28 E.03951
G3 X89.368 Y102.436 I-.443 J-.549 E.01447
G1 X87.892 Y101.808 E.03868
G2 X86.957 Y102.125 I.521 J3.077 E.02391
G3 X83.717 Y102.385 I-1.682 J-.641 E.09782
G3 X83.581 Y101.001 I2.12 J-.906 E.03406
G1 X82.76 Y100.507 E.02313
G1 X81.9 Y101.21 E.0268
G3 X81.598 Y101.807 I-.584 J.079 E.01714
G3 X80.305 Y102.009 I-.697 J-.223 E.03904
G1 X79.789 Y101.961 E.0125
G2 X78.633 Y102.574 I7.29 J15.142 E.03158
G3 X77.922 Y101.497 I-.109 J-.701 E.03905
G2 X78.51 Y100.365 I-11.837 J-6.874 E.03078
G3 X78.736 Y98.067 I1.733 J-.99 E.0594
G2 X77.705 Y96.742 I-1.678 J.242 E.04235
G3 X77.839 Y93.893 I1.136 J-1.374 E.07971
G1 X77.685 Y92.966 E.02264
G3 X77.391 Y90.33 I1.07 J-1.454 E.07184
G2 X77.445 Y88.068 I-17.276 J-1.548 E.05462
G3 X77.167 Y85.878 I1.45 J-1.297 E.0566
G3 X76.983 Y84.325 I4.15 J-1.279 E.03792
G3 X78.337 Y82.883 I1.728 J.265 E.05072
G1 X78.669 Y81.938 E.02414
G3 X78.87 Y80.442 I.741 J-.662 E.04135
G3 X79.559 Y79.573 I1.238 J.274 E.02768
G1 X79.813 Y78.909 E.01714
G3 X79.814 Y78.071 I6.241 J-.412 E.0202
G3 X81.184 Y78.116 I.682 J.124 E.04757
G1 X81.275 Y78.821 E.01714
G2 X82.914 Y79.276 I1.86 J-3.524 E.04132
G1 X83.376 Y78.327 E.02545
G3 X83.828 Y76.527 I2.769 J-.261 E.04562
G3 X86.734 Y76.755 I1.325 J1.743 E.07692
G1 X87.594 Y76.879 E.02096
G3 X89.479 Y76.506 I1.299 J1.618 E.04816
G1 X90.214 Y75.951 E.0222
G3 X92.128 Y74.01 I2.287 J.341 E.07031
G3 X93.08 Y73.91 I.76 J2.647 E.0232
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.623 Y73.59 F42000
G1 F9000
M204 S6000
G3 X95.737 Y76.351 I-.786 J2.792 E.08992
G3 X97.072 Y77.048 I-46.587 J90.794 E.03632
G3 X97.574 Y77.646 I-1.058 J1.397 E.01897
G1 X98.145 Y77.673 E.0138
G3 X100.054 Y77.638 I.991 J1.995 E.04758
G3 X101.435 Y77.362 I2.413 J8.482 E.034
G3 X102.216 Y77.386 I.232 J5.055 E.01885
G3 X102.841 Y77.931 I-.352 J1.036 E.02053
G3 X102.387 Y81.421 I-1.496 J1.58 E.09886
G1 X101.83 Y81.693 E.01496
G1 X101.939 Y82.039 E.00874
G1 X102.582 Y81.935 E.01571
G1 X102.603 Y82.292 E.00863
G3 X102.406 Y85.887 I-1.292 J1.732 E.10261
G1 X102.512 Y86.572 E.01672
G3 X102.183 Y90.417 I-1.22 J1.832 E.11344
G1 X102.206 Y90.774 E.00863
G1 X102.481 Y91.221 E.01266
G3 X102.275 Y93.167 I-.558 J.925 E.05903
G1 X102.168 Y93.74 E.01405
G3 X101.833 Y95.996 I-2.284 J.814 E.05727
G2 X102.358 Y96.722 I1.188 J-.307 E.02212
G3 X102.993 Y100.076 I-1.17 J1.959 E.09301
G2 X103.288 Y101.418 I181.353 J-39.104 E.03313
G3 X99.507 Y102.856 I-2.155 J.024 E.12663
G2 X98.477 Y102.954 I-.418 J1.069 E.02588
G3 X96.153 Y102.464 I-.602 J-2.9 E.05893
G1 X95.916 Y102.469 E.00573
G1 X95.432 Y102.694 E.01287
G1 X95.357 Y102.832 E.00378
G3 X91.392 Y102.186 I-1.811 J-1.373 E.11879
G1 X91.148 Y101.906 E.00898
G2 X90.163 Y102.641 I.422 J1.591 E.03037
G3 X89.267 Y102.85 I-.686 J-.919 E.02283
G1 X88.578 Y102.557 E.01806
G1 X88.613 Y102.785 E.00558
G3 X88.006 Y102.323 I.26 J-.97 E.01886
G2 X87.71 Y102.279 I-.171 J.129 E.00801
G1 X87.24 Y102.465 E.01219
G3 X83.129 Y101.219 I-1.963 J-.929 E.14905
G1 X82.797 Y101.019 E.00934
G1 X82.287 Y101.436 E.01587
G3 X81.936 Y102.09 I-.966 J-.097 E.01838
G3 X80.142 Y102.415 I-1.005 J-.431 E.05199
G1 X79.859 Y102.389 E.00686
G2 X79.077 Y102.848 I.474 J1.703 E.02211
G3 X77.531 Y101.344 I-.574 J-.956 E.07062
G2 X78.058 Y100.346 I-30.076 J-16.537 E.02723
G3 X78.279 Y98.004 I2.02 J-.991 E.05968
G2 X77.45 Y97.079 I-1.359 J.383 E.03103
G3 X77.389 Y93.752 I1.293 J-1.687 E.09215
G1 X77.292 Y93.168 E.01428
G3 X76.985 Y90.187 I1.407 J-1.652 E.07979
G2 X77.039 Y88.689 I-26.192 J-1.695 E.03614
G1 X77.028 Y88.193 E.01197
G3 X76.732 Y85.848 I1.755 J-1.412 E.06
G3 X76.518 Y84.71 I7.993 J-2.096 E.02796
G3 X78.007 Y82.554 I2.255 J-.034 E.06741
G1 X78.211 Y81.976 E.01479
G3 X78.51 Y80.198 I1.133 J-.723 E.04765
G3 X79.21 Y79.31 I1.443 J.417 E.02797
G2 X79.356 Y78.338 I-1.027 J-.651 E.0244
G3 X81.593 Y78.009 I1.127 J-.11 E.08309
G1 X81.66 Y78.522 E.01248
G2 X82.673 Y78.811 I1.167 J-2.175 E.0256
G1 X82.944 Y78.254 E.01494
G3 X83.501 Y76.242 I3.385 J-.145 E.05116
G3 X86.921 Y76.358 I1.644 J2.026 E.09001
G1 X87.485 Y76.439 E.01374
G3 X89.379 Y76.055 I1.394 J2.015 E.04789
G1 X89.845 Y75.703 E.01408
G3 X92.023 Y73.602 I2.632 J.549 E.07753
G3 X93.566 Y73.579 I.816 J2.979 E.03761
M106 S124.95
; WIPE_START
G1 X94.077 Y73.749 E-.20443
G1 X94.474 Y73.984 E-.17557
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-.089 J-1.214 P1  F42000
G1 X76.983 Y75.273 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1169
M204 S5000
G3 X78.053 Y75.06 I1.073 J2.592 E.02648
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.928 Y75.297 I1.41 J2.426 E.00763
; WIPE_START
G1 F12000
M204 S6000
G1 X77.372 Y75.144 E-.17875
G1 X77.777 Y75.073 E-.15593
G1 X77.896 Y75.068 E-.04532
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-.01 J1.217 P1  F42000
G1 X103.017 Y75.275 Z1.4
G1 Z1
G1 E.4 F1800
G1 F1169
M204 S5000
G3 X103.356 Y75.441 I-1.1 J2.681 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X102.961 Y75.253 I-.17 J2.893 E.02165
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16622
G1 X102.793 Y75.441 E-.21378
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z1.4
G1 Z1
G1 E.4 F1800
G1 F1169
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.958 I-.681 J-.192 E.00494
G1 X104.36 Y76.446 E.63935
G1 X104.411 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
M73 P18 R9
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.911 J-.032 E.0355
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14973
G1 X104.36 Y102.958 E-.07753
G1 X104.36 Y102.556 E-.15275
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z1.4
G1 Z1
G1 E.4 F1800
G1 F1169
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.01 J-2.832 E.03555
G1 X103.354 Y104.56 E.64408
G1 X103.318 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.981 Y104.742 E-.14168
G1 X102.628 Y104.856 E-.14108
G1 X102.376 Y104.9 E-.09724
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z1.4
G1 Z1
G1 E.4 F1800
G1 F1169
M204 S5000
G3 X75.26 Y102.147 I2.463 J-1.48 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.832 J.01 E.03555
G1 X75.64 Y102.958 E.63935
G3 X75.672 Y103.545 I-3.908 J.506 E.0142
; WIPE_START
G1 F12000
M204 S6000
M73 P19 R9
G1 X75.528 Y103.343 E-.09431
G1 X75.38 Y102.96 E-.15614
G1 X75.304 Y102.627 E-.12955
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 7/30
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
G1 X80.79 Y95.98 F42000
G1 Z1.16
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X80.881 Y94.805 E.02842
G2 X82.731 Y94.883 I1.911 J-23.275 E.04465
G1 X82.743 Y96.107 E.02951
G3 X80.785 Y96.038 I-.728 J-7.166 E.0474
M106 S124.95
M106 S127.5
M204 S10000
G1 X81.236 Y95.659 F42000
G1 F9000
M204 S6000
G1 X81.268 Y95.248 E.00994
G2 X82.315 Y95.295 I1.111 J-13.18 E.02528
G1 X82.319 Y95.703 E.00984
G3 X81.293 Y95.665 I-.375 J-3.754 E.02483
M106 S124.95
M106 S127.5
M204 S10000
G1 X92.718 Y73.942 F42000
G1 F9000
M204 S6000
G3 X95.318 Y76.581 I.067 J2.535 E.10018
G2 X96.476 Y77.186 I1.808 J-2.049 E.03182
G3 X97.338 Y78.086 I-.961 J1.783 E.03053
G1 X98.217 Y78.077 E.0212
G3 X100.083 Y78.085 I.926 J1.783 E.04681
G3 X102.142 Y77.743 I2.196 J6.866 E.05051
G3 X102.568 Y78.257 I-.362 J.733 E.01657
G3 X101.936 Y81.153 I-1.306 J1.232 E.08407
G1 X101.8 Y81.685 E.01325
G1 X102.043 Y82.48 E.02004
G3 X102.208 Y85.499 I-.711 J1.553 E.08952
G1 X101.925 Y85.876 E.01137
G1 X102.13 Y86.777 E.02228
G3 X102.107 Y89.957 I-.866 J1.584 E.09385
G3 X100.982 Y90.092 I-.778 J-1.735 E.02773
G1 X99.856 Y89.705 E.02872
G1 X99.62 Y91.064 E.03328
G1 X100.392 Y92.47 E.03866
G1 X101.216 Y91.43 E.03201
G2 X101.918 Y91.418 I.262 J-5.106 E.01694
G3 X102.367 Y92.683 I-.004 J.714 E.04214
G1 X101.984 Y92.891 E.01051
G1 X101.709 Y93.726 E.0212
G3 X101.443 Y95.753 I-1.555 J.827 E.05261
G1 X101.194 Y96.252 E.01344
G1 X101.823 Y97.009 E.02375
G3 X102.812 Y98.036 I-.458 J1.43 E.03581
G3 X103.007 Y99.092 I-3.518 J1.197 E.026
G3 X102.598 Y99.902 I-1.977 J-.49 E.02206
G2 X102.849 Y101.154 I2.289 J.194 E.03119
G3 X99.981 Y102.722 I-1.691 J.314 E.10399
G1 X99.119 Y101.842 E.02971
G1 X98.789 Y102.385 E.01532
G3 X97.495 Y102.605 I-1.408 J-4.364 E.03176
G3 X96.328 Y102.038 I.768 J-3.065 E.0315
G1 X95.808 Y102.068 E.01257
G1 X95.165 Y102.449 E.01802
G3 X94.707 Y102.847 I-.663 J-.3 E.0151
G3 X91.886 Y102.271 I-1.193 J-1.352 E.08038
G1 X91.663 Y101.583 E.01745
G1 X90.966 Y101.579 E.01682
G1 X90.233 Y101.873 E.01904
G3 X88.989 Y102.262 I-.717 J-.109 E.03906
G3 X88.209 Y101.709 I.129 J-1.008 E.024
G1 X87.622 Y101.735 E.01416
G1 X86.969 Y102.071 E.01772
G3 X83.71 Y102.413 I-1.713 J-.623 E.09825
G3 X83.517 Y101.218 I1.908 J-.92 E.0296
G1 X83.303 Y100.88 E.00966
G1 X82.742 Y100.485 E.01654
G2 X81.792 Y101.26 I.969 J2.158 E.02992
G3 X81.37 Y102.229 I-2.78 J-.633 E.02562
G3 X80.625 Y102.339 I-.479 J-.667 E.01888
G1 X80.184 Y101.986 E.01362
G2 X78.809 Y102.55 I.15 J2.323 E.03647
G3 X77.812 Y101.751 I-.336 J-.602 E.03939
G3 X78.286 Y101.066 I1.36 J.434 E.02038
G1 X78.575 Y100.257 E.02071
G3 X78.7 Y98.236 I1.622 J-.914 E.05164
G1 X78.77 Y97.756 E.01169
G1 X78.319 Y97.013 E.02097
G3 X77.076 Y95.126 I.418 J-1.628 E.05975
G3 X77.797 Y94.009 I2.044 J.527 E.03261
G2 X77.326 Y92.588 I-1.721 J-.219 E.03733
G3 X77.383 Y90.368 I1.421 J-1.074 E.05782
G2 X77.452 Y89.284 I-1.527 J-.641 E.02669
G2 X77.442 Y88.037 I-4.253 J-.589 E.03017
G3 X77.082 Y86.162 I1.361 J-1.233 E.04841
G1 X77.15 Y85.532 E.0153
G3 X77.195 Y83.926 I1.408 J-.763 E.04056
G1 X77.683 Y83.837 E.01195
G3 X78.767 Y83.431 I1.293 J1.801 E.02825
G2 X78.776 Y82.403 I-1.333 J-.525 E.02537
G1 X78.494 Y82.193 E.00847
G1 X78.562 Y81.968 E.00565
G3 X78.978 Y80.296 I.889 J-.667 E.04756
G3 X79.717 Y79.572 I1.517 J.809 E.02534
G1 X79.89 Y78.721 E.02094
G3 X80.547 Y77.429 I.734 J-.44 E.04173
G3 X81.162 Y78.696 I-.277 J.917 E.03817
G1 X81.989 Y79.216 E.02355
G1 X82.569 Y79.263 E.01405
G1 X83.029 Y78.889 E.01429
G1 X83.303 Y78.205 E.01778
G3 X83.683 Y76.95 I1.474 J-.239 E.03275
G3 X84.044 Y76.357 I2.778 J1.285 E.01678
G3 X86.68 Y76.814 I1.03 J1.889 E.06962
G1 X87.006 Y76.93 E.00835
G1 X87.68 Y76.931 E.01625
G3 X89.447 Y76.621 I1.231 J1.825 E.04457
G1 X90.197 Y76.13 E.02161
G3 X92.195 Y74.033 I2.41 J.296 E.07484
G3 X92.66 Y73.94 I1.024 J3.881 E.01143
M106 S124.95
M106 S127.5
M204 S10000
G1 X92.867 Y73.53 F42000
G1 F9000
M204 S6000
G3 X95.712 Y76.337 I.003 J2.842 E.1069
G2 X96.66 Y76.806 I1.427 J-1.69 E.02575
G3 X97.568 Y77.664 I-1.051 J2.023 E.03053
G2 X98.55 Y77.505 I.271 J-1.44 E.02446
G3 X100.113 Y77.649 I.539 J2.708 E.03839
G3 X101.923 Y77.291 I5.092 J20.966 E.04449
G3 X102.965 Y78.09 I.017 J1.057 E.03417
G3 X102.303 Y81.413 I-1.63 J1.403 E.09407
G1 X102.236 Y81.675 E.00652
G1 X102.399 Y82.208 E.01343
G3 X102.497 Y85.813 I-1.032 J1.832 E.10452
G1 X102.378 Y85.972 E.00481
G1 X102.508 Y86.546 E.01418
G3 X100.891 Y90.505 I-1.191 J1.823 E.14496
G1 X100.185 Y90.262 E.01798
G1 X100.059 Y90.991 E.01784
G1 X100.455 Y91.713 E.01987
G1 X101.048 Y90.967 E.02298
G2 X101.983 Y90.999 I.599 J-3.758 E.02262
G3 X102.331 Y93.181 I-.063 J1.128 E.07396
G1 X102.152 Y93.724 E.01379
G3 X101.8 Y95.979 I-1.937 J.852 E.05813
G1 X101.692 Y96.194 E.00581
G1 X102.081 Y96.662 E.01467
G3 X102.857 Y97.192 I-.74 J1.918 E.02286
G3 X103.35 Y98.551 I-2.41 J1.642 E.03523
G3 X103.262 Y99.637 I-1.158 J.453 E.0272
G1 X103.027 Y100.01 E.01063
G2 X103.262 Y101.061 I1.935 J.12 E.02632
G3 X99.71 Y103.045 I-2.107 J.399 E.12914
G1 X99.197 Y102.522 E.01767
G1 X98.981 Y102.878 E.01004
G2 X98.298 Y102.959 I-.26 J.73 E.0172
G3 X96.62 Y102.723 I-.517 J-2.407 E.04171
G1 X96.217 Y102.465 E.01153
G1 X95.934 Y102.481 E.00683
G1 X95.479 Y102.751 E.01276
G3 X94.932 Y103.205 I-.931 J-.565 E.01745
G3 X91.357 Y102.001 I-1.421 J-1.69 E.10905
G2 X90.541 Y102.201 I-.162 J1.104 E.02077
G3 X88.775 Y102.632 I-1.02 J-.345 E.05222
G3 X88 Y102.139 I.203 J-1.173 E.02272
G1 X87.733 Y102.15 E.00647
G1 X87.266 Y102.391 E.01266
G3 X83.093 Y101.821 I-2.006 J-.871 E.13681
G1 X83.096 Y101.339 E.01164
G2 X82.724 Y100.986 I-.614 J.275 E.01268
G2 X82.034 Y101.923 I.531 J1.114 E.02923
G3 X80.059 Y102.424 I-1.112 J-.242 E.06082
G2 X79.011 Y102.924 I.271 J1.919 E.02845
G3 X77.403 Y101.639 I-.551 J-.958 E.06379
G3 X77.93 Y100.812 I1.863 J.605 E.0239
G1 X78.131 Y100.252 E.01435
G3 X78.297 Y98.089 I1.758 J-.952 E.05528
G1 X78.333 Y97.845 E.00595
G1 X78.037 Y97.358 E.01374
G3 X76.672 Y94.998 I.675 J-1.966 E.07172
G3 X77.106 Y94.117 I5.817 J2.32 E.02371
G1 X77.379 Y93.836 E.00945
G2 X76.995 Y92.851 I-1.253 J-.078 E.0263
G3 X76.987 Y90.209 I1.663 J-1.326 E.06876
G2 X77.031 Y89.301 I-1.286 J-.517 E.02234
G2 X77.034 Y88.177 I-4.109 J-.574 E.02718
G3 X76.67 Y86.069 I1.705 J-1.38 E.05388
G2 X76.583 Y85.183 I-.977 J-.352 E.02219
G3 X76.74 Y83.806 I2.296 J-.437 E.03392
G1 X76.99 Y83.526 E.00906
G1 X77.518 Y83.441 E.0129
G3 X78.396 Y83.092 I1.224 J1.801 E.02297
G2 X77.983 Y82.432 I-.414 J-.2 E.02238
G1 X78.116 Y81.993 E.01107
G3 X78.679 Y79.986 I1.253 J-.731 E.05607
G3 X79.339 Y79.32 I1.622 J.947 E.02287
G1 X79.453 Y78.762 E.01373
G3 X80.593 Y77.006 I1.131 J-.514 E.06007
G3 X81.612 Y78.483 I-.241 J1.257 E.04798
G1 X82.125 Y78.806 E.0146
G2 X82.679 Y78.632 I.186 J-.377 E.01547
G1 X82.875 Y78.144 E.01268
G3 X83.328 Y76.722 I1.864 J-.189 E.03702
G3 X83.862 Y75.978 I2.119 J.956 E.02222
G3 X86.898 Y76.446 I1.209 J2.245 E.07953
G2 X88.092 Y76.264 I.414 J-1.288 E.03017
G3 X89.354 Y76.18 I.799 J2.494 E.03082
G1 X89.837 Y75.864 E.01392
G3 X92.085 Y73.627 I2.739 J.505 E.08137
G3 X92.809 Y73.527 I.758 J2.805 E.01766
M106 S124.95
; WIPE_START
G1 X93.346 Y73.553 E-.2043
G1 X93.79 Y73.682 E-.1757
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.56 I-.265 J-1.188 P1  F42000
G1 X76.951 Y77.434 Z1.56
G1 Z1.16
G1 E.4 F1800
G1 F1184
M204 S6000
G3 X77.662 Y77.1 I.628 J.413 E.01993
G1 X77.778 Y76.696 E.01013
G1 X77.878 Y76.726 E.00252
G3 X77.398 Y76.68 I-.345 J1.08 E.16008
G1 X77.722 Y76.68 E.00783
; WIPE_START
G1 F9000
G1 X77.878 Y76.726 E-.06173
G1 X78.307 Y76.947 E-.18348
G1 X78.52 Y77.193 E-.12344
G1 X78.53 Y77.221 E-.01134
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.56 I.953 J-.757 P1  F42000
G1 X76.982 Y75.274 Z1.56
G1 Z1.16
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1184
M204 S5000
G3 X78.053 Y75.06 I1.074 J2.591 E.02651
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.927 Y75.297 I1.41 J2.425 E.0076
; WIPE_START
G1 F12000
M204 S6000
G1 X77.372 Y75.144 E-.17897
G1 X77.777 Y75.073 E-.15613
G1 X77.895 Y75.068 E-.0449
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.56 I-.01 J1.217 P1  F42000
G1 X103.016 Y75.276 Z1.56
G1 Z1.16
G1 E.4 F1800
G1 F1184
M204 S5000
G3 X103.356 Y75.441 I-1.117 J2.74 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
M73 P20 R9
G3 X102.96 Y75.254 I-.188 J2.953 E.02164
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16624
G1 X102.793 Y75.441 E-.21376
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.56 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z1.56
G1 Z1.16
G1 E.4 F1800
G1 F1184
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.411 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.574 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.918 J-.034 E.0355
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14972
G1 X104.36 Y102.957 E-.07769
G1 X104.36 Y102.556 E-.1526
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.56 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z1.56
G1 Z1.16
G1 E.4 F1800
G1 F1184
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.575 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.003 J-2.805 E.03556
G1 X103.354 Y104.56 E.64409
G1 X103.318 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.975 Y104.744 E-.14432
G1 X102.628 Y104.856 E-.13846
G1 X102.376 Y104.9 E-.09722
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.56 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z1.56
G1 Z1.16
G1 E.4 F1800
G1 F1184
M204 S5000
G3 X75.26 Y102.147 I2.463 J-1.48 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.448 I2.786 J0 E.0355
G1 X75.64 Y102.957 E.63927
M73 P21 R9
G3 X75.672 Y103.545 I-3.926 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
G1 X75.527 Y103.342 E-.09477
G1 X75.38 Y102.96 E-.15563
G1 X75.303 Y102.627 E-.1296
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 8/30
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
G1 X94.731 Y87.793 F42000
G1 Z1.32
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X95.304 Y86.698 E.02981
G3 X96.668 Y87.445 I-1.545 J4.441 E.03769
G1 X96.822 Y88.005 E.01401
G1 X96.512 Y88.788 E.0203
G1 X96.047 Y89.071 E.01313
G1 X95.487 Y89.008 E.01358
G1 X94.94 Y88.461 E.01865
G1 X94.705 Y87.845 E.01591
M106 S124.95
M106 S127.5
M204 S10000
G1 X95.164 Y87.872 F42000
G1 F9000
M204 S6000
G1 X95.492 Y87.244 E.01707
G3 X96.305 Y87.706 I-.971 J2.653 E.02265
G1 X96.38 Y87.981 E.00686
G1 X96.173 Y88.502 E.01352
G3 X95.68 Y88.607 I-.314 J-.266 E.01309
G3 X95.185 Y87.926 I.512 J-.892 E.02092
M106 S124.95
M106 S127.5
M204 S10000
G1 X99.018 Y96.268 F42000
G1 F9000
M204 S6000
G1 X99.955 Y96.173 E.02269
G1 X100.404 Y97.331 E.02998
G3 X99.727 Y98.031 I-1.504 J-.779 E.02381
G1 X98.775 Y98.026 E.02296
G1 X98.334 Y97.364 E.01916
G3 X98.42 Y96.531 I1.461 J-.271 E.02048
G1 X98.961 Y96.274 E.01445
M106 S124.95
M106 S127.5
M204 S10000
G1 X99.076 Y96.684 F42000
G1 F9000
M204 S6000
G1 X99.679 Y96.623 E.01462
G1 X99.928 Y97.266 E.01664
G3 X99.589 Y97.61 I-.742 J-.394 E.01181
G1 X99 Y97.607 E.0142
G1 X98.75 Y97.231 E.0109
G3 X99.023 Y96.709 I.333 J-.158 E.01644
M106 S124.95
M106 S127.5
M204 S10000
G1 X92.975 Y73.99 F42000
G1 F9000
M204 S6000
G3 X95.241 Y76.354 I-.119 J2.382 E.08705
G1 X95.36 Y76.739 E.00971
G1 X95.95 Y77.244 E.01872
G3 X97.16 Y78.17 I-.186 J1.497 E.03852
G1 X98.06 Y78.177 E.0217
G3 X100.004 Y78.026 I1.114 J1.746 E.04897
G2 X101.22 Y77.859 I.101 J-3.778 E.02973
G2 X101.748 Y77.704 I.109 J-.604 E.01375
G3 X102.644 Y78.406 I.205 J.662 E.03222
G3 X102.238 Y80.894 I-1.322 J1.061 E.06853
G3 X101.604 Y81.358 I-1.388 J-1.233 E.0191
G1 X101.592 Y81.939 E.01402
G1 X101.88 Y82.61 E.0176
G3 X102.693 Y84.555 I-.672 J1.424 E.05572
G3 X102.318 Y85.091 I-1.462 J-.626 E.01589
G1 X102.328 Y85.334 E.00588
G1 X102.012 Y85.533 E.00902
G1 X101.892 Y86.152 E.0152
G1 X102.213 Y86.856 E.01865
G3 X101 Y90.08 I-.891 J1.505 E.11778
G1 X100.023 Y89.748 E.02488
G1 X99.678 Y90.603 E.02223
G1 X99.719 Y91.336 E.01772
G1 X100.215 Y91.756 E.01568
G1 X101.03 Y91.723 E.01966
G3 X102.598 Y91.776 I.756 J.863 E.04167
G3 X102.444 Y92.675 I-.652 J.351 E.02369
G1 X101.96 Y92.937 E.01326
G1 X101.748 Y93.772 E.02078
G3 X101.72 Y95.473 I-2.142 J.816 E.04203
G1 X101.282 Y95.908 E.01489
G1 X101.42 Y96.415 E.01268
G1 X101.27 Y96.876 E.01168
G3 X102.274 Y97.339 I-.916 J3.302 E.02678
G3 X102.799 Y99.295 I-1.01 J1.32 E.05251
G2 X102.584 Y100.449 I10.098 J2.476 E.02832
G3 X102.539 Y102.552 I-1.692 J1.016 E.0535
G3 X99.984 Y102.705 I-1.35 J-1.141 E.06902
G1 X99.592 Y102.309 E.01343
G2 X97.862 Y102.627 I-.249 J3.509 E.0429
G3 X97.055 Y102.4 I-.225 J-.746 E.02134
G3 X96.381 Y102.031 I1.135 J-2.879 E.01857
G1 X95.827 Y102.088 E.01342
G1 X95.218 Y102.493 E.01765
G3 X94.628 Y102.886 I-.74 J-.472 E.01759
G3 X92.548 Y102.975 I-1.1 J-1.342 E.05387
G3 X92.002 Y102.547 I.34 J-.995 E.01706
G1 X91.609 Y101.374 E.02983
G2 X90.259 Y101.854 I.711 J4.136 E.03473
G3 X89.388 Y102.586 I-.86 J-.139 E.0299
G3 X88.79 Y102 I.333 J-.937 E.02082
G3 X88.482 Y101.708 I.8 J-1.153 E.01028
G1 X88.201 Y100.957 E.01932
G1 X87.007 Y101.734 E.03436
G3 X83.729 Y102.492 I-1.788 J-.266 E.10426
G3 X83.524 Y101.277 I1.898 J-.945 E.03015
G1 X83.371 Y100.82 E.01162
G1 X82.592 Y100.378 E.02159
G1 X81.972 Y100.84 E.01864
G2 X81.622 Y101.867 I1.397 J1.049 E.02661
G3 X80.316 Y102.175 I-.721 J-.133 E.04089
G1 X79.965 Y102.08 E.00876
G1 X79.183 Y102.206 E.0191
G3 X77.94 Y102.533 I-.763 J-.377 E.03512
G3 X78.065 Y101.313 I.753 J-.539 E.03232
G1 X78.53 Y100.933 E.01447
G1 X78.525 Y100.101 E.02007
G3 X78.752 Y98.114 I1.583 J-.825 E.05119
G1 X78.715 Y97.566 E.01323
G1 X78.232 Y96.931 E.01925
G3 X77.481 Y94.416 I.445 J-1.502 E.07504
G1 X77.847 Y94.04 E.01265
G1 X77.905 Y93.624 E.01014
G1 X77.759 Y92.936 E.01695
G3 X77.388 Y90.48 I1.018 J-1.41 E.06674
G1 X77.594 Y89.888 E.0151
G3 X77.643 Y88.411 I2.729 J-.649 E.03607
G3 X77.052 Y87.067 I11.772 J-5.973 E.03543
G3 X77.185 Y86.047 I2.088 J-.247 E.02504
G2 X76.981 Y84.77 I-22.37 J2.903 E.0312
G3 X77.622 Y83.939 I1.53 J.517 E.02578
G3 X78.893 Y83.402 I1.75 J2.371 E.03359
G2 X78.665 Y82.259 I-1.787 J-.237 E.02861
G1 X78.511 Y82.191 E.00407
G3 X78.276 Y81.258 I20.546 J-5.674 E.0232
G3 X79.101 Y80.185 I1.189 J.061 E.03472
G3 X79.739 Y79.697 I1.288 J1.022 E.01956
G1 X79.952 Y78.809 E.02201
G3 X80.367 Y77.364 I.747 J-.568 E.04206
G3 X81.181 Y78.425 I.016 J.83 E.03748
G1 X81.444 Y78.902 E.01312
G1 X82.063 Y79.302 E.01777
G1 X82.727 Y79.355 E.01607
G1 X83.315 Y78.511 E.0248
G3 X83.865 Y76.77 I1.441 J-.502 E.04722
G1 X84.237 Y76.281 E.01481
G3 X86.499 Y76.759 I.789 J1.86 E.05935
G1 X87.54 Y78.255 E.04396
G1 X87.81 Y76.91 E.03309
G3 X88.743 Y76.698 I22.974 J99.029 E.02308
G3 X89.599 Y76.79 I.201 J2.168 E.02088
G1 X90.259 Y76.17 E.02184
G3 X91.797 Y74.219 I2.294 J.227 E.06326
G3 X92.918 Y73.983 I1.182 J2.829 E.02779
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.053 Y73.576 F42000
G1 F9000
M204 S6000
G3 X95.654 Y76.267 I-.195 J2.79 E.09885
G1 X95.726 Y76.498 E.00584
G1 X96.135 Y76.849 E.01299
G3 X97.391 Y77.752 I-.324 J1.777 E.03856
G2 X98.56 Y77.49 I.301 J-1.397 E.0298
G3 X100.094 Y77.604 I.578 J2.597 E.03762
G2 X101.322 Y77.441 I-.791 J-10.672 E.02989
G3 X103.043 Y78.252 I.641 J.871 E.05609
G3 X102.503 Y81.223 I-1.711 J1.223 E.08121
G3 X102.019 Y81.589 I-1.088 J-.934 E.01475
G2 X102.638 Y82.639 I1.121 J.047 E.03107
G3 X102.745 Y85.243 I-1.267 J1.356 E.06967
G3 X102.389 Y85.792 I-.594 J.004 E.01668
G1 X102.33 Y86.1 E.00757
G1 X102.553 Y86.589 E.01297
G3 X100.264 Y90.273 I-1.234 J1.787 E.15943
G2 X100.128 Y91.132 I.847 J.574 E.02167
G1 X100.361 Y91.33 E.00737
G2 X101.318 Y91.082 I.233 J-1.069 E.02472
G3 X103.146 Y92.136 I.505 J1.237 E.05866
G3 X102.322 Y93.219 I-1.199 J-.058 E.03487
G1 X102.183 Y93.767 E.01365
G3 X102.059 Y95.728 I-2.321 J.839 E.04874
G1 X101.752 Y96.034 E.01046
G3 X101.787 Y96.645 I-.487 J.335 E.01552
G3 X103.21 Y99.383 I-.484 J1.991 E.08427
G2 X103.015 Y100.4 I10.487 J2.545 E.02499
G3 X99.714 Y103.028 I-1.834 J1.083 E.14709
G1 X99.421 Y102.732 E.01004
G2 X98.034 Y103.015 I-.11 J2.998 E.03445
G3 X96.827 Y102.756 I-.432 J-.929 E.03196
G3 X96.278 Y102.464 I.893 J-2.342 E.01503
G1 X95.973 Y102.495 E.00738
G1 X95.537 Y102.785 E.01264
G3 X94.807 Y103.283 I-.804 J-.394 E.02229
G3 X92.326 Y103.332 I-1.276 J-1.773 E.06364
G3 X91.625 Y102.746 I.488 J-1.296 E.02245
G1 X91.336 Y101.88 E.02203
G2 X90.575 Y102.171 I.46 J2.339 E.01974
G3 X88.468 Y102.275 I-1.068 J-.251 E.06831
G3 X87.991 Y101.595 I.613 J-.937 E.02054
G1 X87.359 Y102.006 E.0182
G3 X83.17 Y102.227 I-2.125 J-.472 E.13647
G3 X83.103 Y101.342 I2.145 J-.608 E.02154
G1 X83.024 Y101.106 E.00601
G1 X82.623 Y100.879 E.0111
G2 X82.03 Y101.983 I.736 J1.106 E.03148
G3 X80.121 Y102.557 I-1.112 J-.237 E.0586
G1 X79.943 Y102.509 E.00445
G1 X79.406 Y102.596 E.01312
G3 X77.349 Y102.278 I-.958 J-.615 E.06337
G3 X78.108 Y100.735 I1.524 J-.207 E.044
G2 X77.93 Y99.707 I-1.502 J-.27 E.02569
G3 X78.324 Y98.009 I2.189 J-.387 E.04319
G1 X78.305 Y97.721 E.00697
G1 X77.974 Y97.286 E.01317
G3 X77.146 Y94.158 I.691 J-1.856 E.09131
G1 X77.45 Y93.846 E.01049
G2 X76.997 Y92.727 I-1.199 J-.166 E.03047
G3 X77.004 Y90.307 I1.746 J-1.205 E.06212
G2 X77.088 Y89.306 I-.934 J-.582 E.02515
G3 X77.2 Y88.45 I2.363 J-.125 E.02095
G3 X76.638 Y87.139 I9.402 J-4.811 E.03443
G3 X76.759 Y86.008 I2.481 J-.305 E.02767
G2 X76.557 Y84.741 I-725.662 J114.949 E.03094
G3 X76.913 Y84.047 I.912 J.03 E.01942
G3 X78.454 Y83.102 I2.352 J2.104 E.04422
G2 X78.134 Y82.482 I-.508 J-.13 E.01839
G2 X77.88 Y81.57 I-2.195 J.12 E.02303
G3 X78.851 Y79.842 I1.524 J-.28 E.05184
G3 X79.376 Y79.41 I1.379 J1.141 E.01649
G1 X79.512 Y78.842 E.01409
G3 X80.611 Y76.939 I1.05 J-.663 E.06508
G3 X81.615 Y78.342 I-.266 J1.25 E.04567
G1 X81.76 Y78.607 E.00728
G1 X82.202 Y78.892 E.01268
G1 X82.52 Y78.917 E.0077
G1 X82.875 Y78.407 E.01498
G3 X83.56 Y76.477 I1.807 J-.446 E.05232
G1 X83.97 Y75.94 E.01629
G3 X86.817 Y76.48 I1.055 J2.211 E.07479
G1 X87.322 Y77.207 E.02134
G1 X87.46 Y76.521 E.01687
G2 X88.713 Y76.279 I-3.349 J-20.773 E.03079
G3 X89.459 Y76.345 I.21 J1.882 E.01816
G1 X89.883 Y75.947 E.01402
G3 X91.628 Y73.833 I2.653 J.413 E.06937
G3 X92.996 Y73.569 I1.506 J4.13 E.03374
M106 S124.95
; WIPE_START
G1 X93.563 Y73.641 E-.21712
G1 X93.846 Y73.739 E-.11402
G1 X93.961 Y73.796 E-.04887
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.72 I-.255 J-1.19 P1  F42000
G1 X76.951 Y77.434 Z1.72
G1 Z1.32
G1 E.4 F1800
G1 F1202
M204 S6000
G3 X77.662 Y77.1 I.628 J.413 E.01993
G1 X77.778 Y76.696 E.01013
G1 X77.878 Y76.726 E.00252
G3 X77.398 Y76.68 I-.345 J1.08 E.16008
G1 X77.722 Y76.68 E.00783
; WIPE_START
M73 P22 R9
G1 F9000
G1 X77.878 Y76.726 E-.06173
G1 X78.307 Y76.947 E-.18348
G1 X78.52 Y77.193 E-.12344
G1 X78.53 Y77.221 E-.01134
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.72 I.953 J-.757 P1  F42000
G1 X76.982 Y75.274 Z1.72
G1 Z1.32
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1202
M204 S5000
G3 X78.053 Y75.06 I1.073 J2.583 E.02651
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.647 Y75.44 E.10353
G3 X76.927 Y75.297 I1.407 J2.417 E.00758
; WIPE_START
G1 F12000
M204 S6000
G1 X77.372 Y75.144 E-.17907
G1 X77.777 Y75.073 E-.15606
G1 X77.895 Y75.068 E-.04487
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.72 I-.01 J1.217 P1  F42000
G1 X103.016 Y75.277 Z1.72
G1 Z1.32
G1 E.4 F1800
G1 F1202
M204 S5000
G3 X103.356 Y75.441 I-1.119 J2.748 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X102.96 Y75.254 I-.19 J2.961 E.02164
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16617
G1 X102.793 Y75.441 E-.21384
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.72 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z1.72
G1 Z1.32
G1 E.4 F1800
G1 F1202
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.68 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.41 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.022 E.03551
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14976
G1 X104.36 Y102.957 E-.0777
G1 X104.36 Y102.556 E-.15254
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.72 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z1.72
G1 Z1.32
G1 E.4 F1800
G1 F1202
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.012 J-2.84 E.03555
G1 X103.354 Y104.56 E.64408
G1 X103.318 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
M73 P23 R9
G1 X102.968 Y104.747 E-.14698
G1 X102.628 Y104.856 E-.13579
G1 X102.376 Y104.9 E-.09723
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.72 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z1.72
G1 Z1.32
G1 E.4 F1800
G1 F1202
M204 S5000
G3 X75.26 Y102.147 I2.462 J-1.479 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.84 J.012 E.03555
G1 X75.64 Y102.957 E.63934
G3 X75.672 Y103.545 I-3.927 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.0943
G1 X75.38 Y102.96 E-.15614
G1 X75.303 Y102.627 E-.12955
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 9/30
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
G1 X94.136 Y92.669 F42000
G1 Z1.48
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X95.013 Y91.891 E.02827
G1 X95.804 Y92.632 E.02613
G1 X95.919 Y93.152 E.01284
G1 X95.62 Y93.926 E.02
G1 X95.051 Y94.261 E.01594
G1 X94.394 Y94.017 E.01689
G1 X93.982 Y93.602 E.01409
G1 X94.093 Y92.708 E.02174
M106 S124.95
M106 S127.5
M204 S10000
G1 X94.49 Y92.917 F42000
G1 F9000
M204 S6000
G1 X95.006 Y92.459 E.01661
G1 X95.422 Y92.849 E.01376
G1 X95.481 Y93.119 E.00665
G1 X95.281 Y93.638 E.01342
G1 X95.01 Y93.798 E.0076
G3 X94.424 Y93.451 I.081 J-.805 E.01693
G1 X94.483 Y92.974 E.0116
M106 S124.95
M106 S127.5
M204 S10000
G1 X94.949 Y87.635 F42000
G1 F9000
M204 S6000
G1 X95.548 Y87.219 E.01758
G3 X96.439 Y87.747 I-.773 J2.322 E.02516
G2 X96.825 Y88.841 I2.172 J-.15 E.02833
G1 X96.592 Y89.056 E.00763
G2 X95.785 Y88.728 I-1.02 J1.352 E.02126
G1 X95.36 Y88.456 E.01218
G2 X94.977 Y87.686 I-13.595 J6.266 E.02075
M106 S124.95
M106 S127.5
M204 S10000
G1 X94.445 Y87.474 F42000
G1 F9000
M204 S6000
G1 X95.504 Y86.738 E.03109
G3 X96.833 Y87.516 I-1.134 J3.459 E.03741
G2 X96.934 Y88.124 I2.147 J-.043 E.0149
G1 X97.342 Y88.935 E.02189
G1 X96.646 Y89.579 E.02287
G2 X95.61 Y89.115 I-1.39 J1.713 E.02769
G1 X95.041 Y88.751 E.01627
G2 X94.398 Y87.507 I-22.035 J10.603 E.03379
M106 S124.95
M106 S127.5
M204 S10000
G1 X99.046 Y96.187 F42000
G1 F9000
M204 S6000
G1 X99.875 Y96.157 E.02
G3 X100.463 Y97.653 I-4.524 J2.642 E.03892
G1 X100.094 Y97.768 E.00931
G1 X100.637 Y98.934 E.03103
G1 X98.467 Y97.94 E.05757
G3 X97.911 Y96.639 I1.281 J-1.317 E.03503
G3 X98.988 Y96.189 I1.329 J1.669 E.0285
M106 S124.95
M106 S127.5
M204 S10000
G1 X99.045 Y96.608 F42000
G1 F9000
M204 S6000
G1 X99.615 Y96.587 E.01378
G3 X99.939 Y97.377 I-2.382 J1.438 E.02067
G1 X99.511 Y97.511 E.01083
G1 X99.775 Y98.077 E.01507
G1 X98.743 Y97.604 E.02735
G3 X98.367 Y96.865 I.738 J-.841 E.0205
G3 X98.988 Y96.621 I.739 J.97 E.01629
M106 S124.95
M106 S127.5
M204 S10000
G1 X92.905 Y74.033 F42000
G1 F9000
M204 S6000
G3 X95.189 Y76.409 I-.135 J2.416 E.08742
G1 X95.407 Y76.817 E.01117
G1 X95.978 Y77.234 E.01704
G3 X97.101 Y78.028 I-.255 J1.552 E.03433
G2 X98.629 Y77.924 I.646 J-1.784 E.038
G3 X100.661 Y78.079 I.716 J4.013 E.04967
G3 X101.393 Y77.916 I.692 J1.383 E.01828
G3 X102.622 Y78.009 I.588 J.398 E.036
G3 X102.635 Y78.489 I-.808 J.261 E.01172
G3 X102.417 Y80.693 I-1.347 J.98 E.05844
G3 X101.766 Y81.281 I-1.096 J-.56 E.02163
G2 X101.711 Y82.021 I.912 J.439 E.01831
G1 X101.967 Y82.638 E.0161
G3 X102.249 Y85.166 I-.662 J1.354 E.07304
G3 X101.803 Y85.612 I-.855 J-.409 E.01551
G2 X102.122 Y86.841 I1.852 J.174 E.03124
G3 X101.023 Y90.068 I-.792 J1.531 E.11818
G1 X100.045 Y89.718 E.02504
G1 X99.644 Y90.457 E.02028
G1 X99.596 Y91.195 E.01782
G1 X100.025 Y91.991 E.0218
G1 X101.078 Y91.86 E.02559
G3 X102.739 Y91.909 I.815 J.55 E.04774
G3 X102.147 Y92.873 I-.76 J.197 E.03046
G2 X101.744 Y93.756 I1.849 J1.377 E.02356
G3 X101.882 Y95.327 I-4.626 J1.198 E.03821
G3 X101.435 Y95.821 I-.965 J-.424 E.01633
G2 X101.485 Y96.487 I.989 J.261 E.01641
G1 X101.817 Y97.107 E.01696
G3 X102.553 Y99.689 I-.491 J1.536 E.07649
G1 X102.456 Y100.189 E.0123
G3 X102.836 Y101.819 I-2.184 J1.368 E.04109
G3 X102.583 Y102.61 I-4.051 J-.857 E.02007
G3 X101.167 Y103.176 I-1.702 J-2.206 E.03725
G3 X99.506 Y102.164 I.284 J-2.335 E.04837
G2 X97.822 Y102.708 I.156 J3.36 E.04319
G3 X96.995 Y102.326 I-.223 J-.603 E.02441
G1 X96.368 Y101.981 E.01725
G1 X95.422 Y102.264 E.02381
G3 X94.557 Y102.932 I-.911 J-.286 E.02806
G3 X92.421 Y102.901 I-1.045 J-1.625 E.05458
G3 X91.879 Y102.169 I.072 J-.62 E.02462
G1 X91.692 Y101.673 E.01277
G2 X90.844 Y101.619 I-.475 J.779 E.02132
G1 X90.222 Y101.983 E.01738
G3 X89.217 Y102.592 I-.752 J-.108 E.03239
G3 X88.807 Y101.8 I.47 J-.745 E.02254
G1 X88.558 Y101.453 E.01031
G1 X87.865 Y101.001 E.01994
G1 X87.005 Y101.674 E.02635
G3 X84.401 Y103.09 I-1.818 J-.242 E.08321
G1 X83.794 Y102.678 E.01769
G3 X83.54 Y101.169 I2.203 J-1.146 E.03749
G1 X83.368 Y100.744 E.01107
G1 X82.405 Y100.235 E.02628
G1 X81.845 Y100.809 E.01934
G1 X81.623 Y101.479 E.01702
G3 X80.75 Y102.54 I-.84 J.198 E.03833
G2 X80.076 Y102.165 I-5.83 J9.667 E.01859
G1 X79.719 Y102.153 E.00862
G1 X79.046 Y102.369 E.01705
G3 X77.774 Y102.432 I-.657 J-.4 E.03618
G3 X77.991 Y101.418 I1.007 J-.315 E.02614
G1 X78.507 Y101.012 E.01584
G1 X78.557 Y100.165 E.02045
G3 X78.915 Y97.914 I1.701 J-.884 E.05888
G1 X78.436 Y96.952 E.02591
G3 X77.131 Y95.588 I.372 J-1.663 E.04825
G3 X78.183 Y93.848 I2.369 J.245 E.05067
G2 X77.947 Y92.707 I-2.175 J-.145 E.02845
G3 X77.727 Y90.584 I.768 J-1.153 E.05876
G1 X77.818 Y90.258 E.00815
G3 X77.642 Y88.653 I2.227 J-1.057 E.03969
G1 X77.673 Y87.925 E.01756
G3 X77.277 Y86.173 I1.104 J-1.17 E.04595
G2 X77.085 Y84.927 I-15.53 J1.757 E.03042
G3 X78.143 Y83.691 I1.88 J.539 E.04045
G1 X78.739 Y83.44 E.01559
G1 X78.807 Y82.711 E.01765
G1 X78.431 Y82.202 E.01526
G2 X78.249 Y81.469 I-2.253 J.171 E.0183
G3 X79.245 Y80.123 I1.168 J-.177 E.04486
G2 X79.817 Y79.587 I-1.001 J-1.641 E.01905
G1 X80.005 Y78.876 E.01774
G3 X80.178 Y77.356 I.956 J-.661 E.04027
G3 X81.197 Y78.146 I.259 J.718 E.03703
G1 X81.117 Y78.827 E.01654
G1 X81.924 Y79.392 E.02375
G1 X82.52 Y79.409 E.01437
G1 X82.881 Y79.164 E.01052
G1 X83.289 Y78.495 E.01891
G3 X84.083 Y76.625 I1.432 J-.496 E.05367
G3 X85.242 Y76.162 I.877 J.513 E.03243
G3 X86.411 Y76.769 I-.343 J2.091 E.0323
G1 X86.977 Y77.601 E.02427
G3 X88.45 Y76.874 I4.747 J7.76 E.03967
G3 X89.663 Y76.86 I.953 J29.353 E.02923
G1 X90.303 Y76.318 E.02023
G3 X91.861 Y74.259 I2.349 J.159 E.0659
G3 X92.847 Y74.026 I.967 J1.883 E.02467
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.476 Y73.683 F42000
G1 F9000
M204 S6000
G3 X95.601 Y76.289 I-.654 J2.703 E.08708
G1 X95.732 Y76.534 E.00672
G1 X96.149 Y76.839 E.01243
G3 X97.357 Y77.663 I-.41 J1.898 E.03616
G2 X98.5 Y77.522 I.406 J-1.41 E.02854
G3 X100.634 Y77.646 I.828 J4.185 E.05212
G2 X101.336 Y77.411 I-.306 J-2.084 E.01795
G3 X103.067 Y78.402 I.679 J.82 E.06224
G3 X102.737 Y80.97 I-1.721 J1.084 E.06768
G3 X102.132 Y81.564 I-1.291 J-.712 E.02073
G2 X102.705 Y82.672 I.943 J.215 E.03271
G3 X102.584 Y85.421 I-1.352 J1.318 E.07434
G3 X102.235 Y85.808 I-.723 J-.302 E.01282
G2 X102.671 Y86.694 I.957 J.079 E.02502
G3 X100.243 Y90.235 I-1.345 J1.681 E.15545
G2 X100.258 Y91.538 I.777 J.643 E.03419
G1 X100.885 Y91.461 E.01523
G3 X103.143 Y91.778 I1.023 J.911 E.06496
M73 P24 R9
G3 X102.444 Y93.188 I-1.137 J.314 E.04155
G2 X102.183 Y93.784 I1.256 J.904 E.01582
G3 X102.284 Y95.468 I-4.589 J1.12 E.0409
G3 X101.844 Y96.014 I-1.04 J-.387 E.01719
G2 X102.12 Y96.783 I1.016 J.07 E.02028
G3 X102.952 Y99.836 I-.763 J1.847 E.08803
G1 X102.892 Y100.146 E.00761
G3 X103.127 Y102.275 I-2.187 J1.319 E.0533
G3 X102.347 Y103.243 I-1.02 J-.023 E.03224
G3 X99.357 Y102.617 I-1.175 J-1.843 E.08157
G2 X97.998 Y103.095 I.169 J2.651 E.03516
G3 X96.7 Y102.643 I-.393 J-.962 E.03621
G1 X96.319 Y102.434 E.01049
G1 X95.708 Y102.617 E.0154
G3 X94.687 Y103.337 I-1.028 J-.373 E.03207
G3 X92.273 Y103.296 I-1.173 J-2.005 E.06123
G3 X91.461 Y102.251 I.194 J-.988 E.03481
G2 X90.999 Y102.016 I-.301 J.02 E.01506
G1 X90.55 Y102.278 E.01254
G3 X88.514 Y102.409 I-1.039 J-.266 E.06497
G2 X87.887 Y101.517 I-1.102 J.108 E.02749
G1 X87.365 Y101.926 E.016
G3 X84.205 Y103.465 I-2.183 J-.468 E.09756
G1 X83.501 Y102.986 E.02053
G3 X83.201 Y102.253 I.784 J-.749 E.01956
G3 X83.117 Y101.243 I2.155 J-.688 E.02465
G1 X83.036 Y101.043 E.00519
G1 X82.486 Y100.753 E.015
G2 X82.071 Y101.689 I.771 J.902 E.02553
G3 X80.365 Y102.839 I-1.214 J.04 E.05921
G2 X79.287 Y102.733 I-.601 J.579 E.02842
G3 X77.39 Y101.619 I-.891 J-.656 E.07825
G3 X78.099 Y100.798 I1.505 J.585 E.02666
G2 X77.95 Y99.798 I-1.104 J-.347 E.02524
G3 X78.42 Y97.863 I2.165 J-.499 E.0498
G1 X78.136 Y97.292 E.01539
G3 X76.705 Y95.549 I.555 J-1.914 E.0578
G3 X77.574 Y93.797 I2.885 J.339 E.04808
G2 X77.739 Y93.408 I-.056 J-.254 E.01191
G2 X77.274 Y92.633 I-.999 J.072 E.02264
G3 X77.339 Y90.41 I1.365 J-1.072 E.05821
G1 X77.378 Y90.271 E.00349
G3 X77.224 Y88.592 I2.396 J-1.067 E.04138
G1 X77.247 Y88.07 E.01261
G3 X76.854 Y86.14 I1.456 J-1.301 E.04978
G2 X76.662 Y84.888 I-89.16 J13.025 E.03055
G3 X78.344 Y83.15 I2.41 J.65 E.06088
G1 X78.374 Y82.831 E.00773
G1 X78.017 Y82.348 E.01448
G2 X77.831 Y81.513 I-3.34 J.306 E.02068
G3 X79.028 Y79.754 I1.554 J-.23 E.05637
G2 X79.429 Y79.411 I-.959 J-1.528 E.01277
G1 X79.563 Y78.903 E.01267
G3 X80.274 Y76.877 I1.144 J-.737 E.05969
G3 X81.621 Y78.136 I.08 J1.264 E.04979
G1 X81.563 Y78.627 E.01192
G1 X82.062 Y78.976 E.01467
G2 X82.57 Y78.868 I.179 J-.408 E.01338
G1 X82.852 Y78.405 E.01306
G3 X83.828 Y76.284 I1.797 J-.459 E.06092
G3 X84.757 Y75.731 I.965 J.565 E.02721
G3 X87.115 Y77.057 I.185 J2.43 E.06915
G3 X88.356 Y76.462 I3.563 J5.842 E.03324
G3 X89.496 Y76.451 I.661 J9.275 E.0275
G1 X89.923 Y76.089 E.01349
G3 X91.173 Y74.155 I2.463 J.22 E.05778
G3 X93.419 Y73.675 I1.721 J2.565 E.05674
M106 S124.95
; WIPE_START
G1 X94.016 Y73.858 E-.23717
G1 X94.341 Y74.047 E-.14283
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.88 I-.225 J-1.196 P1  F42000
G1 X77.074 Y77.296 Z1.88
G1 Z1.48
G1 E.4 F1800
G1 F1216
M204 S6000
G3 X77.65 Y77.105 I.714 J1.188 E.01474
G1 X77.743 Y76.696 E.01013
G3 X77.354 Y76.696 I-.195 J1.107 E.16084
G1 X77.687 Y76.683 E.00804
; WIPE_START
G1 F9000
G1 X78 Y76.765 E-.1231
G1 X78.285 Y76.938 E-.12677
G1 X78.506 Y77.184 E-.12552
G1 X78.511 Y77.195 E-.00461
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.88 I.952 J-.758 P1  F42000
G1 X76.981 Y75.274 Z1.88
G1 Z1.48
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1216
M204 S5000
G3 X78.053 Y75.06 I1.074 J2.591 E.02652
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.926 Y75.297 I1.41 J2.425 E.00759
; WIPE_START
G1 F12000
M204 S6000
G1 X77.372 Y75.144 E-.17918
G1 X77.777 Y75.073 E-.15604
G1 X77.894 Y75.068 E-.04478
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.88 I-.01 J1.217 P1  F42000
G1 X103.016 Y75.277 Z1.88
G1 Z1.48
G1 E.4 F1800
G1 F1216
M204 S5000
G3 X103.356 Y75.441 I-1.122 J2.757 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X102.96 Y75.255 I-.193 J2.97 E.02164
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16617
G1 X102.793 Y75.441 E-.21383
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.88 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z1.88
G1 Z1.48
G1 E.4 F1800
G1 F1216
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.411 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.93 J-.038 E.0355
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14971
G1 X104.36 Y102.957 E-.07768
G1 X104.36 Y102.556 E-.15262
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.88 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z1.88
G1 Z1.48
G1 E.4 F1800
G1 F1216
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.003 J-2.805 E.03556
G1 X103.354 Y104.56 E.64408
M73 P25 R9
G1 X103.318 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.962 Y104.749 E-.14957
G1 X102.628 Y104.856 E-.13323
G1 X102.376 Y104.9 E-.0972
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.88 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z1.88
G1 Z1.48
G1 E.4 F1800
G1 F1216
M204 S5000
G3 X75.26 Y102.147 I2.463 J-1.48 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.844 J.013 E.03555
G1 X75.64 Y102.957 E.63934
G3 X75.672 Y103.545 I-3.928 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.09436
G1 X75.38 Y102.96 E-.15604
G1 X75.303 Y102.628 E-.1296
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 10/30
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
G1 X76.938 Y77.501 F42000
G1 Z1.64
G1 E.4 F1800
; FEATURE: Support
G1 F1360
M204 S6000
G3 X77.612 Y77.115 I.739 J.511 E.01937
G1 X77.7 Y76.705 E.01013
G1 X77.774 Y76.722 E.00183
G3 X77.311 Y76.717 I-.243 J1.087 E.15745
G1 X77.644 Y76.692 E.00806
; WIPE_START
G1 F9000
G1 X77.774 Y76.722 E-.05083
G1 X78.259 Y76.933 E-.20102
G1 X78.486 Y77.179 E-.12693
G1 X78.487 Y77.181 E-.00122
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I-.904 J.815 P1  F42000
G1 X83.385 Y82.615 Z2.04
G1 Z1.64
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X83.711 Y82.349 E.01016
G1 X85.091 Y82.633 E.03396
G2 X84.806 Y83.751 I3.063 J1.376 E.02796
G1 X84.329 Y84.379 E.01902
G1 X83.578 Y84.621 E.01904
G1 X83.113 Y84.114 E.01658
G1 X82.904 Y83.413 E.01764
G1 X83.042 Y82.819 E.01472
G1 X83.34 Y82.652 E.00824
M106 S124.95
M106 S127.5
M204 S10000
G1 X83.577 Y83 F42000
G1 F9000
M204 S6000
G1 X83.822 Y82.801 E.00762
G1 X84.556 Y82.952 E.01806
G3 X84.074 Y84.02 I-1.946 J-.234 E.02869
G1 X83.705 Y84.139 E.00936
G3 X83.409 Y83.094 I.739 J-.774 E.02745
G1 X83.527 Y83.029 E.00325
M106 S124.95
M106 S127.5
M204 S10000
G1 X81.829 Y86.617 F42000
G1 F1360
M204 S6000
G1 X82.486 Y86.579 E.01586
G1 X83.569 Y86.816 E.02674
G1 X83.33 Y87.975 E.02854
G3 X82.082 Y88.703 I-1.746 J-1.559 E.03541
G1 X81.5 Y87.732 E.02732
G1 X81.772 Y86.621 E.02758
M204 S10000
G1 X82.106 Y87.022 F42000
G1 F1360
M204 S6000
G3 X83.074 Y87.138 I.279 J1.774 E.02381
G1 X82.949 Y87.744 E.01493
G3 X82.261 Y88.184 I-1.023 J-.84 E.02003
G1 X81.949 Y87.664 E.01463
G1 X82.092 Y87.078 E.01454
M204 S10000
G1 X80.735 Y95.529 F42000
G1 F9000
M204 S6000
G1 X80.942 Y95.018 E.01327
G2 X82.595 Y95.065 I.888 J-2.148 E.04078
G1 X83.339 Y95.175 E.01813
G1 X83.015 Y95.804 E.01706
G3 X82.435 Y95.876 I-.331 J-.293 E.01541
G2 X81.58 Y95.914 I-.298 J2.91 E.02071
G3 X80.78 Y95.565 I-.055 J-.964 E.02184
M106 S124.95
M106 S127.5
M204 S10000
G1 X80.251 Y95.606 F42000
G1 F9000
M204 S6000
G1 X80.693 Y94.514 E.02842
G2 X81.95 Y94.775 I1.233 J-2.778 E.0312
G2 X82.547 Y94.633 I-.029 J-1.45 E.0149
G1 X83.981 Y94.845 E.03496
G1 X83.329 Y96.112 E.03434
G1 X82.809 Y96.393 E.01427
G2 X81.569 Y96.341 I-.719 J2.334 E.03026
G1 X80.896 Y96.198 E.01659
G1 X80.229 Y95.66 E.02068
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.604 Y94.733 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I.224 J1.196 P1  F42000
G1 X93.936 Y92.232 Z2.04
G1 Z1.64
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X94.865 Y91.84 E.02431
G1 X95.358 Y91.935 E.0121
G1 X95.869 Y92.586 E.01996
G2 X96.016 Y93.201 I1.625 J-.065 E.01534
G1 X95.724 Y94.014 E.02083
G3 X94.876 Y94.368 I-1.041 J-1.303 E.02246
G1 X94.072 Y93.971 E.02162
G1 X93.868 Y93.474 E.01295
M73 P26 R9
G2 X93.883 Y92.254 I-2.501 J-.64 E.0297
M106 S124.95
M106 S127.5
M204 S10000
G1 X94.337 Y92.519 F42000
G1 F9000
M204 S6000
G1 X94.911 Y92.277 E.01502
G1 X95.124 Y92.318 E.00524
G1 X95.468 Y92.755 E.01341
G3 X95.379 Y93.732 I-1.097 J.393 E.0244
G3 X94.919 Y93.921 I-.56 J-.708 E.01216
G1 X94.4 Y93.664 E.01396
G1 X94.299 Y93.416 E.00648
G2 X94.343 Y92.576 I-1.705 J-.512 E.02048
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.911 Y92.277 E-.24377
G1 X95.124 Y92.318 E-.08257
G1 X95.212 Y92.429 E-.05366
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I-.821 J.898 P1  F42000
G1 X99.12 Y96.003 Z2.04
G1 Z1.64
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X99.266 Y95.969 E.00361
G2 X99.941 Y96.209 I1.15 J-2.164 E.01733
G1 X100.643 Y97.077 E.02693
G1 X99.958 Y97.954 E.02684
G1 X99.187 Y98.374 E.02118
G2 X98.095 Y97.94 I-1.54 J2.28 E.02856
G3 X97.4 Y96.748 I1.49 J-1.666 E.03382
G1 X98.71 Y96.024 E.03609
G1 X99.063 Y96.016 E.00852
M106 S124.95
M106 S127.5
M204 S10000
G1 X99.116 Y96.435 F42000
G1 F9000
M204 S6000
G3 X100.107 Y97.082 I-.011 J1.1 E.03014
G1 X99.681 Y97.627 E.01669
G1 X99.18 Y97.9 E.01375
G2 X98.335 Y97.569 I-1.179 J1.767 E.02205
G3 X97.923 Y96.939 I.764 J-.951 E.01845
G1 X98.823 Y96.441 E.02481
G1 X99.058 Y96.436 E.00567
M106 S124.95
M106 S127.5
; WIPE_START
G1 X99.225 Y96.409 E-.06449
G1 X99.7 Y96.58 E-.19159
G1 X99.905 Y96.833 E-.12392
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I1.08 J-.561 P1  F42000
G1 X93.547 Y84.587 Z2.04
G1 Z1.64
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X93.743 Y84.303 E.00831
G1 X94.466 Y84.435 E.01772
G2 X96.228 Y87.44 I2.455 J.579 E.09271
G1 X96.631 Y87.826 E.01348
G2 X96.737 Y88.433 I1.873 J-.013 E.01493
G1 X96.413 Y88.953 E.01476
G1 X96.214 Y88.969 E.00483
G1 X95.319 Y88.668 E.02277
G2 X94.252 Y87.034 I-2.508 J.471 E.04831
G1 X94.023 Y86.457 E.01496
G2 X93.597 Y85.13 I-2.016 J-.085 E.03431
G1 X93.553 Y84.644 E.01177
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.148 Y84.426 F42000
G1 F9000
M204 S6000
G1 X93.552 Y83.841 E.01713
G1 X94.916 Y84.09 E.03344
G2 X94.885 Y85.531 I3.404 J.794 E.03501
G2 X96.437 Y87.058 I1.985 J-.465 E.05539
G1 X97.041 Y87.637 E.02019
G2 X97.184 Y88.509 I2.685 J.008 E.0214
G1 X96.658 Y89.355 E.02403
G1 X96.161 Y89.394 E.01201
G1 X94.983 Y88.999 E.02997
G2 X93.903 Y87.298 I-2.457 J.367 E.05004
G1 X93.613 Y86.642 E.01729
G2 X93.188 Y85.268 I-1.872 J-.173 E.03558
G1 X93.115 Y84.473 E.01925
M106 S124.95
M106 S127.5
M204 S10000
G1 X91.841 Y79.439 F42000
G1 F9000
M204 S6000
G1 X92.312 Y78.425 E.02695
G2 X94.367 Y79.151 I8.416 J-20.566 E.05258
G1 X94.219 Y80.196 E.02545
G1 X92.88 Y80.244 E.03233
G2 X91.816 Y79.491 I-1.939 J1.612 E.03178
M106 S124.95
M106 S127.5
M204 S10000
G1 X92.362 Y79.313 F42000
G1 F9000
M204 S6000
G1 X92.528 Y78.958 E.00945
G2 X93.902 Y79.44 I5.601 J-13.758 E.03515
G1 X93.853 Y79.789 E.00849
G1 X93.043 Y79.818 E.01955
G2 X92.413 Y79.341 I-1.206 J.939 E.01927
M106 S124.95
M106 S127.5
M204 S10000
G1 X92.888 Y74.098 F42000
G1 F9000
M204 S6000
G3 X95.145 Y76.551 I-.081 J2.34 E.08948
G1 X95.696 Y77.182 E.02019
G3 X96.758 Y77.543 I-.052 J1.894 E.02747
G2 X97.42 Y78.14 I1.108 J-.564 E.02198
G1 X98.145 Y78.155 E.01749
G3 X99.298 Y77.884 I1.145 J2.283 E.0288
G3 X100.111 Y77.922 I.371 J.779 E.02046
G1 X100.715 Y78.112 E.01527
G1 X101.336 Y77.969 E.01535
G3 X102.446 Y77.665 I.719 J.446 E.03053
G3 X102.651 Y78.616 I-.709 J.65 E.02459
G3 X102.514 Y80.488 I-1.362 J.842 E.04836
G3 X101.702 Y81.393 I-1.47 J-.502 E.03013
M73 P26 R8
G2 X101.973 Y82.658 I2.021 J.228 E.03175
G3 X102.047 Y85.276 I-.596 J1.327 E.07863
G3 X101.639 Y85.635 I-.779 J-.473 E.0133
G2 X102.558 Y87.172 I1.882 J-.083 E.04498
G3 X100.069 Y89.469 I-1.227 J1.168 E.12957
G1 X99.529 Y88.652 E.02362
G1 X98.694 Y89.647 E.03132
G2 X99.032 Y90.741 I2.155 J-.066 E.02796
G3 X100.002 Y92.054 I-1.774 J2.326 E.03988
G1 X101.126 Y91.913 E.02732
G3 X102.701 Y91.691 I.894 J.64 E.04288
G3 X102.576 Y92.676 I-.68 J.414 E.02587
G1 X101.874 Y93.01 E.01874
G1 X101.965 Y93.373 E.00903
G1 X101.718 Y93.769 E.01126
G3 X101.866 Y94.806 I-1.583 J.755 E.02564
G3 X101.563 Y95.788 I-.612 J.349 E.02778
G1 X101.422 Y96.3 E.01281
G1 X101.801 Y97.112 E.0216
G3 X102.85 Y99.1 I-.455 J1.511 E.06033
G1 X102.499 Y99.834 E.01963
G1 X102.549 Y100.566 E.01768
G3 X102.731 Y102.116 I-1.517 J.965 E.03895
G3 X102.105 Y102.894 I-.646 J.121 E.02736
G3 X100.143 Y102.775 I-.89 J-1.565 E.05014
G1 X99.657 Y102.287 E.0166
G1 X98.882 Y102.158 E.01896
G1 X98.229 Y102.392 E.01673
G3 X97.142 Y102.621 I-.618 J-.242 E.03172
G2 X96.382 Y101.885 I-1.117 J.394 E.02644
G1 X95.495 Y102.273 E.02332
G3 X94.504 Y102.919 I-.818 J-.17 E.03172
G3 X92.561 Y102.939 I-.987 J-1.576 E.04929
G3 X91.837 Y102.467 I-.129 J-.594 E.02319
G1 X91.82 Y101.767 E.01689
G1 X91.19 Y101.628 E.01555
G1 X90.734 Y101.717 E.0112
G1 X90.163 Y102.166 E.01751
G3 X88.827 Y102.045 I-.663 J-.113 E.04842
G1 X88.81 Y101.646 E.00963
G1 X88.4 Y101.251 E.01375
G1 X87.272 Y100.81 E.0292
G3 X86.558 Y102.577 I-5.118 J-1.041 E.04623
G3 X84.17 Y102.906 I-1.357 J-1.017 E.06466
G3 X83.598 Y102.057 I.012 J-.625 E.02889
G3 X83.511 Y100.799 I138.187 J-10.208 E.03042
G1 X82.719 Y100.247 E.02328
G1 X81.964 Y100.399 E.01856
G1 X81.578 Y101.242 E.02235
G3 X81.089 Y102.576 I-1.03 J.38 E.03729
G3 X80.227 Y102.252 I-.186 J-.813 E.02354
G1 X79.634 Y102.179 E.01439
G1 X78.956 Y102.464 E.01774
G3 X77.728 Y102.469 I-.616 J-.436 E.03462
G3 X78.465 Y101.187 I1.006 J-.275 E.03964
G1 X78.622 Y100.238 E.0232
G3 X78.812 Y97.882 I1.632 J-1.053 E.06127
G1 X78.431 Y96.897 E.02546
G3 X77.232 Y95.777 I.35 J-1.576 E.04151
G3 X78.139 Y93.776 I2.933 J.124 E.0543
G1 X78.114 Y93.19 E.01415
G2 X77.384 Y92.028 I-30.764 J18.517 E.03309
G3 X77.599 Y90.758 I1.24 J-.443 E.03244
G3 X77.781 Y89.955 I1.572 J-.066 E.0201
G3 X77.837 Y88.26 I2.028 J-.782 E.04202
G1 X77.774 Y87.581 E.01644
G3 X77.546 Y86.389 I1.083 J-.825 E.03033
G1 X77.442 Y85.749 E.01563
G3 X77.902 Y83.926 I1.048 J-.705 E.05115
G3 X78.703 Y83.448 I1.732 J1.991 E.0226
G2 X78.641 Y82.152 I-1.909 J-.558 E.03186
G3 X79.342 Y80.08 I.761 J-.897 E.06772
G1 X79.758 Y79.872 E.01123
G1 X80.008 Y79.389 E.01311
G2 X79.79 Y78.197 I-3.693 J.06 E.02933
G3 X80.322 Y77.235 I.794 J-.19 E.02911
G3 X81.18 Y78.062 I-.003 J.862 E.03174
G1 X81.1 Y78.836 E.01876
G1 X81.867 Y79.465 E.02392
G1 X82.625 Y79.449 E.01828
G1 X83.053 Y79.037 E.01433
G2 X83.208 Y77.869 I-1.636 J-.811 E.02893
G3 X84.336 Y76.506 I1.545 J.131 E.04539
G3 X85.167 Y76.193 I.675 J.532 E.0225
G3 X86.734 Y77.371 I-.251 J1.966 E.04946
G1 X87.687 Y77.408 E.02299
G3 X89.543 Y77.007 I1.247 J1.27 E.04833
G1 X90.351 Y76.415 E.02413
G3 X92.83 Y74.095 I2.583 J.275 E.08926
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.102 Y73.688 F42000
G1 F9000
M204 S6000
G3 X95.549 Y76.376 I-.26 J2.694 E.0961
G1 X95.916 Y76.796 E.01345
G3 X97.095 Y77.284 I-.134 J1.99 E.03133
G2 X97.522 Y77.722 I.776 J-.329 E.01508
G2 X98.589 Y77.528 I.186 J-2.009 E.02647
G3 X100.025 Y77.416 I1.13 J5.214 E.03485
G2 X100.732 Y77.677 I1.275 J-2.366 E.01824
G2 X101.4 Y77.353 I.034 J-.781 E.01866
G3 X103.08 Y78.555 I.658 J.855 E.06644
G3 X102.884 Y80.698 I-1.752 J.921 E.05488
G3 X102.119 Y81.622 I-1.827 J-.735 E.02939
G2 X102.317 Y82.381 I1.252 J.08 E.01925
G3 X102.352 Y85.573 I-.909 J1.606 E.093
G3 X102.106 Y85.804 I-.492 J-.278 E.00825
G2 X102.845 Y86.862 I1.46 J-.233 E.0322
G3 X99.489 Y89.353 I-1.492 J1.497 E.17524
G1 X99.137 Y89.773 E.0132
G2 X99.573 Y90.631 I1.149 J-.043 E.02396
G3 X100.232 Y91.602 I-1.957 J2.039 E.0285
G1 X100.933 Y91.514 E.01702
G3 X103.043 Y91.437 I1.091 J.943 E.05713
G3 X102.365 Y93.242 I-.981 J.661 E.05434
G1 X102.415 Y93.444 E.00504
G1 X102.17 Y93.838 E.01119
G3 X102.293 Y94.724 I-1.518 J.662 E.02183
G3 X101.937 Y96.014 I-.915 J.442 E.03523
G1 X101.868 Y96.263 E.00623
G1 X102.113 Y96.787 E.01395
G3 X103.246 Y99.247 I-.748 J1.835 E.0719
G1 X102.925 Y99.916 E.01789
G1 X102.961 Y100.439 E.01264
G3 X103.158 Y102.147 I-1.93 J1.088 E.04259
G3 X102.221 Y103.302 I-1.002 J.145 E.04027
G3 X99.455 Y102.68 I-1.033 J-1.864 E.0748
G2 X98.272 Y102.986 I-.39 J.93 E.03165
G3 X96.572 Y102.498 I-.686 J-.815 E.05032
G1 X96.348 Y102.358 E.00637
G1 X95.796 Y102.6 E.01453
G3 X94.573 Y103.352 I-1.081 J-.387 E.0374
G3 X92.47 Y103.361 I-1.06 J-1.936 E.05287
G3 X91.408 Y102.106 I-.054 J-1.031 E.04585
G2 X90.914 Y102.11 I-.242 J.57 E.01225
G1 X90.504 Y102.432 E.01259
G3 X88.41 Y102.121 I-1.012 J-.391 E.07063
G2 X88.169 Y101.611 I-.387 J-.128 E.015
G1 X87.532 Y101.362 E.01649
G3 X86.886 Y102.842 I-4.376 J-1.029 E.03916
G3 X83.985 Y103.287 I-1.68 J-1.278 E.07824
G3 X83.167 Y102.021 I.166 J-1.005 E.04092
G3 X83.119 Y101.038 I15.737 J-1.261 E.02374
G1 X82.625 Y100.694 E.01451
G1 X82.257 Y100.768 E.00907
G1 X82.007 Y101.313 E.01444
G3 X80.955 Y103.047 I-1.337 J.375 E.05483
G3 X80.051 Y102.653 I-.03 J-1.168 E.02455
G1 X79.694 Y102.609 E.00867
G1 X79.21 Y102.813 E.01266
G3 X77.351 Y102.664 I-.873 J-.785 E.052
G3 X77.722 Y101.131 I1.272 J-.503 E.04056
G3 X78.088 Y100.893 I.626 J.564 E.01063
G1 X78.185 Y100.301 E.01448
G3 X78.063 Y98.198 I2.395 J-1.195 E.05221
G1 X78.338 Y97.82 E.01127
G1 X78.109 Y97.231 E.01524
G3 X76.805 Y95.808 I.631 J-1.887 E.04858
G3 X77.712 Y93.623 I3.34 J.105 E.05832
G2 X77.465 Y92.872 I-.892 J-.123 E.01974
G3 X77.18 Y90.625 I1.162 J-1.289 E.05952
G1 X77.342 Y89.967 E.01632
G3 X77.411 Y88.216 I2.261 J-.788 E.04329
G2 X77.084 Y87.082 I-2.892 J.219 E.02865
G2 X77.04 Y85.895 I-5.565 J-.386 E.0287
G3 X77.017 Y84.252 I1.213 J-.838 E.04201
G1 X77.16 Y84.002 E.00695
G3 X78.316 Y83.174 I3.202 J3.248 E.03443
G2 X78.106 Y82.216 I-.983 J-.287 E.02467
G3 X79.189 Y79.687 I1.266 J-.954 E.0803
G2 X79.581 Y79.3 I-.071 J-.463 E.01419
G2 X79.367 Y78.225 I-4.342 J.303 E.0265
G3 X80.244 Y76.817 I1.217 J-.22 E.04386
G3 X81.604 Y78.051 I.117 J1.237 E.04984
G1 X81.541 Y78.654 E.01463
G1 X82.013 Y79.042 E.01472
G1 X82.452 Y79.032 E.01058
G1 X82.679 Y78.814 E.00759
G2 X82.786 Y77.847 I-1.365 J-.641 E.02389
G3 X84.115 Y76.146 I1.934 J.142 E.05521
G3 X84.677 Y75.768 I.97 J.834 E.01651
G3 X86.961 Y76.96 I.184 J2.434 E.06545
G1 X87.556 Y76.983 E.01436
G3 X89.452 Y76.553 I1.354 J1.576 E.0488
G1 X89.972 Y76.172 E.01554
G3 X91.595 Y73.992 I2.739 J.345 E.06853
G3 X93.044 Y73.685 I1.281 J2.475 E.03616
M106 S124.95
; WIPE_START
G1 X93.953 Y73.906 E-.35526
G1 X94.01 Y73.937 E-.02474
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I-.095 J-1.213 P1  F42000
G1 X76.983 Y75.273 Z2.04
G1 Z1.64
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1360
M204 S5000
G3 X78.053 Y75.06 I1.073 J2.592 E.02649
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.928 Y75.297 I1.41 J2.425 E.00763
; WIPE_START
G1 F12000
M204 S6000
G1 X77.372 Y75.144 E-.17863
G1 X77.777 Y75.073 E-.15605
G1 X77.896 Y75.068 E-.04532
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I-.01 J1.217 P1  F42000
G1 X103.016 Y75.277 Z2.04
G1 Z1.64
G1 E.4 F1800
G1 F1360
M204 S5000
G3 X103.356 Y75.441 I-1.124 J2.765 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
M73 P27 R8
G3 X102.96 Y75.255 I-.195 J2.978 E.02163
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16626
G1 X102.793 Y75.441 E-.21375
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z2.04
G1 Z1.64
G1 E.4 F1800
G1 F1360
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.41 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.021 E.03551
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14977
G1 X104.36 Y102.957 E-.07768
G1 X104.36 Y102.556 E-.15255
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z2.04
G1 Z1.64
G1 E.4 F1800
G1 F1360
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.014 J-2.848 E.03555
G1 X103.354 Y104.56 E.64408
G1 X103.317 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.955 Y104.752 E-.15216
G1 X102.628 Y104.856 E-.13062
G1 X102.376 Y104.9 E-.09722
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z2.04
G1 Z1.64
G1 E.4 F1800
G1 F1360
M204 S5000
G3 X75.26 Y102.147 I2.463 J-1.479 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.848 J.014 E.03555
G1 X75.64 Y102.957 E.63934
G3 X75.672 Y103.545 I-3.926 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
M73 P28 R8
G1 X75.528 Y103.343 E-.09436
G1 X75.38 Y102.96 E-.15608
G1 X75.302 Y102.628 E-.12956
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 11/30
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G1 X76.944 Y77.519 F42000
G1 Z1.8
G1 E.4 F1800
; FEATURE: Support
G1 F1409
M204 S6000
G1 X76.96 Y77.493 E.00073
G3 X77.611 Y77.129 I.715 J.516 E.01858
G1 X77.7 Y76.719 E.01013
G1 X77.902 Y76.765 E.00501
G3 X77.041 Y78.831 I-.346 J1.068 E.08949
G3 X77.643 Y76.706 I.552 J-.991 E.07327
; WIPE_START
G1 F9000
G1 X77.902 Y76.765 E-.10093
G1 X78.251 Y76.946 E-.14943
G1 X78.476 Y77.189 E-.12564
G1 X78.479 Y77.199 E-.004
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.188 J.263 P1  F42000
G1 X79.778 Y83.067 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X80.091 Y82.696 E.01171
G1 X80.806 Y82.696 E.01725
G1 X81.933 Y83.572 E.03442
G1 X80.966 Y84.359 E.03007
G3 X79.47 Y84.202 I-.41 J-3.312 E.03658
G1 X79.741 Y83.111 E.02711
M106 S124.95
M106 S127.5
M204 S10000
G1 X80.125 Y83.307 F42000
G1 F9000
M204 S6000
G1 X80.286 Y83.116 E.00603
G1 X80.662 Y83.116 E.00907
G1 X81.258 Y83.58 E.01821
G1 X80.814 Y83.941 E.01382
G3 X79.982 Y83.882 I-.289 J-1.827 E.02027
G1 X80.111 Y83.363 E.01289
M106 S124.95
M106 S127.5
M204 S10000
G1 X83.379 Y82.569 F42000
G1 F9000
M204 S6000
G1 X83.893 Y82.093 E.01689
G1 X85.119 Y82.759 E.03363
G2 X84.825 Y83.787 I2.407 J1.243 E.02596
G2 X84.994 Y84.501 I1.942 J-.082 E.01778
G3 X84.904 Y85.598 I-1.382 J.44 E.02725
G1 X84.194 Y86.206 E.02255
G1 X83.598 Y85.425 E.02369
G2 X83.065 Y84.11 I-1.648 J-.097 E.03537
G1 X82.303 Y83.164 E.02929
G1 X83.336 Y82.608 E.02831
M106 S124.95
M106 S127.5
M204 S10000
G1 X83.582 Y82.953 F42000
G1 F9000
M204 S6000
G1 X83.957 Y82.606 E.01232
G1 X84.611 Y82.961 E.01794
G2 X84.581 Y84.596 I1.746 J.85 E.0407
G3 X84.539 Y85.358 I-.949 J.331 E.01888
G1 X84.258 Y85.598 E.00891
G3 X83.947 Y84.771 I.536 J-.674 E.02239
G2 X83.375 Y83.826 I-1.938 J.528 E.02699
G1 X82.947 Y83.295 E.01644
G1 X83.531 Y82.98 E.016
M106 S124.95
M106 S127.5
; WIPE_START
G1 X83.957 Y82.606 E-.21541
G1 X84.338 Y82.813 E-.16459
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.083 J-.555 P1  F42000
G1 X82.415 Y86.565 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X82.832 Y86.462 E.01036
G1 X83.534 Y87.33 E.02692
G2 X83.581 Y88.795 I2.394 J.657 E.03589
G3 X83.134 Y90.009 I-1.69 J.067 E.03202
G3 X81.917 Y89.725 I-.135 J-2.172 E.03056
G2 X81.404 Y87.785 I-2.446 J-.392 E.04984
G1 X81.587 Y86.595 E.02904
G1 X82.359 Y86.579 E.01861
M106 S124.95
M106 S127.5
M204 S10000
G1 X82.414 Y86.998 F42000
G1 F9000
M204 S6000
G1 X82.674 Y86.934 E.00645
G1 X83.083 Y87.44 E.01569
G2 X83.154 Y88.808 I2.625 J.55 E.03341
G3 X82.912 Y89.568 I-1.039 J.088 E.01975
G3 X82.342 Y89.442 I-.075 J-1.013 E.01427
G2 X81.845 Y87.681 I-2.426 J-.267 E.04525
G1 X81.949 Y87.007 E.01643
G1 X82.356 Y86.999 E.00983
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.674 Y86.934 E-.12314
G1 X83.083 Y87.44 E-.24716
G1 X83.078 Y87.465 E-.0097
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.211 J-.119 P1  F42000
G1 X82.372 Y94.652 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X82.933 Y94.446 E.01443
G1 X83.787 Y95.34 E.0298
G1 X83.489 Y96.087 E.0194
G1 X82.982 Y96.495 E.01568
G2 X81.736 Y96.35 I-.94 J2.64 E.03051
G1 X81.362 Y96.259 E.00927
G1 X79.528 Y96.431 E.04442
G1 X80.513 Y94.886 E.04418
G1 X80.987 Y94.552 E.014
G2 X82.318 Y94.672 I.864 J-2.131 E.03269
M106 S124.95
M106 S127.5
M204 S10000
G1 X82.421 Y95.082 F42000
G1 F9000
M204 S6000
G1 X82.82 Y94.935 E.01025
G1 X83.297 Y95.435 E.01666
G3 X82.878 Y96.04 I-.745 J-.069 E.01855
G2 X81.786 Y95.93 I-.786 J2.32 E.02668
G1 X81.393 Y95.834 E.00976
G1 X80.344 Y95.933 E.02541
G1 X80.823 Y95.182 E.02148
G1 X81.07 Y95.007 E.00729
G2 X82.363 Y95.09 I.797 J-2.305 E.03164
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.82 Y94.935 E-.18312
G1 X83.178 Y95.31 E-.19688
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.135 J.439 P1  F42000
G1 X84.048 Y97.564 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X85.118 Y96.826 E.03135
G1 X85.722 Y97.607 E.02379
G1 X85.82 Y98.041 E.01073
G2 X85.573 Y99.23 I2.82 J1.206 E.02949
G1 X84.723 Y100.023 E.02802
G1 X83.793 Y99.365 E.02748
G2 X84.001 Y97.597 I-2.59 J-1.201 E.04365
M106 S124.95
M106 S127.5
M204 S10000
G1 X84.437 Y97.806 F42000
G1 F9000
M204 S6000
G1 X85.029 Y97.398 E.01735
G3 X85.384 Y98.02 I-.489 J.691 E.01782
G2 X85.174 Y99.028 I2.39 J1.024 E.025
G1 X84.686 Y99.483 E.01608
G1 X84.294 Y99.205 E.0116
G2 X84.442 Y97.864 I-2.45 J-.949 E.0329
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.029 Y97.398 E-.28508
G1 X85.182 Y97.596 E-.09492
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.013 J.675 P1  F42000
G1 X89.928 Y90.477 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.287 Y90.311 E.00954
G1 X90.952 Y90.434 E.01631
G3 X90.825 Y91.155 I-1.37 J.131 E.01787
G2 X89.987 Y91.683 I.908 J2.373 E.02405
G1 X89.26 Y91.852 E.01799
G2 X89.151 Y91.163 I-1.683 J-.085 E.01694
G1 X89.388 Y90.631 E.01404
G3 X89.871 Y90.488 I.552 J.975 E.01226
M106 S124.95
M106 S127.5
M204 S10000
G1 X89.851 Y90.05 F42000
G1 F9000
M204 S6000
G1 X90.231 Y89.874 E.01012
G1 X91.41 Y90.092 E.0289
G1 X91.307 Y91.076 E.02387
G1 X91.158 Y91.459 E.0099
G2 X90.171 Y92.071 I1.048 J2.787 E.02817
G1 X88.894 Y92.368 E.03161
G1 X88.789 Y91.407 E.02331
G1 X88.701 Y91.14 E.00678
G1 X89.07 Y90.312 E.02187
G3 X89.798 Y90.074 I.879 J1.458 E.01863
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.805 Y92.306 F42000
G1 F9000
M204 S6000
G1 X94.672 Y91.707 E.0254
G1 X95.374 Y91.949 E.01791
G1 X95.895 Y92.515 E.01855
G2 X96.052 Y93.044 I1.163 J-.058 E.01344
G1 X95.947 Y93.784 E.01802
G1 X95.587 Y94.29 E.01498
G2 X94.543 Y94.594 I.436 J3.438 E.02632
G1 X93.704 Y95.287 E.02623
G1 X92.894 Y94.465 E.02783
G1 X93.615 Y93.617 E.02684
G2 X93.758 Y92.339 I-1.708 J-.839 E.03165
M106 S124.95
M106 S127.5
M204 S10000
G1 X94.206 Y92.539 F42000
G1 F9000
M204 S6000
G1 X94.735 Y92.173 E.01552
G3 X95.527 Y92.878 I-.083 J.89 E.02735
G1 X95.62 Y93.1 E.0058
G1 X95.546 Y93.624 E.01276
G1 X95.356 Y93.889 E.00786
G2 X93.733 Y94.718 I.277 J2.545 E.04493
G1 X93.463 Y94.444 E.00928
G1 X93.978 Y93.838 E.01918
G2 X94.214 Y92.597 I-2.087 J-1.039 E.03086
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.735 Y92.173 E-.25539
G1 X95.045 Y92.28 E-.12461
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.969 J.736 P1  F42000
G1 X97.997 Y96.163 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X98.431 Y95.917 E.01204
G2 X99.326 Y95.939 I.478 J-1.245 E.02201
G2 X99.967 Y96.191 I1.041 J-1.709 E.01669
G1 X100.793 Y97.029 E.02838
G2 X99.987 Y98.003 I1.897 J2.388 E.03071
G1 X99.259 Y98.359 E.01955
G3 X97.988 Y98.01 I2.313 J-10.932 E.0318
G3 X97.049 Y96.682 I.501 J-1.35 E.04169
G1 X97.947 Y96.191 E.02467
M106 S124.95
M106 S127.5
M204 S10000
G1 X98.151 Y96.559 F42000
G1 F9000
M204 S6000
G1 X98.491 Y96.366 E.00944
G2 X99.274 Y96.38 I.417 J-1.46 E.01909
G3 X100.213 Y97.039 I-.513 J1.73 E.02817
G2 X99.69 Y97.681 I1.254 J1.555 E.02011
G1 X99.196 Y97.922 E.01327
G3 X97.738 Y97.36 I.766 J-4.161 E.03789
G3 X97.532 Y96.896 I.442 J-.474 E.01258
G1 X98.1 Y96.586 E.0156
M106 S124.95
M106 S127.5
; WIPE_START
G1 X98.491 Y96.366 E-.17066
G1 X98.825 Y96.428 E-.12887
G1 X99.035 Y96.405 E-.08047
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.123 J-.468 P1  F42000
G1 X92.008 Y79.559 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.397 Y78.929 E.01786
G2 X93.878 Y78.979 I14.847 J-414.677 E.03572
G1 X93.686 Y79.635 E.01646
G3 X93.172 Y79.869 I-.382 J-.157 E.01501
G3 X92.056 Y79.592 I-.303 J-1.166 E.02891
M106 S124.95
M106 S127.5
M204 S10000
G1 X91.473 Y79.626 F42000
G1 F9000
M204 S6000
G1 X92.171 Y78.496 E.03202
G3 X94.43 Y78.586 I-36.488 J944.736 E.05453
G1 X94.059 Y79.855 E.03187
G1 X93.644 Y80.272 E.0142
G3 X92.29 Y80.27 I-.668 J-4.486 E.03278
G1 X91.443 Y79.676 E.02496
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.026 Y74.18 F42000
G1 F9000
M204 S6000
G3 X94.994 Y75.865 I-.168 J2.189 E.06684
G3 X95.166 Y76.452 I-.81 J.555 E.015
G1 X95.373 Y76.836 E.01052
G1 X96.044 Y77.307 E.01977
G3 X96.967 Y77.868 I.187 J.733 E.02902
G1 X97.388 Y78.187 E.01274
G1 X98.192 Y78.204 E.01938
G3 X99.287 Y77.909 I.988 J1.49 E.02784
G3 X100.027 Y77.85 I.407 J.431 E.01934
G1 X100.484 Y78.184 E.01365
G1 X101.325 Y77.976 E.02089
G3 X102.498 Y77.606 I.817 J.546 E.03206
G3 X102.581 Y78.655 I-.554 J.572 E.02771
G3 X102.556 Y80.376 I-1.568 J.838 E.04335
G3 X101.843 Y81.36 I-1.856 J-.596 E.0298
G1 X101.681 Y81.795 E.0112
G1 X101.944 Y82.642 E.02139
G3 X102.664 Y83.298 I-.842 J1.647 E.02375
G3 X101.675 Y85.414 I-1.369 J.65 E.06431
G1 X101.605 Y86.09 E.01638
G1 X102.006 Y86.848 E.02068
G3 X102.582 Y87.18 I-.203 J1.018 E.01632
G3 X101.111 Y89.982 I-1.258 J1.127 E.09885
G3 X100.022 Y89.286 I.223 J-1.549 E.03212
G1 X99.671 Y89.081 E.00981
G2 X98.432 Y89.075 I-.638 J3.859 E.03001
G3 X97.312 Y87.857 I.086 J-1.203 E.04396
G1 X97.089 Y87.427 E.01169
G1 X96.547 Y87.009 E.01649
G3 X94.937 Y84.592 I.398 J-2.01 E.07784
G1 X94.638 Y84.176 E.01236
G1 X93.937 Y83.827 E.01889
G3 X92.385 Y83.525 I-.431 J-1.918 E.03923
G1 X91.716 Y83.439 E.01627
G3 X90.647 Y83.546 I-.76 J-2.201 E.02614
G2 X90.06 Y84.859 I.742 J1.12 E.03659
G2 X90.644 Y85.307 I.73 J-.347 E.01842
G1 X91.323 Y85.401 E.01655
G3 X93.542 Y86.078 I.874 J1.11 E.06563
G3 X93.517 Y86.873 I-1.623 J.346 E.01935
G2 X94.479 Y87.896 I13.944 J-12.138 E.03389
G3 X94.898 Y88.912 I-2.149 J1.482 E.02669
G1 X95.522 Y89.329 E.01811
G3 X96.849 Y90.314 I-.199 J1.654 E.04168
G2 X98.465 Y90.539 I4.458 J-26.057 E.03935
G3 X99.855 Y92.108 I-.625 J1.953 E.05306
G1 X100.528 Y92.185 E.01635
G1 X101.193 Y91.944 E.01704
G3 X102.617 Y91.511 I.986 J.683 E.03872
G3 X102.209 Y92.897 I-.531 J.597 E.04356
G1 X101.889 Y93.25 E.01147
G1 X101.747 Y93.975 E.01781
G3 X101.854 Y94.673 I-2.127 J.685 E.0171
G3 X101.607 Y95.831 I-.575 J.483 E.03292
G1 X101.454 Y96.357 E.01321
G1 X101.84 Y97.149 E.02123
G3 X102.624 Y97.582 I-.657 J2.117 E.02176
G3 X102.868 Y98.924 I-2.525 J1.151 E.03322
G3 X102.496 Y99.685 I-1.656 J-.338 E.02065
G1 X102.464 Y100.464 E.01881
G3 X102.744 Y101.935 I-1.458 J1.041 E.03727
G3 X102.342 Y102.917 I-.704 J.284 E.02831
G2 X101.704 Y103.029 I-.087 J1.368 E.01577
G3 X99.767 Y102.35 I-.502 J-1.667 E.05292
G1 X99.384 Y102.164 E.01029
G1 X98.7 Y102.138 E.01651
G1 X98.239 Y102.32 E.01195
G3 X97.01 Y102.491 I-.64 J-.093 E.04013
G1 X96.885 Y102.101 E.00987
G1 X96.261 Y101.741 E.01738
G1 X95.513 Y102.38 E.02374
M73 P29 R8
G3 X94.439 Y102.927 I-.779 J-.202 E.03282
G3 X92.705 Y102.982 I-.927 J-1.85 E.04318
G3 X91.789 Y102.519 I-.227 J-.689 E.02751
G2 X91.739 Y100.827 I-4.886 J-.704 E.04103
G1 X90.813 Y101.171 E.02382
G1 X90.241 Y101.676 E.0184
G3 X89.674 Y102.766 I-1.202 J.068 E.03111
G3 X88.846 Y102.166 I-.155 J-.658 E.02797
G1 X88.811 Y101.49 E.01633
G1 X88.068 Y100.921 E.02258
G1 X87.553 Y100.939 E.01242
G1 X86.899 Y101.518 E.02107
G3 X86.567 Y102.625 I-4.13 J-.636 E.02796
G3 X84.198 Y102.91 I-1.358 J-1.299 E.06235
G3 X83.588 Y101.871 I-.06 J-.663 E.0363
G3 X83.624 Y101.077 I2.865 J-.268 E.01924
G2 X83.06 Y100.392 I-.865 J.138 E.02244
G1 X82.261 Y100.205 E.01978
G1 X81.74 Y100.638 E.01634
G1 X81.554 Y101.351 E.01779
G3 X80.913 Y102.696 I-.981 J.358 E.03999
G3 X80.28 Y102.283 I.095 J-.838 E.01889
G2 X79.113 Y102.278 I-.593 J2.226 E.02845
G3 X77.955 Y102.769 I-.918 J-.554 E.03243
G3 X77.811 Y101.688 I.455 J-.611 E.02932
G2 X78.562 Y100.971 I-5.159 J-6.149 E.02505
G1 X78.61 Y100.156 E.01969
G3 X78.373 Y98.939 I1.404 J-.905 E.03063
G3 X78.368 Y98.376 I.621 J-.287 E.01399
G1 X78.846 Y97.761 E.01879
G1 X78.307 Y97.32 E.01679
G1 X78.098 Y96.728 E.01513
G3 X77.359 Y95.969 I.857 J-1.574 E.02595
G3 X77.588 Y94.682 I3.244 J-.086 E.03174
G3 X78.128 Y93.795 I1.356 J.217 E.02569
G1 X78.085 Y93.178 E.0149
G1 X77.726 Y92.564 E.01716
G3 X77.312 Y91.45 I.682 J-.887 E.0302
G3 X77.679 Y90.661 I1.391 J.167 E.02135
G1 X77.878 Y89.942 E.01797
G3 X77.879 Y88.37 I2.045 J-.784 E.03879
G1 X77.837 Y87.686 E.01652
G3 X77.547 Y86.311 I1.03 J-.936 E.03554
G2 X77.322 Y85.253 I-4.001 J.296 E.02616
G3 X77.744 Y84.23 I1.03 J-.174 E.02813
G3 X78.778 Y83.395 I1.966 J1.378 E.03247
G1 X78.782 Y82.338 E.0255
G3 X78.179 Y81.266 I1.084 J-1.315 E.03033
G3 X79.479 Y80.092 I1.218 J.042 E.04714
G2 X80.013 Y79.579 I-.069 J-.606 E.01918
G2 X79.868 Y78.374 I-1.849 J-.389 E.02979
G3 X80.187 Y77.211 I.888 J-.382 E.03141
G3 X81.136 Y78.256 I.174 J.796 E.04117
G1 X80.871 Y78.955 E.01805
G1 X81.886 Y79.548 E.02834
G3 X82.508 Y79.488 I.499 J1.883 E.01515
G1 X82.967 Y79.226 E.01273
G1 X83.288 Y78.453 E.0202
G3 X84.609 Y76.48 I1.397 J-.494 E.0664
G1 X84.97 Y76.228 E.01063
G3 X86.649 Y77.364 I-.12 J1.986 E.05128
G2 X88.124 Y77.112 I.47 J-1.69 E.03727
G3 X89.162 Y76.935 I.797 J1.532 E.02582
G1 X90.127 Y77.228 E.02432
G2 X90.636 Y75.713 I-7.32 J-3.303 E.0386
G3 X92.968 Y74.174 I2.285 J.926 E.07163
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.4 Y73.795 F42000
G1 F9000
M204 S6000
G3 X95.389 Y75.713 I-.726 J2.742 E.06959
G2 X95.695 Y76.55 I40.006 J-14.194 E.02148
G1 X96.148 Y76.867 E.01334
G3 X97.309 Y77.601 I.121 J1.094 E.03576
G1 X97.533 Y77.77 E.00677
G1 X98.081 Y77.782 E.01321
G3 X99.187 Y77.491 I1.055 J1.769 E.02794
G3 X100.573 Y77.729 I.549 J.958 E.03678
G1 X101.122 Y77.593 E.01364
G3 X102.959 Y77.467 I.971 J.705 E.05061
G3 X103.033 Y78.657 I-.935 J.656 E.03027
G3 X102.961 Y80.495 I-1.954 J.843 E.04587
G3 X102.199 Y81.607 I-1.714 J-.359 E.03335
G1 X102.124 Y81.807 E.00517
G1 X102.305 Y82.389 E.01469
G3 X102.641 Y85.339 I-.888 J1.595 E.08359
G3 X102.068 Y85.698 I-1.16 J-1.215 E.01643
G1 X102.036 Y86.007 E.00749
G1 X102.311 Y86.526 E.01419
G3 X102.914 Y86.917 I-.276 J1.088 E.01765
G3 X102.447 Y90.131 I-1.626 J1.405 E.0888
G3 X99.731 Y89.602 I-1.062 J-1.786 E.07304
G2 X98.546 Y89.504 I-.708 J1.354 E.02943
G3 X96.891 Y87.957 I-.019 J-1.639 E.06034
G2 X96.056 Y87.311 I-1.093 J.55 E.02633
G3 X94.512 Y84.72 I.963 J-2.329 E.07797
G1 X94.358 Y84.506 E.00635
G1 X93.874 Y84.265 E.01305
G3 X92.26 Y83.932 I-.392 J-2.179 E.0407
G1 X91.76 Y83.868 E.01217
G3 X90.795 Y83.974 I-.767 J-2.541 E.02354
G2 X90.49 Y84.709 I.472 J.627 E.02012
G2 X90.749 Y84.897 I.314 J-.159 E.00802
G1 X91.253 Y84.967 E.01227
G3 X93.957 Y86.74 I.997 J1.428 E.09994
G2 X94.82 Y87.648 I21.713 J-19.78 E.03021
G3 X95.253 Y88.644 I-2.097 J1.503 E.02639
G2 X96.089 Y89.032 I.941 J-.931 E.0227
G3 X97.1 Y89.937 I-.74 J1.844 E.03338
G2 X98.592 Y90.137 I18.463 J-132.246 E.03632
G3 X100.177 Y91.722 I-.73 J2.314 E.0562
G1 X100.478 Y91.757 E.0073
G2 X101.262 Y91.285 I-.12 J-1.085 E.02277
G3 X102.861 Y91.162 I.912 J1.408 E.04032
G3 X102.814 Y93.086 I-.808 J.943 E.05309
G2 X102.177 Y93.962 I.161 J.787 E.02867
G2 X102.428 Y94.882 I3.006 J-.324 E.02309
G3 X101.979 Y96.058 I-1.011 J.287 E.03254
G1 X101.903 Y96.319 E.00656
G1 X102.154 Y96.835 E.01383
G3 X103.119 Y97.613 I-.363 J1.437 E.03084
G3 X103.33 Y98.585 I-14.845 J3.742 E.02398
G3 X102.91 Y99.819 I-2.475 J-.153 E.03182
G1 X102.888 Y100.359 E.01302
G3 X103.169 Y101.951 I-1.809 J1.14 E.03999
G3 X102.038 Y103.344 I-1.035 J.315 E.051
G3 X99.522 Y102.698 I-.852 J-1.903 E.06765
G2 X98.552 Y102.647 I-.542 J1.083 E.02409
G3 X96.534 Y102.384 I-.977 J-.378 E.06725
G1 X96.308 Y102.253 E.0063
G2 X95.667 Y102.984 I.612 J1.184 E.024
G3 X94.481 Y103.356 I-.887 J-.75 E.03163
G3 X92.644 Y103.403 I-.975 J-2.148 E.04552
G3 X91.446 Y101.943 I-.247 J-1.019 E.05669
G1 X91.384 Y101.407 E.01303
G2 X90.632 Y101.891 I.252 J1.217 E.02206
G3 X89.26 Y103.212 I-1.256 J.069 E.05212
G3 X88.429 Y102.239 I.378 J-1.163 E.03245
G1 X88.402 Y101.706 E.01288
G1 X87.932 Y101.346 E.01427
G1 X87.719 Y101.353 E.00515
G1 X87.291 Y101.732 E.01377
G3 X86.863 Y102.926 I-3.358 J-.531 E.03078
G3 X84.093 Y103.326 I-1.642 J-1.584 E.07265
G3 X83.165 Y101.813 I.025 J-1.057 E.05079
G3 X83.196 Y101.145 I2.412 J-.221 E.01619
G2 X82.88 Y100.781 I-.467 J.087 E.01218
G1 X82.369 Y100.661 E.01266
G1 X82.112 Y100.874 E.00804
G2 X82.025 Y101.812 I1.197 J.585 E.02322
G3 X80.649 Y103.101 I-1.28 J.012 E.05108
G3 X80.031 Y102.667 I.353 J-1.159 E.01851
G2 X79.314 Y102.682 I-.33 J1.378 E.01751
G3 X77.341 Y102.755 I-1.011 J-.62 E.05625
G3 X77.988 Y100.989 I1.257 J-.541 E.05001
G1 X78.151 Y100.803 E.00597
G1 X78.184 Y100.251 E.01331
G3 X77.947 Y98.977 I1.586 J-.954 E.03194
G3 X78.263 Y97.826 I.995 J-.345 E.03059
G1 X77.928 Y97.552 E.01045
G1 X77.749 Y97 E.014
G3 X76.968 Y95.298 I.659 J-1.333 E.04885
G3 X77.696 Y93.634 I3.09 J.362 E.04443
G2 X77.279 Y92.769 I-1.152 J.022 E.0239
G3 X77.296 Y90.472 I1.475 J-1.138 E.0597
G1 X77.436 Y89.962 E.01274
G3 X77.456 Y88.326 I2.331 J-.791 E.04023
G2 X77.172 Y87.415 I-.979 J-.195 E.02398
G3 X77.121 Y86.289 I1.607 J-.637 E.02769
G2 X76.901 Y85.284 I-5.4 J.657 E.02486
G3 X77.439 Y83.939 I1.433 J-.207 E.03658
G3 X78.359 Y83.154 I1.977 J1.385 E.02947
G1 X78.361 Y82.506 E.01563
G3 X79.362 Y79.68 I.998 J-1.236 E.09441
G2 X79.649 Y79.253 I-.14 J-.405 E.01333
G2 X79.38 Y78.057 I-9.678 J1.553 E.02959
G3 X81.385 Y77.312 I1.058 J-.224 E.07426
G3 X81.39 Y78.772 I-1.28 J.734 E.03683
G1 X81.963 Y79.107 E.01601
G2 X82.634 Y78.933 I-.009 J-1.413 E.0169
G1 X82.849 Y78.416 E.01349
G3 X84.428 Y76.094 I1.8 J-.474 E.07674
G3 X85.137 Y75.807 I.613 J.496 E.01925
G3 X86.886 Y76.977 I-.249 J2.265 E.05276
G2 X87.914 Y76.745 I.261 J-1.241 E.02621
G3 X89.872 Y76.711 I1.013 J1.937 E.04897
G2 X90.243 Y75.556 I-5.589 J-2.432 E.0293
G3 X93.343 Y73.789 I2.679 J1.097 E.09271
M106 S124.95
; WIPE_START
G1 X94.125 Y74.071 E-.31596
G1 X94.261 Y74.171 E-.06404
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.078 J-1.214 P1  F42000
G1 X76.982 Y75.275 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1409
M204 S5000
G3 X78.053 Y75.06 I1.086 J2.634 E.02651
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.926 Y75.298 I1.422 J2.469 E.00759
; WIPE_START
G1 F12000
M204 S6000
G1 X77.374 Y75.143 E-.17981
G1 X77.71 Y75.082 E-.13015
G1 X77.894 Y75.07 E-.07004
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-.012 J1.217 P1  F42000
G1 X103.144 Y75.329 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F1409
M204 S5000
G3 X103.356 Y75.441 I-1.201 J2.54 E.00577
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X103.09 Y75.304 I-.144 J2.806 E.02501
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.11371
G1 X102.655 Y75.441 E-.26629
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.215 J.072 P1  F42000
G1 X104.33 Y103.605 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F1409
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.411 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.361 Y103.554 I-2.806 J-.003 E.03554
; WIPE_START
G1 F12000
M204 S6000
M73 P30 R8
G1 X104.334 Y103.16 E-.14986
G1 X104.36 Y102.957 E-.07768
G1 X104.36 Y102.556 E-.15246
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F1409
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.573 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.041 J-2.948 E.03552
G1 X103.354 Y104.56 E.64408
G1 X103.318 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.952 Y104.753 E-.1535
G1 X102.628 Y104.856 E-.12923
G1 X102.376 Y104.902 E-.09727
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F1409
M204 S5000
G3 X75.26 Y102.147 I2.395 J-1.461 E.03698
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.447 I2.844 J.015 E.03551
G1 X75.64 Y102.957 E.6393
G3 X75.672 Y103.545 I-3.928 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.0944
G1 X75.38 Y102.96 E-.15595
G1 X75.302 Y102.629 E-.12928
G1 X75.302 Y102.628 E-.00038
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 12/30
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G1 X76.954 Y77.55 F42000
G1 Z1.96
G1 E.4 F1800
; FEATURE: Support
G1 F1517
M204 S6000
G3 X77.611 Y77.15 I.631 J.297 E.01964
G1 X77.7 Y76.739 E.01013
G3 X78.652 Y77.888 I-.088 J1.042 E.04007
G3 X76.601 Y78.373 I-1.065 J.074 E.07255
G3 X77.643 Y76.726 I.998 J-.522 E.05683
; WIPE_START
G1 F9000
G1 X77.951 Y76.798 E-.11995
G1 X78.302 Y76.975 E-.1495
G1 X78.447 Y77.228 E-.11055
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-.27 J1.187 P1  F42000
G1 X79.83 Y77.543 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.467 Y77.127 I.576 J.187 E.01982
G1 X80.573 Y76.72 E.01013
G3 X80.629 Y79.167 I-.282 J1.23 E.08051
G3 X79.365 Y77.953 I-.032 J-1.232 E.04702
G3 X80.517 Y76.705 I1.103 J-.137 E.0466
M106 S124.95
M106 S127.5
; WIPE_START
G1 X81.047 Y76.897 E-.21444
G1 X81.279 Y77.115 E-.12089
G1 X81.331 Y77.221 E-.04466
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-1.164 J-.355 P1  F42000
G1 X79.586 Y82.94 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X80.527 Y82.474 E.02531
G1 X81.238 Y82.845 E.01934
G1 X81.574 Y83.22 E.01214
G1 X81.622 Y83.851 E.01526
G2 X81.056 Y84.41 I.604 J1.178 E.01949
G1 X79.952 Y84.682 E.0274
G1 X79.483 Y83.891 E.02218
G1 X79.534 Y82.965 E.02235
M106 S124.95
M106 S127.5
M204 S10000
G1 X79.94 Y83.233 F42000
G1 F9000
M204 S6000
G1 X80.522 Y82.945 E.01565
G3 X81.166 Y83.394 I-.273 J1.08 E.01934
G1 X81.187 Y83.665 E.00656
G3 X80.155 Y84.199 I-1.109 J-.877 E.02888
G1 X79.91 Y83.786 E.01158
G1 X79.937 Y83.291 E.01196
M106 S124.95
M106 S127.5
M204 S10000
G1 X83.605 Y82.276 F42000
G1 F9000
M204 S6000
G1 X84.111 Y81.628 E.01984
G1 X85.26 Y82.737 E.0385
G2 X85.179 Y84.757 I1.263 J1.062 E.05247
G3 X85.206 Y86.015 I-1.488 J.661 E.03115
G1 X84.671 Y86.194 E.0136
G1 X83.403 Y86.305 E.03068
G1 X83.558 Y85.203 E.02683
G2 X83.081 Y84.155 I-1.362 J-.012 E.02867
G3 X82.813 Y82.86 I1.306 J-.946 E.03287
G2 X83.57 Y82.322 I-1.477 J-2.88 E.02247
M106 S124.95
M106 S127.5
M204 S10000
G1 X83.88 Y82.606 F42000
G1 F9000
M204 S6000
G1 X84.155 Y82.254 E.01078
G1 X84.739 Y82.818 E.01959
G2 X84.782 Y84.906 I1.47 J1.014 E.05379
G3 X84.836 Y85.696 I-.916 J.458 E.01959
G3 X83.893 Y85.84 I-.773 J-1.894 E.02322
G2 X83.432 Y83.909 I-1.835 J-.583 E.05032
G3 X83.231 Y83.094 I.805 J-.63 E.02084
M73 P31 R8
G2 X83.838 Y82.646 I-1.469 J-2.625 E.01826
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.155 Y82.254 E-.19163
G1 X84.512 Y82.598 E-.18837
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-1.071 J-.577 P1  F42000
G1 X82.384 Y86.546 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X83.063 Y86.383 E.01683
G1 X83.631 Y87.353 E.02711
G2 X83.792 Y88.936 I1.885 J.607 E.03948
G1 X83.699 Y89.999 E.02574
G1 X82.752 Y90.155 E.02314
G3 X81.904 Y89.743 I.043 J-1.167 E.02341
G2 X81.27 Y87.754 I-2.949 J-.155 E.05145
G1 X81.462 Y86.566 E.02903
G1 X82.328 Y86.559 E.02087
M106 S124.95
M106 S127.5
M204 S10000
G1 X82.379 Y86.979 F42000
G1 F9000
M204 S6000
G1 X82.858 Y86.864 E.01187
G1 X83.187 Y87.426 E.01571
G2 X83.364 Y89.009 I2.037 J.573 E.03938
G1 X83.309 Y89.638 E.01522
G3 X82.498 Y89.664 I-.438 J-.967 E.02008
G1 X82.318 Y89.528 E.00546
G2 X81.711 Y87.655 I-3.157 J-.013 E.04828
G1 X81.82 Y86.983 E.01642
G1 X82.321 Y86.979 E.01208
M106 S124.95
M106 S127.5
M204 S10000
G1 X87.287 Y87.085 F42000
G1 F9000
M204 S6000
G1 X87.735 Y85.954 E.02935
G1 X88.648 Y86.323 E.02375
G2 X89.603 Y86.152 I.259 J-1.305 E.02394
G3 X91.122 Y86.567 I.5 J1.156 E.04101
G1 X90.931 Y87.431 E.02134
G3 X90.274 Y88.07 I-1.339 J-.719 E.02246
G2 X88.645 Y88.128 I-.779 J1.006 E.04264
G1 X87.884 Y88.013 E.01857
G1 X87.469 Y87.798 E.01128
G1 X87.265 Y87.139 E.01664
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.634 Y86.209 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-.2 J1.2 P1  F42000
G1 X89.722 Y86.557 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.461 Y86.526 I.411 J.944 E.01824
G1 X90.66 Y86.711 E.00655
G1 X90.539 Y87.256 E.01346
G3 X90.226 Y87.582 I-.672 J-.332 E.01108
G2 X88.546 Y87.689 I-.762 J1.278 E.04315
G3 X87.818 Y87.506 I-.094 J-1.165 E.01843
G1 X87.71 Y87.156 E.00883
G1 X87.97 Y86.501 E.01698
G2 X89.669 Y86.58 I.918 J-1.448 E.04292
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.198 Y86.474 E-.20492
G1 X90.461 Y86.526 E-.10201
G1 X90.602 Y86.657 E-.07308
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-1.202 J-.189 P1  F42000
G1 X90.091 Y89.916 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.379 Y89.698 E.00873
G1 X91.37 Y90.15 E.02626
G1 X91.548 Y90.833 E.01702
G1 X91.464 Y91.429 E.01451
G2 X90.31 Y92.394 I1.296 J2.723 E.03668
G3 X89.696 Y93.33 I-1.667 J-.425 E.02749
G1 X88.647 Y93.872 E.02849
G1 X88.554 Y92.662 E.02927
G2 X88.697 Y91.237 I-2.077 J-.927 E.03513
G1 X88.86 Y90.568 E.01662
G1 X89.221 Y90.164 E.01307
G2 X90.045 Y89.951 I.002 J-1.695 E.02072
M106 S124.95
M106 S127.5
M204 S10000
G1 X90.259 Y90.316 F42000
G1 F9000
M204 S6000
G1 X90.433 Y90.184 E.00526
G1 X91.014 Y90.449 E.01539
G3 X91.075 Y91.183 I-.852 J.44 E.01821
G2 X89.761 Y92.623 I1.25 J2.46 E.04805
G3 X89.017 Y93.208 I-1.127 J-.667 E.02335
G3 X89.132 Y92.252 I1.203 J-.34 E.02385
G2 X89.122 Y91.264 I-2.251 J-.471 E.02399
G1 X89.243 Y90.769 E.01229
G1 X89.436 Y90.554 E.00696
G2 X90.206 Y90.339 I-.029 J-1.595 E.01951
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.06 Y91.082 F42000
G1 F9000
M204 S6000
G1 X94.105 Y90.613 E.02761
G2 X94.541 Y91.44 I3.166 J-1.14 E.02262
G2 X95.457 Y91.958 I1.218 J-1.088 E.02585
G3 X96.22 Y93.372 I-1.31 J1.62 E.03979
G1 X95.859 Y94.324 E.02455
G2 X94.116 Y95.057 I-.13 J2.129 E.04725
G1 X93.477 Y95.281 E.01632
G1 X92.59 Y95.224 E.02143
G1 X92.672 Y93.757 E.03543
G1 X93.31 Y93.653 E.01559
G1 X93.42 Y93.587 E.00309
G2 X93.366 Y92.014 I-1.135 J-.748 E.04046
G1 X93.008 Y91.106 E.02355
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.545 Y91.325 F42000
G1 F9000
M204 S6000
G1 X93.911 Y91.16 E.00967
G2 X95.222 Y92.323 I1.736 J-.637 E.04402
G3 X95.779 Y93.352 I-.909 J1.157 E.02902
G1 X95.559 Y93.929 E.01488
G2 X93.896 Y94.689 I-.01 J2.179 E.0455
G3 X93.033 Y94.831 I-.599 J-.947 E.02168
G1 X93.073 Y94.117 E.01725
G2 X94.001 Y93.329 I-.021 J-.966 E.03177
G2 X93.745 Y91.831 I-1.992 J-.431 E.03757
G1 X93.567 Y91.379 E.01173
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.911 Y91.16 E-.15499
G1 X94.199 Y91.678 E-.22501
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-.986 J.713 P1  F42000
G1 X97.45 Y96.175 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X98.219 Y95.817 E.02045
G2 X99.407 Y95.912 I.7 J-1.281 E.02961
G2 X100.092 Y96.17 I.843 J-1.198 E.01785
G1 X100.793 Y97.106 E.02818
G2 X99.968 Y98.122 I1.6 J2.141 E.03188
G1 X99.148 Y98.553 E.02234
G2 X97.558 Y98.127 I-1.446 J2.221 E.04036
G1 X96.627 Y97.296 E.03011
G1 X97.398 Y96.199 E.03233
M106 S124.95
M106 S127.5
M204 S10000
G1 X97.677 Y96.533 F42000
G1 F9000
M204 S6000
G1 X98.245 Y96.268 E.01512
G2 X99.342 Y96.352 I.658 J-1.394 E.02714
G2 X99.848 Y96.545 I.627 J-.884 E.0132
G1 X100.243 Y97.072 E.01586
G2 X99.665 Y97.807 I1.168 J1.512 E.02278
G1 X99.146 Y98.08 E.01415
G2 X97.725 Y97.713 I-1.363 J2.345 E.03583
G1 X97.185 Y97.232 E.01744
G1 X97.643 Y96.58 E.01921
M106 S124.95
M106 S127.5
M204 S10000
G1 X87.756 Y96.104 F42000
G1 F1517
M204 S6000
G1 X88.047 Y95.919 E.00831
G1 X88.69 Y96.356 E.01874
G3 X88.192 Y96.707 I-.499 J-.179 E.01565
G3 X87.781 Y96.156 I.553 J-.84 E.01692
M204 S10000
G1 X87.268 Y95.917 F42000
G1 F9000
M204 S6000
G1 X88.055 Y95.416 E.0225
G1 X89.29 Y96.257 E.03603
G1 X88.756 Y96.966 E.02141
G1 X88.077 Y97.186 E.0172
G3 X87.219 Y95.948 I1.273 J-1.8 E.03707
M106 S124.95
M106 S127.5
M204 S10000
G1 X84.274 Y97.583 F42000
G1 F9000
M204 S6000
G1 X84.849 Y97.242 E.01611
G1 X85.11 Y97.31 E.0065
G1 X85.461 Y97.743 E.01346
G3 X85.31 Y98.529 I-1.145 J.186 E.0197
G3 X85.016 Y99.608 I-1.563 J.155 E.02759
G1 X84.735 Y99.658 E.0069
G1 X84.158 Y99.356 E.0157
G2 X84.29 Y97.638 I-2.078 J-1.023 E.04255
M106 S124.95
M106 S127.5
M204 S10000
G1 X83.83 Y97.357 F42000
G1 F9000
M204 S6000
G1 X84.785 Y96.792 E.02675
G1 X85.348 Y96.938 E.01404
G1 X85.875 Y97.585 E.02012
G3 X85.724 Y98.61 I-1.47 J.308 E.0255
G1 X85.674 Y99.21 E.01452
G1 X85.302 Y99.984 E.02071
G1 X84.666 Y100.097 E.01555
G1 X83.64 Y99.558 E.02797
G2 X83.781 Y97.387 I-2.186 J-1.232 E.05426
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.641 Y96.877 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I.418 J-1.143 P1  F42000
G1 X80.485 Y95.356 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X80.841 Y94.828 E.01535
G2 X82.863 Y94.847 I1.03 J-2.032 E.05052
G1 X83.396 Y95.154 E.01484
G1 X83.425 Y95.367 E.00517
G3 X83.089 Y96.087 I-.983 J-.02 E.01972
G1 X82.898 Y96.136 E.00476
G2 X81.162 Y96.201 I-.787 J2.209 E.04293
G1 X80.627 Y96.094 E.01316
G1 X80.396 Y95.854 E.00804
G1 X80.475 Y95.413 E.0108
M106 S124.95
M106 S127.5
M204 S10000
G1 X80.12 Y95.147 F42000
G1 F9000
M204 S6000
G1 X80.685 Y94.306 E.02443
G2 X82.908 Y94.389 I1.181 J-1.834 E.05628
G1 X83.784 Y94.893 E.02438
G1 X83.853 Y95.398 E.01229
G1 X83.662 Y96.057 E.01654
G1 X83.325 Y96.459 E.01266
G1 X82.905 Y96.568 E.01047
G2 X81.198 Y96.636 I-.775 J2.026 E.04235
G1 X80.415 Y96.481 E.01924
G1 X79.944 Y95.99 E.01639
G1 X80.088 Y95.195 E.01949
M106 S124.95
M106 S127.5
M204 S10000
G1 X90.857 Y78.252 F42000
G1 F9000
M204 S6000
G1 X91.191 Y78.215 E.00811
G1 X91.36 Y78.706 E.01253
G1 X91.564 Y78.516 E.00672
G2 X93.306 Y78.838 I1.414 J-2.781 E.04331
G1 X93.794 Y79.091 E.01327
G1 X93.939 Y79.387 E.00794
G1 X93.684 Y79.907 E.01395
G2 X92.895 Y80.001 I-.183 J1.813 E.01933
G3 X92.12 Y79.715 I-.081 J-.974 E.02057
G3 X90.953 Y79.199 I1.214 J-4.318 E.03089
G1 X90.781 Y78.94 E.00749
G1 X90.85 Y78.309 E.0153
M106 S124.95
M106 S127.5
M204 S10000
G1 X90.534 Y77.865 F42000
G1 F9000
M204 S6000
G1 X91.479 Y77.76 E.02293
G1 X91.577 Y78.046 E.0073
G2 X93.391 Y78.409 I1.402 J-2.294 E.04554
G1 X94.111 Y78.783 E.01955
G1 X94.406 Y79.387 E.01623
G1 X93.951 Y80.317 E.02497
G2 X92.911 Y80.431 I-.266 J2.385 E.02544
G1 X92.222 Y80.304 E.01688
G2 X91.221 Y79.874 I-1.234 J1.493 E.02665
G1 X90.651 Y79.503 E.0164
G1 X90.346 Y79.045 E.01326
G1 X90.476 Y77.871 E.02848
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.041 Y74.259 F42000
G1 F9000
M204 S6000
G3 X94.854 Y75.678 I-.246 J2.182 E.05844
G3 X95.244 Y76.494 I-.578 J.777 E.02268
G1 X95.5 Y76.859 E.01077
G2 X96.533 Y77.335 I3.165 J-5.508 E.02746
G3 X97.077 Y78.116 I-.887 J1.197 E.02335
G2 X98.516 Y78.082 I.679 J-1.724 E.03565
G2 X99.602 Y77.731 I-.848 J-4.474 E.0276
G3 X100.289 Y78.045 I-.234 J1.417 E.01843
G1 X100.703 Y78.136 E.01023
G1 X101.388 Y77.911 E.01737
G3 X102.549 Y77.553 I.814 J.576 E.03151
G3 X102.751 Y78.273 I-.563 J.546 E.0188
G1 X102.556 Y78.741 E.01223
G3 X102.573 Y80.07 I-1.525 J.684 E.03298
G3 X102.102 Y81.149 I-1.542 J-.031 E.02913
G1 X101.4 Y81.56 E.0196
G1 X101.936 Y82.721 E.03086
G1 X102.509 Y82.984 E.01518
G3 X102.728 Y83.554 I-.46 J.504 E.01527
G3 X102.091 Y85.188 I-1.355 J.414 E.04561
G1 X101.498 Y85.461 E.01574
G2 X102.484 Y86.994 I1.415 J.174 E.04768
G3 X102.753 Y87.561 I-.448 J.56 E.01566
G3 X100.014 Y89.153 I-1.366 J.801 E.12032
G2 X99.075 Y88.893 I-1.178 J2.433 E.02362
G3 X97.42 Y88.049 I-.605 J-.859 E.05497
G1 X97.521 Y87.263 E.01912
G3 X95.832 Y86.641 I3.359 J-11.73 E.04345
G3 X94.993 Y84.961 I1.104 J-1.601 E.04727
G1 X95.145 Y84.011 E.02321
G1 X94.064 Y83.735 E.0269
G3 X92.521 Y83.529 I-.486 J-2.249 E.03829
G1 X91.893 Y83.299 E.01612
G3 X90.267 Y83.43 I-1.017 J-2.47 E.04
G2 X89.811 Y84.627 I2.031 J1.457 E.03123
G1 X90.085 Y85.317 E.01789
G1 X90.546 Y85.513 E.01209
G1 X91.296 Y85.542 E.01811
G3 X93.509 Y86.839 I.967 J.887 E.08598
G1 X93.913 Y87.492 E.0185
G3 X94.816 Y88.957 I-1.282 J1.802 E.04265
G2 X95.969 Y89.465 I1.392 J-1.595 E.03083
G3 X96.786 Y90.247 I-.655 J1.503 E.02784
G1 X97.452 Y90.559 E.01774
G3 X99.631 Y91.688 I.367 J1.96 E.06376
G1 X99.874 Y92.492 E.02025
G2 X101.273 Y92.119 I.099 J-2.437 E.03546
G3 X102.653 Y91.453 I1.018 J.346 E.04114
G3 X102.882 Y92.133 I-.627 J.59 E.01784
G1 X102.908 Y92.359 E.00549
G3 X101.889 Y93.157 I-4.34 J-4.489 E.03127
G1 X101.686 Y93.937 E.01943
G3 X101.821 Y94.662 I-2.549 J.853 E.01786
G3 X101.863 Y95.666 I-.352 J.517 E.02811
G1 X101.533 Y95.837 E.00896
G1 X101.517 Y96.398 E.01354
G1 X101.764 Y97.132 E.01866
G2 X102.502 Y97.473 I2.915 J-5.334 E.01962
G3 X102.767 Y97.824 I-.167 J.402 E.01113
G3 X102.458 Y99.66 I-1.926 J.619 E.04664
G1 X102.395 Y100.447 E.01905
G3 X102.727 Y101.995 I-1.484 J1.128 E.03941
G3 X101.867 Y102.912 I-.55 J.346 E.04123
G3 X99.658 Y102.047 I-.675 J-1.53 E.06359
G1 X98.783 Y101.999 E.02114
G1 X98.309 Y102.212 E.01254
G3 X97.452 Y102.963 I-.883 J-.143 E.02979
G3 X97.032 Y102.604 I.243 J-.709 E.01364
G1 X96.625 Y101.397 E.0307
G1 X95.54 Y102.47 E.03681
G3 X94.401 Y102.882 I-.731 J-.242 E.03361
G3 X92.715 Y102.948 I-.932 J-2.221 E.04157
G3 X91.893 Y101.974 I-.362 J-.528 E.04543
G1 X91.89 Y101.38 E.01432
G1 X91.561 Y100.732 E.01752
G3 X90.702 Y99.642 I.685 J-1.424 E.03465
G1 X90.033 Y99.482 E.01658
G1 X89.359 Y99.77 E.0177
G1 X89.276 Y100.302 E.01298
G1 X89.536 Y101.082 E.01982
G3 X89.678 Y102.837 I-.38 J.914 E.05236
G3 X88.853 Y102.279 I-.163 J-.648 E.02711
G1 X88.834 Y101.394 E.02134
G1 X88.062 Y100.836 E.02298
G1 X87.282 Y100.871 E.01882
G1 X86.799 Y101.635 E.0218
G2 X86.701 Y102.413 I4.272 J.931 E.01894
G3 X84.721 Y103.115 I-1.548 J-1.222 E.05342
G2 X83.969 Y102.913 I-.707 J1.127 E.01907
G3 X83.614 Y101.836 I.063 J-.617 E.03445
G3 X83.76 Y100.803 I3.447 J-.039 E.02527
G1 X83.209 Y100.322 E.01765
G1 X82.544 Y100.142 E.01661
G1 X81.741 Y100.241 E.01951
G1 X81.385 Y101.226 E.02525
G3 X80.907 Y102.768 I-.817 J.592 E.04515
G3 X80.227 Y102.26 I.089 J-.827 E.02149
G1 X79.592 Y102.198 E.01538
G1 X78.929 Y102.453 E.01714
G3 X77.667 Y102.548 I-.662 J-.365 E.03617
G3 X77.955 Y101.564 I.74 J-.318 E.02682
G1 X78.505 Y101.249 E.01528
G1 X78.772 Y100.359 E.0224
G3 X78.388 Y99.099 I1.909 J-1.27 E.0322
G3 X78.576 Y97.996 I.701 J-.448 E.02961
G2 X78.088 Y96.669 I-1.364 J-.251 E.03577
G3 X77.557 Y96.159 I3.221 J-3.886 E.01777
G3 X77.586 Y95.049 I2.236 J-.499 E.02705
G3 X78.173 Y93.717 I1.526 J-.122 E.03658
G1 X77.906 Y92.76 E.02398
G3 X77.35 Y91.868 I.267 J-.786 E.02745
G3 X77.778 Y90.532 I1.454 J-.271 E.03523
G2 X77.824 Y89.238 I-1.692 J-.708 E.03191
G3 X78.089 Y88.041 I2.892 J.014 E.02981
G1 X77.747 Y87.601 E.01344
G2 X77.611 Y87.344 I-.391 J.042 E.00719
G3 X77.51 Y86.488 I1.08 J-.561 E.02123
G1 X77.769 Y85.841 E.01682
G3 X77.436 Y85.2 I.3 J-.563 E.01852
G3 X77.669 Y84.547 I.632 J-.142 E.01764
G3 X79.082 Y83.329 I1.954 J.839 E.04655
G1 X78.722 Y82.283 E.02668
M73 P32 R8
G3 X78.111 Y81.462 I1.367 J-1.656 E.0249
G3 X79.577 Y80.101 I1.314 J-.055 E.05481
G3 X80.33 Y80.076 I.425 J1.462 E.01837
G1 X80.97 Y80.145 E.0155
G3 X82.91 Y79.568 I1.607 J1.851 E.05033
G1 X83.345 Y78.622 E.02509
G3 X84.874 Y76.519 I1.364 J-.616 E.07598
G1 X85.202 Y76.316 E.0093
G3 X86.501 Y77.455 I-.291 J1.642 E.04379
G2 X87.642 Y77.493 I.669 J-2.918 E.02772
G3 X89.617 Y77.087 I1.27 J1.17 E.05192
G1 X90.124 Y76.953 E.01264
G1 X90.608 Y76.367 E.01833
G3 X92.984 Y74.253 I2.3 J.194 E.08459
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.2 Y73.853 F42000
G1 F9000
M204 S6000
G3 X95.212 Y75.443 I-.35 J2.511 E.06487
G3 X95.642 Y76.33 I-.784 J.928 E.02447
G2 X96.518 Y76.851 I1.078 J-.817 E.02518
G3 X97.367 Y77.763 I-.883 J1.674 E.03064
G2 X98.363 Y77.69 I.405 J-1.312 E.02465
G2 X99.459 Y77.332 I-.961 J-4.8 E.02786
G3 X100.454 Y77.652 I.125 J1.32 E.02589
G1 X100.681 Y77.701 E.00561
G2 X101.506 Y77.249 I-.119 J-1.195 E.02331
G3 X103.16 Y78.382 I.656 J.816 E.06454
G1 X102.996 Y78.777 E.01032
G3 X102.983 Y80.177 I-1.909 J.682 E.03447
G3 X101.941 Y81.73 I-1.689 J-.008 E.04778
G1 X102.252 Y82.404 E.01792
G3 X103.153 Y83.545 I-.197 J1.081 E.0383
G3 X101.933 Y85.723 I-1.791 J.428 E.06614
G2 X102.39 Y86.487 I.815 J.031 E.02269
G3 X103.155 Y87.426 I-.29 J1.018 E.03111
G3 X99.741 Y89.495 I-1.764 J.94 E.1461
G2 X99.109 Y89.33 I-.765 J1.644 E.01585
G3 X97.061 Y87.545 I-.635 J-1.338 E.08289
G3 X95.599 Y86.994 I2.408 J-8.596 E.03773
G3 X94.67 Y84.323 I1.334 J-1.961 E.07307
G1 X94.042 Y84.163 E.01562
G3 X92.36 Y83.917 I-.46 J-2.739 E.04167
G1 X91.889 Y83.745 E.0121
G3 X90.503 Y83.871 I-.921 J-2.453 E.03396
G2 X90.252 Y84.598 I1.246 J.837 E.01876
G1 X90.411 Y84.999 E.01041
G2 X91.169 Y85.117 I.533 J-.931 E.01892
G3 X93.945 Y86.745 I1.112 J1.284 E.10195
G1 X94.225 Y87.199 E.01286
G3 X95.168 Y88.678 I-1.379 J1.918 E.04333
G2 X96.115 Y89.069 I1.101 J-1.325 E.0251
G3 X97.066 Y89.914 I-.749 J1.798 E.03125
G2 X98.104 Y90.124 I.731 J-.942 E.02646
G3 X100.175 Y92.037 I-.256 J2.355 E.07282
G2 X100.97 Y91.793 I.005 J-1.4 E.02036
G3 X101.576 Y91.183 I1.05 J.436 E.02127
G3 X103.305 Y92.132 I.684 J.803 E.06146
G3 X103.275 Y92.58 I-.983 J.16 E.01094
G3 X102.26 Y93.402 I-3.635 J-3.458 E.03158
G1 X102.121 Y93.932 E.01323
G3 X102.219 Y94.469 I-1.888 J.621 E.01321
G3 X101.946 Y96.096 I-.67 J.724 E.04709
G2 X102.11 Y96.845 I1.104 J.151 E.01889
G2 X102.748 Y97.128 I95.825 J-215.304 E.01683
G3 X103.179 Y97.738 I-.489 J.803 E.01852
G3 X102.868 Y99.8 I-2.317 J.704 E.05199
G1 X102.825 Y100.342 E.0131
G3 X103.154 Y101.9 I-1.744 J1.182 E.03937
G3 X101.911 Y103.351 I-.938 J.455 E.0583
G3 X99.433 Y102.456 I-.721 J-1.881 E.06927
G1 X98.862 Y102.424 E.0138
G1 X98.626 Y102.53 E.00623
G3 X96.652 Y102.791 I-1.03 J-.192 E.06341
G1 X96.442 Y102.169 E.01585
G1 X95.881 Y102.723 E.01902
G3 X94.378 Y103.327 I-1.041 J-.418 E.04365
G3 X92.728 Y103.383 I-.907 J-2.372 E.04054
G3 X91.472 Y101.861 I-.397 J-.951 E.06349
G2 X90.858 Y100.753 I-1.136 J-.094 E.0324
G3 X90.396 Y100.001 I1.604 J-1.503 E.02144
G2 X89.738 Y100.064 I-.286 J.474 E.01708
G1 X89.707 Y100.265 E.0049
G1 X89.893 Y100.823 E.01418
G3 X89.539 Y103.302 I-.62 J1.176 E.07872
G3 X88.434 Y102.346 I-.01 J-1.104 E.03849
G1 X88.418 Y101.612 E.0177
G1 X87.934 Y101.262 E.01441
G1 X87.52 Y101.281 E.01001
G1 X87.21 Y101.771 E.01398
G2 X87.123 Y102.415 I3.404 J.788 E.0157
G3 X86.306 Y103.276 I-1.334 J-.447 E.02953
G3 X84.219 Y103.342 I-1.105 J-1.89 E.0525
G3 X83.202 Y101.69 I-.157 J-1.042 E.05943
G3 X83.298 Y100.957 I2.44 J-.052 E.01788
G2 X82.048 Y100.626 I-.91 J.911 E.03266
G1 X81.835 Y101.218 E.01516
G3 X80.954 Y103.191 I-1.241 J.629 E.05967
G3 X79.985 Y102.658 I-.105 J-.958 E.02842
G2 X79.009 Y102.979 I-.173 J1.117 E.02572
G3 X77.437 Y101.478 I-.767 J-.771 E.08102
G3 X78.151 Y100.967 I1.39 J1.19 E.02137
G1 X78.32 Y100.404 E.01417
G3 X77.964 Y99.161 I1.739 J-1.169 E.03169
G3 X78.168 Y97.838 I.884 J-.541 E.03509
G2 X77.502 Y96.744 I-1.249 J.01 E.03244
G1 X77.158 Y96.338 E.01283
G1 X77.058 Y95.616 E.01756
G3 X77.316 Y94.129 I7.567 J.545 E.03646
G3 X77.707 Y93.61 I1.568 J.775 E.01577
G1 X77.543 Y93.022 E.01472
G3 X76.93 Y91.887 I.403 J-.951 E.0336
G3 X77.385 Y90.361 I1.785 J-.299 E.03976
G2 X77.401 Y89.251 I-1.464 J-.576 E.02736
G3 X77.624 Y88.126 I2.702 J-.049 E.02786
G3 X77.276 Y85.944 I1.365 J-1.337 E.05682
G3 X77.078 Y85.559 I.081 J-.285 E.0117
G3 X77.156 Y84.466 I1.317 J-.455 E.02716
G2 X77.831 Y83.554 I-8.402 J-6.919 E.02738
G3 X78.563 Y83.11 I1.239 J1.22 E.02085
G2 X77.987 Y82.1 I-1.762 J.334 E.02855
G3 X77.693 Y81.225 I.819 J-.762 E.02294
G3 X79.522 Y79.683 I1.749 J.219 E.0634
G3 X80.858 Y79.71 I.614 J2.62 E.03256
G3 X82.644 Y79.141 I1.518 J1.676 E.04662
G1 X82.905 Y78.574 E.01506
G3 X84.744 Y76.105 I1.757 J-.61 E.08744
G3 X85.57 Y75.959 I.501 J.426 E.02193
G3 X86.797 Y77.074 I-.64 J1.937 E.04117
G2 X87.496 Y77.079 I.363 J-1.793 E.01694
G3 X89.625 Y76.65 I1.404 J1.472 E.05525
G1 X89.886 Y76.581 E.00651
G1 X90.225 Y76.17 E.01286
G3 X93.142 Y73.847 I2.7 J.397 E.099
M106 S124.95
; WIPE_START
G1 X93.793 Y73.996 E-.25366
G1 X94.074 Y74.174 E-.12634
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-.078 J-1.214 P1  F42000
G1 X76.983 Y75.274 Z2.36
G1 Z1.96
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1517
M204 S5000
G3 X78.053 Y75.06 I1.083 J2.631 E.02647
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.928 Y75.298 I1.421 J2.465 E.00763
; WIPE_START
G1 F12000
M204 S6000
G1 X77.373 Y75.143 E-.17909
G1 X77.714 Y75.081 E-.13152
G1 X77.896 Y75.07 E-.06939
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-.01 J1.217 P1  F42000
G1 X103.017 Y75.275 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F1517
M204 S5000
G3 X103.356 Y75.441 I-1.1 J2.682 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X102.961 Y75.253 I-.17 J2.894 E.02165
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16623
G1 X102.793 Y75.441 E-.21377
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F1517
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.41 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.021 E.03551
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14977
G1 X104.36 Y102.957 E-.07769
G1 X104.36 Y102.556 E-.15254
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F1517
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.014 J-2.846 E.03555
G1 X103.354 Y104.56 E.64408
M73 P33 R8
G1 X103.318 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.949 Y104.754 E-.15476
G1 X102.628 Y104.856 E-.12798
G1 X102.376 Y104.902 E-.09726
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F1517
M204 S5000
G3 X75.26 Y102.147 I2.462 J-1.479 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.8 J.001 E.03556
G1 X75.64 Y102.957 E.63934
G3 X75.672 Y103.545 I-3.925 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.0943
G1 X75.38 Y102.96 E-.15614
G1 X75.305 Y102.627 E-.12956
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 13/30
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G1 X76.967 Y77.572 F42000
G1 Z2.12
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X77.616 Y77.172 I.631 J.296 E.01945
G1 X77.712 Y76.763 E.01013
G3 X78.643 Y78.004 I-.106 J1.049 E.04203
G3 X76.499 Y77.874 I-1.073 J-.042 E.08251
G3 X77.656 Y76.748 I1.066 J-.062 E.04413
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.236 Y76.96 E-.23456
G1 X78.465 Y77.146 E-.11204
G1 X78.502 Y77.226 E-.0334
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I-.279 J1.185 P1  F42000
G1 X79.819 Y77.536 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F1627
M204 S6000
G3 X80.472 Y77.101 I.627 J.234 E.02022
G1 X80.538 Y76.686 E.01013
G3 X81.473 Y77.512 I-.088 J1.043 E.03225
G3 X80.191 Y79.033 I-1.052 J.415 E.05866
G3 X79.65 Y77.007 I.493 J-1.217 E.05856
G3 X80.48 Y76.677 I.852 J.933 E.02203
; WIPE_START
G1 F9000
G1 X80.815 Y76.732 E-.12894
G1 X81.096 Y76.877 E-.12015
G1 X81.287 Y77.106 E-.11326
G1 X81.307 Y77.148 E-.01765
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I-1.192 J-.244 P1  F42000
G1 X80.229 Y82.413 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X80.409 Y82.364 E.00451
G1 X81.171 Y82.513 E.01871
G1 X81.572 Y82.977 E.0148
G1 X81.788 Y83.749 E.01934
G1 X80.953 Y84.476 E.0267
G1 X79.879 Y84.681 E.02638
G1 X79.292 Y83.659 E.02841
G1 X79.433 Y82.821 E.02049
G1 X79.788 Y82.471 E.01201
G1 X80.173 Y82.428 E.00935
M106 S124.95
M106 S127.5
M204 S10000
G1 X80.252 Y82.841 F42000
G1 F9000
M204 S6000
G1 X80.424 Y82.795 E.00431
G1 X80.948 Y82.897 E.01287
G3 X81.312 Y83.606 I-.572 J.742 E.01986
G1 X80.763 Y84.084 E.01756
G1 X80.094 Y84.212 E.01643
G1 X79.731 Y83.58 E.01757
G1 X79.825 Y83.025 E.01358
G3 X80.194 Y82.848 I.298 J.147 E.01065
M106 S124.95
M106 S127.5
M204 S10000
G1 X83.551 Y82.233 F42000
G1 F9000
M204 S6000
G1 X83.894 Y81.741 E.01445
G1 X85.27 Y81.993 E.03372
G1 X85.185 Y82.925 E.02256
G2 X85.281 Y84.775 I1.135 J.869 E.0486
G1 X85.414 Y85.546 E.01886
G1 X85.165 Y86.108 E.01483
G1 X84.608 Y86.324 E.01441
G1 X83.765 Y86.077 E.02117
G1 X83.457 Y85.57 E.0143
G2 X82.823 Y83.968 I-1.437 J-.358 E.04435
G1 X82.538 Y82.924 E.0261
G2 X83.518 Y82.28 I-1.278 J-3.014 E.02844
M106 S124.95
M106 S127.5
M204 S10000
G1 X83.841 Y82.552 F42000
G1 F9000
M204 S6000
G1 X84.084 Y82.203 E.01025
G1 X84.817 Y82.337 E.01796
G3 X84.539 Y83.244 I-1.215 J.124 E.0235
G2 X84.887 Y84.959 I1.65 J.558 E.04421
G1 X84.978 Y85.492 E.01304
G3 X84.589 Y85.881 I-.389 J0 E.01474
G1 X84.04 Y85.72 E.01381
G3 X83.931 Y85.217 I.253 J-.317 E.01342
G2 X83.196 Y83.742 I-1.782 J-.034 E.04133
G1 X83.028 Y83.124 E.01545
G2 X83.8 Y82.592 I-1.239 J-2.628 E.0227
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.084 Y82.203 E-.1832
G1 X84.594 Y82.296 E-.1968
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I-.889 J-.831 P1  F42000
G1 X80.245 Y86.95 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X80.556 Y86.548 E.01225
G3 X81.516 Y86.82 I.149 J1.306 E.02468
G2 X82.611 Y86.885 I.661 J-1.875 E.02679
G3 X83.342 Y87.19 I-.144 J1.374 E.01938
G2 X83.481 Y89.023 I2.182 J.756 E.04559
G1 X83.435 Y89.556 E.0129
G3 X82.92 Y90.065 I-1.243 J-.744 E.01766
G1 X82.174 Y90.066 E.01798
G2 X82.028 Y88.461 I-1.783 J-.647 E.04014
G2 X81.158 Y87.3 I-2.278 J.799 E.03555
G1 X81.048 Y87.423 E.00398
G1 X80.478 Y87.5 E.01387
G1 X80.196 Y87.318 E.00808
G1 X80.238 Y87.007 E.00757
M106 S124.95
M106 S127.5
M204 S10000
G1 X79.879 Y86.736 F42000
G1 F9000
M204 S6000
G1 X80.368 Y86.106 E.01923
G1 X81.247 Y86.198 E.02132
G2 X82.631 Y86.453 I.945 J-1.248 E.03521
G3 X83.814 Y86.996 I-.317 J2.247 E.03182
G2 X83.909 Y88.946 I2.143 J.872 E.04859
G1 X83.844 Y89.708 E.01845
G3 X83.071 Y90.485 I-1.89 J-1.108 E.0267
G1 X81.662 Y90.487 E.03396
G1 X81.865 Y89.468 E.02506
G2 X81.17 Y87.83 I-2.959 J.288 E.04358
G1 X80.381 Y87.937 E.01919
G1 X79.745 Y87.527 E.01824
G1 X79.844 Y86.782 E.01813
M106 S124.95
M106 S127.5
M204 S10000
G1 X83.792 Y92.222 F42000
G1 F9000
M204 S6000
G1 X84.146 Y91.848 E.0124
G1 X85.567 Y92.062 E.03467
G1 X85.192 Y93.466 E.03504
G1 X84.264 Y93.425 E.02238
G1 X83.493 Y92.976 E.02152
G1 X83.752 Y92.264 E.01827
M106 S124.95
M106 S127.5
M204 S10000
G1 X84.117 Y92.489 F42000
G1 F9000
M204 S6000
G1 X84.3 Y92.296 E.00641
G1 X85.04 Y92.408 E.01805
G1 X84.873 Y93.031 E.01557
G3 X84.008 Y92.789 I-.202 J-.946 E.02253
G1 X84.097 Y92.544 E.00631
M106 S124.95
M106 S127.5
M204 S10000
G1 X82.571 Y94.878 F42000
G1 F9000
M204 S6000
G1 X82.956 Y94.696 E.01028
G1 X83.498 Y95.049 E.0156
G3 X83.414 Y96.095 I-2.018 J.364 E.02557
G1 X83.148 Y96.362 E.0091
G2 X80.246 Y97.098 I-1.047 J1.961 E.07919
G1 X79.859 Y97.42 E.01215
G2 X78.894 Y97.647 I-.008 J2.13 E.02411
G1 X78.754 Y97.266 E.00977
G1 X79.718 Y96.87 E.02515
G2 X80.182 Y96.091 I-.525 J-.841 E.0227
G2 X80.44 Y95.249 I-2.524 J-1.232 E.02132
M73 P34 R8
G1 X80.752 Y94.713 E.01496
G2 X82.515 Y94.894 I1.093 J-1.971 E.04393
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.956 Y94.696 E-.18366
G1 X83.389 Y94.978 E-.19634
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I-1.204 J.18 P1  F42000
G1 X83.764 Y97.494 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X84.341 Y96.418 E.02944
G2 X85.332 Y96.841 I1.497 J-2.137 E.02617
G1 X85.876 Y97.297 E.01712
G1 X86.13 Y97.864 E.015
G2 X85.791 Y99.282 I1.907 J1.206 E.03579
G1 X85.344 Y100.069 E.02183
G1 X84.606 Y100.158 E.01792
G3 X83.587 Y99.421 I.876 J-2.284 E.03067
G2 X83.736 Y97.545 I-1.902 J-1.096 E.04692
M106 S124.95
M106 S127.5
M204 S10000
G1 X84.188 Y97.591 F42000
G1 F9000
M204 S6000
G1 X84.52 Y96.972 E.01693
G3 X85.532 Y97.556 I-.873 J2.682 E.02839
G3 X85.525 Y98.154 I-.257 J.296 E.0164
G2 X85.37 Y99.172 I2.848 J.955 E.02494
G1 X85.083 Y99.678 E.01403
G1 X84.692 Y99.725 E.0095
G3 X84.077 Y99.312 I.469 J-1.363 E.01808
G2 X84.205 Y97.646 I-1.94 J-.987 E.04134
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.52 Y96.972 E-.2828
G1 X84.757 Y97.069 E-.09721
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I.47 J1.122 P1  F42000
G1 X88.024 Y95.7 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.944 Y95.702 I.454 J2.351 E.02233
G3 X88.465 Y96.957 I-1.305 J.22 E.03397
G3 X87.693 Y96.385 I.234 J-1.121 E.02389
G1 X87.692 Y96.086 E.00721
G1 X87.987 Y95.744 E.01089
M106 S124.95
M106 S127.5
M204 S10000
G1 X87.868 Y95.297 F42000
G1 F9000
M204 S6000
G3 X89.369 Y95.308 I.722 J3.84 E.03643
G1 X89.357 Y96.317 E.02432
G1 X89.103 Y96.957 E.01661
G1 X88.54 Y97.449 E.01803
G2 X87.821 Y97.203 I-.964 J1.644 E.01843
G1 X87.274 Y96.536 E.02081
G1 X87.271 Y95.931 E.0146
G1 X87.811 Y95.305 E.01993
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.294 Y95.241 E-.18512
G1 X88.805 Y95.273 E-.19489
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I1.17 J.335 P1  F42000
G1 X90.223 Y90.325 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.458 Y90.147 E.00712
G1 X91.036 Y90.283 E.01433
G1 X91.309 Y90.643 E.0109
G1 X91.249 Y91.25 E.0147
G2 X89.751 Y93 I.877 J2.266 E.05789
G1 X89.447 Y93.436 E.01281
G1 X89.096 Y93.553 E.00893
G1 X88.847 Y93.247 E.00952
G3 X89.06 Y92.243 I2.222 J-.053 E.02497
G2 X88.99 Y91.131 I-2.237 J-.418 E.02714
G1 X89.259 Y90.598 E.0144
G2 X90.169 Y90.347 I-1.042 J-5.564 E.0228
M106 S124.95
M106 S127.5
M204 S10000
G1 X90.057 Y89.923 F42000
G1 F9000
M204 S6000
G1 X90.362 Y89.693 E.00921
G1 X91.28 Y89.909 E.02275
G1 X91.743 Y90.521 E.01852
G1 X91.646 Y91.508 E.02392
G2 X90.548 Y92.252 I1.143 J2.867 E.03223
G2 X90.144 Y93.172 I1.786 J1.334 E.02444
G1 X89.712 Y93.79 E.01818
G1 X88.954 Y94.044 E.01929
G1 X88.413 Y93.379 E.02068
G3 X88.647 Y92.152 I2.702 J-.119 E.03039
G2 X88.536 Y91.099 I-1.865 J-.336 E.02588
G1 X88.964 Y90.249 E.02295
G2 X90.011 Y89.958 I-2.425 J-10.763 E.02621
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.955 Y91.861 F42000
G1 F9000
M204 S6000
G1 X94.788 Y91.671 E.0206
G2 X95.5 Y91.943 I1.054 J-1.691 E.01849
G1 X96.055 Y92.447 E.01807
G2 X96.33 Y93.297 I2.141 J-.224 E.0217
G1 X96.04 Y94.187 E.02258
G3 X95.186 Y94.446 I-.741 J-.906 E.02206
G2 X94.129 Y95.155 I.489 J1.874 E.03129
G3 X92.879 Y95.49 I-.99 J-1.193 E.03218
G1 X92.434 Y94.776 E.02029
G1 X92.503 Y93.792 E.0238
G2 X93.48 Y93.171 I-.505 J-1.874 E.02834
G2 X93.586 Y92.357 I-.975 J-.541 E.02028
G1 X93.899 Y91.874 E.01389
M106 S124.95
M106 S127.5
M204 S10000
G1 X94.159 Y92.245 F42000
G1 F9000
M204 S6000
G1 X94.728 Y92.116 E.01408
G2 X95.287 Y92.317 I.796 J-1.332 E.0144
G1 X95.679 Y92.673 E.01278
G2 X95.878 Y93.33 I1.646 J-.141 E.01666
G1 X95.694 Y93.893 E.01428
G3 X95.102 Y94.032 I-.465 J-.648 E.01504
G2 X93.878 Y94.812 I.555 J2.222 E.03563
G3 X93.105 Y95.058 I-.655 J-.719 E.02017
G1 X92.863 Y94.67 E.01105
G1 X92.905 Y94.062 E.01468
G2 X94.012 Y92.472 I-.336 J-1.414 E.05113
G1 X94.127 Y92.294 E.00513
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.728 Y92.116 E-.23815
G1 X95.079 Y92.242 E-.14185
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I-.989 J.709 P1  F42000
G1 X97.653 Y95.833 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X98.333 Y95.821 E.01642
G2 X98.804 Y95.976 I.563 J-.913 E.01206
G1 X99.572 Y95.958 E.01853
G1 X100.055 Y96.112 E.01222
G1 X100.581 Y96.74 E.01977
G1 X100.602 Y97.355 E.01484
G2 X100.022 Y98.223 I1.088 J1.356 E.02555
G1 X99.185 Y98.842 E.0251
G1 X98.517 Y98.372 E.01969
G2 X97.74 Y98.241 I-.604 J1.212 E.01928
G1 X97.124 Y97.988 E.01606
G3 X96.575 Y97.286 I1.292 J-1.575 E.02166
G2 X97.143 Y96.155 I-2.3 J-1.863 E.03075
G1 X97.595 Y95.834 E.01336
M106 S124.95
M106 S127.5
M204 S10000
G1 X97.732 Y96.251 F42000
G1 F9000
M204 S6000
G3 X98.78 Y96.397 I.099 J3.128 E.02563
G1 X99.511 Y96.379 E.01764
G1 X99.811 Y96.475 E.00758
G1 X100.166 Y96.899 E.01334
G1 X100.176 Y97.2 E.00725
G2 X99.656 Y97.971 I1.458 J1.546 E.02262
G1 X99.179 Y98.324 E.01431
G2 X97.825 Y97.822 I-1.311 J1.461 E.03565
G3 X97.074 Y97.287 I.184 J-1.053 E.023
G2 X97.492 Y96.422 I-1.766 J-1.388 E.02334
G1 X97.685 Y96.285 E.00571
M106 S124.95
M106 S127.5
M204 S10000
G1 X94.62 Y99.099 F42000
G1 F9000
M204 S6000
G1 X95.372 Y98.788 E.01964
G1 X95.941 Y100.137 E.03531
G1 X95.45 Y100.618 E.01658
G1 X94.383 Y101.041 E.02767
G1 X94.315 Y99.478 E.03773
G1 X94.567 Y99.122 E.01051
M106 S124.95
M106 S127.5
M204 S10000
G1 X94.839 Y99.463 F42000
G1 F1627
M204 S6000
G1 X95.148 Y99.336 E.00804
G1 X95.443 Y100.037 E.01835
G3 X94.777 Y100.433 I-.805 J-.596 E.0192
G1 X94.741 Y99.603 E.02003
G1 X94.806 Y99.51 E.00273
; WIPE_START
G1 F9000
G1 X95.148 Y99.336 E-.14584
G1 X95.387 Y99.903 E-.23416
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I1.19 J-.256 P1  F42000
G1 X90.782 Y78.498 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X91.395 Y78.306 E.01549
G2 X93.479 Y78.711 I1.529 J-2.301 E.05254
G1 X93.937 Y79.021 E.01333
G3 X94.059 Y79.387 I-.469 J.361 E.00948
G1 X93.915 Y80 E.0152
G3 X92.4 Y80.028 I-1.021 J-14.139 E.03656
G2 X91.13 Y79.532 I-1.474 J1.899 E.03333
M73 P34 R7
G1 X90.633 Y79.179 E.0147
G2 X90.776 Y78.555 I-1.281 J-.622 E.01557
M106 S124.95
M106 S127.5
M204 S10000
G1 X90.451 Y78.161 F42000
G1 F9000
M204 S6000
G1 X91.445 Y77.851 E.0251
G2 X93.576 Y78.27 I1.497 J-1.981 E.05423
G1 X94.254 Y78.728 E.01972
G3 X94.488 Y79.398 I-.853 J.674 E.01742
G1 X94.247 Y80.421 E.02536
G1 X93.292 Y80.418 E.02302
G3 X91.852 Y80.161 I-.495 J-1.39 E.03692
G2 X90.966 Y79.931 I-.982 J1.957 E.02224
G1 X90.131 Y79.338 E.02468
G2 X90.396 Y78.178 I-2.381 J-1.153 E.02893
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.058 Y74.353 F42000
G1 F9000
M204 S6000
G3 X94.725 Y75.612 I-.221 J2.027 E.0529
G3 X95.299 Y76.451 I-.358 J.86 E.02593
G2 X96.436 Y77.292 I1.525 J-.872 E.03509
G3 X96.957 Y78.048 I-.36 J.806 E.02328
G2 X98.081 Y78.357 I1.096 J-1.789 E.0285
G3 X99.194 Y78 I1.131 J1.617 E.02861
G1 X99.463 Y77.762 E.00866
G3 X100.343 Y78.113 I.076 J1.091 E.02363
G2 X101.436 Y77.962 I.266 J-2.112 E.02691
G3 X102.349 Y77.469 I.752 J.299 E.02718
G3 X102.57 Y78.601 I-.174 J.622 E.03443
G3 X102.509 Y79.928 I-4.465 J.458 E.03214
G3 X102.069 Y81.152 I-1.136 J.283 E.03326
G1 X101.454 Y81.521 E.01731
G1 X101.68 Y82.325 E.02013
G1 X102.208 Y82.802 E.01717
G3 X102.741 Y83.755 I-.062 J.66 E.03093
G3 X102.088 Y85.154 I-1.43 J.185 E.0393
G1 X101.492 Y85.457 E.01613
G1 X101.613 Y86.259 E.01956
G1 X102.09 Y86.797 E.01733
G3 X102.77 Y87.721 I-.244 J.892 E.02985
G3 X99.982 Y88.978 I-1.392 J.632 E.11606
G1 X99.141 Y88.875 E.02043
G3 X97.521 Y88.504 I-.633 J-.959 E.0448
G3 X97.41 Y88.055 I1.04 J-.495 E.01124
G1 X97.547 Y87.272 E.01917
G3 X95.845 Y86.551 I20.841 J-51.61 E.04458
G3 X95.207 Y84.236 I1.263 J-1.593 E.06194
G2 X93.392 Y83.731 I-1.332 J1.271 E.04769
G3 X92.504 Y83.425 I.236 J-2.127 E.02284
G1 X91.754 Y83.267 E.01848
G3 X89.364 Y82.31 I-.704 J-1.705 E.06872
G1 X88.349 Y82.451 E.02473
G1 X88.039 Y82.786 E.01099
G1 X86.873 Y83.62 E.03457
G1 X88.324 Y84.404 E.03976
G3 X89.856 Y85.018 I.481 J1.019 E.0447
G3 X88.065 Y85.636 I-.924 J.228 E.06792
G1 X87.911 Y85.092 E.01362
G1 X86.951 Y84.812 E.02412
G1 X86.069 Y85.208 E.0233
G1 X86.379 Y86.34 E.02831
G3 X87.373 Y87.868 I-1.205 J1.872 E.04529
G1 X87.781 Y88.111 E.01145
G1 X88.555 Y88.204 E.0188
G3 X89.71 Y87.875 I.972 J1.219 E.02972
G1 X90.465 Y88.161 E.01948
G1 X90.983 Y87.529 E.01973
G1 X91.128 Y86.836 E.01705
G3 X93.478 Y86.855 I1.179 J-.42 E.11598
G1 X93.828 Y87.544 E.01863
G3 X94.712 Y88.935 I-1.18 J1.726 E.04085
G1 X95.385 Y89.416 E.01994
G3 X96.744 Y90.213 I.095 J1.394 E.04037
G1 X97.33 Y90.669 E.01791
G3 X99.545 Y91.725 I.428 J1.955 E.06371
G1 X99.659 Y92.099 E.00943
G1 X99.74 Y93.128 E.02489
G1 X100.957 Y92.881 E.02996
G1 X101.405 Y92.215 E.01934
G3 X102.441 Y91.355 I.945 J.084 E.0361
G3 X102.822 Y92.348 I-.249 J.665 E.02899
G3 X102.09 Y92.95 I-.982 J-.448 E.02366
G1 X101.776 Y93.403 E.01329
G1 X101.662 Y94.074 E.01642
G2 X102.028 Y94.831 I.842 J.06 E.02121
G3 X101.68 Y95.801 I-.635 J.32 E.02779
G1 X101.44 Y96.279 E.0129
G2 X102.071 Y97.329 I2.308 J-.674 E.02987
G3 X102.767 Y98.205 I-.011 J.722 E.03085
G3 X102.451 Y99.611 I-1.586 J.383 E.03601
G1 X102.348 Y99.996 E.0096
G2 X102.65 Y101.073 I1.993 J.023 E.02735
G3 X102.688 Y101.857 I-2.251 J.502 E.01903
G3 X102.795 Y102.652 I-.778 J.509 E.01998
G3 X101.855 Y102.9 I-.599 J-.362 E.02591
G3 X99.795 Y102.133 I-.619 J-1.489 E.05835
G1 X99.293 Y101.942 E.01294
G1 X98.885 Y102.011 E.00996
G1 X98.25 Y102.384 E.01776
G3 X97.228 Y102.933 I-.715 J-.103 E.03252
G3 X96.831 Y102.37 I.943 J-1.086 E.01678
G2 X95.23 Y102.893 I-.391 J1.514 E.04291
G3 X94.555 Y102.941 I-.37 J-.441 E.01744
G3 X92.886 Y102.955 I-.954 J-14.379 E.04025
G3 X91.705 Y102.601 I-.419 J-.75 E.03318
G3 X91.948 Y101.863 I1.038 J-.067 E.01922
G2 X91.486 Y100.542 I-1.491 J-.22 E.03509
G3 X91.291 Y98.763 I.59 J-.965 E.04981
G1 X90.819 Y97.877 E.02421
G1 X89.953 Y97.515 E.02264
G1 X89.319 Y98.494 E.02812
G3 X88.952 Y100.168 I-2.014 J.436 E.04263
G1 X89.061 Y100.649 E.01189
G1 X89.498 Y101.258 E.01809
G3 X89.352 Y102.936 I-.168 J.831 E.05961
G3 X88.84 Y102.081 I.25 J-.731 E.02612
G1 X88.97 Y101.408 E.01652
G1 X88.145 Y100.691 E.02634
G3 X87.428 Y100.771 I-.56 J-1.786 E.01752
G1 X86.791 Y101.397 E.02153
G2 X86.725 Y102.322 I1.993 J.608 E.02255
G3 X86.035 Y102.875 I-.875 J-.385 E.02216
G3 X84.368 Y102.927 I-.883 J-1.53 E.04188
G3 X83.513 Y102.633 I-.222 J-.747 E.02328
G3 X83.653 Y101.659 I.9 J-.368 E.02488
G3 X83.819 Y100.906 I3.489 J.376 E.01863
G1 X83.697 Y100.465 E.01105
G2 X82.801 Y99.993 I-1.939 J2.595 E.02453
G3 X81.762 Y100.093 I-.788 J-2.74 E.02532
G2 X81.297 Y101.174 I2.494 J1.713 E.02856
G3 X81.235 Y102.681 I-1.017 J.713 E.03909
G3 X80.148 Y102.256 I-.346 J-.719 E.03159
G2 X79.008 Y102.329 I-.382 J2.977 E.02771
G3 X78.095 Y102.878 I-.894 J-.453 E.02708
G3 X77.91 Y101.625 I.13 J-.659 E.03984
G3 X78.799 Y101.351 I.939 J1.466 E.02271
G1 X78.785 Y100.265 E.0262
G3 X78.428 Y99.172 I1.412 J-1.066 E.02823
G3 X78.556 Y97.942 I.766 J-.542 E.03255
G1 X78.641 Y98.172 E.00591
G1 X79.575 Y97.865 E.02371
G1 X80.026 Y97.827 E.01091
G2 X81.139 Y96.795 I-22.978 J-25.91 E.03662
G3 X83.243 Y96.862 I.998 J1.731 E.05347
G1 X83.79 Y96.312 E.0187
G1 X83.982 Y95.607 E.01761
G3 X83.91 Y94.817 I2.568 J-.631 E.01921
G1 X82.988 Y94.216 E.02654
G3 X81.432 Y94.526 I-1.198 J-1.947 E.03909
G1 X80.569 Y94.192 E.02232
G1 X80.044 Y95.094 E.02518
G3 X79.667 Y96.384 I-8.743 J-1.858 E.03242
G1 X79.509 Y96.502 E.00475
G1 X78.427 Y96.947 E.02821
G2 X77.807 Y96.324 I-2.505 J1.876 E.02127
G3 X77.678 Y95.275 I2.129 J-.794 E.02571
G3 X77.999 Y93.875 I1.301 J-.438 E.03646
G2 X77.888 Y92.814 I-1.821 J-.346 E.02609
G3 X77.361 Y91.422 I.69 J-1.058 E.03839
G3 X77.993 Y90.409 I1.637 J.317 E.02946
G2 X77.921 Y89.207 I-4.547 J-.331 E.02912
G3 X78.183 Y88.638 I1.654 J.418 E.01519
G1 X78.036 Y87.792 E.02072
G3 X77.685 Y86.094 I.699 J-1.03 E.04625
G3 X77.553 Y84.984 I61.083 J-7.827 E.02695
G2 X77.962 Y84.264 I-.572 J-.801 E.0206
G3 X78.703 Y83.509 I1.015 J.255 E.02676
G2 X78.815 Y82.335 I-2.46 J-.827 E.02869
G3 X78.156 Y81.631 I1.736 J-2.285 E.02336
G3 X79.732 Y80.155 I1.27 J-.223 E.06168
G3 X80.676 Y80.288 I.21 J1.928 E.02324
G3 X81.876 Y79.674 I92.743 J179.633 E.03252
G2 X83.027 Y79.415 I-.099 J-3.13 E.02861
G1 X83.376 Y78.574 E.02195
G3 X85.114 Y76.618 I1.283 J-.611 E.08023
G1 X85.48 Y76.461 E.00959
G3 X86.407 Y77.493 I-.533 J1.411 E.03477
G1 X87.032 Y77.676 E.01569
M73 P35 R7
G2 X88.143 Y77.161 I-.159 J-1.8 E.03015
G3 X89.678 Y77.198 I.735 J1.362 E.03874
G1 X90.164 Y77.128 E.01184
G2 X90.928 Y75.706 I-1.577 J-1.763 E.03973
G3 X93.001 Y74.342 I1.973 J.741 E.06401
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.579 Y74.029 F42000
G1 F9000
M204 S6000
G3 X95.052 Y75.314 I-.737 J2.331 E.0485
G3 X95.702 Y76.306 I-.414 J.981 E.03035
G2 X96.585 Y76.898 I1.138 J-.743 E.02632
G3 X97.316 Y77.755 I-.47 J1.142 E.02821
G2 X98.56 Y77.673 I.56 J-.972 E.03186
G3 X99.012 Y77.601 I.426 J1.222 E.01108
G3 X100.331 Y77.564 I.68 J.704 E.03493
G2 X100.667 Y77.705 I.263 J-.157 E.00941
G1 X101.183 Y77.589 E.01277
G3 X103.062 Y78.653 I.959 J.498 E.08373
G1 X102.99 Y78.745 E.00282
G3 X102.935 Y79.955 I-4.645 J.394 E.0293
G3 X101.945 Y81.717 I-1.594 J.263 E.05264
G1 X102.051 Y82.095 E.00947
G2 X102.8 Y82.607 I1.557 J-1.472 E.02204
G3 X103.163 Y83.782 I-.549 J.813 E.03205
G3 X101.952 Y85.694 I-1.846 J.171 E.05873
G1 X102.009 Y86.074 E.00925
G2 X102.701 Y86.648 I1.125 J-.65 E.02214
G3 X103.184 Y87.632 I-.745 J.977 E.02741
G3 X99.745 Y89.372 I-1.792 J.727 E.13877
G2 X98.778 Y89.448 I-.407 J1.01 E.02425
G3 X97.077 Y87.52 I-.338 J-1.417 E.07602
G3 X95.603 Y86.898 I6.856 J-18.308 E.03859
G3 X94.744 Y84.416 I1.278 J-1.832 E.06771
G2 X93.512 Y84.154 I-.877 J1.099 E.03148
G3 X92.305 Y83.812 I.041 J-2.447 E.03061
G1 X91.781 Y83.702 E.01291
G3 X89.17 Y82.761 I-.744 J-2.029 E.07269
G1 X88.555 Y82.847 E.01497
G3 X87.664 Y83.57 I-2.216 J-1.818 E.02786
G1 X88.393 Y83.964 E.01996
G3 X87.57 Y85.43 I.541 J1.267 E.1652
G1 X86.982 Y85.259 E.01478
G1 X86.569 Y85.444 E.01091
G1 X86.746 Y86.091 E.01618
G3 X87.725 Y87.589 I-1.327 J1.936 E.04427
G1 X87.919 Y87.704 E.00545
G1 X88.455 Y87.769 E.01302
G3 X90.332 Y87.661 I1.018 J1.341 E.04808
G2 X90.641 Y86.566 I-.82 J-.823 E.02868
G3 X93.913 Y86.784 I1.655 J-.173 E.13972
G1 X94.156 Y87.262 E.01293
G3 X95.069 Y88.673 I-1.308 J1.846 E.04153
G1 X95.52 Y88.997 E.0134
G3 X97.05 Y89.92 I-.019 J1.761 E.04518
G1 X97.466 Y90.243 E.01272
G3 X100.121 Y92.622 I.386 J2.24 E.09879
G1 X100.705 Y92.503 E.01437
G1 X101.005 Y92.057 E.01298
G3 X102.325 Y90.89 I1.461 J.323 E.0454
G3 X103.348 Y92.307 I-.217 J1.235 E.04664
G2 X102.849 Y93.013 I21.126 J15.473 E.02084
G3 X102.366 Y93.289 I-.739 J-.731 E.01359
G2 X102.396 Y94.612 I.636 J.647 E.03574
G3 X101.995 Y96.11 I-1.01 J.532 E.04112
G2 X101.997 Y96.532 I.185 J.21 E.01153
G1 X102.313 Y96.952 E.01266
G3 X103.189 Y98.181 I-.154 J1.036 E.04064
G3 X102.842 Y99.773 I-1.942 J.411 E.04049
G2 X103.043 Y100.922 I1.483 J.333 E.02886
G3 X103.11 Y101.785 I-2.984 J.668 E.02095
G3 X101.797 Y103.34 I-.917 J.558 E.06461
G3 X99.515 Y102.476 I-.599 J-1.863 E.06353
G2 X99.031 Y102.412 I-.296 J.382 E.01233
G1 X98.578 Y102.678 E.01267
G3 X96.577 Y102.752 I-1.012 J-.279 E.06404
G2 X95.484 Y103.232 I-.107 J1.243 E.03003
G3 X94.475 Y103.361 I-.605 J-.716 E.02591
G3 X92.945 Y103.382 I-.952 J-13.886 E.03693
G3 X91.287 Y102.687 I-.497 J-1.141 E.04845
G3 X91.529 Y101.748 I1.371 J-.147 E.02391
G2 X91.178 Y100.831 I-1.02 J-.135 E.02467
G3 X90.808 Y98.749 I.737 J-1.205 E.05764
G1 X90.519 Y98.206 E.01482
G1 X90.114 Y98.038 E.01056
G1 X89.751 Y98.599 E.01612
G3 X89.397 Y100.235 I-2.122 J.397 E.04145
G2 X89.918 Y100.957 I.857 J-.069 E.02257
G3 X89.551 Y103.363 I-.657 J1.131 E.07542
G3 X88.419 Y102.047 I-.006 J-1.139 E.04758
G1 X88.512 Y101.566 E.0118
G1 X88.025 Y101.144 E.01553
G2 X87.189 Y101.595 I-.034 J.938 E.02404
G3 X87.081 Y102.544 I-7.112 J-.324 E.02304
G3 X86.191 Y103.265 I-1.203 J-.576 E.02854
G3 X84.314 Y103.349 I-1.025 J-1.878 E.04692
G3 X83.248 Y101.528 I-.206 J-1.102 E.0663
G3 X83.385 Y100.91 I2.862 J.311 E.01529
G2 X83.202 Y100.64 I-.247 J-.03 E.00857
G1 X82.746 Y100.43 E.01212
G3 X82.003 Y100.514 I-.597 J-1.951 E.01812
G2 X81.745 Y101.161 I1.504 J.975 E.01692
G3 X81.438 Y103.051 I-1.317 J.755 E.04995
G3 X79.929 Y102.665 I-.538 J-1.04 E.04107
G2 X79.215 Y102.724 I-.204 J1.872 E.01739
G3 X77.66 Y101.283 I-.972 J-.511 E.09717
G3 X78.375 Y101.018 I.836 J1.157 E.01861
G1 X78.366 Y100.376 E.01548
G3 X78.015 Y99.288 I1.686 J-1.146 E.02793
G3 X78.149 Y97.797 I1.129 J-.65 E.03846
G1 X78.12 Y97.233 E.01363
G2 X77.479 Y96.601 I-2.508 J1.904 E.02178
G3 X77.256 Y95.312 I2.129 J-1.031 E.03196
G3 X77.591 Y93.73 I1.635 J-.481 E.04065
G2 X77.505 Y93.04 I-1.191 J-.202 E.01701
G3 X76.922 Y91.9 I.762 J-1.109 E.03217
G3 X77.572 Y90.244 I1.865 J-.224 E.0447
G3 X77.524 Y88.96 I22.733 J-1.484 E.031
G2 X77.471 Y87.836 I-.609 J-.534 E.02999
G3 X77.257 Y86.032 I1.147 J-1.05 E.04677
G3 X77.149 Y84.848 I10.596 J-1.569 E.02869
G3 X77.481 Y84.422 I1.453 J.791 E.0131
G3 X77.891 Y83.491 I2.647 J.611 E.02466
G3 X78.345 Y83.207 I.783 J.746 E.01305
G2 X78.393 Y82.505 I-1.48 J-.454 E.01711
G2 X77.884 Y82.044 I-9.618 J10.103 E.01657
G3 X79.699 Y79.733 I1.484 J-.703 E.08776
G3 X80.638 Y79.84 I.191 J2.483 E.02292
G3 X81.756 Y79.267 I16.678 J31.177 E.0303
G2 X82.705 Y79.096 I-.154 J-3.558 E.02332
G1 X82.928 Y78.557 E.01407
G3 X85.063 Y76.183 I1.709 J-.609 E.09406
G3 X85.484 Y76.001 I.747 J1.145 E.01112
G3 X86.719 Y77.147 I-.58 J1.864 E.04203
G1 X87.031 Y77.238 E.00783
G2 X87.939 Y76.79 I-.168 J-1.483 E.0249
G3 X89.756 Y76.763 I.935 J1.743 E.04554
G2 X90.15 Y76.562 I.056 J-.377 E.01136
G2 X90.535 Y75.55 I-1.898 J-1.302 E.02637
G3 X93.522 Y74.017 I2.332 J.868 E.08886
M106 S124.95
; WIPE_START
G1 X94.341 Y74.418 E-.34658
G1 X94.403 Y74.481 E-.03342
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I-.055 J-1.216 P1  F42000
G1 X76.983 Y75.274 Z2.52
G1 Z2.12
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1627
M204 S5000
G3 X78.053 Y75.06 I1.082 J2.627 E.02647
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.928 Y75.297 I1.42 J2.462 E.00763
; WIPE_START
G1 F12000
M204 S6000
G1 X77.373 Y75.143 E-.17908
G1 X77.721 Y75.08 E-.13417
G1 X77.896 Y75.07 E-.06675
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I-.01 J1.217 P1  F42000
G1 X103.017 Y75.275 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F1627
M204 S5000
G3 X103.356 Y75.441 I-1.1 J2.681 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X102.961 Y75.253 I-.17 J2.893 E.02165
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16615
G1 X102.793 Y75.441 E-.21385
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F1627
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.41 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.021 E.03551
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14976
G1 X104.36 Y102.957 E-.07769
G1 X104.36 Y102.556 E-.15255
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F1627
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.003 J-2.805 E.03556
G1 X103.354 Y104.56 E.64408
M73 P36 R7
G1 X103.318 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.943 Y104.757 E-.15737
G1 X102.628 Y104.856 E-.12544
G1 X102.376 Y104.902 E-.09719
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F1627
M204 S5000
G3 X75.26 Y102.147 I2.462 J-1.479 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.447 I2.841 J.014 E.03551
G1 X75.64 Y102.957 E.6393
G3 X75.672 Y103.545 I-3.925 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.09427
G1 X75.38 Y102.96 E-.15608
G1 X75.305 Y102.627 E-.12965
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 14/30
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G1 X88.942 Y101.84 F42000
G1 Z2.28
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X89.55 Y101.396 I.746 J.384 E.01883
G1 X89.642 Y100.986 E.01014
G1 X89.808 Y101.03 E.00416
G3 X89.461 Y103.414 I-.488 J1.146 E.0789
G3 X88.504 Y101.768 I.101 J-1.16 E.05378
G3 X89.586 Y100.971 I1.096 J.356 E.03458
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.808 Y101.03 E-.08746
G1 X90.177 Y101.244 E-.16219
G1 X90.389 Y101.514 E-.13034
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I1.141 J-.424 P1  F42000
G1 X88.17 Y95.551 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X88.586 Y95.418 E.01052
G1 X89.046 Y95.85 E.01522
G3 X88.897 Y96.91 I-2.008 J.258 E.02611
G1 X88.62 Y97.154 E.00891
G2 X87.783 Y96.877 I-1.132 J2.023 E.02138
G1 X87.356 Y96.394 E.01554
G3 X87.999 Y95.563 I2.387 J1.181 E.02552
G1 X88.112 Y95.555 E.00274
M106 S124.95
M106 S127.5
M204 S10000
G1 X88.146 Y95.118 F42000
G1 F9000
M204 S6000
G1 X88.693 Y94.943 E.01385
G1 X89.47 Y95.672 E.02568
G3 X89.259 Y97.15 I-2.793 J.357 E.03643
G1 X88.693 Y97.649 E.01822
G2 X87.555 Y97.254 I-1.589 J2.74 E.02921
G1 X86.831 Y96.434 E.02637
G3 X87.814 Y95.154 I3.708 J1.828 E.03916
G1 X88.091 Y95.135 E.0067
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.693 Y94.943 E-.24026
G1 X88.961 Y95.195 E-.13974
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I.671 J-1.015 P1  F42000
G1 X84.293 Y92.108 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X84.487 Y92.054 E.00486
G1 X85.073 Y92.178 E.01443
G1 X85.154 Y92.512 E.0083
G1 X85.043 Y93.069 E.01369
G3 X83.866 Y93.136 I-.65 J-1.044 E.02963
G1 X83.835 Y92.729 E.00985
G1 X84.073 Y92.249 E.01292
G1 X84.244 Y92.139 E.0049
M106 S124.95
M106 S127.5
M204 S10000
G1 X84.176 Y91.705 F42000
G1 F9000
M204 S6000
G1 X84.474 Y91.622 E.00747
G1 X85.418 Y91.822 E.02328
G1 X85.584 Y92.504 E.01692
G1 X85.415 Y93.351 E.02083
G3 X83.468 Y93.431 I-1.037 J-1.494 E.04959
G1 X83.408 Y92.646 E.019
G1 X83.749 Y91.958 E.01852
G1 X84.12 Y91.72 E.01063
M106 S124.95
M106 S127.5
M204 S10000
G1 X90.031 Y89.905 F42000
G1 F9000
M204 S6000
G1 X90.535 Y89.532 E.0151
G1 X91.411 Y89.887 E.0228
G2 X91.88 Y90.407 I1.594 J-.967 E.017
G1 X92.177 Y91.575 E.02904
G1 X91.187 Y91.89 E.02504
G2 X90.212 Y92.747 I1.087 J2.222 E.03168
G2 X90.3 Y93.523 I1.01 J.278 E.01931
G3 X89.999 Y94.746 I-2.207 J.105 E.03081
G1 X89.293 Y94.759 E.01702
G1 X88.79 Y94.406 E.01483
G2 X88.485 Y93.682 I-1.05 J.015 E.01942
G3 X88.358 Y92.618 I1.401 J-.706 E.02635
G2 X88.501 Y91.278 I-1.363 J-.823 E.03356
G1 X88.653 Y90.528 E.01847
G1 X89.098 Y90.034 E.01604
G2 X89.985 Y89.939 I.314 J-1.25 E.02195
M106 S124.95
M106 S127.5
M204 S10000
G1 X90.191 Y90.309 F42000
G1 F9000
M204 S6000
G1 X90.595 Y90.01 E.01213
G1 X91.146 Y90.233 E.01432
G3 X91.672 Y91.294 I-1.113 J1.213 E.02923
G2 X89.817 Y92.589 I.595 J2.829 E.05605
G2 X89.874 Y93.565 I1.316 J.413 E.0241
G3 X89.714 Y94.331 I-1.368 J.114 E.01915
G3 X89.153 Y93.981 I-.136 J-.407 E.01821
G3 X88.744 Y93.001 I2.969 J-1.817 E.02572
G3 X88.972 Y92.232 I2.293 J.264 E.01943
G2 X88.936 Y91.248 I-2.271 J-.408 E.02393
G1 X89.041 Y90.724 E.01291
G1 X89.262 Y90.48 E.00792
G2 X90.137 Y90.33 I.181 J-1.58 E.02171
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.595 Y90.01 E-.21245
G1 X91.004 Y90.175 E-.16755
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I-.78 J.934 P1  F42000
G1 X93.579 Y92.325 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X94.674 Y90.853 E.04423
G1 X94.978 Y91.735 E.02249
G2 X95.586 Y91.866 I.657 J-1.575 E.01509
G1 X96.18 Y92.425 E.01968
G2 X96.439 Y93.278 I2.682 J-.348 E.0216
G1 X96.314 Y94.028 E.01833
G1 X95.934 Y94.525 E.01509
G2 X94.176 Y95.3 I-.355 J1.574 E.04962
G1 X93.526 Y95.651 E.01782
G1 X92.848 Y95.641 E.01635
G1 X92.298 Y94.794 E.02436
G3 X92.475 Y93.624 I2.654 J-.197 E.02876
G2 X93.624 Y92.934 I-.051 J-1.387 E.03374
G2 X93.545 Y92.372 I-.885 J-.162 E.01393
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.993 Y92.473 F42000
G1 F9000
M204 S6000
G1 X94.536 Y91.742 E.02196
G1 X94.705 Y92.232 E.0125
G3 X95.201 Y92.243 I.241 J.331 E.01285
G1 X95.399 Y92.267 E.00482
G1 X95.801 Y92.645 E.0133
G3 X95.917 Y93.856 I-1.692 J.774 E.02989
G1 X95.732 Y94.097 E.00733
G2 X93.886 Y94.98 I-.219 J1.914 E.05202
G1 X93.423 Y95.23 E.01269
G1 X93.078 Y95.224 E.00831
G1 X92.725 Y94.68 E.01564
G3 X92.812 Y93.97 I1.601 J-.165 E.01739
G2 X93.924 Y93.32 I-.658 J-2.403 E.03144
G2 X94.004 Y92.53 I-.899 J-.489 E.01966
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.536 Y91.742 E-.36121
G1 X94.552 Y91.789 E-.01879
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I.561 J-1.08 P1  F42000
G1 X78.737 Y83.579 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X79.564 Y85.166 I-.25 J1.139 E.04917
G2 X79.529 Y86.101 I3.443 J.599 E.02264
G3 X79.673 Y87.387 I-1.392 J.807 E.03212
G1 X80.031 Y87.845 E.01402
G1 X80.647 Y88.164 E.01673
G1 X81.326 Y88.198 E.01639
G3 X81.824 Y89.212 I-5.432 J3.294 E.02728
G3 X81.658 Y89.988 I-1.306 J.126 E.01943
G1 X81.122 Y90.711 E.02172
G1 X82.497 Y91.613 E.03965
G1 X83.162 Y90.757 E.02612
G3 X84.042 Y89.971 I1.323 J.594 E.02931
G1 X84.082 Y89.035 E.02258
G3 X87.174 Y87.621 I1.393 J-1.042 E.14972
G1 X87.269 Y88.566 E.02291
G1 X88.502 Y88.311 E.03035
G3 X90.001 Y88.022 I.952 J.904 E.0393
G1 X91.073 Y88.861 E.03282
G1 X91.39 Y87.224 E.0402
G3 X93.463 Y86.107 I.9 J-.811 E.10575
G3 X93.403 Y87.035 I-2.075 J.332 E.0226
G1 X93.854 Y87.681 E.019
G3 X94.423 Y88.355 I-1.104 J1.51 E.02148
G1 X94.698 Y89.187 E.02113
G1 X95.197 Y89.2 E.01204
G1 X95.399 Y89.406 E.00695
G3 X96.704 Y90.37 I.01 J1.353 E.04198
G1 X97.431 Y90.769 E.01998
G3 X99.585 Y92.452 I.41 J1.695 E.07577
M73 P37 R7
G1 X100.421 Y93.342 E.02944
G1 X100.567 Y93.271 E.00392
G3 X101.313 Y92.726 I4.807 J5.8 E.02229
G1 X101.273 Y92.643 E.00222
G1 X101.542 Y92.145 E.01366
G3 X102.09 Y91.342 I1.102 J.165 E.02426
G3 X102.889 Y92.046 I.171 J.611 E.03043
G3 X102.642 Y92.565 I-.548 J.057 E.01459
G3 X102.32 Y92.855 I-.542 J-.278 E.01069
G1 X101.785 Y92.935 E.01302
G1 X101.534 Y93.907 E.02421
G1 X101.694 Y94.492 E.01462
G3 X102 Y95.512 I-.329 J.654 E.02876
G3 X101.047 Y95.78 I-.656 J-.504 E.02559
G3 X99.729 Y95.932 I-.813 J-1.26 E.03313
G2 X98.714 Y95.975 I1.251 J41.575 E.0245
G3 X98.263 Y95.666 I.578 J-1.326 E.01325
G1 X97.708 Y95.643 E.0134
G1 X97.066 Y96.166 E.01997
G3 X95.616 Y97.556 I-1.707 J-.329 E.05164
G1 X95.212 Y98.223 E.0188
G3 X93.578 Y98.219 I-.817 J-.067 E.05894
G1 X93.578 Y97.788 E.01038
G1 X93.04 Y97.382 E.01625
G1 X92.192 Y97.384 E.02045
G1 X92.078 Y98.212 E.02016
G1 X92.294 Y98.864 E.01656
G3 X92.714 Y99.723 I-.74 J.894 E.02377
G1 X93.346 Y100.3 E.02064
G3 X94.872 Y101.152 I-.075 J1.929 E.04374
G1 X95.51 Y101.065 E.01551
G1 X96.094 Y100.416 E.02105
G3 X98.094 Y98.448 I1.924 J-.045 E.07582
G3 X98.938 Y98.895 I-.303 J1.594 E.02339
G2 X99.98 Y98.419 I-.59 J-2.673 E.02783
G3 X101.914 Y97.354 I1.428 J.305 E.06037
G3 X102.805 Y97.959 I.137 J.756 E.02874
G2 X102.746 Y98.758 I2.038 J.552 E.01943
G3 X102.269 Y99.794 I-1.97 J-.278 E.02789
G1 X102.303 Y100.56 E.01849
G3 X102.656 Y101.645 I-1.573 J1.11 E.02794
G3 X102.685 Y102.813 I-.899 J.607 E.02974
G3 X101.708 Y102.855 I-.518 J-.653 E.0252
G3 X99.806 Y102 I-.469 J-1.499 E.05499
G2 X98.931 Y101.799 I-.727 J1.157 E.02207
G1 X98.289 Y102.307 E.01975
G3 X97.567 Y103.076 I-1.034 J-.247 E.02663
G3 X97.092 Y102.87 I.006 J-.662 E.01281
G1 X96.782 Y102.303 E.0156
G1 X96.127 Y102.304 E.01579
G1 X95.476 Y102.616 E.01741
G3 X94.416 Y102.873 I-.669 J-.446 E.02891
G3 X92.877 Y102.895 I-1.192 J-29.569 E.03711
G3 X91.877 Y102.844 I-.469 J-.64 E.02612
G3 X91.866 Y101.995 I.405 J-.43 E.02286
G1 X92.056 Y101.417 E.01468
G2 X91.386 Y100.292 I-1.452 J.103 E.03274
G3 X91.282 Y99.028 I.557 J-.682 E.03414
G1 X91.419 Y98.613 E.01054
G1 X90.949 Y97.764 E.02341
G3 X89.984 Y97.385 I.407 J-2.458 E.02519
G2 X89.204 Y98.627 I1.492 J1.802 E.03597
G3 X88.649 Y100.269 I-1.286 J.48 E.04523
G3 X87.602 Y100.662 I-1.114 J-1.374 E.02745
G1 X87.175 Y100.813 E.01092
G1 X86.704 Y101.492 E.01991
G2 X86.722 Y102.204 I2.002 J.306 E.01728
G3 X85.895 Y102.86 I-.729 J-.07 E.02843
G3 X84.45 Y102.867 I-.729 J-1.344 E.0363
G3 X83.397 Y102.347 I-.335 J-.647 E.03292
G3 X83.721 Y101.676 I1.337 J.232 E.01822
G3 X85.407 Y100.143 I1.562 J.025 E.06156
G1 X85.893 Y99.373 E.02196
G3 X86.339 Y97.676 I2.539 J-.239 E.04319
G1 X85.777 Y96.823 E.02464
G3 X83.998 Y94.686 I.116 J-1.905 E.0751
G1 X83.465 Y94.309 E.01574
G1 X82.696 Y94.26 E.0186
G3 X80.776 Y94.172 I-.883 J-1.716 E.04851
G2 X79.96 Y95.015 I1.172 J1.951 E.02862
G3 X79.508 Y96.119 I-1.908 J-.137 E.02925
G1 X78.877 Y97.059 E.0273
G1 X79.88 Y97.509 E.02649
G1 X80.652 Y97.347 E.01902
G3 X83.262 Y97.083 I1.432 J1.121 E.07068
G3 X82.286 Y99.973 I-1.215 J1.2 E.09098
G1 X81.361 Y99.972 E.02231
G2 X81.247 Y101.399 I1.876 J.868 E.03524
G3 X81.251 Y102.637 I-.587 J.621 E.03341
G3 X80.236 Y102.303 I-.371 J-.58 E.0295
G1 X80.196 Y101.384 E.02218
G1 X79.069 Y101.309 E.02724
G1 X78.888 Y102.33 E.025
G3 X77.588 Y102.072 I-.654 J-.111 E.05111
G3 X78.424 Y101.496 I.971 J.515 E.02547
G1 X78.813 Y101.127 E.01292
G1 X78.868 Y100.26 E.02095
G3 X78.485 Y99.208 I1.49 J-1.138 E.02741
G3 X78.645 Y97.928 I.631 J-.571 E.03529
G1 X78.627 Y97.362 E.01365
G1 X78.573 Y97.254 E.00291
G3 X78.012 Y96.195 I9.16 J-5.536 E.02894
G1 X77.92 Y96.064 E.00385
G2 X77.692 Y95.193 I-1.158 J-.162 E.02229
G3 X78.139 Y93.791 I1.293 J-.359 E.03755
G1 X78.085 Y93.268 E.01267
G1 X77.74 Y92.603 E.01806
G3 X77.401 Y91.807 I.158 J-.538 E.02385
G3 X77.975 Y90.505 I1.454 J-.136 E.03583
G1 X78.075 Y89.697 E.01964
G3 X77.895 Y89.237 I.833 J-.592 E.01204
G2 X78.159 Y88.501 I-.87 J-.728 E.01925
G1 X78.073 Y87.817 E.01662
G3 X77.688 Y86.128 I.817 J-1.075 E.04536
G1 X77.793 Y85.517 E.01497
G1 X77.71 Y85.211 E.00762
G1 X77.812 Y85.093 E.00376
G1 X78.032 Y84.471 E.01592
G3 X78.681 Y83.565 I.612 J-.247 E.03198
M106 S124.95
M106 S127.5
M204 S10000
G1 X78.787 Y83.159 F42000
G1 F9000
M204 S6000
G3 X79.976 Y85.261 I-.25 J1.529 E.06679
G2 X80.111 Y86.395 I1.766 J.364 E.02801
G3 X80.109 Y87.263 I-1.657 J.429 E.02116
G2 X80.973 Y87.76 I.971 J-.687 E.02481
G1 X81.255 Y87.521 E.00891
G3 X82.243 Y89.152 I-2.451 J2.599 E.04655
G3 X81.724 Y90.604 I-1.84 J.162 E.03835
G1 X82.404 Y91.049 E.01958
G3 X83.225 Y89.945 I11.726 J7.868 E.0332
G1 X83.632 Y89.718 E.01123
G1 X83.657 Y89.127 E.01428
G3 X87.64 Y88.06 I1.827 J-1.147 E.19456
G1 X88.324 Y87.918 E.01684
G3 X90.223 Y87.662 I1.122 J1.147 E.04951
G1 X90.791 Y88.107 E.0174
G1 X90.949 Y87.289 E.02009
G3 X93.842 Y86.931 I1.358 J-.896 E.15936
G1 X94.153 Y87.376 E.01308
G3 X95.004 Y88.775 I-1.408 J1.815 E.04037
G1 X95.379 Y88.784 E.00903
G1 X95.61 Y89.021 E.00798
G3 X97.04 Y90.075 I-.135 J1.68 E.04514
G1 X97.527 Y90.342 E.01338
G3 X99.994 Y92.275 I.363 J2.078 E.08519
G1 X100.48 Y92.791 E.01709
G1 X100.577 Y92.729 E.00279
G2 X100.772 Y92.576 I-.705 J-1.099 E.00599
G1 X100.876 Y92.494 E.00319
G1 X101.122 Y92.039 E.01247
G3 X102.017 Y90.923 I1.467 J.259 E.036
G3 X103.222 Y91.51 I.171 J1.179 E.03432
G3 X103.319 Y92.238 I-2.321 J.682 E.01778
G3 X102.429 Y93.263 I-1.554 J-.451 E.03378
G1 X102.122 Y93.309 E.00749
G1 X101.968 Y93.904 E.01482
G2 X102.372 Y94.644 I1.515 J-.347 E.02058
G3 X101.142 Y96.209 I-.941 J.527 E.06116
G3 X99.672 Y96.351 I-.902 J-1.648 E.03661
G2 X98.757 Y96.419 I-.118 J4.632 E.02215
G3 X98.11 Y96.08 I.321 J-1.403 E.01782
G1 X97.85 Y96.069 E.00627
G1 X97.419 Y96.42 E.01341
G3 X95.892 Y97.912 I-1.977 J-.496 E.05418
G1 X95.616 Y98.367 E.01283
G3 X93.158 Y97.997 I-1.225 J-.212 E.09281
G2 X92.558 Y97.803 I-.428 J.298 E.01632
G2 X92.935 Y98.975 I1.242 J.247 E.03099
G3 X93.108 Y99.515 I-.866 J.575 E.01385
G1 X93.525 Y99.896 E.01363
G3 X95.025 Y100.707 I-.029 J1.846 E.04274
G1 X95.3 Y100.669 E.0067
G1 X95.682 Y100.245 E.01377
G3 X98.159 Y98.028 I2.335 J.116 E.08919
G3 X99.011 Y98.432 I-.231 J1.585 E.02308
G2 X99.652 Y98.122 I-.406 J-1.653 E.01731
G3 X101.994 Y96.936 I1.764 J.578 E.0703
G3 X103.217 Y98.049 I.101 J1.119 E.04485
G2 X103.164 Y98.812 I2.153 J.534 E.01852
G3 X102.695 Y99.904 I-2.154 J-.278 E.02904
G2 X102.913 Y100.78 I.959 J.225 E.0226
G2 X103.201 Y101.93 I13.032 J-2.646 E.0286
G3 X101.695 Y103.295 I-.998 J.412 E.06384
G3 X99.524 Y102.336 I-.45 J-1.918 E.06141
G2 X99.064 Y102.229 I-.384 J.608 E.01162
G2 X98.452 Y102.972 I.407 J.958 E.02412
G3 X96.533 Y102.723 I-.906 J-.537 E.05916
G2 X95.631 Y103.118 I-.055 J1.102 E.02462
G3 X94.329 Y103.293 I-.785 J-.91 E.03351
G3 X92.936 Y103.318 I-1.191 J-27.498 E.0336
G3 X91.333 Y102.078 I-.563 J-.928 E.06302
G2 X91.621 Y101.395 I-1.496 J-1.032 E.018
G2 X91.118 Y100.619 I-1.249 J.259 E.02282
G3 X90.894 Y98.863 I.818 J-.996 E.04706
G1 X90.963 Y98.656 E.00526
G1 X90.671 Y98.128 E.01456
G3 X90.088 Y97.902 I.239 J-1.482 E.01518
G2 X89.652 Y98.648 I.912 J1.033 E.02118
G3 X89.357 Y100.15 I-1.454 J.495 E.03865
G3 X87.685 Y101.078 I-1.897 J-1.446 E.04746
G1 X87.442 Y101.164 E.00621
G1 X87.126 Y101.62 E.01339
G2 X87.139 Y102.127 I1.415 J.219 E.01229
G3 X86.037 Y103.263 I-1.106 J.029 E.04251
G3 X84.416 Y103.3 I-.851 J-1.761 E.04033
G3 X83.326 Y101.511 I-.34 J-1.02 E.06975
G3 X85.164 Y99.742 I1.898 J.132 E.06741
G1 X85.474 Y99.249 E.01406
G3 X85.858 Y97.711 I2.508 J-.19 E.03889
G1 X85.517 Y97.193 E.01495
G3 X83.591 Y94.913 I.249 J-2.164 E.0793
G1 X83.32 Y94.72 E.00803
G1 X82.784 Y94.686 E.01295
G3 X80.842 Y94.651 I-.937 J-1.885 E.04866
G2 X80.265 Y95.648 I.803 J1.131 E.02864
G3 X79.522 Y96.888 I-8.564 J-4.289 E.0349
G1 X79.927 Y97.07 E.01072
G1 X80.458 Y96.959 E.01309
G3 X81.685 Y100.393 I1.618 J1.358 E.21401
G2 X81.749 Y101.347 I.941 J.417 E.02399
G3 X81.732 Y102.787 I-1.286 J.705 E.03629
G3 X79.818 Y102.374 I-.838 J-.757 E.05711
G1 X79.793 Y101.778 E.0144
G1 X79.417 Y101.753 E.00908
G3 X78.825 Y103.111 I-1.966 J-.049 E.03663
G3 X77.631 Y101.338 I-.619 J-.872 E.08224
G3 X78.216 Y101.112 I.698 J.935 E.01532
G1 X78.404 Y100.928 E.00635
G1 X78.44 Y100.363 E.01365
G3 X78.072 Y99.328 I1.934 J-1.271 E.02675
G3 X78.22 Y97.782 I.893 J-.695 E.04131
G2 X77.799 Y96.78 I-1.553 J.065 E.02677
G3 X77.472 Y95.688 I1.961 J-1.182 E.02778
G3 X77.704 Y93.665 I1.304 J-.876 E.05345
G2 X77.149 Y92.71 I-1.05 J-.028 E.02803
G3 X76.978 Y91.791 I.878 J-.639 E.02331
G3 X77.576 Y90.307 I1.868 J-.11 E.03987
G1 X77.644 Y89.762 E.01325
G3 X77.724 Y88.627 I.799 J-.514 E.02942
G2 X77.337 Y87.627 I-1.052 J-.167 E.02709
G3 X77.281 Y86.017 I1.45 J-.857 E.04052
G2 X77.277 Y85.107 I-1.722 J-.448 E.02219
G2 X77.618 Y83.923 I-1.382 J-1.04 E.03037
G3 X78.73 Y83.148 I1.011 J.265 E.03556
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.426 Y83.394 E-.28047
G1 X79.622 Y83.568 E-.09954
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I1.111 J-.498 P1  F42000
G1 X76.976 Y77.667 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F1731
M204 S6000
G3 X77.545 Y77.193 I.637 J.186 E.01892
G1 X77.592 Y76.776 E.01013
G3 X78.591 Y77.403 I-.198 J1.424 E.0293
G3 X78.576 Y78.372 I-2.346 J.45 E.02355
G3 X77.557 Y79.056 I-1.115 J-.56 E.03094
G3 X76.529 Y77.696 I.007 J-1.074 E.0475
G3 X77.535 Y76.767 I1.106 J.189 E.0355
; WIPE_START
G1 F9000
G1 X78.167 Y76.947 E-.24954
G1 X78.412 Y77.137 E-.11795
G1 X78.43 Y77.164 E-.01252
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I-.094 J1.213 P1  F42000
G1 X79.976 Y77.284 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.536 Y77.081 I.502 J.51 E.01481
G1 X80.611 Y76.668 E.01013
G3 X80.544 Y78.979 I-.277 J1.149 E.07767
G3 X79.858 Y76.834 I.016 J-1.187 E.07145
G3 X80.547 Y76.658 I.646 J1.085 E.01738
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.83 Y76.725 E-.1106
G1 X81.27 Y77.117 E-.22393
G1 X81.323 Y77.224 E-.04547
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I-.101 J1.213 P1  F42000
G1 X90.425 Y77.98 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X91.498 Y77.696 E.02677
G2 X93.399 Y78.172 I1.347 J-1.349 E.04963
G1 X94.142 Y78.396 E.01872
G1 X94.478 Y78.78 E.0123
G3 X94.173 Y80.561 I-1.982 J.577 E.04511
G2 X92.838 Y80.619 I-.554 J2.64 E.03256
G1 X92.164 Y80.487 E.01655
G2 X91.095 Y80.053 I-1.242 J1.526 E.02824
G1 X90.509 Y79.677 E.0168
G3 X90.28 Y78.775 I.597 J-.631 E.02367
G1 X90.369 Y77.995 E.01895
M106 S124.95
M106 S127.5
M204 S10000
G1 X90.754 Y78.327 F42000
G1 F9000
M204 S6000
G1 X91.401 Y78.156 E.01614
G2 X93.39 Y78.607 I1.441 J-1.744 E.05102
G1 X93.906 Y78.763 E.01299
G3 X94.096 Y79.829 I-.804 J.693 E.02739
G1 X93.937 Y80.117 E.00794
G2 X92.826 Y80.189 I-.383 J2.706 E.02703
G3 X91.868 Y79.815 I.41 J-2.465 E.02498
G3 X90.816 Y79.375 I.664 J-3.066 E.02768
G3 X90.692 Y78.87 I.27 J-.334 E.01345
G1 X90.747 Y78.385 E.01179
M106 S124.95
M106 S127.5
M204 S10000
G1 X92.873 Y74.457 F42000
G1 F9000
M204 S6000
G3 X94.632 Y75.592 I-.038 J1.99 E.05316
G3 X95.204 Y76.659 I-.126 J.755 E.03371
G1 X95.953 Y77.208 E.02238
G3 X96.778 Y77.505 I-.043 J1.416 E.0215
G3 X97.039 Y78.445 I-3.383 J1.445 E.0236
G1 X98.122 Y78.454 E.02612
G3 X98.982 Y78.084 I1.338 J1.926 E.02272
G3 X100.394 Y78.208 I.663 J.556 E.04006
G2 X101.902 Y77.469 I-.034 J-1.976 E.04184
G3 X102.607 Y78.544 I.235 J.614 E.04305
G2 X102.488 Y79.979 I2.036 J.89 E.03536
G3 X102.041 Y81.134 I-1.128 J.227 E.03154
G1 X101.341 Y81.524 E.01931
G2 X102.039 Y82.776 I2.926 J-.808 E.03491
G3 X102.855 Y83.39 I.057 J.774 E.02689
G2 X102.664 Y84.291 I6.651 J1.885 E.02222
G3 X101.488 Y85.276 I-1.323 J-.384 E.03925
G1 X100.804 Y85.262 E.01649
G1 X100.13 Y86.543 E.03489
G1 X101.321 Y86.923 E.03013
G3 X101.767 Y86.972 I.106 J1.076 E.01091
G3 X102.705 Y87.349 I.321 J.555 E.02805
G2 X102.837 Y88.262 I6.719 J-.509 E.02228
G3 X100.316 Y89.327 I-1.448 J.09 E.08627
G1 X99.835 Y88.638 E.02025
G1 X98.947 Y88.91 E.02241
G3 X97.466 Y87.728 I-.493 J-.901 E.05817
M73 P38 R7
G1 X97.355 Y87.275 E.01125
G1 X96.778 Y86.783 E.0183
G3 X95.253 Y84.609 I.166 J-1.738 E.07276
G1 X95.458 Y84.017 E.01509
G1 X94.71 Y83.61 E.02054
G1 X94.036 Y83.549 E.01631
G3 X92.465 Y83.272 I-.544 J-1.51 E.04028
G1 X91.782 Y83.152 E.01673
G3 X89.805 Y82.759 I-.725 J-1.52 E.05208
G1 X89.346 Y82.11 E.01918
G1 X88.344 Y82.294 E.02457
G3 X87.541 Y82.999 I-2.412 J-1.939 E.02588
G1 X87.124 Y84.246 E.03173
G1 X88.353 Y84.516 E.03036
G3 X89.743 Y85.04 I.454 J.901 E.04025
G3 X88.06 Y85.599 I-.858 J.228 E.06469
G1 X87.935 Y85.159 E.01102
G1 X87.388 Y84.891 E.01469
G1 X86.702 Y84.879 E.01656
G3 X85.261 Y82.954 I-.583 J-1.065 E.0837
G1 X85.352 Y82.199 E.01834
G3 X85.494 Y80.365 I1.681 J-.792 E.04641
G1 X85.389 Y79.938 E.01062
G1 X84.862 Y79.303 E.0199
G1 X84.056 Y79.227 E.01953
G2 X83.697 Y80.558 I1.544 J1.13 E.03403
G3 X82.812 Y82.664 I-1.403 J.649 E.06198
G1 X82.587 Y83.044 E.01064
G1 X82.661 Y83.912 E.02101
G3 X83.292 Y85.823 I-.736 J1.303 E.05324
G3 X81.411 Y84.145 I-1.114 J-.645 E.11013
G1 X82.206 Y83.697 E.02199
G2 X81.428 Y82.502 I-2.792 J.965 E.03474
G2 X80.455 Y82.232 I-1.983 J5.262 E.02439
G3 X78.803 Y82.226 I-.816 J-2.923 E.04035
G3 X78.115 Y81.367 I.672 J-1.243 E.02726
G3 X78.834 Y80.267 I1.892 J.452 E.03233
G3 X79.779 Y80.226 I.52 J1.105 E.0234
G3 X80.222 Y80.271 I.056 J1.662 E.01079
G1 X81.092 Y80.658 E.02295
G1 X81.275 Y80 E.01646
G3 X82.762 Y79.698 I1.273 J2.454 E.03708
G1 X83.21 Y79.317 E.01416
G1 X83.409 Y78.536 E.01945
G3 X85.357 Y76.786 I1.244 J-.574 E.08402
G1 X85.74 Y76.698 E.00947
G3 X86.158 Y77.148 I-.643 J1.016 E.01497
G1 X86.511 Y78.017 E.02262
G1 X87.64 Y77.712 E.0282
G3 X89.954 Y77.407 I1.292 J.872 E.06361
G2 X90.954 Y76.573 I-1.052 J-2.278 E.03178
G3 X92.815 Y74.455 I1.931 J-.18 E.07611
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.111 Y74.048 F42000
G1 F9000
M204 S6000
G3 X94.897 Y75.233 I-.447 J2.611 E.0532
G3 X95.65 Y76.465 I-.251 J1 E.03859
G1 X96.125 Y76.813 E.01421
G3 X97.367 Y78.028 I.025 J1.216 E.04665
G1 X98.007 Y78.033 E.01544
G3 X98.809 Y77.693 I1.379 J2.14 E.02111
G3 X100.557 Y77.755 I.844 J.866 E.04713
G2 X101.649 Y77.132 I-.441 J-2.04 E.03081
G3 X103.118 Y78.564 I.503 J.954 E.06541
G2 X102.863 Y79.572 I1.163 J.829 E.02565
G3 X102.92 Y80.489 I-260.164 J16.58 E.02216
G3 X101.87 Y81.71 I-1.657 J-.363 E.04046
G2 X102.285 Y82.399 I1.626 J-.507 E.01959
G3 X103.127 Y83.936 I-.039 J1.021 E.0508
G3 X101.055 Y85.687 I-1.801 J-.029 E.0741
G1 X100.735 Y86.295 E.01655
G1 X101.381 Y86.501 E.01635
G2 X101.873 Y86.452 I.168 J-.812 E.01209
G3 X103.132 Y87.661 I.201 J1.05 E.04923
G3 X99.666 Y89.129 I-1.761 J.668 E.13924
G3 X98.173 Y89.465 I-1.489 J-3.138 E.03719
G3 X97.04 Y87.757 I.275 J-1.412 E.05501
G1 X96.979 Y87.507 E.0062
G2 X96.067 Y87.014 I-1.004 J.767 E.02577
G3 X94.945 Y84.216 I.861 J-1.969 E.08057
G2 X93.888 Y84.036 I-.725 J1.064 E.02668
G3 X92.309 Y83.671 I-.395 J-1.884 E.04033
G2 X91.415 Y83.697 I-.421 J.914 E.02236
G3 X89.158 Y82.571 I-.363 J-2.096 E.0651
G1 X88.551 Y82.683 E.01489
G3 X87.897 Y83.261 I-1.976 J-1.579 E.02115
G1 X87.67 Y83.936 E.01717
G1 X88.351 Y84.086 E.01682
G3 X87.582 Y85.454 I.523 J1.194 E.15696
G2 X86.544 Y85.393 I-.583 J1.06 E.02591
G3 X84.857 Y82.796 I-.419 J-1.574 E.0986
G1 X84.921 Y82.266 E.01286
G3 X85.051 Y80.324 I2.038 J-.839 E.04863
G1 X85.004 Y80.132 E.00477
G1 X84.65 Y79.704 E.01339
G1 X84.309 Y79.672 E.00825
G2 X84.179 Y80.631 I1.129 J.641 E.0239
G3 X83.116 Y82.975 I-1.871 J.565 E.06778
G1 X83.017 Y83.142 E.00467
G1 X83.065 Y83.71 E.01376
G3 X81.16 Y83.805 I-.882 J1.467 E.21056
G1 X81.652 Y83.528 E.01361
G2 X81.184 Y82.863 I-1.57 J.607 E.0198
G2 X80.461 Y82.665 I-1.457 J3.91 E.0181
G3 X78.969 Y82.739 I-1.014 J-5.39 E.03613
G3 X77.692 Y81.392 I.428 J-1.684 E.04721
G3 X78.628 Y79.899 I2.215 J.35 E.04366
G3 X80.061 Y79.817 I.848 J2.241 E.03516
G3 X80.818 Y80.076 I-.14 J1.642 E.01947
G1 X80.927 Y79.682 E.00986
G3 X82.606 Y79.28 I1.581 J2.892 E.04212
G1 X82.836 Y79.084 E.00729
G1 X82.972 Y78.552 E.01323
G3 X85.396 Y76.346 I1.673 J-.596 E.10064
G3 X85.856 Y76.254 I.375 J.68 E.0115
G3 X86.76 Y77.515 I-1.222 J1.832 E.03823
G1 X87.406 Y77.34 E.01613
G3 X89.942 Y76.923 I1.492 J1.153 E.06819
G2 X90.536 Y76.403 I-.672 J-1.364 E.01926
G3 X93.053 Y74.045 I2.318 J-.047 E.09379
M106 S124.95
M106 S127.5
M204 S10000
G1 X97.776 Y83.507 F42000
G1 F9000
M204 S6000
G1 X98.271 Y82.134 E.03519
G2 X99.203 Y82.557 I1.35 J-1.736 E.0249
G1 X99.456 Y82.557 E.0061
G1 X100.297 Y83.201 E.02555
G2 X100.093 Y84.182 I2.011 J.93 E.02437
G1 X99.725 Y84.811 E.01759
G1 X98.765 Y85.412 E.0273
G1 X98.403 Y84.352 E.027
G2 X97.757 Y83.561 I-2.088 J1.045 E.02484
M106 S124.95
M106 S127.5
M204 S10000
G1 X98.24 Y83.459 F42000
G1 F9000
M204 S6000
G1 X98.504 Y82.727 E.01876
G2 X99.313 Y82.977 I.851 J-1.322 E.02069
G1 X99.815 Y83.361 E.01523
G2 X99.679 Y84.058 I1.434 J.643 E.01729
G3 X98.991 Y84.775 I-1.029 J-.299 E.0249
G2 X98.28 Y83.501 I-2.44 J.527 E.0357
M106 S124.95
; WIPE_START
G1 X98.504 Y82.727 E-.30603
G1 X98.677 Y82.817 E-.07397
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I.4 J-1.149 P1  F42000
G1 X76.983 Y75.274 Z2.68
G1 Z2.28
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1731
M204 S5000
G3 X78.053 Y75.06 I1.081 J2.623 E.02647
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.928 Y75.297 I1.418 J2.457 E.00763
; WIPE_START
G1 F12000
M204 S6000
G1 X77.373 Y75.143 E-.17909
G1 X77.728 Y75.08 E-.13679
G1 X77.896 Y75.069 E-.06413
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I-.013 J1.217 P1  F42000
G1 X103.143 Y75.331 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F1731
M204 S5000
G3 X103.356 Y75.441 I-1.226 J2.626 E.00578
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X103.089 Y75.306 I-.17 J2.893 E.02498
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.11378
G1 X102.655 Y75.441 E-.26622
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I-1.215 J.072 P1  F42000
G1 X104.33 Y103.605 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F1731
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.68 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.411 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.574 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.021 E.03551
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14975
G1 X104.36 Y102.957 E-.07769
G1 X104.36 Y102.556 E-.15256
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.611 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F1731
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.011 J-2.837 E.03555
G1 X103.354 Y104.56 E.64408
M73 P39 R7
G1 X103.317 Y104.581 E.00103
; WIPE_START
G1 F12000
M204 S6000
G1 X102.936 Y104.759 E-.15997
G1 X102.628 Y104.856 E-.12274
G1 X102.376 Y104.902 E-.0973
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F1731
M204 S5000
G3 X75.26 Y102.147 I2.462 J-1.479 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.805 J.003 E.03556
G1 X75.64 Y102.957 E.63934
G3 X75.672 Y103.545 I-3.926 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.09434
G1 X75.38 Y102.96 E-.15606
G1 X75.305 Y102.627 E-.12961
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 15/30
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G1 X77.664 Y101.908 F42000
G1 Z2.44
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X78.139 Y101.597 I.42 J.124 E.01491
G1 X78.149 Y101.177 E.01013
G3 X79.208 Y102.552 I.151 J.979 E.051
G3 X77.368 Y101.559 I-1.003 J-.343 E.08877
G3 X78.091 Y101.176 I.771 J.583 E.02036
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.558 Y101.197 E-.17743
G1 X78.86 Y101.325 E-.12482
G1 X79.01 Y101.464 E-.07776
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I.3 J1.179 P1  F42000
G1 X80.82 Y101.003 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X81.154 Y101.467 E.01378
G3 X81.35 Y102.499 I-.424 J.615 E.02809
G3 X80.689 Y102.781 I-.564 J-.405 E.01821
G3 X80.292 Y101.854 I.334 J-.692 E.02653
G1 X80.786 Y100.956 E.02472
M106 S124.95
M106 S127.5
M204 S10000
G1 X82.31 Y96.77 F42000
G1 F9000
M204 S6000
G3 X81.95 Y99.859 I-.217 J1.54 E.11606
G1 X81.226 Y99.709 E.01784
G1 X80.737 Y100.435 E.02113
G1 X79.568 Y100.701 E.02891
G1 X79.47 Y100.536 E.00462
G3 X78.521 Y99.21 I.613 J-1.441 E.04136
G3 X78.303 Y98.305 I.402 J-.576 E.02455
G1 X78.714 Y97.948 E.01314
G1 X78.673 Y97.341 E.01465
G1 X79.592 Y97.983 E.02702
G1 X80.171 Y97.981 E.01398
G2 X81.216 Y97.017 I-6.48 J-8.068 E.03432
G3 X82.253 Y96.757 I.917 J1.461 E.02621
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.624 Y96.843 E-.14458
G1 X82.942 Y97.001 E-.13506
G1 X83.133 Y97.184 E-.10036
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I1.156 J-.379 P1  F42000
G1 X78.661 Y83.547 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X79.506 Y84.953 I-.22 J1.089 E.04449
G1 X79.321 Y85.459 E.01299
G2 X79.676 Y86.657 I11.093 J-2.63 E.03016
G3 X79.593 Y87.327 I-1.923 J.101 E.01635
G2 X81.161 Y88.274 I1.43 J-.597 E.04726
G3 X81.766 Y89.22 I-1.092 J1.364 E.02758
G3 X81.255 Y90.426 I-1.793 J-.048 E.03232
G1 X81.846 Y91.387 E.0272
G1 X82.395 Y91.553 E.01383
G1 X83.157 Y91.062 E.02187
G3 X83.885 Y90.239 I1.033 J.18 E.02787
G1 X84.137 Y89.908 E.01005
G1 X84.308 Y89.138 E.01902
G3 X83.962 Y87.379 I1.563 J-1.22 E.04483
G3 X87.086 Y87.755 I1.507 J.646 E.10166
G1 X87.308 Y88.292 E.01399
G2 X88.419 Y88.448 I.999 J-3.075 E.02721
G3 X89.976 Y88.055 I1.027 J.79 E.04177
G1 X90.101 Y88.153 E.00382
G1 X91.243 Y88.24 E.0276
G1 X91.35 Y87.058 E.02862
G3 X93.41 Y86.117 I.948 J-.65 E.09671
G2 X93.73 Y87.272 I1.875 J.104 E.02941
G1 X93.728 Y87.319 E.00112
G2 X94.284 Y88.384 I3.393 J-1.094 E.02914
G3 X94.451 Y89.184 I-1.669 J.764 E.01987
G1 X95.322 Y89.529 E.02261
G3 X96.719 Y90.557 I.179 J1.219 E.04637
G1 X97.476 Y90.897 E.02003
G3 X99.443 Y92.36 I.34 J1.596 E.06685
G1 X99.577 Y92.699 E.0088
G1 X100.345 Y93.373 E.02463
G1 X100.537 Y93.263 E.00533
G1 X100.949 Y93.502 E.01148
G1 X101.628 Y92.527 E.02865
G3 X101.943 Y91.43 I1.435 J-.183 E.0283
G3 X102.782 Y91.512 I.354 J.716 E.02142
G3 X102.821 Y92.073 I-.619 J.325 E.01397
G3 X102.647 Y92.732 I-2.305 J-.255 E.01649
G3 X101.946 Y92.883 I-.582 J-.999 E.01759
G1 X101.594 Y93.391 E.01492
G1 X101.492 Y94.085 E.01689
G1 X101.605 Y94.49 E.01015
G3 X102.12 Y95.014 I-1.116 J1.612 E.01782
G3 X101.679 Y95.743 I-.606 J.131 E.02265
G3 X101.275 Y95.762 I-.219 J-.347 E.01019
G3 X99.954 Y95.918 I-1.268 J-5.062 E.03217
G3 X99.423 Y95.797 I-.093 J-.819 E.01338
G1 X98.908 Y96.033 E.01364
G3 X98.46 Y95.847 I.038 J-.727 E.01194
G1 X98.205 Y95.406 E.01228
G2 X96.752 Y96.686 I.267 J1.767 E.04936
G3 X95.527 Y97.477 I-1.439 J-.885 E.03637
G1 X95.094 Y98.115 E.01858
G3 X93.927 Y97.635 I-.681 J-.004 E.06422
G1 X94.226 Y97.388 E.00936
G1 X94.206 Y96.554 E.0201
G3 X95.727 Y94.616 I1.321 J-.529 E.07181
G1 X96.479 Y94.797 E.01867
G2 X96.641 Y93.408 I-3.35 J-1.095 E.03396
G3 X96.311 Y92.38 I2.165 J-1.263 E.02625
G1 X95.695 Y91.825 E.01998
G3 X94.31 Y90.724 I.011 J-1.435 E.04598
G1 X93.488 Y90.519 E.02044
G3 X91.296 Y89.499 I-.515 J-1.757 E.06367
G1 X90.348 Y89.61 E.02302
G3 X89.013 Y89.979 I-1.016 J-1.078 E.03474
G1 X88.643 Y90.331 E.01231
G1 X88.302 Y91.05 E.01919
G3 X88.138 Y92.761 I-1.435 J.725 E.04374
G1 X88.216 Y93.584 E.01995
G3 X87.814 Y95.012 I-.419 J.652 E.04766
G1 X87.23 Y95.44 E.01746
G1 X86.895 Y96.367 E.02376
G1 X87.023 Y96.862 E.01233
G1 X87.576 Y97.383 E.01834
G3 X89.055 Y98.495 I-.136 J1.719 E.04707
G3 X88.642 Y100.114 I-.913 J.629 E.04564
G3 X87.45 Y100.538 I-1.11 J-1.234 E.0313
G1 X87.178 Y100.683 E.00743
G1 X86.661 Y101.231 E.01816
G1 X86.618 Y102.009 E.01879
G3 X86.555 Y102.56 I-.409 J.233 E.0143
G3 X86.458 Y102.843 I-.534 J-.025 E.00731
G3 X85.867 Y102.799 I-.216 J-1.095 E.01447
G3 X84.652 Y102.851 I-.668 J-1.378 E.03017
G3 X83.87 Y102.879 I-.459 J-1.954 E.01898
G3 X83.415 Y102.539 I.903 J-1.682 E.01374
G3 X83.46 Y102.028 I.547 J-.21 E.0128
G1 X83.894 Y101.596 E.01477
G3 X83.925 Y101.164 I.213 J-.202 E.01176
G3 X85.695 Y100.265 I1.424 J.612 E.05196
G1 X86.032 Y99.354 E.02344
G3 X86.247 Y98.162 I1.9 J-.272 E.0297
G1 X86.82 Y97.433 E.02238
G1 X85.869 Y96.648 E.02975
G3 X84.81 Y93.815 I-.146 J-1.56 E.09869
G1 X85.428 Y93.497 E.01677
G1 X85.804 Y92.638 E.02262
G3 X85.517 Y91.798 I1.711 J-1.053 E.02157
G1 X84.52 Y91.528 E.02491
G3 X83.816 Y91.789 I-.847 J-1.203 E.01833
G1 X83.3 Y92.48 E.02079
G3 X80.744 Y93.947 I-1.493 J.36 E.09526
G1 X80.136 Y94.394 E.01818
G2 X79.757 Y95.474 I1.552 J1.152 E.02804
G3 X79.292 Y96.087 I-1.421 J-.596 E.01874
G3 X78.526 Y97.04 I-2.012 J-.832 E.02988
G2 X78.031 Y96.429 I-1.628 J.814 E.01912
G1 X77.944 Y95.535 E.02167
G3 X77.673 Y94.835 I1.093 J-.825 E.01832
G1 X77.559 Y94.51 E.00832
G2 X78.252 Y93.733 I-7.606 J-7.478 E.02511
G2 X77.386 Y92.405 I-1.78 J.215 E.03958
G3 X77.447 Y91.764 I.494 J-.276 E.01652
G3 X77.905 Y90.619 I1.393 J-.108 E.03081
G2 X77.824 Y89.271 I-1.426 J-.591 E.03371
G3 X78.312 Y88.543 I21.792 J14.092 E.02112
G1 X78.057 Y87.711 E.02098
G3 X77.95 Y85.897 I.649 J-.949 E.05056
G3 X77.982 Y85.272 I.569 J-.284 E.01577
G1 X78.134 Y84.612 E.01633
G3 X78.604 Y83.537 I.536 J-.406 E.03439
M106 S124.95
M106 S127.5
M204 S10000
G1 X78.859 Y83.157 F42000
G1 F9000
M204 S6000
G3 X79.758 Y85.486 I-.453 J1.513 E.06944
G2 X80.097 Y86.612 I22.847 J-6.258 E.02835
G3 X80.035 Y87.258 I-1.846 J.148 E.01572
G2 X81.263 Y87.762 I.903 J-.452 E.03495
G3 X82.112 Y88.831 I-3.125 J3.354 E.03304
G3 X81.762 Y90.448 I-1.617 J.496 E.0417
M73 P40 R7
G1 X82.12 Y91.031 E.01651
G1 X82.331 Y91.095 E.0053
G1 X82.82 Y90.78 E.01404
G3 X83.634 Y89.876 I1.145 J.212 E.03085
G1 X83.747 Y89.727 E.00451
G1 X83.864 Y89.197 E.01309
G3 X87.482 Y87.612 I1.624 J-1.214 E.17602
G1 X87.616 Y87.937 E.00848
G2 X88.286 Y88.016 I.559 J-1.862 E.01636
G3 X90.26 Y87.744 I1.148 J1.028 E.05225
G1 X90.862 Y87.79 E.01455
G1 X90.922 Y87.129 E.016
G3 X93.867 Y86.532 I1.387 J-.719 E.13938
G1 X94.151 Y87.25 E.01861
G2 X94.667 Y88.206 I3.418 J-1.228 E.02631
G3 X94.842 Y88.887 I-1.404 J.723 E.01709
G1 X95.392 Y89.105 E.01428
G3 X97.048 Y90.244 I.158 J1.542 E.05271
G2 X98.013 Y90.447 I.678 J-.829 E.02471
G3 X99.857 Y92.264 I-.144 J1.99 E.06795
G1 X99.93 Y92.45 E.00482
G1 X100.397 Y92.859 E.01496
G1 X100.538 Y92.778 E.00393
G1 X100.825 Y92.945 E.008
G1 X101.212 Y92.391 E.01629
G3 X101.762 Y91.044 I1.4 J-.214 E.03685
G3 X103.106 Y91.235 I.528 J1.111 E.03467
G3 X103.233 Y92.176 I-.68 J.572 E.02417
G3 X102.901 Y93.07 I-1.849 J-.179 E.02325
G3 X102.179 Y93.284 I-.715 J-1.088 E.01841
G2 X102.329 Y94.596 I.58 J.599 E.03677
G3 X101.893 Y96.108 I-.695 J.618 E.04522
G3 X101.238 Y96.193 I-.422 J-.689 E.01641
G3 X99.957 Y96.339 I-1.187 J-4.715 E.03117
G3 X99.457 Y96.244 I-.114 J-.763 E.01252
G3 X98.014 Y95.914 I-.596 J-.716 E.04126
G2 X97.125 Y96.887 I.313 J1.178 E.03357
G3 X95.789 Y97.839 I-1.661 J-.916 E.04092
G1 X95.488 Y98.282 E.01291
G3 X93.801 Y97.194 I-1.092 J-.16 E.10632
G1 X93.788 Y96.636 E.01345
G3 X96.156 Y94.287 I1.741 J-.613 E.10041
G2 X96.014 Y93.029 I-1.565 J-.461 E.03137
G1 X95.927 Y92.599 E.01057
G1 X95.514 Y92.227 E.01341
G3 X94.019 Y91.085 I.076 J-1.649 E.04828
G2 X93.007 Y91.032 I-.564 J1.101 E.02517
G3 X91.097 Y89.945 I-.052 J-2.13 E.05568
G1 X90.508 Y90.014 E.01431
G3 X89.157 Y90.422 I-1.059 J-1.067 E.03542
G2 X88.756 Y91.074 I.646 J.847 E.01888
G3 X88.569 Y92.86 I-1.787 J.716 E.04507
G1 X88.622 Y93.414 E.0134
G3 X88.002 Y95.395 I-.745 J.854 E.06326
G1 X87.581 Y95.703 E.01257
G1 X87.334 Y96.388 E.01755
G1 X87.399 Y96.64 E.00627
G2 X88.32 Y97.149 I.938 J-.608 E.02642
G3 X89.568 Y98.519 I-1.241 J2.385 E.04562
G3 X88.885 Y100.457 I-1.378 J.604 E.05457
G3 X87.566 Y100.952 I-1.275 J-1.394 E.03482
G2 X87.045 Y101.894 I.348 J.808 E.02795
G3 X86.958 Y102.734 I-1.04 J.317 E.02091
G3 X85.905 Y103.23 I-.723 J-.169 E.03227
G3 X84.598 Y103.276 I-.715 J-1.714 E.03222
G3 X83.882 Y103.338 I-.932 J-6.652 E.01735
G3 X82.976 Y102.609 I.594 J-1.666 E.02856
G3 X83.417 Y101.478 I1.056 J-.239 E.03106
G1 X83.361 Y101.3 E.00451
G3 X83.935 Y100.361 I4.247 J1.951 E.02661
G3 X85.404 Y99.842 I1.349 J1.48 E.03859
G2 X85.6 Y98.807 I-1.218 J-.768 E.02602
G3 X86.237 Y97.496 I2.297 J.306 E.03574
G1 X85.715 Y97.066 E.01629
G3 X85.103 Y93.192 I.013 J-1.988 E.13492
G1 X85.341 Y92.649 E.01429
G3 X85.168 Y92.138 I1.041 J-.637 E.01311
G1 X84.578 Y91.979 E.01474
G3 X84.065 Y92.157 I-.594 J-.882 E.01324
G1 X83.729 Y92.607 E.01356
G3 X80.766 Y94.453 I-1.88 J.283 E.10666
G2 X80.241 Y95.121 I.393 J.849 E.02128
G3 X79.625 Y96.352 I-1.634 J-.048 E.03425
G3 X79.111 Y97.051 I-1.452 J-.53 E.02121
G2 X79.723 Y97.562 I1.358 J-1.004 E.01942
G1 X80.025 Y97.562 E.00728
G2 X80.978 Y96.668 I-9.974 J-11.579 E.03151
G3 X81.416 Y100.177 I1.092 J1.646 E.19362
G1 X81.091 Y100.661 E.01405
G1 X81.444 Y101.151 E.01457
G3 X81.647 Y102.8 I-.651 J.917 E.04508
G3 X80.275 Y103.023 I-.797 J-.574 E.03725
G3 X79.895 Y101.704 I.789 J-.941 E.0351
G1 X80.302 Y100.965 E.02036
G1 X79.363 Y101.179 E.02323
G2 X78.825 Y100.634 I-.786 J.238 E.01921
G3 X78.139 Y99.417 I1.235 J-1.498 E.03445
G3 X78.281 Y97.768 I.672 J-.773 E.04649
G2 X77.778 Y96.777 I-1.271 J.022 E.02773
G3 X77.586 Y96.455 I.472 J-.5 E.00916
G1 X77.533 Y95.676 E.01881
G3 X77.26 Y94.926 I1.599 J-1.006 E.01941
G3 X77.531 Y93.946 I.62 J-.356 E.02726
G1 X77.785 Y93.638 E.00964
G2 X77.155 Y92.782 I-1.143 J.182 E.02663
G3 X77.029 Y91.673 I.667 J-.637 E.0289
G3 X77.525 Y90.412 I1.73 J-.048 E.03358
G2 X77.413 Y89.368 I-1.086 J-.411 E.02627
G3 X77.737 Y88.677 I.837 J-.03 E.01912
G1 X77.855 Y88.485 E.00543
G1 X77.688 Y87.94 E.01374
G3 X77.51 Y85.795 I.956 J-1.159 E.05785
G3 X77.579 Y85.148 I.607 J-.262 E.0164
G1 X77.693 Y84.656 E.0122
G3 X78.802 Y83.147 I.916 J-.489 E.05629
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.31 Y83.384 E-.21319
G1 X79.609 Y83.631 E-.14737
G1 X79.638 Y83.674 E-.01944
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-.344 J1.167 P1  F42000
G1 X81.45 Y84.207 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X82.293 Y83.972 I.718 J.944 E.02161
G1 X82.384 Y83.562 E.01013
G3 X81.908 Y83.563 I-.235 J1.621 E.2366
G1 X82.328 Y83.549 E.01013
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.732 Y83.639 E-.15751
G1 X83.042 Y83.793 E-.13132
G1 X83.227 Y83.946 E-.09118
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I1.064 J-.591 P1  F42000
G1 X81.192 Y80.282 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X82.509 Y79.778 I1.313 J1.46 E.03478
G1 X82.604 Y79.369 E.01013
G3 X81.445 Y82.818 I-.305 J1.816 E.15355
G2 X80.316 Y82.569 I-5.452 J22.096 E.02789
G3 X79.397 Y82.736 I-11.205 J-59.299 E.02252
G3 X77.654 Y81.506 I.066 J-1.944 E.05444
G3 X77.961 Y80.686 I1.221 J-.011 E.02162
G3 X80.09 Y79.928 I1.433 J.656 E.06076
G1 X80.568 Y80.101 E.01226
G2 X81.58 Y79.535 I-2.995 J-6.542 E.02799
G3 X82.547 Y79.356 I.959 J2.477 E.02387
M106 S124.95
M106 S127.5
; WIPE_START
G1 X83.214 Y79.6 E-.2698
G1 X83.454 Y79.764 E-.1102
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I1.216 J.046 P1  F42000
G1 X83.549 Y77.215 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X84.591 Y76.638 I1.181 J.903 E.02954
G1 X84.615 Y76.218 E.01014
G3 X85.754 Y76.647 I-.026 J1.793 E.02995
G2 X86.177 Y76.64 I.194 J-.963 E.01028
G3 X86.649 Y77.961 I-1.342 J1.224 E.03474
G3 X85.699 Y79.249 I-4.348 J-2.21 E.03877
G3 X84.557 Y76.217 I-1.077 J-1.326 E.15596
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.065 Y76.284 E-.1949
G1 X85.515 Y76.471 E-.18511
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-.192 J-1.202 P1  F42000
G1 X79.932 Y77.362 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.444 Y77.084 I.779 J.828 E.01422
G1 X80.496 Y76.668 E.01013
G3 X81.474 Y77.916 I-.067 J1.059 E.04319
G3 X79.485 Y78.225 I-1.032 J-.086 E.06663
G3 X80.439 Y76.66 I.998 J-.465 E.05222
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.84 Y76.781 E-.15929
G1 X81.263 Y77.061 E-.19269
G1 X81.296 Y77.127 E-.02803
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-.148 J-1.208 P1  F42000
G1 X77.042 Y77.649 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X77.39 Y77.151 I.866 J.235 E.01495
G1 X77.447 Y77.134 E.00143
G1 X77.453 Y76.714 E.01013
G3 X78.619 Y78.077 I-.034 J1.21 E.04872
G3 X78.288 Y78.767 I-32.727 J-15.296 E.01846
G3 X76.806 Y78.693 I-.711 J-.656 E.0408
G3 X76.622 Y77.53 I.664 J-.701 E.03054
G1 X76.989 Y76.934 E.01688
G3 X77.395 Y76.712 I.476 J.388 E.01145
M106 S124.95
M106 S127.5
; WIPE_START
G1 X77.746 Y76.759 E-.13472
G1 X78.3 Y77.091 E-.24529
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-.77 J.943 P1  F42000
G1 X87.27 Y84.413 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X88.34 Y84.558 E.02604
G3 X89.685 Y84.985 I.484 J.808 E.03846
G3 X87.988 Y85.192 I-.826 J.286 E.07518
G2 X87.127 Y84.779 I-1.084 J1.152 E.0234
G1 X87.213 Y84.406 E.00923
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.204 Y84.539 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I1.105 J.51 P1  F42000
G1 X92.805 Y74.581 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.472 Y75.556 I-.008 J1.926 E.04879
G1 X94.915 Y75.685 E.01112
G3 X95.291 Y76.393 I-.835 J.897 E.0197
G1 X95.405 Y76.776 E.00964
G1 X96.019 Y77.256 E.01879
G3 X96.815 Y77.42 I-.203 J3.005 E.01967
G1 X96.896 Y78.442 E.02471
G1 X98.046 Y78.613 E.02806
G3 X99.498 Y77.836 I4.96 J7.519 E.03976
G3 X100.108 Y77.779 I.637 J3.514 E.01481
G1 X100.398 Y78.101 E.01044
G2 X101.603 Y77.808 I.068 J-2.344 E.03029
G3 X102.189 Y77.45 I.562 J.263 E.01752
G3 X102.775 Y78.188 I.067 J.548 E.0272
G3 X102.267 Y79.204 I-11.153 J-4.934 E.0274
G2 X102.449 Y80.039 I2.005 J.001 E.02078
G2 X102.586 Y80.505 I.611 J.074 E.01204
G3 X101.193 Y81.268 I-1.229 J-.591 E.04088
G1 X100.545 Y81.06 E.01641
G2 X99.663 Y82.222 I20.296 J16.305 E.0352
G3 X98.695 Y82.159 I-.449 J-.568 E.02565
G1 X98.179 Y82.258 E.01266
G1 X97.541 Y82.685 E.0185
G1 X97.666 Y83.682 E.02424
G3 X98.429 Y85.106 I-1.074 J1.492 E.04034
G1 X99.144 Y85.618 E.0212
G1 X100 Y85.683 E.0207
G1 X100.3 Y84.64 E.02617
G3 X101.361 Y82.763 I1.193 J-.564 E.06086
G2 X102.15 Y82.815 I.535 J-2.128 E.01916
G3 X102.634 Y83.941 I.093 J.627 E.04014
G3 X101.076 Y85.177 I-1.236 J.041 E.0557
G1 X100.58 Y85.52 E.01453
G1 X100.254 Y86.512 E.02518
G1 X101.222 Y87.025 E.02643
G3 X102.396 Y86.914 I6.029 J57.831 E.02842
G3 X102.637 Y87.723 I-.224 J.507 E.02312
G3 X101.069 Y89.722 I-1.298 J.597 E.07549
G3 X100.158 Y88.966 I1.111 J-2.268 E.02882
G2 X99.083 Y88.803 I-.799 J1.634 E.02663
G3 X97.478 Y87.914 I-.612 J-.789 E.05613
G1 X97.674 Y87.229 E.01718
G1 X96.838 Y86.627 E.02484
G3 X95.36 Y84.698 I.034 J-1.556 E.06723
G1 X95.648 Y83.904 E.02035
G1 X94.923 Y83.412 E.02113
G2 X93.722 Y83.516 I-.45 J1.791 E.02962
G3 X92.418 Y83.114 I-.219 J-1.607 E.03396
G2 X91.264 Y83.178 I-.488 J1.622 E.02844
G3 X89.506 Y81.946 I-.213 J-1.566 E.05691
G1 X88.396 Y82.042 E.02686
G3 X87.619 Y82.838 I-4.441 J-3.558 E.02686
G1 X87.535 Y83.266 E.01052
G1 X86.772 Y84.346 E.03189
G1 X86.981 Y84.374 E.00507
G1 X87.017 Y84.699 E.00789
G3 X86.089 Y84.984 I-1.031 J-1.708 E.02365
G3 X85.342 Y82.946 I.037 J-1.169 E.06702
G1 X85.499 Y82.215 E.01804
G3 X86.889 Y79.84 I1.398 J-.775 E.07987
G1 X87.192 Y79.625 E.00898
G1 X87.577 Y78.961 E.01849
G3 X90.227 Y78.14 I1.305 J-.476 E.1085
G3 X90.23 Y78.752 I-1.279 J.313 E.0149
G1 X89.909 Y79.666 E.02336
G1 X90.885 Y80.138 E.02616
G3 X92.292 Y80.729 I-.042 J2.068 E.03768
G1 X93.01 Y80.68 E.01735
G3 X94.847 Y81.471 I.473 J1.431 E.05276
G1 X95.812 Y81.628 E.02357
G3 X97.248 Y81.546 I.769 J.85 E.03748
G1 X97.776 Y80.92 E.01974
G1 X97.971 Y79.85 E.02623
G1 X96.402 Y79.429 E.03916
G1 X96.29 Y79.764 E.00852
G3 X94.638 Y79.1 I-.537 J-1.052 E.04862
G1 X94.535 Y78.554 E.01342
G1 X94.109 Y78.199 E.01335
G1 X93.403 Y78.041 E.01747
G3 X92.747 Y74.578 I-.533 J-1.692 E.14451
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.207 Y74.179 F42000
G1 F9000
M204 S6000
G3 X94.723 Y75.192 I-.355 J2.174 E.04534
G3 X95.573 Y75.824 I-.155 J1.094 E.02662
G3 X95.769 Y76.528 I-5.079 J1.8 E.01764
G1 X96.194 Y76.86 E.01301
G3 X97.194 Y77.231 I.069 J1.348 E.02644
G3 X97.299 Y78.077 I-1.39 J.601 E.02083
G1 X97.959 Y78.176 E.0161
G3 X99.43 Y77.421 I3.972 J5.927 E.03995
G3 X100.198 Y77.367 I.601 J3.055 E.01862
G3 X100.57 Y77.664 I-.198 J.628 E.01175
G2 X101.333 Y77.46 I.01 J-1.493 E.01928
G3 X102.987 Y77.329 I.887 J.693 E.04497
G3 X102.892 Y78.847 I-.986 J.7 E.03965
G1 X102.689 Y79.292 E.0118
G2 X102.882 Y80.17 I15.792 J-3.021 E.02168
G3 X102.808 Y80.942 I-.536 J.338 E.02014
G3 X100.688 Y81.547 I-1.427 J-.986 E.05762
G3 X99.93 Y82.551 I-34.477 J-25.197 E.03035
G3 X98.609 Y82.603 I-.695 J-.853 E.03421
G2 X97.99 Y82.89 I.029 J.873 E.01689
G1 X98.065 Y83.487 E.01451
G3 X98.827 Y84.874 I-1.228 J1.578 E.03926
G1 X99.293 Y85.208 E.01381
G1 X99.691 Y85.238 E.00962
G1 X99.867 Y84.629 E.0153
G3 X101.907 Y82.43 I1.537 J-.619 E.09041
G3 X103.041 Y84.099 I.333 J.993 E.06555
G3 X101.184 Y85.612 I-1.618 J-.089 E.06499
G1 X100.935 Y85.785 E.00731
G1 X100.764 Y86.306 E.01324
M73 P41 R7
G1 X101.321 Y86.602 E.01521
G3 X102.478 Y86.498 I1.639 J11.796 E.02802
G3 X103.075 Y87.75 I-.186 J.857 E.03858
G3 X100.937 Y90.124 I-1.722 J.599 E.09388
G3 X99.893 Y89.318 I.81 J-2.129 E.03227
G2 X98.866 Y89.388 I-.451 J.947 E.02595
G3 X97.189 Y87.397 I-.392 J-1.372 E.07909
G1 X96.688 Y87.036 E.0149
G3 X95.142 Y84.068 I.218 J-2 E.09529
G1 X94.783 Y83.825 E.01045
G2 X93.8 Y83.93 I-.339 J1.477 E.0243
G3 X92.279 Y83.523 I-.292 J-1.957 E.03906
G2 X91.326 Y83.596 I-.375 J1.349 E.0235
G3 X89.243 Y82.39 I-.288 J-1.904 E.0627
G1 X88.599 Y82.446 E.01558
G3 X88.005 Y83.053 I-3.387 J-2.723 E.02052
G1 X87.93 Y83.435 E.00939
G1 X87.515 Y84.023 E.01735
G1 X88.314 Y84.131 E.01945
G3 X87.606 Y85.435 I.564 J1.15 E.15591
G2 X86.439 Y85.366 I-.628 J.72 E.03035
G3 X84.95 Y82.771 I-.333 J-1.534 E.09564
G1 X85.061 Y82.254 E.01276
G3 X86.714 Y79.449 I1.803 J-.827 E.09208
G1 X86.874 Y79.335 E.00473
G1 X87.143 Y78.872 E.01292
G3 X90.642 Y78.846 I1.746 J-.415 E.15558
G1 X90.429 Y79.451 E.01547
G2 X91.491 Y79.791 I1.037 J-1.411 E.02737
G3 X92.412 Y80.3 I-.519 J2.026 E.02564
G3 X93.913 Y80.218 I1.143 J7.208 E.03633
G3 X95.099 Y81.087 I-.433 J1.835 E.03641
G1 X95.697 Y81.184 E.01461
G3 X97.127 Y81.037 I.847 J1.206 E.03623
G1 X97.383 Y80.735 E.00954
G1 X97.488 Y80.155 E.0142
G1 X96.675 Y79.937 E.02032
G1 X96.617 Y80.108 E.00435
G2 X95.969 Y80.288 I.493 J3.022 E.01625
G3 X94.15 Y78.78 I-.22 J-1.585 E.06411
G1 X93.918 Y78.587 E.00727
G1 X93.41 Y78.473 E.01257
G3 X93.149 Y74.176 I-.55 J-2.123 E.18655
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.916 Y74.416 E-.30537
G1 X94.071 Y74.536 E-.07463
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-1.198 J-.214 P1  F42000
G1 X90.923 Y92.173 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.489 Y91.952 I.656 J.846 E.01486
G1 X92.547 Y91.902 E.02553
G1 X92.62 Y91.489 E.01013
G3 X94.09 Y93.039 I-.098 J1.565 E.05667
G3 X93.335 Y93.729 I-.964 J-.297 E.02586
G3 X92.843 Y93.861 I-.55 J-1.066 E.01237
G1 X92.678 Y94.081 E.00665
G1 X92.683 Y94.655 E.01385
G3 X93.012 Y95.435 I-.921 J.849 E.02083
G3 X89.94 Y94.523 I-1.862 J.642 E.20825
G1 X90.051 Y94.327 E.00542
G2 X89.823 Y93.442 I-.969 J-.223 E.02291
G3 X90.605 Y91.882 I1.135 J-.407 E.04704
G3 X91.414 Y91.535 I1.042 J1.314 E.02146
G1 X92.563 Y91.479 E.02776
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.225 Y91.65 E-.25957
G1 X93.487 Y91.827 E-.12043
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-1.179 J-.302 P1  F42000
G1 X91.368 Y100.112 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.913 Y98.988 I.481 J-.461 E.03907
G1 X92.022 Y98.582 E.01013
G3 X92.949 Y99.564 I-.232 J1.146 E.03469
G1 X93.329 Y99.967 E.01336
G3 X95.059 Y101.191 I.034 J1.788 E.0547
G3 X95.81 Y101.902 I-1.454 J2.287 E.02511
G3 X95.18 Y103.385 I-.912 J.488 E.04454
G3 X94.288 Y103.24 I-.195 J-1.612 E.02209
G2 X93.281 Y103.249 I-.483 J2.097 E.02452
G1 X92.993 Y103.213 E.00698
G3 X91.671 Y103.305 I-.724 J-.87 E.03414
G3 X91.307 Y102.155 I1.245 J-1.027 E.02981
G3 X91.693 Y101.618 I1.061 J.356 E.01618
G1 X91.732 Y101.224 E.00955
G1 X91.445 Y100.693 E.01454
G3 X91.967 Y98.567 I.416 J-1.025 E.07608
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.538 Y98.815 E-.23665
G1 X92.754 Y99.046 E-.11995
G1 X92.775 Y99.103 E-.0234
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-.722 J-.98 P1  F42000
G1 X88.941 Y101.928 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.546 Y101.5 I.636 J.259 E.01887
G1 X89.633 Y101.089 E.01014
G3 X89.414 Y103.43 I-.281 J1.155 E.08169
G3 X88.679 Y101.533 I.154 J-1.151 E.05982
G3 X89.576 Y101.075 I.914 J.682 E.02517
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.884 Y101.153 E-.12055
G1 X90.154 Y101.332 E-.12317
G1 X90.36 Y101.588 E-.12475
G1 X90.371 Y101.617 E-.01154
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I.441 J1.134 P1  F42000
G1 X100.536 Y97.664 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X101.923 Y97.413 I.897 J.998 E.03578
G3 X102.318 Y97.31 I.629 J1.606 E.00988
G1 X102.36 Y96.892 E.01013
G3 X102.973 Y97.438 I-.147 J.782 E.02078
G3 X103.083 Y98.443 I-.689 J.584 E.02589
G3 X102.586 Y99.822 I-1.712 J.162 E.03652
G1 X102.573 Y100.385 E.01356
G3 X102.965 Y101.31 I-1.478 J1.172 E.02454
G3 X103.31 Y102.222 I-3.449 J1.825 E.02357
G3 X102.286 Y103.4 I-1.148 J.036 E.04138
G3 X101.615 Y103.225 I-.019 J-1.298 E.01693
G3 X100.25 Y103.192 I-.586 J-4.099 E.03308
G3 X99.532 Y102.126 I2.612 J-2.532 E.03116
G1 X98.925 Y101.973 E.01509
G1 X98.61 Y102.492 E.01465
G3 X96.517 Y102.251 I-1.055 J-.042 E.08383
G1 X96.413 Y102.111 E.00422
G1 X96.361 Y101.681 E.01044
G3 X97.276 Y98.281 I1.583 J-1.397 E.10038
G3 X99.116 Y98.736 I.58 J1.603 E.04846
G1 X99.677 Y98.301 E.01713
G3 X101.901 Y96.98 I1.72 J.364 E.07007
G3 X102.303 Y96.886 I.553 J1.456 E.00999
M106 S124.95
; WIPE_START
G1 X102.674 Y97.001 E-.14777
G1 X102.973 Y97.438 E-.20094
G1 X103.007 Y97.513 E-.03129
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I.791 J-.925 P1  F42000
G1 X76.983 Y75.274 Z2.84
G1 Z2.44
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1716
M204 S5000
G3 X78.053 Y75.06 I1.08 J2.619 E.02647
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.928 Y75.297 I1.417 J2.453 E.00763
; WIPE_START
G1 F12000
M204 S6000
G1 X77.373 Y75.143 E-.17909
G1 X77.734 Y75.079 E-.13935
G1 X77.896 Y75.069 E-.06156
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-.013 J1.217 P1  F42000
G1 X103.143 Y75.33 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F1716
M204 S5000
G3 X103.356 Y75.441 I-1.226 J2.626 E.00578
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X103.088 Y75.306 I-.17 J2.893 E.02498
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.11389
G1 X102.656 Y75.441 E-.26611
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-1.215 J.072 P1  F42000
G1 X104.33 Y103.605 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F1716
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.411 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.021 E.03551
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14975
G1 X104.36 Y102.957 E-.07771
G1 X104.36 Y102.556 E-.15255
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.611 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F1716
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.01 J-2.833 E.03555
G1 X103.354 Y104.56 E.64408
M73 P42 R7
G1 X103.317 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X103.018 Y104.728 E-.12682
G1 X102.628 Y104.856 E-.15583
G1 X102.376 Y104.901 E-.09735
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F1716
M204 S5000
G3 X75.26 Y102.147 I2.463 J-1.48 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.803 J.002 E.03556
G1 X75.64 Y102.957 E.63934
G3 X75.672 Y103.545 I-3.926 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.09436
G1 X75.38 Y102.96 E-.15602
G1 X75.305 Y102.627 E-.12962
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 16/30
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G1 X77.613 Y102.049 F42000
G1 Z2.6
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X78.011 Y101.574 I.511 J.025 E.01606
G1 X78.01 Y101.154 E.01013
G3 X78.99 Y102.878 I.081 J1.094 E.0597
G3 X77.694 Y103.225 I-.914 J-.818 E.03424
G3 X77.367 Y101.497 I.857 J-1.057 E.04612
G3 X77.952 Y101.152 I.904 J.866 E.01658
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.318 Y101.177 E-.13922
G1 X78.794 Y101.406 E-.20091
G1 X78.87 Y101.479 E-.03987
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.11 J.5 P1  F42000
G1 X80.476 Y97.911 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X80.777 Y97.781 E.0079
G3 X81.159 Y97.15 I1.531 J.496 E.01794
G1 X81.292 Y97.067 E.00377
G1 X81.946 Y96.905 E.01626
G1 X81.951 Y96.485 E.01013
G3 X83.508 Y99.466 I.153 J1.818 E.10321
G3 X82.443 Y100.113 I-.87 J-.232 E.03321
G3 X81.641 Y100.079 I-.329 J-1.733 E.01952
G1 X81.143 Y100.267 E.01284
G1 X80.926 Y100.525 E.00812
G1 X81.155 Y101.087 E.01465
G3 X81.88 Y102.271 I-.474 J1.104 E.03569
G3 X81.328 Y103.096 I-1.988 J-.734 E.02417
G3 X79.979 Y102.611 I-.489 J-.757 E.03995
G3 X80.149 Y101.343 I1.113 J-.495 E.03246
G1 X79.71 Y100.898 E.0151
G3 X78.258 Y99.421 I.181 J-1.63 E.05404
G3 X78.746 Y97.651 I.471 J-.823 E.06034
G3 X79.319 Y97.741 I.182 J.707 E.01438
G3 X79.997 Y97.66 I.52 J1.473 E.0166
G1 X80.481 Y97.451 E.01272
G3 X81.125 Y96.676 I1.257 J.39 E.02494
G1 X81.893 Y96.484 E.01908
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.344 Y96.49 E-.17149
G1 X82.87 Y96.646 E-.20851
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.808 J.91 P1  F42000
G1 X88.933 Y102.027 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.533 Y101.604 I.771 J.456 E.01825
G1 X89.606 Y101.19 E.01014
G3 X89.374 Y103.431 I-.222 J1.11 E.08061
G3 X89.55 Y101.178 I.193 J-1.119 E.08092
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.851 Y101.245 E-.11721
G1 X90.118 Y101.414 E-.12026
G1 X90.326 Y101.671 E-.12549
G1 X90.342 Y101.713 E-.01704
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.974 J.73 P1  F42000
G1 X91.53 Y100.128 Z3
G1 Z2.6
G1 E.4 F1800
G1 F1696
M204 S6000
M73 P42 R6
G3 X91.883 Y99.142 I.297 J-.45 E.0346
G1 X91.949 Y98.728 E.01013
G3 X92.809 Y99.702 I-.179 J1.025 E.03384
G1 X93.218 Y100.097 E.01371
G3 X95.09 Y101.393 I-.041 J2.06 E.05819
G3 X95.731 Y101.933 I-.133 J.808 E.02121
G3 X94.52 Y103.248 I-.687 J.582 E.06288
G2 X92.623 Y103.43 I-.783 J1.806 E.04795
G3 X91.333 Y102.62 I-.4 J-.795 E.04409
G3 X91.826 Y101.388 I1.598 J-.075 E.03299
G2 X91.797 Y100.966 I-.572 J-.173 E.01042
G1 X91.454 Y100.567 E.01269
G3 X91.892 Y98.718 I.378 J-.886 E.06508
; WIPE_START
G1 F9000
G1 X92.411 Y98.888 E-.20755
G1 X92.616 Y99.089 E-.10898
G1 X92.694 Y99.236 E-.06347
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.115 J.488 P1  F42000
G1 X94.404 Y95.332 Z3
G1 Z2.6
G1 E.4 F1800
G1 F1696
M204 S6000
G3 X95.376 Y94.727 I1.137 J.744 E.02848
G1 X95.385 Y94.307 E.01013
G3 X95.571 Y97.749 I.11 J1.72 E.1314
G3 X95.143 Y98.696 I-8.017 J-3.056 E.02507
G3 X93.856 Y97.287 I-.75 J-.607 E.08004
G1 X93.955 Y96.74 E.01342
G3 X95.327 Y94.306 I1.534 J-.739 E.07901
; WIPE_START
G1 F9000
G1 X95.746 Y94.315 E-.15933
G1 X96.148 Y94.424 E-.15805
G1 X96.292 Y94.503 E-.06262
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.471 J-1.122 P1  F42000
G1 X90.982 Y92.275 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.917 Y92.172 I.609 J1.226 E.02315
G3 X92.61 Y92.037 I.741 J1.95 E.01711
G1 X92.655 Y91.619 E.01013
G3 X94.101 Y92.627 I-.258 J1.913 E.04415
G3 X93.068 Y93.743 I-.884 J.218 E.04343
G3 X92.539 Y93.752 I-.285 J-1.187 E.01286
G2 X92.759 Y94.762 I1.344 J.236 E.02557
G3 X92.94 Y95.769 I-.895 J.681 E.02563
G3 X90.997 Y97.907 I-1.786 J.328 E.08054
G1 X90.311 Y97.75 E.01699
G3 X90.164 Y94.52 I.925 J-1.66 E.09325
G2 X89.838 Y93.423 I-1.772 J-.07 E.02809
G3 X90.926 Y91.859 I1.143 J-.365 E.05307
G3 X91.89 Y91.744 I.706 J1.815 E.02365
G3 X92.597 Y91.613 I.697 J1.788 E.01746
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.219 Y91.764 E-.24328
G1 X93.476 Y91.935 E-.11718
G1 X93.515 Y91.969 E-.01954
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.122 J-.472 P1  F42000
G1 X91.241 Y86.562 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.336 Y85.311 I1.061 J-.175 E.04581
G1 X92.399 Y84.896 E.01013
G3 X93.603 Y87.094 I-.11 J1.489 E.07171
G2 X94.013 Y87.623 I1.291 J-.577 E.01631
G3 X94.675 Y88.752 I-.233 J.895 E.03506
G1 X94.891 Y88.993 E.0078
G1 X95.377 Y89.178 E.01255
G3 X97.028 Y90.405 I.16 J1.508 E.0545
G2 X98.054 Y90.598 I.726 J-1.037 E.02596
G3 X99.079 Y90.883 I-.665 J4.361 E.02571
G3 X99.461 Y91.479 I-.573 J.789 E.01747
G3 X99.738 Y92.536 I-1.82 J1.04 E.02667
G1 X100.182 Y92.904 E.0139
M73 P43 R6
G3 X101.899 Y94.303 I-.015 J1.771 E.05771
G3 X101.957 Y96.072 I-.226 J.893 E.05733
G1 X101.364 Y96.193 E.01459
G2 X100.336 Y96.248 I-.391 J2.349 E.02503
G1 X99.757 Y96.194 E.01401
G1 X99.046 Y96.467 E.01838
G3 X97.879 Y95.456 I-.133 J-1.026 E.04204
G3 X97.853 Y94.835 I2.136 J-.397 E.01504
G1 X97.505 Y94.384 E.01376
G3 X96.742 Y93.837 I.088 J-.929 E.02372
G3 X96.041 Y92.466 I1.197 J-1.477 E.03823
G2 X95.156 Y92.101 I-.808 J.704 E.02393
G3 X94.059 Y91.007 I.458 J-1.555 E.03894
G1 X93.533 Y90.8 E.01365
G3 X91.617 Y90.38 I-.607 J-1.81 E.04966
G3 X91.047 Y89.919 I.352 J-1.019 E.01805
G1 X90.466 Y89.986 E.01411
G3 X90.56 Y88.121 I-1.022 J-.987 E.16608
G1 X90.806 Y88.213 E.00632
G1 X91.299 Y88.061 E.01243
G1 X91.221 Y87.42 E.01556
G3 X92.342 Y84.887 I1.093 J-1.031 E.08495
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.696 Y84.941 E-.13615
G1 X93.089 Y85.107 E-.16208
G1 X93.254 Y85.244 E-.08176
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.193 J-.241 P1  F42000
G1 X91.341 Y75.77 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.815 Y74.725 I1.596 J.689 E.04584
G1 X92.828 Y74.305 E.01013
G3 X94.487 Y75.107 I.019 J2.078 E.04602
G3 X95.15 Y75.425 I.004 J.841 E.01837
G3 X95.728 Y76.347 I-.327 J.847 E.02812
G1 X95.808 Y76.559 E.00547
G1 X96.272 Y76.916 E.01412
G3 X97.098 Y77.024 I.255 J1.265 E.02046
G3 X97.249 Y77.856 I-.53 J.526 E.02167
G2 X97.366 Y78.391 I.735 J.12 E.01353
G2 X98.474 Y77.992 I.082 J-1.509 E.02916
G2 X99.002 Y77.643 I-.02 J-.605 E.01605
G3 X100.216 Y77.299 I1.54 J3.126 E.0306
G3 X100.691 Y78.126 I-.339 J.744 E.02454
G1 X100.788 Y78.512 E.0096
G1 X101.152 Y78.472 E.00882
G3 X102.508 Y77.004 I1.223 J-.23 E.05595
G3 X103.15 Y78.217 I-.285 J.927 E.03676
G3 X102.75 Y78.939 I-.6 J.139 E.02182
G1 X102.632 Y79.51 E.01407
G2 X102.914 Y80.126 I2.959 J-.98 E.01637
G3 X102.513 Y81.176 I-.593 J.375 E.0314
G3 X100.837 Y81.527 I-1.102 J-1.084 E.04378
G1 X100.581 Y81.574 E.00629
G1 X100.174 Y81.946 E.0133
G3 X98.749 Y82.53 I-.935 J-.251 E.04294
G1 X98.368 Y82.243 E.01148
G2 X97.753 Y83.178 I1.07 J1.375 E.02748
G1 X98.087 Y83.673 E.01441
G3 X98.666 Y84.717 I-.287 J.842 E.03157
G1 X98.706 Y85.098 E.00924
G2 X99.678 Y85.274 I.776 J-1.515 E.02416
G2 X99.956 Y84.581 I-1.507 J-1.009 E.01814
G3 X101.824 Y82.486 I1.474 J-.567 E.08338
G3 X102.959 Y84.179 I.438 J.933 E.07058
G3 X101.131 Y85.527 I-1.58 J-.229 E.06095
G2 X100.835 Y85.774 I.062 J.375 E.00976
G1 X100.679 Y86.321 E.01371
G1 X101.181 Y86.694 E.01508
G2 X101.954 Y86.52 I.088 J-1.409 E.01936
G3 X103.005 Y87.935 I.327 J.855 E.05726
G3 X102.041 Y89.975 I-1.746 J.422 E.0588
G3 X100.654 Y89.936 I-.662 J-1.167 E.03519
G3 X99.97 Y89.195 I1.028 J-1.635 E.0246
G1 X99.707 Y89.104 E.0067
G2 X98.575 Y89.391 I1.35 J7.704 E.0282
G3 X97.217 Y87.498 I-.144 J-1.329 E.06816
G1 X97.13 Y87.232 E.00676
G2 X96.175 Y86.777 I-1.019 J.911 E.02617
G3 X95.235 Y86.188 I5.437 J-9.723 E.02676
G3 X95.026 Y85.173 I.691 J-.672 E.02639
G3 X95.475 Y83.84 I2.173 J-.01 E.03454
G1 X95.449 Y83.384 E.01101
G1 X94.781 Y83.365 E.01613
G3 X92.127 Y83.19 I-1.236 J-1.459 E.0709
G1 X91.775 Y83.394 E.00983
G1 X91.718 Y83.37 E.0015
G3 X89.532 Y80.704 I-.667 J-1.682 E.11011
G2 X88.986 Y80.217 I-.704 J.239 E.01845
G2 X88.694 Y81.452 I1.115 J.916 E.03169
G2 X88.74 Y82.058 I2.384 J.124 E.01469
G3 X87.982 Y82.88 I-.983 J-.146 E.02863
G2 X87.609 Y83.887 I.777 J.86 E.02692
G2 X88.237 Y84.187 I.812 J-.894 E.01704
G3 X87.813 Y85.939 I.633 J1.081 E.14128
G3 X87.632 Y85.368 I1.152 J-.677 E.01457
G1 X87.483 Y85.201 E.00542
G1 X86.872 Y85.13 E.01483
G3 X85.009 Y82.806 I-.727 J-1.326 E.10189
G1 X85.123 Y82.59 E.00589
G2 X85.024 Y81.384 I-5.902 J-.121 E.02924
G3 X85.219 Y80.396 I2.152 J-.089 E.02451
G3 X85.866 Y79.882 I1.771 J1.568 E.02004
G3 X86.957 Y79.574 I1.21 J2.2 E.02757
G1 X87.277 Y79.033 E.01516
G3 X90.384 Y79.293 I1.613 J-.572 E.16467
G1 X90.444 Y79.52 E.00566
G1 X90.869 Y79.889 E.01356
G3 X92.3 Y80.293 I-.009 J2.769 E.03632
G1 X92.834 Y80.441 E.01336
G3 X95.062 Y81.267 I.657 J1.646 E.06279
G1 X95.665 Y81.293 E.01456
G3 X97.345 Y81.203 I.905 J1.157 E.04321
G2 X97.638 Y80.853 I-.253 J-.51 E.01132
G2 X97.502 Y79.91 I-1.28 J-.296 E.02351
G1 X96.842 Y79.81 E.01609
G3 X94.241 Y78.576 I-1.043 J-1.159 E.08843
G2 X93.313 Y78.363 I-.712 J.972 E.02362
G3 X92.344 Y78.453 I-.687 J-2.142 E.02365
G3 X91.082 Y77.415 I1.778 J-3.448 E.03972
G3 X92.77 Y74.303 I1.779 J-1.048 E.10256
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.37 Y74.364 E-.22901
G1 X93.733 Y74.492 E-.14617
G1 X93.743 Y74.499 E-.00482
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.301 J-1.179 P1  F42000
G1 X83.802 Y77.038 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X84.654 Y76.721 I.841 J.959 E.02241
G1 X84.672 Y76.302 E.01013
G3 X83.284 Y78.891 I-.04 J1.645 E.1618
G3 X84.614 Y76.299 I1.335 J-.952 E.08648
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.953 Y76.314 E-.12886
G1 X85.414 Y76.496 E-.18853
G1 X85.546 Y76.595 E-.06261
; WIPE_END
G1 E-.01999 F1800
M204 S10000
G17
G3 Z3 I-.206 J-1.199 P1  F42000
G1 X79.87 Y77.569 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.071 Y77.132 I.754 J.082 E.01181
G3 X80.179 Y77.12 I.084 J.259 E.00263
G1 X80.203 Y76.701 E.01013
G3 X81.477 Y77.355 I.142 J1.29 E.03657
G3 X80.129 Y78.721 I-1.087 J.275 E.05553
G3 X79.555 Y77.235 I.296 J-.968 E.04421
G3 X80.146 Y76.697 I.609 J.075 E.02097
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.882 Y76.815 E-.28322
G1 X81.067 Y76.896 E-.07675
G1 X81.107 Y76.93 E-.02003
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.201 J-1.2 P1  F42000
G1 X77.141 Y77.595 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X77.341 Y77.094 I4.053 J1.327 E.013
G3 X77.436 Y77.081 I.068 J.138 E.00236
G1 X77.464 Y76.662 E.01013
G3 X78.565 Y77.888 I-.175 J1.264 E.0432
G2 X78.434 Y78.566 I3.242 J.977 E.01667
G3 X76.69 Y78.46 I-.851 J-.398 E.05411
G3 X76.778 Y77.383 I.757 J-.48 E.02797
G3 X77.406 Y76.658 I.735 J.003 E.0252
M106 S124.95
M106 S127.5
; WIPE_START
G1 X77.897 Y76.806 E-.19485
G1 X78.237 Y77.071 E-.16393
G1 X78.272 Y77.115 E-.02122
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.911 J.807 P1  F42000
G1 X81.241 Y80.47 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X82.484 Y79.818 I1.402 J1.164 E.03476
G1 X82.535 Y79.401 E.01013
G3 X82.703 Y82.892 I-.288 J1.764 E.11727
G3 X81.493 Y82.717 I-.329 J-1.986 E.02995
G3 X80.109 Y82.452 I.585 J-6.813 E.03403
G3 X78.328 Y82.25 I-.761 J-1.251 E.04654
G3 X78.075 Y80.594 I.201 J-.878 E.05187
G3 X80.158 Y80.092 I1.266 J.679 E.0583
G1 X80.45 Y80.2 E.00752
G1 X80.985 Y80.132 E.013
G3 X82.477 Y79.394 I1.612 J1.383 E.04124
M106 S124.95
M106 S127.5
; WIPE_START
G1 X83.067 Y79.579 E-.23499
G1 X83.365 Y79.818 E-.14502
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-1.122 J-.471 P1  F42000
G1 X81.496 Y84.27 Z3
G1 Z2.6
G1 E.4 F1800
G1 F1696
M204 S6000
G3 X82.297 Y84.054 I.644 J.794 E.02061
G1 X82.387 Y83.643 E.01013
G3 X81.883 Y83.645 I-.248 J1.532 E.22287
G1 X82.331 Y83.631 E.0108
; WIPE_START
G1 F9000
G1 X82.68 Y83.708 E-.13604
G1 X83.038 Y83.888 E-.15213
G1 X83.219 Y84.048 E-.09183
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.237 J-1.194 P1  F42000
G1 X78.293 Y85.027 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X78.314 Y84.812 E.0052
G3 X78.095 Y83.809 I.567 J-.649 E.02652
G1 X78.206 Y83.683 E.00404
G3 X78.591 Y83.542 I.423 J.561 E.01003
G1 X78.608 Y83.122 E.01013
G3 X79.796 Y84.151 I-.206 J1.438 E.04004
G3 X79.669 Y85.29 I-1.498 J.41 E.02832
G1 X79.673 Y85.825 E.01289
G3 X79.94 Y87.315 I-1.147 J.975 E.03826
G1 X80.047 Y87.575 E.00677
G2 X80.973 Y87.906 I.806 J-.794 E.02452
G3 X81.653 Y90.451 I-.369 J1.462 E.07728
G1 X81.63 Y90.72 E.0065
G1 X82.016 Y91.16 E.01411
G2 X82.406 Y91.15 I.185 J-.383 E.00978
G1 X82.838 Y90.852 E.01264
G3 X83.892 Y89.8 I1.307 J.256 E.03811
G1 X84.009 Y89.149 E.01596
G3 X83.513 Y87.52 I2.612 J-1.686 E.04159
G3 X84.302 Y86.524 I1.572 J.434 E.0315
G3 X87.228 Y87.351 I1.172 J1.441 E.08587
G3 X86.534 Y89.499 I-.895 J.897 E.06716
G3 X85.2 Y89.815 I-1.232 J-2.219 E.03346
G1 X85.081 Y90.193 E.00955
G2 X86.281 Y90.198 I.603 J-.731 E.03134
G3 X88.757 Y91.448 I.713 J1.666 E.07619
G3 X88.603 Y92.585 I-1.102 J.429 E.02887
G1 X88.334 Y92.991 E.01176
G2 X88.84 Y94.04 I14.186 J-6.192 E.0281
G3 X87.926 Y95.247 I-.919 J.253 E.04216
G1 X87.499 Y95.555 E.01269
G2 X87.298 Y96.345 I19.191 J5.298 E.01967
G1 X87.062 Y96.712 E.01051
G1 X87.578 Y97.145 E.01625
G3 X89.183 Y98.106 I-.003 J1.826 E.04736
G3 X88.589 Y100.505 I-1.031 J1.018 E.07137
G3 X87.472 Y100.824 I-1.065 J-1.613 E.02846
G1 X87.3 Y100.903 E.00456
G1 X86.973 Y101.335 E.01307
G2 X87.06 Y102.098 I1.3 J.239 E.01879
G1 X86.964 Y102.842 E.01809
G3 X86.084 Y103.285 I-.64 J-.177 E.02676
G2 X85.551 Y103.239 I-.292 J.274 E.0141
G3 X84.848 Y103.241 I-.358 J-2.396 E.01701
G3 X83.79 Y103.215 I-.495 J-1.42 E.02608
G3 X83.371 Y101.528 I.053 J-.909 E.05573
G3 X84.351 Y100.159 I2.816 J.98 E.04117
G3 X85.514 Y99.97 I.883 J1.762 E.02885
G1 X85.789 Y99.398 E.01532
G3 X86.253 Y97.665 I2.043 J-.381 E.04473
G2 X85.125 Y96.836 I-1.237 J.5 E.03556
G3 X83.872 Y95.229 I.606 J-1.764 E.05198
G1 X83.919 Y94.379 E.02054
G3 X84.647 Y93.593 I1.369 J.539 E.02643
G3 X85.257 Y93.322 I.895 J1.194 E.01624
G1 X85.413 Y93.044 E.00769
G1 X85.419 Y92.517 E.01271
G3 X85.256 Y91.964 I1.051 J-.611 E.01406
G1 X84.628 Y91.931 E.01515
G2 X83.877 Y92.265 I3.765 J9.487 E.01984
G1 X83.6 Y92.717 E.01278
G3 X82.222 Y94.643 I-1.723 J.224 E.06283
G3 X81.118 Y94.527 I-.45 J-1.028 E.02802
G1 X80.651 Y94.243 E.01317
G1 X80.173 Y94.693 E.01583
G3 X79.627 Y96.163 I-1.9 J.131 E.03899
G3 X78.77 Y97.184 I-1.522 J-.408 E.03317
G3 X77.509 Y96.541 I.225 J-2 E.03488
G3 X77.566 Y95.617 I3.276 J-.264 E.02241
G2 X77.136 Y94.77 I-4.695 J1.851 E.02294
G3 X77.677 Y93.863 I.693 J-.202 E.02858
G2 X77.779 Y93.45 I-.107 J-.245 E.01185
G2 X77.147 Y92.818 I-1.05 J.418 E.02216
G3 X77.095 Y91.548 I.645 J-.663 E.03378
G3 X77.721 Y90.34 I1.62 J.074 E.03387
G1 X77.588 Y89.775 E.014
G3 X77.788 Y88.623 I.444 J-.516 E.03389
G2 X77.761 Y87.917 I-1.404 J-.301 E.01721
G3 X77.121 Y87.036 I1.271 J-1.597 E.02658
G3 X77.786 Y85.548 I2.462 J.207 E.04007
G2 X77.882 Y84.916 I-1.066 J-.485 E.0156
G3 X78.551 Y83.12 I.746 J-.745 E.05802
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.911 Y83.16 E-.1378
G1 X79.219 Y83.326 E-.13298
G1 X79.419 Y83.532 E-.10922
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.82 J.899 P1  F42000
G1 X96.801 Y99.373 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X97.745 Y98.683 I1.236 J.7 E.02908
G1 X97.746 Y98.263 E.01013
G3 X99.53 Y99.747 I.037 J1.769 E.06103
G3 X98.921 Y100.963 I-3.979 J-1.231 E.03294
G1 X98.538 Y101.23 E.01127
G1 X98.439 Y101.789 E.01367
G3 X97.165 Y103.451 I-.935 J.604 E.06587
G3 X96.862 Y101.622 I.472 J-1.018 E.05263
G2 X96.537 Y100.652 I-1.023 J-.197 E.02579
G3 X96.421 Y99.154 I1.488 J-.869 E.0375
G1 X96.38 Y99.132 E.00112
G3 X97.688 Y98.263 I1.709 J1.153 E.03886
M106 S124.95
M106 S127.5
; WIPE_START
G1 X98.274 Y98.317 E-.22337
G1 X98.598 Y98.441 E-.13198
G1 X98.651 Y98.479 E-.02465
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.465 J1.125 P1  F42000
G1 X100.745 Y97.613 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X101.843 Y97.487 I.687 J1.129 E.02752
G3 X102.362 Y97.259 I.682 J.851 E.0138
G1 X102.403 Y96.841 E.01013
M73 P44 R6
G3 X102.981 Y97.548 I-.108 J.679 E.02409
G3 X103.1 Y98.622 I-1.316 J.689 E.02666
G2 X102.943 Y99.058 I.288 J.35 E.01174
G3 X102.419 Y99.867 I-1.645 J-.492 E.02356
G1 X102.479 Y100.438 E.01384
G3 X103.046 Y101.6 I-9.494 J5.354 E.03121
G3 X103.124 Y102.822 I-.747 J.661 E.03181
G3 X102.4 Y103.349 I-.606 J-.073 E.02424
G3 X101.569 Y103.121 I-.13 J-1.152 E.02129
G3 X101.013 Y103.144 I-.319 J-.98 E.01357
G3 X99.865 Y102.624 I-.464 J-.502 E.03862
G3 X100.065 Y100.251 I1.404 J-1.077 E.063
G1 X100.169 Y99.7 E.01352
G3 X101.783 Y97.047 I1.241 J-1.063 E.09891
G3 X102.346 Y96.834 I.677 J.94 E.01467
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.699 Y96.945 E-.14097
G1 X102.832 Y97.094 E-.07579
G1 X102.966 Y97.502 E-.16324
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.196 J-.226 P1  F42000
G1 X101.842 Y91.566 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X102.416 Y91.335 I1.017 J1.695 E.01498
G1 X102.432 Y90.915 E.01013
G3 X103.241 Y92.181 I.013 J.884 E.04333
G3 X102.969 Y93.091 I-1.568 J.026 E.02327
G3 X101.282 Y92.173 I-.609 J-.889 E.05715
G3 X102.096 Y90.978 I1.071 J-.145 E.0382
G1 X102.374 Y90.913 E.00688
M106 S124.95
; WIPE_START
G1 X102.632 Y90.923 E-.09825
G1 X102.903 Y91.032 E-.11109
G1 X103.155 Y91.249 E-.1262
G1 X103.212 Y91.351 E-.04447
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.636 J-1.038 P1  F42000
G1 X76.984 Y75.273 Z3
G1 Z2.6
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1696
M204 S5000
G3 X78.053 Y75.06 I1.078 J2.616 E.02645
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.929 Y75.297 I1.416 J2.449 E.00765
; WIPE_START
G1 F12000
M204 S6000
G1 X77.373 Y75.143 E-.1786
G1 X77.777 Y75.073 E-.1557
G1 X77.897 Y75.068 E-.0457
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-.013 J1.217 P1  F42000
G1 X103.143 Y75.33 Z3
G1 Z2.6
G1 E.4 F1800
G1 F1696
M204 S5000
G3 X103.356 Y75.441 I-1.226 J2.626 E.00579
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X103.088 Y75.306 I-.17 J2.893 E.02497
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.11394
G1 X102.656 Y75.441 E-.26606
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-1.215 J.072 P1  F42000
G1 X104.33 Y103.605 Z3
G1 Z2.6
G1 E.4 F1800
G1 F1696
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.41 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.574 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.021 E.03551
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14975
G1 X104.36 Y102.957 E-.07771
G1 X104.36 Y102.556 E-.15254
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z3
G1 Z2.6
G1 E.4 F1800
G1 F1696
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.003 J-2.805 E.03556
G1 X103.354 Y104.56 E.64408
G1 X103.318 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.923 Y104.764 E-.1653
G1 X102.628 Y104.856 E-.1174
G1 X102.376 Y104.901 E-.09731
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z3
G1 Z2.6
G1 E.4 F1800
G1 F1696
M204 S5000
G3 X75.26 Y102.147 I2.463 J-1.48 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.863 J.018 E.03554
G1 X75.64 Y102.957 E.63933
M73 P45 R6
G3 X75.672 Y103.545 I-3.928 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.09429
G1 X75.38 Y102.96 E-.15607
G1 X75.305 Y102.627 E-.12964
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 17/30
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G1 X77.627 Y101.962 F42000
G1 Z2.76
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X78.009 Y101.585 I.557 J.181 E.01346
G1 X78.021 Y101.165 E.01013
G3 X79.108 Y102.011 I-.058 J1.197 E.03542
G3 X78.515 Y103.13 I-.849 J.266 E.03399
G3 X77.663 Y103.274 I-.515 J-.453 E.02254
G3 X77.221 Y101.808 I2.113 J-1.437 E.0375
G3 X77.963 Y101.163 I1.064 J.475 E.02447
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.257 Y101.171 E-.11185
G1 X78.568 Y101.285 E-.12566
G1 X78.825 Y101.557 E-.14249
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-.325 J1.173 P1  F42000
G1 X80.419 Y101.999 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.897 Y101.59 I.447 J.038 E.01682
G1 X80.976 Y101.177 E.01013
G3 X81.814 Y101.98 I-.192 J1.04 E.02963
G3 X81.517 Y102.933 I-1.679 J-.001 E.02445
G3 X79.999 Y102.004 I-.672 J-.607 E.0605
G3 X80.919 Y101.165 I.85 J.008 E.03371
M106 S124.95
M106 S127.5
; WIPE_START
G1 X81.222 Y101.239 E-.11837
G1 X81.494 Y101.42 E-.12437
G1 X81.701 Y101.682 E-.12683
G1 X81.711 Y101.708 E-.01042
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I1.136 J-.437 P1  F42000
G1 X80.329 Y98.117 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X80.483 Y98.063 E.00394
G1 X80.948 Y97.557 E.01657
G3 X81.397 Y97.036 I.632 J.091 E.01751
G1 X81.397 Y96.616 E.01013
G3 X82.385 Y96.654 I-.384 J22.709 E.02384
G3 X83.537 Y99.124 I-.333 J1.659 E.0764
G3 X82.119 Y99.974 I-.902 J.103 E.05014
G1 X81.524 Y99.882 E.01451
G2 X80.589 Y100.647 I3.548 J5.288 E.02917
G3 X79.012 Y100.503 I-.686 J-1.192 E.04069
G3 X78.217 Y99.379 I1.797 J-2.115 E.03354
G3 X78.982 Y97.726 I.482 J-.781 E.06423
G2 X79.716 Y97.766 I.421 J-.969 E.01811
G2 X80.245 Y97.702 I.19 J-.643 E.0132
G2 X80.817 Y96.891 I-2.626 J-2.464 E.024
G3 X81.34 Y96.615 I.622 J.544 E.01457
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.339 Y96.653 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I.589 J-1.065 P1  F42000
G1 X77.967 Y94.236 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X78.817 Y93.888 I.895 J.973 E.02261
G1 X78.855 Y93.47 E.01013
G3 X79.914 Y95.47 I-.126 J1.347 E.06465
G2 X79.218 Y96.8 I10.796 J6.497 E.03624
G3 X78.626 Y97.106 I-.574 J-.386 E.01676
G3 X77.5 Y96.662 I.161 J-2.058 E.02964
G3 X77.523 Y95.973 I.704 J-.321 E.01721
G2 X77.2 Y94.931 I-.858 J-.305 E.02821
G3 X77.525 Y93.93 I.413 J-.419 E.03143
G2 X78.205 Y93.571 I-.79 J-2.319 E.01862
G3 X78.798 Y93.465 I.557 J1.403 E.01461
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.181 Y93.544 E-.14874
G1 X79.699 Y93.863 E-.23126
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I.742 J.965 P1  F42000
G1 X82.612 Y91.624 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X83.218 Y91.177 E.01816
G3 X84.046 Y90.298 I.868 J-.012 E.03221
G1 X84.138 Y89.888 E.01013
G3 X85.109 Y90.788 I-.18 J1.168 E.03388
G1 X85.705 Y90.683 E.01458
G3 X87.238 Y90.185 I1.396 J1.693 E.0398
G3 X88.477 Y91.115 I-.299 J1.688 E.03875
G3 X88.368 Y92.668 I-.549 J.742 E.04465
G2 X88.21 Y93.068 I.48 J.42 E.01058
G2 X88.697 Y93.819 I1.207 J-.249 E.0221
G3 X87.677 Y95.19 I-.741 J.514 E.0542
G1 X87.37 Y95.719 E.01473
G3 X85.281 Y96.702 I-1.266 J.022 E.07011
G3 X84.043 Y95.044 I.459 J-1.634 E.05366
G3 X84.831 Y93.669 I.756 J-.48 E.04693
G3 X85.563 Y93.412 I.847 J1.242 E.01892
G2 X85.524 Y92.404 I-1.165 J-.461 E.02505
G1 X85.397 Y91.92 E.01206
G1 X84.747 Y91.818 E.01587
G3 X83.72 Y92.068 I-.814 J-1.107 E.02617
G1 X83.454 Y92.627 E.01491
G3 X82.464 Y94.453 I-1.753 J.231 E.05353
G3 X80.972 Y94.254 I-.674 J-.642 E.0423
G3 X81.711 Y91.319 I.878 J-1.339 E.09556
G3 X82.386 Y91.269 I.415 J1.025 E.01659
G1 X82.854 Y90.924 E.01402
G3 X84.082 Y89.875 I1.166 J.122 E.04296
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.407 Y89.952 E-.12721
G1 X84.695 Y90.122 E-.12699
G1 X84.918 Y90.367 E-.1258
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I1.212 J-.11 P1  F42000
G1 X84.612 Y86.982 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X85.561 Y86.717 I1.004 J1.759 E.024
G1 X85.62 Y86.301 E.01013
G3 X86.993 Y87.221 I-.159 J1.722 E.04155
G3 X86.277 Y89.447 I-.634 J1.024 E.07712
G3 X83.919 Y88.609 I-.786 J-1.527 E.06762
G3 X84.597 Y86.55 I.837 J-.865 E.06505
G3 X85.562 Y86.293 I.936 J1.574 E.02439
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.98 Y86.367 E-.16133
G1 X86.369 Y86.546 E-.16263
G1 X86.481 Y86.642 E-.05604
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I.868 J.853 P1  F42000
G1 X88.374 Y84.714 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.982 Y84.526 I.554 J.715 E.01568
G1 X89.068 Y84.115 E.01013
G3 X88.651 Y84.121 I-.192 J1.169 E.16946
G1 X89.011 Y84.104 E.0087
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.348 Y84.191 E-.13212
G1 X89.65 Y84.376 E-.13481
G1 X89.848 Y84.598 E-.11307
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I1.217 J-.011 P1  F42000
G1 X89.82 Y81.638 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.635 Y80.512 I1.257 J.052 E.03552
G3 X91.117 Y80.321 I.498 J.551 E.01276
G1 X91.208 Y79.909 E.01017
G3 X92.078 Y80.395 I-7.056 J13.646 E.02404
G1 X92.542 Y80.595 E.0122
G3 X94.745 Y81.034 I.781 J1.824 E.05756
G1 X94.963 Y81.383 E.00992
G2 X95.85 Y81.233 I.228 J-1.352 E.02211
G3 X97.711 Y83.041 I.69 J1.152 E.08486
G2 X98.248 Y83.741 I1.23 J-.388 E.02171
G3 X98.509 Y85.139 I-.551 J.826 E.03823
G2 X99.57 Y85.334 I.797 J-1.351 E.02656
G3 X100.669 Y86.644 I-.273 J1.345 E.04452
G2 X101.489 Y86.823 I.641 J-.968 E.02071
G3 X102.496 Y86.474 I.934 J1.068 E.02636
G3 X103.174 Y87.536 I-.237 J.899 E.03339
G1 X102.932 Y88.249 E.01815
G3 X102.826 Y88.954 I-1.379 J.155 E.0174
G3 X102.26 Y89.737 I-.56 J.191 E.02726
G3 X100.279 Y89.457 I-.876 J-.951 E.05518
G1 X99.933 Y88.934 E.0151
G1 X99.337 Y88.971 E.01441
G3 X97.362 Y87.369 I-.892 J-.919 E.0897
G2 X96.71 Y86.728 I-.783 J.144 E.02347
G3 X95.909 Y86.424 I.183 J-1.686 E.02089
G3 X95.215 Y84.883 I-.043 J-.908 E.05233
G3 X95.746 Y83.857 I1.85 J.307 E.02832
G1 X95.582 Y83.341 E.01306
G2 X94.576 Y83.522 I-.361 J.878 E.02602
G3 X92.901 Y83.583 I-.956 J-3.24 E.04084
G3 X92.147 Y83.021 I.699 J-1.725 E.02292
G3 X91.088 Y83.539 I-16.993 J-33.449 E.02843
G3 X90.629 Y83.264 I.032 J-.575 E.01343
G3 X90.396 Y80.165 I.417 J-1.589 E.09823
G3 X91.151 Y79.9 I.792 J1.05 E.01959
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.502 Y80.024 E-.14177
G1 X92.029 Y80.364 E-.23823
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I.485 J-1.116 P1  F42000
G1 X87.7 Y78.482 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.912 Y77.255 I1.215 J-.011 E.04622
G1 X88.924 Y76.836 E.01013
G3 X88.526 Y80.041 I-.052 J1.621 E.13003
G1 X88.331 Y80.659 E.01562
G3 X88.512 Y81.39 I-1.429 J.742 E.01834
G3 X87.689 Y82.888 I-.707 J.587 E.05298
G1 X87.459 Y83.43 E.0142
G3 X85.168 Y82.799 I-1.343 J.4 E.14389
G1 X85.292 Y82.573 E.00624
G1 X85.318 Y82.059 E.01239
G3 X85.2 Y81.258 I1.562 J-.64 E.01973
G3 X86.102 Y79.947 I.82 J-.401 E.04656
G3 X87.243 Y79.795 I.82 J1.793 E.02817
G1 X87.446 Y79.17 E.01584
G3 X88.866 Y76.834 I1.465 J-.709 E.07827
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.401 Y76.916 E-.20565
G1 X89.76 Y77.086 E-.15099
G1 X89.807 Y77.125 E-.02335
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I.638 J1.036 P1  F42000
G1 X91.402 Y76.143 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.919 Y74.881 I1.503 J.264 E.05176
G1 X92.995 Y74.468 E.01013
G3 X94.208 Y75.036 I-.241 J2.093 E.03288
G2 X95.381 Y75.522 I3.014 J-5.617 E.03067
G3 X95.725 Y76.567 I-.56 J.763 E.02829
G2 X96.754 Y76.875 I.77 J-.701 E.02722
G3 X97.267 Y77.824 I-.018 J.622 E.03144
G2 X97.243 Y78.471 I.527 J.344 E.0164
G3 X94.348 Y78.42 I-1.45 J.151 E.11899
G1 X94.047 Y78.183 E.00925
G1 X93.528 Y78.127 E.01259
G2 X92.846 Y78.509 I6.544 J12.47 E.01886
G3 X91.798 Y77.924 I-.175 J-.918 E.03143
G3 X92.938 Y74.456 I1.088 J-1.564 E.11764
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.537 Y74.579 E-.23251
G1 X93.873 Y74.775 E-.14749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-.519 J1.101 P1  F42000
G1 X100.806 Y78.047 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X101.043 Y78.079 E.00576
G1 X101.712 Y77.828 E.01723
G3 X102.287 Y77.416 I.928 J.687 E.01734
G1 X102.334 Y76.997 E.01016
G3 X103.162 Y78.178 I-.039 J.908 E.04017
G3 X102.802 Y78.954 I-.479 J.249 E.02382
G1 X102.66 Y79.205 E.00696
G2 X102.712 Y79.908 I1.032 J.277 E.01733
G3 X103.086 Y80.724 I-.446 J.698 E.02286
G3 X102.398 Y81.201 I-1.224 J-1.027 E.02042
G3 X100.816 Y81.458 I-1.011 J-1.222 E.04054
G2 X100.17 Y82.005 I.2 J.892 E.02121
G3 X98.416 Y81.374 I-.879 J-.309 E.07093
G1 X98.106 Y81.006 E.01161
G1 X98.134 Y80.724 E.00682
G3 X97.612 Y79.641 I1.09 J-1.192 E.02972
G2 X97.864 Y79.199 I-.101 J-.35 E.01356
G3 X98.324 Y78.575 I1.173 J.382 E.01902
G1 X99.013 Y78.348 E.01749
G1 X98.723 Y78.092 E.00934
G1 X99.105 Y77.673 E.01367
G3 X100.051 Y77.234 I17.194 J35.861 E.02516
G3 X100.614 Y77.597 I.087 J.483 E.01777
G2 X101.751 Y77.197 I.242 J-1.128 E.03058
G3 X102.245 Y76.994 I.51 J.538 E.01317
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.524 Y77.006 E-.10604
G1 X102.962 Y77.269 E-.19436
G1 X103.079 Y77.442 E-.0796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-1.169 J-.337 P1  F42000
G1 X101.486 Y82.963 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X102.17 Y82.846 I.19 J-.939 E.01711
G3 X102.328 Y82.838 I.115 J.742 E.00384
G1 X102.416 Y82.427 E.01013
G3 X102.859 Y84.209 I-.128 J.978 E.05693
G3 X101.718 Y82.567 I-1.441 J-.216 E.16766
G3 X102.36 Y82.415 I.591 J1.07 E.01611
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.653 Y82.482 E-.11408
G1 X102.895 Y82.623 E-.10651
G1 X103.142 Y82.962 E-.15941
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-1.204 J-.177 P1  F42000
G1 X101.862 Y91.673 Z3.16
G1 Z2.76
G1 E.4 F1800
M73 P46 R6
G1 F9000
M204 S6000
G3 X102.413 Y91.329 I.797 J.664 E.01594
G1 X102.465 Y90.912 E.01013
G3 X103.325 Y91.977 I-.042 J.914 E.03731
G1 X102.998 Y92.792 E.02116
G1 X103.25 Y92.668 E.00676
G3 X102.324 Y93.256 I-.722 J-.114 E.02992
G3 X101.349 Y92.091 I.072 J-1.051 E.04093
G3 X101.882 Y91.106 I1.002 J-.094 E.02864
G3 X102.407 Y90.905 I.932 J1.65 E.01361
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.901 Y91.036 E-.19411
G1 X103.106 Y91.202 E-.10015
G1 X103.23 Y91.39 E-.08574
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-1.138 J-.431 P1  F42000
G1 X100.844 Y97.689 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X101.622 Y97.535 I.638 J1.187 E.0194
G3 X102.387 Y97.221 I14.357 J33.85 E.01994
G1 X102.42 Y96.802 E.01013
G3 X102.951 Y97.614 I-.096 J.643 E.0264
G2 X103.211 Y98.27 I2.656 J-.672 E.01708
G3 X103.165 Y98.654 I-.475 J.138 E.00957
G2 X102.29 Y99.978 I12.625 J9.294 E.0383
G2 X102.729 Y101.104 I1.699 J-.013 E.0298
G2 X103.121 Y101.673 I.732 J-.085 E.01735
G3 X103.125 Y102.804 I-.724 J.568 E.02937
G3 X102.265 Y103.347 I-.598 J.005 E.0293
G3 X101.498 Y103.002 I.299 J-1.691 E.0205
G2 X100.764 Y103.308 I-.096 J.8 E.02004
G1 X100.524 Y103.386 E.00609
G3 X99.884 Y102.743 I.072 J-.712 E.0237
G2 X99.61 Y101.602 I-15.505 J3.109 E.02832
G3 X100.358 Y100.191 I1.535 J-.09 E.0405
G1 X100.254 Y99.608 E.01428
G3 X100.095 Y97.641 I1.364 J-1.1 E.05053
G3 X101.541 Y97.115 I1.498 J1.863 E.03779
G3 X102.362 Y96.798 I1.731 J3.267 E.02126
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.739 Y96.9 E-.14833
G1 X102.862 Y97.034 E-.06893
G1 X102.929 Y97.218 E-.07449
G1 X102.942 Y97.45 E-.08825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-.367 J-1.16 P1  F42000
G1 X96.932 Y99.348 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X97.92 Y98.791 I.871 J.39 E.02928
G1 X97.942 Y98.371 E.01013
G3 X99.339 Y99.56 I-.183 J1.629 E.04693
G3 X98.511 Y101.125 I-1.725 J.089 E.04482
G2 X98.525 Y102.16 I.833 J.506 E.02632
G3 X96.745 Y101.853 I-.97 J.31 E.10079
G1 X97.02 Y101.567 E.00957
G1 X96.963 Y100.985 E.0141
G3 X97.884 Y98.368 I.893 J-1.156 E.0882
M106 S124.95
M106 S127.5
; WIPE_START
G1 X98.334 Y98.447 E-.17353
G1 X98.753 Y98.675 E-.18124
G1 X98.801 Y98.721 E-.02523
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I.757 J-.953 P1  F42000
G1 X94.569 Y95.36 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X95.57 Y94.859 I1.025 J.797 E.02791
G1 X95.591 Y94.439 E.01013
G3 X97.075 Y95.819 I-.107 J1.603 E.05289
G3 X96.743 Y97.002 I-.776 J.42 E.03277
G3 X95.478 Y97.632 I-1.318 J-1.061 E.03516
G3 X95.109 Y98.72 I-6.202 J-1.498 E.02773
G3 X93.906 Y97.382 I-.706 J-.575 E.07577
G1 X94.021 Y97.201 E.00517
G1 X94.083 Y96.681 E.01262
G3 X95.533 Y94.436 I1.429 J-.668 E.07688
M106 S124.95
M106 S127.5
; WIPE_START
G1 X96.052 Y94.529 E-.2003
G1 X96.347 Y94.672 E-.12463
G1 X96.459 Y94.764 E-.05507
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I.495 J-1.112 P1  F42000
G1 X91.012 Y92.341 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.002 Y92.452 I-2.428 J26.118 E.02402
G3 X92.66 Y92.185 I.976 J1.459 E.01725
G1 X92.711 Y91.768 E.01013
G3 X93.902 Y92.269 I-.376 J2.558 E.03148
G3 X92.827 Y93.664 I-.68 J.588 E.05935
G2 X92.194 Y93.576 I-1.393 J7.691 E.01541
G1 X91.784 Y93.729 E.01058
G1 X92.194 Y94.39 E.01876
G3 X92.805 Y96.008 I-.394 J1.073 E.04729
G3 X90.999 Y97.752 I-1.723 J.023 E.06782
G3 X89.77 Y97.026 I-.328 J-.847 E.03958
G3 X90.43 Y94.546 I1.415 J-.951 E.07004
G1 X90.292 Y93.945 E.01486
G3 X91.301 Y91.959 I.638 J-.925 E.07792
G3 X91.9 Y92.014 I.207 J1.033 E.0147
G3 X92.654 Y91.761 I.819 J1.194 E.01943
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.93 Y91.795 E-.10575
G1 X93.55 Y92.026 E-.25124
G1 X93.6 Y92.06 E-.02301
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I1.125 J-.465 P1  F42000
G1 X91.392 Y86.719 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.325 Y85.408 I.903 J-.345 E.04586
G1 X92.367 Y84.99 E.01013
G3 X93.504 Y87.095 I-.092 J1.41 E.06882
G1 X93.942 Y87.604 E.01618
G3 X94.641 Y88.837 I-.159 J.905 E.03904
G2 X95.666 Y89.27 I.931 J-.776 E.02786
G3 X96.886 Y90.293 I-.16 J1.43 E.0407
G1 X97.096 Y90.381 E.00549
G1 X97.496 Y90.781 E.01364
G3 X98.77 Y90.756 I.9 J13.641 E.03076
G3 X99.465 Y91.86 I-.24 J.921 E.03464
G3 X99.568 Y92.68 I-1.734 J.635 E.02011
G2 X100.595 Y93.047 I8.032 J-20.842 E.02631
G3 X101.014 Y93.789 I-.641 J.85 E.02113
G1 X101.334 Y94.223 E.01301
G3 X102.274 Y94.505 I-.582 J3.662 E.02375
G3 X101.403 Y96.07 I-.614 J.684 E.05969
G3 X100.676 Y95.669 I-.053 J-.763 E.02115
G1 X100.28 Y95.507 E.01031
G2 X99.508 Y96.194 I.511 J1.352 E.02549
G3 X97.967 Y95.36 I-.655 J-.631 E.05702
G3 X97.999 Y94.902 I1.041 J-.157 E.01116
G2 X97.113 Y94.246 I-1.076 J.527 E.02764
G3 X96.69 Y93.574 I.44 J-.745 E.01987
G3 X96.23 Y92.408 I1.5 J-1.266 E.03079
G1 X95.778 Y92.035 E.01413
G3 X94.115 Y90.586 I-.219 J-1.428 E.06053
G3 X92.655 Y90.704 I-5.106 J-54.083 E.03532
G3 X91.921 Y90.412 I.215 J-1.608 E.01924
G3 X91.073 Y89.953 I-.033 J-.952 E.02438
G2 X90.023 Y90.18 I-.324 J1.042 E.02708
G3 X90.648 Y88.359 I-.569 J-1.213 E.15122
G2 X91.46 Y88.142 I.237 J-.743 E.0214
G2 X91.079 Y87.068 I-1.505 J-.071 E.02818
G3 X92.309 Y84.984 I1.24 J-.673 E.07012
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.676 Y85.038 E-.14102
G1 X93.022 Y85.19 E-.14348
G1 X93.218 Y85.348 E-.0955
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I.098 J-1.213 P1  F42000
G1 X81.501 Y84.405 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X82.243 Y84.16 I.716 J.922 E.01921
G1 X82.309 Y83.745 E.01013
G3 X81.867 Y83.766 I-.153 J1.439 E.20856
G1 X82.252 Y83.736 E.00932
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.622 Y83.805 E-.14282
G1 X82.967 Y83.971 E-.14559
G1 X83.15 Y84.128 E-.09159
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I1.071 J-.578 P1  F42000
G1 X81.26 Y80.626 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X81.901 Y80.045 E.02087
G3 X82.404 Y79.863 I.856 J1.581 E.01294
G1 X82.446 Y79.445 E.01013
G3 X83.473 Y80.111 I-.026 J1.165 E.03108
G3 X83.734 Y81.966 I-1.284 J1.127 E.04784
G3 X83.279 Y82.479 I-.518 J-.002 E.01806
G3 X81.511 Y82.577 I-.97 J-1.497 E.04469
G3 X80.49 Y82.527 I-.432 J-1.622 E.02505
G1 X80.004 Y82.409 E.01206
G3 X78.454 Y82.261 I-.669 J-1.185 E.03998
G3 X78.215 Y80.51 I.085 J-.903 E.05871
G3 X80.294 Y80.315 I1.123 J.791 E.05721
G1 X80.544 Y80.484 E.00728
G1 X81.066 Y80.252 E.01378
G3 X82.388 Y79.439 I1.714 J1.305 E.03828
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.723 Y79.473 E-.12803
G1 X82.999 Y79.584 E-.1131
G1 X83.247 Y79.777 E-.11938
G1 X83.276 Y79.819 E-.0195
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I1.188 J.263 P1  F42000
G1 X83.884 Y77.08 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X84.696 Y76.805 I.741 J.851 E.02121
G1 X84.713 Y76.386 E.01013
G3 X84.014 Y76.508 I-.089 J1.549 E.2179
G3 X84.656 Y76.383 I.52 J.964 E.016
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.306 Y76.521 E-.25262
G1 X85.578 Y76.717 E-.12738
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-.194 J-1.201 P1  F42000
G1 X79.923 Y77.63 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.054 Y77.067 I.808 J-.109 E.01426
G1 X80.039 Y76.647 E.01014
G2 X80.899 Y76.819 I1.71 J-6.297 E.02118
G3 X81.179 Y78.386 I-.289 J.86 E.04682
G3 X79.54 Y78.134 I-.717 J-.789 E.0458
G3 X79.649 Y76.879 I2.361 J-.426 E.03072
G3 X79.981 Y76.646 I.493 J.349 E.00997
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.54 Y76.787 E-.2192
G1 X80.899 Y76.819 E-.13697
G1 X80.956 Y76.847 E-.02383
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-.246 J-1.192 P1  F42000
G1 X77.194 Y77.625 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X77.202 Y77.611 E.00038
G3 X77.311 Y77.038 I.881 J-.13 E.01433
G1 X77.378 Y77.034 E.00162
G1 X77.486 Y76.627 E.01014
G3 X78.458 Y77.934 I-.346 J1.272 E.04233
G3 X76.716 Y78.319 I-.85 J.286 E.07258
G3 X76.787 Y77.489 I.594 J-.368 E.02155
G3 X77.194 Y76.625 I.791 J-.155 E.02465
G1 X77.431 Y76.609 E.00573
M106 S124.95
M106 S127.5
; WIPE_START
G1 X77.733 Y76.708 E-.12047
G1 X78.081 Y76.966 E-.16475
G1 X78.236 Y77.162 E-.09478
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-1.217 J.022 P1  F42000
G1 X78.386 Y85.277 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X78.314 Y84.726 E.0134
G3 X78.525 Y83.562 I.349 J-.538 E.03633
G1 X78.527 Y83.141 E.01013
G3 X79.606 Y84 I.043 J1.052 E.03624
G3 X79.477 Y85.269 I-1.183 J.521 E.03216
G1 X79.53 Y85.819 E.01333
G3 X79.756 Y87.517 I-.925 J.987 E.04472
G2 X80.544 Y87.957 I.835 J-.57 E.02255
G3 X80.309 Y90.734 I.065 J1.404 E.11535
G2 X79.992 Y91.648 I1.134 J.905 E.02379
G3 X78.198 Y92.931 I-1.452 J-.134 E.0603
G3 X77.191 Y91.452 I-.436 J-.786 E.0641
G3 X77.842 Y90.368 I1.669 J.264 E.03126
G1 X77.617 Y89.804 E.01463
G3 X77.564 Y88.772 I.234 J-.529 E.03081
G1 X77.923 Y88.558 E.01008
G2 X77.334 Y87.49 I-1.324 J.033 E.03058
G3 X77.45 Y86.127 I.864 J-.613 E.03585
G3 X77.942 Y85.607 I1.26 J.699 E.01744
G2 X77.704 Y84.629 I-.983 J-.279 E.02538
G3 X78.47 Y83.139 I.922 J-.468 E.04708
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.802 Y83.159 E-.1265
G1 X79.144 Y83.294 E-.13964
G1 X79.364 Y83.498 E-.11386
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-1.106 J.508 P1  F42000
G1 X86.352 Y98.713 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X86.495 Y98.035 I.935 J-.155 E.01709
G3 X87.537 Y97.739 I1.676 J3.914 E.02619
G1 X87.58 Y97.321 E.01013
G3 X88.906 Y97.994 I-.018 J1.679 E.03715
G3 X88.299 Y100.471 I-.722 J1.136 E.08085
G3 X87.194 Y100.596 I-.754 J-1.731 E.02722
G2 X86.878 Y101.781 I.937 J.884 E.03083
G3 X86.957 Y102.356 I-1.083 J.442 E.01416
G3 X86.573 Y103.376 I-.703 J.317 E.02918
G3 X85.86 Y103.18 I-.063 J-1.163 E.01814
G2 X85.01 Y103.154 I-.497 J2.387 E.02062
G3 X83.986 Y103.204 I-.536 J-.471 E.02759
G3 X83.122 Y101.731 I-.148 J-.903 E.05307
G1 X83.704 Y101.214 E.01878
G3 X85.492 Y100.1 I1.493 J.406 E.05586
G1 X85.681 Y100.079 E.00459
G1 X85.984 Y99.56 E.01448
G3 X86.044 Y97.942 I3.495 J-.679 E.0394
G3 X86.893 Y97.469 I.79 J.42 E.02476
G3 X87.522 Y97.316 I.607 J1.128 E.0158
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.947 Y97.361 E-.16222
G1 X88.35 Y97.513 E-.16362
G1 X88.466 Y97.596 E-.05416
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-1.21 J.127 P1  F42000
G1 X88.939 Y102.122 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.506 Y101.706 I.709 J.372 E.01755
G1 X89.575 Y101.291 E.01014
G3 X89.093 Y103.34 I-.147 J1.047 E.08472
G3 X89.518 Y101.279 I.443 J-.983 E.07024
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.819 Y101.342 E-.11703
G1 X90.088 Y101.509 E-.12
G1 X90.31 Y101.789 E-.13572
G1 X90.316 Y101.807 E-.00725
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I.837 J.883 P1  F42000
G1 X91.859 Y100.344 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X91.428 Y99.809 I-37.754 J30.008 E.01658
G3 X91.885 Y99.153 I.486 J-.148 E.02219
G1 X91.922 Y98.735 E.01013
G3 X92.745 Y99.885 I-.02 J.884 E.03954
G1 X93.254 Y100.248 E.01508
G3 X94.716 Y101.448 I.078 J1.396 E.0501
G1 X95.087 Y101.349 E.00926
G3 X95.934 Y102.334 I-1.523 J2.165 E.03165
G3 X94.306 Y103.034 I-.892 J.168 E.05916
G1 X93.787 Y102.908 E.01287
G1 X92.974 Y103.124 E.02029
G3 X91.373 Y102.367 I-.746 J-.493 E.06158
G3 X92.041 Y101.508 I1.131 J.189 E.02734
G1 X91.685 Y101.031 E.01433
G1 X91.694 Y100.891 E.00339
G1 X91.426 Y100.435 E.01276
G3 X91.864 Y98.73 I.49 J-.783 E.05628
M106 S124.95
; WIPE_START
G1 X92.367 Y98.855 E-.19686
G1 X92.573 Y99.039 E-.10485
G1 X92.681 Y99.214 E-.07828
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I1.018 J-.667 P1  F42000
G1 X76.983 Y75.274 Z3.16
G1 Z2.76
M73 P47 R6
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1542
M204 S5000
G3 X78.053 Y75.06 I1.078 J2.611 E.02648
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.928 Y75.297 I1.415 J2.445 E.00763
; WIPE_START
G1 F12000
M204 S6000
G1 X77.373 Y75.143 E-.17901
G1 X77.777 Y75.073 E-.15597
G1 X77.896 Y75.068 E-.04503
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-.013 J1.217 P1  F42000
G1 X103.143 Y75.33 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F1542
M204 S5000
G3 X103.356 Y75.441 I-1.226 J2.626 E.00579
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X103.088 Y75.306 I-.17 J2.893 E.02497
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.11395
G1 X102.656 Y75.441 E-.26606
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-1.215 J.072 P1  F42000
G1 X104.33 Y103.605 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F1542
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.682 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.41 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.872 J-.021 E.03552
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14976
G1 X104.36 Y102.957 E-.0777
G1 X104.36 Y102.556 E-.15254
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F1542
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.008 J-2.825 E.03555
G1 X103.354 Y104.56 E.64408
G1 X103.318 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.917 Y104.767 E-.16787
G1 X102.628 Y104.856 E-.11498
G1 X102.376 Y104.9 E-.09715
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.603 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F1542
M204 S5000
G3 X75.26 Y102.147 I2.448 J-1.475 E.03692
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.804 J.002 E.03556
G1 X75.64 Y102.957 E.63934
G3 X75.672 Y103.543 I-3.913 J.506 E.01416
; WIPE_START
G1 F12000
M204 S6000
M73 P48 R6
G1 X75.528 Y103.343 E-.09372
G1 X75.38 Y102.96 E-.15609
G1 X75.305 Y102.625 E-.13019
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 18/30
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G1 X77.641 Y102.02 F42000
G1 Z2.92
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X78.124 Y101.597 I.461 J.039 E.01712
G1 X78.238 Y101.193 E.01013
G3 X79.078 Y102.358 I-.364 J1.148 E.03712
G3 X78.601 Y102.995 I-.808 J-.107 E.02007
G3 X77.765 Y103.41 I-.751 J-.463 E.02371
G3 X77.407 Y102.592 I.55 J-.729 E.02249
G3 X78.183 Y101.175 I.681 J-.548 E.0497
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.466 Y101.265 E-.113
G1 X78.752 Y101.473 E-.13424
G1 X78.902 Y101.789 E-.13277
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.254 J1.19 P1  F42000
G1 X80.447 Y102.119 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X80.643 Y101.762 I-.657 J-.593 E.0099
G3 X80.889 Y101.696 I.211 J.293 E.00628
G1 X80.971 Y101.283 E.01014
G1 X81.178 Y101.333 E.00514
G3 X81.635 Y102.006 I-.17 J.607 E.02132
G3 X80.214 Y101.737 I-.8 J.336 E.09028
G3 X80.611 Y101.306 I.481 J.045 E.01518
G1 X80.915 Y101.27 E.00739
M106 S124.95
M106 S127.5
; WIPE_START
G1 X81.178 Y101.333 E-.103
G1 X81.469 Y101.513 E-.12984
G1 X81.613 Y101.695 E-.08808
G1 X81.624 Y101.85 E-.05908
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I1.168 J-.34 P1  F42000
G1 X80.547 Y98.154 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X81.177 Y97.129 I-2.263 J-2.096 E.02919
G3 X81.504 Y97.05 I.33 J.648 E.00819
G1 X81.611 Y96.643 E.01014
G2 X82.425 Y96.884 I1.112 J-2.26 E.02057
G3 X83.457 Y98.897 I-.377 J1.465 E.06161
G3 X81.944 Y99.763 I-.808 J.343 E.06148
G2 X80.981 Y100.03 I-.314 J.739 E.02601
G3 X79.225 Y100.467 I-1.009 J-.308 E.05246
G3 X78.585 Y99.735 I.896 J-1.428 E.02379
G3 X77.822 Y98.911 I6.398 J-6.701 E.0271
G3 X79.376 Y97.997 I.889 J-.267 E.05959
G3 X80.156 Y97.939 I.507 J1.543 E.01905
G2 X80.715 Y97.054 I-.918 J-1.199 E.02578
G3 X81.556 Y96.626 I.802 J.535 E.02377
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.059 Y96.847 E-.20888
G1 X82.425 Y96.884 E-.13979
G1 X82.5 Y96.918 E-.03133
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.598 J-1.06 P1  F42000
G1 X77.871 Y94.307 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X78.542 Y94.009 I-1.17 J-3.538 E.01774
G3 X78.742 Y93.99 I.146 J.486 E.00488
G1 X78.78 Y93.572 E.01013
G3 X79.788 Y93.957 I.047 J1.387 E.02671
G3 X79.541 Y95.752 I-1.331 J.732 E.0468
G3 X79.111 Y96.825 I-8.955 J-2.969 E.02791
G3 X78.377 Y96.949 I-.463 J-.503 E.01898
G3 X77.562 Y96.772 I-.094 J-1.526 E.02036
G3 X77.713 Y95.794 I.455 J-.431 E.02753
G2 X77.466 Y95.146 I-2.347 J.523 E.01677
G3 X76.951 Y94.401 I.332 J-.78 E.02305
G3 X77.924 Y93.866 I.974 J.619 E.02792
G3 X78.723 Y93.567 I.847 J1.046 E.02094
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.269 Y93.641 E-.20966
G1 X79.652 Y93.874 E-.17034
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.737 J.968 P1  F42000
G1 X83.208 Y91.168 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X83.492 Y90.606 I-2.225 J-1.479 E.01522
G3 X84.034 Y90.363 I.746 J.937 E.01449
G1 X84.103 Y89.949 E.01013
G3 X83.727 Y92.002 I-.127 J1.038 E.08221
G1 X83.564 Y92.108 E.0047
G1 X83.266 Y92.55 E.01285
G3 X82.637 Y94.13 I-1.522 J.309 E.04339
G3 X80.908 Y93.993 I-.846 J-.296 E.05679
G3 X81.461 Y91.541 I.981 J-1.067 E.07332
G3 X82.374 Y91.304 I.639 J.586 E.02404
G2 X83.073 Y90.479 I-.316 J-.977 E.02747
G3 X84.046 Y89.939 I.917 J.505 E.0283
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.356 Y90.005 E-.12027
G1 X84.638 Y90.166 E-.12357
G1 X84.856 Y90.403 E-.12236
G1 X84.872 Y90.436 E-.0138
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.915 J.802 P1  F42000
G1 X85.989 Y91.711 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X86.195 Y90.928 I.343 J-.329 E.02341
G2 X86.95 Y90.786 I-.201 J-3.154 E.01857
G1 X86.958 Y90.366 E.01013
G3 X88.234 Y91.023 I.053 J1.466 E.03616
G3 X88.494 Y92.558 I-.279 J.837 E.046
G1 X88.074 Y92.77 E.01135
G2 X88.482 Y93.636 I.894 J.108 E.02434
G3 X87.592 Y95.141 I-.527 J.704 E.06202
G2 X87.242 Y96.223 I1.278 J1.01 E.02802
G3 X85.175 Y96.467 I-1.119 J-.6 E.05886
G3 X84.27 Y95.409 I.551 J-1.387 E.03492
G1 X83.965 Y94.89 E.01452
G3 X85.128 Y93.737 I.86 J-.295 E.04913
G3 X85.882 Y93.643 I.569 J1.492 E.01851
G1 X86.063 Y93.356 E.00819
G1 X85.993 Y92.794 E.01366
G3 X85.584 Y91.828 I.846 J-.929 E.02609
G3 X86.453 Y90.484 I.738 J-.476 E.04859
G3 X86.9 Y90.365 I.44 J.754 E.01129
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.289 Y90.386 E-.14796
G1 X87.66 Y90.51 E-.14886
G1 X87.837 Y90.639 E-.08317
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.919 J-.798 P1  F42000
G1 X84.709 Y87.034 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X85.625 Y86.925 I-1.125 J-13.282 E.02225
G1 X85.72 Y86.515 E.01013
G3 X86.665 Y87.082 I-.268 J1.52 E.02719
G3 X87.237 Y88.949 I-.444 J1.157 E.05421
G3 X86.457 Y89.386 I-.839 J-.584 E.02232
G2 X85.621 Y89.45 I-.333 J1.146 E.02065
G3 X84.228 Y88.744 I-.076 J-1.576 E.03939
G3 X84.901 Y86.624 I.513 J-1.004 E.0764
G3 X85.663 Y86.503 I.592 J1.264 E.01887
M106 S124.95
M106 S127.5
; WIPE_START
G1 X86.009 Y86.579 E-.13454
G1 X86.345 Y86.767 E-.14599
G1 X86.531 Y86.95 E-.09947
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.916 J.801 P1  F42000
G1 X88.243 Y84.994 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.93 Y84.598 I.752 J.511 E.01979
G1 X89.012 Y84.186 E.01013
G3 X88.37 Y86.288 I-.142 J1.106 E.09357
G3 X87.988 Y85.961 I.013 J-.402 E.01311
G3 X88.955 Y84.174 I.886 J-.676 E.06169
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.282 Y84.248 E-.12735
G1 X89.581 Y84.421 E-.13111
G1 X89.796 Y84.657 E-.12155
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I1.213 J.097 P1  F42000
G1 X90.021 Y81.846 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.569 Y80.724 I1.178 J-.12 E.03173
G3 X90.97 Y80.337 I.63 J.251 E.01383
G1 X90.972 Y79.917 E.01013
G3 X91.849 Y80.485 I.096 J.814 E.02732
G2 X92.131 Y80.635 I.311 J-.243 E.00793
G2 X93.219 Y80.547 I.214 J-4.139 E.02639
G3 X94.884 Y81.714 I.015 J1.751 E.05233
G2 X95.96 Y81.303 I-.043 J-1.726 E.02831
G3 X97.496 Y83.252 I.554 J1.143 E.08298
G2 X98.413 Y83.877 I2.419 J-2.562 E.02687
G3 X98.565 Y84.943 I-.7 J.644 E.0276
G2 X99.064 Y85.418 I1.052 J-.605 E.01684
G3 X100.62 Y86.523 I.222 J1.334 E.05108
G1 X100.661 Y86.742 E.00538
G1 X101.095 Y86.955 E.01165
G1 X101.622 Y86.809 E.01319
G3 X102.983 Y87.89 I.678 J.544 E.06565
G2 X102.909 Y89.124 I.971 J.677 E.03138
G3 X102.321 Y89.73 I-.528 J.076 E.0235
G2 X101.68 Y89.965 I.247 J1.668 E.01659
G3 X100.862 Y89.956 I-.377 J-2.765 E.01978
G3 X99.961 Y88.232 I1.827 J-2.053 E.04795
G1 X99.658 Y88.203 E.00735
G3 X98.229 Y89.258 I-1.275 J-.231 E.0472
G3 X97.196 Y87.933 I.422 J-1.394 E.04318
G3 X97.775 Y87.055 I2.104 J.757 E.0256
G2 X96.691 Y86.536 I-.892 J.47 E.03105
G3 X96.156 Y86.354 I.075 J-1.095 E.01378
G3 X95.441 Y84.742 I-.293 J-.835 E.0636
G3 X95.953 Y83.914 I1.574 J.403 E.02383
G1 X95.761 Y83.363 E.01409
G1 X95.536 Y83.121 E.00797
G2 X94.575 Y83.5 I.074 J1.595 E.02537
G3 X93.702 Y83.492 I-.429 J-.858 E.02188
G3 X92.278 Y82.882 I-.169 J-1.571 E.03902
G1 X91.709 Y83.091 E.01462
G3 X91.028 Y83.636 I-.947 J-.486 E.02167
G3 X90.515 Y83.045 I.282 J-.763 E.01968
G3 X90.228 Y80.47 I.555 J-1.365 E.07634
G3 X90.914 Y79.917 I.877 J.386 E.02206
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.422 Y79.975 E-.19456
G1 X91.666 Y80.188 E-.1231
G1 X91.752 Y80.328 E-.06234
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.669 J-1.017 P1  F42000
G1 X87.989 Y77.853 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.929 Y77.359 I.891 J.554 E.02686
G1 X89.006 Y76.947 E.01013
G3 X88.384 Y79.903 I-.146 J1.513 E.12333
G3 X87.383 Y78.434 I.477 J-1.4 E.046
G3 X88.95 Y76.936 I1.543 J.045 E.05793
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.346 Y77.011 E-.15339
G1 X89.662 Y77.156 E-.13218
G1 X89.857 Y77.31 E-.09443
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.371 J1.159 P1  F42000
G1 X92.857 Y76.351 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X93.349 Y76.656 E.01398
G1 X94.107 Y76.087 E.02286
G3 X94.419 Y75.786 I.62 J.329 E.01065
G1 X94.375 Y75.363 E.01024
G3 X95.15 Y75.406 I-.427 J14.904 E.01873
G3 X95.713 Y76.625 I-.347 J.9 E.03581
G2 X96.538 Y76.912 I.676 J-.614 E.02196
G3 X97.352 Y77.478 I.274 J.474 E.0299
G3 X97.05 Y78.192 I-4.379 J-1.43 E.01873
G3 X95.204 Y79.826 I-1.272 J.423 E.07547
G1 X94.743 Y79.53 E.01322
G3 X94.798 Y77.743 I1.229 J-.857 E.0462
G1 X94.469 Y77.219 E.01491
G1 X94.175 Y77.125 E.00744
G1 X93.687 Y77.448 E.0141
G3 X92.866 Y78.508 I-1.5 J-.314 E.03347
G3 X91.881 Y78.103 I-.199 J-.917 E.02733
G2 X91.305 Y77.054 I-6.552 J2.912 E.02888
G3 X91.426 Y75.442 I1.481 J-.7 E.04078
G1 X91.744 Y75.947 E.01439
G1 X92.304 Y76.06 E.01378
G3 X93.339 Y76.138 I.465 J.729 E.02685
G3 X94.294 Y75.368 I13.347 J15.553 E.02959
G1 X94.317 Y75.361 E.00058
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.15 Y75.406 E-.31715
G1 X95.299 Y75.478 E-.06285
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.535 J1.093 P1  F42000
G1 X100.946 Y78.24 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X101.671 Y78.111 E.01776
G3 X102.149 Y77.473 I1.086 J.316 E.01965
G1 X102.301 Y77.438 E.00376
G1 X102.317 Y77.018 E.01013
G3 X103.166 Y78.119 I.009 J.871 E.03883
G3 X102.765 Y78.958 I-.42 J.314 E.02755
G1 X102.607 Y79.178 E.00653
G1 X102.53 Y79.696 E.01262
G2 X102.871 Y80.041 I.372 J-.026 E.01272
G3 X102.853 Y81.009 I-.246 J.48 E.029
G3 X101.506 Y81.463 I-3.708 J-8.775 E.03431
G3 X100.638 Y81.242 I-.121 J-1.343 E.02203
G1 X100.205 Y81.684 E.01491
G3 X98.612 Y81.199 I-.885 J.049 E.08218
G1 X98.38 Y80.684 E.01362
G3 X97.775 Y79.755 I.803 J-1.183 E.02744
G2 X97.942 Y78.998 I-5.176 J-1.535 E.01872
G3 X98.626 Y78.484 I.868 J.443 E.02136
G2 X99.078 Y77.827 I-22.129 J-15.73 E.01922
G2 X99.894 Y77.253 I-4.302 J-6.98 E.02409
G3 X100.675 Y77.861 I.248 J.487 E.02986
G1 X101.405 Y77.732 E.01788
G3 X102.259 Y77.016 I1.052 J.388 E.02811
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.84 Y77.147 E-.22621
G1 X102.972 Y77.27 E-.06871
G1 X103.057 Y77.477 E-.08508
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-1.174 J-.322 P1  F42000
G1 X101.516 Y83.1 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X102.018 Y82.949 I.156 J-.392 E.01364
G2 X102.5 Y82.395 I-.041 J-.521 E.01961
G3 X103.174 Y83.066 I-.925 J1.603 E.02319
G3 X103.245 Y83.876 I-1.923 J.577 E.01973
G2 X102.633 Y84.505 I2.177 J2.731 E.02122
G3 X101.97 Y85.32 I-5.052 J-3.432 E.02537
G3 X100.853 Y85.205 I-.478 J-.84 E.02888
G3 X101.656 Y82.688 I.564 J-1.207 E.09266
G3 X102.446 Y82.374 I.999 J1.363 E.02071
M106 S124.95
M106 S127.5
; WIPE_START
G1 X103.057 Y82.841 E-.29215
G1 X103.163 Y83.046 E-.08785
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-1.206 J-.164 P1  F42000
M73 P49 R6
G1 X101.983 Y91.711 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X102.438 Y91.358 I.485 J.155 E.01478
G1 X102.469 Y90.939 E.01013
G3 X103.224 Y92.193 I-.053 J.886 E.04151
G3 X103.234 Y92.988 I-1.245 J.413 E.01948
G3 X101.728 Y92.956 I-.734 J-.887 E.03959
G3 X101.452 Y92.156 I.67 J-.679 E.02114
G3 X101.726 Y91.31 I.99 J-.147 E.02223
G3 X102.411 Y90.935 I.754 J.563 E.01942
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.908 Y91.059 E-.19469
G1 X103.226 Y91.385 E-.1729
G1 X103.235 Y91.416 E-.01241
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-1.136 J-.436 P1  F42000
G1 X100.789 Y97.784 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X101.582 Y97.678 I1.058 J4.871 E.0193
G3 X102.444 Y97.195 I2.268 J3.041 E.0239
G1 X102.476 Y96.776 E.01014
G3 X102.998 Y97.508 I-.016 J.563 E.02509
G1 X103.1 Y98.011 E.01236
G3 X102.907 Y98.904 I-.339 J.395 E.02694
G3 X102.077 Y99.814 I-7.819 J-6.296 E.0297
G2 X102.427 Y100.871 I1.655 J.038 E.02737
G2 X102.925 Y101.515 I1.418 J-.582 E.01987
G3 X103.144 Y102.736 I-.519 J.724 E.03311
G3 X102.749 Y103.46 I-.64 J.121 E.02155
G3 X102.052 Y103.207 I-.004 J-1.074 E.01827
G3 X101.551 Y102.944 I.149 J-.894 E.01388
G1 X101.002 Y103.113 E.01386
G3 X100.136 Y103.331 I-.536 J-.302 E.02409
G3 X99.922 Y102.378 I.899 J-.702 E.02434
G2 X99.736 Y101.609 I-11.138 J2.282 E.01908
G3 X100.46 Y100.299 I1.406 J-.078 E.03803
G2 X100.43 Y99.581 I-1.565 J-.296 E.01748
G3 X100.023 Y98.676 I1.079 J-1.03 E.0244
G3 X100.834 Y97.361 I.733 J-.455 E.0461
G3 X101.478 Y97.252 I.593 J1.537 E.01586
G3 X102.419 Y96.77 I1.853 J2.462 E.02562
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.801 Y96.874 E-.15049
G1 X102.913 Y96.99 E-.06127
G1 X102.984 Y97.427 E-.16824
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.409 J-1.146 P1  F42000
G1 X96.992 Y99.567 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X97.504 Y98.837 I1.147 J.26 E.02207
G3 X97.755 Y98.831 I.178 J2.172 E.00605
G1 X97.795 Y98.412 E.01015
G3 X99.278 Y99.523 I-.265 J1.899 E.04663
G3 X99.079 Y100.323 I-.903 J.202 E.02062
G3 X98.254 Y101.072 I-1.274 J-.576 E.02764
G2 X98.336 Y101.882 I.956 J.312 E.0202
G1 X98.495 Y102.293 E.01063
G3 X97.376 Y103.447 I-.969 J.18 E.04534
G3 X96.797 Y103.109 I-.136 J-.433 E.0182
G3 X97.228 Y101.549 I.863 J-.601 E.04454
G1 X97.119 Y100.911 E.01562
G3 X96.776 Y99.043 I.752 J-1.103 E.05095
G3 X97.737 Y98.41 I.853 J.251 E.03017
M106 S124.95
M106 S127.5
; WIPE_START
G1 X98.546 Y98.678 E-.32392
G1 X98.651 Y98.782 E-.05608
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.776 J-.938 P1  F42000
G1 X94.579 Y95.413 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X95.305 Y95.035 I1.776 J2.527 E.01979
G3 X95.604 Y95.024 I.172 J.584 E.00731
G1 X95.691 Y94.613 E.01013
G3 X96.826 Y95.523 I-.369 J1.623 E.03629
G3 X96.359 Y97.144 I-.592 J.707 E.05134
G3 X95.654 Y97.425 I-.983 J-1.436 E.01846
G1 X95.463 Y97.598 E.00621
G1 X95.256 Y98.08 E.01265
G3 X94.126 Y97.339 I-.863 J.084 E.09402
G1 X94.313 Y96.794 E.01389
G3 X93.986 Y95.656 I2.414 J-1.31 E.02877
G3 X94.548 Y94.96 I.868 J.127 E.02264
G3 X95.634 Y94.601 I.992 J1.18 E.02827
M106 S124.95
M106 S127.5
; WIPE_START
G1 X96.272 Y94.825 E-.25692
G1 X96.519 Y95.034 E-.12308
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.557 J-1.082 P1  F42000
G1 X91.782 Y92.597 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X92.543 Y92.396 I.157 J-.948 E.01956
G3 X92.697 Y92.37 I.128 J.291 E.00378
G1 X92.725 Y91.951 E.01013
G3 X93.582 Y92.062 I-.101 J4.123 E.02089
G3 X92.629 Y93.492 I-.345 J.803 E.07385
G2 X92.227 Y93.429 I-.269 J.398 E.01012
G2 X91.441 Y93.915 I.727 J2.056 E.02247
G3 X91.2 Y92.006 I-.536 J-.902 E.10025
G2 X92.403 Y91.994 I.592 J-.971 E.03056
G1 X92.667 Y91.946 E.00649
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.582 Y92.062 E-.35046
G1 X93.647 Y92.105 E-.02954
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.875 J-.846 P1  F42000
G1 X90.719 Y95.132 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.384 Y94.999 I.57 J1.125 E.01654
G3 X91.76 Y94.831 I.618 J.878 E.01001
G1 X91.758 Y94.411 E.01014
G3 X92.6 Y96.218 I.084 J1.061 E.06229
G3 X91.288 Y97.525 I-1.456 J-.15 E.04836
G3 X89.814 Y96.679 I-.63 J-.609 E.05593
G3 X91.25 Y94.593 I1.385 J-.584 E.07265
G3 X91.7 Y94.409 I.695 J1.058 E.01179
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.24 Y94.485 E-.20709
G1 X92.618 Y94.738 E-.17291
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-1.211 J-.119 P1  F42000
G1 X92.08 Y100.216 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X91.608 Y99.967 I-1.043 J1.407 E.01293
G3 X91.872 Y99.167 I.291 J-.348 E.02608
G1 X91.899 Y98.748 E.01013
G3 X92.713 Y99.974 I-.04 J.909 E.04132
G1 X93.2 Y100.454 E.01649
G1 X93.35 Y100.368 E.00417
G3 X94.453 Y101.146 I-.116 J1.336 E.03412
G2 X95.398 Y101.719 I1.495 J-1.4 E.02698
G3 X94.291 Y102.966 I-.354 J.8 E.07935
G1 X93.72 Y102.766 E.0146
G3 X93.173 Y102.827 I-.397 J-1.086 E.01339
G3 X91.627 Y103.28 I-.942 J-.351 E.04505
G3 X91.715 Y101.916 I.659 J-.642 E.03713
G2 X92.247 Y101.023 I-1.648 J-1.588 E.02529
G2 X91.336 Y100.291 I-1.581 J1.033 E.02866
G3 X91.842 Y98.743 I.569 J-.671 E.05019
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.115 Y98.768 E-.10426
G1 X92.375 Y98.886 E-.10845
G1 X92.626 Y99.137 E-.13503
G1 X92.652 Y99.218 E-.03227
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.765 J-.947 P1  F42000
G1 X88.959 Y102.199 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.499 Y101.807 I.585 J.236 E.01697
G1 X89.572 Y101.393 E.01013
G3 X90.281 Y102.922 I-.165 J1.006 E.04785
G1 X89.859 Y103.363 E.01472
G3 X89.515 Y101.381 I-.337 J-.962 E.08534
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.812 Y101.449 E-.11566
G1 X90.085 Y101.626 E-.12366
G1 X90.295 Y101.897 E-.13005
G1 X90.301 Y101.924 E-.01063
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.792 J-.924 P1  F42000
G1 X86.479 Y98.65 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X86.901 Y97.921 I.35 J-.284 E.0262
G1 X87.003 Y97.514 E.01013
G2 X87.586 Y97.516 I.294 J-.722 E.01442
G3 X88.669 Y97.98 I-.053 J1.62 E.0291
G3 X88.533 Y100.332 I-.45 J1.154 E.07507
G3 X87.951 Y100.401 I-.344 J-.415 E.01494
G3 X86.119 Y98.872 I-.356 J-1.436 E.06693
G3 X86.947 Y97.499 I.715 J-.505 E.04884
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.201 Y97.565 E-.09978
G1 X87.586 Y97.516 E-.14755
G1 X87.931 Y97.572 E-.13266
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.87 J-.851 P1  F42000
G1 X84.279 Y101.308 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X85.032 Y100.635 I1.045 J.412 E.02527
G1 X85.194 Y100.532 E.00463
G1 X85.254 Y100.116 E.01015
G3 X86.664 Y101.131 I-.349 J1.972 E.04334
G2 X86.854 Y101.925 I2.357 J-.145 E.01981
G2 X86.949 Y102.457 I2.116 J-.103 E.01305
G3 X86.76 Y103.381 I-.892 J.299 E.02383
G3 X85.993 Y103.234 I-.217 J-.947 E.01937
G1 X85.598 Y102.895 E.01255
G3 X84.716 Y103.442 I-25.164 J-39.661 E.02502
G3 X83.987 Y103.172 I-.006 J-1.104 E.01916
G3 X83.524 Y101.483 I-.173 J-.86 E.06357
G1 X83.891 Y101.143 E.01206
G3 X84.843 Y100.258 I1.372 J.52 E.03248
G3 X85.197 Y100.103 I.368 J.362 E.00954
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.67 Y100.206 E-.18369
G1 X86.106 Y100.482 E-.19631
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I1.128 J.457 P1  F42000
G1 X91.608 Y86.91 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.283 Y85.522 I.728 J-.504 E.0452
G1 X92.325 Y85.104 E.01013
G3 X93.415 Y87.067 I-.037 J1.304 E.06519
G1 X93.55 Y87.335 E.00725
G2 X94.425 Y87.865 I2.745 J-3.549 E.02472
G3 X94.549 Y89.026 I-.78 J.671 E.02995
G1 X95.088 Y89.417 E.01605
G3 X96.823 Y90.668 I.401 J1.272 E.05984
G2 X97.419 Y91.05 I1.013 J-.926 E.01726
G2 X98.269 Y90.815 I-.244 J-2.537 E.02138
G3 X99.33 Y92.109 I.295 J.84 E.05248
G1 X99.367 Y92.685 E.01393
G1 X99.91 Y92.93 E.01436
G3 X100.967 Y93.865 I.155 J.89 E.03909
G1 X101.022 Y94.006 E.00364
G1 X101.445 Y94.365 E.01338
G3 X101.152 Y95.901 I.253 J.844 E.08719
G3 X100.616 Y95.287 I.138 J-.662 E.02109
G1 X100.039 Y95.122 E.01449
G2 X99.624 Y95.975 I1.141 J1.081 E.02321
G3 X98.029 Y95.298 I-.783 J-.372 E.06394
G1 X98.15 Y94.93 E.00935
G1 X97.976 Y94.625 E.00847
G2 X97 Y94.147 I-16.933 J33.374 E.02621
G3 X96.628 Y93.171 I1.275 J-1.044 E.02562
G3 X96.43 Y92.4 I1.44 J-.781 E.0194
G2 X95.512 Y91.946 I-.771 J.403 E.02639
G3 X94.252 Y90.649 I.017 J-1.277 E.04845
G2 X93.079 Y90.518 I-.674 J.719 E.03053
G3 X92.168 Y90.342 I-.158 J-1.628 E.02268
G3 X91.033 Y89.802 I-.285 J-.866 E.03345
G2 X89.92 Y90.13 I-.112 J1.671 E.02858
G3 X88.648 Y89.939 I-.505 J-.967 E.03318
G3 X90.516 Y88.365 I.799 J-.948 E.10414
G1 X90.713 Y88.858 E.01282
G2 X91.455 Y88.621 I-.066 J-1.485 E.01902
G1 X91.738 Y88.111 E.01405
G2 X91.334 Y87.255 I-1.282 J.081 E.02339
G3 X92.267 Y85.098 I.993 J-.85 E.0704
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.621 Y85.138 E-.13547
G1 X92.955 Y85.274 E-.13698
G1 X93.178 Y85.448 E-.10756
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.651 J-1.028 P1  F42000
G1 X85.591 Y80.643 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X86.349 Y80.467 I.466 J.285 E.02089
G3 X86.87 Y80.388 I.439 J1.138 E.01281
G1 X86.895 Y79.968 E.01013
G3 X88.159 Y80.727 I-.084 J1.573 E.03699
G3 X88.713 Y81.861 I-10.597 J5.871 E.03045
G3 X87.472 Y82.79 I-.892 J.101 E.04508
G1 X87.319 Y83.428 E.01581
G3 X85.526 Y85.022 I-1.268 J.379 E.07243
G3 X84.82 Y83.748 I.42 J-1.065 E.03806
G3 X85.312 Y82.81 I1.387 J.13 E.02619
G1 X86.035 Y82.394 E.02012
G1 X85.406 Y82.217 E.01576
G2 X85.393 Y81.454 I-1.507 J-.356 E.0186
G3 X86.387 Y80.036 I.621 J-.623 E.05931
G1 X86.838 Y79.965 E.01099
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.228 Y80.011 E-.14919
G1 X87.6 Y80.161 E-.15255
G1 X87.762 Y80.288 E-.07826
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.723 J-.979 P1  F42000
G1 X83.774 Y77.341 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X84.661 Y76.897 I.865 J.619 E.02487
G1 X84.741 Y76.484 E.01014
G3 X83.44 Y78.817 I-.137 J1.453 E.13975
G3 X83.176 Y77.773 I.472 J-.675 E.02831
G3 X84.684 Y76.47 I1.472 J.18 E.05271
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.162 Y76.587 E-.18674
G1 X85.597 Y76.85 E-.19326
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.151 J-1.208 P1  F42000
G1 X79.993 Y77.553 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.087 Y76.587 I2.326 J-.259 E.02357
G3 X80.531 Y76.801 I-.1 J.773 E.01208
G3 X80.947 Y78.493 I.094 J.874 E.0609
G3 X79.72 Y78.288 I-.452 J-1.073 E.03165
G3 X79.634 Y76.837 I2.004 J-.847 E.03573
G3 X80.031 Y76.574 I.443 J.237 E.01197
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.531 Y76.801 E-.20854
G1 X80.973 Y76.873 E-.17018
G1 X80.976 Y76.875 E-.00128
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.223 J-1.196 P1  F42000
G1 X77.248 Y77.568 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X77.357 Y76.559 I3.759 J-.107 E.02455
G3 X78.367 Y77.814 I-.328 J1.298 E.04169
G3 X76.753 Y78.039 I-.765 J.41 E.08054
G2 X76.833 Y76.97 I-17.705 J-1.856 E.02587
G3 X77.3 Y76.548 I.581 J.174 E.01595
M106 S124.95
M106 S127.5
; WIPE_START
G1 X77.588 Y76.629 E-.11377
G1 X77.902 Y76.841 E-.14395
G1 X78.106 Y77.09 E-.12228
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.903 J.815 P1  F42000
G1 X81.389 Y80.727 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X81.978 Y80.062 I-2.62 J-2.913 E.02148
G3 X82.457 Y79.943 I.461 J.831 E.01203
G1 X82.522 Y79.528 E.01013
G3 X83.512 Y80.422 I-.1 J1.105 E.03451
G3 X83.706 Y81.591 I-1.452 J.842 E.02921
G3 X83.545 Y82.452 I-.769 J.301 E.02227
G3 X83.035 Y82.458 I-.261 J-.626 E.01259
G3 X81.828 Y82.542 I-.742 J-1.936 E.02963
G2 X80.778 Y82.603 I.866 J23.724 E.02535
G3 X80.332 Y82.377 I.476 J-1.49 E.01211
G3 X79.134 Y82.47 I-5.19 J-59.165 E.02898
G3 X78.575 Y82.234 I.112 J-1.047 E.01485
G3 X78.365 Y80.494 I-.058 J-.876 E.06421
G3 X79.106 Y80.039 I.72 J.343 E.02215
M73 P50 R6
G3 X80.434 Y80.654 I.182 J1.35 E.03726
G2 X81.285 Y80.238 I-.075 J-1.232 E.02344
G2 X81.645 Y79.77 I-1.179 J-1.282 E.0143
G3 X82.465 Y79.519 I.867 J1.364 E.02093
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.746 Y79.572 E-.10864
G1 X83.143 Y79.793 E-.17286
G1 X83.323 Y79.98 E-.0985
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-1.132 J-.447 P1  F42000
G1 X81.519 Y84.551 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X82.183 Y84.273 I.952 J1.344 E.0175
G1 X82.245 Y83.858 E.01013
G3 X83.204 Y86.001 I-.091 J1.327 E.06936
G3 X81.986 Y86.5 I-.82 J-.266 E.0361
G3 X82.188 Y83.849 I.188 J-1.319 E.09669
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.563 Y83.905 E-.144
G1 X82.899 Y84.066 E-.14164
G1 X83.083 Y84.233 E-.09437
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.236 J-1.194 P1  F42000
G1 X78.556 Y85.129 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X78.439 Y84.693 E.0109
G3 X78.705 Y83.618 I.177 J-.526 E.03986
G1 X78.823 Y83.215 E.01013
G3 X79.54 Y84.471 I-.271 J.988 E.03874
G3 X79.244 Y85.205 I-9.889 J-3.571 E.0191
G1 X79.309 Y85.726 E.01265
G3 X79.546 Y87.663 I-.78 J1.078 E.05284
G2 X80.615 Y88.066 I.909 J-.794 E.0287
G3 X81.865 Y88.994 I-.026 J1.341 E.04006
G3 X81.386 Y90.392 I-.912 J.469 E.03981
G3 X79.555 Y90.168 I-.784 J-1.192 E.04839
G1 X79.304 Y90.439 E.00891
G3 X79.495 Y92.487 I-.855 J1.113 E.05567
G3 X78.19 Y92.916 I-1.203 J-1.46 E.0339
G3 X77.308 Y91.393 I-.431 J-.768 E.06611
G3 X78 Y90.42 I1.464 J.309 E.02961
G1 X77.705 Y89.855 E.01537
G3 X77.207 Y89.133 I.285 J-.73 E.02246
G3 X77.968 Y88.608 I.915 J.512 E.02309
G2 X78.008 Y88.143 I-.55 J-.282 E.01153
G1 X77.695 Y87.715 E.01279
G3 X77.554 Y86.15 I.284 J-.814 E.04764
G3 X78.245 Y85.593 I1.279 J.878 E.0217
G1 X78.073 Y84.951 E.01602
G3 X78.768 Y83.197 I.52 J-.809 E.06384
M106 S124.95
; WIPE_START
G1 X79.041 Y83.287 E-.10939
G1 X79.401 Y83.61 E-.18366
G1 X79.503 Y83.797 E-.08101
G1 X79.506 Y83.812 E-.00595
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I1.167 J-.345 P1  F42000
G1 X76.984 Y75.273 Z3.32
G1 Z2.92
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1591
M204 S5000
G3 X78.053 Y75.06 I1.076 J2.607 E.02646
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.928 Y75.297 I1.414 J2.44 E.00765
; WIPE_START
G1 F12000
M204 S6000
G1 X77.373 Y75.144 E-.17861
G1 X77.777 Y75.073 E-.15576
G1 X77.897 Y75.068 E-.04563
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-.01 J1.217 P1  F42000
G1 X103.017 Y75.275 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F1591
M204 S5000
G3 X103.356 Y75.441 I-1.1 J2.681 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X102.961 Y75.253 I-.17 J2.893 E.02165
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16616
G1 X102.793 Y75.441 E-.21384
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F1591
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.41 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.022 E.03551
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14976
G1 X104.36 Y102.957 E-.07769
G1 X104.36 Y102.556 E-.15255
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F1591
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.003 J-2.805 E.03556
G1 X103.354 Y104.56 E.64408
G1 X103.317 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
M73 P50 R5
G1 X102.91 Y104.769 E-.17041
G1 X102.628 Y104.856 E-.11239
G1 X102.376 Y104.9 E-.0972
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F1591
M204 S5000
G3 X75.26 Y102.147 I2.463 J-1.48 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.805 J.003 E.03556
G1 X75.64 Y102.957 E.63934
M73 P51 R5
G3 X75.672 Y103.545 I-3.925 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.09434
G1 X75.38 Y102.96 E-.15598
G1 X75.305 Y102.627 E-.12969
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 19/30
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G1 X77.758 Y102.268 F42000
G1 Z3.08
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X77.792 Y101.737 I.489 J-.235 E.01339
G3 X77.936 Y101.161 I14.794 J3.399 E.01433
G3 X78.626 Y101.427 I-.848 J3.226 E.01787
G3 X78.59 Y102.903 I-.645 J.723 E.04048
G3 X77.848 Y103.506 I-.881 J-.327 E.02418
G3 X77.445 Y102.582 I.394 J-.721 E.02615
G3 X77.398 Y101.589 I.896 J-.541 E.02498
G3 X77.868 Y101.144 I.461 J.016 E.01731
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.394 Y101.278 E-.2063
G1 X78.626 Y101.427 E-.1048
G1 X78.74 Y101.569 E-.0689
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.439 J1.135 P1  F42000
G1 X80.453 Y102.231 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.922 Y101.877 I.607 J.317 E.01463
G1 X80.948 Y101.436 E.01066
G3 X81.561 Y101.808 I-2.026 J4.033 E.01731
G3 X81.646 Y102.324 I-.342 J.322 E.01339
G3 X80.805 Y103.171 I-.792 J.053 E.03254
G3 X80.193 Y102.972 I-.206 J-.406 E.01723
G3 X80.655 Y101.549 I.735 J-.548 E.04219
G3 X80.887 Y101.43 I.381 J.46 E.00635
M106 S124.95
M106 S127.5
; WIPE_START
G1 X81.11 Y101.48 E-.08678
G1 X81.353 Y101.703 E-.12544
G1 X81.561 Y101.808 E-.08835
G1 X81.672 Y101.985 E-.07943
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I1.167 J-.345 P1  F42000
G1 X80.618 Y98.424 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X81.073 Y97.779 E.01904
G3 X81.144 Y97.101 I9.846 J.685 E.01645
G1 X81.204 Y96.684 E.01015
G3 X82.197 Y97.087 I.191 J.955 E.02737
G3 X83.304 Y98.546 I-.167 J1.276 E.04914
G3 X83.476 Y99.237 I-.215 J.421 E.01948
G3 X82.793 Y100.053 I-.873 J-.037 E.02757
G3 X82.099 Y99.848 I-.285 J-.313 E.02092
G1 X81.577 Y99.377 E.01695
G1 X81.013 Y99.626 E.01486
G2 X80.743 Y100.328 I43.868 J17.284 E.01815
G3 X80.364 Y100.803 I-4.158 J-2.926 E.01466
G3 X79.144 Y100.218 I-.062 J-1.435 E.03398
G3 X78.497 Y99.413 I3.615 J-3.57 E.02494
G3 X77.679 Y98.746 I.657 J-1.642 E.02587
G3 X77.874 Y98.33 I.485 J-.025 E.01153
G3 X79.103 Y97.906 I.785 J.281 E.03596
G2 X80.289 Y98.162 I9.985 J-43.352 E.02926
G1 X80.653 Y97.647 E.01521
G3 X80.851 Y96.747 I1.619 J-.115 E.02252
G3 X81.147 Y96.672 I.249 J.358 E.00753
M106 S124.95
M106 S127.5
; WIPE_START
G1 X81.754 Y96.715 E-.23139
G1 X82.032 Y96.895 E-.12589
G1 X82.071 Y96.941 E-.02272
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I.678 J-1.011 P1  F42000
G1 X78.191 Y94.339 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X79.07 Y94.099 I.893 J1.539 E.02222
G1 X79.127 Y93.683 E.01013
G3 X79.837 Y93.903 I-.16 J1.772 E.01806
G3 X79.836 Y94.793 I-2.015 J.443 E.02165
G3 X79.456 Y95.659 I-1.061 J.051 E.02361
G1 X79.225 Y96.112 E.01227
G3 X78.731 Y96.842 I-.62 J.113 E.02353
G1 X77.897 Y96.921 E.02022
G3 X77.298 Y96.359 I.108 J-.715 E.02104
G3 X77.68 Y95.798 I1.148 J.371 E.01659
G2 X77.115 Y94.871 I-.935 J-.067 E.02794
G3 X77.24 Y94.052 I.244 J-.382 E.02519
G3 X78.013 Y93.953 I.61 J1.697 E.01896
G3 X79.069 Y93.675 I.951 J1.465 E.02679
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.567 Y93.76 E-.19198
G1 X79.837 Y93.903 E-.11591
G1 X79.899 Y94.043 E-.05842
G1 X79.899 Y94.079 E-.01368
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I1.196 J-.226 P1  F42000
G1 X78.965 Y89.145 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X79.876 Y88.939 I-.187 J-2.95 E.02263
G3 X80.524 Y88.51 I.758 J.441 E.0194
G1 X80.626 Y88.093 E.01036
G2 X80.992 Y88.264 I.992 J-1.644 E.00976
G3 X81.689 Y88.84 I-.63 J1.472 E.02209
G3 X81.964 Y89.487 I-.051 J.404 E.02046
G3 X81.281 Y90.297 I-.844 J-.018 E.02764
G3 X79.588 Y89.846 I-.647 J-.975 E.04776
G1 X79.331 Y89.822 E.00622
G1 X78.509 Y89.982 E.0202
G2 X79.505 Y90.87 I9.446 J-9.597 E.03219
G3 X78.678 Y92.733 I-.956 J.691 E.05935
G3 X77.978 Y93.054 I-7.343 J-15.116 E.01858
G3 X77.089 Y92.634 I.255 J-1.692 E.02404
G3 X76.788 Y92.127 I35.312 J-21.277 E.01421
G3 X76.865 Y91.843 I.334 J-.062 E.00734
G2 X77.696 Y90.866 I-1.298 J-1.945 E.03134
G1 X78.014 Y90.552 E.01077
G1 X77.979 Y90.234 E.00771
G2 X77.371 Y89.609 I-.963 J.329 E.02172
G3 X77.493 Y88.791 I.242 J-.382 E.02518
G2 X78.516 Y88.515 I-.913 J-5.418 E.02558
G3 X78.977 Y88.721 I-.033 J.692 E.01247
G2 X79.633 Y88.57 I-.144 J-2.123 E.0163
G3 X80.57 Y88.08 I1.03 J.831 E.02621
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.992 Y88.264 E-.17507
G1 X81.447 Y88.554 E-.20494
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I.59 J-1.064 P1  F42000
G1 X77.831 Y86.549 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X78.466 Y85.928 I-.87 J-1.524 E.02164
G1 X78.551 Y85.499 E.01056
G3 X79.253 Y85.788 I-1.15 J3.779 E.01834
G3 X79.682 Y87.111 I-1.075 J1.08 E.03482
G3 X78.04 Y87.727 I-1.079 J-.377 E.04823
G3 X77.223 Y87.147 I-.037 J-.813 E.02604
G3 X77.11 Y86.589 I.304 J-.352 E.0148
G2 X77.821 Y86.002 I-3.869 J-5.418 E.02225
G2 X78.212 Y85.563 I-.991 J-1.276 E.01425
G3 X78.495 Y85.485 I.22 J.243 E.00735
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.984 Y85.624 E-.19332
G1 X79.253 Y85.788 E-.11961
G1 X79.35 Y85.936 E-.06708
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I1.024 J-.657 P1  F42000
G1 X78.059 Y83.923 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X78.043 Y83.897 E.00071
G3 X78.611 Y83.67 I2.796 J6.149 E.01476
G1 X78.683 Y83.256 E.01013
G3 X79.538 Y84.084 I-.236 J1.099 E.03026
G3 X77.734 Y84.393 I-.927 J.007 E.06301
G3 X77.628 Y83.711 I2.492 J-.736 E.01669
G3 X78.013 Y83.473 I.423 J.254 E.01133
G3 X78.626 Y83.245 I.616 J.72 E.01609
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.931 Y83.311 E-.11869
G1 X79.211 Y83.481 E-.1243
G1 X79.419 Y83.77 E-.13533
G1 X79.42 Y83.774 E-.00168
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.467 J1.124 P1  F42000
G1 X81.625 Y84.691 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X82.19 Y84.334 I.613 J.345 E.0168
G1 X82.298 Y83.916 E.01041
G3 X82.546 Y84.079 I-.047 J.341 E.0074
G3 X83.203 Y85.746 I-.393 J1.118 E.049
G3 X82.534 Y86.534 I-.885 J-.074 E.0266
G3 X81.926 Y86.507 I-.293 J-.265 E.01676
G3 X81.171 Y85.793 I3.239 J-4.175 E.02509
G3 X82.241 Y83.904 I1.13 J-.607 E.0624
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.546 Y84.079 E-.13355
G1 X82.892 Y84.274 E-.15097
G1 X83.056 Y84.464 E-.09548
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I1.136 J-.435 P1  F42000
G1 X81.654 Y80.805 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X81.9 Y80.056 I-.914 J-.715 E.01938
G2 X82.534 Y80.049 I.295 J-1.81 E.01535
G1 X82.634 Y79.641 E.01013
G3 X83.495 Y80.066 I-.997 J3.106 E.02323
G3 X83.462 Y80.499 I-.414 J.187 E.01094
G2 X83.778 Y82.038 I10.284 J-1.313 E.03791
G3 X83.016 Y82.458 I-.466 J.055 E.02683
G3 X81.923 Y82.35 I.342 J-9.035 E.02651
G1 X81.387 Y82.417 E.01303
G3 X80.866 Y82.68 I-.452 J-.247 E.01496
G2 X79.478 Y82.353 I-.932 J.848 E.03656
G3 X78.27 Y82.151 I.749 J-8.192 E.02957
G3 X77.727 Y81.596 I.286 J-.822 E.0194
G3 X77.854 Y80.87 I.299 J-.322 E.02107
G2 X78.576 Y80.24 I-4.053 J-5.372 E.02313
G3 X79.361 Y80.146 I.42 J.178 E.0231
G3 X80.332 Y80.769 I-.1 J1.223 E.02894
G1 X80.759 Y80.903 E.01079
G1 X81.239 Y80.651 E.01309
G2 X81.474 Y80.014 I-.528 J-.556 E.01694
G3 X82.121 Y79.67 I.444 J.053 E.02074
G3 X82.577 Y79.627 I.302 J.773 E.01119
M106 S124.95
M106 S127.5
; WIPE_START
G1 X83.384 Y79.955 E-.33096
G1 X83.475 Y80.046 E-.04904
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I1.201 J.197 P1  F42000
G1 X83.914 Y77.369 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X84.573 Y77.035 I.776 J.716 E.01819
G1 X84.591 Y76.615 E.01013
G3 X83.793 Y78.971 I.029 J1.322 E.12242
G3 X83.288 Y78.616 I.257 J-.903 E.01517
G3 X83.146 Y77.954 I.142 J-.376 E.01937
G3 X84.206 Y76.672 I1.937 J.521 E.04137
G1 X84.533 Y76.613 E.00802
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.024 Y76.658 E-.1874
G1 X85.417 Y76.875 E-.17064
G1 X85.457 Y76.917 E-.02196
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.384 J1.155 P1  F42000
G1 X88.197 Y77.827 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.909 Y77.515 I.714 J.659 E.01929
G1 X88.93 Y77.095 E.01013
G3 X89.636 Y77.314 I-.183 J1.844 E.01796
G3 X90.231 Y78.318 I-.112 J.744 E.03222
G3 X89.029 Y79.795 I-1.416 J.075 E.05034
G3 X88.393 Y79.822 I-.33 J-.268 E.01734
G3 X87.522 Y78.433 I.32 J-1.168 E.04344
G3 X88.872 Y77.092 I1.369 J.028 E.05071
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.222 Y77.133 E-.13379
G1 X89.636 Y77.314 E-.17198
G1 X89.825 Y77.366 E-.07423
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.069 J1.215 P1  F42000
G1 X92.2 Y77.501 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.221 Y77.212 E.00699
G1 X91.941 Y76.843 E.01116
G1 X91.499 Y75.951 E.02401
G1 X91.675 Y76.431 E.01232
G1 X92.352 Y76.411 E.01632
G3 X93.504 Y76.941 I.417 J.611 E.03676
G3 X93.134 Y78.4 I-1.587 J.373 E.03772
G3 X91.79 Y77.339 I-.456 J-.803 E.05279
G3 X91.471 Y75.901 I.909 J-.956 E.0377
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.675 Y76.431 E-.21584
G1 X92.107 Y76.418 E-.16416
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I.242 J1.193 P1  F42000
G1 X94.396 Y75.955 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.904 Y75.809 I.576 J1.053 E.01284
G1 X94.963 Y75.393 E.01013
G3 X94.485 Y77.055 I-.121 J.865 E.07209
G3 X93.79 Y76.414 I.045 J-.745 E.02469
G3 X94.098 Y75.587 I.95 J-.117 E.02213
G3 X94.905 Y75.385 I3.979 J14.227 E.02006
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.277 Y75.475 E-.14526
G1 X95.6 Y75.768 E-.16604
G1 X95.678 Y75.932 E-.06871
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.161 J.364 P1  F42000
G1 X96.208 Y77.62 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X96.89 Y77.196 I-.665 J-1.829 E.01951
G1 X96.964 Y76.765 E.01055
G3 X97.243 Y77.745 I-.238 J.598 E.02837
M73 P52 R5
G2 X96.908 Y78.241 I2.117 J1.793 E.01446
G3 X95.588 Y79.788 I-1.114 J.387 E.05915
G3 X94.735 Y79.561 I.126 J-2.183 E.02144
G3 X94.62 Y79.043 I.33 J-.345 E.01355
G3 X95.666 Y77.464 I1.331 J-.255 E.05057
G1 X95.767 Y77.349 E.0037
G2 X96.808 Y76.774 I-1.676 J-4.268 E.02877
G1 X96.907 Y76.754 E.00243
M106 S124.95
M106 S127.5
; WIPE_START
G1 X97.18 Y76.866 E-.11189
G1 X97.322 Y77.133 E-.11517
G1 X97.353 Y77.396 E-.1004
G1 X97.311 Y77.528 E-.05254
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.522 J1.099 P1  F42000
G1 X99.299 Y78.472 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X100.04 Y77.667 I12.121 J10.401 E.02639
G2 X100.346 Y77.131 I-.259 J-.503 E.01574
G3 X100.665 Y77.715 I-.229 J.504 E.01723
G3 X100.399 Y78.749 I-9.346 J-1.853 E.02576
G3 X99.912 Y79.038 I-.461 J-.222 E.01445
G1 X99.61 Y79.534 E.014
G3 X99.176 Y80.218 I-.628 J.081 E.02119
G2 X99.977 Y81.277 I2.856 J-1.326 E.03228
G3 X100.024 Y82.289 I-1.259 J.566 E.02499
G3 X99.474 Y82.555 I-.388 J-.101 E.01675
G3 X98.689 Y81.176 I-.16 J-.822 E.0503
G1 X98.561 Y80.628 E.01357
G3 X97.833 Y79.583 I1.25 J-1.647 E.03122
G3 X98.194 Y78.759 I1.516 J.174 E.02202
G3 X98.75 Y78.5 I.775 J.934 E.01495
G3 X99.96 Y77.211 I5.151 J3.626 E.04277
G3 X100.289 Y77.118 I.376 J.699 E.00832
M106 S124.95
M106 S127.5
; WIPE_START
G1 X100.556 Y77.262 E-.11531
G1 X100.665 Y77.715 E-.17698
G1 X100.636 Y77.944 E-.08772
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.23 J1.195 P1  F42000
G1 X101.837 Y78.175 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X102.306 Y77.486 I.672 J-.047 E.02168
G2 X102.643 Y77.478 I.158 J-.403 E.00835
G1 X102.772 Y77.057 E.0106
G1 X102.845 Y77.072 E.0018
G3 X103.074 Y77.584 I-.318 J.45 E.01421
G3 X103.349 Y78.61 I-4.934 J1.873 E.02566
G3 X102.569 Y78.945 I-.595 J-.31 E.02217
G1 X102.367 Y79.505 E.01435
G1 X102.69 Y79.97 E.01367
G3 X103.23 Y80.709 I-.113 J.649 E.0244
G3 X102.138 Y81.111 I-.923 J-.824 E.02922
G3 X100.311 Y80.286 I-.696 J-.894 E.05934
G3 X100.428 Y79.691 I.421 J-.226 E.01583
G3 X101.289 Y79.133 I1.116 J.777 E.02536
G1 X101.464 Y78.497 E.0159
G3 X102.292 Y77.062 I1.035 J-.36 E.04532
G2 X102.715 Y77.045 I.163 J-1.286 E.01026
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.845 Y77.072 E-.05034
G1 X102.97 Y77.173 E-.06101
G1 X103.053 Y77.348 E-.07364
G1 X103.074 Y77.584 E-.09034
G1 X103.146 Y77.85 E-.10466
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.159 J-.373 P1  F42000
G1 X101.409 Y83.25 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X101.977 Y83.021 I.122 J-.516 E.01573
G2 X102.38 Y82.771 I.008 J-.437 E.0121
G1 X102.502 Y82.326 E.01114
G1 X102.553 Y82.336 E.00124
G3 X103.107 Y83.088 I-5.99 J4.994 E.02255
G3 X103.35 Y83.811 I-5.207 J2.151 E.0184
G3 X102.771 Y84.151 I-.51 J-.205 E.01743
G1 X102.249 Y84.791 E.0199
G3 X102.116 Y85.29 I-3.884 J-.769 E.01245
G3 X101.602 Y85.385 I-.335 J-.372 E.01327
G3 X100.632 Y84.869 I-.096 J-.991 E.02807
G3 X101.554 Y82.821 I.808 J-.868 E.07116
G2 X102.164 Y82.394 I-2.32 J-3.964 E.01796
G3 X102.446 Y82.315 I.27 J.417 E.00717
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.553 Y82.336 E-.04145
G1 X102.683 Y82.442 E-.06384
G1 X103.08 Y83.046 E-.27471
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.816 J-.903 P1  F42000
G1 X98.482 Y87.198 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X98.836 Y86.281 I-4.043 J-2.088 E.02376
G3 X99.504 Y85.8 I.853 J.481 E.02047
G1 X99.621 Y85.371 E.01072
G3 X99.895 Y85.646 I-.102 J.375 E.0098
G3 X100.421 Y86.255 I-.615 J1.064 E.01978
G3 X100.729 Y86.724 I-.332 J.553 E.01397
G1 X100.836 Y86.877 E.00451
G1 X101.364 Y87.202 E.01495
G1 X101.598 Y86.992 E.00758
G1 X101.48 Y86.746 E.00656
G2 X102.302 Y86.529 I-1.992 J-9.182 E.0205
G3 X103.123 Y86.853 I-.362 J2.12 E.02144
G3 X103.11 Y87.315 I-.429 J.22 E.01163
G3 X102.658 Y88.234 I-1.094 J.033 E.02571
G1 X102.725 Y88.808 E.01393
G3 X102.403 Y89.712 I-.239 J.424 E.03285
G2 X101.083 Y90.028 I.158 J3.576 E.03293
G3 X100.562 Y89.488 I.068 J-.587 E.01958
G3 X100.19 Y88.486 I3.468 J-1.858 E.02586
G2 X99.831 Y88.439 I-.237 J.415 E.00895
G1 X99.36 Y88.603 E.01204
G3 X98.283 Y89.342 I-1.257 J-.679 E.0327
G3 X97.943 Y89.022 I.122 J-.47 E.01175
G3 X97.446 Y88.475 I.487 J-.942 E.01819
G3 X97.467 Y87.592 I.173 J-.438 E.02766
G3 X98.13 Y86.96 I2.146 J1.583 E.0222
G2 X98.485 Y86.045 I-10.497 J-4.599 E.02367
G3 X99.564 Y85.359 I1.219 J.725 E.03201
M106 S124.95
M106 S127.5
; WIPE_START
G1 X99.827 Y85.493 E-.11221
G1 X99.895 Y85.646 E-.06361
G1 X100.268 Y85.967 E-.18698
G1 X100.289 Y86.007 E-.01721
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.125 J-.465 P1  F42000
G1 X97.991 Y91.571 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X98.282 Y91.32 I.027 J-.262 E.01038
G3 X98.89 Y91.229 I.595 J1.909 E.01488
G1 X99.025 Y90.807 E.01069
G1 X99.085 Y90.819 E.00147
G3 X99.317 Y91.29 I-.255 J.419 E.01337
G3 X99.141 Y92.276 I-.892 J.349 E.02541
G1 X99.181 Y92.416 E.00351
G3 X98.403 Y93.535 I-1.81 J-.427 E.03366
G3 X98.326 Y94.092 I-.688 J.188 E.01391
G3 X97.041 Y94.11 I-.656 J-.972 E.0328
G3 X96.624 Y93.583 I1.192 J-1.373 E.01629
G2 X96.726 Y92.741 I-2.548 J-.736 E.02054
G3 X97.889 Y91.163 I1.23 J-.311 E.05401
G1 X97.977 Y90.997 E.00453
G3 X98.969 Y90.796 I.998 J2.367 E.02457
M106 S124.95
M106 S127.5
; WIPE_START
G1 X99.085 Y90.819 E-.04508
G1 X99.264 Y91.015 E-.1008
G1 X99.317 Y91.29 E-.10649
G1 X99.398 Y91.616 E-.12762
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.127 J1.21 P1  F42000
G1 X102.025 Y91.892 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X102.433 Y91.4 I.447 J-.044 E.01715
G1 X102.488 Y90.982 E.01016
G3 X103.274 Y91.326 I-.387 J1.96 E.02086
G3 X103.266 Y91.777 I-.422 J.218 E.01134
G2 X103.338 Y92.721 I1.213 J.382 E.02339
G3 X102.782 Y93.24 I-.464 J.06 E.02141
G3 X101.649 Y92.726 I.156 J-1.849 E.03058
G3 X101.893 Y91.191 I1.618 J-.53 E.03893
G3 X102.431 Y90.971 I.665 J.859 E.01418
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.713 Y91.029 E-.10921
G1 X103.274 Y91.326 E-.24153
G1 X103.304 Y91.397 E-.02927
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.758 J-.952 P1  F42000
G1 X99.332 Y94.561 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X99.69 Y94 I-16.344 J-10.83 E.01605
G3 X99.952 Y92.908 I13.118 J2.574 E.02708
G3 X100.637 Y93.156 I-.843 J3.404 E.01761
G3 X101.067 Y93.988 I-1.313 J1.206 E.02285
G2 X101.618 Y94.401 I1.226 J-1.061 E.01673
G3 X102.213 Y94.565 I.077 J.88 E.01519
G3 X102.534 Y95.244 I.013 J.41 E.02293
G3 X101.84 Y96.019 I-.851 J-.065 E.02697
G3 X101.172 Y95.824 I-.261 J-.348 E.01944
G3 X100.756 Y95.294 I1.517 J-1.621 E.0163
G1 X100.726 Y94.924 E.00895
G1 X100.035 Y94.75 E.01719
G1 X99.734 Y95.292 E.01494
G3 X99.365 Y96.232 I-1.727 J-.135 E.02472
G3 X98.569 Y96.527 I-1.108 J-1.768 E.02061
G3 X98.279 Y96.202 I.195 J-.466 E.01085
G3 X98.44 Y94.87 I.598 J-.603 E.0373
G3 X99.086 Y94.208 I17.695 J16.603 E.0223
G2 X99.309 Y93.597 I-1.772 J-.994 E.01575
G3 X99.614 Y92.971 I2.546 J.853 E.01685
G3 X99.896 Y92.894 I.218 J.246 E.00729
M106 S124.95
M106 S127.5
; WIPE_START
G1 X100.44 Y93.042 E-.21421
G1 X100.637 Y93.156 E-.08662
G1 X100.751 Y93.331 E-.07917
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.217 J.026 P1  F42000
G1 X100.846 Y97.842 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X101.399 Y97.842 I.276 J-1.117 E.01347
G1 X102.059 Y97.566 E.01724
G3 X102.512 Y97.189 I.657 J.328 E.01463
G1 X102.55 Y96.771 E.01013
G3 X102.954 Y97.404 I.029 J.427 E.0221
G1 X103.022 Y97.937 E.01296
G3 X103.293 Y98.713 I-.476 J.601 E.02091
G3 X102.698 Y98.94 I-.592 J-.657 E.0157
G3 X102.04 Y99.601 I-2.722 J-2.052 E.02256
G2 X102.273 Y100.482 I2.174 J-.103 E.02214
G2 X102.271 Y101.054 I3.247 J.295 E.01382
G2 X103.164 Y101.672 I1.33 J-.969 E.02668
G3 X103.257 Y102.264 I-.265 J.345 E.01595
G3 X103.096 Y102.726 I-.61 J.047 E.01215
G3 X102.769 Y103.515 I-.481 J.263 E.0236
G3 X101.928 Y103.011 I.307 J-1.465 E.02409
G2 X101.446 Y102.925 I-.336 J.489 E.01217
G1 X100.974 Y103.097 E.01213
G3 X100.299 Y103.502 I-.773 J-.523 E.01961
G3 X99.984 Y102.42 I.496 J-.731 E.02948
G2 X99.882 Y101.529 I-1.685 J-.258 E.02188
G3 X100.819 Y100.33 I1.266 J.024 E.03936
G2 X100.745 Y99.617 I-2.763 J-.077 E.01734
G3 X100.22 Y98.837 I.802 J-1.108 E.02315
G3 X99.972 Y98.032 I.549 J-.61 E.02134
G3 X100.46 Y97.475 I.386 J-.154 E.022
G3 X101.092 Y97.466 I.327 J.766 E.01564
G2 X101.787 Y97.225 I-.604 J-2.863 E.01778
G3 X102.493 Y96.765 I.971 J.72 E.02076
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.863 Y96.852 E-.14473
G1 X102.969 Y96.951 E-.05485
G1 X103.022 Y97.09 E-.05645
G1 X102.954 Y97.404 E-.12205
G1 X102.955 Y97.409 E-.00193
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.422 J-1.141 P1  F42000
G1 X97.142 Y99.559 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X97.144 Y99.542 E.00041
G3 X97.782 Y98.79 I.723 J-.034 E.02618
G1 X97.908 Y98.366 E.01066
G3 X98.199 Y98.695 I-.152 J.427 E.01106
G3 X99.289 Y99.327 I-2.999 J6.426 E.03041
G3 X99.24 Y99.774 I-.403 J.183 E.01137
G3 X98.793 Y100.493 I-.999 J-.124 E.02108
G3 X96.786 Y99.265 I-.947 J-.705 E.0843
G3 X97.852 Y98.353 I1.097 J.204 E.03658
M106 S124.95
M106 S127.5
; WIPE_START
G1 X98.112 Y98.497 E-.11278
G1 X98.199 Y98.695 E-.08242
G1 X98.629 Y98.923 E-.18479
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.111 J-.497 P1  F42000
G1 X97.075 Y102.396 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X97.075 Y102.391 E.00011
G3 X97.558 Y102.002 I.584 J.23 E.01567
G1 X97.613 Y101.585 E.01014
G3 X98.429 Y102.315 I-.047 J.873 E.02853
G3 X98.476 Y102.803 I-.46 J.291 E.01226
G3 X97.532 Y103.392 I-1.029 J-.598 E.02792
G3 X96.769 Y102.949 I-.326 J-.317 E.02909
G3 X97.556 Y101.575 I.797 J-.456 E.04603
M106 S124.95
M106 S127.5
; WIPE_START
G1 X97.854 Y101.627 E-.11489
G1 X98.105 Y101.772 E-.11028
G1 X98.356 Y102.082 E-.15149
G1 X98.358 Y102.09 E-.00334
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I.022 J-1.217 P1  F42000
G1 X92.694 Y101.989 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X93.423 Y101.235 I-1.239 J-1.926 E.02552
G1 X93.727 Y101.22 E.00734
G1 X93.841 Y100.782 E.01091
G3 X94.316 Y101.381 I-.465 J.857 E.01894
G1 X94.748 Y101.71 E.0131
G3 X95.588 Y101.762 I.323 J1.577 E.02052
G3 X95.177 Y103.461 I-.822 J.7 E.04911
G3 X94.289 Y102.839 I.254 J-1.308 E.02694
G1 X93.741 Y102.681 E.01374
G1 X93.026 Y102.917 E.01815
G3 X92.212 Y103.451 I-.866 J-.433 E.02461
G3 X91.554 Y103.112 I-.236 J-.349 E.02176
G3 X91.866 Y101.886 I.682 J-.479 E.03462
G2 X92.781 Y101.405 I-.757 J-2.551 E.02511
G2 X93.089 Y100.929 I-10.251 J-6.979 E.01367
G3 X93.785 Y100.797 I.506 J.763 E.01755
G1 X93.794 Y100.748 E.00119
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.057 Y100.942 E-.12405
G1 X94.316 Y101.381 E-.19383
G1 X94.446 Y101.48 E-.06212
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I.646 J-1.031 P1  F42000
G1 X91.492 Y99.629 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.87 Y99.225 I.403 J-.002 E.0147
G1 X91.884 Y98.805 E.01013
G2 X92.461 Y98.875 I1.298 J-8.348 E.01402
G3 X92.711 Y99.579 I-.494 J.572 E.01884
G3 X91.827 Y98.803 I-.814 J.036 E.09176
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.461 Y98.875 E-.24271
G1 X92.581 Y98.978 E-.06018
G1 X92.659 Y99.155 E-.07338
G1 X92.66 Y99.164 E-.00373
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I1.138 J-.431 P1  F42000
G1 X91.19 Y95.285 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X91.283 Y95.273 E.00226
G3 X91.94 Y94.92 I.585 J.301 E.01913
G1 X92.024 Y94.509 E.01013
G3 X92.767 Y94.75 I-.422 J2.564 E.01892
G3 X92.785 Y95.201 I-.453 J.243 E.01127
G3 X92.353 Y96.298 I-1.065 J.214 E.03005
G3 X91.433 Y97.283 I-1.368 J-.356 E.03388
G3 X91.126 Y97.585 I-.352 J-.05 E.01116
G3 X90.352 Y97.678 I-.415 J-.187 E.02258
G3 X89.788 Y96.948 I.448 J-.928 E.02307
G3 X89.907 Y96.278 I.628 J-.234 E.01721
G3 X91.079 Y94.875 I1.25 J-.146 E.04931
G3 X91.967 Y94.497 I.771 J.578 E.02439
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.582 Y94.629 E-.23891
G1 X92.767 Y94.75 E-.0842
G1 X92.828 Y94.887 E-.05689
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I.666 J-1.019 P1  F42000
G1 X90.393 Y93.295 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.733 Y92.464 I.717 J-.191 E.02324
G1 X90.817 Y92.358 E.00327
G1 X90.912 Y91.923 E.01073
G3 X91.718 Y92.465 I-1.413 J2.971 E.02352
G1 X92.29 Y92.409 E.01385
G3 X93.321 Y92.027 I1.133 J1.475 E.02692
G3 X94.053 Y92.8 I-.156 J.88 E.02748
G3 X93.75 Y93.502 I-.311 J.282 E.02317
G3 X92.507 Y93.298 I-.52 J-.719 E.03376
G2 X91.611 Y93.672 I-.128 J.953 E.02456
G3 X90.463 Y93.883 I-.729 J-.734 E.02992
G3 X89.973 Y93.261 I-.085 J-.437 E.02356
G3 X90.437 Y92.161 I.995 J-.228 E.03074
G3 X90.858 Y91.905 I.398 J.182 E.0126
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.425 Y92.196 E-.2423
G1 X91.692 Y92.441 E-.1377
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I.637 J1.037 P1  F42000
G1 X94.848 Y90.504 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X95.514 Y89.785 I.75 J.027 E.02576
G1 X95.641 Y89.361 E.01066
G3 X95.876 Y89.564 I-.101 J.355 E.00774
G3 X96.665 Y90.571 I-.358 J1.093 E.0327
G3 X96.671 Y91.052 I-.369 J.245 E.01227
G3 X95.987 Y91.868 I-.874 J-.037 E.0276
G3 X95.334 Y91.795 I-.299 J-.278 E.01842
G3 X95.584 Y89.348 I.312 J-1.204 E.08512
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.82 Y89.462 E-.09935
G1 X95.876 Y89.564 E-.04445
G1 X96.174 Y89.715 E-.12691
G1 X96.384 Y89.912 E-.10929
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I.667 J-1.018 P1  F42000
G1 X91.886 Y86.965 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.275 Y85.526 I.53 J-.629 E.04501
G1 X92.378 Y85.108 E.01037
G3 X93.287 Y85.825 I-1.23 J2.494 E.02812
G3 X93.484 Y86.675 I-1.588 J.815 E.02126
G3 X93.283 Y87.255 I-15.883 J-5.172 E.01478
G1 X93.765 Y87.663 E.01524
G3 X94.588 Y87.919 I-.197 J2.082 E.02092
G3 X94.038 Y89.456 I-1.432 J.354 E.0417
G3 X92.713 Y90.258 I-1.176 J-.447 E.04024
G1 X92.229 Y90.303 E.01173
G3 X91.62 Y90.312 I-.308 J-.256 E.0167
G3 X91.013 Y89.593 I.472 J-1.015 E.0234
M73 P53 R5
G1 X90.365 Y89.604 E.01563
G3 X89.662 Y90.308 I-10.191 J-9.463 E.02401
G3 X89.137 Y90.174 I-.176 J-.402 E.01408
G3 X88.478 Y88.42 I.573 J-1.216 E.04998
G3 X89.426 Y87.867 I.94 J.522 E.02778
G3 X90.075 Y88.066 I.258 J.317 E.01932
G3 X90.552 Y88.777 I-.723 J1 E.02107
G1 X91.084 Y88.995 E.01387
G2 X91.704 Y88.708 I-20.493 J-45.115 E.01647
G3 X92.081 Y88.151 I1.421 J.555 E.01636
G2 X91.877 Y87.435 I-1.138 J-.062 E.01828
G3 X92.322 Y85.096 I.507 J-1.116 E.07875
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.935 Y85.444 E-.26808
G1 X93.135 Y85.661 E-.11192
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I.968 J-.738 P1  F42000
G1 X90.264 Y81.893 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.596 Y80.986 I.789 J-.226 E.02491
G3 X91.047 Y80.381 I.503 J-.096 E.02047
G1 X91.223 Y80.304 E.00463
G1 X91.348 Y79.877 E.01074
G3 X91.651 Y80.234 I-.161 J.444 E.01183
G3 X91.854 Y80.674 I-.64 J.561 E.01185
G2 X92.94 Y80.664 I.53 J-1.416 E.0268
G2 X93.537 Y80.547 I-1.252 J-7.974 E.01467
G3 X94.089 Y80.98 I-.417 J1.1 E.01719
G3 X94.7 Y81.912 I-.586 J1.05 E.02793
G1 X94.877 Y82.159 E.00735
G1 X95.528 Y81.895 E.01695
G3 X96.483 Y81.123 I1.717 J1.147 E.03006
G3 X97.309 Y81.574 I-5.329 J10.759 E.02269
G3 X97.375 Y83.159 I-.858 J.83 E.04185
G1 X97.749 Y83.674 E.01536
G3 X98.576 Y83.931 I-.259 J2.293 E.021
G3 X98.026 Y85.468 I-1.432 J.354 E.0417
G3 X96.701 Y86.27 I-1.222 J-.523 E.03987
G1 X96.217 Y86.315 E.01173
G3 X95.608 Y86.324 I-.308 J-.247 E.01678
G3 X95.026 Y85.621 I.418 J-.938 E.0228
G3 X95.243 Y84.955 I.34 J-.257 E.0198
G2 X95.916 Y84.33 I-.362 J-1.065 E.02282
G1 X96.137 Y84.089 E.0079
G2 X96.037 Y83.391 I-1.545 J-.134 E.01714
G3 X95.534 Y82.84 I.739 J-1.18 E.01821
G1 X94.885 Y83.121 E.01706
G3 X94.287 Y83.548 I-.836 J-.538 E.01814
G3 X93.493 Y83.308 I-.326 J-.355 E.02409
G3 X92.366 Y82.687 I.109 J-1.531 E.03202
G1 X91.708 Y82.93 E.01693
G3 X91.162 Y83.651 I-.968 J-.166 E.02266
G3 X90.566 Y83.167 I-.091 J-.497 E.02103
G2 X90.123 Y82.487 I-.905 J.105 E.02028
G3 X90.207 Y80.784 I.877 J-.81 E.0458
G3 X90.91 Y79.982 I.841 J.029 E.02782
G3 X91.291 Y79.864 I.398 J.608 E.00976
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.551 Y80.007 E-.11279
G1 X91.651 Y80.234 E-.09411
G1 X91.842 Y80.648 E-.17309
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.129 J-1.21 P1  F42000
G1 X85.947 Y81.278 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X85.539 Y81.049 I-.615 J.618 E.01141
G3 X85.768 Y80.509 I.716 J-.016 E.01458
G3 X86.186 Y80.343 I1.552 J3.313 E.01087
G1 X86.278 Y79.927 E.01028
G2 X87.223 Y80.274 I2.041 J-4.102 E.02433
G3 X88.001 Y81.037 I-.485 J1.271 E.02703
G3 X88.672 Y81.927 I-.755 J1.268 E.02757
G3 X88.367 Y82.607 I-.315 J.267 E.02243
G3 X87.409 Y82.718 I-.582 J-.831 E.02422
G2 X87.356 Y83.778 I1.718 J.618 E.02598
G3 X87.013 Y84.519 I-3.039 J-.958 E.01974
G3 X86.218 Y84.966 I-.996 J-.841 E.02248
G3 X85.491 Y84.96 I-.358 J-.687 E.01825
G3 X84.941 Y84.413 I.32 J-.872 E.0193
G3 X84.969 Y83.744 I.228 J-.325 E.01919
G3 X85.698 Y82.762 I1.174 J.11 E.03101
G2 X85.619 Y81.564 I-1.382 J-.51 E.0298
G3 X85.107 Y81.198 I.665 J-1.469 E.01527
G3 X85.431 Y80.248 I1.705 J.052 E.02457
G3 X86.221 Y79.914 I1.025 J1.321 E.02092
M106 S124.95
M106 S127.5
; WIPE_START
G1 X86.889 Y80.216 E-.27831
G1 X87.152 Y80.261 E-.10169
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.183 J.287 P1  F42000
G1 X88.327 Y85.094 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.93 Y84.697 I.576 J.218 E.01862
G1 X89.007 Y84.284 E.01013
G3 X89.897 Y84.801 I-.174 J1.325 E.02548
G3 X89.686 Y85.914 I-1.883 J.22 E.02775
G3 X88.641 Y86.284 I-.849 J-.735 E.02796
G3 X87.949 Y85.711 I-.209 J-.452 E.02701
G3 X88.95 Y84.273 I.957 J-.401 E.05031
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.604 Y84.513 E-.26448
G1 X89.742 Y84.596 E-.06113
G1 X89.828 Y84.71 E-.05439
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.555 J-1.083 P1  F42000
G1 X84.123 Y87.633 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X84.579 Y87.137 I.879 J.351 E.01662
G2 X84.806 Y86.55 I-.471 J-.518 E.01573
G3 X85.358 Y86.782 I-.67 J2.363 E.01449
G3 X86.281 Y87.07 I.081 J1.367 E.02383
G3 X87.047 Y87.244 I-.024 J1.879 E.01909
G3 X87.265 Y87.727 I-.351 J.449 E.0133
G3 X87.008 Y89.039 I-1.079 J.469 E.03428
G3 X86.178 Y89.245 I-.445 J-.02 E.02756
G1 X85.821 Y89.112 E.0092
G3 X84.583 Y88.765 I-.328 J-1.209 E.03254
G3 X83.786 Y88.231 I.393 J-1.449 E.02357
G3 X83.728 Y87.483 I.156 J-.388 E.02241
G3 X84.287 Y86.828 I1.22 J.475 E.02114
G3 X84.75 Y86.533 I.622 J.465 E.01355
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.358 Y86.782 E-.24962
G1 X85.63 Y86.781 E-.10344
G1 X85.699 Y86.8 E-.02694
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.215 J.06 P1  F42000
G1 X85.925 Y91.401 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X85.851 Y91.117 I-.464 J-.03 E.0072
G2 X86.342 Y90.961 I-1.909 J-6.838 E.01244
G1 X86.404 Y90.545 E.01013
G2 X86.969 Y90.557 I.304 J-1.023 E.01379
G3 X87.934 Y90.975 I-.029 J1.393 E.02602
G3 X88.778 Y91.779 I-.078 J.927 E.03038
G3 X88.482 Y92.504 I-.305 J.298 E.02389
G3 X87.878 Y92.67 I-.518 J-.7 E.01546
G3 X85.823 Y92.034 I-.857 J-.867 E.06351
G3 X85.437 Y90.932 I1.197 J-1.039 E.02883
G3 X85.861 Y90.681 I.456 J.287 E.01234
G3 X86.347 Y90.537 I.408 J.483 E.01258
M106 S124.95
M106 S127.5
; WIPE_START
G1 X86.705 Y90.611 E-.13891
G1 X86.969 Y90.557 E-.10233
G1 X87.324 Y90.601 E-.1362
G1 X87.331 Y90.604 E-.00256
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.286 J-1.183 P1  F42000
G1 X83.755 Y91.468 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X83.376 Y91.035 I.436 J-.765 E.01413
G3 X83.933 Y90.366 I1.134 J.378 E.02151
G1 X84.023 Y89.942 E.01044
G3 X84.792 Y90.437 I-.72 J1.963 E.02223
G3 X84.466 Y91.823 I-.811 J.541 E.0385
G3 X83.727 Y91.918 I-.397 J-.162 E.02181
G3 X83.041 Y91.292 I.438 J-1.168 E.02296
G1 X82.7 Y91.465 E.00922
G3 X82.91 Y92.274 I-1.135 J.726 E.02048
G3 X82.607 Y93.888 I-1.062 J.636 E.04331
G3 X81.91 Y94.671 I-.851 J-.055 E.02725
G3 X81.226 Y94.468 I-.293 J-.266 E.02144
G3 X80.904 Y93.696 I.969 J-.856 E.02054
G3 X81.34 Y91.798 I.95 J-.781 E.05419
G3 X82.116 Y91.316 I.748 J.338 E.02338
G3 X82.726 Y91.307 I.314 J.635 E.0152
G1 X83.04 Y90.778 E.01484
G3 X83.597 Y90.105 I.9 J.178 E.02196
G3 X83.969 Y89.923 I.355 J.254 E.01041
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.58 Y90.215 E-.25754
G1 X84.792 Y90.437 E-.11651
G1 X84.799 Y90.451 E-.00595
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.091 J.539 P1  F42000
G1 X86.879 Y94.661 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X87.495 Y94.362 E.01651
G3 X87.962 Y93.938 I.519 J.103 E.01628
G1 X88.001 Y93.52 E.01013
G3 X88.701 Y94.697 I-.043 J.822 E.03901
G3 X88.141 Y95.141 I-.405 J.065 E.02095
G3 X87.651 Y95.104 I-.176 J-.917 E.012
G2 X87.335 Y95.434 I.199 J.507 E.01138
G1 X87.219 Y95.94 E.01251
G3 X87.019 Y96.56 I-.306 J.244 E.01858
G3 X86.132 Y96.805 I-2.681 J-7.982 E.02219
G3 X85.031 Y96.422 I.41 J-2.952 E.0283
G3 X84.832 Y95.931 I.542 J-.506 E.01308
G2 X84.3 Y95.208 I-11.599 J7.98 E.02165
G3 X83.974 Y94.54 I.01 J-.418 E.02205
G3 X84.864 Y93.666 I1.061 J.19 E.03209
G3 X85.594 Y93.848 I.122 J1.065 E.01853
G3 X86.649 Y94.306 I-.006 J1.457 E.02851
G1 X87.196 Y94.04 E.01466
G3 X87.943 Y93.513 I.8 J.342 E.02321
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.196 Y93.542 E-.09668
G1 X88.478 Y93.689 E-.12084
G1 X88.644 Y93.864 E-.09157
G1 X88.723 Y94.033 E-.0709
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.096 J-.53 P1  F42000
G1 X86.517 Y98.596 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X86.513 Y98.591 E.00016
G3 X86.451 Y98.194 I.42 J-.269 E.00997
G1 X86.421 Y98.067 E.00316
G2 X86.828 Y97.958 I-.511 J-2.739 E.01018
G1 X86.897 Y97.543 E.01016
G3 X87.447 Y97.781 I-.111 J1.011 E.01467
G3 X88.782 Y98.072 I.009 J3.169 E.0332
G3 X89.407 Y99.304 I-.502 J1.03 E.03577
G2 X88.953 Y99.964 I29.496 J20.741 E.01932
G2 X88.367 Y100.485 I8.101 J9.72 E.01891
G3 X87.841 Y100.314 I-.147 J-.444 E.01426
G3 X86.693 Y99.835 I.536 J-2.896 E.03024
G3 X86.352 Y99.049 I.936 J-.872 E.02105
G3 X86.027 Y98.225 I.577 J-.704 E.02232
G3 X86.502 Y97.617 I.395 J-.181 E.02292
G3 X86.841 Y97.529 I.346 J.634 E.00852
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.155 Y97.606 E-.12281
G1 X87.447 Y97.781 E-.12938
G1 X87.782 Y97.813 E-.12781
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.916 J-.801 P1  F42000
G1 X84.511 Y101.556 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X84.965 Y100.783 I-1.816 J-1.585 E.02175
G2 X85.283 Y100.057 I-.678 J-.73 E.01967
G3 X86.056 Y100.641 I-.784 J1.839 E.02361
G3 X86.626 Y101.673 I-.814 J1.123 E.02935
G1 X86.771 Y102.217 E.01359
G3 X86.889 Y103.354 I-1.019 J.68 E.02867
G3 X86.082 Y103.264 I-.359 J-.437 E.02182
G3 X85.709 Y102.87 I1.168 J-1.481 E.01312
G1 X85.113 Y103.11 E.0155
G3 X84.393 Y103.406 I-.45 J-.072 E.02247
G2 X83.28 Y103.069 I-1.428 J2.711 E.02822
G3 X82.986 Y102.662 I.173 J-.435 E.01278
G3 X83.411 Y101.594 I1.099 J-.182 E.02914
G3 X84.044 Y101.463 I.372 J.202 E.01776
G2 X84.604 Y100.554 I-1.554 J-1.584 E.026
G3 X85.092 Y100.042 I1.84 J1.263 E.01713
G1 X85.229 Y100.039 E.0033
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.831 Y100.357 E-.25881
G1 X86.029 Y100.607 E-.12119
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.601 J1.058 P1  F42000
G1 X89.003 Y102.297 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.495 Y101.911 I.486 J.113 E.0163
G1 X89.589 Y101.502 E.01013
G3 X90.063 Y103.07 I-.162 J.905 E.04878
G3 X89.38 Y103.398 I-.435 J-.031 E.02215
G3 X88.481 Y102.699 I2.629 J-4.311 E.02752
G3 X89.223 Y101.519 I1.34 J.019 E.03536
G1 X89.52 Y101.486 E.00719
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.832 Y101.551 E-.12132
G1 X90.061 Y101.725 E-.10922
G1 X90.255 Y101.978 E-.12133
G1 X90.278 Y102.049 E-.02814
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I1.017 J.668 P1  F42000
G1 X94.49 Y95.638 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X95.193 Y95.28 I.622 J.352 E.02018
G3 X95.517 Y95.226 I.289 J.737 E.00797
G1 X95.551 Y94.807 E.01013
G3 X96.762 Y95.433 I-.24 J1.948 E.03357
G3 X97.038 Y95.898 I-.213 J.441 E.01382
G3 X96.739 Y96.931 I-.917 J.294 E.0275
G3 X96.111 Y97.092 I-.372 J-.145 E.01827
G3 X95.53 Y97.24 I-.54 J-.904 E.01466
G2 X95.224 Y98.213 I.608 J.725 E.02596
G3 X94.811 Y98.891 I-1.032 J-.165 E.01963
G3 X94.127 Y98.953 I-.366 J-.234 E.0191
G3 X94.287 Y97.366 I.281 J-.773 E.0525
G1 X94.411 Y97.116 E.00672
G1 X94.458 Y96.502 E.01485
G1 X94.196 Y96.376 E.00701
G3 X94.037 Y95.75 I.244 J-.395 E.01722
G3 X94.932 Y94.874 I1.066 J.194 E.0322
G3 X95.493 Y94.802 I1.049 J5.979 E.01365
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.823 Y94.84 E-.12618
G1 X96.142 Y94.971 E-.1309
G1 X96.401 Y95.164 E-.12292
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I.893 J-.827 P1  F42000
G1 X80.068 Y77.534 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.102 Y76.531 I1.348 J-.457 E.02475
G2 X80.967 Y76.921 I2.79 J-5.023 E.02291
G3 X81.463 Y77.193 I-1.019 J2.446 E.01367
G1 X81.516 Y77.316 E.00322
G3 X81.181 Y78.289 I-1.628 J-.016 E.02525
G3 X80.136 Y78.485 I-.735 J-1.037 E.02643
G3 X79.699 Y77.746 I.38 J-.724 E.02181
G3 X79.78 Y76.589 I.89 J-.519 E.02969
G3 X80.048 Y76.511 I.21 J.223 E.00698
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.672 Y76.837 E-.2677
G1 X80.957 Y76.918 E-.1123
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.226 J-1.196 P1  F42000
G1 X77.356 Y77.598 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X77.339 Y76.514 I1.383 J-.565 E.02675
G3 X78.213 Y77.594 I-.572 J1.357 E.0349
G3 X78.422 Y78.149 I-.292 J.427 E.01524
G3 X77.379 Y79.134 I-.977 J.01 E.03886
G3 X76.796 Y78.386 I.857 J-1.268 E.02323
G3 X76.947 Y77.695 I1.197 J-.101 E.01732
G3 X77.02 Y76.557 I.919 J-.512 E.02905
G3 X77.283 Y76.498 I.2 J.272 E.00669
M106 S124.95
; WIPE_START
G1 X77.703 Y76.711 E-.17896
G1 X78.005 Y77.044 E-.17093
G1 X78.039 Y77.116 E-.03011
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I1.056 J-.605 P1  F42000
G1 X76.983 Y75.273 Z3.48
G1 Z3.08
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1783
M204 S5000
G3 X78.053 Y75.06 I1.075 J2.602 E.02648
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.928 Y75.297 I1.413 J2.435 E.00763
; WIPE_START
G1 F12000
M204 S6000
G1 X77.373 Y75.144 E-.17887
G1 X77.762 Y75.075 E-.15015
G1 X77.896 Y75.068 E-.05099
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-.01 J1.217 P1  F42000
G1 X103.017 Y75.275 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F1783
M204 S5000
G3 X103.356 Y75.441 I-1.1 J2.681 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12122
M73 P54 R5
G3 X102.961 Y75.253 I-.17 J2.893 E.02165
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16622
G1 X102.793 Y75.441 E-.21378
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F1783
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.411 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.575 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.021 E.03552
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14977
G1 X104.36 Y102.957 E-.07768
G1 X104.36 Y102.556 E-.15255
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F1783
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57621
G3 X76.646 Y104.56 I.005 J-2.815 E.03556
G1 X103.354 Y104.56 E.64408
G1 X103.317 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.904 Y104.771 E-.17301
G1 X102.628 Y104.856 E-.10976
G1 X102.376 Y104.9 E-.09723
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.604 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F1783
M204 S5000
G3 X75.26 Y102.147 I2.455 J-1.477 E.03694
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.805 J.003 E.03556
G1 X75.64 Y102.957 E.63934
G3 X75.672 Y103.544 I-3.916 J.507 E.01418
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.09399
G1 X75.38 Y102.96 E-.15601
G1 X75.305 Y102.626 E-.13001
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 20/30
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G1 X77.789 Y102.156 F42000
G1 Z3.24
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X77.836 Y101.806 I.616 J-.096 E.00862
G3 X77.885 Y101.106 I3.936 J-.075 E.01695
G2 X78.613 Y101.516 I5.589 J-9.081 E.02017
G2 X79.01 Y102.073 I6.717 J-4.355 E.01649
G3 X79.005 Y102.316 I-.22 J.117 E.00611
G2 X78.359 Y103.19 I1.104 J1.492 E.02661
G3 X77.654 Y103.502 I-.514 J-.21 E.02053
G3 X77.504 Y103.147 I.471 J-.409 E.00947
G1 X77.462 Y102.462 E.01654
G3 X77.416 Y101.732 I.658 J-.408 E.01836
G3 X77.683 Y101.084 I.832 J-.037 E.01747
G1 X77.832 Y101.082 E.0036
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.613 Y101.516 E-.3396
G1 X78.665 Y101.609 E-.0404
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.211 J-.121 P1  F42000
G1 X78.383 Y98.786 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X78.125 Y98.673 I-.439 J.655 E.00682
G2 X78.544 Y98.284 I-6.357 J-7.247 E.01379
G1 X78.629 Y98.27 E.00208
G1 X78.68 Y97.853 E.01013
G3 X79.388 Y97.936 I-.658 J8.716 E.01718
G3 X79.536 Y98.449 I-.22 J.341 E.01406
G1 X79.942 Y98.521 E.00995
G1 X80.288 Y98.952 E.01333
G3 X80.899 Y99.102 I-.383 J2.871 E.01522
G3 X80.828 Y99.666 I-.76 J.19 E.01402
G3 X80.592 Y100.586 I-122.729 J-30.968 E.02289
G3 X80.128 Y100.857 I-.357 J-.078 E.01458
G3 X79.36 Y100.328 I11.098 J-16.957 E.02248
G3 X78.964 Y99.736 I1.481 J-1.418 E.01728
G1 X78.599 Y99.336 E.01306
G3 X77.994 Y99.077 I1.146 J-3.508 E.01588
G3 X77.949 Y98.291 I.021 J-.395 E.02791
G3 X78.623 Y97.846 I.814 J.501 E.02009
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.388 Y97.936 E-.29259
G1 X79.533 Y98.114 E-.08741
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.083 J1.214 P1  F42000
G1 X81.424 Y97.984 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X81.186 Y97.195 I.534 J-.592 E.02089
G1 X80.948 Y96.645 E.01445
G3 X81.902 Y96.875 I-.287 J3.283 E.02374
M73 P55 R5
G1 X82.434 Y97.475 E.01935
G3 X83.006 Y98.172 I-.42 J.927 E.02252
G1 X83.241 Y98.623 E.01226
G3 X83.373 Y99.367 I-.026 J.388 E.02495
G3 X82.849 Y99.982 I-.773 J-.128 E.02046
G3 X82.23 Y100.18 I-.418 J-.239 E.01721
G2 X81.369 Y98.857 I-2.752 J.849 E.03857
G2 X80.756 Y97.711 I-5.075 J1.978 E.0314
G2 X80.691 Y96.954 I-29.158 J2.146 E.01833
G3 X80.89 Y96.644 I.387 J.03 E.00926
M106 S124.95
M106 S127.5
; WIPE_START
G1 X81.865 Y96.866 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.743 J-.964 P1  F42000
G1 X78.558 Y94.318 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X79.472 Y94.177 I.998 J3.452 E.02235
G1 X79.68 Y93.754 E.01138
G3 X79.94 Y94.144 I-.081 J.336 E.01246
G3 X79.665 Y94.942 I-5.661 J-1.51 E.02037
G3 X79.04 Y95.975 I-3.2 J-1.23 E.02925
G3 X78.821 Y96.604 I-.462 J.192 E.01758
G3 X77.856 Y96.873 I-1.17 J-2.326 E.02433
G3 X77.228 Y96.498 I.247 J-1.124 E.01795
G3 X77.689 Y95.848 I.799 J.079 E.02009
G2 X77.726 Y95.459 I-.301 J-.225 E.00992
G1 X77.422 Y95.001 E.01326
G3 X76.795 Y94.432 I.125 J-.768 E.02159
G3 X77.777 Y94.035 I.789 J.539 E.02706
G2 X78.888 Y93.778 I-.138 J-3.122 E.02766
G3 X79.623 Y93.742 I.918 J11.153 E.01776
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.89 Y93.849 E-.1093
G1 X79.94 Y94.144 E-.11386
G1 X79.821 Y94.432 E-.11851
G1 X79.811 Y94.533 E-.03832
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.925 J.791 P1  F42000
G1 X81.735 Y92.285 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X82.228 Y91.77 I.468 J-.045 E.0195
G1 X82.342 Y91.678 E.00354
G1 X82.517 Y91.185 E.01263
G3 X82.746 Y91.799 I-.207 J.428 E.01747
G3 X82.8 Y92.313 I-.629 J.325 E.01276
G3 X82.691 Y93.396 I-1.972 J.349 E.02657
G3 X82.53 Y93.948 I-.545 J.141 E.01455
G3 X81.983 Y94.584 I-.84 J-.169 E.02116
G3 X81.354 Y94.794 I-.427 J-.233 E.01758
G3 X81.046 Y93.854 I3.95 J-1.816 E.0239
G2 X80.959 Y93.307 I-.595 J-.186 E.01384
G3 X81.333 Y92.151 I.97 J-.325 E.03137
G3 X82.044 Y91.379 I.816 J.038 E.0275
G3 X82.459 Y91.176 I.596 J.694 E.01126
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.678 Y91.283 E-.09234
G1 X82.757 Y91.453 E-.07115
G1 X82.746 Y91.799 E-.13172
G1 X82.826 Y91.995 E-.08029
G1 X82.825 Y92.007 E-.00449
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.008 J.682 P1  F42000
G1 X83.578 Y90.895 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X83.908 Y90.476 I.654 J.176 E.01322
G2 X83.986 Y89.872 I-1.573 J-.51 E.01478
G3 X84.8 Y90.747 I-1.597 J2.302 E.02905
G3 X84.51 Y91.652 I-.803 J.241 E.02436
G3 X83.98 Y92.156 I-.534 J-.031 E.01943
G2 X83.346 Y91.546 I-9.19 J8.924 E.0212
G3 X83.535 Y90.255 I.759 J-.549 E.03483
G3 X83.932 Y89.853 I.578 J.174 E.01418
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.676 Y90.493 E-.37315
G1 X84.684 Y90.509 E-.00685
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.188 J-.262 P1  F42000
G1 X84.081 Y87.777 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X84.141 Y87.747 E.0016
G2 X84.674 Y87.041 I-1.963 J-2.037 E.02141
G1 X84.793 Y86.467 E.01416
G3 X85.16 Y86.953 I-.321 J.623 E.01521
G2 X85.616 Y87.108 I.35 J-.285 E.01224
G2 X86.411 Y87.276 I.724 J-1.452 E.01983
G3 X87.332 Y87.709 I.345 J.461 E.03005
G3 X87.148 Y88.667 I-1.988 J.115 E.02378
G2 X86.95 Y89.218 I.463 J.477 E.01462
G1 X86.853 Y89.418 E.00537
G3 X86.626 Y89.529 I-.271 J-.27 E.00621
G3 X86.114 Y89.113 I.26 J-.844 E.0163
G3 X85.678 Y88.813 I1.028 J-1.961 E.01278
G3 X84.765 Y88.637 I-.165 J-1.597 E.02275
G3 X83.904 Y88.27 I.268 J-1.827 E.02283
G3 X83.459 Y87.732 I.127 J-.558 E.01812
G2 X84.231 Y87.011 I-5.129 J-6.27 E.02548
G3 X84.736 Y86.456 I.682 J.113 E.01914
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.986 Y86.611 E-.11183
G1 X85.16 Y86.953 E-.14576
G1 X85.362 Y87.095 E-.09368
G1 X85.437 Y87.099 E-.02873
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.216 J.055 P1  F42000
G1 X85.59 Y83.68 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X86.086 Y83.28 I.65 J.298 E.0159
G1 X86.16 Y83.177 E.00306
G1 X86.242 Y82.726 E.01106
G2 X86.948 Y83.151 I3.102 J-4.349 E.01991
G2 X87.402 Y83.662 I4.285 J-3.351 E.01647
G3 X87.021 Y84.179 I-.485 J.042 E.01692
G3 X86.361 Y84.76 I-.985 J-.453 E.02183
G3 X85.86 Y85.103 I-.375 J-.011 E.01706
G3 X85.152 Y84.644 I5.673 J-9.529 E.02035
G2 X84.748 Y84.256 I-1.334 J.987 E.01357
G3 X84.914 Y83.768 I.26 J-.184 E.01449
G2 X85.273 Y83.337 I-.052 J-.409 E.0149
G3 X85.834 Y82.911 I.879 J.576 E.0173
G3 X86.189 Y82.701 I.306 J.111 E.01079
M106 S124.95
M106 S127.5
; WIPE_START
G1 X86.948 Y83.151 E-.33533
G1 X87.026 Y83.239 E-.04467
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.036 J-.639 P1  F42000
G1 X85.61 Y80.943 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X86.02 Y80.465 I.559 J.066 E.0161
G3 X86.209 Y80.319 I.521 J.479 E.00579
G1 X86.325 Y79.861 E.01139
G3 X86.662 Y80.269 I-.189 J.5 E.01334
G1 X87.083 Y80.556 E.0123
G3 X87.638 Y80.967 I-.239 J.903 E.01705
G3 X88.44 Y81.512 I-6.886 J11.002 E.02339
G2 X88.813 Y82.181 I5.156 J-2.437 E.01848
G3 X88.486 Y82.585 I-.355 J.047 E.01404
G3 X87.654 Y82.7 I-1.013 J-4.251 E.02029
G3 X87.094 Y82.3 I.578 J-1.401 E.01676
G1 X86.89 Y82.421 E.00572
G3 X86.347 Y82.172 I1.008 J-2.914 E.01442
G1 X85.763 Y81.545 E.02068
G2 X85.257 Y81.419 I-.667 J1.612 E.01261
G3 X85.089 Y80.933 I.076 J-.298 E.01469
G3 X85.518 Y80.249 I16.752 J10.031 E.01945
G3 X86.268 Y79.853 I2.935 J4.645 E.02047
M106 S124.95
M106 S127.5
; WIPE_START
G1 X86.492 Y79.965 E-.09537
G1 X86.662 Y80.269 E-.13229
G1 X86.993 Y80.495 E-.15234
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.844 J-.877 P1  F42000
G1 X83.964 Y77.58 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X84.56 Y77.188 I.809 J.582 E.01758
G1 X84.578 Y76.769 E.01013
G3 X85.718 Y77.397 I-.035 J1.413 E.03264
G3 X85.998 Y77.886 I-.191 J.434 E.01455
G3 X85.052 Y79.03 I-2.259 J-.904 E.03638
G3 X84.062 Y78.957 I-.404 J-1.277 E.02453
G3 X83.345 Y78.637 I-.033 J-.888 E.0196
G3 X83.018 Y78.104 I-.014 J-.358 E.01832
G3 X83.556 Y77.422 I4.671 J3.132 E.02098
G3 X84.52 Y76.766 I1.101 J.582 E.02925
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.835 Y76.787 E-.11993
G1 X85.272 Y76.954 E-.17802
G1 X85.426 Y77.107 E-.08205
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.096 J-1.213 P1  F42000
G1 X80.192 Y77.521 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.074 Y76.473 I1.062 J-.651 E.02626
G2 X80.81 Y76.946 I2.663 J-3.342 E.02113
G2 X81.418 Y77.073 I1.373 J-5.048 E.015
G3 X81.373 Y77.744 I-.263 J.319 E.01894
G3 X80.657 Y78.425 I-.783 J-.106 E.02575
G3 X79.955 Y78.073 I-.323 J-.232 E.02705
G2 X79.621 Y77.299 I-7.15 J2.625 E.02034
G3 X79.881 Y76.448 I.77 J-.23 E.02272
G1 X80.022 Y76.447 E.00341
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.224 Y76.551 E-.08644
G1 X80.384 Y76.738 E-.09356
G1 X80.81 Y76.946 E-.17984
G1 X80.862 Y76.956 E-.02016
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.227 J-1.196 P1  F42000
G1 X77.377 Y77.619 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X77.268 Y77.018 I-1.708 J-.001 E.01482
G2 X77.137 Y76.444 I-1.156 J-.037 E.01435
G3 X78.01 Y77.287 I-.275 J1.159 E.03072
G3 X78.513 Y77.832 I-1.245 J1.653 E.01798
G3 X77.651 Y79.142 I-1.855 J-.282 E.039
G3 X77.009 Y78.708 I-.204 J-.39 E.02286
G3 X76.856 Y78.218 I1.042 J-.594 E.01246
G1 X76.972 Y77.494 E.01767
G3 X77.079 Y76.444 I.646 J-.465 E.02784
M106 S124.95
M106 S127.5
; WIPE_START
G1 X77.253 Y76.445 E-.06631
G1 X77.508 Y76.578 E-.10931
G1 X77.794 Y76.88 E-.15786
G1 X77.851 Y76.988 E-.04652
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.999 J.695 P1  F42000
G1 X80.942 Y81.429 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X81.27 Y81.399 E.00794
G1 X81.861 Y80.863 E.01923
G1 X82.021 Y80.375 E.01237
G2 X81.717 Y79.604 I-36.794 J14.036 E.01998
G3 X82.223 Y79.746 I-.001 J.978 E.01284
G3 X83.458 Y79.951 I-1.141 J10.699 E.0302
G3 X83.411 Y80.566 I-.234 J.292 E.01751
G1 X83.253 Y81.006 E.01126
G3 X83.795 Y82.156 I-5.039 J3.078 E.03072
G3 X83.311 Y82.557 I-.331 J.094 E.01915
G2 X82.486 Y82.162 I-41.183 J84.926 E.02206
G3 X81.901 Y82.085 I-.131 J-1.263 E.01437
G1 X81.163 Y82.51 E.02053
G1 X81.287 Y82.569 E.00332
G3 X80.667 Y82.557 I-.308 J-.126 E.01926
G2 X80.295 Y82.117 I-1.862 J1.198 E.01396
G2 X80.068 Y81.783 I-.402 J.029 E.01019
G1 X79.551 Y81.608 E.01316
G2 X78.938 Y82.287 I2.956 J3.287 E.02211
G3 X78.446 Y82.111 I-.098 J-.502 E.01323
G3 X77.814 Y81.653 I.12 J-.829 E.01955
G3 X77.707 Y80.955 I.064 J-.367 E.02238
G3 X78.327 Y80.641 I4.452 J8.001 E.01677
G3 X78.833 Y79.893 I2.188 J.935 E.02191
G3 X79.423 Y80.275 I-.013 J.668 E.01787
G1 X79.668 Y80.673 E.01126
G1 X80.102 Y80.666 E.01046
G1 X80.434 Y80.928 E.01018
G2 X81.092 Y80.993 I.506 J-1.753 E.01605
G1 X81.496 Y80.626 E.01316
G2 X81.478 Y80.137 I-.309 J-.234 E.0128
G3 X81.659 Y79.603 I.315 J-.19 E.01547
M106 S124.95
M106 S127.5
; WIPE_START
G1 X81.908 Y79.614 E-.09473
G1 X82.223 Y79.746 E-.12991
G1 X82.631 Y79.775 E-.15537
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.196 J-.226 P1  F42000
G1 X81.693 Y84.747 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X82.024 Y84.46 I.425 J.155 E.01103
G3 X82.206 Y84.316 I.514 J.462 E.00564
G1 X82.337 Y83.849 E.01168
G3 X82.608 Y84.183 I-.126 J.379 E.01095
G3 X83.124 Y85.119 I-1.205 J1.274 E.02618
G3 X83.115 Y85.848 I-.174 J.362 E.02202
G3 X82.597 Y86.455 I-.74 J-.106 E.0203
G3 X81.972 Y86.661 I-.424 J-.235 E.01745
G2 X81.707 Y86.025 I-12.296 J4.757 E.0166
G3 X81.206 Y85.377 I.584 J-.97 E.02022
G3 X81.101 Y84.921 I.131 J-.27 E.01295
G2 X81.475 Y84.291 I-19.924 J-12.26 E.01766
G3 X82.28 Y83.841 I2.47 J3.469 E.02227
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.498 Y83.948 E-.09244
G1 X82.608 Y84.183 E-.09867
G1 X82.914 Y84.575 E-.1889
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.169 J-1.205 P1  F42000
G1 X78.12 Y83.902 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X78.598 Y83.768 I-.848 J-3.946 E.01198
G1 X78.649 Y83.35 E.01014
G3 X79.277 Y83.705 I-.109 J.929 E.01786
G3 X79.356 Y84.425 I-.077 J.373 E.02313
G3 X77.795 Y84.242 I-.755 J-.311 E.05107
G3 X77.656 Y83.558 I.29 J-.415 E.01859
G2 X78.47 Y83.359 I-1.114 J-6.348 E.02022
G1 X78.591 Y83.346 E.00292
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.797 Y83.362 E-.07872
G1 X79.078 Y83.504 E-.11958
G1 X79.277 Y83.705 E-.10733
G1 X79.442 Y83.81 E-.07437
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.099 J-.523 P1  F42000
G1 X78.156 Y86.513 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X78.454 Y86.217 E.01012
G3 X78.513 Y85.447 I4.908 J-.014 E.01865
G2 X79.059 Y85.735 I1.589 J-2.347 E.01492
G2 X79.681 Y86.372 I47.436 J-45.73 E.02148
G3 X79.571 Y86.733 I-.28 J.111 E.00982
G3 X78.539 Y87.724 I-.971 J.023 E.03881
G3 X77.922 Y87.657 I-.276 J-.335 E.01667
G3 X77.286 Y87.193 I.255 J-1.018 E.01946
G3 X77.359 Y86.403 I.089 J-.39 E.02776
G3 X77.908 Y86.168 I3.236 J6.777 E.0144
G2 X78.128 Y85.6 I-.8 J-.638 E.01491
G3 X78.46 Y85.422 I.276 J.116 E.00982
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.78 Y85.639 E-.14682
G1 X79.059 Y85.735 E-.11184
G1 X79.282 Y85.963 E-.12134
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.207 J.157 P1  F42000
G1 X79.699 Y89.171 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X80.171 Y88.718 I-1.59 J-2.126 E.01581
G2 X80.665 Y88.026 I-.186 J-.655 E.02214
G3 X81.422 Y88.817 I-2.333 J2.989 E.02649
G3 X82.121 Y89.163 I.074 J.73 E.01982
G3 X81.878 Y89.589 I-.632 J-.077 E.01214
G3 X81.348 Y90.212 I-.793 J-.138 E.0207
G3 X80.819 Y90.465 I-.513 J-.392 E.01468
G3 X79.659 Y89.621 I.293 J-1.622 E.0358
G2 X78.796 Y89.757 I-.249 J1.233 E.02152
G3 X78.284 Y89.754 I-.254 J-.474 E.01287
G3 X77.049 Y89.223 I-.275 J-1.062 E.0349
G3 X77.831 Y88.758 I.675 J.245 E.02377
G2 X78.534 Y88.711 I.218 J-2.015 E.01707
G3 X78.783 Y88.758 I.087 J.224 E.00645
G1 X79.102 Y89.062 E.01061
G1 X79.622 Y88.719 E.01503
G3 X80.295 Y88.145 I1.949 J1.605 E.02146
G3 X80.608 Y88.018 I.424 J.597 E.00821
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.828 Y88.126 E-.0931
G1 X81.32 Y88.698 E-.2869
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.789 J-.926 P1  F42000
G1 X77.88 Y91.629 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X78.303 Y91.065 I-5.552 J-4.607 E.01701
G1 X78.733 Y91.057 E.01036
G1 X78.85 Y90.653 E.01013
G3 X78.625 Y92.527 I-.278 J.917 E.06453
G3 X78.142 Y93.099 I-2.853 J-1.92 E.01809
G3 X77.628 Y92.888 I-.092 J-.507 E.01414
G3 X77.071 Y92.454 I.335 J-1.006 E.01738
G3 X76.769 Y91.886 I.07 J-.401 E.01788
G3 X77.485 Y91.459 I4.202 J6.231 E.0201
G3 X78.122 Y90.651 I2.755 J1.518 E.02493
G3 X78.795 Y90.636 I.435 J4.367 E.01624
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.152 Y90.781 E-.14641
G1 X79.411 Y91.062 E-.145
G1 X79.497 Y91.278 E-.08859
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.694 J.999 P1  F42000
G1 X84.397 Y94.683 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X84.814 Y94.196 I.579 J.074 E.01636
G3 X84.997 Y94.053 I.51 J.463 E.00565
G1 X85.121 Y93.59 E.01155
G3 X85.689 Y94.202 I-1.595 J2.049 E.02022
G3 X86.634 Y94.995 I.008 J.951 E.03237
G3 X87.03 Y95.695 I-.661 J.836 E.01989
G3 X87.303 Y96.456 I-.265 J.525 E.02151
G3 X86.503 Y96.567 I-.54 J-.955 E.01996
G3 X85.459 Y96.545 I-.492 J-1.462 E.02569
G3 X84.869 Y96.249 I-.143 J-.451 E.01759
G1 X84.921 Y96.031 E.0054
G1 X84.744 Y95.583 E.01162
G1 X84.299 Y95.213 E.01397
G3 X83.824 Y94.81 I-.059 J-.413 E.01696
G2 X84.086 Y94.307 I-3.556 J-2.176 E.01371
G3 X84.587 Y93.84 I.751 J.304 E.01704
G3 X85.064 Y93.582 I.689 J.704 E.01325
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.284 Y93.69 E-.0931
G1 X85.689 Y94.202 E-.24814
G1 X85.79 Y94.216 E-.03876
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.202 J.191 P1  F42000
G1 X86.197 Y91.653 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X85.969 Y91.29 I.254 J-.413 E.01072
G1 X85.854 Y91.118 E.00499
G2 X86.297 Y91.037 I.104 J-.688 E.01106
G1 X86.312 Y90.617 E.01014
G3 X86.936 Y90.863 I-.004 J.924 E.01655
G3 X87.944 Y90.925 I-12.236 J206.951 E.02434
G3 X88.715 Y91.74 I-.841 J1.57 E.02753
G3 X88.788 Y92.438 I-.203 J.374 E.0199
G2 X88.05 Y92.611 I.421 J3.451 E.01831
G2 X87.431 Y92.684 I-.234 J.674 E.01556
G3 X86.162 Y92.17 I-.346 J-.971 E.03612
G3 X85.604 Y91.571 I1.011 J-1.501 E.0199
G3 X85.357 Y90.982 I4.071 J-2.058 E.01542
G3 X85.944 Y90.702 I.425 J.134 E.01762
G1 X86.255 Y90.612 E.00779
M106 S124.95
M106 S127.5
; WIPE_START
G1 X86.535 Y90.645 E-.10721
G1 X86.936 Y90.863 E-.17358
G1 X87.197 Y90.879 E-.09921
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.937 J.777 P1  F42000
G1 X89.008 Y88.694 Z3.64
G1 Z3.24
M73 P56 R5
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.553 Y88.402 I.625 J.512 E.01529
G2 X89.799 Y87.708 I-.701 J-.638 E.01824
G3 X90.121 Y88.328 I-.323 J.562 E.01779
G3 X90.097 Y89.66 I-.672 J.654 E.03574
G3 X89.747 Y90.298 I-14.617 J-7.612 E.01754
G3 X89.197 Y90.253 I-.255 J-.263 E.01506
G3 X88.664 Y89.567 I4.28 J-3.873 E.02096
G3 X88.499 Y88.956 I.269 J-.401 E.01664
G3 X89.294 Y88.042 I.981 J.051 E.03148
G3 X89.742 Y87.698 I.658 J.392 E.01395
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.977 Y87.837 E-.10387
G1 X90.084 Y88.06 E-.09398
G1 X90.121 Y88.328 E-.10272
G1 X90.223 Y88.51 E-.07944
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.043 J.628 P1  F42000
G1 X91.777 Y85.929 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.105 Y85.652 I.423 J.168 E.01078
G3 X92.287 Y85.508 I.512 J.46 E.00564
G1 X92.418 Y85.041 E.01168
G3 X92.696 Y85.391 I-.132 J.391 E.01141
G3 X93.574 Y86.477 I-7.672 J7.1 E.0337
G3 X93.326 Y86.909 I-.637 J-.079 E.01234
G3 X92.801 Y87.525 I-.922 J-.254 E.02014
G3 X92.184 Y87.723 I-.43 J-.28 E.01692
G3 X91.135 Y86.418 I27.504 J-23.19 E.04038
G3 X91.344 Y85.9 I.429 J-.128 E.01454
G3 X91.885 Y85.29 I.905 J.257 E.02033
G3 X92.36 Y85.033 I.687 J.703 E.01321
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.579 Y85.14 E-.09243
G1 X92.696 Y85.391 E-.10549
G1 X92.875 Y85.536 E-.08746
G1 X93.024 Y85.736 E-.09462
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.204 J.179 P1  F42000
G1 X93.422 Y88.415 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.085 Y88.231 I.434 J.278 E.01817
G1 X94.221 Y88.195 E.0034
G1 X94.431 Y87.77 E.01143
G3 X94.616 Y88.367 I-.073 J.35 E.01833
G3 X94.402 Y88.951 I-54.931 J-19.76 E.015
G3 X93.696 Y89.446 I-2.308 J-2.544 E.02086
G3 X92.735 Y89.955 I-.811 J-.369 E.0282
G1 X92.272 Y90.231 E.013
G3 X91.522 Y90.179 I-.368 J-.117 E.02484
G3 X91.138 Y89.704 I.355 J-.68 E.01513
G3 X90.976 Y89.024 I.247 J-.418 E.01882
G2 X91.506 Y88.854 I-.837 J-3.518 E.01342
G2 X92.437 Y88.266 I-1.221 J-2.961 E.02669
G3 X93.199 Y88.052 I1.629 J4.349 E.01912
G3 X94.077 Y87.799 I.634 J.548 E.02332
G3 X94.374 Y87.758 I.242 J.666 E.00728
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.64 Y87.863 E-.10855
G1 X94.695 Y87.982 E-.04966
G1 X94.616 Y88.367 E-.14936
G1 X94.551 Y88.546 E-.07244
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.166 J.347 P1  F42000
G1 X95.038 Y90.184 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X95.367 Y89.905 I.423 J.165 E.01084
G3 X95.559 Y89.755 I.531 J.483 E.0059
G1 X95.68 Y89.294 E.01149
G3 X96.132 Y89.875 I-.709 J1.018 E.01801
G3 X96.491 Y90.464 I-.714 J.839 E.01692
G3 X96.567 Y91.183 I-.081 J.372 E.02298
G3 X96.043 Y91.799 I-.922 J-.254 E.02015
G3 X95.425 Y91.996 I-.43 J-.28 E.01692
G3 X94.399 Y90.675 I10.981 J-9.59 E.04037
G3 X94.607 Y90.153 I.427 J-.132 E.01464
G3 X95.147 Y89.543 I.905 J.257 E.02033
G3 X95.623 Y89.286 I.687 J.703 E.01321
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.843 Y89.394 E-.09311
G1 X96.132 Y89.875 E-.21324
G1 X96.257 Y90.022 E-.07365
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.842 J.878 P1  F42000
G1 X98.107 Y91.796 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X98.744 Y91.295 I.623 J.137 E.02119
G1 X98.89 Y91.225 E.0039
G1 X99.088 Y90.763 E.01213
G3 X99.287 Y91.382 I-.178 J.399 E.01771
G3 X99.003 Y92.236 I-.752 J.223 E.02311
G3 X98.529 Y93.084 I-5.608 J-2.573 E.02346
G1 X98.346 Y93.572 E.01257
G3 X98.271 Y94.225 I-.429 J.281 E.01721
G3 X97.287 Y94.183 I-.284 J-4.88 E.02378
G2 X96.754 Y93.828 I-2.807 J3.631 E.01547
G3 X96.806 Y93.173 I.135 J-.319 E.02086
G1 X97.03 Y92.693 E.01277
G3 X97.823 Y91.452 I.983 J-.246 E.03977
G3 X98.63 Y90.884 I.82 J.308 E.02529
G3 X99.031 Y90.753 I.427 J.63 E.0103
M106 S124.95
M106 S127.5
; WIPE_START
G1 X99.234 Y90.841 E-.08426
G1 X99.301 Y90.98 E-.05868
G1 X99.287 Y91.382 E-.15284
G1 X99.292 Y91.604 E-.08421
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.098 J1.213 P1  F42000
G1 X102.129 Y91.832 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X102.502 Y91.485 I.318 J-.032 E.01421
G1 X102.589 Y91.074 E.01013
G3 X103.334 Y91.285 I-.528 J3.279 E.01871
G3 X103.16 Y91.914 I-.668 J.154 E.01641
G1 X103.204 Y92.487 E.01385
G3 X103.246 Y93.15 I-.205 J.346 E.01885
G3 X101.7 Y92.489 I-.384 J-1.241 E.04412
G3 X101.702 Y91.885 I1.923 J-.295 E.01461
G3 X102.532 Y91.063 I.751 J-.072 E.03223
M106 S124.95
M106 S127.5
; WIPE_START
G1 X103.23 Y91.205 E-.27057
G1 X103.334 Y91.285 E-.04981
G1 X103.356 Y91.44 E-.05962
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.131 J-.449 P1  F42000
G1 X101.874 Y87.708 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X102.045 Y87.157 I-3.429 J-1.367 E.01393
G3 X102.362 Y87.043 I.386 J.579 E.0082
G1 X102.449 Y86.632 E.01013
G3 X103.078 Y86.732 I-.587 J5.696 E.01538
G3 X103.044 Y87.398 I-.262 J.32 E.01867
G3 X102.616 Y88.043 I-.857 J-.104 E.01936
G1 X102.562 Y88.362 E.00781
G2 X103.028 Y89.258 I3.674 J-1.34 E.02442
G3 X102.7 Y89.663 I-.355 J.047 E.01405
G3 X101.604 Y89.677 I-.581 J-2.47 E.02665
G1 X101.467 Y89.963 E.00764
G3 X100.541 Y89.595 I-.354 J-.457 E.02895
G1 X100.496 Y89.081 E.01243
G3 X101.263 Y87.887 I.95 J-.234 E.03831
G2 X101.59 Y87.134 I-.649 J-.73 E.02042
G3 X102.392 Y86.62 I.785 J.342 E.02437
M106 S124.95
M106 S127.5
; WIPE_START
G1 X103.078 Y86.732 E-.2642
G1 X103.232 Y86.925 E-.09372
G1 X103.229 Y86.983 E-.02209
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.099 J-.523 P1  F42000
G1 X101.52 Y83.389 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X102.539 Y82.275 I-.277 J-1.277 E.03881
G3 X102.805 Y82.81 I-.276 J.471 E.01525
G3 X103.056 Y83.271 I-.62 J.637 E.01284
G3 X103.348 Y83.987 I-.251 J.519 E.02041
G3 X102.615 Y84.107 I-.533 J-.951 E.01828
G1 X102.208 Y84.524 E.01404
G2 X102.213 Y85.233 I4.554 J.32 E.01713
G3 X101.741 Y85.423 I-.347 J-.182 E.01335
G2 X101.14 Y85.258 I-1.333 J3.684 E.01505
G3 X100.717 Y84.706 I.642 J-.931 E.01705
G1 X100.463 Y84.244 E.01273
G3 X101.262 Y83.039 I.977 J-.219 E.03897
G2 X102.068 Y82.481 I-.173 J-1.11 E.02443
G3 X102.482 Y82.265 I.439 J.337 E.01164
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.692 Y82.355 E-.08686
G1 X102.805 Y82.81 E-.17826
G1 X102.94 Y82.97 E-.07934
G1 X102.974 Y83.057 E-.03554
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.967 J-.739 P1  F42000
G1 X100.667 Y80.039 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X100.65 Y80.019 E.00063
G3 X101.501 Y79.717 I1.243 J2.152 E.0219
G1 X101.59 Y79.307 E.01013
G3 X102.337 Y79.962 I-.413 J1.224 E.02459
G3 X103.314 Y80.449 I-.134 J1.493 E.02694
G3 X102.808 Y80.993 I-.476 J.064 E.02047
G2 X101.249 Y81.223 I.097 J6.039 E.0381
G3 X100.439 Y80.395 I.41 J-1.212 E.029
G3 X100.279 Y79.721 I.233 J-.411 E.01876
G2 X101.142 Y79.326 I-2.905 J-7.492 E.0229
G1 X101.534 Y79.293 E.00948
M106 S124.95
M106 S127.5
; WIPE_START
G1 X101.845 Y79.398 E-.12457
G1 X102.098 Y79.576 E-.11768
G1 X102.289 Y79.884 E-.13775
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.208 J-.147 P1  F42000
G1 X102.029 Y77.757 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X102.505 Y77.545 I.403 J.264 E.01328
G1 X102.644 Y77.477 E.00373
G1 X102.814 Y77.007 E.01205
G3 X103.076 Y77.464 I-.188 J.411 E.01356
G2 X103.048 Y77.802 I.448 J.206 E.00833
G2 X103.399 Y78.544 I95.433 J-44.643 E.0198
G3 X103.069 Y78.908 I-.358 J.007 E.01306
G3 X102.055 Y78.662 I-.205 J-1.368 E.02582
G3 X101.507 Y78.392 I.059 J-.811 E.0151
G3 X101.895 Y77.262 I1.566 J-.094 E.02956
G2 X102.597 Y77.033 I-2.887 J-10.059 E.01781
G1 X102.757 Y76.998 E.00395
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.986 Y77.091 E-.09407
G1 X103.076 Y77.464 E-.14582
G1 X103.048 Y77.802 E-.12861
G1 X103.061 Y77.829 E-.01151
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.168 J-1.205 P1  F42000
G1 X99.686 Y78.299 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X100.15 Y77.614 I-20.694 J-14.549 E.01996
G1 X100.229 Y77.554 E.00239
G1 X100.394 Y77.065 E.01244
G3 X100.652 Y77.566 I-.32 J.483 E.0142
G3 X100.308 Y78.438 I-1.617 J-.134 E.02292
G1 X100.175 Y78.774 E.00873
G2 X99.443 Y79.605 I.352 J1.048 E.02796
G3 X99.104 Y80.014 I-.701 J-.235 E.01309
G1 X99.064 Y80.482 E.01132
G3 X98.69 Y80.378 I.095 J-1.063 E.0094
G1 X98.086 Y79.981 E.01742
G3 X97.829 Y79.466 I-.006 J-.319 E.01732
G3 X98.287 Y78.756 I8.718 J5.124 E.02038
G2 X99.435 Y77.959 I-2.733 J-5.162 E.0338
G3 X100.336 Y77.057 I1.408 J.506 E.03175
M106 S124.95
M106 S127.5
; WIPE_START
G1 X100.555 Y77.164 E-.0924
G1 X100.652 Y77.566 E-.15733
G1 X100.563 Y77.897 E-.13028
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.045 J-1.216 P1  F42000
G1 X96.332 Y77.74 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X97.028 Y76.693 I-.657 J-1.191 E.03151
G3 X97.279 Y77.537 I-.338 J.56 E.02329
G3 X96.774 Y78.079 I-1.028 J-.452 E.01821
G2 X96.184 Y78.875 I25.516 J19.518 E.02391
G3 X95.281 Y79.694 I-.842 J-.021 E.03287
G3 X94.525 Y79.155 I-.148 J-.591 E.02544
G2 X94.724 Y78.694 I-.582 J-.525 E.01234
G3 X95.301 Y78.182 I.874 J.403 E.01914
G1 X95.722 Y77.854 E.01286
G3 X95.812 Y77.56 I.72 J.058 E.00748
G2 X96.687 Y76.816 I-.798 J-1.826 E.0281
G3 X96.97 Y76.684 I.361 J.405 E.00765
M106 S124.95
M106 S127.5
; WIPE_START
G1 X97.196 Y76.804 E-.09687
G1 X97.292 Y77.007 E-.08553
G1 X97.324 Y77.271 E-.10095
G1 X97.282 Y77.522 E-.09666
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.565 J-1.078 P1  F42000
G1 X94.51 Y76.069 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X95.07 Y75.802 I.584 J.506 E.01539
G1 X95.181 Y75.371 E.01073
G3 X95.382 Y75.493 I-.014 J.25 E.0059
G3 X95.576 Y76.682 I-.891 J.756 E.03051
G3 X95.273 Y77.157 I-6.311 J-3.691 E.01359
G3 X94.783 Y77.071 I-.191 J-.352 E.01295
G3 X93.893 Y76.403 I.282 J-1.301 E.02768
G3 X94.163 Y75.832 I.513 J-.107 E.01635
G3 X95.124 Y75.36 I1.001 J.824 E.02663
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.382 Y75.493 E-.11029
G1 X95.653 Y76.01 E-.22169
G1 X95.675 Y76.135 E-.04802
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.4 J-1.149 P1  F42000
G1 X92.211 Y77.339 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.717 Y77.191 E.0127
G1 X92.809 Y77.106 E.00302
G1 X92.78 Y76.679 E.01031
G3 X93.321 Y77.155 I.023 J.519 E.01921
G3 X92.842 Y78.538 I-.776 J.505 E.04067
G3 X92.083 Y78.237 I1.085 J-3.85 E.01972
G3 X91.714 Y76.806 I1.502 J-1.15 E.03662
G1 X92.212 Y76.91 E.01227
G2 X92.722 Y76.675 I-.396 J-1.527 E.01362
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.954 Y76.693 E-.08824
G1 X93.179 Y76.855 E-.10565
G1 X93.321 Y77.155 E-.12621
G1 X93.385 Y77.299 E-.0599
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.103 J-1.213 P1  F42000
G1 X88.953 Y77.674 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X89.696 Y77.677 I.379 J-2.333 E.01799
G1 X89.81 Y77.262 E.01038
G3 X90.17 Y78.496 I-.598 J.844 E.03346
G3 X89.726 Y79.312 I-1.825 J-.464 E.02264
G3 X88.714 Y80.053 I-5.951 J-7.072 E.03025
G3 X88.301 Y79.697 I.069 J-.498 E.01389
G3 X87.666 Y78.438 I.435 J-1.009 E.03694
G3 X88.812 Y77.251 I1.248 J.058 E.04347
G2 X89.754 Y77.245 I.453 J-2.964 E.02282
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.075 Y77.471 E-.14897
G1 X90.253 Y77.932 E-.18765
G1 X90.236 Y78.044 E-.04339
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.213 J.101 P1  F42000
G1 X90.538 Y81.655 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.518 Y81.093 I-8.621 J.024 E.01358
G2 X90.759 Y80.624 I-1.038 J-.83 E.0128
G3 X91.225 Y80.3 I4.377 J5.796 E.01369
G1 X91.387 Y79.809 E.01245
G3 X91.652 Y80.37 I-.34 J.503 E.01569
G3 X91.774 Y80.842 I-.481 J.377 E.01211
G1 X91.959 Y80.936 E.005
G1 X92.556 Y80.984 E.01443
G3 X93.018 Y80.773 I.767 J1.067 E.01234
G3 X93.668 Y80.578 I.397 J.145 E.01897
G3 X94.117 Y81.352 I-.453 J.781 E.02258
G2 X94.796 Y82.145 I2.36 J-1.334 E.02532
G3 X94.867 Y82.863 I-.086 J.371 E.02285
G3 X94.343 Y83.479 I-.922 J-.254 E.02014
G3 X93.724 Y83.676 I-.417 J-.241 E.01716
G3 X93.555 Y83.247 I.559 J-.469 E.01132
G2 X92.366 Y82.372 I-25.773 J33.767 E.03561
G2 X91.951 Y82.447 I-.176 J.212 E.01157
G1 X91.62 Y82.833 E.01227
G3 X91.378 Y83.615 I-3.475 J-.647 E.01979
G3 X90.523 Y83.207 I-.288 J-.496 E.02689
G1 X90.607 Y83 E.00539
G1 X90.494 Y82.469 E.01308
G3 X90.129 Y81.552 I.578 J-.761 E.025
G3 X90.292 Y80.696 I.892 J-.274 E.02188
G3 X90.85 Y80.062 I.82 J.159 E.02134
G3 X91.33 Y79.801 I.693 J.704 E.01334
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.548 Y79.908 E-.09244
G1 X91.629 Y80.081 E-.0726
G1 X91.652 Y80.37 E-.1101
G1 X91.758 Y80.579 E-.08919
G1 X91.761 Y80.62 E-.01567
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.46 J1.127 P1  F42000
G1 X96.031 Y82.365 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X96.385 Y81.874 I.792 J.198 E.01496
G2 X96.522 Y81.069 I-1.984 J-.752 E.01982
G3 X96.922 Y81.526 I-.464 J.81 E.01493
G3 X97.561 Y82.494 I-.708 J1.162 E.0289
G3 X97.145 Y83.303 I-6.092 J-2.618 E.02196
G2 X96.673 Y83.668 I2.797 J4.121 E.0144
G3 X96.054 Y83.477 I-.276 J-.203 E.0204
G2 X95.665 Y82.756 I-2.55 J.911 E.01984
G3 X96.024 Y81.613 I.93 J-.336 E.03105
G3 X96.467 Y81.052 I.682 J.083 E.01812
M106 S124.95
M106 S127.5
; WIPE_START
G1 X96.739 Y81.227 E-.1232
G1 X96.922 Y81.526 E-.13315
G1 X97.164 Y81.681 E-.10922
G1 X97.189 Y81.71 E-.01442
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.105 J1.212 P1  F42000
G1 X99.008 Y81.868 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X99.293 Y81.435 I.3 J-.113 E.01457
G1 X99.319 Y81.015 E.01013
G3 X100.012 Y82.008 I-.032 J.761 E.03376
G3 X99.572 Y82.58 I-.315 J.213 E.02291
G2 X99 Y82.436 I-1.533 J4.907 E.01424
G3 X99.261 Y81.012 I.324 J-.677 E.04726
M106 S124.95
M106 S127.5
; WIPE_START
G1 X99.742 Y81.154 E-.19046
G1 X99.92 Y81.333 E-.09625
G1 X100.027 Y81.554 E-.0933
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.9 J-.82 P1  F42000
G1 X97.41 Y84.427 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X98.073 Y84.243 I.434 J.278 E.01817
G1 X98.209 Y84.207 E.00339
G1 X98.419 Y83.782 E.01143
G3 X98.604 Y84.379 I-.073 J.35 E.01833
G3 X98.39 Y84.963 I-54.931 J-19.76 E.015
G3 X97.684 Y85.458 I-2.308 J-2.544 E.02086
G3 X96.723 Y85.967 I-.811 J-.369 E.0282
G1 X96.26 Y86.243 E.013
G3 X95.51 Y86.191 I-.368 J-.117 E.02484
G3 X95.126 Y85.716 I.355 J-.68 E.01513
G3 X94.964 Y85.036 I.247 J-.418 E.01882
G2 X95.494 Y84.866 I-.837 J-3.518 E.01342
G2 X96.425 Y84.278 I-1.221 J-2.961 E.02669
M73 P57 R5
G3 X97.187 Y84.064 I1.629 J4.349 E.01912
G3 X98.065 Y83.811 I.634 J.548 E.02332
G3 X98.362 Y83.77 I.242 J.666 E.00728
M106 S124.95
M106 S127.5
; WIPE_START
G1 X98.628 Y83.875 E-.10855
G1 X98.683 Y83.994 E-.04966
G1 X98.604 Y84.379 E-.14936
G1 X98.539 Y84.558 E-.07244
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.2 J.205 P1  F42000
G1 X98.869 Y86.497 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X99.195 Y85.98 I3.847 J2.063 E.01476
G2 X99.668 Y85.306 I-.175 J-.626 E.0215
G3 X99.958 Y85.656 I-.145 J.416 E.01151
G2 X100.493 Y86.315 I.797 J-.099 E.02158
G3 X100.464 Y87.065 I-.116 J.371 E.02447
G2 X99.587 Y87.511 I6.018 J12.922 E.02374
G1 X99.453 Y88.233 E.0177
G2 X99.199 Y88.656 I1.034 J.91 E.01197
G3 X98.709 Y89.131 I-.75 J-.283 E.01699
G3 X98.083 Y89.337 I-.424 J-.235 E.01748
G3 X97.927 Y88.878 I.892 J-.56 E.0118
G2 X97.25 Y88.323 I-1.006 J.536 E.02168
G3 X97.272 Y87.694 I.123 J-.311 E.01982
G3 X97.673 Y87.559 I.477 J.761 E.01029
G2 X98.374 Y86.73 I-3.51 J-3.68 E.02624
G3 X98.584 Y86.179 I.643 J-.071 E.01477
G3 X99.126 Y85.562 I.95 J.288 E.02044
G3 X99.611 Y85.298 I.7 J.708 E.01347
M106 S124.95
M106 S127.5
; WIPE_START
G1 X99.832 Y85.407 E-.09375
G1 X99.958 Y85.656 E-.10598
G1 X100.057 Y85.952 E-.1187
G1 X100.148 Y86.086 E-.06157
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.217 J-.029 P1  F42000
G1 X99.958 Y94.12 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X99.849 Y94.133 E.00265
G3 X99.867 Y93.327 I2.239 J-.353 E.01954
G1 X99.913 Y92.857 E.01138
G2 X100.414 Y93.116 I1.328 J-1.962 E.01363
G3 X101.091 Y93.77 I-4.525 J5.365 E.02272
G3 X100.972 Y94.142 I-.29 J.112 E.01019
G1 X100.388 Y94.493 E.01643
G1 X99.842 Y94.556 E.01326
G1 X99.765 Y95.185 E.01529
G3 X99.584 Y95.682 I-.605 J.061 E.01319
G3 X99.036 Y96.318 I-.995 J-.303 E.02084
G3 X98.407 Y96.528 I-.427 J-.233 E.01758
G3 X98.1 Y95.592 I3.976 J-1.827 E.02381
G3 X98.91 Y94.825 I.842 J.078 E.02938
G1 X99.269 Y94.436 E.01276
G2 X99.363 Y93.792 I-.727 J-.435 E.01612
G3 X99.657 Y92.856 I1.87 J.074 E.02393
G3 X99.86 Y92.833 I.126 J.202 E.00509
M106 S124.95
M106 S127.5
; WIPE_START
G1 X100.414 Y93.116 E-.23626
G1 X100.71 Y93.35 E-.14374
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.147 J.408 P1  F42000
G1 X101.423 Y95.355 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X101.64 Y94.898 I.35 J-.114 E.01346
G1 X101.606 Y94.478 E.01016
G3 X102.665 Y94.773 I.011 J2.01 E.02687
G1 X102.685 Y94.826 E.00137
G3 X102.459 Y95.321 I-.714 J-.027 E.01346
G3 X101.924 Y95.93 I-.808 J-.17 E.02043
G3 X101.311 Y96.127 I-.414 J-.237 E.01705
G3 X100.97 Y95.179 I2.313 J-1.366 E.02442
G3 X101.548 Y94.478 I.79 J.062 E.02334
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.385 Y94.6 E-.32166
G1 X102.516 Y94.681 E-.05834
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.19 J-.253 P1  F42000
G1 X101.856 Y97.795 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X102.315 Y97.338 I-.134 J-.594 E.01646
G3 X102.585 Y97.196 I.305 J.252 E.00756
G1 X102.639 Y96.772 E.0103
G3 X102.976 Y97.382 I.056 J.367 E.02179
G1 X102.814 Y97.578 E.00614
G3 X103.396 Y98.473 I-17.614 J12.083 E.02575
G3 X103.069 Y98.877 I-.355 J.047 E.01402
G3 X101.881 Y98.555 I-.113 J-1.931 E.03022
G1 X101.342 Y98.705 E.01351
G3 X100.024 Y98.135 I-.568 J-.495 E.04588
G3 X100.164 Y97.45 I.336 J-.288 E.01945
G2 X101.001 Y97.512 I.972 J-7.448 E.02026
G2 X101.372 Y97.574 I.229 J-.228 E.00967
G1 X101.831 Y97.333 E.01252
G3 X102.582 Y96.769 I.813 J.3 E.02392
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.93 Y96.834 E-.13464
G1 X103.038 Y96.927 E-.05402
G1 X103.063 Y97.195 E-.10244
G1 X102.976 Y97.382 E-.0783
G1 X102.958 Y97.403 E-.01061
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.048 J-.619 P1  F42000
G1 X100.864 Y100.95 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X101.496 Y100.604 I1.151 J1.35 E.0175
G2 X101.846 Y100.612 I.183 J-.362 E.00872
G1 X102.054 Y100.187 E.0114
G3 X102.315 Y100.578 I-.081 J.336 E.01246
G1 X102.172 Y100.92 E.00894
G2 X102.82 Y101.601 I1.015 J-.317 E.02346
G3 X103.384 Y101.832 I.107 J.543 E.01556
G3 X103.171 Y102.36 I-.706 J.023 E.01414
G2 X103.113 Y103.317 I5.674 J.826 E.02315
G3 X102.585 Y103.501 I-.319 J-.066 E.01622
G3 X101.936 Y102.806 I1.098 J-1.673 E.02315
G2 X101.415 Y102.667 I-.313 J.127 E.01507
G1 X100.976 Y102.944 E.01251
G3 X100.189 Y103.541 I-.712 J-.121 E.02625
G3 X100.193 Y102.217 I.929 J-.659 E.03407
G2 X100.087 Y101.454 I-2.393 J-.057 E.01867
G3 X100.882 Y100.447 I1.278 J.192 E.03237
G3 X101.701 Y100.215 I.581 J.491 E.02177
G3 X101.997 Y100.175 I.242 J.673 E.00727
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.264 Y100.283 E-.10931
G1 X102.315 Y100.578 E-.11386
G1 X102.172 Y100.92 E-.14083
G1 X102.189 Y100.959 E-.016
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.41 J-1.146 P1  F42000
G1 X97.299 Y99.21 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X97.635 Y98.91 I.429 J.141 E.01138
G3 X97.818 Y98.765 I.514 J.462 E.00566
G1 X97.948 Y98.299 E.01167
G3 X98.197 Y98.586 I-.11 J.348 E.00964
G1 X98.471 Y99.014 E.01225
G3 X99.254 Y99.218 I-1.721 J8.214 E.01952
G3 X99.166 Y99.857 I-.235 J.293 E.0187
G3 X98.627 Y100.49 I-.835 J-.165 E.02094
G3 X96.936 Y100.138 I-.717 J-.795 E.04846
G3 X96.643 Y99.563 I.694 J-.718 E.01586
G3 X97.086 Y98.741 I9.676 J4.687 E.02253
G3 X97.89 Y98.291 I2.469 J3.469 E.02227
M106 S124.95
M106 S127.5
; WIPE_START
G1 X98.109 Y98.398 E-.09256
G1 X98.197 Y98.586 E-.07886
G1 X98.471 Y99.014 E-.19302
G1 X98.51 Y99.024 E-.01557
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.266 J-1.187 P1  F42000
G1 X94.116 Y98.038 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.554 Y97.788 I.467 J.308 E.01262
G1 X94.718 Y97.333 E.01166
G3 X94.959 Y97.601 I-.1 J.331 E.00914
G3 X95.145 Y98.23 I-3.083 J1.257 E.01585
G3 X94.871 Y98.758 I-.804 J-.082 E.01469
G3 X94.619 Y99.168 I-.533 J-.045 E.01205
G3 X94.06 Y98.854 I-.056 J-.554 E.01648
G3 X94.374 Y97.401 I.396 J-.675 E.04727
G1 X94.661 Y97.325 E.00716
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.88 Y97.431 E-.09274
G1 X94.959 Y97.601 E-.07102
G1 X95.116 Y97.977 E-.15488
G1 X95.135 Y98.137 E-.06135
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.182 J-.291 P1  F42000
G1 X94.535 Y95.704 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.876 Y95.406 I.439 J.158 E.01142
G2 X95.184 Y94.8 I-.275 J-.52 E.01747
G1 X95.666 Y95.082 E.01347
G3 X96.135 Y95.299 I-.219 J1.087 E.01259
G3 X97.022 Y95.506 I-.31 J3.332 E.02202
G3 X97.019 Y95.978 I-.478 J.233 E.01179
G3 X96.778 Y96.795 I-.937 J.168 E.02131
G3 X96.142 Y97.115 I-.368 J.061 E.02278
G1 X95.675 Y96.953 E.01193
G3 X94.682 Y96.503 I-.148 J-.995 E.02778
G3 X93.981 Y96.276 I4.619 J-15.424 E.01777
G3 X93.948 Y95.872 I.18 J-.218 E.0109
G3 X94.358 Y95.206 I149.425 J91.447 E.01885
G3 X95.127 Y94.792 I2.935 J4.532 E.02108
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.666 Y95.082 E-.23271
G1 X96.018 Y95.245 E-.14729
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.747 J-.961 P1  F42000
G1 X92.917 Y92.833 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.209 Y92.459 I1.22 J.649 E.01151
G1 X93.271 Y91.972 E.01185
G3 X93.975 Y92.731 I-.881 J1.52 E.02534
G3 X94.053 Y93.436 I-.201 J.379 E.02012
G2 X93.291 Y93.611 I.551 J4.144 E.01889
G3 X92.854 Y92.221 I-.035 J-.753 E.04772
G3 X93.22 Y91.945 I.394 J.142 E.0117
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.782 Y92.36 E-.26547
G1 X93.921 Y92.628 E-.11453
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.141 J-1.209 P1  F42000
G1 X90.475 Y93.03 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.746 Y92.562 I.807 J.155 E.0133
G2 X90.874 Y91.867 I-1.372 J-.611 E.01719
G3 X91.729 Y92.746 I-1.506 J2.322 E.02984
G3 X90.632 Y93.824 I-.839 J.243 E.04535
G3 X89.916 Y93.726 I-.301 J-.467 E.01897
G3 X90.061 Y93.129 I.921 J-.094 E.01511
G3 X90.382 Y92.335 I1.202 J.023 E.02112
G3 X90.822 Y91.84 I.499 J.002 E.01746
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.576 Y92.468 E-.37274
G1 X91.585 Y92.484 E-.00726
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.213 J-.1 P1  F42000
G1 X91.351 Y95.34 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.12 Y95.081 I.548 J.354 E.02114
G1 X92.406 Y95.02 E.00705
G1 X92.61 Y94.601 E.01124
G3 X92.795 Y95.198 I-.055 J.344 E.01872
G2 X92.649 Y95.725 I.911 J.535 E.01331
G2 X92.371 Y96.323 I1.54 J1.081 E.01599
G3 X91.828 Y96.712 I-.535 J-.173 E.01725
G1 X91.379 Y96.987 E.01269
G1 X91.416 Y97.151 E.00406
G3 X90.869 Y97.933 I-36.056 J-24.661 E.023
G3 X90.33 Y97.612 I-.062 J-.509 E.01628
G3 X89.852 Y97.051 I2.707 J-2.796 E.01779
G3 X89.897 Y96.408 I.167 J-.311 E.01959
G1 X90.267 Y96.043 E.01253
G3 X90.819 Y95.232 I.86 J-.008 E.02517
G3 X91.719 Y94.613 I2.024 J1.977 E.02651
G2 X92.374 Y94.597 I.283 J-1.919 E.01588
G1 X92.553 Y94.589 E.00433
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.82 Y94.696 E-.1093
G1 X92.874 Y94.812 E-.04861
G1 X92.795 Y95.198 E-.14976
G1 X92.698 Y95.334 E-.06346
G1 X92.695 Y95.357 E-.00886
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.18 J-.296 P1  F42000
G1 X91.686 Y99.38 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.256 Y99.264 I.949 J3.216 E.01406
G1 X92.431 Y98.795 E.01206
G3 X92.678 Y99.285 I-.295 J.456 E.01388
G1 X92.651 Y99.805 E.01253
G3 X91.489 Y100.246 I-.77 J-.275 E.03407
G3 X91.152 Y99.658 I-.032 J-.372 E.02047
G3 X92.074 Y98.881 I.775 J-.016 E.03332
G1 X92.374 Y98.787 E.00757
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.588 Y98.89 E-.09039
G1 X92.665 Y99.054 E-.06887
G1 X92.678 Y99.285 E-.08811
G1 X92.66 Y99.634 E-.13264
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.213 J.095 P1  F42000
G1 X92.84 Y101.93 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X93.407 Y101.494 I-3.522 J-5.161 E.01725
G3 X93.753 Y101.499 I.134 J2.935 E.00836
G1 X93.921 Y101.04 E.01178
G3 X94.16 Y101.296 I-.084 J.318 E.0089
G2 X94.319 Y101.602 I.281 J.049 E.00895
G1 X94.798 Y101.808 E.01256
G3 X95.647 Y101.722 I.809 J3.767 E.02062
G3 X95.754 Y102.267 I-.372 J.356 E.01414
G3 X95.524 Y103.124 I-1.001 J.19 E.02214
G3 X94.711 Y103.18 I-.41 J-.031 E.02831
G3 X94.317 Y102.73 I.537 J-.869 E.01463
G1 X93.736 Y102.725 E.01403
G3 X92.9 Y102.97 I-1.803 J-4.596 E.02103
G3 X92.305 Y103.375 I-.804 J-.542 E.01779
G3 X91.6 Y103.401 I-.363 J-.269 E.01953
G2 X91.473 Y102.581 I-6.4 J.57 E.02004
G3 X92.068 Y101.713 I1.556 J.431 E.02585
G2 X93.084 Y101.195 I-.088 J-1.426 E.02827
G3 X93.696 Y101.079 I.44 J.646 E.01545
G1 X93.864 Y101.032 E.00421
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.082 Y101.132 E-.09124
G1 X94.16 Y101.296 E-.06883
G1 X94.17 Y101.433 E-.0522
G1 X94.319 Y101.602 E-.0859
G1 X94.517 Y101.687 E-.08183
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.338 J1.169 P1  F42000
G1 X97.165 Y102.453 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X97.509 Y102.11 I.407 J.064 E.01254
G1 X97.542 Y101.691 E.01013
G3 X98.292 Y102.192 I-.033 J.861 E.02288
G3 X98.575 Y102.766 I-.27 J.49 E.01643
G3 X97.612 Y103.3 I-2.027 J-2.521 E.02668
G3 X96.883 Y103.503 I-.527 J-.482 E.01925
G3 X96.81 Y102.84 I.606 J-.402 E.01671
G3 X97.484 Y101.687 I.762 J-.328 E.03743
M106 S124.95
M106 S127.5
; WIPE_START
G1 X97.787 Y101.723 E-.11591
G1 X98.051 Y101.865 E-.11374
G1 X98.286 Y102.184 E-.15035
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.018 J-1.217 P1  F42000
G1 X89.087 Y102.316 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.495 Y102.009 I.417 J.129 E.01316
G1 X89.614 Y101.943 E.0033
G1 X89.779 Y101.458 E.01235
G3 X90.019 Y101.727 I-.103 J.333 E.00914
G3 X90.268 Y102.38 I-6.549 J2.875 E.01686
G2 X90.048 Y103.276 I18.031 J4.915 E.02226
G3 X89.438 Y103.427 I-.339 J-.063 E.01902
G2 X88.483 Y102.815 I-1.532 J1.341 E.02772
G3 X88.667 Y102.233 I.339 J-.213 E.01674
G3 X89.344 Y101.612 I.813 J.207 E.02344
G3 X89.722 Y101.449 I.532 J.715 E.01001
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.94 Y101.556 E-.09234
G1 X90.019 Y101.727 E-.07143
G1 X90.193 Y102.066 E-.14479
G1 X90.237 Y102.248 E-.07144
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.864 J-.857 P1  F42000
G1 X86.575 Y98.557 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X86.567 Y98.549 E.00027
G2 X86.417 Y98.063 I-1.849 J.308 E.0123
G2 X86.837 Y98.041 I.086 J-2.367 E.01017
G1 X86.865 Y97.622 E.01013
G3 X87.542 Y98.05 I-.102 J.909 E.01997
G1 X88.42 Y98.239 E.02168
G1 X88.237 Y97.944 E.00837
G3 X88.917 Y98.258 I.193 J.477 E.02023
G3 X89.286 Y98.739 I-.43 J.712 E.01498
G3 X89.367 Y99.417 I-.189 J.366 E.01937
G1 X88.75 Y99.917 E.01915
G3 X88.148 Y100.605 I-.879 J-.162 E.02316
G3 X87.801 Y100.18 I.13 J-.46 E.01411
G2 X87.038 Y99.697 I-2.785 J3.554 E.0218
G3 X86.706 Y99.181 I.593 J-.747 E.01505
G3 X86.088 Y98.33 I.302 J-.87 E.02701
G3 X86.346 Y97.639 I.218 J-.312 E.02419
G2 X86.808 Y97.618 I.174 J-1.237 E.01121
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.052 Y97.639 E-.09309
G1 X87.304 Y97.786 E-.11069
G1 X87.542 Y98.05 E-.13521
G1 X87.647 Y98.073 E-.04101
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.217 J.002 P1  F42000
G1 X87.653 Y94.296 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X87.957 Y94.02 I.281 J.004 E.0111
G1 X87.984 Y93.601 E.01013
G3 X88.679 Y94.594 I-.03 J.761 E.0338
G3 X88.239 Y95.166 I-.315 J.213 E.02291
G2 X87.666 Y95.022 I-1.533 J4.907 E.01424
G3 X87.926 Y93.597 I.324 J-.677 E.04723
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.408 Y93.74 E-.19092
G1 X88.587 Y93.919 E-.09624
G1 X88.693 Y94.139 E-.09285
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.216 J-.038 P1  F42000
G1 X88.414 Y85.217 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.978 Y84.837 I.472 J.092 E.01822
G1 X89.074 Y84.427 E.01015
G2 X89.453 Y84.49 I.304 J-.659 E.00937
G3 X89.978 Y85.086 I-.022 J.549 E.02142
G2 X89.707 Y85.615 I.317 J.497 E.01501
G3 X89.326 Y86.067 I-.845 J-.324 E.01452
G3 X88.48 Y86.363 I-1.027 J-1.579 E.02182
G3 X87.879 Y85.802 I.004 J-.607 E.02179
G2 X87.981 Y85.208 I-.51 J-.393 E.01512
G3 X89.017 Y84.416 I.911 J.118 E.03498
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.283 Y84.506 E-.10643
G1 X89.453 Y84.49 E-.06508
G1 X89.766 Y84.603 E-.12637
G1 X89.909 Y84.766 E-.08213
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.159 J-.373 P1  F42000
G1 X84.491 Y101.612 Z3.64
G1 Z3.24
G1 E.4 F1800
M73 P58 R5
G1 F9000
M204 S6000
G1 X84.926 Y101.128 E.0157
G3 X85.193 Y100.493 I11.803 J4.579 E.0166
G1 X85.245 Y100.001 E.01195
G3 X85.921 Y100.571 I-2.176 J3.262 E.02138
G3 X86.056 Y101.236 I-.908 J.531 E.01665
G1 X86.235 Y101.351 E.00513
G1 X86.417 Y101.794 E.01157
G3 X86.99 Y103.043 I-4.229 J2.696 E.03324
G3 X86.357 Y103.426 I-.367 J.108 E.02425
G3 X85.764 Y102.764 I1.216 J-1.685 E.02161
G2 X84.999 Y103.46 I.457 J1.27 E.0256
G3 X84.293 Y103.309 I-.263 J-.493 E.01891
G1 X84.164 Y103.168 E.0046
G1 X83.605 Y103.03 E.01389
G3 X82.994 Y102.601 I-.247 J-.298 E.02436
G1 X83.1 Y102.042 E.01374
G2 X83.398 Y101.578 I-1.146 J-1.064 E.01336
G3 X84.01 Y101.409 I.354 J.091 E.01854
G2 X84.604 Y100.747 I-.669 J-1.197 E.02184
G3 X84.951 Y100.035 I48.113 J22.995 E.01911
G3 X85.194 Y99.974 I.175 J.184 E.00631
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.921 Y100.571 E-.35758
G1 X85.944 Y100.626 E-.02242
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.369 J-1.16 P1  F42000
G1 X80.512 Y102.353 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X80.511 Y102.344 E.00022
G3 X80.808 Y102.036 I.327 J.018 E.01124
G1 X80.828 Y101.616 E.01013
G3 X81.748 Y101.912 I-.107 J1.908 E.02356
G1 X81.768 Y101.966 E.00137
G3 X81.586 Y102.414 I-.716 J-.029 E.01192
G3 X80.887 Y103.115 I-.907 J-.206 E.02516
G3 X80.163 Y102.853 I-.337 J-.2 E.02615
G3 X80.104 Y102.219 I8.684 J-1.129 E.01536
G3 X80.77 Y101.613 I.765 J.172 E.02314
M106 S124.95
; WIPE_START
G1 X81.47 Y101.739 E-.26994
G1 X81.716 Y101.892 E-.11006
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.198 J-.213 P1  F42000
G1 X76.983 Y75.273 Z3.64
G1 Z3.24
G1 E.4 F1800
; FEATURE: Outer wall
G1 F2063
M204 S5000
G3 X78.053 Y75.06 I1.074 J2.598 E.02648
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.928 Y75.297 I1.411 J2.431 E.00763
; WIPE_START
G1 F12000
M204 S6000
G1 X77.372 Y75.144 E-.17873
G1 X77.769 Y75.074 E-.15281
G1 X77.896 Y75.068 E-.04846
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-.01 J1.217 P1  F42000
G1 X103.017 Y75.275 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F2063
M204 S5000
G3 X103.356 Y75.441 I-1.1 J2.681 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12123
G3 X102.961 Y75.253 I-.17 J2.893 E.02165
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16618
G1 X102.793 Y75.441 E-.21382
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F2063
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.682 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.41 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.574 J1.344 E.03307
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.021 E.03551
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14975
G1 X104.36 Y102.957 E-.07769
G1 X104.36 Y102.556 E-.15255
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F2063
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.574 E.03307
G1 X78.053 Y104.94 E.57622
G3 X76.646 Y104.56 I.003 J-2.805 E.03555
G1 X103.354 Y104.56 E.64408
G1 X103.318 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.897 Y104.774 E-.17566
G1 X102.628 Y104.856 E-.10713
G1 X102.376 Y104.9 E-.09721
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F2063
M204 S5000
G3 X75.26 Y102.147 I2.463 J-1.48 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.805 J.003 E.03556
G1 X75.64 Y102.957 E.63934
G3 X75.672 Y103.545 I-3.921 J.507 E.01421
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.09442
G1 X75.38 Y102.96 E-.15588
G1 X75.305 Y102.627 E-.1297
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 21/30
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G1 X77.926 Y102.336 F42000
G1 Z3.4
M73 P59 R5
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G2 X77.788 Y101.034 I-9.21 J.318 E.03161
G3 X78.688 Y101.816 I-1.835 J3.021 E.02889
G3 X79.093 Y102.299 I-.068 J.469 E.01665
G3 X78.693 Y102.541 I-.544 J-.448 E.0115
G1 X78.363 Y102.951 E.01268
G3 X77.679 Y103.62 I-.758 J-.091 E.02495
G3 X77.587 Y102.767 I.649 J-.502 E.02177
G3 X77.554 Y101.071 I3.153 J-.908 E.04136
G3 X77.735 Y101.011 I.133 J.098 E.00489
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.536 Y101.61 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.216 J-.034 P1  F42000
G1 X78.454 Y98.695 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X78.208 Y98.638 I-.176 J.2 E.00635
G3 X79.074 Y98.34 I.86 J1.09 E.0225
G1 X79.37 Y97.89 E.013
G3 X79.582 Y98.199 I-.019 J.24 E.01034
G1 X79.454 Y98.519 E.00832
G2 X80.259 Y99.107 I1.032 J-.568 E.02482
G3 X80.96 Y99.043 I.427 J.811 E.01741
G3 X80.693 Y99.751 I-.642 J.162 E.01941
G2 X80.591 Y100.465 I1.131 J.526 E.01765
M73 P59 R4
G3 X80.307 Y100.969 I-.463 J.071 E.01504
G3 X79.825 Y100.511 I.291 J-.79 E.01649
G3 X79.123 Y100.071 I20.969 J-34.212 E.01998
G3 X78.632 Y99.254 I1.92 J-1.708 E.02311
G2 X77.708 Y98.924 I-3.118 J7.281 E.02369
G3 X77.844 Y98.378 I.092 J-.267 E.0202
G3 X78.773 Y97.959 I.94 J.844 E.02528
G1 X79.313 Y97.882 E.01316
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.549 Y97.949 E-.0932
G1 X79.582 Y98.199 E-.09563
G1 X79.454 Y98.519 E-.13105
G1 X79.563 Y98.634 E-.06013
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.008 J-.682 P1  F42000
G1 X78.001 Y96.328 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X78.083 Y96.355 E.00209
G3 X77.836 Y96.351 I-.119 J-.262 E.00615
G3 X77.945 Y96.31 I.127 J.173 E.00283
G1 X78.02 Y95.893 E.01022
G3 X78.724 Y96.117 I-.49 J2.759 E.01787
G3 X78.564 Y96.394 I-.212 J.062 E.00863
G3 X78.089 Y96.788 I-.428 J-.032 E.0166
G3 X77.164 Y96.565 I-.109 J-1.579 E.02333
G3 X77.36 Y96.165 I.501 J-.002 E.01115
G3 X77.965 Y95.875 I.819 J.933 E.01637
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.724 Y96.117 E-.30273
G1 X78.729 Y96.22 E-.03938
G1 X78.66 Y96.293 E-.03789
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J-.03 P1  F42000
G1 X78.617 Y94.526 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X79.048 Y94.29 I-5.743 J-10.983 E.01185
G2 X79.345 Y94.28 I.139 J-.278 E.00749
G1 X79.777 Y93.732 E.01683
G3 X79.984 Y94.039 I-.023 J.239 E.01022
G2 X79.604 Y94.85 I4.171 J2.449 E.02162
G3 X79.024 Y95.125 I-.575 J-.464 E.016
G3 X78.538 Y95.258 I-.385 J-.45 E.01256
G3 X78.424 Y95.077 I.095 J-.186 E.00541
G2 X77.481 Y94.914 I-.854 J2.133 E.02326
G3 X76.707 Y94.435 I-.055 J-.775 E.02344
G3 X78.091 Y94.302 I.764 J.678 E.03689
G3 X78.987 Y93.864 I37.889 J76.269 E.02405
G2 X79.72 Y93.723 I-.073 J-2.364 E.01806
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.951 Y93.79 E-.09136
G1 X79.984 Y94.039 E-.09567
G1 X79.722 Y94.474 E-.19298
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.882 J.839 P1  F42000
G1 X81.669 Y92.427 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X81.969 Y91.96 I-1.912 J-1.561 E.01341
G2 X82.261 Y91.825 I-.007 J-.396 E.00797
G1 X82.553 Y91.11 E.01864
G3 X82.674 Y91.902 I-.426 J.471 E.02092
G3 X82.506 Y92.627 I-.666 J.227 E.01892
G2 X82.607 Y93.282 I1.023 J.177 E.01626
G3 X82.62 Y93.837 I-.089 J.28 E.01755
G3 X81.995 Y94.463 I-1.659 J-1.033 E.02152
G3 X81.317 Y94.863 I-.51 J-.09 E.02157
G3 X81.26 Y94.211 I.894 J-.407 E.01608
G3 X81.243 Y93.541 I.556 J-.349 E.01696
G1 X81.359 Y93.04 E.01241
G3 X81.154 Y92.403 I.626 J-.553 E.0166
G2 X81.731 Y91.603 I-11.422 J-8.837 E.02379
G2 X82.369 Y91.154 I-.83 J-1.86 E.01892
G1 X82.496 Y91.105 E.00328
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.667 Y91.182 E-.07135
G1 X82.743 Y91.34 E-.0666
G1 X82.762 Y91.56 E-.08387
G1 X82.674 Y91.902 E-.13412
G1 X82.681 Y91.965 E-.02405
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.536 J1.093 P1  F42000
G1 X83.98 Y91.328 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X83.728 Y90.887 I.215 J-.415 E.01296
G1 X83.922 Y90.461 E.01128
G1 X83.943 Y89.792 E.01613
G3 X84.343 Y90.37 I-.46 J.746 E.01745
G3 X84.453 Y91.511 I-.415 J.615 E.03155
G3 X84.065 Y92.259 I-.732 J.095 E.02165
G3 X83.633 Y91.587 I.522 J-.81 E.01988
G3 X83.318 Y90.776 I.396 J-.62 E.02245
G3 X83.705 Y89.882 I33.817 J14.124 E.02349
G3 X83.889 Y89.772 I.205 J.135 E.00533
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.15 Y89.963 E-.12302
G1 X84.343 Y90.37 E-.17137
G1 X84.507 Y90.525 E-.08561
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.216 J-.052 P1  F42000
G1 X84.398 Y87.995 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X84.178 Y87.835 I-.279 J.152 E.0068
G1 X84.682 Y87.206 E.01945
G2 X84.806 Y86.384 I-2.351 J-.776 E.02013
G3 X85.116 Y87.128 I-.929 J.823 E.0198
G2 X85.626 Y87.544 I.944 J-.636 E.0161
G1 X86.266 Y87.581 E.01546
G1 X86.363 Y87.199 E.00951
G3 X87.163 Y87.336 I.296 J.672 E.02074
G3 X87.276 Y87.856 I-.016 J.276 E.01732
G3 X86.911 Y88.751 I-10.498 J-3.752 E.02331
G3 X86.752 Y89.597 I-.893 J.27 E.02156
G3 X86.413 Y89.454 I-.018 J-.433 E.00917
G1 X85.703 Y88.514 E.02842
G1 X85.323 Y88.671 E.0099
G3 X84.644 Y88.447 I.641 J-3.09 E.01728
G3 X84.014 Y88.229 I-.087 J-.769 E.01663
G3 X83.355 Y87.792 I-.04 J-.655 E.02046
G3 X83.987 Y87.445 I.703 J.53 E.01792
G2 X84.526 Y86.517 I-4.967 J-3.506 E.02592
G3 X84.75 Y86.373 I.319 J.25 E.00653
M106 S124.95
M106 S127.5
; WIPE_START
G1 X84.93 Y86.484 E-.08035
G1 X85.043 Y86.717 E-.09819
G1 X85.116 Y87.128 E-.15894
G1 X85.194 Y87.208 E-.04251
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.2 J.202 P1  F42000
G1 X85.761 Y83.842 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X86.158 Y83.227 E.01768
G1 X86.149 Y82.653 E.01383
G3 X86.521 Y83.014 I-.294 J.675 E.01278
G2 X87.198 Y83.46 I2.755 J-3.445 E.01958
G3 X87.485 Y83.887 I-.141 J.405 E.01331
G3 X86.815 Y84.145 I-.718 J-.868 E.01762
G2 X86.31 Y84.803 I.965 J1.265 E.02025
G3 X86.128 Y85.211 I-.491 J.026 E.01118
G3 X85.57 Y84.78 I.117 J-.729 E.01774
G3 X85.16 Y84.464 I.255 J-.756 E.0127
G3 X84.597 Y84.045 I.022 J-.616 E.018
G3 X85.306 Y83.692 I.726 J.571 E.01973
G1 X85.404 Y83.621 E.00292
G1 X85.818 Y82.979 E.01841
G3 X86.096 Y82.63 I.338 J-.016 E.01175
M106 S124.95
M106 S127.5
; WIPE_START
G1 X86.272 Y82.706 E-.07296
G1 X86.521 Y83.014 E-.1506
G1 X86.772 Y83.161 E-.11028
G1 X86.855 Y83.249 E-.04616
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.103 J-.514 P1  F42000
G1 X85.753 Y80.886 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X86.098 Y80.508 I1.069 J.629 E.01242
G1 X86.361 Y79.786 E.01853
G3 X86.526 Y80.46 I-.272 J.423 E.01845
G3 X85.709 Y81.395 I-.544 J.349 E.04018
G3 X84.939 Y81.191 I-.249 J-.617 E.0206
G3 X85.382 Y80.685 I.939 J.376 E.01653
G3 X85.788 Y80.22 I.761 J.255 E.01528
G3 X86.304 Y79.782 I1.119 J.794 E.0165
M106 S124.95
M106 S127.5
; WIPE_START
G1 X86.475 Y79.859 E-.07135
G1 X86.551 Y80.017 E-.06677
G1 X86.526 Y80.46 E-.16845
G1 X86.589 Y80.642 E-.07344
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.947 J.764 P1  F42000
G1 X87.823 Y82.172 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X87.648 Y81.729 I.152 J-.316 E.01264
G1 X87.529 Y81.296 E.01081
G3 X88.223 Y81.456 I-.08 J1.942 E.01728
G2 X88.632 Y81.929 I1.689 J-1.045 E.01514
G3 X88.743 Y82.577 I-.16 J.361 E.01874
G3 X88.137 Y82.534 I-.219 J-1.195 E.0148
G3 X87.236 Y81.816 I-.288 J-.563 E.03494
G3 X87.325 Y81.301 I.491 J-.18 E.01319
G1 X87.471 Y81.291 E.00354
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.983 Y81.357 E-.19609
G1 X88.223 Y81.456 E-.09857
G1 X88.351 Y81.64 E-.08534
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.027 J1.217 P1  F42000
G1 X90.98 Y81.699 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.592 Y81.046 E.01831
G2 X90.89 Y80.632 I-.253 J-.496 E.01277
G2 X91.153 Y80.464 I-.034 J-.344 E.00782
G1 X91.423 Y79.735 E.01876
G3 X91.581 Y80.438 I-.281 J.433 E.01924
G3 X91.614 Y81.172 I-.767 J.402 E.0183
G1 X92.324 Y81.555 E.01945
G1 X92.562 Y81.109 E.01219
G1 X92.73 Y81.059 E.00424
G3 X93.155 Y80.473 I8.751 J5.908 E.01746
G3 X94.082 Y80.987 I.037 J1.026 E.02686
G2 X93.891 Y81.769 I2.253 J.963 E.01949
G1 X94.466 Y82.172 E.01692
G3 X95.194 Y82.392 I.221 J.582 E.01974
G3 X94.756 Y82.881 I-.659 J-.15 E.01652
G3 X94.361 Y83.354 I-.764 J-.237 E.01526
G3 X93.687 Y83.745 I-.506 J-.096 E.02131
G3 X93.624 Y83.112 I.904 J-.41 E.0156
G2 X92.469 Y82.403 I-.99 J.316 E.03562
G3 X92.062 Y82.19 I.277 J-1.026 E.01116
G2 X91.484 Y83.167 I.495 J.953 E.02885
G3 X91.408 Y83.703 I-.727 J.17 E.01334
G3 X90.893 Y83.597 I-.158 J-.537 E.01321
G3 X90.461 Y83.139 I.031 J-.462 E.01669
G2 X90.807 Y82.599 I-.532 J-.723 E.01582
G1 X90.732 Y82.079 E.01267
G3 X90.33 Y81.389 I2.222 J-1.758 E.01934
G3 X90.028 Y81.034 I.013 J-.316 E.01262
G3 X90.41 Y80.658 I.986 J.621 E.01302
G3 X90.833 Y80.192 I.657 J.171 E.0158
G3 X91.366 Y79.73 I1.144 J.782 E.01719
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.537 Y79.807 E-.07134
G1 X91.613 Y79.965 E-.06677
G1 X91.581 Y80.438 E-.17991
G1 X91.623 Y80.595 E-.06197
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.19 J.253 P1  F42000
G1 X92.266 Y77.572 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X92.162 Y77.481 I-.127 J.04 E.0035
G2 X92.586 Y77.325 I-.142 J-1.039 E.011
G1 X92.586 Y76.904 E.01014
G3 X93.432 Y77.588 I-.001 J.868 E.02836
G3 X93.329 Y78.085 I-.431 J.169 E.01296
G3 X92.805 Y78.626 I-1.297 J-.731 E.01836
G3 X92.553 Y78.395 I.124 J-.387 E.00851
G3 X91.916 Y77.822 I.269 J-.94 E.02138
G3 X91.7 Y77.252 I.121 J-.372 E.01686
G3 X92.528 Y76.902 I1.716 J2.907 E.02173
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.817 Y76.913 E-.10996
G1 X93.062 Y77.023 E-.10218
G1 X93.251 Y77.217 E-.10273
G1 X93.326 Y77.371 E-.06514
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.85 J.871 P1  F42000
G1 X94.568 Y76.159 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X94.57 Y76.151 E.00022
G3 X94.948 Y75.894 I.409 J.195 E.01156
G1 X95.066 Y75.804 E.00359
G1 X95.216 Y75.317 E.01227
G3 X95.493 Y75.83 I-.242 J.462 E.0149
G3 X95.468 Y76.722 I-.803 J.424 E.0225
G3 X94.71 Y76.999 I-.384 J.124 E.0298
G3 X94.747 Y75.519 I.194 J-.736 E.04908
G3 X95.159 Y75.308 I.488 J.447 E.0114
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.384 Y75.401 E-.09249
G1 X95.493 Y75.83 E-.16798
G1 X95.589 Y76.129 E-.11953
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.381 J1.156 P1  F42000
G1 X97.062 Y76.614 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X96.503 Y77.973 I-.603 J.546 E.0442
G3 X96.066 Y78.991 I-1.928 J-.225 E.02708
G3 X95.323 Y79.757 I-1.191 J-.413 E.02657
G3 X94.424 Y79.228 I.1 J-1.199 E.02601
G3 X94.758 Y78.898 I.549 J.222 E.01163
G3 X95.528 Y78.279 I.759 J.156 E.02584
G1 X96.214 Y77.642 E.02257
G3 X96.879 Y76.657 I4.831 J2.545 E.02872
G1 X97.004 Y76.607 E.00325
M106 S124.95
M106 S127.5
; WIPE_START
G1 X97.256 Y76.872 E-.1389
G1 X97.246 Y77.393 E-.198
G1 X97.183 Y77.487 E-.04311
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.184 J1.203 P1  F42000
G1 X100.43 Y76.99 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X100.59 Y77.684 I-.279 J.43 E.01899
G3 X100.058 Y78.404 I-1.31 J-.413 E.02198
G1 X99.884 Y78.667 E.00763
G1 X99.447 Y78.647 E.01055
G1 X99.344 Y79.557 E.02209
G3 X98.453 Y79.927 I-.61 J-.211 E.02627
G3 X97.678 Y79.724 I-.252 J-.617 E.02071
G3 X98.135 Y79.208 I.953 J.383 E.01696
G3 X98.522 Y78.76 I.696 J.211 E.0147
G3 X99.084 Y78.309 I1.009 J.681 E.01763
G1 X99.152 Y78.203 E.00305
G1 X99.61 Y77.982 E.01225
G3 X100.372 Y76.986 I1.422 J.298 E.03129
M106 S124.95
M106 S127.5
; WIPE_START
G1 X100.543 Y77.063 E-.07135
G1 X100.62 Y77.221 E-.06672
G1 X100.59 Y77.684 E-.17633
G1 X100.506 Y77.835 E-.06561
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.139 J1.209 P1  F42000
G1 X102.086 Y78.016 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X102.461 Y77.674 I.291 J-.058 E.01471
G1 X102.874 Y76.964 E.01981
G3 X103.076 Y77.331 I-.064 J.274 E.01139
G2 X103.182 Y78.218 I.681 J.369 E.02298
G3 X103.325 Y78.901 I-.167 J.391 E.01971
G3 X102.274 Y78.647 I-.026 J-2.199 E.02636
G1 X101.565 Y78.567 E.0172
G3 X101.497 Y78.152 I.212 J-.248 E.01102
G2 X101.807 Y77.497 I-5.919 J-3.203 E.01749
G3 X102.312 Y77.253 I.554 J.502 E.01387
G3 X102.817 Y76.958 I.778 J.748 E.01428
M106 S124.95
M106 S127.5
; WIPE_START
G1 X103.015 Y77.009 E-.07798
G1 X103.076 Y77.331 E-.12421
G1 X102.949 Y77.712 E-.15288
G1 X102.976 Y77.772 E-.02493
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.997 J-.697 P1  F42000
G1 X101.111 Y80.44 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X100.876 Y80.111 I.279 J-.448 E.01001
G3 X101.172 Y80.003 I.3 J.363 E.00775
G1 X101.209 Y79.585 E.01013
G3 X101.817 Y80.044 I-.233 J.939 E.01887
G3 X103.111 Y80.248 I-.679 J8.498 E.03162
G3 X103.397 Y80.675 I-.141 J.405 E.01329
G3 X101.928 Y80.68 I-.738 J-.902 E.03834
G1 X101.488 Y81.112 E.01488
G3 X101.255 Y81.302 I-.281 J-.107 E.00759
G3 X100.84 Y80.761 I.474 J-.793 E.01684
G2 X100.293 Y80.225 I-2.453 J1.958 E.01851
G3 X100.24 Y79.671 I.159 J-.295 E.01584
G3 X100.813 Y79.684 I.261 J1.129 E.01396
G3 X101.152 Y79.581 I.377 J.627 E.00862
M106 S124.95
M106 S127.5
; WIPE_START
G1 X101.582 Y79.735 E-.17358
G1 X101.817 Y80.044 E-.1476
G1 X101.971 Y80.058 E-.05883
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.721 J-.981 P1  F42000
G1 X99.368 Y81.972 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X99.175 Y81.534 I-.017 J-.254 E.01499
G1 X99.066 Y81.048 E.012
G3 X99.666 Y81.231 I-.891 J4.003 E.01514
G3 X99.925 Y81.93 I-.476 J.574 E.01882
G3 X99.952 Y82.643 I-.354 J.37 E.01905
G3 X99.308 Y82.389 I.067 J-1.111 E.01698
G3 X98.759 Y81.435 I0 J-.635 E.03211
G3 X99.012 Y81.028 I.232 J-.138 E.01425
M106 S124.95
M106 S127.5
; WIPE_START
G1 X99.473 Y81.132 E-.17947
G1 X99.666 Y81.231 E-.08257
G1 X99.842 Y81.487 E-.11797
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.414 J-1.144 P1  F42000
G1 X96.386 Y82.738 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X96.291 Y82.548 I-.222 J-.007 E.00532
G3 X96.497 Y81.675 I1.565 J-.092 E.02195
G1 X96.493 Y80.988 E.01657
G3 X96.989 Y81.808 I-.956 J1.14 E.02354
G3 X97.641 Y82.45 I-15.431 J16.291 E.02206
G3 X96.812 Y83.402 I-1.945 J-.857 E.03088
G3 X96.16 Y83.831 I-.567 J-.151 E.02062
G3 X95.971 Y82.827 I3.367 J-1.153 E.02471
G3 X95.95 Y81.98 I.601 J-.438 E.02174
G3 X96.246 Y81.089 I6.935 J1.81 E.02266
G3 X96.438 Y80.97 I.232 J.161 E.00558
M106 S124.95
M106 S127.5
; WIPE_START
M73 P60 R4
G1 X96.679 Y81.143 E-.1128
G1 X96.976 Y81.78 E-.2672
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.179 J.301 P1  F42000
G1 X97.641 Y84.382 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X98.009 Y84.341 I.216 J.265 E.00943
G1 X98.516 Y83.76 E.0186
G3 X98.723 Y84.068 I-.023 J.239 E.01022
G2 X98.379 Y84.742 I7.51 J4.257 E.01825
G3 X97.735 Y85.144 I-.622 J-.28 E.01941
G3 X97.221 Y85.253 I-.363 J-.446 E.01317
G3 X97.194 Y84.683 I.582 J-.313 E.01421
G3 X97.96 Y83.904 I.61 J-.166 E.03181
G3 X98.459 Y83.752 I.579 J1.005 E.0127
M106 S124.95
M106 S127.5
; WIPE_START
G1 X98.69 Y83.818 E-.09135
G1 X98.723 Y84.068 E-.09567
G1 X98.461 Y84.503 E-.19298
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.206 J.166 P1  F42000
G1 X98.781 Y86.829 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X98.736 Y86.657 I-.133 J-.057 E.00461
G3 X99.057 Y86.406 I.926 J.851 E.00986
G3 X99.424 Y85.974 I.52 J.07 E.01444
G1 X99.704 Y85.231 E.01915
G3 X99.859 Y85.95 I-.287 J.438 E.01967
G1 X100.008 Y86.216 E.00735
G3 X100.88 Y86.718 I.016 J.979 E.02549
G3 X100.04 Y87.072 I-.671 J-.42 E.02342
G3 X99.438 Y87.324 I-.615 J-.625 E.01614
G3 X99.529 Y88.166 I-2.448 J.691 E.02052
G3 X99.139 Y88.529 I-.791 J-.459 E.01303
G3 X98.441 Y89.375 I-6.948 J-5.02 E.02645
G3 X97.982 Y89.244 I-.202 J-.161 E.01466
G1 X97.954 Y88.886 E.00868
G1 X97.637 Y88.432 E.01335
G3 X96.975 Y87.904 I-.052 J-.613 E.02249
G3 X97.799 Y87.636 I.691 J.726 E.02161
G1 X98.169 Y87.388 E.01074
G1 X98.346 Y86.813 E.0145
G3 X98.503 Y86.294 I.398 J-.163 E.01414
G2 X98.803 Y85.926 I-.368 J-.607 E.01168
G3 X99.647 Y85.226 I5.768 J6.093 E.02645
M106 S124.95
M106 S127.5
; WIPE_START
G1 X99.818 Y85.304 E-.07135
G1 X99.894 Y85.462 E-.06676
G1 X99.859 Y85.95 E-.18604
G1 X99.931 Y86.078 E-.05586
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.928 J.787 P1  F42000
G1 X101.65 Y84.051 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X102.08 Y83.32 I-.488 J-.78 E.02127
G2 X102.582 Y82.233 I-2.273 J-1.71 E.02909
G1 X102.659 Y82.241 E.00185
G3 X102.749 Y82.671 I-.141 J.254 E.01199
G1 X102.735 Y82.92 E.00603
G2 X103.214 Y83.447 I.796 J-.243 E.01775
G3 X103.325 Y84.095 I-.16 J.361 E.01875
G3 X102.555 Y83.993 I-.123 J-2.028 E.01887
G1 X102.405 Y84.055 E.00392
G1 X102.162 Y84.407 E.01032
G2 X102.238 Y85.34 I23.205 J-1.43 E.02258
G3 X101.812 Y85.447 I-.267 J-.159 E.01178
G2 X101.022 Y85.043 I-6.602 J11.935 E.02139
G3 X100.896 Y84.276 I.433 J-.466 E.02018
G3 X101.234 Y83.884 I.281 J-.099 E.01511
G1 X101.607 Y83.471 E.01343
G1 X101.691 Y83.149 E.00801
G1 X102.157 Y82.421 E.02087
G3 X102.525 Y82.227 I.41 J.332 E.01031
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.659 Y82.241 E-.05116
G1 X102.779 Y82.38 E-.06979
G1 X102.749 Y82.671 E-.11102
G1 X102.735 Y82.92 E-.09494
G1 X102.806 Y83.04 E-.05308
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.203 J-.183 P1  F42000
G1 X102.127 Y87.496 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X102.307 Y87.145 I.198 J-.12 E.01137
G1 X102.634 Y87.125 E.00789
G1 X103.057 Y86.693 E.01458
G3 X103.287 Y86.849 I.004 J.243 E.00716
G3 X102.949 Y87.418 I-.966 J-.19 E.01629
G3 X102.342 Y87.996 I-.718 J-.146 E.02151
G3 X101.797 Y88.214 I-.436 J-.301 E.01501
G3 X101.72 Y87.598 I.637 J-.392 E.01543
G3 X102.232 Y86.729 I.603 J-.23 E.02794
G1 X103 Y86.682 E.01856
M106 S124.95
M106 S127.5
; WIPE_START
G1 X103.253 Y86.77 E-.102
G1 X103.287 Y86.849 E-.03268
G1 X103.185 Y87.195 E-.13714
G1 X102.978 Y87.391 E-.10819
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.881 J-.839 P1  F42000
G1 X100.998 Y89.471 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X101.465 Y89.057 I.879 J.521 E.01529
G1 X101.551 Y88.646 E.01013
G2 X102.371 Y88.754 I.889 J-3.588 E.01998
G3 X103.078 Y89.517 I-.121 J.821 E.0271
G3 X102.807 Y89.673 I-.221 J-.07 E.00829
G3 X102.072 Y89.511 I.08 J-2.111 E.01825
G1 X101.502 Y89.64 E.0141
G3 X101.212 Y90.166 I-3.397 J-1.526 E.01449
G3 X100.799 Y89.914 I.095 J-.622 E.01198
G3 X100.467 Y89.423 I.219 J-.505 E.0151
G3 X101.265 Y88.651 I3.294 J2.607 E.02686
G1 X101.495 Y88.634 E.00554
M106 S124.95
M106 S127.5
; WIPE_START
G1 X101.862 Y88.736 E-.14495
G1 X102.109 Y88.706 E-.09439
G1 X102.371 Y88.754 E-.10134
G1 X102.467 Y88.794 E-.03932
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.214 J-.085 P1  F42000
G1 X102.262 Y91.725 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X102.701 Y91.657 I.249 J.156 E.01214
G1 X102.805 Y91.634 E.00256
G1 X103.211 Y91.166 E.01494
G3 X103.439 Y91.322 I.002 J.242 E.00709
G3 X103.139 Y91.89 I-.78 J-.048 E.01596
G1 X103.155 Y92.473 E.01407
G3 X103.405 Y93.137 I-.303 J.493 E.0184
G3 X102.068 Y92.585 I-.341 J-1.068 E.0379
G1 X101.589 Y92.176 E.01521
G3 X101.822 Y91.738 I.542 J.008 E.01243
G3 X102.707 Y91.226 I.652 J.106 E.02821
G3 X103.154 Y91.155 I.5 J1.724 E.01094
M106 S124.95
M106 S127.5
; WIPE_START
G1 X103.403 Y91.241 E-.10008
G1 X103.439 Y91.322 E-.03354
G1 X103.337 Y91.668 E-.13711
G1 X103.146 Y91.883 E-.10927
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.673 J-1.014 P1  F42000
G1 X100.006 Y93.969 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X99.958 Y93.52 I.281 J-.257 E.01166
G3 X99.815 Y92.785 I3.354 J-1.035 E.01809
G3 X100.649 Y93.479 I-1.706 J2.9 E.02629
G3 X101.175 Y93.995 I.009 J.517 E.01978
G3 X100.598 Y94.246 I-.727 J-.882 E.01537
G3 X99.525 Y93.533 I-.444 J-.496 E.04226
G3 X99.64 Y92.771 I.679 J-.287 E.01956
G1 X99.762 Y92.762 E.00294
M106 S124.95
M106 S127.5
; WIPE_START
G1 X100.507 Y93.298 E-.34879
G1 X100.558 Y93.363 E-.03121
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.723 J-.979 P1  F42000
G1 X98.439 Y91.799 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X98.336 Y91.777 I-.067 J.06 E.0027
G3 X98.783 Y91.348 I.407 J-.023 E.01695
G1 X99.123 Y90.717 E.01729
G3 X99.324 Y91.071 I-.065 J.271 E.01101
G2 X99.215 Y91.592 I1.168 J.516 E.01293
G3 X98.343 Y92.211 I-.633 J.032 E.03071
G3 X97.78 Y92.141 I-.243 J-.335 E.01505
G3 X98.083 Y91.227 I3.925 J.793 E.02327
G3 X98.905 Y90.753 I56.794 J97.52 E.02287
G1 X99.066 Y90.711 E.00402
M106 S124.95
M106 S127.5
; WIPE_START
G1 X99.267 Y90.762 E-.07898
G1 X99.324 Y91.071 E-.11939
G1 X99.194 Y91.465 E-.15746
G1 X99.204 Y91.527 E-.02417
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.929 J-.786 P1  F42000
G1 X97.428 Y93.626 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X97.278 Y93.523 E.0044
G2 X97.528 Y92.864 I-.248 J-.471 E.01857
G3 X98.214 Y93.482 I0 J.69 E.0244
G3 X98.414 Y94.23 I-.646 J.573 E.01935
G3 X97.583 Y94.114 I-.251 J-1.241 E.02062
G3 X97.105 Y93.915 I.006 J-.688 E.01281
G3 X96.479 Y93.41 I-.052 J-.576 E.02143
G3 X97.059 Y93.138 I.757 J.856 E.01565
G3 X97.47 Y92.862 I.522 J.333 E.01229
M106 S124.95
M106 S127.5
; WIPE_START
G1 X97.734 Y92.874 E-.10046
G1 X97.952 Y92.976 E-.09156
G1 X98.134 Y93.185 E-.10505
G1 X98.19 Y93.396 E-.08293
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.189 J.26 P1  F42000
G1 X98.726 Y95.84 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X98.818 Y95.386 I.147 J-.207 E.01411
G1 X98.827 Y94.965 E.01015
G3 X99.745 Y95.084 I-.558 J7.912 E.02232
G3 X99.674 Y95.571 I-.153 J.226 E.01478
G3 X99.048 Y96.197 I-1.659 J-1.033 E.02152
G3 X98.37 Y96.597 I-.51 J-.09 E.02157
G3 X98.313 Y95.945 I.868 J-.404 E.0161
G3 X98.77 Y94.96 I.546 J-.345 E.03108
M106 S124.95
M106 S127.5
; WIPE_START
G1 X99.126 Y95.025 E-.13767
G1 X99.561 Y95.018 E-.16528
G1 X99.745 Y95.084 E-.07417
G1 X99.75 Y95.09 E-.00288
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.196 J1.201 P1  F42000
G1 X101.565 Y95.386 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X101.753 Y95.009 I.174 J-.149 E.0129
G1 X101.885 Y94.608 E.01018
G2 X102.468 Y94.619 I.356 J-3.301 E.01408
G3 X102.654 Y95.116 I.041 J.268 E.01782
G2 X102.225 Y95.575 I.544 J.939 E.01538
G2 X101.876 Y95.944 I1.216 J1.499 E.01229
G3 X101.275 Y96.196 I-.439 J-.205 E.01723
G3 X101.2 Y95.6 I.91 J-.417 E.0147
G3 X101.833 Y94.584 I.528 J-.376 E.03677
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.468 Y94.619 E-.24194
G1 X102.651 Y94.684 E-.07363
G1 X102.759 Y94.815 E-.06443
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.21 J-.13 P1  F42000
G1 X102.406 Y98.1 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X102.22 Y97.764 E.00926
G1 X102.124 Y97.798 E.00246
G2 X102.907 Y96.801 I-87.172 J-69.285 E.03059
G3 X103.029 Y97.286 I-.041 J.268 E.01538
G1 X102.852 Y97.474 E.00622
G1 X102.992 Y98.073 E.01485
G3 X103.405 Y98.822 I-.171 J.583 E.02287
G3 X102.025 Y98.279 I-.338 J-1.165 E.03846
G2 X101.238 Y98.923 I.35 J1.231 E.02522
G3 X101.053 Y98.972 I-.135 J-.135 E.00483
G1 X100.42 Y98.753 E.01616
G3 X100.131 Y98.196 I.805 J-.77 E.01534
G3 X100.013 Y97.414 I.393 J-.459 E.02077
G3 X101.139 Y97.71 I-.713 J5.009 E.02815
G1 X101.278 Y97.855 E.00484
G2 X102.11 Y97.082 I-.246 J-1.1 E.02872
G3 X102.852 Y96.785 I.743 J.784 E.01973
M106 S124.95
M106 S127.5
; WIPE_START
G1 X103.12 Y96.907 E-.11181
G1 X103.152 Y96.986 E-.03231
G1 X103.029 Y97.286 E-.12341
G1 X102.852 Y97.474 E-.09806
G1 X102.86 Y97.511 E-.01441
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.128 J-.457 P1  F42000
G1 X101.393 Y101.131 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X101.13 Y100.87 I.97 J-1.244 E.00896
G3 X101.715 Y100.715 I.449 J.514 E.01513
G1 X102.151 Y100.165 E.01692
G3 X102.358 Y100.473 I-.023 J.239 E.01022
G3 X102.077 Y100.934 I-.925 J-.247 E.01321
G2 X102.179 Y101.326 I.211 J.154 E.01116
G1 X102.702 Y101.717 E.01574
G1 X102.812 Y101.569 E.00446
G2 X103.311 Y101.611 I.365 J-1.353 E.01213
G3 X103.34 Y102.11 I-.266 J.266 E.01319
G2 X103.126 Y103.212 I.71 J.71 E.02875
G3 X102.863 Y103.628 I-.33 J.083 E.01325
G3 X102.122 Y102.818 I.522 J-1.222 E.0273
G2 X101.562 Y102.458 I-2.398 J3.116 E.01608
G3 X101.517 Y102.082 I.183 J-.213 E.01002
G1 X101.29 Y101.554 E.01385
G2 X100.634 Y101.105 I-4.86 J6.389 E.0192
G3 X100.655 Y100.563 I.088 J-.268 E.01757
G2 X101.3 Y100.307 I-2.759 J-7.899 E.01674
G2 X102.094 Y100.157 I-.141 J-2.922 E.01953
M106 S124.95
M106 S127.5
; WIPE_START
G1 X102.325 Y100.224 E-.09136
G1 X102.358 Y100.473 E-.09566
G1 X102.275 Y100.682 E-.08529
G1 X102.1 Y100.905 E-.10769
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.741 J-.966 P1  F42000
G1 X100.757 Y101.935 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X100.888 Y102.359 I-.012 J.236 E.01389
G3 X100.288 Y103.627 I-1.065 J.272 E.03672
G3 X100.023 Y103.306 I.021 J-.288 E.01123
G3 X100.469 Y102.223 I1.256 J-.115 E.02936
G3 X100.574 Y101.944 I.441 J.007 E.00735
G3 X100.703 Y101.916 I.124 J.262 E.00319
M106 S124.95
M106 S127.5
; WIPE_START
G1 X100.924 Y101.999 E-.08971
G1 X101.007 Y102.112 E-.05333
G1 X100.888 Y102.359 E-.10407
G1 X100.924 Y102.65 E-.11153
G1 X100.914 Y102.705 E-.02136
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.01 J-1.217 P1  F42000
G1 X97.341 Y102.734 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X97.494 Y102.252 I.249 J-.186 E.01425
G1 X97.479 Y101.831 E.01015
G3 X98.135 Y102.181 I.058 J.681 E.01896
G3 X98.655 Y102.77 I-.028 J.55 E.0211
G3 X97.919 Y103.05 I-.887 J-1.221 E.01923
G2 X97.141 Y103.591 I8.02 J12.362 E.02284
G3 X96.843 Y103.571 I-.134 J-.236 E.00763
G3 X96.919 Y102.752 I.983 J-.322 E.02038
G3 X97.421 Y101.83 I.662 J-.238 E.0286
M106 S124.95
M106 S127.5
; WIPE_START
G1 X97.722 Y101.837 E-.11444
G1 X97.966 Y101.967 E-.10512
G1 X98.135 Y102.181 E-.10373
G1 X98.265 Y102.255 E-.05671
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.176 J-.311 P1  F42000
G1 X97.527 Y99.47 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X97.325 Y99.404 E.00514
G3 X97.67 Y99.013 I.493 J.087 E.01322
G1 X97.788 Y98.855 E.00477
G1 X97.984 Y98.224 E.01593
G3 X98.204 Y98.793 I-.399 J.481 E.01537
G2 X98.762 Y99.173 I1.509 J-1.616 E.01635
G3 X99.484 Y99.394 I.217 J.58 E.01958
G3 X99.051 Y99.881 I-.903 J-.368 E.01601
G3 X98.653 Y100.353 I-.669 J-.16 E.01545
G3 X97.978 Y100.747 I-.51 J-.097 E.02136
G2 X97.304 Y99.839 I-1.119 J.126 E.02856
G3 X96.56 Y99.633 I-.23 J-.617 E.01989
G3 X96.99 Y99.133 I.923 J.359 E.0162
G3 X97.391 Y98.685 I.749 J.266 E.01487
G3 X97.926 Y98.219 I1.149 J.781 E.01731
M106 S124.95
M106 S127.5
; WIPE_START
G1 X98.097 Y98.297 E-.07135
G1 X98.174 Y98.455 E-.06678
G1 X98.204 Y98.793 E-.129
G1 X98.45 Y98.96 E-.11287
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.192 J-1.202 P1  F42000
G1 X94.231 Y98.287 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.422 Y97.94 I.225 J-.102 E.01109
G1 X94.52 Y97.846 E.00327
G1 X94.756 Y97.258 E.01527
G3 X94.947 Y97.8 I-.237 J.389 E.01501
G3 X94.808 Y98.87 I-1.384 J.364 E.02668
G3 X94.628 Y99.256 I-.482 J.01 E.01063
G3 X94.052 Y98.691 I.071 J-.649 E.02098
G3 X94.185 Y97.586 I.341 J-.52 E.03326
G3 X94.698 Y97.254 I1.184 J1.268 E.01483
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.869 Y97.331 E-.07137
G1 X94.946 Y97.489 E-.06661
G1 X94.947 Y97.8 E-.11841
G1 X95.007 Y98.12 E-.12362
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.212 J-.109 P1  F42000
G1 X94.803 Y95.857 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X94.634 Y95.773 E.00455
G3 X95.1 Y95.263 I4.591 J3.732 E.01667
G1 X95.22 Y94.725 E.0133
G3 X95.335 Y94.799 I.004 J.119 E.00351
G1 X95.641 Y95.402 E.0163
G1 X95.946 Y95.597 E.00873
G3 X97.001 Y95.398 I1.379 J4.41 E.02594
G3 X97.032 Y95.913 I-.288 J.276 E.01355
G2 X96.913 Y96.33 I.456 J.356 E.01072
G3 X96.642 Y97.26 I-4.481 J-.804 E.0234
G3 X96.202 Y97.165 I-.165 J-.304 E.01183
G2 X95.328 Y96.588 I-1.06 J.655 E.02606
G1 X94.773 Y96.312 E.01495
G1 X94.771 Y96.404 E.00223
G2 X94.217 Y96.379 I-.32 J.941 E.01356
G3 X93.825 Y96.024 I-.077 J-.308 E.01505
G3 X94.241 Y95.624 I1.032 J.656 E.01404
G3 X94.647 Y95.159 I.761 J.255 E.01528
G3 X95.163 Y94.721 I1.119 J.793 E.0165
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.335 Y94.799 E-.0721
G1 X95.641 Y95.402 E-.25683
G1 X95.755 Y95.474 E-.05106
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.848 J-.872 P1  F42000
G1 X93.268 Y93.056 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.065 Y92.74 I-.033 J-.202 E.01147
G1 X93.221 Y92.585 E.00532
G1 X93.188 Y91.897 E.01661
G3 X93.56 Y92.322 I-.272 J.615 E.01407
G3 X93.853 Y92.711 I-.337 J.559 E.01203
G3 X94.212 Y93.422 I-.197 J.546 E.02119
G3 X93.559 Y93.431 I-.336 J-.678 E.0163
G3 X92.837 Y92.374 I-.307 J-.565 E.04556
G3 X93.018 Y91.882 I.563 J-.072 E.01315
G1 X93.134 Y91.874 E.00282
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.396 Y92.033 E-.1164
G1 X93.56 Y92.322 E-.12625
G1 X93.728 Y92.466 E-.08416
G1 X93.792 Y92.591 E-.05319
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.075 J.571 P1  F42000
G1 X94.887 Y90.529 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
M73 P61 R4
G2 X95.238 Y90.093 I-1.236 J-1.355 E.01354
G2 X95.436 Y89.962 I-.036 J-.27 E.00593
G1 X95.717 Y89.219 E.01915
G3 X95.873 Y89.927 I-.283 J.434 E.01937
G2 X96.512 Y90.486 I1.053 J-.558 E.02091
G3 X96.766 Y90.982 I.062 J.282 E.01827
G2 X96.416 Y91.32 I.364 J.728 E.01192
G2 X95.997 Y91.81 I5.011 J4.712 E.01555
G3 X95.413 Y92.093 I-.479 J-.246 E.01677
G1 X95.19 Y91.299 E.01987
G2 X94.335 Y90.712 I-5.035 J6.422 E.02504
G3 X94.515 Y90.282 I.414 J-.079 E.01191
G2 X94.996 Y89.746 I-2.467 J-2.697 E.01741
G2 X95.532 Y89.264 I-3.91 J-4.889 E.0174
G1 X95.659 Y89.214 E.00328
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.83 Y89.292 E-.07134
G1 X95.906 Y89.45 E-.06677
G1 X95.873 Y89.927 E-.18165
G1 X95.971 Y90.052 E-.06023
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.714 J-.985 P1  F42000
G1 X93.653 Y88.37 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.021 Y88.329 I.216 J.265 E.00943
G1 X94.528 Y87.748 E.0186
G3 X94.735 Y88.056 I-.023 J.239 E.01022
G2 X94.391 Y88.73 I7.51 J4.257 E.01825
G3 X93.747 Y89.131 I-.622 J-.28 E.01941
G3 X93.233 Y89.241 I-.363 J-.446 E.01317
G3 X93.206 Y88.671 I.582 J-.313 E.01421
G3 X93.972 Y87.892 I.61 J-.166 E.03181
G3 X94.471 Y87.74 I.579 J1.005 E.0127
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.702 Y87.806 E-.09135
G1 X94.735 Y88.056 E-.09567
G1 X94.473 Y88.491 E-.19298
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.087 J.547 P1  F42000
G1 X95.824 Y85.803 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X95.556 Y85.435 I.701 J-.794 E.01105
G2 X95.805 Y85.328 I.045 J-.239 E.00694
G1 X95.772 Y84.908 E.01018
G3 X96.285 Y85.985 I.07 J.628 E.0377
G3 X95.938 Y86.619 I-.669 J.046 E.01841
G3 X95.531 Y86.104 I.472 J-.791 E.01618
G2 X94.976 Y85.543 I-2.495 J1.911 E.0191
G3 X94.923 Y84.989 I.19 J-.298 E.01546
G3 X95.51 Y85.005 I.263 J1.139 E.01431
G1 X95.714 Y84.906 E.00546
M106 S124.95
M106 S127.5
; WIPE_START
G1 X96.013 Y84.925 E-.11398
G1 X96.285 Y85.06 E-.11526
G1 X96.433 Y85.284 E-.10196
G1 X96.457 Y85.41 E-.04881
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.213 J-1.198 P1  F42000
G1 X91.639 Y86.266 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X91.976 Y85.841 I-1.308 J-1.383 E.01313
G2 X92.266 Y85.586 I-.117 J-.426 E.00963
G1 X92.454 Y84.966 E.01562
G3 X92.668 Y85.463 I-.369 J.453 E.01355
G1 X92.846 Y85.949 E.0125
G3 X93.622 Y86.36 I-4.257 J8.987 E.02116
G3 X93.215 Y86.927 I-.529 J.051 E.01837
G3 X92.82 Y87.4 I-.764 J-.237 E.01526
G3 X92.172 Y87.819 I-.562 J-.158 E.02033
G1 X92.093 Y87.676 E.00393
G1 X91.954 Y87.03 E.01594
G2 X91.052 Y86.434 I-3.721 J4.648 E.0261
G3 X91.46 Y85.876 I.578 J-.006 E.01787
G3 X91.861 Y85.427 I.749 J.266 E.01487
G3 X92.396 Y84.962 I1.149 J.781 E.01731
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.567 Y85.039 E-.07134
G1 X92.644 Y85.198 E-.06685
G1 X92.668 Y85.463 E-.10112
G1 X92.795 Y85.81 E-.14069
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.215 J-1.198 P1  F42000
G1 X88.707 Y85.077 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X89.251 Y84.873 E.014
G1 X89.376 Y84.472 E.01014
G3 X90.095 Y84.979 I-.271 J1.148 E.02175
G3 X89.76 Y85.276 I-.447 J-.166 E.01124
G1 X89.376 Y85.792 E.01551
G2 X88.678 Y86.403 I8.205 J10.075 E.02237
G3 X87.777 Y85.874 I.091 J-1.187 E.02607
G3 X88.025 Y85.589 I.419 J.113 E.00944
G3 X89.321 Y84.452 I1.27 J.141 E.04562
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.962 Y84.76 E-.27027
G1 X90.095 Y84.979 E-.09712
G1 X90.076 Y85.006 E-.01262
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.179 J-.302 P1  F42000
G1 X89.065 Y88.95 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X89.61 Y88.472 I-3.205 J-4.202 E.0175
G1 X89.819 Y87.626 E.02101
G3 X90.026 Y88.532 I-.493 J.59 E.02404
G3 X90.035 Y89.378 I-.642 J.43 E.0216
G2 X89.757 Y90.324 I29.81 J9.285 E.02378
G3 X89.529 Y90.506 I-.243 J-.071 E.00748
G3 X89.088 Y89.943 I.493 J-.841 E.01765
G2 X88.555 Y89.437 I-3.373 J3.021 E.01776
G3 X88.494 Y88.91 I.155 J-.285 E.01497
G3 X89.248 Y88.253 I3.029 J2.714 E.0242
G3 X89.761 Y87.617 I1.222 J.463 E.02004
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.933 Y87.716 E-.07533
G1 X90.031 Y87.918 E-.08513
G1 X90.07 Y88.19 E-.10454
G1 X90.031 Y88.49 E-.11499
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.711 J.987 P1  F42000
G1 X91.836 Y89.791 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.568 Y89.423 I.701 J-.794 E.01105
G2 X91.817 Y89.316 I.045 J-.239 E.00694
G1 X91.784 Y88.896 E.01018
G3 X92.297 Y89.973 I.07 J.628 E.0377
G3 X91.95 Y90.607 I-.669 J.046 E.01841
G3 X91.543 Y90.092 I.473 J-.791 E.01618
G2 X90.988 Y89.531 I-2.495 J1.911 E.0191
G3 X90.935 Y88.977 I.19 J-.298 E.01546
G3 X91.522 Y88.993 I.263 J1.139 E.01431
G1 X91.726 Y88.894 E.00546
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.025 Y88.913 E-.11398
G1 X92.297 Y89.048 E-.11526
G1 X92.445 Y89.272 E-.10196
G1 X92.469 Y89.398 E-.04881
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.116 J-.486 P1  F42000
G1 X90.78 Y93.277 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.583 Y93.279 E.00475
G1 X90.624 Y93.231 E.00152
G3 X90.844 Y92.521 I.989 J-.083 E.01837
G1 X90.788 Y91.792 E.01765
G3 X91.213 Y92.318 I-.331 J.703 E.01689
G2 X91.74 Y92.896 I9.23 J-7.875 E.01886
G3 X91.469 Y93.419 I-.187 J.235 E.01992
G3 X90.71 Y93.698 I-.629 J-.541 E.02036
G3 X89.888 Y93.863 I-.543 J-.578 E.0213
G3 X90.216 Y93.062 I.72 J-.172 E.02228
G3 X90.439 Y92.391 I1.077 J-.015 E.01737
G3 X90.618 Y91.777 I.926 J-.063 E.01575
G1 X90.735 Y91.769 E.00282
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.086 Y92.032 E-.16692
G1 X91.213 Y92.318 E-.11893
G1 X91.38 Y92.501 E-.09415
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.213 J.1 P1  F42000
G1 X91.612 Y95.321 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.797 Y95.193 I.199 J.091 E.00569
G2 X92.327 Y95.103 I.167 J-.615 E.01338
G1 X92.705 Y94.579 E.01558
G3 X92.914 Y94.887 I-.021 J.239 E.01029
G2 X92.346 Y96.039 I11.06 J6.173 E.03101
G3 X92.086 Y96.705 I-.454 J.206 E.01919
G3 X91.567 Y96.167 I.315 J-.824 E.01862
G3 X90.951 Y95.382 I2.501 J-2.598 E.02414
G3 X91.259 Y95.074 I.259 J-.049 E.01237
G3 X92.053 Y94.769 I.65 J.506 E.02156
G3 X92.647 Y94.57 I.774 J1.326 E.01523
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.881 Y94.637 E-.09237
G1 X92.914 Y94.887 E-.09566
G1 X92.691 Y95.34 E-.19197
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.699 J-.996 P1  F42000
G1 X90.425 Y96.93 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.272 Y96.775 I-.188 J.032 E.00561
G2 X90.668 Y96.717 I-.127 J-2.238 E.00966
G1 X90.743 Y96.301 E.0102
G3 X91.109 Y97.379 I-.107 J.637 E.03357
G3 X90.777 Y98.037 I-.609 J.106 E.01905
G3 X90.337 Y97.488 I.468 J-.826 E.0174
G2 X89.799 Y96.968 I-2.04 J1.574 E.01812
G3 X89.753 Y96.425 I.13 J-.284 E.01594
G2 X90.688 Y96.284 I-13.888 J-95.28 E.02279
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.951 Y96.364 E-.10455
G1 X91.126 Y96.506 E-.08572
G1 X91.281 Y96.773 E-.11728
G1 X91.278 Y96.964 E-.07245
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.725 J-.977 P1  F42000
G1 X88.036 Y94.558 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X87.843 Y94.12 I-.019 J-.253 E.01506
G1 X87.737 Y93.629 E.0121
G3 X88.333 Y93.817 I-1.031 J4.314 E.01508
G3 X88.592 Y94.516 I-.476 J.574 E.01882
G3 X88.618 Y95.229 I-.354 J.37 E.01905
G3 X87.974 Y94.975 I.067 J-1.111 E.01698
G3 X87.43 Y94.014 I0 J-.635 E.0323
G3 X87.683 Y93.608 I.232 J-.137 E.01417
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.333 Y93.817 E-.2593
G1 X88.513 Y94.079 E-.1207
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.892 J-.828 P1  F42000
G1 X86.475 Y91.885 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X86.05 Y91.241 I2.302 J-1.983 E.01868
G1 X85.762 Y90.713 E.01449
G2 X86.528 Y90.759 I.661 J-4.659 E.01852
G3 X86.939 Y91.122 I-.307 J.762 E.01348
G2 X87.778 Y90.855 I.026 J-1.369 E.02162
G3 X88.304 Y91.329 I-.063 J.599 E.01827
G3 X88.589 Y91.713 I-.318 J.534 E.01183
G3 X88.947 Y92.424 I-.197 J.545 E.02117
G3 X88.29 Y92.433 I-.337 J-.681 E.01639
G3 X87.637 Y92.397 I-.295 J-.594 E.01651
G2 X86.43 Y92.351 I-.702 J2.555 E.02938
G3 X85.993 Y91.919 I.265 J-.705 E.01526
G2 X85.474 Y91.291 I-5.121 J3.7 E.01965
G3 X85.423 Y90.731 I.168 J-.298 E.01592
G3 X85.705 Y90.705 I.214 J.775 E.00687
M106 S124.95
M106 S127.5
; WIPE_START
G1 X86.023 Y90.778 E-.12391
G1 X86.212 Y90.733 E-.07409
G1 X86.528 Y90.759 E-.12023
G1 X86.667 Y90.831 E-.05948
G1 X86.671 Y90.835 E-.00229
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.114 J-.49 P1  F42000
G1 X84.927 Y94.801 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X84.511 Y94.69 E.01039
G3 X84.891 Y94.24 I.646 J.16 E.01472
G1 X85.158 Y93.515 E.01862
G3 X85.321 Y94.191 I-.273 J.424 E.01851
G2 X86.097 Y94.936 I.81 J-.067 E.02835
G3 X86.791 Y95.516 I-.22 J.968 E.02263
G3 X87.394 Y96.267 I-1.956 J2.188 E.02333
G3 X87.128 Y96.584 I-.248 J.063 E.01164
G3 X86.398 Y96.424 I.079 J-2.105 E.01812
G3 X85.39 Y96.515 I-2.628 J-23.613 E.02439
G3 X84.806 Y96.331 I-.187 J-.428 E.01612
G3 X85.282 Y95.699 I1.033 J.284 E.01953
G1 X84.793 Y95.2 E.01684
G2 X84.154 Y95.169 I-.381 J1.256 E.01559
G3 X83.762 Y94.814 I-.077 J-.308 E.01505
G3 X84.178 Y94.414 I1.032 J.656 E.01404
G3 X84.584 Y93.949 I.761 J.255 E.01528
G3 X85.1 Y93.511 I1.119 J.793 E.0165
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.271 Y93.588 E-.07132
G1 X85.348 Y93.746 E-.0668
G1 X85.321 Y94.191 E-.16934
G1 X85.376 Y94.374 E-.07254
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.776 J-.937 P1  F42000
G1 X81.387 Y97.679 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X81.247 Y97.226 I.286 J-.337 E.01209
G1 X81.001 Y96.61 E.01599
G2 X81.672 Y96.89 I1.355 J-2.298 E.0176
G3 X82.122 Y97.432 I-.305 J.71 E.01762
G3 X81.875 Y97.989 I-.127 J.277 E.02286
G3 X80.844 Y97.356 I-.391 J-.52 E.03748
G3 X80.789 Y96.597 I.408 J-.411 E.02004
G1 X80.947 Y96.589 E.00381
M106 S124.95
M106 S127.5
; WIPE_START
G1 X81.461 Y96.863 E-.22144
G1 X81.672 Y96.89 E-.08083
G1 X81.842 Y97.004 E-.07774
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.173 J.323 P1  F42000
G1 X82.513 Y99.444 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X82.662 Y99.036 I.187 J-.163 E.01278
G1 X82.744 Y98.616 E.01031
G2 X83.384 Y98.67 I.488 J-1.968 E.01556
G3 X83.572 Y99.166 I.042 J.268 E.01782
G2 X83.221 Y99.505 I.364 J.728 E.01193
G2 X82.803 Y99.992 I5.024 J4.732 E.0155
G3 X82.193 Y100.249 I-.448 J-.212 E.01747
G3 X82.13 Y99.617 I.877 J-.407 E.01561
G3 X82.686 Y98.611 I.554 J-.351 E.03381
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.904 Y98.68 E-.08675
G1 X83.384 Y98.67 E-.18256
G1 X83.568 Y98.736 E-.07415
G1 X83.629 Y98.81 E-.03653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.978 J.725 P1  F42000
G1 X85.44 Y101.254 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X85.435 Y101.277 E.00057
G3 X85.217 Y100.66 I.04 J-.361 E.01965
G1 X85.159 Y99.926 E.01776
G3 X85.568 Y100.414 I-.313 J.678 E.01588
G3 X85.864 Y101.293 I-.275 J.582 E.02498
G2 X86.626 Y102.43 I2.395 J-.78 E.03342
G3 X86.876 Y103.558 I-.644 J.734 E.02979
G3 X86.405 Y103.444 I-.169 J-.329 E.01273
G3 X85.913 Y102.469 I1.01 J-1.122 E.02694
G2 X84.935 Y101.515 I-1.821 J.888 E.03361
G3 X84.803 Y100.576 I.474 J-.546 E.02494
G3 X84.989 Y99.911 I.996 J-.079 E.017
G1 X85.106 Y99.903 E.00282
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.458 Y100.166 E-.16692
G1 X85.568 Y100.414 E-.10339
G1 X85.734 Y100.53 E-.07665
G1 X85.782 Y100.602 E-.03304
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.856 J.865 P1  F42000
G1 X87.436 Y98.964 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X86.865 Y98.629 I-.047 J-.574 E.017
G3 X86.538 Y98.144 I.227 J-.505 E.01486
G1 X86.331 Y97.659 E.01273
G2 X86.795 Y97.721 I.388 J-1.14 E.01135
G3 X87.49 Y98.177 I-.058 J.846 E.02095
G2 X88.344 Y97.805 I-.127 J-1.46 E.02287
G3 X88.907 Y98.384 I-.111 J.67 E.02084
G2 X89.314 Y98.811 I2.143 J-1.63 E.01426
G3 X89.547 Y99.348 I-.381 J.484 E.01471
G3 X89.074 Y99.518 I-1.459 J-3.331 E.0121
G1 X88.655 Y99.819 E.01246
G3 X88.161 Y100.692 I-.957 J.035 E.02545
G3 X87.824 Y99.916 I.322 J-.602 E.02202
G1 X87.519 Y99.408 E.01427
G3 X86.569 Y98.937 I-.04 J-1.112 E.02666
G3 X86.164 Y98.344 I.406 J-.712 E.01791
G3 X85.904 Y97.73 I.274 J-.479 E.01728
G3 X86.274 Y97.65 I.296 J.473 E.00933
M106 S124.95
M106 S127.5
; WIPE_START
G1 X86.68 Y97.749 E-.15872
G1 X86.795 Y97.721 E-.04497
G1 X87.196 Y97.838 E-.15875
G1 X87.226 Y97.873 E-.01757
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.13 J.451 P1  F42000
G1 X89.055 Y102.461 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.502 Y102.121 I.656 J.4 E.01384
G1 X89.644 Y101.976 E.00491
G1 X89.815 Y101.383 E.01488
G3 X90.009 Y101.622 I-.106 J.284 E.00778
G3 X89.99 Y102.831 I-1.595 J.58 E.02984
G3 X89.879 Y103.621 I-.831 J.286 E.01996
G3 X89.218 Y103.126 I.193 J-.947 E.02058
G2 X88.41 Y102.847 I-2.789 J6.763 E.02064
G3 X88.695 Y102.242 I.453 J-.156 E.01783
G3 X89.264 Y101.763 I.991 J.6 E.01827
G3 X89.758 Y101.378 I.954 J.713 E.01528
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.929 Y101.456 E-.07135
G1 X90.009 Y101.622 E-.07009
G1 X90.092 Y102.244 E-.23856
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.021 J.662 P1  F42000
G1 X91.691 Y99.777 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.64 Y99.731 I-.027 J-.021 E.00272
G3 X91.826 Y99.423 I.347 J-.001 E.00914
G1 X92.21 Y99.29 E.00979
G1 X92.468 Y98.723 E.01503
G3 X92.604 Y99.448 I-.388 J.448 E.01921
G3 X92.556 Y100.059 I-.477 J.27 E.01568
G2 X92.052 Y100.244 I.021 J.837 E.01319
G2 X91.383 Y100.263 I-.274 J2.11 E.01621
G3 X91.076 Y100.194 I-.045 J-.508 E.0077
G3 X91.249 Y99.571 I.607 J-.167 E.01636
G3 X91.636 Y99.044 I.717 J.121 E.01636
G2 X92.41 Y98.719 I-1.327 J-4.244 E.02029
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.582 Y98.791 E-.07079
G1 X92.655 Y98.943 E-.06402
G1 X92.673 Y99.163 E-.08377
G1 X92.604 Y99.448 E-.11136
G1 X92.624 Y99.578 E-.05005
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.214 J.083 P1  F42000
G1 X92.792 Y102.041 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X93.256 Y101.769 E.01297
G3 X93.703 Y101.551 I.433 J.321 E.01246
G1 X93.965 Y100.972 E.01534
G3 X94.119 Y101.615 I-.219 J.392 E.01791
G3 X93.889 Y102.312 I-.675 J.164 E.01865
G3 X93.459 Y102.92 I-.792 J-.105 E.01867
G2 X92.439 Y103.234 I-.125 J1.41 E.0264
G1 X92.347 Y103.247 E.00224
G3 X91.653 Y103.598 I-.609 J-.342 E.01989
G3 X91.568 Y102.854 I.868 J-.476 E.01853
G3 X91.818 Y102.14 I.923 J-.077 E.01878
G3 X92.118 Y101.633 I.452 J-.076 E.01544
G2 X92.521 Y101.713 I.339 J-.649 E.01006
G1 X92.975 Y101.446 E.0127
M73 P62 R4
G3 X93.588 Y101.147 I.684 J.622 E.01686
G3 X93.908 Y100.969 I.485 J.495 E.00892
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.08 Y101.035 E-.07007
G1 X94.15 Y101.181 E-.06181
G1 X94.119 Y101.615 E-.16528
G1 X94.152 Y101.828 E-.08167
G1 X94.151 Y101.831 E-.00116
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.879 J.841 P1  F42000
G1 X94.855 Y102.567 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X95.168 Y102.318 I.229 J-.033 E.01164
G1 X95.334 Y102.208 E.00481
G1 X95.632 Y101.675 E.01471
G3 X95.784 Y102.127 I-.011 J.255 E.01481
G3 X95.467 Y103.19 I-32.726 J-9.172 E.02673
G3 X95.018 Y103.611 I-.548 J-.134 E.0157
G3 X94.736 Y103.087 I.566 J-.643 E.01465
G3 X95.04 Y101.899 I.309 J-.554 E.04012
G3 X95.575 Y101.667 I.657 J.785 E.01425
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.805 Y101.733 E-.09096
G1 X95.845 Y101.821 E-.03669
G1 X95.784 Y102.127 E-.11859
G1 X95.705 Y102.47 E-.13376
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.013 J-1.217 P1  F42000
G1 X83.475 Y102.598 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X83.77 Y101.941 I2.428 J.697 E.01741
G1 X83.764 Y101.248 E.01671
G3 X84.16 Y101.782 I-.438 J.739 E.01646
G3 X85.039 Y102.945 I-3.378 J3.464 E.03528
G3 X84.825 Y103.627 I-.376 J.256 E.01981
G3 X84.232 Y103.135 I.504 J-1.209 E.01883
G2 X83.259 Y103.191 I-.433 J.952 E.02447
G3 X82.995 Y102.875 I.024 J-.287 E.01105
G3 X83.364 Y101.835 I2.535 J.313 E.02681
G3 X83.71 Y101.228 I.634 J-.041 E.01785
M106 S124.95
M106 S127.5
; WIPE_START
G1 X83.982 Y101.427 E-.12811
G1 X84.16 Y101.782 E-.15098
G1 X84.337 Y101.98 E-.10092
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.207 J-1.199 P1  F42000
G1 X80.66 Y102.616 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.803 Y102.143 I.288 J-.171 E.0134
G1 X80.784 Y101.722 E.01017
G2 X81.355 Y101.744 I.363 J-1.924 E.01384
G3 X81.841 Y102.097 I.127 J.335 E.01713
G3 X81.143 Y102.918 I-4.494 J-3.114 E.02604
G3 X80.479 Y103.392 I-2.903 J-3.36 E.01971
G3 X80.207 Y102.734 I.202 J-.469 E.01901
G3 X80.239 Y102.138 I42.19 J1.98 E.01439
G3 X80.726 Y101.719 I.711 J.333 E.01595
M106 S124.95
M106 S127.5
; WIPE_START
G1 X81.093 Y101.775 E-.14104
G1 X81.355 Y101.744 E-.10037
G1 X81.712 Y101.819 E-.13859
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.14 J-.426 P1  F42000
G1 X77.964 Y91.796 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X78.345 Y91.154 E.01802
G1 X78.222 Y90.621 E.01318
G2 X79.063 Y91.032 I9.654 J-18.671 E.02258
G2 X79.412 Y91.527 I2.219 J-1.198 E.01463
G3 X79.229 Y92.022 I-.151 J.226 E.0175
G2 X78.315 Y92.956 I-.047 J.868 E.03567
G3 X77.812 Y93.044 I-.264 J-.026 E.01662
G2 X77.185 Y92.45 I-4.475 J4.097 E.02084
G3 X76.621 Y92.021 I.041 J-.638 E.0181
G3 X77.346 Y91.668 I.726 J.57 E.02011
G2 X77.92 Y91.047 I-.291 J-.845 E.02126
G3 X78.168 Y90.6 I.243 J-.157 E.01506
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.063 Y91.032 E-.37767
G1 X79.067 Y91.037 E-.00233
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.02 J-.664 P1  F42000
G1 X77.635 Y88.84 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X78.419 Y89.034 I-.103 J2.092 E.0196
G3 X78.81 Y89.259 I.144 J.201 E.01365
G3 X78.718 Y89.51 I-.261 J.046 E.00676
G2 X77.729 Y89.653 I1.498 J13.833 E.02409
G3 X76.963 Y89.17 I.048 J-.927 E.02283
G3 X77.577 Y88.838 I.6 J.376 E.01762
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.138 Y88.912 E-.21491
G1 X78.419 Y89.034 E-.11652
G1 X78.547 Y89.023 E-.04857
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.134 J-.441 P1  F42000
G1 X77.692 Y86.824 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X78.097 Y86.757 E.00989
G1 X78.138 Y86.437 E.00779
G1 X78.445 Y86.002 E.01285
G1 X78.418 Y85.374 E.01515
G3 X78.793 Y85.753 I-.313 J.685 E.01316
G3 X79.258 Y86.087 I-.215 J.789 E.0141
G3 X79.764 Y86.601 I0 J.505 E.01935
G2 X79.126 Y87.295 I2.077 J2.549 E.02279
G3 X78.35 Y87.927 I-29.441 J-35.368 E.02415
G3 X77.864 Y87.514 I.209 J-.737 E.01585
G3 X76.898 Y86.87 I1.582 J-3.421 E.02812
G3 X77.049 Y86.558 I.188 J-.101 E.00973
G3 X77.72 Y86.393 I.722 J1.49 E.0168
G1 X77.741 Y86.232 E.00392
G1 X78.084 Y85.785 E.01358
G3 X78.365 Y85.351 I.348 J-.083 E.01393
M106 S124.95
M106 S127.5
M204 S10000
G1 X78.52 Y84.373 F42000
G1 F9000
M204 S6000
G3 X78.307 Y84.053 I.127 J-.316 E.00986
G1 X78.241 Y83.999 E.00205
G1 X78.604 Y83.9 E.00906
G1 X78.638 Y83.479 E.01017
G3 X79.097 Y83.7 I-.167 J.934 E.01243
G3 X79.697 Y84.105 I-.092 J.783 E.01812
G3 X78.66 Y84.813 I-1.675 J-1.339 E.03073
G3 X77.949 Y84.302 I-.045 J-.688 E.02288
G3 X77.525 Y83.563 I.316 J-.672 E.02187
G3 X78.252 Y83.563 I.364 J.734 E.01817
G1 X78.581 Y83.469 E.00825
M106 S124.95
M106 S127.5
; WIPE_START
G1 X78.888 Y83.545 E-.12009
G1 X79.097 Y83.7 E-.09895
G1 X79.491 Y83.855 E-.16096
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.163 J-.36 P1  F42000
G1 X78.627 Y81.06 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X78.986 Y80.511 E.01582
G1 X78.939 Y79.843 E.01616
G3 X79.42 Y81.393 I-.594 J1.034 E.04307
G1 X79.392 Y81.641 E.00601
G1 X79.127 Y81.946 E.00974
G3 X78.886 Y82.381 I-.479 J.019 E.01261
G3 X78.415 Y82.003 I.213 J-.749 E.01495
G3 X77.419 Y81.338 I1.586 J-3.451 E.02898
G3 X77.571 Y81.027 I.188 J-.101 E.00974
G2 X78.314 Y80.771 I-2.386 J-8.143 E.01896
G1 X78.608 Y80.322 E.01294
G3 X78.886 Y79.82 I.346 J-.136 E.01582
M106 S124.95
M106 S127.5
; WIPE_START
G1 X79.253 Y80.099 E-.17506
G1 X79.471 Y80.592 E-.20494
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.893 J-.827 P1  F42000
G1 X77.591 Y78.563 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X77.459 Y78.732 I-.435 J-.206 E.00521
G3 X77.516 Y77.549 I2.177 J-.488 E.0289
G1 X77.188 Y76.398 E.02885
G3 X77.817 Y77.251 I-.456 J.994 E.02666
G1 X78.252 Y77.585 E.01322
G3 X78.556 Y77.905 I.04 J.267 E.01248
G3 X78.222 Y78.333 I-.774 J-.261 E.01335
G3 X77.728 Y79.069 I-1.728 J-.625 E.02158
G3 X77.047 Y79.056 I-.334 J-.382 E.018
G2 X76.981 Y78.233 I-3.214 J-.156 E.01996
G1 X77.099 Y77.494 E.01805
G3 X77.013 Y76.384 I.736 J-.616 E.02866
G1 X77.135 Y76.376 E.00294
M106 S124.95
M106 S127.5
; WIPE_START
G1 X77.336 Y76.461 E-.08286
G1 X77.579 Y76.708 E-.13173
G1 X77.754 Y77.107 E-.16542
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.354 J1.164 P1  F42000
G1 X80.453 Y77.928 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X79.988 Y76.398 I4.091 J-2.079 E.03876
G3 X80.386 Y76.853 I-.327 J.688 E.015
G1 X80.904 Y77.085 E.01367
G3 X81.629 Y77.194 I.294 J.508 E.0191
G3 X81.258 Y77.776 I-.953 J-.199 E.01702
G3 X80.687 Y78.326 I-.736 J-.192 E.0201
G3 X80.043 Y78.602 I-.486 J-.245 E.01838
G3 X80.018 Y77.973 I1.093 J-.359 E.01537
G3 X79.643 Y77.034 I6.388 J-3.09 E.02441
G3 X79.818 Y76.384 I.835 J-.124 E.0167
G1 X79.935 Y76.375 E.00282
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.295 Y76.649 E-.17175
G1 X80.386 Y76.853 E-.0852
G1 X80.682 Y76.985 E-.12305
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.242 J1.193 P1  F42000
G1 X84.073 Y77.674 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X84.7 Y77.393 I.563 J.416 E.01732
G1 X84.769 Y76.978 E.01013
G3 X85.568 Y77.366 I-1.26 J3.609 E.02146
G3 X86.066 Y77.833 I.09 J.403 E.01939
G3 X85.244 Y78.694 I-3.325 J-2.352 E.0288
G3 X84.268 Y78.835 I-.612 J-.787 E.0249
G3 X83.43 Y78.612 I-.251 J-.744 E.02216
G3 X82.869 Y78.359 I-.1 J-.525 E.01581
G3 X83.298 Y77.868 I.896 J.352 E.01602
G3 X83.742 Y77.415 I.81 J.35 E.01565
G3 X84.712 Y76.969 I1.008 J.912 E.02645
M106 S124.95
M106 S127.5
; WIPE_START
G1 X85.051 Y77.064 E-.13404
G1 X85.568 Y77.366 E-.22731
G1 X85.615 Y77.38 E-.01865
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.193 J1.202 P1  F42000
G1 X88.944 Y77.916 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X89.065 Y77.925 E.00292
G2 X89.693 Y77.664 I-.212 J-1.396 E.01656
G1 X89.803 Y77.18 E.01196
G3 X90.163 Y78.289 I-.595 J.807 E.03
G3 X90.096 Y78.754 I-.712 J.134 E.01154
G2 X89.085 Y79.51 I13.426 J18.987 E.03045
G3 X88.605 Y80.123 I-.536 J.075 E.02096
G2 X87.833 Y79.098 I-76.213 J56.593 E.03094
G1 X87.619 Y78.593 E.01324
G3 X87.898 Y77.69 I2.765 J.361 E.02289
G3 X88.999 Y77.499 I1.137 J3.274 E.02707
G3 X89.746 Y77.169 I10.573 J22.903 E.01968
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.997 Y77.33 E-.11334
G1 X90.128 Y77.596 E-.11261
G1 X90.186 Y77.997 E-.15405
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.445 J-1.133 P1  F42000
G1 X82.436 Y81.043 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X82.13 Y80.315 I.275 J-.544 E.02071
G3 X81.756 Y79.57 I2.056 J-1.499 E.02019
G3 X82.331 Y79.923 I-.325 J1.175 E.01647
G3 X83.375 Y79.902 I1.073 J26.978 E.02518
G3 X83.484 Y80.455 I.001 J.287 E.01911
G1 X83.188 Y80.873 E.01236
G2 X83.619 Y81.809 I1.701 J-.215 E.02525
G3 X83.697 Y82.621 I-.412 J.449 E.02153
G3 X82.618 Y81.66 I.084 J-1.18 E.03746
G3 X82.1 Y81.307 I-.076 J-.445 E.01672
G3 X81.712 Y80.453 I.458 J-.723 E.02393
G3 X81.547 Y79.556 I.446 J-.546 E.02392
G1 X81.703 Y79.548 E.00375
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.022 Y79.679 E-.13126
G1 X82.331 Y79.923 E-.14942
G1 X82.592 Y79.918 E-.09932
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.938 J-.775 P1  F42000
G1 X80.888 Y81.979 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X80.724 Y81.524 I.282 J-.359 E.01228
G1 X80.43 Y80.898 E.01668
G2 X81.124 Y81.142 I.971 J-1.655 E.01786
G3 X81.37 Y82.211 I-.191 J.606 E.03189
G3 X80.954 Y82.862 I-.756 J-.024 E.01957
G3 X80.584 Y82.268 I.25 J-.567 E.01792
G3 X80.316 Y81.682 I.553 J-.607 E.01598
G3 X80.226 Y80.885 I.429 J-.453 E.02101
G1 X80.376 Y80.878 E.00363
M106 S124.95
M106 S127.5
; WIPE_START
G1 X80.851 Y81.115 E-.20195
G1 X81.124 Y81.142 E-.10427
G1 X81.298 Y81.229 E-.07379
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.212 J.115 P1  F42000
G1 X81.661 Y85.061 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X81.595 Y85.047 E.00164
G2 X81.895 Y84.649 I-1.649 J-1.558 E.01206
G2 X82.093 Y84.518 I-.036 J-.269 E.00592
G1 X82.373 Y83.774 E.01915
G3 X82.53 Y84.482 I-.283 J.434 E.01937
G2 X83.04 Y85.12 I4.875 J-3.372 E.01969
G3 X83.417 Y85.49 I.034 J.344 E.01454
G3 X83.028 Y85.853 I-.791 J-.459 E.01303
G3 X82.611 Y86.333 I-.881 J-.343 E.01563
G3 X81.961 Y86.757 I-.564 J-.154 E.02048
G3 X81.786 Y85.917 I2.34 J-.925 E.02081
G1 X81.478 Y85.452 E.01345
G3 X80.95 Y85.184 I.016 J-.687 E.01478
G3 X81.379 Y84.684 I.923 J.359 E.0162
G3 X81.78 Y84.235 I.75 J.267 E.01487
G3 X82.316 Y83.77 I1.149 J.781 E.01731
M106 S124.95
M106 S127.5
; WIPE_START
G1 X82.487 Y83.847 E-.07135
G1 X82.563 Y84.005 E-.06676
G1 X82.53 Y84.482 E-.18165
G1 X82.588 Y84.619 E-.05638
G1 X82.594 Y84.627 E-.00387
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.056 J-.604 P1  F42000
G1 X79.95 Y89.247 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X79.919 Y89.227 E.00091
G2 X80.224 Y88.825 I-1.594 J-1.528 E.01218
G2 X80.537 Y88.54 I-.138 J-.465 E.01057
G1 X80.702 Y87.951 E.01475
G3 X80.91 Y88.346 I-.353 J.438 E.01108
G1 X81.153 Y88.82 E.01285
G2 X81.69 Y88.882 I.32 J-.418 E.01368
G3 X82.175 Y89.237 I.124 J.34 E.01712
G3 X81.546 Y89.981 I-33.211 J-27.442 E.02348
G2 X81.089 Y90.445 I1.025 J1.469 E.01581
G3 X80.625 Y90.331 I-.198 J-.195 E.01385
G2 X79.404 Y89.513 I-1.912 J1.534 E.03599
G3 X79.379 Y89.139 I.142 J-.197 E.01034
G2 X79.813 Y88.646 I-.906 J-1.234 E.01596
G2 X80.353 Y88.124 I-2.544 J-3.168 E.01813
G3 X80.644 Y87.946 I.447 J.406 E.00834
M106 S124.95
; WIPE_START
G1 X80.815 Y88.024 E-.07135
G1 X80.91 Y88.346 E-.12769
G1 X81.127 Y88.77 E-.18096
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.163 J-.357 P1  F42000
G1 X76.983 Y75.273 Z3.8
G1 Z3.4
G1 E.4 F1800
; FEATURE: Outer wall
G1 F2426
M204 S5000
G3 X78.053 Y75.06 I1.073 J2.592 E.02649
G1 X80.94 Y75.06 E.06962
G1 X80.94 Y75.44 E.00916
G1 X76.646 Y75.44 E.10356
G3 X76.927 Y75.297 I1.41 J2.425 E.00763
; WIPE_START
G1 F12000
M204 S6000
G1 X77.371 Y75.144 E-.17819
G1 X77.777 Y75.073 E-.15655
G1 X77.896 Y75.068 E-.04526
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-.01 J1.217 P1  F42000
G1 X103.017 Y75.275 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F2426
M204 S5000
G3 X103.356 Y75.441 I-1.1 J2.681 E.00911
G1 X97.06 Y75.44 E.15182
G1 X97.06 Y75.06 E.00916
G1 X102.087 Y75.063 E.12122
G3 X102.961 Y75.253 I-.17 J2.892 E.02166
; WIPE_START
G1 F12000
M204 S6000
G1 X103.356 Y75.441 E-.16618
G1 X102.793 Y75.441 E-.21382
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.215 J.066 P1  F42000
G1 X104.33 Y103.605 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F2426
M204 S5000
G1 X104.334 Y103.16 E.01073
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.446 E.63934
G1 X104.41 Y76.535 E.00247
G3 X104.74 Y77.853 I-2.574 J1.344 E.03307
M73 P63 R4
G1 X104.74 Y102.147 E.58586
G3 X104.36 Y103.553 I-2.873 J-.021 E.03552
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.14978
G1 X104.36 Y102.957 E-.07769
G1 X104.36 Y102.556 E-.15254
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.074 J-.572 P1  F42000
G1 X103.265 Y104.61 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F2426
M204 S5000
G3 X101.947 Y104.94 I-1.344 J-2.575 E.03307
G1 X78.053 Y104.94 E.57622
G3 X76.646 Y104.56 I.003 J-2.806 E.03555
G1 X103.354 Y104.56 E.64408
G1 X103.317 Y104.581 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X102.891 Y104.776 E-.17825
G1 X102.628 Y104.856 E-.10457
G1 X102.376 Y104.9 E-.09718
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.605 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F2426
M204 S5000
G3 X75.26 Y102.147 I2.462 J-1.479 E.03696
G1 X75.26 Y77.853 E.58586
G3 X75.64 Y76.446 I2.805 J.003 E.03556
G1 X75.64 Y102.957 E.63934
G3 X75.672 Y103.545 I-3.92 J.507 E.0142
; WIPE_START
G1 F12000
M204 S6000
G1 X75.528 Y103.343 E-.09431
G1 X75.38 Y102.96 E-.15609
G1 X75.305 Y102.627 E-.1296
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 22/30
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G1 X77.601 Y103.881 F42000
G1 Z3.56
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X77.601 Y100.926 E.07127
G1 X77.657 Y100.912 E.00138
G3 X78.271 Y101.603 I-.581 J1.136 E.02282
G1 X78.486 Y101.727 E.00599
G1 X78.486 Y102.866 E.02748
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.474 J1.121 P1  F42000
G1 X80.258 Y103.615 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G3 X80.471 Y102.026 I3.221 J-.376 E.03907
G3 X81.143 Y101.831 I.57 J.713 E.01732
G1 X81.143 Y102.959 E.02719
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.083 J-.554 P1  F42000
G1 X80.258 Y101.228 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X80.258 Y99.192 E.0491
G2 X79.704 Y99.53 I1.81 J3.59 E.01566
G2 X79.372 Y99.509 I-.227 J.962 E.00806
G1 X79.372 Y100.327 E.01973
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
G1 X79.372 Y98.75 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X79.372 Y97.848 E.02175
G2 X78.817 Y98.13 I.518 J1.709 E.01508
G2 X78.486 Y98.147 I-.153 J.262 E.00845
G1 X78.486 Y99.062 E.02208
G2 X78.027 Y98.982 I-.451 J1.217 E.01131
G3 X77.601 Y98.856 I-.01 J-.753 E.01088
G1 X77.601 Y98.276 E.014
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
G1 X77.601 Y96.885 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X77.601 Y96.087 E.01924
G3 X78.486 Y96.365 I.206 J.893 E.02348
G1 X78.486 Y96.915 E.01327
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
G1 X78.486 Y95.524 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X78.486 Y94.766 E.01827
G3 X78.596 Y94.6 I.386 J.136 E.00484
G3 X79.005 Y94.027 I.569 J-.027 E.01833
G2 X79.372 Y93.869 I-.011 J-.532 E.00986
G1 X79.372 Y95.08 E.0292
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.087 J-1.214 P1  F42000
G1 X77.601 Y94.953 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X77.601 Y94.267 E.01653
G2 X76.715 Y94.278 I-.427 J1.208 E.02181
G1 X76.715 Y94.804 E.01268
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
G1 X76.715 Y92.426 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X76.715 Y91.829 E.01439
G3 X77.15 Y91.758 I.405 J1.121 E.01068
G2 X77.601 Y91.705 I.189 J-.339 E.0117
G1 X77.601 Y92.74 E.02494
G3 X77.87 Y93.106 I-1.566 J1.432 E.01098
G2 X78.261 Y93.231 I.256 J-.127 E.01104
G2 X78.266 Y92.528 I-.964 J-.359 E.01731
G1 X78.486 Y92.03 E.01313
G1 X78.486 Y90.802 E.0296
G3 X78.657 Y91.002 I-.273 J.407 E.0064
G3 X79.107 Y91.379 I-.043 J.508 E.01509
G3 X79.372 Y91.499 I-.203 J.796 E.00705
G1 X79.372 Y92.169 E.01614
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.443 J1.133 P1  F42000
G1 X81.143 Y92.862 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X81.143 Y92.34 E.01257
G3 X81.44 Y92.134 I.602 J.55 E.00878
G3 X82.029 Y91.623 I1.159 J.742 E.01906
G1 X82.029 Y92.796 E.02828
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.924 J.792 P1  F42000
G1 X82.915 Y93.829 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G2 X82.885 Y93.388 I-.606 J-.181 E.01087
G2 X82.029 Y93.357 I-.47 J1.133 E.02111
G1 X82.029 Y94.641 E.03096
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.413 J1.145 P1  F42000
G1 X83.8 Y95.28 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X83.8 Y94.715 E.01362
G2 X84.686 Y93.894 I-1.155 J-2.135 E.02943
G1 X84.686 Y95.239 E.03243
M106 S124.95
M106 S127.5
M204 S10000
G1 X85.572 Y95.292 F42000
G1 F4800
M204 S6000
G1 X85.572 Y96.423 E.02728
G2 X86.358 Y96.212 I-.057 J-1.778 E.01982
G1 X86.457 Y96.277 E.00286
G1 X86.457 Y95.513 E.01842
G1 X86.817 Y95.837 E.01167
G3 X87.343 Y96.154 I-.153 J.849 E.01515
G1 X87.343 Y96.813 E.01587
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.778 J-.936 P1  F42000
G1 X86.457 Y97.548 Z3.96
G1 Z3.56
M73 P64 R4
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X86.457 Y98.951 E.03382
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.968 J-.737 P1  F42000
G1 X85.572 Y100.113 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X85.572 Y102.189 E.05005
M106 S124.95
M106 S127.5
M204 S10000
G1 X86.457 Y102.386 F42000
G1 F4800
M204 S6000
G1 X86.457 Y103.736 E.03255
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.064 J-1.215 P1  F42000
G1 X84.686 Y103.829 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X84.686 Y102.652 E.02838
G3 X84.012 Y101.53 I1.058 J-1.398 E.03234
G2 X83.8 Y101.179 I-.662 J.161 E.01004
G1 X83.8 Y103.111 E.04659
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.17 J-.334 P1  F42000
G1 X82.915 Y100.009 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F3822
M204 S6000
G1 X82.915 Y98.607 E.03379
M204 S10000
G1 X82.029 Y98.149 F42000
G1 F4800
M204 S6000
G1 X82.029 Y97.395 E.01817
G3 X81.73 Y97.082 I.212 J-.501 E.01074
G3 X81.143 Y96.692 I.293 J-1.078 E.01728
G1 X81.143 Y98.056 E.03289
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.101 J.518 P1  F42000
G1 X83.8 Y92.407 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X83.8 Y89.513 E.06979
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
G1 X83.8 Y88.306 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X83.8 Y87.535 E.01861
G1 X83.946 Y87.522 E.00352
G2 X84.412 Y87.059 I-1.029 J-1.504 E.01593
G3 X84.686 Y86.301 I.924 J-.095 E.02011
G1 X84.686 Y88.637 E.05634
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.649 J1.029 P1  F42000
G1 X86.457 Y89.754 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X86.457 Y87.036 E.06554
G3 X86.717 Y87.097 I.093 J.187 E.00699
G2 X87.343 Y87.425 I1.037 J-1.219 E.01718
G1 X87.343 Y88.024 E.01444
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.974 J.73 P1  F42000
G1 X89.114 Y90.386 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X89.114 Y88.646 E.04195
G1 X89.358 Y88.405 E.00828
G3 X89.575 Y87.684 I1.456 J.044 E.01837
G3 X90 Y87.816 I.208 J.081 E.01615
G1 X90 Y89.674 E.04479
M106 S124.95
M106 S127.5
M204 S10000
G1 X90.886 Y89.62 F42000
G1 F4800
M204 S6000
G1 X90.886 Y88.917 E.01697
G3 X91.698 Y89.066 I-.031 J2.454 E.02001
G1 X91.771 Y89.058 E.00178
G1 X91.771 Y90.81 E.04225
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.666 J1.019 P1  F42000
G1 X93.543 Y91.968 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X93.543 Y93.559 E.03836
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.054 J-1.216 P1  F42000
G1 X91.771 Y93.637 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X91.771 Y92.98 E.01585
G2 X91.354 Y92.702 I-.594 J.441 E.01233
G3 X91.093 Y92.157 I.567 J-.606 E.01492
G2 X90.886 Y91.821 I-.561 J.114 E.00972
G1 X90.886 Y93.449 E.03926
G2 X90.469 Y93.779 I.457 J1.003 E.01295
G3 X90 Y93.978 I-.533 J-.607 E.0125
G1 X90 Y93.145 E.02008
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.385 J-1.154 P1  F42000
G1 X88.229 Y92.554 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X88.229 Y90.858 E.0409
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.859 J-.862 P1  F42000
G1 X86.457 Y92.625 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X86.457 Y90.905 E.04148
G2 X86.111 Y90.919 I-.158 J.377 E.00864
G2 X85.572 Y90.697 I-.712 J.965 E.0142
G1 X85.572 Y91.511 E.01962
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.784 J.931 P1  F42000
G1 X88.229 Y93.748 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X88.229 Y95.328 E.03812
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.897 J.823 P1  F42000
G1 X90 Y97.259 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X90 Y96.412 E.02041
G3 X90.354 Y96.513 I-.118 J1.084 E.00891
G3 X90.886 Y96.523 I.254 J.608 E.01321
G1 X90.886 Y98.301 E.04287
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.722 J-.979 P1  F42000
G1 X89.114 Y99.608 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X89.114 Y98.788 E.01977
G1 X89.048 Y98.769 E.00165
G3 X88.774 Y98.163 I.347 J-.523 E.01692
G2 X88.37 Y97.698 I-.945 J.414 E.01508
G2 X88.229 Y97.782 I.01 J.177 E.00412
G1 X88.229 Y100.956 E.07653
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-1.134 J.443 P1  F42000
G1 X89.114 Y103.224 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X89.114 Y102.023 E.02895
G2 X89.563 Y101.461 I-.938 J-1.208 E.0175
G3 X90 Y101.475 I.217 J.05 E.0148
G1 X90 Y103.856 E.05743
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.025 J1.217 P1  F42000
G1 X91.771 Y103.892 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X91.771 Y102.463 E.03446
G1 X91.88 Y102.085 E.00949
G3 X92.052 Y101.531 I.377 J-.186 E.01543
G3 X92.469 Y102.003 I-.301 J.686 E.01568
G2 X92.657 Y102.458 I.887 J-.1 E.01203
G1 X92.657 Y103.128 E.01615
M106 S124.95
M106 S127.5
M204 S10000
G1 X93.543 Y103.177 F42000
G1 F4800
M204 S6000
G1 X93.543 Y100.983 E.0529
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.737 J-.968 P1  F42000
G1 X92.657 Y100.309 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G2 X92.655 Y98.803 I-12.554 J-.739 E.03633
G2 X92.338 Y98.676 I-.196 J.029 E.00995
G2 X91.976 Y99.121 I1.465 J1.558 E.01389
G1 X91.771 Y99.152 E.005
G1 X91.771 Y100.318 E.02812
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.365 J1.161 P1  F42000
G1 X94.428 Y99.482 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X94.428 Y97.163 E.05593
M106 S124.95
M106 S127.5
M204 S10000
G1 X94.428 Y96.495 F42000
G1 F4800
M204 S6000
G1 X94.428 Y95.522 E.02345
G1 X94.967 Y94.805 E.02163
G3 X95.314 Y94.653 I.271 J.147 E.00984
G1 X95.314 Y96.227 E.03794
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.975 J.728 P1  F42000
G1 X96.2 Y97.413 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X96.2 Y95.764 E.03975
G1 X96.303 Y95.746 E.00253
G3 X97.084 Y95.327 I.84 J.626 E.02208
G1 X97.085 Y96.065 E.01782
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.41 J1.146 P1  F42000
G1 X98.857 Y96.7 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X98.857 Y95.115 E.03822
G3 X99.742 Y95.047 I.615 J2.218 E.02156
G1 X99.742 Y95.723 E.0163
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
G1 X99.742 Y94.317 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X99.742 Y92.679 E.03948
G3 X100.013 Y92.911 I-.413 J.758 E.00866
G2 X100.563 Y93.556 I1.181 J-.449 E.02085
G1 X100.628 Y93.562 E.00157
G1 X100.628 Y94.353 E.01906
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.66 J1.022 P1  F42000
G1 X102.399 Y95.497 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X102.399 Y94.632 E.02086
G2 X101.92 Y94.777 I.216 J1.574 E.01212
G2 X101.514 Y94.775 I-.206 J.518 E.01004
G1 X101.514 Y96.477 E.04103
M106 S124.95
M106 S127.5
M204 S10000
G1 X102.399 Y96.754 F42000
G1 F3822
M204 S6000
G1 X102.399 Y97.745 E.0239
M204 S10000
G1 X102.399 Y98.713 F42000
G1 F4800
M204 S6000
G1 X102.399 Y98.216 E.012
G3 X103.285 Y98.337 I.353 J.72 E.02287
G1 X103.285 Y99.113 E.01872
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-1.07 J-.579 P1  F42000
G1 X102.399 Y100.751 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X102.399 Y100.158 E.01429
G2 X102.015 Y100.162 I-.187 J.466 E.0095
G3 X101.514 Y100.441 I-1.671 J-2.406 E.01388
G1 X101.514 Y101.396 E.02303
G3 X100.628 Y101.083 I.3 J-2.254 E.02282
G1 X100.628 Y100.389 E.01673
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
G1 X100.628 Y98.933 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X100.628 Y97.467 E.03536
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-1.025 J-.656 P1  F42000
G1 X98.857 Y100.236 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X98.857 Y99.227 E.02432
G1 X98.803 Y99.239 E.00131
G3 X98.239 Y98.911 I.24 J-1.064 E.016
G3 X98.168 Y98.31 I1.225 J-.448 E.01472
G2 X98.026 Y98.125 I-.236 J.035 E.00589
G1 X97.971 Y98.121 E.00132
G1 X97.971 Y100.873 E.06636
G3 X97.964 Y100.253 I.536 J-.316 E.01565
G1 X97.533 Y99.701 E.01688
G1 X97.27 Y99.796 E.00673
G1 X97.273 Y99.89 E.00226
G2 X97.085 Y99.832 I-.141 J.125 E.00497
G1 X97.085 Y98.872 E.02316
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-1.018 J-.667 P1  F42000
G1 X95.314 Y101.574 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X95.314 Y103.801 E.0537
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.033 J1.217 P1  F42000
G1 X97.085 Y103.848 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X97.085 Y102.743 E.02664
G3 X97.971 Y102.283 I1.089 J1.012 E.02455
G1 X97.971 Y103.096 E.01961
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.241 J1.193 P1  F42000
G1 X100.628 Y103.633 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X100.628 Y102.366 E.03054
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.572 J1.074 P1  F42000
G1 X101.514 Y101.895 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X101.514 Y102.453 E.01347
M73 P65 R4
G3 X102.399 Y103.144 I-.521 J1.581 E.02763
G1 X102.399 Y101.762 E.03331
G2 X103.285 Y101.543 I-.411 J-3.561 E.02206
G1 X103.285 Y102.355 E.01958
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
G1 X103.285 Y93.428 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X103.285 Y92.652 E.01872
G3 X102.829 Y92.084 I.979 J-1.254 E.01772
G2 X103.285 Y91.683 I-1.441 J-2.1 E.01468
G1 X103.285 Y91.123 E.0135
G2 X102.654 Y91.352 I.251 J1.679 E.01628
G2 X102.399 Y91.335 I-.163 J.534 E.00622
G1 X102.399 Y92.723 E.03348
G1 X102.376 Y92.628 E.00236
G1 X101.908 Y92.334 E.01334
G3 X101.514 Y92.232 I.003 J-.823 E.00992
G1 X101.514 Y91.784 E.01082
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.089 J-.544 P1  F42000
G1 X100.628 Y90.009 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X100.628 Y89.091 E.02214
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.035 J-1.216 P1  F42000
G1 X98.857 Y89.04 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X98.857 Y87.916 E.0271
G3 X97.971 Y87.84 I-.337 J-1.271 E.02187
G1 X97.971 Y89.698 E.0448
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.006 J-.684 P1  F42000
G1 X97.085 Y88.396 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X97.085 Y87.587 E.01951
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.806 J-.912 P1  F42000
G1 X96.2 Y86.804 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X96.2 Y85.234 E.03786
G2 X95.686 Y85.078 I-.37 J.292 E.01378
G1 X95.314 Y85.001 E.00916
G1 X95.314 Y86.001 E.02411
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.553 J-1.084 P1  F42000
G1 X93.543 Y86.905 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X93.543 Y86.247 E.01587
G3 X92.657 Y85.95 I-.121 J-1.109 E.02324
G1 X92.657 Y87.583 E.03939
G3 X92.151 Y87.926 I-.459 J-.132 E.01601
G3 X92.069 Y87.554 I.199 J-.239 E.00991
G1 X92.197 Y87.075 E.01195
G1 X92.13 Y86.919 E.00408
G1 X91.771 Y86.662 E.01064
G1 X91.771 Y85.447 E.0293
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.056 J-1.216 P1  F42000
G1 X90 Y85.366 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X90 Y84.765 E.01448
G3 X89.376 Y84.439 I.421 J-1.563 E.01712
G2 X89.114 Y84.385 I-.16 J.116 E.00707
G1 X89.114 Y85.713 E.03203
G1 X88.843 Y86.136 E.01211
G3 X88.475 Y86.413 I-.19 J.131 E.01704
G1 X88.229 Y86.265 E.00691
G1 X88.229 Y85.151 E.02688
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.886 J-.834 P1  F42000
G1 X87.343 Y84.209 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X87.343 Y83.545 E.01603
G3 X86.625 Y83.221 I.737 J-2.596 E.01905
G1 X86.457 Y82.956 E.00758
G1 X86.457 Y84.252 E.03125
G1 X86.245 Y84.574 E.00929
G3 X86.237 Y85.255 I-.944 J.329 E.01678
G3 X85.844 Y85.129 I-.135 J-.253 E.01109
G1 X85.572 Y84.736 E.01154
G1 X85.572 Y83.721 E.02446
G3 X85.127 Y83.783 I-.261 J-.248 E.01169
G2 X84.686 Y83.855 I-.057 J1.036 E.01086
G1 X84.686 Y84.448 E.01429
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.061 J-.596 P1  F42000
G1 X83.8 Y82.871 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X83.8 Y81.903 E.02335
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.74 J-.966 P1  F42000
G1 X82.915 Y81.224 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X82.915 Y79.99 E.02976
G3 X82.029 Y79.749 I-.215 J-.956 E.02304
G1 X82.029 Y81.705 E.04719
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-1.018 J-.667 P1  F42000
G1 X81.143 Y83.058 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X81.143 Y81.305 E.04227
G2 X80.258 Y80.793 I-37.285 J63.411 E.02468
G1 X80.258 Y81.837 E.02519
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.336 J-1.17 P1  F42000
G1 X78.486 Y82.347 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X78.486 Y80.835 E.03645
G3 X77.918 Y80.971 I-.379 J-.33 E.01503
G2 X77.601 Y81.007 I-.075 J.758 E.00776
G1 X77.601 Y81.7 E.01672
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-1.217 J0 P1  F42000
G1 X77.601 Y83.277 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X77.601 Y83.949 E.0162
G3 X78.304 Y84.55 I-2.281 J3.379 E.02237
G1 X78.486 Y84.61 E.00462
G1 X78.486 Y83.641 E.02336
G3 X79.372 Y83.807 I-1.13 J8.498 E.02174
G1 X79.372 Y84.537 E.0176
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.106 J1.212 P1  F42000
G1 X81.143 Y84.692 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X81.143 Y85.392 E.01687
G2 X81.422 Y85.392 I.14 J-.525 E.00679
G1 X81.887 Y85.683 E.01323
G1 X81.976 Y85.988 E.00765
G2 X81.868 Y86.803 I1.427 J.603 E.02007
G2 X82.029 Y86.885 I.171 J-.136 E.0045
G1 X82.029 Y83.984 E.06996
G1 X82.121 Y83.853 E.00387
G3 X82.558 Y83.863 I.218 J.037 E.01517
G3 X82.472 Y84.827 I-5.034 J.04 E.02338
G1 X82.915 Y85.136 E.01301
G1 X82.915 Y86.165 E.02481
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-1.179 J-.303 P1  F42000
G1 X82.029 Y89.616 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X82.029 Y88.919 E.0168
G2 X81.532 Y88.966 I-.127 J1.326 E.0121
G1 X81.143 Y88.834 E.0099
G1 X81.143 Y90.376 E.03719
G3 X80.697 Y90.612 I-.392 J-.201 E.01296
G3 X80.679 Y89.983 I.497 J-.329 E.016
G1 X80.258 Y89.436 E.01664
G1 X80.258 Y88.337 E.02651
G3 X80.051 Y88.615 I-.303 J-.009 E.00888
G3 X79.372 Y89.137 I-2.149 J-2.091 E.02074
G1 X79.372 Y89.723 E.01413
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.017 J-1.217 P1  F42000
G1 X77.601 Y89.697 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X77.601 Y88.748 E.0229
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
G1 X77.601 Y86.349 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X77.601 Y87.205 E.02064
G3 X77.911 Y87.399 I-.153 J.589 E.00896
G2 X78.125 Y87.84 I.946 J-.186 E.01196
G2 X78.486 Y87.983 I.262 J-.135 E.01024
G1 X78.486 Y85.375 E.0629
G3 X78.913 Y85.934 I-1.164 J1.33 E.01709
G2 X79.372 Y86.18 I.448 J-.286 E.01311
G1 X79.372 Y86.959 E.01879
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.186 J-.274 P1  F42000
G1 X77.601 Y79.286 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X77.601 Y77.045 E.05405
G1 X77.648 Y77.281 E.00581
G1 X78.122 Y77.619 E.01405
G3 X78.486 Y77.557 I.308 J.714 E.009
G1 X78.486 Y78.303 E.01797
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.384 J1.155 P1  F42000
G1 X80.258 Y78.891 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X80.258 Y76.685 E.0532
G2 X80.474 Y76.966 I.6 J-.237 E.00867
G1 X80.985 Y77.14 E.01303
G1 X81.143 Y77.079 E.00409
G1 X81.143 Y78.071 E.02394
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.415 J1.144 P1  F42000
G1 X82.915 Y78.714 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X82.915 Y78.165 E.01326
G1 X83.025 Y78.087 E.00325
G2 X83.532 Y77.656 I-.08 J-.608 E.01695
G2 X83.8 Y77.327 I-.297 J-.516 E.01049
G1 X83.8 Y78.734 E.03394
G2 X84.202 Y78.724 I.19 J-.452 E.00999
G1 X84.686 Y78.816 E.01188
G1 X84.686 Y77.657 E.02794
G1 X85.572 Y77.657 E.02136
G1 X85.572 Y78.552 E.02159
M106 S124.95
M106 S127.5
M204 S10000
G1 X84.51 Y77.254 F42000
; FEATURE: Support
G1 F9000
M204 S6000
G1 X84.453 Y77.246 E.0014
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.077 J1.215 P1  F42000
G1 X88.229 Y77.484 Z3.96
G1 Z3.56
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X88.229 Y79.359 E.04522
G3 X88.449 Y79.981 I-1.699 J.952 E.01601
G2 X88.855 Y80.111 I.213 J.033 E.0147
G3 X89.114 Y79.421 I8.61 J2.843 E.01779
G1 X89.114 Y77.657 E.04253
G1 X90 Y77.657 E.02136
G1 X90 Y79.085 E.03443
M106 S124.95
M106 S127.5
M204 S10000
G1 X89.811 Y77.096 F42000
; FEATURE: Support
G1 F9000
M204 S6000
G3 X89.963 Y77.254 I-.215 J.358 E.00534
G1 X89.514 Y77.254 E.01082
G3 X89.754 Y77.085 I.413 J.331 E.00718
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.963 Y77.254 E-.10196
G1 X89.514 Y77.254 E-.17044
G1 X89.746 Y77.091 E-.1076
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.96 I-.231 J1.195 P1  F42000
G1 X91.771 Y77.484 Z3.96
G1 Z3.56
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X91.771 Y77.71 E.00547
G3 X92.601 Y78.502 I-2.116 J3.049 E.02777
G2 X92.657 Y78.645 I.246 J-.014 E.00376
G1 X92.657 Y77.657 E.02381
G1 X93.543 Y77.657 E.02136
G1 X93.543 Y78.091 E.01046
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.808 J.91 P1  F42000
G1 X94.428 Y78.877 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X94.428 Y79.38 E.01213
G2 X95.314 Y79.841 I18.308 J-34.127 E.02407
G1 X95.314 Y78.447 E.0336
G3 X95.628 Y78.464 I.125 J.626 E.00767
G3 X96.2 Y78.356 I.487 J1.012 E.01418
G1 X96.2 Y79.056 E.01688
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.014 J.673 P1  F42000
G1 X97.085 Y77.721 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X97.085 Y76.342 E.03325
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.013 J-1.217 P1  F42000
G1 X94.677 Y76.316 Z3.96
G1 Z3.56
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X94.993 Y75.977 I.321 J-.017 E.01247
G1 X95.271 Y75.272 E.01828
G3 X95.473 Y75.653 I-.076 J.285 E.01169
G2 X95.486 Y76.392 I3.612 J.308 E.01785
G2 X95.443 Y77.015 I1.561 J.42 E.01514
G3 X95.301 Y77.254 I-.256 J.01 E.00711
G3 X94.601 Y76.849 I-.125 J-.59 E.02137
G3 X94.711 Y75.65 I.289 J-.578 E.03735
G3 X95.213 Y75.266 I.72 J.422 E.01563
M106 S124.95
M106 S127.5
; WIPE_START
G1 X95.409 Y75.317 E-.07704
G1 X95.473 Y75.653 E-.12998
G1 X95.423 Y75.952 E-.11501
G1 X95.465 Y76.098 E-.05798
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.96 I-.403 J-1.148 P1  F42000
G1 X92.803 Y77.032 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.161 Y77.254 I-.134 J.615 E.01037
G1 X91.641 Y77.254 E.03667
G3 X92.293 Y77.116 I.526 J.874 E.01637
G3 X92.75 Y77.01 I.329 J.381 E.01177
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.161 Y77.254 E-.18197
G1 X92.64 Y77.254 E-.19804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.96 I-1.169 J.338 P1  F42000
G1 X93.543 Y80.373 Z3.96
G1 Z3.56
M73 P66 R4
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X93.543 Y81.601 E.02962
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.593 J1.063 P1  F42000
G1 X94.428 Y82.096 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F3822
M204 S6000
G1 X94.428 Y83.466 E.03303
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.433 J1.137 P1  F42000
G1 X96.2 Y84.139 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X96.2 Y81.141 E.0723
G3 X96.493 Y80.882 I.313 J.059 E.01016
G3 X96.722 Y82.153 I-1.041 J.844 E.03248
G1 X97.085 Y82.057 E.00906
G1 X97.085 Y83.262 E.02906
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.617 J1.049 P1  F42000
G1 X97.971 Y83.783 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F3822
M204 S6000
G1 X97.971 Y85.176 E.0336
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.69 J1.003 P1  F42000
G1 X98.857 Y85.786 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X98.857 Y86.826 E.0251
G2 X99.096 Y86.718 I-.099 J-.535 E.0064
G1 X99.742 Y86.818 E.01577
G1 X99.742 Y85.132 E.04066
G3 X99.828 Y85.175 I-.008 J.121 E.00237
G3 X99.832 Y85.878 I-.812 J.357 E.01745
G2 X100.628 Y86.432 I1.152 J-.806 E.02388
G1 X100.628 Y87.136 E.01696
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.085 J.552 P1  F42000
G1 X101.514 Y85.394 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X101.514 Y83.897 E.03611
M106 S124.95
M106 S127.5
M204 S10000
G1 X102.399 Y83.939 F42000
G1 F4800
M204 S6000
G1 X102.399 Y82.262 E.04045
G3 X102.851 Y82.282 I.218 J.174 E.01271
G3 X102.598 Y82.991 I-3.65 J-.901 E.01818
G2 X103.285 Y83.566 I1.793 J-1.444 E.02173
G1 X103.285 Y84.339 E.01864
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-1.217 J0 P1  F42000
G1 X103.285 Y87.302 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X103.285 Y86.675 E.01513
G2 X102.781 Y86.759 I-.17 J.534 E.01279
G2 X102.399 Y86.883 I.076 J.885 E.00976
G1 X102.399 Y88.148 E.03051
M106 S124.95
M106 S127.5
M204 S10000
G1 X102.399 Y88.751 F42000
G1 F4800
M204 S6000
G1 X102.399 Y89.704 E.02297
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.704 J-.993 P1  F42000
G1 X98.857 Y92.217 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X98.857 Y90.798 E.03421
G2 X98.574 Y91.139 I.376 J.598 E.01085
G2 X98.099 Y91.549 I.134 J.635 E.0158
G1 X97.971 Y91.689 E.00457
G1 X97.971 Y92.488 E.01927
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-1.055 J-.606 P1  F42000
G1 X97.085 Y94.031 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X97.085 Y93.219 E.01957
G1 X97.145 Y93.216 E.00143
G3 X97.971 Y93.246 I.401 J.348 E.02285
G1 X97.971 Y94.392 E.02763
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.027 J-.652 P1  F42000
G1 X96.2 Y91.603 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X96.2 Y90.38 E.02949
G3 X95.866 Y89.769 I.078 J-.439 E.01926
G2 X95.758 Y89.12 I-.546 J-.243 E.0168
G2 X95.314 Y89.512 I.191 J.663 E.01477
G1 X95.314 Y92.357 E.06861
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.019 J-.665 P1  F42000
G1 X94.428 Y91.001 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X94.428 Y90.173 E.01995
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.758 J-.952 P1  F42000
G1 X93.543 Y89.468 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X93.543 Y88.113 E.03268
G3 X93.961 Y88.022 I.279 J.274 E.01092
G3 X94.428 Y87.734 I1.094 J1.25 E.01331
G1 X94.428 Y88.775 E.0251
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.991 J-.707 P1  F42000
G1 X90.886 Y83.808 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X90.886 Y82.605 E.02901
M106 S124.95
M106 S127.5
M204 S10000
G1 X91.771 Y82.24 F42000
G1 F4800
M204 S6000
G1 X91.771 Y81.731 E.01228
G3 X92.182 Y81.61 I.436 J.725 E.01043
G3 X92.657 Y81.574 I.278 J.505 E.01185
G1 X92.657 Y82.67 E.02643
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.69 J-1.003 P1  F42000
G1 X90.886 Y81.451 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X90.886 Y80.31 E.02752
G2 X90.515 Y80.691 I.463 J.822 E.01299
G2 X90 Y80.978 I.656 J1.781 E.01427
G1 X90 Y81.484 E.0122
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.666 J-1.019 P1  F42000
G1 X88.229 Y82.642 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X88.229 Y81.684 E.0231
G1 X87.99 Y81.502 E.00724
G1 X87.797 Y81.499 E.00466
G2 X87.343 Y81.205 I-.726 J.625 E.01322
G1 X87.343 Y82.397 E.02873
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.952 J-.758 P1  F42000
G1 X86.457 Y81.284 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X86.457 Y79.716 E.03782
G2 X86.108 Y79.866 I-.08 J.296 E.0099
G1 X85.572 Y80.582 E.02156
G1 X85.572 Y81.556 E.02349
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.141 J1.209 P1  F42000
G1 X97.971 Y80.113 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X97.971 Y79.375 E.01779
G3 X98.249 Y79.26 I.563 J.965 E.00727
G2 X98.857 Y78.389 I-12.211 J-9.169 E.02563
G1 X98.857 Y79.999 E.03882
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-.436 J1.136 P1  F42000
G1 X100.628 Y80.678 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X100.628 Y79.69 E.02383
G3 X101.397 Y79.778 I-5.497 J51.345 E.01866
G1 X101.514 Y79.907 E.0042
G1 X101.514 Y81.489 E.03816
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.667 J1.018 P1  F42000
G1 X102.399 Y80.909 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X102.399 Y80.316 E.0143
G3 X103.285 Y80.348 I.404 J1.08 E.02194
G1 X103.285 Y80.99 E.01548
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
G1 X103.285 Y79.144 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X103.285 Y78.368 E.01872
G2 X103.125 Y78.253 I-.282 J.224 E.0048
G1 X102.894 Y77.665 E.01524
G2 X103.068 Y76.922 I-.699 J-.556 E.01903
G2 X102.586 Y77.063 I-.116 J.494 E.01266
G1 X102.399 Y77.299 E.00726
G1 X102.399 Y78.584 E.03097
G1 X101.983 Y78.506 E.0102
G3 X101.514 Y78.635 I-.662 J-1.49 E.01179
G1 X101.514 Y77.881 E.01819
M106 S124.95
M106 S127.5
M204 S10000
G1 X100.628 Y77.825 F42000
G1 F4800
M204 S6000
G1 X100.628 Y76.777 E.02526
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-1.158 J-.375 P1  F42000
G1 X98.857 Y82.241 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X98.868 Y80.931 E.03158
G3 X99.742 Y81.545 I-1.66 J3.291 E.02585
G1 X99.742 Y82.84 E.03123
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I-1.062 J-.594 P1  F42000
G1 X92.657 Y95.499 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X92.657 Y94.55 E.02288
G2 X91.771 Y95.106 I4.211 J7.697 E.02523
G1 X91.771 Y96.442 E.03221
G2 X91.063 Y95.577 I-1.193 J.256 E.02799
G3 X90.886 Y94.907 I.427 J-.471 E.01768
M106 S124.95
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z3.96 I.993 J-.703 P1  F42000
G1 X76.985 Y75.279 Z3.96
G1 Z3.56
G1 E.4 F1800
; FEATURE: Outer wall
G1 F3822
M204 S5000
G3 X78.053 Y75.066 I1.077 J2.608 E.02643
G1 X80.94 Y75.066 E.06962
G1 X80.94 Y75.44 E.00903
G1 X76.658 Y75.44 E.10327
G3 X76.93 Y75.303 I1.404 J2.448 E.00736
; WIPE_START
G1 F12000
M204 S6000
G1 X77.374 Y75.149 E-.17876
G1 X77.777 Y75.079 E-.15529
G1 X77.898 Y75.073 E-.04596
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.96 I-.01 J1.217 P1  F42000
G1 X103.014 Y75.281 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F3822
M204 S5000
G3 X103.344 Y75.441 I-1.097 J2.674 E.00884
G1 X97.06 Y75.44 E.15154
G1 X97.06 Y75.066 E.00902
G1 X102.087 Y75.069 E.12122
G3 X102.959 Y75.258 I-.169 J2.885 E.02161
; WIPE_START
G1 F12000
M204 S6000
G1 X103.344 Y75.441 E-.16201
G1 X102.77 Y75.441 E-.21799
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.96 I-1.215 J.067 P1  F42000
G1 X104.33 Y103.594 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F3822
M204 S5000
G1 X104.334 Y103.16 E.01046
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.458 E.63905
G1 X104.405 Y76.538 E.00222
G3 X104.734 Y77.853 I-2.569 J1.341 E.033
G1 X104.734 Y102.147 E.58586
G3 X104.36 Y103.542 I-2.871 J-.022 E.03521
; WIPE_START
G1 F12000
M204 S6000
M73 P67 R4
G1 X104.334 Y103.16 E-.14552
G1 X104.36 Y102.957 E-.07769
G1 X104.36 Y102.545 E-.15678
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.96 I-1.074 J-.572 P1  F42000
G1 X103.262 Y104.606 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F3822
M204 S5000
G3 X101.947 Y104.934 I-1.351 J-2.614 E.03297
G1 X78.053 Y104.934 E.57621
G3 X76.659 Y104.56 I0 J-2.783 E.03519
G1 X103.341 Y104.56 E.64342
G1 X103.313 Y104.576 E.00075
; WIPE_START
G1 F12000
M204 S6000
G1 X102.888 Y104.771 E-.17803
G1 X102.626 Y104.851 E-.10412
G1 X102.372 Y104.895 E-.09786
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.96 I.059 J-1.216 P1  F42000
G1 X75.67 Y103.592 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F3822
M204 S5000
G3 X75.266 Y102.147 I2.409 J-1.453 E.03663
G1 X75.266 Y77.853 E.58586
G3 X75.64 Y76.458 I2.797 J.002 E.03524
G1 X75.64 Y102.957 E.63905
G3 X75.672 Y103.532 I-3.869 J.501 E.0139
; WIPE_START
G1 F12000
M204 S6000
M73 P67 R3
G1 X75.478 Y103.216 E-.14114
G1 X75.349 Y102.825 E-.15607
G1 X75.312 Y102.611 E-.08279
; WIPE_END
G1 E-.02 F1800
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

; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 23/30
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G1 X93.363 Y97.085 F42000
G1 Z3.72
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X76.658 Y97.085 E.40285
G1 X76.658 Y97.971 E.02136
G1 X103.342 Y97.971 E.6435
G1 X103.342 Y98.857 E.02136
G1 X76.658 Y98.857 E.6435
G1 X76.658 Y99.742 E.02136
G1 X103.342 Y99.742 E.6435
G1 X103.342 Y100.628 E.02136
G1 X76.658 Y100.628 E.6435
G1 X76.658 Y101.514 E.02136
G1 X103.342 Y101.514 E.6435
G1 X103.342 Y102.399 E.02136
G1 X76.658 Y102.399 E.6435
G2 X76.688 Y103.285 I12.752 J.011 E.02137
G1 X103.486 Y103.285 E.64625
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z4.12 I.696 J-.999 P1  F42000
G1 X94.587 Y97.085 Z4.12
G1 Z3.72
G1 E.4 F1800
M106 S127.5
G1 F4800
M204 S6000
G1 X103.342 Y97.085 E.21114
G1 X103.342 Y96.2 E.02136
G1 X76.658 Y96.2 E.6435
G1 X76.658 Y95.314 E.02136
G1 X103.342 Y95.314 E.6435
G1 X103.342 Y94.428 E.02136
G1 X76.658 Y94.428 E.6435
G1 X76.658 Y93.543 E.02136
G1 X103.342 Y93.543 E.6435
G1 X103.342 Y92.657 E.02136
G1 X76.658 Y92.657 E.6435
G1 X76.658 Y91.771 E.02136
G1 X103.342 Y91.771 E.6435
M73 P68 R3
G1 X103.342 Y90.886 E.02136
G1 X76.658 Y90.886 E.6435
G1 X76.658 Y90 E.02136
G1 X103.342 Y90 E.6435
G1 X103.342 Y89.114 E.02136
G1 X76.658 Y89.114 E.6435
G1 X76.658 Y88.229 E.02136
G1 X103.342 Y88.229 E.6435
G1 X103.342 Y87.343 E.02136
G1 X76.658 Y87.343 E.6435
G1 X76.658 Y86.457 E.02136
G1 X103.342 Y86.457 E.6435
G1 X103.342 Y85.572 E.02136
G1 X76.658 Y85.572 E.6435
G1 X76.658 Y84.686 E.02136
G1 X103.342 Y84.686 E.6435
G1 X103.342 Y83.8 E.02136
G1 X76.658 Y83.8 E.6435
G1 X76.658 Y82.915 E.02136
G1 X103.342 Y82.915 E.6435
G1 X103.342 Y82.029 E.02136
G1 X76.658 Y82.029 E.6435
G1 X76.658 Y81.143 E.02136
G1 X103.342 Y81.143 E.6435
G1 X103.342 Y80.258 E.02136
G1 X76.658 Y80.258 E.6435
G1 X76.658 Y79.372 E.02136
G1 X103.516 Y79.372 E.64769
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z4.12 I1.217 J0 P1  F42000
G1 X103.516 Y76.715 Z4.12
G1 Z3.72
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X97.043 Y76.715 E.1561
G1 X97.043 Y77.601 E.02136
G1 X103.342 Y77.601 E.15191
G1 X103.342 Y78.486 E.02136
G1 X76.658 Y78.486 E.6435
G1 X76.658 Y77.601 E.02136
G1 X82.957 Y77.601 E.15191
G1 X82.957 Y77.173 E.01032
G1 X80.957 Y77.173 E.04823
G1 X80.957 Y76.715 E.01104
G1 X76.484 Y76.715 E.10787
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z4.12 I-.15 J1.208 P1  F42000
G1 X83.592 Y77.601 Z4.12
G1 Z3.72
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X86.441 Y77.601 E.06871
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z4.12 I.21 J1.199 P1  F42000
G1 X89.806 Y77.012 Z4.12
G1 Z3.72
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X89.973 Y77.254 I-.148 J.28 E.00738
G1 X89.533 Y77.254 E.01061
G3 X89.748 Y77.008 I.428 J.157 E.00807
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.899 Y77.064 E-.06097
G1 X89.973 Y77.254 E-.07763
G1 X89.533 Y77.254 E-.16726
G1 X89.661 Y77.108 E-.07415
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I-.03 J1.217 P1  F42000
G1 X91.847 Y77.161 Z4.12
G1 Z3.72
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X92.678 Y77.181 I.475 J-2.54 E.02012
G1 X92.954 Y77.254 E.0069
G1 X91.53 Y77.254 E.03435
G3 X91.789 Y77.16 I.254 J.297 E.0068
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.343 Y77.239 E-.21244
M73 P69 R3
G1 X92.678 Y77.181 E-.12916
G1 X92.775 Y77.207 E-.0384
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I.528 J1.097 P1  F42000
G1 X94.891 Y76.188 Z4.12
G1 Z3.72
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X94.914 Y76.351 E.00396
G3 X94.841 Y76.252 I.026 J-.095 E.00318
G3 X95.449 Y75.242 I16.881 J9.462 E.02844
G3 X95.288 Y75.992 I-1.075 J.162 E.01892
G1 X95.406 Y76.839 E.02063
G3 X95.456 Y77.194 I-.17 J.204 E.00946
G1 X95.419 Y77.254 E.00171
G3 X94.661 Y76.696 I-.144 J-.598 E.02585
G3 X94.639 Y75.844 I.271 J-.433 E.0243
G3 X95.295 Y75.207 I1.162 J.539 E.02256
G1 X95.388 Y75.205 E.00224
M106 S124.95
; WIPE_START
G1 X95.485 Y75.481 E-.11118
G1 X95.288 Y75.992 E-.2082
G1 X95.31 Y76.15 E-.06062
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I.056 J-1.216 P1  F42000
G1 X76.994 Y75.299 Z4.12
G1 Z3.72
G1 E.4 F1800
; FEATURE: Outer wall
G1 F12000
M204 S5000
G3 X78.053 Y75.088 I1.062 J2.564 E.02621
G1 X80.94 Y75.088 E.06962
G1 X80.94 Y75.44 E.00848
G1 X76.703 Y75.44 E.10218
G3 X76.939 Y75.323 I1.353 J2.423 E.00635
; WIPE_START
M204 S6000
G1 X77.379 Y75.171 E-.17698
G1 X77.779 Y75.101 E-.15437
G1 X77.907 Y75.095 E-.04866
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I-.01 J1.217 P1  F42000
G1 X103.006 Y75.301 Z4.12
G1 Z3.72
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X103.299 Y75.441 I-1.089 J2.659 E.00784
G1 X97.06 Y75.44 E.15045
G1 X97.06 Y75.088 E.00849
G1 X102.085 Y75.091 E.12119
G3 X102.95 Y75.279 I-.169 J2.869 E.02141
; WIPE_START
M204 S6000
G1 X103.299 Y75.441 E-.14621
G1 X102.684 Y75.441 E-.2338
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I-1.215 J.072 P1  F42000
G1 X104.334 Y103.16 Z4.12
G1 Z3.72
G1 E.4 F1800
G1 F12000
M204 S5000
G2 X104.36 Y102.957 I-.681 J-.192 E.00495
G1 X104.36 Y76.503 E.63796
G1 X104.386 Y76.548 E.00126
G3 X104.712 Y77.853 I-2.549 J1.33 E.03273
G1 X104.712 Y102.147 E.58586
G3 X104.33 Y103.55 I-2.779 J-.003 E.03547
G1 X104.333 Y103.22 E.00795
; WIPE_START
M204 S6000
G1 X104.36 Y102.957 E-.10035
G1 X104.36 Y102.221 E-.27965
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I-1.101 J-.518 P1  F42000
G1 X103.245 Y104.589 Z4.12
G1 Z3.72
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X101.947 Y104.912 I-1.323 J-2.55 E.03255
G1 X78.053 Y104.912 E.57621
G3 X76.703 Y104.56 I.004 J-2.781 E.03401
G1 X103.296 Y104.56 E.64131
; WIPE_START
M204 S6000
G1 X102.88 Y104.75 E-.17382
G1 X102.621 Y104.829 E-.10307
G1 X102.354 Y104.875 E-.10311
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I.06 J-1.215 P1  F42000
G1 X75.67 Y103.55 Z4.12
G1 Z3.72
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X75.288 Y102.147 I2.397 J-1.405 E.03546
G1 X75.288 Y77.853 E.58586
G3 X75.64 Y76.503 I2.775 J.002 E.03401
G1 X75.64 Y102.957 E.63796
G3 X75.671 Y103.49 I-3.686 J.482 E.01287
; WIPE_START
M204 S6000
G1 X75.498 Y103.207 E-.12598
G1 X75.371 Y102.821 E-.15432
G1 X75.326 Y102.563 E-.0997
; WIPE_END
G1 E-.02 F1800
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

; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 24/30
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G1 X76.715 Y103.716 F42000
G1 Z3.88
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X76.715 Y76.461 E.65726
G1 X77.601 Y76.46 E.02136
G1 X77.601 Y103.542 E.65309
G1 X78.486 Y103.542 E.02136
G1 X78.486 Y76.46 E.65311
G1 X79.372 Y76.459 E.02136
G1 X79.372 Y103.542 E.65312
G1 X80.258 Y103.542 E.02136
G1 X80.258 Y76.458 E.65314
G1 X80.957 Y76.458 E.01687
G1 X80.957 Y77.173 E.01724
G1 X81.143 Y77.173 E.00449
G1 X81.143 Y103.542 E.63591
G1 X82.029 Y103.542 E.02136
G1 X82.029 Y77.173 E.63591
G1 X82.915 Y77.173 E.02136
G1 X82.915 Y103.542 E.63591
G1 X83.8 Y103.542 E.02136
G1 X83.8 Y78.543 E.60287
G1 X84.686 Y78.543 E.02136
G1 X84.686 Y103.542 E.60287
G1 X85.572 Y103.542 E.02136
G1 X85.572 Y78.543 E.60287
G1 X86.457 Y78.543 E.02136
G1 X86.457 Y103.542 E.60287
G1 X87.343 Y103.542 E.02136
G1 X87.343 Y78.543 E.60287
G1 X88.229 Y78.543 E.02136
G1 X88.229 Y103.542 E.60287
M73 P70 R3
G1 X89.114 Y103.542 E.02136
G1 X89.114 Y78.543 E.60287
G1 X90 Y78.543 E.02136
G1 X90 Y103.542 E.60287
G1 X90.886 Y103.542 E.02136
G1 X90.886 Y78.543 E.60287
G1 X91.771 Y78.543 E.02136
G1 X91.771 Y103.716 E.60706
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z4.28 I0 J1.217 P1  F42000
G1 X103.285 Y103.716 Z4.28
G1 Z3.88
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X103.285 Y76.458 E.65732
G1 X102.399 Y76.458 E.02136
G1 X102.399 Y103.542 E.65314
G1 X101.514 Y103.542 E.02136
G1 X101.514 Y76.458 E.65314
G1 X100.628 Y76.458 E.02136
G1 X100.628 Y103.542 E.65314
G1 X99.742 Y103.542 E.02136
G1 X99.742 Y76.458 E.65315
G1 X98.857 Y76.458 E.02136
G1 X98.857 Y103.542 E.65315
G1 X97.971 Y103.542 E.02136
G1 X97.971 Y76.458 E.65315
G1 X97.085 Y76.458 E.02136
G1 X97.085 Y103.542 E.65315
G1 X96.2 Y103.542 E.02136
G1 X96.2 Y78.543 E.60287
G1 X95.314 Y78.543 E.02136
G1 X95.314 Y103.542 E.60287
G1 X94.428 Y103.542 E.02136
G1 X94.428 Y97.825 E.13788
G3 X93.543 Y97.839 I-.454 J-.654 E.02265
G1 X93.543 Y103.542 E.13753
G1 X92.657 Y103.542 E.02136
G1 X92.657 Y78.543 E.60287
G1 X93.543 Y78.543 E.02136
G1 X93.543 Y96.512 E.43332
G3 X94.428 Y96.526 I.432 J.664 E.02267
G1 X94.428 Y78.369 E.43785
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z4.28 I.64 J1.035 P1  F42000
G1 X95.314 Y77.821 Z4.28
G1 Z3.88
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X95.314 Y77.173 E.01563
G1 X94.428 Y77.173 E.02136
G1 X94.428 Y77.647 E.01145
G1 X93.543 Y77.647 E.02136
G1 X93.543 Y77.173 E.01145
G1 X92.657 Y77.173 E.02136
G1 X92.657 Y77.647 E.01145
G1 X91.771 Y77.647 E.02136
G1 X91.771 Y77.173 E.01145
G1 X90.886 Y77.173 E.02136
G1 X90.886 Y77.647 E.01145
G1 X90 Y77.647 E.02136
G1 X90 Y77.173 E.01145
G1 X89.114 Y77.173 E.02136
G1 X89.114 Y77.647 E.01145
G1 X88.229 Y77.647 E.02136
M73 P71 R3
G1 X88.229 Y77.173 E.01145
G1 X87.343 Y77.173 E.02136
G1 X87.343 Y77.647 E.01145
G1 X86.457 Y77.647 E.02136
G1 X86.457 Y77.173 E.01145
G1 X85.572 Y77.173 E.02136
G1 X85.572 Y77.647 E.01145
G1 X84.686 Y77.647 E.02136
G1 X84.686 Y76.999 E.01563
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z4.28 I.236 J-1.194 P1  F42000
G1 X76.788 Y75.44 Z4.28
G1 Z3.88
G1 E.4 F1800
; FEATURE: Outer wall
G1 F11693
M204 S5000
G3 X78.053 Y75.129 I1.29 J2.516 E.0317
G1 X80.94 Y75.129 E.06962
G1 X80.94 Y75.44 E.0075
G1 X76.848 Y75.44 E.09868
; WIPE_START
G1 F12000
M204 S6000
G1 X77.008 Y75.336 E-.0725
G1 X77.389 Y75.211 E-.15232
G1 X77.783 Y75.142 E-.1522
G1 X77.791 Y75.142 E-.00298
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.28 I-.008 J1.217 P1  F42000
G1 X102.89 Y75.3 Z4.28
G1 Z3.88
G1 E.4 F1800
G1 F11693
M204 S5000
G3 X103.214 Y75.441 I-.968 J2.657 E.00852
G1 X97.06 Y75.44 E.1484
G1 X97.06 Y75.129 E.0075
G1 X101.947 Y75.129 E.11785
G3 X102.834 Y75.28 I-.024 J2.827 E.02178
; WIPE_START
G1 F12000
M204 S6000
G1 X103.214 Y75.441 E-.15688
G1 X102.627 Y75.441 E-.22313
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.28 I-1.215 J.074 P1  F42000
G1 X104.331 Y103.466 Z4.28
G1 Z3.88
G1 E.4 F1800
G1 F11693
M204 S5000
G1 X104.334 Y103.16 E.00737
G2 X104.36 Y102.957 I-.68 J-.191 E.00495
G1 X104.36 Y76.588 E.63591
G1 X104.41 Y76.687 E.00267
G3 X104.671 Y77.853 I-2.494 J1.171 E.02906
G1 X104.671 Y102.147 E.58586
G3 X104.359 Y103.413 I-2.756 J-.008 E.03173
; WIPE_START
G1 F12000
M204 S6000
G1 X104.334 Y103.16 E-.09649
G1 X104.36 Y102.957 E-.0777
G1 X104.36 Y102.416 E-.20581
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.28 I-1.073 J-.574 P1  F42000
G1 X103.212 Y104.56 Z4.28
G1 Z3.88
G1 E.4 F1800
G1 F11693
M204 S5000
G1 X103.113 Y104.61 E.00267
G3 X101.947 Y104.871 I-1.171 J-2.494 E.02905
G1 X78.053 Y104.871 E.57621
G3 X76.788 Y104.56 I.024 J-2.828 E.0317
G1 X103.152 Y104.56 E.63578
; WIPE_START
G1 F12000
M204 S6000
G1 X103.113 Y104.61 E-.02398
G1 X102.842 Y104.72 E-.1114
G1 X102.481 Y104.819 E-.14224
G1 X102.217 Y104.858 E-.10137
G1 X102.214 Y104.858 E-.00102
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.28 I.064 J-1.215 P1  F42000
G1 X75.669 Y103.466 Z4.28
G1 Z3.88
G1 E.4 F1800
G1 F11693
M204 S5000
G3 X75.329 Y102.147 I2.396 J-1.321 E.03319
G1 X75.329 Y77.853 E.58586
G3 X75.64 Y76.59 I2.811 J.022 E.03166
G1 X75.64 Y102.957 E.63586
G3 X75.67 Y103.406 I-3.372 J.447 E.01084
; WIPE_START
G1 F12000
M204 S6000
G1 X75.537 Y103.192 E-.0956
G1 X75.411 Y102.811 E-.15239
G1 X75.351 Y102.469 E-.13202
; WIPE_END
G1 E-.02 F1800
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

; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 25/30
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G1 X83.679 Y77.601 F42000
G1 Z4.04
G1 E.4 F1800
; FEATURE: Support interface
G1 F1019
M204 S6000
G1 X96.147 Y77.601 E.30067
G1 X96.147 Y76.715 E.02136
G1 X95.336 Y76.715 E.01957
G1 X95.336 Y75.829 E.02136
G1 X96.216 Y75.829 E.02122
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z4.44 I.025 J-1.217 P1  F42000
G1 X76.924 Y75.44 Z4.44
G1 Z4.04
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1019
M204 S5000
G3 X78.053 Y75.189 I1.157 J2.543 E.02809
G1 X80.94 Y75.189 E.06962
G1 X80.94 Y75.44 E.00605
G1 X76.984 Y75.44 E.0954
; WIPE_START
G1 F12000
M204 S6000
G1 X77.278 Y75.304 E-.12302
G1 X77.529 Y75.241 E-.09855
G1 X77.944 Y75.2 E-.15844
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.44 I-.007 J1.217 P1  F42000
G1 X102.846 Y75.346 Z4.44
G1 Z4.04
G1 E.4 F1800
G1 F1019
M204 S5000
G3 X103.078 Y75.441 I-.906 J2.541 E.00605
G1 X97.06 Y75.44 E.14513
G1 X97.06 Y75.189 E.00604
G1 X102.081 Y75.193 E.12107
G3 X102.789 Y75.326 I-.14 J2.694 E.01744
; WIPE_START
G1 F12000
M204 S6000
G1 X103.078 Y75.441 E-.11808
G1 X102.389 Y75.441 E-.26192
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.44 I-1.214 J.085 P1  F42000
G1 X104.332 Y103.333 Z4.44
G1 Z4.04
G1 E.4 F1800
G1 F1019
M204 S5000
G3 X104.36 Y102.957 I3.145 J.044 E.00909
G1 X104.36 Y76.724 E.63263
G1 X104.408 Y76.832 E.00286
G3 X104.611 Y77.853 I-2.633 J1.053 E.02524
G1 X104.611 Y102.147 E.58586
G3 X104.358 Y103.279 I-2.769 J-.024 E.02817
; WIPE_START
M73 P72 R3
G1 F12000
M204 S6000
G1 X104.36 Y102.957 E-.12208
G1 X104.36 Y102.279 E-.25793
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.44 I-1.061 J-.597 P1  F42000
G1 X103.076 Y104.56 Z4.44
G1 Z4.04
G1 E.4 F1800
G1 F1019
M204 S5000
G1 X102.97 Y104.607 E.00281
G3 X101.947 Y104.81 I-1.028 J-2.5 E.0253
G1 X78.053 Y104.81 E.57621
G3 X76.929 Y104.56 I.044 J-2.845 E.02797
G1 X103.016 Y104.56 E.6291
; WIPE_START
G1 F12000
M204 S6000
G1 X102.97 Y104.607 E-.02522
G1 X102.469 Y104.759 E-.19885
G1 X102.211 Y104.798 E-.09914
G1 X102.062 Y104.805 E-.05679
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.44 I.068 J-1.215 P1  F42000
G1 X75.668 Y103.333 Z4.44
G1 Z4.04
G1 E.4 F1800
G1 F1019
M204 S5000
G3 X75.39 Y102.147 I2.396 J-1.188 E.02963
G1 X75.39 Y77.853 E.58586
G3 X75.64 Y76.724 I2.898 J.051 E.02808
G1 X75.64 Y102.957 E.63263
G3 X75.666 Y103.273 I-3.116 J.42 E.00764
; WIPE_START
G1 F12000
M204 S6000
M73 P73 R3
G1 X75.545 Y103.046 E-.09767
G1 X75.47 Y102.798 E-.09853
G1 X75.402 Y102.409 E-.15006
G1 X75.398 Y102.32 E-.03374
; WIPE_END
G1 E-.02 F1800
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

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 26/30
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
G1 X95.025 Y94.498 F42000
G1 Z4.2
G1 E.4 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
M204 S5000
G3 X93.617 Y94.321 I-1.051 J2.675 E.43212
G1 X93.903 Y94.3 E.00746
G3 X94.969 Y94.477 I.071 J2.873 E.02825
M106 S76.5
M106 S127.5
M204 S250
G1 X94.873 Y94.885 F42000
G1 F600
M204 S5000
G3 X93.669 Y94.734 I-.899 J2.288 E.36959
G1 X93.914 Y94.716 E.00638
G3 X94.817 Y94.864 I.061 J2.458 E.02394
M106 S76.5
M106 S127.5
M204 S250
G1 X94.722 Y95.273 F42000
G1 F600
M204 S5000
G3 X93.721 Y95.147 I-.747 J1.901 E.30706
G1 X93.924 Y95.132 E.0053
G3 X94.665 Y95.252 I.051 J2.042 E.01963
M106 S76.5
M106 S127.5
M204 S250
G1 X94.569 Y95.66 F42000
G1 F600
M204 S5000
G3 X93.773 Y95.56 I-.595 J1.514 E.24454
G1 X93.934 Y95.548 E.00422
G3 X94.513 Y95.639 I.04 J1.626 E.01531
M106 S76.5
M106 S127.5
M204 S250
G1 X94.417 Y96.047 F42000
G1 F600
M204 S5000
G3 X93.824 Y95.973 I-.443 J1.127 E.18201
G1 X93.945 Y95.964 E.00314
G3 X94.361 Y96.027 I.03 J1.21 E.011
M106 S76.5
M106 S127.5
M204 S250
M73 P74 R3
G1 X94.344 Y96.454 F42000
G1 F600
M204 S5000
G3 X93.874 Y96.371 I-.37 J.721 E.11964
G1 X93.955 Y96.365 E.0021
G3 X94.29 Y96.429 I.02 J.809 E.00894
M106 S76.5
M106 S127.5
; WIPE_START
M204 S6000
G1 X94.48 Y96.541 E-.08399
G1 X94.596 Y96.654 E-.06136
G1 X94.687 Y96.787 E-.06128
G1 X94.749 Y96.936 E-.06144
G1 X94.781 Y97.094 E-.0612
G1 X94.781 Y97.228 E-.05073
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I1.14 J.425 P1  F42000
G1 X102.17 Y77.385 Z4.6
G1 Z4.2
G1 E.4 F1800
G1 F600
M204 S5000
G1 X102.331 Y77.505 E.00521
G1 X102.434 Y77.677 E.00522
G1 X102.465 Y77.881 E.00536
G1 X102.465 Y102.121 E.63001
G1 X102.434 Y102.323 E.00532
G1 X102.389 Y102.417 E.00271
G1 X102.314 Y102.513 E.00318
G1 X102.236 Y102.577 E.00262
G1 X102.123 Y102.634 E.00327
G1 X101.921 Y102.665 E.00532
G1 X78.079 Y102.665 E.61966
G1 X77.853 Y102.625 E.00596
G1 X77.766 Y102.579 E.00256
G1 X77.669 Y102.495 E.00333
G1 X77.566 Y102.323 E.00521
G1 X77.535 Y102.121 E.00532
G1 X77.535 Y77.879 E.63005
G1 X77.565 Y77.68 E.00524
G1 X77.669 Y77.505 E.00531
M73 P75 R3
G1 X77.83 Y77.385 E.00521
G1 X78.025 Y77.337 E.00521
G3 X78.877 Y77.335 I.451 J16.932 E.02214
G1 X78.877 Y79.253 E.04985
G1 X80.877 Y79.253 E.05198
G1 X80.877 Y80.623 E.03561
G1 X99.123 Y80.623 E.47425
G1 X99.123 Y77.335 E.08546
G1 X101.975 Y77.337 E.07412
M73 P75 R2
G1 X102.112 Y77.371 E.00366
M106 S76.5
M106 S127.5
M204 S250
G1 X102.348 Y77.01 F42000
G1 F600
M204 S5000
G3 X102.88 Y77.875 I-.399 J.842 E.02795
G1 X102.88 Y102.126 E.6303
G3 X101.926 Y103.08 I-.935 J.019 E.03919
G1 X78.074 Y103.08 E.61994
G3 X77.12 Y102.126 I-.019 J-.935 E.03918
G1 X77.12 Y77.874 E.63033
M73 P76 R2
G3 X78.074 Y76.92 I.935 J-.019 E.03919
G1 X79.292 Y76.92 E.03167
G1 X79.292 Y78.838 E.04985
G1 X81.292 Y78.838 E.05198
G1 X81.292 Y80.208 E.03561
G1 X98.708 Y80.208 E.45264
G1 X98.708 Y76.92 E.08546
G1 X101.995 Y76.921 E.08545
M73 P77 R2
G3 X102.292 Y76.986 I-.047 J.931 E.00794
M106 S76.5
M106 S127.5
M204 S250
G1 X102.525 Y76.634 F42000
G1 F600
M204 S5000
G3 X103.296 Y77.87 I-.577 J1.218 E.04
G1 X103.296 Y102.131 E.63058
G3 X101.931 Y103.496 I-1.351 J.013 E.05587
G1 X78.069 Y103.496 E.62022
G3 X76.704 Y102.131 I-.013 J-1.352 E.05586
G1 X76.704 Y77.869 E.63061
G3 X78.069 Y76.504 I1.351 J-.013 E.05587
G1 X79.708 Y76.504 E.04261
M73 P78 R2
G1 X79.708 Y78.422 E.04985
G1 X81.708 Y78.422 E.05198
G1 X81.708 Y79.792 E.03561
G1 X98.292 Y79.792 E.43104
G1 X98.292 Y76.504 E.08546
G1 X102.016 Y76.506 E.09679
G3 X102.47 Y76.609 I-.067 J1.346 E.01218
M106 S76.5
M106 S127.5
M204 S250
G1 X102.703 Y76.258 F42000
G1 F600
M204 S5000
G3 X103.712 Y77.864 I-.755 J1.594 E.05205
G1 X103.712 Y102.137 E.63087
G3 X101.937 Y103.912 I-1.768 J.007 E.07255
G1 X78.063 Y103.912 E.6205
G3 X76.288 Y102.137 I-.007 J-1.768 E.07255
M73 P79 R2
G1 X76.288 Y77.863 E.63089
G3 X78.063 Y76.088 I1.768 J-.007 E.07255
G1 X80.124 Y76.089 E.05355
G1 X80.124 Y78.006 E.04984
G1 X82.124 Y78.006 E.05198
G1 X82.124 Y79.376 E.03561
G1 X97.876 Y79.376 E.40943
G1 X97.876 Y76.088 E.08546
G1 X102.036 Y76.091 E.10812
M73 P80 R2
G3 X102.648 Y76.233 I-.088 J1.761 E.01643
M106 S76.5
M106 S127.5
M204 S250
G1 X102.811 Y75.851 F42000
G1 F600
M204 S5000
G3 X103.95 Y76.991 I-.882 J2.021 E.04289
M106 S76.5
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X103.961 Y77.017 E.00073
M106 S76.5
M106 S127.5
G1 X104 Y77.117 E.00278
M106 S76.5
M106 S127.5
G1 X104.032 Y77.213 E.00265
M106 S76.5
M106 S127.5
G1 X104.062 Y77.322 E.00292
M106 S76.5
M106 S127.5
G1 X104.085 Y77.425 E.00276
M106 S76.5
M106 S127.5
G1 X104.104 Y77.53 E.00278
M106 S76.5
M106 S127.5
G1 X104.117 Y77.637 E.00278
M106 S76.5
M106 S127.5
G1 X104.124 Y77.738 E.00265
M106 S76.5
M106 S127.5
G3 X104.127 Y78.458 I-13.598 J.42 E.01872
G1 X104.127 Y101.542 E.59997
G3 X104.125 Y102.257 I-14.513 J.3 E.01858
M106 S76.5
M106 S127.5
G1 X104.117 Y102.364 E.00278
M106 S76.5
M106 S127.5
G1 X104.104 Y102.47 E.00278
M106 S76.5
M106 S127.5
G1 X104.085 Y102.575 E.00277
M106 S76.5
M106 S127.5
G1 X104.062 Y102.679 E.00278
M106 S76.5
M106 S127.5
G1 X104.033 Y102.782 E.00278
M106 S76.5
M106 S127.5
G1 X104 Y102.883 E.00277
M106 S76.5
M106 S127.5
G1 X103.962 Y102.983 E.00278
M106 S76.5
M106 S127.5
G1 X103.944 Y103.022 E.00111
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G3 X102.809 Y104.15 I-2.015 J-.893 E.04257
M106 S76.5
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X102.783 Y104.161 E.00073
M106 S76.5
M106 S127.5
G1 X102.684 Y104.2 E.00278
M106 S76.5
M106 S127.5
G1 X102.587 Y104.232 E.00263
M106 S76.5
M106 S127.5
G1 X102.473 Y104.263 E.00308
M106 S76.5
M106 S127.5
G1 X102.375 Y104.285 E.00263
M106 S76.5
M106 S127.5
G1 X102.27 Y104.304 E.00277
M106 S76.5
M106 S127.5
G1 X102.163 Y104.317 E.00279
M106 S76.5
M106 S127.5
G1 X102.057 Y104.325 E.00277
M106 S76.5
M106 S127.5
G3 X101.342 Y104.327 I-.415 J-14.545 E.01859
G1 X78.658 Y104.327 E.58958
G3 X77.943 Y104.325 I-.3 J-14.485 E.01858
M106 S76.5
M106 S127.5
G1 X77.837 Y104.317 E.00278
M106 S76.5
M106 S127.5
G1 X77.735 Y104.304 E.00265
M106 S76.5
M106 S127.5
G1 X77.625 Y104.285 E.00292
M106 S76.5
M106 S127.5
G1 X77.521 Y104.262 E.00276
M106 S76.5
M106 S127.5
G1 X77.418 Y104.233 E.00278
M106 S76.5
M106 S127.5
G1 X77.316 Y104.2 E.00278
M106 S76.5
M106 S127.5
G1 X77.217 Y104.161 E.00277
M106 S76.5
M106 S127.5
G1 X77.191 Y104.15 E.00074
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G3 X76.056 Y103.022 I.882 J-2.023 E.04256
M106 S76.5
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X76.039 Y102.983 E.0011
M106 S76.5
M106 S127.5
G1 X76 Y102.884 E.00278
M106 S76.5
M106 S127.5
G1 X75.968 Y102.787 E.00265
M106 S76.5
M106 S127.5
G1 X75.938 Y102.679 E.00292
M106 S76.5
M106 S127.5
G1 X75.915 Y102.575 E.00277
M106 S76.5
M106 S127.5
G1 X75.896 Y102.469 E.00278
M106 S76.5
M106 S127.5
G1 X75.883 Y102.363 E.00278
M106 S76.5
M106 S127.5
G1 X75.875 Y102.257 E.00277
M106 S76.5
M106 S127.5
G3 X75.873 Y101.542 I14.545 J-.415 E.01859
G1 X75.873 Y78.458 E.59997
G3 X75.875 Y77.743 I14.517 J-.3 E.01858
M106 S76.5
M106 S127.5
G1 X75.883 Y77.637 E.00278
M106 S76.5
M106 S127.5
M73 P81 R2
G1 X75.896 Y77.531 E.00278
M106 S76.5
M106 S127.5
G1 X75.915 Y77.425 E.00278
M106 S76.5
M106 S127.5
G1 X75.938 Y77.321 E.00277
M106 S76.5
M106 S127.5
G1 X75.967 Y77.218 E.00279
M106 S76.5
M106 S127.5
G1 X75.998 Y77.121 E.00264
M106 S76.5
M106 S127.5
G1 X76.039 Y77.016 E.00293
M106 S76.5
M106 S127.5
G1 X76.05 Y76.991 E.00072
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G3 X77.191 Y75.85 I2.021 J.88 E.04293
M106 S76.5
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X77.217 Y75.839 E.00073
M106 S76.5
M106 S127.5
G1 X77.312 Y75.802 E.00266
M106 S76.5
M106 S127.5
G1 X77.419 Y75.766 E.00292
M106 S76.5
M106 S127.5
G1 X77.521 Y75.738 E.00277
M106 S76.5
M106 S127.5
G1 X77.625 Y75.715 E.00277
M106 S76.5
M106 S127.5
G1 X77.731 Y75.696 E.00278
M106 S76.5
M106 S127.5
G1 X77.837 Y75.683 E.00277
M106 S76.5
M106 S127.5
G1 X77.943 Y75.675 E.00278
M106 S76.5
M106 S127.5
G3 X80.539 Y75.673 I1.763 J481.29 E.06748
M106 S76.5
M106 S127.5
G1 X80.539 Y75.85 E.0046
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G1 X80.539 Y77.591 E.04524
G1 X82.539 Y77.591 E.05198
G1 X82.539 Y78.961 E.03561
G1 X97.461 Y78.961 E.38782
G1 X97.461 Y75.85 E.08085
M106 S76.5
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X97.461 Y75.673 E.00461
M106 S76.5
M106 S127.5
G1 X101.342 Y75.673 E.10088
G3 X102.057 Y75.675 I.3 J14.527 E.01858
M106 S76.5
M106 S127.5
G1 X102.164 Y75.683 E.00279
M106 S76.5
M106 S127.5
G1 X102.269 Y75.696 E.00277
M106 S76.5
M106 S127.5
G1 X102.375 Y75.715 E.00278
M106 S76.5
M106 S127.5
G1 X102.479 Y75.738 E.00278
M106 S76.5
M106 S127.5
G1 X102.582 Y75.766 E.00277
M106 S76.5
M106 S127.5
G1 X102.684 Y75.8 E.00279
M106 S76.5
M106 S127.5
G1 X102.755 Y75.828 E.002
M106 S76.5
M106 S127.5
M204 S250
G1 X103.019 Y75.505 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1985.817
M204 S5000
G1 X103.052 Y75.52 E.00088
G1 F1765.966
G1 X103.165 Y75.576 E.00305
M106 S76.5
M106 S127.5
G1 F1105.87
G1 X103.275 Y75.639 E.00305
M106 S76.5
M106 S127.5
G1 F600
G1 X103.382 Y75.707 E.00306
M106 S76.5
M106 S127.5
G1 X103.486 Y75.779 E.00305
M106 S76.5
M106 S127.5
G3 X103.608 Y75.877 I-.924 J1.288 E.00378
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G3 X103.922 Y76.19 I-2.316 J2.631 E.01152
M106 S76.5
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G3 X104.021 Y76.314 I-1.205 J1.061 E.00382
M106 S76.5
M106 S127.5
G1 X104.093 Y76.418 E.00305
M106 S76.5
M106 S127.5
G1 X104.161 Y76.525 E.00306
M106 S76.5
M106 S127.5
G1 F1104.921
G1 X104.224 Y76.635 E.00304
M106 S76.5
M106 S127.5
G1 F1764.48
G1 X104.28 Y76.748 E.00305
M106 S76.5
M106 S127.5
G1 F2362.168
G1 X104.319 Y76.835 E.0023
G1 F4615.473
G1 X104.415 Y77.097 E.00673
G1 F7365.15
G1 X104.478 Y77.347 E.00622
G1 F10682.709
G1 X104.516 Y77.597 E.0061
G1 F12000
G1 X104.528 Y77.853 E.00617
G1 X104.528 Y102.147 E.58586
G1 X104.516 Y102.403 E.00617
G1 F11709.164
G1 X104.478 Y102.653 E.0061
G1 F8225.154
G1 X104.417 Y102.898 E.0061
G1 F5351.649
G1 X104.292 Y103.226 E.00846
G1 F2387.15
G1 X104.28 Y103.252 E.00069
G1 F2197.372
G1 X104.224 Y103.365 E.00305
M106 S76.5
M106 S127.5
G1 F1453.47
G1 X104.158 Y103.48 E.00318
M106 S76.5
M106 S127.5
G1 F840
G1 X104.093 Y103.582 E.00293
M106 S76.5
M106 S127.5
G1 F600
G1 X104.021 Y103.686 E.00304
M106 S76.5
M106 S127.5
G3 X103.918 Y103.814 I-1.352 J-.975 E.00397
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G3 X103.607 Y104.124 I-2.636 J-2.333 E.01141
M106 S76.5
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G3 X103.486 Y104.221 I-1.038 J-1.181 E.00375
M106 S76.5
M106 S127.5
G1 X103.382 Y104.293 E.00305
M106 S76.5
M106 S127.5
G1 X103.275 Y104.361 E.00306
M106 S76.5
M106 S127.5
G1 F1104.921
G1 X103.165 Y104.424 E.00304
M106 S76.5
M106 S127.5
G1 F1764.35
G1 X103.052 Y104.48 E.00305
M106 S76.5
M106 S127.5
G1 F2362.229
G1 X102.965 Y104.519 E.0023
G1 F4612.495
G1 X102.704 Y104.615 E.00672
G1 F7365.888
G1 X102.453 Y104.678 E.00623
G1 F10683.697
G1 X102.203 Y104.716 E.0061
G1 F12000
G1 X101.947 Y104.728 E.00617
G1 X78.053 Y104.728 E.57622
G1 X77.797 Y104.716 E.00616
G1 F10683.526
G1 X77.547 Y104.678 E.00611
G1 F7364.164
G1 X77.302 Y104.617 E.0061
G1 F4665.334
G1 X77.035 Y104.519 E.00686
G1 F2362.004
G1 X76.953 Y104.483 E.00217
G1 F1795.692
G1 X76.835 Y104.423 E.00318
M106 S76.5
M106 S127.5
G1 F1104.321
G1 X76.725 Y104.361 E.00304
M106 S76.5
M106 S127.5
G1 F600
G1 X76.618 Y104.294 E.00305
M106 S76.5
M106 S127.5
G1 X76.51 Y104.217 E.00318
M106 S76.5
M106 S127.5
G3 X76.393 Y104.124 I.887 J-1.236 E.00363
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G3 X76.082 Y103.814 I2.39 J-2.707 E.01141
M106 S76.5
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G3 X75.979 Y103.686 I1.252 J-1.105 E.00397
M106 S76.5
M106 S127.5
G1 X75.907 Y103.582 E.00305
M106 S76.5
M106 S127.5
G1 F960
G1 X75.839 Y103.475 E.00306
M106 S76.5
M106 S127.5
G1 F1578.419
G1 X75.776 Y103.365 E.00304
M106 S76.5
M106 S127.5
G1 F2351.735
G1 X75.72 Y103.252 E.00305
M106 S76.5
M106 S127.5
G1 F2549.151
G1 X75.708 Y103.226 E.00069
G1 F5538.516
G1 X75.585 Y102.903 E.00833
G1 F8522.799
G1 X75.522 Y102.653 E.00623
G1 F12000
G1 X75.485 Y102.403 E.0061
G3 X75.472 Y102.147 I2.588 J-.259 E.00617
G1 X75.472 Y77.853 E.58586
G1 X75.484 Y77.597 E.00617
G1 F10687.151
G1 X75.522 Y77.347 E.00611
G1 F7367.897
G1 X75.583 Y77.101 E.0061
G1 F4665.734
G1 X75.681 Y76.835 E.00685
G1 F2363.653
G1 X75.72 Y76.748 E.00229
G1 F1766.385
G1 X75.776 Y76.635 E.00305
M106 S76.5
M106 S127.5
G1 F1106.201
G1 X75.839 Y76.525 E.00305
M106 S76.5
M106 S127.5
G1 F600
G1 X75.907 Y76.418 E.00306
M106 S76.5
M106 S127.5
G1 X75.979 Y76.314 E.00305
M106 S76.5
M106 S127.5
G3 X76.076 Y76.193 I1.28 J.918 E.00375
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G3 X76.391 Y75.877 I2.627 J2.311 E.01159
M106 S76.5
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G3 X76.519 Y75.776 I1.051 J1.195 E.00392
M106 S76.5
M106 S127.5
G1 X76.618 Y75.707 E.00292
M106 S76.5
M106 S127.5
G1 X76.725 Y75.639 E.00306
M106 S76.5
M106 S127.5
G1 F1104.921
G1 X76.835 Y75.576 E.00304
M106 S76.5
M106 S127.5
G1 F1764.377
G1 X76.948 Y75.52 E.00305
M106 S76.5
M106 S127.5
G1 F2362.171
G1 X77.035 Y75.481 E.0023
G1 F4666.489
G1 X77.302 Y75.383 E.00686
G1 F7366.624
G1 X77.547 Y75.322 E.0061
G1 F10683.005
G1 X77.797 Y75.284 E.0061
G1 F12000
G1 X78.053 Y75.272 E.00617
G1 X79.74 Y75.272 E.04069
G1 X80.14 Y75.272 E.00965
G1 F8907.263
G1 X80.54 Y75.272 E.00965
G1 F4444.287
G1 X80.94 Y75.272 E.00965
G1 F1517.311
G1 X80.94 Y75.481 E.00503
G1 F600
G1 X80.94 Y75.85 E.0089
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X80.94 Y77.19 E.03483
G1 X82.94 Y77.19 E.05198
G1 X82.94 Y78.56 E.03561
G1 X97.06 Y78.56 E.36699
G1 X97.06 Y75.85 E.07043
M106 S76.5
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P82 R2
G1 X97.06 Y75.481 E.0089
M106 S76.5
M106 S127.5
G1 F1518.822
G1 X97.06 Y75.272 E.00504
G1 F4446.874
G1 X97.46 Y75.272 E.00965
G1 F8910.925
G1 X97.86 Y75.273 E.00965
G1 F12000
G1 X98.26 Y75.273 E.00965
G1 X102.076 Y75.275 E.09203
G3 X102.964 Y75.48 I-.171 J2.758 E.02207
; WIPE_START
M204 S6000
G1 X103.052 Y75.52 E-.03672
G1 X103.165 Y75.576 E-.0481
G1 X103.275 Y75.639 E-.04805
G1 X103.382 Y75.707 E-.04817
G1 X103.486 Y75.779 E-.04801
G1 X103.608 Y75.877 E-.05961
G1 X103.778 Y76.047 E-.09134
; WIPE_END
G1 E-.02 F1800
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

G1 X96.647 Y95.719
G1 Z4.2
G1 E.4 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.425346
G1 F3000
M204 S6000
G1 X96.647 Y80.964 E.36075
G1 X96.256 Y80.964 E.00956
G1 X96.256 Y94.91 E.34097
G2 X95.865 Y94.577 I-2.532 J2.577 E.01257
G1 X95.865 Y80.964 E.33283
G1 X95.474 Y80.964 E.00956
G1 X95.474 Y94.331 E.32681
G2 X95.083 Y94.158 I-1.949 J3.881 E.01046
G1 X95.083 Y80.964 E.32258
G1 X94.692 Y80.964 E.00956
G1 X94.692 Y94.043 E.31978
G2 X94.301 Y93.978 I-.521 J1.918 E.00971
G1 X94.301 Y80.964 E.31818
G1 X93.91 Y80.964 E.00956
G1 X93.91 Y93.959 E.31773
G2 X93.519 Y93.993 I.284 J5.638 E.0096
G1 X93.519 Y80.964 E.31855
G1 X93.128 Y80.964 E.00956
G1 X93.128 Y94.075 E.32057
G2 X92.737 Y94.209 I.473 J2.021 E.01012
G1 X92.737 Y80.964 E.32384
G1 X92.346 Y80.964 E.00956
G1 X92.346 Y94.402 E.32856
G2 X91.955 Y94.677 I.898 J1.695 E.01171
G1 X91.955 Y80.964 E.33527
G1 X91.564 Y80.964 E.00956
G1 X91.564 Y95.049 E.34438
G2 X91.173 Y95.598 I2.658 J2.308 E.0165
G1 X91.173 Y80.964 E.35779
G1 X90.782 Y80.964 E.00956
G1 X90.782 Y102.324 E.52225
G1 X90.391 Y102.324 E.00956
G1 X90.391 Y80.964 E.52225
G1 X90 Y80.964 E.00956
G1 X90 Y102.324 E.52225
M73 P83 R2
G1 X89.609 Y102.324 E.00956
G1 X89.609 Y80.964 E.52225
G1 X89.218 Y80.964 E.00956
G1 X89.218 Y102.324 E.52225
G1 X88.827 Y102.324 E.00956
G1 X88.827 Y80.964 E.52225
G1 X88.436 Y80.964 E.00956
G1 X88.436 Y102.324 E.52225
G1 X88.045 Y102.324 E.00956
G1 X88.045 Y80.964 E.52225
G1 X87.654 Y80.964 E.00956
G1 X87.654 Y102.324 E.52225
G1 X87.263 Y102.324 E.00956
G1 X87.263 Y80.964 E.52225
G1 X86.872 Y80.964 E.00956
G1 X86.872 Y102.324 E.52225
G1 X86.481 Y102.324 E.00956
G1 X86.481 Y80.964 E.52225
G1 X86.09 Y80.964 E.00956
G1 X86.09 Y102.324 E.52225
G1 X85.699 Y102.324 E.00956
G1 X85.699 Y80.964 E.52225
M73 P83 R1
G1 X85.308 Y80.964 E.00956
G1 X85.308 Y102.324 E.52225
G1 X84.917 Y102.324 E.00956
G1 X84.917 Y80.964 E.52225
G1 X84.526 Y80.964 E.00956
G1 X84.526 Y102.324 E.52225
G1 X84.135 Y102.324 E.00956
G1 X84.135 Y80.964 E.52225
G1 X83.744 Y80.964 E.00956
G1 X83.744 Y102.324 E.52225
G1 X83.353 Y102.324 E.00956
G1 X83.353 Y80.964 E.52225
M73 P84 R1
G1 X82.962 Y80.964 E.00956
G1 X82.962 Y102.324 E.52225
G1 X82.571 Y102.324 E.00956
G1 X82.571 Y80.964 E.52225
G1 X82.18 Y80.964 E.00956
G1 X82.18 Y102.324 E.52225
G1 X81.789 Y102.324 E.00956
G1 X81.789 Y80.964 E.52225
G1 X81.398 Y80.964 E.00956
G1 X81.398 Y102.324 E.52225
G1 X81.007 Y102.324 E.00956
G1 X81.007 Y80.964 E.52225
G1 X80.616 Y80.964 E.00956
G1 X80.616 Y102.324 E.52225
G1 X80.225 Y102.324 E.00956
G1 X80.225 Y79.594 E.55575
G1 X79.834 Y79.594 E.00956
G1 X79.834 Y102.324 E.55575
G1 X79.443 Y102.324 E.00956
G1 X79.443 Y79.594 E.55575
G1 X79.052 Y79.594 E.00956
G1 X79.052 Y102.324 E.55575
G1 X78.661 Y102.324 E.00956
G1 X78.661 Y79.594 E.55575
G1 X78.536 Y79.594 E.00305
G1 X78.536 Y77.678 E.04683
G1 X78.27 Y77.68 E.00651
G1 X78.27 Y102.324 E.60254
G3 X77.92 Y102.26 I-.087 J-.509 E.00887
G1 X77.901 Y102.235 E.00078
G3 X77.879 Y102.116 I.189 J-.096 E.003
G1 X77.879 Y77.555 E.60049
M106 S76.5
M106 S127.5
; WIPE_START
G1 X77.879 Y78.555 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I-1.01 J.678 P1  F42000
M73 P85 R1
G1 X91.173 Y98.363 Z4.6
G1 Z4.2
G1 E.4 F1800
G1 F3000
M204 S6000
G1 X91.173 Y102.324 E.09686
G1 X91.564 Y102.324 E.00956
G1 X91.564 Y99.301 E.07392
G2 X91.955 Y99.678 I2.077 J-1.762 E.01331
G1 X91.955 Y102.324 E.0647
G1 X92.346 Y102.324 E.00956
G1 X92.346 Y99.945 E.05817
G2 X92.737 Y100.142 I1.182 J-1.862 E.01072
G1 X92.737 Y102.324 E.05337
G1 X93.128 Y102.324 E.00956
G1 X93.128 Y100.278 E.05004
G2 X93.519 Y100.356 I.588 J-1.913 E.00977
G1 X93.519 Y102.324 E.04812
G1 X93.91 Y102.324 E.00956
G1 X93.91 Y100.387 E.04735
G2 X94.301 Y100.373 I.121 J-1.961 E.00958
G1 X94.301 Y102.324 E.04772
G1 X94.692 Y102.324 E.00956
G1 X94.692 Y100.311 E.04922
G2 X95.083 Y100.192 I-.399 J-2.006 E.01001
G1 X95.083 Y102.324 E.05214
G1 X95.474 Y102.324 E.00956
G1 X95.474 Y100.017 E.05641
G2 X95.865 Y99.777 I-2.101 J-3.865 E.01122
G1 X95.865 Y102.324 E.06227
G1 X96.256 Y102.324 E.00956
G1 X96.256 Y99.438 E.07056
G2 X96.647 Y98.964 I-2.918 J-2.807 E.01503
G1 X96.647 Y102.324 E.08215
G1 X97.038 Y102.324 E.00956
G1 X97.038 Y80.964 E.52225
G1 X97.429 Y80.964 E.00956
G1 X97.429 Y102.324 E.52225
G1 X97.82 Y102.324 E.00956
G1 X97.82 Y80.964 E.52225
G1 X98.211 Y80.964 E.00956
G1 X98.211 Y102.324 E.52225
G1 X98.602 Y102.324 E.00956
G1 X98.602 Y80.964 E.52225
G1 X98.993 Y80.964 E.00956
G1 X98.993 Y102.324 E.52225
G1 X99.384 Y102.324 E.00956
G1 X99.384 Y80.964 E.52225
G1 X99.464 Y80.964 E.00194
G1 X99.464 Y77.676 E.08038
G1 X99.775 Y77.676 E.00762
G1 X99.775 Y102.324 E.60263
G1 X100.166 Y102.324 E.00956
G1 X100.166 Y77.676 E.60263
G1 X100.557 Y77.676 E.00956
G1 X100.557 Y102.324 E.60262
G1 X100.949 Y102.324 E.00956
G1 X100.949 Y77.677 E.60262
G1 X101.34 Y77.677 E.00956
G1 X101.34 Y102.324 E.60262
G1 X101.731 Y102.324 E.00956
G1 X101.731 Y77.677 E.60261
G1 X101.933 Y77.677 E.00495
G3 X102.122 Y77.889 I-.002 J.192 E.00779
M73 P86 R1
G1 X102.122 Y102.448 E.60046
M106 S76.5
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
M106 S127.5
G1 X102.122 Y101.448 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 27/30
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I.253 J-1.19 P1  F42000
G1 X92.044 Y99.302 Z4.6
G1 Z4.36
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G1 X91.969 Y99.232 E.00267
G3 X93.617 Y94.321 I2.006 J-2.059 E.16768
G1 X93.903 Y94.3 E.00746
G3 X92.184 Y99.421 I.071 J2.873 E.28681
G1 X92.09 Y99.341 E.00321
M204 S10000
G1 X92.319 Y98.991 F42000
G1 F11728.231
M204 S6000
G1 X92.259 Y98.934 E.00214
G3 X93.669 Y94.734 I1.716 J-1.761 E.14341
G1 X93.914 Y94.716 E.00638
G3 X92.443 Y99.096 I.061 J2.458 E.24531
G1 X92.365 Y99.03 E.00267
M204 S10000
G1 X92.469 Y98.544 F42000
G1 F11728.231
M204 S6000
G1 X92.288 Y98.325 E.00739
G3 X93.721 Y95.147 I1.687 J-1.151 E.10855
G1 X93.924 Y95.132 E.0053
G3 X92.55 Y98.637 I.051 J2.042 E.2091
G1 X92.508 Y98.589 E.00163
M204 S10000
G1 X92.902 Y98.391 F42000
G1 F11728.231
M204 S6000
G1 X92.84 Y98.339 E.00211
G3 X93.772 Y95.56 I1.135 J-1.165 E.09489
G1 X93.934 Y95.548 E.00422
G3 X93.093 Y98.541 I.04 J1.626 E.15809
G1 X92.95 Y98.428 E.00474
M204 S10000
G1 X93.16 Y98.067 F42000
G1 F11728.231
M204 S6000
G1 X93.13 Y98.041 E.00104
G3 X93.824 Y95.973 I.845 J-.867 E.07062
G1 X93.945 Y95.964 E.00314
G3 X93.318 Y98.191 I.03 J1.21 E.11767
G1 X93.208 Y98.104 E.00366
M204 S250
G1 X93.41 Y97.755 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X93.874 Y96.371 I.565 J-.58 E.04383
G1 X93.955 Y96.365 E.00195
G3 X93.454 Y97.795 I.02 J.809 E.07546
; WIPE_START
M204 S6000
G1 X93.306 Y97.631 E-.08403
G1 X93.228 Y97.49 E-.06126
G1 X93.169 Y97.256 E-.09185
G1 X93.169 Y97.094 E-.06125
G1 X93.201 Y96.936 E-.0614
G1 X93.224 Y96.888 E-.02021
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.76 I1.106 J.509 P1  F42000
G1 X102.144 Y77.501 Z4.76
G1 Z4.36
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G1 X102.176 Y77.516 E.00092
G3 X102.354 Y77.879 I-.234 J.341 E.011
G1 X102.354 Y102.12 E.63005
G3 X101.921 Y102.554 I-.413 J.02 E.01795
G1 X78.046 Y102.553 E.62053
G3 X77.646 Y102.121 I.006 J-.407 E.01713
G1 X77.646 Y77.879 E.63006
G1 X77.664 Y77.733 E.00384
G1 X77.739 Y77.594 E.0041
G3 X78.08 Y77.446 I.328 J.289 E.00998
G1 X78.884 Y77.446 E.0209
G1 X78.884 Y79.253 E.04698
G1 X97.416 Y79.253 E.48168
G1 X97.416 Y77.446 E.04698
G1 X101.921 Y77.446 E.11708
G1 X102.048 Y77.458 E.00331
G1 X102.089 Y77.477 E.00118
M204 S10000
G1 X102.263 Y77.095 F42000
G1 F11728.231
M204 S6000
G3 X102.77 Y77.874 I-.321 J.763 E.02565
G1 X102.77 Y102.126 E.63034
G3 X101.926 Y102.97 I-.823 J.021 E.0347
G1 X78.074 Y102.97 E.61994
G3 X77.23 Y102.126 I-.02 J-.824 E.03468
G1 X77.23 Y77.874 E.63034
G3 X78.074 Y77.03 I.823 J-.021 E.0347
G1 X79.299 Y77.03 E.03185
G1 X79.299 Y78.838 E.04698
G1 X96.6 Y78.838 E.44967
G1 X97 Y78.838 E.0104
G1 F10329.816
G1 X97 Y78.532 E.00793
G1 F6480
G1 X97.001 Y77.03 E.03905
G1 F6841.735
G1 X97.033 Y77.03 E.00083
G1 F11728.231
G1 X97.433 Y77.03 E.0104
G1 X101.926 Y77.03 E.1168
G3 X102.207 Y77.073 I.016 J.828 E.00741
M204 S10000
G1 X102.422 Y76.711 F42000
G1 F11728.231
M204 S6000
G3 X103.186 Y77.869 I-.481 J1.148 E.03823
G1 X103.186 Y102.131 E.63061
G3 X101.931 Y103.386 I-1.238 J.016 E.05139
G1 X78.069 Y103.386 E.62022
G3 X76.814 Y102.131 I-.014 J-1.24 E.05136
G1 X76.814 Y77.869 E.63062
G3 X78.069 Y76.615 I1.238 J-.016 E.05139
G1 X79.715 Y76.614 E.04279
G1 X79.715 Y78.422 E.04698
G1 X81.768 Y78.422 E.05335
G1 X82.168 Y78.422 E.0104
G1 F9295.549
G1 X82.568 Y78.422 E.0104
G1 F4719.775
G1 X82.968 Y78.422 E.0104
G1 F1680
G1 X96.185 Y78.422 E.34353
M106 S114.75
M106 S127.5
G1 X96.585 Y78.422 E.0104
M106 S114.75
M106 S127.5
G1 F600
G1 X96.585 Y78.15 E.00707
M106 S114.75
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G1 X96.585 Y76.614 E.03991
G1 X96.65 Y76.614 E.00169
M106 S114.75
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X97.033 Y76.614 E.00994
M106 S114.75
M106 S127.5
G1 F2725.645
G1 X97.433 Y76.614 E.0104
G1 F6387.29
G1 X97.832 Y76.614 E.0104
G1 F11584.935
G1 X98.232 Y76.614 E.0104
G1 F11728.231
G1 X98.632 Y76.614 E.0104
G1 X101.931 Y76.615 E.08574
G3 X102.366 Y76.689 I.01 J1.244 E.01152
M204 S10000
G1 X102.581 Y76.328 F42000
G1 F11728.231
M204 S6000
G3 X103.601 Y77.863 I-.641 J1.533 E.0508
G1 X103.601 Y102.137 E.63089
G3 X101.937 Y103.801 I-1.653 J.011 E.06809
G1 X78.063 Y103.801 E.62049
G3 X76.399 Y102.137 I-.008 J-1.657 E.06805
G1 X76.399 Y77.863 E.63089
G3 X78.063 Y76.199 I1.653 J-.011 E.06809
G1 X80.131 Y76.198 E.05373
G1 X80.131 Y78.006 E.04699
G1 X81.368 Y78.006 E.03215
G1 X81.768 Y78.006 E.0104
G1 F11584.935
G1 X82.168 Y78.006 E.0104
G1 F6387.29
G1 X82.568 Y78.006 E.0104
G1 F2725.645
G1 X82.968 Y78.006 E.0104
G1 F600
G1 X83.35 Y78.006 E.00994
M106 S114.75
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G1 X96.169 Y78.006 E.33318
G1 X96.169 Y76.199 E.04698
G1 X96.65 Y76.199 E.0125
M106 S114.75
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X97.033 Y76.199 E.00994
M106 S114.75
M106 S127.5
G1 F2725.645
G1 X97.433 Y76.199 E.0104
G1 F6387.29
G1 X97.832 Y76.199 E.0104
G1 F11584.935
G1 X98.232 Y76.199 E.0104
G1 F11728.231
G1 X98.632 Y76.199 E.0104
G1 X101.937 Y76.199 E.08588
G3 X102.525 Y76.305 I.003 J1.661 E.01563
M204 S10000
G1 X102.778 Y75.961 F42000
G1 F11728.231
M204 S6000
G1 X103.096 Y76.135 E.00942
G3 X104.017 Y77.858 I-1.158 J1.727 E.05286
G1 X104.017 Y102.142 E.63116
G3 X101.942 Y104.217 I-2.069 J.006 E.08478
G1 X78.058 Y104.217 E.62076
G3 X75.983 Y102.142 I-.002 J-2.073 E.08473
G1 X75.983 Y77.858 E.63116
G3 X78.058 Y75.783 I2.069 J-.006 E.08478
G1 X80.546 Y75.783 E.06466
M73 P87 R1
G1 X80.546 Y77.591 E.04699
G1 X81.368 Y77.591 E.02134
G1 X81.768 Y77.591 E.0104
G1 F11584.935
G1 X82.168 Y77.591 E.0104
G1 F6387.29
G1 X82.568 Y77.591 E.0104
G1 F2725.645
G1 X82.968 Y77.591 E.0104
G1 F600
G1 X83.35 Y77.591 E.00994
M106 S114.75
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G1 X95.754 Y77.591 E.32238
G1 X95.754 Y75.783 E.04698
G1 X96.65 Y75.783 E.0233
M106 S114.75
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X97.033 Y75.783 E.00994
M106 S114.75
M106 S127.5
G1 F2725.645
G1 X97.433 Y75.783 E.0104
G1 F6387.29
G1 X97.832 Y75.783 E.0104
G1 F11584.935
G1 X98.232 Y75.783 E.0104
G1 F11728.231
G1 X98.632 Y75.783 E.0104
G1 X101.942 Y75.783 E.08601
G3 X102.723 Y75.937 I-.004 J2.079 E.02082
M204 S250
G1 X102.966 Y75.609 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X103.318 Y75.803 E.00969
G3 X104.417 Y77.853 I-1.381 J2.061 E.05839
G1 X104.417 Y102.147 E.58586
G3 X101.947 Y104.617 I-2.469 J.001 E.09359
G1 X78.053 Y104.617 E.57621
G3 X75.583 Y102.147 I.004 J-2.475 E.09353
G1 X75.583 Y77.853 E.58586
G3 X78.053 Y75.383 I2.469 J-.001 E.09359
G1 X80.947 Y75.382 E.06979
G1 X80.947 Y77.19 E.0436
G1 X81.381 Y77.19 E.01047
G1 X81.781 Y77.19 E.00965
G1 F11584.935
G1 X82.181 Y77.19 E.00965
G1 F6387.29
G1 X82.581 Y77.19 E.00965
G1 F2725.645
G1 X82.981 Y77.19 E.00965
G1 F600
G1 X83.35 Y77.19 E.0089
M106 S114.75
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X95.353 Y77.19 E.31197
G1 X95.353 Y75.382 E.04698
G1 X96.65 Y75.382 E.03371
M106 S114.75
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X97.019 Y75.382 E.0089
M106 S114.75
G1 F2725.645
G1 X97.419 Y75.382 E.00965
G1 F6387.29
G1 X97.819 Y75.382 E.00965
G1 F11584.935
G1 X98.219 Y75.382 E.00965
G1 F12000
G1 X98.619 Y75.382 E.00965
G1 X101.947 Y75.383 E.08026
G3 X102.893 Y75.574 I-.01 J2.481 E.02342
G1 X102.912 Y75.583 E.00051
; WIPE_START
M204 S6000
G1 X103.318 Y75.803 E-.17541
G1 X103.696 Y76.107 E-.18435
G1 X103.73 Y76.148 E-.02024
; WIPE_END
G1 E-.02 F1800
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

G1 X102.187 Y78.555
G1 Z4.36
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422956
G1 F12544.389
M204 S6000
G1 X101.42 Y77.787 E.02638
G1 X100.87 Y77.787 E.01336
G1 X102.014 Y78.931 E.03931
G1 X102.014 Y79.481 E.01336
G1 X100.32 Y77.787 E.0582
G1 X99.77 Y77.787 E.01336
G1 X102.014 Y80.03 E.07709
G1 X102.014 Y80.58 E.01336
G1 X99.221 Y77.787 E.09599
G1 X98.671 Y77.787 E.01336
G1 X102.014 Y81.129 E.11488
G1 X102.014 Y81.679 E.01336
G1 X98.121 Y77.786 E.13377
G1 X97.757 Y77.786 E.00885
G1 X97.757 Y77.972 E.0045
G1 X102.014 Y82.229 E.14629
G1 X102.014 Y82.778 E.01336
G1 X97.757 Y78.521 E.14629
G1 X97.757 Y79.071 E.01335
G1 X102.014 Y83.328 E.14629
G1 X102.014 Y83.877 E.01336
G1 X97.73 Y79.594 E.14721
G1 X97.18 Y79.594 E.01336
G1 X102.014 Y84.427 E.1661
G1 X102.014 Y84.977 E.01336
G1 X96.631 Y79.594 E.18498
G1 X96.081 Y79.594 E.01336
G1 X102.014 Y85.526 E.20387
G1 X102.014 Y86.076 E.01336
G1 X95.532 Y79.594 E.22276
G1 X94.982 Y79.594 E.01336
G1 X102.014 Y86.625 E.24164
G1 X102.014 Y87.175 E.01336
G1 X94.433 Y79.594 E.26053
G1 X93.883 Y79.594 E.01336
G1 X102.014 Y87.725 E.27942
G1 X102.014 Y88.274 E.01336
G1 X93.333 Y79.594 E.2983
G1 X92.784 Y79.594 E.01336
G1 X102.014 Y88.824 E.31719
G1 X102.014 Y89.373 E.01336
G1 X92.234 Y79.594 E.33608
G1 X91.685 Y79.594 E.01336
G1 X102.014 Y89.923 E.35497
G1 X102.014 Y90.473 E.01335
G1 X91.135 Y79.594 E.37385
G1 X90.585 Y79.594 E.01336
G1 X102.014 Y91.022 E.39274
G1 X102.014 Y91.572 E.01336
G1 X90.036 Y79.594 E.41163
G1 X89.486 Y79.594 E.01336
G1 X102.014 Y92.121 E.43051
G1 X102.014 Y92.671 E.01336
G1 X88.937 Y79.594 E.4494
G1 X88.387 Y79.594 E.01336
G1 X102.014 Y93.22 E.46829
G1 X102.014 Y93.77 E.01336
G1 X87.837 Y79.594 E.48717
G1 X87.288 Y79.594 E.01336
G1 X102.014 Y94.32 E.50606
G1 X102.014 Y94.869 E.01336
G1 X86.738 Y79.594 E.52495
G1 X86.189 Y79.594 E.01336
G1 X102.014 Y95.419 E.54383
M73 P88 R1
G1 X102.014 Y95.968 E.01336
G1 X85.639 Y79.594 E.56272
G1 X85.089 Y79.594 E.01336
G1 X102.014 Y96.518 E.58161
G1 X102.014 Y97.068 E.01336
G1 X84.54 Y79.594 E.6005
G1 X83.99 Y79.594 E.01336
G1 X102.014 Y97.617 E.61938
G1 X102.014 Y98.167 E.01336
G1 X83.441 Y79.594 E.63827
G1 X82.891 Y79.594 E.01336
G1 X102.014 Y98.716 E.65716
G1 X102.014 Y99.266 E.01336
G1 X82.341 Y79.594 E.67604
G1 X81.792 Y79.594 E.01336
G1 X102.014 Y99.816 E.69493
G1 X102.014 Y100.365 E.01336
G1 X81.242 Y79.594 E.71382
G1 X80.693 Y79.594 E.01336
G1 X95.385 Y94.286 E.50491
G2 X94.563 Y94.013 I-1.489 J3.112 E.02111
G1 X80.143 Y79.594 E.49554
G1 X79.594 Y79.594 E.01336
G1 X93.96 Y93.961 E.49372
G2 X93.454 Y94.004 I.049 J3.526 E.01235
G1 X79.044 Y79.594 E.49522
G1 X78.543 Y79.594 E.01217
G1 X78.543 Y79.093 E.01217
G1 X77.986 Y78.536 E.01913
G1 X77.986 Y77.987 E.01336
G1 X78.543 Y78.543 E.01913
G1 X78.543 Y77.994 E.01336
G1 X78.163 Y77.614 E.01307
; WIPE_START
G1 X78.543 Y77.994 E-.20436
G1 X78.543 Y78.456 E-.17564
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.76 I-.645 J-1.032 P1  F42000
G1 X77.813 Y78.912 Z4.76
G1 Z4.36
G1 E.4 F1800
G1 F12544.389
M204 S6000
G1 X93.009 Y94.109 E.52224
G2 X92.613 Y94.262 I1.374 J4.132 E.01033
G1 X77.986 Y79.635 E.50266
G1 X77.986 Y80.185 E.01336
G1 X92.259 Y94.458 E.4905
G2 X91.94 Y94.688 I.988 J1.708 E.00958
G1 X77.986 Y80.735 E.47952
G1 X77.986 Y81.284 E.01336
G1 X91.653 Y94.951 E.46967
G2 X91.402 Y95.249 I1.062 J1.149 E.0095
G1 X77.986 Y81.834 E.46104
G1 X77.986 Y82.383 E.01336
G1 X91.184 Y95.581 E.45353
G2 X91.002 Y95.949 I4.289 J2.347 E.00997
G1 X77.986 Y82.933 E.44729
G1 X77.986 Y83.483 E.01336
G1 X90.866 Y96.362 E.44262
G2 X90.778 Y96.824 I2.25 J.667 E.01144
G1 X77.986 Y84.032 E.43961
G1 X77.986 Y84.582 E.01336
G1 X90.767 Y97.363 E.43922
G2 X90.874 Y98.019 I3.256 J-.194 E.0162
G1 X77.986 Y85.131 E.4429
G1 X77.986 Y85.681 E.01336
G1 X94.519 Y102.214 E.56816
G1 X95.069 Y102.214 E.01336
G1 X93.134 Y100.279 E.0665
G2 X93.789 Y100.384 I.915 J-3.589 E.01615
G1 X95.618 Y102.214 E.06286
G1 X96.168 Y102.214 E.01336
G1 X94.325 Y100.371 E.06333
G2 X94.788 Y100.284 I-.465 J-3.76 E.01145
G1 X96.717 Y102.214 E.06631
G1 X97.267 Y102.214 E.01336
G1 X95.2 Y100.146 E.07105
G2 X95.571 Y99.968 I-.707 J-1.946 E.01002
G1 X97.817 Y102.214 E.07718
G1 X98.366 Y102.214 E.01336
G1 X95.901 Y99.749 E.08471
G2 X96.198 Y99.496 I-1.169 J-1.669 E.00949
G1 X98.916 Y102.214 E.09341
G1 X99.465 Y102.214 E.01336
G1 X96.461 Y99.209 E.10326
G2 X96.692 Y98.891 I-1.067 J-1.019 E.00959
G1 X100.015 Y102.214 E.11419
G1 X100.565 Y102.214 E.01336
G1 X96.886 Y98.535 E.12641
G2 X97.042 Y98.142 I-1.884 J-.975 E.0103
G1 X101.114 Y102.214 E.13993
G1 X101.664 Y102.214 E.01336
G1 X97.146 Y97.696 E.15526
G2 X97.191 Y97.192 I-2.483 J-.478 E.01232
G1 X102.014 Y102.014 E.16572
G1 X102.014 Y101.464 E.01336
G1 X97.136 Y96.586 E.16763
G2 X96.861 Y95.762 I-2.682 J.436 E.02121
G1 X102.187 Y101.088 E.18305
; WIPE_START
G1 X101.48 Y100.381 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.76 I-.321 J-1.174 P1  F42000
G1 X94.143 Y102.387 Z4.76
G1 Z4.36
G1 E.4 F1800
G1 F12544.389
M204 S6000
G1 X77.986 Y86.23 E.55523
G1 X77.986 Y86.78 E.01336
G1 X93.42 Y102.214 E.53038
G1 X92.87 Y102.214 E.01336
G1 X77.986 Y87.33 E.51149
G1 X77.986 Y87.879 E.01336
G1 X92.321 Y102.214 E.49261
G1 X91.771 Y102.214 E.01336
G1 X77.986 Y88.429 E.47372
G1 X77.986 Y88.978 E.01336
G1 X91.222 Y102.214 E.45483
G1 X90.672 Y102.214 E.01336
G1 X77.986 Y89.528 E.43595
G1 X77.986 Y90.078 E.01336
G1 X90.122 Y102.214 E.41706
G1 X89.573 Y102.214 E.01335
G1 X77.986 Y90.627 E.39817
G1 X77.986 Y91.177 E.01336
G1 X89.023 Y102.214 E.37929
G1 X88.474 Y102.214 E.01336
G1 X77.986 Y91.726 E.3604
G1 X77.986 Y92.276 E.01336
G1 X87.924 Y102.214 E.34151
G1 X87.374 Y102.214 E.01336
G1 X77.986 Y92.826 E.32263
G1 X77.986 Y93.375 E.01336
M73 P89 R1
G1 X86.825 Y102.214 E.30374
G1 X86.275 Y102.214 E.01336
G1 X77.986 Y93.925 E.28485
G1 X77.986 Y94.474 E.01336
G1 X85.726 Y102.214 E.26596
G1 X85.176 Y102.214 E.01336
G1 X77.986 Y95.024 E.24708
G1 X77.986 Y95.574 E.01336
G1 X84.626 Y102.214 E.22819
G1 X84.077 Y102.214 E.01336
G1 X77.986 Y96.123 E.2093
G1 X77.986 Y96.673 E.01336
G1 X83.527 Y102.214 E.19042
G1 X82.978 Y102.214 E.01336
G1 X77.986 Y97.222 E.17153
G1 X77.986 Y97.772 E.01336
G1 X82.428 Y102.214 E.15264
G1 X81.879 Y102.214 E.01336
G1 X77.986 Y98.322 E.13376
G1 X77.986 Y98.871 E.01336
G1 X81.329 Y102.214 E.11487
G1 X80.779 Y102.214 E.01336
G1 X77.986 Y99.421 E.09598
G1 X77.986 Y99.97 E.01336
G1 X80.23 Y102.214 E.07709
G1 X79.68 Y102.214 E.01336
G1 X77.986 Y100.52 E.05821
G1 X77.986 Y101.069 E.01336
G1 X79.131 Y102.214 E.03932
G1 X78.581 Y102.214 E.01336
G1 X77.813 Y101.446 E.0264
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12544.389
G1 X78.52 Y102.153 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 28/30
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
M106 S124.95
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I.335 J1.17 P1  F42000
G1 X91.405 Y98.458 Z4.76
G1 Z4.52
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10617
M204 S6000
G1 X91.327 Y98.291 E.00479
G3 X93.617 Y94.321 I2.648 J-1.118 E.13786
G1 X93.903 Y94.3 E.00744
G3 X91.451 Y98.549 I.072 J2.873 E.31664
G1 X91.432 Y98.511 E.00111
M204 S10000
G1 X91.779 Y98.278 F42000
G1 F10617
M204 S6000
G1 X91.71 Y98.129 E.00425
G3 X93.669 Y94.734 I2.265 J-.956 E.11791
G1 X93.913 Y94.716 E.00637
G3 X91.817 Y98.35 I.062 J2.458 E.27082
G1 X91.807 Y98.331 E.00057
M204 S10000
G1 X92.132 Y98.039 F42000
G1 F10617
M204 S6000
G1 X92.024 Y97.777 E.00738
G3 X93.721 Y95.147 I1.951 J-.603 E.09267
G1 X93.924 Y95.132 E.00529
G3 X92.182 Y98.152 I.051 J2.042 E.225
G1 X92.157 Y98.094 E.00163
M204 S10000
G1 X92.514 Y97.878 F42000
G1 F10617
M204 S6000
G1 X92.421 Y97.654 E.00631
G3 X93.772 Y95.56 I1.554 J-.48 E.0738
G1 X93.934 Y95.548 E.00421
G3 X92.547 Y97.953 I.041 J1.626 E.17918
G1 X92.538 Y97.933 E.00056
M204 S10000
G1 X92.896 Y97.717 F42000
G1 F10617
M204 S6000
G1 X92.818 Y97.532 E.00523
G3 X93.824 Y95.973 I1.157 J-.357 E.05493
G1 X93.945 Y95.964 E.00314
G3 X92.922 Y97.771 I.03 J1.21 E.13284
M204 S250
G1 X93.264 Y97.562 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10617
M204 S5000
G3 X93.874 Y96.371 I.711 J-.388 E.03798
G1 X93.955 Y96.365 E.00195
G3 X93.295 Y97.614 I.02 J.809 E.08131
; WIPE_START
G1 F12000
M204 S6000
G1 X93.201 Y97.414 E-.08393
G1 X93.169 Y97.256 E-.06131
G1 X93.169 Y97.094 E-.06131
G1 X93.201 Y96.936 E-.06135
G1 X93.294 Y96.736 E-.08398
G1 X93.339 Y96.677 E-.02812
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.92 I1.106 J.507 P1  F42000
G1 X102.076 Y77.626 Z4.92
G1 Z4.52
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10617
M204 S6000
G3 X102.208 Y77.879 I-.129 J.229 E.00784
G1 X102.208 Y102.121 E.63006
G1 X102.183 Y102.26 E.00368
G1 X102.103 Y102.357 E.00325
G3 X101.92 Y102.408 I-.164 J-.233 E.00503
G1 X78.08 Y102.408 E.61964
G3 X77.792 Y102.121 I-.025 J-.263 E.01207
G1 X77.792 Y77.879 E.63006
G3 X78.079 Y77.592 I.263 J-.024 E.01203
G1 X78.911 Y77.592 E.02163
G1 X78.911 Y79.253 E.04318
G1 X97.389 Y79.253 E.48024
G1 X97.389 Y77.592 E.04318
G1 X101.921 Y77.592 E.1178
G1 X101.988 Y77.595 E.00173
G3 X102.02 Y77.603 I-.041 J.26 E.00087
M204 S10000
G1 X102.243 Y77.253 F42000
G1 F10617
M204 S6000
G1 X102.324 Y77.291 E.00231
G3 X102.624 Y77.874 I-.376 J.562 E.01779
G1 X102.624 Y102.126 E.63034
G1 X102.603 Y102.313 E.00489
G1 X102.544 Y102.467 E.00429
G1 X102.426 Y102.626 E.00513
G1 X102.281 Y102.736 E.00473
G3 X101.926 Y102.824 I-.338 J-.603 E.00963
G1 X77.967 Y102.818 E.62271
G3 X77.376 Y102.126 I.086 J-.672 E.02593
G1 X77.382 Y77.767 E.63311
G3 X78.074 Y77.176 I.67 J.084 E.02594
G1 X79.327 Y77.176 E.03257
G1 X79.327 Y78.838 E.04318
G1 X96.973 Y78.838 E.45864
G1 X96.973 Y77.176 E.04318
G1 X101.926 Y77.176 E.12874
G1 X102.13 Y77.202 E.00533
G1 X102.188 Y77.228 E.00167
M204 S10000
G1 X102.346 Y76.836 F42000
G1 F10617
M204 S6000
G3 X103.039 Y77.868 I-.398 J1.017 E.03441
G1 X103.039 Y102.131 E.63062
G3 X101.931 Y103.239 I-1.092 J.016 E.04543
G1 X78.069 Y103.239 E.62021
G3 X76.961 Y102.131 I-.016 J-1.092 E.04543
G1 X76.961 Y77.869 E.63061
G3 X78.069 Y76.761 I1.094 J-.014 E.04539
G1 X79.742 Y76.76 E.04351
G1 X79.743 Y78.422 E.04318
G1 X96.557 Y78.422 E.43703
G1 X96.558 Y76.76 E.04319
G1 X101.932 Y76.761 E.13967
G3 X102.289 Y76.815 I.016 J1.092 E.00945
M204 S10000
G1 X102.538 Y76.47 F42000
G1 F10617
M204 S6000
G1 X102.786 Y76.599 E.00728
G3 X103.455 Y77.863 I-.838 J1.253 E.03872
G1 X103.455 Y102.137 E.63089
G3 X101.937 Y103.655 I-1.507 J.011 E.06212
G1 X78.063 Y103.655 E.62049
G3 X76.545 Y102.137 I-.011 J-1.507 E.06212
G1 X76.545 Y77.863 E.63089
G3 X78.063 Y76.345 I1.51 J-.008 E.06208
G1 X80.158 Y76.345 E.05444
G1 X80.158 Y78.006 E.04319
G1 X96.142 Y78.006 E.41543
G1 X96.142 Y76.345 E.04319
G1 X101.937 Y76.345 E.15061
G3 X102.484 Y76.444 I.011 J1.507 E.01454
M204 S10000
G1 X102.727 Y76.103 F42000
G1 F10617
M204 S6000
G1 X103.017 Y76.254 E.00849
G3 X103.871 Y77.858 I-1.069 J1.598 E.0492
G1 X103.871 Y102.142 E.63117
G3 X101.942 Y104.071 I-1.923 J.006 E.07881
G1 X78.058 Y104.071 E.62077
G3 X76.129 Y102.142 I-.006 J-1.923 E.07881
G1 X76.129 Y77.858 E.63116
G3 X78.058 Y75.929 I1.927 J-.002 E.07877
G1 X80.574 Y75.929 E.06538
G1 X80.574 Y77.591 E.04319
G1 X95.726 Y77.591 E.39383
G1 X95.726 Y75.929 E.04319
G1 X101.942 Y75.929 E.16155
G3 X102.646 Y76.06 I.006 J1.923 E.01871
G1 X102.674 Y76.075 E.00083
M204 S250
G1 X102.931 Y75.751 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10617
M204 S5000
G1 X103.044 Y75.803 E.003
G3 X104.271 Y77.853 I-1.096 J2.048 E.06051
G1 X104.271 Y102.147 E.58586
G3 X101.947 Y104.471 I-2.323 J.001 E.08805
G1 X78.053 Y104.471 E.57621
G3 X75.729 Y102.147 I-.001 J-2.323 E.08805
G1 X75.729 Y77.853 E.58586
G3 X78.053 Y75.529 I2.328 J.004 E.088
G1 X80.974 Y75.528 E.07045
G1 X80.974 Y77.19 E.04007
G1 X95.326 Y77.19 E.34608
G1 X95.326 Y75.528 E.04007
G1 X101.947 Y75.529 E.15968
G3 X102.79 Y75.687 I.001 J2.323 E.02081
G1 X102.876 Y75.726 E.00229
; WIPE_START
G1 F12000
M204 S6000
G1 X103.044 Y75.803 E-.07013
G1 X103.24 Y75.92 E-.08655
G1 X103.591 Y76.209 E-.17289
G1 X103.676 Y76.311 E-.05043
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
M73 P90 R1
G3 Z4.92 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X98.094 Y77.759
G1 Z4.52
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424336
G1 F10617
M204 S6000
G1 X97.729 Y78.123 E.01257
G1 X97.729 Y78.675 E.01345
G1 X98.472 Y77.932 E.02561
G1 X99.023 Y77.932 E.01345
G1 X97.556 Y79.4 E.05062
; WIPE_START
G1 F12500
G1 X98.263 Y78.693 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.92 I.006 J-1.217 P1  F42000
G1 X77.959 Y78.59 Z4.92
G1 Z4.52
G1 E.4 F1800
G1 F10617
M204 S6000
G1 X78.571 Y77.978 E.0211
G1 X78.571 Y78.53 E.01345
G1 X78.132 Y78.968 E.01512
G1 X78.132 Y79.519 E.01345
G1 X78.571 Y79.081 E.01512
G1 X78.571 Y79.594 E.0125
G1 X78.61 Y79.594 E.00094
G1 X78.132 Y80.071 E.01645
G1 X78.132 Y80.622 E.01345
G1 X79.161 Y79.594 E.03548
G1 X79.713 Y79.594 E.01345
G1 X78.132 Y81.174 E.0545
G1 X78.132 Y81.726 E.01345
G1 X80.264 Y79.594 E.07352
G1 X80.816 Y79.594 E.01345
G1 X78.132 Y82.277 E.09254
G1 X78.132 Y82.829 E.01345
G1 X81.367 Y79.594 E.11156
G1 X81.919 Y79.594 E.01345
G1 X78.132 Y83.38 E.13058
G1 X78.132 Y83.932 E.01345
G1 X82.47 Y79.594 E.1496
G1 X83.022 Y79.594 E.01345
G1 X78.132 Y84.483 E.16863
G1 X78.132 Y85.035 E.01345
G1 X83.574 Y79.594 E.18765
G1 X84.125 Y79.594 E.01345
G1 X78.132 Y85.586 E.20667
G1 X78.132 Y86.138 E.01345
G1 X84.677 Y79.594 E.22569
G1 X85.228 Y79.594 E.01345
G1 X78.132 Y86.689 E.24471
G1 X78.132 Y87.241 E.01345
G1 X85.78 Y79.594 E.26373
G1 X86.331 Y79.594 E.01345
G1 X78.132 Y87.793 E.28275
G1 X78.132 Y88.344 E.01345
G1 X86.883 Y79.594 E.30177
G1 X87.434 Y79.594 E.01345
G1 X78.132 Y88.896 E.3208
G1 X78.132 Y89.447 E.01345
G1 X87.986 Y79.594 E.33982
G1 X88.537 Y79.594 E.01345
G1 X78.132 Y89.999 E.35884
G1 X78.132 Y90.55 E.01345
G1 X89.089 Y79.594 E.37786
G1 X89.64 Y79.594 E.01345
G1 X78.132 Y91.102 E.39688
G1 X78.132 Y91.653 E.01345
G1 X90.192 Y79.594 E.4159
G1 X90.744 Y79.594 E.01345
G1 X78.132 Y92.205 E.43492
G1 X78.132 Y92.756 E.01345
G1 X91.295 Y79.594 E.45395
G1 X91.847 Y79.594 E.01345
G1 X78.132 Y93.308 E.47297
G1 X78.132 Y93.859 E.01345
G1 X92.398 Y79.594 E.49199
G1 X92.95 Y79.594 E.01345
G1 X78.132 Y94.411 E.51101
G1 X78.132 Y94.963 E.01345
G1 X93.501 Y79.594 E.53003
G1 X94.053 Y79.594 E.01345
G1 X78.132 Y95.514 E.54905
G1 X78.132 Y96.066 E.01345
G1 X94.604 Y79.594 E.56807
G1 X95.156 Y79.594 E.01345
G1 X78.132 Y96.617 E.58709
G1 X78.132 Y97.169 E.01345
G1 X95.707 Y79.594 E.60612
G1 X96.259 Y79.594 E.01345
G1 X78.132 Y97.72 E.62514
G1 X78.132 Y98.272 E.01345
G1 X96.811 Y79.594 E.64416
G1 X97.362 Y79.594 E.01345
G1 X78.132 Y98.823 E.66318
G1 X78.132 Y99.375 E.01345
G1 X99.575 Y77.932 E.7395
G1 X100.127 Y77.932 E.01345
G1 X78.132 Y99.926 E.75852
G1 X78.132 Y100.478 E.01345
G1 X100.678 Y77.932 E.77754
G1 X101.23 Y77.932 E.01345
G1 X78.132 Y101.03 E.79656
G1 X78.132 Y101.581 E.01345
G1 X101.781 Y77.933 E.81558
G1 X101.868 Y77.933 E.00211
G1 X101.868 Y78.398 E.01134
G1 X78.198 Y102.068 E.81632
G1 X78.749 Y102.068 E.01345
G1 X101.868 Y78.949 E.79729
G1 X101.868 Y79.501 E.01345
G1 X79.301 Y102.068 E.77827
G1 X79.852 Y102.068 E.01345
G1 X101.868 Y80.052 E.75925
G1 X101.868 Y80.604 E.01345
G1 X80.404 Y102.068 E.74023
G1 X80.955 Y102.068 E.01345
G1 X101.868 Y81.155 E.72121
G1 X101.868 Y81.707 E.01345
G1 X81.507 Y102.068 E.70219
G1 X82.058 Y102.068 E.01345
M73 P91 R1
G1 X101.868 Y82.258 E.68317
G1 X101.868 Y82.81 E.01345
G1 X82.61 Y102.068 E.66414
G1 X83.162 Y102.068 E.01345
G1 X101.868 Y83.361 E.64512
G1 X101.868 Y83.913 E.01345
G1 X83.54 Y102.241 E.63209
; WIPE_START
G1 F12500
G1 X84.247 Y101.534 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.92 I-.099 J1.213 P1  F42000
G1 X92.916 Y102.241 Z4.92
G1 Z4.52
G1 E.4 F1800
G1 F10617
M204 S6000
G1 X94.906 Y100.251 E.06863
G3 X94.227 Y100.378 I-.938 J-3.129 E.01687
G1 X92.538 Y102.068 E.05826
G1 X91.986 Y102.068 E.01345
G1 X93.678 Y100.376 E.05834
G3 X93.207 Y100.295 I.164 J-2.375 E.01167
G1 X91.435 Y102.068 E.06112
G1 X90.883 Y102.068 E.01345
G1 X92.787 Y100.164 E.06565
G3 X92.415 Y99.984 I.715 J-1.957 E.01009
G1 X90.332 Y102.068 E.07184
G1 X89.78 Y102.068 E.01345
G1 X92.079 Y99.769 E.07927
G3 X91.776 Y99.52 I1.098 J-1.641 E.00957
G1 X89.228 Y102.068 E.08786
G1 X88.677 Y102.068 E.01345
G1 X91.507 Y99.238 E.09759
G3 X91.275 Y98.918 I1.475 J-1.315 E.00965
G1 X88.125 Y102.068 E.10861
G1 X87.574 Y102.068 E.01345
G1 X91.078 Y98.564 E.12083
G3 X90.918 Y98.171 I1.871 J-.987 E.01034
G1 X87.022 Y102.068 E.13437
G1 X86.471 Y102.068 E.01345
G1 X90.809 Y97.729 E.14962
G3 X90.76 Y97.226 I2.493 J-.495 E.01234
G1 X85.919 Y102.068 E.16696
G1 X85.368 Y102.068 E.01345
G1 X90.808 Y96.627 E.18763
G3 X91.053 Y95.831 I2.494 J.33 E.0204
G1 X84.816 Y102.068 E.21508
G1 X84.265 Y102.068 E.01345
G1 X101.868 Y84.465 E.60708
G1 X101.868 Y85.016 E.01345
G1 X92.63 Y94.254 E.31859
G3 X93.426 Y94.009 I1.181 J2.423 E.0204
G1 X101.868 Y85.568 E.29112
G1 X101.868 Y86.119 E.01345
G1 X94.025 Y93.962 E.27048
G3 X94.532 Y94.007 I.031 J2.568 E.01244
G1 X101.868 Y86.671 E.25299
G1 X101.868 Y87.222 E.01345
G1 X94.97 Y94.12 E.23787
G3 X95.364 Y94.277 I-.591 J2.057 E.01037
G1 X101.868 Y87.774 E.22427
G1 X101.868 Y88.325 E.01345
G1 X95.72 Y94.473 E.212
G3 X96.036 Y94.708 I-1.013 J1.685 E.00963
G1 X101.868 Y88.877 E.20111
G1 X101.868 Y89.428 E.01345
G1 X96.319 Y94.977 E.19136
G3 X96.569 Y95.278 I-1.387 J1.408 E.00957
G1 X101.868 Y89.98 E.18273
G1 X101.868 Y90.532 E.01345
G1 X96.786 Y95.613 E.17525
G3 X96.962 Y95.988 I-4.151 J2.18 E.01011
G1 X101.868 Y91.083 E.16917
G1 X101.868 Y91.635 E.01345
G1 X97.095 Y96.407 E.16459
G3 X97.177 Y96.876 I-4.039 J.948 E.01163
G1 X101.868 Y92.186 E.16176
G1 X101.868 Y92.738 E.01345
G1 X97.18 Y97.426 E.16167
G3 X97.055 Y98.102 I-3.61 J-.317 E.0168
G1 X101.868 Y93.289 E.16599
G1 X101.868 Y93.841 E.01345
G1 X93.641 Y102.068 E.28372
G1 X94.192 Y102.068 E.01345
G1 X101.868 Y94.392 E.2647
G1 X101.868 Y94.944 E.01345
G1 X94.744 Y102.068 E.24568
G1 X95.295 Y102.068 E.01345
G1 X101.868 Y95.495 E.22665
G1 X101.868 Y96.047 E.01345
G1 X95.847 Y102.068 E.20763
G1 X96.399 Y102.068 E.01345
G1 X101.868 Y96.599 E.18861
G1 X101.868 Y97.15 E.01345
G1 X96.95 Y102.068 E.16959
G1 X97.502 Y102.068 E.01345
G1 X101.868 Y97.702 E.15057
G1 X101.868 Y98.253 E.01345
G1 X98.053 Y102.068 E.13155
G1 X98.605 Y102.068 E.01345
G1 X101.868 Y98.805 E.11253
G1 X101.868 Y99.356 E.01345
G1 X99.156 Y102.068 E.0935
G1 X99.708 Y102.068 E.01345
G1 X101.868 Y99.908 E.07448
G1 X101.868 Y100.459 E.01345
G1 X100.259 Y102.068 E.05546
G1 X100.811 Y102.068 E.01345
G1 X101.868 Y101.011 E.03644
G1 X101.868 Y101.562 E.01345
G1 X101.189 Y102.241 E.0234
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12500
G1 X101.868 Y101.562 E-.3647
G1 X101.868 Y101.522 E-.0153
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 29/30
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.92 I.439 J-1.135 P1  F42000
G1 X91.108 Y97.358 Z4.92
G1 Z4.68
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10374
M204 S6000
G1 X91.1 Y97.175 E.00478
G3 X93.618 Y94.321 I2.874 J-.002 E.10809
G1 X93.903 Y94.3 E.00745
G3 X91.115 Y97.461 I.071 J2.873 E.3464
G1 X91.112 Y97.418 E.00112
M204 S10000
G1 X91.523 Y97.338 F42000
G1 F10374
M204 S6000
G1 X91.516 Y97.175 E.00424
G3 X93.669 Y94.734 I2.458 J-.001 E.09245
G1 X93.914 Y94.716 E.00637
G3 X91.529 Y97.42 I.061 J2.458 E.29628
G1 X91.527 Y97.398 E.00058
M204 S10000
G1 X91.941 Y97.256 F42000
G1 F10374
M204 S6000
G1 X91.942 Y96.971 E.00738
G3 X93.721 Y95.147 I2.032 J.202 E.07151
G1 X93.924 Y95.132 E.00529
G3 X91.943 Y97.378 I.051 J2.042 E.24615
G1 X91.942 Y97.316 E.00164
M204 S10000
G1 X92.356 Y97.256 F42000
G1 F10374
M204 S6000
G1 X92.356 Y97.013 E.0063
G3 X93.773 Y95.56 I1.619 J.161 E.05695
G1 X93.934 Y95.548 E.00422
G3 X92.356 Y97.337 I.04 J1.626 E.19603
G1 X92.356 Y97.316 E.00056
M204 S10000
G1 X92.77 Y97.256 F42000
G1 F10374
M204 S6000
G1 X92.77 Y97.054 E.00523
G3 X93.824 Y95.973 I1.205 J.12 E.04239
G1 X93.945 Y95.964 E.00314
G3 X92.772 Y97.315 I.03 J1.21 E.14538
M204 S250
G1 X93.169 Y97.256 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10374
M204 S5000
G3 X93.874 Y96.371 I.806 J-.081 E.0302
G1 X93.955 Y96.365 E.00195
G3 X93.177 Y97.315 I.02 J.809 E.0891
; WIPE_START
G1 F12000
M204 S6000
G1 X93.169 Y97.094 E-.08389
G1 X93.201 Y96.936 E-.06136
G1 X93.307 Y96.715 E-.09315
G1 X93.439 Y96.567 E-.07534
G1 X93.57 Y96.473 E-.06115
G1 X93.582 Y96.468 E-.0051
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.08 I1.109 J.5 P1  F42000
G1 X102.008 Y77.792 Z5.08
G1 Z4.68
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10374
M204 S6000
G1 X102.008 Y102.208 E.63459
G1 X77.992 Y102.208 E.6242
G1 X77.992 Y77.792 E.63459
M73 P91 R0
G1 X78.961 Y77.792 E.02519
G1 X78.961 Y79.253 E.03797
G1 X97.339 Y79.253 E.47766
G1 X97.339 Y77.792 E.03797
G1 X101.948 Y77.792 E.11978
M204 S10000
G1 X102.152 Y77.423 F42000
G1 F10374
M204 S6000
G1 X102.301 Y77.533 E.0048
G1 X102.395 Y77.691 E.0048
G1 X102.424 Y77.874 E.00481
G1 X102.424 Y102.126 E.63033
G1 X102.387 Y102.331 E.00542
G1 X102.284 Y102.484 E.00479
G1 X102.131 Y102.587 E.00479
G1 X101.926 Y102.624 E.00543
G1 X78.074 Y102.624 E.61993
G1 X77.869 Y102.587 E.00541
G1 X77.7 Y102.468 E.00539
M73 P92 R0
G1 X77.605 Y102.311 E.00476
G1 X77.576 Y102.126 E.00486
G1 X77.576 Y77.874 E.63033
G1 X77.606 Y77.688 E.00488
G1 X77.7 Y77.532 E.00474
G1 X77.848 Y77.422 E.00479
G1 X78.027 Y77.378 E.0048
G3 X79.377 Y77.377 I.696 J26.818 E.03508
G1 X79.377 Y78.838 E.03797
G1 X96.924 Y78.838 E.45605
G1 X96.924 Y77.377 E.03797
G1 X101.973 Y77.378 E.13124
G1 X102.094 Y77.408 E.00325
M204 S10000
G1 X102.29 Y77.029 F42000
G1 F10374
M204 S6000
G1 X102.442 Y77.11 E.00446
G1 X102.549 Y77.194 E.00354
G1 X102.664 Y77.321 E.00446
G1 X102.754 Y77.47 E.00453
G1 X102.8 Y77.592 E.00339
G1 X102.834 Y77.762 E.00452
G3 X102.839 Y77.869 I-1.089 J.102 E.00277
G1 X102.839 Y102.131 E.63061
G3 X101.931 Y103.039 I-.893 J.015 E.03724
G1 X78.069 Y103.039 E.62021
G3 X77.161 Y102.131 I-.015 J-.893 E.03724
G1 X77.161 Y77.869 E.63061
G3 X78.069 Y76.961 I.893 J-.015 E.03724
G1 X79.792 Y76.961 E.0448
G1 X79.793 Y78.422 E.03797
G1 X96.508 Y78.422 E.43445
G1 X96.508 Y76.961 E.03797
G1 X101.993 Y76.962 E.14257
G1 X102.166 Y76.988 E.00453
G1 X102.233 Y77.01 E.00184
M204 S10000
G1 X102.508 Y76.671 F42000
G1 F10374
M204 S6000
G3 X103.255 Y77.863 I-.559 J1.181 E.03862
G1 X103.255 Y102.137 E.63089
G3 X101.937 Y103.455 I-1.309 J.009 E.05392
G1 X78.063 Y103.455 E.62049
G3 X76.745 Y102.137 I-.009 J-1.31 E.05392
G1 X76.745 Y77.863 E.63089
G3 X78.063 Y76.545 I1.309 J-.009 E.05392
G1 X80.208 Y76.545 E.05574
G1 X80.208 Y78.006 E.03797
G1 X96.092 Y78.006 E.41285
G1 X96.092 Y76.545 E.03797
G1 X102.014 Y76.547 E.15391
G3 X102.453 Y76.647 I-.065 J1.305 E.01176
M204 S10000
G1 X102.685 Y76.295 F42000
G1 F10374
M204 S6000
G3 X103.671 Y77.858 I-.737 J1.556 E.05069
G1 X103.671 Y102.142 E.63116
G3 X101.942 Y103.871 I-1.726 J.003 E.07061
G1 X78.058 Y103.871 E.62077
G3 X76.33 Y102.142 I-.002 J-1.726 E.0706
G1 X76.33 Y77.858 E.63116
G3 X78.058 Y76.129 I1.726 J-.003 E.07061
G1 X80.623 Y76.13 E.06667
G1 X80.624 Y77.591 E.03797
G1 X95.677 Y77.591 E.39124
G1 X95.677 Y76.13 E.03797
G1 X102.034 Y76.132 E.16524
G3 X102.631 Y76.271 I-.086 J1.72 E.016
M204 S250
G1 X102.857 Y75.933 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10374
M204 S5000
G3 X104.071 Y77.853 I-.908 J1.919 E.05781
G1 X104.071 Y102.147 E.58586
G3 X101.947 Y104.271 I-2.127 J-.003 E.08042
G1 X78.053 Y104.271 E.57622
G3 X75.929 Y102.147 I.004 J-2.127 E.08042
G1 X75.929 Y77.853 E.58586
G3 X78.053 Y75.729 I2.127 J.003 E.08043
G1 X80.615 Y75.729 E.06179
G1 X81.015 Y75.729 E.00965
G1 X81.024 Y75.729 E.00021
G1 F10320
G1 X81.024 Y77.149 E.03424
G1 F10374
G1 X81.024 Y77.19 E.00099
G1 X81.424 Y77.19 E.00965
G1 X94.876 Y77.19 E.32439
G1 X95.276 Y77.19 E.00965
G1 X95.276 Y77.149 E.00099
G1 F10320
G1 X95.276 Y75.729 E.03424
G1 F10374
G1 X95.285 Y75.729 E.00021
G1 X95.685 Y75.729 E.00965
G1 X102.054 Y75.731 E.15359
G3 X102.802 Y75.908 I-.106 J2.12 E.01864
; WIPE_START
G1 F12000
M204 S6000
G1 X103.214 Y76.146 E-.18062
G1 X103.522 Y76.426 E-.15804
G1 X103.586 Y76.513 E-.04134
; WIPE_END
G1 E-.02 F1800
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

G1 X101.841 Y78.745
G1 Z4.68
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423166
G1 F10374
M204 S6000
G1 X101.228 Y78.133 E.02107
G1 X100.678 Y78.133 E.01337
G1 X101.667 Y79.122 E.03401
G1 X101.667 Y79.672 E.01337
G1 X100.128 Y78.133 E.05292
G1 X99.579 Y78.133 E.01337
G1 X101.667 Y80.222 E.07182
G1 X101.667 Y80.771 E.01337
G1 X99.029 Y78.133 E.09073
G1 X98.479 Y78.133 E.01337
G1 X101.667 Y81.321 E.10963
G1 X101.667 Y81.871 E.01337
G1 X97.929 Y78.133 E.12854
G1 X97.68 Y78.133 E.00606
G1 X97.68 Y78.434 E.00731
G1 X101.667 Y82.421 E.13711
G1 X101.667 Y82.971 E.01337
G1 X97.68 Y78.983 E.13711
G1 X97.68 Y79.533 E.01337
G1 X101.667 Y83.521 E.13711
G1 X101.667 Y84.071 E.01337
G1 X97.19 Y79.594 E.15394
G1 X96.641 Y79.594 E.01337
G1 X101.667 Y84.621 E.17284
G1 X101.667 Y85.171 E.01337
G1 X96.091 Y79.594 E.19175
G1 X95.541 Y79.594 E.01337
G1 X101.667 Y85.72 E.21066
G1 X101.667 Y86.27 E.01337
G1 X94.991 Y79.594 E.22957
G1 X94.441 Y79.594 E.01337
G1 X101.667 Y86.82 E.24847
G1 X101.667 Y87.37 E.01337
G1 X93.891 Y79.594 E.26738
G1 X93.341 Y79.594 E.01337
G1 X101.667 Y87.92 E.28629
G1 X101.667 Y88.47 E.01337
G1 X92.791 Y79.594 E.3052
G1 X92.241 Y79.594 E.01337
G1 X101.667 Y89.02 E.3241
G1 X101.667 Y89.57 E.01337
G1 X91.692 Y79.594 E.34301
G1 X91.142 Y79.594 E.01337
G1 X101.667 Y90.12 E.36192
G1 X101.667 Y90.669 E.01337
G1 X90.592 Y79.594 E.38082
G1 X90.042 Y79.594 E.01337
G1 X101.667 Y91.219 E.39973
G1 X101.667 Y91.769 E.01337
G1 X89.492 Y79.594 E.41864
G1 X88.942 Y79.594 E.01337
G1 X101.667 Y92.319 E.43755
G1 X101.667 Y92.869 E.01337
G1 X88.392 Y79.594 E.45645
G1 X87.842 Y79.594 E.01337
G1 X101.667 Y93.419 E.47536
G1 X101.667 Y93.969 E.01337
G1 X87.292 Y79.594 E.49427
G1 X86.742 Y79.594 E.01337
G1 X101.667 Y94.519 E.51318
G1 X101.667 Y95.069 E.01337
G1 X86.193 Y79.594 E.53208
G1 X85.643 Y79.594 E.01337
G1 X101.667 Y95.618 E.55099
G1 X101.667 Y96.168 E.01337
G1 X85.093 Y79.594 E.5699
G1 X84.543 Y79.594 E.01337
G1 X101.667 Y96.718 E.58881
M73 P93 R0
G1 X101.667 Y97.268 E.01337
G1 X83.993 Y79.594 E.60771
G1 X83.443 Y79.594 E.01337
G1 X101.667 Y97.818 E.62662
G1 X101.667 Y98.368 E.01337
G1 X82.893 Y79.594 E.64553
G1 X82.343 Y79.594 E.01337
G1 X101.667 Y98.918 E.66444
G1 X101.667 Y99.468 E.01337
G1 X81.794 Y79.594 E.68334
G1 X81.244 Y79.594 E.01337
G1 X101.667 Y100.018 E.70225
G1 X101.667 Y100.567 E.01337
G1 X96.86 Y95.76 E.1653
G3 X97.136 Y96.586 I-2.414 J1.265 E.02125
G1 X101.667 Y101.117 E.15582
G1 X101.667 Y101.667 E.01337
G1 X97.191 Y97.191 E.1539
G3 X97.146 Y97.696 I-2.544 J.025 E.01233
G1 X101.318 Y101.867 E.14344
G1 X100.768 Y101.867 E.01337
G1 X97.042 Y98.142 E.12809
G3 X96.886 Y98.536 I-2.037 J-.581 E.01031
G1 X100.218 Y101.867 E.11456
G1 X99.668 Y101.867 E.01337
G1 X96.692 Y98.891 E.10233
G3 X96.463 Y99.212 I-1.718 J-.984 E.0096
G1 X99.118 Y101.867 E.0913
G1 X98.568 Y101.867 E.01337
G1 X96.199 Y99.499 E.08145
G1 X95.903 Y99.752 E.00948
G1 X98.018 Y101.867 E.07273
G1 X97.468 Y101.867 E.01337
G1 X95.569 Y99.968 E.06529
G3 X95.198 Y100.147 I-1.079 J-1.77 E.01004
G1 X96.919 Y101.867 E.05916
G1 X96.369 Y101.867 E.01337
G1 X94.786 Y100.285 E.05442
G3 X94.322 Y100.371 I-.923 J-3.667 E.01147
G1 X95.819 Y101.867 E.05145
G1 X95.269 Y101.867 E.01337
G1 X93.786 Y100.384 E.05099
G3 X93.129 Y100.278 I.27 J-3.739 E.01619
G1 X94.719 Y101.867 E.05466
G1 X94.169 Y101.867 E.01337
G1 X78.333 Y86.031 E.54452
G1 X78.333 Y85.481 E.01337
G1 X90.876 Y98.024 E.43127
G3 X90.767 Y97.366 I3.155 J-.856 E.01624
G1 X78.333 Y84.931 E.42756
G1 X78.333 Y84.381 E.01337
G1 X90.778 Y96.827 E.42792
G3 X90.866 Y96.364 I2.347 J.206 E.01146
G1 X78.333 Y83.831 E.43094
G1 X78.333 Y83.282 E.01337
G1 X91.001 Y95.95 E.4356
G3 X91.183 Y95.582 I4.439 J1.959 E.00999
G1 X78.333 Y82.732 E.44184
G1 X78.333 Y82.182 E.01337
G1 X91.401 Y95.25 E.44934
G3 X91.652 Y94.951 I1.365 J.894 E.00951
G1 X78.333 Y81.632 E.45798
G1 X78.333 Y81.082 E.01337
G1 X91.939 Y94.689 E.46785
G3 X92.259 Y94.458 I1.31 J1.48 E.00959
G1 X78.333 Y80.532 E.47884
G1 X78.333 Y79.982 E.01337
G1 X92.613 Y94.263 E.49102
G3 X93.009 Y94.109 I1.765 J3.963 E.01034
G1 X78.702 Y79.802 E.49194
G1 X79.111 Y79.801 E.00996
G1 X79.111 Y79.661 E.00341
G1 X93.454 Y94.004 E.49317
G3 X93.961 Y93.961 I.554 J3.473 E.01237
G1 X79.594 Y79.594 E.49399
G1 X80.144 Y79.594 E.01337
G1 X94.564 Y94.014 E.49581
G3 X95.387 Y94.287 I-.668 J3.389 E.02115
G1 X80.52 Y79.42 E.51118
; WIPE_START
G1 F12537.613
G1 X81.227 Y80.127 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.08 I.287 J-1.183 P1  F42000
G1 X78.477 Y79.461 Z5.08
G1 Z4.68
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.587837
G1 F8807.571
M204 S6000
G1 X78.477 Y78 E.05056
; WIPE_START
G1 X78.477 Y79 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.08 I-1.217 J.025 P1  F42000
G1 X78.946 Y102.041 Z5.08
G1 Z4.68
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423166
G1 F10374
M204 S6000
G1 X78.333 Y101.428 E.02108
G1 X78.333 Y100.878 E.01337
G1 X79.322 Y101.867 E.03402
G1 X79.872 Y101.867 E.01337
G1 X78.333 Y100.328 E.05293
G1 X78.333 Y99.778 E.01337
G1 X80.422 Y101.867 E.07183
G1 X80.972 Y101.867 E.01337
G1 X78.333 Y99.228 E.09074
G1 X78.333 Y98.678 E.01337
G1 X81.522 Y101.867 E.10965
G1 X82.072 Y101.867 E.01337
G1 X78.333 Y98.129 E.12856
G1 X78.333 Y97.579 E.01337
G1 X82.621 Y101.867 E.14746
G1 X83.171 Y101.867 E.01337
G1 X78.333 Y97.029 E.16637
G1 X78.333 Y96.479 E.01337
G1 X83.721 Y101.867 E.18528
G1 X84.271 Y101.867 E.01337
G1 X78.333 Y95.929 E.20419
G1 X78.333 Y95.379 E.01337
G1 X84.821 Y101.867 E.22309
G1 X85.371 Y101.867 E.01337
G1 X78.333 Y94.829 E.242
G1 X78.333 Y94.279 E.01337
G1 X85.921 Y101.867 E.26091
G1 X86.471 Y101.867 E.01337
G1 X78.333 Y93.729 E.27982
G1 X78.333 Y93.18 E.01337
G1 X87.021 Y101.867 E.29872
G1 X87.57 Y101.867 E.01337
G1 X78.333 Y92.63 E.31763
G1 X78.333 Y92.08 E.01337
G1 X88.12 Y101.867 E.33654
G1 X88.67 Y101.867 E.01337
G1 X78.333 Y91.53 E.35545
G1 X78.333 Y90.98 E.01337
G1 X89.22 Y101.867 E.37435
G1 X89.77 Y101.867 E.01337
G1 X78.333 Y90.43 E.39326
M73 P94 R0
G1 X78.333 Y89.88 E.01337
G1 X90.32 Y101.867 E.41217
G1 X90.87 Y101.867 E.01337
G1 X78.333 Y89.33 E.43107
G1 X78.333 Y88.78 E.01337
G1 X91.42 Y101.867 E.44998
G1 X91.97 Y101.867 E.01337
G1 X78.333 Y88.231 E.46889
G1 X78.333 Y87.681 E.01337
G1 X92.519 Y101.867 E.4878
G1 X93.069 Y101.867 E.01337
G1 X78.333 Y87.131 E.5067
G1 X78.333 Y86.581 E.01337
G1 X93.793 Y102.041 E.53158
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12537.613
G1 X93.086 Y101.334 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 30/30
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.08 I1.21 J.132 P1  F42000
G1 X93.47 Y97.808 Z5.08
G1 Z4.84
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11263
M204 S5000
G3 X93.874 Y96.371 I.505 J-.633 E.04577
G1 X93.955 Y96.365 E.00195
G3 X93.519 Y97.843 I.02 J.809 E.07353
; WIPE_START
G1 F12000
M204 S6000
G1 X93.354 Y97.696 E-.08387
G1 X93.263 Y97.562 E-.06136
G1 X93.201 Y97.414 E-.06129
G1 X93.169 Y97.256 E-.0613
G1 X93.169 Y97.094 E-.06134
G1 X93.195 Y96.963 E-.05083
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I1.211 J.123 P1  F42000
G1 X95.201 Y77.19 Z5.24
G1 Z4.84
G1 E.4 F1800
G1 F4826.525
M204 S5000
G1 X95.201 Y77.149 E.00099
G1 F4440
G1 X95.201 Y76.045 E.02663
G1 F4760.139
G1 X95.235 Y76.045 E.00082
G1 F9352.162
G1 X95.635 Y76.045 E.00965
G1 F11263
G1 X96.035 Y76.045 E.00965
G1 X101.945 Y76.045 E.14251
G3 X103.755 Y77.855 I-.001 J1.811 E.06857
G1 X103.755 Y102.145 E.58574
G3 X101.945 Y103.955 I-1.806 J.004 E.06862
G1 X78.055 Y103.955 E.57609
G3 X76.245 Y102.147 I-.004 J-1.806 E.06856
G1 X76.245 Y77.855 E.5858
G3 X78.055 Y76.045 I1.817 J.007 E.06851
G1 X80.265 Y76.045 E.05329
G1 X80.665 Y76.045 E.00965
G1 F9351.76
G1 X81.065 Y76.045 E.00965
G1 F4759.853
G1 X81.099 Y76.045 E.00082
G1 F4440
G1 X81.099 Y77.149 E.02662
G1 F4826.525
G1 X81.099 Y77.19 E.00099
G1 F9445.12
G1 X81.499 Y77.19 E.00965
G1 F11263
G1 X81.899 Y77.19 E.00965
G1 X95.141 Y77.19 E.31932
; WIPE_START
G1 F12000
M204 S6000
G1 X95.201 Y77.149 E-.02762
G1 X95.201 Y76.222 E-.35238
; WIPE_END
G1 E-.02 F1800
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

G1 X102.186 Y103.721
G1 Z4.84
G1 E.4 F1800
; FEATURE: Top surface
G1 F11263
M204 S2000
G1 X103.518 Y102.389 E.04543
G1 X103.543 Y101.819
G1 X101.618 Y103.743 E.06563
G1 X101.073 Y103.743
G1 X103.543 Y101.273 E.08422
G1 X103.542 Y100.728
G1 X100.528 Y103.743 E.10282
G1 X99.982 Y103.743
G1 X103.542 Y100.183 E.12141
G1 X103.542 Y99.638
G1 X99.437 Y103.743 E.14
G1 X98.891 Y103.743
G1 X103.542 Y99.093 E.1586
G1 X103.542 Y98.547
G1 X98.346 Y103.743 E.17719
G1 X97.801 Y103.743
G1 X103.541 Y98.002 E.19578
G1 X103.541 Y97.457
G1 X97.255 Y103.743 E.21438
G1 X96.71 Y103.743
G1 X103.541 Y96.912 E.23297
G1 X103.541 Y96.366
G1 X96.164 Y103.743 E.25156
G1 X95.619 Y103.743
G1 X103.541 Y95.821 E.27016
G1 X103.54 Y95.276
G1 X95.074 Y103.743 E.28875
G1 X94.528 Y103.743
G1 X103.54 Y94.731 E.30735
G1 X103.54 Y94.186
G1 X93.983 Y103.743 E.32594
G1 X93.437 Y103.743
G1 X103.54 Y93.64 E.34453
G1 X103.54 Y93.095
G1 X92.892 Y103.743 E.36313
G1 X92.347 Y103.743
G1 X103.539 Y92.55 E.38172
G1 X103.539 Y92.005
G1 X91.801 Y103.743 E.40031
G1 X91.256 Y103.743
G1 X103.539 Y91.46 E.41891
G1 X103.539 Y90.914
G1 X90.71 Y103.743 E.4375
G1 X90.165 Y103.743
G1 X103.539 Y90.369 E.45609
G1 X103.538 Y89.824
G1 X89.62 Y103.743 E.47469
G1 X89.074 Y103.743
G1 X103.538 Y89.279 E.49328
G1 X103.538 Y88.734
G1 X94.993 Y97.278 E.2914
G1 X94.923 Y96.803
G1 X103.538 Y88.188 E.29379
G1 X103.538 Y87.643
G1 X94.711 Y96.47 E.30103
G1 X94.391 Y96.244
G1 X103.537 Y87.098 E.31193
G1 X103.537 Y86.553
G1 X93.933 Y96.157 E.32756
; WIPE_START
M73 P95 R0
G1 F12000
M204 S6000
G1 X94.64 Y95.45 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I-1.192 J-.243 P1  F42000
G1 X94.081 Y98.191 Z5.24
G1 Z4.84
G1 E.4 F1800
G1 F11263
M204 S2000
G1 X88.529 Y103.743 E.18934
G1 X87.983 Y103.743
G1 X93.603 Y98.123 E.19166
G1 X93.27 Y97.91
G1 X87.438 Y103.743 E.19891
G1 X86.892 Y103.743
G1 X93.045 Y97.59 E.20982
G1 X92.957 Y97.133
G1 X86.347 Y103.743 E.22541
G1 X85.802 Y103.743
G1 X103.537 Y86.008 E.60484
G1 X103.537 Y85.462
G1 X85.256 Y103.743 E.62344
G1 X84.711 Y103.743
G1 X103.537 Y84.917 E.64203
G1 X103.536 Y84.372
G1 X84.165 Y103.743 E.66062
G1 X83.62 Y103.743
G1 X103.536 Y83.827 E.67922
G1 X103.536 Y83.282
G1 X83.075 Y103.743 E.69781
G1 X82.529 Y103.743
G1 X103.536 Y82.736 E.71641
G1 X103.536 Y82.191
G1 X81.984 Y103.743 E.735
G1 X81.438 Y103.743
G1 X103.535 Y81.646 E.75359
G1 X103.535 Y81.101
G1 X80.893 Y103.743 E.77219
G1 X80.348 Y103.743
G1 X103.535 Y80.556 E.79078
G1 X103.535 Y80.01
G1 X79.802 Y103.743 E.80937
G1 X79.257 Y103.743
G1 X103.535 Y79.465 E.82797
G1 X103.534 Y78.92
G1 X78.711 Y103.743 E.84656
G1 X78.166 Y103.743
G1 X103.534 Y78.375 E.86515
G1 X103.534 Y77.83
G1 X77.671 Y103.693 E.88204
G1 X77.28 Y103.538
G1 X103.462 Y77.356 E.89291
G1 X103.285 Y76.988
G1 X76.963 Y103.31 E.89768
G1 X76.718 Y103.009
G1 X103.034 Y76.694 E.89746
G1 X102.721 Y76.46
G1 X76.543 Y102.639 E.8928
G1 X76.46 Y102.177
G1 X102.327 Y76.31 E.88216
G1 X101.834 Y76.257
G1 X76.457 Y101.634 E.86545
G1 X76.457 Y101.088
G1 X101.289 Y76.257 E.84685
M73 P96 R0
G1 X100.743 Y76.257
G1 X76.457 Y100.543 E.82825
G1 X76.457 Y99.998
G1 X100.198 Y76.257 E.80965
G1 X99.652 Y76.257
G1 X76.457 Y99.452 E.79105
G1 X76.457 Y98.907
G1 X99.107 Y76.257 E.77245
G1 X98.562 Y76.257
G1 X76.457 Y98.361 E.75385
G1 X76.457 Y97.816
G1 X98.016 Y76.257 E.73525
G1 X97.471 Y76.257
G1 X76.457 Y97.271 E.71665
G1 X76.457 Y96.725
G1 X96.925 Y76.257 E.69805
G1 X96.38 Y76.257
G1 X95.413 Y77.224 E.03298
G1 X95.413 Y76.679
G1 X95.835 Y76.257 E.01438
; WIPE_START
G1 F12000
M204 S6000
G1 X95.413 Y76.679 E-.2266
G1 X95.413 Y77.082 E-.1534
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I-1.063 J-.592 P1  F42000
G1 X95.235 Y77.402 Z5.24
G1 Z4.84
G1 E.4 F1800
G1 F11263
M204 S2000
G1 X76.457 Y96.18 E.6404
G1 X76.457 Y95.634
G1 X94.689 Y77.402 E.6218
G1 X94.144 Y77.402
G1 X76.457 Y95.089 E.60319
G1 X76.457 Y94.544
G1 X93.599 Y77.402 E.58459
G1 X93.053 Y77.402
G1 X76.457 Y93.998 E.56599
G1 X76.457 Y93.453
G1 X92.508 Y77.402 E.54739
G1 X91.962 Y77.402
G1 X76.457 Y92.907 E.52879
M73 P97 R0
G1 X76.457 Y92.362
G1 X91.417 Y77.402 E.51019
G1 X90.872 Y77.402
G1 X76.457 Y91.817 E.49159
G1 X76.457 Y91.271
G1 X90.326 Y77.402 E.47299
G1 X89.781 Y77.402
G1 X76.457 Y90.726 E.45439
G1 X76.457 Y90.18
G1 X89.235 Y77.402 E.43579
G1 X88.69 Y77.402
G1 X76.457 Y89.635 E.41719
G1 X76.457 Y89.09
G1 X88.145 Y77.402 E.39859
G1 X87.599 Y77.402
G1 X76.457 Y88.544 E.37999
G1 X76.457 Y87.999
G1 X87.054 Y77.402 E.36139
G1 X86.508 Y77.402
G1 X76.457 Y87.453 E.34279
G1 X76.457 Y86.908
G1 X85.963 Y77.402 E.32419
G1 X85.418 Y77.402
G1 X76.457 Y86.363 E.30559
G1 X76.457 Y85.817
G1 X84.872 Y77.402 E.28699
G1 X84.327 Y77.402
G1 X76.457 Y85.272 E.26839
G1 X76.457 Y84.726
G1 X83.781 Y77.402 E.24979
G1 X83.236 Y77.402
G1 X76.457 Y84.181 E.23118
G1 X76.457 Y83.635
G1 X82.691 Y77.402 E.21258
G1 X82.145 Y77.402
G1 X76.457 Y83.09 E.19398
G1 X76.457 Y82.545
G1 X81.6 Y77.402 E.17538
G1 X81.054 Y77.402
G1 X76.457 Y81.999 E.15678
G1 X76.457 Y81.454
G1 X80.887 Y77.024 E.15108
G1 X80.887 Y76.479
G1 X76.457 Y80.908 E.15108
G1 X76.457 Y80.363
G1 X80.563 Y76.257 E.14003
G1 X80.018 Y76.257
G1 X76.457 Y79.818 E.12143
G1 X76.457 Y79.272
G1 X79.472 Y76.257 E.10283
G1 X78.927 Y76.257
G1 X76.457 Y78.727 E.08423
G1 X76.457 Y78.181
G1 X78.381 Y76.257 E.06563
G1 X77.818 Y76.275
G1 X76.482 Y77.611 E.04557
; WIPE_START
G1 F12000
M204 S6000
G1 X77.189 Y76.904 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I-.96 J.747 P1  F42000
G1 X93.779 Y98.22 Z5.24
G1 Z4.84
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0929024
G1 F11263
M204 S6000
G3 X93.645 Y98.138 I.742 J-1.368 E.00058
M204 S10000
G1 X94.431 Y98.086 F42000
; LINE_WIDTH: 0.115687
G1 F11263
M204 S6000
G3 X94.155 Y98.266 I-1.926 J-2.662 E.00168
; WIPE_START
G1 F18000
G1 X94.431 Y98.086 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I.916 J.801 P1  F42000
G1 X95.07 Y97.355 Z5.24
G1 Z4.84
G1 E.4 F1800
; LINE_WIDTH: 0.106843
G1 F11263
M204 S6000
G3 X94.876 Y97.64 I-2.114 J-1.23 E.00157
; WIPE_START
G1 F18000
G1 X95.07 Y97.355 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I1.027 J-.652 P1  F42000
G1 X94.352 Y96.225 Z5.24
G1 Z4.84
G1 E.4 F1800
; LINE_WIDTH: 0.116915
G1 F11263
M204 S6000
G1 X94.255 Y96.167 E.00059
G1 X94.17 Y96.193 E.00046
; WIPE_START
G1 F18000
G1 X94.255 Y96.167 E-.16706
G1 X94.352 Y96.225 E-.21294
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I-.527 J-1.097 P1  F42000
G1 X92.891 Y96.926 Z5.24
G1 Z4.84
G1 E.4 F1800
; LINE_WIDTH: 0.101805
G1 F11263
M204 S6000
G1 X92.969 Y97.145 E.00098
M204 S10000
G1 X93.018 Y96.826 F42000
; LINE_WIDTH: 0.0913511
G1 F11263
M204 S6000
G2 X92.878 Y97.054 I2.149 J1.476 E.00095
; WIPE_START
G1 F18000
G1 X93.018 Y96.826 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I1.207 J.153 P1  F42000
G1 X95.485 Y77.296 Z5.24
G1 Z4.84
G1 E.4 F1800
; LINE_WIDTH: 0.151187
G1 F11263
M204 S6000
G3 X95.307 Y77.474 I-.232 J-.054 E.00194
; WIPE_START
G1 F18000
G1 X95.394 Y77.438 E-.1343
G1 X95.449 Y77.383 E-.11134
G1 X95.485 Y77.296 E-.13436
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I-1.163 J.36 P1  F42000
G1 X103.384 Y102.823 Z5.24
G1 Z4.84
G1 E.4 F1800
; LINE_WIDTH: 0.104551
G1 F11263
M204 S6000
G1 X103.29 Y102.956 E.00072
; LINE_WIDTH: 0.158072
G3 X102.875 Y103.393 I-2.438 J-1.904 E.00467
; LINE_WIDTH: 0.139205
G1 X102.752 Y103.489 E.00102
; LINE_WIDTH: 0.0982213
G3 X102.606 Y103.599 I-.632 J-.683 E.00073
; WIPE_START
G1 F18000
G1 X102.752 Y103.489 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I.888 J-.832 P1  F42000
G1 X77.379 Y76.404 Z5.24
G1 Z4.84
G1 E.4 F1800
; LINE_WIDTH: 0.120406
G1 F11263
M204 S6000
G1 X77.253 Y76.505 E.00086
; LINE_WIDTH: 0.155216
G2 X76.709 Y77.046 I2.186 J2.745 E.00581
; LINE_WIDTH: 0.104262
G1 X76.616 Y77.178 E.00071
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X76.709 Y77.046 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z5.34 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

M73 P98 R0
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

    G1 Z104.84 F600
    G1 Z102.84

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


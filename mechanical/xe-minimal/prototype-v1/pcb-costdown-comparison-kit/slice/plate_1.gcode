; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 7m 22s; total estimated time: 7m 41s
; total layer number: 5
; total filament length [mm] : 1018.83
; total filament volume [cm^3] : 2450.58
; total filament weight [g] : 3.06
; filament_density: 1.25
; filament_diameter: 1.75
; max_z_height: 0.84
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
M73 P0 R7
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
M73 P1 R7
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
; layer num/total_layer_count: 1/5
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P3 R7
G1 X103.01 Y111.599 F42000
M204 S6000
M73 P4 R7
G1 Z.4
G1 Z.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G2 X103.01 Y113.799 I2.942 J1.1 E.0803
G2 X105.465 Y118.041 I2.983 J1.105 E.19984
G1 X105.465 Y141.965 E.8547
G1 X74.535 Y141.965 E1.10498
G1 X74.535 Y133.735 E.294
G1 X75.535 Y133.735 E.03573
G1 X75.535 Y119.265 E.51698
G1 X74.535 Y119.265 E.03573
G1 X74.535 Y111.035 E.294
G1 X102.861 Y111.036 E1.01196
G2 X102.99 Y111.543 I3.245 J-.56 E.01869
M204 S6000
G1 X103.503 Y111.603 F42000
G1 F3000
M204 S500
G2 X103.503 Y113.803 I2.512 J1.1 E.08088
G2 X105.922 Y117.628 I2.493 J1.101 E.19078
G1 X105.922 Y142.422 E.88577
G1 X74.078 Y142.422 E1.13764
G1 X74.078 Y133.278 E.32666
G1 X75.078 Y133.278 E.03573
M73 P5 R7
G1 X75.078 Y119.722 E.48432
G1 X74.078 Y119.722 E.03573
G1 X74.078 Y110.578 E.32666
G1 X103.271 Y110.579 E1.04293
G2 X103.479 Y111.548 I2.688 J-.071 E.0356
M204 S6000
G1 X104.013 Y111.601 F42000
G1 F3000
M204 S500
G2 X104.013 Y113.801 I1.993 J1.1 E.08203
G2 X106.379 Y117.139 I1.987 J1.099 E.182
G1 X106.379 Y142.879 E.91959
G1 X73.621 Y142.879 E1.1703
G1 X73.621 Y132.821 E.35932
G1 X74.621 Y132.821 E.03573
G1 X74.621 Y120.179 E.45166
G1 X73.621 Y120.179 E.03573
G1 X73.621 Y110.121 E.35932
G1 X103.759 Y110.122 E1.07671
G2 X103.985 Y111.548 I2.269 J.372 E.05246
M204 S6000
M73 P6 R7
G1 X104.555 Y111.604 F42000
G1 F3000
M204 S500
G2 X104.555 Y113.804 I1.46 J1.1 E.08433
G2 X106.535 Y116.635 I1.448 J1.095 E.16322
G1 X106.836 Y116.525 E.01143
G1 X106.836 Y143.336 E.95783
G1 X73.164 Y143.336 E1.20295
G1 X73.164 Y132.364 E.39198
G1 X74.164 Y132.364 E.03573
G1 X74.164 Y120.636 E.419
G1 X73.164 Y120.636 E.03573
G1 X73.164 Y109.664 E.39198
G1 X104.368 Y109.665 E1.11477
G2 X104.52 Y111.555 I1.764 J.809 E.07077
M204 S6000
G1 X105.196 Y111.596 F42000
G1 F3000
M204 S500
G2 X105.196 Y113.796 I.832 J1.1 E.09098
G2 X106.972 Y115.848 I.809 J1.095 E.16026
G1 X107.293 Y115.485 E.01732
G1 X107.293 Y143.482 E1.00025
M73 P7 R7
G3 X106.982 Y143.793 I-.299 J.012 E.01762
G1 X73.018 Y143.793 E1.21342
G3 X72.707 Y143.482 I-.012 J-.299 E.01762
G1 X72.707 Y131.907 E.41354
G1 X73.707 Y131.907 E.03573
G1 X73.707 Y121.093 E.38635
G1 X72.707 Y121.093 E.03573
G1 X72.707 Y109.517 E.41355
G3 X73.018 Y109.207 I.299 J-.011 E.01761
G1 X105.15 Y109.208 E1.14796
G1 X105.213 Y109.395 E.00704
G2 X105.149 Y111.559 I.791 J1.106 E.08946
; WIPE_START
G1 X104.938 Y111.853 E-.13738
G1 X104.791 Y112.081 E-.1029
G1 X104.693 Y112.332 E-.10261
G1 X104.671 Y112.427 E-.03712
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.669 J1.016 P1  F42000
G1 X106.644 Y111.128 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X105.91 Y109.604 I-.644 J-.629 E.12337
G1 X105.998 Y109.6 E.00315
G3 X106.685 Y111.084 I.002 J.9 E.0733
; WIPE_START
G1 X106.507 Y111.244 E-.09081
G1 X106.35 Y111.33 E-.06806
G1 X106.09 Y111.396 E-.10202
G1 X105.91 Y111.396 E-.06814
G1 X105.779 Y111.366 E-.05098
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.948 J.764 P1  F42000
G1 X107.109 Y109.716 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G2 X106.57 Y109.208 I-1.89 J1.467 E.02656
G1 X107.057 Y109.214 E.01739
G1 X107.138 Y109.242 E.00306
G1 X107.207 Y109.293 E.00307
G1 X107.258 Y109.362 E.00306
G1 X107.286 Y109.443 E.00306
G3 X107.293 Y109.651 I-1.071 J.138 E.00746
G1 X107.166 Y109.696 E.00481
; WIPE_START
G1 X106.923 Y109.504 E-.1174
G1 X106.57 Y109.208 E-.17519
G1 X106.8 Y109.211 E-.08741
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.209 J.138 P1  F42000
G1 X107.109 Y111.916 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G2 X106.804 Y111.604 I-1.282 J.95 E.01563
G2 X107.293 Y111.085 I-2.353 J-2.705 E.02553
G1 X107.293 Y111.851 E.02739
G1 X107.166 Y111.896 E.00481
; WIPE_START
G1 X106.924 Y111.704 E-.11738
G1 X106.804 Y111.604 E-.05928
G1 X106.972 Y111.448 E-.08709
G1 X107.175 Y111.219 E-.11625
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
M73 P8 R7
G3 Z.6 I-1.107 J-.506 P1  F42000
G1 X106.089 Y113.595 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X105.91 Y111.804 I-.089 J-.895 E.10093
G1 X105.998 Y111.8 E.00316
G3 X106.149 Y113.587 I.002 J.9 E.09574
M204 S6000
G1 X105.998 Y114 F42000
G1 F3000
M204 S500
G3 X105.91 Y114.004 I.002 J.9 E.19882
G1 X105.938 Y114.003 E.00101
M204 S6000
G1 X106.804 Y113.804 F42000
; FEATURE: Inner wall
G1 F3000
M204 S500
G2 X107.293 Y113.285 I-2.354 J-2.706 E.02553
G1 X107.293 Y114.051 E.02739
G1 X107.109 Y114.116 E.00695
G2 X106.851 Y113.842 I-1.278 J.946 E.01349
; WIPE_START
G1 X106.972 Y113.648 E-.08678
G1 X107.293 Y113.285 E-.18426
G1 X107.293 Y113.571 E-.10896
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.566 J-1.077 P1  F42000
G1 X73.25 Y131.45 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X73.25 Y121.55 E.35369
G1 X72.25 Y121.55 E.03573
G1 X72.25 Y109.506 E.43027
G3 X73.006 Y108.75 I.759 J.003 E.0424
G1 X107.034 Y108.751 E1.21568
G3 X107.75 Y109.506 I-.044 J.759 E.04094
G1 X107.75 Y143.494 E1.21423
G3 X106.994 Y144.25 I-.759 J-.003 E.0424
G1 X73.006 Y144.25 E1.21422
G3 X72.25 Y143.494 I.003 J-.759 E.0424
G1 X72.25 Y131.45 E.43027
G1 X73.19 Y131.45 E.03358
; WIPE_START
G1 X73.196 Y130.45 E-.38
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

G1 X101.766 Y111.219
G1 Z.2
M73 P9 R7
G1 E.4 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50358
G1 F6300
M204 S500
G1 X102.505 Y111.958 E.03762
G2 X102.43 Y112.535 I3.693 J.77 E.02097
G1 X101.32 Y111.425 E.05653
G1 X100.668 Y111.425 E.02346
G1 X102.464 Y113.22 E.0914
G2 X102.603 Y113.794 I2.419 J-.282 E.02131
G2 X102.55 Y113.958 I.792 J.343 E.00622
M73 P9 R6
G1 X100.017 Y111.425 E.12899
G1 X99.366 Y111.425 E.02346
G1 X102.448 Y114.507 E.15698
G2 X102.435 Y115.146 I3.607 J.392 E.02303
G1 X98.714 Y111.425 E.1895
G1 X98.063 Y111.425 E.02346
G1 X102.582 Y115.944 E.23013
G2 X104.955 Y118.317 I3.42 J-1.047 E.12574
G1 X105.076 Y118.438 E.00619
G1 X105.076 Y119.09 E.02346
G1 X97.411 Y111.424 E.39031
G1 X96.76 Y111.424 E.02346
G1 X105.076 Y119.741 E.42348
G1 X105.076 Y120.393 E.02346
G1 X96.108 Y111.424 E.45666
G1 X95.457 Y111.424 E.02346
G1 X105.076 Y121.044 E.48983
G1 X105.076 Y121.696 E.02346
G1 X94.805 Y111.424 E.52301
G1 X94.154 Y111.424 E.02346
G1 X105.076 Y122.347 E.55618
G1 X105.076 Y122.999 E.02346
G1 X93.502 Y111.424 E.58935
G1 X92.851 Y111.424 E.02346
G1 X105.076 Y123.65 E.62253
G1 X105.076 Y124.301 E.02346
G1 X92.199 Y111.424 E.6557
G1 X91.548 Y111.424 E.02346
G1 X105.076 Y124.953 E.68888
M73 P10 R6
G1 X105.076 Y125.604 E.02346
G1 X90.896 Y111.424 E.72205
G1 X90.245 Y111.424 E.02346
G1 X105.076 Y126.256 E.75522
G1 X105.076 Y126.907 E.02346
G1 X89.593 Y111.424 E.7884
G1 X88.942 Y111.424 E.02346
G1 X105.076 Y127.559 E.82157
G1 X105.076 Y128.21 E.02346
G1 X88.29 Y111.424 E.85474
G1 X87.639 Y111.424 E.02346
G1 X105.076 Y128.862 E.88792
G1 X105.076 Y129.513 E.02346
G1 X86.987 Y111.424 E.92109
G1 X86.336 Y111.424 E.02346
G1 X105.076 Y130.165 E.95427
G1 X105.076 Y130.816 E.02346
G1 X85.684 Y111.424 E.98744
G1 X85.033 Y111.424 E.02346
G1 X105.076 Y131.468 E1.02061
G1 X105.076 Y132.119 E.02346
G1 X84.381 Y111.424 E1.05379
M73 P11 R6
G1 X83.73 Y111.424 E.02346
G1 X105.076 Y132.771 E1.08696
G1 X105.076 Y133.422 E.02346
G1 X83.078 Y111.424 E1.12014
G1 X82.427 Y111.424 E.02346
G1 X105.076 Y134.074 E1.15331
G1 X105.076 Y134.725 E.02346
G1 X81.775 Y111.424 E1.18648
G1 X81.124 Y111.424 E.02346
G1 X105.076 Y135.376 E1.21966
G1 X105.076 Y136.028 E.02346
G1 X80.472 Y111.424 E1.25283
G1 X79.821 Y111.424 E.02346
G1 X105.076 Y136.679 E1.286
G1 X105.076 Y137.331 E.02346
G1 X79.169 Y111.424 E1.31918
G1 X78.518 Y111.424 E.02346
M73 P12 R6
G1 X105.076 Y137.982 E1.35235
G1 X105.076 Y138.634 E.02346
G1 X77.866 Y111.424 E1.38553
G1 X77.215 Y111.424 E.02346
G1 X105.076 Y139.285 E1.4187
G1 X105.076 Y139.937 E.02346
G1 X76.563 Y111.424 E1.45187
G1 X75.912 Y111.424 E.02346
G1 X105.076 Y140.588 E1.48505
G1 X105.076 Y141.24 E.02346
G1 X75.26 Y111.424 E1.51822
G1 X74.924 Y111.424 E.01212
G1 X74.924 Y111.739 E.01134
G1 X104.761 Y141.576 E1.51932
G1 X104.11 Y141.576 E.02346
G1 X74.924 Y112.39 E1.48615
M73 P13 R6
G1 X74.924 Y113.042 E.02346
G1 X103.458 Y141.576 E1.45298
G1 X102.807 Y141.576 E.02346
G1 X74.924 Y113.693 E1.4198
G1 X74.924 Y114.345 E.02346
G1 X102.155 Y141.576 E1.38663
G1 X101.504 Y141.576 E.02346
G1 X74.924 Y114.996 E1.35346
G1 X74.924 Y115.648 E.02346
G1 X100.852 Y141.576 E1.32029
G1 X100.201 Y141.576 E.02346
G1 X74.924 Y116.299 E1.28711
G1 X74.924 Y116.95 E.02346
G1 X99.549 Y141.576 E1.25394
G1 X98.898 Y141.576 E.02346
G1 X74.924 Y117.602 E1.22077
M73 P14 R6
G1 X74.924 Y118.253 E.02346
G1 X98.247 Y141.576 E1.18759
G1 X97.595 Y141.576 E.02346
G1 X75.924 Y119.905 E1.1035
G1 X75.924 Y120.556 E.02346
G1 X96.944 Y141.576 E1.07033
G1 X96.292 Y141.576 E.02346
G1 X75.924 Y121.208 E1.03716
G1 X75.924 Y121.859 E.02346
G1 X95.641 Y141.576 E1.00398
G1 X94.989 Y141.576 E.02346
G1 X75.924 Y122.511 E.97081
G1 X75.924 Y123.162 E.02346
G1 X94.338 Y141.576 E.93764
G1 X93.686 Y141.576 E.02346
G1 X75.924 Y123.814 E.90446
G1 X75.924 Y124.465 E.02346
G1 X93.035 Y141.576 E.87129
M73 P15 R6
G1 X92.383 Y141.576 E.02346
G1 X75.924 Y125.117 E.83812
G1 X75.924 Y125.768 E.02346
G1 X91.732 Y141.576 E.80495
G1 X91.08 Y141.576 E.02346
G1 X75.924 Y126.42 E.77177
G1 X75.924 Y127.071 E.02346
G1 X90.429 Y141.576 E.7386
G1 X89.777 Y141.576 E.02346
G1 X75.924 Y127.723 E.70543
G1 X75.924 Y128.374 E.02346
G1 X89.126 Y141.576 E.67226
G1 X88.474 Y141.576 E.02346
G1 X75.924 Y129.025 E.63908
G1 X75.924 Y129.677 E.02346
G1 X87.823 Y141.576 E.60591
G1 X87.172 Y141.576 E.02346
G1 X75.924 Y130.328 E.57274
G1 X75.924 Y130.98 E.02346
G1 X86.52 Y141.576 E.53956
G1 X85.869 Y141.576 E.02346
G1 X75.924 Y131.631 E.50639
G1 X75.924 Y132.283 E.02346
M73 P16 R6
G1 X85.217 Y141.576 E.47322
G1 X84.566 Y141.576 E.02346
G1 X75.924 Y132.934 E.44004
G1 X75.924 Y133.586 E.02346
G1 X83.914 Y141.576 E.40687
G1 X83.263 Y141.576 E.02346
G1 X75.81 Y134.124 E.37948
G1 X75.159 Y134.124 E.02346
G1 X82.611 Y141.576 E.37948
G1 X81.96 Y141.576 E.02346
G1 X74.924 Y134.54 E.35827
G1 X74.924 Y135.192 E.02346
G1 X81.308 Y141.576 E.3251
G1 X80.657 Y141.576 E.02346
G1 X74.924 Y135.843 E.29193
G1 X74.924 Y136.495 E.02346
G1 X80.005 Y141.576 E.25875
G1 X79.354 Y141.576 E.02346
G1 X74.924 Y137.146 E.22558
G1 X74.924 Y137.798 E.02346
G1 X78.702 Y141.576 E.19241
G1 X78.051 Y141.576 E.02346
G1 X74.924 Y138.449 E.15924
G1 X74.924 Y139.101 E.02346
G1 X77.399 Y141.576 E.12606
G1 X76.748 Y141.576 E.02346
G1 X74.924 Y139.752 E.09289
G1 X74.924 Y140.403 E.02346
G1 X76.097 Y141.576 E.05972
G1 X75.445 Y141.576 E.02346
G1 X74.718 Y140.849 E.03702
; WIPE_START
G1 X75.425 Y141.556 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.776 J.938 P1  F42000
G1 X107.14 Y115.312 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.389503
G1 F3000
M204 S500
G1 X107.305 Y114.859 E.01308
; LINE_WIDTH: 0.418174
G1 X107.323 Y114.805 E.00165
; LINE_WIDTH: 0.468661
G2 X107.267 Y114.303 I-3.804 J.166 E.01684
M204 S6000
G1 X107.521 Y114.355 F42000
; LINE_WIDTH: 0.296627
G1 F3000
M204 S500
M73 P17 R6
G1 X107.098 Y115.36 E.02164
M204 S6000
G1 X107.067 Y115.385 F42000
; LINE_WIDTH: 0.220284
G1 F3000
M204 S500
G1 X107.521 Y114.441 E.01452
M204 S6000
G1 X107.521 Y114.525 F42000
; LINE_WIDTH: 0.159132
G1 F3000
M204 S500
G1 X107.057 Y115.379 E.00883
M204 S6000
G1 X107.051 Y115.375 F42000
; LINE_WIDTH: 0.111337
G1 F3000
M204 S500
G2 X107.521 Y114.609 I-15.312 J-9.932 E.00481
; WIPE_START
G1 X107.051 Y115.375 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.216 J.048 P1  F42000
G1 X107.14 Y113.113 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.389402
G1 F3000
M204 S500
G1 X107.305 Y112.659 E.01309
; LINE_WIDTH: 0.418143
G1 X107.323 Y112.605 E.00166
; LINE_WIDTH: 0.468662
G2 X107.267 Y112.103 I-3.811 J.166 E.01684
M204 S6000
G1 X107.521 Y112.154 F42000
; LINE_WIDTH: 0.296559
G1 F3000
M204 S500
G1 X107.098 Y113.16 E.02164
M204 S6000
G1 X107.067 Y113.185 F42000
; LINE_WIDTH: 0.220204
G1 F3000
M204 S500
G1 X107.521 Y112.244 E.01449
M204 S6000
G1 X107.521 Y112.326 F42000
; LINE_WIDTH: 0.159076
G1 F3000
M204 S500
G1 X107.057 Y113.179 E.00882
M204 S6000
G1 X107.051 Y113.175 F42000
; LINE_WIDTH: 0.111356
G1 F3000
M204 S500
G2 X107.521 Y112.41 I-15.895 J-10.3 E.0048
; WIPE_START
G1 X107.051 Y113.175 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.216 J.048 P1  F42000
G1 X107.14 Y110.913 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.38936
G1 F3000
M204 S500
G1 X107.305 Y110.459 E.01308
; LINE_WIDTH: 0.418113
G1 X107.323 Y110.405 E.00166
; LINE_WIDTH: 0.46867
G2 X107.267 Y109.903 I-3.807 J.166 E.01684
M204 S6000
G1 X107.521 Y109.955 F42000
; LINE_WIDTH: 0.296523
G1 F3000
M204 S500
G1 X107.098 Y110.96 E.02163
M204 S6000
G1 X107.067 Y110.985 F42000
; LINE_WIDTH: 0.220246
G1 F3000
M204 S500
G1 X107.521 Y110.042 E.01451
M204 S6000
G1 X107.521 Y110.128 F42000
; LINE_WIDTH: 0.158958
G1 F3000
M204 S500
G1 X107.057 Y110.978 E.00879
M204 S6000
G1 X107.051 Y110.975 F42000
; LINE_WIDTH: 0.111348
G1 F3000
M204 S500
G2 X107.521 Y110.21 I-16.441 J-10.648 E.0048
; WIPE_START
G1 X107.051 Y110.975 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.137 J-.433 P1  F42000
G1 X106.459 Y109.419 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.224478
G1 F3000
M204 S500
G1 X105.467 Y108.98 E.0154
M204 S6000
G1 X105.569 Y108.98 F42000
; LINE_WIDTH: 0.158974
G1 F3000
M204 S500
G1 X106.452 Y109.431 E.00899
M204 S6000
G1 X106.448 Y109.437 F42000
; LINE_WIDTH: 0.111234
G1 F3000
M204 S500
G2 X105.659 Y108.98 I-9.774 J15.939 E.00487
M204 S6000
G1 X105.342 Y108.98 F42000
; LINE_WIDTH: 0.338922
G1 F3000
M204 S500
G1 X106.413 Y109.375 E.02641
M204 S6000
G1 X106.374 Y109.342 F42000
; LINE_WIDTH: 0.440662
G1 F3000
M204 S500
G1 X105.87 Y109.178 E.01648
G1 X105.725 Y109.19 E.00452
; LINE_WIDTH: 0.475638
G1 X105.624 Y109.202 E.00343
G1 X105.616 Y109.218 E.0006
; LINE_WIDTH: 0.44176
G1 X105.482 Y109.478 E.00912
M204 S6000
G1 X104.818 Y109.437 F42000
; LINE_WIDTH: 0.126352
G1 F3000
M204 S500
G1 X104.72 Y109.484 E.00071
G1 X104.652 Y109.616 E.00097
; WIPE_START
G1 X104.72 Y109.484 E-.21871
G1 X104.818 Y109.437 E-.16129
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.217 J.032 P1  F42000
G1 X105.735 Y75.059 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X105.91 Y73.304 I.266 J-.86 E.08813
G1 X105.998 Y73.3 E.00315
G3 X105.793 Y75.075 I.002 J.9 E.10855
; WIPE_START
G1 X105.569 Y74.991 E-.09077
G1 X105.422 Y74.89 E-.06802
G1 X105.22 Y74.65 E-.11888
G1 X105.147 Y74.487 E-.06822
G1 X105.127 Y74.399 E-.03411
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.541 J1.09 P1  F42000
G1 X107.109 Y73.416 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G2 X106.804 Y73.104 I-1.271 J.94 E.01563
G2 X107.293 Y72.585 I-2.367 J-2.719 E.02553
G1 X107.293 Y73.351 E.02739
G1 X107.166 Y73.396 E.00481
; WIPE_START
G1 X106.924 Y73.205 E-.11735
G1 X106.804 Y73.104 E-.05932
G1 X106.972 Y72.948 E-.08719
G1 X107.174 Y72.719 E-.11615
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.216 J-.053 P1  F42000
G1 X107.109 Y71.216 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G2 X106.57 Y70.708 I-1.891 J1.467 E.02656
G1 X107.057 Y70.714 E.01739
G1 X107.138 Y70.742 E.00306
G1 X107.207 Y70.794 E.00307
G1 X107.258 Y70.862 E.00306
G1 X107.286 Y70.943 E.00306
G3 X107.293 Y71.151 I-1.077 J.138 E.00746
G1 X107.166 Y71.196 E.00481
; WIPE_START
G1 X106.924 Y71.004 E-.11737
G1 X106.57 Y70.708 E-.17522
G1 X106.8 Y70.711 E-.08741
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.09 J-.541 P1  F42000
G1 X105.735 Y72.859 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X105.91 Y71.104 I.266 J-.86 E.08813
G1 X105.998 Y71.1 E.00315
G3 X105.793 Y72.875 I.002 J.9 E.10855
; WIPE_START
G1 X105.569 Y72.791 E-.09076
G1 X105.421 Y72.69 E-.06807
G1 X105.22 Y72.45 E-.11883
G1 X105.147 Y72.287 E-.06822
G1 X105.127 Y72.199 E-.03411
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.476 J-1.12 P1  F42000
G1 X103.01 Y73.099 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G2 X105.465 Y77.35 I3.006 J1.098 E.19983
G1 X105.465 Y98.965 E.77221
G1 X79.036 Y98.965 E.94418
G1 X79.036 Y92.985 E.21362
G1 X80.035 Y92.985 E.03572
M73 P18 R6
G1 X80.035 Y78.515 E.51698
G1 X79.036 Y78.515 E.03572
G1 X79.036 Y72.535 E.21361
G1 X102.861 Y72.536 E.85115
G2 X102.99 Y73.043 I3.248 J-.561 E.01869
M204 S6000
G1 X103.503 Y73.103 F42000
G1 F3000
M204 S500
G2 X105.922 Y76.927 I2.491 J1.101 E.19077
G1 X105.922 Y99.422 E.80365
G1 X78.579 Y99.422 E.97683
G1 X78.578 Y92.528 E.24628
G1 X79.578 Y92.528 E.03572
G1 X79.578 Y78.972 E.48432
G1 X78.578 Y78.972 E.03572
G1 X78.579 Y72.078 E.24627
G1 X103.271 Y72.079 E.88213
G2 X103.479 Y73.048 I2.684 J-.07 E.0356
M204 S6000
G1 X104.013 Y73.101 F42000
M73 P19 R6
G1 F3000
M204 S500
G2 X106.379 Y76.439 I1.988 J1.099 E.182
G1 X106.379 Y99.879 E.8374
G1 X78.122 Y99.879 E1.00949
G1 X78.121 Y92.071 E.27893
G1 X79.121 Y92.071 E.03572
G1 X79.121 Y79.429 E.45166
G1 X78.121 Y79.429 E.03572
G1 X78.122 Y71.621 E.27893
G1 X103.759 Y71.622 E.9159
G2 X103.985 Y73.048 I2.269 J.372 E.05246
M204 S6000
G1 X104.555 Y73.104 F42000
G1 F3000
M204 S500
G2 X106.535 Y75.935 I1.448 J1.095 E.16321
G1 X106.836 Y75.825 E.01144
G1 X106.836 Y100.336 E.87566
G1 X77.665 Y100.336 E1.04215
G1 X77.664 Y91.614 E.31159
G1 X78.664 Y91.614 E.03572
G1 X78.664 Y79.886 E.419
M73 P20 R6
G1 X77.664 Y79.886 E.03572
G1 X77.665 Y71.164 E.31159
G1 X104.368 Y71.165 E.95396
G2 X104.52 Y73.055 I1.764 J.808 E.07077
M204 S6000
G1 X105.192 Y73.1 F42000
G1 F3000
M204 S500
G2 X106.972 Y75.148 I.815 J1.089 E.15982
G1 X107.293 Y74.785 E.01732
G1 X107.293 Y100.482 E.91807
G3 X106.982 Y100.793 I-.299 J.012 E.01762
G1 X77.518 Y100.793 E1.05265
G3 X77.208 Y100.514 I-.015 J-.295 E.01651
G1 X77.207 Y91.157 E.33429
G1 X78.207 Y91.157 E.03572
G1 X78.207 Y80.343 E.38635
G1 X77.207 Y80.343 E.03572
G1 X77.211 Y70.957 E.33531
G3 X77.518 Y70.707 I.295 J.048 E.01545
G1 X105.15 Y70.708 E.98719
G1 X105.213 Y70.895 E.00704
G2 X105.145 Y73.063 I.81 J1.11 E.08927
; WIPE_START
G1 X104.938 Y73.353 E-.13549
G1 X104.791 Y73.581 E-.10291
G1 X104.693 Y73.832 E-.10262
M73 P21 R6
G1 X104.675 Y73.933 E-.03898
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.643 J-1.033 P1  F42000
G1 X77.75 Y90.7 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X77.75 Y80.8 E.35369
G1 X76.75 Y80.8 E.03572
G1 X76.751 Y70.963 E.35143
G3 X77.506 Y70.25 I.752 J.039 E.04095
G1 X107.034 Y70.251 E1.05492
G3 X107.75 Y71.006 I-.044 J.759 E.04094
G1 X107.75 Y100.494 E1.05346
G3 X106.994 Y101.25 I-.759 J-.003 E.0424
G1 X77.506 Y101.25 E1.05345
G3 X76.751 Y100.537 I-.004 J-.753 E.04096
G1 X76.75 Y90.7 E.35143
G1 X77.69 Y90.7 E.03358
; WIPE_START
G1 X77.696 Y89.7 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.702 J.994 P1  F42000
G1 X101.763 Y72.719 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5047
G1 F6300
M204 S500
G1 X102.504 Y73.46 E.03781
G2 X102.43 Y74.039 I3.692 J.767 E.02109
G1 X101.316 Y72.925 E.05686
G1 X100.663 Y72.925 E.02357
G1 X102.723 Y74.984 E.10514
; WIPE_START
G1 X102.016 Y74.277 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.935 J.779 P1  F42000
G1 X105.282 Y78.197 Z.6
G1 Z.2
G1 E.4 F1800
G1 F6300
M204 S500
G1 X104.555 Y77.47 E.0371
G3 X102.728 Y75.643 I1.422 J-3.249 E.09547
G1 X100.01 Y72.925 E.13874
G1 X99.357 Y72.925 E.02357
G1 X105.076 Y78.644 E.29194
G1 X105.076 Y79.297 E.02357
G1 X98.704 Y72.925 E.32528
G1 X98.051 Y72.924 E.02357
G1 X105.076 Y79.95 E.35862
M73 P22 R6
G1 X105.076 Y80.603 E.02357
G1 X97.398 Y72.924 E.39195
G1 X96.744 Y72.924 E.02357
M73 P22 R5
G1 X105.076 Y81.256 E.42529
G1 X105.076 Y81.909 E.02357
G1 X96.091 Y72.924 E.45862
G1 X95.438 Y72.924 E.02357
G1 X105.076 Y82.562 E.49196
G1 X105.076 Y83.215 E.02357
G1 X94.785 Y72.924 E.52529
G1 X94.132 Y72.924 E.02357
G1 X105.076 Y83.868 E.55863
G1 X105.076 Y84.522 E.02357
G1 X93.479 Y72.924 E.59196
G1 X92.826 Y72.924 E.02357
G1 X105.076 Y85.175 E.6253
G1 X105.076 Y85.828 E.02357
G1 X92.173 Y72.924 E.65863
G1 X91.52 Y72.924 E.02357
G1 X105.076 Y86.481 E.69197
G1 X105.076 Y87.134 E.02357
G1 X90.867 Y72.924 E.72531
G1 X90.214 Y72.924 E.02357
G1 X105.076 Y87.787 E.75864
G1 X105.076 Y88.44 E.02357
G1 X89.561 Y72.924 E.79198
M73 P23 R5
G1 X88.907 Y72.924 E.02357
G1 X105.076 Y89.093 E.82531
G1 X105.076 Y89.746 E.02357
G1 X88.254 Y72.924 E.85865
G1 X87.601 Y72.924 E.02357
G1 X105.076 Y90.399 E.89198
G1 X105.076 Y91.052 E.02357
G1 X86.948 Y72.924 E.92532
G1 X86.295 Y72.924 E.02357
G1 X105.076 Y91.705 E.95865
G1 X105.076 Y92.358 E.02357
G1 X85.642 Y72.924 E.99199
G1 X84.989 Y72.924 E.02357
G1 X105.076 Y93.011 E1.02533
G1 X105.076 Y93.664 E.02357
G1 X84.336 Y72.924 E1.05866
G1 X83.683 Y72.924 E.02357
G1 X105.076 Y94.317 E1.092
G1 X105.076 Y94.97 E.02357
G1 X83.03 Y72.924 E1.12533
M73 P24 R5
G1 X82.377 Y72.924 E.02357
G1 X105.076 Y95.623 E1.15867
G1 X105.076 Y96.277 E.02357
G1 X81.724 Y72.924 E1.192
G1 X81.071 Y72.924 E.02357
G1 X105.076 Y96.93 E1.22534
G1 X105.076 Y97.583 E.02357
G1 X80.417 Y72.924 E1.25867
G1 X79.764 Y72.924 E.02357
G1 X105.076 Y98.236 E1.29201
G1 X105.076 Y98.576 E.01229
G1 X104.764 Y98.576 E.01128
G1 X79.425 Y73.237 E1.2934
G1 X79.425 Y73.89 E.02357
G1 X104.111 Y98.576 E1.26007
G1 X103.458 Y98.576 E.02357
G1 X79.425 Y74.543 E1.22674
M73 P25 R5
G1 X79.424 Y75.196 E.02357
G1 X102.805 Y98.576 E1.19341
G1 X102.152 Y98.576 E.02357
G1 X79.424 Y75.849 E1.16008
G1 X79.424 Y76.502 E.02357
G1 X101.498 Y98.576 E1.12675
G1 X100.845 Y98.576 E.02357
G1 X79.424 Y77.155 E1.09342
G1 X79.424 Y77.808 E.02357
G1 X79.948 Y78.332 E.02674
M204 S6000
G1 X80.218 Y78.602 F42000
G1 F6300
M204 S500
G1 X100.192 Y98.576 E1.01956
G1 X99.539 Y98.576 E.02357
G1 X80.424 Y79.461 E.97573
G1 X80.424 Y80.114 E.02357
G1 X98.886 Y98.576 E.94239
G1 X98.233 Y98.576 E.02357
G1 X80.424 Y80.767 E.90906
G1 X80.424 Y81.42 E.02357
G1 X97.58 Y98.576 E.87572
M73 P26 R5
G1 X96.927 Y98.576 E.02357
G1 X80.424 Y82.073 E.84239
G1 X80.424 Y82.726 E.02357
G1 X96.274 Y98.576 E.80906
G1 X95.621 Y98.576 E.02357
G1 X80.424 Y83.379 E.77572
G1 X80.424 Y84.032 E.02357
G1 X94.968 Y98.576 E.74239
G1 X94.315 Y98.576 E.02357
G1 X80.424 Y84.685 E.70905
G1 X80.424 Y85.338 E.02357
G1 X93.662 Y98.576 E.67572
G1 X93.009 Y98.576 E.02357
G1 X80.424 Y85.991 E.64238
G1 X80.424 Y86.644 E.02357
G1 X92.356 Y98.576 E.60905
G1 X91.703 Y98.576 E.02357
G1 X80.424 Y87.297 E.57572
G1 X80.424 Y87.95 E.02357
G1 X91.05 Y98.576 E.54238
G1 X90.397 Y98.576 E.02357
G1 X80.424 Y88.603 E.50905
G1 X80.424 Y89.257 E.02357
G1 X89.743 Y98.576 E.47571
M73 P27 R5
G1 X89.09 Y98.576 E.02357
G1 X80.424 Y89.91 E.44238
G1 X80.424 Y90.563 E.02357
G1 X88.437 Y98.576 E.40904
G1 X87.784 Y98.576 E.02357
G1 X80.424 Y91.216 E.37571
G1 X80.424 Y91.869 E.02357
G1 X87.131 Y98.576 E.34238
G1 X86.478 Y98.576 E.02357
G1 X80.424 Y92.522 E.30904
G1 X80.424 Y93.175 E.02357
G1 X85.825 Y98.576 E.27571
G1 X85.172 Y98.576 E.02357
G1 X79.97 Y93.374 E.26555
G1 X79.424 Y93.374 E.01969
G1 X79.424 Y93.481 E.00388
G1 X84.519 Y98.576 E.26006
G1 X83.866 Y98.576 E.02357
G1 X79.424 Y94.134 E.22672
G1 X79.424 Y94.788 E.02357
G1 X83.213 Y98.576 E.19339
G1 X82.56 Y98.576 E.02357
G1 X79.424 Y95.441 E.16005
G1 X79.424 Y96.094 E.02357
G1 X81.907 Y98.576 E.12671
G1 X81.254 Y98.576 E.02357
G1 X79.425 Y96.747 E.09337
G1 X79.425 Y97.4 E.02357
G1 X80.601 Y98.576 E.06003
G1 X79.948 Y98.576 E.02357
G1 X79.219 Y97.848 E.03719
; WIPE_START
G1 X79.926 Y98.555 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.804 J.914 P1  F42000
G1 X107.14 Y74.613 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.389586
G1 F3000
M204 S500
G1 X107.305 Y74.159 E.01309
; LINE_WIDTH: 0.418225
G1 X107.323 Y74.105 E.00165
; LINE_WIDTH: 0.468654
G2 X107.267 Y73.603 I-3.801 J.165 E.01684
M204 S6000
G1 X107.521 Y73.655 F42000
; LINE_WIDTH: 0.29669
G1 F3000
M204 S500
G1 X107.098 Y74.66 E.02164
M204 S6000
G1 X107.067 Y74.685 F42000
; LINE_WIDTH: 0.220326
G1 F3000
M204 S500
G1 X107.521 Y73.742 E.01452
M204 S6000
G1 X107.521 Y73.824 F42000
; LINE_WIDTH: 0.159151
G1 F3000
M204 S500
G1 X107.057 Y74.679 E.00884
M204 S6000
G1 X107.051 Y74.675 F42000
; LINE_WIDTH: 0.111427
G1 F3000
M204 S500
G2 X107.521 Y73.908 I-15.101 J-9.795 E.00482
; WIPE_START
G1 X107.051 Y74.675 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
M73 P28 R5
G3 Z.6 I1.216 J.048 P1  F42000
G1 X107.14 Y72.413 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.389686
G1 F3000
M204 S500
G1 X107.305 Y71.959 E.0131
; LINE_WIDTH: 0.418267
G1 X107.323 Y71.906 E.00164
; LINE_WIDTH: 0.468643
G2 X107.267 Y71.403 I-3.809 J.166 E.01685
M204 S6000
G1 X107.521 Y71.455 F42000
; LINE_WIDTH: 0.296731
G1 F3000
M204 S500
G1 X107.098 Y72.46 E.02164
M204 S6000
G1 X107.067 Y72.485 F42000
; LINE_WIDTH: 0.220409
G1 F3000
M204 S500
G1 X107.521 Y71.544 E.01451
M204 S6000
G1 X107.521 Y71.626 F42000
; LINE_WIDTH: 0.159137
G1 F3000
M204 S500
G1 X107.057 Y72.479 E.00883
M204 S6000
G1 X107.051 Y72.475 F42000
; LINE_WIDTH: 0.111475
G1 F3000
M204 S500
G2 X107.521 Y71.712 I-17.017 J-11.023 E.0048
; WIPE_START
G1 X107.051 Y72.475 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.138 J-.432 P1  F42000
G1 X106.459 Y70.919 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.224375
G1 F3000
M204 S500
G1 X105.466 Y70.48 E.0154
M204 S6000
G1 X105.571 Y70.48 F42000
; LINE_WIDTH: 0.158971
G1 F3000
M204 S500
G1 X106.452 Y70.931 E.00898
M204 S6000
G1 X106.448 Y70.937 F42000
; LINE_WIDTH: 0.111294
G1 F3000
M204 S500
G2 X105.657 Y70.48 I-9.445 J15.407 E.00488
M204 S6000
G1 X105.341 Y70.48 F42000
; LINE_WIDTH: 0.338938
G1 F3000
M204 S500
G1 X106.413 Y70.874 E.02642
M204 S6000
G1 X106.374 Y70.842 F42000
; LINE_WIDTH: 0.440659
G1 F3000
M204 S500
G1 X105.87 Y70.678 E.01649
G1 X105.725 Y70.69 E.00452
; LINE_WIDTH: 0.475622
G1 X105.624 Y70.702 E.00342
G1 X105.615 Y70.718 E.00061
; LINE_WIDTH: 0.441608
G1 X105.482 Y70.978 E.00911
M204 S6000
G1 X104.818 Y70.937 F42000
; LINE_WIDTH: 0.12639
G1 F3000
M204 S500
G1 X104.72 Y70.984 E.00071
G1 X104.652 Y71.116 E.00097
; WIPE_START
G1 X104.72 Y70.984 E-.21883
G1 X104.818 Y70.937 E-.16117
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.215 J.064 P1  F42000
G1 X106.612 Y36.84 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X105.91 Y36.604 I-.612 J.66 E.1747
G1 X105.998 Y36.6 E.00315
G3 X106.567 Y36.801 I.002 J.9 E.02197
; WIPE_START
G1 X106.731 Y36.974 E-.09079
G1 X106.821 Y37.13 E-.06817
G1 X106.878 Y37.3 E-.06814
G1 X106.9 Y37.478 E-.0681
G1 X106.887 Y37.656 E-.06813
G1 X106.875 Y37.699 E-.01667
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.102 J-1.213 P1  F42000
G1 X102.861 Y38.036 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G2 X105.464 Y40.641 I3.143 J-.538 E.14023
G1 X105.465 Y60.465 E.70823
G1 X83.036 Y60.465 E.80127
G1 X83.036 Y56.485 E.14216
G1 X84.035 Y56.485 E.03571
G1 X84.035 Y42.015 E.51698
G1 X83.036 Y42.015 E.03571
G1 X83.036 Y38.035 E.14216
G1 X102.801 Y38.036 E.70611
M204 S6000
G1 X103.271 Y37.579 F42000
G1 F3000
M204 S500
G2 X105.921 Y40.228 I2.735 J-.086 E.14745
G1 X105.922 Y60.922 E.7393
G1 X82.579 Y60.922 E.83393
G1 X82.579 Y56.028 E.17482
M73 P29 R5
G1 X83.578 Y56.028 E.03571
G1 X83.578 Y42.472 E.48432
G1 X82.579 Y42.472 E.03571
G1 X82.579 Y37.578 E.17482
G1 X103.211 Y37.579 E.73708
M204 S6000
G1 X103.759 Y37.122 F42000
G1 F3000
M204 S500
G2 X106.378 Y39.739 I2.242 J.375 E.15455
G1 X106.379 Y61.379 E.77309
G1 X82.122 Y61.379 E.86659
G1 X82.121 Y55.571 E.20748
G1 X83.121 Y55.571 E.03572
G1 X83.121 Y42.929 E.45166
G1 X82.121 Y42.929 E.03572
G1 X82.122 Y37.121 E.20748
G1 X103.699 Y37.122 E.77086
M204 S6000
G1 X104.368 Y36.665 F42000
G1 F3000
M204 S500
M73 P30 R5
G2 X104.639 Y38.701 I1.741 J.804 E.07744
G2 X106.835 Y39.126 I1.385 J-1.271 E.08559
G1 X106.836 Y61.836 E.81134
G1 X81.665 Y61.836 E.89924
G1 X81.664 Y55.114 E.24014
G1 X82.664 Y55.114 E.03572
G1 X82.664 Y43.386 E.419
G1 X81.664 Y43.386 E.03572
G1 X81.665 Y36.664 E.24014
G1 X104.308 Y36.665 E.80892
; WIPE_START
G1 X104.252 Y37.008 E-.13207
G1 X104.212 Y37.185 E-.0688
G1 X104.185 Y37.545 E-.13738
G1 X104.193 Y37.655 E-.04175
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.168 J1.205 P1  F42000
G1 X107.292 Y38.086 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X107.293 Y61.982 E.85373
G3 X106.982 Y62.293 I-.299 J.012 E.01761
G1 X81.518 Y62.293 E.90976
G3 X81.208 Y62.014 I-.014 J-.295 E.01651
G1 X81.207 Y54.657 E.26284
G1 X82.207 Y54.657 E.03572
G1 X82.207 Y43.843 E.38635
G1 X81.207 Y43.843 E.03572
G1 X81.208 Y36.486 E.26284
G1 X81.225 Y36.401 E.00307
G3 X81.518 Y36.207 I.282 J.107 E.01339
M73 P31 R5
G1 X105.15 Y36.208 E.84429
G1 X105.213 Y36.395 E.00704
G2 X106.972 Y38.448 I.788 J1.105 E.16093
G1 X107.252 Y38.131 E.01512
; WIPE_START
G1 X107.254 Y39.131 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.215 J-.073 P1  F42000
G1 X107.108 Y36.714 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G2 X106.57 Y36.208 I-1.889 J1.468 E.02649
G1 X107.057 Y36.214 E.01739
G1 X107.185 Y36.274 E.00507
G3 X107.292 Y36.65 I-.29 J.285 E.01455
G1 X107.165 Y36.694 E.00481
; WIPE_START
G1 X106.924 Y36.504 E-.11665
G1 X106.57 Y36.208 E-.17521
G1 X106.802 Y36.211 E-.08814
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.71 J-.989 P1  F42000
G1 X81.75 Y54.2 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X81.75 Y44.3 E.35369
G1 X80.75 Y44.3 E.03572
G1 X80.751 Y36.463 E.27998
G3 X81.506 Y35.75 I.752 J.039 E.04095
G1 X107.034 Y35.751 E.91201
G3 X107.749 Y36.463 I-.037 J.752 E.0395
G1 X107.75 Y61.994 E.9121
G3 X106.994 Y62.75 I-.759 J-.003 E.04239
G1 X81.506 Y62.75 E.91056
G3 X80.751 Y62.037 I-.003 J-.753 E.04096
G1 X80.75 Y54.2 E.27997
G1 X81.69 Y54.2 E.03358
; WIPE_START
G1 X81.696 Y53.2 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.533 J1.094 P1  F42000
G1 X105.281 Y41.718 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50306
G1 F6300
M204 S500
G1 X101.988 Y38.425 E.16751
G1 X101.337 Y38.425 E.02341
G1 X105.075 Y42.163 E.19015
G1 X105.075 Y42.814 E.02341
M73 P32 R5
G1 X100.686 Y38.425 E.22325
G1 X100.035 Y38.425 E.0234
G1 X105.075 Y43.465 E.25635
G1 X105.075 Y44.115 E.02341
G1 X99.384 Y38.424 E.28945
G1 X98.734 Y38.424 E.0234
G1 X105.075 Y44.766 E.32255
G1 X105.075 Y45.417 E.02341
G1 X98.083 Y38.424 E.35566
G1 X97.432 Y38.424 E.0234
G1 X105.076 Y46.068 E.38876
G1 X105.076 Y46.718 E.02341
G1 X96.781 Y38.424 E.42186
G1 X96.131 Y38.424 E.0234
G1 X105.076 Y47.369 E.45496
G1 X105.076 Y48.02 E.0234
G1 X95.48 Y38.424 E.48806
G1 X94.829 Y38.424 E.0234
G1 X105.076 Y48.671 E.52116
G1 X105.076 Y49.322 E.0234
G1 X94.178 Y38.424 E.55426
G1 X93.528 Y38.424 E.0234
G1 X105.076 Y49.972 E.58736
G1 X105.076 Y50.623 E.02341
G1 X92.877 Y38.424 E.62046
G1 X92.226 Y38.424 E.0234
G1 X105.076 Y51.274 E.65357
G1 X105.076 Y51.925 E.0234
G1 X91.575 Y38.424 E.68667
M73 P33 R5
G1 X90.925 Y38.424 E.0234
G1 X105.076 Y52.575 E.71977
G1 X105.076 Y53.226 E.02341
G1 X90.274 Y38.424 E.75287
G1 X89.623 Y38.424 E.0234
G1 X105.076 Y53.877 E.78597
G1 X105.076 Y54.528 E.0234
G1 X88.972 Y38.424 E.81907
G1 X88.322 Y38.424 E.0234
G1 X105.076 Y55.178 E.85217
G1 X105.076 Y55.829 E.02341
G1 X87.671 Y38.424 E.88527
G1 X87.02 Y38.424 E.0234
G1 X105.076 Y56.48 E.91837
G1 X105.076 Y57.131 E.02341
G1 X86.369 Y38.424 E.95147
G1 X85.718 Y38.424 E.0234
G1 X105.076 Y57.782 E.98457
G1 X105.076 Y58.432 E.02341
G1 X85.068 Y38.424 E1.01768
G1 X84.417 Y38.424 E.0234
G1 X105.076 Y59.083 E1.05078
M73 P34 R5
G1 X105.076 Y59.734 E.02341
G1 X83.766 Y38.424 E1.08388
G1 X83.425 Y38.424 E.01228
G1 X83.425 Y38.733 E.01112
G1 X104.768 Y60.076 E1.08557
G1 X104.117 Y60.076 E.0234
G1 X83.425 Y39.384 E1.05247
G1 X83.424 Y40.034 E.0234
G1 X103.466 Y60.076 E1.01938
G1 X102.816 Y60.076 E.0234
G1 X83.424 Y40.685 E.98629
G1 X83.424 Y41.336 E.0234
G1 X83.921 Y41.832 E.02525
M204 S6000
G1 X84.218 Y42.129 F42000
G1 F6300
M204 S500
G1 X102.165 Y60.076 E.91282
G1 X101.514 Y60.076 E.0234
G1 X84.424 Y42.986 E.86926
G1 X84.424 Y43.637 E.0234
G1 X100.863 Y60.076 E.83616
G1 X100.213 Y60.076 E.0234
G1 X84.424 Y44.287 E.80306
M73 P35 R5
G1 X84.424 Y44.938 E.0234
G1 X99.562 Y60.076 E.76997
G1 X98.911 Y60.076 E.0234
M73 P35 R4
G1 X84.424 Y45.589 E.73687
G1 X84.424 Y46.239 E.0234
G1 X98.26 Y60.076 E.70377
G1 X97.61 Y60.076 E.0234
G1 X84.424 Y46.89 E.67067
G1 X84.424 Y47.541 E.0234
G1 X96.959 Y60.076 E.63757
G1 X96.308 Y60.076 E.0234
G1 X84.424 Y48.192 E.60448
G1 X84.424 Y48.842 E.0234
G1 X95.658 Y60.076 E.57138
G1 X95.007 Y60.076 E.0234
G1 X84.424 Y49.493 E.53828
G1 X84.424 Y50.144 E.0234
G1 X94.356 Y60.076 E.50518
G1 X93.705 Y60.076 E.0234
G1 X84.424 Y50.795 E.47208
G1 X84.424 Y51.445 E.0234
G1 X93.055 Y60.076 E.43899
G1 X92.404 Y60.076 E.0234
G1 X84.424 Y52.096 E.40589
M73 P36 R4
G1 X84.424 Y52.747 E.0234
G1 X91.753 Y60.076 E.37279
G1 X91.102 Y60.076 E.0234
G1 X84.424 Y53.398 E.33969
G1 X84.424 Y54.048 E.0234
G1 X90.452 Y60.076 E.30659
G1 X89.801 Y60.076 E.0234
G1 X84.424 Y54.699 E.2735
G1 X84.424 Y55.35 E.0234
G1 X89.15 Y60.076 E.2404
G1 X88.499 Y60.076 E.0234
G1 X84.424 Y56.001 E.2073
G1 X84.424 Y56.651 E.0234
G1 X87.849 Y60.076 E.1742
G1 X87.198 Y60.076 E.0234
G1 X83.995 Y56.874 E.16289
G1 X83.424 Y56.874 E.02055
G1 X83.424 Y56.953 E.00286
G1 X86.547 Y60.076 E.15884
G1 X85.896 Y60.076 E.0234
G1 X83.424 Y57.604 E.12574
G1 X83.424 Y58.255 E.02341
G1 X85.246 Y60.076 E.09264
G1 X84.595 Y60.076 E.0234
G1 X83.424 Y58.906 E.05954
G1 X83.425 Y59.557 E.02341
G1 X84.15 Y60.282 E.03689
; WIPE_START
G1 X83.443 Y59.575 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.894 J.826 P1  F42000
G1 X104.652 Y36.616 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126452
G1 F3000
M204 S500
G1 X104.72 Y36.484 E.00097
G1 X104.819 Y36.437 E.00072
M204 S6000
G1 X105.482 Y36.478 F42000
; LINE_WIDTH: 0.441745
G1 F3000
M204 S500
G1 X105.616 Y36.218 E.00912
; LINE_WIDTH: 0.475649
G1 X105.624 Y36.202 E.00061
G1 X105.725 Y36.19 E.00343
; LINE_WIDTH: 0.440669
G1 X105.87 Y36.178 E.00453
G1 X106.376 Y36.343 E.01655
M204 S6000
G1 X106.413 Y36.375 F42000
; LINE_WIDTH: 0.339071
G1 F3000
M204 S500
G1 X105.342 Y35.98 E.02642
M204 S6000
G1 X105.657 Y35.98 F42000
; LINE_WIDTH: 0.111338
G1 F3000
M204 S500
G3 X106.448 Y36.437 I-8.64 J15.841 E.00489
M204 S6000
G1 X106.452 Y36.431 F42000
; LINE_WIDTH: 0.159043
G1 F3000
M204 S500
G1 X105.571 Y35.98 E.00899
M204 S6000
G1 X105.466 Y35.98 F42000
; LINE_WIDTH: 0.224468
G1 F3000
M204 S500
G1 X106.46 Y36.419 E.01541
; WIPE_START
G1 X105.545 Y36.014 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.629 J1.042 P1  F42000
G1 X107.52 Y37.207 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.111301
G1 F3000
M204 S500
G3 X107.051 Y37.975 I-14.843 J-8.553 E.00481
M204 S6000
G1 X107.057 Y37.978 F42000
; LINE_WIDTH: 0.159027
G1 F3000
M204 S500
G1 X107.52 Y37.129 E.00878
M204 S6000
G1 X107.52 Y37.044 F42000
; LINE_WIDTH: 0.22016
G1 F3000
M204 S500
G1 X107.067 Y37.985 E.01446
M204 S6000
G1 X107.098 Y37.96 F42000
; LINE_WIDTH: 0.296497
G1 F3000
M204 S500
G1 X107.52 Y36.957 E.02157
M204 S6000
G1 X107.267 Y36.901 F42000
; LINE_WIDTH: 0.467622
G1 F3000
M204 S500
G3 X107.322 Y37.407 I-3.753 J.67 E.0169
; LINE_WIDTH: 0.417471
G1 X107.305 Y37.459 E.00161
; LINE_WIDTH: 0.389338
G1 X107.14 Y37.912 E.01307
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X107.305 Y37.459 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 2/5
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I-1.215 J-.066 P1  F42000
G1 X103.289 Y111.592 Z.6
G1 Z.36
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P37 R4
G1 F11728.231
M204 S6000
G2 X103.287 Y113.8 I2.79 J1.107 E.05876
G2 X105.727 Y117.814 I2.721 J1.095 E.1416
G1 X105.727 Y142.227 E.63451
G1 X74.273 Y142.227 E.81751
G1 X74.273 Y133.473 E.22751
G1 X75.273 Y133.473 E.02599
G1 X75.273 Y119.527 E.36249
G1 X74.273 Y119.527 E.02599
G1 X74.273 Y110.773 E.22751
G1 X103.081 Y110.774 E.74874
G2 X103.268 Y111.536 I3.334 J-.414 E.02045
M204 S10000
G1 X103.746 Y111.599 F42000
G1 F11728.231
M204 S6000
G2 X103.746 Y113.8 I2.264 J1.101 E.0592
G2 X106.142 Y117.403 I2.255 J1.099 E.13564
G1 X106.142 Y142.642 E.656
G1 X73.858 Y142.642 E.83912
G1 X73.858 Y133.058 E.24912
G1 X74.858 Y133.058 E.02599
G1 X74.858 Y119.942 E.34088
G1 X73.858 Y119.942 E.02599
G1 X73.858 Y110.358 E.24912
G1 X103.496 Y110.358 E.77033
G2 X103.72 Y111.545 I2.435 J.154 E.03173
M204 S10000
G1 X104.217 Y111.606 F42000
G1 F11728.231
M204 S6000
G2 X104.22 Y113.8 I1.789 J1.094 E.06002
G2 X106.208 Y116.983 I1.795 J1.092 E.12063
G1 X106.558 Y116.931 E.00919
G1 X106.558 Y143.058 E.67908
G1 X73.442 Y143.058 E.86072
G1 X73.442 Y132.642 E.27072
G1 X74.442 Y132.642 E.02599
G1 X74.442 Y120.358 E.31927
G1 X73.442 Y120.358 E.02599
G1 X73.442 Y109.942 E.27073
G1 X103.982 Y109.943 E.79377
G2 X104.188 Y111.554 I2.174 J.541 E.04319
M204 S10000
G1 X104.731 Y111.595 F42000
G1 F11728.231
M204 S6000
G2 X104.727 Y113.8 I1.298 J1.104 E.06231
G2 X106.651 Y116.446 I1.283 J1.09 E.11664
G1 X106.974 Y116.291 E.0093
G1 X106.974 Y143.474 E.70651
G1 X73.026 Y143.474 E.88233
G1 X73.026 Y132.226 E.29233
G1 X74.026 Y132.226 E.02599
G1 X74.026 Y120.774 E.29767
G1 X73.026 Y120.774 E.02599
G1 X73.026 Y109.526 E.29233
G1 X104.627 Y109.527 E.82134
G2 X104.692 Y111.549 I1.393 J.967 E.05635
M204 S10000
G1 X105.358 Y111.606 F42000
G1 F11728.231
M204 S6000
G2 X105.366 Y113.8 I.661 J1.095 E.06855
G2 X107.192 Y115.32 I.636 J1.094 E.12635
G1 X107.389 Y115.363 E.00523
G1 X107.389 Y143.485 E.73092
G3 X106.985 Y143.889 I-.396 J.009 E.01662
G1 X73.015 Y143.889 E.8829
G3 X72.611 Y143.485 I-.009 J-.396 E.01662
G1 X72.611 Y131.811 E.30342
G1 X73.611 Y131.811 E.02599
G1 X73.611 Y121.189 E.27606
G1 X72.611 Y121.189 E.02599
G1 X72.611 Y109.515 E.30342
M73 P38 R4
G3 X73.015 Y109.111 I.396 J-.009 E.01662
G1 X105.533 Y109.111 E.84517
G1 X105.577 Y109.305 E.00517
G2 X105.142 Y111.425 I.442 J1.195 E.06717
G1 X105.312 Y111.567 E.00576
M204 S250
G1 X106.085 Y111.355 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.914 Y109.644 I-.086 J-.855 E.06516
G1 X105.99 Y109.64 E.00183
G3 X106.145 Y111.347 I.009 J.86 E.06182
; WIPE_START
M204 S6000
G1 X105.914 Y111.356 E-.08764
G1 X105.708 Y111.309 E-.08037
G1 X105.481 Y111.186 E-.09844
G1 X105.355 Y111.069 E-.06508
G1 X105.281 Y110.966 E-.04847
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I.516 J1.102 P1  F42000
G1 X107.186 Y110.074 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X106.424 Y109.311 I-1.197 J.434 E.02895
G1 X106.464 Y109.111 E.0053
G1 X107.013 Y109.111 E.01427
G1 X107.035 Y109.113 E.00056
G3 X107.389 Y109.515 I-.037 J.39 E.01536
G1 X107.389 Y110.036 E.01353
G1 X107.245 Y110.063 E.00381
; WIPE_START
G1 X107.024 Y109.764 E-.14152
G1 X106.858 Y109.575 E-.09542
G1 X106.658 Y109.424 E-.09542
G1 X106.545 Y109.369 E-.04764
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.216 J.053 P1  F42000
G1 X106.642 Y111.594 Z.76
G1 Z.36
G1 E.4 F1800
G1 F11728.231
M204 S6000
G2 X107.192 Y110.92 I-.813 J-1.226 E.02295
G1 X107.389 Y110.963 E.00524
G1 X107.389 Y112.236 E.03309
G1 X107.186 Y112.274 E.00537
G2 X106.691 Y111.629 I-1.404 J.565 E.02141
; WIPE_START
G1 X106.811 Y111.466 E-.0768
G1 X106.986 Y111.286 E-.09555
G1 X107.123 Y111.075 E-.09551
G1 X107.192 Y110.92 E-.06454
G1 X107.315 Y110.947 E-.04759
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.039 J-.633 P1  F42000
G1 X105.747 Y113.521 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.914 Y111.844 I.252 J-.822 E.0569
G1 X105.99 Y111.84 E.00183
G3 X105.805 Y113.537 I.009 J.86 E.07008
M204 S10000
G1 X106.642 Y113.794 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X107.192 Y113.12 I-.813 J-1.226 E.02295
G1 X107.389 Y113.163 E.00524
G1 X107.389 Y114.436 E.03309
G1 X107.186 Y114.474 E.00537
G2 X106.691 Y113.829 I-1.405 J.566 E.02141
M204 S250
G1 X106.448 Y114.167 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.914 Y114.044 I-.449 J.733 E.1168
G1 X105.99 Y114.04 E.00183
G3 X106.396 Y114.137 I.009 J.86 E.01018
; WIPE_START
M204 S6000
G1 X106.585 Y114.269 E-.08763
G1 X106.698 Y114.398 E-.06507
G1 X106.784 Y114.546 E-.06514
G1 X106.839 Y114.708 E-.06504
G1 X106.86 Y114.879 E-.06518
G1 X106.854 Y114.962 E-.03193
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-.534 J-1.093 P1  F42000
G1 X73.21 Y131.41 Z.76
G1 Z.36
G1 E.4 F1800
G1 F12000
M204 S5000
G1 X73.21 Y121.59 E.23681
G1 X72.21 Y121.59 E.02412
G1 X72.21 Y109.505 E.29142
G3 X73.005 Y108.71 I.8 J.004 E.03008
G1 X107.025 Y108.711 E.8204
G3 X107.79 Y109.505 I-.035 J.799 E.02934
G1 X107.79 Y143.495 E.81966
G3 X106.995 Y144.29 I-.8 J-.004 E.03008
G1 X73.005 Y144.29 E.81966
G3 X72.21 Y143.495 I.004 J-.8 E.03008
G1 X72.21 Y131.41 E.29142
G1 X73.15 Y131.41 E.02267
; WIPE_START
M204 S6000
G1 X73.156 Y130.41 E-.38
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

G1 X75.44 Y133.135
G1 Z.36
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420856
G1 F12612.543
M204 S6000
G1 X97.46 Y111.114 E.75265
G1 X96.914 Y111.114 E.01321
G1 X75.614 Y132.414 E.72803
G1 X75.614 Y131.868 E.01321
G1 X96.367 Y111.114 E.70935
G1 X95.821 Y111.114 E.01321
G1 X75.614 Y131.321 E.69067
G1 X75.614 Y130.775 E.01321
G1 X95.274 Y111.114 E.67198
G1 X94.727 Y111.114 E.01321
G1 X75.614 Y130.228 E.6533
G1 X75.614 Y129.681 E.01321
G1 X94.181 Y111.114 E.63462
G1 X93.634 Y111.114 E.01321
G1 X75.614 Y129.135 E.61594
G1 X75.614 Y128.588 E.01321
G1 X93.088 Y111.114 E.59725
G1 X92.541 Y111.114 E.01321
G1 X75.614 Y128.041 E.57857
G1 X75.614 Y127.495 E.01321
G1 X91.994 Y111.114 E.55989
M73 P39 R4
G1 X91.448 Y111.114 E.01321
G1 X75.614 Y126.948 E.5412
G1 X75.614 Y126.402 E.01321
G1 X90.901 Y111.114 E.52252
G1 X90.355 Y111.114 E.01321
G1 X75.614 Y125.855 E.50384
G1 X75.614 Y125.308 E.01321
G1 X89.808 Y111.114 E.48515
G1 X89.261 Y111.114 E.01321
G1 X75.614 Y124.762 E.46647
G1 X75.614 Y124.215 E.01321
G1 X88.715 Y111.114 E.44779
G1 X88.168 Y111.114 E.01321
G1 X75.614 Y123.668 E.42911
G1 X75.614 Y123.122 E.01321
G1 X87.621 Y111.114 E.41042
G1 X87.075 Y111.114 E.01321
G1 X75.614 Y122.575 E.39174
G1 X75.614 Y122.029 E.01321
G1 X86.528 Y111.114 E.37306
G1 X85.982 Y111.114 E.01321
G1 X75.614 Y121.482 E.35437
G1 X75.614 Y120.935 E.01321
G1 X85.435 Y111.114 E.33569
G1 X84.888 Y111.114 E.01321
G1 X75.614 Y120.389 E.31701
G1 X75.614 Y119.842 E.01321
G1 X84.342 Y111.114 E.29833
G1 X83.795 Y111.114 E.01321
G1 X75.614 Y119.295 E.27964
G1 X75.614 Y119.186 E.00264
G1 X75.176 Y119.186 E.01057
G1 X83.249 Y111.114 E.27591
G1 X82.702 Y111.114 E.01321
G1 X74.63 Y119.186 E.27591
G1 X74.614 Y119.186 E.00039
G1 X74.614 Y118.656 E.01283
G1 X82.155 Y111.114 E.25777
G1 X81.609 Y111.114 E.01321
G1 X74.614 Y118.109 E.23909
G1 X74.614 Y117.562 E.01321
G1 X81.062 Y111.114 E.22041
G1 X80.516 Y111.114 E.01321
G1 X74.614 Y117.016 E.20172
G1 X74.614 Y116.469 E.01321
G1 X79.969 Y111.114 E.18304
G1 X79.422 Y111.114 E.01321
G1 X74.614 Y115.923 E.16436
G1 X74.614 Y115.376 E.01321
G1 X78.876 Y111.114 E.14568
G1 X78.329 Y111.114 E.01321
G1 X74.614 Y114.829 E.12699
G1 X74.614 Y114.283 E.01321
G1 X77.783 Y111.114 E.10831
G1 X77.236 Y111.114 E.01321
G1 X74.614 Y113.736 E.08963
G1 X74.614 Y113.189 E.01321
G1 X76.689 Y111.114 E.07094
G1 X76.143 Y111.114 E.01321
G1 X74.614 Y112.643 E.05226
G1 X74.614 Y112.096 E.01321
G1 X75.596 Y111.114 E.03358
G1 X75.049 Y111.114 E.01321
G1 X74.44 Y111.723 E.02083
; WIPE_START
G1 X75.049 Y111.114 E-.32746
G1 X75.188 Y111.114 E-.05255
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.217 J-.014 P1  F42000
G1 X74.934 Y133.64 Z.76
G1 Z.36
G1 E.4 F1800
G1 F12612.543
M204 S6000
G1 X74.614 Y133.961 E.01096
G1 X74.614 Y134.508 E.01321
G1 X98.007 Y111.114 E.79958
G1 X98.554 Y111.114 E.01321
G1 X74.614 Y135.054 E.81826
G1 X74.614 Y135.601 E.01321
G1 X99.1 Y111.114 E.83694
G1 X99.647 Y111.114 E.01321
G1 X74.614 Y136.148 E.85563
G1 X74.614 Y136.694 E.01321
G1 X100.193 Y111.114 E.87431
G1 X100.74 Y111.114 E.01321
G1 X74.614 Y137.241 E.89299
M73 P40 R4
G1 X74.614 Y137.787 E.01321
G1 X101.287 Y111.114 E.91168
G1 X101.833 Y111.114 E.01321
G1 X74.614 Y138.334 E.93036
G1 X74.614 Y138.881 E.01321
G1 X102.38 Y111.114 E.94904
G1 X102.795 Y111.114 E.01003
G1 X102.815 Y111.226 E.00274
G1 X74.614 Y139.427 E.96391
G1 X74.614 Y139.974 E.01321
G1 X102.897 Y111.691 E.96671
G2 X102.751 Y112.383 I3.208 J1.036 E.01713
G1 X74.614 Y140.52 E.96173
G1 X74.614 Y141.067 E.01321
G1 X102.745 Y112.936 E.96151
G2 X102.815 Y113.412 I2.014 J-.055 E.01166
G1 X74.614 Y141.614 E.96393
G1 X74.614 Y141.886 E.00659
G1 X74.888 Y141.886 E.00662
G1 X102.904 Y113.87 E.95758
G2 X102.753 Y114.567 I3.157 J1.047 E.01727
G1 X75.434 Y141.886 E.93375
G1 X75.981 Y141.886 E.01321
G1 X102.745 Y115.123 E.91477
G2 X102.811 Y115.603 I2.429 J-.089 E.01174
G1 X76.528 Y141.886 E.89835
G1 X77.074 Y141.886 E.01321
G1 X102.936 Y116.025 E.88395
G2 X103.104 Y116.403 I1.977 J-.65 E.01003
G1 X77.621 Y141.886 E.871
G1 X78.167 Y141.886 E.01321
G1 X103.308 Y116.746 E.85929
G2 X103.545 Y117.055 I1.664 J-1.032 E.00944
G1 X78.714 Y141.886 E.84872
G1 X79.261 Y141.886 E.01321
G1 X103.818 Y117.329 E.83937
G2 X104.124 Y117.57 I1.365 J-1.414 E.00942
G1 X79.807 Y141.886 E.83113
G1 X80.354 Y141.886 E.01321
G1 X104.463 Y117.778 E.82403
G2 X104.837 Y117.95 I.903 J-1.474 E.00999
G1 X80.901 Y141.886 E.81815
G1 X81.447 Y141.886 E.01321
G1 X105.256 Y118.078 E.81378
M73 P41 R4
G2 X105.386 Y118.107 I.214 J-.636 E.00324
G1 X105.386 Y118.494 E.00934
G1 X81.994 Y141.886 E.79955
G1 X82.54 Y141.886 E.01321
G1 X105.386 Y119.04 E.78087
G1 X105.386 Y119.587 E.01321
G1 X83.087 Y141.886 E.76218
G1 X83.634 Y141.886 E.01321
G1 X105.386 Y120.134 E.7435
G1 X105.386 Y120.68 E.01321
G1 X84.18 Y141.886 E.72482
G1 X84.727 Y141.886 E.01321
G1 X105.386 Y121.227 E.70613
G1 X105.386 Y121.774 E.01321
G1 X85.274 Y141.886 E.68745
G1 X85.82 Y141.886 E.01321
G1 X105.386 Y122.32 E.66876
G1 X105.386 Y122.867 E.01321
G1 X86.367 Y141.886 E.65008
G1 X86.913 Y141.886 E.01321
G1 X105.386 Y123.413 E.6314
G1 X105.386 Y123.96 E.01321
G1 X87.46 Y141.886 E.61271
G1 X88.007 Y141.886 E.01321
G1 X105.386 Y124.507 E.59403
G1 X105.386 Y125.053 E.01321
G1 X88.553 Y141.886 E.57535
G1 X89.1 Y141.886 E.01321
G1 X105.386 Y125.6 E.55666
G1 X105.386 Y126.147 E.01321
G1 X89.647 Y141.886 E.53798
G1 X90.193 Y141.886 E.01321
G1 X105.386 Y126.693 E.5193
G1 X105.386 Y127.24 E.01321
G1 X90.74 Y141.886 E.50061
G1 X91.286 Y141.886 E.01321
G1 X105.386 Y127.786 E.48193
G1 X105.386 Y128.333 E.01321
G1 X91.833 Y141.886 E.46325
G1 X92.38 Y141.886 E.01321
G1 X105.386 Y128.88 E.44456
G1 X105.386 Y129.426 E.01321
G1 X92.926 Y141.886 E.42588
G1 X93.473 Y141.886 E.01321
G1 X105.386 Y129.973 E.4072
G1 X105.386 Y130.52 E.01321
G1 X94.02 Y141.886 E.38851
G1 X94.566 Y141.886 E.01321
G1 X105.386 Y131.066 E.36983
G1 X105.386 Y131.613 E.01321
G1 X95.113 Y141.886 E.35115
G1 X95.659 Y141.886 E.01321
G1 X105.386 Y132.159 E.33246
G1 X105.386 Y132.706 E.01321
G1 X96.206 Y141.886 E.31378
G1 X96.753 Y141.886 E.01321
G1 X105.386 Y133.253 E.2951
M73 P42 R4
G1 X105.386 Y133.799 E.01321
G1 X97.299 Y141.886 E.27641
G1 X97.846 Y141.886 E.01321
G1 X105.386 Y134.346 E.25773
G1 X105.386 Y134.892 E.01321
G1 X98.392 Y141.886 E.23905
G1 X98.939 Y141.886 E.01321
G1 X105.386 Y135.439 E.22036
G1 X105.386 Y135.986 E.01321
G1 X99.486 Y141.886 E.20168
G1 X100.032 Y141.886 E.01321
G1 X105.386 Y136.532 E.183
G1 X105.386 Y137.079 E.01321
G1 X100.579 Y141.886 E.16431
G1 X101.126 Y141.886 E.01321
G1 X105.386 Y137.626 E.14563
G1 X105.386 Y138.172 E.01321
G1 X101.672 Y141.886 E.12695
G1 X102.219 Y141.886 E.01321
G1 X105.386 Y138.719 E.10826
G1 X105.386 Y139.265 E.01321
G1 X102.765 Y141.886 E.08958
G1 X103.312 Y141.886 E.01321
G1 X105.386 Y139.812 E.0709
G1 X105.386 Y140.359 E.01321
G1 X103.859 Y141.886 E.05221
G1 X104.405 Y141.886 E.01321
G1 X105.386 Y140.905 E.03353
G1 X105.386 Y141.452 E.01321
G1 X104.778 Y142.06 E.02078
; WIPE_START
G1 X105.386 Y141.452 E-.32669
G1 X105.386 Y141.312 E-.05331
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I1.215 J.076 P1  F42000
G1 X106.963 Y116.039 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105724
G1 F18000
M204 S6000
G1 X107.082 Y115.959 E.00064
; LINE_WIDTH: 0.134363
G1 X107.182 Y115.883 E.00078
; WIPE_START
G1 X107.082 Y115.959 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I.995 J-.7 P1  F42000
G1 X105.623 Y113.885 Z.76
G1 Z.36
G1 E.4 F1800
; LINE_WIDTH: 0.100295
G1 F18000
M204 S6000
G1 X105.723 Y113.834 E.00046
; LINE_WIDTH: 0.145193
G3 X105.774 Y113.8 I.045 J.013 E.00046
; LINE_WIDTH: 0.126316
G1 X106.108 Y113.801 E.00192
; LINE_WIDTH: 0.145342
G1 X106.253 Y113.8 E.00101
M204 S10000
G1 X106.157 Y113.748 F42000
; LINE_WIDTH: 0.097838
G1 F18000
M204 S6000
G3 X106.427 Y113.905 I-3.04 J5.517 E.00124
M204 S10000
G1 X106.424 Y113.91 F42000
; LINE_WIDTH: 0.144986
G1 F18000
M204 S6000
G1 X106.253 Y113.8 E.00141
G1 X106.276 Y113.778 E.00022
; LINE_WIDTH: 0.125026
G1 X106.298 Y113.756 E.00018
; LINE_WIDTH: 0.0966307
G1 X106.376 Y113.715 E.00035
; WIPE_START
G1 X106.298 Y113.756 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I1.19 J-.256 P1  F42000
G1 X105.845 Y111.652 Z.76
G1 Z.36
G1 E.4 F1800
; LINE_WIDTH: 0.0991515
G1 F18000
M204 S6000
G3 X105.573 Y111.495 I2.44 J-4.532 E.00127
M204 S10000
G1 X105.59 Y111.477 F42000
; LINE_WIDTH: 0.156878
G1 F18000
M204 S6000
G1 X105.768 Y111.6 E.00166
; LINE_WIDTH: 0.126975
G1 X106.108 Y111.601 E.00197
; LINE_WIDTH: 0.152761
G1 X106.335 Y111.598 E.00168
M204 S10000
G1 X106.376 Y111.515 F42000
; LINE_WIDTH: 0.0966184
G1 F18000
M204 S6000
G1 X106.298 Y111.556 E.00034
; LINE_WIDTH: 0.124998
G1 X106.276 Y111.578 E.00018
; LINE_WIDTH: 0.145004
G1 X106.253 Y111.6 E.00022
G1 X106.424 Y111.71 E.00141
M204 S10000
G1 X106.427 Y111.705 F42000
; LINE_WIDTH: 0.0978469
G1 F18000
M204 S6000
G2 X106.157 Y111.548 I-3.17 J5.13 E.00124
; WIPE_START
G1 X106.427 Y111.705 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I1.15 J.398 P1  F42000
G1 X107.164 Y109.576 Z.76
G1 Z.36
G1 E.4 F1800
; LINE_WIDTH: 0.104759
G1 F18000
M204 S6000
G1 X107.134 Y109.497 E.00037
; LINE_WIDTH: 0.144529
G1 X107.112 Y109.454 E.00033
G2 X106.907 Y109.319 I-.295 J.227 E.00172
; WIPE_START
G1 X107.04 Y109.383 E-.18916
G1 X107.112 Y109.454 E-.12912
G1 X107.134 Y109.497 E-.06172
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I.094 J-1.213 P1  F42000
G1 X105.073 Y109.338 Z.76
G1 Z.36
G1 E.4 F1800
; LINE_WIDTH: 0.100644
G1 F18000
M204 S6000
G1 X105.011 Y109.36 E.00028
G1 X104.936 Y109.454 E.0005
; WIPE_START
G1 X105.011 Y109.36 E-.24442
G1 X105.073 Y109.338 E-.13558
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I1.216 J.036 P1  F42000
G1 X106.085 Y75.055 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.914 Y73.344 I-.087 J-.855 E.06516
G1 X105.99 Y73.34 E.00183
G3 X106.145 Y75.047 I.009 J.86 E.06182
; WIPE_START
M204 S6000
G1 X105.914 Y75.056 E-.08767
G1 X105.747 Y75.022 E-.06508
G1 X105.48 Y74.886 E-.1136
G1 X105.355 Y74.769 E-.06507
G1 X105.28 Y74.665 E-.04858
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I.92 J.797 P1  F42000
G1 X106.642 Y73.094 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X107.192 Y72.42 I-.813 J-1.226 E.02295
G1 X107.389 Y72.463 E.00524
G1 X107.389 Y73.736 E.03309
G1 X107.186 Y73.774 E.00537
G2 X106.691 Y73.129 I-1.405 J.566 E.02141
; WIPE_START
G1 X106.811 Y72.966 E-.07687
G1 X106.986 Y72.786 E-.09552
G1 X107.122 Y72.575 E-.09541
G1 X107.192 Y72.42 E-.06463
G1 X107.315 Y72.447 E-.04757
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I1.204 J-.177 P1  F42000
G1 X107.186 Y71.574 Z.76
G1 Z.36
G1 E.4 F1800
G1 F11728.231
M204 S6000
G2 X106.424 Y70.811 I-1.197 J.434 E.02895
G1 X106.464 Y70.611 E.0053
G1 X107.013 Y70.611 E.01427
G1 X107.035 Y70.613 E.00056
G3 X107.389 Y71.015 I-.037 J.39 E.01536
G1 X107.389 Y71.536 E.01353
G1 X107.245 Y71.563 E.00381
; WIPE_START
G1 X107.024 Y71.264 E-.14149
G1 X106.858 Y71.075 E-.0954
G1 X106.658 Y70.924 E-.09533
G1 X106.545 Y70.869 E-.04778
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.186 J-.274 P1  F42000
G1 X106.085 Y72.855 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.914 Y71.144 I-.087 J-.855 E.06516
G1 X105.99 Y71.14 E.00183
G3 X106.145 Y72.847 I.009 J.86 E.06182
; WIPE_START
M204 S6000
G1 X105.914 Y72.856 E-.08766
G1 X105.747 Y72.822 E-.06486
G1 X105.48 Y72.686 E-.11382
G1 X105.355 Y72.569 E-.06507
G1 X105.28 Y72.465 E-.04859
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-.365 J-1.161 P1  F42000
G1 X103.289 Y73.092 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X105.727 Y77.114 I2.719 J1.102 E.14181
G1 X105.727 Y99.227 E.57473
G1 X78.774 Y99.227 E.70052
G1 X78.774 Y92.723 E.16903
G1 X79.773 Y92.723 E.02598
G1 X79.773 Y78.777 E.36249
G1 X78.774 Y78.777 E.02598
G1 X78.774 Y72.273 E.16903
G1 X103.081 Y72.274 E.63175
G2 X103.268 Y73.036 I3.332 J-.413 E.02045
M204 S10000
G1 X103.746 Y73.099 F42000
G1 F11728.231
M204 S6000
G2 X106.142 Y76.703 I2.254 J1.099 E.13566
G1 X106.142 Y99.642 E.59622
G1 X78.359 Y99.642 E.72213
G1 X78.358 Y92.308 E.19064
G1 X79.358 Y92.308 E.02598
M73 P43 R4
G1 X79.358 Y79.192 E.34088
G1 X78.358 Y79.192 E.02598
G1 X78.359 Y71.858 E.19064
G1 X103.496 Y71.858 E.65334
G2 X103.72 Y73.045 I2.435 J.154 E.03173
M204 S10000
G1 X104.217 Y73.106 F42000
G1 F11728.231
M204 S6000
G2 X106.208 Y76.283 I1.798 J1.086 E.12045
G1 X106.558 Y76.231 E.00919
G1 X106.558 Y100.058 E.6193
G1 X77.943 Y100.058 E.74373
G1 X77.942 Y91.892 E.21224
G1 X78.942 Y91.892 E.02599
G1 X78.942 Y79.608 E.31927
G1 X77.942 Y79.608 E.02599
G1 X77.943 Y71.442 E.21224
G1 X103.982 Y71.443 E.67678
G2 X104.188 Y73.054 I2.174 J.541 E.04319
M204 S10000
G1 X104.731 Y73.095 F42000
G1 F11728.231
M204 S6000
G2 X106.651 Y75.746 I1.279 J1.094 E.11679
G1 X106.974 Y75.591 E.00929
G1 X106.974 Y100.474 E.64673
G1 X77.528 Y100.474 E.76534
G1 X77.526 Y91.476 E.23385
G1 X78.526 Y91.476 E.02599
G1 X78.526 Y80.024 E.29767
G1 X77.526 Y80.024 E.02599
G1 X77.527 Y71.026 E.23385
G1 X104.627 Y71.027 E.70435
G2 X104.692 Y73.049 I1.392 J.967 E.05635
M204 S10000
G1 X105.358 Y73.106 F42000
G1 F11728.231
M204 S6000
G2 X107.192 Y74.62 I.643 J1.089 E.12608
G1 X107.389 Y74.663 E.00524
G1 X107.389 Y100.485 E.67114
G3 X106.985 Y100.889 I-.396 J.009 E.01662
G1 X77.515 Y100.889 E.76594
G3 X77.112 Y100.519 I-.012 J-.391 E.01577
G1 X77.111 Y91.061 E.24583
G1 X78.111 Y91.061 E.02599
G1 X78.111 Y80.439 E.27606
G1 X77.111 Y80.439 E.02599
G1 X77.12 Y70.92 E.24742
G3 X77.515 Y70.611 I.388 J.088 E.01413
G1 X105.533 Y70.611 E.72821
G1 X105.577 Y70.805 E.00517
G2 X105.142 Y72.925 I.442 J1.195 E.06717
G1 X105.312 Y73.067 E.00576
; WIPE_START
G1 X105.097 Y73.319 E-.1258
G1 X104.94 Y73.516 E-.09553
G1 X104.878 Y73.624 E-.0477
G1 X104.786 Y73.858 E-.09546
G1 X104.779 Y73.898 E-.01551
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-.641 J-1.035 P1  F42000
G1 X77.71 Y90.66 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X77.71 Y80.84 E.23681
G1 X76.71 Y80.84 E.02411
G1 X76.711 Y70.961 E.23822
G3 X77.505 Y70.21 I.799 J.049 E.02903
G1 X107.025 Y70.211 E.71188
G3 X107.79 Y71.005 I-.035 J.799 E.02934
G1 X107.79 Y100.495 E.71114
G3 X106.995 Y101.29 I-.8 J-.004 E.03008
G1 X77.505 Y101.29 E.71114
G3 X76.711 Y100.539 I-.003 J-.793 E.02909
G1 X76.71 Y90.66 E.23822
G1 X77.65 Y90.66 E.02267
; WIPE_START
M204 S6000
G1 X77.656 Y89.66 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.041 J.631 P1  F42000
G1 X79.614 Y92.89 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422986
G1 F12543.42
M204 S6000
G1 X78.941 Y93.564 E.02316
; WIPE_START
G1 X79.614 Y92.89 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I1.217 J.007 P1  F42000
G1 X79.728 Y72.44 Z.76
G1 Z.36
M73 P44 R4
G1 E.4 F1800
G1 F12543.42
M204 S6000
G1 X79.115 Y73.053 E.02108
G1 X79.115 Y73.603 E.01336
G1 X80.104 Y72.614 E.034
G1 X80.654 Y72.614 E.01336
G1 X79.115 Y74.153 E.0529
G1 X79.114 Y74.703 E.01336
G1 X81.203 Y72.614 E.07179
G1 X81.753 Y72.614 E.01336
G1 X79.114 Y75.252 E.09068
G1 X79.114 Y75.802 E.01336
G1 X82.302 Y72.614 E.10957
G1 X82.852 Y72.614 E.01336
G1 X79.114 Y76.352 E.12846
G1 X79.114 Y76.901 E.01336
G1 X83.402 Y72.614 E.14735
G1 X83.951 Y72.614 E.01336
G1 X79.114 Y77.451 E.16625
G1 X79.114 Y78.001 E.01336
G1 X84.501 Y72.614 E.18514
G1 X85.051 Y72.614 E.01336
G1 X79.228 Y78.436 E.2001
G1 X79.778 Y78.436 E.01336
G1 X85.6 Y72.614 E.2001
G1 X86.15 Y72.614 E.01336
G1 X80.114 Y78.65 E.20745
G1 X80.114 Y79.2 E.01336
G1 X86.699 Y72.614 E.22634
G1 X87.249 Y72.614 E.01336
G1 X80.114 Y79.749 E.24523
G1 X80.114 Y80.299 E.01336
G1 X87.799 Y72.614 E.26412
G1 X88.348 Y72.614 E.01336
G1 X80.114 Y80.849 E.28301
G1 X80.114 Y81.398 E.01336
G1 X88.898 Y72.614 E.3019
G1 X89.448 Y72.614 E.01336
G1 X80.114 Y81.948 E.32079
G1 X80.114 Y82.497 E.01336
G1 X89.997 Y72.614 E.33968
G1 X90.547 Y72.614 E.01336
G1 X80.114 Y83.047 E.35856
G1 X80.114 Y83.597 E.01336
G1 X91.096 Y72.614 E.37745
G1 X91.646 Y72.614 E.01336
G1 X80.114 Y84.146 E.39634
G1 X80.114 Y84.696 E.01336
G1 X92.196 Y72.614 E.41523
G1 X92.745 Y72.614 E.01336
G1 X80.114 Y85.246 E.43412
G1 X80.114 Y85.795 E.01336
G1 X93.295 Y72.614 E.45301
G1 X93.844 Y72.614 E.01336
G1 X80.114 Y86.345 E.4719
G1 X80.114 Y86.895 E.01336
G1 X94.394 Y72.614 E.49079
G1 X94.944 Y72.614 E.01336
G1 X80.114 Y87.444 E.50968
G1 X80.114 Y87.994 E.01336
G1 X95.493 Y72.614 E.52857
G1 X96.043 Y72.614 E.01336
G1 X80.114 Y88.543 E.54746
G1 X80.114 Y89.093 E.01336
G1 X96.593 Y72.614 E.56635
G1 X97.142 Y72.614 E.01336
G1 X80.114 Y89.643 E.58524
G1 X80.114 Y90.192 E.01336
G1 X97.692 Y72.614 E.60413
G1 X98.241 Y72.614 E.01336
G1 X80.114 Y90.742 E.62302
G1 X80.114 Y91.292 E.01336
G1 X98.791 Y72.614 E.6419
G1 X99.341 Y72.614 E.01336
G1 X80.114 Y91.841 E.66079
G1 X80.114 Y92.391 E.01336
G1 X99.89 Y72.614 E.67968
G1 X100.44 Y72.614 E.01336
G1 X79.114 Y93.94 E.73293
G1 X79.114 Y94.49 E.01336
G1 X100.99 Y72.614 E.75181
M73 P45 R4
G1 X101.539 Y72.614 E.01336
G1 X79.114 Y95.039 E.7707
G1 X79.114 Y95.589 E.01336
G1 X102.089 Y72.614 E.78959
G1 X102.638 Y72.614 E.01336
G1 X79.114 Y96.138 E.80847
G1 X79.114 Y96.688 E.01336
G1 X102.878 Y72.925 E.81669
G1 X102.931 Y73.09 E.00422
G2 X102.801 Y73.551 I2.225 J.874 E.01165
G1 X79.115 Y97.237 E.81407
G1 X79.115 Y97.787 E.01336
G1 X102.737 Y74.165 E.81185
G2 X102.771 Y74.68 I3.55 J.022 E.01256
G1 X79.115 Y98.337 E.81303
G1 X79.115 Y98.886 E.01336
G1 X102.872 Y75.129 E.81648
G2 X103.018 Y75.533 I2.092 J-.529 E.01045
G1 X79.664 Y98.886 E.80262
G1 X80.214 Y98.886 E.01336
G1 X103.208 Y75.892 E.79028
G2 X103.434 Y76.216 I1.733 J-.967 E.00961
G1 X80.764 Y98.886 E.77914
G1 X81.313 Y98.886 E.01336
G1 X103.692 Y76.507 E.76913
G2 X103.982 Y76.767 I1.446 J-1.325 E.00948
G1 X81.863 Y98.886 E.76021
G1 X82.412 Y98.886 E.01336
G1 X104.305 Y76.994 E.75241
G2 X104.666 Y77.182 I.931 J-1.345 E.00993
G1 X82.962 Y98.886 E.74594
G1 X83.512 Y98.886 E.01336
G1 X105.068 Y77.33 E.74086
G2 X105.386 Y77.407 I.547 J-1.551 E.00797
G1 X105.386 Y77.561 E.00374
G1 X84.061 Y98.886 E.7329
G1 X84.611 Y98.886 E.01336
G1 X105.386 Y78.111 E.71401
G1 X105.386 Y78.661 E.01336
G1 X85.161 Y98.886 E.69512
G1 X85.71 Y98.886 E.01336
G1 X105.386 Y79.21 E.67623
G1 X105.386 Y79.76 E.01336
G1 X86.26 Y98.886 E.65734
G1 X86.81 Y98.886 E.01336
G1 X105.386 Y80.31 E.63845
G1 X105.386 Y80.859 E.01336
G1 X87.359 Y98.886 E.61956
G1 X87.909 Y98.886 E.01336
M73 P46 R4
G1 X105.386 Y81.409 E.60067
G1 X105.386 Y81.958 E.01336
G1 X88.458 Y98.886 E.58178
G1 X89.008 Y98.886 E.01336
G1 X105.386 Y82.508 E.56289
G1 X105.386 Y83.058 E.01336
G1 X89.558 Y98.886 E.544
G1 X90.107 Y98.886 E.01336
G1 X105.386 Y83.607 E.52511
G1 X105.386 Y84.157 E.01336
G1 X90.657 Y98.886 E.50622
G1 X91.207 Y98.886 E.01336
G1 X105.386 Y84.707 E.48733
G1 X105.386 Y85.256 E.01336
G1 X91.756 Y98.886 E.46844
G1 X92.306 Y98.886 E.01336
G1 X105.386 Y85.806 E.44955
G1 X105.386 Y86.355 E.01336
G1 X92.855 Y98.886 E.43066
G1 X93.405 Y98.886 E.01336
G1 X105.386 Y86.905 E.41177
G1 X105.386 Y87.455 E.01336
G1 X93.955 Y98.886 E.39288
G1 X94.504 Y98.886 E.01336
G1 X105.386 Y88.004 E.37399
G1 X105.386 Y88.554 E.01336
G1 X95.054 Y98.886 E.3551
G1 X95.604 Y98.886 E.01336
G1 X105.386 Y89.104 E.33621
G1 X105.386 Y89.653 E.01336
G1 X96.153 Y98.886 E.31732
G1 X96.703 Y98.886 E.01336
G1 X105.386 Y90.203 E.29843
G1 X105.386 Y90.753 E.01336
G1 X97.253 Y98.886 E.27954
G1 X97.802 Y98.886 E.01336
G1 X105.386 Y91.302 E.26065
G1 X105.386 Y91.852 E.01336
G1 X98.352 Y98.886 E.24176
G1 X98.901 Y98.886 E.01336
G1 X105.386 Y92.401 E.22287
G1 X105.386 Y92.951 E.01336
G1 X99.451 Y98.886 E.20398
G1 X100.001 Y98.886 E.01336
G1 X105.386 Y93.501 E.18509
G1 X105.386 Y94.05 E.01336
G1 X100.55 Y98.886 E.1662
G1 X101.1 Y98.886 E.01336
G1 X105.386 Y94.6 E.14731
G1 X105.386 Y95.15 E.01336
G1 X101.65 Y98.886 E.12842
G1 X102.199 Y98.886 E.01336
G1 X105.386 Y95.699 E.10953
G1 X105.386 Y96.249 E.01336
G1 X102.749 Y98.886 E.09064
G1 X103.299 Y98.886 E.01336
G1 X105.386 Y96.799 E.07175
G1 X105.386 Y97.348 E.01336
G1 X103.848 Y98.886 E.05286
G1 X104.398 Y98.886 E.01336
G1 X105.386 Y97.898 E.03397
G1 X105.386 Y98.447 E.01336
G1 X104.774 Y99.06 E.02105
; WIPE_START
G1 X105.386 Y98.447 E-.32911
G1 X105.386 Y98.314 E-.05089
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I1.214 J.083 P1  F42000
G1 X106.964 Y75.339 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105727
G1 F18000
M204 S6000
G1 X107.082 Y75.258 E.00064
; LINE_WIDTH: 0.13434
G1 X107.182 Y75.183 E.00078
; WIPE_START
G1 X107.082 Y75.258 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I.995 J-.7 P1  F42000
G1 X105.623 Y73.185 Z.76
G1 Z.36
G1 E.4 F1800
; LINE_WIDTH: 0.0966681
G1 F18000
M204 S6000
G1 X105.702 Y73.144 E.00035
; LINE_WIDTH: 0.148308
G3 X105.774 Y73.1 I.059 J.015 E.00067
; LINE_WIDTH: 0.126317
G1 X106.108 Y73.101 E.00192
; LINE_WIDTH: 0.145342
G1 X106.253 Y73.1 E.00101
M204 S10000
G1 X106.156 Y73.048 F42000
; LINE_WIDTH: 0.0978235
G1 F18000
M204 S6000
G3 X106.427 Y73.205 I-2.753 J5.046 E.00124
M204 S10000
G1 X106.424 Y73.21 F42000
; LINE_WIDTH: 0.144913
G1 F18000
M204 S6000
G1 X106.253 Y73.1 E.0014
G1 X106.276 Y73.078 E.00022
; LINE_WIDTH: 0.125084
G1 X106.298 Y73.056 E.00018
; LINE_WIDTH: 0.096671
G1 X106.377 Y73.015 E.00035
; WIPE_START
G1 X106.298 Y73.056 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I1.115 J.487 P1  F42000
G1 X107.164 Y71.076 Z.76
G1 Z.36
G1 E.4 F1800
; LINE_WIDTH: 0.104811
G1 F18000
M204 S6000
G1 X107.134 Y70.996 E.00037
; LINE_WIDTH: 0.144558
G1 X107.112 Y70.954 E.00033
G2 X106.907 Y70.819 I-.295 J.227 E.00172
; WIPE_START
G1 X107.04 Y70.883 E-.1894
G1 X107.112 Y70.954 E-.12887
G1 X107.134 Y70.996 E-.06174
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I.094 J-1.213 P1  F42000
G1 X105.073 Y70.838 Z.76
G1 Z.36
G1 E.4 F1800
; LINE_WIDTH: 0.100613
G1 F18000
M204 S6000
G1 X105.011 Y70.86 E.00028
G1 X104.936 Y70.954 E.0005
; WIPE_START
G1 X105.011 Y70.86 E-.2444
G1 X105.073 Y70.838 E-.1356
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I1.215 J.064 P1  F42000
G1 X106.799 Y37.814 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P47 R4
G1 F12000
M204 S5000
G3 X105.914 Y36.644 I-.8 J-.314 E.08788
G1 X105.99 Y36.64 E.00183
G3 X106.819 Y37.757 I.009 J.86 E.0391
; WIPE_START
M204 S6000
G1 X106.723 Y37.967 E-.08769
G1 X106.616 Y38.101 E-.06509
G1 X106.411 Y38.256 E-.09745
G1 X106.253 Y38.322 E-.0651
G1 X106.087 Y38.356 E-.06467
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.199 J-.21 P1  F42000
G1 X105.726 Y40.414 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G1 X105.727 Y60.727 E.52794
G1 X82.774 Y60.727 E.59656
G1 X82.774 Y56.223 E.11705
G1 X83.773 Y56.223 E.02598
G1 X83.773 Y42.277 E.36249
G1 X82.774 Y42.277 E.02598
G1 X82.774 Y37.773 E.11705
G1 X103.092 Y37.774 E.52807
G2 X105.666 Y40.408 I2.91 J-.27 E.10357
M204 S10000
G1 X106.141 Y40.003 F42000
G1 F11728.231
M204 S6000
G1 X106.142 Y61.142 E.54944
G1 X82.359 Y61.142 E.61816
G1 X82.358 Y55.808 E.13866
G1 X83.358 Y55.808 E.02598
G1 X83.358 Y42.692 E.34088
G1 X82.358 Y42.692 E.02598
G1 X82.359 Y37.358 E.13865
G1 X103.496 Y37.358 E.54938
G2 X106.081 Y40.006 I2.505 J.14 E.10816
M204 S10000
G1 X106.557 Y39.531 F42000
G1 F11728.231
M204 S6000
G1 X106.558 Y61.558 E.57251
G1 X81.943 Y61.558 E.63977
G1 X81.942 Y55.392 E.16026
G1 X82.942 Y55.392 E.02598
G1 X82.942 Y43.108 E.31927
G1 X81.942 Y43.108 E.02598
G1 X81.943 Y36.942 E.16026
G1 X103.982 Y36.943 E.57282
G2 X106.499 Y39.545 I2.046 J.54 E.1129
M204 S10000
G1 X106.973 Y38.891 F42000
G1 F11728.231
M204 S6000
G1 X106.974 Y61.974 E.59993
G1 X81.527 Y61.974 E.66137
G1 X81.526 Y54.976 E.18187
G1 X82.526 Y54.976 E.02599
G1 X82.526 Y43.524 E.29767
G1 X81.526 Y43.524 E.02599
G1 X81.527 Y36.526 E.18187
G1 X104.627 Y36.527 E.60038
G2 X106.651 Y39.046 I1.376 J.967 E.11274
G1 X106.919 Y38.917 E.0077
M204 S10000
G1 X107.156 Y37.993 F42000
G1 F11728.231
M204 S6000
G1 X107.191 Y37.923 E.00205
G1 X107.388 Y37.965 E.00523
G1 X107.389 Y61.985 E.62429
G3 X106.985 Y62.389 I-.396 J.009 E.01661
G1 X81.515 Y62.389 E.662
G3 X81.112 Y62.019 I-.012 J-.391 E.01576
G1 X81.111 Y54.561 E.19385
G1 X82.111 Y54.561 E.02599
G1 X82.111 Y43.939 E.27606
G1 X81.111 Y43.939 E.02599
G1 X81.112 Y36.481 E.19384
G3 X81.515 Y36.111 I.391 J.021 E.01577
G1 X105.533 Y36.111 E.62425
G1 X105.577 Y36.305 E.00517
G2 X107.061 Y38.185 I.424 J1.191 E.12461
G1 X107.129 Y38.047 E.00401
M204 S10000
G1 X107.197 Y37.074 F42000
G1 F11728.231
M204 S6000
G2 X106.424 Y36.311 I-1.276 J.521 E.02902
G1 X106.464 Y36.111 E.0053
G1 X107.013 Y36.111 E.01427
G1 X107.034 Y36.113 E.00056
G3 X107.388 Y36.481 I-.036 J.389 E.01446
G1 X107.388 Y37.028 E.01421
G1 X107.256 Y37.06 E.00354
; WIPE_START
G1 X107.024 Y36.764 E-.14286
G1 X106.858 Y36.575 E-.09543
G1 X106.658 Y36.424 E-.09532
G1 X106.548 Y36.371 E-.04639
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-.709 J-.989 P1  F42000
G1 X81.71 Y54.16 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X81.71 Y44.34 E.23681
G1 X80.71 Y44.34 E.02411
G1 X80.711 Y36.461 E.18999
G3 X81.505 Y35.71 I.792 J.041 E.02909
G1 X107.025 Y35.711 E.61542
M73 P48 R4
G3 X107.789 Y36.461 I-.035 J.8 E.02828
G1 X107.79 Y61.995 E.61574
G3 X106.995 Y62.79 I-.8 J-.004 E.03008
G1 X81.505 Y62.79 E.61469
G3 X80.711 Y62.039 I-.002 J-.793 E.02909
G1 X80.71 Y54.16 E.18999
G1 X81.65 Y54.16 E.02267
; WIPE_START
M204 S6000
G1 X81.656 Y53.16 E-.38
; WIPE_END
M73 P48 R3
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.145 J.411 P1  F42000
G1 X82.941 Y56.738 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420386
G1 F12627.898
M204 S6000
G1 X83.115 Y56.564 E.00596
G1 X83.661 Y56.564 E.01318
G1 X83.114 Y57.111 E.01868
G1 X83.114 Y57.657 E.01318
G1 X102.657 Y38.114 E.66714
G1 X102.793 Y38.114 E.00328
G2 X102.874 Y38.442 I1.77 J-.268 E.00818
G1 X83.114 Y58.203 E.67457
G1 X83.114 Y58.748 E.01318
G1 X103.024 Y38.839 E.67968
G2 X103.212 Y39.197 I1.875 J-.754 E.00978
G1 X83.115 Y59.294 E.68609
G1 X83.115 Y59.84 E.01318
G1 X103.434 Y39.521 E.69367
G2 X103.691 Y39.809 I4.778 J-4.003 E.00934
G1 X83.115 Y60.386 E.70246
G1 X83.661 Y60.386 E.01318
G1 X103.982 Y40.065 E.69374
G2 X104.305 Y40.288 I1.273 J-1.495 E.00949
G1 X84.206 Y60.386 E.68612
G1 X84.752 Y60.386 E.01318
G1 X104.662 Y40.477 E.67966
G2 X105.057 Y40.627 I1.927 J-4.487 E.01022
G1 X85.298 Y60.386 E.67454
G1 X85.844 Y60.386 E.01318
G1 X105.385 Y40.845 E.66709
G1 X105.385 Y41.391 E.01318
G1 X86.39 Y60.386 E.64846
G1 X86.936 Y60.386 E.01318
G1 X105.385 Y41.937 E.62982
G1 X105.385 Y42.483 E.01318
G1 X87.482 Y60.386 E.61118
G1 X88.028 Y60.386 E.01318
G1 X105.385 Y43.029 E.59254
G1 X105.385 Y43.575 E.01318
G1 X88.574 Y60.386 E.57391
G1 X89.12 Y60.386 E.01318
G1 X105.385 Y44.121 E.55527
G1 X105.385 Y44.667 E.01318
G1 X89.666 Y60.386 E.53663
G1 X90.212 Y60.386 E.01318
G1 X105.385 Y45.213 E.518
G1 X105.386 Y45.759 E.01318
G1 X90.758 Y60.386 E.49936
G1 X91.304 Y60.386 E.01318
G1 X105.386 Y46.305 E.48072
G1 X105.386 Y46.85 E.01318
G1 X91.85 Y60.386 E.46208
G1 X92.396 Y60.386 E.01318
G1 X105.386 Y47.396 E.44345
G1 X105.386 Y47.942 E.01318
G1 X92.942 Y60.386 E.42481
M73 P49 R3
G1 X93.488 Y60.386 E.01318
G1 X105.386 Y48.488 E.40617
G1 X105.386 Y49.034 E.01318
G1 X94.034 Y60.386 E.38754
G1 X94.58 Y60.386 E.01318
G1 X105.386 Y49.58 E.3689
G1 X105.386 Y50.126 E.01318
G1 X95.126 Y60.386 E.35026
G1 X95.672 Y60.386 E.01318
G1 X105.386 Y50.672 E.33162
G1 X105.386 Y51.218 E.01318
G1 X96.218 Y60.386 E.31299
G1 X96.763 Y60.386 E.01318
G1 X105.386 Y51.764 E.29435
G1 X105.386 Y52.31 E.01318
G1 X97.309 Y60.386 E.27571
G1 X97.855 Y60.386 E.01318
G1 X105.386 Y52.856 E.25708
G1 X105.386 Y53.402 E.01318
G1 X98.401 Y60.386 E.23844
G1 X98.947 Y60.386 E.01318
G1 X105.386 Y53.948 E.2198
G1 X105.386 Y54.494 E.01318
G1 X99.493 Y60.386 E.20116
G1 X100.039 Y60.386 E.01318
G1 X105.386 Y55.039 E.18253
G1 X105.386 Y55.585 E.01318
G1 X100.585 Y60.386 E.16389
G1 X101.131 Y60.386 E.01318
G1 X105.386 Y56.131 E.14525
G1 X105.386 Y56.677 E.01318
G1 X101.677 Y60.386 E.12662
G1 X102.223 Y60.386 E.01318
G1 X105.386 Y57.223 E.10798
G1 X105.386 Y57.769 E.01318
G1 X102.769 Y60.386 E.08934
G1 X103.315 Y60.386 E.01318
G1 X105.386 Y58.315 E.0707
G1 X105.386 Y58.861 E.01318
G1 X103.861 Y60.386 E.05207
G1 X104.407 Y60.386 E.01318
G1 X105.386 Y59.407 E.03343
G1 X105.386 Y59.953 E.01318
G1 X104.779 Y60.56 E.02072
; WIPE_START
G1 X105.386 Y59.953 E-.32613
G1 X105.386 Y59.811 E-.05387
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I.197 J-1.201 P1  F42000
G1 X83.94 Y56.285 Z.76
G1 Z.36
G1 E.4 F1800
G1 F12627.898
M204 S6000
G1 X102.111 Y38.114 E.62031
G1 X101.565 Y38.114 E.01318
G1 X84.114 Y55.565 E.59575
G1 X84.114 Y55.019 E.01318
G1 X101.019 Y38.114 E.57711
G1 X100.473 Y38.114 E.01318
G1 X84.114 Y54.473 E.55847
G1 X84.114 Y53.927 E.01318
G1 X99.927 Y38.114 E.53983
G1 X99.381 Y38.114 E.01318
G1 X84.114 Y53.381 E.5212
G1 X84.114 Y52.836 E.01318
G1 X98.835 Y38.114 E.50256
G1 X98.289 Y38.114 E.01318
G1 X84.114 Y52.29 E.48392
G1 X84.114 Y51.744 E.01318
G1 X97.743 Y38.114 E.46528
G1 X97.197 Y38.114 E.01318
G1 X84.114 Y51.198 E.44665
G1 X84.114 Y50.652 E.01318
G1 X96.651 Y38.114 E.42801
G1 X96.105 Y38.114 E.01318
G1 X84.114 Y50.106 E.40937
G1 X84.114 Y49.56 E.01318
G1 X95.559 Y38.114 E.39073
G1 X95.013 Y38.114 E.01318
G1 X84.114 Y49.014 E.3721
G1 X84.114 Y48.468 E.01318
G1 X94.467 Y38.114 E.35346
G1 X93.922 Y38.114 E.01318
G1 X84.114 Y47.922 E.33482
G1 X84.114 Y47.376 E.01318
G1 X93.376 Y38.114 E.31618
G1 X92.83 Y38.114 E.01318
G1 X84.114 Y46.83 E.29755
M73 P50 R3
G1 X84.114 Y46.284 E.01318
G1 X92.284 Y38.114 E.27891
G1 X91.738 Y38.114 E.01318
G1 X84.114 Y45.738 E.26027
G1 X84.114 Y45.192 E.01318
G1 X91.192 Y38.114 E.24163
G1 X90.646 Y38.114 E.01318
G1 X84.114 Y44.646 E.223
G1 X84.114 Y44.1 E.01318
G1 X90.1 Y38.114 E.20436
G1 X89.554 Y38.114 E.01318
G1 X84.114 Y43.554 E.18572
G1 X84.114 Y43.008 E.01318
G1 X89.008 Y38.114 E.16708
G1 X88.462 Y38.114 E.01318
G1 X84.114 Y42.462 E.14845
G1 X84.114 Y41.936 E.0127
G1 X84.094 Y41.936 E.00048
G1 X87.916 Y38.114 E.13048
G1 X87.37 Y38.114 E.01318
G1 X83.548 Y41.936 E.13049
G1 X83.114 Y41.936 E.01047
G1 X83.114 Y41.824 E.00271
G1 X86.824 Y38.114 E.12666
G1 X86.278 Y38.114 E.01318
G1 X83.114 Y41.278 E.10802
G1 X83.114 Y40.732 E.01318
G1 X85.732 Y38.114 E.08938
G1 X85.186 Y38.114 E.01318
G1 X83.114 Y40.186 E.07074
G1 X83.114 Y39.64 E.01318
G1 X84.641 Y38.114 E.0521
G1 X84.095 Y38.114 E.01318
G1 X83.115 Y39.094 E.03346
G1 X83.115 Y38.548 E.01318
G1 X83.722 Y37.94 E.02074
; WIPE_START
G1 X83.115 Y38.548 E-.32652
G1 X83.115 Y38.689 E-.05348
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I.124 J1.211 P1  F42000
G1 X104.936 Y36.454 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100616
G1 F18000
M204 S6000
G1 X105.011 Y36.36 E.0005
G1 X105.073 Y36.338 E.00028
; WIPE_START
G1 X105.011 Y36.36 E-.13559
G1 X104.936 Y36.454 E-.24441
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I.083 J1.214 P1  F42000
G1 X106.907 Y36.319 Z.76
G1 Z.36
G1 E.4 F1800
; LINE_WIDTH: 0.145435
G1 F18000
M204 S6000
G3 X107.114 Y36.456 I-.089 J.36 E.00176
G1 X107.127 Y36.48 E.0002
; LINE_WIDTH: 0.109736
G1 X107.162 Y36.574 E.00047
; WIPE_START
G1 X107.127 Y36.48 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.217 J.032 P1  F42000
G1 X107.18 Y38.484 Z.76
G1 Z.36
G1 E.4 F1800
; LINE_WIDTH: 0.134099
G1 F18000
M204 S6000
G1 X107.082 Y38.559 E.00077
; LINE_WIDTH: 0.105686
G1 X106.963 Y38.639 E.00064
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X107.082 Y38.559 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 3/5
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I-1.215 J-.063 P1  F42000
G1 X103.289 Y111.592 Z.76
G1 Z.52
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X103.289 Y113.792 I2.724 J1.1 E.05861
G2 X105.727 Y117.81 I2.715 J1.101 E.14173
G1 X105.727 Y142.227 E.63462
G1 X74.273 Y142.227 E.81751
G1 X74.273 Y133.473 E.22751
G1 X75.273 Y133.473 E.02599
G1 X75.273 Y119.527 E.36249
G1 X74.273 Y119.527 E.02599
G1 X74.273 Y110.773 E.22751
G1 X103.081 Y110.774 E.74874
G2 X103.268 Y111.536 I3.326 J-.411 E.02045
M204 S10000
G1 X103.746 Y111.599 F42000
G1 F11728.231
M204 S6000
G2 X103.746 Y113.799 I2.231 J1.1 E.05923
G2 X106.142 Y117.407 I2.259 J1.099 E.1357
G1 X106.142 Y142.642 E.6559
G1 X73.858 Y142.642 E.83912
G1 X73.858 Y133.058 E.24912
G1 X74.858 Y133.058 E.02599
G1 X74.858 Y119.942 E.34088
G1 X73.858 Y119.942 E.02599
G1 X73.858 Y110.358 E.24912
G1 X103.496 Y110.358 E.77033
G2 X103.72 Y111.545 I2.436 J.154 E.03173
M204 S10000
G1 X104.217 Y111.606 F42000
G1 F11728.231
M204 S6000
G2 X104.217 Y113.806 I1.808 J1.1 E.06013
G2 X106.558 Y116.916 I1.794 J1.086 E.12967
G1 X106.558 Y143.058 E.67946
G1 X73.442 Y143.058 E.86072
G1 X73.442 Y132.642 E.27072
G1 X74.442 Y132.642 E.02599
M73 P51 R3
G1 X74.442 Y120.358 E.31927
G1 X73.442 Y120.358 E.02599
G1 X73.442 Y109.942 E.27073
G1 X103.982 Y109.942 E.79378
G2 X104.188 Y111.554 I2.174 J.542 E.0432
M204 S10000
G1 X104.731 Y111.595 F42000
G1 F11728.231
M204 S6000
G2 X104.731 Y113.795 I1.313 J1.1 E.06209
G2 X106.651 Y116.446 I1.279 J1.094 E.11679
G1 X106.974 Y116.291 E.0093
G1 X106.974 Y143.474 E.70651
G1 X73.026 Y143.474 E.88233
G1 X73.026 Y132.226 E.29233
G1 X74.026 Y132.226 E.02599
G1 X74.026 Y120.774 E.29767
G1 X73.026 Y120.774 E.02599
G1 X73.026 Y109.526 E.29233
G1 X104.627 Y109.527 E.82134
G2 X104.692 Y111.549 I1.392 J.967 E.05635
M204 S10000
G1 X105.358 Y111.606 F42000
G1 F11728.231
M204 S6000
G2 X105.142 Y113.625 I.667 J1.092 E.06094
G1 X105.358 Y113.806 E.00733
G2 X107.192 Y115.32 I.644 J1.089 E.12608
G1 X107.389 Y115.363 E.00523
G1 X107.389 Y143.485 E.73092
G3 X106.985 Y143.889 I-.396 J.009 E.01662
G1 X73.015 Y143.889 E.8829
G3 X72.611 Y143.485 I-.009 J-.396 E.01662
G1 X72.611 Y131.811 E.30342
G1 X73.611 Y131.811 E.02599
G1 X73.611 Y121.189 E.27606
G1 X72.611 Y121.189 E.02599
G1 X72.611 Y109.515 E.30342
G3 X73.015 Y109.111 I.396 J-.009 E.01662
G1 X105.533 Y109.111 E.84518
G1 X105.578 Y109.305 E.00517
G2 X105.142 Y111.425 I.442 J1.195 E.06719
G1 X105.312 Y111.567 E.00576
M204 S250
G1 X106.128 Y111.349 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.834 Y109.656 I-.13 J-.85 E.0643
G1 X105.971 Y109.64 E.00334
G3 X106.187 Y111.338 I.027 J.859 E.06117
; WIPE_START
M204 S6000
G1 X105.957 Y111.359 E-.08767
G1 X105.788 Y111.334 E-.06513
G1 X105.627 Y111.275 E-.06513
G1 X105.481 Y111.186 E-.06506
G1 X105.355 Y111.069 E-.06515
G1 X105.306 Y111.001 E-.03186
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I.538 J1.092 P1  F42000
G1 X107.186 Y110.074 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X106.423 Y109.311 I-1.197 J.434 E.02897
G1 X106.463 Y109.111 E.0053
G1 X107.005 Y109.111 E.01407
G3 X107.389 Y109.515 I-.011 J.395 E.01609
G1 X107.389 Y110.036 E.01353
G1 X107.245 Y110.063 E.00381
; WIPE_START
G1 X107.024 Y109.764 E-.14143
G1 X106.858 Y109.575 E-.09553
G1 X106.658 Y109.424 E-.09544
G1 X106.545 Y109.369 E-.0476
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.216 J.051 P1  F42000
G1 X106.638 Y111.59 Z.92
G1 Z.52
G1 E.4 F1800
G1 F11728.231
M204 S6000
G2 X107.192 Y110.92 I-.763 J-1.197 E.02298
G1 X107.389 Y110.963 E.00524
G1 X107.389 Y112.236 E.03309
G1 X107.186 Y112.274 E.00537
G2 X106.686 Y111.625 I-1.41 J.569 E.02156
; WIPE_START
G1 X106.768 Y111.501 E-.05635
G1 X106.986 Y111.287 E-.11641
G1 X107.123 Y111.075 E-.09554
G1 X107.192 Y110.92 E-.06456
G1 X107.314 Y110.947 E-.04714
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.107 J-.504 P1  F42000
G1 X106.128 Y113.549 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.834 Y111.856 I-.13 J-.85 E.0643
G1 X105.971 Y111.84 E.00334
G3 X106.187 Y113.538 I.027 J.859 E.06118
M204 S10000
G1 X106.638 Y113.791 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X107.192 Y113.12 I-.767 J-1.199 E.02298
G1 X107.389 Y113.163 E.00524
G1 X107.389 Y114.436 E.03309
G1 X107.186 Y114.474 E.00537
G2 X106.687 Y113.826 I-1.409 J.568 E.02155
M204 S250
G1 X106.128 Y114.05 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.834 Y114.056 I-.13 J.849 E.12306
G1 X105.971 Y114.04 E.00334
G3 X106.068 Y114.043 I.027 J.859 E.00235
; WIPE_START
M204 S6000
G1 X106.294 Y114.092 E-.08776
G1 X106.449 Y114.166 E-.06522
G1 X106.585 Y114.269 E-.06498
G1 X106.698 Y114.398 E-.06513
G1 X106.784 Y114.546 E-.06505
G1 X106.811 Y114.626 E-.03187
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-.544 J-1.089 P1  F42000
G1 X73.21 Y131.41 Z.92
G1 Z.52
G1 E.4 F1800
G1 F12000
M204 S5000
G1 X73.21 Y121.59 E.23681
G1 X72.21 Y121.59 E.02412
G1 X72.21 Y109.505 E.29142
G3 X73.005 Y108.71 I.8 J.004 E.03008
G1 X107.016 Y108.711 E.82018
G3 X107.79 Y109.505 I-.026 J.799 E.02956
G1 X107.79 Y143.495 E.81966
G3 X106.995 Y144.29 I-.8 J-.004 E.03008
G1 X73.005 Y144.29 E.81966
M73 P52 R3
G3 X72.21 Y143.495 I.004 J-.8 E.03008
G1 X72.21 Y131.41 E.29142
G1 X73.15 Y131.41 E.02267
; WIPE_START
M204 S6000
G1 X73.156 Y130.41 E-.38
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

G1 X74.977 Y119.36
G1 Z.52
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421576
G1 F12589.092
M204 S6000
G1 X74.614 Y118.996 E.01245
G1 X74.614 Y118.449 E.01326
G1 X98.051 Y141.886 E.80258
G1 X98.599 Y141.886 E.01326
G1 X74.614 Y117.901 E.82133
G1 X74.614 Y117.353 E.01326
G1 X99.146 Y141.886 E.84009
G1 X99.694 Y141.886 E.01326
G1 X74.614 Y116.806 E.85884
G1 X74.614 Y116.258 E.01326
G1 X100.242 Y141.886 E.87759
G1 X100.789 Y141.886 E.01326
G1 X74.614 Y115.711 E.89635
G1 X74.614 Y115.163 E.01326
G1 X101.337 Y141.886 E.9151
G1 X101.885 Y141.886 E.01326
G1 X74.614 Y114.615 E.93385
G1 X74.614 Y114.068 E.01326
G1 X102.432 Y141.886 E.95261
G1 X102.98 Y141.886 E.01326
G1 X74.614 Y113.52 E.97136
G1 X74.614 Y112.972 E.01326
G1 X103.528 Y141.886 E.99011
G1 X104.075 Y141.886 E.01326
G1 X74.614 Y112.425 E1.00886
G1 X74.614 Y111.877 E.01326
G1 X104.623 Y141.886 E1.02762
G1 X105.171 Y141.886 E.01326
G1 X74.614 Y111.329 E1.04637
G1 X74.614 Y111.114 E.00522
G1 X74.946 Y111.114 E.00804
G1 X105.386 Y141.554 E1.04239
G1 X105.386 Y141.007 E.01326
G1 X75.493 Y111.114 E1.02364
G1 X76.041 Y111.114 E.01326
G1 X105.386 Y140.459 E1.00489
G1 X105.386 Y139.912 E.01326
G1 X76.589 Y111.114 E.98613
G1 X77.136 Y111.114 E.01326
M73 P53 R3
G1 X105.386 Y139.364 E.96738
G1 X105.386 Y138.816 E.01326
G1 X77.684 Y111.114 E.94863
G1 X78.232 Y111.114 E.01326
G1 X105.386 Y138.269 E.92987
G1 X105.386 Y137.721 E.01326
G1 X78.779 Y111.114 E.91112
G1 X79.327 Y111.114 E.01326
G1 X105.386 Y137.173 E.89237
G1 X105.386 Y136.626 E.01326
G1 X79.874 Y111.114 E.87361
G1 X80.422 Y111.114 E.01326
G1 X105.386 Y136.078 E.85486
G1 X105.386 Y135.53 E.01326
G1 X80.97 Y111.114 E.83611
G1 X81.517 Y111.114 E.01326
G1 X105.386 Y134.983 E.81735
G1 X105.386 Y134.435 E.01326
G1 X82.065 Y111.114 E.7986
G1 X82.613 Y111.114 E.01326
G1 X105.386 Y133.887 E.77985
G1 X105.386 Y133.34 E.01326
G1 X83.16 Y111.114 E.76109
G1 X83.708 Y111.114 E.01326
G1 X105.386 Y132.792 E.74234
G1 X105.386 Y132.245 E.01326
G1 X84.256 Y111.114 E.72359
G1 X84.803 Y111.114 E.01326
G1 X105.386 Y131.697 E.70483
G1 X105.386 Y131.149 E.01326
G1 X85.351 Y111.114 E.68608
G1 X85.899 Y111.114 E.01326
G1 X105.386 Y130.602 E.66733
G1 X105.386 Y130.054 E.01326
G1 X86.446 Y111.114 E.64857
G1 X86.994 Y111.114 E.01326
G1 X105.386 Y129.506 E.62982
G1 X105.386 Y128.959 E.01326
G1 X87.542 Y111.114 E.61107
G1 X88.089 Y111.114 E.01326
G1 X105.386 Y128.411 E.59231
G1 X105.386 Y127.863 E.01326
G1 X88.637 Y111.114 E.57356
G1 X89.184 Y111.114 E.01326
G1 X105.386 Y127.316 E.55481
M73 P54 R3
G1 X105.386 Y126.768 E.01326
G1 X89.732 Y111.114 E.53605
G1 X90.28 Y111.114 E.01326
G1 X105.386 Y126.221 E.5173
G1 X105.386 Y125.673 E.01326
G1 X90.827 Y111.114 E.49855
G1 X91.375 Y111.114 E.01326
G1 X105.386 Y125.125 E.47979
G1 X105.386 Y124.578 E.01326
G1 X91.923 Y111.114 E.46104
G1 X92.47 Y111.114 E.01326
G1 X105.386 Y124.03 E.44228
G1 X105.386 Y123.482 E.01326
G1 X93.018 Y111.114 E.42353
G1 X93.566 Y111.114 E.01326
G1 X105.386 Y122.935 E.40478
G1 X105.386 Y122.387 E.01326
G1 X94.113 Y111.114 E.38602
G1 X94.661 Y111.114 E.01326
G1 X105.386 Y121.839 E.36727
G1 X105.386 Y121.292 E.01326
G1 X95.209 Y111.114 E.34852
G1 X95.756 Y111.114 E.01326
G1 X105.386 Y120.744 E.32976
G1 X105.386 Y120.196 E.01326
G1 X96.304 Y111.114 E.31101
G1 X96.852 Y111.114 E.01326
G1 X105.56 Y119.822 E.2982
; WIPE_START
G1 X104.853 Y119.115 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I1.16 J-.369 P1  F42000
G1 X104.341 Y117.508 Z.92
G1 Z.52
G1 E.4 F1800
G1 F12589.092
M204 S6000
G1 X105.386 Y118.554 E.03581
G1 X105.386 Y119.101 E.01326
G1 X97.399 Y111.114 E.2735
G1 X97.947 Y111.114 E.01326
G1 X102.987 Y116.154 E.17259
G3 X102.774 Y115.393 I3.118 J-1.285 E.01918
G1 X98.495 Y111.114 E.14653
G1 X99.042 Y111.114 E.01326
G1 X102.738 Y114.81 E.12657
G3 X102.787 Y114.312 I4.16 J.158 E.01214
G1 X99.59 Y111.114 E.1095
G1 X100.137 Y111.114 E.01326
G1 X102.901 Y113.878 E.09464
G1 X102.931 Y113.79 E.00225
G3 X102.776 Y113.205 I2.054 J-.858 E.0147
G1 X100.685 Y111.114 E.07159
G1 X101.233 Y111.114 E.01326
G1 X102.738 Y112.619 E.05155
G3 X102.786 Y112.119 I4.342 J.162 E.01217
G1 X101.78 Y111.114 E.03442
G1 X102.328 Y111.114 E.01326
G1 X103.036 Y111.822 E.02424
; WIPE_START
G1 X102.329 Y111.115 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I.654 J1.026 P1  F42000
G1 X104.936 Y109.454 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100656
G1 F18000
M204 S6000
G1 X105.011 Y109.36 E.0005
G1 X105.074 Y109.337 E.00028
; WIPE_START
G1 X105.011 Y109.36 E-.1356
G1 X104.936 Y109.454 E-.2444
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I.083 J1.214 P1  F42000
G1 X106.907 Y109.319 Z.92
G1 Z.52
G1 E.4 F1800
; LINE_WIDTH: 0.14477
G1 F18000
M204 S6000
G3 X107.112 Y109.454 I-.091 J.362 E.00172
G1 X107.134 Y109.497 E.00034
; LINE_WIDTH: 0.104665
G1 X107.164 Y109.576 E.00037
; WIPE_START
G1 X107.134 Y109.497 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.132 J-.448 P1  F42000
G1 X106.329 Y111.531 Z.92
G1 Z.52
G1 E.4 F1800
; LINE_WIDTH: 0.094813
G1 F18000
M204 S6000
G2 X106.269 Y111.566 I.066 J.182 E.00026
; LINE_WIDTH: 0.125544
G1 X106.257 Y111.583 E.00012
; LINE_WIDTH: 0.14637
G1 X106.245 Y111.6 E.00015
G1 X106.431 Y111.699 E.00148
M204 S10000
G1 X106.427 Y111.705 F42000
; LINE_WIDTH: 0.0978728
G1 F18000
M204 S6000
G2 X106.159 Y111.549 I-3.145 J5.088 E.00123
M204 S10000
G1 X106.168 Y111.6 F42000
; LINE_WIDTH: 0.126576
G1 F18000
M204 S6000
G1 X105.783 Y111.599 E.00223
; LINE_WIDTH: 0.146226
G3 X105.576 Y111.49 I.115 J-.468 E.00165
M204 S10000
G1 X105.573 Y111.495 F42000
; LINE_WIDTH: 0.0976237
G1 F18000
M204 S6000
G2 X105.844 Y111.653 I3.528 J-5.716 E.00124
; WIPE_START
G1 X105.573 Y111.495 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.178 J.306 P1  F42000
G1 X106.159 Y113.749 Z.92
G1 Z.52
G1 E.4 F1800
; LINE_WIDTH: 0.0978087
G1 F18000
M204 S6000
G3 X106.427 Y113.905 I-2.859 J5.215 E.00123
M204 S10000
G1 X106.431 Y113.899 F42000
; LINE_WIDTH: 0.146341
G1 F18000
M204 S6000
G1 X106.245 Y113.8 E.00147
G1 X106.257 Y113.783 E.00015
; LINE_WIDTH: 0.12654
G1 X106.269 Y113.766 E.00012
; LINE_WIDTH: 0.0953884
G3 X106.332 Y113.73 I.131 J.155 E.00028
M204 S10000
G1 X106.337 Y113.8 F42000
; LINE_WIDTH: 0.130174
G1 F18000
M204 S6000
G1 X105.783 Y113.799 E.00332
; LINE_WIDTH: 0.146415
G3 X105.576 Y113.69 I.112 J-.464 E.00166
M204 S10000
G1 X105.573 Y113.695 F42000
; LINE_WIDTH: 0.0978838
G1 F18000
M204 S6000
G2 X105.845 Y113.853 I3.149 J-5.092 E.00125
; WIPE_START
G1 X105.573 Y113.695 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-.981 J.721 P1  F42000
G1 X107.182 Y115.883 Z.92
G1 Z.52
G1 E.4 F1800
; LINE_WIDTH: 0.134218
G1 F18000
M204 S6000
G1 X107.082 Y115.959 E.00078
; LINE_WIDTH: 0.105635
G1 X106.964 Y116.039 E.00064
; WIPE_START
G1 X107.082 Y115.959 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.145 J-.413 P1  F42000
G1 X97.677 Y142.06 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421576
G1 F12589.092
M204 S6000
G1 X75.614 Y119.996 E.75553
G1 X75.614 Y120.544 E.01326
G1 X96.956 Y141.886 E.73083
G1 X96.408 Y141.886 E.01326
G1 X75.614 Y121.092 E.71208
G1 X75.614 Y121.639 E.01326
G1 X95.861 Y141.886 E.69333
M73 P55 R3
G1 X95.313 Y141.886 E.01326
G1 X75.614 Y122.187 E.67457
G1 X75.614 Y122.735 E.01326
G1 X94.765 Y141.886 E.65582
G1 X94.218 Y141.886 E.01326
G1 X75.614 Y123.282 E.63707
G1 X75.614 Y123.83 E.01326
G1 X93.67 Y141.886 E.61831
G1 X93.122 Y141.886 E.01326
G1 X75.614 Y124.378 E.59956
G1 X75.614 Y124.925 E.01326
G1 X92.575 Y141.886 E.58081
G1 X92.027 Y141.886 E.01326
G1 X75.614 Y125.473 E.56205
G1 X75.614 Y126.02 E.01326
G1 X91.48 Y141.886 E.5433
G1 X90.932 Y141.886 E.01326
G1 X75.614 Y126.568 E.52455
G1 X75.614 Y127.116 E.01326
G1 X90.384 Y141.886 E.50579
G1 X89.837 Y141.886 E.01326
G1 X75.614 Y127.663 E.48704
G1 X75.614 Y128.211 E.01326
G1 X89.289 Y141.886 E.46829
G1 X88.741 Y141.886 E.01326
G1 X75.614 Y128.759 E.44953
G1 X75.614 Y129.306 E.01326
G1 X88.194 Y141.886 E.43078
G1 X87.646 Y141.886 E.01326
G1 X75.614 Y129.854 E.41203
G1 X75.614 Y130.402 E.01326
G1 X87.098 Y141.886 E.39328
G1 X86.551 Y141.886 E.01326
G1 X75.614 Y130.949 E.37452
G1 X75.614 Y131.497 E.01326
G1 X86.003 Y141.886 E.35577
G1 X85.455 Y141.886 E.01326
G1 X75.614 Y132.045 E.33702
G1 X75.614 Y132.592 E.01326
G1 X84.908 Y141.886 E.31826
G1 X84.36 Y141.886 E.01326
G1 X75.614 Y133.14 E.29951
G1 X75.614 Y133.687 E.01326
G1 X83.813 Y141.886 E.28076
G1 X83.265 Y141.886 E.01326
G1 X75.192 Y133.814 E.27643
G1 X74.645 Y133.814 E.01326
G1 X82.717 Y141.886 E.27643
G1 X82.17 Y141.886 E.01326
G1 X74.614 Y134.33 E.25874
G1 X74.614 Y134.878 E.01326
G1 X81.622 Y141.886 E.23999
G1 X81.074 Y141.886 E.01326
G1 X74.614 Y135.426 E.22124
G1 X74.614 Y135.973 E.01326
G1 X80.527 Y141.886 E.20248
G1 X79.979 Y141.886 E.01326
G1 X74.614 Y136.521 E.18373
G1 X74.614 Y137.069 E.01326
G1 X79.431 Y141.886 E.16498
G1 X78.884 Y141.886 E.01326
G1 X74.614 Y137.616 E.14622
G1 X74.614 Y138.164 E.01326
G1 X78.336 Y141.886 E.12747
G1 X77.789 Y141.886 E.01326
G1 X74.614 Y138.711 E.10872
G1 X74.614 Y139.259 E.01326
G1 X77.241 Y141.886 E.08996
G1 X76.693 Y141.886 E.01326
G1 X74.614 Y139.807 E.07121
G1 X74.614 Y140.354 E.01326
G1 X76.146 Y141.886 E.05246
G1 X75.598 Y141.886 E.01326
G1 X74.614 Y140.902 E.03371
G1 X74.614 Y141.45 E.01326
G1 X75.224 Y142.06 E.02089
; WIPE_START
G1 X74.614 Y141.45 E-.32792
G1 X74.614 Y141.313 E-.05209
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I1.104 J.512 P1  F42000
G1 X106.128 Y73.35 Z.92
G1 Z.52
M73 P56 R3
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.834 Y73.356 I-.13 J.85 E.12313
G1 X105.971 Y73.34 E.00334
G3 X106.068 Y73.343 I.027 J.859 E.00235
M204 S10000
G1 X106.649 Y73.1 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X107.186 Y72.426 I-.86 J-1.237 E.02273
G1 X107.389 Y72.464 E.00537
G1 X107.389 Y73.736 E.03306
G1 X107.186 Y73.774 E.00537
G2 X106.698 Y73.135 I-1.397 J.562 E.02117
; WIPE_START
G1 X106.858 Y72.925 E-.10046
G1 X107.024 Y72.736 E-.0956
G1 X107.186 Y72.426 E-.13317
G1 X107.318 Y72.45 E-.05076
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I1.204 J-.18 P1  F42000
G1 X107.186 Y71.574 Z.92
G1 Z.52
G1 E.4 F1800
G1 F11728.231
M204 S6000
G2 X106.423 Y70.811 I-1.197 J.434 E.02897
G1 X106.463 Y70.611 E.0053
G1 X107.005 Y70.611 E.01407
G3 X107.389 Y71.015 I-.01 J.395 E.0161
G1 X107.389 Y71.536 E.01353
G1 X107.245 Y71.563 E.00381
; WIPE_START
G1 X107.024 Y71.264 E-.14149
G1 X106.858 Y71.075 E-.09551
G1 X106.658 Y70.924 E-.0953
G1 X106.545 Y70.87 E-.04771
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.167 J-.345 P1  F42000
G1 X105.957 Y72.858 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.834 Y71.156 I.041 J-.859 E.06017
G1 X105.971 Y71.14 E.00334
G3 X106.017 Y72.859 I.027 J.859 E.0653
; WIPE_START
M204 S6000
G1 X105.788 Y72.834 E-.08773
G1 X105.627 Y72.775 E-.06511
G1 X105.48 Y72.686 E-.06513
G1 X105.355 Y72.569 E-.06513
G1 X105.255 Y72.43 E-.06499
G1 X105.22 Y72.354 E-.03191
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-.435 J-1.137 P1  F42000
G1 X103.289 Y73.092 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X105.727 Y77.11 I2.715 J1.101 E.14173
G1 X105.727 Y99.227 E.57485
G1 X78.774 Y99.227 E.70052
G1 X78.774 Y92.723 E.16903
G1 X79.773 Y92.723 E.02598
G1 X79.773 Y78.777 E.36249
G1 X78.774 Y78.777 E.02598
G1 X78.774 Y72.273 E.16903
G1 X103.081 Y72.274 E.63175
G2 X103.268 Y73.036 I3.329 J-.412 E.02045
M204 S10000
G1 X103.746 Y73.099 F42000
G1 F11728.231
M204 S6000
G2 X106.142 Y76.707 I2.259 J1.099 E.1357
G1 X106.142 Y99.642 E.59612
G1 X78.359 Y99.642 E.72213
G1 X78.358 Y92.308 E.19064
G1 X79.358 Y92.308 E.02598
G1 X79.358 Y79.192 E.34088
G1 X78.358 Y79.192 E.02598
G1 X78.359 Y71.858 E.19064
G1 X103.496 Y71.858 E.65334
G2 X103.72 Y73.045 I2.435 J.154 E.03173
M204 S10000
G1 X104.217 Y73.106 F42000
G1 F11728.231
M204 S6000
G2 X106.558 Y76.221 I1.798 J1.086 E.12969
G1 X106.558 Y100.058 E.61956
G1 X77.943 Y100.058 E.74373
G1 X77.942 Y91.892 E.21224
G1 X78.942 Y91.892 E.02599
G1 X78.942 Y79.608 E.31927
G1 X77.942 Y79.608 E.02599
G1 X77.943 Y71.442 E.21224
G1 X103.982 Y71.442 E.67679
G2 X104.188 Y73.054 I2.174 J.542 E.0432
M204 S10000
G1 X104.731 Y73.095 F42000
G1 F11728.231
M204 S6000
G2 X106.974 Y75.578 I1.284 J1.094 E.12633
G1 X106.974 Y100.474 E.64708
G1 X77.527 Y100.474 E.76534
G1 X77.526 Y91.476 E.23385
G1 X78.526 Y91.476 E.02599
G1 X78.526 Y80.024 E.29767
G1 X77.526 Y80.024 E.02599
G1 X77.527 Y71.026 E.23385
G1 X104.627 Y71.027 E.70435
G2 X104.692 Y73.049 I1.392 J.967 E.05636
M204 S10000
G1 X105.358 Y73.106 F42000
G1 F11728.231
M204 S6000
G2 X107.186 Y74.626 I.643 J1.086 E.12555
G1 X107.389 Y74.664 E.00537
G1 X107.389 Y100.485 E.67111
M73 P57 R3
G3 X106.985 Y100.889 I-.396 J.009 E.01662
G1 X77.515 Y100.889 E.76594
G3 X77.112 Y100.519 I-.009 J-.395 E.01573
G1 X77.111 Y91.061 E.24583
G1 X78.111 Y91.061 E.02599
G1 X78.111 Y80.439 E.27606
G1 X77.111 Y80.439 E.02599
G1 X77.112 Y70.981 E.24583
G3 X77.515 Y70.611 I.394 J.024 E.01573
G1 X105.533 Y70.611 E.72822
G1 X105.578 Y70.805 E.00517
G2 X105.142 Y72.925 I.442 J1.195 E.06718
G1 X105.312 Y73.067 E.00577
; WIPE_START
G1 X105.097 Y73.319 E-.1258
G1 X104.94 Y73.516 E-.09547
G1 X104.826 Y73.739 E-.09549
G1 X104.786 Y73.858 E-.04782
G1 X104.779 Y73.898 E-.01543
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-.641 J-1.035 P1  F42000
G1 X77.71 Y90.66 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X77.71 Y80.84 E.23681
G1 X76.71 Y80.84 E.02411
G1 X76.711 Y70.961 E.23822
G3 X77.505 Y70.21 I.799 J.049 E.02903
G1 X107.016 Y70.211 E.71166
G3 X107.79 Y71.005 I-.026 J.799 E.02956
G1 X107.79 Y100.495 E.71114
G3 X106.995 Y101.29 I-.8 J-.004 E.03008
G1 X77.505 Y101.29 E.71114
G3 X76.711 Y100.538 I.005 J-.8 E.02903
G1 X76.71 Y90.66 E.23822
G1 X77.65 Y90.66 E.02267
; WIPE_START
M204 S6000
G1 X77.656 Y89.66 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.188 J.262 P1  F42000
G1 X79.729 Y99.06 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423956
G1 F12512.191
M204 S6000
G1 X79.115 Y98.445 E.02117
G1 X79.115 Y97.894 E.01343
G1 X80.107 Y98.886 E.03418
G1 X80.658 Y98.886 E.01342
G1 X79.115 Y97.343 E.05317
G1 X79.114 Y96.792 E.01343
G1 X81.209 Y98.886 E.07215
G1 X81.76 Y98.886 E.01342
G1 X79.114 Y96.241 E.09114
G1 X79.114 Y95.69 E.01343
G1 X82.311 Y98.886 E.11013
G1 X82.862 Y98.886 E.01342
G1 X79.114 Y95.139 E.12911
G1 X79.114 Y94.588 E.01343
G1 X83.413 Y98.886 E.1481
G1 X83.964 Y98.886 E.01342
G1 X79.114 Y94.037 E.16709
G1 X79.114 Y93.486 E.01343
G1 X84.515 Y98.886 E.18607
G1 X85.066 Y98.886 E.01342
G1 X79.243 Y93.064 E.20061
G1 X79.794 Y93.064 E.01342
G1 X85.617 Y98.886 E.20061
G1 X86.168 Y98.886 E.01342
G1 X80.114 Y92.832 E.20858
G1 X80.114 Y92.281 E.01342
G1 X86.719 Y98.886 E.22757
G1 X87.27 Y98.886 E.01342
G1 X80.114 Y91.73 E.24655
G1 X80.114 Y91.179 E.01342
G1 X87.821 Y98.886 E.26554
G1 X88.372 Y98.886 E.01342
G1 X80.114 Y90.628 E.28452
G1 X80.114 Y90.077 E.01342
G1 X88.923 Y98.886 E.3035
G1 X89.474 Y98.886 E.01342
G1 X80.114 Y89.526 E.32249
G1 X80.114 Y88.975 E.01342
G1 X90.025 Y98.886 E.34147
G1 X90.576 Y98.886 E.01342
G1 X80.114 Y88.424 E.36046
G1 X80.114 Y87.873 E.01342
G1 X91.127 Y98.886 E.37944
G1 X91.678 Y98.886 E.01342
G1 X80.114 Y87.322 E.39843
G1 X80.114 Y86.771 E.01342
G1 X92.229 Y98.886 E.41741
G1 X92.78 Y98.886 E.01342
G1 X80.114 Y86.22 E.43639
G1 X80.114 Y85.669 E.01342
G1 X93.331 Y98.886 E.45538
G1 X93.882 Y98.886 E.01342
G1 X80.114 Y85.118 E.47436
G1 X80.114 Y84.567 E.01342
G1 X94.433 Y98.886 E.49335
M73 P58 R3
G1 X94.984 Y98.886 E.01342
G1 X80.114 Y84.016 E.51233
G1 X80.114 Y83.465 E.01342
G1 X95.535 Y98.886 E.53132
G1 X96.086 Y98.886 E.01342
G1 X80.114 Y82.914 E.5503
G1 X80.114 Y82.363 E.01342
G1 X96.637 Y98.886 E.56929
G1 X97.188 Y98.886 E.01342
G1 X80.114 Y81.812 E.58827
G1 X80.114 Y81.261 E.01342
G1 X97.739 Y98.886 E.60725
G1 X98.29 Y98.886 E.01342
G1 X80.114 Y80.71 E.62624
G1 X80.114 Y80.159 E.01342
G1 X98.841 Y98.886 E.64522
G1 X99.392 Y98.886 E.01342
G1 X80.114 Y79.608 E.66421
G1 X80.114 Y79.057 E.01342
G1 X99.943 Y98.886 E.68319
G1 X100.494 Y98.886 E.01342
G1 X79.114 Y77.507 E.73661
G1 X79.114 Y76.956 E.01342
G1 X101.045 Y98.886 E.7556
G1 X101.596 Y98.886 E.01342
G1 X79.114 Y76.405 E.77458
G1 X79.114 Y75.854 E.01342
G1 X102.147 Y98.886 E.79356
G1 X102.698 Y98.886 E.01342
G1 X79.114 Y75.303 E.81254
G1 X79.114 Y74.752 E.01342
G1 X103.249 Y98.886 E.83152
G1 X103.8 Y98.886 E.01342
G1 X79.115 Y74.201 E.85051
G1 X79.115 Y73.65 E.01342
G1 X104.351 Y98.886 E.86949
G1 X104.902 Y98.886 E.01342
G1 X79.115 Y73.099 E.88847
G1 X79.115 Y72.614 E.01182
G1 X79.18 Y72.614 E.0016
G1 X105.386 Y98.82 E.9029
G1 X105.386 Y98.269 E.01342
G1 X79.731 Y72.614 E.88391
G1 X80.282 Y72.614 E.01342
G1 X105.386 Y97.718 E.86493
G1 X105.386 Y97.167 E.01342
G1 X80.833 Y72.614 E.84594
G1 X81.384 Y72.614 E.01342
G1 X105.386 Y96.616 E.82696
G1 X105.386 Y96.065 E.01342
G1 X81.935 Y72.614 E.80797
M73 P59 R3
G1 X82.486 Y72.614 E.01342
G1 X105.386 Y95.514 E.78899
G1 X105.386 Y94.963 E.01342
G1 X83.037 Y72.614 E.77
G1 X83.588 Y72.614 E.01342
G1 X105.386 Y94.412 E.75102
G1 X105.386 Y93.861 E.01342
G1 X84.139 Y72.614 E.73204
G1 X84.691 Y72.614 E.01342
G1 X105.386 Y93.31 E.71305
G1 X105.386 Y92.759 E.01342
G1 X85.242 Y72.614 E.69407
G1 X85.793 Y72.614 E.01342
G1 X105.386 Y92.208 E.67508
G1 X105.386 Y91.657 E.01342
G1 X86.344 Y72.614 E.6561
G1 X86.895 Y72.614 E.01342
G1 X105.386 Y91.106 E.63711
G1 X105.386 Y90.555 E.01342
G1 X87.446 Y72.614 E.61813
G1 X87.997 Y72.614 E.01342
G1 X105.386 Y90.004 E.59914
G1 X105.386 Y89.453 E.01342
G1 X88.548 Y72.614 E.58016
G1 X89.099 Y72.614 E.01342
G1 X105.386 Y88.902 E.56117
G1 X105.386 Y88.351 E.01342
G1 X89.65 Y72.614 E.54219
G1 X90.201 Y72.614 E.01342
G1 X105.386 Y87.8 E.5232
G1 X105.386 Y87.249 E.01342
G1 X90.752 Y72.614 E.50422
G1 X91.303 Y72.614 E.01342
G1 X105.386 Y86.698 E.48523
G1 X105.386 Y86.147 E.01342
G1 X91.854 Y72.614 E.46625
G1 X92.405 Y72.614 E.01342
G1 X105.386 Y85.596 E.44727
G1 X105.386 Y85.045 E.01342
G1 X92.956 Y72.614 E.42828
G1 X93.507 Y72.614 E.01342
G1 X105.386 Y84.494 E.4093
G1 X105.386 Y83.943 E.01342
G1 X94.058 Y72.614 E.39031
G1 X94.609 Y72.614 E.01342
G1 X105.386 Y83.392 E.37133
G1 X105.386 Y82.841 E.01342
G1 X95.16 Y72.614 E.35234
G1 X95.711 Y72.614 E.01342
G1 X105.386 Y82.29 E.33336
G1 X105.386 Y81.739 E.01342
G1 X96.262 Y72.614 E.31437
G1 X96.813 Y72.614 E.01342
G1 X105.386 Y81.188 E.29539
G1 X105.386 Y80.637 E.01342
G1 X97.364 Y72.614 E.2764
G1 X97.915 Y72.614 E.01342
G1 X105.386 Y80.086 E.25742
M73 P60 R3
G1 X105.386 Y79.534 E.01342
G1 X98.466 Y72.614 E.23843
G1 X99.017 Y72.614 E.01342
G1 X105.56 Y79.157 E.22543
; WIPE_START
G1 X104.853 Y78.45 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I1.148 J-.405 P1  F42000
G1 X104.253 Y76.748 Z.92
G1 Z.52
G1 E.4 F1800
G1 F12512.191
M204 S6000
G1 X105.386 Y77.881 E.03906
G1 X105.386 Y78.432 E.01342
G1 X99.568 Y72.614 E.20046
G1 X100.119 Y72.614 E.01342
G1 X103.005 Y75.5 E.09944
G3 X102.779 Y74.723 I3.14 J-1.335 E.01976
G1 X100.67 Y72.614 E.07266
G1 X101.221 Y72.614 E.01342
G1 X102.738 Y74.131 E.05226
G3 X102.784 Y73.626 I4.561 J.164 E.01235
G1 X101.772 Y72.614 E.03487
G1 X102.323 Y72.614 E.01342
G1 X103.035 Y73.326 E.02452
; WIPE_START
G1 X102.327 Y72.619 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I.655 J1.026 P1  F42000
G1 X104.936 Y70.954 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100697
G1 F18000
M204 S6000
G1 X105.011 Y70.86 E.0005
G1 X105.074 Y70.837 E.00028
; WIPE_START
G1 X105.011 Y70.86 E-.13561
G1 X104.936 Y70.954 E-.24439
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I.083 J1.214 P1  F42000
G1 X106.907 Y70.819 Z.92
G1 Z.52
G1 E.4 F1800
; LINE_WIDTH: 0.144793
G1 F18000
M204 S6000
G3 X107.112 Y70.954 I-.091 J.363 E.00172
G1 X107.134 Y70.997 E.00033
; LINE_WIDTH: 0.104758
G1 X107.164 Y71.076 E.00037
; WIPE_START
G1 X107.134 Y70.997 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.217 J.019 P1  F42000
G1 X107.163 Y72.924 Z.92
G1 Z.52
G1 E.4 F1800
; LINE_WIDTH: 0.120038
G1 F18000
M204 S6000
G3 X107.065 Y73.19 I-5.427 J-1.855 E.00152
M204 S10000
G1 X107.163 Y73.276 F42000
; LINE_WIDTH: 0.119956
G1 F18000
M204 S6000
G2 X107.065 Y73.01 I-5.115 J1.746 E.00152
M204 S10000
G1 X106.972 Y73.1 F42000
; LINE_WIDTH: 0.0978264
G1 F18000
M204 S6000
G1 X107.182 Y73.1 E.00083
; WIPE_START
G1 X106.972 Y73.1 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-.076 J-1.215 P1  F42000
G1 X106.159 Y73.151 Z.92
G1 Z.52
G1 E.4 F1800
; LINE_WIDTH: 0.0978199
G1 F18000
M204 S6000
G2 X106.427 Y72.995 I-2.853 J-5.203 E.00123
M204 S10000
G1 X106.417 Y72.978 F42000
; LINE_WIDTH: 0.143949
G1 F18000
M204 S6000
G2 X106.266 Y73.1 I.273 J.491 E.00134
G1 X106.274 Y73.109 E.00009
G2 X106.417 Y73.222 I.453 J-.426 E.00125
M204 S10000
G1 X106.427 Y73.205 F42000
; LINE_WIDTH: 0.0978264
G1 F18000
M204 S6000
G2 X106.159 Y73.049 I-3.131 J5.065 E.00123
M204 S10000
G1 X106.337 Y73.1 F42000
; LINE_WIDTH: 0.130186
G1 F18000
M204 S6000
G1 X105.783 Y73.099 E.00332
; LINE_WIDTH: 0.146362
G3 X105.576 Y72.99 I.113 J-.465 E.00165
M204 S10000
G1 X105.573 Y72.995 F42000
; LINE_WIDTH: 0.0978162
G1 F18000
M204 S6000
G2 X105.843 Y73.153 I3.54 J-5.736 E.00124
; WIPE_START
G1 X105.573 Y72.995 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-.975 J.728 P1  F42000
G1 X107.163 Y75.124 Z.92
G1 Z.52
G1 E.4 F1800
; LINE_WIDTH: 0.106156
G1 F18000
M204 S6000
G1 X107.137 Y75.201 E.00037
G1 X107.019 Y75.29 E.00066
; WIPE_START
G1 X107.137 Y75.201 E-.24468
G1 X107.163 Y75.124 E-.13532
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-.153 J-1.207 P1  F42000
G1 X79.666 Y78.61 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423956
G1 F12512.191
M204 S6000
G1 X78.941 Y77.884 E.025
; WIPE_START
G1 X79.648 Y78.591 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I1.013 J.674 P1  F42000
G1 X106.825 Y37.732 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.834 Y36.656 I-.828 J-.233 E.08803
G1 X105.971 Y36.64 E.00334
G3 X106.84 Y37.674 I.027 J.859 E.03744
; WIPE_START
M204 S6000
G1 X106.766 Y37.892 E-.08767
G1 X106.673 Y38.036 E-.06511
G1 X106.449 Y38.234 E-.11355
G1 X106.294 Y38.308 E-.06507
G1 X106.17 Y38.34 E-.04861
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.19 J-.256 P1  F42000
G1 X105.726 Y40.41 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G1 X105.727 Y60.727 E.52806
G1 X82.774 Y60.727 E.59656
G1 X82.774 Y56.223 E.11705
G1 X83.773 Y56.223 E.02598
G1 X83.773 Y42.277 E.36249
G1 X82.774 Y42.277 E.02598
G1 X82.774 Y37.773 E.11705
G1 X103.081 Y37.774 E.52778
G2 X105.666 Y40.403 I2.926 J-.291 E.1036
M204 S10000
G1 X106.141 Y40.007 F42000
G1 F11728.231
M204 S6000
G1 X106.142 Y61.142 E.54934
G1 X82.359 Y61.142 E.61816
G1 X82.358 Y55.808 E.13866
G1 X83.358 Y55.808 E.02598
G1 X83.358 Y42.692 E.34088
G1 X82.358 Y42.692 E.02598
G1 X82.359 Y37.358 E.13865
G1 X103.496 Y37.358 E.54938
G2 X106.081 Y40.009 I2.511 J.138 E.10818
M204 S10000
G1 X106.557 Y39.521 F42000
G1 F11728.231
M204 S6000
G1 X106.558 Y61.558 E.57277
G1 X81.943 Y61.558 E.63977
G1 X81.942 Y55.392 E.16026
G1 X82.942 Y55.392 E.02598
G1 X82.942 Y43.108 E.31927
G1 X81.942 Y43.108 E.02598
G1 X81.943 Y36.942 E.16026
G1 X103.982 Y36.942 E.57282
G2 X106.499 Y39.536 I2.024 J.554 E.11316
M204 S10000
M73 P61 R3
G1 X106.973 Y38.878 F42000
G1 F11728.231
M204 S6000
G1 X106.974 Y61.974 E.60028
G1 X81.527 Y61.974 E.66137
G1 X81.526 Y54.976 E.18187
G1 X82.526 Y54.976 E.02599
M73 P61 R2
G1 X82.526 Y43.524 E.29767
G1 X81.526 Y43.524 E.02599
G1 X81.527 Y36.526 E.18187
G1 X104.627 Y36.527 E.60039
G2 X106.923 Y38.911 I1.382 J.967 E.12071
; WIPE_START
G1 X106.925 Y39.911 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I1.206 J.162 P1  F42000
G1 X107.191 Y37.923 Z.92
G1 Z.52
G1 E.4 F1800
G1 F11728.231
M204 S6000
G1 X107.388 Y37.965 E.00523
G1 X107.389 Y61.985 E.62429
G3 X106.985 Y62.389 I-.396 J.009 E.01661
G1 X81.515 Y62.389 E.662
G3 X81.112 Y62.019 I-.009 J-.395 E.01572
G1 X81.111 Y54.561 E.19385
G1 X82.111 Y54.561 E.02599
G1 X82.111 Y43.939 E.27606
G1 X81.111 Y43.939 E.02599
G1 X81.112 Y36.481 E.19384
G3 X81.515 Y36.111 I.394 J.024 E.01573
G1 X105.533 Y36.111 E.62426
G1 X105.578 Y36.305 E.00517
G2 X107.17 Y37.979 I.424 J1.191 E.1307
M204 S10000
G1 X107.197 Y37.074 F42000
G1 F11728.231
M204 S6000
G2 X106.423 Y36.311 I-1.276 J.521 E.02904
G1 X106.463 Y36.111 E.0053
G1 X107.005 Y36.111 E.01407
G3 X107.388 Y36.481 I-.01 J.394 E.0152
G1 X107.388 Y37.028 E.01421
G1 X107.256 Y37.06 E.00354
; WIPE_START
G1 X107.024 Y36.764 E-.14281
G1 X106.858 Y36.575 E-.09551
G1 X106.658 Y36.424 E-.09528
G1 X106.548 Y36.371 E-.0464
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-.709 J-.989 P1  F42000
G1 X81.71 Y54.16 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X81.71 Y44.34 E.23681
G1 X80.71 Y44.34 E.02411
G1 X80.711 Y36.461 E.18999
G3 X81.505 Y35.71 I.799 J.049 E.02903
G1 X107.016 Y35.711 E.6152
G3 X107.789 Y36.461 I-.026 J.8 E.0285
G1 X107.79 Y61.995 E.61574
G3 X106.995 Y62.79 I-.8 J-.004 E.03008
G1 X81.505 Y62.79 E.61469
G3 X80.711 Y62.038 I.005 J-.8 E.02902
G1 X80.71 Y54.16 E.18999
G1 X81.65 Y54.16 E.02267
; WIPE_START
M204 S6000
G1 X81.656 Y53.16 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.195 J.232 P1  F42000
G1 X82.941 Y59.776 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421426
G1 F12593.97
M204 S6000
G1 X83.551 Y60.386 E.02088
G1 X84.099 Y60.386 E.01325
G1 X83.115 Y59.402 E.03368
G1 X83.114 Y58.855 E.01325
G1 X84.646 Y60.386 E.05242
G1 X85.193 Y60.386 E.01325
G1 X83.114 Y58.307 E.07116
G1 X83.114 Y57.76 E.01325
G1 X85.741 Y60.386 E.08991
G1 X86.288 Y60.386 E.01325
G1 X83.114 Y57.212 E.10865
G1 X83.114 Y56.665 E.01325
G1 X86.836 Y60.386 E.12739
G1 X87.383 Y60.386 E.01325
G1 X83.561 Y56.564 E.13084
G1 X84.108 Y56.564 E.01325
G1 X87.931 Y60.386 E.13084
G1 X88.478 Y60.386 E.01325
G1 X84.114 Y56.022 E.14939
G1 X84.114 Y55.474 E.01325
G1 X89.025 Y60.386 E.16813
G1 X89.573 Y60.386 E.01325
G1 X84.114 Y54.927 E.18687
G1 X84.114 Y54.38 E.01325
G1 X90.12 Y60.386 E.2056
G1 X90.668 Y60.386 E.01325
G1 X84.114 Y53.832 E.22434
G1 X84.114 Y53.285 E.01325
G1 X91.215 Y60.386 E.24308
G1 X91.763 Y60.386 E.01325
G1 X84.114 Y52.737 E.26182
G1 X84.114 Y52.19 E.01325
G1 X92.31 Y60.386 E.28056
G1 X92.857 Y60.386 E.01325
G1 X84.114 Y51.642 E.2993
G1 X84.114 Y51.095 E.01325
G1 X93.405 Y60.386 E.31804
G1 X93.952 Y60.386 E.01325
G1 X84.114 Y50.548 E.33677
M73 P62 R2
G1 X84.114 Y50 E.01325
G1 X94.5 Y60.386 E.35551
G1 X95.047 Y60.386 E.01325
G1 X84.114 Y49.453 E.37425
G1 X84.114 Y48.905 E.01325
G1 X95.595 Y60.386 E.39299
G1 X96.142 Y60.386 E.01325
G1 X84.114 Y48.358 E.41173
G1 X84.114 Y47.811 E.01325
G1 X96.689 Y60.386 E.43047
G1 X97.237 Y60.386 E.01325
G1 X84.114 Y47.263 E.44921
G1 X84.114 Y46.716 E.01325
G1 X97.784 Y60.386 E.46794
G1 X98.332 Y60.386 E.01325
G1 X84.114 Y46.168 E.48668
G1 X84.114 Y45.621 E.01325
G1 X98.879 Y60.386 E.50542
G1 X99.427 Y60.386 E.01325
G1 X84.114 Y45.073 E.52416
G1 X84.114 Y44.526 E.01325
G1 X99.974 Y60.386 E.5429
G1 X100.521 Y60.386 E.01325
G1 X84.114 Y43.979 E.56164
G1 X84.114 Y43.431 E.01325
G1 X101.069 Y60.386 E.58037
G1 X101.616 Y60.386 E.01325
G1 X84.114 Y42.884 E.59911
G1 X84.114 Y42.336 E.01325
G1 X102.337 Y60.56 E.62379
; WIPE_START
G1 X101.63 Y59.853 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I1.205 J.17 P1  F42000
G1 X104.936 Y36.454 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100662
G1 F18000
M204 S6000
G1 X105.011 Y36.36 E.0005
G1 X105.074 Y36.337 E.00028
; WIPE_START
G1 X105.011 Y36.36 E-.13565
G1 X104.936 Y36.454 E-.24435
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I.083 J1.214 P1  F42000
G1 X106.907 Y36.319 Z.92
G1 Z.52
G1 E.4 F1800
; LINE_WIDTH: 0.145717
G1 F18000
M204 S6000
G3 X107.116 Y36.46 I-.088 J.356 E.00179
G1 X107.127 Y36.48 E.00017
; LINE_WIDTH: 0.109755
G1 X107.162 Y36.574 E.00047
; WIPE_START
G1 X107.127 Y36.48 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.217 J.032 P1  F42000
G1 X107.18 Y38.465 Z.92
G1 Z.52
G1 E.4 F1800
; LINE_WIDTH: 0.105174
G1 F18000
M204 S6000
G1 X107.019 Y38.589 E.0009
; WIPE_START
G1 X107.18 Y38.465 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.06 J-.598 P1  F42000
G1 X105.559 Y41.337 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421426
G1 F12593.97
M204 S6000
G1 X104.726 Y40.504 E.02851
G3 X102.994 Y38.772 I1.279 J-3.011 E.06077
G1 X102.336 Y38.114 E.02251
G1 X101.789 Y38.114 E.01325
G1 X105.385 Y41.711 E.12311
G1 X105.385 Y42.258 E.01325
G1 X101.241 Y38.114 E.14185
G1 X100.694 Y38.114 E.01325
G1 X105.385 Y42.806 E.16059
G1 X105.385 Y43.353 E.01325
G1 X100.146 Y38.114 E.17933
G1 X99.599 Y38.114 E.01325
G1 X105.385 Y43.901 E.19807
G1 X105.385 Y44.448 E.01325
G1 X99.052 Y38.114 E.21681
G1 X98.504 Y38.114 E.01325
G1 X105.385 Y44.995 E.23555
G1 X105.385 Y45.543 E.01325
G1 X97.957 Y38.114 E.25429
G1 X97.409 Y38.114 E.01325
G1 X105.386 Y46.09 E.27303
G1 X105.386 Y46.638 E.01325
G1 X96.862 Y38.114 E.29177
G1 X96.314 Y38.114 E.01325
G1 X105.386 Y47.185 E.31051
G1 X105.386 Y47.733 E.01325
G1 X95.767 Y38.114 E.32925
G1 X95.219 Y38.114 E.01325
G1 X105.386 Y48.28 E.34799
G1 X105.386 Y48.828 E.01325
G1 X94.672 Y38.114 E.36673
G1 X94.125 Y38.114 E.01325
G1 X105.386 Y49.375 E.38547
G1 X105.386 Y49.923 E.01325
G1 X93.577 Y38.114 E.40421
M73 P63 R2
G1 X93.03 Y38.114 E.01325
G1 X105.386 Y50.47 E.42295
G1 X105.386 Y51.017 E.01325
G1 X92.482 Y38.114 E.44169
G1 X91.935 Y38.114 E.01325
G1 X105.386 Y51.565 E.46043
G1 X105.386 Y52.112 E.01325
G1 X91.387 Y38.114 E.47917
G1 X90.84 Y38.114 E.01325
G1 X105.386 Y52.66 E.49791
G1 X105.386 Y53.207 E.01325
G1 X90.293 Y38.114 E.51665
G1 X89.745 Y38.114 E.01325
G1 X105.386 Y53.755 E.53539
G1 X105.386 Y54.302 E.01325
G1 X89.198 Y38.114 E.55413
G1 X88.65 Y38.114 E.01325
G1 X105.386 Y54.85 E.57287
G1 X105.386 Y55.397 E.01325
G1 X88.103 Y38.114 E.59161
G1 X87.555 Y38.114 E.01325
G1 X105.386 Y55.945 E.61035
G1 X105.386 Y56.492 E.01325
G1 X87.008 Y38.114 E.62909
G1 X86.46 Y38.114 E.01325
G1 X105.386 Y57.039 E.64783
G1 X105.386 Y57.587 E.01325
G1 X85.913 Y38.114 E.66657
G1 X85.366 Y38.114 E.01325
G1 X105.386 Y58.134 E.68531
G1 X105.386 Y58.682 E.01325
G1 X84.818 Y38.114 E.70405
G1 X84.271 Y38.114 E.01325
G1 X105.386 Y59.229 E.72279
G1 X105.386 Y59.777 E.01325
G1 X83.723 Y38.114 E.74153
G1 X83.176 Y38.114 E.01325
G1 X105.386 Y60.324 E.76027
G1 X105.386 Y60.386 E.0015
G1 X104.901 Y60.386 E.01175
G1 X83.115 Y38.6 E.74574
G1 X83.115 Y39.147 E.01325
G1 X104.353 Y60.386 E.72701
G1 X103.806 Y60.386 E.01325
G1 X83.114 Y39.695 E.70827
G1 X83.114 Y40.242 E.01325
G1 X103.258 Y60.386 E.68954
G1 X102.711 Y60.386 E.01325
G1 X83.114 Y40.789 E.6708
G1 X83.114 Y41.337 E.01325
G1 X83.714 Y41.936 E.02052
G1 X83.166 Y41.936 E.01325
G1 X82.941 Y41.711 E.00772
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12593.97
G1 X83.166 Y41.936 E-.12124
G1 X83.714 Y41.936 E-.20802
G1 X83.619 Y41.842 E-.05074
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 4/5
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S76.5
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I-1.171 J.331 P1  F42000
G1 X103.081 Y110.774 Z.92
G1 Z.68
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
M73 P64 R2
G2 X103.289 Y111.592 I3.327 J-.411 E.02202
G2 X103.289 Y113.792 I2.724 J1.1 E.05861
G2 X105.727 Y117.81 I2.715 J1.101 E.14172
G1 X105.727 Y142.227 E.63462
G1 X74.273 Y142.227 E.81751
G1 X74.273 Y133.473 E.22751
G1 X75.273 Y133.473 E.02599
G1 X75.273 Y119.527 E.36249
G1 X74.273 Y119.527 E.02599
G1 X74.273 Y110.773 E.22751
G1 X103.021 Y110.774 E.74718
M204 S10000
G1 X103.496 Y110.358 F42000
G1 F11728.231
M204 S6000
G2 X103.746 Y111.599 I2.435 J.154 E.0333
G2 X103.746 Y113.799 I2.231 J1.1 E.05923
G2 X106.142 Y117.407 I2.259 J1.099 E.1357
G1 X106.142 Y142.642 E.6559
G1 X73.858 Y142.642 E.83912
G1 X73.858 Y133.058 E.24912
G1 X74.858 Y133.058 E.02599
G1 X74.858 Y119.942 E.34088
G1 X73.858 Y119.942 E.02599
G1 X73.858 Y110.358 E.24912
G1 X103.436 Y110.358 E.76877
M204 S10000
G1 X103.982 Y109.942 F42000
G1 F11728.231
M204 S6000
G2 X104.217 Y111.606 I2.174 J.542 E.04476
G2 X104.217 Y113.806 I1.808 J1.1 E.06013
G2 X106.558 Y116.921 I1.798 J1.086 E.12969
G1 X106.558 Y143.058 E.67934
G1 X73.442 Y143.058 E.86072
G1 X73.442 Y132.642 E.27072
G1 X74.442 Y132.642 E.02599
G1 X74.442 Y120.358 E.31927
G1 X73.442 Y120.358 E.02599
G1 X73.442 Y109.942 E.27073
G1 X103.922 Y109.942 E.79222
M204 S10000
G1 X104.627 Y109.527 F42000
G1 F11728.231
M204 S6000
G2 X104.731 Y111.595 I1.392 J.967 E.05792
G2 X104.731 Y113.795 I1.313 J1.1 E.06209
G2 X106.974 Y116.278 I1.284 J1.094 E.12634
G1 X106.974 Y143.474 E.70686
G1 X73.026 Y143.474 E.88233
G1 X73.026 Y132.226 E.29233
G1 X74.026 Y132.226 E.02599
G1 X74.026 Y120.774 E.29767
G1 X73.026 Y120.774 E.02599
G1 X73.026 Y109.526 E.29233
G1 X104.567 Y109.527 E.81978
; WIPE_START
G1 X104.507 Y109.735 E-.08235
G1 X104.385 Y110.046 E-.12696
G1 X104.327 Y110.374 E-.12677
G1 X104.324 Y110.49 E-.04392
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I.836 J.884 P1  F42000
G1 X105.578 Y109.305 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F11728.231
M204 S6000
G2 X105.142 Y111.425 I.441 J1.196 E.0672
G1 X105.358 Y111.606 E.00732
G2 X105.142 Y113.625 I.667 J1.092 E.06095
G1 X105.358 Y113.806 E.00732
G2 X107.186 Y115.326 I.643 J1.086 E.12555
G1 X107.389 Y115.364 E.00537
G1 X107.389 Y143.485 E.73088
G3 X106.985 Y143.889 I-.396 J.009 E.01662
G1 X73.015 Y143.889 E.88291
G3 X72.611 Y143.485 I-.009 J-.396 E.01662
G1 X72.611 Y131.811 E.30342
M73 P65 R2
G1 X73.611 Y131.811 E.02599
G1 X73.611 Y121.189 E.27606
G1 X72.611 Y121.189 E.02599
G1 X72.611 Y109.515 E.30342
G3 X73.015 Y109.111 I.396 J-.009 E.01662
G1 X105.534 Y109.111 E.8452
G1 X105.565 Y109.246 E.00361
M204 S250
G1 X106.128 Y109.65 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.833 Y109.656 I-.13 J.85 E.1231
G1 X105.964 Y109.641 E.00318
G3 X106.069 Y109.643 I.035 J.859 E.00253
; WIPE_START
M204 S6000
G1 X106.294 Y109.692 E-.08775
G1 X106.449 Y109.766 E-.06512
G1 X106.585 Y109.869 E-.06503
G1 X106.745 Y110.07 E-.09752
G1 X106.815 Y110.225 E-.06457
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I.457 J1.128 P1  F42000
G1 X107.186 Y110.074 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X106.423 Y109.311 I-1.197 J.434 E.02899
G1 X106.463 Y109.111 E.0053
G3 X107.037 Y109.113 I.267 J5.461 E.01493
G3 X107.389 Y109.515 I-.039 J.39 E.0153
G1 X107.389 Y110.036 E.01353
G1 X107.245 Y110.063 E.00381
M204 S10000
G1 X107.192 Y110.92 F42000
G1 F11728.231
M204 S6000
G1 X107.389 Y110.963 E.00524
G1 X107.389 Y112.236 E.03309
G1 X107.186 Y112.274 E.00537
G2 X106.642 Y111.594 I-1.404 J.566 E.02297
G2 X107.169 Y110.976 I-.814 J-1.226 E.02139
; WIPE_START
G1 X107.389 Y110.963 E-.08396
G1 X107.389 Y111.742 E-.29604
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-.998 J-.696 P1  F42000
G1 X106.128 Y113.55 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.833 Y111.856 I-.13 J-.85 E.06425
G1 X105.964 Y111.841 E.00318
G3 X106.187 Y113.538 I.035 J.859 E.06139
M204 S10000
G1 X106.637 Y113.79 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X107.192 Y113.12 I-.757 J-1.193 E.02298
G1 X107.389 Y113.163 E.00523
G1 X107.389 Y114.436 E.03309
G1 X107.186 Y114.474 E.00537
G2 X106.686 Y113.825 I-1.409 J.569 E.02158
M204 S250
G1 X106.128 Y114.05 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.833 Y114.056 I-.13 J.85 E.12311
G1 X105.964 Y114.041 E.00318
G3 X106.069 Y114.043 I.035 J.859 E.00253
; WIPE_START
M204 S6000
G1 X106.294 Y114.092 E-.08776
G1 X106.449 Y114.166 E-.06509
G1 X106.585 Y114.269 E-.06506
G1 X106.745 Y114.47 E-.09746
G1 X106.815 Y114.625 E-.06463
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-.544 J-1.089 P1  F42000
G1 X73.21 Y131.41 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F12000
M204 S5000
G1 X73.21 Y121.59 E.23681
G1 X72.21 Y121.59 E.02412
G1 X72.21 Y109.505 E.29142
G3 X73.005 Y108.71 I.8 J.004 E.03008
G1 X107.007 Y108.71 E.81995
G3 X107.79 Y109.505 I-.016 J.799 E.02979
G1 X107.79 Y143.495 E.81966
G3 X106.995 Y144.29 I-.8 J-.005 E.03008
G1 X73.005 Y144.29 E.81966
G3 X72.21 Y143.495 I.005 J-.8 E.03008
G1 X72.21 Y131.41 E.29142
G1 X73.15 Y131.41 E.02267
; WIPE_START
M204 S6000
G1 X73.156 Y130.41 E-.38
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

G1 X75.44 Y133.135
G1 Z.68
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420856
G1 F12612.543
M204 S6000
G1 X97.461 Y111.114 E.75266
G1 X96.914 Y111.114 E.01321
G1 X75.614 Y132.414 E.72804
G1 X75.614 Y131.868 E.01321
G1 X96.368 Y111.114 E.70936
G1 X95.821 Y111.114 E.01321
G1 X75.614 Y131.321 E.69068
G1 X75.614 Y130.775 E.01321
G1 X95.274 Y111.114 E.67199
G1 X94.728 Y111.114 E.01321
G1 X75.614 Y130.228 E.65331
G1 X75.614 Y129.681 E.01321
G1 X94.181 Y111.114 E.63463
G1 X93.634 Y111.114 E.01321
G1 X75.614 Y129.135 E.61594
G1 X75.614 Y128.588 E.01321
G1 X93.088 Y111.114 E.59726
G1 X92.541 Y111.114 E.01321
G1 X75.614 Y128.041 E.57858
G1 X75.614 Y127.495 E.01321
G1 X91.995 Y111.114 E.55989
G1 X91.448 Y111.114 E.01321
G1 X75.614 Y126.948 E.54121
M73 P66 R2
G1 X75.614 Y126.402 E.01321
G1 X90.901 Y111.114 E.52253
G1 X90.355 Y111.114 E.01321
G1 X75.614 Y125.855 E.50385
G1 X75.614 Y125.308 E.01321
G1 X89.808 Y111.114 E.48516
G1 X89.262 Y111.114 E.01321
G1 X75.614 Y124.762 E.46648
G1 X75.614 Y124.215 E.01321
G1 X88.715 Y111.114 E.4478
G1 X88.168 Y111.114 E.01321
G1 X75.614 Y123.668 E.42911
G1 X75.614 Y123.122 E.01321
G1 X87.622 Y111.114 E.41043
G1 X87.075 Y111.114 E.01321
G1 X75.614 Y122.575 E.39175
G1 X75.614 Y122.029 E.01321
G1 X86.528 Y111.114 E.37306
G1 X85.982 Y111.114 E.01321
G1 X75.614 Y121.482 E.35438
G1 X75.614 Y120.935 E.01321
G1 X85.435 Y111.114 E.3357
G1 X84.889 Y111.114 E.01321
G1 X75.614 Y120.389 E.31701
G1 X75.614 Y119.842 E.01321
G1 X84.342 Y111.114 E.29833
G1 X83.795 Y111.114 E.01321
G1 X75.614 Y119.295 E.27965
G1 X75.614 Y119.186 E.00264
G1 X75.176 Y119.186 E.01057
G1 X83.249 Y111.114 E.27592
G1 X82.702 Y111.114 E.01321
G1 X74.63 Y119.186 E.27592
G1 X74.614 Y119.186 E.00039
G1 X74.614 Y118.656 E.01283
G1 X82.156 Y111.114 E.25778
G1 X81.609 Y111.114 E.01321
G1 X74.614 Y118.109 E.23909
G1 X74.614 Y117.562 E.01321
G1 X81.062 Y111.114 E.22041
G1 X80.516 Y111.114 E.01321
G1 X74.614 Y117.016 E.20173
G1 X74.614 Y116.469 E.01321
G1 X79.969 Y111.114 E.18304
G1 X79.422 Y111.114 E.01321
G1 X74.614 Y115.923 E.16436
G1 X74.614 Y115.376 E.01321
G1 X78.876 Y111.114 E.14568
G1 X78.329 Y111.114 E.01321
G1 X74.614 Y114.829 E.12699
G1 X74.614 Y114.283 E.01321
G1 X77.783 Y111.114 E.10831
G1 X77.236 Y111.114 E.01321
G1 X74.614 Y113.736 E.08963
G1 X74.614 Y113.189 E.01321
G1 X76.689 Y111.114 E.07095
G1 X76.143 Y111.114 E.01321
G1 X74.614 Y112.643 E.05226
G1 X74.614 Y112.096 E.01321
G1 X75.596 Y111.114 E.03358
G1 X75.049 Y111.114 E.01321
G1 X74.44 Y111.723 E.02083
; WIPE_START
G1 X75.049 Y111.114 E-.32747
G1 X75.188 Y111.114 E-.05254
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-1.217 J-.014 P1  F42000
G1 X74.934 Y133.64 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F12612.543
M204 S6000
G1 X74.614 Y133.961 E.01096
G1 X74.614 Y134.508 E.01321
G1 X98.007 Y111.114 E.79959
G1 X98.554 Y111.114 E.01321
G1 X74.614 Y135.054 E.81827
G1 X74.614 Y135.601 E.01321
G1 X99.101 Y111.114 E.83696
G1 X99.647 Y111.114 E.01321
G1 X74.614 Y136.148 E.85564
G1 X74.614 Y136.694 E.01321
G1 X100.194 Y111.114 E.87432
G1 X100.74 Y111.114 E.01321
G1 X74.614 Y137.241 E.89301
G1 X74.614 Y137.787 E.01321
G1 X101.287 Y111.114 E.91169
M73 P67 R2
G1 X101.834 Y111.114 E.01321
G1 X74.614 Y138.334 E.93037
G1 X74.614 Y138.881 E.01321
G1 X102.38 Y111.114 E.94906
G1 X102.795 Y111.114 E.01002
G1 X102.815 Y111.226 E.00275
G1 X74.614 Y139.427 E.96391
G1 X74.614 Y139.974 E.01321
G1 X102.897 Y111.691 E.96671
G2 X102.751 Y112.383 I3.21 J1.037 E.01713
G1 X74.614 Y140.52 E.96173
G1 X74.614 Y141.067 E.01321
G1 X102.746 Y112.935 E.96154
G2 X102.813 Y113.415 I2.43 J-.096 E.01172
G1 X74.614 Y141.614 E.96384
G1 X74.614 Y141.886 E.00659
G1 X74.888 Y141.886 E.00662
G1 X102.904 Y113.87 E.95758
G2 X102.753 Y114.567 I3.158 J1.047 E.01727
G1 X75.434 Y141.886 E.93375
G1 X75.981 Y141.886 E.01321
G1 X102.745 Y115.123 E.91477
G2 X102.811 Y115.603 I2.433 J-.09 E.01174
G1 X76.528 Y141.886 E.89835
G1 X77.074 Y141.886 E.01321
G1 X102.936 Y116.024 E.88395
G2 X103.104 Y116.403 I1.979 J-.65 E.01003
G1 X77.621 Y141.886 E.871
G1 X78.167 Y141.886 E.01321
G1 X103.308 Y116.746 E.85929
G2 X103.545 Y117.055 I1.666 J-1.032 E.00944
G1 X78.714 Y141.886 E.84872
G1 X79.261 Y141.886 E.01321
G1 X103.818 Y117.329 E.83937
G2 X104.124 Y117.57 I1.358 J-1.406 E.00942
G1 X79.807 Y141.886 E.83113
G1 X80.354 Y141.886 E.01321
G1 X104.462 Y117.778 E.82402
G2 X104.836 Y117.951 I1.052 J-1.789 E.00997
G1 X80.901 Y141.886 E.81812
G1 X81.447 Y141.886 E.01321
G1 X105.256 Y118.077 E.81379
M73 P68 R2
G1 X105.386 Y118.099 E.00318
G1 X105.386 Y118.494 E.00955
G1 X81.994 Y141.886 E.79955
G1 X82.54 Y141.886 E.01321
G1 X105.386 Y119.04 E.78087
G1 X105.386 Y119.587 E.01321
G1 X83.087 Y141.886 E.76218
G1 X83.634 Y141.886 E.01321
G1 X105.386 Y120.134 E.7435
G1 X105.386 Y120.68 E.01321
G1 X84.18 Y141.886 E.72482
G1 X84.727 Y141.886 E.01321
G1 X105.386 Y121.227 E.70613
G1 X105.386 Y121.774 E.01321
G1 X85.274 Y141.886 E.68745
G1 X85.82 Y141.886 E.01321
G1 X105.386 Y122.32 E.66876
G1 X105.386 Y122.867 E.01321
G1 X86.367 Y141.886 E.65008
G1 X86.913 Y141.886 E.01321
G1 X105.386 Y123.413 E.6314
G1 X105.386 Y123.96 E.01321
G1 X87.46 Y141.886 E.61271
G1 X88.007 Y141.886 E.01321
G1 X105.386 Y124.507 E.59403
G1 X105.386 Y125.053 E.01321
G1 X88.553 Y141.886 E.57535
G1 X89.1 Y141.886 E.01321
G1 X105.386 Y125.6 E.55666
G1 X105.386 Y126.147 E.01321
G1 X89.647 Y141.886 E.53798
G1 X90.193 Y141.886 E.01321
G1 X105.386 Y126.693 E.5193
G1 X105.386 Y127.24 E.01321
G1 X90.74 Y141.886 E.50061
G1 X91.286 Y141.886 E.01321
G1 X105.386 Y127.786 E.48193
G1 X105.386 Y128.333 E.01321
G1 X91.833 Y141.886 E.46325
G1 X92.38 Y141.886 E.01321
G1 X105.386 Y128.88 E.44456
G1 X105.386 Y129.426 E.01321
G1 X92.926 Y141.886 E.42588
G1 X93.473 Y141.886 E.01321
G1 X105.386 Y129.973 E.4072
G1 X105.386 Y130.52 E.01321
G1 X94.02 Y141.886 E.38851
G1 X94.566 Y141.886 E.01321
G1 X105.386 Y131.066 E.36983
G1 X105.386 Y131.613 E.01321
G1 X95.113 Y141.886 E.35115
G1 X95.659 Y141.886 E.01321
G1 X105.386 Y132.159 E.33246
G1 X105.386 Y132.706 E.01321
G1 X96.206 Y141.886 E.31378
G1 X96.753 Y141.886 E.01321
G1 X105.386 Y133.253 E.2951
G1 X105.386 Y133.799 E.01321
G1 X97.299 Y141.886 E.27641
M73 P69 R2
G1 X97.846 Y141.886 E.01321
G1 X105.386 Y134.346 E.25773
G1 X105.386 Y134.892 E.01321
G1 X98.392 Y141.886 E.23905
G1 X98.939 Y141.886 E.01321
G1 X105.386 Y135.439 E.22036
G1 X105.386 Y135.986 E.01321
G1 X99.486 Y141.886 E.20168
G1 X100.032 Y141.886 E.01321
G1 X105.386 Y136.532 E.183
G1 X105.386 Y137.079 E.01321
G1 X100.579 Y141.886 E.16431
G1 X101.126 Y141.886 E.01321
G1 X105.386 Y137.626 E.14563
G1 X105.386 Y138.172 E.01321
G1 X101.672 Y141.886 E.12695
G1 X102.219 Y141.886 E.01321
G1 X105.386 Y138.719 E.10826
G1 X105.386 Y139.265 E.01321
G1 X102.765 Y141.886 E.08958
G1 X103.312 Y141.886 E.01321
G1 X105.386 Y139.812 E.0709
G1 X105.386 Y140.359 E.01321
G1 X103.859 Y141.886 E.05221
G1 X104.405 Y141.886 E.01321
G1 X105.386 Y140.905 E.03353
G1 X105.386 Y141.452 E.01321
G1 X104.778 Y142.06 E.02078
; WIPE_START
G1 X105.386 Y141.452 E-.32669
G1 X105.386 Y141.312 E-.05331
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.214 J.078 P1  F42000
G1 X107.02 Y115.99 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10613
G1 F18000
M204 S6000
G1 X107.137 Y115.901 E.00066
G1 X107.163 Y115.824 E.00036
; WIPE_START
G1 X107.137 Y115.901 E-.13536
G1 X107.02 Y115.99 E-.24464
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.066 J-.587 P1  F42000
G1 X105.844 Y113.853 Z1.08
G1 Z.68
G1 E.4 F1800
; LINE_WIDTH: 0.097825
G1 F18000
M204 S6000
G3 X105.573 Y113.695 I3.056 J-5.544 E.00125
M204 S10000
G1 X105.576 Y113.69 F42000
; LINE_WIDTH: 0.146307
G1 F18000
M204 S6000
G2 X105.781 Y113.799 I.325 J-.364 E.00164
; LINE_WIDTH: 0.130195
G1 X106.337 Y113.8 E.00333
M204 S10000
G1 X106.324 Y113.733 F42000
; LINE_WIDTH: 0.0938261
G1 F18000
M204 S6000
G2 X106.269 Y113.765 I.062 J.17 E.00024
; LINE_WIDTH: 0.123756
G1 X106.256 Y113.782 E.00012
; LINE_WIDTH: 0.146225
G1 X106.244 Y113.8 E.00015
G1 X106.431 Y113.899 E.00148
M204 S10000
G1 X106.427 Y113.905 F42000
; LINE_WIDTH: 0.0977704
G1 F18000
M204 S6000
G2 X106.159 Y113.749 I-3.156 J5.109 E.00123
; WIPE_START
G1 X106.427 Y113.905 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.178 J-.305 P1  F42000
G1 X105.844 Y111.653 Z1.08
G1 Z.68
G1 E.4 F1800
; LINE_WIDTH: 0.0977583
G1 F18000
M204 S6000
G3 X105.573 Y111.495 I2.881 J-5.256 E.00124
M204 S10000
G1 X105.576 Y111.49 F42000
; LINE_WIDTH: 0.146191
G1 F18000
M204 S6000
G2 X105.781 Y111.599 I.327 J-.368 E.00164
; LINE_WIDTH: 0.130197
G1 X106.337 Y111.6 E.00333
M204 S10000
G1 X106.376 Y111.516 F42000
; LINE_WIDTH: 0.105001
G1 F18000
M204 S6000
G2 X106.272 Y111.577 I.107 J.305 E.00054
; LINE_WIDTH: 0.144458
G1 X106.253 Y111.6 E.0002
G1 X106.424 Y111.71 E.0014
M204 S10000
G1 X106.427 Y111.705 F42000
; LINE_WIDTH: 0.0977988
G1 F18000
M204 S6000
G2 X106.16 Y111.549 I-3.514 J5.694 E.00123
; WIPE_START
G1 X106.427 Y111.705 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.15 J.398 P1  F42000
G1 X107.164 Y109.576 Z1.08
G1 Z.68
G1 E.4 F1800
; LINE_WIDTH: 0.104843
G1 F18000
M204 S6000
G1 X107.134 Y109.496 E.00037
; LINE_WIDTH: 0.144952
G1 X107.112 Y109.454 E.00033
G2 X106.907 Y109.319 I-.297 J.229 E.00173
; WIPE_START
G1 X107.04 Y109.383 E-.18896
G1 X107.112 Y109.454 E-.12968
G1 X107.134 Y109.496 E-.06136
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I.094 J-1.213 P1  F42000
G1 X105.074 Y109.337 Z1.08
G1 Z.68
G1 E.4 F1800
; LINE_WIDTH: 0.100793
G1 F18000
M204 S6000
G1 X105.011 Y109.36 E.00028
G1 X104.936 Y109.454 E.0005
; WIPE_START
G1 X105.011 Y109.36 E-.24431
G1 X105.074 Y109.337 E-.13569
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.216 J.036 P1  F42000
G1 X106.128 Y73.35 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.833 Y73.356 I-.13 J.85 E.1231
G1 X105.964 Y73.341 E.00318
G3 X106.069 Y73.343 I.035 J.859 E.00253
M204 S10000
G1 X106.649 Y73.1 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X107.192 Y72.42 I-.833 J-1.223 E.02295
G1 X107.389 Y72.463 E.00524
G1 X107.389 Y73.736 E.03309
G1 X107.186 Y73.774 E.00537
G2 X106.698 Y73.135 I-1.398 J.562 E.02117
; WIPE_START
G1 X106.951 Y72.829 E-.15094
G1 X107.056 Y72.691 E-.06596
G1 X107.192 Y72.42 E-.11517
G1 X107.316 Y72.447 E-.04793
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.204 J-.178 P1  F42000
G1 X107.186 Y71.574 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F11728.231
M204 S6000
G2 X106.423 Y70.811 I-1.197 J.434 E.02899
G1 X106.463 Y70.611 E.0053
G3 X107.037 Y70.613 I.267 J5.437 E.01493
G3 X107.389 Y71.015 I-.039 J.39 E.0153
G1 X107.389 Y71.536 E.01353
G1 X107.245 Y71.563 E.00381
; WIPE_START
G1 X107.024 Y71.264 E-.14151
G1 X106.858 Y71.075 E-.0955
G1 X106.658 Y70.924 E-.09538
G1 X106.545 Y70.869 E-.04762
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-1.167 J-.345 P1  F42000
G1 X105.957 Y72.858 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.833 Y71.156 I.041 J-.859 E.06012
G1 X105.964 Y71.141 E.00318
G3 X106.017 Y72.859 I.035 J.859 E.06551
; WIPE_START
M204 S6000
G1 X105.788 Y72.834 E-.08776
G1 X105.627 Y72.775 E-.0652
G1 X105.481 Y72.686 E-.06503
G1 X105.355 Y72.569 E-.06509
G1 X105.255 Y72.43 E-.06517
G1 X105.221 Y72.354 E-.03174
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-.435 J-1.137 P1  F42000
G1 X103.289 Y73.092 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G2 X105.727 Y77.11 I2.715 J1.101 E.14172
G1 X105.727 Y99.227 E.57484
G1 X78.774 Y99.227 E.70052
G1 X78.774 Y92.723 E.16903
G1 X79.773 Y92.723 E.02598
G1 X79.773 Y78.777 E.36249
G1 X78.774 Y78.777 E.02598
G1 X78.774 Y72.273 E.16903
G1 X103.081 Y72.274 E.63175
G2 X103.268 Y73.036 I3.327 J-.411 E.02046
M204 S10000
G1 X103.746 Y73.099 F42000
G1 F11728.231
M204 S6000
G2 X106.142 Y76.707 I2.259 J1.099 E.1357
G1 X106.142 Y99.642 E.59612
G1 X78.359 Y99.642 E.72213
G1 X78.358 Y92.308 E.19064
G1 X79.358 Y92.308 E.02598
G1 X79.358 Y79.192 E.34088
M73 P70 R2
G1 X78.358 Y79.192 E.02598
G1 X78.359 Y71.858 E.19064
G1 X103.496 Y71.858 E.65334
G2 X103.72 Y73.045 I2.436 J.154 E.03174
M204 S10000
G1 X104.217 Y73.106 F42000
G1 F11728.231
M204 S6000
G2 X106.558 Y76.221 I1.798 J1.086 E.12969
G1 X106.558 Y100.058 E.61956
G1 X77.943 Y100.058 E.74373
G1 X77.942 Y91.892 E.21224
G1 X78.942 Y91.892 E.02599
G1 X78.942 Y79.608 E.31927
G1 X77.942 Y79.608 E.02599
G1 X77.943 Y71.442 E.21224
G1 X103.982 Y71.442 E.67679
G2 X104.188 Y73.054 I2.174 J.542 E.04321
M204 S10000
G1 X104.731 Y73.095 F42000
G1 F11728.231
M204 S6000
G2 X106.974 Y75.578 I1.284 J1.094 E.12633
G1 X106.974 Y100.474 E.64708
G1 X77.528 Y100.474 E.76534
G1 X77.526 Y91.476 E.23385
G1 X78.526 Y91.476 E.02599
G1 X78.526 Y80.024 E.29767
G1 X77.526 Y80.024 E.02599
G1 X77.528 Y71.026 E.23385
G1 X104.627 Y71.027 E.70435
G2 X104.692 Y73.049 I1.392 J.968 E.05636
M204 S10000
G1 X105.358 Y73.106 F42000
G1 F11728.231
M204 S6000
G2 X107.192 Y74.62 I.643 J1.089 E.12608
G1 X107.389 Y74.663 E.00524
G1 X107.389 Y100.485 E.67114
G3 X106.985 Y100.889 I-.396 J.009 E.01662
G1 X77.515 Y100.889 E.76594
G3 X77.112 Y100.519 I-.009 J-.395 E.01573
G1 X77.111 Y91.061 E.24583
G1 X78.111 Y91.061 E.02599
G1 X78.111 Y80.439 E.27606
G1 X77.111 Y80.439 E.02599
G1 X77.112 Y70.981 E.24583
G3 X77.515 Y70.611 I.394 J.024 E.01573
G1 X105.534 Y70.611 E.72824
G1 X105.578 Y70.805 E.00517
G2 X105.142 Y72.925 I.441 J1.196 E.0672
G1 X105.312 Y73.067 E.00576
; WIPE_START
G1 X105.097 Y73.319 E-.12588
G1 X104.94 Y73.516 E-.09544
G1 X104.826 Y73.739 E-.09542
G1 X104.786 Y73.858 E-.04786
G1 X104.779 Y73.898 E-.0154
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-.641 J-1.035 P1  F42000
G1 X77.71 Y90.66 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X77.71 Y80.84 E.23681
G1 X76.71 Y80.84 E.02411
G1 X76.711 Y70.961 E.23822
G3 X77.505 Y70.21 I.799 J.049 E.02902
G1 X107.007 Y70.21 E.71143
G3 X107.79 Y71.005 I-.016 J.799 E.02979
G1 X107.79 Y100.495 E.71114
G3 X106.995 Y101.29 I-.8 J-.005 E.03008
G1 X77.505 Y101.29 E.71114
G3 X76.711 Y100.539 I.005 J-.8 E.02902
G1 X76.71 Y90.66 E.23823
G1 X77.65 Y90.66 E.02267
; WIPE_START
M204 S6000
G1 X77.656 Y89.66 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-1.041 J.631 P1  F42000
G1 X79.614 Y92.89 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422986
G1 F12543.42
M204 S6000
G1 X78.941 Y93.564 E.02316
; WIPE_START
G1 X79.614 Y92.89 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.217 J.007 P1  F42000
G1 X79.728 Y72.44 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F12543.42
M204 S6000
G1 X79.115 Y73.053 E.02108
G1 X79.115 Y73.603 E.01336
G1 X80.104 Y72.614 E.034
G1 X80.654 Y72.614 E.01336
G1 X79.115 Y74.153 E.0529
M73 P71 R2
G1 X79.114 Y74.703 E.01336
G1 X81.203 Y72.614 E.07179
G1 X81.753 Y72.614 E.01336
G1 X79.114 Y75.252 E.09068
G1 X79.114 Y75.802 E.01336
G1 X82.303 Y72.614 E.10957
G1 X82.852 Y72.614 E.01336
G1 X79.114 Y76.352 E.12846
G1 X79.114 Y76.901 E.01336
G1 X83.402 Y72.614 E.14736
G1 X83.951 Y72.614 E.01336
G1 X79.114 Y77.451 E.16625
G1 X79.114 Y78.001 E.01336
G1 X84.501 Y72.614 E.18514
G1 X85.051 Y72.614 E.01336
G1 X79.228 Y78.436 E.2001
G1 X79.778 Y78.436 E.01336
G1 X85.6 Y72.614 E.2001
G1 X86.15 Y72.614 E.01336
G1 X80.114 Y78.65 E.20745
G1 X80.114 Y79.2 E.01336
G1 X86.7 Y72.614 E.22634
G1 X87.249 Y72.614 E.01336
G1 X80.114 Y79.749 E.24523
G1 X80.114 Y80.299 E.01336
G1 X87.799 Y72.614 E.26412
G1 X88.348 Y72.614 E.01336
G1 X80.114 Y80.849 E.28301
G1 X80.114 Y81.398 E.01336
G1 X88.898 Y72.614 E.3019
G1 X89.448 Y72.614 E.01336
G1 X80.114 Y81.948 E.32079
G1 X80.114 Y82.497 E.01336
G1 X89.997 Y72.614 E.33968
G1 X90.547 Y72.614 E.01336
G1 X80.114 Y83.047 E.35857
G1 X80.114 Y83.597 E.01336
G1 X91.097 Y72.614 E.37746
G1 X91.646 Y72.614 E.01336
G1 X80.114 Y84.146 E.39635
G1 X80.114 Y84.696 E.01336
G1 X92.196 Y72.614 E.41524
G1 X92.745 Y72.614 E.01336
G1 X80.114 Y85.246 E.43413
G1 X80.114 Y85.795 E.01336
G1 X93.295 Y72.614 E.45302
G1 X93.845 Y72.614 E.01336
G1 X80.114 Y86.345 E.47191
G1 X80.114 Y86.895 E.01336
G1 X94.394 Y72.614 E.4908
G1 X94.944 Y72.614 E.01336
G1 X80.114 Y87.444 E.50969
G1 X80.114 Y87.994 E.01336
G1 X95.494 Y72.614 E.52858
G1 X96.043 Y72.614 E.01336
G1 X80.114 Y88.543 E.54747
G1 X80.114 Y89.093 E.01336
G1 X96.593 Y72.614 E.56636
G1 X97.143 Y72.614 E.01336
G1 X80.114 Y89.643 E.58525
G1 X80.114 Y90.192 E.01336
G1 X97.692 Y72.614 E.60414
G1 X98.242 Y72.614 E.01336
G1 X80.114 Y90.742 E.62303
G1 X80.114 Y91.292 E.01336
G1 X98.791 Y72.614 E.64192
G1 X99.341 Y72.614 E.01336
G1 X80.114 Y91.841 E.66081
G1 X80.114 Y92.391 E.01336
G1 X99.891 Y72.614 E.6797
G1 X100.44 Y72.614 E.01336
G1 X79.114 Y93.94 E.73294
G1 X79.114 Y94.49 E.01336
G1 X100.99 Y72.614 E.75183
G1 X101.54 Y72.614 E.01336
G1 X79.114 Y95.039 E.77071
M73 P72 R2
G1 X79.114 Y95.589 E.01336
G1 X102.089 Y72.614 E.7896
G1 X102.639 Y72.614 E.01336
G1 X79.114 Y96.138 E.80849
G1 X79.114 Y96.688 E.01336
G1 X102.878 Y72.925 E.81669
G1 X102.931 Y73.09 E.00422
G2 X102.801 Y73.551 I2.224 J.873 E.01165
G1 X79.115 Y97.237 E.81407
G1 X79.115 Y97.787 E.01336
G1 X102.737 Y74.165 E.81185
G2 X102.771 Y74.68 I3.538 J.022 E.01256
G1 X79.115 Y98.337 E.81303
G1 X79.115 Y98.886 E.01336
G1 X102.872 Y75.129 E.81648
G2 X103.018 Y75.533 I2.088 J-.527 E.01045
G1 X79.664 Y98.886 E.80262
G1 X80.214 Y98.886 E.01336
G1 X103.208 Y75.892 E.79027
G2 X103.434 Y76.216 I1.732 J-.967 E.00961
G1 X80.764 Y98.886 E.77914
G1 X81.313 Y98.886 E.01336
G1 X103.692 Y76.507 E.76913
G2 X103.983 Y76.767 I1.445 J-1.325 E.00948
G1 X81.863 Y98.886 E.76021
G1 X82.412 Y98.886 E.01336
G1 X104.306 Y76.993 E.75244
G2 X104.669 Y77.18 I1.118 J-1.725 E.00993
G1 X82.962 Y98.886 E.74601
G1 X83.512 Y98.886 E.01336
G1 X105.07 Y77.328 E.74092
G2 X105.386 Y77.399 I.418 J-1.124 E.0079
G1 X105.386 Y77.561 E.00396
G1 X84.061 Y98.886 E.7329
G1 X84.611 Y98.886 E.01336
G1 X105.386 Y78.111 E.71401
G1 X105.386 Y78.661 E.01336
G1 X85.161 Y98.886 E.69512
G1 X85.71 Y98.886 E.01336
G1 X105.386 Y79.21 E.67623
G1 X105.386 Y79.76 E.01336
G1 X86.26 Y98.886 E.65734
G1 X86.81 Y98.886 E.01336
G1 X105.386 Y80.31 E.63845
G1 X105.386 Y80.859 E.01336
G1 X87.359 Y98.886 E.61956
G1 X87.909 Y98.886 E.01336
G1 X105.386 Y81.409 E.60067
G1 X105.386 Y81.958 E.01336
G1 X88.458 Y98.886 E.58178
M73 P73 R2
G1 X89.008 Y98.886 E.01336
G1 X105.386 Y82.508 E.56289
G1 X105.386 Y83.058 E.01336
G1 X89.558 Y98.886 E.544
G1 X90.107 Y98.886 E.01336
G1 X105.386 Y83.607 E.52511
G1 X105.386 Y84.157 E.01336
G1 X90.657 Y98.886 E.50622
G1 X91.207 Y98.886 E.01336
G1 X105.386 Y84.707 E.48733
G1 X105.386 Y85.256 E.01336
G1 X91.756 Y98.886 E.46844
G1 X92.306 Y98.886 E.01336
G1 X105.386 Y85.806 E.44955
G1 X105.386 Y86.355 E.01336
G1 X92.855 Y98.886 E.43066
G1 X93.405 Y98.886 E.01336
G1 X105.386 Y86.905 E.41177
G1 X105.386 Y87.455 E.01336
G1 X93.955 Y98.886 E.39288
G1 X94.504 Y98.886 E.01336
G1 X105.386 Y88.004 E.37399
G1 X105.386 Y88.554 E.01336
G1 X95.054 Y98.886 E.3551
G1 X95.604 Y98.886 E.01336
G1 X105.386 Y89.104 E.33621
G1 X105.386 Y89.653 E.01336
G1 X96.153 Y98.886 E.31732
G1 X96.703 Y98.886 E.01336
G1 X105.386 Y90.203 E.29843
G1 X105.386 Y90.753 E.01336
G1 X97.253 Y98.886 E.27954
G1 X97.802 Y98.886 E.01336
G1 X105.386 Y91.302 E.26065
G1 X105.386 Y91.852 E.01336
G1 X98.352 Y98.886 E.24176
G1 X98.901 Y98.886 E.01336
G1 X105.386 Y92.401 E.22287
G1 X105.386 Y92.951 E.01336
G1 X99.451 Y98.886 E.20398
G1 X100.001 Y98.886 E.01336
G1 X105.386 Y93.501 E.18509
G1 X105.386 Y94.05 E.01336
G1 X100.55 Y98.886 E.1662
G1 X101.1 Y98.886 E.01336
G1 X105.386 Y94.6 E.14731
G1 X105.386 Y95.15 E.01336
G1 X101.65 Y98.886 E.12842
G1 X102.199 Y98.886 E.01336
G1 X105.386 Y95.699 E.10953
G1 X105.386 Y96.249 E.01336
G1 X102.749 Y98.886 E.09064
G1 X103.299 Y98.886 E.01336
G1 X105.386 Y96.799 E.07175
G1 X105.386 Y97.348 E.01336
G1 X103.848 Y98.886 E.05286
G1 X104.398 Y98.886 E.01336
G1 X105.386 Y97.898 E.03397
G1 X105.386 Y98.447 E.01336
G1 X104.774 Y99.06 E.02105
; WIPE_START
G1 X105.386 Y98.447 E-.32911
G1 X105.386 Y98.314 E-.05089
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.214 J.086 P1  F42000
G1 X107.02 Y75.29 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105556
G1 F18000
M204 S6000
G1 X107.137 Y75.201 E.00065
G1 X107.163 Y75.124 E.00036
; WIPE_START
G1 X107.137 Y75.201 E-.13536
G1 X107.02 Y75.29 E-.24464
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.214 J.09 P1  F42000
G1 X107.182 Y73.1 Z1.08
G1 Z.68
G1 E.4 F1800
; LINE_WIDTH: 0.0980753
G1 F18000
M204 S6000
G1 X106.972 Y73.1 E.00083
M204 S10000
G1 X107.065 Y73.01 F42000
; LINE_WIDTH: 0.119977
G1 F18000
M204 S6000
G3 X107.163 Y73.276 I-5.277 J2.103 E.00152
M204 S10000
G1 X107.066 Y73.191 F42000
; LINE_WIDTH: 0.113449
G1 F18000
M204 S6000
G2 X107.163 Y72.924 I-4.184 J-1.668 E.00141
; WIPE_START
G1 X107.066 Y73.191 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I.188 J-1.202 P1  F42000
G1 X106.159 Y73.049 Z1.08
G1 Z.68
G1 E.4 F1800
; LINE_WIDTH: 0.0978171
G1 F18000
M204 S6000
G3 X106.427 Y73.205 I-2.882 J5.256 E.00123
M204 S10000
G1 X106.416 Y73.222 F42000
; LINE_WIDTH: 0.143997
G1 F18000
M204 S6000
G3 X106.274 Y73.109 I.311 J-.538 E.00125
G1 X106.266 Y73.1 E.00009
G3 X106.417 Y72.978 I.424 J.369 E.00134
M204 S10000
G1 X106.427 Y72.995 F42000
; LINE_WIDTH: 0.0979068
G1 F18000
M204 S6000
G3 X106.159 Y73.151 I-3.323 J-5.378 E.00123
M204 S10000
G1 X106.337 Y73.1 F42000
; LINE_WIDTH: 0.130201
G1 F18000
M204 S6000
G1 X105.781 Y73.099 E.00334
; LINE_WIDTH: 0.146272
G3 X105.576 Y72.99 I.122 J-.477 E.00164
M204 S10000
G1 X105.573 Y72.995 F42000
; LINE_WIDTH: 0.0977945
G1 F18000
M204 S6000
G2 X105.845 Y73.153 I3.132 J-5.066 E.00125
; WIPE_START
G1 X105.573 Y72.995 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.162 J-.363 P1  F42000
G1 X104.936 Y70.954 Z1.08
G1 Z.68
G1 E.4 F1800
; LINE_WIDTH: 0.100736
G1 F18000
M204 S6000
G1 X105.011 Y70.86 E.0005
G1 X105.074 Y70.837 E.00028
; WIPE_START
G1 X105.011 Y70.86 E-.13557
G1 X104.936 Y70.954 E-.24443
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I.083 J1.214 P1  F42000
G1 X106.907 Y70.819 Z1.08
G1 Z.68
G1 E.4 F1800
; LINE_WIDTH: 0.144957
G1 F18000
M204 S6000
G3 X107.112 Y70.954 I-.092 J.363 E.00173
G1 X107.134 Y70.996 E.00033
; LINE_WIDTH: 0.104851
G1 X107.164 Y71.076 E.00037
; WIPE_START
G1 X107.134 Y70.996 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.217 J-.01 P1  F42000
G1 X106.852 Y37.393 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P74 R2
G1 F12000
M204 S5000
G3 X105.833 Y36.656 I-.853 J.106 E.09625
G1 X105.964 Y36.641 E.00318
G3 X106.842 Y37.334 I.035 J.859 E.02938
; WIPE_START
M204 S6000
G1 X106.858 Y37.564 E-.08775
G1 X106.828 Y37.733 E-.06506
G1 X106.766 Y37.892 E-.06512
G1 X106.673 Y38.036 E-.06513
G1 X106.553 Y38.159 E-.06508
G1 X106.483 Y38.205 E-.03186
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-1.151 J-.395 P1  F42000
G1 X105.726 Y40.41 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11728.231
M204 S6000
G1 X105.727 Y60.727 E.52806
G1 X82.774 Y60.727 E.59656
G1 X82.774 Y56.223 E.11705
G1 X83.773 Y56.223 E.02598
M73 P74 R1
G1 X83.773 Y42.277 E.36249
G1 X82.774 Y42.277 E.02598
G1 X82.774 Y37.773 E.11705
G1 X103.081 Y37.774 E.52778
G2 X105.666 Y40.403 I2.925 J-.29 E.10361
M204 S10000
G1 X106.141 Y40.007 F42000
G1 F11728.231
M204 S6000
G1 X106.142 Y61.142 E.54934
G1 X82.359 Y61.142 E.61816
G1 X82.358 Y55.808 E.13866
G1 X83.358 Y55.808 E.02598
G1 X83.358 Y42.692 E.34088
G1 X82.358 Y42.692 E.02598
G1 X82.359 Y37.358 E.13865
G1 X103.496 Y37.358 E.54938
G2 X106.081 Y40.009 I2.511 J.138 E.10819
M204 S10000
G1 X106.557 Y39.521 F42000
G1 F11728.231
M204 S6000
G1 X106.558 Y61.558 E.57277
G1 X81.943 Y61.558 E.63977
G1 X81.942 Y55.392 E.16026
G1 X82.942 Y55.392 E.02598
G1 X82.942 Y43.108 E.31927
G1 X81.942 Y43.108 E.02598
G1 X81.943 Y36.942 E.16026
G1 X103.982 Y36.942 E.57282
G2 X106.499 Y39.536 I2.024 J.554 E.11317
M204 S10000
G1 X106.973 Y38.872 F42000
G1 F11728.231
M204 S6000
G1 X106.974 Y61.974 E.60044
G1 X81.527 Y61.974 E.66137
G1 X81.526 Y54.976 E.18187
G1 X82.526 Y54.976 E.02599
G1 X82.526 Y43.524 E.29767
G1 X81.526 Y43.524 E.02599
G1 X81.528 Y36.526 E.18187
G1 X104.627 Y36.527 E.60039
G2 X106.923 Y38.906 I1.378 J.967 E.12074
; WIPE_START
G1 X106.925 Y39.906 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.206 J.162 P1  F42000
G1 X107.191 Y37.923 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F11728.231
M204 S6000
G1 X107.388 Y37.965 E.00524
G1 X107.389 Y61.985 E.62429
G3 X106.985 Y62.389 I-.396 J.009 E.01661
G1 X81.515 Y62.389 E.662
G3 X81.112 Y62.019 I-.009 J-.395 E.01571
G1 X81.111 Y54.561 E.19385
G1 X82.111 Y54.561 E.02599
G1 X82.111 Y43.939 E.27606
G1 X81.111 Y43.939 E.02599
G1 X81.112 Y36.489 E.19365
G3 X81.515 Y36.111 I.391 J.013 E.01596
G1 X105.534 Y36.111 E.62427
G1 X105.578 Y36.305 E.00517
G2 X107.17 Y37.979 I.424 J1.191 E.13071
M204 S10000
G1 X107.197 Y37.074 F42000
G1 F11728.231
M204 S6000
G2 X106.423 Y36.311 I-1.277 J.522 E.02905
G1 X106.463 Y36.111 E.0053
G1 X106.996 Y36.111 E.01385
G3 X107.388 Y36.481 I.002 J.391 E.01547
G1 X107.388 Y37.028 E.01421
G1 X107.256 Y37.06 E.00354
; WIPE_START
G1 X107.024 Y36.764 E-.14281
G1 X106.858 Y36.575 E-.09555
G1 X106.658 Y36.424 E-.09534
G1 X106.548 Y36.371 E-.0463
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-.709 J-.989 P1  F42000
G1 X81.71 Y54.16 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X81.71 Y44.34 E.23681
M73 P75 R1
G1 X80.71 Y44.34 E.02411
G1 X80.711 Y36.464 E.18993
G3 X81.505 Y35.71 I.792 J.039 E.02915
G1 X107.007 Y35.71 E.61497
G3 X107.789 Y36.461 I-.009 J.792 E.0288
G1 X107.79 Y61.995 E.61574
G3 X106.995 Y62.79 I-.8 J-.005 E.03008
G1 X81.505 Y62.79 E.61469
G3 X80.711 Y62.039 I.005 J-.8 E.02902
G1 X80.71 Y54.16 E.19
G1 X81.65 Y54.16 E.02267
; WIPE_START
M204 S6000
G1 X81.656 Y53.16 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-1.145 J.411 P1  F42000
G1 X82.941 Y56.738 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420386
G1 F12627.898
M204 S6000
G1 X83.115 Y56.564 E.00596
G1 X83.661 Y56.564 E.01318
G1 X83.114 Y57.111 E.01868
G1 X83.114 Y57.657 E.01318
G1 X102.657 Y38.114 E.66715
G1 X102.795 Y38.114 E.00333
G2 X102.875 Y38.442 I1.676 J-.237 E.00816
G1 X83.114 Y58.203 E.6746
G1 X83.114 Y58.748 E.01318
G1 X103.021 Y38.842 E.67958
G2 X103.212 Y39.197 I5.469 J-2.701 E.00974
G1 X83.115 Y59.294 E.68608
G1 X83.115 Y59.84 E.01318
G1 X103.436 Y39.519 E.69374
G2 X103.693 Y39.808 I1.571 J-1.136 E.00935
G1 X83.115 Y60.386 E.70251
G1 X83.661 Y60.386 E.01318
G1 X103.981 Y40.065 E.69371
G2 X104.302 Y40.291 I3.852 J-5.144 E.00946
G1 X84.206 Y60.386 E.68602
G1 X84.752 Y60.386 E.01318
G1 X104.662 Y40.477 E.67967
G2 X105.06 Y40.625 I.933 J-1.902 E.01027
G1 X85.298 Y60.386 E.67462
G1 X85.844 Y60.386 E.01318
G1 X105.385 Y40.845 E.66709
G1 X105.385 Y41.391 E.01318
G1 X86.39 Y60.386 E.64845
G1 X86.936 Y60.386 E.01318
G1 X105.385 Y41.937 E.62982
G1 X105.385 Y42.483 E.01318
G1 X87.482 Y60.386 E.61118
G1 X88.028 Y60.386 E.01318
G1 X105.385 Y43.029 E.59254
G1 X105.385 Y43.575 E.01318
G1 X88.574 Y60.386 E.57391
G1 X89.12 Y60.386 E.01318
G1 X105.385 Y44.121 E.55527
G1 X105.385 Y44.667 E.01318
G1 X89.666 Y60.386 E.53663
G1 X90.212 Y60.386 E.01318
G1 X105.385 Y45.213 E.518
G1 X105.386 Y45.759 E.01318
G1 X90.758 Y60.386 E.49936
G1 X91.304 Y60.386 E.01318
G1 X105.386 Y46.305 E.48072
G1 X105.386 Y46.85 E.01318
G1 X91.85 Y60.386 E.46208
G1 X92.396 Y60.386 E.01318
G1 X105.386 Y47.396 E.44345
M73 P76 R1
G1 X105.386 Y47.942 E.01318
G1 X92.942 Y60.386 E.42481
G1 X93.488 Y60.386 E.01318
G1 X105.386 Y48.488 E.40617
G1 X105.386 Y49.034 E.01318
G1 X94.034 Y60.386 E.38754
G1 X94.58 Y60.386 E.01318
G1 X105.386 Y49.58 E.3689
G1 X105.386 Y50.126 E.01318
G1 X95.126 Y60.386 E.35026
G1 X95.672 Y60.386 E.01318
G1 X105.386 Y50.672 E.33162
G1 X105.386 Y51.218 E.01318
G1 X96.218 Y60.386 E.31299
G1 X96.763 Y60.386 E.01318
G1 X105.386 Y51.764 E.29435
G1 X105.386 Y52.31 E.01318
G1 X97.309 Y60.386 E.27571
G1 X97.855 Y60.386 E.01318
G1 X105.386 Y52.856 E.25708
G1 X105.386 Y53.402 E.01318
G1 X98.401 Y60.386 E.23844
G1 X98.947 Y60.386 E.01318
G1 X105.386 Y53.948 E.2198
G1 X105.386 Y54.494 E.01318
G1 X99.493 Y60.386 E.20116
G1 X100.039 Y60.386 E.01318
G1 X105.386 Y55.039 E.18253
G1 X105.386 Y55.585 E.01318
G1 X100.585 Y60.386 E.16389
G1 X101.131 Y60.386 E.01318
G1 X105.386 Y56.131 E.14525
G1 X105.386 Y56.677 E.01318
G1 X101.677 Y60.386 E.12662
G1 X102.223 Y60.386 E.01318
G1 X105.386 Y57.223 E.10798
G1 X105.386 Y57.769 E.01318
G1 X102.769 Y60.386 E.08934
G1 X103.315 Y60.386 E.01318
G1 X105.386 Y58.315 E.0707
G1 X105.386 Y58.861 E.01318
G1 X103.861 Y60.386 E.05207
G1 X104.407 Y60.386 E.01318
G1 X105.386 Y59.407 E.03343
G1 X105.386 Y59.953 E.01318
G1 X104.779 Y60.56 E.02072
; WIPE_START
G1 X105.386 Y59.953 E-.32613
G1 X105.386 Y59.811 E-.05387
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I.197 J-1.201 P1  F42000
G1 X83.94 Y56.285 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F12627.898
M204 S6000
G1 X102.111 Y38.114 E.62032
G1 X101.565 Y38.114 E.01318
G1 X84.114 Y55.565 E.59576
G1 X84.114 Y55.019 E.01318
G1 X101.019 Y38.114 E.57712
G1 X100.473 Y38.114 E.01318
G1 X84.114 Y54.473 E.55848
G1 X84.114 Y53.927 E.01318
G1 X99.927 Y38.114 E.53984
G1 X99.381 Y38.114 E.01318
G1 X84.114 Y53.381 E.52121
G1 X84.114 Y52.836 E.01318
G1 X98.835 Y38.114 E.50257
G1 X98.289 Y38.114 E.01318
G1 X84.114 Y52.29 E.48393
G1 X84.114 Y51.744 E.01318
G1 X97.743 Y38.114 E.46529
G1 X97.197 Y38.114 E.01318
G1 X84.114 Y51.198 E.44666
G1 X84.114 Y50.652 E.01318
G1 X96.652 Y38.114 E.42802
G1 X96.106 Y38.114 E.01318
G1 X84.114 Y50.106 E.40938
G1 X84.114 Y49.56 E.01318
G1 X95.56 Y38.114 E.39074
G1 X95.014 Y38.114 E.01318
G1 X84.114 Y49.014 E.3721
G1 X84.114 Y48.468 E.01318
G1 X94.468 Y38.114 E.35347
G1 X93.922 Y38.114 E.01318
G1 X84.114 Y47.922 E.33483
M73 P77 R1
G1 X84.114 Y47.376 E.01318
G1 X93.376 Y38.114 E.31619
G1 X92.83 Y38.114 E.01318
G1 X84.114 Y46.83 E.29755
G1 X84.114 Y46.284 E.01318
G1 X92.284 Y38.114 E.27892
G1 X91.738 Y38.114 E.01318
G1 X84.114 Y45.738 E.26028
G1 X84.114 Y45.192 E.01318
G1 X91.192 Y38.114 E.24164
G1 X90.646 Y38.114 E.01318
G1 X84.114 Y44.646 E.223
G1 X84.114 Y44.1 E.01318
G1 X90.1 Y38.114 E.20437
G1 X89.554 Y38.114 E.01318
G1 X84.114 Y43.554 E.18573
G1 X84.114 Y43.008 E.01318
G1 X89.008 Y38.114 E.16709
G1 X88.462 Y38.114 E.01318
G1 X84.114 Y42.462 E.14845
G1 X84.114 Y41.936 E.0127
G1 X84.094 Y41.936 E.00048
G1 X87.916 Y38.114 E.13049
G1 X87.37 Y38.114 E.01318
G1 X83.548 Y41.936 E.13049
G1 X83.114 Y41.936 E.01047
G1 X83.114 Y41.824 E.00271
G1 X86.824 Y38.114 E.12666
G1 X86.278 Y38.114 E.01318
G1 X83.114 Y41.278 E.10802
G1 X83.114 Y40.732 E.01318
G1 X85.733 Y38.114 E.08938
G1 X85.187 Y38.114 E.01318
G1 X83.114 Y40.186 E.07074
G1 X83.114 Y39.64 E.01318
G1 X84.641 Y38.114 E.0521
G1 X84.095 Y38.114 E.01318
G1 X83.115 Y39.094 E.03346
G1 X83.115 Y38.548 E.01318
G1 X83.722 Y37.94 E.02074
; WIPE_START
G1 X83.115 Y38.548 E-.32655
G1 X83.115 Y38.688 E-.05345
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I.124 J1.211 P1  F42000
G1 X104.936 Y36.454 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100717
G1 F18000
M204 S6000
G1 X105.011 Y36.36 E.0005
G1 X105.074 Y36.337 E.00028
; WIPE_START
G1 X105.011 Y36.36 E-.13561
G1 X104.936 Y36.454 E-.24439
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I.083 J1.214 P1  F42000
G1 X106.907 Y36.319 Z1.08
G1 Z.68
G1 E.4 F1800
; LINE_WIDTH: 0.145733
G1 F18000
M204 S6000
G3 X107.099 Y36.436 I-.105 J.388 E.00159
G1 X107.128 Y36.482 E.00038
; LINE_WIDTH: 0.109377
G1 X107.162 Y36.574 E.00046
; WIPE_START
G1 X107.128 Y36.482 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-1.217 J.032 P1  F42000
G1 X107.18 Y38.455 Z1.08
G1 Z.68
G1 E.4 F1800
; LINE_WIDTH: 0.102101
G1 F18000
M204 S6000
G1 X107.053 Y38.559 E.0007
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X107.18 Y38.455 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 5/5
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I-1.217 J-.022 P1  F42000
G1 X105.872 Y109.649 Z1.08
G1 Z.84
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X105.959 Y109.641 E.00211
G3 X105.813 Y109.66 I.04 J.859 E.12671
; WIPE_START
M204 S6000
G1 X105.959 Y109.641 E-.05593
G1 X106.128 Y109.649 E-.06433
G1 X106.294 Y109.692 E-.06506
G1 X106.449 Y109.766 E-.06524
G1 X106.585 Y109.869 E-.06494
G1 X106.697 Y109.997 E-.06449
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-1.202 J-.192 P1  F42000
G1 X106.128 Y113.55 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F12000
M204 S5000
G3 X105.832 Y111.856 I-.129 J-.85 E.0642
G1 X105.956 Y111.841 E.00301
G3 X106.187 Y113.538 I.043 J.859 E.06161
M204 S250
G1 X105.956 Y114.041 F42000
G1 F12000
M204 S5000
G3 X105.832 Y114.056 I.043 J.859 E.12726
G1 X105.897 Y114.048 E.00157
; WIPE_START
M204 S6000
G1 X106.128 Y114.049 E-.08784
G1 X106.294 Y114.092 E-.0651
G1 X106.519 Y114.214 E-.0975
G1 X106.645 Y114.331 E-.06527
G1 X106.744 Y114.468 E-.06428
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.549 J-1.086 P1  F42000
G1 X73.21 Y131.41 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F12000
M204 S5000
G1 X73.21 Y121.59 E.23681
G1 X72.21 Y121.59 E.02412
G1 X72.21 Y109.505 E.29142
G3 X73.005 Y108.71 I.8 J.004 E.03008
G1 X106.997 Y108.71 E.81972
G3 X107.79 Y109.505 I-.007 J.8 E.03003
G1 X107.79 Y143.495 E.81966
G3 X106.995 Y144.29 I-.8 J-.005 E.03008
G1 X73.005 Y144.29 E.81966
G3 X72.21 Y143.495 I.004 J-.8 E.03008
G1 X72.21 Y131.41 E.29143
G1 X73.15 Y131.41 E.02267
; WIPE_START
M204 S6000
G1 X73.156 Y130.41 E-.38
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

G1 X105.572 Y113.694
G1 Z.84
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0982083
G1 F18000
M204 S6000
G2 X105.844 Y113.853 I3.106 J-5.021 E.00126
M204 S10000
G1 X105.78 Y113.799 F42000
; LINE_WIDTH: 0.130181
G1 F18000
M204 S6000
G1 X106.337 Y113.8 E.00334
M204 S10000
G1 X106.325 Y113.732 F42000
; LINE_WIDTH: 0.0940086
G1 F18000
M204 S6000
G2 X106.269 Y113.765 I.064 J.175 E.00024
; LINE_WIDTH: 0.123978
G1 X106.257 Y113.782 E.00012
; LINE_WIDTH: 0.146357
G1 X106.244 Y113.8 E.00015
G1 X106.431 Y113.899 E.00148
M204 S10000
G1 X106.427 Y113.905 F42000
; LINE_WIDTH: 0.0978252
G1 F18000
M204 S6000
G2 X106.159 Y113.749 I-3.308 J5.357 E.00123
M204 S10000
G1 X105.78 Y113.799 F42000
; LINE_WIDTH: 0.146572
G1 F18000
M204 S6000
G3 X105.575 Y113.69 I.122 J-.475 E.00165
; WIPE_START
G1 X105.746 Y113.8 E-.32614
G1 X105.78 Y113.799 E-.05386
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I1.216 J.036 P1  F42000
G1 X105.844 Y111.653 Z1.24
G1 Z.84
M73 P78 R1
G1 E.4 F1800
; LINE_WIDTH: 0.0979239
G1 F18000
M204 S6000
G3 X105.573 Y111.495 I3.071 J-5.566 E.00125
M204 S10000
G1 X105.576 Y111.49 F42000
; LINE_WIDTH: 0.146287
G1 F18000
M204 S6000
G2 X105.78 Y111.599 I.331 J-.374 E.00164
; LINE_WIDTH: 0.130167
G1 X106.338 Y111.6 E.00334
M204 S10000
G1 X106.276 Y111.573 F42000
; LINE_WIDTH: 0.144548
G1 F18000
M204 S6000
G1 X106.254 Y111.6 E.00024
G1 X106.425 Y111.71 E.0014
M204 S10000
G1 X106.428 Y111.706 F42000
; LINE_WIDTH: 0.0979753
G1 F18000
M204 S6000
G2 X106.159 Y111.549 I-3.233 J5.227 E.00124
M204 S10000
G1 X106.276 Y111.573 F42000
; LINE_WIDTH: 0.103327
G1 F18000
M204 S6000
G3 X106.38 Y111.513 I.231 J.28 E.00052
; WIPE_START
G1 X106.276 Y111.573 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.93 J.785 P1  F42000
G1 X107.578 Y110.032 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X106.468 Y108.922 E.03786
G1 X106.639 Y109.639
G1 X105.922 Y108.922 E.02444
G1 X105.377 Y108.922
G1 X105.891 Y109.436 E.01752
G1 X105.479 Y109.569
G1 X104.832 Y108.922 E.02207
G1 X104.286 Y108.922
G1 X105.177 Y109.813 E.0304
G1 X104.984 Y110.165
G1 X103.741 Y108.922 E.0424
G1 X103.195 Y108.922
G1 X104.943 Y110.67 E.05961
G1 X105.285 Y111.557
G1 X102.65 Y108.922 E.08987
G1 X102.105 Y108.922
G1 X105.187 Y112.004 E.10511
G1 X104.989 Y112.352
G1 X101.559 Y108.922 E.11698
G1 X101.014 Y108.922
G1 X104.938 Y112.846 E.13383
G1 X105.292 Y113.745
G1 X100.468 Y108.922 E.16449
G1 X99.923 Y108.922
G1 X105.196 Y114.195 E.17982
G1 X104.994 Y114.539
G1 X99.377 Y108.922 E.19155
G1 X98.832 Y108.922
G1 X104.935 Y115.025 E.20812
; WIPE_START
M204 S6000
G1 X104.228 Y114.318 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.906 J.812 P1  F42000
G1 X107.578 Y110.578 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F12000
M204 S2000
G1 X106.843 Y109.843 E.02507
G1 X107.065 Y110.61
G1 X107.578 Y111.123 E.01749
G1 X107.578 Y111.668
G1 X106.933 Y111.024 E.02199
G1 X106.688 Y111.324
G1 X107.578 Y112.214 E.03036
G1 X107.578 Y112.759
G1 X106.619 Y111.8 E.03271
G1 X107.068 Y112.795
G1 X107.578 Y113.305 E.01739
G1 X107.578 Y113.85
G1 X106.94 Y113.213 E.02174
G1 X106.688 Y113.506
G1 X107.578 Y114.396 E.03035
G1 X107.578 Y114.941
G1 X106.624 Y113.987 E.03254
G1 X107.07 Y114.979
G1 X107.578 Y115.486 E.01731
G1 X107.578 Y116.032
G1 X106.948 Y115.401 E.0215
G1 X106.706 Y115.706
G1 X107.578 Y116.577 E.02973
G1 X107.578 Y117.123
G1 X106.354 Y115.899 E.04174
G1 X105.871 Y115.961
G1 X107.578 Y117.668 E.05823
G1 X107.578 Y118.213
G1 X98.287 Y108.922 E.31687
G1 X97.741 Y108.922
G1 X107.578 Y118.759 E.33547
G1 X107.578 Y119.304
G1 X97.196 Y108.922 E.35407
G1 X96.65 Y108.922
G1 X107.578 Y119.85 E.37267
G1 X107.578 Y120.395
G1 X96.105 Y108.922 E.39127
G1 X95.56 Y108.922
G1 X107.578 Y120.94 E.40987
G1 X107.578 Y121.486
G1 X95.014 Y108.922 E.42847
G1 X94.469 Y108.922
G1 X107.578 Y122.031 E.44707
G1 X107.578 Y122.577
G1 X93.923 Y108.922 E.46567
G1 X93.378 Y108.922
G1 X107.578 Y123.122 E.48427
M73 P79 R1
G1 X107.578 Y123.667
G1 X92.833 Y108.922 E.50287
G1 X92.287 Y108.922
G1 X107.578 Y124.213 E.52147
G1 X107.578 Y124.758
G1 X91.742 Y108.922 E.54008
G1 X91.196 Y108.922
G1 X107.578 Y125.304 E.55868
G1 X107.578 Y125.849
G1 X90.651 Y108.922 E.57728
G1 X90.106 Y108.922
G1 X107.578 Y126.394 E.59588
G1 X107.578 Y126.94
G1 X89.56 Y108.922 E.61448
G1 X89.015 Y108.922
G1 X107.578 Y127.485 E.63308
G1 X107.578 Y128.031
G1 X88.469 Y108.922 E.65168
G1 X87.924 Y108.922
G1 X107.578 Y128.576 E.67028
G1 X107.578 Y129.121
G1 X87.379 Y108.922 E.68888
G1 X86.833 Y108.922
G1 X107.578 Y129.667 E.70748
G1 X107.578 Y130.212
G1 X86.288 Y108.922 E.72608
G1 X85.742 Y108.922
G1 X107.578 Y130.758 E.74468
G1 X107.578 Y131.303
G1 X85.197 Y108.922 E.76328
G1 X84.652 Y108.922
G1 X107.578 Y131.849 E.78188
G1 X107.578 Y132.394
G1 X84.106 Y108.922 E.80048
G1 X83.561 Y108.922
G1 X107.578 Y132.939 E.81908
G1 X107.578 Y133.485
G1 X83.015 Y108.922 E.83768
M73 P80 R1
G1 X82.47 Y108.922
G1 X107.578 Y134.03 E.85628
G1 X107.578 Y134.576
G1 X81.924 Y108.922 E.87489
G1 X81.379 Y108.922
G1 X107.578 Y135.121 E.89349
G1 X107.578 Y135.666
G1 X80.834 Y108.922 E.91209
G1 X80.288 Y108.922
G1 X107.578 Y136.212 E.93069
G1 X107.578 Y136.757
G1 X79.743 Y108.922 E.94929
G1 X79.197 Y108.922
G1 X107.578 Y137.303 E.96789
G1 X107.578 Y137.848
G1 X78.652 Y108.922 E.98649
G1 X78.107 Y108.922
G1 X107.578 Y138.393 E1.00509
G1 X107.578 Y138.939
G1 X77.561 Y108.922 E1.02369
G1 X77.016 Y108.922
G1 X107.578 Y139.484 E1.04229
G1 X107.578 Y140.03
G1 X76.47 Y108.922 E1.06089
G1 X75.925 Y108.922
G1 X107.578 Y140.575 E1.07949
G1 X107.578 Y141.12
G1 X75.38 Y108.922 E1.09809
G1 X74.834 Y108.922
M73 P81 R1
G1 X107.578 Y141.666 E1.11669
G1 X107.578 Y142.211
G1 X74.289 Y108.922 E1.13529
G1 X73.743 Y108.922
G1 X107.578 Y142.757 E1.15389
G1 X107.578 Y143.302
G1 X73.198 Y108.922 E1.17249
G1 X72.726 Y108.996
G1 X107.504 Y143.774 E1.18607
G1 X107.218 Y144.033
G1 X72.467 Y109.282 E1.18518
G1 X72.422 Y109.782
G1 X106.718 Y144.078 E1.16961
G1 X106.172 Y144.078
G1 X72.422 Y110.328 E1.15101
G1 X72.422 Y110.873
G1 X105.627 Y144.078 E1.13241
G1 X105.081 Y144.078
G1 X72.422 Y111.419 E1.11381
G1 X72.422 Y111.964
G1 X104.536 Y144.078 E1.09521
G1 X103.991 Y144.078
G1 X72.422 Y112.509 E1.07661
G1 X72.422 Y113.055
G1 X103.445 Y144.078 E1.05801
G1 X102.9 Y144.078
G1 X72.422 Y113.6 E1.03941
M73 P82 R1
G1 X72.422 Y114.146
G1 X102.354 Y144.078 E1.02081
G1 X101.809 Y144.078
G1 X72.422 Y114.691 E1.00221
G1 X72.422 Y115.236
G1 X101.264 Y144.078 E.98361
G1 X100.718 Y144.078
G1 X72.422 Y115.782 E.96501
G1 X72.422 Y116.327
G1 X100.173 Y144.078 E.94641
G1 X99.627 Y144.078
G1 X72.422 Y116.873 E.92781
G1 X72.422 Y117.418
G1 X99.082 Y144.078 E.90921
G1 X98.536 Y144.078
G1 X72.422 Y117.964 E.89061
G1 X72.422 Y118.509
G1 X97.991 Y144.078 E.872
G1 X97.446 Y144.078
G1 X72.422 Y119.054 E.8534
G1 X72.422 Y119.6
G1 X96.9 Y144.078 E.8348
G1 X96.355 Y144.078
G1 X72.422 Y120.145 E.8162
G1 X72.422 Y120.691
G1 X73.109 Y121.378 E.02344
G1 X73.422 Y121.691
G1 X95.809 Y144.078 E.7635
G1 X95.264 Y144.078
G1 X73.422 Y122.236 E.7449
G1 X73.422 Y122.781
G1 X94.719 Y144.078 E.7263
M73 P83 R1
G1 X94.173 Y144.078
G1 X73.422 Y123.327 E.7077
G1 X73.422 Y123.872
G1 X93.628 Y144.078 E.6891
G1 X93.082 Y144.078
G1 X73.422 Y124.418 E.6705
G1 X73.422 Y124.963
G1 X92.537 Y144.078 E.6519
G1 X91.992 Y144.078
G1 X73.422 Y125.508 E.63329
G1 X73.422 Y126.054
G1 X91.446 Y144.078 E.61469
G1 X90.901 Y144.078
G1 X73.422 Y126.599 E.59609
G1 X73.422 Y127.145
G1 X90.355 Y144.078 E.57749
G1 X89.81 Y144.078
G1 X73.422 Y127.69 E.55889
G1 X73.422 Y128.235
G1 X89.265 Y144.078 E.54029
G1 X88.719 Y144.078
G1 X73.422 Y128.781 E.52169
G1 X73.422 Y129.326
G1 X88.174 Y144.078 E.50309
G1 X87.628 Y144.078
G1 X73.422 Y129.872 E.48449
G1 X73.422 Y130.417
G1 X87.083 Y144.078 E.46589
G1 X86.538 Y144.078
G1 X73.422 Y130.962 E.44729
G1 X73.422 Y131.508
G1 X85.992 Y144.078 E.42869
G1 X85.447 Y144.078
G1 X72.991 Y131.622 E.42479
G1 X72.446 Y131.622
G1 X84.901 Y144.078 E.42479
G1 X84.356 Y144.078
G1 X72.422 Y132.144 E.40699
M73 P84 R1
G1 X72.422 Y132.689
G1 X83.811 Y144.078 E.38839
G1 X83.265 Y144.078
G1 X72.422 Y133.235 E.36979
G1 X72.422 Y133.78
G1 X82.72 Y144.078 E.35119
G1 X82.174 Y144.078
G1 X72.422 Y134.326 E.33259
G1 X72.422 Y134.871
G1 X81.629 Y144.078 E.31399
G1 X81.083 Y144.078
G1 X72.422 Y135.417 E.29539
G1 X72.422 Y135.962
G1 X80.538 Y144.078 E.27679
G1 X79.993 Y144.078
G1 X72.422 Y136.507 E.25819
G1 X72.422 Y137.053
G1 X79.447 Y144.078 E.23959
G1 X78.902 Y144.078
G1 X72.422 Y137.598 E.22099
G1 X72.422 Y138.144
G1 X78.356 Y144.078 E.20239
G1 X77.811 Y144.078
G1 X72.422 Y138.689 E.18379
G1 X72.422 Y139.234
G1 X77.266 Y144.078 E.16518
G1 X76.72 Y144.078
G1 X72.422 Y139.78 E.14658
G1 X72.422 Y140.325
G1 X76.175 Y144.078 E.12798
G1 X75.629 Y144.078
G1 X72.422 Y140.871 E.10938
G1 X72.422 Y141.416
G1 X75.084 Y144.078 E.09078
G1 X74.539 Y144.078
G1 X72.422 Y141.961 E.07218
G1 X72.422 Y142.507
G1 X73.993 Y144.078 E.05358
G1 X73.448 Y144.078
G1 X72.422 Y143.052 E.03498
; WIPE_START
M204 S6000
G1 X73.129 Y143.759 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.857 J.865 P1  F42000
G1 X107.597 Y109.611 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.386678
G1 F13836.017
M204 S6000
G2 X106.889 Y108.903 I-1.755 J1.047 E.02228
M204 S10000
G1 X106.375 Y108.923 F42000
; LINE_WIDTH: 0.091639
G1 F18000
M204 S6000
G1 X106.215 Y108.942 E.00058
; WIPE_START
G1 X106.375 Y108.923 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.007 J-1.217 P1  F42000
G1 X72.581 Y109.124 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.0879367
G1 F18000
M204 S6000
G2 X72.499 Y109.221 I.458 J.469 E.00043
; WIPE_START
G1 X72.581 Y109.124 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-1.217 J.017 P1  F42000
G1 X73.06 Y144.097 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.326233
G1 F16701.136
M204 S6000
G3 X72.403 Y143.44 I1.014 J-1.671 E.01713
; WIPE_START
G1 X72.689 Y143.811 E-.19
G1 X73.06 Y144.097 E-.19
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.792 J.924 P1  F42000
G1 X105.803 Y116.029 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.173724
G1 F18000
M204 S6000
G3 X105.52 Y115.872 I1.456 J-2.97 E.00282
M204 S10000
G1 X105.046 Y115.382 F42000
; LINE_WIDTH: 0.104146
G1 F18000
M204 S6000
G1 X104.958 Y115.255 E.00067
; LINE_WIDTH: 0.12992
G1 X104.861 Y115.098 E.0011
M204 S10000
G1 X104.979 Y114.58 F42000
; LINE_WIDTH: 0.0841088
G1 F18000
M204 S6000
G2 X104.898 Y114.715 I1.342 J.896 E.00049
; WIPE_START
G1 X104.979 Y114.58 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I1.217 J.029 P1  F42000
G1 X105.956 Y73.341 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.832 Y73.356 I.043 J.859 E.12726
G1 X105.897 Y73.348 E.00157
M204 S250
G1 X106.128 Y72.85 F42000
G1 F12000
M204 S5000
G3 X105.832 Y71.156 I-.129 J-.85 E.0642
M73 P85 R1
G1 X105.956 Y71.141 E.00301
G3 X106.187 Y72.838 I.043 J.859 E.06161
; WIPE_START
M204 S6000
G1 X105.956 Y72.859 E-.08827
G1 X105.788 Y72.834 E-.06449
G1 X105.626 Y72.775 E-.06542
G1 X105.48 Y72.686 E-.06494
G1 X105.355 Y72.569 E-.06497
G1 X105.306 Y72.501 E-.03191
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.669 J-1.017 P1  F42000
G1 X77.71 Y90.66 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F12000
M204 S5000
G1 X77.71 Y80.84 E.23681
G1 X76.71 Y80.84 E.02411
G1 X76.711 Y70.961 E.23824
G3 X77.505 Y70.21 I.799 J.05 E.02901
G1 X106.997 Y70.21 E.7112
G3 X107.79 Y71.005 I-.007 J.8 E.03002
G1 X107.79 Y100.495 E.71114
G3 X106.995 Y101.29 I-.8 J-.004 E.03008
G1 X77.505 Y101.29 E.71114
G3 X76.711 Y100.539 I.005 J-.8 E.02902
G1 X76.71 Y90.66 E.23823
G1 X77.65 Y90.66 E.02267
; WIPE_START
M204 S6000
G1 X77.656 Y89.66 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.624 J1.045 P1  F42000
G1 X105.572 Y72.994 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0981769
G1 F18000
M204 S6000
G2 X105.844 Y73.153 I3.287 J-5.32 E.00125
M204 S10000
G1 X105.78 Y73.099 F42000
; LINE_WIDTH: 0.130182
G1 F18000
M204 S6000
G1 X106.337 Y73.1 E.00334
M204 S10000
G1 X106.327 Y73.032 F42000
; LINE_WIDTH: 0.0944441
G1 F18000
M204 S6000
G2 X106.269 Y73.065 I.065 J.18 E.00025
; LINE_WIDTH: 0.124791
G1 X106.257 Y73.083 E.00012
; LINE_WIDTH: 0.146412
G1 X106.244 Y73.1 E.00015
G1 X106.431 Y73.199 E.00148
M204 S10000
G1 X106.427 Y73.205 F42000
; LINE_WIDTH: 0.0978565
G1 F18000
M204 S6000
G2 X106.159 Y73.049 I-3.289 J5.325 E.00123
M204 S10000
G1 X105.78 Y73.099 F42000
; LINE_WIDTH: 0.146534
G1 F18000
M204 S6000
G3 X105.575 Y72.99 I.123 J-.476 E.00164
; WIPE_START
G1 X105.747 Y73.1 E-.32619
G1 X105.78 Y73.099 E-.05381
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I1.152 J.392 P1  F42000
G1 X106.692 Y70.422 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X107.578 Y71.308 E.03023
G1 X107.578 Y71.854
G1 X106.146 Y70.422 E.04883
G1 X105.601 Y70.422
G1 X106.116 Y70.937 E.01757
G1 X105.635 Y71.002
G1 X105.055 Y70.422 E.01977
G1 X104.51 Y70.422
G1 X105.288 Y71.2 E.02654
G1 X105.048 Y71.505
G1 X103.965 Y70.422 E.03695
G1 X103.419 Y70.422
G1 X104.93 Y71.933 E.05152
G1 X105.37 Y72.918
G1 X102.874 Y70.422 E.08513
G1 X102.328 Y70.422
G1 X105.297 Y73.391 E.10125
G1 X105.055 Y73.694
G1 X101.783 Y70.422 E.1116
G1 X101.237 Y70.422
G1 X104.93 Y74.115 E.12594
; WIPE_START
M204 S6000
G1 X104.223 Y73.408 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.574 J1.073 P1  F42000
G1 X107.066 Y71.887 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F12000
M204 S2000
G1 X107.578 Y72.399 E.01747
G1 X107.578 Y72.945
G1 X107.002 Y72.369 E.01962
G1 X106.797 Y72.709
G1 X107.578 Y73.49 E.02663
G1 X107.578 Y74.036
G1 X106.693 Y73.151 E.03016
G1 X107.065 Y74.068
G1 X107.578 Y74.581 E.01749
G1 X107.578 Y75.126
G1 X107.008 Y74.556 E.01945
G1 X106.807 Y74.901
G1 X107.578 Y75.672 E.02629
G1 X107.578 Y76.217
G1 X106.504 Y75.143 E.03663
G1 X106.081 Y75.265
G1 X107.578 Y76.763 E.05106
G1 X107.578 Y77.308
G1 X100.692 Y70.422 E.23483
G1 X100.147 Y70.422
G1 X107.578 Y77.853 E.25343
G1 X107.578 Y78.399
G1 X99.601 Y70.422 E.27204
G1 X99.056 Y70.422
G1 X107.578 Y78.944 E.29064
G1 X107.578 Y79.49
G1 X98.51 Y70.422 E.30924
G1 X97.965 Y70.422
G1 X107.578 Y80.035 E.32784
G1 X107.578 Y80.58
G1 X97.42 Y70.422 E.34644
G1 X96.874 Y70.422
G1 X107.578 Y81.126 E.36504
G1 X107.578 Y81.671
G1 X96.329 Y70.422 E.38364
M73 P86 R1
G1 X95.783 Y70.422
G1 X107.578 Y82.217 E.40224
G1 X107.578 Y82.762
G1 X95.238 Y70.422 E.42084
G1 X94.693 Y70.422
G1 X107.578 Y83.307 E.43944
G1 X107.578 Y83.853
G1 X94.147 Y70.422 E.45804
G1 X93.602 Y70.422
G1 X107.578 Y84.398 E.47664
G1 X107.578 Y84.944
G1 X93.056 Y70.422 E.49524
G1 X92.511 Y70.422
G1 X107.578 Y85.489 E.51384
G1 X107.578 Y86.034
G1 X91.966 Y70.422 E.53244
G1 X91.42 Y70.422
G1 X107.578 Y86.58 E.55104
G1 X107.578 Y87.125
G1 X90.875 Y70.422 E.56964
G1 X90.329 Y70.422
G1 X107.578 Y87.671 E.58824
G1 X107.578 Y88.216
G1 X89.784 Y70.422 E.60685
G1 X89.239 Y70.422
G1 X107.578 Y88.761 E.62545
G1 X107.578 Y89.307
G1 X88.693 Y70.422 E.64405
G1 X88.148 Y70.422
G1 X107.578 Y89.852 E.66265
G1 X107.578 Y90.398
G1 X87.602 Y70.422 E.68125
G1 X87.057 Y70.422
G1 X107.578 Y90.943 E.69985
G1 X107.578 Y91.488
G1 X86.512 Y70.422 E.71845
G1 X85.966 Y70.422
G1 X107.578 Y92.034 E.73705
G1 X107.578 Y92.579
G1 X85.421 Y70.422 E.75565
M73 P87 R1
G1 X84.875 Y70.422
G1 X107.578 Y93.125 E.77425
G1 X107.578 Y93.67
G1 X84.33 Y70.422 E.79285
M73 P87 R0
G1 X83.784 Y70.422
G1 X107.578 Y94.216 E.81145
G1 X107.578 Y94.761
G1 X83.239 Y70.422 E.83005
G1 X82.694 Y70.422
G1 X107.578 Y95.306 E.84865
G1 X107.578 Y95.852
G1 X82.148 Y70.422 E.86725
G1 X81.603 Y70.422
G1 X107.578 Y96.397 E.88585
G1 X107.578 Y96.943
G1 X81.057 Y70.422 E.90445
G1 X80.512 Y70.422
G1 X107.578 Y97.488 E.92305
G1 X107.578 Y98.033
G1 X79.967 Y70.422 E.94166
G1 X79.421 Y70.422
G1 X107.578 Y98.579 E.96026
G1 X107.578 Y99.124
G1 X78.876 Y70.422 E.97886
G1 X78.33 Y70.422
G1 X107.578 Y99.67 E.99746
G1 X107.578 Y100.215
G1 X77.785 Y70.422 E1.01606
G1 X77.284 Y70.466
G1 X107.534 Y100.716 E1.03166
G1 X107.276 Y101.003
G1 X76.997 Y70.724 E1.03263
M73 P88 R0
G1 X76.923 Y71.197
G1 X106.805 Y101.078 E1.01908
G1 X106.259 Y101.078
G1 X76.923 Y71.742 E1.00048
G1 X76.923 Y72.287
G1 X105.714 Y101.078 E.98188
G1 X105.168 Y101.078
G1 X76.923 Y72.833 E.96328
G1 X76.923 Y73.378
G1 X104.623 Y101.078 E.94468
G1 X104.078 Y101.078
G1 X76.923 Y73.923 E.92608
G1 X76.923 Y74.469
G1 X103.532 Y101.078 E.90749
G1 X102.987 Y101.078
G1 X76.923 Y75.014 E.88889
G1 X76.923 Y75.559
G1 X102.441 Y101.078 E.87029
G1 X101.896 Y101.078
G1 X76.923 Y76.105 E.85169
G1 X76.923 Y76.65
G1 X101.351 Y101.078 E.83309
G1 X100.805 Y101.078
G1 X76.923 Y77.195 E.81449
G1 X76.922 Y77.741
G1 X100.26 Y101.078 E.79589
G1 X99.714 Y101.078
G1 X76.922 Y78.286 E.7773
G1 X76.922 Y78.831
G1 X99.169 Y101.078 E.7587
M73 P89 R0
G1 X98.624 Y101.078
G1 X76.922 Y79.377 E.7401
G1 X76.922 Y79.922
G1 X77.628 Y80.628 E.02407
G1 X77.922 Y80.922
G1 X98.078 Y101.078 E.6874
G1 X97.533 Y101.078
G1 X77.922 Y81.467 E.6688
G1 X77.922 Y82.013
G1 X96.987 Y101.078 E.6502
G1 X96.442 Y101.078
G1 X77.922 Y82.558 E.6316
G1 X77.922 Y83.104
G1 X95.896 Y101.078 E.613
G1 X95.351 Y101.078
G1 X77.922 Y83.649 E.5944
G1 X77.922 Y84.194
G1 X94.806 Y101.078 E.5758
G1 X94.26 Y101.078
G1 X77.922 Y84.74 E.5572
G1 X77.922 Y85.285
G1 X93.715 Y101.078 E.5386
G1 X93.169 Y101.078
G1 X77.922 Y85.831 E.52
G1 X77.922 Y86.376
G1 X92.624 Y101.078 E.5014
G1 X92.079 Y101.078
G1 X77.922 Y86.921 E.4828
G1 X77.922 Y87.467
G1 X91.533 Y101.078 E.46419
G1 X90.988 Y101.078
G1 X77.922 Y88.012 E.44559
G1 X77.922 Y88.558
G1 X90.442 Y101.078 E.42699
G1 X89.897 Y101.078
G1 X77.922 Y89.103 E.40839
G1 X77.922 Y89.648
G1 X89.352 Y101.078 E.38979
G1 X88.806 Y101.078
G1 X77.922 Y90.194 E.37119
M73 P90 R0
G1 X77.922 Y90.739
G1 X88.261 Y101.078 E.35259
G1 X87.715 Y101.078
G1 X77.51 Y90.872 E.34806
G1 X76.964 Y90.872
G1 X87.17 Y101.078 E.34806
G1 X86.625 Y101.078
G1 X76.922 Y91.376 E.33089
G1 X76.922 Y91.921
G1 X86.079 Y101.078 E.31229
G1 X85.534 Y101.078
G1 X76.922 Y92.466 E.29369
G1 X76.922 Y93.012
G1 X84.988 Y101.078 E.27508
G1 X84.443 Y101.078
G1 X76.922 Y93.557 E.25648
G1 X76.923 Y94.103
G1 X83.898 Y101.078 E.23788
G1 X83.352 Y101.078
G1 X76.923 Y94.648 E.21927
G1 X76.923 Y95.194
G1 X82.807 Y101.078 E.20067
G1 X82.261 Y101.078
G1 X76.923 Y95.739 E.18207
G1 X76.923 Y96.285
G1 X81.716 Y101.078 E.16347
G1 X81.171 Y101.078
G1 X76.923 Y96.83 E.14486
G1 X76.923 Y97.376
G1 X80.625 Y101.078 E.12626
G1 X80.08 Y101.078
G1 X76.923 Y97.921 E.10766
G1 X76.923 Y98.467
G1 X79.534 Y101.078 E.08905
G1 X78.989 Y101.078
G1 X76.923 Y99.012 E.07045
G1 X76.923 Y99.558
G1 X78.444 Y101.078 E.05185
G1 X77.898 Y101.078
G1 X76.923 Y100.103 E.03325
; WIPE_START
M204 S6000
G1 X77.63 Y100.81 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.859 J.862 P1  F42000
G1 X107.593 Y70.971 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.226965
G1 F18000
M204 S6000
G2 X107.029 Y70.407 I-1.52 J.956 E.00969
M204 S10000
G1 X106.462 Y71.022 F42000
; LINE_WIDTH: 0.166831
G1 F18000
M204 S6000
G2 X106.184 Y70.869 I-1.678 J2.73 E.00263
; WIPE_START
G1 X106.462 Y71.022 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.923 J.793 P1  F42000
G1 X107.14 Y71.812 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.112696
G1 F18000
M204 S6000
G2 X106.964 Y71.539 I-2.785 J1.61 E.00159
M204 S10000
G1 X107.099 Y72.193 F42000
; LINE_WIDTH: 0.0873839
G1 F18000
M204 S6000
G3 X107.018 Y72.328 I-1.376 J-.736 E.00052
M204 S10000
G1 X106.723 Y73.094 F42000
; LINE_WIDTH: 0.083232
G1 F18000
M204 S6000
G1 X106.747 Y73.062 E.00012
; LINE_WIDTH: 0.109979
G1 X106.759 Y73.015 E.00023
; LINE_WIDTH: 0.156425
G2 X106.575 Y72.879 I-.945 J1.09 E.00175
; WIPE_START
G1 X106.759 Y73.015 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-1.18 J.298 P1  F42000
G1 X107.104 Y74.379 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.0822263
G1 F18000
M204 S6000
G3 X107.023 Y74.515 I-1.35 J-.712 E.00047
; WIPE_START
G1 X107.104 Y74.379 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.816 J-.903 P1  F42000
G1 X77.53 Y101.097 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.291424
G1 F18000
M204 S6000
G3 X76.904 Y100.471 I.992 J-1.62 E.01437
; WIPE_START
G1 X77.176 Y100.824 E-.18953
G1 X77.53 Y101.097 E-.19047
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I1.217 J-.012 P1  F42000
G1 X77.225 Y70.497 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.0885534
G1 F18000
M204 S6000
G2 X77.125 Y70.58 I.373 J.545 E.00044
; WIPE_START
G1 X77.225 Y70.497 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.169 J1.205 P1  F42000
G1 X104.949 Y74.382 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.0955526
G1 F18000
M204 S6000
G3 X104.853 Y74.192 I1.795 J-1.022 E.00081
; WIPE_START
G1 X104.949 Y74.382 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.735 J.97 P1  F42000
G1 X106.096 Y75.25 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.155504
M73 P91 R0
G1 F18000
M204 S6000
G1 X105.944 Y75.314 E.00124
G1 X105.812 Y75.253 E.00111
; WIPE_START
G1 X105.944 Y75.314 E-.17892
G1 X106.096 Y75.25 E-.20108
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I1.217 J.024 P1  F42000
G1 X106.827 Y37.733 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G3 X105.832 Y36.656 I-.828 J-.233 E.08795
G1 X105.956 Y36.641 E.00301
G3 X106.841 Y37.674 I.043 J.859 E.03786
; WIPE_START
M204 S6000
G1 X106.765 Y37.893 E-.08787
G1 X106.673 Y38.036 E-.06494
G1 X106.449 Y38.234 E-.11349
G1 X106.294 Y38.309 E-.06537
G1 X106.17 Y38.34 E-.04832
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.661 J-1.022 P1  F42000
G1 X81.71 Y54.16 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F12000
M204 S5000
G1 X81.71 Y44.34 E.23681
G1 X80.71 Y44.34 E.02411
G1 X80.711 Y36.461 E.19
G3 X81.505 Y35.71 I.792 J.041 E.02909
G1 X106.997 Y35.71 E.61474
G3 X107.789 Y36.461 I-.007 J.8 E.02896
G1 X107.79 Y61.995 E.61574
G3 X106.995 Y62.79 I-.8 J-.004 E.03008
G1 X81.505 Y62.79 E.61469
G3 X80.711 Y62.039 I.005 J-.8 E.02902
G1 X80.71 Y54.16 E.19
G1 X81.65 Y54.16 E.02267
; WIPE_START
M204 S6000
G1 X81.656 Y53.16 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.645 J1.032 P1  F42000
G1 X107.577 Y36.947 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X106.552 Y35.922 E.03494
G1 X106.007 Y35.922
G1 X107.577 Y37.492 E.05354
G1 X107.069 Y37.53
G1 X107.577 Y38.038 E.01731
G1 X107.577 Y38.583
G1 X106.963 Y37.969 E.02093
G1 X106.723 Y38.275
G1 X107.577 Y39.128 E.02912
G1 X107.577 Y39.674
G1 X106.397 Y38.494 E.04023
G1 X105.927 Y38.569
G1 X107.577 Y40.219 E.05628
; WIPE_START
M204 S6000
G1 X106.87 Y39.512 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I1.168 J-.341 P1  F42000
G1 X105.972 Y36.433 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F12000
M204 S2000
G1 X105.461 Y35.922 E.01743
G1 X104.916 Y35.922
G1 X105.533 Y36.539 E.02104
G1 X105.219 Y36.771
G1 X104.37 Y35.922 E.02894
G1 X103.825 Y35.922
G1 X105.008 Y37.105 E.04033
G1 X104.933 Y37.576
G1 X103.28 Y35.922 E.0564
G1 X102.734 Y35.922
G1 X107.577 Y40.765 E.16515
G1 X107.577 Y41.31
G1 X102.189 Y35.922 E.18375
G1 X101.643 Y35.922
G1 X107.577 Y41.856 E.20236
G1 X107.577 Y42.401
G1 X101.098 Y35.922 E.22096
G1 X100.553 Y35.922
G1 X107.577 Y42.947 E.23956
G1 X107.577 Y43.492
G1 X100.007 Y35.922 E.25816
G1 X99.462 Y35.922
G1 X107.577 Y44.037 E.27676
G1 X107.577 Y44.583
G1 X98.916 Y35.922 E.29536
G1 X98.371 Y35.922
G1 X107.577 Y45.128 E.31397
G1 X107.577 Y45.674
G1 X97.826 Y35.922 E.33257
G1 X97.28 Y35.922
G1 X107.577 Y46.219 E.35117
G1 X107.577 Y46.765
G1 X96.735 Y35.922 E.36977
M73 P92 R0
G1 X96.189 Y35.922
G1 X107.577 Y47.31 E.38837
G1 X107.577 Y47.855
G1 X95.644 Y35.922 E.40697
G1 X95.099 Y35.922
G1 X107.577 Y48.401 E.42557
G1 X107.577 Y48.946
G1 X94.553 Y35.922 E.44418
G1 X94.008 Y35.922
G1 X107.577 Y49.492 E.46278
G1 X107.577 Y50.037
G1 X93.462 Y35.922 E.48138
G1 X92.917 Y35.922
G1 X107.577 Y50.583 E.49998
G1 X107.577 Y51.128
G1 X92.372 Y35.922 E.51858
G1 X91.826 Y35.922
G1 X107.577 Y51.673 E.53718
G1 X107.577 Y52.219
M73 P93 R0
G1 X91.281 Y35.922 E.55578
G1 X90.735 Y35.922
G1 X107.577 Y52.764 E.57439
G1 X107.577 Y53.31
G1 X90.19 Y35.922 E.59299
G1 X89.645 Y35.922
G1 X107.578 Y53.855 E.61159
G1 X107.578 Y54.401
G1 X89.099 Y35.922 E.63019
G1 X88.554 Y35.922
G1 X107.578 Y54.946 E.64879
G1 X107.578 Y55.491
G1 X88.008 Y35.922 E.66739
G1 X87.463 Y35.922
G1 X107.578 Y56.037 E.68599
G1 X107.578 Y56.582
G1 X86.917 Y35.922 E.7046
G1 X86.372 Y35.922
G1 X107.578 Y57.128 E.7232
G1 X107.578 Y57.673
G1 X85.827 Y35.922 E.7418
G1 X85.281 Y35.922
G1 X107.578 Y58.219 E.7604
G1 X107.578 Y58.764
G1 X84.736 Y35.922 E.779
G1 X84.19 Y35.922
G1 X107.578 Y59.309 E.7976
G1 X107.578 Y59.855
G1 X83.645 Y35.922 E.8162
G1 X83.1 Y35.922
G1 X107.578 Y60.4 E.83481
G1 X107.578 Y60.946
G1 X82.554 Y35.922 E.85341
G1 X82.009 Y35.922
G1 X107.578 Y61.491 E.87201
M73 P94 R0
G1 X107.573 Y62.032
G1 X81.468 Y35.927 E.89029
G1 X81.09 Y36.095
G1 X107.405 Y62.41 E.89745
G1 X107.025 Y62.574
G1 X80.926 Y36.475 E.89008
G1 X80.923 Y37.018
G1 X106.483 Y62.578 E.87169
G1 X105.938 Y62.578
G1 X80.923 Y37.563 E.85309
G1 X80.923 Y38.109
G1 X105.392 Y62.578 E.83449
G1 X104.847 Y62.578
G1 X80.923 Y38.654 E.8159
G1 X80.923 Y39.199
G1 X104.301 Y62.578 E.7973
G1 X103.756 Y62.578
G1 X80.923 Y39.745 E.7787
G1 X80.923 Y40.29
G1 X103.211 Y62.578 E.7601
G1 X102.665 Y62.578
G1 X80.923 Y40.835 E.74151
G1 X80.923 Y41.381
G1 X102.12 Y62.578 E.72291
G1 X101.574 Y62.578
G1 X80.922 Y41.926 E.70431
G1 X80.922 Y42.471
G1 X101.029 Y62.578 E.68571
G1 X100.484 Y62.578
G1 X80.922 Y43.017 E.66711
G1 X80.922 Y43.562
G1 X81.488 Y44.128 E.0193
G1 X81.922 Y44.562
G1 X99.938 Y62.578 E.61442
M73 P95 R0
G1 X99.393 Y62.578
G1 X81.922 Y45.107 E.59582
G1 X81.922 Y45.653
G1 X98.847 Y62.578 E.57722
G1 X98.302 Y62.578
G1 X81.922 Y46.198 E.55862
G1 X81.922 Y46.744
G1 X97.756 Y62.578 E.54002
G1 X97.211 Y62.578
G1 X81.922 Y47.289 E.52142
G1 X81.922 Y47.834
G1 X96.666 Y62.578 E.50282
G1 X96.12 Y62.578
G1 X81.922 Y48.38 E.48421
G1 X81.922 Y48.925
G1 X95.575 Y62.578 E.46561
G1 X95.029 Y62.578
G1 X81.922 Y49.471 E.44701
G1 X81.922 Y50.016
G1 X94.484 Y62.578 E.42841
G1 X93.939 Y62.578
G1 X81.922 Y50.561 E.40981
G1 X81.922 Y51.107
G1 X93.393 Y62.578 E.39121
G1 X92.848 Y62.578
G1 X81.922 Y51.652 E.37261
G1 X81.922 Y52.198
G1 X92.302 Y62.578 E.35401
G1 X91.757 Y62.578
G1 X81.922 Y52.743 E.33541
G1 X81.922 Y53.288
G1 X91.212 Y62.578 E.31681
G1 X90.666 Y62.578
G1 X81.922 Y53.834 E.29821
G1 X81.915 Y54.372
G1 X90.121 Y62.578 E.27985
G1 X89.575 Y62.578
G1 X81.37 Y54.372 E.27985
G1 X80.922 Y54.47
G1 X89.03 Y62.578 E.27651
G1 X88.485 Y62.578
G1 X80.922 Y55.016 E.25791
G1 X80.922 Y55.561
G1 X87.939 Y62.578 E.2393
G1 X87.394 Y62.578
G1 X80.922 Y56.107 E.2207
G1 X80.923 Y56.652
G1 X86.848 Y62.578 E.2021
M73 P96 R0
G1 X86.303 Y62.578
G1 X80.923 Y57.198 E.18349
G1 X80.923 Y57.743
G1 X85.758 Y62.578 E.16489
G1 X85.212 Y62.578
G1 X80.923 Y58.288 E.14629
G1 X80.923 Y58.834
G1 X84.667 Y62.578 E.12768
G1 X84.121 Y62.578
G1 X80.923 Y59.379 E.10908
G1 X80.923 Y59.925
G1 X83.576 Y62.578 E.09048
G1 X83.031 Y62.578
G1 X80.923 Y60.47 E.07187
G1 X80.923 Y61.016
G1 X82.485 Y62.578 E.05327
G1 X81.94 Y62.578
G1 X80.923 Y61.561 E.03467
; WIPE_START
M204 S6000
G1 X81.63 Y62.269 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.883 J.838 P1  F42000
G1 X104.87 Y37.785 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101172
G1 F18000
M204 S6000
G1 X104.946 Y37.564 E.00098
M204 S10000
G1 X105.007 Y37.895 F42000
; LINE_WIDTH: 0.0927242
G1 F18000
M204 S6000
G3 X104.855 Y37.655 I2.271 J-1.605 E.00104
; WIPE_START
G1 X105.007 Y37.895 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.805 J.912 P1  F42000
G1 X105.854 Y38.642 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.136006
G1 F18000
M204 S6000
G1 X105.597 Y38.496 E.00188
; WIPE_START
G1 X105.854 Y38.642 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.854 J-.867 P1  F42000
G1 X81.555 Y62.597 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.321144
G1 F16997.436
M204 S6000
G3 X80.904 Y61.974 I1.106 J-1.809 E.01628
; WIPE_START
G1 X81.196 Y62.322 E-.1903
G1 X81.555 Y62.597 E-.1897
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I1.217 J.024 P1  F42000
G1 X81.718 Y54.353 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.0945597
G1 F18000
M204 S6000
G1 X81.695 Y54.383 E.00014
G1 X81.812 Y54.475 E.00056
; WIPE_START
G1 X81.695 Y54.383 E-.30319
G1 X81.718 Y54.353 E-.07681
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I.721 J.98 P1  F42000
G1 X106.173 Y36.361 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.111879
G1 F18000
M204 S6000
G1 X105.962 Y36.444 E.0011
; WIPE_START
G1 X106.173 Y36.361 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-.143 J1.209 P1  F42000
G1 X107.596 Y36.53 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.327046
G1 F16654.713
M204 S6000
G1 X107.302 Y36.18 E.00836
G2 X106.94 Y35.903 I-1.59 J1.699 E.00836
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F16654.713
G1 X107.302 Y36.18 E-.18978
G1 X107.596 Y36.53 E-.19022
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z1.34 F900 ; lower z a little
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
M73 P97 R0
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

    G1 Z100.84 F600
    G1 Z98.84

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


; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 33m 36s; total estimated time: 33m 55s
; total layer number: 141
; total filament length [mm] : 834.63
; total filament volume [cm^3] : 2007.52
; total filament weight [g] : 2.51
; filament_density: 1.25
; filament_diameter: 1.75
; max_z_height: 22.60
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
M73 P0 R33
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
; layer num/total_layer_count: 1/141
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
G1 X83.906 Y75.752 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X83.906 Y73.04 E.09689
G3 X84.414 Y71.889 I7.065 J2.431 E.04499
G1 X84.414 Y76.269 E.15648
G2 X84.921 Y76.923 I1.974 J-1.01 E.02974
G1 X84.921 Y71.249 E.20269
G3 X85.429 Y70.817 I1.533 J1.286 E.02394
G1 X85.429 Y77.361 E.2338
G1 X85.835 Y77.645 E.01768
G1 X85.937 Y77.553 E.0049
G1 X85.937 Y70.478 E.25278
G1 X86.445 Y70.271 E.01959
G1 X86.445 Y77.233 E.24873
G3 X86.953 Y77.064 I1.094 J2.443 E.01915
G1 X86.953 Y70.12 E.2481
G1 X87.461 Y70.027 E.01844
G1 X87.461 Y77.015 E.24964
M73 P1 R33
G1 X87.969 Y77.015 E.01814
G1 X87.969 Y70.025 E.24971
G3 X88.476 Y70.059 I.172 J1.24 E.01831
G1 X88.476 Y77.015 E.24849
G1 X88.984 Y77.015 E.01814
G1 X88.984 Y70.014 E.25009
G3 X89.492 Y69.836 I.701 J1.183 E.01936
G1 X89.492 Y77.014 E.25646
G1 X90 Y77.014 E.01814
G1 X90 Y69.701 E.26126
G1 X90.508 Y69.652 E.01823
G1 X90.508 Y77.014 E.26304
G1 X91.016 Y77.014 E.01814
G1 X91.016 Y69.654 E.26294
G1 X91.524 Y69.705 E.01823
G1 X91.524 Y77.014 E.26113
G1 X92.031 Y77.014 E.01814
G1 X92.031 Y69.844 E.25614
G3 X92.539 Y70.029 I-.209 J1.365 E.01943
G1 X92.539 Y77.014 E.24954
G1 X93.047 Y77.013 E.01814
G1 X93.047 Y70.302 E.23978
G3 X93.555 Y70.688 I-.714 J1.465 E.02295
G1 X93.555 Y77.013 E.22598
G1 X93.806 Y77.013 E.00898
G1 X94.063 Y76.703 E.01439
G1 X94.063 Y71.206 E.19638
G3 X94.571 Y71.972 I-1.667 J1.657 E.03304
G1 X94.571 Y76.371 E.15717
M204 S6000
G1 X91.22 Y69.261 F42000
G1 F3000
M204 S500
G3 X93.957 Y77.425 I-.477 J4.7 E.38691
G1 X87.356 Y77.426 E.23581
G2 X85.931 Y78.14 I.084 J1.948 E.05868
G3 X88.714 Y69.693 I1.912 J-4.052 E.46364
G3 X90.75 Y69.214 I2.203 J4.803 E.07524
G1 X91.152 Y69.254 E.01443
; WIPE_START
G1 X91.678 Y69.306 E-.20076
G1 X92.129 Y69.444 E-.17924
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.213 J-.095 P1  F42000
G1 X91.184 Y81.494 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G2 X87.212 Y82.947 I-.263 J5.439 E.15518
G1 X87.19 Y90.645 E.27504
G2 X91.253 Y81.498 I3.714 J-3.827 E.73285
M204 S6000
G1 X95.586 Y88.876 F42000
G1 F3000
M204 S500
G1 X95.586 Y85.319 E.12708
G2 X95.079 Y84.201 I-5.969 J2.037 E.04394
G1 X95.079 Y89.416 E.18632
G3 X94.571 Y90.096 I-2.127 J-1.06 E.03048
G1 X94.571 Y83.521 E.23489
G1 X94.063 Y83.036 E.0251
G1 X94.063 Y90.582 E.26958
G3 X93.555 Y90.942 I-1.247 J-1.219 E.02237
G1 X93.555 Y82.675 E.29534
G2 X93.047 Y82.385 I-1.054 J1.255 E.02101
G1 X93.047 Y91.232 E.31608
G1 X92.539 Y91.449 E.01973
G1 X92.539 Y82.168 E.33159
G2 X92.031 Y82.03 I-.635 J1.33 E.0189
G1 X92.031 Y91.588 E.34147
G3 X91.524 Y91.696 I-.552 J-1.346 E.01865
G1 X91.524 Y81.921 E.34919
G1 X91.016 Y81.899 E.01816
G1 X91.016 Y91.719 E.35082
G3 X90.508 Y91.71 I-.23 J-1.404 E.01824
G1 X90.508 Y81.907 E.3502
G1 X90 Y81.976 E.01831
G1 X90 Y91.641 E.34528
G3 X89.492 Y91.513 I.1 J-1.463 E.01882
G1 X89.492 Y82.105 E.3361
G1 X88.984 Y82.27 E.01908
G1 X88.984 Y91.347 E.32431
G3 X88.476 Y91.078 I.488 J-1.532 E.02065
G1 X88.476 Y82.539 E.30506
G2 X87.969 Y82.869 I.656 J1.565 E.02176
G1 X87.969 Y91.011 E.29086
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S6000
G17
G3 Z.6 I-.866 J.855 P1  F42000
G1 X91.13 Y94.212 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G2 X87.19 Y95.638 I-.265 J5.421 E.1537
G1 X87.19 Y103.413 E.27777
G2 X91.198 Y94.215 I3.65 J-3.882 E.72885
M204 S6000
G1 X95.586 Y101.481 F42000
G1 F3000
M204 S500
G1 X95.586 Y98.232 E.11607
G2 X95.079 Y96.992 I-6.872 J2.092 E.04792
G1 X95.079 Y102.059 E.181
G1 X94.571 Y102.758 E.03087
G1 X94.571 Y96.293 E.23095
G2 X94.063 Y95.804 I-1.601 J1.154 E.02532
G1 X94.063 Y103.247 E.26589
G3 X93.555 Y103.623 I-1.291 J-1.211 E.02271
G1 X93.555 Y95.428 E.29278
G2 X93.047 Y95.125 I-1.089 J1.248 E.02124
G1 X93.047 Y103.926 E.31443
G1 X92.539 Y104.143 E.01973
G1 X92.539 Y94.908 E.32994
G2 X92.031 Y94.759 I-.664 J1.325 E.01901
G1 X92.031 Y104.292 E.34058
G1 X91.524 Y104.408 E.01861
G1 X91.524 Y94.643 E.34887
G2 X91.016 Y94.618 I-1.276 J20.757 E.01817
G1 X91.016 Y104.433 E.35065
G3 X90.508 Y104.434 I-.257 J-1.399 E.01824
G1 X90.508 Y94.617 E.35072
G1 X90 Y94.686 E.01831
G1 X90 Y104.365 E.34581
G3 X89.492 Y104.247 I.072 J-1.458 E.01873
G1 X89.492 Y94.804 E.33736
G1 X88.984 Y94.969 E.01908
G1 X88.984 Y104.082 E.32557
G3 X88.476 Y103.824 I.457 J-1.528 E.02046
G1 X88.476 Y95.227 E.30713
G2 X87.969 Y95.543 I.617 J1.558 E.02149
G1 X87.969 Y103.771 E.29394
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S6000
G17
G3 Z.6 I.583 J1.068 P1  F42000
G1 X103.134 Y95.486 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Brim
G1 F3000
M204 S500
G1 X103.878 Y96.219 E.03734
G1 X104.707 Y97.175 E.04518
G1 X105.459 Y98.192 E.04518
G1 X106.129 Y99.264 E.04518
G1 X106.714 Y100.386 E.04519
G1 X107.21 Y101.549 E.04518
G1 X107.613 Y102.748 E.04519
G1 X107.922 Y103.974 E.04518
G1 X108.134 Y105.219 E.04512
G1 X108.269 Y107.037 E.06514
G1 X108.284 Y107.88 E.0301
G1 X108.257 Y109.148 E.04533
G1 X108.132 Y110.407 E.04519
G1 X107.909 Y111.652 E.04517
G1 X107.59 Y112.876 E.04519
G1 X107.177 Y114.071 E.04519
G1 X106.672 Y115.231 E.04521
G1 X106.212 Y116.113 E.03551
G1 X105.557 Y117.196 E.04524
G1 X104.819 Y118.224 E.04518
G1 X104.005 Y119.191 E.04518
G1 X103.117 Y120.091 E.04518
G1 X102.161 Y120.92 E.04518
G1 X101.145 Y121.672 E.04518
G1 X100.072 Y122.342 E.04518
G1 X98.951 Y122.927 E.04518
G1 X97.787 Y123.423 E.04518
G1 X96.589 Y123.827 E.04518
G1 X95.362 Y124.136 E.04519
G1 X94.116 Y124.348 E.04518
G1 X92.855 Y124.463 E.04524
G1 X92.065 Y124.485 E.02823
G1 X87.498 Y124.5 E.16315
G1 X86.507 Y124.474 E.03543
G1 X85.302 Y124.371 E.04318
G1 X84.035 Y124.17 E.04586
G1 X82.663 Y123.847 E.05035
G1 X81.486 Y123.475 E.04408
G1 X79.796 Y122.776 E.06536
G1 X78.426 Y122.051 E.05536
G1 X77.357 Y121.374 E.0452
G1 X76.223 Y120.527 E.05057
G1 X75.181 Y119.615 E.04945
G1 X74.186 Y118.592 E.05101
G1 X73.202 Y117.397 E.05528
G1 X72.318 Y116.112 E.05573
G1 X71.681 Y115.002 E.04572
G1 X71.024 Y113.617 E.05479
G1 X70.376 Y111.825 E.06808
G1 X70.057 Y110.622 E.04446
G1 X69.82 Y109.362 E.0458
G1 X69.666 Y108.028 E.04797
G1 X69.616 Y106.744 E.04589
G1 X69.614 Y79.379 E.97764
G1 X69.64 Y78.443 E.03345
G1 X69.813 Y76.735 E.06135
G1 X70.053 Y75.448 E.04675
G1 X70.307 Y74.456 E.03661
G1 X70.687 Y73.288 E.04386
G1 X71.164 Y72.106 E.04556
G1 X71.686 Y71.038 E.04246
G1 X72.404 Y69.801 E.05111
G1 X73.166 Y68.7 E.04783
G1 X74.145 Y67.503 E.05524
G1 X75.372 Y66.258 E.06246
G1 X76.717 Y65.137 E.06253
G1 X77.941 Y64.291 E.05318
G1 X79.101 Y63.622 E.04782
G1 X80.634 Y62.901 E.06053
G1 X82.088 Y62.373 E.05525
G1 X83.259 Y62.047 E.04344
G1 X84.655 Y61.769 E.05085
G1 X85.853 Y61.621 E.04312
G1 X87.357 Y61.551 E.05381
G1 X94.05 Y61.549 E.2391
G1 X95.318 Y61.598 E.04534
G1 X96.574 Y61.745 E.04518
G1 X97.815 Y61.989 E.04518
G1 X99.033 Y62.33 E.04518
G1 X100.219 Y62.763 E.04509
G1 X101.997 Y63.622 E.07056
G1 X103.078 Y64.276 E.04511
G1 X104.105 Y65.013 E.04519
G1 X105.073 Y65.827 E.04518
G1 X105.974 Y66.715 E.04517
G1 X106.803 Y67.67 E.04519
G1 X107.555 Y68.687 E.04518
G1 X108.226 Y69.759 E.04518
G1 X108.811 Y70.88 E.04518
G1 X109.307 Y72.043 E.04518
G1 X109.711 Y73.242 E.04518
G1 X110.02 Y74.468 E.04518
G1 X110.233 Y75.713 E.04511
G1 X110.368 Y77.537 E.06536
G1 X110.383 Y78.379 E.0301
G1 X110.357 Y79.648 E.04533
G1 X110.232 Y80.907 E.04519
G1 X110.009 Y82.152 E.04517
G1 X109.69 Y83.375 E.04519
G1 X109.277 Y84.571 E.04518
G1 X108.771 Y85.731 E.04523
G1 X108.358 Y86.528 E.03206
G1 X107.656 Y87.696 E.04869
G1 X106.919 Y88.724 E.04517
G1 X106.104 Y89.691 E.04518
G1 X105.216 Y90.591 E.04518
G1 X104.261 Y91.42 E.04516
G1 X103.16 Y92.226 E.04877
G1 X103.066 Y92.41 E.00739
G1 X103.066 Y95.323 E.10407
G1 X103.111 Y95.43 E.00416
M204 S6000
G1 X102.689 Y95.607 F42000
G1 F3000
M204 S500
G1 X102.707 Y95.65 E.00166
G1 X102.823 Y95.821 E.00738
G1 X103.548 Y96.536 E.03641
G1 X104.353 Y97.465 E.0439
G1 X105.084 Y98.454 E.04391
G1 X105.729 Y99.487 E.04352
G1 X106.303 Y100.586 E.0443
G1 X106.784 Y101.717 E.0439
G1 X107.175 Y102.882 E.04391
G1 X107.473 Y104.063 E.04352
G1 X107.679 Y105.268 E.04366
G1 X107.812 Y107.054 E.064
G1 X107.827 Y107.882 E.02957
G1 X107.801 Y109.115 E.04409
G1 X107.678 Y110.349 E.0443
G1 X107.461 Y111.559 E.0439
G1 X107.154 Y112.738 E.04352
G1 X106.753 Y113.9 E.04392
G1 X106.257 Y115.038 E.04436
G1 X105.812 Y115.892 E.0344
G1 X105.172 Y116.948 E.04411
G1 X104.455 Y117.947 E.04391
G1 X103.67 Y118.878 E.04353
G1 X102.807 Y119.754 E.0439
G1 X101.871 Y120.566 E.04429
G1 X100.892 Y121.291 E.04352
G1 X99.85 Y121.943 E.04391
G1 X98.75 Y122.516 E.04429
G1 X97.619 Y122.997 E.04391
G1 X96.455 Y123.389 E.0439
G1 X95.263 Y123.689 E.04391
G1 X94.062 Y123.894 E.04352
G1 X92.832 Y124.006 E.04413
G1 X92.06 Y124.028 E.0276
G1 X87.505 Y124.043 E.16272
G1 X86.528 Y124.017 E.03491
G1 X85.353 Y123.916 E.04215
G1 X84.118 Y123.72 E.04467
M73 P2 R33
G1 X82.779 Y123.405 E.04914
G1 X81.638 Y123.043 E.04278
G1 X79.996 Y122.364 E.06345
G1 X78.651 Y121.653 E.05437
G1 X77.613 Y120.994 E.04393
G1 X76.507 Y120.168 E.04931
G1 X75.492 Y119.279 E.04817
G1 X74.523 Y118.282 E.04968
G1 X73.564 Y117.117 E.0539
G1 X72.709 Y115.873 E.05395
G1 X72.084 Y114.785 E.04481
G1 X71.449 Y113.447 E.05293
G1 X70.815 Y111.694 E.0666
G1 X70.502 Y110.516 E.04354
G1 X70.271 Y109.288 E.04462
G1 X70.122 Y107.988 E.04678
G1 X70.073 Y106.733 E.04486
G1 X70.071 Y79.388 E.97693
G1 X70.097 Y78.468 E.03287
G1 X70.265 Y76.805 E.05969
G1 X70.5 Y75.543 E.04589
G1 X70.747 Y74.579 E.03554
G1 X71.119 Y73.44 E.0428
G1 X71.58 Y72.296 E.04408
G1 X72.087 Y71.258 E.04128
G1 X72.793 Y70.041 E.05024
G1 X73.535 Y68.971 E.04653
G1 X74.482 Y67.813 E.05341
G1 X75.677 Y66.599 E.06089
G1 X76.989 Y65.505 E.06101
G1 X78.191 Y64.675 E.0522
G1 X79.318 Y64.025 E.04648
G1 X80.816 Y63.322 E.05912
G1 X82.232 Y62.807 E.05384
G1 X83.37 Y62.491 E.04219
G1 X84.723 Y62.221 E.04929
G1 X85.897 Y62.076 E.04225
G1 X87.371 Y62.008 E.05274
G1 X94.044 Y62.006 E.23838
G1 X95.277 Y62.053 E.0441
G1 X96.498 Y62.196 E.04391
G1 X97.715 Y62.436 E.04429
G1 X98.898 Y62.767 E.04391
G1 X100.047 Y63.188 E.04369
G1 X101.773 Y64.022 E.0685
G1 X102.821 Y64.655 E.04375
G1 X103.82 Y65.371 E.04391
G1 X104.761 Y66.162 E.04391
G1 X105.644 Y67.032 E.04428
G1 X106.442 Y67.952 E.04353
G1 X107.18 Y68.949 E.04429
G1 X107.831 Y69.991 E.04391
G1 X108.399 Y71.081 E.04391
G1 X108.881 Y72.211 E.0439
G1 X109.273 Y73.376 E.04391
G1 X109.574 Y74.568 E.04391
G1 X109.779 Y75.775 E.04374
G1 X109.912 Y77.562 E.06402
G1 X109.926 Y78.382 E.02929
G1 X109.9 Y79.615 E.04409
G1 X109.779 Y80.839 E.04391
G1 X109.563 Y82.048 E.0439
G1 X109.254 Y83.238 E.0439
G1 X108.852 Y84.399 E.04391
G1 X108.36 Y85.531 E.04408
G1 X107.957 Y86.309 E.03132
G1 X107.277 Y87.44 E.04715
G1 X106.555 Y88.447 E.04427
G1 X105.769 Y89.378 E.04353
G1 X104.899 Y90.261 E.04429
G1 X103.972 Y91.065 E.04386
G1 X102.903 Y91.847 E.04731
G1 X102.745 Y92.033 E.00872
G1 X102.666 Y92.189 E.00624
G1 X102.609 Y92.426 E.00872
G1 X102.609 Y95.309 E.103
G1 X102.65 Y95.512 E.00738
G1 X102.666 Y95.551 E.00153
M204 S6000
G1 X102.242 Y95.707 F42000
G1 F3000
M204 S500
G1 X102.282 Y95.816 E.00413
G1 X102.512 Y96.156 E.01465
G1 X103.218 Y96.853 E.03547
G1 X103.999 Y97.755 E.04263
G1 X104.708 Y98.715 E.04264
G1 X105.329 Y99.709 E.04187
G1 X105.891 Y100.786 E.0434
G1 X106.358 Y101.884 E.04262
G1 X106.738 Y103.016 E.04264
G1 X107.024 Y104.152 E.04188
G1 X107.224 Y105.317 E.0422
G1 X107.355 Y107.072 E.06287
G1 X107.369 Y107.884 E.02901
G1 X107.344 Y109.083 E.04285
G1 X107.224 Y110.292 E.0434
G1 X107.015 Y111.456 E.04224
G1 X106.717 Y112.6 E.04226
G1 X106.328 Y113.729 E.04264
G1 X105.842 Y114.845 E.04352
G1 X105.411 Y115.672 E.03329
G1 X104.787 Y116.701 E.04299
G1 X104.091 Y117.67 E.04263
G1 X103.335 Y118.566 E.04188
G1 X102.498 Y119.417 E.04263
G1 X101.581 Y120.213 E.04341
G1 X100.63 Y120.915 E.04224
G1 X99.627 Y121.543 E.04226
G1 X98.55 Y122.104 E.04339
G1 X97.452 Y122.571 E.04264
G1 X96.321 Y122.951 E.04262
G1 X95.174 Y123.24 E.04227
G1 X94.008 Y123.439 E.04225
G1 X92.809 Y123.55 E.04301
G1 X92.054 Y123.571 E.02697
G1 X87.512 Y123.586 E.16226
G1 X86.55 Y123.56 E.03439
G1 X85.404 Y123.462 E.04111
G1 X84.201 Y123.27 E.04349
G1 X82.896 Y122.962 E.04791
G1 X81.789 Y122.611 E.04149
G1 X80.197 Y121.953 E.06155
G1 X78.876 Y121.254 E.05337
G1 X77.868 Y120.614 E.04266
G1 X76.791 Y119.809 E.04805
G1 X75.803 Y118.944 E.0469
G1 X74.86 Y117.973 E.04835
G1 X73.934 Y116.847 E.0521
G1 X73.099 Y115.634 E.0526
G1 X72.487 Y114.568 E.04389
G1 X71.874 Y113.277 E.05108
G1 X71.254 Y111.563 E.06511
G1 X70.948 Y110.41 E.04262
G1 X70.723 Y109.215 E.04342
G1 X70.579 Y107.958 E.04522
G1 X70.53 Y106.721 E.04421
G1 X70.528 Y79.396 E.97622
G1 X70.554 Y78.492 E.03229
G1 X70.717 Y76.876 E.05804
G1 X70.948 Y75.637 E.04503
G1 X71.188 Y74.703 E.03446
G1 X71.55 Y73.592 E.04173
G1 X71.996 Y72.487 E.0426
G1 X72.488 Y71.477 E.04011
G1 X73.183 Y70.282 E.04938
G1 X73.904 Y69.242 E.04523
G1 X74.818 Y68.124 E.05158
G1 X75.982 Y66.941 E.05932
G1 X77.261 Y65.874 E.05949
G1 X78.44 Y65.059 E.05121
G1 X79.535 Y64.428 E.04513
G1 X80.997 Y63.742 E.0577
G1 X82.377 Y63.241 E.05244
G1 X83.481 Y62.935 E.04094
G1 X84.791 Y62.674 E.04771
G1 X85.941 Y62.532 E.0414
G1 X87.385 Y62.465 E.05166
G1 X94.038 Y62.463 E.23767
G1 X95.247 Y62.51 E.04325
G1 X96.422 Y62.647 E.04225
G1 X97.614 Y62.882 E.04339
G1 X98.763 Y63.204 E.04263
G1 X99.874 Y63.612 E.04229
G1 X101.549 Y64.421 E.06646
G1 X102.574 Y65.04 E.04276
G1 X103.535 Y65.729 E.04226
G1 X104.449 Y66.497 E.04263
G1 X105.314 Y67.349 E.04338
G1 X106.082 Y68.234 E.04188
G1 X106.798 Y69.202 E.04301
G1 X107.437 Y70.223 E.04301
G1 X107.988 Y71.281 E.04263
G1 X108.455 Y72.379 E.04263
G1 X108.836 Y73.51 E.04264
G1 X109.125 Y74.657 E.04225
G1 X109.325 Y75.837 E.04275
G1 X109.455 Y77.587 E.06269
G1 X109.469 Y78.384 E.02847
G1 X109.444 Y79.583 E.04285
G1 X109.325 Y80.781 E.04302
G1 X109.117 Y81.945 E.04225
G1 X108.817 Y83.1 E.04263
G1 X108.428 Y84.228 E.04264
G1 X107.949 Y85.33 E.04292
G1 X107.556 Y86.09 E.03056
G1 X106.897 Y87.184 E.04561
G1 X106.197 Y88.161 E.04297
G1 X105.435 Y89.066 E.04226
G1 X104.582 Y89.931 E.04339
G1 X103.691 Y90.704 E.04215
G1 X102.64 Y91.473 E.04654
G1 X102.549 Y91.557 E.0044
G1 X102.405 Y91.728 E.00799
G1 X102.261 Y91.978 E.01033
G1 X102.22 Y92.087 E.00416
G1 X102.152 Y92.439 E.01281
G1 X102.152 Y95.298 E.10213
G1 X102.2 Y95.594 E.0107
G1 X102.221 Y95.651 E.00218
M204 S6000
G1 X101.793 Y95.794 F42000
G1 F3000
M204 S500
G1 X101.851 Y95.968 E.00655
G1 X101.907 Y96.077 E.0044
G1 X102.199 Y96.489 E.01804
G1 X102.888 Y97.17 E.03459
G1 X103.645 Y98.045 E.04137
G1 X104.327 Y98.968 E.04098
G1 X104.929 Y99.932 E.0406
G1 X105.48 Y100.987 E.0425
G1 X105.928 Y102.042 E.04096
G1 X106.3 Y103.15 E.04175
G1 X106.578 Y104.252 E.04061
G1 X106.768 Y105.366 E.04038
G1 X106.898 Y107.089 E.06173
G1 X106.912 Y107.885 E.02846
G1 X106.888 Y109.05 E.04161
G1 X106.77 Y110.234 E.04251
G1 X106.567 Y111.363 E.04097
G1 X106.281 Y112.463 E.04061
G1 X105.904 Y113.557 E.04137
G1 X105.427 Y114.652 E.04267
G1 X105.01 Y115.451 E.03218
G1 X104.402 Y116.453 E.04187
G1 X103.726 Y117.393 E.04136
G1 X103 Y118.254 E.04024
G1 X102.181 Y119.087 E.04172
G1 X101.29 Y119.859 E.04213
G1 X100.368 Y120.54 E.04097
G1 X99.404 Y121.143 E.0406
G1 X98.359 Y121.688 E.04211
G1 X97.284 Y122.146 E.04174
G1 X96.187 Y122.514 E.04135
G1 X95.084 Y122.791 E.04063
G1 X93.954 Y122.985 E.04098
G1 X92.786 Y123.093 E.0419
G1 X92.049 Y123.114 E.02634
G1 X87.52 Y123.129 E.16181
G1 X86.572 Y123.104 E.03388
G1 X85.454 Y123.007 E.04007
G1 X84.285 Y122.821 E.04231
G1 X83.013 Y122.52 E.04669
G1 X81.94 Y122.179 E.04021
G1 X80.397 Y121.541 E.05965
G1 X79.101 Y120.856 E.05238
G1 X78.124 Y120.235 E.04138
G1 X77.075 Y119.45 E.0468
G1 X76.115 Y118.608 E.04562
G1 X75.198 Y117.664 E.04702
G1 X74.296 Y116.567 E.05073
G1 X73.489 Y115.395 E.05083
G1 X72.89 Y114.351 E.04298
G1 X72.299 Y113.106 E.04923
G1 X71.689 Y111.42 E.06406
G1 X71.393 Y110.304 E.04127
G1 X71.175 Y109.142 E.04224
G1 X71.035 Y107.928 E.04367
G1 X70.987 Y106.709 E.04355
G1 X70.985 Y79.405 E.97549
G1 X71.011 Y78.517 E.03172
G1 X71.169 Y76.947 E.05639
G1 X71.396 Y75.731 E.04416
G1 X71.628 Y74.826 E.03338
G1 X71.982 Y73.744 E.04067
G1 X72.412 Y72.677 E.04113
G1 X72.89 Y71.697 E.03894
G1 X73.572 Y70.523 E.0485
G1 X74.273 Y69.513 E.04393
G1 X75.154 Y68.435 E.04976
G1 X76.288 Y67.282 E.05775
G1 X77.533 Y66.242 E.05796
G1 X78.69 Y65.442 E.05023
G1 X79.751 Y64.831 E.04378
G1 X81.178 Y64.162 E.05629
G1 X82.521 Y63.675 E.05103
G1 X83.592 Y63.379 E.0397
G1 X84.859 Y63.126 E.04615
G1 X85.985 Y62.987 E.04054
G1 X87.399 Y62.922 E.05058
G1 X94.032 Y62.92 E.23696
G1 X95.207 Y62.966 E.04201
G1 X96.357 Y63.1 E.04136
G1 X97.502 Y63.326 E.04172
G1 X98.627 Y63.641 E.04173
G1 X99.702 Y64.036 E.0409
G1 X101.325 Y64.821 E.06442
G1 X102.318 Y65.419 E.0414
G1 X103.25 Y66.087 E.04098
G1 X104.137 Y66.832 E.04136
G1 X104.976 Y67.658 E.0421
G1 X105.728 Y68.525 E.04099
G1 X106.417 Y69.455 E.04136
G1 X107.037 Y70.445 E.04173
G1 X107.577 Y71.481 E.04174
G1 X108.03 Y72.547 E.04135
G1 X108.398 Y73.644 E.04136
G1 X108.678 Y74.757 E.04098
G1 X108.872 Y75.898 E.04138
G1 X108.998 Y77.611 E.06136
G1 X109.012 Y78.385 E.02766
G1 X108.987 Y79.55 E.04161
G1 X108.872 Y80.713 E.04175
G1 X108.671 Y81.842 E.04097
G1 X108.38 Y82.963 E.04136
G1 X108.003 Y84.057 E.04136
G1 X107.538 Y85.129 E.04176
G1 X107.154 Y85.871 E.02982
G1 X106.518 Y86.928 E.04408
G1 X105.839 Y87.876 E.04169
G1 X105.093 Y88.762 E.04136
G1 X104.265 Y89.601 E.04211
G1 X103.41 Y90.343 E.04045
G1 X102.376 Y91.1 E.04578
G1 X102.197 Y91.266 E.00871
G1 X102.004 Y91.508 E.01106
G1 X101.829 Y91.828 E.01303
G1 X101.771 Y92.007 E.00674
G1 X101.695 Y92.451 E.01609
G1 X101.695 Y95.288 E.10137
G1 X101.748 Y95.658 E.01334
G1 X101.774 Y95.737 E.00297
M204 S6000
G1 X101.348 Y95.877 F42000
G1 F3000
M204 S500
G1 X101.449 Y96.184 E.01155
G1 X101.538 Y96.347 E.00665
G1 X101.886 Y96.822 E.02103
G1 X102.557 Y97.486 E.03375
G1 X103.292 Y98.336 E.04011
G1 X103.946 Y99.221 E.03934
G1 X104.53 Y100.154 E.03933
G1 X105.068 Y101.187 E.0416
G1 X105.502 Y102.209 E.03968
G1 X105.863 Y103.284 E.04048
G1 X106.131 Y104.352 E.03935
G1 X106.313 Y105.416 E.03856
G1 X106.441 Y107.106 E.06058
G1 X106.455 Y107.888 E.02791
G1 X106.431 Y109.017 E.04036
G1 X106.316 Y110.176 E.04161
G1 X106.121 Y111.26 E.03933
G1 X105.844 Y112.325 E.03934
G1 X105.479 Y113.386 E.04009
G1 X105.012 Y114.46 E.04182
G1 X104.609 Y115.23 E.03106
G1 X104.018 Y116.205 E.04074
G1 X103.369 Y117.107 E.03972
G1 X102.666 Y117.942 E.03898
G1 X101.864 Y118.757 E.04083
G1 X101 Y119.505 E.04084
G1 X100.106 Y120.165 E.0397
G1 X99.181 Y120.743 E.03896
G1 X98.169 Y121.272 E.04082
G1 X97.117 Y121.72 E.04084
G1 X96.053 Y122.076 E.04007
G1 X94.995 Y122.343 E.039
G1 X93.899 Y122.531 E.03971
G1 X92.763 Y122.636 E.04078
G1 X92.043 Y122.657 E.02571
G1 X87.527 Y122.672 E.16133
G1 X86.593 Y122.647 E.03338
G1 X85.505 Y122.552 E.03902
G1 X84.368 Y122.371 E.04114
G1 X83.13 Y122.078 E.04546
G1 X82.092 Y121.747 E.03892
G1 X80.598 Y121.129 E.05776
G1 X79.326 Y120.457 E.05138
G1 X78.379 Y119.855 E.04009
G1 X77.359 Y119.091 E.04555
G1 X76.426 Y118.272 E.04434
G1 X75.535 Y117.354 E.0457
G1 X74.658 Y116.287 E.04937
G1 X73.879 Y115.155 E.04906
G1 X73.293 Y114.134 E.04207
G1 X72.724 Y112.936 E.04738
G1 X72.124 Y111.278 E.06301
G1 X71.838 Y110.198 E.03991
G1 X71.626 Y109.069 E.04105
G1 X71.492 Y107.897 E.04212
G1 X71.444 Y106.698 E.04289
G1 X71.442 Y79.413 E.97476
G1 X71.468 Y78.542 E.03115
G1 X71.623 Y77.006 E.05515
G1 X71.843 Y75.826 E.04289
G1 X72.069 Y74.95 E.0323
G1 X72.413 Y73.897 E.0396
G1 X72.828 Y72.867 E.03966
G1 X73.291 Y71.917 E.03776
G1 X73.961 Y70.764 E.04763
G1 X74.641 Y69.784 E.04262
G1 X75.491 Y68.745 E.04795
G1 X76.593 Y67.623 E.05619
G1 X77.805 Y66.61 E.05643
G1 X78.939 Y65.826 E.04924
G1 X79.968 Y65.234 E.04242
G1 X81.359 Y64.583 E.05488
G1 X82.665 Y64.11 E.04962
G1 X83.703 Y63.823 E.03845
G1 X84.926 Y63.579 E.04458
G1 X86.029 Y63.443 E.03968
G1 X87.413 Y63.379 E.04951
G1 X94.025 Y63.377 E.23624
G1 X95.166 Y63.422 E.04077
G1 X96.291 Y63.553 E.04047
G1 X97.402 Y63.772 E.04044
G1 X98.492 Y64.078 E.04045
G1 X99.529 Y64.46 E.0395
G1 X101.102 Y65.22 E.06239
G1 X102.062 Y65.799 E.04004
G1 X102.966 Y66.445 E.03971
G1 X103.833 Y67.174 E.04046
G1 X104.639 Y67.968 E.04044
G1 X105.375 Y68.815 E.04009
G1 X106.036 Y69.708 E.0397
G1 X106.637 Y70.668 E.04045
G1 X107.16 Y71.672 E.04045
G1 X107.6 Y72.704 E.04008
G1 X107.961 Y73.778 E.04047
G1 X108.231 Y74.856 E.0397
G1 X108.418 Y75.96 E.04001
G1 X108.541 Y77.636 E.06004
G1 X108.554 Y78.387 E.02684
G1 X108.531 Y79.517 E.04038
G1 X108.42 Y80.645 E.04048
G1 X108.225 Y81.739 E.0397
G1 X107.944 Y82.826 E.04009
G1 X107.579 Y83.886 E.04008
G1 X107.126 Y84.929 E.04059
G1 X106.753 Y85.651 E.02906
G1 X106.139 Y86.672 E.04255
G1 X105.481 Y87.591 E.0404
G1 X104.751 Y88.458 E.04046
G1 X103.948 Y89.271 E.04083
G1 X103.129 Y89.981 E.03874
G1 X102.113 Y90.726 E.04501
G1 X101.836 Y90.987 E.0136
G1 X101.599 Y91.297 E.01393
G1 X101.392 Y91.695 E.01602
G1 X101.319 Y91.938 E.00906
G1 X101.238 Y92.462 E.01895
G1 X101.238 Y95.279 E.10067
G1 X101.294 Y95.712 E.01558
G1 X101.329 Y95.82 E.00404
M204 S6000
G1 X100.899 Y95.952 F42000
G1 F3000
M204 S500
G1 X101.011 Y96.316 E.01359
G1 X101.175 Y96.624 E.01247
G1 X101.51 Y97.083 E.02031
G1 X102.226 Y97.803 E.03627
G1 X102.937 Y98.626 E.03884
G1 X103.564 Y99.475 E.0377
G1 X104.13 Y100.377 E.03805
G1 X104.657 Y101.387 E.0407
G1 X105.076 Y102.377 E.0384
G1 X105.425 Y103.417 E.03921
G1 X105.682 Y104.441 E.0377
G1 X105.858 Y105.465 E.03712
G1 X105.983 Y107.124 E.05944
G1 X105.998 Y107.89 E.02736
G1 X105.975 Y108.984 E.03912
G1 X105.862 Y110.118 E.04071
G1 X105.676 Y111.156 E.03768
G1 X105.408 Y112.188 E.03808
G1 X105.055 Y113.215 E.03881
G1 X104.597 Y114.267 E.04096
G1 X104.209 Y115.009 E.02994
G1 X103.633 Y115.957 E.03962
G1 X103.011 Y116.822 E.03808
G1 X102.331 Y117.63 E.03772
G1 X101.555 Y118.419 E.03954
G1 X100.71 Y119.151 E.03994
G1 X99.844 Y119.789 E.03843
G1 X98.959 Y120.343 E.03732
G1 X97.978 Y120.856 E.03953
G1 X96.949 Y121.294 E.03994
G1 X95.93 Y121.635 E.03841
G1 X94.905 Y121.894 E.03775
G1 X93.834 Y122.078 E.03882
G1 X92.739 Y122.179 E.03929
G1 X92.038 Y122.2 E.02508
G1 X87.535 Y122.215 E.16087
G1 X86.615 Y122.19 E.03285
G1 X85.556 Y122.097 E.03798
G1 X84.452 Y121.921 E.03995
G1 X83.247 Y121.635 E.04423
G1 X82.244 Y121.315 E.03764
G1 X80.798 Y120.717 E.05588
G1 X79.551 Y120.059 E.05038
G1 X78.635 Y119.476 E.0388
G1 X77.643 Y118.732 E.04429
G1 X76.737 Y117.937 E.04306
G1 X75.873 Y117.045 E.04437
G1 X75.02 Y116.007 E.04801
G1 X74.27 Y114.916 E.04729
G1 X73.696 Y113.917 E.04116
G1 X73.15 Y112.766 E.04552
G1 X72.559 Y111.135 E.06196
G1 X72.283 Y110.092 E.03855
G1 X72.078 Y108.996 E.03985
G1 X71.948 Y107.857 E.04095
G1 X71.901 Y106.686 E.04188
G1 X71.899 Y79.422 E.97402
G1 X71.925 Y78.567 E.03058
G1 X72.077 Y77.065 E.05391
G1 X72.291 Y75.92 E.04162
G1 X72.509 Y75.074 E.0312
G1 X72.844 Y74.049 E.03855
G1 X73.245 Y73.057 E.0382
G1 X73.693 Y72.136 E.03659
G1 X74.35 Y71.005 E.04675
G1 X75.01 Y70.055 E.04132
G1 X75.828 Y69.055 E.04615
G1 X76.899 Y67.964 E.05463
G1 X78.078 Y66.978 E.0549
G1 X79.188 Y66.21 E.04824
G1 X80.185 Y65.637 E.04106
G1 X81.54 Y65.004 E.05347
G1 X82.809 Y64.544 E.04821
G1 X83.813 Y64.267 E.03721
G1 X85.004 Y64.03 E.04338
G1 X86.072 Y63.898 E.03845
M73 P2 R32
G1 X87.427 Y63.836 E.04843
G1 X94.019 Y63.834 E.23552
G1 X95.125 Y63.878 E.03953
G1 X96.225 Y64.006 E.03958
G1 X97.301 Y64.219 E.03916
G1 X98.356 Y64.515 E.03916
G1 X99.357 Y64.885 E.03811
G1 X100.878 Y65.62 E.06037
G1 X101.806 Y66.178 E.03868
G1 X102.681 Y66.803 E.03843
G1 X103.521 Y67.509 E.03918
G1 X104.302 Y68.277 E.03916
G1 X105.021 Y69.106 E.03919
G1 X105.661 Y69.971 E.03844
G1 X106.242 Y70.9 E.03916
G1 X106.749 Y71.872 E.03918
G1 X107.174 Y72.872 E.0388
G1 X107.523 Y73.912 E.03919
G1 X107.784 Y74.955 E.03842
G1 X107.964 Y76.022 E.03864
G1 X108.085 Y77.661 E.05871
G1 X108.097 Y78.389 E.02603
G1 X108.074 Y79.485 E.03916
G1 X107.967 Y80.577 E.03922
G1 X107.777 Y81.647 E.03881
G1 X107.507 Y82.688 E.03844
G1 X107.154 Y83.716 E.03881
G1 X106.715 Y84.728 E.03942
G1 X106.351 Y85.432 E.02831
G1 X105.759 Y86.416 E.04102
G1 X105.116 Y87.315 E.03949
G1 X104.417 Y88.145 E.03878
G1 X103.639 Y88.933 E.03955
G1 X102.84 Y89.627 E.03781
G1 X101.795 Y90.398 E.0464
G1 X101.466 Y90.717 E.01635
G1 X101.243 Y91.009 E.01314
G1 X100.951 Y91.574 E.02269
G1 X100.866 Y91.875 E.01119
G1 X100.781 Y92.471 E.02152
G1 X100.781 Y95.271 E.10003
G1 X100.839 Y95.76 E.01759
G1 X100.881 Y95.895 E.00505
M204 S6000
G1 X100.449 Y96.036 F42000
G1 F3000
M204 S500
G1 X100.613 Y96.54 E.01894
G1 X100.811 Y96.901 E.01472
G1 X101.135 Y97.345 E.01964
G1 X101.894 Y98.118 E.03869
G1 X102.583 Y98.915 E.03766
G1 X103.189 Y99.736 E.03645
G1 X103.73 Y100.6 E.03641
G1 X104.245 Y101.588 E.03979
G1 X104.65 Y102.544 E.03711
G1 X104.987 Y103.551 E.03794
G1 X105.233 Y104.53 E.03607
G1 X105.403 Y105.515 E.03569
G1 X105.526 Y107.142 E.05829
G1 X105.541 Y107.892 E.02681
G1 X105.518 Y108.951 E.03786
G1 X105.408 Y110.06 E.03982
G1 X105.227 Y111.064 E.03641
G1 X104.971 Y112.051 E.03645
G1 X104.63 Y113.044 E.03752
G1 X104.182 Y114.073 E.0401
G1 X103.808 Y114.788 E.02882
G1 X103.248 Y115.709 E.03849
G1 X102.653 Y116.537 E.03645
G1 X101.996 Y117.318 E.03646
G1 X101.238 Y118.089 E.03865
G1 X100.42 Y118.797 E.03863
G1 X99.582 Y119.414 E.03716
G1 X98.736 Y119.944 E.03569
G1 X97.787 Y120.44 E.03824
G1 X96.782 Y120.868 E.03904
G1 X95.806 Y121.195 E.03676
G1 X94.816 Y121.445 E.0365
G1 X93.769 Y121.625 E.03794
G1 X92.716 Y121.722 E.0378
G1 X92.032 Y121.743 E.02443
G1 X87.542 Y121.758 E.1604
G1 X86.637 Y121.733 E.03233
G1 X85.608 Y121.643 E.03693
G1 X84.536 Y121.471 E.03878
G1 X83.365 Y121.193 E.043
G1 X82.395 Y120.883 E.03636
G1 X80.999 Y120.306 E.054
G1 X79.777 Y119.66 E.04937
G1 X78.891 Y119.096 E.03751
G1 X77.927 Y118.373 E.04304
G1 X77.049 Y117.602 E.04178
G1 X76.21 Y116.736 E.04305
G1 X75.382 Y115.727 E.04665
G1 X74.66 Y114.677 E.04552
G1 X74.099 Y113.7 E.04024
G1 X73.575 Y112.596 E.04367
G1 X72.994 Y110.993 E.0609
G1 X72.728 Y109.987 E.03718
G1 X72.53 Y108.923 E.03867
G1 X72.404 Y107.817 E.03977
G1 X72.358 Y106.674 E.04087
G1 X72.356 Y79.431 E.97328
G1 X72.382 Y78.592 E.03
G1 X72.531 Y77.125 E.05267
G1 X72.738 Y76.015 E.04034
G1 X72.949 Y75.199 E.03012
G1 X73.276 Y74.201 E.03748
G1 X73.661 Y73.248 E.03675
G1 X74.094 Y72.356 E.03541
G1 X74.739 Y71.246 E.04587
G1 X75.378 Y70.326 E.04001
G1 X76.164 Y69.366 E.04435
G1 X77.205 Y68.305 E.05307
G1 X78.35 Y67.346 E.05336
G1 X79.437 Y66.594 E.04724
G1 X80.401 Y66.041 E.03969
G1 X81.721 Y65.424 E.05206
G1 X82.953 Y64.979 E.04681
G1 X83.924 Y64.711 E.03597
G1 X85.082 Y64.481 E.04219
G1 X86.116 Y64.354 E.03723
G1 X87.44 Y64.293 E.04736
G1 X94.013 Y64.292 E.23481
G1 X95.084 Y64.333 E.0383
G1 X96.149 Y64.457 E.0383
G1 X97.199 Y64.665 E.03825
G1 X98.22 Y64.952 E.03787
G1 X99.184 Y65.309 E.03671
G1 X100.655 Y66.019 E.05836
G1 X101.559 Y66.563 E.03771
G1 X102.405 Y67.168 E.03714
G1 X103.217 Y67.851 E.03791
G1 X103.965 Y68.587 E.03748
G1 X104.667 Y69.396 E.0383
G1 X105.286 Y70.233 E.03717
G1 X105.842 Y71.123 E.0375
G1 X106.338 Y72.073 E.03828
G1 X106.748 Y73.039 E.03752
G1 X107.082 Y74.035 E.03753
G1 X107.335 Y75.044 E.03714
G1 X107.51 Y76.083 E.03765
G1 X107.628 Y77.678 E.05713
G1 X107.64 Y78.391 E.02548
G1 X107.617 Y79.463 E.03832
G1 X107.513 Y80.52 E.03795
G1 X107.331 Y81.544 E.03715
G1 X107.071 Y82.551 E.03717
G1 X106.725 Y83.555 E.03792
G1 X106.304 Y84.528 E.03786
G1 X105.95 Y85.213 E.02756
G1 X105.38 Y86.16 E.0395
G1 X104.751 Y87.038 E.03858
G1 X104.075 Y87.841 E.0375
G1 X103.33 Y88.596 E.03789
G1 X102.55 Y89.273 E.0369
G1 X101.469 Y90.077 E.04811
G1 X101.154 Y90.383 E.01571
G1 X100.887 Y90.723 E.01544
G1 X100.508 Y91.461 E.02965
G1 X100.413 Y91.818 E.01319
G1 X100.324 Y92.481 E.02388
G1 X100.328 Y95.333 E.1019
G1 X100.406 Y95.905 E.02062
G1 X100.43 Y95.979 E.00279
M204 S6000
G1 X99.995 Y96.12 F42000
G1 F3000
M204 S500
G1 X100.175 Y96.671 E.02068
G1 X100.407 Y97.115 E.01792
G1 X100.761 Y97.607 E.02166
G1 X101.555 Y98.425 E.04072
G1 X102.229 Y99.205 E.03682
G1 X102.814 Y99.998 E.03521
G1 X103.33 Y100.823 E.03476
G1 X103.833 Y101.788 E.03888
G1 X104.224 Y102.711 E.03581
G1 X104.55 Y103.685 E.03668
G1 X104.787 Y104.63 E.03481
G1 X104.947 Y105.565 E.03389
G1 X105.069 Y107.159 E.05714
G1 X105.083 Y107.894 E.02626
G1 X105.062 Y108.919 E.03661
G1 X104.954 Y110.003 E.03892
G1 X104.779 Y110.971 E.03513
G1 X104.535 Y111.914 E.03483
G1 X104.206 Y112.874 E.03623
G1 X103.767 Y113.88 E.03923
G1 X103.408 Y114.567 E.02769
G1 X102.864 Y115.46 E.03736
M73 P3 R32
G1 X102.295 Y116.252 E.03483
G1 X101.661 Y117.006 E.0352
G1 X100.92 Y117.759 E.03774
G1 X100.13 Y118.443 E.03733
G1 X99.321 Y119.038 E.03589
G1 X98.513 Y119.544 E.03407
G1 X97.596 Y120.024 E.03696
G1 X96.614 Y120.442 E.03812
G1 X95.672 Y120.757 E.03549
G1 X94.726 Y120.996 E.03487
G1 X93.704 Y121.172 E.03705
G1 X92.692 Y121.265 E.03631
G1 X92.026 Y121.285 E.0238
G1 X87.55 Y121.301 E.15992
G1 X86.66 Y121.276 E.03182
G1 X85.659 Y121.188 E.03588
G1 X84.62 Y121.021 E.03759
G1 X83.482 Y120.751 E.04178
G1 X82.547 Y120.451 E.03507
G1 X81.199 Y119.894 E.05213
G1 X80.002 Y119.262 E.04836
G1 X79.147 Y118.717 E.03621
G1 X78.212 Y118.015 E.04178
G1 X77.36 Y117.266 E.0405
G1 X76.548 Y116.427 E.04172
G1 X75.752 Y115.456 E.04488
G1 X75.05 Y114.438 E.04418
G1 X74.502 Y113.483 E.03932
G1 X74 Y112.426 E.04183
G1 X73.429 Y110.851 E.05984
G1 X73.174 Y109.881 E.03582
G1 X72.981 Y108.85 E.03748
G1 X72.859 Y107.777 E.03859
G1 X72.815 Y106.662 E.03985
G1 X72.814 Y79.44 E.97254
G1 X72.838 Y78.617 E.02942
G1 X72.985 Y77.185 E.05143
G1 X73.186 Y76.11 E.03907
G1 X73.39 Y75.323 E.02903
G1 X73.707 Y74.354 E.03642
G1 X74.077 Y73.438 E.03531
G1 X74.495 Y72.576 E.03423
G1 X75.128 Y71.487 E.04498
G1 X75.747 Y70.598 E.0387
G1 X76.501 Y69.676 E.04256
G1 X77.511 Y68.646 E.05152
G1 X78.622 Y67.714 E.05182
G1 X79.687 Y66.978 E.04623
G1 X80.617 Y66.444 E.03832
G1 X81.902 Y65.845 E.05065
G1 X83.097 Y65.413 E.0454
G1 X84.034 Y65.155 E.03472
G1 X85.159 Y64.932 E.04099
G1 X86.16 Y64.81 E.03601
G1 X87.454 Y64.75 E.04629
G1 X94.007 Y64.749 E.2341
G1 X95.044 Y64.789 E.03707
G1 X96.073 Y64.909 E.03701
G1 X97.098 Y65.112 E.03734
G1 X98.084 Y65.389 E.03658
G1 X99.011 Y65.733 E.03532
G1 X100.431 Y66.419 E.05637
G1 X101.303 Y66.943 E.03634
G1 X102.128 Y67.533 E.03624
G1 X102.913 Y68.193 E.03663
G1 X103.635 Y68.904 E.03619
G1 X104.307 Y69.678 E.03663
G1 X104.911 Y70.495 E.03628
G1 X105.448 Y71.355 E.03622
G1 X105.926 Y72.273 E.03699
G1 X106.322 Y73.207 E.03624
G1 X106.642 Y74.159 E.03587
G1 X106.886 Y75.132 E.03585
G1 X107.057 Y76.144 E.03666
G1 X107.171 Y77.694 E.05554
G1 X107.183 Y78.393 E.02494
G1 X107.16 Y79.441 E.03746
G1 X107.059 Y80.463 E.0367
G1 X106.885 Y81.441 E.0355
G1 X106.631 Y82.425 E.03628
G1 X106.297 Y83.395 E.03665
G1 X105.893 Y84.327 E.03631
G1 X105.548 Y84.993 E.02679
G1 X105 Y85.904 E.03797
G1 X104.387 Y86.762 E.03768
G1 X103.74 Y87.529 E.03582
G1 X103.021 Y88.258 E.03661
G1 X102.259 Y88.919 E.03601
G1 X101.144 Y89.755 E.0498
G1 X100.842 Y90.05 E.01509
G1 X100.535 Y90.431 E.01748
G1 X100.065 Y91.349 E.03685
G1 X99.959 Y91.764 E.01532
G1 X99.867 Y92.49 E.02612
G1 X99.876 Y95.403 E.10406
G1 X99.975 Y96.057 E.02363
G1 X99.977 Y96.063 E.00024
; WIPE_START
G1 X100.175 Y96.671 E-.24272
G1 X100.342 Y96.991 E-.13728
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.217 J-.011 P1  F42000
G1 X100.334 Y97.871 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X100.422 Y97.912 E.00346
G1 X101.215 Y98.731 E.04073
G1 X101.868 Y99.486 E.03567
G1 X102.432 Y100.251 E.03396
G1 X102.936 Y101.055 E.03387
G1 X103.417 Y101.978 E.03719
G1 X103.798 Y102.878 E.03491
G1 X104.112 Y103.818 E.03541
G1 X104.34 Y104.729 E.03356
G1 X104.494 Y105.627 E.03256
G1 X104.613 Y107.185 E.05582
G1 X104.626 Y107.896 E.02541
G1 X104.605 Y108.886 E.03536
G1 X104.501 Y109.934 E.03763
G1 X104.331 Y110.877 E.03424
G1 X104.095 Y111.787 E.03359
G1 X103.781 Y112.703 E.03457
G1 X103.357 Y113.678 E.038
G1 X103.007 Y114.346 E.02691
G1 X102.485 Y115.203 E.03586
G1 X101.93 Y115.975 E.03397
G1 X101.319 Y116.702 E.03395
G1 X100.611 Y117.422 E.03606
G1 X99.849 Y118.082 E.03603
G1 X99.068 Y118.657 E.03464
G1 X98.289 Y119.145 E.03282
G1 X97.405 Y119.608 E.03567
G1 X96.457 Y120.012 E.03682
G1 X95.539 Y120.32 E.0346
G1 X94.626 Y120.55 E.03362
G1 X93.649 Y120.717 E.0354
G1 X92.668 Y120.808 E.0352
G1 X92.017 Y120.828 E.02329
G1 X87.557 Y120.844 E.15931
G1 X86.69 Y120.82 E.031
G1 X85.71 Y120.733 E.03514
G1 X84.714 Y120.573 E.03604
G1 X83.61 Y120.311 E.04054
G1 X82.71 Y120.024 E.03375
G1 X81.399 Y119.482 E.05067
G1 X80.237 Y118.869 E.04696
G1 X79.412 Y118.344 E.03493
G1 X78.504 Y117.663 E.04053
G1 X77.68 Y116.939 E.0392
G1 X76.894 Y116.127 E.04038
G1 X76.121 Y115.186 E.04352
G1 X75.434 Y114.189 E.04324
G1 X74.904 Y113.266 E.03801
G1 X74.425 Y112.255 E.03998
G1 X73.868 Y110.72 E.05834
G1 X73.619 Y109.776 E.03488
G1 X73.435 Y108.787 E.03595
G1 X73.316 Y107.747 E.03739
G1 X73.272 Y106.65 E.03922
G1 X73.271 Y79.445 E.97194
G1 X73.295 Y78.642 E.02869
G1 X73.439 Y77.244 E.05019
G1 X73.634 Y76.204 E.0378
G1 X73.83 Y75.447 E.02795
G1 X74.135 Y74.515 E.03503
G1 X74.493 Y73.627 E.0342
G1 X74.902 Y72.786 E.03341
G1 X75.511 Y71.738 E.04332
G1 X76.115 Y70.869 E.03779
G1 X76.846 Y69.977 E.04122
G1 X77.827 Y68.978 E.05
G1 X78.895 Y68.082 E.0498
G1 X79.926 Y67.368 E.0448
G1 X80.833 Y66.848 E.03735
G1 X82.071 Y66.27 E.0488
G1 X83.23 Y65.851 E.04405
G1 X84.134 Y65.602 E.0335
G1 X85.227 Y65.385 E.03979
G1 X86.193 Y65.266 E.03477
G1 X87.468 Y65.207 E.0456
G1 X88.104 Y65.207 E.02271
G1 X88.208 Y65.255 E.00409
G1 X88.239 Y65.365 E.00409
G1 X88.177 Y65.46 E.00409
G1 X88.109 Y65.481 E.00252
G1 X86.936 Y65.527 E.04195
G1 X85.341 Y65.852 E.05815
G1 X83.84 Y66.469 E.05798
G1 X82.39 Y67.422 E.06196
G1 X81.647 Y68.103 E.03601
G1 X81.104 Y68.717 E.02928
G1 X80.624 Y69.385 E.0294
G1 X80.239 Y70.035 E.027
G1 X79.878 Y70.804 E.03035
G1 X79.554 Y71.738 E.03529
G1 X79.35 Y72.636 E.03292
G1 X79.243 Y73.574 E.03372
G1 X79.246 Y74.589 E.03627
G1 X79.498 Y76.177 E.05743
G1 X80.167 Y77.978 E.06865
G1 X81.007 Y79.33 E.05685
G1 X81.692 Y80.118 E.03731
G1 X81.914 Y80.33 E.01098
G1 X81.957 Y80.429 E.00386
G1 X81.98 Y106.941 E.94715
G1 X82.26 Y108.406 E.0533
G1 X82.553 Y109.127 E.02779
G1 X82.952 Y109.795 E.02781
G1 X83.574 Y110.535 E.03452
G1 X84.359 Y111.188 E.0365
G1 X85.279 Y111.692 E.03745
G1 X86.243 Y112.002 E.0362
G1 X87.372 Y112.152 E.04069
G1 X92.026 Y112.145 E.16626
G1 X92.952 Y112.006 E.03346
G1 X93.722 Y111.723 E.02931
G1 X94.146 Y111.475 E.01756
G1 X94.55 Y111.159 E.0183
G1 X95.013 Y110.675 E.02394
G1 X95.52 Y109.886 E.03352
G1 X95.828 Y109.026 E.03262
G1 X95.921 Y108.373 E.02357
G1 X95.916 Y107.57 E.02868
G1 X95.973 Y107.458 E.00452
G1 X96.879 Y106.813 E.0397
G1 X98.068 Y105.634 E.05983
G1 X99.075 Y104.185 E.06305
G1 X99.791 Y102.608 E.06188
G1 X100.171 Y101.135 E.05432
G1 X100.307 Y99.686 E.05201
G1 X100.187 Y98.018 E.05976
G1 X100.227 Y97.911 E.00409
G1 X100.278 Y97.892 E.00194
; WIPE_START
G1 X100.422 Y97.912 E-.0553
G1 X101.017 Y98.526 E-.3247
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.133 J-.443 P1  F42000
G1 X100.776 Y99.142 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X100.884 Y99.104 E.00409
G1 X100.975 Y99.151 E.00365
G1 X101.514 Y99.776 E.02949
G1 X102.057 Y100.513 E.03271
G1 X102.541 Y101.287 E.03261
G1 X103.001 Y102.168 E.03551
G1 X103.368 Y103.034 E.03361
G1 X103.671 Y103.941 E.03415
G1 X103.891 Y104.818 E.03231
G1 X104.04 Y105.69 E.03159
G1 X104.156 Y107.211 E.05449
G1 X104.169 Y107.898 E.02458
G1 X104.149 Y108.853 E.03411
G1 X104.047 Y109.876 E.03673
G1 X103.886 Y110.774 E.03259
G1 X103.658 Y111.651 E.03235
G1 X103.356 Y112.532 E.03329
G1 X102.942 Y113.485 E.03714
G1 X102.607 Y114.124 E.02577
G1 X102.107 Y114.946 E.03436
G1 X101.573 Y115.69 E.03273
G1 X100.984 Y116.39 E.03268
G1 X100.302 Y117.084 E.03476
G1 X99.567 Y117.721 E.03473
G1 X98.815 Y118.276 E.03339
G1 X98.057 Y118.75 E.03195
G1 X97.204 Y119.197 E.0344
G1 X96.29 Y119.586 E.03551
G1 X95.415 Y119.879 E.03296
G1 X94.537 Y120.101 E.03236
G1 X93.595 Y120.263 E.03414
G1 X92.636 Y120.352 E.03441
G1 X92.007 Y120.371 E.02247
G1 X87.565 Y120.387 E.1587
G1 X86.712 Y120.363 E.03046
G1 X85.762 Y120.279 E.03409
G1 X84.808 Y120.126 E.0345
G1 X83.738 Y119.872 E.03931
G1 X82.862 Y119.592 E.03284
G1 X81.588 Y119.065 E.04926
G1 X80.462 Y118.47 E.0455
G1 X79.668 Y117.965 E.03362
G1 X78.789 Y117.305 E.03927
G1 X77.992 Y116.604 E.03792
G1 X77.239 Y115.827 E.03866
G1 X76.49 Y114.915 E.04215
G1 X75.818 Y113.94 E.04229
G1 X75.308 Y113.049 E.03668
G1 X74.85 Y112.085 E.03814
G1 X74.307 Y110.589 E.05684
G1 X74.067 Y109.681 E.03358
G1 X73.886 Y108.714 E.03513
G1 X73.773 Y107.717 E.03585
G1 X73.729 Y106.638 E.03857
G1 X73.728 Y79.454 E.97119
G1 X73.752 Y78.668 E.02811
G1 X73.891 Y77.316 E.04855
G1 X74.079 Y76.309 E.0366
G1 X74.27 Y75.572 E.0272
G1 X74.567 Y74.668 E.03397
G1 X74.909 Y73.817 E.03277
G1 X75.303 Y73.006 E.03222
G1 X75.9 Y71.979 E.04243
G1 X76.484 Y71.141 E.03648
G1 X77.183 Y70.287 E.03943
G1 X78.142 Y69.309 E.04894
G1 X79.168 Y68.45 E.04778
G1 X80.165 Y67.758 E.04338
G1 X81.049 Y67.252 E.03639
G1 X81.992 Y66.811 E.03719
G1 X82.107 Y66.811 E.00409
G1 X82.182 Y66.897 E.00409
G1 X82.135 Y67.044 E.00551
G1 X81.344 Y67.761 E.03816
G1 X80.766 Y68.409 E.031
G1 X80.256 Y69.114 E.03107
G1 X79.822 Y69.847 E.03044
G1 X79.444 Y70.661 E.03207
G1 X79.107 Y71.644 E.03712
G1 X78.896 Y72.591 E.03469
G1 X78.786 Y73.582 E.03562
G1 X78.796 Y74.671 E.0389
G1 X79.045 Y76.236 E.05659
G1 X79.734 Y78.125 E.07185
G1 X80.614 Y79.562 E.0602
G1 X81.459 Y80.528 E.04585
G1 X81.5 Y80.626 E.00379
G1 X81.523 Y106.929 E.9397
G1 X81.809 Y108.479 E.05632
G1 X82.166 Y109.37 E.03428
G1 X82.609 Y110.097 E.03042
G1 X83.217 Y110.82 E.03373
G1 X84.058 Y111.531 E.03938
G1 X85.049 Y112.087 E.04057
G1 X86.093 Y112.434 E.0393
G1 X87.382 Y112.609 E.0465
G1 X92.017 Y112.602 E.16558
G1 X93.006 Y112.46 E.0357
G1 X93.963 Y112.111 E.03638
G1 X94.434 Y111.83 E.01959
G1 X94.886 Y111.469 E.02066
G1 X95.404 Y110.912 E.02719
G1 X95.9 Y110.139 E.0328
G1 X95.952 Y110.033 E.00422
G1 X96.282 Y109.078 E.03611
G1 X96.373 Y108.447 E.02276
G1 X96.375 Y107.803 E.023
G1 X96.431 Y107.693 E.00444
G1 X97.208 Y107.13 E.03426
G1 X98.381 Y105.968 E.05901
G1 X99.497 Y104.362 E.06985
G1 X100.202 Y102.807 E.06102
G1 X100.611 Y101.26 E.05718
G1 X100.761 Y99.739 E.0546
G1 X100.734 Y99.249 E.01754
G1 X100.754 Y99.198 E.00194
; WIPE_START
G1 X100.884 Y99.104 E-.06084
G1 X100.975 Y99.151 E-.03884
G1 X101.457 Y99.71 E-.28032
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.136 J-.436 P1  F42000
G1 X101.208 Y100.356 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X101.321 Y100.336 E.00409
G1 X101.397 Y100.387 E.00326
G1 X101.682 Y100.775 E.01718
G1 X102.147 Y101.519 E.03135
G1 X102.589 Y102.368 E.03422
G1 X102.942 Y103.201 E.03231
G1 X103.23 Y104.064 E.0325
G1 X103.442 Y104.908 E.03107
G1 X103.586 Y105.752 E.03061
G1 X103.699 Y107.236 E.05317
G1 X103.712 Y107.901 E.02374
G1 X103.692 Y108.831 E.03325
G1 X103.593 Y109.818 E.03545
G1 X103.437 Y110.681 E.03132
G1 X103.221 Y111.514 E.03074
G1 X102.928 Y112.372 E.03239
G1 X102.527 Y113.292 E.03587
G1 X102.207 Y113.903 E.02463
G1 X101.728 Y114.689 E.03287
G1 X101.208 Y115.413 E.03186
G1 X100.642 Y116.087 E.03143
G1 X99.993 Y116.747 E.03308
G1 X99.286 Y117.36 E.03344
G1 X98.562 Y117.894 E.03214
G1 X97.834 Y118.351 E.0307
G1 X97.013 Y118.781 E.03311
G1 X96.132 Y119.156 E.0342
G1 X95.291 Y119.438 E.0317
G1 X94.437 Y119.654 E.03148
G1 X93.54 Y119.808 E.03251
G1 X92.603 Y119.896 E.03361
G1 X91.998 Y119.914 E.02164
G1 X87.573 Y119.929 E.15809
G1 X86.735 Y119.906 E.02994
G1 X85.814 Y119.824 E.03304
G1 X84.902 Y119.678 E.03297
G1 X83.865 Y119.432 E.03808
G1 X83.014 Y119.16 E.03193
G1 X81.788 Y118.653 E.04739
G1 X80.697 Y118.078 E.04409
G1 X79.924 Y117.585 E.03272
G1 X79.082 Y116.953 E.03764
G1 X78.311 Y116.276 E.03662
G1 X77.577 Y115.518 E.03773
G1 X76.852 Y114.635 E.0408
G1 X76.209 Y113.701 E.04052
G1 X75.716 Y112.842 E.03538
G1 X75.27 Y111.902 E.03715
G1 X74.742 Y110.447 E.05533
G1 X74.512 Y109.575 E.03219
G1 X74.338 Y108.641 E.03394
G1 X74.229 Y107.677 E.03468
G1 X74.187 Y106.626 E.03756
G1 X74.185 Y79.463 E.97044
G1 X74.209 Y78.693 E.02752
G1 X74.343 Y77.387 E.04692
G1 X74.527 Y76.403 E.03573
G1 X74.71 Y75.696 E.0261
G1 X74.998 Y74.821 E.03293
G1 X75.326 Y74.007 E.03134
G1 X75.705 Y73.225 E.03104
G1 X76.289 Y72.22 E.04154
G1 X76.852 Y71.413 E.03517
G1 X77.52 Y70.597 E.03765
G1 X78.448 Y69.65 E.04739
G1 X79.44 Y68.818 E.04625
G1 X79.716 Y68.626 E.012
G1 X79.829 Y68.606 E.00409
G1 X79.917 Y68.678 E.00409
G1 X79.905 Y68.819 E.00505
G1 X79.432 Y69.609 E.03288
G1 X79.032 Y70.462 E.03367
G1 X78.659 Y71.552 E.04115
G1 X78.44 Y72.549 E.03646
G1 X78.333 Y73.525 E.03508
G1 X78.339 Y74.665 E.04075
G1 X78.62 Y76.404 E.06295
G1 X79.3 Y78.269 E.07091
G1 X80.218 Y79.792 E.06352
G1 X81.01 Y80.709 E.04328
G1 X81.043 Y80.798 E.00341
G1 X81.066 Y106.916 E.9331
G1 X81.39 Y108.662 E.06342
G1 X81.738 Y109.53 E.03341
G1 X82.214 Y110.326 E.03314
G1 X82.93 Y111.176 E.03969
G1 X83.845 Y111.936 E.04252
G1 X84.814 Y112.479 E.03968
G1 X85.937 Y112.863 E.04241
G1 X87.393 Y113.066 E.0525
G1 X92.008 Y113.059 E.16487
G1 X93.176 Y112.885 E.0422
G1 X94.108 Y112.545 E.03546
G1 X94.661 Y112.226 E.02278
G1 X95.227 Y111.773 E.02589
G1 X95.795 Y111.149 E.03016
G1 X96.281 Y110.391 E.03217
G1 X96.359 Y110.241 E.00604
G1 X96.71 Y109.238 E.03797
G1 X96.824 Y108.52 E.02599
G1 X96.831 Y108.036 E.01729
G1 X96.887 Y107.927 E.00435
G1 X97.537 Y107.448 E.02885
G1 X98.694 Y106.302 E.0582
G1 X99.918 Y104.54 E.07663
G1 X100.647 Y102.913 E.06371
G1 X101.05 Y101.386 E.05641
G1 X101.15 Y100.454 E.03349
G1 X101.178 Y100.407 E.00194
; WIPE_START
G1 X101.321 Y100.336 E-.06084
G1 X101.397 Y100.387 E-.03469
G1 X101.682 Y100.775 E-.18279
G1 X101.823 Y101.002 E-.10168
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.083 J-.555 P1  F42000
G1 X101.516 Y101.602 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X101.63 Y101.6 E.00409
G1 X101.696 Y101.661 E.00322
G1 X102.172 Y102.558 E.03627
G1 X102.516 Y103.368 E.03145
G1 X102.793 Y104.198 E.03123
G1 X102.993 Y104.997 E.02944
G1 X103.131 Y105.802 E.02918
G1 X103.242 Y107.254 E.05203
G1 X103.254 Y107.903 E.02318
G1 X103.235 Y108.809 E.03237
G1 X103.139 Y109.76 E.03417
G1 X102.989 Y110.588 E.03004
G1 X102.785 Y111.377 E.02914
G1 X102.499 Y112.211 E.0315
G1 X102.112 Y113.099 E.0346
G1 X101.806 Y113.681 E.0235
G1 X101.344 Y114.441 E.03176
G1 X100.844 Y115.137 E.03062
G1 X100.307 Y115.775 E.0298
G1 X99.683 Y116.41 E.03179
G1 X98.996 Y117.006 E.03253
G1 X98.309 Y117.513 E.0305
G1 X97.611 Y117.951 E.02944
G1 X96.812 Y118.37 E.03221
G1 X95.965 Y118.73 E.0329
G1 X95.157 Y119.001 E.03043
G1 X94.337 Y119.208 E.03023
G1 X93.474 Y119.356 E.03125
G1 X92.579 Y119.439 E.03212
G1 X91.988 Y119.457 E.02113
G1 X87.58 Y119.472 E.15747
G1 X86.757 Y119.449 E.02941
G1 X85.875 Y119.371 E.03165
G1 X84.996 Y119.23 E.03179
G1 X83.993 Y118.993 E.03683
G1 X83.176 Y118.732 E.03061
G1 X81.989 Y118.241 E.04592
G1 X80.921 Y117.679 E.04309
G1 X80.18 Y117.206 E.0314
G1 X79.374 Y116.601 E.03601
G1 X78.631 Y115.949 E.03532
G1 X77.914 Y115.209 E.0368
G1 X77.214 Y114.355 E.03944
G1 X76.593 Y113.452 E.03916
G1 X76.119 Y112.625 E.03406
G1 X75.69 Y111.72 E.03578
G1 X75.181 Y110.316 E.05337
G1 X74.957 Y109.47 E.03125
G1 X74.79 Y108.569 E.03274
G1 X74.685 Y107.647 E.03315
G1 X74.644 Y106.62 E.03673
G1 X74.642 Y79.473 E.96986
G1 X74.666 Y78.719 E.02694
G1 X74.795 Y77.458 E.04529
G1 X74.974 Y76.498 E.03487
G1 X75.15 Y75.821 E.02501
G1 X75.426 Y74.982 E.03155
G1 X75.746 Y74.188 E.03057
G1 X76.111 Y73.436 E.02989
G1 X76.672 Y72.471 E.03986
G1 X77.214 Y71.693 E.03387
G1 X77.856 Y70.907 E.03626
G1 X78.263 Y70.492 E.02078
G1 X78.37 Y70.451 E.00409
G1 X78.471 Y70.505 E.00409
G1 X78.491 Y70.632 E.00459
G1 X78.229 Y71.396 E.02886
G1 X77.995 Y72.444 E.03834
G1 X77.876 Y73.534 E.0392
G1 X77.889 Y74.748 E.04337
G1 X78.167 Y76.465 E.06211
G1 X78.915 Y78.517 E.07804
G1 X79.821 Y80.018 E.06265
G1 X80.554 Y80.88 E.0404
G1 X80.586 Y80.968 E.00338
G1 X80.609 Y106.904 E.92658
G1 X80.97 Y108.844 E.0705
G1 X81.35 Y109.773 E.03584
G1 X81.871 Y110.629 E.03578
G1 X82.646 Y111.534 E.0426
G1 X83.632 Y112.34 E.04549
G1 X84.677 Y112.916 E.04262
G1 X85.886 Y113.318 E.04554
G1 X87.403 Y113.523 E.05467
G1 X91.998 Y113.516 E.16417
G1 X93.346 Y113.31 E.0487
G1 X94.255 Y112.978 E.03458
G1 X94.881 Y112.627 E.02563
G1 X95.571 Y112.073 E.03163
G1 X96.185 Y111.387 E.0329
G1 X96.662 Y110.644 E.03153
G1 X96.793 Y110.384 E.0104
G1 X97.164 Y109.298 E.04102
G1 X97.274 Y108.599 E.02526
G1 X97.285 Y108.267 E.01189
G1 X97.339 Y108.161 E.00423
G1 X97.865 Y107.766 E.02349
G1 X99.007 Y106.635 E.05743
G1 X100.286 Y104.811 E.07959
G1 X101.06 Y103.109 E.06678
G1 X101.443 Y101.69 E.05252
G1 X101.478 Y101.648 E.00194
; WIPE_START
G1 X101.63 Y101.6 E-.06085
G1 X101.696 Y101.661 E-.0342
G1 X102.048 Y102.323 E-.28495
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.98 J-.722 P1  F42000
G1 X101.652 Y102.861 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X101.766 Y102.862 E.00409
G1 X101.835 Y102.933 E.00352
G1 X102.086 Y103.525 E.02299
G1 X102.355 Y104.331 E.03035
G1 X102.545 Y105.086 E.02782
G1 X102.676 Y105.852 E.02775
G1 X102.785 Y107.272 E.05088
G1 X102.797 Y107.905 E.02262
G1 X102.777 Y108.786 E.0315
G1 X102.685 Y109.702 E.03289
G1 X102.541 Y110.494 E.02876
G1 X102.348 Y111.241 E.02754
G1 X102.07 Y112.051 E.0306
G1 X101.698 Y112.906 E.03332
G1 X101.406 Y113.46 E.02236
G1 X100.96 Y114.192 E.03064
G1 X100.486 Y114.851 E.02901
G1 X99.972 Y115.463 E.02854
G1 X99.374 Y116.072 E.0305
G1 X98.705 Y116.652 E.03162
G1 X98.047 Y117.138 E.02924
G1 X97.387 Y117.552 E.02782
G1 X96.621 Y117.954 E.03091
G1 X95.808 Y118.301 E.03159
G1 X95.033 Y118.56 E.02917
G1 X94.237 Y118.761 E.02935
G1 X93.409 Y118.903 E.02999
G1 X92.555 Y118.982 E.03065
G1 X91.978 Y119 E.02062
G1 X87.588 Y119.015 E.15685
G1 X86.788 Y118.993 E.02859
G1 X85.936 Y118.917 E.03055
G1 X85.09 Y118.782 E.03062
G1 X84.12 Y118.553 E.0356
G1 X83.339 Y118.304 E.02929
G1 X82.189 Y117.83 E.04445
G1 X81.147 Y117.28 E.04208
G1 X80.437 Y116.827 E.03009
G1 X79.667 Y116.249 E.0344
G1 X78.951 Y115.621 E.03403
G1 X78.252 Y114.9 E.03587
G1 X77.577 Y114.075 E.03808
G1 X76.977 Y113.204 E.03779
G1 X76.522 Y112.408 E.03274
G1 X76.11 Y111.538 E.0344
G1 X75.619 Y110.185 E.05142
G1 X75.403 Y109.365 E.03031
G1 X75.242 Y108.497 E.03154
G1 X75.142 Y107.617 E.03163
G1 X75.101 Y106.613 E.03588
G1 X75.099 Y79.482 E.96929
G1 X75.122 Y78.754 E.02602
G1 X75.247 Y77.529 E.04401
G1 X75.42 Y76.603 E.03365
G1 X75.59 Y75.946 E.02425
G1 X75.857 Y75.134 E.03051
G1 X76.166 Y74.369 E.02948
G1 X76.513 Y73.655 E.02837
G1 X77.055 Y72.722 E.03856
G1 X77.282 Y72.395 E.01422
G1 X77.381 Y72.337 E.00409
G1 X77.489 Y72.374 E.00409
G1 X77.531 Y72.488 E.00436
G1 X77.422 Y73.476 E.03551
G1 X77.44 Y74.831 E.04839
G1 X77.742 Y76.633 E.06528
G1 X78.531 Y78.764 E.08119
G1 X79.424 Y80.245 E.06181
G1 X80.098 Y81.049 E.03745
G1 X80.13 Y81.137 E.00334
G1 X80.152 Y106.892 E.92013
G1 X80.553 Y109.03 E.07771
G1 X80.965 Y110.019 E.03827
M73 P4 R32
G1 X81.53 Y110.933 E.03842
G1 X82.366 Y111.895 E.04551
G1 X83.422 Y112.746 E.04846
G1 X84.544 Y113.353 E.04559
G1 X85.73 Y113.748 E.04466
G1 X87.413 Y113.98 E.0607
G1 X91.988 Y113.973 E.16345
G1 X93.515 Y113.734 E.0552
G1 X94.401 Y113.411 E.03371
G1 X95.175 Y112.977 E.03169
G1 X95.919 Y112.37 E.03432
G1 X96.519 Y111.699 E.03214
G1 X97.043 Y110.897 E.03423
G1 X97.229 Y110.523 E.01492
G1 X97.593 Y109.456 E.0403
G1 X97.724 Y108.676 E.02824
G1 X97.735 Y108.497 E.00642
G1 X97.788 Y108.396 E.00408
G1 X98.193 Y108.085 E.01823
G1 X99.32 Y106.968 E.0567
G1 X100.654 Y105.083 E.08248
G1 X101.472 Y103.307 E.06988
G1 X101.577 Y102.948 E.01337
G1 X101.613 Y102.907 E.00194
; WIPE_START
G1 X101.766 Y102.862 E-.06085
G1 X101.835 Y102.933 E-.03748
G1 X102.086 Y103.525 E-.24451
G1 X102.117 Y103.618 E-.03716
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.889 J-.831 P1  F42000
G1 X101.661 Y104.106 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X101.774 Y104.124 E.00409
G1 X101.827 Y104.195 E.00317
G1 X101.917 Y104.464 E.01015
G1 X102.096 Y105.176 E.02621
G1 X102.221 Y105.902 E.02632
G1 X102.328 Y107.289 E.04973
G1 X102.34 Y107.907 E.02206
G1 X102.32 Y108.763 E.03061
G1 X102.231 Y109.644 E.03161
G1 X102.096 Y110.391 E.02712
G1 X101.911 Y111.104 E.02631
G1 X101.642 Y111.89 E.0297
G1 X101.283 Y112.712 E.03204
G1 X101.006 Y113.238 E.02122
G1 X100.581 Y113.935 E.02916
G1 X100.128 Y114.566 E.02778
G1 X99.629 Y115.159 E.02767
G1 X99.056 Y115.743 E.02921
G1 X98.415 Y116.299 E.03032
G1 X97.793 Y116.757 E.0276
G1 X97.164 Y117.153 E.02657
G1 X96.42 Y117.543 E.03001
G1 X95.65 Y117.871 E.02989
G1 X94.9 Y118.123 E.02828
G1 X94.137 Y118.314 E.02809
G1 X93.355 Y118.448 E.02836
G1 X92.523 Y118.526 E.02986
G1 X91.969 Y118.543 E.0198
G1 X87.596 Y118.558 E.15623
G1 X86.819 Y118.536 E.02776
G1 X85.997 Y118.464 E.02947
G1 X85.184 Y118.334 E.02944
G1 X84.237 Y118.111 E.03474
G1 X83.491 Y117.872 E.028
G1 X82.377 Y117.412 E.04304
G1 X81.372 Y116.882 E.04061
G1 X80.693 Y116.448 E.02877
G1 X79.951 Y115.891 E.03316
G1 X79.262 Y115.286 E.03275
G1 X78.598 Y114.6 E.03412
G1 X77.946 Y113.805 E.03672
G1 X77.362 Y112.955 E.03684
G1 X76.925 Y112.192 E.03142
G1 X76.535 Y111.368 E.03257
G1 X76.058 Y110.054 E.04993
G1 X75.848 Y109.259 E.02937
G1 X75.693 Y108.424 E.03034
G1 X75.598 Y107.587 E.03012
G1 X75.558 Y106.607 E.03504
G1 X75.556 Y79.492 E.96872
G1 X75.579 Y78.78 E.02543
G1 X75.7 Y77.6 E.04239
G1 X75.867 Y76.697 E.03278
G1 X76.031 Y76.07 E.02314
G1 X76.285 Y75.296 E.02913
G1 X76.582 Y74.559 E.02838
G1 X76.716 Y74.283 E.01095
G1 X76.804 Y74.211 E.00409
G1 X76.917 Y74.23 E.00409
G1 X76.976 Y74.342 E.00451
G1 X76.982 Y74.826 E.0173
G1 X77.317 Y76.804 E.07166
G1 X78.098 Y78.911 E.08028
G1 X79.028 Y80.473 E.06496
G1 X79.641 Y81.216 E.03442
G1 X79.673 Y81.303 E.00331
G1 X79.695 Y106.88 E.91376
G1 X80.101 Y109.101 E.08066
G1 X80.54 Y110.185 E.04179
G1 X81.192 Y111.242 E.04437
G1 X82.013 Y112.186 E.04469
G1 X83.126 Y113.095 E.05133
G1 X84.317 Y113.75 E.04857
G1 X85.575 Y114.177 E.04745
G1 X87.424 Y114.437 E.06671
G1 X91.978 Y114.43 E.16272
G1 X93.684 Y114.159 E.0617
G1 X94.548 Y113.844 E.03286
G1 X95.389 Y113.381 E.0343
G1 X96.201 Y112.73 E.03716
G1 X96.854 Y112.011 E.03471
G1 X97.421 Y111.154 E.03674
G1 X97.664 Y110.662 E.01958
G1 X98.022 Y109.613 E.0396
G1 X98.179 Y108.717 E.0325
G1 X98.229 Y108.633 E.0035
G1 X98.519 Y108.404 E.0132
G1 X99.7 Y107.222 E.05968
G1 X101.02 Y105.357 E.08163
G1 X101.573 Y104.18 E.04649
G1 X101.615 Y104.145 E.00194
; WIPE_START
G1 X101.774 Y104.124 E-.06085
G1 X101.827 Y104.195 E-.03371
G1 X101.917 Y104.464 E-.10795
G1 X102.031 Y104.917 E-.17749
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.91 J-.808 P1  F42000
G1 X101.551 Y105.458 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X101.659 Y105.495 E.00409
G1 X101.7 Y105.571 E.00308
G1 X101.767 Y105.965 E.01427
G1 X101.872 Y107.316 E.0484
G1 X101.883 Y107.909 E.02119
G1 X101.864 Y108.73 E.02935
G1 X101.779 Y109.575 E.03033
G1 X101.65 Y110.288 E.02589
G1 X101.471 Y110.977 E.02545
G1 X101.213 Y111.73 E.02842
G1 X100.873 Y112.51 E.0304
G1 X100.606 Y113.016 E.02044
G1 X100.203 Y113.678 E.0277
G1 X99.769 Y114.281 E.02654
G1 X99.287 Y114.856 E.02679
G1 X98.747 Y115.405 E.02753
G1 X98.133 Y115.938 E.02902
G1 X97.54 Y116.376 E.02636
G1 X96.931 Y116.759 E.0257
G1 X96.229 Y117.127 E.02832
G1 X95.492 Y117.441 E.0286
G1 X94.766 Y117.685 E.02738
G1 X94.037 Y117.868 E.02683
G1 X93.3 Y117.994 E.02673
G1 X92.49 Y118.07 E.02906
G1 X91.959 Y118.086 E.01897
G1 X87.604 Y118.101 E.15561
G1 X86.85 Y118.08 E.02694
G1 X86.058 Y118.01 E.02838
G1 X85.277 Y117.886 E.02826
G1 X84.365 Y117.671 E.0335
G1 X83.642 Y117.441 E.02708
G1 X82.566 Y116.995 E.04163
G1 X81.597 Y116.483 E.03914
G1 X80.95 Y116.069 E.02745
G1 X80.244 Y115.539 E.03155
G1 X79.574 Y114.95 E.03186
G1 X78.943 Y114.299 E.03238
G1 X78.315 Y113.535 E.03534
G1 X77.752 Y112.717 E.03548
G1 X77.328 Y111.976 E.0305
G1 X76.955 Y111.186 E.03121
G1 X76.497 Y109.923 E.04798
G1 X76.296 Y109.164 E.02805
G1 X76.145 Y108.352 E.0295
G1 X76.055 Y107.556 E.02861
G1 X76.015 Y106.595 E.03439
G1 X76.013 Y79.497 E.9681
G1 X76.036 Y78.806 E.02469
G1 X76.152 Y77.67 E.04078
G1 X76.313 Y76.802 E.03157
G1 X76.48 Y76.167 E.02345
G1 X76.553 Y76.079 E.00409
G1 X76.667 Y76.076 E.00409
G1 X76.748 Y76.179 E.00467
G1 X76.865 Y76.867 E.02494
G1 X77.711 Y79.155 E.08717
G1 X78.63 Y80.698 E.06415
G1 X79.185 Y81.381 E.03144
G1 X79.216 Y81.468 E.00327
G1 X79.238 Y106.868 E.90746
G1 X79.649 Y109.17 E.08354
G1 X80.112 Y110.347 E.04517
G1 X80.798 Y111.473 E.04712
G1 X81.661 Y112.477 E.04729
G1 X82.828 Y113.441 E.05407
G1 X84.087 Y114.145 E.05154
G1 X85.416 Y114.606 E.05024
G1 X87.434 Y114.894 E.07284
G1 X91.969 Y114.887 E.162
G1 X93.744 Y114.613 E.06417
G1 X94.696 Y114.276 E.03608
G1 X95.6 Y113.786 E.03674
G1 X96.479 Y113.093 E.03999
G1 X97.186 Y112.325 E.03729
G1 X97.798 Y111.412 E.03928
G1 X98.07 Y110.872 E.02161
G1 X98.451 Y109.77 E.04167
G1 X98.599 Y108.967 E.02917
G1 X98.648 Y108.885 E.00338
G1 X98.848 Y108.723 E.00921
G1 X100.079 Y107.478 E.06257
G1 X101.453 Y105.516 E.08556
G1 X101.5 Y105.488 E.00194
; WIPE_START
G1 X101.659 Y105.495 E-.06084
G1 X101.7 Y105.571 E-.03274
G1 X101.767 Y105.965 E-.15182
G1 X101.795 Y106.318 E-.1346
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.702 J-.994 P1  F42000
G1 X101.227 Y106.719 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X101.335 Y106.757 E.00409
G1 X101.377 Y106.845 E.00348
G1 X101.415 Y107.341 E.0178
G1 X101.425 Y107.91 E.02033
G1 X101.407 Y108.697 E.02809
G1 X101.327 Y109.506 E.02905
G1 X101.204 Y110.184 E.02464
G1 X101.032 Y110.851 E.02459
G1 X100.788 Y111.559 E.02675
G1 X100.463 Y112.307 E.02915
G1 X100.211 Y112.786 E.01935
G1 X99.824 Y113.421 E.02655
G1 X99.405 Y114.005 E.02567
G1 X98.945 Y114.552 E.02554
G1 X98.438 Y115.068 E.02586
G1 X97.852 Y115.577 E.02773
G1 X97.286 Y115.995 E.02511
G1 X96.698 Y116.365 E.02483
G1 X96.037 Y116.711 E.02665
G1 X95.335 Y117.012 E.02729
G1 X94.632 Y117.247 E.02648
G1 X93.938 Y117.421 E.02557
G1 X93.245 Y117.54 E.02511
G1 X92.454 Y117.613 E.02839
G1 X87.612 Y117.644 E.17299
G1 X86.88 Y117.623 E.02614
G1 X86.119 Y117.557 E.0273
G1 X85.37 Y117.438 E.02707
G1 X84.492 Y117.232 E.03224
G1 X83.794 Y117.009 E.02616
G1 X82.755 Y116.578 E.04021
G1 X81.823 Y116.085 E.03767
G1 X81.207 Y115.69 E.02613
G1 X80.536 Y115.187 E.02995
G1 X79.893 Y114.623 E.03056
G1 X79.288 Y113.999 E.03105
G1 X78.685 Y113.264 E.03398
G1 X78.143 Y112.478 E.03412
G1 X77.732 Y111.759 E.02957
G1 X77.376 Y111.004 E.02984
G1 X76.936 Y109.792 E.04605
G1 X76.743 Y109.069 E.02673
G1 X76.598 Y108.289 E.02832
G1 X76.511 Y107.526 E.02745
G1 X76.472 Y106.588 E.03354
G1 X76.47 Y79.506 E.96753
G1 X76.492 Y78.832 E.0241
G1 X76.565 Y78.124 E.02543
G1 X76.623 Y78.025 E.00409
G1 X76.735 Y78.005 E.00409
G1 X76.83 Y78.09 E.00454
G1 X77.279 Y79.303 E.04618
G1 X78.233 Y80.924 E.06722
G1 X78.729 Y81.545 E.02837
G1 X78.759 Y81.63 E.00324
G1 X78.781 Y106.857 E.90125
G1 X79.197 Y109.238 E.08634
G1 X79.728 Y110.594 E.05206
G1 X80.459 Y111.779 E.04973
G1 X81.307 Y112.767 E.0465
G1 X82.528 Y113.786 E.05683
G1 X83.855 Y114.538 E.05449
G1 X85.254 Y115.034 E.05303
G1 X87.445 Y115.352 E.07909
G1 X91.959 Y115.344 E.16128
G1 X93.802 Y115.066 E.06657
G1 X94.839 Y114.711 E.03917
G1 X95.808 Y114.193 E.03925
G1 X96.754 Y113.458 E.04279
G1 X97.515 Y112.642 E.03989
G1 X98.173 Y111.673 E.04183
G1 X98.475 Y111.085 E.0236
G1 X98.88 Y109.928 E.04381
G1 X99.019 Y109.214 E.02599
G1 X99.056 Y109.143 E.00287
G1 X100.397 Y107.807 E.06762
G1 X101.128 Y106.776 E.04515
G1 X101.175 Y106.749 E.00194
; WIPE_START
G1 X101.335 Y106.757 E-.06084
G1 X101.377 Y106.845 E-.037
G1 X101.415 Y107.341 E-.1893
G1 X101.419 Y107.586 E-.09285
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.787 J-.929 P1  F42000
G1 X100.835 Y108.081 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X100.935 Y108.137 E.00409
G1 X100.961 Y108.221 E.00316
G1 X100.95 Y108.674 E.01618
G1 X100.874 Y109.437 E.0274
G1 X100.756 Y110.091 E.02376
G1 X100.592 Y110.724 E.02335
G1 X100.364 Y111.388 E.02507
G1 X100.052 Y112.104 E.02792
G1 X99.81 Y112.565 E.01857
G1 X99.445 Y113.164 E.02508
G1 X99.047 Y113.72 E.02442
G1 X98.61 Y114.24 E.02428
G1 X98.128 Y114.731 E.02458
G1 X97.561 Y115.224 E.02683
G1 X97.033 Y115.614 E.02347
G1 X96.465 Y115.971 E.02396
G1 X95.836 Y116.3 E.02537
G1 X95.177 Y116.582 E.0256
G1 X94.509 Y116.806 E.02518
G1 X93.849 Y116.972 E.02432
G1 X93.19 Y117.085 E.02387
G1 X92.437 Y117.156 E.02703
G1 X87.619 Y117.187 E.17213
G1 X86.911 Y117.167 E.02532
G1 X86.18 Y117.103 E.02622
G1 X85.464 Y116.99 E.02589
G1 X84.619 Y116.792 E.03099
G1 X83.946 Y116.577 E.02523
G1 X82.944 Y116.161 E.03879
G1 X82.048 Y115.687 E.0362
G1 X81.463 Y115.312 E.02482
G1 X80.829 Y114.835 E.02835
G1 X80.213 Y114.295 E.02926
G1 X79.634 Y113.698 E.02972
G1 X79.054 Y112.993 E.03261
G1 X78.533 Y112.239 E.03275
G1 X78.14 Y111.553 E.02824
G1 X77.796 Y110.822 E.02886
G1 X77.374 Y109.661 E.04414
G1 X77.191 Y108.973 E.02542
G1 X77.052 Y108.227 E.02714
G1 X76.968 Y107.495 E.02629
G1 X76.93 Y106.581 E.03269
G1 X76.927 Y80.11 E.94569
G1 X76.975 Y80.006 E.00409
G1 X77.085 Y79.975 E.00409
G1 X77.183 Y80.041 E.00421
G1 X77.834 Y81.148 E.0459
G1 X78.272 Y81.706 E.02534
G1 X78.302 Y81.79 E.0032
G1 X78.324 Y106.846 E.89512
G1 X78.744 Y109.303 E.08907
G1 X79.345 Y110.845 E.05911
G1 X80.118 Y112.084 E.0522
G1 X81.022 Y113.124 E.0492
G1 X82.312 Y114.19 E.05979
G1 X83.713 Y114.973 E.05733
G1 X85.201 Y115.488 E.05627
G1 X87.369 Y115.802 E.07827
G1 X92.037 Y115.795 E.16677
G1 X93.858 Y115.52 E.06579
G1 X94.978 Y115.146 E.04216
G1 X96.014 Y114.602 E.04182
G1 X97.026 Y113.825 E.04559
G1 X97.843 Y112.961 E.04248
G1 X98.584 Y111.875 E.04697
G1 X98.909 Y111.228 E.02585
G1 X99.309 Y110.088 E.04316
G1 X99.441 Y109.437 E.02373
G1 X99.478 Y109.368 E.00283
G1 X100.727 Y108.121 E.06304
G1 X100.778 Y108.102 E.00194
; WIPE_START
G1 X100.935 Y108.137 E-.06085
G1 X100.961 Y108.221 E-.03362
G1 X100.95 Y108.674 E-.17207
G1 X100.921 Y108.971 E-.11346
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-.526 J-1.097 P1  F42000
G1 X100.285 Y109.275 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X100.385 Y109.331 E.00409
G1 X100.41 Y109.436 E.00387
G1 X100.308 Y109.998 E.02039
G1 X100.152 Y110.597 E.02211
G1 X99.939 Y111.217 E.02341
G1 X99.637 Y111.911 E.02705
G1 X99.41 Y112.343 E.01743
G1 X99.061 Y112.916 E.02398
G1 X98.689 Y113.435 E.02281
G1 X98.275 Y113.929 E.02302
G1 X97.81 Y114.402 E.02368
G1 X97.271 Y114.87 E.02553
G1 X96.771 Y115.239 E.0222
G1 X96.232 Y115.577 E.0227
G1 X95.635 Y115.889 E.02409
G1 X95.019 Y116.152 E.02391
G1 X94.385 Y116.366 E.0239
G1 X93.759 Y116.523 E.02307
G1 X93.135 Y116.631 E.02262
G1 X92.42 Y116.699 E.02566
G1 X87.626 Y116.73 E.17127
G1 X86.941 Y116.711 E.02449
G1 X86.24 Y116.65 E.02514
G1 X85.557 Y116.542 E.02471
G1 X84.746 Y116.352 E.02974
G1 X84.099 Y116.145 E.0243
G1 X83.133 Y115.744 E.03735
G1 X82.274 Y115.289 E.03473
G1 X81.72 Y114.933 E.02351
G1 X81.121 Y114.483 E.02676
G1 X80.532 Y113.967 E.02798
G1 X79.979 Y113.397 E.02839
G1 X79.423 Y112.722 E.03124
G1 X78.924 Y112 E.03138
G1 X78.548 Y111.346 E.02691
G1 X78.216 Y110.64 E.02787
G1 X77.813 Y109.529 E.04223
G1 X77.638 Y108.877 E.02411
G1 X77.505 Y108.163 E.02595
G1 X77.425 Y107.465 E.02512
G1 X77.387 Y106.574 E.03184
G1 X77.385 Y81.712 E.88822
G1 X77.432 Y81.608 E.00409
G1 X77.542 Y81.577 E.00409
G1 X77.629 Y81.627 E.00361
G1 X77.816 Y81.864 E.01076
G1 X77.845 Y81.949 E.0032
G1 X77.867 Y106.835 E.88907
G1 X78.292 Y109.367 E.09172
G1 X78.964 Y111.097 E.06633
G1 X79.78 Y112.392 E.05468
G1 X80.739 Y113.483 E.0519
G1 X82.099 Y114.594 E.06274
G1 X83.574 Y115.409 E.06019
G1 X85.148 Y115.942 E.05937
G1 X87.294 Y116.253 E.07746
G1 X92.116 Y116.245 E.17227
G1 X93.915 Y115.973 E.06501
G1 X95.113 Y115.583 E.045
G1 X96.217 Y115.011 E.04442
G1 X97.296 Y114.194 E.04837
G1 X98.168 Y113.282 E.04508
G1 X98.956 Y112.139 E.04959
G1 X99.343 Y111.371 E.03074
G1 X99.737 Y110.248 E.04253
G1 X99.862 Y109.662 E.02138
G1 X99.899 Y109.594 E.00279
G1 X100.178 Y109.315 E.01409
G1 X100.229 Y109.296 E.00194
; WIPE_START
G1 X100.385 Y109.331 E-.06085
G1 X100.41 Y109.436 E-.04119
G1 X100.308 Y109.998 E-.21692
G1 X100.268 Y110.154 E-.06105
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.957 J-.751 P1  F42000
G1 X97.028 Y106.027 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X96.552 Y106.494 E.02383
G1 X95.515 Y107.221 E.04522
G1 X95.457 Y107.334 E.00455
G1 X95.464 Y108.386 E.0376
G1 X95.375 Y108.968 E.02101
G1 X95.136 Y109.638 E.02544
G1 X94.692 Y110.35 E.02995
G1 X94.213 Y110.85 E.02477
G1 X93.913 Y111.081 E.0135
G1 X93.568 Y111.292 E.01446
G1 X92.888 Y111.554 E.02604
G1 X92.035 Y111.688 E.03084
G1 X87.362 Y111.695 E.16695
G1 X86.294 Y111.548 E.03852
G1 X85.505 Y111.295 E.02962
G1 X84.657 Y110.841 E.03434
G1 X83.932 Y110.25 E.03344
G1 X83.295 Y109.492 E.03535
G1 X82.977 Y108.956 E.02229
G1 X82.711 Y108.33 E.0243
G1 X82.438 Y106.953 E.05013
G1 X82.414 Y80.23 E.9547
G1 X82.37 Y80.13 E.0039
G1 X82.038 Y79.82 E.01622
G1 X81.399 Y79.094 E.03459
G1 X80.599 Y77.829 E.05347
G1 X79.952 Y76.118 E.06533
G1 X79.695 Y74.507 E.0583
G1 X79.697 Y73.632 E.03127
G1 X79.795 Y72.745 E.03188
G1 X80.001 Y71.831 E.03346
G1 X80.289 Y71.005 E.03124
G1 X80.655 Y70.224 E.03085
G1 X81.019 Y69.615 E.02533
G1 X81.442 Y69.025 E.02594
G1 X81.994 Y68.401 E.02978
G1 X82.635 Y67.808 E.03119
G1 X84.005 Y66.895 E.05879
G1 X85.422 Y66.302 E.0549
G1 X86.942 Y65.984 E.05548
G1 X88.347 Y65.929 E.05021
G1 X89.596 Y65.636 E.04584
G1 X90.988 Y65.56 E.0498
G1 X92.276 Y65.697 E.0463
G1 X94.29 Y66.34 E.07551
G1 X95.562 Y67.075 E.05249
G1 X96.72 Y68.051 E.05412
G1 X97.644 Y69.162 E.05159
G1 X98.344 Y70.375 E.05004
G1 X98.949 Y72.154 E.06713
G1 X99.139 Y73.81 E.05955
G1 X99.013 Y75.429 E.05804
G1 X98.483 Y77.224 E.06684
G1 X97.956 Y78.272 E.04192
G1 X97.582 Y78.804 E.02322
G1 X97.558 Y78.867 E.00242
G1 X97.508 Y79.307 E.01581
G1 X97.368 Y79.815 E.01883
G1 X97.172 Y80.261 E.01739
G1 X97.2 Y80.412 E.0055
G1 X97.78 Y81.001 E.02952
G1 X98.655 Y82.231 E.05391
G1 X99.272 Y83.484 E.04991
G1 X99.688 Y84.827 E.05023
G1 X99.896 Y86.401 E.05672
G1 X99.794 Y88.204 E.06451
G1 X99.311 Y90.026 E.06736
G1 X98.596 Y91.482 E.05795
G1 X97.733 Y92.673 E.05256
G1 X97.312 Y93.098 E.02134
G1 X97.273 Y93.205 E.00409
G1 X97.31 Y93.289 E.00327
G1 X97.807 Y93.81 E.02571
G1 X98.611 Y94.969 E.05042
G1 X99.394 Y96.694 E.06765
G1 X99.748 Y98.154 E.05369
G1 X99.853 Y99.635 E.05303
G1 X99.73 Y101.014 E.04947
G1 X99.38 Y102.408 E.05135
G1 X98.654 Y104.008 E.06275
G1 X97.688 Y105.381 E.06
G1 X97.071 Y105.985 E.03084
M204 S6000
G1 X96.757 Y105.66 F42000
G1 F3000
M204 S500
G1 X96.226 Y106.172 E.02635
G1 X95.189 Y106.891 E.04507
G1 X95.069 Y106.957 E.00491
G1 X94.998 Y107.091 E.00541
G1 X95.007 Y108.401 E.0468
G1 X94.922 Y108.902 E.01817
G1 X94.751 Y109.391 E.01852
G1 X94.367 Y110.028 E.02657
G1 X93.942 Y110.482 E.02223
G1 X93.628 Y110.724 E.01413
G1 X93.324 Y110.906 E.01266
G1 X92.718 Y111.13 E.0231
G1 X92.045 Y111.231 E.0243
G1 X87.352 Y111.238 E.16766
G1 X86.348 Y111.094 E.03623
G1 X85.638 Y110.858 E.02673
G1 X84.951 Y110.491 E.02783
G1 X84.287 Y109.962 E.03035
G1 X83.694 Y109.269 E.03257
G1 X83.365 Y108.715 E.02302
G1 X83.128 Y108.142 E.02214
G1 X82.895 Y106.966 E.04283
G1 X82.871 Y80.029 E.96235
G1 X82.827 Y79.928 E.00394
G1 X82.386 Y79.524 E.02138
G1 X81.735 Y78.784 E.03522
G1 X81.031 Y77.68 E.04676
G1 X80.374 Y75.943 E.06633
G1 X80.152 Y74.516 E.0516
G1 X80.15 Y73.687 E.02964
G1 X80.239 Y72.851 E.03002
G1 X80.431 Y71.987 E.03164
G1 X80.7 Y71.204 E.02956
G1 X81.044 Y70.464 E.02915
G1 X81.414 Y69.844 E.02578
G1 X81.817 Y69.287 E.02456
G1 X82.34 Y68.7 E.02809
G1 X82.952 Y68.137 E.02972
G1 X84.173 Y67.32 E.05248
G1 X85.503 Y66.752 E.05166
G1 X87.047 Y66.429 E.05637
G1 X88.395 Y66.388 E.04819
G1 X89.612 Y66.093 E.04472
G1 X90.928 Y66.014 E.04711
G1 X92.241 Y66.153 E.04718
G1 X94.058 Y66.734 E.06814
G1 X95.261 Y67.418 E.04944
G1 X96.364 Y68.337 E.05127
G1 X97.242 Y69.38 E.04873
G1 X97.955 Y70.615 E.05092
G1 X98.494 Y72.199 E.05978
G1 X98.686 Y73.875 E.06028
G1 X98.556 Y75.404 E.05482
G1 X98.042 Y77.102 E.06339
G1 X97.546 Y78.072 E.03894
G1 X97.14 Y78.636 E.02481
G1 X97.115 Y78.703 E.00256
G1 X97.07 Y79.176 E.01695
G1 X96.925 Y79.704 E.01957
G1 X96.706 Y80.18 E.01871
G1 X96.615 Y80.322 E.00603
G1 X96.598 Y80.435 E.00409
G1 X96.633 Y80.493 E.00244
G1 X97.402 Y81.257 E.03869
G1 X98.289 Y82.504 E.0547
G1 X98.865 Y83.692 E.04717
G1 X99.253 Y84.97 E.04771
G1 X99.445 Y86.471 E.05404
G1 X99.337 Y88.188 E.06148
G1 X98.905 Y89.815 E.06015
G1 X98.233 Y91.204 E.05512
G1 X97.356 Y92.414 E.05336
G1 X96.669 Y93.089 E.03444
G1 X96.628 Y93.196 E.00409
G1 X96.667 Y93.283 E.00338
G1 X97.428 Y94.065 E.03899
G1 X98.19 Y95.147 E.04728
G1 X98.983 Y96.895 E.06856
M73 P5 R32
G1 X99.305 Y98.269 E.05043
G1 X99.399 Y99.583 E.04708
G1 X99.274 Y100.984 E.05025
G1 X98.934 Y102.305 E.04873
G1 X98.234 Y103.828 E.05986
G1 X97.309 Y105.126 E.05694
G1 X96.8 Y105.618 E.02531
M204 S6000
G1 X96.488 Y105.295 F42000
G1 F3000
M204 S500
G1 X95.975 Y105.79 E.02546
G1 X94.923 Y106.519 E.04572
G1 X94.569 Y106.692 E.0141
G1 X94.494 Y106.838 E.00584
G1 X94.554 Y107.208 E.0134
G1 X94.55 Y108.411 E.04297
G1 X94.472 Y108.826 E.0151
G1 X94.362 Y109.152 E.01229
G1 X94.037 Y109.711 E.0231
G1 X93.671 Y110.114 E.01944
G1 X93.343 Y110.367 E.01482
G1 X93.086 Y110.516 E.0106
G1 X92.658 Y110.677 E.01634
G1 X92.054 Y110.773 E.02183
G1 X87.341 Y110.781 E.16838
G1 X86.405 Y110.64 E.03383
G1 X85.779 Y110.423 E.02367
G1 X85.24 Y110.136 E.02182
G1 X84.639 Y109.67 E.02717
G1 X84.09 Y109.041 E.02983
G1 X83.791 Y108.548 E.02058
G1 X83.545 Y107.954 E.02297
G1 X83.352 Y106.979 E.03552
G1 X83.328 Y79.827 E.97005
G1 X83.283 Y79.725 E.00396
G1 X82.734 Y79.227 E.02649
G1 X82.071 Y78.474 E.03585
G1 X81.411 Y77.425 E.04425
G1 X80.798 Y75.772 E.06299
G1 X80.609 Y74.523 E.04513
G1 X80.605 Y73.739 E.028
G1 X80.684 Y72.956 E.02815
G1 X80.862 Y72.14 E.02982
G1 X81.113 Y71.401 E.02788
G1 X81.434 Y70.703 E.02746
G1 X81.782 Y70.117 E.02435
G1 X82.192 Y69.549 E.02502
G1 X82.684 Y69.001 E.02632
G1 X83.268 Y68.468 E.02825
G1 X84.436 Y67.695 E.05003
G1 X85.691 Y67.169 E.04864
G1 X87.149 Y66.875 E.05312
G1 X88.443 Y66.847 E.04625
G1 X89.627 Y66.55 E.04362
G1 X90.967 Y66.469 E.04796
G1 X92.203 Y66.609 E.04444
G1 X93.823 Y67.126 E.06076
G1 X94.962 Y67.764 E.04664
G1 X96.006 Y68.622 E.04827
G1 X96.9 Y69.684 E.04959
G1 X97.564 Y70.851 E.04796
G1 X98.039 Y72.243 E.05257
G1 X98.234 Y73.941 E.06104
G1 X98.1 Y75.375 E.05145
G1 X97.602 Y76.977 E.05995
G1 X97.136 Y77.869 E.03594
G1 X96.694 Y78.471 E.02669
G1 X96.668 Y78.542 E.00272
G1 X96.632 Y79.043 E.01793
G1 X96.481 Y79.593 E.02039
G1 X96.291 Y79.989 E.01568
G1 X96.016 Y80.366 E.01665
G1 X95.994 Y80.478 E.00409
G1 X96.031 Y80.545 E.00274
G1 X97.022 Y81.512 E.04948
G1 X97.923 Y82.779 E.05553
G1 X98.457 Y83.898 E.04431
G1 X98.818 Y85.111 E.04522
G1 X98.993 Y86.538 E.05136
G1 X98.88 Y88.169 E.05842
G1 X98.498 Y89.608 E.05318
G1 X97.87 Y90.926 E.05216
G1 X96.98 Y92.155 E.0542
G1 X96.006 Y93.094 E.04834
G1 X95.964 Y93.201 E.00409
G1 X96.016 Y93.3 E.004
G1 X96.137 Y93.397 E.00556
G1 X97.048 Y94.32 E.04631
G1 X97.824 Y95.421 E.04813
G1 X98.535 Y96.989 E.06153
G1 X98.849 Y98.29 E.04782
G1 X98.944 Y99.627 E.04786
G1 X98.818 Y100.952 E.04755
G1 X98.489 Y102.2 E.04612
G1 X97.815 Y103.645 E.05698
G1 X96.932 Y104.867 E.05386
G1 X96.531 Y105.254 E.01987
M204 S6000
G1 X96.214 Y104.929 F42000
G1 F3000
M204 S500
G1 X95.724 Y105.408 E.02448
G1 X94.654 Y106.149 E.04649
G1 X94.029 Y106.438 E.02462
G1 X93.955 Y106.525 E.00409
G1 X93.957 Y106.606 E.0029
G1 X94.021 Y106.797 E.00716
G1 X94.097 Y107.2 E.01466
G1 X94.102 Y108.323 E.04012
G1 X94.042 Y108.671 E.01262
G1 X93.924 Y109.019 E.01312
G1 X93.701 Y109.401 E.01582
G1 X93.401 Y109.744 E.01628
G1 X93.056 Y110.011 E.01557
G1 X92.859 Y110.119 E.00806
G1 X92.591 Y110.224 E.01028
G1 X92.065 Y110.316 E.01909
G1 X87.33 Y110.324 E.16914
G1 X86.567 Y110.213 E.02756
G1 X85.919 Y109.988 E.0245
G1 X85.45 Y109.731 E.01909
G1 X84.987 Y109.375 E.02087
G1 X84.487 Y108.814 E.02685
G1 X84.177 Y108.302 E.02138
G1 X83.964 Y107.773 E.02037
G1 X83.809 Y106.992 E.02845
G1 X83.785 Y79.596 E.97875
G1 X83.729 Y79.486 E.00441
G1 X83.52 Y79.331 E.0093
G1 X83.082 Y78.931 E.0212
G1 X82.406 Y78.163 E.03652
G1 X81.792 Y77.173 E.04163
G1 X81.223 Y75.604 E.05963
G1 X81.067 Y74.53 E.03877
G1 X81.062 Y73.729 E.02862
G1 X81.139 Y72.997 E.02631
G1 X81.293 Y72.292 E.02578
G1 X81.526 Y71.596 E.02621
G1 X81.823 Y70.942 E.02566
G1 X82.178 Y70.345 E.02482
G1 X82.565 Y69.812 E.02353
G1 X83.027 Y69.303 E.02453
G1 X83.582 Y68.799 E.02681
G1 X84.696 Y68.07 E.04755
G1 X85.876 Y67.587 E.04556
G1 X87.247 Y67.321 E.04987
G1 X88.489 Y67.308 E.04438
G1 X89.646 Y67.006 E.04271
G1 X90.904 Y66.922 E.04505
G1 X92.165 Y67.065 E.04535
G1 X93.588 Y67.518 E.05335
G1 X94.75 Y68.169 E.04757
G1 X95.722 Y68.98 E.04525
G1 X96.556 Y69.985 E.04664
G1 X97.171 Y71.084 E.04501
G1 X97.608 Y72.395 E.04934
G1 X97.781 Y74.003 E.05781
G1 X97.644 Y75.341 E.04804
G1 X97.203 Y76.755 E.0529
G1 X96.726 Y77.666 E.03675
G1 X96.244 Y78.309 E.0287
G1 X96.217 Y78.385 E.0029
G1 X96.195 Y78.909 E.01872
G1 X96.037 Y79.484 E.02132
G1 X95.881 Y79.789 E.01222
G1 X95.705 Y80.031 E.0107
G1 X95.315 Y80.4 E.01917
G1 X95.272 Y80.506 E.00409
G1 X95.331 Y80.612 E.00431
G1 X95.768 Y80.918 E.01908
G1 X96.645 Y81.77 E.04367
G1 X97.505 Y82.965 E.05261
G1 X98.049 Y84.104 E.04511
G1 X98.383 Y85.249 E.0426
G1 X98.54 Y86.603 E.04869
G1 X98.424 Y88.147 E.05533
G1 X98.088 Y89.404 E.04647
G1 X97.508 Y90.648 E.04904
G1 X96.602 Y91.896 E.05508
G1 X95.738 Y92.724 E.04277
G1 X95.232 Y93.078 E.02206
G1 X95.174 Y93.176 E.00409
G1 X95.231 Y93.302 E.00492
G1 X95.806 Y93.712 E.02526
G1 X96.73 Y94.649 E.047
G1 X97.455 Y95.692 E.04538
G1 X98.089 Y97.087 E.05475
G1 X98.392 Y98.312 E.04506
G1 X98.488 Y99.67 E.04867
G1 X98.362 Y100.916 E.04472
G1 X98.045 Y102.092 E.04353
G1 X97.396 Y103.461 E.0541
G1 X96.62 Y104.533 E.04728
G1 X96.257 Y104.887 E.01814
M204 S6000
G1 X95.938 Y104.565 F42000
G1 F3000
M204 S500
G1 X95.474 Y105.026 E.02337
G1 X94.385 Y105.78 E.04732
G1 X93.4 Y106.218 E.03851
G1 X93.324 Y106.304 E.00409
G1 X93.335 Y106.409 E.00377
G1 X93.526 Y106.759 E.01422
G1 X93.573 Y106.889 E.00495
G1 X93.64 Y107.194 E.01117
G1 X93.654 Y108.233 E.03711
G1 X93.59 Y108.603 E.01343
G1 X93.492 Y108.872 E.01022
G1 X93.357 Y109.102 E.00952
G1 X93.124 Y109.381 E.013
G1 X92.846 Y109.605 E.01274
G1 X92.631 Y109.723 E.00876
G1 X92.423 Y109.8 E.00793
G1 X92.076 Y109.859 E.01258
G1 X87.319 Y109.867 E.16992
G1 X86.722 Y109.783 E.02157
G1 X86.149 Y109.592 E.02157
G1 X85.661 Y109.325 E.01988
G1 X85.263 Y109.01 E.01814
G1 X84.879 Y108.58 E.02057
G1 X84.605 Y108.143 E.01845
G1 X84.384 Y107.591 E.02123
G1 X84.266 Y107.005 E.02135
G1 X84.242 Y79.361 E.98761
G1 X84.184 Y79.25 E.00447
G1 X83.833 Y78.999 E.01541
G1 X83.385 Y78.588 E.02172
G1 X82.743 Y77.854 E.03482
G1 X82.176 Y76.924 E.03894
G1 X81.65 Y75.439 E.05626
G1 X81.524 Y74.537 E.03256
G1 X81.519 Y73.719 E.02923
G1 X81.594 Y73.041 E.02437
G1 X81.725 Y72.442 E.02191
G1 X81.94 Y71.789 E.02454
G1 X82.214 Y71.18 E.02386
G1 X82.544 Y70.619 E.02326
G1 X82.939 Y70.075 E.02402
G1 X83.367 Y69.608 E.02263
G1 X83.896 Y69.132 E.0254
G1 X84.955 Y68.447 E.04504
G1 X86.057 Y68.006 E.04243
G1 X87.341 Y67.769 E.04665
G1 X88.533 Y67.769 E.04258
G1 X89.668 Y67.463 E.04201
G1 X90.84 Y67.375 E.04199
G1 X92.127 Y67.52 E.04627
G1 X93.357 Y67.913 E.0461
G1 X94.447 Y68.512 E.04445
G1 X95.439 Y69.339 E.04616
G1 X96.209 Y70.283 E.0435
G1 X96.776 Y71.315 E.04207
G1 X97.175 Y72.542 E.04612
G1 X97.328 Y74.063 E.05459
G1 X97.189 Y75.303 E.04457
G1 X96.804 Y76.532 E.04602
G1 X96.316 Y77.464 E.03759
G1 X95.788 Y78.153 E.03099
G1 X95.76 Y78.236 E.00315
G1 X95.76 Y78.653 E.01488
G1 X95.74 Y78.877 E.00804
G1 X95.63 Y79.277 E.01482
G1 X95.517 Y79.511 E.00929
G1 X95.328 Y79.772 E.01153
G1 X95.076 Y80.012 E.01241
G1 X94.672 Y80.242 E.01661
G1 X94.466 Y80.317 E.00782
G1 X94.385 Y80.397 E.00409
G1 X94.393 Y80.511 E.00409
G1 X94.436 Y80.559 E.00232
G1 X95.442 Y81.238 E.04334
G1 X96.335 Y82.106 E.04449
G1 X97.089 Y83.154 E.04613
G1 X97.607 Y84.222 E.0424
G1 X97.947 Y85.388 E.04341
G1 X98.087 Y86.665 E.04589
G1 X97.985 Y88.017 E.04844
G1 X97.644 Y89.298 E.04736
G1 X97.09 Y90.462 E.04607
G1 X96.295 Y91.557 E.04834
G1 X95.414 Y92.402 E.04359
G1 X94.425 Y93.072 E.04269
G1 X94.366 Y93.17 E.00409
G1 X94.424 Y93.298 E.00503
G1 X95.475 Y94.027 E.0457
G1 X96.351 Y94.904 E.04425
G1 X97.036 Y95.873 E.0424
G1 X97.642 Y97.185 E.05163
G1 X97.951 Y98.433 E.04594
G1 X98.033 Y99.711 E.04575
G1 X97.907 Y100.877 E.04191
G1 X97.601 Y101.982 E.04094
G1 X96.98 Y103.273 E.05121
G1 X96.306 Y104.2 E.04095
G1 X95.981 Y104.523 E.01637
M204 S6000
G1 X95.665 Y104.2 F42000
G1 F3000
M204 S500
G1 X95.146 Y104.707 E.02591
G1 X94.117 Y105.409 E.04451
G1 X92.908 Y105.933 E.04709
G1 X92.539 Y106.024 E.01356
G1 X92.45 Y106.095 E.00409
G1 X92.446 Y106.21 E.00409
G1 X92.502 Y106.275 E.0031
G1 X92.673 Y106.376 E.00709
G1 X92.809 Y106.491 E.00636
G1 X92.963 Y106.668 E.00838
G1 X93.125 Y106.977 E.01246
G1 X93.196 Y107.306 E.012
G1 X93.203 Y108.156 E.0304
G1 X93.159 Y108.449 E.01059
G1 X93.091 Y108.652 E.00764
G1 X93.012 Y108.801 E.006
G1 X92.764 Y109.1 E.0139
G1 X92.572 Y109.239 E.00845
G1 X92.415 Y109.32 E.00631
G1 X92.268 Y109.37 E.00556
G1 X92.002 Y109.408 E.0096
G1 X87.31 Y109.41 E.16764
G1 X86.78 Y109.329 E.01916
G1 X86.29 Y109.158 E.01853
G1 X85.879 Y108.923 E.01692
G1 X85.544 Y108.65 E.01544
G1 X85.219 Y108.274 E.01776
G1 X84.99 Y107.897 E.01574
G1 X84.807 Y107.418 E.01834
G1 X84.713 Y106.911 E.0184
G1 X84.697 Y79.389 E.98326
G1 X84.72 Y79.151 E.00853
G1 X84.662 Y79.026 E.00493
G1 X84.148 Y78.667 E.0224
G1 X83.688 Y78.246 E.02228
G1 X83.081 Y77.546 E.03307
G1 X82.61 Y76.78 E.03214
G1 X82.104 Y75.387 E.05297
G1 X81.981 Y74.54 E.03056
G1 X81.972 Y73.775 E.02734
G1 X82.04 Y73.142 E.02273
G1 X82.158 Y72.589 E.0202
G1 X82.356 Y71.98 E.02288
G1 X82.605 Y71.416 E.02203
G1 X82.912 Y70.89 E.02174
G1 X83.273 Y70.387 E.02211
G1 X83.668 Y69.952 E.02102
G1 X84.21 Y69.464 E.02603
G1 X85.211 Y68.826 E.04241
G1 X86.234 Y68.428 E.03924
G1 X87.432 Y68.217 E.04344
G1 X88.575 Y68.232 E.04083
G1 X89.695 Y67.919 E.04154
G1 X90.781 Y67.828 E.03895
G1 X91.98 Y67.953 E.04307
G1 X93.129 Y68.309 E.04299
G1 X94.148 Y68.857 E.04132
G1 X95.08 Y69.622 E.04309
G1 X95.803 Y70.492 E.04038
G1 X96.382 Y71.546 E.04298
G1 X96.743 Y72.692 E.04294
G1 X96.874 Y74.005 E.04712
G1 X96.733 Y75.265 E.0453
G1 X96.365 Y76.402 E.04269
G1 X95.908 Y77.259 E.0347
G1 X95.332 Y77.994 E.03337
G1 X95.303 Y78.078 E.0032
G1 X95.303 Y78.659 E.02074
G1 X95.284 Y78.84 E.00652
G1 X95.19 Y79.154 E.01172
G1 X95.111 Y79.303 E.00603
G1 X94.959 Y79.503 E.00895
G1 X94.765 Y79.678 E.00932
G1 X94.452 Y79.841 E.0126
G1 X94.343 Y79.878 E.00413
G1 X94.16 Y79.905 E.00661
G1 X92.434 Y79.916 E.06166
G1 X92.337 Y79.957 E.00375
G1 X92.269 Y80.026 E.00346
G1 X92.23 Y80.133 E.00409
G1 X92.335 Y80.255 E.00575
G1 X93.002 Y80.414 E.02451
G1 X94.111 Y80.892 E.04312
G1 X95.118 Y81.561 E.0432
G1 X95.957 Y82.363 E.04147
G1 X96.725 Y83.431 E.04698
G1 X97.199 Y84.427 E.03943
G1 X97.511 Y85.524 E.04073
G1 X97.634 Y86.723 E.04307
G1 X97.529 Y87.991 E.04546
G1 X97.234 Y89.094 E.04079
G1 X96.725 Y90.187 E.04307
G1 X95.985 Y91.222 E.04545
G1 X95.166 Y92.018 E.04081
G1 X94.207 Y92.673 E.04149
G1 X93.356 Y93.051 E.03326
G1 X93.28 Y93.136 E.00409
G1 X93.296 Y93.25 E.00409
G1 X93.355 Y93.301 E.00281
G1 X94.116 Y93.641 E.02977
G1 X95.146 Y94.345 E.04456
G1 X95.974 Y95.162 E.04155
G1 X96.617 Y96.057 E.0394
G1 X97.196 Y97.286 E.04852
G1 X97.494 Y98.454 E.04307
G1 X97.579 Y99.654 E.04298
G1 X97.469 Y100.744 E.03916
G1 X97.158 Y101.872 E.04178
G1 X96.617 Y102.994 E.04452
G1 X95.93 Y103.941 E.04178
G1 X95.708 Y104.158 E.01109
M204 S6000
G1 X95.395 Y103.833 F42000
G1 F3000
M204 S500
G1 X94.821 Y104.385 E.02845
G1 X93.852 Y105.037 E.04171
G1 X92.72 Y105.517 E.04394
G1 X91.661 Y105.749 E.03875
G1 X90.601 Y105.796 E.03788
G1 X89.423 Y105.637 E.04246
G1 X88.452 Y105.325 E.03644
G1 X87.726 Y104.949 E.02923
G1 X87.612 Y104.943 E.00409
G1 X87.526 Y105.07 E.00549
G1 X87.526 Y106.002 E.03328
G1 X87.573 Y106.106 E.00409
G1 X87.663 Y106.139 E.00341
G1 X91.428 Y106.139 E.1345
G1 X91.658 Y106.181 E.00836
G1 X91.849 Y106.268 E.00751
G1 X91.998 Y106.394 E.00697
G1 X92.134 Y106.588 E.00846
G1 X92.188 Y106.634 E.00254
G1 X92.369 Y106.718 E.00712
G1 X92.522 Y106.847 E.00714
G1 X92.612 Y106.961 E.00519
G1 X92.714 Y107.178 E.00856
G1 X92.746 Y107.385 E.0075
G1 X92.746 Y108.166 E.02789
G1 X92.73 Y108.292 E.00456
G1 X92.654 Y108.517 E.00848
G1 X92.488 Y108.736 E.00981
G1 X92.372 Y108.828 E.00528
G1 X92.197 Y108.919 E.00706
G1 X92.012 Y108.951 E.00671
G1 X87.299 Y108.953 E.16836
G1 X86.844 Y108.877 E.01648
G1 X86.441 Y108.726 E.01539
G1 X86.105 Y108.526 E.01397
G1 X85.832 Y108.295 E.01275
G1 X85.563 Y107.974 E.01498
G1 X85.381 Y107.659 E.013
G1 X85.232 Y107.252 E.01548
G1 X85.162 Y106.827 E.01538
G1 X85.154 Y79.382 E.98049
G1 X85.203 Y78.933 E.01613
G1 X85.146 Y78.806 E.00499
G1 X84.402 Y78.287 E.0324
G1 X84.035 Y77.948 E.01786
G1 X83.476 Y77.316 E.03012
G1 X82.992 Y76.529 E.03304
G1 X82.558 Y75.335 E.04539
G1 X82.432 Y74.465 E.03139
G1 X82.426 Y73.829 E.02274
G1 X82.486 Y73.241 E.02112
G1 X82.591 Y72.735 E.01847
G1 X82.772 Y72.168 E.02125
G1 X82.998 Y71.65 E.02017
G1 X83.281 Y71.159 E.02027
G1 X83.607 Y70.699 E.02015
G1 X83.974 Y70.292 E.01957
G1 X84.451 Y69.852 E.02318
G1 X85.364 Y69.257 E.03893
G1 X86.413 Y68.849 E.04021
G1 X87.519 Y68.666 E.04004
G1 X88.614 Y68.697 E.03916
G1 X89.72 Y68.376 E.04114
G1 X90.832 Y68.282 E.03988
G1 X91.941 Y68.409 E.03985
G1 X93.001 Y68.748 E.0398
G1 X93.938 Y69.264 E.03819
G1 X94.796 Y69.981 E.03995
G1 X95.456 Y70.79 E.0373
G1 X95.985 Y71.773 E.03991
G1 X96.31 Y72.838 E.03978
G1 X96.421 Y73.945 E.03973
G1 X96.301 Y75.116 E.04205
G1 X95.968 Y76.176 E.03969
G1 X95.499 Y77.054 E.03556
G1 X94.876 Y77.832 E.03562
G1 X94.846 Y77.918 E.00325
G1 X94.846 Y78.666 E.02672
G1 X94.83 Y78.792 E.00456
G1 X94.754 Y79.017 E.00848
G1 X94.587 Y79.236 E.00981
G1 X94.474 Y79.326 E.00519
G1 X94.254 Y79.43 E.00869
G1 X94.166 Y79.448 E.00318
G1 X92.218 Y79.46 E.06962
G1 X92.113 Y79.51 E.00414
G1 X91.967 Y79.686 E.00819
G1 X91.854 Y79.776 E.00517
G1 X91.637 Y79.878 E.00856
G1 X91.429 Y79.91 E.0075
G1 X87.663 Y79.91 E.13457
G1 X87.559 Y79.958 E.00409
G1 X87.526 Y80.047 E.00341
G1 X87.526 Y81.293 E.0445
G1 X87.573 Y81.397 E.00409
G1 X87.726 Y81.414 E.00549
G1 X88.506 Y81.009 E.03142
G1 X89.478 Y80.697 E.03646
G1 X90.55 Y80.543 E.03869
G1 X91.715 Y80.586 E.04165
G1 X92.815 Y80.831 E.04026
G1 X93.852 Y81.268 E.0402
G1 X94.793 Y81.883 E.04018
G1 X95.65 Y82.702 E.04236
G1 X96.307 Y83.616 E.04019
G1 X96.791 Y84.634 E.04028
G1 X97.073 Y85.656 E.03789
G1 X97.18 Y86.778 E.04027
G1 X97.073 Y87.961 E.04244
G1 X96.791 Y88.983 E.03787
G1 X96.307 Y90.001 E.04027
G1 X95.609 Y90.962 E.04244
G1 X94.842 Y91.695 E.03789
G1 X93.942 Y92.3 E.03874
G1 X92.812 Y92.787 E.04395
G1 X91.683 Y93.037 E.04132
G1 X91.592 Y93.106 E.00409
G1 X91.585 Y93.22 E.00409
G1 X91.682 Y93.304 E.00459
G1 X92.818 Y93.566 E.04165
G1 X93.852 Y94.015 E.04026
G1 X94.82 Y94.664 E.04164
G1 X95.596 Y95.419 E.03868
G1 X96.254 Y96.334 E.04027
G1 X96.751 Y97.39 E.04171
G1 X97.038 Y98.478 E.04018
G1 X97.125 Y99.601 E.04022
G1 X97.03 Y100.616 E.03645
G1 X96.751 Y101.662 E.03867
G1 X96.2 Y102.807 E.0454
G1 X95.556 Y103.678 E.03867
G1 X95.438 Y103.791 E.00586
M204 S6000
G1 X95.121 Y103.462 F42000
G1 F3000
M204 S500
G1 X94.496 Y104.064 E.03102
G1 X93.591 Y104.662 E.03874
G1 X92.629 Y105.069 E.03728
G1 X91.652 Y105.292 E.03583
G1 X90.568 Y105.34 E.03875
G1 X89.575 Y105.206 E.03583
G1 X88.581 Y104.887 E.03729
G1 X87.66 Y104.395 E.03729
G1 X87.069 Y103.928 E.02692
G1 X87.069 Y106.596 E.0953
G1 X91.44 Y106.596 E.15617
G1 X91.551 Y106.625 E.00408
G1 X91.635 Y106.671 E.00346
G1 X91.744 Y106.808 E.00625
G1 X91.813 Y107.046 E.00884
G1 X91.961 Y107.046 E.00528
G1 X92.071 Y107.075 E.00408
G1 X92.156 Y107.121 E.00346
G1 X92.265 Y107.258 E.00625
G1 X92.289 Y107.375 E.00424
G1 X92.289 Y108.175 E.02858
G1 X92.26 Y108.285 E.00408
G1 X92.214 Y108.37 E.00346
G1 X92.077 Y108.479 E.00625
G1 X92.024 Y108.494 E.00198
G1 X87.288 Y108.496 E.1692
G1 X86.919 Y108.426 E.01339
G1 X86.602 Y108.299 E.0122
M73 P5 R31
G1 X86.34 Y108.135 E.01105
G1 X86.129 Y107.947 E.0101
G1 X85.914 Y107.68 E.01225
G1 X85.776 Y107.431 E.01017
G1 X85.661 Y107.094 E.0127
G1 X85.614 Y106.755 E.01223
G1 X85.611 Y79.375 E.9782
G1 X85.661 Y78.96 E.01491
G1 X85.781 Y78.597 E.01369
G1 X85.407 Y78.431 E.01461
G1 X84.657 Y77.907 E.03272
G1 X84.377 Y77.646 E.01366
G1 X83.872 Y77.087 E.02692
G1 X83.373 Y76.277 E.03396
G1 X83.013 Y75.283 E.0378
G1 X82.883 Y74.39 E.03223
G1 X82.88 Y73.88 E.01822
G1 X82.933 Y73.336 E.01951
G1 X83.025 Y72.878 E.0167
G1 X83.19 Y72.353 E.01966
G1 X83.391 Y71.883 E.01825
G1 X83.653 Y71.425 E.01887
G1 X83.943 Y71.009 E.01811
G1 X84.284 Y70.627 E.01829
G1 X84.697 Y70.238 E.02029
G1 X85.522 Y69.686 E.03547
G1 X86.48 Y69.301 E.03685
G1 X87.493 Y69.122 E.03678
G1 X88.472 Y69.149 E.03497
G1 X88.647 Y69.185 E.0064
G1 X88.767 Y69.126 E.00476
G1 X89.75 Y68.832 E.03669
G1 X90.773 Y68.736 E.03669
G1 X91.794 Y68.841 E.03667
G1 X92.775 Y69.145 E.03669
G1 X93.64 Y69.61 E.03507
G1 X94.434 Y70.259 E.03665
G1 X95.11 Y71.089 E.03823
G1 X95.586 Y71.996 E.03662
G1 X95.875 Y72.979 E.03659
G1 X95.967 Y73.998 E.03656
G1 X95.867 Y74.971 E.03494
G1 X95.571 Y75.949 E.03651
G1 X95.09 Y76.85 E.03648
G1 X94.359 Y77.741 E.04116
G1 X94.389 Y77.875 E.00488
G1 X94.389 Y78.675 E.02858
G1 X94.36 Y78.785 E.00408
G1 X94.313 Y78.87 E.00346
G1 X94.176 Y78.979 E.00625
G1 X94.06 Y79.003 E.00424
G1 X91.769 Y79.003 E.08186
G1 X91.769 Y79.125 E.00434
G1 X91.74 Y79.235 E.00408
G1 X91.693 Y79.32 E.00346
G1 X91.556 Y79.429 E.00625
G1 X91.44 Y79.453 E.00424
G1 X87.069 Y79.453 E.15617
G1 X87.069 Y82.449 E.10703
G1 X87.714 Y81.939 E.0294
G1 X88.635 Y81.448 E.03729
G1 X89.629 Y81.129 E.03729
G1 X90.622 Y80.994 E.03583
G1 X91.706 Y81.043 E.03875
G1 X92.722 Y81.278 E.03728
G1 X93.681 Y81.692 E.03729
G1 X94.55 Y82.27 E.03728
G1 X95.275 Y82.963 E.03583
G1 X95.891 Y83.805 E.03729
G1 X96.347 Y84.744 E.03729
G1 X96.636 Y85.789 E.03874
G1 X96.726 Y86.829 E.03729
G1 X96.636 Y87.828 E.03583
G1 X96.347 Y88.873 E.03874
G1 X95.891 Y89.812 E.03729
G1 X95.302 Y90.623 E.03583
G1 X94.518 Y91.373 E.03875
G1 X93.681 Y91.925 E.03583
G1 X92.723 Y92.339 E.03728
G1 X91.665 Y92.58 E.03874
G1 X90.622 Y92.623 E.03729
G1 X89.629 Y92.489 E.03583
G1 X88.597 Y92.154 E.03874
G1 X87.714 Y91.678 E.03583
G1 X87.069 Y91.168 E.0294
G1 X87.069 Y95.123 E.14129
G1 X87.66 Y94.656 E.02692
G1 X88.581 Y94.165 E.03729
G1 X89.575 Y93.846 E.03729
G1 X90.568 Y93.711 E.03583
G1 X91.652 Y93.76 E.03875
G1 X92.629 Y93.983 E.03583
G1 X93.591 Y94.39 E.03729
G1 X94.496 Y94.987 E.03874
G1 X95.221 Y95.68 E.03583
G1 X95.837 Y96.522 E.03729
G1 X96.307 Y97.499 E.03875
G1 X96.582 Y98.506 E.03728
G1 X96.671 Y99.546 E.03729
G1 X96.574 Y100.585 E.03729
G1 X96.307 Y101.552 E.03583
G1 X95.837 Y102.529 E.03874
G1 X95.247 Y103.34 E.03583
G1 X95.164 Y103.42 E.00412
; WIPE_START
G1 X94.496 Y104.064 E-.35273
G1 X94.436 Y104.104 E-.02727
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.133 J-.444 P1  F42000
G1 X90.204 Y93.299 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X89.424 Y93.414 E.02815
G1 X88.452 Y93.726 E.03647
G1 X87.726 Y94.103 E.02923
G1 X87.612 Y94.108 E.00409
G1 X87.526 Y93.981 E.00549
G1 X87.526 Y92.325 E.05915
G1 X87.573 Y92.221 E.00409
G1 X87.728 Y92.205 E.00555
G1 X88.37 Y92.55 E.02607
G1 X89.477 Y92.92 E.04169
G1 X90.204 Y93.028 E.02625
G1 X90.3 Y93.09 E.00409
G1 X90.315 Y93.204 E.00409
G1 X90.249 Y93.26 E.00309
; WIPE_START
G1 X89.424 Y93.414 E-.31893
G1 X89.271 Y93.463 E-.06107
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.381 J-1.156 P1  F42000
G1 X88.419 Y93.183 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X88.418 Y93.214 E.00114
G1 X88.351 Y93.278 E.0033
G1 X88.175 Y93.355 E.00686
G1 X88.06 Y93.352 E.00409
G1 X87.983 Y93.229 E.00521
G1 X87.983 Y93.087 E.00506
G1 X88.03 Y92.983 E.00409
G1 X88.174 Y92.961 E.0052
G1 X88.231 Y92.986 E.00221
G1 X88.339 Y93.022 E.00407
G1 X88.423 Y93.1 E.00409
G1 X88.422 Y93.123 E.0008
; WIPE_START
G1 X88.418 Y93.214 E-.03493
G1 X88.351 Y93.278 E-.03506
G1 X88.175 Y93.355 E-.07298
G1 X88.06 Y93.352 E-.04347
G1 X87.983 Y93.229 E-.05545
G1 X87.983 Y93.087 E-.05387
G1 X88.03 Y92.983 E-.04347
G1 X88.136 Y92.967 E-.04076
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.217 J-.007 P1  F42000
G1 X88.069 Y80.667 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X87.983 Y80.54 E.00549
G1 X88.03 Y80.4 E.00527
G1 X88.12 Y80.367 E.00341
G1 X88.188 Y80.367 E.00245
G1 X88.292 Y80.415 E.00409
G1 X88.324 Y80.525 E.00409
G1 X88.252 Y80.626 E.00444
G1 X88.183 Y80.662 E.00276
G1 X88.129 Y80.664 E.00194
; WIPE_START
G1 X87.983 Y80.54 E-.07376
G1 X88.03 Y80.4 E-.05675
G1 X88.12 Y80.367 E-.03667
G1 X88.188 Y80.367 E-.02638
G1 X88.292 Y80.415 E-.04399
G1 X88.324 Y80.525 E-.044
G1 X88.252 Y80.626 E-.04781
G1 X88.183 Y80.662 E-.02973
G1 X88.129 Y80.664 E-.02092
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.063 J1.215 P1  F42000
G1 X97.714 Y80.164 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X97.811 Y79.928 E.0091
G1 X97.946 Y79.437 E.0182
G1 X97.999 Y79.033 E.01457
G1 X98.022 Y78.973 E.00229
G1 X98.369 Y78.469 E.02184
G1 X98.924 Y77.342 E.0449
G1 X99.447 Y75.572 E.06592
G1 X99.594 Y73.858 E.06148
G1 X99.404 Y72.108 E.06286
G1 X98.734 Y70.135 E.07446
G1 X97.988 Y68.861 E.05274
G1 X97.079 Y67.768 E.05077
G1 X95.866 Y66.733 E.057
G1 X94.53 Y65.951 E.05528
G1 X93.077 Y65.473 E.05464
G1 X92.994 Y65.396 E.00409
G1 X92.998 Y65.281 E.00409
G1 X93.12 Y65.206 E.00513
G1 X94.001 Y65.206 E.03145
G1 X95.003 Y65.245 E.03584
G1 X95.997 Y65.36 E.03573
G1 X96.997 Y65.558 E.03643
G1 X97.947 Y65.826 E.03528
G1 X98.837 Y66.157 E.03392
G1 X100.208 Y66.819 E.05438
G1 X101.056 Y67.328 E.03536
G1 X101.852 Y67.898 E.03495
G1 X102.609 Y68.535 E.03535
G1 X103.305 Y69.221 E.03492
G1 X103.947 Y69.96 E.03496
G1 X104.535 Y70.757 E.03539
G1 X105.053 Y71.586 E.03494
G1 X105.514 Y72.473 E.0357
G1 X105.892 Y73.364 E.03458
G1 X106.201 Y74.282 E.03461
G1 X106.44 Y75.231 E.03495
G1 X106.603 Y76.205 E.03528
G1 X106.714 Y77.711 E.05396
G1 X106.726 Y78.394 E.0244
G1 X106.703 Y79.419 E.03661
G1 X106.606 Y80.395 E.03506
G1 X106.439 Y81.339 E.03423
G1 X106.194 Y82.288 E.03501
G1 X105.872 Y83.224 E.03538
G1 X105.481 Y84.127 E.03514
G1 X105.147 Y84.774 E.02603
G1 X104.621 Y85.648 E.03645
G1 X104.022 Y86.485 E.03677
G1 X103.399 Y87.224 E.03454
G1 X102.712 Y87.921 E.03495
G1 X101.969 Y88.565 E.03514
G1 X100.82 Y89.433 E.05142
G1 X100.481 Y89.768 E.01703
G1 X100.123 Y90.234 E.021
G1 X99.665 Y91.128 E.03589
G1 X99.504 Y91.716 E.02176
G1 X99.41 Y92.5 E.02821
G1 X99.418 Y95.006 E.08955
G1 X99.37 Y95.11 E.00409
G1 X99.261 Y95.142 E.00409
G1 X99.157 Y95.066 E.00459
G1 X98.981 Y94.7 E.01453
G1 X98.188 Y93.557 E.0497
G1 X97.946 Y93.293 E.01279
G1 X97.911 Y93.184 E.00409
G1 X97.947 Y93.107 E.00305
G1 X98.108 Y92.935 E.00842
G1 X98.959 Y91.76 E.05183
G1 X99.756 Y90.131 E.0648
G1 X100.251 Y88.216 E.07064
G1 X100.348 Y86.328 E.06753
G1 X100.121 Y84.681 E.0594
M73 P6 R31
G1 X99.678 Y83.273 E.05276
G1 X99.021 Y81.957 E.05253
G1 X98.159 Y80.744 E.05317
G1 X97.742 Y80.311 E.02147
G1 X97.725 Y80.223 E.00321
; WIPE_START
G1 X97.811 Y79.928 E-.11661
G1 X97.946 Y79.437 E-.19357
G1 X97.97 Y79.255 E-.06982
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.215 J.075 P1  F42000
G1 X98.806 Y92.832 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X98.913 Y92.871 E.00409
G1 X98.954 Y92.968 E.00377
G1 X98.955 Y93.423 E.01625
G1 X98.908 Y93.527 E.00409
G1 X98.798 Y93.559 E.00409
G1 X98.706 Y93.503 E.00386
G1 X98.543 Y93.271 E.01013
G1 X98.544 Y93.112 E.0057
G1 X98.706 Y92.888 E.00985
G1 X98.753 Y92.862 E.00194
; WIPE_START
G1 X98.913 Y92.871 E-.06085
G1 X98.954 Y92.968 E-.04008
G1 X98.955 Y93.423 E-.17287
G1 X98.908 Y93.527 E-.04347
G1 X98.798 Y93.559 E-.04347
G1 X98.755 Y93.533 E-.01926
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.123 J.47 P1  F42000
G1 X100.695 Y88.895 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X100.603 Y88.827 E.00409
G1 X100.59 Y88.73 E.00348
G1 X100.708 Y88.227 E.01844
G1 X100.804 Y86.365 E.06663
G1 X100.553 Y84.533 E.06604
G1 X100.117 Y83.146 E.05197
G1 X99.435 Y81.762 E.05511
G1 X98.536 Y80.486 E.05574
G1 X98.275 Y80.205 E.01372
G1 X98.243 Y80.075 E.00479
G1 X98.385 Y79.566 E.01889
G1 X98.46 Y79.143 E.01535
G1 X98.783 Y78.663 E.02064
G1 X99.366 Y77.461 E.04776
G1 X99.882 Y75.715 E.06504
G1 X100.048 Y73.909 E.06478
G1 X99.859 Y72.066 E.06618
G1 X99.171 Y70.001 E.07778
G1 X98.388 Y68.639 E.05611
G1 X97.367 Y67.413 E.057
G1 X96.171 Y66.392 E.05618
G1 X95.579 Y66.035 E.02468
G1 X95.515 Y65.941 E.00409
G1 X95.545 Y65.83 E.00409
G1 X95.666 Y65.782 E.00467
G1 X95.92 Y65.811 E.00915
G1 X96.895 Y66.004 E.03551
G1 X97.8 Y66.26 E.03358
G1 X98.664 Y66.58 E.03293
G1 X99.985 Y67.219 E.05241
G1 X100.801 Y67.708 E.03399
G1 X101.575 Y68.263 E.03404
G1 X102.304 Y68.877 E.03407
G1 X102.975 Y69.538 E.03364
G1 X103.593 Y70.251 E.03368
G1 X104.16 Y71.019 E.03411
G1 X104.659 Y71.818 E.03366
G1 X105.098 Y72.663 E.03404
G1 X105.463 Y73.522 E.03332
G1 X105.763 Y74.416 E.03372
G1 X105.993 Y75.33 E.03367
G1 X106.149 Y76.266 E.0339
G1 X106.256 Y77.728 E.05238
G1 X106.268 Y78.396 E.02386
G1 X106.246 Y79.396 E.03574
G1 X106.152 Y80.338 E.03382
G1 X105.991 Y81.247 E.03298
G1 X105.754 Y82.161 E.03374
G1 X105.444 Y83.064 E.03411
G1 X105.07 Y83.926 E.03359
G1 X104.745 Y84.555 E.02528
G1 X104.235 Y85.402 E.03531
G1 X103.657 Y86.209 E.03546
G1 X103.057 Y86.92 E.03325
G1 X102.395 Y87.591 E.03368
G1 X101.677 Y88.213 E.03393
G1 X100.807 Y88.871 E.03898
G1 X100.753 Y88.882 E.00194
; WIPE_START
G1 X100.603 Y88.827 E-.06084
G1 X100.59 Y88.73 E-.03705
G1 X100.708 Y88.227 E-.19613
G1 X100.72 Y88.001 E-.08598
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.276 J1.185 P1  F42000
G1 X101.309 Y87.864 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X101.213 Y87.802 E.00409
G1 X101.192 Y87.723 E.00293
G1 X101.255 Y86.291 E.05121
G1 X101.008 Y84.482 E.0652
G1 X100.556 Y83.018 E.05475
G1 X99.802 Y81.49 E.06086
G1 X98.914 Y80.229 E.0551
G1 X98.781 Y80.079 E.00718
G1 X98.752 Y79.952 E.00464
G1 X98.908 Y79.295 E.02412
G1 X99.198 Y78.855 E.01882
G1 X99.807 Y77.58 E.05051
G1 X100.316 Y75.857 E.06419
G1 X100.502 Y73.963 E.06796
G1 X100.314 Y72.027 E.06951
G1 X99.56 Y69.761 E.08529
G1 X98.732 Y68.338 E.05884
G1 X97.725 Y67.128 E.05624
G1 X97.491 Y66.918 E.01124
G1 X97.446 Y66.813 E.00409
G1 X97.496 Y66.71 E.00409
G1 X97.62 Y66.684 E.00454
G1 X97.653 Y66.693 E.00121
G1 X98.49 Y67.004 E.03192
G1 X99.762 Y67.618 E.05044
G1 X100.545 Y68.088 E.03262
G1 X101.299 Y68.627 E.03312
G1 X101.992 Y69.212 E.0324
G1 X102.645 Y69.855 E.03275
G1 X103.239 Y70.541 E.03241
G1 X103.778 Y71.271 E.03244
G1 X104.264 Y72.049 E.03276
G1 X104.682 Y72.854 E.03239
G1 X105.037 Y73.689 E.03243
G1 X105.326 Y74.55 E.03245
G1 X105.546 Y75.429 E.03237
G1 X105.695 Y76.327 E.03252
G1 X105.799 Y77.745 E.05081
G1 X105.811 Y78.398 E.02332
G1 X105.789 Y79.363 E.0345
G1 X105.698 Y80.281 E.03294
G1 X105.543 Y81.155 E.03172
G1 X105.315 Y82.034 E.03246
G1 X105.015 Y82.903 E.03284
G1 X104.659 Y83.726 E.03204
G1 X104.344 Y84.336 E.02451
G1 X103.85 Y85.155 E.03417
G1 X103.299 Y85.923 E.03377
G1 X102.715 Y86.615 E.03235
G1 X102.078 Y87.261 E.03241
G1 X101.419 Y87.832 E.03117
G1 X101.366 Y87.847 E.00194
; WIPE_START
G1 X101.213 Y87.802 E-.06084
G1 X101.192 Y87.723 E-.03119
G1 X101.225 Y86.965 E-.28797
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.325 J1.173 P1  F42000
G1 X101.824 Y86.8 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X101.723 Y86.745 E.00409
G1 X101.696 Y86.66 E.00319
G1 X101.706 Y86.218 E.01579
G1 X101.462 Y84.431 E.06442
G1 X100.995 Y82.893 E.05743
G1 X100.217 Y81.297 E.06344
G1 X99.271 Y79.944 E.05898
G1 X99.25 Y79.834 E.00402
G1 X99.347 Y79.461 E.01377
G1 X99.614 Y79.044 E.01767
G1 X100.215 Y77.786 E.04982
G1 X100.751 Y75.998 E.0667
G1 X100.955 Y74.02 E.07102
G1 X100.77 Y71.99 E.07284
G1 X100.746 Y71.875 E.00419
G1 X99.998 Y69.63 E.08452
G1 X99.115 Y68.092 E.06338
G1 X99.105 Y67.978 E.00409
G1 X99.184 Y67.896 E.00409
G1 X99.294 Y67.9 E.00391
G1 X99.55 Y68.024 E.01016
G1 X100.299 Y68.473 E.0312
G1 X101.013 Y68.985 E.03141
G1 X101.68 Y69.546 E.03112
G1 X102.315 Y70.172 E.03185
G1 X102.885 Y70.831 E.03113
G1 X103.397 Y71.524 E.03078
G1 X103.869 Y72.281 E.03186
G1 X104.266 Y73.044 E.03073
G1 X104.607 Y73.846 E.03115
G1 X104.885 Y74.673 E.03117
G1 X105.097 Y75.517 E.03107
G1 X105.24 Y76.375 E.03108
G1 X105.343 Y77.77 E.04997
G1 X105.354 Y78.4 E.02249
G1 X105.332 Y79.341 E.03363
G1 X105.244 Y80.223 E.03168
G1 X105.094 Y81.062 E.03045
G1 X104.875 Y81.907 E.0312
G1 X104.59 Y82.733 E.03119
G1 X104.247 Y83.526 E.03087
G1 X103.942 Y84.116 E.02375
G1 X103.471 Y84.899 E.03264
G1 X102.942 Y85.638 E.03248
G1 X102.381 Y86.303 E.03107
G1 X101.931 Y86.759 E.0229
G1 X101.88 Y86.778 E.00194
; WIPE_START
G1 X101.723 Y86.745 E-.06084
G1 X101.696 Y86.66 E-.03398
G1 X101.706 Y86.218 E-.16791
G1 X101.664 Y85.912 E-.11727
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.414 J1.144 P1  F42000
G1 X102.219 Y85.711 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X102.115 Y85.665 E.00409
G1 X102.082 Y85.593 E.00279
G1 X101.896 Y84.289 E.04708
G1 X101.401 Y82.683 E.06003
G1 X100.632 Y81.106 E.06269
G1 X99.766 Y79.855 E.05437
G1 X99.746 Y79.742 E.00408
G1 X99.782 Y79.629 E.00425
G1 X100.03 Y79.234 E.01665
G1 X100.623 Y77.993 E.04916
G1 X101.185 Y76.141 E.06914
G1 X101.409 Y74.08 E.07405
G1 X101.215 Y71.888 E.07861
G1 X101.177 Y71.725 E.006
G1 X100.399 Y69.413 E.08714
G1 X100.412 Y69.299 E.00409
G1 X100.506 Y69.234 E.00409
G1 X100.609 Y69.258 E.0038
G1 X101.368 Y69.881 E.03506
G1 X101.984 Y70.489 E.03094
G1 X102.531 Y71.121 E.02986
G1 X103.015 Y71.777 E.02913
G1 X103.469 Y72.503 E.03057
G1 X103.85 Y73.234 E.02947
G1 X104.177 Y74.004 E.02988
G1 X104.444 Y74.797 E.0299
G1 X104.647 Y75.605 E.02977
G1 X104.786 Y76.436 E.0301
G1 X104.886 Y77.795 E.04868
G1 X104.897 Y78.401 E.02167
G1 X104.875 Y79.318 E.03275
G1 X104.79 Y80.165 E.03043
G1 X104.646 Y80.969 E.02918
G1 X104.438 Y81.77 E.02955
G1 X104.162 Y82.572 E.03031
G1 X103.836 Y83.325 E.02932
G1 X103.541 Y83.897 E.02298
G1 X103.085 Y84.652 E.03149
G1 X102.584 Y85.353 E.0308
G1 X102.323 Y85.663 E.01447
G1 X102.274 Y85.686 E.00194
; WIPE_START
G1 X102.115 Y85.665 E-.06084
G1 X102.082 Y85.593 E-.02972
G1 X101.975 Y84.839 E-.28945
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.539 J1.091 P1  F42000
G1 X102.538 Y84.561 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X102.427 Y84.53 E.00409
G1 X102.381 Y84.448 E.00337
G1 X102.331 Y84.146 E.01096
G1 X101.808 Y82.473 E.0626
G1 X101.047 Y80.915 E.06195
G1 X100.298 Y79.821 E.04735
G1 X100.294 Y79.672 E.00532
G1 X100.445 Y79.425 E.01033
G1 X101.063 Y78.116 E.05172
G1 X101.641 Y76.178 E.07225
G1 X101.863 Y74.027 E.07726
G1 X101.672 Y71.857 E.07782
G1 X101.608 Y71.572 E.01042
G1 X101.383 Y70.902 E.02527
G1 X101.395 Y70.788 E.00409
G1 X101.489 Y70.723 E.00409
G1 X101.609 Y70.761 E.00449
G1 X102.17 Y71.403 E.03048
G1 X102.64 Y72.039 E.02824
G1 X103.074 Y72.734 E.0293
G1 X103.438 Y73.435 E.0282
G1 X103.748 Y74.162 E.02823
G1 X104.004 Y74.921 E.02862
G1 X104.201 Y75.704 E.02885
G1 X104.332 Y76.497 E.02871
G1 X104.429 Y77.812 E.04712
G1 X104.439 Y78.403 E.02111
G1 X104.419 Y79.285 E.03151
G1 X104.338 Y80.097 E.02916
G1 X104.198 Y80.877 E.0283
G1 X104.002 Y81.633 E.0279
G1 X103.737 Y82.402 E.02906
G1 X103.421 Y83.134 E.02849
G1 X103.138 Y83.679 E.02192
G1 X102.633 Y84.498 E.03439
G1 X102.588 Y84.528 E.00194
; WIPE_START
G1 X102.427 Y84.53 E-.06084
G1 X102.381 Y84.448 E-.03586
G1 X102.331 Y84.146 E-.1166
G1 X102.2 Y83.727 E-.1667
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.647 J1.031 P1  F42000
G1 X102.712 Y83.405 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X102.599 Y83.383 E.00409
G1 X102.549 Y83.314 E.00305
G1 X102.214 Y82.264 E.03937
G1 X101.462 Y80.723 E.06125
G1 X100.842 Y79.806 E.03956
G1 X100.831 Y79.671 E.00484
G1 X101.504 Y78.237 E.05658
G1 X102.075 Y76.321 E.07144
G1 X102.316 Y74.086 E.0803
G1 X102.204 Y72.693 E.04994
G1 X102.243 Y72.585 E.00409
G1 X102.35 Y72.545 E.00409
G1 X102.457 Y72.609 E.00445
G1 X102.679 Y72.966 E.01502
G1 X103.026 Y73.635 E.02692
G1 X103.322 Y74.33 E.02698
G1 X103.566 Y75.055 E.02734
G1 X103.751 Y75.792 E.02714
G1 X103.877 Y76.545 E.02727
G1 X103.972 Y77.837 E.04628
G1 X103.982 Y78.404 E.02029
G1 X103.962 Y79.262 E.03064
G1 X103.885 Y80.029 E.02753
G1 X103.75 Y80.784 E.02742
G1 X103.562 Y81.506 E.02664
G1 X103.308 Y82.241 E.02781
G1 X103.005 Y82.942 E.02727
G1 X102.802 Y83.335 E.01581
G1 X102.759 Y83.368 E.00194
; WIPE_START
G1 X102.599 Y83.383 E-.06084
G1 X102.549 Y83.314 E-.03246
G1 X102.32 Y82.595 E-.28669
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.822 J.897 P1  F42000
G1 X102.806 Y82.149 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X102.692 Y82.143 E.00409
G1 X102.632 Y82.082 E.00306
G1 X101.877 Y80.531 E.06164
G1 X101.365 Y79.764 E.03293
G1 X101.355 Y79.63 E.00479
G1 X101.945 Y78.358 E.0501
G1 X102.51 Y76.463 E.07065
G1 X102.705 Y74.748 E.06167
G1 X102.764 Y74.65 E.00409
G1 X102.877 Y74.631 E.00409
G1 X102.971 Y74.719 E.00462
G1 X103.128 Y75.189 E.01769
G1 X103.302 Y75.88 E.02545
G1 X103.421 Y76.593 E.02583
G1 X103.515 Y77.854 E.04516
G1 X103.525 Y78.406 E.01973
G1 X103.505 Y79.239 E.02976
G1 X103.433 Y79.96 E.0259
G1 X103.304 Y80.681 E.02615
G1 X103.123 Y81.378 E.02576
G1 X102.885 Y82.067 E.02601
G1 X102.848 Y82.106 E.00194
; WIPE_START
G1 X102.692 Y82.143 E-.06085
G1 X102.632 Y82.082 E-.03255
G1 X102.302 Y81.404 E-.28661
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.927 J.789 P1  F42000
G1 X102.723 Y80.91 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S500
G1 X102.608 Y80.913 E.00409
G1 X102.54 Y80.848 E.00338
G1 X102.252 Y80.27 E.02306
G1 X101.888 Y79.724 E.02346
G1 X101.877 Y79.591 E.00477
G1 X102.386 Y78.48 E.04365
G1 X102.747 Y77.267 E.0452
G1 X102.823 Y77.181 E.00409
G1 X102.937 Y77.182 E.00409
G1 X103.015 Y77.296 E.00494
G1 X103.058 Y77.871 E.02059
G1 X103.068 Y78.408 E.01918
G1 X103.048 Y79.216 E.02888
G1 X102.98 Y79.892 E.02428
G1 X102.856 Y80.588 E.02526
G1 X102.795 Y80.821 E.00862
G1 X102.761 Y80.863 E.00194
; WIPE_START
G1 X102.608 Y80.913 E-.06084
G1 X102.54 Y80.848 E-.03594
G1 X102.252 Y80.27 E-.24527
G1 X102.197 Y80.187 E-.03795
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I.192 J-1.202 P1  F42000
G1 X91.19 Y78.425 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X91.19 Y78.875 E.01608
G1 X86.49 Y78.875 E.16791
G1 X86.49 Y107.175 E1.01104
G1 X91.19 Y107.175 E.16791
G1 X91.19 Y107.625 E.01608
G1 X91.711 Y107.625 E.01859
G1 X91.711 Y107.925 E.01072
G1 X87.446 Y107.925 E.15234
G3 X86.192 Y106.739 I-.005 J-1.251 E.06806
G1 X86.19 Y79.381 E.97739
G3 X87.378 Y78.126 I1.254 J-.002 E.06808
G1 X93.81 Y78.125 E.2298
G1 X93.81 Y78.425 E.01072
G1 X91.25 Y78.425 E.09146
; WIPE_START
G1 X91.19 Y78.875 E-.17251
G1 X90.644 Y78.875 E-.20749
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

G1 X90.961 Y78.5
G1 Z.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.333829
G1 F3000
M204 S500
G1 X87.395 Y78.5 E.08109
G2 X87.199 Y78.517 I.061 J1.945 E.00447
; LINE_WIDTH: 0.292621
G1 X86.803 Y78.577 E.00781
; WIPE_START
G1 X87.199 Y78.517 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I-1.217 J.018 P1  F42000
G1 X87.636 Y107.696 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.162114
G1 F3000
M204 S500
G1 X86.733 Y107.414 E.00881
M204 S6000
G1 X86.798 Y107.467 F42000
; LINE_WIDTH: 0.286638
G1 F3000
M204 S500
G1 X87.221 Y107.535 E.00816
; LINE_WIDTH: 0.335209
G2 X87.456 Y107.55 I.227 J-1.822 E.00537
G1 X90.961 Y107.55 E.0801
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X89.961 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 2/141
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I1.212 J-.104 P1  F42000
G1 X89.071 Y97.205 Z.6
G1 Z.36
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F854
M204 S6000
G3 X90.738 Y96.594 I1.838 J2.438 E.04344
G1 X90.757 Y96.174 E.01013
G3 X90.103 Y96.252 I.069 J3.351 E.492
G1 X90.699 Y96.172 E.01451
; WIPE_START
G1 F9000
G1 X91.237 Y96.196 E-.20465
G1 X91.689 Y96.291 E-.17535
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I1.189 J-.258 P1  F42000
G1 X89.125 Y84.487 Z.76
G1 Z.36
G1 E.4 F1800
G1 F854
M204 S6000
G3 X90.792 Y83.877 I1.838 J2.438 E.04344
G1 X90.811 Y83.457 E.01013
G3 X90.157 Y83.535 I.069 J3.351 E.492
G1 X90.753 Y83.455 E.01451
; WIPE_START
G1 F9000
G1 X91.291 Y83.479 E-.20465
G1 X91.743 Y83.574 E-.17535
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I1.183 J-.287 P1  F42000
G1 X88.963 Y72.125 Z.76
G1 Z.36
G1 E.4 F1800
G1 F854
M204 S6000
G1 X89.294 Y72.105 E.00802
G3 X90.766 Y71.628 I1.504 J2.133 E.03787
G1 X90.807 Y71.21 E.01013
G1 X91.153 Y71.245 E.00839
G3 X92.625 Y75.873 I-.32 J2.65 E.14711
G3 X89.103 Y76.118 I-1.956 J-2.677 E.08978
G3 X87.967 Y76.344 I-9.288 J-43.769 E.02793
G3 X86.198 Y75.903 I-.019 J-3.692 E.04442
G3 X87.115 Y71.692 I1.574 J-1.863 E.12743
G3 X88.682 Y71.721 I.734 J2.648 E.03834
G2 X89.692 Y71.415 I.174 J-1.245 E.02625
G3 X90.75 Y71.205 I1.057 J2.543 E.02618
; WIPE_START
G1 F9000
G1 X91.153 Y71.245 E-.15413
G1 X91.728 Y71.396 E-.22587
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.214 J-.086 P1  F42000
G1 X91.23 Y78.465 Z.76
G1 Z.36
G1 E.4 F1800
; FEATURE: Outer wall
G1 F854
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
M73 P7 R31
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.004 J-1.292 E.04739
G1 X86.15 Y79.38 E.6598
G3 X87.376 Y78.086 I1.292 J-.004 E.04743
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z.36
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46168
G1 F854
M204 S6000
G1 X87.395 Y78.5 E.09713
G2 X87.2 Y78.516 I.062 J1.958 E.00521
; LINE_WIDTH: 0.420573
G1 X86.678 Y78.596 E.01276
; WIPE_START
G1 F12621.787
G1 X87.2 Y78.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.76 I-1.217 J-.022 P1  F42000
G1 X86.666 Y107.441 Z.76
G1 Z.36
G1 E.4 F1800
; LINE_WIDTH: 0.409971
G1 F854
M204 S6000
G1 X87.186 Y107.531 E.01238
; LINE_WIDTH: 0.462776
G2 X87.456 Y107.55 I.28 J-2.077 E.00726
G1 X91.03 Y107.55 E.09575
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.492
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 3/141
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I1.212 J-.115 P1  F42000
G1 X89.056 Y97.305 Z.76
G1 Z.52
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F844
M204 S6000
G3 X90.675 Y96.673 I1.876 J2.42 E.0425
G1 X90.684 Y96.253 E.01013
G3 X90.037 Y96.347 I.143 J3.272 E.48049
G1 X90.627 Y96.252 E.01439
; WIPE_START
G1 F9000
G1 X91.223 Y96.266 E-.22673
G1 X91.618 Y96.348 E-.15327
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I1.19 J-.254 P1  F42000
G1 X89.11 Y84.588 Z.92
G1 Z.52
G1 E.4 F1800
G1 F844
M204 S6000
G3 X90.729 Y83.956 I1.876 J2.42 E.0425
G1 X90.738 Y83.536 E.01013
G3 X90.092 Y83.63 I.143 J3.272 E.48049
G1 X90.681 Y83.535 E.01439
; WIPE_START
G1 F9000
G1 X91.277 Y83.549 E-.22673
G1 X91.672 Y83.631 E-.15327
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I1.186 J-.274 P1  F42000
G1 X89.015 Y72.144 Z.92
G1 Z.52
G1 E.4 F1800
G1 F844
M204 S6000
G1 X89.281 Y72.133 E.00642
G3 X90.766 Y71.647 I1.526 J2.149 E.03825
G1 X90.808 Y71.229 E.01013
G3 X92.753 Y75.419 I.056 J2.52 E.14084
G3 X89.392 Y75.979 I-2.091 J-2.182 E.08728
G3 X87.969 Y76.35 I-5.45 J-18.018 E.03549
G3 X86.11 Y75.512 I-.07 J-2.325 E.0509
G3 X86.607 Y71.933 I1.519 J-1.613 E.10187
G3 X88.673 Y71.738 I1.252 J2.221 E.05153
G2 X89.698 Y71.433 I.197 J-1.211 E.02668
G3 X90.75 Y71.223 I1.051 J2.529 E.02605
; WIPE_START
G1 F9000
G1 X91.246 Y71.273 E-.18937
G1 X91.728 Y71.413 E-.19063
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.214 J-.086 P1  F42000
G1 X91.23 Y78.465 Z.92
G1 Z.52
G1 E.4 F1800
; FEATURE: Outer wall
G1 F844
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.446 Y107.965 E.10379
G3 X86.152 Y106.739 I-.002 J-1.294 E.0474
G1 X86.15 Y79.38 E.65978
G3 X87.376 Y78.086 I1.294 J-.001 E.0474
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z.52
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461687
G1 F844
M204 S6000
G1 X87.395 Y78.5 E.09714
G2 X87.201 Y78.516 I.063 J1.969 E.00519
; LINE_WIDTH: 0.420682
G1 X86.679 Y78.596 E.01277
; WIPE_START
G1 F12618.248
G1 X87.201 Y78.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.92 I-1.217 J-.022 P1  F42000
G1 X86.668 Y107.441 Z.92
G1 Z.52
G1 E.4 F1800
; LINE_WIDTH: 0.409962
G1 F844
M204 S6000
G1 X87.185 Y107.531 E.01233
; LINE_WIDTH: 0.462755
G2 X87.458 Y107.55 I.276 J-2.025 E.00732
G1 X91.03 Y107.55 E.09569
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.048
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 4/141
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S124.95
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I1.215 J-.068 P1  F42000
G1 X89.448 Y97.201 Z.92
G1 Z.68
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F832
M204 S6000
G3 X91.071 Y96.811 I1.453 J2.471 E.04086
G1 X91.131 Y96.395 E.01013
G3 X90.482 Y96.401 I-.297 J3.121 E.45934
G1 X91.074 Y96.387 E.01426
; WIPE_START
G1 F9000
G1 X91.651 Y96.482 E-.22225
G1 X92.041 Y96.625 E-.15775
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.191 J-.249 P1  F42000
G1 X89.502 Y84.484 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F832
M204 S6000
G3 X91.125 Y84.094 I1.453 J2.471 E.04086
G1 X91.185 Y83.678 E.01013
G3 X90.537 Y83.684 I-.297 J3.121 E.45934
G1 X91.128 Y83.67 E.01426
; WIPE_START
G1 F9000
M73 P8 R31
G1 X91.705 Y83.765 E-.22225
G1 X92.095 Y83.908 E-.15775
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I1.177 J-.308 P1  F42000
G1 X89.041 Y72.243 Z1.08
G1 Z.68
G1 E.4 F1800
G1 F832
M204 S6000
G1 X89.232 Y72.258 E.00463
G3 X90.743 Y71.706 I1.595 J2.023 E.03944
G1 X90.768 Y71.287 E.01013
G3 X92.899 Y74.964 I.056 J2.424 E.12496
G3 X90.868 Y76.221 I-2.484 J-1.745 E.05921
G3 X89.4 Y75.783 I-.017 J-2.62 E.03748
G3 X85.698 Y74.698 I-1.522 J-1.667 E.11155
G3 X88.106 Y71.67 I2.103 J-.799 E.1123
G2 X89.134 Y71.829 I1.074 J-3.56 E.02515
G3 X90.71 Y71.284 I1.728 J2.446 E.04076
; WIPE_START
G1 F9000
G1 X91.234 Y71.33 E-.19981
G1 X91.688 Y71.467 E-.18019
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-1.214 J-.079 P1  F42000
G1 X91.23 Y78.465 Z1.08
G1 Z.68
G1 E.4 F1800
; FEATURE: Outer wall
G1 F832
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.443 Y107.965 E.10387
G3 X86.152 Y106.739 I.001 J-1.294 E.04733
G1 X86.15 Y79.38 E.65979
G3 X87.376 Y78.086 I1.294 J-.001 E.04739
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z.68
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461458
G1 F832
M204 S6000
G1 X87.394 Y78.5 E.09709
G2 X87.177 Y78.52 I.064 J1.967 E.00582
; LINE_WIDTH: 0.412898
G1 X86.669 Y78.606 E.01222
; WIPE_START
G1 F12877.705
G1 X87.177 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.08 I-1.217 J-.021 P1  F42000
G1 X86.667 Y107.44 Z1.08
G1 Z.68
G1 E.4 F1800
; LINE_WIDTH: 0.408757
G1 F832
M204 S6000
G1 X87.176 Y107.529 E.01211
; LINE_WIDTH: 0.462056
G2 X87.402 Y107.549 I.3 J-2.151 E.00607
G1 X91.03 Y107.55 E.09701
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11397.66
G1 X90.03 Y107.549 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 5/141
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I1.215 J-.069 P1  F42000
G1 X89.451 Y97.356 Z1.08
G1 Z.84
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F820
M204 S6000
G3 X90.991 Y96.941 I1.449 J2.306 E.03904
G1 X91.051 Y96.525 E.01013
G1 X91.27 Y96.556 E.00536
G3 X89.865 Y96.679 I-.449 J2.972 E.42109
G3 X90.993 Y96.517 I.985 J2.847 E.02766
; WIPE_START
G1 F9000
G1 X91.27 Y96.556 E-.10639
G1 X91.965 Y96.748 E-.27361
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I1.193 J-.242 P1  F42000
G1 X89.505 Y84.639 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F820
M204 S6000
G3 X91.045 Y84.223 I1.448 J2.306 E.03904
G1 X91.105 Y83.808 E.01013
G1 X91.325 Y83.839 E.00536
G3 X89.919 Y83.962 I-.449 J2.972 E.42109
G3 X91.047 Y83.799 I.985 J2.847 E.02766
; WIPE_START
G1 F9000
G1 X91.325 Y83.839 E-.10639
G1 X92.019 Y84.031 E-.27361
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I1.179 J-.303 P1  F42000
G1 X89.001 Y72.298 Z1.24
G1 Z.84
G1 E.4 F1800
G1 F820
M204 S6000
G2 X89.802 Y72.016 I.158 J-.83 E.02145
G3 X90.669 Y71.795 I1.141 J2.664 E.02165
G1 X90.693 Y71.376 E.01013
G3 X92.755 Y74.968 I.11 J2.325 E.12313
G3 X89.655 Y75.954 I-2.01 J-.953 E.08798
G2 X88.797 Y76.202 I-.192 J.94 E.0224
M73 P8 R30
G3 X85.631 Y73.9 I-.916 J-2.067 E.11408
G3 X88.103 Y71.757 I2.204 J.044 E.08889
G2 X89.263 Y71.865 I.796 J-2.264 E.02838
G3 X90.636 Y71.372 I1.571 J2.219 E.03561
; WIPE_START
G1 F9000
G1 X91.111 Y71.401 E-.18096
G1 X91.617 Y71.534 E-.19904
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-1.215 J-.068 P1  F42000
G1 X91.23 Y78.465 Z1.24
G1 Z.84
G1 E.4 F1800
; FEATURE: Outer wall
G1 F820
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.739 I-.004 J-1.291 E.04742
G1 X86.15 Y79.38 E.65978
G3 X87.376 Y78.086 I1.292 J-.003 E.04742
G1 X93.85 Y78.085 E.15613
M73 P9 R30
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z.84
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461703
G1 F820
M204 S6000
G1 X87.394 Y78.5 E.09715
G2 X87.203 Y78.516 I.066 J2.003 E.00513
; LINE_WIDTH: 0.420899
G1 X86.679 Y78.596 E.01283
; WIPE_START
G1 F12611.159
G1 X87.203 Y78.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.24 I-1.217 J-.023 P1  F42000
G1 X86.658 Y107.432 Z1.24
G1 Z.84
G1 E.4 F1800
; LINE_WIDTH: 0.404031
G1 F820
M204 S6000
G2 X87.225 Y107.536 I1.556 J-6.877 E.01333
; LINE_WIDTH: 0.463116
G2 X87.456 Y107.55 I.226 J-1.878 E.00619
G1 X91.03 Y107.55 E.09582
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11369.467
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 6/141
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I1.215 J-.069 P1  F42000
G1 X89.463 Y97.504 Z1.24
G1 Z1
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F810
M204 S6000
G3 X90.936 Y97.073 I1.442 J2.191 E.03757
G1 X90.977 Y96.655 E.01013
G3 X90.641 Y96.663 I-.103 J2.875 E.42783
G1 X90.92 Y96.649 E.00674
; WIPE_START
G1 F9000
G1 X91.469 Y96.716 E-.21025
G1 X91.894 Y96.854 E-.16975
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.194 J-.235 P1  F42000
G1 X89.517 Y84.787 Z1.4
G1 Z1
G1 E.4 F1800
G1 F810
M204 S6000
G3 X90.99 Y84.356 I1.442 J2.191 E.03757
G1 X91.032 Y83.938 E.01013
G3 X90.695 Y83.945 I-.103 J2.875 E.42782
G1 X90.974 Y83.932 E.00675
; WIPE_START
G1 F9000
G1 X91.523 Y83.999 E-.21025
G1 X91.948 Y84.137 E-.16975
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.179 J-.3 P1  F42000
G1 X88.977 Y72.47 Z1.4
G1 Z1
G1 E.4 F1800
G1 F810
M204 S6000
G2 X90.172 Y71.976 I-1.453 J-5.207 E.03127
G3 X90.619 Y71.896 I.427 J1.093 E.01102
G1 X90.623 Y71.476 E.01013
G3 X92.955 Y74.144 I.169 J2.206 E.09911
G3 X89.79 Y76.046 I-2.211 J-.095 E.10532
G2 X88.794 Y76.245 I-.275 J1.215 E.02524
G3 X85.646 Y73.943 I-.909 J-2.06 E.11371
G3 X88.809 Y72.08 I2.2 J.118 E.10463
G2 X90.049 Y71.571 I-1.57 J-5.592 E.03238
G1 X90.565 Y71.475 E.01267
; WIPE_START
G1 F9000
G1 X91.076 Y71.493 E-.19414
G1 X91.549 Y71.615 E-.18586
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-1.216 J-.057 P1  F42000
G1 X91.23 Y78.465 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Outer wall
G1 F810
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.446 Y107.965 E.10379
G3 X86.152 Y106.74 I-.005 J-1.291 E.04741
G1 X86.15 Y79.38 E.6598
G3 X87.376 Y78.086 I1.291 J-.004 E.04743
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z1
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461455
G1 F810
M204 S6000
G1 X87.394 Y78.5 E.09709
G2 X87.177 Y78.52 I.066 J1.992 E.00582
; LINE_WIDTH: 0.413166
G1 X86.668 Y78.606 E.01222
; WIPE_START
G1 F12868.581
G1 X87.177 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z1.4
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.409998
G1 F810
M204 S6000
G1 X87.185 Y107.531 E.01238
; LINE_WIDTH: 0.462765
G2 X87.458 Y107.55 I.276 J-2.02 E.00732
G1 X91.03 Y107.55 E.09569
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.79
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 7/141
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I1.215 J-.073 P1  F42000
G1 X89.436 Y97.69 Z1.4
G1 Z1.16
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F798
M204 S6000
G3 X90.818 Y97.206 I1.479 J2.009 E.03585
G1 X90.84 Y96.787 E.01013
G3 X90.508 Y96.811 I.032 J2.739 E.40695
G1 X90.782 Y96.784 E.00663
; WIPE_START
G1 F9000
G1 X91.324 Y96.825 E-.2067
G1 X91.763 Y96.948 E-.1733
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.56 I1.196 J-.227 P1  F42000
G1 X89.49 Y84.973 Z1.56
G1 Z1.16
G1 E.4 F1800
G1 F798
M204 S6000
G3 X90.873 Y84.489 I1.479 J2.009 E.03585
G1 X90.894 Y84.07 E.01013
G3 X90.562 Y84.094 I.032 J2.739 E.40695
G1 X90.836 Y84.067 E.00663
; WIPE_START
G1 F9000
G1 X91.378 Y84.107 E-.20668
G1 X91.817 Y84.231 E-.17332
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.56 I1.182 J-.29 P1  F42000
G1 X88.952 Y72.562 Z1.56
G1 Z1.16
G1 E.4 F1800
G1 F798
M204 S6000
G2 X89.816 Y72.247 I.183 J-.841 E.0234
G3 X90.545 Y72.005 I1.142 J2.217 E.0186
G1 X90.547 Y71.585 E.01013
G3 X92.912 Y73.589 I.183 J2.182 E.08308
G3 X89.797 Y76.079 I-2.177 J.47 E.11912
G2 X88.785 Y76.271 I-.267 J1.353 E.02545
G3 X86.179 Y75.674 I-.866 J-2.209 E.06851
G3 X88.441 Y72.031 I1.717 J-1.458 E.13686
G2 X89.604 Y71.882 I.492 J-.773 E.03067
G3 X90.489 Y71.585 I1.148 J1.953 E.02267
; WIPE_START
G1 F9000
G1 X90.998 Y71.587 E-.19343
G1 X91.476 Y71.7 E-.18657
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.56 I-1.216 J-.044 P1  F42000
G1 X91.23 Y78.465 Z1.56
G1 Z1.16
G1 E.4 F1800
; FEATURE: Outer wall
G1 F798
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
M73 P10 R30
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.446 Y107.965 E.10379
G3 X86.152 Y106.74 I-.002 J-1.295 E.04738
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.291 J-.004 E.04739
G1 X93.85 Y78.085 E.15617
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z1.16
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461719
G1 F798
M204 S6000
G1 X87.389 Y78.5 E.09728
G2 X87.205 Y78.516 I.11 J2.449 E.00494
; LINE_WIDTH: 0.421174
G1 X86.679 Y78.596 E.01287
; WIPE_START
G1 F12602.169
G1 X87.205 Y78.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.56 I-1.217 J-.023 P1  F42000
G1 X86.666 Y107.441 Z1.56
G1 Z1.16
G1 E.4 F1800
; LINE_WIDTH: 0.409537
G1 F798
M204 S6000
G1 X87.185 Y107.531 E.01237
; LINE_WIDTH: 0.462765
G2 X87.458 Y107.55 I.276 J-2.021 E.00732
G1 X91.03 Y107.55 E.09569
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.781
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 8/141
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.56 I1.215 J-.071 P1  F42000
G1 X89.464 Y97.843 Z1.56
G1 Z1.32
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F787
M204 S6000
G3 X90.754 Y97.343 I1.45 J1.829 E.03388
G1 X90.776 Y96.924 E.01013
G1 X90.988 Y96.935 E.00513
G3 X89.701 Y97.184 I-.165 J2.594 E.36184
G3 X90.718 Y96.921 I1.149 J2.341 E.0255
; WIPE_START
G1 F9000
G1 X90.988 Y96.935 E-.10288
G1 X91.705 Y97.07 E-.27712
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.72 I1.197 J-.219 P1  F42000
G1 X89.518 Y85.126 Z1.72
G1 Z1.32
G1 E.4 F1800
G1 F787
M204 S6000
G3 X90.808 Y84.626 I1.45 J1.829 E.03388
G1 X90.83 Y84.207 E.01013
G1 X91.029 Y84.217 E.0048
G3 X89.755 Y84.467 I-.151 J2.595 E.36217
G3 X90.772 Y84.204 I1.149 J2.341 E.0255
; WIPE_START
G1 F9000
G1 X91.029 Y84.217 E-.09763
G1 X91.759 Y84.353 E-.28237
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.72 I1.191 J-.251 P1  F42000
G1 X89.287 Y72.618 Z1.72
G1 Z1.32
G1 E.4 F1800
G1 F787
M204 S6000
G3 X90.405 Y72.143 I11.864 J26.347 E.02928
G3 X90.889 Y72.118 I.492 J4.862 E.01169
G1 X90.973 Y71.707 E.01013
G3 X92.76 Y73.174 I-.4 J2.31 E.05831
G3 X91.63 Y76.094 I-2.013 J.9 E.08397
G3 X89.666 Y76.014 I-.886 J-2.402 E.04865
G2 X88.682 Y76.255 I-.193 J1.34 E.02504
G3 X86.188 Y75.717 I-.779 J-2.44 E.06441
G3 X88.966 Y72.286 I1.703 J-1.461 E.15042
G3 X90.299 Y71.736 I18.737 J43.585 E.03478
G3 X90.916 Y71.695 I.419 J1.632 E.015
; WIPE_START
G1 F9000
G1 X91.398 Y71.794 E-.18682
G1 X91.841 Y72.003 E-.18623
G1 X91.856 Y72.014 E-.00694
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.72 I-1.211 J-.117 P1  F42000
G1 X91.23 Y78.465 Z1.72
G1 Z1.32
G1 E.4 F1800
; FEATURE: Outer wall
G1 F787
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.738 I-.004 J-1.291 E.04746
G1 X86.15 Y79.38 E.65974
G3 X87.376 Y78.086 I1.294 J-.001 E.04739
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z1.32
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46145
G1 F787
M204 S6000
G1 X87.394 Y78.5 E.0971
G2 X87.177 Y78.52 I.068 J2.005 E.00583
; LINE_WIDTH: 0.413492
G1 X86.671 Y78.605 E.01215
; WIPE_START
G1 F12857.511
G1 X87.177 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.72 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z1.72
G1 Z1.32
G1 E.4 F1800
; LINE_WIDTH: 0.410401
G1 F787
M204 S6000
G1 X87.188 Y107.531 E.01245
; LINE_WIDTH: 0.462758
G2 X87.456 Y107.55 I.312 J-2.596 E.00719
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.967
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 9/141
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.72 I1.215 J-.069 P1  F42000
G1 X89.487 Y97.979 Z1.72
G1 Z1.48
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F778
M204 S6000
G3 X90.705 Y97.465 I1.431 J1.689 E.03238
G1 X90.716 Y97.045 E.01013
G3 X93.315 Y99.781 I.123 J2.485 E.1033
G3 X90.658 Y97.043 I-2.469 J-.262 E.27132
; WIPE_START
G1 F9000
M73 P11 R30
G1 X91.17 Y97.056 E-.19456
G1 X91.645 Y97.168 E-.18544
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.88 I1.198 J-.212 P1  F42000
G1 X89.537 Y85.256 Z1.88
G1 Z1.48
G1 E.4 F1800
G1 F778
M204 S6000
G3 X90.759 Y84.741 I1.435 J1.696 E.03247
G1 X90.769 Y84.321 E.01013
G3 X93.376 Y87.064 I.124 J2.492 E.10358
G3 X90.711 Y84.319 I-2.476 J-.262 E.27209
; WIPE_START
G1 F9000
G1 X91.225 Y84.332 E-.19513
G1 X91.698 Y84.444 E-.18487
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.88 I1.192 J-.246 P1  F42000
G1 X89.278 Y72.709 Z1.88
G1 Z1.48
G1 E.4 F1800
G1 F778
M204 S6000
G2 X90.105 Y72.368 I.02 J-1.127 E.02218
G3 X90.859 Y72.242 I.739 J2.098 E.01853
G1 X90.942 Y71.83 E.01013
G3 X92.641 Y75.248 I-.347 J2.303 E.10785
G3 X90.204 Y76.173 I-1.885 J-1.294 E.0669
G2 X88.638 Y76.216 I-.749 J1.234 E.03993
G3 X85.932 Y75.333 I-.734 J-2.339 E.07322
G3 X88.956 Y72.328 I1.954 J-1.058 E.13768
G2 X89.934 Y71.981 I.089 J-1.305 E.02574
G3 X90.885 Y71.819 I.797 J1.801 E.02352
; WIPE_START
G1 F9000
G1 X91.36 Y71.916 E-.18424
G1 X91.8 Y72.129 E-.18533
G1 X91.821 Y72.145 E-.01043
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.88 I-1.212 J-.113 P1  F42000
G1 X91.23 Y78.465 Z1.88
G1 Z1.48
G1 E.4 F1800
; FEATURE: Outer wall
G1 F778
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.377 E.65986
G3 X87.376 Y78.086 I1.292 J-.001 E.04735
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z1.48
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461453
G1 F778
M204 S6000
G1 X87.394 Y78.5 E.09711
G2 X87.177 Y78.52 I.069 J2.017 E.00582
; LINE_WIDTH: 0.413714
G1 X86.669 Y78.605 E.0122
; WIPE_START
G1 F12850
G1 X87.177 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.88 I-1.217 J-.022 P1  F42000
G1 X86.665 Y107.44 Z1.88
G1 Z1.48
G1 E.4 F1800
; LINE_WIDTH: 0.408511
G1 F778
M204 S6000
G1 X87.175 Y107.529 E.01209
; LINE_WIDTH: 0.462676
G2 X87.456 Y107.55 I.308 J-2.288 E.00755
G1 X91.03 Y107.55 E.09573
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11381.156
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 10/141
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.88 I1.217 J-.027 P1  F42000
G1 X89.812 Y97.808 Z1.88
G1 Z1.64
M73 P11 R29
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F774
M204 S6000
G3 X91.074 Y97.528 I1.079 J1.885 E.03165
G1 X91.161 Y97.118 E.01013
G1 X91.354 Y97.159 E.00476
G3 X90.098 Y97.211 I-.53 J2.367 E.33688
G3 X91.104 Y97.106 I.752 J2.315 E.02458
; WIPE_START
G1 F9000
G1 X91.354 Y97.159 E-.09692
G1 X92.054 Y97.413 E-.28308
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I1.198 J-.213 P1  F42000
G1 X89.86 Y85.078 Z2.04
G1 Z1.64
G1 E.4 F1800
G1 F774
M204 S6000
G3 X91.129 Y84.797 I1.086 J1.901 E.03183
G1 X91.216 Y84.387 E.01013
G1 X91.409 Y84.428 E.00476
G3 X90.148 Y84.481 I-.531 J2.381 E.33885
G3 X91.16 Y84.374 I.756 J2.328 E.02472
; WIPE_START
G1 F9000
G1 X91.409 Y84.428 E-.09694
G1 X92.109 Y84.682 E-.28306
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I1.184 J-.282 P1  F42000
G1 X89.278 Y72.796 Z2.04
G1 Z1.64
G1 E.4 F1800
G1 F774
M204 S6000
G2 X90.117 Y72.473 I-.099 J-1.51 E.02203
G3 X90.873 Y72.353 I.745 J2.248 E.01852
G1 X90.946 Y71.939 E.01013
G1 X91.236 Y71.991 E.00711
G3 X92.842 Y74.769 I-.546 J2.169 E.0863
G3 X91.559 Y76.13 I-2.86 J-1.41 E.04579
G3 X89.649 Y75.923 I-.769 J-1.817 E.04839
G1 X89.103 Y75.922 E.01318
G3 X86.495 Y75.781 I-1.229 J-1.449 E.06942
G3 X85.785 Y74.944 I2.003 J-2.42 E.02661
G3 X89.017 Y72.42 I2.094 J-.65 E.12783
G2 X89.958 Y72.082 I-.073 J-1.679 E.02447
G3 X90.889 Y71.929 I.798 J1.952 E.02295
; WIPE_START
G1 F9000
G1 X91.236 Y71.991 E-.13402
G1 X91.798 Y72.198 E-.22745
G1 X91.837 Y72.227 E-.01853
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I-1.211 J-.118 P1  F42000
G1 X91.23 Y78.465 Z2.04
G1 Z1.64
G1 E.4 F1800
; FEATURE: Outer wall
G1 F774
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.446 Y107.965 E.10379
G3 X86.152 Y106.74 I-.002 J-1.295 E.04738
G1 X86.15 Y79.38 E.6598
M73 P12 R29
G3 X87.375 Y78.086 I1.294 J-.001 E.04739
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z1.64
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461449
G1 F774
M204 S6000
G1 X87.394 Y78.5 E.09711
G2 X87.176 Y78.52 I.07 J2.026 E.00583
; LINE_WIDTH: 0.413857
G1 X86.671 Y78.605 E.01216
; WIPE_START
G1 F12845.148
G1 X87.176 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.04 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z2.04
G1 Z1.64
G1 E.4 F1800
; LINE_WIDTH: 0.409781
G1 F774
M204 S6000
G1 X87.186 Y107.531 E.01237
; LINE_WIDTH: 0.462764
G2 X87.458 Y107.55 I.275 J-2.01 E.00733
G1 X91.03 Y107.55 E.09568
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.807
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 11/141
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.04 I1.217 J-.027 P1  F42000
G1 X89.817 Y97.821 Z2.04
G1 Z1.8
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F772
M204 S6000
G3 X91.072 Y97.542 I1.073 J1.868 E.03148
G1 X91.16 Y97.131 E.01013
G1 X91.35 Y97.172 E.00469
G3 X90.102 Y97.225 I-.525 J2.354 E.33497
G3 X91.103 Y97.119 I.748 J2.301 E.02444
; WIPE_START
G1 F9000
G1 X91.35 Y97.172 E-.09581
G1 X92.052 Y97.428 E-.28419
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.198 J-.212 P1  F42000
G1 X89.866 Y85.091 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F772
M204 S6000
G3 X91.128 Y84.811 I1.079 J1.884 E.03165
G1 X91.215 Y84.4 E.01013
G1 X91.408 Y84.441 E.00476
G3 X90.152 Y84.494 I-.53 J2.364 E.33648
G3 X91.158 Y84.388 I.752 J2.314 E.02458
; WIPE_START
G1 F9000
G1 X91.408 Y84.441 E-.09696
G1 X92.108 Y84.696 E-.28304
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.185 J-.276 P1  F42000
G1 X89.342 Y72.82 Z2.2
G1 Z1.8
G1 E.4 F1800
G1 F772
M204 S6000
G1 X89.607 Y72.806 E.0064
G3 X90.922 Y72.409 I1.178 J1.528 E.03387
G1 X90.996 Y71.996 E.01013
G3 X92.91 Y74.293 I-.301 J2.197 E.07914
G3 X91.798 Y76.047 I-3.013 J-.681 E.05107
G3 X89.707 Y76.014 I-1.016 J-1.948 E.05256
G2 X88.79 Y76.178 I-.251 J1.246 E.02301
G3 X86.195 Y75.378 I-.939 J-1.563 E.07386
G3 X85.997 Y73.254 I1.211 J-1.184 E.05567
G3 X88.879 Y72.402 I1.868 J1.018 E.08048
G2 X89.966 Y72.129 I.197 J-1.518 E.02767
G3 X90.939 Y71.985 I.773 J1.873 E.02395
; WIPE_START
G1 F9000
G1 X91.359 Y72.061 E-.16199
G1 X91.797 Y72.248 E-.18093
G1 X91.876 Y72.305 E-.03708
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.21 J-.127 P1  F42000
G1 X91.23 Y78.465 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Outer wall
G1 F772
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.446 Y107.965 E.10379
G3 X86.152 Y106.74 I-.002 J-1.295 E.04738
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.291 J-.004 E.04743
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z1.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461446
G1 F772
M204 S6000
G1 X87.394 Y78.5 E.09711
G2 X87.176 Y78.52 I.071 J2.035 E.00583
; LINE_WIDTH: 0.414013
G1 X86.669 Y78.605 E.0122
; WIPE_START
G1 F12839.881
G1 X87.176 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.217 J-.021 P1  F42000
G1 X86.665 Y107.44 Z2.2
G1 Z1.8
G1 E.4 F1800
; LINE_WIDTH: 0.407741
G1 F772
M204 S6000
G1 X87.171 Y107.529 E.01199
; LINE_WIDTH: 0.462607
G2 X87.458 Y107.55 I.288 J-1.956 E.00771
G1 X91.03 Y107.55 E.09564
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11382.979
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 12/141
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I1.217 J-.026 P1  F42000
G1 X89.823 Y97.834 Z2.2
G1 Z1.96
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F770
M204 S6000
G3 X91.071 Y97.556 I1.067 J1.852 E.0313
G1 X91.158 Y97.145 E.01013
G1 X91.348 Y97.186 E.00469
G3 X90.107 Y97.238 I-.524 J2.337 E.33261
G3 X91.101 Y97.133 I.743 J2.288 E.0243
; WIPE_START
G1 F9000
G1 X91.348 Y97.186 E-.09581
G1 X92.051 Y97.442 E-.28419
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I1.198 J-.212 P1  F42000
G1 X89.871 Y85.104 Z2.36
G1 Z1.96
G1 E.4 F1800
G1 F770
M204 S6000
G3 X91.126 Y84.825 I1.073 J1.868 E.03148
G1 X91.214 Y84.414 E.01013
G1 X91.404 Y84.455 E.00468
G3 X90.156 Y84.507 I-.525 J2.354 E.33498
G3 X91.157 Y84.402 I.748 J2.301 E.02444
; WIPE_START
G1 F9000
G1 X91.404 Y84.455 E-.09579
G1 X92.106 Y84.711 E-.28421
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I1.185 J-.279 P1  F42000
G1 X89.324 Y72.898 Z2.36
G1 Z1.96
M73 P13 R29
G1 E.4 F1800
G1 F770
M204 S6000
G1 X89.589 Y72.886 E.00639
G3 X90.88 Y72.454 I1.216 J1.486 E.03355
G1 X90.954 Y72.04 E.01013
G1 X91.031 Y72.054 E.00189
G3 X92.859 Y73.804 I-.311 J2.154 E.06511
G3 X92.52 Y75.326 I-3.992 J-.089 E.03784
G3 X90.217 Y76.251 I-1.741 J-1.005 E.06451
G1 X89.535 Y75.966 E.01783
G1 X89.008 Y76.051 E.01287
G3 X86.043 Y74.993 I-1.162 J-1.427 E.09108
G3 X86.302 Y72.897 I1.407 J-.89 E.05517
G3 X88.95 Y72.494 I1.568 J1.397 E.07005
G2 X89.977 Y72.181 I.209 J-1.153 E.0269
G3 X90.897 Y72.03 I.784 J1.907 E.02268
; WIPE_START
G1 F9000
G1 X91.031 Y72.054 E-.05172
G1 X91.361 Y72.114 E-.12731
G1 X91.787 Y72.297 E-.17619
G1 X91.84 Y72.335 E-.02478
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-1.211 J-.121 P1  F42000
G1 X91.23 Y78.465 Z2.36
G1 Z1.96
G1 E.4 F1800
; FEATURE: Outer wall
G1 F770
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.003 J-1.292 E.04739
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.291 J-.004 E.04742
G1 X93.85 Y78.085 E.15614
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z1.96
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461445
G1 F770
M204 S6000
G1 X87.393 Y78.5 E.09711
G2 X87.176 Y78.52 I.072 J2.046 E.00583
; LINE_WIDTH: 0.41415
G1 X86.669 Y78.605 E.0122
; WIPE_START
G1 F12835.233
G1 X87.176 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.36 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z2.36
G1 Z1.96
G1 E.4 F1800
; LINE_WIDTH: 0.409587
G1 F770
M204 S6000
G1 X87.183 Y107.53 E.01231
; LINE_WIDTH: 0.462729
G2 X87.456 Y107.55 I.268 J-1.87 E.00733
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.741
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 13/141
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.36 I1.217 J-.025 P1  F42000
G1 X89.829 Y97.847 Z2.36
G1 Z2.12
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F666
M204 S6000
G3 X91.069 Y97.57 I1.061 J1.836 E.03112
G1 X91.157 Y97.159 E.01013
G1 X91.345 Y97.199 E.00465
G3 X90.111 Y97.251 I-.521 J2.324 E.33067
G3 X91.1 Y97.147 I.739 J2.274 E.02416
; WIPE_START
G1 F9000
G1 X91.345 Y97.199 E-.09532
G1 X92.046 Y97.455 E-.28326
G1 X92.049 Y97.457 E-.00142
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I1.199 J-.211 P1  F42000
G1 X89.877 Y85.117 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F666
M204 S6000
G3 X91.125 Y84.839 I1.067 J1.852 E.0313
G1 X91.212 Y84.428 E.01013
G1 X91.403 Y84.469 E.0047
G3 X90.161 Y84.521 I-.524 J2.337 E.3326
G3 X91.156 Y84.416 I.743 J2.288 E.0243
; WIPE_START
G1 F9000
G1 X91.403 Y84.469 E-.09597
G1 X92.105 Y84.725 E-.28403
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I1.184 J-.279 P1  F42000
G1 X89.343 Y73.013 Z2.52
G1 Z2.12
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X89.486 Y73.033 E.00348
G3 X90.857 Y72.508 I1.359 J1.497 E.03621
G1 X90.912 Y72.092 E.01013
G3 X92.698 Y73.378 I-.2 J2.161 E.05567
G3 X92.704 Y74.856 I-3.315 J.752 E.03593
G3 X89.635 Y76.008 I-1.964 J-.569 E.0917
G1 X89.1 Y75.996 E.01288
G3 X85.993 Y74.621 I-1.234 J-1.409 E.10261
G3 X86.584 Y72.702 I1.456 J-.602 E.05249
G3 X88.875 Y72.523 I1.283 J1.663 E.05864
G1 X89.393 Y72.595 E.01262
G3 X90.855 Y72.084 I1.47 J1.857 E.03805
M106 S124.95
; WIPE_START
G1 X91.303 Y72.154 E-.17237
G1 X91.727 Y72.321 E-.17328
G1 X91.802 Y72.373 E-.03434
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I-1.212 J-.114 P1  F42000
G1 X91.23 Y78.465 Z2.52
G1 Z2.12
G1 E.4 F1800
; FEATURE: Outer wall
G1 F666
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.001 J-1.295 E.04737
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.291 J-.004 E.04742
G1 X93.85 Y78.085 E.15614
M73 P14 R29
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z2.12
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46177
G1 F666
M204 S6000
G1 X87.393 Y78.5 E.09719
G2 X87.211 Y78.515 I.078 J2.141 E.00488
; LINE_WIDTH: 0.421768
G1 X86.68 Y78.595 E.01302
; WIPE_START
G1 F12582.873
G1 X87.211 Y78.515 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.52 I-1.217 J-.023 P1  F42000
G1 X86.665 Y107.44 Z2.52
G1 Z2.12
G1 E.4 F1800
; LINE_WIDTH: 0.408225
G1 F666
M204 S6000
G1 X87.173 Y107.529 E.01205
; LINE_WIDTH: 0.462657
G2 X87.456 Y107.55 I.309 J-2.27 E.0076
G1 X91.03 Y107.55 E.09572
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11381.662
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 14/141
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.52 I1.217 J-.024 P1  F42000
G1 X89.835 Y97.86 Z2.52
G1 Z2.28
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F665
M204 S6000
G3 X91.068 Y97.584 I1.054 J1.82 E.03095
G1 X91.155 Y97.173 E.01013
G1 X91.34 Y97.213 E.00456
G3 X90.115 Y97.265 I-.516 J2.313 E.32918
G3 X91.099 Y97.161 I.735 J2.261 E.02402
; WIPE_START
G1 F9000
G1 X91.34 Y97.213 E-.09391
G1 X92.039 Y97.467 E-.28244
G1 X92.047 Y97.472 E-.00365
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I1.192 J-.245 P1  F42000
G1 X89.556 Y85.379 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F665
M204 S6000
G3 X90.712 Y84.85 I1.419 J1.575 E.03112
G1 X90.712 Y84.43 E.01013
G3 X90.165 Y84.534 I.169 J2.381 E.3482
G1 X90.654 Y84.43 E.01206
; WIPE_START
G1 F9000
G1 X91.154 Y84.43 E-.18999
G1 X91.643 Y84.534 E-.18999
G1 X91.643 Y84.534 E-.00003
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I1.192 J-.243 P1  F42000
G1 X89.303 Y73.07 Z2.68
G1 Z2.28
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X89.508 Y73.094 E.00498
G3 X90.792 Y72.565 I1.346 J1.443 E.03424
G1 X90.847 Y72.148 E.01013
G1 X91.102 Y72.182 E.00621
G3 X92.419 Y72.989 I-.38 J2.099 E.03813
G1 X92.722 Y73.944 E.02414
G3 X89.505 Y75.841 I-1.94 J.386 E.11775
G2 X88.456 Y76.377 I9.198 J19.293 E.02842
G3 X86.029 Y74.26 I-.589 J-1.774 E.09358
G3 X86.938 Y72.543 I1.463 J-.324 E.05096
G3 X88.882 Y72.597 I.921 J1.853 E.04881
G1 X89.404 Y72.659 E.01267
G3 X90.789 Y72.141 I1.464 J1.803 E.0363
M106 S124.95
; WIPE_START
G1 X91.102 Y72.182 E-.11977
G1 X91.72 Y72.378 E-.24631
G1 X91.75 Y72.399 E-.01392
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I-1.213 J-.104 P1  F42000
G1 X91.23 Y78.465 Z2.68
G1 Z2.28
G1 E.4 F1800
; FEATURE: Outer wall
G1 F665
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.446 Y107.965 E.10378
G3 X86.152 Y106.74 I-.002 J-1.295 E.04739
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.291 J-.004 E.04742
G1 X93.85 Y78.085 E.15614
M73 P14 R28
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z2.28
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461776
G1 F665
M204 S6000
G1 X87.393 Y78.5 E.0972
G2 X87.212 Y78.515 I.08 J2.17 E.00485
; LINE_WIDTH: 0.421894
G1 X86.68 Y78.595 E.01305
; WIPE_START
G1 F12578.785
G1 X87.212 Y78.515 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.68 I-1.217 J-.023 P1  F42000
G1 X86.666 Y107.441 Z2.68
G1 Z2.28
G1 E.4 F1800
; LINE_WIDTH: 0.40954
G1 F665
M204 S6000
G1 X87.185 Y107.531 E.01237
; LINE_WIDTH: 0.462762
G2 X87.458 Y107.55 I.275 J-2.008 E.00733
G1 X91.03 Y107.55 E.09567
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.86
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 15/141
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.68 I1.217 J-.024 P1  F42000
G1 X89.841 Y97.873 Z2.68
G1 Z2.44
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F664
M204 S6000
G3 X91.066 Y97.598 I1.048 J1.803 E.03077
G1 X91.154 Y97.187 E.01013
G1 X91.34 Y97.227 E.00461
G3 X90.12 Y97.278 I-.516 J2.296 E.32677
G3 X91.097 Y97.175 I.73 J2.248 E.02387
; WIPE_START
G1 F9000
G1 X91.34 Y97.227 E-.09456
G1 X92.032 Y97.479 E-.2796
G1 X92.044 Y97.488 E-.00584
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I1.199 J-.209 P1  F42000
G1 X89.889 Y85.143 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F664
M204 S6000
G3 X91.122 Y84.867 I1.054 J1.82 E.03095
G1 X91.209 Y84.456 E.01013
G1 X91.394 Y84.495 E.00456
G3 X90.169 Y84.547 I-.515 J2.313 E.32918
G3 X91.153 Y84.444 I.735 J2.261 E.02402
; WIPE_START
G1 F9000
G1 X91.394 Y84.495 E-.09382
G1 X92.093 Y84.75 E-.28254
G1 X92.101 Y84.755 E-.00364
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I1.183 J-.284 P1  F42000
G1 X89.314 Y73.161 Z2.84
G1 Z2.44
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.416 Y72.667 I-70.009 J-157.343 E.02912
G3 X90.796 Y72.627 I.271 J.752 E.00932
G1 X90.852 Y72.21 E.01013
G1 X91.142 Y72.249 E.00707
G3 X92.324 Y73.121 I-.264 J1.596 E.03677
G3 X90.166 Y76.2 I-1.57 J1.196 E.12017
G1 X89.563 Y75.937 E.01587
G1 X89.032 Y76.031 E.01299
G3 X86.15 Y73.908 I-1.184 J-1.41 E.11844
G3 X87.381 Y72.447 I1.446 J-.03 E.05031
G3 X89.06 Y72.809 I.475 J1.872 E.04292
G3 X90.32 Y72.255 I102.938 J232.421 E.03319
G1 X90.794 Y72.203 E.01152
M106 S124.95
; WIPE_START
G1 X91.142 Y72.249 E-.13335
G1 X91.719 Y72.44 E-.23078
G1 X91.753 Y72.464 E-.01588
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-1.212 J-.106 P1  F42000
G1 X91.23 Y78.465 Z2.84
G1 Z2.44
G1 E.4 F1800
; FEATURE: Outer wall
G1 F664
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
M73 P15 R28
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.446 Y107.965 E.10379
G3 X86.152 Y106.74 I-.003 J-1.294 E.04739
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.294 J-.001 E.04739
G1 X93.85 Y78.085 E.15614
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z2.44
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46144
G1 F664
M204 S6000
G1 X87.393 Y78.5 E.09712
G2 X87.176 Y78.52 I.076 J2.086 E.00583
; LINE_WIDTH: 0.414654
G1 X86.672 Y78.604 E.01214
; WIPE_START
G1 F12818.245
G1 X87.176 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.84 I-1.217 J-.021 P1  F42000
G1 X86.667 Y107.441 Z2.84
G1 Z2.44
G1 E.4 F1800
; LINE_WIDTH: 0.409545
G1 F664
M204 S6000
G1 X87.185 Y107.531 E.01233
; LINE_WIDTH: 0.462762
G2 X87.458 Y107.55 I.275 J-2.009 E.00733
G1 X91.03 Y107.55 E.09568
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.876
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 16/141
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.84 I1.217 J-.028 P1  F42000
G1 X89.811 Y97.907 Z2.84
G1 Z2.6
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F663
M204 S6000
G3 X91.028 Y97.608 I1.088 J1.804 E.03069
G1 X91.096 Y97.194 E.01013
G3 X90.538 Y97.198 I-.261 J2.328 E.34151
G1 X91.039 Y97.184 E.0121
; WIPE_START
G1 F9000
G1 X91.525 Y97.276 E-.18791
G1 X91.988 Y97.471 E-.19077
G1 X91.991 Y97.473 E-.00132
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.193 J-.239 P1  F42000
G1 X89.573 Y85.402 Z3
G1 Z2.6
G1 E.4 F1800
G1 F663
M204 S6000
G3 X90.715 Y84.878 I1.4 J1.546 E.03077
G1 X90.715 Y84.458 E.01013
G1 X90.902 Y84.458 E.00451
G3 X89.722 Y84.762 I-.022 J2.357 E.3274
G3 X90.657 Y84.458 I1.182 J2.047 E.02388
; WIPE_START
G1 F9000
G1 X90.902 Y84.458 E-.09301
G1 X91.634 Y84.561 E-.28114
G1 X91.649 Y84.567 E-.00586
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.185 J-.279 P1  F42000
G1 X88.994 Y73.283 Z3
G1 Z2.6
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.429 Y72.757 I-.323 J-3.101 E.03723
G1 X90.78 Y72.712 E.00854
G1 X90.838 Y72.296 E.01013
G3 X92.694 Y74.512 I-.342 J2.172 E.07605
G3 X89.683 Y75.907 I-1.936 J-.231 E.09573
G2 X88.694 Y76.235 I-.217 J1 E.02636
G3 X87.986 Y76.498 I-1.17 J-2.059 E.01828
G3 X86.266 Y75.516 I.152 J-2.265 E.04945
G3 X86.372 Y73.565 I1.625 J-.89 E.04963
G3 X87.851 Y72.461 I1.361 J.281 E.04869
G3 X89.022 Y72.861 I-.067 J2.107 E.03027
G2 X90.028 Y72.475 I.045 J-1.386 E.0267
G3 X90.781 Y72.288 I.692 J1.184 E.01896
M106 S124.95
; WIPE_START
G1 X91.201 Y72.366 E-.16242
G1 X91.579 Y72.555 E-.16042
G1 X91.703 Y72.64 E-.05716
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-1.213 J-.098 P1  F42000
G1 X91.23 Y78.465 Z3
G1 Z2.6
G1 E.4 F1800
; FEATURE: Outer wall
G1 F663
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.446 Y107.965 E.10378
G3 X86.152 Y106.74 I-.005 J-1.291 E.04742
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.291 J-.004 E.04739
G1 X93.85 Y78.085 E.15617
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z2.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461791
G1 F663
M204 S6000
G1 X87.389 Y78.5 E.0973
G2 X87.214 Y78.514 I.117 J2.566 E.00469
; LINE_WIDTH: 0.422111
G1 X86.68 Y78.595 E.0131
; WIPE_START
G1 F12571.735
G1 X87.214 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I-1.217 J-.023 P1  F42000
G1 X86.666 Y107.441 Z3
G1 Z2.6
G1 E.4 F1800
; LINE_WIDTH: 0.40997
G1 F663
M204 S6000
G1 X87.186 Y107.531 E.01238
; LINE_WIDTH: 0.462772
G2 X87.458 Y107.55 I.275 J-2.005 E.00733
G1 X91.03 Y107.55 E.09568
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.615
G1 X90.03 Y107.55 E-.38
; WIPE_END
M73 P16 R28
G1 E-.02 F1800
; layer num/total_layer_count: 17/141
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I1.217 J-.033 P1  F42000
G1 X89.769 Y97.949 Z3
G1 Z2.76
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F662
M204 S6000
G3 X90.966 Y97.617 I1.135 J1.775 E.03039
G1 X91.033 Y97.203 E.01013
G1 X91.228 Y97.235 E.00476
G3 X89.985 Y97.356 I-.404 J2.294 E.32237
G3 X90.976 Y97.194 I.864 J2.17 E.02441
; WIPE_START
G1 F9000
G1 X91.228 Y97.235 E-.09698
G1 X91.938 Y97.46 E-.28302
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I1.2 J-.203 P1  F42000
G1 X89.865 Y85.19 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F662
M204 S6000
G3 X91.083 Y84.891 I1.088 J1.803 E.0307
G1 X91.151 Y84.477 E.01013
G3 X90.592 Y84.481 I-.261 J2.328 E.34151
G1 X91.094 Y84.467 E.0121
; WIPE_START
G1 F9000
G1 X91.58 Y84.559 E-.18785
G1 X92.042 Y84.754 E-.19071
G1 X92.045 Y84.756 E-.00144
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I1.184 J-.28 P1  F42000
G1 X89.377 Y73.458 Z3.16
G1 Z2.76
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X89.56 Y73.472 E.00442
G3 X90.818 Y72.894 I1.239 J1.04 E.0345
G1 X90.83 Y72.474 E.01013
G3 X90.35 Y76.157 I-.035 J1.868 E.15151
G3 X89.359 Y75.608 I.674 J-2.389 E.02757
G1 X89.068 Y76.026 E.01228
G2 X88.532 Y76.385 I.244 J.943 E.01587
G3 X87.351 Y76.331 I-.551 J-.879 E.03032
G3 X86.743 Y73.233 I.519 J-1.711 E.0933
G3 X88.859 Y72.997 I1.151 J.719 E.05902
G1 X89.43 Y73.041 E.01382
G3 X90.772 Y72.472 I1.359 J1.342 E.03606
M106 S124.95
; WIPE_START
G1 X91.057 Y72.48 E-.10849
G1 X91.581 Y72.647 E-.20884
G1 X91.721 Y72.734 E-.06266
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-1.213 J-.104 P1  F42000
G1 X91.23 Y78.465 Z3.16
G1 Z2.76
G1 E.4 F1800
; FEATURE: Outer wall
G1 F662
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.001 J-1.295 E.04737
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.294 J-.001 E.04739
G1 X93.85 Y78.085 E.15614
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z2.76
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461437
G1 F662
M204 S6000
G1 X87.393 Y78.5 E.09713
G2 X87.175 Y78.52 I.078 J2.106 E.00583
; LINE_WIDTH: 0.414985
G1 X86.67 Y78.604 E.01219
; WIPE_START
G1 F12807.097
G1 X87.175 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.16 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z3.16
G1 Z2.76
G1 E.4 F1800
; LINE_WIDTH: 0.40933
G1 F662
M204 S6000
G1 X87.183 Y107.53 E.0123
; LINE_WIDTH: 0.462723
G2 X87.456 Y107.55 I.269 J-1.878 E.00732
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.898
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 18/141
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.16 I1.217 J-.032 P1  F42000
G1 X89.776 Y97.961 Z3.16
G1 Z2.92
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F660
M204 S6000
G3 X90.965 Y97.631 I1.128 J1.758 E.03021
G1 X91.033 Y97.217 E.01013
G1 X91.22 Y97.248 E.00457
G3 X89.991 Y97.369 I-.395 J2.281 E.32059
G3 X90.976 Y97.208 I.859 J2.156 E.02426
; WIPE_START
G1 F9000
G1 X91.22 Y97.248 E-.09392
G1 X91.937 Y97.475 E-.28608
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I1.199 J-.207 P1  F42000
G1 X89.823 Y85.232 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F660
M204 S6000
G3 X91.02 Y84.9 I1.135 J1.775 E.03039
G1 X91.088 Y84.486 E.01013
G1 X91.276 Y84.517 E.0046
G3 X90.04 Y84.639 I-.397 J2.295 E.32252
G3 X91.031 Y84.477 I.864 J2.169 E.02441
; WIPE_START
G1 F9000
G1 X91.276 Y84.517 E-.09448
G1 X91.992 Y84.743 E-.28552
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I1.184 J-.282 P1  F42000
G1 X89.354 Y73.651 Z3.32
G1 Z2.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.709 Y72.96 I1.776 J1.811 E.03725
G1 X90.74 Y72.542 E.01013
G3 X91.533 Y75.995 I.027 J1.811 E.11884
G3 X90.244 Y76.061 I-.68 J-.649 E.03432
G3 X89.685 Y75.775 I.31 J-1.294 E.0153
G1 X89.12 Y75.782 E.01364
G3 X88.463 Y76.482 I-5.448 J-4.45 E.02318
G3 X87.156 Y76.218 I-.482 J-.98 E.03459
G3 X88.15 Y72.866 I.747 J-1.602 E.12128
G3 X89.05 Y73.35 I-.923 J2.795 E.02479
G3 X90.683 Y72.537 I2.117 J2.205 E.04466
M106 S124.95
; WIPE_START
G1 X91.149 Y72.572 E-.17768
G1 X91.584 Y72.719 E-.17472
G1 X91.645 Y72.759 E-.0276
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-1.214 J-.088 P1  F42000
G1 X91.23 Y78.465 Z3.32
G1 Z2.92
G1 E.4 F1800
; FEATURE: Outer wall
G1 F660
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
M73 P17 R28
G1 X91.75 Y107.965 E.00916
G1 X87.443 Y107.965 E.10387
G3 X86.152 Y106.74 I.006 J-1.299 E.04726
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.291 J-.004 E.04741
G1 X93.85 Y78.085 E.15615
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z2.92
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461436
G1 F660
M204 S6000
G1 X87.392 Y78.5 E.09714
G2 X87.175 Y78.52 I.08 J2.119 E.00583
; LINE_WIDTH: 0.415162
G1 X86.67 Y78.604 E.01219
; WIPE_START
G1 F12801.13
G1 X87.175 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.32 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z3.32
G1 Z2.92
G1 E.4 F1800
; LINE_WIDTH: 0.409974
G1 F660
M204 S6000
G1 X87.186 Y107.531 E.01238
; LINE_WIDTH: 0.462767
G2 X87.451 Y107.55 I.275 J-2.003 E.00714
G1 X91.03 Y107.55 E.09586
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.744
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 19/141
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.32 I1.217 J-.031 P1  F42000
G1 X89.782 Y97.974 Z3.32
G1 Z3.08
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F659
M204 S6000
G3 X90.964 Y97.646 I1.121 J1.741 E.03003
G1 X91.032 Y97.231 E.01013
G1 X91.226 Y97.263 E.00475
G3 X89.996 Y97.382 I-.401 J2.263 E.31804
G3 X90.975 Y97.222 I.854 J2.143 E.02411
; WIPE_START
G1 F9000
G1 X91.226 Y97.263 E-.09679
G1 X91.931 Y97.487 E-.28098
G1 X91.936 Y97.49 E-.00224
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I1.199 J-.206 P1  F42000
G1 X89.83 Y85.244 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F659
M204 S6000
G3 X91.019 Y84.914 I1.128 J1.758 E.03021
G1 X91.087 Y84.5 E.01013
G1 X91.283 Y84.532 E.00478
G3 X90.045 Y84.652 I-.404 J2.278 E.32013
G3 X91.03 Y84.491 I.859 J2.157 E.02426
; WIPE_START
G1 F9000
G1 X91.283 Y84.532 E-.09737
G1 X91.992 Y84.758 E-.28263
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I1.185 J-.279 P1  F42000
G1 X89.386 Y73.679 Z3.48
G1 Z3.08
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.077 Y73.231 I-.416 J-1.398 E.02013
G3 X90.727 Y73.031 I.907 J1.79 E.01648
G1 X90.759 Y72.612 E.01013
G3 X91.676 Y75.814 I.027 J1.725 E.10875
G3 X90.295 Y76.106 I-.778 J-.27 E.04088
G2 X89.562 Y75.698 I-1.012 J.957 E.02054
G2 X88.978 Y75.933 I.351 J1.713 E.01527
G3 X88.704 Y76.431 I-11.716 J-6.126 E.01371
G3 X87.929 Y76.618 I-.697 J-1.191 E.0195
G3 X87.193 Y76.266 I-.176 J-.58 E.02159
G2 X86.582 Y75.712 I-2.434 J2.068 E.01995
G3 X88.983 Y73.398 I1.285 J-1.069 E.12072
G2 X89.85 Y72.873 I-.459 J-1.736 E.02479
G3 X90.701 Y72.608 I.942 J1.523 E.02173
M106 S124.95
; WIPE_START
G1 X91.15 Y72.642 E-.171
G1 X91.573 Y72.787 E-.17001
G1 X91.654 Y72.85 E-.03899
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.214 J-.092 P1  F42000
G1 X91.23 Y78.465 Z3.48
G1 Z3.08
G1 E.4 F1800
; FEATURE: Outer wall
G1 F659
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
M73 P17 R27
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.738 I-.001 J-1.294 E.04742
G1 X86.15 Y79.38 E.65974
G3 X87.375 Y78.086 I1.294 J-.001 E.04738
G1 X93.85 Y78.085 E.15615
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z3.08
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461815
G1 F659
M204 S6000
G1 X87.392 Y78.5 E.09723
G2 X87.217 Y78.514 I.088 J2.271 E.0047
; LINE_WIDTH: 0.422455
G1 X86.681 Y78.595 E.01315
; WIPE_START
G1 F12560.593
G1 X87.217 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.48 I-1.217 J-.023 P1  F42000
G1 X86.668 Y107.441 Z3.48
G1 Z3.08
G1 E.4 F1800
; LINE_WIDTH: 0.409572
G1 F659
M204 S6000
G1 X87.183 Y107.53 E.01227
; LINE_WIDTH: 0.462733
G2 X87.456 Y107.55 I.269 J-1.883 E.00732
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.649
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 20/141
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.48 I1.217 J-.031 P1  F42000
G1 X89.788 Y97.987 Z3.48
G1 Z3.24
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F658
M204 S6000
G3 X90.963 Y97.66 I1.113 J1.724 E.02986
G1 X91.031 Y97.245 E.01013
G1 X91.226 Y97.277 E.00476
G3 X90.001 Y97.395 I-.401 J2.249 E.31606
G3 X90.974 Y97.236 I.849 J2.13 E.02397
; WIPE_START
G1 F9000
G1 X91.226 Y97.277 E-.09702
G1 X91.924 Y97.499 E-.27847
G1 X91.934 Y97.506 E-.0045
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.2 J-.205 P1  F42000
G1 X89.836 Y85.257 Z3.64
G1 Z3.24
G1 E.4 F1800
M73 P18 R27
G1 F658
M204 S6000
G3 X91.018 Y84.929 I1.121 J1.741 E.03003
G1 X91.086 Y84.514 E.01013
G1 X91.269 Y84.544 E.00446
G3 X90.05 Y84.665 I-.39 J2.268 E.31873
G3 X91.029 Y84.505 I.854 J2.143 E.02412
; WIPE_START
G1 F9000
G1 X91.269 Y84.544 E-.0922
G1 X91.985 Y84.77 E-.28552
G1 X91.99 Y84.774 E-.00228
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I1.185 J-.278 P1  F42000
G1 X89.405 Y73.756 Z3.64
G1 Z3.24
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.411 Y73.185 I-3.623 J-7.55 E.02793
G3 X90.772 Y73.119 I.636 J2.453 E.00886
G1 X90.823 Y72.702 E.01013
G3 X91.711 Y75.686 I-.053 J1.64 E.09887
G3 X90.326 Y76.188 I-.791 J-.021 E.04567
G2 X89.655 Y75.545 I-1.147 J.526 E.02295
G1 X89.431 Y75.603 E.00558
G1 X89.005 Y75.94 E.0131
G3 X88.087 Y76.652 I-.658 J.099 E.03406
G3 X87.056 Y76.08 I-.387 J-.518 E.03577
G2 X86.48 Y75.413 I-10.428 J8.417 E.02126
G3 X88.862 Y73.404 I1.385 J-.774 E.10561
G2 X89.842 Y73.009 I.022 J-1.358 E.02617
G3 X90.766 Y72.695 I1.021 J1.489 E.02382
M106 S124.95
; WIPE_START
G1 X91.112 Y72.737 E-.13269
G1 X91.522 Y72.883 E-.16521
G1 X91.7 Y73.005 E-.0821
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.212 J-.104 P1  F42000
G1 X91.23 Y78.465 Z3.64
G1 Z3.24
G1 E.4 F1800
; FEATURE: Outer wall
G1 F658
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.001 J-1.295 E.04736
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.292 J-.003 E.0474
G1 X93.85 Y78.085 E.15615
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z3.24
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461432
G1 F658
M204 S6000
G1 X87.392 Y78.5 E.09714
G2 X87.175 Y78.52 I.082 J2.14 E.00583
; LINE_WIDTH: 0.415466
G1 X86.671 Y78.604 E.01217
; WIPE_START
G1 F12790.912
G1 X87.175 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.64 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z3.64
G1 Z3.24
G1 E.4 F1800
; LINE_WIDTH: 0.40948
G1 F658
M204 S6000
G1 X87.183 Y107.53 E.0123
; LINE_WIDTH: 0.462716
G2 X87.456 Y107.55 I.263 J-1.79 E.00734
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11380.105
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 21/141
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.64 I1.217 J-.03 P1  F42000
G1 X89.795 Y98 Z3.64
G1 Z3.4
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F658
M204 S6000
G3 X90.962 Y97.674 I1.106 J1.707 E.02968
G1 X91.03 Y97.259 E.01013
G1 X91.226 Y97.291 E.0048
G3 X90.006 Y97.408 I-.401 J2.237 E.31446
G3 X90.973 Y97.25 I.844 J2.117 E.02382
; WIPE_START
G1 F9000
G1 X91.226 Y97.291 E-.09754
G1 X91.917 Y97.512 E-.27567
G1 X91.932 Y97.522 E-.00679
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.2 J-.205 P1  F42000
G1 X89.843 Y85.27 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F658
M204 S6000
G3 X91.018 Y84.943 I1.113 J1.724 E.02986
G1 X91.086 Y84.528 E.01013
G1 X91.264 Y84.557 E.00436
G3 X90.055 Y84.678 I-.385 J2.251 E.31645
G3 X91.029 Y84.519 I.849 J2.13 E.02397
; WIPE_START
G1 F9000
G1 X91.264 Y84.557 E-.09073
G1 X91.979 Y84.783 E-.2847
G1 X91.989 Y84.789 E-.00457
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.182 J-.288 P1  F42000
G1 X89.36 Y73.987 Z3.8
G1 Z3.4
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.093 Y73.488 I-.22 J-1.112 E.02196
G3 X90.7 Y73.25 I.899 J1.396 E.01585
G1 X90.71 Y72.83 E.01013
G3 X91.84 Y75.453 I.069 J1.525 E.08905
G3 X91.328 Y76.438 I-1.944 J-.386 E.02714
G3 X90.107 Y75.814 I-.374 J-.774 E.03828
G1 X90.019 Y75.665 E.00417
G1 X89.586 Y75.316 E.0134
G2 X89.079 Y76.105 I.431 J.835 E.02369
G3 X88.096 Y76.746 I-.71 J-.015 E.03331
G3 X86.994 Y76.345 I-.394 J-.632 E.03255
G1 X86.987 Y75.837 E.01226
G3 X88.973 Y73.693 I.868 J-1.188 E.11973
G2 X89.834 Y73.152 I-.206 J-1.284 E.02518
G3 X90.652 Y72.828 I.963 J1.237 E.02152
M106 S124.95
; WIPE_START
G1 X91.07 Y72.848 E-.15878
G1 X91.473 Y72.982 E-.16163
G1 X91.604 Y73.068 E-.05959
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.214 J-.084 P1  F42000
G1 X91.23 Y78.465 Z3.8
G1 Z3.4
G1 E.4 F1800
; FEATURE: Outer wall
G1 F658
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.443 Y107.965 E.10387
G3 X86.152 Y106.74 I.001 J-1.294 E.04731
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.292 J-.003 E.0474
G1 X93.85 Y78.085 E.15615
M73 P19 R27
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z3.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46143
G1 F658
M204 S6000
G1 X87.392 Y78.5 E.09715
G2 X87.175 Y78.52 I.083 J2.152 E.00583
; LINE_WIDTH: 0.415632
G1 X86.671 Y78.603 E.01216
; WIPE_START
G1 F12785.344
G1 X87.175 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z3.8
G1 Z3.4
G1 E.4 F1800
; LINE_WIDTH: 0.409971
G1 F658
M204 S6000
G1 X87.185 Y107.531 E.01238
; LINE_WIDTH: 0.462765
G2 X87.451 Y107.55 I.275 J-2.002 E.00715
G1 X91.03 Y107.55 E.09586
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.792
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 22/141
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I1.217 J-.029 P1  F42000
G1 X89.801 Y98.013 Z3.8
G1 Z3.56
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F657
M204 S6000
G3 X90.961 Y97.688 I1.099 J1.69 E.0295
G1 X91.029 Y97.273 E.01013
G1 X91.228 Y97.306 E.00485
G3 X90.011 Y97.422 I-.403 J2.22 E.31204
G3 X90.972 Y97.264 I.839 J2.105 E.02368
; WIPE_START
G1 F9000
G1 X91.228 Y97.306 E-.09838
G1 X91.911 Y97.524 E-.27259
G1 X91.931 Y97.538 E-.00903
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.96 I1.2 J-.204 P1  F42000
G1 X89.85 Y85.283 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F657
M204 S6000
G3 X91.017 Y84.957 I1.106 J1.708 E.02968
G1 X91.085 Y84.542 E.01013
G1 X91.259 Y84.571 E.00426
G3 X90.061 Y84.691 I-.38 J2.238 E.31459
G3 X91.028 Y84.533 I.844 J2.117 E.02382
; WIPE_START
G1 F9000
G1 X91.259 Y84.571 E-.08912
G1 X91.972 Y84.795 E-.28401
G1 X91.987 Y84.805 E-.00687
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.96 I1.183 J-.287 P1  F42000
G1 X89.396 Y74.134 Z3.96
G1 Z3.56
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X89.81 Y74.021 E.01034
G3 X90.788 Y73.225 I1.971 J1.425 E.03075
G1 X90.797 Y72.805 E.01013
G3 X91.469 Y73.142 I-.01 J.859 E.01877
G3 X91.924 Y75.153 I-.728 J1.222 E.05563
G2 X91.672 Y76.076 I3.413 J1.43 E.02313
G3 X90.196 Y76.101 I-.742 J-.257 E.04624
G3 X90.064 Y75.508 I1.29 J-.599 E.01475
G2 X89.524 Y75.199 I-.828 J.817 E.0152
G1 X89.302 Y75.363 E.00668
G1 X89.104 Y75.863 E.01295
G3 X88.096 Y76.84 I-.791 J.193 E.04085
G3 X86.903 Y76.071 I-.37 J-.735 E.04126
G1 X86.94 Y75.633 E.0106
G3 X86.635 Y73.969 I1.129 J-1.067 E.04316
G3 X87.537 Y73.32 I.881 J.274 E.02875
G3 X88.889 Y73.78 I.308 J1.313 E.03627
G2 X89.9 Y73.277 I.121 J-1.025 E.02881
G1 X90.484 Y72.877 E.01706
G1 X90.739 Y72.802 E.00642
M106 S124.95
; WIPE_START
G1 X91.233 Y72.918 E-.19274
G1 X91.469 Y73.142 E-.12374
G1 X91.604 Y73.241 E-.06352
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.96 I-1.214 J-.087 P1  F42000
G1 X91.23 Y78.465 Z3.96
G1 Z3.56
G1 E.4 F1800
; FEATURE: Outer wall
G1 F657
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.443 Y107.965 E.10387
G3 X86.152 Y106.74 I.014 J-1.307 E.04719
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.291 J-.004 E.04741
G1 X93.85 Y78.085 E.15615
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z3.56
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461428
G1 F657
M204 S6000
G1 X87.392 Y78.5 E.09715
G2 X87.174 Y78.52 I.084 J2.161 E.00583
; LINE_WIDTH: 0.415743
G1 X86.671 Y78.603 E.01216
; WIPE_START
G1 F12781.635
G1 X87.174 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.96 I-1.217 J-.021 P1  F42000
G1 X86.668 Y107.441 Z3.96
G1 Z3.56
G1 E.4 F1800
; LINE_WIDTH: 0.40998
G1 F657
M204 S6000
G1 X87.186 Y107.531 E.01234
; LINE_WIDTH: 0.462775
G2 X87.451 Y107.55 I.275 J-2.003 E.00715
G1 X91.03 Y107.55 E.09586
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.519
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 23/141
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.96 I1.217 J-.028 P1  F42000
G1 X89.808 Y98.026 Z3.96
G1 Z3.72
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F659
M204 S6000
G3 X90.96 Y97.702 I1.092 J1.674 E.02933
G1 X91.028 Y97.287 E.01013
G1 X91.23 Y97.32 E.00493
G3 X90.016 Y97.435 I-.404 J2.208 E.3104
G3 X90.971 Y97.278 I.834 J2.091 E.02353
; WIPE_START
G1 F9000
G1 X91.23 Y97.32 E-.09969
G1 X91.904 Y97.537 E-.26903
G1 X91.929 Y97.553 E-.01128
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I1.2 J-.203 P1  F42000
G1 X89.856 Y85.295 Z4.12
G1 Z3.72
G1 E.4 F1800
G1 F659
M204 S6000
G3 X91.017 Y84.971 I1.099 J1.691 E.0295
G1 X91.085 Y84.556 E.01013
G1 X91.254 Y84.584 E.00414
G3 X90.066 Y84.705 I-.375 J2.225 E.31274
G3 X91.028 Y84.547 I.838 J2.105 E.02368
; WIPE_START
G1 F9000
G1 X91.254 Y84.584 E-.08726
G1 X91.966 Y84.808 E-.28359
G1 X91.986 Y84.821 E-.00915
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I1.098 J-.524 P1  F42000
G1 X87.089 Y74.552 Z4.12
G1 Z3.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X87.043 Y73.933 I5.322 J-.707 E.01497
G3 X87.343 Y73.741 I.375 J.256 E.00882
G1 X87.377 Y73.322 E.01015
G2 X87.902 Y73.424 I.773 J-2.567 E.01293
G3 X88.918 Y75.202 I-.135 J1.256 E.05758
G3 X89.123 Y76.313 I-2.519 J1.041 E.02743
G3 X88.088 Y76.842 I-.783 J-.254 E.03113
G3 X86.951 Y75.876 I-.415 J-.663 E.04771
G1 X87.093 Y75.576 E.008
G3 X86.67 Y74.453 I.949 J-.999 E.02995
M73 P20 R27
G3 X87.319 Y73.318 I.714 J-.344 E.03706
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.778 Y73.438 E-.18015
G1 X87.902 Y73.424 E-.04755
G1 X88.289 Y73.509 E-.15072
G1 X88.293 Y73.512 E-.00159
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I-.156 J1.207 P1  F42000
G1 X90.256 Y73.765 Z4.12
G1 Z3.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.692 Y73.208 I4.974 J3.443 E.01706
G3 X90.848 Y73.179 I.194 J.603 E.00383
G1 X90.872 Y72.759 E.01013
G3 X91.591 Y73.425 I-.042 J.767 E.02563
G3 X91.792 Y74.991 I-.812 J.9 E.04147
G2 X91.736 Y75.854 I1.37 J.523 E.02117
G3 X90.224 Y76.185 I-.781 J.048 E.05349
G3 X90.105 Y75.424 I1.26 J-.587 E.01882
G3 X90.054 Y73.367 I.797 J-1.049 E.05696
G3 X90.814 Y72.756 I.826 J.25 E.02498
M106 S124.95
; WIPE_START
G1 X91.22 Y72.864 E-.15945
G1 X91.426 Y73.042 E-.10386
G1 X91.548 Y73.324 E-.11669
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I-1.215 J-.075 P1  F42000
G1 X91.23 Y78.465 Z4.12
G1 Z3.72
G1 E.4 F1800
; FEATURE: Outer wall
G1 F659
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.65981
G3 X87.374 Y78.086 I1.291 J-.004 E.04738
G1 X93.85 Y78.085 E.15617
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z3.72
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46209
G1 F659
M204 S6000
G1 X87.265 Y78.509 E.10069
; LINE_WIDTH: 0.427288
G1 X86.687 Y78.589 E.01433
; WIPE_START
G1 F12406.095
G1 X87.265 Y78.509 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.12 I-1.217 J-.026 P1  F42000
G1 X86.657 Y107.431 Z4.12
G1 Z3.72
G1 E.4 F1800
; LINE_WIDTH: 0.402923
M73 P20 R26
G1 F659
M204 S6000
G2 X87.226 Y107.536 I1.514 J-6.585 E.01333
; LINE_WIDTH: 0.463122
G2 X87.456 Y107.55 I.228 J-1.921 E.00617
G1 X91.03 Y107.55 E.09583
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11369.307
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 24/141
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.12 I1.217 J-.028 P1  F42000
G1 X89.814 Y98.039 Z4.12
G1 Z3.88
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F658
M204 S6000
G3 X90.959 Y97.716 I1.085 J1.657 E.02915
G1 X91.027 Y97.301 E.01013
G1 X91.234 Y97.335 E.00505
G3 X90.021 Y97.448 I-.408 J2.194 E.30832
G3 X90.97 Y97.292 I.829 J2.078 E.02339
; WIPE_START
G1 F9000
G1 X91.234 Y97.335 E-.1015
G1 X91.897 Y97.549 E-.26499
G1 X91.927 Y97.569 E-.01352
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.28 I1.2 J-.202 P1  F42000
G1 X89.863 Y85.308 Z4.28
G1 Z3.88
G1 E.4 F1800
G1 F658
M204 S6000
G3 X91.016 Y84.985 I1.091 J1.674 E.02933
G1 X91.084 Y84.571 E.01013
G1 X91.287 Y84.604 E.00496
G3 X90.072 Y84.718 I-.407 J2.205 E.30997
G3 X91.027 Y84.561 I.833 J2.092 E.02353
; WIPE_START
G1 F9000
G1 X91.287 Y84.604 E-.1001
G1 X91.96 Y84.821 E-.26861
G1 X91.984 Y84.837 E-.01129
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.28 I1.204 J-.176 P1  F42000
G1 X90.388 Y73.936 Z4.28
G1 Z3.88
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.444 Y73.867 E.00213
G3 X90.687 Y73.145 I.703 J-.166 E.01936
G1 X90.67 Y72.724 E.01015
G3 X91.588 Y73.763 I.118 J.821 E.03958
G3 X91.624 Y74.924 I-.922 J.61 E.02948
G2 X91.737 Y75.942 I5.27 J-.072 E.02475
G3 X90.542 Y76.65 I-.85 J-.072 E.03915
G3 X90.145 Y75.158 I1.171 J-1.111 E.03883
G3 X90.029 Y73.712 I.702 J-.784 E.0386
G3 X90.613 Y72.722 I.98 J-.089 E.0296
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.957 Y72.729 E-.13099
G1 X91.198 Y72.809 E-.09662
G1 X91.411 Y72.983 E-.10437
G1 X91.476 Y73.092 E-.04802
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.28 I-.387 J-1.154 P1  F42000
G1 X87.221 Y74.518 Z4.28
G1 Z3.88
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X87.191 Y73.745 I.267 J-.398 E.02173
G1 X87.281 Y73.719 E.00227
G1 X87.287 Y73.298 E.01013
G3 X88.05 Y73.668 I.049 J.874 E.02136
G3 X88.819 Y74.928 I-.188 J.979 E.04009
G1 X88.843 Y75.438 E.01231
G3 X88.714 Y76.877 I-.537 J.677 E.04124
G3 X88.13 Y76.833 I-.22 J-.974 E.01433
G3 X87.084 Y76.777 I-.489 J-.674 E.02733
G3 X87.161 Y75.548 I.858 J-.563 E.03185
G2 X86.921 Y74.96 I-1.525 J.278 E.01542
G2 X86.575 Y74.183 I-68.731 J30.189 E.02052
G3 X87.229 Y73.296 I.768 J-.118 E.02954
M106 S124.95
; WIPE_START
G1 X87.66 Y73.356 E-.16538
G1 X88.05 Y73.668 E-.18983
G1 X88.109 Y73.695 E-.02479
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.28 I-1.018 J.666 P1  F42000
G1 X91.23 Y78.465 Z4.28
G1 Z3.88
G1 E.4 F1800
; FEATURE: Outer wall
G1 F658
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.739 I-.004 J-1.291 E.04743
G1 X86.15 Y79.38 E.65977
G3 X87.376 Y78.086 I1.294 J-.001 E.04741
G1 X93.85 Y78.085 E.15611
M73 P21 R26
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z3.88
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461382
G1 F658
M204 S6000
G1 X87.399 Y78.5 E.09695
G2 X87.174 Y78.52 I.041 J1.775 E.00604
; LINE_WIDTH: 0.416043
G1 X86.676 Y78.602 E.01205
; WIPE_START
G1 F12771.578
G1 X87.174 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.28 I-1.217 J-.022 P1  F42000
G1 X86.657 Y107.431 Z4.28
G1 Z3.88
G1 E.4 F1800
; LINE_WIDTH: 0.402922
G1 F658
M204 S6000
G2 X87.227 Y107.536 I1.512 J-6.57 E.01335
; LINE_WIDTH: 0.463083
G2 X87.456 Y107.55 I.227 J-1.92 E.00616
G1 X91.03 Y107.55 E.09582
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11370.353
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 25/141
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.28 I1.217 J-.027 P1  F42000
G1 X89.82 Y98.052 Z4.28
G1 Z4.04
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F657
M204 S6000
G3 X90.958 Y97.73 I1.078 J1.64 E.02897
G1 X91.026 Y97.316 E.01013
G1 X91.173 Y97.34 E.0036
G3 X90.025 Y97.461 I-.349 J2.189 E.30776
G3 X90.969 Y97.306 I.824 J2.065 E.02324
; WIPE_START
G1 F9000
G1 X91.173 Y97.34 E-.07879
G1 X91.443 Y97.384 E-.10397
G1 X91.89 Y97.562 E-.1828
G1 X91.922 Y97.583 E-.01445
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.44 I1.2 J-.201 P1  F42000
G1 X89.87 Y85.321 Z4.44
G1 Z4.04
G1 E.4 F1800
G1 F657
M204 S6000
G3 X91.016 Y84.999 I1.084 J1.658 E.02915
G1 X91.084 Y84.585 E.01013
G1 X91.241 Y84.611 E.00384
G3 X90.077 Y84.731 I-.361 J2.199 E.3091
G3 X91.027 Y84.576 I.828 J2.079 E.02339
; WIPE_START
G1 F9000
G1 X91.241 Y84.611 E-.08254
G1 X91.954 Y84.833 E-.28373
G1 X91.984 Y84.854 E-.01373
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.44 I1.106 J-.507 P1  F42000
G1 X87.189 Y74.397 Z4.44
G1 Z4.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X86.926 Y74.016 I.465 J-.603 E.01136
G3 X87.409 Y73.724 I.446 J.192 E.01455
G1 X87.525 Y73.319 E.01015
G3 X88.041 Y73.728 I-.392 J1.023 E.01611
G1 X88.505 Y74.311 E.01798
G3 X88.504 Y75.016 I-.676 J.352 E.01767
G2 X89.003 Y75.657 I1.258 J-.465 E.01989
G3 X88.919 Y76.835 I-.825 J.533 E.03055
G3 X88.334 Y76.899 I-.371 J-.681 E.01456
G3 X87.328 Y77.017 I-1.181 J-5.722 E.02447
G3 X86.986 Y75.823 I.511 J-.792 E.03269
G3 X87.263 Y75.507 I.825 J.444 E.01022
G1 X87.182 Y74.953 E.0135
G2 X86.733 Y74.55 I-1.901 J1.667 E.01458
G3 X86.916 Y73.421 I.461 J-.505 E.03268
G3 X87.471 Y73.3 I.445 J.708 E.01398
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.811 Y73.448 E-.14109
G1 X88.041 Y73.728 E-.13757
G1 X88.207 Y73.937 E-.10134
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.44 I.014 J1.217 P1  F42000
G1 X90.567 Y73.91 Z4.44
G1 Z4.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.669 Y73.068 I.68 J-.345 E.02168
G1 X90.79 Y72.665 E.01015
G3 X91.435 Y74.056 I-.069 J.877 E.04488
G3 X91.381 Y74.712 I-.635 J.278 E.01653
G1 X91.45 Y75.249 E.01306
G3 X90.853 Y76.817 I-.672 J.642 E.05047
G3 X90.275 Y76.288 I-.067 J-.507 E.02154
G3 X90.33 Y75.322 I.816 J-.438 E.02455
G1 X90.238 Y74.777 E.01331
G3 X90.153 Y73.99 I.699 J-.474 E.01986
G3 X90.523 Y72.653 I1.018 J-.438 E.03616
G1 X90.736 Y72.645 E.00513
M106 S124.95
; WIPE_START
G1 X91.255 Y72.862 E-.21366
G1 X91.548 Y73.183 E-.16515
G1 X91.548 Y73.186 E-.00119
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.44 I-1.215 J-.073 P1  F42000
G1 X91.23 Y78.465 Z4.44
G1 Z4.04
G1 E.4 F1800
; FEATURE: Outer wall
G1 F657
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.738 I-.001 J-1.294 E.04742
G1 X86.15 Y79.38 E.65974
G3 X87.374 Y78.086 I1.291 J-.004 E.04739
G1 X93.85 Y78.085 E.15617
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z4.04
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46142
G1 F657
M204 S6000
G1 X87.361 Y78.501 E.09797
G2 X87.174 Y78.52 I.094 J1.905 E.00503
; LINE_WIDTH: 0.416238
G1 X86.672 Y78.603 E.01214
; WIPE_START
G1 F12765.049
G1 X87.174 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.44 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z4.44
G1 Z4.04
G1 E.4 F1800
; LINE_WIDTH: 0.409596
G1 F657
M204 S6000
G1 X87.183 Y107.53 E.01232
; LINE_WIDTH: 0.462735
G2 X87.456 Y107.55 I.27 J-1.895 E.00732
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.574
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 26/141
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.44 I1.217 J-.026 P1  F42000
G1 X89.826 Y98.065 Z4.44
G1 Z4.2
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F661
M204 S6000
G3 X90.957 Y97.745 I1.071 J1.623 E.0288
G1 X91.024 Y97.33 E.01013
G1 X91.161 Y97.352 E.00334
G3 X90.03 Y97.475 I-.337 J2.177 E.30605
G3 X90.967 Y97.321 I.819 J2.052 E.0231
; WIPE_START
G1 F9000
G1 X91.161 Y97.352 E-.07464
G1 X91.439 Y97.398 E-.10698
G1 X91.883 Y97.575 E-.18167
G1 X91.92 Y97.599 E-.01671
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I1.2 J-.2 P1  F42000
G1 X89.877 Y85.335 Z4.6
G1 Z4.2
G1 E.4 F1800
G1 F661
M204 S6000
G3 X91.015 Y85.014 I1.077 J1.641 E.02897
G1 X91.084 Y84.599 E.01013
G1 X91.294 Y84.634 E.00514
G3 X90.083 Y84.744 I-.412 J2.176 E.30585
G3 X91.026 Y84.59 I.823 J2.066 E.02324
; WIPE_START
G1 F9000
G1 X91.294 Y84.634 E-.10298
G1 X91.948 Y84.846 E-.26123
G1 X91.982 Y84.87 E-.01579
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I1.203 J-.181 P1  F42000
G1 X90.639 Y75.932 Z4.6
G1 Z4.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.913 Y75.521 I.432 J-.008 E.01266
G1 X90.961 Y75.103 E.01015
G3 X91.295 Y76.592 I-.033 J.79 E.04986
G3 X90.462 Y76.813 I-.536 J-.34 E.02285
G3 X90.446 Y75.302 I1.071 J-.767 E.03882
G3 X90.904 Y75.092 I.476 J.436 E.01248
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.161 Y75.141 E-.09956
G1 X91.408 Y75.294 E-.11048
G1 X91.677 Y75.645 E-.16776
G1 X91.678 Y75.65 E-.00219
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I1.069 J-.582 P1  F42000
G1 X90.519 Y73.522 Z4.6
G1 Z4.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.676 Y72.578 I10.887 J1.317 E.02308
G3 X91.579 Y73.401 I-.276 J1.21 E.03081
G3 X90.133 Y73.261 I-.742 J.124 E.0665
G3 X90.621 Y72.56 I.594 J-.107 E.02289
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.885 Y72.645 E-.1054
G1 X91.331 Y72.936 E-.20219
G1 X91.447 Y73.087 E-.07241
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I-.241 J-1.193 P1  F42000
G1 X86.862 Y74.011 Z4.6
G1 Z4.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X87.35 Y73.744 I.7 J.699 E.01359
G1 X87.421 Y73.33 E.01013
G3 X86.938 Y74.696 I-.068 J.744 E.0656
G3 X86.421 Y73.946 I.421 J-.843 E.02292
G3 X87.364 Y73.32 I1.087 J.615 E.02833
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.654 Y73.386 E-.11308
G1 X87.939 Y73.618 E-.13972
G1 X88.049 Y73.935 E-.1272
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I-1.168 J-.34 P1  F42000
G1 X87.452 Y75.986 Z4.6
G1 Z4.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X87.973 Y75.814 I.409 J.364 E.01386
G1 X88.179 Y75.753 E.00517
G1 X88.201 Y75.332 E.01016
G3 X88.949 Y76.879 I.007 J.951 E.05172
G3 X88.358 Y76.902 I-.322 J-.651 E.01469
G1 X87.861 Y76.933 E.012
G3 X86.935 Y76.455 I-.384 J-.392 E.03314
G3 X87.945 Y75.384 I.928 J-.136 E.04079
G1 X88.143 Y75.325 E.005
M106 S124.95
; WIPE_START
G1 X88.449 Y75.363 E-.11701
G1 X88.777 Y75.512 E-.13707
G1 X88.971 Y75.728 E-.11004
G1 X88.983 Y75.768 E-.01589
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I-.935 J.779 P1  F42000
G1 X91.23 Y78.465 Z4.6
G1 Z4.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F661
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
M73 P22 R26
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.001 J-1.295 E.04736
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.292 J-.003 E.04739
G1 X93.85 Y78.085 E.15615
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z4.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461861
G1 F661
M204 S6000
G1 X87.391 Y78.5 E.09727
G2 X87.224 Y78.513 I.11 J2.555 E.00449
; LINE_WIDTH: 0.42321
G1 X86.681 Y78.595 E.01335
; WIPE_START
G1 F12536.197
G1 X87.224 Y78.513 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I-1.217 J-.023 P1  F42000
G1 X86.667 Y107.44 Z4.6
G1 Z4.2
G1 E.4 F1800
; LINE_WIDTH: 0.407512
G1 F661
M204 S6000
G1 X87.168 Y107.528 E.01187
; LINE_WIDTH: 0.462591
G2 X87.456 Y107.55 I.312 J-2.24 E.00774
G1 X91.03 Y107.55 E.09571
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11383.418
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 27/141
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I1.217 J-.025 P1  F42000
G1 X89.831 Y98.078 Z4.6
G1 Z4.36
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F660
M204 S6000
G3 X90.955 Y97.759 I1.064 J1.607 E.02862
G1 X91.023 Y97.345 E.01013
G1 X91.148 Y97.365 E.00305
G3 X88.703 Y99.938 I-.3 J2.162 E.23087
G3 X90.966 Y97.335 I2.162 J-.405 E.09557
; WIPE_START
G1 F9000
G1 X91.148 Y97.365 E-.07002
G1 X91.435 Y97.412 E-.1105
G1 X91.876 Y97.588 E-.18053
G1 X91.917 Y97.616 E-.01896
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.76 I1.201 J-.199 P1  F42000
G1 X89.884 Y85.348 Z4.76
G1 Z4.36
G1 E.4 F1800
G1 F660
M204 S6000
G3 X91.015 Y85.028 I1.069 J1.624 E.0288
G1 X91.083 Y84.614 E.01013
G1 X91.298 Y84.649 E.00524
G3 X90.088 Y84.758 I-.415 J2.161 E.30378
G3 X91.026 Y84.605 I.817 J2.053 E.0231
; WIPE_START
G1 F9000
G1 X91.298 Y84.649 E-.10462
G1 X91.942 Y84.859 E-.25735
G1 X91.981 Y84.886 E-.01803
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.76 I1.204 J-.174 P1  F42000
G1 X90.705 Y76.048 Z4.76
G1 Z4.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.937 Y75.637 I.339 J-.08 E.01251
G1 X90.987 Y75.219 E.01015
G1 X91.057 Y75.232 E.00172
G3 X91.764 Y75.786 I-.093 J.846 E.02281
G3 X91.3 Y76.54 I-1.34 J-.304 E.02174
G3 X90.589 Y76.983 I-.972 J-.766 E.02062
G3 X90.285 Y76.101 I.454 J-.65 E.02405
G3 X90.93 Y75.209 I.713 J-.164 E.03007
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.057 Y75.232 E-.04903
G1 X91.616 Y75.516 E-.23832
G1 X91.733 Y75.73 E-.09264
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.76 I1.085 J-.552 P1  F42000
G1 X90.569 Y73.441 Z4.76
G1 Z4.36
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.52 Y72.488 I-5.223 J-.213 E.02305
G3 X91.307 Y73.001 I-.385 J1.449 E.02304
G3 X91.555 Y73.882 I-.774 J.694 E.02285
G3 X90.334 Y73.98 I-.664 J-.615 E.03246
G3 X90.144 Y73.125 I.983 J-.667 E.02163
G3 X90.463 Y72.486 I.701 J-.049 E.01806
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.759 Y72.548 E-.11494
G1 X91.296 Y72.992 E-.26506
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.76 I-.262 J-1.189 P1  F42000
G1 X86.97 Y73.945 Z4.76
G1 Z4.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X87.574 Y73.785 I.543 J.831 E.01532
G1 X87.725 Y73.368 E.01069
G3 X87.993 Y73.825 I-.091 J.361 E.01422
G3 X87.063 Y74.697 I-.645 J.244 E.03924
G3 X86.411 Y74.238 I.548 J-1.471 E.01945
G3 X86.554 Y73.678 I.415 J-.192 E.0151
G3 X87.667 Y73.362 I1.013 J1.455 E.02841
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.94 Y73.515 E-.11878
G1 X87.993 Y73.825 E-.11945
G1 X87.997 Y74.198 E-.14177
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.76 I-1.176 J-.313 P1  F42000
G1 X87.487 Y76.119 Z4.76
G1 Z4.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X87.98 Y75.99 I.315 J.199 E.01353
G1 X88.285 Y75.897 E.0077
G1 X88.304 Y75.476 E.01015
G3 X89.102 Y76.168 I-.001 J.808 E.02777
G3 X88.411 Y76.908 I-.43 J.291 E.03371
G1 X87.907 Y76.883 E.01218
G3 X87.115 Y77.031 I-.505 J-.511 E.02063
G3 X87.419 Y75.6 I.966 J-.542 E.03852
G2 X88.246 Y75.469 I-1.645 J-13.072 E.02021
M106 S124.95
; WIPE_START
G1 X88.551 Y75.5 E-.11655
G1 X88.779 Y75.623 E-.09835
G1 X89.001 Y75.997 E-.1651
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.76 I-.903 J.816 P1  F42000
G1 X91.23 Y78.465 Z4.76
G1 Z4.36
G1 E.4 F1800
; FEATURE: Outer wall
G1 F660
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.295 J-.001 E.04737
G1 X93.85 Y78.085 E.15616
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
M73 P23 R26
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z4.36
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461849
G1 F660
M204 S6000
G1 X87.391 Y78.5 E.09728
G2 X87.225 Y78.513 I.115 J2.617 E.00445
; LINE_WIDTH: 0.423334
G1 X86.682 Y78.594 E.01336
; WIPE_START
G1 F12532.199
G1 X87.225 Y78.513 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.76 I-1.217 J-.023 P1  F42000
G1 X86.666 Y107.441 Z4.76
G1 Z4.36
G1 E.4 F1800
; LINE_WIDTH: 0.409618
G1 F660
M204 S6000
G1 X87.183 Y107.53 E.01232
; LINE_WIDTH: 0.462728
G2 X87.456 Y107.55 I.27 J-1.896 E.00732
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.774
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 28/141
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I1.217 J-.025 P1  F42000
G1 X89.837 Y98.092 Z4.76
G1 Z4.52
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F659
M204 S6000
G3 X90.953 Y97.774 I1.057 J1.59 E.02844
G1 X91.021 Y97.359 E.01013
G1 X91.132 Y97.377 E.00272
G3 X90.038 Y97.503 I-.308 J2.153 E.30276
G3 X90.964 Y97.35 I.809 J2.025 E.02281
; WIPE_START
G1 F9000
G1 X91.132 Y97.377 E-.06484
G1 X91.43 Y97.426 E-.11455
G1 X91.868 Y97.601 E-.17941
G1 X91.915 Y97.632 E-.0212
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.92 I1.201 J-.198 P1  F42000
G1 X89.891 Y85.361 Z4.92
G1 Z4.52
G1 E.4 F1800
G1 F659
M204 S6000
G3 X91.015 Y85.043 I1.062 J1.608 E.02862
G1 X91.083 Y84.629 E.01013
G1 X91.303 Y84.665 E.00536
G3 X90.094 Y84.772 I-.419 J2.146 E.30171
G3 X91.026 Y84.619 I.812 J2.04 E.02296
; WIPE_START
G1 F9000
G1 X91.303 Y84.665 E-.10638
G1 X91.936 Y84.872 E-.25335
G1 X91.98 Y84.902 E-.02027
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.92 I1.205 J-.169 P1  F42000
G1 X90.756 Y76.174 Z4.92
G1 Z4.52
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.839 Y75.802 I-5.57 J-1.444 E.00921
G3 X90.961 Y75.75 I.121 J.116 E.00329
G1 X91.005 Y75.333 E.01013
G3 X91.762 Y75.631 I-.201 J1.619 E.01983
G3 X91.696 Y76.063 I-.385 J.162 E.0111
G2 X90.852 Y76.965 I19.921 J19.481 E.02979
G3 X90.423 Y77.002 I-.239 J-.27 E.0111
G3 X90.368 Y75.993 I1.093 J-.566 E.02512
G3 X90.94 Y75.325 I.606 J-.059 E.02367
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.507 Y75.449 E-.22063
G1 X91.762 Y75.631 E-.11892
G1 X91.77 Y75.737 E-.04046
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.92 I1.093 J-.534 P1  F42000
G1 X90.661 Y73.467 Z4.92
G1 Z4.52
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.455 Y72.416 I-15.877 J2.567 E.02585
G3 X91.17 Y72.989 I-.263 J1.06 E.0228
G3 X91.639 Y73.776 I-1.1 J1.19 E.0224
G3 X91.054 Y74.076 I-.461 J-.178 E.01734
G3 X90.239 Y73.428 I-.188 J-.601 E.02958
G3 X90.303 Y72.469 I1.07 J-.41 E.02393
G1 X90.397 Y72.415 E.00263
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.552 Y72.418 E-.05888
G1 X90.858 Y72.605 E-.13613
G1 X91.165 Y72.983 E-.18498
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.92 I-.284 J-1.183 P1  F42000
G1 X86.998 Y73.984 Z4.92
G1 Z4.52
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X87.883 Y73.285 I-.093 J-1.026 E.02876
G1 X87.9 Y73.295 E.00048
G3 X87.952 Y73.956 I-.56 J.377 E.01672
G3 X86.966 Y74.534 I-.623 J.068 E.03472
G3 X86.258 Y73.98 I.041 J-.783 E.0231
G3 X87.034 Y73.55 I.695 J.34 E.02279
G3 X87.832 Y73.257 I1.515 J2.891 E.02055
M106 S124.95
M106 S127.5
; WIPE_START
G1 X87.9 Y73.295 E-.02956
G1 X88.031 Y73.607 E-.12859
G1 X87.952 Y73.956 E-.13599
G1 X87.906 Y74.177 E-.08587
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.92 I-1.21 J-.128 P1  F42000
G1 X87.701 Y76.107 Z4.92
G1 Z4.52
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X88.379 Y76.033 I.201 J-1.29 E.01664
G1 X88.409 Y75.603 E.01038
G3 X89.087 Y76.898 I-.324 J.995 E.03902
G3 X88.334 Y76.808 I-.325 J-.482 E.01995
G1 X87.78 Y76.905 E.01355
G3 X87.088 Y77.076 I-.448 J-.327 E.01869
G3 X87.628 Y75.672 I.939 J-.445 E.04056
G2 X88.351 Y75.599 I.153 J-2.098 E.01763
M106 S124.95
; WIPE_START
G1 X88.556 Y75.635 E-.07889
G1 X88.972 Y76.051 E-.22337
G1 X89.045 Y76.241 E-.07774
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.92 I-.868 J.853 P1  F42000
G1 X91.23 Y78.465 Z4.92
G1 Z4.52
G1 E.4 F1800
; FEATURE: Outer wall
G1 F659
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
M73 P23 R25
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.739 I-.004 J-1.291 E.04743
G1 X86.15 Y79.38 E.65977
G3 X87.374 Y78.086 I1.295 J-.001 E.04737
G1 X93.85 Y78.085 E.15616
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z4.52
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461855
G1 F659
M204 S6000
G1 X87.391 Y78.5 E.09728
G2 X87.226 Y78.513 I.117 J2.645 E.00442
; LINE_WIDTH: 0.423461
G1 X86.682 Y78.594 E.01338
; WIPE_START
G1 F12528.129
G1 X87.226 Y78.513 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.92 I-1.217 J-.024 P1  F42000
G1 X86.665 Y107.439 Z4.92
G1 Z4.52
G1 E.4 F1800
; LINE_WIDTH: 0.407109
G1 F659
M204 S6000
G1 X87.167 Y107.528 E.01188
; LINE_WIDTH: 0.462584
G2 X87.456 Y107.55 I.313 J-2.235 E.00776
G1 X91.03 Y107.55 E.09571
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11383.609
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 29/141
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.92 I1.217 J-.027 P1  F42000
G1 X89.823 Y98.12 Z4.92
G1 Z4.68
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F658
M204 S6000
G3 X90.934 Y97.787 I1.022 J1.392 E.02853
G1 X90.98 Y97.37 E.01013
G3 X90.441 Y97.401 I-.146 J2.156 E.31443
G1 X90.923 Y97.364 E.01166
; WIPE_START
G1 F9000
G1 X91.39 Y97.432 E-.1796
G1 X91.837 Y97.602 E-.1818
G1 X91.878 Y97.629 E-.0186
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.08 I1.201 J-.194 P1  F42000
G1 X89.899 Y85.375 Z5.08
G1 Z4.68
G1 E.4 F1800
G1 F658
M204 S6000
G3 X91.016 Y85.058 I1.055 J1.592 E.02844
G1 X91.084 Y84.644 E.01013
G1 X91.307 Y84.68 E.00546
G3 X90.1 Y84.786 I-.422 J2.132 E.29964
G3 X91.027 Y84.634 I.807 J2.027 E.02281
; WIPE_START
G1 F9000
G1 X91.307 Y84.68 E-.10805
G1 X91.931 Y84.886 E-.24944
G1 X91.98 Y84.919 E-.02251
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.08 I1.207 J-.156 P1  F42000
G1 X90.859 Y76.24 Z5.08
G1 Z4.68
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.829 Y76.278 E.00117
G2 X90.977 Y75.465 I-2.245 J-.83 E.02002
G3 X91.812 Y75.629 I.238 J.995 E.02116
G3 X91.426 Y76.203 I-.48 J.095 E.01856
G3 X90.759 Y77.049 I-8.849 J-6.29 E.02599
G3 X90.305 Y76.807 I-.206 J-.161 E.01758
G3 X90.7 Y75.534 I2.394 J.044 E.03258
G1 X90.92 Y75.459 E.00561
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.562 Y75.479 E-.24414
G1 X91.812 Y75.629 E-.11091
G1 X91.816 Y75.694 E-.02495
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.08 I1.11 J-.498 P1  F42000
G1 X90.773 Y73.368 Z5.08
G1 Z4.68
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.914 Y73.535 I.418 J-.21 E.00532
G3 X90.8 Y73.513 I-.044 J-.079 E.00304
G1 X90.395 Y72.328 E.03021
G3 X91.129 Y73.141 I-.372 J1.073 E.02755
G3 X91.658 Y73.686 I-2.322 J2.784 E.01837
G3 X91.22 Y74.047 I-.313 J.067 E.01683
G3 X90.472 Y73.78 I.178 J-1.686 E.01935
G3 X90.192 Y72.587 I3.046 J-1.343 E.02972
G3 X90.337 Y72.326 I.892 J.326 E.00725
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.635 Y72.422 E-.11899
G1 X90.798 Y72.581 E-.08627
G1 X91.032 Y72.977 E-.17474
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.08 I-.35 J-1.166 P1  F42000
G1 X87.368 Y74.076 Z5.08
G1 Z4.68
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X87.362 Y74.089 E.00035
G3 X87.22 Y74.061 I-.041 J-.167 E.00359
G1 X87.369 Y74.064 E.00358
G1 X87.947 Y73.158 E.02594
G3 X87.788 Y74.114 I-.64 J.385 E.02546
G3 X87.057 Y74.449 I-.468 J-.057 E.02321
G3 X86.169 Y73.997 I-.079 J-.944 E.02529
G3 X87.198 Y73.641 I.777 J.58 E.02789
G3 X87.897 Y73.13 I1.216 J.931 E.02116
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.003 Y73.271 E-.06697
G1 X88.033 Y73.735 E-.17669
G1 X87.838 Y74.036 E-.13634
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.08 I-1.217 J.017 P1  F42000
G1 X87.871 Y76.377 Z5.08
G1 Z4.68
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X87.621 Y76.402 E.00604
G3 X88.314 Y76.258 I.717 J1.713 E.01716
G1 X88.407 Y75.848 E.01013
G3 X89.107 Y76.961 I-.179 J.889 E.03545
G3 X88.367 Y76.751 I-.249 J-.532 E.02021
G1 X87.8 Y76.806 E.01374
G3 X87.121 Y77.174 I-.63 J-.352 E.01965
G3 X87.27 Y76.156 I.631 J-.428 E.02724
G3 X87.847 Y75.896 I.626 J.618 E.01561
G1 X88.352 Y75.829 E.0123
M106 S124.95
; WIPE_START
G1 X88.793 Y76.028 E-.18358
G1 X88.978 Y76.228 E-.10378
G1 X89.075 Y76.452 E-.09265
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.08 I-.831 J.889 P1  F42000
G1 X91.23 Y78.465 Z5.08
G1 Z4.68
G1 E.4 F1800
; FEATURE: Outer wall
G1 F658
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
M73 P24 R25
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.738 I-.003 J-1.292 E.04744
G1 X86.15 Y79.38 E.65974
G3 X87.374 Y78.086 I1.291 J-.004 E.04739
G1 X93.85 Y78.085 E.15617
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z4.68
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461441
G1 F658
M204 S6000
G1 X87.361 Y78.501 E.09797
G2 X87.178 Y78.52 I.09 J1.862 E.00493
; LINE_WIDTH: 0.398879
G1 X86.658 Y78.617 E.01206
; WIPE_START
G1 F13372.917
G1 X87.178 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.08 I-1.217 J-.021 P1  F42000
G1 X86.681 Y107.455 Z5.08
G1 Z4.68
G1 E.4 F1800
; LINE_WIDTH: 0.423123
G1 F658
M204 S6000
G1 X87.226 Y107.536 E.0134
; LINE_WIDTH: 0.463133
G2 X87.456 Y107.55 I.229 J-1.95 E.00617
G1 X91.03 Y107.55 E.09583
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11369.036
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 30/141
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.08 I1.216 J-.034 P1  F42000
G1 X89.77 Y98.175 Z5.08
G1 Z4.84
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F659
M204 S6000
G3 X90.853 Y97.801 I1.068 J1.338 E.02817
G1 X90.9 Y97.384 E.01013
G1 X90.991 Y97.394 E.00221
G3 X89.907 Y97.592 I-.168 J2.14 E.29833
G3 X90.842 Y97.377 I.938 J1.939 E.02332
; WIPE_START
G1 F9000
G1 X90.991 Y97.394 E-.05675
G1 X91.322 Y97.431 E-.12669
G1 X91.778 Y97.59 E-.18349
G1 X91.807 Y97.608 E-.01307
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I1.202 J-.189 P1  F42000
G1 X89.885 Y85.404 Z5.24
G1 Z4.84
G1 E.4 F1800
G1 F659
M204 S6000
G3 X90.996 Y85.072 I1.079 J1.587 E.02841
G1 X91.044 Y84.654 E.01013
G3 X90.512 Y84.683 I-.149 J2.156 E.31453
G1 X90.986 Y84.648 E.01146
; WIPE_START
G1 F9000
G1 X91.448 Y84.715 E-.1775
G1 X91.892 Y84.883 E-.18041
G1 X91.941 Y84.915 E-.02209
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I1.077 J-.566 P1  F42000
G1 X86.457 Y74.472 Z5.24
G1 Z4.84
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X86.457 Y73.737 E.01771
G3 X86.886 Y73.736 I.219 J1.15 E.0104
G1 X87.343 Y73.523 E.01215
G1 X87.343 Y74.377 E.02059
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z5.24 I-1.217 J0 P1  F42000
G1 X87.343 Y76.127 Z5.24
G1 Z4.84
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X87.343 Y77.382 E.03025
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z5.24 I.646 J1.031 P1  F42000
G1 X89.114 Y76.272 Z5.24
G1 Z4.84
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X89.114 Y77.266 E.02396
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z5.24 I.067 J1.215 P1  F42000
G1 X90.886 Y77.168 Z5.24
G1 Z4.84
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X90.886 Y75.853 E.03171
G3 X91.771 Y75.531 I.692 J.523 E.02403
G1 X91.771 Y76.157 E.0151
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z5.24 I1.124 J-.466 P1  F42000
G1 X90.886 Y74.018 Z5.24
G1 Z4.84
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X90.886 Y72.464 E.03746
M106 S124.95
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z5.24 I-1.215 J.07 P1  F42000
G1 X91.23 Y78.465 Z5.24
G1 Z4.84
G1 E.4 F1800
; FEATURE: Outer wall
G1 F659
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.739 I-.004 J-1.291 E.04743
G1 X86.15 Y79.38 E.65977
G3 X87.374 Y78.086 I1.295 J-.001 E.04735
G1 X93.85 Y78.085 E.15617
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
M73 P25 R25
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
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

G1 X91.03 Y78.5
G1 Z4.84
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461868
G1 F659
M204 S6000
G1 X87.389 Y78.5 E.09732
G2 X87.228 Y78.513 I.135 J2.86 E.00433
; LINE_WIDTH: 0.423624
G1 X86.681 Y78.594 E.01346
; WIPE_START
G1 F12522.877
G1 X87.228 Y78.513 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.24 I-1.217 J-.024 P1  F42000
G1 X86.666 Y107.441 Z5.24
G1 Z4.84
G1 E.4 F1800
; LINE_WIDTH: 0.409634
G1 F659
M204 S6000
G1 X87.184 Y107.53 E.01233
; LINE_WIDTH: 0.46274
G2 X87.456 Y107.55 I.27 J-1.904 E.00731
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.445
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 31/141
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.24 I1.217 J-.033 P1  F42000
G1 X89.775 Y98.189 Z5.24
G1 Z5
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F786
M204 S6000
G3 X90.851 Y97.816 I1.062 J1.328 E.02799
G1 X90.897 Y97.399 E.01013
G1 X90.972 Y97.407 E.00182
G3 X89.911 Y97.606 I-.15 J2.127 E.2968
G3 X90.84 Y97.393 I.932 J1.926 E.02318
; WIPE_START
G1 F9000
G1 X90.972 Y97.407 E-.05069
G1 X91.316 Y97.446 E-.1316
G1 X91.77 Y97.604 E-.18235
G1 X91.804 Y97.625 E-.01537
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.4 I1.201 J-.194 P1  F42000
G1 X89.838 Y85.457 Z5.4
G1 Z5
G1 E.4 F1800
G1 F786
M204 S6000
G3 X90.921 Y85.085 I1.065 J1.339 E.02817
G1 X90.969 Y84.668 E.01013
G1 X91.214 Y84.696 E.00597
G3 X89.976 Y84.874 I-.327 J2.121 E.2946
G3 X90.911 Y84.661 I.933 J1.941 E.02333
; WIPE_START
G1 F9000
G1 X91.214 Y84.696 E-.11603
G1 X91.846 Y84.876 E-.24946
G1 X91.878 Y84.896 E-.01452
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.4 I1.136 J-.436 P1  F42000
G1 X87.722 Y74.058 Z5.4
G1 Z5
G1 E.4 F1800
; FEATURE: Support interface
G1 F786
M204 S6000
G1 X86.24 Y74.058 E.03573
G2 X86.133 Y74.944 I2.835 J.794 E.0216
G1 X87.158 Y74.944 E.02472
G2 X87.293 Y75.829 I2.038 J.141 E.02178
G1 X86.133 Y75.829 E.02799
G2 X86.278 Y76.715 I2.844 J-.012 E.02173
G1 X88.647 Y76.715 E.05711
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z5.4 I0 J1.217 P1  F42000
G1 X91.784 Y76.715 Z5.4
G1 Z5
G1 E.4 F1800
G1 F786
M204 S6000
G1 X89.764 Y76.715 E.04872
G2 X90.587 Y75.829 I-.921 J-1.682 E.02967
G1 X91.747 Y75.829 E.02797
G2 X91.747 Y74.944 I-19.429 J-.446 E.02136
G1 X90.722 Y74.944 E.02472
G2 X90.379 Y74.058 I-1.987 J.261 E.02313
G1 X91.64 Y74.058 E.03041
G2 X91.209 Y73.172 I-2.864 J.846 E.02386
G1 X86.671 Y73.172 E.10941
G3 X87.742 Y72.287 I2.27 J1.654 E.03385
G1 X90.502 Y72.287 E.06656
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z5.4 I-1.209 J.142 P1  F42000
G1 X91.23 Y78.465 Z5.4
G1 Z5
G1 E.4 F1800
; FEATURE: Outer wall
G1 F786
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.443 Y107.965 E.10387
G3 X86.152 Y106.738 I.004 J-1.297 E.04733
G1 X86.15 Y79.38 E.65974
G3 X87.374 Y78.086 I1.293 J-.003 E.04737
G1 X93.85 Y78.085 E.15618
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z5
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.462071
G1 F786
M204 S6000
G1 X87.265 Y78.509 E.10068
; LINE_WIDTH: 0.427302
G1 X86.687 Y78.589 E.01436
; WIPE_START
G1 F12405.662
G1 X87.265 Y78.509 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.4 I-1.217 J-.025 P1  F42000
G1 X86.68 Y107.455 Z5.4
G1 Z5
G1 E.4 F1800
; LINE_WIDTH: 0.423993
G1 F786
M204 S6000
G1 X87.227 Y107.536 E.01347
; LINE_WIDTH: 0.463093
G2 X87.452 Y107.55 I.228 J-1.948 E.00603
G1 X91.03 Y107.55 E.09592
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11370.077
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 32/141
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.4 I1.217 J-.033 P1  F42000
G1 X89.779 Y98.203 Z5.4
G1 Z5.16
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F773
M204 S6000
G3 X90.848 Y97.832 I1.056 J1.319 E.02782
G1 X90.894 Y97.415 E.01013
G1 X90.954 Y97.421 E.00144
G3 X89.914 Y97.621 I-.133 J2.115 E.29529
G3 X90.837 Y97.408 I.927 J1.913 E.02303
; WIPE_START
G1 F9000
G1 X90.954 Y97.421 E-.0447
G1 X91.311 Y97.461 E-.13644
G1 X91.761 Y97.618 E-.18119
G1 X91.8 Y97.642 E-.01767
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.56 I1.202 J-.193 P1  F42000
G1 X89.846 Y85.47 Z5.56
G1 Z5.16
G1 E.4 F1800
G1 F773
M204 S6000
G3 X90.923 Y85.101 I1.058 J1.33 E.02799
G1 X90.97 Y84.683 E.01013
G1 X91.218 Y84.711 E.00601
G3 X89.983 Y84.888 I-.329 J2.104 E.29214
G3 X90.913 Y84.677 I.927 J1.928 E.02318
; WIPE_START
G1 F9000
G1 X91.218 Y84.711 E-.11674
G1 X91.841 Y84.89 E-.24641
G1 X91.879 Y84.914 E-.01686
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.56 I1.207 J-.156 P1  F42000
G1 X90.886 Y77.241 Z5.56
G1 Z5.16
G1 E.4 F1800
; FEATURE: Support interface
G1 F773
M204 S6000
G1 X90.886 Y72.802 E.10706
G2 X90 Y72.226 I-2.041 J2.17 E.02561
G1 X90 Y73.681 E.03509
G2 X89.114 Y73.342 I-1.047 J1.409 E.02315
G1 X89.114 Y72.023 E.03181
G2 X88.229 Y72.11 I-.173 J2.812 E.02155
G1 X88.229 Y73.481 E.03307
G2 X87.343 Y74.314 I.794 J1.731 E.02985
G1 X87.343 Y72.517 E.04335
G2 X86.457 Y73.516 I1.6 J2.311 E.0325
G1 X86.457 Y77.134 E.08725
G2 X86.634 Y77.21 I.098 J.017 E.00637
G3 X87.343 Y77.069 I.898 J2.646 E.01748
G1 X87.345 Y75.943 E.02715
G2 X88.229 Y76.77 I1.616 J-.842 E.02975
G1 X88.229 Y77.068 E.00721
G1 X89.114 Y77.068 E.02136
G1 X89.114 Y76.907 E.00389
G2 X90 Y76.569 I-.254 J-1.996 E.02307
G1 X90 Y77.241 E.01621
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z5.56 I-.858 J.863 P1  F42000
G1 X91.23 Y78.465 Z5.56
G1 Z5.16
G1 E.4 F1800
; FEATURE: Outer wall
G1 F773
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
M73 P26 R25
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.738 I-.001 J-1.294 E.04743
G1 X86.15 Y79.38 E.65974
G3 X87.374 Y78.086 I1.295 J-.001 E.04735
G1 X93.85 Y78.085 E.15618
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z5.16
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46207
G1 F773
M204 S6000
G1 X87.389 Y78.5 E.09737
G2 X87.265 Y78.509 I.047 J1.665 E.00333
; LINE_WIDTH: 0.427266
G1 X86.688 Y78.589 E.01433
; WIPE_START
G1 F12406.804
G1 X87.265 Y78.509 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.56 I-1.217 J-.025 P1  F42000
G1 X86.666 Y107.441 Z5.56
G1 Z5.16
G1 E.4 F1800
; LINE_WIDTH: 0.409616
G1 F773
M204 S6000
G1 X87.183 Y107.53 E.01232
; LINE_WIDTH: 0.462747
G2 X87.456 Y107.55 I.271 J-1.91 E.00732
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.264
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 33/141
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.56 I1.217 J-.032 P1  F42000
G1 X89.783 Y98.217 Z5.56
G1 Z5.32
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F636
M204 S6000
G3 X90.845 Y97.848 I1.051 J1.31 E.02764
G1 X90.891 Y97.431 E.01013
G1 X90.935 Y97.436 E.00108
M73 P26 R24
G3 X89.916 Y97.636 I-.115 J2.103 E.29377
G3 X90.833 Y97.424 I.922 J1.901 E.02288
; WIPE_START
G1 F9000
G1 X90.935 Y97.436 E-.03894
G1 X91.304 Y97.476 E-.14105
G1 X91.752 Y97.632 E-.18008
G1 X91.796 Y97.66 E-.01993
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.72 I1.202 J-.192 P1  F42000
G1 X89.855 Y85.484 Z5.72
G1 Z5.32
G1 E.4 F1800
G1 F636
M204 S6000
G3 X90.925 Y85.116 I1.052 J1.321 E.02782
G1 X90.972 Y84.699 E.01013
G1 X91.219 Y84.727 E.006
G3 X89.991 Y84.902 I-.329 J2.09 E.2902
G3 X90.915 Y84.692 I.921 J1.915 E.02303
; WIPE_START
G1 F9000
G1 X91.219 Y84.727 E-.11655
G1 X91.837 Y84.904 E-.24423
G1 X91.88 Y84.931 E-.01921
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.72 I1.211 J-.122 P1  F42000
G1 X91.23 Y78.465 Z5.72
G1 Z5.32
G1 E.4 F1800
; FEATURE: Outer wall
G1 F636
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.739 I-.004 J-1.291 E.04743
G1 X86.15 Y79.38 E.65977
G3 X87.374 Y78.086 I1.291 J-.004 E.04739
G1 X93.85 Y78.085 E.15618
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z5.32
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.462069
G1 F636
M204 S6000
G1 X87.265 Y78.509 E.10069
; LINE_WIDTH: 0.427231
G1 X86.687 Y78.589 E.01433
; WIPE_START
G1 F12407.913
G1 X87.265 Y78.509 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.72 I-1.217 J-.025 P1  F42000
G1 X86.666 Y107.441 Z5.72
G1 Z5.32
G1 E.4 F1800
; LINE_WIDTH: 0.409652
G1 F636
M204 S6000
G1 X87.183 Y107.53 E.01232
; LINE_WIDTH: 0.462748
G2 X87.456 Y107.55 I.271 J-1.912 E.00732
G1 X91.03 Y107.55 E.09574
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.24
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 34/141
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.72 I1.217 J-.032 P1  F42000
G1 X89.786 Y98.232 Z5.72
G1 Z5.48
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F1380
M204 S6000
G3 X90.841 Y97.865 I1.045 J1.3 E.02746
G1 X90.917 Y97.451 E.01016
G3 X90.362 Y97.495 I-.113 J2.088 E.30339
G1 X90.829 Y97.441 E.01135
; WIPE_START
G1 F9000
G1 X91.297 Y97.492 E-.17886
G1 X91.742 Y97.647 E-.17892
G1 X91.791 Y97.678 E-.02222
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.88 I1.202 J-.19 P1  F42000
G1 X89.864 Y85.497 Z5.88
G1 Z5.48
G1 E.4 F1800
G1 F1380
M204 S6000
G3 X90.927 Y85.132 I1.045 J1.312 E.02764
G1 X90.974 Y84.715 E.01013
G1 X91.218 Y84.742 E.00592
M73 P27 R24
G3 X89.999 Y84.916 I-.326 J2.076 E.28832
G3 X90.917 Y84.708 I.914 J1.903 E.02288
; WIPE_START
G1 F9000
G1 X91.218 Y84.742 E-.1153
G1 X91.833 Y84.919 E-.24312
G1 X91.881 Y84.949 E-.02158
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.88 I1.086 J-.549 P1  F42000
G1 X88.419 Y78.098 Z5.88
G1 Z5.48
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1380
M204 S6000
G1 X88.379 Y78.059 E.00145
G1 X88.144 Y77.822 E.00869
M106 S124.95
M106 S127.5
G1 F600
G1 X88.222 Y77.676 E.00429
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G1 X88.231 Y77.659 E.00051
G1 X88.317 Y77.676 E.00229
M106 S124.95
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X88.549 Y77.723 E.00615
M106 S124.95
M106 S127.5
G1 X88.809 Y77.749 E.0068
M106 S124.95
M106 S127.5
G1 X89.071 Y77.749 E.00679
M106 S124.95
M106 S127.5
G1 X89.332 Y77.723 E.00681
M106 S124.95
M106 S127.5
G1 X89.564 Y77.676 E.00617
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G2 X89.732 Y77.627 I-.162 J-.863 E.00455
G1 X89.764 Y77.676 E.00152
M106 S124.95
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X89.834 Y77.786 E.0034
M106 S124.95
M106 S127.5
G1 F1320
G1 X89.592 Y78.058 E.00948
M106 S124.95
M106 S127.5
G1 F1380
G1 X89.556 Y78.098 E.00139
G1 X89.156 Y78.098 E.0104
G1 X88.756 Y78.098 E.0104
G1 X88.479 Y78.098 E.00721
; WIPE_START
G1 F11728.231
G1 X88.379 Y78.059 E-.04065
G1 X88.144 Y77.822 E-.12702
G1 X88.222 Y77.676 E-.06276
G1 X88.231 Y77.659 E-.00752
G1 X88.317 Y77.676 E-.03341
G1 X88.549 Y77.723 E-.08985
G1 X88.598 Y77.728 E-.0188
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.88 I-.796 J.921 P1  F42000
G1 X89.508 Y78.514 Z5.88
G1 Z5.48
G1 E.4 F1800
G1 F1380
M204 S6000
G1 X88.438 Y78.514 E.02782
G1 X88.038 Y78.514 E.0104
G1 X87.638 Y78.514 E.0104
G1 X87.594 Y78.319 E.00518
G1 X87.905 Y78.172 E.00896
G1 X87.793 Y78.059 E.00413
G1 F720
G1 X87.413 Y77.676 E.01402
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall
G1 F600
M204 S5000
G3 X86.551 Y75.577 I1.647 J-1.903 E.0612
G1 X86.772 Y75.552 E.00579
G1 X86.811 Y75.723 E.00457
M106 S124.95
M106 S127.5

G2 X91.114 Y75.552 I2.131 J-.605 E.15358
G1 X91.329 Y75.582 E.00565
G3 X90.49 Y77.676 I-2.636 J.158 E.06057
M106 S124.95
M106 S127.5
; FEATURE: Inner wall
G1 F720
M204 S6000
G1 X90.149 Y78.058 E.01332
M106 S124.95
M106 S127.5
G1 F1380
G1 X89.882 Y78.357 E.0104
G1 X89.742 Y78.514 E.00547
G1 X89.568 Y78.514 E.00453
; WIPE_START
G1 F6593.748
G1 X88.568 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.88 I.991 J.706 P1  F42000
G1 X89.883 Y76.667 Z5.88
G1 Z5.48
G1 E.4 F1800
; FEATURE: Overhang wall
G1 F600
M204 S5000
G3 X88.67 Y73.335 I-.943 J-1.544 E.16646
G1 X88.85 Y73.317 E.00469
G3 X89.933 Y76.635 I.09 J1.807 E.12273
M106 S124.95
M106 S127.5
; WIPE_START
M204 S6000
G1 X89.559 Y76.826 E-.15949
G1 X89.21 Y76.915 E-.13706
G1 X88.99 Y76.926 E-.08345
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.88 I.906 J.812 P1  F42000
G1 X91.089 Y74.585 Z5.88
G1 Z5.48
G1 E.4 F1800
G1 F600
M204 S5000
G2 X86.798 Y74.583 I-2.146 J.544 E.15211
G1 X86.567 Y74.53 E.00617
G3 X89.116 Y72.442 I2.382 J.307 E.09441
G3 X91.313 Y74.528 I-.18 J2.39 E.08523
G1 X91.147 Y74.57 E.00446
M106 S124.95
; WIPE_START
M204 S6000
G1 X90.999 Y74.317 E-.11165
G1 X90.798 Y73.925 E-.16734
G1 X90.669 Y73.746 E-.08373
G1 X90.637 Y73.713 E-.01728
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.88 I-1.217 J.007 P1  F42000
G1 X90.662 Y78.085 Z5.88
G1 Z5.48
G1 E.4 F1800
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1380
M204 S5000
G1 X93.85 Y78.085 E.07688
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.311 E.65976
G3 X86.278 Y78.823 I1.311 J.078 E.01222
G1 X86.369 Y78.656 E.00459
G1 X86.576 Y78.417 E.00762
G1 X86.83 Y78.238 E.0075
G1 X87.188 Y78.068 E.00956
G1 F864.82
G1 X87.222 Y78.052 E.0009
G1 F720
G1 X86.927 Y77.756 E.01009
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
G1 X86.916 Y77.744 E.00041
G3 X86.15 Y75.822 I2.067 J-1.937 E.05507
G3 X86.164 Y74.547 I11.306 J-.514 E.03315
G3 X89.146 Y72.042 I2.778 J.28 E.11201
M106 S124.95
M106 S127.5

G3 X91.73 Y74.827 I-.216 J2.791 E.10853
G3 X91.717 Y76.089 I-11.725 J.513 E.0328
G3 X91.027 Y77.675 I-2.827 J-.287 E.0457
M106 S124.95
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X90.702 Y78.04 E.01177
M106 S124.95
; WIPE_START
M204 S6000
G1 X91.702 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z5.48
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F1380
M204 S6000
G1 X90.024 Y78.5 E.02701
; WIPE_START
G1 F11354.373
G1 X91.024 Y78.5 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.88 I.828 J-.891 P1  F42000
G1 X89.824 Y77.384 Z5.88
G1 Z5.48
G1 E.4 F1800
; LINE_WIDTH: 0.36142
G1 F1380
M204 S6000
G1 X90.071 Y77.454 E.00527
; LINE_WIDTH: 0.422469
G1 X90.121 Y77.467 E.00125
G1 X90.202 Y77.403 E.00251
; LINE_WIDTH: 0.3929
G1 X90.283 Y77.339 E.00231
; LINE_WIDTH: 0.357548
G1 X90.387 Y77.248 E.0028
; LINE_WIDTH: 0.325796
G1 X90.479 Y77.168 E.00222
; LINE_WIDTH: 0.288487
G1 X90.632 Y77.01 E.00348
; LINE_WIDTH: 0.240703
G1 X90.756 Y76.856 E.00255
; LINE_WIDTH: 0.193457
G1 X90.867 Y76.693 E.00197
; LINE_WIDTH: 0.149569
G2 X90.941 Y76.566 I-2.633 J-1.624 E.00105
; LINE_WIDTH: 0.107776
G2 X91.02 Y76.401 I-3.504 J-1.783 E.00084
; WIPE_START
G1 F18000
G1 X90.941 Y76.566 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.88 I1.141 J-.423 P1  F42000
G1 X89.526 Y72.751 Z5.88
G1 Z5.48
G1 E.4 F1800
; LINE_WIDTH: 0.0944787
G1 F1380
M204 S6000
G2 X88.354 Y72.751 I-.586 J2.259 E.00446
; WIPE_START
G1 F18000
G1 X88.576 Y72.703 E-.08653
G1 X88.886 Y72.676 E-.11831
G1 X89.208 Y72.691 E-.12224
G1 X89.345 Y72.717 E-.05293
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.88 I-1.01 J-.679 P1  F42000
G1 X86.862 Y76.407 Z5.88
G1 Z5.48
G1 E.4 F1800
; LINE_WIDTH: 0.0996656
G1 F1380
M204 S6000
G1 X86.917 Y76.522 E.00052
; LINE_WIDTH: 0.139386
G2 X86.998 Y76.67 I3.121 J-1.606 E.00111
; LINE_WIDTH: 0.178902
G1 X87.072 Y76.783 E.00123
; LINE_WIDTH: 0.220504
G1 X87.192 Y76.943 E.00232
; LINE_WIDTH: 0.264195
G2 X87.301 Y77.068 I2.68 J-2.228 E.00239
; LINE_WIDTH: 0.30692
G2 X87.464 Y77.224 I3.232 J-3.236 E.00385
; LINE_WIDTH: 0.346488
G1 X87.594 Y77.328 E.00324
; LINE_WIDTH: 0.38044
G1 X87.689 Y77.403 E.00263
; LINE_WIDTH: 0.412586
G1 X87.857 Y77.523 E.00487
; LINE_WIDTH: 0.441628
G1 X88.009 Y77.632 E.00478
; WIPE_START
G1 F11969.32
G1 X87.857 Y77.523 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.88 I-1.098 J-.524 P1  F42000
G1 X87.417 Y78.445 Z5.88
G1 Z5.48
G1 E.4 F1800
; LINE_WIDTH: 0.3412
G1 F1380
M204 S6000
G1 X86.624 Y78.654 E.01573
; WIPE_START
G1 F15886.518
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.88 I-1.217 J-.031 P1  F42000
G1 X86.682 Y107.455 Z5.88
G1 Z5.48
G1 E.4 F1800
; LINE_WIDTH: 0.423134
G1 F1380
M204 S6000
G1 X87.226 Y107.536 E.01338
; LINE_WIDTH: 0.463124
G2 X87.456 Y107.55 I.23 J-1.966 E.00616
G1 X91.03 Y107.55 E.09583
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11369.257
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 35/141
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.88 I1.217 J-.032 P1  F42000
G1 X89.789 Y98.248 Z5.88
G1 Z5.64
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F957
M204 S6000
G3 X90.836 Y97.881 I1.104 J1.476 E.02718
G1 X90.901 Y97.466 E.01014
G3 X90.36 Y97.512 I-.097 J2.076 E.30173
G1 X90.824 Y97.458 E.01127
; WIPE_START
G1 F9000
G1 X91.289 Y97.509 E-.17772
G1 X91.731 Y97.662 E-.17779
G1 X91.786 Y97.696 E-.02449
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.04 I1.202 J-.189 P1  F42000
G1 X89.867 Y85.499 Z6.04
G1 Z5.64
G1 E.4 F1800
G1 F957
M204 S6000
G3 X90.93 Y85.148 I.982 J1.187 E.02763
G1 X90.978 Y84.731 E.01013
G1 X91.214 Y84.758 E.00573
G3 X91.337 Y88.909 I-.291 J2.086 E.14247
G3 X90.92 Y84.724 I-.393 J-2.074 E.16887
; WIPE_START
G1 F9000
G1 X91.214 Y84.758 E-.1122
G1 X91.83 Y84.933 E-.24336
G1 X91.884 Y84.968 E-.02444
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.04 I1.087 J-.548 P1  F42000
G1 X88.419 Y78.098 Z6.04
G1 Z5.64
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F957
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.736 Y77.63 I.712 J-2.55 E.0396
G1 X89.832 Y77.788 E.0048
G1 X89.555 Y78.098 E.01082
G1 X88.479 Y78.098 E.02797
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.1672
G1 X88.234 Y77.653 E-.07214
G1 X88.597 Y77.723 E-.14067
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.04 I-.799 J.918 P1  F42000
G1 X89.506 Y78.514 Z6.04
G1 Z5.64
G1 E.4 F1800
G1 F957
M204 S6000
G1 X87.638 Y78.514 E.04857
G1 X87.594 Y78.319 E.00518
G1 X87.905 Y78.172 E.00896
G3 X87.135 Y77.389 I7.871 J-8.525 E.02855
G3 X86.551 Y75.582 I1.903 J-1.613 E.05064
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.495 J.197 E.05023
G1 X89.741 Y78.514 E.03973
G1 X89.566 Y78.514 E.00454
; WIPE_START
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.04 I1.049 J.616 P1  F42000
G1 X89.562 Y76.818 Z6.04
G1 Z5.64
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F957
M204 S5000
G1 X89.298 Y76.896 E.00665
G3 X88.76 Y73.323 I-.36 J-1.773 E.1415
G1 X88.933 Y73.315 E.00418
G3 X89.642 Y76.79 I.005 J1.809 E.11973
G1 X89.619 Y76.798 E.00059
; WIPE_START
G1 F12000
M204 S6000
G1 X89.298 Y76.896 E-.12754
G1 X89.12 Y76.926 E-.06858
G1 X88.76 Y76.926 E-.13697
G1 X88.639 Y76.901 E-.04691
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.04 I.917 J-.8 P1  F42000
G1 X86.567 Y74.528 Z6.04
G1 Z5.64
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F957
M204 S6000
G3 X89.112 Y72.442 I2.381 J.309 E.09422
G3 X91.313 Y74.53 I-.176 J2.39 E.08542
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.544 E.15217
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.1609
G1 X86.842 Y73.682 E-.18075
G1 X86.899 Y73.599 E-.03834
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.04 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z6.04
G1 Z5.64
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F957
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
M73 P28 R24
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.311 E.65976
G3 X86.83 Y78.238 I1.332 J.091 E.03189
G1 X87.222 Y78.052 E.01046
G3 X86.153 Y75.957 I1.944 J-2.312 E.05826
G3 X86.164 Y74.547 I36.602 J-.427 E.03401
G3 X89.141 Y72.042 I2.778 J.28 E.1038
G3 X91.73 Y74.827 I-.21 J2.791 E.10081
G3 X91.717 Y76.093 I-11.473 J.514 E.03054
G3 X91.064 Y77.633 I-2.791 J-.274 E.04096
G1 X90.701 Y78.04 E.01314
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z5.64
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F957
M204 S6000
G1 X90.022 Y78.5 E.02704
M204 S10000
G1 X89.96 Y77.597 F42000
; LINE_WIDTH: 0.408136
G1 F957
M204 S6000
G2 X90.289 Y77.332 I-5.151 J-6.74 E.00988
; LINE_WIDTH: 0.357447
G1 X90.383 Y77.254 E.00246
; LINE_WIDTH: 0.324015
G1 X90.496 Y77.15 E.00279
; LINE_WIDTH: 0.297425
G1 X90.566 Y77.082 E.0016
; LINE_WIDTH: 0.265039
G2 X90.695 Y76.935 I-2.953 J-2.722 E.00282
; LINE_WIDTH: 0.218227
G1 X90.813 Y76.776 E.00228
; LINE_WIDTH: 0.178683
G1 X90.879 Y76.675 E.00109
; LINE_WIDTH: 0.139454
G2 X90.965 Y76.517 I-3.726 J-2.134 E.00118
; LINE_WIDTH: 0.0989482
G1 X91.017 Y76.408 E.00049
; WIPE_START
G1 F18000
G1 X90.965 Y76.517 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.04 I-.429 J-1.139 P1  F42000
G1 X88.007 Y77.63 Z6.04
G1 Z5.64
G1 E.4 F1800
; LINE_WIDTH: 0.441138
G1 F957
M204 S6000
G1 X87.855 Y77.522 E.00474
; LINE_WIDTH: 0.412426
G1 X87.689 Y77.403 E.00484
; LINE_WIDTH: 0.380433
G1 X87.594 Y77.328 E.00263
; LINE_WIDTH: 0.346626
G1 X87.466 Y77.225 E.00321
; LINE_WIDTH: 0.306048
G3 X87.301 Y77.069 I1.491 J-1.734 E.00385
; LINE_WIDTH: 0.264238
G3 X87.192 Y76.943 I2.605 J-2.385 E.0024
; LINE_WIDTH: 0.232385
G1 X87.13 Y76.865 E.00123
; LINE_WIDTH: 0.195526
G1 X87.017 Y76.699 E.00202
; LINE_WIDTH: 0.149889
G3 X86.937 Y76.562 I2.613 J-1.619 E.00115
; LINE_WIDTH: 0.106973
G3 X86.86 Y76.401 I2.748 J-1.402 E.00081
; WIPE_START
G1 F18000
G1 X86.937 Y76.562 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.04 I1.144 J.415 P1  F42000
G1 X88.315 Y72.763 Z6.04
G1 Z5.64
G1 E.4 F1800
; LINE_WIDTH: 0.0940134
G1 F957
M204 S6000
G3 X89.526 Y72.751 I.628 J2.189 E.00457
; WIPE_START
G1 F18000
G1 X89.304 Y72.703 E-.08643
G1 X88.923 Y72.675 E-.14504
G1 X88.673 Y72.69 E-.09532
G1 X88.535 Y72.718 E-.05321
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.04 I-1.215 J-.065 P1  F42000
G1 X86.664 Y107.439 Z6.04
G1 Z5.64
G1 E.4 F1800
; LINE_WIDTH: 0.406661
G1 F957
M204 S6000
G1 X87.164 Y107.527 E.01182
; LINE_WIDTH: 0.462558
G2 X87.456 Y107.55 I.315 J-2.219 E.00784
G1 X91.03 Y107.55 E.0957
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11384.28
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 36/141
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.04 I1.217 J-.031 P1  F42000
G1 X89.791 Y98.264 Z6.04
G1 Z5.8
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F965
M204 S6000
G3 X90.831 Y97.898 I1.096 J1.459 E.02701
G1 X90.886 Y97.482 E.01013
G3 X90.357 Y97.529 I-.085 J2.06 E.29959
G1 X90.819 Y97.475 E.0112
; WIPE_START
G1 F9000
G1 X91.281 Y97.525 E-.17659
G1 X91.72 Y97.677 E-.17663
G1 X91.78 Y97.715 E-.02677
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.2 I1.201 J-.199 P1  F42000
G1 X89.758 Y85.515 Z6.2
G1 Z5.8
G1 E.4 F1800
G1 F965
M204 S6000
G3 X90.808 Y85.119 I1.04 J1.169 E.02768
G1 X90.865 Y84.703 E.01013
G3 X92.164 Y88.669 I-.051 J2.213 E.13142
G3 X89.901 Y84.896 I-1.122 J-1.893 E.16611
G3 X90.807 Y84.695 I.859 J1.731 E.02261
; WIPE_START
G1 F9000
G1 X91.351 Y84.777 E-.20902
G1 X91.775 Y84.929 E-.17098
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.2 I1.092 J-.537 P1  F42000
G1 X88.419 Y78.098 Z6.2
G1 Z5.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F965
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.742 Y77.629 I.713 J-2.559 E.03974
G1 X89.837 Y77.786 E.00479
G1 X89.561 Y78.098 E.01085
G1 X88.479 Y78.098 E.02812
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.1672
G1 X88.234 Y77.653 E-.07214
G1 X88.597 Y77.723 E-.14066
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.2 I-.794 J.922 P1  F42000
G1 X89.515 Y78.514 Z6.2
G1 Z5.8
G1 E.4 F1800
G1 F965
M204 S6000
G1 X87.638 Y78.514 E.04879
G1 X87.594 Y78.319 E.00518
G1 X87.905 Y78.172 E.00896
G3 X87.131 Y77.385 I7.915 J-8.569 E.02871
G3 X86.551 Y75.582 I1.909 J-1.609 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.766 Y77.365 I-2.496 J.196 E.04995
G1 X89.748 Y78.514 E.0399
G1 X89.575 Y78.514 E.00449
; WIPE_START
G1 F11728.231
G1 X88.575 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.2 I1.05 J.616 P1  F42000
G1 X89.572 Y76.815 Z6.2
G1 Z5.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F965
M204 S5000
G1 X89.298 Y76.896 E.00689
G3 X88.76 Y73.323 I-.361 J-1.773 E.14154
G1 X88.93 Y73.315 E.00411
G3 X89.642 Y76.79 I.007 J1.809 E.11976
G1 X89.629 Y76.795 E.00034
; WIPE_START
G1 F12000
M204 S6000
G1 X89.298 Y76.896 E-.13136
G1 X89.12 Y76.926 E-.06857
G1 X88.76 Y76.926 E-.13695
G1 X88.649 Y76.903 E-.04311
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.2 I.915 J-.802 P1  F42000
G1 X86.567 Y74.528 Z6.2
G1 Z5.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F965
M204 S6000
G3 X89.107 Y72.441 I2.381 J.309 E.0941
G3 X91.313 Y74.53 I-.171 J2.39 E.08553
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.544 E.15217
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16107
G1 X86.842 Y73.682 E-.18068
G1 X86.899 Y73.599 E-.03825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.2 I-.932 J.782 P1  F42000
G1 X90.664 Y78.085 Z6.2
G1 Z5.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F965
M204 S5000
G1 X93.85 Y78.085 E.07684
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.311 E.65976
G3 X86.83 Y78.238 I1.299 J.071 E.03196
G1 X87.222 Y78.052 E.01046
G3 X86.153 Y75.957 I1.944 J-2.312 E.05826
G3 X86.164 Y74.547 I36.625 J-.427 E.03401
G3 X89.136 Y72.042 I2.778 J.28 E.10369
G3 X91.73 Y74.827 I-.207 J2.793 E.10091
G3 X91.716 Y76.098 I-11.245 J.514 E.03066
G3 X91.071 Y77.624 I-2.787 J-.278 E.04057
G1 X90.703 Y78.04 E.01338
; WIPE_START
G1 F12000
M204 S6000
G1 X91.703 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z5.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F965
M204 S6000
G1 X90.028 Y78.5 E.02689
M204 S10000
G1 X89.964 Y77.594 F42000
; LINE_WIDTH: 0.408986
G1 F965
M204 S6000
G2 X90.289 Y77.332 I-5.023 J-6.554 E.00978
; LINE_WIDTH: 0.357831
G1 X90.383 Y77.254 E.00246
; LINE_WIDTH: 0.323054
G1 X90.502 Y77.144 E.00294
; LINE_WIDTH: 0.284451
G1 X90.63 Y77.011 E.00288
; LINE_WIDTH: 0.245052
G1 X90.737 Y76.883 E.00219
; LINE_WIDTH: 0.210239
G1 X90.813 Y76.776 E.00144
; LINE_WIDTH: 0.178709
G1 X90.879 Y76.675 E.00109
; LINE_WIDTH: 0.139522
G2 X90.965 Y76.518 I-3.735 J-2.139 E.00118
; LINE_WIDTH: 0.0989986
G1 X91.017 Y76.409 E.00049
; WIPE_START
G1 F18000
G1 X90.965 Y76.518 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.2 I1.137 J-.434 P1  F42000
G1 X89.526 Y72.751 Z6.2
G1 Z5.8
G1 E.4 F1800
; LINE_WIDTH: 0.0940206
G1 F965
M204 S6000
G2 X88.315 Y72.763 I-.583 J2.202 E.00457
; WIPE_START
G1 F18000
G1 X88.672 Y72.69 E-.13853
G1 X88.919 Y72.675 E-.09403
G1 X89.209 Y72.691 E-.11023
G1 X89.305 Y72.709 E-.03721
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.2 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z6.2
G1 Z5.8
G1 E.4 F1800
; LINE_WIDTH: 0.10696
G1 F965
M204 S6000
G2 X86.937 Y76.562 I2.834 J-1.246 E.00081
; LINE_WIDTH: 0.149899
G2 X87.017 Y76.699 I2.677 J-1.472 E.00115
; LINE_WIDTH: 0.195592
G1 X87.13 Y76.865 E.00203
; LINE_WIDTH: 0.23244
G1 X87.192 Y76.943 E.00123
; LINE_WIDTH: 0.26429
G2 X87.301 Y77.069 I2.7 J-2.248 E.0024
; LINE_WIDTH: 0.307017
G2 X87.464 Y77.223 I3.177 J-3.18 E.00383
; LINE_WIDTH: 0.34643
G1 X87.593 Y77.328 E.00324
; LINE_WIDTH: 0.380392
G1 X87.689 Y77.403 E.00263
; LINE_WIDTH: 0.412379
G1 X87.855 Y77.522 E.00484
; LINE_WIDTH: 0.441146
G1 X88.007 Y77.63 E.00474
; WIPE_START
G1 F11983.498
G1 X87.855 Y77.522 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.2 I-1.099 J-.522 P1  F42000
G1 X87.417 Y78.445 Z6.2
G1 Z5.8
G1 E.4 F1800
; LINE_WIDTH: 0.341163
G1 F965
M204 S6000
G1 X86.624 Y78.654 E.01573
; WIPE_START
G1 F15888.446
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.2 I-1.217 J-.031 P1  F42000
G1 X86.68 Y107.455 Z6.2
G1 Z5.8
G1 E.4 F1800
; LINE_WIDTH: 0.423256
G1 F965
M204 S6000
G1 X87.226 Y107.536 E.01342
; LINE_WIDTH: 0.463123
G2 X87.456 Y107.55 I.231 J-1.978 E.00617
G1 X91.03 Y107.55 E.09583
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11369.292
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 37/141
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.2 I1.217 J-.031 P1  F42000
G1 X89.792 Y98.28 Z6.2
G1 Z5.96
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F966
M204 S6000
G3 X90.825 Y97.916 I1.089 J1.443 E.02683
G1 X90.873 Y97.499 E.01013
G3 X90.354 Y97.546 I-.076 J2.047 E.29773
G1 X90.813 Y97.492 E.01113
; WIPE_START
G1 F9000
G1 X91.272 Y97.542 E-.17544
G1 X91.7 Y97.69 E-.17224
G1 X91.772 Y97.735 E-.03232
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.36 I1.2 J-.202 P1  F42000
G1 X89.706 Y85.481 Z6.36
G1 Z5.96
G1 E.4 F1800
G1 F966
M204 S6000
G3 X90.764 Y85.07 I1.043 J1.116 E.02806
G1 X90.822 Y84.654 E.01013
G1 X91.059 Y84.686 E.00578
G3 X92.557 Y88.424 I-.341 J2.305 E.11722
M73 P29 R24
G3 X89.604 Y88.423 I-1.476 J-1.563 E.07849
G3 X89.487 Y85.096 I1.512 J-1.719 E.08988
G3 X90.764 Y84.646 I1.299 J1.646 E.03326
; WIPE_START
G1 F9000
G1 X91.059 Y84.686 E-.11299
G1 X91.727 Y84.904 E-.26701
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.36 I1.095 J-.532 P1  F42000
G1 X88.419 Y78.098 Z6.36
G1 Z5.96
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F966
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.736 Y77.63 I.712 J-2.547 E.0396
G1 X89.832 Y77.788 E.0048
G1 X89.555 Y78.098 E.01082
G1 X88.479 Y78.098 E.02797
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.16721
G1 X88.234 Y77.653 E-.07214
G1 X88.597 Y77.723 E-.14065
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.36 I-.799 J.918 P1  F42000
G1 X89.506 Y78.514 Z6.36
G1 Z5.96
G1 E.4 F1800
G1 F966
M204 S6000
G1 X87.638 Y78.514 E.04856
G1 X87.594 Y78.319 E.00518
G1 X87.905 Y78.172 E.00896
G3 X87.14 Y77.396 I7.819 J-8.474 E.02833
G3 X86.551 Y75.582 I1.896 J-1.619 E.05086
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.498 J.196 E.05022
G1 X89.741 Y78.514 E.03974
G1 X89.566 Y78.514 E.00454
; WIPE_START
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.36 I1.048 J.619 P1  F42000
G1 X89.572 Y76.813 Z6.36
G1 Z5.96
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F966
M204 S5000
G1 X89.473 Y76.851 E.00257
G3 X88.76 Y73.323 I-.536 J-1.728 E.14592
G1 X88.927 Y73.315 E.00405
G3 X89.804 Y76.711 I.009 J1.809 E.11544
G1 X89.627 Y76.789 E.00466
; WIPE_START
G1 F12000
M204 S6000
G1 X89.473 Y76.851 E-.06327
G1 X89.12 Y76.926 E-.13687
G1 X88.76 Y76.926 E-.13703
G1 X88.649 Y76.903 E-.04284
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.36 I.915 J-.802 P1  F42000
G1 X86.567 Y74.528 Z6.36
G1 Z5.96
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F966
M204 S6000
G3 X89.102 Y72.441 I2.381 J.309 E.09398
G3 X91.313 Y74.53 I-.166 J2.39 E.08565
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.545 E.15216
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16099
G1 X86.842 Y73.682 E-.18071
G1 X86.898 Y73.599 E-.0383
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.36 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z6.36
G1 Z5.96
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F966
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
M73 P29 R23
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.007 J-1.302 E.049
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.29 J.067 E.03194
G1 X87.222 Y78.052 E.01046
G3 X86.153 Y75.957 I1.944 J-2.312 E.05826
G3 X86.164 Y74.547 I36.598 J-.427 E.03401
G3 X89.131 Y72.042 I2.777 J.28 E.10357
G3 X91.73 Y74.827 I-.202 J2.793 E.10103
G3 X91.718 Y76.086 I-11.856 J.513 E.03038
G3 X91.064 Y77.633 I-2.793 J-.268 E.04112
G1 X90.701 Y78.04 E.01314
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z5.96
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F966
M204 S6000
G1 X90.022 Y78.5 E.02705
M204 S10000
G1 X89.96 Y77.597 F42000
; LINE_WIDTH: 0.408027
G1 F966
M204 S6000
G2 X90.289 Y77.332 I-5.185 J-6.781 E.00989
; LINE_WIDTH: 0.357376
G1 X90.383 Y77.254 E.00246
; LINE_WIDTH: 0.323964
G1 X90.496 Y77.15 E.00279
; LINE_WIDTH: 0.297397
G1 X90.566 Y77.082 E.0016
; LINE_WIDTH: 0.26504
G2 X90.695 Y76.935 I-2.95 J-2.718 E.00282
; LINE_WIDTH: 0.218244
G1 X90.813 Y76.776 E.00227
; LINE_WIDTH: 0.178646
G1 X90.879 Y76.675 E.00109
; LINE_WIDTH: 0.137639
G1 X90.967 Y76.514 E.00118
; LINE_WIDTH: 0.0985278
G1 X91.018 Y76.407 E.00048
; WIPE_START
G1 F18000
G1 X90.967 Y76.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.36 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z6.36
G1 Z5.96
G1 E.4 F1800
; LINE_WIDTH: 0.0940055
G1 F966
M204 S6000
G2 X88.315 Y72.763 I-.583 J2.202 E.00457
; WIPE_START
G1 F18000
G1 X88.672 Y72.69 E-.13868
G1 X88.916 Y72.675 E-.09275
G1 X89.21 Y72.692 E-.11179
G1 X89.305 Y72.709 E-.03678
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.36 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z6.36
G1 Z5.96
G1 E.4 F1800
; LINE_WIDTH: 0.106988
G1 F966
M204 S6000
G2 X86.937 Y76.562 I2.858 J-1.257 E.00081
; LINE_WIDTH: 0.149866
G2 X87.017 Y76.699 I2.686 J-1.478 E.00115
; LINE_WIDTH: 0.182946
G1 X87.071 Y76.784 E.00094
; LINE_WIDTH: 0.22107
G2 X87.191 Y76.943 I3.422 J-2.462 E.00233
; LINE_WIDTH: 0.264614
G2 X87.31 Y77.078 I2.04 J-1.684 E.00259
; LINE_WIDTH: 0.307479
G1 X87.466 Y77.225 E.00365
; LINE_WIDTH: 0.346635
G1 X87.593 Y77.328 E.00321
; LINE_WIDTH: 0.380407
G1 X87.689 Y77.403 E.00263
; LINE_WIDTH: 0.4124
G1 X87.855 Y77.522 E.00484
; LINE_WIDTH: 0.44114
G1 X88.007 Y77.63 E.00474
; WIPE_START
G1 F11983.675
G1 X87.855 Y77.522 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.36 I-1.099 J-.522 P1  F42000
G1 X87.417 Y78.445 Z6.36
G1 Z5.96
G1 E.4 F1800
; LINE_WIDTH: 0.341659
G1 F966
M204 S6000
G1 X86.623 Y78.654 E.01578
; WIPE_START
G1 F15862.783
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.36 I-1.217 J-.031 P1  F42000
G1 X86.666 Y107.441 Z6.36
G1 Z5.96
G1 E.4 F1800
; LINE_WIDTH: 0.409284
G1 F966
M204 S6000
G1 X87.184 Y107.53 E.01231
; LINE_WIDTH: 0.46274
G2 X87.456 Y107.55 I.272 J-1.922 E.00731
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.449
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 38/141
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.36 I1.216 J-.04 P1  F42000
G1 X89.725 Y98.361 Z6.36
G1 Z6.12
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F968
M204 S6000
G1 X89.74 Y98.346 E.00051
G3 X90.713 Y97.906 I1.154 J1.257 E.0262
G1 X90.741 Y97.487 E.01013
G1 X90.864 Y97.495 E.00297
G3 X91.153 Y101.616 I-.119 J2.079 E.14497
G3 X88.822 Y100.01 I-.345 J-1.994 E.07559
G3 X90.683 Y97.483 I2.072 J-.423 E.08528
; WIPE_START
G1 F9000
G1 X90.864 Y97.495 E-.06881
G1 X91.132 Y97.513 E-.10215
G1 X91.652 Y97.694 E-.20904
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.52 I1.201 J-.196 P1  F42000
G1 X89.653 Y85.448 Z6.52
G1 Z6.12
G1 E.4 F1800
G1 F968
M204 S6000
G3 X90.721 Y85.019 I1.048 J1.066 E.02849
G1 X90.779 Y84.603 E.01013
G1 X91.028 Y84.638 E.00607
G3 X92.865 Y88.101 I-.427 J2.445 E.10896
G3 X90.085 Y88.773 I-1.726 J-1.052 E.07661
G3 X89.149 Y85.38 I1.183 J-2.152 E.09464
G3 X90.722 Y84.595 I1.518 J1.073 E.04415
; WIPE_START
G1 F9000
G1 X91.028 Y84.638 E-.11767
G1 X91.668 Y84.838 E-.25471
G1 X91.685 Y84.85 E-.00762
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.52 I1.096 J-.53 P1  F42000
G1 X88.419 Y78.098 Z6.52
G1 Z6.12
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F968
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.736 Y77.63 I.712 J-2.549 E.0396
G1 X89.832 Y77.788 E.0048
G1 X89.555 Y78.098 E.01082
G1 X88.479 Y78.098 E.02797
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.1672
G1 X88.234 Y77.653 E-.07214
G1 X88.597 Y77.723 E-.14066
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.52 I-.798 J.918 P1  F42000
G1 X89.506 Y78.514 Z6.52
G1 Z6.12
G1 E.4 F1800
G1 F968
M204 S6000
G1 X87.638 Y78.514 E.04857
G1 X87.594 Y78.319 E.00518
G1 X87.905 Y78.172 E.00896
G3 X87.144 Y77.399 I7.769 J-8.424 E.02821
G3 X86.551 Y75.582 I1.892 J-1.623 E.05099
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.5 J.195 E.05022
G1 X89.741 Y78.514 E.03974
G1 X89.566 Y78.514 E.00454
; WIPE_START
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.52 I1.046 J.622 P1  F42000
G1 X89.581 Y76.809 Z6.52
G1 Z6.12
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F968
M204 S5000
G1 X89.473 Y76.851 E.0028
G3 X88.759 Y73.323 I-.537 J-1.728 E.14594
G1 X88.925 Y73.315 E.00399
G3 X89.804 Y76.711 I.011 J1.809 E.11549
G1 X89.636 Y76.785 E.00443
; WIPE_START
G1 F12000
M204 S6000
G1 X89.473 Y76.851 E-.06689
G1 X89.12 Y76.926 E-.13683
G1 X88.76 Y76.926 E-.13701
G1 X88.658 Y76.905 E-.03927
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.52 I.914 J-.804 P1  F42000
G1 X86.567 Y74.528 Z6.52
G1 Z6.12
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F968
M204 S6000
G3 X89.098 Y72.441 I2.38 J.309 E.09386
G3 X91.313 Y74.53 I-.162 J2.39 E.08577
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.545 E.15216
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.651 Y74.14 E-.15329
G1 X86.739 Y73.896 E-.09834
G1 X86.842 Y73.682 E-.09042
G1 X86.898 Y73.599 E-.03795
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.52 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z6.52
G1 Z6.12
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F968
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
M73 P30 R23
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.29 J.067 E.03194
G1 X87.222 Y78.052 E.01046
G3 X86.153 Y75.957 I1.944 J-2.312 E.05826
G3 X86.164 Y74.547 I36.604 J-.427 E.03401
G3 X89.127 Y72.041 I2.777 J.28 E.10345
G3 X91.73 Y74.827 I-.195 J2.792 E.10116
G3 X91.718 Y76.086 I-11.857 J.513 E.03038
G3 X91.064 Y77.633 I-2.793 J-.268 E.04112
G1 X90.701 Y78.04 E.01314
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z6.12
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F968
M204 S6000
G1 X90.022 Y78.5 E.02704
M204 S10000
G1 X89.96 Y77.597 F42000
; LINE_WIDTH: 0.408139
G1 F968
M204 S6000
G2 X90.289 Y77.332 I-5.158 J-6.747 E.00988
; LINE_WIDTH: 0.357468
G1 X90.383 Y77.254 E.00246
; LINE_WIDTH: 0.324192
G1 X90.495 Y77.151 E.00276
; LINE_WIDTH: 0.295517
G1 X90.57 Y77.077 E.00172
; LINE_WIDTH: 0.263773
G2 X90.695 Y76.935 I-2.224 J-2.092 E.00271
; LINE_WIDTH: 0.218211
G1 X90.813 Y76.776 E.00228
; LINE_WIDTH: 0.178603
G1 X90.879 Y76.675 E.00109
; LINE_WIDTH: 0.137537
G1 X90.967 Y76.514 E.00118
; LINE_WIDTH: 0.0984514
G1 X91.018 Y76.407 E.00047
; WIPE_START
G1 F18000
G1 X90.967 Y76.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.52 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z6.52
G1 Z6.12
G1 E.4 F1800
; LINE_WIDTH: 0.0939859
G1 F968
M204 S6000
G2 X88.315 Y72.763 I-.584 J2.202 E.00457
; WIPE_START
G1 F18000
G1 X88.673 Y72.69 E-.13868
G1 X88.913 Y72.675 E-.09153
G1 X89.21 Y72.692 E-.11314
G1 X89.305 Y72.709 E-.03666
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.52 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z6.52
G1 Z6.12
G1 E.4 F1800
; LINE_WIDTH: 0.10208
G1 F968
M204 S6000
G1 X86.917 Y76.522 E.00057
; LINE_WIDTH: 0.129372
G1 X86.965 Y76.612 E.00061
; LINE_WIDTH: 0.168278
G2 X87.061 Y76.768 I3.335 J-1.932 E.00154
; LINE_WIDTH: 0.211717
G2 X87.155 Y76.899 I2.33 J-1.595 E.00179
G1 X87.16 Y76.904 E.00008
; LINE_WIDTH: 0.2583
G2 X87.302 Y77.069 I3.275 J-2.676 E.00305
; LINE_WIDTH: 0.3061
G1 X87.466 Y77.225 E.00385
; LINE_WIDTH: 0.346674
G1 X87.594 Y77.328 E.00321
; LINE_WIDTH: 0.380487
G1 X87.689 Y77.403 E.00263
; LINE_WIDTH: 0.412464
G1 X87.855 Y77.522 E.00484
; LINE_WIDTH: 0.441149
G1 X88.007 Y77.63 E.00474
; WIPE_START
G1 F11983.41
G1 X87.855 Y77.522 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.52 I-1.099 J-.522 P1  F42000
G1 X87.417 Y78.445 Z6.52
G1 Z6.12
G1 E.4 F1800
; LINE_WIDTH: 0.341676
G1 F968
M204 S6000
G1 X86.623 Y78.654 E.01577
; WIPE_START
G1 F15861.94
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.52 I-1.217 J-.031 P1  F42000
G1 X86.667 Y107.441 Z6.52
G1 Z6.12
G1 E.4 F1800
; LINE_WIDTH: 0.409636
G1 F968
M204 S6000
G1 X87.183 Y107.53 E.0123
; LINE_WIDTH: 0.462749
G2 X87.456 Y107.55 I.272 J-1.92 E.00731
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 6.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.22
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 39/141
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.52 I1.216 J-.041 P1  F42000
G1 X89.722 Y98.318 Z6.52
G1 Z6.28
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F970
M204 S6000
G3 X90.711 Y97.843 I1.148 J1.125 E.02701
G1 X90.739 Y97.424 E.01013
G1 X90.863 Y97.432 E.00299
G3 X91.977 Y101.258 I-.171 J2.125 E.1241
G3 X88.804 Y99.883 I-1.233 J-1.504 E.10276
G3 X90.681 Y97.42 I2.13 J-.323 E.08331
; WIPE_START
G1 F9000
G1 X90.863 Y97.432 E-.06904
G1 X91.129 Y97.45 E-.10146
G1 X91.563 Y97.591 E-.17333
G1 X91.644 Y97.641 E-.03617
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.68 I1.2 J-.201 P1  F42000
G1 X89.599 Y85.415 Z6.68
G1 Z6.28
G1 E.4 F1800
G1 F970
M204 S6000
G3 X90.678 Y84.968 I1.055 J1.022 E.02894
G1 X90.736 Y84.552 E.01013
G1 X90.996 Y84.589 E.00632
G3 X93.075 Y87.719 I-.588 J2.647 E.10014
G3 X90.062 Y88.775 I-1.892 J-.572 E.08962
G3 X88.899 Y85.732 I1.388 J-2.275 E.08453
G3 X90.679 Y84.544 I1.758 J.706 E.05484
; WIPE_START
G1 F9000
G1 X90.996 Y84.589 E-.12155
G1 X91.62 Y84.788 E-.2489
G1 X91.641 Y84.801 E-.00955
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.68 I1.097 J-.527 P1  F42000
G1 X88.419 Y78.098 Z6.68
G1 Z6.28
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F970
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.747 Y77.627 I.713 J-2.568 E.03988
G1 X89.843 Y77.784 E.00478
G1 X89.566 Y78.098 E.01088
G1 X88.479 Y78.098 E.02827
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.1672
G1 X88.234 Y77.653 E-.07214
G1 X88.597 Y77.723 E-.14067
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.68 I-.79 J.926 P1  F42000
G1 X89.524 Y78.514 Z6.68
G1 Z6.28
G1 E.4 F1800
G1 F970
M204 S6000
G1 X87.634 Y78.514 E.04912
G1 X87.59 Y78.32 E.00518
G1 X87.904 Y78.17 E.00903
G3 X87.146 Y77.402 I7.745 J-8.398 E.02804
G3 X86.551 Y75.582 I1.888 J-1.626 E.05109
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.774 Y77.355 I-2.502 J.194 E.0496
G1 X89.754 Y78.514 E.04012
G1 X89.584 Y78.514 E.00443
; WIPE_START
G1 F11728.231
G1 X88.584 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.68 I1.049 J.617 P1  F42000
G1 X89.59 Y76.805 Z6.68
G1 Z6.28
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F970
M204 S5000
G1 X89.472 Y76.851 E.00304
G3 X88.759 Y73.323 I-.537 J-1.727 E.14596
G1 X88.922 Y73.315 E.00392
G3 X89.804 Y76.711 I.014 J1.809 E.11553
G1 X89.645 Y76.781 E.0042
; WIPE_START
G1 F12000
M204 S6000
G1 X89.472 Y76.851 E-.07066
G1 X89.12 Y76.926 E-.13681
G1 X88.76 Y76.926 E-.137
G1 X88.668 Y76.907 E-.03554
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.68 I.912 J-.806 P1  F42000
G1 X86.567 Y74.528 Z6.68
G1 Z6.28
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F970
M204 S6000
G3 X89.093 Y72.441 I2.38 J.309 E.09375
G3 X91.313 Y74.531 I-.157 J2.391 E.08589
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.545 E.15216
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16099
G1 X86.842 Y73.682 E-.18082
G1 X86.898 Y73.599 E-.03819
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.68 I-.932 J.783 P1  F42000
G1 X90.666 Y78.085 Z6.68
G1 Z6.28
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F970
M204 S5000
G1 X93.85 Y78.085 E.07679
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.29 J.067 E.03194
G1 X87.221 Y78.052 E.01045
G3 X86.15 Y75.822 I1.934 J-2.301 E.06149
G3 X86.164 Y74.547 I11.313 J-.514 E.03076
G3 X89.122 Y72.041 I2.777 J.28 E.10333
G3 X91.73 Y74.827 I-.19 J2.792 E.10127
G3 X91.718 Y76.087 I-11.858 J.513 E.03039
G3 X91.08 Y77.614 I-2.788 J-.267 E.04051
G1 X90.705 Y78.039 E.01367
; WIPE_START
G1 F12000
M204 S6000
G1 X91.705 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z6.28
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F970
M204 S6000
G1 X90.034 Y78.5 E.02673
M204 S10000
G1 X89.969 Y77.592 F42000
; LINE_WIDTH: 0.409887
G1 F970
M204 S6000
G2 X90.289 Y77.332 I-4.984 J-6.476 E.00968
; LINE_WIDTH: 0.358137
G1 X90.383 Y77.254 E.00247
; LINE_WIDTH: 0.321574
G1 X90.511 Y77.135 E.00315
; LINE_WIDTH: 0.292929
G1 X90.57 Y77.077 E.00134
; LINE_WIDTH: 0.263826
G2 X90.695 Y76.935 I-2.303 J-2.159 E.00271
; LINE_WIDTH: 0.218211
G1 X90.813 Y76.776 E.00228
; LINE_WIDTH: 0.178626
G1 X90.879 Y76.675 E.00109
; LINE_WIDTH: 0.13838
G1 X90.964 Y76.519 E.00116
; LINE_WIDTH: 0.0990985
G1 X91.016 Y76.41 E.00049
; WIPE_START
G1 F18000
G1 X90.964 Y76.519 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.68 I1.137 J-.434 P1  F42000
G1 X89.526 Y72.751 Z6.68
G1 Z6.28
G1 E.4 F1800
; LINE_WIDTH: 0.0937927
G1 F970
M204 S6000
G2 X88.315 Y72.763 I-.583 J2.209 E.00456
; WIPE_START
G1 F18000
G1 X88.672 Y72.69 E-.13856
G1 X88.909 Y72.675 E-.09011
G1 X89.211 Y72.692 E-.1148
G1 X89.305 Y72.709 E-.03654
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.68 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z6.68
G1 Z6.28
G1 E.4 F1800
; LINE_WIDTH: 0.102103
G1 F970
M204 S6000
G1 X86.917 Y76.522 E.00057
; LINE_WIDTH: 0.129424
G1 X86.965 Y76.612 E.00061
; LINE_WIDTH: 0.169142
G2 X87.065 Y76.775 I3.463 J-2.008 E.00161
; LINE_WIDTH: 0.207073
G1 X87.131 Y76.865 E.00121
; LINE_WIDTH: 0.233654
G1 X87.191 Y76.943 E.00123
; LINE_WIDTH: 0.264595
G2 X87.31 Y77.078 I2.018 J-1.664 E.00259
; LINE_WIDTH: 0.307457
G1 X87.466 Y77.225 E.00365
; LINE_WIDTH: 0.34663
G1 X87.593 Y77.328 E.00321
; LINE_WIDTH: 0.380397
G1 X87.689 Y77.403 E.00263
; LINE_WIDTH: 0.412383
G1 X87.855 Y77.522 E.00484
; LINE_WIDTH: 0.441144
G1 X88.007 Y77.63 E.00474
; WIPE_START
G1 F11983.561
G1 X87.855 Y77.522 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.68 I-1.098 J-.525 P1  F42000
G1 X87.413 Y78.446 Z6.68
G1 Z6.28
G1 E.4 F1800
; LINE_WIDTH: 0.341821
G1 F970
M204 S6000
G1 X86.623 Y78.654 E.01572
; WIPE_START
G1 F15854.435
G1 X87.413 Y78.446 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.68 I-1.217 J-.031 P1  F42000
G1 X86.665 Y107.441 Z6.68
G1 Z6.28
G1 E.4 F1800
; LINE_WIDTH: 0.409641
G1 F970
M204 S6000
G1 X87.184 Y107.53 E.01234
; LINE_WIDTH: 0.462742
G2 X87.456 Y107.55 I.271 J-1.919 E.00731
G1 X91.03 Y107.55 E.09574
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 6.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.388
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 40/141
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.68 I1.216 J-.042 P1  F42000
G1 X89.712 Y98.272 Z6.68
G1 Z6.44
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.709 Y97.779 I1.151 J1.074 E.02741
G1 X90.737 Y97.36 E.01013
G1 X90.862 Y97.369 E.00303
G3 X92.765 Y99.11 I-.219 J2.15 E.06666
G3 X90.233 Y101.731 I-2.14 J.466 E.10379
G3 X88.802 Y99.264 I.778 J-2.1 E.07456
G3 X90.679 Y97.357 I2.142 J.231 E.06962
M106 S124.95
; WIPE_START
G1 X90.862 Y97.369 E-.06974
G1 X91.123 Y97.386 E-.09949
G1 X91.554 Y97.526 E-.17216
G1 X91.641 Y97.579 E-.0386
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.84 I1.199 J-.206 P1  F42000
G1 X89.546 Y85.38 Z6.84
G1 Z6.44
G1 E.4 F1800
G1 F901
M204 S6000
G3 X90.634 Y84.916 I1.062 J.983 E.02939
G1 X90.694 Y84.5 E.01013
G1 X90.959 Y84.538 E.00646
G3 X92.758 Y85.888 I-.625 J2.706 E.05585
G3 X92.34 Y88.857 I-1.706 J1.273 E.0802
G3 X89.424 Y88.203 I-1.087 J-1.982 E.07872
G3 X89.086 Y85.263 I1.787 J-1.695 E.07655
G3 X90.636 Y84.492 I1.491 J1.053 E.04351
; WIPE_START
G1 F9000
G1 X90.959 Y84.538 E-.12375
G1 X91.57 Y84.735 E-.24414
G1 X91.597 Y84.753 E-.01211
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.84 I1.098 J-.524 P1  F42000
G1 X88.419 Y78.098 Z6.84
G1 Z6.44
M73 P31 R23
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F901
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.749 Y77.627 I.713 J-2.571 E.03992
G1 X89.845 Y77.783 E.00478
G1 X89.568 Y78.098 E.01089
G1 X88.479 Y78.098 E.02831
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.16718
G1 X88.234 Y77.653 E-.07214
G1 X88.598 Y77.723 E-.14068
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.84 I-.789 J.927 P1  F42000
G1 X89.526 Y78.514 Z6.84
G1 Z6.44
G1 E.4 F1800
G1 F901
M204 S6000
G1 X87.638 Y78.514 E.04909
G1 X87.594 Y78.319 E.00518
G1 X87.906 Y78.172 E.00896
G3 X87.13 Y77.385 I7.871 J-8.528 E.02872
G3 X86.551 Y75.582 I1.903 J-1.607 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.777 Y77.352 I-2.502 J.194 E.04948
G1 X89.756 Y78.514 E.0402
G1 X89.586 Y78.514 E.00442
; WIPE_START
G1 F11728.231
G1 X88.586 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.84 I1.047 J.62 P1  F42000
G1 X89.599 Y76.801 Z6.84
G1 Z6.44
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F901
M204 S5000
G1 X89.473 Y76.851 E.00328
G3 X88.76 Y73.323 I-.538 J-1.727 E.14599
G1 X88.919 Y73.315 E.00385
G3 X89.804 Y76.71 I.016 J1.809 E.11557
G1 X89.654 Y76.777 E.00395
; WIPE_START
G1 F12000
M204 S6000
G1 X89.473 Y76.851 E-.07452
G1 X89.12 Y76.926 E-.13687
G1 X88.76 Y76.926 E-.13698
G1 X88.678 Y76.909 E-.03163
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.84 I.911 J-.807 P1  F42000
G1 X86.567 Y74.528 Z6.84
G1 Z6.44
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F901
M204 S6000
G3 X89.089 Y72.441 I2.38 J.309 E.09362
G3 X91.313 Y74.53 I-.152 J2.391 E.08601
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.545 E.15216
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16098
G1 X86.842 Y73.682 E-.18072
G1 X86.899 Y73.599 E-.03829
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.84 I-.932 J.783 P1  F42000
G1 X90.667 Y78.085 Z6.84
G1 Z6.44
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F901
M204 S5000
G1 X93.85 Y78.085 E.07677
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.29 J.067 E.03194
G1 X87.222 Y78.052 E.01046
G3 X86.153 Y75.957 I1.944 J-2.311 E.05826
G3 X86.164 Y74.547 I36.645 J-.427 E.03401
G3 X89.117 Y72.041 I2.777 J.279 E.10322
G3 X91.73 Y74.827 I-.185 J2.792 E.10139
G3 X91.718 Y76.087 I-11.857 J.513 E.03039
G3 X91.083 Y77.61 I-2.787 J-.267 E.0404
G1 X90.706 Y78.039 E.01378
; WIPE_START
G1 F12000
M204 S6000
G1 X91.706 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z6.44
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F901
M204 S6000
G1 X90.036 Y78.5 E.02669
M204 S10000
G1 X89.971 Y77.591 F42000
; LINE_WIDTH: 0.410143
G1 F901
M204 S6000
G2 X90.289 Y77.333 I-4.993 J-6.479 E.00965
; LINE_WIDTH: 0.358241
G1 X90.383 Y77.254 E.00247
; LINE_WIDTH: 0.321077
G1 X90.514 Y77.132 E.00322
; LINE_WIDTH: 0.29243
G1 X90.57 Y77.077 E.00127
; LINE_WIDTH: 0.263813
G2 X90.695 Y76.935 I-2.318 J-2.172 E.00271
; LINE_WIDTH: 0.218193
G1 X90.813 Y76.776 E.00227
; LINE_WIDTH: 0.178614
G1 X90.879 Y76.675 E.00109
; LINE_WIDTH: 0.137369
G1 X90.967 Y76.513 E.00119
; LINE_WIDTH: 0.098308
G1 X91.018 Y76.407 E.00047
; WIPE_START
G1 F18000
G1 X90.967 Y76.513 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.84 I1.136 J-.435 P1  F42000
G1 X89.526 Y72.751 Z6.84
G1 Z6.44
G1 E.4 F1800
; LINE_WIDTH: 0.0937955
G1 F901
M204 S6000
G2 X88.315 Y72.763 I-.584 J2.208 E.00456
; WIPE_START
G1 F18000
G1 X88.673 Y72.69 E-.13864
G1 X88.906 Y72.675 E-.08883
G1 X89.211 Y72.692 E-.11624
G1 X89.305 Y72.709 E-.0363
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.84 I-1.015 J-.671 P1  F42000
G1 X86.862 Y76.404 Z6.84
G1 Z6.44
G1 E.4 F1800
; LINE_WIDTH: 0.102256
G1 F901
M204 S6000
G1 X86.917 Y76.522 E.00055
; LINE_WIDTH: 0.129381
G1 X86.965 Y76.612 E.00061
; LINE_WIDTH: 0.169185
G2 X87.065 Y76.775 I3.493 J-2.026 E.00161
; LINE_WIDTH: 0.207079
G1 X87.131 Y76.865 E.00121
; LINE_WIDTH: 0.23366
G1 X87.191 Y76.943 E.00124
; LINE_WIDTH: 0.26688
G2 X87.323 Y77.09 I1.935 J-1.595 E.00287
; LINE_WIDTH: 0.310296
G2 X87.465 Y77.224 I3.258 J-3.326 E.00336
; LINE_WIDTH: 0.346587
G1 X87.594 Y77.328 E.00325
; LINE_WIDTH: 0.38047
G1 X87.689 Y77.403 E.00262
; LINE_WIDTH: 0.4124
G1 X87.855 Y77.522 E.00484
; LINE_WIDTH: 0.441177
G1 X88.007 Y77.63 E.00475
; WIPE_START
G1 F11982.586
G1 X87.855 Y77.522 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.84 I-1.099 J-.522 P1  F42000
G1 X87.417 Y78.445 Z6.84
G1 Z6.44
G1 E.4 F1800
; LINE_WIDTH: 0.341708
G1 F901
M204 S6000
G1 X86.623 Y78.654 E.01577
; WIPE_START
G1 F15860.282
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.84 I-1.217 J-.031 P1  F42000
G1 X86.682 Y107.455 Z6.84
G1 Z6.44
G1 E.4 F1800
; LINE_WIDTH: 0.423179
G1 F901
M204 S6000
G1 X87.226 Y107.536 E.01339
; LINE_WIDTH: 0.463126
G2 X87.456 Y107.55 I.231 J-1.986 E.00616
G1 X91.03 Y107.55 E.09583
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11369.198
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 41/141
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.84 I1.216 J-.043 P1  F42000
G1 X89.701 Y98.227 Z6.84
G1 Z6.6
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.707 Y97.715 I1.157 J1.028 E.02786
G1 X90.734 Y97.296 E.01013
G1 X90.861 Y97.304 E.00309
G3 X92.792 Y99.549 I-.224 J2.145 E.07868
G3 X90.659 Y101.859 I-2.278 J.037 E.08367
G3 X88.784 Y99.513 I.193 J-2.077 E.08084
G3 X90.676 Y97.292 I2.202 J-.041 E.07691
M106 S124.95
; WIPE_START
G1 X90.861 Y97.304 E-.0706
G1 X91.117 Y97.321 E-.09734
G1 X91.545 Y97.46 E-.17096
G1 X91.637 Y97.517 E-.0411
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7 I1.199 J-.211 P1  F42000
G1 X89.493 Y85.345 Z7
G1 Z6.6
G1 E.4 F1800
G1 F894
M204 S6000
G3 X90.591 Y84.863 I1.071 J.949 E.02984
G1 X90.651 Y84.447 E.01013
G1 X90.916 Y84.485 E.00644
G3 X92.441 Y85.53 I-.49 J2.352 E.04576
G3 X92.726 Y88.611 I-1.507 J1.693 E.08214
G3 X89.71 Y88.511 I-1.458 J-1.543 E.08092
G3 X88.704 Y86.563 I2.73 J-2.645 E.05362
G3 X90.594 Y84.439 I1.883 J-.227 E.07751
; WIPE_START
G1 F9000
G1 X90.916 Y84.485 E-.1235
G1 X91.521 Y84.682 E-.2418
G1 X91.553 Y84.704 E-.0147
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7 I1.099 J-.522 P1  F42000
G1 X88.419 Y78.098 Z7
G1 Z6.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F894
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.75 Y77.626 I.713 J-2.574 E.03996
G1 X89.846 Y77.783 E.00477
G1 X89.57 Y78.098 E.0109
G1 X88.479 Y78.098 E.02836
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.16719
G1 X88.234 Y77.653 E-.07214
G1 X88.598 Y77.723 E-.14068
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7 I-.787 J.928 P1  F42000
G1 X89.529 Y78.514 Z7
G1 Z6.6
G1 E.4 F1800
G1 F894
M204 S6000
G1 X87.682 Y78.514 E.04802
G1 X87.64 Y78.316 E.00526
G1 X87.925 Y78.191 E.00808
G3 X87.13 Y77.384 I8.068 J-8.743 E.02943
G3 X86.551 Y75.582 I1.902 J-1.606 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.78 Y77.348 I-2.506 J.193 E.04937
G1 X89.758 Y78.514 E.04028
G1 X89.589 Y78.514 E.0044
; WIPE_START
G1 F11728.231
G1 X88.589 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7 I1.046 J.622 P1  F42000
G1 X89.609 Y76.797 Z7
G1 Z6.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F894
M204 S5000
G1 X89.473 Y76.851 E.00354
G3 X88.759 Y73.323 I-.538 J-1.727 E.146
G1 X88.916 Y73.315 E.00378
G3 X89.804 Y76.71 I.018 J1.809 E.11563
G1 X89.664 Y76.773 E.00369
; WIPE_START
G1 F12000
M204 S6000
G1 X89.473 Y76.851 E-.07859
G1 X89.12 Y76.926 E-.13686
G1 X88.76 Y76.926 E-.13695
G1 X88.689 Y76.911 E-.02759
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7 I.909 J-.809 P1  F42000
G1 X86.567 Y74.528 Z7
G1 Z6.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F894
M204 S6000
G3 X89.084 Y72.44 I2.38 J.309 E.0935
G3 X91.313 Y74.53 I-.147 J2.391 E.08614
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.545 E.15215
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16092
G1 X86.842 Y73.682 E-.18082
G1 X86.899 Y73.599 E-.03825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7 I-.932 J.783 P1  F42000
G1 X90.667 Y78.085 Z7
G1 Z6.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F894
M204 S5000
G1 X93.85 Y78.085 E.07675
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
M73 P32 R23
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.004 J-1.299 E.04903
G1 X86.152 Y79.311 E.65976
G3 X86.89 Y78.208 I1.327 J.09 E.03352
G1 X87.229 Y78.059 E.00891
G3 X86.2 Y76.351 I2.053 J-2.4 E.04892
G3 X86.15 Y75.822 I3.664 J-.614 E.01283
G3 X86.164 Y74.547 I11.313 J-.514 E.03076
G3 X89.112 Y72.041 I2.777 J.28 E.1031
G3 X91.73 Y74.827 I-.18 J2.792 E.10151
G3 X91.718 Y76.087 I-11.858 J.513 E.03039
G3 X91.086 Y77.607 I-2.787 J-.267 E.04029
G1 X90.707 Y78.039 E.01387
; WIPE_START
G1 F12000
M204 S6000
G1 X91.707 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z6.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F894
M204 S6000
G1 X90.037 Y78.5 E.02664
M204 S10000
G1 X89.972 Y77.59 F42000
; LINE_WIDTH: 0.410444
G1 F894
M204 S6000
G2 X90.289 Y77.333 I-4.913 J-6.373 E.00961
; LINE_WIDTH: 0.358371
G1 X90.383 Y77.254 E.00247
; LINE_WIDTH: 0.320622
G1 X90.517 Y77.129 E.00329
; LINE_WIDTH: 0.291996
G1 X90.57 Y77.077 E.0012
; LINE_WIDTH: 0.263891
G2 X90.695 Y76.935 I-2.334 J-2.185 E.00271
; LINE_WIDTH: 0.21826
G1 X90.813 Y76.776 E.00228
; LINE_WIDTH: 0.17864
G1 X90.879 Y76.675 E.00109
; LINE_WIDTH: 0.138433
G1 X90.964 Y76.519 E.00115
; LINE_WIDTH: 0.0991559
G1 X91.015 Y76.411 E.00048
; WIPE_START
G1 F18000
G1 X90.964 Y76.519 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7 I-.428 J-1.139 P1  F42000
G1 X88.007 Y77.63 Z7
G1 Z6.6
G1 E.4 F1800
; LINE_WIDTH: 0.441166
G1 F894
M204 S6000
G1 X87.856 Y77.522 E.00474
; LINE_WIDTH: 0.412435
G1 X87.689 Y77.403 E.00484
; LINE_WIDTH: 0.380437
G1 X87.594 Y77.328 E.00263
; LINE_WIDTH: 0.346515
G1 X87.465 Y77.224 E.00323
; LINE_WIDTH: 0.306981
G3 X87.301 Y77.068 I3.018 J-3.34 E.00385
; LINE_WIDTH: 0.264265
G3 X87.192 Y76.943 I2.568 J-2.35 E.00239
; LINE_WIDTH: 0.220532
G1 X87.072 Y76.783 E.00233
; LINE_WIDTH: 0.178939
G1 X86.998 Y76.67 E.00123
; LINE_WIDTH: 0.139487
G3 X86.917 Y76.522 I3.083 J-1.776 E.0011
; LINE_WIDTH: 0.0993283
G1 X86.865 Y76.41 E.0005
; WIPE_START
G1 F18000
G1 X86.917 Y76.522 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7 I1.141 J.424 P1  F42000
G1 X88.315 Y72.763 Z7
G1 Z6.6
G1 E.4 F1800
; LINE_WIDTH: 0.0937977
G1 F894
M204 S6000
G3 X89.526 Y72.751 I.627 J2.195 E.00456
; WIPE_START
G1 F18000
G1 X89.212 Y72.692 E-.1216
G1 X88.903 Y72.675 E-.11768
G1 X88.673 Y72.69 E-.08758
G1 X88.536 Y72.718 E-.05314
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7 I-1.215 J-.066 P1  F42000
G1 X86.664 Y107.439 Z7
G1 Z6.6
G1 E.4 F1800
; LINE_WIDTH: 0.406282
G1 F894
M204 S6000
G1 X87.161 Y107.527 E.01175
; LINE_WIDTH: 0.462528
G2 X87.456 Y107.55 I.317 J-2.208 E.00791
G1 X91.03 Y107.55 E.09569
; CHANGE_LAYER
; Z_HEIGHT: 6.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11385.098
G1 X90.03 Y107.55 E-.38
; WIPE_END
M73 P32 R22
G1 E-.02 F1800
; layer num/total_layer_count: 42/141
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7 I1.216 J-.044 P1  F42000
G1 X89.69 Y98.182 Z7
G1 Z6.76
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F977
M204 S6000
G3 X90.704 Y97.65 I1.165 J.987 E.02832
G1 X90.731 Y97.231 E.01013
G1 X90.86 Y97.239 E.00313
G3 X92.778 Y99.394 I-.23 J2.136 E.07627
G3 X91.088 Y101.875 I-2.43 J.161 E.07802
G3 X88.801 Y100.133 I-.353 J-1.908 E.07805
G3 X89.171 Y98.159 I3.576 J-.351 E.04909
G3 X90.673 Y97.227 I1.683 J1.037 E.04418
; WIPE_START
G1 F9000
G1 X90.86 Y97.239 E-.07129
G1 X91.111 Y97.255 E-.09534
G1 X91.536 Y97.393 E-.16968
G1 X91.633 Y97.453 E-.04369
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.16 I1.198 J-.216 P1  F42000
G1 X89.44 Y85.309 Z7.16
G1 Z6.76
G1 E.4 F1800
G1 F977
M204 S6000
G3 X90.548 Y84.81 I1.08 J.919 E.0303
G1 X90.609 Y84.394 E.01013
G1 X90.863 Y84.431 E.00621
G3 X92.451 Y85.574 I-.487 J2.35 E.04858
G3 X92.769 Y88.653 I-1.452 J1.706 E.08239
G3 X89.76 Y88.551 I-1.455 J-1.535 E.08079
G3 X88.768 Y86.995 I4.173 J-3.753 E.04472
G3 X90.551 Y84.386 I1.813 J-.675 E.08917
; WIPE_START
G1 F9000
G1 X90.863 Y84.431 E-.11981
G1 X91.471 Y84.629 E-.24289
G1 X91.509 Y84.654 E-.01731
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.16 I1.101 J-.519 P1  F42000
G1 X88.419 Y78.098 Z7.16
G1 Z6.76
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F977
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.751 Y77.626 I.713 J-2.577 E.03999
G1 X89.847 Y77.782 E.00477
G1 X89.571 Y78.098 E.0109
G1 X88.479 Y78.098 E.02839
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.16718
G1 X88.234 Y77.653 E-.07214
G1 X88.598 Y77.723 E-.14068
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.16 I-.786 J.929 P1  F42000
G1 X89.531 Y78.514 Z7.16
G1 Z6.76
G1 E.4 F1800
G1 F977
M204 S6000
G1 X87.638 Y78.514 E.04921
G1 X87.594 Y78.319 E.00518
G1 X87.906 Y78.172 E.00896
G3 X87.13 Y77.385 I7.864 J-8.521 E.02872
G3 X86.551 Y75.582 I1.909 J-1.609 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.782 Y77.345 I-2.491 J.198 E.04927
G1 X89.76 Y78.514 E.04036
G1 X89.591 Y78.514 E.00439
; WIPE_START
G1 F11728.231
G1 X88.591 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.16 I1.045 J.624 P1  F42000
G1 X89.619 Y76.793 Z7.16
G1 Z6.76
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F977
M204 S5000
G1 X89.472 Y76.851 E.00381
G3 X88.759 Y73.323 I-.539 J-1.727 E.14603
G1 X88.913 Y73.315 E.00371
G3 X89.804 Y76.71 I.02 J1.809 E.11566
G1 X89.674 Y76.768 E.00343
; WIPE_START
G1 F12000
M204 S6000
G1 X89.472 Y76.851 E-.08276
G1 X89.12 Y76.926 E-.13685
G1 X88.76 Y76.926 E-.13695
G1 X88.699 Y76.914 E-.02344
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.16 I.907 J-.811 P1  F42000
G1 X86.567 Y74.528 Z7.16
G1 Z6.76
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F977
M204 S6000
G3 X89.079 Y72.44 I2.38 J.309 E.09338
G3 X91.313 Y74.53 I-.142 J2.391 E.08625
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.545 E.15215
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16099
G1 X86.842 Y73.682 E-.18074
G1 X86.898 Y73.599 E-.03828
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.16 I-.932 J.783 P1  F42000
G1 X90.668 Y78.085 Z7.16
G1 Z6.76
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F977
M204 S5000
G1 X93.85 Y78.085 E.07674
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.311 J.081 E.03189
G1 X87.222 Y78.052 E.01046
G3 X86.15 Y75.822 I1.934 J-2.302 E.06151
G3 X86.164 Y74.547 I11.321 J-.514 E.03076
G3 X89.107 Y72.04 I2.777 J.279 E.10299
G3 X91.73 Y74.827 I-.175 J2.793 E.10163
G3 X91.718 Y76.086 I-11.857 J.513 E.03038
G3 X91.089 Y77.603 I-2.786 J-.267 E.04019
G1 X90.707 Y78.039 E.01398
; WIPE_START
G1 F12000
M204 S6000
G1 X91.707 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z6.76
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F977
M204 S6000
G1 X90.039 Y78.5 E.0266
M204 S10000
G1 X89.973 Y77.59 F42000
; LINE_WIDTH: 0.410612
G1 F977
M204 S6000
G2 X90.289 Y77.333 I-4.986 J-6.452 E.00959
; LINE_WIDTH: 0.358429
G1 X90.383 Y77.254 E.00247
; LINE_WIDTH: 0.320141
G1 X90.52 Y77.126 E.00335
; LINE_WIDTH: 0.291552
G1 X90.57 Y77.077 E.00113
; LINE_WIDTH: 0.263915
G2 X90.695 Y76.935 I-2.358 J-2.206 E.00271
; LINE_WIDTH: 0.218235
G1 X90.813 Y76.776 E.00228
; LINE_WIDTH: 0.178702
G1 X90.879 Y76.675 E.00109
; LINE_WIDTH: 0.139371
G2 X90.966 Y76.517 I-3.752 J-2.149 E.00119
; LINE_WIDTH: 0.0988616
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.517 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.16 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z7.16
G1 Z6.76
G1 E.4 F1800
; LINE_WIDTH: 0.0937868
G1 F977
M204 S6000
G2 X88.315 Y72.763 I-.584 J2.205 E.00456
; WIPE_START
G1 F18000
G1 X88.672 Y72.69 E-.13855
G1 X88.899 Y72.675 E-.08639
G1 X89.212 Y72.692 E-.11899
G1 X89.305 Y72.709 E-.03607
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.16 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z7.16
G1 Z6.76
G1 E.4 F1800
; LINE_WIDTH: 0.102112
G1 F977
M204 S6000
G1 X86.917 Y76.522 E.00057
; LINE_WIDTH: 0.129469
G1 X86.965 Y76.612 E.00061
; LINE_WIDTH: 0.169141
G2 X87.064 Y76.774 I3.483 J-2.021 E.0016
; LINE_WIDTH: 0.206884
G1 X87.13 Y76.864 E.0012
; LINE_WIDTH: 0.23942
G1 X87.233 Y76.993 E.00211
; LINE_WIDTH: 0.284856
G2 X87.39 Y77.157 I2.915 J-2.628 E.00356
; LINE_WIDTH: 0.331642
G2 X87.555 Y77.299 I3.334 J-3.726 E.00406
; LINE_WIDTH: 0.375015
G1 X87.695 Y77.408 E.00378
; LINE_WIDTH: 0.414051
G1 X87.858 Y77.524 E.00474
; LINE_WIDTH: 0.441627
G1 X88.007 Y77.631 E.00468
; WIPE_START
G1 F11969.337
G1 X87.858 Y77.524 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.16 I-1.098 J-.525 P1  F42000
G1 X87.417 Y78.445 Z7.16
G1 Z6.76
G1 E.4 F1800
; LINE_WIDTH: 0.341679
G1 F977
M204 S6000
G1 X86.624 Y78.654 E.01576
; WIPE_START
G1 F15861.786
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.16 I-1.217 J-.032 P1  F42000
G1 X86.657 Y107.43 Z7.16
G1 Z6.76
G1 E.4 F1800
; LINE_WIDTH: 0.397544
G1 F977
M204 S6000
G1 X87.134 Y107.522 E.01103
; LINE_WIDTH: 0.423234
G1 X87.227 Y107.536 E.00228
; LINE_WIDTH: 0.463126
G2 X87.456 Y107.55 I.231 J-1.988 E.00616
G1 X91.03 Y107.55 E.09583
; CHANGE_LAYER
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11369.197
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 43/141
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.16 I1.216 J-.045 P1  F42000
G1 X89.68 Y98.137 Z7.16
G1 Z6.92
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F984
M204 S6000
G3 X90.702 Y97.584 I1.175 J.951 E.02877
G1 X90.728 Y97.165 E.01013
G1 X90.858 Y97.173 E.00315
G3 X92.762 Y99.315 I-.23 J2.122 E.07576
G3 X91.497 Y101.782 I-2.622 J.214 E.07042
G3 X88.799 Y100.214 I-.809 J-1.712 E.08844
G3 X89.18 Y98.089 I4.164 J-.35 E.05264
G3 X90.67 Y97.161 I1.675 J1.03 E.04388
; WIPE_START
G1 F9000
G1 X90.858 Y97.173 E-.07162
G1 X91.104 Y97.189 E-.09371
G1 X91.526 Y97.325 E-.16833
G1 X91.63 Y97.389 E-.04634
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.32 I1.197 J-.222 P1  F42000
G1 X89.386 Y85.272 Z7.32
G1 Z6.92
G1 E.4 F1800
G1 F984
M204 S6000
G3 X90.506 Y84.756 I1.091 J.894 E.03076
G1 X90.566 Y84.34 E.01013
G1 X90.801 Y84.375 E.00571
G3 X92.46 Y85.617 I-.479 J2.369 E.05165
G3 X92.812 Y88.692 I-1.382 J1.716 E.08276
G3 X89.821 Y88.602 I-1.451 J-1.519 E.0803
G3 X88.938 Y87.401 I10.787 J-8.862 E.03597
G3 X89.647 Y84.517 I1.782 J-1.09 E.07964
M73 P33 R22
G3 X90.509 Y84.332 I.801 J1.631 E.02147
; WIPE_START
G1 F9000
G1 X90.801 Y84.375 E-.11202
G1 X91.422 Y84.574 E-.24803
G1 X91.466 Y84.603 E-.01995
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.32 I1.102 J-.516 P1  F42000
G1 X88.419 Y78.098 Z7.32
G1 Z6.92
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F984
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.737 Y77.63 I.713 J-2.549 E.03961
G1 X89.833 Y77.788 E.0048
G1 X89.555 Y78.098 E.01082
G1 X88.479 Y78.098 E.02798
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.16721
G1 X88.234 Y77.653 E-.07214
G1 X88.597 Y77.723 E-.14065
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.32 I-.798 J.919 P1  F42000
G1 X89.507 Y78.514 Z7.32
G1 Z6.92
G1 E.4 F1800
G1 F984
M204 S6000
G1 X87.638 Y78.514 E.04859
G1 X87.594 Y78.319 E.00518
G1 X87.905 Y78.172 E.00896
G3 X87.131 Y77.385 I7.887 J-8.541 E.02871
G3 X86.551 Y75.582 I1.9 J-1.606 E.05049
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.53 J.186 E.05019
G1 X89.741 Y78.514 E.03973
G1 X89.567 Y78.514 E.00453
; WIPE_START
G1 F11728.231
G1 X88.567 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.32 I1.033 J.643 P1  F42000
G1 X89.641 Y76.789 Z7.32
G1 Z6.92
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F984
M204 S5000
G3 X88.759 Y73.323 I-.708 J-1.665 E.15038
G1 X88.91 Y73.315 E.00365
G3 X89.696 Y76.764 I.023 J1.809 E.11862
; WIPE_START
G1 F12000
M204 S6000
G1 X89.299 Y76.899 E-.15949
G1 X89.12 Y76.926 E-.06856
G1 X88.76 Y76.926 E-.13696
G1 X88.721 Y76.918 E-.01499
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.32 I.904 J-.815 P1  F42000
G1 X86.567 Y74.528 Z7.32
G1 Z6.92
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F984
M204 S6000
G3 X89.075 Y72.44 I2.38 J.309 E.09325
G3 X91.313 Y74.531 I-.138 J2.391 E.08638
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.545 E.15215
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16091
G1 X86.842 Y73.682 E-.18084
G1 X86.899 Y73.599 E-.03825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.32 I-.932 J.782 P1  F42000
G1 X90.662 Y78.085 Z7.32
G1 Z6.92
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F984
M204 S5000
G1 X93.85 Y78.085 E.07689
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.29 J.067 E.03194
G1 X87.222 Y78.052 E.01046
G3 X86.153 Y75.957 I1.944 J-2.312 E.05826
G3 X86.164 Y74.547 I36.603 J-.427 E.03401
G3 X89.102 Y72.04 I2.777 J.28 E.10286
G3 X91.73 Y74.827 I-.17 J2.793 E.10174
G3 X91.718 Y76.086 I-11.857 J.513 E.03038
G3 X91.064 Y77.633 I-2.791 J-.268 E.04112
G1 X90.701 Y78.04 E.01315
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z6.92
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F984
M204 S6000
G1 X90.023 Y78.5 E.02703
M204 S10000
G1 X89.96 Y77.597 F42000
; LINE_WIDTH: 0.408209
G1 F984
M204 S6000
G2 X90.289 Y77.332 I-5.066 J-6.636 E.00988
; LINE_WIDTH: 0.35747
G1 X90.383 Y77.254 E.00247
; LINE_WIDTH: 0.323962
G1 X90.496 Y77.149 E.00279
; LINE_WIDTH: 0.297367
G1 X90.566 Y77.082 E.00159
; LINE_WIDTH: 0.26503
G2 X90.695 Y76.935 I-2.949 J-2.717 E.00282
; LINE_WIDTH: 0.218197
G1 X90.813 Y76.776 E.00228
; LINE_WIDTH: 0.178617
G1 X90.879 Y76.675 E.00109
; LINE_WIDTH: 0.137832
G1 X90.966 Y76.516 E.00117
; LINE_WIDTH: 0.0985998
G1 X91.015 Y76.412 E.00046
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.32 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z7.32
G1 Z6.92
G1 E.4 F1800
; LINE_WIDTH: 0.0937875
G1 F984
M204 S6000
G2 X88.315 Y72.763 I-.584 J2.204 E.00456
; WIPE_START
G1 F18000
G1 X88.566 Y72.706 E-.09793
G1 X88.896 Y72.675 E-.1258
G1 X89.213 Y72.692 E-.12046
G1 X89.305 Y72.709 E-.03581
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.32 I-1.015 J-.671 P1  F42000
G1 X86.863 Y76.405 Z7.32
G1 Z6.92
G1 E.4 F1800
; LINE_WIDTH: 0.102368
G1 F984
M204 S6000
G1 X86.917 Y76.522 E.00055
; LINE_WIDTH: 0.129429
G1 X86.965 Y76.612 E.0006
; LINE_WIDTH: 0.169119
G2 X87.064 Y76.774 I3.472 J-2.013 E.00161
; LINE_WIDTH: 0.207068
G1 X87.131 Y76.865 E.00121
; LINE_WIDTH: 0.233681
G1 X87.191 Y76.943 E.00123
; LINE_WIDTH: 0.264602
G2 X87.31 Y77.078 I2.02 J-1.666 E.00259
; LINE_WIDTH: 0.30851
G2 X87.465 Y77.224 I3.327 J-3.364 E.00364
; LINE_WIDTH: 0.346488
G1 X87.593 Y77.328 E.00324
; LINE_WIDTH: 0.380376
G1 X87.689 Y77.403 E.00263
; LINE_WIDTH: 0.412356
G1 X87.855 Y77.522 E.00484
; LINE_WIDTH: 0.441127
G1 X88.007 Y77.63 E.00474
; WIPE_START
G1 F11984.038
G1 X87.855 Y77.522 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.32 I-.823 J-.896 P1  F42000
G1 X86.623 Y78.655 Z7.32
G1 Z6.92
G1 E.4 F1800
; LINE_WIDTH: 0.341624
G1 F984
M204 S6000
G1 X87.417 Y78.445 E.01578
M204 S10000
G1 X87.408 Y78.407 F42000
; LINE_WIDTH: 0.255453
G1 F984
M204 S6000
G1 X86.594 Y78.687 E.0119
; WIPE_START
G1 F18000
G1 X87.408 Y78.407 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.32 I-1.217 J-.031 P1  F42000
G1 X86.668 Y107.441 Z7.32
G1 Z6.92
G1 E.4 F1800
; LINE_WIDTH: 0.409265
G1 F984
M204 S6000
G1 X87.184 Y107.53 E.01227
; LINE_WIDTH: 0.462752
G2 X87.456 Y107.55 I.272 J-1.935 E.00731
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 7.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.142
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 44/141
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.32 I1.216 J-.046 P1  F42000
G1 X89.669 Y98.09 Z7.32
G1 Z7.08
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F974
M204 S6000
G3 X90.7 Y97.518 I1.185 J.92 E.02922
G1 X90.725 Y97.098 E.01013
G1 X90.856 Y97.106 E.00315
G3 X92.746 Y99.236 I-.23 J2.108 E.07529
G3 X91.478 Y101.843 I-2.719 J.289 E.07368
G3 X88.797 Y100.294 I-.808 J-1.696 E.08776
G3 X89.189 Y98.02 I4.388 J-.414 E.0563
G3 X90.668 Y97.095 I1.668 J1.023 E.04359
; WIPE_START
G1 F9000
G1 X90.856 Y97.106 E-.07162
G1 X91.098 Y97.121 E-.09238
G1 X91.517 Y97.255 E-.16699
G1 X91.626 Y97.323 E-.04901
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.48 I1.196 J-.227 P1  F42000
G1 X89.333 Y85.236 Z7.48
G1 Z7.08
G1 E.4 F1800
G1 F974
M204 S6000
G3 X90.463 Y84.702 I1.102 J.872 E.03122
G1 X90.524 Y84.287 E.01013
G1 X90.725 Y84.316 E.00491
G3 X92.471 Y85.676 I-.454 J2.384 E.05541
G3 X93.109 Y88.372 I-1.444 J1.765 E.0718
G1 X92.942 Y88.607 E.00695
G3 X89.882 Y88.65 I-1.549 J-1.333 E.0834
G2 X89.202 Y87.755 I-9.735 J6.687 E.02713
G3 X89.251 Y84.701 I1.636 J-1.501 E.08122
G3 X90.467 Y84.278 I1.222 J1.556 E.03161
; WIPE_START
G1 F9000
G1 X90.725 Y84.316 E-.09939
G1 X91.373 Y84.519 E-.258
G1 X91.423 Y84.552 E-.02262
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.48 I1.103 J-.514 P1  F42000
G1 X88.419 Y78.098 Z7.48
G1 Z7.08
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F974
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.754 Y77.625 I.714 J-2.581 E.04007
G1 X89.85 Y77.782 E.00477
G1 X89.574 Y78.098 E.01092
G1 X88.479 Y78.098 E.02847
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.16721
G1 X88.234 Y77.653 E-.07215
G1 X88.597 Y77.723 E-.14065
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.48 I-.784 J.931 P1  F42000
G1 X89.535 Y78.514 Z7.48
G1 Z7.08
G1 E.4 F1800
G1 F974
M204 S6000
G1 X87.638 Y78.514 E.04932
G1 X87.594 Y78.319 E.00518
G1 X87.905 Y78.172 E.00896
G3 X87.131 Y77.385 I7.893 J-8.548 E.02872
G3 X86.551 Y75.582 I1.899 J-1.605 E.05049
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.788 Y77.338 I-2.491 J.198 E.04904
G1 X89.763 Y78.514 E.04053
G1 X89.595 Y78.514 E.00436
; WIPE_START
G1 F11728.231
G1 X88.595 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.48 I1.037 J.637 P1  F42000
G1 X89.664 Y76.774 Z7.48
G1 Z7.08
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F974
M204 S5000
G1 X89.472 Y76.851 E.00498
G3 X88.759 Y73.323 I-.539 J-1.727 E.14606
G1 X88.908 Y73.315 E.00358
G3 X89.803 Y76.71 I.025 J1.809 E.11577
G1 X89.719 Y76.749 E.00224
; WIPE_START
G1 F12000
M204 S6000
G1 X89.472 Y76.851 E-.1012
G1 X89.12 Y76.926 E-.13688
G1 X88.76 Y76.926 E-.13696
G1 X88.747 Y76.923 E-.00496
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.48 I.9 J-.819 P1  F42000
G1 X86.567 Y74.528 Z7.48
G1 Z7.08
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F974
M204 S6000
G3 X89.07 Y72.44 I2.38 J.309 E.09314
G3 X91.313 Y74.53 I-.133 J2.392 E.08649
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.545 E.15214
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16094
G1 X86.842 Y73.682 E-.18071
G1 X86.899 Y73.599 E-.03835
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.48 I-.932 J.783 P1  F42000
G1 X90.669 Y78.085 Z7.48
G1 Z7.08
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F974
M204 S5000
G1 X93.85 Y78.085 E.07671
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
M73 P34 R22
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.31 E.65976
G3 X86.83 Y78.238 I1.29 J.065 E.03198
G1 X87.222 Y78.052 E.01046
G3 X86.153 Y75.957 I1.944 J-2.312 E.05826
G3 X86.164 Y74.547 I36.603 J-.427 E.03401
G3 X89.098 Y72.04 I2.777 J.279 E.10275
G3 X91.73 Y74.827 I-.165 J2.793 E.10186
G3 X91.712 Y76.134 I-11.348 J.497 E.03154
G3 X91.095 Y77.596 I-2.773 J-.31 E.0388
G1 X90.708 Y78.039 E.01419
; WIPE_START
G1 F12000
M204 S6000
G1 X91.708 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z7.08
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F974
M204 S6000
G1 X90.042 Y78.5 E.02653
M204 S10000
G1 X89.975 Y77.589 F42000
; LINE_WIDTH: 0.411135
G1 F974
M204 S6000
G2 X90.289 Y77.333 I-4.924 J-6.365 E.00954
; LINE_WIDTH: 0.3586
G1 X90.383 Y77.254 E.00247
; LINE_WIDTH: 0.319113
G1 X90.526 Y77.12 E.0035
; LINE_WIDTH: 0.290576
G1 X90.57 Y77.077 E.00099
; LINE_WIDTH: 0.263937
G2 X90.695 Y76.935 I-2.395 J-2.236 E.00271
; LINE_WIDTH: 0.21821
G1 X90.813 Y76.776 E.00228
; LINE_WIDTH: 0.178676
G1 X90.879 Y76.675 E.00109
; LINE_WIDTH: 0.139325
G2 X90.966 Y76.516 I-3.766 J-2.157 E.00119
; LINE_WIDTH: 0.0988472
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.48 I-.428 J-1.139 P1  F42000
G1 X88.008 Y77.629 Z7.48
G1 Z7.08
G1 E.4 F1800
; LINE_WIDTH: 0.44487
G1 F974
M204 S6000
G1 X87.786 Y77.474 E.00696
; LINE_WIDTH: 0.415523
G1 X87.692 Y77.404 E.00278
; LINE_WIDTH: 0.379588
G1 X87.586 Y77.324 E.00287
; LINE_WIDTH: 0.337482
G3 X87.401 Y77.167 I3.201 J-3.975 E.0046
; LINE_WIDTH: 0.290798
G1 X87.391 Y77.158 E.00022
G3 X87.256 Y77.019 I2.846 J-2.885 E.00311
; LINE_WIDTH: 0.244463
G1 X87.131 Y76.865 E.00261
; LINE_WIDTH: 0.207031
G1 X87.064 Y76.774 E.00121
; LINE_WIDTH: 0.169134
G3 X86.965 Y76.612 I3.377 J-2.179 E.0016
; LINE_WIDTH: 0.129485
G1 X86.917 Y76.523 E.0006
; LINE_WIDTH: 0.102411
G1 X86.863 Y76.405 E.00055
; WIPE_START
G1 F18000
G1 X86.917 Y76.523 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.48 I1.141 J.424 P1  F42000
G1 X88.315 Y72.763 Z7.48
G1 Z7.08
G1 E.4 F1800
; LINE_WIDTH: 0.0937918
G1 F974
M204 S6000
G3 X89.526 Y72.751 I.628 J2.19 E.00456
; WIPE_START
G1 F18000
G1 X89.213 Y72.692 E-.12122
G1 X88.893 Y72.675 E-.12185
G1 X88.566 Y72.706 E-.12457
G1 X88.535 Y72.714 E-.01237
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.48 I-1.215 J-.065 P1  F42000
G1 X86.667 Y107.441 Z7.48
G1 Z7.08
G1 E.4 F1800
; LINE_WIDTH: 0.409671
G1 F974
M204 S6000
G1 X87.184 Y107.531 E.01231
; LINE_WIDTH: 0.462754
G2 X87.456 Y107.55 I.272 J-1.932 E.00731
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 7.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.069
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 45/141
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.48 I1.216 J-.047 P1  F42000
G1 X89.66 Y98.043 Z7.48
G1 Z7.24
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F985
M204 S6000
G3 X90.699 Y97.45 I1.198 J.892 E.02968
G1 X90.723 Y97.031 E.01013
G1 X90.852 Y97.039 E.0031
G3 X92.73 Y99.155 I-.225 J2.092 E.07483
G3 X92.61 Y100.407 I-11.25 J-.439 E.03036
G3 X89.775 Y101.879 I-1.992 J-.37 E.08875
G3 X88.849 Y99.441 I1.226 J-1.861 E.06717
G3 X90.666 Y97.028 I2.142 J-.278 E.08067
; WIPE_START
G1 F9000
G1 X90.852 Y97.039 E-.0708
G1 X91.093 Y97.053 E-.09188
G1 X91.508 Y97.186 E-.16559
G1 X91.624 Y97.257 E-.05173
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.64 I1.195 J-.232 P1  F42000
G1 X89.281 Y85.2 Z7.64
G1 Z7.24
G1 E.4 F1800
G1 F985
M204 S6000
G3 X90.421 Y84.649 I1.113 J.847 E.03169
G1 X90.481 Y84.233 E.01013
G1 X90.635 Y84.256 E.00376
G3 X92.427 Y85.682 I-.339 J2.264 E.05783
G3 X92.898 Y88.764 I-1.182 J1.757 E.08448
G3 X89.616 Y88.298 I-1.458 J-1.524 E.09196
G2 X88.874 Y87.252 I-6.441 J3.783 E.03097
G3 X89.573 Y84.407 I1.756 J-1.076 E.07859
G3 X90.424 Y84.225 I.79 J1.611 E.02119
; WIPE_START
G1 F9000
G1 X90.635 Y84.256 E-.08117
G1 X91.324 Y84.465 E-.27354
G1 X91.38 Y84.501 E-.02529
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.64 I1.105 J-.511 P1  F42000
G1 X88.419 Y78.098 Z7.64
G1 Z7.24
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F985
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.755 Y77.625 I.714 J-2.583 E.0401
G1 X89.851 Y77.781 E.00477
G1 X89.576 Y78.098 E.01092
G1 X88.479 Y78.098 E.02851
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.1672
G1 X88.234 Y77.653 E-.07214
G1 X88.597 Y77.723 E-.14066
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.64 I-.783 J.931 P1  F42000
G1 X89.537 Y78.514 Z7.64
G1 Z7.24
G1 E.4 F1800
G1 F985
M204 S6000
G1 X87.638 Y78.514 E.04938
G1 X87.594 Y78.319 E.00518
G1 X87.905 Y78.172 E.00896
G3 X87.13 Y77.385 I7.888 J-8.543 E.02872
G3 X86.551 Y75.582 I1.909 J-1.608 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.791 Y77.335 I-2.491 J.198 E.04893
G1 X89.765 Y78.514 E.04063
G1 X89.597 Y78.514 E.00435
; WIPE_START
G1 F11728.231
G1 X88.597 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.64 I1.035 J.64 P1  F42000
G1 X89.675 Y76.769 Z7.64
G1 Z7.24
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F985
M204 S5000
G1 X89.472 Y76.851 E.00526
G3 X88.759 Y73.323 I-.54 J-1.727 E.14607
G1 X88.905 Y73.315 E.00351
G3 X89.803 Y76.71 I.028 J1.809 E.11582
G1 X89.729 Y76.744 E.00197
; WIPE_START
G1 F12000
M204 S6000
G1 X89.472 Y76.851 E-.10568
G1 X89.12 Y76.926 E-.13685
G1 X88.76 Y76.926 E-.13696
G1 X88.759 Y76.926 E-.0005
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.64 I.898 J-.821 P1  F42000
G1 X86.567 Y74.528 Z7.64
G1 Z7.24
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F985
M204 S6000
G3 X89.065 Y72.439 I2.38 J.309 E.09301
G3 X91.314 Y74.531 I-.128 J2.392 E.08662
G1 X91.082 Y74.584 E.00617
G2 X86.791 Y74.585 I-2.145 J.545 E.15215
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16096
G1 X86.842 Y73.682 E-.18075
G1 X86.899 Y73.599 E-.03829
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.64 I-.932 J.783 P1  F42000
G1 X90.669 Y78.085 Z7.64
G1 Z7.24
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F985
M204 S5000
G1 X93.85 Y78.085 E.0767
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.443 Y107.965 E.10387
G3 X86.15 Y106.669 I-.002 J-1.291 E.04905
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.29 J.067 E.03194
G1 X87.222 Y78.052 E.01046
G3 X86.153 Y75.957 I1.944 J-2.312 E.05826
G3 X86.164 Y74.547 I36.603 J-.427 E.03401
G3 X89.093 Y72.04 I2.777 J.279 E.10263
G3 X91.73 Y74.827 I-.16 J2.793 E.10198
G3 X91.718 Y76.087 I-11.86 J.513 E.03039
G3 X91.097 Y77.592 I-2.786 J-.267 E.03985
G1 X90.709 Y78.039 E.01428
; WIPE_START
G1 F12000
M204 S6000
G1 X91.709 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z7.24
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F985
M204 S6000
G1 X90.043 Y78.5 E.02649
M204 S10000
G1 X89.977 Y77.588 F42000
; LINE_WIDTH: 0.411286
G1 F985
M204 S6000
G2 X90.289 Y77.333 I-4.937 J-6.371 E.00952
; LINE_WIDTH: 0.358637
G1 X90.383 Y77.254 E.00248
; LINE_WIDTH: 0.318621
G1 X90.529 Y77.118 E.00356
; LINE_WIDTH: 0.290132
G1 X90.57 Y77.077 E.00092
; LINE_WIDTH: 0.263965
G2 X90.695 Y76.935 I-2.423 J-2.26 E.00271
; LINE_WIDTH: 0.218242
G1 X90.813 Y76.776 E.00228
; LINE_WIDTH: 0.178715
G1 X90.879 Y76.675 E.00109
; LINE_WIDTH: 0.139338
G2 X90.966 Y76.516 I-3.698 J-2.119 E.00119
; LINE_WIDTH: 0.0988254
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.64 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z7.64
G1 Z7.24
G1 E.4 F1800
; LINE_WIDTH: 0.0937826
G1 F985
M204 S6000
G2 X88.315 Y72.763 I-.584 J2.2 E.00456
; WIPE_START
G1 F18000
G1 X88.567 Y72.706 E-.09788
G1 X88.889 Y72.675 E-.12321
G1 X89.213 Y72.692 E-.12322
G1 X89.305 Y72.709 E-.03568
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.64 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z7.64
G1 Z7.24
G1 E.4 F1800
; LINE_WIDTH: 0.102111
G1 F985
M204 S6000
G1 X86.917 Y76.522 E.00057
; LINE_WIDTH: 0.129451
G1 X86.965 Y76.612 E.00061
; LINE_WIDTH: 0.168648
G2 X87.062 Y76.771 I3.403 J-1.973 E.00156
; LINE_WIDTH: 0.214388
G2 X87.17 Y76.917 I3.945 J-2.797 E.00205
; LINE_WIDTH: 0.260385
G2 X87.303 Y77.071 I4.156 J-3.471 E.00287
; LINE_WIDTH: 0.307368
G2 X87.465 Y77.224 I3.21 J-3.22 E.00379
; LINE_WIDTH: 0.346471
G1 X87.593 Y77.328 E.00323
; LINE_WIDTH: 0.380361
G1 X87.689 Y77.403 E.00263
; LINE_WIDTH: 0.41235
G1 X87.855 Y77.522 E.00484
; LINE_WIDTH: 0.441133
G1 X88.007 Y77.63 E.00474
; WIPE_START
G1 F11983.866
G1 X87.855 Y77.522 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.64 I-1.099 J-.522 P1  F42000
G1 X87.417 Y78.445 Z7.64
G1 Z7.24
G1 E.4 F1800
; LINE_WIDTH: 0.342011
G1 F985
M204 S6000
G1 X86.625 Y78.654 E.01575
; WIPE_START
G1 F15844.677
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.64 I-1.217 J-.032 P1  F42000
G1 X86.656 Y107.43 Z7.64
G1 Z7.24
G1 E.4 F1800
; LINE_WIDTH: 0.397317
G1 F985
M204 S6000
G1 X87.134 Y107.522 E.01105
; LINE_WIDTH: 0.423399
G1 X87.227 Y107.536 E.0023
; LINE_WIDTH: 0.463094
G2 X87.452 Y107.55 I.228 J-1.955 E.00603
G1 X91.03 Y107.55 E.09592
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11370.054
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 46/141
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.64 I1.216 J-.052 P1  F42000
G1 X89.626 Y98.027 Z7.64
G1 Z7.4
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F987
M204 S6000
G3 X90.66 Y97.387 I1.236 J.841 E.03019
G1 X90.672 Y96.967 E.01013
G3 X92.714 Y99.073 I-.03 J2.072 E.0786
G3 X92.581 Y100.48 I-14.208 J-.627 E.0341
G3 X89.764 Y101.937 I-1.978 J-.374 E.08808
G3 X88.868 Y99.399 I1.236 J-1.863 E.06963
G3 X90.614 Y96.965 I2.131 J-.314 E.07988
; WIPE_START
G1 F9000
G1 X91.046 Y96.978 E-.1641
G1 X91.496 Y97.114 E-.17869
G1 X91.579 Y97.165 E-.03721
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.8 I1.194 J-.234 P1  F42000
G1 X89.23 Y85.166 Z7.8
G1 Z7.4
G1 E.4 F1800
G1 F987
M204 S6000
G3 X90.378 Y84.596 I1.086 J.746 E.0323
G1 X90.439 Y84.181 E.01013
G1 X90.53 Y84.194 E.00223
G3 X92.4 Y85.701 I-.277 J2.258 E.06101
G3 X92.94 Y88.796 I-1.146 J1.794 E.08521
G3 X89.679 Y88.349 I-1.45 J-1.535 E.09099
G2 X89.134 Y87.602 I-1.342 J.408 E.02273
G3 X89.157 Y84.611 I1.616 J-1.483 E.07936
G3 X90.381 Y84.172 I1.223 J1.485 E.03199
; WIPE_START
G1 F9000
M73 P35 R22
G1 X90.53 Y84.194 E-.05718
G1 X90.833 Y84.238 E-.11634
G1 X91.276 Y84.41 E-.18033
G1 X91.333 Y84.448 E-.02614
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.8 I1.104 J-.512 P1  F42000
G1 X88.391 Y78.098 Z7.8
G1 Z7.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F987
M204 S6000
G1 X88.112 Y77.809 E.01044
G1 X88.207 Y77.646 E.00489
G2 X89.756 Y77.625 I.739 J-2.584 E.04085
G1 X89.852 Y77.781 E.00476
G1 X89.577 Y78.098 E.01093
G1 X88.451 Y78.098 E.02927
; WIPE_START
G1 F11728.231
G1 X88.112 Y77.809 E-.1692
G1 X88.207 Y77.646 E-.07149
G1 X88.567 Y77.717 E-.13932
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.8 I-.771 J.941 P1  F42000
G1 X89.539 Y78.514 Z7.8
G1 Z7.4
G1 E.4 F1800
G1 F987
M204 S6000
G1 X87.638 Y78.514 E.04942
G1 X87.594 Y78.319 E.00518
G1 X87.891 Y78.178 E.00855
G1 X87.161 Y77.418 E.02739
G3 X86.551 Y75.582 I1.848 J-1.634 E.05169
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.788 Y77.338 I-2.499 J.195 E.04903
G1 X89.766 Y78.514 E.04048
G1 X89.599 Y78.514 E.00434
; WIPE_START
G1 F11728.231
G1 X88.599 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.8 I1.034 J.642 P1  F42000
G1 X89.686 Y76.765 Z7.8
G1 Z7.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F987
M204 S5000
G1 X89.472 Y76.851 E.00555
G3 X88.759 Y73.323 I-.54 J-1.727 E.14607
G1 X88.902 Y73.315 E.00345
G3 X89.803 Y76.71 I.031 J1.809 E.11588
G1 X89.74 Y76.739 E.00168
; WIPE_START
G1 F12000
M204 S6000
G1 X89.472 Y76.851 E-.11021
G1 X89.12 Y76.926 E-.13686
G1 X88.77 Y76.926 E-.13293
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.8 I.896 J-.823 P1  F42000
G1 X86.567 Y74.528 Z7.8
G1 Z7.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F987
M204 S6000
G3 X89.061 Y72.439 I2.38 J.309 E.0929
G3 X91.309 Y74.532 I-.126 J2.39 E.08669
G1 X91.081 Y74.58 E.00606
G2 X86.791 Y74.585 I-2.144 J.548 E.15206
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16099
G1 X86.842 Y73.682 E-.18076
G1 X86.899 Y73.599 E-.03825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.8 I-.932 J.783 P1  F42000
G1 X90.67 Y78.085 Z7.8
G1 Z7.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P35 R21
G1 F987
M204 S5000
G1 X93.85 Y78.085 E.07669
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.31 E.65976
G3 X86.83 Y78.238 I1.332 J.091 E.03188
G1 X87.217 Y78.055 E.01034
G3 X86.302 Y76.734 I2.327 J-2.588 E.03909
G3 X86.15 Y75.822 I2.698 J-.92 E.0224
G3 X86.164 Y74.547 I11.313 J-.514 E.03076
G3 X89.088 Y72.039 I2.777 J.279 E.10251
G3 X91.73 Y74.827 I-.156 J2.793 E.10209
G3 X91.718 Y76.087 I-11.859 J.513 E.03039
G3 X91.098 Y77.591 I-2.812 J-.278 E.03979
G1 X90.709 Y78.039 E.01432
; WIPE_START
G1 F12000
M204 S6000
G1 X91.709 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z7.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F987
M204 S6000
G1 X90.044 Y78.5 E.02646
M204 S10000
G1 X89.978 Y77.588 F42000
; LINE_WIDTH: 0.411495
G1 F987
M204 S6000
G2 X90.29 Y77.333 I-4.944 J-6.373 E.0095
; LINE_WIDTH: 0.358706
G1 X90.383 Y77.254 E.00248
; LINE_WIDTH: 0.319349
G1 X90.524 Y77.123 E.00343
; LINE_WIDTH: 0.290584
G1 X90.57 Y77.077 E.00105
; LINE_WIDTH: 0.263841
G2 X90.694 Y76.936 I-2.502 J-2.336 E.00269
; LINE_WIDTH: 0.217993
G1 X90.809 Y76.782 E.00221
; LINE_WIDTH: 0.178219
G1 X90.879 Y76.674 E.00115
; LINE_WIDTH: 0.137499
G2 X90.968 Y76.511 I-2.276 J-1.357 E.0012
; LINE_WIDTH: 0.0980212
G1 X91.018 Y76.407 E.00046
; WIPE_START
G1 F18000
G1 X90.968 Y76.511 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.8 I1.136 J-.436 P1  F42000
G1 X89.526 Y72.751 Z7.8
G1 Z7.4
G1 E.4 F1800
; LINE_WIDTH: 0.0937825
G1 F987
M204 S6000
G2 X88.315 Y72.763 I-.584 J2.199 E.00456
; WIPE_START
G1 F18000
G1 X88.566 Y72.706 E-.09778
G1 X88.886 Y72.675 E-.12215
G1 X89.214 Y72.692 E-.12454
G1 X89.306 Y72.709 E-.03553
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.8 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z7.8
G1 Z7.4
G1 E.4 F1800
; LINE_WIDTH: 0.106977
G1 F987
M204 S6000
G2 X86.937 Y76.562 I2.871 J-1.263 E.00081
; LINE_WIDTH: 0.149795
G2 X87.017 Y76.698 I2.698 J-1.485 E.00114
; LINE_WIDTH: 0.193566
G1 X87.126 Y76.859 E.00194
; LINE_WIDTH: 0.235673
G1 X87.217 Y76.974 E.00184
; LINE_WIDTH: 0.270989
G1 X87.323 Y77.09 E.00233
; LINE_WIDTH: 0.30241
G1 X87.421 Y77.184 E.00228
; LINE_WIDTH: 0.339288
G1 X87.586 Y77.324 E.00413
; LINE_WIDTH: 0.381331
G1 X87.692 Y77.406 E.00289
; LINE_WIDTH: 0.419506
G1 X87.785 Y77.476 E.00281
; LINE_WIDTH: 0.445894
G1 X87.983 Y77.617 E.00626
; WIPE_START
G1 F11845.238
G1 X87.785 Y77.476 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.8 I-1.138 J-.432 P1  F42000
G1 X87.417 Y78.445 Z7.8
G1 Z7.4
G1 E.4 F1800
; LINE_WIDTH: 0.341086
G1 F987
M204 S6000
G1 X86.623 Y78.654 E.01575
; WIPE_START
G1 F15892.461
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.8 I-1.217 J-.031 P1  F42000
G1 X86.668 Y107.441 Z7.8
G1 Z7.4
G1 E.4 F1800
; LINE_WIDTH: 0.409693
G1 F987
M204 S6000
G1 X87.184 Y107.53 E.01229
; LINE_WIDTH: 0.462745
G2 X87.456 Y107.55 I.272 J-1.937 E.00731
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 7.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.327
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 47/141
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.8 I1.217 J-.029 P1  F42000
G1 X89.793 Y97.756 Z7.8
G1 Z7.56
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F990
M204 S6000
G3 X90.939 Y97.321 I1.15 J1.303 E.03022
G1 X91.044 Y96.914 E.01013
G1 X91.129 Y96.936 E.00212
G3 X92.598 Y99.728 I-.578 J2.086 E.08522
G3 X90.257 Y102.169 I-2.091 J.338 E.09444
G3 X88.903 Y99.409 I.535 J-1.975 E.08389
G3 X90.55 Y96.904 I2.122 J-.399 E.07993
G1 X90.988 Y96.9 E.01055
; WIPE_START
G1 F9000
G1 X91.129 Y96.936 E-.05541
G1 X91.415 Y97.011 E-.11209
G1 X91.845 Y97.257 E-.18824
G1 X91.89 Y97.301 E-.02426
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.96 I1.188 J-.263 P1  F42000
G1 X89.197 Y85.118 Z7.96
G1 Z7.56
G1 E.4 F1800
G1 F990
M204 S6000
G3 X90.366 Y84.548 I1.194 J.966 E.03237
G1 X90.427 Y84.133 E.01013
G3 X92.373 Y85.718 I-.227 J2.266 E.06412
G3 X92.981 Y88.826 I-1.071 J1.823 E.0863
G3 X89.744 Y88.398 I-1.447 J-1.513 E.09032
G2 X89.099 Y87.523 I-1.554 J.47 E.02672
G3 X89.025 Y84.648 I1.627 J-1.48 E.07559
G3 X90.369 Y84.124 I1.289 J1.32 E.03575
; WIPE_START
G1 F9000
G1 X90.787 Y84.186 E-.16056
G1 X91.227 Y84.356 E-.17911
G1 X91.315 Y84.414 E-.04033
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.96 I1.104 J-.511 P1  F42000
G1 X88.392 Y78.098 Z7.96
G1 Z7.56
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F990
M204 S6000
G1 X88.113 Y77.809 E.01043
G1 X88.208 Y77.646 E.00489
G2 X89.757 Y77.624 I.738 J-2.586 E.04085
G1 X89.854 Y77.78 E.00476
G1 X89.578 Y78.098 E.01093
G1 X88.452 Y78.098 E.02927
; WIPE_START
G1 F11728.231
G1 X88.113 Y77.809 E-.16913
G1 X88.208 Y77.646 E-.07152
G1 X88.568 Y77.717 E-.13936
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.96 I-.771 J.942 P1  F42000
G1 X89.541 Y78.514 Z7.96
G1 Z7.56
G1 E.4 F1800
G1 F990
M204 S6000
G1 X87.638 Y78.514 E.04947
G1 X87.594 Y78.319 E.00519
G1 X87.892 Y78.178 E.00856
G1 X87.164 Y77.421 E.02729
G3 X86.551 Y75.582 I1.865 J-1.644 E.05177
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.79 Y77.334 I-2.482 J.2 E.04894
G1 X89.768 Y78.514 E.04057
G1 X89.601 Y78.514 E.00433
; WIPE_START
G1 F11728.231
G1 X88.601 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.96 I1.032 J.645 P1  F42000
G1 X89.697 Y76.76 Z7.96
G1 Z7.56
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F990
M204 S5000
G1 X89.472 Y76.85 E.00584
G3 X88.759 Y73.323 I-.54 J-1.726 E.14609
G1 X88.899 Y73.315 E.00338
G3 X89.803 Y76.71 I.033 J1.809 E.11594
G1 X89.751 Y76.734 E.00138
; WIPE_START
G1 F12000
M204 S6000
G1 X89.472 Y76.85 E-.11473
G1 X89.12 Y76.926 E-.13688
G1 X88.782 Y76.926 E-.12839
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.96 I.894 J-.826 P1  F42000
G1 X86.567 Y74.528 Z7.96
G1 Z7.56
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F990
M204 S6000
G3 X89.056 Y72.439 I2.38 J.309 E.09277
G3 X91.313 Y74.53 I-.119 J2.392 E.08686
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.545 E.15214
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16096
G1 X86.842 Y73.682 E-.18079
G1 X86.896 Y73.597 E-.03824
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.96 I-.931 J.783 P1  F42000
G1 X90.67 Y78.085 Z7.96
G1 Z7.56
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F990
M204 S5000
G1 X93.85 Y78.085 E.07668
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.29 J.067 E.03194
M73 P36 R21
G1 X87.217 Y78.055 E.01034
G3 X86.302 Y76.734 I2.329 J-2.59 E.03909
G3 X86.15 Y75.822 I2.698 J-.92 E.02241
G3 X86.164 Y74.547 I11.321 J-.514 E.03076
G3 X89.083 Y72.039 I2.777 J.279 E.10239
G3 X91.73 Y74.827 I-.15 J2.794 E.10221
G3 X91.722 Y76.028 I-14.947 J.496 E.02897
G3 X91.101 Y77.587 I-2.812 J-.215 E.04109
G1 X90.71 Y78.039 E.01442
; WIPE_START
G1 F12000
M204 S6000
G1 X91.709 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z7.56
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F990
M204 S6000
G1 X90.045 Y78.5 E.02642
M204 S10000
G1 X89.975 Y77.581 F42000
; LINE_WIDTH: 0.432757
G1 F990
M204 S6000
G1 X90.181 Y77.424 E.00646
; LINE_WIDTH: 0.399325
G1 X90.289 Y77.333 E.00323
; LINE_WIDTH: 0.358823
G1 X90.383 Y77.254 E.00248
; LINE_WIDTH: 0.31889
G1 X90.527 Y77.12 E.0035
; LINE_WIDTH: 0.279613
G1 X90.635 Y77.005 E.00243
; LINE_WIDTH: 0.240227
G1 X90.756 Y76.858 E.00245
; LINE_WIDTH: 0.193886
G1 X90.864 Y76.698 E.00192
; LINE_WIDTH: 0.147289
G1 X90.945 Y76.556 E.00116
; LINE_WIDTH: 0.10423
G1 X91.017 Y76.409 E.00071
; WIPE_START
G1 F18000
G1 X90.945 Y76.556 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.96 I1.139 J-.429 P1  F42000
G1 X89.512 Y72.748 Z7.96
G1 Z7.56
G1 E.4 F1800
; LINE_WIDTH: 0.0938057
G1 F990
M204 S6000
G2 X88.315 Y72.763 I-.572 J2.184 E.0045
; WIPE_START
G1 F18000
G1 X88.566 Y72.706 E-.0979
G1 X88.886 Y72.675 E-.1221
G1 X89.214 Y72.692 E-.12471
G1 X89.305 Y72.709 E-.03529
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.96 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z7.96
G1 Z7.56
G1 E.4 F1800
; LINE_WIDTH: 0.102129
G1 F990
M204 S6000
G1 X86.917 Y76.523 E.00057
; LINE_WIDTH: 0.129424
G1 X86.965 Y76.612 E.0006
; LINE_WIDTH: 0.169101
G2 X87.064 Y76.775 I3.468 J-2.011 E.00161
; LINE_WIDTH: 0.207021
G1 X87.13 Y76.865 E.00121
; LINE_WIDTH: 0.23363
G1 X87.191 Y76.943 E.00124
; LINE_WIDTH: 0.264587
G2 X87.31 Y77.078 I2.025 J-1.67 E.00259
; LINE_WIDTH: 0.301843
G1 X87.424 Y77.187 E.00264
; LINE_WIDTH: 0.340203
G1 X87.593 Y77.328 E.00422
; LINE_WIDTH: 0.382105
G1 X87.688 Y77.404 E.00265
; LINE_WIDTH: 0.400484
G1 X87.703 Y77.416 E.00042
; LINE_WIDTH: 0.427504
G1 X87.983 Y77.619 E.00852
; WIPE_START
G1 F12399.295
G1 X87.703 Y77.416 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.96 I-1.173 J-.326 P1  F42000
G1 X87.417 Y78.445 Z7.96
G1 Z7.56
G1 E.4 F1800
; LINE_WIDTH: 0.341138
G1 F990
M204 S6000
G1 X86.623 Y78.654 E.01574
; WIPE_START
G1 F15889.729
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.96 I-1.217 J-.032 P1  F42000
G1 X86.656 Y107.429 Z7.96
G1 Z7.56
G1 E.4 F1800
; LINE_WIDTH: 0.397145
G1 F990
M204 S6000
G1 X87.134 Y107.522 E.01104
; LINE_WIDTH: 0.422618
G1 X87.222 Y107.536 E.00218
; LINE_WIDTH: 0.463054
G2 X87.456 Y107.55 I.227 J-1.833 E.00627
G1 X91.03 Y107.55 E.09581
; CHANGE_LAYER
; Z_HEIGHT: 7.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11371.132
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 48/141
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.96 I1.217 J-.031 P1  F42000
G1 X89.782 Y97.708 Z7.96
G1 Z7.72
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F984
M204 S6000
G3 X90.938 Y97.252 I1.048 J.963 E.03102
G1 X91.042 Y96.845 E.01013
G1 X91.124 Y96.866 E.00203
G3 X92.56 Y99.72 I-.616 J2.099 E.08639
G3 X90.436 Y102.252 I-2.108 J.389 E.09102
G3 X88.93 Y99.415 I.304 J-1.98 E.08987
G3 X90.552 Y96.835 I2.064 J-.502 E.08194
G1 X90.986 Y96.831 E.01047
; WIPE_START
G1 F9000
G1 X91.124 Y96.866 E-.05404
G1 X91.41 Y96.94 E-.11245
G1 X91.805 Y97.159 E-.17166
G1 X91.885 Y97.235 E-.04185
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.12 I1.185 J-.275 P1  F42000
G1 X89.086 Y85.182 Z8.12
G1 Z7.72
G1 E.4 F1800
G1 F984
M204 S6000
G3 X90.2 Y84.495 I1.143 J.605 E.03309
G1 X90.234 Y84.076 E.01013
G3 X92.345 Y85.734 I-.076 J2.27 E.06925
G3 X93.022 Y88.853 I-.956 J1.84 E.08782
G3 X89.576 Y87.999 I-1.449 J-1.531 E.10175
G1 X89.545 Y87.88 E.00295
G3 X88.99 Y84.595 I1.213 J-1.895 E.09048
G3 X90.176 Y84.071 I1.326 J1.4 E.03189
; WIPE_START
G1 F9000
G1 X90.789 Y84.151 E-.2349
G1 X91.145 Y84.289 E-.1451
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.12 I1.114 J-.49 P1  F42000
G1 X88.419 Y78.098 Z8.12
G1 Z7.72
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F984
M204 S6000
G1 X88.14 Y77.818 E.01028
G1 X88.234 Y77.653 E.00493
G2 X89.736 Y77.63 I.712 J-2.549 E.03959
G1 X89.832 Y77.788 E.0048
G1 X89.555 Y78.098 E.01082
G1 X88.479 Y78.098 E.02796
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.818 E-.16718
G1 X88.234 Y77.653 E-.07214
G1 X88.598 Y77.723 E-.14068
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.12 I-.799 J.918 P1  F42000
G1 X89.506 Y78.514 Z8.12
G1 Z7.72
G1 E.4 F1800
G1 F984
M204 S6000
G1 X87.682 Y78.514 E.04742
G1 X87.64 Y78.316 E.00526
G1 X87.925 Y78.191 E.00808
G3 X87.13 Y77.385 I8.075 J-8.75 E.02942
G3 X86.551 Y75.582 I1.888 J-1.602 E.0505
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15774
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.487 J.199 E.05023
G1 X89.741 Y78.514 E.03974
G1 X89.566 Y78.514 E.00454
; WIPE_START
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.12 I1.021 J.663 P1  F42000
G1 X89.708 Y76.755 Z8.12
G1 Z7.72
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F984
M204 S5000
G1 X89.472 Y76.85 E.00613
G3 X88.759 Y73.323 I-.54 J-1.726 E.14609
G1 X88.896 Y73.315 E.00332
G3 X89.803 Y76.709 I.036 J1.809 E.116
G1 X89.762 Y76.729 E.0011
; WIPE_START
G1 F12000
M204 S6000
G1 X89.472 Y76.85 E-.11935
G1 X89.12 Y76.926 E-.13685
G1 X88.794 Y76.926 E-.1238
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.12 I.892 J-.828 P1  F42000
G1 X86.567 Y74.528 Z8.12
G1 Z7.72
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F984
M204 S6000
G3 X89.051 Y72.439 I2.38 J.309 E.09265
G3 X91.313 Y74.531 I-.114 J2.392 E.08699
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.545 E.15214
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.161
G1 X86.811 Y73.742 E-.15524
G1 X86.9 Y73.599 E-.06376
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.12 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z8.12
G1 Z7.72
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F984
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04904
G1 X86.152 Y79.309 E.6598
G3 X86.89 Y78.208 I1.309 J.08 E.03352
G1 X87.229 Y78.059 E.00891
G3 X86.2 Y76.351 I2.053 J-2.4 E.04892
G3 X86.15 Y75.822 I3.667 J-.614 E.01283
G3 X86.164 Y74.547 I11.313 J-.514 E.03076
G3 X89.078 Y72.039 I2.777 J.279 E.10227
G3 X91.73 Y74.827 I-.146 J2.794 E.10233
G3 X91.722 Y76.023 I-15.134 J.496 E.02885
G3 X91.064 Y77.633 I-2.817 J-.211 E.04263
G1 X90.701 Y78.04 E.01315
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z7.72
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F984
M204 S6000
G1 X90.022 Y78.5 E.02704
M204 S10000
G1 X89.959 Y77.597 F42000
; LINE_WIDTH: 0.408161
G1 F984
M204 S6000
G2 X90.289 Y77.332 I-5.123 J-6.707 E.00988
; LINE_WIDTH: 0.357501
G1 X90.382 Y77.254 E.00246
; LINE_WIDTH: 0.337831
G1 X90.394 Y77.244 E.00029
; LINE_WIDTH: 0.312999
G2 X90.561 Y77.087 I-3.245 J-3.62 E.00399
; LINE_WIDTH: 0.270286
G1 X90.661 Y76.974 E.00223
; LINE_WIDTH: 0.234425
G1 X90.76 Y76.853 E.00196
; LINE_WIDTH: 0.193163
G1 X90.864 Y76.698 E.00185
; LINE_WIDTH: 0.14783
G1 X90.943 Y76.559 E.00113
; LINE_WIDTH: 0.104739
G1 X91.017 Y76.409 E.00074
; WIPE_START
G1 F18000
G1 X90.943 Y76.559 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.12 I-.416 J-1.144 P1  F42000
G1 X88.009 Y77.627 Z8.12
G1 Z7.72
G1 E.4 F1800
; LINE_WIDTH: 0.446525
G1 F984
M204 S6000
G3 X87.792 Y77.478 I3.161 J-4.861 E.0068
; LINE_WIDTH: 0.417095
G1 X87.695 Y77.406 E.00287
; LINE_WIDTH: 0.380133
G1 X87.586 Y77.324 E.00295
; LINE_WIDTH: 0.337512
G3 X87.401 Y77.168 I3.211 J-3.989 E.0046
; LINE_WIDTH: 0.290958
G1 X87.391 Y77.158 E.00022
G3 X87.257 Y77.019 I2.856 J-2.895 E.0031
; LINE_WIDTH: 0.244124
G1 X87.134 Y76.87 E.00253
; LINE_WIDTH: 0.201358
G1 X87.043 Y76.74 E.00166
; LINE_WIDTH: 0.162164
G1 X86.962 Y76.606 E.00125
; LINE_WIDTH: 0.128427
G1 X86.917 Y76.523 E.00056
; LINE_WIDTH: 0.102137
G1 X86.86 Y76.401 E.00057
; WIPE_START
G1 F18000
G1 X86.917 Y76.523 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.12 I1.141 J.424 P1  F42000
G1 X88.315 Y72.763 Z8.12
G1 Z7.72
G1 E.4 F1800
; LINE_WIDTH: 0.0937997
G1 F984
M204 S6000
G3 X89.509 Y72.748 I.625 J2.169 E.0045
; WIPE_START
G1 F18000
G1 X89.214 Y72.692 E-.11412
G1 X88.886 Y72.675 E-.12481
G1 X88.567 Y72.706 E-.1221
G1 X88.518 Y72.717 E-.01897
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.12 I-1.215 J-.064 P1  F42000
G1 X86.68 Y107.455 Z8.12
G1 Z7.72
G1 E.4 F1800
; LINE_WIDTH: 0.423345
G1 F984
M204 S6000
G1 X87.222 Y107.536 E.01333
; LINE_WIDTH: 0.463054
G2 X87.456 Y107.55 I.227 J-1.833 E.00627
G1 X91.03 Y107.55 E.09581
; CHANGE_LAYER
; Z_HEIGHT: 7.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11371.13
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 49/141
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.12 I1.217 J-.031 P1  F42000
G1 X89.775 Y97.661 Z8.12
G1 Z7.88
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F995
M204 S6000
G3 X90.938 Y97.182 I1.058 J.916 E.03145
G1 X91.041 Y96.775 E.01013
G1 X91.118 Y96.794 E.00192
G3 X92.633 Y99.33 I-.61 J2.085 E.07833
G2 X92.559 Y100.199 I1.138 J.535 E.02149
G3 X89.988 Y102.211 I-2.046 J.034 E.09113
G3 X88.957 Y99.422 I.805 J-1.883 E.08026
G3 X90.554 Y96.766 I2.095 J-.548 E.08328
G1 X90.985 Y96.761 E.01039
; WIPE_START
G1 F9000
G1 X91.118 Y96.794 E-.0522
G1 X91.406 Y96.868 E-.11283
G1 X91.797 Y97.085 E-.17032
G1 X91.883 Y97.166 E-.04465
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.28 I1.184 J-.28 P1  F42000
G1 X89.041 Y85.155 Z8.28
G1 Z7.88
G1 E.4 F1800
G1 F995
M204 S6000
G3 X90.157 Y84.446 I1.148 J.575 E.03349
G1 X90.191 Y84.028 E.01013
G3 X92.317 Y85.748 I-.089 J2.284 E.07068
G3 X93.29 Y88.551 I-.963 J1.905 E.07912
G3 X89.872 Y88.491 I-1.691 J-1.086 E.09858
G3 X89.584 Y87.826 I1.325 J-.969 E.01761
G3 X88.953 Y84.545 I1.093 J-1.911 E.09148
G3 X90.133 Y84.023 I1.325 J1.4 E.03174
; WIPE_START
G1 F9000
G1 X90.594 Y84.061 E-.17567
G1 X90.921 Y84.165 E-.13024
G1 X91.09 Y84.262 E-.07409
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.28 I1.115 J-.488 P1  F42000
G1 X88.394 Y78.098 Z8.28
G1 Z7.88
M73 P37 R21
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F995
M204 S6000
G1 X88.121 Y77.815 E.01022
G1 X88.209 Y77.654 E.00477
G2 X89.757 Y77.623 I.719 J-2.686 E.04078
G1 X89.856 Y77.779 E.00482
G1 X89.58 Y78.098 E.01097
G1 X88.454 Y78.098 E.02928
; WIPE_START
G1 F11728.231
G1 X88.121 Y77.815 E-.16609
G1 X88.209 Y77.654 E-.06972
G1 X88.548 Y77.723 E-.13166
G1 X88.581 Y77.726 E-.01253
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.28 I-.77 J.942 P1  F42000
G1 X89.545 Y78.514 Z8.28
G1 Z7.88
G1 E.4 F1800
G1 F995
M204 S6000
G1 X87.638 Y78.514 E.04956
G1 X87.594 Y78.319 E.00518
G1 X87.893 Y78.178 E.0086
G1 X87.17 Y77.428 E.02706
G3 X86.551 Y75.582 I1.839 J-1.644 E.05202
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.796 Y77.328 I-2.49 J.198 E.04871
G1 X89.77 Y78.514 E.04075
G1 X89.605 Y78.514 E.00431
; WIPE_START
G1 F11728.231
G1 X88.605 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.28 I1.034 J.642 P1  F42000
G1 X89.69 Y76.767 Z8.28
G1 Z7.88
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F995
M204 S5000
G1 X89.641 Y76.788 E.00128
G3 X88.759 Y73.323 I-.71 J-1.664 E.15046
G1 X88.893 Y73.316 E.00325
G3 X89.956 Y76.615 I.038 J1.809 E.11172
G1 X89.742 Y76.738 E.00595
; WIPE_START
G1 F12000
M204 S6000
G1 X89.641 Y76.788 E-.04285
G1 X89.384 Y76.879 E-.10374
G1 X89.03 Y76.933 E-.13596
G1 X88.774 Y76.92 E-.09746
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.28 I.895 J-.824 P1  F42000
G1 X86.571 Y74.528 Z8.28
G1 Z7.88
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F995
M204 S6000
G3 X89.067 Y72.44 I2.373 J.3 E.09303
G3 X91.313 Y74.53 I-.136 J2.398 E.08652
G1 X91.082 Y74.583 E.00617
G2 X86.793 Y74.581 I-2.145 J.545 E.15201
G1 X86.63 Y74.542 E.00435
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16064
G1 X86.842 Y73.682 E-.18075
G1 X86.899 Y73.598 E-.03861
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.28 I-.931 J.783 P1  F42000
G1 X90.671 Y78.085 Z8.28
G1 Z7.88
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F995
M204 S5000
G1 X93.85 Y78.085 E.07666
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.007 J-1.303 E.049
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.311 J.081 E.03189
G1 X87.217 Y78.054 E.01035
G3 X86.303 Y76.734 I2.333 J-2.594 E.03909
G3 X86.15 Y75.822 I2.697 J-.92 E.02241
G3 X86.164 Y74.549 I11.328 J-.514 E.03072
G3 X89.08 Y72.039 I2.783 J.285 E.10231
G3 X91.73 Y74.827 I-.145 J2.791 E.1023
G3 X91.722 Y76.019 I-15.349 J.496 E.02875
G3 X91.107 Y77.58 I-2.828 J-.212 E.04109
G1 X90.71 Y78.039 E.01463
; WIPE_START
G1 F12000
M204 S6000
G1 X91.71 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z7.88
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F995
M204 S6000
G1 X90.048 Y78.5 E.02636
M204 S10000
G1 X89.977 Y77.581 F42000
; LINE_WIDTH: 0.43292
G1 F995
M204 S6000
G1 X90.181 Y77.424 E.00642
; LINE_WIDTH: 0.39958
G1 X90.29 Y77.333 E.00323
; LINE_WIDTH: 0.358888
G1 X90.383 Y77.254 E.00248
; LINE_WIDTH: 0.317924
G1 X90.532 Y77.114 E.00363
; LINE_WIDTH: 0.27884
G1 X90.635 Y77.005 E.00229
; LINE_WIDTH: 0.244227
G1 X90.736 Y76.883 E.00208
; LINE_WIDTH: 0.20921
G2 X90.812 Y76.775 I-.977 J-.763 E.00145
; LINE_WIDTH: 0.180235
G1 X90.869 Y76.692 E.00091
; LINE_WIDTH: 0.164359
G1 X90.879 Y76.675 E.00016
; LINE_WIDTH: 0.13933
G2 X90.966 Y76.516 I-3.765 J-2.155 E.00119
; LINE_WIDTH: 0.0988551
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.28 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z8.28
G1 Z7.88
G1 E.4 F1800
; LINE_WIDTH: 0.0934818
G1 F995
M204 S6000
G1 X89.304 Y72.703 E.00084
G2 X88.315 Y72.763 I-.356 J2.319 E.00369
; WIPE_START
G1 F18000
G1 X88.461 Y72.725 E-.05745
G1 X88.78 Y72.681 E-.12207
G1 X89.059 Y72.678 E-.10611
G1 X89.304 Y72.703 E-.09362
G1 X89.306 Y72.704 E-.00075
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.28 I-1.015 J-.671 P1  F42000
G1 X86.86 Y76.401 Z8.28
G1 Z7.88
G1 E.4 F1800
; LINE_WIDTH: 0.102136
G1 F995
M204 S6000
G1 X86.917 Y76.523 E.00057
; LINE_WIDTH: 0.128413
G1 X86.962 Y76.606 E.00056
; LINE_WIDTH: 0.162581
G1 X87.045 Y76.743 E.00129
; LINE_WIDTH: 0.20182
G1 X87.134 Y76.87 E.00162
; LINE_WIDTH: 0.237144
G1 X87.217 Y76.974 E.00169
; LINE_WIDTH: 0.27082
G2 X87.318 Y77.084 I1.625 J-1.384 E.00221
; LINE_WIDTH: 0.302826
G1 X87.43 Y77.192 E.00262
; LINE_WIDTH: 0.340674
G1 X87.586 Y77.324 E.00391
; LINE_WIDTH: 0.381901
G1 X87.696 Y77.409 E.00301
; LINE_WIDTH: 0.421485
G1 X87.793 Y77.483 E.00296
; LINE_WIDTH: 0.448871
G2 X87.991 Y77.619 I2.891 J-3.983 E.00623
; WIPE_START
G1 F11760.169
G1 X87.793 Y77.483 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.28 I-1.133 J-.443 P1  F42000
G1 X87.417 Y78.445 Z8.28
G1 Z7.88
G1 E.4 F1800
; LINE_WIDTH: 0.341711
G1 F995
M204 S6000
G1 X86.624 Y78.654 E.01576
; WIPE_START
G1 F15860.119
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.28 I-1.217 J-.031 P1  F42000
G1 X86.666 Y107.441 Z8.28
G1 Z7.88
G1 E.4 F1800
; LINE_WIDTH: 0.409234
G1 F995
M204 S6000
G1 X87.184 Y107.53 E.01231
; LINE_WIDTH: 0.462734
G2 X87.456 Y107.55 I.272 J-1.936 E.00731
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 8.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.607
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 50/141
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.28 I1.217 J-.032 P1  F42000
G1 X89.765 Y97.61 Z8.28
G1 Z8.04
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F997
M204 S6000
G3 X90.938 Y97.112 I1.073 J.898 E.03191
G1 X91.041 Y96.704 E.01013
G1 X91.111 Y96.722 E.00176
G3 X92.619 Y99.24 I-.591 J2.064 E.07793
G2 X92.527 Y100.269 I1.331 J.638 E.02545
G3 X89.969 Y102.255 I-2.038 J.016 E.09025
G3 X88.986 Y99.419 I.815 J-1.871 E.08133
G3 X90.557 Y96.696 I2.089 J-.609 E.08471
G1 X90.985 Y96.69 E.01031
; WIPE_START
G1 F9000
G1 X91.111 Y96.722 E-.04968
G1 X91.402 Y96.796 E-.11395
G1 X91.79 Y97.011 E-.1687
G1 X91.882 Y97.097 E-.04768
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.44 I1.183 J-.285 P1  F42000
G1 X88.995 Y85.131 Z8.44
G1 Z8.04
G1 E.4 F1800
G1 F997
M204 S6000
G3 X90.114 Y84.4 I1.154 J.545 E.03393
G1 X90.147 Y83.981 E.01013
G1 X90.386 Y84 E.00578
G3 X92.148 Y85.386 I-.27 J2.157 E.05678
G2 X92.797 Y86.12 I1.02 J-.248 E.02459
G3 X91.968 Y89.534 I-1.169 J1.524 E.10697
G3 X89.629 Y87.795 I-.123 J-2.277 E.07626
G3 X88.916 Y84.498 I.987 J-1.939 E.09308
G3 X90.089 Y83.977 I1.323 J1.399 E.03157
; WIPE_START
G1 F9000
G1 X90.386 Y84 E-.11303
G1 X90.998 Y84.16 E-.24036
G1 X91.057 Y84.197 E-.02661
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.44 I1.115 J-.487 P1  F42000
G1 X88.395 Y78.098 Z8.44
G1 Z8.04
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F997
M204 S6000
G1 X88.122 Y77.815 E.01022
G1 X88.21 Y77.654 E.00477
G2 X89.733 Y77.629 I.717 J-2.679 E.0401
G1 X89.832 Y77.788 E.00486
G1 X89.555 Y78.098 E.01081
G1 X88.455 Y78.098 E.02859
; WIPE_START
G1 F11728.231
G1 X88.122 Y77.815 E-.16606
G1 X88.21 Y77.654 E-.06975
G1 X88.549 Y77.723 E-.13129
G1 X88.582 Y77.726 E-.0129
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.44 I-.79 J.926 P1  F42000
G1 X89.506 Y78.514 Z8.44
G1 Z8.04
G1 E.4 F1800
G1 F997
M204 S6000
G1 X87.638 Y78.514 E.04857
G1 X87.594 Y78.319 E.00518
G1 X87.893 Y78.177 E.00862
G1 X87.173 Y77.431 E.02696
G3 X86.551 Y75.582 I1.836 J-1.647 E.05213
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.492 J.198 E.05023
G1 X89.741 Y78.514 E.03974
G1 X89.566 Y78.514 E.00454
; WIPE_START
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.44 I1.022 J.661 P1  F42000
G1 X89.699 Y76.762 Z8.44
G1 Z8.04
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F997
M204 S5000
G1 X89.641 Y76.788 E.00152
G3 X88.759 Y73.323 I-.709 J-1.664 E.15046
G1 X88.891 Y73.316 E.00318
G3 X89.956 Y76.615 I.041 J1.809 E.1118
G1 X89.751 Y76.733 E.0057
; WIPE_START
G1 F12000
M204 S6000
G1 X89.641 Y76.788 E-.04675
G1 X89.384 Y76.879 E-.10371
G1 X89.03 Y76.933 E-.13595
G1 X88.85 Y76.933 E-.06854
G1 X88.785 Y76.923 E-.02506
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.44 I.893 J-.826 P1  F42000
G1 X86.571 Y74.529 Z8.44
G1 Z8.04
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F997
M204 S6000
G3 X89.062 Y72.439 I2.373 J.3 E.09292
G3 X91.313 Y74.53 I-.131 J2.399 E.08665
G1 X91.082 Y74.583 E.00617
G2 X86.792 Y74.581 I-2.145 J.545 E.15203
G1 X86.63 Y74.543 E.00435
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16093
G1 X86.842 Y73.682 E-.18071
G1 X86.896 Y73.597 E-.03836
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.44 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z8.44
G1 Z8.04
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F997
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.312 J.081 E.03189
G1 X87.218 Y78.054 E.01035
M73 P38 R21
G3 X86.302 Y76.734 I2.334 J-2.595 E.03909
G3 X86.15 Y75.822 I2.698 J-.92 E.02241
G3 X86.164 Y74.548 I11.332 J-.514 E.03072
G3 X89.075 Y72.039 I2.783 J.285 E.10219
G3 X91.73 Y74.827 I-.136 J2.787 E.10246
G3 X91.718 Y76.086 I-11.857 J.513 E.03038
G3 X91.064 Y77.633 I-2.793 J-.268 E.04112
G1 X90.701 Y78.04 E.01314
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
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

G1 X91.03 Y78.5
G1 Z8.04
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F997
M204 S6000
G1 X90.022 Y78.5 E.02705
M204 S10000
G1 X89.958 Y77.598 F42000
; LINE_WIDTH: 0.40813
G1 F997
M204 S6000
M73 P38 R20
G2 X90.289 Y77.332 I-5.136 J-6.724 E.00992
; LINE_WIDTH: 0.357467
G1 X90.383 Y77.254 E.00246
; LINE_WIDTH: 0.324021
G1 X90.496 Y77.15 E.00279
; LINE_WIDTH: 0.297376
G1 X90.566 Y77.082 E.0016
; LINE_WIDTH: 0.265006
G2 X90.695 Y76.935 I-2.988 J-2.751 E.00282
; LINE_WIDTH: 0.218227
G1 X90.813 Y76.776 E.00227
; LINE_WIDTH: 0.178609
G1 X90.879 Y76.675 E.0011
; LINE_WIDTH: 0.137899
G1 X90.966 Y76.516 E.00117
; LINE_WIDTH: 0.0987823
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.44 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z8.44
G1 Z8.04
G1 E.4 F1800
; LINE_WIDTH: 0.0937755
G1 F997
M204 S6000
G2 X88.315 Y72.763 I-.583 J2.202 E.00456
; WIPE_START
G1 F18000
G1 X88.567 Y72.706 E-.098
G1 X88.88 Y72.676 E-.11954
G1 X89.208 Y72.691 E-.12482
G1 X89.305 Y72.71 E-.03764
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.44 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z8.44
G1 Z8.04
G1 E.4 F1800
; LINE_WIDTH: 0.106975
G1 F997
M204 S6000
G2 X86.937 Y76.562 I2.867 J-1.261 E.00081
; LINE_WIDTH: 0.149824
G2 X87.017 Y76.699 I2.677 J-1.473 E.00114
; LINE_WIDTH: 0.193775
G1 X87.127 Y76.86 E.00195
; LINE_WIDTH: 0.236133
G1 X87.217 Y76.974 E.00183
; LINE_WIDTH: 0.270742
G1 X87.324 Y77.09 E.00233
; LINE_WIDTH: 0.303883
G1 X87.433 Y77.195 E.00257
; LINE_WIDTH: 0.341239
G1 X87.586 Y77.324 E.00384
; LINE_WIDTH: 0.381897
G1 X87.696 Y77.409 E.00301
; LINE_WIDTH: 0.421271
G1 X87.793 Y77.482 E.00295
; LINE_WIDTH: 0.448779
G2 X87.992 Y77.619 I2.861 J-3.942 E.00626
; WIPE_START
G1 F11762.795
G1 X87.793 Y77.482 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.44 I-1.133 J-.443 P1  F42000
G1 X87.417 Y78.445 Z8.44
G1 Z8.04
G1 E.4 F1800
; LINE_WIDTH: 0.341619
G1 F997
M204 S6000
G1 X86.624 Y78.654 E.01575
; WIPE_START
G1 F15864.891
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.44 I-1.217 J-.032 P1  F42000
G1 X86.658 Y107.431 Z8.44
G1 Z8.04
G1 E.4 F1800
; LINE_WIDTH: 0.39727
G1 F997
M204 S6000
G1 X87.16 Y107.527 E.01159
; LINE_WIDTH: 0.462502
G2 X87.456 Y107.55 I.318 J-2.192 E.00794
G1 X91.03 Y107.55 E.09569
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11385.789
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 51/141
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.44 I1.217 J-.033 P1  F42000
G1 X89.757 Y97.556 Z8.44
G1 Z8.2
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F1005
M204 S6000
G3 X90.94 Y97.041 I1.088 J.882 E.03233
G1 X91.042 Y96.634 E.01013
G1 X91.105 Y96.649 E.00156
G3 X92.606 Y99.15 I-.577 J2.047 E.0775
G2 X92.494 Y100.336 I2.549 J.839 E.02897
G3 X89.658 Y102.155 I-1.974 J.042 E.09731
G3 X89.013 Y99.416 I1.115 J-1.708 E.0749
G3 X90.146 Y96.744 I2.178 J-.652 E.07589
G3 X90.986 Y96.62 I.654 J1.514 E.0207
; WIPE_START
G1 F9000
G1 X91.105 Y96.649 E-.04663
G1 X91.4 Y96.724 E-.11558
G1 X91.785 Y96.937 E-.16713
G1 X91.882 Y97.028 E-.05066
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I1.182 J-.291 P1  F42000
G1 X88.947 Y85.112 Z8.6
G1 Z8.2
G1 E.4 F1800
G1 F1005
M204 S6000
G3 X90.072 Y84.356 I1.16 J.513 E.03446
G1 X90.103 Y83.938 E.01013
G1 X90.468 Y83.965 E.00883
G3 X92.184 Y85.575 I-.443 J2.193 E.05977
G2 X93.159 Y86.516 I14.999 J-14.556 E.03268
G3 X91.994 Y89.615 I-1.501 J1.204 E.09612
G3 X89.674 Y87.764 I-.016 J-2.358 E.0774
G3 X88.621 Y84.799 I.978 J-2.017 E.08408
G3 X90.045 Y83.933 I1.493 J.851 E.04196
; WIPE_START
G1 F9000
G1 X90.468 Y83.965 E-.16108
G1 X90.969 Y84.123 E-.19991
G1 X91.012 Y84.149 E-.019
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I1.117 J-.483 P1  F42000
G1 X88.396 Y78.098 Z8.6
G1 Z8.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1005
M204 S6000
G1 X88.123 Y77.816 E.01022
G1 X88.211 Y77.655 E.00477
G2 X89.73 Y77.627 I.713 J-2.58 E.04005
G1 X89.833 Y77.787 E.00493
G1 X89.554 Y78.098 E.01086
G1 X88.456 Y78.098 E.02855
; WIPE_START
G1 F11728.231
G1 X88.123 Y77.816 E-.16601
G1 X88.211 Y77.655 E-.06978
G1 X88.548 Y77.723 E-.13081
G1 X88.584 Y77.726 E-.0134
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I-.79 J.925 P1  F42000
G1 X89.506 Y78.514 Z8.6
G1 Z8.2
G1 E.4 F1800
G1 F1005
M204 S6000
G1 X87.638 Y78.514 E.04855
G1 X87.594 Y78.319 E.00518
G1 X87.894 Y78.177 E.00863
G1 X87.176 Y77.434 E.02685
G3 X86.551 Y75.582 I1.852 J-1.657 E.05222
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.537 J.183 E.05019
G1 X89.74 Y78.514 E.03975
G1 X89.566 Y78.514 E.00454
; WIPE_START
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I1.017 J.668 P1  F42000
G1 X89.723 Y76.751 Z8.6
G1 Z8.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1005
M204 S5000
G3 X88.759 Y73.323 I-.791 J-1.627 E.15262
G1 X88.888 Y73.316 E.00312
G3 X89.777 Y76.724 I.044 J1.809 E.11693
; WIPE_START
G1 F12000
M204 S6000
G1 X89.387 Y76.879 E-.15956
G1 X89.03 Y76.933 E-.13696
G1 X88.85 Y76.933 E-.06862
G1 X88.811 Y76.927 E-.01486
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I.889 J-.831 P1  F42000
G1 X86.567 Y74.528 Z8.6
G1 Z8.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1005
M204 S6000
G3 X89.057 Y72.439 I2.375 J.302 E.09286
G3 X91.313 Y74.53 I-.124 J2.396 E.08679
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.546 E.15213
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.161
G1 X86.842 Y73.682 E-.18076
G1 X86.899 Y73.599 E-.03824
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z8.6
G1 Z8.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1005
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.011 J-1.306 E.04896
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.312 J.081 E.03189
G1 X87.218 Y78.054 E.01036
G3 X86.349 Y76.858 I2.394 J-2.654 E.03592
G3 X86.15 Y75.822 I2.776 J-1.069 E.02558
G3 X86.164 Y74.547 I11.321 J-.514 E.03076
G3 X89.07 Y72.038 I2.783 J.287 E.10203
G3 X91.73 Y74.827 I-.131 J2.788 E.10258
G3 X91.718 Y76.086 I-11.857 J.513 E.03038
G3 X91.064 Y77.633 I-2.793 J-.269 E.04112
G1 X90.701 Y78.04 E.01315
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z8.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F1005
M204 S6000
G1 X90.022 Y78.5 E.02705
; WIPE_START
G1 F11354.373
G1 X91.022 Y78.5 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I.828 J-.892 P1  F42000
G1 X89.822 Y77.385 Z8.6
G1 Z8.2
G1 E.4 F1800
; LINE_WIDTH: 0.364576
G1 F1005
M204 S6000
G1 X90.072 Y77.456 E.00537
; LINE_WIDTH: 0.42325
G1 X90.12 Y77.468 E.00119
G1 X90.202 Y77.403 E.00253
; LINE_WIDTH: 0.392712
G1 X90.283 Y77.339 E.00233
; LINE_WIDTH: 0.357336
G1 X90.388 Y77.248 E.0028
; LINE_WIDTH: 0.325741
G1 X90.479 Y77.167 E.00221
; LINE_WIDTH: 0.289551
G2 X90.632 Y77.01 I-2.951 J-3.02 E.0035
; LINE_WIDTH: 0.241894
G2 X90.755 Y76.858 I-1.799 J-1.588 E.00254
; LINE_WIDTH: 0.193425
G1 X90.865 Y76.697 E.00194
; LINE_WIDTH: 0.149447
G1 X90.937 Y76.57 E.00105
; LINE_WIDTH: 0.106342
G1 X91.016 Y76.41 E.00081
; WIPE_START
G1 F18000
G1 X90.937 Y76.57 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I1.142 J-.422 P1  F42000
G1 X89.526 Y72.751 Z8.6
G1 Z8.2
G1 E.4 F1800
; LINE_WIDTH: 0.0937806
G1 F1005
M204 S6000
G2 X88.315 Y72.763 I-.583 J2.203 E.00456
; WIPE_START
G1 F18000
G1 X88.567 Y72.706 E-.09807
G1 X88.88 Y72.676 E-.11971
G1 X89.208 Y72.691 E-.12468
G1 X89.305 Y72.709 E-.03754
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z8.6
G1 Z8.2
G1 E.4 F1800
; LINE_WIDTH: 0.102125
G1 F1005
M204 S6000
G1 X86.917 Y76.523 E.00057
; LINE_WIDTH: 0.129452
G1 X86.965 Y76.612 E.0006
; LINE_WIDTH: 0.169107
G2 X87.064 Y76.775 I3.518 J-2.042 E.00161
; LINE_WIDTH: 0.20704
G1 X87.131 Y76.865 E.00121
; LINE_WIDTH: 0.233673
G1 X87.191 Y76.943 E.00124
; LINE_WIDTH: 0.26628
G2 X87.317 Y77.084 I1.548 J-1.264 E.00274
; LINE_WIDTH: 0.303503
G1 X87.436 Y77.198 E.00278
; LINE_WIDTH: 0.341706
G1 X87.586 Y77.324 E.00377
; LINE_WIDTH: 0.381843
G1 X87.696 Y77.409 E.00301
; LINE_WIDTH: 0.421143
G1 X87.793 Y77.482 E.00295
; LINE_WIDTH: 0.448732
G2 X87.993 Y77.62 I2.866 J-3.95 E.00628
; WIPE_START
G1 F11764.129
G1 X87.793 Y77.482 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I-1.133 J-.443 P1  F42000
G1 X87.417 Y78.445 Z8.6
G1 Z8.2
G1 E.4 F1800
; LINE_WIDTH: 0.34207
G1 F1005
M204 S6000
G1 X86.623 Y78.654 E.0158
; WIPE_START
G1 F15841.633
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I-1.217 J-.031 P1  F42000
G1 X86.666 Y107.441 Z8.6
G1 Z8.2
G1 E.4 F1800
; LINE_WIDTH: 0.4097
G1 F1005
M204 S6000
G1 X87.184 Y107.531 E.01233
; LINE_WIDTH: 0.462747
G2 X87.456 Y107.55 I.273 J-1.95 E.0073
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 8.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.277
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 52/141
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.6 I1.217 J-.033 P1  F42000
G1 X89.754 Y97.506 Z8.6
G1 Z8.36
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F1008
M204 S6000
G3 X90.942 Y96.97 I1.084 J.818 E.03279
G1 X91.044 Y96.563 E.01013
G1 X91.097 Y96.576 E.00132
G3 X92.627 Y98.554 I-.535 J1.995 E.06478
G3 X92.422 Y99.923 I-16.203 J-1.726 E.03339
G3 X90.349 Y102.422 I-2.042 J.415 E.08976
G3 X88.863 Y99.821 I.228 J-1.856 E.0838
G1 X89.039 Y99.398 E.01105
G3 X90.155 Y96.674 I2.181 J-.697 E.07709
G3 X90.988 Y96.549 I.651 J1.501 E.02055
; WIPE_START
G1 F9000
G1 X91.097 Y96.576 E-.04274
G1 X91.398 Y96.652 E-.11811
G1 X91.78 Y96.862 E-.16558
G1 X91.883 Y96.958 E-.05357
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I1.18 J-.297 P1  F42000
G1 X88.898 Y85.098 Z8.76
G1 Z8.36
G1 E.4 F1800
G1 F1008
M204 S6000
G3 X90.029 Y84.315 I1.17 J.482 E.03506
G1 X90.058 Y83.896 E.01013
G3 X92.153 Y85.584 I-.046 J2.202 E.06979
G2 X93.155 Y86.446 I3.698 J-3.285 E.03198
G3 X92.017 Y89.693 I-1.54 J1.283 E.09976
G3 X90.378 Y88.983 I.049 J-2.36 E.04416
G3 X89.72 Y87.732 I1.694 J-1.691 E.0346
G3 X88.584 Y84.756 I.936 J-2.062 E.08521
G3 X90 Y83.892 I1.491 J.851 E.04174
; WIPE_START
G1 F9000
G1 X90.453 Y83.924 E-.17268
G1 X90.901 Y84.066 E-.17858
G1 X90.966 Y84.105 E-.02874
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I1.12 J-.475 P1  F42000
G1 X88.419 Y78.098 Z8.76
G1 Z8.36
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1008
M204 S6000
M73 P39 R20
G1 X88.144 Y77.822 E.01014
G1 X88.231 Y77.659 E.00481
G2 X89.731 Y77.627 I.696 J-2.563 E.03952
G1 X89.833 Y77.786 E.00492
G1 X89.555 Y78.098 E.01086
G1 X88.479 Y78.098 E.02796
; WIPE_START
G1 F11728.231
G1 X88.144 Y77.822 E-.16512
G1 X88.231 Y77.659 E-.07029
G1 X88.549 Y77.723 E-.12301
G1 X88.605 Y77.728 E-.02159
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I-.8 J.917 P1  F42000
G1 X89.506 Y78.514 Z8.76
G1 Z8.36
G1 E.4 F1800
G1 F1008
M204 S6000
G1 X87.638 Y78.514 E.04856
G1 X87.594 Y78.319 E.00518
G1 X87.905 Y78.172 E.00896
G3 X87.131 Y77.385 I7.905 J-8.559 E.02871
G3 X86.551 Y75.582 I1.91 J-1.609 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.374 I-2.492 J.198 E.05023
G1 X89.741 Y78.514 E.03974
G1 X89.566 Y78.514 E.00454
; WIPE_START
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I1.017 J.668 P1  F42000
G1 X89.723 Y76.751 Z8.76
G1 Z8.36
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1008
M204 S5000
G3 X88.759 Y73.323 I-.791 J-1.627 E.15262
G1 X88.885 Y73.316 E.00305
G3 X89.777 Y76.724 I.047 J1.808 E.117
; WIPE_START
G1 F12000
M204 S6000
G1 X89.387 Y76.879 E-.15945
G1 X89.03 Y76.933 E-.137
G1 X88.811 Y76.922 E-.08356
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I.888 J-.832 P1  F42000
G1 X86.567 Y74.528 Z8.76
G1 Z8.36
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1008
M204 S6000
G3 X89.053 Y72.439 I2.375 J.302 E.09275
G3 X91.313 Y74.53 I-.12 J2.397 E.0869
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.546 E.15212
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16092
G1 X86.842 Y73.682 E-.18079
G1 X86.896 Y73.597 E-.03829
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z8.76
G1 Z8.36
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1008
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.004 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.29 J.067 E.03194
G1 X87.222 Y78.052 E.01047
G3 X86.153 Y75.957 I1.944 J-2.312 E.05826
G3 X86.164 Y74.547 I36.644 J-.427 E.03401
G3 X89.066 Y72.038 I2.783 J.287 E.10192
G3 X91.73 Y74.827 I-.126 J2.788 E.10269
G3 X91.718 Y76.086 I-11.856 J.513 E.03038
G3 X91.064 Y77.633 I-2.793 J-.268 E.04112
G1 X90.701 Y78.04 E.01314
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z8.36
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F1008
M204 S6000
G1 X90.022 Y78.5 E.02705
; WIPE_START
G1 F11354.373
G1 X91.022 Y78.5 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I.828 J-.892 P1  F42000
G1 X89.822 Y77.385 Z8.76
G1 Z8.36
G1 E.4 F1800
; LINE_WIDTH: 0.363763
G1 F1008
M204 S6000
G1 X90.072 Y77.456 E.00534
; LINE_WIDTH: 0.423081
G1 X90.12 Y77.468 E.00121
G1 X90.202 Y77.403 E.00253
; LINE_WIDTH: 0.392789
G1 X90.283 Y77.339 E.00233
; LINE_WIDTH: 0.357406
G1 X90.388 Y77.248 E.0028
; LINE_WIDTH: 0.325784
G1 X90.479 Y77.167 E.00221
; LINE_WIDTH: 0.289706
G2 X90.631 Y77.011 I-2.939 J-3.008 E.00348
; LINE_WIDTH: 0.239945
G1 X90.759 Y76.853 E.00261
; LINE_WIDTH: 0.19189
G1 X90.868 Y76.692 E.00192
; LINE_WIDTH: 0.164137
G1 X90.881 Y76.673 E.00019
; LINE_WIDTH: 0.138984
G2 X90.966 Y76.516 I-3.712 J-2.124 E.00117
; LINE_WIDTH: 0.0988173
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z8.76
G1 Z8.36
G1 E.4 F1800
; LINE_WIDTH: 0.0937775
G1 F1008
M204 S6000
G2 X88.315 Y72.763 I-.584 J2.204 E.00456
; WIPE_START
G1 F18000
G1 X88.566 Y72.706 E-.09788
G1 X88.88 Y72.676 E-.11979
G1 X89.208 Y72.691 E-.12461
G1 X89.305 Y72.71 E-.03773
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z8.76
G1 Z8.36
G1 E.4 F1800
; LINE_WIDTH: 0.095716
G1 F1008
M204 S6000
G1 X86.896 Y76.478 E.00033
; LINE_WIDTH: 0.123162
G1 X86.968 Y76.617 E.00087
; LINE_WIDTH: 0.169316
G2 X87.065 Y76.774 I2.208 J-1.263 E.00156
; LINE_WIDTH: 0.206193
G1 X87.134 Y76.869 E.00126
; LINE_WIDTH: 0.237055
G1 X87.217 Y76.974 E.0017
; LINE_WIDTH: 0.271715
G2 X87.323 Y77.09 I1.68 J-1.431 E.00233
; LINE_WIDTH: 0.309735
G1 X87.465 Y77.223 E.00336
; LINE_WIDTH: 0.346243
G1 X87.587 Y77.324 E.00308
; LINE_WIDTH: 0.380413
G1 X87.697 Y77.408 E.00299
; LINE_WIDTH: 0.417877
G1 X87.794 Y77.481 E.00292
; LINE_WIDTH: 0.447641
G2 X88.012 Y77.628 I3.067 J-4.292 E.00679
; WIPE_START
G1 F11795.17
G1 X87.794 Y77.481 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I-1.133 J-.444 P1  F42000
G1 X87.417 Y78.445 Z8.76
G1 Z8.36
G1 E.4 F1800
; LINE_WIDTH: 0.342085
G1 F1008
M204 S6000
G1 X86.627 Y78.653 E.01572
; WIPE_START
G1 F15840.86
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.76 I-1.217 J-.032 P1  F42000
G1 X86.665 Y107.439 Z8.76
G1 Z8.36
G1 E.4 F1800
; LINE_WIDTH: 0.405582
G1 F1008
M204 S6000
G1 X87.157 Y107.526 E.0116
; LINE_WIDTH: 0.462421
G2 X87.456 Y107.55 I.326 J-2.256 E.00803
G1 X91.03 Y107.55 E.09567
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 8.52
; LAYER_HEIGHT: 0.160001
; WIPE_START
G1 F11387.938
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 53/141
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.76 I1.216 J-.034 P1  F42000
G1 X89.744 Y97.469 Z8.76
G1 Z8.52
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.945 Y96.899 I1.097 J.761 E.03357
G1 X91.047 Y96.492 E.01013
G1 X91.089 Y96.502 E.00105
G3 X92.581 Y98.971 I-.542 J2.013 E.07682
G3 X92.248 Y99.816 I-2.099 J-.339 E.02209
G1 X92.445 Y99.902 E.00519
G2 X92.359 Y100.931 I50.68 J4.767 E.02489
G3 X90.108 Y102.446 I-1.953 J-.472 E.07183
G3 X88.754 Y100.227 I.478 J-1.814 E.06924
G1 X89.053 Y99.304 E.02339
G3 X90.163 Y96.603 I2.172 J-.686 E.07645
G3 X90.991 Y96.478 I.649 J1.49 E.0204
M106 S124.95
; WIPE_START
G1 X91.089 Y96.502 E-.03852
G1 X91.398 Y96.579 E-.12097
G1 X91.776 Y96.787 E-.16408
G1 X91.885 Y96.889 E-.05643
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I1.179 J-.303 P1  F42000
G1 X88.85 Y85.087 Z8.92
G1 Z8.52
G1 E.4 F1800
G1 F926
M204 S6000
G3 X89.987 Y84.277 I1.183 J.458 E.03565
G1 X90.013 Y83.858 E.01013
G3 X92.103 Y85.542 I-.039 J2.187 E.0697
G2 X92.871 Y86.147 I.944 J-.41 E.02457
G3 X93.549 Y88.335 I-1.03 J1.518 E.05967
G3 X90.431 Y89.018 I-1.698 J-.294 E.09837
G3 X89.66 Y87.639 I3.876 J-3.07 E.03826
G3 X88.547 Y84.716 I.919 J-2.024 E.08365
G3 X89.955 Y83.854 I1.493 J.857 E.04152
; WIPE_START
G1 F9000
G1 X90.406 Y83.884 E-.17172
G1 X90.851 Y84.023 E-.17738
G1 X90.922 Y84.064 E-.0309
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I1.122 J-.471 P1  F42000
G1 X88.419 Y78.098 Z8.92
G1 Z8.52
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F926
M204 S6000
G1 X88.144 Y77.822 E.01014
G1 X88.232 Y77.659 E.00481
G2 X89.731 Y77.627 I.696 J-2.563 E.03951
G1 X89.833 Y77.786 E.00492
G1 X89.555 Y78.098 E.01086
G1 X88.479 Y78.098 E.02796
; WIPE_START
G1 F11728.231
G1 X88.144 Y77.822 E-.1651
G1 X88.232 Y77.659 E-.07029
G1 X88.548 Y77.723 E-.12281
G1 X88.605 Y77.728 E-.02179
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I-.8 J.917 P1  F42000
G1 X89.506 Y78.514 Z8.92
G1 Z8.52
G1 E.4 F1800
G1 F926
M204 S6000
G1 X87.638 Y78.514 E.04856
G1 X87.594 Y78.319 E.00518
G1 X87.906 Y78.172 E.00896
G3 X87.131 Y77.385 I7.887 J-8.544 E.02871
G3 X86.551 Y75.582 I1.91 J-1.609 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.486 J.2 E.05023
G1 X89.741 Y78.514 E.03975
G1 X89.566 Y78.514 E.00454
; WIPE_START
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I1.017 J.668 P1  F42000
G1 X89.724 Y76.751 Z8.92
G1 Z8.52
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F926
M204 S5000
G3 X88.759 Y73.323 I-.791 J-1.627 E.15261
G1 X88.882 Y73.316 E.00299
G3 X89.777 Y76.724 I.05 J1.808 E.11707
; WIPE_START
G1 F12000
M204 S6000
G1 X89.387 Y76.879 E-.15956
G1 X89.03 Y76.933 E-.13699
G1 X88.811 Y76.922 E-.08345
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I.888 J-.832 P1  F42000
G1 X86.567 Y74.528 Z8.92
G1 Z8.52
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F926
M204 S6000
G3 X89.048 Y72.439 I2.375 J.302 E.09262
G3 X91.313 Y74.531 I-.115 J2.397 E.08704
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.546 E.15213
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16101
G1 X86.842 Y73.682 E-.18067
G1 X86.898 Y73.599 E-.03832
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z8.92
G1 Z8.52
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F926
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.004 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.29 J.067 E.03194
G1 X87.222 Y78.052 E.01046
M73 P40 R20
G3 X86.153 Y75.957 I1.944 J-2.311 E.05826
G3 X86.164 Y74.548 I36.797 J-.427 E.03398
G3 X89.061 Y72.038 I2.783 J.285 E.10183
G3 X91.73 Y74.827 I-.122 J2.788 E.10281
G3 X91.718 Y76.086 I-12.795 J.504 E.03038
G3 X91.064 Y77.633 I-2.815 J-.278 E.04111
G1 X90.701 Y78.04 E.01315
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z8.52
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F926
M204 S6000
G1 X90.022 Y78.5 E.02705
; WIPE_START
G1 F11354.373
G1 X91.022 Y78.5 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I.828 J-.892 P1  F42000
G1 X89.822 Y77.385 Z8.92
G1 Z8.52
G1 E.4 F1800
; LINE_WIDTH: 0.364192
G1 F926
M204 S6000
G1 X90.072 Y77.456 E.00536
; LINE_WIDTH: 0.423157
G1 X90.12 Y77.468 E.0012
G1 X90.202 Y77.403 E.00253
; LINE_WIDTH: 0.392802
G1 X90.283 Y77.339 E.00233
; LINE_WIDTH: 0.357439
G1 X90.387 Y77.248 E.0028
; LINE_WIDTH: 0.325788
G1 X90.479 Y77.167 E.00222
; LINE_WIDTH: 0.28833
G1 X90.633 Y77.009 E.0035
; LINE_WIDTH: 0.241683
G2 X90.755 Y76.858 I-1.85 J-1.629 E.00252
; LINE_WIDTH: 0.193426
G1 X90.865 Y76.697 E.00194
; LINE_WIDTH: 0.164403
G1 X90.88 Y76.672 E.00024
; LINE_WIDTH: 0.137377
G1 X90.966 Y76.516 E.00115
; LINE_WIDTH: 0.0987341
G1 X91.018 Y76.407 E.00048
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z8.92
G1 Z8.52
G1 E.4 F1800
; LINE_WIDTH: 0.0937886
G1 F926
M204 S6000
G2 X88.315 Y72.763 I-.584 J2.205 E.00456
; WIPE_START
G1 F18000
G1 X88.566 Y72.706 E-.09787
G1 X88.881 Y72.676 E-.12008
G1 X89.208 Y72.691 E-.1244
G1 X89.305 Y72.71 E-.03765
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z8.92
G1 Z8.52
G1 E.4 F1800
; LINE_WIDTH: 0.0962762
G1 F926
M204 S6000
G1 X86.898 Y76.482 E.00035
; LINE_WIDTH: 0.123712
G1 X86.968 Y76.617 E.00085
; LINE_WIDTH: 0.169278
G2 X87.065 Y76.774 I2.204 J-1.26 E.00156
; LINE_WIDTH: 0.206168
G1 X87.134 Y76.869 E.00126
; LINE_WIDTH: 0.24395
G1 X87.257 Y77.019 E.00255
; LINE_WIDTH: 0.290964
G2 X87.391 Y77.158 I3.005 J-2.77 E.0031
G1 X87.401 Y77.168 E.00022
; LINE_WIDTH: 0.337486
G2 X87.586 Y77.324 I3.393 J-3.828 E.00459
; LINE_WIDTH: 0.380315
G1 X87.697 Y77.407 E.00299
; LINE_WIDTH: 0.417767
G1 X87.794 Y77.48 E.00292
; LINE_WIDTH: 0.447595
G2 X88.012 Y77.628 I3.065 J-4.29 E.0068
; WIPE_START
G1 F11796.485
G1 X87.794 Y77.48 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I-1.133 J-.443 P1  F42000
G1 X87.417 Y78.445 Z8.92
G1 Z8.52
G1 E.4 F1800
; LINE_WIDTH: 0.341662
G1 F926
M204 S6000
G1 X86.624 Y78.654 E.01577
; WIPE_START
G1 F15862.629
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.92 I-1.217 J-.032 P1  F42000
G1 X86.665 Y107.44 Z8.92
G1 Z8.52
G1 E.4 F1800
; LINE_WIDTH: 0.409019
G1 F926
M204 S6000
G1 X87.183 Y107.53 E.0123
; LINE_WIDTH: 0.462706
G2 X87.456 Y107.55 I.263 J-1.791 E.00734
G1 X91.03 Y107.55 E.09573
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 8.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11380.345
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 54/141
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.92 I1.216 J-.034 P1  F42000
G1 X89.747 Y97.413 Z8.92
G1 Z8.68
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.949 Y96.828 I1.101 J.734 E.03381
G1 X91.08 Y96.428 E.01015
G3 X92.568 Y98.891 I-.524 J1.998 E.07679
G3 X92.319 Y99.571 I-1.706 J-.24 E.01758
G3 X92.152 Y101.429 I-2.879 J.678 E.04578
G3 X90.557 Y102.595 I-1.925 J-.96 E.04953
G3 X88.951 Y99.723 I.06 J-1.918 E.09532
G1 X89.082 Y99.238 E.0121
G3 X90.173 Y96.532 I2.141 J-.71 E.07654
G3 X90.994 Y96.406 I.646 J1.478 E.02026
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.398 Y96.507 E-.15818
G1 X91.773 Y96.713 E-.16258
G1 X91.887 Y96.819 E-.05924
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.08 I1.177 J-.311 P1  F42000
G1 X88.793 Y85.098 Z9.08
G1 Z8.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.941 Y84.242 I1.204 J.416 E.03666
G1 X89.966 Y83.822 E.01013
G3 X92.091 Y85.873 I-.036 J2.164 E.07838
G1 X92.507 Y85.812 E.01014
G2 X93.252 Y86.379 I14.16 J-17.835 E.02258
G3 X93.557 Y88.413 I-1.562 J1.275 E.05206
G3 X90.477 Y89.126 I-1.69 J-.29 E.09704
G3 X89.679 Y87.591 I11.704 J-7.064 E.04175
G3 X88.349 Y85.075 I.929 J-2.1 E.07403
G3 X89.909 Y83.819 I1.686 J.498 E.05137
M106 S124.95
; WIPE_START
G1 X90.358 Y83.846 E-.17105
G1 X90.801 Y83.982 E-.17614
G1 X90.876 Y84.026 E-.03281
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.08 I1.124 J-.466 P1  F42000
G1 X88.419 Y78.098 Z9.08
G1 Z8.68
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F820
M204 S6000
G1 X88.144 Y77.822 E.01014
G1 X88.232 Y77.659 E.00481
G2 X89.731 Y77.627 I.696 J-2.563 E.03953
G1 X89.834 Y77.786 E.00492
G1 X89.555 Y78.098 E.01087
G1 X88.479 Y78.098 E.02797
; WIPE_START
G1 F11728.231
G1 X88.144 Y77.822 E-.16511
G1 X88.232 Y77.659 E-.07029
G1 X88.549 Y77.723 E-.12288
G1 X88.605 Y77.728 E-.02172
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.08 I-.799 J.918 P1  F42000
G1 X89.507 Y78.514 Z9.08
G1 Z8.68
G1 E.4 F1800
G1 F820
M204 S6000
G1 X87.682 Y78.514 E.04744
G1 X87.64 Y78.316 E.00526
G1 X87.925 Y78.191 E.00808
G3 X87.13 Y77.384 I8.055 J-8.731 E.02943
G3 X86.551 Y75.582 I1.909 J-1.608 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.492 J.198 E.05022
G1 X89.741 Y78.514 E.03974
G1 X89.567 Y78.514 E.00453
; WIPE_START
G1 F11728.231
G1 X88.567 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.08 I1.201 J-.199 P1  F42000
G1 X87.774 Y73.735 Z9.08
G1 Z8.68
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F820
M204 S5000
G3 X88.758 Y73.323 I1.159 J1.389 E.02612
G1 X88.879 Y73.316 E.00292
G3 X87.729 Y73.774 I.053 J1.808 E.24363
; WIPE_START
G1 F12000
M204 S6000
G1 X88.074 Y73.535 E-.15976
G1 X88.406 Y73.395 E-.13697
G1 X88.621 Y73.351 E-.08327
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.08 I-.605 J-1.056 P1  F42000
G1 X86.567 Y74.528 Z9.08
G1 Z8.68
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F820
M204 S6000
G3 X89.043 Y72.438 I2.375 J.303 E.0925
G3 X91.313 Y74.53 I-.111 J2.398 E.08715
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.546 E.15212
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16092
G1 X86.842 Y73.682 E-.18085
G1 X86.896 Y73.597 E-.03822
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.08 I-.932 J.782 P1  F42000
G1 X90.662 Y78.085 Z9.08
G1 Z8.68
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F820
M204 S5000
G1 X93.85 Y78.085 E.07689
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.891 Y78.208 I1.309 J.08 E.03353
G1 X87.229 Y78.059 E.0089
G3 X86.2 Y76.351 I2.053 J-2.4 E.04892
G3 X86.15 Y75.822 I3.667 J-.614 E.01283
G3 X86.164 Y74.547 I11.321 J-.514 E.03076
G3 X89.056 Y72.038 I2.783 J.287 E.10168
G3 X91.73 Y74.827 I-.117 J2.788 E.10293
G3 X91.718 Y76.086 I-12.696 J.505 E.03038
G3 X91.064 Y77.633 I-2.793 J-.268 E.04111
G1 X90.701 Y78.04 E.01315
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.08 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z8.68
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F820
M204 S6000
G1 X90.023 Y78.5 E.02703
M204 S10000
G1 X89.959 Y77.597 F42000
; LINE_WIDTH: 0.408228
G1 F820
M204 S6000
G2 X90.289 Y77.332 I-5.243 J-6.85 E.00989
; LINE_WIDTH: 0.357483
G1 X90.383 Y77.254 E.00246
; LINE_WIDTH: 0.323969
G1 X90.497 Y77.149 E.0028
; LINE_WIDTH: 0.286365
G1 X90.631 Y77.01 E.00306
; LINE_WIDTH: 0.246281
G2 X90.737 Y76.884 I-2.614 J-2.29 E.00218
; LINE_WIDTH: 0.20909
G1 X90.813 Y76.774 E.00146
; LINE_WIDTH: 0.179417
G1 X90.87 Y76.689 E.00093
; LINE_WIDTH: 0.163571
G1 X90.879 Y76.675 E.00013
; LINE_WIDTH: 0.138014
G1 X90.966 Y76.516 E.00117
; LINE_WIDTH: 0.0987894
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.08 I-.429 J-1.139 P1  F42000
G1 X88.012 Y77.628 Z9.08
G1 Z8.68
G1 E.4 F1800
; LINE_WIDTH: 0.447635
G1 F820
M204 S6000
G3 X87.794 Y77.481 I2.884 J-4.491 E.0068
; LINE_WIDTH: 0.417832
G1 X87.697 Y77.407 E.00292
; LINE_WIDTH: 0.380379
G1 X87.586 Y77.324 E.00299
; LINE_WIDTH: 0.346269
G1 X87.465 Y77.223 E.00307
; LINE_WIDTH: 0.309835
G1 X87.323 Y77.09 E.00335
; LINE_WIDTH: 0.267293
G3 X87.191 Y76.943 I1.476 J-1.462 E.00288
; LINE_WIDTH: 0.234273
G1 X87.134 Y76.869 E.00117
; LINE_WIDTH: 0.206328
G1 X87.066 Y76.774 E.00126
; LINE_WIDTH: 0.168634
G3 X86.965 Y76.612 I2.173 J-1.461 E.0016
; LINE_WIDTH: 0.12941
G1 X86.917 Y76.522 E.00061
; LINE_WIDTH: 0.102088
G1 X86.86 Y76.401 E.00057
; WIPE_START
G1 F18000
G1 X86.917 Y76.522 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.08 I1.141 J.424 P1  F42000
G1 X88.315 Y72.763 Z9.08
G1 Z8.68
G1 E.4 F1800
; LINE_WIDTH: 0.093787
G1 F820
M204 S6000
G3 X89.526 Y72.751 I.628 J2.194 E.00456
; WIPE_START
G1 F18000
G1 X89.208 Y72.691 E-.12319
G1 X88.881 Y72.676 E-.12421
G1 X88.566 Y72.706 E-.12019
G1 X88.534 Y72.714 E-.01241
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.08 I-1.215 J-.066 P1  F42000
G1 X86.655 Y107.429 Z9.08
G1 Z8.68
G1 E.4 F1800
; LINE_WIDTH: 0.396599
G1 F820
M204 S6000
G1 X87.134 Y107.523 E.01106
; LINE_WIDTH: 0.422703
G1 X87.222 Y107.536 E.00216
; LINE_WIDTH: 0.463043
G2 X87.456 Y107.55 I.227 J-1.834 E.00627
G1 X91.03 Y107.55 E.09581
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 8.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11371.403
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 55/141
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.08 I1.216 J-.035 P1  F42000
G1 X89.737 Y97.377 Z9.08
G1 Z8.84
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.954 Y96.757 I1.118 J.689 E.03464
G1 X91.071 Y96.353 E.01014
G3 X92.559 Y98.797 I-.504 J1.981 E.07642
G3 X92.183 Y99.71 I-2.275 J-.401 E.024
G3 X92.35 Y100.571 I-1.518 J.741 E.0214
G3 X90.98 Y102.62 I-2.447 J-.154 E.06226
G3 X88.909 Y101.63 I-.436 J-1.75 E.06
G3 X89.174 Y99.389 I1.877 J-.914 E.0575
G3 X90.184 Y96.46 I2.08 J-.922 E.08219
G3 X90.999 Y96.335 I.642 J1.466 E.02011
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.399 Y96.434 E-.15688
G1 X91.771 Y96.638 E-.16112
G1 X91.89 Y96.75 E-.062
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I1.175 J-.316 P1  F42000
G1 X88.751 Y85.078 Z9.24
G1 Z8.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.897 Y84.21 I1.207 J.402 E.03685
G1 X89.92 Y83.791 E.01013
G1 X90.05 Y83.798 E.00314
G3 X91.963 Y85.36 I-.111 J2.087 E.0637
G1 X92.075 Y85.577 E.00589
G1 X92.491 Y85.884 E.01247
G3 X93.586 Y88.329 I-.451 J1.67 E.07389
G3 X90.232 Y88.782 I-1.731 J-.175 E.1121
G3 X89.9 Y87.801 I5.126 J-2.285 E.02503
G2 X89.029 Y87.119 I-2.478 J2.269 E.02678
G3 X88.72 Y84.313 I1.217 J-1.554 E.07586
G3 X89.862 Y83.788 I1.335 J1.397 E.03089
M106 S124.95
; WIPE_START
G1 X90.05 Y83.798 E-.07154
G1 X90.31 Y83.812 E-.09867
G1 X90.75 Y83.944 E-.17486
G1 X90.83 Y83.99 E-.03493
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I1.125 J-.464 P1  F42000
G1 X88.402 Y78.098 Z9.24
G1 Z8.84
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F833
M204 S6000
G1 X88.128 Y77.817 E.0102
G1 X88.216 Y77.656 E.00478
G2 X89.731 Y77.627 I.709 J-2.576 E.03992
G1 X89.833 Y77.786 E.00492
G1 X89.555 Y78.098 E.01086
G1 X88.462 Y78.098 E.0284
; WIPE_START
G1 F11728.231
G1 X88.128 Y77.817 E-.16579
G1 X88.216 Y77.656 E-.06991
G1 X88.548 Y77.723 E-.12883
G1 X88.589 Y77.727 E-.01547
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I-.793 J.924 P1  F42000
G1 X89.506 Y78.514 Z9.24
G1 Z8.84
G1 E.4 F1800
G1 F833
M204 S6000
G1 X87.638 Y78.514 E.04856
G1 X87.594 Y78.319 E.00518
G1 X87.897 Y78.176 E.00871
G3 X87.13 Y77.384 I10.26 J-10.709 E.02864
G3 X86.551 Y75.582 I1.91 J-1.609 E.05047
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.484 J.2 E.05023
G1 X89.741 Y78.514 E.03974
G1 X89.566 Y78.514 E.00454
; WIPE_START
M73 P41 R20
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I1.201 J-.199 P1  F42000
G1 X87.774 Y73.735 Z9.24
G1 Z8.84
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F833
M204 S5000
G3 X88.758 Y73.324 I1.159 J1.389 E.02611
G1 X88.877 Y73.316 E.00286
G3 X87.729 Y73.774 I.056 J1.808 E.2437
; WIPE_START
G1 F12000
M204 S6000
G1 X88.074 Y73.535 E-.15966
G1 X88.406 Y73.395 E-.13699
G1 X88.621 Y73.351 E-.08335
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I-.605 J-1.056 P1  F42000
G1 X86.567 Y74.528 Z9.24
G1 Z8.84
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F833
M204 S6000
G3 X89.039 Y72.438 I2.375 J.302 E.09237
G3 X91.313 Y74.53 I-.106 J2.398 E.08728
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.546 E.15212
M73 P41 R19
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16097
G1 X86.842 Y73.682 E-.18085
G1 X86.896 Y73.597 E-.03818
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z9.24
G1 Z8.84
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F833
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.007 J-1.302 E.049
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.332 J.093 E.03184
G1 X87.219 Y78.054 E.01038
G3 X86.228 Y76.48 I2.124 J-2.436 E.04548
G3 X86.15 Y75.822 I2.831 J-.67 E.01603
G3 X86.164 Y74.548 I11.324 J-.514 E.03073
G3 X89.051 Y72.038 I2.783 J.286 E.10158
G3 X91.73 Y74.827 I-.114 J2.791 E.10303
G3 X91.718 Y76.086 I-12.584 J.506 E.03038
G3 X91.064 Y77.633 I-2.793 J-.269 E.04112
G1 X90.701 Y78.04 E.01315
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z8.84
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F833
M204 S6000
G1 X90.022 Y78.5 E.02705
; WIPE_START
G1 F11354.373
G1 X91.022 Y78.5 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I.828 J-.892 P1  F42000
G1 X89.822 Y77.385 Z9.24
G1 Z8.84
G1 E.4 F1800
; LINE_WIDTH: 0.363782
G1 F833
M204 S6000
G1 X90.072 Y77.455 E.00534
; LINE_WIDTH: 0.423079
G1 X90.12 Y77.468 E.00121
G1 X90.202 Y77.403 E.00253
; LINE_WIDTH: 0.392796
G1 X90.283 Y77.339 E.00233
; LINE_WIDTH: 0.357422
G1 X90.388 Y77.248 E.0028
; LINE_WIDTH: 0.32577
G1 X90.479 Y77.167 E.00222
; LINE_WIDTH: 0.287876
G1 X90.634 Y77.007 E.00354
; LINE_WIDTH: 0.24023
G1 X90.756 Y76.856 E.00249
; LINE_WIDTH: 0.193468
G1 X90.867 Y76.693 E.00197
; LINE_WIDTH: 0.149544
G2 X90.941 Y76.566 I-2.65 J-1.635 E.00106
; LINE_WIDTH: 0.107683
G2 X91.018 Y76.404 I-2.631 J-1.343 E.00082
; WIPE_START
G1 F18000
G1 X90.941 Y76.566 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I1.141 J-.423 P1  F42000
G1 X89.526 Y72.751 Z9.24
G1 Z8.84
G1 E.4 F1800
; LINE_WIDTH: 0.0937924
G1 F833
M204 S6000
G2 X88.315 Y72.763 I-.583 J2.207 E.00456
; WIPE_START
G1 F18000
G1 X88.566 Y72.706 E-.09789
G1 X88.882 Y72.676 E-.12038
G1 X89.208 Y72.691 E-.12407
G1 X89.305 Y72.71 E-.03767
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z9.24
G1 Z8.84
G1 E.4 F1800
; LINE_WIDTH: 0.0973881
G1 F833
M204 S6000
G1 X86.902 Y76.49 E.00039
; LINE_WIDTH: 0.124809
G1 X86.967 Y76.616 E.0008
; LINE_WIDTH: 0.169757
G2 X87.065 Y76.775 I3.37 J-1.955 E.00158
; LINE_WIDTH: 0.207065
G1 X87.131 Y76.865 E.00121
; LINE_WIDTH: 0.233636
G1 X87.191 Y76.943 E.00123
; LINE_WIDTH: 0.267126
G2 X87.322 Y77.089 I1.594 J-1.303 E.00286
; LINE_WIDTH: 0.30507
G1 X87.44 Y77.201 E.00275
; LINE_WIDTH: 0.342423
G1 X87.586 Y77.324 E.00368
; LINE_WIDTH: 0.381444
G1 X87.696 Y77.408 E.00301
; LINE_WIDTH: 0.420307
G1 X87.794 Y77.482 E.00294
; LINE_WIDTH: 0.448458
G2 X87.998 Y77.622 I3.036 J-4.207 E.00641
; WIPE_START
G1 F11771.904
G1 X87.794 Y77.482 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I-1.133 J-.443 P1  F42000
G1 X87.417 Y78.445 Z9.24
G1 Z8.84
G1 E.4 F1800
; LINE_WIDTH: 0.342085
G1 F833
M204 S6000
G1 X86.623 Y78.654 E.0158
; WIPE_START
G1 F15840.838
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.24 I-1.217 J-.032 P1  F42000
G1 X86.666 Y107.441 Z9.24
G1 Z8.84
G1 E.4 F1800
; LINE_WIDTH: 0.409197
G1 F833
M204 S6000
G1 X87.184 Y107.53 E.01232
; LINE_WIDTH: 0.462746
G2 X87.456 Y107.55 I.273 J-1.954 E.00731
G1 X91.03 Y107.55 E.09574
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.287
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 56/141
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.24 I1.216 J-.035 P1  F42000
G1 X89.736 Y97.329 Z9.24
G1 Z9
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.959 Y96.685 I1.129 J.66 E.03512
G1 X91.061 Y96.278 E.01013
G3 X92.55 Y98.703 I-.483 J1.966 E.07609
G2 X92.165 Y99.865 I71.538 J24.292 E.02952
G3 X92.011 Y101.615 I-1.884 J.715 E.04383
G3 X89.406 Y102.331 I-1.507 J-.386 E.0789
G3 X89.098 Y99.555 I1.297 J-1.549 E.07437
G2 X89.004 Y98.267 I-6.576 J-.165 E.03121
G3 X91.004 Y96.264 I1.971 J-.032 E.07614
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.401 Y96.362 E-.1556
G1 X91.77 Y96.564 E-.15972
G1 X91.894 Y96.68 E-.06469
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I1.173 J-.323 P1  F42000
G1 X88.702 Y85.079 Z9.4
G1 Z9
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.854 Y84.181 I1.217 J.374 E.03752
G1 X89.874 Y83.762 E.01013
G1 X89.933 Y83.765 E.00143
G3 X91.913 Y85.329 I-.028 J2.071 E.06543
G1 X92.136 Y85.432 E.00593
G1 X92.515 Y85.842 E.01346
G3 X93.595 Y88.371 I-.443 J1.684 E.07645
G3 X90.269 Y88.888 I-1.721 J-.117 E.11224
G3 X89.964 Y87.801 I3.259 J-1.498 E.02734
G1 X89.61 Y87.411 E.01271
G3 X88.434 Y84.622 I.717 J-1.945 E.08183
G3 X89.816 Y83.759 I1.491 J.85 E.04094
M106 S124.95
; WIPE_START
G1 X89.933 Y83.765 E-.04449
G1 X90.261 Y83.781 E-.12475
G1 X90.699 Y83.909 E-.17357
G1 X90.784 Y83.957 E-.03719
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I1.127 J-.458 P1  F42000
G1 X88.403 Y78.098 Z9.4
G1 Z9
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F833
M204 S6000
G1 X88.13 Y77.818 E.01019
G1 X88.218 Y77.656 E.00478
G2 X89.731 Y77.627 I.708 J-2.575 E.03988
G1 X89.833 Y77.786 E.00492
G1 X89.555 Y78.098 E.01086
G1 X88.463 Y78.098 E.02836
; WIPE_START
G1 F11728.231
G1 X88.13 Y77.818 E-.16573
G1 X88.218 Y77.656 E-.06994
G1 X88.549 Y77.723 E-.12831
G1 X88.59 Y77.727 E-.01602
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I-.793 J.923 P1  F42000
G1 X89.506 Y78.514 Z9.4
G1 Z9
G1 E.4 F1800
G1 F833
M204 S6000
G1 X87.638 Y78.514 E.04856
G1 X87.594 Y78.319 E.00518
G1 X87.898 Y78.175 E.00874
G3 X87.13 Y77.384 I9.967 J-10.441 E.02865
G3 X86.551 Y75.582 I1.909 J-1.608 E.05047
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.374 I-2.492 J.198 E.05024
G1 X89.741 Y78.514 E.03974
G1 X89.566 Y78.514 E.00454
; WIPE_START
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I1.013 J.674 P1  F42000
G1 X89.742 Y76.745 Z9.4
G1 Z9
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F833
M204 S5000
G1 X89.724 Y76.751 E.00047
G3 X88.758 Y73.324 I-.79 J-1.627 E.15256
G1 X88.874 Y73.316 E.00279
G3 X90.03 Y76.563 I.059 J1.808 E.11008
G1 X89.793 Y76.713 E.00677
; WIPE_START
G1 F12000
M204 S6000
G1 X89.724 Y76.751 E-.03
G1 X89.387 Y76.879 E-.13693
G1 X89.03 Y76.933 E-.13699
G1 X88.85 Y76.933 E-.0686
G1 X88.83 Y76.93 E-.00749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I.886 J-.835 P1  F42000
G1 X86.567 Y74.528 Z9.4
G1 Z9
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F833
M204 S6000
G3 X89.034 Y72.438 I2.375 J.303 E.09225
G3 X91.313 Y74.53 I-.102 J2.399 E.0874
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.546 E.15212
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16097
G1 X86.842 Y73.682 E-.1808
G1 X86.899 Y73.599 E-.03823
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z9.4
G1 Z9
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F833
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.007 J-1.302 E.049
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.332 J.093 E.03185
G1 X87.219 Y78.054 E.01039
M73 P42 R19
G3 X86.228 Y76.48 I2.119 J-2.433 E.04549
G3 X86.15 Y75.822 I2.832 J-.67 E.01603
G3 X86.164 Y74.548 I11.322 J-.514 E.03073
G3 X89.046 Y72.037 I2.783 J.286 E.10147
G3 X91.73 Y74.827 I-.107 J2.789 E.10317
G3 X91.718 Y76.086 I-11.855 J.513 E.03038
G3 X91.064 Y77.633 I-2.809 J-.275 E.04112
G1 X90.701 Y78.04 E.01314
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z9
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F833
M204 S6000
G1 X90.022 Y78.5 E.02705
; WIPE_START
G1 F11354.373
G1 X91.022 Y78.5 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I.828 J-.892 P1  F42000
G1 X89.822 Y77.385 Z9.4
G1 Z9
G1 E.4 F1800
; LINE_WIDTH: 0.364147
G1 F833
M204 S6000
G1 X90.072 Y77.456 E.00535
; LINE_WIDTH: 0.423163
G1 X90.12 Y77.468 E.0012
G1 X90.202 Y77.403 E.00253
; LINE_WIDTH: 0.392828
G1 X90.283 Y77.339 E.00233
; LINE_WIDTH: 0.357468
G1 X90.388 Y77.248 E.0028
; LINE_WIDTH: 0.3258
G1 X90.479 Y77.167 E.00222
; LINE_WIDTH: 0.287917
G1 X90.634 Y77.007 E.00354
; LINE_WIDTH: 0.239952
G1 X90.756 Y76.858 E.00248
; LINE_WIDTH: 0.196869
G1 X90.851 Y76.718 E.00172
; LINE_WIDTH: 0.168018
G1 X90.88 Y76.673 E.00044
; LINE_WIDTH: 0.138898
G2 X90.966 Y76.516 I-3.282 J-1.902 E.00117
; LINE_WIDTH: 0.098852
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z9.4
G1 Z9
G1 E.4 F1800
; LINE_WIDTH: 0.0937889
G1 F833
M204 S6000
G2 X88.315 Y72.763 I-.583 J2.208 E.00456
; WIPE_START
G1 F18000
G1 X88.567 Y72.706 E-.09813
G1 X88.882 Y72.676 E-.12042
G1 X89.208 Y72.691 E-.12388
G1 X89.305 Y72.709 E-.03756
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z9.4
G1 Z9
G1 E.4 F1800
; LINE_WIDTH: 0.102086
G1 F833
M204 S6000
G1 X86.917 Y76.522 E.00057
; LINE_WIDTH: 0.129441
G1 X86.965 Y76.612 E.00061
; LINE_WIDTH: 0.169147
G2 X87.064 Y76.774 I3.476 J-2.017 E.0016
; LINE_WIDTH: 0.207014
G1 X87.131 Y76.865 E.00121
; LINE_WIDTH: 0.233655
G1 X87.191 Y76.943 E.00124
; LINE_WIDTH: 0.267139
G2 X87.322 Y77.089 I1.593 J-1.302 E.00285
; LINE_WIDTH: 0.305483
G1 X87.443 Y77.204 E.00283
; LINE_WIDTH: 0.342887
G1 X87.586 Y77.324 E.0036
; LINE_WIDTH: 0.3813
G1 X87.696 Y77.408 E.003
; LINE_WIDTH: 0.419997
G1 X87.793 Y77.482 E.00294
; LINE_WIDTH: 0.448355
G2 X87.999 Y77.622 I2.954 J-4.094 E.00645
; WIPE_START
G1 F11774.84
G1 X87.793 Y77.482 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I-1.133 J-.443 P1  F42000
G1 X87.417 Y78.445 Z9.4
G1 Z9
G1 E.4 F1800
; LINE_WIDTH: 0.342062
G1 F833
M204 S6000
G1 X86.625 Y78.654 E.01576
; WIPE_START
G1 F15842.048
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I-1.217 J-.032 P1  F42000
G1 X86.658 Y107.431 Z9.4
G1 Z9
G1 E.4 F1800
; LINE_WIDTH: 0.39653
G1 F833
M204 S6000
G1 X87.156 Y107.526 E.01148
; LINE_WIDTH: 0.462425
G2 X87.456 Y107.55 I.306 J-1.967 E.00806
G1 X91.03 Y107.55 E.09567
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 9.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11387.822
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 57/141
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.4 I1.216 J-.053 P1  F42000
G1 X89.594 Y97.55 Z9.4
G1 Z9.16
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.962 Y96.612 I1.327 J.468 E.04278
G1 X91.053 Y96.202 E.01013
G3 X92.541 Y98.609 I-.467 J1.953 E.07575
G3 X92.195 Y99.461 I-2.039 J-.333 E.02237
G1 X92.139 Y99.968 E.01229
G3 X92.103 Y101.51 I-2.334 J.717 E.03786
G3 X89.101 Y102.06 I-1.601 J-.272 E.09569
G3 X89.065 Y99.638 I1.538 J-1.234 E.0629
G2 X89.058 Y98.679 I-.771 J-.474 E.02438
G3 X90.599 Y96.202 I2.063 J-.435 E.07768
G1 X90.996 Y96.191 E.00958
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.403 Y96.289 E-.15892
G1 X91.769 Y96.49 E-.15859
G1 X91.889 Y96.602 E-.06249
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I1.172 J-.329 P1  F42000
G1 X88.651 Y85.088 Z9.56
G1 Z9.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.809 Y84.156 I1.236 J.349 E.03822
G1 X89.827 Y83.736 E.01013
G3 X91.863 Y85.301 I.039 J2.056 E.06686
G1 X92.172 Y85.729 E.01275
G3 X93.608 Y88.364 I-.094 J1.76 E.08657
G3 X90.302 Y88.991 I-1.72 J-.041 E.11282
G3 X90.029 Y87.916 I2.423 J-1.186 E.02694
G1 X89.811 Y87.429 E.01287
G3 X88.241 Y84.982 I.525 J-2.064 E.07715
G3 X89.769 Y83.734 I1.679 J.496 E.05054
M106 S124.95
; WIPE_START
G1 X90.211 Y83.753 E-.16804
G1 X90.647 Y83.878 E-.17235
G1 X90.738 Y83.929 E-.03961
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I1.131 J-.45 P1  F42000
G1 X88.419 Y78.098 Z9.56
G1 Z9.16
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F834
M204 S6000
G1 X88.144 Y77.822 E.01014
G1 X88.231 Y77.659 E.00481
G2 X89.726 Y77.628 I.696 J-2.562 E.03939
G1 X89.828 Y77.788 E.00493
G1 X89.55 Y78.098 E.01083
G1 X88.479 Y78.098 E.02784
; WIPE_START
G1 F11728.231
G1 X88.144 Y77.822 E-.16513
G1 X88.231 Y77.659 E-.07029
G1 X88.548 Y77.723 E-.12291
G1 X88.605 Y77.728 E-.02168
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I-.803 J.914 P1  F42000
G1 X89.499 Y78.514 Z9.56
G1 Z9.16
G1 E.4 F1800
G1 F834
M204 S6000
G1 X87.638 Y78.514 E.04839
G1 X87.594 Y78.319 E.00518
G1 X87.906 Y78.172 E.00896
G3 X87.13 Y77.384 I7.928 J-8.583 E.02873
G3 X86.551 Y75.582 I1.909 J-1.608 E.05047
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.76 Y77.373 I-2.492 J.198 E.05021
G1 X89.735 Y78.514 E.03985
G1 X89.559 Y78.514 E.00457
; WIPE_START
G1 F11728.231
G1 X88.559 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I1.011 J.678 P1  F42000
G1 X89.749 Y76.741 Z9.56
G1 Z9.16
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F834
M204 S5000
G1 X89.724 Y76.752 E.00067
G3 X88.758 Y73.324 I-.79 J-1.628 E.15252
G1 X88.871 Y73.316 E.00273
G3 X90.03 Y76.563 I.063 J1.808 E.11018
G1 X89.8 Y76.709 E.00656
; WIPE_START
G1 F12000
M204 S6000
G1 X89.724 Y76.752 E-.03319
G1 X89.387 Y76.879 E-.13687
G1 X89.03 Y76.933 E-.13698
G1 X88.838 Y76.923 E-.07297
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I.883 J-.837 P1  F42000
G1 X86.567 Y74.528 Z9.56
G1 Z9.16
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F834
M204 S6000
G3 X89.029 Y72.438 I2.375 J.303 E.09213
G3 X91.313 Y74.53 I-.099 J2.4 E.0875
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.546 E.15211
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16093
G1 X86.842 Y73.682 E-.18076
G1 X86.899 Y73.599 E-.03831
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I-.933 J.782 P1  F42000
G1 X90.659 Y78.085 Z9.56
G1 Z9.16
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F834
M204 S5000
G1 X93.85 Y78.085 E.07695
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.004 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.29 J.067 E.03194
G1 X87.222 Y78.052 E.01046
G3 X86.153 Y75.957 I1.944 J-2.312 E.05826
G3 X86.164 Y74.547 I36.603 J-.427 E.03401
G3 X89.041 Y72.037 I2.783 J.287 E.10133
G3 X91.73 Y74.827 I-.102 J2.789 E.10328
G3 X91.718 Y76.086 I-12.398 J.508 E.03038
G3 X91.064 Y77.633 I-2.793 J-.268 E.04112
G1 X90.699 Y78.04 E.01319
; WIPE_START
G1 F12000
M204 S6000
G1 X91.699 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z9.16
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F834
M204 S6000
G1 X90.018 Y78.5 E.02717
; WIPE_START
G1 F11354.373
G1 X91.018 Y78.5 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I.828 J-.892 P1  F42000
G1 X89.818 Y77.387 Z9.56
G1 Z9.16
G1 E.4 F1800
; LINE_WIDTH: 0.372571
G1 F834
M204 S6000
G1 X90.074 Y77.46 E.00563
; LINE_WIDTH: 0.425029
G1 X90.116 Y77.47 E.00105
G1 X90.199 Y77.404 E.0026
; LINE_WIDTH: 0.392296
G1 X90.283 Y77.338 E.00238
; LINE_WIDTH: 0.35685
G1 X90.387 Y77.248 E.00279
; LINE_WIDTH: 0.325535
G1 X90.479 Y77.167 E.00221
; LINE_WIDTH: 0.288442
G1 X90.632 Y77.01 E.00349
; LINE_WIDTH: 0.243541
G1 X90.74 Y76.878 E.00224
; LINE_WIDTH: 0.208465
G1 X90.815 Y76.773 E.0014
; LINE_WIDTH: 0.177896
G1 X90.88 Y76.674 E.00107
; LINE_WIDTH: 0.139133
G2 X90.966 Y76.516 I-3.725 J-2.132 E.00117
; LINE_WIDTH: 0.0988561
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z9.56
G1 Z9.16
G1 E.4 F1800
; LINE_WIDTH: 0.0937843
G1 F834
M204 S6000
G2 X88.315 Y72.763 I-.583 J2.208 E.00456
; WIPE_START
G1 F18000
G1 X88.567 Y72.706 E-.09798
G1 X88.883 Y72.676 E-.12067
G1 X89.208 Y72.691 E-.12364
G1 X89.305 Y72.71 E-.03771
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z9.56
G1 Z9.16
G1 E.4 F1800
; LINE_WIDTH: 0.102126
G1 F834
M204 S6000
G1 X86.917 Y76.522 E.00057
; LINE_WIDTH: 0.12948
G1 X86.965 Y76.612 E.00061
; LINE_WIDTH: 0.169147
G2 X87.064 Y76.775 I3.498 J-2.03 E.0016
; LINE_WIDTH: 0.207045
G1 X87.131 Y76.865 E.00121
; LINE_WIDTH: 0.244446
G1 X87.256 Y77.018 E.0026
; LINE_WIDTH: 0.290782
G2 X87.391 Y77.158 I3.034 J-2.796 E.00312
G1 X87.401 Y77.168 E.00022
; LINE_WIDTH: 0.337479
G2 X87.586 Y77.324 I3.413 J-3.851 E.0046
; LINE_WIDTH: 0.380351
G1 X87.697 Y77.407 E.00299
; LINE_WIDTH: 0.417837
G1 X87.794 Y77.481 E.00292
; LINE_WIDTH: 0.447621
G2 X88.012 Y77.628 I3.107 J-4.35 E.00679
; WIPE_START
G1 F11795.742
G1 X87.794 Y77.481 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I-1.133 J-.444 P1  F42000
G1 X87.417 Y78.445 Z9.56
G1 Z9.16
G1 E.4 F1800
; LINE_WIDTH: 0.342066
G1 F834
M204 S6000
G1 X86.627 Y78.653 E.01572
; WIPE_START
G1 F15841.828
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.56 I-1.217 J-.031 P1  F42000
G1 X86.668 Y107.441 Z9.56
G1 Z9.16
G1 E.4 F1800
; LINE_WIDTH: 0.409688
G1 F834
M204 S6000
G1 X87.184 Y107.531 E.01229
; LINE_WIDTH: 0.462749
G2 X87.456 Y107.55 I.273 J-1.952 E.0073
G1 X91.03 Y107.55 E.09574
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 9.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.223
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 58/141
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.56 I1.216 J-.041 P1  F42000
G1 X89.688 Y97.305 Z9.56
G1 Z9.32
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.898 Y96.537 I1.31 J.727 E.03604
G1 X90.975 Y96.124 E.01013
G3 X92.534 Y98.516 I-.351 J1.932 E.07706
G3 X92.143 Y99.446 I-2.237 J-.392 E.02454
G2 X92.183 Y100.27 I.805 J.374 E.02068
G3 X91.68 Y102.472 I-2.86 J.505 E.05595
G3 X89.141 Y102.175 I-1.156 J-1.124 E.07118
G3 X89.16 Y99.557 I1.511 J-1.299 E.0689
G2 X89.078 Y98.593 I-1.216 J-.381 E.02392
G3 X90.509 Y96.15 I2.071 J-.428 E.07483
G1 X90.918 Y96.114 E.00991
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.33 Y96.19 E-.15922
G1 X91.736 Y96.393 E-.17245
G1 X91.83 Y96.479 E-.04833
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.72 I1.171 J-.331 P1  F42000
G1 X88.611 Y85.097 Z9.72
G1 Z9.32
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.766 Y84.134 I1.255 J.332 E.03866
G1 X89.782 Y83.714 E.01013
G3 X91.846 Y85.33 I.029 J2.088 E.06833
G2 X92.724 Y85.79 I.808 J-.475 E.0252
G3 X93.623 Y88.328 I-.637 J1.653 E.07375
G3 X91.691 Y90.131 I-1.833 J-.027 E.07116
G3 X90.067 Y88.056 I.504 J-2.069 E.06852
G1 X90.08 Y87.802 E.00613
G1 X89.757 Y87.349 E.01343
G3 X88.206 Y84.959 I.488 J-2.015 E.07575
G3 X89.724 Y83.712 I1.678 J.495 E.0503
M106 S124.95
; WIPE_START
G1 X90.162 Y83.729 E-.16664
G1 X90.595 Y83.85 E-.17068
G1 X90.693 Y83.904 E-.04268
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.72 I1.132 J-.446 P1  F42000
G1 X88.407 Y78.098 Z9.72
G1 Z9.32
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F829
M204 S6000
G1 X88.133 Y77.818 E.01018
G1 X88.22 Y77.657 E.00479
G2 X89.731 Y77.627 I.705 J-2.572 E.03981
G1 X89.833 Y77.786 E.00492
G1 X89.555 Y78.098 E.01087
G1 X88.467 Y78.098 E.02828
; WIPE_START
G1 F11728.231
G1 X88.133 Y77.818 E-.1656
G1 X88.22 Y77.657 E-.07002
G1 X88.548 Y77.723 E-.12714
G1 X88.594 Y77.727 E-.01724
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.72 I-.794 J.922 P1  F42000
G1 X89.506 Y78.514 Z9.72
G1 Z9.32
G1 E.4 F1800
G1 F829
M204 S6000
G1 X87.638 Y78.514 E.04857
G1 X87.594 Y78.319 E.00518
G1 X87.899 Y78.174 E.00879
G3 X87.13 Y77.385 I9.451 J-9.97 E.02866
G3 X86.551 Y75.582 I1.909 J-1.609 E.05048
G1 X86.766 Y75.552 E.00565
M73 P43 R19
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.489 J.199 E.05023
G1 X89.741 Y78.514 E.03974
G1 X89.566 Y78.514 E.00454
; WIPE_START
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.72 I1.01 J.678 P1  F42000
G1 X89.767 Y76.726 Z9.72
G1 Z9.32
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F829
M204 S5000
G1 X89.658 Y76.782 E.00293
G3 X88.758 Y73.324 I-.724 J-1.658 E.15077
G1 X88.868 Y73.316 E.00266
G3 X89.957 Y76.616 I.066 J1.808 E.11244
G1 X89.819 Y76.696 E.00385
; WIPE_START
G1 F12000
M204 S6000
G1 X89.658 Y76.782 E-.06899
G1 X89.387 Y76.879 E-.10966
G1 X89.03 Y76.933 E-.13698
G1 X88.861 Y76.924 E-.06436
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.72 I.879 J-.842 P1  F42000
G1 X86.567 Y74.528 Z9.72
G1 Z9.32
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F829
M204 S6000
G3 X89.025 Y72.437 I2.375 J.303 E.09202
G3 X91.313 Y74.53 I-.093 J2.4 E.08763
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.546 E.15211
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.161
G1 X86.842 Y73.682 E-.18071
G1 X86.896 Y73.597 E-.03829
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.72 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z9.72
G1 Z9.32
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F829
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.003 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.29 J.067 E.03194
G1 X87.22 Y78.053 E.01041
G3 X86.2 Y76.351 I2.084 J-2.405 E.04867
G3 X86.15 Y75.822 I3.66 J-.614 E.01283
G3 X86.164 Y74.547 I11.321 J-.514 E.03076
G3 X89.036 Y72.037 I2.784 J.287 E.10121
G3 X91.73 Y74.827 I-.098 J2.79 E.1034
G3 X91.718 Y76.087 I-11.858 J.513 E.03039
G3 X91.064 Y77.633 I-2.805 J-.274 E.04112
G1 X90.701 Y78.04 E.01314
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.72 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z9.32
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F829
M204 S6000
G1 X90.022 Y78.5 E.02704
M204 S10000
G1 X89.955 Y77.592 F42000
; LINE_WIDTH: 0.431885
G1 F829
M204 S6000
G1 X90.181 Y77.421 E.00704
; LINE_WIDTH: 0.395705
G1 X90.289 Y77.332 E.00317
; LINE_WIDTH: 0.357395
G1 X90.383 Y77.254 E.00245
; LINE_WIDTH: 0.324031
G1 X90.496 Y77.15 E.00279
; LINE_WIDTH: 0.286432
G1 X90.631 Y77.01 E.00307
; LINE_WIDTH: 0.2423
G2 X90.737 Y76.883 I-2.62 J-2.295 E.00214
G1 X90.755 Y76.859 E.0004
; LINE_WIDTH: 0.193513
G1 X90.866 Y76.695 E.00196
; LINE_WIDTH: 0.164494
G1 X90.879 Y76.674 E.0002
; LINE_WIDTH: 0.137824
G1 X90.966 Y76.516 E.00117
; LINE_WIDTH: 0.0987869
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.72 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z9.72
G1 Z9.32
G1 E.4 F1800
; LINE_WIDTH: 0.0937891
G1 F829
M204 S6000
G2 X88.315 Y72.763 I-.583 J2.21 E.00456
; WIPE_START
G1 F18000
G1 X88.566 Y72.706 E-.09773
G1 X88.883 Y72.676 E-.12094
G1 X89.208 Y72.691 E-.12355
G1 X89.306 Y72.71 E-.03778
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.72 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z9.72
G1 Z9.32
G1 E.4 F1800
; LINE_WIDTH: 0.106981
G1 F829
M204 S6000
G2 X86.937 Y76.562 I2.841 J-1.249 E.00081
; LINE_WIDTH: 0.149906
G2 X87.017 Y76.699 I2.685 J-1.477 E.00115
; LINE_WIDTH: 0.195239
G1 X87.128 Y76.861 E.00198
; LINE_WIDTH: 0.23587
G1 X87.217 Y76.974 E.0018
; LINE_WIDTH: 0.271573
G2 X87.322 Y77.089 I1.641 J-1.395 E.00232
; LINE_WIDTH: 0.306335
G1 X87.45 Y77.21 E.00298
; LINE_WIDTH: 0.343908
G1 X87.586 Y77.324 E.00346
; LINE_WIDTH: 0.381187
G1 X87.697 Y77.408 E.003
; LINE_WIDTH: 0.41965
G1 X87.794 Y77.482 E.00294
; LINE_WIDTH: 0.448274
G2 X88.002 Y77.624 I2.915 J-4.048 E.00652
; WIPE_START
G1 F11777.129
G1 X87.794 Y77.482 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.72 I-1.133 J-.444 P1  F42000
G1 X87.417 Y78.445 Z9.72
G1 Z9.32
G1 E.4 F1800
; LINE_WIDTH: 0.342018
G1 F829
M204 S6000
G1 X86.625 Y78.654 E.01575
; WIPE_START
G1 F15844.301
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.72 I-1.217 J-.032 P1  F42000
G1 X86.654 Y107.429 Z9.72
G1 Z9.32
G1 E.4 F1800
; LINE_WIDTH: 0.396235
G1 F829
M204 S6000
G1 X87.134 Y107.523 E.01107
; LINE_WIDTH: 0.423422
G1 X87.227 Y107.536 E.00228
; LINE_WIDTH: 0.46313
G2 X87.456 Y107.55 I.233 J-2.047 E.00614
G1 X91.03 Y107.55 E.09583
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 9.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11369.093
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 59/141
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.72 I1.216 J-.039 P1  F42000
G1 X89.699 Y97.239 Z9.72
G1 Z9.48
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.938 Y96.472 I1.318 J.744 E.03666
G1 X91.014 Y96.059 E.01013
G3 X92.561 Y97.927 I-.344 J1.859 E.06349
G3 X92.144 Y99.337 I-2.549 J.013 E.03596
G1 X91.958 Y99.814 E.01236
G3 X91.698 Y102.561 I-2.434 J1.155 E.06985
G3 X89.181 Y102.289 I-1.153 J-1.116 E.07035
G3 X89.181 Y99.536 I1.641 J-1.376 E.0721
G2 X89.097 Y98.507 I-1.166 J-.423 E.02569
G3 X90.509 Y96.081 I2.06 J-.426 E.07411
G1 X90.957 Y96.048 E.01084
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.333 Y96.118 E-.14509
G1 X91.713 Y96.304 E-.16072
G1 X91.86 Y96.433 E-.07418
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I1.167 J-.346 P1  F42000
G1 X88.553 Y85.266 Z9.88
G1 Z9.48
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.796 Y84.052 I1.344 J.132 E.04553
G1 X89.881 Y83.64 E.01013
G3 X91.748 Y85.24 I-.196 J2.117 E.06321
G2 X92.762 Y85.752 I1.143 J-1.006 E.02806
G3 X93.633 Y88.312 I-.654 J1.651 E.07413
G3 X91.598 Y90.187 I-1.841 J.043 E.07549
G3 X90.117 Y87.823 I.622 J-2.036 E.07334
G1 X89.79 Y87.306 E.01475
G3 X88.178 Y84.925 I.383 J-1.996 E.07705
G3 X89.825 Y83.628 I1.707 J.475 E.05408
M106 S124.95
; WIPE_START
G1 X90.543 Y83.825 E-.28303
G1 X90.767 Y83.947 E-.09697
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I1.129 J-.455 P1  F42000
G1 X88.409 Y78.098 Z9.88
G1 Z9.48
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F834
M204 S6000
G1 X88.134 Y77.819 E.01017
G1 X88.222 Y77.657 E.00479
G2 X89.731 Y77.627 I.704 J-2.571 E.03977
G1 X89.834 Y77.786 E.00492
G1 X89.555 Y78.098 E.01087
G1 X88.469 Y78.098 E.02824
; WIPE_START
G1 F11728.231
G1 X88.134 Y77.819 E-.16552
G1 X88.222 Y77.657 E-.07006
G1 X88.549 Y77.723 E-.12647
G1 X88.596 Y77.728 E-.01795
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I-.795 J.921 P1  F42000
G1 X89.507 Y78.514 Z9.88
G1 Z9.48
G1 E.4 F1800
G1 F834
M204 S6000
G1 X87.638 Y78.514 E.04859
G1 X87.594 Y78.319 E.00518
G1 X87.9 Y78.174 E.00882
G3 X87.13 Y77.384 I9.125 J-9.671 E.02867
G3 X86.551 Y75.582 I1.909 J-1.608 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.491 J.198 E.05023
G1 X89.741 Y78.514 E.03972
G1 X89.567 Y78.514 E.00453
; WIPE_START
G1 F11728.231
G1 X88.567 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I1.01 J.678 P1  F42000
G1 X89.762 Y76.733 Z9.88
G1 Z9.48
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F834
M204 S5000
G1 X89.724 Y76.752 E.00103
G3 X88.758 Y73.324 I-.789 J-1.628 E.15249
G1 X88.865 Y73.316 E.0026
G3 X90.03 Y76.564 I.069 J1.808 E.11035
G1 X89.813 Y76.701 E.00619
; WIPE_START
G1 F12000
M204 S6000
G1 X89.724 Y76.752 E-.03903
G1 X89.387 Y76.879 E-.13694
G1 X89.03 Y76.933 E-.13699
G1 X88.854 Y76.933 E-.06704
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I.882 J-.839 P1  F42000
G1 X86.567 Y74.528 Z9.88
G1 Z9.48
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F834
M204 S6000
G3 X89.02 Y72.437 I2.376 J.303 E.09189
G3 X91.313 Y74.53 I-.089 J2.401 E.08775
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.546 E.15211
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16099
G1 X86.842 Y73.682 E-.18071
G1 X86.899 Y73.599 E-.03829
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I-.932 J.782 P1  F42000
G1 X90.662 Y78.085 Z9.88
G1 Z9.48
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F834
M204 S5000
G1 X93.85 Y78.085 E.07689
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.004 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
M73 P44 R19
G3 X86.83 Y78.238 I1.29 J.067 E.03194
G1 X87.22 Y78.053 E.01042
M73 P44 R18
G3 X86.2 Y76.351 I2.078 J-2.402 E.04867
G3 X86.15 Y75.822 I3.659 J-.614 E.01283
G3 X86.164 Y74.547 I11.324 J-.514 E.03074
G3 X89.031 Y72.037 I2.784 J.286 E.10111
G3 X91.73 Y74.827 I-.093 J2.79 E.10352
G3 X91.718 Y76.086 I-11.855 J.513 E.03038
G3 X91.064 Y77.633 I-2.793 J-.268 E.04112
G1 X90.701 Y78.04 E.01314
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z9.48
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F834
M204 S6000
G1 X90.023 Y78.5 E.02703
; WIPE_START
G1 F11354.373
G1 X91.023 Y78.5 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I.828 J-.891 P1  F42000
G1 X89.823 Y77.385 Z9.88
G1 Z9.48
G1 E.4 F1800
; LINE_WIDTH: 0.363043
G1 F834
M204 S6000
G1 X90.072 Y77.455 E.00532
; LINE_WIDTH: 0.422877
G1 X90.121 Y77.468 E.00122
G1 X90.202 Y77.403 E.00252
; LINE_WIDTH: 0.392853
G1 X90.283 Y77.339 E.00232
; LINE_WIDTH: 0.357498
G1 X90.388 Y77.248 E.0028
; LINE_WIDTH: 0.325812
G1 X90.479 Y77.167 E.00222
; LINE_WIDTH: 0.299827
G1 X90.565 Y77.081 E.00202
; LINE_WIDTH: 0.264815
G1 X90.695 Y76.935 E.00282
; LINE_WIDTH: 0.218316
G1 X90.813 Y76.776 E.00228
; LINE_WIDTH: 0.178553
G1 X90.88 Y76.674 E.0011
; LINE_WIDTH: 0.139275
G2 X90.966 Y76.517 I-3.747 J-2.145 E.00118
; LINE_WIDTH: 0.0988756
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.517 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z9.88
G1 Z9.48
G1 E.4 F1800
; LINE_WIDTH: 0.0939798
G1 F834
M204 S6000
G2 X88.315 Y72.763 I-.583 J2.21 E.00457
; WIPE_START
G1 F18000
G1 X88.566 Y72.706 E-.09792
G1 X88.884 Y72.676 E-.1211
G1 X89.208 Y72.691 E-.12326
G1 X89.305 Y72.71 E-.03773
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z9.88
G1 Z9.48
G1 E.4 F1800
; LINE_WIDTH: 0.102125
G1 F834
M204 S6000
G1 X86.917 Y76.522 E.00057
; LINE_WIDTH: 0.129441
G1 X86.965 Y76.612 E.0006
; LINE_WIDTH: 0.169146
G2 X87.065 Y76.775 I3.482 J-2.02 E.00161
; LINE_WIDTH: 0.207055
G1 X87.131 Y76.865 E.00121
; LINE_WIDTH: 0.233607
G1 X87.191 Y76.943 E.00123
; LINE_WIDTH: 0.26707
G2 X87.322 Y77.089 I1.588 J-1.297 E.00285
; LINE_WIDTH: 0.306725
G1 X87.453 Y77.212 E.00306
; LINE_WIDTH: 0.344354
G1 X87.586 Y77.324 E.00338
; LINE_WIDTH: 0.381006
G1 X87.696 Y77.408 E.003
; LINE_WIDTH: 0.419257
G1 X87.794 Y77.481 E.00293
; LINE_WIDTH: 0.448101
G2 X88.003 Y77.624 I2.983 J-4.147 E.00657
; WIPE_START
G1 F11782.058
G1 X87.794 Y77.481 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I-1.133 J-.443 P1  F42000
G1 X87.417 Y78.445 Z9.88
G1 Z9.48
G1 E.4 F1800
; LINE_WIDTH: 0.340946
G1 F834
M204 S6000
G1 X86.627 Y78.653 E.01566
; WIPE_START
G1 F15899.697
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.88 I-1.217 J-.031 P1  F42000
G1 X86.667 Y107.441 Z9.88
G1 Z9.48
G1 E.4 F1800
; LINE_WIDTH: 0.409215
G1 F834
M204 S6000
G1 X87.184 Y107.531 E.0123
; LINE_WIDTH: 0.462749
G2 X87.456 Y107.55 I.274 J-1.961 E.0073
G1 X91.03 Y107.55 E.09574
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 9.64
; LAYER_HEIGHT: 0.160001
; WIPE_START
G1 F11379.202
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 60/141
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.88 I1.216 J-.054 P1  F42000
G1 X89.581 Y97.502 Z9.88
G1 Z9.64
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.913 Y96.395 I1.403 J.333 E.04479
G1 X91.019 Y95.988 E.01015
G3 X92.554 Y97.839 I-.355 J1.857 E.06287
G3 X91.956 Y99.437 I-2.176 J.096 E.04226
G2 X92.183 Y100.801 I3.994 J.036 E.03354
G3 X91.391 Y102.925 I-2.13 J.415 E.0575
G3 X89.173 Y102.331 I-.797 J-1.46 E.06111
G3 X89.027 Y99.776 I1.823 J-1.386 E.06548
G2 X89.273 Y98.94 I-.6 J-.631 E.022
G3 X90.521 Y96.009 I1.936 J-.907 E.08667
G1 X90.932 Y95.972 E.00996
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.337 Y96.047 E-.15622
G1 X91.714 Y96.231 E-.15956
G1 X91.841 Y96.342 E-.06422
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.04 I1.166 J-.347 P1  F42000
G1 X88.525 Y85.194 Z10.04
G1 Z9.64
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.794 Y83.948 I1.396 J.153 E.04642
G1 X89.885 Y83.539 E.01013
G3 X90.693 Y83.912 I-.251 J1.604 E.02173
G3 X91.635 Y85.048 I-.923 J1.724 E.03652
G2 X92.198 Y85.63 I3.142 J-2.476 E.01956
G3 X93.634 Y88.303 I-.005 J1.725 E.08943
G3 X91.606 Y90.259 I-1.859 J.101 E.07706
G3 X90.125 Y88.293 I.559 J-1.962 E.06369
G1 X90.159 Y87.737 E.01343
G2 X89.218 Y87.049 I-1.256 J.73 E.02893
G3 X89.82 Y83.525 I.702 J-1.694 E.11913
M106 S124.95
; WIPE_START
G1 X90.217 Y83.61 E-.1544
G1 X90.693 Y83.912 E-.21384
G1 X90.717 Y83.93 E-.01176
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.04 I1.132 J-.448 P1  F42000
G1 X88.411 Y78.098 Z10.04
G1 Z9.64
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F826
M204 S6000
G1 X88.136 Y77.819 E.01017
G1 X88.224 Y77.657 E.0048
G2 X89.731 Y77.627 I.702 J-2.569 E.0397
G1 X89.833 Y77.786 E.00492
G1 X89.555 Y78.098 E.01086
G1 X88.471 Y78.098 E.02817
; WIPE_START
G1 F11728.231
G1 X88.136 Y77.819 E-.16545
G1 X88.224 Y77.657 E-.07011
G1 X88.548 Y77.723 E-.12568
G1 X88.597 Y77.728 E-.01876
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.04 I-.796 J.92 P1  F42000
G1 X89.506 Y78.514 Z10.04
G1 Z9.64
G1 E.4 F1800
G1 F826
M204 S6000
G1 X87.638 Y78.514 E.04856
G1 X87.594 Y78.319 E.00518
G1 X87.901 Y78.173 E.00885
G3 X87.13 Y77.385 I8.869 J-9.44 E.02868
G3 X86.551 Y75.582 I1.909 J-1.609 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.492 J.198 E.05023
G1 X89.741 Y78.514 E.03974
G1 X89.566 Y78.514 E.00454
; WIPE_START
G1 F11728.231
G1 X88.566 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.04 I1.009 J.68 P1  F42000
G1 X89.769 Y76.729 Z10.04
G1 Z9.64
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F826
M204 S5000
G1 X89.724 Y76.752 E.00121
G3 X88.758 Y73.324 I-.788 J-1.628 E.15241
G1 X88.862 Y73.316 E.00253
G3 X90.031 Y76.564 I.074 J1.808 E.11048
G1 X89.819 Y76.697 E.00602
; WIPE_START
G1 F12000
M204 S6000
G1 X89.724 Y76.752 E-.0419
G1 X89.387 Y76.879 E-.13688
G1 X89.03 Y76.933 E-.137
G1 X88.861 Y76.924 E-.06421
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.04 I.879 J-.842 P1  F42000
G1 X86.567 Y74.528 Z10.04
G1 Z9.64
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F826
M204 S6000
G3 X89.016 Y72.437 I2.376 J.303 E.09178
G3 X91.313 Y74.53 I-.085 J2.401 E.08786
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.546 E.15211
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16098
G1 X86.842 Y73.682 E-.18071
G1 X86.896 Y73.597 E-.03831
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.04 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z10.04
G1 Z9.64
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F826
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.007 J-1.302 E.049
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.332 J.094 E.03184
G1 X87.22 Y78.053 E.01043
G3 X86.2 Y76.351 I2.072 J-2.399 E.04868
G3 X86.15 Y75.822 I3.662 J-.614 E.01283
G3 X86.164 Y74.547 I11.313 J-.514 E.03076
G3 X89.027 Y72.036 I2.784 J.287 E.10098
G3 X91.73 Y74.827 I-.089 J2.791 E.10363
G3 X91.718 Y76.087 I-11.857 J.513 E.03039
G3 X91.064 Y77.633 I-2.801 J-.272 E.04112
G1 X90.701 Y78.04 E.01314
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.04 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z9.64
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F826
M204 S6000
G1 X90.022 Y78.5 E.02705
; WIPE_START
G1 F11354.373
G1 X91.022 Y78.5 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.04 I.828 J-.892 P1  F42000
G1 X89.822 Y77.385 Z10.04
G1 Z9.64
G1 E.4 F1800
; LINE_WIDTH: 0.364046
G1 F826
M204 S6000
G1 X90.072 Y77.456 E.00535
; LINE_WIDTH: 0.423131
G1 X90.12 Y77.468 E.0012
G1 X90.202 Y77.403 E.00253
; LINE_WIDTH: 0.392783
G1 X90.283 Y77.339 E.00233
; LINE_WIDTH: 0.357417
G1 X90.388 Y77.248 E.0028
; LINE_WIDTH: 0.325791
G1 X90.479 Y77.167 E.00222
; LINE_WIDTH: 0.289657
G2 X90.631 Y77.011 I-2.925 J-2.995 E.00349
; LINE_WIDTH: 0.241132
G1 X90.752 Y76.863 E.00247
; LINE_WIDTH: 0.195565
G1 X90.861 Y76.704 E.00194
; LINE_WIDTH: 0.16602
G1 X90.879 Y76.674 E.00029
; LINE_WIDTH: 0.139135
G2 X90.966 Y76.517 I-3.481 J-2.006 E.00118
; LINE_WIDTH: 0.0988785
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.517 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.04 I-.427 J-1.14 P1  F42000
G1 X88.005 Y77.625 Z10.04
G1 Z9.64
G1 E.4 F1800
; LINE_WIDTH: 0.448036
G1 F826
M204 S6000
G3 X87.794 Y77.481 I2.811 J-4.353 E.00661
; LINE_WIDTH: 0.419015
G1 X87.697 Y77.408 E.00293
; LINE_WIDTH: 0.380884
G1 X87.586 Y77.324 E.003
; LINE_WIDTH: 0.344807
G1 X87.456 Y77.215 E.00331
; LINE_WIDTH: 0.307142
G1 X87.322 Y77.089 E.00313
; LINE_WIDTH: 0.271559
G3 X87.217 Y76.974 I1.55 J-1.523 E.00231
; LINE_WIDTH: 0.23599
G1 X87.129 Y76.862 E.00179
; LINE_WIDTH: 0.19533
G1 X87.017 Y76.699 E.00199
; LINE_WIDTH: 0.149894
G3 X86.937 Y76.562 I2.608 J-1.616 E.00115
; LINE_WIDTH: 0.106979
G3 X86.86 Y76.401 I2.768 J-1.412 E.00081
; WIPE_START
G1 F18000
G1 X86.937 Y76.562 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.04 I1.144 J.415 P1  F42000
G1 X88.315 Y72.763 Z10.04
G1 Z9.64
G1 E.4 F1800
; LINE_WIDTH: 0.0939938
G1 F826
M204 S6000
G3 X89.526 Y72.751 I.628 J2.198 E.00457
; WIPE_START
G1 F18000
G1 X89.208 Y72.691 E-.12294
G1 X88.884 Y72.676 E-.1231
G1 X88.566 Y72.706 E-.12127
G1 X88.534 Y72.714 E-.01269
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.04 I-1.215 J-.065 P1  F42000
G1 X86.666 Y107.441 Z10.04
G1 Z9.64
G1 E.4 F1800
; LINE_WIDTH: 0.409297
G1 F826
M204 S6000
G1 X87.184 Y107.531 E.01233
; LINE_WIDTH: 0.46275
G2 X87.456 Y107.55 I.274 J-1.958 E.0073
G1 X91.03 Y107.55 E.09574
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.199
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 61/141
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.04 I1.216 J-.04 P1  F42000
G1 X89.688 Y97.177 Z10.04
G1 Z9.8
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.937 Y96.327 I1.272 J.528 E.03855
G1 X91.013 Y95.915 E.01013
G3 X92.547 Y97.752 I-.336 J1.839 E.06264
G3 X91.811 Y99.492 I-2.211 J.091 E.0471
G2 X92.194 Y100.914 I13.976 J-3.006 E.03551
G3 X91.305 Y103.056 I-2.004 J.424 E.05945
G3 X89.139 Y102.332 I-.694 J-1.527 E.06057
G3 X89.365 Y99.463 I1.84 J-1.298 E.07529
G1 X89.344 Y98.909 E.01336
G3 X90.531 Y95.938 I1.862 J-.979 E.08766
G1 X90.956 Y95.904 E.0103
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.341 Y95.975 E-.14856
G1 X91.715 Y96.158 E-.1582
G1 X91.86 Y96.285 E-.07323
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I1.165 J-.351 P1  F42000
G1 X88.503 Y85.135 Z10.2
G1 Z9.8
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.51 Y83.874 I1.556 J.211 E.04085
G1 X89.815 Y83.854 E.00738
G1 X89.901 Y83.443 E.01013
G3 X90.977 Y84.121 I-.136 J1.408 E.03182
G3 X91.596 Y85.065 I-1.343 J1.554 E.02757
G2 X92.15 Y85.595 I1.119 J-.615 E.01878
G3 X93.61 Y88.331 I.057 J1.727 E.09279
G3 X92.019 Y90.347 I-1.941 J.104 E.06765
G3 X90.226 Y88.919 I-.023 J-1.811 E.05986
G3 X90.225 Y87.726 I2.694 J-.6 E.029
G2 X89.795 Y87.162 I-1.348 J.581 E.01728
G3 X89.845 Y83.431 I.125 J-1.864 E.13673
M106 S124.95
; WIPE_START
G1 X90.211 Y83.508 E-.1424
G1 X90.586 Y83.71 E-.1617
G1 X90.724 Y83.855 E-.0759
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I1.13 J-.452 P1  F42000
G1 X88.419 Y78.098 Z10.2
G1 Z9.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P45 R18
G1 F835
M204 S6000
G1 X88.144 Y77.822 E.01014
G1 X88.231 Y77.659 E.00481
G2 X89.731 Y77.627 I.696 J-2.563 E.03952
G1 X89.833 Y77.786 E.00492
G1 X89.555 Y78.098 E.01087
G1 X88.479 Y78.098 E.02797
; WIPE_START
G1 F11728.231
G1 X88.144 Y77.822 E-.16512
G1 X88.231 Y77.659 E-.07029
G1 X88.548 Y77.723 E-.12293
G1 X88.605 Y77.728 E-.02166
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I-.799 J.918 P1  F42000
G1 X89.507 Y78.514 Z10.2
G1 Z9.8
G1 E.4 F1800
G1 F835
M204 S6000
G1 X87.638 Y78.514 E.04857
G1 X87.594 Y78.319 E.00518
G1 X87.906 Y78.172 E.00896
G3 X87.13 Y77.385 I7.912 J-8.568 E.02872
G3 X86.551 Y75.582 I1.909 J-1.609 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.492 J.198 E.05022
G1 X89.741 Y78.514 E.03974
G1 X89.567 Y78.514 E.00453
; WIPE_START
G1 F11728.231
G1 X88.567 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I1.008 J.681 P1  F42000
G1 X89.775 Y76.725 Z10.2
G1 Z9.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F835
M204 S5000
G1 X89.724 Y76.753 E.00139
G3 X88.758 Y73.324 I-.787 J-1.629 E.15238
G1 X88.86 Y73.316 E.00247
G3 X90.031 Y76.565 I.077 J1.807 E.11057
G1 X89.825 Y76.694 E.00585
; WIPE_START
G1 F12000
M204 S6000
G1 X89.724 Y76.753 E-.04463
G1 X89.387 Y76.879 E-.13685
G1 X89.03 Y76.933 E-.13698
G1 X88.868 Y76.924 E-.06153
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I.878 J-.843 P1  F42000
G1 X86.567 Y74.528 Z10.2
G1 Z9.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F835
M204 S6000
G3 X89.011 Y72.437 I2.376 J.303 E.09166
G3 X91.313 Y74.53 I-.081 J2.402 E.08799
G1 X91.082 Y74.583 E.00617
G2 X86.791 Y74.585 I-2.145 J.546 E.15211
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16101
G1 X86.842 Y73.682 E-.18076
G1 X86.898 Y73.599 E-.03824
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z10.2
G1 Z9.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F835
M204 S5000
G1 X93.85 Y78.085 E.07689
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.004 J-1.299 E.04903
G1 X86.152 Y79.309 E.6598
G3 X86.83 Y78.238 I1.332 J.093 E.03185
G1 X87.222 Y78.052 E.01046
G3 X86.153 Y75.957 I1.944 J-2.312 E.05826
G3 X86.164 Y74.547 I36.606 J-.427 E.03401
G3 X89.022 Y72.036 I2.784 J.287 E.10086
G3 X91.73 Y74.827 I-.083 J2.791 E.10376
G3 X91.718 Y76.087 I-12.061 J.511 E.03039
G3 X91.064 Y77.633 I-2.798 J-.271 E.04111
G1 X90.701 Y78.04 E.01315
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z9.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F835
M204 S6000
G1 X90.023 Y78.5 E.02704
; WIPE_START
G1 F11354.373
G1 X91.023 Y78.5 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I.828 J-.892 P1  F42000
G1 X89.823 Y77.385 Z10.2
G1 Z9.8
G1 E.4 F1800
; LINE_WIDTH: 0.362873
G1 F835
M204 S6000
G1 X90.072 Y77.455 E.00531
; LINE_WIDTH: 0.422864
G1 X90.121 Y77.468 E.00122
G1 X90.202 Y77.403 E.00252
; LINE_WIDTH: 0.392828
G1 X90.283 Y77.339 E.00233
; LINE_WIDTH: 0.357469
G1 X90.388 Y77.248 E.0028
; LINE_WIDTH: 0.325804
G1 X90.479 Y77.167 E.00222
; LINE_WIDTH: 0.288097
G1 X90.634 Y77.008 E.00353
; LINE_WIDTH: 0.242309
G2 X90.75 Y76.866 I-2.007 J-1.761 E.00238
; LINE_WIDTH: 0.195419
G1 X90.863 Y76.7 E.00202
; LINE_WIDTH: 0.165515
G1 X90.879 Y76.675 E.00025
; LINE_WIDTH: 0.139207
G2 X90.966 Y76.516 I-3.54 J-2.037 E.00118
; LINE_WIDTH: 0.0988512
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.516 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I1.137 J-.435 P1  F42000
G1 X89.526 Y72.751 Z10.2
G1 Z9.8
G1 E.4 F1800
; LINE_WIDTH: 0.0940009
G1 F835
M204 S6000
G2 X88.315 Y72.763 I-.583 J2.211 E.00457
; WIPE_START
G1 F18000
G1 X88.566 Y72.706 E-.098
G1 X88.885 Y72.676 E-.12153
G1 X89.207 Y72.691 E-.12274
G1 X89.305 Y72.709 E-.03772
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z10.2
G1 Z9.8
G1 E.4 F1800
; LINE_WIDTH: 0.100744
G1 F835
M204 S6000
G1 X86.913 Y76.513 E.00051
; LINE_WIDTH: 0.12814
G1 X86.966 Y76.614 E.00067
; LINE_WIDTH: 0.168799
G2 X87.065 Y76.774 I2.291 J-1.31 E.00159
; LINE_WIDTH: 0.205967
G1 X87.132 Y76.867 E.00123
; LINE_WIDTH: 0.233947
G1 X87.191 Y76.943 E.00121
; LINE_WIDTH: 0.267285
G2 X87.323 Y77.09 I1.605 J-1.313 E.00287
; LINE_WIDTH: 0.309784
G1 X87.465 Y77.223 E.00336
; LINE_WIDTH: 0.346261
G1 X87.586 Y77.324 E.00308
; LINE_WIDTH: 0.380411
G1 X87.697 Y77.408 E.00299
; LINE_WIDTH: 0.417884
G1 X87.794 Y77.481 E.00292
; LINE_WIDTH: 0.447658
G2 X88.012 Y77.628 I3.086 J-4.322 E.00679
; WIPE_START
G1 F11794.679
G1 X87.794 Y77.481 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I-1.133 J-.444 P1  F42000
G1 X87.417 Y78.445 Z10.2
G1 Z9.8
G1 E.4 F1800
; LINE_WIDTH: 0.340907
G1 F835
M204 S6000
G1 X86.623 Y78.655 E.01574
; WIPE_START
G1 F15901.7
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I-1.217 J-.032 P1  F42000
G1 X86.654 Y107.429 Z10.2
G1 Z9.8
G1 E.4 F1800
; LINE_WIDTH: 0.396076
G1 F835
M204 S6000
G1 X87.135 Y107.523 E.01107
; LINE_WIDTH: 0.423502
G1 X87.227 Y107.536 E.00228
; LINE_WIDTH: 0.463132
G2 X87.456 Y107.55 I.234 J-2.06 E.00614
G1 X91.03 Y107.55 E.09583
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 9.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11369.06
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 62/141
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.2 I1.216 J-.052 P1  F42000
G1 X89.596 Y97.428 Z10.2
G1 Z9.96
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.927 Y96.254 I1.435 J.286 E.046
G1 X91.004 Y95.841 E.01013
G3 X92.508 Y98.147 I-.339 J1.864 E.07429
G3 X91.762 Y99.444 I-2.368 J-.498 E.03669
G2 X92.074 Y100.516 I1.816 J.053 E.02736
G3 X91.403 Y103.099 I-1.976 J.865 E.06939
G3 X89.176 Y102.436 I-.778 J-1.46 E.06212
G3 X89.237 Y99.669 I2.026 J-1.34 E.07101
G1 X89.387 Y99.495 E.00555
G1 X89.436 Y98.943 E.01335
G3 X90.542 Y95.867 I1.77 J-1.101 E.09062
G1 X90.947 Y95.831 E.0098
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.345 Y95.904 E-.15372
G1 X91.716 Y96.086 E-.15691
G1 X91.854 Y96.205 E-.06937
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.36 I1.165 J-.351 P1  F42000
G1 X88.498 Y85.08 Z10.36
G1 Z9.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.79 Y83.752 I1.446 J.115 E.04847
G1 X89.871 Y83.34 E.01013
G1 X90.128 Y83.393 E.00632
G3 X91.2 Y84.388 I-.575 J1.695 E.03634
G3 X91.565 Y85.231 I-1.48 J1.141 E.02238
G1 X92.046 Y85.566 E.01415
G3 X93.595 Y88.336 I.186 J1.714 E.09719
G3 X91.609 Y90.399 I-1.82 J.236 E.07921
G3 X90.17 Y88.517 I.531 J-1.898 E.0613
G3 X90.318 Y87.585 I2.248 J-.121 E.02292
G1 X89.913 Y87.12 E.01489
G3 X88.399 Y84.136 I.017 J-1.885 E.09928
G3 X89.814 Y83.328 I1.418 J.841 E.04109
M106 S124.95
; WIPE_START
G1 X90.128 Y83.393 E-.12161
G1 X90.578 Y83.606 E-.18922
G1 X90.71 Y83.731 E-.06917
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.36 I1.127 J-.459 P1  F42000
G1 X88.415 Y78.098 Z10.36
G1 Z9.96
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F831
M204 S6000
G1 X88.14 Y77.821 E.01015
G1 X88.228 Y77.658 E.0048
G2 X89.733 Y77.629 I.702 J-2.648 E.03963
G1 X89.832 Y77.788 E.00486
G1 X89.555 Y78.098 E.01081
G1 X88.475 Y78.098 E.02806
; WIPE_START
G1 F11728.231
G1 X88.14 Y77.821 E-.16527
G1 X88.228 Y77.658 E-.07021
G1 X88.548 Y77.723 E-.1241
G1 X88.602 Y77.728 E-.02042
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.36 I-.798 J.919 P1  F42000
G1 X89.507 Y78.514 Z10.36
G1 Z9.96
G1 E.4 F1800
G1 F831
M204 S6000
G1 X87.638 Y78.514 E.04858
G1 X87.594 Y78.319 E.00518
G1 X87.904 Y78.172 E.00891
G3 X87.13 Y77.385 I8.306 J-8.927 E.0287
G3 X86.551 Y75.582 I1.909 J-1.609 E.05048
G1 X86.766 Y75.552 E.00565
G2 X91.108 Y75.552 I2.171 J-.443 E.15775
G1 X91.329 Y75.577 E.00579
G3 X90.759 Y77.373 I-2.492 J.198 E.05022
G1 X89.741 Y78.514 E.03974
G1 X89.567 Y78.514 E.00453
; WIPE_START
G1 F11728.231
G1 X88.567 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.36 I1.006 J.685 P1  F42000
G1 X89.795 Y76.71 Z10.36
G1 Z9.96
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F831
M204 S5000
G1 X89.642 Y76.79 E.00416
G3 X88.757 Y73.324 I-.704 J-1.666 E.15013
G1 X88.857 Y73.316 E.0024
G3 X89.958 Y76.618 I.081 J1.807 E.11289
G1 X89.847 Y76.681 E.00307
; WIPE_START
G1 F12000
M204 S6000
G1 X89.642 Y76.79 E-.08827
G1 X89.384 Y76.879 E-.1038
G1 X89.03 Y76.933 E-.13599
G1 X88.894 Y76.926 E-.05194
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.36 I.873 J-.847 P1  F42000
G1 X86.567 Y74.528 Z10.36
G1 Z9.96
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F831
M204 S6000
G3 X89.006 Y72.436 I2.376 J.303 E.09154
G3 X91.313 Y74.529 I-.076 J2.401 E.08806
G1 X91.082 Y74.581 E.00616
G2 X86.791 Y74.585 I-2.145 J.548 E.15205
G1 X86.625 Y74.543 E.00445
; WIPE_START
G1 F11728.231
G1 X86.657 Y74.12 E-.16108
G1 X86.842 Y73.682 E-.1807
G1 X86.896 Y73.597 E-.03822
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.36 I-.932 J.782 P1  F42000
G1 X90.661 Y78.085 Z10.36
G1 Z9.96
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F831
M204 S5000
G1 X93.85 Y78.085 E.07689
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
M73 P46 R18
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.007 J-1.302 E.049
G1 X86.152 Y79.31 E.65977
G3 X86.83 Y78.238 I1.299 J.071 E.03195
G1 X87.221 Y78.053 E.01045
G3 X86.2 Y76.351 I1.991 J-2.352 E.04873
G3 X86.15 Y75.822 I3.667 J-.614 E.01283
G3 X86.164 Y74.547 I11.317 J-.514 E.03076
G3 X89.017 Y72.036 I2.784 J.287 E.10074
G3 X91.73 Y74.827 I-.079 J2.791 E.10387
G3 X91.718 Y76.086 I-11.977 J.512 E.03038
G3 X91.064 Y77.633 I-2.796 J-.27 E.04112
G1 X90.701 Y78.04 E.01315
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.36 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z9.96
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F831
M204 S6000
G1 X90.023 Y78.5 E.02704
M204 S10000
G1 X89.959 Y77.598 F42000
; LINE_WIDTH: 0.408246
G1 F831
M204 S6000
G2 X90.289 Y77.332 I-5.135 J-6.722 E.00991
; LINE_WIDTH: 0.357526
G1 X90.382 Y77.254 E.00246
; LINE_WIDTH: 0.324157
G1 X90.495 Y77.15 E.00277
; LINE_WIDTH: 0.285049
G1 X90.633 Y77.008 E.00311
; LINE_WIDTH: 0.241985
G2 X90.737 Y76.884 I-2.573 J-2.253 E.0021
G1 X90.755 Y76.859 E.00041
; LINE_WIDTH: 0.193877
G1 X90.865 Y76.697 E.00194
; LINE_WIDTH: 0.16512
G1 X90.879 Y76.675 E.00022
; LINE_WIDTH: 0.139272
G2 X90.966 Y76.517 I-3.592 J-2.064 E.00118
; LINE_WIDTH: 0.0988789
G1 X91.018 Y76.407 E.00049
; WIPE_START
G1 F18000
G1 X90.966 Y76.517 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.36 I1.137 J-.434 P1  F42000
G1 X89.526 Y72.751 Z10.36
G1 Z9.96
G1 E.4 F1800
; LINE_WIDTH: 0.0939757
G1 F831
M204 S6000
G2 X88.315 Y72.763 I-.584 J2.212 E.00457
; WIPE_START
G1 F18000
G1 X88.567 Y72.706 E-.09814
G1 X88.886 Y72.676 E-.12174
G1 X89.201 Y72.691 E-.12002
G1 X89.305 Y72.71 E-.04011
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.36 I-1.015 J-.672 P1  F42000
G1 X86.86 Y76.401 Z10.36
G1 Z9.96
G1 E.4 F1800
; LINE_WIDTH: 0.101303
G1 F831
M204 S6000
G1 X86.914 Y76.517 E.00054
; LINE_WIDTH: 0.128655
G1 X86.966 Y76.613 E.00064
; LINE_WIDTH: 0.169278
G2 X87.065 Y76.775 I3.465 J-2.01 E.0016
; LINE_WIDTH: 0.20706
G1 X87.131 Y76.865 E.00121
; LINE_WIDTH: 0.233652
G1 X87.191 Y76.943 E.00123
; LINE_WIDTH: 0.267129
G2 X87.322 Y77.089 I1.586 J-1.296 E.00285
; LINE_WIDTH: 0.308002
G1 X87.462 Y77.22 E.00328
; LINE_WIDTH: 0.345691
G1 X87.586 Y77.324 E.00315
; LINE_WIDTH: 0.380558
G1 X87.697 Y77.408 E.003
; LINE_WIDTH: 0.418319
G1 X87.794 Y77.481 E.00293
; LINE_WIDTH: 0.447782
G2 X88.009 Y77.627 I2.994 J-4.179 E.00671
; WIPE_START
G1 F11791.152
G1 X87.794 Y77.481 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.36 I-1.133 J-.443 P1  F42000
G1 X87.417 Y78.445 Z10.36
G1 Z9.96
G1 E.4 F1800
; LINE_WIDTH: 0.342094
G1 F831
M204 S6000
G1 X86.627 Y78.653 E.01572
; WIPE_START
G1 F15840.388
G1 X87.417 Y78.445 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.36 I-1.217 J-.031 P1  F42000
G1 X86.666 Y107.441 Z10.36
G1 Z9.96
G1 E.4 F1800
; LINE_WIDTH: 0.409741
G1 F831
M204 S6000
G1 X87.184 Y107.531 E.01234
; LINE_WIDTH: 0.46275
G2 X87.456 Y107.55 I.274 J-1.965 E.0073
G1 X91.03 Y107.55 E.09574
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 10.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.178
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 63/141
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.36 I1.216 J-.04 P1  F42000
G1 X89.688 Y97.11 Z10.36
G1 Z10.12
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.935 Y96.184 I1.28 J.421 E.03991
G1 X91.016 Y95.772 E.01013
G3 X92.502 Y98.055 I-.34 J1.846 E.07349
G3 X91.822 Y99.277 I-2.282 J-.469 E.03424
G1 X91.743 Y99.462 E.00484
G1 X91.737 Y99.994 E.01284
G3 X91.754 Y102.899 I-1.935 J1.464 E.07509
G3 X89.212 Y102.536 I-1.134 J-1.142 E.0717
G3 X88.897 Y100.492 I2.38 J-1.413 E.05112
G3 X89.33 Y99.578 I.9 J-.133 E.02587
G1 X89.45 Y99.337 E.00648
G1 X89.434 Y98.812 E.01267
G3 X90.553 Y95.797 I1.769 J-1.059 E.08896
G1 X90.955 Y95.761 E.00972
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.349 Y95.834 E-.15253
G1 X91.717 Y96.014 E-.1556
G1 X91.86 Y96.138 E-.07187
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I1.165 J-.353 P1  F42000
G1 X88.491 Y85.027 Z10.52
G1 Z10.12
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.517 Y83.684 I1.562 J.131 E.04303
G1 X89.791 Y83.659 E.00664
G1 X89.87 Y83.247 E.01013
G3 X91.164 Y84.225 I-.241 J1.663 E.0408
G1 X91.474 Y85.003 E.02022
G1 X91.502 Y85.202 E.00484
G1 X91.987 Y85.532 E.01415
G3 X93.578 Y88.338 I.253 J1.71 E.10024
G3 X92.011 Y90.483 I-1.917 J.244 E.0706
G3 X90.187 Y88.627 I-.013 J-1.812 E.07
G3 X90.395 Y87.499 I2.691 J-.086 E.0279
G1 X89.943 Y87.074 E.01496
G3 X88.189 Y84.486 I-.076 J-1.837 E.09011
G3 X89.814 Y83.236 I1.678 J.499 E.05281
M106 S124.95
; WIPE_START
G1 X90.203 Y83.314 E-.15095
G1 X90.571 Y83.506 E-.15766
G1 X90.708 Y83.634 E-.0714
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I1.206 J-.161 P1  F42000
G1 X89.785 Y76.719 Z10.52
G1 Z10.12
G1 E.4 F1800
; FEATURE: Outer wall
G1 F935
M204 S5000
G1 X89.725 Y76.754 E.00168
G3 X88.85 Y73.317 I-.784 J-1.63 E.15445
G1 X89.03 Y73.317 E.00435
G3 X90.032 Y76.566 I-.09 J1.807 E.10662
G1 X89.836 Y76.688 E.00556
; WIPE_START
G1 F12000
M204 S6000
G1 X89.725 Y76.754 E-.04919
G1 X89.387 Y76.879 E-.13694
G1 X89.03 Y76.933 E-.13697
G1 X88.881 Y76.925 E-.05689
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I-.664 J1.02 P1  F42000
G1 X90.661 Y78.085 Z10.52
G1 Z10.12
G1 E.4 F1800
G1 F935
M204 S5000
G1 X93.85 Y78.085 E.0769
G1 X93.85 Y78.465 E.00916
G1 X91.23 Y78.465 E.06318
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.15 Y106.669 I.004 J-1.299 E.04903
G1 X86.152 Y79.31 E.65977
G3 X86.83 Y78.238 I1.312 J.079 E.03192
G1 X87.222 Y78.052 E.01046
G3 X86.163 Y76.089 I1.957 J-2.323 E.05509
G3 X86.181 Y74.409 I12.124 J-.706 E.04054
G3 X89.012 Y72.036 I2.761 J.418 E.09734
G3 X91.73 Y74.827 I-.074 J2.791 E.10399
G3 X91.718 Y76.087 I-11.855 J.513 E.03039
G3 X91.064 Y77.633 I-2.793 J-.269 E.04111
G1 X90.701 Y78.04 E.01315
; WIPE_START
G1 F12000
M204 S6000
G1 X91.701 Y78.054 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.459 Y74.278
G1 Z10.12
G1 E.4 F1800
; FEATURE: Top surface
G1 F935
M204 S2000
G1 X89.486 Y72.306 E.06727
; WIPE_START
G1 F12000
M204 S6000
G1 X90.193 Y73.013 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I-1.201 J-.196 P1  F42000
G1 X90.117 Y73.482 Z10.52
G1 Z10.12
G1 E.4 F1800
G1 F935
M204 S2000
G1 X88.882 Y72.248 E.04209
G1 X88.395 Y72.306
G1 X89.211 Y73.121 E.02782
G1 X88.666 Y73.122
G1 X87.978 Y72.434 E.02347
G1 X87.614 Y72.615
G1 X88.23 Y73.232 E.02103
G1 X87.865 Y73.412
G1 X87.294 Y72.841 E.01947
G1 X87.017 Y73.109
G1 X87.557 Y73.649 E.01842
G1 X87.302 Y73.939
G1 X86.781 Y73.418 E.01777
G1 X86.588 Y73.771
G1 X87.102 Y74.285 E.01754
G1 X86.966 Y74.695
G1 X86.446 Y74.174 E.01774
G1 X86.369 Y74.643
G1 X86.919 Y75.193 E.01876
G1 X87.07 Y75.889
G1 X86.362 Y75.181 E.02414
; WIPE_START
G1 F12000
M204 S6000
G1 X87.069 Y75.888 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I.586 J1.066 P1  F42000
G1 X90.589 Y73.954 Z10.52
G1 Z10.12
G1 E.4 F1800
G1 F935
M204 S2000
G1 X91.518 Y74.883 E.03169
G1 X91.518 Y75.429
G1 X90.944 Y74.854 E.01959
G1 X90.942 Y75.398
G1 X91.513 Y75.969 E.01949
G1 X91.442 Y76.443
G1 X90.833 Y75.834 E.02078
G1 X90.652 Y76.199
G1 X91.304 Y76.851 E.02223
G1 X91.115 Y77.207
G1 X90.414 Y76.506 E.02391
G1 X90.124 Y76.762
G1 X90.882 Y77.519 E.02583
G1 X90.624 Y77.807
G1 X89.78 Y76.963 E.0288
G1 X89.37 Y77.099
G1 X90.367 Y78.096 E.034
G1 X90.568 Y78.297
G1 X90.974 Y78.702 E.01384
G1 X90.429 Y78.702
G1 X88.871 Y77.145 E.05313
G1 X88.175 Y76.994
G1 X89.883 Y78.702 E.05825
G1 X89.338 Y78.702
G1 X86.362 Y75.727 E.10148
G1 X86.411 Y76.321
G1 X88.792 Y78.702 E.08123
G1 X88.247 Y78.702
G1 X86.79 Y77.245 E.04969
G1 X87.265 Y78.266
G1 X87.702 Y78.702 E.01487
; WIPE_START
G1 F12000
M204 S6000
G1 X87.265 Y78.266 E-.23438
G1 X87.104 Y77.919 E-.14562
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I.761 J.949 P1  F42000
G1 X91.013 Y74.784 Z10.52
G1 Z10.12
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.147805
G1 F935
M204 S6000
G1 X90.873 Y74.53 E.00206
M204 S10000
G1 X90.651 Y73.892 F42000
; LINE_WIDTH: 0.224343
G1 F935
M204 S6000
G1 X90.18 Y73.418 E.00794
M204 S10000
G1 X89.533 Y73.193 F42000
; LINE_WIDTH: 0.118592
G1 F935
M204 S6000
G1 X89.282 Y73.05 E.00152
; WIPE_START
G1 F18000
G1 X89.533 Y73.193 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I-.417 J1.143 P1  F42000
G1 X91.325 Y73.846 Z10.52
G1 Z10.12
G1 E.4 F1800
; LINE_WIDTH: 0.103968
G1 F935
M204 S6000
G1 X91.237 Y73.718 E.00068
; LINE_WIDTH: 0.148166
G1 X91.162 Y73.615 E.00091
; LINE_WIDTH: 0.18463
G1 X91.085 Y73.514 E.0012
; LINE_WIDTH: 0.226162
G2 X90.925 Y73.321 I-3.928 J3.093 E.003
; LINE_WIDTH: 0.261338
G2 X90.396 Y72.799 I-4.177 J3.701 E.01055
; LINE_WIDTH: 0.226942
G1 X90.3 Y72.719 E.00151
; LINE_WIDTH: 0.20033
G1 X90.201 Y72.641 E.00131
; LINE_WIDTH: 0.167225
G1 X90.099 Y72.565 E.00106
; LINE_WIDTH: 0.127408
G1 X89.994 Y72.49 E.00075
; LINE_WIDTH: 0.0932104
G1 X89.92 Y72.44 E.00033
; WIPE_START
G1 F18000
G1 X89.994 Y72.49 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I-.722 J-.98 P1  F42000
G1 X86.962 Y74.722 Z10.52
G1 Z10.12
G1 E.4 F1800
; LINE_WIDTH: 0.0958847
G1 F935
M204 S6000
G2 X86.879 Y74.88 I2.91 J1.64 E.00069
; WIPE_START
G1 F18000
G1 X86.962 Y74.722 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I-1.092 J.537 P1  F42000
G1 X88.111 Y77.058 Z10.52
G1 Z10.12
G1 E.4 F1800
; LINE_WIDTH: 0.205616
G1 F935
M204 S6000
G1 X88.03 Y77.003 E.00105
; LINE_WIDTH: 0.188146
G1 X87.95 Y76.943 E.00097
; LINE_WIDTH: 0.158543
G1 X87.864 Y76.879 E.00083
; LINE_WIDTH: 0.124566
G1 X87.707 Y76.749 E.00115
; LINE_WIDTH: 0.0962301
G1 X87.28 Y76.315 E.00236
; LINE_WIDTH: 0.135812
G1 X87.15 Y76.155 E.00131
; LINE_WIDTH: 0.182728
G1 X87.005 Y75.955 E.0023
; WIPE_START
G1 F18000
G1 X87.15 Y76.155 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I-1.169 J-.339 P1  F42000
G1 X86.851 Y77.184 Z10.52
G1 Z10.12
G1 E.4 F1800
; LINE_WIDTH: 0.2072
G1 F935
M204 S6000
G3 X86.693 Y76.978 I4.238 J-3.415 E.00281
; LINE_WIDTH: 0.157491
G1 X86.623 Y76.878 E.00094
; LINE_WIDTH: 0.113766
G1 X86.554 Y76.776 E.00061
; LINE_WIDTH: 0.0855105
G1 X86.529 Y76.738 E.00015
; WIPE_START
G1 F18000
G1 X86.554 Y76.776 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.52 I-1.217 J.005 P1  F42000
G1 X86.682 Y107.455 Z10.52
G1 Z10.12
G1 E.4 F1800
; LINE_WIDTH: 0.423467
G1 F935
M204 S6000
G1 X87.228 Y107.536 E.01343
; LINE_WIDTH: 0.463134
G2 X87.456 Y107.55 I.234 J-2.068 E.00613
G1 X91.03 Y107.55 E.09583
; CHANGE_LAYER
; Z_HEIGHT: 10.28
; LAYER_HEIGHT: 0.16
; WIPE_START
M73 P46 R17
G1 F11368.994
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 64/141
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.52 I1.216 J-.039 P1  F42000
G1 X89.693 Y97.09 Z10.52
G1 Z10.28
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.942 Y96.115 I1.294 J.371 E.04085
G1 X91.019 Y95.702 E.01013
G1 X91.066 Y95.711 E.00115
G3 X92.493 Y97.978 I-.379 J1.822 E.07212
G3 X91.546 Y99.355 I-1.966 J-.338 E.0416
G1 X91.621 Y99.955 E.01458
G3 X91.765 Y102.979 I-1.778 J1.6 E.07904
G3 X89.245 Y102.631 I-1.133 J-1.098 E.07136
M73 P47 R17
G3 X88.906 Y100.707 I2.742 J-1.475 E.04793
G3 X89.305 Y99.509 I.751 J-.415 E.03421
G1 X89.453 Y99.283 E.0065
G1 X89.469 Y98.745 E.013
G3 X90.564 Y95.727 I1.74 J-1.076 E.08898
G1 X90.962 Y95.692 E.00965
; WIPE_START
G1 X91.066 Y95.711 E-.04005
G1 X91.354 Y95.765 E-.11128
G1 X91.718 Y95.943 E-.1543
G1 X91.866 Y96.071 E-.07437
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.68 I1.164 J-.354 P1  F42000
G1 X88.496 Y84.978 Z10.68
G1 Z10.28
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.793 Y83.57 I1.453 J.036 E.0504
G1 X89.871 Y83.157 E.01013
G1 X89.999 Y83.182 E.00316
G3 X91.369 Y84.871 I-.517 J1.82 E.05588
G3 X91.45 Y85.249 I-.708 J.35 E.00941
G1 X91.985 Y85.496 E.0142
G3 X93.946 Y86.89 I.378 J1.544 E.06582
G3 X93.558 Y88.337 I-2.198 J.186 E.03685
G3 X92.004 Y90.55 I-1.915 J.307 E.07215
G3 X90.224 Y88.981 I-.037 J-1.752 E.06284
G3 X90.45 Y87.596 I2.315 J-.333 E.03435
G2 X90.001 Y87.035 I-1.156 J.464 E.0176
G3 X88.079 Y84.876 I-.162 J-1.791 E.08096
G3 X89.422 Y83.182 I1.979 J.189 E.05514
G1 X89.814 Y83.146 E.00949
; WIPE_START
G1 X89.999 Y83.182 E-.07178
G1 X90.201 Y83.222 E-.07804
G1 X90.565 Y83.41 E-.15583
G1 X90.709 Y83.542 E-.07435
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.68 I1.211 J.124 P1  F42000
G1 X91.23 Y78.465 Z10.68
G1 Z10.28
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.001 J-1.295 E.04736
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.295 J-.001 E.04735
G1 X93.85 Y78.085 E.15618
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.68 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z10.28
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.462069
G1 F600
M204 S6000
G1 X87.265 Y78.509 E.10069
; LINE_WIDTH: 0.42723
G1 X86.687 Y78.589 E.01432
; WIPE_START
G1 F12407.922
G1 X87.265 Y78.509 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.68 I-1.217 J-.025 P1  F42000
G1 X86.668 Y107.441 Z10.68
G1 Z10.28
G1 E.4 F1800
; LINE_WIDTH: 0.40973
G1 F600
M204 S6000
G1 X87.184 Y107.531 E.0123
; LINE_WIDTH: 0.462742
G2 X87.456 Y107.55 I.274 J-1.969 E.0073
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 10.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.408
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 65/141
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.68 I1.216 J-.038 P1  F42000
G1 X89.7 Y97.064 Z10.68
G1 Z10.44
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.95 Y96.047 I1.292 J.312 E.04174
G1 X91.026 Y95.634 E.01013
G1 X91.119 Y95.652 E.00228
G3 X92.487 Y97.893 I-.424 J1.797 E.07045
G3 X91.602 Y99.218 I-1.941 J-.339 E.03952
G1 X91.51 Y99.396 E.00483
G1 X91.521 Y99.938 E.01307
G3 X91.776 Y103.057 I-1.659 J1.705 E.08237
G3 X89.277 Y102.723 I-1.126 J-1.09 E.07062
G3 X88.942 Y100.849 I2.285 J-1.376 E.04694
G3 X89.142 Y99.503 I.603 J-.598 E.03804
G1 X89.382 Y99.43 E.00606
G2 X89.357 Y98.421 I-1.054 J-.478 E.02519
G3 X90.574 Y95.659 I1.879 J-.821 E.0818
G1 X90.969 Y95.624 E.00957
; WIPE_START
G1 X91.119 Y95.652 E-.05785
G1 X91.358 Y95.696 E-.09231
G1 X91.72 Y95.872 E-.15301
G1 X91.873 Y96.005 E-.07683
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.84 I1.164 J-.355 P1  F42000
G1 X88.503 Y84.955 Z10.84
G1 Z10.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.795 Y83.483 I1.444 J-.036 E.0519
G1 X89.872 Y83.07 E.01013
G1 X89.936 Y83.082 E.00157
G3 X91.315 Y84.479 I-.352 J1.728 E.0502
G3 X91.383 Y85.255 I-1.937 J.56 E.01891
G1 X91.967 Y85.465 E.01496
G3 X93.981 Y86.472 I.41 J1.699 E.05901
G3 X93.536 Y88.331 I-2.464 J.393 E.0473
G3 X91.994 Y90.616 I-1.914 J.371 E.07383
G3 X90.235 Y89.079 I-.06 J-1.706 E.06204
G3 X90.585 Y87.487 I2.705 J-.239 E.03994
G1 X90.563 Y87.245 E.00585
G1 X90.04 Y86.958 E.0144
G3 X88.069 Y85.304 I-.289 J-1.657 E.07065
G3 X89.426 Y83.096 I2.094 J-.234 E.06731
G1 X89.815 Y83.059 E.00943
; WIPE_START
G1 X89.936 Y83.082 E-.04667
G1 X90.2 Y83.133 E-.10202
G1 X90.561 Y83.317 E-.15418
G1 X90.711 Y83.454 E-.07713
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.84 I1.21 J.126 P1  F42000
G1 X91.23 Y78.465 Z10.84
G1 Z10.44
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.738 I-.004 J-1.291 E.04744
G1 X86.15 Y79.38 E.65976
G3 X87.374 Y78.086 I1.291 J-.004 E.04739
G1 X93.85 Y78.085 E.15618
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
M73 P48 R17
G3 Z10.84 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z10.44
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46207
G1 F600
M204 S6000
G1 X87.389 Y78.5 E.09737
G2 X87.265 Y78.509 I.047 J1.665 E.00333
; LINE_WIDTH: 0.427253
G1 X86.687 Y78.589 E.01433
; WIPE_START
G1 F12407.197
G1 X87.265 Y78.509 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.84 I-1.217 J-.025 P1  F42000
G1 X86.666 Y107.441 Z10.84
G1 Z10.44
G1 E.4 F1800
; LINE_WIDTH: 0.409765
G1 F600
M204 S6000
G1 X87.184 Y107.531 E.01234
; LINE_WIDTH: 0.462752
G2 X87.456 Y107.55 I.274 J-1.971 E.0073
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.160001
; WIPE_START
G1 F11379.126
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 66/141
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.84 I1.216 J-.038 P1  F42000
G1 X89.699 Y97.066 Z10.84
G1 Z10.6
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.957 Y95.98 I1.3 J.234 E.04336
G1 X91.034 Y95.567 E.01013
G1 X91.177 Y95.594 E.00351
G3 X92.481 Y97.803 I-.476 J1.77 E.06852
G3 X91.375 Y99.266 I-1.99 J-.354 E.0459
G1 X91.329 Y99.591 E.00791
G2 X91.877 Y100.506 I1.673 J-.38 E.02615
G3 X91.475 Y103.398 I-1.753 J1.23 E.07747
G3 X89.308 Y102.811 I-.785 J-1.393 E.06
G3 X89.009 Y100.755 I2.466 J-1.409 E.0513
G1 X88.766 Y100.806 E.00597
G3 X88.602 Y100.07 I9.826 J-2.585 E.0182
G3 X89.438 Y99.339 I.881 J.165 E.02888
G2 X89.403 Y98.376 I-1.173 J-.439 E.02385
G3 X90.584 Y95.591 I1.831 J-.866 E.08238
G1 X90.977 Y95.557 E.0095
; WIPE_START
G1 X91.177 Y95.594 E-.07727
G1 X91.721 Y95.803 E-.22173
G1 X91.883 Y95.943 E-.081
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11 I1.164 J-.354 P1  F42000
G1 X88.516 Y84.878 Z11
G1 Z10.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.799 Y83.399 I1.431 J-.055 E.05198
G1 X89.875 Y82.986 E.01013
G3 X91.303 Y84.362 I-.274 J1.714 E.0509
G3 X91.363 Y85.216 I-2.083 J.575 E.02079
G1 X91.947 Y85.438 E.01507
G3 X93.907 Y86.094 I.442 J1.937 E.05242
G3 X93.828 Y87.752 I-1.284 J.77 E.04243
G3 X93.508 Y88.319 I-1.342 J-.383 E.01584
G3 X91.982 Y90.682 I-1.908 J.442 E.07567
G1 X91.783 Y90.677 E.00482
G3 X90.242 Y89.172 I.143 J-1.688 E.05627
G3 X90.637 Y87.518 I2.728 J-.223 E.04171
G1 X90.602 Y87.232 E.00695
G1 X90.109 Y86.899 E.01434
G3 X88.083 Y85.184 I-.349 J-1.642 E.07381
G3 X89.431 Y83.012 I2.061 J-.226 E.06642
G1 X89.818 Y82.976 E.00938
; WIPE_START
G1 X90.199 Y83.048 E-.14756
G1 X90.558 Y83.228 E-.15259
G1 X90.714 Y83.369 E-.07985
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11 I1.21 J.127 P1  F42000
G1 X91.23 Y78.465 Z11
G1 Z10.6
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.295 J-.001 E.04735
G1 X93.85 Y78.085 E.15618
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z10.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.462071
G1 F600
M204 S6000
G1 X87.265 Y78.509 E.10068
; LINE_WIDTH: 0.427302
G1 X86.687 Y78.588 E.01434
; WIPE_START
G1 F12405.662
G1 X87.265 Y78.509 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11 I-1.217 J-.025 P1  F42000
G1 X86.666 Y107.441 Z11
G1 Z10.6
G1 E.4 F1800
; LINE_WIDTH: 0.409738
G1 F600
M204 S6000
G1 X87.184 Y107.531 E.01234
; LINE_WIDTH: 0.462743
G2 X87.456 Y107.55 I.275 J-1.977 E.0073
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 10.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.382
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 67/141
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11 I1.216 J-.038 P1  F42000
G1 X89.7 Y97.061 Z11
G1 Z10.76
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.964 Y95.914 I1.307 J.17 E.04477
G1 X91.041 Y95.501 E.01013
G1 X91.239 Y95.538 E.00486
G3 X92.475 Y97.714 I-.537 J1.744 E.06648
G3 X90.954 Y99.271 I-1.886 J-.321 E.05584
G1 X91.18 Y99.925 E.01669
G3 X91.793 Y103.211 I-1.19 J1.922 E.09071
G3 X89.338 Y102.897 I-1.11 J-1.075 E.06922
G3 X88.962 Y101.261 I2.809 J-1.507 E.04096
G1 X88.798 Y100.776 E.01236
G3 X89.445 Y99.325 I.542 J-.628 E.05115
G2 X89.616 Y98.621 I-1.98 J-.853 E.01754
G3 X90.595 Y95.525 I1.629 J-1.188 E.09106
G1 X90.984 Y95.491 E.00943
; WIPE_START
G1 X91.239 Y95.538 E-.0985
G1 X91.723 Y95.735 E-.19858
G1 X91.888 Y95.878 E-.08292
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.16 I1.168 J-.342 P1  F42000
G1 X88.561 Y84.52 Z11.16
G1 Z10.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.816 Y83.321 I1.308 J.112 E.04575
G1 X89.893 Y82.908 E.01013
G3 X91.292 Y84.25 I-.274 J1.685 E.0497
G3 X91.34 Y85.271 I-2.487 J.628 E.02482
G2 X92.413 Y85.363 I.662 J-1.424 E.02651
G3 X94.227 Y86.795 I.193 J1.621 E.06194
G3 X93.641 Y88.049 I-1.643 J-.004 E.03443
G2 X93.528 Y88.896 I1.078 J.576 E.02105
G3 X91.576 Y90.737 I-1.826 J.019 E.07267
G3 X90.319 Y88.28 I.491 J-1.802 E.07489
G2 X90.662 Y87.231 I-2.405 J-1.368 E.02678
G1 X90.11 Y86.85 E.01618
G3 X88.643 Y86.649 I-.286 J-3.366 E.036
G3 X88.328 Y85.968 I.607 J-.695 E.01863
G3 X89.066 Y83.075 I2.032 J-1.022 E.07854
G3 X89.836 Y82.898 I.69 J1.233 E.01933
; WIPE_START
G1 X90.2 Y82.965 E-.14067
G1 X90.556 Y83.143 E-.15098
G1 X90.73 Y83.297 E-.08835
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.16 I1.21 J.125 P1  F42000
G1 X91.23 Y78.465 Z11.16
G1 Z10.76
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.001 J-1.295 E.04736
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.291 J-.004 E.04739
G1 X93.85 Y78.085 E.15617
M73 P49 R17
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.16 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z10.76
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461868
G1 F600
M204 S6000
G1 X87.389 Y78.5 E.09732
G2 X87.228 Y78.513 I.135 J2.86 E.00433
; LINE_WIDTH: 0.423624
G1 X86.681 Y78.594 E.01346
; WIPE_START
G1 F12522.877
G1 X87.228 Y78.513 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.16 I-1.217 J-.024 P1  F42000
G1 X86.657 Y107.43 Z11.16
G1 Z10.76
G1 E.4 F1800
; LINE_WIDTH: 0.396248
G1 F600
M204 S6000
G1 X87.153 Y107.526 E.01144
; LINE_WIDTH: 0.462428
G2 X87.456 Y107.55 I.323 J-2.167 E.00812
G1 X91.03 Y107.55 E.09567
; CHANGE_LAYER
; Z_HEIGHT: 10.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11387.74
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 68/141
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11.16 I1.216 J-.037 P1  F42000
G1 X89.706 Y97.039 Z11.16
G1 Z10.92
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.971 Y95.85 I1.308 J.124 E.04574
G1 X91.048 Y95.437 E.01013
G1 X91.305 Y95.485 E.0063
G3 X92.093 Y98.486 I-.703 J1.788 E.08708
G3 X90.5 Y99.147 I-1.353 J-1.012 E.04363
G1 X90.825 Y99.915 E.0201
G3 X91.496 Y103.545 I-.661 J1.999 E.10854
G3 X89.151 Y102.559 I-.775 J-1.439 E.07029
G3 X89.058 Y101.281 I2.362 J-.814 E.03123
G2 X88.529 Y100.509 I-3.649 J1.934 E.02263
G3 X89.507 Y99.287 I.767 J-.388 E.04742
G1 X89.65 Y98.953 E.00875
G2 X89.351 Y97.953 I-1.768 J-.017 E.02556
G3 X90.605 Y95.459 I1.86 J-.626 E.07487
G1 X90.991 Y95.427 E.00935
; WIPE_START
G1 X91.305 Y95.485 E-.12133
G1 X91.724 Y95.669 E-.174
G1 X91.893 Y95.814 E-.08467
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.32 I1.165 J-.352 P1  F42000
G1 X88.544 Y84.724 Z11.32
G1 Z10.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.808 Y83.241 I1.401 J-.086 E.05193
G1 X89.883 Y82.828 E.01013
G1 X90.147 Y82.876 E.00648
G3 X91.356 Y84.648 I-.65 J1.742 E.05512
G1 X91.328 Y85.127 E.01157
G1 X91.914 Y85.42 E.0158
G3 X93.826 Y85.743 I.609 J2.214 E.04829
G3 X93.559 Y88.16 I-1.071 J1.105 E.0676
G2 X93.439 Y89.429 I73.186 J7.579 E.03074
G3 X91.192 Y90.688 I-1.658 J-.325 E.07063
G3 X90.518 Y87.93 I1.012 J-1.708 E.07627
G1 X90.592 Y87.83 E.00301
G2 X90.677 Y87.031 I-1.395 J-.552 E.01962
G1 X90.131 Y86.765 E.01464
G2 X89.143 Y86.865 I.421 J9.115 E.02395
G3 X88.31 Y85.756 I-.081 J-.807 E.04012
G3 X89.075 Y82.996 I2.025 J-.925 E.07504
G3 X89.826 Y82.817 I.697 J1.262 E.01885
; WIPE_START
G1 X90.147 Y82.876 E-.12408
G1 X90.555 Y83.06 E-.17006
G1 X90.724 Y83.21 E-.08586
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.32 I1.21 J.129 P1  F42000
G1 X91.23 Y78.465 Z11.32
G1 Z10.92
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.003 J-1.293 E.04738
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.294 J-.002 E.04736
G1 X93.85 Y78.085 E.15617
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.32 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z10.92
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461441
G1 F600
M204 S6000
G1 X87.361 Y78.501 E.09797
G2 X87.178 Y78.52 I.091 J1.865 E.00493
; LINE_WIDTH: 0.398885
G1 X86.658 Y78.617 E.01205
; WIPE_START
G1 F13372.705
G1 X87.178 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.32 I-1.217 J-.022 P1  F42000
G1 X86.666 Y107.441 Z11.32
G1 Z10.92
G1 E.4 F1800
; LINE_WIDTH: 0.410374
G1 F600
M204 S6000
G1 X87.188 Y107.531 E.01245
; LINE_WIDTH: 0.462768
G2 X87.456 Y107.55 I.312 J-2.59 E.00719
G1 X91.03 Y107.55 E.09575
; CHANGE_LAYER
; Z_HEIGHT: 11.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.709
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 69/141
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11.32 I1.203 J-.184 P1  F42000
G1 X88.941 Y100.43 Z11.32
G1 Z11.08
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X89.286 Y99.675 I.262 J-.337 E.02756
G1 X89.335 Y99.258 E.01013
G3 X90.292 Y99.453 I-.231 J3.576 E.02362
G2 X91.002 Y100.112 I4.321 J-3.945 E.02339
G3 X91.488 Y103.628 I-.761 J1.897 E.10371
G3 X89.182 Y102.647 I-.74 J-1.461 E.06879
G3 X89.098 Y101.365 I2.299 J-.796 E.03137
G1 X88.844 Y100.89 E.01298
G3 X88.643 Y99.442 I.407 J-.794 E.0413
G3 X89.278 Y99.251 I.602 J.849 E.01626
; WIPE_START
G1 X90.018 Y99.343 E-.2833
G1 X90.254 Y99.437 E-.0967
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.48 I1.217 J-.032 P1  F42000
G1 X90.166 Y96.107 Z11.48
G1 Z11.08
G1 E.4 F1800
G1 F600
M204 S6000
G3 X91.021 Y95.794 I.791 J.836 E.02257
G1 X91.098 Y95.382 E.01013
G3 X92.464 Y97.537 I-.349 J1.731 E.06876
G3 X90.188 Y98.882 I-1.639 J-.175 E.07398
G3 X90.612 Y95.397 I1.012 J-1.645 E.10624
G1 X91.042 Y95.371 E.01037
; WIPE_START
G1 F9000
G1 X91.37 Y95.433 E-.1269
G1 X91.726 Y95.604 E-.15026
G1 X91.931 Y95.781 E-.10283
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.48 I1.167 J-.346 P1  F42000
G1 X88.568 Y84.438 Z11.48
G1 Z11.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.772 Y83.165 I1.337 J.06 E.04606
G1 X89.821 Y82.748 E.01013
G3 X91.345 Y84.532 I-.187 J1.703 E.06234
G1 X91.307 Y85.166 E.01531
G2 X92.654 Y85.308 I.842 J-1.523 E.03356
G3 X94.399 Y86.736 I.154 J1.592 E.06033
G3 X93.714 Y88.064 I-1.675 J-.023 E.03734
G1 X93.438 Y88.505 E.01255
G3 X91.91 Y90.872 I-1.87 J.469 E.07619
G3 X90.232 Y88.963 I-.033 J-1.663 E.06975
G3 X90.604 Y87.919 I2.343 J.247 E.027
G1 X90.758 Y87.432 E.01231
G3 X90.715 Y87.007 I.834 J-.3 E.0104
G2 X89.649 Y86.711 I-.895 J1.159 E.02736
G3 X88.223 Y86.315 I-.584 J-.664 E.04229
G3 X88.317 Y85.627 I1.139 J-.194 E.01702
G3 X89.103 Y82.911 I1.989 J-.896 E.07416
G3 X89.763 Y82.742 I.767 J1.614 E.01655
; WIPE_START
G1 X90.15 Y82.794 E-.14818
G1 X90.538 Y82.971 E-.16226
G1 X90.677 Y83.09 E-.06956
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.48 I1.208 J.144 P1  F42000
G1 X91.23 Y78.465 Z11.48
G1 Z11.08
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
M73 P49 R16
G1 X91.75 Y107.585 E.01254
M73 P50 R16
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.291 J-.004 E.0474
G1 X93.85 Y78.085 E.15616
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.48 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z11.08
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461856
G1 F600
M204 S6000
G1 X87.391 Y78.5 E.09728
G2 X87.226 Y78.513 I.117 J2.651 E.00442
; LINE_WIDTH: 0.423474
G1 X86.681 Y78.594 E.01341
; WIPE_START
G1 F12527.704
G1 X87.226 Y78.513 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.48 I-1.217 J-.024 P1  F42000
G1 X86.664 Y107.438 Z11.48
G1 Z11.08
G1 E.4 F1800
; LINE_WIDTH: 0.405152
G1 F600
M204 S6000
G1 X87.15 Y107.525 E.01146
; LINE_WIDTH: 0.46239
G2 X87.456 Y107.55 I.327 J-2.166 E.00821
G1 X91.03 Y107.55 E.09566
; CHANGE_LAYER
; Z_HEIGHT: 11.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11388.769
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 70/141
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11.48 I1.206 J-.164 P1  F42000
G1 X89.079 Y100.554 Z11.48
G1 Z11.24
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X88.812 Y99.761 I.121 J-.482 E.02397
G3 X89.178 Y99.65 I.35 J.493 E.00939
G1 X89.232 Y99.233 E.01013
G1 X89.324 Y99.246 E.00222
G3 X90.334 Y99.439 I-.249 J4.043 E.02486
G2 X91.084 Y100.268 I413.204 J-373.308 E.02696
G3 X91.46 Y103.721 I-.824 J1.837 E.10106
G3 X89.213 Y102.733 I-.702 J-1.453 E.06727
G3 X89.137 Y101.438 I2.268 J-.783 E.03169
G1 X88.907 Y100.948 E.01305
G3 X88.36 Y99.629 I.336 J-.912 E.03866
G3 X89.175 Y99.225 I.83 J.65 E.02268
; WIPE_START
G1 X89.324 Y99.246 E-.05699
G1 X90.061 Y99.33 E-.28207
G1 X90.161 Y99.37 E-.04094
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.64 I1.217 J-.018 P1  F42000
G1 X90.112 Y96.12 Z11.64
G1 Z11.24
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.918 Y95.726 I.868 J.756 E.02222
G1 X90.97 Y95.309 E.01013
G3 X92.458 Y97.45 I-.182 J1.714 E.07131
G3 X90.203 Y98.781 I-1.624 J-.177 E.07324
G3 X90.541 Y95.357 I1.001 J-1.63 E.1032
G1 X90.912 Y95.302 E.00905
; WIPE_START
G1 F9000
G1 X91.283 Y95.348 E-.14204
G1 X91.696 Y95.522 E-.1703
G1 X91.833 Y95.636 E-.06765
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.64 I1.167 J-.346 P1  F42000
G1 X88.574 Y84.663 Z11.64
G1 Z11.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.755 Y83.094 I1.41 J-.167 E.05229
G1 X89.801 Y82.677 E.01013
G1 X89.945 Y82.693 E.0035
G3 X91.336 Y84.422 I-.338 J1.696 E.0581
G1 X91.297 Y85.046 E.01507
G2 X91.964 Y85.446 I.916 J-.773 E.0191
G3 X94.245 Y85.963 I.787 J1.816 E.06034
G3 X93.647 Y88.161 I-1.441 J.788 E.06069
G2 X93.455 Y89.118 I.701 J.638 E.02474
G3 X91.572 Y90.926 I-1.793 J.017 E.07051
G3 X90.319 Y88.584 I.395 J-1.718 E.07256
G2 X90.807 Y87.519 I-14.862 J-7.449 E.02824
G3 X90.742 Y86.839 I1.222 J-.46 E.01666
G1 X90.135 Y86.542 E.01629
G1 X89.763 Y86.613 E.00913
G3 X88.447 Y86.845 I-.803 J-.707 E.0348
G3 X88.265 Y85.682 I.689 J-.704 E.03044
G3 X88.169 Y84.267 I9.079 J-1.33 E.03423
G3 X89.744 Y82.67 I1.79 J.191 E.05839
; WIPE_START
G1 X89.945 Y82.693 E-.07716
G1 X90.5 Y82.87 E-.22126
G1 X90.666 Y83.006 E-.08159
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.64 I1.208 J.15 P1  F42000
G1 X91.23 Y78.465 Z11.64
G1 Z11.24
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.738 I-.001 J-1.294 E.04742
G1 X86.15 Y79.38 E.65974
G3 X87.374 Y78.086 I1.295 J-.001 E.04737
G1 X93.85 Y78.085 E.15616
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.64 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z11.24
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461849
G1 F600
M204 S6000
G1 X87.391 Y78.5 E.09728
G2 X87.225 Y78.513 I.115 J2.617 E.00445
; LINE_WIDTH: 0.423334
G1 X86.682 Y78.594 E.01336
; WIPE_START
G1 F12532.199
G1 X87.225 Y78.513 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.64 I-1.217 J-.023 P1  F42000
G1 X86.666 Y107.441 Z11.64
G1 Z11.24
G1 E.4 F1800
; LINE_WIDTH: 0.409084
G1 F600
M204 S6000
G1 X87.183 Y107.53 E.01229
; LINE_WIDTH: 0.462717
G2 X87.456 Y107.55 I.263 J-1.791 E.00734
G1 X91.03 Y107.55 E.09573
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11380.068
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 71/141
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11.64 I1.205 J-.169 P1  F42000
G1 X89.047 Y100.542 Z11.64
G1 Z11.4
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X88.6 Y99.942 I.304 J-.693 E.01888
G3 X89.083 Y99.628 I.519 J.269 E.01454
G1 X89.132 Y99.211 E.01013
G3 X89.644 Y99.342 I-.101 J1.464 E.01282
G3 X90.806 Y100.233 I.261 J.863 E.04122
G3 X91.488 Y100.613 I-.027 J.85 E.01955
G3 X91.47 Y103.792 I-1.192 J1.583 E.08897
G3 X89.243 Y102.818 I-.69 J-1.456 E.0664
G3 X89.167 Y101.557 I2.195 J-.766 E.03084
G1 X89.138 Y101.301 E.00622
G2 X88.472 Y100.653 I-1.385 J.757 E.02274
G3 X89.075 Y99.203 I.529 J-.63 E.05027
; WIPE_START
G1 X89.644 Y99.342 E-.22278
G1 X90.058 Y99.321 E-.15722
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.8 I1.216 J-.039 P1  F42000
G1 X89.961 Y96.281 Z11.8
G1 Z11.4
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.923 Y95.668 I1.038 J.567 E.02872
G1 X90.983 Y95.252 E.01013
G3 X92.451 Y97.365 I-.193 J1.7 E.07021
G3 X90.217 Y98.68 I-1.609 J-.179 E.0725
G3 X90.525 Y95.305 I.986 J-1.611 E.10138
G1 X90.917 Y95.244 E.00957
; WIPE_START
G1 F9000
G1 X91.307 Y95.292 E-.14948
G1 X91.674 Y95.447 E-.15118
G1 X91.837 Y95.577 E-.07934
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.8 I1.167 J-.345 P1  F42000
G1 X88.592 Y84.592 Z11.8
G1 Z11.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.763 Y83.025 I1.369 J-.198 E.0524
G1 X89.809 Y82.607 E.01013
G1 X89.876 Y82.615 E.00162
M73 P51 R16
G3 X91.328 Y84.318 I-.234 J1.67 E.05901
G3 X91.182 Y85.22 I-2.208 J.106 E.0222
G1 X91.896 Y85.482 E.01834
G3 X94.326 Y85.939 I.922 J1.785 E.06423
G3 X93.515 Y88.237 I-1.454 J.779 E.06611
G2 X93.428 Y89.193 I1.472 J.617 E.02352
G3 X91.413 Y90.962 I-1.758 J.029 E.07351
G3 X90.317 Y88.679 I.564 J-1.676 E.06808
G2 X90.862 Y87.553 I-24.238 J-12.417 E.03017
G3 X90.791 Y86.779 I1.268 J-.505 E.01898
G2 X90.167 Y86.364 I-1.037 J.881 E.01831
G3 X89.245 Y86.984 I-12.965 J-18.288 E.0268
G3 X88.188 Y85.825 I-.356 J-.737 E.05057
G1 X88.395 Y85.494 E.00941
G1 X88.221 Y85.259 E.00704
G1 X88.258 Y85.16 E.00255
G3 X89.362 Y82.667 I1.905 J-.647 E.07224
G1 X89.752 Y82.601 E.00952
; WIPE_START
G1 X89.876 Y82.615 E-.04754
G1 X90.139 Y82.645 E-.10065
G1 X90.503 Y82.798 E-.15005
G1 X90.671 Y82.932 E-.08176
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.8 I1.208 J.151 P1  F42000
G1 X91.23 Y78.465 Z11.8
G1 Z11.4
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.003 J-1.292 E.04738
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.294 J-.002 E.04739
G1 X93.85 Y78.085 E.15615
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.8 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z11.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46186
G1 F600
M204 S6000
G1 X87.391 Y78.5 E.09727
G2 X87.224 Y78.513 I.11 J2.557 E.00449
; LINE_WIDTH: 0.423213
G1 X86.681 Y78.594 E.01334
; WIPE_START
G1 F12536.121
G1 X87.224 Y78.513 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.8 I-1.217 J-.024 P1  F42000
G1 X86.663 Y107.438 Z11.8
G1 Z11.4
G1 E.4 F1800
; LINE_WIDTH: 0.405024
G1 F600
M204 S6000
G1 X87.15 Y107.525 E.01145
; LINE_WIDTH: 0.462372
G2 X87.456 Y107.55 I.327 J-2.157 E.00823
G1 X91.03 Y107.55 E.09566
; CHANGE_LAYER
; Z_HEIGHT: 11.56
; LAYER_HEIGHT: 0.160001
; WIPE_START
G1 F11389.245
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 72/141
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11.8 I1.204 J-.174 P1  F42000
G1 X89.014 Y100.51 Z11.8
G1 Z11.56
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X88.563 Y99.821 I.114 J-.567 E.02208
G3 X88.992 Y99.61 I.44 J.353 E.01191
G1 X89.036 Y99.192 E.01013
G1 X89.073 Y99.197 E.00091
G3 X89.619 Y99.352 I.005 J1.02 E.01385
G3 X90.84 Y100.147 I.338 J.816 E.04133
G2 X91.582 Y100.777 I1.661 J-1.205 E.02369
G3 X91.479 Y103.861 I-1.277 J1.501 E.08548
G3 X89.273 Y102.902 I-.686 J-1.439 E.06573
G3 X89.236 Y101.457 I2.302 J-.782 E.03539
G2 X88.669 Y100.814 I-1.272 J.55 E.02103
G3 X88.978 Y99.186 I.293 J-.788 E.05685
; WIPE_START
G1 X89.073 Y99.197 E-.0364
G1 X89.332 Y99.229 E-.09886
G1 X89.619 Y99.352 E-.11861
G1 X89.856 Y99.29 E-.09336
G1 X89.943 Y99.295 E-.03278
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.96 I1.217 J.011 P1  F42000
G1 X89.971 Y96.216 Z11.96
G1 Z11.56
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.93 Y95.613 I1.058 J.619 E.02838
G1 X90.981 Y95.196 E.01013
G1 X91.074 Y95.207 E.00226
G3 X92.445 Y97.281 I-.262 J1.664 E.06744
G3 X90.231 Y98.579 I-1.594 J-.182 E.07172
G3 X90.534 Y95.248 I.967 J-1.591 E.10016
G1 X90.924 Y95.189 E.0095
; WIPE_START
G1 F9000
G1 X91.074 Y95.207 E-.05754
G1 X91.311 Y95.237 E-.09093
G1 X91.675 Y95.39 E-.14999
G1 X91.844 Y95.523 E-.08155
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.96 I1.217 J-.018 P1  F42000
G1 X91.705 Y86.148 Z11.96
G1 Z11.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.997 Y85.659 I1.378 J1.689 E.03389
G1 X93.041 Y85.242 E.01013
G3 X94.171 Y87.772 I.098 J1.474 E.08673
G3 X93.442 Y88.283 I-1.568 J-1.462 E.02163
G2 X93.334 Y89.715 I86.176 J7.222 E.03462
G3 X91.031 Y90.874 I-1.612 J-.334 E.07143
G3 X90.822 Y87.916 I1.076 J-1.562 E.08209
G2 X90.783 Y86.885 I-1.781 J-.448 E.02523
G3 X91.095 Y86.148 I.831 J-.082 E.02014
G3 X92.98 Y85.236 I1.942 J1.609 E.05208
; WIPE_START
G1 X93.372 Y85.27 E-.14956
G1 X93.779 Y85.397 E-.16179
G1 X93.932 Y85.492 E-.06866
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.96 I.39 J-1.153 P1  F42000
G1 X88.743 Y83.737 Z11.96
G1 Z11.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.772 Y82.958 I1.168 J.474 E.03266
G1 X89.818 Y82.541 E.01013
G3 X91.321 Y84.218 I-.163 J1.659 E.05963
G3 X89.828 Y86.437 I-2.291 J.07 E.06888
G3 X88.32 Y86.964 I-.996 J-.429 E.04329
G3 X88.128 Y85.905 I.604 J-.657 E.02787
G1 X88.385 Y85.497 E.01165
G1 X88.265 Y85.101 E.00997
G3 X89.008 Y82.773 I2.079 J-.619 E.06259
G3 X89.761 Y82.534 I.8 J1.215 E.01928
; WIPE_START
G1 X90.145 Y82.578 E-.14718
G1 X90.507 Y82.728 E-.14873
G1 X90.68 Y82.866 E-.08409
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.96 I1.208 J.151 P1  F42000
G1 X91.23 Y78.465 Z11.96
G1 Z11.56
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.75 Y107.585 E.01254
G1 X91.75 Y107.965 E.00916
G1 X87.445 Y107.965 E.10381
G3 X86.152 Y106.74 I-.001 J-1.295 E.04736
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.291 J-.004 E.04739
G1 X93.85 Y78.085 E.15617
M73 P52 R16
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.96 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z11.56
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461421
G1 F600
M204 S6000
G1 X87.361 Y78.501 E.09797
G2 X87.174 Y78.52 I.094 J1.908 E.00503
; LINE_WIDTH: 0.416232
G1 X86.672 Y78.603 E.01215
; WIPE_START
G1 F12765.272
G1 X87.174 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.96 I-1.217 J-.021 P1  F42000
G1 X86.668 Y107.441 Z11.96
G1 Z11.56
G1 E.4 F1800
; LINE_WIDTH: 0.409802
G1 F600
M204 S6000
G1 X87.184 Y107.531 E.0123
; LINE_WIDTH: 0.462755
G2 X87.456 Y107.55 I.275 J-1.991 E.00729
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 11.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.047
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 73/141
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11.96 I1.205 J-.172 P1  F42000
G1 X89.022 Y100.481 Z11.96
G1 Z11.72
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X88.469 Y99.83 I.034 J-.589 E.02304
G3 X88.905 Y99.597 I.465 J.344 E.01233
G1 X88.954 Y99.179 E.01013
G3 X89.592 Y99.363 I.008 J1.172 E.01625
G3 X90.809 Y100.511 I.407 J.788 E.05272
G1 X91.229 Y100.49 E.01014
G2 X91.893 Y101.21 I2.977 J-2.079 E.02368
G3 X91.488 Y103.929 I-1.532 J1.162 E.07387
G3 X89.287 Y102.939 I-.681 J-1.427 E.0662
G3 X89.354 Y101.404 I1.859 J-.688 E.03803
G1 X88.992 Y100.915 E.01467
G3 X88.05 Y99.729 I.074 J-1.026 E.04106
G3 X88.886 Y99.172 I.852 J.372 E.02559
; WIPE_START
G1 X89.229 Y99.21 E-.13117
G1 X89.592 Y99.363 E-.14992
G1 X89.844 Y99.298 E-.09891
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.12 I1.212 J.11 P1  F42000
G1 X90.15 Y95.933 Z12.12
G1 Z11.72
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.936 Y95.56 I.863 J.806 E.02149
G1 X90.988 Y95.143 E.01013
G1 X91.168 Y95.165 E.00437
G3 X92.438 Y97.199 I-.379 J1.651 E.06425
G3 X90.245 Y98.478 I-1.578 J-.186 E.07092
G3 X90.544 Y95.194 I.948 J-1.569 E.09887
G1 X90.93 Y95.136 E.00942
; WIPE_START
G1 F9000
G1 X91.168 Y95.165 E-.09085
G1 X91.677 Y95.335 E-.20388
G1 X91.853 Y95.474 E-.08526
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.12 I1.217 J-.014 P1  F42000
G1 X91.746 Y86.194 Z12.12
G1 Z11.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.048 Y85.639 I1.429 J1.547 E.03482
G1 X93.083 Y85.22 E.01013
G3 X94.223 Y87.763 I.145 J1.462 E.08844
G3 X93.4 Y88.311 I-1.757 J-1.747 E.024
G3 X93.305 Y89.785 I-411.43 J-25.886 E.03562
G3 X90.702 Y90.69 I-1.563 J-.3 E.08036
G3 X90.796 Y88.039 I1.472 J-1.275 E.0704
G1 X91.018 Y87.569 E.01253
G2 X90.696 Y86.876 I-5.435 J2.107 E.01843
G3 X91.342 Y85.995 I.824 J-.073 E.02876
G3 X93.025 Y85.215 I1.769 J1.61 E.04595
; WIPE_START
G1 X93.44 Y85.244 E-.15806
G1 X93.864 Y85.376 E-.16886
G1 X93.983 Y85.45 E-.05308
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.12 I.443 J-1.133 P1  F42000
G1 X88.878 Y83.455 Z12.12
G1 Z11.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.778 Y82.895 I.999 J.603 E.02653
G1 X89.82 Y82.477 E.01013
G3 X91.315 Y84.123 I-.099 J1.592 E.05933
G3 X90.135 Y86.089 I-2.027 J.12 E.05875
G2 X89.395 Y86.937 I17.839 J16.315 E.02715
G3 X87.985 Y86.585 I-.591 J-.631 E.0416
G3 X88.322 Y85.549 I1.441 J-.104 E.02694
G1 X88.341 Y85.03 E.01253
G3 X89.386 Y82.535 I1.789 J-.716 E.07229
G1 X89.762 Y82.472 E.00919
; WIPE_START
G1 X90.152 Y82.513 E-.14916
G1 X90.511 Y82.662 E-.14758
G1 X90.683 Y82.798 E-.08326
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.12 I1.207 J.152 P1  F42000
G1 X91.23 Y78.465 Z12.12
G1 Z11.72
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.751 Y107.585 E.01255
G1 X91.751 Y107.965 E.00916
G1 X87.445 Y107.965 E.10382
G3 X86.152 Y106.74 I-.001 J-1.295 E.04736
G1 X86.15 Y79.38 E.6598
G3 X87.376 Y78.086 I1.291 J-.004 E.04745
G1 X93.85 Y78.085 E.15611
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.12 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z11.72
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461382
G1 F600
M204 S6000
G1 X87.399 Y78.5 E.09695
G2 X87.174 Y78.52 I.041 J1.776 E.00604
; LINE_WIDTH: 0.416084
G1 X86.671 Y78.603 E.01216
; WIPE_START
G1 F12770.223
G1 X87.174 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.12 I-1.217 J-.022 P1  F42000
G1 X86.657 Y107.43 Z12.12
G1 Z11.72
G1 E.4 F1800
; LINE_WIDTH: 0.395932
G1 F600
M204 S6000
G1 X87.151 Y107.525 E.01138
; LINE_WIDTH: 0.462399
G2 X87.456 Y107.55 I.325 J-2.155 E.00819
G1 X91.03 Y107.55 E.09566
; CHANGE_LAYER
; Z_HEIGHT: 11.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11388.513
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 74/141
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z12.12 I1.204 J-.179 P1  F42000
G1 X88.974 Y100.442 Z12.12
G1 Z11.88
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X88.389 Y99.801 I-.028 J-.562 E.02389
G3 X88.82 Y99.587 I.462 J.389 E.01193
G1 X88.854 Y99.168 E.01013
G3 X89.546 Y99.367 I.015 J1.252 E.01762
G3 X90.93 Y100.042 I.459 J.814 E.04362
G1 X90.892 Y100.284 E.00591
G2 X91.596 Y100.986 I1.183 J-.484 E.02462
G3 X91.497 Y103.996 I-1.229 J1.466 E.08362
G3 X89.274 Y102.891 I-.676 J-1.429 E.06886
G3 X89.383 Y101.507 I1.865 J-.55 E.03423
G1 X89.331 Y101.221 E.00701
G2 X88.494 Y100.735 I-.953 J.678 E.02406
G3 X88.205 Y99.374 I.266 J-.767 E.04027
G3 X88.796 Y99.163 I.658 J.907 E.01535
; WIPE_START
G1 X89.13 Y99.196 E-.12754
G1 X89.546 Y99.367 E-.17092
G1 X89.754 Y99.314 E-.08154
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.28 I1.213 J.094 P1  F42000
G1 X90.002 Y96.096 Z12.28
G1 Z11.88
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.942 Y95.51 I.997 J.552 E.0279
G1 X90.996 Y95.094 E.01013
G3 X92.432 Y97.119 I-.153 J1.63 E.06795
G3 X90.259 Y98.378 I-1.562 J-.192 E.07011
G3 X90.553 Y95.143 I.926 J-1.547 E.09755
G1 X90.937 Y95.086 E.00935
; WIPE_START
G1 F9000
G1 X91.32 Y95.134 E-.14656
G1 X91.678 Y95.283 E-.14755
G1 X91.856 Y95.423 E-.0859
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.28 I1.217 J-.009 P1  F42000
G1 X91.786 Y86.244 Z12.28
G1 Z11.88
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.094 Y85.618 I1.491 J1.437 E.03574
G1 X93.118 Y85.199 E.01013
G3 X94.3 Y87.723 I.183 J1.453 E.08888
G3 X93.289 Y88.298 I-1.587 J-1.613 E.02835
G1 X93.279 Y88.904 E.01461
G3 X91.754 Y91.161 I-1.74 J.467 E.07446
G3 X90.304 Y88.948 I.041 J-1.608 E.07489
G3 X90.89 Y88.068 I1.946 J.66 E.0258
G2 X90.706 Y87.117 I-.842 J-.33 E.02464
G3 X91.495 Y85.94 I.752 J-.348 E.04096
G3 X93.06 Y85.196 I1.715 J1.587 E.04281
; WIPE_START
G1 X93.53 Y85.224 E-.17879
G1 X93.946 Y85.355 E-.16589
G1 X94.024 Y85.404 E-.03532
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.28 I.384 J-1.155 P1  F42000
G1 X88.762 Y83.656 Z12.28
G1 Z11.88
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.792 Y82.834 I1.147 J.381 E.0336
G1 X89.838 Y82.416 E.01013
G1 X90.117 Y82.448 E.00676
M73 P52 R15
G3 X91.277 Y84.492 I-.491 J1.63 E.06256
G3 X90.144 Y85.951 I-1.887 J-.295 E.0465
G1 X89.755 Y86.325 E.01301
G3 X88.153 Y87.051 I-1.063 J-.215 E.04945
G3 X88.299 Y85.678 I.698 J-.62 E.03747
G1 X88.457 Y85.147 E.01336
G3 X89.399 Y82.474 I1.672 J-.914 E.0771
G1 X89.781 Y82.41 E.00933
; WIPE_START
G1 X90.117 Y82.448 E-.12854
G1 X90.516 Y82.6 E-.16233
G1 X90.701 Y82.744 E-.08913
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.28 I1.208 J.149 P1  F42000
G1 X91.23 Y78.465 Z12.28
G1 Z11.88
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
M73 P53 R15
G1 X91.763 Y107.585 E.01286
G1 X91.763 Y107.965 E.00916
G1 X87.445 Y107.965 E.10412
G3 X86.152 Y106.74 I-.003 J-1.292 E.04738
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.291 J-.004 E.04739
G1 X93.85 Y78.085 E.15617
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.28 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z11.88
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46209
G1 F600
M204 S6000
G1 X87.265 Y78.509 E.10069
; LINE_WIDTH: 0.427288
G1 X86.687 Y78.589 E.01433
; WIPE_START
G1 F12406.095
G1 X87.265 Y78.509 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.28 I-1.217 J-.025 P1  F42000
G1 X86.666 Y107.441 Z12.28
G1 Z11.88
G1 E.4 F1800
; LINE_WIDTH: 0.40976
G1 F600
M204 S6000
G1 X87.184 Y107.531 E.01234
; LINE_WIDTH: 0.462756
G2 X87.456 Y107.55 I.275 J-1.988 E.00729
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 12.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11379.022
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 75/141
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z12.28 I1.198 J-.212 P1  F42000
G1 X88.761 Y100.374 Z12.28
G1 Z12.04
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X88.365 Y99.683 I.033 J-.478 E.02267
G3 X88.732 Y99.58 I.539 J1.225 E.00921
G1 X88.776 Y99.163 E.01013
G3 X89.732 Y99.339 I-14.491 J81.091 E.02343
G3 X90.926 Y100.368 I.401 J.743 E.04908
G2 X91.604 Y101.088 I1.049 J-.308 E.02473
G3 X91.506 Y104.061 I-1.208 J1.449 E.08267
G3 X89.295 Y102.946 I-.671 J-1.419 E.06879
G3 X89.552 Y101.3 I2.506 J-.453 E.04092
G2 X88.995 Y100.813 I-1.608 J1.273 E.01795
G3 X87.996 Y99.465 I-.162 J-.925 E.05007
G3 X88.706 Y99.157 I.728 J.708 E.01916
; WIPE_START
G1 X89.691 Y99.332 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.44 I1.205 J.168 P1  F42000
G1 X90.179 Y95.822 Z12.44
G1 Z12.04
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.949 Y95.463 I.843 J.804 E.02098
G1 X91.001 Y95.047 E.01013
G3 X92.422 Y97.057 I-.145 J1.609 E.06748
G3 X90.272 Y98.279 I-1.543 J-.212 E.06888
G3 X90.563 Y95.096 I.903 J-1.523 E.09617
G1 X90.944 Y95.039 E.00929
; WIPE_START
G1 F9000
G1 X91.315 Y95.086 E-.14206
G1 X91.68 Y95.236 E-.15005
G1 X91.862 Y95.378 E-.0879
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.44 I1.217 J-.003 P1  F42000
G1 X91.838 Y86.188 Z12.44
G1 Z12.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.191 Y85.597 I1.99 J2.71 E.03591
G1 X93.216 Y85.178 E.01013
G3 X94.372 Y87.685 I.149 J1.452 E.08733
G3 X93.516 Y88.208 I-1.547 J-1.569 E.02442
G1 X93.335 Y88.42 E.00672
G1 X93.233 Y88.941 E.01279
G3 X91.349 Y91.171 I-1.64 J.525 E.08401
G3 X90.3 Y89.028 I.508 J-1.577 E.06422
G3 X90.948 Y88.11 I1.895 J.649 E.02749
G1 X90.993 Y87.883 E.00557
G2 X90.645 Y87.132 I-.974 J-.005 E.02062
G3 X91.381 Y85.943 I.7 J-.389 E.04102
G3 X92.693 Y85.252 I8.32 J14.211 E.03577
G1 X93.158 Y85.174 E.01136
; WIPE_START
G1 X93.616 Y85.203 E-.17429
G1 X94.024 Y85.333 E-.16296
G1 X94.119 Y85.394 E-.04275
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.44 I.383 J-1.155 P1  F42000
G1 X88.768 Y83.619 Z12.44
G1 Z12.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.802 Y82.776 I1.148 J.352 E.03412
G1 X89.849 Y82.359 E.01013
G1 X90.04 Y82.38 E.00465
G3 X91.27 Y84.41 I-.362 J1.606 E.06391
G3 X90.049 Y85.847 I-1.805 J-.297 E.04775
G1 X89.696 Y86.253 E.013
G3 X88.29 Y87.199 I-1.075 J-.08 E.047
G3 X88.128 Y85.854 I.417 J-.733 E.03796
G1 X88.402 Y85.614 E.00877
G1 X88.488 Y85.065 E.0134
G3 X89.412 Y82.415 I1.632 J-.917 E.07653
G1 X89.792 Y82.352 E.00927
; WIPE_START
G1 X90.04 Y82.38 E-.09519
G1 X90.522 Y82.54 E-.19269
G1 X90.713 Y82.689 E-.09213
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.44 I1.208 J.148 P1  F42000
G1 X91.23 Y78.465 Z12.44
G1 Z12.04
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.798 Y107.585 E.01369
G1 X91.798 Y107.965 E.00916
G1 X87.445 Y107.965 E.10495
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.294 J-.002 E.04738
G1 X93.85 Y78.085 E.15615
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.44 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z12.04
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461428
G1 F600
M204 S6000
G1 X87.392 Y78.5 E.09715
G2 X87.174 Y78.52 I.084 J2.161 E.00583
; LINE_WIDTH: 0.415752
G1 X86.673 Y78.603 E.01213
; WIPE_START
G1 F12781.317
G1 X87.174 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.44 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z12.44
G1 Z12.04
G1 E.4 F1800
; LINE_WIDTH: 0.409497
G1 F600
M204 S6000
G1 X87.183 Y107.53 E.0123
; LINE_WIDTH: 0.462715
G2 X87.456 Y107.55 I.264 J-1.792 E.00734
G1 X91.03 Y107.55 E.09573
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11380.113
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 76/141
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z12.44 I1.201 J-.198 P1  F42000
G1 X88.841 Y100.348 Z12.44
G1 Z12.2
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X88.325 Y99.622 I-.094 J-.48 E.027
G3 X88.587 Y99.564 I.362 J.999 E.00648
G1 X88.602 Y99.144 E.01013
G3 X89.298 Y99.32 I-.015 J1.524 E.01748
G2 X90.398 Y99.262 I-1.33 J-35.677 E.02657
G3 X90.912 Y100.42 I-.161 J.764 E.03563
G1 X91.193 Y100.927 E.01398
G3 X91.517 Y104.123 I-.769 J1.693 E.09357
G3 X89.325 Y103.027 I-.668 J-1.403 E.06809
G3 X89.753 Y101.244 I1.818 J-.507 E.04619
M73 P54 R15
G2 X88.637 Y100.769 I-.956 J.699 E.03068
G3 X87.976 Y99.358 I.133 J-.923 E.0445
G3 X88.544 Y99.142 I.615 J.762 E.01491
; WIPE_START
G1 X88.937 Y99.178 E-.14986
G1 X89.298 Y99.32 E-.14746
G1 X89.515 Y99.308 E-.08269
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.6 I1.195 J.229 P1  F42000
G1 X90.193 Y95.772 Z12.6
G1 Z12.2
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.956 Y95.421 I.83 J.798 E.02072
G1 X91.007 Y95.004 E.01013
G1 X91.247 Y95.034 E.00583
G3 X92.067 Y97.736 I-.458 J1.614 E.08091
G3 X89.467 Y97.039 I-1.16 J-.873 E.08311
G3 X90.95 Y94.997 I1.617 J-.385 E.0691
; WIPE_START
G1 F9000
G1 X91.247 Y95.034 E-.11385
G1 X91.681 Y95.191 E-.17518
G1 X91.87 Y95.337 E-.09097
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.6 I1.217 J.004 P1  F42000
G1 X91.902 Y86.199 Z12.6
G1 Z12.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.891 Y85.64 I5.597 J8.746 E.0274
G3 X93.282 Y85.576 I.332 J.801 E.00964
G1 X93.308 Y85.157 E.01013
G3 X94.442 Y87.647 I.143 J1.438 E.0866
G3 X93.34 Y88.241 I-1.631 J-1.706 E.03054
G1 X93.129 Y88.804 E.0145
G3 X91.332 Y91.216 I-1.551 J.72 E.08866
G3 X90.355 Y88.95 I.497 J-1.557 E.06741
G3 X91.029 Y88.13 I1.864 J.844 E.02589
G2 X90.619 Y87.179 I-1.322 J.006 E.02567
G3 X91.446 Y85.955 I.689 J-.425 E.04482
G2 X92.389 Y85.387 I-2.823 J-5.752 E.02658
G3 X93.25 Y85.153 I.984 J1.924 E.02168
; WIPE_START
G1 X93.698 Y85.183 E-.1706
G1 X94.099 Y85.312 E-.16011
G1 X94.208 Y85.383 E-.0493
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.6 I.435 J-1.137 P1  F42000
G1 X88.874 Y83.342 Z12.6
G1 Z12.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.813 Y82.721 I1.016 J.517 E.02838
G1 X89.86 Y82.304 E.01013
G1 X90.017 Y82.322 E.0038
G3 X91.265 Y84.321 I-.308 J1.582 E.06374
G3 X89.94 Y85.753 I-1.765 J-.304 E.04976
G2 X89.555 Y86.583 I.766 J.859 E.0227
G3 X88.468 Y87.333 I-1.051 J-.36 E.03413
G3 X87.913 Y86.106 I.248 J-.851 E.03689
G3 X88.443 Y85.653 I1.358 J1.051 E.01695
G1 X88.557 Y85.071 E.01429
G3 X89.426 Y82.358 I1.579 J-.99 E.07819
G1 X89.803 Y82.297 E.0092
; WIPE_START
G1 X90.017 Y82.322 E-.08181
G1 X90.528 Y82.483 E-.20371
G1 X90.724 Y82.636 E-.09448
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.6 I1.208 J.147 P1  F42000
G1 X91.23 Y78.465 Z12.6
G1 Z12.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.439 Y107.585 E.00503
G1 X91.839 Y107.585 E.00965
G1 X91.855 Y107.585 E.00039
G1 X91.855 Y107.965 E.00916
G1 X91.839 Y107.965 E.00039
G1 X91.439 Y107.965 E.00965
G1 X87.445 Y107.965 E.09629
G3 X86.152 Y106.74 I-.003 J-1.292 E.04738
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.291 J-.004 E.04741
G1 X93.85 Y78.085 E.15615
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.6 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z12.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461429
G1 F600
M204 S6000
G1 X87.392 Y78.5 E.09715
G2 X87.175 Y78.52 I.083 J2.151 E.00583
; LINE_WIDTH: 0.415654
G1 X86.671 Y78.603 E.01217
; WIPE_START
G1 F12784.613
G1 X87.175 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.6 I-1.217 J-.021 P1  F42000
G1 X86.681 Y107.455 Z12.6
G1 Z12.2
G1 E.4 F1800
; LINE_WIDTH: 0.423572
G1 F600
M204 S6000
G1 X87.228 Y107.536 E.01346
; LINE_WIDTH: 0.463138
G2 X87.456 Y107.55 I.236 J-2.119 E.00611
G1 X91.03 Y107.55 E.09583
; CHANGE_LAYER
; Z_HEIGHT: 12.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11368.896
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 77/141
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z12.6 I1.198 J-.212 P1  F42000
G1 X88.75 Y100.317 Z12.6
G1 Z12.36
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X88.209 Y99.613 I-.009 J-.553 E.02486
G3 X88.62 Y99.563 I.371 J1.339 E.01002
G1 X88.68 Y99.147 E.01013
G3 X89.229 Y99.356 I-.097 J1.083 E.01435
G1 X89.782 Y99.377 E.01334
G3 X90.933 Y100.448 I.467 J.652 E.05302
G2 X91.194 Y101.023 I2.067 J-.588 E.0153
G3 X91.524 Y104.186 I-.742 J1.676 E.09284
G3 X89.519 Y103.514 I-.668 J-1.333 E.05669
G3 X89.853 Y101.255 I1.66 J-.909 E.05912
G1 X89.694 Y100.83 E.01095
G1 X89.145 Y100.66 E.01384
G3 X87.822 Y99.414 I-.407 J-.893 E.05602
G3 X88.622 Y99.139 I.667 J.639 E.02119
; WIPE_START
G1 X88.893 Y99.178 E-.10372
G1 X89.229 Y99.356 E-.14475
G1 X89.575 Y99.369 E-.13153
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.76 I1.199 J.208 P1  F42000
G1 X90.208 Y95.726 Z12.76
G1 Z12.36
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.962 Y95.383 I.814 J.789 E.02046
G1 X91.014 Y94.966 E.01013
G1 X91.177 Y94.986 E.00397
G3 X92.04 Y97.678 I-.351 J1.597 E.08234
G3 X89.49 Y96.974 I-1.123 J-.901 E.08084
G3 X90.956 Y94.959 I1.586 J-.387 E.06837
; WIPE_START
G1 F9000
G1 X91.177 Y94.986 E-.0845
G1 X91.682 Y95.15 E-.20185
G1 X91.878 Y95.301 E-.09365
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.76 I1.217 J.012 P1  F42000
G1 X91.97 Y86.215 Z12.76
G1 Z12.36
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X92.622 Y85.77 I-2.04 J-3.692 E.01904
G3 X93.369 Y85.555 I1.023 J2.147 E.01884
G1 X93.396 Y85.136 E.01013
G1 X93.461 Y85.14 E.00156
G3 X94.508 Y87.608 I.068 J1.428 E.08388
G3 X93.31 Y88.213 I-1.574 J-1.629 E.03286
G1 X93.055 Y88.761 E.01456
G3 X91.314 Y91.257 I-1.493 J.814 E.0909
G3 X90.556 Y88.664 I.527 J-1.562 E.07636
G3 X91.063 Y88.186 I1.342 J.916 E.01694
G2 X90.934 Y87.476 I-1.181 J-.152 E.0177
G3 X90.625 Y86.174 I.345 J-.769 E.03727
G3 X91.508 Y85.969 I.763 J1.284 E.0222
G2 X92.424 Y85.398 I-1.765 J-3.852 E.02611
G3 X93.339 Y85.132 I1.04 J1.874 E.02316
; WIPE_START
G1 X93.461 Y85.14 E-.04652
G1 X93.778 Y85.162 E-.12066
G1 X94.171 Y85.291 E-.15728
G1 X94.293 Y85.371 E-.05555
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.76 I.432 J-1.138 P1  F42000
G1 X88.881 Y83.318 Z12.76
G1 Z12.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.824 Y82.669 I1.172 J.694 E.02848
G1 X89.872 Y82.252 E.01013
G1 X90.107 Y82.279 E.00572
G3 X91.12 Y84.67 I-.456 J1.603 E.07177
G3 X89.879 Y85.65 I-1.539 J-.672 E.03971
G2 X89.467 Y86.65 I1.437 J1.177 E.02646
G3 X88.448 Y87.39 I-.946 J-.232 E.03303
G3 X87.79 Y86.218 I.418 J-1.006 E.03494
G3 X88.458 Y85.698 I1.202 J.857 E.02069
G1 X88.561 Y85.523 E.00491
G1 X88.594 Y84.999 E.01265
G3 X89.44 Y82.305 I1.532 J-.999 E.0778
G1 X89.814 Y82.246 E.00913
; WIPE_START
G1 X90.107 Y82.279 E-.11208
G1 X90.534 Y82.43 E-.17199
G1 X90.734 Y82.585 E-.09592
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.76 I1.208 J.146 P1  F42000
G1 X91.23 Y78.465 Z12.76
G1 Z12.36
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.496 Y107.585 E.00641
G1 X91.896 Y107.585 E.00965
G1 X91.939 Y107.585 E.00104
G1 X91.939 Y107.965 E.00916
G1 X91.896 Y107.965 E.00104
G1 X91.496 Y107.965 E.00965
G1 X91.096 Y107.965 E.00965
G1 X87.445 Y107.965 E.08803
G3 X86.152 Y106.74 I-.003 J-1.292 E.04738
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.291 J-.004 E.04741
G1 X93.85 Y78.085 E.15615
M73 P55 R15
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.76 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z12.36
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461432
G1 F600
M204 S6000
G1 X87.392 Y78.5 E.09714
G2 X87.175 Y78.52 I.082 J2.14 E.00583
; LINE_WIDTH: 0.41547
G1 X86.671 Y78.604 E.01218
; WIPE_START
G1 F12790.803
G1 X87.175 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.76 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z12.76
G1 Z12.36
G1 E.4 F1800
; LINE_WIDTH: 0.409992
G1 F600
M204 S6000
G1 X87.185 Y107.531 E.01238
; LINE_WIDTH: 0.462775
G2 X87.456 Y107.55 I.28 J-2.076 E.00726
G1 X91.03 Y107.55 E.09575
; CHANGE_LAYER
; Z_HEIGHT: 12.52
; LAYER_HEIGHT: 0.160001
; WIPE_START
G1 F11378.528
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 78/141
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z12.76 I1.205 J-.169 P1  F42000
G1 X89 Y100.205 Z12.76
G1 Z12.52
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X88.148 Y99.777 I-.292 J-.482 E.02743
G3 X88.302 Y99.538 I.108 J-.1 E.00935
G1 X88.309 Y99.118 E.01013
G3 X89.221 Y99.368 I-.414 J3.302 E.0229
G1 X89.742 Y99.427 E.01263
G3 X91.072 Y100.05 I.519 J.624 E.04428
G3 X90.841 Y100.638 I-.566 J.117 E.01613
G2 X91.586 Y101.355 I1.281 J-.585 E.02554
G3 X91.534 Y104.246 I-1.101 J1.426 E.08091
G3 X89.382 Y103.18 I-.656 J-1.38 E.06659
G3 X89.87 Y101.368 I1.815 J-.484 E.04739
G2 X89.728 Y100.627 I-1.237 J-.147 E.01847
G2 X88.702 Y100.718 I-.294 J2.523 E.025
G3 X87.74 Y99.388 I.102 J-1.087 E.0448
G3 X88.251 Y99.117 I.481 J.29 E.01464
; WIPE_START
G1 X88.538 Y99.122 E-.109
G1 X89.209 Y99.363 E-.271
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.92 I1.182 J.29 P1  F42000
G1 X90.057 Y95.905 Z12.92
G1 Z12.52
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.968 Y95.35 I.973 J.571 E.02679
G1 X91.008 Y94.931 E.01013
G3 X92.259 Y97.249 I-.112 J1.556 E.07558
G3 X89.512 Y96.904 I-1.323 J-.574 E.08949
G3 X90.95 Y94.928 I1.554 J-.38 E.06708
; WIPE_START
G1 F9000
G1 X91.605 Y95.064 E-.25398
G1 X91.884 Y95.243 E-.12602
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.92 I1.217 J.019 P1  F42000
G1 X92.022 Y86.26 Z12.92
G1 Z12.52
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X92.416 Y85.967 I-.058 J-.488 E.01239
G3 X93.453 Y85.534 I1.139 J1.271 E.02763
G1 X93.481 Y85.115 E.01013
G1 X93.536 Y85.119 E.00132
G3 X94.473 Y87.653 I.063 J1.417 E.08627
G3 X93.306 Y88.187 I-1.468 J-1.667 E.03139
G2 X93.001 Y88.782 I1.037 J.908 E.0163
G3 X91.297 Y91.295 I-1.455 J.848 E.09122
G3 X90.609 Y88.66 I.516 J-1.542 E.07783
G3 X91.477 Y88.091 I1.452 J1.268 E.02532
G1 X91.034 Y87.501 E.01779
G3 X90.455 Y86.206 I.311 J-.916 E.0384
G3 X91.459 Y85.983 I.746 J.987 E.02559
G1 X91.949 Y85.845 E.01226
G3 X93.423 Y85.111 I1.598 J1.363 E.04081
; WIPE_START
G1 X93.536 Y85.119 E-.04284
G1 X93.853 Y85.141 E-.12097
G1 X94.239 Y85.269 E-.15449
G1 X94.374 Y85.359 E-.06171
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.92 I.424 J-1.141 P1  F42000
G1 X88.876 Y83.315 Z12.92
G1 Z12.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.834 Y82.621 I1.172 J.609 E.02958
G1 X89.881 Y82.204 E.01013
G3 X91.259 Y84.149 I-.124 J1.548 E.06552
G3 X89.657 Y85.523 I-1.61 J-.256 E.05535
G1 X89.389 Y86.084 E.015
G3 X88.614 Y87.487 I-1.087 J.315 E.04295
G3 X87.892 Y86.866 I.31 J-1.09 E.0237
G3 X88.422 Y85.768 I.487 J-.442 E.03763
G1 X88.631 Y85.621 E.00615
G1 X88.727 Y85.042 E.01417
G3 X88.581 Y82.957 I1.439 J-1.148 E.05359
G3 X89.824 Y82.197 I1.302 J.734 E.03668
; WIPE_START
G1 X90.172 Y82.237 E-.13302
G1 X90.542 Y82.381 E-.15099
G1 X90.742 Y82.536 E-.09599
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.92 I1.208 J.145 P1  F42000
G1 X91.23 Y78.465 Z12.92
G1 Z12.52
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.58 Y107.585 E.00844
G1 X91.98 Y107.585 E.00965
G1 X92.057 Y107.585 E.00186
G1 X92.057 Y107.965 E.00916
G1 X91.98 Y107.965 E.00186
G1 X91.58 Y107.965 E.00965
G1 X91.18 Y107.965 E.00965
G1 X90.78 Y107.965 E.00965
G1 X87.445 Y107.965 E.08041
G3 X86.152 Y106.74 I-.001 J-1.295 E.04736
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.291 J-.004 E.04741
G1 X93.85 Y78.085 E.15615
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.92 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z12.52
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461815
G1 F600
M204 S6000
G1 X87.392 Y78.5 E.09723
G2 X87.217 Y78.514 I.089 J2.276 E.0047
; LINE_WIDTH: 0.422467
G1 X86.68 Y78.595 E.01318
; WIPE_START
M73 P55 R14
G1 F12560.203
G1 X87.217 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.92 I-1.217 J-.024 P1  F42000
G1 X86.645 Y107.417 Z12.92
G1 Z12.52
G1 E.4 F1800
; LINE_WIDTH: 0.381136
G1 F600
M204 S6000
G1 X87.088 Y107.514 E.00983
; LINE_WIDTH: 0.408781
G1 X87.183 Y107.53 E.00225
; LINE_WIDTH: 0.462717
G2 X87.456 Y107.55 I.263 J-1.79 E.00734
G1 X91.03 Y107.55 E.09573
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 12.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11380.065
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 79/141
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
M204 S10000
G17
G3 Z12.92 I1.217 J.009 P1  F42000
G1 X90.072 Y101.896 Z12.92
G1 Z12.68
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.834 Y101.583 I.71 J.645 E.02053
G1 X90.929 Y101.174 E.01013
G3 X91.543 Y104.302 I-.401 J1.703 E.09669
G3 X89.411 Y103.254 I-.652 J-1.368 E.06587
G3 X90.628 Y101.165 I1.509 J-.52 E.06614
G1 X90.872 Y101.161 E.00589
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.216 Y101.242 E-.134
G1 X91.579 Y101.442 E-.15754
G1 X91.746 Y101.604 E-.08846
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.08 I.505 J-1.107 P1  F42000
G1 X88.348 Y100.053 Z13.08
G1 Z12.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.095 Y99.531 I.287 J-.461 E.01474
G3 X88.25 Y99.522 I.096 J.295 E.00378
G1 X88.327 Y99.109 E.01013
G3 X89.187 Y99.497 I-.141 J1.459 E.02315
G1 X89.835 Y99.378 E.01588
G3 X90.675 Y99.372 I.424 J.526 E.02187
G3 X91.087 Y100.487 I-.682 J.885 E.03022
G3 X90.333 Y100.757 I-.669 J-.683 E.01991
G3 X89.705 Y100.531 I-.087 J-.746 E.01669
G2 X88.719 Y100.719 I-.204 J1.612 E.02459
G3 X87.95 Y100.242 I.056 J-.948 E.02275
G3 X87.663 Y99.364 I.725 J-.724 E.0231
G3 X88.27 Y99.098 I.561 J.455 E.01662
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.814 Y99.221 E-.21185
G1 X89.059 Y99.348 E-.10481
G1 X89.168 Y99.474 E-.06334
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.08 I1.175 J.319 P1  F42000
G1 X90.199 Y95.67 Z13.08
G1 Z12.68
G1 E.4 F1800
G1 F628
M204 S6000
G3 X90.948 Y95.326 I.939 J1.054 E.02017
G1 X90.974 Y94.906 E.01013
G3 X92.392 Y96.781 I.09 J1.405 E.06704
G3 X89.493 Y96.421 I-1.444 J-.223 E.10858
G3 X90.916 Y94.903 I1.51 J-.01 E.05535
; WIPE_START
G1 F9000
G1 X91.297 Y94.919 E-.14481
G1 X91.678 Y95.042 E-.15227
G1 X91.861 Y95.161 E-.08292
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.08 I1.216 J.034 P1  F42000
G1 X92.109 Y86.301 Z13.08
G1 Z12.68
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.247 Y86.259 E.00349
G3 X93.534 Y85.512 I1.439 J.998 E.03704
G1 X93.562 Y85.093 E.01013
G1 X93.605 Y85.096 E.00105
G3 X94.631 Y87.531 I.05 J1.412 E.08232
G3 X93.077 Y88.122 I-1.385 J-1.303 E.04149
G2 X93.134 Y89.337 I1.442 J.541 E.03015
G3 X90.931 Y91.191 I-1.53 J.417 E.08704
G3 X90.912 Y88.449 I.921 J-1.377 E.07787
G1 X91.368 Y88.201 E.01252
G2 X91.016 Y87.481 I-1.736 J.404 E.01949
G3 X90.392 Y86.789 I.448 J-1.031 E.02316
G3 X90.573 Y86.04 I.357 J-.31 E.02172
G3 X91.492 Y86.051 I.432 J2.153 E.02232
G1 X92.01 Y85.893 E.01307
G3 X93.504 Y85.089 I1.607 J1.199 E.04225
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.605 Y85.096 E-.03848
G1 X93.925 Y85.119 E-.12199
G1 X94.304 Y85.247 E-.15172
G1 X94.452 Y85.346 E-.06781
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.08 I.502 J-1.109 P1  F42000
G1 X89.105 Y82.928 Z13.08
G1 Z12.68
G1 E.4 F1800
G1 F628
M204 S6000
G3 X89.847 Y82.576 I.818 J.768 E.02027
G1 X89.895 Y82.159 E.01013
G3 X91.118 Y84.485 I-.163 J1.57 E.07488
G3 X89.116 Y85.247 I-1.352 J-.541 E.05805
G3 X89.838 Y82.152 I.917 J-1.418 E.09981
; WIPE_START
M73 P56 R14
G1 F9000
G1 X90.205 Y82.195 E-.14022
G1 X90.547 Y82.335 E-.14059
G1 X90.754 Y82.494 E-.09919
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.08 I-1.006 J-.685 P1  F42000
G1 X88.083 Y86.413 Z13.08
G1 Z12.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.087 Y86.333 I.026 J-.039 E.00234
G3 X88.657 Y86.208 I.57 J1.236 E.01418
G1 X88.752 Y85.799 E.01013
G1 X88.85 Y85.822 E.00244
G3 X89.279 Y86.85 I-.24 J.703 E.03035
G3 X88.573 Y87.548 I-.882 J-.186 E.02536
G3 X88.015 Y86.96 I.382 J-.922 E.02012
G3 X87.737 Y86.082 I.28 J-.572 E.02481
G3 X88.696 Y85.785 I.826 J.971 E.02488
M106 S124.95
; WIPE_START
G1 X88.85 Y85.822 E-.06036
G1 X89.176 Y85.999 E-.1411
G1 X89.307 Y86.217 E-.09667
G1 X89.344 Y86.43 E-.08188
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.08 I1.184 J.28 P1  F42000
G1 X91.23 Y78.465 Z13.08
G1 Z12.68
G1 E.4 F1800
M106 S127.5
; FEATURE: Outer wall
G1 F628
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.698 Y107.585 E.01129
G1 X92.098 Y107.585 E.00965
G1 X92.225 Y107.585 E.00305
M106 S124.95
M106 S127.5
G1 X92.225 Y107.965 E.00916
M106 S124.95
M106 S127.5
G1 X92.098 Y107.965 E.00305
M106 S124.95
G1 X91.698 Y107.965 E.00965
G1 X91.298 Y107.965 E.00965
G1 X90.898 Y107.965 E.00965
G1 X87.445 Y107.965 E.08326
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.294 J-.002 E.04739
G1 X93.85 Y78.085 E.15615
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.08 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z12.68
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461436
G1 F628
M204 S6000
G1 X87.392 Y78.5 E.09714
G2 X87.175 Y78.52 I.08 J2.117 E.00583
; LINE_WIDTH: 0.415161
G1 X86.672 Y78.604 E.01215
; WIPE_START
G1 F12801.178
G1 X87.175 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.08 I-1.217 J-.023 P1  F42000
G1 X86.639 Y107.41 Z13.08
G1 Z12.68
G1 E.4 F1800
; LINE_WIDTH: 0.367687
G1 F628
M204 S6000
G1 X87.057 Y107.507 E.00896
; LINE_WIDTH: 0.394602
G1 X87.135 Y107.523 E.00179
; LINE_WIDTH: 0.423741
G1 X87.228 Y107.536 E.00229
; LINE_WIDTH: 0.463138
G2 X87.456 Y107.55 I.236 J-2.125 E.00611
G1 X91.03 Y107.55 E.09583
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 12.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11368.885
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 80/141
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z13.08 I1.217 J-.022 P1  F42000
G1 X89.934 Y102.237 Z13.08
G1 Z12.84
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F746
M204 S6000
G3 X90.812 Y101.683 I.867 J.402 E.02647
G1 X90.894 Y101.271 E.01013
G3 X91.543 Y104.362 I-.294 J1.675 E.09765
G3 X89.374 Y102.896 I-.618 J-1.422 E.07513
G3 X90.838 Y101.258 I1.511 J-.122 E.05923
; WIPE_START
G1 F9000
G1 X91.217 Y101.34 E-.14735
G1 X91.587 Y101.54 E-.1599
G1 X91.725 Y101.673 E-.07275
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.24 I.531 J-1.095 P1  F42000
G1 X88.494 Y100.106 Z13.24
G1 Z12.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.013 Y99.516 I.846 J-1.181 E.01857
G1 X88.06 Y99.509 E.00114
G1 X88.091 Y99.091 E.01013
G3 X89.15 Y99.502 I-.563 J3.021 E.02756
G1 X89.297 Y99.51 E.00354
G1 X89.838 Y99.356 E.01357
G3 X90.644 Y99.424 I.382 J.29 E.02323
G3 X91.206 Y100.395 I-.858 J1.145 E.0278
G3 X90.448 Y100.69 I-.529 J-.237 E.02175
G3 X89.704 Y100.406 I-.141 J-.746 E.02023
G1 X89.056 Y100.5 E.01579
G3 X88.148 Y100.358 I-.422 J-.276 E.02788
G3 X87.601 Y99.305 I.718 J-1.042 E.02978
G3 X88.034 Y99.086 I.411 J.275 E.01223
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.494 Y99.16 E-.17705
G1 X88.967 Y99.407 E-.20295
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.24 I1.157 J.376 P1  F42000
G1 X90.21 Y95.581 Z13.24
G1 Z12.84
G1 E.4 F1800
G1 F746
M204 S6000
G3 X90.98 Y95.292 I.702 J.702 E.02044
G1 X91.007 Y94.873 E.01013
G1 X91.118 Y94.88 E.0027
G3 X92.467 Y96.573 I.018 J1.369 E.06019
G3 X90.971 Y97.96 I-1.688 J-.32 E.05268
G3 X89.529 Y96.006 I.115 J-1.594 E.06652
G3 X90.949 Y94.869 I1.394 J.286 E.04759
; WIPE_START
G1 F9000
G1 X91.118 Y94.88 E-.06446
G1 X91.369 Y94.897 E-.09562
G1 X91.751 Y95.024 E-.15281
G1 X91.899 Y95.121 E-.06711
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.24 I1.196 J-.226 P1  F42000
G1 X90.794 Y89.274 Z13.24
G1 Z12.84
G1 E.4 F1800
G1 F746
M204 S6000
G3 X91.684 Y88.68 I.985 J.511 E.02695
G1 X91.715 Y88.261 E.01013
G3 X93.077 Y90.236 I-.071 J1.507 E.06692
G3 X91.826 Y91.435 I-1.649 J-.469 E.04381
G3 X90.898 Y88.534 I-.075 J-1.575 E.09953
G3 X91.657 Y88.256 I.87 J1.2 E.01974
; WIPE_START
G1 F9000
G1 X92.049 Y88.288 E-.14944
G1 X92.413 Y88.434 E-.14893
G1 X92.58 Y88.569 E-.08162
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.24 I1.217 J.017 P1  F42000
G1 X92.618 Y85.925 Z13.24
G1 Z12.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.611 Y85.49 I1.145 J1.262 E.0266
G1 X93.667 Y85.073 E.01015
G3 X94.692 Y87.486 I.05 J1.403 E.08158
G3 X92.071 Y87.573 I-1.354 J-1.273 E.07021
G1 X91.556 Y87.421 E.01293
G3 X90.871 Y87.365 I-.311 J-.419 E.01811
G3 X90.209 Y86.355 I1.928 J-1.985 E.02936
G3 X90.697 Y85.984 I.393 J.011 E.01693
G2 X91.982 Y86.019 I.705 J-2.233 E.03141
G3 X93.582 Y85.067 I1.768 J1.15 E.0465
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.994 Y85.097 E-.1571
G1 X94.365 Y85.224 E-.14898
G1 X94.526 Y85.333 E-.07392
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.24 I.504 J-1.108 P1  F42000
G1 X89.125 Y82.878 Z13.24
G1 Z12.84
G1 E.4 F1800
G1 F746
M204 S6000
G3 X89.858 Y82.535 I.803 J.762 E.01999
G1 X89.907 Y82.118 E.01013
G1 X89.987 Y82.127 E.00195
G3 X91.117 Y84.402 I-.229 J1.531 E.07181
G3 X88.414 Y84.105 I-1.314 J-.495 E.08935
G3 X89.85 Y82.111 I1.576 J-.379 E.06725
; WIPE_START
G1 F9000
G1 X89.987 Y82.127 E-.05265
G1 X90.214 Y82.154 E-.08664
G1 X90.554 Y82.292 E-.13953
G1 X90.765 Y82.454 E-.10118
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.24 I-1.001 J-.692 P1  F42000
G1 X88.046 Y86.386 Z13.24
G1 Z12.84
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X88.02 Y86.345 E.00118
G3 X88.479 Y86.287 I.452 J1.745 E.0112
G1 X88.501 Y85.867 E.01013
G3 X89.251 Y86.624 I.069 J.682 E.02941
G3 X88.645 Y87.613 I-.971 J.085 E.02997
G3 X88.048 Y86.93 I.229 J-.803 E.02312
G3 X87.669 Y86.086 I.162 J-.58 E.02545
G3 X88.444 Y85.864 I.665 J.862 E.01989
M106 S124.95
; WIPE_START
G1 X88.89 Y85.938 E-.1721
G1 X89.078 Y86.069 E-.08692
G1 X89.237 Y86.345 E-.12098
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.24 I1.18 J.298 P1  F42000
G1 X91.23 Y78.465 Z13.24
G1 Z12.84
G1 E.4 F1800
M106 S127.5
; FEATURE: Outer wall
G1 F746
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.466 Y107.585 E.00568
G1 X91.866 Y107.585 E.00965
G1 X92.266 Y107.585 E.00965
G1 X92.488 Y107.585 E.00537
M106 S124.95
M106 S127.5
G1 F600
G1 X92.488 Y107.965 E.00916
M106 S124.95
M106 S127.5
G1 F746
G1 X92.266 Y107.965 E.00537
M106 S124.95
G1 X91.866 Y107.965 E.00965
G1 X91.466 Y107.965 E.00965
G1 X91.066 Y107.965 E.00965
G1 X87.445 Y107.965 E.0873
G3 X86.152 Y106.74 I-.001 J-1.295 E.04736
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.291 J-.004 E.04742
G1 X93.85 Y78.085 E.15614
M73 P57 R14
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.24 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z12.84
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461436
G1 F746
M204 S6000
G1 X87.393 Y78.5 E.09713
G2 X87.175 Y78.52 I.078 J2.106 E.00583
; LINE_WIDTH: 0.414999
G1 X86.67 Y78.604 E.01219
; WIPE_START
G1 F12806.612
G1 X87.175 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.24 I-1.217 J-.022 P1  F42000
G1 X86.656 Y107.43 Z13.24
G1 Z12.84
G1 E.4 F1800
; LINE_WIDTH: 0.395523
G1 F746
M204 S6000
G1 X87.148 Y107.525 E.01131
; LINE_WIDTH: 0.46236
G2 X87.456 Y107.55 I.328 J-2.15 E.00827
G1 X91.03 Y107.55 E.09566
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11389.557
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 81/141
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z13.24 I1.217 J-.016 P1  F42000
G1 X89.961 Y102.33 Z13.24
G1 Z13
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F708
M204 S6000
G3 X90.828 Y101.783 I.857 J.399 E.02614
G1 X90.91 Y101.371 E.01013
G1 X91.159 Y101.424 E.00613
G3 X91.51 Y104.436 I-.538 J1.589 E.09129
G3 X89.404 Y102.971 I-.568 J-1.429 E.07314
G3 X90.853 Y101.359 I1.492 J-.116 E.05846
; WIPE_START
G1 F9000
G1 X91.159 Y101.424 E-.11865
G1 X91.595 Y101.635 E-.18436
G1 X91.741 Y101.776 E-.07699
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.4 I.941 J-.771 P1  F42000
G1 X90.455 Y100.206 Z13.4
G1 Z13
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.102 Y100.01 I-.077 J-.277 E.01079
G2 X90.276 Y99.111 I-2.792 J-1.008 E.02218
G3 X90.828 Y99.755 I-1.32 J1.689 E.0206
G3 X91.224 Y100.562 I-.371 J.683 E.0231
G3 X90.367 Y100.618 I-.477 J-.708 E.0217
G3 X89.68 Y99.958 I-.015 J-.672 E.02554
G1 X89.849 Y99.356 E.01508
G3 X90.222 Y99.091 I.381 J.14 E.01173
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.573 Y99.355 E-.16697
G1 X90.828 Y99.755 E-.18032
G1 X90.888 Y99.817 E-.03271
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.4 I-.026 J-1.217 P1  F42000
G1 X88.365 Y99.872 Z13.4
G1 Z13
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X87.993 Y99.088 I.245 J-.597 E.02295
G3 X89.086 Y99.664 I-.346 J1.982 E.03028
G3 X88.674 Y100.753 I-.803 J.319 E.03082
G3 X88.166 Y100.251 I.05 J-.56 E.01868
G3 X87.527 Y99.276 I.527 J-1.042 E.02944
G3 X87.936 Y99.08 I.319 J.142 E.01189
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.289 Y99.147 E-.13681
G1 X88.683 Y99.325 E-.16416
G1 X88.842 Y99.459 E-.07904
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.4 I1.147 J.407 P1  F42000
G1 X90.254 Y95.477 Z13.4
G1 Z13
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.05 Y95.272 I.859 J1.687 E.01998
G1 X91.078 Y94.853 E.01013
G3 X92.372 Y96.913 I.117 J1.363 E.07228
G3 X90.977 Y97.875 I-1.654 J-.906 E.04236
G3 X89.476 Y96.352 I.144 J-1.644 E.05612
G3 X91.021 Y94.849 I1.411 J-.094 E.05908
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.445 Y94.88 E-.16159
G1 X91.787 Y94.994 E-.13706
G1 X91.968 Y95.108 E-.08135
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.4 I1.192 J-.247 P1  F42000
G1 X90.774 Y89.353 Z13.4
G1 Z13
G1 E.4 F1800
G1 F708
M204 S6000
G3 X91.662 Y88.766 I.985 J.524 E.02675
G1 X91.692 Y88.347 E.01013
G1 X91.786 Y88.355 E.00227
G3 X93.044 Y90.285 I-.154 J1.475 E.06362
G1 X92.761 Y90.95 E.01742
G3 X90.576 Y90.983 I-1.105 J-.824 E.06085
G3 X91.635 Y88.342 I1.229 J-1.04 E.08414
; WIPE_START
G1 F9000
G1 X91.786 Y88.355 E-.05768
G1 X92.023 Y88.374 E-.0903
G1 X92.383 Y88.518 E-.14736
G1 X92.558 Y88.656 E-.08465
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.4 I1.216 J.057 P1  F42000
G1 X92.685 Y85.94 Z13.4
G1 Z13
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.684 Y85.467 I1.131 J1.098 E.02724
G1 X93.723 Y85.049 E.01013
G3 X94.74 Y87.453 I.043 J1.399 E.08112
G3 X92.147 Y87.46 I-1.299 J-1.197 E.07019
G1 X91.493 Y87.443 E.0158
G3 X90.974 Y87.463 I-.271 J-.293 E.01363
G2 X90.19 Y86.465 I-19.967 J14.87 E.03059
G3 X90.57 Y85.978 I.265 J-.185 E.01984
G2 X91.605 Y86.192 I6.721 J-29.854 E.02547
G2 X92.455 Y85.558 I-.15 J-1.089 E.02669
G3 X93.656 Y85.044 I1.416 J1.648 E.03199
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.059 Y85.074 E-.15373
G1 X94.421 Y85.199 E-.14542
G1 X94.597 Y85.318 E-.08086
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.4 I.502 J-1.108 P1  F42000
G1 X89.136 Y82.843 Z13.4
G1 Z13
G1 E.4 F1800
G1 F708
M204 S6000
G3 X89.863 Y82.496 I.793 J.728 E.01992
G1 X89.888 Y82.077 E.01013
G3 X90.888 Y84.676 I-.126 J1.541 E.08364
G3 X88.44 Y84.03 I-1.083 J-.86 E.07719
G3 X89.83 Y82.074 I1.55 J-.37 E.06552
; WIPE_START
G1 F9000
G1 X90.186 Y82.107 E-.13609
G1 X90.541 Y82.243 E-.14413
G1 X90.751 Y82.4 E-.09978
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.4 I-1.062 J-.595 P1  F42000
G1 X88.346 Y86.691 Z13.4
G1 Z13
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X88.024 Y86.35 I-.801 J.436 E.01143
G1 X88.273 Y86.338 E.00603
G1 X88.37 Y85.93 E.01013
G3 X89.054 Y86.239 I-.128 J1.195 E.01842
G3 X88.775 Y87.63 I-1.316 J.459 E.03588
G3 X88.236 Y87.35 I-.132 J-.407 E.0163
G2 X87.709 Y86.639 I-1.522 J.576 E.02163
G3 X87.917 Y85.935 I.193 J-.325 E.02413
G1 X88.314 Y85.916 E.00959
M106 S124.95
; WIPE_START
G1 X88.748 Y86.022 E-.16987
G1 X89.054 Y86.239 E-.14264
G1 X89.08 Y86.415 E-.06749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.4 I1.175 J.318 P1  F42000
G1 X91.23 Y78.465 Z13.4
G1 Z13
G1 E.4 F1800
M106 S127.5
; FEATURE: Outer wall
G1 F708
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X91.729 Y107.585 E.01204
G1 X92.129 Y107.585 E.00965
G1 X92.529 Y107.585 E.00965
G1 F600
G1 X92.898 Y107.585 E.0089
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X93.7 Y107.585 E.02084
G1 X93.7 Y107.965 E.00988
G1 X92.898 Y107.965 E.02084
M106 S124.95
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X92.529 Y107.965 E.0089
M106 S124.95
G1 F708
G1 X92.129 Y107.965 E.00965
G1 X91.729 Y107.965 E.00965
G1 X91.329 Y107.965 E.00965
G1 X90.929 Y107.965 E.00965
G1 X87.445 Y107.965 E.08401
G3 X86.152 Y106.74 I-.001 J-1.295 E.04736
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.295 J-.001 E.04736
G1 X93.85 Y78.085 E.15617
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.4 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z13
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461791
G1 F708
M204 S6000
G1 X87.389 Y78.5 E.0973
G2 X87.214 Y78.514 I.117 J2.566 E.00469
; LINE_WIDTH: 0.422111
G1 X86.68 Y78.595 E.0131
; WIPE_START
G1 F12571.735
G1 X87.214 Y78.514 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.4 I-1.217 J-.023 P1  F42000
G1 X86.666 Y107.441 Z13.4
G1 Z13
G1 E.4 F1800
; LINE_WIDTH: 0.409315
G1 F708
M204 S6000
G1 X87.184 Y107.531 E.01233
; LINE_WIDTH: 0.462758
G2 X87.456 Y107.55 I.276 J-2.002 E.00729
G1 X91.03 Y107.55 E.09574
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 13.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.988
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 82/141
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z13.4 I1.217 J-.01 P1  F42000
G1 X89.987 Y102.421 Z13.4
G1 Z13.16
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F705
M204 S6000
G1 X89.987 Y102.421 E0
G3 X90.844 Y101.882 I.847 J.397 E.0258
G1 X90.926 Y101.47 E.01013
G3 X91.501 Y104.489 I-.259 J1.614 E.09643
G3 X89.472 Y102.624 I-.54 J-1.449 E.08202
G3 X90.869 Y101.458 I1.404 J.262 E.04759
; WIPE_START
G1 F9000
G1 X91.25 Y101.539 E-.14781
G1 X91.604 Y101.73 E-.1532
G1 X91.755 Y101.874 E-.07898
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.56 I.969 J-.737 P1  F42000
G1 X90.264 Y99.915 Z13.56
G1 Z13.16
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.384 Y100.067 E.00467
G3 X90.243 Y100.017 I-.04 J-.11 E.00391
G1 X90.24 Y99.055 E.02321
G3 X90.618 Y99.685 I-.392 J.664 E.01849
G3 X91.222 Y100.196 I-52.986 J63.325 E.01908
G3 X91.039 Y100.697 I-.156 J.227 E.01752
G3 X89.958 Y100.346 I.635 J-3.795 E.02753
G3 X89.856 Y99.818 I.381 J-.348 E.01365
G3 X90.069 Y99.058 I.77 J-.193 E.01991
G1 X90.185 Y99.036 E.00285
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.446 Y99.217 E-.12062
G1 X90.618 Y99.685 E-.18966
G1 X90.758 Y99.804 E-.06972
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.56 I.043 J-1.216 P1  F42000
G1 X88.282 Y99.716 Z13.56
G1 Z13.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.46 Y99.888 I-.186 J.369 E.00605
G3 X87.916 Y99.09 I1.157 J-1.372 E.02358
G3 X89.005 Y100.191 I-.2 J1.287 E.03998
G3 X88.509 Y100.755 I-.44 J.113 E.02131
G3 X88.237 Y100.257 I.335 J-.507 E.01425
G1 X87.63 Y99.67 E.02036
G3 X87.487 Y99.157 I.469 J-.408 E.01328
G3 X87.86 Y99.077 I.295 J.471 E.00938
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.332 Y99.235 E-.18904
G1 X88.731 Y99.539 E-.19096
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.56 I1.135 J.439 P1  F42000
G1 X90.341 Y95.375 Z13.56
G1 Z13.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.18 Y95.258 I.771 J2.446 E.02053
G1 X91.212 Y94.839 E.01013
G3 X92.18 Y97.206 I.056 J1.359 E.08024
G3 X90.608 Y97.748 I-1.289 J-1.188 E.04177
G3 X89.538 Y95.608 I.54 J-1.608 E.06404
G3 X90.943 Y94.856 I1.256 J.657 E.04082
G1 X91.154 Y94.835 E.00512
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.831 Y94.971 E-.26217
G1 X92.093 Y95.135 E-.11783
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.56 I1.185 J-.278 P1  F42000
G1 X90.754 Y89.43 Z13.56
G1 Z13.16
G1 E.4 F1800
G1 F705
M204 S6000
G3 X91.638 Y88.848 I1.215 J.884 E.02607
G1 X91.67 Y88.43 E.01013
G1 X91.87 Y88.446 E.00483
G3 X93.037 Y90.219 I-.258 J1.441 E.05729
G3 X90.843 Y91.275 I-1.335 J.033 E.07386
G3 X91.613 Y88.425 I.914 J-1.282 E.09227
; WIPE_START
G1 F9000
M73 P58 R14
G1 X91.87 Y88.446 E-.09804
G1 X92.353 Y88.597 E-.19253
G1 X92.538 Y88.743 E-.08943
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.56 I1.215 J.064 P1  F42000
G1 X92.68 Y86.025 Z13.56
G1 Z13.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.756 Y85.443 I1.201 J.932 E.03037
G1 X93.783 Y85.024 E.01013
G3 X94.788 Y87.413 I.032 J1.393 E.08035
G3 X92.229 Y87.388 I-1.268 J-1.157 E.06964
G1 X91.966 Y86.849 E.01446
G1 X91.615 Y86.97 E.00895
G1 X91.74 Y87.565 E.01467
G3 X91.132 Y87.597 I-.428 J-2.328 E.0147
G3 X90.835 Y87.096 I.414 J-.585 E.01447
G3 X90.136 Y86.388 I1.287 J-1.97 E.0242
G3 X90.091 Y86.059 I.338 J-.214 E.00825
G3 X91.219 Y86.266 I.381 J1.101 E.02894
G1 X91.562 Y86.384 E.00875
G1 X92.108 Y86.189 E.01398
G3 X93.726 Y85.019 I1.774 J.75 E.0506
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.084 Y85.043 E-.13672
G1 X94.422 Y85.149 E-.13435
G1 X94.664 Y85.303 E-.10893
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.56 I.487 J-1.115 P1  F42000
G1 X89.1 Y82.873 Z13.56
G1 Z13.16
G1 E.4 F1800
G1 F705
M204 S6000
G3 X90.042 Y82.454 I.858 J.66 E.02592
G1 X90.147 Y82.047 E.01013
G1 X90.431 Y82.128 E.00713
G3 X89.48 Y85.082 I-.707 J1.403 E.10723
G3 X90.091 Y82.031 I.514 J-1.484 E.10866
; WIPE_START
G1 F9000
G1 X90.431 Y82.128 E-.1343
G1 X90.823 Y82.407 E-.18275
G1 X90.926 Y82.536 E-.06295
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.56 I-1.074 J-.573 P1  F42000
G1 X88.575 Y86.942 Z13.56
G1 Z13.16
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X88.092 Y85.978 I-5.561 J2.188 E.02603
G3 X88.708 Y87.72 I-.051 J.998 E.05683
G3 X88.328 Y87.5 I-.057 J-.34 E.01149
G2 X88.036 Y86.76 I-3.391 J.909 E.01921
G3 X87.481 Y86.153 I.08 J-.63 E.02158
G3 X88.035 Y85.966 I.527 J.646 E.0144
M106 S124.95
; WIPE_START
G1 X88.447 Y86.057 E-.16041
G1 X88.72 Y86.21 E-.11901
G1 X88.893 Y86.401 E-.09768
G1 X88.895 Y86.408 E-.00291
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.56 I1.168 J.343 P1  F42000
G1 X91.23 Y78.465 Z13.56
G1 Z13.16
G1 E.4 F1800
; FEATURE: Outer wall
G1 F705
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X93.7 Y107.585 E.05956
G1 X93.7 Y107.965 E.00916
G1 X87.445 Y107.965 E.15083
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.291 J-.004 E.04742
G1 X93.85 Y78.085 E.15614
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.56 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z13.16
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461438
G1 F705
M204 S6000
G1 X87.393 Y78.5 E.09712
G2 X87.175 Y78.52 I.076 J2.082 E.00584
; LINE_WIDTH: 0.414624
G1 X86.67 Y78.604 E.01219
; WIPE_START
G1 F12819.248
G1 X87.175 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.56 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z13.56
G1 Z13.16
G1 E.4 F1800
; LINE_WIDTH: 0.409968
G1 F705
M204 S6000
G1 X87.186 Y107.531 E.01238
; LINE_WIDTH: 0.462775
G2 X87.456 Y107.55 I.28 J-2.076 E.00726
G1 X91.03 Y107.55 E.09575
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 13.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.512
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 83/141
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z13.56 I1.203 J.181 P1  F42000
G1 X90.806 Y102.39 Z13.56
G1 Z13.32
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F755
M204 S6000
G1 X91.595 Y102.39 E.01904
G1 X91.811 Y102.01 E.01054
G3 X91.435 Y104.558 I-1.072 J1.144 E.07288
G3 X89.465 Y103.112 I-.466 J-1.43 E.06877
G3 X89.881 Y101.97 I1.608 J-.062 E.03006
G1 X91.769 Y101.97 E.04552
; WIPE_START
G1 F9000
G1 X92.137 Y102.461 E-.23327
G1 X92.261 Y102.827 E-.14673
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.72 I1.164 J-.354 P1  F42000
G1 X91.592 Y100.628 Z13.72
G1 Z13.32
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X90.788 Y100.628 E.0194
G3 X90.218 Y100.076 I.271 J-.849 E.01982
G3 X89.957 Y99.742 I.375 J-.562 E.01038
G1 X90.87 Y99.742 E.022
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z13.72 I-.529 J-1.096 P1  F42000
G1 X89.036 Y100.628 Z13.72
G1 Z13.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X88.386 Y100.628 E.01566
G3 X88.345 Y100.369 I.419 J-.199 E.00641
G1 X88.093 Y99.911 E.01261
G1 X87.799 Y99.742 E.00818
G1 X88.799 Y99.742 E.02412
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z13.72 I1.15 J.399 P1  F42000
G1 X90.327 Y95.343 Z13.72
G1 Z13.32
G1 E.4 F1800
; FEATURE: Support
G1 F755
M204 S6000
G3 X91.169 Y95.244 I.876 J3.834 E.02049
G1 X91.192 Y94.825 E.01013
G3 X91.914 Y97.427 I.118 J1.369 E.09182
G3 X89.489 Y95.595 I-.906 J-1.322 E.09642
G3 X90.982 Y94.847 I1.263 J.656 E.04303
G1 X91.134 Y94.822 E.00371
; WIPE_START
G1 F9000
G1 X91.504 Y94.842 E-.14058
G1 X91.902 Y94.965 E-.15864
G1 X92.081 Y95.08 E-.08078
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.72 I1.204 J-.178 P1  F42000
G1 X91.238 Y89.39 Z13.72
G1 Z13.32
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.068 Y89.39 E.02002
G1 X92.284 Y89.174 E.00739
G1 X92.283 Y88.656 E.01247
G3 X92.994 Y89.587 I-.661 J1.243 E.02913
G3 X92.837 Y91.094 I-1.968 J.557 E.03743
G3 X90.581 Y91.06 I-1.115 J-.862 E.06308
G3 X90.61 Y88.97 I1.101 J-1.03 E.05569
G1 X91.894 Y88.97 E.03097
G1 X92.229 Y88.635 E.01142
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.626 Y88.907 E-.18295
G1 X92.855 Y89.22 E-.14736
G1 X92.901 Y89.342 E-.0497
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.72 I1.038 J-.635 P1  F42000
G1 X91.677 Y87.343 Z13.72
G1 Z13.32
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X90.96 Y87.343 E.0173
G2 X90.732 Y86.81 I-1.707 J.415 E.01404
G3 X90.191 Y86.458 I.692 J-1.655 E.01565
G1 X91.391 Y86.457 E.02893
M106 S124.95
M106 S127.5
M204 S10000
G1 X91.945 Y86.457 F42000
G1 F755
M204 S6000
G1 X92.306 Y86.457 E.00872
M204 S10000
G1 X93.027 Y85.734 F42000
; FEATURE: Support
G1 F755
M204 S6000
G3 X93.763 Y85.421 I1.361 J2.176 E.01936
G1 X93.78 Y85.001 E.01013
G3 X94.526 Y87.638 I.054 J1.409 E.09066
G3 X92.536 Y87.557 I-.942 J-1.361 E.05155
G1 X92.536 Y85.624 E.04662
G3 X93.722 Y84.999 I1.346 J1.117 E.03318
; WIPE_START
G1 F9000
G1 X94.095 Y85.01 E-.14181
G1 X94.468 Y85.122 E-.14807
G1 X94.668 Y85.25 E-.09013
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.72 I.5 J-1.11 P1  F42000
G1 X89.166 Y82.771 Z13.72
G1 Z13.32
G1 E.4 F1800
M73 P58 R13
G1 F755
M204 S6000
G3 X90.082 Y82.361 I.95 J.894 E.02484
G1 X90.19 Y81.955 E.01013
G3 X90.6 Y84.779 I-.467 J1.509 E.08585
G1 X89.074 Y84.779 E.0368
G3 X90.135 Y81.939 I.977 J-1.253 E.09704
; WIPE_START
G1 F9000
G1 X90.465 Y82.034 E-.13064
G1 X90.763 Y82.238 E-.13728
G1 X90.948 Y82.468 E-.11209
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.72 I-1.069 J-.581 P1  F42000
G1 X88.779 Y86.457 Z13.72
G1 Z13.32
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X87.548 Y86.457 E.02969
G2 X88.004 Y86.66 I.692 J-.945 E.01213
G1 X88.318 Y87.106 E.01315
G1 X88.321 Y87.343 E.00573
G1 X89.085 Y87.343 E.01841
M106 S124.95
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z13.72 I1.183 J.286 P1  F42000
G1 X91.23 Y78.465 Z13.72
G1 Z13.32
G1 E.4 F1800
; FEATURE: Outer wall
G1 F755
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X93.7 Y107.585 E.05956
G1 X93.7 Y107.965 E.00916
G1 X87.445 Y107.965 E.15083
G3 X86.152 Y106.74 I-.001 J-1.295 E.04736
G1 X86.15 Y79.38 E.6598
M73 P59 R13
G3 X87.375 Y78.086 I1.291 J-.004 E.04742
G1 X93.85 Y78.085 E.15614
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.72 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z13.32
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461776
G1 F755
M204 S6000
G1 X87.393 Y78.5 E.0972
G2 X87.212 Y78.515 I.08 J2.165 E.00485
; LINE_WIDTH: 0.42189
G1 X86.68 Y78.595 E.01304
; WIPE_START
G1 F12578.911
G1 X87.212 Y78.515 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.72 I-1.217 J-.022 P1  F42000
G1 X86.682 Y107.455 Z13.72
G1 Z13.32
G1 E.4 F1800
; LINE_WIDTH: 0.422681
G1 F755
M204 S6000
G1 X87.222 Y107.536 E.01327
; LINE_WIDTH: 0.463062
G2 X87.456 Y107.55 I.227 J-1.837 E.00627
G1 X91.03 Y107.55 E.09581
; CHANGE_LAYER
; Z_HEIGHT: 13.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11370.912
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 84/141
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z13.72 I1.206 J.164 P1  F42000
G1 X90.733 Y102.39 Z13.72
G1 Z13.48
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F843
M204 S6000
G1 X91.518 Y102.39 E.01891
G1 X91.726 Y102.01 E.01046
G3 X91.202 Y104.679 I-.932 J1.203 E.08116
G3 X90.015 Y101.97 I-.148 J-1.55 E.09407
G1 X91.684 Y101.97 E.04024
; WIPE_START
G1 F9000
G1 X91.921 Y102.193 E-.12363
G1 X92.143 Y102.54 E-.15653
G1 X92.229 Y102.788 E-.09984
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.88 I.999 J-.695 P1  F42000
G1 X90.886 Y100.855 Z13.88
G1 Z13.48
G1 E.4 F1800
; FEATURE: Support interface
G1 F843
M204 S6000
G1 X90.886 Y99.067 E.04312
G1 X90 Y99.067 E.02136
G1 X90 Y100.682 E.03894
G1 X89.114 Y100.682 E.02136
G1 X89.114 Y99.067 E.03894
G1 X88.229 Y99.067 E.02136
G1 X88.229 Y100.855 E.04312
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z13.88 I1.159 J.372 P1  F42000
G1 X89.915 Y95.597 Z13.88
G1 Z13.48
G1 E.4 F1800
; FEATURE: Support
G1 F843
M204 S6000
G3 X90.667 Y95.229 I.841 J.766 E.02068
G1 X90.705 Y94.811 E.01013
G1 X90.857 Y94.825 E.00368
G3 X92.306 Y95.183 I.248 J2.107 E.03676
G3 X91.966 Y97.404 I-.903 J.999 E.06411
G3 X89.34 Y96.291 I-.899 J-1.534 E.07983
G3 X90.648 Y94.806 I1.327 J-.15 E.05376
; WIPE_START
G1 F9000
G1 X90.857 Y94.825 E-.07994
G1 X91.578 Y94.837 E-.27404
G1 X91.644 Y94.858 E-.02602
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.88 I1.214 J-.091 P1  F42000
G1 X91.235 Y89.39 Z13.88
G1 Z13.48
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.068 Y89.39 E.02008
G1 X92.233 Y89.225 E.00564
G1 X92.224 Y88.715 E.0123
G3 X93.062 Y89.97 I-.824 J1.457 E.03775
G3 X90.831 Y91.334 I-1.284 J.406 E.08627
G3 X90.207 Y89.522 I1.37 J-1.486 E.04816
G3 X90.664 Y88.97 I1.383 J.681 E.01744
G1 X91.894 Y88.97 E.02965
G1 X92.17 Y88.694 E.00943
M106 S124.95
; WIPE_START
G1 X92.594 Y88.972 E-.1927
G1 X92.822 Y89.281 E-.14565
G1 X92.858 Y89.384 E-.04165
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.88 I.746 J-.962 P1  F42000
G1 X90.886 Y87.855 Z13.88
G1 Z13.48
G1 E.4 F1800
; FEATURE: Support interface
G1 F843
M204 S6000
G1 X90.886 Y86.067 E.04312
G1 X90 Y86.067 E.02136
G1 X90 Y87.682 E.03893
G1 X89.114 Y87.682 E.02136
G1 X89.114 Y86.067 E.03893
G1 X88.229 Y86.067 E.02136
G1 X88.229 Y87.855 E.04312
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z13.88 I1.195 J.228 P1  F42000
G1 X89.215 Y82.697 Z13.88
G1 Z13.48
G1 E.4 F1800
; FEATURE: Support
G1 F843
M204 S6000
G3 X90.105 Y82.267 I.875 J.676 E.02472
G1 X90.215 Y81.862 E.01013
G3 X91.218 Y82.962 I-.335 J1.313 E.03802
G3 X90.449 Y84.779 I-1.49 J.441 E.05154
G1 X89.219 Y84.779 E.02967
G3 X90.159 Y81.846 I.874 J-1.337 E.1003
; WIPE_START
G1 F9000
G1 X90.496 Y81.945 E-.13337
G1 X90.791 Y82.147 E-.13609
G1 X90.973 Y82.374 E-.11054
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.88 I-1.029 J.649 P1  F42000
G1 X93.083 Y85.721 Z13.88
G1 Z13.48
G1 E.4 F1800
G1 F843
M204 S6000
G3 X93.798 Y85.395 I1.326 J1.964 E.01902
G1 X93.807 Y84.976 E.01013
G3 X94.573 Y87.594 I.065 J1.402 E.09023
G3 X92.536 Y87.41 I-.91 J-1.298 E.0536
G1 X92.536 Y85.698 E.04129
G3 X93.749 Y84.975 I1.42 J1.002 E.03508
; WIPE_START
G1 F9000
G1 X94.148 Y84.984 E-.15174
G1 X94.514 Y85.095 E-.14524
G1 X94.697 Y85.214 E-.08302
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.88 I1.083 J-.556 P1  F42000
G1 X91.23 Y78.465 Z13.88
G1 Z13.48
G1 E.4 F1800
; FEATURE: Outer wall
G1 F843
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X93.7 Y107.585 E.05956
G1 X93.7 Y107.965 E.00916
G1 X87.445 Y107.965 E.15083
G3 X86.152 Y106.74 I-.003 J-1.292 E.04739
G1 X86.15 Y79.38 E.6598
G3 X87.375 Y78.086 I1.294 J-.001 E.04739
G1 X93.85 Y78.085 E.15614
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.88 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z13.48
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.46177
G1 F843
M204 S6000
G1 X87.393 Y78.5 E.09719
G2 X87.211 Y78.515 I.078 J2.135 E.00488
; LINE_WIDTH: 0.421776
G1 X86.681 Y78.595 E.013
; WIPE_START
G1 F12582.593
G1 X87.211 Y78.515 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.88 I-1.217 J-.022 P1  F42000
G1 X86.681 Y107.455 Z13.88
G1 Z13.48
G1 E.4 F1800
; LINE_WIDTH: 0.423665
G1 F843
M204 S6000
G1 X87.229 Y107.537 E.01347
; LINE_WIDTH: 0.46314
G2 X87.456 Y107.55 I.238 J-2.16 E.0061
G1 X91.03 Y107.55 E.09583
; CHANGE_LAYER
; Z_HEIGHT: 13.64
; LAYER_HEIGHT: 0.160001
; WIPE_START
G1 F11368.841
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 85/141
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z13.88 I1.208 J.147 P1  F42000
G1 X90.658 Y102.39 Z13.88
G1 Z13.64
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F835
M204 S6000
G1 X91.436 Y102.39 E.01878
G1 X91.626 Y101.997 E.01052
G3 X91.565 Y104.599 I-.879 J1.281 E.07438
G3 X89.566 Y102.845 I-.556 J-1.383 E.07923
G3 X90.148 Y101.97 I1.511 J.375 E.02585
G1 X91.575 Y101.97 E.0344
; WIPE_START
G1 F9000
G1 X91.93 Y102.276 E-.1782
G1 X92.137 Y102.59 E-.14306
G1 X92.19 Y102.736 E-.05874
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.04 I1.143 J-.417 P1  F42000
G1 X91.421 Y100.628 Z14.04
G1 Z13.64
G1 E.4 F1800
; FEATURE: Support interface
G1 F835
M204 S6000
G1 X87.548 Y100.628 E.09341
G1 X87.548 Y99.742 E.02136
G1 X91.421 Y99.742 E.09341
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z14.04 I1.137 J-.433 P1  F42000
G1 X89.826 Y95.554 Z14.04
G1 Z13.64
G1 E.4 F1800
; FEATURE: Support
G1 F835
M204 S6000
G3 X90.613 Y95.22 I.792 J.771 E.02118
G1 X90.647 Y94.801 E.01013
G3 X91.651 Y94.837 I-.628 J31.71 E.02424
G3 X92.037 Y97.377 I-.18 J1.326 E.08298
G3 X89.394 Y96.622 I-.928 J-1.757 E.07321
G3 X90.589 Y94.797 I1.118 J-.572 E.06376
; WIPE_START
G1 F9000
M73 P60 R13
G1 X91.588 Y94.835 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.04 I1.214 J-.082 P1  F42000
G1 X91.222 Y89.39 Z14.04
G1 Z13.64
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.068 Y89.39 E.0204
G1 X92.187 Y89.271 E.00405
G1 X92.172 Y88.767 E.01216
G3 X92.915 Y91.217 I-.885 J1.606 E.06834
G3 X90.578 Y91.076 I-1.119 J-.877 E.06629
G3 X90.079 Y89.798 I3.211 J-1.991 E.03328
G3 X90.215 Y89.313 I.8 J-.038 E.01237
G3 X90.518 Y88.97 I1.149 J.712 E.01108
G1 X91.894 Y88.97 E.03319
G1 X92.118 Y88.746 E.00764
M106 S124.95
; WIPE_START
G1 X92.565 Y89.032 E-.20177
G1 X92.733 Y89.247 E-.10351
G1 X92.831 Y89.417 E-.07472
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.04 I1.006 J-.684 P1  F42000
G1 X91.421 Y87.343 Z14.04
G1 Z13.64
G1 E.4 F1800
; FEATURE: Support interface
G1 F835
M204 S6000
G1 X87.548 Y87.343 E.09341
G1 X87.548 Y86.457 E.02136
G1 X91.421 Y86.457 E.09341
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z14.04 I.492 J1.113 P1  F42000
G1 X93.146 Y85.695 Z14.04
G1 Z13.64
G1 E.4 F1800
; FEATURE: Support
G1 F835
M204 S6000
G3 X93.855 Y85.367 I1.682 J2.699 E.01887
G1 X93.866 Y84.947 E.01013
G3 X94.606 Y87.555 I.048 J1.395 E.08946
G3 X92.536 Y87.264 I-.878 J-1.265 E.05543
G1 X92.536 Y85.777 E.03587
G3 X93.808 Y84.946 I1.533 J.957 E.03783
; WIPE_START
G1 F9000
G1 X94.197 Y84.956 E-.1477
G1 X94.555 Y85.068 E-.14255
G1 X94.752 Y85.198 E-.08975
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.04 I.517 J-1.102 P1  F42000
G1 X89.253 Y82.616 Z14.04
G1 Z13.64
G1 E.4 F1800
G1 F835
M204 S6000
G3 X90.135 Y82.18 I.824 J.558 E.0248
G1 X90.247 Y81.775 E.01013
G1 X90.321 Y81.798 E.00188
G3 X91.279 Y83.314 I-.515 J1.386 E.04646
G3 X90.299 Y84.779 I-1.557 J.019 E.04517
G1 X89.425 Y84.779 E.02108
G3 X89.122 Y82.125 I.645 J-1.418 E.07739
G3 X90.191 Y81.759 I.981 J1.121 E.02795
; WIPE_START
G1 F9000
G1 X90.321 Y81.798 E-.05161
G1 X90.525 Y81.859 E-.08091
G1 X90.819 Y82.059 E-.13495
G1 X91.004 Y82.29 E-.11253
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.04 I1.215 J.072 P1  F42000
G1 X91.23 Y78.465 Z14.04
G1 Z13.64
G1 E.4 F1800
; FEATURE: Outer wall
G1 F835
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X93.7 Y107.585 E.05956
G1 X93.7 Y107.965 E.00916
G1 X87.445 Y107.965 E.15083
G3 X86.152 Y106.738 I-.004 J-1.291 E.04745
G1 X86.15 Y79.38 E.65975
G3 X87.375 Y78.086 I1.291 J-.004 E.04742
G1 X93.85 Y78.085 E.15614
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.04 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z13.64
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461445
G1 F835
M204 S6000
G1 X87.393 Y78.5 E.09711
G2 X87.176 Y78.52 I.072 J2.046 E.00583
; LINE_WIDTH: 0.41415
G1 X86.669 Y78.605 E.0122
; WIPE_START
G1 F12835.233
G1 X87.176 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.04 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z14.04
G1 Z13.64
G1 E.4 F1800
; LINE_WIDTH: 0.409471
G1 F835
M204 S6000
G1 X87.183 Y107.53 E.0123
; LINE_WIDTH: 0.462716
G2 X87.456 Y107.55 I.263 J-1.79 E.00734
G1 X91.03 Y107.55 E.09574
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11380.096
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 86/141
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z14.04 I1.217 J.018 P1  F42000
G1 X90.1 Y102.76 Z14.04
G1 Z13.8
G1 E.4 F1800
M106 S127.5
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F686
M204 S6000
G3 X90.918 Y102.257 I.818 J.414 E.02437
G1 X90.999 Y101.845 E.01013
G1 X91.047 Y101.855 E.00118
G3 X91.581 Y104.63 I-.227 J1.483 E.08891
G3 X90.942 Y101.833 I-.58 J-1.339 E.12352
; WIPE_START
G1 F9000
G1 X91.047 Y101.855 E-.04057
G1 X91.308 Y101.909 E-.10148
G1 X91.65 Y102.088 E-.14689
G1 X91.829 Y102.248 E-.09106
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.2 I1.161 J-.365 P1  F42000
G1 X89.721 Y95.539 Z14.2
G1 Z13.8
G1 E.4 F1800
G1 F686
M204 S6000
G3 X90.513 Y95.206 I.688 J.529 E.02168
G1 X90.601 Y94.795 E.01013
G2 X91.724 Y94.842 I1.008 J-10.76 E.02712
G3 X91.716 Y97.504 I-.2 J1.33 E.09243
G3 X89.819 Y97.187 I-.516 J-2.751 E.04734
G3 X89.505 Y95.123 I.842 J-1.184 E.05619
G3 X90.544 Y94.783 I.932 J1.093 E.02705
; WIPE_START
G1 F9000
G1 X91.039 Y94.86 E-.19036
G1 X91.305 Y94.811 E-.1026
G1 X91.533 Y94.828 E-.08704
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.2 I1.203 J-.184 P1  F42000
G1 X90.685 Y89.272 Z14.2
G1 Z13.8
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.54 Y89.123 I.896 J2.618 E.02102
G1 X91.548 Y88.704 E.01013
G3 X93.131 Y90.142 I-.092 J1.692 E.05583
G3 X90.939 Y91.471 I-1.274 J.372 E.08383
G3 X90.358 Y90.596 I1.433 J-1.581 E.0256
G3 X91.2 Y88.74 I.706 J-.798 E.06543
G1 X91.49 Y88.702 E.00705
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.874 Y88.728 E-.1462
G1 X92.224 Y88.859 E-.14175
G1 X92.417 Y89.004 E-.09205
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.2 I1.183 J.287 P1  F42000
G1 X93.23 Y85.659 Z14.2
G1 Z13.8
G1 E.4 F1800
G1 F686
M204 S6000
G3 X93.938 Y85.338 I.755 J.725 E.0192
G1 X93.952 Y84.918 E.01013
G3 X94.909 Y87.287 I.02 J1.369 E.07937
G3 X92.595 Y87.184 I-1.113 J-1.043 E.06343
G3 X93.471 Y85.011 I1.403 J-.698 E.06384
G1 X93.894 Y84.916 E.01046
; WIPE_START
G1 F9000
G1 X94.24 Y84.928 E-.13158
G1 X94.591 Y85.04 E-.14008
G1 X94.828 Y85.198 E-.10834
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.2 I.528 J-1.097 P1  F42000
G1 X89.281 Y82.529 Z14.2
G1 Z13.8
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.163 Y82.097 I.822 J.562 E.02476
G1 X90.278 Y81.693 E.01013
G3 X91.299 Y83.058 I-.34 J1.319 E.04442
G3 X89.544 Y84.747 I-1.507 J.191 E.06816
G3 X88.946 Y82.275 I.506 J-1.431 E.07272
G3 X90.222 Y81.677 I1.152 J.796 E.03564
M106 S124.95
; WIPE_START
G1 X90.554 Y81.777 E-.1317
G1 X90.845 Y81.976 E-.13386
G1 X91.033 Y82.211 E-.11444
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.2 I1.215 J.064 P1  F42000
G1 X91.23 Y78.465 Z14.2
G1 Z13.8
G1 E.4 F1800
; FEATURE: Outer wall
G1 F686
M204 S5000
G1 X91.23 Y78.915 E.01085
G1 X86.53 Y78.915 E.11334
G1 X86.53 Y107.135 E.68053
G1 X91.23 Y107.135 E.11334
G1 X91.23 Y107.585 E.01085
G1 X93.7 Y107.585 E.05956
G1 X93.7 Y107.965 E.00916
G1 X87.445 Y107.965 E.15083
G3 X86.152 Y106.738 I-.004 J-1.291 E.04746
G1 X86.15 Y79.38 E.65974
G3 X87.375 Y78.086 I1.291 J-.004 E.04743
G1 X93.85 Y78.085 E.15613
M73 P61 R13
G1 X93.85 Y78.465 E.00916
G1 X91.29 Y78.465 E.06173
; WIPE_START
G1 F12000
M204 S6000
G1 X91.23 Y78.915 E-.17251
G1 X90.684 Y78.915 E-.20749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.2 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X91.03 Y78.5
G1 Z13.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.461446
G1 F686
M204 S6000
G1 X87.394 Y78.5 E.09711
G2 X87.176 Y78.52 I.071 J2.037 E.00583
; LINE_WIDTH: 0.414016
G1 X86.669 Y78.605 E.01221
; WIPE_START
G1 F12839.755
G1 X87.176 Y78.52 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.2 I-1.217 J-.021 P1  F42000
G1 X86.666 Y107.441 Z14.2
G1 Z13.8
G1 E.4 F1800
; LINE_WIDTH: 0.409804
G1 F686
M204 S6000
G1 X87.185 Y107.531 E.01235
; LINE_WIDTH: 0.46276
G2 X87.456 Y107.55 I.277 J-2.011 E.00729
G1 X91.03 Y107.55 E.09575
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 13.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11378.916
G1 X90.03 Y107.55 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 87/141
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z14.2 I1.217 J.027 P1  F42000
G1 X90.134 Y102.837 Z14.2
G1 Z13.96
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F976
M204 S6000
G3 X90.94 Y102.343 I.792 J.386 E.02408
G1 X91.02 Y101.93 E.01013
G3 X91.596 Y104.658 I-.17 J1.461 E.0884
G1 X91.302 Y104.756 E.00748
G3 X90.602 Y101.951 I-.262 J-1.425 E.10536
G1 X90.963 Y101.919 E.00875
; WIPE_START
G1 F9000
G1 X91.302 Y101.985 E-.13138
G1 X91.605 Y102.129 E-.12751
G1 X91.85 Y102.334 E-.12111
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.36 I1.157 J-.377 P1  F42000
G1 X89.623 Y95.511 Z14.36
G1 Z13.96
G1 E.4 F1800
G1 F976
M204 S6000
G3 X90.426 Y95.152 I.688 J.46 E.02237
G1 X90.509 Y94.74 E.01013
G3 X91.035 Y94.876 I-.656 J3.63 E.01313
G3 X92.886 Y96.538 I.434 J1.378 E.07225
G3 X90.868 Y97.456 I-1.519 J-.663 E.05855
G3 X89.275 Y95.271 I-.169 J-1.549 E.07891
G3 X90.452 Y94.728 I1.045 J.719 E.03279
; WIPE_START
G1 F9000
G1 X91.035 Y94.876 E-.22859
G1 X91.38 Y94.816 E-.1329
G1 X91.428 Y94.82 E-.0185
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.36 I1.193 J-.241 P1  F42000
G1 X90.372 Y89.594 Z14.36
G1 Z13.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.009 Y89.105 I.686 J.235 E.02051
G1 X91.052 Y88.688 E.01013
G3 X92.51 Y89.138 I-.08 J2.844 E.03725
G3 X92.994 Y91.322 I-1.135 J1.397 E.0582
G1 X92.891 Y91.439 E.00376
G3 X90.693 Y91.221 I-1.012 J-.982 E.06116
G2 X90.129 Y90.372 I-2.646 J1.146 E.0247
G3 X90.995 Y88.682 I.862 J-.625 E.05655
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.818 Y88.788 E-.3152
G1 X91.979 Y88.844 E-.0648
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.36 I1.128 J.458 P1  F42000
G1 X93.279 Y85.641 Z14.36
G1 Z13.96
G1 E.4 F1800
G1 F976
M204 S6000
G3 X93.965 Y85.307 I.75 J.669 E.01887
G1 X93.981 Y84.887 E.01013
G3 X94.627 Y87.494 I-.008 J1.386 E.08836
G3 X92.859 Y85.458 I-.796 J-1.094 E.09694
G3 X93.923 Y84.885 I1.31 J1.158 E.02975
; WIPE_START
G1 F9000
G1 X94.278 Y84.898 E-.13492
G1 X94.622 Y85.011 E-.13762
G1 X94.856 Y85.169 E-.10746
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.36 I.536 J-1.093 P1  F42000
G1 X89.31 Y82.448 Z14.36
G1 Z13.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.19 Y82.018 I.807 J.538 E.02476
G1 X90.308 Y81.615 E.01013
G3 X91.318 Y82.959 I-.409 J1.359 E.0434
G3 X90.551 Y84.537 I-1.823 J.089 E.04414
G3 X88.69 Y82.682 I-.632 J-1.227 E.08384
G3 X90.252 Y81.598 I1.545 J.559 E.0489
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.582 Y81.7 E-.13103
G1 X90.87 Y81.897 E-.13258
G1 X91.062 Y82.136 E-.11639
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.36 I-.949 J-.762 P1  F42000
G1 X86.94 Y87.264 Z14.36
G1 Z13.96
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X86.558 Y87.264 E.00994
M106 S124.95
M106 S127.5
G1 F976
G1 X86.558 Y86.864 E.0104
G1 X86.558 Y86.485 E.00984
G1 F600
G1 X86.94 Y86.485 E.00994
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall

M204 S5000
G1 X90.829 Y86.485 E.10109
G1 X90.829 Y87.264 E.02024
M106 S124.95
M106 S127.5
G1 F3000
G1 X87 Y87.264 E.09953
M106 S124.95
M106 S127.5
; WIPE_START
M204 S6000
G1 X86.558 Y87.264 E-.16815
G1 X86.558 Y86.864 E-.152
G1 X86.558 Y86.706 E-.05985
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.36 I-1.216 J.036 P1  F42000
G1 X86.94 Y99.485 Z14.36
G1 Z13.96
G1 E.4 F1800
G1 F600
M204 S5000
G1 X90.829 Y99.485 E.10109
G1 X90.829 Y100.264 E.02024
M106 S124.95
M106 S127.5
G1 F3000
G1 X86.94 Y100.264 E.10109
M106 S124.95
M106 S127.5
; FEATURE: Inner wall
G1 F600
M204 S6000
G1 X86.558 Y100.264 E.00994
M106 S124.95
M106 S127.5
G1 F976
G1 X86.558 Y99.864 E.0104
G1 X86.558 Y99.485 E.00984
G1 F600
G1 X86.88 Y99.485 E.00838
M106 S124.95
M106 S127.5
M204 S250
G1 X86.571 Y99.085 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X86.94 Y99.085 E.0089
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X91.23 Y99.085 E.1115
G1 X91.23 Y100.665 E.04107
G1 X86.94 Y100.665 E.1115
M106 S124.95
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X86.571 Y100.665 E.0089
M106 S124.95
G1 F747.227
G1 X86.53 Y100.665 E.00099
G1 F976
G1 X86.53 Y101.065 E.00965
G1 X86.53 Y101.465 E.00965
G1 X86.53 Y101.865 E.00965
M106 S127.5
G1 X86.53 Y107.585 E.13794
G1 X93.7 Y107.585 E.17291
G1 X93.7 Y107.965 E.00916
G1 X87.445 Y107.965 E.15083
G3 X86.152 Y106.738 I-.003 J-1.292 E.04744
G1 X86.15 Y79.38 E.65975
G3 X87.375 Y78.086 I1.291 J-.004 E.04743
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y84.885 E.15482
G1 X86.53 Y85.285 E.00965
G1 X86.53 Y85.685 E.00965
G1 X86.53 Y86.085 E.00965
G1 F747.227
G1 X86.571 Y86.085 E.00099
G1 F600
G1 X86.94 Y86.085 E.0089
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X91.23 Y86.085 E.1115
G1 X91.23 Y87.665 E.04107
G1 X86.94 Y87.665 E.1115
M106 S124.95
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P61 R12
G1 X86.571 Y87.665 E.0089
M106 S124.95
G1 F747.227
G1 X86.53 Y87.665 E.00099
G1 F976
G1 X86.53 Y88.065 E.00965
G1 X86.53 Y88.465 E.00965
G1 X86.53 Y88.865 E.00965
G1 X86.53 Y99.066 E.246
; WIPE_START
G1 F12000
M204 S6000
G1 X86.94 Y99.085 E-.15597
G1 X87.53 Y99.085 E-.22403
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.36 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X86.76 Y99.875
G1 Z13.96
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397376
G1 F976
M204 S6000
G1 X90.622 Y99.875 E.08766
; WIPE_START
G1 F13428.273
G1 X89.622 Y99.875 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.36 I1.213 J.093 P1  F42000
G1 X90.622 Y86.875 Z14.36
G1 Z13.96
G1 E.4 F1800
; LINE_WIDTH: 0.397366
G1 F976
M204 S6000
G1 X86.759 Y86.875 E.08768
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 14.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F13428.643
G1 X87.759 Y86.875 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 88/141
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z14.36 I-.884 J.837 P1  F42000
G1 X90.299 Y89.557 Z14.36
G1 Z14.12
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.945 Y89.058 I.674 J.205 E.02099
G1 X90.994 Y88.641 E.01013
G3 X92.496 Y89.201 I-.75 J4.308 E.03888
G3 X92.979 Y91.428 I-.912 J1.364 E.06077
G3 X90.751 Y91.285 I-1.06 J-.918 E.0623
G2 X90.298 Y90.617 I-1.34 J.421 E.01975
G3 X90.936 Y88.634 I.659 J-.882 E.06589
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.291 Y88.675 E-.13551
G1 X91.895 Y88.897 E-.24449
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.52 I1.116 J.486 P1  F42000
G1 X93.323 Y85.615 Z14.52
G1 Z14.12
G1 E.4 F1800
G1 F830
M204 S6000
G3 X93.992 Y85.275 I.766 J.677 E.01853
G1 X94.01 Y84.855 E.01013
G3 X94.656 Y87.447 I-.012 J1.379 E.08765
G3 X92.929 Y85.409 I-.769 J-1.099 E.09562
G3 X93.952 Y84.853 I1.267 J1.111 E.02868
; WIPE_START
G1 F9000
G1 X94.31 Y84.868 E-.13594
G1 X94.649 Y84.981 E-.13576
G1 X94.884 Y85.143 E-.1083
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.52 I.501 J-1.109 P1  F42000
G1 X89.21 Y82.579 Z14.52
G1 Z14.12
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.994 Y81.943 I.995 J.426 E.0253
G1 X89.99 Y81.523 E.01013
G3 X91.336 Y82.866 I.047 J1.298 E.05141
G3 X89.986 Y84.641 I-1.617 J.172 E.05927
G3 X88.609 Y83.043 I-.064 J-1.336 E.05858
G3 X89.932 Y81.523 I1.761 J.198 E.05167
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.28 Y81.524 E-.13242
G1 X90.618 Y81.633 E-.13494
G1 X90.862 Y81.801 E-.11264
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.52 I-1.211 J-.117 P1  F42000
G1 X89.541 Y95.5 Z14.52
G1 Z14.12
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.34 Y95.1 I.745 J.491 E.02257
G1 X90.428 Y94.69 E.01013
G3 X91.059 Y94.89 I-.099 J1.401 E.0161
G3 X92.94 Y96.551 I.46 J1.375 E.07315
G3 X90.915 Y97.407 I-1.461 J-.633 E.05853
G3 X89.097 Y95.439 I-.249 J-1.593 E.07622
G3 X90.361 Y94.677 I1.149 J.477 E.0381
M106 S124.95
; WIPE_START
G1 X90.78 Y94.76 E-.16225
G1 X91.059 Y94.89 E-.11687
G1 X91.321 Y94.847 E-.10088
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.52 I-1.204 J-.175 P1  F42000
G1 X90.138 Y102.961 Z14.52
G1 Z14.12
G1 E.4 F1800
G1 F830
M204 S6000
G3 X90.892 Y102.424 I.788 J.309 E.02359
G1 X90.94 Y102.007 E.01013
G3 X91.611 Y104.68 I-.048 J1.433 E.0893
G1 X91.371 Y104.762 E.00611
G3 X90.882 Y102 I-.341 J-1.364 E.11125
; WIPE_START
G1 F9000
G1 X91.267 Y102.048 E-.14719
G1 X91.621 Y102.206 E-.14747
G1 X91.795 Y102.348 E-.08534
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.52 I1.149 J-.4 P1  F42000
G1 X86.551 Y87.264 Z14.52
G1 Z14.12
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F830
M204 S6000
G1 X86.551 Y86.485 E.02024
G1 X90.829 Y86.485 E.1112
G1 X90.829 Y87.264 E.02024
G1 X86.611 Y87.264 E.10964
; WIPE_START
G1 F11728.231
M73 P62 R12
G1 X86.551 Y86.485 E-.29678
G1 X86.77 Y86.485 E-.08322
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.52 I-1.217 J-.02 P1  F42000
G1 X86.552 Y99.485 Z14.52
G1 Z14.12
G1 E.4 F1800
G1 F830
M204 S6000
G1 X90.829 Y99.485 E.11117
G1 X90.829 Y100.264 E.02024
G1 X86.552 Y100.264 E.11117
G1 X86.552 Y99.545 E.01868
M204 S250
G1 X86.53 Y99.085 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F830
M204 S5000
G1 X91.23 Y99.085 E.11334
G1 X91.23 Y100.665 E.0381
G1 X86.53 Y100.665 E.11334
G1 X86.53 Y107.585 E.16688
G1 X93.7 Y107.585 E.17291
G1 X93.7 Y107.965 E.00916
G1 X87.445 Y107.965 E.15083
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.6598
G3 X87.376 Y78.086 I1.291 J-.004 E.04743
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y86.085 E.18376
G1 X91.23 Y86.085 E.11334
G1 X91.23 Y87.665 E.0381
G1 X86.53 Y87.665 E.11334
G1 X86.53 Y99.025 E.27395
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y99.037 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.52 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X86.76 Y99.875
G1 Z14.12
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397376
G1 F830
M204 S6000
G1 X90.622 Y99.875 E.08766
; WIPE_START
G1 F13428.273
G1 X89.622 Y99.875 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.52 I1.213 J.093 P1  F42000
G1 X90.622 Y86.875 Z14.52
G1 Z14.12
G1 E.4 F1800
; LINE_WIDTH: 0.397366
G1 F830
M204 S6000
G1 X86.759 Y86.875 E.08768
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 14.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F13428.643
G1 X87.759 Y86.875 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 89/141
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z14.52 I-.889 J.831 P1  F42000
G1 X90.229 Y89.519 Z14.52
G1 Z14.28
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.885 Y89.009 I.663 J.176 E.02155
G1 X90.935 Y88.592 E.01013
G3 X91.913 Y89.007 I-.146 J1.703 E.02605
G3 X93.222 Y91.085 I-.455 J1.739 E.06521
G3 X90.809 Y91.345 I-1.275 J-.498 E.07199
G2 X90.226 Y90.573 I-1.412 J.46 E.02376
G3 X90.877 Y88.585 I.666 J-.883 E.06617
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.212 Y88.625 E-.12824
G1 X91.576 Y88.767 E-.14835
G1 X91.798 Y88.925 E-.10341
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.68 I1.102 J.517 P1  F42000
G1 X93.365 Y85.584 Z14.68
G1 Z14.28
G1 E.4 F1800
G1 F829
M204 S6000
G3 X94.02 Y85.243 I.761 J.663 E.01824
G1 X94.041 Y84.823 E.01013
G3 X94.68 Y87.398 I-.013 J1.37 E.08709
G3 X92.99 Y85.359 I-.731 J-1.114 E.09379
G3 X93.983 Y84.821 I1.218 J1.06 E.02784
; WIPE_START
G1 F9000
G1 X94.336 Y84.838 E-.13407
G1 X94.67 Y84.952 E-.13423
G1 X94.912 Y85.119 E-.1117
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.68 I.51 J-1.105 P1  F42000
G1 X89.242 Y82.502 Z14.68
G1 Z14.28
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.021 Y81.871 I.98 J.415 E.02516
G1 X90.02 Y81.451 E.01013
G1 X90.083 Y81.452 E.00152
G3 X91.352 Y82.777 I-.018 J1.287 E.04925
G3 X89.914 Y84.602 I-1.675 J.159 E.06187
G3 X88.659 Y82.923 I.062 J-1.355 E.05779
G3 X89.963 Y81.451 I1.706 J.199 E.05048
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.083 Y81.452 E-.04594
G1 X90.308 Y81.454 E-.08542
G1 X90.632 Y81.557 E-.12915
G1 X90.891 Y81.736 E-.11949
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.68 I-1.21 J-.129 P1  F42000
G1 X89.416 Y95.609 Z14.68
G1 Z14.28
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.144 Y95.055 I.812 J.312 E.02322
G1 X90.147 Y94.635 E.01013
G3 X91.113 Y94.903 I-.018 J1.945 E.02445
G3 X92.993 Y96.568 I.463 J1.371 E.07335
G3 X90.917 Y97.347 I-1.412 J-.607 E.05973
G3 X89.693 Y97.072 I-.43 J-.945 E.03248
G3 X89.189 Y95.089 I.779 J-1.253 E.05452
G3 X90.089 Y94.635 I1.009 J.881 E.02492
M106 S124.95
; WIPE_START
G1 X90.684 Y94.706 E-.2279
G1 X91.048 Y94.873 E-.1521
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.68 I-1.21 J-.132 P1  F42000
G1 X90.16 Y103.042 Z14.68
G1 Z14.28
G1 E.4 F1800
G1 F829
M204 S6000
G3 X90.923 Y102.498 I.949 J.526 E.02335
G1 X90.972 Y102.081 E.01013
G1 X91.06 Y102.093 E.00214
G3 X92.199 Y104.237 I-.166 J1.463 E.06884
G3 X90.914 Y102.074 I-1.143 J-.784 E.13399
; WIPE_START
G1 F9000
G1 X91.06 Y102.093 E-.05576
G1 X91.286 Y102.122 E-.0867
G1 X91.636 Y102.274 E-.14501
G1 X91.826 Y102.427 E-.09253
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.68 I1.149 J-.4 P1  F42000
G1 X86.551 Y87.264 Z14.68
G1 Z14.28
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F829
M204 S6000
G1 X86.551 Y86.485 E.02024
G1 X90.829 Y86.485 E.1112
G1 X90.829 Y87.264 E.02024
G1 X86.611 Y87.264 E.10964
; WIPE_START
G1 F11728.231
G1 X86.551 Y86.485 E-.29678
G1 X86.77 Y86.485 E-.08322
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.68 I-1.217 J-.02 P1  F42000
G1 X86.552 Y99.485 Z14.68
G1 Z14.28
G1 E.4 F1800
G1 F829
M204 S6000
G1 X90.829 Y99.485 E.11117
G1 X90.829 Y100.264 E.02024
G1 X86.552 Y100.264 E.11117
G1 X86.552 Y99.545 E.01868
M204 S250
G1 X86.53 Y99.085 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F829
M204 S5000
G1 X91.23 Y99.085 E.11334
G1 X91.23 Y100.665 E.0381
G1 X86.53 Y100.665 E.11334
G1 X86.53 Y107.585 E.16688
G1 X93.7 Y107.585 E.17291
G1 X93.7 Y107.965 E.00916
G1 X87.445 Y107.965 E.15083
G3 X86.152 Y106.74 I-.003 J-1.292 E.04739
G1 X86.15 Y79.38 E.6598
G3 X87.376 Y78.086 I1.291 J-.004 E.04743
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y86.085 E.18376
G1 X91.23 Y86.085 E.11334
M73 P63 R12
G1 X91.23 Y87.665 E.0381
G1 X86.53 Y87.665 E.11334
G1 X86.53 Y99.025 E.27395
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y99.037 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.68 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X86.76 Y99.875
G1 Z14.28
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397376
G1 F829
M204 S6000
G1 X90.622 Y99.875 E.08766
; WIPE_START
G1 F13428.273
G1 X89.622 Y99.875 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.68 I1.213 J.093 P1  F42000
G1 X90.622 Y86.875 Z14.68
G1 Z14.28
G1 E.4 F1800
; LINE_WIDTH: 0.397366
G1 F829
M204 S6000
G1 X86.759 Y86.875 E.08768
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 14.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F13428.643
G1 X87.759 Y86.875 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 90/141
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z14.68 I-.931 J.783 P1  F42000
G1 X90.173 Y89.745 Z14.68
G1 Z14.44
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.78 Y88.952 I.641 J-.138 E.02738
G1 X90.826 Y88.535 E.01013
G3 X91.966 Y89.125 I-.014 J1.423 E.03211
G3 X93.112 Y91.444 I-.281 J1.581 E.07252
G3 X90.809 Y91.304 I-1.104 J-.855 E.06549
G1 X89.92 Y90.238 E.03346
G3 X90.769 Y88.528 I.875 J-.631 E.05652
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.135 Y88.572 E-.13997
G1 X91.495 Y88.715 E-.14745
G1 X91.679 Y88.875 E-.09258
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.84 I1.081 J.56 P1  F42000
G1 X93.404 Y85.546 Z14.84
G1 Z14.44
G1 E.4 F1800
G1 F829
M204 S6000
G3 X94.052 Y85.212 I.738 J.636 E.01801
G1 X94.075 Y84.792 E.01013
G3 X94.352 Y87.502 I-.05 J1.374 E.09502
G3 X93.042 Y85.309 I-.347 J-1.281 E.08297
G3 X94.018 Y84.789 I1.172 J1.022 E.02725
; WIPE_START
G1 F9000
G1 X94.357 Y84.808 E-.12903
G1 X94.678 Y84.919 E-.12905
G1 X94.942 Y85.101 E-.12192
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.84 I.556 J-1.083 P1  F42000
G1 X89.375 Y82.245 Z14.84
G1 Z14.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.235 Y81.804 I.83 J.559 E.02433
G1 X90.346 Y81.399 E.01013
G3 X91.333 Y83.111 I-.328 J1.33 E.05324
G3 X89.854 Y84.601 I-1.798 J-.305 E.05396
G3 X88.765 Y83.675 I.029 J-1.137 E.03727
G3 X89.961 Y81.388 I1.694 J-.57 E.06952
G1 X90.291 Y81.383 E.00796
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.766 Y81.565 E-.19349
G1 X91.112 Y81.914 E-.18651
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.84 I-1.207 J-.156 P1  F42000
G1 X89.35 Y95.552 Z14.84
G1 Z14.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.094 Y95.007 I.813 J.33 E.02339
G1 X90.153 Y94.591 E.01013
G3 X91.059 Y94.866 I-.064 J1.844 E.02309
G3 X92.909 Y95.567 I.398 J1.741 E.05057
G3 X91.607 Y97.485 I-1.109 J.648 E.06971
G2 X90.655 Y97.512 I-.449 J.995 E.02376
G3 X89.517 Y96.931 I-.164 J-1.085 E.03288
G3 X88.959 Y95.349 I1.034 J-1.254 E.04251
G3 X90.08 Y94.584 I1.12 J.436 E.03479
M106 S124.95
; WIPE_START
G1 X90.576 Y94.652 E-.19045
G1 X91.032 Y94.854 E-.18955
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.84 I-1.211 J-.124 P1  F42000
G1 X90.189 Y103.113 Z14.84
G1 Z14.44
G1 E.4 F1800
G1 F829
M204 S6000
G3 X90.947 Y102.568 I.815 J.334 E.02373
G1 X90.995 Y102.151 E.01013
G3 X92.478 Y103.593 I-.092 J1.578 E.05438
G3 X89.736 Y103.807 I-1.388 J-.11 E.09491
G3 X90.938 Y102.143 I1.299 J-.327 E.05637
; WIPE_START
G1 F9000
G1 X91.305 Y102.189 E-.14068
G1 X91.65 Y102.336 E-.14249
G1 X91.85 Y102.494 E-.09683
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.84 I1.149 J-.4 P1  F42000
G1 X86.551 Y87.264 Z14.84
G1 Z14.44
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F829
M204 S6000
G1 X86.551 Y86.485 E.02024
G1 X90.829 Y86.485 E.1112
G1 X90.829 Y87.264 E.02024
G1 X86.611 Y87.264 E.10964
; WIPE_START
G1 F11728.231
G1 X86.551 Y86.485 E-.29678
G1 X86.77 Y86.485 E-.08322
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.84 I-1.217 J-.02 P1  F42000
G1 X86.552 Y99.485 Z14.84
G1 Z14.44
G1 E.4 F1800
G1 F829
M204 S6000
G1 X90.829 Y99.485 E.11117
G1 X90.829 Y100.264 E.02024
G1 X86.552 Y100.264 E.11117
G1 X86.552 Y99.545 E.01868
M204 S250
G1 X86.53 Y99.085 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F829
M204 S5000
G1 X91.23 Y99.085 E.11334
G1 X91.23 Y100.665 E.0381
G1 X86.53 Y100.665 E.11334
G1 X86.53 Y107.585 E.16688
G1 X93.7 Y107.585 E.17291
G1 X93.7 Y107.965 E.00916
G1 X87.445 Y107.965 E.15083
G3 X86.152 Y106.738 I-.004 J-1.291 E.04745
G1 X86.15 Y79.38 E.65975
G3 X87.374 Y78.086 I1.294 J-.001 E.04736
G1 X93.85 Y78.085 E.15617
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y86.085 E.18376
G1 X91.23 Y86.085 E.11334
G1 X91.23 Y87.665 E.0381
G1 X86.53 Y87.665 E.11334
G1 X86.53 Y99.025 E.27395
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y99.037 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.84 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X86.76 Y99.875
G1 Z14.44
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397376
G1 F829
M204 S6000
G1 X90.622 Y99.875 E.08766
; WIPE_START
G1 F13428.273
G1 X89.622 Y99.875 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z14.84 I1.213 J.093 P1  F42000
G1 X90.622 Y86.875 Z14.84
G1 Z14.44
G1 E.4 F1800
; LINE_WIDTH: 0.397366
G1 F829
M204 S6000
G1 X86.759 Y86.875 E.08768
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.160001
; WIPE_START
G1 F13428.643
G1 X87.759 Y86.875 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 91/141
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z14.84 I-.937 J.777 P1  F42000
G1 X90.111 Y89.712 Z14.84
G1 Z14.6
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.708 Y88.897 I.643 J-.155 E.02772
G1 X90.755 Y88.48 E.01013
G3 X92.015 Y89.228 I-.093 J1.592 E.03672
G3 X93.149 Y91.477 I-.237 J1.53 E.07095
G1 X92.969 Y91.685 E.00664
G3 X90.701 Y91.079 I-.919 J-1.105 E.06621
G2 X89.855 Y90.192 I-20.801 J18.987 E.02957
G3 X90.697 Y88.473 I.881 J-.634 E.05651
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.06 Y88.516 E-.13881
G1 X91.417 Y88.66 E-.14646
G1 X91.619 Y88.807 E-.09474
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15 I1.066 J.588 P1  F42000
G1 X93.443 Y85.501 Z15
G1 Z14.6
G1 E.4 F1800
G1 F779
M204 S6000
G3 X94.088 Y85.182 I.676 J.554 E.0179
G1 X94.114 Y84.762 E.01013
G3 X94.372 Y87.448 I-.078 J1.363 E.09333
G3 X92.879 Y85.593 I-.332 J-1.261 E.07236
G3 X94.056 Y84.759 I1.286 J.567 E.03653
; WIPE_START
G1 F9000
G1 X94.372 Y84.778 E-.12023
G1 X94.699 Y84.894 E-.13173
G1 X94.974 Y85.088 E-.12804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15 I.553 J-1.084 P1  F42000
G1 X89.374 Y82.234 Z15
G1 Z14.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.239 Y81.739 I.833 J.453 E.02529
G1 X90.338 Y81.331 E.01013
G1 X90.509 Y81.375 E.00427
G3 X91.215 Y83.429 I-.561 J1.341 E.05913
G3 X90.34 Y84.504 I-3.518 J-1.971 E.0336
G3 X88.796 Y83.747 I-.511 J-.911 E.0487
G3 X88.753 Y82.697 I22.808 J-1.456 E.02534
G3 X90.282 Y81.317 I1.532 J.16 E.05441
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.509 Y81.375 E-.08929
G1 X90.919 Y81.592 E-.17613
G1 X91.115 Y81.821 E-.11458
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15 I-1.207 J-.159 P1  F42000
G1 X89.277 Y95.812 Z15
G1 Z14.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.013 Y94.966 I.757 J-.084 E.03037
G1 X90.055 Y94.548 E.01013
G3 X91.335 Y94.923 I-.968 J5.676 E.03223
G3 X92.931 Y96.942 I.387 J1.335 E.07934
G3 X91.469 Y97.445 I-1.126 J-.898 E.03935
G2 X90.645 Y97.591 I-.171 J1.43 E.02049
G3 X89.464 Y96.88 I-.148 J-1.09 E.03593
G3 X89.049 Y95.009 I.786 J-1.156 E.05092
G3 X89.997 Y94.543 I1.021 J.88 E.02618
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.408 Y94.586 E-.15671
G1 X90.96 Y94.787 E-.22329
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15 I-1.212 J-.107 P1  F42000
G1 X90.216 Y103.183 Z15
G1 Z14.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.972 Y102.63 I.809 J.314 E.02385
G1 X91.019 Y102.213 E.01013
G1 X91.058 Y102.218 E.00097
G3 X92.552 Y103.594 I-.047 J1.549 E.0534
G3 X91.462 Y104.815 I-1.34 J-.099 E.04244
G3 X89.834 Y102.99 I-.474 J-1.216 E.07644
G3 X90.961 Y102.206 I1.165 J.474 E.03501
M106 S124.95
; WIPE_START
G1 X91.058 Y102.218 E-.0372
G1 X91.324 Y102.249 E-.10149
G1 X91.673 Y102.393 E-.14359
G1 X91.89 Y102.531 E-.09772
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15 I1.149 J-.402 P1  F42000
G1 X86.551 Y87.264 Z15
G1 Z14.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F779
M204 S6000
G1 X86.551 Y86.485 E.02024
G1 X90.829 Y86.485 E.1112
G1 X90.829 Y87.264 E.02024
G1 X86.611 Y87.264 E.10964
; WIPE_START
G1 F11728.231
G1 X86.551 Y86.485 E-.29678
G1 X86.77 Y86.485 E-.08322
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15 I-1.217 J-.02 P1  F42000
G1 X86.552 Y99.485 Z15
G1 Z14.6
G1 E.4 F1800
G1 F779
M204 S6000
G1 X90.829 Y99.485 E.11117
G1 X90.829 Y100.264 E.02024
G1 X86.552 Y100.264 E.11117
M73 P64 R12
G1 X86.552 Y99.545 E.01868
M204 S250
G1 X86.53 Y99.085 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F779
M204 S5000
G1 X91.23 Y99.085 E.11334
G1 X91.23 Y100.665 E.0381
G1 X86.53 Y100.665 E.11334
G1 X86.53 Y107.585 E.16688
G1 X93.7 Y107.585 E.17291
G1 X93.7 Y107.965 E.00916
G1 X87.445 Y107.965 E.15083
G3 X86.152 Y106.738 I-.003 J-1.292 E.04744
G1 X86.15 Y79.38 E.65975
G3 X87.376 Y78.086 I1.291 J-.004 E.04743
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y86.085 E.18376
G1 X91.23 Y86.085 E.11334
G1 X91.23 Y87.665 E.0381
G1 X86.53 Y87.665 E.11334
G1 X86.53 Y99.025 E.27395
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y99.037 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X86.76 Y99.875
G1 Z14.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.397376
G1 F779
M204 S6000
G1 X90.622 Y99.875 E.08766
; WIPE_START
G1 F13428.273
G1 X89.622 Y99.875 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15 I1.213 J.093 P1  F42000
G1 X90.622 Y86.875 Z15
G1 Z14.6
G1 E.4 F1800
; LINE_WIDTH: 0.397366
G1 F779
M204 S6000
G1 X86.759 Y86.875 E.08768
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 14.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F13428.643
G1 X87.759 Y86.875 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 92/141
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z15 I-.943 J.77 P1  F42000
G1 X90.052 Y89.684 Z15
G1 Z14.76
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.64 Y88.841 I.645 J-.177 E.02827
G1 X90.689 Y88.423 E.01013
G3 X91.894 Y89.122 I-.071 J1.51 E.03492
G3 X92.977 Y89.827 I-2.8 J5.487 E.03121
G3 X91.274 Y91.777 I-.876 J.954 E.09651
G3 X90.676 Y90.821 I1.085 J-1.343 E.0277
G1 X90.404 Y90.767 E.0067
G1 X90.361 Y90.679 E.00235
G3 X90.006 Y88.623 I.511 J-1.147 E.05936
G3 X90.628 Y88.416 I.635 J.87 E.01607
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.988 Y88.459 E-.13747
G1 X91.342 Y88.603 E-.1454
G1 X91.548 Y88.755 E-.09713
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.16 I1.054 J.609 P1  F42000
G1 X93.324 Y85.683 Z15.16
G1 Z14.76
G1 E.4 F1800
G1 F828
M204 S6000
G3 X94.07 Y85.15 I1.013 J.63 E.0227
G1 X94.097 Y84.731 E.01013
G3 X93.076 Y86.991 I-.035 J1.345 E.12778
G3 X94.039 Y84.727 I1.145 J-.85 E.07156
; WIPE_START
G1 F9000
G1 X94.382 Y84.75 E-.13052
G1 X94.706 Y84.865 E-.13072
G1 X94.961 Y85.046 E-.11877
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.16 I.555 J-1.083 P1  F42000
G1 X89.39 Y82.193 Z15.16
G1 Z14.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.26 Y81.68 I.843 J.437 E.02566
G1 X90.361 Y81.273 E.01013
G1 X90.609 Y81.338 E.00619
G3 X91.228 Y83.332 I-.65 J1.295 E.0562
G3 X90.801 Y83.909 I-1.439 J-.618 E.01747
G3 X89.469 Y84.625 I-.965 J-.198 E.0416
G3 X88.84 Y83.336 I.124 J-.858 E.04071
G3 X89.952 Y81.274 I1.599 J-.469 E.06265
G1 X90.305 Y81.258 E.00853
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.609 Y81.338 E-.11957
G1 X90.937 Y81.533 E-.14491
G1 X91.136 Y81.763 E-.11552
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.16 I-1.205 J-.169 P1  F42000
G1 X89.212 Y95.513 Z15.16
G1 Z14.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.978 Y94.932 I.705 J.134 E.0254
G1 X90.018 Y94.514 E.01013
G3 X91.041 Y94.91 I-.111 J1.805 E.02686
G3 X92.121 Y94.956 I.201 J7.967 E.02609
G3 X92.421 Y97.401 I-.244 J1.271 E.0786
G3 X91.435 Y97.427 I-.534 J-1.551 E.02416
G3 X90.317 Y97.682 I-1.441 J-3.735 E.02774
G3 X89.383 Y96.786 I.233 J-1.177 E.03297
G3 X89.225 Y94.733 I.692 J-1.086 E.05753
G3 X89.961 Y94.509 I.708 J1.002 E.01887
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.322 Y94.544 E-.13805
G1 X90.736 Y94.698 E-.16776
G1 X90.896 Y94.81 E-.07419
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.16 I-1.213 J-.099 P1  F42000
G1 X90.206 Y103.226 Z15.16
G1 Z14.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.998 Y102.685 I.929 J.511 E.02399
G1 X91.041 Y102.267 E.01013
G3 X92.624 Y103.593 I.053 J1.544 E.05451
G3 X91.491 Y104.83 I-1.363 J-.11 E.04356
G3 X89.701 Y104.061 I-.496 J-1.312 E.05193
G3 X90.984 Y102.261 I1.459 J-.317 E.06001
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.485 Y102.33 E-.19207
G1 X91.85 Y102.464 E-.14788
G1 X91.939 Y102.521 E-.04004
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.16 I.653 J-1.027 P1  F42000
G1 X86.53 Y99.085 Z15.16
G1 Z14.76
G1 E.4 F1800
; FEATURE: Outer wall
G1 F828
M204 S5000
G1 X91.23 Y99.085 E.11334
G1 X91.23 Y100.665 E.0381
G1 X86.53 Y100.665 E.11334
G1 X86.53 Y107.585 E.16688
G1 X92.541 Y107.585 E.14496
G1 X92.941 Y107.585 E.00965
M73 P64 R11
G1 X93.341 Y107.585 E.00965
G1 X93.741 Y107.585 E.00965
G1 X93.85 Y107.585 E.00263
M106 S124.95
M106 S127.5
G1 X93.85 Y107.965 E.00916
M106 S124.95
M106 S127.5
G1 X93.741 Y107.965 E.00263
M106 S124.95
G1 X93.341 Y107.965 E.00965
G1 X92.941 Y107.965 E.00965
G1 X92.541 Y107.965 E.00965
G1 X87.445 Y107.965 E.12288
G3 X86.152 Y106.738 I-.004 J-1.291 E.04745
G1 X86.15 Y79.381 E.65973
G3 X87.376 Y78.086 I1.291 J-.005 E.04745
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y86.085 E.18376
G1 X91.23 Y86.085 E.11334
G1 X91.23 Y87.665 E.0381
G1 X86.53 Y87.665 E.11334
G1 X86.53 Y99.025 E.27395
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y99.037 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.16 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M73 P65 R11
G1 X90.183 Y100.452
G1 Z14.76
G1 E.4 F1800
; FEATURE: Top surface
G1 F828
M204 S2000
G1 X91.018 Y99.617 E.02848
G1 X90.793 Y99.297
G1 X89.638 Y100.452 E.03942
G1 X89.092 Y100.452
G1 X90.248 Y99.297 E.03942
G1 X89.702 Y99.297
G1 X88.547 Y100.452 E.03942
G1 X88.001 Y100.452
G1 X89.157 Y99.297 E.03942
G1 X88.612 Y99.297
G1 X87.456 Y100.452 E.03942
G1 X86.91 Y100.452
G1 X88.066 Y99.297 E.03942
G1 X87.521 Y99.297
G1 X86.365 Y100.452 E.03942
G1 X86.363 Y99.909
G1 X86.975 Y99.297 E.02087
; WIPE_START
G1 F12000
M204 S6000
G1 X86.363 Y99.909 E-.32889
G1 X86.364 Y100.043 E-.05111
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.16 I1.145 J.411 P1  F42000
G1 X91.018 Y87.073 Z15.16
G1 Z14.76
G1 E.4 F1800
G1 F828
M204 S2000
G1 X90.639 Y87.452 E.01294
G1 X90.093 Y87.452
G1 X91.018 Y86.528 E.03154
G1 X90.704 Y86.297
G1 X89.548 Y87.452 E.03942
G1 X89.002 Y87.452
G1 X90.158 Y86.297 E.03942
G1 X89.613 Y86.297
G1 X88.457 Y87.452 E.03942
G1 X87.912 Y87.452
G1 X89.067 Y86.297 E.03942
G1 X88.522 Y86.297
G1 X87.366 Y87.452 E.03942
G1 X86.821 Y87.452
G1 X87.977 Y86.297 E.03942
G1 X87.431 Y86.297
G1 X86.363 Y87.365 E.03644
G1 X86.363 Y86.82
G1 X86.886 Y86.297 E.01784
; CHANGE_LAYER
; Z_HEIGHT: 14.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X86.363 Y86.82 E-.28114
G1 X86.363 Y87.08 E-.09886
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 93/141
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
M204 S10000
G17
G3 Z15.16 I-.702 J.994 P1  F42000
G1 X89.996 Y89.647 Z15.16
G1 Z14.92
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X90.576 Y88.782 I.609 J-.218 E.02917
G1 X90.642 Y88.367 E.01014
G3 X91.929 Y89.296 I-.123 J1.527 E.04025
G3 X93.413 Y90.884 I-.286 J1.755 E.05638
G3 X91.053 Y91.55 I-1.296 J-.08 E.07731
G2 X90.392 Y90.656 I-2.796 J1.377 E.02696
G3 X89.945 Y88.567 I.4 J-1.178 E.06195
G3 X90.563 Y88.358 I.633 J.856 E.01597
; WIPE_START
G1 X90.918 Y88.4 E-.13616
G1 X91.27 Y88.544 E-.14429
G1 X91.48 Y88.7 E-.09955
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.32 I1.038 J.635 P1  F42000
G1 X93.432 Y85.508 Z15.32
G1 Z14.92
G1 E.4 F1800
G1 F600
M204 S6000
G3 X94.027 Y85.126 I.943 J.817 E.01728
G1 X94.028 Y84.706 E.01013
G3 X93.106 Y86.919 I.057 J1.322 E.12826
G3 X93.971 Y84.706 I1.111 J-.841 E.06859
; WIPE_START
G1 F9000
G1 X94.327 Y84.711 E-.13566
G1 X94.665 Y84.815 E-.13418
G1 X94.904 Y84.979 E-.11015
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.32 I.554 J-1.083 P1  F42000
G1 X89.396 Y82.161 Z15.32
G1 Z14.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.297 Y81.631 I.855 J.421 E.0267
G1 X90.404 Y81.224 E.01013
G3 X91.24 Y83.24 I-.363 J1.332 E.06069
G2 X90.674 Y84.398 I17.931 J9.487 E.03108
G3 X89.62 Y84.667 I-.72 J-.621 E.02793
G3 X88.872 Y83.156 I-.071 J-.905 E.0521
G3 X89.975 Y81.218 I1.535 J-.409 E.05958
G1 X90.348 Y81.209 E.009
; WIPE_START
G1 X90.659 Y81.293 E-.1225
G1 X90.953 Y81.478 E-.13194
G1 X91.169 Y81.728 E-.12556
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.32 I-1.204 J-.177 P1  F42000
G1 X89.139 Y95.534 Z15.32
G1 Z14.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.88 Y94.894 I.712 J.075 E.026
G1 X89.917 Y94.476 E.01013
G3 X90.904 Y94.831 I-.069 J1.741 E.0257
G2 X91.799 Y94.936 I.556 J-.882 E.02245
G3 X92.787 Y97.243 I.065 J1.337 E.07845
G3 X91.563 Y97.449 I-.807 J-1.054 E.03115
G1 X91.058 Y97.552 E.01242
G3 X89.365 Y96.762 I-.627 J-.865 E.05481
G3 X89.156 Y94.699 I.637 J-1.106 E.05835
G3 X89.86 Y94.471 I.715 J1.004 E.01811
; WIPE_START
G1 X90.237 Y94.504 E-.14407
G1 X90.638 Y94.65 E-.16205
G1 X90.799 Y94.759 E-.07388
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.32 I-1.216 J-.048 P1  F42000
G1 X90.475 Y102.936 Z15.32
G1 Z14.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.244 Y102.737 I.67 J.998 E.01951
G1 X91.293 Y102.32 E.01013
G3 X92.643 Y103.928 I.031 J1.344 E.05809
G3 X91.326 Y104.842 I-1.351 J-.541 E.04094
G3 X90.146 Y102.646 I-.459 J-1.168 E.08791
G3 X91.236 Y102.313 I1.08 J1.582 E.0279
; WIPE_START
G1 X91.888 Y102.459 E-.25395
G1 X92.171 Y102.632 E-.12605
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.32 I-.803 J-.915 P1  F42000
G1 X86.53 Y107.585 Z15.32
G1 Z14.92
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.004 J-1.291 E.04745
G1 X86.15 Y79.38 E.65975
G3 X87.376 Y78.086 I1.291 J-.004 E.04743
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.32 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 15.08
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 94/141
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
; OBJECT_ID: 15
G1 X90.513 Y102.926 F42000
G1 Z15.08
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X91.301 Y102.754 I1.513 J5.018 E.01946
G1 X91.336 Y102.335 E.01013
G3 X92.713 Y103.92 I.078 J1.323 E.05844
G3 X91.324 Y104.84 I-1.359 J-.543 E.04274
G3 X90.422 Y102.495 I-.491 J-1.157 E.09727
G3 X91.278 Y102.33 I.855 J2.129 E.02115
; WIPE_START
G1 X91.971 Y102.474 E-.26905
G1 X92.222 Y102.625 E-.11095
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.48 I1.112 J-.495 P1  F42000
G1 X89.075 Y95.557 Z15.48
G1 Z15.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.785 Y94.858 I.746 J.047 E.02631
G1 X89.82 Y94.44 E.01013
G3 X90.955 Y94.883 I-.064 J1.839 E.02994
G2 X91.862 Y94.97 I.556 J-1.019 E.02258
G3 X92.834 Y97.268 I.049 J1.334 E.0777
G3 X91.498 Y97.421 I-.799 J-1.068 E.034
G3 X90.617 Y97.84 I-3.046 J-5.267 E.02356
G3 X89.342 Y96.737 I-.135 J-1.131 E.04576
G3 X89.09 Y94.667 I.592 J-1.123 E.05901
G3 X89.762 Y94.435 I.724 J1.012 E.01739
; WIPE_START
G1 X90.154 Y94.467 E-.14953
G1 X90.548 Y94.608 E-.15881
G1 X90.704 Y94.713 E-.07166
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.48 I1.204 J-.179 P1  F42000
G1 X89.945 Y89.608 Z15.48
G1 Z15.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.514 Y88.723 I.608 J-.235 E.02955
G1 X90.557 Y88.305 E.01013
G1 X90.598 Y88.309 E.00098
G3 X91.825 Y89.171 I-.141 J1.505 E.03783
G1 X92.234 Y89.495 E.01259
G3 X93.002 Y91.84 I-.195 J1.362 E.07378
G3 X90.833 Y91.028 I-.813 J-1.129 E.06593
G2 X89.906 Y90.331 I-3.065 J3.113 E.02805
G3 X90.17 Y88.358 I.752 J-.904 E.05725
G1 X90.5 Y88.298 E.00809
; WIPE_START
G1 X90.598 Y88.309 E-.03747
G1 X90.852 Y88.34 E-.09742
G1 X91.201 Y88.483 E-.14316
G1 X91.415 Y88.644 E-.10195
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.48 I1.025 J.656 P1  F42000
G1 X93.464 Y85.443 Z15.48
G1 Z15.08
G1 E.4 F1800
G1 F600
M204 S6000
G3 X94.265 Y85.043 I.994 J.99 E.02198
G1 X94.35 Y84.632 E.01013
G3 X93.704 Y87.257 I-.297 J1.319 E.10373
G3 X94.294 Y84.619 I.538 J-1.265 E.09206
; WIPE_START
G1 F9000
G1 X94.608 Y84.692 E-.1225
G1 X94.885 Y84.863 E-.12369
G1 X95.102 Y85.14 E-.13381
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.48 I.569 J-1.076 P1  F42000
G1 X89.414 Y82.13 Z15.48
G1 Z15.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.296 Y81.576 I.85 J.374 E.02667
G1 X90.4 Y81.169 E.01013
G3 X91.25 Y83.154 I-.319 J1.311 E.06034
G2 X90.87 Y84.187 I1.201 J1.027 E.02713
G3 X89.647 Y84.699 I-.879 J-.383 E.0353
G3 X88.734 Y83.307 I-.175 J-.881 E.05138
G2 X88.96 Y82.11 I-13.7 J-3.211 E.02938
G3 X90.344 Y81.154 I1.321 J.433 E.04357
; WIPE_START
G1 X90.679 Y81.244 E-.1317
G1 X90.961 Y81.422 E-.12664
G1 X91.172 Y81.663 E-.12167
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.48 I-1.198 J-.215 P1  F42000
G1 X86.53 Y107.585 Z15.48
G1 Z15.08
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.381 E.65978
G3 X87.376 Y78.086 I1.294 J-.002 E.04742
G1 X93.85 Y78.085 E.15613
M73 P66 R11
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.48 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 15.24
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 95/141
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; OBJECT_ID: 15
G1 X90.481 Y102.96 F42000
G1 Z15.24
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X91.293 Y102.777 I1.563 J5.04 E.02008
G1 X91.311 Y102.357 E.01013
G3 X92.782 Y103.91 I.19 J1.293 E.06042
G3 X91.358 Y104.827 I-1.35 J-.533 E.0436
G3 X90.265 Y102.593 I-.594 J-1.094 E.0968
G3 X91.253 Y102.353 I1.489 J3.963 E.02459
; WIPE_START
G1 X91.662 Y102.372 E-.15551
G1 X92.052 Y102.485 E-.15431
G1 X92.21 Y102.58 E-.07018
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.64 I1.108 J-.503 P1  F42000
G1 X89.023 Y95.563 Z15.64
G1 Z15.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.713 Y94.827 I.692 J-.043 E.02727
G1 X89.744 Y94.408 E.01013
G1 X89.864 Y94.417 E.0029
G3 X90.986 Y94.997 I-.037 J1.445 E.03152
G2 X92.246 Y95.054 I3.884 J-71.65 E.03041
G3 X93.158 Y96.949 I-.301 J1.312 E.0582
G3 X91.695 Y97.482 I-1.049 J-.605 E.04078
G2 X90.916 Y97.813 I-.005 J1.072 E.02099
G3 X89.319 Y96.713 I-.476 J-1.017 E.0564
G3 X89.025 Y94.636 I.556 J-1.138 E.0596
G3 X89.687 Y94.403 I.723 J1.001 E.01715
; WIPE_START
G1 X89.864 Y94.417 E-.06761
G1 X90.46 Y94.568 E-.23373
G1 X90.632 Y94.683 E-.07866
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.64 I1.205 J-.173 P1  F42000
G1 X89.899 Y89.574 Z15.64
G1 Z15.24
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.455 Y88.661 I.606 J-.257 E.0301
G1 X90.497 Y88.243 E.01013
G3 X91.774 Y89.153 I-.059 J1.433 E.04
G1 X92.13 Y89.536 E.0126
G3 X93.279 Y91.68 I-.091 J1.43 E.07011
G3 X90.892 Y91.06 I-1.026 J-.956 E.07272
G2 X90.147 Y90.502 I-.912 J.442 E.02331
G3 X89.614 Y88.68 I.655 J-1.181 E.05077
G3 X90.44 Y88.237 I.902 J.689 E.0233
; WIPE_START
G1 F9000
G1 X90.789 Y88.277 E-.13364
G1 X91.135 Y88.42 E-.14205
G1 X91.354 Y88.585 E-.10431
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.64 I1.009 J.681 P1  F42000
G1 X93.523 Y85.369 Z15.64
G1 Z15.24
G1 E.4 F1800
G1 F600
M204 S6000
G3 X94.293 Y84.958 I1.069 J1.076 E.02136
G1 X94.383 Y84.548 E.01013
G3 X95.329 Y85.554 I-.172 J1.109 E.03585
G3 X93.334 Y84.948 I-1.211 J.4 E.13432
G3 X94.327 Y84.535 I1.071 J1.171 E.02647
; WIPE_START
G1 F9000
G1 X94.637 Y84.609 E-.12101
G1 X94.916 Y84.784 E-.12527
G1 X95.134 Y85.041 E-.12782
G1 X95.139 Y85.055 E-.00591
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.64 I.599 J-1.06 P1  F42000
G1 X89.55 Y81.897 Z15.64
G1 Z15.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.358 Y81.536 I.684 J.446 E.02257
G1 X90.426 Y81.122 E.01013
G3 X91.42 Y82.335 I-.137 J1.126 E.04176
G3 X91.002 Y83.467 I-1.87 J-.047 E.02965
G3 X90.78 Y84.481 I-1.685 J.163 E.02544
G1 X90.646 Y84.599 E.00429
G3 X89.62 Y84.717 I-.616 J-.829 E.02608
G3 X88.521 Y83.593 I-.193 J-.911 E.04514
G2 X88.908 Y82.742 I-2.202 J-1.515 E.02266
G3 X90.369 Y81.112 I1.382 J-.231 E.06057
; WIPE_START
G1 X90.935 Y81.303 E-.22703
G1 X91.182 Y81.531 E-.12763
G1 X91.214 Y81.589 E-.02534
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.64 I-1.198 J-.216 P1  F42000
G1 X86.53 Y107.585 Z15.64
G1 Z15.24
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.004 J-1.292 E.04744
G1 X86.15 Y79.381 E.65973
G3 X87.376 Y78.086 I1.291 J-.005 E.04745
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.64 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 96/141
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
; OBJECT_ID: 15
G1 X90.577 Y102.949 F42000
G1 Z15.4
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X91.394 Y102.793 I2.215 J9.392 E.02007
G1 X91.408 Y102.373 E.01013
G3 X92.848 Y103.899 I.189 J1.265 E.05936
G3 X91.362 Y104.818 I-1.375 J-.564 E.04504
G3 X89.517 Y103.464 I-.625 J-1.081 E.06972
G3 X90.879 Y102.473 I1.394 J.483 E.04325
G1 X91.35 Y102.371 E.01161
; WIPE_START
G1 X91.747 Y102.384 E-.15099
G1 X92.13 Y102.493 E-.15123
G1 X92.306 Y102.598 E-.07778
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.8 I1.099 J-.522 P1  F42000
G1 X88.972 Y95.578 Z15.8
G1 Z15.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.643 Y94.797 I.679 J-.096 E.02812
G1 X89.672 Y94.378 E.01013
G1 X89.77 Y94.384 E.00239
G3 X91.108 Y95.193 I-.143 J1.748 E.03907
G1 X91.533 Y95.101 E.01047
G3 X93.149 Y97.075 I.416 J1.308 E.07895
G3 X91.68 Y97.482 I-1.002 J-.765 E.03946
G2 X90.599 Y98.01 I133.155 J273.705 E.02902
G3 X89.297 Y96.687 I-.125 J-1.179 E.05143
G3 X88.732 Y94.839 I.557 J-1.18 E.05245
G3 X89.614 Y94.374 I1 J.826 E.02468
; WIPE_START
G1 X89.77 Y94.384 E-.05961
G1 X90.374 Y94.531 E-.23621
G1 X90.559 Y94.654 E-.08418
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.8 I1.206 J-.166 P1  F42000
G1 X89.855 Y89.541 Z15.8
G1 Z15.4
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.399 Y88.598 I.604 J-.28 E.03073
G1 X90.44 Y88.18 E.01013
G3 X91.776 Y89.248 I-.093 J1.486 E.04394
G1 X92.165 Y89.597 E.01261
G3 X93.527 Y91.429 I-.159 J1.54 E.06189
M73 P67 R11
G3 X92.066 Y92.142 I-1.184 J-.573 E.04225
G3 X90.891 Y90.897 I.303 J-1.463 E.04397
G3 X89.796 Y90.226 I35.449 J-59.042 E.03097
G3 X90.057 Y88.235 I.777 J-.911 E.05744
G1 X90.382 Y88.174 E.00797
; WIPE_START
G1 F9000
G1 X90.729 Y88.213 E-.13246
G1 X91.072 Y88.355 E-.14094
G1 X91.295 Y88.525 E-.1066
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.8 I.995 J.701 P1  F42000
G1 X93.556 Y85.317 Z15.8
G1 Z15.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.359 Y84.884 I.76 J.446 E.02312
G1 X94.461 Y84.476 E.01013
G3 X95.372 Y85.867 I-.394 J1.251 E.04341
G3 X93.02 Y85.307 I-1.258 J.064 E.11272
G3 X94.037 Y84.476 I1.668 J1.003 E.03233
G1 X94.405 Y84.461 E.00888
; WIPE_START
G1 X94.675 Y84.533 E-.10588
G1 X94.944 Y84.706 E-.12173
G1 X95.16 Y84.963 E-.12738
G1 X95.186 Y85.023 E-.02501
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.8 I.522 J-1.099 P1  F42000
G1 X89.395 Y82.271 Z15.8
G1 Z15.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.14 Y81.477 I.785 J-.009 E.029
G1 X90.177 Y81.059 E.01013
G3 X91.386 Y82.661 I.148 J1.146 E.05863
G2 X90.977 Y83.651 I15.922 J7.161 E.02584
G3 X89.619 Y84.708 I-.863 J.292 E.05429
G3 X88.474 Y83.541 I-.287 J-.863 E.049
G2 X88.967 Y82.798 I-53.066 J-35.753 E.0215
G3 X89.771 Y81.121 I1.519 J-.303 E.04811
G1 X90.119 Y81.054 E.00854
; WIPE_START
G1 X90.698 Y81.113 E-.22096
G1 X91.019 Y81.265 E-.13527
G1 X91.065 Y81.308 E-.02377
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.8 I-1.199 J-.207 P1  F42000
G1 X86.53 Y107.585 Z15.8
G1 Z15.4
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.381 E.65978
G3 X87.376 Y78.086 I1.294 J-.002 E.04742
G1 X93.85 Y78.085 E.15613
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.8 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 15.56
; LAYER_HEIGHT: 0.160001
; layer num/total_layer_count: 97/141
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
; OBJECT_ID: 15
G1 X90.638 Y102.956 F42000
G1 Z15.56
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G2 X91.47 Y102.805 I-.182 J-3.38 E.02043
G1 X91.481 Y102.385 E.01013
G3 X92.961 Y103.561 I.155 J1.324 E.05064
G3 X91.319 Y104.802 I-1.399 J-.144 E.05569
G3 X90.158 Y102.675 I-.653 J-1.024 E.09598
G3 X91.02 Y102.472 I1.959 J6.402 E.02138
G1 X91.423 Y102.384 E.00995
; WIPE_START
G1 X91.831 Y102.394 E-.15485
G1 X92.206 Y102.499 E-.1481
G1 X92.38 Y102.602 E-.07705
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.96 I1.092 J-.538 P1  F42000
G1 X88.921 Y95.577 Z15.96
G1 Z15.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.574 Y94.769 I.665 J-.131 E.02858
G1 X89.601 Y94.349 E.01013
G1 X89.679 Y94.354 E.00189
G3 X90.928 Y95.05 I-.061 J1.578 E.03578
G1 X91.456 Y95.218 E.01337
G3 X93.365 Y96.59 I.539 J1.264 E.06802
G3 X91.742 Y97.509 I-1.159 J-.155 E.05205
G1 X91.225 Y97.705 E.01335
G3 X89.344 Y97.213 I-.83 J-.666 E.05907
G1 X89.295 Y96.832 E.00926
G3 X88.52 Y95.751 I3.062 J-3.014 E.03222
G3 X89.543 Y94.346 I1.078 J-.29 E.04803
; WIPE_START
G1 X89.679 Y94.354 E-.05177
G1 X89.917 Y94.37 E-.09071
G1 X90.291 Y94.497 E-.14991
G1 X90.483 Y94.624 E-.08762
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.96 I1.207 J-.158 P1  F42000
G1 X89.814 Y89.507 Z15.96
G1 Z15.56
G1 E.4 F1800
G1 F600
M204 S6000
G3 X90.345 Y88.533 I.603 J-.303 E.03139
G1 X90.385 Y88.115 E.01013
G3 X91.726 Y89.216 I-.113 J1.503 E.04457
G2 X92.448 Y89.684 I1.034 J-.805 E.02116
G3 X93.611 Y91.463 I-.366 J1.508 E.05644
M73 P67 R10
G3 X92.046 Y92.143 I-1.169 J-.55 E.04493
G3 X90.967 Y90.954 I.335 J-1.388 E.04111
G1 X90.584 Y90.556 E.01332
G3 X89.727 Y88.325 I.084 J-1.313 E.07233
G3 X90.328 Y88.109 I.63 J.81 E.01566
; WIPE_START
G1 F9000
G1 X90.672 Y88.148 E-.13139
G1 X91.012 Y88.288 E-.1398
G1 X91.239 Y88.462 E-.10881
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.96 I.981 J.72 P1  F42000
G1 X93.686 Y85.127 Z15.96
G1 Z15.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.312 Y84.791 I.788 J.718 E.01746
G1 X94.397 Y84.38 E.01013
G3 X95.347 Y85.991 I-.247 J1.231 E.05088
G3 X92.845 Y86.387 I-1.301 J-.118 E.08337
G3 X92.977 Y85.351 I1.37 J-.352 E.02581
G3 X94.034 Y84.4 I1.774 J.91 E.03505
G3 X94.341 Y84.368 I.461 J2.911 E.00745
; WIPE_START
G1 X94.659 Y84.438 E-.12387
G1 X94.956 Y84.621 E-.13271
G1 X95.166 Y84.87 E-.12342
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.96 I.499 J-1.11 P1  F42000
G1 X89.416 Y82.283 Z15.96
G1 Z15.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.084 Y81.435 I.707 J-.13 E.02944
G1 X90.118 Y81.017 E.01013
G3 X91.551 Y82.06 I.226 J1.195 E.04789
G3 X91.156 Y83.088 I-2.391 J-.328 E.02681
G2 X91.071 Y84.039 I1.733 J.635 E.02329
G3 X89.619 Y84.709 I-.924 J-.094 E.04644
G3 X88.32 Y84.066 I-.313 J-1.001 E.03858
G3 X88.747 Y83.136 I1.075 J-.069 E.0257
G1 X89.012 Y82.691 E.01251
G3 X89.192 Y81.472 I1.96 J-.333 E.03021
G3 X90.06 Y81.012 I.974 J.79 E.02435
; WIPE_START
G1 X90.784 Y81.076 E-.27617
G1 X91.03 Y81.195 E-.10383
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.96 I-1.2 J-.205 P1  F42000
G1 X86.53 Y107.585 Z15.96
G1 Z15.56
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.74 I-.001 J-1.295 E.04736
G1 X86.15 Y79.381 E.65978
G3 X87.376 Y78.086 I1.291 J-.005 E.04745
G1 X93.85 Y78.085 E.15612
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
M73 P68 R10
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z15.96 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 15.72
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 98/141
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
; OBJECT_ID: 15
G1 X90.737 Y102.983 F42000
G1 Z15.72
G1 E.4 F1800
; FEATURE: Support
G1 F600
M204 S6000
G2 X91.263 Y102.882 I.14 J-.691 E.01327
G3 X91.562 Y102.815 I.282 J.558 E.00744
G1 X91.57 Y102.395 E.01013
G1 X91.649 Y102.397 E.00189
G3 X91.906 Y104.767 I.151 J1.183 E.09141
G2 X91.173 Y104.864 I-.231 J1.07 E.0182
G3 X90.46 Y102.584 I-.554 J-1.078 E.10191
G2 X91.513 Y102.394 I-.083 J-3.474 E.02589
; WIPE_START
G1 F9000
G1 X91.649 Y102.397 E-.05175
G1 X91.912 Y102.401 E-.09994
G1 X92.28 Y102.503 E-.14512
G1 X92.468 Y102.615 E-.08318
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.12 I1.083 J-.555 P1  F42000
G1 X88.869 Y95.583 Z16.12
G1 Z15.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.506 Y94.742 I.634 J-.181 E.0295
G1 X89.53 Y94.323 E.01013
G1 X89.59 Y94.326 E.00144
G3 X90.859 Y95.074 I-.053 J1.541 E.03704
G2 X91.991 Y95.147 I.66 J-1.421 E.02797
G3 X92.997 Y97.376 I.098 J1.297 E.0767
G3 X91.611 Y97.476 I-.774 J-1.073 E.03529
G3 X90.581 Y98.183 I-1.968 J-1.762 E.0304
G3 X89.333 Y97.296 I-.155 J-1.104 E.04069
G1 X89.217 Y96.613 E.01671
G3 X88.605 Y94.775 I.562 J-1.209 E.05229
G3 X89.472 Y94.32 I.983 J.818 E.02426
; WIPE_START
G1 X89.59 Y94.326 E-.04466
G1 X89.842 Y94.342 E-.0959
G1 X90.209 Y94.464 E-.14706
G1 X90.412 Y94.597 E-.09239
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.12 I1.208 J-.15 P1  F42000
G1 X89.778 Y89.477 Z16.12
G1 Z15.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.295 Y88.467 I.6 J-.33 E.03223
G1 X90.334 Y88.049 E.01013
G3 X91.664 Y89.232 I-.102 J1.454 E.04619
G2 X92.483 Y89.735 I.957 J-.641 E.02392
G3 X93.746 Y91.176 I-.384 J1.61 E.04929
G3 X92.159 Y92.189 I-1.215 J-.154 E.0518
G3 X91.003 Y90.769 I.279 J-1.408 E.04789
G1 X90.511 Y90.497 E.01356
G3 X89.679 Y88.261 I.111 J-1.314 E.07191
G3 X90.276 Y88.043 I.631 J.802 E.0156
; WIPE_START
G1 X90.617 Y88.08 E-.13047
G1 X90.955 Y88.22 E-.13876
G1 X91.186 Y88.398 E-.11077
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.12 I.969 J.736 P1  F42000
G1 X93.59 Y85.232 Z16.12
G1 Z15.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.336 Y84.716 I.886 J.482 E.0227
G1 X94.411 Y84.302 E.01013
G3 X95.363 Y85.893 I-.241 J1.225 E.05039
G3 X93.177 Y86.959 I-1.416 J-.13 E.07036
G3 X93.211 Y85.051 I.838 J-.94 E.05224
G3 X94.354 Y84.29 I1.288 J.697 E.03446
; WIPE_START
G1 X94.67 Y84.359 E-.12285
G1 X94.953 Y84.528 E-.12528
G1 X95.181 Y84.79 E-.13187
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.12 I.52 J-1.1 P1  F42000
G1 X89.366 Y82.044 Z16.12
G1 Z15.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.051 Y81.399 I.75 J.11 E.02447
G1 X90.085 Y80.98 E.01013
G3 X90.87 Y81.043 I.04 J4.432 E.01901
G3 X91.433 Y82.693 I-.328 J1.033 E.04884
G1 X91.079 Y83.122 E.01342
G1 X91.018 Y83.66 E.01305
G3 X89.619 Y84.709 I-.805 J.384 E.05903
G3 X88.231 Y84.085 I-.39 J-.988 E.04094
G3 X88.788 Y83.096 I1.021 J-.076 E.02901
G2 X88.939 Y82.053 I-1.414 J-.737 E.02591
G3 X90.027 Y80.976 I1.12 J.044 E.04065
; WIPE_START
G1 X90.87 Y81.043 E-.32113
G1 X91.009 Y81.111 E-.05887
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.12 I-1.2 J-.203 P1  F42000
G1 X86.53 Y107.585 Z16.12
G1 Z15.72
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.74 I-.004 J-1.292 E.04739
G1 X86.15 Y79.38 E.6598
G3 X87.376 Y78.086 I1.291 J-.004 E.04744
G1 X93.85 Y78.085 E.15612
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.12 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 15.88
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 99/141
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
; OBJECT_ID: 15
G1 X90.822 Y103.031 F42000
G1 Z15.88
G1 E.4 F1800
; FEATURE: Support
G1 F600
M204 S6000
G1 X91.02 Y103.071 E.00488
G3 X91.65 Y102.822 I.953 J1.491 E.01643
G1 X91.657 Y102.403 E.01013
G1 X91.716 Y102.403 E.00141
G3 X91.983 Y104.746 I.161 J1.168 E.09066
G3 X91.361 Y104.719 I-.259 J-1.188 E.01519
G3 X89.338 Y103.853 I-.776 J-.982 E.0648
G3 X90.956 Y102.63 I1.337 J.088 E.05546
G3 X91.599 Y102.402 I.761 J1.125 E.01663
; WIPE_START
G1 F9000
G1 X91.716 Y102.403 E-.04425
G1 X91.99 Y102.407 E-.10432
G1 X92.351 Y102.506 E-.14218
G1 X92.553 Y102.626 E-.08925
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.28 I1.075 J-.571 P1  F42000
G1 X88.924 Y95.792 Z16.28
G1 Z15.88
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.425 Y94.711 I.545 J-.404 E.03505
G1 X89.457 Y94.292 E.01013
G1 X89.499 Y94.296 E.001
G3 X90.883 Y95.259 I-.036 J1.527 E.04308
G1 X91.465 Y95.385 E.01436
G3 X93.031 Y97.403 I.673 J1.094 E.0906
G3 X91.77 Y97.581 I-.823 J-1.275 E.03169
G1 X91.271 Y97.79 E.01305
G3 X89.326 Y97.388 I-.892 J-.588 E.06145
G2 X89.111 Y96.525 I-2.144 J.077 E.02159
G3 X88.525 Y94.771 I.563 J-1.163 E.04971
G3 X89.4 Y94.288 I.97 J.723 E.02484
; WIPE_START
G1 X89.499 Y94.296 E-.03773
G1 X89.767 Y94.315 E-.10212
G1 X90.129 Y94.434 E-.14485
G1 X90.339 Y94.57 E-.09529
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.28 I1.209 J-.14 P1  F42000
G1 X89.749 Y89.459 Z16.28
G1 Z15.88
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.255 Y88.4 I.592 J-.367 E.03363
G1 X90.287 Y87.981 E.01013
G3 X91.644 Y89.438 I-.112 J1.464 E.05275
G1 X92.117 Y89.754 E.01372
G3 X93.822 Y91.209 I.087 J1.625 E.05963
G1 X93.781 Y91.454 E.00598
G3 X92.267 Y92.224 I-1.161 J-.409 E.04519
G3 X91.071 Y91.289 I.235 J-1.533 E.03827
G1 X91.014 Y90.897 E.00954
G1 X90.663 Y90.462 E.01348
G3 X89.609 Y88.221 I-.064 J-1.338 E.0762
G3 X90.23 Y87.975 I.677 J.805 E.01637
; WIPE_START
G1 X90.566 Y88.012 E-.12865
G1 X90.901 Y88.151 E-.13774
G1 X91.137 Y88.334 E-.11361
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.28 I.958 J.751 P1  F42000
G1 X93.617 Y85.173 Z16.28
G1 Z15.88
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.353 Y84.64 I.805 J.338 E.02306
G1 X94.435 Y84.228 E.01013
G3 X95.376 Y85.803 I-.249 J1.218 E.04977
G3 X93.419 Y87.153 I-1.572 J-.185 E.06488
G3 X93.192 Y85.094 I.466 J-1.093 E.06068
G3 X94.378 Y84.215 I1.242 J.437 E.03779
; WIPE_START
G1 X94.69 Y84.287 E-.12167
G1 X94.971 Y84.458 E-.125
G1 X95.196 Y84.716 E-.1301
G1 X95.2 Y84.724 E-.00323
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.28 I.464 J-1.125 P1  F42000
G1 X89.3 Y82.289 Z16.28
G1 Z15.88
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.57 Y81.505 I1.042 J-.08 E.02058
G3 X89.964 Y81.362 I.435 J.588 E.01024
G1 X89.992 Y80.943 E.01013
G3 X90.955 Y81.013 I.086 J5.501 E.0233
G3 X91.508 Y82.647 I-.324 J1.02 E.04837
G1 X91.108 Y83.162 E.01573
G1 X91.059 Y83.699 E.01301
G3 X89.809 Y84.816 I-.77 J.396 E.05496
G3 X88.728 Y84.717 I.77 J-14.418 E.02618
G3 X88.446 Y83.308 I.228 J-.779 E.04257
G1 X88.757 Y83.098 E.00906
G1 X88.744 Y82.65 E.01083
G1 X88.906 Y82.139 E.01291
G3 X89.934 Y80.939 I1.084 J-.112 E.04263
; WIPE_START
G1 X90.587 Y80.947 E-.24805
G1 X90.929 Y81.008 E-.13195
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.28 I-1.201 J-.199 P1  F42000
G1 X86.53 Y107.585 Z16.28
G1 Z15.88
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.004 J-1.291 E.04745
G1 X86.15 Y79.38 E.65973
G3 X87.376 Y78.086 I1.294 J-.002 E.04742
G1 X93.85 Y78.085 E.15612
M73 P69 R10
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.28 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 16.04
; LAYER_HEIGHT: 0.160001
; layer num/total_layer_count: 100/141
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
; OBJECT_ID: 15
G1 X90.904 Y103.098 F42000
G1 Z16.04
G1 E.4 F1800
; FEATURE: Support
G1 F600
M204 S6000
G1 X91.033 Y103.124 E.00318
G3 X91.736 Y102.828 I1.063 J1.539 E.01852
G1 X91.741 Y102.408 E.01013
G1 X91.783 Y102.409 E.00102
G3 X92.058 Y104.724 I.166 J1.154 E.08977
G3 X91.377 Y104.685 I-.266 J-1.299 E.01663
G3 X89.299 Y103.83 I-.831 J-.934 E.06737
G3 X90.968 Y102.682 I1.314 J.124 E.05568
G3 X91.683 Y102.407 I.884 J1.232 E.01868
; WIPE_START
G1 F9000
G1 X91.783 Y102.409 E-.0381
G1 X92.066 Y102.411 E-.10737
G1 X92.419 Y102.508 E-.13936
G1 X92.635 Y102.636 E-.09518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.44 I1.068 J-.584 P1  F42000
G1 X88.898 Y95.799 Z16.44
G1 Z16.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.365 Y94.676 I.525 J-.44 E.03609
G1 X89.413 Y94.258 E.01014
G3 X90.829 Y95.29 I-.051 J1.557 E.04488
G2 X91.476 Y95.463 I.86 J-1.925 E.01621
G3 X93.06 Y97.43 I.706 J1.053 E.09071
G3 X91.891 Y97.591 I-.717 J-.881 E.02994
G1 X91.361 Y97.743 E.0133
G3 X89.292 Y96.903 I-.981 J-.552 E.07834
G2 X88.716 Y96.232 I-1.083 J.346 E.02193
G3 X89.334 Y94.252 I.695 J-.869 E.06437
; WIPE_START
G1 X89.693 Y94.28 E-.13676
G1 X90.049 Y94.404 E-.14324
G1 X90.27 Y94.547 E-.1
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.44 I1.208 J-.144 P1  F42000
G1 X89.625 Y89.115 Z16.44
G1 Z16.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.365 Y88.35 I.69 J-.073 E.02925
G1 X90.408 Y87.933 E.01013
G3 X91.579 Y89.307 I-.262 J1.41 E.04712
G1 X91.682 Y89.484 E.00493
G1 X92.109 Y89.807 E.01292
G3 X93.895 Y91.239 I.144 J1.649 E.06095
G1 X93.869 Y91.389 E.00367
G3 X92.372 Y92.257 I-1.163 J-.281 E.04664
G3 X91.171 Y91.581 I.245 J-1.841 E.03405
G3 X90.989 Y90.837 I1.109 J-.667 E.01875
G1 X90.608 Y90.402 E.01395
G3 X89.508 Y88.225 I-.045 J-1.344 E.07367
G3 X90.35 Y87.927 I.78 J.866 E.02212
; WIPE_START
G1 X90.852 Y88.082 E-.19962
G1 X91.148 Y88.311 E-.1422
G1 X91.209 Y88.391 E-.03818
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.44 I.978 J.724 P1  F42000
G1 X93.632 Y85.117 Z16.44
G1 Z16.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.366 Y84.567 I.794 J.295 E.02338
G1 X94.454 Y84.156 E.01013
G3 X95.163 Y86.237 I-.334 J1.275 E.0627
G3 X92.845 Y86.788 I-1.306 J-.339 E.07046
G3 X93.183 Y85.117 I1.104 J-.647 E.04502
G3 X94.397 Y84.143 I1.261 J.328 E.04025
; WIPE_START
G1 X94.706 Y84.217 E-.1206
G1 X94.984 Y84.39 E-.1244
G1 X95.208 Y84.647 E-.12969
G1 X95.214 Y84.66 E-.00532
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.44 I.483 J-1.117 P1  F42000
G1 X89.278 Y82.09 Z16.44
G1 Z16.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.908 Y81.329 I.717 J-.048 E.02628
G1 X89.936 Y80.91 E.01013
G3 X91.003 Y80.974 I.092 J7.41 E.02582
G3 X91.343 Y82.896 I-.327 J1.049 E.05796
G1 X91.14 Y83.05 E.00614
G1 X91.035 Y83.611 E.01375
G3 X89.831 Y84.843 I-.711 J.51 E.05889
G2 X88.974 Y84.791 I-.515 J1.394 E.02102
G3 X88.041 Y83.852 I-.039 J-.893 E.03592
G3 X88.673 Y83.125 I1.134 J.348 E.02393
G1 X88.837 Y82.945 E.00588
G1 X88.928 Y82.41 E.01307
G3 X89.878 Y80.906 I1.011 J-.414 E.05013
; WIPE_START
G1 X90.677 Y80.917 E-.30347
G1 X90.875 Y80.951 E-.07653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.44 I-1.201 J-.196 P1  F42000
G1 X86.53 Y107.585 Z16.44
G1 Z16.04
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.004 J-1.291 E.04746
G1 X86.15 Y79.38 E.65974
G3 X87.376 Y78.086 I1.291 J-.004 E.04744
G1 X93.85 Y78.085 E.15612
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.44 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 101/141
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change
; OBJECT_ID: 15
G1 X90.982 Y103.163 F42000
G1 Z16.2
G1 E.4 F1800
; FEATURE: Support
G1 F600
M204 S6000
G1 X91.044 Y103.176 E.00152
G3 X91.818 Y102.832 I1.176 J1.605 E.02058
G1 X91.851 Y102.412 E.01015
G3 X92.13 Y104.701 I.166 J1.141 E.08868
G3 X91.377 Y104.645 I-.272 J-1.435 E.01841
G3 X89.269 Y104.044 I-.882 J-.905 E.06401
G3 X90.978 Y102.733 I1.269 J-.116 E.06189
G3 X91.764 Y102.412 I1.005 J1.336 E.0207
; WIPE_START
G1 F9000
G1 X92.139 Y102.414 E-.14257
G1 X92.466 Y102.502 E-.12871
G1 X92.716 Y102.642 E-.10872
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.6 I1.062 J-.595 P1  F42000
G1 X88.918 Y95.862 Z16.6
G1 Z16.2
G1 E.4 F1800
M73 P70 R10
G1 F9000
M204 S6000
G3 X89.29 Y94.65 I.441 J-.528 E.03888
G1 X89.286 Y94.23 E.01013
G3 X90.799 Y95.687 I.032 J1.481 E.05629
G2 X91.797 Y95.374 I.013 J-1.708 E.02563
G3 X93.021 Y97.565 I.407 J1.21 E.08531
G3 X91.916 Y97.612 I-.614 J-1.429 E.02727
G1 X91.392 Y97.774 E.01322
G3 X89.279 Y97.016 I-1.008 J-.513 E.07881
G2 X88.651 Y96.196 I-1.184 J.256 E.02572
G3 X89.228 Y94.23 I.715 J-.858 E.06254
; WIPE_START
G1 X89.625 Y94.244 E-.15078
G1 X89.974 Y94.368 E-.14103
G1 X90.167 Y94.498 E-.0882
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.6 I1.212 J-.11 P1  F42000
G1 X89.708 Y89.44 Z16.6
G1 Z16.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.116 Y88.296 I.622 J-.423 E.03409
G1 X90.11 Y87.876 E.01013
G3 X91.54 Y89.338 I.042 J1.389 E.05544
G1 X91.736 Y89.596 E.00781
G1 X92.208 Y89.818 E.01258
G3 X93.916 Y90.932 I-.038 J1.926 E.05182
G3 X92.473 Y92.287 I-1.105 J.27 E.05792
G1 X91.639 Y92.008 E.02122
G3 X90.954 Y90.716 I.524 J-1.105 E.03779
G1 X90.516 Y90.335 E.014
G3 X89.475 Y88.168 I-.008 J-1.33 E.07242
G3 X90.052 Y87.876 I.725 J.716 E.01587
; WIPE_START
G1 X90.395 Y87.877 E-.13049
G1 X90.685 Y87.966 E-.11523
G1 X90.98 Y88.161 E-.13428
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.6 I.921 J.795 P1  F42000
G1 X93.651 Y85.068 Z16.6
G1 Z16.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.375 Y84.496 I.765 J.225 E.02373
G1 X94.468 Y84.086 E.01013
G3 X95.097 Y86.259 I-.349 J1.279 E.06537
G3 X92.935 Y86.994 I-1.329 J-.362 E.0649
G3 X93.189 Y85.127 I.933 J-.824 E.05154
G3 X94.412 Y84.072 I1.247 J.21 E.04222
; WIPE_START
G1 X94.714 Y84.149 E-.11852
G1 X94.993 Y84.324 E-.12505
G1 X95.215 Y84.581 E-.12906
G1 X95.223 Y84.598 E-.00736
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.6 I.479 J-1.119 P1  F42000
G1 X89.227 Y82.033 Z16.6
G1 Z16.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.964 Y81.303 I.67 J-.061 E.02856
G1 X89.997 Y80.884 E.01013
G2 X90.72 Y80.888 I.371 J-1.851 E.01754
G3 X91.421 Y82.844 I.033 J1.092 E.06622
G1 X91.161 Y83.039 E.00784
G1 X91.048 Y83.598 E.01377
G3 X89.745 Y84.762 I-.667 J.564 E.06507
G3 X88.528 Y84.731 I-.48 J-4.987 E.02943
G3 X88.247 Y83.371 I.193 J-.749 E.04158
G2 X88.796 Y82.943 I-.441 J-1.133 E.01703
G2 X88.806 Y82.108 I-.858 J-.428 E.02084
G3 X89.939 Y80.88 I1.071 J-.148 E.04605
; WIPE_START
G1 X90.284 Y80.934 E-.13268
G1 X90.72 Y80.888 E-.16641
G1 X90.93 Y80.92 E-.08091
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.6 I-1.201 J-.198 P1  F42000
G1 X86.53 Y107.585 Z16.6
G1 Z16.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.74 I-.001 J-1.294 E.04737
G1 X86.15 Y79.38 E.6598
G3 X87.376 Y78.086 I1.291 J-.004 E.04744
G1 X93.85 Y78.085 E.15612
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.6 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 16.36
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 102/141
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change
; OBJECT_ID: 15
G1 X91.253 Y103.07 F42000
G1 Z16.36
G1 E.4 F1800
; FEATURE: Support
G1 F600
M204 S6000
G3 X91.897 Y102.834 I7.644 J19.875 E.01652
G3 X92.133 Y102.835 I.117 J.493 E.00576
G1 X92.23 Y102.426 E.01013
G3 X92.2 Y104.677 I-.135 J1.124 E.07996
G2 X91.107 Y104.775 I-.266 J3.181 E.0266
G3 X90.234 Y102.718 I-.706 J-.914 E.10178
M73 P70 R9
G2 X91.227 Y102.649 I.146 J-5.034 E.02405
G3 X92.174 Y102.413 I.836 J1.338 E.02392
; WIPE_START
G1 F9000
G1 X92.486 Y102.486 E-.12182
G1 X92.798 Y102.654 E-.13484
G1 X93.026 Y102.885 E-.12333
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.76 I1.047 J-.621 P1  F42000
G1 X88.755 Y95.682 Z16.76
G1 Z16.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.449 Y94.632 I.548 J-.392 E.03914
G1 X89.563 Y94.228 E.01013
G3 X90.65 Y95.307 I-.292 J1.381 E.03903
G1 X90.768 Y95.584 E.00726
G2 X91.845 Y95.431 I.379 J-1.203 E.02714
G3 X93.081 Y97.642 I.376 J1.24 E.08476
G3 X91.972 Y97.635 I-.548 J-.877 E.02822
G2 X91.073 Y98.209 I.289 J1.443 E.02631
G3 X89.251 Y97.298 I-.705 J-.868 E.06177
G1 X89.291 Y96.917 E.00925
G1 X89.026 Y96.416 E.01365
G3 X89.508 Y94.211 I.318 J-1.086 E.0819
; WIPE_START
G1 X89.909 Y94.333 E-.15952
G1 X90.213 Y94.541 E-.13973
G1 X90.352 Y94.701 E-.08074
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.76 I1.205 J-.17 P1  F42000
G1 X89.556 Y89.05 Z16.76
G1 Z16.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.284 Y88.241 I.692 J-.11 E.03004
G1 X90.299 Y87.821 E.01013
G3 X91.442 Y89.459 I-.245 J1.388 E.0535
G1 X91.927 Y89.837 E.01484
G3 X93.609 Y90.38 I.038 J2.756 E.04338
G3 X92.571 Y92.315 I-.704 J.868 E.07448
G2 X91.505 Y91.95 I-4.059 J10.113 E.02717
G3 X90.906 Y90.716 I.556 J-1.033 E.03534
G1 X90.526 Y90.278 E.01398
G3 X89.444 Y88.11 I-.057 J-1.326 E.07364
G3 X90.242 Y87.821 I.742 J.802 E.02102
; WIPE_START
G1 X90.693 Y87.929 E-.17633
G1 X90.96 Y88.104 E-.12118
G1 X91.103 Y88.267 E-.08249
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.76 I.955 J.755 P1  F42000
G1 X93.668 Y85.021 Z16.76
G1 Z16.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.379 Y84.427 I.729 J.15 E.02412
G1 X94.477 Y84.019 E.01013
G1 X94.534 Y84.034 E.00141
G3 X95.27 Y85.909 I-.4 J1.239 E.05554
G2 X94.843 Y86.69 I2.838 J2.057 E.02151
G3 X92.886 Y87.036 I-1.136 J-.718 E.05393
G3 X93.188 Y85.145 I.946 J-.819 E.05261
G3 X94.421 Y84.004 I1.242 J.105 E.04447
; WIPE_START
G1 X94.534 Y84.034 E-.04418
G1 X94.724 Y84.084 E-.07501
G1 X94.997 Y84.259 E-.12304
G1 X95.217 Y84.516 E-.1287
G1 X95.227 Y84.538 E-.00907
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.76 I.48 J-1.118 P1  F42000
G1 X89.183 Y81.945 Z16.76
G1 Z16.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.988 Y81.279 I.673 J-.005 E.02882
G1 X90.09 Y80.872 E.01013
G2 X90.759 Y80.861 I.321 J-.835 E.01654
G3 X91.459 Y82.831 I.066 J1.086 E.06769
G1 X91.186 Y83.041 E.00831
G1 X91.064 Y83.597 E.01372
G3 X90.336 Y85.049 I-.644 J.585 E.05048
G3 X89.688 Y84.716 I.28 J-1.343 E.01778
G1 X88.764 Y84.803 E.02237
G3 X87.837 Y83.886 I-.04 J-.887 E.03531
G3 X88.651 Y83.147 I1.01 J.293 E.02791
G2 X88.761 Y82.07 I-.8 J-.626 E.02752
G3 X90.034 Y80.858 I1.087 J-.133 E.04921
; WIPE_START
G1 X90.299 Y80.925 E-.104
G1 X90.759 Y80.861 E-.1763
G1 X91.019 Y80.898 E-.0997
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.76 I-1.2 J-.202 P1  F42000
G1 X86.53 Y107.585 Z16.76
G1 Z16.36
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.74 I-.004 J-1.292 E.04739
G1 X86.15 Y79.38 E.65979
G3 X87.376 Y78.086 I1.291 J-.005 E.04746
G1 X93.85 Y78.085 E.15612
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
M73 P71 R9
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.76 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 16.52
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 103/141
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change
; OBJECT_ID: 15
G1 X91.286 Y103.13 F42000
G1 Z16.52
G1 E.4 F1800
; FEATURE: Support
G1 F600
M204 S6000
G1 X91.324 Y103.126 E.00093
G3 X92.156 Y102.833 I.994 J1.492 E.0215
G1 X92.245 Y102.422 E.01013
G1 X92.327 Y102.44 E.00202
G3 X92.234 Y104.658 I-.191 J1.103 E.07781
G2 X91.201 Y104.684 I-.319 J7.872 E.02493
G3 X89.192 Y103.733 I-.818 J-.869 E.06891
G3 X90.7 Y102.765 I1.227 J.252 E.04813
G2 X91.562 Y102.509 I.143 J-1.1 E.02235
G3 X92.188 Y102.41 I.532 J1.338 E.01541
; WIPE_START
G1 F9000
G1 X92.327 Y102.44 E-.05381
G1 X92.546 Y102.487 E-.0854
G1 X92.852 Y102.653 E-.1324
G1 X93.052 Y102.857 E-.10839
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.92 I1.043 J-.627 P1  F42000
G1 X88.76 Y95.721 Z16.92
G1 Z16.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.374 Y94.61 I.53 J-.433 E.03924
G1 X89.473 Y94.202 E.01013
G3 X90.576 Y95.573 I-.248 J1.328 E.0462
G1 X90.754 Y95.951 E.01007
G1 X91.377 Y95.897 E.01509
G3 X93.537 Y96.482 I.954 J.759 E.06837
G3 X91.865 Y97.616 I-.99 J.34 E.06592
G1 X91.335 Y97.909 E.0146
G3 X89.272 Y97.548 I-.987 J-.435 E.06913
G3 X89.294 Y96.909 I1.815 J-.256 E.01549
G1 X89.036 Y96.415 E.01344
G3 X88.734 Y94.312 I.31 J-1.118 E.06475
G3 X89.417 Y94.188 I.549 J1.075 E.017
; WIPE_START
G1 X89.797 Y94.287 E-.1491
G1 X90.04 Y94.432 E-.10758
G1 X90.267 Y94.664 E-.12332
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.92 I1.209 J-.135 P1  F42000
G1 X89.676 Y89.379 Z16.92
G1 Z16.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.04 Y88.185 I.601 J-.469 E.03524
G1 X90.032 Y87.765 E.01013
G1 X90.195 Y87.765 E.00394
G3 X91.392 Y89.4 I-.142 J1.36 E.05505
G2 X92.242 Y89.848 I.893 J-.665 E.02395
G3 X93.377 Y90.202 I-1.969 J8.309 E.0287
G3 X93.644 Y92.152 I-.444 J1.054 E.05715
G3 X92.082 Y92.093 I-.735 J-1.241 E.03983
G3 X90.854 Y90.71 I-.032 J-1.208 E.05079
G2 X90.09 Y90.17 I-.998 J.601 E.02323
G3 X89.67 Y87.863 I.31 J-1.248 E.07115
G1 X89.974 Y87.765 E.00769
; WIPE_START
G1 X90.195 Y87.765 E-.08405
G1 X90.643 Y87.871 E-.17501
G1 X90.908 Y88.047 E-.12093
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.92 I.904 J.815 P1  F42000
G1 X93.675 Y84.977 Z16.92
G1 Z16.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.382 Y84.361 I.72 J.112 E.02457
G1 X94.486 Y83.954 E.01013
G3 X95.254 Y85.851 I-.35 J1.246 E.05693
G2 X94.932 Y86.399 I.756 J.813 E.01552
G3 X92.837 Y87.08 I-1.295 J-.421 E.06188
G3 X92.989 Y85.317 I.953 J-.806 E.04741
G2 X93.561 Y84.284 I-36.86 J-21.096 E.02849
G3 X94.43 Y83.938 I.802 J.752 E.02329
; WIPE_START
G1 X94.726 Y84.021 E-.11653
G1 X94.997 Y84.196 E-.12293
G1 X95.216 Y84.453 E-.12805
G1 X95.229 Y84.483 E-.01248
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.92 I.428 J-1.139 P1  F42000
G1 X89.208 Y82.218 Z16.92
G1 Z16.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.914 Y81.252 I.592 J-.308 E.03578
G1 X90.019 Y80.845 E.01013
G1 X90.144 Y80.879 E.00312
G2 X90.844 Y80.838 I.28 J-1.226 E.01715
G3 X91.531 Y82.786 I.061 J1.074 E.06684
G1 X91.118 Y83.069 E.01208
G1 X91.114 Y83.673 E.01456
G3 X89.743 Y84.699 I-.647 J.564 E.06813
G2 X88.656 Y84.806 I.401 J9.638 E.02637
G3 X87.723 Y83.902 I-.039 J-.893 E.03507
G3 X88.676 Y83.137 I1.112 J.409 E.03096
G2 X88.718 Y82.037 I-1.265 J-.599 E.02728
G3 X89.963 Y80.831 I1.078 J-.133 E.04841
; WIPE_START
G1 X90.144 Y80.879 E-.0711
G1 X90.339 Y80.931 E-.07658
G1 X90.844 Y80.838 E-.19542
G1 X90.94 Y80.852 E-.03689
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.92 I-1.201 J-.198 P1  F42000
G1 X86.53 Y107.585 Z16.92
G1 Z16.52
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.74 I-.004 J-1.292 E.04739
G1 X86.15 Y79.38 E.6598
G3 X87.376 Y78.086 I1.294 J-.001 E.04741
G1 X93.85 Y78.085 E.15612
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z16.92 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 16.68
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 104/141
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change
; OBJECT_ID: 15
G1 X91.089 Y103.225 F42000
G1 Z16.68
G1 E.4 F1800
; FEATURE: Support
G1 F600
M204 S6000
G2 X91.965 Y102.852 I-206.659 J-486.184 E.02294
G1 X92.223 Y102.835 E.00625
G1 X92.311 Y102.425 E.01013
G1 X92.396 Y102.443 E.0021
G3 X92.243 Y104.641 I-.206 J1.09 E.07776
G3 X91.574 Y104.563 I-.166 J-1.479 E.0164
G3 X90.377 Y104.994 I-5.206 J-12.574 E.03068
G3 X89.702 Y102.913 I-.128 J-1.108 E.07383
G3 X90.895 Y102.85 I.668 J1.326 E.02964
G3 X91.884 Y102.436 I12.437 J28.367 E.02586
G1 X92.255 Y102.412 E.00896
; WIPE_START
G1 F9000
G1 X92.396 Y102.443 E-.05512
G1 X92.904 Y102.653 E-.20869
G1 X93.118 Y102.872 E-.1162
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.08 I1.039 J-.634 P1  F42000
G1 X88.771 Y95.746 Z17.08
G1 Z16.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.315 Y94.593 I.442 J-.497 E.0412
G1 X89.413 Y94.185 E.01013
G1 X89.46 Y94.196 E.00116
G3 X90.464 Y95.709 I-.193 J1.218 E.04922
G1 X90.824 Y96.187 E.01442
G1 X91.407 Y95.977 E.01494
G3 X93.443 Y96.185 I.957 J.7 E.05954
G3 X93.192 Y97.791 I-1.08 J.654 E.04262
G3 X91.754 Y97.596 I-.572 J-1.18 E.03708
G1 X91.303 Y98.009 E.01474
G3 X89.275 Y97.634 I-.965 J-.45 E.06766
G3 X89.335 Y96.892 I1.508 J-.252 E.01814
G1 X89.05 Y96.405 E.01361
G3 X88.685 Y94.298 I.25 J-1.128 E.06585
G3 X89.357 Y94.171 I.545 J1.05 E.01672
; WIPE_START
G1 X89.46 Y94.196 E-.04022
G1 X89.712 Y94.259 E-.09861
G1 X90.008 Y94.427 E-.12951
G1 X90.213 Y94.638 E-.11166
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.08 I1.211 J-.122 P1  F42000
G1 X89.681 Y89.357 Z17.08
G1 Z16.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.003 Y88.129 I.556 J-.51 E.03638
G1 X89.995 Y87.709 E.01013
G3 X91.321 Y89.509 I.024 J1.371 E.06306
G1 X91.835 Y89.866 E.01508
G3 X92.67 Y90.041 I.155 J1.339 E.02094
G3 X94.105 Y91.628 I.086 J1.365 E.05925
G3 X92.121 Y92.084 I-1.164 J-.52 E.05687
G3 X90.861 Y90.602 I-.14 J-1.157 E.05548
G1 X90.437 Y90.147 E.015
G3 X89.637 Y87.807 I-.077 J-1.281 E.08053
G1 X89.937 Y87.709 E.00761
; WIPE_START
G1 X90.264 Y87.709 E-.12448
G1 X90.596 Y87.813 E-.13195
G1 X90.867 Y87.992 E-.12357
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.08 I.896 J.824 P1  F42000
G1 X93.677 Y84.937 Z17.08
G1 Z16.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.375 Y84.295 I.688 J.048 E.02521
G1 X94.48 Y83.889 E.01013
G3 X94.905 Y86.171 I-.379 J1.251 E.0689
G3 X92.788 Y87.124 I-1.329 J-.126 E.06784
G3 X92.951 Y85.36 I.936 J-.803 E.04765
G1 X93.253 Y84.963 E.01203
G3 X94.425 Y83.873 I1.142 J.053 E.04275
; WIPE_START
G1 X94.722 Y83.958 E-.11741
G1 X94.992 Y84.135 E-.12288
G1 X95.21 Y84.391 E-.12764
G1 X95.223 Y84.42 E-.01207
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.08 I.414 J-1.144 P1  F42000
G1 X89.181 Y82.235 Z17.08
G1 Z16.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.856 Y81.229 I.574 J-.344 E.0365
G1 X89.959 Y80.822 E.01013
G3 X91.286 Y80.87 I-.15 J22.448 E.03204
G3 X91.606 Y82.741 I-.295 J1.013 E.05689
G1 X91.217 Y83 E.01129
G1 X91.118 Y83.224 E.00591
G2 X91.316 Y84.072 I1.178 J.172 E.02149
G3 X89.809 Y84.74 I-.803 J.223 E.05725
G1 X89.259 Y84.652 E.01341
G3 X87.732 Y84.419 I-.607 J-1.143 E.03992
G3 X88.208 Y83.271 I.669 J-.396 E.03475
G1 X88.604 Y83.155 E.00994
G2 X88.677 Y82.007 I-.953 J-.637 E.02907
G3 X89.903 Y80.808 I1.071 J-.132 E.04779
; WIPE_START
G1 X90.519 Y80.868 E-.23511
G1 X90.897 Y80.82 E-.14489
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.08 I-1.201 J-.196 P1  F42000
G1 X86.53 Y107.585 Z17.08
G1 Z16.68
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.004 J-1.291 E.04745
G1 X86.15 Y79.381 E.65973
G3 X87.376 Y78.086 I1.291 J-.005 E.04746
G1 X93.85 Y78.085 E.15611
M73 P72 R9
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.08 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 16.84
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 105/141
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change
; OBJECT_ID: 15
G1 X91.507 Y103.57 F42000
G1 Z16.84
G1 E.4 F1800
; FEATURE: Support
G1 F600
M204 S6000
G1 X91.581 Y103.098 E.01151
G3 X92.284 Y102.838 I.68 J.756 E.01851
G1 X92.372 Y102.427 E.01013
G1 X92.465 Y102.447 E.00229
G3 X92.306 Y104.615 I-.212 J1.074 E.07653
G3 X91.556 Y104.5 I-.162 J-1.447 E.01852
G1 X91.053 Y104.681 E.01289
G3 X89.079 Y103.91 I-.829 J-.79 E.06526
G3 X90.338 Y102.781 I1.031 J-.117 E.04769
G3 X91.156 Y103.062 I-.088 J1.584 E.02113
G1 X91.209 Y102.693 E.009
G2 X91.955 Y102.438 I-.312 J-2.137 E.01914
G1 X92.316 Y102.415 E.0087
; WIPE_START
G1 F9000
G1 X92.465 Y102.447 E-.058
G1 X92.951 Y102.652 E-.20036
G1 X93.173 Y102.881 E-.12164
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.24 I1.036 J-.638 P1  F42000
G1 X88.794 Y95.768 Z17.24
G1 Z16.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.26 Y94.579 I.373 J-.54 E.04239
G1 X89.386 Y94.177 E.01015
G3 X90.394 Y95.7 I-.169 J1.207 E.04976
G2 X90.773 Y96.222 I1.431 J-.639 E.01569
G2 X91.611 Y95.808 I-.14 J-1.335 E.02302
G3 X93.492 Y96.275 I.788 J.848 E.05539
G3 X93.244 Y97.863 I-1.07 J.646 E.0421
G3 X92.074 Y97.82 I-.552 J-.907 E.02991
G1 X91.843 Y97.755 E.00576
G1 X91.322 Y97.997 E.01386
G3 X89.278 Y97.718 I-.992 J-.357 E.06922
G3 X89.379 Y96.832 I1.698 J-.255 E.02174
G1 X89.037 Y96.377 E.01374
G3 X88.624 Y94.273 I.224 J-1.136 E.06602
G3 X89.3 Y94.157 I.547 J1.153 E.01675
; WIPE_START
G1 X89.647 Y94.241 E-.13572
G1 X89.966 Y94.422 E-.13938
G1 X90.158 Y94.621 E-.1049
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.24 I1.21 J-.127 P1  F42000
G1 X89.585 Y89.16 Z17.24
G1 Z16.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.16 Y88.073 I.568 J-.395 E.03654
G1 X90.279 Y87.67 E.01013
G3 X91.279 Y89.435 I-.342 J1.36 E.0547
G2 X92.357 Y89.923 I1.182 J-1.176 E.02916
G2 X93.125 Y90.143 I.678 J-.915 E.01969
G3 X94.17 Y91.6 I-.22 J1.261 E.04791
G3 X92.936 Y92.381 I-1.054 J-.3 E.03854
G3 X92.109 Y92.043 I.198 J-1.666 E.02183
G3 X90.806 Y90.599 I-.196 J-1.133 E.05588
G2 X90.298 Y90.069 I-1.342 J.778 E.01786
G3 X89.605 Y87.75 I.038 J-1.275 E.07691
G3 X90.224 Y87.653 I.458 J.897 E.01536
; WIPE_START
G1 X90.55 Y87.754 E-.12986
G1 X90.853 Y87.955 E-.13798
G1 X91.046 Y88.178 E-.11217
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.24 I.949 J.762 P1  F42000
G1 X93.686 Y84.891 Z17.24
G1 Z16.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.362 Y84.232 I.734 J.075 E.02472
G1 X94.471 Y83.826 E.01013
G1 X94.542 Y83.846 E.00177
G3 X94.85 Y86.106 I-.434 J1.21 E.06766
G3 X93 Y87.348 I-1.386 J-.067 E.06235
G3 X93.024 Y85.315 I.627 J-1.009 E.05883
G1 X93.266 Y84.878 E.01204
G3 X94.416 Y83.81 I1.076 J.005 E.0424
; WIPE_START
G1 X94.542 Y83.846 E-.04986
G1 X94.982 Y84.074 E-.18843
G1 X95.198 Y84.328 E-.12633
G1 X95.214 Y84.364 E-.01538
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.24 I.393 J-1.152 P1  F42000
G1 X89.269 Y82.338 Z17.24
G1 Z16.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.8 Y81.209 I.437 J-.484 E.04015
G1 X89.901 Y80.801 E.01013
G1 X90.193 Y80.875 E.00726
G3 X91.373 Y80.853 I.634 J2.276 E.02877
G3 X91.68 Y82.697 I-.304 J.999 E.05589
G3 X91.128 Y82.988 I-.833 J-.91 E.01521
G2 X91.194 Y83.805 I.837 J.343 E.02052
G3 X89.966 Y84.903 I-.615 J.549 E.0624
G1 X89.724 Y84.594 E.00945
G2 X88.424 Y84.807 I32.19 J201.179 E.03179
G3 X88.086 Y83.297 I-.051 J-.781 E.05345
G3 X89.368 Y83.35 I.578 J1.554 E.03177
G1 X89.509 Y83 E.0091
G3 X89.186 Y80.908 I.305 J-1.118 E.06435
G3 X89.845 Y80.787 I.529 J1.025 E.01639
; WIPE_START
G1 X90.193 Y80.875 E-.13644
G1 X90.831 Y80.813 E-.24356
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.24 I-1.202 J-.193 P1  F42000
G1 X86.53 Y107.585 Z17.24
G1 Z16.84
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.6598
G3 X87.376 Y78.086 I1.291 J-.004 E.04745
G1 X93.85 Y78.085 E.15611
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.24 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 106/141
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
G1 X91.2 Y103.269 F42000
G1 Z17
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G2 X91.88 Y102.936 I-.015 J-.893 E.01885
G3 X92.408 Y102.833 I.449 J.893 E.01313
G1 X92.496 Y102.422 E.01013
G3 X93.012 Y104.373 I-.154 J1.084 E.06188
G3 X91.611 Y104.461 I-.795 J-1.471 E.03494
G1 X91.081 Y104.587 E.01313
G3 X89.863 Y105.054 I-.916 J-.567 E.03379
G3 X89.117 Y104.195 I.499 J-1.186 E.02842
G3 X90.233 Y102.743 I.903 J-.461 E.05513
G2 X91.683 Y102.561 I.609 J-1.018 E.03795
G3 X92.439 Y102.41 I.649 J1.278 E.01884
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.723 Y102.473 E-.11056
G1 X93.007 Y102.637 E-.12451
G1 X93.221 Y102.876 E-.122
G1 X93.246 Y102.931 E-.02292
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.4 I1.038 J-.635 P1  F42000
G1 X88.901 Y95.831 Z17.4
G1 Z17
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.945 Y94.515 I.31 J-.649 E.04015
G1 X88.933 Y94.095 E.01013
G3 X90.327 Y95.673 I.113 J1.305 E.05898
G2 X90.444 Y95.98 I.601 J-.053 E.00802
G1 X90.847 Y96.394 E.01394
G1 X91.391 Y96.087 E.01505
G3 X93.394 Y96.156 I.987 J.462 E.06133
G3 X93.293 Y97.933 I-.978 J.836 E.0474
G3 X91.926 Y97.78 I-.578 J-1.026 E.03544
G2 X90.996 Y98.506 I.748 J1.918 E.02884
G3 X89.281 Y97.801 I-.679 J-.787 E.05523
G3 X89.401 Y96.814 I1.964 J-.262 E.02423
G1 X89.053 Y96.323 E.01451
G3 X88.875 Y94.095 I.151 J-1.133 E.07493
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.186 Y94.097 E-.11803
G1 X89.579 Y94.221 E-.15653
M73 P73 R9
G1 X89.82 Y94.358 E-.10544
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.4 I1.216 J-.055 P1  F42000
G1 X89.582 Y89.127 Z17.4
G1 Z17
G1 E.4 F1800
G1 F634
M204 S6000
G3 X90.122 Y88.017 I.541 J-.423 E.037
G1 X90.241 Y87.614 E.01013
G3 X91.236 Y89.295 I-.333 J1.332 E.0524
G2 X91.871 Y89.855 I.734 J-.191 E.02167
G3 X92.857 Y90.16 I-.581 J3.623 E.02497
G3 X94.211 Y91.691 I.108 J1.269 E.05722
G3 X92.147 Y92.007 I-1.138 J-.532 E.05946
G3 X90.775 Y90.518 I-.297 J-1.102 E.06002
G2 X89.875 Y89.925 I-1.166 J.791 E.02667
G3 X89.328 Y87.877 I.492 J-1.229 E.05929
G3 X90.185 Y87.597 I.736 J.799 E.02241
; WIPE_START
G1 F9000
G1 X90.506 Y87.696 E-.12773
G1 X90.803 Y87.893 E-.13574
G1 X91.004 Y88.125 E-.11653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.4 I.971 J-.734 P1  F42000
G1 X88.085 Y84.261 Z17.4
G1 Z17
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.363 Y83.645 I.27 J-.249 E.02068
G1 X88.368 Y83.225 E.01013
G3 X89.331 Y83.554 I.165 J1.091 E.02551
G1 X89.888 Y83.707 E.01393
G3 X91.027 Y85.109 I.595 J.68 E.07008
G3 X89.837 Y84.706 I-.39 J-.804 E.03358
G1 X89.587 Y84.582 E.00673
G2 X88.662 Y84.783 I-.102 J1.756 E.02311
G3 X88.31 Y83.225 I-.289 J-.754 E.06677
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.721 Y83.229 E-.15622
G1 X89.018 Y83.309 E-.11669
G1 X89.239 Y83.483 E-.10709
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.4 I1.207 J-.152 P1  F42000
G1 X89.026 Y81.782 Z17.4
G1 Z17
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.747 Y81.191 I.678 J.092 E.02474
G1 X89.845 Y80.783 E.01013
G1 X89.911 Y80.799 E.00164
G2 X90.717 Y80.821 I.445 J-1.541 E.01965
G3 X92.138 Y82.082 I.371 J1.012 E.05605
G3 X90.176 Y82.964 I-1.474 J-.656 E.05676
G3 X88.887 Y81.082 I-.351 J-1.142 E.07309
G3 X89.789 Y80.769 I.822 J.912 E.02365
M106 S124.95
; WIPE_START
G1 X89.911 Y80.799 E-.04783
G1 X90.561 Y80.883 E-.24896
G1 X90.717 Y80.821 E-.06371
G1 X90.768 Y80.815 E-.01949
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.4 I-.985 J.714 P1  F42000
G1 X93.694 Y84.853 Z17.4
G1 Z17
G1 E.4 F1800
G1 F634
M204 S6000
G3 X94.343 Y84.17 I.684 J0 E.02509
G1 X94.455 Y83.765 E.01013
G1 X94.61 Y83.81 E.00391
G3 X95.095 Y85.775 I-.482 J1.161 E.05671
G3 X94.271 Y87.172 I-4.618 J-1.781 E.03929
G3 X92.404 Y86.66 I-.79 J-.778 E.05671
G3 X92.988 Y85.365 I1.377 J-.159 E.03599
G1 X93.269 Y84.949 E.01209
G3 X94.399 Y83.748 I1.076 J-.12 E.04521
; WIPE_START
G1 F9000
G1 X94.61 Y83.81 E-.08352
G1 X94.967 Y84.015 E-.15622
G1 X95.184 Y84.27 E-.1274
G1 X95.198 Y84.301 E-.01286
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.4 I-1.14 J-.425 P1  F42000
G1 X86.53 Y107.585 Z17.4
G1 Z17
G1 E.4 F1800
; FEATURE: Outer wall
G1 F634
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.004 J-1.291 E.04745
G1 X86.15 Y79.38 E.65975
G3 X87.376 Y78.086 I1.291 J-.004 E.04745
G1 X93.85 Y78.085 E.15611
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
M73 P73 R8
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.4 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 17.16
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 107/141
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change
; OBJECT_ID: 15
G1 X91.341 Y103.273 F42000
G1 Z17.16
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G2 X92.268 Y102.784 I-3.724 J-8.197 E.02528
G1 X92.431 Y102.768 E.00394
G1 X92.513 Y102.356 E.01013
G3 X93.305 Y104.223 I-.27 J1.216 E.05712
G3 X91.741 Y104.453 I-.957 J-1.075 E.04036
G2 X90.786 Y104.941 I-.078 J1.027 E.02719
G3 X89.145 Y104.271 I-.626 J-.811 E.05165
G3 X90.513 Y102.807 I.834 J-.592 E.06753
G2 X90.958 Y102.956 I.327 J-.237 E.01209
G2 X91.76 Y102.556 I-.212 J-1.429 E.02195
G3 X92.457 Y102.344 I.655 J.901 E.0179
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.751 Y102.411 E-.1148
G1 X93.015 Y102.57 E-.11705
G1 X93.228 Y102.811 E-.12214
G1 X93.257 Y102.873 E-.02601
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.56 I1.024 J-.658 P1  F42000
G1 X88.681 Y95.758 Z17.56
G1 Z17.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.913 Y94.433 I.567 J-.583 E.03818
G1 X89.077 Y94.433 E.00396
G1 X89.201 Y94.032 E.01013
G3 X90.252 Y95.61 I-.31 J1.345 E.05039
G2 X90.254 Y95.943 I.159 J.165 E.00899
G1 X90.561 Y96.365 E.01258
G1 X90.824 Y96.444 E.00664
G1 X91.384 Y96.113 E.01569
G3 X93.406 Y96.202 I.996 J.382 E.06424
G3 X93.341 Y98.001 I-.95 J.867 E.04812
G3 X92.039 Y97.884 I-.564 J-1.032 E.03344
G2 X91.64 Y97.937 I-.143 J.452 E.01001
G1 X91.236 Y98.241 E.01221
G3 X89.283 Y97.883 I-.93 J-.434 E.06507
G3 X89.538 Y96.8 I1.593 J-.198 E.02741
G1 X89.129 Y96.294 E.01568
G3 X88.043 Y94.901 I-.06 J-1.073 E.05
G3 X89.146 Y94.013 I1.047 J.172 E.03737
M106 S124.95
; WIPE_START
G1 X89.458 Y94.118 E-.12516
G1 X89.973 Y94.548 E-.25484
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.56 I1.167 J.345 P1  F42000
G1 X91.051 Y90.899 Z17.56
G1 Z17.16
G1 E.4 F1800
M106 S127.5
G1 F684
M204 S6000
G3 X91.841 Y90.298 I.766 J.187 E.02591
G1 X91.918 Y89.885 E.01013
G1 X92.024 Y89.905 E.00259
G2 X93.038 Y90.22 I3.804 J-10.469 E.02562
G3 X94.12 Y91.982 I.08 J1.164 E.06127
G3 X92.405 Y92.154 I-.944 J-.783 E.04607
G3 X91.179 Y91.853 I2.246 J-11.796 E.03046
G3 X91.861 Y89.875 I.54 J-.92 E.07063
; WIPE_START
G1 F9000
G1 X92.024 Y89.905 E-.06287
G1 X92.583 Y90.127 E-.2284
G1 X92.811 Y90.173 E-.08873
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.56 I.577 J-1.071 P1  F42000
G1 X89.466 Y88.371 Z17.56
G1 Z17.16
G1 E.4 F1800
G1 F684
M204 S6000
G3 X90.084 Y87.961 I.541 J.144 E.01957
G1 X90.201 Y87.558 E.01013
G3 X90.823 Y89.727 I-.275 J1.253 E.06652
G3 X89.008 Y88.736 I-.597 J-1.065 E.05949
G3 X90.146 Y87.541 I1.022 J-.166 E.04605
; WIPE_START
G1 F9000
G1 X90.463 Y87.638 E-.12577
G1 X90.756 Y87.832 E-.13352
G1 X90.963 Y88.072 E-.12071
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.56 I1.193 J-.242 P1  F42000
G1 X90.213 Y84.376 Z17.56
G1 Z17.16
G1 E.4 F1800
G1 F684
M204 S6000
G3 X90.537 Y83.979 I.313 J-.075 E.01428
G1 X90.605 Y83.565 E.01013
G1 X90.805 Y83.604 E.00491
G3 X91.241 Y84.985 I-.233 J.833 E.04137
G3 X90.277 Y83.593 I-.591 J-.621 E.07133
G1 X90.548 Y83.553 E.00661
; WIPE_START
G1 F9000
G1 X90.805 Y83.604 E-.09929
G1 X91.081 Y83.752 E-.11924
G1 X91.28 Y83.968 E-.11133
G1 X91.334 Y84.088 E-.05014
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.56 I.852 J-.869 P1  F42000
G1 X88.994 Y81.793 Z17.56
G1 Z17.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.697 Y81.175 I.668 J.051 E.02499
G1 X89.793 Y80.766 E.01013
G1 X89.841 Y80.778 E.0012
G2 X90.419 Y80.754 I.27 J-.484 E.01467
G3 X91.525 Y80.819 I-.826 J23.809 E.02671
G3 X91.823 Y82.616 I-.303 J.974 E.05433
G3 X90.207 Y82.842 I-1 J-1.26 E.04128
G1 X90.174 Y82.909 E.00179
G3 X88.672 Y81.318 I-.364 J-1.161 E.06557
G3 X89.737 Y80.753 I.95 J.503 E.03086
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.841 Y80.778 E-.04092
G1 X90.127 Y80.848 E-.11158
G1 X90.419 Y80.754 E-.11673
G1 X90.71 Y80.771 E-.11077
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.56 I-.925 J-.791 P1  F42000
G1 X87.926 Y84.027 Z17.56
G1 Z17.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.236 Y83.664 I.623 J.219 E.01179
G1 X88.235 Y83.244 E.01013
G3 X89.309 Y83.727 I.138 J1.127 E.02984
G3 X88.535 Y84.782 I-.826 J.206 E.036
G3 X88.178 Y83.242 I-.212 J-.763 E.06159
M106 S124.95
; WIPE_START
G1 X88.553 Y83.245 E-.14285
G1 X88.89 Y83.335 E-.13235
G1 X89.121 Y83.486 E-.1048
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.56 I-.303 J1.179 P1  F42000
G1 X93.698 Y84.664 Z17.56
G1 Z17.16
G1 E.4 F1800
G1 F684
M204 S6000
G3 X94.325 Y84.113 I.593 J.043 E.02232
G1 X94.409 Y83.701 E.01013
G3 X94.966 Y85.873 I-.326 J1.241 E.06576
G2 X94.629 Y86.6 I.406 J.63 E.0204
G3 X92.636 Y87.242 I-1.215 J-.357 E.05943
G3 X92.932 Y85.436 I.964 J-.77 E.04974
G1 X92.955 Y85.233 E.00491
G2 X93.282 Y84.563 I-.492 J-.656 E.01868
G3 X94.352 Y83.69 I1.018 J.155 E.0365
; WIPE_START
G1 F9000
G1 X94.672 Y83.776 E-.12585
G1 X94.946 Y83.955 E-.12436
G1 X95.163 Y84.211 E-.12751
G1 X95.166 Y84.216 E-.00228
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.56 I-1.142 J-.422 P1  F42000
G1 X86.53 Y107.585 Z17.56
G1 Z17.16
G1 E.4 F1800
; FEATURE: Outer wall
G1 F684
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.6598
G3 X87.376 Y78.086 I1.291 J-.004 E.04745
G1 X93.85 Y78.085 E.15611
M73 P74 R8
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.56 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 17.32
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 108/141
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change
; OBJECT_ID: 15
G1 X91.372 Y103.307 F42000
G1 Z17.32
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X91.795 Y103.128 E.01108
G3 X92.46 Y102.707 I.786 J.505 E.0196
G1 X92.551 Y102.297 E.01013
G3 X93.4 Y103.089 I-.243 J1.112 E.02941
G3 X92.163 Y104.556 I-.833 J.553 E.06205
G1 X91.811 Y104.421 E.00909
G1 X91.476 Y104.727 E.01094
G1 X90.929 Y104.838 E.01345
G3 X89.118 Y104.251 I-.788 J-.658 E.05881
G3 X90.433 Y102.75 I.799 J-.627 E.0678
G1 X90.829 Y103.01 E.01144
G2 X91.625 Y102.654 I-.103 J-1.297 E.02144
G3 X92.494 Y102.283 I.827 J.736 E.02354
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.759 Y102.346 E-.10338
G1 X93.021 Y102.505 E-.11634
G1 X93.234 Y102.747 E-.12237
G1 X93.277 Y102.836 E-.03791
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.72 I1.17 J-.334 P1  F42000
G1 X91.504 Y96.619 Z17.72
G1 Z17.32
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X91.678 Y96.511 E.00496
G3 X92.39 Y95.808 I.692 J-.011 E.02695
G1 X92.49 Y95.4 E.01013
G1 X92.564 Y95.419 E.00185
G3 X93.404 Y96.228 I-.271 J1.123 E.02948
G3 X93.372 Y98.079 I-.907 J.91 E.04986
G3 X91.967 Y97.81 I-.54 J-.981 E.03739
G2 X91.291 Y98.15 I.339 J1.518 E.01844
G3 X89.286 Y97.965 I-.986 J-.271 E.06881
G3 X90.414 Y96.449 I1.246 J-.25 E.05138
G1 X90.831 Y96.544 E.01031
G1 X91.326 Y96.235 E.01406
G3 X92.434 Y95.386 I1.031 J.197 E.03684
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.564 Y95.419 E-.05109
G1 X93.014 Y95.632 E-.18928
G1 X93.236 Y95.875 E-.12502
G1 X93.253 Y95.91 E-.01461
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.72 I.268 J-1.187 P1  F42000
G1 X88.46 Y94.827 Z17.72
G1 Z17.32
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.039 Y94.353 I.545 J.074 E.01986
G1 X89.15 Y93.947 E.01014
G3 X90.179 Y95.57 I-.358 J1.364 E.05096
G1 X90.095 Y95.732 E.00441
G3 X88.23 Y96.012 I-1.055 J-.678 E.05146
G3 X88.023 Y94.817 I1.158 J-.816 E.03023
G3 X89.095 Y93.93 I1.016 J.137 E.03688
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.417 Y94.031 E-.12832
G1 X89.705 Y94.236 E-.13438
G1 X89.9 Y94.476 E-.11731
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.72 I1.163 J.359 P1  F42000
G1 X90.994 Y90.932 Z17.72
G1 Z17.32
G1 E.4 F1800
G1 F658
M204 S6000
G3 X91.77 Y90.308 I.742 J.129 E.02624
G1 X91.851 Y89.896 E.01013
G3 X92.911 Y90.257 I-2.291 J8.456 E.02702
G3 X94.31 Y91.718 I.21 J1.2 E.05756
G3 X92.503 Y92.181 I-1.082 J-.464 E.05195
G1 X92.045 Y91.965 E.01221
G3 X90.574 Y90.78 I-.312 J-1.117 E.05321
G3 X91.79 Y89.884 I1.143 J.278 E.03955
; WIPE_START
G1 F9000
G1 X92.142 Y89.95 E-.13598
G1 X92.738 Y90.188 E-.24402
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.72 I.602 J-1.058 P1  F42000
G1 X89.441 Y88.313 Z17.72
G1 Z17.32
G1 E.4 F1800
G1 F658
M204 S6000
G3 X90.048 Y87.906 I.532 J.137 E.01927
G1 X90.164 Y87.502 E.01013
G3 X90.766 Y89.649 I-.282 J1.237 E.06568
G3 X88.986 Y88.667 I-.579 J-1.054 E.0584
G3 X90.108 Y87.485 I1.011 J-.164 E.04545
; WIPE_START
G1 F9000
G1 X90.42 Y87.58 E-.12385
G1 X90.709 Y87.771 E-.13137
G1 X90.924 Y88.019 E-.12478
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.72 I1.197 J-.217 P1  F42000
G1 X90.274 Y84.442 Z17.72
G1 Z17.32
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.582 Y84.047 I.305 J-.079 E.01392
G1 X90.647 Y83.632 E.01013
G3 X91.489 Y84.806 I-.117 J.973 E.03916
G3 X89.962 Y84.819 I-.768 J-.524 E.04323
G3 X90.591 Y83.621 I.647 J-.424 E.03968
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.112 Y83.817 E-.21167
G1 X91.306 Y84.035 E-.11099
G1 X91.376 Y84.169 E-.05734
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.72 I.855 J-.866 P1  F42000
G1 X88.933 Y81.756 Z17.72
G1 Z17.32
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.652 Y81.162 I.628 J.028 E.02532
G1 X89.745 Y80.753 E.01013
G1 X90.511 Y80.932 E.01896
G3 X92.26 Y81.424 I.654 J1.031 E.04943
G3 X90.849 Y82.913 I-1.24 J.238 E.05775
G2 X89.711 Y82.9 I-.6 J2.584 E.02766
G3 X88.706 Y81.118 I-.037 J-1.153 E.06062
G3 X89.689 Y80.739 I.986 J1.093 E.02598
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.511 Y80.932 E-.32074
G1 X90.656 Y80.875 E-.05926
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.72 I-.915 J-.803 P1  F42000
G1 X87.897 Y84.021 Z17.72
G1 Z17.32
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.301 Y83.681 I.617 J.322 E.01308
G1 X88.315 Y83.261 E.01013
G3 X89.229 Y83.992 I.028 J.903 E.0307
G3 X87.463 Y84.081 I-.891 J-.107 E.06061
G3 X88.25 Y83.259 I.992 J.162 E.02918
M106 S124.95
; WIPE_START
G1 X88.757 Y83.359 E-.19631
G1 X89.018 Y83.528 E-.11807
G1 X89.119 Y83.667 E-.06562
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.72 I-.304 J1.178 P1  F42000
G1 X93.682 Y84.844 Z17.72
G1 Z17.32
G1 E.4 F1800
G1 F658
M204 S6000
G3 X94.269 Y84.061 I.588 J-.171 E.02734
G1 X94.344 Y83.647 E.01013
G3 X95.338 Y84.802 I-.048 J1.046 E.04113
G3 X94.886 Y85.807 I-1.256 J.04 E.02751
G2 X94.554 Y86.653 I.94 J.857 E.02241
G3 X92.564 Y87.248 I-1.184 J-.336 E.05962
G3 X93.161 Y85.363 I.995 J-.721 E.05539
G2 X93.32 Y84.291 I-37.985 J-6.169 E.02614
G3 X94.287 Y83.636 I.93 J.332 E.03014
; WIPE_START
G1 F9000
G1 X94.858 Y83.815 E-.2274
G1 X95.127 Y84.033 E-.13158
G1 X95.155 Y84.081 E-.02102
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.72 I-1.142 J-.419 P1  F42000
G1 X86.53 Y107.585 Z17.72
G1 Z17.32
G1 E.4 F1800
; FEATURE: Outer wall
G1 F658
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.443 Y107.965 E.15451
G3 X86.152 Y106.74 I.001 J-1.294 E.04731
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.291 J-.004 E.0474
G1 X93.85 Y78.085 E.15616
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.72 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 17.48
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 109/141
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change
; OBJECT_ID: 15
G1 X91.394 Y103.353 F42000
G1 Z17.48
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X91.705 Y103.263 E.0078
G3 X92.414 Y102.636 I.9 J.303 E.02391
G1 X92.473 Y102.22 E.01013
G3 X93.446 Y103.115 I-.209 J1.204 E.0337
G3 X92.261 Y104.611 I-.803 J.581 E.06195
G3 X91.799 Y104.352 I.292 J-1.06 E.0129
G2 X91.114 Y104.565 I.079 J1.458 E.01748
G3 X89.12 Y104.269 I-.971 J-.328 E.0688
G3 X89.813 Y102.568 I.773 J-.677 E.05483
G3 X90.834 Y103.078 I0 J1.275 E.02854
G1 X91.438 Y102.903 E.01516
G3 X92.416 Y102.211 I1.05 J.445 E.03043
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.718 Y102.264 E-.11687
G1 X93.014 Y102.434 E-.1294
G1 X93.232 Y102.679 E-.12473
G1 X93.242 Y102.7 E-.009
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.88 I1.17 J-.336 P1  F42000
G1 X91.507 Y96.652 Z17.88
G1 Z17.48
M73 P75 R8
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X91.643 Y96.548 E.00414
G3 X92.185 Y95.78 I.889 J.052 E.02388
G1 X92.368 Y95.771 E.00442
G1 X92.5 Y95.371 E.01015
G3 X93.368 Y96.229 I-.252 J1.123 E.03101
G3 X93.621 Y97.953 I-.913 J1.015 E.04558
G3 X92.23 Y98.068 I-.758 J-.691 E.03705
G1 X91.849 Y97.715 E.01252
G1 X91.328 Y98.098 E.01559
G3 X89.56 Y98.637 I-1.022 J-.182 E.05499
G3 X90.402 Y96.552 I.976 J-.818 E.06642
G1 X90.822 Y96.647 E.01038
G1 X91.284 Y96.294 E.01405
G3 X92.413 Y95.348 I1.056 J.114 E.03923
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.713 Y95.428 E-.11795
G1 X92.987 Y95.595 E-.12193
G1 X93.207 Y95.839 E-.12484
G1 X93.223 Y95.876 E-.01528
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.88 I.274 J-1.186 P1  F42000
G1 X88.434 Y94.771 Z17.88
G1 Z17.48
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.979 Y94.269 I.605 J.111 E.01917
G1 X89.064 Y93.857 E.01014
G3 X89.965 Y95.815 I-.276 J1.313 E.06034
G3 X88.352 Y96.211 I-1.036 J-.739 E.04364
G3 X87.996 Y95.029 I.647 J-.839 E.03176
G3 X89.007 Y93.843 I1.041 J-.136 E.04236
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.463 Y94 E-.18291
G1 X89.66 Y94.142 E-.09234
G1 X89.833 Y94.356 E-.10475
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.88 I1.16 J.366 P1  F42000
G1 X90.977 Y90.735 Z17.88
G1 Z17.48
G1 E.4 F1800
G1 F658
M204 S6000
G3 X91.698 Y90.318 I.754 J.471 E.02092
G1 X91.778 Y89.905 E.01013
G3 X92.45 Y90.183 I-.143 J1.297 E.01779
G2 X93.37 Y90.31 I.714 J-1.774 E.02262
G3 X93.715 Y92.375 I-.073 J1.073 E.0694
G1 X93.472 Y92.424 E.00597
G3 X92.432 Y92.083 I-.176 J-1.221 E.02737
G1 X91.943 Y91.952 E.01219
G3 X90.791 Y90.244 I-.328 J-1.021 E.06664
G3 X91.717 Y89.894 I.911 J1.011 E.02443
; WIPE_START
G1 F9000
G1 X92.066 Y89.959 E-.13468
G1 X92.45 Y90.183 E-.16921
G1 X92.644 Y90.233 E-.0761
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.88 I.62 J-1.047 P1  F42000
G1 X89.399 Y88.311 Z17.88
G1 Z17.48
G1 E.4 F1800
G1 F658
M204 S6000
G3 X90.001 Y87.852 I.545 J.091 E.02011
G1 X90.106 Y87.445 E.01013
G3 X90.719 Y89.563 I-.238 J1.217 E.06555
G3 X88.964 Y88.598 I-.574 J-1.034 E.05757
G3 X90.05 Y87.429 I.999 J-.161 E.04433
; WIPE_START
G1 F9000
G1 X90.38 Y87.524 E-.13048
G1 X90.663 Y87.711 E-.12882
G1 X90.871 Y87.951 E-.12071
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.88 I1.202 J-.19 P1  F42000
G1 X90.328 Y84.506 Z17.88
G1 Z17.48
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.623 Y84.117 I.355 J-.037 E.01297
G1 X90.687 Y83.702 E.01013
G3 X91.625 Y84.682 I-.222 J1.151 E.03489
G3 X91.057 Y85.107 I-.703 J-.348 E.01775
G3 X90.63 Y83.691 I-.395 J-.654 E.06707
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.009 Y83.795 E-.14907
G1 X91.193 Y83.937 E-.0886
G1 X91.435 Y84.223 E-.14232
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.88 I.096 J-1.213 P1  F42000
G1 X87.921 Y83.946 Z17.88
G1 Z17.48
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.373 Y83.741 I.568 J.656 E.01213
G1 X88.464 Y83.33 E.01016
G3 X88.228 Y84.711 I-.092 J.695 E.05438
G3 X87.419 Y83.974 I.013 J-.827 E.02884
G3 X88.408 Y83.313 I.979 J.393 E.03049
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.882 Y83.549 E-.20092
G1 X89.041 Y83.765 E-.10212
G1 X89.084 Y83.963 E-.07696
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.88 I1.212 J-.111 P1  F42000
G1 X88.861 Y81.545 Z17.88
G1 Z17.48
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.588 Y81.153 I.634 J.304 E.02129
G1 X89.677 Y80.742 E.01013
G2 X90.627 Y80.902 I.9 J-2.445 E.02336
G3 X92.318 Y81.392 I.619 J1.029 E.04768
G3 X90.735 Y82.817 I-1.201 J.258 E.06218
G1 X90.225 Y82.875 E.01238
G1 X90.106 Y82.79 E.00352
G3 X88.469 Y81.359 I-.404 J-1.19 E.06337
G3 X89.62 Y80.73 I1.041 J.539 E.03356
M106 S124.95
; WIPE_START
G1 X90.113 Y80.889 E-.19662
G1 X90.595 Y80.902 E-.18338
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.88 I-.944 J.767 P1  F42000
G1 X93.675 Y84.692 Z17.88
G1 Z17.48
G1 E.4 F1800
G1 F658
M204 S6000
G3 X94.256 Y84.044 I.604 J-.043 E.02342
G1 X94.288 Y83.625 E.01013
G3 X95.378 Y84.884 I.077 J1.035 E.0466
G3 X94.943 Y85.632 I-3.247 J-1.388 E.02092
G1 X94.587 Y85.862 E.01023
G1 X94.587 Y86.282 E.01013
G3 X93.426 Y87.605 I-1.507 J-.152 E.04529
G3 X92.543 Y85.849 I-.129 J-1.035 E.06181
G3 X93.041 Y85.469 I.936 J.708 E.0153
G1 X93.305 Y84.974 E.01353
G3 X94.231 Y83.62 I.96 J-.337 E.04598
; WIPE_START
G1 F9000
G1 X94.609 Y83.664 E-.14487
G1 X94.966 Y83.814 E-.14696
G1 X95.142 Y83.965 E-.08817
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.88 I-1.143 J-.417 P1  F42000
G1 X86.53 Y107.585 Z17.88
G1 Z17.48
G1 E.4 F1800
; FEATURE: Outer wall
G1 F658
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.001 J-1.294 E.04742
G1 X86.15 Y79.38 E.65974
G3 X87.376 Y78.086 I1.294 J-.001 E.04742
G1 X93.85 Y78.085 E.15611
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z17.88 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 17.64
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 110/141
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
G1 X91.381 Y103.32 F42000
G1 Z17.64
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X91.697 Y103.239 E.00787
G3 X92.41 Y102.572 I.958 J.31 E.02457
G1 X92.475 Y102.157 E.01013
G3 X93.391 Y103.034 I-.144 J1.067 E.03268
G3 X92.003 Y104.499 I-.724 J.705 E.07454
G2 X91.54 Y104.375 I-.291 J.162 E.01288
G1 X91.085 Y104.645 E.01276
G3 X89.136 Y104.31 I-.946 J-.335 E.06779
G3 X89.548 Y102.53 I.773 J-.759 E.05243
G3 X90.732 Y102.993 I.194 J1.248 E.0321
G2 X91.429 Y102.874 I.18 J-1.046 E.01739
G3 X92.41 Y102.146 I1.099 J.457 E.03093
; WIPE_START
G1 X92.71 Y102.198 E-.11573
G1 X92.985 Y102.347 E-.11915
G1 X93.221 Y102.601 E-.1314
G1 X93.234 Y102.634 E-.01371
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.04 I1.167 J-.347 P1  F42000
G1 X91.464 Y96.678 Z18.04
G1 Z17.64
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X91.816 Y95.984 I-2.092 J-1.498 E.01886
G3 X92.305 Y95.727 I.487 J.333 E.01386
G1 X92.375 Y95.313 E.01013
G3 X93.355 Y96.298 I-.116 J1.095 E.03625
G3 X93.415 Y98.232 I-.722 J.991 E.05379
G3 X91.996 Y97.868 I-.486 J-1.053 E.03824
G2 X91.328 Y98.128 I.064 J1.154 E.01759
G3 X89.718 Y98.857 I-1.052 J-.181 E.05018
G3 X90.389 Y96.656 I.79 J-.962 E.0708
G1 X90.797 Y96.748 E.01008
G2 X91.378 Y95.908 I-.86 J-1.216 E.02513
G3 X92.318 Y95.303 I.917 J.39 E.02864
; WIPE_START
G1 X92.658 Y95.376 E-.13189
G1 X92.958 Y95.556 E-.13311
G1 X93.161 Y95.781 E-.115
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.04 I.265 J-1.188 P1  F42000
G1 X88.41 Y94.721 Z18.04
G1 Z17.64
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.98 Y94.197 I.573 J.051 E.02048
G1 X89.066 Y93.786 E.01013
G3 X88.611 Y96.398 I-.301 J1.293 E.09702
G3 X87.978 Y95.027 I.323 J-.98 E.04083
G3 X89.01 Y93.773 I1.069 J-.172 E.04428
; WIPE_START
G1 X89.288 Y93.838 E-.10877
G1 X89.567 Y94.009 E-.12414
G1 X89.82 Y94.302 E-.14709
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.04 I1.163 J.357 P1  F42000
G1 X90.903 Y90.776 Z18.04
G1 Z17.64
G1 E.4 F1800
G1 F600
M204 S6000
G3 X91.626 Y90.328 I.66 J.258 E.022
G1 X91.704 Y89.915 E.01013
G3 X92.629 Y90.434 I-.17 J1.386 E.02624
G1 X92.994 Y90.314 E.00928
G3 X93.761 Y90.442 I-.653 J6.272 E.01876
G3 X92.779 Y92.297 I-.404 J.973 E.08457
G2 X92.05 Y91.904 I-1.169 J1.298 E.02016
G3 X90.503 Y90.62 I-.439 J-1.045 E.05962
G3 X91.645 Y89.904 I1.075 J.446 E.03466
; WIPE_START
G1 F9000
G1 X91.989 Y89.968 E-.13309
G1 X92.299 Y90.122 E-.13159
G1 X92.519 Y90.331 E-.11532
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.04 I.674 J-1.014 P1  F42000
G1 X89.378 Y88.243 Z18.04
G1 Z17.64
G1 E.4 F1800
G1 F600
M204 S6000
G3 X89.932 Y87.794 I.545 J.105 E.01868
G1 X90.016 Y87.382 E.01013
G3 X90.692 Y89.457 I-.21 J1.216 E.0646
G3 X89.028 Y88.868 I-.598 J-.954 E.04892
G3 X89.959 Y87.369 I.956 J-.445 E.05043
; WIPE_START
G1 F9000
G1 X90.295 Y87.45 E-.13131
G1 X90.619 Y87.652 E-.1453
G1 X90.798 Y87.858 E-.1034
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.04 I1.204 J-.175 P1  F42000
G1 X90.322 Y84.576 Z18.04
G1 Z17.64
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.658 Y84.192 I.385 J-.002 E.01346
G1 X90.711 Y83.775 E.01013
G3 X91.202 Y84.043 I-.326 J1.18 E.0136
G3 X91.659 Y84.852 I-.22 J.658 E.02454
G3 X90.727 Y85.144 I-.878 J-1.17 E.024
G3 X89.899 Y84.781 I-.116 J-.861 E.02294
G3 X90.411 Y83.806 I1.031 J-.08 E.02799
G1 X90.654 Y83.767 E.00594
; WIPE_START
G1 X91.116 Y83.933 E-.18654
G1 X91.202 Y84.043 E-.05304
G1 X91.48 Y84.287 E-.14042
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.04 I1.158 J-.374 P1  F42000
G1 X90.524 Y81.325 Z18.04
G1 Z17.64
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X91.156 Y81.165 I.134 J-.797 E.01617
G3 X91.401 Y81.141 I.167 J.443 E.00602
G1 X91.469 Y80.727 E.01013
G3 X91.731 Y82.693 I-.066 J1.009 E.06702
G3 X90.785 Y82.761 I-.57 J-1.316 E.02329
G2 X89.939 Y82.76 I-.446 J15.649 E.02042
G3 X88.393 Y81.337 I-.332 J-1.19 E.06054
G3 X89.939 Y80.797 I1.063 J.561 E.04344
G2 X91.058 Y80.753 I.521 J-.986 E.02828
G1 X91.412 Y80.717 E.00859
; WIPE_START
G1 X91.989 Y80.892 E-.22899
G1 X92.228 Y81.105 E-.12165
G1 X92.266 Y81.172 E-.02936
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.04 I-1.133 J.443 P1  F42000
G1 X93.727 Y84.907 Z18.04
G1 Z17.64
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.197 Y84.039 I.588 J-.243 E.02724
G1 X94.219 Y83.619 E.01013
G3 X95.509 Y84.586 I.183 J1.1 E.04344
G3 X95.042 Y85.392 I-1.088 J-.091 E.02322
G3 X94.619 Y85.73 I-.727 J-.475 E.01329
G1 X94.447 Y86.244 E.01307
G3 X92.477 Y87.336 I-1.185 J.184 E.07051
G3 X93.158 Y85.447 I.998 J-.708 E.0568
G1 X93.297 Y84.894 E.01376
G3 X94.161 Y83.616 I.954 J-.286 E.04253
; WIPE_START
G1 X94.728 Y83.667 E-.21629
G1 X95.06 Y83.814 E-.13793
G1 X95.11 Y83.859 E-.02578
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.04 I-.023 J-1.217 P1  F42000
G1 X87.865 Y83.993 Z18.04
G1 Z17.64
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.412 Y83.846 I.515 J.822 E.01387
G1 X88.575 Y83.448 E.01036
G3 X88.22 Y84.625 I-.262 J.563 E.04282
G3 X87.374 Y84.137 I-.071 J-.854 E.02507
G3 X88 Y83.465 I.722 J.046 E.02399
G3 X88.525 Y83.421 I.43 J1.976 E.01273
; WIPE_START
G1 X88.742 Y83.563 E-.09839
G1 X88.9 Y83.78 E-.10223
G1 X88.952 Y84.016 E-.0917
G1 X88.901 Y84.241 E-.08768
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.04 I-1.211 J-.123 P1  F42000
G1 X86.53 Y107.585 Z18.04
G1 Z17.64
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.004 J-1.291 E.04745
G1 X86.15 Y79.38 E.65974
G3 X87.376 Y78.086 I1.294 J-.001 E.04742
G1 X93.85 Y78.085 E.15611
M73 P76 R8
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.04 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 111/141
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
G1 X91.389 Y103.348 F42000
G1 Z17.8
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X91.726 Y103.208 E.00881
G3 X92.411 Y102.51 I.929 J.226 E.02476
G1 X92.47 Y102.094 E.01013
G1 X92.518 Y102.102 E.00119
G3 X93.395 Y103.032 I-.181 J1.05 E.03308
G3 X93.013 Y104.759 I-.678 J.755 E.05177
G3 X91.759 Y104.272 I-.066 J-1.688 E.03335
G1 X91.16 Y104.51 E.01554
G3 X89.563 Y105.179 I-1.027 J-.21 E.04914
G3 X89.139 Y104.263 I.954 J-.998 E.02491
G3 X89.496 Y102.475 I.71 J-.788 E.05293
G3 X90.827 Y103.126 I.157 J1.365 E.03774
G1 X91.424 Y102.879 E.01559
G3 X92.413 Y102.084 I1.088 J.341 E.03244
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.518 Y102.102 E-.04074
G1 X92.709 Y102.135 E-.07378
G1 X92.983 Y102.285 E-.11842
G1 X93.207 Y102.522 E-.12409
G1 X93.228 Y102.579 E-.02296
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.2 I.999 J-.695 P1  F42000
G1 X89.778 Y97.62 Z18.2
G1 Z17.8
G1 E.4 F1800
G1 F642
M204 S6000
G3 X90.358 Y97.185 I.746 J.39 E.01808
G1 X90.446 Y96.774 E.01013
G3 X91.26 Y98.301 I-.284 J1.131 E.04702
G3 X89.288 Y98.15 I-.976 J-.199 E.06951
G3 X90.377 Y96.758 I1.19 J-.19 E.04782
; WIPE_START
G1 F9000
G1 X90.678 Y96.826 E-.11725
G1 X90.946 Y96.998 E-.12096
G1 X91.156 Y97.26 E-.12757
G1 X91.17 Y97.295 E-.01421
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.2 I1.066 J.587 P1  F42000
G1 X91.708 Y96.318 Z18.2
G1 Z17.8
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.29 Y95.689 I.632 J.001 E.02271
G1 X92.367 Y95.276 E.01013
G3 X93.336 Y96.34 I-.203 J1.158 E.03735
G3 X93.48 Y98.285 I-.668 J1.027 E.05439
G3 X91.876 Y97.64 I-.487 J-1.106 E.04648
G1 X91.736 Y97.206 E.011
G3 X92.31 Y95.265 I.611 J-.875 E.06428
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.6 Y95.323 E-.11241
G1 X93.01 Y95.604 E-.18891
G1 X93.119 Y95.78 E-.07867
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.2 I.281 J-1.184 P1  F42000
G1 X88.401 Y94.661 Z18.2
G1 Z17.8
M73 P76 R7
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.94 Y94.118 I.571 J.027 E.02024
G1 X89.02 Y93.705 E.01013
G3 X90.023 Y95.241 I-.301 J1.292 E.04886
G3 X88.572 Y96.45 I-1.27 J-.049 E.05134
G3 X87.973 Y94.996 I.346 J-.993 E.04284
G3 X88.963 Y93.692 I1.07 J-.215 E.04465
M106 S124.95
; WIPE_START
G1 X89.26 Y93.76 E-.11573
G1 X89.547 Y93.934 E-.12742
G1 X89.773 Y94.19 E-.13003
G1 X89.781 Y94.207 E-.00683
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.2 I1.151 J.395 P1  F42000
G1 X90.852 Y91.084 Z18.2
G1 Z17.8
G1 E.4 F1800
M106 S127.5
G1 F642
M204 S6000
G3 X91.559 Y90.339 I.619 J-.121 E.02896
G1 X91.631 Y89.925 E.01013
G3 X92.512 Y90.344 I-.511 J2.206 E.0237
G1 X93.017 Y90.419 E.01233
G3 X93.774 Y92.433 I.365 J1.012 E.08083
G3 X92.447 Y91.93 I-.27 J-1.29 E.03614
G3 X91.247 Y91.916 I.214 J-71.158 E.02895
G3 X91.574 Y89.914 I.182 J-.998 E.07598
; WIPE_START
G1 F9000
G1 X91.912 Y89.977 E-.13043
G1 X92.472 Y90.32 E-.24957
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.2 I.69 J-1.003 P1  F42000
G1 X89.366 Y88.184 Z18.2
G1 Z17.8
G1 E.4 F1800
G1 F642
M204 S6000
G3 X89.831 Y87.743 I.58 J.146 E.01631
G1 X89.878 Y87.326 E.01013
G3 X90.352 Y89.533 I-.024 J1.16 E.07491
G3 X89.349 Y87.479 I-.248 J-1.151 E.07543
G3 X89.82 Y87.319 I.572 J.906 E.01212
; WIPE_START
G1 F9000
G1 X90.241 Y87.388 E-.16186
G1 X90.541 Y87.564 E-.13236
G1 X90.692 Y87.732 E-.08578
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.2 I1.209 J-.14 P1  F42000
G1 X90.332 Y84.62 Z18.2
G1 Z17.8
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.314 Y84.62 E.00042
G3 X90.673 Y84.282 I.858 J.55 E.01203
G1 X90.712 Y83.863 E.01014
G3 X91.766 Y84.621 I-.793 J2.214 E.03172
G3 X91.451 Y85.034 I-.373 J.042 E.01382
G3 X89.951 Y84.929 I-.532 J-3.169 E.03661
G3 X90.089 Y84.244 I.44 J-.268 E.01853
G3 X90.655 Y83.855 I.646 J.334 E.01723
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.872 Y83.891 E-.08357
G1 X91.495 Y84.284 E-.27991
G1 X91.522 Y84.318 E-.01652
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.2 I.811 J-.907 P1  F42000
G1 X88.759 Y81.849 Z18.2
G1 Z17.8
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.365 Y81.118 I.474 J-.224 E.02866
G1 X89.441 Y80.705 E.01013
G3 X90.264 Y80.972 I-.257 J2.19 E.021
G3 X91.436 Y80.705 I8.693 J35.362 E.029
G3 X91.803 Y82.654 I.048 J1 E.06918
G3 X90.592 Y82.637 I-.585 J-1.434 E.02999
G1 X90.095 Y82.615 E.012
G3 X88.269 Y81.607 I-.567 J-1.132 E.05911
G3 X89.384 Y80.695 I1.009 J.096 E.03866
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.947 Y80.797 E-.21746
G1 X90.264 Y80.972 E-.13757
G1 X90.328 Y80.958 E-.02497
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.2 I-.946 J-.766 P1  F42000
G1 X87.838 Y84.034 Z18.2
G1 Z17.8
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.193 Y83.959 I1.422 J5.849 E.00875
G1 X88.242 Y83.542 E.01013
G3 X88.357 Y84.498 I.08 J.475 E.03762
G3 X87.319 Y84.11 I-.295 J-.794 E.02914
G3 X87.826 Y83.589 I.644 J.119 E.0186
G1 X88.185 Y83.535 E.00875
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.693 Y83.686 E-.20137
G1 X88.817 Y84.027 E-.13775
G1 X88.792 Y84.131 E-.04088
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.2 I-.103 J1.213 P1  F42000
G1 X93.702 Y84.547 Z18.2
G1 Z17.8
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.478 Y84.045 I.683 J.203 E.02427
G1 X94.538 Y83.629 E.01013
G3 X95.143 Y85.364 I.072 J.948 E.06009
G1 X94.594 Y85.628 E.01468
G1 X94.35 Y86.127 E.0134
G3 X92.464 Y87.389 I-1.128 J.354 E.0733
G3 X93.004 Y85.572 I.871 J-.73 E.05404
G2 X93.277 Y84.731 I-.547 J-.643 E.02244
G3 X94.481 Y83.621 I1.044 J-.076 E.04534
M106 S124.95
; WIPE_START
G1 X94.826 Y83.671 E-.13244
G1 X95.145 Y83.816 E-.13312
G1 X95.368 Y84.019 E-.11444
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.2 I-1.139 J-.427 P1  F42000
G1 X86.53 Y107.585 Z18.2
G1 Z17.8
G1 E.4 F1800
; FEATURE: Outer wall
G1 F642
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.443 Y107.965 E.15451
G3 X86.152 Y106.738 I-.002 J-1.291 E.04739
G1 X86.15 Y79.38 E.65974
G3 X87.376 Y78.086 I1.291 J-.004 E.04745
G1 X93.85 Y78.085 E.15611
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
M73 P77 R7
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.2 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 17.96
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 112/141
; update layer progress
M73 L112
M991 S0 P111 ;notify layer change
; OBJECT_ID: 15
G1 X89.186 Y103.408 F42000
G1 Z17.96
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X89.72 Y102.823 I.532 J-.051 E.02151
G1 X89.816 Y102.414 E.01013
G3 X90.909 Y103.602 I-.306 J1.377 E.04142
G3 X90.67 Y105.303 I-.955 J.733 E.04612
G3 X89.128 Y104.344 I-.497 J-.92 E.05305
G3 X88.955 Y102.731 I1.018 J-.924 E.04183
G3 X89.76 Y102.4 I.741 J.656 E.02174
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.088 Y102.485 E-.12869
G1 X90.401 Y102.674 E-.13896
G1 X90.6 Y102.893 E-.11235
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I-.112 J1.212 P1  F42000
G1 X91.846 Y103.007 Z18.36
G1 Z17.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.411 Y102.449 I.64 J.082 E.02064
G1 X92.47 Y102.033 E.01013
G1 X92.562 Y102.049 E.00226
G3 X93.398 Y103.037 I-.235 J1.047 E.03351
G3 X93.074 Y104.811 I-.643 J.799 E.05313
G3 X91.604 Y103.867 I-.15 J-1.382 E.04552
G3 X92.413 Y102.023 I.957 J-.68 E.05837
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.562 Y102.049 E-.05752
G1 X92.978 Y102.222 E-.17107
G1 X93.2 Y102.458 E-.12303
G1 X93.233 Y102.525 E-.02837
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I.988 J-.71 P1  F42000
G1 X89.777 Y97.716 Z18.36
G1 Z17.96
G1 E.4 F1800
G1 F645
M204 S6000
G3 X90.346 Y97.287 I.73 J.377 E.01777
G1 X90.422 Y96.874 E.01014
G3 X91.075 Y98.714 I-.291 J1.139 E.05557
G3 X89.281 Y98.084 I-.818 J-.542 E.06258
G3 X90.365 Y96.861 I1.176 J-.05 E.04358
; WIPE_START
G1 F9000
G1 X90.662 Y96.928 E-.11561
G1 X90.926 Y97.097 E-.11931
G1 X91.133 Y97.355 E-.12577
G1 X91.152 Y97.403 E-.01931
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I1.09 J.541 P1  F42000
G1 X91.703 Y96.291 Z18.36
G1 Z17.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.248 Y95.642 I.613 J-.038 E.02254
G1 X92.322 Y95.229 E.01013
G1 X92.472 Y95.259 E.00371
G3 X93.316 Y96.382 I-.339 J1.133 E.03627
G3 X93.52 Y98.348 I-.615 J1.057 E.05547
G3 X91.864 Y97.474 I-.483 J-1.092 E.05191
G3 X91.307 Y96.518 I7.646 J-5.095 E.0267
G3 X92.265 Y95.217 I.969 J-.289 E.04511
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.472 Y95.259 E-.08043
G1 X92.856 Y95.437 E-.1608
G1 X93.089 Y95.68 E-.12789
G1 X93.102 Y95.706 E-.01089
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I.275 J-1.185 P1  F42000
G1 X88.388 Y94.611 Z18.36
G1 Z17.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.918 Y94.044 I.571 J.002 E.0206
G1 X88.994 Y93.63 E.01013
G1 X89.149 Y93.664 E.00384
G3 X89.957 Y95.283 I-.52 J1.271 E.04763
G3 X88.267 Y96.38 I-1.178 J.036 E.05827
G1 X88.159 Y96.277 E.00361
G3 X87.983 Y95.011 I.789 J-.754 E.03291
G3 X88.937 Y93.618 I1.05 J-.305 E.04654
M106 S124.95
; WIPE_START
G1 X89.149 Y93.664 E-.08244
G1 X89.515 Y93.853 E-.15648
G1 X89.753 Y94.121 E-.13619
G1 X89.759 Y94.132 E-.00489
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I1.159 J.372 P1  F42000
G1 X90.78 Y90.952 Z18.36
G1 Z17.96
G1 E.4 F1800
M106 S127.5
G1 F645
M204 S6000
G3 X91.413 Y90.351 I.617 J.016 E.02339
G1 X91.422 Y89.931 E.01013
G3 X92.372 Y90.358 I.047 J1.165 E.02604
G1 X92.881 Y90.516 E.01283
G3 X94.097 Y90.531 I.589 J1.497 E.03008
G3 X94.075 Y92.386 I-.791 J.918 E.05095
G3 X92.917 Y92.311 I-.515 J-1.022 E.02935
G3 X92.502 Y91.914 I.457 J-.892 E.01405
G1 X91.939 Y91.83 E.01374
G3 X90.399 Y90.622 I-.477 J-.977 E.05875
G3 X91.364 Y89.93 I1.006 J.384 E.03035
; WIPE_START
G1 F9000
G1 X91.834 Y89.985 E-.1799
G1 X92.137 Y90.136 E-.12831
G1 X92.274 Y90.266 E-.07179
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I.712 J-.987 P1  F42000
G1 X89.318 Y88.131 Z18.36
G1 Z17.96
G1 E.4 F1800
G1 F645
M204 S6000
G3 X89.865 Y87.664 I.581 J.126 E.01864
G1 X89.899 Y87.245 E.01014
G3 X90.583 Y89.306 I-.167 J1.199 E.06497
G3 X88.939 Y88.58 I-.556 J-.965 E.05043
G3 X89.841 Y87.238 I.961 J-.328 E.04512
; WIPE_START
G1 F9000
G1 X90.125 Y87.272 E-.10858
G1 X90.379 Y87.401 E-.10809
G1 X90.68 Y87.707 E-.16334
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I1.217 J0 P1  F42000
G1 X90.681 Y84.429 Z18.36
G1 Z17.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.794 Y84.5 I-.019 J.158 E.00333
G1 X90.573 Y84.497 E.00533
G3 X90.672 Y84.428 I.117 J.062 E.00302
G1 X90.709 Y84.009 E.01015
G3 X91.745 Y84.531 I-.692 J2.659 E.0282
G3 X91.551 Y85.018 I-.174 J.213 E.01676
G3 X90.614 Y84.917 I.641 J-10.415 E.02275
G3 X89.81 Y84.787 I-.338 J-.46 E.02185
G3 X90.236 Y84.233 I.687 J.088 E.01768
G3 X90.652 Y84 I.436 J.291 E.01193
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.357 Y84.254 E-.28475
G1 X91.561 Y84.4 E-.09525
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I.246 J-1.192 P1  F42000
G1 X88.017 Y83.667 Z18.36
G1 Z17.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.572 Y84.03 I.039 J.545 E.01719
G3 X87.959 Y84.433 I-.602 J-.25 E.01878
G3 X87.264 Y84.058 I-.09 J-.665 E.02036
G3 X87.96 Y83.659 I.659 J.343 E.02044
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.283 Y83.707 E-.12427
G1 X88.517 Y83.867 E-.10736
G1 X88.572 Y84.03 E-.06572
G1 X88.5 Y84.206 E-.07222
G1 X88.478 Y84.222 E-.01042
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I1.211 J.119 P1  F42000
G1 X88.709 Y81.86 Z18.36
G1 Z17.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.276 Y81.102 I.448 J-.256 E.02889
G1 X89.365 Y80.691 E.01014
G3 X90.249 Y80.955 I.02 J1.546 E.02258
G1 X90.788 Y80.927 E.01301
G3 X92.548 Y81.631 I.686 J.836 E.05572
G3 X90.68 Y82.539 I-1.207 J-.108 E.06015
G1 X90.15 Y82.571 E.0128
G3 X88.202 Y81.587 I-.636 J-1.162 E.06187
G3 X89.292 Y80.678 I.999 J.09 E.03801
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.927 Y80.789 E-.24491
G1 X90.243 Y80.951 E-.13509
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I-.878 J.843 P1  F42000
G1 X93.739 Y84.591 Z18.36
G1 Z17.96
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.216 Y84.082 I.52 J.01 E.01843
G3 X94.589 Y84.051 I.25 J.747 E.00911
G1 X94.652 Y83.636 E.01013
G3 X94.909 Y85.506 I.013 J.951 E.06641
G1 X94.435 Y85.598 E.01164
G2 X94.324 Y86.538 I1.044 J.6 E.02344
G3 X92.58 Y87.566 I-1.207 J-.054 E.05786
G3 X92.671 Y85.792 I.696 J-.854 E.04983
G1 X92.976 Y85.629 E.00834
G1 X93.828 Y85.449 E.02099
G1 X93.157 Y85.012 E.01931
G2 X93.349 Y84.359 I-.961 J-.638 E.01667
G2 X93.457 Y84.004 I-.574 J-.368 E.00906
G3 X94.595 Y83.627 I1.109 J1.443 E.02945
M106 S124.95
; WIPE_START
G1 X94.917 Y83.676 E-.12371
G1 X95.215 Y83.818 E-.12562
G1 X95.442 Y84.03 E-.11805
G1 X95.458 Y84.059 E-.01262
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I-1.138 J-.432 P1  F42000
G1 X86.53 Y107.585 Z18.36
G1 Z17.96
G1 E.4 F1800
; FEATURE: Outer wall
G1 F645
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.001 J-1.294 E.04742
G1 X86.15 Y79.38 E.65974
G3 X87.377 Y78.086 I1.294 J-.001 E.04742
G1 X93.85 Y78.085 E.15611
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.36 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 18.12
; LAYER_HEIGHT: 0.160002
; layer num/total_layer_count: 113/141
; update layer progress
M73 L113
M991 S0 P112 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
G1 X89.154 Y103.381 F42000
G1 Z18.12
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X89.668 Y102.766 I.519 J-.088 E.02195
G1 X89.763 Y102.357 E.01013
G3 X90.846 Y103.627 I-.295 J1.348 E.04322
G3 X90.954 Y105.171 I-1.148 J.856 E.03941
G3 X89.818 Y105.412 I-.776 J-.854 E.02936
G3 X88.986 Y104.38 I.468 J-1.227 E.03349
G3 X88.716 Y103.253 I26.39 J-6.927 E.02797
G3 X89.707 Y102.343 I.922 J.01 E.03637
; WIPE_START
G1 X90.028 Y102.425 E-.12581
G1 X90.334 Y102.611 E-.13614
G1 X90.546 Y102.838 E-.11805
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.52 I-.12 J1.211 P1  F42000
G1 X91.857 Y102.968 Z18.52
G1 Z18.12
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.409 Y102.39 I.619 J.037 E.02095
G1 X92.469 Y101.974 E.01013
G1 X92.606 Y101.998 E.00335
G3 X93.401 Y103.05 I-.303 J1.056 E.03411
G3 X93.419 Y104.743 I-.692 J.854 E.04661
G3 X91.675 Y103.864 I-.506 J-1.164 E.05371
G3 X92.122 Y102.01 I.975 J-.746 E.05266
G1 X92.412 Y101.964 E.00707
; WIPE_START
G1 X92.606 Y101.998 E-.07479
G1 X92.97 Y102.161 E-.15174
G1 X93.19 Y102.394 E-.12176
G1 X93.227 Y102.469 E-.03171
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.52 I.978 J-.725 P1  F42000
G1 X89.774 Y97.81 Z18.52
G1 Z18.12
G1 E.4 F1800
G1 F600
M204 S6000
G1 X89.774 Y97.808 E.00004
G3 X90.334 Y97.389 I.722 J.381 E.01743
G1 X90.41 Y96.975 E.01014
G3 X91.053 Y98.787 I-.285 J1.121 E.05472
G3 X89.285 Y98.187 I-.805 J-.533 E.06114
G3 X90.354 Y96.963 I1.161 J-.066 E.0434
; WIPE_START
G1 F9000
G1 X90.646 Y97.029 E-.11397
G1 X90.907 Y97.196 E-.11765
G1 X91.111 Y97.45 E-.12399
G1 X91.135 Y97.51 E-.02438
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.52 I1.108 J.503 P1  F42000
G1 X91.698 Y96.268 Z18.52
G1 Z18.12
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.223 Y95.599 I.591 J-.077 E.02285
G1 X92.296 Y95.185 E.01013
G1 X92.437 Y95.214 E.00345
G3 X93.249 Y96.154 I-.304 J1.083 E.03175
G1 X93.493 Y96.587 E.01199
G3 X93.582 Y98.387 I-.715 J.938 E.04948
G3 X91.935 Y97.571 I-.534 J-.992 E.05185
G1 X91.757 Y97.125 E.01158
G3 X92.24 Y95.174 I.555 J-.898 E.06412
; WIPE_START
G1 X92.437 Y95.214 E-.07629
G1 X92.823 Y95.391 E-.16172
G1 X93.054 Y95.632 E-.12681
G1 X93.072 Y95.668 E-.01518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.52 I.28 J-1.184 P1  F42000
G1 X88.376 Y94.558 Z18.52
G1 Z18.12
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.9 Y93.973 I.571 J-.016 E.02089
G1 X88.975 Y93.559 E.01013
G1 X89.102 Y93.587 E.00314
G3 X89.872 Y95.258 I-.461 J1.225 E.0492
G3 X88.239 Y96.435 I-1.128 J.157 E.05956
G1 X88.099 Y96.3 E.0047
G3 X87.989 Y95.009 I.846 J-.722 E.03335
G3 X88.918 Y93.547 I1.039 J-.366 E.04806
; WIPE_START
G1 X89.102 Y93.587 E-.07143
G1 X89.487 Y93.775 E-.16268
G1 X89.719 Y94.034 E-.13246
G1 X89.734 Y94.066 E-.01343
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.52 I1.135 J.439 P1  F42000
G1 X90.832 Y91.226 Z18.52
G1 Z18.12
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.358 Y90.358 I.472 J-.307 E.03044
G1 X91.406 Y89.941 E.01013
G3 X92.579 Y90.89 I-.074 J1.291 E.03886
G1 X92.87 Y90.375 E.01427
G2 X93.56 Y90.333 I.304 J-.702 E.01729
G3 X94.522 Y91.613 I.036 J.974 E.04529
G3 X92.836 Y92.208 I-.93 J.052 E.05783
G3 X92.446 Y91.751 I.563 J-.874 E.01467
G2 X91.35 Y91.916 I1.721 J15.24 E.02674
G3 X91.349 Y89.934 I-.037 J-.991 E.07686
; WIPE_START
G1 X91.717 Y89.983 E-.14119
G1 X92.057 Y90.145 E-.14316
G1 X92.24 Y90.318 E-.09565
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.52 I.755 J-.954 P1  F42000
G1 X89.284 Y87.979 Z18.52
G1 Z18.12
G1 E.4 F1800
G1 F600
M204 S6000
G3 X89.882 Y87.583 I.794 J.549 E.01772
G1 X89.915 Y87.164 E.01014
G3 X90.85 Y88.02 I-.151 J1.104 E.03253
G3 X89.056 Y88.834 I-.91 J.378 E.07314
G3 X89.572 Y87.224 I.807 J-.629 E.04797
G1 X89.857 Y87.157 E.00707
; WIPE_START
G1 F9000
G1 X90.137 Y87.19 E-.107
G1 X90.394 Y87.319 E-.10945
G1 X90.61 Y87.543 E-.11811
G1 X90.663 Y87.65 E-.04544
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.52 I1.144 J-.416 P1  F42000
G1 X89.587 Y84.686 Z18.52
G1 Z18.12
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X92.137 Y84.686 E.06149
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z18.52 I0 J1.217 P1  F42000
G1 X94.376 Y84.686 Z18.52
G1 Z18.12
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X93.381 Y84.686 E.024
G2 X93.324 Y84.064 I-2.6 J-.074 E.0151
G1 X93.357 Y83.973 E.00234
G3 X93.885 Y83.8 I.873 J1.777 E.01343
G1 X94.376 Y83.8 E.01186
M204 S10000
G1 X95.026 Y84.166 F42000
; FEATURE: Support
G1 F9000
M204 S6000
G3 X95.026 Y84.998 I-.283 J.416 E.02362
G1 X95.026 Y84.166 E.02006
G1 X94.705 Y83.636 E.01493
G3 X94.639 Y85.555 I-.008 J.96 E.07399
G1 X94.42 Y85.538 E.00531
G1 X94.201 Y86.195 E.01671
G3 X92.54 Y87.597 I-1.118 J.36 E.0669
G3 X92.573 Y85.905 I.666 J-.833 E.04711
G1 X93.964 Y85.905 E.03354
G1 X94.606 Y85.264 E.02189
G1 X94.606 Y83.632 E.03935
G1 X94.648 Y83.627 E.00103
; WIPE_START
G1 X94.988 Y83.681 E-.13083
G1 X95.276 Y83.82 E-.12157
G1 X95.492 Y84.03 E-.11413
G1 X95.508 Y84.061 E-.01347
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.52 I.369 J-1.16 P1  F42000
G1 X88.67 Y81.886 Z18.52
G1 Z18.12
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.188 Y81.087 I.409 J-.302 E.02974
G1 X89.26 Y80.673 E.01013
G1 X89.956 Y80.799 E.01706
G2 X91.197 Y80.743 I.573 J-1.073 E.03144
G3 X91.874 Y82.606 I.392 J.912 E.07799
G3 X90.835 Y82.538 I-.448 J-1.11 E.02597
G1 X90.306 Y82.49 E.0128
G3 X88.182 Y81.835 I-.767 J-1.285 E.06043
G3 X89.203 Y80.663 I.872 J-.271 E.04482
; WIPE_START
G1 X89.956 Y80.799 E-.29088
G1 X90.175 Y80.884 E-.08912
; WIPE_END
M73 P78 R7
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.52 I-1.029 J-.65 P1  F42000
G1 X88.333 Y83.8 Z18.52
G1 Z18.12
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X87.126 Y83.8 E.0291
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z18.52 I-1.217 J-.03 P1  F42000
G1 X86.53 Y107.585 Z18.52
G1 Z18.12
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.6598
G3 X87.376 Y78.086 I1.291 J-.004 E.04745
G1 X93.85 Y78.085 E.15611
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.52 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 18.28
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 114/141
; update layer progress
M73 L114
M991 S0 P113 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
G1 X89.125 Y103.362 F42000
G1 Z18.28
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X89.619 Y102.71 I.508 J-.128 E.02262
G1 X89.712 Y102.3 E.01013
G3 X90.776 Y103.583 I-.292 J1.324 E.04325
G3 X91.211 Y104.678 I-1.308 J1.154 E.02901
G3 X89.941 Y105.454 I-.899 J-.045 E.04223
G3 X89.095 Y104.194 I.021 J-.929 E.04285
G3 X88.738 Y102.877 I1.071 J-.997 E.03423
G3 X89.656 Y102.286 I.827 J.276 E.02846
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.97 Y102.366 E-.12306
G1 X90.27 Y102.547 E-.13301
G1 X90.492 Y102.786 E-.12394
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.68 I-.13 J1.21 P1  F42000
G1 X91.863 Y102.934 Z18.68
G1 Z18.28
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.406 Y102.332 I.608 J.003 E.02138
G1 X92.466 Y101.916 E.01013
G1 X92.648 Y101.948 E.00446
G3 X93.407 Y103.065 I-.392 J1.083 E.03479
G3 X93.484 Y104.783 I-.674 J.891 E.04732
G3 X91.817 Y104.103 I-.52 J-1.108 E.04878
G2 X91.47 Y103.32 I-7.585 J2.889 E.02065
G3 X92.409 Y101.906 I1.053 J-.319 E.04674
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.648 Y101.948 E-.09227
G1 X92.961 Y102.101 E-.13225
G1 X93.179 Y102.331 E-.12028
G1 X93.22 Y102.414 E-.0352
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.68 I.967 J-.739 P1  F42000
G1 X89.779 Y97.915 Z18.68
G1 Z18.28
G1 E.4 F1800
G1 F659
M204 S6000
G3 X90.345 Y97.495 I.571 J.178 E.01819
G1 X90.427 Y97.083 E.01013
G3 X91.034 Y98.856 I-.306 J1.094 E.05311
G3 X89.29 Y98.261 I-.792 J-.531 E.0602
G3 X90.371 Y97.07 I1.147 J-.045 E.04298
; WIPE_START
G1 F9000
G1 X90.63 Y97.129 E-.10094
G1 X90.889 Y97.294 E-.11651
G1 X91.087 Y97.541 E-.12034
G1 X91.129 Y97.643 E-.04221
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.68 I1.129 J.455 P1  F42000
G1 X91.692 Y96.247 Z18.68
G1 Z18.28
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.199 Y95.556 I.572 J-.111 E.0232
G1 X92.272 Y95.143 E.01013
G1 X92.396 Y95.167 E.00307
G3 X93.237 Y96.249 I-.303 J1.103 E.03541
G2 X93.83 Y97.018 I5.807 J-3.868 E.02345
G3 X93.333 Y98.583 I-.83 J.598 E.04596
G3 X91.943 Y97.396 I-.148 J-1.234 E.04952
G3 X91.289 Y96.416 I3.581 J-3.098 E.02848
G3 X92.215 Y95.131 I.94 J-.299 E.04433
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.396 Y95.167 E-.07028
G1 X92.79 Y95.345 E-.1642
G1 X93.018 Y95.583 E-.12519
G1 X93.042 Y95.63 E-.02033
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.68 I.283 J-1.184 P1  F42000
G1 X88.364 Y94.511 Z18.68
G1 Z18.28
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.884 Y93.904 I.571 J-.037 E.02133
G1 X88.958 Y93.491 E.01013
G1 X89.055 Y93.511 E.0024
G3 X89.799 Y95.232 I-.403 J1.195 E.05098
G3 X88.475 Y96.613 I-1.158 J.214 E.05383
G3 X88.017 Y94.958 I.384 J-.997 E.04811
G3 X88.901 Y93.479 I.98 J-.418 E.04841
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.055 Y93.511 E-.05979
G1 X89.46 Y93.699 E-.16978
G1 X89.688 Y93.951 E-.12896
G1 X89.712 Y94.002 E-.02147
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.68 I1.134 J.441 P1  F42000
G1 X90.793 Y91.225 Z18.68
G1 Z18.28
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.293 Y90.369 I.477 J-.295 E.0293
G1 X91.34 Y89.952 E.01013
G1 X91.387 Y89.957 E.00113
G3 X92.245 Y90.44 I-.005 J1.013 E.0248
G2 X92.895 Y90.595 I.61 J-1.122 E.01628
G3 X94.388 Y90.612 I.739 J.691 E.04052
G1 X94.507 Y90.836 E.0061
G3 X94.53 Y91.619 I-1.249 J.429 E.01918
G3 X92.757 Y92.147 I-.933 J.107 E.06324
G2 X92.455 Y91.818 I-.34 J.009 E.01174
G1 X91.963 Y91.721 E.0121
G3 X90.305 Y90.624 I-.612 J-.876 E.06159
G3 X91.283 Y89.945 I.989 J.381 E.0305
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.387 Y89.957 E-.03977
G1 X91.622 Y89.986 E-.08996
G1 X91.94 Y90.128 E-.13239
G1 X92.157 Y90.35 E-.11787
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.68 I.794 J-.923 P1  F42000
G1 X89.27 Y87.867 Z18.68
G1 Z18.28
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.9 Y87.501 I1.033 J1.053 E.01773
G1 X89.931 Y87.082 E.01014
G3 X90.763 Y87.753 I-.06 J.925 E.02747
G3 X90.496 Y89.137 I-1.156 J.495 E.03607
G3 X88.949 Y88.695 I-.551 J-.998 E.04306
G3 X89.294 Y87.328 I.705 J-.549 E.03918
G3 X89.874 Y87.075 I.666 J.739 E.01551
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.149 Y87.107 E-.10539
G1 X90.403 Y87.234 E-.10762
G1 X90.615 Y87.453 E-.11582
G1 X90.674 Y87.574 E-.05118
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.68 I.345 J1.167 P1  F42000
G1 X92.548 Y87.019 Z18.68
G1 Z18.28
G1 E.4 F1800
G1 F659
M204 S6000
G1 X92.547 Y87.018 E.00003
G3 X92.76 Y86.325 I.853 J-.116 E.01803
G1 X92.678 Y85.905 E.01032
G1 X93.841 Y85.905 E.02804
G3 X92.276 Y87.401 I-.765 J.766 E.08325
G3 X92.62 Y85.905 I.899 J-.581 E.04127
; WIPE_START
G1 F9000
G1 X93.62 Y85.905 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.68 I1.209 J-.143 P1  F42000
G1 X93.543 Y85.25 Z18.68
G1 Z18.28
G1 E.4 F1800
; FEATURE: Support interface
G1 F659
M204 S6000
G1 X93.543 Y84.256 E.02395
G1 X92.657 Y84.262 E.02136
G1 X92.657 Y84.617 E.00856
G1 X91.771 Y84.617 E.02136
G1 X91.771 Y84.262 E.00856
G1 X90.886 Y84.262 E.02136
G1 X90.886 Y84.617 E.00856
G1 X90 Y84.617 E.02136
G1 X90 Y84.262 E.00856
G1 X89.114 Y84.262 E.02136
G1 X89.114 Y84.617 E.00856
G1 X88.229 Y84.617 E.02136
G1 X88.229 Y84.088 E.01275
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z18.68 I1.185 J.278 P1  F42000
G1 X88.722 Y81.987 Z18.68
G1 Z18.28
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X88.702 Y81.081 I.452 J-.463 E.02419
G1 X88.82 Y81.041 E.00301
G1 X88.813 Y80.621 E.01014
G2 X89.989 Y80.813 I22.479 J-133.626 E.02874
G1 X90.327 Y80.99 E.00919
G1 X90.878 Y80.958 E.01332
G3 X92.606 Y81.31 I.731 J.829 E.04922
G1 X92.647 Y81.541 E.00566
G3 X91.034 Y82.566 I-1.155 J-.036 E.05425
G1 X90.469 Y82.215 E.01605
G1 X90.402 Y82.593 E.00927
G2 X89.678 Y82.712 I.051 J2.571 E.01775
G3 X88.399 Y82.259 I.186 J-2.556 E.03312
G3 X88.491 Y80.709 I.734 J-.734 E.04229
G1 X88.755 Y80.62 E.00671
M106 S124.95
; WIPE_START
G1 X89.743 Y80.775 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.68 I-.719 J.982 P1  F42000
G1 X95.026 Y84.643 Z18.68
G1 Z18.28
G1 E.4 F1800
G1 F659
M204 S6000
G2 X94.784 Y83.644 I-1.159 J-.248 E.02563
G3 X94.721 Y85.535 I-.031 J.945 E.07168
G3 X94.365 Y85.505 I-.121 J-.705 E.00873
G1 X94.606 Y85.264 E.00822
G1 X94.606 Y83.65 E.03892
G1 X94.727 Y83.635 E.00295
; WIPE_START
G1 F9000
G1 X95.046 Y83.687 E-.12268
G1 X95.321 Y83.824 E-.11669
G1 X95.534 Y84.031 E-.11306
G1 X95.568 Y84.096 E-.02757
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.68 I-1.136 J-.437 P1  F42000
G1 X86.53 Y107.585 Z18.68
G1 Z18.28
G1 E.4 F1800
; FEATURE: Outer wall
G1 F659
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.443 Y107.965 E.15451
G3 X86.152 Y106.738 I-.002 J-1.291 E.04739
G1 X86.15 Y79.38 E.65974
G3 X87.376 Y78.086 I1.291 J-.004 E.04745
G1 X93.85 Y78.085 E.15611
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
M73 P79 R7
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.68 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 18.44
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 115/141
; update layer progress
M73 L115
M991 S0 P114 ;notify layer change
; OBJECT_ID: 15
G1 X89.098 Y103.343 F42000
G1 Z18.44
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X89.6 Y102.661 I.487 J-.167 E.02398
G1 X89.699 Y102.253 E.01013
G3 X90.687 Y103.416 I-.303 J1.258 E.03937
G2 X91.225 Y104.418 I35.611 J-18.491 E.02743
G3 X89.928 Y105.484 I-.868 J.265 E.05164
G3 X89.006 Y104.417 I-.057 J-.883 E.03936
G1 X88.935 Y103.914 E.01225
G3 X89.309 Y102.253 I.733 J-.708 E.04861
G1 X89.643 Y102.239 E.00806
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.915 Y102.307 E-.10662
G1 X90.208 Y102.483 E-.12997
G1 X90.454 Y102.749 E-.13753
G1 X90.461 Y102.763 E-.00588
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.84 I-.117 J1.211 P1  F42000
G1 X91.869 Y102.899 Z18.84
G1 Z18.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.402 Y102.277 I.686 J.048 E.02116
G1 X92.463 Y101.861 E.01013
G3 X93.363 Y102.853 I-.141 J1.032 E.03508
G3 X93.869 Y103.794 I-24.296 J13.669 E.02577
G3 X92.313 Y104.722 I-.892 J.272 E.05981
G3 X91.809 Y103.778 I.997 J-1.14 E.02637
G3 X92.123 Y101.896 I.795 J-.835 E.05422
G1 X92.406 Y101.851 E.0069
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.953 Y102.046 E-.22062
G1 X93.166 Y102.27 E-.11752
G1 X93.215 Y102.368 E-.04186
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.84 I.953 J-.757 P1  F42000
G1 X89.771 Y98.029 Z18.84
G1 Z18.44
G1 E.4 F1800
G1 F753
M204 S6000
G3 X90.319 Y97.591 I.564 J.144 E.01813
G1 X90.393 Y97.177 E.01014
G3 X90.249 Y99.348 I-.262 J1.073 E.07439
G3 X89.466 Y97.669 I.116 J-1.077 E.05362
G3 X90.336 Y97.165 I.926 J.596 E.02519
; WIPE_START
G1 F9000
G1 X90.616 Y97.228 E-.10887
G1 X90.853 Y97.375 E-.10604
G1 X91.051 Y97.609 E-.11645
G1 X91.101 Y97.726 E-.04864
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.84 I1.133 J.443 P1  F42000
G1 X91.686 Y96.229 Z18.84
G1 Z18.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.176 Y95.515 I.557 J-.143 E.02365
G1 X92.247 Y95.101 E.01013
G1 X92.351 Y95.121 E.00255
G3 X93.183 Y96.107 I-.262 J1.065 E.03327
G3 X93.508 Y96.719 I-.547 J.683 E.01717
G3 X93.633 Y98.528 I-.619 J.951 E.05067
G3 X92.079 Y97.813 I-.492 J-.976 E.04736
G2 X91.629 Y96.913 I-1.354 J.115 E.02486
G3 X92.19 Y95.09 I.629 J-.805 E.0594
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.351 Y95.121 E-.06214
G1 X92.757 Y95.299 E-.16853
G1 X92.982 Y95.533 E-.12327
G1 X93.013 Y95.594 E-.02607
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.84 I.287 J-1.183 P1  F42000
G1 X88.363 Y94.464 Z18.84
G1 Z18.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.869 Y93.838 I.636 J-.003 E.02101
G1 X88.942 Y93.424 E.01013
G1 X89.065 Y93.45 E.00303
G3 X89.728 Y95.205 I-.42 J1.161 E.05137
G3 X88.449 Y96.668 I-1.107 J.323 E.05573
G3 X87.885 Y95.289 I.347 J-.946 E.04042
G2 X87.936 Y94.415 I-1.384 J-.519 E.02143
G3 X88.886 Y93.412 I.993 J-.011 E.03683
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.065 Y93.45 E-.06972
G1 X89.436 Y93.628 E-.15625
G1 X89.659 Y93.873 E-.12578
G1 X89.691 Y93.94 E-.02825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.84 I1.126 J.461 P1  F42000
G1 X90.789 Y91.256 Z18.84
G1 Z18.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.23 Y90.38 I.424 J-.336 E.02963
G1 X91.278 Y89.963 E.01013
G1 X91.323 Y89.968 E.00111
G3 X92.207 Y90.529 I-.005 J.985 E.02659
G2 X93.35 Y90.283 I.316 J-1.316 E.02916
G3 X94.535 Y91.575 I.337 J.88 E.05429
G3 X92.812 Y92.245 I-.898 J.241 E.06555
G2 X92.486 Y91.734 I-.856 J.187 E.01493
G1 X91.942 Y91.679 E.01319
G3 X90.216 Y90.912 I-.646 J-.871 E.05523
G3 X91.221 Y89.955 I1.009 J.053 E.03687
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.323 Y89.968 E-.0394
G1 X91.552 Y89.997 E-.08753
G1 X91.858 Y90.132 E-.12709
G1 X92.104 Y90.349 E-.12462
G1 X92.105 Y90.352 E-.00136
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.84 I.82 J-.899 P1  F42000
G1 X89.276 Y87.77 Z18.84
G1 Z18.44
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.944 Y87.42 I1.335 J1.738 E.01828
G1 X89.98 Y87.001 E.01013
G3 X90.829 Y88.008 I-.132 J.972 E.03482
G3 X90.189 Y89.192 I-1.081 J.18 E.03493
G3 X88.754 Y87.792 I-.256 J-1.172 E.05719
G3 X89.285 Y87.281 I.868 J.37 E.01825
G3 X89.922 Y86.995 I.678 J.657 E.01725
M106 S124.95
; WIPE_START
G1 X90.413 Y87.148 E-.19522
G1 X90.621 Y87.363 E-.11353
G1 X90.704 Y87.531 E-.07125
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.84 I.47 J1.123 P1  F42000
G1 X92.503 Y86.778 Z18.84
G1 Z18.44
G1 E.4 F1800
G1 F753
M204 S6000
G3 X92.801 Y86.325 I1.089 J.393 E.01319
G1 X92.739 Y85.905 E.01024
G1 X93.684 Y85.905 E.0228
G3 X93.255 Y87.771 I-.643 J.834 E.05795
G3 X92.681 Y85.905 I-.215 J-.955 E.07051
; WIPE_START
G1 F9000
G1 X93.681 Y85.905 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.84 I1.057 J.603 P1  F42000
G1 X94.377 Y84.686 Z18.84
G1 Z18.44
G1 E.4 F1800
; FEATURE: Support interface
G1 F753
M204 S6000
G1 X93.616 Y84.686 E.01835
G1 X93.601 Y84.617 E.0017
G1 X87.548 Y84.617 E.14598
G1 X87.548 Y84.262 E.00857
G1 X93.317 Y84.262 E.13914
G1 X93.317 Y84.339 E.00185
G1 X93.589 Y84.423 E.00685
M73 P79 R6
G1 X93.859 Y84.03 E.01151
G3 X94.377 Y83.8 I.408 J.221 E.01468
M204 S10000
G1 X95.026 Y84.62 F42000
; FEATURE: Support
G1 F753
M204 S6000
G2 X94.844 Y83.653 I-1.364 J-.243 E.02424
G3 X94.407 Y85.462 I-.071 J.94 E.07872
G1 X94.606 Y85.264 E.00676
G1 X94.606 Y83.668 E.03849
G1 X94.787 Y83.644 E.0044
; WIPE_START
G1 F9000
G1 X95.089 Y83.694 E-.1165
G1 X95.351 Y83.828 E-.11198
G1 X95.558 Y84.033 E-.11057
G1 X95.605 Y84.13 E-.04095
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.84 I.388 J-1.153 P1  F42000
G1 X88.494 Y81.739 Z18.84
G1 Z18.44
G1 E.4 F1800
G1 F753
M204 S6000
G3 X88.679 Y80.978 I.619 J-.252 E.02017
G3 X88.904 Y80.96 I.17 J.704 E.00545
G1 X88.913 Y80.54 E.01013
G3 X89.572 Y80.793 I-.306 J1.781 E.01713
G3 X90.303 Y80.977 I.115 J1.086 E.01858
G2 X90.942 Y80.962 I.277 J-1.8 E.01549
G3 X92.707 Y81.58 I.734 J.732 E.05619
G3 X90.926 Y82.418 I-1.134 J-.098 E.05734
G2 X90.019 Y82.649 I-.214 J1.058 E.02336
G3 X89.197 Y82.558 I-.298 J-1.064 E.02044
G3 X88.029 Y81.363 I-.119 J-1.052 E.04643
G3 X88.855 Y80.538 I.781 J-.044 E.03176
; WIPE_START
G1 F9000
G1 X89.572 Y80.793 E-.28905
G1 X89.81 Y80.812 E-.09096
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.84 I-1.208 J-.148 P1  F42000
G1 X86.53 Y107.585 Z18.84
G1 Z18.44
G1 E.4 F1800
; FEATURE: Outer wall
G1 F753
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.001 J-1.294 E.04742
G1 X86.15 Y79.38 E.65974
G3 X87.377 Y78.086 I1.294 J-.001 E.04742
G1 X93.85 Y78.085 E.15611
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z18.84 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 116/141
; update layer progress
M73 L116
M991 S0 P115 ;notify layer change
; OBJECT_ID: 15
G1 X89.083 Y103.316 F42000
G1 Z18.6
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X89.548 Y102.603 I.443 J-.219 E.02472
G1 X89.644 Y102.194 E.01013
G3 X90.623 Y103.366 I-.289 J1.236 E.03949
G1 X90.821 Y103.827 E.01211
G3 X90.918 Y105.5 I-.547 J.871 E.04722
G3 X89.946 Y105.514 I-.501 J-1.032 E.02421
G3 X88.957 Y104.376 I-.104 J-.909 E.04277
G1 X88.924 Y103.868 E.01226
G3 X89.269 Y102.198 I.706 J-.725 E.04892
G1 X89.588 Y102.181 E.00771
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.863 Y102.248 E-.10747
G1 X90.149 Y102.42 E-.12707
G1 X90.39 Y102.68 E-.13445
G1 X90.403 Y102.706 E-.01101
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I-.14 J1.209 P1  F42000
G1 X91.887 Y102.878 Z19
G1 Z18.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.427 Y102.229 I.625 J-.029 E.02234
G1 X92.494 Y101.815 E.01013
G3 X93.36 Y102.857 I-.182 J1.031 E.03554
G3 X93.909 Y103.859 I-50.021 J28.083 E.02755
G3 X93.584 Y104.886 I-.919 J.274 E.02758
G3 X91.963 Y104.19 I-.535 J-.989 E.04889
G2 X91.626 Y103.46 I-.818 J-.064 E.02025
G3 X92.437 Y101.805 I.879 J-.596 E.05385
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.94 Y101.987 E-.20319
G1 X93.152 Y102.209 E-.1168
G1 X93.223 Y102.351 E-.06001
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I.941 J-.772 P1  F42000
G1 X89.766 Y98.136 Z19
G1 Z18.6
G1 E.4 F1800
G1 F652
M204 S6000
G3 X90.266 Y97.689 I.717 J.299 E.01672
G1 X90.308 Y97.271 E.01014
G1 X90.533 Y97.304 E.00548
G3 X90.242 Y99.402 I-.417 J1.011 E.06949
G3 X89.47 Y97.755 I.11 J-1.056 E.05267
G3 X90.251 Y97.262 I.91 J.577 E.02302
; WIPE_START
G1 F9000
G1 X90.533 Y97.304 E-.10831
G1 X90.818 Y97.457 E-.12298
G1 X91.032 Y97.702 E-.12336
G1 X91.058 Y97.763 E-.02534
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I1.127 J.459 P1  F42000
G1 X91.69 Y96.212 Z19
G1 Z18.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.154 Y95.475 I.496 J-.202 E.02452
G1 X92.224 Y95.061 E.01013
G1 X92.303 Y95.076 E.00194
G3 X93.141 Y96.199 I-.195 J1.02 E.03709
G1 X93.371 Y96.681 E.01288
G3 X93.667 Y98.586 I-.47 J1.049 E.05517
G3 X92.087 Y97.441 I-.466 J-1.019 E.05712
G1 X91.817 Y96.971 E.01307
G3 X92.167 Y95.05 I.421 J-.916 E.06416
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.303 Y95.076 E-.05262
G1 X92.725 Y95.253 E-.17406
G1 X92.946 Y95.483 E-.1211
G1 X92.985 Y95.558 E-.03223
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I.291 J-1.182 P1  F42000
G1 X88.365 Y94.42 Z19
G1 Z18.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.855 Y93.774 I.61 J-.045 E.02136
G1 X88.928 Y93.36 E.01013
G1 X89.108 Y93.398 E.00445
G3 X89.726 Y95.018 I-.47 J1.107 E.0467
G3 X89.495 Y96.29 I-2.643 J.176 E.03148
G3 X87.811 Y95.495 I-.801 J-.483 E.06632
G2 X87.933 Y94.334 I-1.799 J-.777 E.02857
G3 X88.871 Y93.349 I.978 J-.009 E.03629
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.108 Y93.398 E-.09206
G1 X89.413 Y93.559 E-.1311
G1 X89.632 Y93.798 E-.1229
G1 X89.671 Y93.878 E-.03394
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I1.168 J.343 P1  F42000
G1 X90.584 Y90.769 Z19
G1 Z18.6
G1 E.4 F1800
G1 F652
M204 S6000
G3 X91.168 Y90.391 I.495 J.124 E.01847
G1 X91.218 Y89.974 E.01013
G1 X91.264 Y89.98 E.00112
G3 X91.164 Y91.864 I.003 J.945 E.07415
G3 X90.325 Y90.316 I.04 J-1.023 E.05113
G3 X91.16 Y89.967 I.888 J.951 E.02229
; WIPE_START
G1 F9000
M73 P80 R6
G1 X91.264 Y89.98 E-.03956
G1 X91.485 Y90.007 E-.08465
G1 X91.783 Y90.141 E-.12416
G1 X92.023 Y90.354 E-.12219
G1 X92.036 Y90.376 E-.00945
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I-.655 J1.025 P1  F42000
G1 X93.126 Y91.073 Z19
G1 Z18.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.734 Y90.566 I.941 J.511 E.01955
G1 X93.786 Y90.149 E.01014
G3 X94.54 Y91.558 I-.103 J.962 E.04537
G3 X92.86 Y92.335 I-.878 J.307 E.06615
G3 X93.701 Y90.142 I1.146 J-.818 E.06701
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.987 Y90.168 E-.10898
G1 X94.242 Y90.286 E-.10678
G1 X94.447 Y90.487 E-.10903
G1 X94.514 Y90.616 E-.0552
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I.611 J-1.052 P1  F42000
G1 X89.394 Y87.642 Z19
G1 Z18.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.904 Y87.34 I6.358 J10.161 E.0143
G1 X89.901 Y86.92 E.01013
G3 X90.833 Y87.908 I-.014 J.947 E.03652
G3 X90.104 Y89.121 I-1.248 J.075 E.03626
G3 X88.697 Y87.765 I-.274 J-1.123 E.05611
G3 X89.305 Y87.223 I.891 J.387 E.02028
G3 X89.843 Y86.918 I.736 J.672 E.01516
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.123 Y86.925 E-.10614
G1 X90.387 Y87.036 E-.10899
G1 X90.619 Y87.26 E-.12252
G1 X90.669 Y87.359 E-.04235
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I.411 J1.145 P1  F42000
G1 X92.505 Y86.7 Z19
G1 Z18.6
G1 E.4 F1800
G1 F652
M204 S6000
G3 X93.072 Y86.26 I.804 J.452 E.01778
G1 X93.087 Y85.84 E.01013
G3 X93.599 Y87.624 I-.001 J.966 E.0601
G3 X92.431 Y86.092 I-.598 J-.756 E.07382
G3 X93.03 Y85.837 I.722 J.864 E.01591
; WIPE_START
G1 F9000
G1 X93.318 Y85.853 E-.10972
G1 X93.658 Y85.985 E-.13853
G1 X93.873 Y86.188 E-.1124
G1 X93.896 Y86.233 E-.01935
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I1.194 J.234 P1  F42000
G1 X94.25 Y84.424 Z19
G1 Z18.6
G1 E.4 F1800
G1 F652
M204 S6000
G3 X94.822 Y84.078 I.735 J.57 E.01647
G1 X94.884 Y83.663 E.01013
G3 X94.237 Y85.334 I-.094 J.924 E.08239
G3 X93.833 Y84.897 I.459 J-.831 E.01461
G3 X93.825 Y84.307 I1.31 J-.311 E.01434
G3 X94.827 Y83.654 I1.019 J.466 E.03042
; WIPE_START
G1 F9000
G1 X95.377 Y83.836 E-.22016
G1 X95.578 Y84.037 E-.10814
G1 X95.631 Y84.162 E-.0517
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I.374 J-1.158 P1  F42000
G1 X88.442 Y81.842 Z19
G1 Z18.6
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.47 Y81.033 I2.554 J-.316 E.0196
G3 X88.835 Y80.873 I.309 J.209 E.01013
G1 X88.926 Y80.463 E.01013
G3 X89.59 Y80.813 I-.325 J1.422 E.01829
G3 X90.392 Y81.027 I.13 J1.125 E.02051
G1 X90.946 Y81.021 E.01335
G3 X92.71 Y81.862 I.785 J.625 E.06495
G3 X90.971 Y82.389 I-1.092 J-.47 E.04988
G1 X90.776 Y82.544 E.00601
G1 X90.422 Y82.459 E.00878
G3 X89.17 Y82.513 I-.665 J-.872 E.03219
G3 X88.301 Y82.393 I-.257 J-1.336 E.02152
G3 X88.016 Y81.632 I.566 J-.646 E.02042
G3 X88.547 Y80.473 I.882 J-.297 E.03387
G1 X88.87 Y80.45 E.00781
M106 S124.95
; WIPE_START
G1 X89.239 Y80.565 E-.14684
G1 X89.59 Y80.813 E-.16322
G1 X89.773 Y80.827 E-.06994
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I-1.208 J-.146 P1  F42000
G1 X86.53 Y107.585 Z19
G1 Z18.6
G1 E.4 F1800
; FEATURE: Outer wall
G1 F652
M204 S5000
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.004 J-1.291 E.04746
G1 X86.15 Y79.38 E.65974
G3 X87.377 Y78.086 I1.291 J-.005 E.04746
G1 X93.85 Y78.085 E.15611
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y107.525 E.70079
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y107.533 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 18.76
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 117/141
; update layer progress
M73 L117
M991 S0 P116 ;notify layer change
; OBJECT_ID: 15
G1 X89.066 Y103.276 F42000
G1 Z18.76
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X89.489 Y102.544 I.443 J-.232 E.02431
G1 X89.585 Y102.135 E.01013
G3 X90.526 Y103.488 I-.209 J1.149 E.04412
G3 X91.331 Y104.538 I-2.861 J3.026 E.03204
G3 X89.958 Y105.513 I-.849 J.259 E.05349
G3 X88.921 Y104.323 I-.211 J-.863 E.04689
G1 X88.904 Y103.809 E.01241
G3 X89.297 Y102.133 I.671 J-.726 E.05035
G1 X89.529 Y102.121 E.0056
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.812 Y102.191 E-.1108
G1 X90.093 Y102.358 E-.12426
G1 X90.328 Y102.612 E-.13145
G1 X90.344 Y102.643 E-.01348
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I-.164 J1.206 P1  F42000
G1 X91.903 Y102.855 Z19.16
G1 Z18.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.401 Y102.175 I.608 J-.077 E.02243
G1 X92.458 Y101.759 E.01014
G3 X93.321 Y102.897 I-.128 J.993 E.03835
G3 X93.948 Y103.926 I-6.144 J4.446 E.02909
G3 X92.452 Y104.844 I-.856 J.282 E.0582
G3 X91.975 Y103.909 I.947 J-1.073 E.02591
G3 X91.503 Y103.063 I4.676 J-3.16 E.02339
G3 X92.401 Y101.749 I.976 J-.297 E.04402
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.674 Y101.796 E-.10514
G1 X92.928 Y101.934 E-.11005
G1 X93.138 Y102.152 E-.11485
G1 X93.197 Y102.269 E-.04995
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I.928 J-.787 P1  F42000
G1 X89.768 Y98.224 Z19.16
G1 Z18.76
G1 E.4 F1800
G1 F802
M204 S6000
G3 X90.257 Y97.785 I.695 J.283 E.0164
G1 X90.301 Y97.367 E.01014
G1 X90.481 Y97.394 E.0044
G3 X90.504 Y99.406 I-.376 J1.01 E.06253
G3 X89.345 Y98.145 I-.233 J-.949 E.05032
G3 X90.243 Y97.359 I1.006 J.243 E.03069
; WIPE_START
G1 F9000
G1 X90.481 Y97.394 E-.09124
G1 X90.802 Y97.552 E-.13583
G1 X91.012 Y97.792 E-.12128
G1 X91.045 Y97.868 E-.03166
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I1.133 J.443 P1  F42000
G1 X91.699 Y96.196 Z19.16
G1 Z18.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.133 Y95.437 I.465 J-.237 E.02497
G1 X92.201 Y95.023 E.01013
G1 X92.251 Y95.032 E.00123
G3 X93.08 Y96.312 I-.177 J1.023 E.04131
G2 X93.709 Y96.985 I1.246 J-.535 E.02264
G3 X93.421 Y98.762 I-.645 J.807 E.05269
G3 X92.153 Y97.496 I-.107 J-1.162 E.04926
G1 X91.95 Y96.994 E.01307
G3 X91.863 Y95.049 I.322 J-.989 E.06074
G1 X92.144 Y95.012 E.00684
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.251 Y95.032 E-.04137
G1 X92.693 Y95.21 E-.18119
G1 X92.911 Y95.434 E-.11867
G1 X92.957 Y95.525 E-.03877
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I.29 J-1.182 P1  F42000
G1 X88.369 Y94.401 Z19.16
G1 Z18.76
G1 E.4 F1800
G1 F802
M204 S6000
G3 X88.845 Y93.712 I.581 J-.107 E.02243
G1 X88.895 Y93.294 E.01015
G3 X89.692 Y94.924 I-.209 J1.112 E.05077
G3 X89.605 Y96.052 I-28.181 J-1.603 E.02727
G3 X87.797 Y95.563 I-.916 J-.198 E.07336
G2 X87.931 Y94.255 I-1.409 J-.805 E.03264
G3 X88.837 Y93.287 I.961 J-.008 E.03527
; WIPE_START
G1 F9000
G1 X89.131 Y93.344 E-.11362
G1 X89.391 Y93.494 E-.11421
G1 X89.605 Y93.727 E-.12025
G1 X89.642 Y93.802 E-.03192
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I1.171 J.332 P1  F42000
G1 X90.556 Y90.584 Z19.16
G1 Z18.76
G1 E.4 F1800
G1 F802
M204 S6000
G3 X91.032 Y90.385 I.375 J.227 E.01331
G1 X91.141 Y89.98 E.01013
G3 X91.072 Y91.857 I.05 J.942 E.07555
G3 X90.398 Y90.123 I.038 J-1.012 E.05682
G3 X91.085 Y89.965 I.571 J.907 E.01731
; WIPE_START
G1 F9000
G1 X91.421 Y90.018 E-.12937
G1 X91.712 Y90.15 E-.12125
G1 X91.946 Y90.359 E-.11952
G1 X91.959 Y90.382 E-.00987
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I-.578 J1.071 P1  F42000
G1 X93.167 Y91.034 Z19.16
G1 Z18.76
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.771 Y90.501 I.902 J.413 E.02003
G1 X93.824 Y90.084 E.01013
G3 X94.542 Y91.539 I-.122 J.965 E.0463
G3 X93.635 Y92.883 I-.916 J.36 E.04595
G3 X92.707 Y91.427 I.257 J-1.187 E.04632
G3 X93.74 Y90.076 I1.263 J-.105 E.04497
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.019 Y90.104 E-.10637
G1 X94.269 Y90.223 E-.10527
G1 X94.472 Y90.422 E-.10815
G1 X94.544 Y90.563 E-.06021
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I.59 J-1.065 P1  F42000
G1 X89.276 Y87.645 Z19.16
G1 Z18.76
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X89.935 Y87.255 I-24.276 J-41.751 E.01848
G1 X89.927 Y86.835 E.01014
G3 X90.834 Y87.848 I.003 J.91 E.03705
G3 X88.631 Y87.776 I-1.106 J.114 E.09151
G3 X89.289 Y87.181 I.849 J.277 E.02239
G3 X89.869 Y86.833 I.826 J.72 E.01657
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.139 Y86.839 E-.10269
G1 X90.398 Y86.947 E-.10648
G1 X90.616 Y87.154 E-.11448
G1 X90.685 Y87.285 E-.05635
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I.347 J1.167 P1  F42000
G1 X92.47 Y86.755 Z19.16
G1 Z18.76
G1 E.4 F1800
G1 F802
M204 S6000
G3 X93.025 Y86.32 I.762 J.401 E.01751
G1 X93.044 Y85.901 E.01013
G1 X93.173 Y85.909 E.00312
G3 X93.266 Y87.798 I-.152 J.954 E.06353
G3 X92.026 Y87.205 I-.394 J-.769 E.03832
G3 X92.987 Y85.897 I1.067 J-.223 E.04414
; WIPE_START
G1 F9000
G1 X93.173 Y85.909 E-.07112
G1 X93.582 Y86.034 E-.16236
G1 X93.804 Y86.238 E-.1144
G1 X93.843 Y86.313 E-.03212
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I1.174 J.321 P1  F42000
G1 X94.35 Y84.459 Z19.16
G1 Z18.76
G1 E.4 F1800
G1 F802
M204 S6000
G1 X94.35 Y84.45 E.0002
G3 X94.852 Y84.089 I.517 J.188 E.01585
G1 X94.922 Y83.675 E.01013
G3 X94.096 Y85.117 I-.089 J.907 E.08759
G3 X94.857 Y83.664 I.769 J-.523 E.04844
; WIPE_START
G1 F9000
G1 X95.142 Y83.711 E-.10993
G1 X95.388 Y83.837 E-.10481
G1 X95.588 Y84.033 E-.10645
G1 X95.66 Y84.17 E-.05881
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I.379 J-1.156 P1  F42000
G1 X88.375 Y81.783 Z19.16
G1 Z18.76
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X88.364 Y81.097 I-3.715 J-.282 E.01655
G3 X88.749 Y80.791 I.395 J.102 E.01274
G1 X88.842 Y80.381 E.01013
G3 X89.791 Y80.813 I-1.932 J5.507 E.02519
G3 X90.494 Y81.04 I-1.907 J7.114 E.01781
G1 X91.009 Y81.026 E.01243
G3 X92.619 Y81.015 I.81 J.7 E.04394
G3 X92.129 Y82.47 I-.675 J.583 E.04459
G3 X91.143 Y82.388 I-.396 J-1.211 E.02451
G1 X90.903 Y82.331 E.00593
G3 X89.796 Y82.686 I-4.47 J-12.034 E.02806
G2 X88.471 Y82.57 I-1.039 J4.272 E.0322
G3 X87.986 Y81.616 I.238 J-.721 E.02864
G3 X88.491 Y80.391 I.874 J-.356 E.03542
G1 X88.786 Y80.367 E.00713
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.112 Y80.453 E-.12836
G1 X89.697 Y80.763 E-.25164
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I-.909 J-.809 P1  F42000
G1 X86.571 Y84.279 Z19.16
G1 Z18.76
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X86.94 Y84.279 E.0089
M106 S124.95
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X93.3 Y84.279 E.1653
G1 X93.3 Y84.6 E.00833
G1 X86.94 Y84.6 E.1653
M106 S124.95
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X86.571 Y84.6 E.0089
M106 S124.95
G1 F747.227
G1 X86.53 Y84.6 E.00099
G1 F802
G1 X86.53 Y85 E.00965
G1 X86.53 Y85.4 E.00965
G1 X86.53 Y85.8 E.00965
G1 X86.53 Y107.585 E.52534
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
M73 P81 R6
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.001 J-1.294 E.04742
G1 X86.15 Y79.38 E.65974
G3 X87.377 Y78.086 I1.291 J-.004 E.04746
G1 X93.85 Y78.085 E.1561
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y84.26 E.13977
; WIPE_START
G1 F12000
M204 S6000
G1 X86.94 Y84.279 E-.15597
G1 X87.53 Y84.279 E-.22403
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.16 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 18.92
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 118/141
; update layer progress
M73 L118
M991 S0 P117 ;notify layer change
; OBJECT_ID: 15
G1 X88.343 Y81.75 F42000
G1 Z18.92
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G2 X88.307 Y81.218 I-.487 J-.234 E.01346
G3 X88.689 Y80.712 I.363 J-.123 E.01798
G1 X88.781 Y80.302 E.01013
G1 X88.985 Y80.355 E.00508
G2 X90.122 Y80.894 I2.07 J-2.898 E.03051
G1 X90.454 Y81.074 E.00911
G1 X91.009 Y81.088 E.01338
G3 X92.139 Y80.609 I1.055 J.917 E.03063
G3 X92.707 Y82.241 I-.342 J1.034 E.04813
G3 X91.217 Y82.351 I-.84 J-1.235 E.03774
G1 X90.974 Y82.295 E.00601
G1 X90.467 Y82.435 E.01268
G3 X89.834 Y82.685 I-.665 J-.754 E.01675
G1 X89.055 Y82.572 E.019
G3 X87.959 Y81.565 I-.398 J-.666 E.04794
G3 X88.434 Y80.311 I.83 J-.403 E.03621
G1 X88.725 Y80.287 E.00704
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.985 Y80.355 E-.10204
G1 X89.459 Y80.669 E-.21618
G1 X89.613 Y80.721 E-.06179
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I-.731 J.973 P1  F42000
G1 X94.449 Y84.355 Z19.32
G1 Z18.92
G1 E.4 F1800
G1 F879
M204 S6000
G3 X94.856 Y84.1 I.456 J.275 E.01202
G1 X94.897 Y83.682 E.01013
G3 X94.67 Y83.702 I-.033 J.887 E.12905
G1 X94.839 Y83.676 E.00412
; WIPE_START
G1 F9000
G1 X95.111 Y83.706 E-.10389
G1 X95.37 Y83.822 E-.10771
G1 X95.588 Y84.023 E-.11288
G1 X95.658 Y84.151 E-.05551
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I-.776 J-.937 P1  F42000
G1 X92.441 Y86.815 Z19.32
G1 Z18.92
G1 E.4 F1800
G1 F879
M204 S6000
G3 X92.986 Y86.377 I.602 J.191 E.01787
G1 X93.013 Y85.958 E.01013
G3 X93.405 Y87.73 I-.023 J.934 E.05988
G3 X92.075 Y87.599 I-.598 J-.735 E.03574
G3 X92.955 Y85.954 I1.033 J-.505 E.05247
; WIPE_START
G1 F9000
G1 X93.252 Y85.976 E-.11339
G1 X93.523 Y86.092 E-.11196
G1 X93.747 Y86.296 E-.11506
G1 X93.795 Y86.388 E-.0396
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I-.313 J-1.176 P1  F42000
G1 X89.321 Y87.579 Z19.32
G1 Z18.92
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X89.807 Y87.221 I-.414 J-1.07 E.01472
G1 X89.964 Y87.167 E.004
G1 X89.955 Y86.747 E.01013
G3 X90.844 Y87.706 I-.066 J.952 E.03473
G3 X88.61 Y88.333 I-1.167 J.136 E.08008
G3 X89.279 Y87.15 I.801 J-.327 E.0377
G3 X89.897 Y86.746 I.853 J.631 E.01818
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.156 Y86.75 E-.09838
G1 X90.41 Y86.856 E-.10452
G1 X90.626 Y87.06 E-.11288
G1 X90.704 Y87.21 E-.06422
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I-1.214 J-.083 P1  F42000
G1 X90.472 Y90.58 Z19.32
G1 Z18.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.923 Y90.332 I.387 J.17 E.01333
G1 X90.992 Y89.918 E.01013
G3 X92.019 Y90.626 I-.158 J1.328 E.03129
G3 X91.463 Y91.792 I-.953 J.26 E.03393
G3 X90.192 Y91.292 I-.4 J-.849 E.03689
G3 X90.935 Y89.909 I.678 J-.527 E.04779
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.642 Y90.156 E-.28457
G1 X91.828 Y90.325 E-.09543
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I-.523 J1.099 P1  F42000
G1 X93.216 Y90.985 Z19.32
G1 Z18.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.779 Y90.435 I.872 J.329 E.0196
G1 X93.792 Y90.015 E.01013
G3 X94.518 Y91.578 I-.076 J.986 E.05049
G3 X93.624 Y92.944 I-.893 J.39 E.04663
G3 X92.775 Y91.4 I.297 J-1.169 E.04764
G3 X93.734 Y90.013 I1.219 J-.182 E.04478
M106 S124.95
; WIPE_START
G1 X94.002 Y90.027 E-.10193
G1 X94.271 Y90.143 E-.11149
G1 X94.491 Y90.354 E-.11554
G1 X94.552 Y90.473 E-.05104
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I-1.091 J-.539 P1  F42000
G1 X91.721 Y96.207 Z19.32
G1 Z18.92
G1 E.4 F1800
M106 S127.5
G1 F879
M204 S6000
G3 X92.115 Y95.4 I.426 J-.292 E.02627
G1 X92.156 Y94.982 E.01013
G3 X93.033 Y96.324 I-.122 J1.037 E.04407
G1 X93.308 Y96.824 E.01376
G3 X93.696 Y98.722 I-.308 J1.052 E.0573
G3 X92.199 Y97.704 I-.419 J-.994 E.05182
G1 X92.245 Y97.315 E.00943
G2 X91.584 Y96.708 I-1.254 J.701 E.02201
G3 X92.098 Y94.977 I.597 J-.765 E.056
; WIPE_START
G1 F9000
G1 X92.396 Y95.026 E-.11465
G1 X92.664 Y95.169 E-.11552
G1 X92.876 Y95.387 E-.11551
G1 X92.917 Y95.467 E-.03432
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I.282 J-1.184 P1  F42000
G1 X88.374 Y94.384 Z19.32
G1 Z18.92
G1 E.4 F1800
G1 F879
M204 S6000
G3 X88.791 Y93.656 I.543 J-.172 E.02272
G1 X88.827 Y93.237 E.01014
G3 X89.615 Y94.937 I-.122 J1.089 E.05418
G3 X89.562 Y96.124 I-11.75 J.066 E.02868
G3 X87.785 Y95.631 I-.901 J-.2 E.07228
G2 X88.034 Y94.68 I-7.764 J-2.534 E.02372
G3 X88.77 Y93.23 I.884 J-.463 E.04582
; WIPE_START
G1 F9000
G1 X89.027 Y93.262 E-.09841
G1 X89.355 Y93.42 E-.13847
G1 X89.58 Y93.659 E-.12467
G1 X89.601 Y93.703 E-.01844
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I-1.216 J.045 P1  F42000
G1 X89.77 Y98.31 Z19.32
G1 Z18.92
G1 E.4 F1800
G1 F879
M204 S6000
G3 X90.249 Y97.88 I.672 J.266 E.01607
G1 X90.294 Y97.462 E.01014
G1 X90.427 Y97.482 E.00324
G3 X90.161 Y99.497 I-.308 J.984 E.06957
G3 X90.237 Y97.453 I.193 J-1.016 E.0708
; WIPE_START
G1 F9000
G1 X90.427 Y97.482 E-.0731
G1 X90.787 Y97.644 E-.14987
G1 X90.994 Y97.879 E-.11908
G1 X91.033 Y97.971 E-.03795
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I-1.197 J.218 P1  F42000
G1 X91.92 Y102.85 Z19.32
G1 Z18.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.357 Y102.128 I.587 J-.138 E.02255
G1 X92.383 Y101.709 E.01013
G3 X93.33 Y102.876 I-.076 J1.029 E.04059
G1 X93.552 Y103.361 E.01288
G3 X93.598 Y105.05 I-.591 J.861 E.04746
G3 X92.051 Y103.986 I-.404 J-1.07 E.05311
G2 X91.513 Y102.986 I-20.613 J10.454 E.02739
G3 X92.325 Y101.704 I.962 J-.289 E.04151
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.613 Y101.731 E-.10968
G1 X92.902 Y101.872 E-.12218
G1 X93.124 Y102.097 E-.12002
G1 X93.157 Y102.163 E-.02812
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I-.329 J-1.172 P1  F42000
G1 X89.08 Y103.309 Z19.32
G1 Z18.92
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.432 Y102.492 I.395 J-.314 E.02625
G1 X89.487 Y102.076 E.01013
G3 X90.476 Y103.308 I-.146 J1.129 E.04208
G1 X90.687 Y103.8 E.01292
G3 X91.219 Y105.43 I-.419 J1.039 E.04708
G3 X89.957 Y105.519 I-.684 J-.708 E.03311
G3 X88.965 Y104.166 I-.272 J-.841 E.05328
G1 X88.801 Y103.645 E.01319
G3 X89.43 Y102.067 I.696 J-.636 E.05095
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.815 Y102.161 E-.15056
G1 X90.038 Y102.296 E-.09918
G1 X90.269 Y102.545 E-.12878
G1 X90.271 Y102.548 E-.00148
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I1.193 J-.239 P1  F42000
G1 X86.571 Y84.038 Z19.32
G1 Z18.92
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X92.96 Y84.038 E.15407
M106 S124.95
M106 S127.5
G1 F879
G1 X92.96 Y84.185 E.00354
M106 S124.95
M106 S127.5
G1 X93.3 Y84.185 E.0082
M106 S124.95
M106 S127.5
G1 X93.3 Y84.238 E.0013
G1 X93.3 Y84.641 E.00971
G1 X93.3 Y84.841 E.00483
M106 S124.95
M106 S127.5
G1 F600
G1 X86.571 Y84.841 E.16227
M106 S124.95
G1 F747.227
G1 X86.53 Y84.841 E.00099
G1 F879
G1 X86.53 Y85.241 E.00965
G1 X86.53 Y85.641 E.00965
G1 X86.53 Y86.041 E.00965
G1 X86.53 Y107.585 E.51952
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.004 J-1.291 E.04745
G1 X86.15 Y79.38 E.65974
G3 X87.374 Y78.086 I1.291 J-.005 E.04741
G1 X93.85 Y78.085 E.15616
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y84.019 E.13394
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y84.022 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.32 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X86.351 Y84.44
G1 Z18.92
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.437279
G1 F879
M204 S6000
G1 X92.566 Y84.44 E.1566
; LINE_WIDTH: 0.41269
G1 X92.63 Y84.464 E.00163
; LINE_WIDTH: 0.363801
G1 X92.695 Y84.488 E.00142
; LINE_WIDTH: 0.314912
G1 X92.76 Y84.513 E.00121
; LINE_WIDTH: 0.290458
G1 X93.1 Y84.513 E.00545
M204 S10000
G1 X92.739 Y84.238 F42000
; LINE_WIDTH: 0.345922
G1 F879
M204 S6000
G1 X92.682 Y84.305 E.00173
; LINE_WIDTH: 0.382412
G1 X92.624 Y84.372 E.00193
; LINE_WIDTH: 0.418903
G1 X92.566 Y84.44 E.00213
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 19.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12676.603
G1 X92.624 Y84.372 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 119/141
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z19.32 I-.104 J1.213 P1  F42000
G1 X94.433 Y84.527 Z19.32
G1 Z19.08
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F837
M204 S6000
G1 X94.433 Y84.5 E.00066
G3 X94.86 Y84.114 I.513 J.138 E.01465
G1 X94.885 Y83.695 E.01013
G1 X94.929 Y83.699 E.00105
G3 X94.545 Y83.759 I-.06 J.875 E.12342
G1 X94.828 Y83.69 E.00702
; WIPE_START
G1 F9000
G1 X94.929 Y83.699 E-.03856
G1 X95.117 Y83.715 E-.07194
G1 X95.382 Y83.832 E-.10983
G1 X95.594 Y84.027 E-.10955
G1 X95.656 Y84.144 E-.05012
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I-.777 J-.936 P1  F42000
G1 X92.407 Y86.84 Z19.48
G1 Z19.08
G1 E.4 F1800
M73 P82 R6
G1 F9000
M204 S6000
G3 X92.886 Y86.392 I.628 J.191 E.01657
G1 X92.914 Y85.973 E.01013
G3 X93.457 Y87.689 I.013 J.94 E.05796
G3 X92.196 Y87.872 I-.752 J-.751 E.03293
G3 X92.035 Y86.644 I.73 J-.721 E.03208
G3 X92.845 Y85.968 I1.143 J.548 E.02625
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.134 Y85.986 E-.10977
G1 X93.47 Y86.14 E-.14045
G1 X93.692 Y86.347 E-.1156
G1 X93.71 Y86.381 E-.01418
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I-.316 J-1.175 P1  F42000
G1 X89.383 Y87.543 Z19.48
G1 Z19.08
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X89.506 Y87.519 E.00304
G3 X89.996 Y87.077 I.688 J.269 E.0165
G1 X89.988 Y86.657 E.01013
G3 X90.85 Y87.604 I-.08 J.939 E.03398
G3 X89.153 Y88.896 I-1.293 J.062 E.06044
G3 X89.256 Y87.14 I.251 J-.866 E.05859
G3 X89.93 Y86.656 I.899 J.54 E.02058
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.174 Y86.659 E-.09275
G1 X90.423 Y86.762 E-.10249
G1 X90.635 Y86.964 E-.11118
G1 X90.725 Y87.135 E-.07358
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I-1.212 J-.111 P1  F42000
G1 X90.393 Y90.753 Z19.48
G1 Z19.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.815 Y90.283 I.41 J-.057 E.01735
G1 X90.886 Y89.869 E.01013
G3 X91.996 Y90.912 I-.14 J1.261 E.03941
G3 X90.701 Y91.867 I-.974 J.034 E.04562
G3 X89.974 Y90.492 I.896 J-1.354 E.03912
G1 X90.065 Y90.258 E.00606
G3 X90.829 Y89.858 I.707 J.42 E.02191
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.197 Y89.934 E-.14285
G1 X91.563 Y90.141 E-.15974
G1 X91.711 Y90.281 E-.07741
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I-.515 J1.103 P1  F42000
G1 X93.251 Y91.001 Z19.48
G1 Z19.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.791 Y90.371 I.734 J.083 E.02124
G1 X93.789 Y89.951 E.01013
G1 X93.844 Y89.952 E.00131
G3 X94.664 Y91.188 I-.083 J.945 E.04105
G1 X94.499 Y91.593 E.01054
G3 X93.641 Y93.005 I-.845 J.454 E.04803
G3 X92.851 Y91.468 I.267 J-1.109 E.0473
G3 X93.732 Y89.949 I1.179 J-.331 E.0472
M106 S124.95
; WIPE_START
G1 X93.844 Y89.952 E-.0427
G1 X94.017 Y89.96 E-.06602
G1 X94.279 Y90.069 E-.10763
G1 X94.493 Y90.267 E-.11104
G1 X94.558 Y90.389 E-.05262
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I-1.095 J-.531 P1  F42000
G1 X91.742 Y96.2 Z19.48
G1 Z19.08
G1 E.4 F1800
M106 S127.5
G1 F837
M204 S6000
G3 X92.058 Y95.371 I.394 J-.324 E.0259
G1 X92.09 Y94.952 E.01013
G3 X92.997 Y96.254 I-.06 J1.009 E.04401
G2 X93.463 Y96.935 I.913 J-.125 E.02062
G3 X93.727 Y98.776 I-.425 J1 E.05383
G3 X92.257 Y97.785 I-.412 J-.974 E.05067
G2 X91.883 Y96.833 I-.767 J-.248 E.02673
G3 X92.03 Y94.946 I.296 J-.926 E.06279
; WIPE_START
G1 F9000
G1 X92.323 Y94.976 E-.11181
G1 X92.55 Y95.079 E-.09477
G1 X92.844 Y95.346 E-.15079
G1 X92.871 Y95.399 E-.02263
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I.276 J-1.185 P1  F42000
G1 X88.387 Y94.353 Z19.48
G1 Z19.08
G1 E.4 F1800
G1 F837
M204 S6000
G3 X88.776 Y93.601 I.519 J-.208 E.02317
G1 X88.813 Y93.182 E.01013
G1 X88.854 Y93.187 E.00099
G3 X89.548 Y94.93 I-.197 J1.088 E.05399
G3 X89.531 Y95.45 I-.268 J.252 E.01395
G3 X88.284 Y96.854 I-.99 J.376 E.05566
G3 X88.112 Y95.145 I.497 J-.913 E.04875
G3 X87.953 Y93.902 I6.349 J-1.443 E.03025
G3 X88.756 Y93.175 I.882 J.167 E.02802
; WIPE_START
G1 F9000
G1 X88.854 Y93.187 E-.03754
G1 X89.041 Y93.211 E-.07174
G1 X89.31 Y93.345 E-.11411
G1 X89.543 Y93.581 E-.12615
G1 X89.58 Y93.652 E-.03047
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I-1.216 J.049 P1  F42000
G1 X89.772 Y98.396 Z19.48
G1 Z19.08
G1 E.4 F1800
G1 F837
M204 S6000
G3 X90.242 Y97.972 I.65 J.248 E.01584
G1 X90.288 Y97.554 E.01014
G1 X90.371 Y97.567 E.00203
G3 X89.662 Y99.388 I-.203 J.969 E.08287
G3 X90.231 Y97.546 I.735 J-.782 E.05775
; WIPE_START
G1 F9000
G1 X90.371 Y97.567 E-.054
G1 X90.772 Y97.734 E-.16498
G1 X90.976 Y97.964 E-.11682
G1 X91.022 Y98.071 E-.04421
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I-1.195 J.231 P1  F42000
G1 X91.927 Y102.761 Z19.48
G1 Z19.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.499 Y102.081 I.485 J-.172 E.02584
G1 X92.602 Y101.674 E.01014
G1 X92.718 Y101.709 E.00292
G3 X93.264 Y102.931 I-.471 J.944 E.03496
G1 X93.532 Y103.395 E.01293
G3 X93.64 Y105.106 I-.503 J.89 E.04903
G3 X92.138 Y103.986 I-.392 J-1.04 E.05371
G1 X91.923 Y103.485 E.01316
G3 X92.086 Y101.707 I.583 J-.843 E.05226
G3 X92.547 Y101.657 I.427 J1.788 E.0112
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.718 Y101.709 E-.06795
G1 X93.039 Y101.91 E-.14403
G1 X93.185 Y102.149 E-.1064
G1 X93.223 Y102.307 E-.06161
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I-.277 J-1.185 P1  F42000
G1 X89.069 Y103.276 Z19.48
G1 Z19.08
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.378 Y102.438 I.361 J-.343 E.02671
G1 X89.43 Y102.022 E.01013
G3 X90.395 Y103.378 I-.143 J1.123 E.04511
G1 X90.679 Y103.873 E.01375
G3 X91.27 Y105.472 I-.309 J1.023 E.0476
G3 X89.965 Y105.526 I-.683 J-.728 E.03431
G3 X88.773 Y104.514 I-.328 J-.821 E.04624
G2 X88.543 Y103.003 I-4.177 J-.135 E.03707
G3 X89.373 Y102.013 I.873 J-.112 E.03501
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.659 Y102.057 E-.10999
G1 X89.914 Y102.187 E-.10861
G1 X90.212 Y102.478 E-.15822
G1 X90.216 Y102.485 E-.00318
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I1.212 J-.111 P1  F42000
G1 X88.308 Y81.737 Z19.48
G1 Z19.08
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X88.365 Y81.532 E.00512
G3 X88.391 Y80.691 I.745 J-.398 E.02125
G3 X88.627 Y80.634 I.192 J.278 E.006
G1 X88.72 Y80.224 E.01013
G1 X88.882 Y80.266 E.00403
G3 X89.828 Y80.857 I-15.415 J25.727 E.02689
G3 X90.485 Y81.103 I-.059 J1.159 E.01719
G1 X91.084 Y81.081 E.01444
G3 X91.589 Y80.619 I2.568 J2.303 E.01655
G3 X92.626 Y80.855 I.382 J.719 E.02792
G1 X92.953 Y81.499 E.01742
G3 X91.799 Y82.465 I-.785 J.235 E.04602
G3 X91.072 Y82.111 I.075 J-1.075 E.01998
G3 X90.119 Y82.66 I-2.519 J-3.267 E.02661
G3 X89.403 Y82.554 I-.216 J-1.006 E.01784
G1 X88.604 Y82.73 E.01973
G3 X87.828 Y81.888 I-.098 J-.689 E.03244
G2 X87.835 Y81.16 I-.62 J-.37 E.01841
G3 X88.664 Y80.21 I.778 J-.158 E.03516
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.882 Y80.266 E-.0855
G1 X89.539 Y80.677 E-.29451
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I-.939 J-.774 P1  F42000
G1 X86.551 Y84.302 Z19.48
G1 Z19.08
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F837
M204 S6000
G1 X92.559 Y84.302 E.15617
G1 X92.559 Y84.577 E.00715
G1 X86.551 Y84.577 E.15616
G1 X86.551 Y84.362 E.00558
M204 S250
G1 X86.571 Y83.901 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F837
M204 S5000
G1 X92.96 Y83.901 E.15407
M106 S124.95
M106 S127.5
G1 X92.96 Y83.997 E.00231
M106 S124.95
M106 S127.5
G1 X92.96 Y84.185 E.00453
G1 X93.3 Y84.185 E.0082
G1 X93.3 Y84.585 E.00965
G1 X93.3 Y84.882 E.00718
G1 X93.3 Y84.978 E.0023
M106 S124.95
M106 S127.5
G1 X86.571 Y84.978 E.16227
M106 S124.95
G1 X86.53 Y84.978 E.00099
G1 X86.53 Y85.378 E.00965
M73 P82 R5
G1 X86.53 Y85.778 E.00965
G1 X86.53 Y86.178 E.00965
G1 X86.53 Y107.585 E.51623
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.74 I-.004 J-1.291 E.0474
G1 X86.15 Y79.38 E.6598
G3 X87.374 Y78.086 I1.294 J-.001 E.04737
G1 X93.85 Y78.085 E.15616
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y83.882 E.13065
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y83.885 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.48 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 19.24
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 120/141
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
; OBJECT_ID: 15
G1 X88.257 Y81.72 F42000
G1 Z19.24
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X88.263 Y80.686 I3.762 J-.496 E.02501
G3 X88.564 Y80.557 I.262 J.197 E.00827
G1 X88.659 Y80.148 E.01013
G1 X88.779 Y80.179 E.00301
G3 X89.469 Y80.681 I-.41 J1.288 E.02092
G2 X90.514 Y81.12 I85.935 J-202.926 E.02733
G2 X91.187 Y80.977 I.067 J-1.339 E.0168
G3 X92.798 Y81.162 I.776 J.346 E.05188
G3 X92.01 Y82.553 I-.527 J.62 E.05423
G3 X91.506 Y82.326 I.177 J-1.066 E.01347
G3 X90.725 Y82.413 I-.487 J-.827 E.01953
G3 X89.52 Y82.615 I-.76 J-.834 E.03115
G1 X89.013 Y82.613 E.01221
G3 X87.847 Y82.523 I-.539 J-.616 E.03142
G3 X87.837 Y81.724 I.879 J-.411 E.01988
G3 X87.795 Y80.729 I19.155 J-1.308 E.02401
G3 X88.603 Y80.133 I.717 J.127 E.02671
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.779 Y80.179 E-.0694
G1 X89.208 Y80.397 E-.18277
G1 X89.436 Y80.645 E-.12783
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I-.744 J.963 P1  F42000
G1 X94.475 Y84.538 Z19.64
G1 Z19.24
G1 E.4 F1800
G1 F839
M204 S6000
G3 X94.873 Y84.127 I.446 J.033 E.01496
G1 X94.896 Y83.707 E.01013
G1 X94.946 Y83.712 E.00121
G3 X94.563 Y83.772 I-.062 J.856 E.12063
G1 X94.839 Y83.702 E.00685
; WIPE_START
G1 F9000
G1 X94.946 Y83.712 E-.041
G1 X95.382 Y83.84 E-.17274
G1 X95.591 Y84.033 E-.1079
G1 X95.664 Y84.168 E-.05837
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I-.772 J-.941 P1  F42000
G1 X92.42 Y86.828 Z19.64
G1 Z19.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.915 Y86.343 I.694 J.214 E.01743
G1 X92.929 Y85.923 E.01013
G3 X93.601 Y87.507 I-.061 J.961 E.05134
G3 X92.133 Y87.939 I-.955 J-.537 E.04085
G3 X92.048 Y86.632 I.707 J-.702 E.03446
G3 X92.871 Y85.92 I1.137 J.483 E.02718
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.141 Y85.936 E-.10289
G1 X93.399 Y86.046 E-.1066
G1 X93.621 Y86.249 E-.11417
G1 X93.692 Y86.379 E-.05635
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I-.321 J-1.174 P1  F42000
G1 X89.465 Y87.536 Z19.64
G1 Z19.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.003 Y86.983 I.856 J.295 E.01923
G1 X89.986 Y86.563 E.01014
G3 X90.858 Y87.499 I-.007 J.88 E.03455
G3 X90.188 Y88.666 I-1.24 J.063 E.03428
G3 X88.766 Y87.241 I-.695 J-.728 E.07518
G3 X89.234 Y87.127 I.371 J.506 E.01192
G3 X89.928 Y86.562 I1.005 J.527 E.02218
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.193 Y86.564 E-.10038
G1 X90.437 Y86.665 E-.10046
G1 X90.645 Y86.864 E-.10953
G1 X90.73 Y87.027 E-.06963
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I-1.21 J-.127 P1  F42000
G1 X90.343 Y90.722 Z19.64
G1 Z19.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.74 Y90.234 I.352 J-.119 E.0181
G1 X90.809 Y89.819 E.01013
G3 X91.738 Y91.648 I-.095 J1.198 E.05925
G3 X90.244 Y91.398 I-.677 J-.538 E.04445
G3 X90.448 Y89.848 I.582 J-.712 E.04505
G1 X90.752 Y89.809 E.0074
M106 S124.95
M106 S127.5
; WIPE_START
G1 X91.083 Y89.873 E-.12826
G1 X91.439 Y90.065 E-.15384
G1 X91.622 Y90.247 E-.0979
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I-.467 J1.124 P1  F42000
G1 X93.296 Y90.943 Z19.64
G1 Z19.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.818 Y90.303 I.705 J.042 E.02126
G1 X93.818 Y89.883 E.01014
G1 X93.875 Y89.885 E.00138
G3 X94.582 Y91.35 I-.118 J.96 E.04661
G3 X94.549 Y92.472 I-6.132 J.381 E.02711
G3 X92.845 Y92.29 I-.829 J-.308 E.05637
G3 X92.925 Y90.641 I9.17 J-.382 E.03986
G3 X93.761 Y89.881 I1.08 J.348 E.02853
M106 S124.95
; WIPE_START
G1 X93.875 Y89.885 E-.04367
G1 X94.297 Y90.003 E-.16648
G1 X94.504 Y90.196 E-.10741
G1 X94.582 Y90.34 E-.06244
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I-1.095 J-.531 P1  F42000
G1 X91.755 Y96.165 Z19.64
G1 Z19.24
G1 E.4 F1800
M106 S127.5
G1 F839
M204 S6000
G3 X92.013 Y95.306 I.36 J-.36 E.02643
G1 X92.097 Y94.895 E.01013
G3 X92.851 Y96.408 I-.098 J.994 E.04864
G1 X93.164 Y96.934 E.01474
G3 X93.949 Y98.659 I-.131 J1.101 E.05484
G3 X92.375 Y98.195 I-.651 J-.694 E.04773
G3 X92.44 Y97.362 I1.057 J-.336 E.02066
G2 X92.005 Y96.777 I-1.471 J.639 E.01775
G3 X91.758 Y94.911 I.183 J-.973 E.05987
G1 X92.041 Y94.881 E.00686
; WIPE_START
G1 F9000
G1 X92.568 Y95.068 E-.2126
G1 X92.793 Y95.279 E-.11698
G1 X92.856 Y95.395 E-.05042
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I.285 J-1.183 P1  F42000
G1 X88.404 Y94.323 Z19.64
G1 Z19.24
G1 E.4 F1800
G1 F839
M204 S6000
G3 X88.773 Y93.551 I.476 J-.247 E.02389
G1 X88.814 Y93.133 E.01013
G3 X89.527 Y94.779 I-.129 J1.034 E.05214
G1 X89.35 Y95.295 E.01316
G3 X88.54 Y96.964 I-.883 J.603 E.05418
G3 X87.888 Y95.478 I.148 J-.951 E.04656
G1 X88.094 Y95.228 E.00783
G2 X87.931 Y94.172 I-2.645 J-.132 E.02596
G3 X88.757 Y93.125 I.915 J-.127 E.03589
; WIPE_START
G1 F9000
G1 X89.022 Y93.159 E-.10175
G1 X89.288 Y93.291 E-.11282
G1 X89.51 Y93.51 E-.11848
G1 X89.567 Y93.62 E-.04695
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I-1.216 J.051 P1  F42000
G1 X89.772 Y98.486 Z19.64
G1 Z19.24
G1 E.4 F1800
G1 F839
M204 S6000
G3 X90.235 Y98.061 I.633 J.226 E.01576
G1 X90.313 Y97.649 E.01013
G3 X90.717 Y99.462 I-.183 J.993 E.05692
G3 X89.6 Y99.44 I-.536 J-1.109 E.02796
G3 X90.226 Y97.635 I.762 J-.747 E.05707
; WIPE_START
G1 F9000
G1 X90.505 Y97.679 E-.10752
G1 X90.758 Y97.821 E-.11025
G1 X90.959 Y98.046 E-.11447
G1 X91.009 Y98.161 E-.04776
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I-1.192 J.245 P1  F42000
G1 X91.92 Y102.595 Z19.64
G1 Z19.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.907 Y102.329 I.403 J-.153 E.00652
G3 X92.549 Y102.025 I.594 J.423 E.01789
G1 X92.66 Y101.62 E.01013
G1 X92.715 Y101.636 E.00137
G3 X93.294 Y102.38 I-.187 J.744 E.0245
G1 X93.235 Y102.958 E.01401
G1 X93.5 Y103.422 E.01288
G3 X93.68 Y105.162 I-.463 J.927 E.05021
G3 X92.234 Y103.863 I-.392 J-1.019 E.05785
G1 X91.935 Y103.406 E.01316
G3 X91.758 Y101.819 I.585 J-.869 E.0438
G3 X92.605 Y101.602 I.758 J1.202 E.02143
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.715 Y101.636 E-.04361
G1 X92.879 Y101.687 E-.06525
G1 X93.094 Y101.854 E-.10366
G1 X93.237 Y102.089 E-.10458
G1 X93.269 Y102.252 E-.0629
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I-.281 J-1.184 P1  F42000
G1 X89.082 Y103.247 Z19.64
G1 Z19.24
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.329 Y102.387 I.32 J-.374 E.02713
G1 X89.375 Y101.969 E.01013
G3 X90.334 Y103.314 I-.122 J1.102 E.04495
G2 X90.864 Y103.987 I.863 J-.134 E.02159
G3 X91.104 Y105.689 I-.353 J.918 E.05045
G3 X89.988 Y105.533 I-.441 J-.912 E.02881
G3 X88.689 Y104.91 I-.362 J-.909 E.03904
G3 X88.882 Y104.211 I.944 J-.115 E.01792
G1 X88.867 Y103.646 E.01365
G3 X89.045 Y102.014 I.653 J-.754 E.04647
G1 X89.318 Y101.961 E.00669
M106 S124.95
; WIPE_START
G1 X89.615 Y102.004 E-.11428
G1 X89.897 Y102.148 E-.12045
G1 X90.141 Y102.392 E-.13113
G1 X90.159 Y102.425 E-.01413
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I1.192 J-.246 P1  F42000
G1 X86.571 Y85.063 Z19.64
G1 Z19.24
G1 E.4 F1800
M106 S127.5
; FEATURE: Outer wall
G1 F839
M204 S5000
G1 X86.53 Y85.063 E.00099
G1 X86.53 Y107.585 E.54312
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
M73 P83 R5
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.002 J-1.294 E.04743
G1 X86.15 Y85.016 E.52383
G1 X92.5 Y85.018 E.15313
G1 X92.9 Y85.018 E.00965
G1 X93.3 Y85.019 E.00965
G1 X93.3 Y85.063 E.00106
G1 X86.631 Y85.063 E.16082
M106 S124.95
M106 S127.5
; WIPE_START
G1 F3420
M204 S6000
G1 X86.53 Y85.063 E-.03838
G1 X86.53 Y85.962 E-.34162
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I1.217 J.023 P1  F42000
G1 X86.571 Y83.816 Z19.64
G1 Z19.24
G1 E.4 F1800
G1 F839
M204 S5000
G1 X92.96 Y83.816 E.15407
M106 S124.95
G1 X92.96 Y83.86 E.00106
G1 X92.56 Y83.86 E.00965
G1 X92.16 Y83.861 E.00965
G1 X86.15 Y83.863 E.14493
G1 X86.15 Y79.38 E.10811
G3 X87.374 Y78.086 I1.307 J.011 E.04726
G1 X93.85 Y78.085 E.15616
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y83.797 E.1286
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y83.8 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.64 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 121/141
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
; OBJECT_ID: 15
G1 X88.211 Y81.725 F42000
G1 Z19.4
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G2 X88.157 Y80.722 I-10.699 J.083 E.02423
G3 X88.498 Y80.481 I.326 J.1 E.01086
G1 X88.595 Y80.072 E.01013
G1 X88.676 Y80.094 E.00203
G3 X89.417 Y80.621 I-.368 J1.302 E.02235
G2 X90.153 Y80.968 I.686 J-.501 E.02046
G3 X90.686 Y81.374 I-.343 J1.003 E.01644
G3 X91.642 Y80.479 I39.178 J40.915 E.03159
G3 X92.814 Y81.158 I.343 J.759 E.03812
G3 X92.962 Y82.423 I-.605 J.712 E.03379
G3 X91.48 Y82.282 I-.654 J-.986 E.03883
G1 X91.204 Y82.258 E.00669
G2 X90.493 Y82.703 I.671 J1.86 E.02037
G3 X89.628 Y82.65 I-.374 J-.989 E.02154
G1 X89.112 Y82.576 E.01257
G3 X87.938 Y82.793 I-.744 J-.743 E.03062
G3 X87.792 Y81.713 I.638 J-.636 E.02821
G2 X87.74 Y80.635 I-96.283 J4.105 E.02604
G3 X88.539 Y80.058 I.705 J.134 E.02621
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.676 Y80.094 E-.05396
G1 X89.139 Y80.318 E-.19535
G1 X89.372 Y80.571 E-.13069
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I-1.217 J-.002 P1  F42000
G1 X89.362 Y87.319 Z19.8
G1 Z19.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.03 Y86.885 I2.907 J3.739 E.01922
G1 X90.011 Y86.465 E.01014
G3 X90.866 Y87.392 I-.009 J.866 E.03408
G3 X90.203 Y88.537 I-1.181 J.081 E.03386
G3 X88.703 Y87.129 I-.763 J-.69 E.07885
G2 X89.688 Y86.566 I-.707 J-2.38 E.02761
G1 X89.953 Y86.465 E.00684
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.212 Y86.466 E-.09833
G1 X90.451 Y86.565 E-.09842
G1 X90.656 Y86.761 E-.10795
G1 X90.747 Y86.937 E-.0753
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I.103 J1.213 P1  F42000
G1 X92.437 Y86.793 Z19.8
G1 Z19.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.921 Y86.291 I.676 J.167 E.01761
G1 X92.93 Y85.871 E.01013
G3 X93.6 Y87.444 I-.058 J.954 E.05102
G3 X92.073 Y88.002 I-1.013 J-.402 E.04429
G3 X92.094 Y86.549 I.751 J-.716 E.03883
G3 X92.873 Y85.868 I.898 J.24 E.02646
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.15 Y85.884 E-.10554
G1 X93.408 Y85.994 E-.10675
G1 X93.622 Y86.191 E-.11038
G1 X93.694 Y86.323 E-.05732
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I1.109 J.501 P1  F42000
G1 X94.497 Y84.548 Z19.8
G1 Z19.4
G1 E.4 F1800
G1 F733
M204 S6000
G3 X94.876 Y84.14 I.428 J.016 E.01464
G1 X94.897 Y83.72 E.01013
G1 X94.955 Y83.725 E.00141
G3 X94.569 Y83.785 I-.067 J.842 E.11841
G1 X94.839 Y83.715 E.00672
; WIPE_START
G1 F9000
G1 X94.955 Y83.725 E-.04417
G1 X95.375 Y83.849 E-.16641
G1 X95.582 Y84.038 E-.10654
G1 X95.661 Y84.184 E-.06288
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I-1.15 J-.399 P1  F42000
G1 X93.333 Y90.895 Z19.8
G1 Z19.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.839 Y90.235 I.723 J.03 E.02139
G1 X93.843 Y89.814 E.01014
G1 X93.905 Y89.817 E.0015
G3 X94.686 Y91.048 I-.118 J.938 E.04014
G1 X94.539 Y91.407 E.00934
G1 X94.61 Y92.221 E.01972
G3 X92.857 Y92.286 I-.878 J.006 E.06518
G2 X92.957 Y90.598 I-78.277 J-5.476 E.04078
G3 X93.786 Y89.812 I1.055 J.281 E.02899
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.905 Y89.817 E-.04558
G1 X94.313 Y89.937 E-.16125
G1 X94.522 Y90.134 E-.10937
G1 X94.6 Y90.283 E-.0638
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I-.115 J-1.211 P1  F42000
G1 X90.296 Y90.693 Z19.8
G1 Z19.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.668 Y90.186 I.344 J-.138 E.01814
G1 X90.735 Y89.771 E.01013
G3 X91.874 Y91.436 I-.228 J1.378 E.05437
G3 X90.223 Y91.35 I-.811 J-.311 E.05268
G3 X90.382 Y89.801 I.528 J-.728 E.04538
G1 X90.678 Y89.761 E.00722
M106 S124.95
; WIPE_START
G1 X91.001 Y89.821 E-.12497
G1 X91.32 Y89.988 E-.13642
G1 X91.543 Y90.206 E-.11861
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I-.966 J-.74 P1  F42000
G1 X88.416 Y94.288 Z19.8
G1 Z19.4
G1 E.4 F1800
M106 S127.5
G1 F733
M204 S6000
G3 X88.743 Y93.501 I.447 J-.276 E.02399
G1 X88.781 Y93.082 E.01014
G3 X89.32 Y94.889 I-.109 J1.016 E.05786
G2 X89.465 Y95.707 I1.042 J.238 E.02059
G3 X88.251 Y96.953 I-.948 J.291 E.05117
G3 X88.084 Y95.304 I.49 J-.882 E.0469
G2 X88.149 Y94.674 I-1.557 J-.477 E.01536
G3 X88.723 Y93.075 I.736 J-.638 E.04976
; WIPE_START
G1 F9000
G1 X89.002 Y93.111 E-.10695
G1 X89.266 Y93.239 E-.11133
G1 X89.484 Y93.455 E-.11653
G1 X89.539 Y93.56 E-.04518
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I-.869 J.852 P1  F42000
G1 X91.607 Y95.667 Z19.8
G1 Z19.4
G1 E.4 F1800
G1 F733
M204 S6000
G3 X91.959 Y95.229 I.35 J-.079 E.01556
G1 X92.069 Y94.823 E.01014
G3 X92.358 Y96.697 I-.099 J.975 E.06219
G3 X91.705 Y94.835 I-.199 J-.976 E.06891
G1 X91.983 Y94.803 E.00675
; WIPE_START
G1 F9000
G1 X92.283 Y94.875 E-.11714
G1 X92.76 Y95.238 E-.22766
G1 X92.804 Y95.319 E-.0352
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I-1.217 J-.001 P1  F42000
G1 X92.802 Y97.867 Z19.8
G1 Z19.4
G1 E.4 F1800
G1 F733
M204 S6000
G3 X93.225 Y97.47 I.391 J-.008 E.01578
G1 X93.335 Y97.064 E.01013
G1 X93.375 Y97.076 E.00101
G3 X93.784 Y98.88 I-.225 J.999 E.05563
G3 X92.369 Y97.947 I-.403 J-.928 E.04841
G3 X93.28 Y97.047 I.867 J-.034 E.03472
; WIPE_START
G1 F9000
G1 X93.375 Y97.076 E-.03797
G1 X93.818 Y97.304 E-.18921
G1 X94.009 Y97.53 E-.11235
G1 X94.053 Y97.627 E-.04047
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I-.259 J-1.189 P1  F42000
G1 X89.749 Y98.565 Z19.8
G1 Z19.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.229 Y98.148 I.683 J.301 E.01584
G1 X90.278 Y97.73 E.01014
G3 X90.99 Y99.312 I-.156 J1.021 E.04966
G3 X89.538 Y99.489 I-.859 J-.999 E.03738
G3 X89.512 Y98.13 I.695 J-.693 E.03621
G3 X90.221 Y97.721 I.799 J.565 E.02037
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.496 Y97.765 E-.10589
G1 X90.745 Y97.904 E-.10828
G1 X90.945 Y98.126 E-.11366
G1 X91.005 Y98.249 E-.05216
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I-1.194 J.236 P1  F42000
G1 X91.853 Y102.53 Z19.8
G1 Z19.4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.362 Y102.007 I.417 J-.104 E.02104
G3 X92.609 Y101.973 I.175 J.37 E.00611
G1 X92.722 Y101.569 E.01013
G3 X93.304 Y102.627 I-.181 J.789 E.03289
G1 X92.956 Y103.409 E.02063
G1 X93.552 Y103.292 E.01465
G3 X94.086 Y104.189 I-15.649 J9.926 E.02517
G3 X92.612 Y105.004 I-.806 J.284 E.05786
G3 X92.302 Y103.941 I1.024 J-.876 E.02754
G1 X92.117 Y103.43 E.01309
G3 X91.444 Y102.181 I.436 J-1.041 E.03702
G3 X92.36 Y101.561 I.924 J.379 E.02826
G1 X92.667 Y101.551 E.00739
M106 S124.95
; WIPE_START
G1 X92.937 Y101.636 E-.1076
G1 X93.149 Y101.801 E-.10228
G1 X93.29 Y102.032 E-.10278
G1 X93.324 Y102.206 E-.06734
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I-.286 J-1.183 P1  F42000
G1 X89.1 Y103.226 Z19.8
G1 Z19.4
G1 E.4 F1800
G1 F733
M204 S6000
G3 X89.299 Y102.337 I.3 J-.4 E.02764
G1 X89.344 Y101.919 E.01013
G1 X89.471 Y101.937 E.00309
G3 X90.147 Y103.531 I-.255 J1.048 E.04846
G1 X90.598 Y103.955 E.01492
G3 X91.363 Y105.554 I-.122 J1.041 E.05097
G3 X90.224 Y105.69 I-.657 J-.662 E.02981
G2 X89.165 Y105.541 I-1.666 J7.989 E.0258
G3 X88.881 Y104.165 I.29 J-.777 E.04041
G1 X88.855 Y103.611 E.01338
G3 X89.015 Y101.966 I.645 J-.767 E.04686
G1 X89.287 Y101.911 E.0067
; WIPE_START
G1 F9000
G1 X89.471 Y101.937 E-.07064
G1 X89.851 Y102.092 E-.15594
G1 X90.085 Y102.323 E-.12492
G1 X90.12 Y102.389 E-.0285
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I1.191 J-.248 P1  F42000
G1 X86.53 Y85.116 Z19.8
G1 Z19.4
G1 E.4 F1800
; FEATURE: Outer wall
G1 F733
M204 S5000
G1 X86.53 Y107.585 E.54183
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I-.004 J-1.291 E.04745
G1 X86.15 Y85.116 E.52142
G1 X86.47 Y85.116 E.00772
; WIPE_START
G1 F12000
M204 S6000
G1 X86.473 Y86.116 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I1.217 J.03 P1  F42000
G1 X86.53 Y83.763 Z19.8
G1 Z19.4
G1 E.4 F1800
G1 F733
M204 S5000
G1 X86.15 Y83.763 E.00916
G1 X86.15 Y79.38 E.1057
G3 X87.377 Y78.086 I1.299 J.003 E.04738
G1 X93.85 Y78.085 E.1561
M73 P84 R5
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y83.703 E.12633
; WIPE_START
G1 F12000
M204 S6000
G1 X86.15 Y83.763 E-.14619
G1 X86.15 Y83.148 E-.23381
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.8 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 19.56
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 122/141
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
; OBJECT_ID: 15
G1 X88.188 Y81.701 F42000
G1 Z19.56
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G2 X88.098 Y80.629 I-11.911 J.465 E.02596
G3 X88.43 Y80.406 I.308 J.101 E.01039
G1 X88.529 Y79.998 E.01013
G1 X88.573 Y80.01 E.00111
G3 X89.358 Y80.593 I-.168 J1.045 E.02452
G1 X89.758 Y80.94 E.01277
G3 X90.552 Y81.244 I.071 J1.001 E.02117
G2 X91.564 Y80.424 I-.5 J-1.651 E.03223
G3 X92.827 Y81.15 I.397 J.77 E.04173
G3 X93.047 Y82.491 I-.57 J.782 E.03632
G3 X91.569 Y82.32 I-.635 J-.984 E.03888
G1 X91.288 Y82.288 E.00682
G1 X90.802 Y82.533 E.01313
G3 X89.536 Y82.595 I-.661 J-.554 E.03431
G2 X88.669 Y82.903 I-.075 J1.165 E.02281
G3 X87.603 Y82.156 I-.377 J-.596 E.03997
G2 X87.669 Y80.858 I-1.361 J-.72 E.03237
G3 X88.473 Y79.983 I.722 J-.143 E.03334
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.573 Y80.01 E-.0394
G1 X88.777 Y80.064 E-.08006
G1 X89.068 Y80.242 E-.12998
G1 X89.287 Y80.507 E-.13057
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I-1.216 J.036 P1  F42000
G1 X89.484 Y87.14 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.058 Y86.783 I33.227 J52.73 E.01629
G1 X90.149 Y86.783 E.0022
G1 X90.288 Y86.386 E.01015
G3 X90.839 Y87.648 I-.446 J.947 E.03626
G3 X90.007 Y88.619 I-1.559 J-.494 E.03169
G3 X88.392 Y88.104 I-.627 J-.823 E.04788
G3 X88.643 Y87.015 I1.216 J-.293 E.02793
G2 X89.449 Y86.69 I-3.075 J-8.784 E.02097
G3 X90.232 Y86.363 I.711 J.601 E.02124
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.466 Y86.46 E-.09625
G1 X90.668 Y86.655 E-.10644
G1 X90.812 Y86.938 E-.1208
G1 X90.839 Y87.084 E-.0565
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I.311 J1.176 P1  F42000
G1 X92.517 Y86.64 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.973 Y86.242 I.501 J.113 E.01563
G1 X92.95 Y85.821 E.01015
G1 X93.089 Y85.823 E.00337
G3 X93.563 Y87.419 I-.224 J.935 E.04858
G3 X92.252 Y88.184 I-1.12 J-.415 E.03968
G3 X91.824 Y86.989 I.305 J-.783 E.03468
G2 X92.185 Y86.317 I-1.625 J-1.306 E.01852
G3 X92.892 Y85.821 I.823 J.421 E.02167
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.089 Y85.823 E-.07502
G1 X93.398 Y85.94 E-.12546
G1 X93.623 Y86.133 E-.11258
G1 X93.708 Y86.287 E-.06694
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I1.107 J.506 P1  F42000
G1 X94.498 Y84.557 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F699
M204 S6000
G3 X94.868 Y84.152 I.416 J.009 E.01443
G1 X94.887 Y83.733 E.01013
G1 X94.956 Y83.738 E.00167
G3 X94.563 Y83.798 I-.074 J.827 E.1161
G1 X94.829 Y83.728 E.00665
; WIPE_START
G1 F9000
G1 X94.956 Y83.738 E-.04834
G1 X95.361 Y83.858 E-.16034
G1 X95.566 Y84.045 E-.10549
G1 X95.649 Y84.197 E-.06583
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I-1.151 J-.394 P1  F42000
G1 X93.374 Y90.85 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.858 Y90.166 I.695 J-.022 E.02167
G1 X93.865 Y89.746 E.01014
G1 X93.935 Y89.75 E.0017
G3 X94.626 Y91.133 I-.149 J.938 E.04356
G1 X94.658 Y91.7 E.0137
G1 X94.561 Y91.872 E.00476
G3 X93.688 Y93.172 I-.875 J.355 E.04451
G3 X92.913 Y91.906 I.222 J-1.006 E.03997
G3 X93.039 Y91.256 I.972 J-.15 E.01629
G3 X93.807 Y89.742 I1.056 J-.415 E.04622
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.935 Y89.75 E-.04881
G1 X94.325 Y89.87 E-.15494
G1 X94.531 Y90.067 E-.10843
G1 X94.615 Y90.225 E-.06782
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I-.122 J-1.211 P1  F42000
G1 X90.251 Y90.664 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.601 Y90.138 I.357 J-.141 E.01786
G1 X90.665 Y89.723 E.01013
G1 X90.722 Y89.734 E.00139
G3 X91.748 Y90.582 I-.323 J1.433 E.03331
G3 X90.722 Y91.989 I-.714 J.557 E.05644
G3 X90.212 Y91.316 I.5 J-.908 E.02097
G3 X90.319 Y89.754 I.477 J-.752 E.04613
G1 X90.608 Y89.713 E.00705
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.722 Y89.734 E-.04393
G1 X90.923 Y89.771 E-.07748
G1 X91.232 Y89.932 E-.13253
G1 X91.472 Y90.161 E-.12607
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I-.979 J-.722 P1  F42000
G1 X88.448 Y94.26 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F699
M204 S6000
G3 X88.724 Y93.456 I.382 J-.318 E.02459
G1 X88.762 Y93.038 E.01013
G1 X88.84 Y93.048 E.00191
G3 X89.271 Y94.822 I-.178 J.983 E.05558
G2 X89.424 Y95.771 I1.603 J.227 E.02353
G3 X88.085 Y96.959 I-.931 J.299 E.05455
G3 X88.243 Y95.256 I.693 J-.795 E.04813
G1 X88.216 Y94.675 E.01402
G3 X88.705 Y93.031 I.641 J-.704 E.05151
; WIPE_START
G1 F9000
G1 X88.84 Y93.048 E-.05205
G1 X89.241 Y93.192 E-.16184
G1 X89.457 Y93.403 E-.11454
G1 X89.52 Y93.523 E-.05157
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I-.867 J.854 P1  F42000
G1 X91.563 Y95.597 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.907 Y95.155 I.346 J-.086 E.01553
G1 X91.987 Y94.742 E.01013
G3 X92.763 Y96.328 I-.115 J1.039 E.05071
G3 X91.227 Y96.01 I-.679 J-.586 E.04603
G3 X91.927 Y94.729 I.756 J-.418 E.04192
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.223 Y94.796 E-.11511
G1 X92.514 Y94.971 E-.12904
G1 X92.753 Y95.237 E-.13585
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I-1.216 J.043 P1  F42000
G1 X92.85 Y97.95 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F699
M204 S6000
G3 X93.264 Y97.558 I.437 J.047 E.01496
G1 X93.381 Y97.155 E.01013
G3 X93.833 Y98.908 I-.198 J.986 E.05433
G3 X92.428 Y97.909 I-.434 J-.877 E.05085
G3 X93.316 Y97.135 I.817 J.041 E.03173
; WIPE_START
G1 F9000
G1 X93.814 Y97.358 E-.20746
G1 X94.032 Y97.605 E-.12498
G1 X94.083 Y97.719 E-.04756
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I-.251 J-1.191 P1  F42000
G1 X89.693 Y98.644 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.234 Y98.232 I.654 J.297 E.01709
G1 X90.285 Y97.814 E.01014
G3 X91.044 Y99.335 I-.084 J.992 E.04912
G3 X90.404 Y99.616 I-.667 J-.651 E.01728
G3 X89.48 Y98.205 I-.371 J-.765 E.05915
G3 X90.227 Y97.805 I.922 J.824 E.02088
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.487 Y97.847 E-.09982
G1 X90.725 Y97.975 E-.10277
G1 X91.051 Y98.29 E-.17212
G1 X91.057 Y98.302 E-.00528
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I-1.199 J.211 P1  F42000
G1 X91.776 Y102.382 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.359 Y101.98 I.492 J.09 E.01897
G3 X92.687 Y101.93 I.237 J.454 E.00816
G1 X92.806 Y101.527 E.01013
G3 X93.356 Y102.558 I-.198 J.767 E.03167
G1 X93.161 Y102.978 E.01116
G1 X93.432 Y103.49 E.01398
G3 X93.735 Y105.381 I-.39 J1.032 E.0559
G3 X93.197 Y105.35 I-.236 J-.582 E.01342
G3 X92.379 Y103.934 I.265 J-1.098 E.04411
G1 X92.183 Y103.391 E.01393
G3 X91.375 Y102.184 I.319 J-1.087 E.038
G3 X92.254 Y101.572 I.833 J.258 E.02782
G3 X92.751 Y101.51 I.338 J.693 E.01231
M106 S124.95
; WIPE_START
G1 X92.995 Y101.587 E-.09726
G1 X93.205 Y101.751 E-.10092
G1 X93.343 Y101.978 E-.10102
G1 X93.384 Y102.186 E-.08079
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I-.282 J-1.184 P1  F42000
G1 X89.102 Y103.207 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F699
M204 S6000
G3 X89.139 Y102.318 I.388 J-.429 E.02448
G1 X89.271 Y102.29 E.00326
G1 X89.312 Y101.872 E.01013
G1 X89.418 Y101.886 E.00259
G3 X90.094 Y103.446 I-.226 J1.024 E.0478
G2 X90.909 Y104.097 I.934 J-.334 E.02648
G3 X91.199 Y105.767 I-.289 J.911 E.0503
G3 X90.217 Y105.682 I-.428 J-.772 E.02523
G2 X89.098 Y105.556 I-2.124 J13.906 E.02717
G3 X88.853 Y104.157 I.288 J-.771 E.0413
G2 X88.566 Y103.154 I-1.407 J-.141 E.02578
G3 X89.255 Y101.864 I.783 J-.411 E.04151
; WIPE_START
G1 F9000
G1 X89.418 Y101.886 E-.06274
G1 X89.807 Y102.038 E-.15837
G1 X90.035 Y102.262 E-.12165
G1 X90.081 Y102.349 E-.03724
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I1.192 J-.246 P1  F42000
G1 X86.53 Y85.149 Z19.96
G1 Z19.56
G1 E.4 F1800
; FEATURE: Outer wall
G1 F699
M204 S5000
G1 X86.53 Y107.585 E.54104
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
G3 X86.152 Y106.738 I.004 J-1.299 E.04737
G1 X86.15 Y85.149 E.52062
G1 X86.47 Y85.149 E.00772
; WIPE_START
G1 F12000
M204 S6000
G1 X86.473 Y86.149 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I1.217 J.029 P1  F42000
G1 X86.53 Y83.73 Z19.96
G1 Z19.56
G1 E.4 F1800
G1 F699
M204 S5000
G1 X86.15 Y83.73 E.00916
G1 X86.15 Y79.38 E.1049
G3 X87.374 Y78.086 I1.299 J.004 E.04732
G1 X93.85 Y78.085 E.15616
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y83.67 E.12553
; WIPE_START
G1 F12000
M204 S6000
G1 X86.15 Y83.73 E-.14619
G1 X86.15 Y83.115 E-.23381
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z19.96 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 19.72
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 123/141
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
; OBJECT_ID: 15
G1 X88.175 Y81.696 F42000
G1 Z19.72
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X88.174 Y81.081 E.01482
G3 X88.126 Y80.376 I.424 J-.383 E.01839
G3 X88.358 Y80.331 I.178 J.305 E.0058
G1 X88.469 Y79.926 E.01013
G3 X89.404 Y80.749 I-.257 J1.235 E.03141
G2 X90.342 Y81.084 I5.066 J-12.714 E.02403
G2 X90.769 Y81.172 I.239 J-.079 E.01272
G1 X91.213 Y80.899 E.01255
G3 X91.977 Y80.162 I.768 J.031 E.02829
G3 X92.837 Y81.143 I-.311 J1.139 E.03331
G3 X93.275 Y82.367 I-.705 J.943 E.03322
G3 X91.98 Y82.592 I-.757 J-.515 E.03538
G1 X91.589 Y82.313 E.01158
G2 X90.803 Y82.692 I.089 J1.19 E.02152
G3 X89.468 Y82.545 I-.601 J-.677 E.03648
G3 X88.289 Y83.09 I-152.292 J-328.023 E.03134
G3 X87.525 Y82.248 I-.133 J-.647 E.03302
G3 X87.755 Y81.734 I1.021 J.148 E.01376
G1 X87.754 Y81.195 E.01301
G3 X87.885 Y80.02 I.799 J-.505 E.03078
G3 X88.403 Y79.908 I.417 J.675 E.01302
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.706 Y79.99 E-.11923
G1 X88.996 Y80.167 E-.12912
G1 X89.232 Y80.421 E-.13165
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I-1.216 J.048 P1  F42000
G1 X89.496 Y87.038 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.092 Y86.673 I-17.348 J-28.988 E.01687
G1 X90.171 Y86.671 E.0019
G1 X90.317 Y86.277 E.01014
G3 X90.85 Y87.534 I-.478 J.944 E.03579
G3 X90.007 Y88.48 I-1.422 J-.419 E.03156
G3 X88.465 Y88.412 I-.743 J-.673 E.04248
G3 X88.418 Y87.09 I1.887 J-.728 E.03252
G3 X89.072 Y86.78 I.549 J.313 E.01857
G3 X90.006 Y86.254 I14.756 J25.131 E.02585
G1 X90.254 Y86.25 E.00597
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.481 Y86.348 E-.09402
G1 X90.679 Y86.543 E-.10577
G1 X90.822 Y86.825 E-.12032
G1 X90.85 Y86.98 E-.05989
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I.34 J1.168 P1  F42000
G1 X92.58 Y86.477 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.175 Y86.179 I.486 J.227 E.01732
G1 X93.322 Y85.784 E.01017
G3 X93.537 Y87.377 I-.555 J.886 E.04422
G3 X92.191 Y88.241 I-1.15 J-.311 E.04227
G3 X91.771 Y87.068 I.301 J-.77 E.03404
G2 X92.211 Y86.256 I-1.778 J-1.491 E.02243
G3 X92.73 Y85.762 I1.358 J.907 E.0174
G3 X93.27 Y85.759 I.447 J31.931 E.01302
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.465 Y85.852 E-.08209
G1 X93.629 Y86.058 E-.10021
G1 X93.765 Y86.323 E-.11311
G1 X93.807 Y86.542 E-.08459
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I1.151 J.395 P1  F42000
G1 X94.485 Y84.567 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F706
M204 S6000
G3 X94.849 Y84.165 I.403 J0 E.01433
G1 X94.866 Y83.745 E.01013
G1 X94.949 Y83.751 E.002
G3 X94.543 Y83.811 I-.086 J.817 E.11447
G1 X94.808 Y83.741 E.00662
; WIPE_START
G1 F9000
G1 X94.949 Y83.751 E-.05353
G1 X95.338 Y83.867 E-.15421
G1 X95.541 Y84.051 E-.104
G1 X95.627 Y84.208 E-.06825
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I-1.154 J-.386 P1  F42000
G1 X93.419 Y90.804 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.872 Y90.097 I.645 J-.085 E.02201
G1 X93.883 Y89.677 E.01014
G1 X93.963 Y89.682 E.00194
G3 X94.566 Y91.207 I-.188 J.956 E.04699
G1 X94.416 Y91.692 E.01225
G3 X93.704 Y93.222 I-.718 J.597 E.05082
G3 X92.908 Y92.114 I.193 J-.978 E.03623
G2 X92.995 Y90.882 I-1.979 J-.759 E.03023
G3 X93.825 Y89.673 I1.084 J-.145 E.03874
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.963 Y89.682 E-.05248
G1 X94.334 Y89.803 E-.14839
G1 X94.538 Y89.999 E-.1075
G1 X94.625 Y90.166 E-.07163
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I-.131 J-1.21 P1  F42000
G1 X90.212 Y90.642 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.536 Y90.092 I.341 J-.17 E.01826
G1 X90.599 Y89.677 E.01013
G1 X90.646 Y89.685 E.00117
G3 X91.595 Y90.505 I-.206 J1.197 E.03178
G3 X91.081 Y92.185 I-.697 J.705 E.05207
G3 X90.209 Y91.293 I.21 J-1.077 E.03199
G3 X90.259 Y89.708 I.436 J-.78 E.04707
G1 X90.542 Y89.667 E.00689
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.646 Y89.685 E-.04035
G1 X90.848 Y89.722 E-.07777
G1 X91.148 Y89.877 E-.12842
G1 X91.401 Y90.12 E-.13345
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I-.994 J-.703 P1  F42000
G1 X88.482 Y94.247 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F706
M204 S6000
G3 X88.703 Y93.416 I.322 J-.359 E.02561
G1 X88.741 Y92.997 E.01013
G1 X88.891 Y93.015 E.00365
G3 X89.094 Y94.797 I-.235 J.93 E.05591
G1 X89.113 Y95.436 E.01539
G3 X87.998 Y97.075 I-.723 J.707 E.06689
G1 X87.876 Y96.953 E.00416
G3 X88.234 Y95.338 I.965 J-.633 E.04448
G1 X88.279 Y95.185 E.00384
G1 X88.224 Y94.62 E.01368
M73 P85 R5
G3 X88.42 Y93.048 I.668 J-.715 E.04452
G1 X88.683 Y92.99 E.0065
; WIPE_START
G1 F9000
G1 X88.891 Y93.015 E-.07944
G1 X89.215 Y93.148 E-.13311
G1 X89.428 Y93.355 E-.11264
G1 X89.496 Y93.482 E-.05481
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I-.868 J.853 P1  F42000
G1 X91.521 Y95.542 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.855 Y95.084 I.343 J-.1 E.01578
G1 X91.93 Y94.671 E.01014
G3 X92.911 Y96.098 I-.226 J1.206 E.04637
G3 X91.337 Y96.183 I-.807 J-.343 E.04718
G3 X91.377 Y94.816 I.802 J-.661 E.03599
G3 X91.873 Y94.658 I.453 J.569 E.01283
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.163 Y94.722 E-.11275
G1 X92.447 Y94.889 E-.12544
G1 X92.691 Y95.172 E-.14181
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I-1.214 J.091 P1  F42000
G1 X92.906 Y98.045 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F706
M204 S6000
G3 X93.268 Y97.643 I.368 J-.032 E.01462
G1 X93.347 Y97.231 E.01014
G3 X93.586 Y99.074 I-.081 J.948 E.06224
G3 X93.038 Y97.248 I-.149 J-.951 E.06658
G1 X93.291 Y97.218 E.00612
; WIPE_START
G1 F9000
G1 X93.571 Y97.277 E-.10893
G1 X93.84 Y97.437 E-.1189
G1 X94.052 Y97.676 E-.12135
G1 X94.085 Y97.75 E-.03082
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I-.265 J-1.188 P1  F42000
G1 X89.613 Y98.749 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.189 Y98.312 I.753 J.393 E.01803
G1 X90.236 Y97.894 E.01013
G3 X91.234 Y99.125 I.016 J1.007 E.04398
G3 X90.349 Y99.64 I-.78 J-.322 E.02652
G3 X89.23 Y98.562 I-.416 J-.687 E.05083
G3 X90.143 Y97.887 I1.311 J.817 E.02804
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.59 Y97.948 E-.17151
G1 X90.881 Y98.107 E-.12606
G1 X91.034 Y98.261 E-.08243
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I-1.198 J.213 P1  F42000
G1 X91.804 Y102.598 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.239 Y101.996 I.322 J-.226 E.02345
G1 X92.559 Y101.885 E.00816
G1 X92.547 Y101.465 E.01013
G3 X93.195 Y102.871 I.088 J.812 E.04911
G1 X93.187 Y103.096 E.00542
G1 X93.448 Y103.561 E.01286
G3 X93.782 Y105.543 I-.445 J1.095 E.05799
G3 X92.972 Y105.304 I-.251 J-.64 E.02194
G3 X92.493 Y103.916 I.555 J-.968 E.03865
G2 X91.831 Y103.179 I-1.135 J.353 E.02463
G3 X92.193 Y101.567 I.297 J-.779 E.05743
G1 X92.49 Y101.465 E.00757
M106 S124.95
; WIPE_START
G1 X92.822 Y101.466 E-.1263
G1 X93.053 Y101.541 E-.09236
G1 X93.26 Y101.702 E-.09949
G1 X93.344 Y101.841 E-.06185
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I-.372 J-1.159 P1  F42000
G1 X89.128 Y103.195 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F706
M204 S6000
G3 X89.119 Y102.27 I.34 J-.466 E.02588
G1 X89.24 Y102.245 E.00299
G1 X89.281 Y101.826 E.01013
G1 X89.365 Y101.837 E.00205
G3 X89.861 Y103.545 I-.153 J.971 E.05365
G2 X90.601 Y104.083 I.967 J-.552 E.02272
G3 X91.299 Y105.776 I.011 J.986 E.05662
G3 X90.41 Y105.814 I-.469 J-.56 E.02308
G1 X90.181 Y105.655 E.0067
G3 X89.031 Y105.571 I2.198 J-38.008 E.02782
G3 X88.811 Y104.167 I.295 J-.766 E.04146
G1 X88.905 Y103.934 E.00607
G2 X88.546 Y103.087 I-1.342 J.069 E.02265
G3 X89.223 Y101.819 I.773 J-.402 E.04075
; WIPE_START
G1 F9000
G1 X89.365 Y101.837 E-.05433
G1 X89.764 Y101.986 E-.16194
G1 X89.987 Y102.204 E-.11842
G1 X90.044 Y102.309 E-.04531
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I1.192 J-.244 P1  F42000
G1 X86.53 Y85.129 Z20.12
G1 Z19.72
G1 E.4 F1800
; FEATURE: Outer wall
G1 F706
M204 S5000
G1 X86.53 Y107.585 E.54151
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.965 E.00916
G1 X87.445 Y107.965 E.15445
M73 P85 R4
G3 X86.152 Y106.741 I.004 J-1.299 E.04732
G1 X86.15 Y85.129 E.52116
G1 X86.47 Y85.129 E.00772
; WIPE_START
G1 F12000
M204 S6000
G1 X86.473 Y86.129 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I1.217 J.029 P1  F42000
G1 X86.53 Y83.75 Z20.12
G1 Z19.72
G1 E.4 F1800
G1 F706
M204 S5000
G1 X86.15 Y83.75 E.00916
G1 X86.15 Y79.38 E.10538
G3 X87.377 Y78.086 I1.307 J.011 E.04731
G1 X93.85 Y78.085 E.1561
G1 X93.85 Y78.465 E.00916
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y83.69 E.126
; WIPE_START
G1 F12000
M204 S6000
G1 X86.15 Y83.75 E-.14619
G1 X86.15 Y83.134 E-.23381
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.12 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 19.88
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 124/141
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
; OBJECT_ID: 15
G1 X88.159 Y81.573 F42000
G1 Z19.88
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X88.188 Y81.106 E.01129
G3 X87.986 Y80.386 I.789 J-.609 E.01849
G3 X88.267 Y80.253 I.297 J.263 E.0077
G1 X88.377 Y79.848 E.01013
G3 X89.353 Y80.72 I-.271 J1.285 E.03305
G1 X89.825 Y80.962 E.01278
G3 X90.678 Y81.418 I-.033 J1.09 E.02418
G1 X91.192 Y80.946 E.01682
G3 X92.574 Y80.489 I.722 J-.135 E.0509
G3 X92.863 Y81.093 I-.578 J.648 E.01659
G3 X93.423 Y82.182 I-1.277 J1.344 E.03008
G3 X92.415 Y82.788 I-.746 J-.1 E.03252
G3 X91.581 Y82.184 I.464 J-1.521 E.02531
G1 X91.003 Y82.501 E.01589
G3 X89.868 Y82.879 I-.704 J-.22 E.03364
G1 X89.528 Y82.606 E.0105
G1 X88.95 Y82.722 E.01421
G3 X87.548 Y82.889 I-.767 J-.464 E.03925
G3 X87.727 Y81.749 I.955 J-.434 E.02947
G1 X87.761 Y81.209 E.01304
G3 X87.845 Y79.934 I.683 J-.596 E.03422
G3 X88.322 Y79.831 I.346 J.449 E.01217
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.632 Y79.917 E-.12234
G1 X88.921 Y80.094 E-.12868
G1 X89.153 Y80.342 E-.12898
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I-1.216 J.047 P1  F42000
G1 X89.407 Y86.98 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.057 Y86.576 I-.847 J-2.089 E.01856
G1 X90.058 Y86.156 E.01013
G3 X90.894 Y87.052 I.04 J.802 E.03366
G3 X90.246 Y88.203 I-1.222 J.069 E.03366
G3 X89.367 Y88.825 I-3.198 J-3.588 E.026
G3 X88.348 Y88.007 I-.221 J-.769 E.03688
G3 X88.366 Y86.979 I1.212 J-.493 E.02549
G3 X89.051 Y86.667 I.706 J.641 E.01867
G2 X89.781 Y86.239 I-.187 J-1.155 E.02087
G3 X90 Y86.154 I.392 J.693 E.00569
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.507 Y86.248 E-.19607
G1 X90.695 Y86.418 E-.09633
G1 X90.794 Y86.626 E-.0876
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I-.107 J1.212 P1  F42000
G1 X92.48 Y86.774 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.758 Y86.168 I1.665 J.397 E.01619
G1 X93.358 Y86.168 E.01448
G1 X93.636 Y85.794 E.01124
G3 X93.774 Y86.302 I-.514 J.413 E.01307
G3 X93.443 Y87.408 I-.955 J.316 E.02964
G3 X91.904 Y88.175 I-1.047 J-.174 E.04832
G3 X91.721 Y87.139 I.609 J-.642 E.02716
G2 X92.239 Y86.19 I-3.285 J-2.409 E.02616
G3 X92.587 Y85.748 I1.186 J.578 E.01366
G1 X93.6 Y85.748 E.02442
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.733 Y85.917 E-.08144
G1 X93.774 Y86.302 E-.14736
G1 X93.825 Y86.561 E-.1003
G1 X93.81 Y86.694 E-.0509
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I1.167 J.344 P1  F42000
G1 X94.474 Y84.44 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F915
M204 S6000
G3 X94.819 Y84.177 I.495 J.292 E.01072
G1 X94.835 Y83.758 E.01013
G1 X94.934 Y83.764 E.00239
G3 X94.032 Y84.681 I-.094 J.809 E.08764
G3 X94.777 Y83.754 I.839 J-.089 E.03184
; WIPE_START
G1 F9000
G1 X94.934 Y83.764 E-.05963
G1 X95.305 Y83.877 E-.14744
G1 X95.508 Y84.057 E-.10306
G1 X95.597 Y84.218 E-.06987
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I-1.157 J-.378 P1  F42000
G1 X93.46 Y90.758 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.883 Y90.028 I.72 J-.07 E.02172
G1 X93.897 Y89.608 E.01014
G1 X93.988 Y89.615 E.00221
G3 X94.487 Y91.22 I-.229 J.951 E.04877
G1 X94.41 Y91.757 E.01309
G3 X93.716 Y93.269 I-.698 J.595 E.05024
G3 X93.105 Y91.774 I.19 J-.95 E.04603
G1 X93.172 Y91.181 E.01439
G3 X93.839 Y89.603 I.936 J-.534 E.04775
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.988 Y89.615 E-.05674
G1 X94.34 Y89.735 E-.14144
G1 X94.541 Y89.931 E-.10658
G1 X94.633 Y90.107 E-.07525
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I-.14 J-1.209 P1  F42000
G1 X90.175 Y90.622 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.174 Y90.621 E.00003
G3 X90.474 Y90.046 I.328 J-.195 E.01869
G1 X90.535 Y89.631 E.01013
G1 X90.575 Y89.637 E.00097
G3 X91.513 Y90.49 I-.181 J1.141 E.03237
G3 X91.277 Y92.233 I-.617 J.804 E.05136
G3 X90.348 Y91.67 I-.149 J-.801 E.02867
G2 X89.968 Y91.069 I-.724 J.037 E.01792
G3 X90.478 Y89.621 I.542 J-.623 E.04755
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.575 Y89.637 E-.03725
G1 X90.776 Y89.673 E-.07783
G1 X91.068 Y89.824 E-.12462
G1 X91.316 Y90.062 E-.13078
G1 X91.326 Y90.085 E-.00952
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I-.927 J-.788 P1  F42000
G1 X88.282 Y93.665 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F915
M204 S6000
G1 X88.281 Y93.651 E.00034
G3 X88.803 Y93.371 I.468 J.246 E.01518
G1 X88.894 Y92.961 E.01014
G1 X88.956 Y92.977 E.00155
G3 X88.963 Y94.746 I-.322 J.885 E.05536
G3 X87.953 Y93.333 I-.069 J-1.017 E.0501
G3 X88.838 Y92.945 I.952 J.97 E.02382
; WIPE_START
G1 F9000
G1 X88.956 Y92.977 E-.04638
G1 X89.304 Y93.168 E-.15065
G1 X89.538 Y93.574 E-.17827
G1 X89.541 Y93.586 E-.0047
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I-1.074 J-.573 P1  F42000
G1 X88.136 Y96.22 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F915
M204 S6000
G3 X88.541 Y95.758 I.64 J.153 E.01539
G1 X88.532 Y95.338 E.01014
G1 X88.579 Y95.339 E.00113
G3 X89.205 Y96.758 I-.052 J.871 E.04606
G3 X88.221 Y97.256 I-1.048 J-.849 E.02741
G3 X87.646 Y96.442 I.171 J-.731 E.02628
G3 X88.198 Y95.432 I1.256 J.032 E.02883
G1 X88.474 Y95.337 E.00705
; WIPE_START
G1 F9000
G1 X88.579 Y95.339 E-.0398
G1 X88.756 Y95.343 E-.06738
G1 X89.014 Y95.45 E-.10603
G1 X89.22 Y95.647 E-.10841
G1 X89.288 Y95.785 E-.05838
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I.16 J1.206 P1  F42000
G1 X91.489 Y95.493 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.805 Y95.017 I.375 J-.093 E.01548
G1 X91.877 Y94.603 E.01013
G3 X92.809 Y95.323 I-.378 J1.454 E.02919
G3 X91.556 Y96.419 I-.667 J.503 E.06033
G3 X91.165 Y94.945 I.81 J-1.004 E.03935
G3 X91.82 Y94.591 I.658 J.435 E.0187
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.104 Y94.651 E-.1104
G1 X92.383 Y94.812 E-.12217
G1 X92.632 Y95.11 E-.14742
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I-1.21 J.129 P1  F42000
G1 X92.956 Y98.151 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F915
M204 S6000
G3 X93.303 Y97.729 I.372 J-.048 E.01476
G1 X93.367 Y97.314 E.01014
G3 X93.897 Y98.983 I-.095 J.949 E.05354
G3 X93.033 Y97.348 I-.455 J-.806 E.07133
G1 X93.311 Y97.302 E.00678
; WIPE_START
G1 F9000
G1 X93.599 Y97.359 E-.11162
G1 X93.862 Y97.513 E-.11604
G1 X94.07 Y97.745 E-.1184
G1 X94.107 Y97.827 E-.03393
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I-.243 J-1.192 P1  F42000
G1 X89.599 Y98.745 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.34 Y98.37 I.803 J.667 E.02059
G1 X90.412 Y97.957 E.01013
G3 X91.153 Y99.368 I-.019 J.91 E.04684
G3 X90.325 Y99.661 I-.719 J-.716 E.02189
G3 X89.356 Y98.355 I-.442 J-.685 E.05921
G3 X90.356 Y97.945 I.985 J.979 E.02676
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.658 Y98.005 E-.11723
G1 X90.939 Y98.153 E-.12078
G1 X91.156 Y98.367 E-.11565
G1 X91.189 Y98.428 E-.02634
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I-1.179 J.3 P1  F42000
G1 X92.091 Y101.97 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.223 Y101.984 E.00321
G3 X92.791 Y101.833 I.509 J.769 E.01442
G1 X92.911 Y101.431 E.01013
G3 X93.325 Y102.717 I-.216 J.779 E.03857
G3 X91.242 Y102.453 I-.98 J-.619 E.06336
G3 X92.172 Y101.557 I.806 J-.094 E.03604
G3 X92.853 Y101.412 I.555 J.941 E.01708
M106 S124.95
; WIPE_START
G1 X93.112 Y101.496 E-.10329
G1 X93.315 Y101.655 E-.09804
G1 X93.449 Y101.874 E-.09764
G1 X93.49 Y102.084 E-.08103
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I-1.182 J-.29 P1  F42000
G1 X92.896 Y104.5 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F915
M204 S6000
G3 X93.244 Y104.046 I.342 J-.098 E.01603
G1 X93.324 Y103.634 E.01014
G3 X94.228 Y104.585 I-.189 J1.085 E.0339
G1 X94.158 Y105.256 E.01627
G3 X92.824 Y105.236 I-.663 J-.314 E.04043
G3 X92.736 Y103.789 I.648 J-.765 E.03905
G3 X93.267 Y103.62 I.477 J.579 E.01377
; WIPE_START
G1 F9000
G1 X93.567 Y103.691 E-.11689
G1 X93.844 Y103.863 E-.1241
G1 X94.061 Y104.157 E-.13902
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I.23 J-1.195 P1  F42000
G1 X89.136 Y103.209 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F915
M204 S6000
G3 X88.867 Y102.68 I2.582 J-1.646 E.01435
G3 X89.214 Y102.201 I.397 J-.077 E.01599
G1 X89.252 Y101.783 E.01013
G1 X89.314 Y101.791 E.0015
G3 X89.803 Y103.464 I-.12 J.943 E.05319
G1 X89.942 Y104.073 E.01507
G2 X91.01 Y104.232 I4.417 J-26.064 E.02604
G3 X91.051 Y106.012 I-.289 J.897 E.05622
G3 X90.251 Y105.695 I-.101 J-.914 E.0216
G1 X89.721 Y105.545 E.01329
G3 X88.932 Y104.089 I-.431 J-.708 E.06483
G2 X88.529 Y103.025 I-1.76 J.058 E.02793
G3 X89.195 Y101.776 I.76 J-.397 E.04015
; WIPE_START
G1 F9000
G1 X89.314 Y101.791 E-.04566
G1 X89.725 Y101.936 E-.1656
G1 X89.942 Y102.148 E-.11522
G1 X90.009 Y102.271 E-.05352
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I1.193 J-.242 P1  F42000
G1 X86.53 Y85.088 Z20.28
G1 Z19.88
G1 E.4 F1800
M106 S127.5
; FEATURE: Outer wall
G1 F915
M204 S5000
G1 X86.53 Y107.585 E.5425
G1 X93.85 Y107.585 E.17652
G1 X93.85 Y107.961 E.00909
G1 X87.443 Y107.961 E.15451
M73 P86 R4
G3 X86.152 Y106.734 I.001 J-1.294 E.04737
G1 X86.15 Y85.888 E.5027
G1 X86.15 Y85.488 E.00965
G1 X86.15 Y85.088 E.00965
G1 X86.15 Y85.049 E.00094
G1 X93.3 Y85.049 E.17242
M106 S124.95
M106 S127.5
G1 X93.3 Y85.078 E.00069
G1 X92.9 Y85.078 E.00965
G1 X92.5 Y85.078 E.00965
G1 X86.579 Y85.078 E.14278
; WIPE_START
G1 F10320
M204 S6000
G1 X86.577 Y86.078 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I1.217 J-.025 P1  F42000
G1 X86.53 Y83.791 Z20.28
G1 Z19.88
G1 E.4 F1800
G1 F915
M204 S5000
G1 X86.53 Y83.801 E.00026
G1 X92.16 Y83.801 E.13577
G1 X92.56 Y83.801 E.00965
G1 X92.96 Y83.801 E.00965
G1 X92.96 Y83.83 E.00069
G1 X86.15 Y83.83 E.16422
M106 S124.95
G1 X86.15 Y83.791 E.00094
G1 X86.15 Y83.391 E.00965
G1 X86.15 Y82.991 E.00965
G1 X86.15 Y79.386 E.08693
G3 X87.377 Y78.09 I1.295 J-.003 E.04748
G1 X93.85 Y78.088 E.15611
G1 X93.85 Y78.465 E.00909
G1 X86.53 Y78.465 E.17652
G1 X86.53 Y83.731 E.12699
; WIPE_START
G1 F12000
M204 S6000
G1 X86.53 Y83.801 E-.02684
G1 X87.459 Y83.801 E-.35316
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.28 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 20.04
; LAYER_HEIGHT: 0.160002
; layer num/total_layer_count: 125/141
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
; OBJECT_ID: 15
G1 X88.165 Y81.61 F42000
G1 Z20.04
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G1 X88.146 Y81.047 E.01357
G3 X87.94 Y80.405 I.418 J-.488 E.01713
G3 X88.269 Y80.191 I.407 J.267 E.00974
G1 X88.361 Y79.78 E.01017
G3 X89.247 Y80.591 I-.322 J1.241 E.03015
G1 X89.629 Y80.96 E.01279
G3 X90.571 Y81.358 I.095 J1.089 E.02567
G2 X91.137 Y80.793 I-.631 J-1.199 E.01958
G3 X92.606 Y80.48 I.767 J-.003 E.05049
G3 X92.894 Y80.99 I-.518 J.629 E.01443
G2 X93.463 Y81.956 I25.71 J-14.5 E.02704
G3 X92.187 Y82.719 I-.795 J.118 E.04576
G3 X91.674 Y82.225 I.67 J-1.208 E.01736
G1 X91.098 Y82.494 E.01535
G3 X89.549 Y82.623 I-.806 J-.313 E.0466
G1 X88.957 Y82.714 E.01445
G3 X88.465 Y83.171 I-1.181 J-.778 E.01634
G1 X87.707 Y83.165 E.01828
G3 X87.469 Y82.126 I.577 J-.679 E.02757
G1 X87.748 Y81.711 E.01205
G1 X87.73 Y81.17 E.01307
G3 X88.306 Y79.763 I.57 J-.588 E.04701
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.843 Y80.02 E-.22616
G1 X89.082 Y80.275 E-.13296
G1 X89.108 Y80.324 E-.02089
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I-1.215 J.061 P1  F42000
G1 X89.443 Y86.972 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.049 Y86.546 I.952 J.711 E.01817
G1 X90.184 Y86.545 E.00326
G1 X90.297 Y86.14 E.01013
G3 X90.905 Y86.929 I-.145 J.741 E.02623
G3 X90.245 Y88.096 I-1.235 J.072 E.03418
G2 X89.588 Y88.743 I3.642 J4.351 E.02226
G3 X88.329 Y87.924 I-.465 J-.662 E.04639
G3 X88.891 Y86.637 I.674 J-.472 E.04058
G1 X89.167 Y86.655 E.00668
G3 X90.242 Y86.124 I1.102 J.877 E.02987
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.696 Y86.352 E-.19314
G1 X90.819 Y86.508 E-.07537
G1 X90.878 Y86.795 E-.11149
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I.381 J1.156 P1  F42000
G1 X92.686 Y86.198 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.734 Y86.128 I.191 J.079 E.00208
G2 X93.485 Y86.108 I.309 J-2.523 E.01818
G1 X93.738 Y85.691 E.01174
G3 X93.826 Y86.478 I-.553 J.461 E.0202
G3 X93.561 Y87.208 I-1.11 J.01 E.01914
G1 X93.163 Y87.932 E.01994
G3 X91.843 Y88.21 I-.796 J-.506 E.03624
G3 X91.945 Y86.853 I.654 J-.633 E.03709
G3 X92.494 Y85.765 I6.683 J2.69 E.02941
G1 X92.561 Y85.708 E.00213
G2 X93.697 Y85.652 I.38 J-3.827 E.02752
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.863 Y85.854 E-.09962
G1 X93.915 Y86.09 E-.09163
G1 X93.826 Y86.478 E-.15109
G1 X93.816 Y86.576 E-.03766
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I1.161 J.366 P1  F42000
G1 X94.441 Y84.591 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F876
M204 S6000
G3 X94.776 Y84.189 I.318 J-.075 E.0146
G1 X94.794 Y83.77 E.01013
G1 X94.911 Y83.777 E.00282
G3 X94.238 Y85.129 I-.094 J.797 E.07415
G3 X94.737 Y83.766 I.554 J-.57 E.04411
; WIPE_START
G1 F9000
G1 X94.911 Y83.777 E-.06649
G1 X95.265 Y83.886 E-.14079
G1 X95.468 Y84.064 E-.10244
G1 X95.559 Y84.225 E-.07028
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I-1.16 J-.367 P1  F42000
G1 X93.505 Y90.716 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.891 Y89.959 I.658 J-.142 E.02217
G1 X93.908 Y89.539 E.01014
G1 X94.013 Y89.547 E.00254
G3 X94.571 Y91.041 I-.237 J.94 E.04517
G1 X94.292 Y91.361 E.01022
G3 X94.608 Y92.479 I-7.687 J2.773 E.02803
G3 X92.973 Y92.574 I-.82 J.007 E.06012
G3 X93.234 Y91.71 I1.069 J-.149 E.02248
G1 X93.256 Y91.16 E.01327
G3 X93.85 Y89.534 I.85 J-.611 E.04914
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.013 Y89.547 E-.06196
G1 X94.343 Y89.668 E-.13372
G1 X94.542 Y89.862 E-.10566
G1 X94.637 Y90.046 E-.07865
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I-.144 J-1.208 P1  F42000
G1 X90.142 Y90.582 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.415 Y90.001 I.28 J-.223 E.01919
G1 X90.505 Y89.591 E.01014
G3 X91.234 Y90.005 I-.171 J1.15 E.02069
G3 X91.955 Y91.214 I-6.058 J4.43 E.03399
G3 X90.959 Y92.32 I-.985 J.114 E.04057
G3 X90.32 Y91.606 I.272 J-.887 E.0243
G2 X89.742 Y90.74 I-3.301 J1.579 E.02517
G3 X90.418 Y89.576 I.686 J-.38 E.03902
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.708 Y89.626 E-.11188
G1 X90.991 Y89.771 E-.1211
G1 X91.234 Y90.005 E-.12811
G1 X91.262 Y90.047 E-.01892
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I-.926 J-.79 P1  F42000
G1 X88.284 Y93.54 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F876
M204 S6000
G3 X88.855 Y93.311 I.54 J.521 E.0153
G1 X88.956 Y92.903 E.01014
G3 X89.557 Y93.818 I-.27 J.833 E.02853
G3 X88.386 Y94.578 I-.796 J.056 E.041
G3 X88.137 Y93.074 I.371 J-.833 E.04349
G3 X88.9 Y92.888 I.799 J1.618 E.01908
; WIPE_START
G1 F9000
G1 X89.343 Y93.104 E-.18738
G1 X89.486 Y93.318 E-.09796
G1 X89.521 Y93.565 E-.09466
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I-1.078 J-.566 P1  F42000
G1 X88.093 Y96.286 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.519 Y95.838 I.643 J.184 E.0155
G1 X88.511 Y95.418 E.01014
G3 X88.972 Y97.016 I-.002 J.866 E.05378
G3 X87.769 Y96.001 I-.61 J-.497 E.06025
G3 X88.454 Y95.416 I.829 J.277 E.02281
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.731 Y95.423 E-.10538
G1 X88.984 Y95.529 E-.10426
G1 X89.186 Y95.721 E-.1059
G1 X89.261 Y95.873 E-.06445
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I.287 J1.183 P1  F42000
G1 X91.442 Y95.343 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.754 Y94.954 I.386 J-.01 E.01306
G1 X91.835 Y94.542 E.01013
G3 X92.66 Y95.189 I-.126 J1.009 E.02654
G3 X91.397 Y96.147 I-.486 J.671 E.07451
G3 X91.497 Y94.577 I.564 J-.752 E.04496
G3 X91.779 Y94.531 I.259 J.703 E.00692
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.048 Y94.585 E-.10437
G1 X92.32 Y94.739 E-.11881
G1 X92.553 Y94.984 E-.12861
G1 X92.587 Y95.05 E-.02821
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I-1.207 J.158 P1  F42000
G1 X93.004 Y98.238 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F876
M204 S6000
G3 X93.363 Y97.817 I.356 J-.06 E.01522
G1 X93.43 Y97.402 E.01013
G3 X93.635 Y99.161 I-.098 J.902 E.05896
G3 X93.068 Y97.435 I-.119 J-.917 E.06166
G1 X93.373 Y97.392 E.00744
; WIPE_START
G1 F9000
G1 X93.625 Y97.439 E-.09725
G1 X93.883 Y97.588 E-.11321
G1 X94.087 Y97.813 E-.11544
G1 X94.146 Y97.942 E-.0541
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I-.23 J-1.195 P1  F42000
G1 X89.526 Y98.833 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.408 Y98.422 I.869 J.714 E.02426
G1 X90.473 Y98.007 E.01013
G1 X90.537 Y98.019 E.00157
G3 X91.002 Y99.552 I-.035 J.848 E.05053
G3 X90.332 Y99.665 I-.491 J-.865 E.01672
G3 X89.296 Y98.423 I-.503 J-.634 E.06033
G3 X90.416 Y97.997 I1.075 J1.14 E.02965
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.537 Y98.019 E-.04669
G1 X90.997 Y98.193 E-.18701
G1 X91.208 Y98.397 E-.11122
G1 X91.252 Y98.478 E-.03508
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I-1.164 J.357 P1  F42000
G1 X92.328 Y101.987 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.332 Y101.988 E.0001
G3 X92.872 Y101.793 I.617 J.864 E.01401
G1 X92.971 Y101.385 E.01013
G3 X93.379 Y102.649 I-.207 J.765 E.038
G3 X91.274 Y102.688 I-1.067 J-.752 E.05908
G3 X92.216 Y101.555 I.749 J-.336 E.04415
G3 X92.916 Y101.37 I.61 J.893 E.01778
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.36 Y101.608 E-.19154
G1 X93.497 Y101.827 E-.09804
G1 X93.546 Y102.059 E-.09042
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I-1.185 J-.275 P1  F42000
G1 X92.959 Y104.589 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.293 Y104.131 I.333 J-.108 E.01594
G1 X93.373 Y103.719 E.01014
G3 X94.229 Y104.762 I-.013 J.883 E.03703
G3 X92.887 Y105.419 I-.721 J.227 E.05175
G3 X92.532 Y104.366 I1.853 J-1.212 E.02707
G3 X93.317 Y103.705 I.74 J.083 E.0273
M106 S124.95
; WIPE_START
G1 X93.881 Y103.888 E-.2254
G1 X94.082 Y104.059 E-.10027
G1 X94.154 Y104.183 E-.05432
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I.352 J-1.165 P1  F42000
G1 X88.854 Y102.579 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F876
M204 S6000
G3 X88.872 Y102.427 I.241 J-.048 E.00375
G3 X89.19 Y102.161 I.422 J.182 E.01037
G1 X89.227 Y101.742 E.01013
G1 X89.267 Y101.747 E.00098
G3 X89.47 Y103.507 I-.07 J.9 E.05998
G3 X88.915 Y101.791 I-.116 J-.91 E.06128
G1 X89.169 Y101.735 E.00627
; WIPE_START
G1 F9000
G1 X89.267 Y101.747 E-.03737
G1 X89.687 Y101.889 E-.16871
G1 X89.9 Y102.094 E-.11209
G1 X89.977 Y102.237 E-.06183
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I-1.119 J-.479 P1  F42000
G1 X88.819 Y104.94 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F876
M204 S6000
G3 X89.467 Y104.411 I.594 J.067 E.02231
G1 X89.58 Y104.006 E.01013
G1 X89.63 Y104.022 E.00126
G2 X90.394 Y104.281 I3.45 J-8.919 E.01947
G3 X91.739 Y105.063 I.299 J1.032 E.04193
G3 X90.76 Y106.076 I-.934 J.077 E.03844
G3 X90.188 Y105.697 I.268 J-1.024 E.01683
G1 X89.653 Y105.556 E.01335
G3 X88.911 Y104.098 I-.423 J-.703 E.06497
G3 X89.524 Y103.99 I.48 J.932 E.01526
; WIPE_START
G1 F9000
G1 X89.63 Y104.022 E-.04191
G1 X90.394 Y104.281 E-.30671
G1 X90.476 Y104.271 E-.03138
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I1.192 J-.244 P1  F42000
G1 X86.53 Y85.008 Z20.44
G1 Z20.04
G1 E.4 F1800
M106 S127.5
; FEATURE: Outer wall
G1 F876
M204 S5000
G1 X86.528 Y107.57 E.54408
G3 X86.152 Y106.713 I.978 J-.941 E.02304
G1 X86.15 Y86.208 E.49448
G1 X86.15 Y85.808 E.00965
G1 X86.15 Y85.408 E.00965
G1 X86.15 Y85.008 E.00965
G1 X86.15 Y84.845 E.00393
M106 S124.95
M106 S127.5
G1 X93.3 Y84.845 E.17242
M106 S124.95
M106 S127.5
G1 X93.3 Y85.003 E.0038
M106 S124.95
G1 X92.9 Y85.003 E.00965
G1 X92.5 Y85.003 E.00965
G1 X92.1 Y85.003 E.00965
M106 S127.5
G1 X86.585 Y85.003 E.13301
; WIPE_START
G1 F11160
M204 S6000
G1 X86.582 Y86.003 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I-1.153 J.388 P1  F42000
G1 X93.85 Y107.585 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F876
M204 S5000
G1 X93.85 Y107.95 E.00882
G1 X87.448 Y107.95 E.15439
G3 X86.544 Y107.585 I-.006 J-1.286 E.02413
G1 X93.79 Y107.585 E.17475
; WIPE_START
G1 F12000
M204 S6000
G1 X93.85 Y107.95 E-.14088
G1 X93.221 Y107.95 E-.23912
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I1.173 J-.326 P1  F42000
G1 X86.53 Y83.871 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F876
M204 S5000
G1 X86.53 Y83.876 E.00013
G1 X91.76 Y83.876 E.12612
G1 X92.16 Y83.876 E.00965
G1 X92.56 Y83.876 E.00965
G1 X92.96 Y83.876 E.00965
G1 X92.96 Y84.034 E.0038
M106 S124.95
M106 S127.5
G1 X86.15 Y84.034 E.16422
M106 S124.95
M106 S127.5
G1 X86.15 Y83.871 E.00393
M106 S124.95
G1 X86.15 Y83.471 E.00965
G1 X86.15 Y83.071 E.00965
G1 X86.15 Y82.671 E.00965
G1 X86.15 Y79.408 E.07868
G3 X86.53 Y78.478 I1.332 J.002 E.02483
G1 X86.53 Y83.811 E.12859
; WIPE_START
G1 F12000
M204 S6000
G1 X86.53 Y83.876 E-.02489
G1 X87.465 Y83.876 E-.35511
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I1.2 J-.204 P1  F42000
M73 P87 R4
G1 X86.544 Y78.465 Z20.44
G1 Z20.04
G1 E.4 F1800
G1 F876
M204 S5000
G3 X87.374 Y78.1 I.906 J.938 E.02233
G1 X93.85 Y78.099 E.15617
G1 X93.85 Y78.465 E.00882
G1 X86.604 Y78.465 E.17474
; WIPE_START
G1 F12000
M204 S6000
G1 X86.726 Y78.316 E-.07286
G1 X86.889 Y78.223 E-.07144
G1 X87.063 Y78.155 E-.07118
G1 X87.374 Y78.1 E-.11985
G1 X87.492 Y78.1 E-.04467
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.44 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 126/141
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
; OBJECT_ID: 15
G1 X88.057 Y80.916 F42000
G1 Z20.2
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X88.346 Y80.182 I.229 J-.334 E.02625
G1 X88.391 Y79.764 E.01013
G3 X89.206 Y80.747 I-.385 J1.149 E.03242
G2 X90.235 Y81.102 I2.877 J-6.676 E.02628
G3 X90.946 Y81.81 I-3.93 J4.655 E.02422
G3 X89.518 Y82.515 I-.667 J.448 E.066
G1 X88.915 Y82.759 E.01568
G3 X88.373 Y83.246 I-.85 J-.4 E.01806
G1 X87.659 Y83.246 E.0172
G3 X87.697 Y81.806 I.659 J-.703 E.03924
G2 X87.716 Y81.163 I-1.732 J-.371 E.01561
G1 X87.479 Y80.783 E.01079
G3 X88.333 Y79.759 I.786 J-.212 E.03766
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.76 Y79.947 E-.17706
G1 X88.999 Y80.201 E-.13256
G1 X89.085 Y80.365 E-.07038
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-.32 J1.174 P1  F42000
G1 X91.604 Y81.05 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.8 Y80.387 I.382 J-.248 E.01894
G1 X91.794 Y79.967 E.01013
G3 X92.615 Y80.455 I-.011 J.953 E.02414
G3 X92.951 Y81.102 I-.487 J.663 E.0182
G2 X93.428 Y81.775 I3.518 J-1.985 E.01992
G3 X91.998 Y82.563 I-.762 J.309 E.05761
G3 X91.093 Y80.762 I3.72 J-2.997 E.04898
G3 X91.736 Y79.966 I.884 J.057 E.02631
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.009 Y79.981 E-.10378
G1 X92.351 Y80.126 E-.14131
G1 X92.573 Y80.403 E-.13491
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-1.109 J.502 P1  F42000
G1 X94.487 Y84.629 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F752
M204 S6000
G3 X94.717 Y84.192 I.384 J-.077 E.01288
G1 X94.743 Y83.773 E.01013
G1 X94.805 Y83.778 E.00152
G3 X94.264 Y85.172 I-.026 J.792 E.07291
G3 X94.417 Y83.832 I.759 J-.592 E.03606
G1 X94.685 Y83.768 E.00663
; WIPE_START
G1 F9000
G1 X94.805 Y83.778 E-.04594
G1 X95.218 Y83.895 E-.16279
G1 X95.421 Y84.071 E-.1021
G1 X95.511 Y84.229 E-.06917
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-.682 J-1.008 P1  F42000
G1 X92.712 Y86.121 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X92.771 Y86.053 I.109 J.034 E.00225
G1 X93.416 Y86.053 E.01554
G1 X93.585 Y86 E.00428
G1 X93.747 Y85.556 E.0114
G3 X93.893 Y86.453 I-.365 J.52 E.02442
G1 X93.665 Y87.013 E.01458
G2 X93.084 Y87.999 I5.345 J3.813 E.02763
G3 X91.548 Y87.771 I-.723 J-.416 E.04814
G3 X91.913 Y86.916 I1.018 J-.071 E.02327
G1 X92.185 Y86.489 E.01223
G3 X92.637 Y85.633 I.964 J-.038 E.02445
G2 X93.698 Y85.526 I.357 J-1.77 E.02609
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.97 Y85.805 E-.14819
G1 X94.028 Y86.047 E-.09464
G1 X93.99 Y86.304 E-.09848
G1 X93.935 Y86.389 E-.03869
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-.133 J-1.21 P1  F42000
G1 X89.435 Y86.885 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.076 Y86.509 I-1.519 J-3.331 E.01796
G1 X90.163 Y86.5 E.0021
G1 X90.25 Y86.089 E.01013
G3 X90.759 Y87.504 I-.251 J.889 E.04236
G3 X89.923 Y88.288 I-3.858 J-3.273 E.02769
G3 X88.328 Y87.891 I-.803 J-.178 E.06334
G3 X88.974 Y86.599 I.647 J-.484 E.04311
G1 X89.452 Y86.435 E.01219
G3 X90.193 Y86.077 I.763 J.631 E.02048
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.641 Y86.273 E-.18574
G1 X90.906 Y86.675 E-.18281
G1 X90.904 Y86.705 E-.01145
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-1.194 J-.236 P1  F42000
G1 X90.138 Y90.584 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.348 Y89.962 I.29 J-.249 E.01908
G1 X90.354 Y89.542 E.01013
G3 X91.334 Y90.27 I-.05 J1.091 E.03124
G3 X91.947 Y91.143 I-2.473 J2.386 E.02585
G3 X90.916 Y92.383 I-1.005 J.213 E.0447
G3 X90.306 Y91.472 I.326 J-.878 E.02825
G3 X89.644 Y90.544 I6.77 J-5.525 E.02751
G3 X90.296 Y89.54 I.744 J-.23 E.03289
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.645 Y89.581 E-.13364
G1 X90.918 Y89.721 E-.11651
G1 X91.152 Y89.946 E-.12332
G1 X91.161 Y89.961 E-.00652
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-.343 J1.168 P1  F42000
G1 X93.543 Y90.66 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.895 Y89.884 I.624 J-.185 E.02241
G1 X93.914 Y89.464 E.01014
G3 X94.569 Y90.957 I-.13 J.947 E.04709
G2 X94.311 Y91.463 I.239 J.44 E.01455
G3 X94.604 Y92.536 I-12.869 J4.091 E.02682
G3 X92.99 Y92.338 I-.818 J-.014 E.0661
G3 X93.283 Y91.755 I1.005 J.14 E.01601
G1 X93.385 Y91.214 E.0133
G3 X93.857 Y89.458 I.745 J-.741 E.05296
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.106 Y89.482 E-.09539
G1 X94.342 Y89.599 E-.09984
G1 X94.539 Y89.794 E-.10539
G1 X94.635 Y89.979 E-.07938
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-1.051 J-.614 P1  F42000
G1 X91.443 Y95.448 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.738 Y94.903 I.311 J-.184 E.01796
G1 X91.782 Y94.484 E.01016
G3 X92.621 Y95.164 I-.141 J1.032 E.0274
G3 X91.422 Y96.113 I-.407 J.718 E.07786
G3 X91.404 Y94.551 I.506 J-.787 E.04458
G1 X91.725 Y94.474 E.00795
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.017 Y94.532 E-.11321
G1 X92.258 Y94.669 E-.10551
G1 X92.486 Y94.906 E-.12497
G1 X92.531 Y94.99 E-.03632
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I.419 J-1.143 P1  F42000
G1 X88.33 Y93.45 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.883 Y93.263 I.571 J.781 E.01429
G1 X88.983 Y92.855 E.01013
G3 X89.479 Y94.051 I-.18 J.775 E.03645
G3 X88.059 Y94.314 I-.794 J-.324 E.0414
G3 X88.412 Y92.951 I.505 J-.596 E.04226
G3 X88.927 Y92.841 I.475 J.967 E.01283
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.173 Y92.902 E-.09627
G1 X89.393 Y93.065 E-.10401
G1 X89.529 Y93.254 E-.0885
G1 X89.585 Y93.487 E-.09122
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-1.073 J-.574 P1  F42000
G1 X88.131 Y96.204 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.543 Y95.904 I.469 J.213 E.01285
G1 X88.574 Y95.486 E.01013
G3 X88.99 Y96.986 I.021 J.802 E.05131
G3 X87.778 Y95.971 I-.66 J-.443 E.06429
G3 X88.516 Y95.481 I.807 J.416 E.0223
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.789 Y95.501 E-.10399
G1 X89.035 Y95.604 E-.10146
G1 X89.227 Y95.776 E-.09777
G1 X89.326 Y95.952 E-.07678
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-1.202 J.188 P1  F42000
G1 X89.745 Y98.63 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.477 Y98.468 I1.092 J3.206 E.01811
G1 X90.565 Y98.057 E.01014
G3 X90.378 Y99.648 I.035 J.81 E.06773
G3 X88.98 Y99.079 I-.572 J-.598 E.04586
G3 X90.109 Y98.126 I1.097 J.153 E.03901
G3 X90.484 Y98.043 I.306 J.497 E.00944
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.786 Y98.094 E-.11644
G1 X91.056 Y98.227 E-.11409
G1 X91.262 Y98.422 E-.10785
G1 X91.312 Y98.52 E-.04162
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I.15 J1.208 P1  F42000
G1 X93.048 Y98.303 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F752
M204 S6000
G3 X93.374 Y97.894 I.355 J-.052 E.01413
G1 X93.43 Y97.478 E.01014
G3 X93.384 Y99.207 I-.028 J.864 E.06529
G3 X93.106 Y97.516 I.141 J-.891 E.05447
G1 X93.373 Y97.467 E.00655
; WIPE_START
G1 F9000
G1 X93.648 Y97.517 E-.10632
G1 X93.901 Y97.66 E-.11039
G1 X94.096 Y97.872 E-.1093
G1 X94.157 Y98 E-.05399
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-1.094 J-.532 P1  F42000
G1 X92.224 Y101.975 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.342 Y101.986 E.00286
G3 X92.884 Y101.752 I.538 J.502 E.01463
G1 X92.961 Y101.337 E.01017
G3 X93.219 Y102.821 I-.185 J.797 E.04618
G3 X91.632 Y103.053 I-1.047 J-1.621 E.03987
G3 X92.226 Y101.554 I.316 J-.742 E.06012
G3 X92.903 Y101.331 I.638 J.802 E.01756
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.189 Y101.41 E-.11253
G1 X93.394 Y101.561 E-.09684
G1 X93.533 Y101.777 E-.09747
G1 X93.575 Y101.965 E-.07316
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-1.19 J-.255 P1  F42000
G1 X93.02 Y104.555 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.455 Y104.184 I.405 J.034 E.01528
G1 X93.463 Y103.764 E.01013
G3 X94.261 Y104.766 I-.111 J.907 E.03423
G3 X93.554 Y105.822 I-.792 J.234 E.03494
G3 X92.692 Y104.957 I.091 J-.954 E.03193
G3 X93.405 Y103.762 I.701 J-.392 E.04061
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.871 Y103.886 E-.18323
G1 X94.063 Y104.053 E-.09665
G1 X94.199 Y104.269 E-.09702
G1 X94.201 Y104.277 E-.0031
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I.382 J-1.155 P1  F42000
G1 X88.843 Y102.504 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F752
M204 S6000
G3 X89.17 Y102.122 I.37 J-.014 E.01332
G1 X89.217 Y101.705 E.01014
G3 X89.437 Y103.427 I-.044 J.881 E.05929
G3 X89.16 Y101.695 I-.141 J-.865 E.06652
; WIPE_START
G1 F9000
G1 X89.654 Y101.846 E-.19633
G1 X89.855 Y102.039 E-.10572
G1 X89.954 Y102.218 E-.07795
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-1.124 J-.466 P1  F42000
G1 X88.796 Y105.012 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.389 Y104.454 I.474 J-.091 E.0234
G1 X89.503 Y104.049 E.01013
G3 X90.034 Y104.346 I-.147 J.886 E.01496
G3 X91.134 Y104.332 I1.003 J35.671 E.02653
G3 X91.636 Y105.55 I-.104 J.756 E.03837
G3 X90.127 Y105.635 I-.77 J-.236 E.04729
G1 X89.57 Y105.573 E.0135
G3 X88.846 Y104.138 I-.409 J-.694 E.0636
G3 X89.448 Y104.032 I.47 J.912 E.01497
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.732 Y104.119 E-.11282
G1 X90.034 Y104.346 E-.14351
G1 X90.359 Y104.341 E-.12367
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I1.196 J-.225 P1  F42000
G1 X86.53 Y83.997 Z20.6
G1 Z20.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F752
M204 S5000
G1 X91.76 Y83.998 E.12612
G1 X92.16 Y83.998 E.00965
G1 X92.56 Y83.998 E.00965
G1 X92.96 Y83.998 E.00965
G1 X92.96 Y84.075 E.00186
G1 X92.96 Y84.185 E.00265
M106 S124.95
M106 S127.5
G1 X93.3 Y84.185 E.0082
M106 S124.95
M106 S127.5
G1 F600
G1 X93.3 Y84.804 E.01495
M106 S124.95
G1 F752
G1 X93.3 Y84.882 E.00186
G1 X92.9 Y84.882 E.00965
G1 X92.5 Y84.882 E.00965
G1 X92.1 Y84.882 E.00965
M106 S127.5
G1 X86.53 Y84.882 E.13432
G1 X86.53 Y107.548 E.5466
G3 X86.152 Y106.673 I.975 J-.941 E.02349
G1 X86.15 Y86.404 E.48879
G1 X86.15 Y86.004 E.00965
G1 X86.15 Y85.604 E.00965
G1 X86.15 Y85.204 E.00965
G1 X86.15 Y84.804 E.00965
G1 F600
G1 X86.15 Y84.075 E.0176
M106 S124.95
G1 F752
G1 X86.15 Y83.675 E.00965
G1 X86.15 Y83.275 E.00965
G1 X86.15 Y82.875 E.00965
G1 X86.15 Y82.475 E.00965
G1 X86.15 Y79.449 E.07296
G3 X86.53 Y78.502 I1.371 J.001 E.02521
G1 X86.53 Y83.937 E.13107
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y83.949 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I1.199 J-.21 P1  F42000
G1 X86.569 Y78.465 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F752
M204 S5000
G3 X87.44 Y78.119 I.879 J.944 E.02313
G1 X93.85 Y78.119 E.15457
G1 X93.85 Y78.465 E.00834
G1 X86.629 Y78.465 E.17413
; WIPE_START
G1 F12000
M204 S6000
G1 X86.725 Y78.339 E-.05987
G1 X87.006 Y78.195 E-.12017
G1 X87.193 Y78.143 E-.07359
G1 X87.44 Y78.119 E-.09457
G1 X87.524 Y78.119 E-.03181
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I-1.19 J.255 P1  F42000
G1 X93.85 Y107.585 Z20.6
G1 Z20.2
G1 E.4 F1800
G1 F752
M204 S5000
G1 X93.85 Y107.93 E.00834
G1 X87.443 Y107.93 E.1545
G3 X86.568 Y107.585 I.018 J-1.327 E.0232
G1 X93.79 Y107.585 E.17417
; WIPE_START
G1 F12000
M204 S6000
G1 X93.85 Y107.93 E-.13338
G1 X93.201 Y107.93 E-.24662
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.6 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X92.524 Y84.44
G1 Z20.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.517825
G1 F752
M204 S6000
G1 X86.351 Y84.44 E.18664
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 20.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10082.96
G1 X87.351 Y84.44 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 127/141
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z20.6 I-.925 J.791 P1  F42000
G1 X89.448 Y86.893 Z20.6
G1 Z20.36
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G3 X90.187 Y86.461 I2.461 J3.364 E.02069
G1 X90.241 Y86.044 E.01013
G3 X90.254 Y87.838 I-.278 J.899 E.05735
G1 X89.885 Y88.241 E.01316
G3 X88.461 Y88.703 I-.834 J-.145 E.04431
G3 X88.353 Y87.9 I.815 J-.519 E.02017
G3 X88.947 Y86.557 I.609 J-.533 E.04434
G1 X89.11 Y86.606 E.0041
G3 X89.975 Y86.069 I7.158 J10.576 E.02456
G1 X90.184 Y86.036 E.00509
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.589 Y86.196 E-.16552
G1 X90.775 Y86.417 E-.11005
G1 X90.871 Y86.675 E-.10443
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I.344 J1.167 P1  F42000
G1 X92.699 Y86.136 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.38 Y85.932 I.486 J.382 E.01826
G1 X93.622 Y85.877 E.006
G1 X93.751 Y85.46 E.01052
G3 X93.859 Y86.597 I-.32 J.604 E.0326
G2 X93.2 Y87.594 I9.061 J6.71 E.02885
G3 X91.71 Y88.192 I-.882 J-.044 E.04854
G3 X92.02 Y86.856 I.728 J-.535 E.03754
G2 X92.309 Y85.952 I-3.988 J-1.773 E.02293
G3 X93.333 Y85.512 I.826 J.51 E.02863
G1 X93.702 Y85.429 E.00912
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.912 Y85.564 E-.09479
G1 X94.059 Y85.759 E-.09296
G1 X94.116 Y85.979 E-.08622
G1 X94.084 Y86.256 E-.10603
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I1.183 J.285 P1  F42000
G1 X94.469 Y84.653 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F742
M204 S6000
G3 X94.706 Y84.193 I.325 J-.124 E.01407
G1 X94.691 Y83.77 E.0102
G1 X94.818 Y83.781 E.00306
G3 X94.472 Y85.28 I-.066 J.774 E.06413
G3 X94.634 Y83.766 I.371 J-.726 E.04737
; WIPE_START
G1 F9000
G1 X94.818 Y83.781 E-.07018
G1 X95.165 Y83.896 E-.13918
G1 X95.367 Y84.074 E-.10227
G1 X95.456 Y84.231 E-.06837
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I.783 J-.932 P1  F42000
G1 X91.601 Y80.991 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.832 Y80.342 I.323 J-.251 E.01977
G1 X91.952 Y79.939 E.01013
G3 X92.613 Y80.44 I-.481 J1.32 E.02029
G3 X92.985 Y81.127 I-.281 J.596 E.02016
G3 X93.491 Y82.097 I-1.914 J1.616 E.0266
G3 X92.108 Y82.635 I-.78 J.042 E.0472
G2 X91.324 Y81.38 I-434.793 J270.971 E.03569
G3 X91.638 Y79.925 I.736 J-.603 E.04124
G1 X91.897 Y79.921 E.00625
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.265 Y80.075 E-.1517
G1 X92.533 Y80.289 E-.13013
G1 X92.613 Y80.44 E-.06497
G1 X92.681 Y80.495 E-.0332
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I-.143 J-1.209 P1  F42000
G1 X88.117 Y81.033 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X87.89 Y80.552 I3.471 J-1.937 E.01284
G3 X88.217 Y80.178 I.278 J-.087 E.01436
G1 X88.227 Y79.758 E.01013
G3 X89.128 Y80.716 I-.085 J.983 E.0347
G1 X89.621 Y80.986 E.01355
G3 X90.48 Y81.436 I.106 J.843 E.0249
G3 X91.104 Y82.181 I-.65 J1.179 E.02398
G3 X89.761 Y82.85 I-.774 J.129 E.04823
G2 X89.413 Y82.661 I-.318 J.17 E.01012
G1 X88.849 Y82.855 E.01437
G3 X87.648 Y83.367 I-.959 J-.584 E.0336
G3 X87.881 Y81.664 I.791 J-.759 E.04766
G1 X87.696 Y81.096 E.01441
G3 X87.991 Y79.775 I.563 J-.567 E.0389
G1 X88.169 Y79.757 E.00432
M106 S124.95
M106 S127.5
; WIPE_START
G1 X88.691 Y79.877 E-.20339
G1 X88.911 Y80.124 E-.12564
G1 X88.974 Y80.242 E-.05097
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I-1.21 J.134 P1  F42000
G1 X90.114 Y90.556 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.3 Y89.938 I.265 J-.257 E.01896
G1 X90.296 Y89.517 E.01014
G3 X91.25 Y90.201 I-.006 J1.016 E.03018
G2 X91.858 Y90.847 I4.887 J-3.997 E.02141
G3 X91.081 Y92.471 I-1.089 J.477 E.04926
G3 X90.295 Y91.534 I.182 J-.952 E.03193
G2 X89.819 Y90.869 I-.976 J.196 E.0203
G3 X90.238 Y89.515 I.596 J-.557 E.0414
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.556 Y89.54 E-.12135
G1 X90.846 Y89.668 E-.12042
G1 X91.076 Y89.89 E-.12128
G1 X91.097 Y89.929 E-.01695
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I-.331 J1.171 P1  F42000
G1 X93.591 Y90.633 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.889 Y89.81 I.535 J-.272 E.02365
G1 X93.901 Y89.39 E.01013
G3 X94.687 Y90.591 I-.063 J.899 E.04002
G3 X94.152 Y91.216 I-.965 J-.283 E.02044
G1 X94.245 Y91.84 E.01522
G3 X93.629 Y93.386 I-.494 J.699 E.05509
G3 X93.363 Y91.826 I.281 J-.851 E.04681
G1 X93.437 Y91.654 E.00452
G1 X93.415 Y91.128 E.01269
G3 X93.843 Y89.387 I.713 J-.747 E.05231
M106 S124.95
M106 S127.5
; WIPE_START
G1 X94.14 Y89.419 E-.11363
G1 X94.342 Y89.517 E-.08507
G1 X94.534 Y89.718 E-.10592
G1 X94.624 Y89.895 E-.07539
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I-1.04 J-.632 P1  F42000
G1 X91.376 Y95.244 Z20.76
G1 Z20.36
M73 P88 R4
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.775 Y94.869 I.432 J.059 E.01428
G1 X91.791 Y94.449 E.01013
G3 X92.604 Y95.181 I-.205 J1.046 E.02771
G3 X91.972 Y96.667 I-.366 J.721 E.05867
G3 X91.447 Y96.08 I.385 J-.871 E.01956
G3 X91.434 Y94.518 I.398 J-.785 E.04636
G3 X91.733 Y94.447 I.339 J.761 E.00747
M106 S124.95
M106 S127.5
; WIPE_START
G1 X92.13 Y94.55 E-.15602
G1 X92.422 Y94.835 E-.15491
G1 X92.507 Y94.996 E-.06907
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I.436 J-1.136 P1  F42000
G1 X88.383 Y93.412 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.861 Y93.177 I2.235 J3.951 E.01284
G1 X88.915 Y92.76 E.01015
G3 X89.12 Y94.417 I-.203 J.866 E.05225
G3 X87.739 Y93.533 I-.455 J-.81 E.04846
G3 X88.485 Y92.902 I.961 J.38 E.02454
G3 X88.859 Y92.749 I.41 J.466 E.00993
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.047 Y92.787 E-.073
G1 X89.383 Y93.026 E-.15671
G1 X89.532 Y93.225 E-.09438
G1 X89.579 Y93.364 E-.05591
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I-1.084 J-.554 P1  F42000
G1 X88.085 Y96.29 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.591 Y95.904 I.655 J.334 E.01588
G1 X88.621 Y95.485 E.01013
G3 X89.004 Y96.965 I-.002 J.79 E.05012
G3 X87.612 Y96.949 I-.692 J-.382 E.04107
G3 X88.052 Y95.695 I1.081 J-.326 E.03428
G3 X88.564 Y95.479 I.572 J.642 E.01365
M106 S124.95
M106 S127.5
; WIPE_START
G1 X89.041 Y95.593 E-.18655
G1 X89.238 Y95.762 E-.09862
G1 X89.364 Y95.978 E-.09483
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I-1.2 J.202 P1  F42000
G1 X89.812 Y98.647 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.396 Y98.533 I-.009 J-1.607 E.01442
G1 X90.552 Y98.509 E.00381
G1 X90.611 Y98.094 E.01013
G3 X91.196 Y99.526 I-.003 J.837 E.04762
G3 X90.166 Y99.764 I-1.367 J-3.577 E.02556
G3 X89.425 Y98.353 I-.425 J-.677 E.06351
G3 X90.119 Y98.204 I.568 J.952 E.01742
G3 X90.554 Y98.084 I.393 J.578 E.01107
M106 S124.95
M106 S127.5
; WIPE_START
G1 X90.85 Y98.129 E-.1137
G1 X91.101 Y98.253 E-.10641
G1 X91.294 Y98.439 E-.10181
G1 X91.366 Y98.574 E-.05808
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I.139 J1.209 P1  F42000
G1 X93.091 Y98.376 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F742
M204 S6000
G3 X93.405 Y97.973 I.347 J-.053 E.0138
G1 X93.473 Y97.558 E.01013
G3 X93.509 Y99.263 I-.045 J.854 E.06171
G3 X93.401 Y97.546 I.002 J-.862 E.0626
; WIPE_START
G1 F9000
G1 X93.67 Y97.592 E-.10395
G1 X93.917 Y97.729 E-.10704
G1 X94.121 Y97.956 E-.11616
G1 X94.18 Y98.082 E-.05284
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I-1.088 J-.545 P1  F42000
G1 X92.232 Y101.976 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.351 Y101.985 E.00288
G3 X92.903 Y101.725 I.526 J.402 E.01529
G1 X93.021 Y101.322 E.01014
G3 X93.28 Y102.75 I-.203 J.774 E.04381
G3 X92.506 Y102.974 I-.662 J-.837 E.01994
G3 X91.377 Y101.67 I-.512 J-.697 E.0622
G3 X92.234 Y101.555 I.579 J1.051 E.02133
G3 X92.967 Y101.303 I.647 J.693 E.01925
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.403 Y101.537 E-.1882
G1 X93.549 Y101.747 E-.09711
G1 X93.621 Y101.985 E-.09468
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I-1.193 J-.242 P1  F42000
G1 X93.092 Y104.589 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.4 Y104.215 I.467 J.07 E.01228
G1 X93.448 Y103.798 E.01013
G3 X94.223 Y104.689 I-.018 J.798 E.03204
G3 X93.57 Y105.888 I-.76 J.364 E.03839
G3 X92.697 Y104.93 I.146 J-1.01 E.03386
G3 X93.391 Y103.791 I.815 J-.285 E.03677
M106 S124.95
M106 S127.5
; WIPE_START
G1 X93.846 Y103.908 E-.17854
G1 X94.03 Y104.057 E-.09013
G1 X94.162 Y104.255 E-.09022
G1 X94.169 Y104.31 E-.0211
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I.379 J-1.156 P1  F42000
G1 X88.844 Y102.563 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F742
M204 S6000
G3 X89.029 Y102.107 I.471 J-.075 E.01246
G1 X89.018 Y101.687 E.01014
G3 X89.407 Y103.349 I.125 J.847 E.06145
G3 X88.96 Y101.686 I-.142 J-.854 E.06149
; WIPE_START
G1 F9000
G1 X89.341 Y101.693 E-.14458
G1 X89.605 Y101.802 E-.10861
G1 X89.825 Y102 E-.11249
G1 X89.843 Y102.033 E-.01432
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I-1.151 J-.394 P1  F42000
G1 X88.798 Y105.088 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.313 Y104.496 I.393 J-.178 E.02375
G1 X89.427 Y104.092 E.01013
G3 X89.947 Y104.448 I-.155 J.783 E.01563
G2 X90.91 Y104.313 I.248 J-1.727 E.02378
G3 X91.827 Y105.329 I.083 J.846 E.03834
G2 X91.36 Y105.978 I57.773 J41.978 E.01929
G3 X90.194 Y105.713 I-.502 J-.492 E.03453
G1 X89.663 Y105.515 E.01366
G3 X89.07 Y104.081 I-.523 J-.624 E.07368
G1 X89.372 Y104.075 E.00729
M106 S124.95
; WIPE_START
G1 X89.65 Y104.16 E-.11068
G1 X89.947 Y104.448 E-.15708
G1 X90.242 Y104.442 E-.11224
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I1.197 J-.22 P1  F42000
G1 X86.53 Y84.201 Z20.76
G1 Z20.36
G1 E.4 F1800
; FEATURE: Outer wall
G1 F742
M204 S5000
G1 X93.3 Y84.201 E.16326
G1 X93.3 Y84.678 E.0115
G1 X86.53 Y84.678 E.16326
G1 X86.53 Y107.512 E.55065
G3 X86.152 Y106.615 I1.022 J-.959 E.02398
M73 P88 R3
G1 X86.15 Y79.51 E.65366
G3 X86.53 Y78.537 I1.399 J-.014 E.02582
G1 X86.53 Y84.141 E.13515
; WIPE_START
G1 F12000
M204 S6000
G1 X87.53 Y84.15 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I1.201 J-.196 P1  F42000
G1 X86.605 Y78.465 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F742
M204 S5000
G3 X87.375 Y78.15 I.85 J.978 E.02042
G1 X93.85 Y78.148 E.15616
G1 X93.85 Y78.465 E.00764
G1 X86.665 Y78.465 E.17328
; WIPE_START
G1 F12000
M204 S6000
G1 X86.804 Y78.321 E-.07624
G1 X87.009 Y78.224 E-.08617
G1 X87.189 Y78.173 E-.07102
G1 X87.375 Y78.15 E-.07092
G1 X87.574 Y78.15 E-.07565
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I-1.19 J.254 P1  F42000
G1 X93.85 Y107.585 Z20.76
G1 Z20.36
G1 E.4 F1800
G1 F742
M204 S5000
G1 X93.85 Y107.901 E.00764
G1 X87.445 Y107.901 E.15445
G3 X86.605 Y107.585 I.002 J-1.277 E.02213
G1 X93.79 Y107.585 E.17327
; WIPE_START
G1 F12000
M204 S6000
G1 X93.85 Y107.901 E-.12253
G1 X93.172 Y107.901 E-.25747
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.76 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X93.1 Y84.44
G1 Z20.36
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110587
G1 F742
M204 S6000
G1 X87.39 Y84.44 E.02722
; CHANGE_LAYER
; Z_HEIGHT: 20.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X88.39 Y84.44 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 128/141
; update layer progress
M73 L128
M991 S0 P127 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
M204 S10000
G17
G3 Z20.76 I-1.105 J.509 P1  F42000
G1 X89.508 Y86.867 Z20.76
G1 Z20.52
G1 E.4 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
M204 S6000
G2 X89.945 Y86.574 I.05 J-.398 E.01383
G3 X90.198 Y86.42 I.34 J.273 E.0073
G1 X90.233 Y86 E.01014
G3 X90.584 Y87.522 I-.261 J.861 E.04557
G2 X89.873 Y88.162 I.611 J1.394 E.02347
G3 X88.69 Y88.981 I-.969 J-.135 E.03901
G3 X88.315 Y88.118 I.331 J-.656 E.02462
G3 X88.329 Y86.785 I1.578 J-.65 E.03302
G3 X88.992 Y86.545 I.467 J.253 E.01857
G1 X89.523 Y86.435 E.01309
G3 X90.176 Y85.994 I.795 J.474 E.01961
; WIPE_START
G1 X90.538 Y86.117 E-.14552
G1 X90.715 Y86.318 E-.10162
G1 X90.845 Y86.611 E-.12186
G1 X90.849 Y86.64 E-.011
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I.334 J1.17 P1  F42000
G1 X92.764 Y86.092 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.427 Y85.732 I.686 J.472 E.01887
G1 X93.438 Y85.312 E.01013
G3 X93.789 Y86.717 I-.022 J.752 E.04701
G2 X93.16 Y87.463 I2.368 J2.635 E.02363
G3 X92.471 Y88.514 I-1.319 J-.114 E.03156
G3 X91.966 Y86.938 I-.105 J-.835 E.05624
G1 X92.241 Y86.507 E.01233
G3 X93.38 Y85.311 I1.228 J.029 E.04369
; WIPE_START
G1 X93.758 Y85.383 E-.14615
G1 X93.961 Y85.539 E-.09727
G1 X94.101 Y85.744 E-.09423
G1 X94.131 Y85.851 E-.04235
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I1.189 J.259 P1  F42000
G1 X94.438 Y84.446 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.806 Y84.221 I.558 J.499 E.01056
G1 X94.927 Y83.816 E.01019
G3 X94.681 Y85.301 I-.198 J.73 E.05362
G3 X94.011 Y84.339 I.133 J-.807 E.03151
G3 X94.874 Y83.794 I.984 J.602 E.02552
; WIPE_START
G1 X95.312 Y84.068 E-.19633
G1 X95.446 Y84.301 E-.10203
G1 X95.483 Y84.512 E-.08164
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I.822 J-.897 P1  F42000
G1 X91.625 Y80.978 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.69 Y80.296 I.671 J-.28 E.01721
G1 X91.763 Y80.29 E.00177
G1 X91.859 Y79.881 E.01013
G3 X92.543 Y80.37 I-.673 J1.663 E.02047
G3 X93.024 Y81.052 I-.113 J.59 E.02223
G3 X93.503 Y82.187 I-13.552 J6.39 E.02971
G3 X92.658 Y82.879 I-.666 J.049 E.03084
G3 X91.867 Y82.079 I.191 J-.98 E.02881
G3 X91.159 Y81.003 I537.208 J-353.928 E.03107
G3 X91.569 Y79.884 I.979 J-.276 E.0307
G1 X91.803 Y79.866 E.00567
; WIPE_START
G1 X92.111 Y79.978 E-.12444
G1 X92.543 Y80.37 E-.22185
G1 X92.625 Y80.404 E-.03371
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I-.203 J-1.2 P1  F42000
G1 X88.153 Y81.162 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X87.899 Y80.514 I-3.413 J.967 E.0168
G3 X88.135 Y80.177 I.193 J-.116 E.01251
G1 X88.235 Y79.769 E.01013
G3 X88.98 Y80.345 I-.077 J.868 E.02398
G1 X89.061 Y80.755 E.01006
G1 X89.568 Y81.009 E.01369
G3 X90.475 Y81.514 I.147 J.803 E.02711
G3 X90.586 Y83.093 I-.263 J.812 E.04887
G3 X89.52 Y82.501 I-.04 J-1.185 E.03089
G2 X88.658 Y83.057 I.322 J1.446 E.02526
G3 X87.752 Y83.531 I-1.062 J-.928 E.02523
G3 X87.34 Y82.667 I.421 J-.731 E.02455
G3 X87.767 Y81.801 I.98 J-.054 E.02432
G2 X87.485 Y80.597 I-2.261 J-.106 E.03021
G3 X88.179 Y79.755 I.609 J-.205 E.03143
; WIPE_START
G1 X88.55 Y79.848 E-.14536
G1 X88.774 Y79.983 E-.09936
G1 X88.95 Y80.293 E-.13528
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I-1.209 J.136 P1  F42000
G1 X90.099 Y90.533 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.088 Y90.069 I.137 J-.236 E.0134
G3 X90.457 Y89.891 I.426 J.413 E.01009
G1 X90.454 Y89.471 E.01013
G3 X90.912 Y89.73 I.004 J.525 E.01329
G2 X91.505 Y90.527 I5.076 J-3.16 E.02399
G3 X91.953 Y91.259 I-.337 J.709 E.02189
G3 X91.095 Y92.534 I-1.403 J-.018 E.03923
G3 X90.378 Y91.863 I.127 J-.854 E.02519
G2 X89.711 Y90.761 I-1.457 J.129 E.03215
G3 X90.075 Y89.572 I.607 J-.465 E.03502
G1 X90.396 Y89.47 E.00814
; WIPE_START
G1 X90.742 Y89.548 E-.13459
G1 X90.912 Y89.73 E-.09483
G1 X91.12 Y90.068 E-.15058
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I-.067 J1.215 P1  F42000
G1 X93.555 Y90.201 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.861 Y89.758 I.442 J-.023 E.01397
G1 X93.859 Y89.338 E.01013
G3 X94.363 Y91.005 I-.048 J.924 E.05469
G3 X93.128 Y90.379 I-.453 J-.638 E.04099
G3 X93.801 Y89.337 I.861 J-.182 E.03319
; WIPE_START
G1 X94.12 Y89.357 E-.12137
G1 X94.314 Y89.446 E-.08112
G1 X94.522 Y89.627 E-.10492
G1 X94.608 Y89.798 E-.07259
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I-1.126 J-.462 P1  F42000
G1 X93.464 Y92.589 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.775 Y92.186 I.376 J-.031 E.01347
G1 X93.826 Y91.769 E.01013
G3 X94.324 Y93.181 I-.053 J.812 E.04582
G3 X93.464 Y93.348 I-.483 J-.187 E.02521
G3 X93.749 Y91.76 I.442 J-.74 E.05033
; WIPE_START
G1 X94.009 Y91.791 E-.09951
G1 X94.249 Y91.914 E-.10242
G1 X94.44 Y92.113 E-.10469
G1 X94.521 Y92.288 E-.07338
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I-.82 J-.899 P1  F42000
G1 X91.39 Y95.142 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.867 Y94.795 I.625 J.357 E.01465
G1 X92.005 Y94.397 E.01015
G3 X92.478 Y94.991 I-.448 J.842 E.01884
G3 X93.044 Y95.747 I-2.022 J2.106 E.02286
G3 X91.47 Y96.037 I-.78 J.184 E.06262
G3 X90.924 Y95.321 I.617 J-1.037 E.02225
G3 X91.952 Y94.374 I.976 J.029 E.03756
; WIPE_START
G1 X92.272 Y94.613 E-.15152
G1 X92.478 Y94.991 E-.16394
G1 X92.59 Y95.119 E-.06454
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I.468 J-1.124 P1  F42000
G1 X88.458 Y93.399 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X88.896 Y92.661 I-.194 J-.614 E.02267
G3 X89.44 Y94.088 I-.253 J.914 E.04283
G3 X87.667 Y93.724 I-.795 J-.629 E.05395
G3 X88.354 Y92.986 I.845 J.099 E.026
G3 X88.839 Y92.655 I.677 J.468 E.01449
; WIPE_START
G1 X89.206 Y92.811 E-.15183
G1 X89.525 Y93.193 E-.18899
G1 X89.56 Y93.29 E-.03918
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I-1.101 J-.518 P1  F42000
G1 X88.164 Y96.26 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.722 Y95.913 I.513 J.202 E.01698
G1 X88.799 Y95.496 E.01021
G3 X88.99 Y96.95 I-.147 J.759 E.04654
G3 X87.767 Y97.258 I-.801 J-.599 E.03291
G3 X87.92 Y95.913 I.831 J-.586 E.03572
G3 X88.741 Y95.492 I.734 J.421 E.02353
; WIPE_START
G1 X89.049 Y95.586 E-.12229
G1 X89.24 Y95.752 E-.09615
G1 X89.37 Y95.974 E-.09797
G1 X89.406 Y96.137 E-.06359
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I-1.194 J.235 P1  F42000
G1 X89.911 Y98.703 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.117 Y98.758 E.00514
G3 X90.628 Y98.543 I.579 J.663 E.0136
G1 X90.695 Y98.129 E.01013
G3 X91.398 Y99.457 I-.119 J.913 E.04238
G3 X91.081 Y99.647 I-.392 J-.296 E.00914
G2 X89.8 Y99.93 I-.122 J2.485 E.03201
G3 X89.086 Y98.625 I-.037 J-.827 E.04454
G3 X90.066 Y98.31 I.79 J.776 E.02582
G3 X90.624 Y98.118 I.568 J.745 E.01447
; WIPE_START
G1 X91.128 Y98.276 E-.20064
G1 X91.315 Y98.455 E-.09849
G1 X91.403 Y98.649 E-.08086
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I.14 J1.209 P1  F42000
G1 X93.131 Y98.449 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.434 Y98.049 I.339 J-.058 E.01355
G1 X93.483 Y97.631 E.01014
G1 X93.563 Y97.644 E.00195
G3 X94.144 Y98.87 I-.146 J.82 E.03823
G3 X93.242 Y99.196 I-.546 J-.101 E.02789
G3 X93.426 Y97.622 I.264 J-.767 E.05303
; WIPE_START
G1 X93.563 Y97.644 E-.05266
G1 X93.934 Y97.797 E-.15229
G1 X94.119 Y97.996 E-.10336
G1 X94.197 Y98.168 E-.0717
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I-1.075 J-.571 P1  F42000
G1 X92.202 Y101.921 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X92.803 Y101.673 I-2.775 J-7.58 E.01569
G1 X92.866 Y101.255 E.0102
G3 X93.46 Y102.58 I-.078 J.831 E.04247
G3 X92.484 Y102.89 I-.8 J-.826 E.02559
G3 X91.077 Y102.145 I-.54 J-.682 E.04852
G3 X91.463 Y101.562 I.475 J-.105 E.01882
G2 X92.625 Y101.279 I.118 J-2.041 E.02928
G1 X92.809 Y101.245 E.00451
; WIPE_START
G1 X93.208 Y101.389 E-.16109
G1 X93.401 Y101.528 E-.09037
G1 X93.538 Y101.721 E-.08976
G1 X93.556 Y101.821 E-.03879
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I-1.204 J-.178 P1  F42000
G1 X93.144 Y104.618 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.441 Y104.269 I.271 J-.069 E.01291
G1 X93.456 Y103.85 E.01013
G3 X94.184 Y104.622 I.025 J.705 E.02896
G3 X93.933 Y105.871 I-1.159 J.417 E.03228
G3 X93.011 Y105.591 I-.3 J-.669 E.02535
G3 X92.722 Y104.702 I.788 J-.747 E.02332
G3 X93.399 Y103.847 I.741 J-.108 E.02941
; WIPE_START
G1 X93.826 Y103.932 E-.16564
G1 X94 Y104.062 E-.08247
G1 X94.126 Y104.241 E-.08321
G1 X94.145 Y104.368 E-.04867
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I-.176 J-1.204 P1  F42000
G1 X88.837 Y105.144 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.825 Y104.612 I.332 J-.273 E.01382
G3 X89.249 Y104.542 I.483 J1.589 E.0104
G1 X89.367 Y104.138 E.01013
G3 X89.842 Y104.455 I-.166 J.764 E.0141
G1 X90.43 Y104.553 E.01437
G3 X91.819 Y104.786 I.605 J.65 E.0392
G3 X91.56 Y105.651 I-.386 J.356 E.02622
G3 X90.681 Y106.222 I-.746 J-.187 E.0278
G3 X90.141 Y105.5 I.775 J-1.143 E.02216
G1 X89.533 Y105.55 E.01472
G3 X88.456 Y105.347 I-.454 J-.548 E.03016
G3 X88.56 Y104.268 I.707 J-.477 E.02832
G3 X89.311 Y104.121 I.664 J1.407 E.01866
; WIPE_START
G1 X89.57 Y104.201 E-.10278
G1 X89.842 Y104.455 E-.1414
G1 X90.195 Y104.514 E-.13582
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I1.023 J-.658 P1  F42000
G1 X88.833 Y102.398 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.924 Y102.049 I2.952 J.576 E.00872
G3 X89.027 Y102.051 I.046 J.233 E.00251
G1 X89.117 Y101.641 E.01013
G3 X89.379 Y103.274 I.005 J.837 E.05724
G3 X88.821 Y101.629 I-.07 J-.894 E.05714
G1 X89.06 Y101.628 E.00577
; WIPE_START
G1 X89.553 Y101.764 E-.1942
G1 X89.772 Y101.951 E-.10959
G1 X89.874 Y102.124 E-.07621
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I1.206 J-.164 P1  F42000
G1 X86.657 Y78.465 Z20.92
G1 Z20.52
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G3 X87.444 Y78.186 I.791 J.982 E.02053
G1 X93.85 Y78.186 E.15448
G1 X93.85 Y78.465 E.00672
G1 X86.717 Y78.465 E.17202
; WIPE_START
G1 F12000
M204 S6000
G1 X86.868 Y78.326 E-.07813
M73 P89 R3
G1 X87.033 Y78.255 E-.06818
G1 X87.252 Y78.2 E-.08584
G1 X87.444 Y78.186 E-.07298
G1 X87.641 Y78.186 E-.07487
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I-1.191 J.251 P1  F42000
G1 X93.85 Y107.585 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F600
M204 S5000
G1 X93.85 Y107.863 E.00672
G1 X87.444 Y107.863 E.15448
G3 X86.657 Y107.585 I.019 J-1.305 E.0205
G1 X93.79 Y107.585 E.17202
; WIPE_START
G1 F12000
M204 S6000
G1 X93.85 Y107.863 E-.10835
G1 X93.135 Y107.863 E-.27165
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I1.187 J-.268 P1  F42000
G1 X86.53 Y78.582 Z20.92
G1 Z20.52
G1 E.4 F1800
G1 F600
M204 S5000
G1 X86.53 Y107.469 E.69662
G3 X86.152 Y106.54 I1.068 J-.976 E.02472
G1 X86.15 Y79.592 E.64985
G3 X86.491 Y78.627 I1.466 J-.025 E.0252
; WIPE_START
G1 F12000
M204 S6000
G1 X86.492 Y79.627 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z20.92 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 20.68
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 129/141
; update layer progress
M73 L129
M991 S0 P128 ;notify layer change
; OBJECT_ID: 15
G1 X87.955 Y80.571 F42000
G1 Z20.68
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X87.936 Y80.184 I.204 J-.204 E.01023
G1 X88 Y80.177 E.00155
G1 X88.07 Y79.763 E.01013
G3 X88.778 Y81.059 I.04 J.82 E.04431
G3 X87.503 Y80.568 I-.5 J-.602 E.04003
G3 X88.013 Y79.752 I.488 J-.262 E.02812
; WIPE_START
G1 X88.351 Y79.815 E-.13048
G1 X88.828 Y80.136 E-.21869
G1 X88.849 Y80.214 E-.03083
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-1.205 J.17 P1  F42000
G1 X89.097 Y81.974 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X89.455 Y81.585 I-.158 J-.505 E.01334
G3 X89.823 Y81.459 I.351 J.425 E.00958
G1 X89.872 Y81.042 E.01013
G3 X90.463 Y81.596 I-.128 J.729 E.02068
G3 X90.893 Y81.891 I-.229 J.796 E.01279
G3 X90.57 Y83.134 I-.726 J.476 E.03489
G3 X90.044 Y82.995 I-.101 J-.679 E.0135
G1 X89.504 Y82.516 E.0174
G1 X89.247 Y82.498 E.00622
G2 X88.453 Y83.244 I.64 J1.476 E.02679
G3 X87.697 Y83.62 I-.783 J-.625 E.02104
G3 X87.353 Y82.741 I.45 J-.683 E.02425
G3 X88.528 Y81.833 I.865 J-.096 E.04293
G1 X89.004 Y81.538 E.01349
G3 X89.814 Y81.035 I.748 J.302 E.02461
; WIPE_START
G1 X90.144 Y81.126 E-.13011
G1 X90.354 Y81.368 E-.12165
G1 X90.463 Y81.596 E-.09602
G1 X90.532 Y81.644 E-.03222
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I.63 J1.041 P1  F42000
G1 X91.682 Y80.949 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.68 Y80.235 I.577 J-.358 E.01811
G1 X91.741 Y79.82 E.01014
G3 X92.424 Y80.296 I-.258 J1.098 E.02056
G3 X93.042 Y80.57 I.026 J.775 E.01686
G1 X93.045 Y80.577 E.00021
G3 X92.966 Y81.253 I-.666 J.264 E.0171
G3 X93.508 Y82.509 I-1.577 J1.427 E.03358
G3 X92.727 Y82.87 I-.554 J-.173 E.02338
G3 X91.985 Y82.165 I.082 J-.83 E.02659
G2 X91.242 Y81.078 I-4.034 J1.961 E.03186
G3 X91.516 Y79.837 I.962 J-.438 E.03288
G1 X91.684 Y79.809 E.00412
; WIPE_START
G1 X92.106 Y79.98 E-.17307
G1 X92.424 Y80.296 E-.17026
G1 X92.52 Y80.291 E-.03667
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-1.186 J-.272 P1  F42000
G1 X91.519 Y84.662 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F600
M204 S6000
G3 X91.659 Y84.382 I.127 J-.112 E.00965
G1 X91.754 Y83.973 E.01014
G3 X91.48 Y83.977 I-.128 J.578 E.08308
G1 X91.699 Y83.957 E.0053
; WIPE_START
G1 F9000
G1 X92.085 Y84.15 E-.16427
G1 X92.201 Y84.337 E-.0835
G1 X92.24 Y84.553 E-.08341
G1 X92.216 Y84.679 E-.04882
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-1.132 J.447 P1  F42000
G1 X92.791 Y86.136 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.493 Y85.712 I.81 J.549 E.02041
G1 X93.618 Y85.309 E.01017
G3 X93.674 Y86.778 I-.19 J.743 E.04742
G3 X93.096 Y87.191 I-1.258 J-1.15 E.01726
G3 X93.048 Y87.705 I-.352 J.226 E.01341
G3 X92.451 Y88.596 I-1.156 J-.13 E.02687
G3 X91.481 Y87.386 I.184 J-1.141 E.04098
G3 X92.049 Y86.964 I.749 J.415 E.0176
G2 X92.32 Y86.156 I-.836 J-.729 E.02109
G3 X93.563 Y85.292 I1.187 J.381 E.03923
; WIPE_START
G1 X94.005 Y85.539 E-.19245
G1 X94.201 Y85.957 E-.1755
G1 X94.194 Y85.988 E-.01206
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I1.205 J.172 P1  F42000
G1 X94.413 Y84.459 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.779 Y84.292 I.747 J1.151 E.00975
G1 X94.791 Y83.872 E.01013
G3 X94.3 Y85.077 I-.042 J.685 E.0628
G3 X94.285 Y84.026 I.232 J-.529 E.03189
G3 X94.733 Y83.871 I.673 J1.221 E.01148
; WIPE_START
G1 X95.078 Y83.92 E-.13218
G1 X95.262 Y84.073 E-.09114
G1 X95.391 Y84.299 E-.09873
G1 X95.417 Y84.449 E-.05796
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-.029 J-1.217 P1  F42000
G1 X89.101 Y84.598 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F600
M204 S6000
G3 X89.241 Y84.318 I.126 J-.112 E.00964
G1 X89.336 Y83.908 E.01014
G1 X89.474 Y83.947 E.00345
G3 X89.28 Y83.892 I-.256 J.533 E.08476
; WIPE_START
G1 F9000
G1 X89.474 Y83.947 E-.0764
G1 X89.666 Y84.085 E-.08979
G1 X89.782 Y84.271 E-.08331
G1 X89.822 Y84.487 E-.08331
G1 X89.799 Y84.609 E-.04719
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-1.207 J-.155 P1  F42000
G1 X89.515 Y86.821 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.217 Y86.378 I-.999 J-2.358 E.0201
G1 X90.224 Y85.957 E.01014
G3 X90.83 Y86.823 I-.146 J.747 E.02816
G3 X90.132 Y87.611 I-.756 J.034 E.02808
G1 X89.816 Y88.103 E.01409
G3 X89.383 Y88.863 I-.698 J.106 E.02274
G1 X88.81 Y89.044 E.01451
G3 X88.297 Y88.469 I-.072 J-.452 E.02209
G2 X88.232 Y87.309 I-2.24 J-.456 E.02834
G3 X88.573 Y86.494 I.796 J-.146 E.02253
G3 X89.196 Y86.5 I-.317 J65.752 E.01503
G2 X89.998 Y86.005 I-.929 J-2.407 E.02286
G1 X90.166 Y85.954 E.00423
; WIPE_START
G1 X90.501 Y86.046 E-.13202
G1 X90.655 Y86.215 E-.08706
G1 X90.778 Y86.488 E-.11346
G1 X90.797 Y86.611 E-.04746
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-1.186 J-.272 P1  F42000
G1 X89.945 Y90.332 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.507 Y89.828 I1.009 J.559 E.01856
G1 X90.666 Y89.429 E.01035
G3 X91.142 Y90.365 I-.907 J1.05 E.02596
G3 X91.818 Y91.558 I.063 J.752 E.04148
G3 X91.013 Y92.608 I-1.173 J-.066 E.03387
G3 X90.418 Y91.881 I.237 J-.801 E.02406
G3 X90.367 Y91.332 I2.336 J-.497 E.01332
G1 X89.963 Y90.909 E.0141
G3 X89.583 Y90.116 I.016 J-.495 E.02611
G3 X90.613 Y89.408 I1.145 J.563 E.03148
; WIPE_START
G1 X90.873 Y89.6 E-.12308
G1 X91.075 Y90.04 E-.18396
G1 X91.114 Y90.228 E-.07296
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I.079 J1.214 P1  F42000
G1 X93.562 Y90.069 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.041 Y89.734 I.402 J.065 E.01573
G1 X94.187 Y89.338 E.01017
G3 X93.861 Y91.074 I-.382 J.827 E.05813
G3 X94.134 Y89.313 I.145 J-.879 E.0671
; WIPE_START
G1 X94.461 Y89.53 E-.14893
G1 X94.651 Y89.829 E-.13457
G1 X94.696 Y90.079 E-.0965
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-1.104 J-.512 P1  F42000
G1 X93.499 Y92.661 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.787 Y92.26 I.344 J-.058 E.01323
G1 X93.817 Y91.84 E.01014
G1 X93.892 Y91.849 E.00182
G3 X94.378 Y93.08 I-.114 J.756 E.03855
G3 X93.618 Y93.538 I-.548 J-.05 E.02489
G3 X93.083 Y92.466 I.854 J-1.096 E.02987
G3 X93.76 Y91.833 I.738 J.111 E.02411
; WIPE_START
G1 X93.892 Y91.849 E-.05064
G1 X94.254 Y91.984 E-.14696
G1 X94.387 Y92.109 E-.06935
G1 X94.518 Y92.377 E-.11304
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-.806 J-.912 P1  F42000
G1 X91.404 Y95.128 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.893 Y94.726 I1.308 J1.089 E.01536
G1 X92.032 Y94.315 E.01045
G3 X92.381 Y94.884 I-.335 J.598 E.01683
G2 X93.049 Y95.548 I2.654 J-2.003 E.02277
G3 X92.336 Y96.725 I-.963 J.221 E.03669
G3 X91.686 Y96.542 I-.214 J-.487 E.01764
G2 X90.955 Y95.598 I-1.33 J.275 E.02983
G3 X91.315 Y94.608 I.744 J-.29 E.02775
G3 X91.978 Y94.294 I.647 J.51 E.01832
; WIPE_START
G1 X92.248 Y94.486 E-.12595
G1 X92.381 Y94.884 E-.1596
G1 X92.533 Y95.081 E-.09445
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I.464 J-1.125 P1  F42000
G1 X88.507 Y93.421 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X88.578 Y93.396 E.00181
G2 X88.862 Y92.572 I-.514 J-.638 E.02217
G3 X89.337 Y92.926 I-.206 J.773 E.01465
G3 X89.586 Y94.014 I-.956 J.791 E.0279
G3 X88.421 Y94.397 I-1.053 J-1.239 E.03032
G3 X87.623 Y93.777 I.209 J-1.093 E.02528
G3 X88.311 Y93.046 I.803 J.066 E.02614
G3 X88.804 Y92.569 I.782 J.315 E.01704
; WIPE_START
G1 X89.147 Y92.684 E-.13759
G1 X89.337 Y92.926 E-.11684
G1 X89.464 Y93.231 E-.12557
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-1.121 J-.473 P1  F42000
G1 X87.991 Y96.722 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.24 Y96.281 I.667 J.085 E.01253
G2 X88.559 Y95.459 I-.627 J-.716 E.02211
G3 X89.239 Y96.862 I-.018 J.874 E.04638
G2 X88.775 Y97.111 I.181 J.893 E.01288
G3 X87.7 Y97.267 I-.645 J-.665 E.02798
G3 X87.94 Y95.975 I.891 J-.503 E.03441
G3 X88.347 Y95.482 I.813 J.256 E.0158
G1 X88.502 Y95.45 E.00383
; WIPE_START
G1 X89.03 Y95.618 E-.21059
G1 X89.212 Y95.772 E-.09061
G1 X89.32 Y95.949 E-.07879
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-1.19 J.257 P1  F42000
G1 X89.929 Y98.767 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.711 Y98.58 I3.457 J12.72 E.01939
G1 X90.779 Y98.165 E.01013
G3 X91.419 Y98.813 I-.2 J.838 E.02314
G3 X91.344 Y99.623 I-.538 J.359 E.02121
G3 X90.711 Y99.646 I-.35 J-.925 E.01554
G1 X90.164 Y99.792 E.01365
G3 X89.57 Y99.935 I-.404 J-.37 E.01564
G3 X88.875 Y98.804 I.642 J-1.174 E.0335
G3 X89.323 Y98.485 I.562 J.314 E.0137
G3 X90.722 Y98.154 I2.152 J5.974 E.03474
; WIPE_START
G1 X91.129 Y98.306 E-.16511
G1 X91.303 Y98.498 E-.09856
G1 X91.409 Y98.785 E-.11633
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I.182 J1.203 P1  F42000
G1 X93.179 Y98.518 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.461 Y98.122 I.356 J-.045 E.01288
G1 X93.508 Y97.704 E.01014
G1 X93.632 Y97.723 E.00303
G3 X94.164 Y98.779 I-.167 J.746 E.03259
G3 X93.582 Y99.422 I-.54 J.096 E.02413
G3 X92.756 Y98.566 I.461 J-1.271 E.0297
G3 X93.451 Y97.695 I.749 J-.114 E.03016
; WIPE_START
G1 X93.632 Y97.723 E-.06973
G1 X93.936 Y97.86 E-.12689
G1 X94.116 Y98.056 E-.10099
G1 X94.203 Y98.255 E-.08239
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-1.058 J-.602 P1  F42000
G1 X92.091 Y101.968 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.124 Y101.966 E.00081
G2 X92.779 Y101.609 I-.764 J-2.183 E.01807
G1 X92.8 Y101.187 E.01021
G3 X93.699 Y102.312 I-.385 J1.229 E.03686
G3 X93.12 Y102.772 I-.707 J-.296 E.01861
G3 X92.479 Y102.809 I-.373 J-.883 E.01577
G3 X91.204 Y102.628 I-.57 J-.564 E.03607
G3 X91.047 Y101.752 I1.018 J-.634 E.02199
G1 X91.127 Y101.64 E.00331
G3 X91.82 Y101.559 I.426 J.639 E.01747
G2 X92.609 Y101.214 I-.244 J-1.631 E.021
G1 X92.743 Y101.179 E.00334
; WIPE_START
G1 X92.928 Y101.206 E-.07132
G1 X93.357 Y101.529 E-.20388
G1 X93.502 Y101.714 E-.08924
G1 X93.519 Y101.751 E-.01557
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-1.211 J-.123 P1  F42000
G1 X93.224 Y104.646 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.562 Y104.324 I.262 J-.063 E.01359
G1 X93.676 Y103.92 E.01013
G3 X94.144 Y104.646 I-.128 J.597 E.02315
G3 X93.919 Y105.963 I-1.222 J.47 E.03381
G3 X93.076 Y105.635 I-.23 J-.657 E.02374
G3 X92.816 Y104.752 I.769 J-.706 E.02299
G3 X93.62 Y103.904 I.678 J-.162 E.0334
; WIPE_START
G1 X93.977 Y104.071 E-.14983
G1 X94.093 Y104.228 E-.07425
G1 X94.142 Y104.635 E-.15592
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-.146 J-1.208 P1  F42000
G1 X88.973 Y105.261 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.753 Y104.585 I.36 J-.491 E.01831
G3 X88.859 Y104.583 I.058 J.229 E.00259
G1 X88.937 Y104.17 E.01013
G3 X89.855 Y104.65 I.15 J.83 E.02691
G1 X90.497 Y104.522 E.01579
G3 X91.45 Y104.447 I.531 J.651 E.02454
G3 X92.034 Y105.024 I-.614 J1.204 E.02012
G3 X91.716 Y105.593 I-.555 J.063 E.01677
G1 X91.2 Y106.171 E.01869
G3 X90.299 Y105.825 I-.336 J-.471 E.0275
G2 X89.942 Y105.579 I-.316 J.076 E.01147
G2 X89.057 Y105.795 I.458 J3.794 E.02201
G3 X88.419 Y104.282 I.34 J-1.035 E.04485
G3 X88.88 Y104.16 I.397 J.564 E.01174
; WIPE_START
G1 X89.225 Y104.16 E-.13104
G1 X89.49 Y104.242 E-.10559
G1 X89.702 Y104.403 E-.10101
G1 X89.76 Y104.498 E-.04236
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I1.113 J-.492 P1  F42000
G1 X88.865 Y102.47 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.986 Y101.572 I2.165 J-.166 E.02202
G3 X89.716 Y101.921 I-.596 J2.185 E.01963
G3 X88.448 Y102.612 I-.533 J.531 E.06733
G3 X88.613 Y101.632 I1.372 J-.274 E.02451
G1 X88.73 Y101.567 E.00323
G3 X88.931 Y101.554 I.119 J.29 E.00494
; WIPE_START
G1 X89.482 Y101.766 E-.22439
G1 X89.716 Y101.921 E-.10668
G1 X89.787 Y102.028 E-.04893
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I1.207 J-.157 P1  F42000
G1 X86.729 Y78.461 Z21.08
G1 Z20.68
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G3 X87.445 Y78.233 I.726 J1.046 E.01841
G1 X93.85 Y78.233 E.15445
G1 X93.85 Y78.465 E.00558
G1 X86.789 Y78.461 E.17029
; WIPE_START
G1 F12000
M204 S6000
G1 X86.892 Y78.363 E-.05418
G1 X87.13 Y78.274 E-.09642
G1 X87.445 Y78.233 E-.12088
G1 X87.731 Y78.233 E-.10852
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I-1.191 J.248 P1  F42000
G1 X93.85 Y107.585 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F600
M204 S5000
G1 X93.85 Y107.816 E.00558
G1 X87.444 Y107.816 E.15448
G3 X86.725 Y107.585 I.022 J-1.304 E.01849
G1 X93.79 Y107.585 E.17038
; WIPE_START
G1 F12000
M204 S6000
G1 X93.85 Y107.816 E-.0908
G1 X93.089 Y107.816 E-.2892
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I1.187 J-.267 P1  F42000
G1 X86.53 Y78.637 Z21.08
G1 Z20.68
G1 E.4 F1800
G1 F600
M204 S5000
G1 X86.53 Y107.411 E.69388
G3 X86.152 Y106.436 I1.159 J-1.011 E.02573
G1 X86.15 Y79.701 E.64473
M73 P90 R3
G3 X86.492 Y78.683 I1.567 J-.04 E.02641
; WIPE_START
G1 F12000
M204 S6000
G1 X86.493 Y79.683 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.08 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 20.84
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 130/141
; update layer progress
M73 L130
M991 S0 P129 ;notify layer change
; OBJECT_ID: 15
G1 X88.016 Y80.54 F42000
G1 Z20.84
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X87.921 Y79.762 I.675 J-.478 E.01969
G3 X88.853 Y80.483 I-.031 J1.004 E.03039
G3 X87.725 Y80.853 I-.609 J.049 E.03931
G3 X87.615 Y79.836 I.455 J-.563 E.02739
G3 X87.863 Y79.755 I.251 J.351 E.00638
; WIPE_START
G1 X88.157 Y79.789 E-.11259
G1 X88.5 Y79.959 E-.1453
G1 X88.728 Y80.186 E-.12211
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-1.167 J.346 P1  F42000
G1 X89.283 Y82.059 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X89.317 Y82.046 E.00087
G3 X89.913 Y81.447 I.616 J.017 E.02246
G1 X90.046 Y81.044 E.01024
G3 X90.354 Y81.496 I-.361 J.577 E.01358
G3 X90.682 Y83.126 I-.445 J.937 E.04649
G3 X89.956 Y82.858 I-.199 J-.58 E.02021
G1 X89.771 Y82.567 E.0083
G2 X88.579 Y83.005 I-.313 J.99 E.03296
G3 X87.687 Y83.717 I-1.334 J-.757 E.0282
G3 X87.374 Y83.288 I.151 J-.439 E.01364
G3 X87.606 Y82.109 I2.104 J-.197 E.02937
G3 X88.459 Y81.939 I.575 J.661 E.02194
G1 X88.99 Y81.725 E.01381
G3 X89.991 Y81.025 I.928 J.262 E.03191
; WIPE_START
G1 X90.258 Y81.188 E-.11866
G1 X90.354 Y81.496 E-.12261
G1 X90.642 Y81.72 E-.13873
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I.648 J1.03 P1  F42000
G1 X91.833 Y80.97 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.651 Y80.201 I.622 J-.554 E.01986
G1 X91.724 Y79.777 E.0104
G3 X92.593 Y80.357 I-6.143 J10.14 E.0252
G3 X93.052 Y81.093 I.114 J.44 E.02777
G1 X93.082 Y81.631 E.01301
G3 X93.459 Y82.737 I-.63 J.832 E.02991
G3 X92.586 Y82.769 I-.456 J-.529 E.02276
G3 X92.095 Y82.258 I.526 J-.997 E.01739
G1 X91.862 Y81.83 E.01174
G3 X91.542 Y81.278 I.558 J-.692 E.01574
G3 X91.26 Y80.816 I.353 J-.532 E.01348
G3 X91.387 Y79.844 I.981 J-.366 E.02459
G3 X91.668 Y79.764 I.227 J.263 E.00728
; WIPE_START
G1 X92.062 Y79.956 E-.16654
G1 X92.51 Y80.294 E-.21346
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-1.193 J-.238 P1  F42000
G1 X91.64 Y84.652 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F600
M204 S6000
G3 X91.532 Y84.521 I.013 J-.12 E.00453
G3 X91.652 Y84.433 I.134 J.056 E.00377
G1 X91.74 Y84.021 E.01016
G3 X91.537 Y84.022 I-.099 J.523 E.07568
G1 X91.679 Y84.009 E.00343
; WIPE_START
G1 F9000
G1 X92.038 Y84.182 E-.1515
G1 X92.145 Y84.355 E-.07713
G1 X92.18 Y84.555 E-.0771
G1 X92.14 Y84.746 E-.07428
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-1.105 J.51 P1  F42000
G1 X92.824 Y86.228 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.449 Y85.711 I.876 J.422 E.02019
G1 X93.504 Y85.294 E.01013
G3 X93.581 Y86.798 I-.046 J.756 E.05332
G1 X93.112 Y86.994 E.01225
G2 X92.912 Y87.985 I13.463 J3.239 E.0244
G3 X92.541 Y88.645 I-1.111 J-.19 E.01861
G3 X91.84 Y88.216 I-.105 J-.616 E.02163
G3 X91.409 Y87.512 I1.706 J-1.529 E.02001
G3 X91.812 Y87.078 I.527 J.086 E.01513
G1 X92.293 Y86.974 E.01186
G3 X92.442 Y85.999 I3.536 J.042 E.02386
G3 X93.446 Y85.287 I1.159 J.571 E.03096
; WIPE_START
G1 X93.846 Y85.399 E-.15763
G1 X94.002 Y85.544 E-.08095
G1 X94.153 Y85.884 E-.14142
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I1.203 J.187 P1  F42000
G1 X94.369 Y84.494 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.756 Y84.38 I.436 J.766 E.00983
G1 X94.776 Y83.96 E.01013
G3 X94.498 Y85.115 I-.019 J.607 E.052
G3 X93.882 Y84.456 I.089 J-.7 E.02359
G3 X94.718 Y83.958 I.842 J.462 E.02462
; WIPE_START
G1 X95.172 Y84.104 E-.18093
G1 X95.334 Y84.313 E-.1007
G1 X95.377 Y84.55 E-.09144
G1 X95.374 Y84.568 E-.00693
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-.004 J-1.217 P1  F42000
G1 X89.206 Y84.59 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F600
M204 S6000
G3 X89.229 Y84.374 I.017 J-.108 E.00801
G1 X89.308 Y83.961 E.01013
G3 X89.146 Y83.96 I-.086 J.524 E.07659
G1 X89.251 Y83.95 E.00255
; WIPE_START
G1 F9000
G1 X89.614 Y84.117 E-.15163
G1 X89.723 Y84.288 E-.07698
G1 X89.762 Y84.487 E-.077
G1 X89.725 Y84.679 E-.0744
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-1.211 J-.116 P1  F42000
G1 X89.517 Y86.849 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.169 Y86.39 I-.058 J-.775 E.02017
G1 X90.235 Y86.342 E.00198
G1 X90.347 Y85.93 E.01029
G3 X90.724 Y87.011 I-.525 J.789 E.02966
G3 X90.094 Y87.488 I-.641 J-.193 E.02037
G1 X89.762 Y87.955 E.01382
G3 X89.24 Y88.858 I-.75 J.169 E.02765
G3 X88.412 Y89.053 I-.626 J-.804 E.02116
G3 X88.396 Y88.136 I.724 J-.471 E.02331
G2 X88.258 Y87.053 I-4.945 J.079 E.02639
G3 X88.837 Y86.44 I.512 J-.097 E.02369
G2 X89.201 Y86.519 I.238 J-.22 E.00957
G1 X89.67 Y86.342 E.01209
G3 X90.292 Y85.91 I.738 J.398 E.01896
; WIPE_START
G1 X90.598 Y86.116 E-.14016
G1 X90.711 Y86.362 E-.10281
G1 X90.758 Y86.677 E-.12081
G1 X90.754 Y86.719 E-.01622
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-1.188 J-.265 P1  F42000
G1 X89.948 Y90.333 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.521 Y89.779 I47.029 J47.984 E.01924
G1 X90.625 Y89.34 E.01088
G3 X91.002 Y90.064 I-.362 J.649 E.02086
G2 X91.434 Y90.522 I2.182 J-1.625 E.01522
G3 X91.885 Y91.314 I.012 J.518 E.02686
G2 X91.466 Y92.358 I11.295 J5.138 E.02713
G3 X90.611 Y92.356 I-.427 J-.18 E.02625
G3 X90.472 Y91.376 I1.822 J-.758 E.02413
G1 X90.079 Y90.928 E.01436
G3 X89.414 Y90.442 I-.093 J-.57 E.02212
G3 X90.124 Y89.556 I2.512 J1.286 E.02754
G3 X90.568 Y89.327 I.712 J.835 E.01218
; WIPE_START
G1 X90.849 Y89.488 E-.12283
G1 X90.951 Y89.707 E-.09197
G1 X91.002 Y90.064 E-.13699
G1 X91.053 Y90.118 E-.02821
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I.123 J1.211 P1  F42000
G1 X93.65 Y89.854 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.067 Y89.653 I.464 J.432 E.0114
G1 X94.204 Y89.256 E.01015
G3 X93.86 Y90.972 I-.43 J.807 E.05638
G3 X93.534 Y89.407 I.187 J-.856 E.04861
G3 X94.151 Y89.233 I.534 J.716 E.01581
; WIPE_START
G1 X94.463 Y89.461 E-.14658
G1 X94.646 Y89.799 E-.14627
G1 X94.688 Y90.025 E-.08714
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-1.113 J-.491 P1  F42000
G1 X93.548 Y92.608 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.843 Y92.303 I.352 J.045 E.01099
G1 X93.985 Y91.901 E.01027
G3 X94.368 Y93.089 I-.268 J.742 E.0347
G3 X93.872 Y93.702 I-.809 J-.147 E.01983
G3 X93.279 Y93.046 I.172 J-.751 E.02271
G3 X93.93 Y91.883 I.613 J-.421 E.03986
; WIPE_START
G1 X94.197 Y92.018 E-.11354
G1 X94.399 Y92.224 E-.10961
G1 X94.493 Y92.461 E-.09695
G1 X94.494 Y92.619 E-.0599
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-.774 J-.939 P1  F42000
G1 X91.439 Y95.137 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X92.007 Y94.226 I-.616 J-1.017 E.02686
G3 X92.392 Y95.012 I-.401 J.684 E.02237
G3 X93.107 Y95.521 I-4.779 J7.481 E.02117
G3 X93.05 Y96.027 I-.468 J.203 E.01286
G3 X91.94 Y96.847 I-1.376 J-.7 E.03452
G3 X91.599 Y96.172 I.397 J-.625 E.01916
G1 X91.221 Y95.788 E.01297
G3 X90.968 Y95.01 I.062 J-.45 E.02455
G3 X91.822 Y94.244 I3.115 J2.613 E.02775
G3 X91.95 Y94.214 I.153 J.361 E.00319
; WIPE_START
G1 X92.255 Y94.42 E-.13976
G1 X92.392 Y95.012 E-.23101
G1 X92.412 Y95.026 E-.00923
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I.434 J-1.137 P1  F42000
G1 X88.36 Y93.48 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X88.952 Y92.495 I-.558 J-1.005 E.02899
G3 X89.42 Y93.181 I-.456 J.814 E.02074
G3 X89.687 Y93.911 I-1.616 J1.006 E.0189
G3 X89.062 Y94.234 I-.482 J-.168 E.0187
G3 X87.572 Y93.769 I-.476 J-1.094 E.04103
G3 X88.089 Y93.158 I.722 J.087 E.02042
G3 X88.772 Y92.486 I6.781 J6.212 E.02312
G1 X88.899 Y92.472 E.00307
; WIPE_START
G1 X89.067 Y92.547 E-.07007
G1 X89.252 Y92.761 E-.10771
G1 X89.42 Y93.181 E-.1715
G1 X89.455 Y93.254 E-.03073
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-1.137 J-.434 P1  F42000
G1 X88.275 Y96.345 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X88.573 Y95.415 I-1.634 J-1.036 E.0238
G3 X89.442 Y96.682 I-.351 J1.172 E.04006
G3 X88.626 Y97.151 I-.899 J-.62 E.02346
G3 X87.682 Y97.319 I-.59 J-.581 E.02468
G3 X87.79 Y96.283 I.716 J-.449 E.02706
G2 X88.103 Y95.672 I-.626 J-.707 E.01695
G3 X88.516 Y95.404 I.4 J.164 E.01264
; WIPE_START
G1 X89.003 Y95.652 E-.20765
G1 X89.188 Y95.823 E-.09582
G1 X89.265 Y96.009 E-.07653
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-1.196 J.227 P1  F42000
G1 X89.803 Y98.844 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.616 Y98.592 I-.299 J-2.405 E.02064
G1 X90.667 Y98.174 E.01016
G3 X91.359 Y98.765 I-.149 J.874 E.02303
G3 X91.409 Y99.672 I-.4 J.477 E.02456
G3 X90.703 Y99.632 I-.296 J-1.047 E.01736
G1 X90.203 Y99.806 E.01276
G3 X89.443 Y99.862 I-.396 J-.192 E.02222
G3 X88.794 Y98.922 I1.462 J-1.704 E.02786
G3 X89.445 Y98.478 I.524 J.069 E.02146
G2 X90.273 Y98.314 I-5.173 J-28.158 E.02036
G3 X90.61 Y98.166 I.341 J.32 E.00911
; WIPE_START
G1 X91.126 Y98.375 E-.21166
G1 X91.273 Y98.542 E-.08433
G1 X91.353 Y98.748 E-.08401
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I.104 J1.213 P1  F42000
G1 X93.253 Y98.586 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X93.252 Y98.584 E.00006
G3 X93.488 Y98.197 I.237 J-.121 E.01308
G1 X93.521 Y97.777 E.01016
G3 X94.145 Y98.706 I-.043 J.703 E.0312
G3 X93.74 Y99.519 I-.664 J.177 E.02394
G3 X92.868 Y98.765 I.464 J-1.416 E.02855
G3 X93.463 Y97.772 I.63 J-.297 E.03291
; WIPE_START
G1 X93.726 Y97.809 E-.10109
G1 X93.922 Y97.922 E-.08594
G1 X94.091 Y98.108 E-.09567
G1 X94.173 Y98.351 E-.09729
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-1.052 J-.612 P1  F42000
G1 X92.067 Y101.973 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.674 Y101.707 E.01597
G2 X92.866 Y101.13 I-.58 J-.513 E.01508
G3 X93.653 Y101.993 I-1.886 J2.511 E.02834
G3 X93.206 Y102.719 I-.386 J.263 E.02591
G2 X92.015 Y103.041 I-.008 J2.329 E.0301
G3 X91.342 Y102.753 I.124 J-1.221 E.01793
G1 X91.002 Y102.083 E.01812
G3 X91.567 Y101.51 I.396 J-.175 E.02493
G1 X91.893 Y101.591 E.00811
G1 X92.397 Y101.37 E.01327
G3 X92.812 Y101.111 I.421 J.212 E.01239
; WIPE_START
G1 X93.054 Y101.239 E-.10415
G1 X93.506 Y101.807 E-.27585
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-1.215 J-.066 P1  F42000
G1 X93.344 Y104.776 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.609 Y104.374 I.275 J-.107 E.01358
G1 X93.69 Y103.962 E.01013
G3 X94.069 Y104.682 I-.081 J.502 E.02275
G3 X93.897 Y106.057 I-1.121 J.559 E.03542
G3 X93.158 Y105.684 I-.138 J-.644 E.0216
G3 X92.861 Y105.003 I1.607 J-1.105 E.01802
G3 X92.982 Y104.309 I7.781 J.999 E.01699
G3 X93.633 Y103.95 I.729 J.553 E.01846
; WIPE_START
G1 X93.95 Y104.076 E-.12954
G1 X94.062 Y104.215 E-.06757
G1 X94.118 Y104.391 E-.07016
G1 X94.069 Y104.682 E-.11227
G1 X94.069 Y104.683 E-.00045
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-.194 J-1.201 P1  F42000
G1 X90.692 Y105.229 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.929 Y104.299 I-2.168 J-1.048 E.02332
G3 X92.125 Y105.057 I-.658 J2.361 E.03465
G3 X91.855 Y105.542 I-.348 J.124 E.01515
G3 X91.417 Y105.799 I-.599 J-.518 E.01246
G3 X90.763 Y106.36 I-.619 J-.061 E.02295
G3 X90.272 Y105.188 I.601 J-.941 E.03259
G3 X90.595 Y104.386 I3.001 J.744 E.02093
G3 X90.872 Y104.288 I.256 J.285 E.00726
; WIPE_START
G1 X91.377 Y104.469 E-.2041
G1 X91.777 Y104.704 E-.1759
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-.116 J-1.211 P1  F42000
G1 X88.838 Y104.984 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.68 Y104.565 I57.922 J-22.024 E.01082
G1 X88.752 Y104.149 E.01017
G3 X89.617 Y104.439 I.024 J1.366 E.02243
G3 X89.573 Y105.401 I-.556 J.457 E.02546
G3 X88.967 Y105.847 I-.558 J-.124 E.01979
G3 X88.277 Y104.711 I1.445 J-1.655 E.03258
G3 X88.695 Y104.14 I.36 J-.174 E.02089
; WIPE_START
G1 X89.443 Y104.3 E-.29059
G1 X89.617 Y104.439 E-.08468
G1 X89.624 Y104.449 E-.00473
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I1.15 J-.399 P1  F42000
G1 X88.903 Y102.371 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X88.77 Y101.491 I-12.557 J1.446 E.02146
G3 X89.062 Y101.554 I.034 J.549 E.00729
G1 X89.622 Y101.913 E.01604
G3 X88.515 Y102.612 I-.442 J.526 E.06232
G3 X88.486 Y101.67 I1.491 J-.517 E.0231
G3 X88.712 Y101.49 I.282 J.122 E.00726
; WIPE_START
G1 X89.062 Y101.554 E-.13512
G1 X89.605 Y101.902 E-.24489
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I1.208 J-.144 P1  F42000
G1 X86.821 Y78.465 Z21.24
G1 Z20.84
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G3 X87.444 Y78.29 I.621 J1.019 E.0158
G1 X93.85 Y78.29 E.15447
G1 X93.85 Y78.465 E.0042
G1 X86.881 Y78.465 E.16806
; WIPE_START
G1 F12000
M204 S6000
G1 X86.95 Y78.396 E-.03694
G1 X87.127 Y78.332 E-.07167
G1 X87.444 Y78.29 E-.12148
G1 X87.839 Y78.29 E-.14991
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I-1.192 J.245 P1  F42000
G1 X93.85 Y107.585 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F600
M204 S5000
G1 X93.85 Y107.759 E.0042
G1 X87.445 Y107.759 E.15445
G3 X86.821 Y107.585 I.05 J-1.387 E.01577
G1 X93.79 Y107.585 E.16805
; WIPE_START
G1 F12000
M204 S6000
G1 X93.85 Y107.759 E-.06996
G1 X93.034 Y107.759 E-.31005
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I1.188 J-.266 P1  F42000
G1 X86.53 Y78.705 Z21.24
G1 Z20.84
G1 E.4 F1800
G1 F600
M204 S5000
G1 X86.53 Y107.344 E.69065
G1 X86.527 Y107.341 E.0001
G3 X86.152 Y106.301 I1.261 J-1.043 E.0272
G1 X86.15 Y79.848 E.63793
G3 X86.493 Y78.751 I1.665 J-.081 E.02828
; WIPE_START
G1 F12000
M204 S6000
M73 P91 R3
G1 X86.494 Y79.751 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.24 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 131/141
; update layer progress
M73 L131
M991 S0 P130 ;notify layer change
; OBJECT_ID: 15
G1 X88.159 Y80.526 F42000
G1 Z21
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X87.885 Y79.759 I.376 J-.567 E.02106
G3 X88.717 Y80.667 I-.14 J.963 E.03213
G3 X87.915 Y80.87 I-.462 J-.138 E.024
G3 X87.457 Y79.965 I.543 J-.842 E.02565
G3 X87.828 Y79.753 I.363 J.205 E.0108
; WIPE_START
G1 X88.277 Y79.902 E-.18007
G1 X88.551 Y80.151 E-.14032
G1 X88.623 Y80.29 E-.05961
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-1.098 J.524 P1  F42000
G1 X89.475 Y82.075 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X89.237 Y82.107 E.00579
G3 X89.913 Y81.46 I1.534 J.925 E.02282
G1 X90.095 Y81.016 E.01156
G3 X90.334 Y81.455 I-.365 J.483 E.01242
G2 X90.86 Y82.331 I11.515 J-6.321 E.02465
G3 X90.516 Y83.218 I-.578 J.286 E.02578
G3 X89.956 Y82.697 I.111 J-.681 E.01955
G1 X89.432 Y82.504 E.01347
G2 X88.324 Y83.277 I.024 J1.216 E.03455
G3 X87.603 Y83.804 I-.829 J-.379 E.0225
G3 X87.404 Y82.938 I.478 J-.565 E.02297
G3 X87.783 Y82.099 I2.442 J.597 E.02234
G3 X88.366 Y82.056 I.339 J.621 E.01453
G1 X88.865 Y81.893 E.01267
G3 X89.471 Y81.223 I3.066 J2.161 E.02185
G3 X90.039 Y81.002 I.933 J1.557 E.01477
; WIPE_START
G1 X90.243 Y81.117 E-.08902
G1 X90.334 Y81.455 E-.13308
G1 X90.518 Y81.828 E-.1579
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I.606 J1.055 P1  F42000
G1 X91.979 Y80.989 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.689 Y79.74 I1.015 J-.894 E.03221
G3 X92.183 Y80.152 I-.32 J.886 E.01584
G2 X93.078 Y80.398 I1.089 J-2.214 E.02251
G3 X93.131 Y80.947 I-.279 J.304 E.01456
G1 X92.887 Y81.269 E.00974
G1 X93.112 Y81.807 E.01405
G3 X93.482 Y82.787 I-.497 J.748 E.02697
G3 X92.355 Y82.438 I-.39 J-.736 E.03162
G2 X91.694 Y81.699 I-5.894 J4.61 E.02393
G3 X91.634 Y81.228 I.858 J-.349 E.01156
G3 X91.291 Y79.896 I1.03 J-.975 E.03464
G3 X91.635 Y79.718 I.288 J.137 E.01002
; WIPE_START
G1 X91.885 Y79.838 E-.10521
G1 X92.183 Y80.152 E-.1647
G1 X92.449 Y80.269 E-.1101
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-1.196 J-.226 P1  F42000
G1 X91.639 Y84.541 Z21.4
G1 Z21
G1 E.4 F1800
G1 F600
M204 S6000
G1 X91.687 Y84.121 E.01019
G3 X91.51 Y84.139 I-.047 J.425 E.06052
G1 X91.629 Y84.115 E.00292
; WIPE_START
G1 F9000
G1 X91.949 Y84.241 E-.13074
G1 X92.079 Y84.559 E-.13056
G1 X91.951 Y84.844 E-.11871
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-.892 J.828 P1  F42000
G1 X93.03 Y86.006 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.403 Y85.735 I.656 J.509 E.01127
G1 X93.449 Y85.317 E.01013
G3 X94.197 Y86.491 I-.095 J.886 E.03853
G3 X93.49 Y86.705 I-.607 J-.734 E.01829
G1 X93.115 Y86.87 E.00989
G3 X92.562 Y85.857 I.099 J-.711 E.03232
G3 X93.14 Y85.372 I2.494 J2.383 E.01824
G3 X93.391 Y85.311 I.299 J.693 E.00626
; WIPE_START
G1 X93.664 Y85.342 E-.10435
G1 X93.836 Y85.438 E-.0749
G1 X94.086 Y85.694 E-.13596
G1 X94.154 Y85.85 E-.06479
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I1.207 J.157 P1  F42000
G1 X94.324 Y84.54 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X94.321 Y84.538 E.00009
G3 X94.656 Y84.472 I.564 J1.971 E.00824
G1 X94.749 Y84.063 E.01013
G3 X94.518 Y85.034 I-.045 J.503 E.04174
G3 X93.835 Y84.456 I-.051 J-.632 E.02396
G3 X94.693 Y84.05 I.739 J.453 E.0242
; WIPE_START
G1 X95.013 Y84.144 E-.127
G1 X95.172 Y84.332 E-.09322
G1 X95.225 Y84.549 E-.08514
G1 X95.181 Y84.74 E-.07464
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-.809 J-.91 P1  F42000
G1 X91.959 Y87.604 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X91.851 Y87.515 E.00338
G2 X92.275 Y87.503 I.177 J-1.251 E.01028
G1 X92.335 Y87.087 E.01013
G3 X92.829 Y87.941 I-.063 J.606 E.02771
G3 X92.431 Y88.748 I-.699 J.157 E.02344
G3 X91.771 Y87.993 I.538 J-1.137 E.02487
G3 X91.423 Y87.243 I.21 J-.553 E.02208
G3 X92.134 Y87.1 I.503 J.661 E.0181
G1 X92.278 Y87.078 E.00351
; WIPE_START
G1 X92.538 Y87.134 E-.10111
G1 X92.737 Y87.281 E-.09407
G1 X92.856 Y87.492 E-.09214
G1 X92.885 Y87.735 E-.09268
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I.25 J-1.191 P1  F42000
G1 X89.368 Y86.998 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.341 Y85.872 I-.28 J-1.224 E.03838
G3 X90.648 Y86.833 I-.424 J.665 E.02639
G3 X90.146 Y87.351 I-.589 J-.069 E.01869
G1 X89.785 Y87.779 E.0135
G3 X89.263 Y88.76 I-1.013 J.091 E.02835
G3 X88.332 Y89.107 I-.722 J-.513 E.02545
G3 X88.509 Y88.046 I1.024 J-.375 E.02714
G3 X88.529 Y87.636 I.316 J-.19 E.0105
M73 P91 R2
G3 X88.446 Y86.449 I.793 J-.651 E.03061
G3 X89.107 Y86.642 I.217 J.485 E.01804
G2 X90.015 Y85.966 I-.275 J-1.318 E.02817
G3 X90.285 Y85.858 I.274 J.293 E.00718
; WIPE_START
G1 X90.526 Y86 E-.1062
G1 X90.645 Y86.238 E-.10106
G1 X90.686 Y86.522 E-.1091
G1 X90.666 Y86.688 E-.06365
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I1.019 J-.666 P1  F42000
G1 X89.22 Y84.475 Z21.4
G1 Z21
G1 E.4 F1800
G1 F600
M204 S6000
G1 X89.261 Y84.056 E.01015
G3 X89.113 Y84.068 I-.04 J.43 E.06177
G1 X89.204 Y84.05 E.00223
; WIPE_START
G1 F9000
G1 X89.526 Y84.171 E-.13075
G1 X89.661 Y84.487 E-.13029
G1 X89.538 Y84.774 E-.11897
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-1.214 J.085 P1  F42000
G1 X89.93 Y90.385 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X89.932 Y90.384 E.00006
G2 X90.66 Y89.269 I-.727 J-1.271 E.03334
G3 X90.925 Y90.139 I-.378 J.59 E.02387
G1 X91.398 Y90.532 E.01483
G3 X91.888 Y91.19 I.131 J.414 E.02592
G2 X91.505 Y92.196 I2.139 J1.392 E.02616
G3 X90.914 Y92.723 I-.574 J-.049 E.02105
G3 X90.602 Y91.443 I.884 J-.893 E.03342
G1 X90.448 Y91.169 E.00758
G1 X90.009 Y90.877 E.01271
G3 X89.356 Y90.599 I-.124 J-.614 E.01819
G3 X89.898 Y89.905 I.804 J.069 E.02245
G3 X90.603 Y89.262 I1.383 J.807 E.02338
; WIPE_START
G1 X90.825 Y89.372 E-.09406
G1 X90.919 Y89.566 E-.08195
G1 X90.925 Y90.103 E-.20398
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I.118 J1.211 P1  F42000
G1 X93.703 Y89.831 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X94.23 Y89.178 I-.183 J-.686 E.02165
G3 X94.638 Y90.272 I-.654 J.867 E.02973
G3 X93.324 Y89.626 I-.726 J-.182 E.06433
G3 X94.177 Y89.154 I1.102 J.985 E.02397
; WIPE_START
G1 X94.447 Y89.343 E-.1254
G1 X94.556 Y89.588 E-.10194
G1 X94.659 Y89.977 E-.15266
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-1.161 J-.365 P1  F42000
G1 X93.737 Y92.905 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.641 Y92.564 I.462 J-.314 E.00869
G2 X93.937 Y91.868 I-1.181 J-.911 E.01844
G3 X94.355 Y92.847 I-.355 J.731 E.02798
G3 X93.981 Y93.758 I-1.325 J-.012 E.02433
G3 X93.444 Y93.394 I-.078 J-.463 E.01725
G3 X93.236 Y92.449 I2.154 J-.971 E.02351
G3 X93.882 Y91.85 I.795 J.209 E.02243
; WIPE_START
G1 X94.167 Y92.036 E-.12965
G1 X94.333 Y92.299 E-.11815
G1 X94.418 Y92.532 E-.09412
G1 X94.398 Y92.63 E-.03807
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-.801 J-.916 P1  F42000
G1 X91.455 Y95.205 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X91.794 Y94.815 I-.145 J-.469 E.01312
G2 X92.049 Y94.148 I-.733 J-.662 E.01761
G1 X92.051 Y94.148 E.00005
G3 X92.349 Y94.785 I-.347 J.551 E.01793
G1 X92.452 Y95.008 E.00591
G2 X93.171 Y95.501 I5.277 J-6.931 E.02103
G3 X92.829 Y96.202 I-.593 J.145 E.0204
G3 X92.025 Y96.904 I-2.232 J-1.742 E.0259
G3 X91.636 Y96.505 I-.041 J-.349 E.01554
G1 X91.637 Y96.198 E.00739
G1 X91.214 Y95.78 E.01434
G3 X90.741 Y95.359 I.026 J-.506 E.01649
G3 X91.338 Y94.784 I.91 J.347 E.02065
G3 X91.991 Y94.142 I.987 J.351 E.02285
; WIPE_START
G1 X92.051 Y94.148 E-.02278
G1 X92.207 Y94.246 E-.07015
G1 X92.303 Y94.444 E-.08348
G1 X92.349 Y94.785 E-.13108
G1 X92.429 Y94.959 E-.07252
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I.421 J-1.142 P1  F42000
G1 X88.529 Y93.52 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X88.938 Y92.392 I-1.639 J-1.233 E.02934
G3 X89.384 Y93.331 I-.778 J.945 E.02589
G3 X89.679 Y94.09 I-.332 J.565 E.02116
G3 X88.95 Y94.179 I-.443 J-.596 E.01853
G3 X87.93 Y94.121 I-.228 J-4.922 E.02468
G3 X87.872 Y93.285 I.032 J-.422 E.02911
G1 X88.224 Y93.195 E.00876
G3 X88.766 Y92.402 I1.939 J.742 E.02338
G1 X88.882 Y92.377 E.00288
; WIPE_START
G1 X89.165 Y92.594 E-.13567
G1 X89.308 Y92.911 E-.13204
G1 X89.361 Y93.202 E-.11229
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-1.169 J-.339 P1  F42000
G1 X88.433 Y96.396 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X88.486 Y96.346 E.00177
G3 X88.539 Y95.38 I5.9 J-.16 E.02335
G3 X89.492 Y96.71 I-.985 J1.713 E.04068
G3 X88.977 Y96.96 I-.439 J-.249 E.01469
G2 X87.938 Y97.431 I17.844 J40.783 E.02751
G3 X87.567 Y96.872 I-.039 J-.376 E.01987
G3 X88.069 Y96.163 I1.662 J.645 E.02115
G3 X88.336 Y95.365 I.88 J-.149 E.02114
G1 X88.487 Y95.356 E.00364
; WIPE_START
G1 X88.696 Y95.455 E-.08803
G1 X89.167 Y95.955 E-.26111
G1 X89.21 Y96.024 E-.03086
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-1.172 J.326 P1  F42000
G1 X90.036 Y98.991 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.109 Y99.002 E.00179
G1 X90.577 Y98.575 E.01528
G1 X90.694 Y98.17 E.01017
G3 X91.639 Y99.534 I-1.051 J1.737 E.04121
G3 X90.903 Y99.662 I-.428 J-.282 E.02019
G1 X90.705 Y99.559 E.00538
G1 X90.172 Y99.827 E.01439
G3 X89.541 Y99.969 I-.343 J-.052 E.02007
G2 X88.909 Y99.203 I-1.922 J.941 E.02418
G3 X89.145 Y98.51 I.182 J-.324 E.0249
G3 X89.973 Y98.556 I.202 J3.861 E.02003
G3 X90.64 Y98.149 I.725 J.438 E.0196
; WIPE_START
G1 X91.064 Y98.443 E-.19607
G1 X91.356 Y98.83 E-.18393
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I.086 J1.214 P1  F42000
G1 X93.446 Y98.681 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.436 Y98.225 I.151 J-.232 E.01295
G1 X93.511 Y97.8 E.01039
G3 X94.078 Y98.569 I-.217 J.753 E.02477
G3 X93.878 Y99.585 I-1.037 J.324 E.02603
G3 X93.116 Y98.942 I.116 J-.911 E.02541
G3 X93.455 Y97.783 I.456 J-.496 E.03613
; WIPE_START
G1 X93.879 Y98.003 E-.18127
G1 X94.033 Y98.197 E-.09401
G1 X94.098 Y98.398 E-.08033
G1 X94.091 Y98.462 E-.02439
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-1.059 J-.6 P1  F42000
G1 X92.066 Y102.037 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.666 Y101.681 E.01683
G1 X92.764 Y101.54 E.00413
G1 X92.828 Y101.062 E.01162
G3 X93.293 Y101.667 I-.502 J.866 E.01886
G3 X93.816 Y102.405 I-.709 J1.058 E.0223
G3 X93.313 Y102.694 I-.511 J-.305 E.01463
G2 X92.112 Y103.037 I-.286 J1.275 E.03139
G3 X91.588 Y102.847 I-.149 J-.407 E.01459
G3 X90.9 Y101.768 I2.111 J-2.106 E.03111
G3 X91.323 Y101.468 I.306 J-.017 E.01491
G3 X91.882 Y101.657 I-.143 J1.343 E.01436
G1 X92.374 Y101.366 E.01378
G3 X92.774 Y101.042 I.425 J.116 E.01328
; WIPE_START
G1 X93.13 Y101.323 E-.17237
G1 X93.293 Y101.667 E-.14446
G1 X93.412 Y101.783 E-.06317
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-1.217 J.006 P1  F42000
G1 X93.428 Y104.866 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.604 Y104.436 I.424 J-.077 E.01185
G1 X93.658 Y104.429 E.0013
G1 X93.747 Y104.01 E.01031
G3 X93.972 Y104.759 I-.092 J.436 E.02301
G3 X94.006 Y106.048 I-1.411 J.682 E.03205
G3 X93.385 Y105.924 I-.261 J-.31 E.01754
G3 X93.326 Y104.105 I.931 J-.941 E.04838
G3 X93.689 Y104.001 I.335 J.483 E.00929
; WIPE_START
G1 X93.923 Y104.079 E-.09349
G1 X94.084 Y104.355 E-.12158
G1 X93.972 Y104.759 E-.15946
G1 X93.976 Y104.773 E-.00547
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-.269 J-1.187 P1  F42000
G1 X90.793 Y105.493 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.927 Y104.283 I-5.562 J-1.231 E.02942
G3 X91.423 Y104.605 I-2.327 J4.122 E.01426
G3 X92.247 Y105.223 I-.085 J.971 E.02617
G3 X91.785 Y105.567 I-.637 J-.373 E.01425
G1 X91.354 Y105.85 E.01244
G3 X90.735 Y106.411 I-.628 J-.071 E.02201
G3 X90.446 Y105.124 I.791 J-.853 E.03382
G3 X90.593 Y104.33 I1.612 J-.114 E.01968
G3 X90.873 Y104.264 I.218 J.298 E.00712
; WIPE_START
G1 X91.423 Y104.605 E-.24591
G1 X91.746 Y104.747 E-.13409
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-.109 J-1.212 P1  F42000
G1 X88.942 Y105 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X88.677 Y104.56 I-5.763 J3.183 E.01239
G1 X88.678 Y104.13 E.01036
G3 X89.513 Y104.48 I-.598 J2.6 E.02195
G3 X89.566 Y105.281 I-.434 J.43 E.0211
G3 X89.095 Y105.934 I-.82 J-.095 E.02028
G3 X88.61 Y105.277 I.239 J-.684 E.02092
G3 X88.21 Y104.434 I3.429 J-2.145 E.02254
G3 X88.621 Y104.121 I.315 J-.013 E.01461
; WIPE_START
G1 X89.292 Y104.333 E-.26763
G1 X89.513 Y104.48 E-.10093
G1 X89.53 Y104.506 E-.01144
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I1.18 J-.296 P1  F42000
G1 X88.991 Y102.359 Z21.4
G1 Z21
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X88.731 Y101.428 I3.859 J-1.581 E.02336
G3 X89.435 Y101.901 I-.401 J1.357 E.02077
G3 X89.718 Y102.915 I-.391 J.656 E.028
G3 X88.58 Y102.454 I-.444 J-.54 E.03615
G3 X88.532 Y101.474 I.832 J-.532 E.02478
G3 X88.673 Y101.422 I.144 J.174 E.0037
; WIPE_START
G1 X89.197 Y101.651 E-.21715
G1 X89.435 Y101.901 E-.13122
G1 X89.499 Y101.954 E-.03163
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I1.211 J-.115 P1  F42000
G1 X87.257 Y78.374 Z21.4
G1 Z21
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G3 X87.446 Y78.358 I.201 J1.226 E.00458
G1 X93.85 Y78.358 E.15444
G1 X93.85 Y78.465 E.00257
G1 X86.955 Y78.464 E.16628
G3 X87.198 Y78.386 I.503 J1.136 E.00618
; WIPE_START
G1 F12000
M204 S6000
G1 X87.446 Y78.358 E-.09472
G1 X88.196 Y78.358 E-.28528
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I-1.195 J.231 P1  F42000
G1 X93.85 Y107.585 Z21.4
G1 Z21
G1 E.4 F1800
G1 F600
M204 S5000
G1 X93.85 Y107.691 E.00257
G1 X87.446 Y107.691 E.15444
G3 X86.959 Y107.585 I.005 J-1.188 E.01211
G1 X93.79 Y107.585 E.16474
; WIPE_START
G1 F12000
M204 S6000
G1 X93.85 Y107.691 E-.04643
G1 X92.972 Y107.691 E-.33357
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I1.188 J-.265 P1  F42000
G1 X86.53 Y78.79 Z21.4
G1 Z21
G1 E.4 F1800
G1 F600
M204 S5000
G1 X86.53 Y107.26 E.68656
G3 X86.152 Y106.123 I1.406 J-1.099 E.02947
G1 X86.15 Y80.049 E.62879
G3 X86.494 Y78.839 I1.875 J-.12 E.03094
; WIPE_START
G1 F12000
M204 S6000
G1 X86.496 Y79.839 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.4 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 21.16
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 132/141
; update layer progress
M73 L132
M991 S0 P131 ;notify layer change
; OBJECT_ID: 15
G1 X87.713 Y79.761 F42000
G1 Z21.16
G1 E.4 F1800
; FEATURE: Support
G1 F9000
M204 S6000
G3 X88.474 Y80.56 I-.077 J.835 E.02906
G3 X87.946 Y80.707 I-.329 J-.161 E.01493
G3 X87.468 Y79.851 I.243 J-.697 E.02584
G3 X87.655 Y79.76 I.194 J.161 E.00517
; WIPE_START
G1 X88.047 Y79.848 E-.15287
G1 X88.312 Y80.066 E-.13036
G1 X88.436 Y80.289 E-.09678
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-.923 J.793 P1  F42000
G1 X90.051 Y82.169 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X89.47 Y81.97 E.01481
G2 X89.82 Y81.638 I-2.057 J-2.516 E.01164
G1 X90.097 Y80.981 E.01719
G1 X90.142 Y80.989 E.00112
G3 X90.259 Y81.606 I-.259 J.369 E.01675
G2 X90.682 Y82.277 I.964 J-.137 E.0197
G3 X90.625 Y83.233 I-.552 J.447 E.02534
G3 X90.145 Y82.945 I-.062 J-.441 E.0146
G1 X90.032 Y82.637 E.00792
G1 X89.473 Y82.421 E.01446
G3 X88.83 Y82.592 I-1.919 J-5.907 E.01603
G2 X88.142 Y83.445 I.569 J1.163 E.0273
G3 X87.477 Y83.87 I-.646 J-.28 E.0202
G3 X88.062 Y82.171 I1.357 J-.482 E.04678
G2 X89.137 Y81.684 I.152 J-1.096 E.03001
G2 X89.751 Y81.092 I-5.682 J-6.508 E.02059
G3 X90.04 Y80.97 I.335 J.392 E.00767
; WIPE_START
G1 X90.142 Y80.989 E-.03962
G1 X90.298 Y81.186 E-.09536
G1 X90.259 Y81.606 E-.16036
G1 X90.35 Y81.809 E-.08466
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I.213 J1.198 P1  F42000
G1 X92.101 Y81.498 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.115 Y81.256 E.00586
G2 X91.581 Y79.682 I-88.577 J29.191 E.04007
G3 X92.055 Y80.146 I-.388 J.872 E.01634
G1 X92.543 Y80.427 E.01358
G3 X93.303 Y80.51 I.328 J.517 E.01991
G3 X92.753 Y81.258 I-1.263 J-.352 E.0229
G2 X93.357 Y82.182 I1.636 J-.411 E.02713
G3 X93.426 Y82.893 I-.258 J.384 E.01969
G3 X92.43 Y82.118 I-.086 J-.917 E.03353
G3 X91.704 Y81.742 I.194 J-1.262 E.02007
G2 X91.554 Y80.835 I-3.584 J.126 E.02222
G3 X91.414 Y79.675 I.603 J-.662 E.03072
G1 X91.526 Y79.662 E.00274
; WIPE_START
G1 X91.714 Y79.732 E-.07603
G1 X91.958 Y79.966 E-.12853
G1 X92.055 Y80.146 E-.07765
G1 X92.278 Y80.274 E-.09779
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-1.204 J-.175 P1  F42000
G1 X91.703 Y84.23 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F600
M204 S6000
G3 X91.963 Y84.634 I-.075 J.334 E.01284
G3 X91.7 Y84.889 I-.351 J-.099 E.00926
G3 X91.645 Y84.223 I-.047 J-.331 E.02627
; WIPE_START
G1 F9000
G1 X91.858 Y84.302 E-.08613
G1 X91.948 Y84.418 E-.05597
G1 X91.963 Y84.634 E-.08201
G1 X91.847 Y84.822 E-.08392
G1 X91.7 Y84.889 E-.06155
G1 X91.672 Y84.885 E-.01043
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-.705 J-.992 P1  F42000
G1 X90.355 Y85.822 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X90.137 Y87.1 I-.503 J.572 E.0374
G3 X89.837 Y86.351 I.231 J-.527 E.02155
G3 X90.298 Y85.81 I.701 J.13 E.01795
; WIPE_START
G1 X90.484 Y85.917 E-.08143
G1 X90.578 Y86.107 E-.0806
G1 X90.572 Y86.642 E-.20308
G1 X90.556 Y86.677 E-.01489
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I.211 J-1.198 P1  F42000
G1 X88.665 Y86.344 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.233 Y87.236 I-.451 J.914 E.02682
G1 X89.587 Y87.632 E.01281
G3 X89.519 Y88.333 I-.178 J.336 E.02164
G3 X88.498 Y89.217 I-2.168 J-1.472 E.03294
G3 X88.216 Y88.939 I-.09 J-.191 E.01241
G3 X88.666 Y88.034 I1.918 J.39 E.02465
G1 X88.618 Y87.482 E.01336
G3 X88.503 Y86.339 I.579 J-.635 E.03035
G1 X88.611 Y86.324 E.00262
; WIPE_START
G1 X89.007 Y86.598 E-.18269
G1 X89.171 Y86.908 E-.1335
G1 X89.203 Y87.073 E-.06381
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I1.216 J.038 P1  F42000
G1 X89.294 Y84.16 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F600
M204 S6000
G3 X89.56 Y84.488 I-.102 J.355 E.01087
G3 X89.226 Y84.822 I-.361 J-.028 E.01241
G3 X88.899 Y84.412 I.023 J-.354 E.01421
G3 X89.236 Y84.152 I.354 J.11 E.01094
; WIPE_START
G1 F9000
G1 X89.434 Y84.227 E-.08036
G1 X89.56 Y84.488 E-.1103
G1 X89.434 Y84.746 E-.10913
M73 P92 R2
G1 X89.236 Y84.818 E-.08021
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-.395 J1.151 P1  F42000
G1 X93.002 Y86.111 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.332 Y85.808 I4.833 J4.934 E.01082
G1 X93.444 Y85.792 E.00272
G1 X93.538 Y85.379 E.01022
G3 X94.251 Y86.584 I-.181 J.92 E.03811
G3 X93.788 Y86.653 I-.302 J-.438 E.01171
G1 X93.659 Y86.705 E.00334
G3 X92.95 Y86.69 I-.251 J-5.23 E.01712
G3 X92.536 Y85.961 I.413 J-.717 E.02122
G3 X93.188 Y85.403 I3.175 J3.055 E.02074
G1 X93.483 Y85.363 E.00717
; WIPE_START
G1 X93.829 Y85.489 E-.13977
G1 X94.24 Y85.968 E-.24023
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I1.21 J.131 P1  F42000
G1 X94.436 Y84.155 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X94.976 Y84.372 I-.046 J.892 E.01429
G3 X94.789 Y84.878 I-.311 J.172 E.01474
G3 X93.775 Y84.517 I-.335 J-.663 E.02902
G3 X94.379 Y84.151 I.548 J.225 E.01821
; WIPE_START
G1 X94.764 Y84.209 E-.14794
G1 X94.976 Y84.372 E-.10191
G1 X95.036 Y84.548 E-.07059
G1 X94.989 Y84.697 E-.05957
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-.938 J-.776 P1  F42000
G1 X92.311 Y87.934 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.799 Y87.122 I.805 J-1.073 E.02366
G2 X92.448 Y87.234 I1.009 J-3.927 E.01589
G3 X92.732 Y87.85 I-.219 J.474 E.01781
G3 X92.531 Y88.816 I-1.002 J.295 E.02476
G3 X92.056 Y88.439 I.075 J-.582 E.01537
G2 X91.49 Y87.712 I-1.541 J.617 E.02251
G3 X91.451 Y87.168 I.159 J-.284 E.01556
G3 X91.742 Y87.116 I.29 J.786 E.00716
; WIPE_START
G1 X92.448 Y87.234 E-.27203
G1 X92.634 Y87.358 E-.08509
G1 X92.663 Y87.411 E-.02288
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-1.103 J.515 P1  F42000
G1 X93.796 Y89.837 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X94.191 Y89.091 I-.504 J-.744 E.0212
G3 X94.529 Y89.441 I-.092 J.427 E.01246
G3 X94.606 Y90.189 I-1.932 J.577 E.01823
G3 X93.561 Y89.489 I-.678 J-.118 E.06599
G3 X94.134 Y89.081 I.969 J.756 E.01721
; WIPE_START
G1 X94.433 Y89.23 E-.127
G1 X94.529 Y89.441 E-.08827
G1 X94.573 Y89.873 E-.16473
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-.275 J-1.185 P1  F42000
G1 X91.755 Y90.527 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X91.885 Y91.078 I-.099 J.314 E.01644
G2 X91.436 Y91.83 I1.638 J1.489 E.02127
G3 X90.998 Y92.817 I-.878 J.201 E.02793
G3 X90.639 Y92.089 I.441 J-.669 E.02053
G3 X90.933 Y91.296 I1.439 J.082 E.0207
G3 X91.699 Y90.514 I.893 J.109 E.02835
; WIPE_START
G1 X91.909 Y90.607 E-.08721
G1 X91.956 Y90.715 E-.04481
G1 X91.885 Y91.078 E-.14055
G1 X91.7 Y91.292 E-.10743
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I.642 J-1.034 P1  F42000
G1 X90.152 Y90.331 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X90.449 Y89.939 E.01186
G1 X90.694 Y89.197 E.01885
G3 X90.919 Y89.689 I-.367 J.466 E.01356
G3 X90.707 Y90.609 I-3.275 J-.271 E.02284
G3 X89.698 Y90.834 I-.922 J-1.757 E.02522
G3 X89.301 Y90.484 I-.065 J-.326 E.01475
G3 X89.856 Y90.027 I1.042 J.698 E.01758
G1 X90.365 Y89.354 E.02033
G3 X90.636 Y89.193 I.406 J.375 E.00772
; WIPE_START
G1 X90.807 Y89.264 E-.07032
G1 X90.888 Y89.429 E-.06999
G1 X90.919 Y89.689 E-.09957
G1 X90.863 Y90.054 E-.14012
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-.779 J.935 P1  F42000
G1 X93.823 Y92.518 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.824 Y92.774 I-.301 J.129 E.00635
G3 X93.823 Y92.518 I.117 J-.128 E.00695
G1 X93.907 Y91.838 E.01653
G3 X94.202 Y92.308 I-.188 J.445 E.01427
G3 X94.061 Y93.753 I-2.494 J.485 E.03549
G3 X93.661 Y93.759 I-.202 J-.121 E.01155
G3 X93.362 Y92.454 I3.249 J-1.431 E.03247
G3 X93.748 Y91.85 I2.532 J1.192 E.01733
G1 X93.851 Y91.826 E.00256
; WIPE_START
G1 X94.089 Y91.957 E-.10359
G1 X94.202 Y92.308 E-.14005
G1 X94.276 Y92.585 E-.10891
G1 X94.272 Y92.657 E-.02745
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-.83 J-.89 P1  F42000
G1 X91.355 Y95.375 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X91.577 Y95.253 E.00611
G2 X92.114 Y94.069 I-3.212 J-2.172 E.03148
G3 X92.257 Y94.972 I-.769 J.585 E.02294
G1 X92.731 Y95.352 E.01465
G3 X93.277 Y95.569 I.095 J.556 E.01489
G3 X92.675 Y96.187 I-.829 J-.205 E.02183
G3 X92.108 Y96.899 I-17.004 J-12.962 E.02195
G3 X91.824 Y96.969 I-.255 J-.423 E.00714
G3 X91.71 Y96.257 I.464 J-.44 E.01847
G2 X90.789 Y95.629 I-1.11 J.639 E.02781
G3 X90.756 Y95.255 I.166 J-.203 E.01011
G3 X91.287 Y94.917 I.813 J.691 E.0154
G3 X92.027 Y94.066 I1.854 J.865 E.02755
; WIPE_START
G1 X92.275 Y94.298 E-.12885
G1 X92.307 Y94.564 E-.10218
G1 X92.26 Y94.954 E-.14897
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I.405 J-1.148 P1  F42000
G1 X88.381 Y93.586 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X88.835 Y93.154 E.01512
G1 X88.92 Y92.29 E.02094
G3 X89.282 Y93.116 I-.728 J.813 E.02244
G3 X89.76 Y93.89 I-11.844 J7.849 E.02193
G3 X89.302 Y94.211 I-.296 J.065 E.01719
G2 X88.08 Y94.084 I-.821 J1.961 E.03006
G3 X87.458 Y93.707 I.029 J-.749 E.0183
G3 X88.08 Y93.293 I.558 J.165 E.01955
G1 X88.467 Y92.925 E.01288
G3 X88.864 Y92.273 I.961 J.139 E.01893
; WIPE_START
G1 X89.081 Y92.435 E-.10284
G1 X89.212 Y92.716 E-.11777
G1 X89.282 Y93.116 E-.15439
G1 X89.289 Y93.127 E-.005
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-1.203 J-.183 P1  F42000
G1 X88.772 Y96.523 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X88.373 Y96.654 E.01014
G1 X88.503 Y96.533 E.00429
G2 X88.456 Y95.32 I-4.609 J-.429 E.02936
G3 X88.939 Y95.887 I-.415 J.843 E.01846
G3 X89.522 Y96.628 I-3.371 J3.25 E.02278
G3 X89.264 Y96.961 I-.271 J.056 E.01154
G2 X88.175 Y97.31 I-.224 J1.177 E.02875
G3 X87.54 Y97.27 I-.303 J-.245 E.01793
G3 X88.089 Y96.344 I1.033 J-.013 E.02731
G3 X88.212 Y95.386 I1.564 J-.287 E.02367
G3 X88.402 Y95.3 I.159 J.1 E.00532
; WIPE_START
G1 X88.767 Y95.558 E-.16979
G1 X88.939 Y95.887 E-.14111
G1 X89.066 Y96.018 E-.0691
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-1.176 J.315 P1  F42000
G1 X89.874 Y99.035 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G2 X90.574 Y98.659 I-1.108 J-2.9 E.01922
G1 X90.615 Y98.125 E.01292
G3 X90.977 Y98.524 I-.268 J.607 E.01337
G2 X91.6 Y99.248 I15.442 J-12.651 E.02303
G3 X91.579 Y99.749 I-.274 J.24 E.01334
G3 X90.688 Y99.48 I-.093 J-1.307 E.02296
G1 X90.182 Y99.804 E.01447
G3 X89.747 Y100.163 I-.363 J.003 E.01558
G3 X89.375 Y99.537 I.677 J-.827 E.01792
G3 X88.68 Y98.86 I.732 J-1.445 E.02376
G3 X89.077 Y98.532 I.332 J-.002 E.0142
G3 X89.667 Y98.655 I-.014 J1.536 E.01461
G2 X90.45 Y98.135 I-.254 J-1.232 E.02324
G1 X90.559 Y98.111 E.0027
; WIPE_START
G1 X90.855 Y98.291 E-.13159
G1 X90.977 Y98.524 E-.09992
G1 X91.232 Y98.82 E-.14848
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I.235 J1.194 P1  F42000
G1 X93.476 Y98.378 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.529 Y98.588 I-.156 J.151 E.00547
G3 X93.476 Y98.378 I.079 J-.132 E.0058
G1 X93.453 Y97.785 E.0143
G3 X93.955 Y98.555 I-.302 J.745 E.02358
G3 X93.892 Y99.685 I-.855 J.519 E.02901
G3 X93.323 Y99.199 I.192 J-.802 E.01873
G2 X93.02 Y98.505 I-34.24 J14.495 E.01826
G3 X93.277 Y97.796 I1.004 J-.037 E.01863
G1 X93.397 Y97.772 E.00295
; WIPE_START
G1 X93.7 Y97.954 E-.1344
G1 X93.916 Y98.283 E-.14948
G1 X93.952 Y98.533 E-.09612
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-1.079 J-.562 P1  F42000
G1 X92.102 Y102.086 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X92.764 Y101.701 E.01848
G1 X92.775 Y100.984 E.01729
G3 X93.14 Y101.443 I-.378 J.674 E.01449
G2 X93.764 Y102.157 I1.773 J-.92 E.0231
G3 X93.583 Y102.659 I-.151 J.229 E.01767
G3 X92.841 Y102.514 I-.089 J-1.508 E.01842
G1 X92.311 Y102.745 E.01395
G3 X91.622 Y102.828 I-.35 J.001 E.02452
G2 X91.011 Y102.059 I-1.89 J.872 E.02392
G3 X90.873 Y101.504 I.384 J-.391 E.01449
G3 X91.849 Y101.748 I.271 J.994 E.02534
G1 X92.405 Y101.424 E.01551
G3 X92.721 Y100.964 I.456 J-.026 E.0145
; WIPE_START
G1 X93.003 Y101.169 E-.1325
G1 X93.14 Y101.443 E-.1163
G1 X93.313 Y101.741 E-.13119
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-1.186 J.274 P1  F42000
G1 X93.853 Y104.075 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X93.957 Y104.628 I-.14 J.313 E.01593
G2 X94.101 Y105.722 I4.985 J-.097 E.02665
G3 X93.812 Y106.233 I-.493 J.059 E.01514
G3 X93.192 Y105.134 I.592 J-1.058 E.03199
G3 X93.409 Y104.172 I1.608 J-.143 E.02417
G3 X93.799 Y104.055 I.331 J.393 E.0101
; WIPE_START
G1 X94.007 Y104.193 E-.09486
G1 X94.052 Y104.318 E-.05065
G1 X93.957 Y104.628 E-.12304
G1 X93.96 Y104.922 E-.11145
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-.102 J-1.213 P1  F42000
G1 X91.354 Y105.14 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G1 X91.009 Y105.154 E.00832
G2 X90.821 Y104.242 I-3.261 J.198 E.02252
G2 X91.593 Y104.736 I8.57 J-12.552 E.0221
G3 X92.347 Y105.245 I-.073 J.921 E.02294
G3 X91.79 Y105.544 I-.63 J-.507 E.01566
G1 X91.301 Y105.563 E.01179
G1 X91.308 Y106.022 E.01108
G2 X90.935 Y106.457 I23.849 J20.775 E.01382
G3 X90.555 Y106.259 I-.08 J-.309 E.01134
G3 X90.598 Y105.263 I1.181 J-.448 E.02469
G3 X90.507 Y104.411 I4.475 J-.909 E.02071
G3 X90.765 Y104.227 I.242 J.067 E.00828
; WIPE_START
G1 X91.593 Y104.736 E-.36927
G1 X91.62 Y104.745 E-.01073
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-.035 J-1.216 P1  F42000
G1 X88.975 Y104.821 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.121 Y104.895 I.003 J.177 E.00411
G3 X89.094 Y104.977 I-.092 J.015 E.00216
G1 X89.093 Y104.952 E.0006
G3 X88.562 Y104.118 I1.723 J-1.684 E.02401
G3 X89.388 Y104.552 I-3.627 J7.907 E.02252
G3 X89.477 Y105.154 I-.337 J.358 E.01584
G3 X89.08 Y106.013 I-.818 J.144 E.02429
G3 X88.702 Y105.468 I.333 J-.635 E.01665
G1 X88.682 Y105.124 E.0083
G3 X88.203 Y104.182 I.576 J-.886 E.0267
G3 X88.506 Y104.102 I.219 J.22 E.00791
; WIPE_START
G1 X88.885 Y104.236 E-.15277
G1 X89.388 Y104.552 E-.22557
G1 X89.391 Y104.555 E-.00166
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I1.207 J-.152 P1  F42000
G1 X89.111 Y102.333 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F9000
M204 S6000
G3 X89.235 Y102.504 I-.134 J.228 E.00524
G3 X89.111 Y102.333 I.006 J-.135 E.00585
G1 X88.729 Y101.382 E.0247
G3 X89.382 Y102.012 I-.491 J1.163 E.02238
G3 X89.714 Y102.946 I-.602 J.74 E.02513
G3 X89.091 Y102.898 I-.282 J-.41 E.01627
G3 X88.714 Y102.47 I.114 J-.481 E.01469
G3 X88.468 Y101.411 I1.021 J-.794 E.02704
G3 X88.675 Y101.362 I.17 J.253 E.00523
; WIPE_START
G1 X89.055 Y101.587 E-.16812
G1 X89.382 Y102.012 E-.20353
G1 X89.396 Y102.029 E-.00835
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I1.213 J-.1 P1  F42000
G1 X87.446 Y78.437 Z21.56
G1 Z21.16
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X93.85 Y78.437 E.15444
G1 X93.85 Y78.465 E.00067
G1 X87.202 Y78.465 E.16032
G3 X87.386 Y78.438 I.232 J.951 E.00449
; WIPE_START
G1 F12000
M204 S6000
G1 X88.386 Y78.438 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I-1.196 J.224 P1  F42000
G1 X93.85 Y107.585 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F600
M204 S5000
G1 X93.85 Y107.612 E.00067
G1 X87.446 Y107.612 E.15444
G3 X87.194 Y107.585 I-.003 J-1.119 E.00612
G1 X93.79 Y107.585 E.15906
; WIPE_START
G1 F12000
M204 S6000
G1 X93.85 Y107.612 E-.02514
G1 X92.916 Y107.612 E-.35486
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I1.188 J-.264 P1  F42000
G1 X86.53 Y78.885 Z21.56
G1 Z21.16
G1 E.4 F1800
G1 F600
M204 S5000
G1 X86.53 Y107.163 E.68192
G3 X86.157 Y106.015 I1.564 J-1.143 E.0296
G1 X86.15 Y80.365 E.61855
G3 X86.414 Y79.051 I2.49 J-.183 E.03273
G3 X86.493 Y78.933 I1.125 J.664 E.00343
; WIPE_START
G1 F12000
M204 S6000
G1 X86.494 Y79.933 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.56 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 21.32
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 133/141
; update layer progress
M73 L133
M991 S0 P132 ;notify layer change
; OBJECT_ID: 15
G1 X87.319 Y80.258 F42000
G1 Z21.32
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X88.39 Y80.258 E.02582
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-1.217 J-.001 P1  F42000
G1 X88.388 Y82.915 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X87.619 Y82.915 E.01854
G2 X87.37 Y83.8 I2.163 J1.087 E.02232
G1 X88.056 Y83.8 E.01655
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-.905 J.813 P1  F42000
G1 X88.852 Y84.686 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F600
M204 S6000
G1 X89.604 Y84.686 E.01815
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I0 J1.217 P1  F42000
G1 X91.238 Y84.686 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F600
M204 S6000
G1 X92.042 Y84.686 E.0194
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I1.038 J-.635 P1  F42000
G1 X90.959 Y82.915 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X90.03 Y82.915 E.0224
M204 S10000
G1 X90.067 Y82.029 F42000
G1 F4800
M204 S6000
G1 X88.86 Y82.029 E.02911
G3 X89.576 Y81.564 I1.533 J1.576 E.02074
G3 X89.77 Y81.143 I.728 J.081 E.01135
G1 X90.479 Y81.143 E.01709
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I.529 J1.096 P1  F42000
G1 X92.312 Y80.258 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X91.352 Y80.258 E.02316
G3 X91.884 Y81.143 I-3.886 J2.937 E.02496
G1 X93.073 Y81.143 E.02867
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-1.211 J-.119 P1  F42000
G1 X92.899 Y82.915 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X93.764 Y82.915 E.02086
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-1.028 J.651 P1  F42000
G1 X94.885 Y84.686 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X93.554 Y84.686 E.03209
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-1.035 J.64 P1  F42000
G1 X94.102 Y85.572 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X93.053 Y85.572 E.02531
G3 X92.566 Y85.912 I-1.786 J-2.038 E.01435
G2 X92.853 Y86.378 I.331 J.117 E.01514
G1 X92.944 Y86.457 E.00291
G1 X94.561 Y86.457 E.03898
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-1.008 J-.682 P1  F42000
G1 X87.365 Y97.085 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X88.251 Y97.085 E.02138
G1 X88.299 Y97.008 E.00219
G1 X88.819 Y96.78 E.01369
G1 X89.181 Y96.951 E.00966
G2 X89.612 Y96.855 I.15 J-.34 E.01143
G2 X89.15 Y96.2 I-1.222 J.373 E.01967
G1 X88.214 Y96.2 E.02257
G1 X88.256 Y96.05 E.00375
G3 X88.179 Y95.314 I1.292 J-.507 E.01807
G1 X88.763 Y95.314 E.01408
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I1.19 J.254 P1  F42000
G1 X89.33 Y92.657 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X88.571 Y92.657 E.01831
G3 X88.155 Y93.416 I-.857 J.024 E.02188
G2 X87.462 Y93.543 I-.085 J1.497 E.01715
G1 X89.714 Y93.543 E.05431
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I.557 J1.082 P1  F42000
G1 X91.434 Y92.657 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X90.772 Y92.657 E.01597
G3 X90.885 Y91.771 I1.408 J-.271 E.02189
G1 X91.41 Y91.771 E.01268
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I.947 J.764 P1  F42000
G1 X92.124 Y90.886 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X91.051 Y90.886 E.02588
M204 S10000
G1 X90.95 Y90 F42000
G1 F4800
M204 S6000
G1 X89.98 Y90 E.02341
G1 X90.212 Y89.762 E.00802
G3 X90.626 Y89.114 I1.228 J.329 E.01884
G1 X91.003 Y89.114 E.00909
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I.724 J-.978 P1  F42000
G1 X89.806 Y88.229 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X88.712 Y88.229 E.02637
G2 X88.159 Y89.114 I.963 J1.217 E.02568
G1 X88.946 Y89.114 E.01899
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I1.17 J-.335 P1  F42000
G1 X88.185 Y86.457 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X89.047 Y86.457 E.02078
M204 S10000
G1 X89.772 Y86.457 F42000
G1 F4800
M204 S6000
G1 X90.686 Y86.457 E.02203
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-.565 J1.078 P1  F42000
G1 X92.374 Y87.343 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X91.217 Y87.343 E.02789
G2 X91.849 Y87.838 I.843 J-.425 E.01998
G1 X92.043 Y88.229 E.01053
G1 X92.87 Y88.229 E.01994
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-.547 J1.087 P1  F42000
G1 X94.629 Y89.114 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X93.919 Y89.114 E.0171
G2 X93.301 Y90 I1.625 J1.793 E.02627
G1 X94.699 Y90 E.0337
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-1.169 J-.338 P1  F42000
G1 X94.187 Y91.771 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G2 X93.761 Y91.788 I-.192 J.523 E.01054
G2 X93.576 Y92.416 I.594 J.516 E.01628
G1 X93.568 Y92.657 E.00581
G1 X94.091 Y92.657 E.01262
G3 X94.136 Y93.543 I-5.392 J.716 E.02141
G1 X93.386 Y93.543 E.01808
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-.84 J-.88 P1  F42000
G1 X92.458 Y94.428 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X91.673 Y94.428 E.01895
G1 X91.573 Y94.703 E.00704
G3 X90.682 Y95.297 I-2.93 J-3.428 E.0259
G1 X92.079 Y95.314 E.03369
M204 S10000
G1 X91.624 Y96.2 F42000
G1 F600
M204 S6000
G1 X92.85 Y96.2 E.02958
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-1.064 J.591 P1  F42000
G1 X93.835 Y97.971 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X93.135 Y97.971 E.01688
G2 X93.335 Y98.857 I9.706 J-1.732 E.02191
G1 X93.948 Y98.857 E.01478
G3 X93.984 Y99.742 I-.849 J.478 E.02219
G1 X93.509 Y99.742 E.01144
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I0 J-1.217 P1  F42000
G1 X91.956 Y99.742 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X91.302 Y99.742 E.01576
G3 X90.659 Y99.197 I.541 J-1.289 E.02065
G2 X90.458 Y98.857 I-.452 J.038 E.00987
G1 X91.383 Y98.857 E.02231
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-.771 J-.942 P1  F42000
G1 X90.3 Y99.742 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X89.509 Y99.742 E.01907
G2 X89.225 Y99.261 I-1.058 J.3 E.01364
G3 X88.62 Y98.857 I.513 J-1.422 E.01771
G1 X89.87 Y98.857 E.03013
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-1.188 J.262 P1  F42000
G1 X91.042 Y104.171 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G2 X90.566 Y104.177 I-.227 J.839 E.01162
G2 X90.71 Y104.959 I.631 J.288 E.02042
G1 X90.711 Y105.056 E.00235
G1 X92.311 Y105.056 E.03859
G3 X92.447 Y105.256 I-.148 J.247 E.00602
G3 X91.895 Y105.498 I-.496 J-.383 E.01516
G1 X91.598 Y105.479 E.00717
G1 X91.171 Y105.856 E.01372
G1 X91.158 Y105.942 E.00211
G1 X90.378 Y105.942 E.0188
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I0 J-1.217 P1  F42000
G1 X88.694 Y105.942 Z21.72
G1 Z21.32
M73 P93 R2
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X89.272 Y105.942 E.01395
G2 X89.3 Y105.056 I-.82 J-.469 E.02224
G1 X88.657 Y105.056 E.01551
G1 X88.541 Y104.828 E.00618
G3 X88.105 Y104.171 I.456 J-.776 E.01969
G1 X88.954 Y104.171 E.02048
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I1.109 J.501 P1  F42000
G1 X89.754 Y102.399 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X88.868 Y102.399 E.02137
G3 X88.377 Y101.514 I.835 J-1.042 E.02505
G1 X89.164 Y101.514 E.01898
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I0 J1.217 P1  F42000
G1 X91.664 Y101.514 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X90.762 Y101.514 E.02174
G2 X91.526 Y102.399 I1.456 J-.483 E.02893
G1 X92.331 Y102.399 E.01943
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I.845 J.876 P1  F42000
G1 X93.249 Y101.514 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X92.457 Y101.514 E.0191
G2 X92.962 Y102.399 I1.416 J-.221 E.02514
G1 X94.133 Y102.399 E.02824
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-1.216 J.046 P1  F42000
G1 X94.2 Y104.171 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F600
M204 S6000
G1 X93.336 Y104.171 E.02083
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I-1.217 J-.019 P1  F42000
G1 X93.309 Y105.942 Z21.72
G1 Z21.32
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X94.245 Y105.942 E.02259
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.72 I1.17 J-.335 P1  F42000
G1 X86.53 Y79.004 Z21.72
G1 Z21.32
G1 E.4 F1800
; FEATURE: Outer wall
G1 F600
M204 S5000
G1 X86.53 Y107.046 E.67624
G3 X86.16 Y105.728 I1.852 J-1.231 E.03356
G1 X86.152 Y80.776 E.60171
G3 X86.313 Y79.399 I3.934 J-.237 E.03362
G3 X86.496 Y79.053 I1.762 J.709 E.00945
; WIPE_START
G1 F12000
M204 S6000
G1 X86.497 Y80.053 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.72 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 21.48
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 134/141
; update layer progress
M73 L134
M991 S0 P133 ;notify layer change
M106 S124.95
; OBJECT_ID: 15
G1 X88.229 Y79.471 F42000
G1 Z21.48
G1 E.4 F1800
M106 S127.5
; FEATURE: Support interface
G1 F1044
M204 S6000
G1 X88.229 Y106.405 E.64951
G1 X89.114 Y106.405 E.02136
G1 X89.114 Y79.645 E.64532
G1 X90 Y79.645 E.02136
G1 X90 Y106.405 E.64532
G1 X90.886 Y106.405 E.02136
G1 X90.886 Y79.645 E.64532
G1 X91.771 Y79.645 E.02136
G1 X91.771 Y106.578 E.64951
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.88 I1.201 J.198 P1  F42000
G1 X94.428 Y90.462 Z21.88
G1 Z21.48
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X94.428 Y89.018 E.03483
G2 X94.226 Y88.893 I-.205 J.106 E.00601
G2 X93.693 Y89.432 I.46 J.989 E.01868
G1 X93.543 Y89.432 E.00363
G1 X93.543 Y106.405 E.40929
G1 X92.657 Y106.405 E.02136
G1 X92.657 Y79.645 E.64532
G1 X93.543 Y79.645 E.02136
G1 X93.543 Y86.702 E.17018
M106 S124.95
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z21.88 I.892 J-.828 P1  F42000
G1 X86.53 Y79.14 Z21.88
G1 Z21.48
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1044
M204 S5000
G1 X86.53 Y106.909 E.66965
G3 X86.177 Y105.598 I2.055 J-1.256 E.03318
G1 X86.168 Y80.877 E.59616
G3 X86.332 Y79.526 I4.339 J-.158 E.03297
G3 X86.497 Y79.19 I1.645 J.6 E.00902
; WIPE_START
G1 F12000
M204 S6000
G1 X86.498 Y80.19 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z21.88 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 21.64
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 135/141
; update layer progress
M73 L135
M991 S0 P134 ;notify layer change
; OBJECT_ID: 15
G1 X94.041 Y80.258 F42000
G1 Z21.64
G1 E.4 F1800
; FEATURE: Support interface
G1 F4800
M204 S6000
G1 X87.548 Y80.258 E.15659
G1 X87.548 Y81.143 E.02136
G1 X93.867 Y81.143 E.1524
G1 X93.867 Y82.029 E.02136
G1 X87.548 Y82.029 E.1524
G1 X87.548 Y82.915 E.02136
G1 X93.867 Y82.915 E.1524
G1 X93.867 Y83.8 E.02136
G1 X87.548 Y83.8 E.1524
G1 X87.548 Y84.686 E.02136
G1 X93.867 Y84.686 E.1524
G1 X93.867 Y85.572 E.02136
M73 P94 R2
G1 X87.548 Y85.572 E.1524
G1 X87.548 Y86.457 E.02136
G1 X94.583 Y86.457 E.16967
M106 S124.95
M106 S127.5
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z22.04 I-.524 J-1.098 P1  F42000
G1 X92.726 Y87.343 Z22.04
G1 Z21.64
G1 E.4 F1800
G1 F4800
M204 S6000
G1 X87.548 Y87.343 E.12488
G1 X87.548 Y88.229 E.02136
G1 X92.552 Y88.229 E.12069
G1 X92.552 Y89.114 E.02136
G1 X87.548 Y89.114 E.12069
G1 X87.548 Y90 E.02136
G1 X94.192 Y90 E.16023
G2 X94.478 Y89.114 I-1.311 J-.912 E.02277
G1 X93.761 Y89.114 E.01727
M106 S124.95
; WIPE_START
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z22.04 I-1.202 J.19 P1  F42000
G1 X94.041 Y90.886 Z22.04
G1 Z21.64
G1 E.4 F1800
G1 F1032
M204 S6000
G1 X87.548 Y90.886 E.15659
G1 X87.548 Y91.771 E.02136
G1 X93.867 Y91.771 E.1524
G1 X93.867 Y92.657 E.02136
G1 X87.548 Y92.657 E.1524
G1 X87.548 Y93.543 E.02136
G1 X93.867 Y93.543 E.1524
G1 X93.867 Y94.428 E.02136
G1 X87.548 Y94.428 E.1524
M73 P94 R1
G1 X87.548 Y95.314 E.02136
G1 X93.867 Y95.314 E.1524
G1 X93.867 Y96.2 E.02136
G1 X87.548 Y96.2 E.1524
G1 X87.548 Y97.085 E.02136
G1 X93.867 Y97.085 E.1524
G1 X93.867 Y97.971 E.02136
G1 X87.548 Y97.971 E.1524
G1 X87.548 Y98.857 E.02136
G1 X93.867 Y98.857 E.1524
G1 X93.867 Y99.742 E.02136
G1 X87.548 Y99.742 E.1524
G1 X87.548 Y100.628 E.02136
G1 X93.867 Y100.628 E.1524
G1 X93.867 Y101.514 E.02136
G1 X87.548 Y101.514 E.1524
G1 X87.548 Y102.399 E.02136
G1 X93.867 Y102.399 E.1524
G1 X93.867 Y103.285 E.02136
G1 X87.548 Y103.285 E.1524
G1 X87.548 Y104.171 E.02136
G1 X93.867 Y104.171 E.1524
G1 X93.867 Y105.056 E.02136
G1 X87.548 Y105.056 E.1524
G1 X87.548 Y105.942 E.02136
G1 X94.041 Y105.942 E.15659
; WIPE_START
G1 F4800
; WIPE_END
G1 E-.4 F1800
M204 S10000
G17
G3 Z22.04 I1.171 J-.33 P1  F42000
G1 X86.53 Y79.304 Z22.04
G1 Z21.64
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1032
M204 S5000
G1 X86.53 Y106.747 E.6618
G3 X86.208 Y105.446 I2.284 J-1.256 E.03268
G1 X86.202 Y80.877 E.59249
G3 X86.466 Y79.412 I3.278 J-.166 E.0362
G1 X86.5 Y79.355 E.0016
; WIPE_START
G1 F12000
M204 S6000
G1 X86.501 Y80.355 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z22.04 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 136/141
; update layer progress
M73 L136
M991 S0 P135 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
M204 S250
G1 X86.53 Y79.502 F42000
M204 S10000
G1 Z21.8
G1 E.4 F1800
G1 F600
M204 S5000
G1 X86.53 Y106.545 E.65216
G3 X86.255 Y105.172 I2.545 J-1.224 E.03412
G1 X86.255 Y80.878 E.58586
G3 X86.505 Y79.557 I2.962 J-.123 E.03272
; WIPE_START
G1 F12000
M204 S6000
G1 X86.506 Y80.557 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z22.2 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 21.96
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 137/141
; update layer progress
M73 L137
M991 S0 P136 ;notify layer change
M106 S127.5
; OBJECT_ID: 15
G1 X88.394 Y81.12 F42000
G1 Z21.96
G1 E.4 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F600
M204 S5000
G1 X91.787 Y81.12 E.08819
G1 X91.787 Y104.929 E.61884
G1 X88.392 Y104.929 E.08823
G1 X88.394 Y81.18 E.61728
M106 S76.5
M106 S127.5
M204 S250
M73 P95 R1
G1 X87.978 Y80.704 F42000
G1 F600
M204 S5000
G1 X92.202 Y80.704 E.1098
G1 X92.202 Y105.345 E.64045
G1 X87.982 Y105.345 E.1097
G1 X87.978 Y80.764 E.63889
M106 S76.5
M106 S127.5
M204 S250
G1 X87.639 Y80.288 F42000
G1 F600
M204 S5000
G1 X92.618 Y80.288 E.12942
G1 X92.618 Y105.761 E.66206
G1 X87.638 Y105.761 E.12943
G3 X87.561 Y105.154 I2.01 J-.566 E.01594
G1 X87.562 Y80.806 E.63283
G3 X87.623 Y80.346 I1.994 J.029 E.01209
M106 S76.5
M106 S127.5
M204 S250
G1 X87.359 Y79.953 F42000
G1 F600
M204 S5000
G1 X87.384 Y79.915 E.0012
G1 X87.43 Y79.873 E.00161
G1 X93.034 Y79.873 E.14564
G1 X93.034 Y106.176 E.68366
G1 X87.43 Y106.176 E.14564
G3 X87.164 Y105.506 I.742 J-.682 E.01918
G3 X87.145 Y105.16 I3.125 J-.346 E.00899
G1 X87.147 Y80.795 E.63329
G3 X87.305 Y80.053 I1.489 J-.07 E.01995
G1 X87.33 Y80.006 E.00138
M106 S76.5
M106 S127.5
M204 S250
M73 P96 R1
G1 X86.94 Y79.83 F42000
G1 F600
M204 S5000
G3 X87.451 Y79.457 I.548 J.215 E.01736
G1 X93.449 Y79.457 E.1559
G1 X93.449 Y86.925 E.19409
M106 S76.5
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X93.449 Y88.825 E.04938
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall
G1 F3000
M204 S5000
G1 X93.449 Y106.592 E.4618
M106 S76.5
M106 S127.5
G1 F600
G1 X87.451 Y106.592 E.1559
G1 X87.325 Y106.575 E.00331
G1 X87.194 Y106.514 E.00377
G3 X86.94 Y106.219 I.444 J-.639 E.01021
M106 S76.5
M106 S127.5
; FEATURE: Inner wall
M204 S6000
G1 X86.924 Y106.19 E.00087
M106 S76.5
M106 S127.5
G1 X86.89 Y106.118 E.00207
M106 S76.5
M106 S127.5
G1 X86.856 Y106.031 E.00241
M106 S76.5
M106 S127.5
G1 X86.822 Y105.925 E.0029
M106 S76.5
M106 S127.5
G1 X86.799 Y105.834 E.00245
M106 S76.5
M106 S127.5
G1 X86.761 Y105.633 E.00531
M106 S76.5
M106 S127.5
G1 X86.751 Y105.55 E.00218
M106 S76.5
M106 S127.5
G1 F720
G1 X86.735 Y105.359 E.00498
M106 S76.5
M106 S127.5
G1 F840
G1 X86.729 Y105.166 E.005
M106 S76.5
M106 S127.5
G1 F960
G1 X86.729 Y104.566 E.01559
M106 S76.5
M106 S127.5
G1 F840
G1 X86.731 Y81.383 E.60255
G3 X86.741 Y80.593 I7.125 J-.3 E.02054
M106 S76.5
M106 S127.5
G1 F720
G1 X86.75 Y80.503 E.00236
M106 S76.5
M106 S127.5
G1 F600
G1 X86.761 Y80.417 E.00226
M106 S76.5
M106 S127.5
G1 X86.799 Y80.216 E.00532
M106 S76.5
M106 S127.5
G1 X86.822 Y80.124 E.00246
M106 S76.5
M106 S127.5
G1 X86.856 Y80.018 E.00289
M106 S76.5
M106 S127.5
G1 X86.89 Y79.931 E.00243
M106 S76.5
M106 S127.5
G1 X86.913 Y79.883 E.00137
M106 S76.5
M106 S127.5
M204 S250
G1 X86.683 Y79.486 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X86.766 Y79.381 E.00323
M106 S76.5
M106 S127.5
G1 F600
G1 X86.816 Y79.329 E.00174
M106 S76.5
M106 S127.5
G1 X86.871 Y79.278 E.00181
M106 S76.5
M106 S127.5
G1 X86.925 Y79.234 E.00168
M106 S76.5
M106 S127.5
G1 X86.94 Y79.223 E.00045
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G3 X87.078 Y79.142 I.598 J.856 E.00418
M106 S76.5
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X87.093 Y79.134 E.0004
G3 X87.444 Y79.056 I.367 J.824 E.00873
G1 X93.85 Y79.056 E.15449
G1 X93.85 Y79.142 E.00206
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X93.85 Y86.925 E.20228
M106 S76.5
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
G1 X93.85 Y88.825 E.04582
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X93.85 Y106.907 E.46999
M106 S76.5
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
G1 X93.85 Y106.993 E.00206
M106 S76.5
M106 S127.5
G1 X88.044 Y106.993 E.14002
G3 X87.323 Y106.984 I-.308 J-4.491 E.01741
G3 X87.078 Y106.907 I.132 J-.846 E.0062
M106 S76.5
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G3 X86.94 Y106.826 I.459 J-.936 E.00418
M106 S76.5
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X86.925 Y106.815 E.00045
M106 S76.5
M106 S127.5
G1 X86.87 Y106.771 E.00169
M106 S76.5
M106 S127.5
G1 X86.816 Y106.72 E.0018
M106 S76.5
M106 S127.5
G1 X86.766 Y106.668 E.00174
M106 S76.5
M106 S127.5
G1 F1200
G1 X86.661 Y106.534 E.00411
M106 S76.5
M106 S127.5
G1 F1663.865
G1 X86.614 Y106.458 E.00214
M106 S76.5
M106 S127.5
G1 F2210.245
G1 X86.571 Y106.38 E.00217
G1 F2269.764
G1 X86.567 Y106.372 E.00022
G1 F3994.259
G1 X86.479 Y106.165 E.00542
G1 F6540.917
G1 X86.408 Y105.92 E.00615
G1 F10803.969
G1 X86.352 Y105.592 E.00803
G1 F12000
G1 X86.329 Y105.172 E.01014
G1 X86.33 Y80.772 E.58841
G3 X86.347 Y80.458 I2.547 J-.021 E.00759
G1 X86.408 Y80.129 E.00806
G1 F8470.47
G1 X86.479 Y79.884 E.00615
G1 F5531.2
G1 X86.571 Y79.669 E.00564
G1 F3383.859
G1 X86.614 Y79.591 E.00216
G1 F2700
G1 X86.649 Y79.535 E.00158
M106 S76.5
M106 S127.5
; WIPE_START
M204 S6000
G1 X86.766 Y79.381 E-.07369
G1 X86.816 Y79.329 E-.02736
G1 X86.871 Y79.278 E-.02849
G1 X86.925 Y79.234 E-.02641
G1 X86.94 Y79.223 E-.00711
G1 X87.078 Y79.142 E-.06103
G1 X87.093 Y79.134 E-.00623
G1 X87.265 Y79.075 E-.06924
G1 X87.444 Y79.056 E-.06825
G1 X87.476 Y79.056 E-.01218
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z22.36 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X88.735 Y81.287
G1 Z21.96
G1 E.4 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.421736
G1 F3000
M204 S6000
G1 X88.734 Y104.589 E.56447
G1 X89.121 Y104.589 E.00938
G1 X89.122 Y81.46 E.56027
G1 X89.51 Y81.46 E.00938
G1 X89.508 Y104.589 E.56027
G1 X89.896 Y104.589 E.00938
G1 X89.897 Y81.46 E.56027
G1 X90.285 Y81.46 E.00938
G1 X90.283 Y104.589 E.56027
G1 X90.671 Y104.589 E.00938
G1 X90.672 Y81.46 E.56027
G1 X91.059 Y81.46 E.00938
G1 X91.058 Y104.589 E.56027
G1 X91.445 Y104.589 E.00938
G1 X91.447 Y81.287 E.56447
M106 S76.5
; CHANGE_LAYER
; Z_HEIGHT: 22.12
; LAYER_HEIGHT: 0.160002
; WIPE_START
G1 F3000
G1 X91.447 Y82.287 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 138/141
; update layer progress
M73 L138
M991 S0 P137 ;notify layer change
M106 S124.95
; OBJECT_ID: 15
M204 S10000
G17
G3 Z22.36 I.382 J-1.155 P1  F42000
G1 X88.494 Y81.31 Z22.36
G1 Z22.12
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2692
M204 S6000
G1 X91.787 Y81.31 E.08559
G1 X91.787 Y104.739 E.60895
G1 X88.492 Y104.739 E.08564
G1 X88.494 Y81.37 E.60739
M204 S10000
G1 X88.078 Y80.894 F42000
G1 F2692
M204 S6000
G1 X92.202 Y80.894 E.10719
G1 X92.202 Y105.155 E.63056
G1 X88.076 Y105.155 E.10724
G1 X88.078 Y80.954 E.629
M204 S10000
G1 X87.703 Y80.479 F42000
G1 F2692
M204 S6000
G1 X92.618 Y80.479 E.12775
G1 X92.618 Y105.57 E.65216
G1 X87.702 Y105.57 E.12776
G3 X87.661 Y105.149 I1.939 J-.406 E.01102
G1 X87.663 Y80.807 E.63268
G3 X87.692 Y80.537 I2.041 J.085 E.00705
M204 S10000
G1 X87.455 Y80.068 F42000
G1 F2692
M204 S6000
G1 X87.458 Y80.063 E.00015
G1 X93.034 Y80.063 E.14491
G1 X93.034 Y105.986 E.67377
G1 X87.456 Y105.986 E.14498
G3 X87.245 Y105.157 I1.103 J-.722 E.02265
G1 X87.247 Y80.793 E.63324
G3 X87.374 Y80.207 I1.231 J-.039 E.01574
G1 X87.425 Y80.12 E.00263
M204 S10000
G1 X87.086 Y79.879 F42000
G1 F2692
M204 S6000
G1 X87.189 Y79.752 E.00424
G3 X87.459 Y79.647 I.262 J.275 E.00774
G1 X93.449 Y79.647 E.15569
G1 X93.449 Y106.402 E.69538
G1 X87.452 Y106.402 E.15587
G1 X87.287 Y106.364 E.0044
G3 X86.874 Y105.655 I.582 J-.814 E.02198
G3 X86.829 Y105.164 I2.502 J-.478 E.01283
G1 X86.831 Y80.779 E.6338
G3 X87.053 Y79.936 I1.461 J-.067 E.02301
G1 X87.056 Y79.931 E.00015
M204 S250
G1 X86.769 Y79.629 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2692
M204 S5000
G1 X86.796 Y79.585 E.00125
G3 X87.447 Y79.247 I.665 J.484 E.01833
G1 X93.85 Y79.247 E.15442
G1 X93.85 Y106.802 E.66451
G1 X87.444 Y106.802 E.15447
G3 X86.634 Y106.205 I.055 J-.923 E.02566
G3 X86.429 Y105.171 I2.207 J-.977 E.02564
G1 X86.431 Y80.765 E.58855
G3 X86.641 Y79.849 I2.05 J-.011 E.02287
G1 X86.739 Y79.681 E.00469
; WIPE_START
M73 P97 R1
G1 F12000
M204 S6000
G1 X86.796 Y79.585 E-.04256
G1 X86.933 Y79.443 E-.07488
G1 X87.104 Y79.329 E-.07832
G1 X87.266 Y79.268 E-.06575
G1 X87.447 Y79.247 E-.06907
G1 X87.577 Y79.247 E-.04942
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z22.52 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X90.139 Y103.092
G1 Z22.12
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.598606
G1 F2692
M204 S6000
G1 X90.14 Y83.016 E.70832
M204 S10000
G1 X90.615 Y82.956 F42000
; LINE_WIDTH: 0.419996
G1 F2692
M204 S6000
G1 X90.615 Y82.482 E.01144
G1 X89.666 Y82.482 E.02289
G1 X89.664 Y103.567 E.50847
G1 X90.615 Y103.567 E.02293
G1 X90.615 Y83.016 E.49558
M204 S10000
G1 X91 Y82.956 F42000
G1 F2692
M204 S6000
M73 P97 R0
G1 X91 Y82.096 E.02074
G1 X89.28 Y82.096 E.04149
G1 X89.278 Y103.953 E.52707
G1 X91 Y103.953 E.04153
G1 X91 Y83.016 E.50488
M204 S10000
G1 X91.386 Y82.956 F42000
G1 F2692
M204 S6000
G1 X91.386 Y81.711 E.03004
G1 X88.895 Y81.711 E.06009
G1 X88.893 Y104.339 E.54567
G1 X91.386 Y104.339 E.06013
G1 X91.386 Y83.016 E.51418
; CHANGE_LAYER
; Z_HEIGHT: 22.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12640.669
G1 X91.386 Y84.016 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 139/141
; update layer progress
M73 L139
M991 S0 P138 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z22.52 I.813 J-.906 P1  F42000
G1 X88.623 Y81.537 Z22.52
G1 Z22.28
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2636
M204 S6000
G1 X91.787 Y81.537 E.08222
G1 X91.787 Y104.512 E.59713
G1 X88.623 Y104.512 E.08222
G1 X88.623 Y81.597 E.59557
M204 S10000
G1 X88.208 Y81.122 F42000
G1 F2636
M204 S6000
G1 X92.202 Y81.122 E.10383
G1 X92.202 Y104.927 E.61874
G1 X88.208 Y104.927 E.10383
G1 X88.208 Y81.182 E.61718
M204 S10000
G1 X87.797 Y80.706 F42000
G1 F2636
M204 S6000
G1 X92.618 Y80.706 E.12532
G1 X92.618 Y105.343 E.64035
G1 X87.797 Y105.343 E.12532
G1 X87.797 Y80.766 E.63879
M204 S10000
G1 X87.511 Y80.29 F42000
G1 F2636
M204 S6000
G1 X93.034 Y80.29 E.14353
G1 X93.034 Y105.759 E.66195
G1 X87.51 Y105.759 E.14357
G3 X87.376 Y105.162 I1.117 J-.563 E.01607
G1 X87.376 Y80.887 E.63091
G3 X87.485 Y80.344 I1.23 J-.036 E.01452
M204 S10000
G1 X87.211 Y80.017 F42000
G1 F2636
M204 S6000
G1 X87.264 Y79.952 E.00217
G3 X87.463 Y79.875 I.194 J.205 E.00571
G1 X93.449 Y79.875 E.15558
G1 X93.449 Y106.174 E.68356
G1 X87.468 Y106.174 E.15546
G3 X87.082 Y105.83 I.066 J-.463 E.01426
G3 X86.961 Y105.167 I1.613 J-.636 E.01764
G1 X86.961 Y80.882 E.63118
G3 X87.148 Y80.114 I1.309 J-.089 E.02088
G1 X87.178 Y80.067 E.00146
M204 S250
G1 X86.899 Y79.764 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2636
M204 S5000
G1 X86.949 Y79.698 E.002
G3 X87.448 Y79.474 I.522 J.496 E.01353
G1 X93.85 Y79.474 E.15438
G1 X93.85 Y106.575 E.65355
G1 X87.45 Y106.575 E.15435
G3 X86.777 Y106.119 I.042 J-.786 E.02059
G3 X86.56 Y105.172 I1.879 J-.929 E.02365
G1 X86.56 Y80.877 E.58586
G3 X86.798 Y79.914 I1.731 J-.084 E.02426
G1 X86.865 Y79.814 E.00292
; WIPE_START
G1 F12000
M204 S6000
G1 X86.949 Y79.698 E-.05434
G1 X87.15 Y79.546 E-.09553
G1 X87.273 Y79.498 E-.05029
G1 X87.448 Y79.474 E-.06716
G1 X87.745 Y79.474 E-.11267
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z22.68 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X90.205 Y102.93
G1 Z22.28
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.468076
G1 F2636
M204 S6000
G1 X90.205 Y83.179 E.53568
M204 S10000
G1 X90.615 Y83.119 F42000
; LINE_WIDTH: 0.419996
G1 F2636
M204 S6000
G1 X90.615 Y82.709 E.00988
G1 X89.795 Y82.709 E.01976
G1 X89.795 Y103.34 E.4975
G1 X90.615 Y103.34 E.01976
G1 X90.615 Y83.179 E.48618
M204 S10000
G1 X91 Y83.119 F42000
G1 F2636
M204 S6000
G1 X91 Y82.324 E.01918
G1 X89.41 Y82.324 E.03836
G1 X89.41 Y103.725 E.51611
G1 X91 Y103.725 E.03836
G1 X91 Y83.179 E.49548
M204 S10000
G1 X91.386 Y83.119 F42000
G1 F2636
M204 S6000
G1 X91.386 Y81.938 E.02848
G1 X89.024 Y81.938 E.05696
G1 X89.024 Y104.111 E.53471
G1 X91.386 Y104.111 E.05696
G1 X91.386 Y83.179 E.50478
; CHANGE_LAYER
; Z_HEIGHT: 22.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12640.669
G1 X91.386 Y84.179 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 140/141
; update layer progress
M73 L140
M991 S0 P139 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z22.68 I.82 J-.899 P1  F42000
G1 X88.801 Y81.821 Z22.68
G1 Z22.44
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2461
M204 S6000
G1 X91.787 Y81.821 E.07761
G1 X91.787 Y104.228 E.58236
G1 X88.801 Y104.228 E.07761
G1 X88.801 Y81.881 E.5808
M204 S10000
G1 X88.385 Y81.406 F42000
G1 F2461
M204 S6000
G1 X92.202 Y81.406 E.09922
G1 X92.202 Y104.643 E.60397
G1 X88.385 Y104.643 E.09922
G1 X88.385 Y81.466 E.60241
M204 S10000
G1 X87.969 Y80.99 F42000
G1 F2461
M204 S6000
G1 X92.618 Y80.99 E.12082
G1 X92.618 Y105.059 E.62557
G1 X87.969 Y105.059 E.12082
G1 X87.969 Y81.05 E.62401
M204 S10000
M73 P98 R0
G1 X87.599 Y80.575 F42000
G1 F2461
M204 S6000
G1 X93.034 Y80.575 E.14125
G1 X93.034 Y105.475 E.64718
G1 X87.599 Y105.475 E.14125
G3 X87.554 Y105.158 I1.223 J-.338 E.00834
G1 X87.554 Y80.891 E.63071
G3 X87.585 Y80.633 I1.269 J.021 E.00678
M204 S10000
G1 X87.347 Y80.212 F42000
G1 F2461
M204 S6000
G3 X87.457 Y80.159 I.094 J.053 E.00338
G1 X93.449 Y80.159 E.15575
G1 X93.449 Y105.89 E.66878
G1 X87.457 Y105.89 E.15575
G3 X87.258 Y105.717 I.073 J-.283 E.0071
G3 X87.138 Y105.165 I1.193 J-.549 E.01481
G1 X87.138 Y80.885 E.63106
G3 X87.311 Y80.26 I.986 J-.063 E.01716
M204 S250
G1 X87.033 Y79.964 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2461
M204 S5000
G1 X87.076 Y79.915 E.00159
G3 X87.446 Y79.758 I.377 J.376 E.00992
G1 X93.85 Y79.758 E.15444
G1 X93.85 Y106.291 E.63984
G1 X87.446 Y106.291 E.15444
G3 X86.843 Y105.771 I.078 J-.7 E.0204
G3 X86.737 Y105.171 I1.614 J-.593 E.01477
G1 X86.737 Y80.878 E.58583
G3 X86.98 Y80.04 I1.404 J-.047 E.0214
G1 X86.999 Y80.013 E.00078
; WIPE_START
G1 F12000
M204 S6000
G1 X87.076 Y79.915 E-.04775
G1 X87.238 Y79.803 E-.07442
G1 X87.446 Y79.758 E-.08094
G1 X87.911 Y79.758 E-.17688
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z22.84 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X90.551 Y83.314
G1 Z22.44
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.548206
G1 F2461
M204 S6000
G1 X90.551 Y83.058 E.00826
G1 X90.037 Y83.058 E.01651
G1 X90.037 Y102.992 E.64051
G1 X90.551 Y102.992 E.01651
G1 X90.551 Y83.374 E.63033
M204 S10000
G1 X91 Y83.314 F42000
; LINE_WIDTH: 0.419996
G1 F2461
M204 S6000
G1 X91 Y82.608 E.01704
G1 X89.587 Y82.608 E.03408
G1 X89.587 Y103.441 E.5024
G1 X91 Y103.441 E.03408
G1 X91 Y83.374 E.48391
M204 S10000
G1 X91.386 Y83.314 F42000
G1 F2461
M204 S6000
G1 X91.386 Y82.222 E.02634
G1 X89.201 Y82.222 E.05268
G1 X89.201 Y103.827 E.521
G1 X91.386 Y103.827 E.05268
G1 X91.386 Y83.374 E.49321
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12640.669
G1 X91.386 Y84.374 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 141/141
; update layer progress
M73 L141
M991 S0 P140 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z22.84 I.872 J-.848 P1  F42000
G1 X87.31 Y80.183 Z22.84
G1 Z22.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2707
M204 S5000
G3 X87.456 Y80.151 I.146 J.314 E.00365
G1 X93.85 Y80.151 E.15418
G1 X93.85 Y105.898 E.62091
G1 X87.448 Y105.898 E.15438
G3 X87.054 Y105.527 I.067 J-.466 E.01391
G3 X86.997 Y105.169 I1.168 J-.37 E.00878
G1 X86.997 Y80.88 E.58575
G3 X87.264 Y80.221 I.814 J-.053 E.01772
; WIPE_START
G1 F12000
M204 S6000
G1 X87.456 Y80.151 E-.07805
G1 X88.251 Y80.151 E-.30195
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z23 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X93.638 Y80.821
G1 Z22.6
G1 E.4 F1800
; FEATURE: Top surface
G1 F2707
M204 S2000
G1 X93.18 Y80.363 E.01563
G1 X92.634 Y80.363
G1 X93.638 Y81.366 E.03423
G1 X93.638 Y81.912
G1 X92.089 Y80.363 E.05283
G1 X91.544 Y80.363
G1 X93.638 Y82.457 E.07143
G1 X93.638 Y83.003
G1 X90.998 Y80.363 E.09003
G1 X90.453 Y80.363
G1 X93.638 Y83.548 E.10863
G1 X93.638 Y84.093
G1 X89.907 Y80.363 E.12723
G1 X89.362 Y80.363
G1 X93.638 Y84.639 E.14583
G1 X93.638 Y85.184
G1 X88.816 Y80.363 E.16443
G1 X88.271 Y80.363
G1 X93.638 Y85.73 E.18303
G1 X93.638 Y86.275
G1 X87.726 Y80.363 E.20163
G1 X87.307 Y80.489
G1 X93.638 Y86.82 E.21592
G1 X93.638 Y87.366
G1 X87.209 Y80.937 E.21926
G1 X87.209 Y81.482
G1 X93.638 Y87.911 E.21926
G1 X93.638 Y88.457
G1 X87.209 Y82.028 E.21926
G1 X87.209 Y82.573
G1 X93.638 Y89.002 E.21926
G1 X93.638 Y89.547
G1 X87.209 Y83.118 E.21926
G1 X87.209 Y83.664
G1 X93.638 Y90.093 E.21926
G1 X93.638 Y90.638
G1 X87.209 Y84.209 E.21926
G1 X87.209 Y84.755
G1 X93.638 Y91.184 E.21926
G1 X93.638 Y91.729
G1 X87.209 Y85.3 E.21926
G1 X87.209 Y85.845
G1 X93.638 Y92.274 E.21926
G1 X93.638 Y92.82
G1 X87.209 Y86.391 E.21926
G1 X87.209 Y86.936
G1 X93.638 Y93.365 E.21926
G1 X93.638 Y93.911
G1 X87.209 Y87.482 E.21926
G1 X87.209 Y88.027
G1 X93.638 Y94.456 E.21926
G1 X93.638 Y95.001
G1 X87.209 Y88.572 E.21926
G1 X87.209 Y89.118
G1 X93.638 Y95.547 E.21926
G1 X93.638 Y96.092
G1 X87.209 Y89.663 E.21926
G1 X87.209 Y90.209
G1 X93.638 Y96.638 E.21926
G1 X93.638 Y97.183
G1 X87.209 Y90.754 E.21926
G1 X87.209 Y91.299
G1 X93.638 Y97.729 E.21926
G1 X93.638 Y98.274
G1 X87.209 Y91.845 E.21926
G1 X87.209 Y92.39
G1 X93.638 Y98.819 E.21926
M73 P99 R0
G1 X93.638 Y99.365
G1 X87.209 Y92.936 E.21926
G1 X87.209 Y93.481
G1 X93.638 Y99.91 E.21926
G1 X93.638 Y100.456
G1 X87.209 Y94.027 E.21926
G1 X87.209 Y94.572
G1 X93.638 Y101.001 E.21926
G1 X93.638 Y101.546
G1 X87.209 Y95.117 E.21926
G1 X87.209 Y95.663
G1 X93.638 Y102.092 E.21926
G1 X93.638 Y102.637
G1 X87.209 Y96.208 E.21926
G1 X87.209 Y96.754
G1 X93.638 Y103.183 E.21926
G1 X93.638 Y103.728
G1 X87.209 Y97.299 E.21926
G1 X87.209 Y97.844
G1 X93.638 Y104.273 E.21926
G1 X93.638 Y104.819
G1 X87.209 Y98.39 E.21926
G1 X87.209 Y98.935
G1 X93.638 Y105.364 E.21926
G1 X93.415 Y105.686
G1 X87.209 Y99.481 E.21164
G1 X87.209 Y100.026
G1 X92.869 Y105.686 E.19304
G1 X92.324 Y105.686
G1 X87.209 Y100.571 E.17444
G1 X87.209 Y101.117
G1 X91.778 Y105.686 E.15584
G1 X91.233 Y105.686
G1 X87.209 Y101.662 E.13724
G1 X87.209 Y102.208
G1 X90.688 Y105.686 E.11864
G1 X90.142 Y105.686
G1 X87.209 Y102.753 E.10004
G1 X87.209 Y103.298
G1 X89.597 Y105.686 E.08144
G1 X89.051 Y105.686
G1 X87.209 Y103.844 E.06284
G1 X87.209 Y104.389
G1 X88.506 Y105.686 E.04424
G1 X87.961 Y105.686
G1 X87.209 Y104.935 E.02564
M204 S10000
G1 X87.65 Y105.706 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.238932
G1 F2707
M204 S6000
G3 X87.406 Y105.556 I.192 J-.585 E.0037
G1 X87.205 Y105.309 E.00407
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X87.406 Y105.556 E-.19983
G1 X87.65 Y105.706 E-.18017
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z23 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z23.1 F900 ; lower z a little
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

    G1 Z122.6 F600
    G1 Z120.6

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


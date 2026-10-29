; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 15m 48s; total estimated time: 16m 7s
; total layer number: 99
; total filament length [mm] : 559.77
; total filament volume [cm^3] : 1346.39
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
; wall_generator = classic
; wall_loops = 4
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
M73 P0 R15
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
G1 X78.535 Y81.61 F42000
M204 S6000
G1 Z.4
G1 Z.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X78.472 Y81.388 E.01158
G3 X79.772 Y79.458 I1.598 J-.326 E.13005
G1 X80.043 Y79.431 E.01367
G3 X78.568 Y81.698 I.026 J1.631 E.35418
G1 X78.556 Y81.666 E.00169
M204 S6000
G1 X78.955 Y81.48 F42000
M73 P2 R15
G1 F3000
M204 S500
G1 X78.904 Y81.301 E.00937
G3 X79.855 Y79.892 I1.166 J-.238 E.09499
G1 X80.049 Y79.873 E.0098
G3 X78.978 Y81.536 I.021 J1.19 E.25803
M204 S6000
G1 X79.376 Y81.351 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X79.336 Y81.214 E.00717
G3 X79.937 Y80.326 I.734 J-.15 E.05993
G1 X80.054 Y80.314 E.00594
G3 X79.403 Y81.404 I.015 J.749 E.1602
; WIPE_START
G1 X79.336 Y81.214 E-.07679
G1 X79.319 Y81.065 E-.05679
G1 X79.334 Y80.916 E-.05682
G1 X79.378 Y80.773 E-.05681
G1 X79.449 Y80.642 E-.05688
G1 X79.545 Y80.527 E-.05691
G1 X79.662 Y80.434 E-.05683
G1 X79.796 Y80.366 E-.0569
G1 X79.937 Y80.326 E-.05563
G1 X80.054 Y80.314 E-.04499
G1 X80.2 Y80.325 E-.05564
G1 X80.344 Y80.366 E-.05683
G1 X80.472 Y80.431 E-.05443
G1 X80.508 Y80.46 E-.01775
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X78.566 Y76.866 Z.68 F42000
G1 Z.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X101.432 Y76.867 E1.14758
G1 X101.434 Y103.134 E1.31825
G1 X78.566 Y103.134 E1.14767
G1 X78.566 Y82.532 E1.03393
G2 X79.709 Y83.111 I1.721 J-1.981 E.06496
G2 X78.943 Y79.32 I.353 J-2.044 E.4043
G1 X78.566 Y79.62 E.0242
G1 X78.566 Y76.926 E.13522
M204 S6000
G1 X78.194 Y76.522 F42000
G1 F3000
M204 S500
G3 X78.414 Y76.426 I.211 J.184 E.01246
G1 X101.607 Y76.427 E1.16395
G1 X101.704 Y76.448 E.00501
G1 X101.793 Y76.507 E.00535
G3 X101.872 Y76.687 I-.198 J.195 E.01007
G1 X101.874 Y103.3 E1.3356
G3 X101.586 Y103.574 I-.278 J-.003 E.02223
G1 X78.428 Y103.574 E1.16221
G3 X78.126 Y103.286 I-.022 J-.279 E.02363
G1 X78.126 Y76.728 E1.33284
G3 X78.159 Y76.572 I.279 J-.022 E.00814
M204 S6000
G1 X77.843 Y76.26 F42000
G1 F3000
M204 S500
G1 X77.867 Y76.228 E.002
G3 X78.409 Y75.986 I.538 J.476 E.03072
G1 X101.62 Y75.987 E1.16486
G3 X102.312 Y76.665 I-.029 J.723 E.0533
G1 X102.314 Y103.291 E1.33626
G3 X101.591 Y104.014 I-.72 J.003 E.05704
G1 X78.417 Y104.014 E1.16302
G3 X77.686 Y103.291 I-.01 J-.721 E.05744
G1 X77.686 Y76.717 E1.33365
G3 X77.768 Y76.372 I.718 J-.013 E.018
G1 X77.809 Y76.31 E.00374
M204 S6000
G1 X77.482 Y76.015 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X77.544 Y75.929 E.00532
G3 X78.403 Y75.546 I.86 J.776 E.0486
G1 X101.633 Y75.547 E1.16578
G3 X102.752 Y76.643 I-.047 J1.168 E.08618
G1 X102.754 Y103.297 E1.33762
G3 X101.597 Y104.454 I-1.162 J-.005 E.09113
G1 X78.406 Y104.454 E1.16383
G3 X77.246 Y103.297 I.002 J-1.162 E.09127
G1 X77.246 Y76.706 E1.33446
G3 X77.382 Y76.159 I1.158 J-.002 E.02857
G1 X77.448 Y76.064 E.00582
; WIPE_START
M73 P3 R15
G1 X77.544 Y75.929 E-.06309
G1 X77.713 Y75.774 E-.08701
G1 X77.907 Y75.657 E-.08597
G1 X78.173 Y75.569 E-.10646
G1 X78.403 Y75.546 E-.0881
G1 X79.27 Y75.546 E-.32937
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

G1 X78.978 Y79.024
G1 Z.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.133036
G1 F3000
M204 S500
G1 X78.786 Y79.1 E.00172
M204 S6000
G1 X78.579 Y79.926 F42000
; LINE_WIDTH: 0.132836
G1 F3000
M204 S500
G2 X78.346 Y80.17 I2.285 J2.415 E.00281
; WIPE_START
G1 X78.579 Y79.926 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X78.346 Y81.992 Z.68 F42000
G1 Z.28
G1 E.8 F1800
; LINE_WIDTH: 0.168472
G1 F3000
M204 S500
G1 X78.495 Y82.145 E.00264
; LINE_WIDTH: 0.143325
G1 X78.654 Y82.292 E.00206
M204 S6000
G1 X78.786 Y83.025 F42000
; LINE_WIDTH: 0.135781
G1 F3000
M204 S500
G1 X78.977 Y83.105 E.00179
; WIPE_START
G1 X78.786 Y83.025 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.23 Y81.342 Z.68 F42000
G1 X101.257 Y77.944 Z.68
G1 Z.28
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.505629
G1 F5771.487
M204 S500
G1 X100.553 Y77.241 E.05056
G1 X99.923 Y77.241 E.03203
G1 X101.059 Y78.376 E.08162
G1 X101.059 Y79.006 E.03203
G1 X99.293 Y77.241 E.12692
G1 X98.663 Y77.241 E.03203
G1 X101.059 Y79.637 E.17222
G1 X101.059 Y80.267 E.03203
G1 X98.033 Y77.241 E.21752
G1 X97.403 Y77.241 E.03203
G1 X101.059 Y80.897 E.26281
G1 X101.059 Y81.527 E.03203
G1 X96.772 Y77.241 E.30811
G1 X96.142 Y77.241 E.03203
G1 X101.059 Y82.157 E.35341
G1 X101.059 Y82.787 E.03203
G1 X95.512 Y77.241 E.3987
G1 X94.882 Y77.241 E.03203
G1 X101.059 Y83.417 E.444
G1 X101.059 Y84.047 E.03203
G1 X94.252 Y77.241 E.4893
G1 X93.622 Y77.24 E.03203
G1 X101.059 Y84.678 E.53459
G1 X101.059 Y85.308 E.03203
G1 X92.992 Y77.24 E.57989
G1 X92.362 Y77.24 E.03203
G1 X101.059 Y85.938 E.62519
G1 X101.059 Y86.568 E.03203
G1 X91.732 Y77.24 E.67048
G1 X91.101 Y77.24 E.03203
G1 X101.059 Y87.198 E.71578
G1 X101.059 Y87.828 E.03203
G1 X90.471 Y77.24 E.76108
G1 X89.841 Y77.24 E.03203
G1 X101.059 Y88.458 E.80637
G1 X101.059 Y89.088 E.03203
G1 X89.211 Y77.24 E.85167
G1 X88.581 Y77.24 E.03203
G1 X101.059 Y89.719 E.89697
G1 X101.059 Y90.349 E.03203
G1 X87.951 Y77.24 E.94227
G1 X87.321 Y77.24 E.03203
G1 X101.059 Y90.979 E.98756
G1 X101.059 Y91.609 E.03203
G1 X86.691 Y77.24 E1.03286
G1 X86.061 Y77.24 E.03203
G1 X101.059 Y92.239 E1.07816
G1 X101.06 Y92.869 E.03203
G1 X85.43 Y77.24 E1.12345
G1 X84.8 Y77.24 E.03203
G1 X101.06 Y93.499 E1.16875
G1 X101.06 Y94.13 E.03203
G1 X84.17 Y77.24 E1.21405
G1 X83.54 Y77.24 E.03203
G1 X101.06 Y94.76 E1.25934
G1 X101.06 Y95.39 E.03203
G1 X82.91 Y77.24 E1.30464
M73 P4 R15
G1 X82.28 Y77.24 E.03203
G1 X101.06 Y96.02 E1.34994
G1 X101.06 Y96.65 E.03203
G1 X81.65 Y77.24 E1.39523
G1 X81.02 Y77.24 E.03203
G1 X101.06 Y97.28 E1.44053
G1 X101.06 Y97.91 E.03203
G1 X80.389 Y77.24 E1.48583
G1 X79.759 Y77.24 E.03203
G1 X101.06 Y98.54 E1.53112
G1 X101.06 Y99.171 E.03203
G1 X82.475 Y80.586 E1.33589
G1 X82.331 Y80.113 E.02516
G1 X82.097 Y79.683 E.02486
G2 X80.555 Y78.665 I-2.082 J1.478 E.09609
G1 X79.129 Y77.24 E.10248
G1 X78.94 Y77.24 E.00963
G1 X78.94 Y77.681 E.0224
G1 X79.888 Y78.629 E.06816
G2 X79.358 Y78.729 I.02 J1.553 E.02754
G1 X78.742 Y78.113 E.04432
; WIPE_START
G1 X79.358 Y78.729 E-.33134
G1 X79.621 Y78.655 E-.10353
G1 X79.888 Y78.629 E-.1021
G1 X79.473 Y78.214 E-.22303
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X82.324 Y81.065 Z.68 F42000
G1 Z.28
G1 E.8 F1800
G1 F5771.487
M204 S500
G1 X101.06 Y99.801 E1.34675
G1 X101.06 Y100.431 E.03203
G1 X82.405 Y81.776 E1.34094
G3 X82.221 Y82.222 I-1.355 J-.298 E.02465
G1 X101.06 Y101.061 E1.35417
G1 X101.06 Y101.691 E.03203
G1 X81.969 Y82.6 E1.37228
G3 X81.658 Y82.919 I-.944 J-.61 E.0228
G1 X101.06 Y102.321 E1.39465
G1 X101.06 Y102.76 E.02231
G1 X100.869 Y102.76 E.00971
G1 X81.289 Y83.18 E1.40746
G3 X80.855 Y83.376 I-.703 J-.976 E.02436
G1 X100.239 Y102.76 E1.39334
G1 X99.609 Y102.76 E.03203
G1 X80.34 Y83.491 E1.38508
G1 X80.131 Y83.518 E.01072
G1 X79.704 Y83.486 E.02175
G1 X98.979 Y102.76 E1.3855
G1 X98.349 Y102.76 E.03203
G1 X79.186 Y83.597 E1.37748
G1 X79.16 Y83.661 E.0035
G1 X78.94 Y83.569 E.01215
G1 X78.94 Y83.981 E.02097
G1 X97.719 Y102.76 E1.34985
G1 X97.088 Y102.76 E.03203
G1 X78.94 Y84.612 E1.30456
M73 P5 R15
G1 X78.94 Y85.242 E.03203
G1 X96.458 Y102.76 E1.25927
G1 X95.828 Y102.76 E.03203
G1 X78.94 Y85.872 E1.21398
G1 X78.94 Y86.502 E.03203
G1 X95.198 Y102.76 E1.16869
G1 X94.568 Y102.76 E.03203
G1 X78.94 Y87.132 E1.12339
G1 X78.94 Y87.762 E.03203
G1 X93.938 Y102.76 E1.0781
G1 X93.308 Y102.76 E.03203
G1 X78.94 Y88.392 E1.03281
G1 X78.94 Y89.022 E.03203
G1 X92.678 Y102.76 E.98752
G1 X92.048 Y102.76 E.03203
G1 X78.94 Y89.652 E.94223
G1 X78.94 Y90.282 E.03203
G1 X91.418 Y102.76 E.89693
G1 X90.788 Y102.76 E.03203
G1 X78.94 Y90.912 E.85164
G1 X78.94 Y91.542 E.03203
G1 X90.158 Y102.76 E.80635
G1 X89.527 Y102.76 E.03203
G1 X78.94 Y92.173 E.76106
G1 X78.94 Y92.803 E.03203
G1 X88.897 Y102.76 E.71576
G1 X88.267 Y102.76 E.03203
G1 X78.94 Y93.433 E.67047
G1 X78.94 Y94.063 E.03203
G1 X87.637 Y102.76 E.62518
G1 X87.007 Y102.76 E.03203
G1 X78.94 Y94.693 E.57989
G1 X78.94 Y95.323 E.03203
G1 X86.377 Y102.76 E.5346
G1 X85.747 Y102.76 E.03203
G1 X78.94 Y95.953 E.48931
G1 X78.94 Y96.583 E.03203
G1 X85.117 Y102.76 E.44401
G1 X84.487 Y102.76 E.03203
G1 X78.94 Y97.213 E.39872
G1 X78.94 Y97.843 E.03203
G1 X83.857 Y102.76 E.35343
G1 X83.227 Y102.76 E.03203
G1 X78.94 Y98.473 E.30814
G1 X78.94 Y99.104 E.03203
G1 X82.596 Y102.76 E.26284
G1 X81.966 Y102.76 E.03203
G1 X78.94 Y99.734 E.21755
G1 X78.94 Y100.364 E.03203
G1 X81.336 Y102.76 E.17226
G1 X80.706 Y102.76 E.03203
G1 X78.94 Y100.994 E.12697
G1 X78.94 Y101.624 E.03203
G1 X80.076 Y102.76 E.08168
G1 X79.446 Y102.76 E.03203
G1 X78.742 Y102.056 E.05061
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F5771.487
G1 X79.446 Y102.76 E-.3784
G1 X80.076 Y102.76 E-.23943
G1 X79.812 Y102.496 E-.14216
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
G3 Z.68 I1.215 J-.07 P1  F42000
G1 X78.601 Y81.588 Z.68
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P6 R15
G1 F18000
M204 S6000
G1 X78.546 Y81.373 E.00313
G3 X79.735 Y79.537 I1.53 J-.312 E.03419
G1 X80.031 Y79.5 E.00421
G3 X78.638 Y81.669 I.045 J1.561 E.09565
G1 X78.626 Y81.643 E.00041
M204 S10000
G1 X79.014 Y81.46 F42000
G1 F18000
M204 S6000
G1 X78.968 Y81.288 E.00252
G3 X79.826 Y79.961 I1.105 J-.226 E.02468
G1 X80.042 Y79.934 E.00307
G3 X79.04 Y81.514 I.032 J1.128 E.06887
M204 S250
G1 X79.414 Y81.337 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X79.376 Y81.205 E.0018
G3 X79.914 Y80.371 I.695 J-.142 E.01443
G1 X80.052 Y80.354 E.00183
G3 X79.441 Y81.39 I.019 J.709 E.03968
; WIPE_START
M204 S6000
G1 X79.376 Y81.205 E-.0743
G1 X79.359 Y81.065 E-.05366
G1 X79.373 Y80.924 E-.05376
G1 X79.415 Y80.789 E-.05389
G1 X79.483 Y80.664 E-.05378
G1 X79.574 Y80.556 E-.05383
G1 X79.684 Y80.468 E-.05381
G1 X79.914 Y80.371 E-.09474
G1 X80.052 Y80.354 E-.05284
G1 X80.193 Y80.365 E-.05377
G1 X80.33 Y80.403 E-.05385
G1 X80.456 Y80.468 E-.05379
G1 X80.567 Y80.556 E-.05381
G1 X80.567 Y80.556 E-.00016
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.402 Y76.702 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F18000
M204 S6000
G1 X101.597 Y76.703 E.32724
G1 X101.598 Y103.298 E.37521
G1 X78.402 Y103.298 E.32726
G1 X78.402 Y82.174 E.29803
G2 X80.02 Y79.065 I1.661 J-1.111 E.11684
G2 X78.402 Y79.956 I.097 J2.092 E.027
G1 X78.402 Y76.762 E.04507
M204 S10000
G1 X78.051 Y76.463 F42000
G1 F18000
M204 S6000
G1 X78.113 Y76.383 E.00143
G3 X78.426 Y76.269 I.297 J.326 E.00483
G1 X101.63 Y76.27 E.32736
G3 X102.029 Y76.679 I-.038 J.436 E.00878
G1 X102.031 Y103.273 E.3752
G3 X101.574 Y103.731 I-.441 J.016 E.01025
G1 X78.427 Y103.731 E.32656
G3 X77.969 Y103.274 I-.015 J-.443 E.01024
G1 X77.969 Y76.692 E.37502
G3 X78.013 Y76.517 I.44 J.017 E.00256
G1 X78.016 Y76.512 E.00008
M204 S10000
G1 X77.713 Y76.181 F42000
G1 F18000
M204 S6000
G3 X78.416 Y75.836 I.694 J.526 E.01146
G1 X101.644 Y75.838 E.32771
G3 X102.462 Y76.658 I-.056 J.874 E.01786
G1 X102.464 Y103.284 E.37565
G3 X101.584 Y104.164 I-.877 J.003 E.01952
G1 X78.416 Y104.164 E.32686
G3 X77.536 Y103.284 I-.009 J-.871 E.01956
G1 X77.536 Y76.708 E.37494
G3 X77.678 Y76.23 I.871 J-.001 E.00714
M204 S250
G1 X77.364 Y75.948 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3420
M204 S5000
G1 X77.377 Y75.938 E.00021
G3 X78.405 Y75.418 I1.041 J.782 E.01568
G1 X101.658 Y75.42 E.30532
G3 X102.88 Y76.637 I-.075 J1.297 E.02476
G1 X102.882 Y102.695 E.34214
G3 X102.844 Y103.61 I-3.806 J.3 E.01205
G3 X101.595 Y104.582 I-1.245 J-.311 E.0224
G1 X79.005 Y104.582 E.2966
G3 X78.09 Y104.544 I-.3 J-3.807 E.01205
G3 X77.118 Y103.295 I.316 J-1.249 E.02238
G1 X77.118 Y77.303 E.34128
G3 X77.132 Y76.512 I4.793 J-.31 E.0104
G3 X77.245 Y76.154 I1.285 J.208 E.00495
G1 X77.334 Y76 E.00234
; WIPE_START
M204 S6000
G1 X77.377 Y75.938 E-.02851
G1 X77.539 Y75.75 E-.09438
G1 X77.741 Y75.601 E-.09541
G1 X77.971 Y75.492 E-.09646
G1 X78.143 Y75.445 E-.06809
G1 X78.405 Y75.418 E-.10011
G1 X79.134 Y75.418 E-.27704
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

G1 X78.575 Y77.694
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421518
G1 F18000
M204 S6000
G1 X79.212 Y77.057 E.01187
G1 X79.784 Y77.057 E.00754
G1 X78.757 Y78.084 E.01915
G1 X78.757 Y78.656 E.00754
G1 X80.356 Y77.057 E.02981
G1 X80.928 Y77.057 E.00754
G1 X79.015 Y78.969 E.03564
G3 X79.825 Y78.731 I1.042 J2.048 E.01119
G1 X81.499 Y77.057 E.03121
G1 X82.071 Y77.057 E.00754
G1 X80.392 Y78.736 E.0313
G1 X80.479 Y78.743 E.00115
G1 X80.852 Y78.848 E.00511
G1 X82.643 Y77.057 E.03338
G1 X83.215 Y77.057 E.00754
G1 X81.242 Y79.03 E.03676
G3 X81.577 Y79.266 I-.419 J.948 E.00544
G1 X83.787 Y77.057 E.04118
G1 X84.358 Y77.057 E.00754
G1 X81.863 Y79.552 E.04651
G3 X82.1 Y79.887 I-.711 J.754 E.00544
G1 X84.93 Y77.057 E.05275
G1 X85.502 Y77.057 E.00754
G1 X82.282 Y80.277 E.06001
G3 X82.395 Y80.736 I-1.079 J.508 E.00627
G1 X86.074 Y77.057 E.06857
G1 X86.646 Y77.057 E.00754
G1 X82.201 Y81.502 E.08285
; WIPE_START
G1 X83.615 Y80.088 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.185 Y80.699 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0870859
G1 F18000
M204 S6000
G3 X78.459 Y80.263 I4.507 J2.519 E.00117
M204 S10000
G1 X78.296 Y80.418 F42000
; LINE_WIDTH: 0.172574
G1 F18000
M204 S6000
G2 X78.254 Y80.705 I2.908 J.578 E.00147
; LINE_WIDTH: 0.136641
G2 X78.255 Y81.439 I5.35 J.357 E.00286
; LINE_WIDTH: 0.173405
G1 X78.296 Y81.711 E.0014
M204 S10000
G1 X78.458 Y81.867 F42000
; LINE_WIDTH: 0.0869608
G1 F18000
M204 S6000
G3 X78.185 Y81.43 I4.164 J-2.907 E.00117
; WIPE_START
G1 X78.458 Y81.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.575 Y83.412 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421518
G1 F18000
M204 S6000
G1 X78.891 Y83.097 E.00587
G1 X79.208 Y83.26 E.00471
G1 X79.279 Y83.28 E.00097
G1 X78.757 Y83.803 E.00974
G1 X78.757 Y84.374 E.00754
G1 X79.738 Y83.393 E.0183
G1 X80.128 Y83.422 E.00515
G1 X80.303 Y83.4 E.00232
G1 X78.757 Y84.946 E.02881
G1 X78.757 Y85.518 E.00754
G1 X87.217 Y77.057 E.1577
G1 X87.789 Y77.057 E.00754
G1 X78.757 Y86.09 E.16836
G1 X78.757 Y86.662 E.00754
G1 X88.361 Y77.057 E.17901
G1 X88.933 Y77.057 E.00754
G1 X78.757 Y87.234 E.18967
G1 X78.757 Y87.805 E.00754
G1 X89.505 Y77.058 E.20033
G1 X90.076 Y77.058 E.00754
G1 X78.757 Y88.377 E.21099
G1 X78.757 Y88.949 E.00754
G1 X90.648 Y77.058 E.22165
G1 X91.22 Y77.058 E.00754
G1 X78.757 Y89.521 E.2323
G1 X78.757 Y90.093 E.00754
G1 X91.792 Y77.058 E.24296
G1 X92.364 Y77.058 E.00754
G1 X78.757 Y90.665 E.25362
G1 X78.757 Y91.236 E.00754
G1 X92.935 Y77.058 E.26428
G1 X93.507 Y77.058 E.00754
G1 X78.757 Y91.808 E.27493
G1 X78.757 Y92.38 E.00754
G1 X94.079 Y77.058 E.28559
G1 X94.651 Y77.058 E.00754
G1 X78.757 Y92.952 E.29625
G1 X78.757 Y93.524 E.00754
G1 X95.223 Y77.058 E.30691
G1 X95.794 Y77.058 E.00754
G1 X78.757 Y94.096 E.31756
G1 X78.757 Y94.667 E.00754
G1 X96.366 Y77.058 E.32822
G1 X96.938 Y77.058 E.00754
G1 X78.757 Y95.239 E.33888
G1 X78.757 Y95.811 E.00754
G1 X97.51 Y77.058 E.34954
G1 X98.082 Y77.058 E.00754
G1 X78.757 Y96.383 E.3602
G1 X78.757 Y96.955 E.00754
G1 X98.653 Y77.058 E.37085
G1 X99.225 Y77.058 E.00754
G1 X78.757 Y97.527 E.38151
G1 X78.757 Y98.098 E.00754
G1 X99.797 Y77.058 E.39217
G1 X100.369 Y77.058 E.00754
G1 X78.757 Y98.67 E.40283
G1 X78.757 Y99.242 E.00754
G1 X100.941 Y77.058 E.41348
G1 X101.241 Y77.058 E.00397
G1 X101.242 Y77.329 E.00357
G1 X78.757 Y99.814 E.41909
G1 X78.757 Y100.386 E.00754
G1 X101.242 Y77.901 E.41909
G1 X101.242 Y78.473 E.00754
G1 X78.757 Y100.958 E.4191
G1 X78.757 Y101.529 E.00754
G1 X101.242 Y79.045 E.4191
G1 X101.242 Y79.616 E.00754
G1 X78.757 Y102.101 E.4191
G1 X78.757 Y102.673 E.00754
G1 X101.242 Y80.188 E.4191
M73 P7 R15
G1 X101.242 Y80.76 E.00754
G1 X79.058 Y102.943 E.41347
G1 X79.63 Y102.943 E.00754
G1 X101.242 Y81.332 E.40282
G1 X101.242 Y81.904 E.00754
G1 X80.202 Y102.943 E.39216
G1 X80.774 Y102.943 E.00754
G1 X101.242 Y82.475 E.3815
M73 P7 R14
G1 X101.242 Y83.047 E.00754
G1 X81.346 Y102.943 E.37084
G1 X81.918 Y102.943 E.00754
G1 X101.242 Y83.619 E.36019
G1 X101.242 Y84.191 E.00754
G1 X82.489 Y102.943 E.34953
G1 X83.061 Y102.943 E.00754
G1 X101.242 Y84.763 E.33887
G1 X101.242 Y85.334 E.00754
G1 X83.633 Y102.943 E.32821
G1 X84.205 Y102.943 E.00754
G1 X101.242 Y85.906 E.31755
G1 X101.242 Y86.478 E.00754
G1 X84.777 Y102.943 E.3069
G1 X85.349 Y102.943 E.00754
G1 X101.242 Y87.05 E.29624
G1 X101.242 Y87.622 E.00754
G1 X85.92 Y102.943 E.28558
G1 X86.492 Y102.943 E.00754
G1 X101.242 Y88.193 E.27492
G1 X101.242 Y88.765 E.00754
G1 X87.064 Y102.943 E.26427
G1 X87.636 Y102.943 E.00754
G1 X101.242 Y89.337 E.25361
G1 X101.242 Y89.909 E.00754
G1 X88.208 Y102.943 E.24295
G1 X88.78 Y102.943 E.00754
G1 X101.242 Y90.481 E.23229
G1 X101.242 Y91.052 E.00754
G1 X89.352 Y102.943 E.22164
G1 X89.923 Y102.943 E.00754
G1 X101.242 Y91.624 E.21098
G1 X101.243 Y92.196 E.00754
G1 X90.495 Y102.943 E.20032
G1 X91.067 Y102.943 E.00754
G1 X101.243 Y92.768 E.18966
G1 X101.243 Y93.34 E.00754
G1 X91.639 Y102.943 E.179
G1 X92.211 Y102.943 E.00754
G1 X101.243 Y93.911 E.16835
G1 X101.243 Y94.483 E.00754
G1 X92.783 Y102.943 E.15769
G1 X93.354 Y102.943 E.00754
G1 X101.243 Y95.055 E.14703
G1 X101.243 Y95.627 E.00754
G1 X93.926 Y102.943 E.13637
G1 X94.498 Y102.943 E.00754
G1 X101.243 Y96.199 E.12572
G1 X101.243 Y96.77 E.00754
G1 X95.07 Y102.943 E.11506
G1 X95.642 Y102.943 E.00754
G1 X101.243 Y97.342 E.1044
G1 X101.243 Y97.914 E.00754
G1 X96.214 Y102.943 E.09374
G1 X96.785 Y102.943 E.00754
G1 X101.243 Y98.486 E.08308
G1 X101.243 Y99.058 E.00754
G1 X97.357 Y102.943 E.07243
G1 X97.929 Y102.943 E.00754
G1 X101.243 Y99.629 E.06177
G1 X101.243 Y100.201 E.00754
G1 X98.501 Y102.943 E.05111
G1 X99.073 Y102.943 E.00754
G1 X101.243 Y100.773 E.04045
G1 X101.243 Y101.345 E.00754
G1 X99.645 Y102.943 E.0298
G1 X100.216 Y102.943 E.00754
G1 X101.243 Y101.917 E.01914
G1 X101.243 Y102.488 E.00754
G1 X100.607 Y103.125 E.01186
; CHANGE_LAYER
; Z_HEIGHT: 0.44
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X101.243 Y102.488 E-.34191
G1 X101.243 Y101.917 E-.21728
G1 X100.87 Y102.29 E-.20081
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/99
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I.829 J-.891 P1  F42000
G1 X78.601 Y81.588 Z.76
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15043
M204 S6000
G1 X78.537 Y81.374 E.00314
G3 X79.721 Y79.538 I1.532 J-.311 E.03412
G1 X80.031 Y79.5 E.0044
G3 X78.63 Y81.672 I.039 J1.563 E.09569
G1 X78.62 Y81.645 E.00041
M204 S10000
G1 X79.014 Y81.46 F42000
G1 F15043
M204 S6000
G1 X78.964 Y81.288 E.00253
G3 X79.818 Y79.962 I1.106 J-.225 E.02464
G1 X80.042 Y79.934 E.00318
G3 X79.036 Y81.516 I.028 J1.128 E.06885
M204 S250
G1 X79.414 Y81.337 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X79.374 Y81.205 E.00181
G3 X79.912 Y80.372 I.696 J-.142 E.01442
G1 X80.052 Y80.354 E.00186
G3 X79.44 Y81.391 I.018 J.71 E.03969
; WIPE_START
M204 S6000
G1 X79.374 Y81.205 E-.0749
G1 X79.359 Y81.065 E-.05372
G1 X79.373 Y80.924 E-.05377
G1 X79.415 Y80.789 E-.05386
G1 X79.481 Y80.667 E-.05278
G1 X79.655 Y80.488 E-.09479
G1 X79.778 Y80.417 E-.05381
G1 X79.912 Y80.372 E-.05371
G1 X80.052 Y80.354 E-.05385
G1 X80.194 Y80.365 E-.05385
G1 X80.33 Y80.403 E-.0538
G1 X80.456 Y80.468 E-.05382
G1 X80.566 Y80.555 E-.05332
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.393 Y76.693 Z.84 F42000
G1 Z.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15043
M204 S6000
G1 X101.605 Y76.695 E.32747
G1 X101.607 Y103.307 E.37543
G1 X78.393 Y103.307 E.32749
G1 X78.393 Y82.164 E.29828
G2 X82.044 Y81.382 I1.67 J-1.116 E.06759
G2 X78.902 Y79.44 I-1.975 J-.317 E.06639
G1 X78.393 Y79.889 E.00957
G1 X78.393 Y76.753 E.04424
M204 S10000
G1 X78.07 Y76.415 F42000
G1 F15043
M204 S6000
G3 X78.426 Y76.261 I.34 J.294 E.00567
G1 X101.621 Y76.262 E.32724
G3 X102.038 Y76.679 I-.031 J.447 E.00906
G1 X102.039 Y103.274 E.3752
G3 X101.574 Y103.739 I-.449 J.017 E.01043
G1 X78.427 Y103.739 E.32656
G3 X77.961 Y103.274 I-.017 J-.449 E.01043
G1 X77.961 Y76.727 E.37453
G3 X78.034 Y76.463 I.449 J-.017 E.00392
M204 S10000
G1 X77.681 Y76.209 F42000
G1 F15043
M204 S6000
G1 X77.751 Y76.122 E.00158
G3 X78.416 Y75.828 I.656 J.585 E.01058
G1 X101.643 Y75.83 E.32769
G3 X102.47 Y76.657 I-.048 J.876 E.01808
G1 X102.472 Y103.284 E.37566
G3 X101.584 Y104.172 I-.879 J.009 E.01973
G1 X78.416 Y104.172 E.32686
G3 X77.528 Y103.284 I-.009 J-.879 E.01973
G1 X77.528 Y76.716 E.37483
G3 X77.65 Y76.26 I.879 J-.009 E.00674
M204 S250
G1 X77.35 Y75.955 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X77.445 Y75.838 E.00198
G3 X78.405 Y75.41 I.964 J.871 E.01421
G1 X101.663 Y75.412 E.30538
G3 X102.888 Y76.637 I-.072 J1.297 E.0249
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.299 J-.003 E.0267
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.003 J-1.299 E.0267
G1 X77.11 Y76.705 E.34912
G3 X77.317 Y76.005 I1.299 J.003 E.00972
; WIPE_START
M204 S6000
G1 X77.445 Y75.838 E-.08004
G1 X77.632 Y75.664 E-.097
G1 X77.849 Y75.534 E-.09601
G1 X78.146 Y75.435 E-.11903
G1 X78.405 Y75.41 E-.09911
G1 X79.113 Y75.41 E-.26881
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

G1 X78.567 Y78.855
G1 Z.44
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421758
G1 F15043
M204 S6000
G1 X78.801 Y79.089 E.00436
G1 X79.101 Y78.916 E.00456
G1 X79.175 Y78.891 E.00104
G1 X78.749 Y78.464 E.00795
G1 X78.749 Y77.892 E.00755
G1 X79.614 Y78.758 E.01614
G1 X80.011 Y78.708 E.00528
G1 X80.147 Y78.718 E.00179
G1 X78.749 Y77.32 E.02608
G1 X78.749 Y77.049 E.00358
G1 X79.05 Y77.049 E.00397
G1 X81.226 Y79.225 E.04058
; WIPE_START
G1 F18000
G1 X79.811 Y77.81 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.177 Y80.573 Z.84 F42000
G1 Z.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.187065
G1 F15043
M204 S6000
G3 X78.428 Y80.234 I3.456 J2.298 E.00233
; LINE_WIDTH: 0.130583
G1 X78.504 Y80.138 E.00046
; LINE_WIDTH: 0.0909752
G1 X78.581 Y80.042 E.0003
M204 S10000
G1 X78.318 Y80.244 F42000
; LINE_WIDTH: 0.226278
G1 F15043
M204 S6000
G1 X78.285 Y80.467 E.00154
; LINE_WIDTH: 0.184355
G2 X78.25 Y80.704 I2.355 J.469 E.00131
; LINE_WIDTH: 0.144773
G2 X78.251 Y81.44 I5.347 J.358 E.00306
; LINE_WIDTH: 0.179931
G1 X78.291 Y81.706 E.00143
M204 S10000
G1 X78.459 Y81.867 F42000
; LINE_WIDTH: 0.0872337
G1 F15043
M204 S6000
G3 X78.177 Y81.417 I4.389 J-3.06 E.00121
; WIPE_START
G1 F18000
G1 X78.459 Y81.867 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.61 Y82.781 Z.84 F42000
G1 Z.44
G1 E.8 F1800
; LINE_WIDTH: 0.0830793
G1 F15043
M204 S6000
G1 X78.753 Y82.869 E.00036
M204 S10000
G1 X79.386 Y103.133 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421758
G1 F15043
M204 S6000
G1 X78.749 Y102.496 E.01188
G1 X78.749 Y101.923 E.00755
G1 X79.777 Y102.951 E.01917
G1 X80.349 Y102.951 E.00755
G1 X78.749 Y101.351 E.02984
G1 X78.749 Y100.779 E.00755
G1 X80.921 Y102.951 E.04051
G1 X81.493 Y102.951 E.00755
G1 X78.749 Y100.207 E.05119
G1 X78.749 Y99.635 E.00755
G1 X82.065 Y102.951 E.06186
G1 X82.637 Y102.951 E.00755
G1 X78.749 Y99.063 E.07253
G1 X78.749 Y98.49 E.00755
G1 X83.21 Y102.951 E.0832
G1 X83.782 Y102.951 E.00755
G1 X78.749 Y97.918 E.09387
G1 X78.749 Y97.346 E.00755
G1 X84.354 Y102.951 E.10454
G1 X84.926 Y102.951 E.00755
G1 X78.749 Y96.774 E.11521
G1 X78.749 Y96.202 E.00755
G1 X85.498 Y102.951 E.12588
G1 X86.071 Y102.951 E.00755
G1 X78.749 Y95.629 E.13655
G1 X78.749 Y95.057 E.00755
G1 X86.643 Y102.951 E.14723
G1 X87.215 Y102.951 E.00755
G1 X78.749 Y94.485 E.1579
M73 P8 R14
G1 X78.749 Y93.913 E.00755
G1 X87.787 Y102.951 E.16857
G1 X88.359 Y102.951 E.00755
G1 X78.749 Y93.341 E.17924
G1 X78.749 Y92.769 E.00755
G1 X88.931 Y102.951 E.18991
G1 X89.504 Y102.951 E.00755
G1 X78.749 Y92.196 E.20058
G1 X78.749 Y91.624 E.00755
G1 X90.076 Y102.951 E.21125
G1 X90.648 Y102.951 E.00755
G1 X78.749 Y91.052 E.22192
G1 X78.749 Y90.48 E.00755
G1 X91.22 Y102.951 E.23259
G1 X91.792 Y102.951 E.00755
G1 X78.749 Y89.908 E.24327
G1 X78.749 Y89.336 E.00755
G1 X92.364 Y102.951 E.25394
G1 X92.937 Y102.951 E.00755
G1 X78.749 Y88.763 E.26461
G1 X78.749 Y88.191 E.00755
G1 X93.509 Y102.951 E.27528
G1 X94.081 Y102.951 E.00755
G1 X78.749 Y87.619 E.28595
G1 X78.749 Y87.047 E.00755
G1 X94.653 Y102.951 E.29662
G1 X95.225 Y102.951 E.00755
G1 X78.749 Y86.475 E.30729
G1 X78.749 Y85.902 E.00755
G1 X95.798 Y102.951 E.31796
G1 X96.37 Y102.951 E.00755
G1 X78.749 Y85.33 E.32863
G1 X78.749 Y84.758 E.00755
G1 X96.942 Y102.951 E.33931
G1 X97.514 Y102.951 E.00755
G1 X78.749 Y84.186 E.34998
G1 X78.749 Y83.614 E.00755
G1 X98.086 Y102.951 E.36065
G1 X98.658 Y102.951 E.00755
G1 X78.944 Y83.237 E.36767
G1 X79.001 Y83.145 E.00143
G1 X79.245 Y83.27 E.00362
G1 X79.667 Y83.387 E.00577
G1 X99.231 Y102.951 E.36487
G1 X99.803 Y102.951 E.00755
G1 X80.257 Y83.406 E.36452
G2 X80.739 Y83.315 I.016 J-1.237 E.0065
G1 X100.375 Y102.951 E.36621
G1 X100.947 Y102.951 E.00755
G1 X81.148 Y83.152 E.36926
G1 X81.5 Y82.932 E.00548
G1 X101.251 Y102.683 E.36836
G1 X101.251 Y102.111 E.00755
G1 X81.803 Y82.663 E.36271
G1 X82.049 Y82.337 E.00539
G1 X101.251 Y101.539 E.35811
G1 X101.251 Y100.967 E.00755
G1 X82.243 Y81.959 E.3545
G1 X82.286 Y81.872 E.00128
G1 X82.376 Y81.519 E.0048
G1 X101.251 Y100.395 E.35203
G1 X101.251 Y99.822 E.00755
G1 X82.421 Y80.992 E.35119
G2 X82.284 Y80.283 I-1.828 J-.015 E.00958
G1 X101.251 Y99.25 E.35374
G1 X101.251 Y98.678 E.00755
G1 X79.622 Y77.049 E.40339
G1 X80.194 Y77.049 E.00755
G1 X101.251 Y98.106 E.39271
G1 X101.251 Y97.534 E.00755
G1 X80.766 Y77.049 E.38204
G1 X81.338 Y77.049 E.00755
G1 X101.251 Y96.961 E.37137
G1 X101.251 Y96.389 E.00755
G1 X81.911 Y77.049 E.3607
G1 X82.483 Y77.049 E.00755
G1 X101.251 Y95.817 E.35002
G1 X101.251 Y95.245 E.00755
G1 X83.055 Y77.049 E.33935
G1 X83.627 Y77.049 E.00755
G1 X101.251 Y94.672 E.32868
G1 X101.251 Y94.1 E.00755
G1 X84.2 Y77.049 E.31801
G1 X84.772 Y77.049 E.00755
G1 X101.251 Y93.528 E.30733
G1 X101.251 Y92.956 E.00755
G1 X85.344 Y77.049 E.29666
G1 X85.916 Y77.049 E.00755
G1 X101.251 Y92.384 E.28599
G1 X101.251 Y91.811 E.00755
G1 X86.488 Y77.049 E.27531
G1 X87.061 Y77.049 E.00755
G1 X101.251 Y91.239 E.26464
G1 X101.251 Y90.667 E.00755
G1 X87.633 Y77.049 E.25397
G1 X88.205 Y77.049 E.00755
G1 X101.25 Y90.095 E.2433
G1 X101.25 Y89.523 E.00755
G1 X88.777 Y77.049 E.23262
G1 X89.35 Y77.049 E.00755
G1 X101.25 Y88.95 E.22195
G1 X101.25 Y88.378 E.00755
G1 X89.922 Y77.05 E.21128
G1 X90.494 Y77.05 E.00755
G1 X101.25 Y87.806 E.20061
G1 X101.25 Y87.234 E.00755
G1 X91.066 Y77.05 E.18993
G1 X91.638 Y77.05 E.00755
G1 X101.25 Y86.661 E.17926
G1 X101.25 Y86.089 E.00755
G1 X92.211 Y77.05 E.16859
G1 X92.783 Y77.05 E.00755
G1 X101.25 Y85.517 E.15791
G1 X101.25 Y84.945 E.00755
G1 X93.355 Y77.05 E.14724
G1 X93.927 Y77.05 E.00755
G1 X101.25 Y84.373 E.13657
G1 X101.25 Y83.8 E.00755
G1 X94.5 Y77.05 E.1259
G1 X95.072 Y77.05 E.00755
G1 X101.25 Y83.228 E.11522
G1 X101.25 Y82.656 E.00755
G1 X95.644 Y77.05 E.10455
G1 X96.216 Y77.05 E.00755
G1 X101.25 Y82.084 E.09388
G1 X101.25 Y81.511 E.00755
G1 X96.788 Y77.05 E.08321
G1 X97.361 Y77.05 E.00755
G1 X101.25 Y80.939 E.07253
G1 X101.25 Y80.367 E.00755
G1 X97.933 Y77.05 E.06186
G1 X98.505 Y77.05 E.00755
G1 X101.25 Y79.795 E.05119
G1 X101.25 Y79.223 E.00755
G1 X99.077 Y77.05 E.04052
G1 X99.65 Y77.05 E.00755
G1 X101.25 Y78.65 E.02984
G1 X101.25 Y78.078 E.00755
G1 X100.222 Y77.05 E.01917
G1 X100.794 Y77.05 E.00755
G1 X101.431 Y77.687 E.01188
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X100.794 Y77.05 E-.34226
G1 X100.222 Y77.05 E-.21744
G1 X100.595 Y77.423 E-.20029
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/99
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.84 I-.235 J-1.194 P1  F42000
G1 X78.671 Y81.744 Z.84
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14966
M204 S6000
G1 X78.621 Y81.647 E.00154
G3 X79.782 Y79.527 I1.449 J-.584 E.03897
G1 X80.043 Y79.5 E.0037
G3 X78.796 Y81.966 I.027 J1.562 E.09068
G1 X78.701 Y81.796 E.00275
M204 S10000
G1 X79.01 Y81.434 F42000
G1 F14966
M204 S6000
G1 X78.947 Y81.177 E.00373
G3 X79.864 Y79.954 I1.123 J-.113 E.02369
G1 X80.049 Y79.935 E.00263
G3 X79.026 Y81.492 I.021 J1.129 E.06916
M204 S250
G1 X79.415 Y81.339 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X79.414 Y81.335 E.00004
G3 X79.942 Y80.366 I.656 J-.271 E.01661
G1 X80.055 Y80.354 E.00148
G3 X79.487 Y81.469 I.016 J.71 E.03848
G1 X79.444 Y81.391 E.00117
; WIPE_START
M204 S6000
G1 X79.414 Y81.335 E-.024
G1 X79.363 Y81.135 E-.07843
G1 X79.375 Y80.919 E-.08243
G1 X79.415 Y80.789 E-.05165
M73 P9 R14
G1 X79.483 Y80.664 E-.05396
G1 X79.574 Y80.556 E-.05374
G1 X79.684 Y80.468 E-.05377
G1 X79.81 Y80.403 E-.05381
G1 X79.942 Y80.366 E-.05214
G1 X80.055 Y80.354 E-.04293
G1 X80.188 Y80.364 E-.05084
G1 X80.334 Y80.405 E-.05773
G1 X80.456 Y80.468 E-.0518
G1 X80.564 Y80.554 E-.05278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.393 Y76.693 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14966
M204 S6000
G1 X101.605 Y76.694 E.32747
G1 X101.607 Y103.307 E.37546
G1 X78.393 Y103.307 E.32749
G1 X78.393 Y82.164 E.29828
G2 X82.02 Y81.498 I1.669 J-1.117 E.0659
G2 X78.673 Y79.632 I-1.957 J-.424 E.07207
G1 X78.393 Y79.965 E.00614
G1 X78.393 Y76.753 E.04532
M204 S10000
G1 X78.074 Y76.416 F42000
G1 F14966
M204 S6000
G1 X78.092 Y76.392 E.00041
G3 X78.427 Y76.261 I.318 J.318 E.00522
G1 X101.574 Y76.261 E.32657
G3 X102.038 Y76.679 I.021 J.442 E.00977
G1 X102.039 Y103.309 E.3757
G3 X101.573 Y103.739 I-.447 J-.017 E.00994
G1 X78.391 Y103.739 E.32706
G3 X77.961 Y103.274 I.017 J-.447 E.00994
G1 X77.961 Y76.727 E.37453
G3 X77.989 Y76.553 I.449 J-.017 E.0025
G1 X78.042 Y76.466 E.00144
M204 S10000
G1 X77.679 Y76.218 F42000
G1 F14966
M204 S6000
G3 X78.416 Y75.828 I.734 J.495 E.01225
G1 X101.585 Y75.828 E.32687
G3 X102.47 Y76.657 I.003 J.884 E.01887
G1 X102.472 Y103.291 E.37576
G3 X101.584 Y104.172 I-.884 J-.004 E.0196
G1 X78.408 Y104.172 E.32697
G3 X77.528 Y103.284 I.004 J-.884 E.01959
G1 X77.528 Y76.716 E.37483
G3 X77.647 Y76.269 I.885 J-.003 E.0066
M204 S250
G1 X77.346 Y75.96 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X77.492 Y75.793 E.00292
G3 X78.405 Y75.41 I.924 J.923 E.01333
G1 X101.595 Y75.41 E.30449
G3 X102.888 Y76.637 I-.011 J1.307 E.02575
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G3 X77.316 Y76.012 I1.306 J.011 E.00962
; WIPE_START
M204 S6000
G1 X77.492 Y75.793 E-.10699
G1 X77.736 Y75.594 E-.11949
G1 X77.965 Y75.486 E-.0963
G1 X78.213 Y75.424 E-.09687
G1 X78.405 Y75.41 E-.07341
G1 X79.108 Y75.41 E-.26695
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

G1 X78.567 Y77.686
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421788
G1 F14966
M204 S6000
G1 X79.204 Y77.049 E.01188
G1 X79.777 Y77.049 E.00755
G1 X78.749 Y78.077 E.01917
G1 X78.749 Y78.649 E.00755
G1 X80.349 Y77.049 E.02985
G1 X80.921 Y77.049 E.00755
G1 X78.985 Y78.985 E.03611
G1 X79.208 Y78.87 E.00331
G1 X79.634 Y78.75 E.00584
G1 X79.81 Y78.732 E.00233
G1 X81.493 Y77.049 E.0314
G1 X82.066 Y77.049 E.00755
G1 X80.379 Y78.735 E.03146
G3 X80.84 Y78.847 I-.377 J2.572 E.00626
G1 X82.638 Y77.049 E.03354
G1 X83.21 Y77.049 E.00755
G1 X81.234 Y79.025 E.03686
G3 X81.57 Y79.261 I-.413 J.948 E.00546
G1 X83.782 Y77.049 E.04126
G1 X84.354 Y77.049 E.00755
G1 X81.858 Y79.545 E.04657
G3 X82.096 Y79.879 I-.707 J.756 E.00545
G1 X84.927 Y77.049 E.0528
G1 X85.499 Y77.049 E.00755
G1 X82.279 Y80.268 E.06005
G1 X82.381 Y80.598 E.00455
G1 X82.394 Y80.726 E.00169
G1 X86.071 Y77.049 E.06858
G1 X86.643 Y77.049 E.00755
G1 X82.195 Y81.497 E.08297
; WIPE_START
G1 F18000
G1 X83.609 Y80.083 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.177 Y80.713 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0873537
G1 F14966
M204 S6000
G3 X78.459 Y80.262 I4.583 J2.551 E.00122
M204 S10000
G1 X78.291 Y80.424 F42000
; LINE_WIDTH: 0.184397
G1 F14966
M204 S6000
G2 X78.255 Y80.669 I3.206 J.603 E.00135
; LINE_WIDTH: 0.147391
G1 X78.234 Y81.067 E.00169
G1 X78.256 Y81.472 E.00172
; LINE_WIDTH: 0.18486
G1 X78.291 Y81.706 E.00129
M204 S10000
G1 X78.46 Y81.87 F42000
; LINE_WIDTH: 0.0980295
G1 F14966
M204 S6000
G3 X78.177 Y81.405 I6.006 J-3.967 E.00143
; WIPE_START
G1 F18000
G1 X78.46 Y81.87 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.567 Y83.408 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421788
G1 F14966
M204 S6000
G1 X78.882 Y83.093 E.00588
G1 X79.175 Y83.243 E.00433
G1 X79.276 Y83.271 E.00139
G1 X78.749 Y83.799 E.00984
G1 X78.749 Y84.371 E.00755
G1 X79.728 Y83.392 E.01826
G1 X80.129 Y83.422 E.00531
G1 X80.29 Y83.402 E.00214
G1 X78.749 Y84.943 E.02875
G1 X78.749 Y85.516 E.00755
G1 X87.215 Y77.049 E.15792
G1 X87.788 Y77.049 E.00755
G1 X78.749 Y86.088 E.16859
G1 X78.749 Y86.66 E.00755
G1 X88.36 Y77.049 E.17927
G1 X88.932 Y77.049 E.00755
G1 X78.749 Y87.232 E.18994
G1 X78.749 Y87.804 E.00755
G1 X89.504 Y77.049 E.20061
G1 X90.077 Y77.049 E.00755
G1 X78.749 Y88.377 E.21128
G1 X78.749 Y88.949 E.00755
G1 X90.649 Y77.049 E.22196
G1 X91.221 Y77.049 E.00755
G1 X78.749 Y89.521 E.23263
G1 X78.749 Y90.093 E.00755
G1 X91.793 Y77.049 E.2433
G1 X92.365 Y77.049 E.00755
G1 X78.749 Y90.665 E.25397
G1 X78.749 Y91.238 E.00755
G1 X92.938 Y77.049 E.26465
G1 X93.51 Y77.049 E.00755
G1 X78.749 Y91.81 E.27532
G1 X78.749 Y92.382 E.00755
G1 X94.082 Y77.049 E.28599
G1 X94.654 Y77.049 E.00755
G1 X78.749 Y92.954 E.29666
G1 X78.749 Y93.527 E.00755
G1 X95.227 Y77.049 E.30734
G1 X95.799 Y77.049 E.00755
G1 X78.749 Y94.099 E.31801
G1 X78.749 Y94.671 E.00755
G1 X96.371 Y77.049 E.32868
G1 X96.943 Y77.049 E.00755
G1 X78.749 Y95.243 E.33936
G1 X78.749 Y95.815 E.00755
G1 X97.515 Y77.049 E.35003
G1 X98.088 Y77.049 E.00755
G1 X78.749 Y96.388 E.3607
G1 X78.749 Y96.96 E.00755
G1 X98.66 Y77.049 E.37137
G1 X99.232 Y77.049 E.00755
G1 X78.749 Y97.532 E.38205
G1 X78.749 Y98.104 E.00755
G1 X99.804 Y77.049 E.39272
G1 X100.376 Y77.049 E.00755
G1 X78.749 Y98.677 E.40339
G1 X78.749 Y99.249 E.00755
G1 X100.949 Y77.049 E.41406
G1 X101.25 Y77.049 E.00397
G1 X101.25 Y77.32 E.00358
G1 X78.749 Y99.821 E.41968
G1 X78.749 Y100.393 E.00755
G1 X101.25 Y77.892 E.41968
G1 X101.25 Y78.464 E.00755
G1 X78.749 Y100.965 E.41968
G1 X78.749 Y101.538 E.00755
G1 X101.25 Y79.036 E.41968
G1 X101.25 Y79.609 E.00755
G1 X78.749 Y102.11 E.41968
G1 X78.749 Y102.682 E.00755
G1 X101.25 Y80.181 E.41968
G1 X101.25 Y80.753 E.00755
G1 X79.051 Y102.951 E.41403
G1 X79.624 Y102.951 E.00755
G1 X101.25 Y81.325 E.40336
G1 X101.25 Y81.897 E.00755
G1 X80.196 Y102.951 E.39269
G1 X80.768 Y102.951 E.00755
G1 X101.25 Y82.47 E.38202
G1 X101.25 Y83.042 E.00755
G1 X81.34 Y102.951 E.37134
G1 X81.913 Y102.951 E.00755
G1 X101.25 Y83.614 E.36067
G1 X101.25 Y84.186 E.00755
G1 X82.485 Y102.951 E.35
G1 X83.057 Y102.951 E.00755
M73 P10 R14
G1 X101.25 Y84.758 E.33933
G1 X101.25 Y85.33 E.00755
G1 X83.629 Y102.951 E.32866
G1 X84.201 Y102.951 E.00755
G1 X101.25 Y85.903 E.31798
G1 X101.25 Y86.475 E.00755
G1 X84.774 Y102.951 E.30731
G1 X85.346 Y102.951 E.00755
G1 X101.25 Y87.047 E.29664
G1 X101.25 Y87.619 E.00755
G1 X85.918 Y102.951 E.28597
G1 X86.49 Y102.951 E.00755
G1 X101.25 Y88.191 E.2753
G1 X101.25 Y88.764 E.00755
G1 X87.063 Y102.951 E.26462
G1 X87.635 Y102.951 E.00755
G1 X101.25 Y89.336 E.25395
G1 X101.25 Y89.908 E.00755
G1 X88.207 Y102.951 E.24328
G1 X88.779 Y102.951 E.00755
G1 X101.251 Y90.48 E.23261
G1 X101.251 Y91.052 E.00755
G1 X89.351 Y102.951 E.22194
G1 X89.924 Y102.951 E.00755
G1 X101.251 Y91.624 E.21126
G1 X101.251 Y92.197 E.00755
G1 X90.496 Y102.951 E.20059
G1 X91.068 Y102.951 E.00755
G1 X101.251 Y92.769 E.18992
G1 X101.251 Y93.341 E.00755
G1 X91.64 Y102.951 E.17925
G1 X92.213 Y102.951 E.00755
G1 X101.251 Y93.913 E.16858
G1 X101.251 Y94.485 E.00755
G1 X92.785 Y102.951 E.1579
G1 X93.357 Y102.951 E.00755
G1 X101.251 Y95.058 E.14723
G1 X101.251 Y95.63 E.00755
G1 X93.929 Y102.951 E.13656
G1 X94.501 Y102.951 E.00755
G1 X101.251 Y96.202 E.12589
G1 X101.251 Y96.774 E.00755
G1 X95.074 Y102.951 E.11522
G1 X95.646 Y102.951 E.00755
G1 X101.251 Y97.346 E.10454
G1 X101.251 Y97.918 E.00755
G1 X96.218 Y102.951 E.09387
G1 X96.79 Y102.951 E.00755
G1 X101.251 Y98.491 E.0832
G1 X101.251 Y99.063 E.00755
G1 X97.362 Y102.951 E.07253
G1 X97.935 Y102.951 E.00755
G1 X101.251 Y99.635 E.06186
G1 X101.251 Y100.207 E.00755
G1 X98.507 Y102.951 E.05118
G1 X99.079 Y102.951 E.00755
G1 X101.251 Y100.779 E.04051
G1 X101.251 Y101.352 E.00755
G1 X99.651 Y102.951 E.02984
G1 X100.224 Y102.951 E.00755
G1 X101.251 Y101.924 E.01917
G1 X101.251 Y102.496 E.00755
G1 X100.615 Y103.133 E.01188
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X101.251 Y102.496 E-.34222
G1 X101.251 Y101.924 E-.21742
G1 X100.878 Y102.297 E-.20036
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/99
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I.828 J-.892 P1  F42000
G1 X78.621 Y81.64 Z.92
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15044
M204 S6000
G1 X78.567 Y81.475 E.00245
G3 X79.876 Y79.515 I1.508 J-.41 E.03766
G3 X80.92 Y79.749 I.204 J1.53 E.01541
G3 X78.666 Y81.741 I-.844 J1.316 E.0815
G1 X78.646 Y81.695 E.0007
M204 S10000
G1 X79.028 Y81.492 F42000
G1 F15044
M204 S6000
G1 X78.989 Y81.357 E.00199
G3 X79.93 Y79.945 I1.089 J-.294 E.02709
G1 X80.058 Y79.936 E.00181
G3 X79.061 Y81.551 I.02 J1.128 E.06814
G1 X79.057 Y81.545 E.0001
M204 S250
G1 X79.421 Y81.35 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X79.387 Y81.245 E.00145
G3 X79.982 Y80.36 I.686 J-.181 E.01584
G1 X80.058 Y80.355 E.001
G3 X79.449 Y81.402 I.015 J.709 E.03943
; WIPE_START
M204 S6000
G1 X79.387 Y81.245 E-.06446
G1 X79.36 Y81.095 E-.05776
G1 X79.367 Y80.965 E-.04955
G1 X79.404 Y80.817 E-.05782
G1 X79.463 Y80.694 E-.05189
G1 X79.549 Y80.581 E-.05371
G1 X79.655 Y80.488 E-.05382
G1 X79.778 Y80.417 E-.05384
G1 X79.982 Y80.36 E-.08056
G1 X80.058 Y80.355 E-.02889
G1 X80.194 Y80.365 E-.05184
G1 X80.33 Y80.403 E-.05374
G1 X80.456 Y80.468 E-.05378
G1 X80.555 Y80.547 E-.04833
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.393 Y76.693 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15044
M204 S6000
G1 X101.605 Y76.694 E.32747
G1 X101.607 Y103.307 E.37546
G1 X78.393 Y103.307 E.32749
G1 X78.393 Y82.185 E.29799
G1 X78.729 Y82.548 E.00698
G2 X78.902 Y79.441 I1.336 J-1.484 E.12671
G1 X78.393 Y79.889 E.00957
G1 X78.393 Y76.753 E.04424
M204 S10000
G1 X78.072 Y76.419 F42000
G1 F15044
M204 S6000
G1 X78.092 Y76.392 E.00047
G3 X78.427 Y76.261 I.318 J.318 E.00522
G1 X101.575 Y76.261 E.32658
G3 X102.038 Y76.679 I.021 J.442 E.00976
G1 X102.039 Y103.274 E.3752
G3 X101.573 Y103.739 I-.449 J.017 E.01043
G1 X78.391 Y103.739 E.32705
G3 X77.961 Y103.273 I.017 J-.448 E.00994
G1 X77.961 Y76.727 E.37453
G3 X77.989 Y76.553 I.449 J-.017 E.0025
G1 X78.04 Y76.47 E.00138
M204 S10000
G1 X77.679 Y76.218 F42000
G1 F15044
M204 S6000
G3 X78.416 Y75.828 I.734 J.494 E.01225
G1 X101.586 Y75.828 E.32688
G3 X102.47 Y76.657 I.003 J.884 E.01886
G1 X102.472 Y103.284 E.37566
G3 X101.584 Y104.172 I-.885 J.003 E.0197
G1 X78.408 Y104.172 E.32697
G3 X77.528 Y103.284 I.004 J-.884 E.01959
G1 X77.528 Y76.716 E.37483
G3 X77.647 Y76.269 I.885 J-.003 E.0066
M204 S250
G1 X77.344 Y75.963 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X77.492 Y75.792 E.00297
G3 X78.405 Y75.41 I.923 J.923 E.01333
G1 X101.596 Y75.41 E.3045
G3 X102.888 Y76.637 I-.012 J1.307 E.02574
G1 X102.89 Y103.295 E.35002
G3 X101.595 Y104.59 I-1.306 J-.011 E.02666
G1 X78.403 Y104.59 E.30452
G3 X77.11 Y103.295 I.013 J-1.306 E.02662
G1 X77.11 Y76.705 E.34913
G3 X77.314 Y76.015 I1.306 J.011 E.00957
; WIPE_START
M204 S6000
G1 X77.492 Y75.792 E-.10839
G1 X77.737 Y75.594 E-.11971
G1 X77.965 Y75.486 E-.09609
G1 X78.212 Y75.424 E-.09653
G1 X78.405 Y75.41 E-.07372
G1 X79.104 Y75.41 E-.26556
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

G1 X78.567 Y78.854
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421768
G1 F15044
M204 S6000
G1 X78.802 Y79.088 E.00437
G1 X79.1 Y78.916 E.00454
G1 X79.176 Y78.89 E.00106
G1 X78.749 Y78.463 E.00797
G1 X78.749 Y77.891 E.00755
G1 X79.622 Y78.764 E.01629
G1 X80.049 Y78.711 E.00568
G1 X80.148 Y78.718 E.00131
G1 X78.749 Y77.319 E.0261
G1 X78.749 Y77.049 E.00356
G1 X79.051 Y77.049 E.00398
G1 X81.228 Y79.226 E.04061
; WIPE_START
G1 F18000
G1 X79.814 Y77.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.177 Y80.523 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0876108
G1 F15044
M204 S6000
G3 X78.596 Y80.031 I5.084 J3.913 E.00148
M204 S10000
G1 X78.565 Y80.027 F42000
; LINE_WIDTH: 0.225459
G1 F15044
M204 S6000
G2 X78.291 Y80.42 I5.2 J3.913 E.00326
; LINE_WIDTH: 0.231079
G1 X78.277 Y80.51 E.00064
; LINE_WIDTH: 0.202595
G1 X78.263 Y80.609 E.0006
; LINE_WIDTH: 0.166219
G1 X78.241 Y80.829 E.00107
; LINE_WIDTH: 0.139254
G1 X78.245 Y81.344 E.00205
; LINE_WIDTH: 0.175072
G2 X78.268 Y81.567 I2.963 J-.191 E.00115
; LINE_WIDTH: 0.203298
G1 X78.303 Y81.768 E.00124
M204 S10000
G1 X78.499 Y81.944 F42000
; LINE_WIDTH: 0.0867529
G1 F15044
M204 S6000
G3 X78.177 Y81.48 I4.467 J-3.446 E.00128
; WIPE_START
G1 F18000
G1 X78.499 Y81.944 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.61 Y82.783 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.0820755
G1 F15044
M204 S6000
G1 X78.754 Y82.868 E.00035
M204 S10000
G1 X79.386 Y103.133 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421768
G1 F15044
M204 S6000
G1 X78.749 Y102.495 E.01189
G1 X78.749 Y101.923 E.00755
G1 X79.777 Y102.951 E.01918
G1 X80.349 Y102.951 E.00755
G1 X78.749 Y101.351 E.02985
G1 X78.749 Y100.778 E.00755
G1 X80.922 Y102.951 E.04053
G1 X81.494 Y102.951 E.00755
G1 X78.749 Y100.206 E.0512
G1 X78.749 Y99.634 E.00755
G1 X82.066 Y102.951 E.06187
G1 X82.638 Y102.951 E.00755
G1 X78.749 Y99.062 E.07254
G1 X78.749 Y98.49 E.00755
G1 X83.21 Y102.951 E.08321
G1 X83.782 Y102.951 E.00755
G1 X78.749 Y97.918 E.09388
G1 X78.749 Y97.345 E.00755
G1 X84.355 Y102.951 E.10456
G1 X84.927 Y102.951 E.00755
G1 X78.749 Y96.773 E.11523
G1 X78.749 Y96.201 E.00755
G1 X85.499 Y102.951 E.1259
G1 X86.071 Y102.951 E.00755
G1 X78.749 Y95.629 E.13657
G1 X78.749 Y95.057 E.00755
G1 X86.643 Y102.951 E.14724
G1 X87.216 Y102.951 E.00755
G1 X78.749 Y94.484 E.15791
G1 X78.749 Y93.912 E.00755
G1 X87.788 Y102.951 E.16859
G1 X88.36 Y102.951 E.00755
G1 X78.749 Y93.34 E.17926
G1 X78.749 Y92.768 E.00755
G1 X88.932 Y102.951 E.18993
G1 X89.504 Y102.951 E.00755
G1 X78.749 Y92.196 E.2006
G1 X78.749 Y91.623 E.00755
G1 X90.077 Y102.951 E.21127
G1 X90.649 Y102.951 E.00755
G1 X78.749 Y91.051 E.22194
G1 X78.749 Y90.479 E.00755
G1 X91.221 Y102.951 E.23262
G1 X91.793 Y102.951 E.00755
G1 X78.749 Y89.907 E.24329
G1 X78.749 Y89.335 E.00755
G1 X92.365 Y102.951 E.25396
G1 X92.938 Y102.951 E.00755
G1 X78.749 Y88.762 E.26463
M73 P11 R14
G1 X78.749 Y88.19 E.00755
G1 X93.51 Y102.951 E.2753
G1 X94.082 Y102.951 E.00755
G1 X78.749 Y87.618 E.28597
G1 X78.749 Y87.046 E.00755
G1 X94.654 Y102.951 E.29665
G1 X95.226 Y102.951 E.00755
G1 X78.749 Y86.474 E.30732
G1 X78.749 Y85.902 E.00755
G1 X95.798 Y102.951 E.31799
G1 X96.371 Y102.951 E.00755
G1 X78.749 Y85.329 E.32866
G1 X78.749 Y84.757 E.00755
G1 X96.943 Y102.951 E.33933
G1 X97.515 Y102.951 E.00755
G1 X78.749 Y84.185 E.35
G1 X78.749 Y83.613 E.00755
G1 X98.087 Y102.951 E.36068
G1 X98.659 Y102.951 E.00755
G1 X78.947 Y83.238 E.36766
G1 X79.002 Y83.146 E.00142
G1 X79.245 Y83.27 E.00361
G1 X79.668 Y83.388 E.00578
G1 X99.232 Y102.951 E.36488
G1 X99.804 Y102.951 E.00755
G1 X80.258 Y83.406 E.36453
G2 X80.74 Y83.315 I.016 J-1.236 E.0065
G1 X100.376 Y102.951 E.36623
G1 X100.948 Y102.951 E.00755
G1 X81.148 Y83.152 E.36928
G2 X81.495 Y82.926 I-.384 J-.971 E.00549
G1 X101.251 Y102.682 E.36846
G1 X101.251 Y102.11 E.00755
G1 X81.799 Y82.658 E.36279
G1 X82.05 Y82.337 E.00538
G1 X101.251 Y101.538 E.35811
G1 X101.251 Y100.966 E.00755
G1 X82.244 Y81.958 E.35449
G1 X82.376 Y81.518 E.00606
G1 X101.251 Y100.393 E.35203
G1 X101.251 Y99.821 E.00755
G1 X82.421 Y80.991 E.3512
G2 X82.283 Y80.281 I-1.831 J-.014 E.00959
G1 X101.251 Y99.249 E.35376
G1 X101.251 Y98.677 E.00755
G1 X79.623 Y77.049 E.40338
G1 X80.195 Y77.049 E.00755
G1 X101.251 Y98.105 E.3927
G1 X101.251 Y97.532 E.00755
G1 X80.767 Y77.049 E.38203
G1 X81.34 Y77.049 E.00755
G1 X101.251 Y96.96 E.37136
G1 X101.251 Y96.388 E.00755
G1 X81.912 Y77.049 E.36069
G1 X82.484 Y77.049 E.00755
G1 X101.251 Y95.816 E.35001
G1 X101.251 Y95.243 E.00755
G1 X83.056 Y77.049 E.33934
G1 X83.628 Y77.049 E.00755
G1 X101.251 Y94.671 E.32867
G1 X101.251 Y94.099 E.00755
G1 X84.2 Y77.049 E.318
G1 X84.773 Y77.049 E.00755
G1 X101.251 Y93.527 E.30732
G1 X101.251 Y92.954 E.00755
G1 X85.345 Y77.049 E.29665
G1 X85.917 Y77.049 E.00755
G1 X101.251 Y92.382 E.28598
G1 X101.251 Y91.81 E.00755
G1 X86.489 Y77.049 E.27531
G1 X87.061 Y77.049 E.00755
G1 X101.251 Y91.238 E.26463
G1 X101.251 Y90.666 E.00755
G1 X87.634 Y77.049 E.25396
G1 X88.206 Y77.049 E.00755
G1 X101.25 Y90.093 E.24329
G1 X101.25 Y89.521 E.00755
G1 X88.778 Y77.049 E.23262
G1 X89.35 Y77.049 E.00755
G1 X101.25 Y88.949 E.22195
G1 X101.25 Y88.377 E.00755
G1 X89.922 Y77.049 E.21127
G1 X90.495 Y77.049 E.00755
G1 X101.25 Y87.804 E.2006
G1 X101.25 Y87.232 E.00755
G1 X91.067 Y77.049 E.18993
G1 X91.639 Y77.049 E.00755
G1 X101.25 Y86.66 E.17926
G1 X101.25 Y86.088 E.00755
G1 X92.211 Y77.049 E.16858
G1 X92.783 Y77.049 E.00755
G1 X101.25 Y85.515 E.15791
G1 X101.25 Y84.943 E.00755
G1 X93.356 Y77.049 E.14724
G1 X93.928 Y77.049 E.00755
G1 X101.25 Y84.371 E.13657
G1 X101.25 Y83.799 E.00755
G1 X94.5 Y77.049 E.12589
G1 X95.072 Y77.049 E.00755
G1 X101.25 Y83.227 E.11522
G1 X101.25 Y82.654 E.00755
G1 X95.644 Y77.049 E.10455
G1 X96.217 Y77.049 E.00755
G1 X101.25 Y82.082 E.09388
G1 X101.25 Y81.51 E.00755
G1 X96.789 Y77.049 E.0832
G1 X97.361 Y77.049 E.00755
G1 X101.25 Y80.938 E.07253
G1 X101.25 Y80.365 E.00755
G1 X97.933 Y77.049 E.06186
G1 X98.505 Y77.049 E.00755
G1 X101.25 Y79.793 E.05119
G1 X101.25 Y79.221 E.00755
G1 X99.077 Y77.049 E.04051
G1 X99.65 Y77.049 E.00755
G1 X101.25 Y78.649 E.02984
G1 X101.25 Y78.076 E.00755
G1 X100.222 Y77.049 E.01917
G1 X100.794 Y77.049 E.00755
G1 X101.431 Y77.686 E.01188
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X100.794 Y77.049 E-.34225
G1 X100.222 Y77.049 E-.21744
G1 X100.595 Y77.421 E-.20031
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/99
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1 I-.227 J-1.196 P1  F42000
G1 X78.607 Y81.589 Z1
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14968
M204 S6000
G1 X78.539 Y81.348 E.00354
G3 X79.876 Y79.515 I1.537 J-.283 E.03581
G3 X80.92 Y79.75 I.205 J1.528 E.01542
G3 X78.646 Y81.695 I-.844 J1.315 E.08216
G1 X78.628 Y81.645 E.00075
M204 S10000
G1 X79.018 Y81.462 F42000
G1 F14968
M204 S6000
G1 X78.97 Y81.272 E.00277
G3 X79.93 Y79.945 I1.107 J-.209 E.02585
G1 X80.058 Y79.936 E.00181
G3 X79.045 Y81.515 I.02 J1.127 E.06863
M204 S250
G1 X79.415 Y81.339 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X79.377 Y81.2 E.0019
G3 X79.982 Y80.36 I.696 J-.137 E.01523
G1 X80.058 Y80.355 E.001
G3 X79.444 Y81.391 I.015 J.709 E.03958
; WIPE_START
M204 S6000
G1 X79.377 Y81.2 E-.07706
G1 X79.359 Y81.065 E-.05171
G1 X79.373 Y80.924 E-.0539
G1 X79.414 Y80.791 E-.05268
G1 X79.549 Y80.581 E-.0948
G1 X79.655 Y80.488 E-.0538
G1 X79.778 Y80.417 E-.05389
G1 X79.982 Y80.36 E-.08049
G1 X80.058 Y80.355 E-.02886
G1 X80.193 Y80.365 E-.05174
G1 X80.33 Y80.403 E-.05398
G1 X80.456 Y80.468 E-.05375
G1 X80.566 Y80.555 E-.05334
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.393 Y76.693 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14968
M204 S6000
G1 X101.605 Y76.694 E.32747
G1 X101.607 Y103.307 E.37546
G1 X78.393 Y103.307 E.32749
G1 X78.393 Y82.164 E.29828
G2 X82.044 Y81.38 I1.67 J-1.116 E.06764
G2 X78.902 Y79.44 I-1.981 J-.307 E.06624
G1 X78.393 Y79.889 E.00957
G1 X78.393 Y76.753 E.04424
M204 S10000
G1 X78.07 Y76.423 F42000
G1 F14968
M204 S6000
G1 X78.092 Y76.392 E.00054
G3 X78.426 Y76.261 I.318 J.318 E.00521
G1 X101.576 Y76.261 E.32659
G3 X102.038 Y76.679 I.02 J.442 E.00975
G1 X102.039 Y103.31 E.37571
G3 X101.573 Y103.739 I-.451 J-.022 E.0099
G1 X78.426 Y103.739 E.32656
G3 X77.961 Y103.274 I-.017 J-.449 E.01043
G1 X77.961 Y76.726 E.37453
M73 P12 R14
G3 X77.988 Y76.553 I.449 J-.017 E.00249
G1 X78.038 Y76.474 E.00132
M204 S10000
G1 X77.679 Y76.218 F42000
G1 F14968
M204 S6000
G3 X78.416 Y75.828 I.734 J.494 E.01225
G1 X101.586 Y75.828 E.3269
G3 X102.47 Y76.658 I.002 J.884 E.01885
G1 X102.472 Y103.292 E.37576
G3 X101.584 Y104.172 I-.879 J.002 E.01963
G1 X78.416 Y104.172 E.32687
G3 X77.528 Y103.284 I-.009 J-.879 E.01973
G1 X77.528 Y76.716 E.37483
G3 X77.647 Y76.269 I.885 J-.003 E.0066
M204 S250
G1 X77.341 Y75.967 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X77.492 Y75.793 E.00303
G3 X78.405 Y75.41 I.924 J.923 E.01333
G1 X101.597 Y75.41 E.30451
G3 X102.888 Y76.637 I-.013 J1.307 E.02573
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.299 J-.006 E.02666
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.004 J-1.299 E.0267
G1 X77.11 Y76.705 E.34913
G3 X77.312 Y76.019 I1.306 J.011 E.00952
; WIPE_START
M204 S6000
G1 X77.492 Y75.793 E-.10994
G1 X77.735 Y75.595 E-.11889
G1 X77.965 Y75.486 E-.09691
G1 X78.213 Y75.424 E-.09714
G1 X78.405 Y75.41 E-.07313
G1 X79.1 Y75.41 E-.26399
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

G1 X78.567 Y77.686
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421788
G1 F14968
M204 S6000
G1 X79.204 Y77.049 E.01188
G1 X79.777 Y77.049 E.00755
G1 X78.749 Y78.077 E.01917
G1 X78.749 Y78.649 E.00755
G1 X80.349 Y77.049 E.02985
G1 X80.921 Y77.049 E.00755
G1 X78.991 Y78.979 E.03601
G1 X79.101 Y78.916 E.00167
G1 X79.51 Y78.778 E.00569
G1 X79.8 Y78.742 E.00386
G1 X81.493 Y77.049 E.03158
G1 X82.066 Y77.049 E.00755
G1 X80.379 Y78.735 E.03146
G1 X80.479 Y78.743 E.00133
G1 X80.842 Y78.845 E.00496
G1 X82.638 Y77.049 E.0335
G1 X83.21 Y77.049 E.00755
G1 X81.234 Y79.025 E.03686
G3 X81.57 Y79.261 I-.416 J.953 E.00546
G1 X83.782 Y77.049 E.04126
G1 X84.354 Y77.049 E.00755
G1 X81.858 Y79.545 E.04657
G3 X82.096 Y79.879 I-.706 J.756 E.00545
G1 X84.927 Y77.049 E.0528
G1 X85.499 Y77.049 E.00755
G1 X82.279 Y80.269 E.06006
G3 X82.394 Y80.726 I-2.236 J.806 E.00623
G1 X86.071 Y77.049 E.06858
G1 X86.643 Y77.049 E.00755
G1 X82.194 Y81.498 E.08299
; WIPE_START
G1 F18000
G1 X83.608 Y80.084 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.177 Y80.577 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.197404
G1 F14968
M204 S6000
G3 X78.403 Y80.266 I3.64 J2.407 E.00226
; LINE_WIDTH: 0.143146
G1 X78.465 Y80.186 E.00042
; LINE_WIDTH: 0.105548
G1 X78.527 Y80.107 E.00029
; LINE_WIDTH: 0.0785445
G1 X78.596 Y80.031 E.00021
M204 S10000
G1 X78.318 Y80.244 F42000
; LINE_WIDTH: 0.226236
G1 F14968
M204 S6000
G1 X78.285 Y80.467 E.00153
; LINE_WIDTH: 0.184393
G2 X78.25 Y80.704 I2.378 J.473 E.00131
; LINE_WIDTH: 0.143923
G2 X78.249 Y81.404 I5.053 J.355 E.0029
; LINE_WIDTH: 0.177749
G1 X78.286 Y81.699 E.00156
M204 S10000
G1 X78.458 Y81.867 F42000
; LINE_WIDTH: 0.0766306
G1 F14968
M204 S6000
G1 X78.412 Y81.798 E.00016
; LINE_WIDTH: 0.101209
G1 X78.358 Y81.706 E.00029
; LINE_WIDTH: 0.152361
G3 X78.177 Y81.378 I6.278 J-3.689 E.00165
; WIPE_START
G1 F18000
G1 X78.358 Y81.706 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.567 Y83.408 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421788
G1 F14968
M204 S6000
G1 X78.882 Y83.093 E.00588
G1 X79.27 Y83.277 E.00566
G1 X78.749 Y83.799 E.00973
G1 X78.749 Y84.371 E.00755
G1 X79.728 Y83.392 E.01826
G1 X80.129 Y83.422 E.00531
G1 X80.29 Y83.402 E.00214
G1 X78.749 Y84.943 E.02875
G1 X78.749 Y85.516 E.00755
G1 X87.215 Y77.049 E.15792
G1 X87.788 Y77.049 E.00755
G1 X78.749 Y86.088 E.16859
G1 X78.749 Y86.66 E.00755
G1 X88.36 Y77.049 E.17926
G1 X88.932 Y77.049 E.00755
G1 X78.749 Y87.232 E.18994
G1 X78.749 Y87.804 E.00755
G1 X89.504 Y77.049 E.20061
G1 X90.077 Y77.049 E.00755
G1 X78.749 Y88.377 E.21128
G1 X78.749 Y88.949 E.00755
G1 X90.649 Y77.049 E.22196
G1 X91.221 Y77.049 E.00755
G1 X78.749 Y89.521 E.23263
G1 X78.749 Y90.093 E.00755
G1 X91.793 Y77.049 E.2433
G1 X92.365 Y77.049 E.00755
G1 X78.749 Y90.665 E.25397
G1 X78.749 Y91.238 E.00755
G1 X92.938 Y77.049 E.26465
G1 X93.51 Y77.049 E.00755
G1 X78.749 Y91.81 E.27532
G1 X78.749 Y92.382 E.00755
G1 X94.082 Y77.049 E.28599
G1 X94.654 Y77.049 E.00755
G1 X78.749 Y92.954 E.29666
G1 X78.749 Y93.527 E.00755
G1 X95.227 Y77.049 E.30734
G1 X95.799 Y77.049 E.00755
G1 X78.749 Y94.099 E.31801
G1 X78.749 Y94.671 E.00755
G1 X96.371 Y77.049 E.32868
G1 X96.943 Y77.049 E.00755
G1 X78.749 Y95.243 E.33935
G1 X78.749 Y95.815 E.00755
G1 X97.515 Y77.049 E.35003
G1 X98.088 Y77.049 E.00755
G1 X78.749 Y96.388 E.3607
G1 X78.749 Y96.96 E.00755
G1 X98.66 Y77.049 E.37137
G1 X99.232 Y77.049 E.00755
G1 X78.749 Y97.532 E.38205
G1 X78.749 Y98.104 E.00755
G1 X99.804 Y77.049 E.39272
G1 X100.376 Y77.049 E.00755
G1 X78.749 Y98.677 E.40339
G1 X78.749 Y99.249 E.00755
G1 X100.949 Y77.049 E.41406
G1 X101.25 Y77.049 E.00397
G1 X101.25 Y77.32 E.00358
G1 X78.749 Y99.821 E.41968
G1 X78.749 Y100.393 E.00755
G1 X101.25 Y77.892 E.41968
G1 X101.25 Y78.464 E.00755
G1 X78.749 Y100.965 E.41968
G1 X78.749 Y101.538 E.00755
G1 X101.25 Y79.036 E.41968
G1 X101.25 Y79.609 E.00755
G1 X78.749 Y102.11 E.41968
G1 X78.749 Y102.682 E.00755
G1 X101.25 Y80.181 E.41968
G1 X101.25 Y80.753 E.00755
G1 X79.051 Y102.951 E.41403
G1 X79.624 Y102.951 E.00755
G1 X101.25 Y81.325 E.40336
G1 X101.25 Y81.897 E.00755
G1 X80.196 Y102.951 E.39269
G1 X80.768 Y102.951 E.00755
G1 X101.25 Y82.47 E.38202
G1 X101.25 Y83.042 E.00755
G1 X81.34 Y102.951 E.37134
G1 X81.913 Y102.951 E.00755
G1 X101.25 Y83.614 E.36067
G1 X101.25 Y84.186 E.00755
G1 X82.485 Y102.951 E.35
G1 X83.057 Y102.951 E.00755
G1 X101.25 Y84.758 E.33933
G1 X101.25 Y85.33 E.00755
G1 X83.629 Y102.951 E.32866
G1 X84.201 Y102.951 E.00755
G1 X101.25 Y85.903 E.31798
G1 X101.25 Y86.475 E.00755
G1 X84.774 Y102.951 E.30731
G1 X85.346 Y102.951 E.00755
G1 X101.25 Y87.047 E.29664
G1 X101.25 Y87.619 E.00755
G1 X85.918 Y102.951 E.28597
G1 X86.49 Y102.951 E.00755
G1 X101.25 Y88.191 E.2753
G1 X101.25 Y88.764 E.00755
G1 X87.063 Y102.951 E.26462
M73 P13 R14
G1 X87.635 Y102.951 E.00755
G1 X101.25 Y89.336 E.25395
G1 X101.25 Y89.908 E.00755
G1 X88.207 Y102.951 E.24328
G1 X88.779 Y102.951 E.00755
G1 X101.251 Y90.48 E.23261
G1 X101.251 Y91.052 E.00755
G1 X89.351 Y102.951 E.22194
G1 X89.924 Y102.951 E.00755
G1 X101.251 Y91.624 E.21126
G1 X101.251 Y92.197 E.00755
G1 X90.496 Y102.951 E.20059
G1 X91.068 Y102.951 E.00755
G1 X101.251 Y92.769 E.18992
G1 X101.251 Y93.341 E.00755
G1 X91.64 Y102.951 E.17925
G1 X92.213 Y102.951 E.00755
G1 X101.251 Y93.913 E.16858
G1 X101.251 Y94.485 E.00755
G1 X92.785 Y102.951 E.1579
G1 X93.357 Y102.951 E.00755
G1 X101.251 Y95.058 E.14723
G1 X101.251 Y95.63 E.00755
G1 X93.929 Y102.951 E.13656
G1 X94.501 Y102.951 E.00755
G1 X101.251 Y96.202 E.12589
G1 X101.251 Y96.774 E.00755
G1 X95.074 Y102.951 E.11522
G1 X95.646 Y102.951 E.00755
G1 X101.251 Y97.346 E.10454
G1 X101.251 Y97.918 E.00755
G1 X96.218 Y102.951 E.09387
G1 X96.79 Y102.951 E.00755
G1 X101.251 Y98.491 E.0832
G1 X101.251 Y99.063 E.00755
G1 X97.362 Y102.951 E.07253
G1 X97.935 Y102.951 E.00755
G1 X101.251 Y99.635 E.06186
G1 X101.251 Y100.207 E.00755
G1 X98.507 Y102.951 E.05118
G1 X99.079 Y102.951 E.00755
G1 X101.251 Y100.779 E.04051
G1 X101.251 Y101.352 E.00755
G1 X99.651 Y102.951 E.02984
G1 X100.224 Y102.951 E.00755
G1 X101.251 Y101.924 E.01917
G1 X101.251 Y102.496 E.00755
G1 X100.615 Y103.133 E.01188
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X101.251 Y102.496 E-.34222
G1 X101.251 Y101.924 E-.21742
G1 X100.878 Y102.297 E-.20036
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/99
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I.85 J-.871 P1  F42000
G1 X79.414 Y81.338 Z1.08
G1 Z.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
M73 P13 R13
G1 X79.375 Y81.206 E.00182
G3 X79.912 Y80.372 I.695 J-.142 E.01442
G1 X80.052 Y80.354 E.00186
G3 X79.441 Y81.391 I.018 J.709 E.03963
; WIPE_START
M204 S6000
G1 X79.375 Y81.206 E-.07499
G1 X79.359 Y81.065 E-.05375
G1 X79.373 Y80.924 E-.05378
G1 X79.466 Y80.69 E-.09588
G1 X79.549 Y80.581 E-.05182
G1 X79.651 Y80.491 E-.05173
G1 X79.783 Y80.415 E-.05777
G1 X79.912 Y80.372 E-.05172
G1 X80.052 Y80.354 E-.05383
G1 X80.194 Y80.365 E-.05383
G1 X80.33 Y80.403 E-.05385
G1 X80.513 Y80.51 E-.08038
G1 X80.561 Y80.561 E-.02666
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.339 Y75.97 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F12000
M204 S5000
G1 X77.492 Y75.789 E.00312
G3 X78.405 Y75.41 I.917 J.92 E.01332
G1 X101.598 Y75.41 E.30452
G3 X102.888 Y76.637 I-.014 J1.307 E.02572
G1 X102.89 Y103.297 E.35006
G3 X101.597 Y104.59 I-1.306 J-.013 E.02659
G1 X78.403 Y104.59 E.30455
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34913
G3 X77.307 Y76.021 I1.299 J.004 E.00947
; WIPE_START
M204 S6000
G1 X77.492 Y75.789 E-.11281
G1 X77.737 Y75.594 E-.11894
G1 X77.966 Y75.486 E-.09609
G1 X78.211 Y75.424 E-.09598
G1 X78.405 Y75.41 E-.07423
G1 X79.095 Y75.41 E-.26195
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

G1 X101.552 Y75.632
G1 Z.76
G1 E.8 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X102.667 Y76.746 E.02069
G1 X102.667 Y77.316
G1 X100.983 Y75.632 E.03127
G1 X100.413 Y75.632
G1 X102.667 Y77.885 E.04185
G1 X102.667 Y78.455
G1 X99.843 Y75.632 E.05243
G1 X99.274 Y75.632
G1 X102.667 Y79.025 E.06301
G1 X102.667 Y79.595
G1 X98.704 Y75.632 E.07359
G1 X98.134 Y75.632
G1 X102.667 Y80.164 E.08417
G1 X102.667 Y80.734
G1 X97.565 Y75.632 E.09475
G1 X96.995 Y75.632
G1 X102.667 Y81.304 E.10533
G1 X102.667 Y81.873
G1 X96.425 Y75.632 E.11591
G1 X95.855 Y75.632
G1 X102.667 Y82.443 E.12648
G1 X102.667 Y83.013
G1 X95.286 Y75.632 E.13706
G1 X94.716 Y75.632
G1 X102.667 Y83.583 E.14764
G1 X102.667 Y84.152
G1 X94.146 Y75.632 E.15822
G1 X93.577 Y75.632
G1 X102.667 Y84.722 E.1688
G1 X102.667 Y85.292
G1 X93.007 Y75.632 E.17938
G1 X92.437 Y75.632
G1 X102.667 Y85.862 E.18996
G1 X102.667 Y86.431
G1 X91.868 Y75.632 E.20054
G1 X91.298 Y75.632
G1 X102.667 Y87.001 E.21112
G1 X102.667 Y87.571
G1 X90.728 Y75.632 E.2217
G1 X90.159 Y75.632
G1 X102.667 Y88.14 E.23228
G1 X102.667 Y88.71
G1 X89.589 Y75.632 E.24286
G1 X89.019 Y75.632
G1 X102.668 Y89.28 E.25344
G1 X102.668 Y89.85
G1 X88.449 Y75.632 E.26402
G1 X87.88 Y75.632
G1 X102.668 Y90.419 E.27459
G1 X102.668 Y90.989
G1 X87.31 Y75.632 E.28517
G1 X86.74 Y75.632
G1 X102.668 Y91.559 E.29575
G1 X102.668 Y92.129
G1 X86.171 Y75.632 E.30633
G1 X85.601 Y75.632
G1 X102.668 Y92.698 E.31691
G1 X102.668 Y93.268
G1 X85.031 Y75.632 E.32749
G1 X84.462 Y75.632
G1 X102.668 Y93.838 E.33807
G1 X102.668 Y94.407
G1 X83.892 Y75.632 E.34865
G1 X83.322 Y75.632
G1 X102.668 Y94.977 E.35923
G1 X102.668 Y95.547
G1 X82.753 Y75.632 E.36981
G1 X82.183 Y75.632
G1 X102.668 Y96.117 E.38039
M73 P14 R13
G1 X102.668 Y96.686
G1 X81.613 Y75.632 E.39097
G1 X81.044 Y75.632
G1 X102.668 Y97.256 E.40155
G1 X102.668 Y97.826
G1 X80.474 Y75.632 E.41213
G1 X79.904 Y75.632
G1 X102.668 Y98.396 E.4227
G1 X102.668 Y98.965
G1 X79.334 Y75.632 E.43328
G1 X78.765 Y75.632
G1 X102.668 Y99.535 E.44386
G1 X102.668 Y100.105
G1 X78.213 Y75.65 E.45411
G1 X77.807 Y75.813
G1 X102.668 Y100.674 E.46165
G1 X102.668 Y101.244
G1 X77.52 Y76.096 E.46698
G1 X77.352 Y76.497
G1 X102.668 Y101.814 E.4701
G1 X102.668 Y102.384
G1 X80.863 Y80.578 E.40491
G1 X80.98 Y81.265
G1 X102.668 Y102.953 E.40272
G1 X102.647 Y103.502
G1 X80.794 Y81.649 E.40579
G1 X80.478 Y81.902
G1 X102.48 Y103.904 E.40855
G1 X102.194 Y104.188
G1 X79.997 Y81.991 E.41217
; WIPE_START
M204 S6000
G1 X81.411 Y83.405 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.554 Y80.269 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X77.332 Y77.047 E.05983
G1 X77.332 Y77.616
G1 X79.869 Y80.154 E.04712
G1 X79.486 Y80.341
G1 X77.332 Y78.186 E.04001
G1 X77.332 Y78.756
G1 X79.234 Y80.658 E.03532
G1 X79.144 Y81.138
G1 X77.332 Y79.326 E.03365
G1 X77.332 Y79.895
G1 X101.787 Y104.35 E.45411
G1 X101.235 Y104.368
G1 X77.332 Y80.465 E.44387
G1 X77.332 Y81.035
G1 X100.665 Y104.368 E.43329
G1 X100.096 Y104.368
G1 X77.332 Y81.604 E.42271
G1 X77.332 Y82.174
G1 X99.526 Y104.368 E.41213
G1 X98.956 Y104.368
G1 X77.332 Y82.744 E.40155
G1 X77.332 Y83.313
G1 X98.387 Y104.368 E.39097
G1 X97.817 Y104.368
G1 X77.332 Y83.883 E.38039
G1 X77.332 Y84.453
G1 X97.247 Y104.368 E.36982
G1 X96.678 Y104.368
G1 X77.332 Y85.022 E.35924
G1 X77.332 Y85.592
G1 X96.108 Y104.368 E.34866
G1 X95.538 Y104.368
G1 X77.332 Y86.162 E.33808
G1 X77.332 Y86.731
G1 X94.969 Y104.368 E.3275
G1 X94.399 Y104.368
G1 X77.332 Y87.301 E.31692
G1 X77.332 Y87.871
G1 X93.829 Y104.368 E.30634
G1 X93.259 Y104.368
G1 X77.332 Y88.441 E.29577
G1 X77.332 Y89.01
G1 X92.69 Y104.368 E.28519
G1 X92.12 Y104.368
G1 X77.332 Y89.58 E.27461
G1 X77.332 Y90.15
G1 X91.55 Y104.368 E.26403
M73 P15 R13
G1 X90.981 Y104.368
G1 X77.332 Y90.719 E.25345
G1 X77.332 Y91.289
G1 X90.411 Y104.368 E.24287
G1 X89.841 Y104.368
G1 X77.332 Y91.859 E.23229
G1 X77.332 Y92.428
G1 X89.272 Y104.368 E.22172
G1 X88.702 Y104.368
G1 X77.332 Y92.998 E.21114
G1 X77.332 Y93.568
G1 X88.132 Y104.368 E.20056
G1 X87.563 Y104.368
G1 X77.332 Y94.137 E.18998
G1 X77.332 Y94.707
G1 X86.993 Y104.368 E.1794
G1 X86.423 Y104.368
G1 X77.332 Y95.277 E.16882
G1 X77.332 Y95.846
G1 X85.854 Y104.368 E.15824
G1 X85.284 Y104.368
G1 X77.332 Y96.416 E.14767
G1 X77.332 Y96.986
G1 X84.714 Y104.368 E.13709
G1 X84.144 Y104.368
G1 X77.332 Y97.556 E.12651
G1 X77.332 Y98.125
G1 X83.575 Y104.368 E.11593
G1 X83.005 Y104.368
G1 X77.332 Y98.695 E.10535
G1 X77.332 Y99.265
G1 X82.435 Y104.368 E.09477
G1 X81.866 Y104.368
G1 X77.332 Y99.834 E.0842
G1 X77.332 Y100.404
G1 X81.296 Y104.368 E.07362
G1 X80.726 Y104.368
G1 X77.332 Y100.974 E.06304
G1 X77.332 Y101.543
G1 X80.157 Y104.368 E.05246
G1 X79.587 Y104.368
G1 X77.332 Y102.113 E.04188
G1 X77.332 Y102.683
G1 X79.017 Y104.368 E.0313
G1 X78.448 Y104.368
G1 X77.332 Y103.252 E.02072
M204 S10000
G1 X78.091 Y104.323 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0729703
G1 F18000
M204 S6000
G1 X78.044 Y104.295 E.0001
; LINE_WIDTH: 0.101884
G1 X77.953 Y104.234 E.0003
; LINE_WIDTH: 0.143894
G3 X77.836 Y104.144 I1.175 J-1.659 E.00061
; LINE_WIDTH: 0.169117
G3 X77.49 Y103.78 I1.35 J-1.628 E.00249
; LINE_WIDTH: 0.129855
G1 X77.467 Y103.748 E.00015
; LINE_WIDTH: 0.101982
G1 X77.405 Y103.656 E.00031
; LINE_WIDTH: 0.0729794
G1 X77.377 Y103.609 E.0001
; WIPE_START
G1 X77.405 Y103.656 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.588 Y98.053 Z1.16 F42000
G1 X102.63 Y76.387 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.136285
G1 F18000
M204 S6000
G2 X102.444 Y76.136 I-3.389 J2.316 E.00121
; LINE_WIDTH: 0.169596
G2 X102.085 Y75.794 I-1.621 J1.343 E.00247
; LINE_WIDTH: 0.120036
G1 X101.911 Y75.672 E.00071
M204 S10000
G1 X102.623 Y76.391 F42000
; LINE_WIDTH: 0.0730117
G1 F18000
M204 S6000
G1 X102.32 Y75.886 E.00107
; WIPE_START
G1 X102.623 Y76.391 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.124 Y77.815 Z1.16 F42000
G1 X80.93 Y80.511 Z1.16
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.216105
G1 F18000
M204 S6000
G2 X80.619 Y80.204 I-1.819 J1.532 E.00284
; WIPE_START
G1 X80.93 Y80.511 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.912 Y82.077 Z1.16 F42000
G1 Z.76
G1 E.8 F1800
; LINE_WIDTH: 0.0839725
G1 F18000
M204 S6000
G3 X79.638 Y81.888 I2.467 J-3.876 E.00072
M204 S10000
G1 X79.921 Y82.068 F42000
; LINE_WIDTH: 0.137215
G1 F18000
M204 S6000
G1 X79.631 Y81.898 E.00131
M204 S10000
G1 X80.01 Y81.979 F42000
; LINE_WIDTH: 0.107354
G1 F18000
M204 S6000
G1 X79.776 Y82.055 E.00072
M204 S10000
G1 X79.246 Y81.495 F42000
; LINE_WIDTH: 0.0793691
G1 F18000
M204 S6000
G3 X79.058 Y81.223 I2.614 J-2.002 E.00067
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X79.246 Y81.495 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/99
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.16 I.28 J1.184 P1  F42000
G1 X101.49 Y76.24 Z1.16
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2145
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.82 Y75.817 E.00444
G3 X102.51 Y76.695 I-.246 J.903 E.01571
G1 X102.51 Y103.305 E.3494
G3 X102.174 Y104.007 I-.978 J-.037 E.01051
G3 X101.49 Y104.26 I-.848 J-1.237 E.00967
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.057 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18983
G1 X101.82 Y75.817 E-.12859
G1 X102.066 Y75.918 E-.10081
G1 X102.212 Y76.026 E-.06899
G1 X102.301 Y76.119 E-.04904
G1 X102.403 Y76.272 E-.06994
G1 X102.457 Y76.392 E-.05002
G1 X102.492 Y76.519 E-.05009
G1 X102.506 Y76.657 E-.0527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.452 Z1.24 F42000
G1 X77.337 Y75.982 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F2145
M204 S5000
G1 X77.495 Y75.79 E.00326
G3 X78.405 Y75.41 I.921 J.926 E.01328
G1 X101.598 Y75.41 E.30453
G3 X102.888 Y76.637 I-.014 J1.307 E.02571
G1 X102.89 Y103.295 E.35002
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34913
M73 P16 R13
G3 X77.299 Y76.04 I1.306 J.011 E.00919
G1 X77.304 Y76.032 E.00013
; WIPE_START
G1 F12000
M204 S6000
G1 X77.495 Y75.79 E-.11709
G1 X77.737 Y75.594 E-.11836
G1 X77.965 Y75.486 E-.09608
G1 X78.21 Y75.424 E-.09577
G1 X78.405 Y75.41 E-.07449
G1 X79.085 Y75.41 E-.25821
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

G1 X86.219 Y75.825
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429297
G1 F2145
M204 S6000
G1 X101.281 Y75.825 E.20234
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z1.24 F42000
G1 X101.281 Y104.175 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2145
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.579 Y97.014 Z1.24 F42000
G1 X79.54 Y80.63 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2145
M204 S5000
G1 X79.565 Y80.596 E.0005
G3 X79.917 Y80.394 I.503 J.468 E.00482
G1 X80.048 Y80.377 E.00155
G3 X79.481 Y80.705 I.019 J.687 E.04246
G1 X79.503 Y80.678 E.00041
M204 S250
G1 X79.413 Y81.339 F42000
G1 F2145
M204 S5000
G1 X79.373 Y81.206 E.00163
G3 X80.052 Y80.353 I.697 J-.141 E.01452
G1 X80.123 Y80.355 E.00083
G3 X79.439 Y81.394 I-.053 J.709 E.03456
; WIPE_START
G1 F12000
M204 S6000
G1 X79.373 Y81.206 E-.07566
G1 X79.358 Y81.065 E-.05383
G1 X79.39 Y80.855 E-.08065
G1 X79.445 Y80.725 E-.05385
G1 X79.523 Y80.609 E-.05296
G1 X79.654 Y80.487 E-.06818
G1 X79.777 Y80.416 E-.05391
G1 X79.912 Y80.371 E-.05381
G1 X80.052 Y80.353 E-.05389
G1 X80.123 Y80.355 E-.02699
G1 X80.263 Y80.38 E-.05389
G1 X80.395 Y80.432 E-.05389
G1 X80.514 Y80.508 E-.05389
G1 X80.56 Y80.554 E-.0246
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2145
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2145
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z1.24 F42000
G1 X84.61 Y95.71 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2145
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2145
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 0.92
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/99
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z1.24
G1 Z.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.82 Y75.817 E.00444
G3 X102.51 Y76.695 I-.246 J.903 E.0157
G1 X102.51 Y103.305 E.34941
G3 X102.174 Y104.007 I-.978 J-.037 E.01051
G3 X101.49 Y104.26 I-.847 J-1.236 E.00967
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.307 I.056 J-.92 E.01803
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18977
G1 X101.82 Y75.817 E-.12858
G1 X102.066 Y75.918 E-.10085
G1 X102.212 Y76.026 E-.06893
G1 X102.301 Y76.119 E-.04914
G1 X102.403 Y76.272 E-.06986
G1 X102.457 Y76.393 E-.05017
G1 X102.492 Y76.52 E-.05007
G1 X102.506 Y76.657 E-.05263
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.451 Z1.32 F42000
G1 X77.333 Y75.977 Z1.32
G1 Z.92
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.492 Y75.793 E.0032
G3 X78.405 Y75.41 I.924 J.924 E.01333
G1 X101.599 Y75.41 E.30454
G3 X102.888 Y76.634 I-.015 J1.307 E.02567
G1 X102.89 Y103.297 E.35009
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
M73 P17 R13
G3 X77.306 Y76.029 I1.306 J.011 E.00936
; WIPE_START
G1 F12000
M204 S6000
G1 X77.492 Y75.793 E-.1144
G1 X77.685 Y75.626 E-.09679
G1 X77.848 Y75.534 E-.07121
G1 X78.146 Y75.435 E-.11905
G1 X78.405 Y75.41 E-.09913
G1 X79.088 Y75.41 E-.25943
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

G1 X86.219 Y75.825
G1 Z.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429277
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20233
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z1.32 F42000
G1 X101.281 Y104.175 Z1.32
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z1.32 F42000
G1 X79.436 Y81.333 Z1.32
G1 Z.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.398 Y81.196 E.00166
G3 X79.985 Y80.382 I.674 J-.132 E.01314
G1 X80.058 Y80.377 E.00086
G3 X79.465 Y81.384 I.015 J.687 E.0341
M204 S250
G1 X79.515 Y80.622 F42000
G1 F2147
M204 S5000
G1 X79.525 Y80.608 E.00021
G3 X80.088 Y80.353 I.545 J.457 E.00747
G1 X80.158 Y80.359 E.00082
G3 X79.445 Y80.725 I-.088 J.706 E.04229
G1 X79.481 Y80.672 E.00075
; WIPE_START
G1 F12000
M204 S6000
G1 X79.525 Y80.608 E-.02948
G1 X79.626 Y80.509 E-.0538
G1 X79.81 Y80.402 E-.08076
G1 X79.946 Y80.364 E-.05387
G1 X80.088 Y80.353 E-.05399
G1 X80.158 Y80.359 E-.02679
G1 X80.297 Y80.39 E-.0539
G1 X80.426 Y80.448 E-.0539
G1 X80.541 Y80.531 E-.05383
G1 X80.637 Y80.635 E-.05387
G1 X80.711 Y80.756 E-.05386
G1 X80.76 Y80.889 E-.05396
G1 X80.778 Y81.136 E-.09391
G1 X80.755 Y81.25 E-.04408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.32 F42000
G1 Z.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z1.32 F42000
G1 X84.61 Y95.71 Z1.32
G1 Z.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/99
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.32 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z1.32
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00652
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.237 J.896 E.01569
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.954 J-.026 E.01049
G3 X101.49 Y104.261 I-.881 J-1.316 E.00969
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18996
G1 X101.821 Y75.817 E-.12865
G1 X102.068 Y75.919 E-.10173
G1 X102.174 Y75.993 E-.04905
G1 X102.303 Y76.121 E-.06906
G1 X102.404 Y76.272 E-.06893
G1 X102.456 Y76.39 E-.04913
G1 X102.501 Y76.568 E-.06976
G1 X102.507 Y76.657 E-.03375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.878 Y76.452 Z1.4 F42000
G1 X77.33 Y75.981 Z1.4
G1 Z1
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.496 Y75.789 E.00333
G3 X78.405 Y75.41 I.92 J.927 E.01326
G1 X101.6 Y75.41 E.30455
G3 X102.888 Y76.637 I-.016 J1.307 E.02569
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.011 E.02666
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.011 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.304 Y76.032 I1.306 J.011 E.00932
; WIPE_START
G1 F12000
M204 S6000
M73 P18 R13
G1 X77.496 Y75.789 E-.11773
G1 X77.737 Y75.594 E-.11785
G1 X77.965 Y75.486 E-.09606
G1 X78.146 Y75.435 E-.07114
G1 X78.405 Y75.41 E-.09911
G1 X79.085 Y75.41 E-.25811
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

G1 X86.219 Y75.825
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429267
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20232
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z1.4 F42000
G1 X101.281 Y104.175 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z1.4 F42000
G1 X79.435 Y81.332 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.397 Y81.201 E.0016
G3 X79.917 Y80.394 I.673 J-.138 E.01243
G1 X80.053 Y80.376 E.0016
G3 X79.462 Y81.384 I.017 J.687 E.03413
M204 S250
G1 X79.505 Y80.633 F42000
G1 F2147
M204 S5000
G1 X79.6 Y80.532 E.00162
G3 X80.091 Y80.354 I.472 J.533 E.00625
G1 X80.159 Y80.359 E.00079
G3 X79.471 Y80.683 I-.087 J.706 E.04287
; WIPE_START
G1 F12000
M204 S6000
G1 X79.6 Y80.532 E-.07525
G1 X79.714 Y80.448 E-.05388
G1 X79.843 Y80.39 E-.05383
G1 X80.091 Y80.354 E-.09515
G1 X80.159 Y80.359 E-.02577
G1 X80.297 Y80.39 E-.05386
G1 X80.426 Y80.448 E-.05381
G1 X80.541 Y80.531 E-.05389
G1 X80.637 Y80.635 E-.05388
G1 X80.711 Y80.756 E-.05389
G1 X80.76 Y80.889 E-.05387
G1 X80.781 Y81.029 E-.05384
G1 X80.774 Y81.171 E-.05393
G1 X80.758 Y81.235 E-.02515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z1.4 F42000
G1 X84.61 Y95.71 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.08
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/99
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z1.4
G1 Z1.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.82 Y75.817 E.00444
G3 X102.51 Y76.695 I-.245 J.903 E.0157
G1 X102.51 Y103.308 E.34944
G3 X102.174 Y104.007 I-.978 J-.04 E.01047
G3 X101.49 Y104.26 I-.847 J-1.236 E.00967
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01807
G1 X77.49 Y76.695 E.34939
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18981
G1 X101.82 Y75.817 E-.1286
G1 X102.068 Y75.919 E-.10168
G1 X102.174 Y75.993 E-.04912
G1 X102.304 Y76.123 E-.06998
G1 X102.379 Y76.228 E-.04903
G1 X102.458 Y76.395 E-.06996
G1 X102.492 Y76.519 E-.0491
G1 X102.506 Y76.657 E-.05273
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.454 Z1.48 F42000
G1 X77.33 Y75.985 Z1.48
G1 Z1.08
G1 E.8 F1800
G1 F2147
M204 S5000
G3 X78.405 Y75.41 I1.079 J.723 E.01667
G1 X101.601 Y75.41 E.30456
G3 X102.888 Y76.637 I-.017 J1.307 E.02568
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.703 E.34916
G3 X77.298 Y76.036 I1.299 J.006 E.00921
; WIPE_START
G1 F12000
M204 S6000
G1 X77.486 Y75.79 E-.1176
G1 X77.737 Y75.594 E-.12114
G1 X77.966 Y75.486 E-.09607
G1 X78.208 Y75.425 E-.09491
G1 X78.405 Y75.41 E-.07529
G1 X79.076 Y75.41 E-.25498
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

G1 X86.219 Y75.825
G1 Z1.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429257
M73 P19 R13
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20232
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z1.48 F42000
G1 X101.281 Y104.175 Z1.48
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z1.48 F42000
G1 X79.437 Y81.332 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.463 Y81.386 I.017 J.687 E.03411
M204 S250
G1 X79.504 Y80.636 F42000
G1 F2147
M204 S5000
G3 X80.092 Y80.354 I.568 J.429 E.00792
G1 X80.159 Y80.359 E.00079
G3 X79.47 Y80.685 I-.087 J.706 E.04283
; WIPE_START
G1 F12000
M204 S6000
G1 X79.599 Y80.531 E-.0765
G1 X79.714 Y80.448 E-.05384
G1 X79.843 Y80.39 E-.05386
G1 X80.092 Y80.354 E-.0954
G1 X80.159 Y80.359 E-.02554
G1 X80.297 Y80.39 E-.05381
G1 X80.426 Y80.448 E-.05396
G1 X80.541 Y80.531 E-.05387
G1 X80.637 Y80.635 E-.05382
G1 X80.711 Y80.756 E-.05388
G1 X80.76 Y80.889 E-.0539
G1 X80.781 Y81.029 E-.05384
G1 X80.774 Y81.171 E-.05389
G1 X80.758 Y81.232 E-.02392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.48 F42000
G1 Z1.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z1.48 F42000
G1 X84.61 Y95.71 Z1.48
G1 Z1.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/99
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.48 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z1.48
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00652
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.695 I-.237 J.896 E.01573
G1 X102.51 Y103.305 E.3494
G3 X102.176 Y104.005 I-.976 J-.037 E.01047
G3 X101.49 Y104.26 I-.88 J-1.315 E.0097
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.063 J-.926 E.01803
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
M73 P19 R12
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18994
G1 X101.821 Y75.817 E-.12865
G1 X102.067 Y75.918 E-.10122
G1 X102.174 Y75.993 E-.0497
G1 X102.302 Y76.121 E-.06883
G1 X102.403 Y76.272 E-.06893
G1 X102.457 Y76.392 E-.0501
G1 X102.492 Y76.519 E-.05005
G1 X102.506 Y76.657 E-.05258
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.453 Z1.56 F42000
G1 X77.327 Y75.985 Z1.56
G1 Z1.16
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.332 Y75.987 E.00008
G3 X78.405 Y75.41 I1.084 J.729 E.01664
G1 X101.601 Y75.41 E.30457
G3 X102.888 Y76.637 I-.017 J1.306 E.02567
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.307 J-.012 E.02665
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.004 J-1.299 E.02669
G1 X77.11 Y76.705 E.34913
G3 X77.214 Y76.205 I1.306 J.011 E.00675
G1 X77.3 Y76.038 E.00246
; WIPE_START
G1 F12000
M204 S6000
G1 X77.332 Y75.987 E-.02312
G1 X77.493 Y75.784 E-.09831
G1 X77.737 Y75.594 E-.11762
G1 X77.972 Y75.484 E-.09846
G1 X78.146 Y75.435 E-.0687
G1 X78.405 Y75.41 E-.09911
G1 X79.076 Y75.41 E-.25467
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

G1 X86.219 Y75.825
G1 Z1.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429237
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20231
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z1.56 F42000
G1 X101.281 Y104.175 Z1.56
G1 Z1.16
M73 P20 R12
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z1.56 F42000
G1 X79.437 Y81.332 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G3 X79.917 Y80.394 I.633 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.463 Y81.386 I.017 J.687 E.03411
M204 S250
G1 X79.502 Y80.636 F42000
G1 F2147
M204 S5000
G1 X79.504 Y80.636 E.00002
G3 X80.092 Y80.354 I.568 J.428 E.00792
G1 X80.159 Y80.359 E.00078
G3 X79.43 Y80.757 I-.087 J.706 E.04188
G1 X79.471 Y80.688 E.00094
; WIPE_START
G1 F12000
M204 S6000
G1 X79.504 Y80.636 E-.02305
G1 X79.599 Y80.531 E-.05386
G1 X79.714 Y80.449 E-.05381
G1 X79.843 Y80.39 E-.05389
G1 X80.092 Y80.354 E-.09557
G1 X80.159 Y80.359 E-.02535
G1 X80.297 Y80.39 E-.05386
G1 X80.426 Y80.448 E-.05387
G1 X80.541 Y80.531 E-.05386
G1 X80.637 Y80.635 E-.05389
G1 X80.711 Y80.756 E-.05388
G1 X80.76 Y80.889 E-.05393
G1 X80.781 Y81.029 E-.05376
G1 X80.774 Y81.171 E-.05389
G1 X80.759 Y81.231 E-.02354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z1.56 F42000
G1 X84.61 Y95.71 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.24
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/99
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.56 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z1.56
G1 Z1.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.246 J.903 E.01567
G1 X102.51 Y103.308 E.34947
G3 X102.174 Y104.007 I-.953 J-.028 E.01048
G3 X101.49 Y104.26 I-.847 J-1.234 E.00968
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.308 I.057 J-.92 E.01803
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18984
G1 X101.821 Y75.817 E-.12868
G1 X102.066 Y75.918 E-.10065
G1 X102.212 Y76.026 E-.06905
G1 X102.301 Y76.119 E-.04903
G1 X102.402 Y76.27 E-.06919
G1 X102.456 Y76.39 E-.04986
G1 X102.501 Y76.567 E-.06929
G1 X102.507 Y76.657 E-.03442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.878 Y76.455 Z1.64 F42000
G1 X77.325 Y75.989 Z1.64
G1 Z1.24
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.33 Y75.985 E.00008
G3 X78.405 Y75.41 I1.079 J.724 E.01666
G1 X101.602 Y75.41 E.30458
G3 X102.888 Y76.634 I-.018 J1.307 E.02563
G1 X102.89 Y103.295 E.35006
G3 X101.595 Y104.59 I-1.306 J-.011 E.02666
G1 X78.405 Y104.59 E.30449
G3 X77.11 Y103.295 I.011 J-1.306 E.02666
G1 X77.11 Y76.705 E.34913
G3 X77.188 Y76.266 I1.3 J.004 E.00588
G1 X77.298 Y76.043 E.00328
; WIPE_START
G1 F12000
M204 S6000
G1 X77.33 Y75.985 E-.02492
G1 X77.489 Y75.787 E-.09673
G1 X77.737 Y75.594 E-.11916
G1 X77.911 Y75.507 E-.07386
G1 X78.148 Y75.435 E-.09439
G1 X78.405 Y75.41 E-.09815
G1 X79.071 Y75.41 E-.2528
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

G1 X86.219 Y75.825
G1 Z1.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429226
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.2023
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z1.64 F42000
G1 X101.281 Y104.175 Z1.64
G1 Z1.24
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
M73 P21 R12
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z1.64 F42000
G1 X79.437 Y81.332 Z1.64
G1 Z1.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.463 Y81.386 I.017 J.687 E.03411
M204 S250
G1 X79.5 Y80.639 F42000
G1 F2147
M204 S5000
G1 X79.504 Y80.636 E.00005
G3 X80.092 Y80.354 I.568 J.428 E.00793
G1 X80.159 Y80.359 E.00077
G3 X79.43 Y80.757 I-.087 J.706 E.04188
G1 X79.47 Y80.69 E.00091
; WIPE_START
G1 F12000
M204 S6000
G1 X79.504 Y80.636 E-.02423
G1 X79.599 Y80.531 E-.05381
G1 X79.714 Y80.448 E-.0539
G1 X79.843 Y80.39 E-.05387
G1 X80.092 Y80.354 E-.09569
G1 X80.159 Y80.359 E-.02519
G1 X80.297 Y80.39 E-.05387
G1 X80.426 Y80.449 E-.05391
G1 X80.541 Y80.531 E-.05382
G1 X80.637 Y80.635 E-.05386
G1 X80.711 Y80.756 E-.05389
G1 X80.76 Y80.889 E-.05386
G1 X80.781 Y81.029 E-.05384
G1 X80.774 Y81.171 E-.05387
G1 X80.759 Y81.228 E-.02238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.64 F42000
G1 Z1.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z1.64 F42000
G1 X84.61 Y95.71 Z1.64
G1 Z1.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/99
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.64 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z1.64
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00444
G3 X102.51 Y76.692 I-.246 J.903 E.01567
G1 X102.51 Y103.308 E.34947
G3 X102.178 Y104.004 I-.955 J-.029 E.01042
G3 X101.49 Y104.26 I-.877 J-1.302 E.00973
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.353 Y104.209 E.10054
G3 X77.49 Y103.308 I.06 J-.92 E.01799
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18976
G1 X101.821 Y75.817 E-.12862
G1 X102.066 Y75.918 E-.10085
G1 X102.174 Y75.993 E-.04995
G1 X102.304 Y76.123 E-.06996
G1 X102.379 Y76.229 E-.04915
G1 X102.457 Y76.393 E-.06897
G1 X102.501 Y76.569 E-.0689
G1 X102.507 Y76.657 E-.03385
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.878 Y76.456 Z1.72 F42000
G1 X77.322 Y75.994 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.33 Y75.985 E.00015
G3 X78.405 Y75.41 I1.079 J.724 E.01666
G1 X101.603 Y75.41 E.30459
G3 X102.888 Y76.637 I-.019 J1.306 E.02565
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.011 E.02666
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.004 J-1.299 E.02669
G1 X77.11 Y76.705 E.34913
G3 X77.187 Y76.269 I1.3 J.005 E.00585
G1 X77.296 Y76.048 E.00324
; WIPE_START
G1 F12000
M204 S6000
G1 X77.33 Y75.985 E-.02702
G1 X77.489 Y75.786 E-.09675
G1 X77.631 Y75.664 E-.07119
G1 X77.848 Y75.534 E-.09608
G1 X78.146 Y75.435 E-.11911
G1 X78.405 Y75.41 E-.09914
G1 X79.065 Y75.41 E-.25071
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

G1 X86.219 Y75.825
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429216
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.2023
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z1.72 F42000
G1 X101.281 Y104.175 Z1.72
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z1.72 F42000
G1 X79.436 Y81.332 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G3 X79.917 Y80.394 I.634 J-.268 E.01404
G1 X80.053 Y80.376 E.0016
G3 X79.462 Y81.386 I.017 J.688 E.03419
M204 S250
G1 X79.493 Y80.651 F42000
G1 F2147
M204 S5000
G1 X79.603 Y80.528 E.00192
G3 X80.123 Y80.355 I.468 J.537 E.00658
G3 X80.156 Y81.772 I-.054 J.71 E.02448
G3 X79.46 Y80.7 I-.085 J-.707 E.01854
; WIPE_START
G1 F12000
M204 S6000
M73 P22 R12
G1 X79.603 Y80.528 E-.08516
G1 X79.714 Y80.448 E-.05187
G1 X79.843 Y80.39 E-.0539
G1 X79.982 Y80.359 E-.05387
G1 X80.123 Y80.355 E-.05392
G1 X80.263 Y80.38 E-.05384
G1 X80.395 Y80.431 E-.05384
G1 X80.514 Y80.508 E-.05391
G1 X80.615 Y80.607 E-.05383
G1 X80.726 Y80.788 E-.08065
G1 X80.768 Y80.924 E-.05384
G1 X80.782 Y81.065 E-.05388
G1 X80.768 Y81.206 E-.05392
G1 X80.765 Y81.215 E-.00358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z1.72 F42000
G1 X84.61 Y95.71 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/99
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.72 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z1.72
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.246 J.903 E.01567
G1 X102.51 Y103.305 E.34943
G3 X102.176 Y104.005 I-.978 J-.037 E.01047
G3 X101.49 Y104.26 I-.879 J-1.312 E.0097
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.308 I.056 J-.92 E.01803
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18985
G1 X101.821 Y75.817 E-.12871
G1 X102.066 Y75.918 E-.10065
G1 X102.174 Y75.993 E-.0501
G1 X102.304 Y76.123 E-.06988
G1 X102.379 Y76.229 E-.04925
G1 X102.457 Y76.393 E-.06892
G1 X102.501 Y76.569 E-.06896
G1 X102.507 Y76.657 E-.03368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.878 Y76.457 Z1.8 F42000
G1 X77.32 Y75.998 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.33 Y75.986 E.00021
G3 X78.405 Y75.41 I1.079 J.724 E.01667
G1 X101.604 Y75.41 E.3046
G3 X102.888 Y76.637 I-.02 J1.306 E.02564
G1 X102.89 Y103.295 E.35002
G3 X101.595 Y104.59 I-1.306 J-.011 E.02666
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.297 I.013 J-1.306 E.02659
G1 X77.11 Y76.705 E.34916
G3 X77.188 Y76.266 I1.3 J.004 E.00588
G1 X77.294 Y76.052 E.00314
; WIPE_START
G1 F12000
M204 S6000
G1 X77.33 Y75.986 E-.02872
G1 X77.489 Y75.786 E-.09685
G1 X77.737 Y75.594 E-.11917
G1 X77.912 Y75.506 E-.07435
G1 X78.148 Y75.435 E-.09381
G1 X78.405 Y75.41 E-.09817
G1 X79.061 Y75.41 E-.24894
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

G1 X86.219 Y75.825
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429206
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20229
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z1.8 F42000
G1 X101.281 Y104.175 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z1.8 F42000
G1 X79.435 Y81.333 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00002
G3 X79.943 Y80.388 I.632 J-.268 E.01434
G1 X80.052 Y80.377 E.00128
G3 X79.503 Y81.452 I.017 J.687 E.0332
G1 X79.465 Y81.385 E.0009
M204 S250
G1 X79.6 Y80.533 F42000
G1 F2147
M204 S5000
G3 X80.093 Y80.354 I.472 J.532 E.00628
G1 X80.159 Y80.359 E.00076
G3 X79.557 Y80.574 I-.086 J.706 E.04449
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y80.448 E-.07646
G1 X79.843 Y80.39 E-.05387
G1 X80.093 Y80.354 E-.0961
G1 X80.159 Y80.359 E-.02481
G1 X80.297 Y80.39 E-.0539
G1 X80.426 Y80.448 E-.0538
G1 X80.541 Y80.531 E-.05394
G1 X80.637 Y80.635 E-.05382
G1 X80.711 Y80.756 E-.05385
G1 X80.76 Y80.889 E-.0539
G1 X80.781 Y81.029 E-.05382
G1 X80.774 Y81.171 E-.05397
G1 X80.714 Y81.367 E-.07778
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z1.8 F42000
G1 X84.61 Y95.71 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
M73 P23 R12
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/99
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.8 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z1.8
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.237 J.896 E.01569
G1 X102.51 Y103.305 E.34943
G3 X102.178 Y104.004 I-.976 J-.036 E.01044
G3 X101.49 Y104.26 I-.878 J-1.301 E.00973
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18988
G1 X101.821 Y75.817 E-.12871
G1 X102.065 Y75.918 E-.10046
G1 X102.174 Y75.993 E-.05033
G1 X102.303 Y76.121 E-.069
G1 X102.404 Y76.272 E-.06894
G1 X102.456 Y76.39 E-.04911
G1 X102.5 Y76.565 E-.06864
G1 X102.507 Y76.657 E-.03493
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.459 Z1.88 F42000
G1 X77.318 Y76.003 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.333 Y75.987 E.00028
G3 X78.405 Y75.41 I1.084 J.73 E.01664
G1 X101.605 Y75.41 E.30461
G3 X102.888 Y76.637 I-.02 J1.306 E.02563
G1 X102.89 Y103.295 E.35002
G3 X101.595 Y104.59 I-1.299 J-.003 E.0267
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.014 J-1.307 E.02662
G1 X77.11 Y76.705 E.34912
G3 X77.19 Y76.267 I1.307 J.012 E.00588
G1 X77.292 Y76.057 E.00307
; WIPE_START
G1 F12000
M204 S6000
G1 X77.333 Y75.987 E-.03075
G1 X77.488 Y75.788 E-.09576
G1 X77.686 Y75.626 E-.09725
G1 X77.965 Y75.486 E-.11899
G1 X78.146 Y75.435 E-.07115
G1 X78.405 Y75.41 E-.09912
G1 X79.055 Y75.41 E-.24699
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

G1 X86.219 Y75.825
G1 Z1.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429186
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20228
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z1.88 F42000
G1 X101.281 Y104.175 Z1.88
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z1.88 F42000
G1 X79.436 Y81.333 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.436 Y81.332 E.00001
G3 X79.917 Y80.394 I.634 J-.268 E.01404
G1 X80.053 Y80.376 E.0016
G3 X79.502 Y81.452 I.017 J.688 E.03327
G1 X79.465 Y81.386 E.00089
M204 S250
G1 X79.498 Y80.643 F42000
G1 F2147
M204 S5000
G1 X79.502 Y80.635 E.00011
G3 X80.054 Y80.353 I.566 J.429 E.00749
G1 X80.089 Y80.353 E.00041
G3 X79.428 Y80.756 I-.02 J.71 E.04259
G1 X79.466 Y80.694 E.00085
; WIPE_START
G1 F12000
M204 S6000
G1 X79.502 Y80.635 E-.02642
G1 X79.599 Y80.531 E-.05384
G1 X79.81 Y80.402 E-.09383
G1 X80.054 Y80.353 E-.09482
G1 X80.089 Y80.353 E-.01324
G1 X80.229 Y80.371 E-.0534
G1 X80.363 Y80.416 E-.05378
G1 X80.486 Y80.487 E-.05389
G1 X80.592 Y80.581 E-.05387
G1 X80.677 Y80.694 E-.05389
G1 X80.739 Y80.821 E-.05387
G1 X80.774 Y80.959 E-.05397
G1 X80.781 Y81.101 E-.05383
G1 X80.762 Y81.224 E-.04734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z1.88 F42000
G1 X84.61 Y95.71 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.56
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/99
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.88 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z1.88
G1 Z1.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.247 J.904 E.01566
G1 X102.51 Y103.305 E.34943
G3 X102.178 Y104.004 I-.955 J-.026 E.01046
G3 X101.49 Y104.26 I-.877 J-1.3 E.00973
M73 P24 R12
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.063 J-.926 E.01803
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18982
G1 X101.821 Y75.817 E-.12873
G1 X102.066 Y75.918 E-.10076
G1 X102.209 Y76.023 E-.06744
G1 X102.301 Y76.119 E-.05044
G1 X102.402 Y76.269 E-.06856
G1 X102.456 Y76.39 E-.05049
G1 X102.5 Y76.565 E-.06858
G1 X102.507 Y76.657 E-.03518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.46 Z1.96 F42000
G1 X77.316 Y76.007 Z1.96
G1 Z1.56
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.33 Y75.986 E.00034
G3 X78.405 Y75.41 I1.08 J.724 E.01667
G1 X101.605 Y75.41 E.30462
G3 X102.888 Y76.637 I-.021 J1.306 E.02562
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G3 X77.188 Y76.266 I1.3 J.005 E.00588
G1 X77.289 Y76.061 E.003
; WIPE_START
G1 F12000
M204 S6000
G1 X77.33 Y75.986 E-.03266
G1 X77.489 Y75.787 E-.09687
G1 X77.737 Y75.594 E-.11928
G1 X77.966 Y75.486 E-.09608
G1 X78.213 Y75.424 E-.09703
G1 X78.405 Y75.41 E-.07319
G1 X79.05 Y75.41 E-.24491
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

G1 X86.219 Y75.825
G1 Z1.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429176
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20228
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z1.96 F42000
G1 X101.281 Y104.175 Z1.96
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z1.96 F42000
G1 X79.436 Y81.333 Z1.96
G1 Z1.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.438 Y81.331 E.00004
G3 X79.942 Y80.389 I.632 J-.268 E.01432
G1 X80.055 Y80.377 E.00132
G3 X79.504 Y81.451 I.016 J.687 E.03319
G1 X79.466 Y81.385 E.00089
M204 S250
G1 X79.494 Y80.65 F42000
G1 F2147
M204 S5000
G1 X79.502 Y80.634 E.0002
G3 X80.054 Y80.353 I.567 J.43 E.0075
G1 X80.09 Y80.353 E.00041
G3 X79.427 Y80.756 I-.021 J.711 E.04267
G1 X79.462 Y80.7 E.00076
; WIPE_START
G1 F12000
M204 S6000
G1 X79.502 Y80.634 E-.02926
G1 X79.599 Y80.531 E-.05385
G1 X79.714 Y80.448 E-.05393
G1 X79.843 Y80.39 E-.05393
G1 X80.054 Y80.353 E-.08133
G1 X80.09 Y80.353 E-.01345
G1 X80.228 Y80.371 E-.05318
G1 X80.363 Y80.416 E-.05388
G1 X80.486 Y80.487 E-.05389
G1 X80.592 Y80.581 E-.05386
G1 X80.678 Y80.694 E-.05387
G1 X80.739 Y80.822 E-.05387
G1 X80.774 Y80.959 E-.05385
G1 X80.781 Y81.101 E-.05393
G1 X80.764 Y81.215 E-.04394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z1.96 F42000
G1 Z1.56
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z1.96 F42000
G1 X84.61 Y95.71 Z1.96
G1 Z1.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/99
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.96 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z1.96
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00444
G3 X102.51 Y76.692 I-.247 J.904 E.01567
G1 X102.51 Y103.305 E.34943
G3 X102.174 Y104.007 I-.954 J-.026 E.01052
G3 X101.49 Y104.261 I-.849 J-1.237 E.00968
M73 P25 R12
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.353 Y104.209 E.10054
G3 X77.49 Y103.305 I.059 J-.92 E.01803
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18971
G1 X101.821 Y75.817 E-.12863
G1 X102.066 Y75.918 E-.1008
G1 X102.209 Y76.023 E-.06736
G1 X102.301 Y76.119 E-.05052
G1 X102.401 Y76.268 E-.06849
G1 X102.456 Y76.39 E-.05061
G1 X102.501 Y76.569 E-.07001
G1 X102.507 Y76.658 E-.03387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.462 Z2.04 F42000
G1 X77.313 Y76.013 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.333 Y75.987 E.00042
G3 X78.403 Y75.41 I1.085 J.73 E.0166
G1 X101.606 Y75.41 E.30466
G3 X102.888 Y76.637 I-.014 J1.299 E.02565
G1 X102.89 Y103.295 E.35003
G3 X101.597 Y104.59 I-1.306 J-.01 E.02663
G1 X78.405 Y104.59 E.30451
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.19 Y76.267 I1.307 J.012 E.00588
G1 X77.287 Y76.067 E.00292
; WIPE_START
G1 F12000
M204 S6000
G1 X77.333 Y75.987 E-.03483
G1 X77.487 Y75.789 E-.09567
G1 X77.685 Y75.626 E-.09726
G1 X77.965 Y75.486 E-.11906
G1 X78.221 Y75.423 E-.10011
G1 X78.403 Y75.41 E-.06921
G1 X79.045 Y75.41 E-.24386
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

G1 X86.219 Y75.825
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429166
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20227
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.04 F42000
G1 X101.281 Y104.175 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.429348
M73 P25 R11
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z2.04 F42000
G1 X79.436 Y81.333 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00003
G3 X79.917 Y80.394 I.632 J-.269 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.465 Y81.386 E.00089
M204 S250
G1 X79.492 Y80.652 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00024
G3 X80.054 Y80.353 I.567 J.43 E.0075
G1 X80.09 Y80.353 E.00042
G3 X79.427 Y80.756 I-.022 J.711 E.04266
G1 X79.46 Y80.703 E.00072
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.03051
G1 X79.599 Y80.531 E-.05401
G1 X79.714 Y80.448 E-.05386
G1 X79.843 Y80.39 E-.0539
G1 X80.054 Y80.353 E-.08131
G1 X80.09 Y80.353 E-.01362
G1 X80.228 Y80.371 E-.05302
G1 X80.363 Y80.416 E-.05388
G1 X80.486 Y80.487 E-.05394
G1 X80.592 Y80.581 E-.05379
G1 X80.677 Y80.694 E-.05385
G1 X80.739 Y80.821 E-.05387
G1 X80.774 Y80.959 E-.05393
G1 X80.781 Y81.101 E-.05388
G1 X80.764 Y81.212 E-.04264
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.04 F42000
G1 X84.61 Y95.71 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.72
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/99
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.04 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.04
G1 Z1.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.247 J.904 E.01567
G1 X102.51 Y103.305 E.34943
G3 X102.178 Y104.004 I-.975 J-.036 E.01045
G3 X101.49 Y104.26 I-.876 J-1.298 E.00973
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.353 Y104.209 E.10054
M73 P26 R11
G3 X77.49 Y103.305 I.059 J-.92 E.01803
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18978
G1 X101.821 Y75.817 E-.12873
G1 X102.066 Y75.918 E-.10072
G1 X102.208 Y76.023 E-.06727
G1 X102.301 Y76.119 E-.05066
G1 X102.401 Y76.268 E-.06825
G1 X102.456 Y76.39 E-.05074
G1 X102.501 Y76.569 E-.07005
G1 X102.507 Y76.657 E-.0338
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.464 Z2.12 F42000
G1 X77.31 Y76.017 Z2.12
G1 Z1.72
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.333 Y75.987 E.00049
G3 X78.405 Y75.41 I1.085 J.73 E.01664
G1 X101.607 Y75.41 E.30464
G3 X102.888 Y76.637 I-.023 J1.306 E.0256
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.308 J-.012 E.02665
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.012 J-1.307 E.02665
G1 X77.11 Y76.705 E.34912
G3 X77.19 Y76.267 I1.307 J.012 E.00588
G1 X77.284 Y76.072 E.00285
; WIPE_START
G1 F12000
M204 S6000
G1 X77.333 Y75.987 E-.0369
G1 X77.488 Y75.788 E-.09578
G1 X77.686 Y75.626 E-.09729
G1 X77.966 Y75.486 E-.11903
G1 X78.146 Y75.435 E-.07114
G1 X78.405 Y75.41 E-.09909
G1 X79.039 Y75.41 E-.24077
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

G1 X86.219 Y75.825
G1 Z1.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429145
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20226
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.12 F42000
G1 X101.281 Y104.175 Z2.12
G1 Z1.72
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z2.12 F42000
G1 X79.436 Y81.334 Z2.12
G1 Z1.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00002
G3 X79.917 Y80.394 I.633 J-.268 E.01404
G1 X80.053 Y80.376 E.0016
G3 X79.502 Y81.452 I.017 J.687 E.03325
G1 X79.465 Y81.386 E.00088
M204 S250
G1 X79.49 Y80.655 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00028
G3 X80.054 Y80.353 I.567 J.43 E.0075
G1 X80.091 Y80.353 E.00043
G3 X79.427 Y80.755 I-.022 J.711 E.04266
G1 X79.458 Y80.706 E.00068
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.03182
G1 X79.599 Y80.531 E-.05398
G1 X79.714 Y80.449 E-.05381
G1 X79.843 Y80.39 E-.05392
G1 X80.054 Y80.353 E-.08132
G1 X80.091 Y80.353 E-.01387
G1 X80.229 Y80.371 E-.05288
G1 X80.363 Y80.416 E-.05377
G1 X80.486 Y80.487 E-.05389
G1 X80.592 Y80.581 E-.05389
G1 X80.677 Y80.694 E-.05383
G1 X80.739 Y80.821 E-.05388
G1 X80.774 Y80.959 E-.05397
G1 X80.781 Y81.1 E-.05376
G1 X80.757 Y81.207 E-.04142
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.12 F42000
G1 Z1.72
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.12 F42000
G1 X84.61 Y95.71 Z2.12
G1 Z1.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/99
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.12 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.12
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.246 J.903 E.01566
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.954 J-.025 E.01049
G3 X101.49 Y104.261 I-.876 J-1.304 E.0097
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.057 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
M73 P27 R11
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.1899
G1 X101.821 Y75.817 E-.12875
G1 X102.064 Y75.917 E-.09981
G1 X102.174 Y75.993 E-.05089
G1 X102.304 Y76.123 E-.07002
G1 X102.379 Y76.229 E-.04909
G1 X102.457 Y76.393 E-.069
G1 X102.5 Y76.564 E-.06698
G1 X102.507 Y76.657 E-.03556
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.465 Z2.2 F42000
G1 X77.308 Y76.022 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.332 Y75.987 E.00057
G3 X78.405 Y75.41 I1.083 J.729 E.01664
G1 X101.607 Y75.41 E.30465
G3 X102.888 Y76.637 I-.023 J1.306 E.02559
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.015 J-1.308 E.02662
G1 X77.11 Y76.705 E.34912
G3 X77.19 Y76.267 I1.306 J.01 E.00588
G1 X77.282 Y76.076 E.00278
; WIPE_START
G1 F12000
M204 S6000
G1 X77.332 Y75.987 E-.03908
G1 X77.488 Y75.788 E-.09598
G1 X77.684 Y75.627 E-.09616
G1 X77.965 Y75.486 E-.1199
G1 X78.213 Y75.424 E-.09706
G1 X78.405 Y75.41 E-.0732
G1 X79.033 Y75.41 E-.23862
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

G1 X86.219 Y75.825
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429135
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20226
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.2 F42000
G1 X101.281 Y104.175 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z2.2 F42000
G1 X79.436 Y81.334 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.436 Y81.332 E.00002
G3 X79.917 Y80.393 I.634 J-.268 E.01404
G1 X80.053 Y80.376 E.0016
G3 X79.502 Y81.452 I.017 J.688 E.03327
G1 X79.465 Y81.386 E.00088
M204 S250
G1 X79.488 Y80.658 F42000
G1 F2147
M204 S5000
G1 X79.502 Y80.635 E.00032
G3 X80.054 Y80.353 I.566 J.428 E.0075
G1 X80.091 Y80.353 E.00043
G3 X79.428 Y80.756 I-.023 J.71 E.04255
G1 X79.457 Y80.709 E.00064
; WIPE_START
G1 F12000
M204 S6000
G1 X79.502 Y80.635 E-.03312
G1 X79.599 Y80.531 E-.05387
G1 X79.714 Y80.449 E-.05389
G1 X79.843 Y80.39 E-.05392
G1 X80.054 Y80.353 E-.08132
G1 X80.091 Y80.353 E-.01406
G1 X80.229 Y80.371 E-.05269
G1 X80.363 Y80.416 E-.05383
G1 X80.486 Y80.487 E-.05385
G1 X80.592 Y80.581 E-.05389
G1 X80.677 Y80.694 E-.05385
G1 X80.739 Y80.821 E-.05386
G1 X80.774 Y80.959 E-.05392
G1 X80.781 Y81.1 E-.05383
G1 X80.765 Y81.205 E-.04011
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.2 F42000
G1 X84.61 Y95.71 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.88
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/99
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.2
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.248 J.904 E.01566
G1 X102.51 Y103.305 E.34943
G3 X102.176 Y104.005 I-.974 J-.035 E.01048
G3 X101.49 Y104.26 I-.874 J-1.301 E.00969
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.353 Y104.209 E.10054
G3 X77.49 Y103.305 I.059 J-.92 E.01803
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
M73 P28 R11
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18981
G1 X101.821 Y75.817 E-.12878
G1 X102.066 Y75.918 E-.10066
G1 X102.208 Y76.022 E-.06691
G1 X102.301 Y76.119 E-.05102
G1 X102.401 Y76.267 E-.06794
G1 X102.456 Y76.39 E-.051
G1 X102.501 Y76.569 E-.07012
G1 X102.507 Y76.657 E-.03375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.466 Z2.28 F42000
G1 X77.306 Y76.027 Z2.28
G1 Z1.88
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.331 Y75.985 E.00063
G3 X78.405 Y75.41 I1.079 J.725 E.01666
G1 X101.608 Y75.41 E.30466
G3 X102.888 Y76.637 I-.024 J1.306 E.02559
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.299 J-.004 E.02669
G1 X78.405 Y104.59 E.30449
G3 X77.11 Y103.295 I.011 J-1.306 E.02666
G1 X77.11 Y76.705 E.34913
G3 X77.188 Y76.266 I1.3 J.005 E.00588
G1 X77.279 Y76.08 E.00272
; WIPE_START
G1 F12000
M204 S6000
G1 X77.331 Y75.985 E-.04101
G1 X77.489 Y75.787 E-.09659
G1 X77.737 Y75.594 E-.11934
G1 X77.916 Y75.505 E-.07592
G1 X78.148 Y75.435 E-.09225
G1 X78.405 Y75.41 E-.09815
G1 X79.028 Y75.41 E-.23673
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

G1 X86.219 Y75.825
G1 Z1.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429125
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20225
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.28 F42000
G1 X101.281 Y104.175 Z2.28
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z2.28 F42000
G1 X79.436 Y81.334 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00003
G3 X79.917 Y80.394 I.633 J-.268 E.01404
G1 X80.053 Y80.376 E.0016
G3 X79.502 Y81.452 I.017 J.687 E.03325
G1 X79.466 Y81.387 E.00087
M204 S250
G1 X79.487 Y80.661 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00036
G3 X80.054 Y80.353 I.567 J.43 E.0075
G1 X80.091 Y80.353 E.00044
G3 X79.427 Y80.755 I-.023 J.711 E.04264
G1 X79.455 Y80.712 E.0006
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.03451
G1 X79.599 Y80.531 E-.05387
G1 X79.714 Y80.448 E-.05397
G1 X79.843 Y80.39 E-.05383
G1 X80.054 Y80.353 E-.0813
G1 X80.091 Y80.353 E-.01422
G1 X80.228 Y80.371 E-.05248
G1 X80.363 Y80.416 E-.05385
G1 X80.486 Y80.487 E-.0539
G1 X80.592 Y80.581 E-.05384
G1 X80.678 Y80.694 E-.05397
G1 X80.739 Y80.821 E-.05373
G1 X80.774 Y80.959 E-.05397
G1 X80.781 Y81.1 E-.05383
G1 X80.766 Y81.201 E-.03875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.28 F42000
G1 Z1.88
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.28 F42000
G1 X84.61 Y95.71 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/99
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.28 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.28
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.248 J.904 E.01566
G1 X102.51 Y103.305 E.34944
G3 X102.177 Y104.004 I-.954 J-.026 E.01046
G3 X101.49 Y104.26 I-.875 J-1.296 E.00972
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10052
G3 X77.49 Y103.308 I.057 J-.92 E.01802
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18991
M73 P29 R11
G1 X101.821 Y75.817 E-.12877
G1 X102.066 Y75.918 E-.10083
G1 X102.207 Y76.022 E-.06661
G1 X102.301 Y76.119 E-.0511
G1 X102.401 Y76.267 E-.06789
G1 X102.456 Y76.39 E-.05119
G1 X102.5 Y76.563 E-.06783
G1 X102.507 Y76.657 E-.03587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.468 Z2.36 F42000
G1 X77.3 Y76.032 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.332 Y75.987 E.00073
G3 X78.405 Y75.41 I1.084 J.729 E.01664
G1 X101.609 Y75.41 E.30467
G3 X102.888 Y76.637 I-.025 J1.306 E.02557
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.011 E.02666
G1 X78.405 Y104.59 E.30449
G3 X77.11 Y103.295 I.011 J-1.306 E.02666
G1 X77.11 Y76.705 E.34913
G3 X77.239 Y76.149 I1.306 J.011 E.00755
G1 X77.272 Y76.085 E.00094
; WIPE_START
G1 F12000
M204 S6000
G1 X77.332 Y75.987 E-.04381
G1 X77.498 Y75.779 E-.10108
G1 X77.737 Y75.594 E-.11487
G1 X77.965 Y75.486 E-.09603
G1 X78.146 Y75.435 E-.07119
G1 X78.405 Y75.41 E-.0991
G1 X79.021 Y75.41 E-.23392
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

G1 X86.219 Y75.825
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429115
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20225
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.36 F42000
G1 X101.281 Y104.175 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z2.36 F42000
G1 X79.443 Y81.345 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.404 Y81.235 E.00137
G3 X79.917 Y80.394 I.665 J-.171 E.01283
G1 X80.053 Y80.376 E.0016
G3 X79.47 Y81.398 I.017 J.687 E.03394
M204 S250
G1 X79.485 Y80.664 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.0004
G3 X80.054 Y80.353 I.567 J.43 E.0075
G1 X80.092 Y80.353 E.00044
G3 X79.427 Y80.755 I-.024 J.711 E.04264
G1 X79.453 Y80.715 E.00056
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.03587
G1 X79.599 Y80.531 E-.05392
G1 X79.714 Y80.448 E-.05386
G1 X79.843 Y80.39 E-.0539
G1 X80.054 Y80.353 E-.08127
G1 X80.092 Y80.353 E-.01441
G1 X80.228 Y80.371 E-.05233
G1 X80.363 Y80.416 E-.05384
G1 X80.486 Y80.487 E-.05394
G1 X80.592 Y80.581 E-.05383
G1 X80.677 Y80.694 E-.05382
G1 X80.739 Y80.822 E-.05393
G1 X80.774 Y80.959 E-.05386
G1 X80.781 Y81.1 E-.05383
G1 X80.766 Y81.198 E-.0374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.36 F42000
G1 X84.61 Y95.71 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.04
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/99
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.36 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.36
G1 Z2.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.237 J.896 E.01568
G1 X102.51 Y103.308 E.34948
G3 X102.176 Y104.005 I-.958 J-.031 E.01045
G3 X101.49 Y104.26 I-.873 J-1.297 E.00969
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.057 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18973
G1 X101.821 Y75.817 E-.12869
G1 X102.063 Y75.916 E-.09936
G1 X102.174 Y75.993 E-.0513
G1 X102.303 Y76.121 E-.06914
G1 X102.4 Y76.267 E-.06653
G1 X102.456 Y76.39 E-.05132
G1 X102.5 Y76.562 E-.06767
G1 X102.507 Y76.657 E-.03626
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.469 Z2.44 F42000
G1 X77.299 Y76.036 Z2.44
G1 Z2.04
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.331 Y75.986 E.00078
G3 X78.405 Y75.41 I1.08 J.725 E.01666
G1 X101.61 Y75.41 E.30468
G3 X102.888 Y76.637 I-.026 J1.306 E.02556
G1 X102.89 Y103.295 E.35002
M73 P30 R11
G3 X101.595 Y104.59 I-1.306 J-.011 E.02666
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G3 X77.21 Y76.21 I1.3 J.005 E.00668
G1 X77.272 Y76.09 E.00178
; WIPE_START
G1 F12000
M204 S6000
G1 X77.331 Y75.986 E-.04539
G1 X77.489 Y75.787 E-.09656
G1 X77.737 Y75.594 E-.11938
G1 X77.967 Y75.485 E-.09672
G1 X78.148 Y75.435 E-.07132
G1 X78.405 Y75.41 E-.09829
G1 X79.017 Y75.41 E-.23234
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

G1 X86.219 Y75.825
G1 Z2.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429105
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20224
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.44 F42000
G1 X101.281 Y104.175 Z2.44
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z2.44 F42000
G1 X79.437 Y81.335 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00004
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.466 Y81.387 E.00087
M204 S250
G1 X79.483 Y80.667 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00044
G3 X80.054 Y80.353 I.567 J.43 E.0075
G1 X80.093 Y80.353 E.00045
G3 X79.427 Y80.755 I-.025 J.711 E.04263
G1 X79.451 Y80.718 E.00052
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.03721
G1 X79.599 Y80.531 E-.05396
G1 X79.714 Y80.448 E-.05386
G1 X79.843 Y80.39 E-.05392
G1 X80.054 Y80.353 E-.08122
G1 X80.093 Y80.353 E-.01468
G1 X80.228 Y80.371 E-.05207
G1 X80.363 Y80.416 E-.05395
G1 X80.486 Y80.487 E-.0538
G1 X80.592 Y80.581 E-.05391
G1 X80.677 Y80.694 E-.05382
G1 X80.739 Y80.821 E-.05388
G1 X80.774 Y80.959 E-.05391
G1 X80.781 Y81.1 E-.05379
G1 X80.767 Y81.194 E-.03602
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.44 F42000
G1 Z2.04
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.44 F42000
G1 X84.61 Y95.71 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/99
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.44 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.44
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.695 I-.237 J.896 E.01572
G1 X102.51 Y103.306 E.34941
G3 X102.176 Y104.005 I-.953 J-.026 E.01048
G3 X101.49 Y104.26 I-.874 J-1.299 E.0097
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.353 Y104.209 E.10054
G3 X77.49 Y103.308 I.059 J-.92 E.01799
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18985
G1 X101.821 Y75.817 E-.12876
G1 X102.063 Y75.916 E-.09924
G1 X102.174 Y75.993 E-.0514
G1 X102.303 Y76.121 E-.06905
G1 X102.4 Y76.266 E-.06645
G1 X102.457 Y76.392 E-.05244
G1 X102.492 Y76.519 E-.05018
G1 X102.506 Y76.657 E-.05263
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.471 Z2.52 F42000
G1 X77.298 Y76.043 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.332 Y75.987 E.00086
G3 X78.405 Y75.41 I1.084 J.729 E.01665
G1 X101.61 Y75.41 E.30469
G3 X102.888 Y76.637 I-.026 J1.306 E.02556
G1 X102.89 Y103.296 E.35004
G3 X101.595 Y104.59 I-1.306 J-.012 E.02664
M73 P31 R11
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.703 E.34916
G3 X77.19 Y76.267 I1.306 J.013 E.00585
G1 X77.272 Y76.097 E.00248
; WIPE_START
G1 F12000
M204 S6000
G1 X77.332 Y75.987 E-.04757
G1 X77.488 Y75.788 E-.09603
G1 X77.684 Y75.627 E-.09621
G1 X77.965 Y75.486 E-.11988
G1 X78.199 Y75.426 E-.09152
G1 X78.405 Y75.41 E-.07872
G1 X79.011 Y75.41 E-.23007
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

G1 X86.219 Y75.825
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429095
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20224
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.52 F42000
G1 X101.281 Y104.175 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z2.52 F42000
G1 X79.437 Y81.335 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00004
G3 X79.917 Y80.393 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.466 Y81.387 E.00086
M204 S250
G1 X79.481 Y80.671 F42000
G1 F2147
M204 S5000
G1 X79.502 Y80.635 E.00048
G3 X80.054 Y80.353 I.566 J.427 E.00749
G1 X80.093 Y80.353 E.00046
G3 X79.428 Y80.756 I-.025 J.709 E.04245
G1 X79.449 Y80.722 E.00047
; WIPE_START
G1 F12000
M204 S6000
G1 X79.502 Y80.635 E-.03853
G1 X79.599 Y80.531 E-.05391
G1 X79.714 Y80.448 E-.05391
G1 X79.843 Y80.39 E-.05392
G1 X80.054 Y80.353 E-.0812
G1 X80.093 Y80.353 E-.01485
G1 X80.229 Y80.371 E-.05197
G1 X80.363 Y80.416 E-.05383
G1 X80.486 Y80.487 E-.05386
G1 X80.592 Y80.581 E-.0539
G1 X80.677 Y80.694 E-.0538
G1 X80.739 Y80.822 E-.05395
G1 X80.774 Y80.959 E-.05386
G1 X80.781 Y81.1 E-.05376
G1 X80.767 Y81.191 E-.03475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.52 F42000
G1 X84.61 Y95.71 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/99
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.52 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.52
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.695 I-.26 J.913 E.01566
G1 X102.51 Y103.308 E.34944
G3 X102.176 Y104.005 I-.953 J-.028 E.01046
G3 X101.49 Y104.26 I-.873 J-1.297 E.00969
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.308 I.056 J-.92 E.01803
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18982
G1 X101.821 Y75.817 E-.12882
G1 X102.066 Y75.918 E-.1008
G1 X102.207 Y76.021 E-.06615
G1 X102.303 Y76.121 E-.05253
G1 X102.379 Y76.229 E-.05025
G1 X102.458 Y76.395 E-.06987
G1 X102.492 Y76.519 E-.04913
G1 X102.506 Y76.657 E-.05262
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.473 Z2.6 F42000
G1 X77.295 Y76.048 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F2147
M204 S5000
M73 P31 R10
G1 X77.333 Y75.987 E.00093
G3 X78.405 Y75.41 I1.085 J.731 E.01664
G1 X101.611 Y75.41 E.3047
G3 X102.888 Y76.637 I-.027 J1.306 E.02555
G1 X102.89 Y103.297 E.35006
G3 X101.597 Y104.59 I-1.308 J-.015 E.02658
G1 X78.405 Y104.59 E.30451
M73 P32 R10
G3 X77.11 Y103.295 I.013 J-1.308 E.02665
G1 X77.11 Y76.703 E.34916
G3 X77.19 Y76.267 I1.308 J.015 E.00585
G1 X77.269 Y76.102 E.00241
; WIPE_START
G1 F12000
M204 S6000
G1 X77.333 Y75.987 E-.04976
G1 X77.487 Y75.789 E-.09567
G1 X77.685 Y75.626 E-.09726
G1 X77.965 Y75.486 E-.11911
G1 X78.198 Y75.426 E-.09122
G1 X78.405 Y75.41 E-.07905
G1 X79.005 Y75.41 E-.22794
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

G1 X86.219 Y75.825
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429075
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20223
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.6 F42000
G1 X101.281 Y104.175 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z2.6 F42000
G1 X79.437 Y81.335 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00004
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.466 Y81.387 E.00086
M204 S250
G1 X79.479 Y80.674 F42000
G1 F2147
M204 S5000
G1 X79.502 Y80.634 E.00053
G3 X80.054 Y80.353 I.566 J.429 E.00749
G1 X80.093 Y80.354 E.00046
G3 X79.427 Y80.756 I-.026 J.71 E.04252
G1 X79.447 Y80.724 E.00043
; WIPE_START
G1 F12000
M204 S6000
G1 X79.502 Y80.634 E-.04004
G1 X79.599 Y80.531 E-.05388
G1 X79.714 Y80.449 E-.05381
G1 X79.843 Y80.39 E-.05396
G1 X80.054 Y80.353 E-.08119
G1 X80.093 Y80.354 E-.01505
G1 X80.228 Y80.371 E-.05176
G1 X80.363 Y80.416 E-.05382
G1 X80.485 Y80.487 E-.05382
G1 X80.592 Y80.581 E-.05396
G1 X80.677 Y80.694 E-.05382
G1 X80.739 Y80.821 E-.05386
G1 X80.774 Y80.959 E-.05392
G1 X80.781 Y81.101 E-.05391
G1 X80.768 Y81.187 E-.03318
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.6 F42000
G1 X84.61 Y95.71 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/99
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.6 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.6
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.691 I-.248 J.905 E.01565
G1 X102.51 Y103.305 E.34945
G3 X102.176 Y104.005 I-.959 J-.029 E.01048
G3 X101.49 Y104.26 I-.873 J-1.297 E.0097
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18984
G1 X101.821 Y75.817 E-.12877
G1 X102.066 Y75.918 E-.10083
G1 X102.206 Y76.021 E-.06597
G1 X102.301 Y76.119 E-.05178
G1 X102.4 Y76.266 E-.06723
G1 X102.456 Y76.39 E-.05177
G1 X102.5 Y76.561 E-.0672
G1 X102.507 Y76.657 E-.03662
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.474 Z2.68 F42000
G1 X77.29 Y76.053 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.332 Y75.987 E.00104
G3 X78.405 Y75.41 I1.083 J.729 E.01664
G1 X101.612 Y75.41 E.30471
G3 X102.888 Y76.637 I-.028 J1.306 E.02553
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.703 E.34916
M73 P33 R10
G3 X77.218 Y76.196 I1.306 J.013 E.00685
G1 X77.263 Y76.107 E.00131
; WIPE_START
G1 F12000
M204 S6000
G1 X77.332 Y75.987 E-.05274
G1 X77.488 Y75.788 E-.09588
G1 X77.723 Y75.603 E-.11378
G1 X77.965 Y75.486 E-.10226
G1 X78.146 Y75.435 E-.07116
G1 X78.405 Y75.41 E-.09909
G1 X78.998 Y75.41 E-.22509
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

G1 X86.219 Y75.825
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429064
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20222
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.68 F42000
G1 X101.281 Y104.175 Z2.68
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z2.68 F42000
G1 X79.437 Y81.336 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.438 Y81.332 E.00005
G3 X79.917 Y80.393 I.632 J-.268 E.01404
G1 X80.053 Y80.376 E.00159
G3 X79.503 Y81.451 I.017 J.687 E.03322
G1 X79.467 Y81.388 E.00085
M204 S250
G1 X79.477 Y80.677 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00057
G3 X80.054 Y80.353 I.567 J.43 E.0075
G1 X80.094 Y80.354 E.00047
G3 X79.427 Y80.755 I-.026 J.711 E.04262
G1 X79.445 Y80.727 E.00038
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.04142
G1 X79.599 Y80.531 E-.054
G1 X79.714 Y80.448 E-.05387
G1 X79.843 Y80.39 E-.05385
G1 X80.054 Y80.353 E-.08121
G1 X80.094 Y80.354 E-.01523
G1 X80.229 Y80.371 E-.0516
G1 X80.363 Y80.416 E-.05385
G1 X80.486 Y80.487 E-.05385
G1 X80.592 Y80.581 E-.05388
G1 X80.677 Y80.694 E-.05384
G1 X80.739 Y80.822 E-.05396
G1 X80.774 Y80.959 E-.05383
G1 X80.781 Y81.101 E-.0539
G1 X80.769 Y81.183 E-.03172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.68 F42000
G1 X84.61 Y95.71 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.36
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/99
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.68 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.68
G1 Z2.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.746 E.00649
G1 X101.82 Y75.817 E.00444
G3 X102.51 Y76.692 I-.248 J.905 E.01566
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.954 J-.025 E.01049
G3 X101.49 Y104.26 I-.872 J-1.295 E.00969
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.353 Y104.209 E.10054
G3 X77.49 Y103.305 I.06 J-.92 E.01803
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.746 E-.18915
G1 X101.82 Y75.817 E-.12845
G1 X102.066 Y75.918 E-.10105
G1 X102.206 Y76.021 E-.06578
G1 X102.301 Y76.119 E-.05189
G1 X102.4 Y76.265 E-.06708
G1 X102.456 Y76.39 E-.05194
G1 X102.499 Y76.561 E-.06708
G1 X102.507 Y76.659 E-.03759
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.477 Z2.76 F42000
G1 X77.286 Y76.057 Z2.76
G1 Z2.36
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.332 Y75.987 E.00111
G3 X78.405 Y75.41 I1.084 J.729 E.01664
G1 X101.613 Y75.41 E.30472
G3 X102.888 Y76.637 I-.029 J1.306 E.02552
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.299 J-.006 E.02667
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.006 J-1.299 E.02667
G1 X77.11 Y76.704 E.34914
G3 X77.239 Y76.149 I1.306 J.012 E.00754
G1 X77.259 Y76.111 E.00057
; WIPE_START
M73 P34 R10
G1 F12000
M204 S6000
G1 X77.332 Y75.987 E-.05475
G1 X77.5 Y75.776 E-.10247
G1 X77.737 Y75.594 E-.11345
G1 X77.965 Y75.486 E-.09611
G1 X78.213 Y75.424 E-.09706
G1 X78.405 Y75.41 E-.07322
G1 X78.992 Y75.41 E-.22295
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

G1 X86.219 Y75.825
G1 Z2.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429054
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20222
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.76 F42000
G1 X101.281 Y104.175 Z2.76
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z2.76 F42000
G1 X79.438 Y81.335 Z2.76
G1 Z2.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.435 Y81.327 E.00009
G3 X79.917 Y80.394 I.634 J-.264 E.01397
G1 X80.053 Y80.376 E.0016
G3 X79.506 Y81.455 I.017 J.687 E.03316
G1 X79.467 Y81.387 E.00092
M204 S250
G1 X79.475 Y80.68 F42000
G1 F2147
M204 S5000
G1 X79.502 Y80.635 E.00062
G3 X80.054 Y80.353 I.566 J.427 E.00749
G1 X80.094 Y80.354 E.00048
G3 X79.428 Y80.756 I-.027 J.709 E.04243
G1 X79.443 Y80.731 E.00034
; WIPE_START
G1 F12000
M204 S6000
G1 X79.502 Y80.635 E-.04283
G1 X79.599 Y80.531 E-.05393
G1 X79.714 Y80.449 E-.05382
G1 X79.843 Y80.39 E-.05391
G1 X80.054 Y80.353 E-.08119
G1 X80.094 Y80.354 E-.01546
G1 X80.229 Y80.371 E-.0514
G1 X80.363 Y80.416 E-.05388
G1 X80.486 Y80.487 E-.05382
G1 X80.592 Y80.581 E-.05389
G1 X80.677 Y80.694 E-.05386
G1 X80.739 Y80.822 E-.05389
G1 X80.774 Y80.959 E-.05385
G1 X80.781 Y81.101 E-.05392
G1 X80.769 Y81.18 E-.03035
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.76 F42000
G1 Z2.36
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.76 F42000
G1 X84.61 Y95.71 Z2.76
G1 Z2.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/99
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.76 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.76
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00652
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.257 J.911 E.01563
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.953 J-.025 E.01049
G3 X101.49 Y104.261 I-.875 J-1.299 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.19003
G1 X101.821 Y75.817 E-.12888
G1 X102.066 Y75.918 E-.10077
G1 X102.212 Y76.026 E-.06889
G1 X102.303 Y76.121 E-.05006
G1 X102.379 Y76.229 E-.05007
G1 X102.457 Y76.393 E-.06888
G1 X102.499 Y76.56 E-.06573
G1 X102.507 Y76.657 E-.0367
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.477 Z2.84 F42000
G1 X77.287 Y76.065 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.333 Y75.988 E.00118
G3 X78.405 Y75.41 I1.085 J.731 E.01663
G1 X101.614 Y75.41 E.30473
G3 X102.888 Y76.637 I-.029 J1.306 E.02551
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.19 Y76.267 I1.308 J.013 E.00588
G1 X77.261 Y76.119 E.00216
; WIPE_START
M73 P35 R10
G1 F12000
M204 S6000
G1 X77.333 Y75.988 E-.05695
G1 X77.487 Y75.789 E-.0957
G1 X77.685 Y75.626 E-.09728
G1 X77.965 Y75.486 E-.11877
G1 X78.213 Y75.424 E-.09722
G1 X78.405 Y75.41 E-.07335
G1 X78.986 Y75.41 E-.22074
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

G1 X86.219 Y75.825
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429034
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20221
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.84 F42000
G1 X101.281 Y104.175 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.556 Y97.022 Z2.84 F42000
G1 X79.482 Y80.707 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.485 Y80.707 E.00004
G3 X79.985 Y80.382 I.587 J.356 E.00721
G1 X80.058 Y80.377 E.00086
G3 X79.426 Y80.831 I.015 J.687 E.04077
G1 X79.457 Y80.762 E.00088
M204 S250
G1 X79.416 Y81.346 F42000
G1 F2147
M204 S5000
G1 X79.416 Y81.341 E.00007
G3 X80.052 Y80.353 I.654 J-.277 E.01616
G1 X80.123 Y80.355 E.00083
G3 X79.484 Y81.464 I-.053 J.708 E.0335
G1 X79.446 Y81.398 E.00089
; WIPE_START
G1 F12000
M204 S6000
G1 X79.416 Y81.341 E-.02471
G1 X79.372 Y81.206 E-.05375
G1 X79.358 Y81.065 E-.05389
G1 X79.401 Y80.822 E-.09386
G1 X79.463 Y80.694 E-.054
G1 X79.548 Y80.581 E-.05385
G1 X79.654 Y80.487 E-.05388
G1 X79.777 Y80.416 E-.05389
G1 X79.912 Y80.371 E-.05388
G1 X80.052 Y80.353 E-.05381
G1 X80.123 Y80.355 E-.02701
G1 X80.33 Y80.402 E-.08065
G1 X80.456 Y80.467 E-.05384
G1 X80.557 Y80.547 E-.04898
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.84 F42000
G1 X84.61 Y95.71 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.52
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/99
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.84 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.84
G1 Z2.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.745 E.0065
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.692 I-.249 J.905 E.01565
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.954 J-.025 E.01049
G3 X101.49 Y104.26 I-.868 J-1.287 E.00969
G1 X101.49 Y103.76 E.00656
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.057 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.745 E-.18952
G1 X101.821 Y75.817 E-.12866
G1 X102.066 Y75.918 E-.10084
G1 X102.205 Y76.02 E-.06554
G1 X102.301 Y76.119 E-.05222
G1 X102.399 Y76.265 E-.06679
G1 X102.456 Y76.39 E-.05215
G1 X102.499 Y76.56 E-.0668
G1 X102.507 Y76.658 E-.03747
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.481 Z2.92 F42000
G1 X77.278 Y76.071 Z2.92
G1 Z2.52
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.296 Y76.038 E.0005
G3 X78.405 Y75.41 I1.112 J.67 E.01749
G1 X101.614 Y75.41 E.30474
G3 X102.888 Y76.637 I-.03 J1.306 E.0255
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.299 J-.006 E.02667
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.003 J-1.299 E.0267
G1 X77.11 Y76.705 E.34912
G3 X77.188 Y76.267 I1.299 J.003 E.00588
G1 X77.252 Y76.126 E.00204
; WIPE_START
G1 F12000
M204 S6000
G1 X77.296 Y76.038 E-.03713
G1 X77.49 Y75.786 E-.12079
G1 X77.737 Y75.594 E-.11898
G1 X77.966 Y75.486 E-.09615
G1 X78.146 Y75.435 E-.07112
G1 X78.405 Y75.41 E-.0991
G1 X78.976 Y75.41 E-.21673
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

G1 X86.219 Y75.825
G1 Z2.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429024
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.2022
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
M73 P36 R10
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z2.92 F42000
G1 X101.281 Y104.175 Z2.92
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z2.92 F42000
G1 X79.438 Y81.337 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00006
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.467 Y81.389 E.00084
M204 S250
G1 X79.453 Y80.716 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00111
G3 X80.054 Y80.353 I.566 J.431 E.0075
G1 X80.095 Y80.354 E.00049
G3 X79.421 Y80.766 I-.028 J.711 E.04245
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.05876
G1 X79.599 Y80.531 E-.05393
G1 X79.714 Y80.448 E-.0539
G1 X79.843 Y80.39 E-.05383
G1 X80.054 Y80.353 E-.08119
G1 X80.095 Y80.354 E-.01587
G1 X80.229 Y80.371 E-.05105
G1 X80.363 Y80.416 E-.0538
G1 X80.485 Y80.487 E-.05385
G1 X80.592 Y80.581 E-.05392
G1 X80.678 Y80.694 E-.05389
G1 X80.739 Y80.821 E-.05383
G1 X80.774 Y80.959 E-.05398
G1 X80.781 Y81.101 E-.05383
G1 X80.775 Y81.138 E-.01438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z2.92 F42000
G1 Z2.52
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z2.92 F42000
G1 X84.61 Y95.71 Z2.92
G1 Z2.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/99
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.92 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z2.92
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.744 E.00651
G1 X101.821 Y75.817 E.00445
G3 X102.51 Y76.695 I-.249 J.905 E.01569
G1 X102.51 Y103.305 E.3494
G3 X102.176 Y104.005 I-.972 J-.034 E.01048
G3 X101.49 Y104.26 I-.872 J-1.294 E.00969
G1 X101.49 Y103.76 E.00657
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.744 E-.18976
G1 X101.821 Y75.817 E-.12884
G1 X102.066 Y75.918 E-.10075
G1 X102.205 Y76.02 E-.06537
G1 X102.301 Y76.119 E-.05234
G1 X102.399 Y76.264 E-.06662
G1 X102.457 Y76.392 E-.05327
G1 X102.492 Y76.52 E-.05041
G1 X102.506 Y76.657 E-.05264
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.481 Z3 F42000
G1 X77.281 Y76.075 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.333 Y75.988 E.00134
G3 X78.405 Y75.41 I1.085 J.731 E.01663
G1 X101.615 Y75.411 E.30475
G3 X102.888 Y76.637 I-.031 J1.306 E.0255
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.011 E.02666
G1 X78.405 Y104.59 E.30449
G3 X77.11 Y103.295 I.011 J-1.306 E.02666
G1 X77.11 Y76.705 E.34913
G3 X77.19 Y76.267 I1.309 J.013 E.00588
G1 X77.256 Y76.13 E.002
; WIPE_START
G1 F12000
M204 S6000
G1 X77.333 Y75.988 E-.06151
G1 X77.487 Y75.789 E-.09566
G1 X77.685 Y75.626 E-.09728
G1 X77.965 Y75.486 E-.11912
G1 X78.146 Y75.435 E-.07118
G1 X78.405 Y75.41 E-.0991
G1 X78.974 Y75.41 E-.21616
; WIPE_END
G1 E-.04 F1800
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

G1 X86.219 Y75.825
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429004
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20219
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3 F42000
G1 X101.281 Y104.175 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
M73 P37 R10
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3 F42000
G1 X79.438 Y81.337 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00006
G3 X79.917 Y80.393 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.467 Y81.389 E.00084
M204 S250
G1 X79.451 Y80.719 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00115
G3 X80.054 Y80.353 I.566 J.429 E.00749
G1 X80.096 Y80.354 E.00049
G3 X79.42 Y80.771 I-.028 J.71 E.0423
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.06019
G1 X79.599 Y80.531 E-.05389
G1 X79.714 Y80.448 E-.05398
G1 X79.843 Y80.39 E-.05382
G1 X80.054 Y80.353 E-.08115
G1 X80.096 Y80.354 E-.01602
G1 X80.229 Y80.371 E-.05089
G1 X80.363 Y80.416 E-.05377
G1 X80.486 Y80.487 E-.05394
G1 X80.592 Y80.581 E-.05389
G1 X80.678 Y80.694 E-.05388
G1 X80.739 Y80.822 E-.05386
G1 X80.774 Y80.959 E-.05385
G1 X80.781 Y81.101 E-.05391
G1 X80.776 Y81.134 E-.01297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3 F42000
G1 X84.61 Y95.71 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.68
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/99
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3
G1 Z2.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.73 E.00669
G1 X101.902 Y75.841 E.0056
G3 X102.51 Y76.692 I-.307 J.862 E.01462
G1 X102.51 Y103.305 E.34944
G3 X102.177 Y104.004 I-.954 J-.026 E.01047
G3 X101.49 Y104.262 I-.881 J-1.303 E.00973
G1 X101.49 Y103.76 E.00659
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.73 E-.195
G1 X101.902 Y75.841 E-.162
G1 X102.14 Y75.968 E-.10269
G1 X102.356 Y76.193 E-.11859
G1 X102.456 Y76.389 E-.0836
G1 X102.499 Y76.559 E-.06654
G1 X102.506 Y76.642 E-.03157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.472 Z3.08 F42000
G1 X77.279 Y76.081 Z3.08
G1 Z2.68
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.333 Y75.988 E.00142
G3 X78.405 Y75.41 I1.085 J.731 E.01663
G1 X101.616 Y75.411 E.30476
G3 X102.888 Y76.637 I-.031 J1.306 E.02549
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.19 Y76.267 I1.309 J.013 E.00588
G1 X77.253 Y76.135 E.00192
; WIPE_START
G1 F12000
M204 S6000
G1 X77.333 Y75.988 E-.06384
G1 X77.487 Y75.789 E-.09568
G1 X77.685 Y75.626 E-.09713
G1 X77.966 Y75.486 E-.11929
G1 X78.146 Y75.435 E-.07112
G1 X78.405 Y75.41 E-.0991
G1 X78.968 Y75.41 E-.21385
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

G1 X86.219 Y75.825
G1 Z2.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429004
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20219
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.08 F42000
G1 X101.281 Y104.175 Z3.08
G1 Z2.68
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.08 F42000
G1 X79.444 Y81.348 Z3.08
G1 Z2.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
M73 P38 R10
G1 X79.404 Y81.234 E.0014
G3 X79.917 Y80.394 I.665 J-.171 E.01283
G1 X80.053 Y80.376 E.0016
G3 X79.471 Y81.401 I.017 J.687 E.03391
M204 S250
G1 X79.449 Y80.723 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.0012
G3 X80.054 Y80.353 I.566 J.431 E.0075
G1 X80.096 Y80.354 E.0005
G3 X79.418 Y80.774 I-.029 J.711 E.04235
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.06166
G1 X79.599 Y80.531 E-.05399
G1 X79.714 Y80.448 E-.05392
G1 X79.843 Y80.39 E-.05382
G1 X80.054 Y80.353 E-.08116
G1 X80.096 Y80.354 E-.01619
G1 X80.228 Y80.371 E-.05067
G1 X80.363 Y80.416 E-.05386
G1 X80.486 Y80.487 E-.05392
G1 X80.592 Y80.581 E-.05386
G1 X80.677 Y80.694 E-.05384
G1 X80.739 Y80.822 E-.05393
G1 X80.774 Y80.959 E-.05384
G1 X80.781 Y81.101 E-.05389
G1 X80.777 Y81.13 E-.01147
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.08 F42000
G1 Z2.68
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
M73 P38 R9
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.08 F42000
G1 X84.61 Y95.71 Z3.08
G1 Z2.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/99
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.08 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.08
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00652
G1 X101.821 Y75.817 E.00446
G3 X102.51 Y76.692 I-.25 J.905 E.01565
G1 X102.51 Y103.305 E.34943
G3 X102.176 Y104.005 I-.972 J-.034 E.01048
G3 X101.49 Y104.261 I-.875 J-1.299 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.308 I.057 J-.92 E.01803
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19015
G1 X101.821 Y75.817 E-.12899
G1 X102.066 Y75.918 E-.10072
G1 X102.204 Y76.019 E-.06507
G1 X102.301 Y76.119 E-.05258
G1 X102.399 Y76.263 E-.06636
G1 X102.456 Y76.39 E-.05266
G1 X102.501 Y76.569 E-.07017
G1 X102.507 Y76.656 E-.0333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.877 Y76.482 Z3.16 F42000
G1 X77.272 Y76.082 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.328 Y75.984 E.00148
G3 X78.405 Y75.41 I1.074 J.718 E.0167
G1 X101.616 Y75.411 E.30477
G3 X102.888 Y76.637 I-.032 J1.306 E.02547
G1 X102.89 Y103.295 E.35002
G3 X101.595 Y104.59 I-1.291 J.004 E.02674
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I-.004 J-1.291 E.02674
G1 X77.11 Y76.705 E.34912
G3 X77.235 Y76.148 I1.292 J-.003 E.00757
G1 X77.243 Y76.134 E.0002
; WIPE_START
G1 F12000
M204 S6000
G1 X77.328 Y75.984 E-.06564
G1 X77.501 Y75.776 E-.10289
G1 X77.737 Y75.594 E-.1132
G1 X77.965 Y75.486 E-.0961
G1 X78.193 Y75.427 E-.08931
G1 X78.405 Y75.41 E-.08096
G1 X78.963 Y75.41 E-.2119
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

G1 X86.219 Y75.825
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428993
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20219
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.16 F42000
G1 X101.281 Y104.175 Z3.16
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.16 F42000
G1 X79.438 Y81.337 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00006
G3 X79.917 Y80.394 I.632 J-.269 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.467 Y81.389 E.00084
M204 S250
G1 X79.447 Y80.726 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00125
G3 X80.054 Y80.353 I.566 J.429 E.00749
G1 X80.097 Y80.354 E.0005
G3 X79.417 Y80.778 I-.029 J.71 E.0422
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.0632
G1 X79.599 Y80.531 E-.05387
G1 X79.714 Y80.448 E-.05395
G1 X79.843 Y80.39 E-.05389
G1 X80.054 Y80.353 E-.08111
G1 X80.097 Y80.354 E-.01638
G1 X80.228 Y80.371 E-.05048
G1 X80.363 Y80.416 E-.05385
G1 X80.486 Y80.487 E-.05393
G1 X80.592 Y80.581 E-.05388
G1 X80.677 Y80.694 E-.05385
G1 X80.739 Y80.822 E-.05387
G1 X80.774 Y80.959 E-.05393
G1 X80.781 Y81.101 E-.05384
G1 X80.777 Y81.127 E-.00999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
M73 P39 R9
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.16 F42000
G1 X84.61 Y95.71 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.84
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/99
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.16 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.16
G1 Z2.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.901 Y75.841 E.00558
G3 X102.51 Y76.692 I-.306 J.862 E.01462
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.954 J-.025 E.01049
G3 X101.49 Y104.261 I-.876 J-1.3 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.057 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19396
G1 X101.901 Y75.841 E-.16152
G1 X102.059 Y75.914 E-.06623
G1 X102.174 Y75.993 E-.05278
G1 X102.356 Y76.193 E-.10287
G1 X102.456 Y76.39 E-.08378
G1 X102.499 Y76.558 E-.06614
G1 X102.506 Y76.644 E-.03272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.476 Z3.24 F42000
G1 X77.274 Y76.089 Z3.24
G1 Z2.84
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.331 Y75.986 E.00154
G3 X78.405 Y75.41 I1.081 J.725 E.01667
G1 X101.617 Y75.411 E.30478
G3 X102.888 Y76.637 I-.033 J1.306 E.02547
G1 X102.89 Y103.295 E.35002
G3 X101.595 Y104.59 I-1.296 J0 E.02672
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I-.004 J-1.291 E.02674
G1 X77.11 Y76.705 E.34912
G3 X77.188 Y76.266 I1.301 J.006 E.00588
G1 X77.248 Y76.143 E.0018
; WIPE_START
G1 F12000
M204 S6000
G1 X77.331 Y75.986 E-.06727
G1 X77.489 Y75.787 E-.09673
G1 X77.737 Y75.594 E-.11949
G1 X77.965 Y75.486 E-.09604
G1 X78.146 Y75.435 E-.07115
G1 X78.405 Y75.41 E-.0991
G1 X78.959 Y75.41 E-.21021
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

G1 X86.219 Y75.825
G1 Z2.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428983
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20218
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.24 F42000
G1 X101.281 Y104.175 Z3.24
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.24 F42000
G1 X79.438 Y81.338 Z3.24
G1 Z2.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.436 Y81.332 E.00007
G3 X79.917 Y80.393 I.633 J-.268 E.01404
G1 X80.053 Y80.376 E.0016
G3 X79.502 Y81.452 I.017 J.688 E.03326
G1 X79.467 Y81.39 E.00083
M204 S250
G1 X79.445 Y80.729 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00129
G3 X80.054 Y80.353 I.566 J.431 E.0075
G1 X80.097 Y80.354 E.00051
G3 X79.415 Y80.781 I-.03 J.711 E.04224
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.06461
G1 X79.599 Y80.531 E-.054
G1 X79.714 Y80.448 E-.05394
G1 X79.843 Y80.39 E-.05384
G1 X80.054 Y80.353 E-.08113
G1 X80.097 Y80.354 E-.01654
G1 X80.229 Y80.371 E-.05038
G1 X80.363 Y80.416 E-.05382
G1 X80.486 Y80.487 E-.05387
G1 X80.592 Y80.581 E-.05387
G1 X80.677 Y80.694 E-.05389
G1 X80.739 Y80.822 E-.05387
G1 X80.774 Y80.959 E-.05389
G1 X80.781 Y81.101 E-.05387
G1 X80.778 Y81.123 E-.00848
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.24 F42000
G1 Z2.84
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.24 F42000
G1 X84.61 Y95.71 Z3.24
G1 Z2.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/99
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.24 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.24
G1 Z2.92
M73 P40 R9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.901 Y75.841 E.00558
G3 X102.51 Y76.695 I-.306 J.862 E.01467
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.953 J-.025 E.0105
G3 X101.49 Y104.261 I-.876 J-1.3 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.063 J-.926 E.01803
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19397
G1 X101.901 Y75.841 E-.16153
G1 X102.059 Y75.914 E-.06612
G1 X102.174 Y75.993 E-.05286
G1 X102.356 Y76.193 E-.10291
G1 X102.457 Y76.392 E-.08465
G1 X102.492 Y76.52 E-.05044
G1 X102.505 Y76.644 E-.04753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.874 Y76.479 Z3.32 F42000
G1 X77.265 Y76.098 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.295 Y76.038 E.00089
G3 X78.405 Y75.41 I1.109 J.667 E.01751
G1 X101.618 Y75.411 E.30479
G3 X102.888 Y76.637 I-.034 J1.306 E.02545
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.291 J.002 E.02671
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I-.002 J-1.291 E.02671
G1 X77.11 Y76.705 E.34912
G3 X77.187 Y76.266 I1.294 J-.001 E.00589
G1 X77.239 Y76.153 E.00164
; WIPE_START
G1 F12000
M204 S6000
G1 X77.295 Y76.038 E-.04849
G1 X77.488 Y75.788 E-.11991
G1 X77.721 Y75.604 E-.11267
G1 X77.965 Y75.486 E-.10337
G1 X78.146 Y75.435 E-.07116
G1 X78.405 Y75.41 E-.0991
G1 X78.946 Y75.41 E-.2053
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

G1 X86.219 Y75.825
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428963
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20217
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.32 F42000
G1 X101.281 Y104.175 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.32 F42000
G1 X79.444 Y81.349 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.404 Y81.234 E.00141
G3 X79.917 Y80.393 I.665 J-.171 E.01283
G1 X80.053 Y80.376 E.0016
G3 X79.472 Y81.402 I.017 J.687 E.0339
M204 S250
G1 X79.443 Y80.733 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00134
G3 X80.054 Y80.353 I.566 J.431 E.0075
G1 X80.098 Y80.354 E.00052
G3 X79.413 Y80.784 I-.03 J.711 E.04219
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.06614
G1 X79.599 Y80.531 E-.05391
G1 X79.714 Y80.449 E-.05392
G1 X79.843 Y80.39 E-.05387
G1 X80.054 Y80.353 E-.08116
G1 X80.098 Y80.354 E-.01679
G1 X80.228 Y80.371 E-.05006
G1 X80.363 Y80.416 E-.05392
G1 X80.486 Y80.487 E-.05384
G1 X80.592 Y80.581 E-.05393
G1 X80.677 Y80.694 E-.05382
G1 X80.739 Y80.822 E-.0539
G1 X80.774 Y80.959 E-.05393
G1 X80.781 Y81.101 E-.05385
G1 X80.777 Y81.118 E-.00698
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.32 F42000
G1 X84.61 Y95.71 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/99
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.32 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.32
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00652
G1 X101.821 Y75.817 E.00446
G3 X102.51 Y76.692 I-.247 J.903 E.01565
G1 X102.51 Y103.305 E.34944
G3 X102.175 Y104.005 I-.954 J-.026 E.0105
G3 X101.49 Y104.261 I-.874 J-1.297 E.0097
M73 P41 R9
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.34941
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19017
G1 X101.821 Y75.817 E-.12907
G1 X102.066 Y75.918 E-.10072
G1 X102.212 Y76.026 E-.06884
G1 X102.301 Y76.119 E-.04906
G1 X102.398 Y76.262 E-.06555
G1 X102.456 Y76.39 E-.05311
G1 X102.499 Y76.557 E-.06585
G1 X102.507 Y76.656 E-.03763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.488 Z3.4 F42000
G1 X77.269 Y76.1 Z3.4
G1 Z3
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.328 Y75.984 E.00171
G3 X78.405 Y75.41 I1.074 J.717 E.0167
G1 X101.619 Y75.411 E.3048
G3 X102.888 Y76.637 I-.034 J1.306 E.02544
G1 X102.89 Y103.295 E.35003
G3 X101.597 Y104.59 I-1.306 J-.01 E.02663
G1 X78.405 Y104.59 E.30451
G3 X77.11 Y103.295 I-.001 J-1.294 E.02672
G1 X77.11 Y76.705 E.34912
G3 X77.186 Y76.266 I1.291 J-.004 E.00589
G1 X77.242 Y76.154 E.00165
; WIPE_START
G1 F12000
M204 S6000
G1 X77.328 Y75.984 E-.07217
G1 X77.49 Y75.786 E-.09722
G1 X77.735 Y75.595 E-.11813
G1 X77.966 Y75.486 E-.09703
G1 X78.146 Y75.435 E-.07108
G1 X78.405 Y75.41 E-.0991
G1 X78.946 Y75.41 E-.20527
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

G1 X86.219 Y75.825
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428953
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20217
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.4 F42000
G1 X101.281 Y104.175 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.4 F42000
G1 X79.438 Y81.338 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.439 Y81.331 E.00008
G3 X79.984 Y80.382 I.633 J-.267 E.01479
G1 X80.058 Y80.377 E.00086
G3 X79.504 Y81.451 I.015 J.687 E.03322
G1 X79.469 Y81.39 E.00082
M204 S250
G1 X79.441 Y80.736 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00139
G3 X80.053 Y80.353 I.566 J.431 E.00749
G1 X80.098 Y80.354 E.00052
G3 X79.412 Y80.788 I-.031 J.711 E.04214
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.0677
G1 X79.599 Y80.531 E-.05397
G1 X79.714 Y80.448 E-.0539
G1 X79.843 Y80.39 E-.0538
G1 X80.053 Y80.353 E-.08112
G1 X80.098 Y80.354 E-.01695
G1 X80.228 Y80.371 E-.04997
G1 X80.363 Y80.416 E-.05381
G1 X80.486 Y80.487 E-.05391
G1 X80.592 Y80.581 E-.05388
G1 X80.677 Y80.694 E-.05381
G1 X80.739 Y80.822 E-.05395
G1 X80.774 Y80.959 E-.05387
G1 X80.781 Y81.101 E-.05389
G1 X80.779 Y81.115 E-.00546
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.4 F42000
G1 X84.61 Y95.71 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/99
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.4 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.4
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00665
G1 X101.901 Y75.841 E.00558
G3 X102.51 Y76.692 I-.306 J.862 E.01463
G1 X102.51 Y103.305 E.34943
G3 X102.176 Y104.005 I-.971 J-.034 E.01048
G3 X101.49 Y104.261 I-.875 J-1.296 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.354 Y104.209 E.10052
M73 P42 R9
G3 X77.49 Y103.308 I.058 J-.92 E.01801
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19391
G1 X101.901 Y75.841 E-.16147
G1 X102.141 Y75.968 E-.10302
G1 X102.356 Y76.193 E-.11841
G1 X102.456 Y76.389 E-.08376
G1 X102.501 Y76.569 E-.0702
G1 X102.507 Y76.645 E-.02924
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.482 Z3.48 F42000
G1 X77.261 Y76.106 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.328 Y75.984 E.00183
G3 X78.405 Y75.41 I1.074 J.719 E.01669
G1 X101.619 Y75.411 E.30481
G3 X102.888 Y76.637 I-.035 J1.306 E.02543
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G3 X77.217 Y76.188 I1.292 J-.003 E.00699
G1 X77.233 Y76.159 E.00043
; WIPE_START
G1 F12000
M204 S6000
G1 X77.328 Y75.984 E-.07577
G1 X77.503 Y75.774 E-.10389
G1 X77.737 Y75.594 E-.11211
G1 X77.965 Y75.486 E-.09608
G1 X78.19 Y75.428 E-.08821
G1 X78.405 Y75.41 E-.08206
G1 X78.937 Y75.41 E-.20188
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

G1 X86.219 Y75.825
G1 Z3.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428943
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20216
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.48 F42000
G1 X101.281 Y104.175 Z3.48
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.48 F42000
G1 X79.439 Y81.339 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00008
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.468 Y81.391 E.00082
M204 S250
G1 X79.439 Y80.74 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00143
G3 X80.053 Y80.353 I.566 J.429 E.00749
G1 X80.099 Y80.354 E.00053
G3 X79.411 Y80.792 I-.031 J.709 E.04199
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.06924
G1 X79.599 Y80.531 E-.05387
G1 X79.714 Y80.448 E-.0539
G1 X79.843 Y80.39 E-.05395
G1 X80.053 Y80.353 E-.08104
G1 X80.099 Y80.354 E-.01715
G1 X80.228 Y80.371 E-.04974
G1 X80.363 Y80.416 E-.05393
G1 X80.486 Y80.487 E-.05387
G1 X80.592 Y80.581 E-.05389
G1 X80.677 Y80.694 E-.05383
G1 X80.739 Y80.821 E-.05385
G1 X80.774 Y80.959 E-.05394
G1 X80.781 Y81.098 E-.05294
G1 X80.778 Y81.111 E-.00486
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.48 F42000
G1 X84.61 Y95.71 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.16
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/99
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.48 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.48
G1 Z3.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00665
G1 X101.901 Y75.841 E.00558
G3 X102.51 Y76.692 I-.306 J.862 E.01463
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.954 J-.026 E.01049
G3 X101.49 Y104.261 I-.874 J-1.295 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.308 I.057 J-.92 E.01803
G1 X77.49 Y76.695 E.34943
M73 P43 R9
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19394
G1 X101.901 Y75.841 E-.1615
G1 X102.14 Y75.968 E-.10292
G1 X102.356 Y76.193 E-.11847
G1 X102.456 Y76.39 E-.08382
G1 X102.501 Y76.569 E-.07018
G1 X102.507 Y76.645 E-.02917
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.484 Z3.56 F42000
G1 X77.264 Y76.111 Z3.56
G1 Z3.16
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.331 Y75.986 E.00186
G3 X78.405 Y75.41 I1.081 J.725 E.01666
G1 X101.62 Y75.411 E.30481
G3 X102.888 Y76.637 I-.036 J1.306 E.02542
G1 X102.89 Y103.296 E.35004
G3 X101.595 Y104.59 I-1.299 J-.004 E.02668
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I-.004 J-1.291 E.02674
G1 X77.11 Y76.705 E.34912
G3 X77.188 Y76.267 I1.301 J.006 E.00588
G1 X77.237 Y76.165 E.00148
; WIPE_START
G1 F12000
M204 S6000
G1 X77.331 Y75.986 E-.07656
G1 X77.489 Y75.787 E-.09656
G1 X77.737 Y75.594 E-.11956
G1 X77.965 Y75.486 E-.09604
G1 X78.19 Y75.428 E-.08801
G1 X78.405 Y75.41 E-.08226
G1 X78.934 Y75.41 E-.201
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

G1 X86.219 Y75.825
G1 Z3.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428923
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20215
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.56 F42000
G1 X101.281 Y104.175 Z3.56
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.56 F42000
G1 X79.438 Y81.338 Z3.56
G1 Z3.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00008
G3 X79.917 Y80.393 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.468 Y81.39 E.00083
M204 S250
G1 X79.437 Y80.743 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00148
G3 X80.053 Y80.353 I.566 J.431 E.00749
G1 X80.099 Y80.354 E.00053
G3 X79.408 Y80.795 I-.032 J.711 E.04203
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.07074
G1 X79.599 Y80.531 E-.05391
G1 X79.714 Y80.448 E-.0539
G1 X79.843 Y80.39 E-.05384
G1 X80.053 Y80.353 E-.08111
G1 X80.099 Y80.354 E-.01739
G1 X80.229 Y80.371 E-.0496
G1 X80.363 Y80.416 E-.05379
G1 X80.486 Y80.487 E-.05394
G1 X80.592 Y80.581 E-.05381
G1 X80.677 Y80.694 E-.0539
G1 X80.739 Y80.822 E-.05393
G1 X80.774 Y80.959 E-.05385
G1 X80.781 Y81.101 E-.05386
G1 X80.78 Y81.107 E-.00242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.56 F42000
G1 Z3.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.56 F42000
G1 X84.61 Y95.71 Z3.56
G1 Z3.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/99
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.56 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.56
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00665
G1 X101.901 Y75.841 E.00558
G3 X102.51 Y76.692 I-.306 J.862 E.01463
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.954 J-.026 E.01049
G3 X101.49 Y104.261 I-.874 J-1.294 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.308 I.057 J-.92 E.01803
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
M73 P44 R9
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19392
G1 X101.901 Y75.841 E-.16146
G1 X102.141 Y75.968 E-.103
G1 X102.356 Y76.193 E-.11848
G1 X102.456 Y76.389 E-.08359
G1 X102.501 Y76.569 E-.07031
G1 X102.507 Y76.645 E-.02924
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.488 Z3.64 F42000
G1 X77.25 Y76.124 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.276 Y76.074 E.00074
G3 X78.405 Y75.41 I1.133 J.635 E.01804
G1 X101.621 Y75.411 E.30483
G3 X102.888 Y76.637 I-.037 J1.306 E.02541
G1 X102.89 Y103.297 E.35006
G3 X101.597 Y104.59 I-1.299 J-.006 E.02663
G1 X78.405 Y104.59 E.30451
M73 P44 R8
G3 X77.11 Y103.295 I.003 J-1.299 E.0267
G1 X77.11 Y76.705 E.34912
G3 X77.188 Y76.266 I1.299 J.003 E.00589
G1 X77.226 Y76.179 E.00125
; WIPE_START
G1 F12000
M204 S6000
G1 X77.276 Y76.074 E-.04425
G1 X77.442 Y75.836 E-.11053
G1 X77.632 Y75.664 E-.09713
G1 X77.849 Y75.534 E-.09606
G1 X78.146 Y75.435 E-.119
G1 X78.405 Y75.41 E-.0991
G1 X78.916 Y75.41 E-.19393
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

G1 X86.219 Y75.825
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428912
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20215
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.64 F42000
G1 X101.281 Y104.175 Z3.64
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.64 F42000
G1 X79.439 Y81.339 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.438 Y81.331 E.00009
G3 X79.919 Y80.393 I.633 J-.268 E.01404
G1 X80.053 Y80.376 E.00157
G3 X79.504 Y81.451 I.018 J.687 E.03323
G1 X79.469 Y81.391 E.00081
M204 S250
G1 X79.434 Y80.746 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00153
G3 X80.053 Y80.353 I.566 J.431 E.00749
G1 X80.1 Y80.354 E.00054
G3 X79.407 Y80.799 I-.032 J.711 E.04198
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.07223
G1 X79.599 Y80.531 E-.05402
G1 X79.714 Y80.448 E-.05387
G1 X79.843 Y80.39 E-.05382
G1 X80.053 Y80.353 E-.08106
G1 X80.1 Y80.354 E-.01757
G1 X80.228 Y80.371 E-.0494
G1 X80.363 Y80.416 E-.05383
G1 X80.486 Y80.487 E-.05388
G1 X80.592 Y80.581 E-.05391
G1 X80.678 Y80.694 E-.05389
G1 X80.739 Y80.822 E-.05385
G1 X80.774 Y80.959 E-.05393
G1 X80.781 Y81.101 E-.05385
G1 X80.781 Y81.103 E-.00089
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.64 F42000
G1 X84.61 Y95.71 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.32
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/99
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.64 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.64
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.901 Y75.841 E.00558
G3 X102.51 Y76.691 I-.306 J.862 E.01461
G1 X102.51 Y103.305 E.34945
G3 X102.176 Y104.005 I-.954 J-.026 E.01049
G3 X101.49 Y104.262 I-.875 J-1.295 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.308 I.056 J-.92 E.01803
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
M73 P45 R8
G1 X101.49 Y75.733 E-.194
G1 X101.901 Y75.841 E-.16153
G1 X102.141 Y75.968 E-.10295
G1 X102.356 Y76.193 E-.11845
G1 X102.456 Y76.389 E-.08375
G1 X102.499 Y76.556 E-.06522
G1 X102.506 Y76.645 E-.0341
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.49 Z3.72 F42000
G1 X77.244 Y76.132 Z3.72
G1 Z3.32
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.366 Y75.93 E.0031
G3 X78.405 Y75.41 I1.036 J.772 E.01583
G1 X101.622 Y75.411 E.30484
G3 X102.888 Y76.637 I-.037 J1.306 E.02541
G1 X102.89 Y103.295 E.35002
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.218 Y76.186 I1.293 J-.003 E.00702
; WIPE_START
G1 F12000
M204 S6000
G1 X77.366 Y75.93 E-.11228
G1 X77.505 Y75.772 E-.07978
G1 X77.737 Y75.594 E-.11139
G1 X77.966 Y75.486 E-.09604
G1 X78.188 Y75.428 E-.08741
G1 X78.405 Y75.41 E-.0828
G1 X78.906 Y75.41 E-.19031
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

G1 X86.219 Y75.825
G1 Z3.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428902
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20214
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.72 F42000
G1 X101.281 Y104.175 Z3.72
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.72 F42000
G1 X79.439 Y81.339 Z3.72
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00008
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.468 Y81.391 E.00082
M204 S250
G1 X79.432 Y80.75 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00158
G3 X80.053 Y80.353 I.566 J.431 E.00749
G1 X80.1 Y80.354 E.00055
G3 X79.405 Y80.803 I-.033 J.711 E.04193
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.07376
G1 X79.599 Y80.531 E-.05391
G1 X79.714 Y80.448 E-.05389
G1 X79.843 Y80.39 E-.05386
G1 X80.053 Y80.353 E-.08106
G1 X80.1 Y80.354 E-.01775
G1 X80.228 Y80.371 E-.04924
G1 X80.363 Y80.416 E-.05381
G1 X80.486 Y80.487 E-.05392
G1 X80.592 Y80.581 E-.05394
G1 X80.678 Y80.694 E-.05387
G1 X80.739 Y80.822 E-.05381
G1 X80.774 Y80.959 E-.05387
G1 X80.781 Y81.099 E-.05331
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.72 F42000
G1 Z3.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.72 F42000
G1 X84.61 Y95.71 Z3.72
G1 Z3.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/99
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.72 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.72
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00652
G1 X101.822 Y75.817 E.00446
G3 X102.51 Y76.691 I-.251 J.906 E.01563
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.954 J-.025 E.01049
G3 X101.49 Y104.261 I-.872 J-1.29 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19015
G1 X101.822 Y75.817 E-.12909
G1 X102.066 Y75.918 E-.10065
G1 X102.202 Y76.017 E-.06377
G1 X102.301 Y76.119 E-.05384
G1 X102.397 Y76.261 E-.0651
G1 X102.456 Y76.389 E-.0538
G1 X102.499 Y76.555 E-.06515
G1 X102.507 Y76.656 E-.03845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.503 Z3.8 F42000
G1 X77.244 Y76.15 Z3.8
G1 Z3.4
G1 E.8 F1800
M73 P46 R8
G1 F2147
M204 S5000
G1 X77.328 Y75.985 E.00244
G3 X78.405 Y75.41 I1.076 J.72 E.01669
G1 X101.622 Y75.411 E.30484
G3 X102.888 Y76.637 I-.038 J1.306 E.0254
G1 X102.89 Y103.295 E.35002
G3 X101.597 Y104.59 I-1.293 J.003 E.0267
G1 X78.405 Y104.59 E.30451
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.187 Y76.266 I1.294 J-.001 E.00589
G1 X77.217 Y76.204 E.0009
; WIPE_START
G1 F12000
M204 S6000
G1 X77.328 Y75.985 E-.09347
G1 X77.488 Y75.788 E-.09628
G1 X77.717 Y75.606 E-.11112
G1 X77.965 Y75.486 E-.10489
G1 X78.187 Y75.428 E-.08717
G1 X78.405 Y75.41 E-.08312
G1 X78.889 Y75.41 E-.18396
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

G1 X86.219 Y75.825
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428892
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20214
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.8 F42000
G1 X101.281 Y104.175 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.8 F42000
G1 X79.439 Y81.339 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00008
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.468 Y81.391 E.00082
M204 S250
G1 X79.43 Y80.754 F42000
G1 F2147
M204 S5000
G1 X79.501 Y80.634 E.00162
G3 X80.053 Y80.353 I.566 J.429 E.00749
G1 X80.101 Y80.354 E.00055
G3 X79.405 Y80.807 I-.033 J.709 E.04177
; WIPE_START
G1 F12000
M204 S6000
G1 X79.501 Y80.634 E-.07534
G1 X79.599 Y80.531 E-.05382
G1 X79.714 Y80.448 E-.05398
G1 X79.843 Y80.39 E-.05378
G1 X80.053 Y80.353 E-.08108
G1 X80.101 Y80.354 E-.01796
G1 X80.228 Y80.371 E-.04902
G1 X80.363 Y80.416 E-.05387
G1 X80.486 Y80.487 E-.0539
G1 X80.592 Y80.581 E-.05385
G1 X80.677 Y80.694 E-.05388
G1 X80.739 Y80.822 E-.05388
G1 X80.774 Y80.959 E-.05387
G1 X80.781 Y81.095 E-.05177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.8 F42000
G1 X84.61 Y95.71 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.48
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/99
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.8
G1 Z3.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.901 Y75.841 E.00558
G3 X102.51 Y76.691 I-.306 J.862 E.01462
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.954 J-.025 E.0105
G3 X101.49 Y104.261 I-.874 J-1.294 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.354 Y104.209 E.10052
G3 X77.49 Y103.305 I.058 J-.92 E.01805
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19397
G1 X101.901 Y75.841 E-.16149
G1 X102.141 Y75.968 E-.10297
G1 X102.356 Y76.193 E-.11844
G1 X102.456 Y76.389 E-.08375
G1 X102.498 Y76.555 E-.06494
G1 X102.506 Y76.645 E-.03444
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.497 Z3.88 F42000
G1 X77.237 Y76.153 Z3.88
G1 Z3.48
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.277 Y76.072 E.00119
G3 X78.405 Y75.41 I1.132 J.637 E.01801
G1 X101.623 Y75.411 E.30485
G3 X102.888 Y76.637 I-.039 J1.306 E.02539
G1 X102.89 Y103.295 E.35002
M73 P47 R8
G3 X101.595 Y104.59 I-1.291 J.004 E.02674
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I-.004 J-1.291 E.02674
G1 X77.11 Y76.705 E.34912
G3 X77.188 Y76.266 I1.299 J.003 E.00588
G1 X77.213 Y76.208 E.00083
; WIPE_START
G1 F12000
M204 S6000
G1 X77.277 Y76.072 E-.05715
G1 X77.443 Y75.836 E-.10978
G1 X77.632 Y75.664 E-.09696
G1 X77.848 Y75.534 E-.09608
G1 X78.087 Y75.449 E-.0964
G1 X78.405 Y75.41 E-.12175
G1 X78.884 Y75.41 E-.18189
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

G1 X86.219 Y75.825
G1 Z3.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428872
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20213
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.88 F42000
G1 X101.281 Y104.175 Z3.88
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.88 F42000
G1 X79.438 Y81.337 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00006
G3 X79.917 Y80.393 I.633 J-.268 E.01404
G1 X80.053 Y80.376 E.0016
G3 X79.502 Y81.452 I.017 J.687 E.03325
G1 X79.467 Y81.39 E.00084
M204 S250
G1 X79.427 Y80.76 F42000
G1 F2147
M204 S5000
G1 X79.427 Y80.756 E.00005
G3 X80.053 Y80.353 I.64 J.308 E.00915
G1 X80.101 Y80.354 E.00056
G3 X79.379 Y80.889 I-.034 J.709 E.04077
G1 X79.406 Y80.816 E.00091
; WIPE_START
G1 F12000
M204 S6000
G1 X79.427 Y80.756 E-.02434
G1 X79.502 Y80.635 E-.05388
G1 X79.599 Y80.531 E-.05395
G1 X79.714 Y80.448 E-.05384
G1 X79.843 Y80.39 E-.05386
G1 X80.053 Y80.353 E-.08105
G1 X80.101 Y80.354 E-.01815
G1 X80.229 Y80.371 E-.04887
G1 X80.363 Y80.416 E-.05382
G1 X80.486 Y80.487 E-.0539
G1 X80.592 Y80.581 E-.05381
G1 X80.677 Y80.694 E-.05392
G1 X80.739 Y80.822 E-.0539
G1 X80.774 Y80.959 E-.05388
G1 X80.781 Y81.087 E-.04883
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.88 F42000
G1 Z3.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.88 F42000
G1 X84.61 Y95.71 Z3.88
G1 Z3.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/99
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.88 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.88
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.901 Y75.841 E.00559
G3 X102.51 Y76.691 I-.311 J.866 E.0146
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.978 J-.037 E.01048
G3 X101.49 Y104.262 I-.875 J-1.295 E.0097
G1 X101.49 Y103.76 E.00659
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.308 I.056 J-.92 E.01803
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19404
G1 X101.901 Y75.841 E-.16166
G1 X102.141 Y75.968 E-.10288
G1 X102.303 Y76.121 E-.08457
G1 X102.379 Y76.229 E-.05046
G1 X102.457 Y76.393 E-.06893
G1 X102.498 Y76.554 E-.06339
G1 X102.506 Y76.644 E-.03408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.496 Z3.96 F42000
G1 X77.232 Y76.153 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.235 Y76.149 E.00006
G3 X78.405 Y75.41 I1.168 J.554 E.01918
G1 X101.624 Y75.411 E.30487
G3 X102.888 Y76.637 I-.04 J1.306 E.02537
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.299 J-.003 E.0267
G1 X78.405 Y104.59 E.30448
M73 P48 R8
G3 X77.11 Y103.295 I-.003 J-1.293 E.02673
G1 X77.11 Y76.705 E.34912
G3 X77.149 Y76.387 I1.293 J-.003 E.00422
G1 X77.212 Y76.21 E.00248
; WIPE_START
G1 F12000
M204 S6000
G1 X77.235 Y76.149 E-.02464
G1 X77.365 Y75.93 E-.09705
G1 X77.506 Y75.771 E-.08062
G1 X77.737 Y75.594 E-.11058
G1 X77.966 Y75.486 E-.09605
G1 X78.146 Y75.435 E-.07112
G1 X78.405 Y75.41 E-.0991
G1 X78.881 Y75.41 E-.18084
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

G1 X86.219 Y75.825
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428862
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20212
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z3.96 F42000
G1 X101.281 Y104.175 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z3.96 F42000
G1 X79.439 Y81.339 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00009
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.469 Y81.391 E.00081
M204 S250
G1 X79.426 Y80.764 F42000
G1 F2147
M204 S5000
G1 X79.427 Y80.755 E.0001
G3 X80.053 Y80.353 I.641 J.309 E.00915
G1 X80.102 Y80.354 E.00057
G3 X79.378 Y80.889 I-.034 J.711 E.04086
G1 X79.404 Y80.82 E.00086
; WIPE_START
G1 F12000
M204 S6000
G1 X79.427 Y80.755 E-.026
G1 X79.502 Y80.635 E-.05389
G1 X79.599 Y80.531 E-.05388
G1 X79.714 Y80.448 E-.0539
G1 X79.843 Y80.39 E-.05389
G1 X80.053 Y80.353 E-.08101
G1 X80.102 Y80.354 E-.01839
G1 X80.228 Y80.371 E-.04864
G1 X80.363 Y80.416 E-.05382
G1 X80.486 Y80.487 E-.05391
G1 X80.592 Y80.581 E-.05392
G1 X80.677 Y80.694 E-.05384
G1 X80.739 Y80.822 E-.05388
G1 X80.774 Y80.959 E-.05389
G1 X80.78 Y81.083 E-.04714
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z3.96 F42000
G1 X84.61 Y95.71 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.64
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/99
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.96 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z3.96
G1 Z3.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.901 Y75.841 E.00559
G3 X102.51 Y76.691 I-.307 J.862 E.01461
G1 X102.51 Y103.305 E.34944
G3 X102.175 Y104.005 I-.954 J-.025 E.0105
G3 X101.49 Y104.261 I-.872 J-1.29 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.061 J-.924 E.01804
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19397
G1 X101.901 Y75.841 E-.16164
G1 X102.14 Y75.968 E-.10279
G1 X102.356 Y76.193 E-.11846
G1 X102.456 Y76.389 E-.08368
G1 X102.498 Y76.554 E-.06469
G1 X102.506 Y76.645 E-.03478
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.501 Z4.04 F42000
G1 X77.235 Y76.167 Z4.04
G1 Z3.64
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.327 Y75.984 E.00269
G3 X78.405 Y75.41 I1.074 J.717 E.0167
G1 X101.625 Y75.411 E.30488
G3 X102.888 Y76.637 I-.04 J1.306 E.02536
G1 X102.89 Y103.295 E.35003
G3 X101.597 Y104.59 I-1.294 J.001 E.02669
G1 X78.405 Y104.59 E.30451
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
M73 P49 R8
G1 X77.11 Y76.705 E.34912
G3 X77.186 Y76.266 I1.291 J-.004 E.00589
G1 X77.208 Y76.221 E.00065
; WIPE_START
G1 F12000
M204 S6000
G1 X77.327 Y75.984 E-.10079
G1 X77.49 Y75.786 E-.09733
G1 X77.735 Y75.595 E-.11804
G1 X77.966 Y75.486 E-.09708
G1 X78.185 Y75.429 E-.08634
G1 X78.405 Y75.41 E-.08386
G1 X78.87 Y75.41 E-.17657
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

G1 X86.219 Y75.825
G1 Z3.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428851
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20212
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.04 F42000
G1 X101.281 Y104.175 Z4.04
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z4.04 F42000
G1 X79.44 Y81.341 Z4.04
G1 Z3.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00011
G3 X79.917 Y80.394 I.633 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03322
G1 X79.469 Y81.393 E.00079
M204 S250
G1 X79.424 Y80.768 F42000
G1 F2147
M204 S5000
G1 X79.426 Y80.755 E.00015
G3 X80.053 Y80.353 I.641 J.309 E.00916
G1 X80.102 Y80.354 E.00057
G3 X79.378 Y80.889 I-.035 J.711 E.04085
G1 X79.403 Y80.824 E.00081
; WIPE_START
G1 F12000
M204 S6000
G1 X79.426 Y80.755 E-.02758
G1 X79.502 Y80.635 E-.05399
G1 X79.599 Y80.531 E-.05382
G1 X79.714 Y80.448 E-.05395
G1 X79.843 Y80.39 E-.05381
G1 X80.053 Y80.353 E-.08108
G1 X80.102 Y80.354 E-.0185
G1 X80.229 Y80.371 E-.04854
G1 X80.363 Y80.416 E-.05382
G1 X80.486 Y80.487 E-.05385
G1 X80.592 Y80.581 E-.05385
G1 X80.677 Y80.694 E-.05389
G1 X80.739 Y80.821 E-.05387
G1 X80.774 Y80.959 E-.05392
G1 X80.78 Y81.079 E-.04552
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.04 F42000
G1 Z3.64
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.04 F42000
G1 X84.61 Y95.71 Z4.04
G1 Z3.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/99
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.04 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.04
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.902 Y75.841 E.00559
G3 X102.51 Y76.691 I-.307 J.862 E.01461
G1 X102.51 Y103.305 E.34944
G3 X102.176 Y104.005 I-.954 J-.025 E.0105
G3 X101.49 Y104.261 I-.873 J-1.292 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.062 J-.926 E.01803
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.1941
G1 X101.902 Y75.841 E-.16172
G1 X102.141 Y75.968 E-.1028
G1 X102.356 Y76.193 E-.11844
G1 X102.456 Y76.389 E-.08364
G1 X102.498 Y76.554 E-.06454
G1 X102.506 Y76.645 E-.03477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.501 Z4.12 F42000
G1 X77.23 Y76.167 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.33 Y75.985 E.00273
G3 X78.405 Y75.41 I1.078 J.724 E.01666
G1 X101.625 Y75.411 E.30488
G3 X102.888 Y76.637 I-.041 J1.306 E.02536
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.294 J.001 E.02672
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
M73 P50 R8
G3 X77.205 Y76.222 I1.299 J.003 E.00651
; WIPE_START
G1 F12000
M204 S6000
G1 X77.33 Y75.985 E-.10172
G1 X77.534 Y75.744 E-.11977
G1 X77.737 Y75.594 E-.09616
G1 X77.965 Y75.486 E-.09602
G1 X78.185 Y75.429 E-.08607
G1 X78.405 Y75.41 E-.08417
G1 X78.869 Y75.41 E-.17609
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

G1 X86.219 Y75.825
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428831
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20211
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.12 F42000
G1 X101.281 Y104.175 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z4.12 F42000
G1 X79.439 Y81.34 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.0001
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.469 Y81.392 E.0008
M204 S250
G1 X79.423 Y80.772 F42000
G1 F2147
M204 S5000
G1 X79.427 Y80.755 E.0002
G3 X80.053 Y80.353 I.641 J.31 E.00915
G1 X80.102 Y80.354 E.00057
G3 X79.378 Y80.889 I-.035 J.711 E.04085
G1 X79.401 Y80.828 E.00076
; WIPE_START
G1 F12000
M204 S6000
G1 X79.427 Y80.755 E-.02924
G1 X79.503 Y80.635 E-.05402
G1 X79.599 Y80.531 E-.05374
G1 X79.714 Y80.448 E-.05392
G1 X79.843 Y80.39 E-.05386
G1 X80.053 Y80.353 E-.08104
G1 X80.102 Y80.354 E-.01868
G1 X80.228 Y80.371 E-.04828
G1 X80.363 Y80.416 E-.05391
G1 X80.486 Y80.487 E-.05392
G1 X80.592 Y80.581 E-.05387
G1 X80.678 Y80.694 E-.05388
G1 X80.739 Y80.822 E-.05386
G1 X80.774 Y80.959 E-.05384
G1 X80.78 Y81.074 E-.04394
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.12 F42000
G1 X84.61 Y95.71 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/99
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.12 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.12
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00652
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.691 I-.252 J.906 E.01563
G1 X102.51 Y103.305 E.34945
G3 X102.176 Y104.005 I-.954 J-.025 E.01049
G3 X101.49 Y104.261 I-.871 J-1.287 E.0097
M73 P50 R7
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.057 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19019
G1 X101.822 Y75.817 E-.12925
G1 X102.067 Y75.918 E-.10059
G1 X102.2 Y76.016 E-.06292
G1 X102.301 Y76.119 E-.0545
G1 X102.396 Y76.259 E-.06442
G1 X102.456 Y76.389 E-.05454
G1 X102.498 Y76.553 E-.06438
G1 X102.507 Y76.656 E-.03922
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.51 Z4.2 F42000
G1 X77.226 Y76.171 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.237 Y76.149 E.00033
G3 X78.405 Y75.41 I1.172 J.56 E.01914
G1 X101.626 Y75.411 E.30489
G3 X102.888 Y76.637 I-.042 J1.306 E.02535
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.294 J-.001 E.02669
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.001 J-1.294 E.02669
G1 X77.11 Y76.705 E.34912
G3 X77.15 Y76.388 I1.299 J.004 E.00422
G1 X77.206 Y76.228 E.00222
; WIPE_START
M73 P51 R7
G1 F12000
M204 S6000
G1 X77.237 Y76.149 E-.03227
G1 X77.327 Y75.984 E-.07149
G1 X77.508 Y75.769 E-.10652
G1 X77.737 Y75.594 E-.10975
G1 X77.968 Y75.485 E-.09701
G1 X78.213 Y75.424 E-.09587
G1 X78.405 Y75.41 E-.07346
G1 X78.862 Y75.41 E-.17363
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

G1 X86.219 Y75.825
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428821
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.2021
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.2 F42000
G1 X101.281 Y104.175 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z4.2 F42000
G1 X79.445 Y81.352 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.406 Y81.234 E.00145
G3 X79.984 Y80.382 I.666 J-.17 E.0136
G1 X80.058 Y80.377 E.00086
G3 X79.475 Y81.404 I.015 J.687 E.03387
M204 S250
G1 X79.421 Y80.776 F42000
G1 F2147
M204 S5000
G1 X79.427 Y80.755 E.00025
G3 X80.053 Y80.353 I.641 J.309 E.00915
G1 X80.103 Y80.354 E.00058
G3 X79.378 Y80.889 I-.036 J.711 E.04084
G1 X79.4 Y80.832 E.00071
; WIPE_START
G1 F12000
M204 S6000
G1 X79.427 Y80.755 E-.03086
G1 X79.503 Y80.635 E-.05395
G1 X79.599 Y80.531 E-.05383
G1 X79.714 Y80.448 E-.05397
G1 X79.843 Y80.39 E-.05381
G1 X80.053 Y80.353 E-.08103
G1 X80.103 Y80.354 E-.01884
G1 X80.228 Y80.371 E-.04816
G1 X80.363 Y80.416 E-.05392
G1 X80.486 Y80.487 E-.05385
G1 X80.592 Y80.581 E-.05387
G1 X80.678 Y80.694 E-.05388
G1 X80.739 Y80.821 E-.05385
G1 X80.774 Y80.959 E-.05388
G1 X80.78 Y81.07 E-.04231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.2 F42000
G1 X84.61 Y95.71 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/99
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.2 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.2
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.695 I-.226 J.885 E.01575
G1 X102.51 Y103.305 E.3494
G3 X102.176 Y104.005 I-.954 J-.025 E.0105
G3 X101.49 Y104.261 I-.872 J-1.288 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.047 J-.912 E.01811
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19027
G1 X101.822 Y75.817 E-.12934
G1 X102.067 Y75.918 E-.10056
G1 X102.196 Y76.012 E-.06065
G1 X102.303 Y76.122 E-.05823
G1 X102.393 Y76.254 E-.06067
G1 X102.457 Y76.393 E-.0582
G1 X102.497 Y76.547 E-.06069
G1 X102.507 Y76.656 E-.0414
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.514 Z4.28 F42000
G1 X77.226 Y76.184 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.33 Y75.986 E.00294
G3 X78.405 Y75.41 I1.079 J.723 E.01668
G1 X101.627 Y75.411 E.30491
G3 X102.888 Y76.637 I-.043 J1.306 E.02534
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I-.001 J-1.294 E.02672
G1 X77.11 Y76.705 E.34912
G3 X77.188 Y76.266 I1.299 J.003 E.00588
G1 X77.201 Y76.239 E.0004
; WIPE_START
G1 F12000
M204 S6000
G1 X77.33 Y75.986 E-.10788
G1 X77.49 Y75.786 E-.09721
G1 X77.737 Y75.594 E-.11901
G1 X77.965 Y75.486 E-.09607
G1 X78.183 Y75.429 E-.08554
G1 X78.405 Y75.41 E-.0847
G1 X78.852 Y75.41 E-.16958
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

G1 X86.219 Y75.825
G1 Z3.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428821
M73 P52 R7
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.2021
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.28 F42000
G1 X101.281 Y104.175 Z4.28
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z4.28 F42000
G1 X79.44 Y81.342 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00012
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.47 Y81.394 E.00078
M204 S250
G1 X79.42 Y80.78 F42000
G1 F2147
M204 S5000
G1 X79.427 Y80.755 E.0003
G3 X80.053 Y80.353 I.641 J.309 E.00915
G1 X80.103 Y80.354 E.00059
G3 X79.378 Y80.889 I-.036 J.711 E.04083
G1 X79.398 Y80.836 E.00067
; WIPE_START
G1 F12000
M204 S6000
G1 X79.427 Y80.755 E-.03249
G1 X79.502 Y80.635 E-.05395
G1 X79.599 Y80.531 E-.05389
G1 X79.714 Y80.448 E-.0539
G1 X79.843 Y80.39 E-.05385
G1 X80.053 Y80.353 E-.08098
G1 X80.103 Y80.354 E-.0191
G1 X80.228 Y80.371 E-.0479
G1 X80.363 Y80.416 E-.05392
G1 X80.486 Y80.487 E-.05383
G1 X80.592 Y80.581 E-.05388
G1 X80.677 Y80.694 E-.05385
G1 X80.739 Y80.822 E-.05394
G1 X80.774 Y80.959 E-.05386
G1 X80.779 Y81.066 E-.04067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.28 F42000
G1 X84.61 Y95.71 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 3.96
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/99
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.28 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.28
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.901 Y75.841 E.00558
G3 X102.51 Y76.695 I-.318 J.871 E.01464
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.954 J-.026 E.0105
G3 X101.49 Y104.261 I-.872 J-1.289 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.047 J-.912 E.01811
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19397
G1 X101.901 Y75.841 E-.16159
G1 X102.14 Y75.968 E-.10284
G1 X102.244 Y76.056 E-.05171
G1 X102.356 Y76.193 E-.06714
G1 X102.457 Y76.393 E-.0852
G1 X102.497 Y76.547 E-.06047
G1 X102.506 Y76.644 E-.03707
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.874 Y76.506 Z4.36 F42000
G1 X77.218 Y76.186 Z4.36
G1 Z3.96
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.22 Y76.18 E.00008
G3 X78.405 Y75.41 I1.181 J.521 E.01965
G1 X101.628 Y75.411 E.30491
G3 X102.888 Y76.637 I-.043 J1.306 E.02533
G1 X102.89 Y103.295 E.35003
G3 X101.597 Y104.59 I-1.294 J.001 E.02669
G1 X78.405 Y104.59 E.30451
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.149 Y76.387 I1.291 J-.004 E.00422
G1 X77.199 Y76.243 E.00201
; WIPE_START
G1 F12000
M204 S6000
G1 X77.22 Y76.18 E-.02499
G1 X77.328 Y75.983 E-.08532
G1 X77.49 Y75.786 E-.097
G1 X77.735 Y75.595 E-.11811
G1 X77.966 Y75.486 E-.09706
G1 X78.182 Y75.429 E-.08518
G1 X78.405 Y75.41 E-.08501
G1 X78.846 Y75.41 E-.16733
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

G1 X86.219 Y75.825
G1 Z3.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428801
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20209
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.36 F42000
G1 X101.281 Y104.175 Z4.36
G1 Z3.96
M73 P53 R7
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z4.36 F42000
G1 X79.44 Y81.341 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00011
G3 X79.917 Y80.393 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.469 Y81.393 E.00079
M204 S250
G1 X79.418 Y80.784 F42000
G1 F2147
M204 S5000
G1 X79.427 Y80.756 E.00035
G3 X80.053 Y80.353 I.64 J.308 E.00915
G1 X80.104 Y80.354 E.00059
G3 X79.379 Y80.889 I-.037 J.709 E.04073
G1 X79.397 Y80.84 E.00061
; WIPE_START
G1 F12000
M204 S6000
G1 X79.427 Y80.756 E-.03407
G1 X79.503 Y80.635 E-.05398
G1 X79.599 Y80.531 E-.05389
G1 X79.714 Y80.448 E-.05384
G1 X79.843 Y80.39 E-.05385
G1 X80.053 Y80.353 E-.08099
G1 X80.104 Y80.354 E-.01929
G1 X80.228 Y80.371 E-.04776
G1 X80.363 Y80.416 E-.05385
G1 X80.486 Y80.487 E-.05387
G1 X80.592 Y80.581 E-.05389
G1 X80.677 Y80.694 E-.05386
G1 X80.739 Y80.821 E-.05383
G1 X80.774 Y80.959 E-.05397
G1 X80.779 Y81.062 E-.03907
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.36 F42000
G1 Z3.96
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.36 F42000
G1 X84.61 Y95.71 Z4.36
G1 Z3.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/99
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.36 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.36
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.902 Y75.841 E.00559
G3 X102.51 Y76.695 I-.318 J.87 E.01463
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.954 J-.025 E.0105
G3 X101.49 Y104.261 I-.871 J-1.287 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.34941
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.194
G1 X101.902 Y75.841 E-.1617
G1 X102.14 Y75.968 E-.10274
G1 X102.244 Y76.056 E-.05164
G1 X102.356 Y76.193 E-.06722
G1 X102.457 Y76.393 E-.08507
G1 X102.497 Y76.547 E-.06044
G1 X102.506 Y76.644 E-.03718
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.874 Y76.508 Z4.44 F42000
G1 X77.216 Y76.192 Z4.44
G1 Z4.04
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.22 Y76.18 E.00017
G3 X78.405 Y75.41 I1.181 J.522 E.01964
G1 X101.628 Y75.411 E.30492
G3 X102.888 Y76.637 I-.044 J1.306 E.02532
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.293 J0 E.0267
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G3 X77.149 Y76.387 I1.291 J-.004 E.00422
G1 X77.196 Y76.249 E.00193
; WIPE_START
G1 F12000
M204 S6000
G1 X77.22 Y76.18 E-.02776
G1 X77.328 Y75.984 E-.08493
G1 X77.49 Y75.786 E-.09712
G1 X77.735 Y75.595 E-.11807
G1 X77.966 Y75.486 E-.09705
G1 X78.182 Y75.429 E-.08494
G1 X78.405 Y75.41 E-.08526
G1 X78.839 Y75.41 E-.16487
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

G1 X86.219 Y75.825
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428791
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20209
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.44 F42000
G1 X101.281 Y104.175 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
M73 P54 R7
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z4.44 F42000
G1 X79.445 Y81.353 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.404 Y81.235 E.00146
G3 X79.917 Y80.393 I.665 J-.171 E.01283
G1 X80.053 Y80.376 E.0016
G3 X79.474 Y81.405 I.017 J.687 E.03385
M204 S250
G1 X79.417 Y80.788 F42000
G1 F2147
M204 S5000
G1 X79.428 Y80.756 E.0004
G3 X80.053 Y80.353 I.64 J.306 E.00915
G1 X80.104 Y80.354 E.0006
G3 X79.38 Y80.889 I-.037 J.708 E.04065
G1 X79.396 Y80.844 E.00056
; WIPE_START
G1 F12000
M204 S6000
G1 X79.428 Y80.756 E-.03565
G1 X79.503 Y80.635 E-.05401
G1 X79.599 Y80.531 E-.05386
G1 X79.714 Y80.448 E-.05384
G1 X79.843 Y80.39 E-.05386
G1 X80.053 Y80.353 E-.08099
G1 X80.104 Y80.354 E-.01945
G1 X80.228 Y80.371 E-.04762
G1 X80.363 Y80.416 E-.05389
G1 X80.486 Y80.487 E-.05388
G1 X80.592 Y80.581 E-.05384
G1 X80.677 Y80.694 E-.05388
G1 X80.739 Y80.822 E-.05392
G1 X80.774 Y80.959 E-.05385
G1 X80.779 Y81.057 E-.03748
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.44 F42000
G1 X84.61 Y95.71 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.12
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/99
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.44 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.44
G1 Z4.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.695 I-.226 J.885 E.01575
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.954 J-.025 E.0105
G3 X101.49 Y104.261 I-.871 J-1.285 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.34941
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19027
G1 X101.822 Y75.817 E-.12934
G1 X102.067 Y75.918 E-.10054
G1 X102.195 Y76.012 E-.06028
G1 X102.303 Y76.122 E-.05865
G1 X102.392 Y76.253 E-.06017
G1 X102.457 Y76.393 E-.05874
G1 X102.497 Y76.546 E-.06013
G1 X102.507 Y76.656 E-.04188
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.518 Z4.52 F42000
G1 X77.214 Y76.198 Z4.52
G1 Z4.12
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.223 Y76.18 E.00026
G3 X78.405 Y75.41 I1.186 J.529 E.01959
G1 X101.629 Y75.411 E.30493
G3 X102.888 Y76.637 I-.045 J1.306 E.02531
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.291 J.004 E.02674
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.003 J-1.299 E.0267
G1 X77.11 Y76.705 E.34912
G3 X77.15 Y76.388 I1.299 J.004 E.00421
G1 X77.195 Y76.255 E.00184
; WIPE_START
G1 F12000
M204 S6000
G1 X77.223 Y76.18 E-.03037
G1 X77.328 Y75.983 E-.08462
G1 X77.51 Y75.767 E-.10744
G1 X77.737 Y75.594 E-.10855
G1 X77.905 Y75.509 E-.07156
G1 X78.146 Y75.435 E-.09569
G1 X78.405 Y75.41 E-.09914
G1 X78.833 Y75.41 E-.16262
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

G1 X86.219 Y75.825
G1 Z4.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42878
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20208
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.52 F42000
G1 X101.281 Y104.175 Z4.52
G1 Z4.12
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z4.52 F42000
G1 X79.441 Y81.342 Z4.52
G1 Z4.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00013
G3 X79.917 Y80.394 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.47 Y81.395 E.00077
M204 S250
G1 X79.416 Y80.792 F42000
G1 F2147
M204 S5000
G1 X79.427 Y80.755 E.00045
G3 X80.053 Y80.353 I.641 J.309 E.00915
G1 X80.105 Y80.354 E.00061
G3 X79.378 Y80.889 I-.037 J.711 E.04082
G1 X79.394 Y80.848 E.00051
; WIPE_START
G1 F12000
M204 S6000
M73 P55 R7
G1 X79.427 Y80.755 E-.03738
G1 X79.503 Y80.635 E-.054
G1 X79.599 Y80.531 E-.05379
G1 X79.714 Y80.448 E-.05391
G1 X79.843 Y80.39 E-.05389
G1 X80.053 Y80.353 E-.08095
G1 X80.105 Y80.354 E-.01968
G1 X80.228 Y80.371 E-.0474
G1 X80.363 Y80.416 E-.05388
G1 X80.486 Y80.487 E-.05386
G1 X80.592 Y80.581 E-.05386
G1 X80.678 Y80.694 E-.05389
G1 X80.739 Y80.821 E-.0538
G1 X80.774 Y80.959 E-.05399
G1 X80.779 Y81.053 E-.03573
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.52 F42000
G1 Z4.12
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.52 F42000
G1 X84.61 Y95.71 Z4.52
G1 Z4.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/99
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.52 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.52
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.695 I-.226 J.885 E.01575
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.967 J-.032 E.01049
G3 X101.49 Y104.261 I-.868 J-1.281 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.354 Y104.209 E.10053
G3 X77.49 Y103.305 I.049 J-.912 E.01808
G1 X77.49 Y76.695 E.34941
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19024
G1 X101.822 Y75.817 E-.12931
G1 X102.067 Y75.919 E-.1007
G1 X102.195 Y76.011 E-.05993
G1 X102.303 Y76.122 E-.05888
G1 X102.392 Y76.252 E-.06001
G1 X102.457 Y76.393 E-.05885
G1 X102.497 Y76.546 E-.06001
G1 X102.507 Y76.656 E-.04208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.52 Z4.6 F42000
G1 X77.212 Y76.204 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.221 Y76.178 E.00036
G3 X78.405 Y75.41 I1.181 J.523 E.01962
G1 X101.63 Y75.411 E.30494
G3 X102.888 Y76.637 I-.046 J1.306 E.0253
G1 X102.89 Y103.296 E.35004
G3 X101.595 Y104.59 I-1.306 J-.011 E.02665
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I-.002 J-1.293 E.02673
G1 X77.11 Y76.705 E.34912
G3 X77.149 Y76.387 I1.291 J-.004 E.00422
G1 X77.192 Y76.261 E.00176
; WIPE_START
G1 F12000
M204 S6000
G1 X77.221 Y76.178 E-.03323
G1 X77.328 Y75.983 E-.08445
G1 X77.49 Y75.786 E-.09704
G1 X77.735 Y75.595 E-.11807
G1 X77.966 Y75.486 E-.09708
G1 X78.181 Y75.429 E-.08444
G1 X78.405 Y75.41 E-.08576
G1 X78.826 Y75.41 E-.15994
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

G1 X86.219 Y75.825
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42876
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20207
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.6 F42000
G1 X101.281 Y104.175 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z4.6 F42000
G1 X79.441 Y81.343 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00014
G3 X79.917 Y80.393 I.633 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.471 Y81.395 E.00076
M204 S250
G1 X79.414 Y80.796 F42000
G1 F2147
M204 S5000
G1 X79.427 Y80.756 E.0005
G3 X80.053 Y80.353 I.64 J.308 E.00915
G1 X80.105 Y80.354 E.00061
G3 X79.379 Y80.889 I-.038 J.709 E.04072
G1 X79.393 Y80.852 E.00046
; WIPE_START
G1 F12000
M204 S6000
G1 X79.427 Y80.756 E-.03899
G1 X79.503 Y80.635 E-.05396
G1 X79.599 Y80.531 E-.05391
G1 X79.714 Y80.448 E-.05379
G1 X79.843 Y80.39 E-.05388
G1 X80.053 Y80.353 E-.08095
G1 X80.105 Y80.354 E-.01986
G1 X80.228 Y80.371 E-.04722
G1 X80.363 Y80.416 E-.0539
G1 X80.485 Y80.487 E-.0538
G1 X80.592 Y80.581 E-.05393
G1 X80.677 Y80.694 E-.05385
G1 X80.739 Y80.822 E-.05392
G1 X80.774 Y80.959 E-.05384
G1 X80.778 Y81.049 E-.0342
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.6 F42000
G1 X84.61 Y95.71 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
M73 P56 R7
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.28
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/99
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.6
G1 Z4.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.902 Y75.841 E.00559
G3 X102.51 Y76.695 I-.318 J.87 E.01463
G1 X102.51 Y103.305 E.3494
G3 X102.176 Y104.005 I-.954 J-.026 E.01049
G3 X101.49 Y104.261 I-.87 J-1.284 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.194
G1 X101.902 Y75.841 E-.16172
G1 X102.141 Y75.968 E-.1028
G1 X102.243 Y76.056 E-.05156
G1 X102.356 Y76.193 E-.06725
G1 X102.457 Y76.393 E-.08511
G1 X102.497 Y76.545 E-.05991
G1 X102.505 Y76.644 E-.03765
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.874 Y76.513 Z4.68 F42000
G1 X77.21 Y76.21 Z4.68
G1 Z4.28
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.221 Y76.178 E.00046
G3 X78.405 Y75.41 I1.18 J.524 E.01961
G1 X101.631 Y75.411 E.30495
G3 X102.888 Y76.637 I-.047 J1.306 E.02529
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.291 J.002 E.02671
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I-.002 J-1.291 E.02671
G1 X77.11 Y76.705 E.34912
G3 X77.149 Y76.387 I1.291 J-.004 E.00423
G1 X77.19 Y76.267 E.00166
; WIPE_START
M73 P56 R6
G1 F12000
M204 S6000
G1 X77.221 Y76.178 E-.03598
G1 X77.328 Y75.984 E-.08412
G1 X77.49 Y75.786 E-.09703
G1 X77.735 Y75.595 E-.11818
G1 X77.966 Y75.486 E-.09701
G1 X78.146 Y75.435 E-.07113
G1 X78.405 Y75.41 E-.09909
G1 X78.82 Y75.41 E-.15746
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

G1 X86.219 Y75.825
G1 Z4.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42875
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20207
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.68 F42000
G1 X101.281 Y104.175 Z4.68
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z4.68 F42000
G1 X79.445 Y81.352 Z4.68
G1 Z4.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.404 Y81.234 E.00145
G3 X79.917 Y80.393 I.665 J-.171 E.01283
G1 X80.053 Y80.376 E.0016
G3 X79.473 Y81.405 I.017 J.687 E.03386
M204 S250
G1 X79.405 Y80.814 F42000
G1 F2147
M204 S5000
G1 X79.461 Y80.693 E.00156
G3 X80.053 Y80.353 I.606 J.37 E.00832
G1 X80.106 Y80.354 E.00062
G3 X79.384 Y80.87 I-.038 J.709 E.04095
; WIPE_START
G1 F12000
M204 S6000
G1 X79.461 Y80.693 E-.07328
G1 X79.548 Y80.581 E-.05396
G1 X79.654 Y80.487 E-.0538
G1 X79.777 Y80.416 E-.05391
G1 X79.912 Y80.371 E-.05387
G1 X80.053 Y80.353 E-.05415
G1 X80.106 Y80.354 E-.02006
G1 X80.228 Y80.371 E-.04704
G1 X80.363 Y80.416 E-.05386
G1 X80.486 Y80.487 E-.05391
G1 X80.592 Y80.581 E-.05381
G1 X80.677 Y80.694 E-.05389
G1 X80.739 Y80.822 E-.0539
G1 X80.774 Y80.959 E-.05389
G1 X80.777 Y81.029 E-.02667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.68 F42000
G1 Z4.28
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.68 F42000
G1 X84.61 Y95.71 Z4.68
G1 Z4.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/99
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.68 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.68
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2148
M204 S5000
G1 X101.49 Y75.743 E.00652
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.695 I-.226 J.885 E.01574
G1 X102.51 Y103.305 E.34941
G3 X102.175 Y104.005 I-.954 J-.026 E.01049
G3 X101.49 Y104.261 I-.869 J-1.282 E.0097
M73 P57 R6
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.354 Y104.209 E.10053
G3 X77.49 Y103.305 I.058 J-.92 E.01804
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.1902
G1 X101.822 Y75.817 E-.12934
G1 X102.067 Y75.919 E-.10058
G1 X102.194 Y76.011 E-.05977
G1 X102.303 Y76.122 E-.05907
G1 X102.392 Y76.252 E-.05973
G1 X102.457 Y76.393 E-.05913
G1 X102.497 Y76.545 E-.05973
G1 X102.507 Y76.656 E-.04244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.523 Z4.76 F42000
G1 X77.211 Y76.214 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F2148
M204 S5000
G1 X77.235 Y76.149 E.00091
G3 X78.405 Y75.41 I1.168 J.554 E.01918
G1 X101.631 Y75.411 E.30496
G3 X102.888 Y76.637 I-.047 J1.306 E.02528
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.299 J-.006 E.02667
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I-.004 J-1.291 E.02674
G1 X77.11 Y76.705 E.34912
G3 X77.149 Y76.388 I1.293 J-.002 E.00422
G1 X77.191 Y76.271 E.00163
; WIPE_START
G1 F12000
M204 S6000
G1 X77.235 Y76.149 E-.04927
G1 X77.366 Y75.929 E-.09706
G1 X77.511 Y75.766 E-.0833
G1 X77.737 Y75.594 E-.10782
G1 X77.965 Y75.486 E-.09606
G1 X78.146 Y75.435 E-.07115
G1 X78.405 Y75.41 E-.09911
G1 X78.817 Y75.41 E-.15623
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

G1 X86.219 Y75.825
G1 Z4.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42874
G1 F2148
M204 S6000
G1 X101.281 Y75.825 E.20206
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.76 F42000
G1 X101.281 Y104.175 Z4.76
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2148
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.528 Y97.033 Z4.76 F42000
G1 X79.424 Y80.827 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2148
M204 S5000
G1 X79.483 Y80.706 E.00158
G3 X79.917 Y80.393 I.587 J.357 E.00642
G1 X80.053 Y80.376 E.0016
G3 X79.406 Y80.885 I.017 J.687 E.04014
M204 S250
G1 X79.424 Y81.362 F42000
G1 F2148
M204 S5000
G1 X79.378 Y81.241 E.00152
G3 X80.053 Y80.353 I.689 J-.177 E.01497
G1 X80.106 Y80.354 E.00062
G3 X79.449 Y81.417 I-.039 J.71 E.03442
; WIPE_START
G1 F12000
M204 S6000
G1 X79.378 Y81.241 E-.07193
G1 X79.359 Y81.1 E-.05394
G1 X79.366 Y80.959 E-.05388
G1 X79.401 Y80.821 E-.05386
G1 X79.462 Y80.694 E-.0538
G1 X79.548 Y80.581 E-.05398
G1 X79.654 Y80.487 E-.05378
G1 X79.777 Y80.416 E-.05386
G1 X79.912 Y80.371 E-.0539
G1 X80.053 Y80.353 E-.05419
G1 X80.106 Y80.354 E-.02025
G1 X80.228 Y80.371 E-.04686
G1 X80.363 Y80.416 E-.05385
G1 X80.486 Y80.487 E-.05392
G1 X80.541 Y80.536 E-.02801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2148
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2148
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.76 F42000
G1 X84.61 Y95.71 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2148
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2148
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.44
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/99
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.76
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.692 I-.238 J.895 E.01568
G1 X102.51 Y103.305 E.34943
G3 X102.176 Y104.005 I-.954 J-.026 E.01049
G3 X101.49 Y104.261 I-.869 J-1.282 E.0097
M73 P58 R6
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.047 J-.912 E.01811
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19027
G1 X101.822 Y75.817 E-.12938
G1 X102.067 Y75.919 E-.1006
G1 X102.194 Y76.01 E-.05953
G1 X102.303 Y76.122 E-.05928
G1 X102.392 Y76.251 E-.05957
G1 X102.457 Y76.393 E-.05935
G1 X102.501 Y76.569 E-.06886
G1 X102.507 Y76.656 E-.03317
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.524 Z4.84 F42000
G1 X77.209 Y76.22 Z4.84
G1 Z4.44
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.238 Y76.147 E.00103
G3 X78.405 Y75.41 I1.171 J.562 E.01912
G1 X101.632 Y75.411 E.30497
G3 X102.888 Y76.637 I-.04 J1.298 E.02531
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.299 J-.004 E.02669
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.003 J-1.299 E.0267
G1 X77.11 Y76.705 E.34913
G3 X77.151 Y76.387 I1.299 J.004 E.00422
G1 X77.189 Y76.277 E.00153
; WIPE_START
G1 F12000
M204 S6000
G1 X77.238 Y76.147 E-.05254
G1 X77.328 Y75.983 E-.0711
G1 X77.512 Y75.765 E-.10845
G1 X77.737 Y75.594 E-.10762
G1 X77.905 Y75.509 E-.07144
G1 X78.146 Y75.435 E-.09571
G1 X78.405 Y75.41 E-.09913
G1 X78.811 Y75.41 E-.15402
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

G1 X86.219 Y75.825
G1 Z4.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42872
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20205
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.84 F42000
G1 X101.281 Y104.175 Z4.84
G1 Z4.44
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.53 Y97.032 Z4.84 F42000
G1 X79.428 Y80.82 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.436 Y80.798 E.00028
G3 X79.917 Y80.394 I.634 J.265 E.00762
G1 X80.053 Y80.376 E.0016
G3 X79.396 Y80.929 I.017 J.687 E.03962
G1 X79.411 Y80.878 E.00062
M204 S250
G1 X79.424 Y81.363 F42000
G1 F2147
M204 S5000
G1 X79.378 Y81.241 E.00152
G3 X80.053 Y80.353 I.689 J-.177 E.01497
G1 X80.107 Y80.354 E.00063
G3 X79.449 Y81.417 I-.039 J.71 E.03441
; WIPE_START
G1 F12000
M204 S6000
G1 X79.378 Y81.241 E-.07201
G1 X79.359 Y81.1 E-.05396
G1 X79.366 Y80.959 E-.05384
G1 X79.401 Y80.822 E-.05384
G1 X79.463 Y80.694 E-.0539
G1 X79.548 Y80.581 E-.05382
G1 X79.654 Y80.487 E-.05397
G1 X79.777 Y80.416 E-.05389
G1 X79.912 Y80.371 E-.05381
G1 X80.053 Y80.353 E-.05416
G1 X80.107 Y80.354 E-.02046
G1 X80.228 Y80.371 E-.04662
G1 X80.363 Y80.416 E-.05389
G1 X80.486 Y80.487 E-.05388
G1 X80.541 Y80.536 E-.02794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.84 F42000
G1 Z4.44
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.84 F42000
G1 X84.61 Y95.71 Z4.84
G1 Z4.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/99
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.84 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.84
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.695 I-.226 J.885 E.01575
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.954 J-.025 E.0105
G3 X101.49 Y104.261 I-.869 J-1.281 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
M73 P59 R6
G3 X77.49 Y103.305 I.047 J-.911 E.01811
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19033
G1 X101.822 Y75.817 E-.12943
G1 X102.067 Y75.919 E-.10053
G1 X102.193 Y76.01 E-.0594
G1 X102.303 Y76.122 E-.05951
G1 X102.391 Y76.251 E-.05936
G1 X102.457 Y76.393 E-.05942
G1 X102.496 Y76.544 E-.05943
G1 X102.506 Y76.656 E-.04259
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.527 Z4.92 F42000
G1 X77.203 Y76.23 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.327 Y75.984 E.00361
G3 X78.405 Y75.41 I1.074 J.717 E.01671
G1 X101.633 Y75.411 E.30498
G3 X102.888 Y76.637 I-.049 J1.306 E.02526
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.299 J-.003 E.0267
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G3 X77.179 Y76.285 I1.291 J-.004 E.00562
; WIPE_START
G1 F12000
M204 S6000
G1 X77.327 Y75.984 E-.12726
G1 X77.49 Y75.786 E-.09739
G1 X77.735 Y75.595 E-.11815
G1 X77.966 Y75.486 E-.097
G1 X78.146 Y75.435 E-.07114
G1 X78.405 Y75.41 E-.09909
G1 X78.8 Y75.41 E-.14998
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

G1 X86.219 Y75.825
G1 Z4.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.42871
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20205
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z4.92 F42000
G1 X101.281 Y104.175 Z4.92
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z4.92 F42000
G1 X79.445 Y81.353 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.403 Y81.235 E.00146
G3 X79.917 Y80.393 I.667 J-.17 E.01284
G1 X80.053 Y80.376 E.0016
G3 X79.472 Y81.406 I.017 J.688 E.03392
M204 S250
G1 X79.399 Y80.828 F42000
G1 F2147
M204 S5000
G1 X79.399 Y80.821 E.00008
G3 X80.053 Y80.353 I.668 J.244 E.00998
G1 X80.107 Y80.354 E.00064
G3 X79.364 Y80.959 I-.04 J.71 E.03996
G1 X79.384 Y80.886 E.00088
; WIPE_START
G1 F12000
M204 S6000
G1 X79.399 Y80.821 E-.02541
G1 X79.463 Y80.694 E-.05395
G1 X79.548 Y80.581 E-.05379
G1 X79.654 Y80.487 E-.05394
G1 X79.777 Y80.416 E-.05386
G1 X79.912 Y80.371 E-.05387
G1 X80.053 Y80.353 E-.05414
G1 X80.107 Y80.354 E-.02071
G1 X80.228 Y80.371 E-.04644
G1 X80.363 Y80.416 E-.0539
G1 X80.486 Y80.487 E-.05383
G1 X80.592 Y80.581 E-.05396
G1 X80.677 Y80.694 E-.05379
G1 X80.739 Y80.821 E-.05385
G1 X80.774 Y80.959 E-.05393
G1 X80.777 Y81.013 E-.02064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z4.92 F42000
G1 X84.61 Y95.71 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/99
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.92 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z4.92
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.695 I-.226 J.885 E.01575
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.954 J-.026 E.0105
G3 X101.49 Y104.261 I-.868 J-1.279 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
M73 P60 R6
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19022
G1 X101.822 Y75.817 E-.1294
G1 X102.067 Y75.919 E-.10061
G1 X102.193 Y76.01 E-.05917
G1 X102.303 Y76.122 E-.05966
G1 X102.391 Y76.251 E-.05921
G1 X102.457 Y76.393 E-.0597
G1 X102.496 Y76.544 E-.05914
G1 X102.507 Y76.656 E-.0429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.529 Z5 F42000
G1 X77.202 Y76.235 Z5
G1 Z4.6
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.222 Y76.175 E.00083
G3 X78.405 Y75.41 I1.179 J.526 E.01957
G1 X101.633 Y75.411 E.30499
G3 X102.888 Y76.637 I-.049 J1.306 E.02525
G1 X102.89 Y103.295 E.35004
G3 X101.595 Y104.59 I-1.299 J-.004 E.02669
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I-.001 J-1.294 E.02672
G1 X77.11 Y76.705 E.34912
G3 X77.149 Y76.388 I1.291 J-.004 E.00422
G1 X77.182 Y76.292 E.00133
; WIPE_START
G1 F12000
M204 S6000
G1 X77.222 Y76.175 E-.04689
G1 X77.328 Y75.983 E-.0831
G1 X77.49 Y75.786 E-.09708
G1 X77.735 Y75.595 E-.11803
G1 X77.965 Y75.486 E-.09702
G1 X78.146 Y75.435 E-.07117
G1 X78.405 Y75.41 E-.0991
G1 X78.794 Y75.41 E-.14762
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

G1 X86.219 Y75.825
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.4287
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20204
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5 F42000
G1 X101.281 Y104.175 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.526 Y97.033 Z5 F42000
G1 X79.421 Y80.838 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.423 Y80.83 E.0001
G3 X79.917 Y80.393 I.647 J.235 E.00803
G1 X80.053 Y80.376 E.0016
G3 X79.39 Y80.96 I.017 J.688 E.03931
G1 X79.406 Y80.896 E.00077
M204 S250
G1 X79.425 Y81.363 F42000
G1 F2147
M204 S5000
G1 X79.38 Y81.241 E.00152
G3 X80.053 Y80.353 I.688 J-.178 E.01496
G1 X80.108 Y80.354 E.00064
G3 X79.452 Y81.417 I-.04 J.709 E.03432
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.07219
G1 X79.359 Y81.1 E-.05392
G1 X79.366 Y80.959 E-.05387
G1 X79.401 Y80.821 E-.0539
G1 X79.463 Y80.694 E-.05385
G1 X79.548 Y80.581 E-.05387
G1 X79.654 Y80.487 E-.05384
G1 X79.777 Y80.416 E-.05383
G1 X79.912 Y80.371 E-.05395
G1 X80.053 Y80.353 E-.0541
G1 X80.108 Y80.354 E-.02085
G1 X80.228 Y80.371 E-.0463
G1 X80.363 Y80.416 E-.0539
G1 X80.486 Y80.487 E-.05386
G1 X80.54 Y80.535 E-.02776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5 F42000
G1 X84.61 Y95.71 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/99
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z5
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.695 I-.226 J.885 E.01575
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.954 J-.025 E.0105
G3 X101.49 Y104.261 I-.868 J-1.278 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.047 J-.912 E.01811
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
M73 P61 R6
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19028
G1 X101.822 Y75.817 E-.12943
G1 X102.067 Y75.919 E-.10068
G1 X102.193 Y76.01 E-.05893
G1 X102.303 Y76.122 E-.05983
G1 X102.391 Y76.25 E-.05901
G1 X102.457 Y76.393 E-.05975
G1 X102.496 Y76.543 E-.05912
G1 X102.506 Y76.656 E-.04297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.531 Z5.08 F42000
G1 X77.198 Y76.242 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.33 Y75.986 E.00378
G3 X78.405 Y75.41 I1.079 J.723 E.01668
G1 X101.634 Y75.411 E.305
G3 X102.888 Y76.637 I-.05 J1.306 E.02524
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.299 J-.003 E.0267
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I-.001 J-1.294 E.02672
G1 X77.11 Y76.705 E.34912
G3 X77.177 Y76.298 I1.299 J.003 E.00545
; WIPE_START
G1 F12000
M204 S6000
G1 X77.33 Y75.986 E-.13199
G1 X77.49 Y75.786 E-.09733
G1 X77.737 Y75.594 E-.11906
G1 X77.965 Y75.486 E-.09601
G1 X78.146 Y75.435 E-.0711
G1 X78.405 Y75.41 E-.09914
G1 X78.788 Y75.41 E-.14537
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

G1 X86.219 Y75.825
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428689
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20204
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5.08 F42000
G1 X101.281 Y104.175 Z5.08
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.521 Y97.035 Z5.08 F42000
G1 X79.415 Y80.878 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.484 Y80.704 E.00218
G3 X79.917 Y80.393 I.586 J.36 E.00639
G1 X80.053 Y80.376 E.0016
G3 X79.395 Y80.934 I.017 J.687 E.03959
M204 S250
G1 X79.421 Y81.354 F42000
G1 F2147
M204 S5000
G1 X79.414 Y81.341 E.00017
G3 X80.053 Y80.353 I.653 J-.278 E.0162
G1 X80.108 Y80.354 E.00064
G3 X79.482 Y81.466 I-.04 J.709 E.03364
G1 X79.45 Y81.407 E.00078
; WIPE_START
G1 F12000
M204 S6000
G1 X79.414 Y81.341 E-.02837
G1 X79.372 Y81.206 E-.05385
G1 X79.359 Y81.027 E-.06824
G1 X79.38 Y80.89 E-.05285
G1 X79.429 Y80.756 E-.05395
G1 X79.502 Y80.635 E-.05386
G1 X79.599 Y80.531 E-.0539
G1 X79.714 Y80.448 E-.05385
G1 X79.843 Y80.39 E-.05385
G1 X80.053 Y80.353 E-.08094
G1 X80.108 Y80.354 E-.02097
G1 X80.228 Y80.371 E-.04613
G1 X80.363 Y80.416 E-.05391
G1 X80.486 Y80.487 E-.05388
G1 X80.548 Y80.542 E-.03145
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5.08 F42000
G1 X84.61 Y95.71 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.76
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/99
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.08 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z5.08
G1 Z4.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.695 I-.226 J.885 E.01574
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.966 J-.031 E.01049
G3 X101.49 Y104.261 I-.868 J-1.279 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19027
M73 P62 R6
G1 X101.822 Y75.817 E-.12945
G1 X102.067 Y75.919 E-.10052
G1 X102.193 Y76.009 E-.05893
G1 X102.303 Y76.122 E-.05995
G1 X102.391 Y76.25 E-.0589
G1 X102.457 Y76.393 E-.05992
G1 X102.496 Y76.543 E-.05892
G1 X102.506 Y76.656 E-.04315
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.538 Z5.16 F42000
G1 X77.193 Y76.263 Z5.16
G1 Z4.76
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.235 Y76.148 E.00161
G3 X78.405 Y75.41 I1.168 J.555 E.01917
G1 X101.635 Y75.411 E.30501
G3 X102.888 Y76.637 I-.051 J1.306 E.02523
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.299 J-.006 E.02667
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.006 J-1.299 E.02667
G1 X77.11 Y76.703 E.34916
G3 X77.149 Y76.387 I1.293 J0 E.00419
G1 X77.173 Y76.32 E.00093
; WIPE_START
G1 F12000
M204 S6000
G1 X77.235 Y76.148 E-.06942
G1 X77.327 Y75.984 E-.07143
G1 X77.514 Y75.763 E-.10993
G1 X77.737 Y75.594 E-.1065
G1 X77.966 Y75.486 E-.09608
G1 X78.175 Y75.43 E-.0825
G1 X78.405 Y75.41 E-.08772
G1 X78.764 Y75.41 E-.13643
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

G1 X86.219 Y75.825
G1 Z4.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428679
G1 F2147
M204 S6000
G1 X101.281 Y75.825 E.20203
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5.16 F42000
G1 X101.281 Y104.175 Z5.16
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z5.16 F42000
G1 X79.442 Y81.347 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.443 Y81.344 E.00003
G3 X79.917 Y80.394 I.627 J-.281 E.01419
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.0332
G1 X79.472 Y81.399 E.00072
M204 S250
G1 X79.387 Y80.875 F42000
G1 F2147
M204 S5000
G1 X79.4 Y80.821 E.00064
G3 X80.053 Y80.353 I.668 J.242 E.00998
G1 X80.109 Y80.354 E.00065
G3 X79.365 Y80.959 I-.041 J.709 E.03986
G1 X79.372 Y80.933 E.00031
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y80.821 E-.04365
G1 X79.462 Y80.694 E-.05387
G1 X79.548 Y80.581 E-.0539
G1 X79.654 Y80.487 E-.05391
G1 X79.777 Y80.416 E-.05385
G1 X79.912 Y80.371 E-.05389
G1 X80.053 Y80.353 E-.05412
G1 X80.109 Y80.354 E-.02119
G1 X80.228 Y80.371 E-.04594
G1 X80.363 Y80.416 E-.0539
G1 X80.486 Y80.487 E-.05386
G1 X80.592 Y80.581 E-.05387
G1 X80.678 Y80.694 E-.05391
G1 X80.739 Y80.822 E-.05385
G1 X80.774 Y80.959 E-.05384
G1 X80.774 Y80.965 E-.00245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.16 F42000
G1 Z4.76
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5.16 F42000
G1 X84.61 Y95.71 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/99
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.16 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z5.16
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.692 I-.238 J.895 E.01568
G1 X102.51 Y103.305 E.34943
G3 X102.176 Y104.005 I-.978 J-.037 E.01048
G3 X101.49 Y104.261 I-.867 J-1.276 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.354 Y104.209 E.10053
G3 X77.49 Y103.308 I.049 J-.912 E.01805
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
M73 P62 R5
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19027
G1 X101.822 Y75.817 E-.12939
G1 X102.067 Y75.919 E-.10062
G1 X102.192 Y76.009 E-.05873
G1 X102.303 Y76.122 E-.06011
G1 X102.391 Y76.249 E-.05872
G1 X102.457 Y76.393 E-.06013
G1 X102.501 Y76.569 E-.06889
G1 X102.507 Y76.656 E-.03314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.876 Y76.541 Z5.24 F42000
G1 X77.183 Y76.274 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.186 Y76.265 E.00012
G3 X78.405 Y75.41 I1.215 J.436 E.02085
G1 X101.636 Y75.411 E.30502
G3 X102.888 Y76.637 I-.052 J1.306 E.02522
G1 X102.89 Y103.297 E.35006
M73 P63 R5
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.13 Y76.475 I1.291 J-.004 E.00304
G1 X77.168 Y76.332 E.00193
; WIPE_START
G1 F12000
M204 S6000
G1 X77.186 Y76.265 E-.02633
G1 X77.326 Y75.985 E-.11904
G1 X77.49 Y75.786 E-.09795
G1 X77.735 Y75.595 E-.11809
G1 X77.965 Y75.486 E-.09706
G1 X78.146 Y75.435 E-.07114
G1 X78.405 Y75.41 E-.0991
G1 X78.751 Y75.41 E-.13129
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

G1 X86.219 Y75.825
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428669
G1 F2147
M204 S6000
G1 X101.281 Y75.826 E.20203
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5.24 F42000
G1 X101.281 Y104.175 Z5.24
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z5.24 F42000
G1 X79.442 Y81.345 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00016
G3 X79.917 Y80.393 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.472 Y81.397 E.00073
M204 S250
G1 X79.386 Y80.879 F42000
G1 F2147
M204 S5000
G1 X79.399 Y80.821 E.00069
G3 X80.053 Y80.353 I.668 J.244 E.00998
G1 X80.109 Y80.354 E.00066
G3 X79.364 Y80.959 I-.041 J.71 E.03994
G1 X79.37 Y80.937 E.00027
; WIPE_START
G1 F12000
M204 S6000
G1 X79.399 Y80.821 E-.0453
G1 X79.462 Y80.694 E-.05391
G1 X79.548 Y80.581 E-.05389
G1 X79.654 Y80.487 E-.05391
G1 X79.777 Y80.416 E-.05383
G1 X79.912 Y80.371 E-.05386
G1 X80.053 Y80.353 E-.05415
G1 X80.109 Y80.354 E-.0214
G1 X80.228 Y80.371 E-.04574
G1 X80.363 Y80.416 E-.05387
G1 X80.486 Y80.487 E-.05386
G1 X80.592 Y80.581 E-.05384
G1 X80.677 Y80.694 E-.05388
G1 X80.739 Y80.821 E-.05386
G1 X80.774 Y80.959 E-.05392
G1 X80.774 Y80.961 E-.00078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5.24 F42000
G1 X84.61 Y95.71 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 4.92
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/99
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.24 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z5.24
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.902 Y75.841 E.00559
G3 X102.51 Y76.692 I-.307 J.862 E.01462
G1 X102.51 Y103.305 E.34943
G3 X102.177 Y104.004 I-.954 J-.026 E.01048
G3 X101.49 Y104.262 I-.869 J-1.276 E.00972
G1 X101.49 Y103.76 E.00659
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.354 Y104.209 E.10053
G3 X77.49 Y103.305 I.049 J-.912 E.01808
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19405
G1 X101.902 Y75.841 E-.16181
G1 X102.141 Y75.968 E-.10268
G1 X102.243 Y76.056 E-.05158
G1 X102.356 Y76.193 E-.06731
G1 X102.457 Y76.393 E-.08517
G1 X102.501 Y76.569 E-.06888
G1 X102.506 Y76.644 E-.02853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.534 Z5.32 F42000
G1 X77.182 Y76.279 Z5.32
G1 Z4.92
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.187 Y76.266 E.00019
G3 X78.403 Y75.41 I1.22 J.441 E.02079
G1 X101.636 Y75.411 E.30506
G3 X102.888 Y76.637 I-.052 J1.306 E.02521
G1 X102.89 Y103.295 E.35003
G3 X101.597 Y104.59 I-1.294 J.001 E.02669
M73 P64 R5
G1 X78.405 Y104.59 E.30451
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.137 Y76.446 I1.297 J.002 E.00343
G1 X77.166 Y76.337 E.00148
; WIPE_START
G1 F12000
M204 S6000
G1 X77.187 Y76.266 E-.0283
G1 X77.327 Y75.984 E-.11946
G1 X77.49 Y75.786 E-.09744
G1 X77.735 Y75.595 E-.1181
G1 X77.966 Y75.486 E-.0971
G1 X78.146 Y75.435 E-.07132
G1 X78.403 Y75.41 E-.09793
G1 X78.746 Y75.41 E-.13035
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

G1 X86.219 Y75.825
G1 Z4.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428659
G1 F2147
M204 S6000
G1 X101.281 Y75.826 E.20202
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5.32 F42000
G1 X101.281 Y104.175 Z5.32
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z5.32 F42000
G1 X79.442 Y81.345 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00017
G3 X79.917 Y80.393 I.633 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.472 Y81.397 E.00073
M204 S250
G1 X79.385 Y80.883 F42000
G1 F2147
M204 S5000
G1 X79.399 Y80.821 E.00074
G3 X80.053 Y80.353 I.668 J.244 E.00998
G1 X80.11 Y80.354 E.00066
G3 X79.364 Y80.959 I-.042 J.71 E.03993
G1 X79.369 Y80.941 E.00022
; WIPE_START
G1 F12000
M204 S6000
G1 X79.399 Y80.821 E-.0469
G1 X79.463 Y80.694 E-.05395
G1 X79.548 Y80.581 E-.05387
G1 X79.654 Y80.487 E-.05389
G1 X79.777 Y80.416 E-.05384
G1 X79.912 Y80.371 E-.05391
G1 X80.053 Y80.353 E-.0541
G1 X80.11 Y80.354 E-.02156
G1 X80.228 Y80.371 E-.04559
G1 X80.363 Y80.416 E-.05389
G1 X80.486 Y80.487 E-.05387
G1 X80.592 Y80.581 E-.05383
G1 X80.677 Y80.694 E-.05385
G1 X80.739 Y80.821 E-.05392
G1 X80.773 Y80.957 E-.05305
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.32 F42000
G1 Z4.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5.32 F42000
G1 X84.61 Y95.71 Z5.32
G1 Z4.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/99
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.32 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z5.32
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.822 Y75.817 E.00447
G3 X102.51 Y76.695 I-.239 J.895 E.01571
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.978 J-.037 E.01048
G3 X101.49 Y104.261 I-.867 J-1.276 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.354 Y104.209 E.10053
G3 X77.49 Y103.305 I.049 J-.912 E.01808
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19031
G1 X101.822 Y75.817 E-.12947
G1 X102.067 Y75.919 E-.10052
G1 X102.192 Y76.009 E-.05849
G1 X102.303 Y76.122 E-.06042
G1 X102.39 Y76.249 E-.05837
G1 X102.458 Y76.395 E-.0614
G1 X102.492 Y76.52 E-.04907
G1 X102.506 Y76.656 E-.05194
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.874 Y76.545 Z5.4 F42000
G1 X77.18 Y76.287 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.188 Y76.266 E.00029
G3 X78.405 Y75.41 I1.221 J.442 E.02081
G1 X101.637 Y75.411 E.30504
G3 X102.888 Y76.637 I-.053 J1.306 E.0252
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
M73 P65 R5
G3 X77.11 Y103.295 I.001 J-1.294 E.02669
G1 X77.11 Y76.705 E.34912
G3 X77.131 Y76.474 I1.299 J.003 E.00306
G1 X77.165 Y76.345 E.00174
; WIPE_START
G1 F12000
M204 S6000
G1 X77.188 Y76.266 E-.0312
G1 X77.326 Y75.985 E-.11902
G1 X77.49 Y75.786 E-.09789
G1 X77.737 Y75.594 E-.11912
G1 X77.966 Y75.486 E-.09607
G1 X78.146 Y75.435 E-.0711
G1 X78.405 Y75.41 E-.09911
G1 X78.738 Y75.41 E-.12649
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

G1 X86.219 Y75.825
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428639
G1 F2147
M204 S6000
G1 X101.281 Y75.826 E.20201
; WIPE_START
G1 F18000
G1 X99.281 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5.4 F42000
G1 X101.281 Y104.175 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z5.4 F42000
G1 X79.441 Y81.344 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.436 Y81.332 E.00015
G3 X79.917 Y80.393 I.634 J-.268 E.01404
G1 X80.053 Y80.376 E.0016
G3 X79.501 Y81.453 I.017 J.688 E.03329
G1 X79.47 Y81.396 E.00075
M204 S250
G1 X79.384 Y80.887 F42000
G1 F2147
M204 S5000
G1 X79.4 Y80.821 E.00079
G3 X80.053 Y80.353 I.668 J.242 E.00997
G1 X80.11 Y80.354 E.00067
G3 X79.365 Y80.959 I-.042 J.709 E.03984
G1 X79.369 Y80.945 E.00017
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y80.821 E-.04854
G1 X79.463 Y80.694 E-.0539
G1 X79.548 Y80.581 E-.05383
G1 X79.654 Y80.487 E-.05385
G1 X79.777 Y80.416 E-.05387
G1 X79.912 Y80.371 E-.05388
G1 X80.053 Y80.353 E-.0541
G1 X80.11 Y80.354 E-.02178
G1 X80.363 Y80.416 E-.09884
G1 X80.486 Y80.487 E-.05388
G1 X80.592 Y80.581 E-.05381
G1 X80.678 Y80.694 E-.05395
G1 X80.739 Y80.822 E-.0539
G1 X80.773 Y80.954 E-.05187
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5.4 F42000
G1 X84.61 Y95.71 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 5.08
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/99
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.4 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z5.4
G1 Z5.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.902 Y75.841 E.00559
G3 X102.51 Y76.692 I-.317 J.87 E.0146
G1 X102.51 Y103.305 E.34943
G3 X102.176 Y104.005 I-.954 J-.025 E.0105
G3 X101.49 Y104.261 I-.867 J-1.275 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.305 I.056 J-.92 E.01806
G1 X77.49 Y76.695 E.34941
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19401
G1 X101.902 Y75.841 E-.16175
G1 X102.071 Y75.921 E-.07093
G1 X102.187 Y76.005 E-.05469
G1 X102.356 Y76.193 E-.096
G1 X102.457 Y76.393 E-.08521
G1 X102.501 Y76.569 E-.06885
G1 X102.506 Y76.644 E-.02857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.538 Z5.48 F42000
G1 X77.178 Y76.292 Z5.48
G1 Z5.08
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.185 Y76.268 E.00033
G3 X78.405 Y75.41 I1.216 J.433 E.02088
G1 X101.638 Y75.411 E.30505
G3 X102.888 Y76.637 I-.054 J1.306 E.02519
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.294 J-.002 E.02669
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I-.001 J-1.294 E.02672
G1 X77.11 Y76.705 E.34912
M73 P66 R5
G3 X77.135 Y76.448 I1.291 J-.004 E.0034
G1 X77.162 Y76.35 E.00134
; WIPE_START
G1 F12000
M204 S6000
G1 X77.185 Y76.268 E-.03241
G1 X77.328 Y75.983 E-.12091
G1 X77.49 Y75.786 E-.09704
G1 X77.735 Y75.595 E-.11804
G1 X77.966 Y75.486 E-.09716
G1 X78.146 Y75.435 E-.07106
G1 X78.405 Y75.41 E-.0991
G1 X78.732 Y75.41 E-.12428
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

G1 X86.219 Y75.825
G1 Z5.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428629
G1 F2147
M204 S6000
G1 X101.281 Y75.826 E.20201
; WIPE_START
G1 F18000
G1 X99.281 Y75.826 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5.48 F42000
G1 X101.281 Y104.175 Z5.48
G1 Z5.08
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z5.48 F42000
G1 X79.442 Y81.344 Z5.48
G1 Z5.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.436 Y81.332 E.00015
G3 X79.917 Y80.394 I.633 J-.268 E.01404
G1 X80.053 Y80.376 E.0016
G3 X79.502 Y81.452 I.017 J.688 E.03325
G1 X79.471 Y81.397 E.00074
M204 S250
G1 X79.383 Y80.891 F42000
G1 F2147
M204 S5000
G1 X79.4 Y80.821 E.00084
G3 X80.053 Y80.353 I.668 J.242 E.00997
G1 X80.111 Y80.354 E.00068
G3 X79.366 Y80.959 I-.043 J.709 E.03984
G1 X79.368 Y80.949 E.00012
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y80.821 E-.05005
G1 X79.463 Y80.694 E-.05392
G1 X79.548 Y80.581 E-.05387
G1 X79.654 Y80.487 E-.0539
G1 X79.777 Y80.416 E-.05389
G1 X79.912 Y80.371 E-.05385
G1 X80.053 Y80.353 E-.05407
G1 X80.111 Y80.354 E-.02198
G1 X80.363 Y80.416 E-.09865
G1 X80.486 Y80.487 E-.05389
G1 X80.592 Y80.581 E-.05386
G1 X80.678 Y80.694 E-.0539
G1 X80.739 Y80.821 E-.05382
G1 X80.772 Y80.95 E-.05035
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.48 F42000
G1 Z5.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5.48 F42000
G1 X84.61 Y95.71 Z5.48
G1 Z5.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/99
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.48 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z5.48
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.902 Y75.841 E.00559
G3 X102.51 Y76.695 I-.318 J.869 E.01463
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.954 J-.025 E.0105
G3 X101.49 Y104.262 I-.867 J-1.275 E.0097
G1 X101.49 Y103.76 E.00659
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.354 Y104.209 E.10053
G3 X77.49 Y103.309 I.049 J-.912 E.01803
G1 X77.49 Y76.695 E.34946
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19403
G1 X101.902 Y75.841 E-.16189
G1 X102.071 Y75.921 E-.07077
G1 X102.187 Y76.005 E-.05458
G1 X102.356 Y76.193 E-.09611
G1 X102.458 Y76.397 E-.08667
G1 X102.495 Y76.535 E-.05458
G1 X102.505 Y76.644 E-.04137
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.873 Y76.54 Z5.56 F42000
G1 X77.177 Y76.3 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.187 Y76.266 E.00046
G3 X78.403 Y75.41 I1.218 J.439 E.0208
G1 X101.639 Y75.411 E.30509
G3 X102.888 Y76.637 I-.055 J1.306 E.02518
G1 X102.89 Y103.295 E.35003
G3 X101.597 Y104.59 I-1.294 J.001 E.02669
G1 X78.403 Y104.59 E.30455
G3 X77.11 Y103.295 I.006 J-1.299 E.02667
G1 X77.11 Y76.705 E.34912
G3 X77.131 Y76.472 I1.294 J-.001 E.00308
G1 X77.161 Y76.358 E.00155
; WIPE_START
M73 P67 R5
G1 F12000
M204 S6000
G1 X77.187 Y76.266 E-.03619
G1 X77.328 Y75.984 E-.11992
G1 X77.488 Y75.788 E-.0961
G1 X77.737 Y75.594 E-.11996
G1 X77.966 Y75.486 E-.09611
G1 X78.146 Y75.435 E-.07138
G1 X78.403 Y75.41 E-.09792
G1 X78.725 Y75.41 E-.12242
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

G1 X86.219 Y75.825
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428618
G1 F2147
M204 S6000
G1 X101.281 Y75.826 E.202
; WIPE_START
G1 F18000
G1 X99.281 Y75.826 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5.56 F42000
G1 X101.281 Y104.175 Z5.56
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z5.56 F42000
G1 X79.442 Y81.344 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.437 Y81.332 E.00016
G3 X79.917 Y80.393 I.632 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03321
G1 X79.471 Y81.396 E.00074
M204 S250
G1 X79.382 Y80.895 F42000
G1 F2147
M204 S5000
G1 X79.4 Y80.821 E.00089
G3 X80.053 Y80.353 I.668 J.242 E.00997
G1 X80.111 Y80.354 E.00068
G3 X79.366 Y80.959 I-.043 J.709 E.03983
G1 X79.367 Y80.953 E.00007
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y80.821 E-.05166
G1 X79.462 Y80.694 E-.05388
G1 X79.548 Y80.581 E-.05388
G1 X79.654 Y80.487 E-.05384
G1 X79.777 Y80.416 E-.05391
G1 X79.912 Y80.371 E-.05386
G1 X80.053 Y80.353 E-.0541
G1 X80.111 Y80.354 E-.02215
G1 X80.363 Y80.416 E-.0985
G1 X80.486 Y80.487 E-.05383
G1 X80.592 Y80.581 E-.05389
G1 X80.677 Y80.694 E-.05389
G1 X80.739 Y80.822 E-.05392
G1 X80.771 Y80.946 E-.0487
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5.56 F42000
G1 X84.61 Y95.71 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 5.24
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/99
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.56 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z5.56
G1 Z5.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.823 Y75.817 E.00447
G3 X102.51 Y76.695 I-.252 J.905 E.01567
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.954 J-.025 E.0105
G3 X101.49 Y104.261 I-.865 J-1.272 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.354 Y104.209 E.10053
G3 X77.49 Y103.305 I.058 J-.92 E.01804
G1 X77.49 Y76.695 E.34941
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19026
G1 X101.823 Y75.817 E-.12948
G1 X102.07 Y75.92 E-.10197
G1 X102.187 Y76.004 E-.05453
G1 X102.306 Y76.125 E-.06424
G1 X102.387 Y76.243 E-.05456
G1 X102.458 Y76.397 E-.06446
G1 X102.495 Y76.535 E-.05439
G1 X102.506 Y76.656 E-.0461
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.55 Z5.64 F42000
G1 X77.175 Y76.306 Z5.64
G1 Z5.24
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.187 Y76.266 E.00055
G3 X78.405 Y75.41 I1.22 J.441 E.02082
G1 X101.639 Y75.411 E.30507
G3 X102.888 Y76.637 I-.055 J1.306 E.02517
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.294 J0 E.02672
G1 X78.405 Y104.59 E.30449
G3 X77.11 Y103.295 I-.004 J-1.291 E.02673
G1 X77.11 Y76.705 E.34912
G3 X77.132 Y76.471 I1.297 J.002 E.00309
G1 X77.16 Y76.364 E.00146
; WIPE_START
M73 P68 R5
G1 F12000
M204 S6000
G1 X77.187 Y76.266 E-.03867
G1 X77.327 Y75.984 E-.11943
G1 X77.49 Y75.786 E-.09742
G1 X77.735 Y75.595 E-.11815
G1 X77.968 Y75.485 E-.09802
G1 X78.212 Y75.424 E-.09566
G1 X78.405 Y75.41 E-.0736
G1 X78.719 Y75.41 E-.11906
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

G1 X86.219 Y75.825
G1 Z5.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428598
G1 F2147
M204 S6000
G1 X101.281 Y75.826 E.20199
; WIPE_START
G1 F18000
G1 X99.281 Y75.826 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5.64 F42000
G1 X101.281 Y104.175 Z5.64
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.48 Y97.051 Z5.64 F42000
G1 X79.448 Y81.358 Z5.64
G1 Z5.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.402 Y81.23 E.00159
G3 X79.917 Y80.393 I.668 J-.166 E.01278
G1 X80.053 Y80.376 E.0016
G3 X79.476 Y81.411 I.017 J.688 E.03383
M204 S250
G1 X79.381 Y80.899 F42000
G1 F2147
M204 S5000
G1 X79.4 Y80.821 E.00094
G3 X80.053 Y80.353 I.668 J.242 E.00997
G1 X80.112 Y80.354 E.00069
G3 X79.366 Y80.959 I-.043 J.709 E.03982
G1 X79.366 Y80.957 E.00002
; WIPE_START
G1 F12000
M204 S6000
G1 X79.4 Y80.821 E-.05326
G1 X79.463 Y80.694 E-.05391
G1 X79.548 Y80.581 E-.05383
G1 X79.654 Y80.487 E-.05385
G1 X79.777 Y80.416 E-.05397
G1 X79.912 Y80.371 E-.05379
G1 X80.053 Y80.353 E-.05409
G1 X80.112 Y80.354 E-.02235
G1 X80.363 Y80.416 E-.09834
G1 X80.486 Y80.487 E-.05385
G1 X80.592 Y80.581 E-.05381
G1 X80.678 Y80.694 E-.05395
G1 X80.739 Y80.822 E-.05386
G1 X80.77 Y80.942 E-.04712
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.64 F42000
G1 Z5.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5.64 F42000
G1 X84.61 Y95.71 Z5.64
G1 Z5.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/99
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.64 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z5.64
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2148
M204 S5000
G1 X101.49 Y75.733 E.00666
G1 X101.902 Y75.841 E.00559
G3 X102.51 Y76.695 I-.315 J.867 E.01464
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.005 I-.954 J-.026 E.0105
G3 X101.49 Y104.262 I-.866 J-1.274 E.0097
G1 X101.49 Y103.76 E.00659
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.309 I.056 J-.92 E.01801
G1 X77.49 Y76.695 E.34946
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.733 E-.19403
G1 X101.902 Y75.841 E-.16182
G1 X102.071 Y75.921 E-.07084
G1 X102.186 Y76.004 E-.05424
G1 X102.306 Y76.125 E-.06457
G1 X102.387 Y76.242 E-.05426
G1 X102.458 Y76.397 E-.06458
G1 X102.495 Y76.535 E-.05427
G1 X102.505 Y76.643 E-.04139
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.873 Y76.543 Z5.72 F42000
G1 X77.173 Y76.312 Z5.72
G1 Z5.32
G1 E.8 F1800
G1 F2148
M204 S5000
G1 X77.19 Y76.267 E.00063
G3 X78.405 Y75.41 I1.226 J.449 E.02078
G1 X101.64 Y75.411 E.30508
G3 X102.888 Y76.637 I-.056 J1.306 E.02516
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.011 E.02665
G1 X78.405 Y104.59 E.30449
G3 X77.11 Y103.295 I-.001 J-1.294 E.02672
G1 X77.11 Y76.705 E.34912
G3 X77.133 Y76.471 I1.306 J.01 E.0031
G1 X77.159 Y76.37 E.00136
; WIPE_START
G1 F12000
M204 S6000
G1 X77.19 Y76.267 E-.04099
G1 X77.327 Y75.984 E-.1194
G1 X77.488 Y75.788 E-.09654
G1 X77.684 Y75.627 E-.09641
G1 X77.965 Y75.486 E-.11955
G1 X78.17 Y75.431 E-.08066
G1 X78.405 Y75.41 E-.08961
G1 X78.713 Y75.41 E-.11684
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

G1 X86.219 Y75.825
G1 Z5.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428608
G1 F2148
M204 S6000
G1 X101.281 Y75.826 E.202
; WIPE_START
G1 F18000
G1 X99.281 Y75.826 E-.76
; WIPE_END
M73 P69 R5
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5.72 F42000
G1 X101.281 Y104.175 Z5.72
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2148
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
M73 P69 R4
G1 E-.04 F1800
M204 S10000
G1 X85.515 Y97.038 Z5.72 F42000
G1 X79.402 Y80.904 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2148
M204 S5000
G1 X79.436 Y80.798 E.0013
G3 X79.917 Y80.393 I.634 J.266 E.00762
G1 X80.053 Y80.376 E.0016
G3 X79.39 Y80.963 I.017 J.687 E.03921
M204 S250
G1 X79.426 Y81.366 F42000
G1 F2148
M204 S5000
G1 X79.379 Y81.241 E.00156
G3 X80.053 Y80.353 I.689 J-.176 E.01496
G1 X80.112 Y80.354 E.00069
G3 X79.452 Y81.42 I-.044 J.71 E.03432
; WIPE_START
G1 F12000
M204 S6000
G1 X79.379 Y81.241 E-.07332
G1 X79.359 Y81.1 E-.05386
G1 X79.366 Y80.959 E-.05386
G1 X79.401 Y80.822 E-.05382
G1 X79.463 Y80.694 E-.05394
G1 X79.548 Y80.581 E-.05389
G1 X79.654 Y80.487 E-.05384
G1 X79.777 Y80.416 E-.05387
G1 X79.911 Y80.371 E-.05385
G1 X80.053 Y80.353 E-.05409
G1 X80.112 Y80.354 E-.02259
G1 X80.363 Y80.416 E-.09802
G1 X80.486 Y80.487 E-.05398
G1 X80.539 Y80.534 E-.02707
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2148
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2148
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5.72 F42000
G1 X84.61 Y95.71 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2148
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2148
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/99
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.72 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z5.72
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2148
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.823 Y75.818 E.00448
G3 X102.51 Y76.695 I-.248 J.902 E.01568
G1 X102.51 Y103.305 E.3494
G3 X102.175 Y104.006 I-.978 J-.037 E.01048
G3 X101.49 Y104.261 I-.864 J-1.27 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.353 Y104.209 E.10054
G3 X77.49 Y103.309 I.059 J-.92 E.01798
G1 X77.49 Y76.695 E.34944
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.19026
G1 X101.823 Y75.818 E-.12953
G1 X102.07 Y75.921 E-.102
G1 X102.186 Y76.004 E-.05409
G1 X102.305 Y76.124 E-.0643
G1 X102.379 Y76.229 E-.04903
G1 X102.458 Y76.397 E-.07023
G1 X102.495 Y76.534 E-.05414
G1 X102.506 Y76.656 E-.04643
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.552 Z5.8 F42000
G1 X77.175 Y76.311 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F2148
M204 S5000
G1 X77.225 Y76.168 E.00199
G3 X78.405 Y75.41 I1.176 J.533 E.01948
G1 X101.641 Y75.411 E.30509
G3 X102.888 Y76.637 I-.057 J1.306 E.02515
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.294 J.001 E.02672
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I-.002 J-1.291 E.02671
G1 X77.11 Y76.705 E.34912
G3 X77.149 Y76.388 I1.291 J-.004 E.00421
G1 X77.155 Y76.368 E.00028
; WIPE_START
G1 F12000
M204 S6000
G1 X77.225 Y76.168 E-.08034
G1 X77.328 Y75.983 E-.08039
G1 X77.49 Y75.786 E-.09703
G1 X77.735 Y75.595 E-.11809
G1 X77.966 Y75.486 E-.09708
G1 X78.17 Y75.431 E-.08033
G1 X78.405 Y75.41 E-.08986
G1 X78.713 Y75.41 E-.1169
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

G1 X86.219 Y75.825
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428588
G1 F2148
M204 S6000
G1 X101.281 Y75.826 E.20199
; WIPE_START
G1 F18000
G1 X99.281 Y75.826 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5.8 F42000
G1 X101.281 Y104.175 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2148
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
M73 P70 R4
G1 E-.04 F1800
M204 S10000
G1 X85.512 Y97.039 Z5.8 F42000
G1 X79.399 Y80.921 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2148
M204 S5000
G1 X79.423 Y80.83 E.00111
G3 X79.917 Y80.394 I.647 J.234 E.00802
G1 X80.053 Y80.376 E.0016
G3 X79.387 Y80.98 I.017 J.688 E.03905
M204 S250
G1 X79.426 Y81.366 F42000
G1 F2148
M204 S5000
G1 X79.381 Y81.24 E.00156
G3 X80.053 Y80.353 I.688 J-.177 E.01494
G1 X80.113 Y80.354 E.0007
G3 X79.454 Y81.419 I-.044 J.709 E.03424
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y81.24 E-.07336
G1 X79.359 Y81.1 E-.0538
G1 X79.366 Y80.959 E-.05389
G1 X79.401 Y80.821 E-.05393
G1 X79.463 Y80.694 E-.05381
G1 X79.548 Y80.581 E-.05387
G1 X79.655 Y80.487 E-.0539
G1 X79.777 Y80.416 E-.05383
G1 X79.912 Y80.371 E-.05388
G1 X80.053 Y80.353 E-.05405
G1 X80.113 Y80.354 E-.02276
G1 X80.363 Y80.416 E-.09792
G1 X80.486 Y80.487 E-.05387
G1 X80.539 Y80.534 E-.02714
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2148
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2148
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5.8 F42000
G1 X84.61 Y95.71 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2148
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2148
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/99
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.8 I.93 J.784 P1  F42000
G1 X101.49 Y76.24 Z5.8
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X101.49 Y75.743 E.00653
G1 X101.823 Y75.818 E.00448
G3 X102.51 Y76.695 I-.252 J.905 E.01567
G1 X102.51 Y103.305 E.3494
G3 X102.176 Y104.005 I-.954 J-.026 E.01049
G3 X101.49 Y104.261 I-.865 J-1.269 E.0097
G1 X101.49 Y103.76 E.00658
G1 X86.01 Y103.76 E.20326
G1 X86.01 Y104.21 E.00591
G1 X78.355 Y104.209 E.10051
G3 X77.49 Y103.309 I.056 J-.92 E.01802
G1 X77.49 Y76.695 E.34944
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X86.01 Y75.79 E.09999
G1 X86.01 Y76.24 E.00591
G1 X101.43 Y76.24 E.20247
; WIPE_START
G1 F12000
M204 S6000
G1 X101.49 Y75.743 E-.1903
G1 X101.823 Y75.818 E-.12954
G1 X102.071 Y75.921 E-.102
G1 X102.186 Y76.003 E-.05393
G1 X102.306 Y76.125 E-.06487
G1 X102.386 Y76.242 E-.05397
G1 X102.458 Y76.397 E-.06487
G1 X102.495 Y76.534 E-.05396
G1 X102.506 Y76.656 E-.04655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.875 Y76.555 Z5.88 F42000
G1 X77.17 Y76.323 Z5.88
G1 Z5.48
G1 E.8 F1800
G1 F2147
M204 S5000
G1 X77.186 Y76.265 E.00078
G3 X78.405 Y75.41 I1.215 J.436 E.02085
G1 X101.641 Y75.411 E.3051
G3 X102.888 Y76.637 I-.058 J1.306 E.02514
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.291 J.004 E.02674
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I-.002 J-1.291 E.02671
G1 X77.11 Y76.705 E.34912
G3 X77.131 Y76.469 I1.291 J-.004 E.00312
G1 X77.155 Y76.381 E.0012
; WIPE_START
G1 F12000
M204 S6000
G1 X77.186 Y76.265 E-.04528
G1 X77.294 Y76.037 E-.09601
G1 X77.49 Y75.786 E-.12094
G1 X77.735 Y75.595 E-.11807
G1 X77.965 Y75.486 E-.09709
G1 X78.169 Y75.431 E-.08009
G1 X78.405 Y75.41 E-.09015
G1 X78.701 Y75.41 E-.11238
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

G1 X86.219 Y75.825
G1 Z5.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.428578
G1 F2147
M204 S6000
G1 X101.281 Y75.826 E.20198
; WIPE_START
G1 F18000
G1 X99.281 Y75.826 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.818 Y83.439 Z5.88 F42000
G1 X101.281 Y104.175 Z5.88
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.429348
G1 F2147
M204 S6000
G1 X86.219 Y104.175 E.20236
; WIPE_START
G1 F18000
G1 X88.219 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.512 Y97.039 Z5.88 F42000
G1 X79.399 Y80.922 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.375679
G1 F2147
M204 S5000
G1 X79.425 Y80.83 E.00111
G3 X79.917 Y80.393 I.645 J.231 E.00802
G1 X80.053 Y80.376 E.0016
G3 X79.389 Y80.981 I.017 J.685 E.03884
M204 S250
M73 P71 R4
G1 X79.425 Y81.365 F42000
G1 F2147
M204 S5000
G1 X79.381 Y81.241 E.00155
G3 X80.053 Y80.353 I.688 J-.177 E.01494
G1 X80.113 Y80.354 E.00071
G3 X79.453 Y81.418 I-.045 J.709 E.03425
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y81.241 E-.0729
G1 X79.359 Y81.1 E-.05388
G1 X79.366 Y80.959 E-.05381
G1 X79.401 Y80.821 E-.054
G1 X79.463 Y80.694 E-.05386
G1 X79.548 Y80.581 E-.05382
G1 X79.654 Y80.487 E-.05384
G1 X79.777 Y80.416 E-.05385
G1 X79.912 Y80.371 E-.05391
G1 X80.053 Y80.353 E-.05405
G1 X80.113 Y80.354 E-.02297
G1 X80.363 Y80.416 E-.09772
G1 X80.486 Y80.487 E-.05387
G1 X80.54 Y80.535 E-.02753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.61 Y82.71 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y82.71 E.00762
G1 X85.19 Y84.29 E.02075
G1 X84.61 Y84.29 E.00762
G1 X84.61 Y82.77 E.01996
M204 S10000
G1 X84.9 Y82.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y84.081 E.00614
; WIPE_START
G1 F18000
G1 X84.9 Y82.919 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.727 Y90.549 Z5.88 F42000
G1 X84.61 Y95.71 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2147
M204 S5000
G1 X85.19 Y95.71 E.00762
G1 X85.19 Y97.29 E.02075
G1 X84.61 Y97.29 E.00762
G1 X84.61 Y95.77 E.01996
M204 S10000
G1 X84.9 Y95.919 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.179348
G1 F2147
M204 S6000
G1 X84.9 Y97.081 E.00614
; CHANGE_LAYER
; Z_HEIGHT: 5.56
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F18000
G1 X84.9 Y95.919 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/99
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.88 I.938 J.775 P1  F42000
G1 X101.543 Y75.79 Z5.88
G1 Z5.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1727
M204 S5000
G1 X101.605 Y75.79 E.00081
G3 X102.51 Y76.695 I-.019 J.924 E.01856
G1 X102.51 Y103.305 E.3494
G3 X101.605 Y104.21 I-.923 J-.018 E.01857
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.309 I.021 J-.926 E.01851
G1 X77.49 Y76.695 E.34944
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.483 Y75.79 E.30315
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04629
G1 X101.793 Y75.81 E-.07183
G1 X101.988 Y75.877 E-.07846
G1 X102.155 Y75.978 E-.07415
G1 X102.242 Y76.055 E-.04395
G1 X102.423 Y76.311 E-.11929
G1 X102.495 Y76.533 E-.08879
G1 X102.51 Y76.695 E-.06171
G1 X102.51 Y77.157 E-.17553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.882 Y76.908 Z5.96 F42000
G1 X77.169 Y76.329 Z5.96
G1 Z5.56
G1 E.8 F1800
G1 F1727
M204 S5000
G1 X77.187 Y76.266 E.00086
G3 X78.405 Y75.41 I1.22 J.441 E.02082
G1 X101.642 Y75.411 E.30511
G3 X102.888 Y76.637 I-.059 J1.306 E.02513
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.294 J-.001 E.02669
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.132 Y76.469 I1.297 J.002 E.00313
G1 X77.154 Y76.387 E.00111
; WIPE_START
G1 F12000
M204 S6000
G1 X77.187 Y76.266 E-.0477
G1 X77.294 Y76.036 E-.09648
G1 X77.49 Y75.786 E-.12043
G1 X77.735 Y75.595 E-.11801
G1 X77.968 Y75.485 E-.09809
G1 X78.212 Y75.424 E-.09566
G1 X78.405 Y75.41 E-.07363
G1 X78.695 Y75.41 E-.11001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.399 Y80.914 Z5.96 F42000
G1 Z5.56
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1727
M204 S5000
G1 X79.436 Y80.798 E.00143
G3 X79.917 Y80.394 I.634 J.265 E.00762
G1 X80.053 Y80.376 E.0016
G3 X79.389 Y80.973 I.017 J.687 E.03909
M204 S250
G1 X79.425 Y81.365 F42000
G1 F1727
M204 S5000
G1 X79.381 Y81.241 E.00155
G3 X80.053 Y80.353 I.688 J-.177 E.01494
G1 X80.114 Y80.355 E.00071
G3 X79.454 Y81.418 I-.045 J.709 E.03424
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y81.241 E-.07303
G1 X79.359 Y81.1 E-.05389
G1 X79.366 Y80.959 E-.05386
G1 X79.401 Y80.822 E-.05386
G1 X79.462 Y80.694 E-.05381
G1 X79.548 Y80.581 E-.0539
G1 X79.654 Y80.487 E-.05392
G1 X79.777 Y80.416 E-.05384
G1 X79.912 Y80.371 E-.05388
G1 X80.053 Y80.353 E-.05404
G1 X80.114 Y80.355 E-.02317
G1 X80.363 Y80.416 E-.09756
G1 X80.486 Y80.487 E-.0539
G1 X80.54 Y80.535 E-.02734
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
G1 X101.544 Y75.79 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00079
G3 X102.51 Y76.692 I-.019 J.925 E.01853
G1 X102.51 Y103.305 E.34943
M73 P72 R4
G3 X101.605 Y104.21 I-.922 J-.017 E.01857
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.021 J-.926 E.01852
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.484 Y75.79 E.30317
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04581
G1 X101.792 Y75.81 E-.07161
G1 X101.988 Y75.877 E-.07857
G1 X102.154 Y75.978 E-.0741
G1 X102.242 Y76.055 E-.04416
G1 X102.423 Y76.311 E-.11926
G1 X102.483 Y76.479 E-.06766
G1 X102.51 Y76.692 E-.08187
G1 X102.51 Y77.158 E-.17697
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.882 Y76.91 Z6.04 F42000
G1 X77.167 Y76.335 Z6.04
G1 Z5.64
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.186 Y76.266 E.00094
G3 X78.405 Y75.41 I1.215 J.436 E.02085
G1 X101.643 Y75.411 E.30512
G3 X102.888 Y76.637 I-.059 J1.306 E.02512
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.299 J-.004 E.02669
G1 X78.405 Y104.59 E.30449
G3 X77.11 Y103.295 I.004 J-1.299 E.02669
G1 X77.11 Y76.705 E.34912
G3 X77.131 Y76.468 I1.291 J-.004 E.00314
G1 X77.151 Y76.393 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X77.186 Y76.266 E-.0501
G1 X77.294 Y76.037 E-.09608
G1 X77.49 Y75.786 E-.12095
G1 X77.735 Y75.595 E-.11815
G1 X77.966 Y75.486 E-.09701
G1 X78.168 Y75.432 E-.07952
G1 X78.405 Y75.41 E-.09068
G1 X78.688 Y75.41 E-.10752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.397 Y80.929 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.426 Y80.83 E.0012
G3 X79.917 Y80.394 I.644 J.229 E.00801
G1 X80.053 Y80.376 E.0016
G3 X79.39 Y80.989 I.016 J.683 E.03863
M204 S250
G1 X79.426 Y81.366 F42000
G1 F1722
M204 S5000
G1 X79.381 Y81.24 E.00156
G3 X80.053 Y80.353 I.688 J-.177 E.01494
G1 X80.114 Y80.355 E.00072
G3 X79.454 Y81.419 I-.045 J.709 E.03423
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y81.24 E-.07325
G1 X79.359 Y81.1 E-.0538
G1 X79.366 Y80.959 E-.05384
G1 X79.401 Y80.821 E-.05392
G1 X79.462 Y80.694 E-.05379
G1 X79.548 Y80.581 E-.05386
G1 X79.654 Y80.487 E-.05395
G1 X79.777 Y80.416 E-.05387
G1 X79.912 Y80.371 E-.05389
G1 X80.053 Y80.353 E-.054
G1 X80.114 Y80.355 E-.02326
G1 X80.363 Y80.416 E-.09745
G1 X80.486 Y80.487 E-.05392
G1 X80.539 Y80.534 E-.02719
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
G1 X101.546 Y75.79 F42000
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00078
G3 X102.51 Y76.695 I-.019 J.925 E.01856
G1 X102.51 Y103.305 E.3494
G3 X101.605 Y104.21 I-.922 J-.017 E.01857
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.021 J-.926 E.01852
G1 X77.49 Y76.695 E.34943
M73 P73 R4
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.486 Y75.79 E.30319
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04532
G1 X101.792 Y75.81 E-.07146
G1 X101.988 Y75.877 E-.07889
G1 X102.154 Y75.978 E-.07377
G1 X102.242 Y76.054 E-.0442
G1 X102.423 Y76.311 E-.11939
G1 X102.492 Y76.52 E-.08356
G1 X102.51 Y76.695 E-.06694
G1 X102.51 Y77.159 E-.17648
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.882 Y76.913 Z6.12 F42000
G1 X77.168 Y76.342 Z6.12
G1 Z5.72
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.208 Y76.209 E.00182
G3 X78.405 Y75.41 I1.196 J.495 E.02004
G1 X101.644 Y75.411 E.30513
G3 X102.888 Y76.637 I-.06 J1.306 E.02511
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I-.002 J-1.291 E.02671
G1 X77.11 Y76.705 E.34912
G3 X77.132 Y76.467 I1.294 J-.001 E.00315
G1 X77.152 Y76.4 E.00092
; WIPE_START
G1 F12000
M204 S6000
G1 X77.208 Y76.209 E-.07559
G1 X77.328 Y75.983 E-.09706
G1 X77.488 Y75.788 E-.09604
G1 X77.699 Y75.617 E-.10324
G1 X77.965 Y75.486 E-.11281
G1 X78.167 Y75.432 E-.07932
G1 X78.405 Y75.41 E-.09091
G1 X78.682 Y75.41 E-.10504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.397 Y80.932 Z6.12 F42000
G1 Z5.72
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.423 Y80.83 E.00123
G3 X79.917 Y80.394 I.647 J.235 E.00803
G1 X80.053 Y80.376 E.0016
G3 X79.386 Y80.991 I.017 J.688 E.03897
M204 S250
G1 X79.426 Y81.367 F42000
G1 F1722
M204 S5000
G1 X79.381 Y81.24 E.00157
G3 X80.053 Y80.353 I.688 J-.177 E.01494
G1 X80.114 Y80.355 E.00072
G3 X79.455 Y81.42 I-.046 J.709 E.03421
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y81.24 E-.07366
G1 X79.359 Y81.1 E-.05386
G1 X79.366 Y80.959 E-.05387
G1 X79.401 Y80.822 E-.0538
G1 X79.463 Y80.694 E-.05395
G1 X79.548 Y80.581 E-.05385
G1 X79.654 Y80.487 E-.0539
G1 X79.777 Y80.416 E-.05388
G1 X79.912 Y80.371 E-.05388
G1 X80.053 Y80.353 E-.05402
G1 X80.114 Y80.355 E-.02341
G1 X80.363 Y80.416 E-.09725
G1 X80.486 Y80.487 E-.05395
G1 X80.538 Y80.534 E-.02673
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
G1 X101.547 Y75.79 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00076
G3 X102.51 Y76.692 I-.019 J.925 E.01853
G1 X102.51 Y103.305 E.34943
G3 X101.605 Y104.21 I-.922 J-.017 E.01857
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.021 J-.926 E.01852
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.487 Y75.79 E.3032
; WIPE_START
M73 P74 R4
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04484
G1 X101.791 Y75.81 E-.0713
G1 X101.988 Y75.877 E-.07906
G1 X102.154 Y75.978 E-.07361
G1 X102.242 Y76.055 E-.04441
G1 X102.423 Y76.31 E-.11901
G1 X102.483 Y76.479 E-.068
G1 X102.51 Y76.692 E-.08184
G1 X102.51 Y77.161 E-.17793
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.916 Z6.2 F42000
G1 X77.163 Y76.349 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.186 Y76.266 E.00113
G3 X78.405 Y75.41 I1.218 J.438 E.02084
G1 X101.644 Y75.411 E.30514
G3 X102.888 Y76.637 I-.061 J1.306 E.02511
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.294 J-.002 E.02669
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.002 J-1.294 E.02669
G1 X77.11 Y76.705 E.34912
G3 X77.132 Y76.466 I1.294 J-.001 E.00316
G1 X77.148 Y76.407 E.00081
; WIPE_START
G1 F12000
M204 S6000
G1 X77.186 Y76.266 E-.05536
G1 X77.327 Y75.985 E-.11952
G1 X77.488 Y75.788 E-.09658
G1 X77.63 Y75.666 E-.07114
G1 X77.904 Y75.509 E-.1202
G1 X78.146 Y75.435 E-.09585
G1 X78.405 Y75.41 E-.09914
G1 X78.674 Y75.41 E-.10222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.396 Y80.924 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.438 Y80.798 E.00155
G3 X79.917 Y80.394 I.631 J.261 E.00761
G1 X80.053 Y80.376 E.0016
G3 X79.39 Y80.983 I.016 J.683 E.03872
M204 S250
G1 X79.426 Y81.367 F42000
G1 F1722
M204 S5000
G1 X79.381 Y81.24 E.00157
G3 X80.053 Y80.353 I.688 J-.177 E.01494
G1 X80.115 Y80.355 E.00073
G3 X79.455 Y81.42 I-.046 J.709 E.0342
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y81.24 E-.0738
G1 X79.359 Y81.1 E-.05386
G1 X79.366 Y80.959 E-.05388
G1 X79.401 Y80.822 E-.05385
G1 X79.463 Y80.694 E-.05389
G1 X79.548 Y80.581 E-.05385
G1 X79.654 Y80.487 E-.05389
G1 X79.777 Y80.416 E-.05389
G1 X79.911 Y80.371 E-.05378
G1 X80.053 Y80.353 E-.05408
G1 X80.115 Y80.355 E-.02365
G1 X80.363 Y80.416 E-.09706
G1 X80.486 Y80.487 E-.05388
G1 X80.538 Y80.533 E-.02663
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
G1 X101.548 Y75.79 F42000
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00074
G3 X102.51 Y76.695 I-.019 J.925 E.01856
G1 X102.51 Y103.307 E.34942
G3 X101.605 Y104.21 I-.926 J-.023 E.01853
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.017 J-.922 E.01854
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.488 Y75.79 E.30322
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04435
M73 P75 R4
G1 X101.791 Y75.81 E-.07116
G1 X101.988 Y75.877 E-.0791
G1 X102.154 Y75.978 E-.07361
G1 X102.242 Y76.055 E-.04452
G1 X102.423 Y76.311 E-.11922
G1 X102.494 Y76.532 E-.08822
G1 X102.51 Y76.695 E-.06236
G1 X102.51 Y77.162 E-.17746
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.916 Z6.28 F42000
G1 X77.164 Y76.346 Z6.28
G1 Z5.88
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.235 Y76.148 E.00276
G3 X78.403 Y75.41 I1.168 J.555 E.01914
G1 X101.645 Y75.411 E.30518
G3 X102.888 Y76.637 I-.062 J1.306 E.02509
G1 X102.89 Y103.295 E.35003
G3 X101.597 Y104.59 I-1.294 J0 E.02668
G1 X78.405 Y104.59 E.30452
G3 X77.11 Y103.295 I.011 J-1.306 E.02665
G1 X77.11 Y76.705 E.34912
M73 P75 R3
G3 X77.145 Y76.403 I1.294 J-.002 E.00401
; WIPE_START
G1 F12000
M204 S6000
G1 X77.235 Y76.148 E-.1026
G1 X77.327 Y75.985 E-.0713
G1 X77.519 Y75.758 E-.11285
G1 X77.737 Y75.594 E-.10373
G1 X77.965 Y75.486 E-.09608
G1 X78.146 Y75.435 E-.07131
G1 X78.403 Y75.41 E-.098
G1 X78.677 Y75.41 E-.10413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.396 Y80.936 Z6.28 F42000
G1 Z5.88
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.424 Y80.83 E.00128
G3 X79.917 Y80.394 I.646 J.234 E.00802
G1 X80.053 Y80.376 E.0016
G3 X79.386 Y80.995 I.017 J.687 E.03883
M204 S250
G1 X79.426 Y81.368 F42000
G1 F1722
M204 S5000
G1 X79.38 Y81.241 E.00158
G3 X80.053 Y80.353 I.689 J-.176 E.01495
G1 X80.115 Y80.355 E.00073
G3 X79.453 Y81.421 I-.047 J.71 E.03427
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.07404
G1 X79.359 Y81.1 E-.05388
G1 X79.366 Y80.959 E-.05378
G1 X79.401 Y80.821 E-.05402
G1 X79.463 Y80.694 E-.05383
G1 X79.548 Y80.581 E-.05386
G1 X79.654 Y80.487 E-.05384
G1 X79.777 Y80.416 E-.05388
G1 X79.912 Y80.371 E-.05385
G1 X80.053 Y80.353 E-.05402
G1 X80.115 Y80.355 E-.02388
G1 X80.363 Y80.416 E-.09683
G1 X80.486 Y80.487 E-.05391
G1 X80.538 Y80.533 E-.02637
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
G1 X101.549 Y75.79 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00073
G3 X102.51 Y76.695 I-.02 J.925 E.01856
G1 X102.51 Y103.305 E.3494
G3 X101.605 Y104.21 I-.922 J-.017 E.01857
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.021 J-.926 E.01851
G1 X77.49 Y76.695 E.34944
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.489 Y75.79 E.30324
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04387
G1 X101.791 Y75.81 E-.07109
G1 X101.988 Y75.877 E-.07928
G1 X102.153 Y75.977 E-.07334
G1 X102.242 Y76.054 E-.0446
G1 X102.423 Y76.311 E-.11934
G1 X102.494 Y76.531 E-.08802
G1 X102.51 Y76.695 E-.06251
G1 X102.51 Y77.163 E-.17794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.921 Z6.36 F42000
G1 X77.161 Y76.359 Z6.36
G1 Z5.96
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.188 Y76.266 E.00127
G3 X78.405 Y75.41 I1.221 J.443 E.02081
G1 X101.646 Y75.411 E.30516
G3 X102.888 Y76.637 I-.062 J1.306 E.02508
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
M73 P76 R3
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.011 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.133 Y76.465 I1.299 J.003 E.00317
G1 X77.145 Y76.417 E.00065
; WIPE_START
G1 F12000
M204 S6000
G1 X77.188 Y76.266 E-.05962
G1 X77.294 Y76.036 E-.09646
G1 X77.49 Y75.786 E-.12046
G1 X77.738 Y75.593 E-.11935
G1 X77.965 Y75.486 E-.09574
G1 X78.165 Y75.432 E-.07849
G1 X78.405 Y75.41 E-.09175
G1 X78.664 Y75.41 E-.09814
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.394 Y80.942 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.424 Y80.83 E.00136
G3 X79.917 Y80.393 I.646 J.234 E.00802
G1 X80.053 Y80.376 E.0016
G3 X79.385 Y81.001 I.017 J.687 E.03876
M204 S250
G1 X79.422 Y81.357 F42000
G1 F1722
M204 S5000
G1 X79.413 Y81.341 E.00021
G3 X80.053 Y80.353 I.655 J-.277 E.01619
G1 X80.116 Y80.355 E.00074
G3 X79.482 Y81.466 I-.047 J.71 E.03364
G1 X79.451 Y81.41 E.00075
; WIPE_START
G1 F12000
M204 S6000
G1 X79.413 Y81.341 E-.02964
G1 X79.359 Y81.1 E-.09382
G1 X79.366 Y80.959 E-.05387
G1 X79.401 Y80.822 E-.05386
G1 X79.462 Y80.694 E-.05384
G1 X79.548 Y80.581 E-.05391
G1 X79.654 Y80.487 E-.05386
G1 X79.777 Y80.416 E-.05385
G1 X79.912 Y80.371 E-.05392
G1 X80.053 Y80.353 E-.05399
G1 X80.116 Y80.355 E-.02403
G1 X80.363 Y80.416 E-.09671
G1 X80.486 Y80.487 E-.05388
G1 X80.546 Y80.541 E-.03084
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
G1 X101.551 Y75.79 F42000
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00071
G3 X102.51 Y76.692 I-.02 J.925 E.01853
G1 X102.51 Y103.305 E.34943
G3 X101.605 Y104.21 I-.922 J-.017 E.01857
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.309 I.021 J-.926 E.0185
G1 X77.49 Y76.695 E.34945
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.491 Y75.79 E.30325
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04341
G1 X101.79 Y75.81 E-.07086
G1 X101.989 Y75.877 E-.07951
G1 X102.153 Y75.977 E-.07318
G1 X102.242 Y76.054 E-.04475
G1 X102.423 Y76.311 E-.11933
G1 X102.483 Y76.479 E-.0677
G1 X102.51 Y76.692 E-.08189
G1 X102.51 Y77.164 E-.17936
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.924 Z6.44 F42000
G1 X77.159 Y76.366 Z6.44
G1 Z6.04
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.188 Y76.267 E.00136
G3 X78.405 Y75.41 I1.221 J.442 E.02082
G1 X101.647 Y75.411 E.30516
G3 X102.888 Y76.637 I-.063 J1.306 E.02508
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
M73 P77 R3
G3 X77.133 Y76.465 I1.299 J.003 E.00318
G1 X77.144 Y76.424 E.00055
; WIPE_START
G1 F12000
M204 S6000
G1 X77.188 Y76.267 E-.06228
G1 X77.327 Y75.985 E-.11945
G1 X77.49 Y75.786 E-.09765
G1 X77.738 Y75.593 E-.11934
G1 X77.966 Y75.486 E-.09575
G1 X78.164 Y75.432 E-.07819
G1 X78.405 Y75.41 E-.092
G1 X78.656 Y75.41 E-.09534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.444 Y81.349 Z6.44 F42000
G1 Z6.04
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.437 Y81.332 E.00022
G3 X79.917 Y80.394 I.633 J-.268 E.01403
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.451 I.017 J.687 E.03321
G1 X79.474 Y81.401 E.00068
M204 S250
G1 X79.371 Y80.938 F42000
G1 F1722
M204 S5000
G1 X79.401 Y80.822 E.0014
G3 X80.053 Y80.353 I.668 J.242 E.00996
G1 X80.116 Y80.355 E.00075
G3 X79.362 Y80.997 I-.047 J.709 E.03933
; WIPE_START
G1 F12000
M204 S6000
G1 X79.401 Y80.822 E-.06839
G1 X79.462 Y80.694 E-.05383
G1 X79.548 Y80.581 E-.05394
G1 X79.654 Y80.487 E-.05383
G1 X79.777 Y80.416 E-.05388
G1 X79.911 Y80.371 E-.05384
G1 X80.053 Y80.353 E-.05404
G1 X80.116 Y80.355 E-.02424
G1 X80.363 Y80.416 E-.09655
G1 X80.486 Y80.487 E-.05389
G1 X80.592 Y80.581 E-.05382
G1 X80.677 Y80.694 E-.05387
G1 X80.739 Y80.821 E-.05387
G1 X80.76 Y80.903 E-.03202
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
G1 X101.552 Y75.79 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.0007
G3 X102.51 Y76.695 I-.02 J.925 E.01856
G1 X102.51 Y103.305 E.3494
G3 X101.605 Y104.21 I-.922 J-.017 E.01857
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.309 I.017 J-.922 E.01852
G1 X77.49 Y76.695 E.34945
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.492 Y75.79 E.30327
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04294
G1 X101.79 Y75.81 E-.07071
G1 X101.988 Y75.877 E-.07962
G1 X102.153 Y75.977 E-.07302
G1 X102.242 Y76.055 E-.04502
G1 X102.423 Y76.311 E-.11927
G1 X102.494 Y76.53 E-.0877
G1 X102.51 Y76.695 E-.06285
G1 X102.51 Y77.166 E-.17887
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.927 Z6.52 F42000
G1 X77.157 Y76.372 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.188 Y76.266 E.00145
G3 X78.405 Y75.41 I1.221 J.442 E.02081
G1 X101.647 Y75.411 E.30517
G3 X102.888 Y76.637 I-.064 J1.306 E.02507
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G3 X77.133 Y76.464 I1.299 J.003 E.00319
G1 X77.142 Y76.43 E.00046
; WIPE_START
M73 P78 R3
G1 F12000
M204 S6000
G1 X77.188 Y76.266 E-.06468
G1 X77.328 Y75.983 E-.11991
G1 X77.49 Y75.786 E-.097
G1 X77.738 Y75.593 E-.11941
G1 X77.905 Y75.509 E-.07101
G1 X78.149 Y75.435 E-.09722
G1 X78.405 Y75.41 E-.09775
G1 X78.65 Y75.41 E-.09302
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.392 Y80.949 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.423 Y80.829 E.00144
G3 X79.917 Y80.393 I.646 J.234 E.00803
G1 X80.053 Y80.376 E.0016
G3 X79.384 Y81.008 I.017 J.687 E.03871
M204 S250
G1 X79.427 Y81.368 F42000
G1 F1722
M204 S5000
G1 X79.38 Y81.241 E.00159
G3 X80.053 Y80.353 I.689 J-.176 E.01495
G1 X80.117 Y80.355 E.00075
G3 X79.454 Y81.422 I-.048 J.71 E.03425
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.07431
G1 X79.359 Y81.1 E-.05395
G1 X79.366 Y80.959 E-.05386
G1 X79.401 Y80.821 E-.05385
G1 X79.463 Y80.694 E-.05386
G1 X79.548 Y80.581 E-.05392
G1 X79.654 Y80.487 E-.05386
G1 X79.777 Y80.416 E-.05384
G1 X79.912 Y80.371 E-.0539
G1 X80.053 Y80.353 E-.05397
G1 X80.117 Y80.355 E-.02441
G1 X80.363 Y80.416 E-.09634
G1 X80.486 Y80.487 E-.05387
G1 X80.537 Y80.532 E-.02607
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
G1 X101.553 Y75.79 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00068
G3 X102.51 Y76.695 I-.02 J.925 E.01856
G1 X102.51 Y103.305 E.3494
G3 X101.605 Y104.21 I-.922 J-.017 E.01857
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.305 I.021 J-.926 E.01855
G1 X77.49 Y76.695 E.34941
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.493 Y75.79 E.30328
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04248
G1 X101.79 Y75.81 E-.07063
G1 X101.988 Y75.877 E-.07968
G1 X102.152 Y75.976 E-.07289
G1 X102.242 Y76.054 E-.04517
G1 X102.423 Y76.311 E-.11926
G1 X102.494 Y76.53 E-.08757
G1 X102.51 Y76.695 E-.063
G1 X102.51 Y77.167 E-.17933
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.931 Z6.6 F42000
G1 X77.157 Y76.381 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.189 Y76.267 E.00156
G3 X78.405 Y75.41 I1.225 J.447 E.02079
G1 X101.648 Y75.411 E.30518
G3 X102.888 Y76.637 I-.065 J1.306 E.02506
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.005 J-1.298 E.02667
G1 X77.11 Y76.705 E.34912
G3 X77.125 Y76.514 I1.304 J.009 E.00253
G1 X77.143 Y76.44 E.001
; WIPE_START
G1 F12000
M204 S6000
G1 X77.189 Y76.267 E-.06796
G1 X77.327 Y75.985 E-.11931
G1 X77.488 Y75.788 E-.09676
G1 X77.737 Y75.594 E-.11994
G1 X77.966 Y75.486 E-.09604
G1 X78.163 Y75.432 E-.07767
G1 X78.405 Y75.41 E-.09254
G1 X78.642 Y75.41 E-.08978
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.394 Y80.94 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.396 Y80.929 E.00013
G3 X79.917 Y80.394 I.674 J.135 E.00923
G1 X80.053 Y80.376 E.0016
G3 X79.382 Y81.065 I.017 J.687 E.03804
G1 X79.388 Y80.999 E.00077
M204 S250
G1 X79.427 Y81.369 F42000
G1 F1722
M204 S5000
G1 X79.38 Y81.241 E.00159
G3 X80.053 Y80.353 I.689 J-.176 E.01495
G1 X80.117 Y80.355 E.00076
G3 X79.454 Y81.422 I-.048 J.71 E.03424
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.0743
G1 X79.359 Y81.1 E-.05393
G1 X79.366 Y80.959 E-.05389
G1 X79.401 Y80.822 E-.05382
G1 X79.463 Y80.694 E-.05395
G1 X79.548 Y80.581 E-.05382
G1 X79.654 Y80.487 E-.05382
G1 X79.777 Y80.416 E-.05391
G1 X79.912 Y80.371 E-.05389
G1 X80.053 Y80.353 E-.05399
G1 X80.117 Y80.355 E-.02461
G1 X80.363 Y80.416 E-.09614
G1 X80.486 Y80.487 E-.0539
G1 X80.537 Y80.532 E-.02605
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
G1 X101.554 Y75.79 F42000
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00066
G3 X102.51 Y76.695 I-.02 J.925 E.01856
G1 X102.51 Y103.305 E.34939
G3 X101.605 Y104.21 I-.922 J-.017 E.01858
M73 P79 R3
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.309 I.021 J-.926 E.0185
G1 X77.49 Y76.695 E.34945
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.494 Y75.79 E.3033
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04203
G1 X101.789 Y75.81 E-.07042
G1 X101.988 Y75.877 E-.0799
G1 X102.152 Y75.976 E-.0727
G1 X102.242 Y76.054 E-.04527
G1 X102.423 Y76.311 E-.11932
G1 X102.494 Y76.53 E-.0874
G1 X102.51 Y76.695 E-.06317
G1 X102.51 Y77.168 E-.17978
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.932 Z6.68 F42000
G1 X77.154 Y76.384 Z6.68
G1 Z6.28
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.189 Y76.267 E.0016
G3 X78.405 Y75.41 I1.225 J.448 E.02079
G1 X101.649 Y75.411 E.30519
G3 X102.888 Y76.637 I-.065 J1.306 E.02505
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.006 J-1.299 E.02667
G1 X77.11 Y76.705 E.34912
G3 X77.134 Y76.463 I1.304 J.009 E.00321
G1 X77.14 Y76.442 E.00028
; WIPE_START
G1 F12000
M204 S6000
G1 X77.189 Y76.267 E-.06917
G1 X77.328 Y75.983 E-.11987
G1 X77.488 Y75.788 E-.0962
G1 X77.737 Y75.594 E-.11983
G1 X77.966 Y75.486 E-.09613
G1 X78.162 Y75.433 E-.07739
G1 X78.405 Y75.41 E-.09279
G1 X78.639 Y75.41 E-.08863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.393 Y80.943 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.396 Y80.929 E.00017
G3 X79.917 Y80.394 I.674 J.135 E.00923
G1 X80.053 Y80.376 E.0016
G3 X79.383 Y81.065 I.017 J.687 E.03801
G1 X79.388 Y81.003 E.00073
M204 S250
G1 X79.426 Y81.368 F42000
G1 F1722
M204 S5000
G1 X79.382 Y81.24 E.00158
G3 X80.053 Y80.353 I.688 J-.177 E.01493
G1 X80.118 Y80.355 E.00076
G3 X79.456 Y81.421 I-.049 J.709 E.03417
; WIPE_START
G1 F12000
M204 S6000
G1 X79.382 Y81.24 E-.07407
G1 X79.359 Y81.1 E-.05382
G1 X79.366 Y80.959 E-.05378
G1 X79.401 Y80.822 E-.05393
G1 X79.463 Y80.694 E-.05391
G1 X79.548 Y80.581 E-.05385
G1 X79.654 Y80.487 E-.05385
G1 X79.777 Y80.416 E-.05387
G1 X79.911 Y80.371 E-.05386
G1 X80.053 Y80.353 E-.05401
G1 X80.118 Y80.355 E-.02482
G1 X80.363 Y80.416 E-.09594
G1 X80.486 Y80.487 E-.05396
G1 X80.538 Y80.533 E-.02634
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
G1 X101.555 Y75.79 F42000
G1 Z6.36
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00065
G3 X102.51 Y76.695 I-.02 J.925 E.01856
G1 X102.51 Y103.305 E.34939
G3 X101.605 Y104.21 I-.922 J-.017 E.01858
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.305 I.021 J-.926 E.01855
G1 X77.49 Y76.695 E.34941
M73 P80 R3
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.495 Y75.79 E.30331
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04158
G1 X101.789 Y75.81 E-.07026
G1 X101.989 Y75.877 E-.0801
G1 X102.152 Y75.976 E-.07251
G1 X102.242 Y76.055 E-.0455
G1 X102.423 Y76.311 E-.11921
G1 X102.494 Y76.529 E-.08728
G1 X102.51 Y76.695 E-.06333
G1 X102.51 Y77.169 E-.18023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.932 Z6.76 F42000
G1 X77.151 Y76.38 Z6.76
G1 Z6.36
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.231 Y76.162 E.00305
G3 X78.405 Y75.41 I1.178 J.547 E.01933
G1 X101.65 Y75.411 E.3052
G3 X102.888 Y76.637 I-.066 J1.306 E.02504
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G3 X77.138 Y76.438 I1.299 J.003 E.00354
; WIPE_START
G1 F12000
M204 S6000
G1 X77.231 Y76.162 E-.11074
G1 X77.328 Y75.983 E-.07713
G1 X77.49 Y75.786 E-.09703
G1 X77.738 Y75.593 E-.11931
G1 X77.966 Y75.486 E-.09581
G1 X78.146 Y75.435 E-.07107
G1 X78.405 Y75.41 E-.09912
G1 X78.642 Y75.41 E-.0898
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.39 Y80.958 Z6.76 F42000
G1 Z6.36
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.426 Y80.83 E.00155
G3 X79.917 Y80.394 I.644 J.229 E.00801
G1 X80.053 Y80.376 E.0016
G3 X79.387 Y81.017 I.017 J.683 E.03833
M204 S250
G1 X79.427 Y81.369 F42000
G1 F1722
M204 S5000
G1 X79.38 Y81.241 E.0016
G3 X80.052 Y80.353 I.689 J-.176 E.01494
G1 X80.118 Y80.355 E.00077
G3 X79.454 Y81.422 I-.049 J.71 E.03423
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.07466
G1 X79.359 Y81.1 E-.05384
G1 X79.366 Y80.959 E-.05384
G1 X79.401 Y80.822 E-.05389
G1 X79.462 Y80.694 E-.05385
G1 X79.548 Y80.581 E-.0539
G1 X79.654 Y80.487 E-.05383
G1 X79.777 Y80.416 E-.05388
G1 X79.911 Y80.371 E-.05387
G1 X80.052 Y80.353 E-.054
G1 X80.118 Y80.355 E-.02501
G1 X80.363 Y80.416 E-.0958
G1 X80.486 Y80.487 E-.05386
G1 X80.536 Y80.532 E-.02577
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
G1 X101.557 Y75.79 F42000
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00063
G3 X102.51 Y76.695 I-.02 J.925 E.01856
G1 X102.51 Y103.305 E.3494
G3 X101.605 Y104.21 I-.922 J-.017 E.01858
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.309 I.021 J-.926 E.01851
G1 X77.49 Y76.695 E.34945
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.497 Y75.79 E.30333
; WIPE_START
M73 P81 R3
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04114
G1 X101.789 Y75.81 E-.07018
G1 X101.989 Y75.877 E-.08019
G1 X102.151 Y75.976 E-.07237
G1 X102.242 Y76.055 E-.04563
G1 X102.423 Y76.311 E-.1193
G1 X102.494 Y76.529 E-.08704
G1 X102.51 Y76.695 E-.06347
G1 X102.51 Y77.171 E-.18068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.937 Z6.84 F42000
G1 X77.151 Y76.395 Z6.84
G1 Z6.44
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.188 Y76.266 E.00176
G3 X78.405 Y75.41 I1.221 J.443 E.02081
G1 X101.65 Y75.411 E.30521
G3 X102.888 Y76.637 I-.067 J1.306 E.02503
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.011 E.02666
G1 X78.405 Y104.59 E.30449
G3 X77.11 Y103.295 I.011 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.134 Y76.461 I1.299 J.003 E.00323
G1 X77.136 Y76.453 E.00011
; WIPE_START
M73 P81 R2
G1 F12000
M204 S6000
G1 X77.188 Y76.266 E-.07372
G1 X77.328 Y75.983 E-.1199
G1 X77.49 Y75.786 E-.09694
G1 X77.738 Y75.593 E-.11936
G1 X77.965 Y75.486 E-.09579
G1 X78.146 Y75.435 E-.07117
G1 X78.405 Y75.41 E-.0991
G1 X78.626 Y75.41 E-.08403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.392 Y80.951 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.394 Y80.935 E.00019
G3 X79.917 Y80.394 I.676 J.129 E.00931
G1 X80.053 Y80.376 E.0016
G3 X79.382 Y81.065 I.017 J.688 E.03809
G1 X79.387 Y81.011 E.00064
M204 S250
G1 X79.427 Y81.369 F42000
G1 F1722
M204 S5000
G1 X79.38 Y81.241 E.0016
G3 X80.052 Y80.353 I.689 J-.176 E.01494
G1 X80.119 Y80.355 E.00077
G3 X79.455 Y81.422 I-.049 J.71 E.03422
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.07462
G1 X79.359 Y81.1 E-.05392
G1 X79.366 Y80.959 E-.05384
G1 X79.401 Y80.821 E-.05391
G1 X79.462 Y80.694 E-.05377
G1 X79.548 Y80.581 E-.0539
G1 X79.654 Y80.487 E-.05392
G1 X79.777 Y80.416 E-.05383
G1 X79.912 Y80.371 E-.0539
G1 X80.052 Y80.353 E-.05396
G1 X80.119 Y80.355 E-.02519
G1 X80.363 Y80.416 E-.09559
G1 X80.486 Y80.487 E-.05388
G1 X80.536 Y80.532 E-.02579
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
G1 X101.558 Y75.79 F42000
G1 Z6.52
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00062
G3 X102.51 Y76.695 I-.02 J.925 E.01856
G1 X102.51 Y103.305 E.3494
G3 X101.605 Y104.21 I-.922 J-.017 E.01858
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.305 I.021 J-.926 E.01855
G1 X77.49 Y76.695 E.3494
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.498 Y75.79 E.30335
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.0407
G1 X101.788 Y75.809 E-.06996
G1 X101.989 Y75.877 E-.08043
G1 X102.151 Y75.976 E-.07223
G1 X102.242 Y76.054 E-.04568
G1 X102.423 Y76.311 E-.11929
M73 P82 R2
G1 X102.494 Y76.528 E-.08694
G1 X102.51 Y76.695 E-.06365
G1 X102.51 Y77.172 E-.18112
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.941 Z6.92 F42000
G1 X77.147 Y76.403 Z6.92
G1 Z6.52
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.151 Y76.389 E.0002
G3 X78.405 Y75.41 I1.263 J.326 E.02246
G1 X101.651 Y75.411 E.30522
G3 X102.888 Y76.637 I-.068 J1.306 E.02502
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.299 J-.004 E.02669
G1 X78.405 Y104.59 E.30449
G3 X77.11 Y103.295 I.004 J-1.299 E.02669
G1 X77.11 Y76.705 E.34912
G1 X77.139 Y76.463 E.00321
; WIPE_START
G1 F12000
M204 S6000
G1 X77.151 Y76.389 E-.02842
G1 X77.229 Y76.159 E-.09211
G1 X77.328 Y75.983 E-.07658
G1 X77.488 Y75.788 E-.09617
G1 X77.737 Y75.594 E-.11997
G1 X77.968 Y75.485 E-.09701
G1 X78.134 Y75.438 E-.06559
G1 X78.405 Y75.41 E-.10361
G1 X78.617 Y75.41 E-.08054
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.445 Y81.351 Z6.92 F42000
G1 Z6.52
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.437 Y81.332 E.00024
G3 X79.917 Y80.393 I.633 J-.268 E.01404
G1 X80.053 Y80.376 E.0016
G3 X79.503 Y81.452 I.017 J.687 E.03323
G1 X79.475 Y81.403 E.00066
M204 S250
G1 X79.366 Y80.961 F42000
G1 F1722
M204 S5000
G1 X79.367 Y80.959 E.00003
G3 X80.052 Y80.353 I.702 J.104 E.01161
G1 X80.119 Y80.355 E.00078
G3 X79.361 Y81.1 I-.05 J.708 E.03809
G1 X79.364 Y81.021 E.00093
; WIPE_START
G1 F12000
M204 S6000
G1 X79.367 Y80.959 E-.02365
G1 X79.401 Y80.821 E-.0538
G1 X79.463 Y80.694 E-.05392
G1 X79.548 Y80.581 E-.05379
G1 X79.654 Y80.487 E-.05385
G1 X79.777 Y80.416 E-.05394
G1 X79.912 Y80.371 E-.0539
G1 X80.052 Y80.353 E-.05391
G1 X80.119 Y80.355 E-.02539
G1 X80.363 Y80.416 E-.09546
G1 X80.486 Y80.487 E-.0539
G1 X80.592 Y80.581 E-.0538
G1 X80.678 Y80.694 E-.05393
G1 X80.739 Y80.822 E-.05385
G1 X80.754 Y80.88 E-.02293
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
G1 X101.559 Y75.79 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.0006
G3 X102.51 Y76.695 I-.02 J.925 E.01856
G1 X102.51 Y103.307 E.34942
G3 X101.605 Y104.21 I-.922 J-.019 E.01855
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.015 J-.921 E.01855
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.499 Y75.79 E.30336
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.04027
G1 X101.788 Y75.809 E-.06979
G1 X101.989 Y75.877 E-.08056
G1 X102.151 Y75.975 E-.07205
G1 X102.242 Y76.054 E-.04595
G1 X102.423 Y76.311 E-.11912
G1 X102.494 Y76.528 E-.08692
G1 X102.51 Y76.695 E-.0638
G1 X102.51 Y77.173 E-.18154
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.942 Z7 F42000
G1 X77.148 Y76.406 Z7
G1 Z6.6
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.188 Y76.266 E.00191
G3 X78.405 Y75.41 I1.221 J.443 E.02081
G1 X101.652 Y75.411 E.30523
G3 X102.888 Y76.637 I-.068 J1.306 E.02501
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
M73 P83 R2
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G3 X77.133 Y76.464 I1.299 J.003 E.00319
; WIPE_START
G1 F12000
M204 S6000
G1 X77.188 Y76.266 E-.07812
G1 X77.327 Y75.985 E-.11913
G1 X77.49 Y75.786 E-.0977
G1 X77.738 Y75.593 E-.11935
G1 X77.955 Y75.49 E-.09153
G1 X78.148 Y75.435 E-.07638
G1 X78.405 Y75.41 E-.09811
G1 X78.615 Y75.41 E-.07967
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.448 Y81.361 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.404 Y81.234 E.00157
G3 X79.917 Y80.394 I.665 J-.171 E.01283
G1 X80.053 Y80.376 E.0016
G3 X79.478 Y81.413 I.017 J.687 E.03375
M204 S250
G1 X79.366 Y80.965 F42000
G1 F1722
M204 S5000
G1 X79.366 Y80.959 E.00007
G3 X80.052 Y80.353 I.704 J.105 E.01162
G1 X80.12 Y80.355 E.00079
G3 X79.359 Y81.1 I-.05 J.71 E.03818
G1 X79.363 Y81.025 E.00088
; WIPE_START
G1 F12000
M204 S6000
G1 X79.366 Y80.959 E-.02507
G1 X79.401 Y80.822 E-.05391
G1 X79.462 Y80.694 E-.05384
G1 X79.548 Y80.581 E-.05399
G1 X79.654 Y80.487 E-.05379
G1 X79.777 Y80.416 E-.05386
G1 X79.912 Y80.371 E-.05387
G1 X80.052 Y80.353 E-.05397
G1 X80.12 Y80.355 E-.02558
G1 X80.363 Y80.416 E-.09531
G1 X80.486 Y80.487 E-.05381
G1 X80.592 Y80.581 E-.05393
G1 X80.677 Y80.694 E-.05384
G1 X80.739 Y80.821 E-.05384
G1 X80.753 Y80.876 E-.02141
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
G1 X101.56 Y75.79 F42000
G1 Z6.68
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00059
G3 X102.51 Y76.692 I-.02 J.925 E.01852
G1 X102.51 Y103.305 E.34943
G3 X101.605 Y104.21 I-.922 J-.017 E.01858
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.021 J-.926 E.01852
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.5 Y75.79 E.30338
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.03983
G1 X101.787 Y75.809 E-.06973
G1 X101.989 Y75.877 E-.08072
G1 X102.15 Y75.975 E-.07182
G1 X102.242 Y76.054 E-.0461
G1 X102.423 Y76.311 E-.11926
G1 X102.483 Y76.479 E-.06782
G1 X102.51 Y76.692 E-.08178
G1 X102.51 Y77.174 E-.18293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.944 Z7.08 F42000
G1 X77.148 Y76.409 Z7.08
G1 Z6.68
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.234 Y76.16 E.00345
G3 X78.405 Y75.41 I1.181 J.555 E.01927
G1 X101.653 Y75.411 E.30524
G3 X102.888 Y76.637 I-.069 J1.306 E.025
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.011 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
M73 P84 R2
G3 X77.134 Y76.467 I1.305 J.009 E.00315
; WIPE_START
G1 F12000
M204 S6000
G1 X77.234 Y76.16 E-.12262
G1 X77.328 Y75.983 E-.07604
G1 X77.488 Y75.788 E-.09612
G1 X77.737 Y75.594 E-.11992
G1 X77.968 Y75.485 E-.0971
G1 X78.136 Y75.438 E-.06609
G1 X78.405 Y75.41 E-.10309
G1 X78.613 Y75.41 E-.07903
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.391 Y80.963 Z7.08 F42000
G1 Z6.68
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.396 Y80.929 E.0004
G3 X79.917 Y80.394 I.674 J.135 E.00923
G1 X80.053 Y80.376 E.0016
G3 X79.383 Y81.065 I.017 J.687 E.03801
G1 X79.386 Y81.022 E.0005
M204 S250
G1 X79.427 Y81.37 F42000
G1 F1722
M204 S5000
G1 X79.38 Y81.241 E.00161
G3 X80.053 Y80.353 I.689 J-.176 E.01494
G1 X80.12 Y80.355 E.00079
G3 X79.455 Y81.423 I-.05 J.71 E.0342
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.241 E-.07486
G1 X79.359 Y81.1 E-.05388
G1 X79.366 Y80.959 E-.05383
G1 X79.401 Y80.821 E-.05394
G1 X79.463 Y80.694 E-.05388
G1 X79.548 Y80.581 E-.05382
G1 X79.654 Y80.487 E-.05392
G1 X79.777 Y80.416 E-.05385
G1 X79.912 Y80.371 E-.05386
G1 X80.053 Y80.353 E-.05398
G1 X80.12 Y80.355 E-.0257
G1 X80.363 Y80.416 E-.09509
G1 X80.486 Y80.487 E-.05389
G1 X80.536 Y80.531 E-.0255
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
G1 X101.561 Y75.79 F42000
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00057
G3 X102.51 Y76.695 I-.02 J.925 E.01856
G1 X102.51 Y103.305 E.3494
G3 X101.605 Y104.21 I-.922 J-.017 E.01858
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.021 J-.926 E.01851
G1 X77.49 Y76.695 E.34944
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.501 Y75.79 E.30339
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.03943
G1 X101.787 Y75.809 E-.06956
G1 X101.989 Y75.877 E-.08089
G1 X102.15 Y75.975 E-.07163
G1 X102.242 Y76.054 E-.0462
G1 X102.357 Y76.194 E-.06871
G1 X102.457 Y76.393 E-.08472
G1 X102.492 Y76.52 E-.05004
G1 X102.51 Y76.695 E-.06689
G1 X102.51 Y77.174 E-.18192
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.947 Z7.16 F42000
G1 X77.145 Y76.42 Z7.16
G1 Z6.76
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.151 Y76.389 E.00041
G3 X78.405 Y75.41 I1.264 J.327 E.02246
G1 X101.653 Y75.411 E.30525
G3 X102.888 Y76.637 I-.07 J1.306 E.02499
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G1 X77.137 Y76.479 E.00299
; WIPE_START
G1 F12000
M204 S6000
M73 P85 R2
G1 X77.151 Y76.389 E-.03474
G1 X77.23 Y76.158 E-.09295
G1 X77.328 Y75.983 E-.07584
G1 X77.488 Y75.788 E-.09606
G1 X77.63 Y75.665 E-.07121
G1 X77.904 Y75.509 E-.12
G1 X78.149 Y75.435 E-.09723
G1 X78.405 Y75.41 E-.09788
G1 X78.6 Y75.41 E-.0741
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.391 Y80.967 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.396 Y80.933 E.0004
G3 X79.919 Y80.393 I.675 J.13 E.0093
G1 X80.053 Y80.376 E.00158
G3 X79.383 Y81.065 I.018 J.687 E.03806
G1 X79.386 Y81.027 E.00044
M204 S250
G1 X79.427 Y81.37 F42000
G1 F1722
M204 S5000
G1 X79.381 Y81.24 E.00161
G3 X80.052 Y80.353 I.689 J-.176 E.01493
G1 X80.121 Y80.355 E.0008
G3 X79.456 Y81.423 I-.051 J.71 E.03419
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y81.24 E-.07509
G1 X79.359 Y81.1 E-.05383
G1 X79.366 Y80.959 E-.05385
G1 X79.401 Y80.821 E-.05393
G1 X79.463 Y80.694 E-.05385
G1 X79.548 Y80.581 E-.05384
G1 X79.654 Y80.487 E-.0539
G1 X79.777 Y80.416 E-.05389
G1 X79.912 Y80.371 E-.05386
G1 X80.052 Y80.353 E-.05393
G1 X80.121 Y80.355 E-.02589
G1 X80.363 Y80.416 E-.09499
G1 X80.486 Y80.487 E-.0538
G1 X80.536 Y80.531 E-.02536
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
G1 X101.562 Y75.79 F42000
G1 Z6.84
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00056
G3 X102.51 Y76.695 I-.02 J.925 E.01856
G1 X102.51 Y103.305 E.3494
G3 X101.605 Y104.21 I-.922 J-.016 E.01858
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.021 J-.926 E.01851
G1 X77.49 Y76.695 E.34944
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.502 Y75.79 E.3034
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.03901
G1 X101.786 Y75.809 E-.06936
G1 X101.989 Y75.877 E-.08111
G1 X102.15 Y75.974 E-.07153
G1 X102.242 Y76.054 E-.04633
G1 X102.423 Y76.311 E-.11931
G1 X102.492 Y76.52 E-.08364
G1 X102.51 Y76.695 E-.06694
G1 X102.51 Y77.176 E-.18278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.95 Z7.24 F42000
G1 X77.145 Y76.426 Z7.24
G1 Z6.84
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.19 Y76.267 E.00217
G3 X78.405 Y75.41 I1.226 J.449 E.02078
G1 X101.654 Y75.411 E.30526
G3 X102.888 Y76.637 I-.071 J1.306 E.02498
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.298 J-.005 E.02667
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.005 J-1.298 E.02667
G1 X77.11 Y76.703 E.34916
G3 X77.126 Y76.511 I1.306 J.013 E.00253
G1 X77.132 Y76.484 E.00036
; WIPE_START
G1 F12000
M204 S6000
G1 X77.19 Y76.267 E-.08546
G1 X77.294 Y76.037 E-.09592
G1 X77.488 Y75.788 E-.12007
G1 X77.737 Y75.594 E-.11996
G1 X77.966 Y75.486 E-.09614
G1 X78.147 Y75.435 E-.07133
G1 X78.405 Y75.41 E-.09882
G1 X78.596 Y75.41 E-.0723
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.388 Y80.975 Z7.24 F42000
G1 Z6.84
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.389 Y80.963 E.00014
G3 X79.917 Y80.393 I.681 J.102 E.00964
G1 X80.053 Y80.376 E.0016
G3 X79.382 Y81.097 I.017 J.688 E.03772
G1 X79.385 Y81.035 E.00073
M204 S250
G1 X79.427 Y81.371 F42000
G1 F1722
M204 S5000
G1 X79.382 Y81.24 E.00161
G3 X80.052 Y80.353 I.688 J-.177 E.01492
G1 X80.121 Y80.355 E.0008
G3 X79.457 Y81.422 I-.051 J.708 E.03412
; WIPE_START
G1 F12000
M204 S6000
G1 X79.382 Y81.24 E-.07475
G1 X79.359 Y81.1 E-.05378
G1 X79.366 Y80.959 E-.05388
G1 X79.401 Y80.821 E-.05391
G1 X79.463 Y80.694 E-.05385
G1 X79.548 Y80.581 E-.05383
G1 X79.654 Y80.487 E-.05392
G1 X79.777 Y80.416 E-.05381
G1 X79.911 Y80.371 E-.05384
G1 X80.052 Y80.353 E-.05401
G1 X80.121 Y80.355 E-.02604
G1 X80.363 Y80.416 E-.09478
G1 X80.486 Y80.487 E-.0539
G1 X80.536 Y80.532 E-.02569
; WIPE_END
G1 E-.03999 F1800
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
G1 X101.563 Y75.79 F42000
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.606 Y75.79 E.00056
G3 X102.51 Y76.692 I-.022 J.925 E.01851
G1 X102.51 Y103.305 E.34943
G3 X101.605 Y104.21 I-.921 J-.016 E.01858
G1 X78.395 Y104.21 E.30475
M73 P86 R2
G3 X77.49 Y103.308 I.021 J-.926 E.01851
G1 X77.49 Y76.695 E.34944
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.503 Y75.79 E.30342
; WIPE_START
G1 F12000
M204 S6000
G1 X101.606 Y75.79 E-.03911
G1 X101.819 Y75.816 E-.08152
G1 X101.989 Y75.877 E-.06842
G1 X102.149 Y75.974 E-.07133
G1 X102.242 Y76.055 E-.04658
G1 X102.423 Y76.311 E-.11928
G1 X102.483 Y76.479 E-.06771
G1 X102.51 Y76.692 E-.08186
G1 X102.51 Y77.177 E-.1842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.951 Z7.32 F42000
G1 X77.141 Y76.426 Z7.32
G1 Z6.92
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.188 Y76.266 E.00219
G3 X78.405 Y75.41 I1.221 J.442 E.02082
G1 X101.655 Y75.412 E.30527
G3 X102.888 Y76.637 I-.071 J1.306 E.02497
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G3 X77.129 Y76.485 I1.299 J.003 E.00291
; WIPE_START
G1 F12000
M204 S6000
G1 X77.188 Y76.266 E-.08606
G1 X77.327 Y75.985 E-.11928
G1 X77.49 Y75.786 E-.09777
G1 X77.738 Y75.593 E-.11928
G1 X77.968 Y75.485 E-.0967
G1 X78.138 Y75.437 E-.06703
G1 X78.405 Y75.41 E-.10226
G1 X78.594 Y75.41 E-.07162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.39 Y80.976 Z7.32 F42000
G1 Z6.92
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.39 Y80.96 E.00019
G3 X79.917 Y80.393 I.68 J.104 E.00961
G1 X80.053 Y80.376 E.0016
G3 X79.396 Y81.201 I.017 J.688 E.03648
G1 X79.391 Y81.036 E.00193
M204 S250
G1 X79.427 Y81.37 F42000
G1 F1722
M204 S5000
G1 X79.382 Y81.24 E.00161
G3 X80.052 Y80.353 I.688 J-.177 E.01491
G1 X80.122 Y80.355 E.00081
G3 X79.457 Y81.422 I-.051 J.708 E.03412
; WIPE_START
G1 F12000
M204 S6000
G1 X79.382 Y81.24 E-.07471
G1 X79.359 Y81.1 E-.05376
G1 X79.366 Y80.959 E-.05389
G1 X79.401 Y80.822 E-.05383
G1 X79.463 Y80.694 E-.05388
G1 X79.548 Y80.581 E-.05392
G1 X79.655 Y80.487 E-.05389
G1 X79.777 Y80.416 E-.0538
G1 X79.911 Y80.371 E-.05385
G1 X80.052 Y80.353 E-.05398
G1 X80.122 Y80.355 E-.02626
G1 X80.363 Y80.416 E-.09461
G1 X80.486 Y80.487 E-.05389
G1 X80.536 Y80.532 E-.02575
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
G1 X101.564 Y75.79 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00053
G3 X102.51 Y76.692 I-.02 J.926 E.01852
G1 X102.51 Y103.305 E.34943
G3 X101.605 Y104.21 I-.921 J-.016 E.01858
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.021 J-.926 E.01852
G1 X77.49 Y76.695 E.34943
M73 P87 R2
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.504 Y75.79 E.30343
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.03821
G1 X101.786 Y75.809 E-.06904
G1 X101.989 Y75.877 E-.08146
G1 X102.149 Y75.974 E-.07113
G1 X102.242 Y76.055 E-.04675
G1 X102.423 Y76.311 E-.11917
G1 X102.483 Y76.479 E-.06783
G1 X102.51 Y76.692 E-.08185
G1 X102.51 Y77.178 E-.18457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.955 Z7.4 F42000
G1 X77.143 Y76.438 Z7.4
G1 Z7
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.189 Y76.267 E.00232
G3 X78.405 Y75.41 I1.226 J.448 E.02078
G1 X101.655 Y75.412 E.30528
G3 X102.888 Y76.637 I-.072 J1.306 E.02496
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.298 J-.003 E.0267
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.005 J-1.298 E.02667
G1 X77.11 Y76.703 E.34916
G3 X77.126 Y76.511 I1.305 J.012 E.00253
G1 X77.129 Y76.496 E.0002
; WIPE_START
M73 P87 R1
G1 F12000
M204 S6000
G1 X77.189 Y76.267 E-.09005
G1 X77.326 Y75.985 E-.11915
G1 X77.488 Y75.788 E-.09693
G1 X77.63 Y75.665 E-.07125
G1 X77.904 Y75.509 E-.11981
G1 X78.149 Y75.435 E-.09722
G1 X78.405 Y75.41 E-.0979
G1 X78.584 Y75.41 E-.0677
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.39 Y80.976 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.396 Y80.929 E.00056
G3 X79.948 Y80.387 I.674 J.135 E.0096
G1 X80.055 Y80.377 E.00126
G3 X79.382 Y81.065 I.015 J.687 E.03802
G1 X79.385 Y81.036 E.00034
M204 S250
G1 X79.427 Y81.37 F42000
G1 F1722
M204 S5000
G1 X79.382 Y81.24 E.00161
G3 X80.052 Y80.353 I.688 J-.177 E.01491
G1 X80.122 Y80.355 E.00081
G3 X79.457 Y81.422 I-.052 J.708 E.03411
; WIPE_START
G1 F12000
M204 S6000
G1 X79.382 Y81.24 E-.07469
G1 X79.359 Y81.1 E-.05388
G1 X79.366 Y80.959 E-.05374
G1 X79.401 Y80.822 E-.0539
G1 X79.463 Y80.694 E-.05391
G1 X79.548 Y80.581 E-.0539
G1 X79.654 Y80.487 E-.05381
G1 X79.777 Y80.416 E-.0539
G1 X79.912 Y80.371 E-.05386
G1 X80.052 Y80.353 E-.0539
G1 X80.122 Y80.355 E-.02649
G1 X80.363 Y80.416 E-.09441
G1 X80.486 Y80.487 E-.05385
G1 X80.536 Y80.532 E-.02576
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
G1 X101.565 Y75.79 F42000
G1 Z7.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00052
G3 X102.51 Y76.692 I-.02 J.925 E.01852
G1 X102.51 Y103.308 E.34946
G3 X101.605 Y104.21 I-.921 J-.019 E.01854
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.305 I.021 J-.926 E.01855
G1 X77.49 Y76.695 E.34941
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.505 Y75.79 E.30345
; WIPE_START
M73 P88 R1
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.03781
G1 X101.785 Y75.809 E-.06896
G1 X101.989 Y75.877 E-.08154
G1 X102.149 Y75.974 E-.07096
G1 X102.242 Y76.054 E-.04685
G1 X102.357 Y76.194 E-.06876
G1 X102.456 Y76.391 E-.08379
G1 X102.501 Y76.569 E-.06979
G1 X102.51 Y76.692 E-.04703
G1 X102.51 Y77.178 E-.18452
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.957 Z7.48 F42000
G1 X77.143 Y76.442 Z7.48
G1 Z7.08
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.211 Y76.211 E.00317
G3 X78.406 Y75.41 I1.204 J.504 E.02
G1 X101.656 Y75.412 E.30528
G3 X102.888 Y76.637 I-.073 J1.306 E.02495
G1 X102.89 Y103.295 E.35003
G3 X101.594 Y104.59 I-1.306 J-.01 E.02666
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.003 J-1.299 E.0267
G1 X77.11 Y76.705 E.34913
G3 X77.126 Y76.513 I1.305 J.01 E.00254
G1 X77.129 Y76.501 E.00017
; WIPE_START
G1 F12000
M204 S6000
G1 X77.211 Y76.211 E-.11458
G1 X77.328 Y75.983 E-.09696
G1 X77.488 Y75.788 E-.09618
G1 X77.737 Y75.594 E-.11989
G1 X77.966 Y75.486 E-.09611
G1 X78.146 Y75.435 E-.07118
G1 X78.406 Y75.41 E-.09922
G1 X78.579 Y75.41 E-.06588
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.389 Y80.985 Z7.48 F42000
G1 Z7.08
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.392 Y80.963 E.00027
G3 X79.922 Y80.393 I.68 J.101 E.00967
G1 X80.053 Y80.376 E.00154
G3 X79.392 Y81.167 I.019 J.687 E.03688
G1 X79.39 Y81.045 E.00142
M204 S250
G1 X79.427 Y81.371 F42000
G1 F1722
M204 S5000
G1 X79.379 Y81.241 E.00162
G3 X80.052 Y80.353 I.689 J-.176 E.01496
G1 X80.118 Y80.355 E.00076
G3 X79.454 Y81.424 I-.05 J.71 E.03419
; WIPE_START
G1 F12000
M204 S6000
G1 X79.379 Y81.241 E-.07527
G1 X79.359 Y81.1 E-.05399
G1 X79.366 Y80.959 E-.05374
G1 X79.401 Y80.822 E-.0539
G1 X79.463 Y80.694 E-.05391
G1 X79.548 Y80.581 E-.05386
G1 X79.654 Y80.487 E-.05385
G1 X79.777 Y80.416 E-.0539
G1 X79.912 Y80.371 E-.05388
G1 X80.052 Y80.353 E-.0539
G1 X80.118 Y80.355 E-.02481
G1 X80.363 Y80.416 E-.096
G1 X80.486 Y80.487 E-.05389
G1 X80.535 Y80.531 E-.02509
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
G1 X101.566 Y75.79 F42000
G1 Z7.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.0005
G3 X102.51 Y76.695 I-.02 J.925 E.01856
G1 X102.51 Y103.305 E.34939
G3 X101.605 Y104.21 I-.921 J-.016 E.01858
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.016 J-.921 E.01854
G1 X77.49 Y76.695 E.34944
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.506 Y75.79 E.30346
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.03741
G1 X101.785 Y75.809 E-.06874
G1 X101.989 Y75.877 E-.08169
G1 X102.148 Y75.973 E-.07094
G1 X102.242 Y76.054 E-.04701
G1 X102.423 Y76.311 E-.11914
G1 X102.493 Y76.525 E-.08575
G1 X102.51 Y76.695 E-.06495
G1 X102.51 Y77.18 E-.18437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.959 Z7.56 F42000
G1 X77.137 Y76.443 Z7.56
G1 Z7.16
M73 P89 R1
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.188 Y76.266 E.00241
G3 X78.405 Y75.41 I1.221 J.442 E.02081
G1 X101.657 Y75.412 E.3053
G3 X102.888 Y76.637 I-.074 J1.306 E.02494
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.127 Y76.502 I1.299 J.003 E.00268
; WIPE_START
G1 F12000
M204 S6000
G1 X77.188 Y76.266 E-.09256
G1 X77.326 Y75.985 E-.11915
G1 X77.49 Y75.786 E-.09782
G1 X77.737 Y75.594 E-.11901
G1 X77.965 Y75.486 E-.09607
G1 X78.146 Y75.435 E-.07117
G1 X78.405 Y75.41 E-.09908
G1 X78.577 Y75.41 E-.06513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.39 Y80.984 Z7.56 F42000
G1 Z7.16
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.39 Y80.96 E.00028
G3 X79.917 Y80.393 I.679 J.103 E.0096
G1 X80.053 Y80.376 E.0016
G3 X79.397 Y81.201 I.017 J.687 E.03641
G1 X79.392 Y81.044 E.00184
M204 S250
G1 X79.428 Y81.371 F42000
G1 F1722
M204 S5000
G1 X79.379 Y81.241 E.00163
G3 X80.052 Y80.353 I.689 J-.176 E.01496
G1 X80.118 Y80.355 E.00077
G3 X79.454 Y81.424 I-.05 J.71 E.03418
; WIPE_START
G1 F12000
M204 S6000
G1 X79.379 Y81.241 E-.07544
G1 X79.359 Y81.101 E-.05387
G1 X79.366 Y80.959 E-.05388
G1 X79.401 Y80.821 E-.0539
G1 X79.463 Y80.694 E-.05384
G1 X79.548 Y80.581 E-.05392
G1 X79.654 Y80.487 E-.05385
G1 X79.777 Y80.416 E-.05384
G1 X79.911 Y80.371 E-.05384
G1 X80.052 Y80.353 E-.05397
G1 X80.118 Y80.355 E-.025
G1 X80.363 Y80.416 E-.09582
G1 X80.486 Y80.487 E-.05395
G1 X80.535 Y80.53 E-.02488
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
G1 X101.567 Y75.79 F42000
G1 Z7.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00049
G3 X102.51 Y76.695 I-.021 J.926 E.01856
G1 X102.51 Y103.305 E.3494
G3 X101.605 Y104.21 I-.921 J-.016 E.01858
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.305 I.021 J-.926 E.01855
G1 X77.49 Y76.695 E.34941
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.507 Y75.79 E.30347
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.03705
G1 X101.785 Y75.809 E-.06868
G1 X101.989 Y75.877 E-.0818
G1 X102.148 Y75.973 E-.07071
G1 X102.242 Y76.054 E-.04711
G1 X102.423 Y76.311 E-.11933
G1 X102.492 Y76.52 E-.08364
G1 X102.51 Y76.695 E-.06695
G1 X102.51 Y77.181 E-.18475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.961 Z7.64 F42000
G1 X77.136 Y76.448 Z7.64
G1 Z7.24
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.188 Y76.266 E.00248
G3 X78.405 Y75.41 I1.221 J.442 E.02082
G1 X101.658 Y75.412 E.30531
G3 X102.888 Y76.637 I-.075 J1.306 E.02493
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.299 J-.003 E.0267
G1 X78.405 Y104.59 E.30448
M73 P90 R1
G3 X77.11 Y103.295 I.011 J-1.306 E.02666
G1 X77.11 Y76.705 E.34912
G3 X77.126 Y76.507 I1.299 J.003 E.00261
; WIPE_START
G1 F12000
M204 S6000
G1 X77.188 Y76.266 E-.0945
G1 X77.327 Y75.985 E-.11926
G1 X77.49 Y75.786 E-.09776
G1 X77.737 Y75.594 E-.11915
G1 X77.966 Y75.486 E-.09599
G1 X78.154 Y75.434 E-.07415
G1 X78.405 Y75.41 E-.09602
G1 X78.572 Y75.41 E-.06317
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.39 Y80.987 Z7.64 F42000
G1 Z7.24
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.39 Y80.96 E.00031
G3 X79.917 Y80.393 I.68 J.104 E.0096
G1 X80.053 Y80.376 E.0016
G3 X79.396 Y81.201 I.017 J.687 E.03644
G1 X79.392 Y81.046 E.00181
M204 S250
G1 X79.428 Y81.371 F42000
G1 F1722
M204 S5000
G1 X79.379 Y81.241 E.00163
G3 X80.052 Y80.353 I.689 J-.176 E.01495
G1 X80.119 Y80.355 E.00078
G3 X79.455 Y81.425 I-.05 J.71 E.03417
; WIPE_START
G1 F12000
M204 S6000
G1 X79.379 Y81.241 E-.07559
G1 X79.359 Y81.1 E-.05392
G1 X79.366 Y80.959 E-.0539
G1 X79.401 Y80.821 E-.05382
G1 X79.463 Y80.694 E-.05384
G1 X79.548 Y80.581 E-.05382
G1 X79.654 Y80.487 E-.05392
G1 X79.777 Y80.416 E-.05381
G1 X79.911 Y80.371 E-.0539
G1 X80.052 Y80.353 E-.05393
G1 X80.119 Y80.355 E-.02522
G1 X80.363 Y80.416 E-.09564
G1 X80.486 Y80.487 E-.05392
G1 X80.535 Y80.53 E-.02476
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
G1 X101.568 Y75.79 F42000
G1 Z7.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00048
G3 X102.51 Y76.692 I-.021 J.926 E.01852
G1 X102.51 Y103.305 E.34943
G3 X101.605 Y104.21 I-.921 J-.016 E.01858
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.305 I.016 J-.921 E.01857
G1 X77.49 Y76.695 E.34941
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.508 Y75.79 E.30348
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.03666
G1 X101.784 Y75.809 E-.06847
G1 X101.989 Y75.877 E-.08204
G1 X102.148 Y75.973 E-.0705
G1 X102.242 Y76.054 E-.04735
G1 X102.423 Y76.311 E-.11924
G1 X102.483 Y76.479 E-.06784
G1 X102.51 Y76.692 E-.08179
G1 X102.51 Y77.182 E-.1861
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.966 Z7.72 F42000
G1 X77.134 Y76.463 Z7.72
G1 Z7.32
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.136 Y76.449 E.00019
G3 X78.405 Y75.41 I1.272 J.26 E.02331
G1 X101.658 Y75.412 E.30532
G3 X102.888 Y76.637 I-.075 J1.306 E.02492
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.306 J-.013 E.02663
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
M73 P91 R1
G1 X77.128 Y76.522 E.00242
; WIPE_START
G1 F12000
M204 S6000
G1 X77.136 Y76.449 E-.02817
G1 X77.207 Y76.209 E-.09506
G1 X77.328 Y75.983 E-.09706
G1 X77.49 Y75.786 E-.0971
G1 X77.737 Y75.594 E-.11899
G1 X77.904 Y75.509 E-.0712
G1 X78.149 Y75.435 E-.09713
G1 X78.405 Y75.41 E-.09799
G1 X78.556 Y75.41 E-.0573
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.39 Y80.989 Z7.72 F42000
G1 Z7.32
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.39 Y80.96 E.00034
G3 X79.917 Y80.394 I.68 J.105 E.0096
G1 X80.053 Y80.376 E.0016
G3 X79.395 Y81.201 I.017 J.688 E.03651
G1 X79.392 Y81.049 E.00178
M204 S250
G1 X79.428 Y81.372 F42000
G1 F1722
M204 S5000
G1 X79.379 Y81.241 E.00163
G3 X80.052 Y80.353 I.689 J-.176 E.01495
G1 X80.119 Y80.355 E.00078
G3 X79.455 Y81.425 I-.051 J.71 E.03417
; WIPE_START
G1 F12000
M204 S6000
G1 X79.379 Y81.241 E-.0756
G1 X79.359 Y81.101 E-.0539
G1 X79.366 Y80.959 E-.05391
G1 X79.401 Y80.821 E-.0539
G1 X79.463 Y80.694 E-.05384
G1 X79.548 Y80.581 E-.0539
G1 X79.654 Y80.487 E-.05382
G1 X79.777 Y80.416 E-.05385
G1 X79.912 Y80.371 E-.05389
G1 X80.052 Y80.353 E-.0539
G1 X80.119 Y80.355 E-.02534
G1 X80.363 Y80.416 E-.09556
G1 X80.486 Y80.487 E-.05382
G1 X80.534 Y80.53 E-.02477
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
G1 X101.569 Y75.79 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1722
M204 S5000
G1 X101.605 Y75.79 E.00047
G3 X102.51 Y76.692 I-.02 J.926 E.01852
G1 X102.51 Y103.305 E.34943
G3 X101.605 Y104.21 I-.921 J-.016 E.01858
G1 X78.395 Y104.21 E.30475
G3 X77.49 Y103.308 I.021 J-.926 E.01851
G1 X77.49 Y76.695 E.34944
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.509 Y75.79 E.3035
; WIPE_START
G1 F12000
M204 S6000
G1 X101.605 Y75.79 E-.03632
G1 X101.784 Y75.808 E-.06836
G1 X101.989 Y75.877 E-.08212
G1 X102.147 Y75.973 E-.07038
G1 X102.242 Y76.054 E-.04738
G1 X102.357 Y76.194 E-.06885
G1 X102.456 Y76.391 E-.08373
G1 X102.501 Y76.569 E-.06974
G1 X102.51 Y76.692 E-.0471
G1 X102.51 Y77.182 E-.18602
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.881 Y76.967 Z7.8 F42000
G1 X77.133 Y76.468 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F1722
M204 S5000
G1 X77.137 Y76.453 E.0002
G3 X78.405 Y75.41 I1.279 J.262 E.02332
G1 X101.659 Y75.412 E.30533
G3 X102.888 Y76.637 I-.076 J1.306 E.02492
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.299 J-.006 E.02667
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G1 X77.127 Y76.528 E.00234
; WIPE_START
G1 F12000
M204 S6000
M73 P92 R1
G1 X77.137 Y76.453 E-.02866
G1 X77.186 Y76.266 E-.0736
G1 X77.326 Y75.985 E-.1192
G1 X77.488 Y75.788 E-.09696
G1 X77.63 Y75.665 E-.0713
G1 X77.904 Y75.509 E-.11981
G1 X78.149 Y75.435 E-.09723
G1 X78.405 Y75.41 E-.09792
G1 X78.551 Y75.41 E-.05531
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.387 Y80.994 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1722
M204 S5000
G1 X79.393 Y80.963 E.00036
G3 X79.922 Y80.393 I.68 J.1 E.00966
G1 X80.053 Y80.376 E.00154
G3 X79.386 Y81.099 I.019 J.687 E.03763
G1 X79.387 Y81.054 E.00053
M204 S250
G1 X79.428 Y81.372 F42000
G1 F1722
M204 S5000
G1 X79.379 Y81.241 E.00163
G3 X80.052 Y80.353 I.689 J-.176 E.01495
G1 X80.12 Y80.355 E.00079
G3 X79.455 Y81.425 I-.051 J.71 E.03416
; WIPE_START
G1 F12000
M204 S6000
G1 X79.379 Y81.241 E-.07568
G1 X79.359 Y81.1 E-.05393
G1 X79.366 Y80.959 E-.0538
G1 X79.401 Y80.822 E-.0539
G1 X79.463 Y80.694 E-.05388
G1 X79.548 Y80.581 E-.05387
G1 X79.654 Y80.487 E-.05382
G1 X79.777 Y80.416 E-.05392
G1 X79.912 Y80.371 E-.05386
G1 X80.052 Y80.353 E-.0539
G1 X80.12 Y80.355 E-.02559
G1 X80.363 Y80.416 E-.0953
G1 X80.486 Y80.487 E-.0539
G1 X80.534 Y80.53 E-.02466
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
G1 X101.831 Y75.824 F42000
G1 Z7.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2025
M204 S5000
G1 X101.988 Y75.879 E.00218
G3 X102.509 Y76.653 I-.393 J.827 E.01286
G1 X102.51 Y77.76 E.01454
G1 X102.51 Y78.16 E.00525
G1 X102.51 Y78.56 E.00525
G1 X102.51 Y78.96 E.00525
G1 F747.53
G1 X102.469 Y78.96 E.00054
M106 S255
G1 F600
G1 X102.1 Y78.96 E.00485
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y78.96 E.00832
G1 X101.51 Y80.04 E.01524
G1 X102.1 Y80.04 E.00832
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y80.04 E.00485
M106 S201.45
G1 F747.227
G1 X102.51 Y80.04 E.00054
G1 F2025
G1 X102.51 Y80.44 E.00525
G1 X102.51 Y80.84 E.00525
G1 X102.51 Y81.24 E.00525
G1 X102.51 Y96.76 E.20378
G1 X102.51 Y97.16 E.00525
G1 X102.51 Y97.56 E.00525
G1 X102.51 Y97.96 E.00525
G1 F747.227
G1 X102.469 Y97.96 E.00054
M106 S255
G1 F600
G1 X102.1 Y97.96 E.00485
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y97.96 E.00832
G1 X101.51 Y99.04 E.01524
G1 X102.1 Y99.04 E.00832
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y99.04 E.00485
M106 S201.45
G1 F747.379
G1 X102.51 Y99.04 E.00054
G1 F2025
G1 X102.51 Y99.44 E.00525
G1 X102.51 Y99.84 E.00525
G1 X102.51 Y100.24 E.00525
G1 X102.509 Y103.345 E.04076
G3 X101.605 Y104.21 I-.92 J-.056 E.01807
G1 X82.74 Y104.21 E.2477
G1 X82.34 Y104.21 E.00525
G1 X81.94 Y104.21 E.00525
G1 X81.54 Y104.21 E.00525
G1 F747.227
G1 X81.54 Y104.169 E.00054
M106 S255
G1 F600
G1 X81.54 Y103.8 E.00485
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X81.54 Y103.01 E.01115
G1 X80.46 Y103.01 E.01524
G1 X80.46 Y103.8 E.01115
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X80.46 Y104.169 E.00485
M106 S201.45
G1 F747.227
G1 X80.46 Y104.21 E.00054
G1 F2025
G1 X80.06 Y104.21 E.00525
G1 X79.66 Y104.21 E.00525
G1 X79.26 Y104.21 E.00525
G1 X78.395 Y104.21 E.01136
G3 X77.49 Y103.308 I.007 J-.912 E.01858
G1 X77.49 Y86.24 E.22411
G1 X77.49 Y85.84 E.00525
G1 X77.49 Y85.44 E.00525
G1 X77.49 Y85.04 E.00525
G1 F747.227
G1 X77.531 Y85.04 E.00054
M106 S255
G1 F600
G1 X77.9 Y85.04 E.00485
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X78.49 Y85.04 E.00832
G1 X78.49 Y83.96 E.01524
G1 X77.9 Y83.96 E.00832
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X77.531 Y83.96 E.00485
M106 S201.45
G1 F747.227
G1 X77.49 Y83.96 E.00054
G1 F2025
G1 X77.49 Y83.56 E.00525
G1 X77.49 Y83.16 E.00525
G1 X77.49 Y82.76 E.00525
G1 X77.49 Y76.695 E.07964
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.605 Y75.79 E.30475
G3 X101.774 Y75.808 I-.01 J.916 E.00223
; WIPE_START
G1 F12000
M204 S6000
G1 X101.988 Y75.879 E-.08589
G1 X102.147 Y75.972 E-.07012
G1 X102.242 Y76.054 E-.04764
G1 X102.423 Y76.311 E-.11927
G1 X102.493 Y76.523 E-.08478
G1 X102.509 Y76.653 E-.04992
G1 X102.509 Y77.449 E-.30238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.883 Y77.155 Z7.88 F42000
G1 X77.132 Y76.473 Z7.88
G1 Z7.48
G1 E.8 F1800
G1 F2025
M204 S5000
G1 X77.136 Y76.452 E.00028
G3 X78.405 Y75.41 I1.273 J.257 E.02335
G1 X101.66 Y75.412 E.30534
G3 X102.888 Y76.637 I-.077 J1.306 E.02491
G1 X102.89 Y103.297 E.35006
G3 X101.595 Y104.59 I-1.299 J-.006 E.02667
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.003 J-1.299 E.0267
G1 X77.11 Y76.705 E.34912
G1 X77.127 Y76.533 E.00228
; WIPE_START
G1 F12000
M204 S6000
G1 X77.136 Y76.452 E-.03091
G1 X77.186 Y76.265 E-.07335
G1 X77.326 Y75.985 E-.11917
G1 X77.49 Y75.786 E-.09791
G1 X77.737 Y75.594 E-.11897
G1 X77.968 Y75.485 E-.09716
G1 X78.142 Y75.436 E-.06875
G1 X78.405 Y75.41 E-.10041
G1 X78.546 Y75.41 E-.05338
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.39 Y80.994 Z7.88 F42000
G1 Z7.48
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F2025
M204 S5000
G1 X79.39 Y80.96 E.0004
G3 X79.917 Y80.393 I.68 J.104 E.0096
G1 X80.053 Y80.376 E.0016
G3 X79.396 Y81.201 I.017 J.688 E.03647
G1 X79.392 Y81.054 E.00172
M204 S250
G1 X79.428 Y81.372 F42000
G1 F2025
M204 S5000
G1 X79.379 Y81.241 E.00164
G3 X80.052 Y80.353 I.689 J-.176 E.01495
G1 X80.12 Y80.355 E.00079
G3 X79.455 Y81.425 I-.051 J.71 E.03415
; WIPE_START
G1 F12000
M204 S6000
G1 X79.379 Y81.241 E-.07585
G1 X79.359 Y81.1 E-.05393
G1 X79.366 Y80.959 E-.05386
G1 X79.401 Y80.821 E-.05388
G1 X79.463 Y80.694 E-.05386
G1 X79.548 Y80.581 E-.05381
G1 X79.654 Y80.487 E-.05392
G1 X79.777 Y80.416 E-.05391
G1 X79.912 Y80.371 E-.05385
G1 X80.052 Y80.353 E-.05385
G1 X80.12 Y80.355 E-.02579
G1 X80.363 Y80.416 E-.09514
G1 X80.486 Y80.487 E-.05385
G1 X80.534 Y80.53 E-.0245
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
G1 X101.51 Y78.96 F42000
G1 Z7.56
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F1788
M204 S5000
G1 X101.51 Y80.04 E.01418
G1 X102.51 Y80.04 E.01313
G1 X102.51 Y97.96 E.23529
G1 X101.51 Y97.96 E.01313
G1 X101.51 Y99.04 E.01418
M73 P93 R1
G1 X102.51 Y99.04 E.01313
G1 X102.509 Y103.345 E.05652
G3 X101.605 Y104.21 I-.92 J-.056 E.01806
G1 X81.54 Y104.21 E.26346
G1 X81.54 Y103.01 E.01576
G1 X80.46 Y103.01 E.01418
G1 X80.46 Y104.21 E.01576
G1 X78.395 Y104.21 E.02711
G3 X77.49 Y103.305 I.007 J-.912 E.01862
G1 X77.49 Y85.04 E.23983
G1 X78.49 Y85.04 E.01313
G1 X78.49 Y83.96 E.01418
G1 X77.49 Y83.96 E.01313
G1 X77.49 Y76.695 E.0954
G3 X78.395 Y75.79 I.92 J.016 E.01858
G1 X101.605 Y75.79 E.30475
G3 X102.509 Y76.653 I-.008 J.913 E.01807
G1 X102.51 Y78.96 E.0303
G1 X101.57 Y78.96 E.01234
; WIPE_START
G1 F12000
M204 S6000
G1 X101.51 Y80.04 E-.41104
G1 X102.428 Y80.04 E-.34896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I.17 J-1.205 P1  F42000
G1 X77.132 Y76.478 Z7.96
G1 Z7.56
G1 E.8 F1800
G1 F1788
M204 S5000
G1 X77.136 Y76.451 E.00035
G3 X78.405 Y75.41 I1.273 J.257 E.02334
G1 X101.66 Y75.412 E.30535
G3 X102.888 Y76.637 I-.078 J1.306 E.0249
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G1 X77.126 Y76.538 E.00221
; WIPE_START
G1 F12000
M204 S6000
G1 X77.136 Y76.451 E-.033
G1 X77.186 Y76.266 E-.07303
G1 X77.326 Y75.985 E-.11927
G1 X77.49 Y75.786 E-.09782
G1 X77.737 Y75.594 E-.11908
G1 X77.966 Y75.486 E-.09611
G1 X78.151 Y75.435 E-.0731
G1 X78.405 Y75.41 E-.0971
G1 X78.541 Y75.41 E-.0515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.389 Y80.988 Z7.96 F42000
G1 Z7.56
G1 E.8 F1800
; LINE_WIDTH: 0.375679
G1 F1788
M204 S5000
G1 X79.398 Y80.929 E.00069
G3 X79.922 Y80.393 I.674 J.135 E.00926
G1 X80.053 Y80.376 E.00154
G3 X79.385 Y81.065 I.02 J.687 E.03808
G1 X79.386 Y81.047 E.0002
M204 S250
G1 X79.428 Y81.372 F42000
G1 F1788
M204 S5000
G1 X79.379 Y81.241 E.00164
G3 X80.052 Y80.353 I.689 J-.176 E.01495
G1 X80.12 Y80.355 E.0008
G3 X79.456 Y81.425 I-.052 J.71 E.03415
; WIPE_START
G1 F12000
M204 S6000
G1 X79.379 Y81.241 E-.07587
G1 X79.359 Y81.1 E-.05393
G1 X79.366 Y80.959 E-.05372
G1 X79.401 Y80.821 E-.05397
G1 X79.463 Y80.694 E-.05391
G1 X79.548 Y80.581 E-.05389
G1 X79.654 Y80.487 E-.05377
G1 X79.777 Y80.416 E-.05385
G1 X79.912 Y80.371 E-.05395
G1 X80.052 Y80.353 E-.05383
G1 X80.12 Y80.355 E-.02595
G1 X80.363 Y80.416 E-.09492
G1 X80.486 Y80.487 E-.05391
G1 X80.534 Y80.53 E-.02453
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
G1 X101.51 Y78.96 F42000
G1 Z7.64
G1 E.8 F1800
; LINE_WIDTH: 0.42
M73 P93 R0
G1 F1705
M204 S5000
G1 X101.51 Y80.04 E.01418
G1 X102.51 Y80.04 E.01313
G1 X102.51 Y97.96 E.23529
G1 X101.51 Y97.96 E.01313
G1 X101.51 Y99.04 E.01418
G1 X102.51 Y99.04 E.01313
G1 X102.509 Y103.345 E.05652
G3 X101.605 Y104.21 I-.92 J-.056 E.01806
G1 X81.54 Y104.21 E.26346
G1 X81.54 Y103.01 E.01576
G1 X80.46 Y103.01 E.01418
M73 P94 R0
G1 X80.46 Y104.21 E.01576
G1 X78.395 Y104.21 E.02711
G3 X77.49 Y103.308 I.007 J-.912 E.01859
G1 X77.49 Y85.04 E.23986
G1 X78.49 Y85.04 E.01313
G1 X78.49 Y83.96 E.01418
G1 X77.49 Y83.96 E.01313
G1 X77.49 Y76.695 E.09539
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.606 Y75.79 E.30476
G3 X102.509 Y76.653 I-.011 J.916 E.01805
G1 X102.51 Y78.96 E.0303
G1 X101.57 Y78.96 E.01234
; WIPE_START
G1 F12000
M204 S6000
G1 X101.51 Y80.04 E-.41104
G1 X102.428 Y80.04 E-.34896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.04 I.17 J-1.205 P1  F42000
G1 X77.138 Y76.477 Z8.04
G1 Z7.64
G1 E.8 F1800
G1 F1705
M204 S5000
G1 X77.15 Y76.389 E.00116
G3 X78.405 Y75.41 I1.259 J.319 E.0225
G1 X101.661 Y75.412 E.30536
G3 X102.888 Y76.637 I-.078 J1.306 E.02489
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.403 Y104.59 E.30451
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y76.705 E.34912
G1 X77.13 Y76.536 E.00224
; WIPE_START
G1 F12000
M204 S6000
G1 X77.15 Y76.389 E-.05635
G1 X77.234 Y76.149 E-.09689
G1 X77.326 Y75.985 E-.07133
G1 X77.53 Y75.748 E-.119
G1 X77.737 Y75.594 E-.09785
G1 X77.904 Y75.509 E-.07117
G1 X78.149 Y75.435 E-.09716
G1 X78.405 Y75.41 E-.09795
G1 X78.543 Y75.41 E-.0523
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
G1 X101.51 Y78.96 F42000
G1 Z7.72
G1 E.8 F1800
G1 F1865
M204 S5000
G1 X101.51 Y80.04 E.01418
G1 X102.51 Y80.04 E.01313
G1 X102.51 Y97.96 E.23529
G1 X101.51 Y97.96 E.01313
G1 X101.51 Y99.04 E.01418
G1 X102.51 Y99.04 E.01313
G1 X102.509 Y103.345 E.05652
G3 X101.605 Y104.21 I-.92 J-.056 E.01806
G1 X81.54 Y104.21 E.26346
G1 X81.54 Y103.01 E.01576
G1 X80.46 Y103.01 E.01418
G1 X80.46 Y104.21 E.01576
G1 X78.395 Y104.21 E.02711
G3 X77.49 Y103.308 I.007 J-.912 E.01859
G1 X77.49 Y85.04 E.23986
G1 X78.49 Y85.04 E.01313
G1 X78.49 Y83.96 E.01418
G1 X77.49 Y83.96 E.01313
G1 X77.49 Y76.695 E.09539
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.606 Y75.79 E.30477
M73 P95 R0
G3 X102.509 Y76.653 I-.008 J.913 E.01806
G1 X102.51 Y78.96 E.03029
G1 X101.57 Y78.96 E.01234
; WIPE_START
G1 F12000
M204 S6000
G1 X101.51 Y80.04 E-.41104
G1 X102.428 Y80.04 E-.34896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I.169 J-1.205 P1  F42000
G1 X77.131 Y76.488 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1865
M204 S5000
G1 X77.136 Y76.45 E.0005
G3 X78.405 Y75.41 I1.273 J.259 E.02332
G1 X101.662 Y75.412 E.30537
G3 X102.888 Y76.637 I-.079 J1.306 E.02488
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.306 J-.01 E.02666
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.003 J-1.299 E.0267
G1 X77.11 Y76.705 E.34912
G1 X77.125 Y76.548 E.00208
; WIPE_START
G1 F12000
M204 S6000
G1 X77.136 Y76.45 E-.03735
G1 X77.186 Y76.265 E-.0726
G1 X77.295 Y76.035 E-.09691
G1 X77.49 Y75.786 E-.12017
G1 X77.737 Y75.594 E-.11909
G1 X77.904 Y75.509 E-.0711
G1 X78.148 Y75.435 E-.09699
G1 X78.405 Y75.41 E-.09808
G1 X78.531 Y75.41 E-.0477
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

G1 X77.806 Y84.818
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
G1 F1865
M204 S2000
G1 X78.268 Y84.356 E.00859
G1 X77.873 Y84.182
G1 X77.332 Y84.723 E.01006
; WIPE_START
G1 F12000
M204 S6000
G1 X77.873 Y84.182 E-.31436
G1 X78.268 Y84.356 E-.17728
G1 X77.806 Y84.818 E-.26836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.215 Y92.32 Z8.12 F42000
G1 X81.318 Y103.524 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F1865
M204 S2000
G1 X80.682 Y104.161 E.01183
M204 S10000
G1 X81.339 Y104.339 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.117185
G1 F1865
M204 S6000
G1 X80.661 Y104.339 E.00221
; WIPE_START
G1 F18000
G1 X81.339 Y104.339 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I1.217 J0 P1  F42000
G1 X81.339 Y103.536 Z8.12
G1 Z7.72
G1 E.8 F1800
; LINE_WIDTH: 0.212887
G1 F1865
M204 S6000
G1 X81.241 Y103.309 E.00158
G1 X80.661 Y103.318 E.0037
; WIPE_START
G1 F18000
G1 X81.241 Y103.309 E-.53296
G1 X81.339 Y103.536 E-.22704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I.297 J1.18 P1  F42000
G1 X102.612 Y98.182 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1865
M204 S2000
G1 X101.975 Y98.818 E.01183
M204 S10000
G1 X101.782 Y98.161 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.16129
G1 F1865
M204 S6000
G1 X101.782 Y98.726 E.00265
G1 X101.829 Y98.839 E.00057
; WIPE_START
G1 F18000
G1 X101.782 Y98.726 E-.13475
G1 X101.782 Y98.161 E-.62525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I1.217 J.026 P1  F42000
G1 X102.175 Y79.818 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1865
M204 S2000
G1 X102.667 Y79.327 E.00913
G1 X102.243 Y79.182
G1 X101.732 Y79.693 E.00949
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F12000
M204 S6000
G1 X102.243 Y79.182 E-.29434
G1 X102.667 Y79.327 E-.18263
G1 X102.175 Y79.818 E-.28303
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/99
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.12 I-1.217 J-.009 P1  F42000
G1 X101.987 Y104.118 Z8.12
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1647
M204 S5000
G3 X101.605 Y104.21 I-.403 J-.834 E.00519
G1 X78.392 Y104.21 E.30479
G3 X77.49 Y103.308 I.018 J-.921 E.01851
G1 X77.49 Y76.695 E.34943
G3 X78.395 Y75.79 I.92 J.015 E.01858
G1 X101.605 Y75.79 E.30475
G3 X102.51 Y76.692 I-.021 J.926 E.01852
G1 X102.51 Y103.305 E.34943
G3 X102.04 Y104.09 I-.926 J-.021 E.01257
; WIPE_START
G1 F12000
M204 S6000
M73 P96 R0
G1 X101.781 Y104.192 E-.10588
G1 X101.605 Y104.21 E-.06705
G1 X100.06 Y104.21 E-.58707
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.195 Y98.329 Z8.2 F42000
G1 X77.131 Y76.492 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F1647
M204 S5000
G1 X77.136 Y76.449 E.00058
G3 X78.405 Y75.41 I1.272 J.26 E.0233
G1 X101.663 Y75.412 E.30538
G3 X102.888 Y76.637 I-.08 J1.306 E.02487
G1 X102.89 Y103.295 E.35003
G3 X101.595 Y104.59 I-1.299 J-.003 E.0267
G1 X78.405 Y104.59 E.30448
G3 X77.11 Y103.295 I.01 J-1.306 E.02666
G1 X77.11 Y76.705 E.34913
G1 X77.125 Y76.552 E.00203
; WIPE_START
G1 F12000
M204 S6000
G1 X77.136 Y76.449 E-.03944
G1 X77.185 Y76.268 E-.07123
G1 X77.328 Y75.984 E-.1208
G1 X77.49 Y75.786 E-.09713
G1 X77.737 Y75.594 E-.11907
G1 X77.904 Y75.509 E-.07108
G1 X78.148 Y75.435 E-.09706
G1 X78.405 Y75.41 E-.09804
G1 X78.527 Y75.41 E-.04615
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
G1 X102.438 Y103.647 F42000
G1 Z7.88
G1 E.8 F1800
G1 F1200
M204 S5000
G2 X102.509 Y103.345 I-.849 J-.359 E.0041
G1 X102.51 Y101.01 E.03066
G1 X102.89 Y101.01 E.00499
G1 X102.89 Y103.295 E.03
G3 X101.666 Y104.588 I-1.299 J-.004 E.02577
G1 X99.31 Y104.59 E.03093
G1 X99.31 Y104.21 E.00499
G1 X101.605 Y104.21 E.03014
G2 X102.413 Y103.702 I-.016 J-.922 E.01317
; WIPE_START
G1 F12000
M204 S6000
G1 X102.482 Y103.524 E-.07265
G1 X102.509 Y103.345 E-.06875
G1 X102.51 Y101.717 E-.6186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.927 Y102.583 Z8.28 F42000
G1 X80.69 Y104.21 Z8.28
G1 Z7.88
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X80.69 Y104.59 E.00499
G1 X78.405 Y104.59 E.03
G3 X77.11 Y103.295 I.003 J-1.299 E.0267
G1 X77.11 Y101.01 E.03
G1 X77.49 Y101.01 E.00499
G1 X77.49 Y103.305 E.03014
G2 X78.395 Y104.21 I.921 J-.016 E.01858
G1 X80.63 Y104.21 E.02935
; WIPE_START
G1 F12000
M204 S6000
G1 X80.69 Y104.59 E-.14619
G1 X79.075 Y104.59 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.553 Y96.975 Z8.28 F42000
G1 X77.144 Y76.428 Z8.28
G1 Z7.88
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X77.149 Y76.387 E.00055
G3 X78.405 Y75.41 I1.252 J.315 E.02251
G1 X80.69 Y75.41 E.03
G1 X80.69 Y75.79 E.00499
G1 X78.355 Y75.791 E.03065
G2 X77.49 Y76.695 I.056 J.92 E.01806
G1 X77.49 Y78.99 E.03014
G1 X77.11 Y78.99 E.00499
G1 X77.11 Y76.705 E.03
G1 X77.137 Y76.487 E.00288
; WIPE_START
G1 F12000
M204 S6000
G1 X77.149 Y76.387 E-.0386
G1 X77.234 Y76.149 E-.09606
G1 X77.364 Y75.932 E-.09603
G1 X77.534 Y75.744 E-.09614
G1 X77.739 Y75.592 E-.09704
G1 X77.907 Y75.508 E-.07118
G1 X78.146 Y75.435 E-.09514
G1 X78.405 Y75.41 E-.09893
G1 X78.592 Y75.41 E-.07089
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.14 Y76.54 Z8.28 F42000
G1 X102.51 Y78.99 Z8.28
G1 Z7.88
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X102.51 Y76.695 E.03013
G2 X101.647 Y75.791 I-.922 J.016 E.01803
G1 X99.31 Y75.79 E.03069
G1 X99.31 Y75.41 E.00499
G1 X101.663 Y75.412 E.0309
G3 X102.888 Y76.634 I-.073 J1.298 E.02486
G1 X102.89 Y78.99 E.03093
G1 X102.57 Y78.99 E.0042
; WIPE_START
G1 F12000
M204 S6000
G1 X102.518 Y76.991 E-.76
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
G1 X101.947 Y104.138 F42000
G1 Z7.96
G1 E.8 F1800
G1 F1200
M204 S5000
G2 X102.509 Y103.347 I-.358 J-.85 E.01341
G1 X102.51 Y101.01 E.03069
G1 X102.89 Y101.01 E.00499
G1 X102.89 Y103.295 E.03
G3 X101.666 Y104.588 I-1.299 J-.004 E.02577
M73 P97 R0
G1 X99.31 Y104.59 E.03093
G1 X99.31 Y104.21 E.00499
G1 X101.605 Y104.21 E.03013
G2 X101.891 Y104.159 I-.016 J-.922 E.00383
; WIPE_START
G1 F12000
M204 S6000
G1 X102.106 Y104.057 E-.09037
G1 X102.244 Y103.944 E-.06783
G1 X102.423 Y103.689 E-.11827
G1 X102.493 Y103.478 E-.08469
G1 X102.509 Y103.347 E-.04989
G1 X102.509 Y102.429 E-.34895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.902 Y103.05 Z8.36 F42000
G1 X80.69 Y104.21 Z8.36
G1 Z7.96
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X80.69 Y104.59 E.00499
G1 X78.405 Y104.59 E.03
G3 X77.11 Y103.295 I-.001 J-1.294 E.02673
G1 X77.11 Y101.01 E.03
G1 X77.49 Y101.01 E.00499
G1 X77.49 Y103.305 E.03014
G2 X78.395 Y104.21 I.921 J-.016 E.01858
G1 X80.63 Y104.21 E.02935
; WIPE_START
G1 F12000
M204 S6000
G1 X80.69 Y104.59 E-.14619
G1 X79.075 Y104.59 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.651 Y96.969 Z8.36 F42000
G1 X77.514 Y76.499 Z8.36
G1 Z7.96
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X77.509 Y76.523 E.00031
G2 X77.49 Y76.695 I.903 J.188 E.00227
G1 X77.49 Y78.99 E.03014
G1 X77.11 Y78.99 E.00499
G1 X77.11 Y76.705 E.03
G3 X78.405 Y75.41 I1.294 J-.001 E.02672
G1 X80.69 Y75.41 E.03
G1 X80.69 Y75.79 E.00499
G1 X78.353 Y75.791 E.03069
G2 X77.562 Y76.353 I.059 J.92 E.01341
G1 X77.533 Y76.442 E.00124
; WIPE_START
G1 F12000
M204 S6000
G1 X77.509 Y76.523 E-.03186
G1 X77.49 Y76.695 E-.06565
G1 X77.49 Y78.438 E-.66249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.121 Y78.606 Z8.36 F42000
G1 X102.51 Y78.99 Z8.36
G1 Z7.96
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X102.51 Y76.695 E.03013
G2 X101.647 Y75.791 I-.922 J.016 E.01803
G1 X99.31 Y75.79 E.03069
G1 X99.31 Y75.41 E.00499
G1 X101.664 Y75.412 E.03091
G3 X102.888 Y76.637 I-.073 J1.298 E.02489
G1 X102.89 Y78.99 E.0309
G1 X102.57 Y78.99 E.0042
; WIPE_START
G1 F12000
M204 S6000
G1 X102.518 Y76.991 E-.76
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
G1 X102.401 Y103.725 F42000
G1 Z8.04
G1 E.8 F1800
G1 F1200
M204 S5000
G2 X102.509 Y103.347 I-.812 J-.437 E.0052
G1 X102.51 Y101.01 E.03069
G1 X102.89 Y101.01 E.00499
G1 X102.89 Y103.295 E.03
G3 X101.666 Y104.588 I-1.3 J-.004 E.02576
G1 X99.31 Y104.59 E.03093
G1 X99.31 Y104.21 E.00499
G1 X101.605 Y104.21 E.03014
G2 X102.371 Y103.777 I-.016 J-.922 E.01204
; WIPE_START
G1 F12000
M204 S6000
G1 X102.457 Y103.607 E-.07264
G1 X102.509 Y103.347 E-.10051
G1 X102.51 Y101.803 E-.58685
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.923 Y102.64 Z8.44 F42000
G1 X80.69 Y104.21 Z8.44
G1 Z8.04
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X80.69 Y104.59 E.00499
G1 X78.403 Y104.59 E.03003
G3 X77.11 Y103.295 I.013 J-1.306 E.02663
G1 X77.11 Y101.01 E.03
G1 X77.49 Y101.01 E.00499
G1 X77.49 Y103.307 E.03017
G2 X78.395 Y104.21 I.926 J-.024 E.01852
G1 X80.63 Y104.21 E.02935
; WIPE_START
G1 F12000
M204 S6000
G1 X80.69 Y104.59 E-.14619
G1 X79.075 Y104.59 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.554 Y96.975 Z8.44 F42000
G1 X77.149 Y76.413 Z8.44
G1 Z8.04
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X77.187 Y76.266 E.00199
G3 X78.405 Y75.41 I1.218 J.439 E.02083
G1 X80.69 Y75.41 E.03
G1 X80.69 Y75.79 E.00499
G1 X78.355 Y75.791 E.03066
G2 X77.49 Y76.695 I.056 J.92 E.01806
G1 X77.49 Y78.99 E.03013
G1 X77.11 Y78.99 E.00499
G1 X77.11 Y76.705 E.03
G3 X77.124 Y76.513 I1.294 J-.001 E.00253
G1 X77.135 Y76.471 E.00057
; WIPE_START
G1 F12000
M204 S6000
G1 X77.187 Y76.266 E-.08046
G1 X77.293 Y76.038 E-.09571
G1 X77.488 Y75.788 E-.12031
G1 X77.63 Y75.665 E-.07126
G1 X77.906 Y75.508 E-.12086
G1 X78.146 Y75.435 E-.09514
G1 X78.405 Y75.41 E-.09905
G1 X78.609 Y75.41 E-.07722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.24 Y75.55 Z8.44 F42000
G1 X99.31 Y75.79 Z8.44
G1 Z8.04
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X99.31 Y75.41 E.00499
G1 X101.665 Y75.412 E.03092
G3 X102.888 Y76.634 I-.074 J1.298 E.02485
G1 X102.89 Y78.99 E.03093
G1 X102.51 Y78.99 E.00499
G1 X102.51 Y76.695 E.03013
G2 X101.645 Y75.791 I-.922 J.016 E.01806
G1 X99.37 Y75.79 E.02987
; WIPE_START
G1 F12000
M204 S6000
G1 X99.31 Y75.41 E-.14618
G1 X100.925 Y75.411 E-.61382
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
G1 X102.51 Y101.01 F42000
G1 Z8.12
G1 E.8 F1800
M73 P98 R0
G1 F1200
M204 S5000
G1 X102.89 Y101.01 E.00499
G1 X102.89 Y103.295 E.03
G3 X101.666 Y104.588 I-1.307 J-.011 E.02573
G1 X99.31 Y104.59 E.03093
G1 X99.31 Y104.21 E.00499
G1 X101.605 Y104.21 E.03013
G2 X102.509 Y103.347 I-.016 J-.922 E.01803
G1 X102.51 Y101.07 E.0299
; WIPE_START
G1 F12000
M204 S6000
G1 X102.89 Y101.01 E-.14623
G1 X102.89 Y102.625 E-.61377
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.277 Y103.169 Z8.52 F42000
G1 X80.69 Y104.21 Z8.52
G1 Z8.12
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X80.69 Y104.59 E.00499
G1 X78.405 Y104.59 E.03
G3 X77.11 Y103.295 I-.001 J-1.294 E.02672
G1 X77.11 Y101.01 E.03
G1 X77.49 Y101.01 E.00499
G1 X77.49 Y103.308 E.03017
G2 X78.395 Y104.21 I.921 J-.018 E.01855
G1 X80.63 Y104.21 E.02935
; WIPE_START
G1 F12000
M204 S6000
G1 X80.69 Y104.59 E-.14619
G1 X79.075 Y104.59 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.554 Y96.975 Z8.52 F42000
G1 X77.148 Y76.416 Z8.52
G1 Z8.12
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X77.187 Y76.266 E.00203
G3 X78.405 Y75.41 I1.218 J.439 E.02083
G1 X80.69 Y75.41 E.03
G1 X80.69 Y75.79 E.00499
G1 X78.355 Y75.791 E.03065
G2 X77.49 Y76.694 I.056 J.92 E.01806
G1 X77.49 Y78.99 E.03014
G1 X77.11 Y78.99 E.00499
G1 X77.11 Y76.705 E.03
G3 X77.124 Y76.513 I1.294 J-.001 E.00253
G1 X77.134 Y76.474 E.00053
; WIPE_START
G1 F12000
M204 S6000
G1 X77.187 Y76.266 E-.08163
G1 X77.328 Y75.983 E-.11997
G1 X77.488 Y75.788 E-.09609
G1 X77.63 Y75.665 E-.07112
G1 X77.906 Y75.508 E-.12094
G1 X78.146 Y75.435 E-.09514
G1 X78.405 Y75.41 E-.09897
G1 X78.606 Y75.41 E-.07614
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.237 Y75.55 Z8.52 F42000
G1 X99.31 Y75.79 Z8.52
G1 Z8.12
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X99.31 Y75.41 E.00499
G1 X101.666 Y75.412 E.03093
G3 X102.888 Y76.634 I-.084 J1.306 E.0248
G1 X102.89 Y78.99 E.03093
G1 X102.51 Y78.99 E.00499
G1 X102.51 Y76.695 E.03013
G2 X101.647 Y75.791 I-.922 J.016 E.01803
G1 X99.37 Y75.79 E.0299
; WIPE_START
G1 F12000
M204 S6000
G1 X99.31 Y75.41 E-.14617
G1 X100.925 Y75.411 E-.61383
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


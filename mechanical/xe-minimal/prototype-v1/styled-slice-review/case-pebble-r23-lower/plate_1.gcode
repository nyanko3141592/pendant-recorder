; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 9m 26s; total estimated time: 9m 45s
; total layer number: 51
; total filament length [mm] : 642.28
; total filament volume [cm^3] : 1544.86
; total filament weight [g] : 1.92
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 8.20
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
M73 P0 R9
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
M73 P1 R9
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
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/51
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P2 R9
G1 X88.795 Y103.205 F42000
M204 S6000
M73 P3 R9
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X91.157 Y103.201 E.08799
G3 X91.11 Y105.5 I-.059 J1.149 E.13199
G1 X88.894 Y105.5 E.08254
G3 X88.736 Y103.212 I.012 J-1.15 E.12778
; WIPE_START
G1 X90.736 Y103.203 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X97.456 Y99.585 Z.6 F42000
G1 X100.767 Y97.803 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X100.632 Y97.91 E.00642
G3 X99.661 Y95.755 I-.702 J-.98 E.15892
G1 X99.9 Y95.725 E.00898
G3 X100.811 Y97.753 I.03 J1.205 E.10537
G1 X100.806 Y97.758 E.00027
M204 S6000
G1 X100.464 Y97.461 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X100.366 Y97.541 E.00472
G3 X99.763 Y96.203 I-.436 J-.609 E.09869
G1 X99.911 Y96.184 E.00557
G3 X100.502 Y97.415 I.018 J.749 E.06401
; WIPE_START
G1 X100.366 Y97.541 E-.07062
G1 X100.239 Y97.62 E-.05674
G1 X100.023 Y97.679 E-.08505
G1 X99.8 Y97.675 E-.08508
G1 X99.656 Y97.634 E-.05683
G1 X99.525 Y97.567 E-.05578
G1 X99.335 Y97.393 E-.09777
G1 X99.251 Y97.255 E-.06164
G1 X99.202 Y97.12 E-.05436
G1 X99.18 Y96.972 E-.05687
G1 X99.187 Y96.823 E-.05679
G1 X99.202 Y96.766 E-.02246
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X92.015 Y99.336 Z.6 F42000
G1 X88.024 Y100.763 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X79.161 Y100.761 E.33009
G3 X78.934 Y100.46 I.044 J-.269 E.01551
G1 X78.934 Y75.54 E.92816
G3 X79.187 Y75.237 I.272 J-.03 E.01644
G1 X100.852 Y75.241 E.80692
G1 X100.986 Y75.314 E.0057
G3 X101.063 Y75.487 I-.191 J.189 E.00723
G1 X101.065 Y95.121 E.73128
G2 X99.054 Y94.994 I-1.133 J1.96 E.07779
G2 X101.066 Y98.726 I.877 J1.935 E.25952
G3 X101.065 Y100.493 I-36.772 J.88 E.06583
G3 X100.76 Y100.766 I-.274 J0 E.01721
G1 X88.084 Y100.763 E.47215
; WIPE_START
G1 X86.084 Y100.762 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X89.516 Y101.224 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X79.165 Y101.221 E.38554
G3 X78.477 Y100.471 I.042 J-.729 E.04192
G1 X78.477 Y75.529 E.92899
G3 X79.165 Y74.78 I.727 J-.024 E.04195
G1 X100.863 Y74.781 E.80818
M73 P4 R9
G3 X101.52 Y75.465 I-.066 J.722 E.03851
G1 X101.522 Y96.248 E.77409
G1 X101.096 Y95.74 E.02469
G2 X101.336 Y97.831 I-1.165 J1.193 E.30534
G1 X101.523 Y97.894 E.00734
G1 X101.523 Y100.486 E.09653
G3 X100.771 Y101.223 I-.736 J.001 E.04369
G1 X90.195 Y101.223 E.39393
G1 X91.316 Y102.287 E.05757
G1 X88.689 Y102.286 E.09783
G1 X89.813 Y101.224 E.0576
G1 X89.576 Y101.224 E.00885
; WIPE_START
G1 X87.576 Y101.223 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X91.34 Y101.68 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X92.781 Y103.046 E.07394
G3 X91.795 Y106.071 I-1.284 J1.255 E.1456
G1 X91.709 Y105.851 E.00879
G2 X91.717 Y102.864 I-.636 J-1.495 E.14111
G2 X91.18 Y102.744 I-.652 J1.649 E.02055
G1 X88.882 Y102.743 E.08559
G2 X88.297 Y105.842 I.02 J1.609 E.16438
G1 X88.216 Y106.073 E.00913
G3 X87.228 Y103.037 I.288 J-1.773 E.14653
G1 X88.664 Y101.681 E.07356
G1 X79.142 Y101.678 E.35465
G3 X78.02 Y100.482 I.062 J-1.183 E.06744
G1 X78.02 Y75.518 E.92983
G3 X79.142 Y74.322 I1.184 J-.013 E.06744
G1 X100.911 Y74.326 E.8108
G3 X101.978 Y75.442 I-.116 J1.178 E.06264
G1 X101.98 Y100.491 E.93298
G3 X100.782 Y101.68 I-1.185 J.003 E.06993
G1 X91.4 Y101.68 E.34946
; WIPE_START
G1 X92.781 Y103.046 E-.73801
G1 X92.819 Y103.089 E-.02199
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X92.487 Y102.137 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
M73 P5 R9
G3 X93.194 Y102.819 I-4.945 J5.837 E.03662
G3 X91.497 Y106.55 I-1.698 J1.479 E.19181
G1 X88.503 Y106.55 E.1115
G3 X86.905 Y102.714 I-.002 J-2.25 E.1973
G1 X87.515 Y102.137 E.03126
G1 X79.12 Y102.135 E.31269
G3 X77.563 Y100.493 I.086 J-1.64 E.09293
G1 X77.563 Y75.507 E.93067
G3 X79.12 Y73.865 I1.642 J-.001 E.09293
G1 X100.959 Y73.871 E.81342
G3 X102.435 Y75.42 I-.165 J1.635 E.08677
G1 X102.437 Y100.497 E.93402
G3 X100.794 Y102.137 I-1.642 J-.002 E.09604
G1 X92.547 Y102.137 E.30718
; WIPE_START
G1 X93.194 Y102.819 E-.35728
G1 X93.394 Y103.085 E-.1264
G1 X93.553 Y103.38 E-.1274
G1 X93.667 Y103.696 E-.12778
G1 X93.678 Y103.751 E-.02114
; WIPE_END
G1 E-.04 F1800
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

G1 X92.731 Y103.412
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.162651
G1 F3000
M204 S500
G3 X92.954 Y104.711 I-1.405 J.91 E.01321
; LINE_WIDTH: 0.125591
G3 X92.848 Y105.02 I-1.841 J-.455 E.00221
G1 X92.789 Y105.135 E.00087
; WIPE_START
G1 X92.848 Y105.02 E-.21436
G1 X92.954 Y104.711 E-.54564
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X91.526 Y106.01 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.636602
G1 F3000
M204 S500
G3 X91.118 Y106.025 I-.604 J-10.969 E.01974
G3 X88.479 Y106.015 I-1.116 J-53.212 E.12768
; WIPE_START
G1 X90.479 Y106.023 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X87.205 Y105.126 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.118248
G1 F3000
M204 S500
G3 X87.118 Y104.939 I1.886 J-.986 E.00127
G1 X87.089 Y104.857 E.00053
; LINE_WIDTH: 0.162832
G3 X87.141 Y103.65 I1.576 J-.537 E.01208
G1 X87.191 Y103.548 E.00111
; LINE_WIDTH: 0.127426
G3 X87.443 Y103.185 I1.506 J.777 E.00305
M204 S6000
G1 X87.805 Y102.845 F42000
; LINE_WIDTH: 0.118661
G1 F3000
M204 S500
G1 X87.993 Y102.698 E.00148
; LINE_WIDTH: 0.156
G1 X88.073 Y102.64 E.0009
; LINE_WIDTH: 0.184529
G1 X88.265 Y102.514 E.00266
M204 S6000
G1 X88.469 Y102.54 F42000
; LINE_WIDTH: 0.140528
G1 F3000
M204 S500
G2 X88.012 Y102.611 I.907 J7.326 E.00368
; WIPE_START
G1 X88.469 Y102.54 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X91.55 Y102.541 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.122929
G1 F3000
M204 S500
G1 X91.688 Y102.563 E.00091
; LINE_WIDTH: 0.162957
G1 X91.825 Y102.586 E.00136
; LINE_WIDTH: 0.186051
G3 X91.929 Y102.642 I-.026 J.174 E.00141
; LINE_WIDTH: 0.157875
G1 X92 Y102.691 E.00081
; LINE_WIDTH: 0.120565
G1 X92.184 Y102.834 E.00147
M204 S6000
G1 X92.554 Y103.183 F42000
; LINE_WIDTH: 0.118377
G1 F3000
M204 S500
G3 X92.675 Y103.331 I-1.878 J1.665 E.00117
G1 X92.731 Y103.412 E.00061
; WIPE_START
G1 X92.675 Y103.331 E-.25952
G1 X92.554 Y103.183 E-.50048
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X99.04 Y99.16 Z.6 F42000
G1 X101.488 Y97.641 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.478584
G1 F3000
M204 S500
G2 X101.546 Y97.241 I-4.002 J-.786 E.01437
; LINE_WIDTH: 0.422145
G1 X101.56 Y96.945 E.00914
G1 X101.359 Y96.408 E.01773
M204 S6000
G1 X101.286 Y96.335 F42000
; LINE_WIDTH: 0.222215
G1 F3000
M204 S500
G1 X101.751 Y97.301 E.01566
; WIPE_START
G1 X101.286 Y96.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.294 Y95.535 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.120802
G1 F3000
M204 S500
G1 X101.098 Y95.415 E.00146
; WIPE_START
G1 X101.294 Y95.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.129 Y87.904 Z.6 F42000
G1 X100.88 Y76.357 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50407
G1 F6300
M204 S500
G1 X100.153 Y75.63 E.03865
G1 X99.501 Y75.63 E.02451
G1 X100.675 Y76.803 E.06238
G1 X100.675 Y77.456 E.02451
G1 X98.849 Y75.629 E.09705
G1 X98.196 Y75.629 E.02451
G1 X100.675 Y78.108 E.13172
G1 X100.675 Y78.76 E.02451
G1 X97.544 Y75.629 E.16639
G1 X96.892 Y75.629 E.02451
G1 X100.675 Y79.412 E.20106
G1 X100.675 Y80.065 E.02451
G1 X96.239 Y75.629 E.23573
G1 X95.587 Y75.629 E.02451
G1 X100.675 Y80.717 E.2704
G1 X100.675 Y81.369 E.02451
M73 P6 R9
G1 X94.935 Y75.629 E.30507
G1 X94.283 Y75.628 E.02451
G1 X100.675 Y82.021 E.33974
G1 X100.675 Y82.674 E.02451
G1 X93.63 Y75.628 E.37441
G1 X92.978 Y75.628 E.02451
G1 X100.676 Y83.326 E.40908
G1 X100.676 Y83.978 E.02451
G1 X92.326 Y75.628 E.44375
G1 X91.673 Y75.628 E.02451
G1 X100.676 Y84.63 E.47841
G1 X100.676 Y85.282 E.02451
G1 X91.021 Y75.628 E.51308
G1 X90.369 Y75.628 E.02451
G1 X100.676 Y85.935 E.54775
G1 X100.676 Y86.587 E.02451
G1 X89.716 Y75.627 E.58242
G1 X89.064 Y75.627 E.02451
G1 X100.676 Y87.239 E.61709
G1 X100.676 Y87.891 E.02451
G1 X88.412 Y75.627 E.65176
G1 X87.759 Y75.627 E.02451
G1 X100.676 Y88.544 E.68643
G1 X100.676 Y89.196 E.02451
G1 X87.107 Y75.627 E.7211
G1 X86.455 Y75.627 E.02451
G1 X100.676 Y89.848 E.75577
G1 X100.676 Y90.5 E.02451
G1 X85.802 Y75.627 E.79044
G1 X85.15 Y75.626 E.02451
G1 X100.676 Y91.153 E.82511
G1 X100.676 Y91.805 E.02451
G1 X84.498 Y75.626 E.85978
M73 P7 R9
G1 X83.846 Y75.626 E.02451
G1 X100.676 Y92.457 E.89445
G1 X100.677 Y93.109 E.02451
G1 X83.193 Y75.626 E.92911
G1 X82.541 Y75.626 E.02451
G1 X100.677 Y93.761 E.96378
G1 X100.677 Y94.414 E.02451
G1 X81.889 Y75.626 E.99845
G1 X81.236 Y75.626 E.02451
G1 X100.04 Y94.429 E.99928
G1 X99.867 Y94.416 E.0065
G1 X99.43 Y94.471 E.01657
G1 X80.584 Y75.625 E1.00151
G1 X79.932 Y75.625 E.02451
G1 X98.932 Y94.625 E1.00973
G1 X98.513 Y94.858 E.01802
G1 X79.323 Y75.669 E1.0198
G1 X79.323 Y76.321 E.02451
G1 X98.157 Y95.155 E1.00093
G1 X98.083 Y95.221 E.00374
G1 X97.862 Y95.512 E.01373
G1 X79.323 Y76.973 E.98524
G1 X79.323 Y77.625 E.02451
G1 X97.63 Y95.932 E.97291
M73 P7 R8
G1 X97.562 Y96.073 E.00588
G1 X97.472 Y96.427 E.0137
G1 X79.323 Y78.277 E.96452
G1 X79.323 Y78.929 E.02451
G1 X97.651 Y97.258 E.97402
; WIPE_START
M73 P8 R8
G1 X96.237 Y95.843 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X100.261 Y99.216 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X100.677 Y99.631 E.02209
G1 X100.677 Y100.283 E.0245
G1 X99.613 Y99.219 E.05655
; WIPE_START
G1 X100.677 Y100.283 E-.5719
G1 X100.677 Y99.788 E-.1881
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X100.324 Y100.583 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X99.009 Y99.281 E.06954
G3 X97.597 Y97.856 I.928 J-2.332 E.07756
G1 X79.323 Y79.582 E.97114
G1 X79.323 Y80.234 E.02451
G1 X99.466 Y100.377 E1.07048
G1 X98.814 Y100.377 E.02451
G1 X79.323 Y80.886 E1.03582
G1 X79.323 Y81.538 E.02451
G1 X98.162 Y100.377 E1.00116
G1 X97.51 Y100.377 E.02451
G1 X79.323 Y82.19 E.9665
G1 X79.323 Y82.842 E.02451
G1 X96.857 Y100.377 E.93184
G1 X96.205 Y100.377 E.02451
G1 X79.323 Y83.495 E.89717
G1 X79.323 Y84.147 E.02451
G1 X95.553 Y100.377 E.86251
G1 X94.901 Y100.377 E.02451
G1 X79.323 Y84.799 E.82785
G1 X79.323 Y85.451 E.02451
G1 X94.248 Y100.377 E.79319
G1 X93.596 Y100.376 E.02451
G1 X79.323 Y86.103 E.75853
M73 P9 R8
G1 X79.323 Y86.755 E.02451
G1 X92.944 Y100.376 E.72387
G1 X92.292 Y100.376 E.02451
G1 X79.323 Y87.407 E.6892
G1 X79.323 Y88.06 E.02451
G1 X91.639 Y100.376 E.65454
G1 X90.987 Y100.376 E.02451
G1 X79.323 Y88.712 E.61988
G1 X79.323 Y89.364 E.02451
G1 X90.335 Y100.376 E.58522
G1 X89.683 Y100.376 E.02451
G1 X79.323 Y90.016 E.55056
G1 X79.323 Y90.668 E.02451
G1 X89.03 Y100.376 E.5159
G1 X88.378 Y100.376 E.02451
G1 X79.323 Y91.32 E.48123
G1 X79.323 Y91.973 E.02451
G1 X87.726 Y100.376 E.44657
G1 X87.074 Y100.376 E.02451
G1 X79.323 Y92.625 E.41191
G1 X79.323 Y93.277 E.02451
G1 X86.422 Y100.376 E.37725
G1 X85.769 Y100.376 E.02451
G1 X79.323 Y93.929 E.34259
G1 X79.323 Y94.581 E.02451
G1 X85.117 Y100.376 E.30793
G1 X84.465 Y100.376 E.02451
G1 X79.323 Y95.233 E.27326
G1 X79.323 Y95.886 E.02451
G1 X83.813 Y100.375 E.2386
G1 X83.16 Y100.375 E.02451
G1 X79.323 Y96.538 E.20394
G1 X79.323 Y97.19 E.02451
G1 X82.508 Y100.375 E.16928
G1 X81.856 Y100.375 E.02451
G1 X79.323 Y97.842 E.13462
M73 P10 R8
G1 X79.323 Y98.494 E.02451
G1 X81.204 Y100.375 E.09996
G1 X80.551 Y100.375 E.02451
G1 X79.323 Y99.146 E.06529
G1 X79.323 Y99.799 E.02451
G1 X80.105 Y100.581 E.04156
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X79.323 Y99.799 E-.42031
G1 X79.323 Y99.146 E-.24782
G1 X79.494 Y99.317 E-.09187
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/51
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S196.35
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I-.437 J1.136 P1  F42000
G1 X88.701 Y102.857 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X88.749 Y102.846 E.00133
G1 X91.182 Y102.84 E.06592
G3 X91.123 Y105.861 I-.084 J1.509 E.1257
G1 X88.885 Y105.861 E.06065
G3 X88.383 Y102.933 I.027 J-1.512 E.11335
G1 X88.643 Y102.871 E.00723
M204 S250
G1 X88.789 Y103.245 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X88.789 Y103.245 E.00001
G1 X91.157 Y103.241 E.05953
G3 X91.108 Y105.46 I-.059 J1.109 E.08598
G1 X88.895 Y105.46 E.05565
G3 X88.521 Y103.309 I.014 J-1.111 E.0774
G1 X88.731 Y103.259 E.00543
; WIPE_START
M204 S6000
G1 X88.789 Y103.245 E-.02289
G1 X90.729 Y103.242 E-.73711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.536 Y99.788 Z.76 F42000
G1 X100.98 Y98.041 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X100.82 Y98.174 E.00564
G3 X99.589 Y95.442 I-.891 J-1.242 E.14662
G1 X99.892 Y95.404 E.00826
G3 X101.049 Y97.973 I.037 J1.528 E.0971
G1 X101.023 Y97.999 E.00099
M204 S10000
G1 X100.705 Y97.729 F42000
G1 F10826.06
M204 S6000
G1 X100.575 Y97.833 E.00451
G3 X99.682 Y95.849 I-.646 J-.902 E.10637
G1 X99.902 Y95.822 E.00601
G3 X100.744 Y97.683 I.027 J1.109 E.07037
M204 S250
G1 X100.44 Y97.429 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X100.342 Y97.509 E.00318
G3 X99.772 Y96.242 I-.413 J-.576 E.06306
G1 X99.912 Y96.224 E.00356
G3 X100.478 Y97.382 I.017 J.709 E.04066
; WIPE_START
M204 S6000
G1 X100.342 Y97.509 E-.07044
G1 X100.222 Y97.583 E-.05362
G1 X100.018 Y97.64 E-.08042
G1 X99.807 Y97.635 E-.08053
G1 X99.67 Y97.597 E-.05387
G1 X99.544 Y97.532 E-.05374
G1 X99.434 Y97.444 E-.05379
G1 X99.342 Y97.336 E-.05384
G1 X99.275 Y97.211 E-.05373
G1 X99.233 Y97.076 E-.05387
G1 X99.219 Y96.935 E-.0538
G1 X99.233 Y96.797 E-.05272
G1 X99.276 Y96.685 E-.04561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.304 Y101.164 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X90.273 Y101.166 E.10925
G1 X90.973 Y102.009 E.02969
G1 X89.028 Y102.008 E.0527
G1 X89.727 Y101.166 E.02965
G1 X79.218 Y101.166 E.28475
G1 X79.02 Y101.14 E.00543
G3 X78.534 Y100.481 I.182 J-.642 E.02387
G1 X78.534 Y75.519 E.67641
G1 X78.555 Y75.338 E.00492
G1 X78.629 Y75.158 E.00529
G1 X78.753 Y75.007 E.00529
G1 X78.906 Y74.903 E.00501
G3 X79.219 Y74.834 I.304 J.636 E.00875
G1 X100.817 Y74.836 E.58526
G1 X100.993 Y74.863 E.00481
G1 X101.142 Y74.929 E.00442
G1 X101.27 Y75.03 E.00442
G1 X101.38 Y75.175 E.00493
G3 X101.466 Y75.519 I-.594 J.33 E.00971
G1 X101.466 Y95.679 E.54628
G1 X100.988 Y95.298 E.01656
G2 X101.067 Y98.518 I-1.053 J1.637 E.22864
G1 X101.466 Y98.167 E.01439
G1 X101.462 Y100.565 E.06499
G1 X101.401 Y100.785 E.00618
G1 X101.27 Y100.97 E.00615
G1 X101.084 Y101.101 E.00617
G1 X100.865 Y101.162 E.00616
G1 X94.364 Y101.164 E.17616
M204 S10000
G1 X93.878 Y101.582 F42000
G1 F10826.06
M204 S6000
G1 X91.158 Y101.582 E.07369
G1 X91.809 Y102.366 E.02763
G1 X91.713 Y102.519 E.00491
G2 X91.208 Y102.425 I-.627 J1.95 E.01394
G1 X88.875 Y102.424 E.06323
G2 X88.288 Y102.524 I.043 J2.022 E.0162
G1 X88.187 Y102.37 E.00497
G1 X88.842 Y101.582 E.02776
G1 X79.213 Y101.581 E.2609
G3 X78.119 Y100.487 I-.012 J-1.083 E.04673
G1 X78.119 Y75.513 E.6767
G3 X79.213 Y74.419 I1.083 J-.012 E.04673
G1 X100.83 Y74.42 E.58574
G3 X101.881 Y75.513 I-.032 J1.083 E.04553
G1 X101.881 Y100.487 E.6767
G3 X100.787 Y101.581 I-1.085 J.009 E.0467
G1 X93.938 Y101.582 E.18559
; WIPE_START
G1 X91.938 Y101.582 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.039 Y103.208 Z.76 F42000
G1 Z.36
G1 E.8 F1800
G1 F10826.06
M204 S6000
G1 X93.092 Y103.283 E.00248
G3 X91.492 Y106.189 I-1.593 J1.017 E.10971
G1 X88.508 Y106.189 E.08087
G3 X87.023 Y103.122 I-.007 J-1.89 E.11506
G1 X87.957 Y101.997 E.03961
G1 X79.208 Y101.997 E.23706
G3 X77.703 Y100.492 I-.007 J-1.499 E.06414
G1 X77.703 Y75.508 E.67699
G3 X79.208 Y74.003 I1.499 J-.007 E.06414
G1 X100.842 Y74.005 E.58622
G3 X102.297 Y75.508 I-.045 J1.5 E.06274
G1 X102.297 Y100.492 E.67699
G3 X100.792 Y101.997 I-1.502 J.003 E.0641
G1 X92.043 Y101.997 E.23706
G1 X92.977 Y103.122 E.0396
G1 X93.004 Y103.16 E.00126
M204 S250
G1 X92.96 Y102.475 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X93.673 Y103.576 I-2.422 J2.347 E.03319
G3 X91.497 Y106.59 I-2.178 J.72 E.10893
G1 X88.503 Y106.59 E.07529
G3 X86.709 Y102.873 I-.001 J-2.291 E.12919
G1 X87.039 Y102.475 E.013
G1 F1143.581
G1 X87.103 Y102.398 E.00253
G1 F720
G1 X79.803 Y102.398 E.18354
G3 X78.651 Y102.316 I-.3 J-3.953 E.02913
G3 X77.302 Y100.497 I.551 J-1.818 E.061
G1 X77.302 Y76.103 E.6133
G3 X77.384 Y74.949 I3.946 J-.3 E.02918
G3 X79.203 Y73.602 I1.818 J.553 E.06095
M73 P11 R8
G1 X100.854 Y73.604 E.54434
G3 X102.698 Y75.503 I-.059 J1.901 E.07359
G1 X102.698 Y99.897 E.6133
G3 X102.616 Y101.051 I-3.947 J.3 E.02918
G3 X100.797 Y102.398 I-1.823 J-.56 E.06092
M73 P12 R8
G1 X92.897 Y102.398 E.19863
G1 F875.568
G1 X92.922 Y102.429 E.001
; WIPE_START
M204 S6000
G1 X93.429 Y103.067 E-.30975
G1 X93.541 Y103.261 E-.08507
G1 X93.673 Y103.576 E-.12989
G1 X93.773 Y104.024 E-.17458
G1 X93.785 Y104.184 E-.06071
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

G1 X92.866 Y103.666
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.354228
G1 F14067.243
M204 S6000
G2 X92.782 Y103.497 I-1.91 J.838 E.00395
G1 X92.567 Y103.19 E.00781
G1 X92.318 Y102.912 E.0078
; LINE_WIDTH: 0.385488
G1 F12814.974
G1 X92.181 Y102.781 E.00433
; LINE_WIDTH: 0.428405
G1 F11419.326
G2 X91.931 Y102.563 I-4.461 J4.89 E.00853
M204 S10000
G1 X92.866 Y103.666 F42000
; LINE_WIDTH: 0.387317
G1 F12748.566
M204 S6000
G3 X92.885 Y104.929 I-1.541 J.654 E.0298
; LINE_WIDTH: 0.333402
G1 F15046.867
G1 X92.837 Y105.044 E.00243
G3 X92.749 Y105.202 I-2.106 J-1.057 E.00352
; LINE_WIDTH: 0.299122
G1 F16994.906
G1 X92.664 Y105.329 E.00264
; LINE_WIDTH: 0.271057
G1 F18000
G3 X92.532 Y105.486 I-1.409 J-1.054 E.00316
; LINE_WIDTH: 0.232658
G3 X92.383 Y105.625 I-1.714 J-1.687 E.00264
; LINE_WIDTH: 0.198861
G1 X92.267 Y105.71 E.00154
; LINE_WIDTH: 0.165596
G1 X92.129 Y105.797 E.00139
; LINE_WIDTH: 0.130711
G3 X91.984 Y105.869 I-.822 J-1.466 E.00102
; LINE_WIDTH: 0.100035
G1 X91.852 Y105.919 E.0006
M204 S10000
G1 X88.148 Y105.919 F42000
; LINE_WIDTH: 0.100007
G1 F18000
M204 S6000
G1 X88.017 Y105.869 E.0006
; LINE_WIDTH: 0.129841
G1 X87.87 Y105.795 E.00102
; LINE_WIDTH: 0.165882
G1 X87.735 Y105.713 E.00136
; LINE_WIDTH: 0.207287
G3 X87.609 Y105.617 I1.199 J-1.698 E.00179
G1 X87.548 Y105.564 E.0009
; LINE_WIDTH: 0.253445
G3 X87.386 Y105.391 I1.023 J-1.127 E.00339
; LINE_WIDTH: 0.293797
G1 F17343.635
G3 X87.291 Y105.268 I1.583 J-1.319 E.00263
G1 X87.251 Y105.202 E.0013
; LINE_WIDTH: 0.333047
G1 F15064.734
G3 X87.168 Y105.053 I1.455 J-.906 E.00333
G1 X87.114 Y104.928 E.00265
; LINE_WIDTH: 0.387316
G1 F12748.617
G3 X87.125 Y103.687 I1.596 J-.606 E.02923
G1 X87.138 Y103.657 E.00074
; LINE_WIDTH: 0.354128
G1 F14071.675
G3 X87.672 Y102.922 I2.164 J1.011 E.01906
; LINE_WIDTH: 0.383891
G1 F12873.532
G3 X87.818 Y102.781 I2.346 J2.29 E.00463
; LINE_WIDTH: 0.427952
G1 F11432.464
G3 X88.067 Y102.566 I4.495 J4.927 E.00843
; WIPE_START
G1 X87.818 Y102.781 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.031 Y101.498 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.531816
G1 F9045.591
M204 S6000
G2 X90.032 Y101.604 I-.026 J.053 E.00777
; WIPE_START
G1 X89.969 Y101.606 E-.19255
G1 X89.938 Y101.552 E-.18915
G1 X89.969 Y101.498 E-.18915
G1 X90.031 Y101.498 E-.18915
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.018 Y100.999 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; LINE_WIDTH: 0.420466
G1 F11654.106
M204 S6000
G1 X101.125 Y91.892 E.32421
G1 X101.125 Y91.346 E.01374
G1 X91.645 Y100.825 E.33747
G1 X91.099 Y100.826 E.01375
G1 X101.125 Y90.8 E.35691
G1 X101.125 Y90.254 E.01374
G1 X90.553 Y100.826 E.37634
G1 X90.007 Y100.826 E.01375
G1 X101.125 Y89.707 E.39578
G1 X101.125 Y89.161 E.01374
G1 X89.461 Y100.826 E.41522
G1 X88.915 Y100.826 E.01375
G1 X101.125 Y88.615 E.43466
G1 X101.125 Y88.069 E.01374
G1 X88.369 Y100.825 E.4541
G1 X87.823 Y100.825 E.01375
G1 X101.125 Y87.523 E.47353
G1 X101.125 Y86.977 E.01374
G1 X87.277 Y100.825 E.49297
G1 X86.73 Y100.825 E.01375
G1 X101.125 Y86.431 E.51241
G1 X101.125 Y85.885 E.01374
G1 X86.184 Y100.825 E.53184
G1 X85.638 Y100.825 E.01375
G1 X101.125 Y85.339 E.55128
G1 X101.125 Y84.793 E.01374
G1 X85.092 Y100.825 E.57072
G1 X84.546 Y100.825 E.01375
G1 X101.125 Y84.247 E.59016
G1 X101.124 Y83.701 E.01374
G1 X84 Y100.825 E.60959
G1 X83.454 Y100.825 E.01375
G1 X101.124 Y83.155 E.62903
G1 X101.124 Y82.609 E.01374
G1 X82.908 Y100.825 E.64847
G1 X82.362 Y100.825 E.01375
G1 X101.124 Y82.063 E.66791
G1 X101.124 Y81.517 E.01374
G1 X81.816 Y100.825 E.68734
G1 X81.27 Y100.825 E.01375
G1 X101.124 Y80.971 E.70678
G1 X101.124 Y80.425 E.01374
G1 X80.724 Y100.825 E.72622
G1 X80.178 Y100.825 E.01375
G1 X101.124 Y79.879 E.74566
G1 X101.124 Y79.333 E.01374
G1 X79.632 Y100.825 E.76509
G3 X79.104 Y100.807 I-.187 J-2.248 E.01333
G1 X101.124 Y78.787 E.78388
G1 X101.124 Y78.241 E.01374
G1 X78.877 Y100.488 E.79197
M73 P13 R8
G3 X78.875 Y99.944 I3.049 J-.283 E.01371
G1 X101.124 Y77.695 E.79204
G1 X101.124 Y77.149 E.01374
G1 X78.875 Y99.398 E.79204
G1 X78.875 Y98.852 E.01375
G1 X101.124 Y76.603 E.79204
G1 X101.124 Y76.057 E.01374
G1 X78.875 Y98.306 E.79203
G1 X78.875 Y97.76 E.01375
G1 X101.124 Y75.511 E.79203
G2 X100.89 Y75.199 I-.309 J-.012 E.01063
G1 X78.875 Y97.214 E.78369
G1 X78.875 Y96.668 E.01375
G1 X100.366 Y75.176 E.76506
G1 X99.82 Y75.176 E.01374
G1 X78.875 Y96.122 E.74562
G1 X78.875 Y95.575 E.01375
G1 X99.274 Y75.176 E.72618
G1 X98.728 Y75.176 E.01374
G1 X78.875 Y95.029 E.70674
G1 X78.875 Y94.483 E.01375
G1 X98.182 Y75.176 E.6873
G1 X97.636 Y75.176 E.01374
G1 X78.875 Y93.937 E.66787
G1 X78.875 Y93.391 E.01375
G1 X97.09 Y75.176 E.64843
G1 X96.544 Y75.176 E.01374
G1 X78.875 Y92.845 E.62899
G1 X78.875 Y92.299 E.01375
G1 X95.998 Y75.176 E.60955
G1 X95.452 Y75.176 E.01374
G1 X78.875 Y91.753 E.59012
G1 X78.875 Y91.207 E.01375
G1 X94.906 Y75.176 E.57068
G1 X94.36 Y75.176 E.01374
G1 X78.875 Y90.661 E.55124
G1 X78.875 Y90.115 E.01375
G1 X93.814 Y75.176 E.5318
G1 X93.268 Y75.176 E.01374
G1 X78.875 Y89.569 E.51236
G1 X78.875 Y89.023 E.01375
G1 X92.722 Y75.176 E.49293
G1 X92.176 Y75.176 E.01374
G1 X78.875 Y88.477 E.47349
G1 X78.875 Y87.931 E.01375
G1 X91.63 Y75.176 E.45405
G1 X91.084 Y75.176 E.01374
G1 X78.875 Y87.384 E.43461
G1 X78.875 Y86.838 E.01375
G1 X90.538 Y75.176 E.41518
G1 X89.992 Y75.176 E.01374
G1 X78.875 Y86.292 E.39574
G1 X78.875 Y85.746 E.01375
G1 X89.446 Y75.175 E.3763
G1 X88.899 Y75.175 E.01374
G1 X78.875 Y85.2 E.35686
G1 X78.875 Y84.654 E.01375
G1 X88.353 Y75.175 E.33742
G1 X87.807 Y75.175 E.01374
G1 X78.875 Y84.108 E.31799
G1 X78.875 Y83.562 E.01375
G1 X87.261 Y75.175 E.29855
G1 X86.715 Y75.175 E.01374
G1 X78.875 Y83.016 E.27911
G1 X78.875 Y82.47 E.01375
G1 X86.169 Y75.175 E.25967
G1 X85.623 Y75.175 E.01374
G1 X78.875 Y81.924 E.24024
G1 X78.875 Y81.378 E.01375
G1 X85.077 Y75.175 E.2208
G1 X84.531 Y75.175 E.01374
G1 X78.875 Y80.832 E.20136
G1 X78.875 Y80.286 E.01375
G1 X83.985 Y75.175 E.18192
M73 P14 R8
G1 X83.439 Y75.175 E.01374
G1 X78.875 Y79.739 E.16248
G1 X78.875 Y79.193 E.01375
G1 X82.893 Y75.175 E.14305
G1 X82.347 Y75.175 E.01374
G1 X78.875 Y78.647 E.12361
G1 X78.875 Y78.101 E.01375
G1 X81.801 Y75.175 E.10417
G1 X81.255 Y75.175 E.01374
G1 X78.875 Y77.555 E.08473
G1 X78.875 Y77.009 E.01375
G1 X80.709 Y75.175 E.0653
G1 X80.163 Y75.175 E.01374
G1 X78.875 Y76.463 E.04586
G1 X78.875 Y75.917 E.01375
G1 X79.617 Y75.175 E.02642
G2 X79.141 Y75.183 I-.192 J2.661 E.01199
G2 X78.994 Y75.252 I.065 J.331 E.00413
G1 X78.701 Y75.544 E.01042
M204 S10000
G1 X101.299 Y94.448 F42000
G1 F11654.106
M204 S6000
G1 X100.885 Y94.862 E.01474
G2 X100.48 Y94.721 I-.551 J.929 E.01087
G1 X101.125 Y94.076 E.02298
G1 X101.125 Y93.53 E.01374
G1 X100.001 Y94.654 E.04002
G1 X99.873 Y94.644 E.00323
G1 X99.401 Y94.707 E.01198
G1 X101.125 Y92.984 E.06136
G1 X101.125 Y92.438 E.01374
G1 X92.737 Y100.825 E.29859
G1 X93.283 Y100.825 E.01375
G1 X97.712 Y96.397 E.15765
G1 X97.682 Y96.504 E.0028
G1 X97.639 Y96.935 E.01091
G1 X97.646 Y97.009 E.00187
G1 X93.829 Y100.825 E.13586
G1 X94.376 Y100.825 E.01375
G1 X97.714 Y97.487 E.11885
G1 X97.819 Y97.825 E.00892
G1 X97.855 Y97.892 E.00191
G1 X94.922 Y100.825 E.10442
G1 X95.468 Y100.825 E.01375
G1 X98.051 Y98.242 E.09195
G1 X98.3 Y98.539 E.00976
G1 X96.014 Y100.825 E.08138
G1 X96.56 Y100.825 E.01375
G1 X98.597 Y98.788 E.07252
G2 X98.941 Y98.99 I.672 J-.751 E.01011
G1 X97.106 Y100.825 E.06533
G1 X97.652 Y100.825 E.01375
G1 X99.34 Y99.137 E.06008
G2 X99.811 Y99.212 I.421 J-1.126 E.01209
G1 X98.198 Y100.825 E.05742
G1 X98.744 Y100.825 E.01375
G1 X100.403 Y99.166 E.05906
G1 X100.781 Y99.054 E.00993
G1 X100.869 Y99.247 E.00533
G1 X99.29 Y100.825 E.05618
G1 X99.836 Y100.825 E.01375
G1 X101.125 Y99.537 E.04586
G1 X101.124 Y100.083 E.01375
G1 X100.209 Y100.999 E.03258
M204 S10000
G1 X101.041 Y98.801 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.109482
G1 F18000
M204 S6000
G1 X101.215 Y98.723 E.00093
G1 X101.258 Y98.633 E.00049
M204 S10000
G1 X101.372 Y97.94 F42000
; LINE_WIDTH: 0.0945184
G1 F18000
M204 S6000
G1 X101.432 Y97.875 E.00035
; LINE_WIDTH: 0.124972
G1 X101.514 Y97.77 E.00079
; LINE_WIDTH: 0.173407
G1 X101.592 Y97.669 E.00115
; LINE_WIDTH: 0.187185
G1 X101.602 Y97.628 E.00042
; LINE_WIDTH: 0.153212
G1 X101.627 Y97.463 E.0013
; LINE_WIDTH: 0.109377
G1 X101.651 Y97.31 E.00076
M204 S10000
G1 X101.65 Y96.568 F42000
; LINE_WIDTH: 0.104909
G1 F18000
M204 S6000
G1 X101.63 Y96.408 E.00074
; LINE_WIDTH: 0.139921
G1 X101.612 Y96.306 E.00071
; LINE_WIDTH: 0.1782
G1 X101.591 Y96.192 E.00109
; LINE_WIDTH: 0.208705
G1 X101.544 Y96.007 E.00217
M204 S10000
G1 X101.674 Y96.233 F42000
; LINE_WIDTH: 0.102948
G1 F18000
M204 S6000
G2 X101.32 Y95.86 I-3.955 J3.393 E.0023
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.674 Y96.233 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/51
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S198.9
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I-.554 J-1.083 P1  F42000
G1 X88.747 Y102.849 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X88.878 Y102.839 E.00354
G1 X91.183 Y102.84 E.06247
G3 X91.123 Y105.861 I-.085 J1.509 E.12569
G1 X88.885 Y105.861 E.06065
G3 X88.682 Y102.854 I.027 J-1.512 E.12175
G1 X88.687 Y102.854 E.00014
M204 S250
G1 X88.776 Y103.251 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X91.158 Y103.241 E.05987
G3 X91.108 Y105.46 I-.059 J1.109 E.08597
G1 X88.895 Y105.46 E.05565
G3 X88.717 Y103.255 I.014 J-1.111 E.08252
; WIPE_START
M204 S6000
G1 X90.717 Y103.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.525 Y99.793 Z.92 F42000
G1 X100.976 Y98.044 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X100.844 Y98.163 E.00483
G3 X99.616 Y95.438 I-.907 J-1.23 E.14769
G3 X100.196 Y95.427 I.319 J1.431 E.01582
G3 X101.052 Y97.977 I-.26 J1.506 E.08912
G1 X101.021 Y98.004 E.00111
M204 S10000
G1 X100.701 Y97.732 F42000
G1 F10826.06
M204 S6000
G1 X100.591 Y97.829 E.00398
G3 X99.699 Y95.847 I-.654 J-.898 E.10696
G1 X99.903 Y95.822 E.00557
G3 X100.746 Y97.693 I.035 J1.11 E.07093
M204 S250
G1 X100.436 Y97.432 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X100.348 Y97.508 E.00294
G3 X99.778 Y96.241 I-.415 J-.575 E.06325
G1 X99.912 Y96.224 E.00341
G3 X100.477 Y97.387 I.02 J.709 E.04091
; WIPE_START
M204 S6000
G1 X100.348 Y97.508 E-.06705
G1 X100.217 Y97.585 E-.05784
G1 X100.088 Y97.628 E-.05161
G1 X99.948 Y97.646 E-.05374
G1 X99.806 Y97.635 E-.05389
G1 X99.675 Y97.598 E-.05175
G1 X99.539 Y97.529 E-.05802
G1 X99.433 Y97.444 E-.0516
G1 X99.342 Y97.335 E-.05381
G1 X99.275 Y97.211 E-.05369
G1 X99.233 Y97.076 E-.05374
G1 X99.228 Y96.826 E-.09518
G1 X99.262 Y96.692 E-.05259
G1 X99.268 Y96.678 E-.00549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.878 Y100.852 Z.92 F42000
G1 X91.107 Y102.009 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X88.889 Y102.008 E.06011
G1 X89.437 Y101.272 E.02486
G1 X79.218 Y101.272 E.27691
G3 X78.428 Y100.482 I-.015 J-.776 E.03382
G1 X78.428 Y75.518 E.67643
G3 X79.218 Y74.728 I.774 J-.016 E.03385
G1 X100.814 Y74.729 E.58517
G3 X101.572 Y75.518 I-.015 J.774 E.03295
G1 X101.572 Y95.854 E.55103
G1 X101.221 Y95.474 E.01402
G2 X101.094 Y98.494 I-1.286 J1.459 E.23731
G1 X101.572 Y98.073 E.01726
G1 X101.571 Y100.538 E.0668
G3 X100.781 Y101.272 I-.773 J-.039 E.03233
G1 X90.557 Y101.272 E.27705
G1 X91.072 Y101.961 E.0233
M204 S10000
G1 X91.775 Y102.55 F42000
G1 F10826.06
M204 S6000
G1 X91.472 Y102.461 E.00854
G2 X91.209 Y102.425 I-.413 J2.039 E.0072
G1 X88.862 Y102.424 E.0636
G2 X88.175 Y102.559 I.078 J2.212 E.01907
G1 X88.071 Y102.411 E.0049
G1 X88.609 Y101.688 E.02444
G1 X79.213 Y101.688 E.25461
G3 X78.012 Y100.487 I-.009 J-1.192 E.05122
G1 X78.012 Y75.513 E.67671
G3 X79.213 Y74.312 I1.19 J-.011 E.05125
G1 X100.826 Y74.314 E.58563
G3 X101.988 Y75.513 I-.028 J1.19 E.05017
G1 X101.988 Y100.487 E.67671
G3 X100.787 Y101.688 I-1.192 J.009 E.05123
G1 X91.386 Y101.688 E.25472
G1 X91.929 Y102.413 E.02454
G1 X91.827 Y102.55 E.00463
M204 S10000
G1 X92.483 Y102.461 F42000
G1 F10826.06
M204 S6000
G1 X93.036 Y103.201 E.02504
G3 X91.492 Y106.189 I-1.541 J1.097 E.11232
G1 X88.508 Y106.189 E.08087
G3 X86.96 Y103.206 I-.004 J-1.891 E.11215
G1 X87.781 Y102.104 E.03725
G1 X79.208 Y102.104 E.23231
G3 X77.596 Y100.492 I-.003 J-1.609 E.06863
G1 X77.596 Y75.508 E.67699
G3 X79.208 Y73.897 I1.605 J-.006 E.06867
G1 X100.838 Y73.898 E.5861
G3 X102.404 Y75.508 I-.041 J1.607 E.06738
G1 X102.404 Y100.492 E.67699
G3 X100.792 Y102.104 I-1.609 J.003 E.06863
G1 X92.216 Y102.104 E.23238
G1 X92.447 Y102.413 E.01045
M204 S250
G1 X93.038 Y102.504 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X93.016 Y102.504 E.00056
G3 X93.706 Y103.685 I-2.632 J2.329 E.0346
G3 X91.497 Y106.59 I-2.207 J.614 E.10614
G1 X88.503 Y106.59 E.07529
G3 X86.46 Y103.261 I.002 J-2.292 E.11752
G1 X86.633 Y102.974 E.00843
G1 F8836.153
G1 X86.983 Y102.504 E.01472
G1 F2855.834
G1 X86.962 Y102.504 E.00054
G1 F2700
G1 X79.803 Y102.504 E.17998
G3 X78.62 Y102.418 I-.3 J-4.058 E.02992
G3 X77.349 Y101.268 I.584 J-1.923 E.04452
M73 P15 R8
G1 F2880
G3 X77.256 Y100.985 I2.111 J-.854 E.0075
G1 F2700
G3 X77.196 Y99.897 I4.415 J-.788 E.02747
G1 X77.196 Y76.103 E.59822
G3 X77.282 Y74.918 I4.053 J-.3 E.02997
G3 X78.665 Y73.569 I1.929 J.594 E.05064
G1 F2880
G1 X78.811 Y73.534 E.00378
G1 F2700
G3 X79.803 Y73.496 I.692 J5.059 E.025
G1 X100.849 Y73.497 E.52913
G3 X102.804 Y75.503 I-.054 J2.008 E.07791
G1 X102.804 Y99.897 E.61331
G3 X102.795 Y100.695 I-7.266 J.311 E.02006
G1 F2880
G3 X102.744 Y100.989 I-2.267 J-.242 E.0075
G1 F2700
G3 X102.688 Y101.173 I-1.925 J-.483 E.00486
G1 F2880
G3 X102.567 Y101.446 I-2.146 J-.788 E.00751
G1 F2700
G3 X100.797 Y102.504 I-1.776 J-.961 E.0544
G1 X93.098 Y102.504 E.19356
; WIPE_START
M204 S6000
G1 X93.016 Y102.504 E-.03123
G1 X93.363 Y102.968 E-.22009
G1 X93.489 Y103.166 E-.08931
G1 X93.59 Y103.363 E-.08405
G1 X93.706 Y103.685 E-.12989
G1 X93.784 Y104.134 E-.17304
G1 X93.784 Y104.219 E-.03239
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

G1 X92.903 Y103.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.363945
G1 F13652.573
M204 S6000
G2 X92.734 Y103.416 I-1.699 J.619 E.00823
G1 X92.387 Y102.965 E.01222
; LINE_WIDTH: 0.393122
G1 F12542.318
G1 X92.289 Y102.863 E.00333
; LINE_WIDTH: 0.426347
G1 F11479.281
G1 X92.205 Y102.776 E.00309
; LINE_WIDTH: 0.445679
G1 F10939.785
G1 X92.188 Y102.76 E.00062
G1 X91.888 Y102.817 E.00821
M204 S10000
G1 X92.903 Y103.76 F42000
; LINE_WIDTH: 0.389088
G1 F12684.921
M204 S6000
G3 X92.909 Y104.868 I-1.606 J.563 E.0261
; LINE_WIDTH: 0.336702
G1 F14882.631
G3 X92.747 Y105.206 I-1.475 J-.496 E.0074
; LINE_WIDTH: 0.289556
G1 F17631.896
G1 X92.705 Y105.272 E.00131
G3 X92.587 Y105.425 I-1.859 J-1.31 E.00322
; LINE_WIDTH: 0.241455
G1 F18000
G1 X92.577 Y105.436 E.00019
G3 X92.391 Y105.618 I-2.508 J-2.383 E.00353
; LINE_WIDTH: 0.19078
G3 X92.2 Y105.755 I-.946 J-1.119 E.00239
; LINE_WIDTH: 0.144781
G3 X92.022 Y105.853 I-1.414 J-2.356 E.00147
; LINE_WIDTH: 0.103579
G1 X92.016 Y105.856 E.00003
G3 X91.852 Y105.919 I-1.009 J-2.353 E.0008
M204 S10000
G1 X88.148 Y105.919 F42000
; LINE_WIDTH: 0.100012
G1 F18000
M204 S6000
G1 X88.017 Y105.869 E.0006
; LINE_WIDTH: 0.129219
G1 X87.874 Y105.799 E.00098
; LINE_WIDTH: 0.172454
G3 X87.678 Y105.673 I.748 J-1.378 E.0021
; LINE_WIDTH: 0.214444
G1 X87.545 Y105.562 E.00204
; LINE_WIDTH: 0.246448
G1 X87.434 Y105.449 E.00218
; LINE_WIDTH: 0.281836
G3 X87.292 Y105.266 I1.072 J-.982 E.00375
; LINE_WIDTH: 0.327443
G1 F15352.795
G3 X87.129 Y104.968 I1.439 J-.978 E.0065
G1 X87.114 Y104.93 E.00079
; LINE_WIDTH: 0.386328
G1 F12784.388
G3 X87.047 Y103.929 I1.619 J-.612 E.02334
; LINE_WIDTH: 0.369049
G1 F13444.354
G3 X87.546 Y103.041 I1.973 J.525 E.02247
; LINE_WIDTH: 0.381327
G1 F12968.647
G3 X87.695 Y102.876 I8.199 J7.23 E.00502
; LINE_WIDTH: 0.427428
G1 F11447.706
G1 X87.96 Y102.615 E.00954
; WIPE_START
G1 X87.695 Y102.876 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.831 Y101.841 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422906
G1 F11580.925
M204 S6000
G1 X89.606 Y101.616 E.00807
G1 X89.841 Y101.301 E.00995
G1 X90.381 Y101.842 E.01936
; WIPE_START
G1 X89.841 Y101.301 E-.39366
G1 X89.606 Y101.616 E-.20226
G1 X89.831 Y101.841 E-.16408
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.217 Y101.311 Z.92 F42000
G1 X79.2 Y101.101 Z.92
G1 Z.52
G1 E.8 F1800
G1 F11580.925
M204 S6000
G1 X78.897 Y100.799 E.01082
G3 X78.814 Y100.687 I.207 J-.242 E.00357
G3 X78.768 Y100.121 I1.355 J-.394 E.0145
G1 X79.579 Y100.932 E.02906
G1 X80.129 Y100.932 E.01392
G1 X78.768 Y99.571 E.04874
G1 X78.768 Y99.021 E.01392
G1 X80.679 Y100.932 E.06843
G1 X81.228 Y100.932 E.01392
G1 X78.768 Y98.472 E.08812
G1 X78.768 Y97.922 E.01392
G1 X81.778 Y100.932 E.1078
G1 X82.327 Y100.932 E.01392
G1 X78.768 Y97.373 E.12749
G1 X78.768 Y96.823 E.01392
G1 X82.877 Y100.932 E.14717
G1 X83.426 Y100.932 E.01392
G1 X78.768 Y96.274 E.16686
G1 X78.768 Y95.724 E.01392
G1 X83.976 Y100.932 E.18655
G1 X84.525 Y100.932 E.01392
G1 X78.768 Y95.175 E.20623
G1 X78.768 Y94.625 E.01392
G1 X85.075 Y100.932 E.22592
G1 X85.624 Y100.932 E.01392
G1 X78.768 Y94.076 E.2456
G1 X78.768 Y93.526 E.01392
G1 X86.174 Y100.932 E.26529
G1 X86.723 Y100.932 E.01392
G1 X78.768 Y92.977 E.28498
G1 X78.768 Y92.427 E.01392
G1 X87.273 Y100.932 E.30466
G1 X87.822 Y100.932 E.01392
G1 X78.768 Y91.878 E.32435
G1 X78.768 Y91.328 E.01392
G1 X88.372 Y100.932 E.34403
G1 X88.922 Y100.932 E.01392
G1 X78.768 Y90.779 E.36372
G1 X78.768 Y90.229 E.01392
G1 X89.471 Y100.932 E.38341
G1 X90.021 Y100.932 E.01392
G1 X78.768 Y89.68 E.40309
G1 X78.768 Y89.13 E.01392
G1 X90.57 Y100.932 E.42278
G1 X91.12 Y100.932 E.01392
G1 X78.768 Y88.581 E.44246
G1 X78.768 Y88.031 E.01392
G1 X91.669 Y100.932 E.46214
G1 X92.218 Y100.932 E.01392
G1 X78.768 Y87.482 E.48182
G1 X78.768 Y86.932 E.01392
G1 X92.768 Y100.932 E.50151
G1 X93.317 Y100.931 E.01392
G1 X78.768 Y86.382 E.52119
G1 X78.768 Y85.833 E.01392
G1 X93.867 Y100.931 E.54087
G1 X94.416 Y100.931 E.01392
G1 X78.768 Y85.283 E.56055
G1 X78.768 Y84.734 E.01392
G1 X94.966 Y100.931 E.58024
G1 X95.515 Y100.931 E.01392
G1 X78.768 Y84.184 E.59992
M73 P16 R8
G1 X78.768 Y83.635 E.01392
G1 X96.064 Y100.931 E.6196
G1 X96.614 Y100.931 E.01392
G1 X78.768 Y83.085 E.63928
G1 X78.768 Y82.536 E.01392
G1 X97.163 Y100.931 E.65897
G1 X97.713 Y100.931 E.01392
G1 X78.768 Y81.986 E.67865
G1 X78.768 Y81.437 E.01392
G1 X98.262 Y100.931 E.69833
G1 X98.812 Y100.931 E.01392
G1 X78.768 Y80.887 E.71801
G1 X78.768 Y80.338 E.01392
G1 X99.361 Y100.93 E.7377
G1 X99.911 Y100.93 E.01392
G1 X78.768 Y79.788 E.75738
G1 X78.768 Y79.239 E.01392
G1 X100.633 Y101.104 E.78328
; WIPE_START
G1 X99.219 Y99.69 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.78 Y96.571 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.1717
G1 F18000
M204 S6000
G1 X101.624 Y96.315 E.00268
; LINE_WIDTH: 0.15224
G1 X101.567 Y96.227 E.0008
; LINE_WIDTH: 0.106452
G1 X101.466 Y96.08 E.00084
M204 S10000
G1 X101.66 Y96.254 F42000
; LINE_WIDTH: 0.209887
G1 F18000
M204 S6000
G3 X101.7 Y96.525 I-3.602 J.674 E.00314
; LINE_WIDTH: 0.162869
G1 X101.722 Y96.818 E.00246
G1 X101.71 Y97.243 E.00356
; LINE_WIDTH: 0.19342
G1 X101.691 Y97.401 E.00164
; LINE_WIDTH: 0.245621
G1 X101.67 Y97.563 E.00225
G1 X101.405 Y97.943 E.00639
M204 S10000
G1 X101.372 Y97.94 F42000
; LINE_WIDTH: 0.103249
G1 F18000
M204 S6000
G2 X101.78 Y97.461 I-4.481 J-4.233 E.00283
; WIPE_START
G1 X101.372 Y97.94 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.405 Y99.127 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422906
G1 F11580.925
M204 S6000
G1 X101.144 Y98.867 E.00932
G3 X100.782 Y99.054 I-1.374 J-2.218 E.01034
G1 X101.231 Y99.503 E.01608
G1 X101.231 Y100.052 E.01391
G1 X100.358 Y99.179 E.03127
G1 X99.987 Y99.226 E.00946
G1 X99.844 Y99.215 E.00364
G1 X101.215 Y100.586 E.04912
G3 X100.971 Y100.892 I-.445 J-.105 E.01023
G1 X99.168 Y99.089 E.06457
G1 X98.657 Y98.836 E.01446
G3 X97.818 Y97.825 I1.466 J-2.069 E.03366
G1 X97.78 Y97.701 E.00328
G1 X78.768 Y78.689 E.68107
G1 X78.768 Y78.14 E.01392
G1 X97.647 Y97.018 E.67628
G1 X97.686 Y96.508 E.01297
G1 X78.768 Y77.59 E.67769
G1 X78.768 Y77.041 E.01392
G1 X97.81 Y96.082 E.68213
G1 X97.993 Y95.716 E.01038
G1 X78.768 Y76.491 E.68869
G1 X78.768 Y75.942 E.01392
G1 X98.23 Y95.404 E.69719
G1 X98.522 Y95.146 E.00986
G1 X78.783 Y75.406 E.70713
G3 X79.033 Y75.108 I.411 J.09 E.01027
G1 X98.851 Y94.925 E.70993
G3 X99.235 Y94.76 I1.138 J2.115 E.01061
G1 X79.544 Y75.068 E.70541
G1 X80.093 Y75.068 E.01392
G1 X99.692 Y94.667 E.70208
G1 X99.874 Y94.644 E.00464
G1 X100.247 Y94.672 E.00947
G1 X80.643 Y75.068 E.70227
G1 X81.192 Y75.068 E.01392
G1 X101.082 Y94.958 E.7125
G3 X101.232 Y95.063 I-.221 J.476 E.00466
G1 X101.232 Y94.558 E.01278
G1 X81.742 Y75.069 E.69818
G1 X82.291 Y75.069 E.01392
G1 X101.232 Y94.009 E.67849
G1 X101.231 Y93.459 E.01392
G1 X82.841 Y75.069 E.6588
G1 X83.391 Y75.069 E.01392
G1 X101.231 Y92.909 E.63912
G1 X101.231 Y92.36 E.01392
G1 X83.94 Y75.069 E.61943
G1 X84.49 Y75.069 E.01392
G1 X101.231 Y91.81 E.59974
G1 X101.231 Y91.261 E.01392
G1 X85.039 Y75.069 E.58005
G1 X85.589 Y75.069 E.01392
M73 P17 R8
G1 X101.231 Y90.711 E.56036
G1 X101.231 Y90.162 E.01392
G1 X86.138 Y75.069 E.54068
G1 X86.688 Y75.069 E.01392
G1 X101.231 Y89.612 E.52099
G1 X101.231 Y89.063 E.01392
G1 X87.238 Y75.069 E.5013
G1 X87.787 Y75.069 E.01392
G1 X101.231 Y88.513 E.48161
G1 X101.231 Y87.963 E.01392
G1 X88.337 Y75.069 E.46192
G1 X88.886 Y75.069 E.01392
G1 X101.231 Y87.414 E.44223
G1 X101.231 Y86.864 E.01392
G1 X89.436 Y75.069 E.42255
G1 X89.985 Y75.069 E.01392
G1 X101.231 Y86.315 E.40286
G1 X101.231 Y85.765 E.01392
G1 X90.535 Y75.069 E.38317
G1 X91.084 Y75.069 E.01392
G1 X101.231 Y85.216 E.36348
G1 X101.231 Y84.666 E.01392
G1 X91.634 Y75.069 E.34379
G1 X92.184 Y75.069 E.01392
G1 X101.231 Y84.117 E.32411
G1 X101.231 Y83.567 E.01392
G1 X92.733 Y75.069 E.30442
G1 X93.283 Y75.069 E.01392
G1 X101.231 Y83.017 E.28473
G1 X101.231 Y82.468 E.01392
G1 X93.832 Y75.069 E.26504
G1 X94.382 Y75.069 E.01392
G1 X101.231 Y81.918 E.24535
G1 X101.231 Y81.369 E.01392
G1 X94.931 Y75.069 E.22566
G1 X95.481 Y75.069 E.01392
G1 X101.231 Y80.819 E.20598
G1 X101.231 Y80.27 E.01392
G1 X96.03 Y75.069 E.18629
G1 X96.58 Y75.069 E.01392
G1 X101.231 Y79.72 E.1666
G1 X101.231 Y79.171 E.01392
G1 X97.13 Y75.07 E.14691
G1 X97.679 Y75.07 E.01392
G1 X101.23 Y78.621 E.12722
G1 X101.23 Y78.071 E.01392
G1 X98.229 Y75.07 E.10753
G1 X98.778 Y75.07 E.01392
G1 X101.23 Y77.522 E.08785
G1 X101.23 Y76.972 E.01392
G1 X99.328 Y75.07 E.06816
G1 X99.877 Y75.07 E.01392
G1 X101.23 Y76.423 E.04847
G1 X101.23 Y75.873 E.01392
G1 X100.427 Y75.07 E.02878
G1 X100.796 Y75.07 E.00936
G3 X101.039 Y75.143 I-.015 J.489 E.00649
G3 X101.404 Y75.497 I-1.617 J2.032 E.01291
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11580.925
G1 X101.039 Y75.143 E-.19336
G1 X100.884 Y75.079 E-.06376
G1 X100.796 Y75.07 E-.03338
G1 X100.427 Y75.07 E-.14035
G1 X101.039 Y75.682 E-.32915
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/51
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I-1.109 J-.502 P1  F42000
G1 X88.738 Y102.85 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X88.878 Y102.839 E.00379
G1 X91.184 Y102.84 E.06249
G3 X91.123 Y105.861 I-.086 J1.509 E.12567
G1 X88.885 Y105.861 E.06065
G3 X88.678 Y102.855 I.016 J-1.511 E.12218
M204 S250
G1 X88.767 Y103.252 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X91.158 Y103.241 E.06011
G3 X91.108 Y105.46 I-.06 J1.109 E.08596
G1 X88.895 Y105.46 E.05565
G3 X88.708 Y103.256 I.007 J-1.11 E.08263
; WIPE_START
M204 S6000
G1 X90.708 Y103.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.517 Y99.795 Z1.08 F42000
G1 X100.979 Y98.042 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X100.823 Y98.177 E.0056
G3 X99.615 Y95.439 I-.887 J-1.245 E.14698
G3 X100.196 Y95.427 I.32 J1.432 E.01585
G3 X101.053 Y97.977 I-.26 J1.506 E.08911
G1 X101.024 Y98.002 E.00104
M204 S10000
G1 X100.704 Y97.73 F42000
G1 F10826.06
M204 S6000
G1 X100.579 Y97.838 E.00447
G3 X99.698 Y95.847 I-.642 J-.906 E.10654
G1 X99.902 Y95.822 E.00559
G3 X100.749 Y97.69 I.035 J1.11 E.07084
M204 S250
G1 X100.439 Y97.43 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X100.344 Y97.511 E.00314
G3 X99.777 Y96.241 I-.411 J-.578 E.06311
G1 X99.912 Y96.224 E.00342
G3 X100.479 Y97.385 I.02 J.709 E.04084
; WIPE_START
M204 S6000
G1 X100.344 Y97.511 E-.06996
G1 X100.222 Y97.583 E-.05375
G1 X100.088 Y97.628 E-.05384
G1 X99.948 Y97.646 E-.05377
G1 X99.812 Y97.636 E-.05172
G1 X99.666 Y97.594 E-.05783
G1 X99.487 Y97.49 E-.07846
G1 X99.342 Y97.335 E-.08058
G1 X99.275 Y97.211 E-.05367
G1 X99.233 Y97.076 E-.05385
G1 X99.219 Y96.935 E-.05386
G1 X99.233 Y96.794 E-.05401
G1 X99.268 Y96.681 E-.04471
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.912 Y101.333 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X90.762 Y101.333 E.11246
G1 X91.222 Y102.009 E.02216
G1 X88.778 Y102.008 E.06621
G1 X89.237 Y101.333 E.02212
G1 X79.218 Y101.333 E.27146
G3 X78.367 Y100.481 I-.015 J-.836 E.03641
G1 X78.367 Y75.519 E.67641
G3 X79.219 Y74.667 I.836 J-.015 E.03641
G1 X100.846 Y74.67 E.58604
G1 X101.08 Y74.717 E.00647
G1 X101.263 Y74.808 E.00553
G1 X101.443 Y74.972 E.0066
G1 X101.564 Y75.171 E.0063
G3 X101.633 Y75.519 I-.82 J.343 E.00968
G1 X101.633 Y95.947 E.55354
G1 X101.291 Y95.54 E.01439
G2 X101.359 Y98.261 I-1.355 J1.395 E.24948
G1 X101.463 Y98.124 E.00466
G1 X101.633 Y98.181 E.00486
G1 X101.633 Y100.481 E.06233
G3 X100.782 Y101.333 I-.836 J.015 E.0364
G1 X94.972 Y101.333 E.15741
M204 S10000
G1 X94.305 Y101.748 F42000
G1 F10826.06
M204 S6000
G1 X91.547 Y101.748 E.07474
G1 X92.027 Y102.455 E.02315
G1 X91.915 Y102.598 E.00492
G2 X91.21 Y102.425 I-.885 J2.082 E.01976
G1 X88.862 Y102.424 E.06362
G2 X88.09 Y102.605 I.148 J2.365 E.0216
G1 X87.969 Y102.461 E.00511
G1 X88.452 Y101.748 E.02333
G1 X79.213 Y101.748 E.25034
G3 X77.952 Y100.487 I-.009 J-1.252 E.0538
G1 X77.952 Y75.513 E.6767
G3 X79.213 Y74.252 I1.253 J-.009 E.0538
G1 X100.86 Y74.254 E.58657
G3 X102.048 Y75.513 I-.061 J1.247 E.05183
G1 X102.048 Y100.487 E.6767
G3 X100.787 Y101.748 I-1.253 J.009 E.0538
G1 X94.365 Y101.748 E.17401
M204 S10000
M73 P18 R8
G1 X93.698 Y102.164 F42000
G1 F10826.06
M204 S6000
G1 X92.332 Y102.164 E.03701
G1 X93.09 Y103.28 E.03656
G3 X91.492 Y106.189 I-1.592 J1.019 E.10979
G1 X88.508 Y106.189 E.08087
G3 X86.91 Y103.28 I-.007 J-1.89 E.10981
G1 X87.668 Y102.164 E.03654
G1 X79.208 Y102.164 E.22923
G3 X77.536 Y100.492 I-.003 J-1.669 E.0712
G1 X77.536 Y75.508 E.67699
G3 X79.208 Y73.836 I1.669 J-.003 E.07119
G1 X100.874 Y73.839 E.58709
M73 P18 R7
G3 X102.464 Y75.508 I-.075 J1.663 E.069
G1 X102.464 Y100.492 E.67699
G3 X100.792 Y102.164 I-1.669 J.003 E.07119
G1 X93.758 Y102.164 E.19061
M204 S250
G1 X93.112 Y102.565 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X93.088 Y102.565 E.0006
G3 X93.675 Y103.584 I-3.016 J2.414 E.02969
G3 X91.497 Y106.59 I-2.181 J.712 E.10871
G1 X88.503 Y106.59 E.07529
G3 X86.573 Y103.063 I-.001 J-2.291 E.12333
G1 X86.687 Y102.896 E.00509
G1 X86.911 Y102.565 E.01006
G1 F8098.463
G1 X86.887 Y102.565 E.00061
G1 F7800
G1 X79.803 Y102.565 E.17811
G3 X78.601 Y102.476 I-.3 J-4.113 E.03042
G3 X77.136 Y100.497 I.61 J-1.983 E.06626
G1 X77.136 Y76.103 E.61331
G3 X77.225 Y74.901 I4.112 J-.3 E.03042
G3 X79.203 Y73.436 I1.983 J.61 E.06626
G1 X100.288 Y73.438 E.53011
G1 F8640
G1 X100.688 Y73.438 E.01006
G1 X100.888 Y73.438 E.00503
G1 F7800
G3 X102.864 Y75.503 I-.089 J2.064 E.07937
G1 X102.864 Y99.897 E.61331
G3 X102.776 Y101.099 I-4.113 J.3 E.03042
G3 X100.797 Y102.564 I-1.983 J-.61 E.06626
G1 X93.172 Y102.565 E.1917
; WIPE_START
M204 S6000
G1 X93.088 Y102.565 E-.03184
G1 X93.486 Y103.16 E-.27206
G1 X93.675 Y103.584 E-.17655
G1 X93.734 Y103.795 E-.08316
G1 X93.784 Y104.133 E-.12984
G1 X93.779 Y104.308 E-.06655
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

G1 X92.909 Y104.867
G1 Z.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.382536
G1 F12923.612
M204 S6000
G2 X92.734 Y103.416 I-1.6 J-.544 E.03431
G1 X92.622 Y103.246 E.00462
; LINE_WIDTH: 0.375236
G1 F13200.359
G1 X92.389 Y102.947 E.00843
; LINE_WIDTH: 0.432115
G1 F11312.814
G1 X92.272 Y102.819 E.00449
G1 X91.977 Y102.858 E.00773
; WIPE_START
G1 X92.272 Y102.819 E-.48053
G1 X92.389 Y102.947 E-.27947
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.55 Y101.165 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424236
G1 F11541.421
M204 S6000
G1 X101.292 Y92.424 E.31423
G1 X101.292 Y91.872 E.01401
G1 X92.172 Y100.992 E.32781
G1 X91.621 Y100.992 E.01402
G1 X101.292 Y91.321 E.34763
G1 X101.292 Y90.77 E.01401
G1 X90.896 Y101.166 E.37369
M204 S10000
G1 X90.628 Y101.433 F42000
G1 F11541.421
M204 S6000
G1 X90.219 Y101.842 E.01469
M204 S10000
G1 X89.668 Y101.841 F42000
G1 F11541.421
M204 S6000
G1 X101.292 Y90.218 E.41781
G1 X101.292 Y89.667 E.01401
G1 X89.696 Y101.262 E.41681
G1 X89.88 Y100.992 E.0083
G1 X89.415 Y100.992 E.01181
G1 X101.291 Y89.115 E.42691
G1 X101.291 Y88.564 E.01401
G1 X88.863 Y100.992 E.44673
G1 X88.312 Y100.992 E.01402
G1 X101.291 Y88.013 E.46655
G1 X101.291 Y87.461 E.01401
G1 X87.761 Y100.992 E.48637
G1 X87.209 Y100.992 E.01401
G1 X101.291 Y86.91 E.50619
G1 X101.291 Y86.359 E.01401
G1 X86.658 Y100.992 E.52601
G1 X86.107 Y100.992 E.01401
G1 X101.291 Y85.807 E.54583
G1 X101.291 Y85.256 E.01401
G1 X85.555 Y100.992 E.56565
G1 X85.004 Y100.992 E.01401
G1 X101.291 Y84.705 E.58547
G1 X101.291 Y84.153 E.01401
G1 X84.452 Y100.992 E.60528
G1 X83.901 Y100.992 E.01401
G1 X101.291 Y83.602 E.6251
G1 X101.291 Y83.05 E.01401
G1 X83.35 Y100.992 E.64492
G1 X82.798 Y100.992 E.01402
G1 X101.291 Y82.499 E.66474
G1 X101.291 Y81.948 E.01401
G1 X82.247 Y100.992 E.68456
G1 X81.695 Y100.992 E.01402
G1 X101.291 Y81.396 E.70438
G1 X101.291 Y80.845 E.01401
G1 X81.144 Y100.992 E.7242
G1 X80.593 Y100.992 E.01402
G1 X101.291 Y80.294 E.74402
G1 X101.291 Y79.742 E.01401
G1 X80.041 Y100.992 E.76384
G1 X79.49 Y100.992 E.01402
M73 P19 R7
G1 X101.291 Y79.191 E.78365
G1 X101.291 Y78.64 E.01401
G1 X78.99 Y100.94 E.80161
G3 X78.736 Y100.643 I.224 J-.448 E.01021
G1 X101.291 Y78.088 E.81074
G1 X101.291 Y77.537 E.01401
G1 X78.708 Y100.119 E.81175
G1 X78.708 Y99.568 E.01402
G1 X101.291 Y76.986 E.81175
G1 X101.291 Y76.434 E.01401
G1 X78.708 Y99.017 E.81175
G1 X78.708 Y98.465 E.01402
G1 X101.291 Y75.883 E.81175
G2 X101.275 Y75.378 I-1.713 J-.199 E.01288
G1 X101.267 Y75.355 E.00062
G1 X78.708 Y97.914 E.8109
G1 X78.708 Y97.362 E.01402
G1 X101.009 Y75.061 E.80164
G2 X100.509 Y75.01 I-.357 J1.025 E.01291
G1 X78.708 Y96.811 E.78364
G1 X78.708 Y96.26 E.01402
G1 X99.957 Y75.01 E.76382
G1 X99.406 Y75.01 E.01401
G1 X78.708 Y95.708 E.74401
G1 X78.708 Y95.157 E.01402
G1 X98.855 Y75.01 E.72419
G1 X98.303 Y75.01 E.01401
G1 X78.708 Y94.605 E.70437
G1 X78.708 Y94.054 E.01402
G1 X97.752 Y75.01 E.68455
G1 X97.201 Y75.01 E.01401
G1 X78.708 Y93.503 E.66473
G1 X78.708 Y92.951 E.01402
G1 X96.649 Y75.01 E.64491
G1 X96.098 Y75.01 E.01401
G1 X78.708 Y92.4 E.6251
G1 X78.708 Y91.848 E.01402
G1 X95.547 Y75.01 E.60528
G1 X94.995 Y75.01 E.01401
G1 X78.708 Y91.297 E.58546
G1 X78.708 Y90.746 E.01402
G1 X94.444 Y75.01 E.56564
G1 X93.893 Y75.01 E.01401
G1 X78.708 Y90.194 E.54582
G1 X78.708 Y89.643 E.01402
G1 X93.341 Y75.01 E.526
G1 X92.79 Y75.01 E.01401
G1 X78.708 Y89.091 E.50619
G1 X78.708 Y88.54 E.01402
G1 X92.239 Y75.009 E.48637
G1 X91.687 Y75.009 E.01401
G1 X78.708 Y87.989 E.46655
G1 X78.708 Y87.437 E.01402
G1 X91.136 Y75.009 E.44673
G1 X90.585 Y75.009 E.01401
G1 X78.708 Y86.886 E.42691
G1 X78.708 Y86.334 E.01402
G1 X90.033 Y75.009 E.40709
G1 X89.482 Y75.009 E.01401
G1 X78.708 Y85.783 E.38727
G1 X78.708 Y85.232 E.01402
G1 X88.931 Y75.009 E.36746
G1 X88.379 Y75.009 E.01401
G1 X78.708 Y84.68 E.34764
G1 X78.708 Y84.129 E.01402
G1 X87.828 Y75.009 E.32782
G1 X87.277 Y75.009 E.01401
G1 X78.708 Y83.577 E.308
M73 P20 R7
G1 X78.708 Y83.026 E.01402
G1 X86.725 Y75.009 E.28818
G1 X86.174 Y75.009 E.01401
G1 X78.708 Y82.475 E.26836
G1 X78.708 Y81.923 E.01402
G1 X85.623 Y75.009 E.24855
G1 X85.071 Y75.009 E.01401
G1 X78.708 Y81.372 E.22873
G1 X78.708 Y80.82 E.01402
G1 X84.52 Y75.009 E.20891
G1 X83.968 Y75.009 E.01401
G1 X78.708 Y80.269 E.18909
G1 X78.708 Y79.718 E.01402
G1 X83.417 Y75.008 E.16927
G1 X82.866 Y75.008 E.01401
G1 X78.708 Y79.166 E.14945
G1 X78.708 Y78.615 E.01402
G1 X82.314 Y75.008 E.12964
G1 X81.763 Y75.008 E.01401
G1 X78.708 Y78.063 E.10982
G1 X78.708 Y77.512 E.01402
G1 X81.212 Y75.008 E.09
G1 X80.66 Y75.008 E.01401
G1 X78.708 Y76.961 E.07018
G1 X78.708 Y76.409 E.01402
G1 X80.109 Y75.008 E.05036
G1 X79.558 Y75.008 E.01401
G1 X78.708 Y75.858 E.03054
G3 X78.782 Y75.245 I1.229 J-.164 E.01587
G1 X79.175 Y74.839 E.01437
; WIPE_START
G1 X78.782 Y75.245 E-.21477
G1 X78.715 Y75.431 E-.07535
G1 X78.708 Y75.858 E-.1621
G1 X79.281 Y75.285 E-.30778
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.589 Y82.56 Z1.08 F42000
G1 X88.029 Y102.855 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.416313
G1 F11780.826
M204 S6000
G1 X87.736 Y102.821 E.00734
; LINE_WIDTH: 0.429849
G1 F11377.627
G1 X87.611 Y102.948 E.0046
; LINE_WIDTH: 0.385053
G1 F12830.864
G1 X87.599 Y102.962 E.00042
G2 X87.471 Y103.119 I2.475 J2.138 E.00463
; LINE_WIDTH: 0.380295
G1 F13007.336
G2 X87.114 Y104.928 I1.335 J1.203 E.04367
; LINE_WIDTH: 0.332648
G1 F15084.874
G1 X87.162 Y105.04 E.00237
G2 X87.251 Y105.203 I1.86 J-.905 E.00361
; LINE_WIDTH: 0.28726
G1 F17791.919
G2 X87.434 Y105.449 I1.444 J-.888 E.00506
; LINE_WIDTH: 0.245339
G1 F18000
G1 X87.552 Y105.566 E.00228
; LINE_WIDTH: 0.207647
G1 X87.731 Y105.709 E.00259
; LINE_WIDTH: 0.163919
G2 X87.895 Y105.811 I.945 J-1.349 E.00163
; LINE_WIDTH: 0.120892
G2 X88.064 Y105.889 I1.024 J-1.982 E.00105
; LINE_WIDTH: 0.0929366
G1 X88.142 Y105.918 E.00032
M204 S10000
G1 X91.852 Y105.919 F42000
; LINE_WIDTH: 0.103503
G1 F18000
M204 S6000
G2 X92.016 Y105.856 I-.865 J-2.463 E.00079
G1 X92.022 Y105.853 E.00003
; LINE_WIDTH: 0.144684
G2 X92.2 Y105.755 I-1.161 J-2.325 E.00147
; LINE_WIDTH: 0.191379
G2 X92.395 Y105.615 I-.818 J-1.344 E.00245
; LINE_WIDTH: 0.239596
G2 X92.564 Y105.451 I-3.379 J-3.662 E.00315
; LINE_WIDTH: 0.287037
G1 F17807.605
G2 X92.743 Y105.215 I-1.801 J-1.549 E.00488
G1 X92.752 Y105.202 E.00026
; LINE_WIDTH: 0.336747
G1 F14880.427
G2 X92.909 Y104.867 I-1.559 J-.937 E.0073
; WIPE_START
G1 X92.752 Y105.202 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.08 I.545 J1.088 P1  F42000
G1 X100.822 Y101.164 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424236
G1 F11541.421
M204 S6000
G1 X101.189 Y100.798 E.01317
G2 X101.291 Y100.507 I-.446 J-.319 E.00793
G1 X101.291 Y100.144 E.00922
G1 X100.444 Y100.991 E.03042
G1 X99.893 Y100.991 E.01402
G1 X101.291 Y99.592 E.05026
G1 X101.291 Y99.041 E.01402
G1 X99.341 Y100.991 E.07009
G1 X98.79 Y100.991 E.01402
G1 X100.699 Y99.082 E.06861
G1 X100.44 Y99.169 E.00694
G1 X100.006 Y99.223 E.01111
G1 X98.238 Y100.991 E.06353
G1 X97.687 Y100.991 E.01402
G1 X99.502 Y99.176 E.06525
G1 X99.072 Y99.055 E.01136
G1 X97.135 Y100.991 E.06961
G1 X96.584 Y100.991 E.01402
G1 X98.708 Y98.867 E.07636
G3 X98.398 Y98.626 I1.041 J-1.663 E.01001
G1 X96.033 Y100.991 E.08502
G1 X95.481 Y100.991 E.01402
G1 X98.132 Y98.34 E.09531
G3 X97.916 Y98.005 I.721 J-.702 E.01021
G1 X94.93 Y100.991 E.10736
G1 X94.378 Y100.991 E.01402
G1 X97.754 Y97.616 E.12135
G3 X97.661 Y97.157 I1.086 J-.459 E.01197
G1 X93.827 Y100.992 E.13782
G1 X93.275 Y100.992 E.01402
G1 X97.901 Y96.366 E.16629
; WIPE_START
G1 X96.487 Y97.78 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.352 Y94.915 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
G1 F11541.421
M204 S6000
G1 X101.292 Y92.975 E.06972
G1 X101.292 Y93.526 E.01401
G1 X100.153 Y94.665 E.04094
G3 X100.611 Y94.758 I0 J1.18 E.01197
G1 X101.292 Y94.078 E.02446
G1 X101.292 Y94.629 E.01401
G1 X100.871 Y95.05 E.01514
M204 S10000
G1 X101.307 Y95.255 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0955963
G1 F18000
M204 S6000
G1 X101.425 Y95.331 E.00056
; WIPE_START
G1 X101.307 Y95.255 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.84 Y96.745 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.171964
G1 F18000
M204 S6000
G1 X101.653 Y96.4 E.00352
; LINE_WIDTH: 0.152558
G1 X101.601 Y96.31 E.0008
; LINE_WIDTH: 0.106592
G1 X101.506 Y96.157 E.00085
M204 S10000
G1 X101.709 Y96.361 F42000
; LINE_WIDTH: 0.228749
G1 F18000
M204 S6000
G1 X101.749 Y96.757 E.00505
G1 X101.733 Y97.327 E.00722
; LINE_WIDTH: 0.273367
G1 X101.708 Y97.493 E.00261
; LINE_WIDTH: 0.320974
G1 F15699.246
G1 X101.686 Y97.642 E.00283
; LINE_WIDTH: 0.348937
G1 F14303.835
G1 X101.624 Y97.959 E.00661
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F14303.835
G1 X101.686 Y97.642 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/51
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S198.9
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.08 I.205 J-1.2 P1  F42000
G1 X100.439 Y97.429 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X100.348 Y97.506 E.003
G3 X99.772 Y96.242 I-.418 J-.573 E.06325
G1 X99.912 Y96.224 E.00356
G3 X100.478 Y97.384 I.017 J.709 E.04072
; WIPE_START
M204 S6000
G1 X100.348 Y97.506 E-.06796
G1 X100.217 Y97.585 E-.05774
G1 X100.088 Y97.628 E-.05181
G1 X99.948 Y97.646 E-.05381
G1 X99.807 Y97.635 E-.05374
G1 X99.676 Y97.598 E-.0517
G1 X99.54 Y97.529 E-.05789
G1 X99.433 Y97.444 E-.05183
G1 X99.343 Y97.336 E-.05378
G1 X99.275 Y97.211 E-.05378
G1 X99.233 Y97.076 E-.05371
G1 X99.228 Y96.826 E-.09495
G1 X99.262 Y96.692 E-.05274
G1 X99.267 Y96.681 E-.00456
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.796 Y100.728 Z1.24 F42000
G1 X88.763 Y103.25 Z1.24
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S5000
G1 X88.787 Y103.245 E.00061
G1 X91.155 Y103.241 E.05954
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.629 Y103.274 I.008 J-1.11 E.08053
G1 X88.704 Y103.26 E.00192
M204 S10000
G1 X87.937 Y103.136 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X87.673 Y103.468 E.0115
G2 X88.885 Y105.861 I1.235 J.878 E.08924
G1 X91.123 Y105.861 E.06065
G2 X92.282 Y103.408 I-.035 J-1.517 E.09096
G1 X92.042 Y103.136 E.00982
G1 X92.614 Y103.136 E.0155
G1 X92.604 Y103.586 E.0122
G1 X93.25 Y103.586 E.0175
G3 X91.492 Y106.189 I-1.752 J.712 E.10044
G1 X88.508 Y106.189 E.08087
G3 X87.007 Y103.136 I-.002 J-1.894 E.11447
G1 X87.877 Y103.136 E.02357
; WIPE_START
G1 X87.673 Y103.468 E-.14812
G1 X87.495 Y103.791 E-.13991
G1 X87.443 Y103.948 E-.06311
G1 X87.388 Y104.32 E-.14286
G1 X87.399 Y104.538 E-.08303
G1 X87.443 Y104.752 E-.08288
G1 X87.539 Y104.997 E-.10009
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.106 Y102.589 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G3 X93.734 Y103.795 I-2.68 J2.161 E.03441
G3 X91.497 Y106.59 I-2.24 J.5 E.10321
G1 X88.503 Y106.59 E.07529
G3 X86.573 Y103.063 I-.001 J-2.291 E.12334
G1 X86.894 Y102.589 E.01439
G1 X79.203 Y102.589 E.19337
G3 X77.111 Y100.497 I.003 J-2.095 E.08257
G1 X77.111 Y75.503 E.6284
G3 X79.203 Y73.411 I2.095 J.004 E.08257
G1 X100.799 Y73.411 E.54297
G3 X102.889 Y75.503 I-.006 J2.095 E.08251
G1 X102.889 Y100.497 E.6284
G3 X100.797 Y102.589 I-2.095 J-.004 E.08257
G1 X93.166 Y102.589 E.19186
; WIPE_START
M204 S6000
G1 X93.427 Y103.063 E-.20551
G1 X93.545 Y103.271 E-.09092
G1 X93.634 Y103.468 E-.08225
G1 X93.734 Y103.795 E-.12991
G1 X93.773 Y104.02 E-.08677
G1 X93.789 Y104.259 E-.09091
G1 X93.779 Y104.452 E-.07373
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

G1 X92.886 Y104.927
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.387299
G1 F12749.22
M204 S6000
G2 X92.921 Y103.794 I-1.617 J-.617 E.02658
M204 S10000
G1 X92.886 Y104.927 F42000
; LINE_WIDTH: 0.330969
G1 F15170.253
M204 S6000
G1 X92.837 Y105.042 E.0024
G3 X92.739 Y105.221 I-2.87 J-1.455 E.00394
; LINE_WIDTH: 0.285353
G1 F17927.126
G3 X92.565 Y105.45 I-1.984 J-1.323 E.00471
; LINE_WIDTH: 0.239809
G1 F18000
G3 X92.399 Y105.611 I-1.649 J-1.541 E.00311
; LINE_WIDTH: 0.191459
G3 X92.2 Y105.755 I-1.452 J-1.793 E.00252
; LINE_WIDTH: 0.143747
G3 X92.016 Y105.856 I-1.254 J-2.077 E.0015
; LINE_WIDTH: 0.102911
G3 X91.852 Y105.919 I-1.028 J-2.397 E.00079
; WIPE_START
G1 X92.016 Y105.856 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.833 Y103.236 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.111017
G1 F18000
M204 S6000
G2 X91.46 Y102.936 I-6.217 J7.323 E.00239
M204 S10000
G1 X91.434 Y102.936 F42000
; LINE_WIDTH: 0.169244
G1 F18000
M204 S6000
G1 X91.84 Y103.227 E.0044
M204 S10000
G1 X91.7 Y103.052 F42000
; LINE_WIDTH: 0.198263
G1 F18000
M204 S6000
G1 X91.382 Y103.002 E.00345
; LINE_WIDTH: 0.141611
G1 X91.165 Y102.988 E.00152
G1 X88.89 Y102.988 E.01591
G1 X88.56 Y103.009 E.00231
; LINE_WIDTH: 0.216033
G1 X88.25 Y103.066 E.00374
M204 S10000
G1 X88.25 Y103.151 F42000
; LINE_WIDTH: 0.141969
G1 F18000
M204 S6000
G1 X88.51 Y102.936 E.00237
M204 S10000
G1 X88.25 Y103.151 F42000
; LINE_WIDTH: 0.116089
G1 F18000
M204 S6000
G1 X88.144 Y103.244 E.00075
; LINE_WIDTH: 0.0900476
G1 X88.115 Y103.273 E.00015
M204 S10000
G1 X87.305 Y103.344 F42000
; LINE_WIDTH: 0.385348
G1 F12820.084
M204 S6000
G2 X87.113 Y104.924 I1.409 J.973 E.03789
; LINE_WIDTH: 0.3329
G1 F15072.153
G1 X87.176 Y105.069 E.00307
G2 X87.251 Y105.203 I2.083 J-1.074 E.003
; LINE_WIDTH: 0.287001
G1 F17810.149
G2 X87.435 Y105.45 I1.543 J-.96 E.00507
; LINE_WIDTH: 0.246314
G1 F18000
G2 X87.552 Y105.568 I1.766 J-1.638 E.0023
; LINE_WIDTH: 0.207128
G1 X87.731 Y105.71 E.00258
; LINE_WIDTH: 0.164124
G2 X87.895 Y105.81 I1.919 J-2.939 E.00163
; LINE_WIDTH: 0.121548
G2 X88.064 Y105.889 I1.688 J-3.399 E.00106
; LINE_WIDTH: 0.0929202
G1 X88.142 Y105.918 E.00032
; WIPE_START
G1 X88.064 Y105.889 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.327 Y98.989 Z1.24 F42000
G1 X102.63 Y75.087 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X101.213 Y73.67 E.0504
G1 X100.621 Y73.623
G1 X102.677 Y75.679 E.07311
M73 P21 R7
G1 X102.677 Y76.225
G1 X100.075 Y73.623 E.0925
G1 X99.53 Y73.623
G1 X102.677 Y76.77 E.11189
G1 X102.677 Y77.316
G1 X98.984 Y73.623 E.13128
G1 X98.439 Y73.623
G1 X102.677 Y77.861 E.15068
G1 X102.677 Y78.406
G1 X97.894 Y73.623 E.17007
G1 X97.348 Y73.623
G1 X102.677 Y78.952 E.18946
G1 X102.677 Y79.497
G1 X96.803 Y73.623 E.20885
G1 X96.257 Y73.623
G1 X102.677 Y80.043 E.22825
G1 X102.677 Y80.588
G1 X95.712 Y73.623 E.24764
G1 X95.167 Y73.623
G1 X102.677 Y81.133 E.26703
G1 X102.677 Y81.679
G1 X94.621 Y73.623 E.28642
G1 X94.076 Y73.623
G1 X102.677 Y82.224 E.30581
G1 X102.677 Y82.77
G1 X93.53 Y73.623 E.32521
G1 X92.985 Y73.623
G1 X102.677 Y83.315 E.3446
G1 X102.677 Y83.86
G1 X92.44 Y73.623 E.36399
G1 X91.894 Y73.623
G1 X102.677 Y84.406 E.38338
G1 X102.677 Y84.951
G1 X91.349 Y73.623 E.40277
G1 X90.803 Y73.623
G1 X102.677 Y85.497 E.42217
G1 X102.677 Y86.042
G1 X90.258 Y73.623 E.44156
G1 X89.713 Y73.623
G1 X102.677 Y86.587 E.46095
G1 X102.677 Y87.133
G1 X89.167 Y73.623 E.48034
G1 X88.622 Y73.623
G1 X102.677 Y87.678 E.49973
G1 X102.677 Y88.224
G1 X88.076 Y73.623 E.51913
G1 X87.531 Y73.623
G1 X102.677 Y88.769 E.53852
G1 X102.677 Y89.315
G1 X86.986 Y73.623 E.55791
G1 X86.44 Y73.623
G1 X102.677 Y89.86 E.5773
G1 X102.677 Y90.405
G1 X85.895 Y73.623 E.59669
G1 X85.349 Y73.623
G1 X102.677 Y90.951 E.61609
G1 X102.677 Y91.496
G1 X84.804 Y73.623 E.63548
G1 X84.258 Y73.623
G1 X102.677 Y92.042 E.65487
G1 X102.677 Y92.587
G1 X83.713 Y73.623 E.67426
G1 X83.168 Y73.623
G1 X102.677 Y93.132 E.69366
M73 P22 R7
G1 X102.677 Y93.678
G1 X82.622 Y73.623 E.71305
G1 X82.077 Y73.623
G1 X102.677 Y94.223 E.73244
G1 X102.677 Y94.769
G1 X81.531 Y73.623 E.75183
G1 X80.986 Y73.623
G1 X102.677 Y95.314 E.77122
G1 X102.677 Y95.859
G1 X80.441 Y73.623 E.79062
G1 X79.895 Y73.623
G1 X102.677 Y96.405 E.81001
G1 X102.677 Y96.95
G1 X79.35 Y73.623 E.8294
G1 X78.84 Y73.658
G1 X102.677 Y97.496 E.84754
G1 X102.677 Y98.041
G1 X78.427 Y73.791 E.86223
G1 X78.083 Y73.992
G1 X100.125 Y96.035 E.78372
G1 X99.616 Y96.071
G1 X77.798 Y74.253 E.77573
G1 X77.57 Y74.571
G1 X99.281 Y96.281 E.77193
G1 X99.065 Y96.611
G1 X77.405 Y74.951 E.77012
G1 X77.325 Y75.416
G1 X99.024 Y97.115 E.7715
; WIPE_START
M204 S6000
G1 X97.61 Y95.701 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.833 Y96.743 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X102.677 Y98.586 E.06556
G1 X102.677 Y99.132
G1 X100.797 Y97.252 E.06684
G1 X100.584 Y97.584
G1 X102.677 Y99.677 E.07441
G1 X102.677 Y100.223
G1 X100.251 Y97.797 E.08624
G1 X99.748 Y97.839
G1 X102.659 Y100.751 E.10352
G1 X102.547 Y101.184
G1 X77.323 Y75.96 E.89685
G1 X77.323 Y76.505
G1 X102.361 Y101.543 E.89021
G1 X102.113 Y101.84
G1 X77.323 Y77.05 E.88141
G1 X77.323 Y77.596
G1 X101.809 Y102.082 E.8706
G1 X101.444 Y102.262
G1 X77.323 Y78.141 E.85763
M73 P23 R7
G1 X77.323 Y78.687
G1 X101.002 Y102.366 E.84191
G1 X100.468 Y102.377
G1 X77.323 Y79.232 E.82292
G1 X77.323 Y79.778
G1 X99.922 Y102.377 E.80353
G1 X99.377 Y102.377
G1 X77.323 Y80.323 E.78413
G1 X77.323 Y80.868
G1 X98.832 Y102.377 E.76474
G1 X98.286 Y102.377
G1 X77.323 Y81.414 E.74535
G1 X77.323 Y81.959
G1 X97.741 Y102.377 E.72596
G1 X97.195 Y102.377
G1 X77.323 Y82.505 E.70656
G1 X77.323 Y83.05
G1 X96.65 Y102.377 E.68717
G1 X96.105 Y102.377
G1 X77.323 Y83.595 E.66778
G1 X77.323 Y84.141
G1 X95.559 Y102.377 E.64839
G1 X95.014 Y102.377
G1 X77.323 Y84.686 E.629
G1 X77.323 Y85.232
G1 X94.468 Y102.377 E.6096
G1 X93.923 Y102.377
G1 X77.323 Y85.777 E.59021
G1 X77.323 Y86.322
G1 X93.378 Y102.377 E.57082
G1 X92.832 Y102.377
G1 X77.323 Y86.868 E.55143
G1 X77.323 Y87.413
G1 X92.819 Y102.909 E.55095
G1 X92.273 Y102.909
G1 X77.323 Y87.959 E.53156
G1 X77.323 Y88.504
G1 X91.728 Y102.909 E.51217
G1 X91.183 Y102.909
G1 X77.323 Y89.049 E.49277
G1 X77.323 Y89.595
G1 X90.637 Y102.909 E.47338
G1 X90.092 Y102.909
G1 X77.323 Y90.14 E.45399
G1 X77.323 Y90.686
G1 X89.546 Y102.909 E.4346
G1 X89.001 Y102.909
G1 X77.323 Y91.231 E.41521
M73 P24 R7
G1 X77.323 Y91.776
G1 X88.455 Y102.909 E.39581
G1 X87.91 Y102.909
G1 X77.323 Y92.322 E.37642
G1 X77.323 Y92.867
G1 X86.833 Y102.377 E.33811
G1 X86.287 Y102.377
G1 X77.323 Y93.413 E.31872
G1 X77.323 Y93.958
G1 X85.742 Y102.377 E.29933
G1 X85.196 Y102.377
G1 X77.323 Y94.503 E.27994
G1 X77.323 Y95.049
G1 X84.651 Y102.377 E.26055
G1 X84.106 Y102.377
G1 X77.323 Y95.594 E.24116
G1 X77.323 Y96.14
G1 X83.56 Y102.377 E.22176
G1 X83.015 Y102.377
G1 X77.323 Y96.685 E.20237
G1 X77.323 Y97.23
G1 X82.469 Y102.377 E.18298
G1 X81.924 Y102.377
G1 X77.323 Y97.776 E.16359
G1 X77.323 Y98.321
G1 X81.379 Y102.377 E.1442
G1 X80.833 Y102.377
G1 X77.323 Y98.867 E.1248
G1 X77.323 Y99.412
G1 X80.288 Y102.377 E.10541
G1 X79.742 Y102.377
G1 X77.323 Y99.958 E.08602
G1 X77.323 Y100.503
G1 X79.197 Y102.377 E.06661
; WIPE_START
M204 S6000
G1 X77.783 Y100.962 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.998 Y95.389 Z1.24 F42000
G1 X102.448 Y74.604 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0975814
G1 F18000
M204 S6000
G2 X102.342 Y74.469 I-2.795 J2.077 E.0007
; LINE_WIDTH: 0.139182
G2 X101.831 Y73.957 I-3.024 J2.512 E.00495
; LINE_WIDTH: 0.0975615
G2 X101.696 Y73.852 I-2.186 J2.657 E.0007
; WIPE_START
G1 X101.831 Y73.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.579 Y81.25 Z1.24 F42000
G1 X92.945 Y102.733 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.102481
G1 F18000
M204 S6000
G1 X92.841 Y102.606 E.00073
G3 X92.765 Y102.496 I.132 J-.171 E.0006
M204 S10000
G1 X78.841 Y102.361 F42000
; LINE_WIDTH: 0.289144
G1 F17660.405
M204 S6000
G1 X78.447 Y102.092 E.00792
; LINE_WIDTH: 0.318847
G1 F15816.637
G1 X78.378 Y102.041 E.00159
; LINE_WIDTH: 0.354806
G1 F14041.906
G3 X78.241 Y101.935 I2.082 J-2.811 E.00362
; LINE_WIDTH: 0.396751
G1 F12416.728
G3 X77.765 Y101.459 I2.333 J-2.809 E.01593
; LINE_WIDTH: 0.355261
G1 F14021.982
G3 X77.661 Y101.325 I2.675 J-2.195 E.00355
; LINE_WIDTH: 0.319342
G1 F15789.157
G1 X77.608 Y101.253 E.00166
; LINE_WIDTH: 0.289065
G1 F17665.859
G1 X77.339 Y100.859 E.00792
; WIPE_START
G1 X77.608 Y101.253 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.155 Y100.108 Z1.24 F42000
G1 X99.682 Y97.905 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.185813
G1 F18000
M204 S6000
G1 X99.581 Y97.845 E.00117
; LINE_WIDTH: 0.156118
G1 X99.492 Y97.783 E.00085
; LINE_WIDTH: 0.104594
G1 X99.281 Y97.605 E.00127
G1 X99.15 Y97.462 E.00088
; LINE_WIDTH: 0.120497
G1 X99.096 Y97.389 E.00051
; LINE_WIDTH: 0.156302
G3 X98.953 Y97.186 I1.965 J-1.526 E.00198
; WIPE_START
G1 X99.096 Y97.389 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.829 Y97.011 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.129225
G1 F18000
M204 S6000
G1 X100.865 Y97.116 E.00068
G1 X100.808 Y97.223 E.00075
M204 S10000
G1 X100.903 Y96.673 F42000
; LINE_WIDTH: 0.168834
G1 F18000
M204 S6000
G1 X100.822 Y96.552 E.00128
; LINE_WIDTH: 0.15322
G1 X100.767 Y96.479 E.00071
; LINE_WIDTH: 0.110356
G1 X100.593 Y96.275 E.00133
G1 X100.432 Y96.131 E.00107
; LINE_WIDTH: 0.135764
G1 X100.362 Y96.08 E.00057
; LINE_WIDTH: 0.176334
G1 X100.191 Y95.969 E.00189
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X100.362 Y96.08 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/51
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S250
M204 S10000
G17
G3 Z1.24 I-1.153 J.391 P1  F42000
G1 X100.606 Y96.798 Z1.24
M204 S10000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2652
M204 S5000
G3 X99.779 Y96.262 I-.675 J.135 E.07214
G1 X99.913 Y96.246 E.00302
G3 X100.591 Y96.74 I.018 J.688 E.02021
M204 S250
G1 X100.437 Y97.431 F42000
G1 F2652
M204 S5000
G1 X100.345 Y97.512 E.00275
G3 X99.951 Y96.224 I-.414 J-.578 E.06026
G1 X100.018 Y96.23 E.00152
G3 X100.479 Y97.388 I-.087 J.705 E.03401
; WIPE_START
G1 F12000
M204 S6000
G1 X100.345 Y97.512 E-.06937
G1 X100.222 Y97.583 E-.05385
G1 X100.088 Y97.628 E-.05377
G1 X99.842 Y97.64 E-.09384
G1 X99.704 Y97.609 E-.05379
G1 X99.575 Y97.551 E-.05381
G1 X99.409 Y97.418 E-.08064
G1 X99.323 Y97.306 E-.0537
G1 X99.262 Y97.178 E-.05378
G1 X99.227 Y97.041 E-.05378
G1 X99.22 Y96.9 E-.05387
G1 X99.241 Y96.76 E-.05374
G1 X99.27 Y96.68 E-.03206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2652
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2652
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z1.4 F42000
G1 X94.99 Y80.71 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2652
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2652
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.683 Y88.271 Z1.4 F42000
G1 X88.686 Y102.856 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2652
M204 S6000
G1 X88.742 Y102.846 E.00155
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X88.535 Y102.884 I.023 J-1.512 E.11784
G1 X88.627 Y102.867 E.00253
M204 S250
G1 X88.755 Y103.251 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2652
M204 S5000
G1 X88.787 Y103.245 E.00081
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.629 Y103.274 I.011 J-1.11 E.08039
M73 P25 R7
G1 X88.696 Y103.262 E.00172
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.787 Y103.245 E-.03503
G1 X90.695 Y103.242 E-.72497
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.163 Y102.161 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2652
M204 S6000
G1 X92.332 Y102.161 E.00458
G1 X93.09 Y103.279 E.03661
G3 X91.492 Y106.189 I-1.591 J1.02 E.10981
G1 X88.508 Y106.189 E.08087
G3 X86.91 Y103.279 I-.007 J-1.89 E.10982
G1 X87.668 Y102.161 E.03661
G1 X92.103 Y102.161 E.12018
; WIPE_START
G1 F10826.06
G1 X92.332 Y102.161 E-.08696
G1 X93.09 Y103.279 E-.51336
G1 X93.224 Y103.527 E-.10717
G1 X93.273 Y103.656 E-.0525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2652
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.256 E.01247
G1 X78.18 Y102.183 E.00851
G3 X77.49 Y101.308 I.224 J-.886 E.03012
G1 X77.49 Y74.692 E.66917
G3 X78.14 Y73.828 I.919 J.015 E.02906
G1 X78.51 Y73.74 E.00957
G1 X78.51 Y74.24 E.01258
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19252
G3 X102.51 Y74.692 I-.053 J.914 E.03451
G1 X102.51 Y101.305 E.66908
G3 X101.645 Y102.209 I-.935 J-.029 E.03447
G1 X93.99 Y102.21 E.19245
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.107 Y102.59 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F2652
M204 S5000
G3 X93.734 Y103.795 I-2.678 J2.159 E.03438
G3 X91.497 Y106.59 I-2.241 J.499 E.1032
G1 X88.503 Y106.59 E.07529
G3 X86.573 Y103.063 I-.001 J-2.291 E.12334
G1 X86.893 Y102.59 E.01435
G1 X79.203 Y102.59 E.19335
G3 X77.11 Y100.497 I.003 J-2.096 E.08261
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08261
G1 X100.799 Y73.41 E.54296
G3 X102.89 Y75.503 I-.005 J2.096 E.08257
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08261
G1 X93.167 Y102.59 E.19184
M204 S10000
G1 X92.584 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2652
M204 S6000
M73 P26 R7
G1 X93.79 Y102.175 E.03375
; WIPE_START
G1 F10480.96
G1 X92.584 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.178 Y102.369 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.496693
G1 F2652
M204 S6000
G1 X87.802 Y102.741 E.01596
; LINE_WIDTH: 0.476016
G1 X87.738 Y102.808 E.00265
; LINE_WIDTH: 0.442858
G1 X87.662 Y102.889 E.00298
; LINE_WIDTH: 0.403987
G1 X87.538 Y103.034 E.00458
; LINE_WIDTH: 0.380093
G2 X87.001 Y104.343 I1.463 J1.366 E.03259
G2 X87.113 Y104.925 I1.703 J-.025 E.01344
; LINE_WIDTH: 0.333273
G1 X87.131 Y104.972 E.00097
G2 X87.25 Y105.201 I1.437 J-.594 E.00504
; LINE_WIDTH: 0.294247
G1 X87.385 Y105.39 E.00392
; LINE_WIDTH: 0.252879
G1 X87.554 Y105.568 E.00351
; LINE_WIDTH: 0.207339
G1 X87.731 Y105.709 E.00255
; LINE_WIDTH: 0.164173
G2 X87.895 Y105.81 I1.896 J-2.899 E.00163
; LINE_WIDTH: 0.121594
G2 X88.064 Y105.889 I1.716 J-3.454 E.00106
; LINE_WIDTH: 0.0929545
G1 X88.142 Y105.918 E.00032
M204 S10000
G1 X91.852 Y105.919 F42000
; LINE_WIDTH: 0.0988933
G1 F2652
M204 S6000
G1 X91.972 Y105.874 E.00054
; LINE_WIDTH: 0.134104
G2 X92.173 Y105.772 I-.645 J-1.516 E.00146
; LINE_WIDTH: 0.180543
G2 X92.329 Y105.666 I-1.505 J-2.399 E.0018
G1 X92.338 Y105.66 E.0001
; LINE_WIDTH: 0.22517
G2 X92.514 Y105.505 I-1.45 J-1.831 E.00292
; LINE_WIDTH: 0.267718
G2 X92.657 Y105.337 I-1.355 J-1.302 E.00337
; LINE_WIDTH: 0.299271
G1 X92.749 Y105.203 E.00281
; LINE_WIDTH: 0.337144
G2 X92.909 Y104.867 I-1.351 J-.848 E.00735
; LINE_WIDTH: 0.380766
G2 X92.777 Y103.487 I-1.599 J-.544 E.03227
G1 X92.462 Y103.034 E.01246
; LINE_WIDTH: 0.404033
G1 X92.338 Y102.889 E.00458
; LINE_WIDTH: 0.442062
G1 X92.265 Y102.812 E.00284
; LINE_WIDTH: 0.473535
G1 X92.205 Y102.748 E.00249
; LINE_WIDTH: 0.492067
G1 X91.826 Y102.369 E.01602
M204 S10000
G1 X92.44 Y102.691 F42000
; LINE_WIDTH: 0.44237
G1 F2652
M204 S6000
G1 X91.823 Y102.57 E.01673
; LINE_WIDTH: 0.418016
G1 X91.704 Y102.551 E.003
; LINE_WIDTH: 0.376125
G1 X91.566 Y102.529 E.00313
; LINE_WIDTH: 0.335114
G1 X91.37 Y102.509 E.00385
; LINE_WIDTH: 0.29882
G1 X91.186 Y102.501 E.00318
G2 X88.873 Y102.5 I-1.177 J94.008 E.03987
G1 X88.695 Y102.505 E.00308
; LINE_WIDTH: 0.329951
G2 X88.438 Y102.528 I.242 J4.128 E.00496
; LINE_WIDTH: 0.367274
G1 X88.348 Y102.542 E.002
; LINE_WIDTH: 0.409712
G2 X87.57 Y102.677 I2.346 J15.862 E.01932
M204 S10000
G1 X87.416 Y102.175 F42000
; LINE_WIDTH: 0.461703
G1 F2652
M204 S6000
G1 X79.118 Y102.174 E.23119
G3 X78.71 Y102.145 I.188 J-5.549 E.01139
; WIPE_START
G1 F10529.596
G1 X79.118 Y102.174 E-.1553
G1 X80.709 Y102.174 E-.6047
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z1.4 F42000
G1 X78.71 Y73.855 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.462019
G1 F2652
M204 S6000
G3 X79.118 Y73.826 I.596 J5.51 E.0114
G1 X93.79 Y73.825 E.40905
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10521.812
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/51
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I-1.143 J.418 P1  F42000
G1 X100.425 Y97.414 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2670
M204 S5000
G1 X100.331 Y97.492 E.00275
G3 X99.776 Y96.263 I-.401 J-.559 E.05447
G1 X99.913 Y96.246 E.00308
G3 X100.463 Y97.368 I.017 J.688 E.03508
M204 S250
G1 X100.623 Y96.787 F42000
G1 F2670
M204 S5000
G1 X100.641 Y96.899 E.00254
G3 X99.952 Y96.225 I-.71 J.035 E.07615
G1 X100.018 Y96.23 E.0015
G3 X100.612 Y96.729 I-.087 J.705 E.01835
; WIPE_START
G1 F12000
M204 S6000
G1 X100.641 Y96.899 E-.06581
G1 X100.633 Y97.041 E-.05386
G1 X100.554 Y97.275 E-.0938
G1 X100.475 Y97.392 E-.05382
G1 X100.373 Y97.491 E-.05379
G1 X100.254 Y97.568 E-.05383
G1 X100.123 Y97.619 E-.05374
G1 X99.983 Y97.644 E-.05392
G1 X99.842 Y97.64 E-.05376
G1 X99.638 Y97.583 E-.08053
G1 X99.515 Y97.512 E-.05383
G1 X99.409 Y97.419 E-.0537
G1 X99.352 Y97.344 E-.0356
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z1.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2670
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z1.56 F42000
G1 X94.99 Y80.71 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2670
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.67 Y88.268 Z1.56 F42000
G1 X88.644 Y102.864 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2670
M204 S6000
G1 X88.682 Y102.854 E.00106
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.383 Y102.93 I.017 J-1.511 E.11384
G1 X88.586 Y102.878 E.00568
M204 S250
G1 X88.742 Y103.252 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X91.155 Y103.241 E.06067
G3 X91.108 Y105.46 I-.056 J1.109 E.08603
G1 X88.895 Y105.46 E.05565
G3 X88.683 Y103.261 I.007 J-1.11 E.08199
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.683 Y103.245 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.163 Y102.161 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2670
M204 S6000
G1 X92.332 Y102.161 E.00458
G1 X93.089 Y103.279 E.0366
G3 X91.492 Y106.189 I-1.591 J1.02 E.10982
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.279 I-.007 J-1.89 E.10983
G1 X87.668 Y102.161 E.0366
G1 X92.103 Y102.161 E.12016
; WIPE_START
G1 F10826.06
G1 X92.332 Y102.161 E-.08701
G1 X93.089 Y103.279 E-.51333
G1 X93.224 Y103.527 E-.10729
G1 X93.273 Y103.656 E-.05237
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.256 E.01247
G1 X78.18 Y102.183 E.0085
G3 X77.49 Y101.305 I.224 J-.886 E.03021
G1 X77.49 Y74.695 E.66901
G3 X78.14 Y73.828 I.914 J.008 E.02917
G1 X78.51 Y73.74 E.00956
G1 X78.51 Y74.24 E.01257
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19252
G3 X102.51 Y74.692 I-.05 J.912 E.03454
M73 P27 R7
G1 X102.51 Y101.308 E.66914
G3 X101.647 Y102.209 I-.928 J-.025 E.0344
G1 X93.99 Y102.21 E.19252
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.107 Y102.59 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F2670
M204 S5000
G3 X93.733 Y103.795 I-2.675 J2.157 E.03436
G3 X91.497 Y106.59 I-2.241 J.5 E.10321
G1 X88.503 Y106.59 E.07529
G3 X86.573 Y103.062 I-.001 J-2.291 E.12335
G1 X86.893 Y102.59 E.01434
G1 X79.203 Y102.59 E.19335
G3 X77.11 Y100.497 I.004 J-2.096 E.08261
G1 X77.11 Y75.503 E.6284
G3 X79.203 Y73.41 I2.096 J.004 E.08261
G1 X100.802 Y73.41 E.54302
G3 X102.89 Y75.503 I-.008 J2.096 E.0825
G1 X102.89 Y100.497 E.6284
G3 X100.797 Y102.59 I-2.096 J-.004 E.08261
G1 X93.167 Y102.59 E.19184
M204 S10000
G1 X92.583 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2670
M204 S6000
G1 X93.79 Y102.175 E.03376
; WIPE_START
G1 F10480.96
G1 X92.583 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.173 Y102.369 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.49166
G1 F2670
M204 S6000
G1 X87.794 Y102.749 E.01601
; LINE_WIDTH: 0.472456
G1 X87.731 Y102.816 E.00262
; LINE_WIDTH: 0.438735
G1 X87.652 Y102.9 E.00307
; LINE_WIDTH: 0.397077
G1 X87.499 Y103.083 E.00563
; LINE_WIDTH: 0.381079
G2 X87.067 Y104.786 I1.37 J1.253 E.04137
G1 X87.089 Y104.856 E.00164
; LINE_WIDTH: 0.337902
G1 X87.12 Y104.945 E.00188
G2 X87.249 Y105.2 I1.509 J-.603 E.00566
; LINE_WIDTH: 0.294444
G1 X87.309 Y105.292 E.00186
G2 X87.384 Y105.389 I1.332 J-.954 E.00208
; LINE_WIDTH: 0.252874
G1 X87.468 Y105.486 E.00183
G2 X87.555 Y105.57 I1.08 J-1.034 E.00172
; LINE_WIDTH: 0.206908
G1 X87.608 Y105.616 E.00079
G2 X87.731 Y105.71 I1.365 J-1.655 E.00174
; LINE_WIDTH: 0.17339
G1 X87.811 Y105.761 E.00087
; LINE_WIDTH: 0.142631
G2 X87.984 Y105.855 I1.245 J-2.074 E.00139
; LINE_WIDTH: 0.103124
G2 X88.148 Y105.919 I.997 J-2.321 E.00079
M204 S10000
G1 X91.859 Y105.918 F42000
; LINE_WIDTH: 0.107996
G1 F2670
M204 S6000
G2 X92.025 Y105.851 I-.947 J-2.579 E.00086
G1 X92.06 Y105.834 E.00019
; LINE_WIDTH: 0.155321
G2 X92.247 Y105.725 I-.987 J-1.925 E.00171
; LINE_WIDTH: 0.197935
G2 X92.394 Y105.614 I-1.838 J-2.573 E.00196
; LINE_WIDTH: 0.238801
G2 X92.564 Y105.451 I-1.215 J-1.441 E.00315
; LINE_WIDTH: 0.286656
G2 X92.743 Y105.215 I-1.663 J-1.448 E.00486
; LINE_WIDTH: 0.335645
G2 X92.909 Y104.868 I-1.542 J-.948 E.00758
; LINE_WIDTH: 0.380822
G2 X92.783 Y103.497 I-1.589 J-.545 E.03204
G1 X92.462 Y103.034 E.01272
; LINE_WIDTH: 0.403888
G1 X92.338 Y102.889 E.00458
; LINE_WIDTH: 0.441852
G1 X92.265 Y102.812 E.00283
; LINE_WIDTH: 0.473232
G1 X92.205 Y102.749 E.00248
; LINE_WIDTH: 0.491709
G1 X91.826 Y102.369 E.01602
M204 S10000
G1 X92.44 Y102.691 F42000
; LINE_WIDTH: 0.442475
G1 F2670
M204 S6000
G1 X91.823 Y102.57 E.01672
; LINE_WIDTH: 0.418127
G1 X91.705 Y102.551 E.003
; LINE_WIDTH: 0.376212
G1 X91.566 Y102.529 E.00313
; LINE_WIDTH: 0.335156
G1 X91.37 Y102.509 E.00386
; LINE_WIDTH: 0.299255
G1 X91.186 Y102.501 E.00319
G2 X88.86 Y102.5 I-1.174 J63.158 E.04017
G2 X88.626 Y102.509 I.033 J3.775 E.00404
; LINE_WIDTH: 0.336134
G1 X88.428 Y102.53 E.00391
; LINE_WIDTH: 0.369646
G1 X88.342 Y102.543 E.0019
; LINE_WIDTH: 0.409988
G2 X87.569 Y102.677 I2.271 J15.339 E.01921
M204 S10000
G1 X87.416 Y102.175 F42000
; LINE_WIDTH: 0.461712
G1 F2670
M204 S6000
G1 X79.118 Y102.174 E.2312
G3 X78.71 Y102.145 I.187 J-5.521 E.01139
; WIPE_START
G1 F10529.374
G1 X79.118 Y102.174 E-.15529
G1 X80.709 Y102.174 E-.60471
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z1.56 F42000
G1 X78.71 Y73.855 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.462
G1 F2670
M204 S6000
G3 X79.118 Y73.826 I.595 J5.501 E.0114
G1 X93.79 Y73.825 E.40904
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10522.285
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/51
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.56 I-1.143 J.418 P1  F42000
G1 X100.423 Y97.415 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2670
M204 S5000
G1 X100.331 Y97.492 E.0027
G3 X99.776 Y96.263 I-.401 J-.559 E.05448
G1 X99.913 Y96.246 E.00308
G3 X100.462 Y97.369 I.017 J.688 E.03512
M204 S250
G1 X100.624 Y96.795 F42000
G1 F2670
M204 S5000
G1 X100.641 Y96.899 E.00237
G3 X99.953 Y96.225 I-.71 J.035 E.07617
G1 X100.018 Y96.23 E.00147
G3 X100.614 Y96.736 I-.086 J.705 E.01852
; WIPE_START
G1 F12000
M204 S6000
G1 X100.641 Y96.899 E-.06302
G1 X100.633 Y97.041 E-.05389
G1 X100.571 Y97.243 E-.08054
G1 X100.497 Y97.364 E-.05385
G1 X100.402 Y97.466 E-.0528
G1 X100.254 Y97.568 E-.06817
G1 X100.123 Y97.619 E-.05378
G1 X99.983 Y97.644 E-.05384
G1 X99.842 Y97.64 E-.05378
G1 X99.704 Y97.609 E-.0538
G1 X99.575 Y97.551 E-.05379
G1 X99.459 Y97.468 E-.05384
G1 X99.363 Y97.364 E-.05373
G1 X99.348 Y97.339 E-.01119
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
M73 P28 R7
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2670
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z1.72 F42000
G1 X94.99 Y80.71 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2670
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.673 Y88.269 Z1.72 F42000
G1 X88.654 Y102.86 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2670
M204 S6000
G1 X88.682 Y102.854 E.00079
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.527 Y102.885 I.017 J-1.511 E.11794
G1 X88.595 Y102.872 E.00188
M204 S250
G1 X88.733 Y103.253 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X88.737 Y103.252 E.0001
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.057 J1.109 E.08603
G1 X88.895 Y105.46 E.05565
G3 X88.419 Y103.35 I.007 J-1.11 E.07496
G1 X88.676 Y103.27 E.00678
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.737 Y103.252 E-.02431
G1 X90.673 Y103.243 E-.73569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.163 Y102.161 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2670
M204 S6000
G1 X92.332 Y102.161 E.00458
G1 X93.09 Y103.279 E.0366
G3 X91.492 Y106.189 I-1.591 J1.02 E.10981
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.279 I-.007 J-1.89 E.10983
G1 X87.668 Y102.161 E.0366
G1 X92.103 Y102.161 E.12017
; WIPE_START
G1 F10826.06
M73 P28 R6
G1 X92.332 Y102.161 E-.08699
G1 X93.09 Y103.279 E-.51333
G1 X93.224 Y103.527 E-.10708
G1 X93.273 Y103.656 E-.0526
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.256 E.01247
G1 X78.179 Y102.183 E.00851
G3 X77.49 Y101.305 I.228 J-.889 E.03017
G1 X77.49 Y74.692 E.66908
G3 X78.142 Y73.827 I.914 J.011 E.02916
G1 X78.51 Y73.74 E.00951
G1 X78.51 Y74.24 E.01257
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.648 Y73.791 E.19252
G3 X102.51 Y74.692 I-.054 J.914 E.0345
G1 X102.51 Y101.308 E.66914
G3 X101.647 Y102.209 I-.922 J-.019 E.03445
G1 X93.99 Y102.21 E.19252
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.107 Y102.59 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
G1 F2670
M204 S5000
G3 X93.733 Y103.795 I-2.677 J2.158 E.03436
G3 X91.497 Y106.59 I-2.241 J.5 E.10321
G1 X88.503 Y106.59 E.07529
G3 X86.573 Y103.062 I-.001 J-2.291 E.12335
G1 X86.893 Y102.59 E.01435
G1 X79.203 Y102.59 E.19336
G3 X77.11 Y100.497 I.004 J-2.096 E.08261
G1 X77.11 Y75.503 E.6284
G3 X79.203 Y73.41 I2.096 J.004 E.08261
G1 X100.804 Y73.41 E.54308
M73 P29 R6
G3 X102.89 Y75.503 I-.011 J2.097 E.08243
G1 X102.89 Y100.497 E.6284
G3 X100.797 Y102.59 I-2.096 J-.004 E.08261
G1 X93.167 Y102.59 E.19184
M204 S10000
G1 X92.584 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2670
M204 S6000
G1 X93.79 Y102.175 E.03376
; WIPE_START
G1 F10480.96
G1 X92.584 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.187 Y102.369 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.525619
G1 F2670
M204 S6000
G1 X87.853 Y102.691 E.01486
; LINE_WIDTH: 0.497236
G1 X87.765 Y102.781 E.00378
; LINE_WIDTH: 0.453326
G1 X87.678 Y102.871 E.00342
; LINE_WIDTH: 0.427272
G1 X87.658 Y102.893 E.00076
; LINE_WIDTH: 0.410632
G1 X87.579 Y102.988 E.00305
; LINE_WIDTH: 0.381328
G1 X87.499 Y103.083 E.00281
G2 X87.045 Y104.709 I1.375 J1.26 E.03963
G1 X87.089 Y104.858 E.00352
; LINE_WIDTH: 0.33759
G1 X87.12 Y104.946 E.00183
G2 X87.249 Y105.202 I1.7 J-.696 E.00567
; LINE_WIDTH: 0.293778
G1 X87.261 Y105.221 E.00039
G2 X87.384 Y105.391 I2.192 J-1.46 E.00354
; LINE_WIDTH: 0.252416
G1 X87.557 Y105.571 E.00355
; LINE_WIDTH: 0.206974
G1 X87.731 Y105.709 E.0025
; LINE_WIDTH: 0.1642
G2 X87.895 Y105.81 I1.865 J-2.848 E.00164
; LINE_WIDTH: 0.121512
G2 X88.064 Y105.889 I1.715 J-3.457 E.00106
; LINE_WIDTH: 0.0928905
G1 X88.142 Y105.918 E.00032
M204 S10000
G1 X91.852 Y105.919 F42000
; LINE_WIDTH: 0.107533
G1 F2670
M204 S6000
G2 X92.016 Y105.855 I-.891 J-2.526 E.00084
G1 X92.06 Y105.833 E.00023
; LINE_WIDTH: 0.155355
G2 X92.247 Y105.725 I-.982 J-1.915 E.00171
; LINE_WIDTH: 0.197845
G2 X92.393 Y105.614 I-1.854 J-2.596 E.00195
; LINE_WIDTH: 0.238725
G2 X92.564 Y105.451 I-1.226 J-1.453 E.00315
; LINE_WIDTH: 0.286968
G2 X92.737 Y105.224 I-1.663 J-1.45 E.0047
G1 X92.746 Y105.21 E.00028
; LINE_WIDTH: 0.336079
G2 X92.908 Y104.87 I-1.562 J-.95 E.00742
; LINE_WIDTH: 0.380902
G2 X92.734 Y103.416 I-1.599 J-.546 E.03422
G1 X92.52 Y103.108 E.00847
; LINE_WIDTH: 0.386875
G1 X92.389 Y102.947 E.00477
; LINE_WIDTH: 0.430017
G1 X92.273 Y102.819 E.00447
; LINE_WIDTH: 0.4743
G1 X92.193 Y102.738 E.00326
; LINE_WIDTH: 0.512823
G1 X92.128 Y102.672 E.00288
; LINE_WIDTH: 0.550432
G2 X91.786 Y102.369 I-5.076 J5.367 E.01538
M204 S10000
G1 X92.443 Y102.695 F42000
; LINE_WIDTH: 0.447052
G1 F2670
M204 S6000
G1 X91.833 Y102.572 E.01673
; LINE_WIDTH: 0.420597
G1 X91.71 Y102.552 E.00315
; LINE_WIDTH: 0.377009
G1 X91.566 Y102.529 E.00325
; LINE_WIDTH: 0.335136
G1 X91.37 Y102.509 E.00386
; LINE_WIDTH: 0.299262
G1 X91.186 Y102.501 E.00319
G2 X88.86 Y102.5 I-1.174 J63.164 E.04018
G2 X88.626 Y102.509 I.033 J3.766 E.00404
; LINE_WIDTH: 0.3361
G1 X88.428 Y102.53 E.00391
; LINE_WIDTH: 0.369584
G1 X88.342 Y102.543 E.0019
; LINE_WIDTH: 0.409899
G2 X87.57 Y102.677 I2.297 J15.526 E.01921
M204 S10000
G1 X87.416 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2670
M204 S6000
G1 X79.118 Y102.174 E.2312
G3 X78.71 Y102.145 I.188 J-5.547 E.01139
; WIPE_START
G1 F10529.365
G1 X79.118 Y102.174 E-.15533
G1 X80.709 Y102.174 E-.60467
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z1.72 F42000
G1 X78.71 Y73.855 Z1.72
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.46198
G1 F2670
M204 S6000
G3 X79.118 Y73.826 I.594 J5.49 E.0114
G1 X93.79 Y73.825 E.40901
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10522.768
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/51
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.72 I-1.143 J.418 P1  F42000
G1 X100.425 Y97.413 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2670
M204 S5000
G1 X100.331 Y97.493 E.00276
G3 X99.776 Y96.263 I-.401 J-.559 E.05452
G1 X99.913 Y96.246 E.00307
G3 X100.464 Y97.368 I.017 J.688 E.03509
M204 S250
G1 X100.626 Y96.803 F42000
G1 F2670
M204 S5000
G1 X100.642 Y96.899 E.0022
G3 X99.954 Y96.225 I-.71 J.035 E.07618
G1 X100.018 Y96.23 E.00145
G3 X100.617 Y96.744 I-.086 J.705 E.01871
; WIPE_START
G1 F12000
M204 S6000
G1 X100.642 Y96.899 E-.06002
G1 X100.626 Y97.078 E-.06819
G1 X100.585 Y97.211 E-.05286
G1 X100.517 Y97.336 E-.05383
G1 X100.427 Y97.444 E-.05375
G1 X100.316 Y97.532 E-.05383
G1 X100.19 Y97.597 E-.05387
G1 X100.053 Y97.635 E-.05375
G1 X99.842 Y97.64 E-.08054
G1 X99.637 Y97.583 E-.08057
G1 X99.515 Y97.512 E-.05377
G1 X99.409 Y97.419 E-.05376
G1 X99.343 Y97.332 E-.04127
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z1.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2670
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z1.88 F42000
G1 X94.99 Y80.71 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2670
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.674 Y88.269 Z1.88 F42000
G1 X88.655 Y102.862 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2670
M204 S6000
G1 X88.742 Y102.846 E.00238
G1 X91.183 Y102.84 E.06615
G3 X91.123 Y105.861 I-.085 J1.509 E.12569
G1 X88.885 Y105.861 E.06065
G3 X88.534 Y102.884 I.019 J-1.511 E.11807
G1 X88.596 Y102.872 E.00171
M204 S250
G1 X88.725 Y103.256 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X88.787 Y103.245 E.00158
G1 X91.158 Y103.241 E.05961
G3 X91.108 Y105.46 I-.059 J1.109 E.08596
G1 X88.895 Y105.46 E.05565
G3 X88.629 Y103.274 I.008 J-1.11 E.08052
G1 X88.666 Y103.267 E.00095
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.787 Y103.245 E-.04667
G1 X90.664 Y103.242 E-.71333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.163 Y102.161 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2670
M204 S6000
G1 X92.332 Y102.161 E.00458
G1 X93.089 Y103.279 E.03659
G3 X91.492 Y106.189 I-1.591 J1.02 E.10982
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.279 I-.007 J-1.89 E.10984
G1 X87.668 Y102.161 E.03659
G1 X92.103 Y102.161 E.12016
; WIPE_START
G1 F10826.06
G1 X92.332 Y102.161 E-.087
G1 X93.089 Y103.279 E-.51319
G1 X93.224 Y103.527 E-.10722
G1 X93.273 Y103.656 E-.05259
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.256 E.01248
G1 X78.179 Y102.183 E.00852
M73 P30 R6
G3 X77.49 Y101.305 I.228 J-.889 E.03016
G1 X77.49 Y74.692 E.66909
G3 X78.14 Y73.828 I.915 J.011 E.02908
G1 X78.51 Y73.739 E.00957
G1 X78.51 Y74.24 E.01258
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.645 Y73.791 E.19245
G3 X102.51 Y74.692 I-.05 J.914 E.03457
G1 X102.51 Y101.308 E.66914
G3 X101.648 Y102.209 I-.928 J-.025 E.0344
G1 X93.99 Y102.21 E.19252
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.107 Y102.59 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
G1 F2670
M204 S5000
G3 X93.733 Y103.794 I-2.678 J2.159 E.03436
G3 X91.497 Y106.59 I-2.241 J.5 E.10322
G1 X88.503 Y106.59 E.07529
G3 X86.573 Y103.062 I-.001 J-2.291 E.12336
G1 X86.893 Y102.59 E.01434
G1 X79.203 Y102.59 E.19336
G3 X77.11 Y100.497 I.004 J-2.096 E.08261
G1 X77.11 Y75.503 E.6284
G3 X79.203 Y73.41 I2.096 J.004 E.08261
G1 X100.807 Y73.41 E.54315
G3 X102.89 Y75.503 I-.012 J2.096 E.08238
G1 X102.89 Y100.497 E.6284
G3 X100.797 Y102.59 I-2.096 J-.004 E.08261
G1 X93.167 Y102.59 E.19184
M204 S10000
G1 X92.584 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2670
M204 S6000
G1 X93.79 Y102.175 E.03376
; WIPE_START
G1 F10480.96
G1 X92.584 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.174 Y102.369 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.491778
G1 F2670
M204 S6000
G1 X87.794 Y102.749 E.01602
; LINE_WIDTH: 0.473317
G1 X87.735 Y102.812 E.00248
; LINE_WIDTH: 0.441918
G1 X87.662 Y102.889 E.00283
; LINE_WIDTH: 0.402314
G2 X87.529 Y103.045 I2.448 J2.221 E.00491
; LINE_WIDTH: 0.380302
G2 X87.001 Y104.326 I1.531 J1.381 E.03188
G2 X87.113 Y104.924 I1.859 J-.039 E.01378
; LINE_WIDTH: 0.333213
G1 X87.162 Y105.04 E.00246
G2 X87.25 Y105.204 I2.299 J-1.132 E.00361
; LINE_WIDTH: 0.287669
G2 X87.435 Y105.448 I1.246 J-.75 E.00507
; LINE_WIDTH: 0.247015
G1 X87.544 Y105.561 E.00218
; LINE_WIDTH: 0.207921
G2 X87.733 Y105.711 I1.409 J-1.581 E.00274
; LINE_WIDTH: 0.159513
G1 X87.921 Y105.823 E.00178
; LINE_WIDTH: 0.10963
G1 X87.943 Y105.835 E.00012
G2 X88.142 Y105.918 I.778 J-1.588 E.00106
M204 S10000
G1 X91.852 Y105.919 F42000
; LINE_WIDTH: 0.103228
G1 F2670
M204 S6000
G2 X92.015 Y105.856 I-.888 J-2.517 E.00079
G1 X92.021 Y105.853 E.00003
; LINE_WIDTH: 0.144413
G2 X92.2 Y105.755 I-1.099 J-2.221 E.00147
; LINE_WIDTH: 0.19123
G2 X92.394 Y105.616 I-1.623 J-2.467 E.00245
; LINE_WIDTH: 0.242456
G2 X92.564 Y105.451 I-3.574 J-3.863 E.00321
G1 X92.587 Y105.425 E.00047
; LINE_WIDTH: 0.290079
G2 X92.705 Y105.273 I-2.092 J-1.743 E.00321
G1 X92.75 Y105.202 E.00139
; LINE_WIDTH: 0.336965
G2 X92.907 Y104.871 I-1.354 J-.849 E.00725
; LINE_WIDTH: 0.380882
G2 X92.734 Y103.416 I-1.598 J-.548 E.03425
G1 X92.52 Y103.108 E.00846
; LINE_WIDTH: 0.386862
G1 X92.389 Y102.947 E.00477
; LINE_WIDTH: 0.429964
G1 X92.273 Y102.819 E.00446
; LINE_WIDTH: 0.474216
G1 X92.193 Y102.738 E.00327
; LINE_WIDTH: 0.51278
G1 X92.128 Y102.672 E.00289
; LINE_WIDTH: 0.550437
G2 X91.786 Y102.369 I-5.096 J5.389 E.01538
M204 S10000
G1 X92.446 Y102.7 F42000
; LINE_WIDTH: 0.452645
G1 F2670
M204 S6000
G1 X91.848 Y102.575 E.01666
; LINE_WIDTH: 0.431214
G1 X91.757 Y102.559 E.00238
; LINE_WIDTH: 0.396281
G1 X91.649 Y102.54 E.00258
; LINE_WIDTH: 0.353015
G2 X91.449 Y102.516 I-.496 J3.223 E.00419
; LINE_WIDTH: 0.299594
G2 X91.196 Y102.501 I-.371 J4.049 E.00438
G2 X88.874 Y102.5 I-1.181 J94.141 E.04016
G1 X88.695 Y102.505 E.00309
; LINE_WIDTH: 0.32995
G2 X88.438 Y102.528 I.242 J4.13 E.00496
; LINE_WIDTH: 0.368043
G1 X88.342 Y102.543 E.00211
; LINE_WIDTH: 0.413451
G2 X87.566 Y102.682 I1.828 J12.447 E.01949
M204 S10000
G1 X87.416 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2670
M204 S6000
G1 X79.118 Y102.174 E.2312
G3 X78.71 Y102.145 I.189 J-5.549 E.01139
; WIPE_START
G1 F10529.364
G1 X79.118 Y102.174 E-.15528
G1 X80.709 Y102.174 E-.60472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z1.88 F42000
G1 X78.71 Y73.855 Z1.88
G1 Z1.48
M73 P31 R6
G1 E.8 F1800
; LINE_WIDTH: 0.461961
G1 F2670
M204 S6000
G3 X79.118 Y73.826 I.595 J5.501 E.0114
G1 X93.79 Y73.825 E.40899
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10523.247
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/51
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.88 I-1.136 J.436 P1  F42000
G1 X100.608 Y96.821 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.618 Y96.935 E.00256
G3 X99.776 Y96.263 I-.689 J-.001 E.06912
G1 X99.913 Y96.246 E.00308
G3 X100.597 Y96.762 I.017 J.688 E.0207
M204 S250
G1 X100.43 Y97.438 F42000
G1 F2669
M204 S5000
G1 X100.424 Y97.444 E.00021
G3 X99.914 Y96.224 I-.495 J-.51 E.06189
G1 X99.95 Y96.224 E.0008
G3 X100.569 Y97.242 I-.021 J.71 E.03162
G1 X100.465 Y97.389 E.00402
; WIPE_START
G1 F12000
M204 S6000
G1 X100.424 Y97.444 E-.02623
G1 X100.316 Y97.532 E-.05291
G1 X100.19 Y97.597 E-.05381
G1 X100.054 Y97.635 E-.0538
G1 X99.912 Y97.646 E-.05383
G1 X99.772 Y97.628 E-.05382
G1 X99.638 Y97.583 E-.05374
G1 X99.515 Y97.512 E-.05382
G1 X99.409 Y97.419 E-.05383
G1 X99.323 Y97.306 E-.05379
G1 X99.262 Y97.178 E-.0538
G1 X99.227 Y97.041 E-.05381
G1 X99.22 Y96.9 E-.0538
G1 X99.241 Y96.76 E-.05381
G1 X99.273 Y96.672 E-.03521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z2.04 F42000
G1 X94.99 Y80.71 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.672 Y88.268 Z2.04 F42000
G1 X88.649 Y102.863 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.742 Y102.846 E.00257
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X88.535 Y102.885 I.027 J-1.512 E.11766
G1 X88.59 Y102.874 E.00151
M204 S250
G1 X88.718 Y103.258 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.787 Y103.245 E.00176
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.061 J1.109 E.08581
G1 X88.895 Y105.46 E.05565
G3 X88.629 Y103.275 I.014 J-1.111 E.08025
G1 X88.659 Y103.269 E.00077
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.787 Y103.245 E-.04934
G1 X90.657 Y103.242 E-.71066
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.163 Y102.161 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.332 Y102.161 E.00458
G1 X93.089 Y103.279 E.03659
G3 X91.492 Y106.189 I-1.592 J1.02 E.10982
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.279 I-.007 J-1.89 E.10984
G1 X87.668 Y102.161 E.03659
G1 X92.103 Y102.161 E.12017
; WIPE_START
G1 F10826.06
G1 X92.332 Y102.161 E-.08698
G1 X93.089 Y103.279 E-.51318
G1 X93.224 Y103.527 E-.1072
G1 X93.273 Y103.656 E-.05263
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.255 E.01245
G1 X78.179 Y102.183 E.00851
G3 X77.49 Y101.305 I.228 J-.889 E.03016
G1 X77.49 Y74.692 E.6691
G3 X78.139 Y73.828 I.918 J.014 E.02905
G1 X78.51 Y73.739 E.00959
G1 X78.51 Y74.24 E.01259
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.645 Y73.791 E.19245
G3 X102.51 Y74.692 I-.05 J.914 E.03458
G1 X102.51 Y101.308 E.66914
G3 X101.645 Y102.209 I-.928 J-.025 E.03446
G1 X93.99 Y102.21 E.19246
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
M73 P32 R6
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.107 Y102.59 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.794 I-2.68 J2.16 E.03435
G3 X91.497 Y106.59 I-2.241 J.5 E.10322
G1 X88.503 Y106.59 E.07529
G3 X86.573 Y103.062 I-.001 J-2.291 E.12336
G1 X86.893 Y102.59 E.01434
G1 X79.203 Y102.59 E.19335
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08261
G1 X100.809 Y73.41 E.54321
G3 X102.89 Y75.503 I-.016 J2.097 E.0823
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.167 Y102.59 E.19184
M204 S10000
G1 X92.584 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03375
; WIPE_START
G1 F10480.96
G1 X92.584 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.178 Y102.369 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.496567
G1 F2669
M204 S6000
G1 X87.802 Y102.741 E.01596
; LINE_WIDTH: 0.475924
G1 X87.738 Y102.808 E.00265
; LINE_WIDTH: 0.44284
G1 X87.662 Y102.889 E.00298
; LINE_WIDTH: 0.403993
G1 X87.538 Y103.034 E.00458
; LINE_WIDTH: 0.380277
G2 X87.001 Y104.302 I1.538 J1.4 E.03165
G2 X87.112 Y104.924 I1.769 J.006 E.01435
; LINE_WIDTH: 0.328051
G1 X87.12 Y104.945 E.00043
G2 X87.29 Y105.265 I1.688 J-.695 E.00694
; LINE_WIDTH: 0.287456
G1 X87.384 Y105.39 E.00259
; LINE_WIDTH: 0.252064
G1 X87.56 Y105.573 E.00361
; LINE_WIDTH: 0.20682
G1 X87.73 Y105.709 E.00244
; LINE_WIDTH: 0.1731
G1 X87.82 Y105.768 E.00097
; LINE_WIDTH: 0.136789
G1 X88.017 Y105.869 E.00148
; LINE_WIDTH: 0.0978269
G1 X88.142 Y105.918 E.00056
M204 S10000
G1 X91.861 Y105.918 F42000
; LINE_WIDTH: 0.104181
G1 F2669
M204 S6000
G2 X92.026 Y105.85 I-.982 J-2.642 E.00081
; LINE_WIDTH: 0.14532
G2 X92.2 Y105.755 I-.961 J-1.955 E.00143
; LINE_WIDTH: 0.191047
G2 X92.394 Y105.616 I-1.383 J-2.133 E.00244
; LINE_WIDTH: 0.241974
G2 X92.564 Y105.451 I-3.311 J-3.596 E.00321
G1 X92.584 Y105.429 E.00039
; LINE_WIDTH: 0.290016
G2 X92.736 Y105.226 I-4.423 J-3.466 E.00422
G1 X92.75 Y105.203 E.00046
; LINE_WIDTH: 0.336816
G2 X92.905 Y104.873 I-1.316 J-.819 E.00721
; LINE_WIDTH: 0.380686
G2 X92.783 Y103.497 I-1.576 J-.553 E.03215
G1 X92.462 Y103.034 E.01272
; LINE_WIDTH: 0.403981
G1 X92.338 Y102.889 E.00458
; LINE_WIDTH: 0.441976
G1 X92.265 Y102.812 E.00283
; LINE_WIDTH: 0.473387
G1 X92.206 Y102.749 E.00248
; LINE_WIDTH: 0.491879
G1 X91.826 Y102.369 E.01602
M204 S10000
G1 X92.443 Y102.696 F42000
; LINE_WIDTH: 0.447828
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01665
; LINE_WIDTH: 0.428656
G1 X91.753 Y102.558 E.00222
; LINE_WIDTH: 0.39577
G1 X91.651 Y102.541 E.00244
; LINE_WIDTH: 0.358305
G1 X91.491 Y102.521 E.00341
; LINE_WIDTH: 0.300055
G1 X91.186 Y102.501 E.00529
G2 X88.874 Y102.5 I-1.176 J93.576 E.04005
G1 X88.695 Y102.505 E.0031
; LINE_WIDTH: 0.329932
G2 X88.438 Y102.528 I.243 J4.143 E.00496
; LINE_WIDTH: 0.367278
G1 X88.348 Y102.542 E.002
; LINE_WIDTH: 0.409742
G2 X87.569 Y102.677 I2.285 J15.46 E.01933
M204 S10000
G1 X87.416 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.2312
G3 X78.71 Y102.145 I.19 J-5.571 E.01139
; WIPE_START
G1 F10529.357
G1 X79.118 Y102.174 E-.15528
G1 X80.709 Y102.174 E-.60472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z2.04 F42000
G1 X78.71 Y73.855 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.461941
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.597 J5.527 E.0114
G1 X93.79 Y73.825 E.40898
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10523.727
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/51
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.04 I-1.136 J.436 P1  F42000
G1 X100.607 Y96.824 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.617 Y96.901 E.00173
G3 X99.777 Y96.263 I-.687 J.033 E.06982
G1 X99.913 Y96.246 E.00307
G3 X100.597 Y96.765 I.017 J.688 E.02075
M204 S250
G1 X100.422 Y97.445 F42000
G1 F2669
M204 S5000
G1 X100.396 Y97.463 E.0007
G3 X99.914 Y96.224 I-.468 J-.531 E.06091
G1 X99.951 Y96.224 E.00082
G3 X100.492 Y97.361 I-.023 J.708 E.03468
G1 X100.46 Y97.399 E.00111
; WIPE_START
G1 F12000
M204 S6000
G1 X100.396 Y97.463 E-.0345
G1 X100.286 Y97.551 E-.05359
G1 X100.156 Y97.609 E-.05381
G1 X99.91 Y97.646 E-.09474
G1 X99.772 Y97.628 E-.05294
G1 X99.638 Y97.583 E-.05369
G1 X99.515 Y97.512 E-.05387
G1 X99.409 Y97.419 E-.05379
G1 X99.323 Y97.306 E-.05384
G1 X99.262 Y97.178 E-.05372
G1 X99.227 Y97.041 E-.05383
G1 X99.22 Y96.9 E-.05374
G1 X99.241 Y96.759 E-.05393
G1 X99.277 Y96.66 E-.04
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z2.2 F42000
G1 X94.99 Y80.71 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.663 Y88.266 Z2.2 F42000
G1 X88.618 Y102.876 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.749 Y102.846 E.00365
G1 X91.175 Y102.84 E.06573
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.39 Y102.927 I.016 J-1.511 E.11409
M73 P33 R6
G1 X88.559 Y102.889 E.0047
M204 S250
G1 X88.705 Y103.264 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.789 Y103.245 E.00217
G1 X91.155 Y103.241 E.05948
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.523 Y103.306 I.006 J-1.11 E.07784
G1 X88.647 Y103.278 E.0032
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.789 Y103.245 E-.05562
G1 X90.643 Y103.242 E-.70438
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.163 Y102.161 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.332 Y102.161 E.00458
G1 X93.089 Y103.279 E.03659
G3 X91.492 Y106.189 I-1.592 J1.02 E.10981
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.279 I-.007 J-1.89 E.10984
G1 X87.668 Y102.161 E.03659
G1 X92.103 Y102.161 E.12017
; WIPE_START
G1 F10826.06
G1 X92.332 Y102.161 E-.08698
G1 X93.089 Y103.279 E-.51319
G1 X93.224 Y103.526 E-.10705
G1 X93.273 Y103.656 E-.05278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.256 E.01248
G1 X78.179 Y102.183 E.00853
G3 X77.49 Y101.308 I.229 J-.889 E.03009
G1 X77.49 Y74.692 E.66916
G3 X78.139 Y73.828 I.914 J.011 E.02908
G1 X78.51 Y73.739 E.00958
G1 X78.51 Y74.24 E.01259
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.645 Y73.791 E.19245
G3 X102.51 Y74.692 I-.05 J.914 E.03457
G1 X102.51 Y101.308 E.66914
G3 X101.647 Y102.209 I-.922 J-.019 E.03445
G1 X93.99 Y102.21 E.19252
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.107 Y102.59 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.794 I-2.68 J2.16 E.03435
G3 X91.497 Y106.59 I-2.241 J.5 E.10322
G1 X88.503 Y106.59 E.07529
G3 X86.574 Y103.062 I-.001 J-2.291 E.12336
G1 X86.893 Y102.59 E.01433
G1 X79.203 Y102.59 E.19335
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.812 Y73.41 E.54327
G3 X102.89 Y75.503 I-.018 J2.097 E.08224
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.167 Y102.59 E.19184
M204 S10000
M73 P34 R6
G1 X92.584 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03375
; WIPE_START
G1 F10480.96
G1 X92.584 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.178 Y102.369 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.496656
G1 F2669
M204 S6000
G1 X87.802 Y102.741 E.01596
; LINE_WIDTH: 0.475965
G1 X87.738 Y102.808 E.00265
; LINE_WIDTH: 0.442797
G1 X87.662 Y102.89 E.00298
; LINE_WIDTH: 0.403948
G1 X87.538 Y103.034 E.00458
; LINE_WIDTH: 0.380245
G2 X87.001 Y104.304 I1.537 J1.399 E.03169
G1 X87.001 Y104.326 E.00051
G2 X87.112 Y104.924 I1.761 J-.02 E.01377
; LINE_WIDTH: 0.333212
G1 X87.162 Y105.041 E.00249
G2 X87.25 Y105.204 I2.321 J-1.145 E.0036
; LINE_WIDTH: 0.288391
G1 X87.35 Y105.348 E.00291
G2 X87.425 Y105.438 I1.244 J-.968 E.00194
; LINE_WIDTH: 0.245795
G1 X87.43 Y105.444 E.00011
G2 X87.561 Y105.576 I1.394 J-1.251 E.00256
; LINE_WIDTH: 0.206349
G1 X87.729 Y105.708 E.0024
; LINE_WIDTH: 0.173035
G1 X87.82 Y105.768 E.00098
; LINE_WIDTH: 0.136784
G1 X88.016 Y105.869 E.00147
; LINE_WIDTH: 0.0978403
G1 X88.142 Y105.918 E.00056
M204 S10000
G1 X91.852 Y105.919 F42000
; LINE_WIDTH: 0.103123
G1 F2669
M204 S6000
G2 X92.015 Y105.856 I-.897 J-2.535 E.00078
G1 X92.02 Y105.853 E.00003
; LINE_WIDTH: 0.144247
G2 X92.199 Y105.755 I-1.08 J-2.191 E.00146
; LINE_WIDTH: 0.191164
G2 X92.394 Y105.616 I-1.688 J-2.558 E.00245
; LINE_WIDTH: 0.239431
G2 X92.564 Y105.451 I-3.661 J-3.952 E.00316
; LINE_WIDTH: 0.286457
G2 X92.743 Y105.215 I-1.649 J-1.436 E.00487
; LINE_WIDTH: 0.335216
G2 X92.906 Y104.875 I-1.559 J-.955 E.0074
; LINE_WIDTH: 0.380827
G2 X92.734 Y103.416 I-1.596 J-.552 E.03434
G1 X92.52 Y103.108 E.00846
; LINE_WIDTH: 0.386886
G1 X92.389 Y102.947 E.00477
; LINE_WIDTH: 0.429925
G1 X92.274 Y102.819 E.00444
; LINE_WIDTH: 0.470707
G1 X92.207 Y102.751 E.00273
; LINE_WIDTH: 0.502434
G1 X92.153 Y102.698 E.0023
; LINE_WIDTH: 0.519925
G1 X91.815 Y102.369 E.01495
M204 S10000
G1 X92.443 Y102.696 F42000
; LINE_WIDTH: 0.447861
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01665
; LINE_WIDTH: 0.428716
G1 X91.753 Y102.558 E.00222
; LINE_WIDTH: 0.395825
G1 X91.651 Y102.541 E.00244
; LINE_WIDTH: 0.358457
G1 X91.492 Y102.521 E.00339
; LINE_WIDTH: 0.301483
G1 X91.186 Y102.501 E.00534
G2 X88.873 Y102.5 I-1.177 J94.01 E.04028
G1 X88.708 Y102.505 E.00287
G2 X88.508 Y102.52 I.149 J3.208 E.0035
; LINE_WIDTH: 0.353909
G1 X88.39 Y102.536 E.00249
; LINE_WIDTH: 0.403921
G2 X87.573 Y102.671 I1.765 J13.222 E.01995
M204 S10000
G1 X87.416 Y102.175 F42000
; LINE_WIDTH: 0.461712
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23119
G3 X78.71 Y102.145 I.187 J-5.532 E.01139
; WIPE_START
G1 F10529.367
G1 X79.118 Y102.174 E-.15534
G1 X80.709 Y102.174 E-.60466
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z2.2 F42000
G1 X78.71 Y73.855 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.461922
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.597 J5.539 E.01139
G1 X93.79 Y73.825 E.40897
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10524.206
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/51
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I-1.136 J.436 P1  F42000
G1 X100.608 Y96.83 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.616 Y96.901 E.00159
G3 X99.777 Y96.263 I-.687 J.032 E.06976
G1 X99.913 Y96.246 E.00307
G3 X100.597 Y96.765 I.017 J.687 E.02076
G1 X100.598 Y96.771 E.00012
M204 S250
G1 X100.432 Y97.437 F42000
G1 F2669
M204 S5000
G1 X100.423 Y97.441 E.00021
G3 X99.914 Y96.224 I-.495 J-.508 E.06181
G1 X99.952 Y96.224 E.00085
G3 X100.514 Y97.333 I-.024 J.709 E.0339
G1 X100.469 Y97.39 E.00162
; WIPE_START
G1 F12000
M204 S6000
G1 X100.423 Y97.441 E-.02593
G1 X100.316 Y97.532 E-.05371
G1 X100.19 Y97.597 E-.05376
G1 X100.053 Y97.635 E-.05385
G1 X99.912 Y97.646 E-.05378
G1 X99.772 Y97.628 E-.05378
G1 X99.638 Y97.583 E-.0538
G1 X99.515 Y97.512 E-.05379
G1 X99.409 Y97.419 E-.0538
G1 X99.323 Y97.306 E-.05381
G1 X99.262 Y97.178 E-.05378
G1 X99.227 Y97.041 E-.05382
G1 X99.22 Y96.9 E-.05378
G1 X99.241 Y96.76 E-.05385
G1 X99.272 Y96.674 E-.03477
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z2.36 F42000
G1 X94.99 Y80.71 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.656 Y88.264 Z2.36 F42000
G1 X88.596 Y102.876 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.682 Y102.854 E.0024
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X88.383 Y102.93 I.017 J-1.511 E.11385
G1 X88.538 Y102.89 E.00433
M204 S250
G1 X88.694 Y103.263 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.737 Y103.252 E.00111
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.52 Y103.307 I.007 J-1.11 E.07774
G1 X88.636 Y103.277 E.003
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.737 Y103.252 E-.03961
G1 X90.633 Y103.243 E-.72039
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.163 Y102.161 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.332 Y102.161 E.00458
G1 X93.089 Y103.278 E.03658
G3 X91.492 Y106.189 I-1.591 J1.02 E.10982
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.278 I-.007 J-1.89 E.10985
G1 X87.668 Y102.161 E.03658
G1 X92.103 Y102.161 E.12018
; WIPE_START
G1 F10826.06
G1 X92.332 Y102.161 E-.08697
G1 X93.089 Y103.278 E-.51304
G1 X93.224 Y103.527 E-.10724
G1 X93.273 Y103.656 E-.05275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.256 E.01248
G1 X78.179 Y102.183 E.00852
G3 X77.49 Y101.305 I.229 J-.889 E.03016
G1 X77.49 Y74.692 E.66908
G3 X78.139 Y73.828 I.915 J.011 E.02908
G1 X78.51 Y73.739 E.00959
G1 X78.51 Y74.24 E.01259
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19252
M73 P35 R6
G3 X102.51 Y74.692 I-.053 J.914 E.03451
G1 X102.51 Y101.305 E.66907
G3 X101.647 Y102.209 I-.929 J-.022 E.03446
G1 X93.99 Y102.21 E.19252
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.107 Y102.59 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.794 I-2.681 J2.161 E.03435
G3 X91.497 Y106.59 I-2.241 J.5 E.10322
G1 X88.503 Y106.59 E.07529
G3 X86.574 Y103.062 I-.001 J-2.291 E.12337
G1 X86.893 Y102.59 E.01433
G1 X79.203 Y102.59 E.19335
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.814 Y73.41 E.54333
G3 X102.89 Y75.503 I-.02 J2.096 E.08219
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.167 Y102.59 E.19184
M204 S10000
G1 X92.584 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03375
; WIPE_START
G1 F10480.96
G1 X92.584 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.178 Y102.369 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.496694
G1 F2669
M204 S6000
G1 X87.802 Y102.741 E.01596
; LINE_WIDTH: 0.476007
G1 X87.738 Y102.808 E.00265
; LINE_WIDTH: 0.442851
G1 X87.662 Y102.889 E.00298
; LINE_WIDTH: 0.402382
G2 X87.529 Y103.045 I2.419 J2.196 E.00491
; LINE_WIDTH: 0.380282
G2 X87.001 Y104.302 I1.54 J1.387 E.03132
G2 X87.111 Y104.924 I1.821 J-.003 E.01433
; LINE_WIDTH: 0.328093
G1 X87.12 Y104.945 E.00045
G2 X87.29 Y105.265 I1.684 J-.692 E.00694
; LINE_WIDTH: 0.287449
G1 X87.384 Y105.39 E.00259
; LINE_WIDTH: 0.251674
G1 X87.564 Y105.576 E.00366
; LINE_WIDTH: 0.21401
G1 X87.67 Y105.667 E.00164
; LINE_WIDTH: 0.173909
G2 X87.871 Y105.797 I1.372 J-1.9 E.00217
; LINE_WIDTH: 0.127724
G2 X88.039 Y105.878 I.762 J-1.357 E.00114
; LINE_WIDTH: 0.0976806
G1 X88.148 Y105.919 E.00048
M204 S10000
G1 X91.852 Y105.919 F42000
; LINE_WIDTH: 0.103075
G1 F2669
M204 S6000
G2 X92.015 Y105.856 I-.899 J-2.54 E.00078
G1 X92.02 Y105.853 E.00003
; LINE_WIDTH: 0.144259
G2 X92.2 Y105.755 I-1.064 J-2.162 E.00147
; LINE_WIDTH: 0.191217
G2 X92.394 Y105.616 I-1.734 J-2.621 E.00245
; LINE_WIDTH: 0.242425
G2 X92.565 Y105.451 I-3.752 J-4.045 E.00322
G1 X92.587 Y105.425 E.00046
; LINE_WIDTH: 0.290063
G2 X92.705 Y105.273 I-2.119 J-1.763 E.00321
G1 X92.75 Y105.202 E.00139
; LINE_WIDTH: 0.336915
G2 X92.904 Y104.876 I-1.226 J-.781 E.00713
; LINE_WIDTH: 0.380639
G2 X92.783 Y103.497 I-1.575 J-.557 E.03224
G1 X92.462 Y103.034 E.01272
; LINE_WIDTH: 0.404015
G1 X92.338 Y102.889 E.00458
; LINE_WIDTH: 0.442026
G1 X92.265 Y102.812 E.00283
; LINE_WIDTH: 0.473446
G1 X92.205 Y102.749 E.00248
; LINE_WIDTH: 0.491932
G1 X91.827 Y102.369 E.01601
M204 S10000
G1 X92.443 Y102.695 F42000
; LINE_WIDTH: 0.447851
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01665
; LINE_WIDTH: 0.42867
G1 X91.753 Y102.558 E.00222
; LINE_WIDTH: 0.395806
G1 X91.651 Y102.541 E.00243
; LINE_WIDTH: 0.358662
G1 X91.494 Y102.521 E.00335
; LINE_WIDTH: 0.30049
G1 X91.186 Y102.501 E.00535
G2 X88.86 Y102.5 I-1.174 J63.163 E.04036
G2 X88.626 Y102.509 I.033 J3.77 E.00406
; LINE_WIDTH: 0.336123
G1 X88.428 Y102.53 E.00391
; LINE_WIDTH: 0.369613
G1 X88.342 Y102.543 E.0019
; LINE_WIDTH: 0.409914
G2 X87.57 Y102.677 I2.336 J15.77 E.0192
M204 S10000
G1 X87.416 Y102.175 F42000
; LINE_WIDTH: 0.461712
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.2312
G3 X78.71 Y102.145 I.189 J-5.556 E.01139
; WIPE_START
G1 F10529.37
G1 X79.118 Y102.174 E-.15529
G1 X80.709 Y102.174 E-.60471
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z2.36 F42000
G1 X78.71 Y73.855 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.461903
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.597 J5.533 E.01139
G1 X93.79 Y73.825 E.40895
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10524.677
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/51
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.36 I-1.136 J.436 P1  F42000
G1 X100.609 Y96.837 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.619 Y96.901 E.00143
G3 X99.787 Y96.261 I-.688 J.033 E.07007
G1 X99.913 Y96.246 E.00285
G3 X100.599 Y96.765 I.018 J.688 E.02078
G1 X100.601 Y96.778 E.0003
M204 S250
G1 X100.432 Y97.437 F42000
G1 F2669
M204 S5000
G1 X100.423 Y97.441 E.00022
G3 X99.914 Y96.224 I-.496 J-.507 E.06182
G1 X99.952 Y96.224 E.00086
G3 X100.513 Y97.333 I-.025 J.709 E.03387
G1 X100.469 Y97.39 E.00161
; WIPE_START
G1 F12000
M204 S6000
M73 P36 R6
G1 X100.423 Y97.441 E-.02605
G1 X100.316 Y97.532 E-.05367
G1 X100.19 Y97.597 E-.05385
G1 X100.053 Y97.635 E-.05376
G1 X99.912 Y97.646 E-.0538
G1 X99.772 Y97.628 E-.05385
G1 X99.638 Y97.583 E-.05375
G1 X99.515 Y97.512 E-.05378
G1 X99.409 Y97.419 E-.0538
G1 X99.323 Y97.306 E-.05383
G1 X99.262 Y97.178 E-.0538
G1 X99.227 Y97.041 E-.05381
G1 X99.22 Y96.9 E-.05371
G1 X99.241 Y96.76 E-.05382
G1 X99.272 Y96.674 E-.03471
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z2.52 F42000
G1 X94.99 Y80.71 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.653 Y88.263 Z2.52 F42000
G1 X88.585 Y102.878 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.682 Y102.854 E.0027
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06228
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X88.383 Y102.93 I.017 J-1.511 E.11386
G1 X88.527 Y102.893 E.00403
M204 S250
G1 X88.683 Y103.265 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.737 Y103.252 E.00139
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.061 J1.109 E.08581
G1 X88.895 Y105.46 E.05565
G3 X88.52 Y103.307 I.007 J-1.11 E.07775
G1 X88.625 Y103.28 E.00272
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.737 Y103.252 E-.04379
G1 X90.622 Y103.243 E-.71621
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.163 Y102.161 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.332 Y102.161 E.00458
G1 X93.089 Y103.278 E.03657
G3 X91.492 Y106.189 I-1.591 J1.021 E.10983
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.278 I-.007 J-1.89 E.10986
G1 X87.668 Y102.161 E.03658
G1 X92.103 Y102.161 E.12017
; WIPE_START
G1 F10826.06
G1 X92.332 Y102.161 E-.08698
G1 X93.089 Y103.278 E-.51289
G1 X93.224 Y103.527 E-.10737
G1 X93.273 Y103.656 E-.05276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.256 E.01248
G1 X78.179 Y102.183 E.00853
G3 X77.49 Y101.305 I.229 J-.889 E.03016
G1 X77.49 Y74.693 E.66908
G3 X78.139 Y73.828 I.915 J.011 E.02908
G1 X78.51 Y73.739 E.00959
G1 X78.51 Y74.24 E.01259
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19251
G3 X102.51 Y74.692 I-.053 J.914 E.03451
G1 X102.51 Y101.308 E.66914
G3 X101.647 Y102.209 I-.923 J-.02 E.03445
G1 X93.99 Y102.21 E.19251
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.107 Y102.59 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.793 I-2.682 J2.161 E.03434
G3 X91.497 Y106.59 I-2.241 J.5 E.10323
G1 X88.503 Y106.59 E.07529
G3 X86.574 Y103.062 I-.001 J-2.291 E.12337
G1 X86.893 Y102.59 E.01432
G1 X79.203 Y102.59 E.19335
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.816 Y73.41 E.54339
M73 P37 R6
G3 X102.89 Y75.503 I-.022 J2.096 E.08213
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.167 Y102.59 E.19184
M204 S10000
G1 X92.584 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03375
; WIPE_START
G1 F10480.96
G1 X92.584 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.186 Y102.369 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.525638
G1 F2669
M204 S6000
G1 X87.853 Y102.691 E.01486
; LINE_WIDTH: 0.498172
G1 X87.769 Y102.777 E.00363
; LINE_WIDTH: 0.451856
G1 X87.668 Y102.882 E.00395
; LINE_WIDTH: 0.403538
G2 X87.529 Y103.045 I2.574 J2.335 E.00518
; LINE_WIDTH: 0.380264
G2 X87.001 Y104.304 I1.539 J1.386 E.03137
G1 X87.001 Y104.326 E.00051
G2 X87.112 Y104.923 I1.762 J-.02 E.01376
; LINE_WIDTH: 0.333239
G1 X87.163 Y105.042 E.00251
G2 X87.25 Y105.204 I2.284 J-1.126 E.0036
; LINE_WIDTH: 0.293712
G2 X87.383 Y105.389 I1.345 J-.824 E.00386
; LINE_WIDTH: 0.251569
G1 X87.565 Y105.578 E.00372
; LINE_WIDTH: 0.20605
G1 X87.729 Y105.708 E.00234
; LINE_WIDTH: 0.164327
G2 X87.895 Y105.81 I1.78 J-2.704 E.00165
; LINE_WIDTH: 0.121579
G2 X88.064 Y105.889 I1.793 J-3.62 E.00106
; LINE_WIDTH: 0.0934667
G1 X88.141 Y105.918 E.00032
M204 S10000
G1 X91.858 Y105.918 F42000
; LINE_WIDTH: 0.107882
G1 F2669
M204 S6000
G2 X92.023 Y105.852 I-.971 J-2.649 E.00085
G1 X92.061 Y105.833 E.0002
; LINE_WIDTH: 0.155324
G2 X92.245 Y105.726 I-.964 J-1.882 E.00168
; LINE_WIDTH: 0.197451
G2 X92.393 Y105.615 I-1.963 J-2.755 E.00197
; LINE_WIDTH: 0.241508
G2 X92.564 Y105.451 I-1.469 J-1.704 E.0032
G1 X92.584 Y105.429 E.00039
; LINE_WIDTH: 0.289606
G2 X92.706 Y105.273 I-2.603 J-2.151 E.0033
G1 X92.75 Y105.202 E.00139
; LINE_WIDTH: 0.336533
G2 X92.904 Y104.879 I-1.354 J-.847 E.00706
; LINE_WIDTH: 0.380659
G2 X92.783 Y103.497 I-1.599 J-.556 E.03228
G1 X92.462 Y103.034 E.01272
; LINE_WIDTH: 0.40399
G1 X92.338 Y102.889 E.00458
; LINE_WIDTH: 0.441971
G1 X92.265 Y102.812 E.00283
; LINE_WIDTH: 0.473352
G1 X92.206 Y102.749 E.00248
; LINE_WIDTH: 0.491839
G1 X91.826 Y102.369 E.01602
M204 S10000
G1 X92.443 Y102.696 F42000
; LINE_WIDTH: 0.447904
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01665
; LINE_WIDTH: 0.428744
G1 X91.753 Y102.558 E.00222
; LINE_WIDTH: 0.395864
G1 X91.651 Y102.541 E.00243
; LINE_WIDTH: 0.358834
G1 X91.495 Y102.521 E.00333
; LINE_WIDTH: 0.300509
G1 X91.186 Y102.501 E.00538
G2 X88.859 Y102.5 I-1.174 J63.232 E.04037
G2 X88.626 Y102.51 I.033 J3.781 E.00406
; LINE_WIDTH: 0.336128
G1 X88.428 Y102.53 E.0039
; LINE_WIDTH: 0.36957
G1 X88.343 Y102.543 E.00189
; LINE_WIDTH: 0.409815
G2 X87.57 Y102.677 I2.311 J15.633 E.0192
M204 S10000
G1 X87.416 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.2312
G3 X78.71 Y102.145 I.19 J-5.575 E.01139
; WIPE_START
G1 F10529.348
G1 X79.118 Y102.174 E-.15528
G1 X80.709 Y102.174 E-.60472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z2.52 F42000
G1 X78.71 Y73.855 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.461883
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.598 J5.545 E.01139
G1 X93.79 Y73.825 E.40893
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10525.168
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/51
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.52 I-1.136 J.435 P1  F42000
G1 X100.611 Y96.853 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.618 Y96.935 E.00185
G3 X99.777 Y96.263 I-.688 J-.002 E.06905
G1 X99.913 Y96.246 E.00307
G3 X100.603 Y96.793 I.017 J.688 E.02141
M204 S250
G1 X100.43 Y97.437 F42000
G1 F2669
M204 S5000
G1 X100.421 Y97.446 E.00029
G3 X99.914 Y96.224 I-.493 J-.512 E.06183
G1 X99.954 Y96.224 E.00089
G3 X100.568 Y97.242 I-.026 J.71 E.03152
G1 X100.465 Y97.388 E.004
; WIPE_START
G1 F12000
M204 S6000
G1 X100.421 Y97.446 E-.02765
G1 X100.316 Y97.532 E-.05155
G1 X100.19 Y97.597 E-.05383
G1 X100.053 Y97.635 E-.05381
G1 X99.912 Y97.646 E-.05375
G1 X99.772 Y97.628 E-.05383
G1 X99.638 Y97.583 E-.05376
G1 X99.515 Y97.512 E-.05381
G1 X99.409 Y97.419 E-.05385
G1 X99.323 Y97.306 E-.05376
G1 X99.262 Y97.178 E-.05383
G1 X99.227 Y97.041 E-.05385
G1 X99.22 Y96.9 E-.05374
G1 X99.241 Y96.759 E-.05384
G1 X99.273 Y96.673 E-.03515
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z2.68 F42000
G1 X94.99 Y80.71 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.66 Y88.265 Z2.68 F42000
G1 X88.609 Y102.87 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.742 Y102.846 E.00367
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X88.535 Y102.884 I.023 J-1.512 E.11785
G1 X88.55 Y102.881 E.00041
M204 S250
G1 X88.678 Y103.265 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.787 Y103.245 E.00278
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.619 Y103.277 I.011 J-1.11 E.08015
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.787 Y103.245 E-.06477
G1 X90.616 Y103.242 E-.69523
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.163 Y102.161 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.332 Y102.161 E.00458
G1 X93.089 Y103.278 E.03658
G3 X91.492 Y106.189 I-1.592 J1.021 E.10982
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.278 I-.007 J-1.89 E.10986
G1 X87.668 Y102.161 E.03658
G1 X92.103 Y102.161 E.12018
; WIPE_START
G1 F10826.06
G1 X92.332 Y102.161 E-.08697
G1 X93.089 Y103.278 E-.51292
G1 X93.223 Y103.526 E-.10717
G1 X93.273 Y103.656 E-.05294
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P38 R6
G1 X93.99 Y101.76 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01273
G1 X78.099 Y102.159 E.01067
G3 X77.49 Y101.306 I.343 J-.889 E.02793
G1 X77.49 Y74.693 E.66909
G3 X78.139 Y73.828 I.915 J.011 E.02908
G1 X78.51 Y73.739 E.00959
G1 X78.51 Y74.24 E.01259
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19252
G3 X102.51 Y74.692 I-.053 J.914 E.03451
G1 X102.51 Y101.305 E.66907
G3 X101.646 Y102.209 I-.923 J-.017 E.03455
G1 X93.99 Y102.21 E.19247
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.107 Y102.59 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.793 I-2.684 J2.162 E.03433
G3 X91.497 Y106.59 I-2.242 J.5 E.10323
G1 X88.503 Y106.59 E.07529
G3 X86.574 Y103.062 I-.001 J-2.291 E.12337
G1 X86.893 Y102.59 E.01432
G1 X79.203 Y102.59 E.19335
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.816 Y73.411 E.54339
M73 P38 R5
G3 X102.89 Y75.503 I-.017 J2.091 E.08218
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08266
G1 X93.167 Y102.59 E.19184
M204 S10000
G1 X92.584 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03375
; WIPE_START
G1 F10480.96
G1 X92.584 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.178 Y102.369 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.496784
G1 F2669
M204 S6000
G1 X87.802 Y102.741 E.01596
; LINE_WIDTH: 0.476096
G1 X87.738 Y102.808 E.00265
; LINE_WIDTH: 0.442921
G1 X87.662 Y102.889 E.00298
; LINE_WIDTH: 0.404048
G1 X87.538 Y103.034 E.00458
; LINE_WIDTH: 0.380212
G2 X87.001 Y104.342 I1.522 J1.39 E.03255
G2 X87.112 Y104.923 I1.672 J-.019 E.01341
; LINE_WIDTH: 0.333464
G1 X87.136 Y104.982 E.00124
G2 X87.249 Y105.201 I1.389 J-.579 E.00482
; LINE_WIDTH: 0.294268
G1 X87.385 Y105.39 E.00394
; LINE_WIDTH: 0.251312
G1 X87.567 Y105.579 E.00372
; LINE_WIDTH: 0.206068
G1 X87.729 Y105.708 E.00231
; LINE_WIDTH: 0.172532
G1 X87.824 Y105.77 E.00102
; LINE_WIDTH: 0.136392
G1 X88.016 Y105.869 E.00144
; LINE_WIDTH: 0.0978276
G1 X88.142 Y105.918 E.00056
M204 S10000
G1 X91.853 Y105.919 F42000
; LINE_WIDTH: 0.0998613
G1 F2669
M204 S6000
G2 X91.99 Y105.866 I-.752 J-2.162 E.00063
; LINE_WIDTH: 0.136075
G2 X92.169 Y105.774 I-1.187 J-2.516 E.00134
; LINE_WIDTH: 0.178533
G2 X92.33 Y105.667 I-.898 J-1.518 E.00182
; LINE_WIDTH: 0.224564
G2 X92.516 Y105.503 I-1.702 J-2.125 E.00307
; LINE_WIDTH: 0.266594
G2 X92.647 Y105.35 I-1.359 J-1.297 E.00306
; LINE_WIDTH: 0.297945
G1 X92.75 Y105.202 E.0031
; LINE_WIDTH: 0.336685
G2 X92.903 Y104.88 I-1.224 J-.779 E.00703
; LINE_WIDTH: 0.380583
G2 X92.783 Y103.497 I-1.574 J-.561 E.03233
G1 X92.462 Y103.034 E.01271
; LINE_WIDTH: 0.404014
G1 X92.338 Y102.889 E.00458
; LINE_WIDTH: 0.442045
G1 X92.265 Y102.812 E.00284
; LINE_WIDTH: 0.47351
G1 X92.205 Y102.749 E.00249
; LINE_WIDTH: 0.491996
G1 X91.827 Y102.369 E.01601
M204 S10000
G1 X92.443 Y102.696 F42000
; LINE_WIDTH: 0.448011
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01665
; LINE_WIDTH: 0.428834
G1 X91.753 Y102.558 E.00222
; LINE_WIDTH: 0.395968
G1 X91.652 Y102.541 E.00243
; LINE_WIDTH: 0.358991
G1 X91.496 Y102.521 E.00332
; LINE_WIDTH: 0.300131
G1 X91.186 Y102.501 E.00539
G2 X88.874 Y102.5 I-1.176 J93.435 E.04006
G1 X88.695 Y102.505 E.0031
; LINE_WIDTH: 0.329921
G2 X88.439 Y102.528 I.236 J4.062 E.00496
; LINE_WIDTH: 0.36724
G1 X88.348 Y102.542 E.00199
; LINE_WIDTH: 0.409669
G2 X87.569 Y102.677 I2.32 J15.696 E.01933
M204 S10000
G1 X87.416 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.2312
G3 X78.71 Y102.145 I.189 J-5.556 E.01138
; WIPE_START
G1 F10529.349
M73 P39 R5
G1 X79.118 Y102.174 E-.15521
G1 X80.709 Y102.174 E-.60479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z2.68 F42000
G1 X78.71 Y73.855 Z2.68
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.461864
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.596 J5.514 E.01139
G1 X93.79 Y73.825 E.40891
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10525.642
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/51
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.68 I-1.136 J.435 P1  F42000
G1 X100.607 Y96.852 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.61 Y97.038 E.00415
G3 X99.777 Y96.263 I-.68 J-.105 E.06674
G1 X99.913 Y96.246 E.00307
G3 X100.603 Y96.792 I.017 J.688 E.02139
M204 S250
G1 X100.433 Y97.436 F42000
G1 F2669
M204 S5000
G1 X100.425 Y97.442 E.00022
G3 X99.914 Y96.224 I-.497 J-.508 E.06197
G1 X99.955 Y96.225 E.00091
G3 X100.515 Y97.334 I-.027 J.71 E.03386
G1 X100.47 Y97.39 E.0016
; WIPE_START
G1 F12000
M204 S6000
G1 X100.425 Y97.442 E-.02643
G1 X100.316 Y97.532 E-.05367
G1 X100.19 Y97.597 E-.05382
G1 X100.053 Y97.635 E-.0539
G1 X99.912 Y97.646 E-.05374
G1 X99.772 Y97.628 E-.05383
G1 X99.638 Y97.583 E-.05378
G1 X99.515 Y97.512 E-.0538
G1 X99.409 Y97.419 E-.05377
G1 X99.323 Y97.306 E-.05384
G1 X99.262 Y97.178 E-.05378
G1 X99.227 Y97.041 E-.05388
G1 X99.22 Y96.9 E-.05376
G1 X99.241 Y96.759 E-.05381
G1 X99.272 Y96.675 E-.03419
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z2.84 F42000
G1 X94.99 Y80.71 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.647 Y88.261 Z2.84 F42000
G1 X88.563 Y102.884 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.682 Y102.854 E.00333
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X88.376 Y102.932 I.017 J-1.511 E.11365
G1 X88.505 Y102.899 E.00361
M204 S250
G1 X88.662 Y103.271 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.737 Y103.252 E.00196
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.518 Y103.308 I.007 J-1.11 E.07768
G1 X88.604 Y103.286 E.00222
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.737 Y103.252 E-.05238
G1 X90.599 Y103.244 E-.70762
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.163 Y102.161 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.332 Y102.161 E.00458
G1 X93.089 Y103.278 E.03657
G3 X91.492 Y106.189 I-1.592 J1.021 E.10983
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.278 I-.007 J-1.89 E.10986
G1 X87.668 Y102.161 E.03657
G1 X92.103 Y102.161 E.12018
; WIPE_START
G1 F10826.06
G1 X92.332 Y102.161 E-.08698
G1 X93.089 Y103.278 E-.51284
G1 X93.223 Y103.526 E-.10722
G1 X93.273 Y103.656 E-.05297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01274
G1 X78.099 Y102.159 E.01068
G3 X77.49 Y101.305 I.343 J-.889 E.02794
G1 X77.49 Y74.692 E.66907
G3 X78.139 Y73.828 I.914 J.011 E.02908
G1 X78.51 Y73.739 E.0096
G1 X78.51 Y74.24 E.01261
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19251
G3 X102.51 Y74.692 I-.05 J.912 E.03454
G1 X102.51 Y101.308 E.66914
G3 X101.645 Y102.209 I-.922 J-.019 E.03452
G1 X93.99 Y102.21 E.19245
M73 P40 R5
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.107 Y102.59 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.793 I-2.684 J2.162 E.03433
G3 X91.497 Y106.59 I-2.242 J.5 E.10323
G1 X88.503 Y106.59 E.07529
G3 X86.574 Y103.061 I-.001 J-2.291 E.12338
G1 X86.893 Y102.59 E.01432
G1 X79.203 Y102.59 E.19335
G3 X77.11 Y100.497 I-.001 J-2.092 E.08266
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08266
G1 X100.818 Y73.411 E.54345
G3 X102.89 Y75.503 I-.026 J2.097 E.08206
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08266
G1 X93.167 Y102.59 E.19184
M204 S10000
G1 X92.584 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03375
; WIPE_START
G1 F10480.96
G1 X92.584 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.173 Y102.369 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.491949
G1 F2669
M204 S6000
G1 X87.794 Y102.749 E.01601
; LINE_WIDTH: 0.473462
G1 X87.735 Y102.812 E.00248
; LINE_WIDTH: 0.442094
G1 X87.662 Y102.889 E.00283
; LINE_WIDTH: 0.402479
G2 X87.529 Y103.045 I2.459 J2.23 E.00491
; LINE_WIDTH: 0.38028
G2 X87 Y104.326 I1.535 J1.384 E.03188
G1 X87 Y104.342 E.00035
G2 X87.112 Y104.922 I1.776 J-.04 E.0134
; LINE_WIDTH: 0.333302
G1 X87.163 Y105.042 E.00253
G2 X87.25 Y105.204 I2.569 J-1.28 E.00358
; LINE_WIDTH: 0.293643
G2 X87.384 Y105.39 I2.193 J-1.434 E.00388
; LINE_WIDTH: 0.251092
G1 X87.568 Y105.58 E.00374
; LINE_WIDTH: 0.205949
G1 X87.729 Y105.708 E.00229
; LINE_WIDTH: 0.172116
G1 X87.827 Y105.772 E.00105
; LINE_WIDTH: 0.135821
G2 X88.016 Y105.869 I.923 J-1.565 E.00141
; LINE_WIDTH: 0.10009
G1 X88.148 Y105.919 E.00061
M204 S10000
G1 X91.858 Y105.918 F42000
; LINE_WIDTH: 0.107865
G1 F2669
M204 S6000
G1 X92.061 Y105.831 E.00106
; LINE_WIDTH: 0.144433
G1 X92.163 Y105.778 E.00083
; LINE_WIDTH: 0.177648
G2 X92.33 Y105.667 I-.933 J-1.583 E.00187
; LINE_WIDTH: 0.224567
G2 X92.516 Y105.503 I-1.694 J-2.116 E.00307
; LINE_WIDTH: 0.266486
G2 X92.646 Y105.351 I-1.37 J-1.305 E.00303
; LINE_WIDTH: 0.29781
G1 X92.75 Y105.202 E.00313
; LINE_WIDTH: 0.336309
G2 X92.903 Y104.883 I-1.353 J-.846 E.00698
; LINE_WIDTH: 0.380709
G2 X92.734 Y103.416 I-1.591 J-.56 E.03452
G1 X92.52 Y103.108 E.00846
; LINE_WIDTH: 0.386982
G1 X92.389 Y102.947 E.00478
; LINE_WIDTH: 0.42994
G1 X92.274 Y102.82 E.00442
; LINE_WIDTH: 0.47007
G1 X92.209 Y102.753 E.00265
; LINE_WIDTH: 0.50078
G1 X92.157 Y102.701 E.00222
; LINE_WIDTH: 0.517664
G1 X91.816 Y102.369 E.01504
M204 S10000
G1 X92.44 Y102.691 F42000
; LINE_WIDTH: 0.442334
G1 F2669
M204 S6000
G1 X91.823 Y102.57 E.01673
; LINE_WIDTH: 0.417998
G1 X91.704 Y102.551 E.003
; LINE_WIDTH: 0.376135
G1 X91.566 Y102.529 E.00312
; LINE_WIDTH: 0.335137
G1 X91.37 Y102.509 E.00385
; LINE_WIDTH: 0.299264
G1 X91.186 Y102.501 E.00319
G2 X88.86 Y102.5 I-1.174 J63.164 E.04018
G2 X88.626 Y102.509 I.033 J3.77 E.00404
; LINE_WIDTH: 0.3361
G1 X88.428 Y102.53 E.0039
; LINE_WIDTH: 0.370345
G1 X88.337 Y102.543 E.00201
; LINE_WIDTH: 0.413695
G2 X87.566 Y102.681 I1.837 J12.488 E.01937
M204 S10000
G1 X87.416 Y102.175 F42000
; LINE_WIDTH: 0.461813
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23125
G3 X78.71 Y102.146 I.2 J-6.013 E.01138
; WIPE_START
G1 F10526.878
G1 X79.118 Y102.174 E-.1552
G1 X80.709 Y102.174 E-.6048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z2.84 F42000
G1 X78.71 Y73.855 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.461844
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.598 J5.55 E.01139
G1 X93.79 Y73.825 E.40889
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10526.125
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/51
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.84 I-1.137 J.435 P1  F42000
G1 X100.618 Y96.893 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.617 Y96.901 E.00018
G3 X99.776 Y96.263 I-.687 J.033 E.06981
G1 X99.913 Y96.246 E.00308
G3 X100.597 Y96.765 I.017 J.688 E.02076
G1 X100.608 Y96.834 E.00155
M204 S250
G1 X100.433 Y97.436 F42000
G1 F2669
M204 S5000
G1 X100.425 Y97.442 E.00023
G3 X99.914 Y96.224 I-.497 J-.507 E.06197
G1 X99.955 Y96.225 E.00094
G3 X100.515 Y97.334 I-.028 J.71 E.03384
G1 X100.471 Y97.389 E.00159
; WIPE_START
G1 F12000
M204 S6000
G1 X100.425 Y97.442 E-.02655
G1 X100.316 Y97.532 E-.05376
G1 X100.19 Y97.597 E-.05382
G1 X100.053 Y97.635 E-.05379
G1 X99.912 Y97.646 E-.05379
G1 X99.772 Y97.628 E-.0538
G1 X99.638 Y97.583 E-.05383
G1 X99.515 Y97.512 E-.05374
G1 X99.409 Y97.419 E-.05384
G1 X99.323 Y97.306 E-.05377
G1 X99.262 Y97.178 E-.05382
G1 X99.227 Y97.041 E-.05385
G1 X99.22 Y96.9 E-.05378
G1 X99.241 Y96.76 E-.05374
G1 X99.272 Y96.675 E-.03412
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z3 F42000
G1 X94.99 Y80.71 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.644 Y88.261 Z3 F42000
G1 X88.553 Y102.887 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P41 R5
G1 F2669
M204 S6000
G1 X88.682 Y102.854 E.0036
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X88.383 Y102.931 I.023 J-1.512 E.11355
G1 X88.495 Y102.902 E.00313
M204 S250
G1 X88.651 Y103.273 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.737 Y103.252 E.00223
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.061 J1.109 E.08581
G1 X88.895 Y105.46 E.05565
G3 X88.521 Y103.308 I.011 J-1.111 E.07754
G1 X88.593 Y103.289 E.00189
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.737 Y103.252 E-.05646
G1 X90.588 Y103.244 E-.70354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.171 Y102.161 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.338 Y102.161 E.00453
G1 X93.088 Y103.277 E.03645
G3 X91.492 Y106.189 I-1.59 J1.022 E.10989
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.277 I.002 J-1.895 E.1097
G1 X87.662 Y102.161 E.03644
G1 X92.111 Y102.161 E.12056
; WIPE_START
G1 F10826.06
G1 X92.338 Y102.161 E-.08635
G1 X93.088 Y103.277 E-.51111
G1 X93.194 Y103.465 E-.08189
G1 X93.273 Y103.662 E-.08065
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01275
G1 X78.099 Y102.159 E.01068
G3 X77.49 Y101.305 I.343 J-.888 E.02793
G1 X77.49 Y74.692 E.66909
G3 X78.139 Y73.828 I.915 J.012 E.02905
G1 X78.51 Y73.738 E.00961
G1 X78.51 Y74.24 E.01262
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.648 Y73.791 E.19254
G3 X102.51 Y74.693 I-.054 J.914 E.03449
G1 X102.51 Y101.305 E.66907
G3 X101.647 Y102.209 I-.922 J-.016 E.03452
G1 X93.99 Y102.21 E.19252
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.109 Y102.59 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.795 I-2.742 J2.184 E.03434
G3 X91.497 Y106.59 I-2.24 J.5 E.10321
G1 X88.503 Y106.59 E.07529
G3 X86.574 Y103.061 I.009 J-2.296 E.12318
G1 X86.891 Y102.59 E.01427
G1 X79.203 Y102.59 E.19328
G3 X77.11 Y100.497 I.011 J-2.104 E.08253
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08266
G1 X100.821 Y73.411 E.54351
G3 X102.89 Y75.503 I-.022 J2.091 E.08206
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.169 Y102.59 E.19177
M204 S10000
M73 P42 R5
G1 X92.589 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.0336
; WIPE_START
G1 F10480.96
G1 X92.589 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.169 Y102.369 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.494762
G1 F2669
M204 S6000
G1 X87.792 Y102.749 E.01607
; LINE_WIDTH: 0.475614
G1 X87.73 Y102.815 E.00261
; LINE_WIDTH: 0.441782
G1 X87.651 Y102.899 E.00307
; LINE_WIDTH: 0.399566
G1 X87.498 Y103.082 E.00567
; LINE_WIDTH: 0.380385
G2 X87.046 Y104.709 I1.381 J1.261 E.03953
G1 X87.112 Y104.922 E.00503
; LINE_WIDTH: 0.333755
G1 X87.168 Y105.053 E.00278
G2 X87.25 Y105.201 I2.157 J-1.091 E.0033
; LINE_WIDTH: 0.29412
G1 X87.384 Y105.39 E.00393
; LINE_WIDTH: 0.261233
G1 X87.486 Y105.504 E.00227
; LINE_WIDTH: 0.224046
G2 X87.668 Y105.664 I1.355 J-1.36 E.003
; LINE_WIDTH: 0.179846
G1 X87.704 Y105.691 E.00042
G2 X87.828 Y105.773 I1.327 J-1.879 E.00141
; LINE_WIDTH: 0.136165
G2 X88.012 Y105.867 I.943 J-1.604 E.00137
; LINE_WIDTH: 0.100839
G1 X88.147 Y105.92 E.00063
M204 S10000
G1 X91.852 Y105.919 F42000
; LINE_WIDTH: 0.101719
G1 F2669
M204 S6000
G2 X92.007 Y105.859 I-.849 J-2.405 E.00073
; LINE_WIDTH: 0.138247
G2 X92.173 Y105.772 I-.999 J-2.104 E.00127
; LINE_WIDTH: 0.179046
G2 X92.33 Y105.666 I-.877 J-1.479 E.00178
; LINE_WIDTH: 0.224581
G2 X92.516 Y105.503 I-1.696 J-2.117 E.00307
; LINE_WIDTH: 0.266316
G2 X92.645 Y105.353 I-1.371 J-1.306 E.00299
; LINE_WIDTH: 0.29763
G1 X92.75 Y105.202 E.00316
; LINE_WIDTH: 0.336429
G2 X92.901 Y104.884 I-1.223 J-.778 E.00695
; LINE_WIDTH: 0.380754
G2 X92.783 Y103.497 I-1.573 J-.564 E.03243
G1 X92.463 Y103.033 E.01272
; LINE_WIDTH: 0.406588
G1 X92.339 Y102.888 E.00462
; LINE_WIDTH: 0.445222
G1 X92.266 Y102.81 E.00285
; LINE_WIDTH: 0.476946
G1 X92.207 Y102.747 E.0025
; LINE_WIDTH: 0.49565
G1 X91.83 Y102.369 E.01606
M204 S10000
G1 X92.448 Y102.697 F42000
; LINE_WIDTH: 0.447918
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01678
; LINE_WIDTH: 0.428789
G1 X91.753 Y102.558 E.00221
; LINE_WIDTH: 0.396028
G1 X91.652 Y102.541 E.00242
; LINE_WIDTH: 0.35941
G1 X91.499 Y102.521 E.00326
; LINE_WIDTH: 0.300568
G1 X91.186 Y102.501 E.00545
G2 X88.86 Y102.5 I-1.174 J63.228 E.04038
G2 X88.626 Y102.51 I.033 J3.78 E.00406
; LINE_WIDTH: 0.336141
G1 X88.428 Y102.53 E.0039
; LINE_WIDTH: 0.369603
G1 X88.342 Y102.543 E.0019
; LINE_WIDTH: 0.409927
G2 X87.565 Y102.678 I2.301 J15.551 E.01933
M204 S10000
G1 X87.411 Y102.175 F42000
; LINE_WIDTH: 0.461712
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23104
G3 X78.71 Y102.145 I.188 J-5.528 E.01139
; WIPE_START
G1 F10529.382
G1 X79.118 Y102.174 E-.15528
G1 X80.709 Y102.174 E-.60472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z3 F42000
G1 X78.71 Y73.855 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.461825
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.594 J5.487 E.01138
G1 X93.79 Y73.825 E.40888
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10526.593
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/51
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I-1.139 J.429 P1  F42000
G1 X100.577 Y97.171 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G3 X99.776 Y96.263 I-.648 J-.236 E.06382
G1 X99.913 Y96.246 E.00308
G3 X100.596 Y97.113 I.017 J.689 E.02866
M204 S250
G1 X100.43 Y97.437 F42000
G1 F2669
M204 S5000
G1 X100.418 Y97.448 E.00036
G3 X99.914 Y96.224 I-.491 J-.514 E.06177
G1 X99.956 Y96.225 E.00096
G3 X100.568 Y97.242 I-.029 J.71 E.03145
G1 X100.464 Y97.388 E.004
; WIPE_START
G1 F12000
M204 S6000
G1 X100.418 Y97.448 E-.0288
G1 X100.316 Y97.532 E-.0504
G1 X100.19 Y97.597 E-.05381
G1 X100.053 Y97.635 E-.05384
G1 X99.912 Y97.646 E-.05377
G1 X99.772 Y97.628 E-.05383
G1 X99.638 Y97.583 E-.05375
G1 X99.515 Y97.512 E-.05387
G1 X99.409 Y97.419 E-.05378
G1 X99.323 Y97.306 E-.05384
G1 X99.262 Y97.178 E-.05374
G1 X99.227 Y97.041 E-.05379
G1 X99.22 Y96.9 E-.05382
G1 X99.241 Y96.759 E-.05382
G1 X99.273 Y96.673 E-.03512
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z3.16 F42000
G1 X94.99 Y80.71 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.641 Y88.26 Z3.16 F42000
G1 X88.541 Y102.89 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.682 Y102.854 E.00394
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.376 Y102.934 I.023 J-1.512 E.11336
G1 X88.483 Y102.905 E.003
M204 S250
G1 X88.64 Y103.276 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.737 Y103.252 E.00253
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.057 J1.109 E.08603
G1 X88.895 Y105.46 E.05565
G3 X88.518 Y103.309 I.011 J-1.111 E.07748
G1 X88.582 Y103.292 E.00166
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.737 Y103.252 E-.06096
G1 X90.577 Y103.244 E-.69904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.159 Y102.161 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.328 Y102.161 E.0046
G1 X93.089 Y103.278 E.03663
G3 X91.492 Y106.189 I-1.599 J1.016 E.10966
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.278 I-.007 J-1.89 E.10985
G1 X87.672 Y102.161 E.03664
G1 X92.099 Y102.161 E.11996
; WIPE_START
G1 F10826.06
G1 X92.328 Y102.161 E-.08734
G1 X93.089 Y103.278 E-.51375
G1 X93.195 Y103.467 E-.08214
G1 X93.27 Y103.654 E-.07677
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01274
G1 X78.099 Y102.159 E.01068
G3 X77.49 Y101.308 I.342 J-.889 E.02786
G1 X77.49 Y74.692 E.66916
G3 X78.139 Y73.828 I.916 J.012 E.02905
G1 X78.51 Y73.739 E.0096
M73 P43 R5
G1 X78.51 Y74.24 E.0126
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19251
G3 X102.51 Y74.692 I-.053 J.914 E.03451
G1 X102.51 Y101.305 E.66907
G3 X101.646 Y102.209 I-.927 J-.021 E.03452
G1 X93.99 Y102.21 E.19247
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.795 I-2.647 J2.146 E.03439
G3 X91.497 Y106.59 I-2.237 J.503 E.10326
G1 X88.503 Y106.59 E.07529
G3 X86.574 Y103.062 I-.001 J-2.291 E.12337
G1 X86.895 Y102.59 E.01434
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08266
G1 X100.823 Y73.411 E.54357
G3 X102.89 Y75.503 I-.031 J2.097 E.08193
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19188
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03384
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.176 Y102.369 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.48969
G1 F2669
M204 S6000
G1 X87.795 Y102.75 E.01599
; LINE_WIDTH: 0.470513
G1 X87.732 Y102.816 E.00261
; LINE_WIDTH: 0.437012
G1 X87.652 Y102.901 E.00305
; LINE_WIDTH: 0.395763
G1 X87.499 Y103.083 E.00561
; LINE_WIDTH: 0.380021
G2 X87.066 Y104.786 I1.361 J1.252 E.04124
G1 X87.112 Y104.922 E.00323
; LINE_WIDTH: 0.333325
G1 X87.138 Y104.985 E.00133
G2 X87.248 Y105.2 I1.45 J-.614 E.00471
; LINE_WIDTH: 0.290819
G1 X87.301 Y105.28 E.00161
G2 X87.409 Y105.421 I2.138 J-1.541 E.00296
; LINE_WIDTH: 0.247787
G1 X87.562 Y105.576 E.00304
; LINE_WIDTH: 0.206064
G1 X87.61 Y105.617 E.00071
G2 X87.728 Y105.708 I1.363 J-1.652 E.00167
; LINE_WIDTH: 0.172449
G1 X87.82 Y105.766 E.00098
; LINE_WIDTH: 0.137715
G2 X88.011 Y105.867 I.741 J-1.17 E.00146
; LINE_WIDTH: 0.100183
G1 X88.146 Y105.918 E.00062
M204 S10000
G1 X91.866 Y105.914 F42000
; LINE_WIDTH: 0.0942587
G1 F2669
M204 S6000
G1 X91.946 Y105.885 E.00033
; LINE_WIDTH: 0.12593
G2 X92.122 Y105.8 I-1.846 J-4.052 E.00117
; LINE_WIDTH: 0.172578
G2 X92.33 Y105.667 I-1.169 J-2.046 E.00223
; LINE_WIDTH: 0.22426
G2 X92.516 Y105.503 I-3.631 J-4.32 E.00306
; LINE_WIDTH: 0.266776
G2 X92.651 Y105.345 I-1.295 J-1.241 E.00315
; LINE_WIDTH: 0.297522
G1 X92.746 Y105.209 E.00285
; LINE_WIDTH: 0.335765
G2 X92.906 Y104.875 I-1.364 J-.86 E.00728
; LINE_WIDTH: 0.380319
G2 X92.779 Y103.491 I-1.61 J-.551 E.03231
G1 X92.461 Y103.034 E.01254
; LINE_WIDTH: 0.402568
G1 X92.338 Y102.89 E.00456
; LINE_WIDTH: 0.440247
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471468
G1 X92.205 Y102.749 E.00248
; LINE_WIDTH: 0.489826
G1 X91.824 Y102.369 E.01599
M204 S10000
G1 X92.441 Y102.695 F42000
; LINE_WIDTH: 0.447813
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01658
; LINE_WIDTH: 0.428716
G1 X91.753 Y102.558 E.00221
; LINE_WIDTH: 0.396012
G1 X91.652 Y102.541 E.00242
; LINE_WIDTH: 0.35953
G1 X91.5 Y102.522 E.00324
; LINE_WIDTH: 0.300582
G1 X91.186 Y102.501 E.00547
G2 X88.86 Y102.5 I-1.174 J63.163 E.04038
G2 X88.626 Y102.509 I.033 J3.766 E.00406
; LINE_WIDTH: 0.336089
G1 X88.428 Y102.53 E.00391
; LINE_WIDTH: 0.370335
G1 X88.337 Y102.543 E.00201
; LINE_WIDTH: 0.413666
G2 X87.569 Y102.681 I1.818 J12.36 E.01931
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461712
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23128
G3 X78.71 Y102.145 I.191 J-5.59 E.01139
; WIPE_START
G1 F10529.367
G1 X79.118 Y102.174 E-.15532
G1 X80.709 Y102.174 E-.60468
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z3.16 F42000
G1 X78.71 Y73.858 Z3.16
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.461798
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.537 J4.277 E.01139
G1 X93.79 Y73.825 E.40885
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10527.262
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/51
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.16 I-1.137 J.435 P1  F42000
G1 X100.619 Y96.913 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.618 Y96.914 E.00004
G3 X99.777 Y96.263 I-.688 J.019 E.06951
G1 X99.913 Y96.246 E.00307
G3 X100.564 Y96.667 I.017 J.688 E.01846
M73 P44 R5
G1 X100.606 Y96.854 E.00428
M204 S250
G1 X100.43 Y97.437 F42000
G1 F2669
M204 S5000
G1 X100.418 Y97.449 E.00038
G3 X99.913 Y96.224 I-.491 J-.514 E.06176
G1 X99.957 Y96.225 E.00098
G3 X100.568 Y97.242 I-.03 J.71 E.03142
G1 X100.464 Y97.388 E.004
; WIPE_START
G1 F12000
M204 S6000
G1 X100.418 Y97.449 E-.02916
G1 X100.316 Y97.532 E-.05013
G1 X100.19 Y97.597 E-.05375
G1 X100.053 Y97.635 E-.05385
G1 X99.912 Y97.646 E-.05376
G1 X99.772 Y97.628 E-.05385
G1 X99.637 Y97.583 E-.0538
G1 X99.515 Y97.512 E-.05376
G1 X99.409 Y97.419 E-.05378
G1 X99.323 Y97.306 E-.05386
G1 X99.262 Y97.178 E-.05376
G1 X99.227 Y97.041 E-.05384
G1 X99.22 Y96.9 E-.05379
G1 X99.241 Y96.759 E-.05383
G1 X99.273 Y96.673 E-.0351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z3.32 F42000
G1 X94.99 Y80.71 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.625 Y88.255 Z3.32 F42000
G1 X88.488 Y102.899 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.527 Y102.886 E.00111
G3 X88.682 Y102.854 I.385 J1.463 E.00429
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X88.239 Y102.994 I.027 J-1.512 E.1091
G1 X88.432 Y102.921 E.00561
M204 S250
G1 X88.629 Y103.285 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.737 Y103.252 E.00284
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.417 Y103.353 I.014 J-1.111 E.07457
G1 X88.572 Y103.303 E.0041
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.737 Y103.252 E-.06566
G1 X90.564 Y103.244 E-.69434
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.16 Y102.161 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.329 Y102.161 E.0046
G1 X93.089 Y103.278 E.03662
G3 X91.492 Y106.189 I-1.593 J1.02 E.10979
G1 X88.514 Y106.189 E.08071
G3 X86.911 Y103.278 I-.01 J-1.891 E.10995
G1 X87.671 Y102.161 E.03662
G1 X92.1 Y102.161 E.12
; WIPE_START
G1 F10826.06
G1 X92.329 Y102.161 E-.08727
G1 X93.089 Y103.278 E-.51353
G1 X93.196 Y103.469 E-.08298
G1 X93.27 Y103.655 E-.07621
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01274
G1 X78.099 Y102.159 E.01069
G3 X77.49 Y101.305 I.342 J-.888 E.02793
G1 X77.49 Y74.695 E.66901
G3 X78.139 Y73.828 I.916 J.009 E.02913
G1 X78.51 Y73.739 E.0096
G1 X78.51 Y74.24 E.01259
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19251
G3 X102.51 Y74.692 I-.053 J.914 E.03451
G1 X102.51 Y101.308 E.66914
G3 X101.646 Y102.209 I-.928 J-.025 E.03444
G1 X93.99 Y102.21 E.19247
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.106 Y102.59 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.795 I-2.655 J2.149 E.03438
G3 X91.497 Y106.59 I-2.247 J.494 E.10312
G1 X88.505 Y106.59 E.07524
G3 X86.574 Y103.061 I0 J-2.293 E.12336
G1 X86.894 Y102.59 E.01433
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.826 Y73.411 E.54363
M73 P45 R5
G3 X102.89 Y75.503 I-.034 J2.098 E.08187
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.166 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03382
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.18 Y102.369 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.494936
G1 F2669
M204 S6000
G1 X87.802 Y102.742 E.01594
; LINE_WIDTH: 0.474383
G1 X87.739 Y102.809 E.00264
; LINE_WIDTH: 0.441444
G1 X87.662 Y102.89 E.00297
; LINE_WIDTH: 0.401278
G2 X87.529 Y103.045 I2.443 J2.22 E.00489
; LINE_WIDTH: 0.380096
G2 X87.002 Y104.263 I1.545 J1.393 E.03044
G1 X87.003 Y104.421 E.00356
G2 X87.112 Y104.921 I1.788 J-.127 E.01159
; LINE_WIDTH: 0.333945
G1 X87.168 Y105.053 E.00279
G2 X87.249 Y105.199 I2.154 J-1.09 E.00326
; LINE_WIDTH: 0.294384
G1 X87.303 Y105.284 E.0017
G2 X87.384 Y105.388 I1.435 J-1.024 E.00224
; LINE_WIDTH: 0.261505
G1 X87.485 Y105.504 E.00228
; LINE_WIDTH: 0.223012
G2 X87.675 Y105.669 I1.396 J-1.411 E.00309
; LINE_WIDTH: 0.179755
G1 X87.822 Y105.767 E.00167
; LINE_WIDTH: 0.1375
G2 X88.011 Y105.867 I.734 J-1.161 E.00144
; LINE_WIDTH: 0.100173
G1 X88.146 Y105.918 E.00062
M204 S10000
G1 X91.858 Y105.916 F42000
; LINE_WIDTH: 0.103141
G1 F2669
M204 S6000
G2 X92.014 Y105.856 I-.823 J-2.349 E.00075
G1 X92.019 Y105.854 E.00003
; LINE_WIDTH: 0.144018
G2 X92.2 Y105.755 I-1.026 J-2.103 E.00147
; LINE_WIDTH: 0.191267
G2 X92.396 Y105.613 I-1.542 J-2.331 E.00247
; LINE_WIDTH: 0.239125
G2 X92.559 Y105.456 I-2.866 J-3.149 E.00303
; LINE_WIDTH: 0.285519
G2 X92.743 Y105.215 I-1.62 J-1.426 E.00497
; LINE_WIDTH: 0.334639
G2 X92.905 Y104.877 I-1.575 J-.962 E.00735
; LINE_WIDTH: 0.380326
G2 X92.779 Y103.491 I-1.609 J-.553 E.03236
G1 X92.461 Y103.034 E.01254
; LINE_WIDTH: 0.402888
G1 X92.338 Y102.89 E.00456
; LINE_WIDTH: 0.440594
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471798
G1 X92.205 Y102.749 E.00247
; LINE_WIDTH: 0.49016
G1 X91.825 Y102.369 E.016
M204 S10000
G1 X92.438 Y102.691 F42000
; LINE_WIDTH: 0.442296
G1 F2669
M204 S6000
G1 X91.823 Y102.57 E.01668
; LINE_WIDTH: 0.417988
G1 X91.704 Y102.551 E.003
; LINE_WIDTH: 0.376145
G1 X91.566 Y102.529 E.00312
; LINE_WIDTH: 0.335136
G1 X91.37 Y102.509 E.00385
; LINE_WIDTH: 0.299263
G1 X91.186 Y102.501 E.00319
G2 X88.86 Y102.5 I-1.174 J63.164 E.04018
G2 X88.626 Y102.509 I.033 J3.77 E.00404
; LINE_WIDTH: 0.336109
G1 X88.428 Y102.53 E.00391
; LINE_WIDTH: 0.369589
G1 X88.342 Y102.543 E.0019
; LINE_WIDTH: 0.409913
G2 X87.571 Y102.676 I2.287 J15.458 E.01916
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23126
G3 X78.71 Y102.145 I.188 J-5.529 E.01139
; WIPE_START
G1 F10529.354
G1 X79.118 Y102.174 E-.15529
G1 X80.709 Y102.174 E-.60471
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z3.32 F42000
G1 X78.71 Y73.855 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.461786
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.596 J5.515 E.01138
G1 X93.79 Y73.825 E.40884
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10527.561
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/51
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.32 I-1.137 J.435 P1  F42000
G1 X100.618 Y96.92 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.607 Y97.037 E.00263
G3 X99.777 Y96.263 I-.677 J-.106 E.06647
G1 X99.913 Y96.246 E.00307
G3 X100.612 Y96.86 I.017 J.686 E.02289
M204 S250
G1 X100.433 Y97.435 F42000
G1 F2669
M204 S5000
G1 X100.423 Y97.44 E.00026
G3 X99.913 Y96.224 I-.496 J-.507 E.06182
G1 X99.958 Y96.225 E.00101
G3 X100.567 Y97.239 I-.031 J.709 E.03131
G1 X100.467 Y97.385 E.00396
; WIPE_START
G1 F12000
M204 S6000
G1 X100.423 Y97.44 E-.02682
G1 X100.316 Y97.532 E-.05368
G1 X100.19 Y97.597 E-.05379
G1 X100.053 Y97.635 E-.0538
G1 X99.912 Y97.646 E-.05376
G1 X99.772 Y97.628 E-.05386
G1 X99.638 Y97.583 E-.05374
G1 X99.515 Y97.512 E-.05385
G1 X99.409 Y97.419 E-.05376
G1 X99.323 Y97.306 E-.05385
G1 X99.262 Y97.178 E-.05372
G1 X99.227 Y97.041 E-.05389
G1 X99.22 Y96.9 E-.05375
G1 X99.241 Y96.76 E-.0538
G1 X99.272 Y96.676 E-.03392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z3.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z3.48 F42000
G1 X94.99 Y80.71 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.636 Y88.258 Z3.48 F42000
G1 X88.525 Y102.894 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.682 Y102.854 E.0044
G1 X88.878 Y102.839 E.00531
G1 X91.175 Y102.84 E.06226
G3 X91.123 Y105.861 I-.077 J1.509 E.12588
G1 X88.885 Y105.861 E.06065
G3 X88.377 Y102.934 I.027 J-1.512 E.11316
G1 X88.467 Y102.91 E.00254
M204 S250
G1 X88.623 Y103.281 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.737 Y103.252 E.00295
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.518 Y103.309 I.015 J-1.111 E.07734
G1 X88.566 Y103.296 E.00123
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.737 Y103.252 E-.06735
G1 X90.56 Y103.244 E-.69265
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.16 Y102.161 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.329 Y102.161 E.0046
G1 X93.089 Y103.278 E.03661
G3 X91.492 Y106.189 I-1.599 J1.017 E.10966
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.278 I-.001 J-1.893 E.10974
G1 X87.671 Y102.161 E.03661
G1 X92.1 Y102.161 E.12001
; WIPE_START
M73 P46 R5
G1 F10826.06
G1 X92.329 Y102.161 E-.08724
G1 X93.089 Y103.278 E-.51346
G1 X93.196 Y103.471 E-.0838
G1 X93.27 Y103.655 E-.07549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.257 E.01249
G1 X78.178 Y102.183 E.00854
G3 X77.49 Y101.308 I.228 J-.888 E.03008
G1 X77.49 Y74.692 E.66914
G3 X78.138 Y73.828 I.916 J.012 E.02906
G1 X78.51 Y73.739 E.00961
G1 X78.51 Y74.24 E.01261
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19252
G3 X102.51 Y74.692 I-.05 J.912 E.03454
G1 X102.51 Y101.305 E.66907
G3 X101.646 Y102.209 I-.922 J-.016 E.03456
G1 X93.99 Y102.21 E.19247
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.106 Y102.59 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.794 I-2.656 J2.15 E.03438
G3 X91.497 Y106.59 I-2.237 J.503 E.10326
G1 X88.503 Y106.59 E.07529
G3 X86.574 Y103.061 I.005 J-2.294 E.12325
G1 X86.894 Y102.59 E.01433
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.828 Y73.411 E.54369
G3 X102.89 Y75.503 I-.029 J2.09 E.08188
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.166 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03382
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.175 Y102.369 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.490257
G1 F2669
M204 S6000
G1 X87.795 Y102.749 E.016
; LINE_WIDTH: 0.471881
G1 X87.735 Y102.812 E.00247
; LINE_WIDTH: 0.44065
G1 X87.662 Y102.89 E.00282
; LINE_WIDTH: 0.401316
G2 X87.529 Y103.045 I2.433 J2.211 E.00489
; LINE_WIDTH: 0.380237
G2 X87 Y104.342 I1.524 J1.378 E.03221
G2 X87.112 Y104.921 I1.824 J-.052 E.01336
; LINE_WIDTH: 0.332161
G1 X87.157 Y105.031 E.00232
G2 X87.257 Y105.215 I1.872 J-.896 E.00407
; LINE_WIDTH: 0.290349
G2 X87.407 Y105.418 I2.198 J-1.464 E.00421
; LINE_WIDTH: 0.2475
G2 X87.565 Y105.579 I1.48 J-1.3 E.00313
; LINE_WIDTH: 0.205643
G1 X87.728 Y105.707 E.00232
; LINE_WIDTH: 0.164188
G2 X87.895 Y105.81 I1.822 J-2.774 E.00166
; LINE_WIDTH: 0.121404
G2 X88.064 Y105.889 I1.588 J-3.174 E.00106
; LINE_WIDTH: 0.0929227
G1 X88.142 Y105.918 E.00032
M204 S10000
G1 X91.858 Y105.917 F42000
; LINE_WIDTH: 0.108041
G1 F2669
M204 S6000
G2 X92.013 Y105.856 I-.824 J-2.351 E.0008
G1 X92.063 Y105.832 E.00027
; LINE_WIDTH: 0.152057
G2 X92.218 Y105.744 I-1.193 J-2.281 E.00136
; LINE_WIDTH: 0.194676
G2 X92.395 Y105.614 I-1.878 J-2.749 E.00231
G1 X92.405 Y105.606 E.00013
; LINE_WIDTH: 0.244021
G2 X92.559 Y105.456 I-2.351 J-2.584 E.00294
G1 X92.587 Y105.425 E.00057
; LINE_WIDTH: 0.28914
G2 X92.705 Y105.273 I-2.213 J-1.839 E.0032
G1 X92.746 Y105.208 E.00126
; LINE_WIDTH: 0.335597
G2 X92.904 Y104.879 I-1.359 J-.857 E.00719
; LINE_WIDTH: 0.381053
G2 X92.734 Y103.416 I-1.593 J-.556 E.03446
G1 X92.389 Y102.948 E.01315
; LINE_WIDTH: 0.428825
G1 X92.273 Y102.819 E.00445
; LINE_WIDTH: 0.472876
M73 P47 R5
G1 X92.193 Y102.738 E.00325
; LINE_WIDTH: 0.511241
G1 X92.127 Y102.673 E.00287
; LINE_WIDTH: 0.5491
G2 X91.784 Y102.369 I-5.071 J5.367 E.01539
M204 S10000
G1 X92.441 Y102.695 F42000
; LINE_WIDTH: 0.447034
G1 F2669
M204 S6000
G1 X91.833 Y102.572 E.01668
; LINE_WIDTH: 0.420583
G1 X91.71 Y102.552 E.00315
; LINE_WIDTH: 0.376999
G1 X91.566 Y102.529 E.00325
; LINE_WIDTH: 0.335137
G1 X91.37 Y102.509 E.00385
; LINE_WIDTH: 0.299265
G1 X91.186 Y102.501 E.00319
G2 X88.86 Y102.5 I-1.174 J63.027 E.04017
G2 X88.626 Y102.509 I.033 J3.778 E.00405
; LINE_WIDTH: 0.33613
G1 X88.428 Y102.53 E.00391
; LINE_WIDTH: 0.370378
G1 X88.337 Y102.543 E.00201
; LINE_WIDTH: 0.413662
G2 X87.568 Y102.681 I1.812 J12.326 E.01933
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23127
G3 X78.71 Y102.145 I.19 J-5.565 E.01138
; WIPE_START
G1 F10529.341
G1 X79.118 Y102.174 E-.15522
G1 X80.709 Y102.174 E-.60479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z3.48 F42000
G1 X78.71 Y73.855 Z3.48
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.461766
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.598 J5.543 E.01138
G1 X93.79 Y73.825 E.40882
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10528.048
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/51
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.48 I-1.137 J.434 P1  F42000
G1 X100.62 Y96.937 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.604 Y97.071 E.00303
G3 X99.808 Y96.256 I-.675 J-.137 E.06675
G1 X99.915 Y96.246 E.00241
G3 X100.616 Y96.877 I.015 J.688 E.02326
M204 S250
G1 X100.434 Y97.435 F42000
G1 F2669
M204 S5000
G1 X100.423 Y97.44 E.00027
G3 X99.913 Y96.224 I-.496 J-.507 E.06182
G1 X99.959 Y96.225 E.00103
G3 X100.513 Y97.333 I-.032 J.708 E.0337
G1 X100.471 Y97.388 E.00155
; WIPE_START
G1 F12000
M204 S6000
G1 X100.423 Y97.44 E-.02705
G1 X100.316 Y97.532 E-.05364
G1 X100.19 Y97.597 E-.05387
G1 X100.053 Y97.635 E-.05379
G1 X99.912 Y97.646 E-.05376
G1 X99.772 Y97.628 E-.05375
G1 X99.638 Y97.583 E-.05384
G1 X99.515 Y97.512 E-.05379
G1 X99.409 Y97.419 E-.05383
G1 X99.323 Y97.306 E-.05377
G1 X99.262 Y97.178 E-.05384
G1 X99.227 Y97.041 E-.05383
G1 X99.22 Y96.9 E-.05377
G1 X99.241 Y96.76 E-.05379
G1 X99.271 Y96.676 E-.03368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z3.64 F42000
G1 X94.99 Y80.71 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.618 Y88.253 Z3.64 F42000
G1 X88.46 Y102.912 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.534 Y102.883 E.00214
G3 X88.742 Y102.846 I.366 J1.466 E.00572
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X88.184 Y103.019 I.016 J-1.511 E.10798
G1 X88.405 Y102.933 E.00642
M204 S250
G1 X88.604 Y103.283 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.629 Y103.275 E.00066
G3 X88.787 Y103.245 I.28 J1.075 E.00404
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.373 Y103.377 I.014 J-1.111 E.0733
G1 X88.548 Y103.305 E.00476
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.629 Y103.275 E-.03275
G1 X88.787 Y103.245 E-.06107
G1 X90.54 Y103.242 E-.66619
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.159 Y102.161 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.329 Y102.161 E.0046
G1 X93.089 Y103.278 E.03662
G3 X91.487 Y106.189 I-1.592 J1.02 E.10997
G1 X88.513 Y106.189 E.08057
G3 X86.911 Y103.278 I-.009 J-1.891 E.10994
G1 X87.671 Y102.161 E.03662
G1 X92.099 Y102.161 E.11999
; WIPE_START
G1 F10826.06
G1 X92.329 Y102.161 E-.08729
G1 X93.089 Y103.278 E-.51351
G1 X93.197 Y103.473 E-.08463
G1 X93.27 Y103.655 E-.07457
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01275
G1 X78.099 Y102.159 E.01069
G3 X77.49 Y101.308 I.333 J-.881 E.0279
G1 X77.49 Y74.692 E.66914
G3 X78.139 Y73.828 I.916 J.012 E.02906
G1 X78.51 Y73.738 E.00961
G1 X78.51 Y74.24 E.01261
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19251
G3 X102.51 Y74.692 I-.053 J.914 E.03451
G1 X102.51 Y101.305 E.66907
G3 X101.646 Y102.209 I-.928 J-.022 E.0345
G1 X93.99 Y102.21 E.19248
M73 P48 R5
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.794 I-2.653 J2.149 E.03437
G3 X91.496 Y106.59 I-2.242 J.499 E.10324
G1 X88.504 Y106.59 E.0752
G3 X86.574 Y103.061 I0 J-2.293 E.12336
G1 X86.895 Y102.59 E.01433
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I-.001 J-2.092 E.08266
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.831 Y73.411 E.54375
G3 X102.89 Y75.503 I-.036 J2.095 E.08177
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.165 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03383
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.176 Y102.369 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.489994
G1 F2669
M204 S6000
G1 X87.795 Y102.75 E.016
; LINE_WIDTH: 0.471654
G1 X87.735 Y102.812 E.00247
; LINE_WIDTH: 0.440441
G1 X87.662 Y102.89 E.00282
; LINE_WIDTH: 0.401152
G2 X87.529 Y103.045 I2.425 J2.205 E.00489
; LINE_WIDTH: 0.380183
G2 X87.001 Y104.341 I1.521 J1.376 E.0322
G1 X87.003 Y104.421 E.00179
G2 X87.111 Y104.921 I1.656 J-.095 E.01159
; LINE_WIDTH: 0.333489
G1 X87.125 Y104.958 E.00078
G2 X87.248 Y105.202 I1.983 J-.851 E.00532
; LINE_WIDTH: 0.293837
G2 X87.384 Y105.39 I2.211 J-1.445 E.00393
; LINE_WIDTH: 0.251135
G1 X87.567 Y105.579 E.00372
; LINE_WIDTH: 0.205662
G1 X87.728 Y105.707 E.00229
; LINE_WIDTH: 0.16419
G2 X87.895 Y105.81 I1.812 J-2.759 E.00167
; LINE_WIDTH: 0.121367
G2 X88.064 Y105.889 I1.591 J-3.185 E.00105
; LINE_WIDTH: 0.0933255
G1 X88.139 Y105.917 E.00031
M204 S10000
G1 X91.858 Y105.917 F42000
; LINE_WIDTH: 0.108023
G1 F2669
M204 S6000
G2 X92.013 Y105.856 I-.815 J-2.327 E.0008
G1 X92.063 Y105.831 E.00027
; LINE_WIDTH: 0.151957
G2 X92.216 Y105.745 I-1.179 J-2.258 E.00135
; LINE_WIDTH: 0.193398
G2 X92.395 Y105.614 I-1.919 J-2.809 E.0023
; LINE_WIDTH: 0.239062
G2 X92.559 Y105.456 I-2.884 J-3.168 E.00304
; LINE_WIDTH: 0.285552
G2 X92.743 Y105.215 I-1.601 J-1.411 E.00496
; LINE_WIDTH: 0.334434
G2 X92.903 Y104.881 I-1.586 J-.967 E.00727
; LINE_WIDTH: 0.380269
G2 X92.78 Y103.491 I-1.608 J-.557 E.03242
G1 X92.462 Y103.035 E.01255
; LINE_WIDTH: 0.402743
G1 X92.338 Y102.89 E.00457
; LINE_WIDTH: 0.440473
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471673
G1 X92.205 Y102.75 E.00247
; LINE_WIDTH: 0.490012
G1 X91.825 Y102.369 E.016
M204 S10000
G1 X92.438 Y102.69 F42000
; LINE_WIDTH: 0.442339
G1 F2669
M204 S6000
G1 X91.823 Y102.57 E.01667
; LINE_WIDTH: 0.418012
G1 X91.704 Y102.551 E.003
; LINE_WIDTH: 0.376137
G1 X91.566 Y102.529 E.00312
; LINE_WIDTH: 0.335136
G1 X91.37 Y102.509 E.00386
; LINE_WIDTH: 0.298818
G1 X91.186 Y102.501 E.00318
G2 X88.873 Y102.5 I-1.177 J93.871 E.03987
G1 X88.695 Y102.505 E.00308
; LINE_WIDTH: 0.329942
G2 X88.438 Y102.528 I.242 J4.131 E.00496
; LINE_WIDTH: 0.368053
G1 X88.342 Y102.543 E.00211
; LINE_WIDTH: 0.413443
G2 X87.569 Y102.681 I1.846 J12.564 E.01943
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461809
G1 F2669
M204 S6000
G1 X79.119 Y102.174 E.23129
G3 X78.71 Y102.146 I.211 J-6.175 E.01142
; WIPE_START
G1 F10526.986
G1 X79.119 Y102.174 E-.15567
G1 X80.709 Y102.174 E-.60433
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z3.64 F42000
G1 X78.71 Y73.855 Z3.64
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.461747
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.595 J5.501 E.01139
G1 X93.79 Y73.825 E.4088
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10528.523
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/51
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.64 I-1.137 J.433 P1  F42000
G1 X100.61 Y96.979 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.61 Y97.038 E.00132
G3 X99.776 Y96.263 I-.68 J-.105 E.06672
G1 X99.913 Y96.246 E.00308
G3 X100.605 Y96.802 I.017 J.688 E.02161
M73 P48 R4
G1 X100.609 Y96.919 E.00262
M204 S250
G1 X100.432 Y97.433 F42000
G1 F2669
M204 S5000
G1 X100.416 Y97.451 E.00054
G3 X99.913 Y96.224 I-.488 J-.516 E.06169
G1 X99.96 Y96.225 E.00105
G3 X100.568 Y97.242 I-.033 J.71 E.03135
G1 X100.467 Y97.384 E.0039
; WIPE_START
G1 F12000
M204 S6000
G1 X100.416 Y97.451 E-.03188
G1 X100.316 Y97.532 E-.04899
G1 X100.19 Y97.597 E-.05384
G1 X100.053 Y97.635 E-.0538
G1 X99.912 Y97.646 E-.05377
G1 X99.772 Y97.628 E-.0538
G1 X99.638 Y97.583 E-.05381
G1 X99.515 Y97.512 E-.05377
G1 X99.409 Y97.419 E-.05379
G1 X99.323 Y97.306 E-.05375
G1 X99.262 Y97.178 E-.05384
G1 X99.227 Y97.041 E-.05387
G1 X99.22 Y96.9 E-.05378
G1 X99.241 Y96.76 E-.05375
G1 X99.271 Y96.677 E-.03355
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z3.8 F42000
G1 X94.99 Y80.71 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
M73 P49 R4
G1 E-.04 F1800
M204 S10000
G1 X92.621 Y88.254 Z3.8 F42000
G1 X88.472 Y102.908 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.682 Y102.854 E.00589
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.376 Y102.932 I.017 J-1.511 E.11364
G1 X88.413 Y102.923 E.00105
M204 S250
G1 X88.57 Y103.294 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.737 Y103.252 E.00433
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.512 Y103.31 I.007 J-1.11 E.07753
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.737 Y103.252 E-.08827
G1 X90.505 Y103.244 E-.67173
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.159 Y102.161 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.329 Y102.161 E.0046
G1 X93.089 Y103.278 E.03662
G3 X91.487 Y106.189 I-1.592 J1.02 E.10997
G1 X88.508 Y106.189 E.08072
G3 X86.911 Y103.278 I-.007 J-1.89 E.10986
G1 X87.671 Y102.161 E.03661
G1 X92.099 Y102.161 E.12
; WIPE_START
G1 F10826.06
G1 X92.329 Y102.161 E-.08728
G1 X93.089 Y103.278 E-.51348
G1 X93.198 Y103.474 E-.08542
G1 X93.27 Y103.655 E-.07382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01275
G1 X78.099 Y102.159 E.01069
G3 X77.49 Y101.305 I.342 J-.887 E.02793
G1 X77.49 Y74.692 E.66907
G3 X78.138 Y73.828 I.916 J.012 E.02905
G1 X78.51 Y73.739 E.00961
G1 X78.51 Y74.24 E.01261
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19252
G3 X102.51 Y74.692 I-.053 J.914 E.03451
G1 X102.51 Y101.305 E.66907
G3 X101.646 Y102.209 I-.922 J-.016 E.03456
G1 X93.99 Y102.21 E.19248
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.106 Y102.59 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.794 I-2.655 J2.15 E.03437
G3 X91.495 Y106.59 I-2.243 J.499 E.10324
G1 X88.503 Y106.59 E.07524
G3 X86.574 Y103.061 I-.001 J-2.291 E.12339
G1 X86.894 Y102.59 E.01432
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I-.001 J-2.092 E.08267
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08267
G1 X100.833 Y73.411 E.54381
G3 X102.89 Y75.503 I-.034 J2.09 E.08176
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
M73 P50 R4
G1 X93.166 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03382
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.175 Y102.369 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.49014
G1 F2669
M204 S6000
G1 X87.795 Y102.749 E.016
; LINE_WIDTH: 0.47178
G1 X87.735 Y102.812 E.00247
; LINE_WIDTH: 0.440564
G1 X87.662 Y102.89 E.00282
; LINE_WIDTH: 0.40125
G2 X87.529 Y103.045 I2.461 J2.235 E.00489
; LINE_WIDTH: 0.380208
G2 X87.001 Y104.302 I1.535 J1.385 E.03132
G2 X87.11 Y104.921 I1.84 J-.007 E.01425
; LINE_WIDTH: 0.33036
G1 X87.12 Y104.945 E.00051
G2 X87.271 Y105.235 I1.541 J-.618 E.00632
; LINE_WIDTH: 0.290687
G1 X87.383 Y105.389 E.00318
; LINE_WIDTH: 0.25105
G1 X87.569 Y105.581 E.00377
; LINE_WIDTH: 0.205508
G1 X87.727 Y105.707 E.00226
; LINE_WIDTH: 0.164271
G2 X87.895 Y105.81 I1.797 J-2.732 E.00167
; LINE_WIDTH: 0.12138
G2 X88.064 Y105.889 I1.593 J-3.189 E.00106
; LINE_WIDTH: 0.0932727
G1 X88.138 Y105.916 E.0003
M204 S10000
G1 X91.858 Y105.917 F42000
; LINE_WIDTH: 0.108046
G1 F2669
M204 S6000
G2 X92.013 Y105.856 I-.815 J-2.325 E.0008
G1 X92.064 Y105.831 E.00027
; LINE_WIDTH: 0.151919
G2 X92.215 Y105.745 I-1.173 J-2.247 E.00133
; LINE_WIDTH: 0.193253
G2 X92.395 Y105.614 I-1.939 J-2.841 E.0023
; LINE_WIDTH: 0.239017
G2 X92.56 Y105.456 I-2.905 J-3.189 E.00305
; LINE_WIDTH: 0.285552
G2 X92.743 Y105.215 I-1.582 J-1.397 E.00496
; LINE_WIDTH: 0.334319
G2 X92.903 Y104.883 I-1.593 J-.97 E.00722
; LINE_WIDTH: 0.380485
G2 X92.734 Y103.416 I-1.59 J-.56 E.03449
G1 X92.425 Y102.991 E.01185
; LINE_WIDTH: 0.409613
G1 X92.333 Y102.885 E.00344
; LINE_WIDTH: 0.441997
G1 X92.263 Y102.811 E.00272
; LINE_WIDTH: 0.472169
G1 X92.205 Y102.749 E.00241
; LINE_WIDTH: 0.490162
G1 X91.825 Y102.369 E.016
M204 S10000
G1 X92.441 Y102.695 F42000
; LINE_WIDTH: 0.447908
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01659
; LINE_WIDTH: 0.428838
G1 X91.754 Y102.558 E.00221
; LINE_WIDTH: 0.396278
G1 X91.653 Y102.541 E.00241
; LINE_WIDTH: 0.360318
G1 X91.506 Y102.522 E.00315
; LINE_WIDTH: 0.300664
G1 X91.186 Y102.501 E.00557
G2 X88.86 Y102.5 I-1.174 J63.164 E.04039
G2 X88.626 Y102.51 I.033 J3.78 E.00407
; LINE_WIDTH: 0.336121
G1 X88.428 Y102.53 E.0039
; LINE_WIDTH: 0.370359
G1 X88.337 Y102.543 E.00201
; LINE_WIDTH: 0.413681
G2 X87.568 Y102.681 I1.816 J12.355 E.01932
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23127
G3 X78.71 Y102.145 I.189 J-5.558 E.01139
; WIPE_START
G1 F10529.357
G1 X79.118 Y102.174 E-.15528
G1 X80.709 Y102.174 E-.60472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z3.8 F42000
G1 X78.71 Y73.855 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.461727
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.595 J5.496 E.01139
G1 X93.79 Y73.825 E.40878
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10528.998
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/51
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I-1.137 J.433 P1  F42000
G1 X100.615 Y96.987 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.61 Y97.038 E.00115
G3 X99.776 Y96.263 I-.68 J-.105 E.06677
G1 X99.913 Y96.246 E.00307
G3 X100.618 Y96.917 I.017 J.688 E.02419
G1 X100.617 Y96.927 E.00024
M204 S250
G1 X100.434 Y97.434 F42000
G1 F2669
M204 S5000
G1 X100.415 Y97.451 E.00057
G3 X99.913 Y96.224 I-.488 J-.517 E.06166
G1 X99.961 Y96.225 E.00107
G3 X100.494 Y97.363 I-.034 J.71 E.03449
G1 X100.472 Y97.389 E.00076
; WIPE_START
G1 F12000
M204 S6000
G1 X100.415 Y97.451 E-.03242
G1 X100.316 Y97.532 E-.04857
G1 X100.19 Y97.597 E-.05382
G1 X100.053 Y97.635 E-.05382
G1 X99.912 Y97.646 E-.05379
G1 X99.772 Y97.628 E-.05383
G1 X99.638 Y97.583 E-.05375
G1 X99.515 Y97.512 E-.05379
G1 X99.409 Y97.419 E-.05381
G1 X99.323 Y97.306 E-.05379
G1 X99.262 Y97.178 E-.05379
G1 X99.227 Y97.041 E-.05386
G1 X99.22 Y96.9 E-.0538
G1 X99.241 Y96.76 E-.05382
G1 X99.271 Y96.677 E-.03336
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z3.96 F42000
G1 X94.99 Y80.71 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.623 Y88.255 Z3.96 F42000
G1 X88.478 Y102.907 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.75 Y102.846 E.00753
G1 X91.175 Y102.84 E.06573
G3 X91.123 Y105.861 I-.077 J1.509 E.12588
G1 X88.885 Y105.861 E.06065
G3 X88.384 Y102.932 I.027 J-1.512 E.11337
G1 X88.42 Y102.923 E.00102
M204 S250
G1 X88.566 Y103.296 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.79 Y103.245 E.00576
G1 X91.155 Y103.241 E.05948
G3 X91.108 Y105.46 I-.057 J1.109 E.08603
G1 X88.895 Y105.46 E.05565
G3 X88.509 Y103.313 I.014 J-1.111 E.07707
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.79 Y103.245 E-.10982
G1 X90.501 Y103.242 E-.65018
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.159 Y102.161 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.329 Y102.161 E.0046
G1 X93.089 Y103.278 E.03661
G3 X91.492 Y106.189 I-1.599 J1.017 E.10967
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.278 I-.007 J-1.89 E.10987
G1 X87.671 Y102.161 E.0366
G1 X92.099 Y102.161 E.12
; WIPE_START
G1 F10826.06
G1 X92.329 Y102.161 E-.08728
G1 X93.089 Y103.278 E-.51337
G1 X93.199 Y103.476 E-.08627
G1 X93.27 Y103.655 E-.07308
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01274
G1 X78.099 Y102.159 E.01069
G3 X77.49 Y101.306 I.341 J-.887 E.02791
G1 X77.49 Y74.692 E.6691
G3 X78.138 Y73.828 I.916 J.012 E.02905
G1 X78.51 Y73.739 E.00961
M73 P51 R4
G1 X78.51 Y74.24 E.0126
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.648 Y73.791 E.19254
G3 X102.51 Y74.692 I-.054 J.914 E.03448
G1 X102.51 Y101.308 E.66916
G3 X101.646 Y102.209 I-.926 J-.023 E.03444
G1 X93.99 Y102.21 E.19248
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.106 Y102.59 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.794 I-2.657 J2.151 E.03436
G3 X91.497 Y106.59 I-2.237 J.503 E.10328
G1 X88.503 Y106.59 E.07529
G3 X86.574 Y103.061 I-.001 J-2.291 E.1234
G1 X86.894 Y102.59 E.01431
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.836 Y73.411 E.54387
G3 X102.89 Y75.503 I-.036 J2.09 E.0817
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.166 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03382
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.175 Y102.369 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.490197
G1 F2669
M204 S6000
G1 X87.795 Y102.749 E.01599
; LINE_WIDTH: 0.470972
G1 X87.732 Y102.816 E.00262
; LINE_WIDTH: 0.437398
G1 X87.652 Y102.901 E.00306
; LINE_WIDTH: 0.396043
G1 X87.499 Y103.083 E.00561
; LINE_WIDTH: 0.380156
G2 X87.065 Y104.786 I1.365 J1.254 E.04126
G2 X87.111 Y104.921 I2.739 J-.846 E.00321
; LINE_WIDTH: 0.333801
G1 X87.13 Y104.968 E.001
G2 X87.247 Y105.2 I1.989 J-.863 E.00508
; LINE_WIDTH: 0.294101
G2 X87.383 Y105.389 I1.37 J-.838 E.00394
; LINE_WIDTH: 0.250899
G1 X87.57 Y105.582 E.0038
; LINE_WIDTH: 0.205324
G1 X87.727 Y105.707 E.00224
; LINE_WIDTH: 0.164216
G2 X87.895 Y105.81 I1.779 J-2.703 E.00167
; LINE_WIDTH: 0.121349
G2 X88.064 Y105.889 I1.59 J-3.187 E.00106
; LINE_WIDTH: 0.0932486
G1 X88.138 Y105.916 E.0003
M204 S10000
G1 X91.86 Y105.916 F42000
; LINE_WIDTH: 0.108201
G1 F2669
M204 S6000
G2 X91.981 Y105.87 I-.627 J-1.84 E.00062
G1 X92.064 Y105.831 E.00044
; LINE_WIDTH: 0.154298
G2 X92.177 Y105.769 I-.843 J-1.693 E.00101
G1 X92.24 Y105.728 E.00059
; LINE_WIDTH: 0.196544
G2 X92.391 Y105.618 I-1.26 J-1.877 E.00198
; LINE_WIDTH: 0.238361
G2 X92.56 Y105.456 I-2.917 J-3.212 E.00311
; LINE_WIDTH: 0.284186
G2 X92.713 Y105.26 I-1.744 J-1.526 E.00405
G1 X92.736 Y105.226 E.00067
; LINE_WIDTH: 0.333693
G2 X92.902 Y104.884 I-1.56 J-.97 E.00743
; LINE_WIDTH: 0.382259
G2 X92.734 Y103.416 I-1.59 J-.562 E.03471
G1 X92.622 Y103.246 E.00462
; LINE_WIDTH: 0.375149
G1 X92.388 Y102.947 E.00842
; LINE_WIDTH: 0.428395
G1 X92.275 Y102.821 E.00436
; LINE_WIDTH: 0.467175
G1 X92.212 Y102.758 E.00251
; LINE_WIDTH: 0.496015
G1 X92.164 Y102.709 E.00208
; LINE_WIDTH: 0.511917
G1 X91.815 Y102.369 E.01518
M204 S10000
G1 X92.441 Y102.695 F42000
; LINE_WIDTH: 0.447917
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01659
; LINE_WIDTH: 0.428872
G1 X91.754 Y102.558 E.0022
; LINE_WIDTH: 0.396356
G1 X91.653 Y102.541 E.00241
; LINE_WIDTH: 0.360513
G1 X91.507 Y102.522 E.00314
; LINE_WIDTH: 0.301683
G1 X91.186 Y102.501 E.00561
G2 X88.873 Y102.5 I-1.177 J93.87 E.04031
G1 X88.709 Y102.505 E.00287
G2 X88.508 Y102.52 I.148 J3.2 E.0035
; LINE_WIDTH: 0.35462
G1 X88.385 Y102.537 E.0026
; LINE_WIDTH: 0.4074
G2 X87.572 Y102.676 I1.444 J10.917 E.02006
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23127
G3 X78.71 Y102.145 I.189 J-5.551 E.01138
; WIPE_START
G1 F10529.349
G1 X79.118 Y102.174 E-.15521
G1 X80.709 Y102.174 E-.60479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z3.96 F42000
G1 X78.71 Y73.855 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.461708
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.596 J5.514 E.01139
G1 X93.79 Y73.825 E.40876
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10529.482
G1 X91.79 Y73.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/51
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.96 I-1.137 J.433 P1  F42000
G1 X100.615 Y96.988 Z3.96
G1 Z3.72
M73 P52 R4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.612 Y97.038 E.00112
G3 X99.793 Y96.259 I-.681 J-.104 E.06715
G1 X99.914 Y96.246 E.00272
G3 X100.619 Y96.901 I.018 J.688 E.02386
G1 X100.618 Y96.928 E.00061
M204 S250
G1 X100.425 Y97.442 F42000
G1 F2669
M204 S5000
G1 X100.396 Y97.463 E.0008
G3 X99.913 Y96.224 I-.469 J-.531 E.06093
G1 X99.962 Y96.225 E.00109
G3 X100.491 Y97.36 I-.035 J.707 E.03439
G1 X100.463 Y97.395 E.00102
; WIPE_START
G1 F12000
M204 S6000
G1 X100.396 Y97.463 E-.0361
G1 X100.285 Y97.551 E-.05359
G1 X100.156 Y97.609 E-.05384
G1 X99.91 Y97.646 E-.09465
G1 X99.772 Y97.628 E-.05292
G1 X99.638 Y97.583 E-.0538
G1 X99.515 Y97.512 E-.05381
G1 X99.409 Y97.419 E-.05382
G1 X99.323 Y97.306 E-.0538
G1 X99.262 Y97.178 E-.05378
G1 X99.227 Y97.041 E-.0538
G1 X99.22 Y96.9 E-.05376
G1 X99.241 Y96.76 E-.05382
G1 X99.276 Y96.664 E-.03851
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z4.12 F42000
G1 X94.99 Y80.71 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.619 Y88.254 Z4.12 F42000
G1 X88.465 Y102.911 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.742 Y102.846 E.0077
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.384 Y102.931 I.024 J-1.512 E.11354
G1 X88.407 Y102.925 E.00065
M204 S250
G1 X88.555 Y103.299 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.787 Y103.245 E.00598
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.498 Y103.317 I.011 J-1.11 E.07693
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.787 Y103.245 E-.11302
G1 X90.489 Y103.242 E-.64698
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.16 Y102.161 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.329 Y102.161 E.0046
G1 X93.089 Y103.278 E.0366
G3 X91.487 Y106.189 I-1.592 J1.021 E.10997
G1 X88.508 Y106.189 E.08073
G3 X86.911 Y103.278 I-.007 J-1.89 E.10987
G1 X87.671 Y102.161 E.0366
G1 X92.1 Y102.161 E.12
; WIPE_START
G1 F10826.06
G1 X92.329 Y102.161 E-.08727
G1 X93.089 Y103.278 E-.51326
G1 X93.2 Y103.478 E-.08721
G1 X93.27 Y103.655 E-.07226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.257 E.0125
G1 X78.178 Y102.183 E.00855
G3 X77.49 Y101.305 I.229 J-.889 E.03014
G1 X77.49 Y74.692 E.66908
G3 X78.138 Y73.828 I.916 J.012 E.02904
G1 X78.51 Y73.739 E.00961
G1 X78.51 Y74.24 E.0126
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19252
G3 X102.51 Y74.692 I-.053 J.914 E.03451
G1 X102.51 Y101.308 E.66914
G3 X101.646 Y102.209 I-.922 J-.019 E.03449
G1 X93.99 Y102.21 E.19248
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.106 Y102.59 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.794 I-2.658 J2.151 E.03436
G3 X91.496 Y106.59 I-2.243 J.499 E.10324
G1 X88.503 Y106.59 E.07525
G3 X86.574 Y103.061 I-.001 J-2.291 E.1234
G1 X86.894 Y102.59 E.01431
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
M73 P53 R4
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.838 Y73.411 E.54393
G3 X102.89 Y75.503 I-.038 J2.09 E.08164
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.166 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03382
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.188 Y102.369 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.52404
G1 F2669
M204 S6000
G1 X87.854 Y102.691 E.01485
; LINE_WIDTH: 0.496669
G1 X87.77 Y102.777 E.00363
; LINE_WIDTH: 0.450498
G1 X87.669 Y102.882 E.00394
; LINE_WIDTH: 0.404052
G1 X87.539 Y103.034 E.00483
; LINE_WIDTH: 0.380206
G2 X87.001 Y104.301 I1.533 J1.399 E.03164
G2 X87.11 Y104.921 I1.728 J.013 E.01426
; LINE_WIDTH: 0.333055
G1 X87.125 Y104.959 E.00079
G2 X87.251 Y105.207 I2.038 J-.877 E.00542
; LINE_WIDTH: 0.291108
G2 X87.407 Y105.418 I2.267 J-1.505 E.0044
; LINE_WIDTH: 0.246694
G2 X87.571 Y105.584 I1.449 J-1.272 E.00323
; LINE_WIDTH: 0.205012
G1 X87.727 Y105.707 E.00221
; LINE_WIDTH: 0.164253
G2 X87.895 Y105.81 I1.752 J-2.657 E.00168
; LINE_WIDTH: 0.12136
G2 X88.064 Y105.889 I1.584 J-3.175 E.00105
; LINE_WIDTH: 0.093262
G1 X88.138 Y105.916 E.0003
M204 S10000
G1 X91.858 Y105.917 F42000
; LINE_WIDTH: 0.107922
G1 F2669
M204 S6000
G2 X92.016 Y105.855 I-.843 J-2.397 E.00081
G1 X92.064 Y105.831 E.00026
; LINE_WIDTH: 0.156076
G2 X92.239 Y105.731 I-1.409 J-2.657 E.0016
G1 X92.247 Y105.726 E.00008
; LINE_WIDTH: 0.2022
G2 X92.429 Y105.584 I-1.826 J-2.534 E.00252
; LINE_WIDTH: 0.246672
G2 X92.56 Y105.456 I-1.413 J-1.569 E.00254
G1 X92.591 Y105.421 E.00064
; LINE_WIDTH: 0.290064
G2 X92.713 Y105.26 I-2.339 J-1.911 E.00338
G1 X92.747 Y105.208 E.00102
; LINE_WIDTH: 0.335243
G2 X92.9 Y104.886 I-1.274 J-.805 E.00702
; LINE_WIDTH: 0.380246
G2 X92.783 Y103.497 I-1.572 J-.567 E.03243
G1 X92.461 Y103.034 E.0127
; LINE_WIDTH: 0.402955
G1 X92.338 Y102.89 E.00458
; LINE_WIDTH: 0.44072
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471901
G1 X92.205 Y102.749 E.00247
; LINE_WIDTH: 0.490253
G1 X91.824 Y102.369 E.016
M204 S10000
G1 X92.438 Y102.69 F42000
; LINE_WIDTH: 0.442417
G1 F2669
M204 S6000
G1 X91.823 Y102.57 E.01667
; LINE_WIDTH: 0.418049
G1 X91.704 Y102.551 E.003
; LINE_WIDTH: 0.37613
G1 X91.566 Y102.529 E.00313
; LINE_WIDTH: 0.335117
G1 X91.37 Y102.509 E.00385
; LINE_WIDTH: 0.298819
G1 X91.186 Y102.501 E.00319
G2 X88.873 Y102.5 I-1.177 J93.87 E.03987
G1 X88.695 Y102.505 E.00308
; LINE_WIDTH: 0.329921
G2 X88.439 Y102.528 I.241 J4.118 E.00496
; LINE_WIDTH: 0.367245
G1 X88.348 Y102.542 E.002
; LINE_WIDTH: 0.409681
G2 X87.572 Y102.676 I2.326 J15.735 E.01927
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23127
G3 X78.71 Y102.145 I.188 J-5.531 E.01138
; WIPE_START
G1 F10529.362
G1 X79.118 Y102.174 E-.15521
G1 X80.709 Y102.174 E-.60479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z4.12 F42000
G1 X78.71 Y73.855 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.461688
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.596 J5.511 E.01138
G1 X93.79 Y73.825 E.40875
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10529.962
G1 X91.79 Y73.826 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/51
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.12 I-1.137 J.433 P1  F42000
G1 X100.612 Y97.014 Z4.12
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.605 Y97.071 E.00129
G3 X99.776 Y96.263 I-.675 J-.137 E.06608
G1 X99.913 Y96.246 E.00307
G3 X100.619 Y96.935 I.017 J.689 E.02461
G1 X100.617 Y96.955 E.00044
M204 S250
G1 X100.434 Y97.434 F42000
G1 F2669
M204 S5000
G1 X100.414 Y97.453 E.00062
G3 X99.913 Y96.224 I-.486 J-.518 E.06161
G1 X99.963 Y96.225 E.00112
G3 X100.495 Y97.363 I-.036 J.71 E.03445
G1 X100.473 Y97.388 E.00075
; WIPE_START
G1 F12000
M204 S6000
G1 X100.414 Y97.453 E-.03333
G1 X100.316 Y97.532 E-.04787
G1 X100.19 Y97.597 E-.05378
G1 X100.053 Y97.635 E-.05386
G1 X99.912 Y97.646 E-.05376
G1 X99.772 Y97.628 E-.05382
G1 X99.638 Y97.583 E-.05379
G1 X99.515 Y97.512 E-.05377
G1 X99.409 Y97.419 E-.0538
G1 X99.323 Y97.306 E-.05378
G1 X99.262 Y97.178 E-.05384
G1 X99.227 Y97.041 E-.05379
G1 X99.22 Y96.9 E-.05384
G1 X99.241 Y96.76 E-.05375
G1 X99.271 Y96.677 E-.03322
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z3.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z4.28 F42000
G1 X94.99 Y80.71 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.603 Y88.249 Z4.28 F42000
G1 X88.409 Y102.929 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.535 Y102.883 E.00361
G3 X88.742 Y102.846 I.367 J1.466 E.00571
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.077 J1.509 E.12588
G1 X88.885 Y105.861 E.06065
G3 X88.237 Y102.992 I.017 J-1.511 E.10957
G1 X88.353 Y102.949 E.00334
M204 S250
G1 X88.546 Y103.303 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.629 Y103.273 E.00222
G3 X88.787 Y103.245 I.272 J1.076 E.00404
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.416 Y103.351 I.006 J-1.11 E.07493
G1 X88.489 Y103.324 E.00197
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.629 Y103.273 E-.05636
G1 X88.787 Y103.245 E-.06106
G1 X90.478 Y103.242 E-.64259
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.159 Y102.161 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.329 Y102.161 E.0046
G1 X93.089 Y103.278 E.0366
G3 X91.492 Y106.189 I-1.598 J1.017 E.10968
G1 X88.508 Y106.189 E.08087
G3 X86.911 Y103.278 I-.001 J-1.893 E.10975
M73 P54 R4
G1 X87.671 Y102.161 E.0366
G1 X92.099 Y102.161 E.11998
; WIPE_START
G1 F10826.06
G1 X92.329 Y102.161 E-.08731
G1 X93.089 Y103.278 E-.51331
G1 X93.201 Y103.48 E-.08795
G1 X93.27 Y103.655 E-.07144
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01274
G1 X78.099 Y102.159 E.01069
G3 X77.49 Y101.305 I.341 J-.887 E.02792
G1 X77.49 Y74.692 E.6691
G3 X78.138 Y73.828 I.916 J.012 E.02904
G1 X78.51 Y73.739 E.00961
G1 X78.51 Y74.24 E.0126
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19251
G3 X102.51 Y74.692 I-.053 J.914 E.03452
G1 X102.51 Y101.307 E.66912
G3 X101.646 Y102.209 I-.922 J-.018 E.03451
G1 X93.99 Y102.21 E.19248
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.794 I-2.655 J2.15 E.03436
G3 X91.497 Y106.59 I-2.237 J.503 E.10328
G1 X88.503 Y106.59 E.07529
G3 X86.574 Y103.061 I.005 J-2.294 E.12326
G1 X86.895 Y102.59 E.01431
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.84 Y73.411 E.544
G3 X102.89 Y75.503 I-.046 J2.095 E.08152
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.165 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03383
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.18 Y102.369 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.494654
G1 F2669
M204 S6000
G1 X87.802 Y102.742 E.01594
; LINE_WIDTH: 0.473314
G1 X87.735 Y102.812 E.00278
; LINE_WIDTH: 0.438106
G1 X87.652 Y102.901 E.0032
; LINE_WIDTH: 0.395953
G1 X87.499 Y103.083 E.00562
; LINE_WIDTH: 0.380198
G2 X87.081 Y104.839 I1.359 J1.251 E.0425
G1 X87.111 Y104.92 E.00194
; LINE_WIDTH: 0.333208
G1 X87.162 Y105.04 E.00255
M73 P55 R4
G2 X87.25 Y105.204 I2.468 J-1.222 E.00362
; LINE_WIDTH: 0.293497
G2 X87.384 Y105.39 I2.3 J-1.51 E.00387
; LINE_WIDTH: 0.256039
G2 X87.533 Y105.55 I1.723 J-1.46 E.00315
; LINE_WIDTH: 0.209996
G2 X87.727 Y105.707 I.92 J-.94 E.00287
; LINE_WIDTH: 0.164309
G2 X87.895 Y105.81 I1.72 J-2.604 E.00167
; LINE_WIDTH: 0.121486
G2 X88.064 Y105.889 I1.622 J-3.25 E.00106
; LINE_WIDTH: 0.0929423
G1 X88.142 Y105.918 E.00032
M204 S10000
G1 X91.861 Y105.916 F42000
; LINE_WIDTH: 0.108131
G1 F2669
M204 S6000
G2 X92.02 Y105.853 I-.873 J-2.429 E.00082
G1 X92.064 Y105.831 E.00024
; LINE_WIDTH: 0.155024
G2 X92.237 Y105.732 I-1.392 J-2.629 E.00157
; LINE_WIDTH: 0.200201
G2 X92.427 Y105.586 I-1.769 J-2.509 E.00259
; LINE_WIDTH: 0.24296
G2 X92.56 Y105.455 I-3.435 J-3.609 E.00254
; LINE_WIDTH: 0.285665
G2 X92.743 Y105.215 I-1.535 J-1.361 E.00495
; LINE_WIDTH: 0.33402
G2 X92.901 Y104.888 I-1.612 J-.979 E.0071
; LINE_WIDTH: 0.38025
G2 X92.783 Y103.496 I-1.591 J-.566 E.03247
G1 X92.461 Y103.034 E.01269
; LINE_WIDTH: 0.402734
G1 X92.338 Y102.89 E.00457
; LINE_WIDTH: 0.44041
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471595
G1 X92.205 Y102.75 E.00247
; LINE_WIDTH: 0.489937
G1 X91.825 Y102.369 E.016
M204 S10000
G1 X92.438 Y102.69 F42000
; LINE_WIDTH: 0.442415
G1 F2669
M204 S6000
G1 X91.823 Y102.57 E.01667
; LINE_WIDTH: 0.418074
G1 X91.705 Y102.551 E.003
; LINE_WIDTH: 0.37617
G1 X91.566 Y102.529 E.00313
; LINE_WIDTH: 0.335138
G1 X91.37 Y102.509 E.00385
; LINE_WIDTH: 0.29882
G1 X91.186 Y102.501 E.00319
G2 X88.873 Y102.5 I-1.177 J93.873 E.03987
G1 X88.695 Y102.505 E.00307
; LINE_WIDTH: 0.329912
G2 X88.439 Y102.528 I.235 J4.05 E.00496
; LINE_WIDTH: 0.367251
G1 X88.348 Y102.542 E.002
; LINE_WIDTH: 0.409773
G2 X87.572 Y102.677 I2.277 J15.408 E.01928
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23128
G3 X78.71 Y102.145 I.19 J-5.564 E.01138
; WIPE_START
G1 F10529.359
G1 X79.118 Y102.174 E-.15521
G1 X80.709 Y102.174 E-.60479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z4.28 F42000
G1 X78.71 Y73.855 Z4.28
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.461669
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.597 J5.537 E.01138
G1 X93.79 Y73.825 E.40873
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10530.441
G1 X91.79 Y73.826 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/51
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.28 I-1.137 J.433 P1  F42000
G1 X100.611 Y97.01 Z4.28
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.61 Y97.039 E.00064
G3 X99.777 Y96.263 I-.68 J-.105 E.06672
G1 X99.913 Y96.246 E.00307
G3 X100.605 Y96.802 I.017 J.688 E.02161
G1 X100.609 Y96.95 E.00331
M204 S250
G1 X100.434 Y97.434 F42000
G1 F2669
M204 S5000
G1 X100.413 Y97.453 E.00065
G3 X99.913 Y96.224 I-.486 J-.519 E.06159
G1 X99.964 Y96.225 E.00114
G3 X100.495 Y97.363 I-.037 J.71 E.03443
G1 X100.473 Y97.388 E.00074
; WIPE_START
G1 F12000
M204 S6000
G1 X100.413 Y97.453 E-.03373
G1 X100.316 Y97.532 E-.04764
G1 X100.19 Y97.597 E-.05379
G1 X100.053 Y97.635 E-.05375
G1 X99.912 Y97.646 E-.0538
G1 X99.772 Y97.628 E-.05382
G1 X99.638 Y97.583 E-.05377
G1 X99.515 Y97.512 E-.0538
G1 X99.409 Y97.419 E-.05376
G1 X99.323 Y97.306 E-.05385
G1 X99.262 Y97.178 E-.05382
G1 X99.227 Y97.041 E-.05379
G1 X99.22 Y96.9 E-.05381
G1 X99.241 Y96.76 E-.0538
G1 X99.271 Y96.678 E-.03307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z4.44 F42000
G1 X94.99 Y80.71 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.598 Y88.248 Z4.44 F42000
G1 X88.391 Y102.935 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.535 Y102.883 E.00415
G3 X88.742 Y102.846 I.367 J1.466 E.00571
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.238 Y102.992 I.017 J-1.511 E.10956
G1 X88.334 Y102.956 E.00279
M204 S250
G1 X88.527 Y103.31 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.629 Y103.274 E.00272
G3 X88.787 Y103.245 I.273 J1.076 E.00404
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.416 Y103.351 I.007 J-1.11 E.07489
G1 X88.471 Y103.331 E.00146
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.629 Y103.274 E-.0639
G1 X88.787 Y103.245 E-.06107
G1 X90.458 Y103.242 E-.63503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.159 Y102.161 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.329 Y102.161 E.0046
G1 X93.088 Y103.277 E.0366
G3 X91.487 Y106.189 I-1.592 J1.021 E.10997
G1 X88.513 Y106.189 E.08059
G3 X86.911 Y103.278 I-.009 J-1.891 E.10995
G1 X87.671 Y102.161 E.0366
G1 X92.099 Y102.161 E.11999
; WIPE_START
G1 F10826.06
G1 X92.329 Y102.161 E-.08729
G1 X93.088 Y103.277 E-.51324
G1 X93.202 Y103.482 E-.08884
G1 X93.27 Y103.655 E-.07063
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.257 E.0125
G1 X78.178 Y102.183 E.00856
G3 X77.49 Y101.305 I.23 J-.888 E.03013
G1 X77.49 Y74.692 E.66907
G3 X78.138 Y73.828 I.916 J.012 E.02905
G1 X78.51 Y73.739 E.00961
G1 X78.51 Y74.24 E.0126
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.645 Y73.791 E.19245
G3 X102.51 Y74.692 I-.071 J.935 E.03439
G1 X102.51 Y101.308 E.66914
G3 X101.646 Y102.209 I-.926 J-.022 E.03445
G1 X93.99 Y102.21 E.19248
M73 P56 R4
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.793 I-2.656 J2.15 E.03435
G3 X91.496 Y106.59 I-2.243 J.499 E.10325
G1 X88.504 Y106.59 E.07521
G3 X86.574 Y103.061 I.001 J-2.293 E.12337
G1 X86.895 Y102.59 E.01431
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I-.001 J-2.092 E.08267
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.843 Y73.411 E.54406
G3 X102.89 Y75.503 I-.048 J2.095 E.08147
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.165 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03383
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.18 Y102.369 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.494809
G1 F2669
M204 S6000
G1 X87.802 Y102.742 E.01594
; LINE_WIDTH: 0.474272
G1 X87.739 Y102.809 E.00264
; LINE_WIDTH: 0.441329
G1 X87.662 Y102.89 E.00297
; LINE_WIDTH: 0.401165
G2 X87.529 Y103.046 I2.422 J2.202 E.00489
; LINE_WIDTH: 0.380179
G2 X87.001 Y104.304 I1.534 J1.385 E.03136
G1 X87.001 Y104.326 E.00051
G2 X87.111 Y104.92 I1.774 J-.021 E.01368
; LINE_WIDTH: 0.333161
G1 X87.164 Y105.043 E.00262
G2 X87.25 Y105.204 I2.23 J-1.098 E.00355
; LINE_WIDTH: 0.293759
G2 X87.383 Y105.389 I1.342 J-.822 E.00385
; LINE_WIDTH: 0.250345
G1 X87.575 Y105.586 E.00388
; LINE_WIDTH: 0.20482
G1 X87.726 Y105.706 E.00215
; LINE_WIDTH: 0.164298
G2 X87.895 Y105.81 I1.728 J-2.615 E.00168
; LINE_WIDTH: 0.121318
G2 X88.064 Y105.889 I1.608 J-3.232 E.00105
; LINE_WIDTH: 0.0931955
G1 X88.137 Y105.916 E.0003
M204 S10000
G1 X91.857 Y105.917 F42000
; LINE_WIDTH: 0.107858
G1 F2669
M204 S6000
G2 X92.016 Y105.855 I-.851 J-2.415 E.00082
G1 X92.064 Y105.831 E.00026
; LINE_WIDTH: 0.154895
G2 X92.236 Y105.733 I-1.382 J-2.609 E.00155
; LINE_WIDTH: 0.195902
G2 X92.4 Y105.61 I-2.011 J-2.858 E.00216
; LINE_WIDTH: 0.239833
G2 X92.56 Y105.455 I-2.955 J-3.224 E.00298
; LINE_WIDTH: 0.285659
G2 X92.743 Y105.215 I-1.538 J-1.361 E.00495
; LINE_WIDTH: 0.333901
G2 X92.9 Y104.89 I-1.618 J-.981 E.00706
; LINE_WIDTH: 0.380217
G2 X92.783 Y103.497 I-1.59 J-.568 E.03251
G1 X92.462 Y103.035 E.01269
; LINE_WIDTH: 0.402747
G1 X92.338 Y102.89 E.00457
; LINE_WIDTH: 0.440478
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.47173
G1 X92.205 Y102.749 E.00248
; LINE_WIDTH: 0.490117
G1 X91.824 Y102.369 E.016
M204 S10000
G1 X92.438 Y102.691 F42000
; LINE_WIDTH: 0.442283
G1 F2669
M204 S6000
G1 X91.823 Y102.57 E.01667
; LINE_WIDTH: 0.417983
G1 X91.704 Y102.551 E.003
; LINE_WIDTH: 0.376127
G1 X91.566 Y102.529 E.00312
; LINE_WIDTH: 0.335136
G1 X91.37 Y102.509 E.00386
; LINE_WIDTH: 0.29882
G1 X91.186 Y102.501 E.00318
G2 X88.873 Y102.5 I-1.177 J94.151 E.03988
G1 X88.695 Y102.505 E.00308
; LINE_WIDTH: 0.32994
G2 X88.439 Y102.528 I.236 J4.057 E.00496
; LINE_WIDTH: 0.367235
G1 X88.348 Y102.542 E.00199
; LINE_WIDTH: 0.409642
G2 X87.572 Y102.676 I2.3 J15.566 E.01927
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461796
G1 F2669
M204 S6000
G1 X79.12 Y102.174 E.23127
G3 X78.71 Y102.146 I.217 J-6.245 E.01144
; WIPE_START
G1 F10527.32
G1 X79.12 Y102.174 E-.15594
G1 X80.709 Y102.174 E-.60406
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z4.44 F42000
G1 X78.71 Y73.855 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.461649
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.594 J5.485 E.01139
G1 X93.79 Y73.825 E.4087
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10530.926
G1 X91.79 Y73.826 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/51
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.44 I-1.137 J.433 P1  F42000
G1 X100.613 Y97.018 Z4.44
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2670
M204 S5000
G1 X100.61 Y97.037 E.00044
G3 X99.776 Y96.263 I-.68 J-.104 E.06674
G1 X99.913 Y96.246 E.00308
G3 X100.617 Y96.901 I.017 J.688 E.02383
G1 X100.615 Y96.958 E.00128
M204 S250
G1 X100.444 Y97.425 F42000
G1 F2670
M204 S5000
G1 X100.344 Y97.512 E.00295
G3 X99.912 Y96.224 I-.415 J-.577 E.05945
G1 X99.983 Y96.226 E.00159
G3 X100.483 Y97.38 I-.053 J.709 E.03456
; WIPE_START
G1 F12000
M204 S6000
G1 X100.344 Y97.512 E-.07275
G1 X100.222 Y97.583 E-.05375
G1 X100.088 Y97.628 E-.05379
G1 X99.948 Y97.646 E-.05379
G1 X99.807 Y97.635 E-.0538
G1 X99.67 Y97.597 E-.05384
G1 X99.544 Y97.532 E-.05378
G1 X99.434 Y97.444 E-.05381
G1 X99.343 Y97.335 E-.05382
G1 X99.275 Y97.211 E-.05382
G1 X99.233 Y97.076 E-.05375
G1 X99.219 Y96.935 E-.05378
G1 X99.251 Y96.725 E-.08056
G1 X99.266 Y96.689 E-.01498
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2670
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z4.6 F42000
G1 X94.99 Y80.71 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
M73 P57 R4
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2670
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.604 Y88.249 Z4.6 F42000
G1 X88.415 Y102.922 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2670
M204 S6000
G1 X88.682 Y102.854 E.00748
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.357 Y102.939 I.017 J-1.511 E.11311
M204 S250
G1 X88.511 Y103.311 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X88.518 Y103.308 E.00019
G3 X88.737 Y103.252 I.383 J1.042 E.0057
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.372 Y103.374 I.007 J-1.11 E.07364
G1 X88.456 Y103.335 E.00235
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.518 Y103.308 E-.0256
G1 X88.737 Y103.252 E-.08594
G1 X90.443 Y103.244 E-.64847
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.159 Y102.161 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2670
M204 S6000
G1 X92.329 Y102.161 E.0046
G1 X93.089 Y103.278 E.0366
G3 X91.487 Y106.189 I-1.592 J1.021 E.10996
G1 X88.513 Y106.189 E.08059
G3 X86.911 Y103.278 I-.009 J-1.891 E.10995
G1 X87.671 Y102.161 E.0366
G1 X92.099 Y102.161 E.11999
; WIPE_START
G1 F10826.06
G1 X92.329 Y102.161 E-.08728
G1 X93.089 Y103.278 E-.51328
G1 X93.203 Y103.484 E-.08951
G1 X93.27 Y103.655 E-.06993
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2670
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01275
G1 X78.098 Y102.159 E.0107
G3 X77.49 Y101.305 I.333 J-.881 E.02796
G1 X77.49 Y74.695 E.66901
G3 X78.138 Y73.828 I.917 J.01 E.02911
G1 X78.51 Y73.739 E.00962
G1 X78.51 Y74.24 E.01261
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19251
G3 X102.51 Y74.692 I-.053 J.914 E.03451
G1 X102.51 Y101.305 E.66907
G3 X101.647 Y102.209 I-.922 J-.016 E.03452
G1 X93.99 Y102.21 E.19251
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2670
M204 S5000
G3 X93.733 Y103.793 I-2.657 J2.151 E.03435
G3 X91.496 Y106.59 I-2.243 J.499 E.10325
G1 X88.504 Y106.59 E.0752
G3 X86.575 Y103.061 I.001 J-2.293 E.12337
G1 X86.895 Y102.59 E.0143
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08266
G1 X100.845 Y73.411 E.54412
G3 X102.89 Y75.503 I-.05 J2.095 E.0814
G1 X102.89 Y100.497 E.62839
M73 P58 R4
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.165 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2670
M204 S6000
G1 X93.79 Y102.175 E.03383
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.176 Y102.369 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.490144
G1 F2670
M204 S6000
G1 X87.795 Y102.749 E.016
; LINE_WIDTH: 0.470929
G1 X87.732 Y102.816 E.00262
; LINE_WIDTH: 0.437314
G1 X87.652 Y102.901 E.00306
; LINE_WIDTH: 0.395969
G1 X87.499 Y103.083 E.00561
; LINE_WIDTH: 0.38017
G2 X87.067 Y104.785 I1.362 J1.252 E.04125
G2 X87.11 Y104.92 I2.726 J-.804 E.00318
; LINE_WIDTH: 0.329976
G1 X87.12 Y104.945 E.00053
G2 X87.275 Y105.241 I1.513 J-.603 E.00644
; LINE_WIDTH: 0.290216
G1 X87.383 Y105.389 E.00305
; LINE_WIDTH: 0.261353
G1 X87.484 Y105.503 E.00226
; LINE_WIDTH: 0.223994
G2 X87.673 Y105.669 I3.149 J-3.395 E.00311
; LINE_WIDTH: 0.178034
G2 X87.835 Y105.776 I2.295 J-3.286 E.00182
; LINE_WIDTH: 0.135399
G2 X88.01 Y105.866 I.907 J-1.543 E.0013
; LINE_WIDTH: 0.100989
G1 X88.144 Y105.918 E.00063
M204 S10000
G1 X91.857 Y105.917 F42000
; LINE_WIDTH: 0.101585
G1 F2670
M204 S6000
G2 X92.006 Y105.859 I-.793 J-2.261 E.0007
; LINE_WIDTH: 0.139624
G2 X92.182 Y105.766 I-1.539 J-3.13 E.00136
; LINE_WIDTH: 0.181544
G2 X92.332 Y105.663 I-1.417 J-2.222 E.00175
; LINE_WIDTH: 0.224376
G2 X92.517 Y105.501 I-.915 J-1.226 E.00305
; LINE_WIDTH: 0.265401
G1 X92.64 Y105.359 E.00282
; LINE_WIDTH: 0.296327
G1 X92.747 Y105.207 E.00318
; LINE_WIDTH: 0.335158
G2 X92.898 Y104.892 I-1.22 J-.781 E.00688
; LINE_WIDTH: 0.380159
G2 X92.783 Y103.497 I-1.57 J-.572 E.03256
G1 X92.461 Y103.034 E.0127
; LINE_WIDTH: 0.402819
G1 X92.338 Y102.89 E.00456
; LINE_WIDTH: 0.440514
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471745
G1 X92.205 Y102.749 E.00247
; LINE_WIDTH: 0.490106
G1 X91.825 Y102.369 E.01599
M204 S10000
G1 X92.438 Y102.69 F42000
; LINE_WIDTH: 0.442324
G1 F2670
M204 S6000
G1 X91.823 Y102.57 E.01667
; LINE_WIDTH: 0.417988
G1 X91.704 Y102.551 E.003
; LINE_WIDTH: 0.376132
G1 X91.566 Y102.529 E.00312
; LINE_WIDTH: 0.335138
G1 X91.371 Y102.509 E.00385
; LINE_WIDTH: 0.299266
G1 X91.186 Y102.501 E.00319
G2 X88.86 Y102.5 I-1.174 J63.164 E.04018
G2 X88.626 Y102.51 I.033 J3.775 E.00404
; LINE_WIDTH: 0.336112
G1 X88.428 Y102.53 E.0039
; LINE_WIDTH: 0.370344
G1 X88.337 Y102.543 E.00201
; LINE_WIDTH: 0.413632
G2 X87.569 Y102.681 I1.822 J12.393 E.01932
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2670
M204 S6000
G1 X79.118 Y102.174 E.23127
G3 X78.71 Y102.145 I.188 J-5.537 E.01139
; WIPE_START
G1 F10529.355
G1 X79.118 Y102.174 E-.15528
G1 X80.709 Y102.174 E-.60472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z4.6 F42000
G1 X78.71 Y73.855 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.46163
G1 F2670
M204 S6000
G3 X79.118 Y73.826 I.596 J5.521 E.01138
G1 X93.79 Y73.825 E.40869
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10531.405
G1 X91.79 Y73.826 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/51
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I-1.138 J.432 P1  F42000
G1 X100.609 Y97.037 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.605 Y97.071 E.00077
G3 X99.795 Y96.259 I-.673 J-.139 E.06629
G1 X99.914 Y96.246 E.00267
G3 X100.619 Y96.935 I.017 J.687 E.0246
G1 X100.615 Y96.978 E.00096
M204 S250
G1 X100.444 Y97.425 F42000
G1 F2669
M204 S5000
G1 X100.343 Y97.509 E.00293
G3 X99.913 Y96.224 I-.415 J-.575 E.05945
G1 X99.966 Y96.225 E.00119
G3 X100.48 Y97.378 I-.038 J.708 E.03483
; WIPE_START
G1 F12000
M204 S6000
G1 X100.343 Y97.509 E-.07201
G1 X100.222 Y97.583 E-.05374
G1 X100.088 Y97.628 E-.05375
G1 X99.948 Y97.646 E-.05382
G1 X99.737 Y97.619 E-.08054
G1 X99.606 Y97.568 E-.05381
G1 X99.489 Y97.492 E-.05292
G1 X99.363 Y97.364 E-.06806
G1 X99.289 Y97.244 E-.05375
G1 X99.241 Y97.11 E-.05391
G1 X99.22 Y96.97 E-.05373
G1 X99.227 Y96.829 E-.05379
G1 X99.262 Y96.692 E-.05374
G1 X99.265 Y96.686 E-.00242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z4.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z4.76 F42000
G1 X94.99 Y80.71 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.594 Y88.246 Z4.76 F42000
G1 X88.374 Y102.941 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.535 Y102.885 E.00461
G3 X88.742 Y102.846 I.377 J1.464 E.00571
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.246 Y102.991 I.027 J-1.512 E.1093
G1 X88.319 Y102.963 E.00212
M204 S250
G1 X88.51 Y103.316 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.629 Y103.275 E.00316
G3 X88.787 Y103.245 I.28 J1.075 E.00404
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.057 J1.109 E.08603
G1 X88.895 Y105.46 E.05565
G3 X88.42 Y103.352 I.014 J-1.111 E.07463
G1 X88.455 Y103.338 E.00095
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.629 Y103.275 E-.07055
G1 X88.787 Y103.245 E-.06102
G1 X90.441 Y103.242 E-.62843
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.17 Y102.161 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.329 Y102.161 E.00429
G1 X93.088 Y103.277 E.0366
G3 X91.488 Y106.189 I-1.592 J1.021 E.10995
G1 X88.512 Y106.189 E.08061
G3 X86.911 Y103.278 I-.011 J-1.89 E.11
G1 X87.671 Y102.161 E.03661
G1 X92.11 Y102.161 E.12028
; WIPE_START
G1 F10826.06
G1 X92.329 Y102.161 E-.08297
G1 X93.088 Y103.277 E-.5133
G1 X93.204 Y103.486 E-.0904
G1 X93.274 Y103.665 E-.07334
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.257 E.0125
G1 X78.178 Y102.183 E.00856
G3 X77.49 Y101.305 I.23 J-.888 E.03013
G1 X77.49 Y74.695 E.66901
G3 X78.138 Y73.828 I.917 J.01 E.02911
G1 X78.51 Y73.739 E.00961
M73 P59 R4
G1 X78.51 Y74.24 E.0126
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
M73 P59 R3
G1 X101.647 Y73.791 E.19252
G3 X102.51 Y74.692 I-.057 J.918 E.03448
G1 X102.51 Y101.308 E.66914
G3 X101.646 Y102.209 I-.922 J-.019 E.03448
G1 X93.99 Y102.21 E.19249
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.793 I-2.654 J2.15 E.03434
G3 X91.496 Y106.59 I-2.243 J.499 E.10325
G1 X88.504 Y106.59 E.07521
G3 X86.575 Y103.06 I-.003 J-2.291 E.12345
G1 X86.895 Y102.59 E.0143
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08267
G1 X100.848 Y73.411 E.54418
G3 X102.89 Y75.503 I-.048 J2.09 E.08139
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03384
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.189 Y102.369 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.523427
G1 F2669
M204 S6000
G1 X87.853 Y102.692 E.01486
; LINE_WIDTH: 0.496143
G1 X87.769 Y102.778 E.00362
; LINE_WIDTH: 0.450117
G1 X87.669 Y102.882 E.00393
; LINE_WIDTH: 0.402205
G2 X87.529 Y103.045 I2.568 J2.335 E.00515
; LINE_WIDTH: 0.380103
G2 X87.009 Y104.486 I1.411 J1.324 E.03549
G2 X87.111 Y104.919 I1.902 J-.217 E.01005
; LINE_WIDTH: 0.334021
G1 X87.168 Y105.053 E.00284
G2 X87.249 Y105.2 I2.288 J-1.168 E.00329
; LINE_WIDTH: 0.294186
G1 X87.384 Y105.389 E.00394
; LINE_WIDTH: 0.261413
G1 X87.483 Y105.502 E.00222
; LINE_WIDTH: 0.224391
G2 X87.67 Y105.667 I2.551 J-2.704 E.00308
; LINE_WIDTH: 0.179016
G1 X87.68 Y105.674 E.00011
G2 X87.837 Y105.776 I1.606 J-2.307 E.00177
; LINE_WIDTH: 0.134598
G1 X87.895 Y105.81 E.00044
G2 X88.016 Y105.869 I.96 J-1.829 E.00088
; LINE_WIDTH: 0.0978912
G1 X88.142 Y105.918 E.00056
M204 S10000
G1 X91.857 Y105.917 F42000
; LINE_WIDTH: 0.102549
G1 F2669
M204 S6000
G2 X92.012 Y105.857 I-.828 J-2.352 E.00074
G1 X92.017 Y105.854 E.00003
; LINE_WIDTH: 0.144903
G2 X92.209 Y105.75 I-1.067 J-2.182 E.00157
; LINE_WIDTH: 0.192388
G2 X92.394 Y105.615 I-2.167 J-3.178 E.00236
; LINE_WIDTH: 0.238918
G2 X92.56 Y105.455 I-2.981 J-3.267 E.00308
; LINE_WIDTH: 0.285646
G2 X92.743 Y105.215 I-1.515 J-1.344 E.00494
; LINE_WIDTH: 0.33367
G2 X92.899 Y104.894 I-1.63 J-.987 E.00698
; LINE_WIDTH: 0.380153
G2 X92.576 Y103.183 I-1.632 J-.578 E.04112
G1 X92.461 Y103.034 E.00424
; LINE_WIDTH: 0.402681
G1 X92.338 Y102.89 E.00456
; LINE_WIDTH: 0.440378
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471589
G1 X92.205 Y102.749 E.00247
; LINE_WIDTH: 0.489938
G1 X91.824 Y102.369 E.01599
M204 S10000
G1 X92.438 Y102.69 F42000
; LINE_WIDTH: 0.442419
G1 F2669
M204 S6000
G1 X91.823 Y102.57 E.01666
; LINE_WIDTH: 0.418059
G1 X91.704 Y102.551 E.003
; LINE_WIDTH: 0.37614
G1 X91.566 Y102.529 E.00313
; LINE_WIDTH: 0.335137
G1 X91.37 Y102.509 E.00385
; LINE_WIDTH: 0.29882
G1 X91.186 Y102.501 E.00319
G2 X88.873 Y102.5 I-1.177 J93.871 E.03987
G1 X88.695 Y102.505 E.00307
; LINE_WIDTH: 0.329922
G2 X88.439 Y102.528 I.235 J4.052 E.00496
; LINE_WIDTH: 0.367255
G1 X88.348 Y102.542 E.002
; LINE_WIDTH: 0.409726
G2 X87.572 Y102.676 I2.291 J15.513 E.01927
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23128
G3 X78.71 Y102.145 I.188 J-5.53 E.01138
; WIPE_START
G1 F10529.358
G1 X79.118 Y102.174 E-.15522
G1 X80.709 Y102.174 E-.60479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z4.76 F42000
G1 X78.71 Y73.855 Z4.76
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.46161
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.596 J5.515 E.01138
G1 X93.79 Y73.825 E.40867
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10531.883
G1 X91.79 Y73.826 E-.76
; WIPE_END
M73 P60 R3
G1 E-.04 F1800
; layer num/total_layer_count: 28/51
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I-1.138 J.431 P1  F42000
G1 X100.593 Y97.079 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.578 Y97.171 E.00209
G3 X99.844 Y96.251 I-.645 J-.237 E.06512
G1 X99.918 Y96.246 E.00164
G3 X100.62 Y96.92 I.014 J.688 E.0242
G1 X100.603 Y97.019 E.00225
M204 S250
G1 X100.444 Y97.425 F42000
G1 F2669
M204 S5000
G1 X100.342 Y97.509 E.00294
G3 X99.913 Y96.224 I-.415 J-.575 E.05944
G1 X99.967 Y96.225 E.00121
G3 X100.48 Y97.378 I-.039 J.708 E.0348
; WIPE_START
G1 F12000
M204 S6000
G1 X100.342 Y97.509 E-.07225
G1 X100.222 Y97.583 E-.05363
G1 X100.088 Y97.628 E-.05378
G1 X99.948 Y97.646 E-.05384
G1 X99.737 Y97.619 E-.08054
G1 X99.606 Y97.568 E-.05376
G1 X99.489 Y97.492 E-.05297
G1 X99.363 Y97.364 E-.06807
G1 X99.289 Y97.243 E-.05381
G1 X99.241 Y97.11 E-.05379
G1 X99.22 Y96.97 E-.05377
G1 X99.227 Y96.829 E-.05378
G1 X99.262 Y96.692 E-.05388
G1 X99.264 Y96.687 E-.00214
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z4.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z4.92 F42000
G1 X94.99 Y80.71 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.582 Y88.243 Z4.92 F42000
G1 X88.332 Y102.952 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.377 Y102.934 E.0013
G3 X88.682 Y102.854 I.535 J1.414 E.00858
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X88.186 Y103.022 I.027 J-1.512 E.10747
G1 X88.278 Y102.978 E.00278
M204 S250
G1 X88.497 Y103.317 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.518 Y103.309 E.00058
G3 X88.737 Y103.252 I.391 J1.04 E.0057
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.061 J1.109 E.08581
G1 X88.895 Y105.46 E.05565
G3 X88.373 Y103.376 I.014 J-1.111 E.07331
G1 X88.443 Y103.343 E.00195
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.518 Y103.309 E-.03146
G1 X88.737 Y103.252 E-.086
G1 X90.428 Y103.244 E-.64253
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.17 Y102.161 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.329 Y102.161 E.00429
G1 X93.088 Y103.277 E.0366
G3 X91.488 Y106.189 I-1.592 J1.021 E.10995
G1 X88.512 Y106.189 E.08063
G3 X86.912 Y103.277 I-.008 J-1.891 E.10994
G1 X87.671 Y102.161 E.0366
G1 X92.11 Y102.161 E.12028
; WIPE_START
G1 F10826.06
G1 X92.329 Y102.161 E-.08296
G1 X93.088 Y103.277 E-.51328
G1 X93.205 Y103.487 E-.09117
G1 X93.274 Y103.665 E-.07258
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.257 E.01249
G1 X78.178 Y102.183 E.00856
G3 X77.49 Y101.305 I.23 J-.888 E.03013
G1 X77.49 Y74.692 E.66907
G3 X78.138 Y73.828 I.917 J.012 E.02904
G1 X78.51 Y73.739 E.00962
G1 X78.51 Y74.24 E.0126
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.645 Y73.791 E.19245
G3 X102.51 Y74.692 I-.071 J.934 E.03439
G1 X102.51 Y101.305 E.66907
G3 X101.646 Y102.209 I-.922 J-.016 E.03455
G1 X93.99 Y102.21 E.19249
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.793 I-2.654 J2.15 E.03433
G3 X91.496 Y106.59 I-2.243 J.499 E.10325
G1 X88.504 Y106.59 E.07522
G3 X86.575 Y103.06 I.001 J-2.293 E.12337
G1 X86.895 Y102.59 E.0143
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
M73 P61 R3
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08266
G1 X100.85 Y73.411 E.54424
G3 X102.89 Y75.503 I-.05 J2.09 E.08133
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03384
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.176 Y102.369 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.489841
G1 F2669
M204 S6000
G1 X87.795 Y102.75 E.016
; LINE_WIDTH: 0.471516
G1 X87.735 Y102.812 E.00247
; LINE_WIDTH: 0.440361
G1 X87.662 Y102.89 E.00282
; LINE_WIDTH: 0.402699
G1 X87.539 Y103.034 E.00457
; LINE_WIDTH: 0.380199
G2 X87.001 Y104.326 I1.523 J1.392 E.03219
G2 X87.11 Y104.919 I1.844 J-.034 E.01364
; LINE_WIDTH: 0.333939
G1 X87.13 Y104.968 E.00103
G2 X87.247 Y105.2 I1.989 J-.861 E.00508
; LINE_WIDTH: 0.294012
G2 X87.383 Y105.389 I1.379 J-.843 E.00395
; LINE_WIDTH: 0.256121
G2 X87.533 Y105.55 I1.724 J-1.461 E.00318
; LINE_WIDTH: 0.210224
G2 X87.726 Y105.706 I.957 J-.984 E.00286
; LINE_WIDTH: 0.170272
G1 X87.839 Y105.779 E.00119
; LINE_WIDTH: 0.136381
G2 X88.009 Y105.866 I1.412 J-2.569 E.00127
; LINE_WIDTH: 0.0989111
G1 X88.136 Y105.915 E.00057
M204 S10000
G1 X91.857 Y105.917 F42000
; LINE_WIDTH: 0.107771
G1 F2669
M204 S6000
G2 X92.016 Y105.855 I-.852 J-2.415 E.00082
G1 X92.065 Y105.831 E.00026
; LINE_WIDTH: 0.15444
G2 X92.23 Y105.736 I-1.382 J-2.608 E.00149
; LINE_WIDTH: 0.198514
G2 X92.422 Y105.591 I-1.546 J-2.243 E.00257
; LINE_WIDTH: 0.242272
G2 X92.56 Y105.455 I-3.409 J-3.606 E.00264
; LINE_WIDTH: 0.285727
G2 X92.743 Y105.215 I-1.486 J-1.322 E.00494
; LINE_WIDTH: 0.333582
G2 X92.898 Y104.896 I-1.635 J-.99 E.00694
; LINE_WIDTH: 0.380129
G2 X92.783 Y103.497 I-1.589 J-.573 E.03263
G1 X92.461 Y103.034 E.01269
; LINE_WIDTH: 0.402687
G1 X92.338 Y102.89 E.00456
; LINE_WIDTH: 0.440356
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471578
G1 X92.205 Y102.749 E.00248
; LINE_WIDTH: 0.48996
G1 X91.824 Y102.369 E.016
M204 S10000
G1 X92.441 Y102.695 F42000
; LINE_WIDTH: 0.447944
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01658
; LINE_WIDTH: 0.428982
G1 X91.754 Y102.558 E.00219
; LINE_WIDTH: 0.396698
G1 X91.655 Y102.541 E.00239
; LINE_WIDTH: 0.361582
G1 X91.515 Y102.523 E.00301
; LINE_WIDTH: 0.300796
G1 X91.186 Y102.501 E.00572
G2 X88.86 Y102.5 I-1.174 J63.164 E.04041
G2 X88.626 Y102.509 I.033 J3.775 E.00406
; LINE_WIDTH: 0.336121
G1 X88.428 Y102.53 E.00391
; LINE_WIDTH: 0.370383
G1 X88.337 Y102.543 E.00201
; LINE_WIDTH: 0.413696
G2 X87.569 Y102.681 I1.825 J12.409 E.01931
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23128
G3 X78.71 Y102.145 I.19 J-5.563 E.01138
; WIPE_START
G1 F10529.356
G1 X79.118 Y102.174 E-.15521
G1 X80.709 Y102.174 E-.60479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z4.92 F42000
G1 X78.71 Y73.855 Z4.92
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.461591
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.597 J5.521 E.01138
G1 X93.79 Y73.825 E.40865
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10532.368
G1 X91.79 Y73.826 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/51
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.92 I-1.138 J.431 P1  F42000
G1 X100.603 Y97.075 Z4.92
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.576 Y97.17 E.00222
G3 X99.777 Y96.263 I-.646 J-.237 E.06368
G1 X99.913 Y96.246 E.00307
G3 X100.613 Y97.016 I.017 J.688 E.02641
M204 S250
G1 X100.444 Y97.425 F42000
G1 F2669
M204 S5000
G1 X100.344 Y97.51 E.00295
G3 X99.913 Y96.224 I-.416 J-.576 E.05956
G1 X99.968 Y96.225 E.00123
G3 X100.482 Y97.379 I-.04 J.709 E.0348
; WIPE_START
G1 F12000
M204 S6000
G1 X100.344 Y97.51 E-.07268
G1 X100.222 Y97.583 E-.05381
G1 X100.088 Y97.628 E-.0537
G1 X99.948 Y97.646 E-.05382
G1 X99.704 Y97.609 E-.0935
G1 X99.575 Y97.551 E-.05413
G1 X99.459 Y97.468 E-.05388
G1 X99.363 Y97.364 E-.05376
G1 X99.289 Y97.243 E-.05378
G1 X99.241 Y97.111 E-.05375
G1 X99.22 Y96.97 E-.05384
G1 X99.227 Y96.829 E-.05382
G1 X99.262 Y96.692 E-.05381
G1 X99.264 Y96.688 E-.00171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z5.08 F42000
G1 X94.99 Y80.71 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.588 Y88.245 Z5.08 F42000
G1 X88.356 Y102.948 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.527 Y102.886 E.00494
G3 X88.682 Y102.854 I.385 J1.463 E.00429
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.083 J1.509 E.12557
G1 X88.885 Y105.861 E.06065
G3 X88.246 Y102.991 I.027 J-1.512 E.1093
G1 X88.3 Y102.97 E.00157
M204 S250
G1 X88.494 Y103.327 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.737 Y103.252 E.0064
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.419 Y103.352 I.015 J-1.111 E.07463
G1 X88.437 Y103.346 E.00046
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.737 Y103.252 E-.11955
G1 X90.422 Y103.244 E-.64045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.17 Y102.161 Z5.08 F42000
M73 P62 R3
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.329 Y102.161 E.00429
G1 X93.088 Y103.277 E.0366
G3 X91.492 Y106.189 I-1.598 J1.017 E.10969
G1 X88.512 Y106.189 E.08074
G3 X86.912 Y103.277 I-.008 J-1.891 E.10994
G1 X87.671 Y102.161 E.0366
G1 X92.11 Y102.161 E.12028
; WIPE_START
G1 F10826.06
G1 X92.329 Y102.161 E-.08297
G1 X93.088 Y103.277 E-.51323
G1 X93.205 Y103.489 E-.09206
G1 X93.274 Y103.665 E-.07173
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01275
G1 X78.098 Y102.159 E.0107
G3 X77.49 Y101.305 I.34 J-.886 E.02793
G1 X77.49 Y74.692 E.66907
G3 X78.138 Y73.828 I.917 J.012 E.02904
G1 X78.51 Y73.739 E.00962
G1 X78.51 Y74.24 E.01261
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19252
G3 X102.51 Y74.692 I-.057 J.918 E.03447
G1 X102.51 Y101.308 E.66916
G3 X101.647 Y102.209 I-.928 J-.025 E.03439
G1 X93.99 Y102.21 E.19251
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.793 I-2.655 J2.151 E.03433
G3 X91.497 Y106.59 I-2.238 J.504 E.1033
G1 X88.504 Y106.59 E.07525
G3 X86.575 Y103.06 I.001 J-2.293 E.12338
G1 X86.895 Y102.59 E.0143
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I-.001 J-2.092 E.08267
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.853 Y73.411 E.5443
G3 X102.89 Y75.503 I-.058 J2.094 E.08122
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03384
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
M73 P63 R3
G1 E-.04 F1800
M204 S10000
G1 X88.189 Y102.369 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.523587
G1 F2669
M204 S6000
G1 X87.854 Y102.692 E.01485
; LINE_WIDTH: 0.495374
G1 X87.766 Y102.781 E.00377
; LINE_WIDTH: 0.451715
G1 X87.679 Y102.871 E.00341
; LINE_WIDTH: 0.425834
G1 X87.659 Y102.893 E.00075
; LINE_WIDTH: 0.396929
G1 X87.499 Y103.083 E.00587
; LINE_WIDTH: 0.380183
G2 X87.045 Y104.709 I1.373 J1.26 E.03949
G2 X87.11 Y104.919 I2.836 J-.756 E.00497
; LINE_WIDTH: 0.329882
G1 X87.12 Y104.945 E.00054
G2 X87.276 Y105.244 I1.583 J-.635 E.00651
; LINE_WIDTH: 0.289611
G1 X87.383 Y105.39 E.003
; LINE_WIDTH: 0.261248
G1 X87.484 Y105.503 E.00223
; LINE_WIDTH: 0.224027
G2 X87.672 Y105.669 I3.053 J-3.284 E.00311
; LINE_WIDTH: 0.177277
G2 X87.841 Y105.779 I1.978 J-2.818 E.00188
; LINE_WIDTH: 0.135115
G1 X88.009 Y105.866 E.00124
; LINE_WIDTH: 0.098876
G1 X88.136 Y105.915 E.00057
M204 S10000
G1 X91.857 Y105.917 F42000
; LINE_WIDTH: 0.102393
G1 F2669
M204 S6000
G2 X92.012 Y105.857 I-.822 J-2.333 E.00074
G1 X92.017 Y105.854 E.00003
; LINE_WIDTH: 0.144536
G2 X92.207 Y105.751 I-1.059 J-2.172 E.00155
; LINE_WIDTH: 0.192093
G2 X92.394 Y105.615 I-2.251 J-3.302 E.00238
; LINE_WIDTH: 0.238932
G2 X92.561 Y105.454 I-2.967 J-3.251 E.00309
; LINE_WIDTH: 0.285726
G2 X92.743 Y105.215 I-1.493 J-1.326 E.00493
; LINE_WIDTH: 0.333463
G2 X92.897 Y104.898 I-1.645 J-.995 E.0069
; LINE_WIDTH: 0.380108
G2 X92.783 Y103.497 I-1.588 J-.575 E.03267
G1 X92.461 Y103.034 E.0127
; LINE_WIDTH: 0.402691
G1 X92.338 Y102.89 E.00456
; LINE_WIDTH: 0.440332
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471524
G1 X92.205 Y102.75 E.00247
; LINE_WIDTH: 0.489855
G1 X91.824 Y102.369 E.01599
M204 S10000
G1 X92.441 Y102.695 F42000
; LINE_WIDTH: 0.447824
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01658
; LINE_WIDTH: 0.428921
G1 X91.754 Y102.558 E.00218
; LINE_WIDTH: 0.396729
G1 X91.655 Y102.541 E.00238
; LINE_WIDTH: 0.361801
G1 X91.516 Y102.523 E.00299
; LINE_WIDTH: 0.300819
G1 X91.186 Y102.501 E.00575
G2 X88.86 Y102.5 I-1.174 J63.165 E.04041
G2 X88.626 Y102.51 I.033 J3.775 E.00407
; LINE_WIDTH: 0.336113
G1 X88.428 Y102.53 E.0039
; LINE_WIDTH: 0.369588
G1 X88.342 Y102.543 E.00189
; LINE_WIDTH: 0.409886
G2 X87.572 Y102.676 I2.29 J15.469 E.01915
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23128
G3 X78.71 Y102.145 I.19 J-5.559 E.01138
; WIPE_START
G1 F10529.347
G1 X79.118 Y102.174 E-.15521
G1 X80.709 Y102.174 E-.60479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z5.08 F42000
G1 X78.71 Y73.855 Z5.08
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.461571
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.596 J5.507 E.01138
G1 X93.79 Y73.825 E.40863
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10532.841
G1 X91.79 Y73.826 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/51
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.08 I-1.138 J.431 P1  F42000
G1 X100.597 Y97.095 Z5.08
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.576 Y97.17 E.00175
G3 X99.776 Y96.263 I-.646 J-.237 E.06367
G1 X99.913 Y96.246 E.00308
G3 X100.61 Y97.036 I.017 J.688 E.02688
M204 S250
G1 X100.444 Y97.425 F42000
G1 F2669
M204 S5000
G1 X100.344 Y97.511 E.00296
G3 X99.913 Y96.224 I-.416 J-.576 E.05955
G1 X99.969 Y96.225 E.00125
G3 X100.483 Y97.378 I-.041 J.709 E.03478
; WIPE_START
G1 F12000
M204 S6000
G1 X100.344 Y97.511 E-.07289
G1 X100.223 Y97.583 E-.05368
G1 X100.088 Y97.628 E-.05383
G1 X99.948 Y97.646 E-.05382
G1 X99.806 Y97.635 E-.05384
G1 X99.67 Y97.597 E-.054
G1 X99.46 Y97.468 E-.09358
G1 X99.363 Y97.364 E-.05382
G1 X99.289 Y97.244 E-.05377
G1 X99.241 Y97.11 E-.05381
G1 X99.22 Y96.97 E-.05381
G1 X99.227 Y96.829 E-.05378
G1 X99.262 Y96.692 E-.05376
G1 X99.264 Y96.688 E-.00162
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z5.24 F42000
G1 X94.99 Y80.71 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.585 Y88.244 Z5.24 F42000
G1 X88.344 Y102.952 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.535 Y102.884 E.00549
G3 X88.742 Y102.846 I.372 J1.465 E.00571
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.077 J1.509 E.12588
G1 X88.885 Y105.861 E.06065
G3 X88.238 Y102.993 I.022 J-1.512 E.10933
G1 X88.288 Y102.974 E.00144
M204 S250
G1 X88.48 Y103.327 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.629 Y103.274 E.00397
G3 X88.787 Y103.245 I.276 J1.076 E.00404
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.417 Y103.352 I.01 J-1.11 E.07474
G1 X88.424 Y103.349 E.00021
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.629 Y103.274 E-.08276
G1 X88.787 Y103.245 E-.06104
G1 X90.408 Y103.242 E-.61621
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.17 Y102.161 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.328 Y102.161 E.00429
G1 X93.088 Y103.277 E.0366
G3 X91.492 Y106.189 I-1.598 J1.018 E.10969
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.277 I-.007 J-1.89 E.10989
G1 X87.672 Y102.161 E.0366
G1 X92.11 Y102.161 E.12026
; WIPE_START
G1 F10826.06
G1 X92.328 Y102.161 E-.08299
G1 X93.088 Y103.277 E-.51322
G1 X93.206 Y103.491 E-.09294
G1 X93.273 Y103.665 E-.07085
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.267 E.01275
G1 X78.098 Y102.159 E.0107
G3 X77.49 Y101.307 I.34 J-.886 E.02788
G1 X77.49 Y74.693 E.66911
G3 X78.138 Y73.828 I.917 J.012 E.02905
G1 X78.51 Y73.738 E.00962
G1 X78.51 Y74.24 E.01261
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19251
G3 X102.51 Y74.692 I-.057 J.918 E.03448
G1 X102.51 Y101.308 E.66914
G3 X101.646 Y102.209 I-.928 J-.025 E.03443
G1 X93.99 Y102.21 E.19249
M73 P64 R3
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.792 I-2.654 J2.15 E.03432
G3 X91.497 Y106.59 I-2.238 J.504 E.10331
G1 X88.503 Y106.59 E.07529
G3 X86.575 Y103.06 I-.001 J-2.291 E.12342
G1 X86.895 Y102.59 E.0143
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I-.001 J-2.092 E.08267
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08266
G1 X100.855 Y73.412 E.54436
G3 X102.89 Y75.503 I-.055 J2.09 E.08121
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.165 Y102.59 E.19188
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03384
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.18 Y102.369 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.494443
G1 F2669
M204 S6000
G1 X87.802 Y102.742 E.01594
; LINE_WIDTH: 0.473106
G1 X87.735 Y102.812 E.00278
; LINE_WIDTH: 0.437875
G1 X87.652 Y102.901 E.0032
; LINE_WIDTH: 0.395785
G1 X87.499 Y103.083 E.0056
; LINE_WIDTH: 0.380151
G2 X87.065 Y104.785 I1.364 J1.254 E.04125
G1 X87.11 Y104.918 E.00317
; LINE_WIDTH: 0.333234
G1 X87.164 Y105.044 E.00266
G2 X87.25 Y105.204 I2.519 J-1.255 E.00354
; LINE_WIDTH: 0.293689
G2 X87.384 Y105.39 I2.205 J-1.442 E.00388
; LINE_WIDTH: 0.253624
G1 X87.447 Y105.462 E.00137
G2 X87.544 Y105.559 I1.571 J-1.467 E.00196
; LINE_WIDTH: 0.208873
G2 X87.725 Y105.706 I.875 J-.901 E.00266
; LINE_WIDTH: 0.16442
G2 X87.895 Y105.81 I1.631 J-2.452 E.00169
; LINE_WIDTH: 0.121396
G2 X88.064 Y105.889 I1.64 J-3.308 E.00106
; LINE_WIDTH: 0.0931223
G1 X88.136 Y105.915 E.00029
M204 S10000
G1 X91.856 Y105.917 F42000
; LINE_WIDTH: 0.107763
G1 F2669
M204 S6000
G2 X92.016 Y105.855 I-.854 J-2.417 E.00082
G1 X92.065 Y105.83 E.00026
; LINE_WIDTH: 0.154175
G2 X92.227 Y105.738 I-1.354 J-2.556 E.00145
; LINE_WIDTH: 0.197615
G2 X92.418 Y105.594 I-1.479 J-2.166 E.00255
; LINE_WIDTH: 0.244949
G2 X92.561 Y105.454 I-3.27 J-3.477 E.00274
G1 X92.584 Y105.429 E.00047
; LINE_WIDTH: 0.289128
G2 X92.715 Y105.258 I-2.249 J-1.858 E.00356
G1 X92.747 Y105.207 E.00102
; LINE_WIDTH: 0.334479
G2 X92.897 Y104.899 I-1.41 J-.874 E.00669
; LINE_WIDTH: 0.380147
G2 X92.734 Y103.416 I-1.581 J-.577 E.03485
G1 X92.433 Y103 E.01157
; LINE_WIDTH: 0.407762
G1 X92.335 Y102.887 E.00365
; LINE_WIDTH: 0.441078
G1 X92.264 Y102.812 E.00275
; LINE_WIDTH: 0.471591
G1 X92.205 Y102.75 E.00243
; LINE_WIDTH: 0.489696
G1 X91.824 Y102.369 E.016
M204 S10000
G1 X92.441 Y102.695 F42000
; LINE_WIDTH: 0.447918
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01658
; LINE_WIDTH: 0.428979
G1 X91.754 Y102.558 E.00219
; LINE_WIDTH: 0.396774
G1 X91.655 Y102.541 E.00238
; LINE_WIDTH: 0.361998
G1 X91.518 Y102.524 E.00296
; LINE_WIDTH: 0.300461
G1 X91.186 Y102.501 E.00577
G2 X88.873 Y102.5 I-1.177 J94.149 E.04012
G1 X88.695 Y102.505 E.00309
; LINE_WIDTH: 0.329939
G2 X88.439 Y102.528 I.241 J4.123 E.00496
; LINE_WIDTH: 0.367245
G1 X88.348 Y102.542 E.002
; LINE_WIDTH: 0.40968
G2 X87.572 Y102.676 I2.307 J15.609 E.01926
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461791
G1 F2669
M204 S6000
G1 X79.121 Y102.174 E.23125
G3 X78.71 Y102.146 I.218 J-6.249 E.01146
; WIPE_START
G1 F10527.42
G1 X79.121 Y102.174 E-.15625
G1 X80.709 Y102.174 E-.60376
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z5.24 F42000
G1 X78.71 Y73.855 Z5.24
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.461552
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.595 J5.502 E.01138
G1 X93.79 Y73.826 E.40862
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10533.321
G1 X91.79 Y73.826 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/51
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.24 I-1.138 J.43 P1  F42000
G1 X100.59 Y97.101 Z5.24
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.576 Y97.17 E.00157
G3 X99.777 Y96.263 I-.646 J-.237 E.06368
G1 X99.913 Y96.246 E.00307
G3 X100.618 Y96.922 I.017 J.688 E.02431
G1 X100.599 Y97.042 E.00271
M204 S250
G1 X100.445 Y97.424 F42000
G1 F2669
M204 S5000
G1 X100.343 Y97.509 E.00297
G3 X99.913 Y96.224 I-.414 J-.575 E.05942
G1 X99.97 Y96.225 E.00128
G3 X100.481 Y97.377 I-.042 J.708 E.03473
; WIPE_START
G1 F12000
M204 S6000
G1 X100.343 Y97.509 E-.07259
G1 X100.222 Y97.583 E-.05368
G1 X100.088 Y97.628 E-.05378
G1 X99.948 Y97.646 E-.05383
G1 X99.807 Y97.635 E-.0538
G1 X99.67 Y97.597 E-.05378
G1 X99.544 Y97.532 E-.05384
G1 X99.407 Y97.417 E-.06806
G1 X99.323 Y97.306 E-.05292
G1 X99.262 Y97.178 E-.05377
G1 X99.22 Y96.97 E-.08054
G1 X99.227 Y96.829 E-.05378
G1 X99.262 Y96.692 E-.05384
G1 X99.264 Y96.688 E-.00179
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
M73 P65 R3
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z5.4 F42000
G1 X94.99 Y80.71 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.572 Y88.24 Z5.4 F42000
G1 X88.296 Y102.968 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.376 Y102.933 E.00236
G3 X88.682 Y102.854 I.527 J1.417 E.00858
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X88.184 Y103.02 I.019 J-1.511 E.10786
G1 X88.242 Y102.993 E.00172
M204 S250
G1 X88.461 Y103.333 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.518 Y103.308 E.00156
G3 X88.737 Y103.252 I.385 J1.042 E.0057
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.372 Y103.374 I.008 J-1.11 E.07357
G1 X88.407 Y103.358 E.00096
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.518 Y103.308 E-.04643
G1 X88.737 Y103.252 E-.086
G1 X90.389 Y103.244 E-.62757
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.17 Y102.161 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.328 Y102.161 E.00429
G1 X93.088 Y103.277 E.03659
G3 X91.492 Y106.189 I-1.598 J1.018 E.1097
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.277 I-.007 J-1.89 E.10989
G1 X87.672 Y102.161 E.03659
G1 X92.11 Y102.161 E.12027
; WIPE_START
G1 F10826.06
G1 X92.328 Y102.161 E-.08298
G1 X93.088 Y103.277 E-.51314
G1 X93.207 Y103.493 E-.09372
G1 X93.273 Y103.665 E-.07016
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.257 E.0125
G1 X78.178 Y102.183 E.00856
G3 X77.49 Y101.308 I.23 J-.888 E.03006
G1 X77.49 Y74.692 E.66914
G3 X78.138 Y73.828 I.917 J.013 E.02904
G1 X78.51 Y73.739 E.00962
G1 X78.51 Y74.24 E.0126
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19251
G3 X102.51 Y74.692 I-.074 J.934 E.03433
G1 X102.51 Y101.308 E.66914
G3 X101.646 Y102.209 I-.922 J-.019 E.03448
G1 X93.99 Y102.21 E.19249
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.792 I-2.656 J2.151 E.03432
G3 X91.497 Y106.59 I-2.238 J.504 E.10331
G1 X88.503 Y106.59 E.07529
G3 X86.575 Y103.06 I-.001 J-2.291 E.12342
G1 X86.895 Y102.59 E.01429
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08266
G1 X100.857 Y73.412 E.54442
G3 X102.89 Y75.503 I-.058 J2.09 E.08115
G1 X102.89 Y100.497 E.62839
M73 P66 R3
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.165 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03384
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.176 Y102.369 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.489787
G1 F2669
M204 S6000
G1 X87.795 Y102.75 E.01599
; LINE_WIDTH: 0.470607
G1 X87.732 Y102.816 E.00261
; LINE_WIDTH: 0.437126
G1 X87.652 Y102.901 E.00305
; LINE_WIDTH: 0.39586
G1 X87.499 Y103.083 E.00561
; LINE_WIDTH: 0.380039
G2 X87.067 Y104.785 I1.36 J1.252 E.04123
G2 X87.113 Y104.927 I2.913 J-.868 E.00338
; LINE_WIDTH: 0.327686
G1 X87.12 Y104.945 E.00038
G2 X87.29 Y105.264 I1.706 J-.701 E.00692
; LINE_WIDTH: 0.28745
G1 X87.384 Y105.39 E.00259
; LINE_WIDTH: 0.261197
G1 X87.484 Y105.503 E.00223
; LINE_WIDTH: 0.224085
G2 X87.671 Y105.668 I3.575 J-3.861 E.0031
; LINE_WIDTH: 0.177806
G1 X87.679 Y105.674 E.00009
G2 X87.844 Y105.781 I1.636 J-2.351 E.00184
; LINE_WIDTH: 0.134498
G1 X87.895 Y105.81 E.00038
G2 X88.009 Y105.866 I.929 J-1.774 E.00083
; LINE_WIDTH: 0.0989163
G1 X88.135 Y105.915 E.00057
M204 S10000
G1 X91.864 Y105.915 F42000
; LINE_WIDTH: 0.108347
G1 F2669
M204 S6000
G1 X92.065 Y105.83 E.00106
; LINE_WIDTH: 0.15264
G2 X92.172 Y105.773 I-.832 J-1.697 E.00093
G1 X92.225 Y105.739 E.00048
; LINE_WIDTH: 0.195669
G2 X92.391 Y105.618 I-1.381 J-2.076 E.00216
G1 X92.401 Y105.61 E.00014
; LINE_WIDTH: 0.242529
G2 X92.561 Y105.454 I-3.147 J-3.406 E.00303
G1 X92.581 Y105.432 E.0004
; LINE_WIDTH: 0.288734
G2 X92.715 Y105.258 I-2.224 J-1.844 E.00364
G1 X92.748 Y105.206 E.00102
; LINE_WIDTH: 0.334502
G2 X92.895 Y104.901 I-1.25 J-.791 E.00664
; LINE_WIDTH: 0.38001
G2 X92.783 Y103.497 I-1.568 J-.581 E.03277
G1 X92.461 Y103.034 E.01269
; LINE_WIDTH: 0.402638
G1 X92.338 Y102.89 E.00456
; LINE_WIDTH: 0.440319
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471553
G1 X92.205 Y102.749 E.00248
; LINE_WIDTH: 0.489925
G1 X91.824 Y102.369 E.01599
M204 S10000
G1 X92.441 Y102.695 F42000
; LINE_WIDTH: 0.447832
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01658
; LINE_WIDTH: 0.428925
G1 X91.754 Y102.558 E.00218
; LINE_WIDTH: 0.396849
G1 X91.655 Y102.541 E.00237
; LINE_WIDTH: 0.362175
G1 X91.519 Y102.524 E.00295
; LINE_WIDTH: 0.300859
G1 X91.186 Y102.501 E.0058
G2 X88.86 Y102.5 I-1.174 J63.164 E.04042
G2 X88.626 Y102.509 I.033 J3.766 E.00407
; LINE_WIDTH: 0.336087
G1 X88.428 Y102.53 E.00391
; LINE_WIDTH: 0.370326
G1 X88.337 Y102.543 E.00201
; LINE_WIDTH: 0.413653
G2 X87.569 Y102.681 I1.821 J12.385 E.01931
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23128
G3 X78.71 Y102.145 I.187 J-5.513 E.01139
; WIPE_START
G1 F10529.357
G1 X79.118 Y102.174 E-.15528
G1 X80.709 Y102.174 E-.60472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z5.4 F42000
G1 X78.71 Y73.855 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.461532
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.596 J5.509 E.01138
G1 X93.79 Y73.826 E.40859
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10533.806
G1 X91.79 Y73.826 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/51
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.4 I-1.138 J.431 P1  F42000
G1 X100.596 Y97.1 Z5.4
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.578 Y97.171 E.00165
G3 X99.844 Y96.251 I-.646 J-.237 E.06514
G1 X99.918 Y96.246 E.00164
G3 X100.612 Y97.038 I.015 J.688 E.02685
G1 X100.611 Y97.042 E.00008
M204 S250
G1 X100.445 Y97.424 F42000
G1 F2669
M204 S5000
G1 X100.344 Y97.511 E.00298
G3 X99.913 Y96.224 I-.416 J-.576 E.05955
G1 X99.971 Y96.225 E.0013
G3 X100.483 Y97.378 I-.043 J.709 E.03473
; WIPE_START
G1 F12000
M204 S6000
G1 X100.344 Y97.511 E-.07311
G1 X100.222 Y97.583 E-.0538
G1 X100.088 Y97.628 E-.05376
G1 X99.948 Y97.646 E-.0538
G1 X99.807 Y97.635 E-.05382
G1 X99.67 Y97.597 E-.05401
G1 X99.459 Y97.468 E-.09368
G1 X99.363 Y97.364 E-.05366
G1 X99.289 Y97.243 E-.05393
G1 X99.241 Y97.11 E-.05378
G1 X99.22 Y96.97 E-.05377
G1 X99.227 Y96.829 E-.05382
G1 X99.262 Y96.692 E-.05384
G1 X99.263 Y96.689 E-.00123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z5.56 F42000
G1 X94.99 Y80.71 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.57 Y88.24 Z5.56 F42000
G1 X88.289 Y102.971 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.376 Y102.932 E.00257
G3 X88.682 Y102.854 I.526 J1.417 E.00858
G1 X88.877 Y102.839 E.0053
G1 X91.183 Y102.84 E.06248
G3 X91.123 Y105.861 I-.091 J1.509 E.12538
G1 X88.885 Y105.861 E.06065
G3 X88.184 Y103.019 I.017 J-1.511 E.10794
G1 X88.235 Y102.996 E.00151
M204 S250
G1 X88.454 Y103.336 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.518 Y103.308 E.00176
G3 X88.737 Y103.252 I.383 J1.042 E.0057
G1 X91.158 Y103.241 E.06087
G3 X91.108 Y105.46 I-.064 J1.109 E.08575
G1 X88.895 Y105.46 E.05565
G3 X88.372 Y103.374 I.007 J-1.11 E.07364
G1 X88.4 Y103.361 E.00077
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.518 Y103.308 E-.04937
G1 X88.737 Y103.252 E-.08593
G1 X90.381 Y103.245 E-.6247
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.17 Y102.161 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.328 Y102.161 E.00429
G1 X93.088 Y103.277 E.03659
G3 X91.492 Y106.189 I-1.598 J1.018 E.1097
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.277 I0 J-1.894 E.10975
G1 X87.672 Y102.161 E.03659
G1 X92.11 Y102.161 E.12027
; WIPE_START
G1 F10826.06
G1 X92.328 Y102.161 E-.083
G1 X93.088 Y103.277 E-.51312
G1 X93.208 Y103.495 E-.09447
G1 X93.273 Y103.665 E-.06941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.257 E.01249
G1 X78.178 Y102.183 E.00856
G3 X77.49 Y101.305 I.23 J-.888 E.03013
G1 X77.49 Y74.692 E.66907
G3 X78.138 Y73.828 I.917 J.013 E.02904
G1 X78.51 Y73.739 E.00962
M73 P67 R3
G1 X78.51 Y74.24 E.0126
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19251
G3 X102.51 Y74.692 I-.055 J.916 E.0345
G1 X102.51 Y101.308 E.66914
G3 X101.646 Y102.209 I-.925 J-.021 E.03445
G1 X93.99 Y102.21 E.19249
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.792 I-2.656 J2.151 E.03431
G3 X91.497 Y106.59 I-2.238 J.504 E.10331
G1 X88.503 Y106.59 E.07529
G3 X86.575 Y103.06 I.006 J-2.295 E.12327
G1 X86.895 Y102.59 E.01429
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08266
G1 X100.86 Y73.412 E.54448
G3 X102.89 Y75.503 I-.06 J2.09 E.08109
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19187
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03384
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.176 Y102.369 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.489827
G1 F2669
M204 S6000
G1 X87.795 Y102.749 E.01599
; LINE_WIDTH: 0.471481
G1 X87.735 Y102.812 E.00247
; LINE_WIDTH: 0.4403
G1 X87.662 Y102.89 E.00282
; LINE_WIDTH: 0.401029
G2 X87.53 Y103.045 I2.435 J2.215 E.00489
; LINE_WIDTH: 0.380212
G2 X87.01 Y104.5 I1.412 J1.325 E.03584
G2 X87.109 Y104.918 I1.902 J-.233 E.0097
; LINE_WIDTH: 0.329673
G1 X87.12 Y104.945 E.00057
G2 X87.278 Y105.248 I1.574 J-.63 E.00658
; LINE_WIDTH: 0.289229
G1 X87.384 Y105.39 E.00294
; LINE_WIDTH: 0.261236
G1 X87.484 Y105.503 E.00223
; LINE_WIDTH: 0.224116
G2 X87.671 Y105.668 I3.528 J-3.808 E.0031
; LINE_WIDTH: 0.177591
G1 X87.679 Y105.674 E.00009
G2 X87.846 Y105.782 I1.639 J-2.355 E.00186
; LINE_WIDTH: 0.133506
G1 X87.895 Y105.81 E.00037
G2 X88.016 Y105.869 I.984 J-1.883 E.00087
; LINE_WIDTH: 0.0979101
G1 X88.142 Y105.918 E.00056
M204 S10000
G1 X91.857 Y105.917 F42000
; LINE_WIDTH: 0.107337
G1 F2669
M204 S6000
G2 X92.016 Y105.856 I-.81 J-2.325 E.00081
G1 X92.053 Y105.837 E.0002
; LINE_WIDTH: 0.153286
G2 X92.238 Y105.731 I-1.489 J-2.811 E.00166
; LINE_WIDTH: 0.196837
G2 X92.4 Y105.61 I-1.596 J-2.307 E.00214
; LINE_WIDTH: 0.242403
G2 X92.561 Y105.454 I-3.056 J-3.325 E.00304
G1 X92.581 Y105.432 E.0004
; LINE_WIDTH: 0.28872
G2 X92.715 Y105.258 I-2.225 J-1.846 E.00364
G1 X92.748 Y105.206 E.00102
; LINE_WIDTH: 0.334311
G2 X92.895 Y104.903 I-1.404 J-.87 E.0066
; LINE_WIDTH: 0.379941
G2 X92.781 Y103.494 I-1.598 J-.58 E.03285
G1 X92.461 Y103.034 E.01261
; LINE_WIDTH: 0.402629
G1 X92.338 Y102.89 E.00456
; LINE_WIDTH: 0.440299
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471486
G1 X92.205 Y102.749 E.00247
; LINE_WIDTH: 0.489838
G1 X91.824 Y102.369 E.016
M204 S10000
G1 X92.441 Y102.695 F42000
; LINE_WIDTH: 0.447874
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01658
; LINE_WIDTH: 0.428594
G1 X91.752 Y102.558 E.00224
; LINE_WIDTH: 0.395441
G1 X91.649 Y102.54 E.00246
; LINE_WIDTH: 0.353047
G2 X91.449 Y102.516 I-.496 J3.224 E.00419
; LINE_WIDTH: 0.300008
G2 X91.196 Y102.501 I-.371 J4.046 E.00439
G2 X88.86 Y102.5 I-1.179 J63.512 E.04047
G2 X88.626 Y102.51 I.033 J3.78 E.00406
; LINE_WIDTH: 0.336142
G1 X88.428 Y102.53 E.00391
; LINE_WIDTH: 0.370378
G1 X88.337 Y102.543 E.00201
; LINE_WIDTH: 0.413643
G2 X87.569 Y102.681 I1.838 J12.493 E.0193
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23129
G3 X78.71 Y102.145 I.189 J-5.55 E.01138
; WIPE_START
G1 F10529.347
G1 X79.118 Y102.174 E-.15521
G1 X80.709 Y102.174 E-.60479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z5.56 F42000
G1 X78.71 Y73.855 Z5.56
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.461513
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.596 J5.526 E.01138
G1 X93.79 Y73.826 E.40857
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10534.289
G1 X91.79 Y73.826 E-.76
; WIPE_END
M73 P68 R3
G1 E-.04 F1800
; layer num/total_layer_count: 33/51
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.56 I-1.138 J.43 P1  F42000
G1 X100.589 Y97.128 Z5.56
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.563 Y97.202 E.00176
G3 X99.776 Y96.263 I-.633 J-.269 E.06291
G1 X99.913 Y96.246 E.00307
G3 X100.604 Y97.07 I.017 J.688 E.02763
M204 S250
G1 X100.445 Y97.424 F42000
G1 F2669
M204 S5000
G1 X100.344 Y97.511 E.00298
G3 X99.913 Y96.224 I-.416 J-.576 E.05954
G1 X99.972 Y96.225 E.00132
G3 X100.484 Y97.378 I-.043 J.709 E.03471
; WIPE_START
G1 F12000
M204 S6000
G1 X100.344 Y97.511 E-.07326
G1 X100.222 Y97.583 E-.05378
G1 X100.088 Y97.628 E-.05378
G1 X99.948 Y97.646 E-.05383
G1 X99.704 Y97.609 E-.09347
G1 X99.574 Y97.551 E-.05418
G1 X99.459 Y97.468 E-.05383
G1 X99.363 Y97.364 E-.05378
G1 X99.289 Y97.244 E-.05377
G1 X99.241 Y97.11 E-.05381
G1 X99.22 Y96.97 E-.0538
G1 X99.227 Y96.829 E-.05379
G1 X99.262 Y96.692 E-.05384
G1 X99.263 Y96.689 E-.0011
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z5.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z5.72 F42000
G1 X94.99 Y80.71 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.576 Y88.241 Z5.72 F42000
G1 X88.309 Y102.965 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.534 Y102.883 E.00648
G3 X88.742 Y102.846 I.367 J1.466 E.00572
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.237 Y102.992 I.017 J-1.511 E.10957
G1 X88.253 Y102.986 E.00046
M204 S250
G1 X88.446 Y103.34 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.629 Y103.273 E.00489
G3 X88.787 Y103.245 I.272 J1.076 E.00405
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.391 Y103.363 I.006 J-1.11 E.07423
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.629 Y103.273 E-.09657
G1 X88.787 Y103.245 E-.0611
G1 X90.372 Y103.243 E-.60233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.17 Y102.161 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.328 Y102.161 E.00429
G1 X93.088 Y103.277 E.03658
G3 X91.488 Y106.189 I-1.592 J1.021 E.10995
G1 X88.512 Y106.189 E.08066
G3 X86.912 Y103.277 I-.008 J-1.891 E.10994
G1 X87.672 Y102.161 E.03658
G1 X92.11 Y102.161 E.12027
; WIPE_START
G1 F10826.06
G1 X92.328 Y102.161 E-.08299
G1 X93.088 Y103.277 E-.513
G1 X93.209 Y103.497 E-.09553
G1 X93.273 Y103.665 E-.06848
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.257 E.01249
G1 X78.177 Y102.182 E.00857
G3 X77.49 Y101.305 I.23 J-.888 E.03012
G1 X77.49 Y74.692 E.66907
G3 X78.138 Y73.828 I.917 J.013 E.02903
G1 X78.51 Y73.739 E.00963
G1 X78.51 Y74.24 E.01261
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.647 Y73.791 E.19251
G3 X102.51 Y74.692 I-.055 J.916 E.0345
G1 X102.51 Y101.308 E.66914
G3 X101.647 Y102.209 I-.931 J-.028 E.03439
G1 X93.99 Y102.21 E.19249
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.792 I-2.656 J2.152 E.03431
G3 X91.496 Y106.59 I-2.244 J.5 E.10326
G1 X88.504 Y106.59 E.07523
G3 X86.575 Y103.06 I.001 J-2.293 E.12339
G1 X86.895 Y102.59 E.01428
M73 P69 R3
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.862 Y73.412 E.54454
G3 X102.89 Y75.503 I-.073 J2.099 E.08092
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19188
M204 S10000
M73 P69 R2
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
G1 X93.79 Y102.175 E.03384
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.18 Y102.369 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.494539
G1 F2669
M204 S6000
G1 X87.802 Y102.742 E.01594
; LINE_WIDTH: 0.474034
G1 X87.739 Y102.809 E.00264
; LINE_WIDTH: 0.441152
G1 X87.662 Y102.89 E.00296
; LINE_WIDTH: 0.401038
G2 X87.53 Y103.045 I2.436 J2.216 E.00489
; LINE_WIDTH: 0.380251
G2 X87.001 Y104.326 I1.525 J1.379 E.03187
G2 X87.11 Y104.918 I1.861 J-.038 E.01363
; LINE_WIDTH: 0.333355
G1 X87.164 Y105.045 E.0027
G2 X87.25 Y105.204 I2.304 J-1.144 E.00352
; LINE_WIDTH: 0.293751
G2 X87.383 Y105.389 I1.349 J-.827 E.00386
; LINE_WIDTH: 0.261327
G1 X87.484 Y105.503 E.00225
; LINE_WIDTH: 0.224148
G2 X87.671 Y105.668 I3.485 J-3.759 E.00309
; LINE_WIDTH: 0.177355
G1 X87.679 Y105.674 E.0001
G2 X87.848 Y105.783 I1.659 J-2.385 E.00187
; LINE_WIDTH: 0.134111
G1 X87.895 Y105.811 E.00036
G2 X88.009 Y105.865 I.937 J-1.791 E.00082
; LINE_WIDTH: 0.0989527
G1 X88.135 Y105.915 E.00057
M204 S10000
G1 X91.858 Y105.917 F42000
; LINE_WIDTH: 0.107783
G1 F2669
M204 S6000
G2 X92.019 Y105.853 I-.866 J-2.419 E.00083
G1 X92.066 Y105.83 E.00025
; LINE_WIDTH: 0.153707
G2 X92.222 Y105.741 I-1.326 J-2.506 E.0014
; LINE_WIDTH: 0.196317
G2 X92.414 Y105.598 I-1.409 J-2.09 E.00253
; LINE_WIDTH: 0.244978
G2 X92.562 Y105.454 I-3.137 J-3.359 E.00284
G1 X92.589 Y105.423 E.00057
; LINE_WIDTH: 0.289654
G2 X92.705 Y105.273 I-2.159 J-1.788 E.00316
G1 X92.748 Y105.205 E.00132
; LINE_WIDTH: 0.334464
G2 X92.894 Y104.904 I-1.216 J-.775 E.00656
; LINE_WIDTH: 0.379969
G2 X92.783 Y103.497 I-1.567 J-.585 E.03284
G1 X92.461 Y103.034 E.01269
; LINE_WIDTH: 0.402613
G1 X92.338 Y102.89 E.00456
; LINE_WIDTH: 0.440276
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471486
G1 X92.205 Y102.749 E.00248
; LINE_WIDTH: 0.489849
G1 X91.824 Y102.369 E.01599
M204 S10000
G1 X92.438 Y102.69 F42000
; LINE_WIDTH: 0.442389
G1 F2669
M204 S6000
G1 X91.823 Y102.57 E.01666
; LINE_WIDTH: 0.41804
G1 X91.704 Y102.551 E.003
; LINE_WIDTH: 0.376151
G1 X91.566 Y102.529 E.00313
; LINE_WIDTH: 0.335139
G1 X91.371 Y102.509 E.00385
; LINE_WIDTH: 0.298821
G1 X91.186 Y102.501 E.00319
G2 X88.873 Y102.5 I-1.177 J93.872 E.03987
G1 X88.695 Y102.505 E.00308
; LINE_WIDTH: 0.329943
G2 X88.438 Y102.528 I.243 J4.14 E.00496
; LINE_WIDTH: 0.367297
G1 X88.348 Y102.542 E.00199
; LINE_WIDTH: 0.409737
G2 X87.572 Y102.677 I2.284 J15.446 E.01927
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23129
G3 X78.71 Y102.145 I.189 J-5.551 E.01138
; WIPE_START
G1 F10529.347
G1 X79.118 Y102.174 E-.15521
G1 X80.709 Y102.174 E-.60479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z5.72 F42000
G1 X78.71 Y73.855 Z5.72
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.461493
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.596 J5.506 E.01138
G1 X93.79 Y73.826 E.40856
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10534.774
G1 X91.79 Y73.826 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/51
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.72 I-1.138 J.43 P1  F42000
G1 X100.59 Y97.124 Z5.72
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2669
M204 S5000
G1 X100.576 Y97.17 E.00109
G3 X99.777 Y96.263 I-.646 J-.237 E.06368
G1 X99.913 Y96.246 E.00307
G3 X100.61 Y97.039 I.017 J.688 E.02693
G1 X100.604 Y97.065 E.0006
M204 S250
G1 X100.446 Y97.424 F42000
G1 F2669
M204 S5000
G1 X100.344 Y97.511 E.003
G3 X99.913 Y96.224 I-.416 J-.576 E.05953
G1 X99.973 Y96.225 E.00134
G3 X100.484 Y97.378 I-.044 J.709 E.03468
; WIPE_START
G1 F12000
M204 S6000
G1 X100.344 Y97.511 E-.07343
G1 X100.222 Y97.583 E-.0537
G1 X100.088 Y97.628 E-.0538
G1 X99.948 Y97.646 E-.05382
G1 X99.807 Y97.635 E-.05377
G1 X99.67 Y97.597 E-.05399
G1 X99.459 Y97.468 E-.09371
G1 X99.363 Y97.364 E-.05372
G1 X99.289 Y97.243 E-.05391
G1 X99.241 Y97.11 E-.05378
G1 X99.22 Y96.97 E-.05375
G1 X99.227 Y96.829 E-.05379
G1 X99.262 Y96.692 E-.05382
G1 X99.263 Y96.689 E-.00101
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.99 Y95.29 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.41 Y95.29 E.01458
G1 X94.41 Y93.71 E.03972
G1 X94.99 Y93.71 E.01458
G1 X94.99 Y95.23 E.03822
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.41 Y95.29 E-.22158
G1 X94.41 Y93.873 E-.53842
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

G1 X94.7 Y93.91
G1 Z5.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y95.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y93.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.868 Y86.28 Z5.88 F42000
G1 X94.99 Y80.71 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X94.99 Y82.29 E.03972
G1 X94.41 Y82.29 E.01458
G1 X94.41 Y80.71 E.03972
G1 X94.93 Y80.71 E.01307
M204 S10000
G1 X94.7 Y80.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2669
M204 S6000
G1 X94.7 Y82.09 E.01379
; WIPE_START
G1 F18000
G1 X94.7 Y80.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.572 Y88.24 Z5.88 F42000
G1 X88.292 Y102.977 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X88.534 Y102.884 E.00703
G3 X88.742 Y102.846 I.373 J1.465 E.00572
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.087 J1.509 E.12539
G1 X88.885 Y105.861 E.06065
G3 X88.185 Y103.021 I.023 J-1.512 E.10764
G1 X88.237 Y103 E.00151
M204 S250
G1 X88.436 Y103.348 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X88.629 Y103.274 E.0052
G3 X88.787 Y103.245 I.277 J1.075 E.00405
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.064 J1.109 E.08567
G1 X88.895 Y105.46 E.05565
G3 X88.372 Y103.376 I.011 J-1.11 E.07344
M73 P70 R2
G1 X88.381 Y103.372 E.00022
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.629 Y103.274 E-.10137
G1 X88.787 Y103.245 E-.0611
G1 X90.359 Y103.243 E-.59753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.17 Y102.161 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2669
M204 S6000
G1 X92.328 Y102.161 E.00429
G1 X93.088 Y103.277 E.03659
G3 X91.492 Y106.189 I-1.598 J1.018 E.1097
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.277 I-.007 J-1.89 E.1099
G1 X87.672 Y102.161 E.03659
G1 X92.11 Y102.161 E.12026
; WIPE_START
G1 F10826.06
G1 X92.328 Y102.161 E-.08301
G1 X93.088 Y103.277 E-.5131
G1 X93.21 Y103.499 E-.09616
G1 X93.273 Y103.665 E-.06774
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.99 Y101.76 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2669
M204 S5000
G1 X78.51 Y101.76 E.38919
G1 X78.51 Y102.257 E.0125
G1 X78.177 Y102.182 E.00857
G3 X77.49 Y101.307 I.23 J-.888 E.03007
G1 X77.49 Y74.695 E.66906
G3 X78.138 Y73.828 I.917 J.01 E.02909
G1 X78.51 Y73.739 E.00963
G1 X78.51 Y74.24 E.01261
G1 X93.99 Y74.24 E.38919
G1 X93.99 Y73.79 E.01131
G1 X101.645 Y73.791 E.19245
G3 X102.51 Y74.692 I-.05 J.914 E.03458
G1 X102.51 Y101.308 E.66914
G3 X101.647 Y102.209 I-.936 J-.032 E.03436
G1 X93.99 Y102.21 E.1925
G1 X93.99 Y101.82 E.00981
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.99 Y101.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F2669
M204 S5000
G3 X93.733 Y103.792 I-2.656 J2.151 E.03431
G3 X91.497 Y106.59 I-2.238 J.505 E.10332
G1 X88.503 Y106.59 E.07529
G3 X86.575 Y103.06 I-.001 J-2.291 E.12343
G1 X86.895 Y102.59 E.01429
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I-.001 J-2.092 E.08267
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X100.865 Y73.412 E.5446
G3 X102.89 Y75.503 I-.07 J2.094 E.08092
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.165 Y102.59 E.19188
M204 S10000
G1 X92.581 Y102.175 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2669
M204 S6000
M73 P71 R2
G1 X93.79 Y102.175 E.03384
; WIPE_START
G1 F10480.96
G1 X92.581 Y102.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.176 Y102.369 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.489709
G1 F2669
M204 S6000
G1 X87.795 Y102.75 E.016
; LINE_WIDTH: 0.471373
G1 X87.735 Y102.813 E.00247
; LINE_WIDTH: 0.440211
G1 X87.662 Y102.89 E.00282
; LINE_WIDTH: 0.402898
G1 X87.541 Y103.032 E.00449
; LINE_WIDTH: 0.380046
G1 X87.366 Y103.264 E.00653
G2 X87.11 Y104.918 I1.364 J1.058 E.03938
; LINE_WIDTH: 0.333683
G1 X87.147 Y105.005 E.00186
G2 X87.248 Y105.199 I1.304 J-.559 E.00427
; LINE_WIDTH: 0.294596
G1 X87.309 Y105.292 E.00188
G2 X87.383 Y105.388 I1.333 J-.956 E.00207
; LINE_WIDTH: 0.261866
G1 X87.483 Y105.501 E.00223
; LINE_WIDTH: 0.22368
G1 X87.672 Y105.667 E.0031
; LINE_WIDTH: 0.176569
G1 X87.85 Y105.783 E.00197
; LINE_WIDTH: 0.134385
G2 X88.008 Y105.866 I.668 J-1.089 E.00117
; LINE_WIDTH: 0.101109
G1 X88.143 Y105.917 E.00063
M204 S10000
G1 X91.858 Y105.917 F42000
; LINE_WIDTH: 0.10771
G1 F2669
M204 S6000
G2 X92.018 Y105.854 I-.855 J-2.394 E.00083
G1 X92.066 Y105.83 E.00025
; LINE_WIDTH: 0.153502
G2 X92.22 Y105.743 I-1.334 J-2.521 E.00138
; LINE_WIDTH: 0.195845
G2 X92.412 Y105.599 I-1.394 J-2.076 E.00253
; LINE_WIDTH: 0.241187
G2 X92.562 Y105.453 I-3.109 J-3.336 E.00282
; LINE_WIDTH: 0.285889
G2 X92.743 Y105.215 I-1.416 J-1.266 E.00491
; LINE_WIDTH: 0.3329
G2 X92.894 Y104.907 I-1.686 J-1.014 E.00669
; LINE_WIDTH: 0.379954
G2 X92.783 Y103.497 I-1.587 J-.584 E.03288
G1 X92.461 Y103.034 E.01268
; LINE_WIDTH: 0.402589
G1 X92.338 Y102.89 E.00456
; LINE_WIDTH: 0.440222
G1 X92.265 Y102.812 E.00282
; LINE_WIDTH: 0.471393
G1 X92.205 Y102.75 E.00247
; LINE_WIDTH: 0.489718
G1 X91.824 Y102.369 E.01599
M204 S10000
G1 X92.441 Y102.695 F42000
; LINE_WIDTH: 0.447825
G1 F2669
M204 S6000
G1 X91.838 Y102.573 E.01658
; LINE_WIDTH: 0.429021
G1 X91.755 Y102.559 E.00217
; LINE_WIDTH: 0.397085
G1 X91.656 Y102.542 E.00236
; LINE_WIDTH: 0.36275
G1 X91.522 Y102.524 E.00289
; LINE_WIDTH: 0.300541
G1 X91.186 Y102.501 E.00586
G2 X88.873 Y102.5 I-1.177 J94.01 E.04013
G1 X88.695 Y102.505 E.0031
; LINE_WIDTH: 0.329983
G2 X88.438 Y102.528 I.242 J4.132 E.00497
; LINE_WIDTH: 0.368096
G1 X88.342 Y102.543 E.00211
; LINE_WIDTH: 0.413516
G2 X87.569 Y102.681 I1.83 J12.457 E.01942
M204 S10000
G1 X87.419 Y102.175 F42000
; LINE_WIDTH: 0.461713
G1 F2669
M204 S6000
G1 X79.118 Y102.174 E.23129
G3 X78.71 Y102.145 I.189 J-5.555 E.01138
; WIPE_START
G1 F10529.346
G1 X79.118 Y102.174 E-.15522
G1 X80.709 Y102.174 E-.60479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.172 Y94.561 Z5.88 F42000
G1 X78.71 Y73.855 Z5.88
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.461474
G1 F2669
M204 S6000
G3 X79.118 Y73.826 I.596 J5.521 E.01138
G1 X93.79 Y73.826 E.40854
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10535.247
G1 X91.79 Y73.826 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/51
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.88 I-1.208 J-.146 P1  F42000
G1 X88.257 Y102.985 Z5.88
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2200
M204 S6000
G1 X88.376 Y102.932 E.00352
G3 X88.682 Y102.854 I.526 J1.417 E.00858
G1 X88.877 Y102.839 E.0053
G1 X91.176 Y102.841 E.06228
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06063
G3 X88.184 Y103.019 I.016 J-1.511 E.10795
G1 X88.203 Y103.011 E.00056
M204 S250
G1 X88.422 Y103.351 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2200
M204 S5000
G1 X88.518 Y103.308 E.00264
G3 X88.737 Y103.252 I.383 J1.042 E.00569
G1 X91.156 Y103.241 E.06081
G3 X91.108 Y105.46 I-.057 J1.109 E.08603
G1 X88.895 Y105.46 E.05563
G3 X88.368 Y103.376 I.006 J-1.11 E.07355
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.518 Y103.308 E-.06273
G1 X88.737 Y103.252 E-.08592
G1 X90.346 Y103.245 E-.61135
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.727 Y102.749 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2200
M204 S6000
G1 X93.134 Y103.352 E.0197
G3 X91.492 Y106.189 I-1.642 J.944 E.10737
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.277 I-.007 J-1.89 E.10991
G1 X87.365 Y102.611 E.02183
G1 X87.638 Y102.611 E.00738
G3 X88.507 Y102.411 I.922 J2.017 E.02433
G1 X91.591 Y102.413 E.08357
G3 X92.362 Y102.611 I-.251 J2.585 E.02165
G1 X92.634 Y102.611 E.00738
G1 X92.694 Y102.699 E.00288
M204 S250
G1 X93.028 Y102.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2200
M204 S5000
G1 X92.439 Y102.21 E.0148
G2 X91.605 Y102.013 I-1.109 J2.827 E.02163
G1 X88.502 Y102.01 E.078
G2 X87.561 Y102.21 I.057 J2.585 E.02435
G1 X78.395 Y102.21 E.23043
G3 X77.49 Y101.305 I.019 J-.924 E.03554
G1 X77.49 Y74.695 E.66901
G3 X78.395 Y73.79 I.92 J.015 E.03559
G1 X101.605 Y73.79 E.58353
G3 X102.51 Y74.691 I-.021 J.926 E.03542
G1 X102.51 Y101.305 E.66912
G3 X101.605 Y102.21 I-.926 J-.022 E.03551
G1 X93.088 Y102.21 E.21413
M204 S250
G1 X93.105 Y102.59 F42000
G1 F2200
M204 S5000
M73 P72 R2
G3 X93.733 Y103.791 I-2.654 J2.151 E.0343
G3 X91.497 Y106.59 I-2.242 J.502 E.10328
G1 X88.503 Y106.59 E.07529
G3 X86.575 Y103.06 I-.002 J-2.291 E.12344
G1 X86.895 Y102.59 E.01428
G1 X79.203 Y102.59 E.19338
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08267
G1 X100.867 Y73.412 E.54467
G3 X102.89 Y75.503 I-.067 J2.089 E.0809
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.483 Y103.155 E-.24638
G1 X93.632 Y103.465 E-.13049
G1 X93.733 Y103.791 E-.1299
G1 X93.783 Y104.13 E-.13003
G1 X93.789 Y104.324 E-.0738
G1 X93.775 Y104.453 E-.0494
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

G1 X92.913 Y104.852
G1 Z5.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.337457
G1 F2200
M204 S6000
G3 X92.752 Y105.201 I-1.662 J-.555 E.00761
; LINE_WIDTH: 0.290135
G3 X92.596 Y105.415 I-1.995 J-1.287 E.00442
G1 X92.585 Y105.428 E.00029
; LINE_WIDTH: 0.2431
G3 X92.402 Y105.608 I-2.5 J-2.362 E.00348
; LINE_WIDTH: 0.193467
G3 X92.207 Y105.751 I-4.11 J-5.399 E.00252
; LINE_WIDTH: 0.143872
G3 X92.016 Y105.855 I-1.489 J-2.51 E.00156
; LINE_WIDTH: 0.103218
G3 X91.856 Y105.918 I-.664 J-1.461 E.00077
M204 S10000
G1 X92.913 Y104.852 F42000
; LINE_WIDTH: 0.38055
G1 F2200
M204 S6000
G2 X92.52 Y103.108 I-1.743 J-.523 E.04217
G1 X92.509 Y103.095 E.00038
G2 X92.384 Y102.978 I-.173 J.06 E.00403
; LINE_WIDTH: 0.330421
G1 X92.322 Y102.955 E.00127
; LINE_WIDTH: 0.29492
G1 X92.276 Y102.933 E.00086
; LINE_WIDTH: 0.268089
G1 X92.2 Y102.888 E.00134
; LINE_WIDTH: 0.230156
G1 X92 Y102.786 E.00287
; LINE_WIDTH: 0.191822
G1 X91.858 Y102.731 E.00156
; LINE_WIDTH: 0.156925
G1 X91.709 Y102.687 E.00124
; LINE_WIDTH: 0.122795
G2 X91.541 Y102.654 I-.458 J1.873 E.00099
; LINE_WIDTH: 0.0940352
G1 X91.457 Y102.645 E.00033
M204 S10000
G1 X88.555 Y102.643 F42000
; LINE_WIDTH: 0.105419
G1 F2200
M204 S6000
G1 X88.353 Y102.672 E.00095
; LINE_WIDTH: 0.13524
G1 X88.28 Y102.688 E.00049
; LINE_WIDTH: 0.160441
G1 X88.135 Y102.733 E.00125
; LINE_WIDTH: 0.198161
G1 X87.944 Y102.812 E.00221
; LINE_WIDTH: 0.227572
G1 X87.871 Y102.849 E.00103
; LINE_WIDTH: 0.25944
G1 X87.711 Y102.939 E.00269
; LINE_WIDTH: 0.299492
G3 X87.252 Y103.146 I-3.047 J-6.143 E.0087
M204 S10000
G1 X87.743 Y102.792 F42000
; LINE_WIDTH: 0.380314
G1 F2200
M204 S6000
G2 X87.07 Y103.844 I2.216 J2.159 E.02836
G2 X87.113 Y104.927 I1.612 J.479 E.02489
; LINE_WIDTH: 0.333694
G1 X87.13 Y104.968 E.00085
G2 X87.247 Y105.199 I2.035 J-.887 E.00507
; LINE_WIDTH: 0.287376
G2 X87.434 Y105.449 I1.493 J-.926 E.00515
; LINE_WIDTH: 0.246238
G1 X87.546 Y105.56 E.00217
; LINE_WIDTH: 0.214774
G1 X87.68 Y105.674 E.00207
; LINE_WIDTH: 0.18199
G1 X87.8 Y105.754 E.00139
; LINE_WIDTH: 0.147473
G1 X87.947 Y105.837 E.00124
; LINE_WIDTH: 0.106564
G2 X88.142 Y105.918 I.732 J-1.484 E.001
; WIPE_START
G1 F18000
G1 X87.947 Y105.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.232 Y101.507 Z6.04 F42000
G1 X100.585 Y97.13 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2200
M204 S5000
G1 X100.576 Y97.17 E.00091
G3 X99.776 Y96.263 I-.646 J-.237 E.06368
G1 X99.913 Y96.246 E.00307
G3 X100.618 Y96.925 I.017 J.688 E.02437
G1 X100.594 Y97.071 E.00332
M204 S250
G1 X100.446 Y97.423 F42000
G1 F2200
M204 S5000
G1 X100.343 Y97.509 E.003
G3 X99.913 Y96.224 I-.414 J-.576 E.05939
G1 X99.974 Y96.225 E.00137
G3 X100.482 Y97.376 I-.045 J.708 E.03463
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.343 Y97.509 E-.07314
G1 X100.222 Y97.583 E-.05368
G1 X100.088 Y97.628 E-.05382
G1 X99.948 Y97.646 E-.0538
G1 X99.806 Y97.635 E-.05384
G1 X99.67 Y97.597 E-.05376
G1 X99.544 Y97.532 E-.05382
G1 X99.434 Y97.444 E-.05376
G1 X99.343 Y97.335 E-.05386
G1 X99.275 Y97.211 E-.05382
G1 X99.22 Y96.97 E-.09377
G1 X99.227 Y96.829 E-.0538
G1 X99.262 Y96.692 E-.05386
G1 X99.263 Y96.689 E-.00127
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/51
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.04 I-.604 J-1.056 P1  F42000
G1 X88.197 Y103.017 Z6.04
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2212
M204 S6000
G1 X88.238 Y102.992 E.00129
G3 X88.742 Y102.846 I.664 J1.358 E.01429
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X87.923 Y103.198 I.017 J-1.511 E.09936
G1 X88.147 Y103.05 E.00727
M204 S250
G1 X88.417 Y103.35 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2212
M204 S5000
G1 X88.629 Y103.275 E.00567
G3 X88.787 Y103.245 I.28 J1.075 E.00404
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.367 Y103.38 I.014 J-1.111 E.07313
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.629 Y103.275 E-.10728
G1 X88.787 Y103.245 E-.06106
G1 X90.344 Y103.243 E-.59166
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.726 Y102.747 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2212
M204 S6000
G1 X93.137 Y103.357 E.01993
G3 X91.492 Y106.189 I-1.64 J.941 E.10731
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.276 I-.007 J-1.89 E.10992
G1 X87.366 Y102.611 E.02182
G1 X87.638 Y102.611 E.00737
G3 X88.507 Y102.411 I.921 J2.013 E.02434
G1 X91.592 Y102.413 E.08358
G3 X92.363 Y102.611 I-.123 J2.083 E.0217
G1 X92.634 Y102.611 E.00737
M73 P73 R2
G1 X92.693 Y102.697 E.00282
M204 S250
G1 X93.026 Y102.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2212
M204 S5000
G1 X92.439 Y102.21 E.01474
G2 X91.605 Y102.013 I-.955 J2.172 E.02167
G1 X88.502 Y102.01 E.07801
G2 X87.561 Y102.21 I.055 J2.577 E.02435
G1 X78.395 Y102.21 E.23043
G3 X77.49 Y101.305 I.019 J-.925 E.03554
G1 X77.49 Y74.695 E.66901
G3 X78.395 Y73.79 I.92 J.015 E.03559
G1 X101.605 Y73.79 E.58353
G3 X102.51 Y74.695 I-.018 J.923 E.03555
G1 X102.51 Y101.305 E.66903
G3 X101.605 Y102.21 I-.926 J-.022 E.03551
G1 X93.086 Y102.21 E.21418
M204 S250
G1 X93.105 Y102.59 F42000
G1 F2212
M204 S5000
G3 X93.733 Y103.793 I-2.653 J2.151 E.03435
G3 X91.497 Y106.59 I-2.239 J.502 E.10327
G1 X88.503 Y106.59 E.07529
G3 X86.575 Y103.059 I-.002 J-2.291 E.12345
G1 X86.895 Y102.59 E.01427
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I.003 J-2.095 E.08263
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08266
G1 X100.869 Y73.412 E.54472
G3 X102.89 Y75.503 I-.07 J2.089 E.08085
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
M73 P74 R2
G1 X93.425 Y103.059 E-.20377
G1 X93.539 Y103.257 E-.08676
G1 X93.671 Y103.573 E-.13005
G1 X93.733 Y103.793 E-.087
G1 X93.789 Y104.244 E-.17288
G1 X93.784 Y104.454 E-.07954
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

G1 X92.912 Y104.855
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.381767
G1 F2212
M204 S6000
G2 X92.93 Y103.845 I-1.577 J-.534 E.02325
G2 X92.252 Y102.79 I-2.74 J1.017 E.02861
M204 S10000
G1 X92.755 Y103.157 F42000
; LINE_WIDTH: 0.296561
G1 F2212
M204 S6000
G3 X92.277 Y102.933 I1.473 J-3.768 E.00903
; LINE_WIDTH: 0.256343
G1 X92.12 Y102.845 E.0026
; LINE_WIDTH: 0.211446
G2 X91.922 Y102.753 I-1.238 J2.426 E.00252
; LINE_WIDTH: 0.165432
G2 X91.711 Y102.687 I-.683 J1.817 E.00189
; LINE_WIDTH: 0.123047
G2 X91.541 Y102.654 I-.461 J1.88 E.00101
; LINE_WIDTH: 0.0940235
G1 X91.457 Y102.645 E.00033
; WIPE_START
G1 F18000
G1 X91.541 Y102.654 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.912 Y104.855 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.344823
G1 F2212
M204 S6000
G1 X92.803 Y105.108 E.00558
; LINE_WIDTH: 0.308542
G1 X92.664 Y105.328 E.00465
; LINE_WIDTH: 0.2737
G1 X92.563 Y105.453 E.00251
; LINE_WIDTH: 0.238737
G3 X92.392 Y105.616 I-1.697 J-1.597 E.00315
; LINE_WIDTH: 0.191283
G3 X92.199 Y105.756 I-2.251 J-2.908 E.00245
; LINE_WIDTH: 0.142158
G3 X92.01 Y105.858 I-1.947 J-3.391 E.00151
; LINE_WIDTH: 0.102701
G3 X91.855 Y105.918 I-.69 J-1.546 E.00074
M204 S10000
G1 X88.148 Y105.919 F42000
; LINE_WIDTH: 0.103123
G1 F2212
M204 S6000
G3 X87.984 Y105.855 I.841 J-2.405 E.00079
; LINE_WIDTH: 0.143847
G3 X87.8 Y105.755 I1.096 J-2.215 E.00149
; LINE_WIDTH: 0.182172
G1 X87.671 Y105.666 E.00151
; LINE_WIDTH: 0.225585
G3 X87.468 Y105.486 I1.195 J-1.549 E.00338
; LINE_WIDTH: 0.27111
G3 X87.336 Y105.328 I1.302 J-1.232 E.00318
; LINE_WIDTH: 0.29975
G1 X87.248 Y105.199 E.00271
; LINE_WIDTH: 0.333183
G3 X87.12 Y104.945 I1.364 J-.847 E.00554
G1 X87.113 Y104.927 E.00038
; LINE_WIDTH: 0.380355
G3 X87.07 Y103.845 I1.561 J-.604 E.02489
G3 X87.744 Y102.792 I2.895 J1.111 E.02838
M204 S10000
G1 X87.252 Y103.146 F42000
; LINE_WIDTH: 0.299165
G1 F2212
M204 S6000
G2 X87.711 Y102.939 I-2.53 J-6.22 E.00869
G1 X87.723 Y102.933 E.00023
; LINE_WIDTH: 0.256263
G1 X87.88 Y102.844 E.00261
; LINE_WIDTH: 0.230903
G1 X87.891 Y102.839 E.00016
; LINE_WIDTH: 0.208203
G3 X88.069 Y102.757 I1.509 J3.066 E.00222
G1 X88.108 Y102.742 E.00048
; LINE_WIDTH: 0.160539
G3 X88.292 Y102.686 I.989 J2.928 E.00158
G1 X88.297 Y102.685 E.00004
; LINE_WIDTH: 0.111157
G3 X88.476 Y102.651 I.562 J2.487 E.00091
G1 X88.556 Y102.643 E.0004
; WIPE_START
G1 F18000
G1 X88.476 Y102.651 E-.23201
G1 X88.297 Y102.685 E-.52799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.252 Y99.542 Z6.2 F42000
G1 X100.588 Y97.132 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2212
M204 S5000
G1 X100.578 Y97.17 E.00089
G3 X99.801 Y96.258 I-.646 J-.237 E.06425
G1 X99.914 Y96.246 E.00256
G3 X100.612 Y97.038 I.017 J.688 E.0269
G1 X100.603 Y97.074 E.00083
M204 S250
G1 X100.446 Y97.423 F42000
G1 F2212
M204 S5000
G1 X100.344 Y97.511 E.00301
G3 X99.913 Y96.224 I-.415 J-.576 E.05951
G1 X99.975 Y96.226 E.00139
G3 X100.484 Y97.377 I-.046 J.709 E.03464
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.344 Y97.511 E-.07362
G1 X100.222 Y97.583 E-.05384
G1 X100.088 Y97.628 E-.05372
G1 X99.948 Y97.646 E-.0538
G1 X99.807 Y97.635 E-.05379
G1 X99.67 Y97.597 E-.05396
G1 X99.46 Y97.468 E-.09366
G1 X99.363 Y97.364 E-.05387
G1 X99.289 Y97.244 E-.05376
G1 X99.241 Y97.111 E-.05377
G1 X99.22 Y96.97 E-.05385
G1 X99.227 Y96.829 E-.05379
G1 X99.262 Y96.692 E-.05385
G1 X99.263 Y96.69 E-.00072
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/51
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.2 I-.604 J-1.057 P1  F42000
G1 X88.206 Y103.009 Z6.2
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2198
M204 S6000
G1 X88.238 Y102.992 E.00096
G3 X88.742 Y102.846 I.666 J1.357 E.0143
G1 X91.183 Y102.84 E.06615
G3 X91.123 Y105.861 I-.086 J1.509 E.12561
G1 X88.885 Y105.861 E.06065
G3 X88.056 Y103.098 I.019 J-1.511 E.10378
G1 X88.155 Y103.04 E.00312
M204 S250
G1 X88.407 Y103.356 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2198
M204 S5000
G1 X88.416 Y103.352 E.00026
G3 X88.787 Y103.245 I.487 J.998 E.00975
G1 X91.158 Y103.241 E.05961
G3 X91.108 Y105.46 I-.061 J1.109 E.08589
G1 X88.895 Y105.46 E.05565
G3 X88.277 Y103.432 I.008 J-1.11 E.07079
G1 X88.355 Y103.387 E.00226
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.416 Y103.352 E-.02675
G1 X88.629 Y103.273 E-.086
G1 X88.787 Y103.245 E-.06113
G1 X90.329 Y103.243 E-.58612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.725 Y102.745 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2198
M204 S6000
G1 X93.137 Y103.357 E.01998
G3 X91.492 Y106.189 I-1.64 J.941 E.10732
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.276 I-.007 J-1.89 E.10992
G1 X87.366 Y102.611 E.02183
G1 X87.637 Y102.611 E.00736
G3 X88.507 Y102.411 I.92 J2.008 E.02435
G1 X91.592 Y102.413 E.0836
G3 X92.363 Y102.611 I-.124 J2.086 E.02168
G1 X92.634 Y102.611 E.00736
G1 X92.692 Y102.695 E.00277
M204 S250
G1 X93.024 Y102.21 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2198
M204 S5000
G1 X92.44 Y102.21 E.01469
G2 X91.606 Y102.013 I-.955 J2.174 E.02165
G1 X88.503 Y102.01 E.07803
G2 X87.56 Y102.21 I.053 J2.57 E.02436
G1 X78.395 Y102.21 E.23043
G3 X77.49 Y101.308 I.02 J-.925 E.03548
G1 X77.49 Y74.695 E.66908
G3 X78.395 Y73.79 I.92 J.015 E.03558
G1 X101.605 Y73.79 E.58353
G3 X102.51 Y74.692 I-.017 J.923 E.03547
G1 X102.51 Y101.305 E.6691
G3 X101.608 Y102.21 I-.924 J-.019 E.03548
G1 X93.084 Y102.21 E.21429
M204 S250
G1 X93.105 Y102.59 F42000
G1 F2198
M204 S5000
M73 P75 R2
G3 X93.733 Y103.793 I-2.654 J2.151 E.03434
G3 X91.497 Y106.59 I-2.239 J.502 E.10327
G1 X88.503 Y106.59 E.07529
G3 X86.575 Y103.059 I-.002 J-2.291 E.12345
G1 X86.895 Y102.59 E.01427
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.092 J-.001 E.08267
G1 X100.872 Y73.412 E.54478
G3 X102.89 Y75.503 I-.072 J2.089 E.08079
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.425 Y103.059 E-.20378
G1 X93.539 Y103.257 E-.08668
G1 X93.671 Y103.572 E-.13006
G1 X93.733 Y103.793 E-.08705
G1 X93.789 Y104.244 E-.17286
G1 X93.784 Y104.454 E-.07957
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

G1 X92.909 Y104.867
G1 Z5.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.336983
G1 F2198
M204 S6000
G3 X92.749 Y105.203 I-1.538 J-.525 E.00735
; LINE_WIDTH: 0.299175
G1 X92.664 Y105.328 E.00262
; LINE_WIDTH: 0.272591
G3 X92.545 Y105.472 I-1.125 J-.813 E.0029
; LINE_WIDTH: 0.234617
G3 X92.385 Y105.622 I-1.716 J-1.667 E.00286
; LINE_WIDTH: 0.194142
G3 X92.224 Y105.739 I-1.347 J-1.678 E.00208
; LINE_WIDTH: 0.159174
G1 X92.127 Y105.798 E.00092
; LINE_WIDTH: 0.12612
G3 X91.946 Y105.885 I-.974 J-1.783 E.0012
; LINE_WIDTH: 0.0940779
G1 X91.862 Y105.916 E.00035
M204 S10000
G1 X92.909 Y104.867 F42000
; LINE_WIDTH: 0.381719
G1 F2198
M204 S6000
G2 X92.93 Y103.844 I-1.594 J-.545 E.02353
G2 X92.252 Y102.79 I-2.74 J1.017 E.02861
M204 S10000
G1 X92.755 Y103.157 F42000
; LINE_WIDTH: 0.296677
G1 F2198
M204 S6000
G3 X92.277 Y102.933 I1.449 J-3.714 E.00903
; LINE_WIDTH: 0.256426
G1 X92.12 Y102.845 E.0026
; LINE_WIDTH: 0.211243
G2 X91.921 Y102.753 I-1.221 J2.391 E.00254
; LINE_WIDTH: 0.16561
G2 X91.713 Y102.688 I-.706 J1.883 E.00186
; LINE_WIDTH: 0.126888
G1 X91.583 Y102.66 E.0008
; LINE_WIDTH: 0.100623
G1 X91.458 Y102.645 E.00055
M204 S10000
G1 X88.556 Y102.643 F42000
; LINE_WIDTH: 0.111175
G1 F2198
M204 S6000
G1 X88.476 Y102.651 E.0004
G2 X88.297 Y102.685 I.382 J2.516 E.00092
; LINE_WIDTH: 0.160645
G1 X88.291 Y102.686 E.00004
G2 X88.108 Y102.742 I.789 J2.931 E.00158
; LINE_WIDTH: 0.208274
G1 X88.071 Y102.756 E.00045
G2 X87.891 Y102.839 I1.331 J3.154 E.00225
; LINE_WIDTH: 0.230944
G1 X87.88 Y102.844 E.00016
; LINE_WIDTH: 0.25674
G1 X87.72 Y102.934 E.00265
; LINE_WIDTH: 0.296721
G3 X87.245 Y103.157 I-1.934 J-3.509 E.00898
M204 S10000
G1 X87.748 Y102.79 F42000
; LINE_WIDTH: 0.380892
G1 F2198
M204 S6000
G2 X87.07 Y103.845 I2.174 J2.144 E.02853
G2 X87.113 Y104.927 I1.604 J.479 E.02493
; LINE_WIDTH: 0.329394
G1 X87.12 Y104.945 E.00038
G2 X87.278 Y105.245 I1.528 J-.612 E.00653
; LINE_WIDTH: 0.28286
G1 X87.283 Y105.253 E.00015
G2 X87.434 Y105.449 I1.34 J-.879 E.00402
; LINE_WIDTH: 0.246185
G1 X87.546 Y105.561 E.00218
; LINE_WIDTH: 0.214746
G1 X87.679 Y105.674 E.00206
; LINE_WIDTH: 0.181988
G1 X87.8 Y105.754 E.00139
; LINE_WIDTH: 0.147552
G1 X87.946 Y105.836 E.00124
; LINE_WIDTH: 0.106621
G2 X88.142 Y105.918 I.735 J-1.491 E.001
; WIPE_START
G1 F18000
G1 X87.946 Y105.836 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.272 Y101.566 Z6.36 F42000
G1 X100.431 Y97.408 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2198
M204 S5000
G1 X100.331 Y97.492 E.00294
G3 X99.776 Y96.263 I-.401 J-.559 E.05448
G1 X99.913 Y96.246 E.00308
G3 X100.469 Y97.361 I.017 J.688 E.0349
M204 S250
G1 X100.612 Y97.13 F42000
G1 F2198
M204 S5000
G1 X100.567 Y97.242 E.0027
G3 X99.913 Y96.224 I-.638 J-.309 E.06727
G1 X99.976 Y96.226 E.00141
G3 X100.625 Y97.071 I-.047 J.708 E.02698
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.567 Y97.242 E-.06851
G1 X100.497 Y97.364 E-.05363
G1 X100.401 Y97.468 E-.05377
G1 X100.222 Y97.583 E-.08064
G1 X100.088 Y97.628 E-.05377
G1 X99.948 Y97.646 E-.0538
G1 X99.738 Y97.619 E-.0805
G1 X99.606 Y97.568 E-.05385
G1 X99.489 Y97.492 E-.05291
G1 X99.363 Y97.364 E-.06804
G1 X99.289 Y97.243 E-.05386
G1 X99.241 Y97.11 E-.05376
G1 X99.228 Y97.025 E-.03295
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/51
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.36 I-.581 J-1.069 P1  F42000
G1 X88.219 Y103.009 Z6.36
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2042
M204 S6000
G1 X88.383 Y102.93 E.00494
G3 X88.682 Y102.854 I.518 J1.42 E.00838
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.105 Y103.064 I.017 J-1.511 E.1055
G1 X88.165 Y103.036 E.00179
M204 S250
G1 X88.392 Y103.368 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2042
M204 S5000
G1 X88.52 Y103.307 E.00357
G3 X88.737 Y103.252 I.381 J1.043 E.00563
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.057 J1.109 E.08603
G1 X88.895 Y105.46 E.05565
G3 X88.319 Y103.404 I.007 J-1.11 E.07212
G1 X88.338 Y103.395 E.00054
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.52 Y103.307 E-.07675
G1 X88.737 Y103.252 E-.08501
G1 X90.311 Y103.245 E-.59824
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.011 Y102.483 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2042
M204 S6000
G1 X92.363 Y102.611 E.01014
G1 X92.634 Y102.611 E.00736
G3 X93.137 Y103.357 I-7.193 J5.386 E.02439
G3 X91.492 Y106.189 I-1.643 J.94 E.10726
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.276 I-.007 J-1.89 E.10992
G1 X87.366 Y102.611 E.02182
G1 X87.637 Y102.611 E.00736
G3 X88.507 Y102.411 I.918 J2.001 E.02435
G1 X91.586 Y102.413 E.08345
G3 X91.954 Y102.467 I-.119 J2.09 E.01007
; WIPE_START
G1 F10826.06
M73 P76 R2
G1 X92.363 Y102.611 E-.16485
G1 X92.634 Y102.611 E-.1032
G1 X93.137 Y103.357 E-.34189
G1 X93.259 Y103.611 E-.10719
G1 X93.292 Y103.719 E-.04286
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2042
M204 S5000
G3 X93.733 Y103.793 I-2.654 J2.151 E.03434
G3 X91.497 Y106.59 I-2.238 J.503 E.10329
G1 X88.503 Y106.59 E.07529
G3 X86.575 Y103.059 I-.001 J-2.291 E.12345
G1 X86.895 Y102.59 E.01427
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I-.001 J-2.092 E.08266
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X83.819 Y73.41 E.11606
G1 X83.819 Y73.79 E.00955
G1 X78.395 Y73.79 E.13637
G2 X77.49 Y74.695 I.01 J.915 E.03564
G1 X77.49 Y101.305 E.66901
G2 X78.395 Y102.21 I.92 J-.015 E.03559
G1 X87.56 Y102.21 E.23043
G3 X88.502 Y102.01 I.994 J2.362 E.02435
G1 X91.498 Y102.01 E.07531
G3 X92.44 Y102.21 I-.052 J2.562 E.02435
G1 X101.605 Y102.21 E.23043
G2 X102.51 Y101.308 I-.007 J-.912 E.0356
G1 X102.51 Y74.695 E.66907
G2 X101.605 Y73.79 I-.915 J.01 E.03564
G1 X96.181 Y73.79 E.13637
G1 X96.181 Y73.41 E.00955
G1 X100.797 Y73.41 E.11606
G3 X102.89 Y75.503 I.001 J2.092 E.08267
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.425 Y103.059 E-.20373
M73 P77 R2
G1 X93.538 Y103.257 E-.08665
G1 X93.671 Y103.572 E-.13005
G1 X93.733 Y103.793 E-.08709
G1 X93.784 Y104.13 E-.12968
G1 X93.789 Y104.359 E-.08707
G1 X93.778 Y104.453 E-.03573
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

G1 X92.909 Y104.867
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380685
G1 F2042
M204 S6000
G2 X92.954 Y103.936 I-1.623 J-.546 E.02132
G1 X92.923 Y103.823 E.00264
G2 X92.264 Y102.795 I-3.001 J1.198 E.02773
M204 S10000
G1 X92.722 Y103.108 F42000
; LINE_WIDTH: 0.336088
G1 F2042
M204 S6000
G2 X92.323 Y102.955 I-2.582 J6.145 E.0084
; LINE_WIDTH: 0.295839
G1 X92.277 Y102.934 E.00086
; LINE_WIDTH: 0.258664
G1 X92.129 Y102.849 E.00249
; LINE_WIDTH: 0.211995
G2 X91.919 Y102.752 I-1.23 J2.391 E.00269
; LINE_WIDTH: 0.165598
G2 X91.716 Y102.688 I-.66 J1.751 E.00182
; LINE_WIDTH: 0.123584
G2 X91.541 Y102.653 I-.517 J2.109 E.00104
; LINE_WIDTH: 0.0943363
G1 X91.445 Y102.643 E.00038
; WIPE_START
G1 F18000
G1 X91.541 Y102.653 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.909 Y104.867 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.335597
G1 F2042
M204 S6000
G3 X92.743 Y105.215 I-1.657 J-.577 E.00759
; LINE_WIDTH: 0.290384
G3 X92.593 Y105.418 I-2.646 J-1.794 E.00421
; LINE_WIDTH: 0.24489
G3 X92.414 Y105.597 I-1.384 J-1.208 E.00347
; LINE_WIDTH: 0.201419
G3 X92.249 Y105.724 I-1.754 J-2.099 E.00227
; LINE_WIDTH: 0.163822
G1 X92.13 Y105.795 E.00117
; LINE_WIDTH: 0.129648
G1 X91.98 Y105.87 E.00104
; LINE_WIDTH: 0.100136
G1 X91.861 Y105.918 E.00055
M204 S10000
G1 X88.142 Y105.918 F42000
; LINE_WIDTH: 0.092282
G1 F2042
M204 S6000
G1 X88.064 Y105.889 E.00031
; LINE_WIDTH: 0.120714
G3 X87.895 Y105.811 I1.077 J-2.556 E.00105
; LINE_WIDTH: 0.167116
G3 X87.711 Y105.695 I1.647 J-2.845 E.00188
; LINE_WIDTH: 0.201925
G1 X87.605 Y105.613 E.00146
; LINE_WIDTH: 0.232605
G1 X87.488 Y105.507 E.00205
; LINE_WIDTH: 0.260608
G1 X87.384 Y105.39 E.00231
; LINE_WIDTH: 0.293673
G3 X87.25 Y105.204 I2.074 J-1.63 E.00387
; LINE_WIDTH: 0.332641
G3 X87.162 Y105.04 I5.001 J-2.796 E.00362
G1 X87.113 Y104.925 E.00244
; LINE_WIDTH: 0.380964
G3 X87.066 Y103.859 I1.642 J-.606 E.0245
G3 X87.748 Y102.79 I2.861 J1.075 E.02886
M204 S10000
G1 X87.234 Y103.173 F42000
; LINE_WIDTH: 0.294838
G1 F2042
M204 S6000
G1 X87.718 Y102.935 E.00915
; LINE_WIDTH: 0.264267
G1 X87.836 Y102.87 E.00202
; LINE_WIDTH: 0.233279
G1 X87.94 Y102.813 E.00155
; LINE_WIDTH: 0.199897
G3 X88.12 Y102.738 I1.121 J2.413 E.0021
; LINE_WIDTH: 0.161059
G3 X88.284 Y102.687 I.565 J1.557 E.00142
; LINE_WIDTH: 0.126347
G1 X88.425 Y102.659 E.00086
; LINE_WIDTH: 0.0973578
G1 X88.555 Y102.643 E.00054
; WIPE_START
G1 F18000
G1 X88.425 Y102.659 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.418 Y99.6 Z6.52 F42000
G1 X100.432 Y97.408 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2042
M204 S5000
G1 X100.331 Y97.492 E.00295
G3 X99.776 Y96.263 I-.401 J-.559 E.05448
G1 X99.913 Y96.246 E.00307
G3 X100.468 Y97.361 I.017 J.688 E.0349
M204 S250
G1 X100.61 Y97.135 F42000
G1 F2042
M204 S5000
G1 X100.569 Y97.243 E.00259
G3 X99.913 Y96.224 I-.64 J-.308 E.06741
G1 X99.977 Y96.226 E.00143
G3 X100.625 Y97.077 I-.047 J.709 E.02711
; CHANGE_LAYER
; Z_HEIGHT: 6.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.569 Y97.243 E-.06669
G1 X100.451 Y97.419 E-.08047
G1 X100.345 Y97.512 E-.05379
G1 X100.223 Y97.583 E-.05373
G1 X100.088 Y97.628 E-.05381
G1 X99.948 Y97.646 E-.05385
G1 X99.807 Y97.635 E-.05374
G1 X99.67 Y97.597 E-.05388
G1 X99.544 Y97.532 E-.05374
G1 X99.433 Y97.444 E-.05398
G1 X99.289 Y97.244 E-.09367
G1 X99.241 Y97.11 E-.05382
G1 X99.227 Y97.02 E-.03482
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/51
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.52 I-.582 J-1.069 P1  F42000
G1 X88.175 Y103.033 Z6.52
G1 Z6.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2015
M204 S6000
G1 X88.245 Y102.99 E.00223
G3 X88.742 Y102.846 I.662 J1.359 E.01408
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.079 J1.509 E.12581
G1 X88.885 Y105.861 E.06065
G3 X87.937 Y103.19 I.022 J-1.512 E.09953
G1 X88.125 Y103.066 E.00611
M204 S250
G1 X88.39 Y103.368 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2015
M204 S5000
G1 X88.419 Y103.351 E.00085
G3 X88.787 Y103.245 I.486 J.998 E.00967
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.058 J1.109 E.08596
G1 X88.895 Y105.46 E.05565
G3 X88.19 Y103.5 I.011 J-1.11 E.06791
G1 X88.34 Y103.401 E.00451
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.419 Y103.351 E-.03562
G1 X88.629 Y103.273 E-.08499
G1 X88.787 Y103.245 E-.06107
G1 X90.309 Y103.243 E-.57832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.016 Y102.491 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2015
M204 S6000
G1 X92.363 Y102.611 E.00996
G1 X92.634 Y102.611 E.00735
G3 X93.137 Y103.357 I-7.196 J5.388 E.02438
G3 X91.492 Y106.189 I-1.641 J.941 E.1073
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.276 I-.007 J-1.89 E.10992
G1 X87.366 Y102.611 E.02182
G1 X87.637 Y102.611 E.00735
G3 X88.507 Y102.411 I.917 J1.998 E.02436
G1 X91.587 Y102.413 E.08346
G3 X91.927 Y102.46 I-.114 J2.069 E.00931
G1 X91.959 Y102.471 E.00092
; WIPE_START
G1 F10826.06
G1 X92.363 Y102.611 E-.16248
G1 X92.634 Y102.611 E-.10314
G1 X93.137 Y103.357 E-.34176
G1 X93.223 Y103.524 E-.07152
G1 X93.295 Y103.725 E-.0811
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2015
M204 S5000
G3 X93.733 Y103.792 I-2.656 J2.152 E.03432
G3 X91.497 Y106.59 I-2.239 J.503 E.1033
G1 X88.503 Y106.59 E.07529
G3 X86.576 Y103.059 I-.002 J-2.291 E.12345
G1 X86.895 Y102.59 E.01426
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I0 J-2.093 E.08265
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.099 J.006 E.08259
G1 X83.394 Y73.41 E.10537
G1 X83.394 Y73.79 E.00955
G1 X78.395 Y73.79 E.12568
G2 X77.49 Y74.695 I.01 J.915 E.03564
G1 X77.49 Y101.308 E.66907
G2 X78.393 Y102.21 I.927 J-.024 E.03541
G1 X87.56 Y102.21 E.23047
M73 P78 R2
G3 X88.502 Y102.01 I.992 J2.356 E.02436
G1 X91.498 Y102.01 E.07531
G3 X92.44 Y102.21 I-.027 J2.445 E.02437
G1 X101.607 Y102.21 E.23048
G2 X102.51 Y101.305 I-.018 J-.92 E.03553
G1 X102.51 Y74.695 E.66901
G2 X101.605 Y73.79 I-.915 J.01 E.03564
G1 X96.606 Y73.79 E.12568
G1 X96.606 Y73.41 E.00955
G1 X100.797 Y73.41 E.10537
G3 X102.89 Y75.503 I-.003 J2.096 E.08262
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.059 E-.20364
G1 X93.538 Y103.257 E-.08667
G1 X93.632 Y103.465 E-.08685
G1 X93.733 Y103.792 E-.12998
G1 X93.772 Y104.017 E-.08672
G1 X93.789 Y104.358 E-.12994
G1 X93.777 Y104.453 E-.03621
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

G1 X92.909 Y104.867
G1 Z6.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.335575
G1 F2015
M204 S6000
G3 X92.743 Y105.215 I-1.614 J-.556 E.00758
; LINE_WIDTH: 0.289086
G3 X92.585 Y105.428 I-2.185 J-1.456 E.00441
; LINE_WIDTH: 0.241182
G3 X92.391 Y105.619 I-2.704 J-2.556 E.00366
; LINE_WIDTH: 0.191237
G3 X92.197 Y105.758 I-2.078 J-2.694 E.00244
; LINE_WIDTH: 0.142419
G1 X92.172 Y105.773 E.00021
G3 X92.007 Y105.858 I-1.294 J-2.328 E.00131
; LINE_WIDTH: 0.0999598
G1 X91.858 Y105.918 E.00068
M204 S10000
G1 X92.909 Y104.867 F42000
; LINE_WIDTH: 0.3815
G1 F2015
M204 S6000
G2 X92.977 Y104.043 I-1.652 J-.551 E.01889
G1 X92.944 Y103.895 E.00345
G2 X92.252 Y102.79 I-2.688 J.915 E.02976
M204 S10000
G1 X92.755 Y103.157 F42000
; LINE_WIDTH: 0.296892
G1 F2015
M204 S6000
G3 X92.278 Y102.933 I1.44 J-3.686 E.00904
; LINE_WIDTH: 0.256547
G1 X92.12 Y102.845 E.00261
; LINE_WIDTH: 0.215788
G2 X91.957 Y102.767 I-1.525 J3.009 E.00214
; LINE_WIDTH: 0.17051
G2 X91.724 Y102.69 I-.707 J1.748 E.00218
; LINE_WIDTH: 0.12448
G2 X91.541 Y102.653 I-.534 J2.163 E.0011
; LINE_WIDTH: 0.0943299
G1 X91.445 Y102.643 E.00038
M204 S10000
G1 X88.556 Y102.643 F42000
; LINE_WIDTH: 0.0968323
G1 F2015
M204 S6000
G1 X88.425 Y102.659 E.00054
; LINE_WIDTH: 0.13521
G1 X88.21 Y102.708 E.00145
; LINE_WIDTH: 0.181741
G1 X88.014 Y102.78 E.00201
; LINE_WIDTH: 0.211672
G1 X87.94 Y102.813 E.00093
; LINE_WIDTH: 0.233292
G1 X87.836 Y102.87 E.00155
; LINE_WIDTH: 0.264339
G1 X87.718 Y102.935 E.00202
; LINE_WIDTH: 0.294953
G1 X87.234 Y103.173 E.00916
M204 S10000
G1 X87.748 Y102.79 F42000
; LINE_WIDTH: 0.382042
G1 F2015
M204 S6000
G2 X87.056 Y103.894 I1.873 J1.943 E.02984
G1 X87.023 Y104.046 E.00353
G2 X87.081 Y104.834 I1.674 J.272 E.01806
; LINE_WIDTH: 0.344289
G1 X87.129 Y104.968 E.00288
G2 X87.213 Y105.138 I2.265 J-1.006 E.00384
; LINE_WIDTH: 0.29976
G1 X87.251 Y105.207 E.00135
G2 X87.386 Y105.393 I2.73 J-1.826 E.00398
; LINE_WIDTH: 0.253939
G1 X87.406 Y105.418 E.00046
G2 X87.54 Y105.557 I3.438 J-3.185 E.00276
; LINE_WIDTH: 0.210878
G2 X87.712 Y105.697 I1.516 J-1.692 E.00255
; LINE_WIDTH: 0.166923
G2 X87.895 Y105.811 I1.829 J-2.73 E.00186
; LINE_WIDTH: 0.120707
G2 X88.064 Y105.889 I1.219 J-2.417 E.00105
; LINE_WIDTH: 0.0923214
G1 X88.142 Y105.918 E.00031
; WIPE_START
G1 F18000
G1 X88.064 Y105.889 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.359 Y101.572 Z6.68 F42000
G1 X100.432 Y97.407 Z6.68
G1 Z6.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2015
M204 S5000
G1 X100.332 Y97.494 E.00296
G3 X99.844 Y96.251 I-.399 J-.56 E.05591
G1 X99.917 Y96.246 E.00165
G3 X100.471 Y97.362 I.015 J.688 E.03484
M204 S250
G1 X100.608 Y97.141 F42000
G1 F2015
M204 S5000
G1 X100.569 Y97.243 E.00244
G3 X99.913 Y96.224 I-.64 J-.308 E.0674
G1 X99.977 Y96.226 E.00145
G3 X100.624 Y97.083 I-.048 J.709 E.02725
; CHANGE_LAYER
; Z_HEIGHT: 6.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.569 Y97.243 E-.06416
G1 X100.451 Y97.419 E-.08043
G1 X100.345 Y97.512 E-.05376
G1 X100.222 Y97.583 E-.05383
G1 X100.088 Y97.628 E-.05382
G1 X99.948 Y97.646 E-.05377
G1 X99.807 Y97.635 E-.0538
G1 X99.67 Y97.597 E-.05393
G1 X99.46 Y97.468 E-.09367
G1 X99.363 Y97.364 E-.05388
G1 X99.289 Y97.243 E-.05379
G1 X99.241 Y97.11 E-.05382
G1 X99.226 Y97.013 E-.03733
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/51
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.68 I-.582 J-1.069 P1  F42000
G1 X88.151 Y103.041 Z6.68
G1 Z6.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2003
M204 S6000
G1 X88.184 Y103.019 E.00107
G3 X88.742 Y102.847 I.717 J1.33 E.01593
G1 X91.176 Y102.841 E.06595
G3 X91.123 Y105.861 I-.083 J1.509 E.12559
G1 X88.885 Y105.861 E.06063
G3 X87.929 Y103.192 I.016 J-1.511 E.09962
G1 X88.101 Y103.075 E.00566
M204 S250
G1 X88.376 Y103.372 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2003
M204 S5000
G1 X88.518 Y103.31 E.00392
G3 X88.787 Y103.245 I.39 J1.04 E.00695
G1 X91.156 Y103.241 E.05956
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05563
G3 X88.326 Y103.404 I.014 J-1.111 E.07195
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.518 Y103.31 E-.08144
G1 X88.787 Y103.245 E-.10481
G1 X90.297 Y103.243 E-.57375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.015 Y102.49 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2003
M204 S6000
G1 X92.363 Y102.611 E.00997
G1 X92.634 Y102.611 E.00735
G3 X93.137 Y103.357 I-7.198 J5.39 E.02438
G3 X91.492 Y106.189 I-1.641 J.941 E.1073
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.276 I-.007 J-1.89 E.10992
G1 X87.366 Y102.611 E.02182
G1 X87.637 Y102.611 E.00735
G3 X88.507 Y102.411 I.916 J1.993 E.02435
G1 X91.588 Y102.413 E.08348
G3 X91.93 Y102.461 I-.116 J2.074 E.00939
G1 X91.959 Y102.471 E.00081
; WIPE_START
G1 F10826.06
M73 P79 R2
G1 X92.363 Y102.611 E-.16263
G1 X92.634 Y102.611 E-.1031
G1 X93.137 Y103.357 E-.34173
G1 X93.259 Y103.611 E-.10724
G1 X93.297 Y103.724 E-.0453
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2003
M204 S5000
G3 X93.733 Y103.792 I-2.656 J2.152 E.03431
G3 X91.497 Y106.59 I-2.239 J.504 E.10331
G1 X88.503 Y106.59 E.07529
G3 X86.576 Y103.059 I-.001 J-2.291 E.12345
G1 X86.895 Y102.59 E.01426
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I0 J-2.093 E.08265
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X83.184 Y73.41 E.10008
G1 X83.184 Y73.79 E.00955
G1 X78.395 Y73.79 E.12039
G2 X77.49 Y74.695 I.01 J.915 E.03564
G1 X77.49 Y101.308 E.66907
G2 X78.393 Y102.21 I.925 J-.023 E.03542
G1 X87.56 Y102.21 E.23047
G3 X88.502 Y102.01 I.991 J2.348 E.02436
G1 X91.498 Y102.01 E.0753
G3 X92.44 Y102.21 I-.027 J2.449 E.02437
G1 X101.605 Y102.21 E.23043
G2 X102.51 Y101.308 I-.015 J-.921 E.0355
G1 X102.51 Y74.695 E.66909
M73 P79 R1
G2 X101.605 Y73.79 I-.915 J.01 E.03564
G1 X96.816 Y73.79 E.12039
G1 X96.816 Y73.41 E.00955
G1 X100.797 Y73.41 E.10008
G3 X102.89 Y75.503 I.001 J2.092 E.08267
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08267
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.059 E-.20364
M73 P80 R1
G1 X93.538 Y103.256 E-.08659
G1 X93.671 Y103.572 E-.13018
G1 X93.733 Y103.792 E-.08663
G1 X93.789 Y104.244 E-.17325
G1 X93.784 Y104.454 E-.0797
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

G1 X92.914 Y104.852
G1 Z6.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.338182
G1 F2003
M204 S6000
G3 X92.751 Y105.2 I-1.605 J-.54 E.00762
; LINE_WIDTH: 0.29033
G3 X92.588 Y105.424 I-1.149 J-.665 E.00463
; LINE_WIDTH: 0.245468
G3 X92.42 Y105.593 I-2.08 J-1.903 E.00329
; LINE_WIDTH: 0.202769
G3 X92.265 Y105.713 I-1.022 J-1.154 E.00215
; LINE_WIDTH: 0.1605
G3 X92.091 Y105.817 I-2.161 J-3.402 E.00167
; LINE_WIDTH: 0.112723
G3 X91.863 Y105.918 I-1.587 J-3.31 E.00128
M204 S10000
G1 X92.914 Y104.852 F42000
; LINE_WIDTH: 0.380591
G1 F2003
M204 S6000
G2 X92.509 Y103.095 I-1.763 J-.519 E.04254
G2 X92.384 Y102.978 I-.173 J.06 E.00403
; LINE_WIDTH: 0.33074
G1 X92.323 Y102.956 E.00125
; LINE_WIDTH: 0.281426
G3 X92.216 Y102.897 I.247 J-.582 E.00197
; LINE_WIDTH: 0.238316
G1 X92.052 Y102.811 E.00246
; LINE_WIDTH: 0.197646
G1 X91.865 Y102.733 E.00216
; LINE_WIDTH: 0.159985
G1 X91.725 Y102.691 E.0012
; LINE_WIDTH: 0.124626
G2 X91.541 Y102.653 I-.54 J2.183 E.00111
; LINE_WIDTH: 0.0943252
G1 X91.445 Y102.643 E.00038
M204 S10000
G1 X88.556 Y102.643 F42000
; LINE_WIDTH: 0.0968656
G1 F2003
M204 S6000
G1 X88.424 Y102.659 E.00054
; LINE_WIDTH: 0.127423
G1 X88.274 Y102.69 E.00093
; LINE_WIDTH: 0.170978
G2 X88.054 Y102.762 I1.421 J4.683 E.00206
; LINE_WIDTH: 0.21554
G1 X88.015 Y102.779 E.0005
G2 X87.871 Y102.849 I1.631 J3.524 E.0019
; LINE_WIDTH: 0.25828
G1 X87.72 Y102.934 E.00252
; LINE_WIDTH: 0.29703
G3 X87.245 Y103.157 I-1.908 J-3.447 E.009
M204 S10000
G1 X87.748 Y102.79 F42000
; LINE_WIDTH: 0.381085
G1 F2003
M204 S6000
G2 X87.073 Y103.834 I2.197 J2.163 E.02831
G2 X87.113 Y104.927 I1.617 J.488 E.02518
; LINE_WIDTH: 0.333199
G1 X87.12 Y104.945 E.00038
G2 X87.248 Y105.199 I1.476 J-.586 E.00553
; LINE_WIDTH: 0.294235
G1 X87.387 Y105.392 E.00403
; LINE_WIDTH: 0.25565
G2 X87.53 Y105.546 I1.069 J-.853 E.00303
; LINE_WIDTH: 0.212861
G2 X87.714 Y105.698 I1.275 J-1.357 E.00279
; LINE_WIDTH: 0.166717
G2 X87.895 Y105.811 I1.83 J-2.735 E.00184
; LINE_WIDTH: 0.120759
G2 X88.064 Y105.889 I1.203 J-2.383 E.00105
; LINE_WIDTH: 0.0923973
G1 X88.142 Y105.918 E.00032
; WIPE_START
G1 F18000
G1 X88.064 Y105.889 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.359 Y101.572 Z6.84 F42000
G1 X100.432 Y97.407 Z6.84
G1 Z6.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2003
M204 S5000
G1 X100.331 Y97.493 E.00297
G3 X99.777 Y96.263 I-.401 J-.559 E.0545
G1 X99.913 Y96.246 E.00307
G3 X100.47 Y97.361 I.017 J.688 E.03489
M204 S250
G1 X100.606 Y97.147 F42000
G1 F2003
M204 S5000
G1 X100.568 Y97.242 E.00228
G3 X99.913 Y96.224 I-.638 J-.309 E.06724
G1 X99.978 Y96.226 E.00147
G3 X100.621 Y97.089 I-.049 J.708 E.02736
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.568 Y97.242 E-.0615
G1 X100.451 Y97.419 E-.08036
G1 X100.345 Y97.512 E-.05375
G1 X100.222 Y97.583 E-.05383
G1 X100.088 Y97.628 E-.05381
G1 X99.948 Y97.646 E-.05381
G1 X99.807 Y97.635 E-.05375
G1 X99.67 Y97.597 E-.05383
G1 X99.544 Y97.532 E-.05384
G1 X99.434 Y97.444 E-.05381
G1 X99.343 Y97.335 E-.05381
G1 X99.275 Y97.211 E-.0538
G1 X99.228 Y97.006 E-.0801
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/51
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.84 I-.583 J-1.068 P1  F42000
G1 X88.18 Y103.033 Z6.84
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2018
M204 S6000
G1 X88.383 Y102.93 E.00618
G3 X88.682 Y102.854 I.519 J1.42 E.00838
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.087 J1.509 E.12539
G1 X88.885 Y105.861 E.06065
G3 X88.055 Y103.097 I.017 J-1.511 E.10384
G1 X88.126 Y103.061 E.00218
M204 S250
G1 X88.36 Y103.388 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2018
M204 S5000
G1 X88.52 Y103.307 E.00451
G3 X88.737 Y103.252 I.381 J1.043 E.00563
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.064 J1.109 E.08567
G1 X88.895 Y105.46 E.05565
G3 X88.277 Y103.432 I.007 J-1.11 E.07085
G1 X88.307 Y103.416 E.00085
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.52 Y103.307 E-.09101
G1 X88.737 Y103.252 E-.085
G1 X90.274 Y103.245 E-.584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.015 Y102.49 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2018
M204 S6000
G1 X92.363 Y102.611 E.00998
G1 X92.634 Y102.611 E.00735
G3 X93.137 Y103.357 I-7.208 J5.395 E.02438
G3 X91.492 Y106.189 I-1.641 J.941 E.1073
G1 X88.508 Y106.189 E.08087
G3 X86.913 Y103.276 I-.007 J-1.89 E.10993
G1 X87.366 Y102.611 E.02181
G1 X87.637 Y102.611 E.00735
G3 X88.507 Y102.411 I.915 J1.988 E.02436
G1 X91.588 Y102.413 E.08349
G3 X91.933 Y102.462 I-.117 J2.076 E.00946
G1 X91.959 Y102.47 E.00073
; WIPE_START
G1 F10826.06
G1 X92.363 Y102.611 E-.16275
G1 X92.634 Y102.611 E-.10305
G1 X93.137 Y103.357 E-.34172
G1 X93.259 Y103.611 E-.1071
G1 X93.294 Y103.725 E-.04538
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2018
M204 S5000
G3 X93.733 Y103.792 I-2.658 J2.153 E.03431
G3 X91.497 Y106.59 I-2.239 J.504 E.10331
G1 X88.503 Y106.59 E.07529
G3 X86.576 Y103.059 I-.001 J-2.291 E.12346
G1 X86.895 Y102.59 E.01426
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I-.001 J-2.092 E.08266
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.103 J.01 E.08255
G1 X83.04 Y73.41 E.09648
G1 X83.04 Y73.79 E.00955
G1 X78.395 Y73.79 E.11678
G2 X77.49 Y74.695 I.01 J.915 E.03564
G1 X77.49 Y101.308 E.66907
G2 X78.393 Y102.21 I.927 J-.024 E.03539
G1 X87.56 Y102.21 E.23048
G3 X88.502 Y102.01 I.989 J2.341 E.02437
G1 X91.498 Y102.01 E.0753
M73 P81 R1
G3 X92.44 Y102.21 I-.028 J2.451 E.02438
G1 X101.608 Y102.21 E.23049
G2 X102.51 Y101.305 I-.018 J-.92 E.03551
G1 X102.51 Y74.695 E.66903
G2 X101.605 Y73.79 I-.915 J.01 E.03563
G1 X96.96 Y73.79 E.11679
G1 X96.96 Y73.41 E.00955
G1 X100.797 Y73.41 E.09648
G3 X102.89 Y75.503 I.001 J2.092 E.08266
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.103 J-.01 E.08255
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.059 E-.20352
G1 X93.538 Y103.256 E-.08673
G1 X93.671 Y103.572 E-.13013
G1 X93.733 Y103.792 E-.08662
G1 X93.789 Y104.244 E-.17327
G1 X93.779 Y104.454 E-.07973
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

G1 X92.887 Y104.926
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380924
G1 F2018
M204 S6000
G2 X92.93 Y103.844 I-1.551 J-.604 E.02492
G2 X92.252 Y102.79 I-2.742 J1.018 E.02855
M204 S10000
G1 X92.756 Y103.158 F42000
; LINE_WIDTH: 0.297116
G1 F2018
M204 S6000
G3 X92.278 Y102.933 I1.447 J-3.697 E.00905
; LINE_WIDTH: 0.256699
G1 X92.121 Y102.845 E.00262
; LINE_WIDTH: 0.215803
G2 X91.957 Y102.767 I-1.532 J3.022 E.00214
; LINE_WIDTH: 0.170954
G2 X91.727 Y102.691 I-.757 J1.895 E.00216
; LINE_WIDTH: 0.127615
G1 X91.576 Y102.659 E.00094
; LINE_WIDTH: 0.0972973
G1 X91.446 Y102.643 E.00054
; WIPE_START
G1 F18000
G1 X91.576 Y102.659 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.887 Y104.926 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.331546
G1 F2018
M204 S6000
G1 X92.838 Y105.04 E.0024
G3 X92.743 Y105.215 I-3.506 J-1.79 E.00386
; LINE_WIDTH: 0.290303
G3 X92.593 Y105.418 I-3.739 J-2.607 E.00421
; LINE_WIDTH: 0.242433
G3 X92.395 Y105.613 I-1.367 J-1.193 E.00377
; LINE_WIDTH: 0.198008
G3 X92.247 Y105.726 I-1.305 J-1.557 E.00198
; LINE_WIDTH: 0.164732
G3 X92.131 Y105.795 I-1.256 J-1.98 E.00115
; LINE_WIDTH: 0.132784
G1 X92.003 Y105.861 E.00092
; LINE_WIDTH: 0.101598
G1 X91.853 Y105.919 E.00071
M204 S10000
G1 X88.148 Y105.919 F42000
; LINE_WIDTH: 0.101492
G1 F2018
M204 S6000
G1 X87.997 Y105.861 E.00071
; LINE_WIDTH: 0.1327
G1 X87.869 Y105.795 E.00092
; LINE_WIDTH: 0.169181
G3 X87.761 Y105.731 I1.055 J-1.902 E.0011
G1 X87.716 Y105.699 E.00049
; LINE_WIDTH: 0.212099
G1 X87.531 Y105.548 E.00277
; LINE_WIDTH: 0.251576
G3 X87.412 Y105.425 I3.334 J-3.33 E.00241
; LINE_WIDTH: 0.290451
G3 X87.295 Y105.273 I3.008 J-2.434 E.00321
G1 X87.248 Y105.198 E.00147
; LINE_WIDTH: 0.333772
G3 X87.167 Y105.053 I2.475 J-1.471 E.00324
G1 X87.115 Y104.929 E.00262
; LINE_WIDTH: 0.380921
G3 X87.07 Y103.844 I1.591 J-.609 E.02497
G3 X87.748 Y102.79 I2.854 J1.091 E.02853
M204 S10000
G1 X87.245 Y103.157 F42000
; LINE_WIDTH: 0.297243
G1 F2018
M204 S6000
G2 X87.72 Y102.934 I-1.459 J-3.727 E.009
; LINE_WIDTH: 0.256995
G1 X87.88 Y102.844 E.00266
; LINE_WIDTH: 0.212749
G3 X88.08 Y102.753 I2.028 J4.158 E.00256
; LINE_WIDTH: 0.167091
G3 X88.273 Y102.69 I.857 J2.33 E.00175
; LINE_WIDTH: 0.127689
G1 X88.424 Y102.659 E.00094
; LINE_WIDTH: 0.0974658
G1 X88.555 Y102.643 E.00054
; WIPE_START
G1 F18000
G1 X88.424 Y102.659 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.417 Y99.601 Z7 F42000
G1 X100.433 Y97.407 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2018
M204 S5000
G1 X100.331 Y97.492 E.00298
G3 X99.776 Y96.263 I-.401 J-.559 E.05448
G1 X99.913 Y96.246 E.00308
G3 X100.47 Y97.36 I.017 J.688 E.03486
M204 S250
G1 X100.602 Y97.158 F42000
G1 F2018
M204 S5000
G1 X100.57 Y97.243 E.00204
G3 X99.912 Y96.224 I-.64 J-.309 E.06739
G1 X99.979 Y96.226 E.0015
G3 X100.621 Y97.101 I-.05 J.709 E.02761
; CHANGE_LAYER
; Z_HEIGHT: 6.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.57 Y97.243 E-.05749
G1 X100.497 Y97.364 E-.05376
G1 X100.401 Y97.468 E-.0537
G1 X100.222 Y97.583 E-.0807
G1 X100.088 Y97.628 E-.05368
G1 X99.948 Y97.646 E-.05385
G1 X99.807 Y97.635 E-.05377
G1 X99.67 Y97.597 E-.05383
G1 X99.544 Y97.532 E-.05383
G1 X99.434 Y97.444 E-.05381
G1 X99.289 Y97.244 E-.09376
G1 X99.241 Y97.11 E-.0539
G1 X99.224 Y96.996 E-.04393
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/51
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7 I-.583 J-1.068 P1  F42000
G1 X88.135 Y103.052 Z7
G1 Z6.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2009
M204 S6000
G1 X88.185 Y103.021 E.00158
G3 X88.742 Y102.847 I.722 J1.328 E.01591
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.083 J1.509 E.12559
G1 X88.885 Y105.861 E.06065
G3 X87.931 Y103.195 I.023 J-1.512 E.09931
G1 X88.086 Y103.086 E.00513
M204 S250
G1 X88.36 Y103.382 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2009
M204 S5000
G1 X88.372 Y103.375 E.00035
G3 X88.787 Y103.245 I.533 J.974 E.01099
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.106 Y103.579 I.011 J-1.11 E.065
G1 X88.313 Y103.419 E.00658
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.372 Y103.375 E-.02796
G1 X88.518 Y103.307 E-.06114
G1 X88.787 Y103.245 E-.1048
G1 X90.276 Y103.243 E-.56609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.015 Y102.489 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2009
M204 S6000
G1 X92.363 Y102.611 E.01
G1 X92.634 Y102.611 E.00734
G3 X93.136 Y103.356 I-7.178 J5.377 E.02437
G3 X91.492 Y106.189 I-1.641 J.942 E.10732
G1 X88.508 Y106.189 E.08087
G3 X86.912 Y103.276 I-.007 J-1.89 E.10993
G1 X87.366 Y102.611 E.02182
G1 X87.637 Y102.611 E.00734
G3 X88.507 Y102.411 I.914 J1.983 E.02437
G1 X91.589 Y102.413 E.08351
G3 X91.936 Y102.462 I-.118 J2.079 E.00952
G1 X91.958 Y102.47 E.00062
; WIPE_START
G1 F10826.06
G1 X92.363 Y102.611 E-.16303
G1 X92.634 Y102.611 E-.10295
G1 X93.136 Y103.356 E-.34157
G1 X93.222 Y103.524 E-.07156
G1 X93.295 Y103.724 E-.08089
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2009
M204 S5000
G3 X93.733 Y103.791 I-2.655 J2.152 E.03431
M73 P82 R1
G3 X91.497 Y106.59 I-2.239 J.504 E.10331
G1 X88.503 Y106.59 E.07529
G3 X86.576 Y103.059 I-.001 J-2.291 E.12346
G1 X86.895 Y102.59 E.01426
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I0 J-2.093 E.08265
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.103 J.01 E.08254
G1 X82.938 Y73.41 E.09391
G1 X82.938 Y73.79 E.00955
G1 X78.395 Y73.79 E.11422
G2 X77.49 Y74.695 I.01 J.915 E.03564
G1 X77.49 Y101.308 E.66907
G2 X78.394 Y102.21 I.927 J-.024 E.03542
G1 X87.56 Y102.21 E.23046
G3 X88.502 Y102.01 I.988 J2.334 E.02437
G1 X91.498 Y102.01 E.0753
G3 X92.44 Y102.21 I-.028 J2.453 E.02438
G1 X101.605 Y102.21 E.23042
G2 X102.51 Y101.305 I-.015 J-.92 E.03557
G1 X102.51 Y74.695 E.66903
G2 X101.605 Y73.79 I-.915 J.01 E.03563
G1 X97.062 Y73.79 E.11422
G1 X97.062 Y73.41 E.00955
G1 X100.797 Y73.41 E.09391
G3 X102.89 Y75.503 I.001 J2.092 E.08266
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.059 E-.20359
G1 X93.538 Y103.256 E-.08665
G1 X93.632 Y103.465 E-.08676
G1 X93.733 Y103.791 E-.13
G1 X93.789 Y104.244 E-.17326
G1 X93.779 Y104.453 E-.07974
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

G1 X92.913 Y104.852
G1 Z6.76
M73 P83 R1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.380618
G1 F2009
M204 S6000
G2 X92.509 Y103.095 I-1.76 J-.521 E.04254
G2 X92.384 Y102.978 I-.173 J.061 E.00403
; LINE_WIDTH: 0.330807
G1 X92.324 Y102.956 E.00124
; LINE_WIDTH: 0.281715
G3 X92.216 Y102.898 I.247 J-.582 E.00197
; LINE_WIDTH: 0.238244
G1 X92.051 Y102.81 E.00249
; LINE_WIDTH: 0.198107
G1 X91.87 Y102.735 E.00209
; LINE_WIDTH: 0.160836
G1 X91.728 Y102.691 E.00123
; LINE_WIDTH: 0.124902
G2 X91.541 Y102.653 I-.545 J2.198 E.00113
; LINE_WIDTH: 0.094303
G1 X91.445 Y102.643 E.00038
; WIPE_START
G1 F18000
G1 X91.541 Y102.653 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.913 Y104.852 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
; LINE_WIDTH: 0.337491
G1 F2009
M204 S6000
G3 X92.752 Y105.201 I-1.841 J-.638 E.0076
; LINE_WIDTH: 0.295096
G3 X92.618 Y105.389 I-4.756 J-3.258 E.00393
; LINE_WIDTH: 0.253916
G3 X92.459 Y105.557 I-2.03 J-1.753 E.00331
; LINE_WIDTH: 0.208564
G3 X92.266 Y105.713 I-1.693 J-1.901 E.00282
; LINE_WIDTH: 0.165788
G1 X92.13 Y105.795 E.00136
; LINE_WIDTH: 0.134911
G1 X92.021 Y105.852 E.00081
; LINE_WIDTH: 0.103423
G3 X91.852 Y105.919 I-.752 J-1.655 E.00082
M204 S10000
G1 X88.142 Y105.918 F42000
; LINE_WIDTH: 0.0929765
G1 F2009
M204 S6000
G1 X88.064 Y105.889 E.00032
; LINE_WIDTH: 0.120774
G3 X87.895 Y105.811 I.828 J-2 E.00105
; LINE_WIDTH: 0.154899
G1 X87.803 Y105.756 E.00084
; LINE_WIDTH: 0.191458
G3 X87.688 Y105.68 I1.018 J-1.657 E.00141
G1 X87.607 Y105.615 E.00107
; LINE_WIDTH: 0.238925
G1 X87.433 Y105.448 E.00321
; LINE_WIDTH: 0.287619
G3 X87.25 Y105.204 I1.265 J-1.141 E.00505
; LINE_WIDTH: 0.332755
G3 X87.167 Y105.051 I2.359 J-1.382 E.00338
G1 X87.114 Y104.93 E.00258
; LINE_WIDTH: 0.380895
G3 X87.066 Y103.859 I1.625 J-.61 E.02462
G3 X87.748 Y102.79 I2.862 J1.076 E.02886
M204 S10000
G1 X87.244 Y103.158 F42000
; LINE_WIDTH: 0.297171
G1 F2009
M204 S6000
G2 X87.72 Y102.934 I-1.416 J-3.629 E.00901
; LINE_WIDTH: 0.258289
G1 X87.871 Y102.849 E.00252
; LINE_WIDTH: 0.215491
G3 X88.017 Y102.778 I1.796 J3.497 E.00192
G1 X88.054 Y102.762 E.00047
; LINE_WIDTH: 0.171373
G3 X88.271 Y102.69 I1.529 J4.271 E.00205
; LINE_WIDTH: 0.127772
G1 X88.423 Y102.659 E.00094
; LINE_WIDTH: 0.0969548
G1 X88.556 Y102.643 E.00055
; WIPE_START
G1 F18000
G1 X88.423 Y102.659 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.416 Y99.601 Z7.16 F42000
G1 X100.433 Y97.407 Z7.16
G1 Z6.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2009
M204 S5000
G1 X100.332 Y97.494 E.00298
G3 X99.776 Y96.263 I-.402 J-.56 E.05459
G1 X99.913 Y96.246 E.00307
G3 X100.471 Y97.361 I.017 J.689 E.0349
M204 S250
G1 X100.601 Y97.159 F42000
G1 F2009
M204 S5000
G1 X100.57 Y97.243 E.002
G3 X99.912 Y96.224 I-.64 J-.309 E.06739
G1 X99.98 Y96.226 E.00152
G3 X100.62 Y97.103 I-.05 J.709 E.02764
; CHANGE_LAYER
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.57 Y97.243 E-.05672
G1 X100.451 Y97.419 E-.08051
G1 X100.345 Y97.512 E-.05376
G1 X100.222 Y97.583 E-.05383
G1 X100.088 Y97.628 E-.05381
G1 X99.948 Y97.646 E-.05379
G1 X99.806 Y97.635 E-.05383
G1 X99.67 Y97.597 E-.05378
G1 X99.544 Y97.532 E-.05377
G1 X99.433 Y97.444 E-.05391
G1 X99.289 Y97.244 E-.09371
G1 X99.241 Y97.11 E-.05388
G1 X99.223 Y96.994 E-.04469
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/51
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.16 I-.583 J-1.068 P1  F42000
G1 X88.157 Y103.037 Z7.16
G1 Z6.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1998
M204 S6000
G1 X88.238 Y102.993 E.00249
G3 X88.749 Y102.846 I.665 J1.357 E.0145
G1 X91.183 Y102.84 E.06594
G3 X91.123 Y105.861 I-.091 J1.509 E.12538
G1 X88.885 Y105.861 E.06065
G3 X88.056 Y103.098 I.018 J-1.511 E.10378
G1 X88.106 Y103.068 E.00159
M204 S250
G1 X88.358 Y103.384 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1998
M204 S5000
G1 X88.416 Y103.352 E.00168
G3 X88.789 Y103.245 I.487 J.998 E.00981
G1 X91.158 Y103.241 E.05955
G3 X91.108 Y105.46 I-.064 J1.109 E.08575
G1 X88.895 Y105.46 E.05565
G3 X88.278 Y103.432 I.008 J-1.11 E.07079
G1 X88.306 Y103.415 E.00084
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.416 Y103.352 E-.04823
G1 X88.523 Y103.306 E-.04407
G1 X88.789 Y103.245 E-.10396
G1 X90.273 Y103.243 E-.56373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.015 Y102.489 Z7.32 F42000
G1 Z6.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1998
M204 S6000
G1 X92.364 Y102.611 E.01001
G1 X92.634 Y102.611 E.00734
G3 X93.137 Y103.356 I-7.174 J5.374 E.02437
G3 X91.492 Y106.189 I-1.641 J.941 E.10732
G1 X88.508 Y106.189 E.08087
G3 X86.913 Y103.276 I-.007 J-1.89 E.10994
G1 X87.366 Y102.611 E.0218
G1 X87.636 Y102.611 E.00734
G3 X88.507 Y102.411 I.913 J1.978 E.02438
G1 X91.589 Y102.413 E.08352
G3 X91.94 Y102.463 I-.119 J2.082 E.0096
G1 X91.958 Y102.469 E.00052
; WIPE_START
G1 F10826.06
G1 X92.364 Y102.611 E-.16323
G1 X92.634 Y102.611 E-.10288
G1 X93.137 Y103.356 E-.3416
G1 X93.259 Y103.61 E-.10717
G1 X93.297 Y103.723 E-.04513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z7.32 F42000
G1 Z6.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1998
M204 S5000
G3 X93.733 Y103.791 I-2.656 J2.153 E.0343
G3 X91.497 Y106.59 I-2.239 J.504 E.10332
G1 X88.503 Y106.59 E.07529
G3 X86.576 Y103.058 I-.001 J-2.291 E.12347
G1 X86.895 Y102.59 E.01425
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X82.867 Y73.41 E.09211
G1 X82.867 Y73.79 E.00955
G1 X78.395 Y73.79 E.11242
G2 X77.49 Y74.695 I.01 J.915 E.03564
G1 X77.49 Y101.308 E.66907
G2 X78.394 Y102.21 I.927 J-.024 E.03542
G1 X87.56 Y102.21 E.23046
G3 X88.503 Y102.01 I.986 J2.327 E.02437
G1 X91.497 Y102.01 E.0753
M73 P84 R1
G3 X92.44 Y102.21 I-.029 J2.457 E.02438
G1 X101.605 Y102.21 E.23042
G2 X102.51 Y101.305 I-.021 J-.926 E.03552
G1 X102.51 Y74.695 E.66903
G2 X101.605 Y73.79 I-.915 J.01 E.03563
G1 X97.134 Y73.79 E.11242
G1 X97.134 Y73.41 E.00955
G1 X100.797 Y73.41 E.09211
G3 X102.89 Y75.503 I-.003 J2.096 E.08262
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.092 J.001 E.08266
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.058 E-.20343
G1 X93.538 Y103.256 E-.08676
G1 X93.632 Y103.464 E-.08667
G1 X93.733 Y103.791 E-.13003
G1 X93.789 Y104.244 E-.17331
G1 X93.779 Y104.453 E-.07979
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

G1 X92.909 Y104.867
G1 Z6.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.337264
G1 F1998
M204 S6000
G3 X92.751 Y105.2 I-1.463 J-.49 E.00728
; LINE_WIDTH: 0.289741
G1 X92.705 Y105.272 E.00143
G3 X92.587 Y105.425 I-1.593 J-1.104 E.00321
; LINE_WIDTH: 0.242792
G1 X92.578 Y105.436 E.00019
G3 X92.397 Y105.614 I-8.111 J-8.068 E.00345
; LINE_WIDTH: 0.200088
G1 X92.265 Y105.712 E.00177
; LINE_WIDTH: 0.165536
G1 X92.13 Y105.796 E.00136
; LINE_WIDTH: 0.129537
G1 X91.981 Y105.87 E.00103
; LINE_WIDTH: 0.0997978
G1 X91.852 Y105.919 E.00059
M204 S10000
G1 X92.909 Y104.867 F42000
; LINE_WIDTH: 0.381769
G1 F1998
M204 S6000
G2 X92.734 Y103.416 I-1.6 J-.544 E.03424
G1 X92.516 Y103.103 E.00863
G1 X92.251 Y102.79 E.0093
M204 S10000
G1 X92.756 Y103.159 F42000
; LINE_WIDTH: 0.297101
G1 F1998
M204 S6000
G3 X92.278 Y102.933 I1.394 J-3.571 E.00906
; LINE_WIDTH: 0.256808
G1 X92.12 Y102.845 E.00263
; LINE_WIDTH: 0.215833
G2 X91.957 Y102.767 I-1.544 J3.041 E.00214
; LINE_WIDTH: 0.171296
G2 X91.73 Y102.692 I-.786 J1.985 E.00214
; LINE_WIDTH: 0.127974
G1 X91.577 Y102.659 E.00095
; LINE_WIDTH: 0.0998937
G1 X91.448 Y102.642 E.00056
M204 S10000
G1 X88.549 Y102.642 F42000
; LINE_WIDTH: 0.112738
G1 F1998
M204 S6000
G2 X88.301 Y102.683 I.576 J4.211 E.00129
; LINE_WIDTH: 0.160485
G2 X88.108 Y102.742 I1.432 J5.07 E.00166
; LINE_WIDTH: 0.207908
G2 X87.891 Y102.839 I1.077 J2.713 E.00269
; LINE_WIDTH: 0.230951
G1 X87.88 Y102.844 E.00016
; LINE_WIDTH: 0.257036
G1 X87.72 Y102.934 E.00266
; LINE_WIDTH: 0.2974
G3 X87.244 Y103.158 I-1.911 J-3.448 E.00901
M204 S10000
G1 X87.749 Y102.79 F42000
; LINE_WIDTH: 0.380979
G1 F1998
M204 S6000
G2 X87.07 Y103.844 I2.175 J2.145 E.02854
G2 X87.115 Y104.929 I1.591 J.478 E.02499
; LINE_WIDTH: 0.333156
G1 X87.248 Y105.199 E.00586
; LINE_WIDTH: 0.294291
G1 X87.308 Y105.292 E.00188
G2 X87.386 Y105.392 I1.437 J-1.038 E.00215
; LINE_WIDTH: 0.255108
G2 X87.534 Y105.55 I1.089 J-.87 E.00313
; LINE_WIDTH: 0.211517
G2 X87.72 Y105.702 I1.251 J-1.339 E.00276
; LINE_WIDTH: 0.166163
G2 X87.895 Y105.81 I1.846 J-2.776 E.00177
; LINE_WIDTH: 0.12087
G2 X88.064 Y105.889 I1.136 J-2.232 E.00105
; LINE_WIDTH: 0.0925515
G1 X88.142 Y105.918 E.00032
; WIPE_START
G1 F18000
G1 X88.064 Y105.889 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.358 Y101.572 Z7.32 F42000
G1 X100.431 Y97.407 Z7.32
G1 Z6.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1998
M204 S5000
G3 X99.845 Y96.251 I-.499 J-.473 E.05887
G1 X99.918 Y96.246 E.00164
G3 X100.47 Y97.362 I.014 J.688 E.03483
M204 S250
G1 X100.599 Y97.165 F42000
G1 F1998
M204 S5000
G1 X100.568 Y97.243 E.00186
G3 X99.912 Y96.224 I-.638 J-.309 E.06723
G1 X99.981 Y96.226 E.00154
G3 X100.618 Y97.108 I-.051 J.707 E.02774
; CHANGE_LAYER
; Z_HEIGHT: 7.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.568 Y97.243 E-.05436
G1 X100.451 Y97.419 E-.08042
G1 X100.345 Y97.512 E-.05372
G1 X100.222 Y97.583 E-.05385
G1 X100.088 Y97.628 E-.05376
G1 X99.948 Y97.646 E-.05384
G1 X99.703 Y97.609 E-.09388
G1 X99.575 Y97.551 E-.05376
G1 X99.459 Y97.468 E-.05386
G1 X99.363 Y97.364 E-.05377
G1 X99.289 Y97.244 E-.05376
G1 X99.241 Y97.11 E-.05384
G1 X99.223 Y96.988 E-.04718
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/51
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.32 I-.584 J-1.068 P1  F42000
G1 X88.12 Y103.062 Z7.32
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1997
M204 S6000
G1 X88.186 Y103.023 E.00208
G3 X88.742 Y102.846 I.726 J1.326 E.01591
G1 X91.175 Y102.84 E.06594
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X87.933 Y103.197 I.027 J-1.512 E.09911
G1 X88.071 Y103.097 E.00463
M204 S250
G1 X88.346 Y103.393 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1997
M204 S5000
G1 X88.373 Y103.377 E.0008
G3 X88.787 Y103.245 I.536 J.973 E.01099
G1 X91.155 Y103.241 E.05955
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.107 Y103.58 I.014 J-1.111 E.06486
G1 X88.299 Y103.43 E.00612
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.373 Y103.377 E-.0348
G1 X88.629 Y103.273 E-.10478
G1 X88.787 Y103.245 E-.06111
G1 X90.259 Y103.243 E-.5593
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.014 Y102.489 Z7.48 F42000
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1997
M204 S6000
G1 X92.364 Y102.611 E.01002
G1 X92.634 Y102.611 E.00733
G3 X93.136 Y103.356 I-7.189 J5.385 E.02437
G3 X91.492 Y106.189 I-1.641 J.941 E.10732
G1 X88.508 Y106.189 E.08087
G3 X86.913 Y103.276 I-.007 J-1.89 E.10993
G1 X87.366 Y102.611 E.02181
G1 X87.636 Y102.611 E.00733
G3 X88.507 Y102.411 I.911 J1.973 E.02439
G1 X91.59 Y102.413 E.08353
G3 X91.943 Y102.464 I-.121 J2.085 E.00968
G1 X91.958 Y102.469 E.00042
; WIPE_START
G1 F10826.06
G1 X92.364 Y102.611 E-.16339
G1 X92.634 Y102.611 E-.10284
G1 X93.136 Y103.356 E-.34157
G1 X93.259 Y103.611 E-.10735
G1 X93.296 Y103.723 E-.04485
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z7.48 F42000
G1 Z7.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1997
M204 S5000
G3 X93.733 Y103.791 I-2.657 J2.153 E.0343
G3 X91.497 Y106.59 I-2.239 J.504 E.10332
G1 X88.503 Y106.59 E.07529
G3 X86.576 Y103.058 I-.001 J-2.291 E.12347
M73 P85 R1
G1 X86.895 Y102.59 E.01425
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I.003 J-2.096 E.08261
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.098 J.005 E.0826
G1 X82.82 Y73.41 E.09094
G1 X82.82 Y73.79 E.00955
G1 X78.395 Y73.79 E.11125
G2 X77.49 Y74.695 I.01 J.915 E.03564
G1 X77.49 Y101.308 E.66907
G2 X78.394 Y102.21 I.927 J-.024 E.03542
G1 X87.56 Y102.21 E.23045
G3 X88.503 Y102.01 I.985 J2.319 E.02438
G1 X91.497 Y102.01 E.07529
G3 X92.44 Y102.21 I-.029 J2.458 E.02438
G1 X101.605 Y102.21 E.23042
G2 X102.51 Y101.308 I-.021 J-.926 E.03546
G1 X102.51 Y74.695 E.66907
G2 X101.605 Y73.79 I-.915 J.01 E.03564
G1 X97.18 Y73.79 E.11125
G1 X97.18 Y73.41 E.00955
G1 X100.797 Y73.41 E.09094
G3 X102.89 Y75.503 I-.003 J2.096 E.08262
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08261
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.058 E-.20337
G1 X93.538 Y103.256 E-.08673
G1 X93.632 Y103.464 E-.08684
G1 X93.733 Y103.791 E-.1299
G1 X93.789 Y104.244 E-.17334
G1 X93.784 Y104.454 E-.07981
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

G1 X92.887 Y104.926
G1 Z7.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.331567
G1 F1997
M204 S6000
M73 P86 R1
G1 X92.838 Y105.04 E.0024
G3 X92.743 Y105.215 I-3.141 J-1.597 E.00386
; LINE_WIDTH: 0.286016
G3 X92.565 Y105.45 I-2.07 J-1.38 E.00484
; LINE_WIDTH: 0.23924
G3 X92.392 Y105.618 I-3.42 J-3.361 E.00322
; LINE_WIDTH: 0.19962
G1 X92.266 Y105.711 E.00169
; LINE_WIDTH: 0.16555
G1 X92.13 Y105.796 E.00137
; LINE_WIDTH: 0.129569
G1 X91.982 Y105.87 E.00103
; LINE_WIDTH: 0.0998348
G1 X91.852 Y105.919 E.00059
M204 S10000
G1 X92.887 Y104.926 F42000
; LINE_WIDTH: 0.380907
G1 F1997
M204 S6000
G2 X92.952 Y103.926 I-1.583 J-.606 E.02298
G2 X92.251 Y102.79 I-2.668 J.861 E.03046
M204 S10000
G1 X92.756 Y103.159 F42000
; LINE_WIDTH: 0.297327
G1 F1997
M204 S6000
G3 X92.279 Y102.933 I1.438 J-3.668 E.00906
; LINE_WIDTH: 0.256818
G1 X92.12 Y102.845 E.00263
; LINE_WIDTH: 0.21583
G2 X91.957 Y102.767 I-1.557 J3.068 E.00214
; LINE_WIDTH: 0.171469
G2 X91.731 Y102.692 I-.801 J2.032 E.00213
; LINE_WIDTH: 0.128267
G1 X91.578 Y102.659 E.00096
; LINE_WIDTH: 0.097474
G1 X91.446 Y102.643 E.00055
M204 S10000
G1 X88.556 Y102.643 F42000
; LINE_WIDTH: 0.0970313
G1 F1997
M204 S6000
G1 X88.422 Y102.659 E.00055
; LINE_WIDTH: 0.128184
G1 X88.268 Y102.691 E.00096
; LINE_WIDTH: 0.172786
G2 X88.044 Y102.766 I1.495 J4.854 E.00213
; LINE_WIDTH: 0.216574
G1 X88.02 Y102.777 E.00032
G2 X87.871 Y102.849 I1.662 J3.602 E.00197
; LINE_WIDTH: 0.258375
G1 X87.72 Y102.934 E.00253
; LINE_WIDTH: 0.297384
G3 X87.244 Y103.158 I-1.895 J-3.405 E.00903
M204 S10000
G1 X87.749 Y102.79 F42000
; LINE_WIDTH: 0.380937
G1 F1997
M204 S6000
G2 X87.066 Y103.859 I2.177 J2.144 E.02887
G2 X87.115 Y104.928 I1.616 J.462 E.02462
; LINE_WIDTH: 0.332918
G1 X87.169 Y105.055 E.00267
G2 X87.25 Y105.204 I2.468 J-1.25 E.0033
; LINE_WIDTH: 0.287628
G2 X87.434 Y105.448 I1.422 J-.877 E.00505
; LINE_WIDTH: 0.239687
G1 X87.484 Y105.502 E.00099
G2 X87.606 Y105.614 I1.631 J-1.659 E.00221
; LINE_WIDTH: 0.191532
G1 X87.68 Y105.674 E.00097
G2 X87.802 Y105.755 I1.21 J-1.68 E.00151
; LINE_WIDTH: 0.155036
G1 X87.895 Y105.811 E.00085
; LINE_WIDTH: 0.120758
G2 X88.064 Y105.889 I1.131 J-2.222 E.00105
; LINE_WIDTH: 0.0925437
G1 X88.142 Y105.918 E.00031
; WIPE_START
G1 F18000
G1 X88.064 Y105.889 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.358 Y101.571 Z7.48 F42000
G1 X100.43 Y97.406 Z7.48
G1 Z7.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1997
M204 S5000
G3 X99.776 Y96.263 I-.5 J-.472 E.05743
G1 X99.912 Y96.246 E.00307
G3 X100.469 Y97.36 I.017 J.688 E.03487
M204 S250
G1 X100.597 Y97.171 F42000
G1 F1997
M204 S5000
G1 X100.568 Y97.242 E.00172
G3 X99.912 Y96.224 I-.64 J-.308 E.06744
G1 X99.977 Y96.226 E.00146
G3 X100.617 Y97.11 I-.049 J.709 E.02782
G1 X100.615 Y97.114 E.00009
; CHANGE_LAYER
; Z_HEIGHT: 7.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.568 Y97.242 E-.05205
G1 X100.451 Y97.419 E-.08042
G1 X100.345 Y97.512 E-.0538
G1 X100.222 Y97.583 E-.05378
G1 X100.088 Y97.628 E-.05383
G1 X99.948 Y97.646 E-.0538
G1 X99.807 Y97.635 E-.05381
G1 X99.67 Y97.597 E-.05377
G1 X99.544 Y97.532 E-.05381
G1 X99.407 Y97.417 E-.06808
G1 X99.323 Y97.306 E-.05293
G1 X99.262 Y97.178 E-.05377
G1 X99.222 Y96.982 E-.07614
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/51
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.48 I-.585 J-1.067 P1  F42000
G1 X88.114 Y103.066 Z7.48
G1 Z7.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1996
M204 S6000
G1 X88.184 Y103.02 E.0023
G3 X88.749 Y102.846 I.717 J1.33 E.01612
G1 X91.176 Y102.841 E.06574
G3 X91.123 Y105.861 I-.081 J1.509 E.12572
G1 X88.879 Y105.861 E.06079
G3 X87.923 Y103.198 I.022 J-1.511 E.0992
G1 X88.064 Y103.101 E.00464
M204 S250
G1 X88.338 Y103.396 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1996
M204 S5000
G1 X88.372 Y103.374 E.001
G3 X88.789 Y103.245 I.53 J.976 E.01106
G1 X91.156 Y103.241 E.05949
G3 X91.108 Y105.46 I-.059 J1.109 E.08592
G1 X88.889 Y105.46 E.05577
G3 X88.185 Y103.502 I.012 J-1.11 E.06781
G1 X88.289 Y103.43 E.00317
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.372 Y103.374 E-.03796
G1 X88.52 Y103.306 E-.06197
G1 X88.789 Y103.245 E-.10497
G1 X90.25 Y103.243 E-.55511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.014 Y102.488 Z7.64 F42000
G1 Z7.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1996
M204 S6000
G1 X92.364 Y102.611 E.01004
G1 X92.634 Y102.611 E.00733
G3 X93.136 Y103.356 I-7.204 J5.397 E.02436
G3 X91.492 Y106.189 I-1.641 J.942 E.10732
G1 X88.508 Y106.189 E.08086
G3 X86.913 Y103.276 I-.007 J-1.89 E.10994
G1 X87.366 Y102.611 E.02181
G1 X87.636 Y102.611 E.00733
G3 X88.507 Y102.411 I.91 J1.968 E.02438
G1 X91.59 Y102.413 E.08356
G3 X91.946 Y102.465 I-.121 J2.087 E.00976
G1 X91.957 Y102.469 E.00032
; WIPE_START
G1 F10826.06
G1 X92.364 Y102.611 E-.16361
G1 X92.634 Y102.611 E-.10273
G1 X93.136 Y103.356 E-.34154
G1 X93.259 Y103.61 E-.10718
G1 X93.296 Y103.722 E-.04493
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z7.64 F42000
G1 Z7.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1996
M204 S5000
G3 X93.733 Y103.791 I-2.655 J2.152 E.0343
G3 X91.497 Y106.59 I-2.239 J.504 E.10332
G1 X88.503 Y106.59 E.07529
G3 X86.576 Y103.058 I-.001 J-2.291 E.12347
G1 X86.895 Y102.59 E.01425
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X82.795 Y73.41 E.09031
G1 X82.795 Y73.79 E.00955
G1 X78.395 Y73.79 E.11062
G2 X77.49 Y74.695 I.007 J.912 E.03567
G1 X77.49 Y101.308 E.66907
G2 X78.393 Y102.21 I.927 J-.024 E.03539
G1 X87.56 Y102.21 E.23048
G3 X88.502 Y102.01 I.983 J2.313 E.02437
G1 X91.498 Y102.01 E.07531
G3 X92.44 Y102.21 I-.03 J2.461 E.02438
G1 X101.605 Y102.21 E.23042
M73 P87 R1
G2 X102.51 Y101.305 I-.015 J-.92 E.03558
G1 X102.51 Y74.695 E.66901
G2 X101.605 Y73.79 I-.912 J.007 E.03567
G1 X97.205 Y73.79 E.11062
G1 X97.205 Y73.41 E.00955
G1 X100.797 Y73.41 E.09031
G3 X102.89 Y75.503 I-.003 J2.096 E.08261
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.058 E-.20341
G1 X93.538 Y103.256 E-.08673
G1 X93.632 Y103.464 E-.0867
G1 X93.733 Y103.791 E-.13003
G1 X93.789 Y104.244 E-.1733
G1 X93.779 Y104.453 E-.07984
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

G1 X92.887 Y104.926
G1 Z7.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.331549
G1 F1996
M204 S6000
G1 X92.838 Y105.04 E.0024
G3 X92.743 Y105.215 I-3.159 J-1.607 E.00386
; LINE_WIDTH: 0.286142
G3 X92.566 Y105.449 I-2.087 J-1.393 E.00481
; LINE_WIDTH: 0.239365
G3 X92.392 Y105.618 I-1.976 J-1.867 E.00324
; LINE_WIDTH: 0.199623
G1 X92.266 Y105.711 E.00169
; LINE_WIDTH: 0.165629
G1 X92.13 Y105.796 E.00137
; LINE_WIDTH: 0.129654
G1 X91.982 Y105.87 E.00103
; LINE_WIDTH: 0.0998853
G1 X91.852 Y105.919 E.00059
M204 S10000
G1 X92.887 Y104.926 F42000
; LINE_WIDTH: 0.380822
G1 F1996
M204 S6000
G2 X92.93 Y103.843 I-1.587 J-.605 E.02491
G2 X92.251 Y102.79 I-2.741 J1.02 E.02853
M204 S10000
G1 X92.756 Y103.159 F42000
; LINE_WIDTH: 0.297458
G1 F1996
M204 S6000
G3 X92.279 Y102.933 I1.42 J-3.625 E.00906
; LINE_WIDTH: 0.256892
G1 X92.12 Y102.845 E.00264
; LINE_WIDTH: 0.215825
G2 X91.957 Y102.767 I-1.556 J3.064 E.00213
; LINE_WIDTH: 0.17156
G2 X91.733 Y102.692 I-.812 J2.067 E.00212
; LINE_WIDTH: 0.125405
G2 X91.541 Y102.653 I-.558 J2.238 E.00116
; LINE_WIDTH: 0.0942905
G1 X91.445 Y102.643 E.00038
M204 S10000
G1 X88.55 Y102.642 F42000
; LINE_WIDTH: 0.113067
G1 F1996
M204 S6000
G2 X88.297 Y102.684 I.405 J3.204 E.00131
; LINE_WIDTH: 0.151581
G1 X88.195 Y102.714 E.00081
; LINE_WIDTH: 0.183387
G2 X88.021 Y102.776 I.459 J1.55 E.0018
; LINE_WIDTH: 0.219248
G2 X87.871 Y102.849 I1.676 J3.637 E.00202
; LINE_WIDTH: 0.258239
G1 X87.721 Y102.933 E.00251
; LINE_WIDTH: 0.300035
G1 X87.711 Y102.939 E.0002
G3 X87.251 Y103.148 I-2.858 J-5.667 E.00876
M204 S10000
G1 X87.744 Y102.791 F42000
; LINE_WIDTH: 0.380311
G1 F1996
M204 S6000
G2 X87.066 Y103.858 I2.22 J2.16 E.02872
G2 X87.116 Y104.933 I1.674 J.461 E.02468
; LINE_WIDTH: 0.332464
G1 X87.17 Y105.057 E.00261
G2 X87.25 Y105.204 I2.439 J-1.237 E.00326
; LINE_WIDTH: 0.287596
G2 X87.434 Y105.448 I1.412 J-.87 E.00505
; LINE_WIDTH: 0.239746
G1 X87.484 Y105.502 E.00099
G2 X87.606 Y105.614 I1.611 J-1.636 E.00221
; LINE_WIDTH: 0.199157
G1 X87.732 Y105.71 E.0017
; LINE_WIDTH: 0.163907
G2 X87.895 Y105.811 I1.317 J-1.95 E.00162
; LINE_WIDTH: 0.121671
G2 X88.064 Y105.889 I1.958 J-4 E.00106
; LINE_WIDTH: 0.0929537
G1 X88.142 Y105.918 E.00032
; WIPE_START
G1 F18000
G1 X88.064 Y105.889 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.358 Y101.572 Z7.64 F42000
G1 X100.435 Y97.404 Z7.64
G1 Z7.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1996
M204 S5000
G1 X100.328 Y97.497 E.00317
G3 X99.776 Y96.263 I-.398 J-.562 E.05445
G1 X99.913 Y96.246 E.00307
G3 X100.473 Y97.358 I.017 J.689 E.03481
M204 S250
G1 X100.595 Y97.176 F42000
G1 F1996
M204 S5000
G1 X100.568 Y97.243 E.0016
G3 X99.912 Y96.224 I-.64 J-.308 E.06743
G1 X99.978 Y96.226 E.00148
G3 X100.617 Y97.11 I-.05 J.709 E.02781
G1 X100.614 Y97.119 E.00022
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.568 Y97.243 E-.04992
G1 X100.451 Y97.419 E-.08043
G1 X100.345 Y97.512 E-.05376
G1 X100.222 Y97.583 E-.05383
G1 X100.088 Y97.628 E-.05373
G1 X99.948 Y97.646 E-.05386
G1 X99.807 Y97.635 E-.05376
G1 X99.67 Y97.597 E-.05385
G1 X99.544 Y97.532 E-.0538
G1 X99.407 Y97.417 E-.06816
G1 X99.323 Y97.306 E-.05279
G1 X99.262 Y97.178 E-.0538
G1 X99.221 Y96.976 E-.07832
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/51
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.64 I-.585 J-1.067 P1  F42000
G1 X88.119 Y103.069 Z7.64
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2005
M204 S6000
G1 X88.245 Y102.991 E.00402
G3 X88.75 Y102.846 I.663 J1.359 E.01429
G1 X91.175 Y102.84 E.06573
G3 X91.123 Y105.861 I-.083 J1.509 E.12558
G1 X88.885 Y105.861 E.06065
G3 X87.937 Y103.191 I.023 J-1.511 E.09947
G1 X88.069 Y103.102 E.00431
M204 S250
G1 X88.334 Y103.404 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2005
M204 S5000
G1 X88.419 Y103.352 E.00251
G3 X88.79 Y103.245 I.487 J.998 E.00974
G1 X91.155 Y103.241 E.05948
G3 X91.108 Y105.46 I-.061 J1.109 E.08582
G1 X88.895 Y105.46 E.05565
G3 X88.19 Y103.5 I.011 J-1.11 E.06788
G1 X88.284 Y103.437 E.00284
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.419 Y103.352 E-.06073
G1 X88.677 Y103.262 E-.10391
G1 X88.79 Y103.245 E-.04308
G1 X90.243 Y103.243 E-.55229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.014 Y102.488 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2005
M204 S6000
G1 X92.364 Y102.611 E.01005
G1 X92.634 Y102.611 E.00732
G3 X93.137 Y103.356 I-7.197 J5.391 E.02437
G3 X91.492 Y106.189 I-1.641 J.941 E.10732
G1 X88.508 Y106.189 E.08086
G3 X86.913 Y103.275 I-.007 J-1.89 E.10995
G1 X87.366 Y102.611 E.0218
G1 X87.636 Y102.611 E.00732
G3 X88.507 Y102.411 I.909 J1.962 E.02438
G1 X91.591 Y102.413 E.08358
G3 X91.95 Y102.466 I-.123 J2.09 E.00983
G1 X91.957 Y102.468 E.00022
; WIPE_START
G1 F10826.06
G1 X92.364 Y102.611 E-.16379
G1 X92.634 Y102.611 E-.10268
G1 X93.137 Y103.356 E-.34162
G1 X93.259 Y103.61 E-.10717
G1 X93.296 Y103.722 E-.04474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2005
M204 S5000
G3 X93.733 Y103.791 I-2.656 J2.153 E.0343
G3 X91.497 Y106.59 I-2.239 J.504 E.10332
G1 X88.503 Y106.59 E.07529
G3 X86.576 Y103.058 I-.001 J-2.291 E.12348
G1 X86.895 Y102.59 E.01424
G1 X79.203 Y102.59 E.19339
M73 P88 R1
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X82.79 Y73.41 E.09019
G1 X82.79 Y73.79 E.00955
G1 X78.395 Y73.79 E.1105
G2 X77.49 Y74.695 I.01 J.915 E.03564
G1 X77.49 Y101.308 E.66907
G2 X78.394 Y102.21 I.927 J-.024 E.03543
G1 X87.56 Y102.21 E.23044
G3 X88.502 Y102.01 I.982 J2.306 E.02437
G1 X91.498 Y102.01 E.07531
G3 X92.44 Y102.21 I-.03 J2.462 E.02438
G1 X101.605 Y102.21 E.23041
G2 X102.51 Y101.308 I-.021 J-.926 E.03545
G1 X102.51 Y74.695 E.66908
G2 X101.605 Y73.79 I-.915 J.01 E.03564
G1 X97.21 Y73.79 E.1105
G1 X97.21 Y73.41 E.00955
G1 X100.797 Y73.41 E.09019
G3 X102.89 Y75.503 I-.003 J2.096 E.08261
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.058 E-.20328
G1 X93.538 Y103.256 E-.08673
G1 X93.632 Y103.464 E-.0868
G1 X93.733 Y103.791 E-.13003
G1 X93.789 Y104.244 E-.17332
G1 X93.779 Y104.453 E-.07986
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

G1 X92.914 Y104.852
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.38057
G1 F2005
M204 S6000
G2 X92.51 Y103.095 I-1.763 J-.519 E.04253
G2 X92.384 Y102.978 I-.174 J.06 E.00404
; LINE_WIDTH: 0.331098
G1 X92.324 Y102.956 E.00123
; LINE_WIDTH: 0.282292
G3 X92.218 Y102.898 I.246 J-.582 E.00196
; LINE_WIDTH: 0.238048
G1 X92.048 Y102.808 E.00255
; LINE_WIDTH: 0.199238
G1 X91.882 Y102.739 E.00193
; LINE_WIDTH: 0.162886
G1 X91.734 Y102.693 E.0013
; LINE_WIDTH: 0.125564
G2 X91.541 Y102.653 I-.563 J2.256 E.00118
; LINE_WIDTH: 0.0942693
G1 X91.445 Y102.643 E.00038
; WIPE_START
G1 F18000
G1 X91.541 Y102.653 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.914 Y104.852 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.337746
G1 F2005
M204 S6000
M73 P89 R1
G3 X92.752 Y105.201 I-1.675 J-.565 E.00761
; LINE_WIDTH: 0.29038
G3 X92.618 Y105.388 I-4.76 J-3.261 E.00386
G1 X92.585 Y105.428 E.00086
; LINE_WIDTH: 0.24186
G3 X92.402 Y105.609 I-1.911 J-1.745 E.00349
G1 X92.396 Y105.615 E.00011
; LINE_WIDTH: 0.192016
G3 X92.199 Y105.756 I-3.474 J-4.616 E.00249
; LINE_WIDTH: 0.142583
G3 X92.013 Y105.856 I-1.398 J-2.381 E.00149
; LINE_WIDTH: 0.10259
G3 X91.852 Y105.919 I-.642 J-1.404 E.00077
M204 S10000
G1 X88.142 Y105.918 F42000
; LINE_WIDTH: 0.0986471
G1 F2005
M204 S6000
G1 X88.007 Y105.865 E.00061
; LINE_WIDTH: 0.131005
G1 X87.869 Y105.796 E.00097
; LINE_WIDTH: 0.17353
G3 X87.68 Y105.674 I1.141 J-1.969 E.00205
; LINE_WIDTH: 0.216107
G3 X87.539 Y105.554 I1.62 J-2.057 E.00219
; LINE_WIDTH: 0.257361
G3 X87.361 Y105.361 I1.096 J-1.188 E.00382
; LINE_WIDTH: 0.303391
G3 X87.204 Y105.122 I1.403 J-1.095 E.00502
; LINE_WIDTH: 0.347774
G3 X87.12 Y104.946 I1.698 J-.912 E.004
G1 X87.066 Y104.782 E.00352
; LINE_WIDTH: 0.382376
G3 X87.07 Y103.844 I1.619 J-.462 E.02157
G3 X87.749 Y102.79 I2.849 J1.088 E.02866
M204 S10000
G1 X87.233 Y103.174 F42000
; LINE_WIDTH: 0.295633
G1 F2005
M204 S6000
G1 X87.718 Y102.935 E.0092
; LINE_WIDTH: 0.264629
G1 X87.836 Y102.87 E.00202
; LINE_WIDTH: 0.233255
G1 X87.941 Y102.813 E.00155
; LINE_WIDTH: 0.199783
G3 X88.12 Y102.738 I1.042 J2.236 E.00209
; LINE_WIDTH: 0.159365
G3 X88.302 Y102.683 I1.395 J4.319 E.00155
; LINE_WIDTH: 0.112697
G3 X88.549 Y102.642 I.8 J4.025 E.00128
; WIPE_START
G1 F18000
G1 X88.302 Y102.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.301 Y99.639 Z7.8 F42000
G1 X100.434 Y97.406 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2005
M204 S5000
G1 X100.332 Y97.495 E.00301
G3 X99.844 Y96.251 I-.4 J-.56 E.05599
G1 X99.918 Y96.246 E.00164
G3 X100.473 Y97.361 I.015 J.688 E.03482
M204 S250
G1 X100.587 Y97.201 F42000
G1 F2005
M204 S5000
G1 X100.535 Y97.304 E.0026
G3 X99.912 Y96.224 I-.607 J-.37 E.06585
G1 X99.979 Y96.226 E.0015
G3 X100.607 Y97.144 I-.051 J.709 E.0286
; CHANGE_LAYER
; Z_HEIGHT: 7.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.535 Y97.304 E-.06674
G1 X100.451 Y97.419 E-.05378
G1 X100.345 Y97.512 E-.05383
G1 X100.223 Y97.583 E-.05375
G1 X100.088 Y97.628 E-.05385
G1 X99.948 Y97.646 E-.0538
G1 X99.807 Y97.635 E-.05381
G1 X99.635 Y97.582 E-.06815
G1 X99.46 Y97.468 E-.07958
G1 X99.363 Y97.364 E-.05381
G1 X99.289 Y97.243 E-.05381
G1 X99.241 Y97.11 E-.05378
G1 X99.22 Y96.97 E-.05382
G1 X99.221 Y96.951 E-.00748
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/51
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.8 I-.587 J-1.066 P1  F42000
G1 X88.097 Y103.078 Z7.8
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3145
M204 S6000
G1 X88.184 Y103.019 E.00283
G3 X88.682 Y102.854 I.717 J1.33 E.0143
G1 X88.877 Y102.839 E.0053
G1 X91.175 Y102.84 E.06227
G3 X91.123 Y105.861 I-.077 J1.509 E.12588
G1 X88.885 Y105.861 E.06065
G3 X87.929 Y103.192 I.016 J-1.511 E.09961
G1 X88.048 Y103.111 E.0039
M204 S250
G1 X88.321 Y103.407 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3145
M204 S5000
G1 X88.373 Y103.376 E.00151
G3 X88.737 Y103.252 I.536 J.973 E.00973
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.057 J1.109 E.08603
G1 X88.895 Y105.46 E.05565
G3 X88.189 Y103.503 I.015 J-1.111 E.0677
G1 X88.273 Y103.443 E.00259
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.373 Y103.376 E-.04552
G1 X88.518 Y103.307 E-.06105
G1 X88.737 Y103.252 E-.08596
G1 X90.23 Y103.245 E-.56748
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.013 Y102.487 Z7.96 F42000
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3145
M204 S6000
G1 X92.364 Y102.611 E.01007
G1 X92.634 Y102.611 E.00732
G3 X93.136 Y103.356 I-7.207 J5.399 E.02436
G3 X91.492 Y106.189 I-1.641 J.942 E.10733
G1 X88.508 Y106.189 E.08086
G3 X86.913 Y103.276 I-.007 J-1.89 E.10994
G1 X87.366 Y102.611 E.0218
G1 X87.636 Y102.611 E.00732
G3 X88.507 Y102.411 I.908 J1.957 E.02439
G1 X91.592 Y102.413 E.08359
G3 X91.953 Y102.466 I-.124 J2.092 E.00991
G1 X91.957 Y102.468 E.00011
; WIPE_START
G1 F10826.06
G1 X92.364 Y102.611 E-.16403
G1 X92.634 Y102.611 E-.10259
G1 X93.136 Y103.356 E-.34144
G1 X93.259 Y103.61 E-.10728
G1 X93.296 Y103.722 E-.04465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.238 Y97.905 Z7.96 F42000
G1 X102.1 Y93.361 Z7.96
G1 Z7.56
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X102.483 Y93.361 E.01036
M106 S201.45
G1 F1182.642
G1 X102.489 Y93.639 E.00755
G1 F623.509
G1 X102.483 Y93.639 E.00019
M106 S255
G1 F600
G1 X102.1 Y93.639 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X101.911 Y93.639 E.00513
G1 X101.911 Y93.361 E.00755
G1 X102.04 Y93.361 E.0035
M106 S201.45
; WIPE_START
M204 S6000
G1 X102.483 Y93.361 E-.1969
G1 X102.489 Y93.639 E-.12405
G1 X102.483 Y93.639 E-.00305
G1 X102.1 Y93.639 E-.1702
G1 X101.911 Y93.639 E-.08425
G1 X101.911 Y93.361 E-.12401
G1 X102.04 Y93.361 E-.05755
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I1.201 J-.195 P1  F42000
G1 X98.861 Y73.818 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1918.712
M204 S6000
G1 X99.139 Y73.818 E.00755
M106 S255
G1 F600
G1 X99.139 Y74.2 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X99.139 Y74.589 E.01055
M106 S201.45
M106 S255
G1 F600
G1 X98.861 Y74.589 E.00755
G1 X98.861 Y74.2 E.01055
M106 S201.45
; FEATURE: Inner wall
M106 S255
M204 S6000
G1 X98.861 Y73.878 E.00874
M106 S201.45
; WIPE_START
G1 X99.139 Y73.818 E-.10833
G1 X99.139 Y74.2 E-.14535
G1 X99.139 Y74.589 E-.14795
G1 X98.861 Y74.589 E-.1059
G1 X98.861 Y74.2 E-.14795
G1 X98.861 Y73.925 E-.10453
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.464 Y75.809 Z7.96 F42000
G1 X77.518 Y79.361 Z7.96
G1 Z7.56
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X77.9 Y79.361 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X78.089 Y79.361 E.00513
G1 X78.089 Y79.639 E.00755
M106 S201.45
M106 S255
G1 F3000
G1 X77.9 Y79.639 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X77.518 Y79.639 E.01036
M106 S201.45
G1 F1571.82
G1 X77.518 Y79.421 E.00593
; WIPE_START
G1 X77.9 Y79.361 E-.1788
G1 X78.089 Y79.361 E-.08743
G1 X78.089 Y79.639 E-.1287
G1 X77.9 Y79.639 E-.08743
G1 X77.518 Y79.639 E-.17664
G1 X77.518 Y79.421 E-.10099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.518 Y87.053 Z7.96 F42000
G1 X77.518 Y98.361 Z7.96
G1 Z7.56
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X77.9 Y98.361 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X78.089 Y98.361 E.00513
G1 X78.089 Y98.639 E.00755
M106 S201.45
M106 S255
G1 F3000
G1 X77.9 Y98.639 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X77.518 Y98.639 E.01036
M106 S201.45
G1 F1571.82
G1 X77.518 Y98.421 E.00593
; WIPE_START
G1 X77.9 Y98.361 E-.1788
G1 X78.089 Y98.361 E-.08743
G1 X78.089 Y98.639 E-.1287
G1 X77.9 Y98.639 E-.08743
G1 X77.518 Y98.639 E-.17664
G1 X77.518 Y98.421 E-.10099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I-.314 J1.176 P1  F42000
G1 X93.105 Y102.59 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3145
M204 S5000
G3 X93.733 Y103.791 I-2.655 J2.152 E.03429
G3 X91.497 Y106.59 I-2.239 J.504 E.10333
G1 X88.503 Y106.59 E.07529
G3 X86.576 Y103.058 I-.001 J-2.291 E.12348
G1 X86.895 Y102.59 E.01424
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08261
G1 X82.79 Y73.41 E.09019
M73 P89 R0
G1 X82.79 Y73.79 E.00955
G1 X78.395 Y73.79 E.11049
G2 X77.49 Y74.695 I.01 J.915 E.03564
G1 X77.49 Y77.76 E.07706
G1 X77.49 Y78.16 E.01006
G1 X77.49 Y78.56 E.01006
G1 F3030.312
G1 X77.49 Y78.96 E.01006
G1 F747.227
G1 X77.531 Y78.96 E.00103
M106 S255
G1 F600
G1 X77.9 Y78.96 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X78.49 Y78.96 E.01599
G1 X78.49 Y80.04 E.02927
G1 X77.9 Y80.04 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X77.531 Y80.04 E.00928
M106 S201.45
G1 F747.227
G1 X77.49 Y80.04 E.00103
G1 F3030.312
G1 X77.49 Y80.44 E.01006
G1 F3145
G1 X77.49 Y80.84 E.01006
G1 X77.49 Y81.24 E.01006
G1 X77.49 Y96.76 E.39019
G1 X77.49 Y97.16 E.01006
G1 X77.49 Y97.56 E.01006
M73 P90 R0
G1 F3030.312
G1 X77.49 Y97.96 E.01006
G1 F747.227
G1 X77.531 Y97.96 E.00103
M106 S255
G1 F600
G1 X77.9 Y97.96 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X78.49 Y97.96 E.01599
G1 X78.49 Y99.04 E.02927
G1 X77.9 Y99.04 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X77.531 Y99.04 E.00928
M106 S201.45
G1 F747.53
G1 X77.49 Y99.04 E.00103
G1 F3030.923
G1 X77.49 Y99.44 E.01006
G1 F3145
G1 X77.49 Y99.84 E.01006
G1 X77.49 Y100.24 E.01006
G1 X77.491 Y101.347 E.02784
G2 X78.394 Y102.21 I.926 J-.066 E.03445
G1 X87.56 Y102.21 E.23043
G3 X88.502 Y102.01 I.98 J2.299 E.02438
G1 X91.498 Y102.01 E.07531
G3 X92.44 Y102.21 I-.031 J2.465 E.02438
G1 X101.605 Y102.21 E.23041
G2 X102.51 Y101.308 I-.015 J-.92 E.03552
G1 X102.51 Y95.24 E.15255
G1 X102.51 Y94.84 E.01006
G1 X102.51 Y94.44 E.01006
G1 F3030.312
G1 X102.51 Y94.04 E.01006
G1 F747.227
G1 X102.469 Y94.04 E.00103
M106 S255
G1 F600
G1 X102.1 Y94.04 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y94.04 E.01599
G1 X101.51 Y92.96 E.02927
G1 X102.1 Y92.96 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y92.96 E.00928
M106 S201.45
G1 F747.227
G1 X102.51 Y92.96 E.00103
G1 F3030.312
G1 X102.51 Y92.56 E.01006
G1 F3145
G1 X102.51 Y92.16 E.01006
G1 X102.51 Y91.76 E.01006
G1 X102.51 Y74.695 E.42904
G2 X101.605 Y73.79 I-.933 J.028 E.03545
G1 X100.74 Y73.79 E.02175
G1 X100.34 Y73.79 E.01006
G1 X99.94 Y73.79 E.01006
G1 F3030.312
G1 X99.54 Y73.79 E.01006
G1 F747.227
G1 X99.54 Y73.831 E.00103
M106 S255
G1 F600
G1 X99.54 Y74.2 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X99.54 Y74.99 E.02141
G1 X98.46 Y74.99 E.02927
G1 X98.46 Y74.2 E.02141
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X98.46 Y73.831 E.00928
M106 S201.45
G1 F747.227
G1 X98.46 Y73.79 E.00103
G1 F3030.312
G1 X98.06 Y73.79 E.01006
G1 F3145
G1 X97.66 Y73.79 E.01006
G1 X97.21 Y73.79 E.01131
G1 X97.21 Y73.41 E.00955
G1 X100.797 Y73.41 E.09019
G3 X102.89 Y75.503 I-.003 J2.096 E.08262
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19189
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.058 E-.20331
G1 X93.538 Y103.256 E-.08671
G1 X93.632 Y103.464 E-.08677
G1 X93.733 Y103.791 E-.12998
G1 X93.789 Y104.243 E-.17333
G1 X93.779 Y104.453 E-.07989
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

G1 X92.909 Y104.867
G1 Z7.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.335574
G1 F3145
M204 S6000
G3 X92.743 Y105.215 I-1.614 J-.556 E.00758
; LINE_WIDTH: 0.289104
G3 X92.585 Y105.428 I-2.18 J-1.453 E.00441
; LINE_WIDTH: 0.241243
G3 X92.391 Y105.619 I-2.674 J-2.526 E.00367
; LINE_WIDTH: 0.199877
G1 X92.268 Y105.71 E.00165
; LINE_WIDTH: 0.165615
G1 X92.131 Y105.796 E.00139
; LINE_WIDTH: 0.127066
G3 X91.951 Y105.883 I-.986 J-1.798 E.00121
; LINE_WIDTH: 0.094643
G1 X91.857 Y105.918 E.00039
M204 S10000
G1 X92.909 Y104.867 F42000
; LINE_WIDTH: 0.381559
G1 F3145
M204 S6000
G2 X92.952 Y103.925 I-1.578 J-.545 E.02165
G2 X92.251 Y102.789 I-2.669 J.863 E.0305
M204 S10000
G1 X92.756 Y103.159 F42000
; LINE_WIDTH: 0.297656
G1 F3145
M204 S6000
G3 X92.279 Y102.934 I1.424 J-3.629 E.00907
; LINE_WIDTH: 0.257047
G1 X92.12 Y102.845 E.00264
; LINE_WIDTH: 0.215885
G2 X91.958 Y102.767 I-1.573 J3.096 E.00213
; LINE_WIDTH: 0.171916
G2 X91.736 Y102.693 I-.85 J2.179 E.0021
; LINE_WIDTH: 0.125673
G2 X91.541 Y102.653 I-.563 J2.249 E.00118
; LINE_WIDTH: 0.0942415
G1 X91.445 Y102.643 E.00038
M204 S10000
G1 X88.555 Y102.643 F42000
; LINE_WIDTH: 0.0977359
G1 F3145
M204 S6000
G1 X88.421 Y102.66 E.00056
; LINE_WIDTH: 0.128543
G1 X88.266 Y102.692 E.00097
; LINE_WIDTH: 0.172575
G2 X88.044 Y102.766 I1.179 J3.883 E.00211
; LINE_WIDTH: 0.216566
G1 X88.023 Y102.776 E.00028
G2 X87.871 Y102.849 I1.692 J3.672 E.00201
; LINE_WIDTH: 0.258506
G1 X87.72 Y102.934 E.00252
; LINE_WIDTH: 0.297665
G3 X87.244 Y103.159 I-1.878 J-3.357 E.00905
M204 S10000
G1 X87.749 Y102.789 F42000
; LINE_WIDTH: 0.380962
G1 F3145
M204 S6000
G2 X87.041 Y103.959 I1.844 J1.916 E.03125
G1 X87.029 Y104.018 E.00135
G2 X87.113 Y104.928 I1.703 J.301 E.0209
; LINE_WIDTH: 0.33246
G1 X87.12 Y104.946 E.00037
G2 X87.249 Y105.2 I1.801 J-.75 E.00554
; LINE_WIDTH: 0.300379
G1 X87.331 Y105.322 E.00254
; LINE_WIDTH: 0.270497
G2 X87.476 Y105.494 I1.498 J-1.112 E.00348
; LINE_WIDTH: 0.234307
G2 X87.606 Y105.613 I1.697 J-1.717 E.00229
; LINE_WIDTH: 0.199214
G1 X87.732 Y105.71 E.00171
; LINE_WIDTH: 0.163805
G2 X87.895 Y105.811 I.949 J-1.358 E.00162
; LINE_WIDTH: 0.120833
G2 X88.064 Y105.889 I1.008 J-1.946 E.00105
; LINE_WIDTH: 0.0929611
G1 X88.142 Y105.918 E.00032
; WIPE_START
G1 F18000
G1 X88.064 Y105.889 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.358 Y101.572 Z7.96 F42000
G1 X100.434 Y97.406 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F3145
M204 S5000
G1 X100.331 Y97.492 E.00302
G3 X99.776 Y96.263 I-.401 J-.559 E.05448
G1 X99.913 Y96.246 E.00307
G3 X100.47 Y97.359 I.017 J.688 E.03484
M204 S250
G1 X100.589 Y97.194 F42000
G1 F3145
M204 S5000
G1 X100.57 Y97.243 E.00119
G3 X99.912 Y96.224 I-.64 J-.309 E.06738
G1 X99.983 Y96.226 E.00158
G3 X100.618 Y97.11 I-.053 J.709 E.02776
G1 X100.609 Y97.137 E.00063
; CHANGE_LAYER
; Z_HEIGHT: 7.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X100.57 Y97.243 E-.04295
G1 X100.497 Y97.364 E-.05374
G1 X100.401 Y97.468 E-.05377
G1 X100.285 Y97.551 E-.05395
G1 X100.156 Y97.609 E-.05373
G1 X100.018 Y97.64 E-.05375
G1 X99.877 Y97.644 E-.05381
G1 X99.635 Y97.582 E-.09474
G1 X99.515 Y97.512 E-.05295
G1 X99.409 Y97.419 E-.05376
G1 X99.323 Y97.306 E-.05376
G1 X99.262 Y97.178 E-.05375
G1 X99.227 Y97.041 E-.05387
G1 X99.223 Y96.958 E-.03147
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/51
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.96 I-.586 J-1.067 P1  F42000
G1 X88.107 Y103.066 Z7.96
G1 Z7.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2133
M204 S6000
G1 X88.184 Y103.019 E.00244
G3 X88.749 Y102.846 I.716 J1.331 E.01613
G1 X91.175 Y102.84 E.06574
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.885 Y105.861 E.06065
G3 X88.049 Y103.101 I.015 J-1.511 E.10372
G1 X88.056 Y103.097 E.00022
M204 S250
G1 X88.321 Y103.412 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2133
M204 S5000
G1 X88.373 Y103.377 E.00158
G3 X88.789 Y103.245 I.536 J.973 E.01105
G1 X91.155 Y103.241 E.05948
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.109 Y103.579 I.014 J-1.111 E.06493
G1 X88.274 Y103.449 E.00527
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.373 Y103.377 E-.04661
G1 X88.52 Y103.306 E-.06198
G1 X88.789 Y103.245 E-.10493
G1 X90.228 Y103.243 E-.54648
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.013 Y102.487 Z8.12 F42000
G1 Z7.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2133
M204 S6000
G1 X92.364 Y102.611 E.01008
G1 X92.634 Y102.611 E.00731
G3 X93.136 Y103.356 I-7.225 J5.411 E.02436
G3 X91.492 Y106.189 I-1.641 J.942 E.10733
G1 X88.508 Y106.189 E.08086
G3 X86.913 Y103.275 I-.007 J-1.89 E.10995
G1 X87.366 Y102.611 E.02179
G1 X87.636 Y102.611 E.00731
G3 X88.507 Y102.411 I.907 J1.953 E.0244
G1 X91.592 Y102.413 E.0836
G3 X91.956 Y102.467 I-.125 J2.094 E.00998
G1 X91.957 Y102.467 E.00002
; WIPE_START
G1 F10826.06
G1 X92.364 Y102.611 E-.16414
G1 X92.634 Y102.611 E-.10255
G1 X93.136 Y103.356 E-.3415
G1 X93.259 Y103.61 E-.1072
G1 X93.296 Y103.721 E-.04461
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z8.12 F42000
G1 Z7.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2133
M204 S5000
G3 X93.733 Y103.791 I-2.656 J2.153 E.03429
M73 P91 R0
G3 X91.497 Y106.59 I-2.239 J.505 E.10333
G1 X88.503 Y106.59 E.07529
G3 X86.576 Y103.058 I-.001 J-2.291 E.12348
G1 X86.895 Y102.59 E.01424
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I.003 J-2.096 E.08261
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08261
G1 X82.79 Y73.41 E.09019
G1 X82.79 Y73.79 E.00955
G1 X78.395 Y73.79 E.11049
G2 X77.49 Y74.695 I.01 J.915 E.03563
G1 X77.49 Y78.96 E.10723
G1 X78.49 Y78.96 E.02514
G1 X78.49 Y80.04 E.02715
G1 X77.49 Y80.04 E.02514
G1 X77.49 Y97.96 E.45053
G1 X78.49 Y97.96 E.02514
G1 X78.49 Y99.04 E.02715
G1 X77.49 Y99.04 E.02514
G1 X77.491 Y101.347 E.05801
G2 X78.394 Y102.21 I.926 J-.066 E.03445
G1 X87.56 Y102.21 E.23043
G3 X88.502 Y102.01 I.979 J2.292 E.02438
G1 X91.498 Y102.01 E.07531
G3 X92.44 Y102.21 I-.031 J2.467 E.02439
G1 X101.605 Y102.21 E.23041
G2 X102.51 Y101.305 I-.015 J-.92 E.03558
G1 X102.51 Y94.04 E.18266
G1 X101.51 Y94.04 E.02514
G1 X101.51 Y92.96 E.02715
G1 X102.51 Y92.96 E.02514
G1 X102.51 Y74.695 E.45921
G2 X101.605 Y73.79 I-.933 J.029 E.03545
G1 X99.54 Y73.79 E.05191
G1 X99.54 Y74.99 E.03017
G1 X98.46 Y74.99 E.02715
G1 X98.46 Y73.79 E.03017
G1 X97.21 Y73.79 E.03143
G1 X97.21 Y73.41 E.00955
G1 X100.797 Y73.41 E.09019
G3 X102.89 Y75.503 I-.003 J2.096 E.08261
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08261
G1 X93.165 Y102.59 E.19189
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.058 E-.20322
G1 X93.538 Y103.256 E-.08671
G1 X93.632 Y103.464 E-.08678
G1 X93.733 Y103.791 E-.13002
G1 X93.789 Y104.243 E-.17326
G1 X93.779 Y104.453 E-.08001
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

G1 X92.887 Y104.924
G1 Z7.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.333495
M73 P92 R0
G1 F2133
M204 S6000
G1 X92.833 Y105.052 E.00272
G3 X92.751 Y105.2 I-1.512 J-.742 E.00329
; LINE_WIDTH: 0.290184
G1 X92.707 Y105.269 E.00137
G3 X92.587 Y105.425 I-2.166 J-1.544 E.00329
; LINE_WIDTH: 0.2417
G3 X92.395 Y105.613 I-1.334 J-1.171 E.00363
; LINE_WIDTH: 0.197903
G3 X92.247 Y105.726 I-.878 J-.997 E.00199
; LINE_WIDTH: 0.163646
G1 X92.13 Y105.795 E.00115
; LINE_WIDTH: 0.12987
G1 X91.983 Y105.87 E.00103
; LINE_WIDTH: 0.0999573
G1 X91.852 Y105.919 E.0006
M204 S10000
G1 X92.887 Y104.924 F42000
; LINE_WIDTH: 0.380908
G1 F2133
M204 S6000
G2 X92.93 Y103.844 I-1.551 J-.602 E.02486
G2 X92.251 Y102.789 I-2.74 J1.018 E.02857
M204 S10000
G1 X92.12 Y102.845 F42000
; LINE_WIDTH: 0.257106
G1 F2133
M204 S6000
G1 X92.279 Y102.934 E.00265
; LINE_WIDTH: 0.297799
G2 X92.757 Y103.159 I1.908 J-3.417 E.00907
M204 S10000
G1 X92.12 Y102.845 F42000
; LINE_WIDTH: 0.207303
G1 F2133
M204 S6000
G2 X91.887 Y102.741 I-1.063 J2.07 E.00288
; LINE_WIDTH: 0.163825
G1 X91.737 Y102.694 E.00133
; LINE_WIDTH: 0.125573
G2 X91.537 Y102.653 I-.583 J2.349 E.00121
; LINE_WIDTH: 0.0938757
G1 X91.445 Y102.643 E.00036
M204 S10000
G1 X88.55 Y102.642 F42000
; LINE_WIDTH: 0.113031
G1 F2133
M204 S6000
G2 X88.298 Y102.684 I.396 J3.148 E.00131
; LINE_WIDTH: 0.152442
G1 X88.188 Y102.716 E.00088
; LINE_WIDTH: 0.182821
G1 X88.024 Y102.775 E.0017
; LINE_WIDTH: 0.219023
G2 X87.871 Y102.849 I1.673 J3.637 E.00204
; LINE_WIDTH: 0.258593
G1 X87.72 Y102.934 E.00253
; LINE_WIDTH: 0.297854
G3 X87.244 Y103.159 I-1.874 J-3.35 E.00905
M204 S10000
G1 X87.749 Y102.789 F42000
; LINE_WIDTH: 0.380973
G1 F2133
M204 S6000
G2 X87.07 Y103.844 I2.25 J2.195 E.02853
G2 X87.113 Y104.927 I1.692 J.475 E.0249
; LINE_WIDTH: 0.333129
G1 X87.128 Y104.964 E.00077
G2 X87.248 Y105.201 I3.382 J-1.562 E.00517
; LINE_WIDTH: 0.294007
G2 X87.383 Y105.389 I1.442 J-.89 E.00394
; LINE_WIDTH: 0.260692
G1 X87.488 Y105.507 E.00232
; LINE_WIDTH: 0.232687
G1 X87.605 Y105.613 E.00204
; LINE_WIDTH: 0.199867
G1 X87.727 Y105.707 E.00167
; LINE_WIDTH: 0.164262
G2 X87.895 Y105.811 I.964 J-1.372 E.00167
; LINE_WIDTH: 0.12084
G2 X88.064 Y105.889 I1.055 J-2.053 E.00105
; LINE_WIDTH: 0.0927806
G1 X88.142 Y105.918 E.00032
; WIPE_START
G1 F18000
G1 X88.064 Y105.889 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.069 Y101.165 Z8.12 F42000
G1 X78.278 Y98.177 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2133
M204 S2000
G1 X77.627 Y98.828 E.02315
G1 X77.322 Y98.587
G1 X77.737 Y98.172 E.01476
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.322 Y98.587 E-.23534
G1 X77.627 Y98.828 E-.15564
G1 X78.278 Y98.177 E-.36902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.244 Y90.545 Z8.12 F42000
G1 X78.193 Y79.172 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F2133
M204 S2000
G1 X77.538 Y79.828 E.02332
M204 S10000
G1 X77.36 Y79.153 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.152642
G1 F2133
M204 S6000
G1 X77.36 Y79.732 E.00447
G1 X77.408 Y79.847 E.00096
; WIPE_START
G1 F18000
G1 X77.36 Y79.732 E-.13431
G1 X77.36 Y79.153 E-.62569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I.257 J1.189 P1  F42000
G1 X99.328 Y74.4 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2133
M204 S2000
G1 X98.95 Y74.778 E.01344
G1 X98.672 Y74.51
G1 X99.328 Y73.854 E.02332
M204 S10000
G1 X99.347 Y73.715 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.171283
G1 F2133
M204 S6000
G1 X99.239 Y73.67 E.00104
G1 X98.653 Y73.67 E.00523
; WIPE_START
G1 F18000
G1 X99.239 Y73.67 E-.63369
G1 X99.347 Y73.715 E-.12631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I-1.204 J.175 P1  F42000
G1 X102.261 Y93.828 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2133
M204 S2000
G1 X102.678 Y93.411 E.01481
G1 X102.372 Y93.172
G1 X101.722 Y93.822 E.0231
; CHANGE_LAYER
; Z_HEIGHT: 7.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.372 Y93.172 E-.36827
G1 X102.678 Y93.411 E-.15571
G1 X102.261 Y93.828 E-.23602
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/51
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.12 I-.665 J-1.019 P1  F42000
G1 X88.083 Y103.087 Z8.12
G1 Z7.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1926
M204 S6000
G1 X88.184 Y103.019 E.00328
G3 X88.682 Y102.854 I.717 J1.33 E.01429
G1 X88.877 Y102.839 E.0053
G1 X91.183 Y102.84 E.06249
G3 X91.123 Y105.861 I-.085 J1.509 E.12569
G1 X88.885 Y105.861 E.06064
G3 X87.929 Y103.192 I.016 J-1.511 E.09962
G1 X88.034 Y103.121 E.00345
M204 S250
G1 X88.308 Y103.417 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1926
M204 S5000
G1 X88.373 Y103.376 E.00192
G3 X88.737 Y103.252 I.536 J.973 E.00973
G1 X91.158 Y103.241 E.06087
G3 X91.108 Y105.46 I-.06 J1.109 E.08596
G1 X88.895 Y105.46 E.05564
G3 X88.189 Y103.503 I.014 J-1.111 E.06771
G1 X88.259 Y103.452 E.00217
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.373 Y103.376 E-.05181
G1 X88.518 Y103.307 E-.06128
G1 X88.737 Y103.252 E-.08567
G1 X90.214 Y103.245 E-.56124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.013 Y102.487 Z8.28 F42000
G1 Z7.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1926
M204 S6000
G1 X92.364 Y102.611 E.01009
G1 X92.634 Y102.611 E.00731
G3 X93.136 Y103.356 I-7.221 J5.408 E.02435
G3 X91.492 Y106.189 I-1.64 J.942 E.10734
G1 X88.508 Y106.189 E.08086
G3 X86.913 Y103.275 I-.007 J-1.89 E.10995
G1 X87.366 Y102.611 E.0218
G1 X87.636 Y102.611 E.00731
G3 X88.507 Y102.411 I.905 J1.947 E.02441
G1 X91.593 Y102.413 E.08361
G3 X91.957 Y102.467 I-.125 J2.094 E.00998
; WIPE_START
G1 F10826.06
G1 X92.364 Y102.611 E-.16427
G1 X92.634 Y102.611 E-.10252
G1 X93.136 Y103.356 E-.34135
G1 X93.259 Y103.61 E-.10735
G1 X93.296 Y103.721 E-.0445
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z8.28 F42000
G1 Z7.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1926
M204 S5000
G3 X93.733 Y103.791 I-2.657 J2.153 E.03429
G3 X91.497 Y106.59 I-2.239 J.505 E.10334
G1 X88.503 Y106.59 E.07528
G3 X86.576 Y103.058 I-.002 J-2.291 E.12349
G1 X86.895 Y102.59 E.01423
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I.003 J-2.096 E.08261
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X82.79 Y73.41 E.09019
G1 X82.79 Y73.79 E.00955
G1 X78.395 Y73.79 E.11049
G2 X77.49 Y74.695 I.01 J.915 E.03564
G1 X77.49 Y101.308 E.66908
G2 X78.393 Y102.21 I.926 J-.024 E.03539
G1 X87.56 Y102.21 E.23047
M73 P93 R0
G3 X88.502 Y102.01 I.977 J2.284 E.02438
G1 X91.498 Y102.01 E.0753
G3 X92.44 Y102.21 I-.031 J2.468 E.02439
G1 X101.605 Y102.21 E.23041
G2 X102.51 Y101.308 I-.021 J-.926 E.03545
G1 X102.51 Y74.695 E.66909
G2 X101.605 Y73.79 I-.915 J.01 E.03563
G1 X97.21 Y73.79 E.1105
G1 X97.21 Y73.41 E.00955
G1 X100.797 Y73.41 E.09019
G3 X102.89 Y75.503 I-.003 J2.096 E.08261
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08261
G1 X93.165 Y102.59 E.19189
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.058 E-.20318
G1 X93.538 Y103.256 E-.08678
G1 X93.632 Y103.464 E-.08673
G1 X93.733 Y103.791 E-.13001
G1 X93.772 Y104.015 E-.08675
G1 X93.789 Y104.357 E-.13003
G1 X93.777 Y104.453 E-.03653
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

G1 X92.909 Y104.867
G1 Z7.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.381449
G1 F1926
M204 S6000
G2 X92.954 Y103.936 I-1.574 J-.544 E.02138
G1 X92.944 Y103.894 E.00098
G2 X92.251 Y102.789 I-2.592 J.856 E.0298
M204 S10000
G1 X92.757 Y103.159 F42000
; LINE_WIDTH: 0.297859
G1 F1926
M204 S6000
G3 X92.279 Y102.934 I1.423 J-3.626 E.00907
; LINE_WIDTH: 0.257113
G1 X92.12 Y102.844 E.00265
; LINE_WIDTH: 0.207677
G2 X91.89 Y102.742 I-1.061 J2.063 E.00285
; LINE_WIDTH: 0.164501
G1 X91.739 Y102.694 E.00135
; LINE_WIDTH: 0.129292
G1 X91.58 Y102.66 E.001
; LINE_WIDTH: 0.10017
G1 X91.448 Y102.642 E.00057
; WIPE_START
G1 F18000
G1 X91.58 Y102.66 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.909 Y104.867 Z8.28 F42000
G1 Z7.88
G1 E.8 F1800
; LINE_WIDTH: 0.33739
G1 F1926
M204 S6000
G3 X92.752 Y105.198 I-1.566 J-.539 E.00724
; LINE_WIDTH: 0.299666
G1 X92.665 Y105.328 E.00271
; LINE_WIDTH: 0.268736
G3 X92.513 Y105.505 I-1.335 J-.987 E.00357
; LINE_WIDTH: 0.230002
G1 X92.383 Y105.625 E.00225
; LINE_WIDTH: 0.19886
G1 X92.267 Y105.71 E.00154
; LINE_WIDTH: 0.165732
G1 X92.13 Y105.796 E.00138
; LINE_WIDTH: 0.130371
G1 X91.988 Y105.868 E.001
; LINE_WIDTH: 0.100355
G1 X91.852 Y105.919 E.00063
M204 S10000
G1 X88.142 Y105.918 F42000
; LINE_WIDTH: 0.0927897
G1 F1926
M204 S6000
G1 X88.064 Y105.889 E.00032
; LINE_WIDTH: 0.120778
G3 X87.895 Y105.811 I.881 J-2.118 E.00105
; LINE_WIDTH: 0.164095
G3 X87.729 Y105.708 I.792 J-1.47 E.00166
; LINE_WIDTH: 0.19969
G1 X87.605 Y105.613 E.00169
; LINE_WIDTH: 0.239829
G3 X87.483 Y105.501 I1.469 J-1.721 E.00222
G1 X87.435 Y105.449 E.00094
; LINE_WIDTH: 0.287208
G3 X87.248 Y105.201 I1.33 J-1.193 E.00513
; LINE_WIDTH: 0.33323
G3 X87.13 Y104.967 I3.158 J-1.749 E.0051
G1 X87.112 Y104.925 E.00089
; LINE_WIDTH: 0.381001
G3 X87.07 Y103.844 I1.65 J-.606 E.02485
G3 X87.749 Y102.789 I2.932 J1.142 E.02854
M204 S10000
G1 X87.243 Y103.16 F42000
; LINE_WIDTH: 0.297828
G1 F1926
M204 S6000
G2 X87.72 Y102.934 I-1.393 J-3.558 E.00907
; LINE_WIDTH: 0.258456
G1 X87.871 Y102.849 E.00254
; LINE_WIDTH: 0.216447
G3 X88.025 Y102.774 I1.843 J3.603 E.00203
G1 X88.045 Y102.766 E.00025
; LINE_WIDTH: 0.173099
G3 X88.261 Y102.693 I1.618 J4.455 E.00206
; LINE_WIDTH: 0.129192
G1 X88.42 Y102.66 E.001
; LINE_WIDTH: 0.0978564
G1 X88.555 Y102.643 E.00057
; CHANGE_LAYER
; Z_HEIGHT: 8.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X88.42 Y102.66 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/51
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.28 I-.941 J-.772 P1  F42000
G1 X88.064 Y103.093 Z8.28
G1 Z8.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1904
M204 S6000
G1 X88.108 Y103.069 E.00137
G3 X88.749 Y102.846 I.803 J1.281 E.01855
G1 X91.176 Y102.841 E.06575
G3 X91.123 Y105.861 I-.077 J1.509 E.12589
G1 X88.884 Y105.861 E.06065
G3 X87.938 Y103.192 I.027 J-1.512 E.09932
G1 X88.017 Y103.131 E.00271
M204 S250
G1 X88.298 Y103.419 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1904
M204 S5000
G1 X88.321 Y103.407 E.00064
G3 X88.789 Y103.245 I.588 J.942 E.01257
G1 X91.156 Y103.241 E.05949
G3 X91.108 Y105.46 I-.057 J1.109 E.08603
G1 X88.894 Y105.46 E.05565
G3 X88.191 Y103.502 I.014 J-1.111 E.06776
G1 X88.251 Y103.456 E.00188
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.321 Y103.407 E-.03237
G1 X88.523 Y103.306 E-.08586
G1 X88.789 Y103.245 E-.10386
G1 X90.205 Y103.243 E-.5379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.013 Y102.486 Z8.44 F42000
G1 Z8.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1904
M204 S6000
G1 X92.365 Y102.611 E.01011
G1 X92.634 Y102.611 E.00729
G3 X93.136 Y103.355 I-7.258 J5.433 E.02434
G3 X91.492 Y106.189 I-1.64 J.942 E.10735
G1 X88.508 Y106.189 E.08086
G3 X86.913 Y103.275 I-.007 J-1.89 E.10996
G1 X87.366 Y102.611 E.02179
M73 P94 R0
G1 X87.635 Y102.611 E.0073
G3 X88.507 Y102.411 I.904 J1.941 E.02441
G1 X91.593 Y102.413 E.08364
G3 X91.956 Y102.467 I-.127 J2.102 E.00995
; WIPE_START
G1 F10826.06
G1 X92.365 Y102.611 E-.16462
G1 X92.634 Y102.611 E-.10221
G1 X93.136 Y103.355 E-.3412
G1 X93.222 Y103.523 E-.07169
G1 X93.294 Y103.722 E-.08029
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z8.44 F42000
G1 Z8.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1904
M204 S5000
G3 X93.733 Y103.791 I-2.657 J2.153 E.03429
G3 X91.497 Y106.59 I-2.239 J.505 E.10334
G1 X88.503 Y106.59 E.07528
G3 X86.576 Y103.058 I-.002 J-2.291 E.12349
G1 X86.895 Y102.59 E.01423
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I.003 J-2.096 E.08261
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.004 E.08261
G1 X82.79 Y73.41 E.09019
G1 X82.79 Y73.79 E.00955
G1 X78.395 Y73.79 E.11049
G2 X77.49 Y74.695 I.01 J.915 E.03564
G1 X77.49 Y101.308 E.66907
G2 X78.392 Y102.21 I.933 J-.031 E.03533
G1 X87.56 Y102.21 E.23047
G3 X88.502 Y102.01 I.976 J2.277 E.02439
G1 X91.498 Y102.01 E.0753
G3 X92.441 Y102.21 I-.031 J2.471 E.02439
G1 X101.605 Y102.21 E.2304
G2 X102.51 Y101.305 I-.021 J-.926 E.03552
G1 X102.51 Y74.695 E.66903
G2 X101.605 Y73.79 I-.915 J.01 E.03563
G1 X97.21 Y73.79 E.1105
G1 X97.21 Y73.41 E.00955
G1 X100.797 Y73.41 E.09019
G3 X102.89 Y75.503 I-.003 J2.096 E.08261
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08261
G1 X93.165 Y102.59 E.19189
; WIPE_START
M73 P95 R0
G1 F11668.197
M204 S6000
G1 X93.424 Y103.058 E-.20319
G1 X93.538 Y103.255 E-.08667
G1 X93.671 Y103.571 E-.13004
G1 X93.733 Y103.791 E-.08674
G1 X93.789 Y104.243 E-.17326
G1 X93.779 Y104.453 E-.08009
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

G1 X92.887 Y104.924
G1 Z8.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.33352
G1 F1904
M204 S6000
G1 X92.837 Y105.044 E.00254
G3 X92.751 Y105.199 I-1.597 J-.78 E.00347
; LINE_WIDTH: 0.299479
G1 X92.665 Y105.328 E.00268
; LINE_WIDTH: 0.271179
G3 X92.532 Y105.486 I-1.436 J-1.074 E.00318
; LINE_WIDTH: 0.232718
G3 X92.383 Y105.625 I-1.697 J-1.67 E.00264
; LINE_WIDTH: 0.198938
G1 X92.268 Y105.71 E.00154
; LINE_WIDTH: 0.165495
G1 X92.13 Y105.796 E.00139
; LINE_WIDTH: 0.126485
G3 X91.946 Y105.885 I-1.038 J-1.908 E.00123
; LINE_WIDTH: 0.0939062
G1 X91.858 Y105.918 E.00036
M204 S10000
G1 X92.887 Y104.924 F42000
; LINE_WIDTH: 0.380905
G1 F1904
M204 S6000
G2 X92.93 Y103.844 I-1.563 J-.603 E.02485
G2 X92.251 Y102.789 I-2.743 J1.019 E.02858
M204 S10000
G1 X92.757 Y103.161 F42000
; LINE_WIDTH: 0.298402
G1 F1904
M204 S6000
G3 X92.28 Y102.934 I1.4 J-3.561 E.0091
; LINE_WIDTH: 0.257349
G1 X92.12 Y102.845 E.00266
; LINE_WIDTH: 0.208083
G2 X91.893 Y102.743 I-1.033 J1.998 E.00282
; LINE_WIDTH: 0.164914
G1 X91.741 Y102.694 E.00136
; LINE_WIDTH: 0.126224
G2 X91.541 Y102.653 I-.577 J2.297 E.00122
; LINE_WIDTH: 0.0942096
G1 X91.445 Y102.643 E.00038
M204 S10000
G1 X88.55 Y102.642 F42000
; LINE_WIDTH: 0.112669
G1 F1904
M204 S6000
G2 X88.302 Y102.683 I.533 J3.94 E.00128
; LINE_WIDTH: 0.159407
G2 X88.12 Y102.738 I1.01 J3.7 E.00155
; LINE_WIDTH: 0.199809
G2 X87.941 Y102.813 I.871 J2.333 E.0021
; LINE_WIDTH: 0.233267
G1 X87.836 Y102.87 E.00155
; LINE_WIDTH: 0.264794
G1 X87.718 Y102.935 E.00203
; LINE_WIDTH: 0.296052
G1 X87.232 Y103.175 E.00924
M204 S10000
G1 X87.749 Y102.789 F42000
; LINE_WIDTH: 0.381586
G1 F1904
M204 S6000
G2 X87.07 Y103.844 I2.251 J2.195 E.0286
G2 X87.092 Y104.868 I1.596 J.478 E.02355
; LINE_WIDTH: 0.337336
G2 X87.248 Y105.198 I1.56 J-.536 E.00724
; LINE_WIDTH: 0.299806
G1 X87.334 Y105.326 E.00267
; LINE_WIDTH: 0.271304
G2 X87.468 Y105.486 I1.431 J-1.067 E.00322
; LINE_WIDTH: 0.233995
G2 X87.608 Y105.617 I1.922 J-1.905 E.00249
; LINE_WIDTH: 0.195509
G2 X87.762 Y105.731 I1.079 J-1.297 E.00201
; LINE_WIDTH: 0.162663
G1 X87.87 Y105.795 E.00105
; LINE_WIDTH: 0.129997
G1 X88.016 Y105.869 E.00102
; LINE_WIDTH: 0.100081
G1 X88.148 Y105.919 E.00061
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X88.016 Y105.869 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/51
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.44 I1.209 J.139 P1  F42000
G1 X88.297 Y103.428 Z8.44
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2117
M204 S5000
G1 X88.419 Y103.352 E.00361
G3 X88.737 Y103.252 I.49 J.997 E.00841
G1 X91.155 Y103.241 E.0608
G3 X91.108 Y105.46 I-.057 J1.109 E.08602
G1 X88.895 Y105.46 E.05565
G3 X88.189 Y103.503 I.014 J-1.111 E.0677
G1 X88.248 Y103.462 E.0018
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.419 Y103.352 E-.07739
G1 X88.737 Y103.252 E-.12666
G1 X90.2 Y103.245 E-.55595
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.105 Y102.59 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F2117
M204 S5000
G3 X93.733 Y103.79 I-2.656 J2.153 E.03428
G3 X91.497 Y106.59 I-2.239 J.505 E.10334
G1 X88.503 Y106.59 E.07529
G3 X86.576 Y103.058 I-.001 J-2.291 E.12349
G1 X86.895 Y102.59 E.01423
G1 X79.203 Y102.59 E.19339
G3 X77.11 Y100.497 I.003 J-2.096 E.08262
G1 X77.11 Y75.503 E.62839
G3 X79.203 Y73.41 I2.096 J.003 E.08262
G1 X82.79 Y73.41 E.09018
M73 P96 R0
G1 X82.79 Y73.79 E.00955
G1 X78.395 Y73.79 E.11051
G2 X77.49 Y74.695 I.008 J.912 E.03564
G1 X77.49 Y101.308 E.6691
G2 X78.395 Y102.21 I.921 J-.019 E.0355
G1 X87.559 Y102.21 E.2304
G3 X88.502 Y102.01 I.975 J2.272 E.02439
G1 X91.498 Y102.01 E.07531
G3 X92.441 Y102.21 I-.032 J2.473 E.02439
G1 X101.605 Y102.21 E.23041
G2 X102.51 Y101.308 I-.021 J-.926 E.03546
G1 X102.51 Y74.695 E.66907
G2 X101.605 Y73.79 I-.912 J.007 E.03566
G1 X97.21 Y73.79 E.11051
G1 X97.21 Y73.41 E.00955
G1 X100.797 Y73.41 E.09018
G3 X102.89 Y75.503 I-.003 J2.096 E.08262
G1 X102.89 Y100.497 E.62839
G3 X100.797 Y102.59 I-2.096 J-.003 E.08262
G1 X93.165 Y102.59 E.19189
; WIPE_START
G1 F11668.197
M204 S6000
G1 X93.424 Y103.058 E-.20311
G1 X93.538 Y103.255 E-.08672
G1 X93.632 Y103.463 E-.08671
G1 X93.733 Y103.79 E-.1301
G1 X93.772 Y104.015 E-.0867
G1 X93.789 Y104.357 E-.13009
G1 X93.777 Y104.453 E-.03657
; WIPE_END
G1 E-.04 F1800
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

G1 X92.294 Y102.384
G1 Z8.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F2117
M204 S2000
G1 X93.418 Y103.508 E.03996
G1 X93.565 Y104.2
G1 X91.59 Y102.225 E.07023
G1 X91.044 Y102.225
G1 X93.531 Y104.712 E.08844
G1 X93.402 Y105.128
G1 X92.4 Y104.126 E.03563
G1 X92.383 Y104.655
G1 X93.206 Y105.478 E.02925
G1 X92.959 Y105.776
G1 X92.224 Y105.041 E.02614
G1 X91.975 Y105.338
G1 X92.657 Y106.019 E.02424
G1 X92.306 Y106.214
G1 X91.645 Y105.553 E.02353
G1 X91.207 Y105.661
G1 X91.883 Y106.336 E.02401
G1 X91.369 Y106.368
G1 X90.665 Y105.663 E.02505
G1 X90.122 Y105.666
G1 X90.826 Y106.37 E.02502
G1 X90.282 Y106.372
G1 X89.579 Y105.669 E.02499
G1 X89.036 Y105.671
G1 X89.739 Y106.374 E.02496
G1 X89.195 Y106.375
G1 X88.39 Y105.571 E.02861
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.195 Y106.375 E-.43245
G1 X89.739 Y106.374 E-.20652
G1 X89.513 Y106.148 E-.12103
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.326 Y103.052 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F2117
M204 S2000
G1 X90.498 Y102.224 E.02946
M73 P97 R0
G1 X89.952 Y102.223
G1 X90.759 Y103.031 E.0287
G1 X90.216 Y103.033
G1 X89.406 Y102.223 E.0288
G1 X88.86 Y102.222
G1 X89.673 Y103.035 E.02891
G1 X89.13 Y103.038
G1 X88.332 Y102.24 E.02836
G1 X87.869 Y102.322
G1 X88.614 Y103.068 E.02651
G1 X88.224 Y103.223
G1 X87.423 Y102.422 E.02846
G1 X87.109 Y102.653
G1 X87.919 Y103.463 E.02881
G1 X87.706 Y103.795
G1 X86.888 Y102.977 E.02908
G1 X86.675 Y103.31
G1 X87.589 Y104.224 E.03248
G1 X87.682 Y104.862
G1 X86.518 Y103.698 E.0414
G1 X86.429 Y104.154
G1 X88.652 Y106.377 E.07904
G1 X88.051 Y106.322
G1 X86.472 Y104.743 E.05615
; WIPE_START
G1 F11668.197
M204 S6000
G1 X87.886 Y106.157 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.472 Y104.054 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.142571
G1 F2117
M204 S6000
G1 X92.384 Y103.913 E.00117
; LINE_WIDTH: 0.125181
G1 X92.331 Y103.835 E.00056
; LINE_WIDTH: 0.0954754
G1 X92.277 Y103.758 E.00038
; WIPE_START
G1 F18000
G1 X92.331 Y103.835 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.375 Y105.183 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.0910011
G1 F2117
M204 S6000
G1 X93.292 Y105.291 E.0005
; WIPE_START
G1 F18000
G1 X93.375 Y105.183 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.597 Y106.17 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.0992108
G1 F2117
M204 S6000
G1 X87.475 Y106.076 E.00065
; LINE_WIDTH: 0.136383
G1 X87.353 Y105.982 E.00102
; LINE_WIDTH: 0.177642
G3 X86.917 Y105.562 I2.585 J-3.12 E.00566
; LINE_WIDTH: 0.163376
G1 X86.819 Y105.444 E.00129
; LINE_WIDTH: 0.134804
G1 X86.722 Y105.327 E.001
; LINE_WIDTH: 0.100563
G1 X86.639 Y105.211 E.00061
; WIPE_START
G1 F18000
G1 X86.722 Y105.327 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.327 Y105.634 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.199042
G1 F2117
M204 S6000
G1 X88.176 Y105.523 E.00201
; LINE_WIDTH: 0.164256
G1 X87.882 Y105.254 E.00337
G3 X87.698 Y105.037 I14.81 J-12.759 E.00241
; LINE_WIDTH: 0.203459
G1 X87.619 Y104.926 E.00151
; WIPE_START
G1 F18000
G1 X87.698 Y105.037 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.798 Y102.978 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.0971707
G1 F2117
M204 S6000
G2 X88.647 Y103.059 I.464 J1.043 E.0007
; WIPE_START
G1 F18000
G1 X88.798 Y102.978 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.69 Y103.173 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.0946564
G1 F2117
M204 S6000
G2 X91.407 Y102.972 I-2.14 J2.719 E.00137
; WIPE_START
G1 F18000
G1 X91.69 Y103.173 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.939 Y102.727 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.0965005
G1 F2117
M204 S6000
G1 X92.806 Y102.565 E.00085
; LINE_WIDTH: 0.128257
G1 X92.673 Y102.403 E.00129
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X92.806 Y102.565 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z8.7 F900 ; lower z a little
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

    G1 Z108.2 F600
M73 P98 R0
    G1 Z106.2

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


; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 15m 50s; total estimated time: 16m 9s
; total layer number: 100
; total filament length [mm] : 566.53
; total filament volume [cm^3] : 1362.65
; total filament weight [g] : 1.69
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 8.10
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
; initial_layer_print_height = 0.18
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
; Z_HEIGHT: 0.18
; LAYER_HEIGHT: 0.18
G1 E-.8 F1800
; layer num/total_layer_count: 1/100
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P1 R15
G1 X101.808 Y103.873 F42000
M204 S6000
G1 Z.4
G1 Z.18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.499998
G1 F3000
M204 S500
G1 X101.565 Y103.941 E.00854
G1 X78.526 Y103.941 E.77954
G3 X78.093 Y103.841 I.029 J-1.109 E.01513
G1 X77.858 Y103.624 E.01082
M73 P2 R15
G1 X77.759 Y103.265 E.01261
G1 X77.76 Y76.711 E.89847
G1 X77.862 Y76.378 E.01181
G1 X78.076 Y76.158 E.01036
G1 X78.435 Y76.059 E.01261
G1 X101.562 Y76.065 E.78251
G1 X101.726 Y76.085 E.00561
G1 X101.994 Y76.206 E.00995
G1 X102.189 Y76.483 E.01144
G1 X102.24 Y76.732 E.00863
G1 X102.241 Y103.174 E.89468
G3 X102.141 Y103.606 I-1.109 J-.029 E.01513
G1 X101.927 Y103.84 E.01072
G1 X101.866 Y103.857 E.00214
M204 S6000
G1 X101.909 Y104.334 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X101.588 Y104.403 E.0111
G1 X78.526 Y104.403 E.78032
G1 X78.029 Y104.335 E.01697
G1 X77.703 Y104.15 E.0127
G1 X77.457 Y103.865 E.01273
G3 X77.297 Y103.288 I1.722 J-.787 E.02034
G1 X77.299 Y76.793 E.8965
G1 X77.385 Y76.277 E.0177
G1 X77.548 Y76.004 E.01074
G1 X77.835 Y75.757 E.01282
G3 X78.412 Y75.597 I.788 J1.724 E.02034
G1 X101.562 Y75.604 E.7833
G1 X102.021 Y75.684 E.01578
G1 X102.295 Y75.848 E.01082
G1 X102.545 Y76.137 E.01293
G1 X102.669 Y76.438 E.01101
G1 X102.701 Y76.732 E.01002
G1 X102.703 Y103.174 E.89468
G1 X102.635 Y103.67 E.01696
G1 X102.45 Y103.997 E.01271
G1 X102.168 Y104.241 E.0126
G3 X101.967 Y104.32 I-.794 J-1.726 E.00732
; WIPE_START
G1 X101.588 Y104.403 E-.14741
G1 X99.976 Y104.403 E-.61259
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.843 Y98.754 Z.58 F42000
G1 X79.816 Y82.22 Z.58
G1 Z.18
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X79.535 Y82.145 E.00982
G3 X78.881 Y81.262 I.584 J-1.117 E.03851
G1 X78.867 Y80.988 E.00928
G1 X78.991 Y80.526 E.01616
G1 X79.286 Y80.149 E.01618
G1 X79.703 Y79.917 E.01617
G1 X80.058 Y79.854 E.01219
G1 X80.54 Y79.949 E.01663
G1 X80.902 Y80.2 E.01489
G1 X81.107 Y80.451 E.01099
G1 X81.247 Y80.776 E.01197
G1 X81.272 Y81.214 E.01485
G1 X81.111 Y81.685 E.01682
G1 X80.799 Y82.033 E.01581
G1 X80.357 Y82.242 E.01655
G1 X79.997 Y82.268 E.01221
G1 X79.874 Y82.235 E.00432
M204 S6000
G1 X79.92 Y81.792 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X79.895 Y81.791 E.00084
G1 X79.615 Y81.654 E.01056
G1 X79.378 Y81.347 E.01311
G1 X79.328 Y81.148 E.00696
G1 X79.354 Y80.853 E.01001
G1 X79.493 Y80.591 E.01002
G1 X79.722 Y80.404 E.01002
G1 X80.058 Y80.315 E.01175
G1 X80.399 Y80.398 E.01188
G1 X80.692 Y80.651 E.01311
G1 X80.804 Y80.925 E.01002
G1 X80.8 Y81.221 E.01002
G1 X80.682 Y81.493 E.01002
G1 X80.468 Y81.697 E.01001
G1 X80.192 Y81.802 E.01001
G1 X79.98 Y81.794 E.00716
; WIPE_START
G1 X79.895 Y81.791 E-.0322
G1 X79.615 Y81.654 E-.11856
G1 X79.378 Y81.347 E-.14726
G1 X79.328 Y81.148 E-.07821
G1 X79.354 Y80.853 E-.11244
G1 X79.493 Y80.591 E-.11257
G1 X79.722 Y80.404 E-.11249
G1 X79.84 Y80.373 E-.04627
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.58 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X102.055 Y77.48
G1 Z.18
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.502008
G1 F6300
M204 S500
G1 X101.032 Y76.457 E.04916
G1 X100.377 Y76.457 E.02228
G1 X101.848 Y77.928 E.07068
G1 X101.848 Y78.583 E.02227
G1 X99.721 Y76.457 E.10219
G1 X99.066 Y76.456 E.02228
G1 X101.848 Y79.238 E.13369
G1 X101.848 Y79.894 E.02227
G1 X98.41 Y76.456 E.1652
G1 X97.755 Y76.456 E.02228
G1 X101.848 Y80.549 E.1967
G1 X101.848 Y81.204 E.02227
G1 X97.099 Y76.456 E.22821
G1 X96.444 Y76.456 E.02228
G1 X101.848 Y81.86 E.25971
G1 X101.848 Y82.515 E.02227
G1 X95.788 Y76.456 E.29122
G1 X95.133 Y76.455 E.02228
G1 X101.848 Y83.17 E.32272
G1 X101.848 Y83.826 E.02227
G1 X94.477 Y76.455 E.35423
G1 X93.822 Y76.455 E.02228
G1 X101.848 Y84.481 E.38574
G1 X101.848 Y85.136 E.02227
G1 X93.166 Y76.455 E.41724
G1 X92.511 Y76.455 E.02228
G1 X101.848 Y85.792 E.44875
G1 X101.848 Y86.447 E.02227
G1 X91.855 Y76.454 E.48025
G1 X91.2 Y76.454 E.02228
G1 X101.848 Y87.103 E.51176
G1 X101.848 Y87.758 E.02227
G1 X90.544 Y76.454 E.54326
G1 X89.889 Y76.454 E.02228
G1 X101.848 Y88.413 E.57477
M73 P3 R15
G1 X101.848 Y89.069 E.02227
G1 X89.233 Y76.454 E.60627
G1 X88.578 Y76.454 E.02228
G1 X101.848 Y89.724 E.63778
G1 X101.848 Y90.379 E.02227
G1 X87.922 Y76.453 E.66928
G1 X87.267 Y76.453 E.02228
G1 X101.848 Y91.035 E.70079
G1 X101.849 Y91.69 E.02227
G1 X86.611 Y76.453 E.73229
G1 X85.956 Y76.453 E.02228
G1 X101.849 Y92.345 E.7638
G1 X101.849 Y93.001 E.02227
G1 X85.3 Y76.453 E.7953
G1 X84.645 Y76.453 E.02228
G1 X101.849 Y93.656 E.82681
G1 X101.849 Y94.312 E.02227
G1 X83.989 Y76.452 E.85831
G1 X83.334 Y76.452 E.02228
G1 X101.849 Y94.967 E.88982
G1 X101.849 Y95.622 E.02227
G1 X82.678 Y76.452 E.92133
G1 X82.023 Y76.452 E.02228
G1 X101.849 Y96.278 E.95283
G1 X101.849 Y96.933 E.02227
G1 X81.367 Y76.452 E.98434
G1 X80.712 Y76.451 E.02228
G1 X101.849 Y97.588 E1.01584
G1 X101.849 Y98.244 E.02227
G1 X80.056 Y76.451 E1.04735
G1 X79.401 Y76.451 E.02228
G1 X101.849 Y98.899 E1.07885
G1 X101.849 Y99.554 E.02227
G1 X78.746 Y76.451 E1.11036
G2 X78.281 Y76.5 I-.14 J.905 E.01606
G2 X78.206 Y76.567 I.065 J.147 E.00347
G1 X101.849 Y100.21 E1.13628
G1 X101.849 Y100.865 E.02227
G1 X78.152 Y77.168 E1.13887
G1 X78.152 Y77.824 E.02227
G1 X79.819 Y79.49 E.08009
G2 X79.332 Y79.659 I.154 J1.231 E.01763
G1 X78.152 Y78.479 E.0567
G1 X78.152 Y79.134 E.02227
M73 P4 R15
G1 X78.955 Y79.936 E.03856
G2 X78.667 Y80.305 I.766 J.894 E.01597
G1 X78.152 Y79.789 E.02476
G1 X78.152 Y80.445 E.02227
G1 X78.688 Y80.981 E.02576
; WIPE_START
G1 X78.152 Y80.445 E-.28806
G1 X78.152 Y79.789 E-.24901
G1 X78.567 Y80.204 E-.22294
; WIPE_END
G1 E-.03999 F1800
M204 S6000
G1 X81.453 Y81.124 Z.58 F42000
G1 Z.18
G1 E.8 F1800
G1 F6300
M204 S500
G1 X101.849 Y101.52 E.98024
G1 X101.849 Y102.176 E.02227
G1 X81.486 Y81.813 E.97863
G3 X81.202 Y82.184 I-1.118 J-.563 E.01598
G1 X101.849 Y102.831 E.99231
G3 X101.819 Y103.379 I-1.593 J.188 E.01873
G1 X101.791 Y103.428 E.00194
G1 X80.828 Y82.465 E1.00749
G3 X80.345 Y82.638 I-.701 J-1.197 E.01752
G1 X101.257 Y103.549 E1.005
G1 X100.601 Y103.549 E.02227
G1 X79.653 Y82.601 E1.00676
G3 X79.374 Y82.503 I.102 J-.739 E.01013
G1 X78.988 Y82.233 E.01601
G1 X78.776 Y81.993 E.01087
G1 X78.556 Y81.576 E.01605
G1 X78.532 Y81.48 E.00334
G1 X78.152 Y81.1 E.01827
G1 X78.152 Y81.755 E.02227
G1 X99.946 Y103.549 E1.04742
G1 X99.291 Y103.549 E.02227
G1 X78.152 Y82.411 E1.01592
G1 X78.152 Y83.066 E.02227
G1 X98.635 Y103.549 E.98443
G1 X97.98 Y103.549 E.02227
G1 X78.152 Y83.721 E.95294
G1 X78.152 Y84.376 E.02227
G1 X97.325 Y103.549 E.92145
G1 X96.669 Y103.549 E.02227
G1 X78.152 Y85.032 E.88995
G1 X78.152 Y85.687 E.02227
G1 X96.014 Y103.549 E.85846
G1 X95.359 Y103.549 E.02227
G1 X78.152 Y86.342 E.82697
G1 X78.152 Y86.998 E.02227
G1 X94.703 Y103.549 E.79547
G1 X94.048 Y103.549 E.02227
G1 X78.152 Y87.653 E.76398
G1 X78.152 Y88.308 E.02227
G1 X93.393 Y103.549 E.73249
G1 X92.737 Y103.549 E.02227
G1 X78.152 Y88.963 E.701
G1 X78.152 Y89.619 E.02227
G1 X92.082 Y103.549 E.6695
G1 X91.427 Y103.549 E.02227
G1 X78.152 Y90.274 E.63801
G1 X78.152 Y90.929 E.02227
M73 P5 R15
G1 X90.772 Y103.549 E.60652
G1 X90.116 Y103.549 E.02227
G1 X78.152 Y91.585 E.57502
G1 X78.151 Y92.24 E.02227
G1 X89.461 Y103.549 E.54353
G1 X88.806 Y103.549 E.02227
G1 X78.151 Y92.895 E.51204
G1 X78.151 Y93.55 E.02227
G1 X88.15 Y103.549 E.48055
G1 X87.495 Y103.549 E.02227
G1 X78.151 Y94.206 E.44905
G1 X78.151 Y94.861 E.02227
G1 X86.84 Y103.549 E.41756
G1 X86.184 Y103.549 E.02227
G1 X78.151 Y95.516 E.38607
G1 X78.151 Y96.171 E.02227
G1 X85.529 Y103.549 E.35458
G1 X84.874 Y103.549 E.02227
G1 X78.151 Y96.827 E.32308
G1 X78.151 Y97.482 E.02227
G1 X84.218 Y103.549 E.29159
G1 X83.563 Y103.549 E.02227
G1 X78.151 Y98.137 E.2601
G1 X78.151 Y98.793 E.02227
G1 X82.908 Y103.549 E.2286
G1 X82.252 Y103.549 E.02227
G1 X78.151 Y99.448 E.19711
G1 X78.151 Y100.103 E.02227
G1 X81.597 Y103.549 E.16562
G1 X80.942 Y103.549 E.02227
G1 X78.151 Y100.758 E.13413
G1 X78.151 Y101.414 E.02227
G1 X80.286 Y103.549 E.10263
G1 X79.631 Y103.549 E.02227
G1 X78.151 Y102.069 E.07114
G1 X78.151 Y102.724 E.02227
G1 X79.183 Y103.757 E.04963
; CHANGE_LAYER
; Z_HEIGHT: 0.26
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F6300
G1 X78.151 Y102.724 E-.5549
G1 X78.151 Y102.185 E-.2051
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/100
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.58 I-.101 J1.213 P1  F42000
G1 X101.533 Y104.129 Z.58
G1 Z.26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F18000
M204 S6000
G1 X78.479 Y104.128 E.32524
G1 X78.123 Y104.074 E.00508
G1 X77.833 Y103.887 E.00487
G1 X77.625 Y103.573 E.00531
G1 X77.573 Y103.31 E.00378
G1 X77.573 Y77.31 E.36681
G3 X77.626 Y76.423 I3.004 J-.265 E.01258
G1 X77.816 Y76.13 E.00493
G1 X78.107 Y75.931 E.00498
G1 X78.415 Y75.871 E.00443
G1 X101.513 Y75.872 E.32586
G1 X101.836 Y75.911 E.00458
G1 X102.147 Y76.098 E.00513
G1 X102.352 Y76.366 E.00476
G1 X102.428 Y76.678 E.00453
G1 X102.428 Y103.221 E.37447
G1 X102.373 Y103.585 E.00519
G1 X102.225 Y103.828 E.00402
G1 X101.949 Y104.046 E.00496
G1 X101.592 Y104.125 E.00515
M204 S250
G1 X101.654 Y104.536 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2250
M204 S5000
G1 X101.591 Y104.547 E.00084
G1 X78.479 Y104.545 E.30346
G1 X77.981 Y104.472 E.00661
G1 X77.657 Y104.299 E.00481
G1 X77.421 Y104.068 E.00434
G1 X77.228 Y103.718 E.00525
G1 X77.155 Y103.351 E.00491
G1 X77.155 Y77.351 E.34139
G3 X77.228 Y76.281 I3.683 J-.286 E.01414
G1 X77.401 Y75.957 E.00481
G1 X77.633 Y75.72 E.00436
G1 X77.953 Y75.538 E.00483
G1 X78.405 Y75.453 E.00604
G1 X101.513 Y75.454 E.30341
G1 X101.96 Y75.508 E.00591
G1 X102.292 Y75.665 E.00481
G1 X102.563 Y75.911 E.00481
G1 X102.738 Y76.195 E.00438
G1 X102.845 Y76.678 E.0065
G1 X102.845 Y102.678 E.34139
G3 X102.824 Y103.417 I-3.358 J.271 E.00972
G1 F2700
G1 X102.813 Y103.514 E.00128
G1 X102.717 Y103.813 E.00412
G1 F2250
G1 X102.7 Y103.863 E.0007
G1 X102.438 Y104.221 E.00582
G1 X102.131 Y104.426 E.00485
G1 X102.007 Y104.465 E.00171
G1 F2700
G3 X101.877 Y104.495 I-.184 J-.502 E.00177
G1 F2250
G1 X101.713 Y104.525 E.00218
; WIPE_START
M204 S6000
G1 X101.591 Y104.547 E-.04709
G1 X99.715 Y104.547 E-.71291
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.658 Y98.83 Z.66 F42000
G1 X79.908 Y82.155 Z.66
G1 Z.26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
M73 P6 R15
G1 F18000
M204 S6000
G1 X79.755 Y82.142 E.00216
G1 X79.362 Y81.936 E.00628
G1 X79.079 Y81.592 E.00627
G1 X78.962 Y81.273 E.0048
G1 X78.952 Y80.964 E.00436
G1 X79.079 Y80.538 E.00627
G1 X79.362 Y80.194 E.00627
G1 X79.612 Y80.046 E.0041
G1 X80.057 Y79.937 E.00647
G1 X80.364 Y79.982 E.00436
G1 X80.761 Y80.181 E.00627
G3 X81.112 Y80.634 I-.745 J.94 E.00817
G1 X81.197 Y81.035 E.00578
G1 X81.113 Y81.493 E.00657
G1 X80.824 Y81.896 E.00699
G3 X80.336 Y82.161 I-.801 J-.892 E.00791
G1 X80.199 Y82.18 E.00196
G1 X79.968 Y82.16 E.00327
M204 S250
G1 X79.938 Y81.754 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.908 Y81.753 E.00039
G1 X79.653 Y81.636 E.00368
G1 X79.464 Y81.43 E.00368
G1 X79.37 Y81.166 E.00368
G1 X79.386 Y80.886 E.00368
G1 X79.509 Y80.634 E.00368
G1 X79.735 Y80.445 E.00386
G1 X80.092 Y80.358 E.00483
G1 X80.365 Y80.422 E.00368
G1 X80.592 Y80.587 E.00368
G1 X80.736 Y80.827 E.00368
G1 X80.776 Y81.105 E.00368
G1 X80.696 Y81.388 E.00386
G1 X80.45 Y81.662 E.00483
G1 X80.188 Y81.762 E.00368
G1 X79.998 Y81.756 E.0025
; WIPE_START
M204 S6000
G1 X79.908 Y81.753 E-.0341
G1 X79.653 Y81.636 E-.10651
G1 X79.464 Y81.43 E-.10643
G1 X79.37 Y81.166 E-.10655
G1 X79.386 Y80.886 E-.10653
G1 X79.509 Y80.634 E-.10644
G1 X79.735 Y80.445 E-.11183
G1 X79.943 Y80.395 E-.0816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.66 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X77.744 Y80.723
G1 Z.26
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423268
G1 F18000
M204 S6000
G1 X82.243 Y76.224 E.08423
G1 X81.669 Y76.224 E.0076
G1 X77.925 Y79.968 E.07008
G1 X77.925 Y79.393 E.0076
G1 X81.095 Y76.224 E.05933
G1 X80.521 Y76.224 E.0076
G1 X77.925 Y78.819 E.04858
G1 X77.925 Y78.245 E.0076
G1 X79.946 Y76.224 E.03783
G1 X79.372 Y76.224 E.0076
G1 X77.925 Y77.67 E.02708
G1 X77.925 Y77.096 E.0076
G1 X78.798 Y76.224 E.01633
G2 X78.236 Y76.264 I-.182 J1.403 E.00751
G1 X78.114 Y76.333 E.00186
G1 X77.745 Y76.702 E.00691
M204 S10000
G1 X77.744 Y84.743 F42000
G1 F18000
M204 S6000
G1 X79.956 Y82.532 E.0414
G3 X79.494 Y82.419 I.048 J-1.198 E.00633
G1 X77.925 Y83.988 E.02937
G1 X77.925 Y83.413 E.0076
G1 X79.135 Y82.204 E.02264
G3 X78.866 Y81.898 I.971 J-1.125 E.0054
G1 X77.925 Y82.839 E.01761
G1 X77.925 Y82.265 E.0076
G1 X78.676 Y81.514 E.01406
G1 X78.613 Y81.336 E.0025
G1 X78.601 Y81.015 E.00426
G1 X77.925 Y81.691 E.01265
G1 X77.925 Y81.116 E.0076
G1 X82.818 Y76.224 E.09158
G1 X83.392 Y76.224 E.0076
G1 X80.03 Y79.586 E.06294
G1 X80.436 Y79.636 E.00542
G1 X80.521 Y79.669 E.00121
G1 X83.966 Y76.224 E.06449
G1 X84.541 Y76.224 E.0076
G1 X80.909 Y79.856 E.06799
G3 X81.204 Y80.135 I-.567 J.896 E.00541
G1 X85.115 Y76.224 E.07321
G1 X85.689 Y76.224 E.0076
G1 X81.43 Y80.483 E.07973
G1 X81.537 Y80.95 E.00634
G1 X86.264 Y76.224 E.08847
G1 X86.838 Y76.224 E.0076
G1 X77.925 Y85.136 E.16684
G1 X77.925 Y85.711 E.0076
G1 X87.412 Y76.224 E.17759
G1 X87.986 Y76.224 E.0076
G1 X77.925 Y86.285 E.18834
G1 X77.925 Y86.859 E.0076
G1 X88.561 Y76.224 E.19909
G1 X89.135 Y76.224 E.0076
G1 X77.925 Y87.434 E.20984
G1 X77.925 Y88.008 E.0076
G1 X89.709 Y76.224 E.22059
G1 X90.284 Y76.224 E.0076
G1 X77.925 Y88.582 E.23134
G1 X77.925 Y89.157 E.0076
G1 X90.858 Y76.224 E.24209
G1 X91.432 Y76.224 E.0076
G1 X77.925 Y89.731 E.25284
G1 X77.925 Y90.305 E.0076
G1 X92.006 Y76.224 E.26359
G1 X92.581 Y76.224 E.0076
G1 X77.925 Y90.879 E.27434
G1 X77.925 Y91.454 E.0076
G1 X93.155 Y76.224 E.28509
G1 X93.729 Y76.224 E.0076
G1 X77.925 Y92.028 E.29584
G1 X77.925 Y92.602 E.0076
G1 X94.304 Y76.224 E.30659
G1 X94.878 Y76.224 E.0076
G1 X77.925 Y93.177 E.31734
G1 X77.925 Y93.751 E.0076
G1 X95.452 Y76.224 E.3281
G1 X96.026 Y76.224 E.0076
G1 X77.925 Y94.325 E.33885
G1 X77.925 Y94.9 E.0076
G1 X96.601 Y76.224 E.3496
G1 X97.175 Y76.224 E.0076
G1 X77.925 Y95.474 E.36035
G1 X77.925 Y96.048 E.0076
G1 X97.749 Y76.224 E.3711
G1 X98.324 Y76.224 E.0076
G1 X77.925 Y96.623 E.38185
G1 X77.925 Y97.197 E.0076
G1 X98.898 Y76.224 E.3926
G1 X99.472 Y76.224 E.0076
G1 X77.925 Y97.771 E.40335
G1 X77.925 Y98.346 E.0076
G1 X100.047 Y76.224 E.4141
G1 X100.621 Y76.224 E.0076
G1 X77.925 Y98.92 E.42485
G1 X77.925 Y99.494 E.0076
G1 X101.195 Y76.224 E.4356
G3 X101.738 Y76.256 I.17 J1.781 E.00723
G1 X77.925 Y100.068 E.44577
G1 X77.925 Y100.643 E.0076
G1 X102.033 Y76.535 E.45129
G1 X102.075 Y76.688 E.0021
G1 X102.075 Y77.068 E.00503
G1 X77.925 Y101.217 E.45206
G1 X77.925 Y101.791 E.0076
G1 X102.075 Y77.642 E.45206
G1 X102.075 Y78.217 E.0076
G1 X77.925 Y102.366 E.45206
G1 X77.925 Y102.94 E.0076
G1 X102.075 Y78.791 E.45206
G1 X102.075 Y79.365 E.0076
G1 X77.971 Y103.469 E.45122
G2 X78.27 Y103.744 I.404 J-.14 E.00561
G1 X102.075 Y79.939 E.44561
G1 X102.075 Y80.514 E.0076
G1 X78.814 Y103.775 E.43544
G1 X79.388 Y103.775 E.0076
G1 X102.075 Y81.088 E.42469
G1 X102.075 Y81.662 E.0076
G1 X79.962 Y103.775 E.41394
G1 X80.537 Y103.775 E.0076
G1 X102.075 Y82.237 E.40319
G1 X102.075 Y82.811 E.0076
G1 X81.111 Y103.775 E.39244
G1 X81.685 Y103.775 E.0076
G1 X102.075 Y83.385 E.38168
G1 X102.075 Y83.96 E.0076
G1 X82.259 Y103.775 E.37093
G1 X82.834 Y103.775 E.0076
G1 X102.075 Y84.534 E.36018
G1 X102.075 Y85.108 E.0076
G1 X83.408 Y103.775 E.34943
G1 X83.982 Y103.775 E.0076
G1 X102.075 Y85.683 E.33868
G1 X102.075 Y86.257 E.0076
G1 X84.556 Y103.775 E.32793
G1 X85.131 Y103.775 E.0076
G1 X102.075 Y86.831 E.31718
G1 X102.075 Y87.406 E.0076
G1 X85.705 Y103.775 E.30643
G1 X86.279 Y103.775 E.0076
G1 X102.075 Y87.98 E.29568
G1 X102.075 Y88.554 E.0076
G1 X86.854 Y103.775 E.28493
G1 X87.428 Y103.775 E.0076
G1 X102.075 Y89.128 E.27418
G1 X102.075 Y89.703 E.0076
G1 X88.002 Y103.775 E.26343
G1 X88.576 Y103.775 E.0076
G1 X102.075 Y90.277 E.25268
G1 X102.075 Y90.851 E.0076
G1 X89.151 Y103.775 E.24193
G1 X89.725 Y103.775 E.0076
M73 P7 R15
G1 X102.075 Y91.426 E.23118
G1 X102.075 Y92 E.0076
G1 X90.299 Y103.776 E.22043
G1 X90.873 Y103.776 E.0076
G1 X102.075 Y92.574 E.20968
G1 X102.075 Y93.149 E.0076
G1 X91.448 Y103.776 E.19893
G1 X92.022 Y103.776 E.0076
G1 X102.075 Y93.723 E.18818
G1 X102.075 Y94.297 E.0076
G1 X92.596 Y103.776 E.17743
G1 X93.17 Y103.776 E.0076
G1 X102.075 Y94.872 E.16668
G1 X102.075 Y95.446 E.0076
G1 X93.745 Y103.776 E.15593
G1 X94.319 Y103.776 E.0076
G1 X102.075 Y96.02 E.14518
G1 X102.075 Y96.595 E.0076
G1 X94.893 Y103.776 E.13443
G1 X95.468 Y103.776 E.0076
G1 X102.075 Y97.169 E.12368
G1 X102.075 Y97.743 E.0076
G1 X96.042 Y103.776 E.11293
G1 X96.616 Y103.776 E.0076
G1 X102.075 Y98.317 E.10218
G1 X102.075 Y98.892 E.0076
G1 X97.19 Y103.776 E.09143
G1 X97.765 Y103.776 E.0076
G1 X102.075 Y99.466 E.08068
G1 X102.075 Y100.04 E.0076
G1 X98.339 Y103.776 E.06993
G1 X98.913 Y103.776 E.0076
G1 X102.075 Y100.615 E.05918
G1 X102.075 Y101.189 E.0076
G1 X99.487 Y103.776 E.04843
G1 X100.062 Y103.776 E.0076
G1 X102.075 Y101.763 E.03768
G1 X102.075 Y102.338 E.0076
G1 X100.636 Y103.776 E.02693
G1 X101.21 Y103.776 E.0076
G1 X102.075 Y102.912 E.01618
G1 X102.075 Y103.275 E.00481
G3 X101.99 Y103.561 I-.558 J-.011 E.00399
G3 X101.607 Y103.954 I-2.861 J-2.402 E.00727
; CHANGE_LAYER
; Z_HEIGHT: 0.34
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X101.99 Y103.561 E-.20863
G1 X102.036 Y103.469 E-.03904
G1 X102.075 Y103.275 E-.07494
G1 X102.075 Y102.912 E-.1381
G1 X101.518 Y103.469 E-.29929
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/100
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.66 I-1.217 J.018 P1  F42000
G1 X101.528 Y104.159 Z.66
G1 Z.34
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F15523
M204 S6000
G1 X78.497 Y104.159 E.32492
M73 P7 R14
G1 X78.317 Y104.144 E.00255
G1 X77.969 Y104.035 E.00514
G3 X77.625 Y103.658 I.441 J-.747 E.00732
G1 X77.541 Y103.269 E.00561
G1 X77.541 Y76.738 E.3743
G1 X77.614 Y76.391 E.00501
G1 X77.792 Y76.101 E.00479
G1 X78.116 Y75.906 E.00534
G1 X78.431 Y75.841 E.00453
G1 X101.532 Y75.842 E.32592
G1 X101.842 Y75.881 E.0044
G1 X102.167 Y76.076 E.00535
G1 X102.388 Y76.373 E.00522
G1 X102.458 Y76.679 E.00444
G1 X102.459 Y103.262 E.37503
G1 X102.386 Y103.609 E.00501
G1 X102.203 Y103.906 E.00492
G1 X101.918 Y104.08 E.00472
G1 X101.587 Y104.154 E.00477
M204 S250
G1 X101.528 Y104.577 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F7800
M204 S5000
G1 X78.497 Y104.577 E.3024
G1 X78.104 Y104.539 E.00519
G1 F9900
G1 X77.753 Y104.398 E.00496
G1 X77.455 Y104.156 E.00504
G1 X77.381 Y104.046 E.00174
G1 F12000
G3 X77.245 Y103.787 I.917 J-.65 E.00386
G1 F9900
G1 X77.192 Y103.68 E.00157
G1 X77.134 Y103.35 E.00439
G1 F7800
G1 X77.123 Y77.29 E.34218
G3 X77.161 Y76.404 I4.558 J-.246 E.01166
G1 F9900
G1 X77.302 Y76.051 E.005
G1 X77.535 Y75.771 E.00477
G1 F7800
G1 X77.813 Y75.57 E.00451
G1 F9802.62
G1 X77.958 Y75.518 E.00203
G1 F10749.808
G3 X78.089 Y75.486 I.174 J.416 E.00178
G1 F9900
G1 X78.37 Y75.431 E.00376
G1 F7800
G1 X101.532 Y75.424 E.30412
G1 X101.895 Y75.47 E.0048
G1 F8733.128
G1 X101.968 Y75.479 E.00097
G1 F9900
G1 X102.308 Y75.64 E.00494
G1 X102.586 Y75.891 E.00492
G1 X102.683 Y76.051 E.00246
G1 F7800
G1 X102.775 Y76.205 E.00235
G1 X102.875 Y76.679 E.00637
G1 X102.877 Y102.679 E.34139
G3 X102.874 Y103.238 I-3.626 J.262 E.00735
G1 F9900
G3 X102.814 Y103.607 I-1.064 J.014 E.00493
G1 F12000
G3 X102.633 Y104.012 I-.839 J-.132 E.00588
G1 F9900
G1 X102.589 Y104.09 E.00118
G1 X102.272 Y104.382 E.00565
G1 F7800
G1 X102.094 Y104.46 E.00256
G1 F9331.82
G3 X101.869 Y104.542 I-.259 J-.357 E.00318
G1 F7800
G1 X101.588 Y104.577 E.00372
; WIPE_START
M204 S6000
G1 X99.588 Y104.577 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.551 Y98.843 Z.74 F42000
G1 X79.892 Y82.157 Z.74
G1 Z.34
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F15523
M204 S6000
G1 X79.567 Y82.069 E.00475
G1 X79.217 Y81.795 E.00627
G1 X79.001 Y81.406 E.00627
G3 X79.336 Y80.216 I1.144 J-.32 E.01834
G1 X79.724 Y79.998 E.00628
G1 X80.058 Y79.937 E.00479
G1 X80.363 Y79.982 E.00435
G1 X80.761 Y80.181 E.00628
G3 X81.112 Y80.635 I-.745 J.94 E.00818
G1 X81.197 Y81.035 E.00578
G1 X81.114 Y81.492 E.00656
G1 X80.832 Y81.896 E.00695
G1 X80.466 Y82.112 E.00599
G3 X79.997 Y82.185 I-.394 J-.99 E.00675
G1 X79.95 Y82.172 E.00068
M204 S250
G1 X79.987 Y81.767 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.653 Y81.636 E.0047
G1 X79.464 Y81.43 E.00368
G1 X79.37 Y81.166 E.00368
G1 X79.392 Y80.872 E.00387
G1 X79.579 Y80.556 E.00483
G1 X79.816 Y80.405 E.00369
G1 X80.092 Y80.358 E.00368
G1 X80.365 Y80.422 E.00367
G1 X80.592 Y80.587 E.00368
G1 X80.736 Y80.828 E.00368
G1 X80.776 Y81.105 E.00368
G1 X80.702 Y81.38 E.00374
G1 X80.498 Y81.626 E.00419
G1 X80.188 Y81.762 E.00445
G1 X80.047 Y81.766 E.00186
; WIPE_START
M204 S6000
G1 X79.653 Y81.636 E-.15738
G1 X79.464 Y81.43 E-.1064
G1 X79.37 Y81.166 E-.10647
G1 X79.392 Y80.872 E-.11187
G1 X79.579 Y80.556 E-.13977
G1 X79.816 Y80.405 E-.10667
G1 X79.898 Y80.391 E-.03143
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.74 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X77.712 Y77.426
G1 Z.34
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423928
G1 F15523
M204 S6000
G1 X79.886 Y79.6 E.04076
G2 X79.449 Y79.739 I.116 J1.119 E.00612
G1 X77.894 Y78.183 E.02917
G1 X77.894 Y78.758 E.00763
G1 X79.097 Y79.962 E.02257
G1 X78.833 Y80.273 E.00541
G1 X77.894 Y79.333 E.01762
G1 X77.894 Y79.908 E.00763
G1 X78.664 Y80.679 E.01445
G2 X78.608 Y81.198 I.898 J.36 E.00701
G1 X77.893 Y80.484 E.01339
G1 X77.893 Y81.059 E.00763
G1 X100.641 Y103.807 E.42652
G1 X101.216 Y103.807 E.00763
G1 X79.938 Y82.529 E.39896
G2 X80.452 Y82.496 I.151 J-1.685 E.00685
G1 X80.473 Y82.488 E.0003
G1 X101.752 Y103.767 E.39899
G2 X102.052 Y103.492 I-.102 J-.413 E.00563
G1 X80.861 Y82.301 E.39733
G2 X81.173 Y82.037 I-.502 J-.907 E.00545
G1 X102.107 Y102.971 E.39251
G1 X102.106 Y102.396 E.00763
G1 X81.405 Y81.695 E.38815
G1 X81.443 Y81.621 E.0011
G1 X81.533 Y81.247 E.00509
G1 X102.106 Y101.82 E.38575
G1 X102.106 Y101.245 E.00763
G1 X77.894 Y77.032 E.45399
G3 X77.947 Y76.51 I1.161 J-.145 E.00701
G1 X102.106 Y100.67 E.45299
G1 X102.106 Y100.095 E.00763
G1 X78.246 Y76.234 E.44738
G3 X78.781 Y76.194 I.368 J1.306 E.00716
G1 X102.106 Y99.519 E.43736
G1 X102.106 Y98.944 E.00763
G1 X79.356 Y76.194 E.42657
G1 X79.931 Y76.194 E.00763
G1 X102.106 Y98.369 E.41578
G1 X102.106 Y97.793 E.00763
G1 X80.506 Y76.194 E.405
G1 X81.082 Y76.194 E.00763
G1 X102.106 Y97.218 E.39421
G1 X102.106 Y96.643 E.00763
G1 X81.657 Y76.194 E.38342
G1 X82.232 Y76.194 E.00763
G1 X102.106 Y96.068 E.37264
G1 X102.106 Y95.492 E.00763
G1 X82.808 Y76.194 E.36185
G1 X83.383 Y76.194 E.00763
G1 X102.106 Y94.917 E.35106
G1 X102.106 Y94.342 E.00763
G1 X83.958 Y76.194 E.34027
G1 X84.533 Y76.194 E.00763
G1 X102.106 Y93.766 E.32949
G1 X102.106 Y93.191 E.00763
G1 X85.109 Y76.194 E.3187
G1 X85.684 Y76.194 E.00763
G1 X102.106 Y92.616 E.30791
G1 X102.106 Y92.041 E.00763
G1 X86.259 Y76.194 E.29712
G1 X86.835 Y76.194 E.00763
G1 X102.106 Y91.465 E.28634
G1 X102.106 Y90.89 E.00763
G1 X87.41 Y76.194 E.27555
G1 X87.985 Y76.194 E.00763
G1 X102.106 Y90.315 E.26476
G1 X102.106 Y89.739 E.00763
G1 X88.56 Y76.194 E.25397
G1 X89.136 Y76.194 E.00763
G1 X102.106 Y89.164 E.24319
G1 X102.106 Y88.589 E.00763
G1 X89.711 Y76.194 E.2324
G1 X90.286 Y76.194 E.00763
G1 X102.105 Y88.014 E.22161
M73 P8 R14
G1 X102.105 Y87.438 E.00763
G1 X90.861 Y76.194 E.21083
G1 X91.437 Y76.194 E.00763
G1 X102.105 Y86.863 E.20004
G1 X102.105 Y86.288 E.00763
G1 X92.012 Y76.194 E.18925
G1 X92.587 Y76.194 E.00763
G1 X102.105 Y85.712 E.17846
G1 X102.105 Y85.137 E.00763
G1 X93.163 Y76.194 E.16768
G1 X93.738 Y76.195 E.00763
G1 X102.105 Y84.562 E.15689
G1 X102.105 Y83.987 E.00763
G1 X94.313 Y76.195 E.1461
G1 X94.888 Y76.195 E.00763
G1 X102.105 Y83.411 E.13531
G1 X102.105 Y82.836 E.00763
G1 X95.464 Y76.195 E.12453
G1 X96.039 Y76.195 E.00763
G1 X102.105 Y82.261 E.11374
G1 X102.105 Y81.685 E.00763
G1 X96.614 Y76.195 E.10295
G1 X97.19 Y76.195 E.00763
G1 X102.105 Y81.11 E.09216
G1 X102.105 Y80.535 E.00763
G1 X97.765 Y76.195 E.08138
G1 X98.34 Y76.195 E.00763
G1 X102.105 Y79.96 E.07059
G1 X102.105 Y79.384 E.00763
G1 X98.915 Y76.195 E.0598
G1 X99.491 Y76.195 E.00763
G1 X102.105 Y78.809 E.04902
G1 X102.105 Y78.234 E.00763
G1 X100.066 Y76.195 E.03823
G1 X100.641 Y76.195 E.00763
G1 X102.105 Y77.658 E.02744
G1 X102.105 Y77.083 E.00763
G1 X101.217 Y76.195 E.01665
G1 X101.58 Y76.195 E.00482
G3 X101.876 Y76.288 I-.017 J.571 E.00416
G3 X102.286 Y76.689 I-3.88 J4.379 E.00762
M204 S10000
G1 X100.247 Y103.988 F42000
G1 F15523
M204 S6000
G1 X77.893 Y81.634 E.41913
G1 X77.893 Y82.209 E.00763
G1 X99.491 Y103.807 E.40495
G1 X98.915 Y103.807 E.00763
G1 X77.893 Y82.785 E.39416
G1 X77.893 Y83.36 E.00763
G1 X98.34 Y103.807 E.38338
G1 X97.765 Y103.807 E.00763
G1 X77.893 Y83.935 E.37259
G1 X77.893 Y84.51 E.00763
G1 X97.19 Y103.807 E.3618
G1 X96.614 Y103.807 E.00763
G1 X77.893 Y85.086 E.35102
G1 X77.893 Y85.661 E.00763
G1 X96.039 Y103.807 E.34023
G1 X95.464 Y103.807 E.00763
G1 X77.893 Y86.236 E.32945
G1 X77.893 Y86.811 E.00763
G1 X94.889 Y103.807 E.31866
G1 X94.313 Y103.807 E.00763
G1 X77.893 Y87.387 E.30787
G1 X77.893 Y87.962 E.00763
G1 X93.738 Y103.807 E.29709
G1 X93.163 Y103.807 E.00763
G1 X77.893 Y88.537 E.2863
G1 X77.893 Y89.112 E.00763
G1 X92.588 Y103.807 E.27552
G1 X92.012 Y103.807 E.00763
G1 X77.893 Y89.688 E.26473
G1 X77.893 Y90.263 E.00763
G1 X91.437 Y103.807 E.25395
G1 X90.862 Y103.807 E.00763
G1 X77.893 Y90.838 E.24316
G1 X77.893 Y91.413 E.00763
G1 X90.287 Y103.807 E.23237
G1 X89.711 Y103.807 E.00763
G1 X77.893 Y91.989 E.22159
G1 X77.893 Y92.564 E.00763
G1 X89.136 Y103.807 E.2108
G1 X88.561 Y103.807 E.00763
G1 X77.893 Y93.139 E.20002
G1 X77.893 Y93.714 E.00763
G1 X87.986 Y103.807 E.18923
G1 X87.41 Y103.807 E.00763
G1 X77.893 Y94.29 E.17844
G1 X77.893 Y94.865 E.00763
G1 X86.835 Y103.807 E.16766
G1 X86.26 Y103.807 E.00763
G1 X77.893 Y95.44 E.15687
G1 X77.893 Y96.015 E.00763
G1 X85.685 Y103.807 E.14609
G1 X85.109 Y103.807 E.00763
G1 X77.893 Y96.591 E.1353
G1 X77.893 Y97.166 E.00763
G1 X84.534 Y103.807 E.12451
G1 X83.959 Y103.807 E.00763
G1 X77.893 Y97.741 E.11373
G1 X77.893 Y98.316 E.00763
G1 X83.384 Y103.807 E.10294
G1 X82.808 Y103.807 E.00763
G1 X77.893 Y98.892 E.09216
G1 X77.893 Y99.467 E.00763
G1 X82.233 Y103.807 E.08137
G1 X81.658 Y103.807 E.00763
G1 X77.893 Y100.042 E.07059
G1 X77.893 Y100.617 E.00763
G1 X81.083 Y103.807 E.0598
G1 X80.508 Y103.807 E.00763
G1 X77.893 Y101.193 E.04901
G1 X77.893 Y101.768 E.00763
G1 X79.932 Y103.807 E.03823
G1 X79.357 Y103.807 E.00763
G1 X77.893 Y102.343 E.02744
G1 X77.893 Y102.918 E.00763
G1 X78.963 Y103.988 E.02005
; CHANGE_LAYER
; Z_HEIGHT: 0.42
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X77.893 Y102.918 E-.57479
G1 X77.893 Y102.431 E-.18521
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/100
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.74 I-.088 J1.214 P1  F42000
G1 X101.644 Y104.152 Z.74
G1 Z.42
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14942
M204 S6000
G1 X101.554 Y104.172 E.0013
G1 X78.519 Y104.172 E.32498
G1 X78.15 Y104.128 E.00525
G1 X77.838 Y103.951 E.00505
G1 X77.614 Y103.663 E.00515
G1 X77.528 Y103.27 E.00568
G1 X77.528 Y76.738 E.3743
G1 X77.609 Y76.374 E.00527
G1 X77.819 Y76.059 E.00534
G1 X78.037 Y75.914 E.00369
G1 X78.431 Y75.828 E.00569
G1 X101.619 Y75.83 E.32713
G1 X101.953 Y75.921 E.00489
G1 X102.175 Y76.066 E.00374
G1 X102.38 Y76.324 E.00465
G1 X102.47 Y76.676 E.00512
G1 X102.472 Y103.262 E.37508
G1 X102.404 Y103.607 E.00496
G1 X102.247 Y103.876 E.0044
G1 X101.949 Y104.086 E.00514
G1 X101.703 Y104.14 E.00356
M204 S250
G1 X101.688 Y104.574 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X101.585 Y104.589 E.00137
G1 X78.519 Y104.59 E.30286
G1 X78.027 Y104.532 E.0065
G3 X77.565 Y104.268 I.858 J-2.037 E.00701
G3 X77.111 Y103.29 I1.072 J-1.093 E.01447
G1 X77.111 Y77.29 E.34139
G3 X77.15 Y76.389 I4.634 J-.246 E.01186
G1 X77.295 Y76.039 E.00498
G1 X77.536 Y75.746 E.00498
G3 X78.41 Y75.411 I1.025 J1.364 E.01246
G1 X101.539 Y75.412 E.30368
G1 X101.971 Y75.467 E.00573
G1 X102.315 Y75.63 E.00499
G3 X102.68 Y76.017 I-1.402 J1.688 E.00701
G3 X102.888 Y76.676 I-1.35 J.787 E.00914
G1 X102.889 Y102.676 E.34139
G3 X102.789 Y103.768 I-3.258 J.253 E.01448
G1 X102.556 Y104.163 E.00602
G1 X102.26 Y104.406 E.00503
G1 X101.977 Y104.531 E.00406
G1 X101.748 Y104.565 E.00305
; WIPE_START
M204 S6000
G1 X101.585 Y104.589 E-.06251
G1 X99.749 Y104.589 E-.69749
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.689 Y98.875 Z.82 F42000
G1 X79.882 Y82.154 Z.82
G1 Z.42
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14942
M204 S6000
G1 X79.567 Y82.068 E.00461
G1 X79.217 Y81.795 E.00627
G1 X79.001 Y81.406 E.00627
G3 X79.064 Y80.568 I1.289 J-.325 E.01207
G1 X79.336 Y80.216 E.00627
G1 X79.722 Y79.998 E.00626
G1 X80.058 Y79.937 E.00481
G1 X80.363 Y79.982 E.00436
G1 X80.761 Y80.181 E.00628
G3 X81.112 Y80.635 I-.745 J.94 E.00818
G1 X81.197 Y81.035 E.00577
G1 X81.114 Y81.492 E.00656
G1 X80.823 Y81.897 E.00704
G3 X80.338 Y82.161 I-.801 J-.896 E.00785
G1 X79.998 Y82.185 E.00481
G1 X79.94 Y82.169 E.00084
M204 S250
G1 X79.987 Y81.767 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.653 Y81.636 E.00471
G1 X79.464 Y81.43 E.00367
G1 X79.371 Y81.151 E.00386
G1 X79.42 Y80.786 E.00484
G1 X79.58 Y80.555 E.00368
G1 X79.815 Y80.405 E.00367
G1 X80.093 Y80.358 E.0037
G1 X80.365 Y80.422 E.00368
G1 X80.592 Y80.587 E.00368
G1 X80.736 Y80.828 E.00368
G1 X80.776 Y81.105 E.00368
G1 X80.696 Y81.388 E.00387
G1 X80.45 Y81.661 E.00483
G1 X80.189 Y81.762 E.00367
G1 X80.047 Y81.766 E.00187
; WIPE_START
M204 S6000
G1 X79.653 Y81.636 E-.15754
G1 X79.464 Y81.43 E-.10635
G1 X79.371 Y81.151 E-.11174
G1 X79.42 Y80.786 E-.13993
G1 X79.58 Y80.555 E-.10654
G1 X79.815 Y80.405 E-.10607
G1 X79.898 Y80.391 E-.03182
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.82 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X77.7 Y80.713
G1 Z.42
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424238
G1 F14942
M204 S6000
G1 X82.231 Y76.182 E.08502
G1 X81.655 Y76.181 E.00764
G1 X77.881 Y79.956 E.07082
G1 X77.881 Y79.38 E.00764
G1 X81.08 Y76.181 E.06002
G1 X80.504 Y76.181 E.00764
G1 X77.881 Y78.804 E.04922
G1 X77.881 Y78.229 E.00764
G1 X79.929 Y76.181 E.03842
G1 X79.353 Y76.181 E.00764
G1 X77.881 Y77.653 E.02762
G1 X77.881 Y77.077 E.00764
G1 X78.777 Y76.181 E.01681
G2 X78.193 Y76.234 I-.177 J1.31 E.00785
G1 X78.061 Y76.322 E.00212
G1 X77.709 Y76.674 E.00659
M204 S10000
G1 X77.7 Y84.743 F42000
G1 F14942
M204 S6000
G1 X79.918 Y82.525 E.04161
G3 X79.461 Y82.406 I.065 J-1.186 E.0063
G1 X77.881 Y83.986 E.02964
G1 X77.881 Y83.41 E.00764
G1 X79.109 Y82.182 E.02304
G3 X78.846 Y81.869 I.643 J-.807 E.00546
G1 X77.881 Y82.834 E.01811
G1 X77.881 Y82.258 E.00764
G1 X78.663 Y81.477 E.01467
G3 X78.614 Y80.95 I.918 J-.352 E.0071
G1 X77.881 Y81.683 E.01374
G1 X77.881 Y81.107 E.00764
G1 X82.807 Y76.182 E.09242
G1 X83.382 Y76.182 E.00764
M73 P9 R14
G1 X79.973 Y79.591 E.06398
G1 X80.061 Y79.584 E.00118
G1 X80.485 Y79.655 E.0057
G1 X83.958 Y76.182 E.06517
G1 X84.534 Y76.182 E.00764
G1 X80.879 Y79.837 E.06858
G3 X81.184 Y80.107 I-.555 J.932 E.00544
G1 X85.109 Y76.182 E.07366
G1 X85.685 Y76.182 E.00764
G1 X81.414 Y80.453 E.08014
G1 X81.441 Y80.504 E.00077
G1 X81.535 Y80.908 E.0055
G1 X86.261 Y76.182 E.08868
G1 X86.836 Y76.182 E.00764
G1 X77.881 Y85.137 E.16804
G1 X77.881 Y85.713 E.00764
G1 X87.412 Y76.182 E.17884
G1 X87.988 Y76.182 E.00764
G1 X77.881 Y86.288 E.18964
G1 X77.881 Y86.864 E.00764
G1 X88.563 Y76.182 E.20044
G1 X89.139 Y76.182 E.00764
G1 X77.881 Y87.44 E.21124
G1 X77.881 Y88.015 E.00764
G1 X89.714 Y76.182 E.22204
G1 X90.29 Y76.182 E.00764
G1 X77.881 Y88.591 E.23284
G1 X77.881 Y89.167 E.00764
G1 X90.866 Y76.182 E.24365
G1 X91.441 Y76.182 E.00764
G1 X77.881 Y89.742 E.25445
G1 X77.881 Y90.318 E.00764
G1 X92.017 Y76.182 E.26525
G1 X92.593 Y76.182 E.00764
G1 X77.881 Y90.894 E.27605
G1 X77.881 Y91.469 E.00764
G1 X93.168 Y76.182 E.28685
G1 X93.744 Y76.182 E.00764
G1 X77.881 Y92.045 E.29765
G1 X77.881 Y92.621 E.00764
G1 X94.32 Y76.182 E.30846
G1 X94.895 Y76.183 E.00764
G1 X77.881 Y93.196 E.31926
G1 X77.881 Y93.772 E.00764
G1 X95.471 Y76.183 E.33006
G1 X96.046 Y76.183 E.00764
G1 X77.881 Y94.348 E.34086
G1 X77.881 Y94.924 E.00764
G1 X96.622 Y76.183 E.35166
G1 X97.198 Y76.183 E.00764
G1 X77.881 Y95.499 E.36246
G1 X77.881 Y96.075 E.00764
G1 X97.773 Y76.183 E.37326
G1 X98.349 Y76.183 E.00764
G1 X77.881 Y96.651 E.38407
G1 X77.881 Y97.226 E.00764
G1 X98.925 Y76.183 E.39487
G1 X99.5 Y76.183 E.00764
G1 X77.881 Y97.802 E.40567
G1 X77.881 Y98.378 E.00764
G1 X100.076 Y76.183 E.41647
G1 X100.652 Y76.183 E.00764
G1 X77.881 Y98.953 E.42727
G1 X77.881 Y99.529 E.00764
G1 X101.227 Y76.183 E.43807
G1 X101.588 Y76.183 E.00479
G3 X101.764 Y76.222 I.018 J.337 E.00242
G1 X77.881 Y100.105 E.44815
G1 X77.881 Y100.68 E.00764
G1 X102.063 Y76.498 E.45376
G1 X102.117 Y76.687 E.0026
G1 X102.117 Y77.02 E.00442
G1 X77.881 Y101.256 E.45477
G1 X77.881 Y101.832 E.00764
G1 X102.117 Y77.596 E.45477
G1 X102.117 Y78.172 E.00764
G1 X77.881 Y102.407 E.45477
G1 X77.881 Y102.983 E.00764
G1 X102.117 Y78.747 E.45477
G1 X102.117 Y79.323 E.00764
G1 X77.934 Y103.506 E.45379
G2 X78.237 Y103.779 I.439 J-.184 E.00559
G1 X102.117 Y79.899 E.4481
G1 X102.117 Y80.474 E.00764
G1 X78.773 Y103.819 E.43805
G1 X79.348 Y103.819 E.00764
G1 X102.117 Y81.05 E.42725
G1 X102.117 Y81.625 E.00764
G1 X79.924 Y103.819 E.41644
G1 X80.5 Y103.819 E.00764
G1 X102.117 Y82.201 E.40564
G1 X102.117 Y82.777 E.00764
G1 X81.075 Y103.819 E.39484
G1 X81.651 Y103.819 E.00764
G1 X102.117 Y83.352 E.38404
G1 X102.117 Y83.928 E.00764
G1 X82.227 Y103.819 E.37324
G1 X82.802 Y103.819 E.00764
G1 X102.118 Y84.504 E.36244
G1 X102.118 Y85.079 E.00764
G1 X83.378 Y103.819 E.35163
G1 X83.954 Y103.819 E.00764
G1 X102.118 Y85.655 E.34083
G1 X102.118 Y86.231 E.00764
G1 X84.529 Y103.819 E.33003
G1 X85.105 Y103.819 E.00764
G1 X102.118 Y86.806 E.31923
G1 X102.118 Y87.382 E.00764
G1 X85.681 Y103.819 E.30843
G1 X86.257 Y103.819 E.00764
G1 X102.118 Y87.958 E.29763
G1 X102.118 Y88.533 E.00764
G1 X86.832 Y103.819 E.28682
G1 X87.408 Y103.819 E.00764
G1 X102.118 Y89.109 E.27602
G1 X102.118 Y89.684 E.00764
G1 X87.984 Y103.819 E.26522
G1 X88.559 Y103.819 E.00764
G1 X102.118 Y90.26 E.25442
G1 X102.118 Y90.836 E.00764
G1 X89.135 Y103.819 E.24362
G1 X89.711 Y103.819 E.00764
G1 X102.118 Y91.411 E.23282
G1 X102.118 Y91.987 E.00764
G1 X90.286 Y103.819 E.22201
G1 X90.862 Y103.819 E.00764
G1 X102.118 Y92.563 E.21121
G1 X102.118 Y93.138 E.00764
G1 X91.438 Y103.819 E.20041
G1 X92.013 Y103.819 E.00764
G1 X102.118 Y93.714 E.18961
G1 X102.118 Y94.29 E.00764
G1 X92.589 Y103.819 E.17881
G1 X93.165 Y103.819 E.00764
G1 X102.118 Y94.865 E.16801
G1 X102.118 Y95.441 E.00764
G1 X93.74 Y103.819 E.1572
M73 P10 R14
G1 X94.316 Y103.819 E.00764
G1 X102.118 Y96.017 E.1464
G1 X102.118 Y96.592 E.00764
G1 X94.892 Y103.819 E.1356
G1 X95.467 Y103.819 E.00764
G1 X102.118 Y97.168 E.1248
G1 X102.118 Y97.744 E.00764
G1 X96.043 Y103.819 E.114
G1 X96.619 Y103.819 E.00764
G1 X102.118 Y98.319 E.1032
G1 X102.118 Y98.895 E.00764
G1 X97.195 Y103.819 E.0924
G1 X97.77 Y103.819 E.00764
G1 X102.119 Y99.47 E.08159
G1 X102.119 Y100.046 E.00764
G1 X98.346 Y103.819 E.07079
G1 X98.922 Y103.819 E.00764
G1 X102.119 Y100.622 E.05999
G1 X102.119 Y101.197 E.00764
G1 X99.497 Y103.819 E.04919
G1 X100.073 Y103.819 E.00764
G1 X102.119 Y101.773 E.03839
G1 X102.119 Y102.349 E.00764
G1 X100.649 Y103.819 E.02759
G1 X101.224 Y103.819 E.00764
G1 X102.119 Y102.924 E.01678
G1 X102.119 Y103.24 E.00419
G3 X101.987 Y103.631 I-.618 J.01 E.00558
G1 X101.632 Y103.986 E.00666
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X101.987 Y103.631 E-.19088
G1 X102.051 Y103.541 E-.04193
G1 X102.096 Y103.424 E-.04761
G1 X102.119 Y103.24 E-.07056
G1 X102.119 Y102.924 E-.11993
G1 X101.581 Y103.462 E-.2891
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/100
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.82 I-1.206 J.161 P1  F42000
G1 X101.673 Y104.15 Z.82
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14937
M204 S6000
G1 X101.577 Y104.172 E.00139
G1 X78.438 Y104.172 E.32644
G1 X78.072 Y104.091 E.00528
G1 X77.759 Y103.881 E.00532
G1 X77.613 Y103.664 E.00369
G1 X77.528 Y103.269 E.00569
G1 X77.528 Y77.269 E.36681
G3 X77.594 Y76.398 I2.677 J-.236 E.01238
G1 X77.793 Y76.082 E.00527
G1 X78.077 Y75.907 E.0047
G1 X78.438 Y75.828 E.00523
G1 X101.482 Y75.828 E.32509
G1 X101.851 Y75.872 E.00525
G1 X102.175 Y76.066 E.00532
G1 X102.38 Y76.323 E.00465
G1 X102.47 Y76.676 E.00513
G1 X102.472 Y102.676 E.36681
G3 X102.428 Y103.551 I-3.694 J.253 E.0124
G1 X102.252 Y103.862 E.00504
G1 X101.97 Y104.082 E.00504
G1 X101.731 Y104.137 E.00346
M204 S250
G1 X101.74 Y104.562 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X101.592 Y104.59 E.00198
G1 X78.497 Y104.59 E.30324
G1 X78.089 Y104.55 E.00538
G1 X77.738 Y104.404 E.005
G1 X77.446 Y104.165 E.00496
G3 X77.11 Y103.29 I1.366 J-1.026 E.01247
G1 X77.11 Y77.29 E.34139
G3 X77.132 Y76.535 I4.551 J-.246 E.00992
G1 X77.263 Y76.095 E.00604
G1 X77.491 Y75.787 E.00502
G1 X77.735 Y75.597 E.00407
G1 X78.089 Y75.45 E.00504
G1 X78.413 Y75.41 E.00428
G1 X101.482 Y75.41 E.3029
G1 X101.974 Y75.468 E.00651
G1 X102.315 Y75.629 E.00496
G3 X102.681 Y76.016 I-1.407 J1.693 E.007
G1 X102.809 Y76.297 E.00405
G1 X102.888 Y76.676 E.00509
G1 X102.89 Y102.676 E.34139
G3 X102.832 Y103.674 I-4.286 J.253 E.01316
G1 X102.67 Y104.018 E.00499
G1 X102.467 Y104.253 E.00408
G1 X102.151 Y104.464 E.00499
G3 X101.97 Y104.519 I-.856 J-2.496 E.00248
G1 X101.799 Y104.551 E.00228
; WIPE_START
M204 S6000
G1 X101.592 Y104.59 E-.08014
G1 X99.803 Y104.59 E-.67986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.732 Y98.886 Z.9 F42000
G1 X79.86 Y82.158 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14937
M204 S6000
G1 X79.756 Y82.142 E.00149
G1 X79.361 Y81.935 E.00629
G1 X79.079 Y81.592 E.00627
G1 X78.962 Y81.273 E.00481
G1 X78.952 Y80.964 E.00436
G1 X79.079 Y80.537 E.00628
G3 X79.648 Y80.029 I1.056 J.608 E.01095
G1 X80.057 Y79.937 E.00592
G1 X80.284 Y79.961 E.00322
G1 X80.735 Y80.165 E.00698
G1 X80.937 Y80.352 E.00389
G1 X81.112 Y80.634 E.00468
G1 X81.197 Y81.035 E.00578
G1 X81.114 Y81.493 E.00656
G1 X80.847 Y81.883 E.00667
G1 X80.487 Y82.111 E.00601
G1 X80.029 Y82.183 E.00655
G1 X79.92 Y82.167 E.00155
M204 S250
G1 X79.916 Y81.753 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.909 Y81.753 E.00009
G1 X79.653 Y81.636 E.00369
G1 X79.464 Y81.43 E.00367
G1 X79.37 Y81.166 E.00368
G1 X79.386 Y80.886 E.00368
G1 X79.464 Y80.7 E.00265
G1 X79.679 Y80.477 E.00406
G1 X80.057 Y80.355 E.00522
G1 X80.308 Y80.401 E.00335
G1 X80.592 Y80.588 E.00446
G1 X80.736 Y80.827 E.00367
G1 X80.776 Y81.105 E.00369
G1 X80.705 Y81.376 E.00368
G1 X80.531 Y81.6 E.00372
G1 X80.247 Y81.748 E.00421
G1 X79.976 Y81.752 E.00356
; WIPE_START
M204 S6000
G1 X79.909 Y81.753 E-.02551
G1 X79.653 Y81.636 E-.10676
G1 X79.464 Y81.43 E-.1063
G1 X79.37 Y81.166 E-.10663
G1 X79.386 Y80.886 E-.10658
G1 X79.464 Y80.7 E-.07662
G1 X79.679 Y80.477 E-.11757
G1 X79.964 Y80.385 E-.11404
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.9 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X77.699 Y77.413
G1 Z.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424218
G1 F14937
M204 S6000
G1 X79.886 Y79.6 E.04103
G1 X79.537 Y79.693 E.00479
G1 X79.452 Y79.741 E.00131
G1 X77.881 Y78.17 E.02947
G1 X77.881 Y78.746 E.00764
G1 X79.099 Y79.964 E.02285
G2 X78.837 Y80.277 I.598 J.766 E.00546
G1 X77.881 Y79.321 E.01794
G1 X77.881 Y79.897 E.00764
G1 X78.656 Y80.672 E.01454
G2 X78.608 Y81.2 I1.073 J.363 E.0071
G1 X77.881 Y80.473 E.01364
G1 X77.881 Y81.048 E.00764
G1 X100.652 Y103.819 E.42726
G1 X101.227 Y103.819 E.00764
G1 X79.937 Y82.529 E.39947
G2 X80.472 Y82.488 I.119 J-1.943 E.00714
G1 X101.761 Y103.777 E.39945
G2 X102.061 Y103.502 I-.097 J-.407 E.00565
G1 X80.86 Y82.3 E.39782
G2 X81.178 Y82.043 I-.438 J-.871 E.00547
G1 X102.119 Y102.984 E.39292
G1 X102.119 Y102.409 E.00764
G1 X81.405 Y81.694 E.38867
G2 X81.529 Y81.243 I-.979 J-.512 E.00626
G1 X102.119 Y101.833 E.38634
G1 X102.119 Y101.257 E.00764
G1 X77.881 Y77.019 E.4548
G3 X77.934 Y76.496 I1.263 J-.135 E.00702
G1 X102.119 Y100.681 E.4538
G1 X102.119 Y100.106 E.00764
G1 X78.237 Y76.223 E.44812
G3 X78.77 Y76.181 I.371 J1.288 E.00714
G1 X102.119 Y99.53 E.43811
G1 X102.119 Y98.954 E.00764
G1 X79.345 Y76.181 E.42731
G1 X79.921 Y76.181 E.00764
G1 X102.119 Y98.379 E.41651
G1 X102.119 Y97.803 E.00764
G1 X80.497 Y76.181 E.40571
G1 X81.072 Y76.181 E.00764
G1 X102.119 Y97.227 E.39491
G1 X102.119 Y96.652 E.00764
G1 X81.648 Y76.181 E.3841
G1 X82.224 Y76.181 E.00764
G1 X102.119 Y96.076 E.3733
G1 X102.119 Y95.5 E.00764
G1 X82.799 Y76.181 E.3625
G1 X83.375 Y76.181 E.00764
G1 X102.119 Y94.925 E.3517
G1 X102.119 Y94.349 E.00764
G1 X83.951 Y76.181 E.3409
G1 X84.526 Y76.181 E.00764
G1 X102.119 Y93.773 E.33009
G1 X102.119 Y93.197 E.00764
G1 X85.102 Y76.181 E.31929
G1 X85.678 Y76.181 E.00764
G1 X102.119 Y92.622 E.30849
G1 X102.119 Y92.046 E.00764
G1 X86.253 Y76.181 E.29769
G1 X86.829 Y76.181 E.00764
G1 X102.118 Y91.47 E.28689
G1 X102.118 Y90.895 E.00764
G1 X87.405 Y76.181 E.27608
G1 X87.98 Y76.181 E.00764
G1 X102.118 Y90.319 E.26528
G1 X102.118 Y89.743 E.00764
G1 X88.556 Y76.181 E.25448
G1 X89.131 Y76.181 E.00764
G1 X102.118 Y89.168 E.24368
G1 X102.118 Y88.592 E.00764
G1 X89.707 Y76.181 E.23288
G1 X90.283 Y76.181 E.00764
G1 X102.118 Y88.016 E.22207
G1 X102.118 Y87.441 E.00764
G1 X90.858 Y76.181 E.21127
G1 X91.434 Y76.181 E.00764
G1 X102.118 Y86.865 E.20047
G1 X102.118 Y86.289 E.00764
G1 X92.01 Y76.181 E.18967
G1 X92.585 Y76.181 E.00764
G1 X102.118 Y85.713 E.17887
G1 X102.118 Y85.138 E.00764
G1 X93.161 Y76.181 E.16806
G1 X93.737 Y76.181 E.00764
G1 X102.118 Y84.562 E.15726
G1 X102.118 Y83.986 E.00764
G1 X94.312 Y76.181 E.14646
G1 X94.888 Y76.181 E.00764
G1 X102.118 Y83.411 E.13566
G1 X102.118 Y82.835 E.00764
G1 X95.464 Y76.181 E.12486
M73 P11 R14
G1 X96.039 Y76.181 E.00764
G1 X102.118 Y82.259 E.11405
G1 X102.118 Y81.684 E.00764
G1 X96.615 Y76.181 E.10325
G1 X97.191 Y76.181 E.00764
G1 X102.118 Y81.108 E.09245
G1 X102.118 Y80.532 E.00764
G1 X97.766 Y76.181 E.08165
G1 X98.342 Y76.181 E.00764
G1 X102.118 Y79.956 E.07085
G1 X102.118 Y79.381 E.00764
G1 X98.918 Y76.181 E.06004
G1 X99.493 Y76.181 E.00764
G1 X102.118 Y78.805 E.04924
G1 X102.118 Y78.229 E.00764
G1 X100.069 Y76.181 E.03844
G1 X100.645 Y76.181 E.00764
G1 X102.118 Y77.654 E.02764
G1 X102.118 Y77.078 E.00764
G1 X101.22 Y76.181 E.01684
G1 X101.529 Y76.181 E.00409
G3 X101.883 Y76.277 I.018 J.632 E.00494
G3 X102.299 Y76.684 I-3.927 J4.437 E.00772
M204 S10000
G1 X100.257 Y104.001 F42000
G1 F14937
M204 S6000
G1 X77.881 Y81.624 E.41986
G1 X77.881 Y82.2 E.00764
G1 X99.5 Y103.819 E.40566
G1 X98.925 Y103.819 E.00764
G1 X77.881 Y82.775 E.39486
G1 X77.881 Y83.351 E.00764
G1 X98.349 Y103.819 E.38406
G1 X97.773 Y103.819 E.00764
G1 X77.881 Y83.927 E.37326
G1 X77.881 Y84.502 E.00764
G1 X97.198 Y103.819 E.36245
G1 X96.622 Y103.819 E.00764
G1 X77.881 Y85.078 E.35165
G1 X77.881 Y85.654 E.00764
G1 X96.046 Y103.819 E.34085
G1 X95.471 Y103.819 E.00764
G1 X77.881 Y86.229 E.33005
G1 X77.881 Y86.805 E.00764
G1 X94.895 Y103.819 E.31925
G1 X94.319 Y103.819 E.00764
G1 X77.881 Y87.381 E.30845
G1 X77.881 Y87.956 E.00764
G1 X93.744 Y103.819 E.29765
G1 X93.168 Y103.819 E.00764
G1 X77.881 Y88.532 E.28685
G1 X77.881 Y89.108 E.00764
G1 X92.592 Y103.819 E.27604
G1 X92.017 Y103.819 E.00764
G1 X77.881 Y89.683 E.26524
G1 X77.881 Y90.259 E.00764
G1 X91.441 Y103.819 E.25444
G1 X90.866 Y103.819 E.00764
G1 X77.881 Y90.834 E.24364
G1 X77.881 Y91.41 E.00764
G1 X90.29 Y103.819 E.23284
G1 X89.714 Y103.819 E.00764
G1 X77.881 Y91.986 E.22204
G1 X77.881 Y92.561 E.00764
G1 X89.139 Y103.819 E.21124
G1 X88.563 Y103.819 E.00764
G1 X77.881 Y93.137 E.20043
G1 X77.881 Y93.713 E.00764
G1 X87.987 Y103.819 E.18963
G1 X87.412 Y103.819 E.00764
G1 X77.881 Y94.288 E.17883
G1 X77.881 Y94.864 E.00764
G1 X86.836 Y103.819 E.16803
G1 X86.26 Y103.819 E.00764
G1 X77.881 Y95.44 E.15723
G1 X77.881 Y96.015 E.00764
G1 X85.685 Y103.819 E.14643
G1 X85.109 Y103.819 E.00764
G1 X77.881 Y96.591 E.13563
G1 X77.881 Y97.167 E.00764
G1 X84.533 Y103.819 E.12483
G1 X83.958 Y103.819 E.00764
G1 X77.881 Y97.742 E.11402
G1 X77.881 Y98.318 E.00764
G1 X83.382 Y103.819 E.10322
G1 X82.806 Y103.819 E.00764
G1 X77.881 Y98.894 E.09242
G1 X77.881 Y99.469 E.00764
G1 X82.231 Y103.819 E.08162
G1 X81.655 Y103.819 E.00764
G1 X77.881 Y100.045 E.07082
G1 X77.881 Y100.621 E.00764
G1 X81.079 Y103.819 E.06002
G1 X80.504 Y103.819 E.00764
G1 X77.881 Y101.196 E.04922
G1 X77.881 Y101.772 E.00764
G1 X79.928 Y103.819 E.03842
G1 X79.352 Y103.819 E.00764
G1 X77.881 Y102.348 E.02761
G1 X77.881 Y102.923 E.00764
G1 X78.777 Y103.819 E.01681
G3 X78.138 Y103.736 I-.159 J-1.275 E.00863
G3 X77.706 Y103.324 I1.876 J-2.402 E.00794
; CHANGE_LAYER
; Z_HEIGHT: 0.58
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X78.138 Y103.736 E-.22716
G1 X78.288 Y103.798 E-.06142
G1 X78.459 Y103.819 E-.06573
G1 X78.777 Y103.819 E-.12059
G1 X78.246 Y103.289 E-.2851
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/100
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.9 I-.044 J1.216 P1  F42000
G1 X101.731 Y104.146 Z.9
G1 Z.58
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14945
M204 S6000
G1 X101.584 Y104.172 E.0021
G1 X78.498 Y104.172 E.3257
G1 X78.379 Y104.165 E.00169
G1 X77.99 Y104.065 E.00566
G1 X77.756 Y103.865 E.00435
G1 X77.608 Y103.626 E.00396
G1 X77.528 Y103.261 E.00527
G1 X77.528 Y77.261 E.36681
G3 X77.594 Y76.397 I2.652 J-.232 E.01228
G1 X77.793 Y76.082 E.00526
G1 X78.076 Y75.908 E.00469
G1 X78.439 Y75.828 E.00524
G1 X101.482 Y75.828 E.3251
G1 X101.851 Y75.872 E.00524
G1 X102.175 Y76.066 E.00532
G1 X102.4 Y76.369 E.00533
G1 X102.47 Y76.652 E.00411
G1 X102.47 Y102.652 E.36681
G3 X102.452 Y103.405 I-3.828 J.284 E.01065
G1 X102.355 Y103.703 E.00442
G1 X102.115 Y103.995 E.00532
G1 X101.885 Y104.118 E.00369
G1 X101.79 Y104.135 E.00136
M204 S250
G1 X101.802 Y104.554 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X101.594 Y104.59 E.00276
G1 X78.498 Y104.59 E.30326
G3 X77.93 Y104.489 I.025 J-1.794 E.00761
G1 X77.537 Y104.256 E.006
G1 X77.295 Y103.962 E.005
G1 X77.15 Y103.611 E.00499
G1 X77.11 Y103.287 E.00428
G1 X77.11 Y77.287 E.34139
G3 X77.132 Y76.534 I4.514 J-.244 E.00991
G1 X77.263 Y76.094 E.00603
G1 X77.491 Y75.787 E.00502
G1 X77.735 Y75.597 E.00406
G1 X78.089 Y75.45 E.00504
G1 X78.413 Y75.41 E.00428
G1 X101.482 Y75.41 E.3029
G1 X101.974 Y75.468 E.0065
G1 X102.315 Y75.629 E.00496
G1 X102.595 Y75.883 E.00496
G1 X102.79 Y76.207 E.00497
G1 X102.888 Y76.649 E.00594
G1 X102.888 Y102.649 E.34139
G3 X102.813 Y103.734 I-3.73 J.285 E.01433
G1 X102.634 Y104.067 E.00496
G1 X102.367 Y104.334 E.00496
G1 X102.032 Y104.514 E.00499
G1 X101.861 Y104.544 E.00228
; WIPE_START
M204 S6000
G1 X101.594 Y104.59 E-.10267
G1 X99.865 Y104.59 E-.65733
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.796 Y98.883 Z.98 F42000
G1 X79.949 Y82.166 Z.98
G1 Z.58
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14945
M204 S6000
G1 X79.7 Y82.121 E.00356
G3 X79.079 Y81.592 I.459 J-1.168 E.01172
G1 X78.962 Y81.273 E.0048
G1 X78.952 Y80.964 E.00436
G1 X79.079 Y80.538 E.00628
G3 X79.723 Y79.998 I1.132 J.696 E.01207
G1 X80.057 Y79.937 E.00479
G1 X80.363 Y79.982 E.00436
G1 X80.761 Y80.181 E.00628
G1 X80.954 Y80.378 E.00389
G1 X81.163 Y80.795 E.00658
G1 X81.175 Y81.29 E.00699
G1 X80.964 Y81.746 E.00709
G1 X80.804 Y81.914 E.00327
G1 X80.513 Y82.102 E.00489
G1 X80.099 Y82.193 E.00598
G1 X80.008 Y82.176 E.0013
M204 S250
G1 X80.023 Y81.765 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.705 Y81.669 E.00437
G1 X79.464 Y81.43 E.00445
G1 X79.373 Y81.201 E.00324
G1 X79.386 Y80.886 E.00413
G1 X79.52 Y80.624 E.00387
G1 X79.816 Y80.405 E.00483
G1 X80.092 Y80.358 E.00368
G1 X80.365 Y80.422 E.00368
G1 X80.597 Y80.596 E.0038
G1 X80.757 Y80.905 E.00457
G1 X80.748 Y81.258 E.00463
G1 X80.56 Y81.575 E.00483
G1 X80.324 Y81.725 E.00367
G1 X80.082 Y81.763 E.00322
; WIPE_START
M204 S6000
G1 X79.705 Y81.669 E-.14778
G1 X79.464 Y81.43 E-.12882
G1 X79.373 Y81.201 E-.09373
G1 X79.386 Y80.886 E-.11967
G1 X79.52 Y80.624 E-.11186
G1 X79.816 Y80.405 E-.13988
G1 X79.863 Y80.397 E-.01825
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.98 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X77.699 Y81.86
G1 Z.58
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424188
G1 F14945
M204 S6000
G1 X78.599 Y80.96 E.01688
G2 X78.662 Y81.473 I1.158 J.119 E.00691
G1 X77.881 Y82.254 E.01466
G1 X77.881 Y82.83 E.00764
G1 X78.847 Y81.864 E.01812
G2 X79.112 Y82.174 I.812 J-.427 E.00546
G1 X77.881 Y83.406 E.02311
G1 X77.881 Y83.981 E.00764
G1 X79.47 Y82.392 E.02981
G2 X79.911 Y82.527 I.646 J-1.329 E.00614
G1 X77.699 Y84.738 E.04149
M204 S10000
G1 X77.709 Y76.67 F42000
G1 F14945
M204 S6000
G1 X78.127 Y76.269 E.00768
G3 X78.774 Y76.181 I.479 J1.095 E.00878
G1 X77.881 Y77.074 E.01676
G1 X77.881 Y77.649 E.00764
G1 X79.349 Y76.181 E.02756
G1 X79.925 Y76.181 E.00764
G1 X77.881 Y78.225 E.03836
G1 X77.881 Y78.801 E.00764
G1 X80.501 Y76.181 E.04915
G1 X81.076 Y76.181 E.00764
G1 X77.881 Y79.376 E.05995
G1 X77.881 Y79.952 E.00764
G1 X81.652 Y76.181 E.07075
G1 X82.227 Y76.181 E.00764
G1 X77.881 Y80.527 E.08155
G1 X77.881 Y81.103 E.00764
G1 X82.803 Y76.181 E.09235
G1 X83.379 Y76.181 E.00764
G1 X79.968 Y79.592 E.06399
G1 X80.061 Y79.584 E.00124
G1 X80.481 Y79.654 E.00566
G1 X83.954 Y76.181 E.06516
G1 X84.53 Y76.181 E.00764
G1 X80.876 Y79.835 E.06856
G3 X81.181 Y80.105 I-.582 J.965 E.00544
G1 X85.106 Y76.181 E.07363
G1 X85.681 Y76.181 E.00764
G1 X81.408 Y80.454 E.08017
G3 X81.528 Y80.909 I-1.29 J.583 E.00628
G1 X86.257 Y76.181 E.08872
G1 X86.832 Y76.181 E.00764
G1 X77.881 Y85.132 E.16795
G1 X77.881 Y85.708 E.00764
G1 X87.408 Y76.181 E.17875
G1 X87.984 Y76.181 E.00764
G1 X77.881 Y86.284 E.18955
G1 X77.881 Y86.859 E.00764
G1 X88.559 Y76.181 E.20035
G1 X89.135 Y76.181 E.00764
G1 X77.881 Y87.435 E.21115
M73 P12 R14
G1 X77.881 Y88.01 E.00764
G1 X89.71 Y76.181 E.22195
G1 X90.286 Y76.181 E.00764
G1 X77.881 Y88.586 E.23275
G1 X77.881 Y89.162 E.00764
G1 X90.862 Y76.181 E.24355
G1 X91.437 Y76.181 E.00764
G1 X77.881 Y89.737 E.25435
G1 X77.881 Y90.313 E.00764
G1 X92.013 Y76.181 E.26515
G1 X92.588 Y76.181 E.00764
G1 X77.881 Y90.889 E.27595
G1 X77.881 Y91.464 E.00764
G1 X93.164 Y76.181 E.28675
G1 X93.74 Y76.181 E.00764
G1 X77.881 Y92.04 E.29755
G1 X77.881 Y92.615 E.00764
G1 X94.315 Y76.181 E.30835
G1 X94.891 Y76.181 E.00764
G1 X77.881 Y93.191 E.31915
G1 X77.881 Y93.767 E.00764
G1 X95.467 Y76.181 E.32995
G1 X96.042 Y76.181 E.00764
G1 X77.881 Y94.342 E.34075
G1 X77.881 Y94.918 E.00764
G1 X96.618 Y76.181 E.35155
G1 X97.193 Y76.181 E.00764
G1 X77.881 Y95.493 E.36235
G1 X77.881 Y96.069 E.00764
G1 X97.769 Y76.181 E.37315
G1 X98.345 Y76.181 E.00764
G1 X77.881 Y96.645 E.38395
G1 X77.881 Y97.22 E.00764
G1 X98.92 Y76.181 E.39474
G1 X99.496 Y76.181 E.00764
G1 X77.881 Y97.796 E.40554
G1 X77.881 Y98.372 E.00764
G1 X100.071 Y76.181 E.41634
G1 X100.647 Y76.181 E.00764
G1 X77.881 Y98.947 E.42714
G1 X77.881 Y99.523 E.00764
G1 X101.223 Y76.181 E.43794
G3 X101.748 Y76.213 I.153 J1.781 E.007
G1 X101.76 Y76.219 E.00018
G1 X77.881 Y100.098 E.44802
G1 X77.881 Y100.674 E.00764
G1 X102.062 Y76.493 E.45369
G1 X102.117 Y76.695 E.00279
G1 X102.117 Y77.013 E.00421
G1 X77.881 Y101.25 E.45473
G1 X77.881 Y101.825 E.00764
G1 X102.117 Y77.588 E.45473
G1 X102.117 Y78.164 E.00764
G1 X77.881 Y102.401 E.45473
G1 X77.881 Y102.976 E.00764
G1 X102.117 Y78.74 E.45473
G1 X102.117 Y79.315 E.00764
G1 X77.937 Y103.496 E.45368
G2 X78.23 Y103.779 I.414 J-.135 E.00562
G1 X102.117 Y79.891 E.44819
G1 X102.117 Y80.467 E.00764
G1 X78.765 Y103.819 E.43815
G1 X79.34 Y103.819 E.00764
G1 X102.117 Y81.042 E.42735
G1 X102.117 Y81.618 E.00764
G1 X79.916 Y103.819 E.41655
G1 X80.492 Y103.819 E.00764
G1 X102.117 Y82.193 E.40575
G1 X102.117 Y82.769 E.00764
G1 X81.067 Y103.819 E.39495
G1 X81.643 Y103.819 E.00764
G1 X102.117 Y83.345 E.38415
G1 X102.117 Y83.92 E.00764
G1 X82.218 Y103.819 E.37335
G1 X82.794 Y103.819 E.00764
G1 X102.117 Y84.496 E.36255
G1 X102.117 Y85.071 E.00764
G1 X83.37 Y103.819 E.35175
G1 X83.945 Y103.819 E.00764
G1 X102.117 Y85.647 E.34095
G1 X102.117 Y86.223 E.00764
G1 X84.521 Y103.819 E.33015
G1 X85.096 Y103.819 E.00764
G1 X102.117 Y86.798 E.31935
G1 X102.117 Y87.374 E.00764
G1 X85.672 Y103.819 E.30855
G1 X86.248 Y103.819 E.00764
G1 X102.117 Y87.95 E.29775
G1 X102.117 Y88.525 E.00764
G1 X86.823 Y103.819 E.28695
G1 X87.399 Y103.819 E.00764
G1 X102.117 Y89.101 E.27615
G1 X102.117 Y89.676 E.00764
G1 X87.975 Y103.819 E.26535
G1 X88.55 Y103.819 E.00764
G1 X102.117 Y90.252 E.25455
G1 X102.117 Y90.828 E.00764
G1 X89.126 Y103.819 E.24375
G1 X89.701 Y103.819 E.00764
G1 X102.117 Y91.403 E.23295
G1 X102.117 Y91.979 E.00764
G1 X90.277 Y103.819 E.22215
G1 X90.853 Y103.819 E.00764
G1 X102.117 Y92.554 E.21135
G1 X102.117 Y93.13 E.00764
G1 X91.428 Y103.819 E.20055
G1 X92.004 Y103.819 E.00764
G1 X102.117 Y93.706 E.18975
G1 X102.117 Y94.281 E.00764
G1 X92.579 Y103.819 E.17895
G1 X93.155 Y103.819 E.00764
G1 X102.117 Y94.857 E.16815
G1 X102.117 Y95.433 E.00764
G1 X93.731 Y103.819 E.15735
G1 X94.306 Y103.819 E.00764
G1 X102.117 Y96.008 E.14655
G1 X102.117 Y96.584 E.00764
G1 X94.882 Y103.819 E.13575
G1 X95.457 Y103.819 E.00764
G1 X102.117 Y97.159 E.12495
G1 X102.117 Y97.735 E.00764
G1 X96.033 Y103.819 E.11415
G1 X96.609 Y103.819 E.00764
G1 X102.117 Y98.311 E.10335
G1 X102.117 Y98.886 E.00764
G1 X97.184 Y103.819 E.09255
G1 X97.76 Y103.819 E.00764
G1 X102.117 Y99.462 E.08175
G1 X102.117 Y100.037 E.00764
G1 X98.336 Y103.819 E.07096
G1 X98.911 Y103.819 E.00764
G1 X102.117 Y100.613 E.06016
G1 X102.117 Y101.189 E.00764
G1 X99.487 Y103.819 E.04936
G1 X100.062 Y103.819 E.00764
M73 P13 R14
G1 X102.117 Y101.764 E.03856
G1 X102.117 Y102.34 E.00764
G1 X100.638 Y103.819 E.02776
G1 X101.214 Y103.819 E.00764
G1 X102.117 Y102.915 E.01696
G1 X102.117 Y103.278 E.00481
G3 X102.012 Y103.597 I-.578 J-.015 E.00451
G1 X101.614 Y103.995 E.00748
; CHANGE_LAYER
; Z_HEIGHT: 0.66
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X102.012 Y103.597 E-.21413
G1 X102.079 Y103.471 E-.05398
G1 X102.117 Y103.278 E-.0747
G1 X102.117 Y102.915 E-.13791
G1 X101.598 Y103.435 E-.27927
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/100
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.98 I-1.178 J.307 P1  F42000
G1 X101.777 Y104.125 Z.98
G1 Z.66
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14938
M204 S6000
G1 X101.561 Y104.172 E.00312
G1 X78.438 Y104.172 E.32622
G1 X78.072 Y104.091 E.00528
G1 X77.759 Y103.881 E.00532
G1 X77.613 Y103.663 E.00369
G1 X77.528 Y103.269 E.00569
G1 X77.528 Y77.269 E.36681
G3 X77.594 Y76.398 I2.668 J-.236 E.01238
G1 X77.793 Y76.082 E.00526
G1 X78.077 Y75.907 E.00471
G1 X78.438 Y75.828 E.00522
G1 X101.483 Y75.828 E.32512
G1 X101.851 Y75.872 E.00523
G1 X102.175 Y76.066 E.00532
G1 X102.4 Y76.369 E.00532
G1 X102.47 Y76.652 E.00411
G1 X102.472 Y103.202 E.37457
G1 X102.406 Y103.603 E.00573
G1 X102.208 Y103.917 E.00524
G1 X101.924 Y104.092 E.00472
G1 X101.836 Y104.112 E.00127
M204 S250
G1 X101.813 Y104.562 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X101.587 Y104.59 E.00298
G1 X78.498 Y104.59 E.30317
G1 X78.089 Y104.55 E.00539
G1 X77.738 Y104.405 E.005
G1 X77.446 Y104.165 E.00496
G3 X77.11 Y103.289 I1.366 J-1.026 E.01247
G1 X77.11 Y77.289 E.34139
G3 X77.132 Y76.536 I4.544 J-.246 E.00991
G1 X77.264 Y76.093 E.00606
G1 X77.491 Y75.787 E.00501
G1 X77.736 Y75.596 E.00408
G1 X78.089 Y75.45 E.00503
G1 X78.413 Y75.41 E.00428
G1 X101.483 Y75.41 E.30292
G1 X101.974 Y75.468 E.00649
G1 X102.315 Y75.629 E.00496
G1 X102.595 Y75.883 E.00496
G1 X102.79 Y76.207 E.00496
G1 X102.888 Y76.649 E.00594
G1 X102.89 Y102.649 E.34139
G3 X102.868 Y103.464 I-4.918 J.277 E.01072
G1 X102.736 Y103.907 E.00607
G1 X102.51 Y104.211 E.00498
G1 X102.264 Y104.404 E.0041
G1 X101.911 Y104.55 E.00503
G1 X101.872 Y104.555 E.00051
; WIPE_START
M204 S6000
G1 X101.587 Y104.59 E-.10919
G1 X99.874 Y104.59 E-.65081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.79 Y98.898 Z1.06 F42000
G1 X79.819 Y82.137 Z1.06
G1 Z.66
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14938
M204 S6000
G1 X79.568 Y82.069 E.00367
G1 X79.217 Y81.795 E.00627
G1 X79.001 Y81.406 E.00627
G3 X79.064 Y80.568 I1.288 J-.325 E.01207
G1 X79.336 Y80.216 E.00627
G1 X79.722 Y79.998 E.00627
G1 X80.057 Y79.937 E.0048
G1 X80.507 Y80.025 E.00646
G1 X80.849 Y80.264 E.00589
G1 X81.033 Y80.489 E.0041
G1 X81.165 Y80.796 E.00471
G1 X81.183 Y81.248 E.00638
G1 X81.023 Y81.667 E.00633
G1 X80.694 Y82.004 E.00665
G1 X80.336 Y82.161 E.00551
G1 X79.997 Y82.185 E.0048
G1 X79.876 Y82.152 E.00176
M204 S250
G1 X79.912 Y81.753 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.908 Y81.753 E.00006
G1 X79.653 Y81.636 E.00368
G1 X79.464 Y81.43 E.00368
G1 X79.371 Y81.151 E.00387
G1 X79.42 Y80.786 E.00483
G1 X79.58 Y80.556 E.00368
G1 X79.816 Y80.405 E.00367
G1 X80.092 Y80.358 E.00369
G1 X80.377 Y80.431 E.00386
G1 X80.657 Y80.671 E.00484
G1 X80.764 Y80.93 E.00368
G1 X80.762 Y81.21 E.00368
G1 X80.652 Y81.467 E.00368
G1 X80.45 Y81.662 E.00368
G1 X80.188 Y81.762 E.00368
G1 X79.972 Y81.755 E.00283
; WIPE_START
M204 S6000
G1 X79.908 Y81.753 E-.02446
G1 X79.653 Y81.636 E-.10646
G1 X79.464 Y81.43 E-.1064
G1 X79.371 Y81.151 E-.11188
G1 X79.42 Y80.786 E-.13984
G1 X79.58 Y80.556 E-.10649
G1 X79.816 Y80.405 E-.10635
G1 X79.966 Y80.38 E-.05812
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.06 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X77.699 Y77.413
G1 Z.66
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424208
G1 F14938
M204 S6000
G1 X79.886 Y79.6 E.04103
G2 X79.449 Y79.739 I.116 J1.122 E.00612
G1 X77.881 Y78.17 E.02943
G1 X77.881 Y78.746 E.00764
G1 X79.096 Y79.961 E.02281
G1 X78.875 Y80.201 E.00433
G1 X78.831 Y80.272 E.00111
G1 X77.881 Y79.321 E.01783
G1 X77.881 Y79.897 E.00764
G1 X78.663 Y80.68 E.01468
G1 X78.624 Y80.803 E.00172
G1 X78.601 Y81.193 E.00519
G1 X77.881 Y80.473 E.01352
G1 X77.881 Y81.048 E.00764
G1 X100.652 Y103.819 E.42725
G1 X101.227 Y103.819 E.00764
G1 X79.936 Y82.528 E.39948
G1 X79.996 Y82.539 E.0008
G1 X80.421 Y82.505 E.00567
G1 X80.469 Y82.486 E.00069
G1 X101.761 Y103.778 E.39951
G2 X102.065 Y103.506 I-.115 J-.433 E.00561
G1 X80.865 Y82.306 E.39777
G1 X80.968 Y82.244 E.00159
G1 X81.165 Y82.03 E.00386
G1 X102.119 Y102.984 E.39316
G1 X102.119 Y102.409 E.00764
G1 X81.404 Y81.693 E.38869
G1 X81.531 Y81.311 E.00534
G1 X81.535 Y81.249 E.00082
G1 X102.119 Y101.833 E.38622
G1 X102.119 Y101.257 E.00764
G1 X77.881 Y77.019 E.45479
M73 P13 R13
G3 X77.934 Y76.497 I1.261 J-.135 E.00702
G1 X102.119 Y100.682 E.45378
G1 X102.119 Y100.106 E.00764
G1 X78.236 Y76.223 E.44811
G3 X78.77 Y76.181 I.371 J1.288 E.00714
G1 X102.119 Y99.53 E.4381
G1 X102.119 Y98.954 E.00764
G1 X79.345 Y76.181 E.4273
G1 X79.921 Y76.181 E.00764
G1 X102.119 Y98.379 E.4165
G1 X102.119 Y97.803 E.00764
G1 X80.497 Y76.181 E.4057
G1 X81.072 Y76.181 E.00764
G1 X102.119 Y97.227 E.3949
G1 X102.119 Y96.652 E.00764
G1 X81.648 Y76.181 E.3841
G1 X82.223 Y76.181 E.00764
G1 X102.119 Y96.076 E.3733
G1 X102.119 Y95.5 E.00764
G1 X82.799 Y76.181 E.36249
G1 X83.375 Y76.181 E.00764
G1 X102.119 Y94.925 E.35169
G1 X102.119 Y94.349 E.00764
G1 X83.95 Y76.181 E.34089
G1 X84.526 Y76.181 E.00764
G1 X102.119 Y93.773 E.33009
G1 X102.119 Y93.198 E.00764
G1 X85.102 Y76.181 E.31929
G1 X85.677 Y76.181 E.00764
G1 X102.119 Y92.622 E.30849
G1 X102.119 Y92.046 E.00764
G1 X86.253 Y76.181 E.29769
G1 X86.829 Y76.181 E.00764
G1 X102.118 Y91.471 E.28688
G1 X102.118 Y90.895 E.00764
G1 X87.404 Y76.181 E.27608
G1 X87.98 Y76.181 E.00764
G1 X102.118 Y90.319 E.26528
G1 X102.118 Y89.744 E.00764
G1 X88.556 Y76.181 E.25448
G1 X89.131 Y76.181 E.00764
G1 X102.118 Y89.168 E.24368
G1 X102.118 Y88.592 E.00764
G1 X89.707 Y76.181 E.23288
G1 X90.282 Y76.181 E.00764
G1 X102.118 Y88.017 E.22207
G1 X102.118 Y87.441 E.00764
G1 X90.858 Y76.181 E.21127
G1 X91.434 Y76.181 E.00764
G1 X102.118 Y86.865 E.20047
G1 X102.118 Y86.29 E.00764
G1 X92.009 Y76.181 E.18967
G1 X92.585 Y76.181 E.00764
G1 X102.118 Y85.714 E.17887
G1 X102.118 Y85.138 E.00764
G1 X93.161 Y76.181 E.16807
G1 X93.736 Y76.181 E.00764
G1 X102.118 Y84.562 E.15727
G1 X102.118 Y83.987 E.00764
G1 X94.312 Y76.181 E.14646
G1 X94.888 Y76.181 E.00764
G1 X102.118 Y83.411 E.13566
G1 X102.118 Y82.835 E.00764
G1 X95.463 Y76.181 E.12486
G1 X96.039 Y76.181 E.00764
G1 X102.118 Y82.26 E.11406
G1 X102.118 Y81.684 E.00764
G1 X96.615 Y76.181 E.10326
G1 X97.19 Y76.181 E.00764
G1 X102.118 Y81.108 E.09246
G1 X102.118 Y80.533 E.00764
G1 X97.766 Y76.181 E.08166
G1 X98.341 Y76.181 E.00764
G1 X102.118 Y79.957 E.07085
G1 X102.118 Y79.381 E.00764
G1 X98.917 Y76.181 E.06005
G1 X99.493 Y76.181 E.00764
G1 X102.118 Y78.806 E.04925
G1 X102.118 Y78.23 E.00764
G1 X100.068 Y76.181 E.03845
G1 X100.644 Y76.181 E.00764
G1 X102.118 Y77.654 E.02765
G1 X102.118 Y77.079 E.00764
G1 X101.22 Y76.181 E.01685
G3 X101.883 Y76.277 I.163 J1.206 E.009
G3 X102.299 Y76.684 I-3.934 J4.438 E.00773
M204 S10000
G1 X100.257 Y104.001 F42000
G1 F14938
M204 S6000
G1 X77.881 Y81.624 E.41985
M73 P14 R13
G1 X77.881 Y82.2 E.00764
G1 X99.5 Y103.819 E.40565
G1 X98.925 Y103.819 E.00764
G1 X77.881 Y82.775 E.39485
G1 X77.881 Y83.351 E.00764
G1 X98.349 Y103.819 E.38405
G1 X97.774 Y103.819 E.00764
G1 X77.881 Y83.926 E.37325
G1 X77.881 Y84.502 E.00764
G1 X97.198 Y103.819 E.36245
G1 X96.622 Y103.819 E.00764
G1 X77.881 Y85.078 E.35165
G1 X77.881 Y85.653 E.00764
G1 X96.047 Y103.819 E.34085
G1 X95.471 Y103.819 E.00764
G1 X77.881 Y86.229 E.33005
G1 X77.881 Y86.805 E.00764
G1 X94.895 Y103.819 E.31924
G1 X94.32 Y103.819 E.00764
G1 X77.881 Y87.38 E.30844
G1 X77.881 Y87.956 E.00764
G1 X93.744 Y103.819 E.29764
G1 X93.168 Y103.819 E.00764
G1 X77.881 Y88.532 E.28684
G1 X77.881 Y89.107 E.00764
G1 X92.593 Y103.819 E.27604
G1 X92.017 Y103.819 E.00764
G1 X77.881 Y89.683 E.26524
G1 X77.881 Y90.259 E.00764
G1 X91.441 Y103.819 E.25444
G1 X90.866 Y103.819 E.00764
G1 X77.881 Y90.834 E.24364
G1 X77.881 Y91.41 E.00764
G1 X90.29 Y103.819 E.23284
G1 X89.715 Y103.819 E.00764
G1 X77.881 Y91.985 E.22204
G1 X77.881 Y92.561 E.00764
G1 X89.139 Y103.819 E.21124
G1 X88.563 Y103.819 E.00764
G1 X77.881 Y93.137 E.20044
G1 X77.881 Y93.712 E.00764
G1 X87.988 Y103.819 E.18964
G1 X87.412 Y103.819 E.00764
G1 X77.881 Y94.288 E.17883
G1 X77.881 Y94.864 E.00764
G1 X86.836 Y103.819 E.16803
G1 X86.261 Y103.819 E.00764
G1 X77.881 Y95.439 E.15723
G1 X77.881 Y96.015 E.00764
G1 X85.685 Y103.819 E.14643
G1 X85.109 Y103.819 E.00764
G1 X77.881 Y96.591 E.13563
G1 X77.881 Y97.166 E.00764
G1 X84.534 Y103.819 E.12483
G1 X83.958 Y103.819 E.00764
G1 X77.881 Y97.742 E.11403
G1 X77.881 Y98.318 E.00764
G1 X83.382 Y103.819 E.10323
G1 X82.807 Y103.819 E.00764
G1 X77.881 Y98.893 E.09243
G1 X77.881 Y99.469 E.00764
G1 X82.231 Y103.819 E.08163
G1 X81.656 Y103.819 E.00764
G1 X77.881 Y100.044 E.07083
G1 X77.881 Y100.62 E.00764
G1 X81.08 Y103.819 E.06003
G1 X80.504 Y103.819 E.00764
G1 X77.881 Y101.196 E.04923
G1 X77.881 Y101.771 E.00764
G1 X79.929 Y103.819 E.03843
G1 X79.353 Y103.819 E.00764
G1 X77.881 Y102.347 E.02762
G1 X77.881 Y102.923 E.00764
G1 X78.777 Y103.819 E.01682
G3 X78.139 Y103.736 I-.159 J-1.277 E.00864
G3 X77.706 Y103.323 I1.881 J-2.405 E.00795
; CHANGE_LAYER
; Z_HEIGHT: 0.74
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X78.139 Y103.736 E-.22738
G1 X78.288 Y103.798 E-.06135
G1 X78.46 Y103.819 E-.06591
G1 X78.777 Y103.819 E-.12067
G1 X78.248 Y103.29 E-.28469
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/100
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.06 I-.044 J1.216 P1  F42000
G1 X101.709 Y104.14 Z1.06
G1 Z.74
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14940
M204 S6000
G1 X101.562 Y104.172 E.00212
G1 X78.482 Y104.17 E.32561
G1 X78.101 Y104.113 E.00543
G1 X77.821 Y103.931 E.00471
G1 X77.616 Y103.671 E.00468
G1 X77.528 Y103.269 E.0058
G1 X77.528 Y76.738 E.3743
G1 X77.604 Y76.385 E.00509
G1 X77.787 Y76.086 E.00494
G1 X78.084 Y75.905 E.00491
G1 X78.438 Y75.828 E.00511
G1 X101.484 Y75.828 E.32513
G1 X101.851 Y75.872 E.00522
G1 X102.175 Y76.066 E.00533
G1 X102.381 Y76.325 E.00467
G1 X102.47 Y76.676 E.00511
G1 X102.472 Y103.202 E.37424
G1 X102.406 Y103.603 E.00573
G1 X102.207 Y103.918 E.00525
G1 X101.923 Y104.093 E.0047
G1 X101.767 Y104.127 E.00225
M204 S250
G1 X101.739 Y104.571 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X101.587 Y104.59 E.00201
G1 X78.482 Y104.588 E.30338
G1 X77.964 Y104.512 E.00687
G1 X77.686 Y104.372 E.00408
G1 X77.403 Y104.115 E.00503
G1 X77.188 Y103.709 E.00603
G1 X77.11 Y103.29 E.0056
G1 X77.11 Y77.29 E.34139
G3 X77.218 Y76.225 I2.88 J-.246 E.01413
G1 X77.397 Y75.906 E.0048
G1 X77.733 Y75.598 E.00599
G1 X78.089 Y75.45 E.00506
G1 X78.413 Y75.41 E.00427
G1 X101.484 Y75.41 E.30293
G1 X101.974 Y75.468 E.00648
G1 X102.315 Y75.629 E.00496
G3 X102.681 Y76.018 I-1.398 J1.684 E.00702
G3 X102.888 Y76.676 I-1.347 J.785 E.00914
G1 X102.89 Y102.676 E.34139
G3 X102.85 Y103.613 I-4.812 J.264 E.01234
G1 X102.736 Y103.907 E.00414
G1 X102.509 Y104.213 E.00499
G1 X102.264 Y104.404 E.00408
G1 X101.911 Y104.55 E.00503
G1 X101.799 Y104.564 E.00148
; WIPE_START
M204 S6000
G1 X101.587 Y104.59 E-.08089
G1 X99.8 Y104.59 E-.67911
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.727 Y98.888 Z1.14 F42000
G1 X79.841 Y82.157 Z1.14
G1 Z.74
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F14940
M204 S6000
G1 X79.756 Y82.142 E.00122
G1 X79.362 Y81.935 E.00628
G1 X79.079 Y81.592 E.00627
G1 X78.962 Y81.273 E.0048
G1 X78.952 Y80.964 E.00436
G1 X79.079 Y80.538 E.00628
G1 X79.362 Y80.194 E.00627
G1 X79.612 Y80.046 E.0041
G1 X80.057 Y79.937 E.00648
G1 X80.363 Y79.982 E.00436
G1 X80.761 Y80.181 E.00627
G3 X81.112 Y80.634 I-.746 J.941 E.00818
G1 X81.197 Y81.035 E.00578
G1 X81.114 Y81.492 E.00656
G1 X80.823 Y81.897 E.00704
G3 X80.337 Y82.161 I-.801 J-.897 E.00787
G1 X79.998 Y82.185 E.0048
G1 X79.9 Y82.168 E.0014
M204 S250
G1 X79.908 Y81.753 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.653 Y81.636 E.00368
G1 X79.464 Y81.43 E.00368
G1 X79.37 Y81.166 E.00368
G1 X79.386 Y80.886 E.00369
G1 X79.509 Y80.634 E.00368
G1 X79.735 Y80.445 E.00386
G1 X80.092 Y80.358 E.00483
G1 X80.365 Y80.422 E.00368
G1 X80.591 Y80.587 E.00368
G1 X80.736 Y80.828 E.00368
G1 X80.776 Y81.105 E.00368
G1 X80.696 Y81.388 E.00387
G1 X80.45 Y81.662 E.00483
G1 X80.189 Y81.762 E.00367
G1 X79.968 Y81.755 E.0029
; WIPE_START
M204 S6000
G1 X79.653 Y81.636 E-.1279
G1 X79.464 Y81.43 E-.10643
G1 X79.37 Y81.166 E-.10644
G1 X79.386 Y80.886 E-.10667
G1 X79.509 Y80.634 E-.10641
G1 X79.735 Y80.445 E-.11179
G1 X79.976 Y80.387 E-.09436
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.14 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X77.699 Y80.709
G1 Z.74
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424298
G1 F14940
M204 S6000
G1 X82.228 Y76.181 E.08498
G1 X81.652 Y76.181 E.00764
G1 X77.881 Y79.952 E.07077
G1 X77.881 Y79.376 E.00764
G1 X81.076 Y76.181 E.05997
G1 X80.5 Y76.181 E.00764
G1 X77.881 Y78.8 E.04916
G1 X77.881 Y78.225 E.00764
G1 X79.925 Y76.181 E.03836
G1 X79.349 Y76.181 E.00764
G1 X77.881 Y77.649 E.02755
G1 X77.881 Y77.073 E.00764
G1 X78.773 Y76.181 E.01675
G2 X78.126 Y76.269 I-.168 J1.178 E.00878
G1 X77.709 Y76.669 E.00765
M204 S10000
G1 X77.699 Y84.739 F42000
G1 F14940
M204 S6000
G1 X79.914 Y82.524 E.04157
G3 X79.458 Y82.405 I.067 J-1.187 E.0063
G1 X77.881 Y83.982 E.0296
G1 X77.881 Y83.406 E.00764
G1 X79.107 Y82.18 E.02301
G3 X78.845 Y81.867 I.644 J-.806 E.00546
G1 X77.881 Y82.831 E.01809
G1 X77.881 Y82.255 E.00764
G1 X78.662 Y81.474 E.01466
G1 X78.613 Y81.336 E.00193
G1 X78.599 Y80.961 E.00499
G1 X77.881 Y81.679 E.01348
G1 X77.881 Y81.103 E.00764
G1 X82.803 Y76.181 E.09238
G1 X83.379 Y76.181 E.00764
G1 X79.968 Y79.592 E.06401
G1 X80.061 Y79.584 E.00124
G1 X80.482 Y79.654 E.00566
G1 X83.955 Y76.181 E.06518
G1 X84.531 Y76.181 E.00764
G1 X80.876 Y79.835 E.06858
G3 X81.182 Y80.105 I-.556 J.937 E.00545
G1 X85.106 Y76.181 E.07365
G1 X85.682 Y76.181 E.00764
G1 X81.413 Y80.45 E.08013
G1 X81.441 Y80.504 E.00081
G1 X81.535 Y80.904 E.00545
G1 X86.258 Y76.181 E.08864
G1 X86.834 Y76.181 E.00764
G1 X77.881 Y85.134 E.16802
G1 X77.881 Y85.71 E.00764
G1 X87.409 Y76.181 E.17883
G1 X87.985 Y76.181 E.00764
G1 X77.881 Y86.285 E.18963
G1 X77.881 Y86.861 E.00764
G1 X88.561 Y76.181 E.20044
G1 X89.137 Y76.181 E.00764
G1 X77.881 Y87.437 E.21124
G1 X77.881 Y88.013 E.00764
G1 X89.713 Y76.181 E.22205
G1 X90.288 Y76.181 E.00764
G1 X77.881 Y88.588 E.23286
G1 X77.881 Y89.164 E.00764
G1 X90.864 Y76.181 E.24366
G1 X91.44 Y76.181 E.00764
G1 X77.881 Y89.74 E.25447
G1 X77.881 Y90.316 E.00764
G1 X92.016 Y76.181 E.26527
G1 X92.591 Y76.181 E.00764
G1 X77.881 Y90.891 E.27608
G1 X77.881 Y91.467 E.00764
G1 X93.167 Y76.181 E.28688
M73 P15 R13
G1 X93.743 Y76.181 E.00764
G1 X77.881 Y92.043 E.29769
G1 X77.881 Y92.619 E.00764
G1 X94.319 Y76.181 E.30849
G1 X94.894 Y76.181 E.00764
G1 X77.881 Y93.195 E.3193
G1 X77.881 Y93.77 E.00764
G1 X95.47 Y76.181 E.3301
G1 X96.046 Y76.181 E.00764
G1 X77.881 Y94.346 E.34091
G1 X77.881 Y94.922 E.00764
G1 X96.622 Y76.181 E.35172
G1 X97.198 Y76.181 E.00764
G1 X77.881 Y95.498 E.36252
G1 X77.881 Y96.073 E.00764
G1 X97.773 Y76.181 E.37333
G1 X98.349 Y76.181 E.00764
G1 X77.881 Y96.649 E.38413
G1 X77.881 Y97.225 E.00764
G1 X98.925 Y76.181 E.39494
G1 X99.501 Y76.181 E.00764
G1 X77.881 Y97.801 E.40574
G1 X77.881 Y98.376 E.00764
G1 X100.076 Y76.181 E.41655
G1 X100.652 Y76.181 E.00764
G1 X77.881 Y98.952 E.42735
G1 X77.881 Y99.528 E.00764
G1 X101.228 Y76.181 E.43816
G3 X101.747 Y76.213 I.151 J1.757 E.00693
G1 X101.764 Y76.221 E.00024
G1 X77.881 Y100.104 E.44821
G1 X77.881 Y100.68 E.00764
G1 X102.064 Y76.497 E.45384
G1 X102.117 Y76.687 E.00262
G1 X102.117 Y77.019 E.0044
G1 X77.881 Y101.255 E.45485
G1 X77.881 Y101.831 E.00764
G1 X102.118 Y77.594 E.45486
G1 X102.118 Y78.17 E.00764
G1 X77.881 Y102.407 E.45486
G1 X77.881 Y102.983 E.00764
G1 X102.118 Y78.746 E.45486
G1 X102.118 Y79.321 E.00764
G1 X77.933 Y103.506 E.45388
G2 X78.235 Y103.78 I.52 J-.269 E.00552
G1 X102.118 Y79.897 E.44821
G1 X102.118 Y80.473 E.00764
G1 X78.773 Y103.817 E.43811
G1 X79.349 Y103.818 E.00764
G1 X102.118 Y81.049 E.42731
G1 X102.118 Y81.624 E.00764
G1 X79.925 Y103.818 E.4165
G1 X80.5 Y103.818 E.00764
G1 X102.118 Y82.2 E.4057
G1 X102.118 Y82.776 E.00764
G1 X81.076 Y103.818 E.3949
G1 X81.652 Y103.818 E.00764
G1 X102.118 Y83.352 E.38409
G1 X102.118 Y83.927 E.00764
G1 X82.227 Y103.818 E.37329
G1 X82.803 Y103.818 E.00764
G1 X102.118 Y84.503 E.36248
G1 X102.118 Y85.079 E.00764
G1 X83.379 Y103.818 E.35168
G1 X83.955 Y103.818 E.00764
G1 X102.118 Y85.654 E.34088
G1 X102.118 Y86.23 E.00764
G1 X84.53 Y103.818 E.33007
G1 X85.106 Y103.818 E.00764
G1 X102.118 Y86.806 E.31927
G1 X102.118 Y87.382 E.00764
G1 X85.682 Y103.818 E.30846
G1 X86.258 Y103.818 E.00764
G1 X102.118 Y87.957 E.29766
G1 X102.118 Y88.533 E.00764
G1 X86.833 Y103.818 E.28686
G1 X87.409 Y103.818 E.00764
G1 X102.118 Y89.109 E.27605
G1 X102.118 Y89.685 E.00764
G1 X87.985 Y103.818 E.26525
G1 X88.56 Y103.818 E.00764
G1 X102.118 Y90.26 E.25444
G1 X102.118 Y90.836 E.00764
G1 X89.136 Y103.818 E.24364
G1 X89.712 Y103.818 E.00764
G1 X102.118 Y91.412 E.23284
G1 X102.119 Y91.987 E.00764
G1 X90.288 Y103.818 E.22203
G1 X90.863 Y103.818 E.00764
G1 X102.119 Y92.563 E.21123
G1 X102.119 Y93.139 E.00764
G1 X91.439 Y103.818 E.20042
G1 X92.015 Y103.819 E.00764
G1 X102.119 Y93.715 E.18962
G1 X102.119 Y94.29 E.00764
G1 X92.59 Y103.819 E.17882
G1 X93.166 Y103.819 E.00764
G1 X102.119 Y94.866 E.16801
G1 X102.119 Y95.442 E.00764
G1 X93.742 Y103.819 E.15721
G1 X94.318 Y103.819 E.00764
G1 X102.119 Y96.018 E.1464
G1 X102.119 Y96.593 E.00764
G1 X94.893 Y103.819 E.1356
G1 X95.469 Y103.819 E.00764
G1 X102.119 Y97.169 E.1248
G1 X102.119 Y97.745 E.00764
G1 X96.045 Y103.819 E.11399
G1 X96.621 Y103.819 E.00764
G1 X102.119 Y98.321 E.10319
G1 X102.119 Y98.896 E.00764
G1 X97.196 Y103.819 E.09238
G1 X97.772 Y103.819 E.00764
G1 X102.119 Y99.472 E.08158
G1 X102.119 Y100.048 E.00764
G1 X98.348 Y103.819 E.07078
G1 X98.923 Y103.819 E.00764
G1 X102.119 Y100.623 E.05997
G1 X102.119 Y101.199 E.00764
G1 X99.499 Y103.819 E.04917
G1 X100.075 Y103.819 E.00764
G1 X102.119 Y101.775 E.03837
G1 X102.119 Y102.351 E.00764
G1 X100.651 Y103.819 E.02756
G1 X101.226 Y103.819 E.00764
G1 X102.119 Y102.926 E.01676
G1 X102.119 Y103.24 E.00416
G3 X101.954 Y103.667 I-.603 J.012 E.00623
G1 X101.631 Y103.991 E.00607
; CHANGE_LAYER
; Z_HEIGHT: 0.82
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X101.954 Y103.667 E-.17394
G1 X102.055 Y103.532 E-.06412
G1 X102.097 Y103.424 E-.04391
G1 X102.119 Y103.24 E-.07035
G1 X102.119 Y102.926 E-.11924
G1 X101.583 Y103.463 E-.28844
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/100
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.14 I.947 J-.764 P1  F42000
G1 X82.919 Y80.331 Z1.14
G1 Z.82
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
G1 X80.03 Y81.767 Z1.22 F42000
G1 Z.82
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X79.705 Y81.669 E.00446
G1 X79.464 Y81.43 E.00445
G1 X79.37 Y81.166 E.00368
G1 X79.386 Y80.886 E.00368
G1 X79.509 Y80.634 E.00368
G1 X79.735 Y80.445 E.00387
G1 X79.998 Y80.364 E.00362
G1 X80.291 Y80.393 E.00386
G1 X80.567 Y80.558 E.00422
G1 X80.739 Y80.843 E.00437
G1 X80.758 Y81.222 E.00498
G1 X80.601 Y81.53 E.00454
G1 X80.324 Y81.725 E.00445
G1 X80.089 Y81.762 E.00313
; WIPE_START
M204 S6000
G1 X79.705 Y81.669 E-.15017
G1 X79.464 Y81.43 E-.12873
G1 X79.37 Y81.166 E-.1065
G1 X79.386 Y80.886 E-.10656
G1 X79.509 Y80.634 E-.10646
G1 X79.735 Y80.445 E-.11193
G1 X79.86 Y80.407 E-.04964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.139 Y87.299 Z1.22 F42000
G1 X84.9 Y91 Z1.22
G1 Z.82
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.357168
M73 P16 R13
G1 F18000
M204 S6000
G1 X84.9 Y92 E.01108
; WIPE_START
G1 X84.9 Y91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.9 Y96 Z1.22 F42000
G1 Z.82
G1 E.8 F1800
G1 F18000
M204 S6000
G1 X84.9 Y97 E.01108
; WIPE_START
G1 X84.9 Y96 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.71 Y99.447 Z1.22 F42000
G1 X101.817 Y104.562 Z1.22
G1 Z.82
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F12000
M204 S5000
G1 X101.587 Y104.59 E.00303
G1 X78.482 Y104.588 E.30338
G3 X77.571 Y104.267 I.006 J-1.469 E.01292
G1 X77.319 Y103.983 E.00499
G1 X77.192 Y103.706 E.004
G1 X77.11 Y103.292 E.00554
G1 X77.11 Y77.292 E.34139
G3 X77.15 Y76.387 I4.656 J-.247 E.01191
G1 X77.264 Y76.092 E.00415
G1 X77.489 Y75.789 E.00496
G1 X77.792 Y75.564 E.00495
G3 X78.413 Y75.41 I.616 J1.154 E.00849
G1 X101.484 Y75.41 E.30293
G1 X101.974 Y75.468 E.00647
G1 X102.316 Y75.629 E.00497
G3 X102.68 Y76.016 I-1.413 J1.699 E.007
G1 X102.808 Y76.295 E.00403
G1 X102.888 Y76.676 E.0051
G1 X102.89 Y102.676 E.34139
G3 X102.868 Y103.466 I-4.746 J.264 E.01039
G1 X102.737 Y103.905 E.00602
G1 X102.507 Y104.215 E.00507
G1 X102.265 Y104.404 E.00403
G1 X101.911 Y104.55 E.00503
G1 X101.876 Y104.554 E.00046
; WIPE_START
M204 S6000
G1 X101.587 Y104.59 E-.11056
G1 X99.878 Y104.59 E-.64944
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.404 Y96.976 Z1.22 F42000
G1 X101.864 Y75.828 Z1.22
G1 Z.82
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.405728
G1 F18000
M204 S6000
G1 X101.559 Y75.806 E.00387
G1 X86.444 Y75.806 E.19143
; WIPE_START
G1 X88.444 Y75.806 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.908 Y83.419 Z1.22 F42000
G1 X86.444 Y104.194 Z1.22
G1 Z.82
G1 E.8 F1800
; LINE_WIDTH: 0.404668
G1 F18000
M204 S6000
G1 X87.493 Y104.194 E.01325
; LINE_WIDTH: 0.404818
G1 X89.493 Y104.194 E.02527
; LINE_WIDTH: 0.404968
G1 X91.493 Y104.194 E.02528
; LINE_WIDTH: 0.405128
G1 X93.493 Y104.194 E.02529
; LINE_WIDTH: 0.405278
G1 X95.493 Y104.194 E.0253
; LINE_WIDTH: 0.405438
G1 X97.493 Y104.194 E.02531
; LINE_WIDTH: 0.405588
G1 X99.493 Y104.194 E.02532
; LINE_WIDTH: 0.405748
G1 X101.493 Y104.194 E.02533
G1 X101.815 Y104.179 E.00409
; WIPE_START
G1 X101.493 Y104.194 E-.12269
G1 X99.816 Y104.194 E-.63731
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.22 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X102.667 Y76.746
G1 Z.82
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
M204 S2000
G1 X101.941 Y76.02 E.01348
G1 X101.371 Y76.02
G1 X102.667 Y77.316 E.02406
G1 X102.667 Y77.885
G1 X100.801 Y76.02 E.03464
G1 X100.232 Y76.02
G1 X102.667 Y78.455 E.04522
G1 X102.667 Y79.025
G1 X99.662 Y76.02 E.05579
G1 X99.092 Y76.02
G1 X102.667 Y79.595 E.06637
G1 X102.667 Y80.164
G1 X98.523 Y76.02 E.07695
G1 X97.953 Y76.02
G1 X102.667 Y80.734 E.08753
G1 X102.667 Y81.304
G1 X97.383 Y76.02 E.09811
G1 X96.814 Y76.02
G1 X102.667 Y81.873 E.10869
G1 X102.667 Y82.443
G1 X96.244 Y76.02 E.11927
G1 X95.674 Y76.02
G1 X102.667 Y83.013 E.12985
G1 X102.667 Y83.583
G1 X95.105 Y76.02 E.14043
G1 X94.535 Y76.02
G1 X102.667 Y84.152 E.15101
G1 X102.667 Y84.722
G1 X93.965 Y76.02 E.16159
G1 X93.396 Y76.02
G1 X102.667 Y85.292 E.17217
G1 X102.667 Y85.862
G1 X92.826 Y76.02 E.18275
G1 X92.256 Y76.02
G1 X102.667 Y86.431 E.19332
G1 X102.667 Y87.001
G1 X91.686 Y76.02 E.2039
G1 X91.117 Y76.02
G1 X102.667 Y87.571 E.21448
G1 X102.667 Y88.14
G1 X90.547 Y76.02 E.22506
G1 X89.977 Y76.02
G1 X102.667 Y88.71 E.23564
G1 X102.668 Y89.28
G1 X89.408 Y76.02 E.24622
G1 X88.838 Y76.02
G1 X102.668 Y89.85 E.2568
G1 X102.668 Y90.419
G1 X88.268 Y76.02 E.26738
G1 X87.699 Y76.02
G1 X102.668 Y90.989 E.27796
G1 X102.668 Y91.559
G1 X87.129 Y76.02 E.28854
G1 X86.559 Y76.02
G1 X102.668 Y92.129 E.29912
G1 X102.668 Y92.698
G1 X85.601 Y75.632 E.31691
G1 X85.031 Y75.632
G1 X102.668 Y93.268 E.32749
G1 X102.668 Y93.838
G1 X84.462 Y75.632 E.33807
G1 X83.892 Y75.632
G1 X102.668 Y94.407 E.34865
G1 X102.668 Y94.977
G1 X83.322 Y75.632 E.35923
G1 X82.753 Y75.632
G1 X102.668 Y95.547 E.36981
G1 X102.668 Y96.117
G1 X82.183 Y75.632 E.38039
G1 X81.613 Y75.632
G1 X102.668 Y96.686 E.39097
G1 X102.668 Y97.256
G1 X81.044 Y75.632 E.40155
G1 X80.474 Y75.632
G1 X102.668 Y97.826 E.41213
G1 X102.668 Y98.396
G1 X79.904 Y75.632 E.4227
G1 X79.334 Y75.632
G1 X102.668 Y98.965 E.43328
G1 X102.668 Y99.535
G1 X78.765 Y75.632 E.44386
M73 P17 R13
G1 X78.22 Y75.657
G1 X82.794 Y80.23 E.08492
G1 X83.046 Y80.482
G1 X102.668 Y100.105 E.36437
G1 X102.668 Y100.674
G1 X77.816 Y75.822 E.46148
G1 X77.53 Y76.106
G1 X102.668 Y101.244 E.46679
G1 X102.668 Y101.814
G1 X77.359 Y76.504 E.46997
G1 X77.332 Y77.047
G1 X80.595 Y80.31 E.0606
G1 X79.88 Y80.165
G1 X77.332 Y77.616 E.04733
G1 X77.332 Y78.186
G1 X79.489 Y80.344 E.04007
G1 X79.239 Y80.663
G1 X77.332 Y78.756 E.03542
G1 X77.332 Y79.326
G1 X79.149 Y81.143 E.03374
; WIPE_START
M204 S6000
G1 X77.734 Y79.728 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.823 Y80.538 Z1.22 F42000
G1 Z.82
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X102.668 Y102.384 E.40565
G1 X102.668 Y102.953
G1 X80.976 Y81.261 E.40281
G1 X80.793 Y81.648
G1 X102.641 Y103.496 E.40569
G1 X102.469 Y103.894
G1 X80.474 Y81.898 E.40844
G1 X79.986 Y81.98
G1 X101.986 Y103.98 E.40851
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
G1 X84.83 Y96.509
G1 X77.332 Y89.01 E.13924
; WIPE_START
M204 S6000
G1 X78.746 Y90.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.395 Y95.557 Z1.22 F42000
G1 X84.97 Y96.079 Z1.22
G1 Z.82
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
G1 X91.502 Y103.726 Z1.22 F42000
G1 X91.732 Y103.98 Z1.22
G1 Z.82
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
M73 P18 R13
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
G1 X83.402 Y98.226 Z1.22 F42000
G1 X85.033 Y96.016 Z1.22
G1 Z.82
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
G1 X84.851 Y92.169 Z1.22 F42000
G1 Z.82
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
G1 X81.506 Y85.308 Z1.22 F42000
G1 X79.918 Y82.049 Z1.22
G1 Z.82
G1 E.8 F1800
; LINE_WIDTH: 0.115373
G1 F18000
M204 S6000
G3 X79.729 Y81.948 I.626 J-1.397 E.00069
; LINE_WIDTH: 0.083586
G1 X79.615 Y81.865 E.0003
M204 S10000
G1 X79.258 Y81.509 F42000
; LINE_WIDTH: 0.0821559
G1 F18000
M204 S6000
G1 X79.203 Y81.427 E.00021
; LINE_WIDTH: 0.127114
G3 X79.072 Y81.219 I2.001 J-1.406 E.00088
; WIPE_START
G1 X79.203 Y81.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.199 Y75.656 Z1.22 F42000
G1 Z.82
G1 E.8 F1800
; LINE_WIDTH: 0.076976
G1 F18000
M204 S6000
G1 X78.021 Y75.742 E.00038
M204 S10000
G1 X77.444 Y76.305 F42000
; LINE_WIDTH: 0.0716314
G1 F18000
M204 S6000
G1 X77.358 Y76.483 E.00035
; WIPE_START
G1 X77.444 Y76.305 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.618 Y83.936 Z1.22 F42000
G1 X78.083 Y104.313 Z1.22
G1 Z.82
G1 E.8 F1800
; LINE_WIDTH: 0.0724944
G1 F18000
M204 S6000
G1 X78.04 Y104.29 E.00009
; LINE_WIDTH: 0.0989483
G1 X77.941 Y104.218 E.00033
; LINE_WIDTH: 0.137908
G1 X77.841 Y104.146 E.00048
; LINE_WIDTH: 0.154587
G3 X77.383 Y103.64 I1.638 J-1.944 E.00307
; WIPE_START
G1 X77.616 Y103.932 E-.41439
G1 X77.841 Y104.146 E-.34561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.472 Y104.328 Z1.22 F42000
G1 X86.25 Y104.346 Z1.22
G1 Z.82
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
G1 X90.103 Y97.758 Z1.22 F42000
G1 X102.617 Y76.36 Z1.22
G1 Z.82
G1 E.8 F1800
; LINE_WIDTH: 0.144852
G1 F18000
M204 S6000
G1 X102.329 Y76 E.00192
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.08
; WIPE_START
G1 F18000
G1 X102.617 Y76.36 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/100
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.22 I-1.217 J.004 P1  F42000
G1 X102.702 Y103.922 Z1.22
G1 Z.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.407748
G1 F2097
M204 S5000
G1 X102.625 Y104.079 E.00223
; LINE_WIDTH: 0.406368
G1 X102.343 Y104.351 E.00496
; LINE_WIDTH: 0.410668
G1 X101.937 Y104.544 E.00578
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
G1 X78.424 Y104.596 E.04322
G1 X77.982 Y104.516 E.00573
; LINE_WIDTH: 0.406448
G1 X77.607 Y104.31 E.00543
; LINE_WIDTH: 0.411608
G1 X77.309 Y103.988 E.00564
; LINE_WIDTH: 0.415258
G1 X77.158 Y103.636 E.00497
G1 X77.104 Y103.287 E.00458
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.3389
G1 X77.181 Y76.285 E.00569
; LINE_WIDTH: 0.403818
G1 X77.39 Y75.907 E.00544
; LINE_WIDTH: 0.408418
G1 X77.697 Y75.619 E.00537
; LINE_WIDTH: 0.412788
G1 X78.064 Y75.457 E.00517
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410258
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.412 Y75.405 E.0256
; LINE_WIDTH: 0.409338
G1 X84.412 Y75.404 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.404 E.01783
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.603 J-1952.803 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.574 Y75.404 I.348 J-43.286 E.01539
; LINE_WIDTH: 0.407088
G1 X101.881 Y75.445 E.00394
G1 X102.27 Y75.6 E.00532
; LINE_WIDTH: 0.415148
G1 X102.579 Y75.865 E.00528
G1 X102.771 Y76.148 E.00444
; LINE_WIDTH: 0.409398
G1 X102.894 Y76.646 E.00656
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
G1 X102.896 Y103.276 E.03356
G1 X102.856 Y103.612 E.00432
; LINE_WIDTH: 0.407748
G1 X102.729 Y103.868 E.00364
; WIPE_START
G1 F12000
M204 S6000
G1 X102.625 Y104.079 E-.08947
G1 X102.343 Y104.351 E-.14861
G1 X101.937 Y104.544 E-.17111
G1 X101.6 Y104.594 E-.12915
G1 X101.017 Y104.594 E-.22165
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.49 Y103.76 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2097
M204 S5000
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.14 Y104.161 E.00367
; LINE_WIDTH: 0.408058
G1 X77.797 Y103.968 E.00502
G1 X77.571 Y103.645 E.00502
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.275 E.00481
G1 X77.496 Y76.724 E.33875
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411258
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410258
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409798
G1 X82.424 Y75.797 E.0256
; LINE_WIDTH: 0.409338
G1 X84.424 Y75.796 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.49 Y76.24 E.20326
G1 X101.498 Y75.939 E.00395
G1 X101.635 Y75.808 E.00249
; LINE_WIDTH: 0.407538
M73 P19 R13
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
G1 X102.504 Y103.276 E.03356
G1 X102.473 Y103.518 E.00312
; LINE_WIDTH: 0.407308
G1 X102.298 Y103.868 E.00497
; LINE_WIDTH: 0.405988
G1 X102.028 Y104.091 E.00445
; LINE_WIDTH: 0.404188
G1 X101.715 Y104.196 E.00416
; LINE_WIDTH: 0.409128
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.492 Y103.82 E.00316
M204 S10000
G1 X101.099 Y104.175 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.444348
G1 F2097
M204 S6000
G1 X86.402 Y104.175 E.20464
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y97.209 Z1.3 F42000
G1 X101.099 Y75.825 Z1.3
G1 Z.9
G1 E.8 F1800
; LINE_WIDTH: 0.444308
G1 F2097
M204 S6000
G1 X86.402 Y75.825 E.20462
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.155 Y80.21 Z1.3 F42000
G1 X79.965 Y81.747 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.387628
G1 F2097
M204 S5000
G1 X79.653 Y81.613 E.0041
G1 X79.465 Y81.397 E.00346
; LINE_WIDTH: 0.385708
G1 X79.383 Y81.136 E.00329
G1 X79.41 Y80.864 E.00329
G1 X79.54 Y80.623 E.00329
G1 X79.753 Y80.452 E.00329
; LINE_WIDTH: 0.390808
G1 X80.016 Y80.374 E.00333
G1 X80.288 Y80.409 E.00335
; LINE_WIDTH: 0.388248
G1 X80.526 Y80.545 E.00331
; LINE_WIDTH: 0.398428
G1 X80.725 Y80.827 E.00428
G1 X80.76 Y81.025 E.0025
; LINE_WIDTH: 0.404628
G1 X80.694 Y81.368 E.00442
; LINE_WIDTH: 0.405868
G1 X80.556 Y81.56 E.00299
G1 X80.259 Y81.73 E.00433
; LINE_WIDTH: 0.388608
G1 X80.025 Y81.746 E.00285
; WIPE_START
G1 F12000
M204 S6000
G1 X79.653 Y81.613 E-.1499
G1 X79.465 Y81.397 E-.10884
G1 X79.383 Y81.136 E-.104
G1 X79.41 Y80.864 E-.10401
G1 X79.54 Y80.623 E-.10393
G1 X79.753 Y80.452 E-.10403
G1 X79.969 Y80.388 E-.08529
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.3 F42000
G1 Z.9
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2097
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
G1 F2097
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
G1 X84.173 Y87.856 Z1.3 F42000
G1 X84.654 Y90.754 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2097
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.3 F42000
G1 Z.9
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
G3 Z1.3 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.98
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 11/100
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
G1 X102.715 Y103.906 F42000
G1 Z.98
G1 E.8 F1800
; LINE_WIDTH: 0.407068
G1 F2112
M204 S5000
G1 X102.651 Y104.038 E.00187
; LINE_WIDTH: 0.406798
G1 X102.351 Y104.345 E.00544
; LINE_WIDTH: 0.410648
G1 X101.937 Y104.544 E.0059
G1 X101.6 Y104.594 E.00436
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.589 I-3.534 J417.953 E.08537
G1 X87.099 Y104.589 E.10504
G2 X85.809 Y104.595 I-.353 J63.64 E.01694
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.115 Y104.552 E.00323
; LINE_WIDTH: 0.411578
G1 X77.708 Y104.388 E.00565
; LINE_WIDTH: 0.415288
G1 X77.421 Y104.135 E.00496
G1 X77.206 Y103.784 E.00534
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00644
G1 X77.104 Y76.724 E.33894
G1 X77.181 Y76.284 E.00569
; LINE_WIDTH: 0.403798
G1 X77.39 Y75.907 E.00544
; LINE_WIDTH: 0.408428
G1 X77.697 Y75.619 E.00537
; LINE_WIDTH: 0.412778
G1 X78.064 Y75.457 E.00517
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409808
G1 X82.412 Y75.405 E.0256
; LINE_WIDTH: 0.409348
G1 X84.412 Y75.404 E.02557
; LINE_WIDTH: 0.408888
G1 X85.808 Y75.404 E.01783
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.41 I5.603 J-1949.378 E.11284
G1 X100.402 Y75.41 E.07878
G2 X101.575 Y75.404 I.348 J-43.11 E.0154
; LINE_WIDTH: 0.407038
G1 X101.881 Y75.445 E.00393
G1 X102.27 Y75.6 E.00531
; LINE_WIDTH: 0.412538
M73 P19 R12
G1 X102.577 Y75.861 E.00519
; LINE_WIDTH: 0.414148
G1 X102.794 Y76.208 E.0053
G1 X102.894 Y76.646 E.00581
; LINE_WIDTH: 0.409398
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
G1 X102.896 Y102.646 E.02552
G3 X102.856 Y103.615 I-4.163 J.315 E.0124
; LINE_WIDTH: 0.407068
G1 X102.741 Y103.852 E.00335
; WIPE_START
G1 F12000
M204 S6000
G1 X102.651 Y104.038 E-.0788
G1 X102.351 Y104.345 E-.16289
G1 X101.937 Y104.544 E-.17477
G1 X101.6 Y104.594 E-.12918
G1 X101.036 Y104.594 E-.21436
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.49 Y103.76 Z1.38 F42000
G1 Z.98
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2112
M204 S5000
G1 X86.01 Y103.76 E.20326
G1 X86.003 Y104.063 E.00398
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.411538
G1 X78.116 Y104.152 E.00327
G1 X77.798 Y103.967 E.00473
; LINE_WIDTH: 0.406418
G1 X77.569 Y103.645 E.005
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00475
G1 X77.496 Y76.724 E.33882
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411248
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.891 E.00404
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409798
G1 X82.424 Y75.797 E.0256
; LINE_WIDTH: 0.409338
G1 X84.424 Y75.796 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.01 Y76.24 E.00398
G1 X101.49 Y76.24 E.20326
G1 X101.498 Y75.939 E.00395
G1 X101.635 Y75.808 E.00249
; LINE_WIDTH: 0.407558
G1 X101.853 Y75.835 E.00279
G1 X102.163 Y76 E.00447
; LINE_WIDTH: 0.405188
G1 X102.391 Y76.274 E.00451
; LINE_WIDTH: 0.409398
G1 X102.501 Y76.646 E.00496
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
G1 X102.504 Y103.276 E.03356
G1 X102.465 Y103.551 E.00355
; LINE_WIDTH: 0.405758
M73 P20 R12
G1 X102.322 Y103.835 E.00403
; LINE_WIDTH: 0.404178
G1 X102.028 Y104.091 E.00492
G1 X101.715 Y104.196 E.00416
; LINE_WIDTH: 0.409108
G1 X101.635 Y104.193 E.00103
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.0025
G1 X101.492 Y103.82 E.00316
; WIPE_START
G1 F12000
M204 S6000
G1 X99.492 Y103.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.862 Y104.023 Z1.38 F42000
G1 X86.402 Y104.174 Z1.38
G1 Z.98
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2112
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
G1 X99.636 Y96.561 Z1.38 F42000
G1 X101.099 Y75.825 Z1.38
G1 Z.98
G1 E.8 F1800
; LINE_WIDTH: 0.444208
G1 F2112
M204 S6000
G1 X100.402 Y75.825 E.0097
; LINE_WIDTH: 0.444308
G1 X86.402 Y75.825 E.19492
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.121 Y80.161 Z1.38 F42000
G1 X79.86 Y81.722 Z1.38
G1 Z.98
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.390828
G1 F2112
M204 S5000
G1 X79.852 Y81.721 E.00009
; LINE_WIDTH: 0.388188
G1 X79.614 Y81.585 E.00331
G1 X79.448 Y81.367 E.00331
; LINE_WIDTH: 0.404528
G1 X79.377 Y81.031 E.00434
G1 X79.471 Y80.715 E.00416
; LINE_WIDTH: 0.387608
G1 X79.724 Y80.466 E.00428
; LINE_WIDTH: 0.399508
G1 X80.065 Y80.371 E.00441
; LINE_WIDTH: 0.408268
G1 X80.355 Y80.434 E.00378
G1 X80.579 Y80.594 E.0035
; LINE_WIDTH: 0.405248
G1 X80.722 Y80.828 E.00347
G1 X80.754 Y81.166 E.0043
; LINE_WIDTH: 0.388608
G1 X80.636 Y81.462 E.00386
; LINE_WIDTH: 0.387628
G1 X80.398 Y81.671 E.00382
; LINE_WIDTH: 0.390828
G1 X80.124 Y81.756 E.00349
G1 X79.919 Y81.73 E.00252
; WIPE_START
G1 F12000
M204 S6000
G1 X79.852 Y81.721 E-.02571
G1 X79.614 Y81.585 E-.10406
G1 X79.448 Y81.367 E-.10414
G1 X79.377 Y81.031 E-.13069
G1 X79.471 Y80.715 E-.12512
G1 X79.724 Y80.466 E-.13483
G1 X80.065 Y80.371 E-.13446
G1 X80.068 Y80.372 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.37 Y80.207 Z1.38 F42000
G1 Z.98
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
G1 X84.173 Y87.856 Z1.38 F42000
G1 X84.654 Y90.754 Z1.38
G1 Z.98
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2112
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.38 F42000
G1 Z.98
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
G3 Z1.38 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.06
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 12/100
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.06
G1 E.8 F1800
; LINE_WIDTH: 0.497458
G1 F1843
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.14 Y104.161 E.00367
; LINE_WIDTH: 0.406838
G1 X77.8 Y103.971 E.00495
G1 X77.59 Y103.69 E.00446
; LINE_WIDTH: 0.404618
G1 X77.501 Y103.37 E.0042
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
G1 X77.496 Y76.729 E.00698
G1 X77.551 Y76.403 E.00422
; LINE_WIDTH: 0.404578
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.408238
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410258
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409798
G1 X82.42 Y75.797 E.0256
; LINE_WIDTH: 0.409338
G1 X84.42 Y75.796 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.450231
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491895
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533558
G1 X86.03 Y75.858 E.00129
G1 X86.065 Y75.983 E.00218
G1 X101.251 Y75.983 E.25562
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.088 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488858
G1 X101.637 Y75.824 E.0013
; LINE_WIDTH: 0.444198
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.408218
G1 X102.135 Y75.976 E.00572
G1 X102.391 Y76.274 E.00501
; LINE_WIDTH: 0.409398
G1 X102.501 Y76.646 E.00496
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
G1 X102.504 Y103.271 E.0335
G1 X102.461 Y103.561 E.00373
; LINE_WIDTH: 0.407318
G1 X102.272 Y103.897 E.0049
; LINE_WIDTH: 0.410548
G1 X102.007 Y104.102 E.00431
; LINE_WIDTH: 0.417378
G1 X101.638 Y104.198 E.00497
; LINE_WIDTH: 0.456111
G1 X101.582 Y104.178 E.00086
; LINE_WIDTH: 0.494845
G1 X101.526 Y104.157 E.00093
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00101
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05414
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.716 Y103.918 Z1.46 F42000
G1 Z1.06
G1 E.8 F1800
; LINE_WIDTH: 0.410998
G1 F1843
M204 S5000
G1 X102.687 Y103.991 E.00101
G1 X102.54 Y104.172 E.00299
; LINE_WIDTH: 0.406138
G1 X102.214 Y104.433 E.00529
G1 X101.762 Y104.584 E.00605
; LINE_WIDTH: 0.448671
G1 X101.591 Y104.567 E.00241
; LINE_WIDTH: 0.491125
G1 X101.421 Y104.55 E.00264
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00288
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X77.982 Y104.516 E.00573
; LINE_WIDTH: 0.406388
G1 X77.607 Y104.31 E.00544
; LINE_WIDTH: 0.408278
G1 X77.318 Y104.002 E.00537
; LINE_WIDTH: 0.412598
G1 X77.155 Y103.631 E.00523
G1 X77.105 Y103.288 E.00447
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
G3 X77.161 Y76.324 I3.458 J-.28 E.01236
; LINE_WIDTH: 0.406448
G1 X77.382 Y75.914 E.00591
; LINE_WIDTH: 0.405378
G1 X77.716 Y75.611 E.00571
; LINE_WIDTH: 0.411308
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
; LINE_WIDTH: 0.450231
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491895
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533558
G1 X86.251 Y75.467 E.00251
G1 X101.251 Y75.467 E.25248
G1 X101.359 Y75.448 E.00185
; LINE_WIDTH: 0.495251
G1 X101.468 Y75.429 E.00171
; LINE_WIDTH: 0.456985
G1 X101.576 Y75.41 E.00158
; LINE_WIDTH: 0.418718
G1 X101.881 Y75.445 E.00402
; LINE_WIDTH: 0.410718
G1 X102.292 Y75.613 E.00569
; LINE_WIDTH: 0.411478
G1 X102.577 Y75.861 E.00486
; LINE_WIDTH: 0.414098
G1 X102.78 Y76.185 E.00494
G1 X102.894 Y76.646 E.00615
; LINE_WIDTH: 0.409398
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
M73 P21 R12
G1 X102.896 Y103.271 E.0335
G1 X102.859 Y103.557 E.00368
; LINE_WIDTH: 0.410998
G1 X102.738 Y103.863 E.00421
; WIPE_START
G1 F12000
M204 S6000
G1 X102.687 Y103.991 E-.0526
G1 X102.54 Y104.172 E-.08858
G1 X102.214 Y104.433 E-.15868
G1 X101.762 Y104.584 E-.18134
G1 X101.591 Y104.567 E-.065
G1 X101.421 Y104.55 E-.065
G1 X101.251 Y104.533 E-.06499
G1 X101.03 Y104.533 E-.08382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.845 Y98.933 Z1.46 F42000
G1 X79.923 Y81.739 Z1.46
G1 Z1.06
G1 E.8 F1800
; LINE_WIDTH: 0.388908
G1 F1843
M204 S5000
G1 X79.622 Y81.59 E.00407
; LINE_WIDTH: 0.398008
G1 X79.421 Y81.314 E.00423
G1 X79.385 Y80.973 E.00425
; LINE_WIDTH: 0.391188
G1 X79.479 Y80.706 E.00345
; LINE_WIDTH: 0.388668
G1 X79.676 Y80.497 E.00349
; LINE_WIDTH: 0.392268
G1 X80.002 Y80.377 E.00425
G1 X80.288 Y80.409 E.00352
; LINE_WIDTH: 0.388228
G1 X80.526 Y80.545 E.00331
; LINE_WIDTH: 0.398508
G1 X80.725 Y80.827 E.00429
G1 X80.76 Y81.024 E.00249
; LINE_WIDTH: 0.410448
G1 X80.707 Y81.333 E.00401
G1 X80.554 Y81.561 E.00353
; LINE_WIDTH: 0.405228
G1 X80.26 Y81.73 E.00429
; LINE_WIDTH: 0.388628
G1 X79.983 Y81.737 E.00335
; WIPE_START
G1 F12000
M204 S6000
G1 X79.622 Y81.59 E-.14809
G1 X79.421 Y81.314 E-.12959
G1 X79.385 Y80.973 E-.13019
G1 X79.479 Y80.706 E-.10761
G1 X79.676 Y80.497 E-.1094
G1 X80.002 Y80.377 E-.13206
G1 X80.01 Y80.378 E-.00307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.46 F42000
G1 Z1.06
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1843
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
G1 F1843
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
G1 X84.173 Y87.856 Z1.46 F42000
G1 X84.654 Y90.754 Z1.46
G1 Z1.06
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1843
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.46 F42000
G1 Z1.06
G1 E.8 F1800
G1 F1843
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
G3 Z1.46 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.14
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 13/100
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.14
G1 E.8 F1800
; LINE_WIDTH: 0.497488
G1 F1843
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.429 Y104.204 E.04315
G1 X78.144 Y104.164 E.00367
; LINE_WIDTH: 0.407298
G1 X77.835 Y103.999 E.00446
; LINE_WIDTH: 0.411498
G1 X77.598 Y103.706 E.00483
G1 X77.5 Y103.37 E.00451
; LINE_WIDTH: 0.410308
G3 X77.498 Y101.281 I43.246 J-1.093 E.02677
; LINE_WIDTH: 0.410178
G1 X77.498 Y99.281 E.02562
; LINE_WIDTH: 0.410048
G1 X77.498 Y97.281 E.02561
; LINE_WIDTH: 0.409918
G1 X77.498 Y95.281 E.0256
; LINE_WIDTH: 0.409788
G1 X77.497 Y93.281 E.02559
; LINE_WIDTH: 0.409658
G1 X77.497 Y91.281 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.281 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.281 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.281 E.02556
; LINE_WIDTH: 0.409148
G1 X77.496 Y83.281 E.02555
; LINE_WIDTH: 0.409018
G1 X77.496 Y81.281 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.281 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.281 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.0071
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411188
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.409798
G1 X82.425 Y75.797 E.0256
; LINE_WIDTH: 0.409338
G1 X84.425 Y75.796 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450225
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491891
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533558
G1 X86.03 Y75.858 E.00129
G1 X86.065 Y75.983 E.00218
G1 X101.251 Y75.983 E.25562
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488831
G1 X101.637 Y75.824 E.0013
; LINE_WIDTH: 0.444155
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.405098
G1 X102.02 Y75.905 E.004
G1 X102.315 Y76.154 E.00488
; LINE_WIDTH: 0.404848
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
; LINE_WIDTH: 0.408588
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408718
G1 X102.502 Y92.7 E.02553
; LINE_WIDTH: 0.408848
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408978
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409108
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409358
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00556
; LINE_WIDTH: 0.403988
G1 X102.095 Y104.053 E.00523
; LINE_WIDTH: 0.403768
G1 X101.71 Y104.198 E.00518
; LINE_WIDTH: 0.447041
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490315
G1 X101.55 Y104.157 E.00128
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05417
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65273
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.727 Y103.921 Z1.54 F42000
G1 Z1.14
G1 E.8 F1800
; LINE_WIDTH: 0.403988
G1 F1843
M204 S5000
G1 X102.725 Y103.926 E.00007
; LINE_WIDTH: 0.411198
G1 X102.436 Y104.281 E.00588
; LINE_WIDTH: 0.414018
G1 X102.173 Y104.454 E.00407
G1 X101.748 Y104.583 E.00574
; LINE_WIDTH: 0.447041
G1 X101.582 Y104.566 E.00233
; LINE_WIDTH: 0.490315
G1 X101.417 Y104.55 E.00257
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.0028
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.429 Y104.596 E.04315
G1 X78.024 Y104.538 E.00522
; LINE_WIDTH: 0.407638
G1 X77.59 Y104.297 E.00632
; LINE_WIDTH: 0.403088
G1 X77.303 Y103.974 E.00543
; LINE_WIDTH: 0.411128
G1 X77.137 Y103.565 E.00567
G1 X77.105 Y103.29 E.00355
; LINE_WIDTH: 0.410308
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410178
G1 X77.105 Y99.29 E.02562
; LINE_WIDTH: 0.410048
G1 X77.105 Y97.29 E.02561
; LINE_WIDTH: 0.409918
G1 X77.105 Y95.29 E.0256
; LINE_WIDTH: 0.409788
G1 X77.105 Y93.29 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.29 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.29 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.29 E.02557
; LINE_WIDTH: 0.409278
G1 X77.105 Y85.29 E.02556
; LINE_WIDTH: 0.409148
G1 X77.105 Y83.29 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00722
G1 X77.181 Y76.285 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.412 Y75.405 E.0256
; LINE_WIDTH: 0.409338
G1 X84.412 Y75.404 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450225
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491891
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533558
G1 X86.251 Y75.467 E.00251
G1 X101.251 Y75.467 E.25248
G1 X101.36 Y75.448 E.00185
; LINE_WIDTH: 0.495181
G1 X101.468 Y75.429 E.00172
; LINE_WIDTH: 0.456855
G1 X101.577 Y75.409 E.00158
; LINE_WIDTH: 0.418528
G1 X101.832 Y75.437 E.00336
; LINE_WIDTH: 0.403398
G1 X102.206 Y75.568 E.005
; LINE_WIDTH: 0.404208
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407718
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
; LINE_WIDTH: 0.408588
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408718
G1 X102.894 Y92.7 E.02553
; LINE_WIDTH: 0.408848
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408978
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409108
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409358
G1 X102.893 Y103.335 E.03368
G1 X102.862 Y103.529 E.00252
; LINE_WIDTH: 0.403988
G1 X102.747 Y103.864 E.00447
; WIPE_START
G1 F12000
M204 S6000
G1 X102.725 Y103.926 E-.02492
G1 X102.436 Y104.281 E-.17397
G1 X102.173 Y104.454 E-.11969
G1 X101.748 Y104.583 E-.16864
G1 X101.582 Y104.566 E-.0633
G1 X101.417 Y104.55 E-.0633
G1 X101.251 Y104.533 E-.0633
G1 X101.033 Y104.533 E-.08287
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.835 Y98.944 Z1.54 F42000
G1 X79.801 Y81.701 Z1.54
G1 Z1.14
G1 E.8 F1800
; LINE_WIDTH: 0.405248
G1 F1843
M204 S5000
G1 X79.785 Y81.697 E.00022
G1 X79.52 Y81.484 E.00429
; LINE_WIDTH: 0.388608
G1 X79.397 Y81.224 E.00348
; LINE_WIDTH: 0.387568
G1 X79.407 Y80.877 E.00419
G1 X79.54 Y80.623 E.00346
; LINE_WIDTH: 0.385708
G1 X79.753 Y80.452 E.00329
; LINE_WIDTH: 0.390608
G1 X80.016 Y80.374 E.00333
G1 X80.231 Y80.393 E.00262
; LINE_WIDTH: 0.387768
G1 X80.533 Y80.551 E.00412
; LINE_WIDTH: 0.398388
G1 X80.725 Y80.827 E.00418
G1 X80.76 Y81.028 E.00254
; LINE_WIDTH: 0.404488
G1 X80.695 Y81.366 E.00435
G1 X80.528 Y81.588 E.0035
; LINE_WIDTH: 0.405908
G1 X80.326 Y81.71 E.003
G1 X80.053 Y81.758 E.00351
; LINE_WIDTH: 0.405248
G1 X79.86 Y81.714 E.0025
; WIPE_START
G1 F12000
M204 S6000
G1 X79.785 Y81.697 E-.02935
G1 X79.52 Y81.484 E-.12898
G1 X79.397 Y81.224 E-.10936
G1 X79.407 Y80.877 E-.13192
G1 X79.54 Y80.623 E-.10897
G1 X79.753 Y80.452 E-.10395
G1 X80.016 Y80.374 E-.10402
G1 X80.13 Y80.385 E-.04345
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.37 Y80.207 Z1.54 F42000
G1 Z1.14
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1843
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
M73 P22 R12
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394348
G1 F1843
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
G1 X84.173 Y87.856 Z1.54 F42000
G1 X84.654 Y90.754 Z1.54
G1 Z1.14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1843
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.54 F42000
G1 Z1.14
G1 E.8 F1800
G1 F1843
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
G3 Z1.54 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.22
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 14/100
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.22
G1 E.8 F1800
; LINE_WIDTH: 0.497458
G1 F1847
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05046
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09483
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406588
G1 X77.629 Y103.767 E.00548
; LINE_WIDTH: 0.407188
G1 X77.5 Y103.37 E.00531
; LINE_WIDTH: 0.410308
G3 X77.498 Y101.285 I56.46 J-1.09 E.02671
; LINE_WIDTH: 0.410178
G1 X77.498 Y99.285 E.02562
; LINE_WIDTH: 0.410048
G1 X77.498 Y97.285 E.02561
; LINE_WIDTH: 0.409918
G1 X77.498 Y95.285 E.0256
; LINE_WIDTH: 0.409788
G1 X77.497 Y93.285 E.02559
; LINE_WIDTH: 0.409658
G1 X77.497 Y91.285 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.285 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.285 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.285 E.02556
; LINE_WIDTH: 0.409148
G1 X77.496 Y83.285 E.02555
; LINE_WIDTH: 0.409018
G1 X77.496 Y81.285 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.285 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.285 E.02553
; LINE_WIDTH: 0.408628
G3 X77.497 Y76.7 I7.978 J-.279 E.00747
; LINE_WIDTH: 0.406448
G1 X77.551 Y76.403 E.00383
; LINE_WIDTH: 0.404578
G1 X77.73 Y76.102 E.00443
; LINE_WIDTH: 0.410598
G1 X78.038 Y75.878 E.00488
G1 X78.41 Y75.798 E.00488
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.798 E.02563
; LINE_WIDTH: 0.409798
G1 X82.41 Y75.797 E.0256
; LINE_WIDTH: 0.409338
G1 X84.41 Y75.796 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.796 E.01786
; LINE_WIDTH: 0.450225
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491891
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533558
G1 X86.03 Y75.858 E.00129
G1 X86.065 Y75.983 E.00218
G1 X101.251 Y75.983 E.25562
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488851
G1 X101.637 Y75.824 E.0013
; LINE_WIDTH: 0.444205
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.408208
G1 X102.136 Y75.976 E.00573
; LINE_WIDTH: 0.408448
G1 X102.393 Y76.273 E.00501
; LINE_WIDTH: 0.409398
G1 X102.501 Y76.646 E.00497
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
G1 X102.504 Y103.3 E.00832
; LINE_WIDTH: 0.413008
G3 X102.322 Y103.835 I-1.052 J-.059 E.00738
; LINE_WIDTH: 0.411098
G1 X102.002 Y104.104 E.00538
; LINE_WIDTH: 0.418108
G1 X101.636 Y104.198 E.00494
; LINE_WIDTH: 0.456595
G1 X101.58 Y104.178 E.00085
; LINE_WIDTH: 0.495081
G1 X101.525 Y104.157 E.00092
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.00099
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05415
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.7 Y103.94 Z1.62 F42000
G1 Z1.22
G1 E.8 F1800
; LINE_WIDTH: 0.413008
G1 F1847
M204 S5000
G1 X102.619 Y104.084 E.00213
; LINE_WIDTH: 0.404308
G1 X102.272 Y104.398 E.0059
; LINE_WIDTH: 0.408068
G1 X101.884 Y104.559 E.00536
; LINE_WIDTH: 0.418108
G1 X101.599 Y104.59 E.00374
; LINE_WIDTH: 0.456595
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495081
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00198
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05046
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.415258
G1 X77.963 Y104.514 E.00532
G1 X77.616 Y104.319 E.00516
; LINE_WIDTH: 0.404328
G1 X77.303 Y103.974 E.00589
; LINE_WIDTH: 0.407368
G1 X77.138 Y103.549 E.0058
; LINE_WIDTH: 0.410308
G1 X77.105 Y103.292 E.00331
G1 X77.105 Y101.292 E.02563
; LINE_WIDTH: 0.410178
G1 X77.105 Y99.292 E.02562
; LINE_WIDTH: 0.410048
G1 X77.105 Y97.292 E.02561
; LINE_WIDTH: 0.409918
G1 X77.105 Y95.292 E.0256
; LINE_WIDTH: 0.409788
G1 X77.105 Y93.292 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.292 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.292 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.292 E.02557
; LINE_WIDTH: 0.409278
G1 X77.105 Y85.292 E.02556
; LINE_WIDTH: 0.409148
G1 X77.105 Y83.292 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.292 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.292 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.292 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.729 E.00719
G1 X77.147 Y76.409 E.00412
; LINE_WIDTH: 0.410568
G1 X77.313 Y76.009 E.00555
; LINE_WIDTH: 0.413158
G1 X77.567 Y75.719 E.00497
G1 X77.905 Y75.506 E.00516
; LINE_WIDTH: 0.410598
G1 X78.405 Y75.405 E.00654
; LINE_WIDTH: 0.410268
G1 X80.405 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.405 Y75.405 E.0256
; LINE_WIDTH: 0.409338
G1 X84.405 Y75.404 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.404 E.01792
; LINE_WIDTH: 0.450225
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491891
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533558
G1 X86.251 Y75.467 E.00251
G1 X101.251 Y75.467 E.25248
G1 X101.36 Y75.448 E.00186
; LINE_WIDTH: 0.495151
G1 X101.469 Y75.429 E.00172
; LINE_WIDTH: 0.456805
G1 X101.577 Y75.409 E.00158
; LINE_WIDTH: 0.418458
G1 X101.881 Y75.445 E.004
; LINE_WIDTH: 0.410738
G1 X102.292 Y75.613 E.00569
; LINE_WIDTH: 0.411718
G1 X102.58 Y75.864 E.00492
G1 X102.77 Y76.151 E.00443
; LINE_WIDTH: 0.411378
G1 X102.894 Y76.646 E.00655
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
G1 X102.894 Y103.3 E.00832
; LINE_WIDTH: 0.413008
G1 X102.815 Y103.737 E.00574
G1 X102.73 Y103.888 E.00224
; WIPE_START
G1 F12000
M204 S6000
G1 X102.619 Y104.084 E-.08549
G1 X102.272 Y104.398 E-.17772
G1 X101.884 Y104.559 E-.15984
G1 X101.599 Y104.59 E-.10879
G1 X101.483 Y104.571 E-.04471
G1 X101.367 Y104.552 E-.04471
G1 X101.251 Y104.533 E-.04471
G1 X101.004 Y104.533 E-.09402
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.806 Y98.944 Z1.62 F42000
G1 X79.737 Y81.666 Z1.62
G1 Z1.22
G1 E.8 F1800
; LINE_WIDTH: 0.388668
G1 F1847
M204 S5000
G1 X79.714 Y81.658 E.0003
; LINE_WIDTH: 0.387608
G1 X79.473 Y81.408 E.00419
G1 X79.383 Y81.136 E.00346
; LINE_WIDTH: 0.385728
G1 X79.41 Y80.864 E.00328
G1 X79.54 Y80.623 E.00329
G1 X79.753 Y80.452 E.00328
; LINE_WIDTH: 0.390548
G1 X80.016 Y80.375 E.00333
G1 X80.288 Y80.409 E.00334
; LINE_WIDTH: 0.388328
G1 X80.526 Y80.545 E.00331
; LINE_WIDTH: 0.398448
G1 X80.725 Y80.827 E.00429
G1 X80.76 Y81.028 E.00254
; LINE_WIDTH: 0.388208
G1 X80.721 Y81.299 E.00331
; LINE_WIDTH: 0.404508
G1 X80.529 Y81.585 E.00434
G1 X80.289 Y81.725 E.00351
; LINE_WIDTH: 0.402908
G1 X79.986 Y81.752 E.00382
; LINE_WIDTH: 0.388668
G1 X79.794 Y81.686 E.00246
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y81.658 E-.03221
G1 X79.473 Y81.408 E-.13198
G1 X79.383 Y81.136 E-.10901
G1 X79.41 Y80.864 E-.10386
G1 X79.54 Y80.623 E-.10394
G1 X79.753 Y80.452 E-.10387
G1 X80.016 Y80.375 E-.10408
G1 X80.201 Y80.398 E-.07105
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.62 F42000
G1 Z1.22
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1847
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
G1 F1847
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
G1 X84.173 Y87.856 Z1.62 F42000
G1 X84.654 Y90.754 Z1.62
G1 Z1.22
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1847
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.62 F42000
G1 Z1.22
G1 E.8 F1800
G1 F1847
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
G3 Z1.62 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 15/100
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.497478
M73 P23 R12
G1 F1847
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05046
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.411388
G1 X78.116 Y104.152 E.00327
G1 X77.801 Y103.97 E.00467
; LINE_WIDTH: 0.413598
G1 X77.706 Y103.863 E.00185
G1 X77.588 Y103.69 E.0027
; LINE_WIDTH: 0.410268
G1 X77.498 Y103.285 E.00532
G1 X77.498 Y101.285 E.02563
; LINE_WIDTH: 0.410138
G1 X77.498 Y99.285 E.02562
; LINE_WIDTH: 0.410008
G1 X77.498 Y97.285 E.02561
; LINE_WIDTH: 0.409888
G1 X77.497 Y95.285 E.0256
; LINE_WIDTH: 0.409758
G1 X77.497 Y93.285 E.02559
; LINE_WIDTH: 0.409638
G1 X77.497 Y91.285 E.02559
; LINE_WIDTH: 0.409508
G1 X77.497 Y89.285 E.02558
; LINE_WIDTH: 0.409378
G1 X77.497 Y87.285 E.02557
; LINE_WIDTH: 0.409258
G1 X77.497 Y85.285 E.02556
; LINE_WIDTH: 0.409128
G1 X77.496 Y83.285 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.285 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.285 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.285 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.729 E.0071
G1 X77.551 Y76.403 E.00422
; LINE_WIDTH: 0.405558
G1 X77.729 Y76.1 E.00444
; LINE_WIDTH: 0.408268
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00539
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409798
G1 X82.42 Y75.797 E.0256
; LINE_WIDTH: 0.409338
G1 X84.42 Y75.796 E.02557
; LINE_WIDTH: 0.408878
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.450225
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491891
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533558
G1 X86.03 Y75.858 E.00129
G1 X86.065 Y75.983 E.00218
G1 X101.251 Y75.983 E.25562
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488838
G1 X101.637 Y75.824 E.0013
; LINE_WIDTH: 0.444188
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.405088
G1 X102.02 Y75.905 E.004
; LINE_WIDTH: 0.405758
G1 X102.316 Y76.153 E.00489
G1 X102.457 Y76.428 E.00391
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
; LINE_WIDTH: 0.408588
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408718
G1 X102.502 Y92.7 E.02553
; LINE_WIDTH: 0.408848
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408978
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409108
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409358
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00556
; LINE_WIDTH: 0.403968
G1 X102.094 Y104.054 E.00525
; LINE_WIDTH: 0.405708
G1 X101.706 Y104.199 E.00524
; LINE_WIDTH: 0.448331
G1 X101.627 Y104.178 E.00115
; LINE_WIDTH: 0.490955
G1 X101.548 Y104.158 E.00126
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00137
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05417
G1 X101.251 Y104.017 E-.0531
G1 X99.533 Y104.017 E-.65273
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.723 Y103.928 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.411388
G1 F1847
M204 S5000
G1 X102.436 Y104.281 E.00584
G1 X102.242 Y104.415 E.00303
; LINE_WIDTH: 0.406188
G1 X101.762 Y104.584 E.00647
; LINE_WIDTH: 0.448651
G1 X101.591 Y104.567 E.00241
; LINE_WIDTH: 0.491115
G1 X101.421 Y104.55 E.00264
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00288
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05046
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.411388
G1 X77.962 Y104.516 E.00527
G1 X77.564 Y104.274 E.00599
; LINE_WIDTH: 0.403938
G1 X77.285 Y103.944 E.00545
; LINE_WIDTH: 0.406758
G1 X77.135 Y103.538 E.00549
; LINE_WIDTH: 0.410268
G1 X77.105 Y103.292 E.00318
G1 X77.105 Y101.292 E.02563
; LINE_WIDTH: 0.410138
G1 X77.105 Y99.292 E.02562
; LINE_WIDTH: 0.410008
G1 X77.105 Y97.292 E.02561
; LINE_WIDTH: 0.409888
G1 X77.105 Y95.292 E.0256
; LINE_WIDTH: 0.409758
G1 X77.105 Y93.292 E.02559
; LINE_WIDTH: 0.409638
G1 X77.105 Y91.292 E.02559
; LINE_WIDTH: 0.409508
G1 X77.105 Y89.292 E.02558
; LINE_WIDTH: 0.409378
G1 X77.105 Y87.292 E.02557
; LINE_WIDTH: 0.409258
G1 X77.105 Y85.292 E.02556
; LINE_WIDTH: 0.409128
G1 X77.105 Y83.292 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.292 E.02554
; LINE_WIDTH: 0.408878
G1 X77.104 Y79.292 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.292 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.729 E.00719
G1 X77.174 Y76.298 E.00557
; LINE_WIDTH: 0.406438
G1 X77.415 Y75.871 E.00622
; LINE_WIDTH: 0.402808
G1 X77.746 Y75.594 E.00542
; LINE_WIDTH: 0.411308
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
; LINE_WIDTH: 0.450225
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491891
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533558
G1 X86.251 Y75.467 E.00251
G1 X101.251 Y75.467 E.25248
G1 X101.36 Y75.448 E.00186
; LINE_WIDTH: 0.495091
G1 X101.469 Y75.429 E.00172
; LINE_WIDTH: 0.456695
G1 X101.578 Y75.409 E.00159
; LINE_WIDTH: 0.418298
G1 X101.832 Y75.437 E.00334
; LINE_WIDTH: 0.403388
G1 X102.207 Y75.569 E.005
; LINE_WIDTH: 0.404788
G1 X102.515 Y75.8 E.00486
; LINE_WIDTH: 0.410328
G1 X102.771 Y76.152 E.00558
G1 X102.893 Y76.646 E.00653
; LINE_WIDTH: 0.409528
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
; LINE_WIDTH: 0.408588
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408718
G1 X102.894 Y92.7 E.02553
; LINE_WIDTH: 0.408848
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408978
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409108
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409358
G1 X102.893 Y103.335 E.03368
G1 X102.862 Y103.529 E.00252
; LINE_WIDTH: 0.403968
G1 X102.744 Y103.872 E.00457
; WIPE_START
G1 F12000
M204 S6000
G1 X102.436 Y104.281 E-.19444
G1 X102.242 Y104.415 E-.08948
G1 X101.762 Y104.584 E-.19377
G1 X101.591 Y104.567 E-.065
G1 X101.421 Y104.55 E-.065
G1 X101.251 Y104.533 E-.065
G1 X101.021 Y104.533 E-.08731
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.824 Y98.943 Z1.7 F42000
G1 X79.797 Y81.704 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.398028
G1 F1847
M204 S5000
G1 X79.796 Y81.703 E.00002
G1 X79.526 Y81.492 E.00426
; LINE_WIDTH: 0.391188
G1 X79.397 Y81.224 E.00362
; LINE_WIDTH: 0.387548
G1 X79.407 Y80.877 E.00419
G1 X79.54 Y80.623 E.00346
; LINE_WIDTH: 0.385748
G1 X79.753 Y80.452 E.00328
; LINE_WIDTH: 0.411248
G1 X80.088 Y80.374 E.00441
G1 X80.355 Y80.433 E.00352
; LINE_WIDTH: 0.414748
G1 X80.576 Y80.598 E.00357
G1 X80.723 Y80.828 E.00354
; LINE_WIDTH: 0.402688
G1 X80.757 Y80.994 E.00214
; LINE_WIDTH: 0.385748
G1 X80.73 Y81.266 E.00329
; LINE_WIDTH: 0.390488
G1 X80.602 Y81.508 E.00333
G1 X80.387 Y81.679 E.00334
; LINE_WIDTH: 0.388388
G1 X80.124 Y81.754 E.00332
; LINE_WIDTH: 0.398028
G1 X79.857 Y81.713 E.00336
; WIPE_START
G1 F12000
M204 S6000
G1 X79.796 Y81.703 E-.02348
G1 X79.526 Y81.492 E-.13025
G1 X79.397 Y81.224 E-.11284
G1 X79.407 Y80.877 E-.13198
G1 X79.54 Y80.623 E-.10897
G1 X79.753 Y80.452 E-.10389
G1 X80.088 Y80.374 E-.13041
G1 X80.134 Y80.385 E-.01818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1847
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
G1 F1847
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
G1 X84.173 Y87.856 Z1.7 F42000
G1 X84.654 Y90.754 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1847
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.7 F42000
G1 Z1.3
G1 E.8 F1800
G1 F1847
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
G3 Z1.7 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.38
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 16/100
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.38
G1 E.8 F1800
; LINE_WIDTH: 0.497468
G1 F1843
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
; LINE_WIDTH: 0.411248
G1 X78.206 Y104.178 E.00283
G1 X77.866 Y104.022 E.0048
; LINE_WIDTH: 0.404718
G1 X77.607 Y103.723 E.005
G1 X77.501 Y103.37 E.00466
; LINE_WIDTH: 0.410278
G1 X77.498 Y101.276 E.02683
; LINE_WIDTH: 0.410148
G1 X77.498 Y99.276 E.02562
; LINE_WIDTH: 0.410018
G1 X77.498 Y97.276 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.276 E.0256
; LINE_WIDTH: 0.409768
M73 P24 R12
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
; LINE_WIDTH: 0.413588
G1 X77.61 Y76.283 E.00173
G1 X77.755 Y76.075 E.00328
; LINE_WIDTH: 0.411218
G1 X78.01 Y75.89 E.00404
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409798
G1 X82.424 Y75.797 E.0256
; LINE_WIDTH: 0.409328
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450215
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491881
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533548
G1 X86.03 Y75.858 E.00129
G1 X86.065 Y75.983 E.00218
G1 X101.251 Y75.983 E.25561
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488841
G1 X101.637 Y75.824 E.0013
; LINE_WIDTH: 0.444215
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.408188
G1 X102.136 Y75.976 E.00573
G1 X102.417 Y76.315 E.00561
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00503
; LINE_WIDTH: 0.407878
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408088
G1 X102.503 Y80.7 E.02548
; LINE_WIDTH: 0.408298
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408508
G1 X102.503 Y84.7 E.02551
; LINE_WIDTH: 0.408708
G1 X102.503 Y86.7 E.02552
; LINE_WIDTH: 0.408918
G1 X102.503 Y88.7 E.02554
; LINE_WIDTH: 0.409128
G1 X102.503 Y90.7 E.02555
; LINE_WIDTH: 0.409338
G1 X102.502 Y92.7 E.02557
; LINE_WIDTH: 0.409538
G1 X102.502 Y94.7 E.02558
; LINE_WIDTH: 0.409748
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409958
G1 X102.502 Y98.7 E.02561
; LINE_WIDTH: 0.410168
G1 X102.502 Y100.7 E.02562
; LINE_WIDTH: 0.410378
G1 X102.501 Y103.275 E.03301
; LINE_WIDTH: 0.414018
G1 X102.471 Y103.503 E.00297
G1 X102.347 Y103.799 E.00415
; LINE_WIDTH: 0.406958
G1 X102.06 Y104.074 E.00505
G1 X101.715 Y104.196 E.00465
; LINE_WIDTH: 0.445598
G1 X101.633 Y104.176 E.00118
; LINE_WIDTH: 0.489588
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05415
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65274
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.709 Y103.941 Z1.78 F42000
G1 Z1.38
G1 E.8 F1800
; LINE_WIDTH: 0.408458
G1 F1843
M204 S5000
G1 X102.642 Y104.048 E.00162
; LINE_WIDTH: 0.404108
G1 X102.347 Y104.349 E.00531
; LINE_WIDTH: 0.411068
G1 X101.936 Y104.544 E.00584
; LINE_WIDTH: 0.418768
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.457038
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495308
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
; LINE_WIDTH: 0.411248
G1 X78.086 Y104.554 E.00438
G1 X77.662 Y104.351 E.00604
; LINE_WIDTH: 0.406728
G1 X77.355 Y104.05 E.00546
; LINE_WIDTH: 0.413658
G1 X77.157 Y103.636 E.00593
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
G1 X77.104 Y76.725 E.00719
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.907 E.00545
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412798
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.412 Y75.405 E.0256
; LINE_WIDTH: 0.409328
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450215
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491881
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533548
G1 X86.251 Y75.467 E.00251
G1 X101.251 Y75.467 E.25247
G1 X101.36 Y75.448 E.00187
; LINE_WIDTH: 0.495051
G1 X101.47 Y75.429 E.00173
; LINE_WIDTH: 0.456635
G1 X101.579 Y75.409 E.00159
; LINE_WIDTH: 0.418218
G1 X101.882 Y75.445 E.00399
; LINE_WIDTH: 0.410758
G1 X102.292 Y75.613 E.00568
G1 X102.483 Y75.77 E.00317
; LINE_WIDTH: 0.406708
G1 X102.773 Y76.152 E.00609
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00651
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407878
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408088
G1 X102.894 Y80.7 E.02548
; LINE_WIDTH: 0.408298
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408508
G1 X102.894 Y84.7 E.02551
; LINE_WIDTH: 0.408708
G1 X102.895 Y86.7 E.02552
; LINE_WIDTH: 0.408918
G1 X102.895 Y88.7 E.02554
; LINE_WIDTH: 0.409128
G1 X102.895 Y90.7 E.02555
; LINE_WIDTH: 0.409338
G1 X102.895 Y92.7 E.02557
; LINE_WIDTH: 0.409538
G1 X102.895 Y94.7 E.02558
; LINE_WIDTH: 0.409748
G1 X102.895 Y96.7 E.02559
; LINE_WIDTH: 0.409958
G1 X102.895 Y98.7 E.02561
; LINE_WIDTH: 0.410168
G1 X102.895 Y100.7 E.02562
; LINE_WIDTH: 0.410378
G1 X102.895 Y102.7 E.02563
G3 X102.879 Y103.443 I-4.038 J.288 E.00954
; LINE_WIDTH: 0.408458
G1 X102.761 Y103.859 E.00552
G1 X102.742 Y103.89 E.00047
; WIPE_START
G1 F12000
M204 S6000
G1 X102.642 Y104.048 E-.07096
G1 X102.347 Y104.349 E-.16009
G1 X101.936 Y104.544 E-.17283
G1 X101.6 Y104.589 E-.12909
G1 X101.483 Y104.57 E-.04474
G1 X101.367 Y104.552 E-.04474
G1 X101.251 Y104.533 E-.04474
G1 X101.007 Y104.533 E-.0928
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.811 Y98.942 Z1.78 F42000
G1 X79.788 Y81.698 Z1.78
G1 Z1.38
G1 E.8 F1800
; LINE_WIDTH: 0.405308
G1 F1843
M204 S5000
G1 X79.785 Y81.697 E.00004
G1 X79.562 Y81.537 E.00347
G1 X79.418 Y81.302 E.00348
; LINE_WIDTH: 0.405208
G1 X79.386 Y80.964 E.00429
; LINE_WIDTH: 0.388668
G1 X79.486 Y80.694 E.00349
; LINE_WIDTH: 0.387608
G1 X79.742 Y80.459 E.00419
; LINE_WIDTH: 0.390388
G1 X80.016 Y80.375 E.00349
G1 X80.288 Y80.409 E.00334
; LINE_WIDTH: 0.388348
G1 X80.526 Y80.545 E.00331
; LINE_WIDTH: 0.398408
G1 X80.725 Y80.827 E.00429
G1 X80.76 Y81.028 E.00254
; LINE_WIDTH: 0.404488
G1 X80.695 Y81.368 E.00437
; LINE_WIDTH: 0.405668
G1 X80.554 Y81.562 E.00303
G1 X80.324 Y81.71 E.00347
; LINE_WIDTH: 0.405308
G1 X80.053 Y81.758 E.00348
G1 X79.846 Y81.711 E.00268
; WIPE_START
G1 F12000
M204 S6000
G1 X79.785 Y81.697 E-.02405
G1 X79.562 Y81.537 E-.10431
G1 X79.418 Y81.302 E-.10449
G1 X79.386 Y80.964 E-.12899
G1 X79.486 Y80.694 E-.10946
G1 X79.742 Y80.459 E-.13195
G1 X80.016 Y80.375 E-.109
G1 X80.141 Y80.39 E-.04775
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.78 F42000
G1 Z1.38
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1843
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
G1 F1843
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
G1 X84.173 Y87.856 Z1.78 F42000
G1 X84.654 Y90.754 Z1.78
G1 Z1.38
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1843
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.78 F42000
G1 Z1.38
G1 E.8 F1800
G1 F1843
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
G3 Z1.78 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.46
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 17/100
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.46
G1 E.8 F1800
; LINE_WIDTH: 0.497458
G1 F1847
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05046
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406558
G1 X77.629 Y103.768 E.00548
; LINE_WIDTH: 0.405898
G1 X77.5 Y103.369 E.0053
; LINE_WIDTH: 0.410268
G3 X77.498 Y101.28 I42.563 J-1.092 E.02677
; LINE_WIDTH: 0.410048
G1 X77.498 Y99.28 E.02561
; LINE_WIDTH: 0.409828
G1 X77.498 Y97.28 E.0256
; LINE_WIDTH: 0.409608
G1 X77.498 Y95.28 E.02558
; LINE_WIDTH: 0.409388
G1 X77.498 Y93.28 E.02557
; LINE_WIDTH: 0.409168
G1 X77.497 Y91.28 E.02555
; LINE_WIDTH: 0.408948
G1 X77.497 Y89.28 E.02554
; LINE_WIDTH: 0.408728
G1 X77.497 Y87.28 E.02553
; LINE_WIDTH: 0.408508
G1 X77.497 Y85.28 E.02551
; LINE_WIDTH: 0.408288
G1 X77.497 Y83.28 E.0255
; LINE_WIDTH: 0.408078
G1 X77.497 Y81.28 E.02548
; LINE_WIDTH: 0.407858
G1 X77.497 Y79.28 E.02547
; LINE_WIDTH: 0.407638
G1 X77.496 Y77.28 E.02545
; LINE_WIDTH: 0.407418
G1 X77.496 Y76.7 E.00738
; LINE_WIDTH: 0.408228
G1 X77.549 Y76.402 E.00386
G1 X77.729 Y76.1 E.00448
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409798
G1 X82.42 Y75.797 E.0256
; LINE_WIDTH: 0.409328
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.450215
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491881
M73 P25 R12
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533548
G1 X86.03 Y75.858 E.00129
G1 X86.065 Y75.983 E.00218
G1 X101.251 Y75.983 E.25561
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488858
G1 X101.637 Y75.824 E.0013
; LINE_WIDTH: 0.444248
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.403708
G1 X101.94 Y75.869 E.00288
; LINE_WIDTH: 0.407888
G1 X102.265 Y76.093 E.00504
G1 X102.457 Y76.427 E.00491
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00352
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407878
G1 X102.503 Y80.7 E.02547
; LINE_WIDTH: 0.407988
G1 X102.503 Y84.7 E.05096
; LINE_WIDTH: 0.408198
G1 X102.503 Y86.7 E.02549
; LINE_WIDTH: 0.408298
G1 X102.503 Y88.7 E.0255
; LINE_WIDTH: 0.408408
G1 X102.502 Y92.7 E.05101
; LINE_WIDTH: 0.408608
G1 X102.502 Y94.7 E.02552
; LINE_WIDTH: 0.408718
G1 X102.502 Y98.7 E.05105
; LINE_WIDTH: 0.408928
G1 X102.501 Y102.7 E.05108
; LINE_WIDTH: 0.409068
G1 X102.501 Y103.343 E.00822
G1 X102.38 Y103.752 E.00545
; LINE_WIDTH: 0.403958
G1 X102.093 Y104.055 E.00526
; LINE_WIDTH: 0.403808
G1 X101.71 Y104.198 E.00515
; LINE_WIDTH: 0.447061
G1 X101.63 Y104.177 E.00116
; LINE_WIDTH: 0.490315
G1 X101.55 Y104.157 E.00128
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05414
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.708 Y103.951 Z1.86 F42000
G1 Z1.46
G1 E.8 F1800
; LINE_WIDTH: 0.415228
G1 F1847
M204 S5000
G1 X102.678 Y104.017 E.00095
; LINE_WIDTH: 0.407718
G1 X102.299 Y104.381 E.00668
; LINE_WIDTH: 0.408218
G1 X101.892 Y104.556 E.00565
; LINE_WIDTH: 0.418058
G1 X101.6 Y104.59 E.00384
; LINE_WIDTH: 0.456561
G1 X101.484 Y104.571 E.00169
; LINE_WIDTH: 0.495065
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00198
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05046
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.415248
G1 X77.963 Y104.514 E.00532
G1 X77.616 Y104.32 E.00516
; LINE_WIDTH: 0.404358
G1 X77.303 Y103.974 E.00588
; LINE_WIDTH: 0.411578
G1 X77.138 Y103.571 E.0056
G1 X77.105 Y103.29 E.00364
; LINE_WIDTH: 0.410268
G1 X77.105 Y101.29 E.02563
; LINE_WIDTH: 0.410048
G1 X77.105 Y99.29 E.02561
; LINE_WIDTH: 0.409828
G1 X77.105 Y97.29 E.0256
; LINE_WIDTH: 0.409608
G1 X77.105 Y95.29 E.02558
; LINE_WIDTH: 0.409388
G1 X77.106 Y93.29 E.02557
; LINE_WIDTH: 0.409168
G1 X77.106 Y91.29 E.02555
; LINE_WIDTH: 0.408948
G1 X77.106 Y89.29 E.02554
; LINE_WIDTH: 0.408728
G1 X77.106 Y87.29 E.02553
; LINE_WIDTH: 0.408508
G1 X77.106 Y85.29 E.02551
; LINE_WIDTH: 0.408298
G1 X77.106 Y83.29 E.0255
; LINE_WIDTH: 0.408078
G1 X77.106 Y81.29 E.02548
; LINE_WIDTH: 0.407858
G1 X77.106 Y79.29 E.02547
; LINE_WIDTH: 0.407638
G1 X77.106 Y77.29 E.02545
; LINE_WIDTH: 0.407418
G1 X77.106 Y76.7 E.0075
; LINE_WIDTH: 0.408218
G1 X77.182 Y76.262 E.00567
G1 X77.414 Y75.872 E.00578
; LINE_WIDTH: 0.403068
G1 X77.745 Y75.595 E.00543
; LINE_WIDTH: 0.411298
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.41 Y75.405 E.0256
; LINE_WIDTH: 0.409338
G1 X84.41 Y75.405 E.02557
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.404 E.01786
; LINE_WIDTH: 0.450215
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491881
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533548
G1 X86.251 Y75.467 E.00251
G1 X101.251 Y75.467 E.25247
G1 X101.361 Y75.448 E.00187
; LINE_WIDTH: 0.495021
G1 X101.47 Y75.429 E.00173
; LINE_WIDTH: 0.456575
G1 X101.58 Y75.409 E.00159
; LINE_WIDTH: 0.418128
G1 X101.947 Y75.457 E.00484
; LINE_WIDTH: 0.414858
G1 X102.29 Y75.614 E.00489
G1 X102.535 Y75.817 E.00412
; LINE_WIDTH: 0.410898
G1 X102.771 Y76.153 E.00527
G1 X102.893 Y76.646 E.00652
; LINE_WIDTH: 0.409528
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407778
G1 X102.894 Y78.7 E.02546
; LINE_WIDTH: 0.407878
G1 X102.894 Y80.7 E.02547
; LINE_WIDTH: 0.407988
G1 X102.894 Y84.7 E.05096
; LINE_WIDTH: 0.408198
G1 X102.894 Y86.7 E.02549
; LINE_WIDTH: 0.408298
G1 X102.894 Y88.7 E.0255
; LINE_WIDTH: 0.408408
G1 X102.894 Y92.7 E.05101
; LINE_WIDTH: 0.408608
G1 X102.893 Y94.7 E.02552
; LINE_WIDTH: 0.408718
G1 X102.893 Y98.7 E.05105
; LINE_WIDTH: 0.408928
G1 X102.893 Y102.7 E.05108
; LINE_WIDTH: 0.409068
G1 X102.893 Y103.343 E.00822
; LINE_WIDTH: 0.415228
G3 X102.82 Y103.711 I-1.5 J-.108 E.00487
G1 X102.734 Y103.896 E.00266
; WIPE_START
G1 F12000
M204 S6000
G1 X102.678 Y104.017 E-.05056
G1 X102.299 Y104.381 E-.19936
G1 X101.892 Y104.556 E-.16859
G1 X101.6 Y104.59 E-.11178
G1 X101.484 Y104.571 E-.04476
G1 X101.367 Y104.552 E-.04476
G1 X101.251 Y104.533 E-.04476
G1 X101 Y104.533 E-.09543
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.803 Y98.943 Z1.86 F42000
G1 X79.748 Y81.676 Z1.86
G1 Z1.46
G1 E.8 F1800
; LINE_WIDTH: 0.386788
G1 F1847
M204 S5000
G1 X79.506 Y81.462 E.00389
; LINE_WIDTH: 0.392608
G1 X79.383 Y81.146 E.00415
G1 X79.407 Y80.863 E.00347
; LINE_WIDTH: 0.392348
G1 X79.537 Y80.621 E.00336
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00385
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389428
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.388488
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.405288
G1 X80.763 Y81.03 E.00429
G1 X80.752 Y81.166 E.00172
; LINE_WIDTH: 0.384988
G1 X80.663 Y81.418 E.00321
; LINE_WIDTH: 0.399428
G1 X80.403 Y81.674 E.00455
G1 X80.122 Y81.76 E.00365
; LINE_WIDTH: 0.398448
G1 X79.807 Y81.689 E.00402
; WIPE_START
G1 F12000
M204 S6000
G1 X79.506 Y81.462 E-.14323
G1 X79.383 Y81.146 E-.129
G1 X79.407 Y80.863 E-.10776
G1 X79.537 Y80.621 E-.10445
G1 X79.783 Y80.429 E-.11855
G1 X80.154 Y80.378 E-.1424
G1 X80.19 Y80.391 E-.01461
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.86 F42000
G1 Z1.46
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1847
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
G1 F1847
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
G1 X84.173 Y87.856 Z1.86 F42000
G1 X84.654 Y90.754 Z1.86
G1 Z1.46
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1847
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.86 F42000
G1 Z1.46
G1 E.8 F1800
G1 F1847
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
G3 Z1.86 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.54
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 18/100
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.54
G1 E.8 F1800
; LINE_WIDTH: 0.497458
G1 F1838
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.14 Y104.161 E.00366
; LINE_WIDTH: 0.411578
G1 X77.779 Y103.949 E.00539
G1 X77.596 Y103.707 E.0039
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.276 E.00565
G1 X77.496 Y76.724 E.33876
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411178
G1 X77.755 Y76.075 E.00496
M73 P25 R11
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405378
G1 X78.331 Y75.802 E.00421
; LINE_WIDTH: 0.410248
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.409778
G1 X82.429 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.429 Y75.796 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.796 E.01761
; LINE_WIDTH: 0.450215
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491881
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533548
G1 X86.03 Y75.858 E.00129
G1 X86.065 Y75.983 E.00218
G1 X101.251 Y75.983 E.25561
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488861
G1 X101.637 Y75.824 E.0013
; LINE_WIDTH: 0.444265
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.403138
G1 X101.935 Y75.866 E.00281
; LINE_WIDTH: 0.404098
G1 X102.227 Y76.056 E.00439
; LINE_WIDTH: 0.408478
G1 X102.431 Y76.353 E.0046
G1 X102.504 Y76.7 E.00452
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
M73 P26 R11
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
; LINE_WIDTH: 0.413728
G1 X102.472 Y103.498 E.0029
G1 X102.348 Y103.799 E.00421
; LINE_WIDTH: 0.407168
G1 X102.062 Y104.072 E.00503
G1 X101.715 Y104.196 E.00468
; LINE_WIDTH: 0.445605
G1 X101.633 Y104.176 E.00118
; LINE_WIDTH: 0.489591
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05414
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.7 Y103.947 Z1.94 F42000
G1 Z1.54
G1 E.8 F1800
; LINE_WIDTH: 0.413728
G1 F1838
M204 S5000
G1 X102.667 Y104.023 E.00108
; LINE_WIDTH: 0.405568
G1 X102.349 Y104.348 E.00575
; LINE_WIDTH: 0.411108
G1 X101.937 Y104.544 E.00587
; LINE_WIDTH: 0.418778
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.457045
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495311
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X77.982 Y104.516 E.00573
; LINE_WIDTH: 0.406308
G1 X77.606 Y104.309 E.00544
; LINE_WIDTH: 0.411598
G1 X77.309 Y103.988 E.00562
; LINE_WIDTH: 0.415278
G1 X77.158 Y103.636 E.00497
G1 X77.104 Y103.288 E.00458
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.33891
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.413568
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410248
G1 X80.415 Y75.405 E.02562
; LINE_WIDTH: 0.409788
G1 X82.415 Y75.405 E.02559
; LINE_WIDTH: 0.409328
G1 X84.415 Y75.405 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.404 E.01779
; LINE_WIDTH: 0.450215
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491881
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533548
G1 X86.251 Y75.467 E.00251
G1 X101.251 Y75.467 E.25247
G1 X101.361 Y75.448 E.00187
; LINE_WIDTH: 0.494978
G1 X101.471 Y75.429 E.00173
; LINE_WIDTH: 0.456498
G1 X101.58 Y75.409 E.00159
; LINE_WIDTH: 0.418018
G1 X101.947 Y75.457 E.00483
; LINE_WIDTH: 0.412318
G1 X102.291 Y75.613 E.00487
; LINE_WIDTH: 0.412878
G1 X102.577 Y75.861 E.00487
G1 X102.783 Y76.184 E.00494
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00608
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
; LINE_WIDTH: 0.413728
G1 X102.857 Y103.585 E.00402
G1 X102.724 Y103.892 E.00433
; WIPE_START
G1 F12000
M204 S6000
G1 X102.667 Y104.023 E-.05442
G1 X102.349 Y104.348 E-.17247
G1 X101.937 Y104.544 E-.17367
G1 X101.6 Y104.589 E-.12911
G1 X101.483 Y104.57 E-.04474
G1 X101.367 Y104.552 E-.04474
G1 X101.251 Y104.533 E-.04473
G1 X100.998 Y104.533 E-.09612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.801 Y98.943 Z1.94 F42000
G1 X79.74 Y81.668 Z1.94
G1 Z1.54
G1 E.8 F1800
; LINE_WIDTH: 0.384968
G1 F1838
M204 S5000
G1 X79.727 Y81.663 E.00016
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.391 Y80.937 E.00361
; LINE_WIDTH: 0.392888
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392328
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399208
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.397988
G1 X80.766 Y81.03 E.00347
; LINE_WIDTH: 0.397708
G1 X80.684 Y81.38 E.00445
; LINE_WIDTH: 0.389528
G1 X80.503 Y81.605 E.0035
; LINE_WIDTH: 0.389408
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.797 Y81.687 E.0024
; WIPE_START
G1 F12000
M204 S6000
G1 X79.727 Y81.663 E-.02802
G1 X79.521 Y81.483 E-.10387
G1 X79.402 Y81.237 E-.10382
G1 X79.391 Y80.937 E-.11429
G1 X79.53 Y80.633 E-.12693
G1 X79.751 Y80.449 E-.10939
G1 X80.016 Y80.374 E-.10445
G1 X80.197 Y80.393 E-.06924
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z1.94 F42000
G1 Z1.54
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1838
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
G1 F1838
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
G1 X84.173 Y87.856 Z1.94 F42000
G1 X84.654 Y90.754 Z1.94
G1 Z1.54
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1838
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z1.94 F42000
G1 Z1.54
G1 E.8 F1800
G1 F1838
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
G3 Z1.94 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.62
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 19/100
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.62
G1 E.8 F1800
; LINE_WIDTH: 0.497448
G1 F1843
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.14 Y104.161 E.00366
; LINE_WIDTH: 0.406748
G1 X77.8 Y103.971 E.00495
; LINE_WIDTH: 0.408248
G1 X77.624 Y103.758 E.00353
G1 X77.501 Y103.37 E.00519
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
G1 X77.496 Y76.724 E.00704
G1 X77.551 Y76.403 E.00415
; LINE_WIDTH: 0.411218
G1 X77.755 Y76.076 E.00495
G1 X78.01 Y75.89 E.00406
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410248
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409778
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450211
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491875
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533538
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X101.251 Y75.983 E.25561
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488885
G1 X101.637 Y75.824 E.0013
; LINE_WIDTH: 0.444321
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.405098
G1 X102.02 Y75.905 E.004
G1 X102.315 Y76.154 E.00488
; LINE_WIDTH: 0.404458
G1 X102.457 Y76.428 E.00389
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
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.414118
G1 X102.47 Y103.502 E.00295
G1 X102.347 Y103.799 E.00416
; LINE_WIDTH: 0.406908
G1 X102.058 Y104.074 E.00506
G1 X101.715 Y104.196 E.00463
; LINE_WIDTH: 0.445618
G1 X101.633 Y104.176 E.00118
; LINE_WIDTH: 0.489598
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05413
G1 X101.251 Y104.017 E-.05312
G1 X99.533 Y104.017 E-.65276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.698 Y103.951 Z2.02 F42000
G1 Z1.62
G1 E.8 F1800
; LINE_WIDTH: 0.414118
G1 F1843
M204 S5000
G1 X102.671 Y104.011 E.00085
; LINE_WIDTH: 0.404178
G1 X102.346 Y104.35 E.00592
; LINE_WIDTH: 0.411098
G1 X101.937 Y104.544 E.00582
; LINE_WIDTH: 0.418808
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.457065
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495321
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
M73 P27 R11
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X77.983 Y104.517 E.00572
; LINE_WIDTH: 0.406568
G1 X77.608 Y104.31 E.00543
; LINE_WIDTH: 0.408248
G1 X77.319 Y104.003 E.00538
; LINE_WIDTH: 0.412808
G1 X77.157 Y103.636 E.00516
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
G1 X77.182 Y76.283 E.00571
; LINE_WIDTH: 0.403638
G1 X77.391 Y75.906 E.00544
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.619 E.00536
; LINE_WIDTH: 0.412798
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410248
G1 X80.412 Y75.405 E.02562
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409328
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408868
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450211
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491875
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533538
G1 X86.251 Y75.467 E.00251
G1 X101.251 Y75.467 E.25247
G1 X101.361 Y75.448 E.00188
; LINE_WIDTH: 0.494961
G1 X101.471 Y75.429 E.00174
; LINE_WIDTH: 0.456475
G1 X101.581 Y75.409 E.0016
; LINE_WIDTH: 0.417988
G1 X101.832 Y75.437 E.0033
; LINE_WIDTH: 0.403388
G1 X102.207 Y75.569 E.005
; LINE_WIDTH: 0.404228
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407298
G1 X102.774 Y76.168 E.00536
; LINE_WIDTH: 0.409868
G1 X102.893 Y76.642 E.00625
G1 X102.894 Y76.7 E.00075
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
G1 X102.895 Y103.276 E.033
; LINE_WIDTH: 0.414118
G1 X102.853 Y103.613 E.0044
G1 X102.723 Y103.897 E.00403
; WIPE_START
G1 F12000
M204 S6000
G1 X102.671 Y104.011 E-.04779
G1 X102.346 Y104.35 E-.17824
G1 X101.937 Y104.544 E-.17235
G1 X101.6 Y104.589 E-.12913
G1 X101.483 Y104.57 E-.04473
G1 X101.367 Y104.552 E-.04473
G1 X101.251 Y104.533 E-.04473
G1 X100.992 Y104.533 E-.0983
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.798 Y98.941 Z2.02 F42000
G1 X79.775 Y81.691 Z2.02
G1 Z1.62
G1 E.8 F1800
; LINE_WIDTH: 0.386588
G1 F1843
M204 S5000
G1 X79.528 Y81.49 E.00383
G1 X79.402 Y81.237 E.0034
; LINE_WIDTH: 0.384908
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392828
G1 X79.53 Y80.633 E.00409
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00402
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389448
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.388448
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.405288
G1 X80.763 Y81.03 E.0043
G1 X80.752 Y81.166 E.00172
; LINE_WIDTH: 0.384988
G1 X80.66 Y81.423 E.00328
; LINE_WIDTH: 0.389288
G1 X80.476 Y81.625 E.00331
; LINE_WIDTH: 0.398428
G1 X80.122 Y81.76 E.0047
G1 X79.834 Y81.702 E.00366
; WIPE_START
G1 F12000
M204 S6000
G1 X79.528 Y81.49 E-.14159
G1 X79.402 Y81.237 E-.10725
G1 X79.391 Y80.937 E-.11422
G1 X79.53 Y80.633 E-.12694
G1 X79.783 Y80.429 E-.12355
G1 X80.154 Y80.378 E-.14233
G1 X80.164 Y80.382 E-.00413
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.02 F42000
G1 Z1.62
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1843
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
G1 F1843
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
G1 X84.173 Y87.856 Z2.02 F42000
G1 X84.654 Y90.754 Z2.02
G1 Z1.62
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1843
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.02 F42000
G1 Z1.62
G1 E.8 F1800
G1 F1843
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
G3 Z2.02 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 20/100
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.497458
G1 F1839
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X99.251 Y104.017 E.03366
; LINE_WIDTH: 0.533448
G1 X97.251 Y104.017 E.03366
; LINE_WIDTH: 0.533338
G1 X95.251 Y104.017 E.03365
; LINE_WIDTH: 0.533218
G1 X93.251 Y104.017 E.03364
; LINE_WIDTH: 0.533108
G1 X91.251 Y104.016 E.03363
; LINE_WIDTH: 0.532988
G1 X89.251 Y104.016 E.03363
; LINE_WIDTH: 0.532878
G1 X87.251 Y104.016 E.03362
; LINE_WIDTH: 0.532758
G1 X86.064 Y104.016 E.01994
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491035
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449361
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407698
G1 X78.36 Y104.203 E.09482
; LINE_WIDTH: 0.408248
G1 X78.102 Y104.151 E.00335
G1 X77.798 Y103.967 E.00453
; LINE_WIDTH: 0.405788
G1 X77.595 Y103.706 E.00418
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00558
G1 X77.496 Y76.724 E.33882
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411208
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
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.796 E.01766
; LINE_WIDTH: 0.450205
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491871
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533538
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X101.251 Y75.983 E.25561
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488855
G1 X101.637 Y75.824 E.00131
; LINE_WIDTH: 0.444261
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.403188
G1 X101.936 Y75.866 E.00282
; LINE_WIDTH: 0.404168
G1 X102.23 Y76.059 E.00444
; LINE_WIDTH: 0.408488
G1 X102.431 Y76.353 E.00455
G1 X102.504 Y76.7 E.00452
; LINE_WIDTH: 0.407678
G1 X102.504 Y103.301 E.33859
; LINE_WIDTH: 0.413618
G3 X102.348 Y103.8 I-1.149 J-.084 E.00682
; LINE_WIDTH: 0.407268
G1 X102.062 Y104.072 E.00503
; LINE_WIDTH: 0.406888
G1 X101.707 Y104.199 E.00479
; LINE_WIDTH: 0.448088
G1 X101.628 Y104.178 E.00115
; LINE_WIDTH: 0.490828
G1 X101.548 Y104.158 E.00126
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.00138
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05415
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.702 Y103.955 Z2.1 F42000
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.411138
G1 F1839
M204 S5000
G1 X102.436 Y104.281 E.0054
; LINE_WIDTH: 0.413638
G1 X102.177 Y104.452 E.00401
G1 X101.737 Y104.586 E.00594
; LINE_WIDTH: 0.448088
G1 X101.575 Y104.568 E.00229
; LINE_WIDTH: 0.490828
G1 X101.413 Y104.551 E.00252
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00274
G1 X99.251 Y104.533 E.03366
; LINE_WIDTH: 0.533448
G1 X97.251 Y104.533 E.03366
; LINE_WIDTH: 0.533338
G1 X95.251 Y104.533 E.03365
; LINE_WIDTH: 0.533218
G1 X93.251 Y104.532 E.03364
; LINE_WIDTH: 0.533108
G1 X91.251 Y104.532 E.03363
; LINE_WIDTH: 0.532988
G1 X89.251 Y104.532 E.03363
; LINE_WIDTH: 0.532878
G1 X87.251 Y104.532 E.03362
; LINE_WIDTH: 0.532758
G1 X86.25 Y104.532 E.01681
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491035
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449361
G1 X85.809 Y104.594 E.0021
; LINE_WIDTH: 0.407688
G1 X78.365 Y104.594 E.09475
G1 X78.09 Y104.547 E.00355
; LINE_WIDTH: 0.411188
G1 X77.709 Y104.389 E.00531
; LINE_WIDTH: 0.415268
G1 X77.414 Y104.126 E.00512
G1 X77.206 Y103.786 E.00517
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00646
G1 X77.104 Y76.724 E.33894
G1 X77.182 Y76.283 E.00571
; LINE_WIDTH: 0.403618
G1 X77.391 Y75.906 E.00543
; LINE_WIDTH: 0.408258
M73 P28 R11
G1 X77.698 Y75.619 E.00536
; LINE_WIDTH: 0.412798
G1 X78.064 Y75.457 E.00516
G1 X78.413 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.413 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.413 Y75.405 E.0256
; LINE_WIDTH: 0.409328
G1 X84.413 Y75.405 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450205
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491871
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533538
G1 X86.251 Y75.467 E.00251
G1 X101.251 Y75.467 E.25247
G1 X101.361 Y75.448 E.00188
; LINE_WIDTH: 0.494885
G1 X101.471 Y75.428 E.00174
; LINE_WIDTH: 0.456321
G1 X101.582 Y75.409 E.0016
; LINE_WIDTH: 0.417758
G1 X101.947 Y75.457 E.00481
; LINE_WIDTH: 0.412508
G1 X102.291 Y75.614 E.00487
G1 X102.515 Y75.8 E.00376
; LINE_WIDTH: 0.408298
G1 X102.783 Y76.184 E.00597
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.301 E.33859
G1 X102.866 Y103.516 E.00277
; LINE_WIDTH: 0.403958
G1 X102.733 Y103.905 E.00518
; WIPE_START
G1 F12000
M204 S6000
G1 X102.436 Y104.281 E-.18199
G1 X102.177 Y104.452 E-.11806
G1 X101.737 Y104.586 E-.17456
G1 X101.575 Y104.568 E-.06196
G1 X101.413 Y104.551 E-.06196
G1 X101.251 Y104.533 E-.06195
G1 X100.989 Y104.533 E-.09952
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.792 Y98.943 Z2.1 F42000
G1 X79.721 Y81.658 Z2.1
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.384948
G1 F1839
M204 S5000
G1 X79.504 Y81.462 E.0035
; LINE_WIDTH: 0.392888
G1 X79.384 Y81.15 E.00409
G1 X79.407 Y80.863 E.00353
; LINE_WIDTH: 0.392428
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399288
G1 X80.289 Y80.403 E.00343
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398628
G1 X80.767 Y81.033 E.0035
; LINE_WIDTH: 0.403408
G1 X80.735 Y81.267 E.00298
G1 X80.585 Y81.531 E.00381
; LINE_WIDTH: 0.394128
G1 X80.273 Y81.723 E.00451
; LINE_WIDTH: 0.387788
G1 X79.986 Y81.75 E.00348
; LINE_WIDTH: 0.384948
G1 X79.776 Y81.68 E.00265
; WIPE_START
G1 F12000
M204 S6000
G1 X79.504 Y81.462 E-.13245
G1 X79.384 Y81.15 E-.12705
G1 X79.407 Y80.863 E-.10946
G1 X79.537 Y80.621 E-.10443
G1 X79.751 Y80.449 E-.10439
G1 X80.016 Y80.374 E-.10445
G1 X80.219 Y80.396 E-.07776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.1 F42000
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1839
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
G1 F1839
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
G1 X84.173 Y87.856 Z2.1 F42000
G1 X84.654 Y90.754 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1839
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.1 F42000
G1 Z1.7
G1 E.8 F1800
G1 F1839
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
G3 Z2.1 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.78
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 21/100
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.78
G1 E.8 F1800
; LINE_WIDTH: 0.497488
G1 F1847
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.187 Y104.175 E.00305
; LINE_WIDTH: 0.407298
G1 X77.866 Y104.023 E.00452
; LINE_WIDTH: 0.406028
G1 X77.639 Y103.784 E.00417
; LINE_WIDTH: 0.405638
G1 X77.501 Y103.369 E.00553
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
; LINE_WIDTH: 0.411188
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405388
G1 X78.33 Y75.802 E.00421
; LINE_WIDTH: 0.410268
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.409798
G1 X82.429 Y75.797 E.0256
; LINE_WIDTH: 0.409328
G1 X84.429 Y75.796 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.796 E.01761
; LINE_WIDTH: 0.450205
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491871
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533538
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X100.064 Y75.983 E.23563
; LINE_WIDTH: 0.533438
G1 X101.251 Y75.983 E.01997
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488845
G1 X101.637 Y75.824 E.00131
; LINE_WIDTH: 0.444251
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.407518
G1 X102.115 Y75.959 E.00539
G1 X102.405 Y76.296 E.00566
; LINE_WIDTH: 0.409398
G1 X102.501 Y76.646 E.00464
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
; LINE_WIDTH: 0.414188
G3 X102.294 Y103.87 I-1.058 J-.066 E.00796
; LINE_WIDTH: 0.410578
G1 X102.007 Y104.102 E.00474
; LINE_WIDTH: 0.417328
G1 X101.638 Y104.198 E.00497
; LINE_WIDTH: 0.456081
G1 X101.582 Y104.178 E.00086
; LINE_WIDTH: 0.494835
G1 X101.526 Y104.157 E.00093
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.00101
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05417
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.702 Y103.965 Z2.18 F42000
G1 Z1.78
G1 E.8 F1800
; LINE_WIDTH: 0.408908
G1 F1847
M204 S5000
G1 X102.698 Y103.975 E.00014
; LINE_WIDTH: 0.412368
G1 X102.427 Y104.288 E.00534
G1 X102.213 Y104.434 E.00333
; LINE_WIDTH: 0.406278
G1 X101.761 Y104.584 E.00604
; LINE_WIDTH: 0.448648
G1 X101.591 Y104.567 E.00241
; LINE_WIDTH: 0.491118
G1 X101.421 Y104.55 E.00264
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00288
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.088 Y104.556 E.00433
; LINE_WIDTH: 0.407788
G1 X77.649 Y104.347 E.00619
; LINE_WIDTH: 0.406568
G1 X77.357 Y104.053 E.00526
; LINE_WIDTH: 0.413728
G1 X77.157 Y103.636 E.00597
G1 X77.105 Y103.288 E.00456
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
G1 X77.181 Y76.286 E.00569
; LINE_WIDTH: 0.403918
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.413568
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410268
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.409798
G1 X82.415 Y75.405 E.0256
; LINE_WIDTH: 0.409328
G1 X84.415 Y75.405 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.404 E.01779
; LINE_WIDTH: 0.450205
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491871
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533538
G1 X86.251 Y75.467 E.00251
G1 X100.251 Y75.467 E.23563
; LINE_WIDTH: 0.533438
G1 X101.251 Y75.467 E.01683
G1 X101.362 Y75.448 E.00189
; LINE_WIDTH: 0.494831
M73 P29 R11
G1 X101.472 Y75.428 E.00175
; LINE_WIDTH: 0.456225
G1 X101.582 Y75.409 E.0016
; LINE_WIDTH: 0.417618
G1 X101.883 Y75.445 E.00395
; LINE_WIDTH: 0.407148
G1 X102.27 Y75.601 E.0053
; LINE_WIDTH: 0.414868
G1 X102.576 Y75.862 E.00521
G1 X102.781 Y76.185 E.00497
; LINE_WIDTH: 0.411248
G1 X102.894 Y76.646 E.0061
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
G1 X102.859 Y103.551 E.00322
; LINE_WIDTH: 0.408908
G1 X102.723 Y103.909 E.00488
; WIPE_START
G1 F12000
M204 S6000
G1 X102.698 Y103.975 E-.02699
G1 X102.427 Y104.288 E-.15739
G1 X102.213 Y104.434 E-.09814
G1 X101.761 Y104.584 E-.18105
G1 X101.591 Y104.567 E-.065
G1 X101.421 Y104.55 E-.065
G1 X101.251 Y104.533 E-.065
G1 X100.984 Y104.533 E-.10145
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.787 Y98.943 Z2.18 F42000
G1 X79.711 Y81.649 Z2.18
G1 Z1.78
G1 E.8 F1800
; LINE_WIDTH: 0.384968
G1 F1847
M204 S5000
G1 X79.521 Y81.483 E.00302
G1 X79.394 Y81.211 E.00361
; LINE_WIDTH: 0.392868
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392348
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.397928
G1 X80.766 Y81.03 E.00346
; LINE_WIDTH: 0.397628
G1 X80.683 Y81.38 E.00445
; LINE_WIDTH: 0.389528
G1 X80.503 Y81.605 E.0035
; LINE_WIDTH: 0.389408
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.763 Y81.676 E.00281
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.11748
G1 X79.394 Y81.211 E-.11432
G1 X79.405 Y80.877 E-.12683
G1 X79.537 Y80.621 E-.10946
G1 X79.751 Y80.449 E-.10441
G1 X80.016 Y80.374 E-.10454
G1 X80.233 Y80.397 E-.08296
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.18 F42000
G1 Z1.78
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1847
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
G1 F1847
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
G1 X84.173 Y87.856 Z2.18 F42000
G1 X84.654 Y90.754 Z2.18
G1 Z1.78
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1847
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.18 F42000
G1 Z1.78
G1 E.8 F1800
G1 F1847
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
G3 Z2.18 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.86
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 22/100
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.86
G1 E.8 F1800
; LINE_WIDTH: 0.497468
G1 F1847
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411418
G1 X78.206 Y104.178 E.00282
G1 X77.866 Y104.023 E.0048
; LINE_WIDTH: 0.406578
G1 X77.651 Y103.799 E.00394
G1 X77.503 Y103.393 E.00548
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.275 E.02714
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.275 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.275 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.275 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.275 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.275 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.275 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.275 E.02557
; LINE_WIDTH: 0.409268
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
; LINE_WIDTH: 0.411218
G1 X77.754 Y76.076 E.00495
G1 X78.01 Y75.89 E.00406
; LINE_WIDTH: 0.404538
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410258
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450201
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491865
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533528
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X100.064 Y75.983 E.23563
; LINE_WIDTH: 0.533418
G1 X101.251 Y75.983 E.01997
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488858
G1 X101.637 Y75.824 E.00131
; LINE_WIDTH: 0.444298
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.409098
G1 X102.136 Y75.976 E.00574
G1 X102.416 Y76.314 E.00561
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00504
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
; LINE_WIDTH: 0.414098
G1 X102.47 Y103.502 E.00296
G1 X102.347 Y103.799 E.00417
; LINE_WIDTH: 0.405948
G1 X102.057 Y104.074 E.00506
G1 X101.715 Y104.196 E.0046
; LINE_WIDTH: 0.445601
G1 X101.633 Y104.176 E.00118
; LINE_WIDTH: 0.489595
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05415
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65274
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.69 Y103.969 Z2.26 F42000
G1 Z1.86
G1 E.8 F1800
; LINE_WIDTH: 0.414098
G1 F1847
M204 S5000
G1 X102.671 Y104.011 E.0006
; LINE_WIDTH: 0.404668
G1 X102.347 Y104.35 E.00591
; LINE_WIDTH: 0.410938
G1 X101.937 Y104.544 E.00583
; LINE_WIDTH: 0.418768
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.457041
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495315
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
; LINE_WIDTH: 0.411418
G1 X78.086 Y104.554 E.00437
G1 X77.661 Y104.351 E.00606
; LINE_WIDTH: 0.406578
G1 X77.357 Y104.053 E.00541
; LINE_WIDTH: 0.413718
G1 X77.157 Y103.636 E.00597
G1 X77.105 Y103.287 E.00456
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.287 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.287 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.287 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.287 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.287 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.287 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.287 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.287 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.287 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.287 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.287 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.287 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.287 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00718
G1 X77.182 Y76.283 E.00572
; LINE_WIDTH: 0.403598
G1 X77.391 Y75.906 E.00543
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.618 E.00536
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410258
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408858
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450201
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491865
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533528
G1 X86.251 Y75.467 E.00251
G1 X100.251 Y75.467 E.23563
; LINE_WIDTH: 0.533418
G1 X101.251 Y75.467 E.01683
G1 X101.362 Y75.448 E.00189
; LINE_WIDTH: 0.494795
G1 X101.472 Y75.428 E.00175
; LINE_WIDTH: 0.456171
G1 X101.583 Y75.409 E.00161
; LINE_WIDTH: 0.417548
G1 X101.882 Y75.445 E.00393
; LINE_WIDTH: 0.410838
G1 X102.296 Y75.615 E.00574
G1 X102.476 Y75.758 E.00295
; LINE_WIDTH: 0.406428
G1 X102.77 Y76.147 E.00618
; LINE_WIDTH: 0.409508
G1 X102.893 Y76.646 E.00658
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
M73 P30 R11
G1 X102.895 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.895 Y103.275 E.033
; LINE_WIDTH: 0.414098
G1 X102.853 Y103.613 E.00441
G1 X102.715 Y103.915 E.00429
; WIPE_START
G1 F12000
M204 S6000
G1 X102.671 Y104.011 E-.04038
G1 X102.347 Y104.35 E-.17781
G1 X101.937 Y104.544 E-.17274
G1 X101.6 Y104.589 E-.12912
G1 X101.483 Y104.57 E-.04474
G1 X101.367 Y104.552 E-.04474
G1 X101.251 Y104.533 E-.04474
G1 X100.973 Y104.533 E-.10573
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.777 Y98.942 Z2.26 F42000
G1 X79.701 Y81.641 Z2.26
G1 Z1.86
G1 E.8 F1800
; LINE_WIDTH: 0.384988
G1 F1847
M204 S5000
G1 X79.521 Y81.483 E.00287
G1 X79.402 Y81.237 E.00328
G1 X79.391 Y80.937 E.00361
; LINE_WIDTH: 0.392828
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392388
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.38 E.00447
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00349
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.752 Y81.672 E.00296
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.11307
G1 X79.402 Y81.237 E-.10388
G1 X79.391 Y80.937 E-.11428
G1 X79.53 Y80.633 E-.12686
G1 X79.751 Y80.449 E-.1095
G1 X80.016 Y80.374 E-.1044
G1 X80.246 Y80.399 E-.08801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.26 F42000
G1 Z1.86
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1847
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
G1 F1847
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
G1 X84.173 Y87.856 Z2.26 F42000
G1 X84.654 Y90.754 Z2.26
G1 Z1.86
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1847
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.26 F42000
G1 Z1.86
G1 E.8 F1800
G1 F1847
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
G3 Z2.26 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 1.94
; LAYER_HEIGHT: 0.08
; layer num/total_layer_count: 23/100
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z1.94
G1 E.8 F1800
; LINE_WIDTH: 0.497478
G1 F1847
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.103 Y104.149 E.00416
; LINE_WIDTH: 0.411218
G1 X77.776 Y103.946 E.00495
G1 X77.59 Y103.69 E.00406
; LINE_WIDTH: 0.404528
G1 X77.501 Y103.37 E.0042
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
G1 X77.496 Y76.724 E.00704
G1 X77.542 Y76.424 E.00388
; LINE_WIDTH: 0.411218
G1 X77.754 Y76.076 E.00524
G1 X78.01 Y75.89 E.00406
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450195
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491861
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533528
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X100.064 Y75.983 E.23563
; LINE_WIDTH: 0.533418
G1 X101.251 Y75.983 E.01997
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488855
G1 X101.637 Y75.824 E.00131
; LINE_WIDTH: 0.444291
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.408188
G1 X102.136 Y75.976 E.00572
G1 X102.415 Y76.311 E.00556
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.699 E.00507
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.699 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.699 E.02548
; LINE_WIDTH: 0.408268
G1 X102.503 Y82.699 E.0255
; LINE_WIDTH: 0.408458
G1 X102.503 Y84.699 E.02551
; LINE_WIDTH: 0.408658
G1 X102.503 Y86.699 E.02552
; LINE_WIDTH: 0.408858
G1 X102.503 Y88.699 E.02553
; LINE_WIDTH: 0.409058
G1 X102.503 Y90.699 E.02555
; LINE_WIDTH: 0.409248
G1 X102.503 Y92.699 E.02556
; LINE_WIDTH: 0.409448
G1 X102.502 Y94.699 E.02557
; LINE_WIDTH: 0.409648
G1 X102.502 Y96.699 E.02559
; LINE_WIDTH: 0.409838
G1 X102.502 Y98.699 E.0256
; LINE_WIDTH: 0.410038
G1 X102.502 Y100.699 E.02561
; LINE_WIDTH: 0.410238
G1 X102.502 Y103.276 E.03301
; LINE_WIDTH: 0.413708
G1 X102.472 Y103.498 E.0029
G1 X102.348 Y103.8 E.00421
; LINE_WIDTH: 0.411408
G1 X102.041 Y104.083 E.00537
G1 X101.715 Y104.196 E.00443
; LINE_WIDTH: 0.445585
G1 X101.633 Y104.176 E.00118
; LINE_WIDTH: 0.489581
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05417
G1 X101.251 Y104.017 E-.0531
G1 X99.533 Y104.017 E-.65273
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.68 Y103.975 Z2.34 F42000
G1 Z1.94
G1 E.8 F1800
; LINE_WIDTH: 0.413708
G1 F1847
M204 S5000
G1 X102.642 Y104.054 E.00113
; LINE_WIDTH: 0.406548
G1 X102.335 Y104.353 E.00544
; LINE_WIDTH: 0.411658
G1 X101.937 Y104.545 E.00569
; LINE_WIDTH: 0.418748
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.457025
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495301
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X77.983 Y104.518 E.00572
; LINE_WIDTH: 0.403558
G1 X77.605 Y104.309 E.00543
; LINE_WIDTH: 0.408248
G1 X77.319 Y104.002 E.00535
; LINE_WIDTH: 0.412798
G1 X77.157 Y103.636 E.00516
G1 X77.105 Y103.288 E.00454
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
G1 X77.182 Y76.283 E.00572
; LINE_WIDTH: 0.403578
G1 X77.391 Y75.905 E.00543
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00535
; LINE_WIDTH: 0.412778
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450195
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491861
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533528
G1 X86.251 Y75.467 E.00251
G1 X100.251 Y75.467 E.23563
; LINE_WIDTH: 0.533418
G1 X101.251 Y75.467 E.01683
G1 X101.362 Y75.448 E.00189
; LINE_WIDTH: 0.494751
G1 X101.473 Y75.428 E.00175
; LINE_WIDTH: 0.456085
G1 X101.584 Y75.409 E.00161
; LINE_WIDTH: 0.417418
G1 X101.883 Y75.445 E.00393
; LINE_WIDTH: 0.410748
G1 X102.292 Y75.613 E.00567
G1 X102.482 Y75.77 E.00317
; LINE_WIDTH: 0.406808
G1 X102.769 Y76.144 E.00599
; LINE_WIDTH: 0.409508
G1 X102.893 Y76.646 E.00661
G1 X102.894 Y76.699 E.00068
; LINE_WIDTH: 0.407868
G1 X102.894 Y78.699 E.02547
; LINE_WIDTH: 0.408068
G1 X102.894 Y80.699 E.02548
; LINE_WIDTH: 0.408268
G1 X102.894 Y82.699 E.0255
; LINE_WIDTH: 0.408458
G1 X102.895 Y84.699 E.02551
; LINE_WIDTH: 0.408658
G1 X102.895 Y86.699 E.02552
; LINE_WIDTH: 0.408858
G1 X102.895 Y88.699 E.02553
; LINE_WIDTH: 0.409058
G1 X102.895 Y90.699 E.02555
; LINE_WIDTH: 0.409248
G1 X102.895 Y92.699 E.02556
; LINE_WIDTH: 0.409448
G1 X102.895 Y94.699 E.02557
; LINE_WIDTH: 0.409648
G1 X102.895 Y96.699 E.02559
; LINE_WIDTH: 0.409838
G1 X102.895 Y98.699 E.0256
; LINE_WIDTH: 0.410038
G1 X102.895 Y100.699 E.02561
; LINE_WIDTH: 0.410238
G1 X102.895 Y103.276 E.03301
; LINE_WIDTH: 0.413708
G1 X102.853 Y103.611 E.00437
G1 X102.706 Y103.921 E.00444
; WIPE_START
G1 F12000
M204 S6000
G1 X102.642 Y104.054 E-.0559
G1 X102.335 Y104.353 E-.16279
G1 X101.937 Y104.545 E-.16822
G1 X101.6 Y104.589 E-.12912
G1 X101.483 Y104.57 E-.04474
G1 X101.367 Y104.552 E-.04474
G1 X101.251 Y104.533 E-.04474
G1 X100.962 Y104.533 E-.10975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.768 Y98.94 Z2.34 F42000
G1 X79.708 Y81.646 Z2.34
G1 Z1.94
G1 E.8 F1800
; LINE_WIDTH: 0.384948
G1 F1847
M204 S5000
G1 X79.504 Y81.462 E.00329
; LINE_WIDTH: 0.392868
G1 X79.384 Y81.15 E.00409
G1 X79.407 Y80.863 E.00352
; LINE_WIDTH: 0.392328
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399208
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398208
G1 X80.58 Y81.541 E.0035
; LINE_WIDTH: 0.397788
G1 X80.273 Y81.723 E.00442
; LINE_WIDTH: 0.387828
G1 X79.986 Y81.75 E.00348
; LINE_WIDTH: 0.384948
G1 X79.759 Y81.674 E.00287
; WIPE_START
G1 F12000
M204 S6000
G1 X79.504 Y81.462 E-.12612
G1 X79.384 Y81.15 E-.12701
G1 X79.407 Y80.863 E-.10936
G1 X79.537 Y80.621 E-.10444
G1 X79.751 Y80.449 E-.10447
G1 X80.016 Y80.374 E-.10446
G1 X80.236 Y80.398 E-.08415
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.34 F42000
G1 Z1.94
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1847
M204 S5000
G1 X83.059 Y79.84 E.01024
G1 X83.242 Y80.185 E.00512
G1 X83.425 Y80.529 E.00512
M73 P31 R11
G1 X82.737 Y80.895 E.01024
G1 X82.399 Y80.26 E.00945
M204 S10000
G1 X82.922 Y80.327 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.394328
G1 F1847
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
G1 X84.173 Y87.856 Z2.34 F42000
G1 X84.654 Y90.754 Z2.34
G1 Z1.94
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1847
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.34 F42000
G1 Z1.94
G1 E.8 F1800
G1 F1847
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
G3 Z2.34 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.02
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 24/100
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.02
G1 E.8 F1800
; LINE_WIDTH: 0.497448
G1 F1851
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05046
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.411048
G1 X78.116 Y104.153 E.00326
G1 X77.8 Y103.971 E.00468
; LINE_WIDTH: 0.405938
G1 X77.626 Y103.756 E.00351
; LINE_WIDTH: 0.405918
G1 X77.5 Y103.37 E.00515
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.28 I42.467 J-1.093 E.02677
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
G1 X77.496 Y76.725 E.00709
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411188
G1 X77.754 Y76.076 E.00495
G1 X78.01 Y75.89 E.00406
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410258
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.425 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450195
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491861
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533528
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X98.064 Y75.983 E.20197
; LINE_WIDTH: 0.533418
G1 X101.251 Y75.983 E.05363
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488905
G1 X101.637 Y75.824 E.00131
; LINE_WIDTH: 0.444411
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.403698
G1 X101.94 Y75.869 E.00288
; LINE_WIDTH: 0.407478
G1 X102.265 Y76.093 E.00503
G1 X102.457 Y76.428 E.0049
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.699 E.00351
G1 X102.504 Y78.699 E.02546
; LINE_WIDTH: 0.407808
G1 X102.504 Y82.699 E.05093
; LINE_WIDTH: 0.407948
G1 X102.504 Y86.699 E.05095
; LINE_WIDTH: 0.408078
G1 X102.504 Y90.699 E.05097
; LINE_WIDTH: 0.408218
G1 X102.504 Y94.699 E.05098
; LINE_WIDTH: 0.408348
G1 X102.504 Y98.699 E.051
; LINE_WIDTH: 0.408488
G1 X102.504 Y103.275 E.05837
; LINE_WIDTH: 0.411098
G1 X102.476 Y103.498 E.00288
G1 X102.347 Y103.8 E.00422
; LINE_WIDTH: 0.406758
G1 X102.057 Y104.075 E.00508
G1 X101.715 Y104.196 E.0046
; LINE_WIDTH: 0.445608
G1 X101.633 Y104.176 E.00118
; LINE_WIDTH: 0.489588
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05414
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65276
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.689 Y103.983 Z2.42 F42000
G1 Z2.02
G1 E.8 F1800
; LINE_WIDTH: 0.411098
G1 F1851
M204 S5000
G1 X102.681 Y104.002 E.00026
; LINE_WIDTH: 0.404388
G1 X102.354 Y104.34 E.00594
; LINE_WIDTH: 0.411068
G1 X101.936 Y104.544 E.00597
; LINE_WIDTH: 0.418818
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.457068
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495318
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00198
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05046
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.411048
G1 X77.962 Y104.516 E.00527
G1 X77.573 Y104.286 E.00581
; LINE_WIDTH: 0.403068
G1 X77.295 Y103.955 E.00544
; LINE_WIDTH: 0.411318
G1 X77.138 Y103.571 E.00533
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
G1 X77.104 Y76.725 E.00722
G1 X77.182 Y76.283 E.00573
; LINE_WIDTH: 0.403538
G1 X77.391 Y75.905 E.00543
; LINE_WIDTH: 0.408238
G1 X77.698 Y75.619 E.00535
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410258
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450195
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491861
G1 X86.103 Y75.446 E.00231
; LINE_WIDTH: 0.533528
G1 X86.251 Y75.467 E.00251
G1 X98.251 Y75.467 E.20197
; LINE_WIDTH: 0.533418
G1 X101.251 Y75.467 E.05049
G1 X101.362 Y75.448 E.0019
; LINE_WIDTH: 0.494758
G1 X101.473 Y75.428 E.00175
; LINE_WIDTH: 0.456118
G1 X101.585 Y75.409 E.00161
; LINE_WIDTH: 0.417478
G1 X101.778 Y75.428 E.00254
; LINE_WIDTH: 0.403698
G1 X102.126 Y75.53 E.00457
; LINE_WIDTH: 0.403888
G1 X102.479 Y75.759 E.0053
; LINE_WIDTH: 0.410858
G1 X102.768 Y76.147 E.00622
G1 X102.893 Y76.646 E.0066
; LINE_WIDTH: 0.409508
G1 X102.894 Y76.699 E.00068
; LINE_WIDTH: 0.407738
G1 X102.895 Y80.699 E.05092
; LINE_WIDTH: 0.407878
G1 X102.895 Y84.699 E.05094
; LINE_WIDTH: 0.408008
G1 X102.895 Y88.699 E.05096
; LINE_WIDTH: 0.408148
G1 X102.895 Y92.699 E.05098
; LINE_WIDTH: 0.408278
G1 X102.895 Y96.699 E.05099
; LINE_WIDTH: 0.408418
G1 X102.896 Y100.699 E.05101
; LINE_WIDTH: 0.408558
G1 X102.896 Y103.275 E.03286
; LINE_WIDTH: 0.411098
G1 X102.857 Y103.589 E.00405
G1 X102.712 Y103.928 E.00473
; WIPE_START
G1 F12000
M204 S6000
G1 X102.681 Y104.002 E-.03049
G1 X102.354 Y104.34 E-.17869
G1 X101.936 Y104.544 E-.17675
G1 X101.6 Y104.589 E-.12917
G1 X101.483 Y104.57 E-.04471
G1 X101.367 Y104.552 E-.04471
G1 X101.251 Y104.533 E-.04471
G1 X100.96 Y104.533 E-.11076
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.766 Y98.941 Z2.42 F42000
G1 X79.69 Y81.631 Z2.42
G1 Z2.02
G1 E.8 F1800
; LINE_WIDTH: 0.384968
G1 F1851
M204 S5000
G1 X79.521 Y81.483 E.00268
G1 X79.394 Y81.211 E.0036
; LINE_WIDTH: 0.392908
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392428
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00342
; LINE_WIDTH: 0.412988
G1 X80.526 Y80.548 E.00358
G1 X80.695 Y80.766 E.00355
; LINE_WIDTH: 0.406128
G1 X80.762 Y81.03 E.00346
; LINE_WIDTH: 0.406108
G1 X80.757 Y81.132 E.00128
; LINE_WIDTH: 0.389448
G1 X80.679 Y81.394 E.00332
G1 X80.502 Y81.603 E.00333
; LINE_WIDTH: 0.384968
G1 X80.259 Y81.728 E.00328
G1 X79.986 Y81.75 E.00328
G1 X79.737 Y81.667 E.00315
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.10755
G1 X79.394 Y81.211 E-.11419
G1 X79.405 Y80.877 E-.12699
G1 X79.537 Y80.621 E-.10943
G1 X79.751 Y80.449 E-.10446
G1 X80.016 Y80.374 E-.10441
G1 X80.259 Y80.4 E-.09298
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.42 F42000
G1 Z2.02
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1851
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
G1 F1851
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
G1 X84.173 Y87.856 Z2.42 F42000
G1 X84.654 Y90.754 Z2.42
G1 Z2.02
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1851
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.42 F42000
G1 Z2.02
G1 E.8 F1800
G1 F1851
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
G3 Z2.42 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 25/100
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.1
M73 P31 R10
G1 E.8 F1800
; LINE_WIDTH: 0.497468
G1 F1847
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
M73 P32 R10
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
; LINE_WIDTH: 0.411398
G1 X78.206 Y104.178 E.00282
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
; LINE_WIDTH: 0.413448
G1 X77.616 Y76.271 E.0019
G1 X77.754 Y76.076 E.00309
; LINE_WIDTH: 0.411198
G1 X78.01 Y75.889 E.00406
; LINE_WIDTH: 0.405388
G1 X78.331 Y75.802 E.00421
; LINE_WIDTH: 0.410258
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.409788
G1 X82.429 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.429 Y75.796 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.796 E.01761
; LINE_WIDTH: 0.450191
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491855
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533518
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X98.064 Y75.983 E.20196
; LINE_WIDTH: 0.533408
G1 X101.251 Y75.983 E.05362
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488858
G1 X101.637 Y75.824 E.00131
; LINE_WIDTH: 0.444328
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.408158
G1 X102.136 Y75.976 E.00572
G1 X102.415 Y76.311 E.00556
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00507
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
; LINE_WIDTH: 0.414078
G1 X102.471 Y103.502 E.00296
G1 X102.347 Y103.799 E.00417
; LINE_WIDTH: 0.407868
G1 X102.057 Y104.076 E.00511
G1 X101.719 Y104.194 E.00455
; LINE_WIDTH: 0.443991
G1 X101.636 Y104.175 E.00119
; LINE_WIDTH: 0.488785
G1 X101.553 Y104.156 E.00132
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00144
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05415
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65274
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.681 Y103.988 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; LINE_WIDTH: 0.414078
G1 F1847
M204 S5000
G1 X102.67 Y104.012 E.00034
; LINE_WIDTH: 0.404278
G1 X102.345 Y104.351 E.00593
; LINE_WIDTH: 0.413958
G1 X102.002 Y104.524 E.00496
; LINE_WIDTH: 0.419518
G1 X101.6 Y104.588 E.00534
; LINE_WIDTH: 0.457538
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495558
G1 X101.367 Y104.551 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
; LINE_WIDTH: 0.411398
G1 X78.087 Y104.554 E.00438
G1 X77.661 Y104.351 E.00607
; LINE_WIDTH: 0.406568
G1 X77.357 Y104.052 E.0054
; LINE_WIDTH: 0.413728
G1 X77.157 Y103.636 E.00596
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
G1 X77.104 Y79.287 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.287 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00718
G1 X77.182 Y76.283 E.00573
; LINE_WIDTH: 0.403528
G1 X77.391 Y75.905 E.00543
; LINE_WIDTH: 0.408228
G1 X77.698 Y75.619 E.00535
; LINE_WIDTH: 0.413578
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410258
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.415 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.415 Y75.405 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.404 E.01779
; LINE_WIDTH: 0.450191
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491855
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533518
G1 X86.251 Y75.467 E.00251
G1 X98.251 Y75.467 E.20196
; LINE_WIDTH: 0.533408
G1 X101.251 Y75.467 E.05048
G1 X101.363 Y75.448 E.0019
; LINE_WIDTH: 0.494668
G1 X101.474 Y75.428 E.00176
; LINE_WIDTH: 0.455948
G1 X101.585 Y75.409 E.00162
; LINE_WIDTH: 0.417228
G1 X101.883 Y75.445 E.00391
; LINE_WIDTH: 0.410758
G1 X102.292 Y75.613 E.00567
G1 X102.483 Y75.77 E.00317
; LINE_WIDTH: 0.406808
G1 X102.769 Y76.144 E.00599
; LINE_WIDTH: 0.409518
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
G1 X102.895 Y103.275 E.033
; LINE_WIDTH: 0.414078
G1 X102.853 Y103.613 E.00441
G1 X102.706 Y103.933 E.00456
; WIPE_START
G1 F12000
M204 S6000
G1 X102.67 Y104.012 E-.03273
G1 X102.345 Y104.351 E-.17874
G1 X102.002 Y104.524 E-.14588
G1 X101.6 Y104.588 E-.15478
G1 X101.483 Y104.57 E-.04471
G1 X101.367 Y104.551 E-.04471
G1 X101.251 Y104.533 E-.04471
G1 X100.952 Y104.533 E-.11375
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.759 Y98.94 Z2.5 F42000
G1 X79.681 Y81.624 Z2.5
G1 Z2.1
G1 E.8 F1800
; LINE_WIDTH: 0.384928
G1 F1847
M204 S5000
G1 X79.521 Y81.483 E.00255
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392868
G1 X79.74 Y80.457 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398228
G1 X80.58 Y81.541 E.0035
; LINE_WIDTH: 0.397728
G1 X80.273 Y81.723 E.00442
; LINE_WIDTH: 0.387868
G1 X79.986 Y81.75 E.00348
; LINE_WIDTH: 0.384928
G1 X79.727 Y81.663 E.00328
G1 X79.727 Y81.663 E0
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.10375
G1 X79.402 Y81.237 E-.10384
G1 X79.388 Y80.964 E-.104
G1 X79.494 Y80.683 E-.11406
G1 X79.74 Y80.457 E-.12699
G1 X80.016 Y80.374 E-.10953
G1 X80.272 Y80.402 E-.09784
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1847
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
G1 F1847
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
G1 X84.173 Y87.856 Z2.5 F42000
G1 X84.654 Y90.754 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1847
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.5 F42000
G1 Z2.1
G1 E.8 F1800
G1 F1847
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
G3 Z2.5 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.18
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 26/100
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.18
G1 E.8 F1800
; LINE_WIDTH: 0.497458
G1 F1850
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05046
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09483
; LINE_WIDTH: 0.413048
G3 X77.865 Y104.022 I.107 J-1.075 E.00693
; LINE_WIDTH: 0.410988
G1 X77.598 Y103.708 E.00529
G1 X77.5 Y103.37 E.00452
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.28 I42.477 J-1.093 E.02677
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.28 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.28 E.02561
; LINE_WIDTH: 0.409898
G1 X77.497 Y95.28 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.28 E.02559
; LINE_WIDTH: 0.409648
M73 P33 R10
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
; LINE_WIDTH: 0.413568
G1 X77.61 Y76.283 E.00172
G1 X77.755 Y76.075 E.00328
; LINE_WIDTH: 0.411208
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404538
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450185
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491851
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533518
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X98.064 Y75.983 E.20196
; LINE_WIDTH: 0.533398
G1 X101.251 Y75.983 E.05362
G1 X101.39 Y76.02 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488915
G1 X101.637 Y75.824 E.00131
; LINE_WIDTH: 0.444451
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.405128
G1 X102.02 Y75.905 E.004
; LINE_WIDTH: 0.405928
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
; LINE_WIDTH: 0.403968
G1 X102.09 Y104.056 E.0053
; LINE_WIDTH: 0.405218
G1 X101.707 Y104.199 E.00517
; LINE_WIDTH: 0.448001
G1 X101.628 Y104.178 E.00115
; LINE_WIDTH: 0.490785
G1 X101.548 Y104.158 E.00126
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.00138
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05415
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.673 Y103.99 Z2.58 F42000
G1 Z2.18
G1 E.8 F1800
; LINE_WIDTH: 0.411808
G1 F1850
M204 S5000
G1 X102.436 Y104.281 E.00483
; LINE_WIDTH: 0.413198
G1 X102.176 Y104.453 E.00402
G1 X101.738 Y104.586 E.00591
; LINE_WIDTH: 0.448001
G1 X101.576 Y104.568 E.00229
; LINE_WIDTH: 0.490785
G1 X101.413 Y104.551 E.00252
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00275
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05046
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.413048
G1 X77.962 Y104.515 E.0053
G1 X77.614 Y104.317 E.00518
; LINE_WIDTH: 0.403968
G1 X77.298 Y103.967 E.00594
; LINE_WIDTH: 0.411548
G1 X77.138 Y103.571 E.00549
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
G1 X77.181 Y76.285 E.00568
; LINE_WIDTH: 0.403918
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408848
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450185
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491851
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533518
G1 X86.251 Y75.467 E.00251
G1 X98.251 Y75.467 E.20196
; LINE_WIDTH: 0.533398
G1 X101.251 Y75.467 E.05049
G1 X101.363 Y75.448 E.0019
; LINE_WIDTH: 0.494681
G1 X101.474 Y75.428 E.00176
; LINE_WIDTH: 0.455985
G1 X101.586 Y75.409 E.00162
; LINE_WIDTH: 0.417288
G1 X101.832 Y75.437 E.00323
; LINE_WIDTH: 0.403388
G1 X102.207 Y75.569 E.005
; LINE_WIDTH: 0.404818
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.410658
G1 X102.768 Y76.145 E.00549
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
; LINE_WIDTH: 0.403968
G1 X102.726 Y103.926 E.00529
; LINE_WIDTH: 0.411808
G1 X102.711 Y103.944 E.0003
; WIPE_START
G1 F12000
M204 S6000
G1 X102.436 Y104.281 E-.16534
G1 X102.176 Y104.453 E-.11831
G1 X101.738 Y104.586 E-.17394
G1 X101.576 Y104.568 E-.06208
G1 X101.413 Y104.551 E-.06208
G1 X101.251 Y104.533 E-.06208
G1 X100.945 Y104.533 E-.11618
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.753 Y98.939 Z2.58 F42000
G1 X79.692 Y81.633 Z2.58
G1 Z2.18
G1 E.8 F1800
; LINE_WIDTH: 0.384968
G1 F1850
M204 S5000
G1 X79.521 Y81.483 E.00272
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392848
G1 X79.74 Y80.458 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398608
G1 X80.767 Y81.033 E.0035
; LINE_WIDTH: 0.403408
G1 X80.735 Y81.267 E.00298
G1 X80.602 Y81.511 E.0035
; LINE_WIDTH: 0.402688
G1 X80.358 Y81.696 E.00385
; LINE_WIDTH: 0.393208
G1 X80 Y81.75 E.00444
; LINE_WIDTH: 0.387548
G1 X79.74 Y81.668 E.0033
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.10865
G1 X79.402 Y81.237 E-.1039
G1 X79.388 Y80.964 E-.10394
G1 X79.494 Y80.683 E-.11411
G1 X79.74 Y80.458 E-.12696
G1 X80.016 Y80.374 E-.10947
G1 X80.259 Y80.4 E-.09296
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.58 F42000
G1 Z2.18
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1850
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
G1 F1850
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
G1 X84.173 Y87.856 Z2.58 F42000
G1 X84.654 Y90.754 Z2.58
G1 Z2.18
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1850
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.58 F42000
G1 Z2.18
G1 E.8 F1800
G1 F1850
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
G3 Z2.58 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.26
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 27/100
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.26
G1 E.8 F1800
; LINE_WIDTH: 0.497488
G1 F1846
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411418
G1 X78.206 Y104.178 E.00282
G1 X77.865 Y104.022 E.00482
; LINE_WIDTH: 0.404508
G1 X77.605 Y103.719 E.00505
G1 X77.501 Y103.37 E.0046
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
G1 X77.496 Y76.729 E.00698
G1 X77.551 Y76.403 E.00422
; LINE_WIDTH: 0.404578
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.407528
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
; LINE_WIDTH: 0.450185
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491851
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533518
M73 P34 R10
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X96.064 Y75.983 E.1683
; LINE_WIDTH: 0.533408
G1 X101.251 Y75.983 E.08727
G1 X101.39 Y76.019 E.00242
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488848
G1 X101.637 Y75.824 E.00131
; LINE_WIDTH: 0.444338
G1 X101.72 Y75.806 E.00118
; LINE_WIDTH: 0.403698
G1 X101.94 Y75.869 E.00288
; LINE_WIDTH: 0.411038
G1 X102.279 Y76.112 E.00536
G1 X102.457 Y76.427 E.00465
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00352
; LINE_WIDTH: 0.407908
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408138
G1 X102.503 Y80.7 E.02549
; LINE_WIDTH: 0.408358
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408588
G1 X102.503 Y84.7 E.02552
; LINE_WIDTH: 0.408808
G1 X102.503 Y86.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.503 Y88.7 E.02555
; LINE_WIDTH: 0.409258
G1 X102.502 Y90.7 E.02556
; LINE_WIDTH: 0.409488
G1 X102.502 Y92.7 E.02558
; LINE_WIDTH: 0.409708
G1 X102.502 Y94.7 E.02559
; LINE_WIDTH: 0.409938
G1 X102.502 Y96.7 E.0256
; LINE_WIDTH: 0.410158
G1 X102.502 Y98.7 E.02562
; LINE_WIDTH: 0.410388
G1 X102.501 Y100.7 E.02563
; LINE_WIDTH: 0.410608
G1 X102.501 Y103.276 E.03304
; LINE_WIDTH: 0.413558
G1 X102.472 Y103.501 E.00293
G1 X102.347 Y103.8 E.00418
; LINE_WIDTH: 0.406658
G1 X102.056 Y104.076 E.00509
G1 X101.715 Y104.196 E.00459
; LINE_WIDTH: 0.445565
G1 X101.633 Y104.176 E.00118
; LINE_WIDTH: 0.489571
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05418
G1 X101.251 Y104.017 E-.0531
G1 X99.533 Y104.017 E-.65273
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.675 Y104.001 Z2.66 F42000
G1 Z2.26
G1 E.8 F1800
; LINE_WIDTH: 0.413558
G1 F1846
M204 S5000
G1 X102.67 Y104.012 E.00016
; LINE_WIDTH: 0.404308
G1 X102.344 Y104.351 E.00594
; LINE_WIDTH: 0.410998
G1 X101.937 Y104.544 E.00579
; LINE_WIDTH: 0.418798
G1 X101.599 Y104.589 E.00446
; LINE_WIDTH: 0.457058
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495318
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
; LINE_WIDTH: 0.411418
G1 X78.087 Y104.554 E.00437
G1 X77.661 Y104.351 E.00607
; LINE_WIDTH: 0.406968
G1 X77.352 Y104.046 E.00551
; LINE_WIDTH: 0.413578
G1 X77.157 Y103.636 E.00586
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
G3 X77.11 Y76.671 I3.338 J-.28 E.00787
; LINE_WIDTH: 0.406478
G1 X77.205 Y76.229 E.00575
; LINE_WIDTH: 0.404578
G1 X77.426 Y75.864 E.00538
; LINE_WIDTH: 0.403918
G1 X77.756 Y75.585 E.00545
; LINE_WIDTH: 0.408208
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
; LINE_WIDTH: 0.450185
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491851
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533518
G1 X86.251 Y75.467 E.00251
G1 X96.251 Y75.467 E.1683
; LINE_WIDTH: 0.533408
G1 X101.251 Y75.467 E.08414
G1 X101.363 Y75.448 E.00191
; LINE_WIDTH: 0.494565
G1 X101.475 Y75.428 E.00177
; LINE_WIDTH: 0.455771
G1 X101.587 Y75.409 E.00162
; LINE_WIDTH: 0.416978
G1 X101.947 Y75.457 E.00474
; LINE_WIDTH: 0.414838
G1 X102.29 Y75.614 E.00489
G1 X102.535 Y75.818 E.00412
; LINE_WIDTH: 0.407198
G1 X102.769 Y76.16 E.00527
; LINE_WIDTH: 0.409858
G1 X102.893 Y76.642 E.00637
G1 X102.894 Y76.7 E.00075
; LINE_WIDTH: 0.407908
G1 X102.894 Y78.7 E.02547
; LINE_WIDTH: 0.408138
G1 X102.894 Y80.7 E.02549
; LINE_WIDTH: 0.408358
G1 X102.894 Y82.7 E.0255
; LINE_WIDTH: 0.408588
G1 X102.894 Y84.7 E.02552
; LINE_WIDTH: 0.408808
G1 X102.894 Y86.7 E.02553
; LINE_WIDTH: 0.409038
G1 X102.894 Y88.7 E.02555
; LINE_WIDTH: 0.409258
G1 X102.895 Y90.7 E.02556
; LINE_WIDTH: 0.409488
G1 X102.895 Y92.7 E.02558
; LINE_WIDTH: 0.409708
G1 X102.895 Y94.7 E.02559
; LINE_WIDTH: 0.409938
G1 X102.895 Y96.7 E.0256
; LINE_WIDTH: 0.410158
G1 X102.895 Y98.7 E.02562
; LINE_WIDTH: 0.410388
G1 X102.895 Y100.7 E.02563
; LINE_WIDTH: 0.410608
G1 X102.895 Y103.276 E.03304
; LINE_WIDTH: 0.413558
G1 X102.853 Y103.613 E.00439
G1 X102.7 Y103.946 E.00474
; WIPE_START
G1 F12000
M204 S6000
G1 X102.67 Y104.012 E-.02746
G1 X102.344 Y104.351 E-.17888
G1 X101.937 Y104.544 E-.17132
G1 X101.599 Y104.589 E-.12932
G1 X101.483 Y104.57 E-.04468
G1 X101.367 Y104.552 E-.04468
G1 X101.251 Y104.533 E-.04468
G1 X100.938 Y104.533 E-.11896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.746 Y98.939 Z2.66 F42000
G1 X79.663 Y81.607 Z2.66
G1 Z2.26
G1 E.8 F1800
; LINE_WIDTH: 0.384948
G1 F1846
M204 S5000
G1 X79.521 Y81.483 E.00226
G1 X79.402 Y81.237 E.00328
G1 X79.388 Y80.964 E.00328
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392928
G1 X79.74 Y80.457 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399188
G1 X80.289 Y80.403 E.00342
; LINE_WIDTH: 0.413008
G1 X80.526 Y80.548 E.00359
G1 X80.695 Y80.766 E.00356
; LINE_WIDTH: 0.406148
G1 X80.762 Y81.03 E.00346
G1 X80.757 Y81.132 E.00128
; LINE_WIDTH: 0.385988
G1 X80.677 Y81.393 E.00329
; LINE_WIDTH: 0.389428
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.728 E.00332
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00327
G1 X79.708 Y81.647 E.0003
; WIPE_START
G1 F12000
M204 S6000
G1 X79.521 Y81.483 E-.09442
G1 X79.402 Y81.237 E-.10384
G1 X79.388 Y80.964 E-.10398
G1 X79.494 Y80.683 E-.11411
G1 X79.74 Y80.457 E-.12704
G1 X80.016 Y80.374 E-.10949
G1 X80.289 Y80.403 E-.10427
G1 X80.295 Y80.407 E-.00284
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.66 F42000
G1 Z2.26
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1846
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
G1 F1846
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
G1 X84.173 Y87.856 Z2.66 F42000
G1 X84.654 Y90.754 Z2.66
G1 Z2.26
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1846
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.66 F42000
G1 Z2.26
G1 E.8 F1800
G1 F1846
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
G3 Z2.66 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.34
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 28/100
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.34
G1 E.8 F1800
; LINE_WIDTH: 0.497468
G1 F1846
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.187 Y104.176 E.00305
; LINE_WIDTH: 0.407998
G1 X77.865 Y104.022 E.00454
; LINE_WIDTH: 0.406478
G1 X77.604 Y103.719 E.00508
G1 X77.5 Y103.37 E.00462
; LINE_WIDTH: 0.410298
G3 X77.498 Y101.281 I44.874 J-1.093 E.02677
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.281 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.281 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.281 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.281 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.281 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.281 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.281 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.281 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.281 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.281 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.281 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.281 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.0071
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411218
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405368
G1 X78.33 Y75.802 E.0042
; LINE_WIDTH: 0.410268
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.409788
G1 X82.429 Y75.797 E.02559
; LINE_WIDTH: 0.409318
G1 X84.429 Y75.796 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.796 E.01761
; LINE_WIDTH: 0.450185
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491851
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533518
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X98.064 Y75.983 E.20196
; LINE_WIDTH: 0.533398
G1 X101.251 Y75.983 E.05363
G1 X101.39 Y76.02 E.00242
G1 X101.433 Y76.089 E.00137
G1 X101.471 Y75.86 E.00389
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488951
G1 X101.637 Y75.824 E.00131
; LINE_WIDTH: 0.444535
G1 X101.721 Y75.806 E.00118
; LINE_WIDTH: 0.403098
G1 X101.935 Y75.866 E.0028
; LINE_WIDTH: 0.404068
G1 X102.224 Y76.053 E.00435
; LINE_WIDTH: 0.405658
G1 X102.43 Y76.354 E.00461
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.0045
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
M73 P35 R10
G1 X102.502 Y96.7 E.02559
; LINE_WIDTH: 0.409838
G1 X102.502 Y98.7 E.0256
; LINE_WIDTH: 0.410028
G1 X102.502 Y100.7 E.02561
; LINE_WIDTH: 0.410228
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413708
G1 X102.472 Y103.498 E.0029
G1 X102.348 Y103.8 E.00422
; LINE_WIDTH: 0.410778
G1 X102.042 Y104.083 E.00535
G1 X101.715 Y104.196 E.00444
; LINE_WIDTH: 0.445598
G1 X101.633 Y104.176 E.00118
; LINE_WIDTH: 0.489588
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05415
G1 X101.251 Y104.017 E-.05311
G1 X99.533 Y104.017 E-.65275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.666 Y104.013 Z2.74 F42000
G1 Z2.34
G1 E.8 F1800
; LINE_WIDTH: 0.406668
G1 F1846
M204 S5000
G1 X102.641 Y104.055 E.00063
G1 X102.33 Y104.357 E.0055
; LINE_WIDTH: 0.411628
G1 X101.937 Y104.545 E.0056
; LINE_WIDTH: 0.418808
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.457065
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495321
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.191 Y104.571 E.003
; LINE_WIDTH: 0.410258
G1 X77.803 Y104.443 E.00523
G1 X77.608 Y104.31 E.00302
; LINE_WIDTH: 0.404438
G1 X77.324 Y104.003 E.00528
; LINE_WIDTH: 0.409838
G1 X77.136 Y103.556 E.0062
; LINE_WIDTH: 0.410298
G1 X77.105 Y103.29 E.00343
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
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403938
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408268
G1 X77.698 Y75.618 E.00538
; LINE_WIDTH: 0.413558
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410268
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.415 Y75.405 E.02559
; LINE_WIDTH: 0.409318
G1 X84.415 Y75.405 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.404 E.01779
; LINE_WIDTH: 0.450185
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491851
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533518
G1 X86.251 Y75.467 E.00251
G1 X98.251 Y75.467 E.20196
; LINE_WIDTH: 0.533398
G1 X101.251 Y75.467 E.05049
G1 X101.363 Y75.448 E.00191
; LINE_WIDTH: 0.494625
G1 X101.475 Y75.428 E.00177
; LINE_WIDTH: 0.455881
G1 X101.587 Y75.409 E.00163
; LINE_WIDTH: 0.417138
G1 X101.947 Y75.457 E.00473
; LINE_WIDTH: 0.412098
G1 X102.291 Y75.613 E.00487
G1 X102.504 Y75.789 E.00356
; LINE_WIDTH: 0.406698
G1 X102.776 Y76.159 E.00583
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.0064
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
G3 X102.88 Y103.441 I-4.024 J.288 E.00951
; LINE_WIDTH: 0.404888
G1 X102.755 Y103.861 E.00554
; LINE_WIDTH: 0.406668
G1 X102.696 Y103.961 E.00147
; WIPE_START
G1 F12000
M204 S6000
G1 X102.641 Y104.055 E-.04161
G1 X102.33 Y104.357 E-.16468
G1 X101.937 Y104.545 E-.16554
G1 X101.6 Y104.589 E-.1293
G1 X101.483 Y104.57 E-.04471
G1 X101.367 Y104.552 E-.04471
G1 X101.251 Y104.533 E-.04471
G1 X100.923 Y104.533 E-.12474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.729 Y98.941 Z2.74 F42000
G1 X79.605 Y81.579 Z2.74
G1 Z2.34
G1 E.8 F1800
; LINE_WIDTH: 0.398268
G1 F1846
M204 S5000
G1 X79.416 Y81.29 E.00428
; LINE_WIDTH: 0.385708
G1 X79.391 Y80.937 E.00426
; LINE_WIDTH: 0.392828
G1 X79.53 Y80.633 E.00409
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00402
G1 X80.154 Y80.378 E.00463
; LINE_WIDTH: 0.389428
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.388328
G1 X80.661 Y80.706 E.00386
; LINE_WIDTH: 0.405288
G1 X80.763 Y81.03 E.00429
G1 X80.752 Y81.166 E.00172
; LINE_WIDTH: 0.384988
G1 X80.65 Y81.44 E.00351
; LINE_WIDTH: 0.393028
G1 X80.401 Y81.672 E.00417
; LINE_WIDTH: 0.399268
G1 X80.125 Y81.76 E.00361
G1 X79.851 Y81.726 E.00344
; LINE_WIDTH: 0.398268
G1 X79.653 Y81.613 E.00284
; WIPE_START
G1 F12000
M204 S6000
G1 X79.416 Y81.29 E-.15191
G1 X79.391 Y80.937 E-.13467
G1 X79.53 Y80.633 E-.12694
G1 X79.783 Y80.429 E-.12359
G1 X80.154 Y80.378 E-.1423
G1 X80.354 Y80.449 E-.08059
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.371 Y80.207 Z2.74 F42000
G1 Z2.34
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1846
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
G1 F1846
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
G1 X84.173 Y87.856 Z2.74 F42000
G1 X84.654 Y90.754 Z2.74
G1 Z2.34
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F1846
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.74 F42000
G1 Z2.34
G1 E.8 F1800
G1 F1846
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
G3 Z2.74 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.42
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 29/100
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.42
G1 E.8 F1800
; LINE_WIDTH: 0.497488
G1 F1856
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.408248
G1 X78.102 Y104.151 E.00342
G1 X77.801 Y103.97 E.00447
G1 X77.588 Y103.691 E.00448
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
; LINE_WIDTH: 0.411238
G1 X77.754 Y76.076 E.00495
G1 X78.01 Y75.89 E.00406
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410248
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409778
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450181
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491845
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533508
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X98.064 Y75.983 E.20196
; LINE_WIDTH: 0.533388
G1 X101.251 Y75.983 E.05362
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.0039
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488858
G1 X101.637 Y75.824 E.00131
; LINE_WIDTH: 0.444358
G1 X101.721 Y75.806 E.00118
; LINE_WIDTH: 0.405118
G1 X102.02 Y75.906 E.004
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
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.414058
G1 X102.471 Y103.501 E.00295
G1 X102.347 Y103.8 E.00418
; LINE_WIDTH: 0.406598
G1 X102.055 Y104.076 E.0051
G1 X101.715 Y104.196 E.00458
; LINE_WIDTH: 0.445555
G1 X101.633 Y104.177 E.00118
; LINE_WIDTH: 0.489561
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05419
G1 X101.251 Y104.017 E-.0531
G1 X99.533 Y104.017 E-.65272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.662 Y104.021 Z2.82 F42000
G1 Z2.42
G1 E.8 F1800
; LINE_WIDTH: 0.404338
G1 F1856
M204 S5000
G1 X102.343 Y104.352 E.00579
; LINE_WIDTH: 0.410978
G1 X101.936 Y104.544 E.00578
; LINE_WIDTH: 0.418728
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.457008
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495288
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00198
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
M73 P36 R10
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.408238
G1 X77.988 Y104.523 E.0049
G1 X77.614 Y104.318 E.00543
; LINE_WIDTH: 0.405398
G1 X77.311 Y103.984 E.00571
; LINE_WIDTH: 0.411308
G1 X77.138 Y103.571 E.00576
G1 X77.105 Y103.29 E.00363
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
G1 X77.104 Y76.724 E.00722
G1 X77.183 Y76.282 E.00573
; LINE_WIDTH: 0.403458
G1 X77.391 Y75.905 E.00543
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.619 E.00535
; LINE_WIDTH: 0.412798
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
; LINE_WIDTH: 0.410248
G1 X80.412 Y75.405 E.02562
; LINE_WIDTH: 0.409778
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450181
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491845
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533508
G1 X86.251 Y75.467 E.00251
G1 X98.251 Y75.467 E.20196
; LINE_WIDTH: 0.533388
G1 X101.251 Y75.467 E.05048
G1 X101.363 Y75.448 E.00192
; LINE_WIDTH: 0.494491
G1 X101.476 Y75.428 E.00177
; LINE_WIDTH: 0.455625
G1 X101.588 Y75.409 E.00163
; LINE_WIDTH: 0.416758
G1 X101.833 Y75.437 E.00321
; LINE_WIDTH: 0.403378
G1 X102.207 Y75.569 E.00499
; LINE_WIDTH: 0.404218
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407748
G1 X102.783 Y76.184 E.0056
; LINE_WIDTH: 0.409538
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
G1 X102.895 Y103.275 E.033
; LINE_WIDTH: 0.414058
G1 X102.853 Y103.613 E.0044
G1 X102.69 Y103.969 E.00506
; WIPE_START
G1 F12000
M204 S6000
G1 X102.343 Y104.352 E-.1962
G1 X101.936 Y104.544 E-.17109
G1 X101.6 Y104.589 E-.12915
G1 X101.483 Y104.57 E-.04473
G1 X101.367 Y104.552 E-.04473
G1 X101.251 Y104.533 E-.04473
G1 X100.91 Y104.533 E-.12938
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.719 Y98.938 Z2.82 F42000
G1 X79.529 Y81.492 Z2.82
G1 Z2.42
G1 E.8 F1800
; LINE_WIDTH: 0.388168
G1 F1856
M204 S5000
G1 X79.52 Y81.484 E.00014
G1 X79.401 Y81.238 E.00331
G1 X79.386 Y80.964 E.00331
G1 X79.479 Y80.706 E.00332
G1 X79.664 Y80.505 E.00331
; LINE_WIDTH: 0.404468
G1 X79.981 Y80.377 E.00431
G1 X80.289 Y80.404 E.0039
; LINE_WIDTH: 0.398188
G1 X80.528 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398468
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389208
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.392708
G1 X80.26 Y81.732 E.00335
G1 X79.986 Y81.753 E.00337
; LINE_WIDTH: 0.390848
G1 X79.726 Y81.665 E.00334
; LINE_WIDTH: 0.388168
G1 X79.574 Y81.532 E.00245
; WIPE_START
G1 F12000
M204 S6000
G1 X79.52 Y81.484 E-.02722
G1 X79.401 Y81.238 E-.10412
G1 X79.386 Y80.964 E-.10414
G1 X79.479 Y80.706 E-.10421
G1 X79.664 Y80.505 E-.10402
G1 X79.981 Y80.377 E-.12976
G1 X80.289 Y80.404 E-.11734
G1 X80.447 Y80.494 E-.06918
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.318 Y80.189 Z2.82 F42000
G1 Z2.42
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1856
M204 S5000
G1 X83.074 Y79.787 E.01124
G1 X83.191 Y80.008 E.00328
G1 X83.275 Y80.165 E.00234
G1 X83.361 Y80.327 E.00241
G1 X83.478 Y80.546 E.00325
G1 X82.722 Y80.948 E.01124
G1 X82.346 Y80.242 E.0105
; WIPE_START
G1 F5700
M204 S6000
G1 X83.074 Y79.787 E-.3262
G1 X83.191 Y80.008 E-.09484
G1 X83.275 Y80.165 E-.06786
G1 X83.361 Y80.327 E-.06971
G1 X83.478 Y80.546 E-.09416
G1 X83.229 Y80.679 E-.10723
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.298 Y88.236 Z2.82 F42000
G1 X84.654 Y90.754 Z2.82
G1 Z2.42
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1856
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.82 F42000
G1 Z2.42
G1 E.8 F1800
G1 F1856
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
G3 Z2.82 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 30/100
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.5
G1 E.8 F1800
; LINE_WIDTH: 0.497428
G1 F1857
M204 S5000
G1 X101.381 Y103.965 E.00301
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05046
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.411558
G1 X78.116 Y104.152 E.00327
G1 X77.798 Y103.967 E.00472
; LINE_WIDTH: 0.406068
G1 X77.57 Y103.646 E.00499
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.282 E.00474
G1 X77.496 Y99.282 E.05103
; LINE_WIDTH: 0.408448
G1 X77.496 Y95.282 E.05101
; LINE_WIDTH: 0.408308
G1 X77.496 Y91.282 E.051
; LINE_WIDTH: 0.408178
G1 X77.496 Y87.282 E.05098
; LINE_WIDTH: 0.408038
G1 X77.496 Y83.282 E.05096
; LINE_WIDTH: 0.407908
G1 X77.496 Y79.282 E.05094
; LINE_WIDTH: 0.407768
G1 X77.496 Y76.7 E.03287
; LINE_WIDTH: 0.408238
G1 X77.549 Y76.402 E.00386
G1 X77.68 Y76.159 E.00352
; LINE_WIDTH: 0.407908
G1 X77.997 Y75.892 E.00527
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00551
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409788
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.796 E.01777
; LINE_WIDTH: 0.450175
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491841
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533508
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X96.064 Y75.983 E.1683
; LINE_WIDTH: 0.533388
G1 X101.251 Y75.983 E.08726
G1 X101.389 Y76.019 E.00241
G1 X101.433 Y76.089 E.0014
G1 X101.471 Y75.859 E.00392
G1 X101.554 Y75.841 E.00143
; LINE_WIDTH: 0.488708
G1 X101.637 Y75.823 E.00131
; LINE_WIDTH: 0.444078
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.403088
G1 X101.935 Y75.866 E.0028
; LINE_WIDTH: 0.404028
G1 X102.224 Y76.053 E.00434
; LINE_WIDTH: 0.408458
G1 X102.431 Y76.353 E.00466
G1 X102.504 Y76.7 E.00451
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
; LINE_WIDTH: 0.414048
G1 X102.471 Y103.501 E.00295
G1 X102.347 Y103.8 E.00418
; LINE_WIDTH: 0.406578
G1 X102.055 Y104.076 E.00511
G1 X101.715 Y104.196 E.00457
; LINE_WIDTH: 0.445641
G1 X101.633 Y104.176 E.00118
; LINE_WIDTH: 0.489605
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.0541
G1 X101.251 Y104.017 E-.05312
G1 X99.533 Y104.017 E-.65278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.656 Y104.027 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; LINE_WIDTH: 0.404388
G1 F1857
M204 S5000
G1 X102.343 Y104.352 E.00569
; LINE_WIDTH: 0.411098
G1 X101.937 Y104.544 E.00577
; LINE_WIDTH: 0.418908
G1 X101.599 Y104.589 E.00446
; LINE_WIDTH: 0.457128
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495348
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00198
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05046
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.115 Y104.552 E.00323
; LINE_WIDTH: 0.411568
G1 X77.708 Y104.388 E.00565
; LINE_WIDTH: 0.415288
G1 X77.421 Y104.135 E.00497
G1 X77.205 Y103.782 E.00537
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.291 E.00639
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
M73 P37 R10
G1 X77.106 Y76.7 E.03298
; LINE_WIDTH: 0.408228
G1 X77.182 Y76.262 E.00567
G1 X77.426 Y75.864 E.00595
; LINE_WIDTH: 0.403938
G1 X77.756 Y75.585 E.00545
; LINE_WIDTH: 0.408338
G1 X78.159 Y75.434 E.00549
; LINE_WIDTH: 0.410268
G1 X78.408 Y75.405 E.00321
G1 X80.408 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.408 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.408 Y75.405 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.404 E.01787
; LINE_WIDTH: 0.450175
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491841
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533508
G1 X86.251 Y75.467 E.00251
G1 X96.251 Y75.467 E.1683
; LINE_WIDTH: 0.533388
G1 X101.251 Y75.467 E.08412
G1 X101.363 Y75.448 E.00193
; LINE_WIDTH: 0.494291
G1 X101.476 Y75.428 E.00178
; LINE_WIDTH: 0.455245
G1 X101.589 Y75.409 E.00163
; LINE_WIDTH: 0.416198
G1 X101.947 Y75.457 E.0047
; LINE_WIDTH: 0.412038
G1 X102.291 Y75.613 E.00487
; LINE_WIDTH: 0.413188
G1 X102.577 Y75.861 E.00488
G1 X102.783 Y76.184 E.00495
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00608
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
G1 X102.895 Y103.275 E.03299
; LINE_WIDTH: 0.414048
G1 X102.853 Y103.613 E.0044
G1 X102.687 Y103.977 E.00517
; WIPE_START
G1 F12000
M204 S6000
G1 X102.343 Y104.352 E-.19335
G1 X101.937 Y104.544 E-.17088
G1 X101.599 Y104.589 E-.12933
G1 X101.483 Y104.57 E-.04467
G1 X101.367 Y104.552 E-.04467
G1 X101.251 Y104.533 E-.04466
G1 X100.902 Y104.533 E-.13245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.713 Y98.937 Z2.9 F42000
G1 X79.516 Y81.472 Z2.9
G1 Z2.5
G1 E.8 F1800
; LINE_WIDTH: 0.384988
G1 F1857
M204 S5000
G1 X79.394 Y81.211 E.00346
; LINE_WIDTH: 0.392848
G1 X79.405 Y80.877 E.00409
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392348
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.412828
G1 X80.692 Y80.768 E.00361
G1 X80.762 Y81.03 E.0035
; LINE_WIDTH: 0.406128
G1 X80.757 Y81.132 E.00129
; LINE_WIDTH: 0.385948
G1 X80.677 Y81.393 E.00329
; LINE_WIDTH: 0.389388
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.558 Y81.515 E.0027
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y81.211 E-.13113
G1 X79.405 Y80.877 E-.12693
G1 X79.537 Y80.621 E-.10944
G1 X79.751 Y80.449 E-.10443
G1 X80.016 Y80.374 E-.10454
G1 X80.289 Y80.403 E-.10441
G1 X80.47 Y80.507 E-.07913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.266 Y80.172 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1857
M204 S5000
G1 X83.089 Y79.734 E.01225
G1 X83.219 Y79.979 E.00364
G1 X83.308 Y80.146 E.00249
G1 X83.399 Y80.317 E.00253
G1 X83.53 Y80.563 E.00367
G1 X82.707 Y81.001 E.01225
G1 X82.294 Y80.225 E.01154
; WIPE_START
G1 F5700
M204 S6000
G1 X83.089 Y79.734 E-.35515
G1 X83.219 Y79.979 E-.10522
G1 X83.308 Y80.146 E-.07199
G1 X83.399 Y80.317 E-.07335
G1 X83.53 Y80.563 E-.10618
G1 X83.418 Y80.623 E-.04811
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.343 Y88.199 Z2.9 F42000
G1 X84.654 Y90.754 Z2.9
G1 Z2.5
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1857
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.9 F42000
G1 Z2.5
G1 E.8 F1800
G1 F1857
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
G3 Z2.9 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.58
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 31/100
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.58
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F1856
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.02 Y104.117 E.00528
; LINE_WIDTH: 0.407818
G1 X77.735 Y103.905 E.00453
; LINE_WIDTH: 0.405648
G1 X77.541 Y103.572 E.00487
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.275 E.00383
G1 X77.496 Y99.275 E.05103
; LINE_WIDTH: 0.408448
G1 X77.496 Y95.275 E.05101
; LINE_WIDTH: 0.408308
G1 X77.496 Y91.275 E.051
; LINE_WIDTH: 0.408178
G1 X77.496 Y87.275 E.05098
; LINE_WIDTH: 0.408038
G1 X77.496 Y83.275 E.05096
; LINE_WIDTH: 0.407908
G1 X77.496 Y79.275 E.05094
; LINE_WIDTH: 0.407768
G1 X77.496 Y76.7 E.03279
; LINE_WIDTH: 0.408238
G1 X77.549 Y76.402 E.00386
G1 X77.73 Y76.101 E.00447
; LINE_WIDTH: 0.407538
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00535
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409788
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.796 E.01777
; LINE_WIDTH: 0.450175
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491841
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533508
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X96.064 Y75.983 E.1683
; LINE_WIDTH: 0.533388
G1 X101.251 Y75.983 E.08727
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.554 Y75.841 E.00143
; LINE_WIDTH: 0.488771
G1 X101.637 Y75.823 E.00131
; LINE_WIDTH: 0.444205
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405118
G1 X102.02 Y75.906 E.004
G1 X102.315 Y76.154 E.00488
; LINE_WIDTH: 0.404868
G1 X102.458 Y76.428 E.0039
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
; LINE_WIDTH: 0.413708
G1 X102.471 Y103.498 E.00291
G1 X102.347 Y103.8 E.00422
; LINE_WIDTH: 0.405588
G1 X102.054 Y104.076 E.0051
G1 X101.706 Y104.199 E.00468
; LINE_WIDTH: 0.448268
G1 X101.627 Y104.179 E.00115
; LINE_WIDTH: 0.490928
G1 X101.548 Y104.158 E.00126
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.00137
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05422
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.647 Y104.017 Z2.98 F42000
G1 Z2.58
G1 E.8 F1800
; LINE_WIDTH: 0.414358
G1 F1856
M204 S5000
G1 X102.485 Y104.234 E.0035
G1 X102.231 Y104.419 E.00408
; LINE_WIDTH: 0.406078
G1 X101.762 Y104.584 E.00631
; LINE_WIDTH: 0.448581
G1 X101.591 Y104.567 E.00241
; LINE_WIDTH: 0.491085
G1 X101.421 Y104.55 E.00264
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00288
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.341 Y104.589 E.04427
; LINE_WIDTH: 0.405368
G1 X77.921 Y104.495 E.00546
; LINE_WIDTH: 0.407138
G1 X77.569 Y104.284 E.00522
; LINE_WIDTH: 0.414938
G1 X77.312 Y103.986 E.00509
G1 X77.171 Y103.68 E.00438
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.287 E.00507
G1 X77.105 Y99.287 E.05103
; LINE_WIDTH: 0.408448
G1 X77.105 Y95.287 E.05101
; LINE_WIDTH: 0.408308
G1 X77.105 Y91.287 E.051
; LINE_WIDTH: 0.408178
G1 X77.105 Y87.287 E.05098
; LINE_WIDTH: 0.408038
G1 X77.105 Y83.287 E.05096
; LINE_WIDTH: 0.407908
G1 X77.106 Y79.287 E.05094
; LINE_WIDTH: 0.407768
G1 X77.106 Y76.7 E.03294
; LINE_WIDTH: 0.408218
G1 X77.182 Y76.262 E.00567
G1 X77.426 Y75.864 E.00594
; LINE_WIDTH: 0.403928
G1 X77.756 Y75.585 E.00545
; LINE_WIDTH: 0.408368
G1 X78.159 Y75.434 E.00549
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00322
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.404 E.01787
; LINE_WIDTH: 0.450175
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491841
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533508
G1 X86.251 Y75.467 E.00251
G1 X96.251 Y75.467 E.1683
; LINE_WIDTH: 0.533388
G1 X101.251 Y75.467 E.08413
G1 X101.364 Y75.448 E.00193
; LINE_WIDTH: 0.494315
M73 P38 R10
G1 X101.477 Y75.428 E.00178
; LINE_WIDTH: 0.455291
G1 X101.59 Y75.409 E.00164
; LINE_WIDTH: 0.416268
G1 X101.834 Y75.437 E.0032
; LINE_WIDTH: 0.403398
G1 X102.207 Y75.569 E.00498
; LINE_WIDTH: 0.404238
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407758
G1 X102.783 Y76.184 E.0056
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
G3 X102.88 Y103.44 I-4.026 J.288 E.0095
; LINE_WIDTH: 0.404398
G1 X102.744 Y103.887 E.00589
; LINE_WIDTH: 0.414358
G1 X102.683 Y103.969 E.00132
; WIPE_START
G1 F12000
M204 S6000
G1 X102.485 Y104.234 E-.12539
G1 X102.231 Y104.419 E-.11978
G1 X101.762 Y104.584 E-.18902
G1 X101.591 Y104.567 E-.06502
G1 X101.421 Y104.55 E-.06502
G1 X101.251 Y104.533 E-.06502
G1 X100.907 Y104.533 E-.13076
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.716 Y98.938 Z2.98 F42000
G1 X79.545 Y81.508 Z2.98
G1 Z2.58
G1 E.8 F1800
; LINE_WIDTH: 0.386568
G1 F1856
M204 S5000
G1 X79.405 Y81.246 E.00357
G1 X79.388 Y80.964 E.0034
; LINE_WIDTH: 0.385008
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.396128
G1 X79.783 Y80.429 E.00476
G1 X80.154 Y80.378 E.00462
; LINE_WIDTH: 0.389428
G1 X80.437 Y80.479 E.00365
; LINE_WIDTH: 0.388268
G1 X80.661 Y80.707 E.00386
; LINE_WIDTH: 0.405288
G1 X80.763 Y81.03 E.00429
G1 X80.749 Y81.193 E.00207
; LINE_WIDTH: 0.392848
G1 X80.61 Y81.497 E.00409
; LINE_WIDTH: 0.399268
G1 X80.391 Y81.684 E.00359
G1 X80.125 Y81.759 E.00344
; LINE_WIDTH: 0.398268
G1 X79.851 Y81.726 E.00343
G1 X79.587 Y81.548 E.00396
; WIPE_START
G1 F12000
M204 S6000
G1 X79.405 Y81.246 E-.13403
G1 X79.388 Y80.964 E-.10733
G1 X79.494 Y80.683 E-.11408
G1 X79.783 Y80.429 E-.14638
G1 X80.154 Y80.378 E-.14228
G1 X80.437 Y80.479 E-.11442
G1 X80.44 Y80.482 E-.00148
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.213 Y80.155 Z2.98 F42000
G1 Z2.58
G1 E.8 F1800
; LINE_WIDTH: 0.419998
M73 P38 R9
G1 F1856
M204 S5000
G1 X83.104 Y79.681 E.01325
G1 X83.244 Y79.945 E.00391
G1 X83.341 Y80.127 E.00271
G1 X83.439 Y80.311 E.00274
G1 X83.582 Y80.58 E.004
G1 X82.691 Y81.054 E.01325
G1 X82.242 Y80.208 E.01258
; WIPE_START
G1 F5700
M204 S6000
G1 X83.104 Y79.681 E-.38411
G1 X83.244 Y79.945 E-.11329
G1 X83.341 Y80.127 E-.07843
G1 X83.439 Y80.311 E-.07934
G1 X83.569 Y80.555 E-.10483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.377 Y88.144 Z2.98 F42000
G1 X84.654 Y90.754 Z2.98
G1 Z2.58
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1856
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z2.98 F42000
G1 Z2.58
G1 E.8 F1800
G1 F1856
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
G3 Z2.98 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.66
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 32/100
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.66
G1 E.8 F1800
; LINE_WIDTH: 0.497538
G1 F1862
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533558
G1 X101.251 Y104.017 E.00235
G1 X99.251 Y104.017 E.03366
; LINE_WIDTH: 0.533408
G1 X97.251 Y104.017 E.03365
; LINE_WIDTH: 0.533268
G1 X95.251 Y104.017 E.03364
; LINE_WIDTH: 0.533128
G1 X93.251 Y104.016 E.03364
; LINE_WIDTH: 0.532978
G1 X91.251 Y104.016 E.03363
; LINE_WIDTH: 0.532838
G1 X89.251 Y104.016 E.03362
; LINE_WIDTH: 0.532698
G1 X87.251 Y104.016 E.03361
; LINE_WIDTH: 0.532558
G1 X86.064 Y104.016 E.01993
G1 X86.029 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.490811
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449135
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407458
G1 X79.809 Y104.203 E.07633
; LINE_WIDTH: 0.407358
G1 X78.365 Y104.203 E.01836
; LINE_WIDTH: 0.415338
G3 X77.865 Y104.022 I.146 J-1.183 E.00696
; LINE_WIDTH: 0.410568
G1 X77.598 Y103.71 E.00526
G1 X77.5 Y103.37 E.00454
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.281 I45.234 J-1.093 E.02676
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
G1 X77.496 Y76.724 E.0071
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413298
G1 X77.618 Y76.269 E.00194
G1 X77.768 Y76.064 E.00328
; LINE_WIDTH: 0.411868
G1 X78.01 Y75.89 E.00383
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410258
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.409778
G1 X82.425 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450171
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491835
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533498
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X96.064 Y75.983 E.1683
; LINE_WIDTH: 0.533378
G1 X101.251 Y75.983 E.08727
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00392
G1 X101.554 Y75.841 E.00143
; LINE_WIDTH: 0.488768
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444208
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405128
G1 X102.021 Y75.906 E.004
; LINE_WIDTH: 0.405438
G1 X102.316 Y76.154 E.00488
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00352
G1 X102.504 Y78.7 E.02546
; LINE_WIDTH: 0.407818
G1 X102.503 Y82.7 E.05093
; LINE_WIDTH: 0.407958
G1 X102.503 Y86.7 E.05095
; LINE_WIDTH: 0.408098
G1 X102.502 Y90.7 E.05097
; LINE_WIDTH: 0.408248
G1 X102.502 Y94.7 E.05099
; LINE_WIDTH: 0.408388
G1 X102.501 Y98.7 E.05101
; LINE_WIDTH: 0.408528
G1 X102.501 Y102.7 E.05103
; LINE_WIDTH: 0.408628
G1 X102.501 Y103.354 E.00835
G1 X102.362 Y103.785 E.00577
; LINE_WIDTH: 0.407578
G1 X102.054 Y104.077 E.0054
; LINE_WIDTH: 0.407368
G1 X101.706 Y104.199 E.0047
; LINE_WIDTH: 0.448211
G1 X101.627 Y104.179 E.00115
; LINE_WIDTH: 0.490885
G1 X101.548 Y104.158 E.00126
; LINE_WIDTH: 0.533558
G1 X101.469 Y104.137 E.00137
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493413
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05426
G1 X101.251 Y104.017 E-.05307
G1 X99.533 Y104.017 E-.65268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.642 Y104.026 Z3.06 F42000
G1 Z2.66
G1 E.8 F1800
; LINE_WIDTH: 0.410778
G1 F1862
M204 S5000
G1 X102.421 Y104.293 E.00445
G1 X102.234 Y104.421 E.00289
; LINE_WIDTH: 0.406518
G1 X101.761 Y104.585 E.00635
; LINE_WIDTH: 0.448531
G1 X101.591 Y104.567 E.00241
; LINE_WIDTH: 0.491045
G1 X101.421 Y104.55 E.00264
; LINE_WIDTH: 0.533558
G1 X101.251 Y104.533 E.00288
G1 X99.251 Y104.533 E.03366
; LINE_WIDTH: 0.533408
G1 X97.251 Y104.533 E.03365
; LINE_WIDTH: 0.533268
G1 X95.251 Y104.533 E.03364
; LINE_WIDTH: 0.533128
G1 X93.251 Y104.532 E.03364
; LINE_WIDTH: 0.532978
G1 X91.251 Y104.532 E.03363
; LINE_WIDTH: 0.532838
G1 X89.251 Y104.532 E.03362
; LINE_WIDTH: 0.532698
G1 X87.251 Y104.532 E.03361
; LINE_WIDTH: 0.532558
G1 X86.25 Y104.532 E.01681
G1 X86.103 Y104.552 E.0025
; LINE_WIDTH: 0.490811
G1 X85.956 Y104.573 E.0023
; LINE_WIDTH: 0.449135
G1 X85.809 Y104.594 E.00209
; LINE_WIDTH: 0.407458
G1 X79.809 Y104.593 E.07633
; LINE_WIDTH: 0.407358
G1 X78.365 Y104.593 E.01836
; LINE_WIDTH: 0.415338
G1 X77.964 Y104.515 E.00531
G1 X77.613 Y104.316 E.00522
; LINE_WIDTH: 0.403878
G1 X77.296 Y103.964 E.00597
; LINE_WIDTH: 0.410198
G1 X77.134 Y103.551 E.00569
G1 X77.105 Y103.29 E.00336
G1 X77.105 Y99.29 E.05124
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
; LINE_WIDTH: 0.403418
G1 X77.395 Y75.902 E.00548
; LINE_WIDTH: 0.408438
G1 X77.698 Y75.618 E.0053
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00515
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410258
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408838
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450171
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491835
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533498
G1 X86.251 Y75.467 E.00251
G1 X94.251 Y75.467 E.13464
; LINE_WIDTH: 0.533398
G1 X101.251 Y75.467 E.11779
G1 X101.364 Y75.448 E.00193
; LINE_WIDTH: 0.494278
G1 X101.477 Y75.428 E.00179
; LINE_WIDTH: 0.455228
G1 X101.59 Y75.409 E.00164
; LINE_WIDTH: 0.416178
G1 X101.834 Y75.437 E.00319
; LINE_WIDTH: 0.403388
G1 X102.207 Y75.569 E.00498
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.409768
G1 X102.776 Y76.163 E.00572
G1 X102.893 Y76.646 E.00636
; LINE_WIDTH: 0.409528
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407748
G1 X102.894 Y80.7 E.05092
; LINE_WIDTH: 0.407888
G1 X102.894 Y84.7 E.05094
; LINE_WIDTH: 0.408028
G1 X102.893 Y88.7 E.05096
; LINE_WIDTH: 0.408168
G1 X102.893 Y92.7 E.05098
; LINE_WIDTH: 0.408318
G1 X102.893 Y96.7 E.051
; LINE_WIDTH: 0.408458
G1 X102.893 Y100.7 E.05102
; LINE_WIDTH: 0.408598
G1 X102.892 Y103.354 E.03387
G1 X102.872 Y103.486 E.0017
; LINE_WIDTH: 0.403928
M73 P39 R9
G1 X102.726 Y103.926 E.00584
; LINE_WIDTH: 0.410778
G1 X102.681 Y103.98 E.0009
; WIPE_START
G1 F12000
M204 S6000
G1 X102.421 Y104.293 E-.15475
G1 X102.234 Y104.421 E-.08569
G1 X101.761 Y104.585 E-.19021
G1 X101.591 Y104.567 E-.06503
G1 X101.421 Y104.55 E-.06502
G1 X101.251 Y104.533 E-.06502
G1 X100.897 Y104.533 E-.13428
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.709 Y98.936 Z3.06 F42000
G1 X79.508 Y81.459 Z3.06
G1 Z2.66
G1 E.8 F1800
; LINE_WIDTH: 0.388208
G1 F1862
M204 S5000
G1 X79.401 Y81.238 E.00297
; LINE_WIDTH: 0.404488
G1 X79.398 Y80.894 E.00434
G1 X79.516 Y80.646 E.00347
; LINE_WIDTH: 0.402688
G1 X79.723 Y80.463 E.00346
G1 X79.981 Y80.376 E.00343
; LINE_WIDTH: 0.402428
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398228
G1 X80.529 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389228
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.392708
G1 X80.261 Y81.732 E.00335
G1 X79.986 Y81.753 E.00336
; LINE_WIDTH: 0.390848
G1 X79.726 Y81.665 E.00334
; LINE_WIDTH: 0.388208
G1 X79.544 Y81.505 E.00293
; WIPE_START
G1 F12000
M204 S6000
G1 X79.401 Y81.238 E-.11539
G1 X79.398 Y80.894 E-.13075
G1 X79.516 Y80.646 E-.1045
G1 X79.723 Y80.463 E-.10469
G1 X79.981 Y80.376 E-.10364
G1 X80.289 Y80.404 E-.11744
G1 X80.48 Y80.513 E-.0836
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.161 Y80.138 Z3.06 F42000
G1 Z2.66
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F1862
M204 S5000
G1 X83.119 Y79.628 E.01425
G1 X83.267 Y79.906 E.00413
G1 X83.374 Y80.108 E.003
G1 X83.483 Y80.312 E.00304
G1 X83.635 Y80.598 E.00425
G1 X82.676 Y81.107 E.01425
G1 X82.189 Y80.191 E.01362
; WIPE_START
G1 F5700
M204 S6000
G1 X83.119 Y79.628 E-.41306
G1 X83.267 Y79.906 E-.11952
G1 X83.374 Y80.108 E-.0867
G1 X83.483 Y80.312 E-.08791
G1 X83.548 Y80.435 E-.05281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.362 Y88.024 Z3.06 F42000
G1 X84.654 Y90.754 Z3.06
G1 Z2.66
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1862
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.06 F42000
G1 Z2.66
G1 E.8 F1800
G1 F1862
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
G3 Z3.06 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.74
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 33/100
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.74
G1 E.8 F1800
; LINE_WIDTH: 0.497518
G1 F1877
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.408218
G1 X78.102 Y104.151 E.00342
G1 X77.801 Y103.97 E.00447
; LINE_WIDTH: 0.407918
G1 X77.588 Y103.691 E.00448
; LINE_WIDTH: 0.410298
G1 X77.498 Y103.282 E.00536
G1 X77.498 Y101.282 E.02563
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
G1 X77.496 Y76.725 E.00711
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411218
G1 X77.754 Y76.076 E.00494
G1 X78.01 Y75.89 E.00406
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.425 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450165
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491831
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533498
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X94.064 Y75.983 E.13464
; LINE_WIDTH: 0.533398
G1 X101.251 Y75.983 E.12092
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488788
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444258
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405138
G1 X102.021 Y75.906 E.004
; LINE_WIDTH: 0.405938
G1 X102.316 Y76.154 E.00489
G1 X102.457 Y76.428 E.00391
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
; LINE_WIDTH: 0.413728
G1 X102.471 Y103.498 E.0029
G1 X102.347 Y103.801 E.00423
; LINE_WIDTH: 0.410588
G1 X102.042 Y104.083 E.00534
G1 X101.715 Y104.196 E.00444
; LINE_WIDTH: 0.445518
G1 X101.633 Y104.177 E.00118
; LINE_WIDTH: 0.489548
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05421
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.6527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.647 Y104.044 Z3.14 F42000
G1 Z2.74
G1 E.8 F1800
; LINE_WIDTH: 0.406688
G1 F1877
M204 S5000
G1 X102.641 Y104.056 E.00017
G1 X102.328 Y104.358 E.00552
; LINE_WIDTH: 0.411508
G1 X101.937 Y104.545 E.00558
; LINE_WIDTH: 0.418738
G1 X101.599 Y104.589 E.00446
; LINE_WIDTH: 0.457018
G1 X101.483 Y104.57 E.00169
; LINE_WIDTH: 0.495298
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.408208
G1 X77.962 Y104.518 E.00523
G1 X77.564 Y104.274 E.00595
; LINE_WIDTH: 0.403948
G1 X77.285 Y103.944 E.00545
; LINE_WIDTH: 0.410128
G1 X77.134 Y103.55 E.0054
; LINE_WIDTH: 0.410298
G1 X77.105 Y103.291 E.00335
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
G1 X77.104 Y76.725 E.00722
G1 X77.183 Y76.281 E.00574
; LINE_WIDTH: 0.403368
G1 X77.391 Y75.904 E.00543
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.619 E.00534
; LINE_WIDTH: 0.412798
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450165
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491831
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533498
G1 X86.251 Y75.467 E.00251
G1 X94.251 Y75.467 E.13464
; LINE_WIDTH: 0.533398
G1 X101.251 Y75.467 E.11778
G1 X101.364 Y75.448 E.00194
; LINE_WIDTH: 0.494248
G1 X101.478 Y75.428 E.00179
; LINE_WIDTH: 0.455178
G1 X101.591 Y75.409 E.00164
; LINE_WIDTH: 0.416108
G1 X101.834 Y75.437 E.00318
; LINE_WIDTH: 0.403398
G1 X102.207 Y75.569 E.00498
; LINE_WIDTH: 0.404778
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.410678
G1 X102.768 Y76.145 E.00548
G1 X102.893 Y76.646 E.00663
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
G3 X102.88 Y103.44 I-4.022 J.288 E.0095
; LINE_WIDTH: 0.404888
G1 X102.755 Y103.861 E.00555
; LINE_WIDTH: 0.406688
G1 X102.678 Y103.993 E.00193
; WIPE_START
G1 F12000
M204 S6000
G1 X102.641 Y104.056 E-.02781
G1 X102.328 Y104.358 E-.1651
G1 X101.937 Y104.545 E-.16491
G1 X101.599 Y104.589 E-.12938
G1 X101.483 Y104.57 E-.04469
G1 X101.367 Y104.552 E-.04469
G1 X101.251 Y104.533 E-.04469
G1 X100.886 Y104.533 E-.13872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.7 Y98.933 Z3.14 F42000
G1 X79.501 Y81.441 Z3.14
G1 Z2.74
G1 E.8 F1800
; LINE_WIDTH: 0.384948
G1 F1877
M204 S5000
G1 X79.402 Y81.237 E.00272
G1 X79.388 Y80.964 E.00328
G1 X79.48 Y80.707 E.00328
G1 X79.687 Y80.489 E.0036
; LINE_WIDTH: 0.392848
G1 X80.002 Y80.377 E.00409
; LINE_WIDTH: 0.399208
G1 X80.289 Y80.403 E.00359
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.413108
G1 X80.759 Y81.031 E.00358
G1 X80.758 Y81.118 E.00113
; LINE_WIDTH: 0.389228
G1 X80.677 Y81.393 E.00348
; LINE_WIDTH: 0.389428
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.531 Y81.492 E.00312
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.10851
G1 X79.388 Y80.964 E-.10395
G1 X79.48 Y80.707 E-.10387
G1 X79.687 Y80.489 E-.11415
G1 X80.002 Y80.377 E-.12695
G1 X80.289 Y80.403 E-.10952
G1 X80.501 Y80.525 E-.09306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.638 Y80.283 Z3.14 F42000
G1 Z2.74
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.396598
G1 F1877
M204 S6000
G1 X82.973 Y80.104 E.00469
G1 X83.062 Y80.272 E.00235
G1 X83.158 Y80.453 E.00254
G1 X82.823 Y80.631 E.00469
G1 X82.666 Y80.336 E.00414
M204 S250
G1 X82.109 Y80.121 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1877
M204 S5000
G1 X83.135 Y79.576 E.01525
G1 X83.296 Y79.879 E.00452
G1 X83.407 Y80.088 E.00311
G1 X83.52 Y80.3 E.00315
G1 X83.687 Y80.615 E.00467
G1 X82.661 Y81.16 E.01525
G1 X82.137 Y80.174 E.01467
; WIPE_START
G1 F5700
M204 S6000
G1 X83.135 Y79.576 E-.44203
G1 X83.296 Y79.879 E-.13075
G1 X83.407 Y80.088 E-.08997
G1 X83.52 Y80.3 E-.09125
G1 X83.527 Y80.314 E-.006
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.346 Y87.903 Z3.14 F42000
G1 X84.654 Y90.754 Z3.14
G1 Z2.74
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1877
M204 S5000
M73 P40 R9
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.14 F42000
G1 Z2.74
G1 E.8 F1800
G1 F1877
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
G3 Z3.14 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.82
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 34/100
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.82
G1 E.8 F1800
; LINE_WIDTH: 0.497548
G1 F1876
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.14 Y104.161 E.00367
; LINE_WIDTH: 0.406768
G1 X77.8 Y103.971 E.00495
; LINE_WIDTH: 0.408258
G1 X77.624 Y103.758 E.00353
G1 X77.501 Y103.37 E.00519
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
G1 X77.496 Y76.724 E.00704
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411208
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.409788
G1 X82.425 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450165
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491831
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533498
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X94.064 Y75.983 E.13464
; LINE_WIDTH: 0.533388
G1 X101.251 Y75.983 E.12092
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00392
G1 X101.554 Y75.841 E.00143
; LINE_WIDTH: 0.488761
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444225
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405128
G1 X102.02 Y75.906 E.004
; LINE_WIDTH: 0.405928
G1 X102.316 Y76.154 E.00489
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00352
G1 X102.504 Y103.301 E.33859
; LINE_WIDTH: 0.413618
G3 X102.347 Y103.801 I-1.142 J-.083 E.00683
; LINE_WIDTH: 0.407318
G1 X102.053 Y104.077 E.00513
; LINE_WIDTH: 0.407058
G1 X101.71 Y104.198 E.00462
; LINE_WIDTH: 0.446948
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490268
G1 X101.549 Y104.157 E.00128
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05425
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.638 Y104.057 Z3.22 F42000
G1 Z2.82
G1 E.8 F1800
; LINE_WIDTH: 0.407738
G1 F1876
M204 S5000
G1 X102.294 Y104.384 E.00604
; LINE_WIDTH: 0.408028
G1 X101.891 Y104.557 E.00559
; LINE_WIDTH: 0.417888
G1 X101.6 Y104.59 E.00383
; LINE_WIDTH: 0.456455
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495021
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X77.983 Y104.517 E.00573
; LINE_WIDTH: 0.406558
G1 X77.608 Y104.31 E.00544
; LINE_WIDTH: 0.408258
G1 X77.319 Y104.002 E.00538
; LINE_WIDTH: 0.412798
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
G1 X77.104 Y76.724 E.00719
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403918
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412798
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450165
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491831
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533498
G1 X86.251 Y75.467 E.00251
G1 X94.251 Y75.467 E.13464
; LINE_WIDTH: 0.533388
G1 X101.251 Y75.467 E.11778
G1 X101.364 Y75.448 E.00194
; LINE_WIDTH: 0.494178
G1 X101.478 Y75.428 E.00179
; LINE_WIDTH: 0.455058
G1 X101.592 Y75.409 E.00165
; LINE_WIDTH: 0.415938
G1 X101.834 Y75.437 E.00317
; LINE_WIDTH: 0.403388
G1 X102.207 Y75.569 E.00498
; LINE_WIDTH: 0.404808
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.410648
G1 X102.768 Y76.145 E.00549
G1 X102.893 Y76.646 E.00662
; LINE_WIDTH: 0.409538
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.301 E.33859
; LINE_WIDTH: 0.413618
G1 X102.82 Y103.711 E.00539
G1 X102.673 Y104.009 E.0043
; WIPE_START
G1 F12000
M204 S6000
G1 X102.294 Y104.384 E-.20256
G1 X101.891 Y104.557 E-.16677
G1 X101.6 Y104.59 E-.11134
G1 X101.483 Y104.571 E-.04479
G1 X101.367 Y104.552 E-.04479
G1 X101.251 Y104.533 E-.04479
G1 X100.869 Y104.533 E-.14497
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.684 Y98.932 Z3.22 F42000
G1 X79.503 Y81.453 Z3.22
G1 Z2.82
G1 E.8 F1800
; LINE_WIDTH: 0.392568
G1 F1876
M204 S5000
G1 X79.383 Y81.146 E.00404
G1 X79.407 Y80.863 E.00347
; LINE_WIDTH: 0.392348
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
; LINE_WIDTH: 0.415328
G1 X80.056 Y80.376 E.00406
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405208
G1 X80.529 Y80.545 E.00429
; LINE_WIDTH: 0.405388
G1 X80.696 Y80.767 E.00351
G1 X80.763 Y81.03 E.00344
; LINE_WIDTH: 0.405268
G1 X80.752 Y81.166 E.00172
; LINE_WIDTH: 0.384988
G1 X80.66 Y81.423 E.00328
; LINE_WIDTH: 0.399408
G1 X80.402 Y81.675 E.00449
G1 X80.092 Y81.76 E.00401
; LINE_WIDTH: 0.390748
G1 X79.745 Y81.674 E.00436
; LINE_WIDTH: 0.386628
G1 X79.544 Y81.495 E.00323
; WIPE_START
G1 F12000
M204 S6000
G1 X79.383 Y81.146 E-.14641
G1 X79.407 Y80.863 E-.10777
G1 X79.537 Y80.621 E-.10439
G1 X79.751 Y80.449 E-.10445
G1 X80.056 Y80.376 E-.11889
G1 X80.227 Y80.39 E-.06524
G1 X80.491 Y80.526 E-.11285
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.611 Y80.273 Z3.22 F42000
G1 Z2.82
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.434768
G1 F1876
M204 S6000
G1 X82.98 Y80.077 E.00568
G1 X83.078 Y80.262 E.00284
G1 X83.185 Y80.462 E.00309
G1 X82.816 Y80.658 E.00568
G1 X82.639 Y80.326 E.00512
M204 S250
G1 X82.056 Y80.104 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1876
M204 S5000
G1 X83.15 Y79.523 E.01626
G1 X83.323 Y79.848 E.00484
G1 X83.44 Y80.069 E.00329
G1 X83.563 Y80.3 E.00344
G1 X83.739 Y80.632 E.00493
G1 X82.646 Y81.213 E.01626
G1 X82.085 Y80.157 E.01571
; WIPE_START
G1 F5700
M204 S6000
G1 X83.15 Y79.523 E-.47101
G1 X83.323 Y79.848 E-.1401
G1 X83.44 Y80.069 E-.09513
G1 X83.507 Y80.194 E-.05377
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.331 Y87.782 Z3.22 F42000
G1 X84.654 Y90.754 Z3.22
G1 Z2.82
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1876
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.22 F42000
G1 Z2.82
G1 E.8 F1800
G1 F1876
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
G3 Z3.22 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.9
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 35/100
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.9
G1 E.8 F1800
; LINE_WIDTH: 0.497508
G1 F1884
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
M73 P41 R9
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.408228
G1 X78.102 Y104.151 E.00342
G1 X77.8 Y103.971 E.00448
G1 X77.588 Y103.691 E.00448
; LINE_WIDTH: 0.410288
G1 X77.498 Y103.28 E.00538
G1 X77.498 Y101.28 E.02563
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
; LINE_WIDTH: 0.411218
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
; LINE_WIDTH: 0.450161
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491825
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533488
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X94.064 Y75.983 E.13464
; LINE_WIDTH: 0.533378
G1 X101.251 Y75.983 E.12092
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.00391
G1 X101.554 Y75.842 E.00143
; LINE_WIDTH: 0.488858
G1 X101.638 Y75.824 E.00131
; LINE_WIDTH: 0.444418
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405118
G1 X102.02 Y75.906 E.00399
G1 X102.315 Y76.154 E.00488
; LINE_WIDTH: 0.404858
G1 X102.458 Y76.428 E.0039
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
G1 X102.38 Y103.752 E.00555
; LINE_WIDTH: 0.403938
G1 X102.091 Y104.055 E.00528
; LINE_WIDTH: 0.405638
G1 X101.706 Y104.199 E.00521
; LINE_WIDTH: 0.448281
G1 X101.627 Y104.179 E.00115
; LINE_WIDTH: 0.490925
G1 X101.548 Y104.158 E.00126
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.00137
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05421
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.65271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.636 Y104.041 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; LINE_WIDTH: 0.415008
G1 F1884
M204 S5000
G1 X102.486 Y104.234 E.00317
G1 X102.229 Y104.42 E.00411
; LINE_WIDTH: 0.406108
G1 X101.762 Y104.584 E.00628
; LINE_WIDTH: 0.448595
G1 X101.591 Y104.567 E.00241
; LINE_WIDTH: 0.491081
G1 X101.421 Y104.55 E.00264
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00288
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.408218
G1 X77.962 Y104.518 E.00523
G1 X77.572 Y104.286 E.00577
; LINE_WIDTH: 0.403078
G1 X77.295 Y103.955 E.00543
; LINE_WIDTH: 0.411308
G1 X77.138 Y103.571 E.00533
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
G1 X77.183 Y76.281 E.00574
; LINE_WIDTH: 0.403338
G1 X77.392 Y75.904 E.00543
; LINE_WIDTH: 0.408238
G1 X77.698 Y75.619 E.00533
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450161
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491825
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533488
G1 X86.251 Y75.467 E.00251
G1 X94.251 Y75.467 E.13464
; LINE_WIDTH: 0.533378
G1 X101.251 Y75.467 E.11778
G1 X101.365 Y75.448 E.00194
; LINE_WIDTH: 0.494235
G1 X101.479 Y75.428 E.0018
; LINE_WIDTH: 0.455171
G1 X101.592 Y75.409 E.00165
; LINE_WIDTH: 0.416108
G1 X101.833 Y75.437 E.00315
; LINE_WIDTH: 0.403398
G1 X102.207 Y75.569 E.00499
; LINE_WIDTH: 0.404228
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407748
G1 X102.783 Y76.184 E.0056
; LINE_WIDTH: 0.409538
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
; LINE_WIDTH: 0.403938
G1 X102.726 Y103.926 E.00529
; LINE_WIDTH: 0.415008
G1 X102.673 Y103.994 E.00112
; WIPE_START
G1 F12000
M204 S6000
G1 X102.486 Y104.234 E-.11567
G1 X102.229 Y104.42 E-.12058
G1 X101.762 Y104.584 E-.18836
G1 X101.591 Y104.567 E-.06502
G1 X101.421 Y104.55 E-.06502
G1 X101.251 Y104.533 E-.06501
G1 X100.882 Y104.533 E-.14034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.697 Y98.932 Z3.3 F42000
G1 X79.495 Y81.43 Z3.3
G1 Z2.9
G1 E.8 F1800
; LINE_WIDTH: 0.384948
G1 F1884
M204 S5000
G1 X79.402 Y81.237 E.00256
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392888
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00352
; LINE_WIDTH: 0.392328
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398648
G1 X80.767 Y81.033 E.0035
G1 X80.723 Y81.3 E.00337
; LINE_WIDTH: 0.393148
G1 X80.512 Y81.593 E.00443
; LINE_WIDTH: 0.387528
G1 X80.259 Y81.729 E.00346
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.522 Y81.483 E.00327
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.10403
G1 X79.391 Y80.937 E-.1142
G1 X79.53 Y80.633 E-.12696
G1 X79.751 Y80.449 E-.10935
G1 X80.016 Y80.374 E-.1045
G1 X80.289 Y80.403 E-.10448
G1 X80.509 Y80.53 E-.09649
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.585 Y80.264 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.472938
G1 F1884
M204 S6000
G1 X82.987 Y80.05 E.00677
G1 X83.094 Y80.251 E.00339
G1 X83.211 Y80.471 E.0037
G1 X82.809 Y80.685 E.00677
G1 X82.613 Y80.317 E.0062
M204 S250
G1 X82.004 Y80.087 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1884
M204 S5000
G1 X83.165 Y79.47 E.01726
G1 X83.347 Y79.812 E.0051
G1 X83.473 Y80.05 E.00353
G1 X83.603 Y80.293 E.00362
G1 X83.792 Y80.649 E.00529
G1 X82.631 Y81.266 E.01726
G1 X82.032 Y80.14 E.01675
; WIPE_START
G1 F5700
M204 S6000
G1 X83.165 Y79.47 E-.49998
G1 X83.347 Y79.812 E-.14748
G1 X83.473 Y80.05 E-.10226
G1 X83.486 Y80.074 E-.01029
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.316 Y87.661 Z3.3 F42000
G1 X84.654 Y90.754 Z3.3
G1 Z2.9
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1884
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.3 F42000
G1 Z2.9
G1 E.8 F1800
G1 F1884
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
G3 Z3.3 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 2.98
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 36/100
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z2.98
G1 E.8 F1800
; LINE_WIDTH: 0.497538
G1 F1878
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
G1 X78.14 Y104.161 E.00367
; LINE_WIDTH: 0.405958
G1 X77.798 Y103.967 E.00499
; LINE_WIDTH: 0.413418
G1 X77.746 Y103.908 E.00101
G1 X77.57 Y103.645 E.00408
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.282 E.00473
G1 X77.496 Y76.724 E.33883
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.410838
G1 X77.763 Y76.069 E.00507
M73 P42 R9
G1 X78.01 Y75.888 E.00393
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00535
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409788
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409308
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.796 E.01777
; LINE_WIDTH: 0.450161
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491825
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533488
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X94.064 Y75.983 E.13464
; LINE_WIDTH: 0.533378
G1 X101.251 Y75.983 E.12092
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.554 Y75.841 E.00143
; LINE_WIDTH: 0.488781
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444275
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.403068
G1 X101.935 Y75.866 E.0028
; LINE_WIDTH: 0.403998
G1 X102.222 Y76.051 E.00431
; LINE_WIDTH: 0.404888
G1 X102.429 Y76.354 E.00464
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
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.501 Y103.335 E.03368
G1 X102.378 Y103.754 E.00559
; LINE_WIDTH: 0.401818
G1 X102.075 Y104.065 E.00544
; LINE_WIDTH: 0.407498
G1 X101.692 Y104.201 E.00516
; LINE_WIDTH: 0.449528
G1 X101.618 Y104.18 E.00109
; LINE_WIDTH: 0.491558
G1 X101.544 Y104.158 E.0012
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.0013
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.625 Y104.059 Z3.38 F42000
G1 Z2.98
G1 E.8 F1800
; LINE_WIDTH: 0.408208
G1 F1878
M204 S5000
G1 X102.404 Y104.305 E.00421
; LINE_WIDTH: 0.414658
G1 X102.056 Y104.504 E.0052
G1 X101.736 Y104.586 E.00428
; LINE_WIDTH: 0.449528
G1 X101.574 Y104.569 E.00229
; LINE_WIDTH: 0.491558
G1 X101.413 Y104.551 E.00252
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00274
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X78.147 Y104.564 E.00357
; LINE_WIDTH: 0.414558
G1 X77.804 Y104.44 E.00473
G1 X77.442 Y104.166 E.00588
; LINE_WIDTH: 0.413418
G1 X77.205 Y103.78 E.00584
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.291 E.00638
G1 X77.104 Y77.291 E.33172
G3 X77.141 Y76.413 I3.74 J-.283 E.01123
; LINE_WIDTH: 0.413248
G3 X77.452 Y75.832 I1.269 J.305 E.0086
; LINE_WIDTH: 0.407718
G1 X77.824 Y75.546 E.00598
; LINE_WIDTH: 0.408578
G1 X78.159 Y75.433 E.0045
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00322
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409788
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409308
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408828
G1 X85.808 Y75.404 E.01787
; LINE_WIDTH: 0.450161
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491825
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533488
G1 X86.251 Y75.467 E.00251
G1 X94.251 Y75.467 E.13464
; LINE_WIDTH: 0.533378
G1 X101.251 Y75.467 E.11778
G1 X101.365 Y75.448 E.00195
; LINE_WIDTH: 0.494111
G1 X101.479 Y75.428 E.0018
; LINE_WIDTH: 0.454935
G1 X101.593 Y75.408 E.00165
; LINE_WIDTH: 0.415758
G1 X101.947 Y75.457 E.00464
; LINE_WIDTH: 0.411888
G1 X102.291 Y75.613 E.00486
G1 X102.502 Y75.787 E.00352
; LINE_WIDTH: 0.406808
G1 X102.769 Y76.144 E.00566
; LINE_WIDTH: 0.409498
G1 X102.893 Y76.646 E.00661
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
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.414958
G1 X102.82 Y103.707 E.00492
G1 X102.686 Y103.992 E.00408
; LINE_WIDTH: 0.408208
G1 X102.665 Y104.015 E.00039
; WIPE_START
G1 F12000
M204 S6000
G1 X102.404 Y104.305 E-.14827
G1 X102.056 Y104.504 E-.15237
G1 X101.736 Y104.586 E-.12564
G1 X101.574 Y104.569 E-.06184
G1 X101.413 Y104.551 E-.06184
G1 X101.251 Y104.533 E-.06184
G1 X100.861 Y104.533 E-.1482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.679 Y98.929 Z3.38 F42000
G1 X79.492 Y81.422 Z3.38
G1 Z2.98
G1 E.8 F1800
; LINE_WIDTH: 0.384948
G1 F1878
M204 S5000
G1 X79.402 Y81.237 E.00246
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392848
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392388
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00343
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398468
G1 X80.766 Y81.03 E.00346
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398268
G1 X80.514 Y81.595 E.00451
; LINE_WIDTH: 0.392428
G1 X80.259 Y81.728 E.00352
; LINE_WIDTH: 0.384948
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.518 Y81.476 E.00009
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.10084
G1 X79.391 Y80.937 E-.11415
G1 X79.53 Y80.633 E-.12698
G1 X79.751 Y80.449 E-.10949
G1 X80.016 Y80.374 E-.10442
G1 X80.289 Y80.403 E-.10454
G1 X80.516 Y80.534 E-.09958
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.558 Y80.255 Z3.38 F42000
G1 Z2.98
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.511098
G1 F1878
M204 S6000
G1 X82.994 Y80.023 E.00795
G1 X83.11 Y80.241 E.00398
G1 X83.238 Y80.481 E.00437
G1 X82.802 Y80.713 E.00795
G1 X82.586 Y80.308 E.00738
M204 S250
G1 X81.952 Y80.069 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1878
M204 S5000
G1 X83.18 Y79.417 E.01826
G1 X83.372 Y79.779 E.00539
G1 X83.506 Y80.031 E.00374
G1 X83.645 Y80.292 E.00388
G1 X83.844 Y80.666 E.00557
G1 X82.616 Y81.319 E.01826
G1 X81.98 Y80.122 E.01779
; WIPE_START
G1 F5700
M204 S6000
G1 X83.18 Y79.417 E-.52896
G1 X83.372 Y79.779 E-.15598
G1 X83.465 Y79.953 E-.07507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.3 Y87.54 Z3.38 F42000
G1 X84.654 Y90.754 Z3.38
G1 Z2.98
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1878
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.38 F42000
G1 Z2.98
G1 E.8 F1800
G1 F1878
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
G3 Z3.38 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.06
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 37/100
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z3.06
G1 E.8 F1800
; LINE_WIDTH: 0.497538
G1 F1888
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411348
G1 X78.207 Y104.178 E.00281
G1 X77.865 Y104.022 E.00483
; LINE_WIDTH: 0.407178
G1 X77.645 Y103.789 E.00408
G1 X77.503 Y103.393 E.00534
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
G1 X77.496 Y76.725 E.00703
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.410868
G1 X77.763 Y76.069 E.00508
G1 X78.009 Y75.888 E.00392
; LINE_WIDTH: 0.410258
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408818
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.450155
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491821
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533488
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X94.251 Y75.983 E.13777
; LINE_WIDTH: 0.533368
G1 X101.251 Y75.983 E.11778
G1 X101.39 Y76.019 E.00241
M73 P43 R9
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00392
G1 X101.554 Y75.841 E.00143
; LINE_WIDTH: 0.488775
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444271
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405138
G1 X102.02 Y75.906 E.004
; LINE_WIDTH: 0.405928
G1 X102.316 Y76.154 E.00489
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
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.414008
G1 X102.471 Y103.501 E.00294
G1 X102.347 Y103.8 E.00418
; LINE_WIDTH: 0.408038
G1 X102.053 Y104.078 E.00516
G1 X101.71 Y104.198 E.00462
; LINE_WIDTH: 0.446951
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490265
G1 X101.549 Y104.157 E.00128
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05424
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.631 Y104.061 Z3.46 F42000
G1 Z3.06
G1 E.8 F1800
; LINE_WIDTH: 0.404728
G1 F1888
M204 S5000
G1 X102.331 Y104.357 E.00532
; LINE_WIDTH: 0.406828
G1 X101.896 Y104.553 E.00606
; LINE_WIDTH: 0.417888
G1 X101.6 Y104.59 E.0039
; LINE_WIDTH: 0.456451
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495015
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
; LINE_WIDTH: 0.411348
G1 X78.087 Y104.554 E.00437
G1 X77.659 Y104.35 E.00609
; LINE_WIDTH: 0.407178
G1 X77.349 Y104.042 E.00556
; LINE_WIDTH: 0.413488
G1 X77.157 Y103.636 E.0058
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
G3 X77.141 Y76.413 I3.728 J-.282 E.01119
; LINE_WIDTH: 0.413228
G3 X77.452 Y75.832 I1.268 J.304 E.0086
; LINE_WIDTH: 0.405548
G1 X77.738 Y75.602 E.00465
; LINE_WIDTH: 0.411318
G1 X78.129 Y75.438 E.00545
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410258
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409298
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408818
G1 X85.808 Y75.404 E.01785
; LINE_WIDTH: 0.450155
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491821
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533488
G1 X86.251 Y75.467 E.00251
G1 X94.251 Y75.467 E.13464
; LINE_WIDTH: 0.533368
G1 X101.251 Y75.467 E.11778
G1 X101.365 Y75.448 E.00195
; LINE_WIDTH: 0.494068
G1 X101.48 Y75.428 E.0018
; LINE_WIDTH: 0.454858
G1 X101.594 Y75.408 E.00166
; LINE_WIDTH: 0.415648
G1 X101.834 Y75.436 E.00314
; LINE_WIDTH: 0.403388
G1 X102.207 Y75.569 E.00498
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.410688
G1 X102.768 Y76.145 E.00548
G1 X102.893 Y76.646 E.00663
; LINE_WIDTH: 0.409498
G1 X102.894 Y76.7 E.00068
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
G3 X102.88 Y103.441 I-4.023 J.288 E.00951
; LINE_WIDTH: 0.407118
G1 X102.759 Y103.859 E.00554
G1 X102.665 Y104.012 E.00228
; WIPE_START
G1 F12000
M204 S6000
G1 X102.331 Y104.357 E-.18235
G1 X101.896 Y104.553 E-.18132
G1 X101.6 Y104.59 E-.11351
G1 X101.483 Y104.571 E-.04479
G1 X101.367 Y104.552 E-.04479
G1 X101.251 Y104.533 E-.04479
G1 X100.86 Y104.533 E-.14845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.68 Y98.928 Z3.46 F42000
G1 X79.461 Y81.381 Z3.46
G1 Z3.06
G1 E.8 F1800
; LINE_WIDTH: 0.392888
G1 F1888
M204 S5000
G1 X79.38 Y81.137 E.00315
; LINE_WIDTH: 0.392348
G1 X79.407 Y80.863 E.00336
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398468
G1 X80.766 Y81.03 E.00347
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.703 Y81.651 E.0036
; LINE_WIDTH: 0.392888
G1 X79.491 Y81.431 E.00373
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.137 E-.11964
G1 X79.407 Y80.863 E-.10442
G1 X79.537 Y80.621 E-.10443
G1 X79.751 Y80.449 E-.10441
G1 X80.016 Y80.374 E-.10446
G1 X80.289 Y80.403 E-.1045
G1 X80.529 Y80.541 E-.10493
G1 X80.55 Y80.568 E-.01321
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.532 Y80.246 Z3.46 F42000
G1 Z3.06
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.549278
G1 F1888
M204 S6000
G1 X83.002 Y79.996 E.00923
G1 X83.126 Y80.231 E.00461
G1 X83.264 Y80.49 E.00509
G1 X82.794 Y80.74 E.00923
G1 X82.56 Y80.299 E.00866
M204 S250
G1 X81.899 Y80.052 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1888
M204 S5000
G1 X83.195 Y79.364 E.01926
G1 X83.398 Y79.746 E.00569
G1 X83.539 Y80.011 E.00395
G1 X83.686 Y80.288 E.00412
G1 X83.896 Y80.683 E.00588
G1 X82.601 Y81.372 E.01926
G1 X81.928 Y80.105 E.01884
; WIPE_START
G1 F5700
M204 S6000
G1 X83.195 Y79.364 E-.55794
G1 X83.398 Y79.746 E-.16453
G1 X83.444 Y79.833 E-.03753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.285 Y87.419 Z3.46 F42000
G1 X84.654 Y90.754 Z3.46
G1 Z3.06
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1888
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.46 F42000
G1 Z3.06
G1 E.8 F1800
G1 F1888
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
G3 Z3.46 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.14
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 38/100
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z3.14
G1 E.8 F1800
; LINE_WIDTH: 0.497548
G1 F1892
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411338
G1 X78.207 Y104.178 E.00281
G1 X77.867 Y104.022 E.00481
; LINE_WIDTH: 0.401598
G1 X77.633 Y103.771 E.0043
; LINE_WIDTH: 0.405908
G1 X77.5 Y103.369 E.00535
; LINE_WIDTH: 0.410278
G3 X77.498 Y101.28 I42.656 J-1.093 E.02677
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
G1 X77.496 Y76.724 E.0071
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.404538
G1 X77.73 Y76.102 E.00443
; LINE_WIDTH: 0.408228
G1 X78.009 Y75.888 E.00449
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408818
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.450151
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491815
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533478
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X94.251 Y75.983 E.13777
; LINE_WIDTH: 0.533358
G1 X101.251 Y75.983 E.11777
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00392
G1 X101.554 Y75.841 E.00143
; LINE_WIDTH: 0.488778
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444288
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405138
G1 X102.02 Y75.906 E.004
G1 X102.316 Y76.154 E.00488
; LINE_WIDTH: 0.404858
G1 X102.458 Y76.428 E.0039
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00351
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
; LINE_WIDTH: 0.408578
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409098
M73 P44 R9
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.501 Y103.335 E.03368
G1 X102.378 Y103.754 E.00559
; LINE_WIDTH: 0.401898
G1 X102.074 Y104.065 E.00546
; LINE_WIDTH: 0.407458
G1 X101.692 Y104.201 E.00515
; LINE_WIDTH: 0.449498
G1 X101.618 Y104.18 E.00109
; LINE_WIDTH: 0.491538
G1 X101.544 Y104.158 E.0012
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.0013
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05425
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.67 Y104.009 Z3.54 F42000
G1 Z3.14
G1 E.8 F1800
; LINE_WIDTH: 0.408328
G1 F1892
M204 S5000
G1 X102.404 Y104.305 E.00508
; LINE_WIDTH: 0.414598
G1 X102.056 Y104.504 E.00518
G1 X101.736 Y104.586 E.00428
; LINE_WIDTH: 0.449498
G1 X101.574 Y104.569 E.00229
; LINE_WIDTH: 0.491538
G1 X101.413 Y104.551 E.00252
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00274
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X78.234 Y104.577 E.00244
; LINE_WIDTH: 0.410018
G1 X77.801 Y104.442 E.00581
; LINE_WIDTH: 0.414568
G1 X77.467 Y104.185 E.00546
G1 X77.313 Y103.984 E.00328
; LINE_WIDTH: 0.411578
G1 X77.138 Y103.571 E.00577
G1 X77.105 Y103.29 E.00363
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
G3 X77.141 Y76.413 I3.735 J-.283 E.01122
; LINE_WIDTH: 0.413048
G3 X77.456 Y75.833 I1.225 J.289 E.00863
; LINE_WIDTH: 0.402978
G1 X77.745 Y75.595 E.00471
; LINE_WIDTH: 0.411308
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
; LINE_WIDTH: 0.450151
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491815
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533478
G1 X86.251 Y75.467 E.00251
G1 X94.251 Y75.467 E.13463
; LINE_WIDTH: 0.533358
G1 X101.251 Y75.467 E.11777
G1 X101.365 Y75.448 E.00196
; LINE_WIDTH: 0.494028
G1 X101.48 Y75.428 E.00181
; LINE_WIDTH: 0.454788
G1 X101.595 Y75.408 E.00166
; LINE_WIDTH: 0.415548
G1 X101.834 Y75.436 E.00313
; LINE_WIDTH: 0.403398
G1 X102.207 Y75.569 E.00498
; LINE_WIDTH: 0.404248
G1 X102.537 Y75.819 E.00523
; LINE_WIDTH: 0.407758
G1 X102.783 Y76.184 E.0056
; LINE_WIDTH: 0.409508
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
; LINE_WIDTH: 0.408578
G1 X102.894 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.894 Y92.7 E.02552
; LINE_WIDTH: 0.408838
M73 P44 R8
G1 X102.894 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.894 Y96.7 E.02554
; LINE_WIDTH: 0.409098
G1 X102.894 Y98.7 E.02555
; LINE_WIDTH: 0.409218
G1 X102.894 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.894 Y103.335 E.03368
; LINE_WIDTH: 0.414968
G1 X102.82 Y103.707 E.00492
G1 X102.702 Y103.958 E.0036
; WIPE_START
G1 F12000
M204 S6000
G1 X102.404 Y104.305 E-.17381
G1 X102.056 Y104.504 E-.15195
G1 X101.736 Y104.586 E-.1256
G1 X101.574 Y104.569 E-.06188
G1 X101.413 Y104.551 E-.06187
G1 X101.251 Y104.533 E-.06187
G1 X100.927 Y104.533 E-.12303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.316 Y98.451 Z3.54 F42000
G1 X82.505 Y80.236 Z3.54
G1 Z3.14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.587438
G1 F1892
M204 S6000
G1 X83.009 Y79.969 E.0106
G1 X83.143 Y80.22 E.0053
G1 X83.291 Y80.499 E.00587
G1 X82.787 Y80.767 E.0106
G1 X82.533 Y80.289 E.01005
M204 S250
G1 X81.847 Y80.035 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1892
M204 S5000
G1 X83.21 Y79.311 E.02026
G1 X83.422 Y79.71 E.00594
G1 X83.572 Y79.992 E.00419
G1 X83.727 Y80.283 E.00432
G1 X83.949 Y80.7 E.00621
G1 X82.586 Y81.425 E.02026
G1 X81.875 Y80.088 E.01988
; WIPE_START
G1 F5700
M204 S6000
G1 X83.21 Y79.311 E-.58692
G1 X83.422 Y79.71 E-.17204
G1 X83.424 Y79.713 E-.00104
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.485 Y81.408 Z3.54 F42000
G1 Z3.14
G1 E.8 F1800
; LINE_WIDTH: 0.384968
G1 F1892
M204 S5000
G1 X79.402 Y81.237 E.00227
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392868
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392388
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399188
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.00339
; LINE_WIDTH: 0.398208
G1 X80.58 Y81.542 E.0035
; LINE_WIDTH: 0.397388
G1 X80.274 Y81.723 E.00441
; LINE_WIDTH: 0.388008
G1 X79.986 Y81.75 E.00349
; LINE_WIDTH: 0.384968
G1 X79.727 Y81.664 E.00327
G1 X79.521 Y81.483 E.00328
G1 X79.511 Y81.462 E.00029
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.09476
G1 X79.391 Y80.937 E-.11418
G1 X79.53 Y80.633 E-.12697
G1 X79.751 Y80.449 E-.10944
G1 X80.016 Y80.374 E-.10451
G1 X80.289 Y80.403 E-.10436
G1 X80.528 Y80.541 E-.10497
G1 X80.53 Y80.543 E-.00081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.388 Y87.62 Z3.54 F42000
G1 X84.654 Y90.754 Z3.54
G1 Z3.14
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1892
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.54 F42000
G1 Z3.14
G1 E.8 F1800
G1 F1892
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
G3 Z3.54 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.22
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 39/100
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z3.22
G1 E.8 F1800
; LINE_WIDTH: 0.497538
G1 F1897
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.187 Y104.175 E.00305
; LINE_WIDTH: 0.407328
G1 X77.865 Y104.023 E.00453
G1 X77.607 Y103.726 E.00501
G1 X77.5 Y103.369 E.00473
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.28 I42.467 J-1.093 E.02677
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
G1 X77.496 Y76.726 E.00707
G1 X77.551 Y76.403 E.00418
; LINE_WIDTH: 0.404238
G1 X77.729 Y76.101 E.00442
; LINE_WIDTH: 0.408208
G1 X78.001 Y75.891 E.00438
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.0055
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408818
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.450151
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491815
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533478
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X94.251 Y75.983 E.13777
; LINE_WIDTH: 0.533358
G1 X101.251 Y75.983 E.11778
; LINE_WIDTH: 0.533258
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.00391
G1 X101.555 Y75.842 E.00143
; LINE_WIDTH: 0.488865
G1 X101.638 Y75.824 E.00131
; LINE_WIDTH: 0.444471
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405128
G1 X102.021 Y75.906 E.004
; LINE_WIDTH: 0.405908
G1 X102.316 Y76.154 E.00489
G1 X102.457 Y76.428 E.00391
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
; LINE_WIDTH: 0.403958
G1 X102.086 Y104.059 E.00536
; LINE_WIDTH: 0.403658
G1 X101.71 Y104.198 E.00505
; LINE_WIDTH: 0.446968
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490278
G1 X101.549 Y104.157 E.00128
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.689 Y103.977 Z3.62 F42000
G1 Z3.22
G1 E.8 F1800
; LINE_WIDTH: 0.415198
G1 F1897
M204 S5000
G1 X102.66 Y104.037 E.00087
; LINE_WIDTH: 0.407728
G1 X102.293 Y104.385 E.00644
; LINE_WIDTH: 0.408048
G1 X101.89 Y104.557 E.00557
; LINE_WIDTH: 0.417908
G1 X101.6 Y104.59 E.00382
; LINE_WIDTH: 0.456468
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495028
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
M73 P45 R8
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X78.191 Y104.571 E.003
; LINE_WIDTH: 0.407308
G1 X77.782 Y104.43 E.0055
; LINE_WIDTH: 0.415128
G1 X77.511 Y104.231 E.00437
G1 X77.276 Y103.933 E.00492
; LINE_WIDTH: 0.411038
G1 X77.139 Y103.57 E.00498
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
G3 X77.144 Y76.411 I3.539 J-.282 E.01125
; LINE_WIDTH: 0.412708
G1 X77.281 Y76.063 E.00483
G1 X77.457 Y75.829 E.00378
; LINE_WIDTH: 0.404238
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411308
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
; LINE_WIDTH: 0.450151
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491815
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533478
G1 X86.251 Y75.467 E.00251
G1 X94.251 Y75.467 E.13463
; LINE_WIDTH: 0.533358
G1 X101.251 Y75.467 E.11778
; LINE_WIDTH: 0.533258
G1 X101.366 Y75.448 E.00196
; LINE_WIDTH: 0.494075
G1 X101.481 Y75.428 E.00181
; LINE_WIDTH: 0.454891
G1 X101.595 Y75.409 E.00166
; LINE_WIDTH: 0.415708
G1 X101.834 Y75.436 E.00312
; LINE_WIDTH: 0.403408
G1 X102.207 Y75.569 E.00499
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00486
; LINE_WIDTH: 0.410658
G1 X102.768 Y76.145 E.00549
G1 X102.893 Y76.646 E.00662
; LINE_WIDTH: 0.409528
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
; LINE_WIDTH: 0.415198
G1 X102.82 Y103.711 E.00497
G1 X102.716 Y103.923 E.00307
; WIPE_START
G1 F12000
M204 S6000
G1 X102.66 Y104.037 E-.04819
G1 X102.293 Y104.385 E-.1923
G1 X101.89 Y104.557 E-.16627
G1 X101.6 Y104.59 E-.11115
G1 X101.483 Y104.571 E-.04479
G1 X101.367 Y104.552 E-.04478
G1 X101.251 Y104.533 E-.04478
G1 X100.967 Y104.533 E-.10773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.346 Y98.458 Z3.62 F42000
G1 X82.479 Y80.227 Z3.62
G1 Z3.22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.625598
G1 F1897
M204 S6000
G1 X83.016 Y79.942 E.01207
G1 X83.159 Y80.21 E.00603
G1 X83.317 Y80.508 E.0067
G1 X82.78 Y80.794 E.01207
G1 X82.507 Y80.28 E.01154
M204 S250
G1 X81.795 Y80.018 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1897
M204 S5000
G1 X83.225 Y79.258 E.02127
G1 X83.447 Y79.675 E.0062
G1 X83.605 Y79.973 E.00443
G1 X83.769 Y80.281 E.00458
G1 X84.001 Y80.717 E.00649
G1 X82.571 Y81.478 E.02127
G1 X81.823 Y80.071 E.02092
; WIPE_START
G1 F5700
M204 S6000
G1 X83.225 Y79.258 E-.61591
G1 X83.403 Y79.593 E-.1441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.481 Y81.401 Z3.62 F42000
G1 Z3.22
G1 E.8 F1800
; LINE_WIDTH: 0.384968
G1 F1897
M204 S5000
G1 X79.402 Y81.237 E.00218
G1 X79.391 Y80.937 E.0036
; LINE_WIDTH: 0.392868
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392428
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398228
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00346
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00348
G1 X80.259 Y81.729 E.00332
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00327
G1 X79.521 Y81.483 E.00328
G1 X79.508 Y81.455 E.00038
; WIPE_START
G1 F12000
M204 S6000
G1 X79.402 Y81.237 E-.09188
G1 X79.391 Y80.937 E-.11422
G1 X79.53 Y80.633 E-.12691
G1 X79.751 Y80.449 E-.10945
G1 X80.016 Y80.374 E-.10443
G1 X80.289 Y80.403 E-.10449
G1 X80.529 Y80.541 E-.10494
G1 X80.534 Y80.549 E-.00368
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.391 Y87.626 Z3.62 F42000
G1 X84.654 Y90.754 Z3.62
G1 Z3.22
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1897
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.62 F42000
G1 Z3.22
G1 E.8 F1800
G1 F1897
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
G3 Z3.62 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 40/100
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z3.3
G1 E.8 F1800
; LINE_WIDTH: 0.497498
G1 F1912
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533548
G1 X101.251 Y104.017 E.00235
G1 X99.251 Y104.017 E.03366
; LINE_WIDTH: 0.533378
G1 X97.251 Y104.017 E.03365
; LINE_WIDTH: 0.533218
G1 X95.251 Y104.017 E.03364
; LINE_WIDTH: 0.533058
G1 X93.251 Y104.016 E.03363
; LINE_WIDTH: 0.532898
G1 X91.251 Y104.016 E.03362
; LINE_WIDTH: 0.532738
G1 X89.251 Y104.016 E.03361
; LINE_WIDTH: 0.532578
G1 X87.251 Y104.016 E.0336
; LINE_WIDTH: 0.532418
G1 X86.064 Y104.016 E.01993
G1 X86.029 Y104.141 E.00218
G1 X85.956 Y104.162 E.00128
; LINE_WIDTH: 0.490658
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.448978
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407298
G1 X79.809 Y104.203 E.0763
; LINE_WIDTH: 0.407148
G1 X78.365 Y104.203 E.01835
; LINE_WIDTH: 0.415348
G3 X77.866 Y104.023 I.145 J-1.184 E.00694
; LINE_WIDTH: 0.404128
G1 X77.609 Y103.725 E.00496
; LINE_WIDTH: 0.408338
G1 X77.499 Y103.37 E.00474
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.29 I84.059 J-1.087 E.02665
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
G1 X77.496 Y76.725 E.00722
G1 X77.551 Y76.403 E.00417
; LINE_WIDTH: 0.404478
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.408218
G1 X78.001 Y75.891 E.00437
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.0055
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409298
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.450145
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491811
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533478
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X94.251 Y75.983 E.13777
; LINE_WIDTH: 0.533358
G1 X101.251 Y75.983 E.11778
; LINE_WIDTH: 0.533258
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.00391
G1 X101.555 Y75.842 E.00143
; LINE_WIDTH: 0.488871
G1 X101.638 Y75.824 E.00131
; LINE_WIDTH: 0.444485
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405128
G1 X102.021 Y75.906 E.004
; LINE_WIDTH: 0.405318
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
; LINE_WIDTH: 0.413998
G1 X102.471 Y103.501 E.00294
G1 X102.346 Y103.799 E.00418
; LINE_WIDTH: 0.405718
G1 X102.051 Y104.078 E.00514
G1 X101.706 Y104.199 E.00464
; LINE_WIDTH: 0.448268
G1 X101.627 Y104.179 E.00115
; LINE_WIDTH: 0.490908
G1 X101.548 Y104.158 E.00126
; LINE_WIDTH: 0.533548
G1 X101.469 Y104.137 E.00137
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493408
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05421
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.601 Y104.074 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; LINE_WIDTH: 0.414298
G1 F1912
M204 S5000
G1 X102.485 Y104.233 E.00255
G1 X102.227 Y104.421 E.00413
; LINE_WIDTH: 0.406088
G1 X101.761 Y104.585 E.00626
; LINE_WIDTH: 0.448575
G1 X101.591 Y104.567 E.00241
; LINE_WIDTH: 0.491061
G1 X101.421 Y104.55 E.00264
; LINE_WIDTH: 0.533548
G1 X101.251 Y104.533 E.00288
G1 X99.251 Y104.533 E.03366
; LINE_WIDTH: 0.533378
G1 X97.251 Y104.533 E.03365
; LINE_WIDTH: 0.533218
G1 X95.251 Y104.532 E.03364
; LINE_WIDTH: 0.533058
G1 X93.251 Y104.532 E.03363
; LINE_WIDTH: 0.532898
G1 X91.251 Y104.532 E.03362
; LINE_WIDTH: 0.532738
G1 X89.251 Y104.532 E.03361
; LINE_WIDTH: 0.532578
G1 X87.251 Y104.531 E.0336
; LINE_WIDTH: 0.532418
G1 X86.25 Y104.531 E.0168
G1 X86.103 Y104.552 E.0025
; LINE_WIDTH: 0.490658
G1 X85.956 Y104.573 E.0023
; LINE_WIDTH: 0.448978
G1 X85.809 Y104.594 E.00209
; LINE_WIDTH: 0.407298
G1 X79.809 Y104.593 E.0763
; LINE_WIDTH: 0.407148
G1 X78.365 Y104.593 E.01835
G1 X78.179 Y104.566 E.00239
; LINE_WIDTH: 0.405628
G1 X77.744 Y104.41 E.00585
; LINE_WIDTH: 0.412238
G1 X77.411 Y104.123 E.00567
; LINE_WIDTH: 0.415118
G1 X77.184 Y103.731 E.00588
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
M73 P46 R8
G1 X77.104 Y81.295 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.295 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.295 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.413 I3.757 J-.285 E.01129
; LINE_WIDTH: 0.413018
G3 X77.456 Y75.832 I1.226 J.29 E.00862
; LINE_WIDTH: 0.402998
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
; LINE_WIDTH: 0.450145
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491811
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533478
G1 X86.251 Y75.467 E.00251
G1 X94.251 Y75.467 E.13463
; LINE_WIDTH: 0.533358
G1 X101.251 Y75.467 E.11778
; LINE_WIDTH: 0.533258
G1 X101.366 Y75.448 E.00196
; LINE_WIDTH: 0.494041
G1 X101.481 Y75.428 E.00181
; LINE_WIDTH: 0.454825
G1 X101.596 Y75.408 E.00166
; LINE_WIDTH: 0.415608
G1 X101.834 Y75.436 E.00311
; LINE_WIDTH: 0.403388
G1 X102.207 Y75.569 E.00499
; LINE_WIDTH: 0.404808
G1 X102.515 Y75.8 E.00487
; LINE_WIDTH: 0.409518
G1 X102.778 Y76.168 E.00578
G1 X102.893 Y76.646 E.00629
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
G3 X102.88 Y103.44 I-4.024 J.288 E.0095
; LINE_WIDTH: 0.407018
G1 X102.759 Y103.859 E.00554
; LINE_WIDTH: 0.414298
G1 X102.637 Y104.026 E.00267
; WIPE_START
G1 F12000
M204 S6000
G1 X102.485 Y104.233 E-.09755
G1 X102.227 Y104.421 E-.12125
G1 X101.761 Y104.585 E-.18762
G1 X101.591 Y104.567 E-.06501
G1 X101.421 Y104.55 E-.06501
G1 X101.251 Y104.533 E-.06501
G1 X100.834 Y104.533 E-.15856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.213 Y98.458 Z3.7 F42000
G1 X82.308 Y80.174 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F1912
M204 S6000
G1 X83.067 Y79.77 E.01214
G1 X83.269 Y80.15 E.00607
G1 X83.488 Y80.562 E.00659
G1 X82.729 Y80.966 E.01214
G1 X82.336 Y80.227 E.01181
M204 S250
G1 X81.742 Y80.001 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1912
M204 S5000
G1 X83.24 Y79.205 E.02227
G1 X83.475 Y79.647 E.00657
G1 X83.638 Y79.953 E.00456
G1 X83.807 Y80.271 E.00472
G1 X84.053 Y80.735 E.00689
G1 X82.556 Y81.531 E.02227
G1 X81.771 Y80.054 E.02196
; WIPE_START
G1 F5700
M204 S6000
G1 X83.24 Y79.205 E-.64489
G1 X83.382 Y79.472 E-.11511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.457 Y81.367 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
; LINE_WIDTH: 0.392868
G1 F1912
M204 S5000
G1 X79.38 Y81.137 E.00297
; LINE_WIDTH: 0.392348
G1 X79.407 Y80.863 E.00336
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398208
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398228
G1 X80.58 Y81.542 E.0035
; LINE_WIDTH: 0.397328
G1 X80.274 Y81.723 E.00441
; LINE_WIDTH: 0.388008
G1 X79.986 Y81.75 E.00349
; LINE_WIDTH: 0.384928
G1 X79.703 Y81.651 E.0036
; LINE_WIDTH: 0.392868
G1 X79.481 Y81.421 E.00391
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.137 E-.11457
G1 X79.407 Y80.863 E-.10441
G1 X79.537 Y80.621 E-.10446
G1 X79.751 Y80.449 E-.10445
G1 X80.016 Y80.374 E-.10443
G1 X80.289 Y80.403 E-.10451
G1 X80.529 Y80.541 E-.10494
G1 X80.558 Y80.579 E-.01823
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.408 Y87.659 Z3.7 F42000
G1 X84.654 Y90.754 Z3.7
G1 Z3.3
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1912
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.7 F42000
G1 Z3.3
G1 E.8 F1800
G1 F1912
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
G3 Z3.7 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.38
; LAYER_HEIGHT: 0.0800002
; layer num/total_layer_count: 41/100
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z3.38
G1 E.8 F1800
; LINE_WIDTH: 0.497548
G1 F1911
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
; LINE_WIDTH: 0.411308
G1 X78.207 Y104.178 E.00281
G1 X77.866 Y104.021 E.00483
; LINE_WIDTH: 0.410178
G1 X77.596 Y103.705 E.00531
G1 X77.5 Y103.37 E.00448
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.282 I46.118 J-1.092 E.02675
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
; LINE_WIDTH: 0.411218
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.89 E.00404
; LINE_WIDTH: 0.404528
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410258
G1 X80.424 Y75.798 E.02683
; LINE_WIDTH: 0.409768
G1 X82.424 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.424 Y75.796 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.796 E.01767
; LINE_WIDTH: 0.450141
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491805
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533468
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X94.251 Y75.983 E.13777
; LINE_WIDTH: 0.533338
G1 X101.251 Y75.983 E.11777
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00392
G1 X101.554 Y75.841 E.00143
; LINE_WIDTH: 0.488781
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444325
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405128
G1 X102.021 Y75.906 E.004
; LINE_WIDTH: 0.405308
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
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.413708
G1 X102.472 Y103.498 E.0029
G1 X102.346 Y103.8 E.00422
; LINE_WIDTH: 0.405728
G1 X102.051 Y104.078 E.00514
G1 X101.71 Y104.198 E.00457
; LINE_WIDTH: 0.446938
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490258
G1 X101.549 Y104.157 E.00128
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05425
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65267
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.597 Y104.085 Z3.78 F42000
G1 Z3.38
G1 E.8 F1800
; LINE_WIDTH: 0.414658
G1 F1911
M204 S5000
G1 X102.485 Y104.233 E.00241
G1 X102.302 Y104.375 E.003
; LINE_WIDTH: 0.408018
G1 X101.89 Y104.557 E.00574
; LINE_WIDTH: 0.417878
G1 X101.6 Y104.59 E.00382
; LINE_WIDTH: 0.456445
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495011
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.234 Y104.577 E.00244
; LINE_WIDTH: 0.409848
G1 X77.799 Y104.441 E.00584
; LINE_WIDTH: 0.415398
G1 X77.468 Y104.185 E.00543
G1 X77.307 Y103.974 E.00344
; LINE_WIDTH: 0.409798
G1 X77.134 Y103.549 E.00587
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.291 E.00333
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
G1 X77.104 Y76.724 E.00723
G1 X77.181 Y76.285 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408248
G1 X77.697 Y75.619 E.00538
; LINE_WIDTH: 0.412808
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00455
; LINE_WIDTH: 0.410258
G1 X80.412 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.412 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.412 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01782
; LINE_WIDTH: 0.450141
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491805
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533468
G1 X86.251 Y75.467 E.00251
G1 X94.251 Y75.467 E.13463
; LINE_WIDTH: 0.533338
G1 X101.251 Y75.467 E.11777
G1 X101.366 Y75.448 E.00197
; LINE_WIDTH: 0.493908
G1 X101.481 Y75.428 E.00182
; LINE_WIDTH: 0.454578
M73 P47 R8
G1 X101.597 Y75.408 E.00167
; LINE_WIDTH: 0.415248
G1 X101.835 Y75.436 E.00311
; LINE_WIDTH: 0.403398
G1 X102.207 Y75.569 E.00498
; LINE_WIDTH: 0.404808
G1 X102.515 Y75.8 E.00486
; LINE_WIDTH: 0.409468
G1 X102.779 Y76.168 E.00579
G1 X102.893 Y76.646 E.00628
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
G3 X102.88 Y103.441 I-4.023 J.288 E.0095
; LINE_WIDTH: 0.404388
G1 X102.744 Y103.887 E.00589
; LINE_WIDTH: 0.414658
G1 X102.632 Y104.036 E.00241
; WIPE_START
G1 F12000
M204 S6000
G1 X102.485 Y104.233 E-.09339
G1 X102.302 Y104.375 E-.08792
G1 X101.89 Y104.557 E-.17118
G1 X101.6 Y104.59 E-.11113
G1 X101.483 Y104.571 E-.04479
G1 X101.367 Y104.552 E-.04479
G1 X101.251 Y104.533 E-.04479
G1 X100.824 Y104.533 E-.16202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.199 Y98.462 Z3.78 F42000
G1 X82.255 Y80.157 Z3.78
G1 Z3.38
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F1911
M204 S6000
G1 X83.082 Y79.717 E.01322
G1 X83.302 Y80.13 E.00661
G1 X83.541 Y80.579 E.00717
G1 X82.714 Y81.019 E.01322
G1 X82.283 Y80.21 E.01293
M204 S250
G1 X81.69 Y79.984 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1911
M204 S5000
G1 X83.255 Y79.152 E.02327
G1 X83.502 Y79.616 E.0069
G1 X83.671 Y79.934 E.00474
G1 X83.847 Y80.264 E.00491
G1 X84.106 Y80.752 E.00725
G1 X82.541 Y81.584 E.02327
G1 X81.718 Y80.037 E.02301
; WIPE_START
G1 F5700
M204 S6000
G1 X83.255 Y79.152 E-.67389
G1 X83.361 Y79.352 E-.08611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.44 Y81.349 Z3.78 F42000
G1 Z3.38
G1 E.8 F1800
; LINE_WIDTH: 0.398168
G1 F1911
M204 S5000
G1 X79.378 Y81.037 E.00395
; LINE_WIDTH: 0.387968
G1 X79.486 Y80.695 E.00434
; LINE_WIDTH: 0.393108
G1 X79.738 Y80.459 E.00423
; LINE_WIDTH: 0.415328
G1 X80.056 Y80.376 E.00426
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405188
G1 X80.529 Y80.545 E.0043
; LINE_WIDTH: 0.405408
G1 X80.696 Y80.767 E.00352
G1 X80.763 Y81.03 E.00344
; LINE_WIDTH: 0.405308
G1 X80.752 Y81.166 E.00172
; LINE_WIDTH: 0.385008
G1 X80.66 Y81.423 E.00328
; LINE_WIDTH: 0.399428
G1 X80.402 Y81.675 E.00449
G1 X80.125 Y81.759 E.00361
; LINE_WIDTH: 0.398288
G1 X79.851 Y81.726 E.00342
G1 X79.611 Y81.589 E.00343
G1 X79.467 Y81.401 E.00294
; WIPE_START
G1 F12000
M204 S6000
G1 X79.378 Y81.037 E-.14223
G1 X79.486 Y80.695 E-.13639
G1 X79.738 Y80.459 E-.13106
G1 X80.056 Y80.376 E-.12479
G1 X80.227 Y80.39 E-.06524
G1 X80.529 Y80.545 E-.12906
G1 X80.578 Y80.611 E-.03123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.424 Y87.693 Z3.78 F42000
G1 X84.654 Y90.754 Z3.78
G1 Z3.38
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1911
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.78 F42000
G1 Z3.38
G1 E.8 F1800
G1 F1911
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
G3 Z3.78 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.46
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 42/100
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z3.46
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F1918
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
; LINE_WIDTH: 0.409778
G1 X78.211 Y104.181 E.00275
G1 X77.864 Y104.022 E.00488
; LINE_WIDTH: 0.406308
G1 X77.602 Y103.713 E.00514
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
G1 X77.496 Y76.725 E.00703
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.403158
G1 X77.73 Y76.102 E.00441
; LINE_WIDTH: 0.408238
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.411308
G1 X78.248 Y75.814 E.00322
G1 X78.42 Y75.798 E.00221
; LINE_WIDTH: 0.410258
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.450141
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491805
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533468
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X94.251 Y75.983 E.13777
; LINE_WIDTH: 0.533338
G1 X101.251 Y75.983 E.11778
; LINE_WIDTH: 0.533228
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489005
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.444781
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.408108
G1 X102.136 Y75.977 E.00557
G1 X102.421 Y76.327 E.00576
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00486
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
G1 X102.471 Y103.498 E.0029
G1 X102.347 Y103.801 E.00423
; LINE_WIDTH: 0.410278
G1 X102.043 Y104.084 E.00533
G1 X101.715 Y104.196 E.00444
; LINE_WIDTH: 0.445521
G1 X101.633 Y104.177 E.00118
; LINE_WIDTH: 0.489555
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05422
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.588 Y104.107 Z3.86 F42000
G1 Z3.46
G1 E.8 F1800
; LINE_WIDTH: 0.406758
G1 F1918
M204 S5000
G1 X102.325 Y104.359 E.00462
; LINE_WIDTH: 0.411458
G1 X101.937 Y104.545 E.00554
; LINE_WIDTH: 0.418648
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.456961
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495275
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
; LINE_WIDTH: 0.409778
G1 X78.088 Y104.555 E.00434
G1 X77.649 Y104.347 E.00621
; LINE_WIDTH: 0.407318
G1 X77.347 Y104.04 E.00547
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
G3 X77.141 Y76.414 I3.725 J-.282 E.01118
; LINE_WIDTH: 0.412458
G1 X77.28 Y76.065 E.00484
G1 X77.46 Y75.829 E.00383
; LINE_WIDTH: 0.402848
G1 X77.749 Y75.591 E.0047
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00527
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410258
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01785
; LINE_WIDTH: 0.450141
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491805
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533468
G1 X86.251 Y75.467 E.00251
G1 X94.251 Y75.467 E.13463
; LINE_WIDTH: 0.533338
G1 X101.251 Y75.467 E.11778
; LINE_WIDTH: 0.533228
G1 X101.367 Y75.448 E.00197
; LINE_WIDTH: 0.493951
G1 X101.482 Y75.428 E.00182
; LINE_WIDTH: 0.454675
G1 X101.597 Y75.408 E.00167
; LINE_WIDTH: 0.415398
G1 X101.885 Y75.445 E.00376
; LINE_WIDTH: 0.410808
G1 X102.291 Y75.613 E.00564
; LINE_WIDTH: 0.414868
G1 X102.576 Y75.862 E.0049
G1 X102.783 Y76.184 E.00497
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
M73 P48 R8
G3 X102.88 Y103.44 I-4.024 J.288 E.0095
; LINE_WIDTH: 0.404868
G1 X102.755 Y103.861 E.00554
; LINE_WIDTH: 0.406758
G1 X102.64 Y104.056 E.00288
G1 X102.631 Y104.065 E.00017
; WIPE_START
G1 F12000
M204 S6000
G1 X102.325 Y104.359 E-.16111
G1 X101.937 Y104.545 E-.16369
G1 X101.6 Y104.589 E-.12918
G1 X101.483 Y104.571 E-.04476
G1 X101.367 Y104.552 E-.04476
G1 X101.251 Y104.533 E-.04476
G1 X100.799 Y104.533 E-.17174
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.172 Y98.463 Z3.86 F42000
G1 X82.203 Y80.139 Z3.86
G1 Z3.46
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F1918
M204 S6000
G1 X83.097 Y79.664 E.01429
G1 X83.335 Y80.111 E.00715
G1 X83.593 Y80.596 E.00775
G1 X82.699 Y81.072 E.01429
G1 X82.231 Y80.192 E.01405
M204 S250
G1 X81.638 Y79.967 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1918
M204 S5000
G1 X83.27 Y79.099 E.02427
G1 X83.523 Y79.575 E.00707
G1 X83.704 Y79.915 E.00506
G1 X83.892 Y80.269 E.00527
G1 X84.158 Y80.769 E.00743
G1 X82.526 Y81.637 E.02427
G1 X81.666 Y80.02 E.02405
; WIPE_START
G1 F5700
M204 S6000
G1 X83.27 Y79.099 E-.70288
G1 X83.341 Y79.232 E-.05712
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.394 Y81.205 Z3.86 F42000
G1 Z3.46
G1 E.8 F1800
; LINE_WIDTH: 0.392848
G1 F1918
M204 S5000
G1 X79.405 Y80.877 E.00401
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392348
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399188
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00346
G1 X80.725 Y81.301 E.0034
; LINE_WIDTH: 0.403448
G1 X80.604 Y81.51 E.00305
G1 X80.358 Y81.696 E.00389
; LINE_WIDTH: 0.393168
G1 X80 Y81.75 E.00443
; LINE_WIDTH: 0.387528
G1 X79.727 Y81.663 E.00346
; LINE_WIDTH: 0.384988
G1 X79.521 Y81.483 E.00328
G1 X79.417 Y81.26 E.00296
; WIPE_START
G1 F12000
M204 S6000
G1 X79.405 Y80.877 E-.14544
G1 X79.537 Y80.621 E-.10946
G1 X79.751 Y80.449 E-.10428
G1 X80.016 Y80.374 E-.10456
G1 X80.289 Y80.403 E-.10447
G1 X80.528 Y80.541 E-.10494
G1 X80.667 Y80.722 E-.08686
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.486 Y87.815 Z3.86 F42000
G1 X84.654 Y90.754 Z3.86
G1 Z3.46
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1918
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.86 F42000
G1 Z3.46
G1 E.8 F1800
G1 F1918
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
G3 Z3.86 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 3.54
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 43/100
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z3.54
G1 E.8 F1800
; LINE_WIDTH: 0.497538
G1 F1944
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
; LINE_WIDTH: 0.410328
G1 X78.206 Y104.18 E.00281
G1 X77.865 Y104.021 E.00482
; LINE_WIDTH: 0.404108
G1 X77.631 Y103.768 E.00435
; LINE_WIDTH: 0.406348
G1 X77.5 Y103.37 E.00532
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.282 I46.286 J-1.092 E.02675
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
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.282 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.282 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.729 E.00706
G1 X77.551 Y76.403 E.00422
; LINE_WIDTH: 0.404588
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.407678
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00536
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.796 E.01776
; LINE_WIDTH: 0.450135
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491801
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533468
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.10411
; LINE_WIDTH: 0.533358
G1 X98.251 Y75.983 E.10095
; LINE_WIDTH: 0.533258
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00392
G1 X101.554 Y75.841 E.00144
; LINE_WIDTH: 0.488791
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444365
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405148
G1 X102.021 Y75.906 E.004
; LINE_WIDTH: 0.405908
G1 X102.316 Y76.154 E.00489
G1 X102.457 Y76.428 E.0039
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
; LINE_WIDTH: 0.414198
G1 X102.47 Y103.503 E.00297
G1 X102.346 Y103.8 E.00417
; LINE_WIDTH: 0.406198
G1 X102.05 Y104.079 E.00516
G1 X101.715 Y104.196 E.00451
; LINE_WIDTH: 0.445491
G1 X101.633 Y104.177 E.00118
; LINE_WIDTH: 0.489535
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05424
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.58 Y104.111 Z3.94 F42000
G1 Z3.54
G1 E.8 F1800
; LINE_WIDTH: 0.404588
G1 F1944
M204 S5000
G1 X102.339 Y104.355 E.00432
; LINE_WIDTH: 0.410848
G1 X101.937 Y104.544 E.00571
; LINE_WIDTH: 0.418638
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.456951
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495265
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.217 Y104.574 E.00266
; LINE_WIDTH: 0.411448
G1 X77.818 Y104.451 E.00538
G1 X77.608 Y104.309 E.00325
; LINE_WIDTH: 0.404108
G1 X77.321 Y103.998 E.00534
; LINE_WIDTH: 0.409058
G1 X77.137 Y103.553 E.00615
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
G3 X77.11 Y76.671 I3.354 J-.281 E.00792
; LINE_WIDTH: 0.406458
G1 X77.205 Y76.229 E.00574
; LINE_WIDTH: 0.404588
G1 X77.426 Y75.864 E.00539
; LINE_WIDTH: 0.403928
G1 X77.756 Y75.585 E.00544
; LINE_WIDTH: 0.408868
G1 X78.158 Y75.433 E.00549
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00323
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01786
; LINE_WIDTH: 0.450135
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491801
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533468
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10097
; LINE_WIDTH: 0.533358
G1 X98.251 Y75.467 E.10095
; LINE_WIDTH: 0.533258
G1 X101.251 Y75.467 E.05046
G1 X101.367 Y75.448 E.00198
; LINE_WIDTH: 0.493835
G1 X101.482 Y75.428 E.00182
; LINE_WIDTH: 0.454451
G1 X101.598 Y75.408 E.00167
; LINE_WIDTH: 0.415068
G1 X101.835 Y75.436 E.00309
; LINE_WIDTH: 0.403398
G1 X102.207 Y75.569 E.00498
; LINE_WIDTH: 0.404808
G1 X102.515 Y75.8 E.00487
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
G3 X102.88 Y103.44 I-4.027 J.288 E.0095
; LINE_WIDTH: 0.408458
G1 X102.761 Y103.858 E.00554
G1 X102.64 Y104.05 E.00289
; LINE_WIDTH: 0.404588
G1 X102.622 Y104.068 E.00033
; WIPE_START
G1 F12000
M204 S6000
G1 X102.339 Y104.355 E-.15286
G1 X101.937 Y104.544 E-.16916
G1 X101.6 Y104.589 E-.12922
G1 X101.483 Y104.571 E-.04474
G1 X101.367 Y104.552 E-.04474
G1 X101.251 Y104.533 E-.04474
G1 X100.791 Y104.533 E-.17454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.159 Y98.467 Z3.94 F42000
G1 X82.151 Y80.122 Z3.94
G1 Z3.54
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F1944
M204 S6000
G1 X83.112 Y79.611 E.01537
G1 X83.368 Y80.092 E.00768
G1 X83.645 Y80.613 E.00833
G1 X82.683 Y81.125 E.01537
G1 X82.179 Y80.175 E.01517
M204 S250
G1 X81.585 Y79.95 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1944
M204 S5000
G1 X83.285 Y79.046 E.02528
G1 X83.552 Y79.548 E.00747
G1 X83.737 Y79.896 E.00516
G1 X83.93 Y80.259 E.0054
G1 X84.21 Y80.786 E.00784
G1 X82.511 Y81.69 E.02528
G1 X81.614 Y80.003 E.02509
; WIPE_START
G1 F5700
M204 S6000
G1 X83.285 Y79.046 E-.73188
G1 X83.32 Y79.111 E-.02813
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.94 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.131 Y80.456
G1 Z3.54
M73 P49 R8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.345448
G1 F1944
M204 S6000
G1 X82.955 Y80.126 E.004
G1 X82.665 Y80.28 E.00351
G1 X82.841 Y80.61 E.004
G1 X83.078 Y80.484 E.00287
; WIPE_START
G1 F18000
G1 X82.841 Y80.61 E-.15162
G1 X82.665 Y80.28 E-.21142
G1 X82.955 Y80.126 E-.18553
G1 X83.131 Y80.456 E-.21142
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.385 Y81.152 Z3.94 F42000
G1 Z3.54
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392868
G1 F1944
M204 S5000
G1 X79.38 Y81.137 E.0002
; LINE_WIDTH: 0.392348
G1 X79.407 Y80.863 E.00336
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
; LINE_WIDTH: 0.415328
G1 X80.056 Y80.376 E.00406
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405168
G1 X80.529 Y80.545 E.00429
; LINE_WIDTH: 0.405448
G1 X80.696 Y80.767 E.00352
G1 X80.763 Y81.03 E.00343
; LINE_WIDTH: 0.405268
G1 X80.749 Y81.193 E.00207
; LINE_WIDTH: 0.397248
G1 X80.58 Y81.542 E.0048
G1 X80.274 Y81.723 E.00441
; LINE_WIDTH: 0.388068
G1 X79.986 Y81.75 E.00349
; LINE_WIDTH: 0.384928
G1 X79.703 Y81.651 E.0036
; LINE_WIDTH: 0.392868
G1 X79.471 Y81.41 E.00409
G1 X79.404 Y81.209 E.00259
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.137 E-.02913
G1 X79.407 Y80.863 E-.10443
G1 X79.537 Y80.621 E-.10438
G1 X79.751 Y80.449 E-.10441
G1 X80.056 Y80.376 E-.11893
G1 X80.227 Y80.39 E-.06525
G1 X80.529 Y80.545 E-.12897
G1 X80.694 Y80.765 E-.1045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.507 Y87.86 Z3.94 F42000
G1 X84.654 Y90.754 Z3.94
G1 Z3.54
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1944
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z3.94 F42000
G1 Z3.54
G1 E.8 F1800
G1 F1944
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 3.62
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/100
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.94 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z3.94
G1 Z3.62
G1 E.8 F1800
; LINE_WIDTH: 0.497518
G1 F1955
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
; LINE_WIDTH: 0.410978
G1 X78.21 Y104.179 E.00277
G1 X77.865 Y104.021 E.00487
; LINE_WIDTH: 0.410028
G1 X77.596 Y103.706 E.0053
G1 X77.5 Y103.37 E.00448
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.282 I46.494 J-1.092 E.02675
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
G3 X77.499 Y76.676 I4.986 J-.279 E.00774
; LINE_WIDTH: 0.405638
G1 X77.552 Y76.403 E.00352
; LINE_WIDTH: 0.404238
G1 X77.729 Y76.101 E.00442
; LINE_WIDTH: 0.407628
G1 X78.01 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00535
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.796 E.01776
; LINE_WIDTH: 0.450131
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491795
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533458
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.10411
; LINE_WIDTH: 0.533358
G1 X98.251 Y75.983 E.10095
; LINE_WIDTH: 0.533258
G1 X101.251 Y75.983 E.05047
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.00391
G1 X101.555 Y75.842 E.00143
; LINE_WIDTH: 0.488878
G1 X101.638 Y75.824 E.00131
; LINE_WIDTH: 0.444538
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405128
G1 X102.021 Y75.906 E.00399
G1 X102.315 Y76.154 E.00487
; LINE_WIDTH: 0.404858
G1 X102.458 Y76.428 E.0039
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
G1 X102.347 Y103.801 E.00423
; LINE_WIDTH: 0.408348
G1 X102.05 Y104.08 E.0052
G1 X101.715 Y104.196 E.00452
; LINE_WIDTH: 0.445525
G1 X101.633 Y104.177 E.00118
; LINE_WIDTH: 0.489551
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05422
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.6527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.573 Y104.116 Z4.02 F42000
G1 Z3.62
G1 E.8 F1800
; LINE_WIDTH: 0.405608
G1 F1955
M204 S5000
G1 X102.33 Y104.358 E.00434
; LINE_WIDTH: 0.411188
G1 X101.937 Y104.545 E.00559
; LINE_WIDTH: 0.418678
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.456978
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495278
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.235 Y104.577 E.00244
; LINE_WIDTH: 0.407378
G1 X77.791 Y104.433 E.00593
; LINE_WIDTH: 0.415728
G1 X77.467 Y104.185 E.0053
G1 X77.307 Y103.973 E.00345
; LINE_WIDTH: 0.409668
G1 X77.134 Y103.549 E.00586
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.291 E.00333
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
G3 X77.141 Y76.414 I3.737 J-.283 E.01122
; LINE_WIDTH: 0.412558
G1 X77.281 Y76.063 E.00488
G1 X77.457 Y75.829 E.00378
; LINE_WIDTH: 0.404238
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.408928
G1 X78.158 Y75.433 E.00566
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00323
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01787
; LINE_WIDTH: 0.450131
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491795
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533458
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10097
; LINE_WIDTH: 0.533358
G1 X98.251 Y75.467 E.10095
; LINE_WIDTH: 0.533258
G1 X101.251 Y75.467 E.05047
G1 X101.367 Y75.448 E.00198
; LINE_WIDTH: 0.493881
G1 X101.483 Y75.428 E.00183
; LINE_WIDTH: 0.454545
G1 X101.599 Y75.408 E.00168
; LINE_WIDTH: 0.415208
G1 X101.834 Y75.436 E.00307
; LINE_WIDTH: 0.403378
G1 X102.207 Y75.569 E.00499
; LINE_WIDTH: 0.404228
G1 X102.537 Y75.82 E.00523
; LINE_WIDTH: 0.407748
G1 X102.783 Y76.184 E.0056
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
G1 X102.895 Y103.276 E.033
; LINE_WIDTH: 0.413698
G1 X102.857 Y103.585 E.00402
G1 X102.667 Y104.023 E.00618
; LINE_WIDTH: 0.405608
G1 X102.616 Y104.074 E.00091
; WIPE_START
G1 F12000
M204 S6000
G1 X102.33 Y104.358 E-.15315
G1 X101.937 Y104.545 E-.16551
G1 X101.6 Y104.589 E-.12919
G1 X101.483 Y104.571 E-.04473
G1 X101.367 Y104.552 E-.04473
G1 X101.251 Y104.533 E-.04473
G1 X100.782 Y104.533 E-.17796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.146 Y98.471 Z4.02 F42000
G1 X82.098 Y80.105 Z4.02
G1 Z3.62
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F1955
M204 S6000
G1 X83.127 Y79.558 E.01645
G1 X83.401 Y80.073 E.00822
G1 X83.698 Y80.63 E.00891
G1 X82.668 Y81.178 E.01645
G1 X82.126 Y80.158 E.01629
M204 S250
G1 X81.533 Y79.932 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1955
M204 S5000
G1 X83.3 Y78.993 E.02628
G1 X83.576 Y79.512 E.00772
G1 X83.77 Y79.876 E.00542
G1 X83.974 Y80.26 E.00571
G1 X84.263 Y80.803 E.00807
G1 X82.496 Y81.743 E.02628
G1 X81.941 Y80.7 E.0155
G1 X81.754 Y80.347 E.00525
G1 X81.561 Y79.985 E.00538
; WIPE_START
G1 F7800
M204 S6000
G1 X83.298 Y78.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.02 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.157 Y80.465
G1 Z3.62
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.383618
G1 F1955
M204 S6000
G1 X82.962 Y80.098 E.00496
G1 X82.639 Y80.27 E.00438
G1 X82.834 Y80.637 E.00496
G1 X83.104 Y80.493 E.00366
; WIPE_START
G1 F18000
G1 X82.834 Y80.637 E-.15491
G1 X82.639 Y80.27 E-.20993
G1 X82.962 Y80.098 E-.18523
G1 X83.157 Y80.465 E-.20993
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.377 Y81.112 Z4.02 F42000
G1 Z3.62
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.398228
G1 F1955
M204 S5000
G1 X79.375 Y81.103 E.00012
G1 X79.443 Y80.771 E.00421
; LINE_WIDTH: 0.387948
G1 X79.676 Y80.497 E.00435
; LINE_WIDTH: 0.393048
G1 X79.999 Y80.378 E.00422
G1 X80.172 Y80.38 E.00212
; LINE_WIDTH: 0.387108
G1 X80.437 Y80.479 E.00341
; LINE_WIDTH: 0.392308
G1 X80.669 Y80.72 E.00409
; LINE_WIDTH: 0.396648
G1 X80.768 Y81.032 E.00405
; LINE_WIDTH: 0.399288
G1 X80.737 Y81.268 E.00295
G1 X80.606 Y81.51 E.00343
; LINE_WIDTH: 0.398228
G1 X80.391 Y81.683 E.00343
G1 X80.125 Y81.759 E.00343
G1 X79.851 Y81.726 E.00342
G1 X79.612 Y81.589 E.00343
G1 X79.444 Y81.37 E.00343
G1 X79.392 Y81.17 E.00256
; WIPE_START
G1 F12000
M204 S6000
G1 X79.375 Y81.103 E-.02643
G1 X79.443 Y80.771 E-.12876
G1 X79.676 Y80.497 E-.13672
G1 X79.999 Y80.378 E-.13089
G1 X80.172 Y80.38 E-.06563
G1 X80.437 Y80.479 E-.10762
G1 X80.669 Y80.72 E-.12698
G1 X80.698 Y80.813 E-.03697
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.52 Y87.905 Z4.02 F42000
G1 X84.654 Y90.754 Z4.02
G1 Z3.62
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1955
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
M73 P50 R8
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.02 F42000
G1 Z3.62
G1 E.8 F1800
G1 F1955
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 3.7
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/100
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.02 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.02
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F1962
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
; LINE_WIDTH: 0.410978
G1 X78.21 Y104.179 E.00277
G1 X77.865 Y104.021 E.00487
; LINE_WIDTH: 0.410318
G1 X77.596 Y103.704 E.00534
G1 X77.5 Y103.37 E.00445
G3 X77.498 Y101.28 I42.676 J-1.094 E.02678
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
G1 X77.496 Y76.724 E.00709
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.410638
G1 X77.75 Y76.08 E.00487
G1 X78.01 Y75.89 E.00413
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00535
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.796 E.01776
; LINE_WIDTH: 0.450131
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491795
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533458
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.10411
; LINE_WIDTH: 0.533348
G1 X98.251 Y75.983 E.10095
; LINE_WIDTH: 0.533248
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.555 Y75.841 E.00144
; LINE_WIDTH: 0.488811
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444415
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405148
G1 X102.021 Y75.906 E.004
G1 X102.316 Y76.154 E.00488
; LINE_WIDTH: 0.404838
G1 X102.458 Y76.427 E.00389
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00351
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
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413968
G1 X102.471 Y103.5 E.00294
G1 X102.345 Y103.8 E.00419
; LINE_WIDTH: 0.405818
G1 X102.049 Y104.079 E.00516
G1 X101.708 Y104.199 E.00458
; LINE_WIDTH: 0.447648
G1 X101.628 Y104.178 E.00115
; LINE_WIDTH: 0.490618
G1 X101.549 Y104.158 E.00127
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.00138
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.575 Y104.109 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.414458
G1 F1962
M204 S5000
G1 X102.485 Y104.233 E.00199
G1 X102.175 Y104.452 E.00491
; LINE_WIDTH: 0.412558
G1 X101.741 Y104.585 E.00585
; LINE_WIDTH: 0.447648
G1 X101.578 Y104.568 E.00231
; LINE_WIDTH: 0.490618
G1 X101.414 Y104.55 E.00254
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00277
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.235 Y104.577 E.00244
; LINE_WIDTH: 0.407368
G1 X77.791 Y104.433 E.00592
; LINE_WIDTH: 0.415738
G1 X77.467 Y104.185 E.00531
G1 X77.306 Y103.973 E.00346
; LINE_WIDTH: 0.411488
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
M73 P50 R7
G1 X77.104 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00721
G1 X77.184 Y76.28 E.00576
; LINE_WIDTH: 0.403148
G1 X77.392 Y75.903 E.00542
; LINE_WIDTH: 0.404318
G1 X77.72 Y75.609 E.00556
; LINE_WIDTH: 0.408238
G1 X78.154 Y75.436 E.00595
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00329
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01787
; LINE_WIDTH: 0.450131
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491795
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533458
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10097
; LINE_WIDTH: 0.533348
G1 X98.251 Y75.467 E.10095
; LINE_WIDTH: 0.533248
G1 X101.251 Y75.467 E.05046
G1 X101.367 Y75.448 E.00198
; LINE_WIDTH: 0.493775
G1 X101.483 Y75.428 E.00183
; LINE_WIDTH: 0.454341
G1 X101.6 Y75.408 E.00168
; LINE_WIDTH: 0.414908
G1 X101.835 Y75.436 E.00307
; LINE_WIDTH: 0.403398
G1 X102.207 Y75.569 E.00498
; LINE_WIDTH: 0.404288
G1 X102.537 Y75.82 E.00523
; LINE_WIDTH: 0.407748
G1 X102.783 Y76.184 E.0056
; LINE_WIDTH: 0.409508
G1 X102.893 Y76.646 E.00608
G1 X102.894 Y76.7 E.00068
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
G3 X102.88 Y103.44 I-4.031 J.288 E.00951
; LINE_WIDTH: 0.406818
G1 X102.758 Y103.86 E.00554
; LINE_WIDTH: 0.414458
G1 X102.611 Y104.061 E.00323
; WIPE_START
G1 F12000
M204 S6000
G1 X102.485 Y104.233 E-.0811
G1 X102.175 Y104.452 E-.1441
G1 X101.741 Y104.585 E-.17248
G1 X101.578 Y104.568 E-.06245
G1 X101.414 Y104.55 E-.06245
G1 X101.251 Y104.533 E-.06245
G1 X100.79 Y104.533 E-.17496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.146 Y98.476 Z4.1 F42000
G1 X82.046 Y80.088 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F1962
M204 S6000
G1 X83.143 Y79.505 E.01752
G1 X83.434 Y80.053 E.00876
G1 X83.75 Y80.647 E.00949
G1 X82.653 Y81.231 E.01752
G1 X82.074 Y80.141 E.01741
M204 S250
G1 X81.481 Y79.915 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1962
M204 S5000
G1 X83.315 Y78.94 E.02728
G1 X83.604 Y79.483 E.00808
G1 X83.803 Y79.857 E.00556
G1 X84.009 Y80.245 E.00576
G1 X84.315 Y80.82 E.00856
G1 X82.481 Y81.796 E.02728
G1 X81.93 Y80.761 E.01539
G1 X81.742 Y80.408 E.00525
G1 X81.517 Y79.983 E.00632
G1 X81.509 Y79.968 E.00022
; WIPE_START
G1 F5700
M204 S6000
G1 X83.247 Y78.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.1 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.184 Y80.474
G1 Z3.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421794
G1 F1962
M204 S6000
G1 X82.969 Y80.071 E.00602
G1 X82.612 Y80.261 E.00534
G1 X82.826 Y80.664 E.00602
G1 X83.131 Y80.503 E.00455
; WIPE_START
G1 F18000
G1 X82.826 Y80.664 E-.15756
G1 X82.612 Y80.261 E-.20872
G1 X82.969 Y80.071 E-.18499
G1 X83.184 Y80.474 E-.20872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.393 Y80.99 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F1962
M204 S5000
G1 X79.391 Y80.937 E.00063
; LINE_WIDTH: 0.392868
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.415288
G1 X80.056 Y80.376 E.00406
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405188
G1 X80.529 Y80.545 E.0043
; LINE_WIDTH: 0.405428
G1 X80.696 Y80.768 E.00353
G1 X80.763 Y81.03 E.00343
; LINE_WIDTH: 0.405288
G1 X80.749 Y81.193 E.00207
; LINE_WIDTH: 0.397188
G1 X80.58 Y81.542 E.0048
G1 X80.274 Y81.723 E.0044
; LINE_WIDTH: 0.388068
G1 X79.986 Y81.75 E.00349
; LINE_WIDTH: 0.384968
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.395 Y81.05 E.00225
; WIPE_START
G1 F12000
M204 S6000
G1 X79.391 Y80.937 E-.0429
G1 X79.53 Y80.633 E-.127
G1 X79.751 Y80.449 E-.10947
G1 X80.056 Y80.376 E-.11883
G1 X80.227 Y80.39 E-.06519
G1 X80.529 Y80.545 E-.12905
G1 X80.696 Y80.768 E-.10586
G1 X80.736 Y80.925 E-.0617
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.562 Y88.015 Z4.1 F42000
G1 X84.654 Y90.754 Z4.1
G1 Z3.7
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1962
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.1 F42000
G1 Z3.7
G1 E.8 F1800
G1 F1962
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 3.78
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/100
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.1 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.1
G1 Z3.78
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F1969
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
M73 P51 R7
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.14 Y104.161 E.00367
; LINE_WIDTH: 0.405768
G1 X77.801 Y103.97 E.00493
; LINE_WIDTH: 0.408218
G1 X77.588 Y103.691 E.00448
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
G3 X77.496 Y76.7 I9.554 J-.279 E.00741
; LINE_WIDTH: 0.407078
G1 X77.551 Y76.403 E.00383
; LINE_WIDTH: 0.404328
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.407678
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
; LINE_WIDTH: 0.450131
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491795
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533458
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.10411
; LINE_WIDTH: 0.533348
G1 X98.251 Y75.983 E.10095
; LINE_WIDTH: 0.533248
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00392
G1 X101.555 Y75.841 E.00144
; LINE_WIDTH: 0.488811
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444425
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.405148
G1 X102.021 Y75.906 E.004
G1 X102.316 Y76.154 E.00487
G1 X102.457 Y76.428 E.0039
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00351
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
G1 X102.502 Y103.275 E.033
; LINE_WIDTH: 0.413718
G1 X102.472 Y103.498 E.0029
G1 X102.346 Y103.8 E.00423
; LINE_WIDTH: 0.405808
G1 X102.049 Y104.079 E.00516
G1 X101.71 Y104.198 E.00455
; LINE_WIDTH: 0.446951
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490265
G1 X101.549 Y104.157 E.00128
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.57 Y104.12 Z4.18 F42000
G1 Z3.78
G1 E.8 F1800
; LINE_WIDTH: 0.414798
G1 F1969
M204 S5000
G1 X102.485 Y104.233 E.00184
G1 X102.3 Y104.376 E.00302
; LINE_WIDTH: 0.408028
G1 X101.89 Y104.557 E.00572
; LINE_WIDTH: 0.417958
G1 X101.599 Y104.59 E.00382
; LINE_WIDTH: 0.456498
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495038
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.147 Y104.564 E.00357
; LINE_WIDTH: 0.414398
G1 X77.797 Y104.437 E.00482
G1 X77.532 Y104.244 E.00425
; LINE_WIDTH: 0.403128
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
G3 X77.141 Y76.413 I3.739 J-.283 E.01123
; LINE_WIDTH: 0.412998
G3 X77.457 Y75.832 I1.229 J.291 E.00863
; LINE_WIDTH: 0.403128
G1 X77.745 Y75.595 E.0047
; LINE_WIDTH: 0.409008
G1 X78.158 Y75.433 E.00566
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00323
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408808
G1 X85.808 Y75.404 E.01787
; LINE_WIDTH: 0.450131
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491795
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533458
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10097
; LINE_WIDTH: 0.533348
G1 X98.251 Y75.467 E.10095
; LINE_WIDTH: 0.533248
G1 X101.251 Y75.467 E.05046
G1 X101.367 Y75.448 E.00199
; LINE_WIDTH: 0.493735
G1 X101.484 Y75.428 E.00184
; LINE_WIDTH: 0.454271
G1 X101.6 Y75.408 E.00168
; LINE_WIDTH: 0.414808
G1 X101.835 Y75.436 E.00306
; LINE_WIDTH: 0.403388
G1 X102.207 Y75.569 E.00498
; LINE_WIDTH: 0.404798
G1 X102.515 Y75.8 E.00486
; LINE_WIDTH: 0.409308
G1 X102.78 Y76.172 E.00584
; LINE_WIDTH: 0.409508
G1 X102.893 Y76.646 E.00624
G1 X102.894 Y76.7 E.00068
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
G3 X102.88 Y103.44 I-4.029 J.288 E.00951
; LINE_WIDTH: 0.404378
G1 X102.744 Y103.887 E.00589
; LINE_WIDTH: 0.414798
G1 X102.606 Y104.071 E.00298
; WIPE_START
G1 F12000
M204 S6000
G1 X102.485 Y104.233 E-.07684
G1 X102.3 Y104.376 E-.08858
G1 X101.89 Y104.557 E-.17065
G1 X101.599 Y104.59 E-.11108
G1 X101.483 Y104.571 E-.04474
G1 X101.367 Y104.552 E-.04473
G1 X101.251 Y104.533 E-.04473
G1 X100.781 Y104.533 E-.17866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.132 Y98.48 Z4.18 F42000
G1 X81.994 Y80.071 Z4.18
G1 Z3.78
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F1969
M204 S6000
G1 X83.158 Y79.452 E.0186
G1 X83.467 Y80.034 E.0093
G1 X83.802 Y80.665 E.01008
G1 X82.638 Y81.284 E.0186
G1 X82.022 Y80.124 E.01853
M204 S250
G1 X81.428 Y79.898 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1969
M204 S5000
G1 X83.33 Y78.887 E.02828
G1 X83.621 Y79.434 E.00814
G1 X83.836 Y79.838 E.006
G1 X84.058 Y80.255 E.0062
G1 X84.367 Y80.837 E.00866
G1 X82.466 Y81.849 E.02828
G1 X81.914 Y80.812 E.01542
G1 X81.726 Y80.459 E.00525
G1 X81.487 Y80.007 E.00671
G1 X81.457 Y79.951 E.00084
; WIPE_START
G1 F5700
M204 S6000
G1 X83.196 Y78.963 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.18 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.21 Y80.484
G1 Z3.78
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.459948
G1 F1969
M204 S6000
G1 X82.977 Y80.044 E.00718
G1 X82.586 Y80.252 E.00639
G1 X82.819 Y80.691 E.00718
G1 X83.157 Y80.512 E.00552
; WIPE_START
G1 F18000
G1 X82.819 Y80.691 E-.15976
G1 X82.586 Y80.252 E-.20773
G1 X82.977 Y80.044 E-.18479
G1 X83.21 Y80.484 E-.20773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.4 Y80.941 Z4.18 F42000
G1 Z3.78
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392848
G1 F1969
M204 S5000
G1 X79.407 Y80.863 E.00095
; LINE_WIDTH: 0.392368
G1 X79.537 Y80.621 E.00336
G1 X79.752 Y80.449 E.00336
; LINE_WIDTH: 0.415288
G1 X80.056 Y80.376 E.00406
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405168
G1 X80.529 Y80.545 E.00429
; LINE_WIDTH: 0.405428
G1 X80.696 Y80.768 E.00353
; LINE_WIDTH: 0.410328
G1 X80.76 Y81.03 E.00347
G1 X80.726 Y81.304 E.00353
; LINE_WIDTH: 0.396828
G1 X80.516 Y81.593 E.00443
; LINE_WIDTH: 0.393008
G1 X80.259 Y81.729 E.00356
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00328
G1 X79.504 Y81.462 E.0036
; LINE_WIDTH: 0.392848
G1 X79.384 Y81.15 E.00409
G1 X79.396 Y81.001 E.00184
; WIPE_START
G1 F12000
M204 S6000
G1 X79.407 Y80.863 E-.05237
G1 X79.537 Y80.621 E-.10446
G1 X79.752 Y80.449 E-.10452
G1 X80.056 Y80.376 E-.11877
G1 X80.227 Y80.39 E-.06522
G1 X80.529 Y80.545 E-.12898
G1 X80.696 Y80.768 E-.10596
G1 X80.746 Y80.972 E-.07972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.578 Y88.059 Z4.18 F42000
G1 X84.654 Y90.754 Z4.18
G1 Z3.78
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1969
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.18 F42000
G1 Z3.78
G1 E.8 F1800
G1 F1969
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 3.86
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/100
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.18 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.18
G1 Z3.86
G1 E.8 F1800
; LINE_WIDTH: 0.497538
G1 F1976
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411278
G1 X78.207 Y104.178 E.00281
G1 X77.865 Y104.021 E.00484
; LINE_WIDTH: 0.406388
G1 X77.617 Y103.75 E.00466
G1 X77.5 Y103.37 E.00505
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.28 I42.472 J-1.093 E.02677
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
M73 P52 R7
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
; LINE_WIDTH: 0.405398
G1 X77.729 Y76.101 E.00444
; LINE_WIDTH: 0.407688
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00535
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.796 E.01776
; LINE_WIDTH: 0.450121
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491785
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533448
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.10411
; LINE_WIDTH: 0.533338
G1 X100.251 Y75.983 E.1346
; LINE_WIDTH: 0.533208
G1 X101.251 Y75.983 E.01682
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00392
G1 X101.555 Y75.841 E.00144
; LINE_WIDTH: 0.488815
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444431
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.402488
G1 X101.928 Y75.862 E.00269
; LINE_WIDTH: 0.403458
G1 X102.166 Y76.003 E.00349
; LINE_WIDTH: 0.410588
G1 X102.411 Y76.313 E.00507
G1 X102.501 Y76.646 E.00443
; LINE_WIDTH: 0.409388
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
G1 X102.504 Y103.276 E.03355
G1 X102.471 Y103.529 E.00326
; LINE_WIDTH: 0.407208
G1 X102.324 Y103.832 E.00429
; LINE_WIDTH: 0.406078
G1 X102.049 Y104.08 E.00469
G1 X101.715 Y104.196 E.00448
; LINE_WIDTH: 0.445501
G1 X101.633 Y104.177 E.00118
; LINE_WIDTH: 0.489545
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05424
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.552 Y104.138 Z4.26 F42000
G1 Z3.86
G1 E.8 F1800
; LINE_WIDTH: 0.404658
G1 F1976
M204 S5000
G1 X102.338 Y104.356 E.00385
; LINE_WIDTH: 0.410838
G1 X101.936 Y104.544 E.0057
; LINE_WIDTH: 0.418638
G1 X101.599 Y104.589 E.00445
; LINE_WIDTH: 0.456955
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495271
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X78.235 Y104.577 E.00243
; LINE_WIDTH: 0.409538
G1 X77.792 Y104.438 E.00593
G1 X77.606 Y104.308 E.0029
; LINE_WIDTH: 0.405028
G1 X77.322 Y104.004 E.00525
; LINE_WIDTH: 0.410648
G1 X77.14 Y103.57 E.00604
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
G3 X77.141 Y76.413 I3.739 J-.283 E.01123
; LINE_WIDTH: 0.413438
G1 X77.249 Y76.121 E.00403
G1 X77.452 Y75.834 E.00454
; LINE_WIDTH: 0.407798
G1 X77.825 Y75.546 E.00599
; LINE_WIDTH: 0.409058
G1 X78.158 Y75.433 E.0045
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00323
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.404 E.01787
; LINE_WIDTH: 0.450121
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491785
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533448
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10097
; LINE_WIDTH: 0.533338
G1 X100.251 Y75.467 E.1346
; LINE_WIDTH: 0.533208
G1 X101.251 Y75.467 E.01682
G1 X101.368 Y75.448 E.00199
; LINE_WIDTH: 0.493701
G1 X101.484 Y75.428 E.00184
; LINE_WIDTH: 0.454205
G1 X101.601 Y75.408 E.00169
; LINE_WIDTH: 0.414708
G1 X101.947 Y75.457 E.00453
; LINE_WIDTH: 0.407478
G1 X102.288 Y75.609 E.00475
; LINE_WIDTH: 0.414098
G1 X102.578 Y75.863 E.00498
G1 X102.78 Y76.173 E.00478
; LINE_WIDTH: 0.410588
G1 X102.894 Y76.646 E.00624
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
G1 X102.896 Y102.646 E.02552
G3 X102.856 Y103.614 I-4.145 J.315 E.0124
; LINE_WIDTH: 0.407588
G1 X102.651 Y104.037 E.00597
; LINE_WIDTH: 0.404658
G1 X102.594 Y104.096 E.00104
; WIPE_START
G1 F12000
M204 S6000
G1 X102.338 Y104.356 E-.1385
G1 X101.936 Y104.544 E-.16873
G1 X101.599 Y104.589 E-.12914
G1 X101.483 Y104.571 E-.04474
G1 X101.367 Y104.552 E-.04474
G1 X101.251 Y104.533 E-.04474
G1 X100.752 Y104.533 E-.18942
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.102 Y98.481 Z4.26 F42000
G1 X81.941 Y80.054 Z4.26
G1 Z3.86
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F1976
M204 S6000
G1 X83.173 Y79.399 E.01968
G1 X83.5 Y80.015 E.00984
G1 X83.855 Y80.682 E.01066
G1 X82.623 Y81.337 E.01968
G1 X81.969 Y80.107 E.01965
M204 S250
G1 X81.376 Y79.881 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1976
M204 S5000
G1 X83.345 Y78.834 E.02929
G1 X83.661 Y79.427 E.00882
G1 X83.869 Y79.819 E.00582
G1 X84.09 Y80.233 E.00617
G1 X84.42 Y80.855 E.00924
G1 X82.45 Y81.902 E.02929
G1 X81.895 Y80.857 E.01554
G1 X81.707 Y80.504 E.00525
G1 X81.456 Y80.032 E.00702
G1 X81.404 Y79.934 E.00145
; WIPE_START
G1 F5700
M204 S6000
G1 X83.144 Y78.948 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.26 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.237 Y80.493
G1 Z3.86
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.498128
G1 F1976
M204 S6000
G1 X82.984 Y80.017 E.00845
G1 X82.559 Y80.243 E.00754
G1 X82.812 Y80.719 E.00845
G1 X83.184 Y80.521 E.0066
; WIPE_START
G1 F18000
G1 X82.812 Y80.719 E-.16159
G1 X82.559 Y80.243 E-.20689
G1 X82.984 Y80.017 E-.18462
G1 X83.237 Y80.493 E-.20689
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.392 Y80.983 Z4.26 F42000
G1 Z3.86
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F1976
M204 S5000
G1 X79.391 Y80.937 E.00056
; LINE_WIDTH: 0.392848
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.392368
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.413128
G1 X80.759 Y81.03 E.00358
G1 X80.758 Y81.118 E.00113
; LINE_WIDTH: 0.389248
G1 X80.677 Y81.393 E.00348
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.729 E.00333
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00327
G1 X79.402 Y81.237 E.00328
G1 X79.395 Y81.043 E.00233
; WIPE_START
G1 F12000
M204 S6000
G1 X79.391 Y80.937 E-.04047
G1 X79.53 Y80.633 E-.12695
G1 X79.751 Y80.449 E-.10941
G1 X80.016 Y80.374 E-.10445
G1 X80.289 Y80.403 E-.10446
G1 X80.528 Y80.541 E-.10493
G1 X80.696 Y80.76 E-.10485
G1 X80.734 Y80.925 E-.06449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.562 Y88.015 Z4.26 F42000
G1 X84.654 Y90.754 Z4.26
G1 Z3.86
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1976
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.26 F42000
G1 Z3.86
G1 E.8 F1800
G1 F1976
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 3.94
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/100
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.26 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.26
G1 Z3.94
G1 E.8 F1800
; LINE_WIDTH: 0.497508
G1 F1982
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
; LINE_WIDTH: 0.411558
G1 X78.205 Y104.177 E.00284
G1 X77.865 Y104.021 E.00482
; LINE_WIDTH: 0.404338
G1 X77.643 Y103.783 E.0041
; LINE_WIDTH: 0.404968
G1 X77.502 Y103.388 E.0053
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.28 E.02702
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
G1 X77.496 Y76.725 E.00709
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.405228
G1 X77.729 Y76.101 E.00444
; LINE_WIDTH: 0.407708
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.418 Y75.798 E.00536
G1 X80.418 Y75.798 E.02563
; LINE_WIDTH: 0.409778
G1 X82.418 Y75.797 E.02559
; LINE_WIDTH: 0.409288
G1 X84.418 Y75.796 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.796 E.01775
; LINE_WIDTH: 0.450121
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491785
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533448
M73 P53 R7
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.10411
; LINE_WIDTH: 0.533338
G1 X98.251 Y75.983 E.10095
; LINE_WIDTH: 0.533228
G1 X101.251 Y75.983 E.05047
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.00391
G1 X101.555 Y75.842 E.00144
; LINE_WIDTH: 0.488905
G1 X101.638 Y75.824 E.00131
; LINE_WIDTH: 0.444631
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.402988
G1 X101.935 Y75.866 E.00279
; LINE_WIDTH: 0.403968
G1 X102.218 Y76.048 E.00424
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
G1 X102.502 Y103.275 E.03299
; LINE_WIDTH: 0.413698
G1 X102.472 Y103.498 E.00291
G1 X102.347 Y103.801 E.00424
; LINE_WIDTH: 0.409378
G1 X102.047 Y104.082 E.00525
G1 X101.71 Y104.198 E.00456
; LINE_WIDTH: 0.446998
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490288
G1 X101.55 Y104.157 E.00128
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.0542
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.65271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.578 Y104.119 Z4.34 F42000
G1 Z3.94
G1 E.8 F1800
; LINE_WIDTH: 0.416238
G1 F1982
M204 S5000
G1 X102.531 Y104.189 E.0011
G1 X102.269 Y104.399 E.00436
; LINE_WIDTH: 0.407248
G1 X101.894 Y104.555 E.00517
; LINE_WIDTH: 0.417968
G1 X101.6 Y104.59 E.00387
; LINE_WIDTH: 0.456505
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495041
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X78.234 Y104.577 E.00244
; LINE_WIDTH: 0.411578
G1 X77.818 Y104.451 E.0056
G1 X77.608 Y104.308 E.00326
; LINE_WIDTH: 0.404148
G1 X77.32 Y103.996 E.00535
; LINE_WIDTH: 0.410968
G1 X77.139 Y103.57 E.00594
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
G3 X77.141 Y76.413 I3.738 J-.283 E.01122
; LINE_WIDTH: 0.413108
G3 X77.453 Y75.832 I1.265 J.304 E.00861
; LINE_WIDTH: 0.407808
G1 X77.825 Y75.546 E.00597
; LINE_WIDTH: 0.409088
G1 X78.158 Y75.433 E.00449
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00324
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409778
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409288
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408798
G1 X85.808 Y75.404 E.01786
; LINE_WIDTH: 0.450121
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491785
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533448
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10097
; LINE_WIDTH: 0.533338
G1 X98.251 Y75.467 E.10095
; LINE_WIDTH: 0.533228
G1 X101.251 Y75.467 E.05047
G1 X101.368 Y75.448 E.00199
; LINE_WIDTH: 0.493748
G1 X101.485 Y75.428 E.00184
; LINE_WIDTH: 0.454318
G1 X101.602 Y75.408 E.00169
; LINE_WIDTH: 0.414888
G1 X101.947 Y75.457 E.00452
; LINE_WIDTH: 0.411578
G1 X102.291 Y75.613 E.00486
G1 X102.499 Y75.784 E.00346
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
G3 X102.88 Y103.44 I-4.026 J.288 E.0095
; LINE_WIDTH: 0.404888
G1 X102.755 Y103.861 E.00555
; LINE_WIDTH: 0.416238
G1 X102.612 Y104.07 E.00329
; WIPE_START
G1 F12000
M204 S6000
G1 X102.531 Y104.189 E-.05486
G1 X102.269 Y104.399 E-.12748
G1 X101.894 Y104.555 E-.15444
G1 X101.6 Y104.59 E-.11249
G1 X101.483 Y104.571 E-.04478
G1 X101.367 Y104.552 E-.04478
G1 X101.251 Y104.533 E-.04478
G1 X100.787 Y104.533 E-.17641
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.125 Y98.49 Z4.34 F42000
G1 X81.889 Y80.037 Z4.34
G1 Z3.94
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F1982
M204 S6000
G1 X83.188 Y79.346 E.02075
G1 X83.533 Y79.996 E.01038
G1 X83.907 Y80.699 E.01124
G1 X82.608 Y81.389 E.02075
G1 X81.917 Y80.09 E.02077
M204 S250
G1 X81.324 Y79.864 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1982
M204 S5000
G1 X83.361 Y78.781 E.03029
G1 X83.679 Y79.381 E.00892
G1 X83.902 Y79.799 E.00622
G1 X84.136 Y80.239 E.00654
G1 X84.472 Y80.872 E.00941
G1 X82.435 Y81.955 E.03029
G1 X81.889 Y80.927 E.01528
G1 X81.701 Y80.574 E.00525
G1 X81.425 Y80.055 E.00771
G1 X81.352 Y79.917 E.00206
; WIPE_START
G1 F5700
M204 S6000
G1 X83.093 Y78.932 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.34 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.263 Y80.502
G1 Z3.94
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.536304
G1 F1982
M204 S6000
G1 X82.991 Y79.99 E.00982
G1 X82.533 Y80.234 E.00878
G1 X82.805 Y80.746 E.00982
G1 X83.21 Y80.53 E.00777
; WIPE_START
G1 F17336.506
G1 X82.805 Y80.746 E-.17447
G1 X82.533 Y80.234 E-.22047
G1 X82.991 Y79.99 E-.19727
G1 X83.198 Y80.38 E-.16779
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.392 Y80.98 Z4.34 F42000
G1 Z3.94
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F1982
M204 S5000
G1 X79.391 Y80.937 E.00052
; LINE_WIDTH: 0.392848
G1 X79.53 Y80.633 E.00409
G1 X79.751 Y80.449 E.00353
; LINE_WIDTH: 0.415308
G1 X80.056 Y80.376 E.00406
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405188
G1 X80.529 Y80.545 E.00429
; LINE_WIDTH: 0.405428
G1 X80.696 Y80.768 E.00353
; LINE_WIDTH: 0.411168
G1 X80.76 Y81.033 E.0035
G1 X80.705 Y81.339 E.004
; LINE_WIDTH: 0.388088
G1 X80.513 Y81.592 E.00384
G1 X80.259 Y81.729 E.00349
; LINE_WIDTH: 0.384968
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.664 E.00327
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.395 Y81.04 E.00237
; WIPE_START
G1 F12000
M204 S6000
G1 X79.391 Y80.937 E-.03932
G1 X79.53 Y80.633 E-.12696
G1 X79.751 Y80.449 E-.10941
G1 X80.056 Y80.376 E-.11882
G1 X80.227 Y80.39 E-.06524
G1 X80.529 Y80.545 E-.12902
G1 X80.696 Y80.768 E-.10594
G1 X80.737 Y80.935 E-.06529
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.565 Y88.024 Z4.34 F42000
G1 X84.654 Y90.754 Z4.34
G1 Z3.94
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1982
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.34 F42000
G1 Z3.94
G1 E.8 F1800
G1 F1982
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.02
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/100
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.34 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.34
G1 Z4.02
G1 E.8 F1800
; LINE_WIDTH: 0.497538
G1 F1989
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
; LINE_WIDTH: 0.411568
G1 X78.205 Y104.177 E.00284
G1 X77.866 Y104.022 E.00479
; LINE_WIDTH: 0.406808
G1 X77.626 Y103.766 E.00446
G1 X77.501 Y103.37 E.00529
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
G1 X77.496 Y76.724 E.00703
G1 X77.551 Y76.403 E.00417
; LINE_WIDTH: 0.411188
G1 X77.755 Y76.075 E.00495
G1 X78.01 Y75.89 E.00404
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
; LINE_WIDTH: 0.450121
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491785
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533448
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.10411
; LINE_WIDTH: 0.533328
G1 X98.251 Y75.983 E.10095
; LINE_WIDTH: 0.533218
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00392
G1 X101.555 Y75.841 E.00144
; LINE_WIDTH: 0.488815
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444461
G1 X101.721 Y75.805 E.00119
; LINE_WIDTH: 0.402488
G1 X101.928 Y75.862 E.00269
; LINE_WIDTH: 0.403448
G1 X102.166 Y76.003 E.00348
; LINE_WIDTH: 0.409048
G1 X102.404 Y76.293 E.0048
; LINE_WIDTH: 0.409388
G1 X102.501 Y76.646 E.00468
G1 X102.501 Y78.646 E.02557
; LINE_WIDTH: 0.409258
G1 X102.502 Y80.646 E.02556
; LINE_WIDTH: 0.409128
G1 X102.502 Y82.646 E.02555
; LINE_WIDTH: 0.408998
G1 X102.502 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.502 Y86.646 E.02553
; LINE_WIDTH: 0.408748
G1 X102.502 Y88.646 E.02553
; LINE_WIDTH: 0.408618
M73 P54 R7
G1 X102.503 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.503 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.503 Y94.646 E.0255
; LINE_WIDTH: 0.408238
G1 X102.503 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.503 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.504 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.504 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.504 Y103.301 E.00833
; LINE_WIDTH: 0.413598
G3 X102.347 Y103.801 I-1.138 J-.082 E.00684
; LINE_WIDTH: 0.407368
G1 X102.048 Y104.079 E.00519
; LINE_WIDTH: 0.407588
G1 X101.69 Y104.201 E.00481
; LINE_WIDTH: 0.449588
G1 X101.616 Y104.18 E.00108
; LINE_WIDTH: 0.491588
G1 X101.543 Y104.158 E.00119
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.00129
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05424
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.549 Y104.142 Z4.42 F42000
G1 Z4.02
G1 E.8 F1800
; LINE_WIDTH: 0.412588
G1 F1989
M204 S5000
G1 X102.439 Y104.277 E.00225
; LINE_WIDTH: 0.413838
G1 X102.119 Y104.478 E.00488
G1 X101.736 Y104.586 E.00514
; LINE_WIDTH: 0.449588
G1 X101.574 Y104.568 E.00229
; LINE_WIDTH: 0.491588
G1 X101.413 Y104.551 E.00252
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00274
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
; LINE_WIDTH: 0.411568
G1 X78.086 Y104.554 E.00438
G1 X77.663 Y104.352 E.00602
; LINE_WIDTH: 0.406568
G1 X77.357 Y104.053 E.00544
; LINE_WIDTH: 0.413728
G1 X77.157 Y103.636 E.00597
G1 X77.105 Y103.288 E.00456
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
G1 X77.181 Y76.285 E.00569
; LINE_WIDTH: 0.403908
G1 X77.39 Y75.907 E.00545
; LINE_WIDTH: 0.408228
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412798
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
; LINE_WIDTH: 0.450121
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491785
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533448
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10097
; LINE_WIDTH: 0.533328
G1 X98.251 Y75.467 E.10095
; LINE_WIDTH: 0.533218
G1 X101.251 Y75.467 E.05046
G1 X101.368 Y75.448 E.002
; LINE_WIDTH: 0.493621
G1 X101.485 Y75.428 E.00185
; LINE_WIDTH: 0.454075
G1 X101.602 Y75.408 E.00169
; LINE_WIDTH: 0.414528
G1 X101.947 Y75.457 E.00451
; LINE_WIDTH: 0.407488
G1 X102.288 Y75.609 E.00475
; LINE_WIDTH: 0.414198
G1 X102.58 Y75.865 E.00501
G1 X102.768 Y76.145 E.00437
; LINE_WIDTH: 0.409388
G1 X102.894 Y76.646 E.0066
G1 X102.894 Y78.646 E.02557
; LINE_WIDTH: 0.409258
G1 X102.894 Y80.646 E.02556
; LINE_WIDTH: 0.409128
G1 X102.894 Y82.646 E.02555
; LINE_WIDTH: 0.408998
G1 X102.894 Y84.646 E.02554
; LINE_WIDTH: 0.408868
G1 X102.894 Y86.646 E.02553
; LINE_WIDTH: 0.408748
G1 X102.894 Y88.646 E.02553
; LINE_WIDTH: 0.408618
G1 X102.894 Y90.646 E.02552
; LINE_WIDTH: 0.408488
G1 X102.894 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.894 Y94.646 E.0255
; LINE_WIDTH: 0.408238
G1 X102.894 Y96.646 E.02549
; LINE_WIDTH: 0.408108
G1 X102.894 Y98.646 E.02549
; LINE_WIDTH: 0.407978
G1 X102.894 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.894 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.894 Y103.301 E.00833
G1 X102.866 Y103.516 E.00277
; LINE_WIDTH: 0.403948
G1 X102.726 Y103.926 E.00546
; LINE_WIDTH: 0.412588
G1 X102.587 Y104.095 E.00282
; WIPE_START
G1 F12000
M204 S6000
G1 X102.439 Y104.277 E-.08911
G1 X102.119 Y104.478 E-.14346
G1 X101.736 Y104.586 E-.15117
G1 X101.574 Y104.568 E-.06186
G1 X101.413 Y104.551 E-.06186
G1 X101.251 Y104.533 E-.06186
G1 X100.749 Y104.533 E-.19068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.087 Y98.49 Z4.42 F42000
G1 X81.837 Y80.02 Z4.42
G1 Z4.02
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F1989
M204 S6000
G1 X83.203 Y79.293 E.02183
G1 X83.566 Y79.976 E.01092
G1 X83.959 Y80.716 E.01182
G1 X82.593 Y81.442 E.02183
G1 X81.865 Y80.073 E.02189
M204 S250
G1 X81.271 Y79.847 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1989
M204 S5000
G1 X83.376 Y78.728 E.03129
G1 X83.703 Y79.343 E.00915
G1 X83.935 Y79.78 E.0065
G1 X84.176 Y80.234 E.00676
G1 X84.524 Y80.889 E.00973
G1 X82.42 Y82.008 E.03129
G1 X81.866 Y80.965 E.0155
G1 X81.678 Y80.612 E.00525
G1 X81.583 Y80.433 E.00265
G1 X81.396 Y80.08 E.00525
G1 X81.3 Y79.9 E.00268
; WIPE_START
G1 F5700
M204 S6000
G1 X83.041 Y78.917 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.42 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.29 Y80.511
G1 Z4.02
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.574454
G1 F1989
M204 S6000
G1 X82.998 Y79.963 E.01129
G1 X82.506 Y80.224 E.01012
G1 X82.798 Y80.773 E.01129
G1 X83.237 Y80.539 E.00903
; WIPE_START
G1 F16149.705
G1 X82.798 Y80.773 E-.18897
G1 X82.506 Y80.224 E-.23614
G1 X82.998 Y79.963 E-.21177
G1 X83.15 Y80.249 E-.12312
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.398 Y80.954 Z4.42 F42000
G1 Z4.02
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392368
G1 F1989
M204 S5000
G1 X79.407 Y80.863 E.00112
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
; LINE_WIDTH: 0.415348
G1 X80.055 Y80.376 E.00406
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405168
G1 X80.529 Y80.545 E.00429
; LINE_WIDTH: 0.405448
G1 X80.696 Y80.768 E.00353
G1 X80.763 Y81.03 E.00342
; LINE_WIDTH: 0.405328
G1 X80.752 Y81.166 E.00172
; LINE_WIDTH: 0.385008
G1 X80.646 Y81.447 E.0036
; LINE_WIDTH: 0.399148
G1 X80.395 Y81.681 E.00428
G1 X80.06 Y81.757 E.00428
; LINE_WIDTH: 0.387928
G1 X79.713 Y81.657 E.00436
; LINE_WIDTH: 0.393048
G1 X79.472 Y81.412 E.00421
G1 X79.38 Y81.137 E.00355
; LINE_WIDTH: 0.392368
G1 X79.392 Y81.014 E.00151
; WIPE_START
G1 F12000
M204 S6000
G1 X79.407 Y80.863 E-.0576
G1 X79.537 Y80.621 E-.10443
G1 X79.751 Y80.449 E-.10439
G1 X80.055 Y80.376 E-.11888
G1 X80.227 Y80.39 E-.06532
G1 X80.529 Y80.545 E-.12895
G1 X80.696 Y80.768 E-.10602
G1 X80.744 Y80.958 E-.07442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.574 Y88.047 Z4.42 F42000
G1 X84.654 Y90.754 Z4.42
G1 Z4.02
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1989
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.42 F42000
G1 Z4.02
G1 E.8 F1800
G1 F1989
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.1
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/100
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.42 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.42
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F2003
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406568
G1 X77.629 Y103.768 E.00548
; LINE_WIDTH: 0.406438
G1 X77.5 Y103.369 E.00531
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.282 I47.091 J-1.092 E.02675
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
; LINE_WIDTH: 0.404228
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.403208
G1 X77.944 Y75.926 E.00348
; LINE_WIDTH: 0.406518
G1 X78.33 Y75.8 E.00516
; LINE_WIDTH: 0.410268
G3 X80.418 Y75.798 I1.103 J47.876 E.02675
; LINE_WIDTH: 0.409768
G1 X82.418 Y75.797 E.02559
; LINE_WIDTH: 0.409278
G1 X84.418 Y75.796 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.796 E.01775
; LINE_WIDTH: 0.450111
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491775
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533438
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.1041
; LINE_WIDTH: 0.533328
G1 X98.251 Y75.983 E.10095
; LINE_WIDTH: 0.533218
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00392
G1 X101.555 Y75.841 E.00144
; LINE_WIDTH: 0.488828
G1 X101.638 Y75.823 E.00131
; LINE_WIDTH: 0.444488
G1 X101.722 Y75.805 E.00119
; LINE_WIDTH: 0.402978
G1 X101.935 Y75.866 E.00279
; LINE_WIDTH: 0.403938
G1 X102.217 Y76.047 E.00423
; LINE_WIDTH: 0.408448
G1 X102.431 Y76.354 E.00477
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
G1 X102.38 Y103.752 E.00555
; LINE_WIDTH: 0.403948
G1 X102.083 Y104.061 E.00541
; LINE_WIDTH: 0.404558
G1 X101.708 Y104.199 E.00504
; LINE_WIDTH: 0.447565
G1 X101.629 Y104.178 E.00116
; LINE_WIDTH: 0.490571
G1 X101.549 Y104.158 E.00127
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00139
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.543 Y104.149 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.412728
G1 F2003
M204 S5000
G1 X102.436 Y104.28 E.0022
G1 X102.175 Y104.454 E.00403
; LINE_WIDTH: 0.412578
G1 X101.742 Y104.585 E.00584
; LINE_WIDTH: 0.447565
G1 X101.578 Y104.567 E.00231
; LINE_WIDTH: 0.490571
G1 X101.414 Y104.55 E.00254
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00277
M73 P55 R7
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.415268
G1 X77.963 Y104.514 E.00532
G1 X77.616 Y104.319 E.00516
; LINE_WIDTH: 0.404318
G1 X77.303 Y103.974 E.00588
; LINE_WIDTH: 0.409418
G1 X77.135 Y103.552 E.00581
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
G3 X77.141 Y76.413 I3.741 J-.283 E.01124
; LINE_WIDTH: 0.412938
G3 X77.456 Y75.832 I1.23 J.292 E.00863
; LINE_WIDTH: 0.403208
G1 X77.745 Y75.595 E.0047
; LINE_WIDTH: 0.409188
G1 X78.158 Y75.433 E.00566
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00324
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.405 E.01786
; LINE_WIDTH: 0.450111
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491775
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533438
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10097
; LINE_WIDTH: 0.533328
G1 X98.251 Y75.467 E.10095
; LINE_WIDTH: 0.533218
G1 X101.251 Y75.467 E.05046
G1 X101.368 Y75.448 E.002
; LINE_WIDTH: 0.493591
G1 X101.486 Y75.428 E.00185
; LINE_WIDTH: 0.454015
G1 X101.603 Y75.408 E.0017
; LINE_WIDTH: 0.414438
G1 X101.947 Y75.457 E.0045
; LINE_WIDTH: 0.411538
G1 X102.291 Y75.613 E.00486
; LINE_WIDTH: 0.413698
G1 X102.576 Y75.861 E.00488
G1 X102.783 Y76.184 E.00496
; LINE_WIDTH: 0.409518
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
; LINE_WIDTH: 0.412728
G1 X102.581 Y104.102 E.00294
; WIPE_START
G1 F12000
M204 S6000
G1 X102.436 Y104.28 E-.08753
G1 X102.175 Y104.454 E-.11875
G1 X101.742 Y104.585 E-.17213
G1 X101.578 Y104.567 E-.06255
G1 X101.414 Y104.55 E-.06254
G1 X101.251 Y104.533 E-.06254
G1 X100.74 Y104.533 E-.19396
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.073 Y98.494 Z4.5 F42000
G1 X81.784 Y80.002 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2003
M204 S6000
G1 X83.218 Y79.24 E.02291
G1 X83.599 Y79.957 E.01145
G1 X84.012 Y80.733 E.0124
G1 X82.578 Y81.495 E.02291
G1 X81.812 Y80.055 E.02301
M204 S250
G1 X81.219 Y79.83 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2003
M204 S5000
G1 X83.391 Y78.675 E.03229
G1 X83.733 Y79.318 E.00956
G1 X83.968 Y79.761 E.00658
G1 X84.215 Y80.225 E.0069
G1 X84.577 Y80.906 E.01013
G1 X82.405 Y82.061 E.03229
G1 X81.854 Y81.023 E.01543
G1 X81.666 Y80.67 E.00525
G1 X81.553 Y80.458 E.00315
G1 X81.366 Y80.105 E.00525
G1 X81.247 Y79.883 E.00331
; WIPE_START
G1 F5700
M204 S6000
G1 X82.99 Y78.901 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.5 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.447 Y80.56
G1 Z4.1
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2003
M204 S6000
G1 X83.045 Y79.805 E.01123
G1 X82.349 Y80.175 E.01035
G1 X82.751 Y80.93 E.01123
G1 X83.394 Y80.589 E.00956
; WIPE_START
G1 F18000
G1 X82.751 Y80.93 E-.27667
G1 X82.349 Y80.175 E-.325
G1 X82.717 Y79.98 E-.15832
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.389 Y80.99 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384988
G1 F2003
M204 S5000
G1 X79.388 Y80.964 E.00031
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.396108
G1 X79.783 Y80.429 E.00476
G1 X80.186 Y80.381 E.00501
; LINE_WIDTH: 0.395688
G1 X80.501 Y80.523 E.00426
; LINE_WIDTH: 0.413668
G1 X80.693 Y80.77 E.00403
G1 X80.762 Y81.03 E.00348
; LINE_WIDTH: 0.406168
G1 X80.757 Y81.132 E.00129
; LINE_WIDTH: 0.385968
G1 X80.677 Y81.393 E.00329
; LINE_WIDTH: 0.389408
G1 X80.503 Y81.605 E.00332
G1 X80.259 Y81.729 E.00332
; LINE_WIDTH: 0.384988
G1 X79.986 Y81.75 E.00328
G1 X79.727 Y81.663 E.00328
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00327
G1 X79.392 Y81.05 E.00225
; WIPE_START
G1 F12000
M204 S6000
G1 X79.388 Y80.964 E-.03263
G1 X79.494 Y80.683 E-.11414
G1 X79.783 Y80.429 E-.14635
G1 X80.186 Y80.381 E-.15425
G1 X80.501 Y80.523 E-.13133
G1 X80.693 Y80.77 E-.11862
G1 X80.735 Y80.929 E-.06268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.563 Y88.018 Z4.5 F42000
G1 X84.654 Y90.754 Z4.5
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2003
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.5 F42000
G1 Z4.1
G1 E.8 F1800
G1 F2003
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.18
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/100
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.5 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.5
G1 Z4.18
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F2007
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.204 E.04321
; LINE_WIDTH: 0.411568
G1 X78.205 Y104.177 E.00284
G1 X77.867 Y104.022 E.00479
; LINE_WIDTH: 0.411208
G1 X77.597 Y103.701 E.00539
G1 X77.5 Y103.369 E.00444
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.282 I47.462 J-1.092 E.02675
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
G1 X77.496 Y76.725 E.00711
G1 X77.551 Y76.403 E.00417
; LINE_WIDTH: 0.413578
G1 X77.61 Y76.283 E.00172
G1 X77.755 Y76.075 E.00327
; LINE_WIDTH: 0.411198
G1 X78.01 Y75.89 E.00404
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410258
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.409758
G1 X82.425 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.796 E.01766
; LINE_WIDTH: 0.450111
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491775
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533438
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.1041
; LINE_WIDTH: 0.533318
G1 X98.251 Y75.983 E.10094
; LINE_WIDTH: 0.533198
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.00391
G1 X101.555 Y75.842 E.00144
; LINE_WIDTH: 0.488898
G1 X101.638 Y75.824 E.00131
; LINE_WIDTH: 0.444648
G1 X101.722 Y75.805 E.00119
; LINE_WIDTH: 0.402998
G1 X101.935 Y75.866 E.00278
; LINE_WIDTH: 0.403938
G1 X102.217 Y76.047 E.00423
; LINE_WIDTH: 0.406458
G1 X102.43 Y76.354 E.00474
; LINE_WIDTH: 0.407678
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
G1 X102.502 Y103.275 E.03299
; LINE_WIDTH: 0.414188
G1 X102.47 Y103.503 E.00297
G1 X102.346 Y103.8 E.00417
; LINE_WIDTH: 0.405988
G1 X102.047 Y104.08 E.00519
G1 X101.715 Y104.196 E.00446
; LINE_WIDTH: 0.445505
G1 X101.633 Y104.177 E.00118
; LINE_WIDTH: 0.489541
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.545 Y104.146 Z4.58 F42000
G1 Z4.18
G1 E.8 F1800
; LINE_WIDTH: 0.404728
G1 F2007
M204 S5000
G1 X102.337 Y104.357 E.00375
; LINE_WIDTH: 0.410848
G1 X101.937 Y104.544 E.00568
; LINE_WIDTH: 0.418688
G1 X101.599 Y104.589 E.00445
; LINE_WIDTH: 0.456985
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495281
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.425 Y104.596 E.04321
G1 X78.234 Y104.577 E.00244
; LINE_WIDTH: 0.411568
G1 X77.82 Y104.452 E.00556
; LINE_WIDTH: 0.414438
G1 X77.492 Y104.209 E.00529
G1 X77.261 Y103.897 E.00503
; LINE_WIDTH: 0.409358
G1 X77.135 Y103.552 E.0047
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.291 E.00336
G1 X77.105 Y101.291 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.291 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.291 E.02561
; LINE_WIDTH: 0.409898
M73 P56 R7
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
G1 X77.104 Y76.725 E.00722
G1 X77.181 Y76.286 E.00569
; LINE_WIDTH: 0.403918
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408238
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00516
G1 X78.413 Y75.405 E.00455
; LINE_WIDTH: 0.410258
G1 X80.413 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.413 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.413 Y75.405 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.405 E.01782
; LINE_WIDTH: 0.450111
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491775
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533438
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10097
; LINE_WIDTH: 0.533318
G1 X98.251 Y75.467 E.10094
; LINE_WIDTH: 0.533198
G1 X101.251 Y75.467 E.05046
G1 X101.369 Y75.448 E.00201
; LINE_WIDTH: 0.493625
G1 X101.486 Y75.428 E.00185
; LINE_WIDTH: 0.454101
G1 X101.604 Y75.408 E.0017
; LINE_WIDTH: 0.414578
G1 X101.947 Y75.457 E.00449
; LINE_WIDTH: 0.411508
G1 X102.291 Y75.613 E.00486
G1 X102.498 Y75.784 E.00344
; LINE_WIDTH: 0.406888
G1 X102.769 Y76.152 E.00581
; LINE_WIDTH: 0.409548
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
G3 X102.88 Y103.44 I-4.027 J.288 E.0095
; LINE_WIDTH: 0.408448
G1 X102.762 Y103.858 E.00554
G1 X102.64 Y104.05 E.0029
; LINE_WIDTH: 0.404728
G1 X102.588 Y104.103 E.00093
; WIPE_START
G1 F12000
M204 S6000
G1 X102.337 Y104.357 E-.13553
G1 X101.937 Y104.544 E-.1681
G1 X101.599 Y104.589 E-.12926
G1 X101.483 Y104.571 E-.04471
G1 X101.367 Y104.552 E-.04471
G1 X101.251 Y104.533 E-.04471
G1 X100.743 Y104.533 E-.19299
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.07 Y98.499 Z4.58 F42000
G1 X81.732 Y79.985 Z4.58
G1 Z4.18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2007
M204 S6000
G1 X83.233 Y79.187 E.02398
G1 X83.632 Y79.938 E.01199
G1 X84.064 Y80.75 E.01298
G1 X82.563 Y81.548 E.02398
G1 X81.76 Y80.038 E.02413
M204 S250
G1 X81.167 Y79.813 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2007
M204 S5000
G1 X83.406 Y78.622 E.03329
G1 X83.758 Y79.285 E.00985
G1 X84.001 Y79.742 E.00679
G1 X84.257 Y80.224 E.00717
G1 X84.629 Y80.923 E.0104
G1 X82.39 Y82.113 E.03329
G1 X81.838 Y81.074 E.01545
G1 X81.65 Y80.721 E.00525
G1 X81.523 Y80.483 E.00355
G1 X81.335 Y80.13 E.00525
G1 X81.195 Y79.866 E.00393
; WIPE_START
G1 F5700
M204 S6000
G1 X82.938 Y78.885 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.58 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.499 Y80.578
G1 Z4.18
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2007
M204 S6000
G1 X83.06 Y79.752 E.01227
G1 X82.297 Y80.158 E.01135
G1 X82.736 Y80.983 E.01227
G1 X83.446 Y80.606 E.01056
; WIPE_START
G1 F18000
G1 X82.736 Y80.983 E-.30569
G1 X82.297 Y80.158 E-.35518
G1 X82.527 Y80.036 E-.09914
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.378 Y81.037 Z4.58 F42000
G1 Z4.18
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.387968
G1 F2007
M204 S5000
G1 X79.488 Y80.693 E.00437
; LINE_WIDTH: 0.393048
G1 X79.738 Y80.459 E.0042
; LINE_WIDTH: 0.415328
G1 X80.055 Y80.376 E.00425
G1 X80.227 Y80.39 E.00223
; LINE_WIDTH: 0.405188
G1 X80.529 Y80.545 E.00429
; LINE_WIDTH: 0.405448
G1 X80.697 Y80.768 E.00354
G1 X80.763 Y81.03 E.00342
; LINE_WIDTH: 0.405308
G1 X80.749 Y81.193 E.00207
; LINE_WIDTH: 0.392908
G1 X80.61 Y81.497 E.00409
; LINE_WIDTH: 0.399188
G1 X80.391 Y81.684 E.00359
G1 X80.125 Y81.759 E.00344
; LINE_WIDTH: 0.398308
G1 X79.851 Y81.726 E.00343
G1 X79.611 Y81.589 E.00343
G1 X79.444 Y81.37 E.00343
; LINE_WIDTH: 0.398208
G1 X79.39 Y81.096 E.00346
; WIPE_START
G1 F12000
M204 S6000
G1 X79.488 Y80.693 E-.15772
G1 X79.738 Y80.459 E-.13032
G1 X80.055 Y80.376 E-.12454
G1 X80.227 Y80.39 E-.06528
G1 X80.529 Y80.545 E-.12896
G1 X80.697 Y80.768 E-.10614
G1 X80.727 Y80.888 E-.04704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.55 Y87.979 Z4.58 F42000
G1 X84.654 Y90.754 Z4.58
G1 Z4.18
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2007
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.58 F42000
G1 Z4.18
G1 E.8 F1800
G1 F2007
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.26
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/100
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.58 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.58
G1 Z4.26
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F2013
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.103 Y104.149 E.00416
; LINE_WIDTH: 0.411608
G1 X77.779 Y103.948 E.0049
G1 X77.571 Y103.645 E.00473
; LINE_WIDTH: 0.415258
G1 X77.536 Y103.516 E.00173
G1 X77.496 Y103.276 E.00317
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.33875
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.405378
G1 X77.729 Y76.101 E.00444
; LINE_WIDTH: 0.407748
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410268
G1 X78.417 Y75.798 E.00536
G1 X80.417 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.417 Y75.797 E.02559
; LINE_WIDTH: 0.409278
G1 X84.417 Y75.796 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.796 E.01776
; LINE_WIDTH: 0.450111
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491775
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533438
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.1041
; LINE_WIDTH: 0.533318
G1 X98.251 Y75.983 E.10094
; LINE_WIDTH: 0.533198
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489028
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.444908
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.412788
G1 X102.115 Y75.968 E.00534
; LINE_WIDTH: 0.413968
G3 X102.43 Y76.354 I-.621 J.828 E.00651
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407868
G1 X102.504 Y78.7 E.02547
; LINE_WIDTH: 0.408068
G1 X102.504 Y80.7 E.02548
; LINE_WIDTH: 0.408258
G1 X102.503 Y82.7 E.0255
; LINE_WIDTH: 0.408458
M73 P56 R6
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
; LINE_WIDTH: 0.413938
G1 X102.471 Y103.5 E.00293
G1 X102.346 Y103.801 E.0042
; LINE_WIDTH: 0.409928
G1 X102.043 Y104.084 E.00531
G1 X101.715 Y104.196 E.00444
; LINE_WIDTH: 0.445515
G1 X101.633 Y104.177 E.00118
; LINE_WIDTH: 0.489551
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.902 Y103.887 Z4.66 F42000
G1 X77.158 Y103.636 Z4.66
G1 Z4.26
G1 E.8 F1800
; LINE_WIDTH: 0.415258
G1 F2013
M204 S5000
G1 X77.104 Y103.288 E.00457
; LINE_WIDTH: 0.408588
G1 X77.104 Y77.288 E.33172
G3 X77.141 Y76.413 I3.727 J-.282 E.0112
; LINE_WIDTH: 0.413418
G1 X77.249 Y76.121 E.00402
G1 X77.453 Y75.834 E.00454
; LINE_WIDTH: 0.407848
G1 X77.825 Y75.546 E.006
; LINE_WIDTH: 0.409268
G1 X78.158 Y75.433 E.00449
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00324
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408788
G1 X85.808 Y75.405 E.01787
; LINE_WIDTH: 0.450111
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491775
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533438
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10097
; LINE_WIDTH: 0.533318
G1 X98.251 Y75.467 E.10094
; LINE_WIDTH: 0.533198
G1 X101.251 Y75.467 E.05046
G1 X101.369 Y75.448 E.00201
; LINE_WIDTH: 0.493595
G1 X101.487 Y75.428 E.00186
; LINE_WIDTH: 0.454041
M73 P57 R6
G1 X101.605 Y75.408 E.0017
; LINE_WIDTH: 0.414488
G1 X101.886 Y75.445 E.00368
; LINE_WIDTH: 0.412788
G1 X102.291 Y75.614 E.00566
G1 X102.498 Y75.783 E.00345
; LINE_WIDTH: 0.406878
G1 X102.769 Y76.153 E.00582
; LINE_WIDTH: 0.409548
G1 X102.893 Y76.646 E.00651
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
G3 X102.88 Y103.44 I-4.022 J.288 E.0095
; LINE_WIDTH: 0.406558
G1 X102.758 Y103.86 E.00554
G1 X102.639 Y104.053 E.00288
; LINE_WIDTH: 0.405238
G1 X102.323 Y104.362 E.00559
; LINE_WIDTH: 0.411418
G1 X101.937 Y104.545 E.00549
; LINE_WIDTH: 0.418668
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.456975
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495281
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X77.985 Y104.519 E.00569
; LINE_WIDTH: 0.403928
G1 X77.608 Y104.31 E.00544
; LINE_WIDTH: 0.411598
G1 X77.309 Y103.988 E.00565
; LINE_WIDTH: 0.415258
G1 X77.182 Y103.691 E.00418
; WIPE_START
G1 F12000
M204 S6000
G1 X77.104 Y103.288 E-.15614
G1 X77.104 Y101.699 E-.60386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.677 Y94.23 Z4.66 F42000
G1 X81.68 Y79.968 Z4.66
G1 Z4.26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2013
M204 S6000
G1 X83.248 Y79.134 E.02506
G1 X83.665 Y79.918 E.01253
G1 X84.116 Y80.767 E.01356
G1 X82.548 Y81.601 E.02506
G1 X81.708 Y80.021 E.02525
M204 S250
G1 X81.114 Y79.795 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2013
M204 S5000
G1 X83.421 Y78.569 E.0343
G1 X83.781 Y79.247 E.01008
G1 X84.034 Y79.722 E.00707
G1 X84.298 Y80.218 E.00738
G1 X84.681 Y80.94 E.01073
G1 X82.375 Y82.166 E.0343
G1 X81.824 Y81.13 E.01542
G1 X81.636 Y80.776 E.00525
G1 X81.491 Y80.505 E.00404
G1 X81.304 Y80.151 E.00525
G1 X81.143 Y79.848 E.00451
; WIPE_START
G1 F5700
M204 S6000
G1 X82.886 Y78.869 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.66 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.551 Y80.595
G1 Z4.26
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2013
M204 S6000
G1 X83.075 Y79.699 E.01331
G1 X82.245 Y80.141 E.01235
G1 X82.721 Y81.036 E.01331
G1 X83.498 Y80.623 E.01156
; WIPE_START
G1 F18000
G1 X82.721 Y81.036 E-.33469
G1 X82.245 Y80.141 E-.38534
G1 X82.337 Y80.092 E-.03998
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.403 Y80.926 Z4.66 F42000
G1 Z4.26
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392868
G1 F2013
M204 S5000
G1 X79.405 Y80.877 E.0006
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392348
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00343
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398268
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398488
G1 X80.766 Y81.03 E.00346
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389208
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385948
G1 X80.259 Y81.729 E.00329
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389368
G1 X79.726 Y81.665 E.00332
G1 X79.522 Y81.484 E.00332
; LINE_WIDTH: 0.384988
G1 X79.394 Y81.211 E.00361
; LINE_WIDTH: 0.392868
G1 X79.401 Y80.986 E.00276
; WIPE_START
G1 F12000
M204 S6000
G1 X79.405 Y80.877 E-.04131
G1 X79.537 Y80.621 E-.10942
G1 X79.751 Y80.449 E-.10442
G1 X80.016 Y80.374 E-.10451
G1 X80.289 Y80.403 E-.10456
G1 X80.529 Y80.541 E-.1049
G1 X80.696 Y80.76 E-.10488
G1 X80.753 Y80.979 E-.08599
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.582 Y88.068 Z4.66 F42000
G1 X84.654 Y90.754 Z4.66
G1 Z4.26
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2013
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.66 F42000
G1 Z4.26
G1 E.8 F1800
G1 F2013
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.34
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/100
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.66 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.66
G1 Z4.34
G1 E.8 F1800
; LINE_WIDTH: 0.497518
G1 F2020
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.411578
G1 X78.116 Y104.152 E.00327
G1 X77.799 Y103.966 E.00472
; LINE_WIDTH: 0.407458
G1 X77.569 Y103.646 E.00502
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.29 E.00463
G1 X77.496 Y76.725 E.33893
G1 X77.551 Y76.403 E.00417
; LINE_WIDTH: 0.405388
G1 X77.682 Y76.16 E.0035
; LINE_WIDTH: 0.404078
G1 X77.964 Y75.91 E.00475
; LINE_WIDTH: 0.405178
G1 X78.33 Y75.801 E.00483
; LINE_WIDTH: 0.410268
G1 X80.422 Y75.798 E.0268
; LINE_WIDTH: 0.409768
G1 X82.422 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.422 Y75.796 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.796 E.01769
; LINE_WIDTH: 0.450105
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491771
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533438
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.1041
; LINE_WIDTH: 0.533318
G1 X98.251 Y75.983 E.10094
; LINE_WIDTH: 0.533198
G1 X101.251 Y75.983 E.05047
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489035
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.444931
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.412748
G1 X102.115 Y75.968 E.00534
; LINE_WIDTH: 0.413958
G3 X102.43 Y76.354 I-.623 J.83 E.00651
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
G1 X102.071 Y104.066 E.00556
; LINE_WIDTH: 0.407518
G1 X101.692 Y104.201 E.00511
; LINE_WIDTH: 0.449538
G1 X101.618 Y104.18 E.00109
; LINE_WIDTH: 0.491558
G1 X101.544 Y104.158 E.0012
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.0013
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05421
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.6527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.512 Y104.181 Z4.74 F42000
G1 Z4.34
G1 E.8 F1800
; LINE_WIDTH: 0.410528
G1 F2020
M204 S5000
G1 X102.416 Y104.296 E.00192
; LINE_WIDTH: 0.414208
G1 X102.056 Y104.503 E.00537
G1 X101.736 Y104.586 E.00428
; LINE_WIDTH: 0.449538
G1 X101.574 Y104.569 E.00229
; LINE_WIDTH: 0.491558
G1 X101.413 Y104.551 E.00252
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00274
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.116 Y104.552 E.00323
; LINE_WIDTH: 0.411568
G1 X77.71 Y104.389 E.00561
; LINE_WIDTH: 0.414448
G1 X77.406 Y104.115 E.0053
G1 X77.196 Y103.756 E.00538
; LINE_WIDTH: 0.411578
G1 X77.104 Y103.295 E.00605
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.725 E.33899
G1 X77.181 Y76.286 E.00569
; LINE_WIDTH: 0.403918
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.411568
G1 X78.097 Y75.448 E.00559
G1 X78.411 Y75.405 E.00407
; LINE_WIDTH: 0.410268
G1 X80.411 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.411 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.411 Y75.405 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.405 E.01784
; LINE_WIDTH: 0.450105
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491771
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533438
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10097
; LINE_WIDTH: 0.533318
G1 X98.251 Y75.467 E.10094
; LINE_WIDTH: 0.533198
G1 X101.251 Y75.467 E.05047
G1 X101.369 Y75.448 E.00201
; LINE_WIDTH: 0.493568
G1 X101.487 Y75.428 E.00186
; LINE_WIDTH: 0.453998
G1 X101.605 Y75.408 E.0017
; LINE_WIDTH: 0.414428
G1 X101.886 Y75.445 E.00366
; LINE_WIDTH: 0.412748
G1 X102.291 Y75.614 E.00566
G1 X102.497 Y75.783 E.00345
; LINE_WIDTH: 0.406928
G1 X102.77 Y76.154 E.00584
; LINE_WIDTH: 0.409548
M73 P58 R6
G1 X102.893 Y76.646 E.00649
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
; LINE_WIDTH: 0.403938
G1 X102.726 Y103.926 E.00529
; LINE_WIDTH: 0.410528
G1 X102.55 Y104.135 E.0035
; WIPE_START
G1 F12000
M204 S6000
G1 X102.416 Y104.296 E-.07958
G1 X102.056 Y104.503 E-.15781
G1 X101.736 Y104.586 E-.12561
G1 X101.574 Y104.569 E-.06185
G1 X101.413 Y104.551 E-.06185
G1 X101.251 Y104.533 E-.06184
G1 X100.694 Y104.533 E-.21146
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.016 Y98.502 Z4.74 F42000
G1 X81.627 Y79.951 Z4.74
G1 Z4.34
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2020
M204 S6000
G1 X83.263 Y79.081 E.02614
G1 X83.698 Y79.899 E.01307
G1 X84.169 Y80.785 E.01415
G1 X82.533 Y81.654 E.02614
G1 X81.655 Y80.004 E.02637
M204 S250
G1 X81.062 Y79.778 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2020
M204 S5000
G1 X83.436 Y78.516 E.0353
G1 X83.807 Y79.215 E.01039
G1 X84.067 Y79.703 E.00726
G1 X84.34 Y80.218 E.00765
G1 X84.734 Y80.957 E.011
G1 X82.36 Y82.219 E.0353
G1 X81.806 Y81.178 E.01549
G1 X81.619 Y80.825 E.00525
G1 X81.462 Y80.531 E.00437
G1 X81.275 Y80.178 E.00525
G1 X81.09 Y79.831 E.00516
; WIPE_START
G1 F5700
M204 S6000
G1 X82.835 Y78.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.74 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.604 Y80.612
G1 Z4.34
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2020
M204 S6000
G1 X83.09 Y79.646 E.01436
G1 X82.192 Y80.124 E.01335
G1 X82.706 Y81.089 E.01436
G1 X83.551 Y80.64 E.01257
; WIPE_START
G1 F18000
G1 X82.706 Y81.089 E-.3637
G1 X82.216 Y80.168 E-.3963
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.389 Y80.991 Z4.74 F42000
G1 Z4.34
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384988
G1 F2020
M204 S5000
G1 X79.388 Y80.964 E.00032
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392908
G1 X79.74 Y80.457 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00343
G1 X80.518 Y80.533 E.00328
; LINE_WIDTH: 0.413628
G1 X80.693 Y80.77 E.0038
G1 X80.762 Y81.03 E.00348
; LINE_WIDTH: 0.406168
G1 X80.757 Y81.132 E.00129
; LINE_WIDTH: 0.385948
G1 X80.677 Y81.393 E.00329
G1 X80.502 Y81.603 E.00329
G1 X80.259 Y81.729 E.00329
; LINE_WIDTH: 0.389368
G1 X79.986 Y81.752 E.00332
G1 X79.727 Y81.664 E.00332
; LINE_WIDTH: 0.384988
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.392 Y81.051 E.00223
; WIPE_START
G1 F12000
M204 S6000
G1 X79.388 Y80.964 E-.0331
G1 X79.494 Y80.683 E-.11413
G1 X79.74 Y80.457 E-.12697
G1 X80.016 Y80.374 E-.10943
G1 X80.289 Y80.403 E-.10456
G1 X80.518 Y80.533 E-.10009
G1 X80.693 Y80.77 E-.11171
G1 X80.733 Y80.923 E-.06
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.561 Y88.012 Z4.74 F42000
G1 X84.654 Y90.754 Z4.74
G1 Z4.34
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2020
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.74 F42000
G1 Z4.34
G1 E.8 F1800
G1 F2020
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.42
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/100
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.74 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.74
G1 Z4.42
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F2040
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411578
G1 X78.205 Y104.177 E.00284
G1 X77.866 Y104.023 E.00479
; LINE_WIDTH: 0.405618
G1 X77.639 Y103.784 E.00417
G1 X77.501 Y103.369 E.00553
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
G1 X77.551 Y76.403 E.00417
; LINE_WIDTH: 0.411198
G1 X77.755 Y76.075 E.00495
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.425 Y75.798 E.02684
; LINE_WIDTH: 0.409768
G1 X82.425 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.796 E.01766
; LINE_WIDTH: 0.450101
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491765
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533428
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.1041
; LINE_WIDTH: 0.533308
G1 X98.251 Y75.983 E.10094
; LINE_WIDTH: 0.533188
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489031
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.444935
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.412718
G1 X102.115 Y75.968 E.00534
; LINE_WIDTH: 0.413998
G3 X102.43 Y76.354 I-.626 J.832 E.00651
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
; LINE_WIDTH: 0.413708
G1 X102.472 Y103.498 E.00291
G1 X102.346 Y103.8 E.00423
; LINE_WIDTH: 0.405938
G1 X102.046 Y104.081 E.0052
G1 X101.708 Y104.199 E.00453
; LINE_WIDTH: 0.447515
G1 X101.629 Y104.178 E.00116
; LINE_WIDTH: 0.490551
G1 X101.549 Y104.158 E.00127
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.00139
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.513 Y104.196 Z4.82 F42000
G1 Z4.42
G1 E.8 F1800
; LINE_WIDTH: 0.415048
G1 F2040
M204 S5000
G1 X102.485 Y104.233 E.0006
G1 X102.175 Y104.453 E.00493
; LINE_WIDTH: 0.412358
G1 X101.742 Y104.584 E.00582
; LINE_WIDTH: 0.447515
G1 X101.579 Y104.567 E.00231
; LINE_WIDTH: 0.490551
G1 X101.415 Y104.55 E.00254
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00277
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
; LINE_WIDTH: 0.411578
G1 X78.086 Y104.554 E.00438
G1 X77.663 Y104.352 E.00602
; LINE_WIDTH: 0.406568
G1 X77.357 Y104.053 E.00543
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
G1 X77.104 Y79.287 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.287 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.725 E.00718
G1 X77.181 Y76.285 E.00569
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00516
G1 X78.413 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.413 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.413 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.413 Y75.405 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.405 E.01782
; LINE_WIDTH: 0.450101
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491765
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533428
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10096
; LINE_WIDTH: 0.533308
G1 X98.251 Y75.467 E.10094
; LINE_WIDTH: 0.533188
G1 X101.251 Y75.467 E.05046
G1 X101.369 Y75.448 E.00202
; LINE_WIDTH: 0.493521
G1 X101.488 Y75.428 E.00186
; LINE_WIDTH: 0.453915
G1 X101.606 Y75.408 E.00171
; LINE_WIDTH: 0.414308
G1 X101.886 Y75.445 E.00365
; LINE_WIDTH: 0.412718
G1 X102.291 Y75.614 E.00566
G1 X102.497 Y75.783 E.00344
; LINE_WIDTH: 0.406928
G1 X102.77 Y76.154 E.00586
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00648
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
G3 X102.88 Y103.44 I-4.025 J.288 E.0095
; LINE_WIDTH: 0.404348
G1 X102.744 Y103.887 E.00589
; LINE_WIDTH: 0.415048
G1 X102.549 Y104.148 E.00423
; WIPE_START
G1 F12000
M204 S6000
M73 P59 R6
G1 X102.485 Y104.233 E-.04027
G1 X102.175 Y104.453 E-.14452
G1 X101.742 Y104.584 E-.17168
G1 X101.579 Y104.567 E-.06261
G1 X101.415 Y104.55 E-.06261
G1 X101.251 Y104.533 E-.06261
G1 X100.683 Y104.533 E-.2157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.001 Y98.506 Z4.82 F42000
G1 X81.575 Y79.934 Z4.82
G1 Z4.42
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2040
M204 S6000
G1 X83.278 Y79.028 E.02722
G1 X83.731 Y79.88 E.01361
G1 X84.221 Y80.802 E.01473
G1 X82.518 Y81.707 E.02722
G1 X81.603 Y79.987 E.02749
M204 S250
G1 X81.01 Y79.761 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2040
M204 S5000
G1 X83.451 Y78.463 E.0363
G1 X83.827 Y79.171 E.01053
G1 X84.1 Y79.684 E.00762
G1 X84.198 Y79.868 E.00274
G1 X84.386 Y80.221 E.00525
G1 X84.786 Y80.974 E.0112
G1 X82.345 Y82.272 E.0363
G1 X82.304 Y82.195 E.00115
G1 X82.116 Y81.842 E.00525
G1 X81.844 Y81.33 E.00762
G1 X81.656 Y80.977 E.00525
G1 X81.409 Y80.512 E.00691
G1 X81.221 Y80.159 E.00525
G1 X81.038 Y79.814 E.00513
; WIPE_START
G1 F7800
M204 S6000
G1 X82.783 Y78.837 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.82 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.656 Y80.629
G1 Z4.42
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2040
M204 S6000
G1 X83.105 Y79.593 E.0154
G1 X82.14 Y80.107 E.01436
G1 X82.691 Y81.142 E.0154
G1 X83.603 Y80.657 E.01357
M204 S10000
G1 X83.15 Y80.474 F42000
; LINE_WIDTH: 0.362468
G1 F2040
M204 S6000
G1 X82.951 Y80.099 E.00478
G1 X82.646 Y80.261 E.00389
G1 X82.845 Y80.636 E.00478
G1 X83.097 Y80.502 E.00321
; WIPE_START
G1 F18000
G1 X82.845 Y80.636 E-.1465
G1 X82.646 Y80.261 E-.21809
G1 X82.951 Y80.099 E-.17732
G1 X83.15 Y80.474 E-.21809
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.375 Y81.095 Z4.82 F42000
G1 Z4.42
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.398388
G1 F2040
M204 S5000
G1 X79.465 Y80.732 E.00464
; LINE_WIDTH: 0.386868
G1 X79.687 Y80.492 E.00394
; LINE_WIDTH: 0.392568
G1 X80.006 Y80.376 E.00417
G1 X80.172 Y80.38 E.00203
; LINE_WIDTH: 0.387088
G1 X80.437 Y80.479 E.00341
; LINE_WIDTH: 0.387928
G1 X80.661 Y80.707 E.00385
; LINE_WIDTH: 0.404668
G1 X80.763 Y81.03 E.00429
G1 X80.751 Y81.182 E.00193
; LINE_WIDTH: 0.393008
G1 X80.611 Y81.495 E.00419
G1 X80.389 Y81.681 E.00355
; LINE_WIDTH: 0.392388
G1 X80.124 Y81.756 E.00336
; LINE_WIDTH: 0.399288
G1 X79.851 Y81.727 E.00343
G1 X79.611 Y81.589 E.00344
; LINE_WIDTH: 0.398228
G1 X79.444 Y81.37 E.00343
; LINE_WIDTH: 0.398388
G1 X79.388 Y81.153 E.00278
; WIPE_START
G1 F12000
M204 S6000
G1 X79.465 Y80.732 E-.16261
G1 X79.687 Y80.492 E-.12417
G1 X80.006 Y80.376 E-.12937
G1 X80.172 Y80.38 E-.06302
G1 X80.437 Y80.479 E-.10762
G1 X80.661 Y80.707 E-.12118
G1 X80.702 Y80.837 E-.05204
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.528 Y87.927 Z4.82 F42000
G1 X84.654 Y90.754 Z4.82
G1 Z4.42
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2040
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.82 F42000
G1 Z4.42
G1 E.8 F1800
G1 F2040
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.5
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/100
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.82 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.82
G1 Z4.5
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F2052
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
G1 X77.936 Y104.071 E.00572
; LINE_WIDTH: 0.406578
G1 X77.634 Y103.77 E.00542
; LINE_WIDTH: 0.408338
G1 X77.499 Y103.37 E.00538
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.29 I84.247 J-1.088 E.02665
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
; LINE_WIDTH: 0.404118
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.403298
G1 X77.959 Y75.915 E.00372
; LINE_WIDTH: 0.406448
G1 X78.33 Y75.8 E.00493
; LINE_WIDTH: 0.410268
G3 X80.418 Y75.798 I1.103 J47.166 E.02675
; LINE_WIDTH: 0.409768
G1 X82.418 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.418 Y75.796 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.796 E.01775
; LINE_WIDTH: 0.450101
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491765
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533428
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.1041
; LINE_WIDTH: 0.533298
G1 X98.251 Y75.983 E.10094
; LINE_WIDTH: 0.533178
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489031
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.444945
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.407198
G1 X102.152 Y75.99 E.0058
G1 X102.422 Y76.327 E.0055
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00486
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
; LINE_WIDTH: 0.413898
G1 X102.471 Y103.5 E.00293
G1 X102.345 Y103.8 E.0042
; LINE_WIDTH: 0.405958
G1 X102.046 Y104.081 E.00521
G1 X101.706 Y104.199 E.00457
; LINE_WIDTH: 0.448241
G1 X101.627 Y104.179 E.00115
; LINE_WIDTH: 0.490905
G1 X101.548 Y104.158 E.00126
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.00137
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05424
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.508 Y104.202 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; LINE_WIDTH: 0.414818
G1 F2052
M204 S5000
G1 X102.485 Y104.233 E.0005
G1 X102.222 Y104.425 E.00422
; LINE_WIDTH: 0.406048
G1 X101.761 Y104.585 E.00618
; LINE_WIDTH: 0.448555
G1 X101.591 Y104.567 E.00241
; LINE_WIDTH: 0.491061
G1 X101.421 Y104.55 E.00264
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00288
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.119 Y104.551 E.00318
; LINE_WIDTH: 0.405638
G1 X77.744 Y104.41 E.00507
; LINE_WIDTH: 0.413438
G1 X77.405 Y104.114 E.00581
; LINE_WIDTH: 0.414118
G1 X77.183 Y103.731 E.00573
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
G3 X77.141 Y76.413 I3.754 J-.285 E.01129
; LINE_WIDTH: 0.412908
G3 X77.456 Y75.832 I1.232 J.292 E.00863
; LINE_WIDTH: 0.403298
G1 X77.745 Y75.595 E.0047
; LINE_WIDTH: 0.409398
G1 X78.157 Y75.433 E.00566
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00324
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.405 E.01786
; LINE_WIDTH: 0.450101
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491765
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533428
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10096
; LINE_WIDTH: 0.533298
G1 X98.251 Y75.467 E.10094
; LINE_WIDTH: 0.533178
G1 X101.251 Y75.467 E.05046
G1 X101.37 Y75.448 E.00202
; LINE_WIDTH: 0.493488
G1 X101.488 Y75.428 E.00187
; LINE_WIDTH: 0.453858
G1 X101.607 Y75.408 E.00171
; LINE_WIDTH: 0.414228
G1 X101.886 Y75.445 E.00365
; LINE_WIDTH: 0.412658
G1 X102.291 Y75.614 E.00566
G1 X102.497 Y75.783 E.00343
; LINE_WIDTH: 0.406928
G1 X102.77 Y76.155 E.00587
; LINE_WIDTH: 0.409548
G1 X102.893 Y76.646 E.00648
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
G3 X102.88 Y103.441 I-4.021 J.288 E.0095
; LINE_WIDTH: 0.406438
G1 X102.758 Y103.86 E.00554
; LINE_WIDTH: 0.414818
G1 X102.543 Y104.153 E.00471
; WIPE_START
G1 F12000
M204 S6000
G1 X102.485 Y104.233 E-.03747
G1 X102.222 Y104.425 E-.12373
G1 X101.761 Y104.585 E-.1852
G1 X101.591 Y104.567 E-.065
G1 X101.421 Y104.55 E-.065
G1 X101.251 Y104.533 E-.065
G1 X100.676 Y104.533 E-.2186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.989 Y98.509 Z4.9 F42000
G1 X81.523 Y79.917 Z4.9
G1 Z4.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2052
M204 S6000
G1 X83.293 Y78.975 E.02829
G1 X83.764 Y79.861 E.01415
G1 X84.273 Y80.819 E.01531
G1 X82.503 Y81.76 E.02829
G1 X81.551 Y79.97 E.02861
M204 S250
G1 X80.957 Y79.744 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2052
M204 S5000
G1 X83.466 Y78.41 E.0373
G1 X83.866 Y79.162 E.01118
G1 X84.133 Y79.664 E.00747
G1 X84.231 Y79.849 E.00274
G1 X84.419 Y80.202 E.00525
G1 X84.838 Y80.992 E.01174
G1 X82.33 Y82.325 E.0373
G1 X82.303 Y82.275 E.00074
G1 X82.116 Y81.922 E.00525
M73 P60 R6
G1 X81.999 Y81.703 E.00325
G1 X81.811 Y81.35 E.00525
G1 X81.695 Y81.131 E.00325
G1 X81.507 Y80.778 E.00525
G1 X81.251 Y80.296 E.00718
G1 X81.11 Y80.032 E.00392
G1 X80.986 Y79.797 E.00349
; WIPE_START
G1 F7800
M204 S6000
G1 X82.731 Y78.821 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.9 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.708 Y80.646
G1 Z4.5
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2052
M204 S6000
G1 X83.12 Y79.54 E.01644
G1 X82.088 Y80.09 E.01536
G1 X82.675 Y81.195 E.01644
G1 X83.655 Y80.674 E.01457
M204 S10000
G1 X83.177 Y80.483 F42000
; LINE_WIDTH: 0.400648
G1 F2052
M204 S6000
G1 X82.958 Y80.072 E.00582
G1 X82.619 Y80.252 E.00479
G1 X82.838 Y80.663 E.00582
G1 X83.124 Y80.512 E.00404
; WIPE_START
G1 F18000
G1 X82.838 Y80.663 E-.15002
G1 X82.619 Y80.252 E-.21607
G1 X82.958 Y80.072 E-.17784
G1 X83.177 Y80.483 E-.21607
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.396 Y81.17 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392888
G1 F2052
M204 S5000
G1 X79.405 Y80.877 E.00359
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392428
G1 X79.752 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00342
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398288
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.00346
G1 X80.728 Y81.289 E.00325
; LINE_WIDTH: 0.395848
G1 X80.514 Y81.593 E.00459
; LINE_WIDTH: 0.389828
G1 X80.259 Y81.729 E.00351
; LINE_WIDTH: 0.389388
G1 X79.986 Y81.752 E.00332
G1 X79.727 Y81.664 E.00332
; LINE_WIDTH: 0.384968
G1 X79.521 Y81.483 E.00328
G1 X79.402 Y81.228 E.00338
; WIPE_START
G1 F12000
M204 S6000
G1 X79.405 Y80.877 E-.13333
G1 X79.537 Y80.621 E-.10949
G1 X79.752 Y80.449 E-.10453
G1 X80.016 Y80.374 E-.10437
G1 X80.289 Y80.403 E-.10449
G1 X80.529 Y80.541 E-.10496
G1 X80.686 Y80.748 E-.09884
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.5 Y87.843 Z4.9 F42000
G1 X84.654 Y90.754 Z4.9
G1 Z4.5
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2052
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.9 F42000
G1 Z4.5
G1 E.8 F1800
G1 F2052
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.58
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/100
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.9 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.9
G1 Z4.58
G1 E.8 F1800
; LINE_WIDTH: 0.497518
G1 F2061
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.415268
G1 X78.1 Y104.139 E.00354
G1 X77.864 Y104.021 E.00342
; LINE_WIDTH: 0.409868
G1 X77.596 Y103.708 E.00527
G1 X77.5 Y103.37 E.00451
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.28 I42.631 J-1.093 E.02678
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
G1 X77.496 Y76.725 E.00709
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.404228
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.407308
G1 X78.01 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.415 Y75.798 E.00532
G1 X80.415 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.415 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.415 Y75.796 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.796 E.01779
; LINE_WIDTH: 0.450101
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491765
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533428
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.1041
; LINE_WIDTH: 0.533298
G1 X98.251 Y75.983 E.10094
; LINE_WIDTH: 0.533168
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00138
G1 X101.471 Y75.86 E.00391
G1 X101.555 Y75.842 E.00144
; LINE_WIDTH: 0.488925
G1 X101.638 Y75.824 E.00131
; LINE_WIDTH: 0.444741
G1 X101.722 Y75.805 E.00119
; LINE_WIDTH: 0.403698
G1 X101.941 Y75.869 E.00287
; LINE_WIDTH: 0.411268
G1 X102.28 Y76.114 E.00537
G1 X102.457 Y76.428 E.00463
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
G1 X102.081 Y104.062 E.00543
; LINE_WIDTH: 0.405628
G1 X101.706 Y104.199 E.00506
; LINE_WIDTH: 0.448278
G1 X101.627 Y104.179 E.00115
; LINE_WIDTH: 0.490928
G1 X101.548 Y104.158 E.00126
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.00137
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05421
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.6527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.491 Y104.213 Z4.98 F42000
G1 Z4.58
G1 E.8 F1800
; LINE_WIDTH: 0.412958
G1 F2061
M204 S5000
G1 X102.436 Y104.28 E.00112
G1 X102.23 Y104.423 E.00323
; LINE_WIDTH: 0.406108
G1 X101.762 Y104.584 E.00628
; LINE_WIDTH: 0.448598
G1 X101.591 Y104.567 E.00241
; LINE_WIDTH: 0.491088
G1 X101.421 Y104.55 E.00264
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00288
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.184 Y104.566 E.00234
; LINE_WIDTH: 0.406578
G1 X77.779 Y104.426 E.00544
G1 X77.592 Y104.297 E.00289
; LINE_WIDTH: 0.405048
G1 X77.294 Y103.959 E.00569
; LINE_WIDTH: 0.411468
G1 X77.138 Y103.571 E.00538
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
G3 X77.141 Y76.414 I3.732 J-.283 E.01121
; LINE_WIDTH: 0.412568
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.828 E.00378
; LINE_WIDTH: 0.404228
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.407318
G1 X78.161 Y75.435 E.00566
; LINE_WIDTH: 0.410268
G1 X78.407 Y75.405 E.00318
G1 X80.407 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.407 Y75.405 E.02559
; LINE_WIDTH: 0.409278
G1 X84.407 Y75.405 E.02556
; LINE_WIDTH: 0.408778
G1 X85.808 Y75.405 E.01788
; LINE_WIDTH: 0.450101
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491765
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533428
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10096
; LINE_WIDTH: 0.533298
G1 X98.251 Y75.467 E.10094
; LINE_WIDTH: 0.533168
G1 X101.251 Y75.468 E.05046
G1 X101.37 Y75.448 E.00202
; LINE_WIDTH: 0.493461
G1 X101.489 Y75.428 E.00187
; LINE_WIDTH: 0.453815
G1 X101.607 Y75.408 E.00171
; LINE_WIDTH: 0.414168
G1 X101.947 Y75.457 E.00444
; LINE_WIDTH: 0.414848
G1 X102.29 Y75.614 E.00489
G1 X102.536 Y75.818 E.00413
; LINE_WIDTH: 0.409068
G1 X102.783 Y76.178 E.00558
; LINE_WIDTH: 0.409548
G1 X102.893 Y76.646 E.00615
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
; LINE_WIDTH: 0.412958
G1 X102.529 Y104.166 E.00401
; WIPE_START
G1 F12000
M204 S6000
G1 X102.436 Y104.28 E-.05584
G1 X102.23 Y104.423 E-.09513
G1 X101.762 Y104.584 E-.18827
G1 X101.591 Y104.567 E-.06503
G1 X101.421 Y104.55 E-.06503
G1 X101.251 Y104.533 E-.06502
G1 X100.657 Y104.533 E-.22569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.967 Y98.512 Z4.98 F42000
G1 X81.47 Y79.9 Z4.98
G1 Z4.58
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2061
M204 S6000
G1 X83.308 Y78.922 E.02937
G1 X83.797 Y79.841 E.01468
G1 X84.326 Y80.836 E.01589
G1 X82.488 Y81.813 E.02937
G1 X81.498 Y79.953 E.02973
M204 S250
G1 X80.905 Y79.727 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2061
M204 S5000
G1 X83.481 Y78.357 E.03831
G1 X83.881 Y79.11 E.01119
G1 X84.069 Y79.463 E.00525
G1 X84.166 Y79.645 E.00271
G1 X84.277 Y79.855 E.00311
G1 X84.465 Y80.208 E.00525
G1 X84.891 Y81.009 E.01191
G1 X82.315 Y82.378 E.03831
G1 X82.288 Y82.328 E.00075
G1 X82.1 Y81.974 E.00525
G1 X81.984 Y81.756 E.00325
G1 X81.796 Y81.403 E.00525
G1 X81.68 Y81.184 E.00325
G1 X81.492 Y80.831 E.00525
G1 X81.224 Y80.326 E.00751
G1 X81.071 Y80.039 E.00426
G1 X80.933 Y79.78 E.00386
; WIPE_START
G1 F7800
M204 S6000
G1 X82.679 Y78.805 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.98 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.761 Y80.663
G1 Z4.58
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2061
M204 S6000
G1 X83.135 Y79.487 E.01748
G1 X82.035 Y80.072 E.01636
G1 X82.66 Y81.248 E.01748
G1 X83.708 Y80.691 E.01557
M204 S10000
G1 X83.203 Y80.493 F42000
; LINE_WIDTH: 0.438798
G1 F2061
M204 S6000
G1 X82.965 Y80.045 E.00697
G1 X82.593 Y80.243 E.00579
G1 X82.831 Y80.691 E.00697
G1 X83.15 Y80.521 E.00497
; WIPE_START
G1 F18000
G1 X82.831 Y80.691 E-.1529
G1 X82.593 Y80.243 E-.21442
G1 X82.965 Y80.045 E-.17827
G1 X83.203 Y80.493 E-.21442
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.397 Y81.164 Z4.98 F42000
G1 Z4.58
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.389368
G1 F2061
M204 S5000
G1 X79.388 Y80.964 E.00243
; LINE_WIDTH: 0.384988
G1 X79.494 Y80.683 E.0036
; LINE_WIDTH: 0.392908
G1 X79.74 Y80.457 E.00409
G1 X80.016 Y80.374 E.00353
; LINE_WIDTH: 0.399188
M73 P61 R6
G1 X80.289 Y80.403 E.00342
; LINE_WIDTH: 0.412988
G1 X80.526 Y80.548 E.00358
G1 X80.696 Y80.768 E.0036
; LINE_WIDTH: 0.406168
G1 X80.762 Y81.03 E.00342
G1 X80.757 Y81.132 E.00129
; LINE_WIDTH: 0.385968
G1 X80.677 Y81.393 E.00329
G1 X80.502 Y81.603 E.00329
G1 X80.259 Y81.729 E.00329
G1 X79.986 Y81.75 E.00329
G1 X79.727 Y81.664 E.00328
G1 X79.521 Y81.484 E.00329
; LINE_WIDTH: 0.389368
G1 X79.4 Y81.238 E.00332
G1 X79.399 Y81.224 E.00017
; WIPE_START
G1 F12000
M204 S6000
G1 X79.388 Y80.964 E-.09881
G1 X79.494 Y80.683 E-.11416
G1 X79.74 Y80.457 E-.12692
G1 X80.016 Y80.374 E-.10944
G1 X80.289 Y80.403 E-.10447
G1 X80.526 Y80.548 E-.10553
G1 X80.688 Y80.758 E-.10068
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.503 Y87.852 Z4.98 F42000
G1 X84.654 Y90.754 Z4.98
G1 Z4.58
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2061
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z4.98 F42000
G1 Z4.58
G1 E.8 F1800
G1 F2061
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.66
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/100
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.98 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z4.98
G1 Z4.66
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F2066
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.14 Y104.161 E.00367
; LINE_WIDTH: 0.405558
G1 X77.801 Y103.97 E.00493
; LINE_WIDTH: 0.407698
G1 X77.588 Y103.691 E.00448
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
G1 X77.496 Y76.724 E.00712
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.404218
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.407788
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.418 Y75.798 E.00536
G1 X80.418 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.418 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.418 Y75.796 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.796 E.01775
; LINE_WIDTH: 0.450091
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491755
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533418
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.1041
; LINE_WIDTH: 0.533288
G1 X98.251 Y75.983 E.10094
; LINE_WIDTH: 0.533158
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489045
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.444991
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.407228
G1 X102.151 Y75.989 E.00579
G1 X102.423 Y76.327 E.00551
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00485
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
; LINE_WIDTH: 0.403918
G1 X102.07 Y104.067 E.00558
; LINE_WIDTH: 0.407518
G1 X101.692 Y104.201 E.00509
; LINE_WIDTH: 0.449541
G1 X101.618 Y104.18 E.00109
; LINE_WIDTH: 0.491565
G1 X101.544 Y104.158 E.0012
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.0013
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05422
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.6527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.484 Y104.214 Z5.06 F42000
G1 Z4.66
G1 E.8 F1800
; LINE_WIDTH: 0.410548
G1 F2066
M204 S5000
G1 X102.414 Y104.297 E.00139
; LINE_WIDTH: 0.414158
G1 X102.056 Y104.503 E.00534
G1 X101.736 Y104.586 E.00428
; LINE_WIDTH: 0.449541
G1 X101.574 Y104.569 E.00229
; LINE_WIDTH: 0.491565
G1 X101.413 Y104.551 E.00252
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00274
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X78.147 Y104.564 E.00356
; LINE_WIDTH: 0.414218
G1 X77.79 Y104.433 E.00492
G1 X77.531 Y104.244 E.00415
; LINE_WIDTH: 0.403358
G1 X77.295 Y103.955 E.0047
; LINE_WIDTH: 0.409098
G1 X77.133 Y103.542 E.00566
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.291 E.00324
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
G3 X77.141 Y76.414 I3.733 J-.284 E.01122
; LINE_WIDTH: 0.412578
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.828 E.00378
; LINE_WIDTH: 0.404218
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.409498
G1 X78.157 Y75.432 E.00567
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00324
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409268
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.405 E.01786
; LINE_WIDTH: 0.450091
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491755
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533418
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10096
; LINE_WIDTH: 0.533288
G1 X98.251 Y75.467 E.10094
; LINE_WIDTH: 0.533158
G1 X101.251 Y75.468 E.05046
G1 X101.37 Y75.448 E.00203
; LINE_WIDTH: 0.493418
G1 X101.489 Y75.428 E.00187
; LINE_WIDTH: 0.453738
G1 X101.608 Y75.408 E.00172
; LINE_WIDTH: 0.414058
G1 X101.886 Y75.445 E.00363
; LINE_WIDTH: 0.412598
G1 X102.291 Y75.614 E.00566
G1 X102.496 Y75.782 E.00342
; LINE_WIDTH: 0.406978
G1 X102.771 Y76.156 E.00589
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00646
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
; LINE_WIDTH: 0.403918
G1 X102.726 Y103.926 E.00529
; LINE_WIDTH: 0.410548
G1 X102.522 Y104.168 E.00406
; WIPE_START
G1 F12000
M204 S6000
G1 X102.414 Y104.297 E-.06411
G1 X102.056 Y104.503 E-.15684
G1 X101.736 Y104.586 E-.12559
G1 X101.574 Y104.569 E-.06185
G1 X101.413 Y104.551 E-.06185
G1 X101.251 Y104.533 E-.06185
G1 X100.651 Y104.533 E-.22789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.956 Y98.516 Z5.06 F42000
G1 X81.418 Y79.883 Z5.06
G1 Z4.66
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2066
M204 S6000
G1 X83.323 Y78.869 E.03045
G1 X83.83 Y79.822 E.01522
G1 X84.378 Y80.853 E.01647
G1 X82.473 Y81.866 E.03045
G1 X81.446 Y79.936 E.03085
M204 S250
G1 X80.853 Y79.71 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2066
M204 S5000
G1 X83.496 Y78.304 E.03931
G1 X83.914 Y79.09 E.01168
G1 X84.101 Y79.443 E.00525
G1 X84.199 Y79.626 E.00273
G1 X84.309 Y79.834 E.00309
G1 X84.497 Y80.187 E.00525
G1 X84.943 Y81.026 E.01248
G1 X82.3 Y82.431 E.03931
G1 X82.272 Y82.38 E.00077
G1 X82.085 Y82.027 E.00525
G1 X81.969 Y81.808 E.00325
G1 X81.781 Y81.455 E.00525
G1 X81.665 Y81.237 E.00325
G1 X81.477 Y80.884 E.00525
G1 X81.196 Y80.356 E.00785
G1 X81.032 Y80.047 E.0046
G1 X80.881 Y79.763 E.00422
; WIPE_START
G1 F7800
M204 S6000
G1 X82.628 Y78.789 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.06 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.813 Y80.68
G1 Z4.66
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2066
M204 S6000
G1 X83.151 Y79.434 E.01853
G1 X81.983 Y80.055 E.01736
G1 X82.645 Y81.301 E.01853
G1 X83.76 Y80.708 E.01658
M204 S10000
G1 X83.23 Y80.502 F42000
; LINE_WIDTH: 0.476972
G1 F2066
M204 S6000
G1 X82.972 Y80.018 E.00822
G1 X82.566 Y80.234 E.00689
G1 X82.824 Y80.718 E.00822
G1 X83.177 Y80.53 E.00599
; WIPE_START
G1 F18000
G1 X82.824 Y80.718 E-.15532
G1 X82.566 Y80.234 E-.21303
G1 X82.972 Y80.018 E-.17862
G1 X83.23 Y80.502 E-.21303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.4 Y81.172 Z5.06 F42000
G1 Z4.66
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.404548
G1 F2066
M204 S5000
G1 X79.398 Y80.894 E.00351
G1 X79.516 Y80.645 E.00348
; LINE_WIDTH: 0.402688
G1 X79.723 Y80.463 E.00346
G1 X79.981 Y80.376 E.00343
; LINE_WIDTH: 0.402448
G1 X80.289 Y80.404 E.00388
; LINE_WIDTH: 0.398228
G1 X80.529 Y80.541 E.00342
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.00346
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398268
G1 X80.583 Y81.536 E.00343
G1 X80.272 Y81.724 E.00451
; LINE_WIDTH: 0.392708
G1 X79.986 Y81.754 E.00352
G1 X79.726 Y81.666 E.00336
; LINE_WIDTH: 0.390908
G1 X79.52 Y81.484 E.00334
; LINE_WIDTH: 0.388188
G1 X79.401 Y81.238 E.00331
; LINE_WIDTH: 0.404548
G1 X79.401 Y81.232 E.00008
; WIPE_START
G1 F12000
M204 S6000
G1 X79.398 Y80.894 E-.12838
G1 X79.516 Y80.645 E-.10462
G1 X79.723 Y80.463 E-.10454
G1 X79.981 Y80.376 E-.10361
G1 X80.289 Y80.404 E-.1175
G1 X80.529 Y80.541 E-.10474
G1 X80.683 Y80.743 E-.09661
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.497 Y87.838 Z5.06 F42000
G1 X84.654 Y90.754 Z5.06
G1 Z4.66
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2066
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.06 F42000
G1 Z4.66
G1 E.8 F1800
G1 F2066
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.74
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
M73 P62 R6
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/100
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.06 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z5.06
G1 Z4.74
G1 E.8 F1800
; LINE_WIDTH: 0.497508
G1 F2079
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533548
G1 X101.251 Y104.017 E.00235
G1 X99.251 Y104.017 E.03366
; LINE_WIDTH: 0.533338
G1 X97.251 Y104.017 E.03365
; LINE_WIDTH: 0.533128
G1 X95.251 Y104.016 E.03364
; LINE_WIDTH: 0.532928
G1 X93.251 Y104.016 E.03362
; LINE_WIDTH: 0.532718
G1 X91.251 Y104.016 E.03361
; LINE_WIDTH: 0.532518
G1 X89.251 Y104.016 E.0336
; LINE_WIDTH: 0.532308
G1 X87.251 Y104.016 E.03358
; LINE_WIDTH: 0.532108
G1 X86.064 Y104.016 E.01992
G1 X86.029 Y104.141 E.00218
G1 X85.956 Y104.162 E.00128
; LINE_WIDTH: 0.490325
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.448641
G1 X85.809 Y104.203 E.00108
; LINE_WIDTH: 0.406958
G1 X83.809 Y104.203 E.02541
; LINE_WIDTH: 0.406858
G1 X79.809 Y104.203 E.05081
; LINE_WIDTH: 0.406678
G1 X78.365 Y104.202 E.01833
; LINE_WIDTH: 0.409768
G1 X78.119 Y104.157 E.0032
; LINE_WIDTH: 0.411418
G1 X77.883 Y104.035 E.00342
G1 X77.599 Y103.711 E.00554
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.283 E.00562
G1 X77.496 Y101.283 E.02552
; LINE_WIDTH: 0.408408
G1 X77.496 Y99.283 E.0255
; LINE_WIDTH: 0.408228
G1 X77.496 Y97.283 E.02549
; LINE_WIDTH: 0.408048
G1 X77.496 Y95.283 E.02548
; LINE_WIDTH: 0.407868
G1 X77.496 Y93.283 E.02547
; LINE_WIDTH: 0.407688
G1 X77.496 Y91.283 E.02546
; LINE_WIDTH: 0.407508
G1 X77.496 Y89.283 E.02545
; LINE_WIDTH: 0.407328
G1 X77.496 Y87.283 E.02543
; LINE_WIDTH: 0.407148
G1 X77.497 Y85.283 E.02542
; LINE_WIDTH: 0.406968
G1 X77.497 Y83.283 E.02541
; LINE_WIDTH: 0.406788
G1 X77.497 Y81.283 E.0254
; LINE_WIDTH: 0.406608
G1 X77.497 Y79.283 E.02539
; LINE_WIDTH: 0.406428
G1 X77.497 Y77.283 E.02538
; LINE_WIDTH: 0.406248
G1 X77.497 Y76.7 E.00739
; LINE_WIDTH: 0.408228
G1 X77.549 Y76.402 E.00386
G1 X77.73 Y76.101 E.00447
; LINE_WIDTH: 0.407818
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.418 Y75.798 E.00536
G1 X80.418 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.418 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.418 Y75.796 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.796 E.01775
; LINE_WIDTH: 0.450091
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491755
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533418
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.1041
; LINE_WIDTH: 0.533278
G1 X98.251 Y75.983 E.10094
; LINE_WIDTH: 0.533148
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.555 Y75.842 E.00144
; LINE_WIDTH: 0.488915
G1 X101.638 Y75.823 E.00132
; LINE_WIDTH: 0.444741
G1 X101.722 Y75.805 E.00119
; LINE_WIDTH: 0.403678
G1 X101.941 Y75.869 E.00287
; LINE_WIDTH: 0.411238
G1 X102.28 Y76.113 E.00537
G1 X102.457 Y76.428 E.00464
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
G1 X102.502 Y103.276 E.033
; LINE_WIDTH: 0.413908
G1 X102.471 Y103.5 E.00293
G1 X102.345 Y103.8 E.0042
; LINE_WIDTH: 0.406018
G1 X102.045 Y104.082 E.00522
G1 X101.71 Y104.198 E.00449
; LINE_WIDTH: 0.446948
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490248
G1 X101.549 Y104.157 E.00128
; LINE_WIDTH: 0.533548
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493408
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05307
G1 X99.533 Y104.017 E-.6527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.493 Y104.221 Z5.14 F42000
G1 Z4.74
G1 E.8 F1800
; LINE_WIDTH: 0.414928
G1 F2079
M204 S5000
G1 X102.485 Y104.233 E.00019
G1 X102.297 Y104.378 E.00308
; LINE_WIDTH: 0.408018
G1 X101.889 Y104.558 E.00568
; LINE_WIDTH: 0.417958
G1 X101.599 Y104.59 E.0038
; LINE_WIDTH: 0.456488
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495018
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533548
G1 X101.251 Y104.533 E.00198
G1 X99.251 Y104.533 E.03366
; LINE_WIDTH: 0.533338
G1 X97.251 Y104.533 E.03365
; LINE_WIDTH: 0.533128
G1 X95.251 Y104.532 E.03364
; LINE_WIDTH: 0.532928
G1 X93.251 Y104.532 E.03362
; LINE_WIDTH: 0.532718
G1 X91.251 Y104.532 E.03361
; LINE_WIDTH: 0.532518
G1 X89.251 Y104.531 E.0336
; LINE_WIDTH: 0.532308
G1 X87.251 Y104.531 E.03358
; LINE_WIDTH: 0.532108
G1 X86.25 Y104.531 E.0168
G1 X86.103 Y104.552 E.00249
; LINE_WIDTH: 0.490325
G1 X85.956 Y104.572 E.00229
; LINE_WIDTH: 0.448641
G1 X85.809 Y104.593 E.00209
; LINE_WIDTH: 0.406958
G1 X83.809 Y104.593 E.02541
; LINE_WIDTH: 0.406858
G1 X79.809 Y104.592 E.05081
; LINE_WIDTH: 0.406678
G1 X78.365 Y104.592 E.01833
G1 X78.108 Y104.552 E.00331
; LINE_WIDTH: 0.411418
G1 X77.703 Y104.386 E.00562
; LINE_WIDTH: 0.413728
G1 X77.445 Y104.169 E.00437
G1 X77.205 Y103.777 E.00594
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.291 E.00634
G1 X77.105 Y101.291 E.02552
; LINE_WIDTH: 0.408408
G1 X77.105 Y99.291 E.0255
; LINE_WIDTH: 0.408228
G1 X77.105 Y97.291 E.02549
; LINE_WIDTH: 0.408048
G1 X77.105 Y95.291 E.02548
; LINE_WIDTH: 0.407868
G1 X77.106 Y93.291 E.02547
; LINE_WIDTH: 0.407688
G1 X77.106 Y91.291 E.02546
; LINE_WIDTH: 0.407508
G1 X77.106 Y89.291 E.02545
; LINE_WIDTH: 0.407328
G1 X77.106 Y87.291 E.02543
; LINE_WIDTH: 0.407148
G1 X77.107 Y85.291 E.02542
; LINE_WIDTH: 0.406968
G1 X77.107 Y83.291 E.02541
; LINE_WIDTH: 0.406788
G1 X77.107 Y81.291 E.0254
; LINE_WIDTH: 0.406608
G1 X77.108 Y79.291 E.02539
; LINE_WIDTH: 0.406428
G1 X77.108 Y77.291 E.02538
; LINE_WIDTH: 0.406248
G1 X77.108 Y76.7 E.0075
; LINE_WIDTH: 0.408238
G1 X77.182 Y76.263 E.00565
G1 X77.426 Y75.864 E.00596
; LINE_WIDTH: 0.403918
G1 X77.755 Y75.585 E.00544
; LINE_WIDTH: 0.409538
G1 X78.157 Y75.432 E.0055
; LINE_WIDTH: 0.410268
G1 X78.409 Y75.405 E.00324
G1 X80.409 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.409 Y75.405 E.02559
; LINE_WIDTH: 0.409268
G1 X84.409 Y75.405 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.405 E.01786
; LINE_WIDTH: 0.450091
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491755
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533418
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10096
; LINE_WIDTH: 0.533278
G1 X98.251 Y75.467 E.10094
; LINE_WIDTH: 0.533148
G1 X101.251 Y75.468 E.05046
G1 X101.37 Y75.448 E.00203
; LINE_WIDTH: 0.493375
G1 X101.49 Y75.428 E.00188
; LINE_WIDTH: 0.453661
G1 X101.609 Y75.408 E.00172
; LINE_WIDTH: 0.413948
G1 X101.947 Y75.457 E.00442
; LINE_WIDTH: 0.414838
G1 X102.29 Y75.614 E.00489
G1 X102.536 Y75.818 E.00413
; LINE_WIDTH: 0.409008
G1 X102.784 Y76.179 E.0056
; LINE_WIDTH: 0.409548
G1 X102.893 Y76.646 E.00613
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
; LINE_WIDTH: 0.406308
G1 X102.757 Y103.86 E.00554
; LINE_WIDTH: 0.414928
G1 X102.529 Y104.172 E.00502
; WIPE_START
G1 F12000
M204 S6000
G1 X102.485 Y104.233 E-.02841
G1 X102.297 Y104.378 E-.09022
G1 X101.889 Y104.558 E-.16945
G1 X101.599 Y104.59 E-.11064
G1 X101.483 Y104.571 E-.04474
G1 X101.367 Y104.552 E-.04474
G1 X101.251 Y104.533 E-.04474
G1 X100.653 Y104.533 E-.22706
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.952 Y98.52 Z5.14 F42000
G1 X81.366 Y79.865 Z5.14
G1 Z4.74
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2079
M204 S6000
G1 X83.338 Y78.816 E.03152
G1 X83.863 Y79.803 E.01576
G1 X84.43 Y80.87 E.01705
G1 X82.458 Y81.919 E.03152
G1 X81.394 Y79.918 E.03197
M204 S250
G1 X80.8 Y79.693 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2079
M204 S5000
G1 X83.511 Y78.251 E.04031
G1 X83.929 Y79.038 E.0117
G1 X84.117 Y79.391 E.00525
G1 X84.232 Y79.607 E.0032
G1 X84.365 Y79.858 E.00374
G1 X84.553 Y80.211 E.00525
G1 X84.995 Y81.043 E.01237
G1 X82.285 Y82.484 E.04031
G1 X82.258 Y82.434 E.00075
G1 X82.07 Y82.081 E.00525
G1 X81.954 Y81.862 E.00325
G1 X81.766 Y81.509 E.00525
G1 X81.65 Y81.29 E.00325
G1 X81.462 Y80.937 E.00525
G1 X81.357 Y80.74 E.00294
G1 X81.169 Y80.386 E.00525
G1 X80.993 Y80.054 E.00494
G1 X80.829 Y79.746 E.00459
; WIPE_START
G1 F7800
M204 S6000
G1 X82.576 Y78.772 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.14 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.865 Y80.697
G1 Z4.74
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2079
M204 S6000
G1 X83.166 Y79.381 E.01957
G1 X81.931 Y80.038 E.01837
G1 X82.63 Y81.354 E.01957
G1 X83.812 Y80.726 E.01758
M204 S10000
G1 X83.256 Y80.511 F42000
; LINE_WIDTH: 0.515128
G1 F2079
M204 S6000
G1 X82.979 Y79.991 E.00957
G1 X82.54 Y80.224 E.00808
G1 X82.816 Y80.745 E.00957
G1 X83.203 Y80.539 E.00711
; WIPE_START
G1 F18000
G1 X82.816 Y80.745 E-.16642
G1 X82.54 Y80.224 E-.22404
G1 X82.979 Y79.991 E-.18922
G1 X83.202 Y80.41 E-.18032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.373 Y81.102 Z5.14 F42000
G1 Z4.74
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.397848
G1 F2079
M204 S5000
G1 X79.465 Y80.732 E.00473
; LINE_WIDTH: 0.386888
G1 X79.687 Y80.492 E.00394
; LINE_WIDTH: 0.392568
G1 X80.007 Y80.376 E.00417
; LINE_WIDTH: 0.399248
G1 X80.289 Y80.403 E.00354
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00342
; LINE_WIDTH: 0.398528
G1 X80.766 Y81.03 E.00347
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398228
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389248
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385908
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.386848
G1 X79.677 Y81.631 E.00399
; LINE_WIDTH: 0.392508
G1 X79.452 Y81.376 E.00416
; LINE_WIDTH: 0.397848
G1 X79.39 Y81.16 E.00279
; WIPE_START
G1 F12000
M204 S6000
G1 X79.465 Y80.732 E-.16488
G1 X79.687 Y80.492 E-.12423
G1 X80.007 Y80.376 E-.12936
G1 X80.289 Y80.403 E-.10787
G1 X80.529 Y80.541 E-.10494
G1 X80.696 Y80.76 E-.10477
G1 X80.712 Y80.821 E-.02396
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.527 Y87.915 Z5.14 F42000
G1 X84.654 Y90.754 Z5.14
G1 Z4.74
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2079
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.14 F42000
G1 Z4.74
G1 E.8 F1800
G1 F2079
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.82
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F12000
M204 S6000
M73 P62 R5
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/100
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.14 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z5.14
G1 Z4.82
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F2089
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.408238
G1 X78.102 Y104.151 E.00342
G1 X77.802 Y103.97 E.00447
M73 P63 R5
G1 X77.588 Y103.691 E.00448
; LINE_WIDTH: 0.410288
G1 X77.498 Y103.28 E.00539
G1 X77.498 Y101.28 E.02563
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
; LINE_WIDTH: 0.404958
G1 X77.729 Y76.101 E.00444
; LINE_WIDTH: 0.408198
G1 X78.002 Y75.89 E.00439
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00548
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409768
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409268
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.450091
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491755
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533418
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X90.251 Y75.983 E.07045
; LINE_WIDTH: 0.533318
G1 X96.251 Y75.983 E.10094
; LINE_WIDTH: 0.533188
G1 X101.251 Y75.983 E.0841
; LINE_WIDTH: 0.533078
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489041
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.445005
G1 X101.734 Y75.807 E.00124
; LINE_WIDTH: 0.407268
G1 X102.151 Y75.989 E.00578
G1 X102.416 Y76.311 E.00531
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00507
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
; LINE_WIDTH: 0.413898
G1 X102.471 Y103.5 E.00293
G1 X102.346 Y103.8 E.00421
; LINE_WIDTH: 0.405338
G1 X102.045 Y104.082 E.00522
G1 X101.71 Y104.198 E.00448
; LINE_WIDTH: 0.446958
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490268
G1 X101.549 Y104.157 E.00128
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.469 Y104.24 Z5.22 F42000
G1 Z4.82
G1 E.8 F1800
; LINE_WIDTH: 0.415408
G1 F2089
M204 S5000
G1 X102.245 Y104.409 E.00364
; LINE_WIDTH: 0.407998
G1 X101.889 Y104.558 E.00492
; LINE_WIDTH: 0.417898
G1 X101.6 Y104.59 E.0038
; LINE_WIDTH: 0.456458
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495018
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
; LINE_WIDTH: 0.408228
G1 X77.988 Y104.523 E.0049
G1 X77.615 Y104.318 E.00543
; LINE_WIDTH: 0.405408
G1 X77.311 Y103.984 E.00571
; LINE_WIDTH: 0.411318
G1 X77.138 Y103.571 E.00576
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
G3 X77.141 Y76.413 I3.739 J-.283 E.01122
; LINE_WIDTH: 0.412998
G3 X77.454 Y75.831 I1.261 J.302 E.00862
; LINE_WIDTH: 0.404958
G1 X77.74 Y75.6 E.00465
; LINE_WIDTH: 0.411308
G1 X78.129 Y75.438 E.00541
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409768
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409268
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408768
G1 X85.808 Y75.405 E.01785
; LINE_WIDTH: 0.450091
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491755
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533418
G1 X86.251 Y75.467 E.00251
G1 X90.251 Y75.467 E.06731
; LINE_WIDTH: 0.533318
G1 X96.251 Y75.467 E.10094
; LINE_WIDTH: 0.533188
G1 X101.251 Y75.468 E.0841
; LINE_WIDTH: 0.533078
G1 X101.371 Y75.448 E.00204
; LINE_WIDTH: 0.493338
G1 X101.49 Y75.428 E.00188
; LINE_WIDTH: 0.453598
G1 X101.61 Y75.408 E.00172
; LINE_WIDTH: 0.413858
G1 X101.887 Y75.445 E.00361
; LINE_WIDTH: 0.412548
G1 X102.291 Y75.614 E.00565
G1 X102.496 Y75.782 E.00342
; LINE_WIDTH: 0.406798
G1 X102.769 Y76.144 E.00577
; LINE_WIDTH: 0.409548
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
G3 X102.88 Y103.44 I-4.023 J.288 E.0095
; LINE_WIDTH: 0.406288
G1 X102.757 Y103.86 E.00554
; LINE_WIDTH: 0.415408
G1 X102.514 Y104.201 E.00544
; WIPE_START
G1 F12000
M204 S6000
G1 X102.245 Y104.409 E-.12907
G1 X101.889 Y104.558 E-.14681
G1 X101.6 Y104.59 E-.11046
G1 X101.483 Y104.571 E-.04479
G1 X101.367 Y104.552 E-.04479
G1 X101.251 Y104.533 E-.04479
G1 X100.621 Y104.533 E-.23929
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.919 Y98.521 Z5.22 F42000
G1 X81.313 Y79.848 Z5.22
G1 Z4.82
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2089
M204 S6000
G1 X83.353 Y78.763 E.0326
G1 X83.896 Y79.784 E.0163
G1 X84.483 Y80.887 E.01764
G1 X82.442 Y81.972 E.0326
G1 X81.341 Y79.901 E.03309
M204 S250
G1 X80.748 Y79.676 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2089
M204 S5000
G1 X83.526 Y78.198 E.04131
G1 X83.964 Y79.022 E.01224
G1 X84.152 Y79.375 E.00525
G1 X84.265 Y79.587 E.00316
G1 X84.395 Y79.833 E.00365
G1 X84.583 Y80.186 E.00525
G1 X85.048 Y81.06 E.01299
G1 X82.27 Y82.537 E.04131
G1 X82.243 Y82.486 E.00076
G1 X82.055 Y82.133 E.00525
G1 X81.939 Y81.915 E.00325
G1 X81.751 Y81.561 E.00525
G1 X81.635 Y81.343 E.00325
G1 X81.447 Y80.99 E.00525
G1 X81.33 Y80.77 E.00327
G1 X81.142 Y80.417 E.00525
G1 X80.954 Y80.062 E.00527
G1 X80.776 Y79.728 E.00496
; WIPE_START
G1 F7800
M204 S6000
G1 X82.524 Y78.756 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.22 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.918 Y80.715
G1 Z4.82
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2089
M204 S6000
G1 X83.181 Y79.329 E.02061
G1 X81.878 Y80.021 E.01937
G1 X82.615 Y81.407 E.02061
G1 X83.865 Y80.743 E.01858
M204 S10000
G1 X83.283 Y80.52 F42000
; LINE_WIDTH: 0.553312
G1 F2089
M204 S6000
G1 X82.987 Y79.963 E.01102
G1 X82.513 Y80.215 E.00937
G1 X82.809 Y80.772 E.01102
G1 X83.23 Y80.549 E.00832
; WIPE_START
G1 F16786.527
G1 X82.809 Y80.772 E-.18094
G1 X82.513 Y80.215 E-.2397
G1 X82.987 Y79.963 E-.20373
G1 X83.154 Y80.279 E-.13563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.389 Y80.986 Z5.22 F42000
G1 Z4.82
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.384968
G1 F2089
M204 S5000
G1 X79.388 Y80.964 E.00026
G1 X79.48 Y80.707 E.00328
G1 X79.687 Y80.489 E.0036
; LINE_WIDTH: 0.392848
G1 X80.002 Y80.377 E.00409
; LINE_WIDTH: 0.399268
G1 X80.289 Y80.403 E.00359
G1 X80.529 Y80.541 E.00344
; LINE_WIDTH: 0.398248
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.00346
G1 X80.683 Y81.381 E.00448
; LINE_WIDTH: 0.389208
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385968
G1 X80.259 Y81.729 E.00329
; LINE_WIDTH: 0.389368
G1 X79.986 Y81.752 E.00332
G1 X79.727 Y81.664 E.00332
; LINE_WIDTH: 0.384968
G1 X79.522 Y81.483 E.00328
G1 X79.402 Y81.237 E.00328
G1 X79.392 Y81.046 E.00229
; WIPE_START
G1 F12000
M204 S6000
G1 X79.388 Y80.964 E-.03118
G1 X79.48 Y80.707 E-.10393
G1 X79.687 Y80.489 E-.11407
G1 X80.002 Y80.377 E-.127
G1 X80.289 Y80.403 E-.10957
G1 X80.529 Y80.541 E-.10495
G1 X80.696 Y80.76 E-.10485
G1 X80.739 Y80.925 E-.06444
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.563 Y88.015 Z5.22 F42000
G1 X84.654 Y90.754 Z5.22
G1 Z4.82
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2089
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.22 F42000
G1 Z4.82
G1 E.8 F1800
G1 F2089
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.9
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/100
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.22 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z5.22
G1 Z4.9
G1 E.8 F1800
; LINE_WIDTH: 0.497538
G1 F2097
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.12 Y104.154 E.00394
; LINE_WIDTH: 0.410608
G1 X77.78 Y103.951 E.00507
G1 X77.597 Y103.706 E.00392
; LINE_WIDTH: 0.405918
G1 X77.5 Y103.37 E.00444
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.28 I42.511 J-1.093 E.02677
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
M73 P64 R5
G1 X77.496 Y79.28 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.28 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.0071
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.404218
G1 X77.729 Y76.101 E.00442
; LINE_WIDTH: 0.408258
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
; LINE_WIDTH: 0.450081
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491745
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533408
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X90.251 Y75.983 E.07044
; LINE_WIDTH: 0.533308
G1 X96.251 Y75.983 E.10094
; LINE_WIDTH: 0.533178
G1 X101.251 Y75.983 E.0841
; LINE_WIDTH: 0.533068
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.09 E.0014
G1 X101.471 Y75.86 E.00392
G1 X101.555 Y75.841 E.00144
; LINE_WIDTH: 0.488851
G1 X101.638 Y75.823 E.00132
; LINE_WIDTH: 0.444635
G1 X101.722 Y75.805 E.00119
; LINE_WIDTH: 0.402948
G1 X101.934 Y75.866 E.00278
; LINE_WIDTH: 0.403908
G1 X102.214 Y76.044 E.00419
; LINE_WIDTH: 0.406758
G1 X102.431 Y76.354 E.0048
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
G1 X102.501 Y103.334 E.03368
G1 X102.38 Y103.752 E.00556
; LINE_WIDTH: 0.403938
G1 X102.075 Y104.064 E.0055
; LINE_WIDTH: 0.407598
G1 X101.69 Y104.201 E.0052
; LINE_WIDTH: 0.449595
G1 X101.616 Y104.18 E.00108
; LINE_WIDTH: 0.491591
G1 X101.543 Y104.158 E.00119
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.00129
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05424
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.47 Y104.239 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; LINE_WIDTH: 0.412988
G1 F2097
M204 S5000
G1 X102.439 Y104.277 E.00063
; LINE_WIDTH: 0.413578
G1 X102.119 Y104.478 E.00488
G1 X101.736 Y104.586 E.00514
; LINE_WIDTH: 0.449595
G1 X101.574 Y104.568 E.00229
; LINE_WIDTH: 0.491591
G1 X101.413 Y104.551 E.00252
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00274
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
G1 X77.988 Y104.517 E.00567
; LINE_WIDTH: 0.403158
G1 X77.594 Y104.304 E.00562
; LINE_WIDTH: 0.403398
G1 X77.317 Y103.993 E.00525
; LINE_WIDTH: 0.410938
G1 X77.139 Y103.57 E.00588
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
G3 X77.141 Y76.414 I3.73 J-.283 E.01121
; LINE_WIDTH: 0.412558
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.829 E.00378
; LINE_WIDTH: 0.404218
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
; LINE_WIDTH: 0.450081
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491745
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533408
G1 X86.251 Y75.467 E.00251
G1 X90.251 Y75.467 E.06731
; LINE_WIDTH: 0.533308
G1 X96.251 Y75.467 E.10094
; LINE_WIDTH: 0.533178
G1 X101.251 Y75.468 E.0841
; LINE_WIDTH: 0.533068
G1 X101.371 Y75.448 E.00204
; LINE_WIDTH: 0.493238
G1 X101.491 Y75.428 E.00188
; LINE_WIDTH: 0.453408
G1 X101.61 Y75.408 E.00173
; LINE_WIDTH: 0.413578
G1 X101.947 Y75.457 E.0044
; LINE_WIDTH: 0.411288
G1 X102.291 Y75.613 E.00486
G1 X102.496 Y75.782 E.0034
; LINE_WIDTH: 0.406998
G1 X102.772 Y76.158 E.00593
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00644
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
G1 X102.894 Y103.334 E.03368
G1 X102.862 Y103.529 E.00252
; LINE_WIDTH: 0.403938
G1 X102.726 Y103.926 E.00529
; LINE_WIDTH: 0.412988
G1 X102.507 Y104.193 E.00445
; WIPE_START
G1 F12000
M204 S6000
G1 X102.439 Y104.277 E-.04121
G1 X102.119 Y104.478 E-.14347
G1 X101.736 Y104.586 E-.15128
G1 X101.574 Y104.568 E-.06183
G1 X101.413 Y104.551 E-.06183
G1 X101.251 Y104.533 E-.06183
G1 X100.623 Y104.533 E-.23855
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.915 Y98.526 Z5.3 F42000
G1 X81.261 Y79.831 Z5.3
G1 Z4.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2097
M204 S6000
G1 X83.369 Y78.71 E.03368
G1 X83.929 Y79.764 E.01684
G1 X84.535 Y80.904 E.01822
G1 X82.427 Y82.025 E.03368
G1 X81.289 Y79.884 E.03421
M204 S250
G1 X80.696 Y79.658 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2097
M204 S5000
G1 X83.541 Y78.145 E.04232
G1 X83.988 Y78.985 E.01248
G1 X84.175 Y79.338 E.00525
G1 X84.298 Y79.568 E.00342
G1 X84.435 Y79.827 E.00385
G1 X84.623 Y80.18 E.00525
G1 X85.1 Y81.077 E.01334
G1 X82.255 Y82.59 E.04232
G1 X82.228 Y82.539 E.00076
G1 X82.04 Y82.186 E.00525
G1 X81.924 Y81.968 E.00325
G1 X81.736 Y81.614 E.00525
G1 X81.62 Y81.396 E.00325
G1 X81.432 Y81.043 E.00525
G1 X81.303 Y80.8 E.00361
G1 X81.115 Y80.447 E.00525
G1 X80.914 Y80.07 E.00561
G1 X80.724 Y79.711 E.00533
; WIPE_START
G1 F7800
M204 S6000
G1 X82.472 Y78.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.3 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.97 Y80.732
G1 Z4.9
G1 E.8 F1800
; FEATURE: Internal solid infill
G1 F2097
M204 S6000
G1 X83.196 Y79.276 E.02165
G1 X81.826 Y80.004 E.02037
G1 X82.6 Y81.46 E.02165
G1 X83.917 Y80.76 E.01958
M204 S10000
G1 X83.425 Y80.565 F42000
G1 F2097
M204 S6000
G1 X83.029 Y79.82 E.01108
G1 X82.371 Y80.17 E.00979
G1 X82.767 Y80.915 E.01108
G1 X83.372 Y80.593 E.009
M204 S10000
G1 X82.921 Y80.411 F42000
; LINE_WIDTH: 0.360118
G1 F2097
M204 S6000
G1 X82.903 Y80.378 E.00042
; WIPE_START
G1 F18000
G1 X82.921 Y80.411 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.401 Y80.925 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.392348
G1 F2097
M204 S5000
G1 X79.407 Y80.863 E.00076
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00337
; LINE_WIDTH: 0.399228
G1 X80.289 Y80.403 E.00342
G1 X80.528 Y80.541 E.00344
; LINE_WIDTH: 0.398188
G1 X80.696 Y80.76 E.00343
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.00346
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398268
G1 X80.582 Y81.537 E.00343
G1 X80.359 Y81.699 E.00343
G1 X80 Y81.751 E.00451
; LINE_WIDTH: 0.389368
G1 X79.726 Y81.665 E.00348
; LINE_WIDTH: 0.392848
G1 X79.471 Y81.41 E.00442
G1 X79.38 Y81.137 E.00353
; LINE_WIDTH: 0.392348
G1 X79.395 Y80.985 E.00186
; WIPE_START
G1 F12000
M204 S6000
G1 X79.407 Y80.863 E-.04648
G1 X79.537 Y80.621 E-.10444
G1 X79.751 Y80.449 E-.10437
G1 X80.016 Y80.374 E-.1046
G1 X80.289 Y80.403 E-.10443
G1 X80.528 Y80.541 E-.10488
G1 X80.696 Y80.76 E-.10489
G1 X80.753 Y80.979 E-.08591
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.582 Y88.068 Z5.3 F42000
G1 X84.654 Y90.754 Z5.3
G1 Z4.9
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2097
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.3 F42000
G1 Z4.9
G1 E.8 F1800
G1 F2097
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 4.98
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/100
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.3 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z5.3
G1 Z4.98
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F2091
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411568
G1 X78.205 Y104.177 E.00284
G1 X77.866 Y104.022 E.00479
; LINE_WIDTH: 0.406568
G1 X77.651 Y103.799 E.00394
G1 X77.503 Y103.393 E.00548
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.275 E.02714
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.275 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.275 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y95.275 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.275 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.275 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.275 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.275 E.02557
; LINE_WIDTH: 0.409268
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
G1 X77.496 Y76.724 E.00703
G1 X77.552 Y76.404 E.00415
; LINE_WIDTH: 0.404228
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.406668
G1 X78.009 Y75.889 E.00446
; LINE_WIDTH: 0.410268
G1 X78.413 Y75.798 E.0053
G1 X80.413 Y75.798 E.02563
; LINE_WIDTH: 0.409758
G1 X82.413 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.413 Y75.796 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.796 E.01781
; LINE_WIDTH: 0.450081
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491745
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533408
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X90.251 Y75.983 E.07044
; LINE_WIDTH: 0.533308
G1 X96.251 Y75.983 E.10094
; LINE_WIDTH: 0.533178
G1 X101.251 Y75.983 E.0841
; LINE_WIDTH: 0.533068
G1 X101.39 Y76.019 E.00241
M73 P65 R5
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489055
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.445041
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.407288
G1 X102.15 Y75.988 E.00578
G1 X102.423 Y76.329 E.00555
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00484
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
; LINE_WIDTH: 0.414208
G1 X102.47 Y103.503 E.00297
G1 X102.346 Y103.8 E.00417
; LINE_WIDTH: 0.405698
G1 X102.044 Y104.082 E.00523
G1 X101.715 Y104.196 E.00441
; LINE_WIDTH: 0.445528
G1 X101.633 Y104.177 E.00118
; LINE_WIDTH: 0.489558
G1 X101.551 Y104.157 E.0013
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.00142
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05422
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.6527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.447 Y104.245 Z5.38 F42000
G1 Z4.98
G1 E.8 F1800
; LINE_WIDTH: 0.404908
G1 F2091
M204 S5000
G1 X102.334 Y104.359 E.00202
; LINE_WIDTH: 0.410818
G1 X101.937 Y104.544 E.00563
; LINE_WIDTH: 0.418658
G1 X101.6 Y104.589 E.00445
; LINE_WIDTH: 0.456968
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495278
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
; LINE_WIDTH: 0.411568
G1 X78.086 Y104.554 E.00438
G1 X77.663 Y104.352 E.00602
; LINE_WIDTH: 0.406568
G1 X77.357 Y104.053 E.00543
; LINE_WIDTH: 0.413718
G1 X77.157 Y103.636 E.00597
G1 X77.105 Y103.287 E.00456
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.287 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.287 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.287 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.287 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.287 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.287 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.287 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.287 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.287 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.287 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.287 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.287 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.287 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.414 I3.72 J-.282 E.01117
; LINE_WIDTH: 0.412588
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.828 E.00378
; LINE_WIDTH: 0.404228
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.404548
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
; LINE_WIDTH: 0.450081
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491745
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533408
G1 X86.251 Y75.467 E.00251
G1 X90.251 Y75.467 E.06731
; LINE_WIDTH: 0.533308
G1 X96.251 Y75.467 E.10094
; LINE_WIDTH: 0.533178
G1 X101.251 Y75.468 E.0841
; LINE_WIDTH: 0.533068
G1 X101.371 Y75.448 E.00204
; LINE_WIDTH: 0.493281
G1 X101.491 Y75.428 E.00189
; LINE_WIDTH: 0.453495
G1 X101.611 Y75.408 E.00173
; LINE_WIDTH: 0.413708
G1 X101.886 Y75.445 E.00359
; LINE_WIDTH: 0.412468
G1 X102.291 Y75.614 E.00565
G1 X102.497 Y75.783 E.00344
; LINE_WIDTH: 0.407038
G1 X102.772 Y76.159 E.00591
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00642
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
; LINE_WIDTH: 0.408448
G1 X102.762 Y103.858 E.00554
G1 X102.639 Y104.051 E.00291
; LINE_WIDTH: 0.404908
G1 X102.489 Y104.203 E.0027
; WIPE_START
G1 F12000
M204 S6000
G1 X102.334 Y104.359 E-.08344
G1 X101.937 Y104.544 E-.16681
G1 X101.6 Y104.589 E-.1291
G1 X101.483 Y104.571 E-.04476
G1 X101.367 Y104.552 E-.04476
G1 X101.251 Y104.533 E-.04476
G1 X100.602 Y104.533 E-.24637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.893 Y98.527 Z5.38 F42000
G1 X81.222 Y79.818 Z5.38
G1 Z4.98
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2091
M204 S6000
G1 X83.38 Y78.671 E.03449
G1 X83.954 Y79.75 E.01724
G1 X84.574 Y80.917 E.01865
G1 X82.416 Y82.065 E.03449
G2 X81.466 Y80.323 I-28.391 J14.347 E.028
G1 X81.248 Y79.872 E.00706
M204 S250
G1 X80.657 Y79.646 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2091
M204 S5000
G1 X83.553 Y78.106 E.04307
G1 X84.262 Y79.441 E.01985
G1 X84.323 Y79.554 E.00168
G1 X84.386 Y79.674 E.00178
G1 X85.139 Y81.09 E.02106
G1 X82.243 Y82.63 E.04307
G1 X82.168 Y82.488 E.00211
G1 X81.98 Y82.135 E.00525
G1 X81.449 Y81.136 E.01485
G1 X81.176 Y80.626 E.00761
G1 X81 Y80.57 E.00242
G1 X81.06 Y80.418 E.00215
G1 X80.858 Y80.025 E.0058
G1 X80.685 Y79.699 E.00486
M204 S250
G1 X80.861 Y80.644 F42000
; LINE_WIDTH: 0.357208
G1 F2091
M204 S5000
G1 X80.861 Y80.644 E0
G1 F12000
G1 X80.861 Y80.644 E0
; LINE_WIDTH: 0.404528
G1 F2091
G1 X80.783 Y80.685 E.00111
; LINE_WIDTH: 0.451888
G1 X80.706 Y80.727 E.00125
G1 X80.734 Y80.883 E.00226
; LINE_WIDTH: 0.420688
G1 X80.763 Y81.04 E.0021
; LINE_WIDTH: 0.394968
G1 X80.686 Y81.381 E.00431
G1 X80.502 Y81.603 E.00355
; LINE_WIDTH: 0.385928
G1 X80.259 Y81.729 E.00329
; LINE_WIDTH: 0.389368
G1 X79.986 Y81.752 E.00332
G1 X79.727 Y81.663 E.00333
G1 X79.52 Y81.485 E.00332
G1 X79.402 Y81.237 E.00333
; LINE_WIDTH: 0.398088
G1 X79.402 Y80.877 E.00448
; LINE_WIDTH: 0.398228
G1 X79.535 Y80.62 E.00359
G1 X79.75 Y80.447 E.00343
; LINE_WIDTH: 0.403388
G1 X79.981 Y80.376 E.00305
G1 X80.258 Y80.396 E.0035
G1 X80.51 Y80.526 E.00357
; LINE_WIDTH: 0.451888
G1 X80.706 Y80.727 E.00397
G1 X80.783 Y80.685 E.00125
; LINE_WIDTH: 0.404528
G1 X80.808 Y80.672 E.00035
; WIPE_START
G1 F12000
M204 S6000
G1 X80.783 Y80.685 E-.01059
G1 X80.706 Y80.727 E-.03339
G1 X80.734 Y80.883 E-.06055
G1 X80.763 Y81.04 E-.06054
G1 X80.686 Y81.381 E-.13295
G1 X80.502 Y81.603 E-.10951
G1 X80.259 Y81.729 E-.10394
G1 X79.986 Y81.752 E-.10399
G1 X79.727 Y81.663 E-.10422
G1 X79.647 Y81.594 E-.04032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.38 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X84.009 Y80.745
G1 Z4.98
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F2091
M204 S6000
G1 X83.207 Y79.236 E.02244
G1 X81.787 Y79.991 E.02112
G1 X82.589 Y81.5 E.02244
G1 X83.956 Y80.773 E.02033
M204 S10000
G1 X83.464 Y80.578 F42000
G1 F2091
M204 S6000
G1 X83.04 Y79.781 E.01186
G1 X82.331 Y80.158 E.01054
G1 X82.755 Y80.955 E.01186
G1 X83.411 Y80.606 E.00976
; WIPE_START
G1 F18000
G1 X82.755 Y80.955 E-.28236
G1 X82.331 Y80.158 E-.34316
G1 X82.644 Y79.991 E-.13448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.045 Y87.494 Z5.38 F42000
G1 X84.654 Y90.754 Z5.38
G1 Z4.98
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2091
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.38 F42000
G1 Z4.98
G1 E.8 F1800
G1 F2091
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 5.06
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/100
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.38 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z5.38
G1 Z5.06
G1 E.8 F1800
; LINE_WIDTH: 0.497528
G1 F2109
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.415258
G1 X78.1 Y104.139 E.00354
G1 X77.865 Y104.023 E.00339
; LINE_WIDTH: 0.411148
G1 X77.598 Y103.704 E.00535
G1 X77.5 Y103.37 E.00448
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.283 I48.949 J-1.092 E.02674
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
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.283 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.283 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.725 E.00712
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.404208
G1 X77.729 Y76.101 E.00443
; LINE_WIDTH: 0.408238
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410258
G1 X78.42 Y75.798 E.00539
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409758
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.796 E.01772
; LINE_WIDTH: 0.450081
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491745
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533408
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X90.251 Y75.983 E.07044
; LINE_WIDTH: 0.533308
G1 X94.251 Y75.983 E.06729
; LINE_WIDTH: 0.533208
G1 X100.251 Y75.983 E.10092
; LINE_WIDTH: 0.533068
G1 X101.251 Y75.983 E.01682
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.09 E.0014
G1 X101.471 Y75.86 E.00392
G1 X101.555 Y75.842 E.00144
; LINE_WIDTH: 0.488865
G1 X101.638 Y75.823 E.00132
; LINE_WIDTH: 0.444681
G1 X101.722 Y75.805 E.00119
; LINE_WIDTH: 0.403678
G1 X101.941 Y75.869 E.00287
; LINE_WIDTH: 0.409778
G1 X102.267 Y76.095 E.00508
G1 X102.457 Y76.428 E.00491
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
G1 X102.502 Y90.7 E.02552
; LINE_WIDTH: 0.408708
G1 X102.502 Y92.7 E.02552
; LINE_WIDTH: 0.408838
G1 X102.502 Y94.7 E.02553
; LINE_WIDTH: 0.408968
G1 X102.502 Y96.7 E.02554
; LINE_WIDTH: 0.409098
M73 P66 R5
G1 X102.502 Y98.7 E.02555
; LINE_WIDTH: 0.409228
G1 X102.502 Y100.7 E.02556
; LINE_WIDTH: 0.409348
G1 X102.501 Y103.335 E.03368
G1 X102.38 Y103.752 E.00555
; LINE_WIDTH: 0.403958
G1 X102.079 Y104.063 E.00546
; LINE_WIDTH: 0.403648
G1 X101.71 Y104.198 E.00495
; LINE_WIDTH: 0.446958
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490268
G1 X101.549 Y104.157 E.00128
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.433 Y104.252 Z5.46 F42000
G1 Z5.06
G1 E.8 F1800
; LINE_WIDTH: 0.407248
G1 F2109
M204 S5000
G1 X102.286 Y104.389 E.00256
; LINE_WIDTH: 0.407998
G1 X101.888 Y104.558 E.0055
; LINE_WIDTH: 0.417908
G1 X101.6 Y104.59 E.00379
; LINE_WIDTH: 0.456465
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495021
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533418
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.184 Y104.565 E.00234
; LINE_WIDTH: 0.406568
G1 X77.779 Y104.426 E.00543
; LINE_WIDTH: 0.415288
G1 X77.466 Y104.186 E.00512
G1 X77.259 Y103.895 E.00463
; LINE_WIDTH: 0.408898
G1 X77.136 Y103.551 E.00467
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.291 E.00335
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
G3 X77.141 Y76.414 I3.74 J-.283 E.01122
; LINE_WIDTH: 0.412558
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.828 E.00378
; LINE_WIDTH: 0.404208
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411298
G1 X78.129 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410258
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409758
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409258
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.405 E.01785
; LINE_WIDTH: 0.450081
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491745
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533408
G1 X86.251 Y75.467 E.00251
G1 X90.251 Y75.467 E.06731
; LINE_WIDTH: 0.533308
G1 X94.251 Y75.467 E.06729
; LINE_WIDTH: 0.533208
G1 X100.251 Y75.468 E.10092
; LINE_WIDTH: 0.533068
G1 X101.251 Y75.468 E.01682
G1 X101.371 Y75.448 E.00205
; LINE_WIDTH: 0.493168
G1 X101.492 Y75.428 E.00189
; LINE_WIDTH: 0.453288
G1 X101.612 Y75.408 E.00173
; LINE_WIDTH: 0.413408
G1 X101.784 Y75.427 E.00223
; LINE_WIDTH: 0.403678
G1 X102.127 Y75.531 E.00452
G1 X102.484 Y75.767 E.0054
; LINE_WIDTH: 0.411248
G1 X102.768 Y76.146 E.00608
G1 X102.893 Y76.646 E.00662
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
; LINE_WIDTH: 0.415188
G1 X102.82 Y103.711 E.00497
G1 X102.641 Y104.058 E.00506
; LINE_WIDTH: 0.407248
G1 X102.477 Y104.211 E.00286
; WIPE_START
G1 F12000
M204 S6000
G1 X102.286 Y104.389 E-.0992
G1 X101.888 Y104.558 E-.16398
G1 X101.6 Y104.59 E-.11035
G1 X101.483 Y104.571 E-.04479
G1 X101.367 Y104.552 E-.04479
G1 X101.251 Y104.533 E-.04479
G1 X100.587 Y104.533 E-.2521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.88 Y98.525 Z5.46 F42000
G1 X81.222 Y79.818 Z5.46
G1 Z5.06
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2109
M204 S6000
G1 X83.38 Y78.671 E.03448
G1 X83.954 Y79.75 E.01724
G1 X84.574 Y80.917 E.01865
G1 X82.416 Y82.065 E.03448
G2 X81.466 Y80.323 I-28.36 J14.33 E.028
G1 X81.248 Y79.872 E.00706
M204 S250
G1 X80.657 Y79.646 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2109
M204 S5000
G1 X83.553 Y78.106 E.04307
G1 X84.323 Y79.554 E.02153
G1 X85.139 Y81.09 E.02285
G1 X82.243 Y82.63 E.04307
G2 X81.176 Y80.626 I-292.118 J154.336 E.02982
G1 X81 Y80.57 E.00242
G1 X81.06 Y80.418 E.00215
G1 X80.684 Y79.699 E.01066
M204 S250
G1 X80.861 Y80.644 F42000
; LINE_WIDTH: 0.357208
G1 F2109
M204 S5000
G1 X80.861 Y80.644 E0
G1 F12000
G1 X80.861 Y80.644 E0
; LINE_WIDTH: 0.404568
G1 F2109
G1 X80.783 Y80.685 E.00111
G1 X80.861 Y80.644 E.00111
; WIPE_START
G1 F12000
G1 X80.861 Y80.644 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.259 Y81.729 Z5.46 F42000
G1 Z5.06
G1 E.8 F1800
; LINE_WIDTH: 0.385948
G1 F2109
M204 S5000
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.665 E.00332
G1 X79.52 Y81.485 E.00333
; LINE_WIDTH: 0.389248
G1 X79.402 Y81.238 E.00332
; LINE_WIDTH: 0.385808
G1 X79.387 Y80.964 E.00329
G1 X79.48 Y80.707 E.00328
; LINE_WIDTH: 0.398028
G1 X79.738 Y80.456 E.00448
; LINE_WIDTH: 0.403408
G1 X79.981 Y80.376 E.00321
G1 X80.258 Y80.396 E.0035
G1 X80.51 Y80.526 E.00357
; LINE_WIDTH: 0.451968
G1 X80.706 Y80.727 E.00397
G1 X80.783 Y80.685 E.00125
G1 X80.706 Y80.727 E.00125
G1 X80.734 Y80.877 E.00217
; LINE_WIDTH: 0.420938
G1 X80.761 Y81.028 E.00202
; LINE_WIDTH: 0.394168
G1 X80.723 Y81.3 E.00337
; LINE_WIDTH: 0.394948
G1 X80.515 Y81.596 E.00446
G1 X80.313 Y81.701 E.00281
; WIPE_START
G1 F12000
M204 S6000
G1 X80.783 Y80.685 E-.42538
G1 X80.861 Y80.644 E-.0334
G1 X80.477 Y81.337 E-.30122
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.46 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X84.009 Y80.745
G1 Z5.06
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419998
G1 F2109
M204 S6000
G1 X83.207 Y79.236 E.02244
G1 X81.787 Y79.991 E.02112
G1 X82.589 Y81.5 E.02244
G1 X83.956 Y80.773 E.02033
M204 S10000
G1 X83.464 Y80.578 F42000
G1 F2109
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
G1 X84.045 Y87.494 Z5.46 F42000
G1 X84.654 Y90.754 Z5.46
G1 Z5.06
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2109
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.46 F42000
G1 Z5.06
G1 E.8 F1800
G1 F2109
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 5.14
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/100
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.46 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z5.46
G1 Z5.14
G1 E.8 F1800
; LINE_WIDTH: 0.497518
G1 F2193
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25562
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
; LINE_WIDTH: 0.411178
G1 X78.208 Y104.178 E.00279
G1 X77.866 Y104.023 E.00483
; LINE_WIDTH: 0.405638
G1 X77.639 Y103.784 E.00417
G1 X77.501 Y103.369 E.00553
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
G1 X77.496 Y76.724 E.00703
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.410588
G1 X77.751 Y76.079 E.00489
G1 X78.01 Y75.89 E.0041
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00539
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409758
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408748
G1 X85.808 Y75.796 E.01772
; LINE_WIDTH: 0.450071
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491735
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533398
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X90.251 Y75.983 E.07044
; LINE_WIDTH: 0.533298
G1 X96.251 Y75.983 E.10094
; LINE_WIDTH: 0.533158
G1 X101.251 Y75.983 E.0841
; LINE_WIDTH: 0.533038
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489058
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.445078
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.407318
G1 X102.149 Y75.988 E.00577
G1 X102.423 Y76.329 E.00557
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00483
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
G1 X102.079 Y104.064 E.00547
; LINE_WIDTH: 0.403678
G1 X101.71 Y104.198 E.00494
; LINE_WIDTH: 0.446978
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490278
G1 X101.55 Y104.157 E.00128
; LINE_WIDTH: 0.533578
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493423
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05421
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.6527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.426 Y104.259 Z5.54 F42000
G1 Z5.14
G1 E.8 F1800
; LINE_WIDTH: 0.407258
G1 F2193
M204 S5000
G1 X102.286 Y104.39 E.00244
; LINE_WIDTH: 0.408028
G1 X101.888 Y104.558 E.0055
; LINE_WIDTH: 0.417998
G1 X101.599 Y104.59 E.0038
; LINE_WIDTH: 0.456525
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495051
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533578
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25248
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
M73 P67 R5
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
; LINE_WIDTH: 0.411178
G1 X78.087 Y104.554 E.00436
G1 X77.655 Y104.349 E.00615
; LINE_WIDTH: 0.406578
G1 X77.357 Y104.053 E.00534
; LINE_WIDTH: 0.413718
G1 X77.157 Y103.636 E.00597
G1 X77.105 Y103.288 E.00456
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
G1 X77.104 Y76.724 E.00719
G1 X77.181 Y76.285 E.00568
; LINE_WIDTH: 0.403918
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.404558
G1 X77.705 Y75.62 E.00538
; LINE_WIDTH: 0.410828
G1 X78.13 Y75.439 E.00593
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409758
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409258
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.405 E.01785
; LINE_WIDTH: 0.450071
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491735
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533398
G1 X86.251 Y75.467 E.00251
G1 X90.251 Y75.467 E.06731
; LINE_WIDTH: 0.533298
G1 X96.251 Y75.467 E.10094
; LINE_WIDTH: 0.533158
G1 X101.251 Y75.468 E.0841
; LINE_WIDTH: 0.533038
G1 X101.372 Y75.448 E.00205
; LINE_WIDTH: 0.493215
G1 X101.492 Y75.428 E.00189
; LINE_WIDTH: 0.453391
G1 X101.613 Y75.408 E.00174
; LINE_WIDTH: 0.413568
G1 X101.886 Y75.445 E.00357
; LINE_WIDTH: 0.412388
G1 X102.291 Y75.613 E.00565
; LINE_WIDTH: 0.414138
G1 X102.577 Y75.863 E.00491
G1 X102.773 Y76.16 E.0046
; LINE_WIDTH: 0.409548
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
; LINE_WIDTH: 0.415168
G1 X102.82 Y103.711 E.00497
G1 X102.641 Y104.058 E.00507
; LINE_WIDTH: 0.407258
G1 X102.47 Y104.218 E.00298
; WIPE_START
G1 F12000
M204 S6000
G1 X102.286 Y104.39 E-.09577
G1 X101.888 Y104.558 E-.16395
G1 X101.599 Y104.59 E-.11048
G1 X101.483 Y104.571 E-.04473
G1 X101.367 Y104.552 E-.04473
G1 X101.251 Y104.533 E-.04472
G1 X100.578 Y104.533 E-.25563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.872 Y98.524 Z5.54 F42000
G1 X81.222 Y79.818 Z5.54
G1 Z5.14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449998
G1 F2193
M204 S6000
G1 X83.38 Y78.671 E.03448
G1 X83.954 Y79.75 E.01724
G1 X84.574 Y80.917 E.01865
G1 X82.416 Y82.065 E.03449
G2 X81.466 Y80.323 I-28.403 J14.353 E.028
G1 X81.248 Y79.872 E.00706
M204 S250
G1 X80.657 Y79.646 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F2193
M204 S5000
G1 X83.553 Y78.106 E.04307
G1 X84.323 Y79.554 E.02153
G1 X85.139 Y81.09 E.02285
G1 X82.243 Y82.63 E.04307
G2 X81.176 Y80.626 I-293.44 J155.041 E.02982
G1 X81.064 Y80.611 E.00148
; LINE_WIDTH: 0.388583
G1 X80.953 Y80.595 E.00136
G1 X81.006 Y80.507 E.00125
; LINE_WIDTH: 0.419998
G1 X81.06 Y80.418 E.00136
G1 X81.041 Y80.369 E.00069
G1 X80.685 Y79.699 E.00997
; WIPE_START
G1 F12000
M204 S6000
G1 X82.433 Y78.727 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.403 Y80.922 Z5.54 F42000
G1 Z5.14
G1 E.8 F1800
; LINE_WIDTH: 0.388208
G1 F2193
M204 S5000
G1 X79.409 Y80.863 E.00071
G1 X79.539 Y80.622 E.00331
G1 X79.753 Y80.451 E.00331
; LINE_WIDTH: 0.394168
G1 X80.015 Y80.373 E.00337
G1 X80.289 Y80.407 E.00338
; LINE_WIDTH: 0.392388
G1 X80.527 Y80.543 E.00336
; LINE_WIDTH: 0.422148
G1 X80.616 Y80.635 E.00169
; LINE_WIDTH: 0.451948
G1 X80.706 Y80.727 E.00181
G1 X80.829 Y80.661 E.00198
; LINE_WIDTH: 0.404558
G1 X80.953 Y80.595 E.00177
G1 X80.829 Y80.661 E.00177
; LINE_WIDTH: 0.451948
G1 X80.706 Y80.727 E.00198
G1 X80.734 Y80.877 E.00217
; LINE_WIDTH: 0.420928
G1 X80.761 Y81.028 E.00202
; LINE_WIDTH: 0.389908
G1 X80.721 Y81.299 E.00333
; LINE_WIDTH: 0.404508
G1 X80.529 Y81.585 E.00435
G1 X80.29 Y81.724 E.00349
; LINE_WIDTH: 0.403788
G1 X80.032 Y81.758 E.00328
G1 X79.725 Y81.668 E.00404
; LINE_WIDTH: 0.394828
G1 X79.471 Y81.41 E.00446
; LINE_WIDTH: 0.392488
G1 X79.382 Y81.136 E.00352
; LINE_WIDTH: 0.388208
G1 X79.397 Y80.982 E.00188
; WIPE_START
G1 F12000
M204 S6000
G1 X79.409 Y80.863 E-.04518
G1 X79.539 Y80.622 E-.1041
G1 X79.753 Y80.451 E-.10415
G1 X80.015 Y80.373 E-.10417
G1 X80.289 Y80.407 E-.10459
G1 X80.527 Y80.543 E-.10442
G1 X80.616 Y80.635 E-.04866
G1 X80.706 Y80.727 E-.04866
G1 X80.829 Y80.661 E-.05316
G1 X80.929 Y80.608 E-.04291
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.54 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.95 Y80.247
G1 Z5.14
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2193
M204 S2000
G1 X82.898 Y79.195 E.01954
G1 X82.526 Y79.393
G1 X84.057 Y80.924 E.02844
G1 X83.685 Y81.122
G1 X82.154 Y79.59 E.02844
G1 X81.782 Y79.788
G1 X83.314 Y81.32 E.02844
G1 X82.942 Y81.517
G1 X81.77 Y80.346 E.02176
; WIPE_START
G1 F12000
M204 S6000
G1 X82.942 Y81.517 E-.62965
G1 X83.245 Y81.356 E-.13036
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.635 Y81.703 Z5.54 F42000
G1 Z5.14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.251675
G1 F2193
M204 S6000
G1 X82.534 Y81.566 E.0013
; LINE_WIDTH: 0.210304
G1 X82.432 Y81.429 E.00107
; LINE_WIDTH: 0.168933
G1 X82.331 Y81.292 E.00084
; LINE_WIDTH: 0.127562
G1 X82.229 Y81.155 E.00061
; LINE_WIDTH: 0.0861914
G1 X82.128 Y81.018 E.00038
; WIPE_START
G1 F18000
G1 X82.229 Y81.155 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.121 Y80.89 Z5.54 F42000
G1 Z5.14
G1 E.8 F1800
; LINE_WIDTH: 0.0813243
G1 F2193
M204 S6000
G1 X84.228 Y80.809 E.00028
G2 X84.213 Y80.757 I-.063 J-.011 E.00012
; LINE_WIDTH: 0.0937003
G1 X84.104 Y80.609 E.00046
; LINE_WIDTH: 0.138747
G1 X83.994 Y80.461 E.00073
; LINE_WIDTH: 0.183794
G1 X83.885 Y80.313 E.001
M204 S10000
G1 X83.592 Y79.575 F42000
; LINE_WIDTH: 0.0861159
G1 F2193
M204 S6000
G1 X83.49 Y79.437 E.00039
; LINE_WIDTH: 0.127336
G1 X83.387 Y79.298 E.00062
; LINE_WIDTH: 0.168555
G1 X83.285 Y79.16 E.00085
; LINE_WIDTH: 0.209775
G1 X83.182 Y79.021 E.00108
; WIPE_START
G1 F18000
G1 X83.285 Y79.16 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.719 Y79.822 Z5.54 F42000
G1 Z5.14
G1 E.8 F1800
; LINE_WIDTH: 0.0817502
G1 F2193
M204 S6000
G1 X81.611 Y79.902 E.00028
; LINE_WIDTH: 0.118424
G1 X81.585 Y79.931 E.00013
G1 X81.602 Y79.968 E.00013
; LINE_WIDTH: 0.145278
G1 X81.673 Y80.07 E.00052
; LINE_WIDTH: 0.18795
G1 X81.745 Y80.171 E.00069
; LINE_WIDTH: 0.213223
G1 X81.835 Y80.281 E.00091
; WIPE_START
G1 F18000
G1 X81.745 Y80.171 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.768 Y87.531 Z5.54 F42000
G1 X84.654 Y90.754 Z5.54
G1 Z5.14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.508588
G1 F2193
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.54 F42000
G1 Z5.14
G1 E.8 F1800
G1 F2193
M204 S5000
G1 X84.654 Y97.246 E.00787
G1 X84.654 Y95.754 E.02389
G1 X85.146 Y95.754 E.00787
G1 X85.146 Y96 E.00394
G1 X85.146 Y97.186 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 5.22
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F12000
M204 S6000
G1 X84.654 Y97.246 E-.18813
G1 X84.654 Y95.754 E-.56674
G1 X84.668 Y95.754 E-.00514
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/100
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.54 I-.525 J1.098 P1  F42000
G1 X101.473 Y103.796 Z5.54
G1 Z5.22
G1 E.8 F1800
; LINE_WIDTH: 0.497508
G1 F1941
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
; LINE_WIDTH: 0.411558
G1 X78.116 Y104.152 E.00327
G1 X77.798 Y103.967 E.00473
; LINE_WIDTH: 0.407358
G1 X77.569 Y103.646 E.00501
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.29 E.00463
G1 X77.496 Y79.29 E.3062
G3 X77.496 Y76.7 I530.529 J-1.141 E.03305
; LINE_WIDTH: 0.407098
G1 X77.551 Y76.403 E.00384
; LINE_WIDTH: 0.403928
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.407288
G1 X78.009 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.415 Y75.798 E.00532
G1 X80.415 Y75.798 E.02563
; LINE_WIDTH: 0.409758
G1 X82.415 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.415 Y75.796 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.796 E.01779
; LINE_WIDTH: 0.450071
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491735
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533398
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X90.251 Y75.983 E.07044
; LINE_WIDTH: 0.533298
G1 X96.251 Y75.983 E.10094
; LINE_WIDTH: 0.533158
G1 X101.251 Y75.983 E.0841
; LINE_WIDTH: 0.533038
G1 X101.39 Y76.019 E.00241
G1 X101.433 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489065
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.445091
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.407338
G1 X102.149 Y75.987 E.00576
G1 X102.423 Y76.329 E.00558
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00483
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
; LINE_WIDTH: 0.413698
G1 X102.472 Y103.498 E.0029
G1 X102.347 Y103.801 E.00424
; LINE_WIDTH: 0.406888
G1 X102.043 Y104.083 E.00527
; LINE_WIDTH: 0.406158
G1 X101.712 Y104.197 E.00443
; LINE_WIDTH: 0.446368
G1 X101.631 Y104.177 E.00117
; LINE_WIDTH: 0.489968
G1 X101.55 Y104.157 E.00129
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.00141
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05421
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.6527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.425 Y104.264 Z5.62 F42000
G1 Z5.22
G1 E.8 F1800
; LINE_WIDTH: 0.405608
G1 F1941
M204 S5000
G1 X102.327 Y104.361 E.00174
; LINE_WIDTH: 0.408318
G1 X101.897 Y104.555 E.00601
; LINE_WIDTH: 0.418248
G1 X101.6 Y104.59 E.00392
; LINE_WIDTH: 0.456688
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495128
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00198
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
M73 P68 R5
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.115 Y104.552 E.00323
; LINE_WIDTH: 0.411568
G1 X77.708 Y104.388 E.00565
; LINE_WIDTH: 0.414848
G1 X77.424 Y104.138 E.0049
G1 X77.205 Y103.795 E.00528
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.295 E.00651
G1 X77.104 Y77.295 E.33172
G3 X77.141 Y76.413 I3.756 J-.285 E.01129
; LINE_WIDTH: 0.412848
G1 X77.269 Y76.086 E.00453
G1 X77.457 Y75.831 E.00409
; LINE_WIDTH: 0.403478
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.407308
G1 X78.161 Y75.435 E.00566
; LINE_WIDTH: 0.410268
G1 X78.407 Y75.405 E.00319
G1 X80.407 Y75.405 E.02563
; LINE_WIDTH: 0.409758
G1 X82.407 Y75.405 E.02559
; LINE_WIDTH: 0.409258
G1 X84.407 Y75.405 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.405 E.01788
; LINE_WIDTH: 0.450071
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491735
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533398
G1 X86.251 Y75.467 E.00251
G1 X90.251 Y75.467 E.06731
; LINE_WIDTH: 0.533298
G1 X96.251 Y75.467 E.10094
; LINE_WIDTH: 0.533158
G1 X101.251 Y75.468 E.0841
; LINE_WIDTH: 0.533038
G1 X101.372 Y75.448 E.00206
; LINE_WIDTH: 0.493185
G1 X101.493 Y75.428 E.0019
; LINE_WIDTH: 0.453331
G1 X101.613 Y75.408 E.00174
; LINE_WIDTH: 0.413478
G1 X101.887 Y75.445 E.00357
; LINE_WIDTH: 0.412328
G1 X102.291 Y75.614 E.00564
; LINE_WIDTH: 0.414178
G1 X102.577 Y75.863 E.00491
G1 X102.773 Y76.161 E.00461
; LINE_WIDTH: 0.409538
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
G1 X102.895 Y103.276 E.033
; LINE_WIDTH: 0.413698
G1 X102.857 Y103.585 E.00402
G1 X102.667 Y104.023 E.00617
; LINE_WIDTH: 0.405608
G1 X102.467 Y104.222 E.00357
; WIPE_START
G1 F12000
M204 S6000
G1 X102.327 Y104.361 E-.07512
G1 X101.897 Y104.555 E-.1792
G1 X101.6 Y104.59 E-.11384
G1 X101.483 Y104.571 E-.04478
G1 X101.367 Y104.552 E-.04477
G1 X101.251 Y104.533 E-.04477
G1 X100.573 Y104.533 E-.25752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.387 Y98.151 Z5.62 F42000
G1 X85.211 Y81.112 Z5.62
G1 Z5.22
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1941
M204 S5000
G1 X85.127 Y80.945 E.00207
G2 X83.632 Y78.136 I-339.309 J178.7 E.03527
G1 X83.6 Y78.096 E.00056
G1 X83.567 Y78.057 E.00056
G1 X83.519 Y78.072 E.00056
G1 X83.47 Y78.086 E.00056
G1 X82.29 Y78.709 E.01479
; LINE_WIDTH: 0.379458
G1 X82.265 Y78.74 E.00046
; LINE_WIDTH: 0.411118
G1 X82.23 Y78.783 E.00072
; LINE_WIDTH: 0.442778
G1 X82.195 Y78.827 E.00077
; LINE_WIDTH: 0.474433
G1 X82.16 Y78.87 E.00083
; LINE_WIDTH: 0.506088
G3 X82.069 Y78.918 I-.068 J-.019 E.00183
; LINE_WIDTH: 0.474428
G1 X82.014 Y78.923 E.00083
; LINE_WIDTH: 0.442768
G1 X81.958 Y78.928 E.00077
; LINE_WIDTH: 0.411108
G1 X81.902 Y78.933 E.00072
; LINE_WIDTH: 0.379448
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
; LINE_WIDTH: 0.388568
G1 X81.024 Y80.558 E.00199
; LINE_WIDTH: 0.433288
G1 X80.71 Y80.75 E.00498
G1 X80.765 Y81.103 E.00484
; LINE_WIDTH: 0.398228
G1 X80.687 Y81.381 E.00359
; LINE_WIDTH: 0.397988
G1 X80.443 Y81.646 E.00447
; LINE_WIDTH: 0.389308
G1 X80.188 Y81.747 E.00332
G1 X79.914 Y81.737 E.00332
; LINE_WIDTH: 0.384988
G1 X79.666 Y81.624 E.00327
; LINE_WIDTH: 0.389428
G1 X79.478 Y81.424 E.00333
; LINE_WIDTH: 0.391228
G1 X79.384 Y81.166 E.00335
; LINE_WIDTH: 0.392688
G1 X79.404 Y80.879 E.00353
; LINE_WIDTH: 0.392968
G1 X79.588 Y80.566 E.00443
G1 X79.819 Y80.42 E.00336
; LINE_WIDTH: 0.392348
G1 X80.09 Y80.372 E.00336
G1 X80.358 Y80.434 E.00336
; LINE_WIDTH: 0.411568
G1 X80.632 Y80.654 E.00452
; LINE_WIDTH: 0.451848
G1 X80.706 Y80.727 E.00147
G1 X80.865 Y80.642 E.00255
; LINE_WIDTH: 0.420208
G1 X81.024 Y80.558 E.00236
; LINE_WIDTH: 0.388568
G1 X81.137 Y80.677 E.00199
; LINE_WIDTH: 0.357168
G1 X81.529 Y81.414 E.00925
G1 X81.92 Y82.15 E.00925
G2 X82.13 Y82.537 I9.541 J-4.907 E.00488
G1 X82.221 Y82.702 E.00209
; WIPE_START
G1 F9900
M204 S6000
G1 X82.13 Y82.537 E-.07158
G1 X81.92 Y82.15 E-.16716
G1 X81.529 Y81.414 E-.31706
G1 X81.276 Y80.939 E-.2042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.644 Y81.771 Z5.62 F42000
G1 Z5.22
G1 E.8 F1800
; LINE_WIDTH: 0.620728
G1 F1941
M204 S5000
G1 X83.616 Y81.718 E.00119
; LINE_WIDTH: 0.580488
G1 X83.588 Y81.665 E.00111
; LINE_WIDTH: 0.540248
G1 X83.559 Y81.611 E.00103
; LINE_WIDTH: 0.500028
G1 X82.143 Y78.948 E.04749
; LINE_WIDTH: 0.506088
G1 X82.125 Y78.914 E.00061
; WIPE_START
G1 F12000
M204 S6000
G1 X82.143 Y78.948 E-.01459
G1 X83.064 Y80.68 E-.74541
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.254 Y88.219 Z5.62 F42000
G1 X84.654 Y90.754 Z5.62
G1 Z5.22
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1941
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.62 F42000
G1 Z5.22
G1 E.8 F1800
G1 F1941
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
G3 Z5.62 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.3
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 65/100
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z5.3
G1 E.8 F1800
; LINE_WIDTH: 0.497518
G1 F1933
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.407998
G1 X78.365 Y104.203 E.09482
G1 X78.057 Y104.132 E.00403
G1 X77.734 Y103.906 E.00502
; LINE_WIDTH: 0.408018
G1 X77.543 Y103.572 E.0049
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.283 E.00373
G1 X77.496 Y76.725 E.33884
G1 X77.551 Y76.403 E.00417
; LINE_WIDTH: 0.410608
G1 X77.751 Y76.079 E.00489
G1 X78.01 Y75.89 E.00411
; LINE_WIDTH: 0.410268
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.409758
G1 X82.42 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.42 Y75.796 E.02556
; LINE_WIDTH: 0.408748
G1 X85.808 Y75.796 E.01773
; LINE_WIDTH: 0.450071
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491735
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533398
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X90.251 Y75.983 E.07044
; LINE_WIDTH: 0.533288
G1 X94.251 Y75.983 E.06729
; LINE_WIDTH: 0.533188
G1 X98.251 Y75.983 E.06728
; LINE_WIDTH: 0.533088
G1 X101.251 Y75.983 E.05046
G1 X101.39 Y76.019 E.00241
G1 X101.434 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489055
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.445091
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.407368
G1 X102.148 Y75.987 E.00575
G1 X102.424 Y76.33 E.00559
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00482
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
G1 X102.078 Y104.064 E.00548
; LINE_WIDTH: 0.403658
G1 X101.71 Y104.198 E.00494
; LINE_WIDTH: 0.446961
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490265
G1 X101.549 Y104.157 E.00128
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05423
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.65269
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.412 Y104.271 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; LINE_WIDTH: 0.407248
G1 F1933
M204 S5000
G1 X102.285 Y104.39 E.00222
; LINE_WIDTH: 0.408008
G1 X101.888 Y104.558 E.00549
; LINE_WIDTH: 0.417908
G1 X101.6 Y104.59 E.00379
; LINE_WIDTH: 0.456461
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495015
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00198
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.048 Y104.537 E.00411
; LINE_WIDTH: 0.415268
G1 X77.709 Y104.387 E.0048
G1 X77.399 Y104.118 E.00532
; LINE_WIDTH: 0.411568
G1 X77.182 Y103.711 E.00594
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.291 E.00544
G1 X77.104 Y76.725 E.33895
G1 X77.181 Y76.285 E.00569
; LINE_WIDTH: 0.403918
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.404568
M73 P69 R5
G1 X77.705 Y75.62 E.00539
; LINE_WIDTH: 0.410818
G1 X78.13 Y75.439 E.00592
G1 X78.41 Y75.405 E.00362
; LINE_WIDTH: 0.410268
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.409758
G1 X82.41 Y75.405 E.02559
; LINE_WIDTH: 0.409258
G1 X84.41 Y75.405 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.405 E.01785
; LINE_WIDTH: 0.450071
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491735
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533398
G1 X86.251 Y75.467 E.00251
G1 X90.251 Y75.467 E.06731
; LINE_WIDTH: 0.533288
G1 X94.251 Y75.467 E.06729
; LINE_WIDTH: 0.533188
G1 X98.251 Y75.468 E.06728
; LINE_WIDTH: 0.533088
G1 X101.251 Y75.468 E.05046
G1 X101.372 Y75.448 E.00206
; LINE_WIDTH: 0.493135
G1 X101.493 Y75.428 E.0019
; LINE_WIDTH: 0.453251
M73 P69 R4
G1 X101.614 Y75.408 E.00174
; LINE_WIDTH: 0.413368
G1 X101.887 Y75.445 E.00356
; LINE_WIDTH: 0.412278
G1 X102.291 Y75.614 E.00564
G1 X102.494 Y75.78 E.00338
; LINE_WIDTH: 0.406258
G1 X102.769 Y76.153 E.00588
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.0065
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
G1 X102.641 Y104.058 E.00506
; LINE_WIDTH: 0.407248
G1 X102.456 Y104.23 E.00321
; WIPE_START
G1 F12000
M204 S6000
G1 X102.285 Y104.39 E-.08904
G1 X101.888 Y104.558 E-.16374
G1 X101.6 Y104.59 E-.11025
G1 X101.483 Y104.571 E-.04479
G1 X101.367 Y104.552 E-.04479
G1 X101.251 Y104.533 E-.04479
G1 X100.56 Y104.533 E-.2626
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.376 Y98.149 Z5.7 F42000
G1 X85.211 Y81.112 Z5.7
G1 Z5.3
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1933
M204 S5000
G1 X85.127 Y80.945 E.00207
G2 X83.632 Y78.136 I-338.947 J178.505 E.03527
G1 X83.6 Y78.096 E.00056
G1 X83.567 Y78.057 E.00056
G1 X83.519 Y78.072 E.00056
G1 X83.47 Y78.086 E.00056
G1 X82.29 Y78.709 E.01479
; LINE_WIDTH: 0.379478
G1 X82.265 Y78.74 E.00046
; LINE_WIDTH: 0.411128
G1 X82.23 Y78.783 E.00072
; LINE_WIDTH: 0.442778
G1 X82.195 Y78.827 E.00077
; LINE_WIDTH: 0.474423
G1 X82.16 Y78.87 E.00083
; LINE_WIDTH: 0.506068
G3 X82.069 Y78.918 I-.068 J-.019 E.00183
; LINE_WIDTH: 0.474413
G1 X82.014 Y78.923 E.00083
; LINE_WIDTH: 0.442758
G1 X81.958 Y78.928 E.00077
; LINE_WIDTH: 0.411108
G1 X81.902 Y78.933 E.00072
; LINE_WIDTH: 0.379458
G1 X81.863 Y78.936 E.00046
; LINE_WIDTH: 0.357168
G1 X80.686 Y79.566 E.01479
G1 X80.647 Y79.598 E.00056
G1 X80.608 Y79.631 E.00056
G1 X80.622 Y79.68 E.00056
G1 X80.637 Y79.728 E.00056
G1 X80.988 Y80.397 E.00838
; LINE_WIDTH: 0.361868
G1 X80.994 Y80.421 E.00028
; LINE_WIDTH: 0.375228
G1 X81.009 Y80.49 E.00082
; LINE_WIDTH: 0.388588
G1 X81.024 Y80.558 E.00085
; LINE_WIDTH: 0.420258
G1 X80.865 Y80.642 E.00236
; LINE_WIDTH: 0.451928
G1 X80.706 Y80.727 E.00255
G1 X80.391 Y80.449 E.00595
; LINE_WIDTH: 0.404108
G1 X80.12 Y80.372 E.00356
; LINE_WIDTH: 0.402928
G1 X79.819 Y80.419 E.00382
; LINE_WIDTH: 0.391248
G1 X79.563 Y80.595 E.00379
; LINE_WIDTH: 0.395068
G1 X79.403 Y80.878 E.00401
; LINE_WIDTH: 0.399208
G1 X79.38 Y81.166 E.00359
G1 X79.474 Y81.426 E.00344
; LINE_WIDTH: 0.398288
G1 X79.662 Y81.628 E.00343
; LINE_WIDTH: 0.394888
G1 X79.956 Y81.748 E.00391
; LINE_WIDTH: 0.390388
G1 X80.275 Y81.724 E.00389
; LINE_WIDTH: 0.394168
G1 X80.527 Y81.587 E.00353
; LINE_WIDTH: 0.399248
G1 X80.697 Y81.37 E.00343
G1 X80.765 Y81.103 E.00344
; LINE_WIDTH: 0.433008
G1 X80.711 Y80.75 E.00483
G1 X81.024 Y80.558 E.00498
; LINE_WIDTH: 0.388588
G1 X81.072 Y80.609 E.00085
; LINE_WIDTH: 0.375218
G1 X81.12 Y80.659 E.00082
; LINE_WIDTH: 0.361858
G1 X81.137 Y80.677 E.00028
; LINE_WIDTH: 0.357168
G2 X82.13 Y82.538 I45.802 J-23.242 E.02338
G1 X82.221 Y82.702 E.00208
; WIPE_START
G1 F9900
M204 S6000
G1 X82.13 Y82.538 E-.07119
G1 X81.277 Y80.939 E-.68881
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.644 Y81.771 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
; LINE_WIDTH: 0.620708
G1 F1933
M204 S5000
G1 X83.616 Y81.718 E.00119
; LINE_WIDTH: 0.580468
G1 X83.588 Y81.665 E.00111
; LINE_WIDTH: 0.540228
G1 X83.559 Y81.611 E.00103
; LINE_WIDTH: 0.500008
G1 X82.143 Y78.948 E.04748
; LINE_WIDTH: 0.506068
G1 X82.125 Y78.914 E.00061
; WIPE_START
G1 F12000
M204 S6000
G1 X82.143 Y78.948 E-.01459
G1 X83.064 Y80.68 E-.74541
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.254 Y88.219 Z5.7 F42000
G1 X84.654 Y90.754 Z5.7
G1 Z5.3
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1933
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.7 F42000
G1 Z5.3
G1 E.8 F1800
G1 F1933
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
G3 Z5.7 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.38
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 66/100
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z5.38
G1 E.8 F1800
; LINE_WIDTH: 0.497518
G1 F1897
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.017 E.00235
G1 X86.065 Y104.017 E.25563
G1 X86.03 Y104.142 E.00218
G1 X85.956 Y104.163 E.00129
; LINE_WIDTH: 0.491921
G1 X85.882 Y104.183 E.00119
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.204 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04322
G1 X78.035 Y104.121 E.00508
; LINE_WIDTH: 0.407388
G1 X77.734 Y103.906 E.00471
G1 X77.542 Y103.572 E.0049
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00376
G1 X77.496 Y76.724 E.33881
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.411278
G1 X77.751 Y76.079 E.0049
G1 X78.01 Y75.89 E.00411
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410268
G1 X80.425 Y75.798 E.02684
; LINE_WIDTH: 0.409758
G1 X82.425 Y75.797 E.02559
; LINE_WIDTH: 0.409258
G1 X84.425 Y75.796 E.02556
; LINE_WIDTH: 0.408748
G1 X85.808 Y75.796 E.01766
; LINE_WIDTH: 0.450068
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491728
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533388
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X92.251 Y75.983 E.10409
; LINE_WIDTH: 0.533238
G1 X96.251 Y75.983 E.06729
; LINE_WIDTH: 0.533138
G1 X100.251 Y75.983 E.06727
; LINE_WIDTH: 0.533038
G1 X101.251 Y75.984 E.01682
G1 X101.39 Y76.019 E.00241
G1 X101.434 Y76.089 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489071
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.445125
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.408088
G1 X102.137 Y75.977 E.00558
G1 X102.422 Y76.326 E.00574
; LINE_WIDTH: 0.407688
G1 X102.504 Y76.7 E.00488
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
G1 X102.078 Y104.064 E.00548
; LINE_WIDTH: 0.403678
G1 X101.71 Y104.198 E.00493
; LINE_WIDTH: 0.446981
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490285
G1 X101.55 Y104.157 E.00128
; LINE_WIDTH: 0.533588
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493428
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05421
G1 X101.251 Y104.017 E-.05309
G1 X99.533 Y104.017 E-.6527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.406 Y104.277 Z5.78 F42000
G1 Z5.38
G1 E.8 F1800
; LINE_WIDTH: 0.407258
G1 F1897
M204 S5000
G1 X102.285 Y104.39 E.00211
; LINE_WIDTH: 0.408038
G1 X101.888 Y104.558 E.00549
; LINE_WIDTH: 0.417998
G1 X101.599 Y104.59 E.00379
; LINE_WIDTH: 0.456528
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495058
G1 X101.367 Y104.552 E.00183
; LINE_WIDTH: 0.533588
G1 X101.251 Y104.533 E.00198
G1 X86.251 Y104.533 E.25249
G1 X86.104 Y104.554 E.00251
; LINE_WIDTH: 0.491921
G1 X85.956 Y104.575 E.0023
; LINE_WIDTH: 0.450255
G1 X85.809 Y104.596 E.0021
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04322
; LINE_WIDTH: 0.411278
G1 X78.115 Y104.558 E.004
; LINE_WIDTH: 0.413518
G1 X77.763 Y104.419 E.00488
G1 X77.441 Y104.169 E.00526
; LINE_WIDTH: 0.407648
G1 X77.183 Y103.72 E.00659
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00558
G1 X77.104 Y76.724 E.33894
G1 X77.188 Y76.273 E.00585
; LINE_WIDTH: 0.403088
G1 X77.396 Y75.894 E.00543
; LINE_WIDTH: 0.408218
G1 X77.697 Y75.619 E.00521
; LINE_WIDTH: 0.412818
G1 X78.064 Y75.457 E.00516
G1 X78.413 Y75.405 E.00455
; LINE_WIDTH: 0.410268
G1 X80.413 Y75.405 E.02563
; LINE_WIDTH: 0.409758
G1 X82.413 Y75.405 E.02559
; LINE_WIDTH: 0.409258
G1 X84.413 Y75.405 E.02556
; LINE_WIDTH: 0.408758
G1 X85.808 Y75.405 E.01782
; LINE_WIDTH: 0.450068
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491728
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533388
G1 X86.251 Y75.467 E.00251
G1 X92.251 Y75.467 E.10096
; LINE_WIDTH: 0.533238
G1 X96.251 Y75.467 E.06729
; LINE_WIDTH: 0.533138
G1 X100.251 Y75.468 E.06727
; LINE_WIDTH: 0.533038
G1 X101.251 Y75.468 E.01682
M73 P70 R4
G1 X101.372 Y75.448 E.00206
; LINE_WIDTH: 0.493121
G1 X101.494 Y75.428 E.0019
; LINE_WIDTH: 0.453225
G1 X101.615 Y75.408 E.00174
; LINE_WIDTH: 0.413328
G1 X101.887 Y75.445 E.00354
; LINE_WIDTH: 0.410828
G1 X102.292 Y75.613 E.00563
; LINE_WIDTH: 0.414988
G1 X102.577 Y75.863 E.00491
G1 X102.769 Y76.153 E.00452
; LINE_WIDTH: 0.409548
G1 X102.893 Y76.646 E.0065
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
; LINE_WIDTH: 0.415168
G1 X102.82 Y103.711 E.00497
G1 X102.641 Y104.058 E.00506
; LINE_WIDTH: 0.407258
G1 X102.45 Y104.236 E.00333
; WIPE_START
G1 F12000
M204 S6000
G1 X102.285 Y104.39 E-.08573
G1 X101.888 Y104.558 E-.16364
G1 X101.599 Y104.59 E-.11036
G1 X101.483 Y104.571 E-.04473
G1 X101.367 Y104.552 E-.04473
G1 X101.251 Y104.533 E-.04473
G1 X100.551 Y104.533 E-.26609
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.369 Y98.148 Z5.78 F42000
G1 X85.211 Y81.112 Z5.78
G1 Z5.38
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1897
M204 S5000
G1 X85.127 Y80.945 E.00207
G2 X84 Y78.819 I-99.889 J51.59 E.02667
; WIPE_START
G1 F7800
M204 S6000
G1 X84.937 Y80.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z5.78 F42000
G1 Z5.38
G1 E.8 F1800
; LINE_WIDTH: 0.500138
G1 F1897
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
G1 X82.221 Y82.702 Z5.78 F42000
G1 Z5.38
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1897
M204 S5000
G1 X82.13 Y82.538 E.00207
G3 X81.137 Y80.677 I44.561 J-24.97 E.02338
; LINE_WIDTH: 0.361908
G1 X81.12 Y80.659 E.00028
; LINE_WIDTH: 0.375238
G1 X81.072 Y80.608 E.00081
; LINE_WIDTH: 0.388568
G1 X81.024 Y80.558 E.00084
; LINE_WIDTH: 0.420228
G1 X80.865 Y80.642 E.00236
; LINE_WIDTH: 0.451888
G1 X80.706 Y80.727 E.00255
G1 X80.392 Y80.449 E.00594
; LINE_WIDTH: 0.404108
G1 X80.104 Y80.37 E.00377
; LINE_WIDTH: 0.401528
G1 X79.819 Y80.418 E.00363
; LINE_WIDTH: 0.395888
G1 X79.586 Y80.565 E.0034
; LINE_WIDTH: 0.404368
G1 X79.443 Y80.763 E.00308
G1 X79.376 Y81.062 E.00387
; LINE_WIDTH: 0.395848
G1 X79.428 Y81.332 E.0034
G1 X79.661 Y81.621 E.00458
; LINE_WIDTH: 0.391988
G1 X79.914 Y81.74 E.00342
; LINE_WIDTH: 0.391008
G1 X80.188 Y81.747 E.00334
; LINE_WIDTH: 0.389388
G1 X80.443 Y81.646 E.00332
; LINE_WIDTH: 0.384988
G1 X80.639 Y81.455 E.00328
; LINE_WIDTH: 0.399388
G1 X80.763 Y81.117 E.00449
; LINE_WIDTH: 0.425638
G1 X80.734 Y80.922 E.00262
; LINE_WIDTH: 0.451888
G1 X80.706 Y80.727 E.00279
; WIPE_START
G1 F12000
M204 S6000
G1 X80.734 Y80.922 E-.07489
G1 X80.763 Y81.117 E-.07489
G1 X80.639 Y81.455 E-.13692
G1 X80.443 Y81.646 E-.10396
G1 X80.188 Y81.747 E-.10399
G1 X79.914 Y81.74 E-.10406
G1 X79.661 Y81.621 E-.10647
G1 X79.57 Y81.509 E-.05482
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.248 Y88.197 Z5.78 F42000
G1 X84.654 Y90.754 Z5.78
G1 Z5.38
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1897
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.78 F42000
G1 Z5.38
G1 E.8 F1800
G1 F1897
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
G3 Z5.78 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.46
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 67/100
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 15
G1 X101.473 Y103.796 F42000
G1 Z5.46
G1 E.8 F1800
; LINE_WIDTH: 0.497518
G1 F1899
M204 S5000
G1 X101.381 Y103.965 E.00302
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.017 E.00235
G1 X97.251 Y104.017 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.017 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.017 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.016 E.05045
; LINE_WIDTH: 0.532988
G1 X86.064 Y104.016 E.00313
G1 X86.03 Y104.141 E.00218
G1 X85.956 Y104.162 E.00129
; LINE_WIDTH: 0.491318
G1 X85.882 Y104.183 E.00118
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.204 E.00108
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.203 E.09482
G1 X78.021 Y104.116 E.00452
; LINE_WIDTH: 0.407368
G1 X77.734 Y103.905 E.00453
G1 X77.542 Y103.572 E.0049
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00377
G1 X77.496 Y76.724 E.33881
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.403848
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.407298
G1 X78.01 Y75.888 E.00447
; LINE_WIDTH: 0.410268
G1 X78.415 Y75.798 E.00532
G1 X80.415 Y75.798 E.02563
; LINE_WIDTH: 0.409758
G1 X82.415 Y75.797 E.02559
; LINE_WIDTH: 0.409248
G1 X84.415 Y75.796 E.02556
; LINE_WIDTH: 0.408748
G1 X85.808 Y75.796 E.01779
; LINE_WIDTH: 0.450061
G1 X85.882 Y75.817 E.00108
; LINE_WIDTH: 0.491725
G1 X85.956 Y75.837 E.00119
; LINE_WIDTH: 0.533388
G1 X86.03 Y75.858 E.00129
G1 X86.064 Y75.983 E.00218
G1 X90.251 Y75.983 E.07044
; LINE_WIDTH: 0.533278
G1 X94.251 Y75.983 E.06729
; LINE_WIDTH: 0.533178
G1 X98.251 Y75.983 E.06728
; LINE_WIDTH: 0.533068
G1 X101.251 Y75.984 E.05045
G1 X101.39 Y76.019 E.00241
G1 X101.434 Y76.09 E.00139
G1 X101.471 Y75.86 E.00391
G1 X101.559 Y75.842 E.0015
; LINE_WIDTH: 0.489061
G1 X101.646 Y75.825 E.00137
; LINE_WIDTH: 0.445125
G1 X101.733 Y75.807 E.00124
; LINE_WIDTH: 0.407408
G1 X102.148 Y75.986 E.00574
G1 X102.424 Y76.33 E.00561
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.00481
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
; LINE_WIDTH: 0.413848
G1 X102.471 Y103.5 E.00292
G1 X102.345 Y103.8 E.00421
; LINE_WIDTH: 0.406138
G1 X102.042 Y104.084 E.00527
G1 X101.71 Y104.198 E.00444
; LINE_WIDTH: 0.446968
G1 X101.63 Y104.178 E.00116
; LINE_WIDTH: 0.490268
G1 X101.55 Y104.157 E.00128
; LINE_WIDTH: 0.533568
G1 X101.469 Y104.137 E.0014
G1 X101.471 Y103.967 E.00287
; LINE_WIDTH: 0.493418
G1 X101.473 Y103.856 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X101.381 Y103.965 E-.05422
G1 X101.251 Y104.017 E-.05308
G1 X99.533 Y104.017 E-.6527
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.396 Y104.301 Z5.86 F42000
G1 Z5.46
G1 E.8 F1800
; LINE_WIDTH: 0.415218
G1 F1899
M204 S5000
G1 X102.294 Y104.38 E.00167
; LINE_WIDTH: 0.408008
G1 X101.888 Y104.558 E.00565
; LINE_WIDTH: 0.417918
G1 X101.6 Y104.59 E.00379
; LINE_WIDTH: 0.456468
G1 X101.483 Y104.571 E.00169
; LINE_WIDTH: 0.495018
G1 X101.367 Y104.552 E.00184
; LINE_WIDTH: 0.533568
G1 X101.251 Y104.533 E.00198
G1 X97.251 Y104.533 E.06733
; LINE_WIDTH: 0.533408
G1 X93.251 Y104.533 E.06731
; LINE_WIDTH: 0.533258
G1 X89.251 Y104.532 E.06729
; LINE_WIDTH: 0.533098
G1 X86.251 Y104.532 E.05045
; LINE_WIDTH: 0.532988
G1 X86.103 Y104.553 E.0025
; LINE_WIDTH: 0.491318
G1 X85.956 Y104.574 E.0023
; LINE_WIDTH: 0.449648
G1 X85.809 Y104.595 E.0021
; LINE_WIDTH: 0.408008
G1 X78.365 Y104.594 E.09482
G1 X78.005 Y104.527 E.00467
; LINE_WIDTH: 0.407378
G1 X77.826 Y104.451 E.00248
; LINE_WIDTH: 0.407808
G1 X77.443 Y104.171 E.00604
G1 X77.183 Y103.72 E.00662
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00558
G1 X77.104 Y77.29 E.33172
G3 X77.141 Y76.413 I3.736 J-.283 E.01123
; LINE_WIDTH: 0.412818
G1 X77.27 Y76.084 E.00456
G1 X77.457 Y75.831 E.00406
; LINE_WIDTH: 0.403538
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.407318
G1 X78.161 Y75.435 E.00566
; LINE_WIDTH: 0.410268
G1 X78.407 Y75.405 E.00318
G1 X80.407 Y75.405 E.02563
; LINE_WIDTH: 0.409758
G1 X82.407 Y75.405 E.02559
; LINE_WIDTH: 0.409248
G1 X84.407 Y75.405 E.02556
; LINE_WIDTH: 0.408748
G1 X85.808 Y75.405 E.01788
; LINE_WIDTH: 0.450061
G1 X85.956 Y75.425 E.0021
; LINE_WIDTH: 0.491725
G1 X86.103 Y75.446 E.0023
; LINE_WIDTH: 0.533388
G1 X86.251 Y75.467 E.00251
G1 X90.251 Y75.467 E.0673
; LINE_WIDTH: 0.533278
G1 X94.251 Y75.467 E.06729
; LINE_WIDTH: 0.533178
G1 X98.251 Y75.468 E.06728
; LINE_WIDTH: 0.533068
G1 X101.251 Y75.468 E.05045
G1 X101.373 Y75.448 E.00207
; LINE_WIDTH: 0.493075
G1 X101.494 Y75.428 E.00191
; LINE_WIDTH: 0.453151
G1 X101.615 Y75.408 E.00175
; LINE_WIDTH: 0.413228
G1 X101.887 Y75.445 E.00354
; LINE_WIDTH: 0.412208
G1 X102.291 Y75.613 E.00564
G1 X102.494 Y75.78 E.00337
; LINE_WIDTH: 0.406198
G1 X102.769 Y76.153 E.00588
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
M73 P71 R4
G1 X102.895 Y100.7 E.02561
; LINE_WIDTH: 0.410218
G1 X102.895 Y102.7 E.02562
G3 X102.88 Y103.441 I-4.02 J.288 E.0095
; LINE_WIDTH: 0.406008
G1 X102.757 Y103.86 E.00554
; LINE_WIDTH: 0.415218
G1 X102.485 Y104.233 E.00599
G1 X102.444 Y104.264 E.00067
; WIPE_START
G1 F12000
M204 S6000
G1 X102.294 Y104.38 E-.07181
G1 X101.888 Y104.558 E-.16857
G1 X101.6 Y104.59 E-.11014
G1 X101.483 Y104.571 E-.04479
G1 X101.367 Y104.552 E-.04479
G1 X101.251 Y104.533 E-.04479
G1 X100.527 Y104.533 E-.27512
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.35 Y98.145 Z5.86 F42000
G1 X85.211 Y81.112 Z5.86
G1 Z5.46
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1899
M204 S5000
G1 X85.127 Y80.945 E.00207
G2 X84 Y78.819 I-99.618 J51.446 E.02667
; WIPE_START
G1 F7800
M204 S6000
G1 X84.937 Y80.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z5.86 F42000
G1 Z5.46
G1 E.8 F1800
; LINE_WIDTH: 0.500138
G1 F1899
M204 S5000
G1 X82.63 Y79.864 E.00283
; LINE_WIDTH: 0.501848
G1 X83.569 Y81.63 E.0316
; LINE_WIDTH: 0.541475
G1 X83.594 Y81.677 E.00091
; LINE_WIDTH: 0.581101
G1 X83.619 Y81.724 E.00098
; LINE_WIDTH: 0.620728
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
G1 X82.221 Y82.702 Z5.86 F42000
G1 Z5.46
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1899
M204 S5000
G1 X82.13 Y82.539 E.00207
G3 X81.137 Y80.677 I44.623 J-25.004 E.02339
; LINE_WIDTH: 0.361898
G1 X81.12 Y80.659 E.00028
; LINE_WIDTH: 0.375258
G1 X81.072 Y80.609 E.00082
; LINE_WIDTH: 0.388608
G1 X81.024 Y80.558 E.00085
; LINE_WIDTH: 0.420238
G1 X80.865 Y80.642 E.00236
; LINE_WIDTH: 0.451868
G1 X80.706 Y80.727 E.00255
G1 X80.391 Y80.449 E.00595
; LINE_WIDTH: 0.404128
G1 X80.11 Y80.369 E.00369
; LINE_WIDTH: 0.403928
G1 X79.818 Y80.415 E.00372
; LINE_WIDTH: 0.400028
G1 X79.522 Y80.64 E.00464
; LINE_WIDTH: 0.404168
G1 X79.405 Y80.86 E.00315
G1 X79.384 Y81.166 E.00387
; LINE_WIDTH: 0.395888
G1 X79.475 Y81.425 E.00339
G1 X79.663 Y81.626 E.0034
; LINE_WIDTH: 0.399208
G1 X79.912 Y81.744 E.00342
; LINE_WIDTH: 0.403448
G1 X80.154 Y81.755 E.00305
G1 X80.445 Y81.651 E.00389
; LINE_WIDTH: 0.396488
G1 X80.686 Y81.381 E.00448
; LINE_WIDTH: 0.399208
G1 X80.766 Y81.103 E.0036
; LINE_WIDTH: 0.425538
G1 X80.736 Y80.915 E.00254
; LINE_WIDTH: 0.451868
G1 X80.706 Y80.727 E.0027
; WIPE_START
G1 F12000
M204 S6000
G1 X80.736 Y80.915 E-.07238
G1 X80.766 Y81.103 E-.07237
G1 X80.686 Y81.381 E-.10974
G1 X80.445 Y81.651 E-.13774
G1 X80.154 Y81.755 E-.11738
G1 X79.912 Y81.744 E-.09214
G1 X79.663 Y81.626 E-.10451
G1 X79.567 Y81.523 E-.05374
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.251 Y88.207 Z5.86 F42000
G1 X84.654 Y90.754 Z5.86
G1 Z5.46
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F1899
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.86 F42000
G1 Z5.46
G1 E.8 F1800
G1 F1899
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
G3 Z5.86 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.54
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 68/100
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 15
G1 X101.49 Y103.76 F42000
G1 Z5.54
G1 E.8 F1800
; LINE_WIDTH: 0.419998
G1 F2629
M204 S5000
G1 X101.318 Y103.76 E.00226
G1 X101.145 Y103.76 E.00226
G1 X100.973 Y103.76 E.00226
G1 X100.801 Y103.76 E.00226
G1 X100.628 Y103.76 E.00226
G1 X100.456 Y103.76 E.00226
G1 X100.283 Y103.76 E.00226
G1 X100.111 Y103.76 E.00226
G1 F1800
G1 X99.939 Y103.76 E.00226
G1 F1500
G1 X99.766 Y103.76 E.00226
G1 F1200
G1 X99.594 Y103.76 E.00226
G1 F900
G1 X86.01 Y103.76 E.17836
G1 X86.01 Y103.776 E.00021
G1 F1200
G1 X86.009 Y103.802 E.00034
G1 F1500
G1 X86.008 Y103.828 E.00034
G1 F1800
G1 X86.008 Y103.854 E.00034
G1 F1956.817
G1 X86.007 Y103.88 E.00034
G1 F2120.181
G1 X86.006 Y103.906 E.00034
G1 F2290.095
G1 X86.006 Y103.932 E.00034
G1 F2466.556
G1 X86.005 Y103.959 E.00034
G1 F2629
G1 X86.004 Y103.985 E.00034
G1 X86.004 Y104.011 E.00034
G1 X86.003 Y104.037 E.00034
G1 X86.003 Y104.063 E.00034
G1 X85.809 Y104.204 E.00315
; LINE_WIDTH: 0.408698
G1 X85.409 Y104.204 E.0051
G1 X85.009 Y104.204 E.0051
G1 X83.809 Y104.204 E.01531
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.204 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.204 E.04321
G1 X78.145 Y104.162 E.00361
; LINE_WIDTH: 0.405938
G1 X77.834 Y104 E.00445
G1 X77.608 Y103.725 E.0045
; LINE_WIDTH: 0.404868
G1 X77.501 Y103.37 E.0047
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.275 E.02684
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.275 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.275 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y95.275 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.275 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.275 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.275 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.275 E.02557
; LINE_WIDTH: 0.409268
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
G3 X77.496 Y76.7 I9.5 J-.277 E.00734
; LINE_WIDTH: 0.407108
G1 X77.584 Y76.321 E.00494
; LINE_WIDTH: 0.407348
G1 X77.791 Y76.037 E.00447
G1 X78.091 Y75.855 E.00447
; LINE_WIDTH: 0.408578
G1 X78.419 Y75.796 E.00426
G1 X82.419 Y75.796 E.05103
; LINE_WIDTH: 0.408478
G1 X85.809 Y75.796 E.04323
; LINE_WIDTH: 0.419998
G1 X86.003 Y75.937 E.00315
G1 X86.003 Y75.963 E.00034
G1 X86.004 Y75.989 E.00034
G1 X86.004 Y76.015 E.00034
G1 F2458.718
G1 X86.005 Y76.042 E.00034
G1 F2282.542
G1 X86.006 Y76.068 E.00034
G1 F2112.915
G1 X86.006 Y76.094 E.00034
G1 F1949.898
G1 X86.007 Y76.12 E.00034
G1 F1793.365
G1 X86.008 Y76.146 E.00034
G1 F1643.381
G1 X86.008 Y76.172 E.00034
G1 F1500
G1 X86.009 Y76.198 E.00034
G1 F1200
G1 X86.01 Y76.224 E.00034
G1 F900
G1 X86.01 Y76.24 E.00021
G1 X100.087 Y76.24 E.18483
G1 F1200
G1 X100.214 Y76.24 E.00167
G1 F1500
G1 X100.342 Y76.24 E.00167
G1 F1800
G1 X100.47 Y76.24 E.00167
G1 F2628
G1 X100.597 Y76.24 E.00167
G1 F2629
G1 X100.725 Y76.24 E.00167
G1 X100.852 Y76.24 E.00167
G1 X100.98 Y76.24 E.00167
G1 X101.107 Y76.24 E.00167
G1 X101.235 Y76.24 E.00167
G1 X101.362 Y76.24 E.00167
G1 X101.49 Y76.24 E.00167
G1 X101.498 Y75.939 E.00395
G1 X101.689 Y75.801 E.0031
; LINE_WIDTH: 0.403668
G1 X101.941 Y75.869 E.00329
; LINE_WIDTH: 0.407408
G1 X102.266 Y76.094 E.00502
G1 X102.457 Y76.428 E.0049
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
; LINE_WIDTH: 0.413708
G1 X102.471 Y103.498 E.00291
G1 X102.346 Y103.801 E.00423
; LINE_WIDTH: 0.405648
G1 X102.042 Y104.084 E.00526
G1 X101.709 Y104.198 E.00445
; LINE_WIDTH: 0.409918
G1 X101.637 Y104.195 E.00092
; LINE_WIDTH: 0.419998
G1 X101.498 Y104.061 E.00254
G1 X101.492 Y103.82 E.00317
; WIPE_START
G1 F12000
M204 S6000
G1 X101.318 Y103.76 E-.0699
G1 X101.145 Y103.76 E-.0655
G1 X100.973 Y103.76 E-.0655
G1 X100.801 Y103.76 E-.0655
G1 X100.628 Y103.76 E-.0655
G1 X100.456 Y103.76 E-.0655
G1 X100.283 Y103.76 E-.0655
G1 X100.111 Y103.76 E-.0655
G1 X99.939 Y103.76 E-.0655
G1 X99.766 Y103.76 E-.0655
G1 X99.594 Y103.76 E-.0655
G1 X99.502 Y103.76 E-.03511
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.369 Y104.316 Z5.94 F42000
G1 Z5.54
G1 E.8 F1800
; LINE_WIDTH: 0.415768
G1 F2629
M204 S5000
G1 X102.242 Y104.412 E.00207
; LINE_WIDTH: 0.406538
G1 X101.885 Y104.557 E.00488
; LINE_WIDTH: 0.409918
G1 X101.6 Y104.594 E.00369
; LINE_WIDTH: 0.419998
G2 X95.099 Y104.59 I-4.501 J1945.102 E.08536
G1 X87.099 Y104.59 E.10504
G2 X85.809 Y104.596 I-.348 J67.171 E.01694
; LINE_WIDTH: 0.408698
G1 X83.809 Y104.596 E.02552
; LINE_WIDTH: 0.408808
G1 X81.809 Y104.596 E.02553
; LINE_WIDTH: 0.408928
G1 X78.424 Y104.596 E.04321
G1 X78.063 Y104.546 E.00466
; LINE_WIDTH: 0.406818
G1 X77.622 Y104.326 E.00627
; LINE_WIDTH: 0.406168
G1 X77.351 Y104.045 E.00494
; LINE_WIDTH: 0.413728
G1 X77.157 Y103.636 E.00585
G1 X77.105 Y103.287 E.00456
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.287 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.287 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.287 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.287 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.287 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.287 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.287 E.02558
; LINE_WIDTH: 0.409388
G1 X77.105 Y87.287 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.287 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.287 E.02555
; LINE_WIDTH: 0.409008
G1 X77.104 Y81.287 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.287 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.287 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00718
; LINE_WIDTH: 0.413058
G3 X77.245 Y76.14 I1.329 J.01 E.00783
; LINE_WIDTH: 0.407658
G1 X77.531 Y75.741 E.00625
G1 X77.947 Y75.494 E.00615
; LINE_WIDTH: 0.408578
G1 X78.41 Y75.404 E.00602
G1 X82.41 Y75.404 E.05103
; LINE_WIDTH: 0.408478
G1 X85.809 Y75.405 E.04335
; LINE_WIDTH: 0.419998
G2 X94.402 Y75.411 I5.693 J-1922.516 E.11283
G1 X100.402 Y75.411 E.07878
G3 X101.784 Y75.426 I.347 J31.196 E.01815
; LINE_WIDTH: 0.403668
G1 X102.127 Y75.531 E.00451
; LINE_WIDTH: 0.403898
G1 X102.48 Y75.759 E.00529
; LINE_WIDTH: 0.410888
G1 X102.768 Y76.147 E.00621
G1 X102.893 Y76.646 E.0066
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
G3 X102.88 Y103.44 I-4.024 J.288 E.0095
; LINE_WIDTH: 0.404338
G1 X102.744 Y103.887 E.00589
; LINE_WIDTH: 0.415768
G1 X102.501 Y104.217 E.00532
G1 X102.417 Y104.28 E.00137
; WIPE_START
G1 F12000
M204 S6000
G1 X102.242 Y104.412 E-.08346
G1 X101.885 Y104.557 E-.14606
G1 X101.6 Y104.594 E-.10945
G1 X100.492 Y104.593 E-.42102
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.653 Y96.963 Z5.94 F42000
G1 X101.099 Y75.826 Z5.94
G1 Z5.54
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.443218
G1 F2629
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
G1 X86.402 Y75.825 E.02782
; WIPE_START
G1 F18000
G1 X88.402 Y75.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.522 Y82.791 Z5.94 F42000
G1 X101.099 Y104.175 Z5.94
G1 Z5.54
G1 E.8 F1800
; LINE_WIDTH: 0.444348
G1 F2629
M204 S6000
G1 X86.402 Y104.175 E.20463
; WIPE_START
G1 F18000
G1 X88.402 Y104.175 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.022 Y96.923 Z5.94 F42000
M73 P72 R4
G1 X80.706 Y80.727 Z5.94
G1 Z5.54
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.451828
G1 F2629
M204 S5000
G1 X80.736 Y80.914 E.00269
; LINE_WIDTH: 0.425538
G1 X80.766 Y81.102 E.00253
; LINE_WIDTH: 0.399248
G1 X80.69 Y81.373 E.00351
; LINE_WIDTH: 0.394368
G1 X80.466 Y81.632 E.0042
; LINE_WIDTH: 0.384988
G1 X80.188 Y81.745 E.0036
; LINE_WIDTH: 0.389388
G1 X79.914 Y81.739 E.00333
; LINE_WIDTH: 0.404368
G1 X79.636 Y81.609 E.00386
G1 X79.475 Y81.425 E.00309
; LINE_WIDTH: 0.395888
G1 X79.384 Y81.166 E.00339
; LINE_WIDTH: 0.406168
G1 X79.406 Y80.86 E.00388
G1 X79.587 Y80.566 E.00438
; LINE_WIDTH: 0.397428
G1 X79.819 Y80.416 E.00342
; LINE_WIDTH: 0.400928
G1 X80.112 Y80.371 E.00372
; LINE_WIDTH: 0.404068
G1 X80.392 Y80.449 E.00366
; LINE_WIDTH: 0.451828
G1 X80.706 Y80.727 E.00593
G1 X80.865 Y80.642 E.00255
; LINE_WIDTH: 0.420188
G1 X81.024 Y80.558 E.00236
; LINE_WIDTH: 0.388548
G1 X81.072 Y80.609 E.00085
; LINE_WIDTH: 0.375208
G1 X81.12 Y80.659 E.00082
; LINE_WIDTH: 0.361868
G1 X81.137 Y80.677 E.00028
; LINE_WIDTH: 0.357168
G2 X82.13 Y82.539 I45.61 J-23.138 E.02339
G1 X82.221 Y82.702 E.00207
; WIPE_START
G1 F9900
M204 S6000
G1 X82.13 Y82.539 E-.07096
G1 X81.277 Y80.939 E-.68904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.644 Y81.771 Z5.94 F42000
G1 Z5.54
G1 E.8 F1800
; LINE_WIDTH: 0.620708
G1 F2629
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
G1 X85.211 Y81.112 Z5.94 F42000
G1 Z5.54
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F2629
M204 S5000
G1 X85.127 Y80.945 E.00207
G2 X84 Y78.819 I-99.508 J51.388 E.02667
; WIPE_START
G1 F7800
M204 S6000
G1 X84.937 Y80.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.725 Y88.216 Z5.94 F42000
G1 X84.654 Y90.754 Z5.94
G1 Z5.54
G1 E.8 F1800
; LINE_WIDTH: 0.508588
G1 F2629
M204 S5000
G1 X85.146 Y90.754 E.00787
G1 X85.146 Y91 E.00394
G1 X85.146 Y92.246 E.01995
G1 X84.654 Y92.246 E.00787
G1 X84.654 Y90.814 E.02293
; WIPE_START
G1 F12000
M204 S6000
G1 X85.146 Y90.754 E-.18813
G1 X85.146 Y91 E-.09337
G1 X85.146 Y92.246 E-.47337
G1 X85.132 Y92.246 E-.00513
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y97.246 Z5.94 F42000
G1 Z5.54
G1 E.8 F1800
G1 F2629
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
G3 Z5.94 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.62
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 69/100
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; OBJECT_ID: 15
G1 X102.379 Y104.303 F42000
G1 Z5.62
G1 E.8 F1800
; LINE_WIDTH: 0.403558
G1 F1779
M204 S5000
G1 X102.264 Y104.399 E.00188
; LINE_WIDTH: 0.411598
G1 X101.871 Y104.562 E.00548
G1 X101.59 Y104.595 E.00364
; LINE_WIDTH: 0.410168
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.410028
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409888
G1 X95.59 Y104.595 E.0256
; LINE_WIDTH: 0.409758
G1 X93.59 Y104.595 E.02559
; LINE_WIDTH: 0.409618
G1 X91.59 Y104.595 E.02558
; LINE_WIDTH: 0.409478
G1 X89.59 Y104.595 E.02557
; LINE_WIDTH: 0.409348
G1 X87.59 Y104.595 E.02557
; LINE_WIDTH: 0.409208
G1 X85.59 Y104.595 E.02556
; LINE_WIDTH: 0.409068
G1 X83.59 Y104.596 E.02555
; LINE_WIDTH: 0.408938
G1 X81.59 Y104.596 E.02554
; LINE_WIDTH: 0.408798
G1 X79.59 Y104.596 E.02553
; LINE_WIDTH: 0.408658
G1 X78.424 Y104.596 E.01487
; LINE_WIDTH: 0.410718
G1 X78.115 Y104.558 E.004
; LINE_WIDTH: 0.414878
G1 X77.764 Y104.418 E.0049
G1 X77.441 Y104.169 E.00528
; LINE_WIDTH: 0.407638
G1 X77.183 Y103.72 E.00659
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00558
G1 X77.104 Y77.29 E.33172
G3 X77.141 Y76.414 I3.733 J-.283 E.01121
; LINE_WIDTH: 0.412568
G1 X77.281 Y76.063 E.00487
G1 X77.457 Y75.828 E.00378
; LINE_WIDTH: 0.404218
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.409998
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
; LINE_WIDTH: 0.409488
G1 X88.409 Y75.405 E.02558
; LINE_WIDTH: 0.409288
G1 X90.409 Y75.405 E.02556
; LINE_WIDTH: 0.409088
G1 X92.409 Y75.405 E.02555
; LINE_WIDTH: 0.408888
G1 X94.409 Y75.405 E.02554
; LINE_WIDTH: 0.408698
G1 X96.409 Y75.405 E.02552
; LINE_WIDTH: 0.408498
G1 X98.409 Y75.405 E.02551
; LINE_WIDTH: 0.408298
G1 X100.409 Y75.405 E.0255
; LINE_WIDTH: 0.408098
G1 X101.6 Y75.405 E.01517
; LINE_WIDTH: 0.407988
G1 X101.843 Y75.437 E.00312
; LINE_WIDTH: 0.408548
G1 X102.279 Y75.606 E.00597
; LINE_WIDTH: 0.413278
G1 X102.58 Y75.865 E.00512
G1 X102.768 Y76.145 E.00436
; LINE_WIDTH: 0.409848
G1 X102.894 Y76.646 E.00661
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
G1 X102.868 Y103.529 E.00325
; LINE_WIDTH: 0.412878
G1 X102.719 Y103.937 E.00561
G1 X102.556 Y104.156 E.00352
; LINE_WIDTH: 0.403558
G1 X102.425 Y104.265 E.00214
M204 S250
G1 X101.844 Y104.151 F42000
; LINE_WIDTH: 0.409308
G1 F1779
M204 S5000
G1 X101.667 Y104.2 E.00234
; LINE_WIDTH: 0.410168
G3 X99.58 Y104.202 I-1.092 J-42.59 E.02674
; LINE_WIDTH: 0.410028
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409888
G1 X95.58 Y104.203 E.0256
; LINE_WIDTH: 0.409758
G1 X93.58 Y104.203 E.02559
; LINE_WIDTH: 0.409618
G1 X91.58 Y104.203 E.02558
; LINE_WIDTH: 0.409478
G1 X89.58 Y104.203 E.02557
; LINE_WIDTH: 0.409348
G1 X87.58 Y104.203 E.02557
; LINE_WIDTH: 0.409208
G1 X85.58 Y104.204 E.02556
; LINE_WIDTH: 0.409068
G1 X83.58 Y104.204 E.02555
; LINE_WIDTH: 0.408938
G1 X81.58 Y104.204 E.02554
; LINE_WIDTH: 0.408798
G1 X79.58 Y104.204 E.02553
; LINE_WIDTH: 0.408658
G1 X78.424 Y104.204 E.01475
G1 X78.058 Y104.131 E.00477
; LINE_WIDTH: 0.407358
G1 X77.734 Y103.905 E.00502
G1 X77.542 Y103.572 E.00489
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00376
G1 X77.496 Y76.724 E.33881
G1 X77.552 Y76.404 E.00415
; LINE_WIDTH: 0.404218
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.407908
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.418 Y75.798 E.00536
G1 X80.418 Y75.798 E.02563
; LINE_WIDTH: 0.410078
G1 X82.418 Y75.798 E.02561
; LINE_WIDTH: 0.409878
G1 X84.418 Y75.798 E.0256
; LINE_WIDTH: 0.409678
G1 X86.418 Y75.798 E.02559
; LINE_WIDTH: 0.409478
G1 X88.418 Y75.797 E.02557
; LINE_WIDTH: 0.409288
G1 X90.418 Y75.797 E.02556
; LINE_WIDTH: 0.409088
G1 X92.418 Y75.797 E.02555
; LINE_WIDTH: 0.408888
G1 X94.418 Y75.797 E.02554
; LINE_WIDTH: 0.408688
G1 X96.418 Y75.797 E.02552
; LINE_WIDTH: 0.408498
G1 X98.418 Y75.796 E.02551
; LINE_WIDTH: 0.408298
G1 X100.418 Y75.796 E.0255
; LINE_WIDTH: 0.408098
G1 X101.6 Y75.796 E.01506
; LINE_WIDTH: 0.409868
G1 X101.832 Y75.83 E.00301
G1 X102.176 Y76.011 E.00497
G1 X102.401 Y76.288 E.00457
G1 X102.501 Y76.646 E.00476
; LINE_WIDTH: 0.409388
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
G1 X102.465 Y103.545 E.00347
; LINE_WIDTH: 0.405648
G1 X102.28 Y103.888 E.00493
; LINE_WIDTH: 0.409308
G1 X102.002 Y104.107 E.00452
G1 X101.902 Y104.134 E.00133
; WIPE_START
G1 F12000
M204 S6000
G1 X101.667 Y104.2 E-.09249
G1 X99.911 Y104.202 E-.66751
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.812 Y97.763 Z6.02 F42000
G1 X85.211 Y81.112 Z6.02
G1 Z5.62
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1779
M204 S5000
G1 X85.127 Y80.945 E.00207
G2 X84 Y78.819 I-99.861 J51.575 E.02666
; WIPE_START
G1 F7800
M204 S6000
G1 X84.937 Y80.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.02 F42000
G1 Z5.62
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1779
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
G1 X82.221 Y82.702 Z6.02 F42000
G1 Z5.62
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1779
M204 S5000
G1 X82.13 Y82.539 E.00207
G3 X81.137 Y80.677 I44.527 J-24.952 E.02339
; LINE_WIDTH: 0.361868
G1 X81.12 Y80.659 E.00028
; LINE_WIDTH: 0.375218
G1 X81.072 Y80.609 E.00082
; LINE_WIDTH: 0.388568
G1 X81.024 Y80.558 E.00085
; LINE_WIDTH: 0.420218
G1 X80.865 Y80.642 E.00236
; LINE_WIDTH: 0.451868
G1 X80.706 Y80.727 E.00255
G1 X80.392 Y80.449 E.00594
; LINE_WIDTH: 0.404068
G1 X80.113 Y80.371 E.00366
; LINE_WIDTH: 0.401008
G1 X79.818 Y80.416 E.00373
; LINE_WIDTH: 0.397468
G1 X79.587 Y80.566 E.00342
; LINE_WIDTH: 0.393708
M73 P73 R4
G1 X79.431 Y80.793 E.00338
; LINE_WIDTH: 0.400068
G1 X79.373 Y81.062 E.00343
G1 X79.429 Y81.332 E.00345
; LINE_WIDTH: 0.406288
G1 X79.633 Y81.604 E.00432
G1 X79.884 Y81.735 E.00358
; LINE_WIDTH: 0.402948
G1 X80.188 Y81.748 E.00382
; LINE_WIDTH: 0.391268
G1 X80.447 Y81.644 E.00341
; LINE_WIDTH: 0.395088
G1 X80.686 Y81.38 E.00438
; LINE_WIDTH: 0.399208
G1 X80.766 Y81.103 E.00359
; LINE_WIDTH: 0.425538
G1 X80.736 Y80.915 E.00253
; LINE_WIDTH: 0.451868
G1 X80.706 Y80.727 E.0027
; WIPE_START
G1 F12000
M204 S6000
G1 X80.736 Y80.915 E-.07236
G1 X80.766 Y81.103 E-.07236
G1 X80.686 Y81.38 E-.1097
G1 X80.447 Y81.644 E-.13527
G1 X80.188 Y81.748 E-.10616
G1 X79.884 Y81.735 E-.11547
G1 X79.633 Y81.604 E-.10735
G1 X79.568 Y81.517 E-.04134
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.02 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.7
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 70/100
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 15
G1 X102.372 Y104.308 F42000
G1 Z5.7
G1 E.8 F1800
; LINE_WIDTH: 0.403308
G1 F1783
M204 S5000
G1 X102.268 Y104.396 E.00172
; LINE_WIDTH: 0.411578
G1 X101.871 Y104.562 E.00553
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410168
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.409948
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409738
G1 X95.59 Y104.595 E.02559
; LINE_WIDTH: 0.409518
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409308
G1 X91.59 Y104.595 E.02556
; LINE_WIDTH: 0.409098
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408878
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408668
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408448
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408238
G1 X81.59 Y104.594 E.02549
; LINE_WIDTH: 0.408028
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.410978
G1 X77.988 Y104.522 E.00536
G1 X77.77 Y104.422 E.00308
; LINE_WIDTH: 0.406818
G1 X77.417 Y104.137 E.00575
G1 X77.203 Y103.769 E.00541
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.293 E.00621
G1 X77.104 Y77.293 E.33172
G3 X77.141 Y76.413 I3.747 J-.284 E.01126
; LINE_WIDTH: 0.412868
G1 X77.271 Y76.081 E.00461
G1 X77.455 Y75.831 E.004
; LINE_WIDTH: 0.407588
G1 X77.823 Y75.547 E.00592
G1 X78.16 Y75.435 E.00453
; LINE_WIDTH: 0.410278
G1 X78.407 Y75.405 E.00319
G1 X80.407 Y75.405 E.02563
; LINE_WIDTH: 0.410078
G1 X82.407 Y75.405 E.02561
; LINE_WIDTH: 0.409878
G1 X84.407 Y75.405 E.0256
; LINE_WIDTH: 0.409678
G1 X86.407 Y75.405 E.02559
; LINE_WIDTH: 0.409478
G1 X88.407 Y75.405 E.02557
; LINE_WIDTH: 0.409278
G1 X90.407 Y75.405 E.02556
; LINE_WIDTH: 0.409078
G1 X92.407 Y75.405 E.02555
; LINE_WIDTH: 0.408888
G1 X94.407 Y75.405 E.02554
; LINE_WIDTH: 0.408688
G1 X96.407 Y75.405 E.02552
; LINE_WIDTH: 0.408488
G1 X98.407 Y75.405 E.02551
; LINE_WIDTH: 0.408288
G1 X100.407 Y75.405 E.0255
; LINE_WIDTH: 0.408088
G1 X101.6 Y75.405 E.0152
; LINE_WIDTH: 0.407978
G1 X101.843 Y75.437 E.00312
; LINE_WIDTH: 0.408518
G1 X102.279 Y75.605 E.00596
; LINE_WIDTH: 0.413078
G1 X102.577 Y75.862 E.00508
G1 X102.786 Y76.188 E.00499
; LINE_WIDTH: 0.412188
G1 X102.894 Y76.646 E.00606
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
G1 X102.868 Y103.529 E.00325
; LINE_WIDTH: 0.413608
G1 X102.728 Y103.919 E.00535
G1 X102.562 Y104.15 E.00367
; LINE_WIDTH: 0.403308
G1 X102.418 Y104.27 E.00236
M204 S250
G1 X102.162 Y103.981 F42000
; LINE_WIDTH: 0.409268
G1 F1783
M204 S5000
G1 X102.002 Y104.107 E.00261
; LINE_WIDTH: 0.410168
G1 X101.581 Y104.202 E.00553
G1 X99.581 Y104.202 E.02562
; LINE_WIDTH: 0.409948
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409738
G1 X95.581 Y104.202 E.02559
; LINE_WIDTH: 0.409518
G1 X93.581 Y104.203 E.02558
; LINE_WIDTH: 0.409308
G1 X91.581 Y104.203 E.02556
; LINE_WIDTH: 0.409098
G1 X89.581 Y104.203 E.02555
; LINE_WIDTH: 0.408878
G1 X87.581 Y104.203 E.02554
; LINE_WIDTH: 0.408668
G1 X85.581 Y104.203 E.02552
; LINE_WIDTH: 0.408448
G1 X83.581 Y104.203 E.02551
; LINE_WIDTH: 0.408238
G1 X81.581 Y104.204 E.02549
; LINE_WIDTH: 0.408028
G1 X79.581 Y104.204 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.407688
G1 X77.977 Y104.094 E.00556
; LINE_WIDTH: 0.406808
G1 X77.683 Y103.845 E.00489
; LINE_WIDTH: 0.405848
G1 X77.549 Y103.594 E.0036
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.285 E.004
G1 X77.496 Y76.724 E.33888
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.404688
G1 X77.729 Y76.101 E.00443
; LINE_WIDTH: 0.407328
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
; LINE_WIDTH: 0.409278
G1 X90.415 Y75.797 E.02556
; LINE_WIDTH: 0.409078
G1 X92.415 Y75.797 E.02555
; LINE_WIDTH: 0.408888
G1 X94.415 Y75.797 E.02554
; LINE_WIDTH: 0.408688
G1 X96.415 Y75.797 E.02552
; LINE_WIDTH: 0.408488
G1 X98.415 Y75.796 E.02551
; LINE_WIDTH: 0.408288
G1 X100.415 Y75.796 E.0255
; LINE_WIDTH: 0.408088
G1 X101.6 Y75.796 E.0151
; LINE_WIDTH: 0.409918
G1 X101.832 Y75.83 E.00301
G1 X102.176 Y76.01 E.00497
; LINE_WIDTH: 0.406758
G1 X102.399 Y76.286 E.0045
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.00479
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
G1 X102.465 Y103.545 E.00348
; LINE_WIDTH: 0.406058
G1 X102.28 Y103.888 E.00494
; LINE_WIDTH: 0.409268
G1 X102.209 Y103.944 E.00114
; WIPE_START
G1 F12000
M204 S6000
G1 X102.002 Y104.107 E-.10037
G1 X101.581 Y104.202 E-.16411
G1 X100.276 Y104.202 E-.49553
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.106 Y97.81 Z6.1 F42000
G1 X85.211 Y81.112 Z6.1
G1 Z5.7
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1783
M204 S5000
G1 X85.127 Y80.945 E.00207
G2 X84 Y78.819 I-100.163 J51.736 E.02666
; WIPE_START
G1 F7800
M204 S6000
G1 X84.937 Y80.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1783
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
G1 X82.221 Y82.702 Z6.1 F42000
G1 Z5.7
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1783
M204 S5000
G1 X82.13 Y82.539 E.00207
G3 X81.137 Y80.677 I44.624 J-25.004 E.02339
; LINE_WIDTH: 0.361878
G1 X81.12 Y80.659 E.00028
; LINE_WIDTH: 0.375238
G1 X81.072 Y80.609 E.00082
; LINE_WIDTH: 0.388588
G1 X81.024 Y80.558 E.00085
; LINE_WIDTH: 0.420838
G1 X80.864 Y80.643 E.00237
; LINE_WIDTH: 0.453088
G1 X80.705 Y80.727 E.00256
G1 X80.591 Y80.615 E.00227
; LINE_WIDTH: 0.422908
G1 X80.477 Y80.503 E.00211
; LINE_WIDTH: 0.392728
G1 X80.207 Y80.388 E.0036
; LINE_WIDTH: 0.397088
G1 X79.837 Y80.413 E.00458
G1 X79.587 Y80.566 E.00363
; LINE_WIDTH: 0.393708
G1 X79.423 Y80.81 E.0036
; LINE_WIDTH: 0.395348
G1 X79.383 Y81.152 E.00425
; LINE_WIDTH: 0.397448
G1 X79.491 Y81.457 E.00401
G1 X79.763 Y81.684 E.00439
; LINE_WIDTH: 0.387828
G1 X80.073 Y81.759 E.00386
; LINE_WIDTH: 0.398148
G1 X80.402 Y81.674 E.00422
; LINE_WIDTH: 0.406728
G1 X80.577 Y81.539 E.0028
; LINE_WIDTH: 0.407028
G2 X80.763 Y81.1 I-.514 J-.477 E.00618
; LINE_WIDTH: 0.453088
G1 X80.705 Y80.727 E.00537
; WIPE_START
G1 F12000
M204 S6000
G1 X80.763 Y81.1 E-.14354
G1 X80.709 Y81.335 E-.09134
G1 X80.577 Y81.539 E-.0924
G1 X80.402 Y81.674 E-.08389
G1 X80.073 Y81.759 E-.12913
G1 X79.763 Y81.684 E-.12132
G1 X79.564 Y81.518 E-.09837
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.1 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.78
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 71/100
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 15
G1 X102.369 Y104.316 F42000
G1 Z5.78
G1 E.8 F1800
; LINE_WIDTH: 0.403708
G1 F1787
M204 S5000
G1 X102.288 Y104.386 E.00134
; LINE_WIDTH: 0.411068
G1 X101.87 Y104.561 E.00582
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410188
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.409968
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409748
G1 X95.59 Y104.595 E.02559
; LINE_WIDTH: 0.409538
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409318
G1 X91.59 Y104.595 E.02556
; LINE_WIDTH: 0.409108
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408888
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408678
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408458
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408238
G1 X81.59 Y104.594 E.02549
; LINE_WIDTH: 0.408028
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.414078
G1 X77.963 Y104.515 E.00575
G1 X77.59 Y104.297 E.00559
; LINE_WIDTH: 0.403668
M73 P74 R4
G1 X77.291 Y103.954 E.00574
; LINE_WIDTH: 0.407328
G1 X77.136 Y103.543 E.00559
; LINE_WIDTH: 0.410298
G1 X77.105 Y103.292 E.00323
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
G1 X77.104 Y76.724 E.00725
G1 X77.181 Y76.285 E.00569
; LINE_WIDTH: 0.403918
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.413588
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410278
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410078
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409878
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409678
G1 X86.415 Y75.405 E.02559
; LINE_WIDTH: 0.409478
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409278
G1 X90.415 Y75.405 E.02556
; LINE_WIDTH: 0.409078
G1 X92.415 Y75.405 E.02555
; LINE_WIDTH: 0.408878
G1 X94.415 Y75.405 E.02554
; LINE_WIDTH: 0.408678
G1 X96.415 Y75.405 E.02552
; LINE_WIDTH: 0.408478
G1 X98.415 Y75.405 E.02551
; LINE_WIDTH: 0.408278
G1 X100.415 Y75.405 E.0255
; LINE_WIDTH: 0.408078
G1 X101.6 Y75.405 E.0151
; LINE_WIDTH: 0.407968
G1 X101.842 Y75.437 E.00311
; LINE_WIDTH: 0.408478
G1 X102.278 Y75.605 E.00596
; LINE_WIDTH: 0.412228
G1 X102.577 Y75.861 E.00506
; LINE_WIDTH: 0.414108
G1 X102.794 Y76.208 E.0053
G1 X102.894 Y76.646 E.00581
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
G1 X102.896 Y103.276 E.03355
G1 X102.868 Y103.53 E.00326
; LINE_WIDTH: 0.415108
G1 X102.749 Y103.881 E.00481
G1 X102.576 Y104.136 E.004
; LINE_WIDTH: 0.403708
G1 X102.414 Y104.276 E.00269
M204 S250
G1 X102.136 Y104.001 F42000
; LINE_WIDTH: 0.405918
G1 F1787
M204 S5000
G1 X102.001 Y104.105 E.00217
G1 X101.668 Y104.2 E.00438
; LINE_WIDTH: 0.410188
G3 X99.58 Y104.202 I-1.091 J-42.519 E.02675
; LINE_WIDTH: 0.409968
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409748
G1 X95.58 Y104.202 E.02559
; LINE_WIDTH: 0.409538
G1 X93.58 Y104.203 E.02558
; LINE_WIDTH: 0.409318
G1 X91.58 Y104.203 E.02556
; LINE_WIDTH: 0.409108
G1 X89.58 Y104.203 E.02555
; LINE_WIDTH: 0.408888
G1 X87.58 Y104.203 E.02554
; LINE_WIDTH: 0.408678
G1 X85.58 Y104.203 E.02552
; LINE_WIDTH: 0.408458
G1 X83.58 Y104.203 E.02551
; LINE_WIDTH: 0.408238
G1 X81.58 Y104.204 E.02549
; LINE_WIDTH: 0.408028
G1 X79.58 Y104.204 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.414078
G3 X77.832 Y103.996 I.065 J-1.056 E.00793
; LINE_WIDTH: 0.408528
G1 X77.594 Y103.702 E.00483
; LINE_WIDTH: 0.410298
G1 X77.498 Y103.285 E.00548
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
G1 X77.496 Y76.724 E.00715
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413568
G1 X77.61 Y76.283 E.00173
G1 X77.755 Y76.075 E.00327
; LINE_WIDTH: 0.411208
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405378
G1 X78.33 Y75.802 E.00421
; LINE_WIDTH: 0.410278
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.410078
G1 X82.429 Y75.798 E.02561
; LINE_WIDTH: 0.409878
G1 X84.429 Y75.798 E.0256
; LINE_WIDTH: 0.409678
G1 X86.429 Y75.798 E.02559
; LINE_WIDTH: 0.409478
G1 X88.429 Y75.797 E.02557
; LINE_WIDTH: 0.409278
G1 X90.429 Y75.797 E.02556
; LINE_WIDTH: 0.409078
G1 X92.429 Y75.797 E.02555
; LINE_WIDTH: 0.408878
G1 X94.429 Y75.797 E.02554
; LINE_WIDTH: 0.408678
G1 X96.429 Y75.797 E.02552
; LINE_WIDTH: 0.408478
G1 X98.429 Y75.796 E.02551
; LINE_WIDTH: 0.408278
G1 X100.429 Y75.796 E.0255
; LINE_WIDTH: 0.408078
G1 X101.6 Y75.796 E.01492
; LINE_WIDTH: 0.409968
G1 X101.833 Y75.83 E.00301
G1 X102.174 Y76.009 E.00494
; LINE_WIDTH: 0.405178
G1 X102.392 Y76.274 E.00434
; LINE_WIDTH: 0.409388
G1 X102.501 Y76.646 E.00495
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
G1 X102.504 Y103.276 E.03355
G1 X102.465 Y103.546 E.00349
; LINE_WIDTH: 0.407098
G1 X102.28 Y103.889 E.00496
; LINE_WIDTH: 0.405918
G1 X102.184 Y103.964 E.00155
; WIPE_START
G1 F12000
M204 S6000
G1 X102.001 Y104.105 E-.08783
G1 X101.668 Y104.2 E-.13148
G1 X100.245 Y104.201 E-.54069
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.08 Y97.805 Z6.18 F42000
G1 X85.211 Y81.112 Z6.18
G1 Z5.78
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1787
M204 S5000
G1 X85.127 Y80.945 E.00207
G2 X84 Y78.819 I-99.879 J51.585 E.02667
; WIPE_START
G1 F7800
M204 S6000
G1 X84.937 Y80.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.644 Y81.771 Z6.18 F42000
G1 Z5.78
G1 E.8 F1800
; LINE_WIDTH: 0.620728
G1 F1787
M204 S5000
G1 X83.619 Y81.724 E.00105
; LINE_WIDTH: 0.581095
G1 X83.594 Y81.677 E.00098
; LINE_WIDTH: 0.541461
G1 X83.569 Y81.63 E.00091
; LINE_WIDTH: 0.501828
G1 X83.485 Y81.471 E.00284
; LINE_WIDTH: 0.501668
G1 X82.546 Y79.706 E.03158
; WIPE_START
G1 F12000
M204 S6000
G1 X83.485 Y81.471 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.221 Y82.702 Z6.18 F42000
G1 Z5.78
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1787
M204 S5000
G1 X82.13 Y82.539 E.00207
G3 X81.137 Y80.677 I44.623 J-25.004 E.02339
; LINE_WIDTH: 0.361858
G1 X81.12 Y80.659 E.00028
; LINE_WIDTH: 0.375198
G1 X81.072 Y80.609 E.00082
; LINE_WIDTH: 0.388528
G1 X81.024 Y80.558 E.00085
; LINE_WIDTH: 0.420188
G1 X80.865 Y80.642 E.00236
; LINE_WIDTH: 0.451848
G1 X80.706 Y80.727 E.00255
G1 X80.392 Y80.449 E.00594
; LINE_WIDTH: 0.404088
G1 X80.106 Y80.37 E.00374
; LINE_WIDTH: 0.401828
G1 X79.792 Y80.428 E.004
; LINE_WIDTH: 0.397108
G1 X79.528 Y80.633 E.00415
G1 X79.398 Y80.891 E.00358
; LINE_WIDTH: 0.400068
G1 X79.38 Y81.166 E.00344
; LINE_WIDTH: 0.406448
G1 X79.443 Y81.362 E.00261
G1 X79.611 Y81.585 E.00355
; LINE_WIDTH: 0.405248
G1 X79.913 Y81.74 E.0043
; LINE_WIDTH: 0.391288
G1 X80.188 Y81.747 E.00335
; LINE_WIDTH: 0.389368
G1 X80.443 Y81.646 E.00333
; LINE_WIDTH: 0.384968
G1 X80.639 Y81.455 E.00328
; LINE_WIDTH: 0.399388
G1 X80.763 Y81.117 E.00449
; LINE_WIDTH: 0.425618
G1 X80.734 Y80.922 E.00262
; LINE_WIDTH: 0.451848
G1 X80.706 Y80.727 E.00279
; WIPE_START
G1 F12000
M204 S6000
G1 X80.734 Y80.922 E-.07488
G1 X80.763 Y81.117 E-.07488
G1 X80.639 Y81.455 E-.137
G1 X80.443 Y81.646 E-.10382
G1 X80.188 Y81.747 E-.1042
G1 X79.913 Y81.74 E-.10434
G1 X79.611 Y81.585 E-.12908
G1 X79.561 Y81.518 E-.03181
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.18 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.86
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 72/100
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 15
G1 X102.373 Y104.316 F42000
G1 Z5.86
G1 E.8 F1800
; LINE_WIDTH: 0.407578
G1 F1759
M204 S5000
G1 X102.315 Y104.372 E.00102
; LINE_WIDTH: 0.413198
G1 X101.936 Y104.543 E.00536
G1 X101.587 Y104.595 E.00455
; LINE_WIDTH: 0.410198
G1 X99.587 Y104.595 E.02562
; LINE_WIDTH: 0.409978
G1 X97.587 Y104.595 E.02561
; LINE_WIDTH: 0.409758
G1 X95.587 Y104.595 E.02559
; LINE_WIDTH: 0.409548
G1 X93.587 Y104.595 E.02558
; LINE_WIDTH: 0.409328
G1 X91.587 Y104.595 E.02556
; LINE_WIDTH: 0.409108
G1 X89.587 Y104.595 E.02555
; LINE_WIDTH: 0.408898
G1 X87.587 Y104.595 E.02554
; LINE_WIDTH: 0.408678
G1 X85.587 Y104.595 E.02552
; LINE_WIDTH: 0.408458
G1 X83.587 Y104.594 E.02551
; LINE_WIDTH: 0.408248
G1 X81.587 Y104.594 E.02549
; LINE_WIDTH: 0.408028
G1 X79.587 Y104.594 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.594 E.01512
; LINE_WIDTH: 0.407688
G1 X78.071 Y104.542 E.00425
; LINE_WIDTH: 0.416058
G1 X77.705 Y104.384 E.00518
G1 X77.463 Y104.188 E.00405
; LINE_WIDTH: 0.407788
G1 X77.203 Y103.769 E.00628
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.292 E.00622
G1 X77.104 Y76.724 E.33896
G1 X77.181 Y76.285 E.00568
; LINE_WIDTH: 0.403918
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412798
G1 X78.064 Y75.457 E.00516
G1 X78.412 Y75.405 E.00454
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
M73 P75 R4
G1 X90.412 Y75.405 E.02556
; LINE_WIDTH: 0.409068
G1 X92.412 Y75.405 E.02555
; LINE_WIDTH: 0.408868
G1 X94.412 Y75.405 E.02553
; LINE_WIDTH: 0.408668
G1 X96.412 Y75.405 E.02552
; LINE_WIDTH: 0.408468
G1 X98.412 Y75.405 E.02551
; LINE_WIDTH: 0.408268
G1 X100.412 Y75.405 E.0255
; LINE_WIDTH: 0.408068
G1 X101.6 Y75.405 E.01513
; LINE_WIDTH: 0.407958
G1 X101.842 Y75.437 E.00311
; LINE_WIDTH: 0.408438
G1 X102.278 Y75.605 E.00595
; LINE_WIDTH: 0.413568
G1 X102.535 Y75.813 E.00428
G1 X102.769 Y76.147 E.00527
; LINE_WIDTH: 0.409928
G1 X102.894 Y76.646 E.00658
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
G1 X102.831 Y103.682 E.00525
; LINE_WIDTH: 0.405618
G1 X102.616 Y104.084 E.00577
; LINE_WIDTH: 0.407578
G1 X102.416 Y104.275 E.00352
M204 S250
G1 X102.137 Y103.999 F42000
; LINE_WIDTH: 0.405958
G1 F1759
M204 S5000
G1 X102 Y104.105 E.00219
; LINE_WIDTH: 0.404528
G1 X101.668 Y104.199 E.00436
; LINE_WIDTH: 0.410198
G1 X99.575 Y104.202 E.02681
; LINE_WIDTH: 0.409978
G1 X97.575 Y104.202 E.02561
; LINE_WIDTH: 0.409758
G1 X95.575 Y104.202 E.02559
; LINE_WIDTH: 0.409548
G1 X93.575 Y104.203 E.02558
; LINE_WIDTH: 0.409328
G1 X91.575 Y104.203 E.02556
; LINE_WIDTH: 0.409108
G1 X89.575 Y104.203 E.02555
; LINE_WIDTH: 0.408898
G1 X87.575 Y104.203 E.02554
; LINE_WIDTH: 0.408678
G1 X85.575 Y104.203 E.02552
; LINE_WIDTH: 0.408458
G1 X83.575 Y104.203 E.02551
; LINE_WIDTH: 0.408248
G1 X81.575 Y104.204 E.02549
; LINE_WIDTH: 0.408028
G1 X79.575 Y104.204 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.204 E.01496
; LINE_WIDTH: 0.407688
G1 X78.069 Y104.136 E.0043
; LINE_WIDTH: 0.407358
G1 X77.734 Y103.905 E.00517
G1 X77.543 Y103.572 E.00489
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.285 E.00371
G1 X77.496 Y76.724 E.33887
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413558
G1 X77.61 Y76.283 E.00172
M73 P75 R3
G1 X77.755 Y76.075 E.00328
; LINE_WIDTH: 0.411228
G1 X78.01 Y75.89 E.00404
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
; LINE_WIDTH: 0.408868
G1 X94.424 Y75.797 E.02553
; LINE_WIDTH: 0.408668
G1 X96.424 Y75.797 E.02552
; LINE_WIDTH: 0.408468
G1 X98.424 Y75.796 E.02551
; LINE_WIDTH: 0.408268
G1 X100.424 Y75.796 E.0255
; LINE_WIDTH: 0.408068
G1 X101.6 Y75.796 E.01498
; LINE_WIDTH: 0.409998
G1 X101.833 Y75.83 E.00301
G1 X102.176 Y76.009 E.00496
G1 X102.402 Y76.292 E.00464
G1 X102.501 Y76.646 E.0047
; LINE_WIDTH: 0.409388
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
G1 X102.462 Y103.559 E.00365
; LINE_WIDTH: 0.406428
G1 X102.28 Y103.89 E.00479
; LINE_WIDTH: 0.405958
G1 X102.185 Y103.963 E.00152
; WIPE_START
G1 F12000
M204 S6000
G1 X102 Y104.105 E-.08852
G1 X101.668 Y104.199 E-.13117
G1 X100.246 Y104.201 E-.54031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.081 Y97.805 Z6.26 F42000
G1 X85.21 Y81.112 Z6.26
G1 Z5.86
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1759
M204 S5000
G1 X85.028 Y80.759 E.00439
G1 X84.985 Y80.676 E.00104
; WIPE_START
G1 F12000
M204 S6000
G1 X85.028 Y80.759 E-.14522
G1 X85.21 Y81.112 E-.61478
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.26 F42000
G1 Z5.86
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1759
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
G1 X82.222 Y82.7 Z6.26 F42000
G1 Z5.86
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1759
M204 S5000
G1 X82.031 Y82.353 E.00439
G1 X81.986 Y82.27 E.00104
; WIPE_START
G1 F12000
M204 S6000
G1 X82.031 Y82.353 E-.14583
G1 X82.222 Y82.7 E-.61417
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.407 Y80.9 Z6.26 F42000
G1 Z5.86
G1 E.8 F1800
; LINE_WIDTH: 0.389188
G1 F1759
M204 S5000
G1 X79.41 Y80.864 E.00044
; LINE_WIDTH: 0.385948
G1 X79.54 Y80.623 E.00329
G1 X79.753 Y80.452 E.00329
; LINE_WIDTH: 0.416878
G1 X80.032 Y80.379 E.00375
; LINE_WIDTH: 0.418108
G1 X80.054 Y80.378 E.00029
; LINE_WIDTH: 0.417638
G1 X80.323 Y80.42 E.00356
; LINE_WIDTH: 0.406108
G1 X80.548 Y80.564 E.00339
; LINE_WIDTH: 0.404588
G1 X80.747 Y80.901 E.00494
; LINE_WIDTH: 0.398268
G1 X80.759 Y81.166 E.00329
G1 X80.608 Y81.496 E.00451
; LINE_WIDTH: 0.389228
G1 X80.387 Y81.678 E.00348
; LINE_WIDTH: 0.385928
G1 X80.124 Y81.753 E.00329
; LINE_WIDTH: 0.391768
G1 X79.796 Y81.7 E.00405
; LINE_WIDTH: 0.398428
G1 X79.515 Y81.486 E.0044
G1 X79.386 Y81.15 E.00448
; LINE_WIDTH: 0.389188
G1 X79.402 Y80.96 E.00231
; WIPE_START
G1 F12000
M204 S6000
G1 X79.41 Y80.864 E-.03662
G1 X79.54 Y80.623 E-.10399
G1 X79.753 Y80.452 E-.10391
G1 X80.032 Y80.379 E-.10944
G1 X80.054 Y80.378 E-.00845
G1 X80.323 Y80.42 E-.10354
G1 X80.548 Y80.564 E-.10149
G1 X80.747 Y80.901 E-.14872
G1 X80.752 Y81.016 E-.04387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.26 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 5.94
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 73/100
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 15
G1 X102.352 Y104.326 F42000
G1 Z5.94
G1 E.8 F1800
; LINE_WIDTH: 0.403528
G1 F1759
M204 S5000
G1 X102.263 Y104.4 E.00146
; LINE_WIDTH: 0.411558
G1 X101.871 Y104.562 E.00546
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410178
G1 X99.59 Y104.595 E.02562
; LINE_WIDTH: 0.409958
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409748
G1 X95.59 Y104.595 E.02559
; LINE_WIDTH: 0.409528
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409318
G1 X91.59 Y104.595 E.02556
; LINE_WIDTH: 0.409098
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408888
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408668
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408458
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408238
G1 X81.59 Y104.594 E.02549
; LINE_WIDTH: 0.408028
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.407688
G1 X78.07 Y104.541 E.00425
; LINE_WIDTH: 0.416018
G1 X77.705 Y104.384 E.00517
G1 X77.443 Y104.171 E.00439
; LINE_WIDTH: 0.407798
G1 X77.183 Y103.721 E.00662
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00558
G1 X77.104 Y76.724 E.33894
G1 X77.181 Y76.285 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.907 E.00545
; LINE_WIDTH: 0.408228
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.412798
G1 X78.064 Y75.457 E.00516
G1 X78.413 Y75.405 E.00455
; LINE_WIDTH: 0.410278
G1 X80.413 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.413 Y75.405 E.02561
; LINE_WIDTH: 0.409868
G1 X84.413 Y75.405 E.0256
; LINE_WIDTH: 0.409668
G1 X86.413 Y75.405 E.02559
; LINE_WIDTH: 0.409468
G1 X88.413 Y75.405 E.02557
; LINE_WIDTH: 0.409268
G1 X90.413 Y75.405 E.02556
; LINE_WIDTH: 0.409068
G1 X92.413 Y75.405 E.02555
; LINE_WIDTH: 0.408868
G1 X94.413 Y75.405 E.02553
; LINE_WIDTH: 0.408668
G1 X96.413 Y75.405 E.02552
; LINE_WIDTH: 0.408468
G1 X98.413 Y75.405 E.02551
; LINE_WIDTH: 0.408268
G1 X100.413 Y75.405 E.0255
; LINE_WIDTH: 0.408058
G1 X101.6 Y75.405 E.01513
; LINE_WIDTH: 0.407948
G1 X101.842 Y75.437 E.00311
; LINE_WIDTH: 0.408388
G1 X102.277 Y75.605 E.00595
; LINE_WIDTH: 0.413568
G1 X102.535 Y75.813 E.00428
G1 X102.769 Y76.147 E.00527
; LINE_WIDTH: 0.409948
G1 X102.894 Y76.646 E.00658
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
M73 P76 R3
G1 X102.896 Y103.276 E.03355
G1 X102.872 Y103.5 E.00288
; LINE_WIDTH: 0.413428
G1 X102.719 Y103.937 E.00598
G1 X102.555 Y104.157 E.00354
; LINE_WIDTH: 0.403528
G1 X102.399 Y104.287 E.00257
M204 S250
G1 X102.102 Y104.028 F42000
; LINE_WIDTH: 0.409168
G1 F1759
M204 S5000
G1 X102.001 Y104.107 E.00164
; LINE_WIDTH: 0.410178
G1 X101.581 Y104.202 E.00552
G1 X99.581 Y104.202 E.02562
; LINE_WIDTH: 0.409958
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409748
G1 X95.581 Y104.202 E.02559
; LINE_WIDTH: 0.409528
G1 X93.581 Y104.203 E.02558
; LINE_WIDTH: 0.409318
G1 X91.581 Y104.203 E.02556
; LINE_WIDTH: 0.409098
G1 X89.581 Y104.203 E.02555
; LINE_WIDTH: 0.408888
G1 X87.581 Y104.203 E.02554
; LINE_WIDTH: 0.408668
G1 X85.581 Y104.203 E.02552
; LINE_WIDTH: 0.408458
G1 X83.581 Y104.203 E.02551
; LINE_WIDTH: 0.408238
G1 X81.581 Y104.204 E.02549
; LINE_WIDTH: 0.408028
G1 X79.581 Y104.204 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.407688
G1 X78.068 Y104.136 E.00431
; LINE_WIDTH: 0.407368
G1 X77.734 Y103.906 E.00516
G1 X77.542 Y103.572 E.00489
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00377
G1 X77.496 Y76.724 E.33881
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413588
G1 X77.61 Y76.283 E.00172
G1 X77.755 Y76.075 E.00327
; LINE_WIDTH: 0.411178
G1 X78.01 Y75.89 E.00405
; LINE_WIDTH: 0.404518
G1 X78.33 Y75.801 E.0042
; LINE_WIDTH: 0.410278
G1 X80.425 Y75.798 E.02683
; LINE_WIDTH: 0.410068
G1 X82.425 Y75.798 E.02561
; LINE_WIDTH: 0.409868
G1 X84.425 Y75.798 E.0256
; LINE_WIDTH: 0.409668
G1 X86.425 Y75.798 E.02559
; LINE_WIDTH: 0.409468
G1 X88.425 Y75.797 E.02557
; LINE_WIDTH: 0.409268
G1 X90.425 Y75.797 E.02556
; LINE_WIDTH: 0.409068
G1 X92.425 Y75.797 E.02555
; LINE_WIDTH: 0.408868
G1 X94.425 Y75.797 E.02553
; LINE_WIDTH: 0.408668
G1 X96.425 Y75.797 E.02552
; LINE_WIDTH: 0.408468
G1 X98.425 Y75.796 E.02551
; LINE_WIDTH: 0.408258
G1 X100.425 Y75.796 E.0255
; LINE_WIDTH: 0.408058
G1 X101.6 Y75.796 E.01498
; LINE_WIDTH: 0.410018
G1 X101.832 Y75.83 E.00301
G1 X102.176 Y76.009 E.00495
G1 X102.402 Y76.292 E.00465
G1 X102.501 Y76.646 E.0047
; LINE_WIDTH: 0.409378
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
G1 X102.472 Y103.521 E.00316
; LINE_WIDTH: 0.407458
G1 X102.279 Y103.889 E.00529
; LINE_WIDTH: 0.409168
G1 X102.149 Y103.991 E.00211
; WIPE_START
G1 F12000
M204 S6000
G1 X102.001 Y104.107 E-.07169
G1 X101.581 Y104.202 E-.16368
G1 X100.2 Y104.202 E-.52464
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.044 Y97.8 Z6.34 F42000
G1 X85.21 Y81.112 Z6.34
G1 Z5.94
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1759
M204 S5000
G1 X85.028 Y80.759 E.00439
G1 X84.985 Y80.676 E.00104
; WIPE_START
G1 F12000
M204 S6000
G1 X85.028 Y80.759 E-.14542
G1 X85.21 Y81.112 E-.61458
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.34 F42000
G1 Z5.94
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1759
M204 S5000
G1 X82.63 Y79.864 E.00283
; LINE_WIDTH: 0.501848
G1 X83.569 Y81.63 E.0316
; LINE_WIDTH: 0.541475
G1 X83.594 Y81.677 E.00091
; LINE_WIDTH: 0.581101
G1 X83.619 Y81.724 E.00098
; LINE_WIDTH: 0.620728
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
G1 X82.222 Y82.7 Z6.34 F42000
G1 Z5.94
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1759
M204 S5000
G1 X82.031 Y82.353 E.00439
G1 X81.986 Y82.27 E.00104
; WIPE_START
G1 F12000
M204 S6000
G1 X82.031 Y82.353 E-.14571
G1 X82.222 Y82.7 E-.61429
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.382 Y80.976 Z6.34 F42000
G1 Z5.94
G1 E.8 F1800
; LINE_WIDTH: 0.398268
G1 F1759
M204 S5000
G1 X79.381 Y80.964 E.00014
; LINE_WIDTH: 0.413028
G1 X79.482 Y80.706 E.00358
G1 X79.666 Y80.502 E.00354
; LINE_WIDTH: 0.417628
G1 X79.917 Y80.395 E.00357
; LINE_WIDTH: 0.418068
G1 X79.937 Y80.391 E.00027
; LINE_WIDTH: 0.417038
G1 X80.234 Y80.395 E.00388
; LINE_WIDTH: 0.396288
G1 X80.538 Y80.553 E.00423
; LINE_WIDTH: 0.404068
G1 X80.743 Y80.902 E.00511
G1 X80.759 Y81.029 E.0016
; LINE_WIDTH: 0.385048
G1 X80.719 Y81.299 E.00328
G1 X80.577 Y81.533 E.00328
G1 X80.331 Y81.705 E.0036
; LINE_WIDTH: 0.392888
G1 X80 Y81.753 E.00409
G1 X79.725 Y81.667 E.00353
; LINE_WIDTH: 0.399208
G1 X79.516 Y81.488 E.00342
G1 X79.396 Y81.24 E.00344
; LINE_WIDTH: 0.398268
G1 X79.385 Y81.036 E.00254
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y80.964 E-.02722
G1 X79.482 Y80.706 E-.10552
G1 X79.666 Y80.502 E-.1042
G1 X79.917 Y80.395 E-.10382
G1 X79.937 Y80.391 E-.00776
G1 X80.234 Y80.395 E-.11303
G1 X80.538 Y80.553 E-.13008
G1 X80.743 Y80.902 E-.15392
G1 X80.748 Y80.94 E-.01445
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.34 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.02
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 74/100
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 15
G1 X102.346 Y104.331 F42000
G1 Z6.02
G1 E.8 F1800
; LINE_WIDTH: 0.403508
G1 F1764
M204 S5000
G1 X102.263 Y104.4 E.00137
; LINE_WIDTH: 0.412268
G1 X101.889 Y104.557 E.00522
G1 X101.589 Y104.595 E.00389
; LINE_WIDTH: 0.410198
G1 X99.589 Y104.595 E.02562
; LINE_WIDTH: 0.409978
G1 X97.589 Y104.595 E.02561
; LINE_WIDTH: 0.409758
G1 X95.589 Y104.595 E.02559
; LINE_WIDTH: 0.409548
G1 X93.589 Y104.595 E.02558
; LINE_WIDTH: 0.409328
G1 X91.589 Y104.595 E.02556
; LINE_WIDTH: 0.409108
G1 X89.589 Y104.595 E.02555
; LINE_WIDTH: 0.408898
G1 X87.589 Y104.595 E.02554
; LINE_WIDTH: 0.408678
G1 X85.589 Y104.595 E.02552
; LINE_WIDTH: 0.408458
G1 X83.589 Y104.594 E.02551
; LINE_WIDTH: 0.408248
G1 X81.589 Y104.594 E.02549
; LINE_WIDTH: 0.408028
G1 X79.589 Y104.594 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.594 E.01514
; LINE_WIDTH: 0.407688
G1 X78.126 Y104.554 E.00353
; LINE_WIDTH: 0.405548
G1 X77.724 Y104.393 E.00547
; LINE_WIDTH: 0.411038
G1 X77.395 Y104.105 E.00562
; LINE_WIDTH: 0.415218
G1 X77.184 Y103.732 E.00556
G1 X77.105 Y103.295 E.00576
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.295 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.295 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.295 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.295 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.295 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.295 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.295 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.295 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.295 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.295 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.295 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.295 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.295 E.02553
; LINE_WIDTH: 0.408628
G3 X77.141 Y76.414 I3.755 J-.285 E.01127
; LINE_WIDTH: 0.412638
G1 X77.282 Y76.062 E.00489
G1 X77.456 Y75.828 E.00376
; LINE_WIDTH: 0.405118
G1 X77.742 Y75.598 E.00465
; LINE_WIDTH: 0.411968
G1 X78.111 Y75.443 E.00515
G1 X78.411 Y75.405 E.00389
; LINE_WIDTH: 0.410278
G1 X80.411 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.411 Y75.405 E.02561
; LINE_WIDTH: 0.409868
G1 X84.411 Y75.405 E.0256
; LINE_WIDTH: 0.409668
G1 X86.411 Y75.405 E.02559
; LINE_WIDTH: 0.409468
G1 X88.411 Y75.405 E.02557
; LINE_WIDTH: 0.409268
G1 X90.411 Y75.405 E.02556
; LINE_WIDTH: 0.409058
G1 X92.411 Y75.405 E.02555
; LINE_WIDTH: 0.408858
G1 X94.411 Y75.405 E.02553
; LINE_WIDTH: 0.408658
G1 X96.411 Y75.405 E.02552
; LINE_WIDTH: 0.408458
G1 X98.411 Y75.405 E.02551
; LINE_WIDTH: 0.408258
G1 X100.411 Y75.405 E.0255
; LINE_WIDTH: 0.408058
G1 X101.6 Y75.405 E.01515
; LINE_WIDTH: 0.407938
G1 X101.842 Y75.437 E.00311
; LINE_WIDTH: 0.408368
G1 X102.277 Y75.604 E.00594
; LINE_WIDTH: 0.413578
G1 X102.535 Y75.813 E.00429
G1 X102.769 Y76.147 E.00527
; LINE_WIDTH: 0.409978
G1 X102.894 Y76.646 E.00659
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
; LINE_WIDTH: 0.410688
G1 X102.858 Y103.585 E.004
; LINE_WIDTH: 0.410978
G1 X102.719 Y103.938 E.00486
G1 X102.555 Y104.157 E.00352
; LINE_WIDTH: 0.403508
G1 X102.392 Y104.292 E.00266
M204 S250
G1 X102.14 Y103.998 F42000
; LINE_WIDTH: 0.409278
G1 F1764
M204 S5000
G1 X102 Y104.108 E.00227
G1 X101.668 Y104.199 E.00441
; LINE_WIDTH: 0.410198
G1 X99.579 Y104.202 E.02676
; LINE_WIDTH: 0.409978
G1 X97.579 Y104.202 E.02561
; LINE_WIDTH: 0.409758
G1 X95.579 Y104.202 E.02559
; LINE_WIDTH: 0.409548
G1 X93.579 Y104.203 E.02558
; LINE_WIDTH: 0.409328
G1 X91.579 Y104.203 E.02556
; LINE_WIDTH: 0.409108
G1 X89.579 Y104.203 E.02555
; LINE_WIDTH: 0.408898
G1 X87.579 Y104.203 E.02554
; LINE_WIDTH: 0.408678
G1 X85.579 Y104.203 E.02552
; LINE_WIDTH: 0.408458
G1 X83.579 Y104.203 E.02551
; LINE_WIDTH: 0.408248
G1 X81.579 Y104.204 E.02549
; LINE_WIDTH: 0.408028
G1 X79.579 Y104.204 E.02548
; LINE_WIDTH: 0.407808
G1 X78.4 Y104.204 E.01501
; LINE_WIDTH: 0.411688
M73 P77 R3
G1 X78.114 Y104.15 E.00375
G1 X77.835 Y103.999 E.00408
; LINE_WIDTH: 0.403858
G1 X77.609 Y103.725 E.00447
; LINE_WIDTH: 0.408348
G1 X77.499 Y103.37 E.00474
; LINE_WIDTH: 0.410298
G3 X77.498 Y101.29 I85.326 J-1.088 E.02665
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.29 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.29 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.29 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.29 E.02559
; LINE_WIDTH: 0.409658
G1 X77.497 Y91.29 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.29 E.02558
; LINE_WIDTH: 0.409398
G1 X77.497 Y87.29 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.29 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.29 E.02555
; LINE_WIDTH: 0.409018
G1 X77.496 Y81.29 E.02554
; LINE_WIDTH: 0.408888
G1 X77.496 Y79.29 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.29 E.02553
; LINE_WIDTH: 0.408628
G3 X77.496 Y76.7 I9.781 J-.284 E.00753
; LINE_WIDTH: 0.407068
G1 X77.552 Y76.403 E.00383
; LINE_WIDTH: 0.405118
G1 X77.729 Y76.1 E.00444
; LINE_WIDTH: 0.408438
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.421 Y75.798 E.0054
G1 X80.421 Y75.798 E.02563
; LINE_WIDTH: 0.410068
G1 X82.421 Y75.798 E.02561
; LINE_WIDTH: 0.409868
G1 X84.421 Y75.798 E.0256
; LINE_WIDTH: 0.409668
G1 X86.421 Y75.798 E.02559
; LINE_WIDTH: 0.409468
G1 X88.421 Y75.797 E.02557
; LINE_WIDTH: 0.409268
G1 X90.421 Y75.797 E.02556
; LINE_WIDTH: 0.409058
G1 X92.421 Y75.797 E.02555
; LINE_WIDTH: 0.408858
G1 X94.421 Y75.797 E.02553
; LINE_WIDTH: 0.408658
G1 X96.421 Y75.797 E.02552
; LINE_WIDTH: 0.408458
G1 X98.421 Y75.796 E.02551
; LINE_WIDTH: 0.408258
G1 X100.421 Y75.796 E.0255
; LINE_WIDTH: 0.408048
G1 X101.6 Y75.796 E.01502
; LINE_WIDTH: 0.410048
G1 X101.832 Y75.83 E.00301
G1 X102.175 Y76.008 E.00495
G1 X102.402 Y76.292 E.00466
G1 X102.501 Y76.646 E.0047
; LINE_WIDTH: 0.409378
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
G1 X102.435 Y103.633 E.00464
; LINE_WIDTH: 0.403828
G1 X102.279 Y103.89 E.00379
; LINE_WIDTH: 0.409278
G1 X102.188 Y103.961 E.00148
; WIPE_START
G1 F12000
M204 S6000
G1 X102 Y104.108 E-.09042
G1 X101.668 Y104.199 E-.13102
G1 X100.251 Y104.201 E-.53856
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.085 Y97.806 Z6.42 F42000
G1 X85.21 Y81.112 Z6.42
G1 Z6.02
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1764
M204 S5000
G1 X85.028 Y80.76 E.00438
G1 X84.985 Y80.676 E.00105
; WIPE_START
G1 F12000
M204 S6000
G1 X85.028 Y80.76 E-.14689
G1 X85.21 Y81.112 E-.61311
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.644 Y81.771 Z6.42 F42000
G1 Z6.02
G1 E.8 F1800
; LINE_WIDTH: 0.620708
G1 F1764
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
G1 X82.222 Y82.7 Z6.42 F42000
G1 Z6.02
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1764
M204 S5000
G1 X82.031 Y82.352 E.00439
G1 X81.986 Y82.27 E.00104
; WIPE_START
G1 F12000
M204 S6000
G1 X82.031 Y82.352 E-.14512
G1 X82.222 Y82.7 E-.61488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.381 Y80.976 Z6.42 F42000
G1 Z6.02
G1 E.8 F1800
; LINE_WIDTH: 0.398228
G1 F1764
M204 S5000
G1 X79.381 Y80.97 E.00007
; LINE_WIDTH: 0.397008
G1 X79.531 Y80.635 E.00455
; LINE_WIDTH: 0.389508
G1 X79.753 Y80.452 E.0035
; LINE_WIDTH: 0.398988
G1 X80.015 Y80.37 E.00341
G1 X80.289 Y80.407 E.00344
; LINE_WIDTH: 0.394768
G1 X80.552 Y80.561 E.00375
; LINE_WIDTH: 0.404068
G1 X80.743 Y80.902 E.00494
G1 X80.761 Y81.056 E.00195
; LINE_WIDTH: 0.392888
G1 X80.685 Y81.381 E.00409
G1 X80.504 Y81.606 E.00353
; LINE_WIDTH: 0.392388
G1 X80.26 Y81.732 E.00336
G1 X79.986 Y81.753 E.00336
G1 X79.726 Y81.667 E.00336
; LINE_WIDTH: 0.399228
G1 X79.516 Y81.488 E.00343
G1 X79.396 Y81.24 E.00344
; LINE_WIDTH: 0.398228
G1 X79.384 Y81.036 E.00254
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y80.97 E-.0248
G1 X79.531 Y80.635 E-.13967
G1 X79.753 Y80.452 E-.1095
G1 X80.015 Y80.37 E-.10411
G1 X80.289 Y80.407 E-.10492
G1 X80.552 Y80.561 E-.11583
G1 X80.743 Y80.902 E-.1488
G1 X80.747 Y80.935 E-.01239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.42 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.1
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 75/100
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 15
G1 X102.342 Y104.332 F42000
G1 Z6.1
G1 E.8 F1800
; LINE_WIDTH: 0.403298
G1 F1759
M204 S5000
G1 X102.262 Y104.4 E.00132
; LINE_WIDTH: 0.411508
G1 X101.871 Y104.562 E.00545
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
; LINE_WIDTH: 0.408448
G1 X78.327 Y104.59 E.00093
G1 X77.837 Y104.458 E.00648
; LINE_WIDTH: 0.403928
G1 X77.52 Y104.24 E.00485
; LINE_WIDTH: 0.410918
G1 X77.247 Y103.876 E.00584
G1 X77.182 Y103.709 E.0023
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.291 E.00543
G1 X77.104 Y77.291 E.33172
G3 X77.141 Y76.413 I3.743 J-.284 E.01124
; LINE_WIDTH: 0.412758
G1 X77.272 Y76.079 E.00463
G1 X77.457 Y75.83 E.00399
; LINE_WIDTH: 0.403668
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.410258
G1 X78.147 Y75.434 E.00555
G1 X78.41 Y75.405 E.00338
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409868
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409668
G1 X86.41 Y75.405 E.02559
; LINE_WIDTH: 0.409458
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409258
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.409058
G1 X92.41 Y75.405 E.02555
; LINE_WIDTH: 0.408858
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408648
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408448
G1 X98.41 Y75.405 E.02551
; LINE_WIDTH: 0.408248
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.408048
G1 X101.6 Y75.405 E.01517
; LINE_WIDTH: 0.407928
G1 X101.842 Y75.437 E.00311
; LINE_WIDTH: 0.408328
G1 X102.276 Y75.604 E.00594
; LINE_WIDTH: 0.412998
G1 X102.577 Y75.862 E.00511
G1 X102.787 Y76.191 E.00504
; LINE_WIDTH: 0.412508
G1 X102.894 Y76.646 E.00602
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
G1 X102.894 Y103.3 E.00832
; LINE_WIDTH: 0.412478
G1 X102.816 Y103.737 E.00573
G1 X102.592 Y104.12 E.00571
; LINE_WIDTH: 0.403298
G1 X102.388 Y104.294 E.00337
M204 S250
G1 X102.162 Y103.982 F42000
; LINE_WIDTH: 0.409108
G1 F1759
M204 S5000
G1 X102 Y104.108 E.00262
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
G1 X77.985 Y104.099 E.00544
; LINE_WIDTH: 0.407368
G1 X77.734 Y103.905 E.00404
G1 X77.543 Y103.572 E.00489
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.283 E.00373
G1 X77.496 Y76.724 E.33885
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.403678
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.407978
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.419 Y75.798 E.00537
G1 X80.419 Y75.798 E.02563
; LINE_WIDTH: 0.410068
G1 X82.419 Y75.798 E.02561
; LINE_WIDTH: 0.409868
G1 X84.419 Y75.798 E.0256
; LINE_WIDTH: 0.409668
M73 P78 R3
G1 X86.419 Y75.798 E.02559
; LINE_WIDTH: 0.409458
G1 X88.419 Y75.797 E.02557
; LINE_WIDTH: 0.409258
G1 X90.419 Y75.797 E.02556
; LINE_WIDTH: 0.409058
G1 X92.419 Y75.797 E.02555
; LINE_WIDTH: 0.408858
G1 X94.419 Y75.797 E.02553
; LINE_WIDTH: 0.408648
G1 X96.419 Y75.797 E.02552
; LINE_WIDTH: 0.408448
G1 X98.419 Y75.796 E.02551
; LINE_WIDTH: 0.408248
G1 X100.419 Y75.796 E.02549
; LINE_WIDTH: 0.408038
G1 X101.6 Y75.796 E.01505
; LINE_WIDTH: 0.410088
G1 X101.833 Y75.83 E.00301
G1 X102.174 Y76.009 E.00494
; LINE_WIDTH: 0.406498
G1 X102.398 Y76.284 E.00449
; LINE_WIDTH: 0.409378
G1 X102.501 Y76.646 E.00482
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
G1 X102.504 Y103.3 E.00832
; LINE_WIDTH: 0.412478
G1 X102.449 Y103.586 E.00375
G1 X102.279 Y103.891 E.0045
; LINE_WIDTH: 0.409108
G1 X102.209 Y103.945 E.00113
; WIPE_START
G1 F12000
M204 S6000
G1 X102 Y104.108 E-.1008
G1 X101.58 Y104.202 E-.16351
G1 X100.276 Y104.202 E-.49569
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.105 Y97.81 Z6.5 F42000
G1 X85.21 Y81.112 Z6.5
G1 Z6.1
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1759
M204 S5000
G1 X85.028 Y80.759 E.00439
G1 X84.985 Y80.676 E.00104
; WIPE_START
G1 F12000
M204 S6000
G1 X85.028 Y80.759 E-.14565
G1 X85.21 Y81.112 E-.61435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1759
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
G1 X82.222 Y82.7 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1759
M204 S5000
G1 X82.031 Y82.353 E.00439
G1 X81.986 Y82.27 E.00104
; WIPE_START
G1 F12000
M204 S6000
G1 X82.031 Y82.353 E-.14556
G1 X82.222 Y82.7 E-.61444
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.406 Y80.91 Z6.5 F42000
G1 Z6.1
G1 E.8 F1800
; LINE_WIDTH: 0.398268
G1 F1759
M204 S5000
G1 X79.407 Y80.877 E.0004
; LINE_WIDTH: 0.389228
G1 X79.54 Y80.623 E.00348
; LINE_WIDTH: 0.385968
G1 X79.753 Y80.452 E.00329
; LINE_WIDTH: 0.398968
G1 X80.015 Y80.37 E.00341
G1 X80.288 Y80.407 E.00343
; LINE_WIDTH: 0.394768
G1 X80.552 Y80.561 E.00376
; LINE_WIDTH: 0.404088
G1 X80.743 Y80.902 E.00494
G1 X80.761 Y81.056 E.00195
; LINE_WIDTH: 0.392848
G1 X80.685 Y81.381 E.00408
G1 X80.505 Y81.605 E.00353
; LINE_WIDTH: 0.392368
G1 X80.26 Y81.732 E.00336
G1 X79.986 Y81.753 E.00336
; LINE_WIDTH: 0.399148
G1 X79.724 Y81.67 E.00342
G1 X79.517 Y81.488 E.00344
; LINE_WIDTH: 0.398268
G1 X79.396 Y81.24 E.00343
G1 X79.404 Y80.97 E.00336
; WIPE_START
G1 F12000
M204 S6000
G1 X79.407 Y80.877 E-.03509
G1 X79.54 Y80.623 E-.10911
G1 X79.753 Y80.452 E-.10388
G1 X80.015 Y80.37 E-.10415
G1 X80.288 Y80.407 E-.1048
G1 X80.552 Y80.561 E-.11605
G1 X80.743 Y80.902 E-.14873
G1 X80.755 Y81.002 E-.03819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.5 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.18
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 76/100
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 15
G1 X102.34 Y104.339 F42000
G1 Z6.18
G1 E.8 F1800
; LINE_WIDTH: 0.403768
G1 F1764
M204 S5000
G1 X102.287 Y104.386 E.0009
; LINE_WIDTH: 0.411018
G1 X101.87 Y104.561 E.0058
G1 X101.59 Y104.595 E.00362
; LINE_WIDTH: 0.410208
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
G1 X78.033 Y104.535 E.00506
; LINE_WIDTH: 0.408398
G1 X77.635 Y104.331 E.0057
; LINE_WIDTH: 0.406168
G1 X77.351 Y104.045 E.00511
; LINE_WIDTH: 0.413728
G1 X77.157 Y103.636 E.00585
G1 X77.105 Y103.287 E.00456
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.287 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.287 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.287 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.287 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.287 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.287 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.287 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.287 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.287 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.287 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.287 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.287 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.287 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00719
G1 X77.187 Y76.276 E.00581
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
; LINE_WIDTH: 0.408298
G1 X102.276 Y75.604 E.00593
; LINE_WIDTH: 0.412978
G1 X102.577 Y75.862 E.00512
G1 X102.787 Y76.192 E.00505
; LINE_WIDTH: 0.412568
G1 X102.894 Y76.646 E.00601
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
G1 X102.896 Y103.276 E.03355
G1 X102.829 Y103.683 E.00527
; LINE_WIDTH: 0.405408
G1 X102.611 Y104.095 E.00589
; LINE_WIDTH: 0.403768
G1 X102.385 Y104.299 E.00384
M204 S250
G1 X102.144 Y103.995 F42000
; LINE_WIDTH: 0.406928
G1 F1764
M204 S5000
G1 X101.999 Y104.106 E.00231
; LINE_WIDTH: 0.405928
G1 X101.668 Y104.2 E.00436
; LINE_WIDTH: 0.410208
G3 X99.58 Y104.202 I-1.092 J-42.547 E.02675
; LINE_WIDTH: 0.410068
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409928
G1 X95.58 Y104.202 E.0256
; LINE_WIDTH: 0.409788
G1 X93.58 Y104.203 E.02559
; LINE_WIDTH: 0.409648
G1 X91.58 Y104.203 E.02559
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
G1 X78.182 Y104.174 E.00311
; LINE_WIDTH: 0.408398
G1 X77.835 Y103.999 E.00496
; LINE_WIDTH: 0.404868
G1 X77.608 Y103.725 E.00449
G1 X77.501 Y103.37 E.00469
; LINE_WIDTH: 0.410298
G1 X77.498 Y101.275 E.02684
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
G1 X77.543 Y76.422 E.00391
; LINE_WIDTH: 0.411258
G1 X77.752 Y76.078 E.00517
G1 X78.01 Y75.89 E.00409
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
; LINE_WIDTH: 0.410128
G1 X101.833 Y75.83 E.00301
G1 X102.174 Y76.009 E.00493
; LINE_WIDTH: 0.406438
G1 X102.397 Y76.283 E.00449
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
M73 P79 R3
G1 X102.504 Y103.276 E.03355
G1 X102.464 Y103.548 E.00352
; LINE_WIDTH: 0.406928
G1 X102.279 Y103.891 E.00496
G1 X102.191 Y103.959 E.0014
; WIPE_START
G1 F12000
M204 S6000
G1 X101.999 Y104.106 E-.09195
G1 X101.668 Y104.2 E-.1307
G1 X100.254 Y104.201 E-.53735
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.087 Y97.806 Z6.58 F42000
G1 X85.21 Y81.112 Z6.58
G1 Z6.18
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1764
M204 S5000
G1 X85.028 Y80.759 E.0044
G1 X84.985 Y80.676 E.00103
; WIPE_START
G1 F12000
M204 S6000
G1 X85.028 Y80.759 E-.14472
G1 X85.21 Y81.112 E-.61528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.58 F42000
G1 Z6.18
G1 E.8 F1800
; LINE_WIDTH: 0.500138
G1 F1764
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
G1 X82.222 Y82.7 Z6.58 F42000
G1 Z6.18
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1764
M204 S5000
G1 X82.032 Y82.353 E.00439
G1 X81.986 Y82.27 E.00104
; WIPE_START
G1 F12000
M204 S6000
G1 X82.032 Y82.353 E-.14614
G1 X82.222 Y82.7 E-.61386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.388 Y80.955 Z6.58 F42000
G1 Z6.18
G1 E.8 F1800
; LINE_WIDTH: 0.388688
G1 F1764
M204 S5000
G1 X79.388 Y80.95 E.00006
; LINE_WIDTH: 0.387628
G1 X79.532 Y80.635 E.00419
G1 X79.753 Y80.452 E.00346
; LINE_WIDTH: 0.395908
G1 X80.015 Y80.372 E.00338
G1 X80.288 Y80.407 E.0034
; LINE_WIDTH: 0.394788
G1 X80.552 Y80.561 E.00376
; LINE_WIDTH: 0.404088
G1 X80.743 Y80.902 E.00494
G1 X80.759 Y81.029 E.00161
; LINE_WIDTH: 0.385028
G1 X80.719 Y81.299 E.00328
G1 X80.559 Y81.553 E.0036
; LINE_WIDTH: 0.392928
G1 X80.273 Y81.726 E.00409
; LINE_WIDTH: 0.404288
G1 X80.02 Y81.759 E.00321
; LINE_WIDTH: 0.405828
G1 X79.787 Y81.698 E.00306
G1 X79.562 Y81.537 E.00351
; LINE_WIDTH: 0.405268
G1 X79.4 Y81.238 E.0043
; LINE_WIDTH: 0.388688
G1 X79.391 Y81.015 E.0027
; WIPE_START
G1 F12000
M204 S6000
G1 X79.388 Y80.95 E-.02477
G1 X79.532 Y80.635 E-.13189
G1 X79.753 Y80.452 E-.1089
G1 X80.015 Y80.372 E-.1041
G1 X80.288 Y80.407 E-.10464
G1 X80.552 Y80.561 E-.11595
G1 X80.743 Y80.902 E-.14876
G1 X80.75 Y80.957 E-.02098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.58 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.26
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 77/100
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; OBJECT_ID: 15
G1 X102.329 Y104.35 F42000
G1 Z6.26
G1 E.8 F1800
; LINE_WIDTH: 0.403818
G1 F1759
M204 S5000
G1 X102.287 Y104.387 E.00071
; LINE_WIDTH: 0.410988
G1 X101.87 Y104.561 E.0058
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
; LINE_WIDTH: 0.415498
G3 X77.792 Y104.443 I.042 J-1.558 E.00851
; LINE_WIDTH: 0.407818
G1 X77.397 Y104.108 E.00658
; LINE_WIDTH: 0.403488
G1 X77.205 Y103.777 E.00483
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.285 E.00641
G1 X77.104 Y77.285 E.33172
G3 X77.141 Y76.413 I3.718 J-.28 E.01116
; LINE_WIDTH: 0.412748
G1 X77.273 Y76.078 E.00465
G1 X77.457 Y75.83 E.00398
; LINE_WIDTH: 0.403738
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.411878
G1 X78.113 Y75.442 E.00513
G1 X78.411 Y75.405 E.00385
; LINE_WIDTH: 0.410278
G1 X80.411 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.411 Y75.405 E.02561
; LINE_WIDTH: 0.409868
G1 X84.411 Y75.405 E.0256
; LINE_WIDTH: 0.409658
G1 X86.411 Y75.405 E.02559
; LINE_WIDTH: 0.409458
G1 X88.411 Y75.405 E.02557
; LINE_WIDTH: 0.409248
G1 X90.411 Y75.405 E.02556
; LINE_WIDTH: 0.409048
G1 X92.411 Y75.405 E.02555
; LINE_WIDTH: 0.408838
G1 X94.411 Y75.405 E.02553
; LINE_WIDTH: 0.408638
G1 X96.411 Y75.405 E.02552
; LINE_WIDTH: 0.408438
G1 X98.411 Y75.405 E.02551
; LINE_WIDTH: 0.408228
G1 X100.411 Y75.405 E.02549
; LINE_WIDTH: 0.408028
G1 X101.6 Y75.405 E.01515
; LINE_WIDTH: 0.407908
G1 X101.842 Y75.436 E.0031
; LINE_WIDTH: 0.408248
G1 X102.275 Y75.604 E.00593
; LINE_WIDTH: 0.412968
G1 X102.577 Y75.862 E.00513
G1 X102.788 Y76.192 E.00505
; LINE_WIDTH: 0.412628
G1 X102.894 Y76.646 E.006
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
G1 X102.887 Y103.371 E.03478
; LINE_WIDTH: 0.405608
G1 X102.791 Y103.787 E.0054
; LINE_WIDTH: 0.405038
G1 X102.574 Y104.138 E.00522
; LINE_WIDTH: 0.403818
G1 X102.375 Y104.311 E.00333
M204 S250
G1 X102.123 Y104.014 F42000
; LINE_WIDTH: 0.411288
G1 F1759
M204 S5000
G1 X101.999 Y104.106 E.00199
; LINE_WIDTH: 0.405898
G1 X101.668 Y104.2 E.00435
; LINE_WIDTH: 0.410198
G3 X99.58 Y104.202 I-1.093 J-42.578 E.02675
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
G1 X77.992 Y104.105 E.00566
; LINE_WIDTH: 0.407818
G1 X77.683 Y103.845 E.00514
; LINE_WIDTH: 0.407358
G1 X77.541 Y103.572 E.00392
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.271 E.00389
G1 X77.496 Y79.271 E.3062
G3 X77.496 Y76.7 I503.312 J-1.136 E.0328
; LINE_WIDTH: 0.407078
G1 X77.552 Y76.403 E.00384
; LINE_WIDTH: 0.403738
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.408418
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.421 Y75.798 E.0054
G1 X80.421 Y75.798 E.02563
; LINE_WIDTH: 0.410068
G1 X82.421 Y75.798 E.02561
; LINE_WIDTH: 0.409868
G1 X84.421 Y75.798 E.0256
; LINE_WIDTH: 0.409658
G1 X86.421 Y75.798 E.02559
; LINE_WIDTH: 0.409458
G1 X88.421 Y75.797 E.02557
; LINE_WIDTH: 0.409248
G1 X90.421 Y75.797 E.02556
; LINE_WIDTH: 0.409048
G1 X92.421 Y75.797 E.02555
; LINE_WIDTH: 0.408838
G1 X94.421 Y75.797 E.02553
; LINE_WIDTH: 0.408638
G1 X96.421 Y75.797 E.02552
; LINE_WIDTH: 0.408428
G1 X98.421 Y75.796 E.02551
; LINE_WIDTH: 0.408228
G1 X100.421 Y75.796 E.02549
; LINE_WIDTH: 0.408028
G1 X101.6 Y75.796 E.01502
; LINE_WIDTH: 0.410158
G1 X101.833 Y75.83 E.00301
G1 X102.173 Y76.008 E.00493
; LINE_WIDTH: 0.406408
G1 X102.397 Y76.283 E.0045
; LINE_WIDTH: 0.409388
G1 X102.501 Y76.646 E.00483
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
G1 X102.504 Y103.276 E.03355
G1 X102.44 Y103.624 E.00452
; LINE_WIDTH: 0.411288
G1 X102.246 Y103.922 E.00457
G1 X102.171 Y103.978 E.0012
; WIPE_START
G1 F12000
M204 S6000
G1 X101.999 Y104.106 E-.08169
G1 X101.668 Y104.2 E-.13054
G1 X100.227 Y104.201 E-.54777
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.065 Y97.803 Z6.66 F42000
G1 X85.21 Y81.112 Z6.66
G1 Z6.26
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1759
M204 S5000
G1 X85.028 Y80.759 E.00439
G1 X84.985 Y80.676 E.00104
; WIPE_START
G1 F12000
M204 S6000
G1 X85.028 Y80.759 E-.14529
G1 X85.21 Y81.112 E-.61471
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.546 Y79.706 Z6.66 F42000
G1 Z6.26
G1 E.8 F1800
; LINE_WIDTH: 0.500158
G1 F1759
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
G1 X82.222 Y82.7 Z6.66 F42000
G1 Z6.26
G1 E.8 F1800
; LINE_WIDTH: 0.357168
G1 F1759
M204 S5000
G1 X82.031 Y82.352 E.0044
G1 X81.986 Y82.27 E.00103
; WIPE_START
G1 F12000
M204 S6000
G1 X82.031 Y82.352 E-.14434
G1 X82.222 Y82.7 E-.61566
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.381 Y80.972 Z6.66 F42000
M73 P80 R3
G1 Z6.26
G1 E.8 F1800
; LINE_WIDTH: 0.398268
G1 F1759
M204 S5000
G1 X79.381 Y80.964 E.0001
G1 X79.474 Y80.705 E.00343
G1 X79.741 Y80.459 E.00451
; LINE_WIDTH: 0.398968
G1 X80.015 Y80.37 E.00358
G1 X80.288 Y80.407 E.00343
; LINE_WIDTH: 0.394808
G1 X80.552 Y80.561 E.00375
; LINE_WIDTH: 0.404088
G1 X80.743 Y80.902 E.00494
G1 X80.759 Y81.029 E.0016
; LINE_WIDTH: 0.385048
G1 X80.711 Y81.325 E.0036
; LINE_WIDTH: 0.392888
G1 X80.514 Y81.595 E.00409
G1 X80.26 Y81.732 E.00353
; LINE_WIDTH: 0.392368
G1 X79.986 Y81.753 E.00336
G1 X79.726 Y81.667 E.00336
; LINE_WIDTH: 0.399248
G1 X79.516 Y81.488 E.00342
G1 X79.396 Y81.24 E.00344
; LINE_WIDTH: 0.398268
G1 X79.385 Y81.032 E.00259
; WIPE_START
G1 F12000
M204 S6000
G1 X79.381 Y80.964 E-.0258
G1 X79.474 Y80.705 E-.10481
G1 X79.741 Y80.459 E-.13792
G1 X80.015 Y80.37 E-.10926
G1 X80.288 Y80.407 E-.10487
G1 X80.552 Y80.561 E-.11583
G1 X80.743 Y80.902 E-.14886
G1 X80.747 Y80.935 E-.01266
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.66 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.34
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 78/100
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; OBJECT_ID: 15
G1 X102.322 Y104.349 F42000
G1 Z6.34
G1 E.8 F1800
; LINE_WIDTH: 0.403258
G1 F1712
M204 S5000
G1 X102.261 Y104.401 E.001
; LINE_WIDTH: 0.412088
G1 X101.886 Y104.558 E.00524
G1 X101.589 Y104.595 E.00385
; LINE_WIDTH: 0.410208
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
G1 X78.424 Y104.596 E.01487
; LINE_WIDTH: 0.415338
G3 X77.782 Y104.431 I.031 J-1.452 E.00868
; LINE_WIDTH: 0.408918
G1 X77.411 Y104.126 E.00614
; LINE_WIDTH: 0.405138
G1 X77.183 Y103.72 E.00587
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00559
G1 X77.104 Y76.724 E.33893
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.413568
G1 X77.998 Y75.476 E.00429
G1 X78.415 Y75.405 E.00547
; LINE_WIDTH: 0.410278
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409858
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409658
G1 X86.415 Y75.405 E.02559
; LINE_WIDTH: 0.409448
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409248
G1 X90.415 Y75.405 E.02556
; LINE_WIDTH: 0.409038
G1 X92.415 Y75.405 E.02555
; LINE_WIDTH: 0.408838
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408628
G1 X96.415 Y75.405 E.02552
; LINE_WIDTH: 0.408428
G1 X98.415 Y75.405 E.02551
; LINE_WIDTH: 0.408218
G1 X100.415 Y75.405 E.02549
; LINE_WIDTH: 0.408018
G1 X101.6 Y75.405 E.0151
; LINE_WIDTH: 0.407898
G1 X101.937 Y75.455 E.00433
; LINE_WIDTH: 0.414838
G1 X102.29 Y75.615 E.00503
G1 X102.536 Y75.818 E.00413
; LINE_WIDTH: 0.407438
G1 X102.777 Y76.17 E.00542
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00627
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.3 E.33858
; LINE_WIDTH: 0.412408
G1 X102.816 Y103.738 E.00573
G1 X102.591 Y104.121 E.00572
; LINE_WIDTH: 0.403258
G1 X102.368 Y104.31 E.00368
M204 S250
G1 X102.141 Y103.998 F42000
; LINE_WIDTH: 0.409128
G1 F1712
M204 S5000
G1 X101.999 Y104.108 E.00229
G1 X101.668 Y104.199 E.00438
; LINE_WIDTH: 0.410208
G1 X99.579 Y104.202 E.02676
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
G1 X81.579 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.579 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.204 E.01474
G1 X78.024 Y104.118 E.00522
; LINE_WIDTH: 0.402728
G1 X77.685 Y103.845 E.00548
; LINE_WIDTH: 0.405158
G1 X77.542 Y103.572 E.00389
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.28 E.00377
G1 X77.496 Y76.724 E.33881
G1 X77.531 Y76.457 E.00344
; LINE_WIDTH: 0.406858
G1 X77.729 Y76.1 E.00518
G1 X78.01 Y75.889 E.00446
; LINE_WIDTH: 0.405398
G1 X78.33 Y75.802 E.00421
; LINE_WIDTH: 0.410278
G1 X80.429 Y75.798 E.0269
; LINE_WIDTH: 0.410068
G1 X82.429 Y75.798 E.02561
; LINE_WIDTH: 0.409858
G1 X84.429 Y75.798 E.0256
; LINE_WIDTH: 0.409658
G1 X86.429 Y75.798 E.02559
; LINE_WIDTH: 0.409448
G1 X88.429 Y75.797 E.02557
; LINE_WIDTH: 0.409248
G1 X90.429 Y75.797 E.02556
; LINE_WIDTH: 0.409038
G1 X92.429 Y75.797 E.02555
; LINE_WIDTH: 0.408838
G1 X94.429 Y75.797 E.02553
; LINE_WIDTH: 0.408628
G1 X96.429 Y75.797 E.02552
; LINE_WIDTH: 0.408428
G1 X98.429 Y75.796 E.02551
; LINE_WIDTH: 0.408218
G1 X100.429 Y75.796 E.02549
; LINE_WIDTH: 0.408018
G1 X101.6 Y75.796 E.01491
; LINE_WIDTH: 0.407898
G1 X101.941 Y75.869 E.00444
; LINE_WIDTH: 0.405608
G1 X102.259 Y76.087 E.00488
; LINE_WIDTH: 0.407478
G1 X102.431 Y76.354 E.00404
; LINE_WIDTH: 0.407678
G1 X102.504 Y76.7 E.0045
G1 X102.504 Y103.3 E.33858
; LINE_WIDTH: 0.412408
G1 X102.449 Y103.586 E.00375
G1 X102.278 Y103.892 E.00451
; LINE_WIDTH: 0.409128
G1 X102.188 Y103.961 E.00145
; WIPE_START
G1 F12000
M204 S6000
G1 X101.999 Y104.108 E-.09104
G1 X101.668 Y104.199 E-.13026
G1 X100.251 Y104.201 E-.5387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.754 Y98.034 Z6.74 F42000
G1 X82.968 Y80.5 Z6.74
G1 Z6.34
G1 E.8 F1800
; LINE_WIDTH: 0.500008
G1 F1712
M204 S5000
G1 X82.546 Y79.706 E.01416
; WIPE_START
G1 F12000
M204 S6000
G1 X82.968 Y80.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.407 Y80.893 Z6.74 F42000
G1 Z6.34
G1 E.8 F1800
; LINE_WIDTH: 0.396228
G1 F1712
M204 S5000
G1 X79.408 Y80.873 E.00025
; LINE_WIDTH: 0.388068
G1 X79.54 Y80.623 E.00341
; LINE_WIDTH: 0.385968
G1 X79.753 Y80.452 E.00329
; LINE_WIDTH: 0.416828
G1 X80.031 Y80.38 E.00374
; LINE_WIDTH: 0.418108
G1 X80.054 Y80.378 E.0003
; LINE_WIDTH: 0.417618
G1 X80.323 Y80.42 E.00355
; LINE_WIDTH: 0.406108
G1 X80.548 Y80.564 E.00338
; LINE_WIDTH: 0.404608
G1 X80.747 Y80.901 E.00494
; LINE_WIDTH: 0.398288
G1 X80.759 Y81.166 E.00329
G1 X80.666 Y81.425 E.00343
G1 X80.399 Y81.671 E.00451
; LINE_WIDTH: 0.389228
G1 X80.124 Y81.753 E.00348
G1 X79.852 Y81.722 E.00332
; LINE_WIDTH: 0.392888
G1 X79.551 Y81.522 E.00442
; LINE_WIDTH: 0.396228
G1 X79.392 Y81.214 E.00427
G1 X79.404 Y80.953 E.00324
; WIPE_START
G1 F12000
M204 S6000
G1 X79.408 Y80.873 E-.03049
G1 X79.54 Y80.623 E-.10718
G1 X79.753 Y80.452 E-.10404
G1 X80.031 Y80.38 E-.10923
G1 X80.054 Y80.378 E-.0088
G1 X80.323 Y80.42 E-.10338
G1 X80.548 Y80.564 E-.10145
G1 X80.747 Y80.901 E-.14877
G1 X80.753 Y81.024 E-.04667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.74 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.42
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 79/100
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; OBJECT_ID: 15
G1 X102.327 Y104.36 F42000
G1 Z6.42
G1 E.8 F1800
; LINE_WIDTH: 0.407738
G1 F1711
M204 S5000
G1 X102.312 Y104.374 E.00027
; LINE_WIDTH: 0.413888
G1 X102.016 Y104.519 E.00426
G1 X101.585 Y104.595 E.00566
; LINE_WIDTH: 0.410208
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
G1 X78.329 Y104.587 E.01603
; LINE_WIDTH: 0.405628
G1 X77.888 Y104.482 E.00573
; LINE_WIDTH: 0.404408
M73 P81 R3
G1 X77.561 Y104.273 E.0049
; LINE_WIDTH: 0.415328
G1 X77.31 Y103.986 E.00494
G1 X77.17 Y103.681 E.00437
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.287 E.00509
G1 X77.104 Y77.287 E.33172
G3 X77.141 Y76.413 I3.721 J-.281 E.01118
; LINE_WIDTH: 0.412738
G1 X77.274 Y76.077 E.00467
G1 X77.457 Y75.83 E.00396
; LINE_WIDTH: 0.403778
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.411288
G1 X78.13 Y75.438 E.00533
G1 X78.41 Y75.405 E.00363
; LINE_WIDTH: 0.410278
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409858
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409658
G1 X86.41 Y75.405 E.02559
; LINE_WIDTH: 0.409448
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409238
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.409038
G1 X92.41 Y75.405 E.02555
; LINE_WIDTH: 0.408828
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408628
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408418
G1 X98.41 Y75.405 E.02551
; LINE_WIDTH: 0.408208
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.408008
G1 X101.6 Y75.405 E.01516
; LINE_WIDTH: 0.407888
G1 X101.841 Y75.436 E.00309
; LINE_WIDTH: 0.408158
G1 X102.274 Y75.603 E.00592
; LINE_WIDTH: 0.412938
G1 X102.577 Y75.862 E.00514
G1 X102.788 Y76.194 E.00507
; LINE_WIDTH: 0.412768
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
G1 X102.818 Y103.715 E.0057
; LINE_WIDTH: 0.406468
G1 X102.615 Y104.086 E.00536
; LINE_WIDTH: 0.407738
G1 X102.371 Y104.318 E.00429
M204 S250
G1 X102.148 Y103.992 F42000
; LINE_WIDTH: 0.406148
G1 F1711
M204 S5000
G1 X101.998 Y104.107 E.0024
; LINE_WIDTH: 0.406008
G1 X101.668 Y104.198 E.00434
; LINE_WIDTH: 0.410208
G1 X99.57 Y104.202 E.02689
; LINE_WIDTH: 0.410068
G1 X97.57 Y104.202 E.02561
; LINE_WIDTH: 0.409928
G1 X95.57 Y104.202 E.0256
; LINE_WIDTH: 0.409788
G1 X93.57 Y104.203 E.02559
; LINE_WIDTH: 0.409648
G1 X91.57 Y104.203 E.02559
; LINE_WIDTH: 0.409508
G1 X89.57 Y104.203 E.02558
; LINE_WIDTH: 0.409368
G1 X87.57 Y104.203 E.02557
; LINE_WIDTH: 0.409228
G1 X85.57 Y104.204 E.02556
; LINE_WIDTH: 0.409088
G1 X83.57 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.57 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.57 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.204 E.01462
G1 X77.985 Y104.1 E.00576
; LINE_WIDTH: 0.407378
G1 X77.734 Y103.905 E.00403
; LINE_WIDTH: 0.410008
G1 X77.534 Y103.541 E.00532
G1 X77.496 Y103.274 E.00346
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.33873
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.403778
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.408228
M73 P81 R2
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.42 Y75.798 E.00539
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.410068
G1 X82.42 Y75.798 E.02561
; LINE_WIDTH: 0.409858
G1 X84.42 Y75.798 E.0256
; LINE_WIDTH: 0.409658
G1 X86.42 Y75.798 E.02559
; LINE_WIDTH: 0.409448
G1 X88.42 Y75.797 E.02557
; LINE_WIDTH: 0.409238
G1 X90.42 Y75.797 E.02556
; LINE_WIDTH: 0.409038
G1 X92.42 Y75.797 E.02555
; LINE_WIDTH: 0.408828
G1 X94.42 Y75.797 E.02553
; LINE_WIDTH: 0.408628
G1 X96.42 Y75.797 E.02552
; LINE_WIDTH: 0.408418
G1 X98.42 Y75.796 E.02551
; LINE_WIDTH: 0.408208
G1 X100.42 Y75.796 E.02549
; LINE_WIDTH: 0.408008
G1 X101.6 Y75.796 E.01503
; LINE_WIDTH: 0.410228
G1 X101.833 Y75.83 E.00301
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
G1 X102.462 Y103.559 E.00365
; LINE_WIDTH: 0.406468
G1 X102.278 Y103.892 E.00483
; LINE_WIDTH: 0.406148
G1 X102.196 Y103.955 E.00131
; WIPE_START
G1 F12000
M204 S6000
G1 X101.998 Y104.107 E-.09468
G1 X101.668 Y104.198 E-.12999
G1 X100.26 Y104.201 E-.53534
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.761 Y98.035 Z6.82 F42000
G1 X82.968 Y80.5 Z6.82
G1 Z6.42
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
G1 X79.388 Y80.956 Z6.82 F42000
G1 Z6.42
G1 E.8 F1800
; LINE_WIDTH: 0.388668
G1 F1711
M204 S5000
G1 X79.388 Y80.95 E.00007
; LINE_WIDTH: 0.387608
G1 X79.532 Y80.635 E.00419
G1 X79.753 Y80.452 E.00346
; LINE_WIDTH: 0.395888
G1 X80.015 Y80.372 E.00338
G1 X80.289 Y80.407 E.0034
; LINE_WIDTH: 0.394808
G1 X80.552 Y80.561 E.00375
; LINE_WIDTH: 0.410028
G1 X80.74 Y80.903 E.00501
G1 X80.759 Y81.117 E.00274
; LINE_WIDTH: 0.392968
G1 X80.68 Y81.394 E.00354
; LINE_WIDTH: 0.392388
G1 X80.504 Y81.606 E.00336
G1 X80.26 Y81.732 E.00336
; LINE_WIDTH: 0.404268
G1 X80.02 Y81.759 E.00304
; LINE_WIDTH: 0.405828
G1 X79.787 Y81.698 E.00306
G1 X79.562 Y81.537 E.00351
; LINE_WIDTH: 0.405228
G1 X79.4 Y81.238 E.0043
; LINE_WIDTH: 0.388668
G1 X79.391 Y81.016 E.00269
; WIPE_START
G1 F12000
M204 S6000
G1 X79.388 Y80.95 E-.02492
G1 X79.532 Y80.635 E-.13194
G1 X79.753 Y80.452 E-.10901
G1 X80.015 Y80.372 E-.10397
G1 X80.289 Y80.407 E-.10473
G1 X80.552 Y80.561 E-.11581
G1 X80.74 Y80.903 E-.14856
G1 X80.745 Y80.958 E-.02106
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.82 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.5
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 80/100
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; OBJECT_ID: 15
G1 X102.315 Y104.362 F42000
G1 Z6.5
G1 E.8 F1800
; LINE_WIDTH: 0.403858
G1 F1711
M204 S5000
G1 X102.286 Y104.387 E.00048
; LINE_WIDTH: 0.410968
G1 X101.87 Y104.561 E.00578
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
G1 X78.424 Y104.596 E.01487
; LINE_WIDTH: 0.410728
G1 X78.114 Y104.558 E.00401
; LINE_WIDTH: 0.414228
G1 X77.776 Y104.425 E.00469
G1 X77.464 Y104.187 E.00509
; LINE_WIDTH: 0.408278
G1 X77.207 Y103.788 E.00605
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.289 E.0065
G1 X77.104 Y77.289 E.33172
G3 X77.141 Y76.413 I3.731 J-.282 E.01121
; LINE_WIDTH: 0.412718
G1 X77.274 Y76.076 E.00468
G1 X77.457 Y75.83 E.00395
; LINE_WIDTH: 0.403788
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.411308
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
; LINE_WIDTH: 0.409448
M73 P82 R2
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409238
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.409028
G1 X92.41 Y75.405 E.02555
; LINE_WIDTH: 0.408828
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408618
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408408
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408208
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.407998
G1 X101.6 Y75.405 E.01516
; LINE_WIDTH: 0.407878
G1 X101.841 Y75.436 E.00309
; LINE_WIDTH: 0.408138
G1 X102.274 Y75.603 E.00591
; LINE_WIDTH: 0.412908
G1 X102.577 Y75.862 E.00515
G1 X102.788 Y76.194 E.00508
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
G1 X102.896 Y103.276 E.03356
G1 X102.825 Y103.692 E.00539
; LINE_WIDTH: 0.404578
G1 X102.61 Y104.096 E.00578
; LINE_WIDTH: 0.403858
G1 X102.359 Y104.322 E.00425
M204 S250
G1 X102.149 Y103.991 F42000
; LINE_WIDTH: 0.407068
G1 F1711
M204 S5000
G1 X101.998 Y104.107 E.00241
; LINE_WIDTH: 0.405908
G1 X101.669 Y104.2 E.00433
; LINE_WIDTH: 0.410218
G3 X99.58 Y104.202 I-1.093 J-42.725 E.02676
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
G1 X78.059 Y104.131 E.00476
; LINE_WIDTH: 0.408248
G1 X77.745 Y103.92 E.00481
G1 X77.569 Y103.645 E.00416
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.279 E.00477
G1 X77.496 Y76.724 E.33879
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.403788
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.408248
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
; LINE_WIDTH: 0.409448
G1 X88.42 Y75.797 E.02557
; LINE_WIDTH: 0.409238
G1 X90.42 Y75.797 E.02556
; LINE_WIDTH: 0.409028
G1 X92.42 Y75.797 E.02555
; LINE_WIDTH: 0.408828
G1 X94.42 Y75.797 E.02553
; LINE_WIDTH: 0.408618
G1 X96.42 Y75.797 E.02552
; LINE_WIDTH: 0.408408
G1 X98.42 Y75.796 E.0255
; LINE_WIDTH: 0.408198
G1 X100.42 Y75.796 E.02549
; LINE_WIDTH: 0.407998
G1 X101.6 Y75.796 E.01503
; LINE_WIDTH: 0.410278
G1 X101.833 Y75.83 E.00301
G1 X102.172 Y76.007 E.00491
; LINE_WIDTH: 0.406238
G1 X102.396 Y76.282 E.0045
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
G1 X102.461 Y103.559 E.00365
; LINE_WIDTH: 0.407068
G1 X102.278 Y103.893 E.00484
G1 X102.196 Y103.955 E.0013
; WIPE_START
G1 F12000
M204 S6000
G1 X101.998 Y104.107 E-.09497
G1 X101.669 Y104.2 E-.12999
G1 X100.261 Y104.201 E-.53504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.762 Y98.035 Z6.9 F42000
G1 X82.968 Y80.5 Z6.9
G1 Z6.5
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
G1 X79.404 Y80.921 Z6.9 F42000
G1 Z6.5
G1 E.8 F1800
; LINE_WIDTH: 0.385728
G1 F1711
M204 S5000
G1 X79.41 Y80.864 E.0007
G1 X79.54 Y80.623 E.00329
G1 X79.753 Y80.452 E.00328
; LINE_WIDTH: 0.395908
G1 X80.015 Y80.372 E.00338
G1 X80.288 Y80.407 E.0034
; LINE_WIDTH: 0.394808
G1 X80.552 Y80.561 E.00376
; LINE_WIDTH: 0.404088
G1 X80.743 Y80.902 E.00494
G1 X80.759 Y81.029 E.00161
; LINE_WIDTH: 0.385028
G1 X80.71 Y81.325 E.0036
; LINE_WIDTH: 0.392868
G1 X80.514 Y81.595 E.00409
G1 X80.26 Y81.732 E.00353
; LINE_WIDTH: 0.397388
G1 X79.944 Y81.752 E.00393
G1 X79.653 Y81.615 E.00399
; LINE_WIDTH: 0.391668
G1 X79.465 Y81.397 E.00352
; LINE_WIDTH: 0.385728
G1 X79.383 Y81.136 E.00329
G1 X79.398 Y80.981 E.00186
; WIPE_START
G1 F12000
M204 S6000
G1 X79.41 Y80.864 E-.04487
G1 X79.54 Y80.623 E-.10399
G1 X79.753 Y80.452 E-.10383
G1 X80.015 Y80.372 E-.10412
G1 X80.288 Y80.407 E-.10459
G1 X80.552 Y80.561 E-.11597
G1 X80.743 Y80.902 E-.14881
G1 X80.754 Y80.991 E-.03381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.9 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.58
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 81/100
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; OBJECT_ID: 15
G1 X102.29 Y104.386 F42000
G1 Z6.58
G1 E.8 F1800
; LINE_WIDTH: 0.414008
G1 F1711
M204 S5000
G1 X102.002 Y104.524 E.00413
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
; LINE_WIDTH: 0.415498
G1 X78.111 Y104.555 E.00411
G1 X77.744 Y104.409 E.00513
; LINE_WIDTH: 0.408428
G1 X77.408 Y104.114 E.0057
; LINE_WIDTH: 0.403948
G1 X77.202 Y103.774 E.00501
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.285 E.00636
G1 X77.104 Y76.724 E.33888
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408218
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.413568
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00547
; LINE_WIDTH: 0.410268
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409848
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409638
G1 X86.415 Y75.405 E.02559
; LINE_WIDTH: 0.409438
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409228
G1 X90.415 Y75.405 E.02556
; LINE_WIDTH: 0.409018
G1 X92.415 Y75.405 E.02554
; LINE_WIDTH: 0.408818
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408608
G1 X96.415 Y75.405 E.02552
; LINE_WIDTH: 0.408398
G1 X98.415 Y75.405 E.0255
; LINE_WIDTH: 0.408188
G1 X100.415 Y75.405 E.02549
; LINE_WIDTH: 0.407988
G1 X101.6 Y75.405 E.01509
; LINE_WIDTH: 0.407868
G1 X101.841 Y75.436 E.00309
; LINE_WIDTH: 0.408088
G1 X102.273 Y75.603 E.00591
; LINE_WIDTH: 0.414578
G1 X102.576 Y75.862 E.00517
G1 X102.79 Y76.195 E.00512
; LINE_WIDTH: 0.410418
G1 X102.894 Y76.646 E.00594
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
M73 P83 R2
G1 X102.896 Y103.276 E.03356
G1 X102.82 Y103.708 E.00561
; LINE_WIDTH: 0.407008
G1 X102.61 Y104.093 E.00556
; LINE_WIDTH: 0.407728
G1 X102.337 Y104.35 E.00477
M204 S250
G1 X102.148 Y103.993 F42000
; LINE_WIDTH: 0.406558
G1 F1711
M204 S5000
G1 X101.997 Y104.107 E.00239
; LINE_WIDTH: 0.405618
G1 X101.668 Y104.198 E.00432
; LINE_WIDTH: 0.410218
G1 X99.571 Y104.202 E.02688
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
G1 X77.985 Y104.1 E.00577
; LINE_WIDTH: 0.408198
G1 X77.684 Y103.845 E.00503
; LINE_WIDTH: 0.407348
G1 X77.541 Y103.572 E.00392
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.271 E.00388
G1 X77.496 Y76.724 E.33869
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.413588
G1 X77.61 Y76.283 E.00173
G1 X77.755 Y76.075 E.00327
; LINE_WIDTH: 0.411198
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405398
G1 X78.331 Y75.802 E.00421
; LINE_WIDTH: 0.410268
G1 X80.43 Y75.798 E.0269
; LINE_WIDTH: 0.410058
G1 X82.43 Y75.798 E.02561
; LINE_WIDTH: 0.409848
G1 X84.43 Y75.798 E.0256
; LINE_WIDTH: 0.409638
G1 X86.43 Y75.798 E.02559
; LINE_WIDTH: 0.409438
G1 X88.43 Y75.797 E.02557
; LINE_WIDTH: 0.409228
G1 X90.43 Y75.797 E.02556
; LINE_WIDTH: 0.409018
G1 X92.43 Y75.797 E.02554
; LINE_WIDTH: 0.408808
G1 X94.43 Y75.797 E.02553
; LINE_WIDTH: 0.408608
G1 X96.43 Y75.797 E.02552
; LINE_WIDTH: 0.408398
G1 X98.43 Y75.796 E.0255
; LINE_WIDTH: 0.408188
G1 X100.43 Y75.796 E.02549
; LINE_WIDTH: 0.407988
G1 X101.6 Y75.796 E.01491
; LINE_WIDTH: 0.410308
G1 X101.833 Y75.83 E.00301
G1 X102.175 Y76.01 E.00495
; LINE_WIDTH: 0.410418
G1 X102.42 Y76.331 E.00518
G1 X102.501 Y76.646 E.00417
; LINE_WIDTH: 0.409378
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
G1 X102.464 Y103.552 E.00356
; LINE_WIDTH: 0.407008
G1 X102.272 Y103.9 E.00505
; LINE_WIDTH: 0.406558
G1 X102.196 Y103.957 E.00121
; WIPE_START
G1 F12000
M204 S6000
G1 X101.997 Y104.107 E-.0944
G1 X101.668 Y104.198 E-.12973
G1 X100.258 Y104.201 E-.53587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.76 Y98.035 Z6.98 F42000
G1 X82.968 Y80.5 Z6.98
G1 Z6.58
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
G1 X79.394 Y80.936 Z6.98 F42000
G1 Z6.58
G1 E.8 F1800
; LINE_WIDTH: 0.387608
G1 F1711
M204 S5000
G1 X79.394 Y80.926 E.00013
; LINE_WIDTH: 0.386888
G1 X79.535 Y80.631 E.00394
G1 X79.753 Y80.452 E.0034
; LINE_WIDTH: 0.416528
G1 X80.047 Y80.377 E.00395
; LINE_WIDTH: 0.416588
G1 X80.048 Y80.377 E.00001
; LINE_WIDTH: 0.416578
G1 X80.323 Y80.42 E.00362
; LINE_WIDTH: 0.406148
G1 X80.548 Y80.564 E.00339
; LINE_WIDTH: 0.404588
G1 X80.747 Y80.901 E.00494
; LINE_WIDTH: 0.398268
G1 X80.759 Y81.166 E.00329
G1 X80.666 Y81.426 E.00343
G1 X80.399 Y81.671 E.00451
; LINE_WIDTH: 0.392688
G1 X80.124 Y81.757 E.00352
G1 X79.852 Y81.722 E.00336
; LINE_WIDTH: 0.399188
G1 X79.559 Y81.539 E.0043
G1 X79.401 Y81.249 E.00411
; LINE_WIDTH: 0.387608
G1 X79.395 Y80.996 E.00306
; WIPE_START
G1 F12000
M204 S6000
G1 X79.394 Y80.926 E-.02682
G1 X79.535 Y80.631 E-.12423
G1 X79.753 Y80.452 E-.10722
G1 X80.047 Y80.377 E-.11537
G1 X80.048 Y80.377 E-.00039
G1 X80.323 Y80.42 E-.10574
G1 X80.548 Y80.564 E-.10148
G1 X80.747 Y80.901 E-.14873
G1 X80.751 Y80.98 E-.03003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.98 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.66
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 82/100
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; OBJECT_ID: 15
G1 X102.295 Y104.371 F42000
G1 Z6.66
G1 E.8 F1800
; LINE_WIDTH: 0.403208
G1 F1686
M204 S5000
G1 X102.255 Y104.405 E.00067
; LINE_WIDTH: 0.411378
G1 X101.871 Y104.562 E.00533
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
; LINE_WIDTH: 0.407698
G1 X78.058 Y104.539 E.00442
; LINE_WIDTH: 0.415498
G1 X77.705 Y104.384 E.005
G1 X77.443 Y104.171 E.00439
; LINE_WIDTH: 0.407808
G1 X77.204 Y103.774 E.0059
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.292 E.00628
G1 X77.104 Y77.292 E.33172
G3 X77.141 Y76.413 I3.741 J-.284 E.01124
; LINE_WIDTH: 0.412708
G1 X77.275 Y76.075 E.0047
G1 X77.457 Y75.83 E.00393
; LINE_WIDTH: 0.403828
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
G1 X101.6 Y75.405 E.01516
G1 X101.937 Y75.455 E.00434
; LINE_WIDTH: 0.414828
G1 X102.29 Y75.614 E.00502
G1 X102.536 Y75.818 E.00414
; LINE_WIDTH: 0.407568
G1 X102.778 Y76.172 E.00546
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00624
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.3 E.33858
G1 X102.818 Y103.739 E.00566
; LINE_WIDTH: 0.406968
G1 X102.591 Y104.122 E.00567
; LINE_WIDTH: 0.403208
G1 X102.341 Y104.332 E.0041
M204 S250
G1 X102.168 Y103.976 F42000
; LINE_WIDTH: 0.408198
G1 F1686
M204 S5000
G1 X101.99 Y104.112 E.00285
; LINE_WIDTH: 0.410218
G1 X101.58 Y104.202 E.00538
G1 X99.58 Y104.202 E.02562
; LINE_WIDTH: 0.409998
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409778
G1 X95.58 Y104.202 E.02559
; LINE_WIDTH: 0.409558
G1 X93.58 Y104.203 E.02558
; LINE_WIDTH: 0.409348
G1 X91.58 Y104.203 E.02557
; LINE_WIDTH: 0.409128
G1 X89.58 Y104.203 E.02555
; LINE_WIDTH: 0.408908
G1 X87.58 Y104.203 E.02554
; LINE_WIDTH: 0.408688
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
G1 X78.057 Y104.132 E.00446
; LINE_WIDTH: 0.407398
M73 P84 R2
G1 X77.74 Y103.914 E.0049
G1 X77.57 Y103.645 E.00403
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.284 E.00471
G1 X77.496 Y85.284 E.22965
G3 X77.499 Y76.671 I742.865 J-4 E.10988
; LINE_WIDTH: 0.405698
G1 X77.552 Y76.403 E.00346
; LINE_WIDTH: 0.403828
G1 X77.73 Y76.101 E.00442
; LINE_WIDTH: 0.408258
G1 X78.009 Y75.888 E.00448
; LINE_WIDTH: 0.410278
G1 X78.42 Y75.798 E.00539
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.410068
G1 X82.42 Y75.798 E.02561
; LINE_WIDTH: 0.409858
G1 X84.42 Y75.798 E.0256
; LINE_WIDTH: 0.409648
G1 X86.42 Y75.798 E.02559
; LINE_WIDTH: 0.409438
G1 X88.42 Y75.797 E.02557
; LINE_WIDTH: 0.409228
G1 X90.42 Y75.797 E.02556
; LINE_WIDTH: 0.409018
G1 X92.42 Y75.797 E.02554
; LINE_WIDTH: 0.408808
G1 X94.42 Y75.797 E.02553
; LINE_WIDTH: 0.408598
G1 X96.42 Y75.797 E.02552
; LINE_WIDTH: 0.408398
G1 X98.42 Y75.796 E.0255
; LINE_WIDTH: 0.408188
G1 X100.42 Y75.796 E.02549
; LINE_WIDTH: 0.407978
G1 X101.6 Y75.796 E.01503
; LINE_WIDTH: 0.407858
G1 X101.941 Y75.869 E.00445
; LINE_WIDTH: 0.405618
G1 X102.26 Y76.087 E.00488
; LINE_WIDTH: 0.407638
G1 X102.431 Y76.354 E.00404
G1 X102.504 Y76.7 E.0045
G1 X102.504 Y103.3 E.33855
G1 X102.44 Y103.626 E.00423
; LINE_WIDTH: 0.406288
G1 X102.276 Y103.894 E.00398
; LINE_WIDTH: 0.408198
G1 X102.216 Y103.94 E.00097
; WIPE_START
G1 F12000
M204 S6000
G1 X101.99 Y104.112 E-.10783
G1 X101.58 Y104.202 E-.15945
G1 X100.284 Y104.202 E-.49272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.179 Y98.527 Z7.06 F42000
G1 X79.386 Y80.97 Z7.06
G1 Z6.66
G1 E.8 F1800
; LINE_WIDTH: 0.405268
G1 F1686
M204 S5000
G1 X79.386 Y80.964 E.00007
; LINE_WIDTH: 0.388668
G1 X79.486 Y80.694 E.00349
; LINE_WIDTH: 0.387608
G1 X79.742 Y80.46 E.0042
; LINE_WIDTH: 0.395888
G1 X80.015 Y80.372 E.00354
G1 X80.288 Y80.407 E.0034
; LINE_WIDTH: 0.392368
G1 X80.524 Y80.541 E.00332
; LINE_WIDTH: 0.394788
G1 X80.748 Y80.901 E.00522
G1 X80.76 Y81.131 E.00284
; LINE_WIDTH: 0.392408
G1 X80.68 Y81.394 E.00336
G1 X80.504 Y81.606 E.00336
G1 X80.26 Y81.732 E.00336
; LINE_WIDTH: 0.404268
G1 X80.02 Y81.759 E.00305
; LINE_WIDTH: 0.405848
G1 X79.787 Y81.698 E.00306
G1 X79.562 Y81.537 E.00351
; LINE_WIDTH: 0.405268
G1 X79.418 Y81.302 E.00348
G1 X79.392 Y81.03 E.00346
; WIPE_START
G1 F12000
M204 S6000
G1 X79.386 Y80.964 E-.02493
G1 X79.486 Y80.694 E-.10937
G1 X79.742 Y80.46 E-.13203
G1 X80.015 Y80.372 E-.10906
G1 X80.288 Y80.407 E-.10474
G1 X80.524 Y80.541 E-.10301
G1 X80.748 Y80.901 E-.16103
G1 X80.75 Y80.942 E-.01582
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.06 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.74
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 83/100
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; OBJECT_ID: 15
G1 X102.276 Y104.389 F42000
G1 Z6.74
G1 E.8 F1800
; LINE_WIDTH: 0.413958
G1 F1690
M204 S5000
G1 X102.002 Y104.524 E.00395
G1 X101.585 Y104.595 E.00547
; LINE_WIDTH: 0.410218
G1 X99.585 Y104.595 E.02562
; LINE_WIDTH: 0.409998
G1 X97.585 Y104.595 E.02561
; LINE_WIDTH: 0.409778
G1 X95.585 Y104.595 E.02559
; LINE_WIDTH: 0.409558
G1 X93.585 Y104.595 E.02558
; LINE_WIDTH: 0.409348
G1 X91.585 Y104.595 E.02557
; LINE_WIDTH: 0.409128
G1 X89.585 Y104.595 E.02555
; LINE_WIDTH: 0.408908
G1 X87.585 Y104.595 E.02554
; LINE_WIDTH: 0.408688
G1 X85.585 Y104.595 E.02552
; LINE_WIDTH: 0.408478
G1 X83.585 Y104.594 E.02551
; LINE_WIDTH: 0.408258
G1 X81.585 Y104.594 E.0255
; LINE_WIDTH: 0.408038
G1 X79.585 Y104.594 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.594 E.01509
; LINE_WIDTH: 0.407698
G1 X78.058 Y104.539 E.00442
; LINE_WIDTH: 0.415138
G1 X77.705 Y104.385 E.00499
G1 X77.443 Y104.171 E.00439
; LINE_WIDTH: 0.408338
G1 X77.183 Y103.72 E.00663
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00558
G1 X77.104 Y76.724 E.33894
G1 X77.181 Y76.285 E.00568
; LINE_WIDTH: 0.403938
G1 X77.378 Y75.916 E.00528
; LINE_WIDTH: 0.407318
G1 X77.695 Y75.623 E.00549
; LINE_WIDTH: 0.413418
G1 X77.986 Y75.48 E.00419
G1 X78.415 Y75.405 E.00562
; LINE_WIDTH: 0.410278
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410068
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409858
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409648
G1 X86.415 Y75.405 E.02559
; LINE_WIDTH: 0.409438
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409228
G1 X90.415 Y75.405 E.02556
; LINE_WIDTH: 0.409018
G1 X92.415 Y75.405 E.02554
; LINE_WIDTH: 0.408808
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408598
G1 X96.415 Y75.405 E.02552
; LINE_WIDTH: 0.408388
G1 X98.415 Y75.405 E.0255
; LINE_WIDTH: 0.408178
G1 X100.415 Y75.405 E.02549
; LINE_WIDTH: 0.407968
G1 X101.6 Y75.405 E.01509
G1 X101.937 Y75.455 E.00434
; LINE_WIDTH: 0.414838
G1 X102.29 Y75.614 E.00502
G1 X102.536 Y75.818 E.00414
; LINE_WIDTH: 0.407598
G1 X102.778 Y76.173 E.00547
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00623
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
G1 X102.807 Y103.747 E.00612
; LINE_WIDTH: 0.403738
G1 X102.626 Y104.078 E.00476
; LINE_WIDTH: 0.406758
G1 X102.327 Y104.358 E.0052
M204 S250
G1 X102.154 Y103.988 F42000
; LINE_WIDTH: 0.408038
G1 F1690
M204 S5000
G1 X101.997 Y104.107 E.00252
; LINE_WIDTH: 0.405578
G1 X101.669 Y104.198 E.00431
; LINE_WIDTH: 0.410218
G1 X99.57 Y104.202 E.02688
; LINE_WIDTH: 0.409998
G1 X97.57 Y104.202 E.02561
; LINE_WIDTH: 0.409778
G1 X95.57 Y104.202 E.02559
; LINE_WIDTH: 0.409558
G1 X93.57 Y104.203 E.02558
; LINE_WIDTH: 0.409338
G1 X91.57 Y104.203 E.02557
; LINE_WIDTH: 0.409128
G1 X89.57 Y104.203 E.02555
; LINE_WIDTH: 0.408908
G1 X87.57 Y104.203 E.02554
; LINE_WIDTH: 0.408688
G1 X85.57 Y104.203 E.02552
; LINE_WIDTH: 0.408468
G1 X83.57 Y104.203 E.02551
; LINE_WIDTH: 0.408258
G1 X81.57 Y104.204 E.0255
; LINE_WIDTH: 0.408038
G1 X79.57 Y104.204 E.02548
; LINE_WIDTH: 0.407818
G1 X78.4 Y104.204 E.0149
; LINE_WIDTH: 0.407698
G1 X78.058 Y104.132 E.00445
; LINE_WIDTH: 0.408088
G1 X77.739 Y103.911 E.00494
G1 X77.542 Y103.572 E.005
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.281 E.00376
G1 X77.496 Y76.724 E.33881
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.407328
G1 X77.728 Y76.1 E.00447
G1 X78.01 Y75.889 E.00447
; LINE_WIDTH: 0.405728
G1 X78.33 Y75.802 E.00421
; LINE_WIDTH: 0.410278
G1 X80.43 Y75.798 E.02691
; LINE_WIDTH: 0.410068
G1 X82.43 Y75.798 E.02561
; LINE_WIDTH: 0.409858
G1 X84.43 Y75.798 E.0256
; LINE_WIDTH: 0.409648
G1 X86.43 Y75.798 E.02559
; LINE_WIDTH: 0.409438
G1 X88.43 Y75.797 E.02557
; LINE_WIDTH: 0.409228
G1 X90.43 Y75.797 E.02556
; LINE_WIDTH: 0.409018
M73 P85 R2
G1 X92.43 Y75.797 E.02554
; LINE_WIDTH: 0.408808
G1 X94.43 Y75.797 E.02553
; LINE_WIDTH: 0.408598
G1 X96.43 Y75.797 E.02552
; LINE_WIDTH: 0.408388
G1 X98.43 Y75.796 E.0255
; LINE_WIDTH: 0.408178
G1 X100.43 Y75.796 E.02549
; LINE_WIDTH: 0.407968
G1 X101.6 Y75.796 E.0149
; LINE_WIDTH: 0.407848
G1 X101.942 Y75.869 E.00445
; LINE_WIDTH: 0.405618
G1 X102.26 Y76.087 E.00488
; LINE_WIDTH: 0.407678
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
G1 X102.504 Y103.276 E.05837
G1 X102.436 Y103.633 E.00464
; LINE_WIDTH: 0.408038
G1 X102.277 Y103.894 E.00389
G1 X102.202 Y103.952 E.00121
; WIPE_START
G1 F12000
M204 S6000
G1 X101.997 Y104.107 E-.09788
G1 X101.669 Y104.198 E-.12941
G1 X100.267 Y104.201 E-.53271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.14 Y98.546 Z7.14 F42000
G1 X79.383 Y81.169 Z7.14
G1 Z6.74
G1 E.8 F1800
; LINE_WIDTH: 0.402708
G1 F1690
M204 S5000
G1 X79.397 Y80.894 E.00346
G1 X79.516 Y80.646 E.00346
G1 X79.723 Y80.463 E.00346
G1 X79.979 Y80.377 E.00339
; LINE_WIDTH: 0.402188
G1 X80.288 Y80.409 E.0039
; LINE_WIDTH: 0.392368
G1 X80.527 Y80.543 E.00335
; LINE_WIDTH: 0.396918
G1 X80.659 Y80.712 E.00265
; LINE_WIDTH: 0.398228
G3 X80.712 Y80.82 I-.098 J.115 E.00154
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.0027
G1 X80.725 Y81.3 E.0034
; LINE_WIDTH: 0.398228
G1 X80.512 Y81.594 E.00451
; LINE_WIDTH: 0.389248
G1 X80.259 Y81.729 E.00348
; LINE_WIDTH: 0.385888
G1 X79.986 Y81.75 E.00329
; LINE_WIDTH: 0.392748
G1 X79.726 Y81.667 E.00335
; LINE_WIDTH: 0.405408
G1 X79.479 Y81.429 E.00434
G1 X79.404 Y81.225 E.00275
; WIPE_START
G1 F12000
M204 S6000
G1 X79.397 Y80.894 E-.12596
G1 X79.516 Y80.646 E-.10462
G1 X79.723 Y80.463 E-.10466
G1 X79.979 Y80.377 E-.10263
G1 X80.288 Y80.409 E-.11823
G1 X80.527 Y80.543 E-.10418
G1 X80.659 Y80.712 E-.08132
G1 X80.688 Y80.75 E-.01842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.14 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.82
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 84/100
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; OBJECT_ID: 15
G1 X102.263 Y104.394 F42000
G1 Z6.82
G1 E.8 F1800
; LINE_WIDTH: 0.413038
G1 F1695
M204 S5000
G1 X101.936 Y104.543 E.00463
G1 X101.588 Y104.595 E.00455
; LINE_WIDTH: 0.410228
G1 X99.588 Y104.595 E.02562
; LINE_WIDTH: 0.410078
G1 X97.588 Y104.595 E.02561
; LINE_WIDTH: 0.409938
G1 X95.588 Y104.595 E.0256
; LINE_WIDTH: 0.409798
G1 X93.588 Y104.595 E.0256
; LINE_WIDTH: 0.409658
G1 X91.588 Y104.595 E.02559
; LINE_WIDTH: 0.409518
G1 X89.588 Y104.595 E.02558
; LINE_WIDTH: 0.409378
G1 X87.588 Y104.595 E.02557
; LINE_WIDTH: 0.409228
G1 X85.588 Y104.595 E.02556
; LINE_WIDTH: 0.409088
G1 X83.588 Y104.596 E.02555
; LINE_WIDTH: 0.408948
G1 X81.588 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.588 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.596 E.01484
G1 X78.018 Y104.531 E.00525
; LINE_WIDTH: 0.405638
G1 X77.636 Y104.331 E.00547
; LINE_WIDTH: 0.408498
G1 X77.329 Y104.017 E.0056
; LINE_WIDTH: 0.413098
G1 X77.16 Y103.648 E.00524
G1 X77.105 Y103.287 E.00471
; LINE_WIDTH: 0.410298
G1 X77.105 Y101.287 E.02563
; LINE_WIDTH: 0.410168
G1 X77.105 Y99.287 E.02562
; LINE_WIDTH: 0.410038
G1 X77.105 Y97.287 E.02561
; LINE_WIDTH: 0.409908
G1 X77.105 Y95.287 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.287 E.02559
; LINE_WIDTH: 0.409658
G1 X77.105 Y91.287 E.02559
; LINE_WIDTH: 0.409528
G1 X77.105 Y89.287 E.02558
; LINE_WIDTH: 0.409398
G1 X77.105 Y87.287 E.02557
; LINE_WIDTH: 0.409268
G1 X77.105 Y85.287 E.02556
; LINE_WIDTH: 0.409138
G1 X77.105 Y83.287 E.02555
; LINE_WIDTH: 0.409018
G1 X77.104 Y81.287 E.02554
; LINE_WIDTH: 0.408888
G1 X77.104 Y79.287 E.02554
; LINE_WIDTH: 0.408758
G1 X77.104 Y77.287 E.02553
; LINE_WIDTH: 0.408628
G1 X77.104 Y76.724 E.00718
G1 X77.188 Y76.273 E.00585
; LINE_WIDTH: 0.403068
G1 X77.396 Y75.894 E.00543
; LINE_WIDTH: 0.408258
G1 X77.698 Y75.618 E.00521
; LINE_WIDTH: 0.413568
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410278
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409848
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409638
G1 X86.415 Y75.405 E.02559
; LINE_WIDTH: 0.409428
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409218
G1 X90.415 Y75.405 E.02556
; LINE_WIDTH: 0.409008
G1 X92.415 Y75.405 E.02554
; LINE_WIDTH: 0.408798
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408588
G1 X96.415 Y75.405 E.02552
; LINE_WIDTH: 0.408378
G1 X98.415 Y75.405 E.0255
; LINE_WIDTH: 0.408168
G1 X100.415 Y75.405 E.02549
; LINE_WIDTH: 0.407958
G1 X101.6 Y75.405 E.0151
G1 X101.937 Y75.455 E.00434
; LINE_WIDTH: 0.414828
G1 X102.29 Y75.614 E.00502
G1 X102.536 Y75.818 E.00413
; LINE_WIDTH: 0.407628
G1 X102.778 Y76.174 E.00548
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00622
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
G3 X102.847 Y103.637 I-3.534 J.288 E.01201
; LINE_WIDTH: 0.407188
G1 X102.626 Y104.079 E.00628
; LINE_WIDTH: 0.406808
G1 X102.317 Y104.368 E.00538
M204 S250
G1 X102.154 Y103.987 F42000
; LINE_WIDTH: 0.407988
G1 F1695
M204 S5000
G1 X101.996 Y104.107 E.00253
; LINE_WIDTH: 0.404538
G1 X101.669 Y104.199 E.00429
; LINE_WIDTH: 0.410228
G1 X99.576 Y104.202 E.02681
; LINE_WIDTH: 0.410078
G1 X97.576 Y104.202 E.02561
; LINE_WIDTH: 0.409938
G1 X95.576 Y104.202 E.0256
; LINE_WIDTH: 0.409798
G1 X93.576 Y104.203 E.0256
; LINE_WIDTH: 0.409658
G1 X91.576 Y104.203 E.02559
; LINE_WIDTH: 0.409518
G1 X89.576 Y104.203 E.02558
; LINE_WIDTH: 0.409368
G1 X87.576 Y104.203 E.02557
; LINE_WIDTH: 0.409228
G1 X85.576 Y104.204 E.02556
; LINE_WIDTH: 0.409088
G1 X83.576 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.576 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.576 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.204 E.01469
G1 X78.145 Y104.163 E.00361
; LINE_WIDTH: 0.406158
G1 X77.832 Y103.997 E.0045
; LINE_WIDTH: 0.405048
G1 X77.594 Y103.696 E.00484
; LINE_WIDTH: 0.404238
G1 X77.501 Y103.37 E.00428
; LINE_WIDTH: 0.410298
G1 X77.498 Y101.275 E.02684
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
G1 X77.496 Y76.724 E.00702
G1 X77.544 Y76.421 E.00392
; LINE_WIDTH: 0.411278
G1 X77.751 Y76.079 E.00514
G1 X78.01 Y75.889 E.00412
; LINE_WIDTH: 0.405378
G1 X78.33 Y75.802 E.0042
; LINE_WIDTH: 0.410278
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.410058
G1 X82.429 Y75.798 E.02561
; LINE_WIDTH: 0.409848
G1 X84.429 Y75.798 E.0256
; LINE_WIDTH: 0.409638
G1 X86.429 Y75.798 E.02559
; LINE_WIDTH: 0.409428
G1 X88.429 Y75.797 E.02557
; LINE_WIDTH: 0.409218
G1 X90.429 Y75.797 E.02556
; LINE_WIDTH: 0.409008
G1 X92.429 Y75.797 E.02554
; LINE_WIDTH: 0.408798
G1 X94.429 Y75.797 E.02553
; LINE_WIDTH: 0.408588
G1 X96.429 Y75.797 E.02552
; LINE_WIDTH: 0.408378
G1 X98.429 Y75.796 E.0255
; LINE_WIDTH: 0.408168
G1 X100.429 Y75.796 E.02549
; LINE_WIDTH: 0.407958
G1 X101.6 Y75.796 E.01491
; LINE_WIDTH: 0.407838
G1 X101.942 Y75.869 E.00445
; LINE_WIDTH: 0.405618
G1 X102.259 Y76.087 E.00488
; LINE_WIDTH: 0.407728
G1 X102.431 Y76.354 E.00404
G1 X102.504 Y76.7 E.0045
G1 X102.504 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.504 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.504 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.504 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.504 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.504 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.504 Y103.275 E.03286
G1 X102.464 Y103.552 E.00357
; LINE_WIDTH: 0.407988
M73 P86 R2
G1 X102.277 Y103.895 E.00497
G1 X102.202 Y103.951 E.00119
; WIPE_START
G1 F12000
M204 S6000
G1 X101.996 Y104.107 E-.09814
G1 X101.669 Y104.199 E-.1292
G1 X100.267 Y104.201 E-.53265
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.174 Y98.516 Z7.22 F42000
G1 X79.404 Y80.91 Z7.22
G1 Z6.82
G1 E.8 F1800
; LINE_WIDTH: 0.392948
G1 F1695
M204 S5000
G1 X79.405 Y80.877 E.0004
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392328
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
G1 X80.289 Y80.407 E.00336
G1 X80.527 Y80.543 E.00336
; LINE_WIDTH: 0.398288
G1 X80.696 Y80.76 E.00342
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.00346
G1 X80.726 Y81.297 E.00336
; LINE_WIDTH: 0.397628
G1 X80.513 Y81.594 E.00453
; LINE_WIDTH: 0.389408
G1 X80.259 Y81.729 E.00348
G1 X79.986 Y81.752 E.00333
G1 X79.727 Y81.663 E.00333
; LINE_WIDTH: 0.384968
G1 X79.521 Y81.483 E.00328
G1 X79.395 Y81.214 E.00357
; LINE_WIDTH: 0.392948
G1 X79.402 Y80.97 E.00298
; WIPE_START
G1 F12000
M204 S6000
G1 X79.405 Y80.877 E-.03523
G1 X79.537 Y80.621 E-.10961
G1 X79.751 Y80.449 E-.10441
G1 X80.016 Y80.374 E-.10445
G1 X80.289 Y80.407 E-.10447
G1 X80.527 Y80.543 E-.1044
G1 X80.696 Y80.76 E-.10456
G1 X80.757 Y80.997 E-.09287
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.22 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.9
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 85/100
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; OBJECT_ID: 15
G1 X102.284 Y104.381 F42000
G1 Z6.9
G1 E.8 F1800
; LINE_WIDTH: 0.415278
G1 F1695
M204 S5000
G1 X102.002 Y104.523 E.0041
G1 X101.585 Y104.595 E.00549
; LINE_WIDTH: 0.410238
G1 X99.585 Y104.595 E.02562
; LINE_WIDTH: 0.410088
G1 X97.585 Y104.595 E.02561
; LINE_WIDTH: 0.409948
G1 X95.585 Y104.595 E.02561
; LINE_WIDTH: 0.409808
G1 X93.585 Y104.595 E.0256
; LINE_WIDTH: 0.409668
G1 X91.585 Y104.595 E.02559
; LINE_WIDTH: 0.409518
G1 X89.585 Y104.595 E.02558
; LINE_WIDTH: 0.409378
G1 X87.585 Y104.595 E.02557
; LINE_WIDTH: 0.409238
G1 X85.585 Y104.595 E.02556
; LINE_WIDTH: 0.409098
G1 X83.585 Y104.596 E.02555
; LINE_WIDTH: 0.408948
G1 X81.585 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.585 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.596 E.01482
G1 X78.013 Y104.527 E.00532
; LINE_WIDTH: 0.405038
G1 X77.602 Y104.309 E.00589
; LINE_WIDTH: 0.405928
G1 X77.346 Y104.039 E.00471
; LINE_WIDTH: 0.415278
G1 X77.177 Y103.702 E.0049
G1 X77.105 Y103.285 E.00549
; LINE_WIDTH: 0.410288
G1 X77.105 Y101.285 E.02563
; LINE_WIDTH: 0.410158
G1 X77.105 Y99.285 E.02562
; LINE_WIDTH: 0.410028
G1 X77.105 Y97.285 E.02561
; LINE_WIDTH: 0.409898
G1 X77.105 Y95.285 E.0256
; LINE_WIDTH: 0.409778
G1 X77.105 Y93.285 E.02559
; LINE_WIDTH: 0.409648
G1 X77.105 Y91.285 E.02559
; LINE_WIDTH: 0.409518
G1 X77.105 Y89.285 E.02558
; LINE_WIDTH: 0.409388
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
G3 X77.141 Y76.414 I3.711 J-.28 E.01115
; LINE_WIDTH: 0.412698
G1 X77.276 Y76.073 E.00473
G1 X77.457 Y75.83 E.00391
; LINE_WIDTH: 0.403898
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.411688
G1 X78.119 Y75.441 E.0052
G1 X78.41 Y75.405 E.00378
; LINE_WIDTH: 0.410268
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
; LINE_WIDTH: 0.408588
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408378
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408168
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.407958
G1 X101.6 Y75.405 E.01515
G1 X101.938 Y75.455 E.00435
; LINE_WIDTH: 0.412978
G1 X102.291 Y75.614 E.00499
G1 X102.515 Y75.799 E.00375
; LINE_WIDTH: 0.408228
G1 X102.783 Y76.184 E.00599
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00607
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
G3 X102.856 Y103.613 I-3.895 J.288 E.01168
; LINE_WIDTH: 0.407868
G1 X102.626 Y104.076 E.00659
; LINE_WIDTH: 0.406158
G1 X102.345 Y104.35 E.00498
; LINE_WIDTH: 0.415278
G1 X102.337 Y104.353 E.00011
M204 S250
G1 X102.173 Y103.971 F42000
; LINE_WIDTH: 0.406538
G1 F1695
M204 S5000
G1 X102.025 Y104.093 E.00243
G1 X101.669 Y104.198 E.00471
; LINE_WIDTH: 0.410238
G1 X99.571 Y104.202 E.02688
; LINE_WIDTH: 0.410088
G1 X97.571 Y104.202 E.02561
; LINE_WIDTH: 0.409948
G1 X95.571 Y104.202 E.02561
; LINE_WIDTH: 0.409808
G1 X93.571 Y104.203 E.0256
; LINE_WIDTH: 0.409658
G1 X91.571 Y104.203 E.02559
; LINE_WIDTH: 0.409518
G1 X89.571 Y104.203 E.02558
; LINE_WIDTH: 0.409378
G1 X87.571 Y104.203 E.02557
; LINE_WIDTH: 0.409238
G1 X85.571 Y104.204 E.02556
; LINE_WIDTH: 0.409088
G1 X83.571 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.571 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.571 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.424 Y104.204 E.01463
G1 X78.148 Y104.163 E.00357
; LINE_WIDTH: 0.406418
G1 X77.808 Y103.979 E.0049
; LINE_WIDTH: 0.406558
G1 X77.607 Y103.725 E.00411
G1 X77.502 Y103.369 E.00471
; LINE_WIDTH: 0.410288
G1 X77.498 Y101.27 E.0269
; LINE_WIDTH: 0.410158
G1 X77.498 Y99.27 E.02562
; LINE_WIDTH: 0.410028
G1 X77.498 Y97.27 E.02561
; LINE_WIDTH: 0.409898
G1 X77.498 Y95.27 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.27 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.27 E.02559
; LINE_WIDTH: 0.409518
G1 X77.497 Y89.27 E.02558
; LINE_WIDTH: 0.409388
G1 X77.497 Y87.27 E.02557
; LINE_WIDTH: 0.409268
G1 X77.497 Y85.27 E.02556
; LINE_WIDTH: 0.409138
G1 X77.496 Y83.27 E.02555
; LINE_WIDTH: 0.409008
G1 X77.496 Y81.27 E.02554
; LINE_WIDTH: 0.408878
G1 X77.496 Y79.27 E.02554
; LINE_WIDTH: 0.408758
G1 X77.496 Y77.27 E.02553
; LINE_WIDTH: 0.408628
G1 X77.496 Y76.724 E.00697
G1 X77.552 Y76.403 E.00416
; LINE_WIDTH: 0.403898
G1 X77.73 Y76.101 E.00442
G1 X77.959 Y75.915 E.00372
; LINE_WIDTH: 0.405658
G1 X78.331 Y75.801 E.00492
; LINE_WIDTH: 0.410268
G1 X80.421 Y75.798 E.02678
; LINE_WIDTH: 0.410058
G1 X82.421 Y75.798 E.02561
; LINE_WIDTH: 0.409848
G1 X84.421 Y75.798 E.0256
; LINE_WIDTH: 0.409638
G1 X86.421 Y75.798 E.02559
; LINE_WIDTH: 0.409428
G1 X88.421 Y75.797 E.02557
; LINE_WIDTH: 0.409218
G1 X90.421 Y75.797 E.02556
; LINE_WIDTH: 0.409008
G1 X92.421 Y75.797 E.02554
; LINE_WIDTH: 0.408798
G1 X94.421 Y75.797 E.02553
; LINE_WIDTH: 0.408588
G1 X96.421 Y75.797 E.02552
; LINE_WIDTH: 0.408378
G1 X98.421 Y75.796 E.0255
; LINE_WIDTH: 0.408168
G1 X100.421 Y75.796 E.02549
; LINE_WIDTH: 0.407958
G1 X101.6 Y75.796 E.01502
; LINE_WIDTH: 0.407838
G1 X101.938 Y75.868 E.0044
; LINE_WIDTH: 0.404428
G1 X102.236 Y76.064 E.0045
; LINE_WIDTH: 0.408428
G1 X102.431 Y76.354 E.00446
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407738
G1 X102.504 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.504 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.504 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.504 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.504 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.504 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.504 Y103.275 E.03286
G1 X102.473 Y103.518 E.00311
; LINE_WIDTH: 0.407508
G1 X102.299 Y103.866 E.00496
; LINE_WIDTH: 0.406538
G1 X102.219 Y103.933 E.00132
; WIPE_START
G1 F12000
M204 S6000
G1 X102.025 Y104.093 E-.09555
G1 X101.669 Y104.198 E-.14112
G1 X100.292 Y104.201 E-.52333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.18 Y98.533 Z7.3 F42000
G1 X79.38 Y81.016 Z7.3
G1 Z6.9
G1 E.8 F1800
; LINE_WIDTH: 0.386568
G1 F1695
M204 S5000
G1 X79.476 Y80.715 E.0038
G1 X79.687 Y80.489 E.00372
; LINE_WIDTH: 0.392928
G1 X80.002 Y80.377 E.0041
G1 X80.288 Y80.407 E.00353
; LINE_WIDTH: 0.392388
G1 X80.527 Y80.543 E.00336
; LINE_WIDTH: 0.398348
G1 X80.696 Y80.76 E.00341
; LINE_WIDTH: 0.398508
G1 X80.766 Y81.03 E.00347
G1 X80.762 Y81.093 E.00078
; LINE_WIDTH: 0.387968
G1 X80.66 Y81.425 E.0042
; LINE_WIDTH: 0.386928
G1 X80.453 Y81.638 E.00357
; LINE_WIDTH: 0.392588
G1 X80.133 Y81.754 E.00417
G1 X79.851 Y81.723 E.00347
; LINE_WIDTH: 0.392388
G1 X79.613 Y81.587 E.00336
; LINE_WIDTH: 0.399188
G1 X79.444 Y81.37 E.00342
G1 X79.39 Y81.075 E.00373
; WIPE_START
G1 F12000
M204 S6000
G1 X79.476 Y80.715 E-.1407
G1 X79.687 Y80.489 E-.11737
G1 X80.002 Y80.377 E-.12714
G1 X80.288 Y80.407 E-.10939
G1 X80.527 Y80.543 E-.10446
G1 X80.696 Y80.76 E-.10442
G1 X80.733 Y80.904 E-.05652
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.3 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 6.98
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 86/100
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; OBJECT_ID: 15
G1 X102.257 Y104.393 F42000
G1 Z6.98
G1 E.8 F1800
; LINE_WIDTH: 0.413998
G1 F1690
M204 S5000
G1 X101.946 Y104.54 E.00445
G1 X101.587 Y104.595 E.0047
; LINE_WIDTH: 0.410228
G1 X99.587 Y104.595 E.02562
; LINE_WIDTH: 0.410078
G1 X97.587 Y104.595 E.02561
; LINE_WIDTH: 0.409938
G1 X95.587 Y104.595 E.0256
; LINE_WIDTH: 0.409798
G1 X93.587 Y104.595 E.0256
; LINE_WIDTH: 0.409658
G1 X91.587 Y104.595 E.02559
; LINE_WIDTH: 0.409518
G1 X89.587 Y104.595 E.02558
; LINE_WIDTH: 0.409378
G1 X87.587 Y104.595 E.02557
; LINE_WIDTH: 0.409228
G1 X85.587 Y104.595 E.02556
; LINE_WIDTH: 0.409088
G1 X83.587 Y104.596 E.02555
; LINE_WIDTH: 0.408948
M73 P87 R2
G1 X81.587 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.587 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.596 E.01483
; LINE_WIDTH: 0.410708
G1 X78.114 Y104.558 E.00401
; LINE_WIDTH: 0.413108
G1 X77.772 Y104.424 E.00474
G1 X77.442 Y104.168 E.00539
; LINE_WIDTH: 0.410578
G1 X77.204 Y103.774 E.0059
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.292 E.00628
G1 X77.104 Y77.292 E.33172
G3 X77.141 Y76.414 I3.743 J-.284 E.01124
; LINE_WIDTH: 0.412668
G1 X77.276 Y76.072 E.00474
G1 X77.457 Y75.83 E.0039
; LINE_WIDTH: 0.403928
G1 X77.745 Y75.595 E.00469
; LINE_WIDTH: 0.411668
G1 X78.119 Y75.441 E.0052
G1 X78.411 Y75.405 E.00377
; LINE_WIDTH: 0.410278
G1 X80.411 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.411 Y75.405 E.02561
; LINE_WIDTH: 0.409848
G1 X84.411 Y75.405 E.0256
; LINE_WIDTH: 0.409638
G1 X86.411 Y75.405 E.02559
; LINE_WIDTH: 0.409428
G1 X88.411 Y75.405 E.02557
; LINE_WIDTH: 0.409218
G1 X90.411 Y75.405 E.02556
; LINE_WIDTH: 0.409008
G1 X92.411 Y75.405 E.02554
; LINE_WIDTH: 0.408798
G1 X94.411 Y75.405 E.02553
; LINE_WIDTH: 0.408578
G1 X96.411 Y75.405 E.02552
; LINE_WIDTH: 0.408368
G1 X98.411 Y75.405 E.0255
; LINE_WIDTH: 0.408158
G1 X100.411 Y75.405 E.02549
; LINE_WIDTH: 0.407948
G1 X101.6 Y75.405 E.01515
G1 X101.938 Y75.455 E.00435
; LINE_WIDTH: 0.414828
G1 X102.29 Y75.614 E.00502
G1 X102.487 Y75.772 E.00327
; LINE_WIDTH: 0.406798
G1 X102.769 Y76.144 E.00593
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00661
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
G1 X102.896 Y103.275 E.03286
G1 X102.809 Y103.742 E.00605
; LINE_WIDTH: 0.403198
G1 X102.613 Y104.088 E.00501
; LINE_WIDTH: 0.405908
G1 X102.339 Y104.354 E.00485
; LINE_WIDTH: 0.413998
G1 X102.311 Y104.367 E.00039
M204 S250
G1 X102.138 Y104.006 F42000
; LINE_WIDTH: 0.411108
G1 F1690
M204 S5000
G1 X102.025 Y104.092 E.00182
; LINE_WIDTH: 0.405058
G1 X101.669 Y104.199 E.0047
; LINE_WIDTH: 0.410228
G1 X99.574 Y104.202 E.02683
; LINE_WIDTH: 0.410078
G1 X97.574 Y104.202 E.02561
; LINE_WIDTH: 0.409938
G1 X95.574 Y104.202 E.0256
; LINE_WIDTH: 0.409798
G1 X93.574 Y104.203 E.0256
; LINE_WIDTH: 0.409658
G1 X91.574 Y104.203 E.02559
; LINE_WIDTH: 0.409518
G1 X89.574 Y104.203 E.02558
; LINE_WIDTH: 0.409368
G1 X87.574 Y104.203 E.02557
; LINE_WIDTH: 0.409228
G1 X85.574 Y104.204 E.02556
; LINE_WIDTH: 0.409088
G1 X83.574 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.574 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.574 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.204 E.01467
G1 X78.062 Y104.133 E.00471
; LINE_WIDTH: 0.410578
G1 X77.747 Y103.917 E.0049
G1 X77.583 Y103.686 E.00363
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.284 E.00525
G1 X77.496 Y76.724 E.33886
G1 X77.552 Y76.403 E.00415
; LINE_WIDTH: 0.403928
G1 X77.729 Y76.101 E.00442
; LINE_WIDTH: 0.408338
G1 X78.009 Y75.888 E.00449
; LINE_WIDTH: 0.410278
G1 X78.421 Y75.798 E.00539
G1 X80.421 Y75.798 E.02563
; LINE_WIDTH: 0.410058
G1 X82.421 Y75.798 E.02561
; LINE_WIDTH: 0.409848
G1 X84.421 Y75.798 E.0256
; LINE_WIDTH: 0.409638
G1 X86.421 Y75.798 E.02559
; LINE_WIDTH: 0.409428
G1 X88.421 Y75.797 E.02557
; LINE_WIDTH: 0.409218
G1 X90.421 Y75.797 E.02556
; LINE_WIDTH: 0.409008
G1 X92.421 Y75.797 E.02554
; LINE_WIDTH: 0.408798
G1 X94.421 Y75.797 E.02553
; LINE_WIDTH: 0.408578
G1 X96.421 Y75.797 E.02552
; LINE_WIDTH: 0.408368
G1 X98.421 Y75.796 E.0255
; LINE_WIDTH: 0.408158
G1 X100.421 Y75.796 E.02549
; LINE_WIDTH: 0.407948
G1 X101.6 Y75.796 E.01502
; LINE_WIDTH: 0.407828
G1 X101.942 Y75.869 E.00445
; LINE_WIDTH: 0.405618
G1 X102.26 Y76.087 E.00488
G1 X102.43 Y76.355 E.00402
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
M73 P87 R1
G1 X102.504 Y103.275 E.05836
G1 X102.438 Y103.628 E.00457
; LINE_WIDTH: 0.411108
G1 X102.241 Y103.928 E.00462
G1 X102.186 Y103.97 E.00088
; WIPE_START
G1 F12000
M204 S6000
G1 X102.025 Y104.092 E-.07675
G1 X101.669 Y104.199 E-.14126
G1 X100.242 Y104.201 E-.54199
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.127 Y98.537 Z7.38 F42000
G1 X79.383 Y81.105 Z7.38
G1 Z6.98
G1 E.8 F1800
; LINE_WIDTH: 0.392348
G1 F1690
M204 S5000
G1 X79.407 Y80.863 E.00297
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.015 Y80.374 E.00336
G1 X80.26 Y80.4 E.003
; LINE_WIDTH: 0.397988
G1 X80.546 Y80.559 E.00407
; LINE_WIDTH: 0.411248
G1 X80.693 Y80.767 E.00327
G1 X80.762 Y81.03 E.0035
; LINE_WIDTH: 0.406148
G1 X80.757 Y81.132 E.00129
; LINE_WIDTH: 0.385988
G1 X80.677 Y81.393 E.00329
G1 X80.502 Y81.603 E.00329
G1 X80.259 Y81.729 E.00329
G1 X79.986 Y81.75 E.00329
G1 X79.723 Y81.662 E.00334
; LINE_WIDTH: 0.395068
G1 X79.47 Y81.411 E.00438
G1 X79.389 Y81.163 E.00321
; WIPE_START
G1 F12000
M204 S6000
G1 X79.407 Y80.863 E-.11427
G1 X79.537 Y80.621 E-.1045
G1 X79.751 Y80.449 E-.10438
G1 X80.015 Y80.374 E-.1043
G1 X80.26 Y80.4 E-.09336
G1 X80.546 Y80.559 E-.12463
G1 X80.693 Y80.767 E-.09673
G1 X80.705 Y80.812 E-.01783
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.38 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.06
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 87/100
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; OBJECT_ID: 15
G1 X102.264 Y104.398 F42000
G1 Z7.06
G1 E.8 F1800
; LINE_WIDTH: 0.403938
G1 F1693
M204 S5000
G1 X102.244 Y104.415 E.00033
; LINE_WIDTH: 0.411358
G1 X101.871 Y104.562 E.00515
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
; LINE_WIDTH: 0.407698
G1 X78.15 Y104.559 E.00322
; LINE_WIDTH: 0.408418
G1 X77.732 Y104.402 E.0057
G1 X77.555 Y104.265 E.00284
; LINE_WIDTH: 0.403928
G1 X77.285 Y103.944 E.00529
; LINE_WIDTH: 0.407818
G1 X77.134 Y103.54 E.00549
; LINE_WIDTH: 0.410298
G1 X77.105 Y103.292 E.00321
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
G1 X77.104 Y76.725 E.00724
G1 X77.181 Y76.285 E.00569
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.404588
G1 X77.705 Y75.62 E.00539
; LINE_WIDTH: 0.410818
M73 P88 R1
G1 X78.13 Y75.439 E.00592
G1 X78.41 Y75.405 E.00362
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
; LINE_WIDTH: 0.409208
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.408998
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408788
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408578
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408368
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408148
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.407938
G1 X101.6 Y75.405 E.01516
G1 X101.938 Y75.455 E.00435
; LINE_WIDTH: 0.414838
G1 X102.29 Y75.615 E.00502
G1 X102.536 Y75.818 E.00414
; LINE_WIDTH: 0.407688
G1 X102.779 Y76.175 E.0055
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.0062
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.3 E.33858
G1 X102.853 Y103.579 E.00359
; LINE_WIDTH: 0.408268
G1 X102.698 Y103.976 E.00543
G1 X102.565 Y104.145 E.00274
; LINE_WIDTH: 0.403938
G1 X102.31 Y104.359 E.00419
M204 S250
G1 X102.184 Y103.957 F42000
; LINE_WIDTH: 0.408208
G1 F1693
M204 S5000
G1 X101.99 Y104.112 E.00316
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
; LINE_WIDTH: 0.414088
G3 X77.832 Y103.995 I.064 J-1.054 E.00794
; LINE_WIDTH: 0.406038
G1 X77.628 Y103.761 E.00394
; LINE_WIDTH: 0.406968
G1 X77.5 Y103.37 E.00523
; LINE_WIDTH: 0.410298
G3 X77.498 Y101.284 I53.62 J-1.091 E.02672
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.284 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.284 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.284 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.284 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.284 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.284 E.02558
; LINE_WIDTH: 0.409398
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
G1 X77.496 Y76.725 E.00714
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.410608
G1 X77.752 Y76.079 E.00489
G1 X78.01 Y75.89 E.0041
; LINE_WIDTH: 0.410278
G1 X78.42 Y75.798 E.00538
G1 X80.42 Y75.798 E.02563
; LINE_WIDTH: 0.410058
G1 X82.42 Y75.798 E.02561
; LINE_WIDTH: 0.409848
G1 X84.42 Y75.798 E.0256
; LINE_WIDTH: 0.409638
G1 X86.42 Y75.798 E.02559
; LINE_WIDTH: 0.409428
G1 X88.42 Y75.797 E.02557
; LINE_WIDTH: 0.409208
G1 X90.42 Y75.797 E.02556
; LINE_WIDTH: 0.408998
G1 X92.42 Y75.797 E.02554
; LINE_WIDTH: 0.408788
G1 X94.42 Y75.797 E.02553
; LINE_WIDTH: 0.408578
G1 X96.42 Y75.797 E.02552
; LINE_WIDTH: 0.408358
G1 X98.42 Y75.796 E.0255
; LINE_WIDTH: 0.408148
G1 X100.42 Y75.796 E.02549
; LINE_WIDTH: 0.407938
G1 X101.6 Y75.796 E.01503
; LINE_WIDTH: 0.407818
G1 X101.942 Y75.869 E.00445
; LINE_WIDTH: 0.405628
G1 X102.26 Y76.087 E.00488
; LINE_WIDTH: 0.407808
G1 X102.431 Y76.354 E.00404
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407678
G1 X102.504 Y103.3 E.33858
; LINE_WIDTH: 0.411648
G1 X102.449 Y103.589 E.00378
G1 X102.295 Y103.869 E.0041
; LINE_WIDTH: 0.408208
G1 X102.231 Y103.92 E.00105
; WIPE_START
G1 F12000
M204 S6000
G1 X101.99 Y104.112 E-.11704
G1 X101.58 Y104.202 E-.1595
G1 X100.308 Y104.202 E-.48346
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.179 Y98.55 Z7.46 F42000
G1 X79.396 Y81.159 Z7.46
G1 Z7.06
G1 E.8 F1800
; LINE_WIDTH: 0.392888
G1 F1693
M204 S5000
G1 X79.405 Y80.877 E.00346
G1 X79.537 Y80.621 E.00352
; LINE_WIDTH: 0.392348
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
G1 X80.288 Y80.407 E.00336
G1 X80.527 Y80.543 E.00336
; LINE_WIDTH: 0.398188
G1 X80.695 Y80.758 E.00339
; LINE_WIDTH: 0.413228
G1 X80.759 Y81.031 E.00361
G1 X80.758 Y81.117 E.00112
; LINE_WIDTH: 0.389368
G1 X80.677 Y81.393 E.00349
; LINE_WIDTH: 0.385968
G1 X80.502 Y81.603 E.00329
G1 X80.259 Y81.729 E.00329
G1 X79.987 Y81.75 E.00328
; LINE_WIDTH: 0.389388
G1 X79.726 Y81.666 E.00332
G1 X79.521 Y81.483 E.00333
; LINE_WIDTH: 0.384988
G1 X79.398 Y81.218 E.00351
; WIPE_START
G1 F12000
M204 S6000
G1 X79.405 Y80.877 E-.12973
G1 X79.537 Y80.621 E-.10937
G1 X79.751 Y80.449 E-.10452
G1 X80.016 Y80.374 E-.1044
G1 X80.288 Y80.407 E-.10437
G1 X80.527 Y80.543 E-.10438
G1 X80.694 Y80.757 E-.10324
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.46 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.14
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 88/100
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; OBJECT_ID: 15
G1 X102.233 Y104.419 F42000
G1 Z7.14
G1 E.8 F1800
; LINE_WIDTH: 0.411728
G1 F1691
M204 S5000
G1 X101.879 Y104.56 E.00489
G1 X101.59 Y104.595 E.00375
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
; LINE_WIDTH: 0.407698
G1 X78.057 Y104.539 E.00442
; LINE_WIDTH: 0.413058
G1 X77.708 Y104.387 E.0049
G1 X77.42 Y104.136 E.00494
G1 X77.206 Y103.787 E.00527
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.289 E.00648
G1 X77.104 Y77.289 E.33172
G3 X77.141 Y76.414 I3.733 J-.283 E.01121
; LINE_WIDTH: 0.412668
G1 X77.277 Y76.071 E.00476
G1 X77.457 Y75.829 E.00388
; LINE_WIDTH: 0.403968
G1 X77.745 Y75.595 E.00468
; LINE_WIDTH: 0.411628
G1 X78.121 Y75.44 E.00522
G1 X78.41 Y75.405 E.00375
; LINE_WIDTH: 0.410278
G1 X80.41 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.41 Y75.405 E.02561
; LINE_WIDTH: 0.409848
G1 X84.41 Y75.405 E.0256
; LINE_WIDTH: 0.409638
G1 X86.41 Y75.405 E.02559
; LINE_WIDTH: 0.409418
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409208
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.408998
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408778
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408568
G1 X96.41 Y75.405 E.02552
; LINE_WIDTH: 0.408358
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408138
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.407928
G1 X101.6 Y75.405 E.01515
G1 X101.938 Y75.455 E.00435
; LINE_WIDTH: 0.414808
G1 X102.29 Y75.615 E.00502
G1 X102.536 Y75.818 E.00413
; LINE_WIDTH: 0.408228
G1 X102.783 Y76.184 E.00563
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00607
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.3 E.33858
; LINE_WIDTH: 0.408188
G1 X102.818 Y103.738 E.00567
G1 X102.577 Y104.133 E.00588
; LINE_WIDTH: 0.403818
M73 P89 R1
G1 X102.281 Y104.385 E.0049
M204 S250
G1 X102.174 Y103.972 F42000
; LINE_WIDTH: 0.408748
G1 F1691
M204 S5000
G1 X101.995 Y104.11 E.00288
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
G1 X78.4 Y104.204 E.01502
; LINE_WIDTH: 0.407698
G1 X78.061 Y104.134 E.0044
; LINE_WIDTH: 0.406158
G1 X77.768 Y103.94 E.00445
; LINE_WIDTH: 0.406728
G1 X77.569 Y103.646 E.00451
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.279 E.00477
G1 X77.496 Y76.724 E.3388
G1 X77.552 Y76.403 E.00415
; LINE_WIDTH: 0.403968
G1 X77.73 Y76.101 E.00443
; LINE_WIDTH: 0.408328
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
; LINE_WIDTH: 0.409418
G1 X88.42 Y75.797 E.02557
; LINE_WIDTH: 0.409208
G1 X90.42 Y75.797 E.02556
; LINE_WIDTH: 0.408998
G1 X92.42 Y75.797 E.02554
; LINE_WIDTH: 0.408778
G1 X94.42 Y75.797 E.02553
; LINE_WIDTH: 0.408568
G1 X96.42 Y75.797 E.02552
; LINE_WIDTH: 0.408358
G1 X98.42 Y75.796 E.0255
; LINE_WIDTH: 0.408138
G1 X100.42 Y75.796 E.02549
; LINE_WIDTH: 0.407928
G1 X101.6 Y75.796 E.01502
; LINE_WIDTH: 0.407808
G1 X101.942 Y75.869 E.00445
; LINE_WIDTH: 0.405598
G1 X102.259 Y76.087 E.00488
; LINE_WIDTH: 0.408418
G1 X102.431 Y76.354 E.00405
G1 X102.504 Y76.7 E.00451
; LINE_WIDTH: 0.407678
G1 X102.504 Y103.3 E.33858
; LINE_WIDTH: 0.408188
G1 X102.451 Y103.598 E.00385
G1 X102.274 Y103.894 E.0044
; LINE_WIDTH: 0.408748
G1 X102.221 Y103.935 E.00086
; WIPE_START
G1 F12000
M204 S6000
G1 X101.995 Y104.11 E-.10842
G1 X101.58 Y104.202 E-.16187
G1 X100.291 Y104.202 E-.48971
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.15 Y98.56 Z7.54 F42000
G1 X79.424 Y81.3 Z7.54
G1 Z7.14
G1 E.8 F1800
; LINE_WIDTH: 0.392728
G1 F1691
M204 S5000
G1 X79.38 Y81.019 E.00349
; LINE_WIDTH: 0.385708
G1 X79.494 Y80.683 E.00425
; LINE_WIDTH: 0.387928
G1 X79.729 Y80.462 E.0039
; LINE_WIDTH: 0.398468
G1 X80.053 Y80.368 E.00419
G1 X80.402 Y80.458 E.00448
; LINE_WIDTH: 0.388968
G1 X80.658 Y80.698 E.00425
; LINE_WIDTH: 0.398528
G1 X80.766 Y81.03 E.00435
G1 X80.741 Y81.233 E.00254
; LINE_WIDTH: 0.388188
G1 X80.623 Y81.481 E.00332
G1 X80.418 Y81.663 E.00331
G1 X80.158 Y81.751 E.00331
G1 X79.885 Y81.731 E.00331
; LINE_WIDTH: 0.393988
G1 X79.64 Y81.61 E.00335
G1 X79.452 Y81.352 E.00393
; WIPE_START
G1 F12000
M204 S6000
G1 X79.38 Y81.019 E-.12955
G1 X79.494 Y80.683 E-.13453
G1 X79.729 Y80.462 E-.12276
G1 X80.053 Y80.368 E-.12804
G1 X80.402 Y80.458 E-.13693
G1 X80.61 Y80.653 E-.1082
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.54 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.22
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 89/100
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
; OBJECT_ID: 15
G1 X102.224 Y104.417 F42000
G1 Z7.22
G1 E.8 F1800
; LINE_WIDTH: 0.411388
G1 F1696
M204 S5000
G1 X101.871 Y104.562 E.00491
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
; LINE_WIDTH: 0.411588
G1 X77.962 Y104.516 E.00571
G1 X77.564 Y104.274 E.00599
; LINE_WIDTH: 0.403808
G1 X77.287 Y103.948 E.00539
; LINE_WIDTH: 0.407768
G1 X77.135 Y103.541 E.00553
; LINE_WIDTH: 0.410298
G1 X77.105 Y103.292 E.00322
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
G1 X77.104 Y76.724 E.00724
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.907 E.00545
; LINE_WIDTH: 0.408238
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.413488
G1 X77.99 Y75.478 E.00419
G1 X78.415 Y75.405 E.00557
; LINE_WIDTH: 0.410258
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410038
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409828
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409618
G1 X86.415 Y75.405 E.02558
; LINE_WIDTH: 0.409408
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409188
G1 X90.415 Y75.405 E.02556
; LINE_WIDTH: 0.408978
G1 X92.415 Y75.405 E.02554
; LINE_WIDTH: 0.408768
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408558
G1 X96.415 Y75.405 E.02551
; LINE_WIDTH: 0.408348
G1 X98.415 Y75.405 E.0255
; LINE_WIDTH: 0.408128
G1 X100.415 Y75.405 E.02549
; LINE_WIDTH: 0.407918
G1 X101.6 Y75.405 E.01509
; LINE_WIDTH: 0.407798
G1 X101.839 Y75.436 E.00307
G1 X102.269 Y75.601 E.00587
; LINE_WIDTH: 0.413578
G1 X102.535 Y75.813 E.00439
G1 X102.769 Y76.148 E.00527
; LINE_WIDTH: 0.410538
G1 X102.894 Y76.646 E.00659
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
G1 X102.894 Y103.3 E.00833
; LINE_WIDTH: 0.411508
G1 X102.816 Y103.738 E.00571
G1 X102.589 Y104.124 E.00576
; LINE_WIDTH: 0.403158
G1 X102.276 Y104.388 E.00515
M204 S250
G1 X102.176 Y103.971 F42000
; LINE_WIDTH: 0.408618
G1 F1696
M204 S5000
G1 X101.995 Y104.11 E.00291
; LINE_WIDTH: 0.410238
G1 X101.58 Y104.202 E.00544
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
; LINE_WIDTH: 0.411588
G1 X78.116 Y104.152 E.00371
M73 P90 R1
G1 X77.802 Y103.971 E.00466
; LINE_WIDTH: 0.405358
G1 X77.628 Y103.761 E.00345
; LINE_WIDTH: 0.406998
G1 X77.5 Y103.37 E.00524
; LINE_WIDTH: 0.410298
G3 X77.498 Y101.284 I53.866 J-1.09 E.02672
; LINE_WIDTH: 0.410168
G1 X77.498 Y99.284 E.02562
; LINE_WIDTH: 0.410038
G1 X77.498 Y97.284 E.02561
; LINE_WIDTH: 0.409908
G1 X77.498 Y95.284 E.0256
; LINE_WIDTH: 0.409778
G1 X77.497 Y93.284 E.02559
; LINE_WIDTH: 0.409648
G1 X77.497 Y91.284 E.02559
; LINE_WIDTH: 0.409528
G1 X77.497 Y89.284 E.02558
; LINE_WIDTH: 0.409398
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
; LINE_WIDTH: 0.411198
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405608
G1 X78.331 Y75.802 E.00421
; LINE_WIDTH: 0.410258
G1 X80.43 Y75.798 E.0269
; LINE_WIDTH: 0.410038
G1 X82.43 Y75.798 E.02561
; LINE_WIDTH: 0.409828
G1 X84.43 Y75.798 E.0256
; LINE_WIDTH: 0.409618
G1 X86.43 Y75.798 E.02558
; LINE_WIDTH: 0.409408
G1 X88.43 Y75.797 E.02557
; LINE_WIDTH: 0.409188
G1 X90.43 Y75.797 E.02556
; LINE_WIDTH: 0.408978
G1 X92.43 Y75.797 E.02554
; LINE_WIDTH: 0.408768
G1 X94.43 Y75.797 E.02553
; LINE_WIDTH: 0.408558
G1 X96.43 Y75.797 E.02551
; LINE_WIDTH: 0.408338
G1 X98.43 Y75.796 E.0255
; LINE_WIDTH: 0.408128
G1 X100.43 Y75.796 E.02549
; LINE_WIDTH: 0.407918
G1 X101.6 Y75.796 E.0149
; LINE_WIDTH: 0.410578
G1 X101.833 Y75.831 E.00302
G1 X102.17 Y76.004 E.00486
G1 X102.402 Y76.294 E.00476
G1 X102.501 Y76.646 E.00469
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
G1 X102.504 Y103.3 E.00833
; LINE_WIDTH: 0.411508
G1 X102.452 Y103.585 E.00372
G1 X102.275 Y103.896 E.0046
; LINE_WIDTH: 0.408618
G1 X102.224 Y103.935 E.00082
; WIPE_START
G1 F12000
M204 S6000
G1 X101.995 Y104.11 E-.10958
G1 X101.58 Y104.202 E-.16132
G1 X100.293 Y104.202 E-.4891
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.167 Y98.547 Z7.62 F42000
G1 X79.392 Y81.143 Z7.62
G1 Z7.22
G1 E.8 F1800
; LINE_WIDTH: 0.389388
G1 F1696
M204 S5000
G1 X79.399 Y80.896 E.003
; LINE_WIDTH: 0.388228
G1 X79.518 Y80.649 E.00332
; LINE_WIDTH: 0.398388
G1 X79.783 Y80.43 E.00428
G1 X80.133 Y80.376 E.0044
; LINE_WIDTH: 0.385668
G1 X80.423 Y80.471 E.00366
; LINE_WIDTH: 0.388848
G1 X80.643 Y80.677 E.00365
; LINE_WIDTH: 0.398448
G1 X80.766 Y81.03 E.00465
G1 X80.741 Y81.233 E.00254
; LINE_WIDTH: 0.388228
G1 X80.623 Y81.481 E.00331
G1 X80.418 Y81.663 E.00331
; LINE_WIDTH: 0.397988
G1 X80.1 Y81.759 E.00413
G1 X79.766 Y81.684 E.00425
; LINE_WIDTH: 0.387988
G1 X79.519 Y81.482 E.00385
; LINE_WIDTH: 0.389388
G1 X79.398 Y81.202 E.00371
; WIPE_START
G1 F12000
M204 S6000
G1 X79.399 Y80.896 E-.11598
G1 X79.518 Y80.649 E-.10416
G1 X79.783 Y80.43 E-.13091
G1 X80.133 Y80.376 E-.13465
G1 X80.423 Y80.471 E-.11591
G1 X80.643 Y80.677 E-.11447
G1 X80.681 Y80.786 E-.04393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.62 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.3
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 90/100
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
; OBJECT_ID: 15
G1 X102.217 Y104.425 F42000
G1 Z7.3
G1 E.8 F1800
; LINE_WIDTH: 0.410938
G1 F1696
M204 S5000
G1 X101.863 Y104.563 E.00488
G1 X101.59 Y104.595 E.00352
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
G1 X78.4 Y104.594 E.01516
; LINE_WIDTH: 0.412918
G1 X77.963 Y104.515 E.00573
G1 X77.62 Y104.322 E.00508
; LINE_WIDTH: 0.404668
G1 X77.303 Y103.974 E.00594
; LINE_WIDTH: 0.407768
G1 X77.137 Y103.549 E.00581
; LINE_WIDTH: 0.410288
G1 X77.105 Y103.292 E.00332
G1 X77.105 Y101.292 E.02563
; LINE_WIDTH: 0.410088
G1 X77.105 Y99.292 E.02561
; LINE_WIDTH: 0.409888
G1 X77.105 Y97.292 E.0256
; LINE_WIDTH: 0.409698
G1 X77.105 Y95.292 E.02559
; LINE_WIDTH: 0.409498
G1 X77.105 Y93.292 E.02558
; LINE_WIDTH: 0.409308
G1 X77.105 Y91.292 E.02556
; LINE_WIDTH: 0.409108
G1 X77.105 Y89.292 E.02555
; LINE_WIDTH: 0.408918
G1 X77.105 Y87.292 E.02554
; LINE_WIDTH: 0.408718
G1 X77.105 Y85.292 E.02553
; LINE_WIDTH: 0.408528
G1 X77.106 Y83.292 E.02551
; LINE_WIDTH: 0.408328
G1 X77.106 Y81.292 E.0255
; LINE_WIDTH: 0.408128
G1 X77.106 Y79.292 E.02549
; LINE_WIDTH: 0.407938
G1 X77.106 Y77.292 E.02547
; LINE_WIDTH: 0.407738
G1 X77.106 Y76.7 E.00754
; LINE_WIDTH: 0.408218
G1 X77.182 Y76.262 E.00567
G1 X77.414 Y75.872 E.00578
; LINE_WIDTH: 0.403068
G1 X77.745 Y75.595 E.00544
; LINE_WIDTH: 0.411328
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
; LINE_WIDTH: 0.409398
G1 X88.41 Y75.405 E.02557
; LINE_WIDTH: 0.409188
G1 X90.41 Y75.405 E.02556
; LINE_WIDTH: 0.408978
G1 X92.41 Y75.405 E.02554
; LINE_WIDTH: 0.408758
G1 X94.41 Y75.405 E.02553
; LINE_WIDTH: 0.408548
G1 X96.41 Y75.405 E.02551
; LINE_WIDTH: 0.408338
G1 X98.41 Y75.405 E.0255
; LINE_WIDTH: 0.408118
G1 X100.41 Y75.405 E.02549
; LINE_WIDTH: 0.407908
G1 X101.6 Y75.406 E.01516
; LINE_WIDTH: 0.407788
G1 X101.839 Y75.435 E.00307
G1 X102.269 Y75.601 E.00586
; LINE_WIDTH: 0.412968
G1 X102.58 Y75.864 E.00526
G1 X102.768 Y76.145 E.00436
; LINE_WIDTH: 0.410608
G1 X102.894 Y76.646 E.00662
; LINE_WIDTH: 0.409368
G1 X102.894 Y78.646 E.02557
; LINE_WIDTH: 0.409238
G1 X102.894 Y80.646 E.02556
; LINE_WIDTH: 0.409108
G1 X102.894 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.894 Y84.646 E.02554
; LINE_WIDTH: 0.408858
G1 X102.894 Y86.646 E.02553
; LINE_WIDTH: 0.408728
G1 X102.894 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.894 Y90.646 E.02552
; LINE_WIDTH: 0.408478
G1 X102.894 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.894 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.894 Y96.646 E.02549
; LINE_WIDTH: 0.408098
G1 X102.894 Y98.646 E.02548
; LINE_WIDTH: 0.407978
G1 X102.894 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.894 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.894 Y103.3 E.00832
G1 X102.818 Y103.739 E.00567
; LINE_WIDTH: 0.406818
G1 X102.574 Y104.136 E.00592
; LINE_WIDTH: 0.403838
G1 X102.269 Y104.395 E.00505
M204 S250
G1 X102.173 Y103.973 F42000
; LINE_WIDTH: 0.408498
G1 F1696
M204 S5000
G1 X101.995 Y104.11 E.00287
; LINE_WIDTH: 0.410238
G1 X101.581 Y104.202 E.00543
G1 X99.581 Y104.202 E.02562
; LINE_WIDTH: 0.410018
G1 X97.581 Y104.202 E.02561
; LINE_WIDTH: 0.409798
G1 X95.581 Y104.202 E.0256
; LINE_WIDTH: 0.409578
G1 X93.581 Y104.202 E.02558
; LINE_WIDTH: 0.409358
G1 X91.581 Y104.203 E.02557
; LINE_WIDTH: 0.409138
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
; LINE_WIDTH: 0.412918
G3 X77.87 Y104.026 I.059 J-1.053 E.0073
; LINE_WIDTH: 0.405148
G1 X77.629 Y103.768 E.00446
; LINE_WIDTH: 0.407018
G1 X77.5 Y103.37 E.00532
; LINE_WIDTH: 0.410288
G3 X77.498 Y101.284 I53.992 J-1.089 E.02672
; LINE_WIDTH: 0.410088
G1 X77.498 Y99.284 E.02561
; LINE_WIDTH: 0.409888
G1 X77.498 Y97.284 E.0256
; LINE_WIDTH: 0.409698
G1 X77.498 Y95.284 E.02559
; LINE_WIDTH: 0.409498
G1 X77.497 Y93.284 E.02558
; LINE_WIDTH: 0.409308
G1 X77.497 Y91.284 E.02556
; LINE_WIDTH: 0.409108
G1 X77.497 Y89.284 E.02555
; LINE_WIDTH: 0.408918
G1 X77.497 Y87.284 E.02554
; LINE_WIDTH: 0.408718
G1 X77.497 Y85.284 E.02553
; LINE_WIDTH: 0.408518
G1 X77.497 Y83.284 E.02551
; LINE_WIDTH: 0.408328
G1 X77.497 Y81.284 E.0255
; LINE_WIDTH: 0.408128
G1 X77.496 Y79.284 E.02549
; LINE_WIDTH: 0.407938
G1 X77.496 Y77.284 E.02547
; LINE_WIDTH: 0.407738
G1 X77.496 Y76.7 E.00745
; LINE_WIDTH: 0.408238
G1 X77.549 Y76.402 E.00385
G1 X77.729 Y76.1 E.00448
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
; LINE_WIDTH: 0.409398
G1 X88.419 Y75.797 E.02557
; LINE_WIDTH: 0.409188
G1 X90.419 Y75.797 E.02556
; LINE_WIDTH: 0.408978
G1 X92.419 Y75.797 E.02554
; LINE_WIDTH: 0.408758
M73 P91 R1
G1 X94.419 Y75.797 E.02553
; LINE_WIDTH: 0.408548
G1 X96.419 Y75.797 E.02551
; LINE_WIDTH: 0.408338
G1 X98.419 Y75.796 E.0255
; LINE_WIDTH: 0.408118
G1 X100.419 Y75.796 E.02549
; LINE_WIDTH: 0.407908
G1 X101.6 Y75.796 E.01504
; LINE_WIDTH: 0.410598
G1 X101.833 Y75.831 E.00302
G1 X102.169 Y76.005 E.00485
G1 X102.4 Y76.289 E.0047
G1 X102.501 Y76.646 E.00476
; LINE_WIDTH: 0.409368
G1 X102.501 Y78.646 E.02557
; LINE_WIDTH: 0.409238
G1 X102.502 Y80.646 E.02556
; LINE_WIDTH: 0.409108
G1 X102.502 Y82.646 E.02555
; LINE_WIDTH: 0.408988
G1 X102.502 Y84.646 E.02554
; LINE_WIDTH: 0.408858
G1 X102.502 Y86.646 E.02553
; LINE_WIDTH: 0.408728
G1 X102.502 Y88.646 E.02553
; LINE_WIDTH: 0.408608
G1 X102.503 Y90.646 E.02552
; LINE_WIDTH: 0.408478
G1 X102.503 Y92.646 E.02551
; LINE_WIDTH: 0.408358
G1 X102.503 Y94.646 E.0255
; LINE_WIDTH: 0.408228
G1 X102.503 Y96.646 E.02549
; LINE_WIDTH: 0.408098
G1 X102.503 Y98.646 E.02548
; LINE_WIDTH: 0.407978
G1 X102.504 Y100.646 E.02548
; LINE_WIDTH: 0.407848
G1 X102.504 Y102.646 E.02547
; LINE_WIDTH: 0.407728
G1 X102.504 Y103.3 E.00832
G1 X102.436 Y103.634 E.00434
; LINE_WIDTH: 0.405878
G1 X102.27 Y103.898 E.00395
; LINE_WIDTH: 0.408498
G1 X102.221 Y103.937 E.0008
; WIPE_START
G1 F12000
M204 S6000
G1 X101.995 Y104.11 E-.10837
G1 X101.581 Y104.202 E-.16101
G1 X100.29 Y104.202 E-.49063
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.167 Y98.544 Z7.7 F42000
G1 X79.387 Y81.116 Z7.7
G1 Z7.3
G1 E.8 F1800
; LINE_WIDTH: 0.392908
G1 F1696
M204 S5000
G1 X79.407 Y80.863 E.00311
; LINE_WIDTH: 0.392368
G1 X79.537 Y80.621 E.00336
G1 X79.751 Y80.449 E.00336
G1 X80.016 Y80.374 E.00336
G1 X80.288 Y80.407 E.00336
G1 X80.527 Y80.543 E.00336
; LINE_WIDTH: 0.398848
G1 X80.696 Y80.76 E.00342
G1 X80.766 Y81.03 E.00347
; LINE_WIDTH: 0.398448
G1 X80.683 Y81.381 E.00447
; LINE_WIDTH: 0.389208
G1 X80.502 Y81.603 E.00348
; LINE_WIDTH: 0.385968
G1 X80.259 Y81.729 E.00329
G1 X79.986 Y81.75 E.00329
G1 X79.727 Y81.664 E.00329
; LINE_WIDTH: 0.389428
G1 X79.52 Y81.485 E.00332
; LINE_WIDTH: 0.392908
G1 X79.394 Y81.174 E.00411
; WIPE_START
G1 F12000
M204 S6000
G1 X79.407 Y80.863 E-.11823
G1 X79.537 Y80.621 E-.10433
G1 X79.751 Y80.449 E-.10444
G1 X80.016 Y80.374 E-.10446
G1 X80.288 Y80.407 E-.10441
G1 X80.527 Y80.543 E-.10438
G1 X80.696 Y80.76 E-.10458
G1 X80.706 Y80.799 E-.01517
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.7 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.38
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 91/100
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
; OBJECT_ID: 15
G1 X102.225 Y104.418 F42000
G1 Z7.38
G1 E.8 F1800
; LINE_WIDTH: 0.413768
G1 F1690
M204 S5000
G1 X102.002 Y104.524 E.00319
G1 X101.585 Y104.595 E.00546
; LINE_WIDTH: 0.410248
G1 X99.585 Y104.595 E.02562
; LINE_WIDTH: 0.410098
G1 X97.585 Y104.595 E.02562
; LINE_WIDTH: 0.409958
G1 X95.585 Y104.595 E.02561
; LINE_WIDTH: 0.409808
G1 X93.585 Y104.595 E.0256
; LINE_WIDTH: 0.409668
G1 X91.585 Y104.595 E.02559
; LINE_WIDTH: 0.409528
G1 X89.585 Y104.595 E.02558
; LINE_WIDTH: 0.409378
G1 X87.585 Y104.595 E.02557
; LINE_WIDTH: 0.409238
G1 X85.585 Y104.595 E.02556
; LINE_WIDTH: 0.409098
G1 X83.585 Y104.596 E.02555
; LINE_WIDTH: 0.408948
G1 X81.585 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.585 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.596 E.01481
; LINE_WIDTH: 0.410688
G1 X78.114 Y104.558 E.00401
; LINE_WIDTH: 0.415148
G1 X77.765 Y104.419 E.00487
G1 X77.44 Y104.159 E.00541
; LINE_WIDTH: 0.405648
G1 X77.203 Y103.774 E.00573
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.285 E.00636
G1 X77.104 Y76.724 E.33887
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408228
G1 X77.697 Y75.619 E.00538
; LINE_WIDTH: 0.413578
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410278
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409838
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409628
G1 X86.415 Y75.405 E.02558
; LINE_WIDTH: 0.409408
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409198
G1 X90.415 Y75.405 E.02556
; LINE_WIDTH: 0.408978
G1 X92.415 Y75.405 E.02554
; LINE_WIDTH: 0.408768
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408548
G1 X96.415 Y75.405 E.02551
; LINE_WIDTH: 0.408328
G1 X98.415 Y75.405 E.0255
; LINE_WIDTH: 0.408118
G1 X100.415 Y75.406 E.02549
; LINE_WIDTH: 0.407898
G1 X101.6 Y75.406 E.0151
; LINE_WIDTH: 0.408068
G1 X101.938 Y75.455 E.00435
; LINE_WIDTH: 0.414808
G1 X102.29 Y75.615 E.00501
G1 X102.536 Y75.818 E.00413
; LINE_WIDTH: 0.407858
G1 X102.78 Y76.178 E.00554
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00616
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
G1 X102.817 Y103.717 E.00573
; LINE_WIDTH: 0.406568
G1 X102.61 Y104.092 E.00544
; LINE_WIDTH: 0.408008
G1 X102.306 Y104.379 E.00532
; LINE_WIDTH: 0.413768
G1 X102.279 Y104.392 E.00039
M204 S250
G1 X102.161 Y103.983 F42000
; LINE_WIDTH: 0.406648
G1 F1690
M204 S5000
G1 X101.994 Y104.109 E.00265
; LINE_WIDTH: 0.405488
G1 X101.669 Y104.198 E.00426
; LINE_WIDTH: 0.410248
G1 X99.571 Y104.202 E.02688
; LINE_WIDTH: 0.410098
G1 X97.571 Y104.202 E.02562
; LINE_WIDTH: 0.409958
G1 X95.571 Y104.202 E.02561
; LINE_WIDTH: 0.409808
G1 X93.571 Y104.203 E.0256
; LINE_WIDTH: 0.409668
G1 X91.571 Y104.203 E.02559
; LINE_WIDTH: 0.409528
G1 X89.571 Y104.203 E.02558
; LINE_WIDTH: 0.409378
G1 X87.571 Y104.203 E.02557
; LINE_WIDTH: 0.409238
G1 X85.571 Y104.204 E.02556
; LINE_WIDTH: 0.409098
G1 X83.571 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.571 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.571 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.204 E.01463
G1 X78.058 Y104.131 E.00477
; LINE_WIDTH: 0.406578
G1 X77.734 Y103.905 E.00501
; LINE_WIDTH: 0.407378
G1 X77.541 Y103.572 E.0049
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.271 E.00389
G1 X77.496 Y76.724 E.33869
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411228
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405398
G1 X78.33 Y75.802 E.00421
; LINE_WIDTH: 0.410278
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.410058
G1 X82.429 Y75.798 E.02561
; LINE_WIDTH: 0.409838
G1 X84.429 Y75.798 E.0256
; LINE_WIDTH: 0.409628
G1 X86.429 Y75.798 E.02558
; LINE_WIDTH: 0.409408
G1 X88.429 Y75.797 E.02557
; LINE_WIDTH: 0.409198
G1 X90.429 Y75.797 E.02556
; LINE_WIDTH: 0.408978
G1 X92.429 Y75.797 E.02554
; LINE_WIDTH: 0.408758
G1 X94.429 Y75.797 E.02553
; LINE_WIDTH: 0.408548
G1 X96.429 Y75.797 E.02551
; LINE_WIDTH: 0.408328
G1 X98.429 Y75.796 E.0255
; LINE_WIDTH: 0.408118
G1 X100.429 Y75.796 E.02549
; LINE_WIDTH: 0.407898
G1 X101.6 Y75.796 E.01491
; LINE_WIDTH: 0.407778
G1 X101.942 Y75.869 E.00445
; LINE_WIDTH: 0.405608
G1 X102.26 Y76.087 E.00487
; LINE_WIDTH: 0.408018
G1 X102.431 Y76.354 E.00405
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407738
G1 X102.504 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.504 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.504 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.504 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.504 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.504 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.504 Y103.276 E.03286
G1 X102.461 Y103.56 E.00367
; LINE_WIDTH: 0.406648
M73 P92 R1
G1 X102.272 Y103.9 E.00494
G1 X102.209 Y103.947 E.001
; WIPE_START
G1 F12000
M204 S6000
G1 X101.994 Y104.109 E-.10218
G1 X101.669 Y104.198 E-.12795
G1 X100.275 Y104.201 E-.52987
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.149 Y98.545 Z7.78 F42000
G1 X79.396 Y81.163 Z7.78
G1 Z7.38
G1 E.8 F1800
; LINE_WIDTH: 0.392908
G1 F1690
M204 S5000
G1 X79.405 Y80.877 E.0035
G1 X79.537 Y80.621 E.00353
; LINE_WIDTH: 0.392368
G1 X79.751 Y80.449 E.00336
G1 X80.015 Y80.374 E.00336
G1 X80.288 Y80.407 E.00336
G1 X80.527 Y80.543 E.00336
; LINE_WIDTH: 0.398928
G1 X80.696 Y80.76 E.00342
; LINE_WIDTH: 0.413048
G1 X80.759 Y81.031 E.00359
G1 X80.758 Y81.118 E.00112
; LINE_WIDTH: 0.389268
G1 X80.677 Y81.393 E.00348
; LINE_WIDTH: 0.385948
G1 X80.502 Y81.603 E.00329
G1 X80.259 Y81.729 E.00329
G1 X79.987 Y81.75 E.00329
G1 X79.727 Y81.664 E.00328
; LINE_WIDTH: 0.389428
G1 X79.52 Y81.485 E.00332
G1 X79.399 Y81.222 E.00352
; WIPE_START
G1 F12000
M204 S6000
G1 X79.405 Y80.877 E-.13097
G1 X79.537 Y80.621 E-.10944
G1 X79.751 Y80.449 E-.10446
G1 X80.015 Y80.374 E-.10437
G1 X80.288 Y80.407 E-.10447
G1 X80.527 Y80.543 E-.10445
G1 X80.692 Y80.754 E-.10185
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.78 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.46
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 92/100
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
; OBJECT_ID: 15
G1 X102.22 Y104.418 F42000
G1 Z7.46
G1 E.8 F1800
; LINE_WIDTH: 0.413708
G1 F1690
M204 S5000
G1 X102.008 Y104.522 E.00306
G1 X101.585 Y104.595 E.00554
; LINE_WIDTH: 0.410248
G1 X99.585 Y104.595 E.02562
; LINE_WIDTH: 0.410098
G1 X97.585 Y104.595 E.02562
; LINE_WIDTH: 0.409958
G1 X95.585 Y104.595 E.02561
; LINE_WIDTH: 0.409808
G1 X93.585 Y104.595 E.0256
; LINE_WIDTH: 0.409668
G1 X91.585 Y104.595 E.02559
; LINE_WIDTH: 0.409528
G1 X89.585 Y104.595 E.02558
; LINE_WIDTH: 0.409378
G1 X87.585 Y104.595 E.02557
; LINE_WIDTH: 0.409238
G1 X85.585 Y104.595 E.02556
; LINE_WIDTH: 0.409098
G1 X83.585 Y104.596 E.02555
; LINE_WIDTH: 0.408948
G1 X81.585 Y104.596 E.02554
; LINE_WIDTH: 0.408808
G1 X79.585 Y104.596 E.02553
; LINE_WIDTH: 0.408668
G1 X78.329 Y104.587 E.01603
; LINE_WIDTH: 0.406028
G1 X77.933 Y104.498 E.00515
G1 X77.58 Y104.289 E.00519
; LINE_WIDTH: 0.411268
G1 X77.306 Y103.984 E.00527
G1 X77.201 Y103.767 E.00309
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.285 E.00627
G1 X77.104 Y76.724 E.33888
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403938
G1 X77.378 Y75.916 E.00528
; LINE_WIDTH: 0.407318
G1 X77.695 Y75.623 E.0055
; LINE_WIDTH: 0.413578
G1 X77.998 Y75.476 E.00435
G1 X78.415 Y75.405 E.00546
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
; LINE_WIDTH: 0.409178
G1 X90.415 Y75.405 E.02555
; LINE_WIDTH: 0.408968
G1 X92.415 Y75.405 E.02554
; LINE_WIDTH: 0.408748
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408538
G1 X96.415 Y75.405 E.02551
; LINE_WIDTH: 0.408318
G1 X98.415 Y75.405 E.0255
; LINE_WIDTH: 0.408108
G1 X100.415 Y75.406 E.02549
; LINE_WIDTH: 0.407888
G1 X101.6 Y75.406 E.0151
; LINE_WIDTH: 0.407768
G1 X101.899 Y75.447 E.00385
; LINE_WIDTH: 0.413468
G1 X102.291 Y75.614 E.00549
G1 X102.511 Y75.795 E.00368
; LINE_WIDTH: 0.407888
G1 X102.781 Y76.179 E.00598
; LINE_WIDTH: 0.409528
G1 X102.893 Y76.646 E.00615
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
G1 X102.832 Y103.679 E.0052
; LINE_WIDTH: 0.405878
G1 X102.631 Y104.065 E.00551
; LINE_WIDTH: 0.408218
G1 X102.313 Y104.373 E.00565
; LINE_WIDTH: 0.413708
G1 X102.274 Y104.392 E.00056
M204 S250
G1 X102.174 Y103.966 F42000
; LINE_WIDTH: 0.405638
G1 F1690
M204 S5000
G1 X101.994 Y104.109 E.00292
G1 X101.669 Y104.198 E.00426
; LINE_WIDTH: 0.410248
G1 X99.57 Y104.202 E.02689
; LINE_WIDTH: 0.410098
G1 X97.57 Y104.202 E.02562
; LINE_WIDTH: 0.409958
G1 X95.57 Y104.202 E.02561
; LINE_WIDTH: 0.409808
G1 X93.57 Y104.203 E.0256
; LINE_WIDTH: 0.409668
G1 X91.57 Y104.203 E.02559
; LINE_WIDTH: 0.409528
G1 X89.57 Y104.203 E.02558
; LINE_WIDTH: 0.409378
G1 X87.57 Y104.203 E.02557
; LINE_WIDTH: 0.409238
G1 X85.57 Y104.204 E.02556
; LINE_WIDTH: 0.409098
G1 X83.57 Y104.204 E.02555
; LINE_WIDTH: 0.408948
G1 X81.57 Y104.204 E.02554
; LINE_WIDTH: 0.408808
G1 X79.57 Y104.204 E.02553
; LINE_WIDTH: 0.408668
G1 X78.425 Y104.204 E.01462
G1 X78.098 Y104.147 E.00423
; LINE_WIDTH: 0.408228
G1 X77.767 Y103.941 E.00497
G1 X77.569 Y103.646 E.00454
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.271 E.00487
G1 X77.496 Y76.724 E.33869
G1 X77.541 Y76.425 E.00386
; LINE_WIDTH: 0.407338
G1 X77.728 Y76.1 E.00477
G1 X78.01 Y75.889 E.00447
; LINE_WIDTH: 0.405388
G1 X78.331 Y75.802 E.00421
; LINE_WIDTH: 0.410258
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.410038
G1 X82.429 Y75.798 E.02561
; LINE_WIDTH: 0.409828
G1 X84.429 Y75.798 E.0256
; LINE_WIDTH: 0.409608
G1 X86.429 Y75.798 E.02558
; LINE_WIDTH: 0.409398
G1 X88.429 Y75.797 E.02557
; LINE_WIDTH: 0.409178
G1 X90.429 Y75.797 E.02555
; LINE_WIDTH: 0.408968
G1 X92.429 Y75.797 E.02554
; LINE_WIDTH: 0.408748
G1 X94.429 Y75.797 E.02553
; LINE_WIDTH: 0.408538
G1 X96.429 Y75.797 E.02551
; LINE_WIDTH: 0.408318
G1 X98.429 Y75.796 E.0255
; LINE_WIDTH: 0.408108
G1 X100.429 Y75.796 E.02549
; LINE_WIDTH: 0.407888
G1 X101.6 Y75.796 E.01491
; LINE_WIDTH: 0.407768
G1 X101.905 Y75.855 E.00395
; LINE_WIDTH: 0.404678
G1 X102.231 Y76.06 E.00487
; LINE_WIDTH: 0.408048
G1 X102.431 Y76.354 E.00453
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407738
G1 X102.504 Y80.7 E.05092
; LINE_WIDTH: 0.407878
G1 X102.504 Y84.7 E.05094
; LINE_WIDTH: 0.408008
G1 X102.504 Y88.7 E.05096
; LINE_WIDTH: 0.408148
G1 X102.504 Y92.7 E.05098
; LINE_WIDTH: 0.408278
G1 X102.504 Y96.7 E.05099
; LINE_WIDTH: 0.408418
G1 X102.504 Y100.7 E.05101
; LINE_WIDTH: 0.408558
G1 X102.504 Y103.276 E.03286
G1 X102.464 Y103.551 E.00355
; LINE_WIDTH: 0.406368
G1 X102.296 Y103.869 E.00455
; LINE_WIDTH: 0.405638
G1 X102.221 Y103.928 E.00121
; WIPE_START
G1 F12000
M204 S6000
G1 X101.994 Y104.109 E-.11056
G1 X101.669 Y104.198 E-.12785
G1 X100.296 Y104.201 E-.52159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.164 Y98.551 Z7.86 F42000
G1 X79.397 Y81.197 Z7.86
G1 Z7.46
G1 E.8 F1800
; LINE_WIDTH: 0.390848
G1 F1690
M204 S5000
G1 X79.386 Y80.964 E.00283
; LINE_WIDTH: 0.398468
G1 X79.514 Y80.644 E.00429
G1 X79.802 Y80.427 E.00448
; LINE_WIDTH: 0.384808
G1 X80.136 Y80.385 E.00403
; LINE_WIDTH: 0.392748
G1 X80.414 Y80.463 E.00355
G1 X80.621 Y80.645 E.00337
; LINE_WIDTH: 0.398488
G1 X80.759 Y80.961 E.00429
G1 X80.754 Y81.166 E.00255
; LINE_WIDTH: 0.388248
G1 X80.661 Y81.424 E.00331
; LINE_WIDTH: 0.390788
G1 X80.443 Y81.652 E.00384
G1 X80.101 Y81.758 E.00437
; LINE_WIDTH: 0.387548
G1 X79.783 Y81.693 E.00391
; LINE_WIDTH: 0.386868
G1 X79.527 Y81.49 E.00394
; LINE_WIDTH: 0.390848
G1 X79.408 Y81.255 E.00322
; WIPE_START
G1 F12000
M204 S6000
G1 X79.386 Y80.964 E-.11063
G1 X79.514 Y80.644 E-.13102
G1 X79.802 Y80.427 E-.13701
G1 X80.136 Y80.385 E-.12768
G1 X80.414 Y80.463 E-.11004
G1 X80.621 Y80.645 E-.1045
G1 X80.662 Y80.739 E-.03913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.86 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.54
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 93/100
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
; OBJECT_ID: 15
G1 X77.9 Y84.844 F42000
G1 Z7.54
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.505758
G1 F2173
M204 S6000
G1 X77.883 Y84.844 E.00027
G1 X77.853 Y84.844 E.00049
G1 X77.822 Y84.844 E.00049
G1 X77.792 Y84.844 E.00049
G1 X77.761 Y84.844 E.00049
G1 X77.731 Y84.844 E.00049
G1 X77.7 Y84.844 E.00049
G1 X77.672 Y84.864 E.00055
G1 X77.644 Y84.892 E.00062
G1 X77.617 Y84.919 E.00062
G1 X77.589 Y84.947 E.00062
G1 X77.561 Y84.974 E.00062
G1 X77.556 Y84.042 E.01485
G1 X77.561 Y84.047 E.00012
G1 X77.589 Y84.07 E.00057
G1 X77.617 Y84.093 E.00057
G1 X77.644 Y84.116 E.00057
G1 X77.672 Y84.139 E.00057
G2 X77.7 Y84.156 I.024 J-.009 E.00057
G1 X77.731 Y84.156 E.00049
G1 F1313.057
G1 X77.761 Y84.156 E.00049
G1 F1164.191
G1 X77.792 Y84.156 E.00049
G1 F1024.28
G1 X77.822 Y84.156 E.00049
G1 F893.364
G1 X77.853 Y84.156 E.00049
G1 F771.357
G1 X77.883 Y84.156 E.00049
G1 F658.305
G1 X77.9 Y84.156 E.00027
; FEATURE: Overhang wall
M106 S255
G1 F600
M204 S5000
G1 X78.044 Y84.156 E.0023
G1 X78.044 Y84.844 E.01097
G1 X77.96 Y84.844 E.00134
M106 S201.45
; WIPE_START
M204 S6000
G1 X77.883 Y84.844 E-.02917
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
G1 X77.556 Y84.042 E-.35437
G1 X77.561 Y84.047 E-.00285
G1 X77.589 Y84.07 E-.01367
G1 X77.617 Y84.093 E-.01367
G1 X77.644 Y84.116 E-.01367
G1 X77.672 Y84.139 E-.01366
G1 X77.7 Y84.156 E-.0125
G1 X77.731 Y84.156 E-.01161
G1 X77.761 Y84.156 E-.01161
G1 X77.792 Y84.156 E-.01161
G1 X77.822 Y84.156 E-.0116
G1 X77.853 Y84.156 E-.01161
G1 X77.883 Y84.156 E-.01161
G1 X77.9 Y84.156 E-.00638
G1 X78.044 Y84.156 E-.05483
G1 X78.044 Y84.244 E-.03362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.94 I-.769 J.943 P1  F42000
G1 X102.194 Y103.946 Z7.94
G1 Z7.54
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.406548
G1 F2173
M204 S5000
G1 X102.025 Y104.093 E.00284
M73 P93 R1
G1 X101.669 Y104.198 E.00471
; LINE_WIDTH: 0.410258
G1 X99.571 Y104.202 E.02689
; LINE_WIDTH: 0.410088
G1 X97.571 Y104.202 E.02561
; LINE_WIDTH: 0.409918
G1 X95.571 Y104.203 E.0256
; LINE_WIDTH: 0.409748
G1 X93.571 Y104.203 E.02559
; LINE_WIDTH: 0.409588
G1 X91.571 Y104.203 E.02558
; LINE_WIDTH: 0.409418
G1 X89.571 Y104.203 E.02557
; LINE_WIDTH: 0.409248
G1 X87.571 Y104.204 E.02556
; LINE_WIDTH: 0.409078
G1 X85.571 Y104.204 E.02555
; LINE_WIDTH: 0.408918
G1 X83.571 Y104.204 E.02554
; LINE_WIDTH: 0.408748
G1 X81.741 Y104.204 E.02335
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
G1 F2173
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
G1 X78.425 Y104.204 E.01319
G1 X78.021 Y104.116 E.00527
; LINE_WIDTH: 0.406678
G1 X77.734 Y103.905 E.00452
; LINE_WIDTH: 0.407368
G1 X77.541 Y103.572 E.0049
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.271 E.00389
G1 X77.496 Y85.491 E.22683
; LINE_WIDTH: 0.409568
G1 X77.513 Y85.474 E.00031
; LINE_WIDTH: 0.410548
G1 X77.529 Y85.457 E.00031
; LINE_WIDTH: 0.411528
G1 X77.546 Y85.44 E.00031
; LINE_WIDTH: 0.412508
G1 X77.563 Y85.422 E.00031
; LINE_WIDTH: 0.413488
G1 X77.58 Y85.405 E.00031
; LINE_WIDTH: 0.414468
G1 X77.596 Y85.388 E.00031
; LINE_WIDTH: 0.415448
G1 X77.613 Y85.37 E.00031
; LINE_WIDTH: 0.416418
G1 X77.63 Y85.353 E.00031
; LINE_WIDTH: 0.417398
G1 X77.647 Y85.336 E.00031
; LINE_WIDTH: 0.418378
G1 X77.664 Y85.319 E.00031
; LINE_WIDTH: 0.419358
G1 X77.68 Y85.301 E.00032
; LINE_WIDTH: 0.419998
G1 X77.7 Y85.29 E.0003
G1 X77.725 Y85.29 E.00033
G1 X77.75 Y85.29 E.00033
G1 X77.776 Y85.29 E.00033
G1 X77.801 Y85.29 E.00033
G1 F984.322
G1 X77.826 Y85.29 E.00033
G1 F877.901
G1 X77.851 Y85.29 E.00033
G1 F777.566
G1 X77.876 Y85.29 E.00033
G1 F683.354
G1 X77.9 Y85.29 E.00031
; FEATURE: Overhang wall
M106 S255
G1 F600
G1 X78.49 Y85.29 E.00775
G1 X78.49 Y83.71 E.02075
G1 X77.9 Y83.71 E.00775
M106 S201.45
; FEATURE: Outer wall
G1 F683.39
G1 X77.876 Y83.71 E.00031
G1 F777.604
G1 X77.851 Y83.71 E.00033
G1 F877.942
G1 X77.826 Y83.71 E.00033
G1 F984.366
G1 X77.801 Y83.71 E.00033
G1 F1096.831
G1 X77.776 Y83.71 E.00033
G1 F1215.426
G1 X77.75 Y83.71 E.00033
G1 F1340.107
G1 X77.725 Y83.71 E.00033
G1 F1470.876
G1 X77.7 Y83.71 E.00033
G1 F1594.002
G1 X77.68 Y83.699 E.0003
; LINE_WIDTH: 0.419348
G1 F1730.079
G1 X77.664 Y83.681 E.00032
; LINE_WIDTH: 0.418368
G1 F1871.643
G1 X77.647 Y83.664 E.00031
; LINE_WIDTH: 0.417388
G1 F2018.862
G1 X77.63 Y83.647 E.00031
; LINE_WIDTH: 0.416408
G1 F2171.562
G1 X77.613 Y83.63 E.00031
; LINE_WIDTH: 0.415438
G1 F2173
G1 X77.596 Y83.612 E.00031
; LINE_WIDTH: 0.414458
G1 X77.58 Y83.595 E.00031
; LINE_WIDTH: 0.413478
G1 X77.563 Y83.578 E.00031
; LINE_WIDTH: 0.412498
G1 X77.546 Y83.56 E.00031
; LINE_WIDTH: 0.411518
G1 X77.529 Y83.543 E.00031
; LINE_WIDTH: 0.410538
G1 X77.512 Y83.526 E.00031
; LINE_WIDTH: 0.409558
G1 X77.496 Y83.509 E.00031
; LINE_WIDTH: 0.408588
G1 X77.496 Y83.109 E.0051
G1 X77.496 Y82.709 E.0051
G1 X77.496 Y76.724 E.07635
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411198
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405388
G1 X78.331 Y75.802 E.00421
; LINE_WIDTH: 0.410258
G3 X79.6 Y75.798 I.685 J17.184 E.01627
; LINE_WIDTH: 0.410128
G1 X81.6 Y75.798 E.02562
; LINE_WIDTH: 0.409908
G1 X83.6 Y75.798 E.0256
; LINE_WIDTH: 0.409698
G1 X85.6 Y75.798 E.02559
; LINE_WIDTH: 0.409478
G1 X87.6 Y75.797 E.02557
; LINE_WIDTH: 0.409268
G1 X89.6 Y75.797 E.02556
; LINE_WIDTH: 0.409048
G1 X91.6 Y75.797 E.02555
; LINE_WIDTH: 0.408828
G1 X93.6 Y75.797 E.02553
; LINE_WIDTH: 0.408618
G1 X95.6 Y75.797 E.02552
; LINE_WIDTH: 0.408398
G1 X97.6 Y75.797 E.0255
; LINE_WIDTH: 0.408188
G1 X99.6 Y75.796 E.02549
; LINE_WIDTH: 0.407968
G1 X101.6 Y75.796 E.02548
; LINE_WIDTH: 0.410948
G1 X101.833 Y75.832 E.00303
G1 X102.169 Y76.005 E.00484
; LINE_WIDTH: 0.407358
G1 X102.413 Y76.314 E.00501
; LINE_WIDTH: 0.408078
G1 X102.503 Y76.665 E.00462
G1 X102.504 Y78.759 E.02667
; LINE_WIDTH: 0.408838
G1 X102.487 Y78.776 E.00031
; LINE_WIDTH: 0.409928
G1 X102.471 Y78.794 E.00031
; LINE_WIDTH: 0.411018
G1 X102.455 Y78.812 E.00031
; LINE_WIDTH: 0.412108
G1 X102.438 Y78.83 E.00031
; LINE_WIDTH: 0.413198
G1 X102.422 Y78.848 E.00031
; LINE_WIDTH: 0.414288
G1 X102.405 Y78.866 E.00031
; LINE_WIDTH: 0.415378
G1 X102.389 Y78.884 E.00032
; LINE_WIDTH: 0.416468
G1 X102.372 Y78.902 E.00032
; LINE_WIDTH: 0.417558
G1 X102.356 Y78.92 E.00032
; LINE_WIDTH: 0.418648
G1 X102.34 Y78.938 E.00032
; LINE_WIDTH: 0.419738
G1 X102.323 Y78.955 E.00032
; LINE_WIDTH: 0.419998
G1 X102.3 Y78.96 E.00031
G1 X102.275 Y78.96 E.00033
G1 X102.25 Y78.96 E.00033
G1 X102.224 Y78.96 E.00033
G1 X102.199 Y78.96 E.00033
G1 F984.322
G1 X102.174 Y78.96 E.00033
G1 F877.901
G1 X102.149 Y78.96 E.00033
G1 F777.566
G1 X102.124 Y78.96 E.00033
G1 F683.354
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
G1 F1593.824
G1 X102.32 Y80.051 E.0003
; LINE_WIDTH: 0.419318
G1 F1729.732
G1 X102.336 Y80.069 E.00032
; LINE_WIDTH: 0.418268
G1 F1871.157
G1 X102.353 Y80.086 E.00031
; LINE_WIDTH: 0.417218
G1 F2018.227
G1 X102.37 Y80.103 E.00031
; LINE_WIDTH: 0.416178
G1 F2170.769
G1 X102.387 Y80.12 E.00031
; LINE_WIDTH: 0.415128
G1 F2173
G1 X102.403 Y80.138 E.00031
; LINE_WIDTH: 0.414078
G1 X102.42 Y80.155 E.00031
; LINE_WIDTH: 0.413038
G1 X102.437 Y80.172 E.00031
; LINE_WIDTH: 0.411988
G1 X102.454 Y80.19 E.00031
; LINE_WIDTH: 0.410938
G1 X102.47 Y80.207 E.00031
; LINE_WIDTH: 0.409898
G1 X102.487 Y80.224 E.00031
; LINE_WIDTH: 0.408848
G1 X102.504 Y80.241 E.00031
; LINE_WIDTH: 0.407858
G1 X102.504 Y80.641 E.00509
G1 X102.504 Y81.041 E.00509
G1 X102.504 Y84.241 E.04075
; LINE_WIDTH: 0.407998
G1 X102.504 Y88.241 E.05096
; LINE_WIDTH: 0.408138
G1 X102.504 Y92.241 E.05097
; LINE_WIDTH: 0.408268
G1 X102.504 Y96.241 E.05099
; LINE_WIDTH: 0.408398
G1 X102.504 Y97.759 E.01935
; LINE_WIDTH: 0.409428
G1 X102.488 Y97.776 E.00031
; LINE_WIDTH: 0.410458
G1 X102.471 Y97.794 E.00031
; LINE_WIDTH: 0.411488
G1 X102.455 Y97.812 E.00031
; LINE_WIDTH: 0.412528
G1 X102.438 Y97.83 E.00031
; LINE_WIDTH: 0.413558
G1 X102.422 Y97.848 E.00031
; LINE_WIDTH: 0.414588
G1 X102.405 Y97.866 E.00032
; LINE_WIDTH: 0.415628
G1 X102.389 Y97.884 E.00032
; LINE_WIDTH: 0.416658
G1 X102.373 Y97.902 E.00032
; LINE_WIDTH: 0.417688
G1 X102.356 Y97.92 E.00032
; LINE_WIDTH: 0.418728
G1 X102.34 Y97.938 E.00032
; LINE_WIDTH: 0.419758
G1 X102.323 Y97.956 E.00032
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
G1 F1593.899
G1 X102.32 Y99.051 E.0003
; LINE_WIDTH: 0.419348
G1 F1729.931
G1 X102.336 Y99.069 E.00032
; LINE_WIDTH: 0.418358
G1 F1871.533
G1 X102.353 Y99.086 E.00031
; LINE_WIDTH: 0.417368
G1 F2018.659
G1 X102.37 Y99.103 E.00031
; LINE_WIDTH: 0.416378
G1 F2171.398
G1 X102.387 Y99.121 E.00031
; LINE_WIDTH: 0.415388
G1 F2173
G1 X102.404 Y99.138 E.00031
; LINE_WIDTH: 0.414398
G1 X102.42 Y99.155 E.00031
; LINE_WIDTH: 0.413408
G1 X102.437 Y99.172 E.00031
; LINE_WIDTH: 0.412418
G1 X102.454 Y99.19 E.00031
; LINE_WIDTH: 0.411428
G1 X102.471 Y99.207 E.00031
; LINE_WIDTH: 0.410438
G1 X102.487 Y99.224 E.00031
; LINE_WIDTH: 0.409448
G1 X102.504 Y99.241 E.00031
; LINE_WIDTH: 0.408708
G1 X102.504 Y99.641 E.0051
G1 X102.504 Y100.041 E.0051
G1 X102.504 Y101.241 E.01531
; LINE_WIDTH: 0.408978
G1 X102.504 Y103.275 E.02597
; LINE_WIDTH: 0.411558
G1 X102.477 Y103.495 E.00284
G1 X102.322 Y103.834 E.00479
; LINE_WIDTH: 0.406548
G1 X102.239 Y103.906 E.0014
M204 S250
G1 X102.219 Y104.412 F42000
; LINE_WIDTH: 0.415258
G1 F2173
M204 S5000
G1 X102.002 Y104.523 E.00317
G1 X101.585 Y104.595 E.00548
; LINE_WIDTH: 0.410258
G1 X99.585 Y104.595 E.02563
; LINE_WIDTH: 0.410088
G1 X97.585 Y104.595 E.02561
; LINE_WIDTH: 0.409918
G1 X95.585 Y104.595 E.0256
; LINE_WIDTH: 0.409748
G1 X93.585 Y104.595 E.02559
; LINE_WIDTH: 0.409588
G1 X91.585 Y104.595 E.02558
; LINE_WIDTH: 0.409418
G1 X89.585 Y104.595 E.02557
; LINE_WIDTH: 0.409248
G1 X87.585 Y104.595 E.02556
; LINE_WIDTH: 0.409078
G1 X85.585 Y104.596 E.02555
; LINE_WIDTH: 0.408918
G1 X83.585 Y104.596 E.02554
; LINE_WIDTH: 0.408748
G1 X81.741 Y104.596 E.02353
; LINE_WIDTH: 0.419998
G1 X81.741 Y104.59 E.00007
G2 X80.259 Y104.596 I-.372 J96.105 E.01947
; LINE_WIDTH: 0.408588
G1 X78.425 Y104.596 E.0234
; LINE_WIDTH: 0.413048
G1 X78.115 Y104.557 E.00403
G1 X77.763 Y104.42 E.00487
; LINE_WIDTH: 0.412868
G1 X77.44 Y104.16 E.00534
; LINE_WIDTH: 0.405708
G1 X77.203 Y103.775 E.00573
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.285 E.00637
G1 X77.104 Y85.491 E.22702
; LINE_WIDTH: 0.419998
G2 X77.104 Y83.509 I-82.401 J-.991 E.02604
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.08656
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403928
G1 X77.39 Y75.908 E.00545
; LINE_WIDTH: 0.408248
G1 X77.698 Y75.619 E.00538
; LINE_WIDTH: 0.413588
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410258
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410038
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409818
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409608
G1 X86.415 Y75.405 E.02558
; LINE_WIDTH: 0.409388
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409178
G1 X90.415 Y75.405 E.02555
; LINE_WIDTH: 0.408958
G1 X92.415 Y75.405 E.02554
; LINE_WIDTH: 0.408748
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408528
G1 X96.415 Y75.405 E.02551
; LINE_WIDTH: 0.408308
G1 X98.415 Y75.405 E.0255
; LINE_WIDTH: 0.408098
G1 X100.415 Y75.406 E.02548
; LINE_WIDTH: 0.407878
G1 X101.6 Y75.406 E.0151
; LINE_WIDTH: 0.407758
G1 X101.836 Y75.435 E.00302
; LINE_WIDTH: 0.407388
G1 X102.264 Y75.598 E.00583
; LINE_WIDTH: 0.415128
G1 X102.579 Y75.865 E.00536
G1 X102.769 Y76.145 E.00438
; LINE_WIDTH: 0.408338
G1 X102.894 Y76.646 E.00659
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
G1 X102.896 Y103.275 E.02597
; LINE_WIDTH: 0.411558
G1 X102.854 Y103.614 E.00439
G1 X102.651 Y104.037 E.00602
; LINE_WIDTH: 0.406568
G1 X102.352 Y104.343 E.00544
; LINE_WIDTH: 0.415258
G1 X102.272 Y104.384 E.00117
; WIPE_START
G1 F12000
M204 S6000
G1 X102.002 Y104.523 E-.11563
G1 X101.585 Y104.595 E-.16051
G1 X100.312 Y104.595 E-.48386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.929 Y96.987 Z7.94 F42000
G1 X102.347 Y79.5 Z7.94
G1 Z7.54
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696418
M204 S6000
G1 X102.342 Y79.5 E.00011
; LINE_WIDTH: 0.696858
G1 X102.3 Y79.5 E.00094
; LINE_WIDTH: 0.697308
G1 X102.257 Y79.5 E.00094
; LINE_WIDTH: 0.697748
G1 X102.215 Y79.5 E.00094
; LINE_WIDTH: 0.698198
G1 X102.172 Y79.5 E.00095
; LINE_WIDTH: 0.698648
G1 X102.13 Y79.5 E.00095
; LINE_WIDTH: 0.698958
G1 X102.1 Y79.5 E.00066
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X102.05 Y79.5 E.00111
M106 S201.45
; WIPE_START
M204 S6000
G1 X102.1 Y79.5 E-.12779
G1 X102.13 Y79.5 E-.0755
G1 X102.172 Y79.5 E-.10882
G1 X102.215 Y79.5 E-.10882
G1 X102.257 Y79.5 E-.10882
G1 X102.3 Y79.5 E-.10882
G1 X102.342 Y79.5 E-.10882
G1 X102.347 Y79.5 E-.0126
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.94 I-1.217 J0 P1  F42000
G1 X102.349 Y98.5 Z7.94
G1 Z7.54
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696548
M204 S6000
G1 X102.342 Y98.5 E.00014
; LINE_WIDTH: 0.697018
G1 X102.3 Y98.5 E.00094
; LINE_WIDTH: 0.697478
G1 X102.257 Y98.5 E.00094
; LINE_WIDTH: 0.697948
G1 X102.215 Y98.5 E.00095
; LINE_WIDTH: 0.698418
G1 X102.172 Y98.5 E.00095
; LINE_WIDTH: 0.698878
G1 X102.129 Y98.5 E.00095
; LINE_WIDTH: 0.699208
G1 X102.1 Y98.5 E.00066
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X102.05 Y98.5 E.00111
M106 S201.45
; WIPE_START
M204 S6000
G1 X102.1 Y98.5 E-.12726
G1 X102.129 Y98.5 E-.07501
G1 X102.172 Y98.5 E-.10843
G1 X102.215 Y98.5 E-.1084
G1 X102.257 Y98.5 E-.1084
G1 X102.3 Y98.5 E-.10843
G1 X102.342 Y98.5 E-.1084
G1 X102.349 Y98.5 E-.01568
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.94 I-.306 J-1.178 P1  F42000
G1 X81 Y104.049 Z7.94
G1 Z7.54
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
G3 Z7.94 I1.214 J-.085 P1  F42000
G1 X79.4 Y81.168 Z7.94
G1 Z7.54
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.385768
G1 F2173
M204 S5000
G1 X79.383 Y80.999 E.00204
G1 X79.463 Y80.737 E.00328
; LINE_WIDTH: 0.398128
G1 X79.709 Y80.473 E.00448
G1 X79.978 Y80.375 E.00356
G1 X80.254 Y80.402 E.00344
; LINE_WIDTH: 0.400088
G1 X80.502 Y80.518 E.00341
; LINE_WIDTH: 0.415288
G3 X80.756 Y80.962 I-.531 J.598 E.00675
; LINE_WIDTH: 0.405248
G1 X80.759 Y81.097 E.00172
; LINE_WIDTH: 0.384968
G1 X80.692 Y81.363 E.00328
G1 X80.528 Y81.581 E.00327
G1 X80.292 Y81.718 E.00328
; LINE_WIDTH: 0.389228
G1 X80.021 Y81.755 E.00332
G1 X79.757 Y81.68 E.00333
; LINE_WIDTH: 0.385768
G1 X79.543 Y81.51 E.00328
G1 X79.411 Y81.27 E.00329
G1 X79.407 Y81.227 E.00052
; WIPE_START
G1 F12000
M204 S6000
G1 X79.383 Y80.999 E-.08746
G1 X79.463 Y80.737 E-.10388
G1 X79.709 Y80.473 E-.13722
G1 X79.978 Y80.375 E-.10901
G1 X80.254 Y80.402 E-.10538
G1 X80.502 Y80.518 E-.10392
G1 X80.657 Y80.705 E-.09225
G1 X80.677 Y80.756 E-.02089
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.94 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.62
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 94/100
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
; OBJECT_ID: 15
G1 X77.556 Y84.042 F42000
G1 Z7.62
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.505758
G1 F1827
M204 S6000
G1 X77.691 Y84.156 E.00282
G1 X78.044 Y84.156 E.00562
G1 X78.044 Y84.844 E.01097
G1 X77.691 Y84.844 E.00562
G1 X77.556 Y84.98 E.00306
M73 P93 R0
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
G3 Z8.02 I.284 J1.183 P1  F42000
G1 X101.51 Y78.96 Z8.02
G1 Z7.62
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1827
M204 S5000
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
G1 X101.51 Y97.96 E.01063
G1 X101.51 Y99.04 E.01418
G1 X102.309 Y99.04 E.01049
G1 X102.504 Y99.241 E.00369
; LINE_WIDTH: 0.408708
G1 X102.504 Y101.241 E.02552
; LINE_WIDTH: 0.408978
G1 X102.504 Y103.275 E.02597
; LINE_WIDTH: 0.410988
G1 X102.479 Y103.49 E.00278
G1 X102.323 Y103.834 E.00485
; LINE_WIDTH: 0.406548
G1 X102.025 Y104.093 E.005
G1 X101.669 Y104.198 E.00471
; LINE_WIDTH: 0.410248
G1 X99.57 Y104.202 E.02689
; LINE_WIDTH: 0.410078
G1 X97.57 Y104.202 E.02561
; LINE_WIDTH: 0.409908
G1 X95.57 Y104.203 E.0256
; LINE_WIDTH: 0.409748
M73 P94 R0
G1 X93.57 Y104.203 E.02559
; LINE_WIDTH: 0.409578
G1 X91.57 Y104.203 E.02558
; LINE_WIDTH: 0.409408
G1 X89.57 Y104.203 E.02557
; LINE_WIDTH: 0.409248
G1 X87.57 Y104.204 E.02556
; LINE_WIDTH: 0.409078
G1 X85.57 Y104.204 E.02555
; LINE_WIDTH: 0.408908
G1 X83.57 Y104.204 E.02554
; LINE_WIDTH: 0.408748
G1 X81.741 Y104.204 E.02334
; LINE_WIDTH: 0.419998
G1 X81.54 Y104.009 E.00369
G1 X81.54 Y103.01 E.01311
G1 X80.46 Y103.01 E.01418
G1 X80.46 Y104.009 E.01311
G1 X80.293 Y104.203 E.00337
; LINE_WIDTH: 0.411558
G1 X80.259 Y104.204 E.00044
; LINE_WIDTH: 0.408588
G1 X78.424 Y104.204 E.0234
G1 X78.103 Y104.149 E.00416
; LINE_WIDTH: 0.411658
G1 X77.779 Y103.948 E.00491
G1 X77.571 Y103.645 E.00472
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.275 E.00482
G1 X77.496 Y85.491 E.22689
; LINE_WIDTH: 0.419998
G1 X77.691 Y85.29 E.00369
G1 X78.49 Y85.29 E.01049
G1 X78.49 Y83.71 E.02075
G1 X77.8 Y83.71 E.00906
G1 X77.691 Y83.71 E.00143
G1 X77.496 Y83.509 E.00369
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.08656
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.411238
G1 X77.755 Y76.075 E.00496
G1 X78.01 Y75.889 E.00405
; LINE_WIDTH: 0.405388
G1 X78.331 Y75.802 E.00421
; LINE_WIDTH: 0.410258
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.410038
G1 X82.429 Y75.798 E.02561
; LINE_WIDTH: 0.409818
G1 X84.429 Y75.798 E.0256
; LINE_WIDTH: 0.409608
G1 X86.429 Y75.798 E.02558
; LINE_WIDTH: 0.409388
G1 X88.429 Y75.797 E.02557
; LINE_WIDTH: 0.409168
G1 X90.429 Y75.797 E.02555
; LINE_WIDTH: 0.408958
G1 X92.429 Y75.797 E.02554
; LINE_WIDTH: 0.408738
G1 X94.429 Y75.797 E.02553
; LINE_WIDTH: 0.408518
G1 X96.429 Y75.797 E.02551
; LINE_WIDTH: 0.408308
G1 X98.429 Y75.796 E.0255
; LINE_WIDTH: 0.408088
G1 X100.429 Y75.796 E.02548
; LINE_WIDTH: 0.407868
G1 X101.6 Y75.796 E.01491
; LINE_WIDTH: 0.407748
G1 X101.938 Y75.867 E.0044
; LINE_WIDTH: 0.405308
G1 X102.236 Y76.065 E.00453
; LINE_WIDTH: 0.405608
G1 X102.444 Y76.386 E.00484
; LINE_WIDTH: 0.408098
G1 X102.503 Y76.665 E.00363
G1 X102.504 Y78.665 E.02548
; LINE_WIDTH: 0.407758
G1 X102.504 Y78.759 E.00119
; LINE_WIDTH: 0.419998
G1 X102.319 Y78.96 E.00359
G1 X101.57 Y78.96 E.00984
; WIPE_START
G1 F12000
M204 S6000
G1 X101.51 Y80.04 E-.41105
G1 X102.309 Y80.04 E-.30346
G1 X102.392 Y80.126 E-.04549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.02 I-1.217 J-.009 P1  F42000
G1 X102.212 Y104.416 Z8.02
G1 Z7.62
G1 E.8 F1800
; LINE_WIDTH: 0.415268
G1 F1827
M204 S5000
G1 X102.002 Y104.523 E.00306
G1 X101.585 Y104.595 E.00549
; LINE_WIDTH: 0.410248
G1 X99.585 Y104.595 E.02562
; LINE_WIDTH: 0.410078
G1 X97.585 Y104.595 E.02561
; LINE_WIDTH: 0.409908
G1 X95.585 Y104.595 E.0256
; LINE_WIDTH: 0.409748
G1 X93.585 Y104.595 E.02559
; LINE_WIDTH: 0.409578
G1 X91.585 Y104.595 E.02558
; LINE_WIDTH: 0.409408
G1 X89.585 Y104.595 E.02557
; LINE_WIDTH: 0.409248
G1 X87.585 Y104.595 E.02556
; LINE_WIDTH: 0.409078
G1 X85.585 Y104.596 E.02555
; LINE_WIDTH: 0.408908
G1 X83.585 Y104.596 E.02554
; LINE_WIDTH: 0.408748
G1 X81.741 Y104.596 E.02353
; LINE_WIDTH: 0.419998
G1 X81.741 Y104.59 E.00007
G2 X80.259 Y104.596 I-.372 J96.105 E.01947
; LINE_WIDTH: 0.408588
G1 X78.424 Y104.596 E.0234
G1 X77.986 Y104.519 E.00568
; LINE_WIDTH: 0.403918
G1 X77.608 Y104.31 E.00544
; LINE_WIDTH: 0.411808
G1 X77.312 Y103.991 E.0056
; LINE_WIDTH: 0.415128
G1 X77.159 Y103.641 E.00496
G1 X77.104 Y103.287 E.00464
; LINE_WIDTH: 0.408588
G1 X77.104 Y85.491 E.22704
; LINE_WIDTH: 0.419998
G2 X77.104 Y83.509 I-82.401 J-.991 E.02604
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.08656
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403938
G1 X77.39 Y75.908 E.00544
; LINE_WIDTH: 0.408228
G1 X77.697 Y75.619 E.00538
; LINE_WIDTH: 0.413588
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410258
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410038
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409818
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409608
G1 X86.415 Y75.405 E.02558
; LINE_WIDTH: 0.409388
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409168
G1 X90.415 Y75.405 E.02555
; LINE_WIDTH: 0.408958
G1 X92.415 Y75.405 E.02554
; LINE_WIDTH: 0.408738
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408518
G1 X96.415 Y75.405 E.02551
; LINE_WIDTH: 0.408308
G1 X98.415 Y75.406 E.0255
; LINE_WIDTH: 0.408088
G1 X100.415 Y75.406 E.02548
; LINE_WIDTH: 0.407868
G1 X101.6 Y75.406 E.01509
; LINE_WIDTH: 0.408098
G1 X101.939 Y75.455 E.00436
; LINE_WIDTH: 0.412728
G1 X102.291 Y75.614 E.00498
G1 X102.512 Y75.796 E.0037
; LINE_WIDTH: 0.406738
G1 X102.782 Y76.18 E.00595
; LINE_WIDTH: 0.408338
G1 X102.894 Y76.646 E.00611
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
G1 X102.896 Y103.275 E.02597
; LINE_WIDTH: 0.410988
G1 X102.855 Y103.612 E.00435
G1 X102.647 Y104.051 E.00623
; LINE_WIDTH: 0.406578
G1 X102.353 Y104.343 E.00527
; LINE_WIDTH: 0.415268
G1 X102.265 Y104.388 E.00128
; WIPE_START
G1 F12000
M204 S6000
G1 X102.002 Y104.523 E-.11241
G1 X101.585 Y104.595 E-.1607
G1 X100.304 Y104.595 E-.4869
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.833 Y96.981 Z8.02 F42000
G1 X102.05 Y79.5 Z8.02
G1 Z7.62
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696368
G1 F1827
M204 S6000
G1 X102.347 Y79.5 E.00658
; WIPE_START
G1 F13250.883
G1 X102.05 Y79.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.05 Y87.132 Z8.02 F42000
G1 X102.05 Y98.5 Z8.02
G1 Z7.62
G1 E.8 F1800
; LINE_WIDTH: 0.696488
G1 F1827
M204 S6000
G1 X102.349 Y98.5 E.00661
; WIPE_START
G1 F13248.543
G1 X102.05 Y98.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.02 I-.31 J-1.177 P1  F42000
G1 X81 Y104.049 Z8.02
G1 Z7.62
G1 E.8 F1800
; LINE_WIDTH: 0.696528
G1 F1827
M204 S6000
G1 X81 Y103.55 E.01105
; WIPE_START
G1 F13247.763
G1 X81 Y104.049 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.02 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.7
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 95/100
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; OBJECT_ID: 15
G1 X77.556 Y84.042 F42000
G1 Z7.7
G1 E.8 F1800
; LINE_WIDTH: 0.505758
G1 F1832
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
G3 Z8.1 I.284 J1.183 P1  F42000
G1 X101.51 Y78.96 Z8.1
G1 Z7.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419998
G1 F1832
M204 S5000
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
G1 X101.51 Y97.96 E.01063
G1 X101.51 Y99.04 E.01418
G1 X102.309 Y99.04 E.01049
G1 X102.504 Y99.241 E.00369
; LINE_WIDTH: 0.408708
G1 X102.504 Y101.241 E.02552
; LINE_WIDTH: 0.408978
G1 X102.504 Y103.241 E.02554
G3 X102.46 Y103.559 I-1.067 J.017 E.00411
; LINE_WIDTH: 0.411248
G1 X102.249 Y103.921 E.00539
G1 X101.99 Y104.111 E.00412
; LINE_WIDTH: 0.405378
G1 X101.669 Y104.198 E.00421
; LINE_WIDTH: 0.410258
G1 X99.571 Y104.202 E.02689
; LINE_WIDTH: 0.410088
G1 X97.571 Y104.202 E.02561
; LINE_WIDTH: 0.409918
G1 X95.571 Y104.203 E.0256
; LINE_WIDTH: 0.409748
G1 X93.571 Y104.203 E.02559
; LINE_WIDTH: 0.409588
G1 X91.571 Y104.203 E.02558
; LINE_WIDTH: 0.409418
G1 X89.571 Y104.203 E.02557
; LINE_WIDTH: 0.409248
G1 X87.571 Y104.204 E.02556
; LINE_WIDTH: 0.409078
G1 X85.571 Y104.204 E.02555
; LINE_WIDTH: 0.408918
G1 X83.571 Y104.204 E.02554
; LINE_WIDTH: 0.408748
G1 X81.741 Y104.204 E.02335
; LINE_WIDTH: 0.419998
G1 X81.54 Y104.009 E.00369
G1 X81.54 Y103.01 E.01311
G1 X80.46 Y103.01 E.01418
G1 X80.46 Y104.009 E.01311
G1 X80.293 Y104.203 E.00337
; LINE_WIDTH: 0.411558
M73 P95 R0
G1 X80.259 Y104.204 E.00044
; LINE_WIDTH: 0.408588
G1 X78.425 Y104.204 E.0234
G1 X78.021 Y104.116 E.00527
; LINE_WIDTH: 0.407088
G1 X77.734 Y103.905 E.00452
G1 X77.542 Y103.572 E.00489
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.28 E.00377
G1 X77.496 Y85.491 E.22695
; LINE_WIDTH: 0.419998
G1 X77.691 Y85.29 E.00369
G1 X78.49 Y85.29 E.01049
G1 X78.49 Y83.71 E.02075
G1 X77.691 Y83.71 E.01049
G1 X77.497 Y83.543 E.00337
; LINE_WIDTH: 0.411558
G1 X77.496 Y83.509 E.00044
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.08656
G1 X77.551 Y76.403 E.00416
; LINE_WIDTH: 0.407318
G1 X77.728 Y76.1 E.00447
G1 X78.01 Y75.889 E.00447
; LINE_WIDTH: 0.405408
G1 X78.331 Y75.802 E.00421
; LINE_WIDTH: 0.410258
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.410038
G1 X82.429 Y75.798 E.02561
; LINE_WIDTH: 0.409818
G1 X84.429 Y75.798 E.0256
; LINE_WIDTH: 0.409598
G1 X86.429 Y75.798 E.02558
; LINE_WIDTH: 0.409378
G1 X88.429 Y75.797 E.02557
; LINE_WIDTH: 0.409168
G1 X90.429 Y75.797 E.02555
; LINE_WIDTH: 0.408948
G1 X92.429 Y75.797 E.02554
; LINE_WIDTH: 0.408728
G1 X94.429 Y75.797 E.02553
; LINE_WIDTH: 0.408508
G1 X96.429 Y75.797 E.02551
; LINE_WIDTH: 0.408298
G1 X98.429 Y75.796 E.0255
; LINE_WIDTH: 0.408078
G1 X100.429 Y75.796 E.02548
; LINE_WIDTH: 0.407858
G1 X101.6 Y75.796 E.01491
; LINE_WIDTH: 0.407738
G1 X101.943 Y75.87 E.00446
; LINE_WIDTH: 0.410628
G1 X102.282 Y76.116 E.00538
G1 X102.444 Y76.386 E.00405
; LINE_WIDTH: 0.408098
G1 X102.503 Y76.665 E.00363
G1 X102.504 Y78.665 E.02548
; LINE_WIDTH: 0.407758
G1 X102.504 Y78.759 E.00119
; LINE_WIDTH: 0.419998
G1 X102.319 Y78.96 E.00359
G1 X101.57 Y78.96 E.00984
; WIPE_START
G1 F12000
M204 S6000
G1 X101.51 Y80.04 E-.41105
G1 X102.309 Y80.04 E-.30346
G1 X102.392 Y80.126 E-.04549
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.1 I-1.217 J-.01 P1  F42000
G1 X102.2 Y104.43 Z8.1
G1 Z7.7
G1 E.8 F1800
; LINE_WIDTH: 0.413578
G1 F1832
M204 S5000
G1 X102.002 Y104.524 E.00283
G1 X101.585 Y104.595 E.00546
; LINE_WIDTH: 0.410258
G1 X99.585 Y104.595 E.02563
; LINE_WIDTH: 0.410088
G1 X97.585 Y104.595 E.02561
; LINE_WIDTH: 0.409918
G1 X95.585 Y104.595 E.0256
; LINE_WIDTH: 0.409748
G1 X93.585 Y104.595 E.02559
; LINE_WIDTH: 0.409588
G1 X91.585 Y104.595 E.02558
; LINE_WIDTH: 0.409418
G1 X89.585 Y104.595 E.02557
; LINE_WIDTH: 0.409248
G1 X87.585 Y104.595 E.02556
; LINE_WIDTH: 0.409078
G1 X85.585 Y104.596 E.02555
; LINE_WIDTH: 0.408918
G1 X83.585 Y104.596 E.02554
; LINE_WIDTH: 0.408748
G1 X81.741 Y104.596 E.02353
; LINE_WIDTH: 0.419998
G1 X81.741 Y104.59 E.00007
G2 X80.259 Y104.596 I-.372 J96.105 E.01947
; LINE_WIDTH: 0.408588
G1 X78.425 Y104.596 E.0234
; LINE_WIDTH: 0.413068
G3 X77.84 Y104.456 I.01 J-1.333 E.00783
; LINE_WIDTH: 0.407428
G1 X77.444 Y104.172 E.0062
G1 X77.183 Y103.721 E.00662
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.0056
G1 X77.104 Y85.491 E.22708
; LINE_WIDTH: 0.419998
G2 X77.104 Y83.509 I-82.401 J-.991 E.02604
; LINE_WIDTH: 0.408588
G1 X77.104 Y76.724 E.08656
G1 X77.181 Y76.286 E.00568
; LINE_WIDTH: 0.403938
G1 X77.378 Y75.916 E.00528
; LINE_WIDTH: 0.407308
G1 X77.695 Y75.623 E.0055
; LINE_WIDTH: 0.413568
G1 X77.998 Y75.476 E.00435
G1 X78.415 Y75.405 E.00547
; LINE_WIDTH: 0.410258
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410038
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409818
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409598
G1 X86.415 Y75.405 E.02558
; LINE_WIDTH: 0.409388
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409168
G1 X90.415 Y75.405 E.02555
; LINE_WIDTH: 0.408948
G1 X92.415 Y75.405 E.02554
; LINE_WIDTH: 0.408728
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408518
G1 X96.415 Y75.405 E.02551
; LINE_WIDTH: 0.408298
G1 X98.415 Y75.406 E.0255
; LINE_WIDTH: 0.408078
G1 X100.415 Y75.406 E.02548
; LINE_WIDTH: 0.407858
G1 X101.6 Y75.406 E.01509
; LINE_WIDTH: 0.408148
G1 X101.939 Y75.455 E.00437
; LINE_WIDTH: 0.414828
G1 X102.29 Y75.614 E.005
G1 X102.536 Y75.818 E.00414
; LINE_WIDTH: 0.406758
G1 X102.782 Y76.18 E.00556
; LINE_WIDTH: 0.408338
G1 X102.894 Y76.646 E.00611
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
G1 X102.896 Y103.275 E.02597
G1 X102.824 Y103.695 E.00543
; LINE_WIDTH: 0.404318
G1 X102.604 Y104.106 E.00588
; LINE_WIDTH: 0.408248
G1 X102.302 Y104.382 E.00521
; LINE_WIDTH: 0.413578
G1 X102.254 Y104.405 E.00069
; WIPE_START
G1 F12000
M204 S6000
G1 X102.002 Y104.524 E-.10589
G1 X101.585 Y104.595 E-.16061
G1 X100.287 Y104.595 E-.49351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.822 Y96.981 Z8.1 F42000
G1 X102.05 Y79.5 Z8.1
G1 Z7.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.696368
G1 F1832
M204 S6000
G1 X102.347 Y79.5 E.00658
; WIPE_START
G1 F13250.883
G1 X102.05 Y79.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.05 Y87.132 Z8.1 F42000
G1 X102.05 Y98.5 Z8.1
G1 Z7.7
G1 E.8 F1800
; LINE_WIDTH: 0.696488
G1 F1832
M204 S6000
G1 X102.349 Y98.5 E.00661
; WIPE_START
G1 F13248.543
G1 X102.05 Y98.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.1 I-.31 J-1.177 P1  F42000
G1 X81 Y104.049 Z8.1
G1 Z7.7
G1 E.8 F1800
; LINE_WIDTH: 0.696528
G1 F1832
M204 S6000
G1 X81 Y103.55 E.01105
; WIPE_START
G1 F13247.763
G1 X81 Y104.049 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.1 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.78
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 96/100
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
; OBJECT_ID: 15
G1 X102.179 Y104.431 F42000
G1 Z7.78
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.411588
G1 F1631
M204 S5000
G1 X101.871 Y104.562 E.00431
G1 X101.59 Y104.595 E.00363
; LINE_WIDTH: 0.410258
G1 X99.59 Y104.595 E.02563
; LINE_WIDTH: 0.410028
G1 X97.59 Y104.595 E.02561
; LINE_WIDTH: 0.409808
G1 X95.59 Y104.595 E.0256
; LINE_WIDTH: 0.409588
G1 X93.59 Y104.595 E.02558
; LINE_WIDTH: 0.409368
G1 X91.59 Y104.595 E.02557
; LINE_WIDTH: 0.409148
G1 X89.59 Y104.595 E.02555
; LINE_WIDTH: 0.408928
G1 X87.59 Y104.595 E.02554
; LINE_WIDTH: 0.408708
G1 X85.59 Y104.595 E.02552
; LINE_WIDTH: 0.408488
G1 X83.59 Y104.594 E.02551
; LINE_WIDTH: 0.408268
G1 X81.59 Y104.594 E.0255
; LINE_WIDTH: 0.408048
G1 X79.59 Y104.594 E.02548
; LINE_WIDTH: 0.407828
G1 X78.4 Y104.594 E.01515
; LINE_WIDTH: 0.408448
G1 X78.327 Y104.59 E.00093
G1 X77.837 Y104.458 E.00648
; LINE_WIDTH: 0.408218
G1 X77.443 Y104.171 E.00621
G1 X77.203 Y103.77 E.00596
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.292 E.00622
G1 X77.104 Y76.724 E.33896
G1 X77.188 Y76.274 E.00584
; LINE_WIDTH: 0.402968
G1 X77.396 Y75.894 E.00545
; LINE_WIDTH: 0.408238
G1 X77.698 Y75.618 E.00521
; LINE_WIDTH: 0.413578
G1 X77.998 Y75.476 E.0043
G1 X78.415 Y75.405 E.00546
; LINE_WIDTH: 0.410288
G1 X80.415 Y75.405 E.02563
; LINE_WIDTH: 0.410058
G1 X82.415 Y75.405 E.02561
; LINE_WIDTH: 0.409838
G1 X84.415 Y75.405 E.0256
; LINE_WIDTH: 0.409618
G1 X86.415 Y75.405 E.02558
; LINE_WIDTH: 0.409398
G1 X88.415 Y75.405 E.02557
; LINE_WIDTH: 0.409178
G1 X90.415 Y75.405 E.02555
; LINE_WIDTH: 0.408958
G1 X92.415 Y75.405 E.02554
; LINE_WIDTH: 0.408738
G1 X94.415 Y75.405 E.02553
; LINE_WIDTH: 0.408518
G1 X96.415 Y75.405 E.02551
; LINE_WIDTH: 0.408298
G1 X98.415 Y75.406 E.0255
; LINE_WIDTH: 0.408078
G1 X100.415 Y75.406 E.02548
; LINE_WIDTH: 0.407858
G1 X101.6 Y75.406 E.0151
; LINE_WIDTH: 0.408118
G1 X101.938 Y75.455 E.00436
; LINE_WIDTH: 0.414808
M73 P96 R0
G1 X102.29 Y75.614 E.00501
G1 X102.536 Y75.818 E.00414
; LINE_WIDTH: 0.408038
G1 X102.782 Y76.181 E.00559
; LINE_WIDTH: 0.409538
G1 X102.893 Y76.646 E.00611
G1 X102.894 Y76.7 E.00069
; LINE_WIDTH: 0.407678
G1 X102.894 Y103.3 E.33859
; LINE_WIDTH: 0.415198
G1 X102.814 Y103.737 E.00576
G1 X102.607 Y104.101 E.00543
; LINE_WIDTH: 0.406668
G1 X102.284 Y104.386 E.00546
; LINE_WIDTH: 0.411588
G1 X102.234 Y104.408 E.0007
M204 S250
G1 X102.001 Y104.103 F42000
; LINE_WIDTH: 0.411598
G1 F1631
M204 S5000
G1 X101.669 Y104.2 E.00444
; LINE_WIDTH: 0.410258
G3 X99.58 Y104.202 I-1.093 J-42.639 E.02677
; LINE_WIDTH: 0.410028
G1 X97.58 Y104.202 E.02561
; LINE_WIDTH: 0.409808
G1 X95.58 Y104.202 E.0256
; LINE_WIDTH: 0.409588
G1 X93.58 Y104.202 E.02558
; LINE_WIDTH: 0.409368
G1 X91.58 Y104.203 E.02557
; LINE_WIDTH: 0.409148
G1 X89.58 Y104.203 E.02555
; LINE_WIDTH: 0.408928
G1 X87.58 Y104.203 E.02554
; LINE_WIDTH: 0.408708
G1 X85.58 Y104.203 E.02552
; LINE_WIDTH: 0.408488
G1 X83.58 Y104.203 E.02551
; LINE_WIDTH: 0.408268
G1 X81.58 Y104.204 E.0255
; LINE_WIDTH: 0.408048
G1 X79.58 Y104.204 E.02548
; LINE_WIDTH: 0.407828
G1 X78.4 Y104.204 E.01503
; LINE_WIDTH: 0.407698
G1 X77.978 Y104.094 E.00555
; LINE_WIDTH: 0.406798
G1 X77.685 Y103.845 E.00489
; LINE_WIDTH: 0.402718
G1 X77.543 Y103.572 E.00387
; LINE_WIDTH: 0.408588
G1 X77.496 Y103.285 E.00371
G1 X77.496 Y76.724 E.33887
G1 X77.529 Y76.466 E.00332
; LINE_WIDTH: 0.408088
G1 X77.729 Y76.099 E.00533
; LINE_WIDTH: 0.407818
G1 X78.01 Y75.889 E.00445
; LINE_WIDTH: 0.405388
G1 X78.33 Y75.802 E.00421
; LINE_WIDTH: 0.410288
G1 X80.429 Y75.798 E.02689
; LINE_WIDTH: 0.410058
G1 X82.429 Y75.798 E.02561
; LINE_WIDTH: 0.409838
G1 X84.429 Y75.798 E.0256
; LINE_WIDTH: 0.409618
G1 X86.429 Y75.798 E.02558
; LINE_WIDTH: 0.409398
G1 X88.429 Y75.797 E.02557
; LINE_WIDTH: 0.409178
G1 X90.429 Y75.797 E.02555
; LINE_WIDTH: 0.408958
G1 X92.429 Y75.797 E.02554
; LINE_WIDTH: 0.408738
G1 X94.429 Y75.797 E.02553
; LINE_WIDTH: 0.408518
G1 X96.429 Y75.797 E.02551
; LINE_WIDTH: 0.408298
G1 X98.429 Y75.796 E.0255
; LINE_WIDTH: 0.408078
G1 X100.429 Y75.796 E.02548
; LINE_WIDTH: 0.407848
G1 X101.6 Y75.796 E.01491
; LINE_WIDTH: 0.407728
G1 X101.942 Y75.869 E.00445
; LINE_WIDTH: 0.405618
G1 X102.26 Y76.087 E.00487
; LINE_WIDTH: 0.408228
G1 X102.431 Y76.354 E.00405
G1 X102.504 Y76.7 E.0045
; LINE_WIDTH: 0.407678
G1 X102.504 Y103.3 E.33859
; LINE_WIDTH: 0.415198
G3 X102.325 Y103.833 I-1.171 J-.097 E.00736
; LINE_WIDTH: 0.411598
G1 X102.047 Y104.065 E.00465
; WIPE_START
G1 F12000
M204 S6000
G1 X101.669 Y104.2 E-.15247
G1 X100.07 Y104.201 E-.60753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.18 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.86
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 97/100
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
M106 S204
; OBJECT_ID: 15
G1 X101.991 Y104.112 F42000
G1 Z7.86
G1 E.8 F1800
; LINE_WIDTH: 0.408348
G1 F1200
M204 S5000
G1 X102.271 Y103.9 E.00448
; LINE_WIDTH: 0.411548
G1 X102.452 Y103.584 E.00468
G1 X102.503 Y103.335 E.00327
; LINE_WIDTH: 0.408478
G1 X102.504 Y101.004 E.02972
G1 X102.896 Y101.004 E.00499
G1 X102.895 Y101.2 E.0025
; LINE_WIDTH: 0.408508
G1 X102.894 Y103.2 E.02551
; LINE_WIDTH: 0.408128
G3 X102.852 Y103.584 I-1.162 J.067 E.00495
; LINE_WIDTH: 0.411428
G1 X102.684 Y103.999 E.00574
G1 X102.541 Y104.178 E.00294
; LINE_WIDTH: 0.408308
G1 X102.149 Y104.472 E.00626
; LINE_WIDTH: 0.409358
G1 X101.661 Y104.594 E.00642
G1 X99.661 Y104.595 E.02557
; LINE_WIDTH: 0.408738
G1 X99.304 Y104.596 E.00455
G1 X99.304 Y104.204 E.005
G1 X99.5 Y104.204 E.0025
; LINE_WIDTH: 0.409308
G1 X101.649 Y104.201 E.02747
G1 X101.933 Y104.127 E.00375
; WIPE_START
G1 F12000
M204 S6000
G1 X102.271 Y103.9 E-.15484
G1 X102.452 Y103.584 E-.13846
G1 X102.503 Y103.335 E-.09675
G1 X102.504 Y102.361 E-.36995
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.898 Y103.004 Z8.26 F42000
G1 X80.696 Y104.204 Z8.26
G1 Z7.86
G1 E.8 F1800
; LINE_WIDTH: 0.408748
G1 F1200
M204 S5000
G1 X80.696 Y104.4 E.0025
; LINE_WIDTH: 0.408708
G1 X80.696 Y104.596 E.0025
G1 X80.5 Y104.595 E.0025
; LINE_WIDTH: 0.409348
G1 X78.5 Y104.594 E.02557
G3 X78.171 Y104.562 I-.066 J-1.021 E.00424
; LINE_WIDTH: 0.403918
G1 X77.775 Y104.426 E.00528
; LINE_WIDTH: 0.406808
G1 X77.397 Y104.119 E.00618
G1 X77.183 Y103.72 E.00576
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00557
G1 X77.104 Y101.004 E.02917
G1 X77.496 Y101.004 E.00499
G1 X77.496 Y103.004 E.02552
G2 X77.542 Y103.572 I1.822 J.138 E.00729
; LINE_WIDTH: 0.405878
G1 X77.683 Y103.845 E.0039
G1 X77.949 Y104.081 E.0045
; LINE_WIDTH: 0.409398
G1 X78.366 Y104.201 E.00555
G1 X80.366 Y104.204 E.02557
; LINE_WIDTH: 0.408748
G1 X80.636 Y104.204 E.00344
; WIPE_START
G1 F12000
M204 S6000
G1 X80.696 Y104.4 E-.07774
G1 X80.696 Y104.596 E-.07445
G1 X80.5 Y104.595 E-.07444
G1 X79.096 Y104.594 E-.53337
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.26 I1.215 J.067 P1  F42000
G1 X80.696 Y75.796 Z8.26
G1 Z7.86
G1 E.8 F1800
; LINE_WIDTH: 0.408648
G1 F1200
M204 S5000
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.5 Y75.796 E.02554
G2 X78.087 Y75.856 I-.045 J1.144 E.00536
; LINE_WIDTH: 0.410608
G1 X77.815 Y76.018 E.00405
G1 X77.584 Y76.321 E.00488
; LINE_WIDTH: 0.407708
G1 X77.496 Y76.7 E.00495
; LINE_WIDTH: 0.408408
G1 X77.496 Y78.996 E.02928
G1 X77.104 Y78.996 E.00499
G1 X77.106 Y76.8 E.028
; LINE_WIDTH: 0.407738
G1 X77.106 Y76.7 E.00128
G1 X77.171 Y76.314 E.00498
; LINE_WIDTH: 0.413568
G3 X77.538 Y75.744 I1.204 J.372 E.00887
; LINE_WIDTH: 0.406818
G1 X77.904 Y75.504 E.00556
; LINE_WIDTH: 0.408998
G1 X78.405 Y75.404 E.00652
G1 X80.405 Y75.404 E.02554
; LINE_WIDTH: 0.408658
G1 X80.696 Y75.404 E.00371
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
G1 X86.269 Y76.813 Z8.26 F42000
G1 X102.504 Y78.996 Z8.26
G1 Z7.86
G1 E.8 F1800
; LINE_WIDTH: 0.408738
G1 F1200
M204 S5000
G1 X102.504 Y78.8 E.0025
; LINE_WIDTH: 0.409308
G1 X102.501 Y76.666 E.02728
G1 X102.41 Y76.31 E.00469
; LINE_WIDTH: 0.404248
G1 X102.199 Y76.03 E.00443
; LINE_WIDTH: 0.410998
G1 X101.88 Y75.847 E.00472
G1 X101.632 Y75.797 E.00325
; LINE_WIDTH: 0.408488
G1 X99.304 Y75.796 E.02969
G1 X99.304 Y75.404 E.00499
G1 X101.5 Y75.406 E.02801
; LINE_WIDTH: 0.408158
G1 X101.632 Y75.406 E.00168
G1 X101.985 Y75.472 E.00458
; LINE_WIDTH: 0.407938
G1 X102.317 Y75.632 E.00469
; LINE_WIDTH: 0.412568
G1 X102.617 Y75.91 E.00528
G1 X102.802 Y76.239 E.00486
G1 X102.894 Y76.665 E.00562
; LINE_WIDTH: 0.409358
G1 X102.895 Y78.665 E.02557
; LINE_WIDTH: 0.408738
G1 X102.896 Y78.996 E.00421
G1 X102.564 Y78.996 E.00423
; WIPE_START
G1 F12000
M204 S6000
G1 X102.504 Y78.8 E-.07774
G1 X102.502 Y77.005 E-.68226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.26 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 7.94
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 98/100
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
; OBJECT_ID: 15
G1 X101.991 Y104.112 F42000
G1 Z7.94
G1 E.8 F1800
; LINE_WIDTH: 0.408328
G1 F1200
M204 S5000
G1 X102.27 Y103.899 E.00448
; LINE_WIDTH: 0.407348
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
G3 X102.859 Y103.557 I-1.405 J.035 E.0046
; LINE_WIDTH: 0.410898
G1 X102.687 Y103.992 E.006
; LINE_WIDTH: 0.413558
G1 X102.436 Y104.28 E.00494
G1 X102.152 Y104.471 E.00442
; LINE_WIDTH: 0.409378
G1 X101.661 Y104.594 E.00646
G1 X99.661 Y104.595 E.02557
; LINE_WIDTH: 0.408748
G1 X99.304 Y104.596 E.00455
G1 X99.304 Y104.204 E.005
G1 X99.5 Y104.204 E.0025
; LINE_WIDTH: 0.409328
G1 X101.649 Y104.201 E.02747
G1 X101.933 Y104.127 E.00375
; WIPE_START
G1 F12000
M204 S6000
M73 P97 R0
G1 X102.27 Y103.899 E-.15485
G1 X102.462 Y103.56 E-.14778
G1 X102.504 Y103.271 E-.11111
G1 X102.504 Y102.359 E-.34626
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.899 Y103.003 Z8.34 F42000
G1 X80.696 Y104.204 Z8.34
G1 Z7.94
G1 E.8 F1800
; LINE_WIDTH: 0.408408
G1 F1200
M204 S5000
G1 X80.696 Y104.4 E.00249
; LINE_WIDTH: 0.408448
G1 X80.696 Y104.596 E.0025
G1 X78.5 Y104.594 E.028
; LINE_WIDTH: 0.407738
G3 X78.024 Y104.539 I-.049 J-1.653 E.00612
; LINE_WIDTH: 0.407088
G1 X77.594 Y104.304 E.00623
; LINE_WIDTH: 0.407388
G1 X77.295 Y103.959 E.00581
G1 X77.2 Y103.753 E.00289
; LINE_WIDTH: 0.408588
G1 X77.104 Y103.29 E.00602
G1 X77.104 Y101.004 E.02917
G1 X77.496 Y101.004 E.00499
G1 X77.496 Y103.004 E.02552
G2 X77.571 Y103.645 I1.592 J.138 E.00829
; LINE_WIDTH: 0.410968
G1 X77.785 Y103.956 E.00485
G1 X78.102 Y104.15 E.00477
; LINE_WIDTH: 0.407708
G1 X78.4 Y104.204 E.00385
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
G17
G3 Z8.34 I1.215 J.067 P1  F42000
G1 X80.696 Y75.796 Z8.34
G1 Z7.94
G1 E.8 F1800
; LINE_WIDTH: 0.408648
G1 F1200
M204 S5000
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.419 Y75.796 E.02657
G1 X78.087 Y75.857 E.00432
; LINE_WIDTH: 0.404578
G1 X77.791 Y76.038 E.00437
; LINE_WIDTH: 0.407838
G1 X77.583 Y76.32 E.00447
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.724 E.00527
G1 X77.496 Y78.996 E.02898
G1 X77.104 Y78.996 E.00499
G1 X77.104 Y76.996 E.02552
G3 X77.106 Y76.7 I2.394 J-.136 E.00377
G1 X77.205 Y76.22 E.00625
; LINE_WIDTH: 0.404588
G1 X77.421 Y75.868 E.00522
; LINE_WIDTH: 0.410588
G1 X77.767 Y75.577 E.0058
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
G1 X86.269 Y76.813 Z8.34 F42000
G1 X102.504 Y78.996 Z8.34
G1 Z7.94
G1 E.8 F1800
; LINE_WIDTH: 0.408738
G1 F1200
M204 S5000
G1 X102.504 Y78.8 E.0025
; LINE_WIDTH: 0.409308
G1 X102.501 Y76.666 E.02728
G1 X102.41 Y76.31 E.0047
; LINE_WIDTH: 0.404238
G1 X102.199 Y76.03 E.00443
; LINE_WIDTH: 0.407318
G1 X101.898 Y75.85 E.00446
; LINE_WIDTH: 0.408128
G1 X101.633 Y75.797 E.00344
; LINE_WIDTH: 0.408488
G1 X99.304 Y75.796 E.0297
G1 X99.304 Y75.404 E.00499
G1 X101.5 Y75.406 E.02801
; LINE_WIDTH: 0.408148
G3 X101.918 Y75.455 I.066 J1.228 E.00539
; LINE_WIDTH: 0.407308
G1 X102.325 Y75.636 E.00567
; LINE_WIDTH: 0.412548
G1 X102.617 Y75.91 E.00515
G1 X102.802 Y76.239 E.00486
G1 X102.894 Y76.665 E.00562
; LINE_WIDTH: 0.409358
G1 X102.895 Y78.665 E.02557
; LINE_WIDTH: 0.408738
G1 X102.896 Y78.996 E.00421
G1 X102.564 Y78.996 E.00423
; WIPE_START
G1 F12000
M204 S6000
G1 X102.504 Y78.8 E-.07774
G1 X102.502 Y77.005 E-.68226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.34 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 8.02
; LAYER_HEIGHT: 0.0800004
; layer num/total_layer_count: 99/100
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
; OBJECT_ID: 15
G1 X101.991 Y104.112 F42000
G1 Z8.02
G1 E.8 F1800
; LINE_WIDTH: 0.408248
G1 F1200
M204 S5000
G1 X102.27 Y103.898 E.00448
; LINE_WIDTH: 0.402998
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
G3 X102.843 Y103.643 I-1.604 J.035 E.00572
; LINE_WIDTH: 0.410138
G1 X102.687 Y103.992 E.00489
; LINE_WIDTH: 0.413568
G1 X102.435 Y104.28 E.00494
G1 X102.153 Y104.47 E.0044
; LINE_WIDTH: 0.409358
G1 X101.661 Y104.594 E.00648
G1 X99.661 Y104.595 E.02557
; LINE_WIDTH: 0.408738
G1 X99.304 Y104.596 E.00456
G1 X99.304 Y104.204 E.005
G1 X99.5 Y104.204 E.0025
; LINE_WIDTH: 0.409308
G1 X101.649 Y104.201 E.02747
G1 X101.933 Y104.127 E.00375
; WIPE_START
G1 F12000
M204 S6000
G1 X102.27 Y103.898 E-.15488
G1 X102.435 Y103.634 E-.1185
G1 X102.504 Y103.27 E-.14046
G1 X102.504 Y102.359 E-.34616
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.899 Y103.003 Z8.42 F42000
G1 X80.696 Y104.204 Z8.42
G1 Z8.02
G1 E.8 F1800
; LINE_WIDTH: 0.408588
G1 F1200
M204 S5000
G1 X80.696 Y104.4 E.0025
G1 X80.696 Y104.596 E.0025
G1 X78.424 Y104.596 E.02898
G1 X77.973 Y104.512 E.00586
; LINE_WIDTH: 0.403078
G1 X77.594 Y104.304 E.00543
; LINE_WIDTH: 0.404578
G1 X77.32 Y103.995 E.00522
; LINE_WIDTH: 0.413228
G1 X77.156 Y103.637 E.00509
G1 X77.105 Y103.287 E.00456
; LINE_WIDTH: 0.410238
G1 X77.104 Y101.287 E.02562
; LINE_WIDTH: 0.408908
G1 X77.104 Y101.004 E.00361
G1 X77.496 Y101.004 E.005
G1 X77.496 Y101.2 E.0025
; LINE_WIDTH: 0.410188
G1 X77.498 Y103.2 E.02562
G2 X77.501 Y103.37 I2.766 J.035 E.00218
; LINE_WIDTH: 0.406158
G1 X77.589 Y103.691 E.00422
; LINE_WIDTH: 0.410718
G1 X77.782 Y103.953 E.00417
G1 X78.103 Y104.148 E.00483
; LINE_WIDTH: 0.408588
G1 X78.424 Y104.204 E.00416
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
G1 X79.519 Y96.975 Z8.42 F42000
G1 X80.696 Y75.796 Z8.42
G1 Z8.02
G1 E.8 F1800
; LINE_WIDTH: 0.408648
G1 F1200
M204 S5000
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.419 Y75.796 E.02657
G1 X78.05 Y75.872 E.00481
; LINE_WIDTH: 0.410928
G1 X77.748 Y76.082 E.00472
G1 X77.551 Y76.403 E.00484
; LINE_WIDTH: 0.408588
G1 X77.496 Y76.725 E.00416
G1 X77.496 Y78.996 E.02898
G1 X77.104 Y78.996 E.00499
G1 X77.104 Y76.996 E.02552
G3 X77.141 Y76.413 I2.488 J-.136 E.00746
; LINE_WIDTH: 0.413608
G1 X77.25 Y76.118 E.00406
G1 X77.455 Y75.826 E.00461
; LINE_WIDTH: 0.408018
G1 X77.741 Y75.595 E.00468
; LINE_WIDTH: 0.412978
G1 X78.131 Y75.44 E.00541
G1 X78.41 Y75.404 E.00363
; LINE_WIDTH: 0.408998
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
G1 X86.269 Y76.813 Z8.42 F42000
G1 X102.504 Y78.996 Z8.42
G1 Z8.02
G1 E.8 F1800
; LINE_WIDTH: 0.408738
G1 F1200
M204 S5000
G1 X102.504 Y78.8 E.0025
; LINE_WIDTH: 0.409318
G1 X102.501 Y76.666 E.02728
G1 X102.41 Y76.31 E.0047
; LINE_WIDTH: 0.404228
G1 X102.199 Y76.03 E.00443
; LINE_WIDTH: 0.404398
G1 X101.934 Y75.864 E.00394
; LINE_WIDTH: 0.408128
G1 X101.633 Y75.797 E.00393
; LINE_WIDTH: 0.408488
G1 X99.304 Y75.796 E.02971
G1 X99.304 Y75.404 E.00499
G1 X101.5 Y75.406 E.02801
; LINE_WIDTH: 0.408148
G3 X101.952 Y75.463 I.066 J1.286 E.00584
; LINE_WIDTH: 0.407358
G1 X102.334 Y75.641 E.00535
; LINE_WIDTH: 0.412568
G1 X102.617 Y75.91 E.00503
G1 X102.802 Y76.239 E.00487
G1 X102.894 Y76.665 E.00562
; LINE_WIDTH: 0.409368
G1 X102.895 Y78.665 E.02557
; LINE_WIDTH: 0.408738
G1 X102.896 Y78.996 E.00421
G1 X102.564 Y78.996 E.00423
; WIPE_START
G1 F12000
M204 S6000
G1 X102.504 Y78.8 E-.07774
G1 X102.502 Y77.005 E-.68226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.42 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 8.1
; LAYER_HEIGHT: 0.0799999
; layer num/total_layer_count: 100/100
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
; OBJECT_ID: 15
G1 X101.991 Y104.112 F42000
G1 Z8.1
M73 P98 R0
G1 E.8 F1800
; LINE_WIDTH: 0.408248
G1 F1200
M204 S5000
G1 X102.271 Y103.9 E.00448
; LINE_WIDTH: 0.407288
G1 X102.45 Y103.598 E.00446
; LINE_WIDTH: 0.408118
G1 X102.503 Y103.334 E.00342
; LINE_WIDTH: 0.408478
G1 X102.504 Y101.004 E.02972
G1 X102.896 Y101.004 E.00499
G1 X102.895 Y101.2 E.0025
; LINE_WIDTH: 0.408508
G1 X102.894 Y103.2 E.02551
; LINE_WIDTH: 0.408138
G3 X102.845 Y103.618 I-1.225 J.067 E.00539
; LINE_WIDTH: 0.407308
G1 X102.664 Y104.025 E.00566
G1 X102.535 Y104.183 E.0026
; LINE_WIDTH: 0.408288
G1 X102.153 Y104.47 E.00608
; LINE_WIDTH: 0.409378
G1 X101.661 Y104.594 E.00649
G1 X99.661 Y104.595 E.02557
; LINE_WIDTH: 0.408748
G1 X99.304 Y104.596 E.00455
G1 X99.304 Y104.204 E.005
G1 X99.5 Y104.204 E.0025
; LINE_WIDTH: 0.409328
G1 X101.649 Y104.201 E.02747
G1 X101.933 Y104.127 E.00375
; WIPE_START
G1 F12000
M204 S6000
G1 X102.271 Y103.9 E-.15492
G1 X102.45 Y103.598 E-.13338
G1 X102.503 Y103.334 E-.10205
G1 X102.504 Y102.362 E-.36965
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.898 Y103.004 Z8.5 F42000
G1 X80.696 Y104.204 Z8.5
G1 Z8.1
G1 E.8 F1800
; LINE_WIDTH: 0.408408
G1 F1200
M204 S5000
G1 X80.696 Y104.4 E.00249
; LINE_WIDTH: 0.408448
G1 X80.696 Y104.596 E.0025
G1 X78.5 Y104.594 E.028
; LINE_WIDTH: 0.407748
G1 X78.4 Y104.594 E.00128
; LINE_WIDTH: 0.411588
G1 X78.025 Y104.537 E.00488
G1 X77.622 Y104.325 E.00585
; LINE_WIDTH: 0.404868
G1 X77.326 Y104.002 E.00554
; LINE_WIDTH: 0.413228
G1 X77.156 Y103.637 E.00521
G1 X77.105 Y103.288 E.00454
; LINE_WIDTH: 0.410238
G1 X77.104 Y101.288 E.02562
; LINE_WIDTH: 0.408908
G1 X77.104 Y101.004 E.00362
G1 X77.496 Y101.004 E.005
G1 X77.496 Y101.2 E.0025
; LINE_WIDTH: 0.410178
G1 X77.498 Y103.2 E.02562
G2 X77.501 Y103.37 I2.754 J.035 E.00218
; LINE_WIDTH: 0.406138
G1 X77.589 Y103.69 E.00421
; LINE_WIDTH: 0.406818
G1 X77.83 Y103.996 E.00495
; LINE_WIDTH: 0.411588
G1 X78.162 Y104.167 E.0048
G1 X78.4 Y104.204 E.00309
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
G1 X79.519 Y96.974 Z8.5 F42000
G1 X80.696 Y75.796 Z8.5
G1 Z8.1
G1 E.8 F1800
; LINE_WIDTH: 0.408648
G1 F1200
M204 S5000
G1 X80.5 Y75.796 E.0025
; LINE_WIDTH: 0.408978
G1 X78.409 Y75.796 E.0267
G1 X78.05 Y75.87 E.00469
; LINE_WIDTH: 0.407318
G1 X77.733 Y76.098 E.00496
; LINE_WIDTH: 0.404588
G1 X77.551 Y76.403 E.00449
; LINE_WIDTH: 0.407718
G1 X77.496 Y76.7 E.00384
; LINE_WIDTH: 0.408408
G1 X77.496 Y78.996 E.02928
G1 X77.104 Y78.996 E.00499
G1 X77.106 Y76.8 E.028
; LINE_WIDTH: 0.407748
G3 X77.146 Y76.404 I1.467 J-.049 E.00508
; LINE_WIDTH: 0.410588
G1 X77.313 Y76.008 E.00551
; LINE_WIDTH: 0.414858
G1 X77.562 Y75.724 E.0049
G1 X77.905 Y75.504 E.00528
; LINE_WIDTH: 0.408998
G1 X78.404 Y75.404 E.00651
G1 X80.404 Y75.404 E.02554
; LINE_WIDTH: 0.408658
G1 X80.696 Y75.404 E.00372
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
G1 X86.269 Y76.813 Z8.5 F42000
G1 X102.504 Y78.996 Z8.5
G1 Z8.1
G1 E.8 F1800
; LINE_WIDTH: 0.408738
G1 F1200
M204 S5000
G1 X102.504 Y78.8 E.0025
; LINE_WIDTH: 0.409308
G1 X102.501 Y76.666 E.02728
G1 X102.41 Y76.31 E.0047
; LINE_WIDTH: 0.404228
G1 X102.199 Y76.03 E.00443
; LINE_WIDTH: 0.404378
G1 X101.934 Y75.864 E.00393
; LINE_WIDTH: 0.408118
G1 X101.634 Y75.797 E.00392
; LINE_WIDTH: 0.408488
G1 X99.304 Y75.796 E.02972
G1 X99.304 Y75.404 E.00499
G1 X101.5 Y75.406 E.02801
; LINE_WIDTH: 0.408138
G3 X101.952 Y75.463 I.066 J1.284 E.00584
; LINE_WIDTH: 0.407348
G1 X102.334 Y75.641 E.00535
; LINE_WIDTH: 0.412568
G1 X102.617 Y75.91 E.00504
G1 X102.802 Y76.239 E.00487
G1 X102.894 Y76.665 E.00562
; LINE_WIDTH: 0.409358
G1 X102.895 Y78.665 E.02557
; LINE_WIDTH: 0.408738
G1 X102.896 Y78.996 E.00421
G1 X102.564 Y78.996 E.00423
; WIPE_START
G1 F12000
M204 S6000
G1 X102.504 Y78.8 E-.07774
G1 X102.502 Y77.005 E-.68226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.5 I1.217 J0 P1  F42000
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
G1 Z8.6 F900 ; lower z a little
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

    G1 Z108.1 F600
    G1 Z106.1

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


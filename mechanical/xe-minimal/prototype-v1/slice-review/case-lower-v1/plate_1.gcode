; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 9m 25s; total estimated time: 9m 45s
; total layer number: 51
; total filament length [mm] : 624.49
; total filament volume [cm^3] : 1502.08
; total filament weight [g] : 1.86
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
G1 X89.121 Y78.439 F42000
M204 S6000
M73 P3 R9
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G2 X90.879 Y78.436 I.874 J-2.858 E.06645
G1 X90.879 Y78.956 E.01938
G1 X101.343 Y78.956 E.38976
G1 X101.343 Y105.041 E.97156
G1 X78.658 Y105.043 E.84492
G1 X78.657 Y84.648 E.75963
G2 X79.194 Y81.124 I1.412 J-1.588 E.33972
G1 X78.657 Y81.434 E.0231
G1 X78.657 Y78.956 E.09228
G1 X89.121 Y78.956 E.38976
G1 X89.121 Y78.499 E.01702
M204 S6000
G1 X88.664 Y77.713 F42000
G1 F3000
M204 S500
G1 X88.873 Y77.836 E.00905
G2 X91.336 Y77.733 I1.138 J-2.264 E.09587
G1 X91.336 Y78.499 E.02855
G1 X101.571 Y78.499 E.38123
G3 X101.8 Y78.728 I.013 J.216 E.01363
G1 X101.8 Y105.273 E.98869
G3 X101.615 Y105.498 I-.203 J.022 E.01211
G1 X78.429 Y105.5 E.86358
G1 X78.333 Y105.487 E.0036
G3 X78.201 Y105.314 I.081 J-.198 E.00848
G1 X78.2 Y83.431 E.81506
G1 X78.433 Y83.396 E.00879
G2 X78.433 Y82.733 I1.632 J-.331 E.36498
M73 P4 R9
G1 X78.2 Y82.698 E.00879
G1 X78.2 Y78.726 E.14795
G3 X78.429 Y78.499 I.208 J-.019 E.0137
G1 X88.664 Y78.499 E.38123
G1 X88.664 Y77.773 E.02707
; WIPE_START
G1 X88.873 Y77.836 E-.0831
G1 X89.315 Y78.016 E-.18115
G1 X89.782 Y78.105 E-.18074
G1 X90.02 Y78.115 E-.09059
G1 X90.494 Y78.064 E-.18091
G1 X90.604 Y78.035 E-.04351
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X83.418 Y80.607 Z.6 F42000
G1 X79.879 Y81.873 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X79.92 Y81.866 E.00155
G3 X80.504 Y81.935 I.135 J1.357 E.02208
G3 X79.784 Y81.892 I-.43 J1.129 E.25545
G1 X79.82 Y81.885 E.00137
M204 S6000
G1 X79.956 Y82.326 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X79.977 Y82.32 E.00081
G1 X80.058 Y82.314 E.00302
G3 X79.762 Y82.382 I.015 J.75 E.16408
G1 X79.898 Y82.343 E.00528
; WIPE_START
G1 X79.977 Y82.32 E-.0311
G1 X80.058 Y82.314 E-.03084
G1 X80.2 Y82.325 E-.05446
G1 X80.341 Y82.364 E-.0556
G1 X80.567 Y82.501 E-.10031
G1 X80.665 Y82.606 E-.05446
G1 X80.749 Y82.745 E-.06164
G1 X80.798 Y82.879 E-.05436
G1 X80.82 Y83.027 E-.05687
G1 X80.813 Y83.176 E-.05677
G1 X80.776 Y83.322 E-.05692
G1 X80.711 Y83.456 E-.05689
G1 X80.621 Y83.576 E-.05689
G1 X80.556 Y83.633 E-.03288
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X86.316 Y78.626 Z.6 F42000
G1 X88.395 Y76.818 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X88.491 Y76.947 E.00599
G2 X91.603 Y76.82 I1.507 J-1.251 E.1341
G1 X91.793 Y76.881 E.00743
G1 X91.793 Y78.042 E.04324
G1 X101.583 Y78.042 E.36463
G1 X101.784 Y78.069 E.00756
G3 X102.257 Y78.717 I-.186 J.633 E.03215
G1 X102.257 Y105.283 E.98949
G3 X101.641 Y105.955 I-.664 J.009 E.03743
G1 X78.418 Y105.957 E.86498
G3 X77.744 Y105.341 I-.012 J-.663 E.03751
G1 X77.743 Y78.716 E.99167
G3 X78.418 Y78.042 I.668 J-.006 E.03955
G1 X88.207 Y78.042 E.36462
G1 X88.207 Y76.881 E.04326
G1 X88.338 Y76.837 E.00513
M204 S6000
G1 X88.676 Y76.404 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X88.566 Y76.137 E.01075
G3 X89.815 Y74.211 I1.434 J-.438 E.09741
G1 X89.963 Y74.2 E.00551
G3 X88.706 Y76.456 I.037 J1.499 E.23498
; WIPE_START
G1 X88.566 Y76.137 E-.13231
G1 X88.507 Y75.848 E-.1123
G1 X88.506 Y75.563 E-.10826
G1 X88.556 Y75.293 E-.10424
G1 X88.656 Y75.032 E-.10613
G1 X88.813 Y74.782 E-.11226
G1 X88.966 Y74.62 E-.0845
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X92.25 Y77.585 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X101.594 Y77.585 E.34802
G3 X102.714 Y78.706 I.003 J1.118 E.06562
G1 X102.714 Y105.294 E.99029
G3 X101.658 Y106.412 I-1.125 J-.004 E.06312
G1 X78.406 Y106.414 E.86603
M73 P5 R9
G3 X77.287 Y105.357 I.002 J-1.123 E.06317
G1 X77.286 Y78.705 E.99268
G3 X78.406 Y77.585 I1.128 J.008 E.06543
G1 X87.75 Y77.585 E.34802
G1 X87.75 Y75.448 E.07962
G3 X90.166 Y73.456 I2.264 J.285 E.12854
G3 X92.25 Y75.447 I-.187 J2.281 E.11611
G1 X92.25 Y77.525 E.07741
; WIPE_START
G1 X94.25 Y77.538 E-.76
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

G1 X91.809 Y76.406
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.466053
G1 F3000
M204 S500
G1 X91.515 Y76.551 E.0113
M204 S6000
G1 X91.809 Y76.406 F42000
; LINE_WIDTH: 0.454579
G1 F3000
M204 S500
G1 X91.823 Y76.321 E.0029
; LINE_WIDTH: 0.423415
G1 X91.839 Y76.218 E.00324
; LINE_WIDTH: 0.385584
G1 X91.861 Y76.031 E.00524
; LINE_WIDTH: 0.33787
G1 X91.869 Y75.49 E.013
G1 X91.83 Y75.294 E.0048
G2 X88.13 Y75.892 I-1.833 J.408 E.13646
G1 X88.144 Y76.079 E.0045
; LINE_WIDTH: 0.397387
G1 X88.168 Y76.268 E.0055
; LINE_WIDTH: 0.434703
G1 X88.181 Y76.343 E.00241
; LINE_WIDTH: 0.458364
G1 X88.194 Y76.417 E.00256
G1 X88.221 Y76.431 E.00103
; LINE_WIDTH: 0.414352
G1 X88.481 Y76.549 E.00863
; WIPE_START
G1 X88.221 Y76.431 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X91.384 Y77.425 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.118802
G1 F3000
M204 S500
G1 X91.564 Y77.305 E.00134
; WIPE_START
G1 X91.384 Y77.425 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X98.751 Y79.418 Z.6 F42000
G1 X101.16 Y80.069 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50283
G1 F6300
M204 S500
G1 X100.436 Y79.345 E.03839
G1 X99.786 Y79.345 E.02438
G1 X100.955 Y80.514 E.06196
G1 X100.955 Y81.164 E.02438
G1 X99.135 Y79.345 E.09643
G1 X98.485 Y79.345 E.02438
G1 X100.955 Y81.815 E.1309
G1 X100.955 Y82.465 E.02438
G1 X97.834 Y79.345 E.16537
G1 X97.184 Y79.345 E.02438
G1 X100.955 Y83.116 E.19985
G1 X100.955 Y83.766 E.02438
G1 X96.534 Y79.345 E.23432
G1 X95.883 Y79.345 E.02438
G1 X100.955 Y84.416 E.26879
G1 X100.955 Y85.067 E.02438
G1 X95.233 Y79.345 E.30326
G1 X94.582 Y79.345 E.02438
G1 X100.955 Y85.717 E.33773
G1 X100.955 Y86.368 E.02438
G1 X93.932 Y79.345 E.37221
G1 X93.282 Y79.345 E.02438
G1 X100.955 Y87.018 E.40668
G1 X100.955 Y87.668 E.02438
G1 X92.631 Y79.345 E.44115
G1 X91.981 Y79.345 E.02438
G1 X100.955 Y88.319 E.47562
M73 P6 R9
G1 X100.955 Y88.969 E.02438
G1 X91.125 Y79.139 E.521
; WIPE_START
G1 X92.539 Y80.553 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X90.087 Y78.752 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X100.955 Y89.62 E.57598
G1 X100.955 Y90.27 E.02438
G1 X89.621 Y78.937 E.60068
G1 X89.51 Y78.921 E.00422
G1 X89.51 Y79.345 E.01589
G1 X89.379 Y79.345 E.00489
G1 X100.955 Y90.92 E.61351
G1 X100.955 Y91.571 E.02438
G1 X88.729 Y79.345 E.64798
G1 X88.078 Y79.345 E.02438
G1 X100.955 Y92.221 E.68245
G1 X100.955 Y92.872 E.02438
G1 X87.428 Y79.345 E.71693
G1 X86.777 Y79.345 E.02438
G1 X100.955 Y93.522 E.7514
G1 X100.955 Y94.173 E.02438
G1 X86.127 Y79.345 E.78587
G1 X85.477 Y79.345 E.02438
G1 X100.955 Y94.823 E.82034
G1 X100.955 Y95.473 E.02438
G1 X84.826 Y79.345 E.85481
G1 X84.176 Y79.345 E.02438
G1 X100.955 Y96.124 E.88929
G1 X100.955 Y96.774 E.02438
G1 X83.525 Y79.345 E.92376
G1 X82.875 Y79.345 E.02438
G1 X100.955 Y97.425 E.95823
M73 P7 R9
G1 X100.955 Y98.075 E.02438
G1 X82.225 Y79.345 E.9927
G1 X81.574 Y79.345 E.02438
G1 X100.955 Y98.725 E1.02717
G1 X100.955 Y99.376 E.02438
G1 X80.924 Y79.345 E1.06164
G1 X80.273 Y79.345 E.02438
G1 X100.955 Y100.026 E1.09612
G1 X100.955 Y100.677 E.02438
G1 X79.623 Y79.345 E1.13059
G1 X79.045 Y79.345 E.02165
G1 X79.045 Y79.418 E.00273
G1 X80.187 Y80.559 E.0605
G2 X79.58 Y80.603 I-.126 J2.461 E.02284
G1 X79.045 Y80.068 E.02836
G1 X79.045 Y80.719 E.02438
G1 X79.242 Y80.915 E.01041
; WIPE_START
G1 X79.045 Y80.719 E-.10551
G1 X79.045 Y80.068 E-.24717
G1 X79.58 Y80.603 E-.28753
G1 X79.894 Y80.568 E-.11979
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X82.345 Y82.718 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X100.955 Y101.327 E.98631
G1 X100.955 Y101.977 E.02438
G1 X82.532 Y83.555 E.97639
G1 X82.438 Y83.926 E.01436
G1 X82.378 Y84.051 E.00519
G1 X100.955 Y102.628 E.98458
G1 X100.955 Y103.278 E.02438
G1 X82.149 Y84.472 E.99671
M73 P7 R8
G1 X81.917 Y84.779 E.0144
G1 X81.857 Y84.831 E.00297
G1 X100.955 Y103.929 E1.01217
G1 X100.955 Y104.579 E.02438
G1 X81.506 Y85.131 E1.03078
G1 X81.092 Y85.366 E.01788
M73 P8 R8
G1 X100.378 Y104.653 E1.02219
G1 X99.728 Y104.653 E.02437
G1 X80.6 Y85.525 E1.01378
G1 X80.133 Y85.584 E.01764
G1 X79.998 Y85.573 E.00508
G1 X99.077 Y104.653 E1.01121
G1 X98.427 Y104.653 E.02437
G1 X79.198 Y85.424 E1.01916
G1 X79.046 Y85.355 E.00624
G1 X79.046 Y85.922 E.02125
G1 X97.776 Y104.653 E.99273
G1 X97.126 Y104.653 E.02437
G1 X79.046 Y86.573 E.95826
G1 X79.046 Y87.223 E.02438
G1 X96.476 Y104.653 E.92379
G1 X95.825 Y104.653 E.02437
G1 X79.046 Y87.874 E.88932
G1 X79.046 Y88.524 E.02438
G1 X95.175 Y104.653 E.85485
G1 X94.525 Y104.653 E.02437
G1 X79.046 Y89.174 E.82038
G1 X79.046 Y89.825 E.02438
G1 X93.874 Y104.653 E.78591
G1 X93.224 Y104.653 E.02437
G1 X79.046 Y90.475 E.75143
G1 X79.046 Y91.126 E.02438
G1 X92.574 Y104.653 E.71696
M73 P9 R8
G1 X91.923 Y104.653 E.02437
G1 X79.046 Y91.776 E.68249
G1 X79.046 Y92.427 E.02438
G1 X91.273 Y104.653 E.64802
G1 X90.622 Y104.653 E.02437
G1 X79.046 Y93.077 E.61355
G1 X79.046 Y93.728 E.02438
G1 X89.972 Y104.654 E.57908
G1 X89.322 Y104.654 E.02437
G1 X79.046 Y94.378 E.5446
G1 X79.046 Y95.029 E.02438
G1 X88.671 Y104.654 E.51013
G1 X88.021 Y104.654 E.02437
G1 X79.046 Y95.679 E.47566
G1 X79.046 Y96.329 E.02438
G1 X87.371 Y104.654 E.44119
G1 X86.72 Y104.654 E.02437
G1 X79.046 Y96.98 E.40672
G1 X79.046 Y97.63 E.02438
G1 X86.07 Y104.654 E.37225
G1 X85.42 Y104.654 E.02437
G1 X79.046 Y98.281 E.33777
G1 X79.047 Y98.931 E.02438
G1 X84.769 Y104.654 E.3033
G1 X84.119 Y104.654 E.02437
G1 X79.047 Y99.582 E.26883
G1 X79.047 Y100.232 E.02438
G1 X83.468 Y104.654 E.23436
G1 X82.818 Y104.654 E.02437
G1 X79.047 Y100.883 E.19989
G1 X79.047 Y101.533 E.02438
G1 X82.168 Y104.654 E.16542
G1 X81.517 Y104.654 E.02437
G1 X79.047 Y102.183 E.13094
G1 X79.047 Y102.834 E.02438
G1 X80.867 Y104.654 E.09647
G1 X80.217 Y104.654 E.02437
G1 X79.047 Y103.484 E.062
G1 X79.047 Y104.135 E.02438
G1 X79.772 Y104.86 E.03843
; WIPE_START
M73 P10 R8
G1 X79.047 Y104.135 E-.38967
G1 X79.047 Y103.484 E-.24717
G1 X79.276 Y103.714 E-.12316
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X78.991 Y96.086 Z.6 F42000
G1 X78.549 Y84.235 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.111314
G1 F3000
M204 S500
G1 X78.467 Y84.155 E.00064
G1 X78.451 Y84.091 E.00036
; WIPE_START
G1 X78.467 Y84.155 E-.2752
G1 X78.549 Y84.235 E-.4848
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X78.428 Y81.923 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.1171
G1 F3000
M204 S500
G3 X78.74 Y81.681 I2.544 J2.955 E.00239
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X78.428 Y81.923 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/51
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S198.9
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I.408 J1.146 P1  F42000
G1 X88.942 Y78.18 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G2 X91.058 Y78.177 I1.055 J-2.541 E.05886
G1 X91.058 Y78.66 E.01309
G1 X101.64 Y78.66 E.28673
G1 X101.64 Y105.337 E.72288
G1 X78.362 Y105.339 E.63075
G1 X78.361 Y84.045 E.57701
G1 X78.709 Y84.46 E.01468
G2 X78.528 Y81.886 I1.36 J-1.389 E.25459
G1 X78.361 Y81.828 E.0048
G1 X78.36 Y78.66 E.08584
G1 X88.942 Y78.66 E.28673
G1 X88.942 Y78.24 E.01139
; WIPE_START
G1 X89.237 Y78.283 E-.11323
G1 X89.495 Y78.346 E-.10103
G1 X89.759 Y78.383 E-.10121
G1 X90.024 Y78.393 E-.10089
G1 X90.288 Y78.378 E-.10054
G1 X90.549 Y78.337 E-.10039
G1 X90.808 Y78.269 E-.10165
G1 X90.91 Y78.232 E-.04107
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.599 Y80.426 Z.76 F42000
G1 X79.821 Y81.559 Z.76
G1 Z.36
G1 E.8 F1800
G1 F10826.06
M204 S6000
G1 X79.88 Y81.549 E.00161
G3 X80.63 Y81.639 I.174 J1.715 E.02064
G3 X79.705 Y81.582 I-.552 J1.424 E.23457
G1 X79.763 Y81.571 E.0016
M204 S10000
G1 X79.858 Y81.982 F42000
G1 F10826.06
M204 S6000
G1 X79.932 Y81.962 E.00206
G1 X80.058 Y81.952 E.00342
G3 X79.614 Y82.054 I.02 J1.11 E.17666
G1 X79.801 Y81.999 E.00528
M204 S250
G1 X79.963 Y82.365 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X79.982 Y82.36 E.00048
G1 X80.058 Y82.354 E.00192
G3 X79.778 Y82.418 I.015 J.709 E.10477
G1 X79.906 Y82.381 E.00333
; WIPE_START
M204 S6000
G1 X79.982 Y82.36 E-.03002
G1 X80.058 Y82.354 E-.02895
G1 X80.193 Y82.364 E-.05179
G1 X80.33 Y82.403 E-.05387
G1 X80.456 Y82.467 E-.05372
G1 X80.566 Y82.556 E-.05381
G1 X80.658 Y82.664 E-.05384
G1 X80.725 Y82.788 E-.05372
G1 X80.767 Y82.924 E-.05388
G1 X80.781 Y83.065 E-.0538
G1 X80.737 Y83.31 E-.09475
G1 X80.677 Y83.435 E-.05289
G1 X80.591 Y83.548 E-.05378
G1 X80.485 Y83.642 E-.05388
G1 X80.445 Y83.665 E-.01729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.492 Y79.007 Z.76 F42000
G1 X88.526 Y77.44 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X88.745 Y77.6 E.00736
G2 X91.097 Y77.696 I1.256 J-1.92 E.06696
G1 X91.474 Y77.464 E.012
G1 X91.474 Y78.244 E.02115
G1 X101.574 Y78.244 E.2737
G3 X102.055 Y78.725 I.02 J.46 E.02072
G1 X102.055 Y105.309 E.72036
G3 X101.622 Y105.753 I-.46 J-.016 E.01842
G1 X78.425 Y105.755 E.62856
G3 X77.947 Y105.33 I-.02 J-.46 E.01919
G1 X77.945 Y78.69 E.72186
G3 X78.426 Y78.244 I.459 J.013 E.01976
G1 X88.526 Y78.244 E.2737
G1 X88.526 Y77.5 E.02018
M204 S10000
G1 X88.381 Y76.611 F42000
G1 F10826.06
M204 S6000
G1 X88.566 Y76.886 E.00898
G2 X91.693 Y76.468 I1.432 J-1.188 E.10199
G1 X91.889 Y76.511 E.00545
G1 X91.889 Y77.829 E.03572
G1 X101.585 Y77.829 E.26272
G3 X102.471 Y78.715 I.013 J.873 E.03787
G1 X102.471 Y105.292 E.72015
G3 X101.643 Y106.169 I-.873 J.005 E.03608
G1 X78.415 Y106.17 E.62939
G3 X77.531 Y105.347 I-.007 J-.879 E.0361
G1 X77.529 Y78.708 E.72185
G3 X78.415 Y77.829 I.875 J-.004 E.03766
G1 X88.111 Y77.829 E.26272
G1 X88.111 Y76.508 E.03578
G1 X88.305 Y76.464 E.0054
G1 X88.35 Y76.56 E.00286
M204 S250
G1 X88.713 Y76.389 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X88.604 Y76.125 E.00717
G3 X89.82 Y74.25 I1.396 J-.427 E.06399
G1 X89.964 Y74.24 E.00362
G3 X88.743 Y76.441 I.036 J1.459 E.15424
; WIPE_START
M204 S6000
G1 X88.604 Y76.125 E-.13087
G1 X88.547 Y75.843 E-.10937
G1 X88.546 Y75.566 E-.10542
G1 X88.594 Y75.304 E-.10113
G1 X88.692 Y75.051 E-.10316
G1 X88.844 Y74.807 E-.10931
G1 X89.026 Y74.614 E-.10074
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.29 Y77.428 Z.76 F42000
G1 Z.36
G1 E.8 F1800
G1 F2622.814
M204 S5000
G1 X92.331 Y77.428 E.00103
G1 F2340
G1 X100.995 Y77.428 E.21781
G3 X101.725 Y77.435 I.3 J7.44 E.01837
G1 F2520
G1 X101.837 Y77.451 E.00284
G1 F2340
G1 X101.907 Y77.466 E.00181
G1 F2520
G3 X102.133 Y77.546 I-.305 J1.223 E.00604
G1 F2340
G3 X102.357 Y77.678 I-.584 J1.24 E.00655
G1 F2520
G1 X102.445 Y77.75 E.00286
G1 F2340
G3 X102.54 Y77.844 I-.771 J.878 E.00336
G1 F2520
G1 X102.623 Y77.944 E.00325
G1 F2340
G1 X102.656 Y77.991 E.00145
G1 F2520
G3 X102.774 Y78.213 I-1.065 J.713 E.00634
G1 F2340
G3 X102.872 Y78.705 I-1.59 J.569 E.01265
G1 X102.872 Y104.697 E.65347
G3 X102.87 Y105.359 I-13.582 J.3 E.01666
G1 F2520
G1 X102.857 Y105.486 E.0032
G1 F2340
G3 X102.692 Y105.951 I-1.336 J-.214 E.01248
G1 F2520
G1 X102.621 Y106.057 E.00321
G1 F2340
G3 X102.456 Y106.24 I-1.141 J-.865 E.0062
G1 F2520
G1 X102.357 Y106.321 E.00319
G1 F2340
G3 X102.133 Y106.453 I-.768 J-1.04 E.00656
G1 F2520
G1 X102.029 Y106.496 E.00284
G1 F2340
G3 X101.789 Y106.557 I-.446 J-1.264 E.00622
G1 F2520
G1 X101.662 Y106.569 E.0032
G1 F2340
G1 X79.005 Y106.571 E.56963
G3 X78.093 Y106.533 I-.3 J-3.786 E.02302
G3 X77.595 Y106.284 I.344 J-1.308 E.01409
G1 F2520
G1 X77.5 Y106.197 E.00324
G1 F2340
G1 X77.451 Y106.145 E.00181
G1 F2520
G1 X77.377 Y106.055 E.00291
G1 F2340
G3 X77.13 Y105.364 I1.121 J-.79 E.01869
G1 X77.129 Y79.302 E.65521
G3 X77.13 Y78.64 I13.547 J-.301 E.01666
G1 F2520
M73 P11 R8
G1 X77.143 Y78.513 E.0032
G1 F2340
G3 X77.379 Y77.942 I1.372 J.234 E.01567
G1 F2520
G1 X77.451 Y77.855 E.00284
G1 F2340
G3 X77.544 Y77.759 I.872 J.765 E.00336
G1 F2520
G1 X77.645 Y77.677 E.00326
G1 F2340
G1 X77.692 Y77.644 E.00144
G1 F2520
G1 X77.803 Y77.577 E.00327
G1 F2340
G1 X77.854 Y77.551 E.00145
G1 F2520
G3 X78.216 Y77.442 I.614 J1.373 E.00952
G1 F2340
G3 X79.005 Y77.428 I.481 J5.033 E.01987
G1 X87.669 Y77.428 E.21781
G1 F2622.814
G1 X87.71 Y77.428 E.00103
G1 F6229.35
G1 X87.712 Y77.028 E.01006
G1 F11371.885
G1 X87.713 Y76.628 E.01006
G1 F11668.197
G1 X87.715 Y76.228 E.01006
G1 X87.718 Y75.41 E.02058
G3 X90.167 Y73.416 I2.29 J.311 E.08742
G3 X92.282 Y75.41 I-.185 J2.315 E.07897
G1 X92.29 Y77.368 E.04924
; WIPE_START
M204 S6000
G1 X92.331 Y77.428 E-.02766
G1 X94.258 Y77.428 E-.73234
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

G1 X91.663 Y76.959
G1 Z.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0984604
G1 F18000
M204 S6000
G1 X91.644 Y77.018 E.00026
; LINE_WIDTH: 0.120356
G1 X91.627 Y77.062 E.00026
G1 X91.501 Y77.168 E.00093
; LINE_WIDTH: 0.0914357
G1 X91.454 Y77.203 E.00022
M204 S10000
G1 X91.831 Y76.293 F42000
; LINE_WIDTH: 0.467105
G1 F10398.165
M204 S6000
G2 X91.688 Y74.884 I-2.293 J-.478 E.04058
G1 X91.631 Y74.775 E.00346
G2 X88.13 Y75.896 I-1.632 J.929 E.14446
G1 X88.142 Y76.058 E.0046
G1 X88.413 Y76.235 E.00912
M204 S10000
G1 X88.337 Y76.958 F42000
; LINE_WIDTH: 0.0960718
G1 F18000
M204 S6000
G2 X88.381 Y77.037 I.1 J-.004 E.00038
G1 X88.428 Y77.08 E.00026
; WIPE_START
G1 X88.381 Y77.037 E-.31421
G1 X88.337 Y76.958 E-.44579
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.082 Y82.493 Z.76 F42000
G1 X78.528 Y87.29 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422186
G1 F11602.424
M204 S6000
G1 X80.511 Y85.307 E.07089
G1 X80.127 Y85.355 E.00978
G1 X79.929 Y85.34 E.00502
G1 X78.702 Y86.568 E.04389
G1 X78.702 Y86.019 E.01387
G1 X79.459 Y85.261 E.0271
G3 X79.062 Y85.11 I.175 J-1.057 E.01082
G1 X78.528 Y85.645 E.0191
M204 S10000
G1 X78.693 Y84.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0962454
G1 F18000
M204 S6000
G1 X78.569 Y84.664 E.0006
; WIPE_START
G1 X78.693 Y84.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.153 Y83.242 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; LINE_WIDTH: 0.16804
G1 F18000
M204 S6000
G2 X78.399 Y83.689 I9.022 J-4.682 E.00445
; LINE_WIDTH: 0.116597
G1 X78.451 Y83.779 E.00056
; LINE_WIDTH: 0.0931279
G1 X78.494 Y83.843 E.00029
M204 S10000
G1 X78.287 Y83.634 F42000
; LINE_WIDTH: 0.233386
G1 F18000
M204 S6000
G3 X78.259 Y82.709 I4.096 J-.59 E.01203
; LINE_WIDTH: 0.26479
G3 X78.278 Y82.573 I1.391 J.129 E.00208
; LINE_WIDTH: 0.302581
G1 F16775.757
G1 X78.296 Y82.457 E.00204
; LINE_WIDTH: 0.337353
G1 F14850.645
G1 X78.313 Y82.342 E.00231
; LINE_WIDTH: 0.361337
G1 F13761.445
G1 X78.372 Y82.052 E.0063
; WIPE_START
G1 X78.313 Y82.342 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.528 Y79.611 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422186
G1 F11602.424
M204 S6000
G1 X79.138 Y79.001 E.02184
G1 X79.687 Y79.001 E.01387
G1 X78.701 Y79.986 E.03525
G1 X78.701 Y80.535 E.01387
G1 X80.235 Y79.001 E.05486
G1 X80.784 Y79.001 E.01387
G1 X78.701 Y81.083 E.07447
G1 X78.701 Y81.232 E.00375
G1 X79.128 Y80.976 E.01257
G1 X79.473 Y80.86 E.00922
G1 X81.332 Y79.001 E.06648
G1 X81.881 Y79.001 E.01387
G1 X80.101 Y80.78 E.06364
G1 X80.468 Y80.808 E.0093
G1 X80.588 Y80.842 E.00316
G1 X82.429 Y79.001 E.06584
G1 X82.978 Y79.001 E.01387
G1 X81 Y80.979 E.07074
G1 X81.354 Y81.173 E.01022
G1 X83.526 Y79.001 E.07766
G1 X84.075 Y79.001 E.01387
G1 X81.66 Y81.416 E.08636
G1 X81.912 Y81.712 E.00984
G1 X84.623 Y79.001 E.09696
G1 X85.172 Y79.001 E.01387
G1 X82.117 Y82.056 E.10924
G3 X82.268 Y82.453 I-.908 J.572 E.01083
G1 X85.72 Y79.001 E.12346
G1 X86.269 Y79.001 E.01387
G1 X82.347 Y82.922 E.14022
G1 X82.361 Y83.065 E.00362
G1 X82.317 Y83.501 E.0111
G1 X86.817 Y79.001 E.16092
G1 X87.366 Y79.001 E.01387
G1 X78.702 Y87.665 E.3098
G1 X78.702 Y88.213 E.01387
G1 X87.914 Y79.001 E.32942
G1 X88.463 Y79.001 E.01387
G1 X78.702 Y88.762 E.34903
G1 X78.702 Y89.31 E.01387
G1 X89.351 Y78.661 E.38078
G2 X89.834 Y78.726 I.671 J-3.14 E.01234
G1 X78.702 Y89.859 E.39806
G1 X78.702 Y90.407 E.01387
G1 X90.405 Y78.704 E.41846
G2 X90.718 Y78.645 I-.143 J-1.608 E.00806
G1 X90.718 Y78.94 E.00746
G1 X78.702 Y90.956 E.42964
G1 X78.702 Y91.504 E.01387
G1 X91.205 Y79.001 E.44708
G1 X91.754 Y79.001 E.01387
G1 X78.702 Y92.053 E.4667
G1 X78.702 Y92.601 E.01387
G1 X92.302 Y79.001 E.48631
G1 X92.851 Y79.001 E.01387
G1 X78.702 Y93.149 E.50592
G1 X78.702 Y93.698 E.01387
G1 X93.399 Y79.001 E.52553
G1 X93.948 Y79.001 E.01387
G1 X78.702 Y94.246 E.54514
G1 X78.702 Y94.795 E.01387
G1 X94.496 Y79.001 E.56475
G1 X95.045 Y79.001 E.01387
G1 X78.702 Y95.343 E.58436
G1 X78.702 Y95.892 E.01387
G1 X95.593 Y79.001 E.60398
G1 X96.142 Y79.001 E.01387
G1 X78.702 Y96.44 E.62359
G1 X78.702 Y96.989 E.01387
G1 X96.69 Y79.001 E.6432
G1 X97.239 Y79.001 E.01387
G1 X78.702 Y97.537 E.66281
G1 X78.702 Y98.086 E.01387
G1 X97.787 Y79.001 E.68242
G1 X98.336 Y79.001 E.01387
G1 X78.702 Y98.634 E.70203
M73 P12 R8
G1 X78.702 Y99.183 E.01387
G1 X98.884 Y79.001 E.72164
G1 X99.433 Y79.001 E.01387
G1 X78.702 Y99.731 E.74126
G1 X78.702 Y100.28 E.01387
G1 X99.981 Y79.001 E.76087
G1 X100.53 Y79.001 E.01387
G1 X78.703 Y100.828 E.78048
G1 X78.703 Y101.376 E.01387
G1 X101.078 Y79.001 E.80009
G1 X101.299 Y79.001 E.00558
G1 X101.299 Y79.329 E.00829
G1 X78.703 Y101.925 E.80798
G1 X78.703 Y102.473 E.01387
G1 X101.299 Y79.877 E.80797
G1 X101.299 Y80.426 E.01387
G1 X78.703 Y103.022 E.80797
G1 X78.703 Y103.57 E.01387
G1 X101.299 Y80.974 E.80797
G1 X101.299 Y81.523 E.01387
G1 X78.703 Y104.119 E.80797
G1 X78.703 Y104.667 E.01387
G1 X101.299 Y82.071 E.80797
G1 X101.299 Y82.62 E.01387
G1 X78.92 Y104.999 E.8002
G1 X79.469 Y104.999 E.01387
G1 X101.299 Y83.168 E.78059
G1 X101.299 Y83.717 E.01387
G1 X80.017 Y104.998 E.76097
G1 X80.566 Y104.998 E.01387
G1 X101.299 Y84.265 E.74136
G1 X101.299 Y84.814 E.01387
G1 X81.114 Y104.998 E.72175
G1 X81.663 Y104.998 E.01387
G1 X101.299 Y85.362 E.70213
G1 X101.299 Y85.911 E.01387
G1 X82.211 Y104.998 E.68252
G1 X82.76 Y104.998 E.01387
G1 X101.299 Y86.459 E.6629
G1 X101.299 Y87.008 E.01387
G1 X83.308 Y104.998 E.64329
G1 X83.857 Y104.998 E.01387
G1 X101.299 Y87.556 E.62367
G1 X101.299 Y88.105 E.01387
G1 X84.405 Y104.998 E.60406
G1 X84.954 Y104.998 E.01387
G1 X101.299 Y88.653 E.58445
G1 X101.299 Y89.202 E.01387
G1 X85.503 Y104.998 E.56483
G1 X86.051 Y104.998 E.01387
G1 X101.299 Y89.75 E.54522
G1 X101.299 Y90.299 E.01387
G1 X86.6 Y104.998 E.5256
G1 X87.148 Y104.998 E.01387
G1 X101.299 Y90.847 E.50599
G1 X101.299 Y91.396 E.01387
G1 X87.697 Y104.998 E.48637
G1 X88.245 Y104.998 E.01387
G1 X101.299 Y91.944 E.46676
G1 X101.299 Y92.493 E.01387
G1 X88.794 Y104.998 E.44715
G1 X89.342 Y104.998 E.01387
G1 X101.299 Y93.041 E.42753
M73 P13 R8
G1 X101.299 Y93.59 E.01387
G1 X89.891 Y104.998 E.40792
G1 X90.439 Y104.998 E.01387
G1 X101.299 Y94.138 E.3883
G1 X101.299 Y94.687 E.01387
G1 X90.988 Y104.998 E.36869
G1 X91.537 Y104.998 E.01387
G1 X101.299 Y95.235 E.34908
G1 X101.299 Y95.784 E.01387
G1 X92.085 Y104.998 E.32946
G1 X92.634 Y104.997 E.01387
G1 X101.299 Y96.332 E.30985
G1 X101.299 Y96.881 E.01387
G1 X93.182 Y104.997 E.29023
G1 X93.731 Y104.997 E.01387
G1 X101.299 Y97.429 E.27062
G1 X101.299 Y97.978 E.01387
G1 X94.279 Y104.997 E.251
G1 X94.828 Y104.997 E.01387
G1 X101.299 Y98.526 E.23139
G1 X101.299 Y99.075 E.01387
G1 X95.376 Y104.997 E.21178
G1 X95.925 Y104.997 E.01387
G1 X101.299 Y99.623 E.19216
G1 X101.299 Y100.172 E.01387
G1 X96.473 Y104.997 E.17255
G1 X97.022 Y104.997 E.01387
G1 X101.299 Y100.72 E.15293
G1 X101.299 Y101.269 E.01387
G1 X97.571 Y104.997 E.13332
G1 X98.119 Y104.997 E.01387
G1 X101.299 Y101.817 E.1137
G1 X101.299 Y102.366 E.01387
G1 X98.668 Y104.997 E.09409
G1 X99.216 Y104.997 E.01387
G1 X101.299 Y102.914 E.07448
G1 X101.299 Y103.463 E.01387
G1 X99.765 Y104.997 E.05486
G1 X100.313 Y104.997 E.01387
G1 X101.299 Y104.011 E.03525
G1 X101.299 Y104.56 E.01387
G1 X100.688 Y105.17 E.02184
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11602.424
G1 X101.299 Y104.56 E-.32823
G1 X101.299 Y104.011 E-.20843
G1 X100.883 Y104.427 E-.22334
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/51
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.76 I1.108 J-.504 P1  F42000
G1 X88.942 Y78.18 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G2 X91.058 Y78.177 I1.054 J-2.513 E.05889
G1 X91.058 Y78.642 E.01259
G1 X101.658 Y78.642 E.28723
G1 X101.658 Y105.356 E.72388
G1 X78.344 Y105.358 E.63175
G1 X78.342 Y84.053 E.57729
G1 X78.765 Y84.51 E.01686
G2 X78.512 Y81.909 I1.305 J-1.44 E.25321
G1 X78.342 Y81.852 E.00486
G1 X78.342 Y78.642 E.087
G1 X88.942 Y78.642 E.28723
G1 X88.942 Y78.24 E.01089
; WIPE_START
G1 X89.238 Y78.283 E-.11361
G1 X89.496 Y78.346 E-.10088
G1 X89.76 Y78.383 E-.1012
G1 X90.025 Y78.393 E-.10106
G1 X90.29 Y78.378 E-.10084
G1 X90.553 Y78.336 E-.10116
G1 X90.81 Y78.269 E-.10105
G1 X90.91 Y78.232 E-.0402
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.6 Y80.429 Z.92 F42000
G1 X79.848 Y81.557 Z.92
G1 Z.52
G1 E.8 F1800
G1 F10826.06
M204 S6000
G1 X80.032 Y81.534 E.00503
G3 X79.73 Y81.572 I.038 J1.528 E.25197
G1 X79.788 Y81.564 E.0016
M204 S10000
G1 X79.9 Y81.969 F42000
G1 F10826.06
M204 S6000
G1 X80.042 Y81.951 E.0039
G3 X79.823 Y81.979 I.028 J1.111 E.18328
G1 X79.84 Y81.977 E.00048
M204 S250
G1 X79.949 Y82.367 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X80.052 Y82.354 E.00261
G3 X79.89 Y82.377 I.018 J.71 E.10806
; WIPE_START
M204 S6000
G1 X80.052 Y82.354 E-.06218
G1 X80.194 Y82.364 E-.05389
G1 X80.325 Y82.401 E-.05177
G1 X80.461 Y82.471 E-.05799
G1 X80.567 Y82.556 E-.05161
G1 X80.658 Y82.664 E-.0538
G1 X80.725 Y82.788 E-.05371
G1 X80.767 Y82.924 E-.05375
G1 X80.772 Y83.174 E-.09518
G1 X80.738 Y83.308 E-.05259
G1 X80.679 Y83.431 E-.05164
G1 X80.59 Y83.548 E-.05588
G1 X80.48 Y83.645 E-.05596
G1 X80.457 Y83.658 E-.01007
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.502 Y78.999 Z.92 F42000
G1 X88.526 Y77.44 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X88.745 Y77.601 E.00737
G2 X91.097 Y77.696 I1.255 J-1.92 E.06696
G1 X91.474 Y77.464 E.01198
G1 X91.474 Y78.226 E.02064
G1 X101.574 Y78.226 E.2737
G3 X102.074 Y78.725 I.02 J.479 E.0215
G1 X102.074 Y105.286 E.71972
G3 X101.635 Y105.772 I-.479 J.008 E.01953
G1 X78.413 Y105.773 E.62923
G3 X77.928 Y105.334 I-.008 J-.479 E.01952
G1 X77.926 Y78.725 E.72103
G3 X78.426 Y78.226 I.488 J-.012 E.02139
G1 X88.526 Y78.226 E.2737
G1 X88.526 Y77.5 E.01968
M204 S10000
G1 X88.381 Y76.612 F42000
G1 F10826.06
M204 S6000
G1 X88.566 Y76.886 E.00897
G2 X91.693 Y76.468 I1.432 J-1.189 E.10199
G1 X91.889 Y76.511 E.00544
G1 X91.889 Y77.81 E.03522
G1 X101.585 Y77.81 E.26272
G3 X102.489 Y78.715 I.011 J.894 E.03863
G1 X102.489 Y105.291 E.72014
G3 X101.651 Y106.187 I-.896 J.002 E.03663
G1 X78.408 Y106.189 E.62981
G3 X77.512 Y105.35 I.006 J-.903 E.03654
G1 X77.511 Y78.715 E.72175
G3 X78.415 Y77.81 I.896 J-.008 E.0386
G1 X88.111 Y77.81 E.26271
G1 X88.111 Y76.508 E.03528
G1 X88.305 Y76.464 E.0054
G1 X88.351 Y76.56 E.00288
M204 S250
G1 X88.713 Y76.389 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X88.605 Y76.126 E.00717
G3 X89.82 Y74.25 I1.395 J-.427 E.06399
G1 X89.964 Y74.24 E.00363
G3 X88.743 Y76.441 I.036 J1.459 E.15423
; WIPE_START
M204 S6000
G1 X88.605 Y76.126 E-.13086
G1 X88.547 Y75.844 E-.10943
G1 X88.546 Y75.566 E-.10558
G1 X88.595 Y75.302 E-.10196
G1 X88.692 Y75.051 E-.10233
G1 X88.844 Y74.807 E-.1092
G1 X89.026 Y74.614 E-.10064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.29 Y77.41 Z.92 F42000
G1 Z.52
G1 E.8 F1800
G1 F11668.197
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.297 E.66855
G3 X101.665 Y106.588 I-1.299 J-.006 E.04928
G1 X78.403 Y106.59 E.58485
G3 X77.112 Y105.365 I.014 J-1.307 E.0492
M73 P14 R8
G1 X77.11 Y78.705 E.67027
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.164 Y73.416 I2.289 J.311 E.08735
G3 X92.282 Y75.41 I-.182 J2.315 E.07902
G1 X92.29 Y77.35 E.04877
; WIPE_START
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.663 Y76.96
G1 Z.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0968194
G1 F18000
M204 S6000
G1 X91.645 Y77.013 E.00023
; LINE_WIDTH: 0.120754
G1 X91.627 Y77.062 E.00029
G1 X91.504 Y77.165 E.00091
; LINE_WIDTH: 0.0920232
G1 X91.453 Y77.204 E.00024
M204 S10000
G1 X91.83 Y76.293 F42000
; LINE_WIDTH: 0.467083
G1 F10398.683
M204 S6000
G2 X91.687 Y74.884 I-2.291 J-.479 E.04057
G1 X91.631 Y74.776 E.00343
G2 X88.13 Y75.896 I-1.633 J.928 E.14449
G1 X88.142 Y76.058 E.00459
G1 X88.413 Y76.235 E.00913
M204 S10000
G1 X88.337 Y76.958 F42000
; LINE_WIDTH: 0.0960765
G1 F18000
M204 S6000
G2 X88.381 Y77.037 I.101 J-.004 E.00038
G1 X88.428 Y77.08 E.00026
; WIPE_START
G1 X88.381 Y77.037 E-.31217
G1 X88.337 Y76.958 E-.44783
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.819 Y80.929 Z.92 F42000
G1 X81.219 Y81.295 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422766
G1 F11585.099
M204 S6000
G1 X78.906 Y78.982 E.08281
G1 X78.683 Y78.982 E.00566
G1 X78.683 Y79.308 E.00825
G1 X80.16 Y80.785 E.05289
G1 X80.013 Y80.774 E.00372
G1 X79.645 Y80.82 E.00939
G1 X78.683 Y79.857 E.03448
G1 X78.683 Y80.407 E.01391
G1 X79.358 Y81.082 E.02418
M204 S10000
G1 X78.7 Y81.378 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.101566
G1 F18000
M204 S6000
G1 X78.55 Y81.48 E.0008
M204 S10000
G1 X78.35 Y82.074 F42000
; LINE_WIDTH: 0.345195
G1 F14476.009
M204 S6000
G1 X78.287 Y82.431 E.00734
; LINE_WIDTH: 0.31993
G1 F15756.659
G1 X78.267 Y82.588 E.00295
; LINE_WIDTH: 0.278316
G1 F18000
G2 X78.246 Y82.762 I2.304 J.37 E.00279
; LINE_WIDTH: 0.249524
G1 X78.235 Y82.977 E.00302
G2 X78.274 Y83.51 I2.212 J.109 E.00751
G1 X78.488 Y83.904 E.00629
M204 S10000
G1 X78.533 Y83.918 F42000
; LINE_WIDTH: 0.102775
G1 F18000
M204 S6000
G3 X78.134 Y83.339 I5.495 J-4.218 E.00314
; WIPE_START
G1 X78.533 Y83.918 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.55 Y84.649 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; LINE_WIDTH: 0.0977879
G1 F18000
M204 S6000
G1 X78.678 Y84.736 E.00064
M204 S10000
G1 X79.296 Y105.191 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422766
G1 F11585.099
M204 S6000
G1 X78.684 Y104.578 E.02192
G1 X78.684 Y104.029 E.01391
G1 X79.672 Y105.017 E.03538
G1 X80.222 Y105.017 E.01391
G1 X78.684 Y103.48 E.05505
G1 X78.684 Y102.93 E.01391
G1 X80.771 Y105.017 E.07472
G1 X81.32 Y105.017 E.01391
G1 X78.684 Y102.381 E.09439
G1 X78.684 Y101.832 E.01391
G1 X81.869 Y105.017 E.11407
G1 X82.419 Y105.017 E.01391
G1 X78.684 Y101.282 E.13374
G1 X78.684 Y100.733 E.01391
G1 X82.968 Y105.017 E.15341
G1 X83.517 Y105.017 E.01391
G1 X78.684 Y100.183 E.17308
G1 X78.684 Y99.634 E.01391
G1 X84.066 Y105.017 E.19275
G1 X84.616 Y105.017 E.01391
G1 X78.684 Y99.085 E.21242
G1 X78.684 Y98.535 E.01391
G1 X85.165 Y105.017 E.23209
G1 X85.714 Y105.017 E.01391
G1 X78.684 Y97.986 E.25176
G1 X78.684 Y97.437 E.01391
G1 X86.264 Y105.016 E.27144
G1 X86.813 Y105.016 E.01391
G1 X78.684 Y96.887 E.29111
G1 X78.684 Y96.338 E.01391
G1 X87.362 Y105.016 E.31078
G1 X87.911 Y105.016 E.01391
G1 X78.684 Y95.789 E.33045
G1 X78.684 Y95.239 E.01391
G1 X88.461 Y105.016 E.35012
G1 X89.01 Y105.016 E.01391
G1 X78.684 Y94.69 E.36979
G1 X78.684 Y94.141 E.01391
G1 X89.559 Y105.016 E.38946
G1 X90.109 Y105.016 E.01391
G1 X78.684 Y93.591 E.40913
G1 X78.683 Y93.042 E.01391
G1 X90.658 Y105.016 E.42881
G1 X91.207 Y105.016 E.01391
G1 X78.683 Y92.492 E.44848
G1 X78.683 Y91.943 E.01391
G1 X91.756 Y105.016 E.46815
G1 X92.306 Y105.016 E.01391
G1 X78.683 Y91.394 E.48782
G1 X78.683 Y90.844 E.01391
G1 X92.855 Y105.016 E.50749
G1 X93.404 Y105.016 E.01391
G1 X78.683 Y90.295 E.52716
G1 X78.683 Y89.746 E.01391
G1 X93.954 Y105.016 E.54683
G1 X94.503 Y105.016 E.01391
G1 X78.683 Y89.196 E.5665
G1 X78.683 Y88.647 E.01391
G1 X95.052 Y105.016 E.58617
G1 X95.601 Y105.016 E.01391
G1 X78.683 Y88.098 E.60585
G1 X78.683 Y87.548 E.01391
G1 X96.151 Y105.016 E.62552
G1 X96.7 Y105.016 E.01391
G1 X78.683 Y86.999 E.64519
G1 X78.683 Y86.449 E.01391
G1 X97.249 Y105.016 E.66486
G1 X97.798 Y105.016 E.01391
G1 X78.683 Y85.9 E.68453
G1 X78.683 Y85.351 E.01391
G1 X98.348 Y105.016 E.7042
G1 X98.897 Y105.016 E.01391
G1 X78.917 Y85.036 E.71548
G1 X79.232 Y85.197 E.00896
G1 X79.671 Y85.321 E.01155
M73 P15 R8
G1 X79.759 Y85.328 E.00222
G1 X99.446 Y105.015 E.70502
G1 X99.996 Y105.015 E.01391
G1 X80.312 Y85.332 E.70486
G2 X80.76 Y85.23 I-.028 J-1.159 E.0117
G1 X100.545 Y105.015 E.70851
G1 X101.094 Y105.015 E.01391
G1 X81.152 Y85.073 E.71415
G2 X81.484 Y84.856 I-.552 J-1.207 E.01009
G1 X101.318 Y104.689 E.71025
G1 X101.318 Y104.14 E.01391
G1 X81.762 Y84.585 E.70027
G2 X82.005 Y84.278 I-.897 J-.957 E.00994
G1 X101.318 Y103.591 E.6916
G1 X101.318 Y103.041 E.01391
G1 X82.191 Y83.915 E.68492
G1 X82.223 Y83.849 E.00185
G1 X82.315 Y83.489 E.00941
G1 X101.318 Y102.492 E.68049
G1 X101.318 Y101.943 E.01391
G1 X82.353 Y82.978 E.67913
G2 X82.218 Y82.294 I-1.764 J-.008 E.01776
G1 X101.318 Y101.393 E.68394
G1 X101.318 Y100.844 E.01391
G1 X79.456 Y78.982 E.78288
G1 X80.005 Y78.982 E.01391
G1 X101.318 Y100.295 E.76321
G1 X101.318 Y99.745 E.01391
G1 X80.554 Y78.982 E.74354
G1 X81.103 Y78.982 E.01391
G1 X101.318 Y99.196 E.72387
G1 X101.318 Y98.647 E.01391
G1 X81.653 Y78.982 E.7042
G1 X82.202 Y78.982 E.01391
G1 X101.318 Y98.097 E.68453
G1 X101.318 Y97.548 E.01391
G1 X82.751 Y78.982 E.66486
G1 X83.301 Y78.982 E.01391
G1 X101.318 Y96.999 E.64518
G1 X101.318 Y96.45 E.01391
G1 X83.85 Y78.982 E.62551
G1 X84.399 Y78.982 E.01391
G1 X101.318 Y95.9 E.60584
G1 X101.318 Y95.351 E.01391
G1 X84.949 Y78.982 E.58617
G1 X85.498 Y78.982 E.01391
G1 X101.318 Y94.802 E.5665
G1 X101.318 Y94.252 E.01391
G1 X86.047 Y78.982 E.54683
G1 X86.597 Y78.982 E.01391
G1 X101.318 Y93.703 E.52716
G1 X101.318 Y93.154 E.01391
G1 X87.146 Y78.982 E.50748
G1 X87.695 Y78.982 E.01391
G1 X101.318 Y92.604 E.48781
G1 X101.318 Y92.055 E.01391
G1 X88.245 Y78.982 E.46814
G1 X88.794 Y78.982 E.01391
G1 X101.318 Y91.506 E.44847
G1 X101.318 Y90.956 E.01391
G1 X89.283 Y78.921 E.43098
G1 X89.283 Y78.644 E.00701
G2 X89.617 Y78.707 I.48 J-1.656 E.00863
G1 X101.318 Y90.407 E.419
G1 X101.318 Y89.858 E.01391
G1 X90.185 Y78.725 E.39866
G2 X90.667 Y78.658 I-.229 J-3.424 E.01234
G1 X101.318 Y89.308 E.38139
G1 X101.318 Y88.759 E.01391
G1 X91.541 Y78.982 E.35011
G1 X92.09 Y78.982 E.01391
G1 X101.318 Y88.21 E.33044
M73 P16 R8
G1 X101.318 Y87.66 E.01391
G1 X92.639 Y78.982 E.31077
G1 X93.189 Y78.982 E.01391
G1 X101.318 Y87.111 E.2911
G1 X101.318 Y86.562 E.01391
G1 X93.738 Y78.982 E.27143
G1 X94.287 Y78.982 E.01391
G1 X101.318 Y86.012 E.25176
G1 X101.318 Y85.463 E.01391
G1 X94.837 Y78.982 E.23208
G1 X95.386 Y78.982 E.01391
G1 X101.318 Y84.914 E.21241
G1 X101.318 Y84.364 E.01391
G1 X95.935 Y78.982 E.19274
G1 X96.485 Y78.982 E.01391
G1 X101.318 Y83.815 E.17307
G1 X101.318 Y83.266 E.01391
G1 X97.034 Y78.982 E.1534
G1 X97.583 Y78.982 E.01391
G1 X101.318 Y82.716 E.13373
G1 X101.318 Y82.167 E.01391
G1 X98.133 Y78.982 E.11406
G1 X98.682 Y78.982 E.01391
G1 X101.318 Y81.618 E.09438
G1 X101.318 Y81.068 E.01391
G1 X99.231 Y78.982 E.07471
G1 X99.78 Y78.982 E.01391
G1 X101.318 Y80.519 E.05504
G1 X101.318 Y79.97 E.01391
G1 X100.33 Y78.982 E.03537
G1 X100.879 Y78.982 E.01391
G1 X101.491 Y79.594 E.02191
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11585.099
G1 X100.879 Y78.982 E-.32886
G1 X100.33 Y78.982 E-.20874
G1 X100.744 Y79.396 E-.2224
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/51
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.92 I.125 J-1.211 P1  F42000
G1 X88.942 Y78.18 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G2 X91.058 Y78.177 I1.054 J-2.541 E.05886
G1 X91.058 Y78.642 E.0126
G1 X101.658 Y78.642 E.28723
G1 X101.658 Y105.356 E.72388
G1 X78.344 Y105.358 E.63175
G1 X78.342 Y84.023 E.5781
G1 X78.709 Y84.46 E.01545
G2 X78.694 Y81.687 I1.358 J-1.394 E.24766
G1 X78.342 Y82.107 E.01485
G1 X78.342 Y78.642 E.09391
G1 X88.942 Y78.642 E.28723
G1 X88.942 Y78.24 E.01088
; WIPE_START
G1 X89.238 Y78.283 E-.11383
G1 X89.497 Y78.346 E-.10097
G1 X89.76 Y78.383 E-.1012
G1 X90.026 Y78.393 E-.10108
G1 X90.292 Y78.377 E-.10103
G1 X90.554 Y78.336 E-.10094
G1 X90.811 Y78.268 E-.10102
G1 X90.91 Y78.232 E-.03991
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.6 Y80.428 Z1.08 F42000
G1 X79.844 Y81.557 Z1.08
G1 Z.68
G1 E.8 F1800
G1 F10826.06
M204 S6000
G1 X80.032 Y81.534 E.00514
G3 X79.729 Y81.572 I.038 J1.528 E.25192
G1 X79.784 Y81.565 E.00149
M204 S10000
G1 X79.895 Y81.97 F42000
G1 F10826.06
M204 S6000
G1 X80.042 Y81.951 E.00401
G3 X79.822 Y81.979 I.028 J1.111 E.18328
G1 X79.836 Y81.977 E.00037
M204 S250
G1 X79.945 Y82.367 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X80.052 Y82.354 E.00271
G3 X79.886 Y82.378 I.018 J.71 E.10795
; WIPE_START
M204 S6000
G1 X80.052 Y82.354 E-.06374
G1 X80.188 Y82.364 E-.05172
G1 X80.334 Y82.405 E-.05783
G1 X80.451 Y82.465 E-.04967
G1 X80.57 Y82.56 E-.05788
G1 X80.658 Y82.664 E-.05182
G1 X80.725 Y82.788 E-.05367
G1 X80.767 Y82.924 E-.05385
G1 X80.781 Y83.065 E-.05386
G1 X80.767 Y83.206 E-.05401
G1 X80.725 Y83.341 E-.05378
G1 X80.589 Y83.55 E-.09464
G1 X80.485 Y83.642 E-.05277
G1 X80.461 Y83.656 E-.01075
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.506 Y78.997 Z1.08 F42000
G1 X88.526 Y77.44 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X88.746 Y77.601 E.00738
G2 X91.099 Y77.695 I1.255 J-1.921 E.067
G1 X91.474 Y77.463 E.01194
G1 X91.474 Y78.226 E.02066
G1 X101.575 Y78.226 E.2737
G3 X102.074 Y78.725 I.02 J.479 E.0215
G1 X102.074 Y105.286 E.71972
G3 X101.635 Y105.771 I-.479 J.008 E.01952
G1 X78.425 Y105.773 E.62891
G3 X77.928 Y105.334 I-.024 J-.474 E.0199
G1 X77.926 Y78.725 E.72103
G3 X78.426 Y78.226 I.484 J-.015 E.02144
G1 X88.526 Y78.226 E.2737
G1 X88.526 Y77.5 E.01967
M204 S10000
G1 X88.352 Y76.562 F42000
G1 F10826.06
M204 S6000
G1 X88.361 Y76.582 E.0006
G2 X91.693 Y76.468 I1.638 J-.884 E.11195
G1 X91.889 Y76.51 E.00545
G1 X91.889 Y77.81 E.03522
G1 X101.585 Y77.81 E.26272
G3 X102.489 Y78.715 I.014 J.891 E.03867
G1 X102.489 Y105.292 E.72015
G3 X101.651 Y106.187 I-.896 J.001 E.03662
G1 X78.415 Y106.189 E.62962
G3 X77.512 Y105.35 I-.013 J-.892 E.03686
G1 X77.511 Y78.715 E.72175
G3 X78.415 Y77.81 I.902 J-.002 E.03853
G1 X88.111 Y77.81 E.26272
G1 X88.111 Y76.508 E.03528
G1 X88.305 Y76.464 E.0054
G1 X88.326 Y76.508 E.0013
M204 S250
G1 X88.713 Y76.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X88.605 Y76.126 E.00718
G3 X89.82 Y74.25 I1.395 J-.427 E.064
G1 X89.964 Y74.24 E.00362
G3 X88.744 Y76.441 I.036 J1.459 E.15422
; WIPE_START
M204 S6000
G1 X88.605 Y76.126 E-.13106
G1 X88.547 Y75.844 E-.10941
G1 X88.546 Y75.565 E-.10577
G1 X88.595 Y75.301 E-.10209
G1 X88.692 Y75.051 E-.10185
G1 X88.844 Y74.807 E-.10937
G1 X89.026 Y74.615 E-.10044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.29 Y77.41 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
G1 F11668.197
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.004 J1.291 E.0512
G1 X102.89 Y105.297 E.66856
G3 X101.666 Y106.588 I-1.299 J-.006 E.04927
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I-.001 J-1.294 E.04938
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.306 J.011 E.05104
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.162 Y73.416 I2.289 J.311 E.0873
G3 X92.282 Y75.41 I-.18 J2.315 E.07908
G1 X92.29 Y77.35 E.04877
; WIPE_START
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.663 Y76.959
G1 Z.68
M73 P17 R8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.099201
G1 F18000
M204 S6000
G1 X91.643 Y77.02 E.00027
; LINE_WIDTH: 0.119629
G1 X91.628 Y77.061 E.00024
G1 X91.5 Y77.168 E.00093
; LINE_WIDTH: 0.0909564
G1 X91.457 Y77.201 E.0002
M204 S10000
G1 X91.831 Y76.293 F42000
; LINE_WIDTH: 0.467044
G1 F10399.622
M204 S6000
G2 X91.684 Y74.877 I-2.289 J-.478 E.0408
G1 X91.632 Y74.776 E.00319
G2 X88.13 Y75.896 I-1.633 J.929 E.14443
G1 X88.142 Y76.058 E.00459
G1 X88.413 Y76.234 E.00912
M204 S10000
G1 X88.337 Y76.958 F42000
; LINE_WIDTH: 0.0961459
G1 F18000
M204 S6000
G2 X88.381 Y77.038 I.101 J-.004 E.00038
G1 X88.429 Y77.081 E.00026
; WIPE_START
G1 X88.381 Y77.038 E-.31412
G1 X88.337 Y76.958 E-.44588
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.075 Y82.487 Z1.08 F42000
G1 X78.51 Y87.284 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422766
G1 F11585.099
M204 S6000
G1 X80.483 Y85.311 E.07067
G3 X79.906 Y85.339 I-.358 J-1.412 E.01473
G1 X78.683 Y86.561 E.04379
G1 X78.683 Y86.012 E.01391
G1 X79.445 Y85.25 E.0273
G3 X79.045 Y85.101 I.167 J-1.064 E.01089
G1 X78.509 Y85.636 E.01917
M204 S10000
G1 X78.694 Y84.744 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0982655
G1 F18000
M204 S6000
G1 X78.55 Y84.652 E.00071
; WIPE_START
G1 X78.694 Y84.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.134 Y83.209 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; LINE_WIDTH: 0.168344
G1 F18000
M204 S6000
G2 X78.399 Y83.69 I9.82 J-5.1 E.00479
; LINE_WIDTH: 0.116639
G1 X78.451 Y83.779 E.00056
; LINE_WIDTH: 0.0931629
G1 X78.495 Y83.843 E.0003
M204 S10000
G1 X78.455 Y83.834 F42000
; LINE_WIDTH: 0.246185
G1 F18000
M204 S6000
G3 X78.251 Y83.41 I8.44 J-4.318 E.0065
G1 X78.234 Y83.069 E.0047
G1 X78.251 Y82.722 E.0048
G3 X78.467 Y82.282 I5.943 J2.647 E.00677
M204 S10000
G1 X78.492 Y82.29 F42000
; LINE_WIDTH: 0.102383
G1 F18000
M204 S6000
G2 X78.134 Y82.867 I5.627 J3.891 E.00301
; WIPE_START
G1 X78.492 Y82.29 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.509 Y79.594 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422766
G1 F11585.099
M204 S6000
G1 X79.121 Y78.982 E.02192
G1 X79.671 Y78.982 E.01391
G1 X78.683 Y79.97 E.03538
G1 X78.683 Y80.519 E.01391
G1 X80.22 Y78.982 E.05505
G1 X80.769 Y78.982 E.01391
G1 X78.683 Y81.069 E.07472
G1 X78.683 Y81.251 E.00461
G1 X78.75 Y81.194 E.00222
G1 X79.128 Y80.976 E.01105
G1 X79.424 Y80.876 E.00793
G1 X81.318 Y78.982 E.06783
G1 X81.868 Y78.982 E.01391
G1 X80.072 Y80.778 E.06432
G3 X80.563 Y80.836 I.052 J1.664 E.01257
G1 X82.417 Y78.982 E.06641
G1 X82.966 Y78.982 E.01391
G1 X80.98 Y80.969 E.07114
G1 X81.333 Y81.165 E.01023
G1 X83.516 Y78.982 E.07816
G1 X84.065 Y78.982 E.01391
G1 X81.639 Y81.409 E.08689
G1 X81.899 Y81.697 E.00985
G1 X84.614 Y78.982 E.09723
G1 X85.164 Y78.982 E.01391
G1 X82.107 Y82.038 E.10945
G3 X82.261 Y82.434 I-.902 J.579 E.01081
G1 X85.713 Y78.982 E.1236
G1 X86.262 Y78.982 E.01391
G1 X82.345 Y82.9 E.14028
G1 X82.362 Y83.065 E.0042
G1 X82.32 Y83.473 E.0104
G1 X86.812 Y78.982 E.16083
G1 X87.361 Y78.982 E.01391
G1 X78.683 Y87.66 E.31076
G1 X78.683 Y88.209 E.01391
G1 X87.91 Y78.982 E.33043
G1 X88.46 Y78.982 E.01391
G1 X78.683 Y88.759 E.3501
G1 X78.683 Y89.308 E.01391
G1 X89.334 Y78.657 E.38141
G2 X89.815 Y78.726 I.694 J-3.142 E.01231
G1 X78.683 Y89.857 E.39862
G1 X78.683 Y90.406 E.01391
G1 X90.382 Y78.708 E.41893
G2 X90.718 Y78.645 I-.151 J-1.728 E.00866
G1 X90.718 Y78.922 E.00701
G1 X78.683 Y90.956 E.43095
G1 X78.683 Y91.505 E.01391
G1 X91.206 Y78.982 E.44845
G1 X91.756 Y78.982 E.01391
G1 X78.683 Y92.054 E.46812
G1 X78.683 Y92.604 E.01391
G1 X92.305 Y78.982 E.48779
G1 X92.854 Y78.982 E.01391
G1 X78.683 Y93.153 E.50746
G1 X78.684 Y93.702 E.01391
G1 X93.404 Y78.982 E.52713
G1 X93.953 Y78.982 E.01391
G1 X78.684 Y94.251 E.5468
G1 X78.684 Y94.801 E.01391
G1 X94.502 Y78.982 E.56647
G1 X95.052 Y78.982 E.01391
G1 X78.684 Y95.35 E.58614
G1 X78.684 Y95.899 E.01391
G1 X95.601 Y78.982 E.60581
G1 X96.15 Y78.982 E.01391
G1 X78.684 Y96.449 E.62548
G1 X78.684 Y96.998 E.01391
G1 X96.7 Y78.982 E.64515
G1 X97.249 Y78.982 E.01391
G1 X78.684 Y97.547 E.66482
G1 X78.684 Y98.096 E.01391
G1 X97.798 Y78.982 E.68449
G1 X98.348 Y78.982 E.01391
G1 X78.684 Y98.646 E.70416
G1 X78.684 Y99.195 E.01391
G1 X98.897 Y78.982 E.72383
G1 X99.446 Y78.982 E.01391
G1 X78.684 Y99.744 E.7435
G1 X78.684 Y100.294 E.01391
G1 X99.995 Y78.982 E.76317
G1 X100.545 Y78.982 E.01391
G1 X78.684 Y100.843 E.78284
G1 X78.684 Y101.392 E.01391
G1 X101.094 Y78.982 E.80251
G1 X101.318 Y78.982 E.00566
G1 X101.318 Y79.308 E.00825
M73 P18 R8
G1 X78.684 Y101.941 E.81051
G1 X78.684 Y102.491 E.01391
G1 X101.318 Y79.857 E.81051
M73 P18 R7
G1 X101.318 Y80.407 E.01391
G1 X78.684 Y103.04 E.81051
G1 X78.684 Y103.589 E.01391
G1 X101.318 Y80.956 E.8105
G1 X101.318 Y81.505 E.01391
G1 X78.684 Y104.139 E.8105
G1 X78.684 Y104.688 E.01391
G1 X101.318 Y82.055 E.8105
G1 X101.318 Y82.604 E.01391
G1 X78.904 Y105.017 E.80262
G1 X79.454 Y105.017 E.01391
G1 X101.318 Y83.153 E.78295
G1 X101.318 Y83.703 E.01391
G1 X80.003 Y105.017 E.76327
G1 X80.553 Y105.017 E.01391
G1 X101.318 Y84.252 E.7436
G1 X101.318 Y84.801 E.01391
G1 X81.102 Y105.017 E.72393
G1 X81.651 Y105.017 E.01391
G1 X101.318 Y85.351 E.70425
G1 X101.318 Y85.9 E.01391
G1 X82.201 Y105.017 E.68458
G1 X82.75 Y105.017 E.01391
G1 X101.318 Y86.449 E.66491
G1 X101.318 Y86.999 E.01391
G1 X83.299 Y105.017 E.64524
G1 X83.849 Y105.017 E.01391
G1 X101.318 Y87.548 E.62556
G1 X101.318 Y88.097 E.01391
G1 X84.398 Y105.017 E.60589
G1 X84.947 Y105.017 E.01391
G1 X101.318 Y88.647 E.58622
G1 X101.318 Y89.196 E.01391
G1 X85.497 Y105.017 E.56654
G1 X86.046 Y105.017 E.01391
G1 X101.318 Y89.745 E.54687
G1 X101.318 Y90.295 E.01391
G1 X86.596 Y105.016 E.5272
G1 X87.145 Y105.016 E.01391
G1 X101.318 Y90.844 E.50752
G1 X101.318 Y91.393 E.01391
G1 X87.694 Y105.016 E.48785
G1 X88.244 Y105.016 E.01391
G1 X101.318 Y91.942 E.46818
G1 X101.318 Y92.492 E.01391
G1 X88.793 Y105.016 E.44851
G1 X89.342 Y105.016 E.01391
G1 X101.318 Y93.041 E.42883
G1 X101.318 Y93.59 E.01391
G1 X89.892 Y105.016 E.40916
G1 X90.441 Y105.016 E.01391
G1 X101.318 Y94.14 E.38949
G1 X101.318 Y94.689 E.01391
G1 X90.99 Y105.016 E.36981
G1 X91.54 Y105.016 E.01391
G1 X101.318 Y95.238 E.35014
G1 X101.318 Y95.788 E.01391
G1 X92.089 Y105.016 E.33047
G1 X92.639 Y105.016 E.01391
G1 X101.318 Y96.337 E.31079
G1 X101.318 Y96.886 E.01391
G1 X93.188 Y105.016 E.29112
G1 X93.737 Y105.016 E.01391
G1 X101.318 Y97.436 E.27145
G1 X101.318 Y97.985 E.01391
G1 X94.287 Y105.016 E.25178
G1 X94.836 Y105.016 E.01391
G1 X101.318 Y98.534 E.2321
M73 P19 R7
G1 X101.318 Y99.084 E.01391
G1 X95.385 Y105.016 E.21243
G1 X95.935 Y105.016 E.01391
G1 X101.318 Y99.633 E.19276
G1 X101.318 Y100.182 E.01391
G1 X96.484 Y105.016 E.17308
G1 X97.034 Y105.016 E.01391
G1 X101.318 Y100.732 E.15341
G1 X101.318 Y101.281 E.01391
G1 X97.583 Y105.016 E.13374
G1 X98.132 Y105.016 E.01391
G1 X101.318 Y101.83 E.11407
G1 X101.318 Y102.38 E.01391
G1 X98.682 Y105.016 E.09439
G1 X99.231 Y105.015 E.01391
G1 X101.318 Y102.929 E.07472
G1 X101.318 Y103.478 E.01391
G1 X99.78 Y105.015 E.05505
G1 X100.33 Y105.015 E.01391
G1 X101.318 Y104.028 E.03537
G1 X101.318 Y104.577 E.01391
G1 X100.706 Y105.189 E.02192
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11585.099
G1 X101.318 Y104.577 E-.32889
G1 X101.318 Y104.028 E-.20874
G1 X100.904 Y104.441 E-.22237
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
G3 Z1.08 I.883 J-.838 P1  F42000
G1 X79.953 Y82.366 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X80.052 Y82.354 E.00252
G3 X79.894 Y82.376 I.018 J.709 E.10801
; WIPE_START
M204 S6000
G1 X80.052 Y82.354 E-.0609
G1 X80.193 Y82.364 E-.05373
G1 X80.329 Y82.403 E-.05372
G1 X80.456 Y82.467 E-.0539
G1 X80.567 Y82.556 E-.05389
G1 X80.657 Y82.664 E-.05378
G1 X80.725 Y82.788 E-.05378
G1 X80.767 Y82.923 E-.05371
G1 X80.781 Y83.059 E-.05179
G1 X80.738 Y83.308 E-.09588
G1 X80.677 Y83.435 E-.05381
G1 X80.591 Y83.548 E-.05386
G1 X80.489 Y83.638 E-.05168
G1 X80.454 Y83.659 E-.01557
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.131 Y78.558 Z1.24 F42000
G1 X88.352 Y76.563 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X88.361 Y76.582 E.00059
G1 X88.531 Y76.864 E.00891
G1 X88.111 Y76.864 E.01139
G1 X88.111 Y76.508 E.00963
G1 X88.305 Y76.464 E.0054
G1 X88.326 Y76.508 E.00132
M204 S250
G1 X88.714 Y76.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X88.604 Y76.126 E.0072
G3 X89.82 Y74.251 I1.395 J-.427 E.06399
G1 X89.964 Y74.24 E.00363
G3 X88.744 Y76.442 I.036 J1.459 E.15421
; WIPE_START
M204 S6000
G1 X88.604 Y76.126 E-.13126
G1 X88.547 Y75.844 E-.10942
G1 X88.546 Y75.565 E-.10582
G1 X88.595 Y75.3 E-.1023
G1 X88.692 Y75.051 E-.10143
G1 X88.844 Y74.808 E-.10927
G1 X89.025 Y74.615 E-.10052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.617 Y76.864 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10826.06
M204 S6000
G1 X91.473 Y76.864 E.00389
G2 X91.693 Y76.468 I-1.894 J-1.311 E.0123
G1 X91.889 Y76.51 E.00544
G1 X91.889 Y76.864 E.00957
G1 X91.677 Y76.864 E.00576
M204 S250
G1 X92.29 Y77.41 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.004 J1.291 E.0512
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.299 J-.004 E.04933
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.011 J-1.307 E.04926
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.004 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.16 Y73.416 I2.289 J.311 E.08724
G3 X92.282 Y75.41 I-.179 J2.317 E.07913
G1 X92.29 Y77.35 E.04877
; WIPE_START
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.831 Y76.292
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.466982
G1 F10401.12
M204 S6000
G2 X91.687 Y74.884 I-2.294 J-.478 E.04056
G1 X91.632 Y74.777 E.00341
G2 X88.13 Y75.896 I-1.633 J.929 E.14442
G1 X88.142 Y76.058 E.00459
G1 X88.413 Y76.234 E.00912
M204 S10000
G1 X88.808 Y76.889 F42000
; LINE_WIDTH: 0.107954
G1 F18000
M204 S6000
G1 X88.913 Y77.017 E.00079
G1 X88.999 Y77.045 E.00043
; WIPE_START
G1 X88.913 Y77.017 E-.26889
G1 X88.808 Y76.889 E-.49111
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.051 Y77.064 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.116834
G1 F18000
M204 S6000
G1 X91.21 Y76.87 E.00135
; WIPE_START
G1 X91.051 Y77.064 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.672 Y77.477 Z1.24 F42000
G1 X101.347 Y77.622 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11668.197
M204 S2000
G1 X102.678 Y78.953 E.04733
G1 X102.678 Y79.498
G1 X100.801 Y77.622 E.06672
G1 X100.256 Y77.622
G1 X102.678 Y80.044 E.08611
G1 X102.678 Y80.589
G1 X99.711 Y77.622 E.1055
G1 X99.165 Y77.622
G1 X102.678 Y81.134 E.1249
G1 X102.678 Y81.68
G1 X98.62 Y77.622 E.14429
G1 X98.074 Y77.622
G1 X102.678 Y82.225 E.16368
G1 X102.678 Y82.771
G1 X97.529 Y77.622 E.18307
G1 X96.984 Y77.622
G1 X102.678 Y83.316 E.20246
G1 X102.678 Y83.861
G1 X96.438 Y77.622 E.22186
G1 X95.893 Y77.622
G1 X102.678 Y84.407 E.24125
G1 X102.678 Y84.952
G1 X95.347 Y77.622 E.26064
G1 X94.802 Y77.622
G1 X102.678 Y85.498 E.28003
G1 X102.678 Y86.043
G1 X94.257 Y77.622 E.29942
G1 X93.711 Y77.622
G1 X102.678 Y86.589 E.31882
G1 X102.678 Y87.134
G1 X93.166 Y77.622 E.33821
G1 X92.62 Y77.622
G1 X102.678 Y87.679 E.3576
G1 X102.678 Y88.225
G1 X91.544 Y77.091 E.39587
G1 X90.999 Y77.091
G1 X102.678 Y88.77 E.41526
G1 X102.678 Y89.316
G1 X90.615 Y77.253 E.42888
M73 P20 R7
G1 X90.179 Y77.362
G1 X102.678 Y89.861 E.44439
G1 X102.678 Y90.406
G1 X89.591 Y77.319 E.46531
G1 X88.817 Y77.091
G1 X102.678 Y90.952 E.49283
G1 X102.678 Y91.497
G1 X88.272 Y77.091 E.51222
G1 X87.922 Y77.287
G1 X102.678 Y92.043 E.52465
G1 X102.678 Y92.588
G1 X87.712 Y77.622 E.53213
G1 X87.166 Y77.622
G1 X102.678 Y93.133 E.55152
G1 X102.678 Y93.679
G1 X86.621 Y77.622 E.57091
G1 X86.075 Y77.622
G1 X102.678 Y94.224 E.59031
G1 X102.678 Y94.77
G1 X85.53 Y77.622 E.6097
G1 X84.985 Y77.622
G1 X102.678 Y95.315 E.62909
G1 X102.678 Y95.86
G1 X84.439 Y77.622 E.64848
G1 X83.894 Y77.622
G1 X102.678 Y96.406 E.66787
G1 X102.678 Y96.951
G1 X83.348 Y77.622 E.68727
G1 X82.803 Y77.622
G1 X102.678 Y97.497 E.70666
G1 X102.678 Y98.042
G1 X82.258 Y77.622 E.72605
G1 X81.712 Y77.622
G1 X102.678 Y98.587 E.74544
G1 X102.678 Y99.133
G1 X81.167 Y77.622 E.76483
G1 X80.621 Y77.622
G1 X102.678 Y99.678 E.78423
G1 X102.678 Y100.224
G1 X80.076 Y77.622 E.80362
G1 X79.531 Y77.622
G1 X102.678 Y100.769 E.82301
G1 X102.678 Y101.314
G1 X78.985 Y77.622 E.8424
G1 X78.44 Y77.622
G1 X102.678 Y101.86 E.86179
G1 X102.678 Y102.405
G1 X77.98 Y77.708 E.87813
M73 P21 R7
G1 X77.652 Y77.925
G1 X102.678 Y102.951 E.88979
G1 X102.678 Y103.496
G1 X77.425 Y78.243 E.89786
G1 X77.323 Y78.687
G1 X102.678 Y104.041 E.90149
G1 X102.678 Y104.587
G1 X80.976 Y82.885 E.77161
G1 X80.935 Y83.389
G1 X102.678 Y105.132 E.77309
G1 X102.626 Y105.625
G1 X80.719 Y83.719 E.7789
G1 X80.384 Y83.929
G1 X102.434 Y105.979 E.784
G1 X102.141 Y106.231
G1 X79.874 Y83.965 E.7917
; WIPE_START
M204 S6000
G1 X81.288 Y85.379 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.251 Y82.16 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F11668.197
M204 S2000
G1 X77.322 Y79.231 E.10415
G1 X77.322 Y79.777
G1 X79.748 Y82.203 E.08626
G1 X79.416 Y82.416
G1 X77.322 Y80.322 E.07443
G1 X77.322 Y80.867
G1 X79.205 Y82.75 E.06693
G1 X79.167 Y83.258
G1 X77.322 Y81.413 E.0656
G1 X77.322 Y81.958
G1 X101.732 Y106.368 E.86789
G1 X101.194 Y106.376
G1 X77.322 Y82.504 E.84877
G1 X77.322 Y83.049
G1 X100.649 Y106.376 E.82938
G1 X100.104 Y106.376
G1 X77.322 Y83.595 E.80999
G1 X77.322 Y84.14
G1 X99.558 Y106.376 E.7906
G1 X99.013 Y106.376
G1 X77.323 Y84.686 E.77121
G1 X77.323 Y85.231
G1 X98.468 Y106.376 E.75181
G1 X97.922 Y106.376
G1 X77.323 Y85.776 E.73242
G1 X77.323 Y86.322
G1 X97.377 Y106.376 E.71303
G1 X96.831 Y106.376
G1 X77.323 Y86.867 E.69364
G1 X77.323 Y87.413
G1 X96.286 Y106.376 E.67425
M73 P22 R7
G1 X95.741 Y106.376
G1 X77.323 Y87.958 E.65485
G1 X77.323 Y88.504
G1 X95.195 Y106.376 E.63546
G1 X94.65 Y106.376
G1 X77.323 Y89.049 E.61607
G1 X77.323 Y89.595
G1 X94.105 Y106.376 E.59668
G1 X93.559 Y106.376
G1 X77.323 Y90.14 E.57729
G1 X77.323 Y90.685
G1 X93.014 Y106.376 E.5579
G1 X92.469 Y106.376
G1 X77.323 Y91.231 E.5385
G1 X77.323 Y91.776
G1 X91.923 Y106.376 E.51911
G1 X91.378 Y106.377
G1 X77.323 Y92.322 E.49972
G1 X77.323 Y92.867
G1 X90.832 Y106.377 E.48033
G1 X90.287 Y106.377
G1 X77.323 Y93.413 E.46094
G1 X77.323 Y93.958
G1 X89.742 Y106.377 E.44155
G1 X89.196 Y106.377
G1 X77.323 Y94.504 E.42215
G1 X77.323 Y95.049
G1 X88.651 Y106.377 E.40276
G1 X88.106 Y106.377
G1 X77.323 Y95.594 E.38337
G1 X77.323 Y96.14
G1 X87.56 Y106.377 E.36398
G1 X87.015 Y106.377
G1 X77.323 Y96.685 E.34459
G1 X77.323 Y97.231
G1 X86.47 Y106.377 E.32519
G1 X85.924 Y106.377
G1 X77.323 Y97.776 E.3058
G1 X77.323 Y98.322
G1 X85.379 Y106.377 E.28641
G1 X84.833 Y106.377
G1 X77.323 Y98.867 E.26702
G1 X77.324 Y99.413
G1 X84.288 Y106.377 E.24763
G1 X83.743 Y106.377
G1 X77.324 Y99.958 E.22823
G1 X77.324 Y100.503
G1 X83.197 Y106.377 E.20884
G1 X82.652 Y106.377
G1 X77.324 Y101.049 E.18945
G1 X77.324 Y101.594
G1 X82.107 Y106.377 E.17006
G1 X81.561 Y106.377
G1 X77.324 Y102.14 E.15067
G1 X77.324 Y102.685
G1 X81.016 Y106.377 E.13128
G1 X80.471 Y106.377
G1 X77.324 Y103.231 E.11188
G1 X77.324 Y103.776
G1 X79.925 Y106.377 E.09249
M73 P23 R7
G1 X79.38 Y106.377
G1 X77.324 Y104.321 E.0731
G1 X77.324 Y104.867
G1 X78.834 Y106.377 E.05371
G1 X78.281 Y106.37
G1 X77.33 Y105.418 E.03384
; WIPE_START
M204 S6000
G1 X78.281 Y106.37 E-.51147
G1 X78.834 Y106.377 E-.21015
G1 X78.763 Y106.306 E-.03838
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.395 Y106.299 Z1.24 F42000
G1 X101.921 Y106.284 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0919595
G1 F18000
M204 S6000
G1 X101.754 Y106.368 E.0007
M204 S10000
G1 X77.801 Y106.191 F42000
; LINE_WIDTH: 0.0906309
G1 F18000
M204 S6000
G1 X77.758 Y106.156 E.0002
G3 X77.504 Y105.895 I1.575 J-1.785 E.00134
M204 S10000
G1 X77.537 Y78.083 F42000
; LINE_WIDTH: 0.0894253
G1 F18000
M204 S6000
G2 X77.452 Y78.188 I1.424 J1.226 E.00049
; WIPE_START
G1 X77.537 Y78.083 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.148 Y77.51 Z1.24 F42000
G1 X90.977 Y77.072 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.116234
G1 F18000
M204 S6000
G1 X90.826 Y77.191 E.00103
; WIPE_START
G1 X90.977 Y77.072 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.545 Y78.059 Z1.24 F42000
G1 X102.692 Y78.601 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.29715
G1 F17122.425
M204 S6000
G1 X102.444 Y78.248 E.00738
; LINE_WIDTH: 0.340877
G1 F14679.962
G2 X102.056 Y77.859 I-1.538 J1.144 E.01102
; LINE_WIDTH: 0.297554
G1 F17096.094
G1 X101.969 Y77.798 E.00182
; LINE_WIDTH: 0.271363
G1 F18000
G1 X101.676 Y77.607 E.00541
; WIPE_START
G1 X101.969 Y77.798 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.547 Y79.578 Z1.24 F42000
G1 X81.047 Y82.815 Z1.24
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.161579
G1 F18000
M204 S6000
G1 X80.959 Y82.683 E.00131
; LINE_WIDTH: 0.146107
G1 X80.904 Y82.61 E.00066
; LINE_WIDTH: 0.103349
G1 X80.723 Y82.399 E.00125
G1 X80.578 Y82.27 E.00087
; LINE_WIDTH: 0.126232
G1 X80.505 Y82.216 E.00055
; LINE_WIDTH: 0.156865
G1 X80.419 Y82.155 E.00084
; LINE_WIDTH: 0.18375
G1 X80.317 Y82.095 E.00115
; WIPE_START
G1 X80.419 Y82.155 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.809 Y84.03 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; LINE_WIDTH: 0.186508
G1 F18000
M204 S6000
G1 X79.707 Y83.97 E.00117
; LINE_WIDTH: 0.161945
G1 X79.633 Y83.916 E.00076
; LINE_WIDTH: 0.132393
G1 X79.553 Y83.857 E.00064
; LINE_WIDTH: 0.106466
G1 X79.287 Y83.594 E.00176
; LINE_WIDTH: 0.127622
G1 X79.233 Y83.521 E.00055
; LINE_WIDTH: 0.160768
G1 X79.155 Y83.411 E.0011
; LINE_WIDTH: 0.190863
G1 X79.102 Y83.323 E.00105
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X79.155 Y83.411 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/51
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.24 I.727 J.976 P1  F42000
G1 X88.352 Y76.563 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2493
M204 S6000
G1 X88.361 Y76.582 E.00057
G2 X91.693 Y76.467 I1.638 J-.885 E.11195
G1 X91.889 Y76.51 E.00544
G1 X91.889 Y77.839 E.036
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03605
G1 X88.305 Y76.464 E.0054
G1 X88.326 Y76.509 E.00133
M204 S250
G1 X88.714 Y76.391 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2493
M204 S5000
G1 X88.605 Y76.126 E.00721
G3 X89.82 Y74.25 I1.395 J-.427 E.06399
G1 X89.964 Y74.24 E.00363
G3 X88.744 Y76.442 I.036 J1.459 E.1542
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.126 E-.13137
G1 X88.547 Y75.844 E-.10944
G1 X88.546 Y75.565 E-.10592
G1 X88.596 Y75.3 E-.10231
G1 X88.691 Y75.052 E-.1012
G1 X88.844 Y74.808 E-.10932
G1 X89.025 Y74.615 E-.10044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.354 Y76.746 Z1.4 F42000
G1 X101.49 Y78.24 Z1.4
G1 Z1
G1 E.8 F1800
G1 F2493
M204 S5000
G1 X101.49 Y77.744 E.01247
G1 X101.821 Y77.817 E.00851
G3 X102.51 Y78.694 I-.237 J.896 E.03011
G1 X102.51 Y105.308 E.6691
G3 X102.178 Y106.003 I-.954 J-.029 E.01994
G3 X101.49 Y106.26 I-.88 J-1.307 E.01863
G1 X101.49 Y105.76 E.01258
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.304 I.056 J-.92 E.03459
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03557
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.744 E-.18981
G1 X101.821 Y77.817 E-.1286
G1 X102.068 Y77.919 E-.10172
G1 X102.174 Y77.993 E-.04915
G1 X102.303 Y78.121 E-.06895
G1 X102.403 Y78.272 E-.06894
G1 X102.457 Y78.392 E-.05009
G1 X102.492 Y78.519 E-.05021
G1 X102.506 Y78.657 E-.05253
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.93 Y77.732 Z1.4 F42000
G1 X92.29 Y77.41 Z1.4
G1 Z1
G1 E.8 F1800
G1 F2493
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.663 Y106.588 I-1.294 J.002 E.04945
G1 X78.405 Y106.59 E.58473
M73 P24 R7
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.004 E.05111
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.157 Y73.415 I2.289 J.311 E.08718
G3 X92.282 Y75.41 I-.175 J2.316 E.0792
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2493
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.682 Y77.4 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.161393
G1 F2493
M204 S6000
G1 X90.847 Y77.615 E.00714
M204 S10000
G1 X90.85 Y77.628 F42000
; LINE_WIDTH: 0.276864
G1 F2493
M204 S6000
G1 X91.682 Y77.372 E.01376
; WIPE_START
G1 F18000
G1 X90.85 Y77.628 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.831 Y76.292 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.467045
G1 F2493
M204 S6000
G2 X91.687 Y74.884 I-2.295 J-.478 E.04056
G1 X91.632 Y74.777 E.0034
G2 X88.13 Y75.896 I-1.633 J.927 E.14451
G1 X88.142 Y76.058 E.00459
G1 X88.413 Y76.234 E.00912
; WIPE_START
G1 F10399.61
G1 X88.142 Y76.058 E-.12291
G1 X88.13 Y75.896 E-.06189
G1 X88.131 Y75.491 E-.15393
G1 X88.184 Y75.234 E-.0996
G1 X88.274 Y74.969 E-.10637
G1 X88.415 Y74.698 E-.11628
G1 X88.574 Y74.491 E-.09902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.097 Y77.631 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.399666
G1 F2493
M204 S6000
G1 X88.572 Y77.445 E.01325
; LINE_WIDTH: 0.424859
G1 X88.318 Y77.348 E.00692
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.256322
G1 F2493
M204 S6000
G1 X89.152 Y77.626 E.0126
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.140089
G1 F2493
M204 S6000
G1 X88.318 Y77.407 E.00594
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2493
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z1.4 F42000
G1 X86.21 Y106.174 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2493
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.476 Y100.251 Z1.4 F42000
G1 X79.958 Y82.387 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2493
M204 S5000
G1 X80.053 Y82.375 E.00215
G3 X79.899 Y82.397 I.017 J.688 E.09323
M204 S250
G1 X79.595 Y82.536 F42000
G1 F2493
M204 S5000
G1 X79.6 Y82.532 E.00014
G3 X80.091 Y82.354 I.471 J.532 E.01196
G1 X80.158 Y82.359 E.00152
G3 X79.504 Y82.636 I-.087 J.705 E.08325
G1 X79.555 Y82.581 E.00168
; WIPE_START
G1 F12000
M204 S6000
G1 X79.6 Y82.532 E-.02512
G1 X79.714 Y82.449 E-.05374
G1 X79.844 Y82.391 E-.05384
G1 X80.091 Y82.354 E-.09497
G1 X80.158 Y82.359 E-.02575
G1 X80.296 Y82.391 E-.05383
G1 X80.425 Y82.449 E-.05374
G1 X80.54 Y82.532 E-.05387
G1 X80.637 Y82.635 E-.05384
G1 X80.711 Y82.756 E-.05379
G1 X80.759 Y82.889 E-.05382
G1 X80.78 Y83.029 E-.05374
G1 X80.773 Y83.171 E-.05379
G1 X80.738 Y83.308 E-.05386
G1 X80.713 Y83.361 E-.02233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2493
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2493
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z1.4 F42000
G1 X85.01 Y99.29 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2493
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2493
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/51
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I1.206 J.163 P1  F42000
G1 X88.352 Y76.564 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2500
M204 S6000
G1 X88.361 Y76.582 E.00056
G2 X91.693 Y76.467 I1.637 J-.885 E.11195
G1 X91.889 Y76.51 E.00544
G1 X91.889 Y77.839 E.03601
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
M73 P25 R7
G1 X88.326 Y76.509 E.00135
M204 S250
G1 X88.714 Y76.391 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X88.604 Y76.126 E.00722
G3 X89.82 Y74.25 I1.395 J-.427 E.064
G1 X89.964 Y74.24 E.00363
G3 X88.744 Y76.443 I.036 J1.459 E.15418
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.604 Y76.126 E-.13151
G1 X88.547 Y75.844 E-.10953
G1 X88.546 Y75.565 E-.10594
G1 X88.596 Y75.299 E-.10263
G1 X88.691 Y75.052 E-.10077
G1 X88.844 Y74.808 E-.1093
G1 X89.025 Y74.616 E-.10031
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.354 Y76.746 Z1.56 F42000
G1 X101.49 Y78.24 Z1.56
G1 Z1.16
G1 E.8 F1800
G1 F2500
M204 S5000
G1 X101.49 Y77.744 E.01246
G1 X101.82 Y77.817 E.0085
G3 X102.51 Y78.695 I-.257 J.911 E.03002
G1 X102.51 Y105.304 E.66901
G3 X102.174 Y106.006 I-.978 J-.037 E.02013
G3 X101.49 Y106.26 I-.847 J-1.236 E.01852
G1 X101.49 Y105.76 E.01258
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.353 Y106.209 E.19252
G3 X77.49 Y105.307 I.059 J-.92 E.03446
G1 X77.49 Y78.695 E.66907
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.744 E-.18973
G1 X101.82 Y77.817 E-.12853
G1 X102.066 Y77.918 E-.10084
G1 X102.212 Y78.025 E-.06899
G1 X102.303 Y78.121 E-.05004
G1 X102.379 Y78.228 E-.05013
G1 X102.458 Y78.395 E-.06989
G1 X102.492 Y78.519 E-.0492
G1 X102.506 Y78.657 E-.05264
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.93 Y77.732 Z1.56 F42000
G1 X92.29 Y77.41 Z1.56
G1 Z1.16
G1 E.8 F1800
G1 F2500
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.004 J1.291 E.0512
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.294 J.002 E.04938
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.004 E.05111
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.155 Y73.415 I2.289 J.311 E.08712
G3 X92.282 Y75.41 I-.172 J2.316 E.07926
M73 P26 R7
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z1.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2500
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.682 Y77.399 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.162459
G1 F2500
M204 S6000
G1 X90.847 Y77.615 E.0072
M204 S10000
G1 X90.85 Y77.629 F42000
; LINE_WIDTH: 0.284179
G1 F2500
M204 S6000
G1 X91.682 Y77.37 E.01418
; WIPE_START
G1 F18000
G1 X90.85 Y77.629 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.831 Y76.292 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.467014
G1 F2500
M204 S6000
G2 X91.687 Y74.884 I-2.297 J-.477 E.04056
G1 X91.632 Y74.777 E.00339
G2 X88.13 Y75.896 I-1.634 J.927 E.1445
G1 X88.142 Y76.058 E.00459
G1 X88.413 Y76.234 E.00912
; WIPE_START
G1 F10400.355
G1 X88.142 Y76.058 E-.12291
G1 X88.13 Y75.896 E-.06188
G1 X88.131 Y75.491 E-.15393
G1 X88.184 Y75.234 E-.09957
G1 X88.274 Y74.969 E-.10649
G1 X88.415 Y74.698 E-.11609
G1 X88.574 Y74.491 E-.09912
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.096 Y77.631 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.399427
G1 F2500
M204 S6000
G1 X88.573 Y77.445 E.01322
; LINE_WIDTH: 0.42475
G1 X88.318 Y77.348 E.00692
M204 S10000
G1 X88.318 Y77.375 F42000
; LINE_WIDTH: 0.256024
G1 F2500
M204 S6000
G1 X89.152 Y77.626 E.01258
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.139884
G1 F2500
M204 S6000
G1 X88.318 Y77.407 E.00593
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2500
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z1.56 F42000
G1 X86.21 Y106.174 Z1.56
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2500
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.476 Y100.251 Z1.56 F42000
G1 X79.959 Y82.387 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2500
M204 S5000
G1 X80.053 Y82.375 E.0021
G3 X79.9 Y82.396 I.017 J.688 E.09327
M204 S250
G1 X79.596 Y82.535 F42000
G1 F2500
M204 S5000
G1 X79.601 Y82.533 E.00012
G3 X80.092 Y82.354 I.471 J.532 E.01197
G1 X80.158 Y82.359 E.0015
G3 X79.505 Y82.636 I-.087 J.705 E.08325
G1 X79.556 Y82.58 E.00171
; WIPE_START
G1 F12000
M204 S6000
G1 X79.601 Y82.533 E-.02471
G1 X79.715 Y82.449 E-.05375
G1 X79.843 Y82.391 E-.05372
G1 X80.092 Y82.354 E-.09536
G1 X80.158 Y82.359 E-.02544
G1 X80.297 Y82.391 E-.05381
G1 X80.425 Y82.449 E-.05373
G1 X80.54 Y82.532 E-.05385
G1 X80.637 Y82.635 E-.0538
G1 X80.711 Y82.756 E-.05378
G1 X80.759 Y82.889 E-.05383
G1 X80.78 Y83.029 E-.05377
G1 X80.773 Y83.171 E-.0538
G1 X80.738 Y83.308 E-.05387
G1 X80.712 Y83.362 E-.02278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2500
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z1.56 F42000
G1 X85.01 Y99.29 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2500
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/51
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.56 I1.206 J.165 P1  F42000
G1 X88.383 Y76.615 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2500
M204 S6000
G1 X88.567 Y76.887 E.00891
G2 X91.693 Y76.467 I1.432 J-1.189 E.10198
G1 X91.889 Y76.51 E.00544
G1 X91.889 Y77.839 E.03601
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.352 Y76.563 E.00297
M204 S250
G1 X88.714 Y76.392 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X88.605 Y76.126 E.00724
G3 X89.82 Y74.25 I1.395 J-.427 E.064
G1 X89.964 Y74.24 E.00363
G3 X88.744 Y76.443 I.036 J1.459 E.15418
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.126 E-.13163
G1 X88.547 Y75.844 E-.10948
G1 X88.546 Y75.565 E-.10604
G1 X88.596 Y75.299 E-.10285
G1 X88.691 Y75.052 E-.10025
G1 X88.844 Y74.808 E-.10945
G1 X89.025 Y74.616 E-.1003
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.354 Y76.746 Z1.72 F42000
G1 X101.49 Y78.24 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F2500
M204 S5000
G1 X101.49 Y77.744 E.01246
G1 X101.821 Y77.817 E.00851
G3 X102.51 Y78.695 I-.246 J.903 E.03007
G1 X102.51 Y105.305 E.66901
G3 X102.176 Y106.004 I-.953 J-.025 E.02008
G3 X101.49 Y106.26 I-.878 J-1.31 E.01857
G1 X101.49 Y105.76 E.01258
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.057 J-.92 E.03458
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
M73 P27 R7
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.744 E-.18975
G1 X101.821 Y77.817 E-.12864
G1 X102.066 Y77.918 E-.10094
G1 X102.174 Y77.993 E-.04991
G1 X102.304 Y78.122 E-.06973
G1 X102.379 Y78.228 E-.04929
G1 X102.458 Y78.394 E-.06989
G1 X102.492 Y78.519 E-.04917
G1 X102.506 Y78.657 E-.05268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.93 Y77.732 Z1.72 F42000
G1 X92.29 Y77.41 Z1.72
G1 Z1.32
G1 E.8 F1800
G1 F2500
M204 S5000
G1 X101.595 Y77.41 E.23394
G3 X102.89 Y78.705 I.001 J1.294 E.05116
G1 X102.89 Y105.295 E.6685
G3 X101.666 Y106.588 I-1.299 J-.004 E.04933
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I-.001 J-1.294 E.04938
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.004 E.05111
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.153 Y73.415 I2.289 J.311 E.08706
G3 X92.282 Y75.41 I-.172 J2.318 E.07931
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z1.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2500
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.682 Y77.399 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.163121
G1 F2500
M204 S6000
G1 X90.847 Y77.615 E.00724
M204 S10000
G1 X90.85 Y77.629 F42000
; LINE_WIDTH: 0.284984
G1 F2500
M204 S6000
G1 X91.682 Y77.37 E.01423
; WIPE_START
G1 F17953.511
G1 X90.85 Y77.629 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.831 Y76.292 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.466849
G1 F2500
M204 S6000
G2 X91.687 Y74.884 I-2.295 J-.478 E.04053
G1 X91.632 Y74.778 E.00338
G2 X88.13 Y75.896 I-1.634 J.927 E.14446
G1 X88.142 Y76.058 E.00459
G1 X88.413 Y76.234 E.00912
; WIPE_START
G1 F10404.326
G1 X88.142 Y76.058 E-.12291
G1 X88.13 Y75.896 E-.06183
G1 X88.131 Y75.491 E-.15395
G1 X88.184 Y75.234 E-.0997
G1 X88.274 Y74.969 E-.10641
G1 X88.415 Y74.698 E-.11583
G1 X88.575 Y74.492 E-.09935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.096 Y77.631 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.398921
G1 F2500
M204 S6000
G1 X88.573 Y77.446 E.01318
; LINE_WIDTH: 0.424504
G1 X88.318 Y77.348 E.00694
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.255738
G1 F2500
M204 S6000
G1 X89.152 Y77.626 E.01257
M204 S10000
G1 X89.155 Y77.614 F42000
; LINE_WIDTH: 0.13954
G1 F2500
M204 S6000
G1 X88.318 Y77.406 E.00591
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2500
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z1.72 F42000
G1 X86.21 Y106.174 Z1.72
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2500
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.477 Y100.25 Z1.72 F42000
M73 P28 R7
G1 X79.961 Y82.387 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2500
M204 S5000
G1 X80.053 Y82.375 E.00206
G3 X79.902 Y82.396 I.017 J.688 E.09332
M204 S250
G1 X79.597 Y82.534 F42000
G1 F2500
M204 S5000
G1 X79.601 Y82.533 E.00009
G3 X80.093 Y82.354 I.471 J.532 E.012
G1 X80.158 Y82.359 E.00147
G3 X79.505 Y82.636 I-.086 J.705 E.08325
G1 X79.557 Y82.579 E.00173
; WIPE_START
G1 F12000
M204 S6000
G1 X79.601 Y82.533 E-.02425
G1 X79.714 Y82.449 E-.05372
G1 X79.843 Y82.391 E-.05378
G1 X80.093 Y82.354 E-.09578
G1 X80.158 Y82.359 E-.02498
G1 X80.296 Y82.391 E-.0538
G1 X80.425 Y82.449 E-.05381
G1 X80.54 Y82.531 E-.05379
G1 X80.637 Y82.635 E-.05378
G1 X80.711 Y82.756 E-.05387
G1 X80.759 Y82.889 E-.05378
G1 X80.78 Y83.029 E-.05374
G1 X80.773 Y83.171 E-.05384
G1 X80.738 Y83.308 E-.05382
G1 X80.712 Y83.363 E-.02326
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2500
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z1.72 F42000
G1 X85.01 Y99.29 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2500
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/51
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.72 I1.206 J.163 P1  F42000
G1 X88.353 Y76.565 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2500
M204 S6000
G1 X88.362 Y76.583 E.00055
G2 X91.693 Y76.467 I1.637 J-.885 E.11194
G1 X91.889 Y76.51 E.00544
G1 X91.889 Y77.839 E.03601
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.327 Y76.511 E.00139
M204 S250
G1 X88.715 Y76.392 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X88.605 Y76.126 E.00724
G3 X89.82 Y74.251 I1.395 J-.427 E.064
G1 X89.964 Y74.24 E.00363
M73 P28 R6
G3 X88.745 Y76.443 I.036 J1.459 E.15417
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.126 E-.13166
G1 X88.547 Y75.844 E-.10955
G1 X88.546 Y75.564 E-.10617
G1 X88.596 Y75.298 E-.10303
G1 X88.691 Y75.052 E-.09997
G1 X88.843 Y74.808 E-.10934
G1 X89.024 Y74.616 E-.10027
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.353 Y76.747 Z1.88 F42000
G1 X101.49 Y78.24 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F2500
M204 S5000
G1 X101.49 Y77.743 E.01248
G1 X101.821 Y77.817 E.00852
G3 X102.51 Y78.692 I-.257 J.911 E.02994
G1 X102.51 Y105.305 E.6691
G3 X102.176 Y106.005 I-.953 J-.026 E.02007
G3 X101.49 Y106.26 I-.878 J-1.308 E.01857
G1 X101.49 Y105.76 E.01258
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.057 J-.92 E.03458
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03557
G1 X86.01 Y77.79 E.19146
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.743 E-.18993
G1 X101.821 Y77.817 E-.12875
G1 X102.066 Y77.918 E-.10067
G1 X102.212 Y78.026 E-.06902
G1 X102.303 Y78.121 E-.05006
G1 X102.379 Y78.228 E-.05007
G1 X102.457 Y78.392 E-.06884
G1 X102.5 Y78.565 E-.06789
G1 X102.507 Y78.656 E-.03476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.931 Y77.732 Z1.88 F42000
G1 X92.29 Y77.41 Z1.88
G1 Z1.48
G1 E.8 F1800
G1 F2500
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.297 E.66855
G3 X101.666 Y106.588 I-1.307 J-.014 E.0492
G1 X78.405 Y106.59 E.5848
M73 P29 R6
G3 X77.112 Y105.365 I.004 J-1.299 E.04934
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.004 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.15 Y73.415 I2.289 J.311 E.087
G3 X92.284 Y75.41 I-.171 J2.321 E.07937
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z1.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2500
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.682 Y77.399 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.163394
G1 F2500
M204 S6000
G1 X90.847 Y77.615 E.00725
M204 S10000
G1 X90.85 Y77.63 F42000
; LINE_WIDTH: 0.28544
G1 F2500
M204 S6000
G1 X91.682 Y77.37 E.01426
; WIPE_START
G1 F17920.891
G1 X90.85 Y77.63 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.83 Y76.292 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.466833
G1 F2500
M204 S6000
G2 X91.716 Y74.944 I-2.323 J-.482 E.03869
G2 X88.13 Y75.896 I-1.718 J.759 E.14975
G1 X88.142 Y76.058 E.00459
G1 X88.413 Y76.234 E.00912
; WIPE_START
G1 F10404.698
G1 X88.142 Y76.058 E-.12291
G1 X88.13 Y75.896 E-.06181
G1 X88.131 Y75.491 E-.15398
G1 X88.195 Y75.193 E-.11564
G1 X88.315 Y74.877 E-.12863
G1 X88.507 Y74.566 E-.13889
G1 X88.575 Y74.492 E-.03815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.096 Y77.631 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.398717
G1 F2500
M204 S6000
G1 X88.318 Y77.355 E.01961
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.25555
G1 F2500
M204 S6000
G1 X89.152 Y77.626 E.01255
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.139326
G1 F2500
M204 S6000
G1 X88.318 Y77.407 E.0059
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2500
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z1.88 F42000
G1 X86.21 Y106.174 Z1.88
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2500
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.477 Y100.25 Z1.88 F42000
G1 X79.964 Y82.386 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2500
M204 S5000
G1 X80.053 Y82.375 E.00201
G3 X79.904 Y82.395 I.017 J.689 E.09347
M204 S250
G1 X79.598 Y82.534 F42000
G1 F2500
M204 S5000
G1 X79.601 Y82.533 E.00007
G3 X80.094 Y82.354 I.471 J.532 E.01201
G1 X80.158 Y82.359 E.00145
G3 X79.505 Y82.637 I-.086 J.705 E.08326
G1 X79.558 Y82.578 E.00176
; WIPE_START
G1 F12000
M204 S6000
G1 X79.601 Y82.533 E-.02382
G1 X79.714 Y82.449 E-.05366
G1 X79.844 Y82.391 E-.05388
G1 X80.094 Y82.354 E-.09599
G1 X80.158 Y82.359 E-.02467
G1 X80.297 Y82.391 E-.05384
G1 X80.425 Y82.449 E-.05377
G1 X80.541 Y82.532 E-.05386
G1 X80.637 Y82.635 E-.05374
G1 X80.711 Y82.756 E-.05379
G1 X80.759 Y82.889 E-.05383
G1 X80.78 Y83.029 E-.05378
G1 X80.766 Y83.208 E-.0681
G1 X80.725 Y83.341 E-.05288
G1 X80.712 Y83.365 E-.0104
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2500
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z1.88 F42000
G1 X85.01 Y99.29 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2500
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/51
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.88 I1.206 J.165 P1  F42000
G1 X88.384 Y76.616 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2500
M204 S6000
G1 X88.568 Y76.888 E.0089
G2 X91.693 Y76.467 I1.431 J-1.19 E.10196
G1 X91.889 Y76.51 E.00544
G1 X91.889 Y77.839 E.03601
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.353 Y76.565 E.00301
M204 S250
G1 X88.716 Y76.392 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G3 X89.82 Y74.251 I1.284 J-.693 E.07126
G1 X89.964 Y74.24 E.00363
G3 X88.745 Y76.444 I.036 J1.459 E.15413
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.604 Y76.126 E-.13216
G1 X88.547 Y75.844 E-.10961
G1 X88.546 Y75.564 E-.10624
G1 X88.596 Y75.297 E-.10313
G1 X88.691 Y75.053 E-.09959
G1 X88.843 Y74.809 E-.10937
G1 X89.023 Y74.617 E-.0999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.353 Y76.747 Z2.04 F42000
G1 X101.49 Y78.24 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F2500
M204 S5000
M73 P30 R6
G1 X101.49 Y77.744 E.01245
G1 X101.821 Y77.817 E.00851
G3 X102.51 Y78.691 I-.237 J.896 E.03004
G1 X102.51 Y105.305 E.6691
G3 X102.176 Y106.005 I-.954 J-.026 E.02008
G3 X101.49 Y106.26 I-.875 J-1.303 E.01856
G1 X101.49 Y105.76 E.01258
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.307 I.056 J-.92 E.03452
G1 X77.49 Y78.695 E.66907
G3 X78.395 Y77.79 I.92 J.015 E.03557
G1 X86.01 Y77.79 E.19146
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.744 E-.18953
G1 X101.821 Y77.817 E-.12857
G1 X102.068 Y77.919 E-.10182
G1 X102.174 Y77.993 E-.04904
G1 X102.303 Y78.121 E-.06899
G1 X102.402 Y78.268 E-.06746
G1 X102.456 Y78.39 E-.05049
G1 X102.5 Y78.564 E-.06847
G1 X102.507 Y78.658 E-.03564
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.931 Y77.732 Z2.04 F42000
G1 X92.29 Y77.41 Z2.04
G1 Z1.64
G1 E.8 F1800
G1 F2500
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.294 J.002 E.04939
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.307 J.012 E.05103
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.148 Y73.415 I2.289 J.311 E.08694
G3 X92.282 Y75.41 I-.165 J2.316 E.07943
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z1.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2500
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
M73 P31 R6
G1 E-.04 F1800
M204 S10000
G1 X91.682 Y77.398 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.164136
G1 F2500
M204 S6000
G1 X90.847 Y77.615 E.0073
M204 S10000
G1 X90.85 Y77.629 F42000
; LINE_WIDTH: 0.286225
G1 F2500
M204 S6000
G1 X91.682 Y77.37 E.0143
; WIPE_START
G1 F17865.004
G1 X90.85 Y77.629 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.831 Y76.292 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.46697
G1 F2500
M204 S6000
G2 X91.687 Y74.884 I-2.3 J-.477 E.04055
G1 X91.633 Y74.778 E.00334
G2 X88.13 Y75.896 I-1.634 J.927 E.14449
G1 X88.142 Y76.058 E.00459
G1 X88.413 Y76.234 E.00912
; WIPE_START
G1 F10401.398
G1 X88.142 Y76.058 E-.12294
G1 X88.13 Y75.896 E-.0618
G1 X88.131 Y75.491 E-.15397
G1 X88.184 Y75.234 E-.0997
G1 X88.274 Y74.969 E-.1064
G1 X88.415 Y74.699 E-.11561
G1 X88.575 Y74.491 E-.09958
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.097 Y77.631 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.398577
G1 F2500
M204 S6000
G1 X88.318 Y77.355 E.0196
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.255235
G1 F2500
M204 S6000
G1 X89.153 Y77.626 E.01254
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.139055
G1 F2500
M204 S6000
G1 X88.318 Y77.407 E.00588
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2500
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z2.04 F42000
G1 X86.21 Y106.174 Z2.04
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2500
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.476 Y100.251 Z2.04 F42000
G1 X79.959 Y82.387 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2500
M204 S5000
G1 X80.053 Y82.375 E.00212
G3 X79.9 Y82.396 I.017 J.688 E.09326
M204 S250
G1 X79.598 Y82.533 F42000
G1 F2500
M204 S5000
G1 X79.599 Y82.531 E.00004
G3 X80.054 Y82.354 I.47 J.533 E.01116
G1 X80.09 Y82.354 E.0008
G3 X79.502 Y82.635 I-.021 J.71 E.08477
G1 X79.557 Y82.576 E.00179
; WIPE_START
G1 F12000
M204 S6000
G1 X79.599 Y82.531 E-.02345
G1 X79.714 Y82.449 E-.05384
G1 X79.844 Y82.391 E-.05385
G1 X80.054 Y82.354 E-.08123
G1 X80.09 Y82.354 E-.01358
G1 X80.228 Y82.371 E-.053
G1 X80.362 Y82.417 E-.05376
G1 X80.485 Y82.487 E-.0538
G1 X80.591 Y82.581 E-.05389
G1 X80.677 Y82.694 E-.05379
G1 X80.738 Y82.822 E-.0538
G1 X80.773 Y82.959 E-.05379
G1 X80.78 Y83.1 E-.05378
G1 X80.759 Y83.24 E-.05379
G1 X80.713 Y83.365 E-.05065
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2500
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z2.04 F42000
G1 X85.01 Y99.29 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2500
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/51
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.04 I1.206 J.165 P1  F42000
G1 X88.372 Y76.601 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2509
M204 S6000
G1 X88.457 Y76.741 E.00444
G2 X91.693 Y76.467 I1.541 J-1.043 E.10695
G1 X91.889 Y76.51 E.00543
G1 X91.889 Y77.839 E.03602
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.345 Y76.547 E.00249
M204 S250
G1 X88.715 Y76.393 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X88.716 Y76.392 E.00003
G3 X89.82 Y74.25 I1.284 J-.693 E.07127
G1 X89.964 Y74.24 E.00362
G3 X88.877 Y76.631 I.036 J1.459 E.14838
G1 X88.749 Y76.443 E.00573
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.716 Y76.392 E-.02295
G1 X88.604 Y76.127 E-.10954
G1 X88.547 Y75.844 E-.10962
G1 X88.546 Y75.564 E-.10636
G1 X88.597 Y75.297 E-.10327
G1 X88.691 Y75.053 E-.09932
G1 X88.843 Y74.809 E-.10933
G1 X89.023 Y74.618 E-.09962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.352 Y76.747 Z2.2 F42000
G1 X101.49 Y78.24 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2509
M204 S5000
G1 X101.49 Y77.743 E.01248
G1 X101.821 Y77.817 E.00853
G3 X102.51 Y78.694 I-.248 J.904 E.03004
G1 X102.51 Y105.308 E.66909
G3 X102.176 Y106.005 I-.957 J-.03 E.02001
G3 X101.49 Y106.26 I-.878 J-1.306 E.01857
G1 X101.49 Y105.76 E.01259
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19247
G3 X77.49 Y105.305 I.057 J-.92 E.03457
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03557
G1 X86.01 Y77.79 E.19146
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
M73 P32 R6
G1 F11668.197
M204 S6000
G1 X101.49 Y77.743 E-.19002
G1 X101.821 Y77.817 E-.12886
G1 X102.066 Y77.918 E-.10067
G1 X102.208 Y78.022 E-.06711
G1 X102.301 Y78.119 E-.05078
G1 X102.401 Y78.267 E-.06819
G1 X102.457 Y78.392 E-.05176
G1 X102.492 Y78.519 E-.0502
G1 X102.506 Y78.656 E-.05242
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.93 Y77.732 Z2.2 F42000
G1 X92.29 Y77.41 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F2509
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.296 E.66853
G3 X101.666 Y106.588 I-1.299 J-.005 E.04929
G1 X78.404 Y106.59 E.58484
G3 X77.112 Y105.365 I.005 J-1.299 E.0493
G1 X77.11 Y78.702 E.67034
G3 X78.405 Y77.41 I1.299 J.006 E.05106
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.146 Y73.415 I2.289 J.311 E.08688
G3 X92.282 Y75.41 I-.165 J2.319 E.07948
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2509
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.648 Z2.2 F42000
G1 X90.918 Y77.631 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.43833
G1 F2509
M204 S6000
G1 X91.478 Y77.427 E.01568
G1 X91.68 Y76.964 E.0133
M204 S10000
G1 X91.682 Y77.37 F42000
; LINE_WIDTH: 0.286723
G1 F2509
M204 S6000
G1 X90.85 Y77.63 E.01433
M204 S10000
G1 X90.847 Y77.615 F42000
; LINE_WIDTH: 0.164641
G1 F2509
M204 S6000
G1 X91.682 Y77.399 E.00732
; WIPE_START
G1 F18000
G1 X90.847 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.831 Y76.292 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.466834
G1 F2509
M204 S6000
G2 X91.687 Y74.884 I-2.295 J-.478 E.04052
G1 X91.633 Y74.779 E.00335
G2 X88.13 Y75.896 I-1.634 J.926 E.14448
G1 X88.142 Y76.058 E.00458
G1 X88.413 Y76.234 E.00912
; WIPE_START
G1 F10404.69
G1 X88.142 Y76.058 E-.12293
G1 X88.13 Y75.896 E-.06176
G1 X88.131 Y75.491 E-.15401
G1 X88.184 Y75.234 E-.09973
G1 X88.274 Y74.968 E-.10642
G1 X88.414 Y74.699 E-.11537
G1 X88.574 Y74.491 E-.09978
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.097 Y77.631 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.398133
G1 F2509
M204 S6000
G1 X88.318 Y77.355 E.01958
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.254961
G1 F2509
M204 S6000
G1 X89.153 Y77.626 E.01252
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.138752
G1 F2509
M204 S6000
G1 X88.318 Y77.407 E.00587
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2509
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z2.2 F42000
G1 X86.21 Y106.174 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2509
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.478 Y100.249 Z2.2 F42000
G1 X79.968 Y82.386 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2509
M204 S5000
G1 X80.053 Y82.375 E.00192
G3 X79.908 Y82.394 I.017 J.688 E.09352
M204 S250
G1 X79.599 Y82.531 F42000
G1 F2509
M204 S5000
G3 X80.054 Y82.354 I.469 J.531 E.01115
G1 X80.091 Y82.354 E.00082
G3 X79.556 Y82.573 I-.023 J.708 E.08624
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.449 E-.07642
M73 P33 R6
G1 X79.844 Y82.391 E-.05386
G1 X80.054 Y82.354 E-.08117
G1 X80.091 Y82.354 E-.01398
G1 X80.228 Y82.371 E-.05269
G1 X80.362 Y82.417 E-.05373
G1 X80.485 Y82.487 E-.05384
G1 X80.591 Y82.581 E-.05378
G1 X80.677 Y82.694 E-.05378
G1 X80.738 Y82.821 E-.05379
G1 X80.773 Y82.959 E-.05382
G1 X80.78 Y83.1 E-.05375
G1 X80.759 Y83.24 E-.05386
G1 X80.713 Y83.367 E-.05153
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2509
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z2.2 F42000
G1 X85.01 Y99.29 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2509
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/51
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I1.206 J.165 P1  F42000
G1 X88.373 Y76.601 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2509
M204 S6000
G1 X88.457 Y76.741 E.00442
G2 X91.693 Y76.467 I1.541 J-1.043 E.10696
G1 X91.889 Y76.51 E.00543
G1 X91.889 Y77.839 E.03602
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.345 Y76.548 E.00251
M204 S250
G1 X88.715 Y76.394 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X88.716 Y76.392 E.00004
G3 X89.82 Y74.251 I1.284 J-.693 E.07125
G1 X89.964 Y74.24 E.00363
G3 X88.877 Y76.631 I.036 J1.459 E.14838
G1 X88.749 Y76.443 E.00572
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.716 Y76.392 E-.02311
G1 X88.604 Y76.127 E-.1095
G1 X88.547 Y75.844 E-.10973
G1 X88.546 Y75.564 E-.10646
G1 X88.597 Y75.296 E-.1036
G1 X88.691 Y75.053 E-.0988
G1 X88.843 Y74.809 E-.10927
G1 X89.022 Y74.618 E-.09953
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.352 Y76.747 Z2.36 F42000
G1 X101.49 Y78.24 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F2509
M204 S5000
G1 X101.49 Y77.743 E.01248
G1 X101.821 Y77.817 E.00852
G3 X102.51 Y78.692 I-.246 J.903 E.03
G1 X102.51 Y105.305 E.66908
G3 X102.174 Y106.006 I-.954 J-.026 E.02014
G3 X101.49 Y106.26 I-.85 J-1.239 E.01853
G1 X101.49 Y105.76 E.01259
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.057 J-.92 E.03458
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.743 E-.18999
G1 X101.821 Y77.817 E-.12878
G1 X102.063 Y77.916 E-.09957
G1 X102.174 Y77.993 E-.05112
G1 X102.304 Y78.123 E-.07003
G1 X102.379 Y78.228 E-.0491
G1 X102.457 Y78.392 E-.06895
G1 X102.501 Y78.568 E-.06898
G1 X102.507 Y78.656 E-.03348
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.931 Y77.732 Z2.36 F42000
G1 X92.29 Y77.41 Z2.36
G1 Z1.96
G1 E.8 F1800
G1 F2509
M204 S5000
G1 X101.595 Y77.41 E.23394
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.296 E.66854
G3 X101.666 Y106.588 I-1.299 J-.006 E.04928
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.006 J-1.301 E.04931
G1 X77.11 Y78.705 E.67028
M73 P34 R6
G3 X78.405 Y77.41 I1.299 J.004 E.05111
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.143 Y73.415 I2.289 J.311 E.08682
G3 X92.282 Y75.41 I-.16 J2.316 E.07956
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2509
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.648 Z2.36 F42000
G1 X90.916 Y77.631 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.438285
G1 F2509
M204 S6000
G1 X91.478 Y77.427 E.01573
G1 X91.68 Y76.965 E.0133
M204 S10000
G1 X91.682 Y77.37 F42000
; LINE_WIDTH: 0.287349
G1 F2509
M204 S6000
G1 X90.85 Y77.63 E.01436
M204 S10000
G1 X90.847 Y77.615 F42000
; LINE_WIDTH: 0.164981
G1 F2509
M204 S6000
G1 X91.682 Y77.399 E.00734
; WIPE_START
G1 F18000
G1 X90.847 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.831 Y76.292 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.466789
G1 F2509
M204 S6000
G2 X91.716 Y74.945 I-2.332 J-.479 E.03863
G2 X88.13 Y75.896 I-1.718 J.758 E.14976
G1 X88.142 Y76.058 E.00458
G1 X88.413 Y76.234 E.00912
; WIPE_START
G1 F10405.76
G1 X88.142 Y76.058 E-.12292
G1 X88.13 Y75.896 E-.06176
G1 X88.131 Y75.491 E-.154
G1 X88.184 Y75.234 E-.09963
G1 X88.312 Y74.883 E-.14177
G1 X88.452 Y74.644 E-.10545
G1 X88.574 Y74.491 E-.07447
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.097 Y77.631 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.397781
G1 F2509
M204 S6000
G1 X88.318 Y77.355 E.01958
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.254673
G1 F2509
M204 S6000
G1 X89.153 Y77.626 E.01251
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.138705
G1 F2509
M204 S6000
G1 X88.318 Y77.407 E.00586
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2509
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z2.36 F42000
G1 X86.21 Y106.174 Z2.36
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.462503
G1 F2509
M204 S6000
G1 X101.29 Y106.174 E.4209
; WIPE_START
G1 F10509.927
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.481 Y100.247 Z2.36 F42000
G1 X79.986 Y82.381 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2509
M204 S5000
G1 X80.058 Y82.375 E.00161
G3 X79.927 Y82.391 I.015 J.688 E.09384
M204 S250
G1 X79.599 Y82.531 F42000
G1 F2509
M204 S5000
G3 X80.054 Y82.354 I.469 J.532 E.01115
G1 X80.092 Y82.354 E.00085
G3 X79.556 Y82.572 I-.024 J.709 E.08637
; WIPE_START
G1 F12000
M204 S6000
G1 X79.715 Y82.449 E-.07644
G1 X79.844 Y82.391 E-.05386
G1 X80.054 Y82.354 E-.0811
G1 X80.092 Y82.354 E-.0144
G1 X80.228 Y82.371 E-.05224
G1 X80.363 Y82.417 E-.05389
G1 X80.485 Y82.487 E-.05372
G1 X80.591 Y82.581 E-.05378
G1 X80.677 Y82.694 E-.05388
G1 X80.738 Y82.821 E-.05375
G1 X80.773 Y82.959 E-.05387
G1 X80.78 Y83.098 E-.0528
G1 X80.725 Y83.341 E-.09474
G1 X80.711 Y83.367 E-.01155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2509
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z2.36 F42000
G1 X85.01 Y99.29 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2509
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/51
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.36 I1.206 J.166 P1  F42000
G1 X88.385 Y76.617 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2508
M204 S6000
G1 X88.568 Y76.888 E.00886
G2 X91.694 Y76.467 I1.431 J-1.19 E.10195
G1 X91.889 Y76.51 E.00543
G1 X91.889 Y77.839 E.03602
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.354 Y76.566 E.00306
M204 S250
G1 X88.716 Y76.394 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2508
M204 S5000
G1 X88.716 Y76.392 E.00004
G3 X89.82 Y74.251 I1.284 J-.694 E.07127
G1 X89.964 Y74.24 E.00363
G3 X88.877 Y76.631 I.036 J1.459 E.14836
G1 X88.749 Y76.444 E.00571
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.716 Y76.392 E-.02325
G1 X88.604 Y76.127 E-.1096
G1 X88.547 Y75.844 E-.10972
G1 X88.546 Y75.563 E-.10657
G1 X88.597 Y75.295 E-.10369
G1 X88.691 Y75.053 E-.09852
G1 X88.843 Y74.809 E-.10959
G1 X89.022 Y74.619 E-.09907
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.351 Y76.747 Z2.52 F42000
G1 X101.49 Y78.24 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F2508
M204 S5000
G1 X101.49 Y77.744 E.01246
G1 X101.821 Y77.817 E.00852
G3 X102.51 Y78.692 I-.26 J.913 E.02992
G1 X102.51 Y105.305 E.66909
G3 X102.176 Y106.005 I-.973 J-.035 E.02006
G3 X101.49 Y106.26 I-.876 J-1.302 E.01857
M73 P35 R6
G1 X101.49 Y105.76 E.01259
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.057 J-.92 E.03458
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.744 E-.18973
G1 X101.821 Y77.817 E-.12872
G1 X102.066 Y77.918 E-.10076
G1 X102.207 Y78.021 E-.06646
G1 X102.303 Y78.12 E-.05233
G1 X102.379 Y78.228 E-.05028
G1 X102.457 Y78.392 E-.06896
G1 X102.5 Y78.562 E-.06643
G1 X102.507 Y78.657 E-.03633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.931 Y77.732 Z2.52 F42000
G1 X92.29 Y77.41 Z2.52
G1 Z2.12
G1 E.8 F1800
G1 F2508
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.299 J-.004 E.04934
G1 X78.405 Y106.59 E.58479
G3 X77.112 Y105.365 I.004 J-1.299 E.04934
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.004 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.141 Y73.415 I2.289 J.311 E.08676
G3 X92.282 Y75.41 I-.161 J2.319 E.07959
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z2.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2508
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.648 Z2.52 F42000
G1 X90.919 Y77.631 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.43868
G1 F2508
M204 S6000
G1 X91.478 Y77.427 E.01568
G1 X91.679 Y76.964 E.01331
M204 S10000
G1 X91.682 Y77.37 F42000
; LINE_WIDTH: 0.288018
G1 F2508
M204 S6000
G1 X90.85 Y77.629 E.0144
M204 S10000
G1 X90.847 Y77.615 F42000
; LINE_WIDTH: 0.165576
G1 F2508
M204 S6000
G1 X91.682 Y77.399 E.00738
; WIPE_START
G1 F18000
G1 X90.847 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.833 Y76.292 Z2.52 F42000
M73 P36 R6
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.466818
G1 F2508
M204 S6000
G1 X91.875 Y75.687 E.01711
G1 X91.869 Y75.491 E.00552
G1 X91.831 Y75.298 E.00555
G2 X88.13 Y75.896 I-1.833 J.405 E.16027
G1 X88.142 Y76.058 E.00458
G1 X88.413 Y76.234 E.00912
; WIPE_START
G1 F10405.076
G1 X88.142 Y76.058 E-.12292
G1 X88.13 Y75.896 E-.06173
G1 X88.131 Y75.491 E-.15402
G1 X88.201 Y75.171 E-.12458
G1 X88.324 Y74.86 E-.12682
G1 X88.522 Y74.546 E-.1413
G1 X88.574 Y74.491 E-.02863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.098 Y77.631 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.397346
G1 F2508
M204 S6000
G1 X88.318 Y77.355 E.01956
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.25437
G1 F2508
M204 S6000
G1 X89.153 Y77.626 E.01249
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.138421
G1 F2508
M204 S6000
G1 X88.318 Y77.407 E.00585
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2508
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z2.52 F42000
G1 X86.21 Y106.174 Z2.52
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.462503
G1 F2508
M204 S6000
G1 X101.29 Y106.174 E.4209
; WIPE_START
G1 F10509.927
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.484 Y100.244 Z2.52 F42000
G1 X80.005 Y82.381 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2508
M204 S5000
G1 X80.053 Y82.375 E.00108
G3 X79.917 Y82.392 I.017 J.689 E.09383
G1 X79.945 Y82.389 E.00065
M204 S250
G1 X79.602 Y82.53 F42000
G1 F2508
M204 S5000
G1 X79.714 Y82.448 E.00311
G3 X80.054 Y82.354 I.354 J.615 E.00798
G1 X80.092 Y82.354 E.00086
G3 X79.557 Y82.57 I-.025 J.709 E.08641
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.07547
G1 X79.844 Y82.391 E-.05386
G1 X80.054 Y82.354 E-.08113
G1 X80.092 Y82.354 E-.01466
G1 X80.228 Y82.371 E-.05204
G1 X80.362 Y82.417 E-.05375
G1 X80.485 Y82.487 E-.0538
G1 X80.591 Y82.581 E-.05379
G1 X80.677 Y82.694 E-.05379
G1 X80.738 Y82.821 E-.05381
G1 X80.773 Y82.959 E-.05383
G1 X80.78 Y83.097 E-.05282
G1 X80.725 Y83.341 E-.09472
G1 X80.709 Y83.37 E-.01253
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2508
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2508
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z2.52 F42000
G1 X85.01 Y99.29 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2508
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2508
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/51
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.52 I1.206 J.165 P1  F42000
G1 X88.373 Y76.602 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2509
M204 S6000
G1 X88.458 Y76.741 E.00441
G2 X91.694 Y76.467 I1.541 J-1.044 E.10694
G1 X91.889 Y76.51 E.00543
G1 X91.889 Y77.839 E.03602
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.345 Y76.549 E.00255
M204 S250
G1 X88.716 Y76.395 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X88.716 Y76.392 E.00005
G3 X89.82 Y74.251 I1.284 J-.694 E.07126
G1 X89.964 Y74.24 E.00363
G3 X88.878 Y76.632 I.036 J1.459 E.14836
G1 X88.75 Y76.444 E.00571
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.716 Y76.392 E-.02344
G1 X88.604 Y76.127 E-.10961
G1 X88.547 Y75.844 E-.1097
G1 X88.546 Y75.563 E-.10667
G1 X88.597 Y75.295 E-.10385
G1 X88.69 Y75.054 E-.09805
G1 X88.843 Y74.809 E-.10969
G1 X89.021 Y74.619 E-.09899
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.351 Y76.747 Z2.68 F42000
G1 X101.49 Y78.24 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F2509
M204 S5000
G1 X101.49 Y77.733 E.01273
G1 X101.901 Y77.84 E.01067
G3 X102.51 Y78.691 I-.306 J.863 E.02802
G1 X102.51 Y105.305 E.66909
G3 X102.176 Y106.005 I-.954 J-.025 E.02009
G3 X101.49 Y106.261 I-.877 J-1.303 E.01857
G1 X101.49 Y105.76 E.01259
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.353 Y106.209 E.19252
G3 X77.49 Y105.305 I.059 J-.92 E.03452
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.733 E-.19382
M73 P37 R6
G1 X101.901 Y77.84 E-.16126
G1 X102.14 Y77.967 E-.10313
G1 X102.356 Y78.193 E-.11848
G1 X102.456 Y78.389 E-.08376
G1 X102.5 Y78.561 E-.06739
G1 X102.506 Y78.645 E-.03215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.929 Y77.729 Z2.68 F42000
G1 X92.29 Y77.41 Z2.68
G1 Z2.28
G1 E.8 F1800
G1 F2509
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.003 J1.292 E.05119
G1 X102.89 Y105.294 E.66849
G3 X101.664 Y106.588 I-1.307 J-.011 E.04931
G1 X78.405 Y106.59 E.58474
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.301 J.005 E.0511
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.139 Y73.414 I2.289 J.311 E.0867
G3 X92.282 Y75.41 I-.155 J2.316 E.07967
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z2.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2509
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.648 Z2.68 F42000
G1 X90.912 Y77.631 Z2.68
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.438224
G1 F2509
M204 S6000
G1 X91.478 Y77.427 E.01584
G1 X91.682 Y76.965 E.0133
M204 S10000
G1 X91.682 Y77.369 F42000
; LINE_WIDTH: 0.288802
G1 F2509
M204 S6000
G1 X90.851 Y77.63 E.01445
M204 S10000
G1 X90.847 Y77.615 F42000
; LINE_WIDTH: 0.166025
G1 F2509
M204 S6000
G1 X91.682 Y77.399 E.0074
; WIPE_START
G1 F18000
G1 X90.847 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.582 Y76.237 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.467243
G1 F2509
M204 S6000
G1 X91.858 Y76.06 E.00925
G1 X91.87 Y75.502 E.01576
G1 X91.831 Y75.299 E.00584
G2 X88.13 Y75.896 I-1.834 J.405 E.1604
G1 X88.142 Y76.058 E.00458
G1 X88.413 Y76.234 E.00913
; WIPE_START
G1 F10394.839
G1 X88.142 Y76.058 E-.12292
G1 X88.13 Y75.896 E-.0617
G1 X88.131 Y75.491 E-.15405
G1 X88.202 Y75.17 E-.12486
G1 X88.323 Y74.861 E-.12626
G1 X88.523 Y74.546 E-.14148
G1 X88.575 Y74.491 E-.02873
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.097 Y77.631 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.397027
G1 F2509
M204 S6000
G1 X88.318 Y77.355 E.01954
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.253936
G1 F2509
M204 S6000
G1 X89.153 Y77.625 E.01246
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.138221
G1 F2509
M204 S6000
G1 X88.318 Y77.407 E.00584
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2509
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z2.68 F42000
G1 X86.21 Y106.174 Z2.68
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2509
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.484 Y100.244 Z2.68 F42000
G1 X80.007 Y82.381 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2509
M204 S5000
G1 X80.053 Y82.375 E.00103
G3 X79.917 Y82.392 I.017 J.688 E.09365
G1 X79.948 Y82.388 E.0007
M204 S250
G1 X79.603 Y82.529 F42000
G1 F2509
M204 S5000
G1 X79.714 Y82.448 E.00308
G3 X80.054 Y82.354 I.354 J.616 E.00797
G1 X80.094 Y82.354 E.00089
G3 X79.558 Y82.569 I-.026 J.71 E.08661
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.07493
G1 X79.843 Y82.391 E-.05375
G1 X80.054 Y82.354 E-.08115
G1 X80.094 Y82.354 E-.01508
G1 X80.228 Y82.371 E-.05166
G1 X80.362 Y82.417 E-.05378
G1 X80.485 Y82.487 E-.05376
G1 X80.591 Y82.581 E-.05383
G1 X80.677 Y82.694 E-.05381
G1 X80.738 Y82.821 E-.05378
G1 X80.773 Y82.959 E-.05385
G1 X80.78 Y83.1 E-.05376
G1 X80.759 Y83.24 E-.05383
G1 X80.711 Y83.371 E-.05302
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2509
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z2.68 F42000
G1 X85.01 Y99.29 Z2.68
G1 Z2.28
M73 P38 R6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2509
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/51
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.68 I1.206 J.165 P1  F42000
G1 X88.373 Y76.603 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2509
M204 S6000
G1 X88.458 Y76.741 E.00439
G2 X91.694 Y76.466 I1.541 J-1.044 E.10694
G1 X91.889 Y76.51 E.00543
G1 X91.889 Y77.839 E.03602
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.346 Y76.55 E.00256
M204 S250
G1 X88.716 Y76.395 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X88.716 Y76.393 E.00006
G3 X89.82 Y74.251 I1.284 J-.694 E.07127
G1 X89.964 Y74.24 E.00364
G3 X88.878 Y76.632 I.036 J1.459 E.14836
G1 X88.75 Y76.445 E.00569
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.716 Y76.393 E-.02356
G1 X88.604 Y76.127 E-.1096
G1 X88.547 Y75.844 E-.10982
G1 X88.546 Y75.563 E-.10677
G1 X88.597 Y75.294 E-.10414
G1 X88.69 Y75.054 E-.0975
G1 X88.842 Y74.81 E-.10947
G1 X89.021 Y74.62 E-.09915
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.351 Y76.748 Z2.84 F42000
G1 X101.49 Y78.24 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F2509
M204 S5000
G1 X101.49 Y77.733 E.01274
G1 X101.901 Y77.84 E.01068
G3 X102.51 Y78.691 I-.306 J.863 E.02801
G1 X102.51 Y105.305 E.66909
G3 X102.176 Y106.005 I-.954 J-.025 E.02009
G3 X101.49 Y106.261 I-.879 J-1.306 E.01857
G1 X101.49 Y105.76 E.01261
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.056 J-.92 E.03459
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
M73 P38 R5
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.733 E-.19396
G1 X101.901 Y77.84 E-.16136
G1 X102.141 Y77.967 E-.10313
G1 X102.356 Y78.193 E-.11847
G1 X102.456 Y78.389 E-.08372
G1 X102.499 Y78.56 E-.06707
G1 X102.506 Y78.645 E-.0323
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.929 Y77.729 Z2.84 F42000
G1 X92.29 Y77.41 Z2.84
G1 Z2.44
G1 E.8 F1800
G1 F2509
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.307 J-.011 E.04926
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.306 J.011 E.05104
G1 X87.71 Y77.41 E.23393
M73 P39 R5
G1 X87.718 Y75.41 E.05028
G3 X90.136 Y73.414 I2.289 J.311 E.08664
G3 X92.282 Y75.41 I-.152 J2.316 E.07974
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z2.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2509
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.648 Z2.84 F42000
G1 X90.916 Y77.631 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.438703
G1 F2509
M204 S6000
G1 X91.478 Y77.427 E.01575
G1 X91.682 Y76.966 E.01328
M204 S10000
G1 X91.682 Y77.37 F42000
; LINE_WIDTH: 0.289417
G1 F2509
M204 S6000
G1 X90.851 Y77.63 E.01448
M204 S10000
G1 X90.847 Y77.615 F42000
; LINE_WIDTH: 0.166507
G1 F2509
M204 S6000
G1 X91.682 Y77.398 E.00743
; WIPE_START
G1 F18000
G1 X90.847 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.577 Y76.236 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.467171
G1 F2509
M204 S6000
G1 X91.858 Y76.06 E.00934
G1 X91.87 Y75.502 E.01574
G1 X91.831 Y75.299 E.00584
G2 X88.13 Y75.896 I-1.834 J.404 E.16043
G1 X88.142 Y76.058 E.00458
G1 X88.413 Y76.234 E.00913
; WIPE_START
G1 F10396.568
G1 X88.142 Y76.058 E-.12292
G1 X88.13 Y75.896 E-.06171
G1 X88.131 Y75.491 E-.15403
G1 X88.202 Y75.169 E-.12539
G1 X88.323 Y74.861 E-.12555
G1 X88.52 Y74.549 E-.1403
G1 X88.574 Y74.491 E-.03011
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.097 Y77.631 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.39689
G1 F2509
M204 S6000
G1 X88.318 Y77.355 E.01952
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.253968
G1 F2509
M204 S6000
G1 X89.153 Y77.626 E.01247
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.137914
G1 F2509
M204 S6000
G1 X88.318 Y77.407 E.00582
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2509
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z2.84 F42000
G1 X86.21 Y106.174 Z2.84
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2509
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.484 Y100.244 Z2.84 F42000
G1 X80.009 Y82.381 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2509
M204 S5000
G1 X80.053 Y82.375 E.00098
G3 X79.917 Y82.392 I.017 J.688 E.09365
G1 X79.95 Y82.388 E.00075
M204 S250
G1 X79.604 Y82.528 F42000
G1 F2509
M204 S5000
G1 X79.714 Y82.448 E.00305
G3 X80.054 Y82.354 I.353 J.616 E.00797
G1 X80.095 Y82.354 E.00091
G3 X79.559 Y82.567 I-.027 J.71 E.08662
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.07431
G1 X79.844 Y82.391 E-.05386
G1 X80.054 Y82.354 E-.08108
G1 X80.095 Y82.354 E-.01552
G1 X80.228 Y82.371 E-.05124
G1 X80.363 Y82.417 E-.05381
G1 X80.485 Y82.487 E-.05377
G1 X80.591 Y82.581 E-.05382
G1 X80.677 Y82.694 E-.05382
G1 X80.738 Y82.822 E-.0538
G1 X80.773 Y82.959 E-.05384
G1 X80.78 Y83.1 E-.05375
G1 X80.759 Y83.24 E-.05373
G1 X80.711 Y83.373 E-.05367
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2509
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z2.84 F42000
G1 X85.01 Y99.29 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2509
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2509
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/51
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.84 I1.206 J.166 P1  F42000
G1 X88.386 Y76.619 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2506
M204 S6000
G1 X88.568 Y76.889 E.00883
G2 X91.694 Y76.466 I1.43 J-1.191 E.10195
G1 X91.889 Y76.509 E.00543
G1 X91.889 Y77.839 E.03603
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.354 Y76.568 E.00311
M204 S250
G1 X88.717 Y76.396 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X88.716 Y76.393 E.00007
G3 X89.82 Y74.251 I1.284 J-.694 E.07127
G1 X89.964 Y74.24 E.00364
G3 X88.878 Y76.632 I.036 J1.459 E.14836
G1 X88.75 Y76.445 E.00568
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.716 Y76.393 E-.0237
G1 X88.604 Y76.127 E-.10967
G1 X88.547 Y75.844 E-.10979
G1 X88.546 Y75.563 E-.10687
G1 X88.598 Y75.293 E-.10422
G1 X88.69 Y75.054 E-.09726
G1 X88.842 Y74.81 E-.10939
G1 X89.021 Y74.62 E-.0991
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.35 Y76.748 Z3 F42000
G1 X101.49 Y78.24 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.49 Y77.732 E.01276
G1 X101.901 Y77.84 E.01069
G3 X102.51 Y78.691 I-.306 J.862 E.028
G1 X102.51 Y105.305 E.6691
G3 X102.175 Y106.005 I-.954 J-.026 E.02008
G3 X101.49 Y106.261 I-.88 J-1.308 E.01857
G1 X101.49 Y105.76 E.01262
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
M73 P40 R5
G3 X77.49 Y105.305 I.057 J-.92 E.03458
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03557
G1 X86.01 Y77.79 E.19146
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.732 E-.19419
G1 X101.901 Y77.84 E-.1616
G1 X102.141 Y77.967 E-.10293
G1 X102.356 Y78.193 E-.11848
G1 X102.456 Y78.389 E-.0838
G1 X102.499 Y78.559 E-.06667
G1 X102.506 Y78.644 E-.03233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.929 Y77.728 Z3 F42000
G1 X92.29 Y77.41 Z3
G1 Z2.6
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.307 J-.011 E.04926
G1 X78.405 Y106.59 E.58479
G3 X77.112 Y105.365 I.011 J-1.307 E.04926
G1 X77.11 Y78.705 E.67027
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.134 Y73.414 I2.289 J.311 E.08658
G3 X92.282 Y75.41 I-.154 J2.32 E.07977
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.648 Z3 F42000
G1 X90.907 Y77.631 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.43818
G1 F2506
M204 S6000
G1 X91.478 Y77.427 E.01595
G1 X91.682 Y76.966 E.01327
M204 S10000
G1 X91.682 Y77.369 F42000
; LINE_WIDTH: 0.289753
G1 F2506
M204 S6000
G1 X90.851 Y77.63 E.0145
M204 S10000
G1 X90.847 Y77.615 F42000
; LINE_WIDTH: 0.166856
G1 F2506
M204 S6000
G1 X91.682 Y77.398 E.00745
; WIPE_START
G1 F18000
G1 X90.847 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.579 Y76.236 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.466971
G1 F2506
M204 S6000
G1 X91.858 Y76.06 E.0093
G1 X91.87 Y75.503 E.01571
G1 X91.832 Y75.299 E.00584
G2 X88.13 Y75.896 I-1.834 J.404 E.16032
G1 X88.145 Y76.06 E.00465
; LINE_WIDTH: 0.469972
G1 X88.413 Y76.234 E.00908
; WIPE_START
G1 F10329.729
G1 X88.145 Y76.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.097 Y77.631 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.396616
G1 F2506
M204 S6000
M73 P41 R5
G1 X88.318 Y77.355 E.01951
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.253786
G1 F2506
M204 S6000
G1 X89.153 Y77.626 E.01246
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.137704
G1 F2506
M204 S6000
G1 X88.318 Y77.408 E.00581
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z3 F42000
G1 X86.21 Y106.174 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.462503
G1 F2506
M204 S6000
G1 X101.29 Y106.174 E.4209
; WIPE_START
G1 F10509.927
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.485 Y100.244 Z3 F42000
G1 X80.011 Y82.38 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2506
M204 S5000
G1 X80.053 Y82.375 E.00093
G3 X79.916 Y82.392 I.017 J.688 E.09364
G1 X79.952 Y82.388 E.0008
M204 S250
G1 X79.599 Y82.53 F42000
G1 F2506
M204 S5000
G3 X80.054 Y82.354 I.469 J.534 E.01115
G1 X80.095 Y82.354 E.00094
G3 X79.555 Y82.572 I-.028 J.71 E.08647
; WIPE_START
G1 F12000
M204 S6000
G1 X79.715 Y82.449 E-.07648
G1 X79.844 Y82.391 E-.05377
G1 X80.054 Y82.354 E-.08107
G1 X80.095 Y82.354 E-.01588
G1 X80.228 Y82.371 E-.05086
G1 X80.362 Y82.417 E-.05378
G1 X80.485 Y82.487 E-.0538
G1 X80.591 Y82.581 E-.05382
G1 X80.677 Y82.694 E-.05384
G1 X80.738 Y82.821 E-.0538
G1 X80.773 Y82.959 E-.05382
G1 X80.78 Y83.1 E-.05379
G1 X80.759 Y83.24 E-.05369
G1 X80.713 Y83.367 E-.0516
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z3 F42000
G1 X85.01 Y99.29 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/51
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I1.206 J.166 P1  F42000
G1 X88.386 Y76.619 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2506
M204 S6000
G1 X88.569 Y76.889 E.00882
G2 X91.694 Y76.466 I1.43 J-1.191 E.10194
G1 X91.889 Y76.509 E.00543
G1 X91.889 Y77.839 E.03603
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.355 Y76.568 E.00313
M204 S250
G1 X88.717 Y76.396 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X88.716 Y76.393 E.00008
G3 X89.82 Y74.251 I1.284 J-.694 E.07127
G1 X89.964 Y74.24 E.00364
G3 X88.878 Y76.632 I.036 J1.459 E.14835
G1 X88.751 Y76.445 E.00568
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.716 Y76.393 E-.02384
G1 X88.604 Y76.127 E-.10968
G1 X88.547 Y75.844 E-.10977
G1 X88.546 Y75.562 E-.10701
G1 X88.598 Y75.292 E-.10447
G1 X88.69 Y75.055 E-.09676
G1 X88.842 Y74.81 E-.10951
G1 X89.02 Y74.62 E-.09895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.35 Y76.748 Z3.16 F42000
G1 X101.49 Y78.24 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.49 Y77.733 E.01274
G1 X101.901 Y77.84 E.01068
G3 X102.51 Y78.694 I-.306 J.862 E.02808
G1 X102.51 Y105.305 E.66903
G3 X102.175 Y106.005 I-.977 J-.037 E.02005
G3 X101.49 Y106.261 I-.877 J-1.302 E.01857
G1 X101.49 Y105.76 E.0126
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.056 J-.92 E.03459
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03557
G1 X86.01 Y77.79 E.19146
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.733 E-.19391
G1 X101.901 Y77.84 E-.16136
G1 X102.141 Y77.967 E-.10304
G1 X102.356 Y78.193 E-.11847
G1 X102.457 Y78.392 E-.08475
G1 X102.492 Y78.519 E-.05028
G1 X102.505 Y78.645 E-.04819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.928 Y77.729 Z3.16 F42000
G1 X92.29 Y77.41 Z3.16
G1 Z2.76
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.004 J1.291 E.0512
G1 X102.89 Y105.294 E.66849
M73 P42 R5
G3 X101.666 Y106.588 I-1.302 J-.006 E.04931
G1 X78.405 Y106.59 E.58479
G3 X77.112 Y105.365 I-.002 J-1.294 E.04939
G1 X77.11 Y78.705 E.67027
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.134 Y73.414 I2.295 J.319 E.08652
G3 X92.283 Y75.41 I-.145 J2.31 E.07983
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z2.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.648 Z3.16 F42000
G1 X90.907 Y77.631 Z3.16
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.438205
G1 F2506
M204 S6000
G1 X91.478 Y77.427 E.01595
G1 X91.682 Y76.968 E.01322
M204 S10000
G1 X91.682 Y77.369 F42000
; LINE_WIDTH: 0.290423
G1 F2506
M204 S6000
G1 X90.851 Y77.63 E.01454
M204 S10000
G1 X90.847 Y77.615 F42000
; LINE_WIDTH: 0.1674
G1 F2506
M204 S6000
G1 X91.682 Y77.398 E.00748
; WIPE_START
G1 F18000
G1 X90.847 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.579 Y76.235 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.466898
G1 F2506
M204 S6000
G1 X91.858 Y76.06 E.00931
G1 X91.87 Y75.504 E.01569
G1 X91.832 Y75.3 E.00584
G2 X88.13 Y75.896 I-1.834 J.403 E.16037
G1 X88.145 Y76.06 E.00464
; LINE_WIDTH: 0.469902
G1 X88.413 Y76.234 E.00907
; WIPE_START
G1 F10331.38
G1 X88.145 Y76.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.098 Y77.631 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.396353
G1 F2506
M204 S6000
G1 X88.318 Y77.355 E.0195
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.253319
G1 F2506
M204 S6000
G1 X89.153 Y77.625 E.01243
M204 S10000
G1 X89.155 Y77.614 F42000
; LINE_WIDTH: 0.137467
G1 F2506
M204 S6000
G1 X88.318 Y77.406 E.0058
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z3.16 F42000
G1 X86.21 Y106.174 Z3.16
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.462503
G1 F2506
M204 S6000
G1 X101.29 Y106.174 E.4209
; WIPE_START
G1 F10509.927
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.487 Y100.242 Z3.16 F42000
G1 X80.021 Y82.378 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2506
M204 S5000
G1 X80.058 Y82.375 E.00082
G3 X79.962 Y82.384 I.015 J.688 E.09455
M204 S250
G1 X79.607 Y82.527 F42000
G1 F2506
M204 S5000
G1 X79.714 Y82.448 E.00298
G3 X80.054 Y82.354 I.353 J.616 E.00797
G1 X80.096 Y82.354 E.00096
G3 X79.561 Y82.565 I-.029 J.71 E.08665
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.07323
G1 X79.844 Y82.391 E-.05384
G1 X80.054 Y82.354 E-.08099
G1 X80.096 Y82.354 E-.01629
G1 X80.228 Y82.371 E-.05055
G1 X80.362 Y82.417 E-.05374
G1 X80.485 Y82.487 E-.05386
G1 X80.591 Y82.581 E-.05379
G1 X80.677 Y82.694 E-.05373
G1 X80.738 Y82.821 E-.05384
G1 X80.773 Y82.959 E-.05384
G1 X80.78 Y83.1 E-.05377
G1 X80.759 Y83.24 E-.05376
G1 X80.711 Y83.373 E-.05384
G1 X80.709 Y83.375 E-.00093
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z3.16 F42000
G1 X85.01 Y99.29 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/51
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.16 I1.206 J.165 P1  F42000
G1 X88.374 Y76.604 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P43 R5
G1 F2505
M204 S6000
G1 X88.458 Y76.742 E.00437
G2 X91.694 Y76.466 I1.541 J-1.044 E.10693
G1 X91.889 Y76.509 E.00543
G1 X91.889 Y77.839 E.03603
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.346 Y76.551 E.0026
M204 S250
G1 X88.717 Y76.396 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X88.716 Y76.393 E.00009
G3 X89.819 Y74.251 I1.284 J-.694 E.07127
G1 X89.964 Y74.24 E.00364
G3 X88.878 Y76.632 I.036 J1.459 E.14835
G1 X88.751 Y76.446 E.00567
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.716 Y76.393 E-.02402
G1 X88.604 Y76.127 E-.10962
G1 X88.547 Y75.844 E-.1098
G1 X88.546 Y75.562 E-.1071
G1 X88.598 Y75.292 E-.1046
G1 X88.69 Y75.055 E-.09648
G1 X88.842 Y74.81 E-.10941
G1 X89.02 Y74.621 E-.09896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.35 Y76.748 Z3.32 F42000
G1 X101.49 Y78.24 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F2505
M204 S5000
G1 X101.49 Y77.743 E.01248
G1 X101.821 Y77.817 E.00853
G3 X102.51 Y78.691 I-.261 J.914 E.02989
G1 X102.51 Y105.305 E.6691
G3 X102.176 Y106.005 I-.954 J-.025 E.02009
G3 X101.49 Y106.261 I-.876 J-1.298 E.01857
G1 X101.49 Y105.76 E.0126
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.056 J-.92 E.03459
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03557
G1 X86.01 Y77.79 E.19146
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.743 E-.19006
G1 X101.821 Y77.817 E-.12899
G1 X102.066 Y77.918 E-.10074
G1 X102.204 Y78.019 E-.06474
G1 X102.302 Y78.12 E-.05375
G1 X102.379 Y78.229 E-.05047
G1 X102.457 Y78.392 E-.06887
G1 X102.499 Y78.558 E-.06485
G1 X102.507 Y78.656 E-.03753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.931 Y77.732 Z3.32 F42000
G1 X92.29 Y77.41 Z3.32
G1 Z2.92
G1 E.8 F1800
G1 F2505
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.002 J1.294 E.05118
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.294 J.002 E.04938
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.294 J-.001 E.05117
G1 X87.71 Y77.41 E.23393
M73 P44 R5
G1 X87.718 Y75.41 E.05028
G3 X90.132 Y73.414 I2.294 J.318 E.08647
G3 X92.282 Y75.41 I-.142 J2.31 E.07989
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z2.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2505
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.648 Z3.32 F42000
G1 X90.911 Y77.631 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.438707
G1 F2505
M204 S6000
G1 X91.478 Y77.427 E.01587
G1 X91.682 Y76.967 E.01327
M204 S10000
G1 X91.682 Y77.369 F42000
; LINE_WIDTH: 0.291024
G1 F2505
M204 S6000
G1 X90.851 Y77.63 E.01457
M204 S10000
G1 X90.847 Y77.615 F42000
; LINE_WIDTH: 0.16782
G1 F2505
M204 S6000
G1 X91.682 Y77.398 E.0075
; WIPE_START
G1 F18000
G1 X90.847 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.578 Y76.235 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.466967
G1 F2505
M204 S6000
G1 X91.858 Y76.06 E.00931
G1 X91.87 Y75.504 E.01567
G1 X91.832 Y75.3 E.00585
G2 X88.13 Y75.896 I-1.834 J.403 E.16035
G1 X88.145 Y76.06 E.00464
; LINE_WIDTH: 0.469864
G1 X88.413 Y76.234 E.00907
; WIPE_START
G1 F10332.298
G1 X88.145 Y76.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.098 Y77.631 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.396423
G1 F2505
M204 S6000
G1 X88.318 Y77.356 E.01952
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.253343
G1 F2505
M204 S6000
G1 X89.153 Y77.625 E.01243
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.137165
G1 F2505
M204 S6000
G1 X88.318 Y77.408 E.00578
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2505
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z3.32 F42000
G1 X86.21 Y106.174 Z3.32
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2505
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.487 Y100.242 Z3.32 F42000
G1 X80.022 Y82.379 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2505
M204 S5000
G1 X80.053 Y82.375 E.00069
G3 X79.916 Y82.392 I.017 J.688 E.09371
G1 X79.963 Y82.386 E.00104
M204 S250
G1 X79.608 Y82.526 F42000
G1 F2505
M204 S5000
G1 X79.714 Y82.448 E.00294
G3 X80.053 Y82.354 I.353 J.617 E.00797
G1 X80.097 Y82.354 E.00098
G3 X79.562 Y82.564 I-.03 J.71 E.08666
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.07256
G1 X79.843 Y82.391 E-.05381
G1 X80.053 Y82.354 E-.08104
G1 X80.097 Y82.354 E-.01667
G1 X80.228 Y82.371 E-.0502
G1 X80.362 Y82.417 E-.05378
G1 X80.485 Y82.487 E-.05376
G1 X80.591 Y82.581 E-.0538
G1 X80.677 Y82.694 E-.05383
G1 X80.738 Y82.821 E-.05378
G1 X80.773 Y82.959 E-.05384
G1 X80.78 Y83.1 E-.05379
G1 X80.759 Y83.24 E-.05383
G1 X80.711 Y83.373 E-.05379
G1 X80.708 Y83.376 E-.00153
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2505
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z3.32 F42000
G1 X85.01 Y99.29 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2505
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/51
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.32 I1.206 J.166 P1  F42000
G1 X88.387 Y76.62 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2505
M204 S6000
G1 X88.569 Y76.889 E.0088
G2 X91.694 Y76.466 I1.43 J-1.191 E.10194
G1 X91.889 Y76.509 E.00543
G1 X91.889 Y77.839 E.03603
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.355 Y76.569 E.00316
M204 S250
G1 X88.717 Y76.397 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X88.717 Y76.393 E.00009
G3 X89.82 Y74.251 I1.283 J-.695 E.07129
G1 X89.964 Y74.24 E.00363
G3 X88.878 Y76.632 I.036 J1.459 E.14835
G1 X88.751 Y76.446 E.00566
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.393 E-.02398
G1 X88.604 Y76.127 E-.10976
G1 X88.547 Y75.844 E-.10986
G1 X88.546 Y75.562 E-.10718
G1 X88.598 Y75.291 E-.10474
G1 X88.702 Y75.032 E-.10616
G1 X88.843 Y74.809 E-.10012
G1 X89.02 Y74.621 E-.0982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.35 Y76.748 Z3.48 F42000
G1 X101.49 Y78.24 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F2505
M204 S5000
G1 X101.49 Y77.743 E.01249
G1 X101.822 Y77.817 E.00854
G3 X102.51 Y78.691 I-.238 J.895 E.03001
G1 X102.51 Y105.305 E.6691
G3 X102.176 Y106.005 I-.971 J-.034 E.02007
G3 X101.49 Y106.261 I-.874 J-1.296 E.01857
G1 X101.49 Y105.76 E.0126
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.354 Y106.209 E.19248
G3 X77.49 Y105.305 I.058 J-.92 E.03456
G1 X77.49 Y78.695 E.66901
M73 P45 R5
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.743 E-.19019
G1 X101.822 Y77.817 E-.12913
G1 X102.058 Y77.913 E-.09715
G1 X102.174 Y77.993 E-.05315
G1 X102.303 Y78.121 E-.06932
G1 X102.398 Y78.262 E-.06442
G1 X102.456 Y78.389 E-.05316
G1 X102.499 Y78.557 E-.06579
G1 X102.507 Y78.656 E-.03769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.931 Y77.732 Z3.48 F42000
G1 X92.29 Y77.41 Z3.48
G1 Z3.08
G1 E.8 F1800
G1 F2505
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I-.004 J1.299 E.05112
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.302 J-.006 E.04931
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.006 J-1.302 E.04931
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.301 J.006 E.05109
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.13 Y73.414 I2.293 J.316 E.08643
G3 X92.282 Y75.41 I-.15 J2.321 E.07987
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z3.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2505
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.648 Z3.48 F42000
G1 X90.909 Y77.631 Z3.48
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.438719
G1 F2505
M204 S6000
G1 X91.478 Y77.427 E.01591
G1 X91.682 Y76.968 E.01326
M204 S10000
G1 X91.682 Y77.369 F42000
; LINE_WIDTH: 0.291789
G1 F2505
M204 S6000
G1 X90.851 Y77.63 E.01461
M204 S10000
G1 X90.847 Y77.615 F42000
; LINE_WIDTH: 0.168227
G1 F2505
M204 S6000
G1 X91.682 Y77.397 E.00752
; WIPE_START
G1 F18000
G1 X90.847 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.579 Y76.235 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.466767
G1 F2505
M204 S6000
G1 X91.858 Y76.06 E.00929
G1 X91.87 Y75.505 E.01565
G1 X91.832 Y75.301 E.00584
G2 X88.13 Y75.896 I-1.834 J.402 E.16035
G1 X88.145 Y76.06 E.00464
; LINE_WIDTH: 0.469918
G1 X88.413 Y76.234 E.00907
; WIPE_START
G1 F10331.017
G1 X88.145 Y76.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.098 Y77.631 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.395778
G1 F2505
M204 S6000
G1 X88.318 Y77.356 E.01948
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.252851
G1 F2505
M204 S6000
G1 X89.153 Y77.625 E.0124
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.13706
G1 F2505
M204 S6000
G1 X88.318 Y77.407 E.00577
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2505
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z3.48 F42000
G1 X86.21 Y106.174 Z3.48
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2505
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
M73 P46 R5
G1 E-.04 F1800
M204 S10000
G1 X94.486 Y100.243 Z3.48 F42000
G1 X80.018 Y82.379 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2505
M204 S5000
G1 X80.053 Y82.375 E.00078
G3 X79.921 Y82.392 I.019 J.688 E.09383
G1 X79.959 Y82.387 E.00084
M204 S250
G1 X79.609 Y82.525 F42000
G1 F2505
M204 S5000
G1 X79.714 Y82.448 E.00291
G3 X80.053 Y82.354 I.353 J.615 E.00796
G1 X80.098 Y82.354 E.00101
G3 X79.564 Y82.563 I-.031 J.709 E.08648
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.072
G1 X79.844 Y82.391 E-.05383
G1 X80.053 Y82.354 E-.08095
G1 X80.098 Y82.354 E-.0171
G1 X80.228 Y82.371 E-.0498
G1 X80.362 Y82.417 E-.05375
G1 X80.485 Y82.487 E-.05385
G1 X80.591 Y82.581 E-.05379
G1 X80.677 Y82.694 E-.05375
G1 X80.738 Y82.822 E-.05387
G1 X80.773 Y82.959 E-.05381
G1 X80.78 Y83.1 E-.05376
G1 X80.759 Y83.24 E-.0538
G1 X80.711 Y83.373 E-.05378
G1 X80.708 Y83.378 E-.00217
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2505
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z3.48 F42000
G1 X85.01 Y99.29 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2505
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/51
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.48 I1.206 J.166 P1  F42000
G1 X88.387 Y76.621 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2506
M204 S6000
G1 X88.569 Y76.889 E.0088
G2 X91.694 Y76.466 I1.43 J-1.192 E.10193
G1 X91.889 Y76.509 E.00542
G1 X91.889 Y77.839 E.03603
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.355 Y76.57 E.00317
M204 S250
G1 X88.717 Y76.397 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X88.717 Y76.393 E.00009
G3 X89.819 Y74.251 I1.283 J-.695 E.07129
G1 X89.964 Y74.24 E.00364
G3 X88.878 Y76.632 I.036 J1.459 E.14833
G1 X88.751 Y76.446 E.00566
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.393 E-.02411
G1 X88.604 Y76.127 E-.10975
G1 X88.547 Y75.844 E-.10987
G1 X88.546 Y75.562 E-.10729
G1 X88.598 Y75.29 E-.10501
G1 X88.689 Y75.056 E-.0956
G1 X88.841 Y74.811 E-.10949
G1 X89.019 Y74.621 E-.09889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.349 Y76.748 Z3.64 F42000
G1 X101.49 Y78.24 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.49 Y77.733 E.01275
G1 X101.901 Y77.84 E.01069
G3 X102.51 Y78.691 I-.306 J.862 E.02799
G1 X102.51 Y105.305 E.6691
G3 X102.176 Y106.005 I-.953 J-.025 E.02009
G3 X101.49 Y106.261 I-.876 J-1.298 E.01858
G1 X101.49 Y105.76 E.01261
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.056 J-.92 E.03459
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.733 E-.19403
G1 X101.901 Y77.84 E-.16156
G1 X102.14 Y77.967 E-.10287
G1 X102.356 Y78.193 E-.11858
G1 X102.456 Y78.389 E-.08364
G1 X102.499 Y78.556 E-.06553
G1 X102.506 Y78.645 E-.03381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.929 Y77.729 Z3.64 F42000
G1 X92.29 Y77.41 Z3.64
G1 Z3.24
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.294 J.002 E.04939
G1 X78.405 Y106.59 E.5848
M73 P47 R5
G3 X77.112 Y105.363 I.004 J-1.299 E.04938
G1 X77.11 Y78.705 E.67023
G3 X78.405 Y77.41 I1.294 J-.002 E.05118
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.127 Y73.414 I2.295 J.319 E.08635
G3 X92.282 Y75.41 I-.143 J2.316 E.07996
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z3.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.649 Z3.64 F42000
G1 X90.899 Y77.631 Z3.64
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.438207
G1 F2506
M204 S6000
G1 X91.478 Y77.427 E.01615
G1 X91.682 Y76.972 E.01314
M204 S10000
G1 X91.682 Y77.369 F42000
; LINE_WIDTH: 0.292287
G1 F2506
M204 S6000
G1 X90.851 Y77.63 E.01464
M204 S10000
G1 X90.847 Y77.615 F42000
; LINE_WIDTH: 0.168761
G1 F2506
M204 S6000
G1 X91.682 Y77.398 E.00755
; WIPE_START
G1 F18000
G1 X90.847 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.58 Y76.235 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.466739
G1 F2506
M204 S6000
G1 X91.858 Y76.06 E.00928
G1 X91.87 Y75.505 E.01563
G1 X91.832 Y75.301 E.00584
G2 X88.13 Y75.896 I-1.834 J.402 E.1603
G1 X88.146 Y76.06 E.00465
; LINE_WIDTH: 0.46923
G1 X88.413 Y76.234 E.00904
; WIPE_START
G1 F10347.36
G1 X88.146 Y76.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.098 Y77.631 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.395376
G1 F2506
M204 S6000
G1 X88.318 Y77.355 E.01945
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.252408
G1 F2506
M204 S6000
G1 X89.153 Y77.625 E.01237
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.136837
G1 F2506
M204 S6000
G1 X88.318 Y77.408 E.00576
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z3.64 F42000
G1 X86.21 Y106.174 Z3.64
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2506
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.486 Y100.242 Z3.64 F42000
G1 X80.021 Y82.379 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2506
M204 S5000
G1 X80.053 Y82.375 E.00073
G3 X79.917 Y82.392 I.017 J.688 E.09365
G1 X79.961 Y82.387 E.001
M204 S250
G1 X79.611 Y82.524 F42000
G1 F2506
M204 S5000
G1 X79.714 Y82.448 E.00287
G3 X80.053 Y82.354 I.353 J.617 E.00797
G1 X80.099 Y82.354 E.00103
G3 X79.565 Y82.562 I-.032 J.71 E.08669
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.07137
G1 X79.844 Y82.391 E-.05382
G1 X80.053 Y82.354 E-.08098
G1 X80.099 Y82.354 E-.01742
G1 X80.228 Y82.371 E-.04936
G1 X80.363 Y82.417 E-.05391
G1 X80.485 Y82.487 E-.05373
G1 X80.591 Y82.581 E-.05378
G1 X80.677 Y82.694 E-.05388
G1 X80.738 Y82.821 E-.05376
G1 X80.773 Y82.959 E-.05384
G1 X80.78 Y83.1 E-.05378
G1 X80.759 Y83.24 E-.05376
G1 X80.711 Y83.373 E-.05387
G1 X80.706 Y83.379 E-.00272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z3.64 F42000
G1 X85.01 Y99.29 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/51
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.64 I1.206 J.166 P1  F42000
G1 X88.387 Y76.621 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2506
M204 S6000
G1 X88.57 Y76.89 E.00881
G2 X91.694 Y76.466 I1.429 J-1.192 E.10192
G1 X91.889 Y76.509 E.00542
G1 X91.889 Y77.839 E.03603
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.355 Y76.57 E.00318
M204 S250
G1 X88.718 Y76.397 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X88.717 Y76.393 E.0001
G3 X89.82 Y74.251 I1.283 J-.695 E.07129
G1 X89.964 Y74.24 E.00364
M73 P48 R5
G3 X88.879 Y76.633 I.036 J1.459 E.14833
G1 X88.751 Y76.447 E.00567
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.393 E-.02415
G1 X88.604 Y76.128 E-.10977
G1 X88.547 Y75.844 E-.10987
G1 X88.546 Y75.561 E-.10743
G1 X88.599 Y75.29 E-.10516
G1 X88.689 Y75.056 E-.09532
G1 X88.841 Y74.811 E-.10936
G1 X89.019 Y74.621 E-.09894
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.349 Y76.748 Z3.8 F42000
G1 X101.49 Y78.24 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.49 Y77.732 E.01275
G1 X101.901 Y77.84 E.01069
G3 X102.51 Y78.692 I-.306 J.862 E.02802
G1 X102.51 Y105.305 E.66907
G3 X102.176 Y106.005 I-.954 J-.025 E.02009
G3 X101.49 Y106.261 I-.876 J-1.298 E.01858
G1 X101.49 Y105.76 E.01261
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.056 J-.92 E.03458
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.732 E-.19405
G1 X101.901 Y77.84 E-.16157
G1 X102.141 Y77.967 E-.10289
G1 X102.356 Y78.193 E-.11849
G1 X102.456 Y78.389 E-.08369
G1 X102.501 Y78.568 E-.07027
G1 X102.506 Y78.645 E-.02904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.929 Y77.729 Z3.8 F42000
G1 X92.29 Y77.41 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.002 J1.294 E.05118
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.299 J-.004 E.04934
G1 X78.405 Y106.59 E.58479
G3 X77.112 Y105.365 I.002 J-1.298 E.04936
G1 X77.11 Y78.705 E.67027
M73 P48 R4
G3 X78.405 Y77.41 I1.291 J-.004 E.0512
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.125 Y73.414 I2.295 J.319 E.08629
G3 X92.282 Y75.41 I-.146 J2.321 E.07998
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
M73 P49 R4
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.649 Z3.8 F42000
G1 X90.898 Y77.631 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.438235
G1 F2506
M204 S6000
G1 X91.478 Y77.427 E.01618
G1 X91.682 Y76.975 E.01307
M204 S10000
G1 X91.682 Y77.369 F42000
; LINE_WIDTH: 0.293104
G1 F2506
M204 S6000
G1 X90.851 Y77.631 E.01469
M204 S10000
G1 X90.848 Y77.615 F42000
; LINE_WIDTH: 0.16921
G1 F2506
M204 S6000
G1 X91.682 Y77.397 E.00758
; WIPE_START
G1 F18000
G1 X90.848 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.58 Y76.235 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.466703
G1 F2506
M204 S6000
G1 X91.858 Y76.059 E.00927
G1 X91.87 Y75.506 E.01561
G1 X91.832 Y75.302 E.00584
G2 X88.13 Y75.896 I-1.834 J.402 E.1603
G1 X88.146 Y76.06 E.00464
; LINE_WIDTH: 0.469213
G1 X88.413 Y76.234 E.00904
; WIPE_START
G1 F10347.765
G1 X88.146 Y76.06 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.099 Y77.631 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.3951
G1 F2506
M204 S6000
G1 X88.318 Y77.356 E.01946
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.25232
G1 F2506
M204 S6000
G1 X89.153 Y77.625 E.01237
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.136519
G1 F2506
M204 S6000
G1 X88.318 Y77.408 E.00574
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z3.8 F42000
G1 X86.21 Y106.174 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.462503
G1 F2506
M204 S6000
G1 X101.29 Y106.174 E.4209
; WIPE_START
G1 F10509.927
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.487 Y100.241 Z3.8 F42000
G1 X80.027 Y82.378 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2506
M204 S5000
G1 X80.053 Y82.375 E.00058
G3 X79.916 Y82.392 I.017 J.688 E.09365
G1 X79.968 Y82.386 E.00115
M204 S250
G1 X79.612 Y82.523 F42000
G1 F2506
M204 S5000
G1 X79.714 Y82.448 E.00283
G3 X80.053 Y82.354 I.353 J.616 E.00796
G1 X80.1 Y82.354 E.00105
G3 X79.566 Y82.561 I-.033 J.71 E.08671
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.07075
G1 X79.843 Y82.391 E-.05379
G1 X80.053 Y82.354 E-.081
G1 X80.1 Y82.354 E-.01781
G1 X80.228 Y82.371 E-.04906
G1 X80.362 Y82.417 E-.05383
G1 X80.485 Y82.487 E-.05376
G1 X80.591 Y82.581 E-.0538
G1 X80.677 Y82.694 E-.0538
G1 X80.738 Y82.821 E-.05385
G1 X80.773 Y82.959 E-.05382
G1 X80.78 Y83.1 E-.05378
G1 X80.759 Y83.24 E-.05376
G1 X80.711 Y83.373 E-.05385
G1 X80.705 Y83.38 E-.00336
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z3.8 F42000
G1 X85.01 Y99.29 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/51
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I1.206 J.166 P1  F42000
G1 X88.387 Y76.621 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2506
M204 S6000
G1 X88.569 Y76.89 E.0088
G2 X91.694 Y76.466 I1.429 J-1.192 E.10192
G1 X91.889 Y76.509 E.00542
G1 X91.889 Y77.839 E.03603
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.355 Y76.57 E.00318
M204 S250
G1 X88.718 Y76.397 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X88.717 Y76.393 E.0001
G3 X89.819 Y74.251 I1.283 J-.695 E.07128
G1 X89.964 Y74.24 E.00364
G3 X88.879 Y76.633 I.036 J1.459 E.14833
G1 X88.752 Y76.447 E.00566
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.393 E-.02426
G1 X88.604 Y76.127 E-.10977
G1 X88.547 Y75.844 E-.10985
G1 X88.546 Y75.561 E-.10751
G1 X88.599 Y75.289 E-.10525
G1 X88.689 Y75.056 E-.09506
G1 X88.841 Y74.811 E-.10939
G1 X89.019 Y74.621 E-.09891
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.349 Y76.748 Z3.96 F42000
G1 X101.49 Y78.24 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.49 Y77.733 E.01274
G1 X101.901 Y77.84 E.01069
G3 X102.51 Y78.691 I-.306 J.862 E.02799
G1 X102.51 Y105.305 E.6691
G3 X102.176 Y106.005 I-.954 J-.025 E.02009
G3 X101.49 Y106.261 I-.873 J-1.291 E.01857
G1 X101.49 Y105.76 E.0126
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.056 J-.92 E.03458
G1 X77.49 Y78.694 E.66903
G3 X78.395 Y77.79 I.92 J.016 E.03557
G1 X86.01 Y77.79 E.19145
M73 P50 R4
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.733 E-.19395
G1 X101.901 Y77.84 E-.1615
G1 X102.14 Y77.967 E-.10291
G1 X102.356 Y78.192 E-.11844
G1 X102.456 Y78.389 E-.08377
G1 X102.498 Y78.554 E-.06487
G1 X102.506 Y78.645 E-.03456
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.929 Y77.729 Z3.96 F42000
G1 X92.29 Y77.41 Z3.96
G1 Z3.56
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.297 E.66855
G3 X101.666 Y106.588 I-1.299 J-.006 E.04927
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.294 J-.001 E.05117
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.123 Y73.414 I2.3 J.324 E.08619
G3 X92.282 Y75.41 I-.133 J2.31 E.08012
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z3.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.649 Z3.96 F42000
G1 X90.896 Y77.631 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.438197
G1 F2506
M204 S6000
G1 X91.478 Y77.427 E.01622
G1 X91.682 Y76.975 E.01307
M204 S10000
G1 X91.682 Y77.369 F42000
; LINE_WIDTH: 0.293616
G1 F2506
M204 S6000
G1 X90.851 Y77.63 E.01472
M204 S10000
G1 X90.848 Y77.615 F42000
; LINE_WIDTH: 0.16972
G1 F2506
M204 S6000
G1 X91.682 Y77.398 E.00761
; WIPE_START
G1 F18000
G1 X90.848 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.581 Y76.235 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.46671
G1 F2506
M204 S6000
G1 X91.858 Y76.059 E.00926
G1 X91.87 Y75.506 E.01559
G1 X91.832 Y75.302 E.00585
G2 X88.13 Y75.896 I-1.835 J.4 E.16037
G1 X88.146 Y76.061 E.00465
; LINE_WIDTH: 0.468518
G1 X88.413 Y76.234 E.00902
; WIPE_START
G1 F10364.331
G1 X88.146 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.098 Y77.631 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.394861
G1 F2506
M204 S6000
G1 X88.318 Y77.356 E.01943
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.251916
G1 F2506
M204 S6000
G1 X89.153 Y77.625 E.01235
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.136273
G1 F2506
M204 S6000
G1 X88.318 Y77.409 E.00572
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z3.96 F42000
G1 X86.21 Y106.174 Z3.96
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2506
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.487 Y100.242 Z3.96 F42000
G1 X80.025 Y82.379 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
M73 P51 R4
G1 F2506
M204 S5000
G1 X80.053 Y82.375 E.00062
G3 X79.916 Y82.392 I.017 J.688 E.09365
G1 X79.966 Y82.386 E.00111
M204 S250
G1 X79.613 Y82.522 F42000
G1 F2506
M204 S5000
G1 X79.714 Y82.448 E.0028
G3 X80.053 Y82.354 I.353 J.617 E.00796
G1 X80.101 Y82.354 E.00107
G3 X79.567 Y82.559 I-.034 J.71 E.08672
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.07013
G1 X79.843 Y82.391 E-.05377
G1 X80.053 Y82.354 E-.08095
G1 X80.101 Y82.354 E-.01824
G1 X80.228 Y82.371 E-.04868
G1 X80.362 Y82.417 E-.05382
G1 X80.485 Y82.487 E-.05372
G1 X80.591 Y82.581 E-.05383
G1 X80.677 Y82.694 E-.05379
G1 X80.738 Y82.821 E-.05381
G1 X80.773 Y82.959 E-.05379
G1 X80.78 Y83.1 E-.05384
G1 X80.759 Y83.24 E-.05377
G1 X80.711 Y83.373 E-.05383
G1 X80.705 Y83.382 E-.00403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z3.96 F42000
G1 X85.01 Y99.29 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/51
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.96 I1.206 J.166 P1  F42000
G1 X88.387 Y76.621 Z3.96
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2506
M204 S6000
G1 X88.57 Y76.89 E.00881
G2 X91.694 Y76.466 I1.429 J-1.193 E.10191
G1 X91.889 Y76.509 E.00542
G1 X91.889 Y77.839 E.03604
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.356 Y76.57 E.00319
M204 S250
G1 X88.718 Y76.397 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X88.717 Y76.394 E.0001
G3 X89.82 Y74.251 I1.283 J-.695 E.0713
G1 X89.964 Y74.24 E.00363
G3 X88.879 Y76.633 I.036 J1.459 E.14832
G1 X88.752 Y76.447 E.00566
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.394 E-.02414
G1 X88.604 Y76.128 E-.10983
G1 X88.547 Y75.844 E-.10995
G1 X88.546 Y75.561 E-.10762
G1 X88.599 Y75.288 E-.10544
G1 X88.703 Y75.028 E-.10648
G1 X88.861 Y74.786 E-.10979
G1 X89.019 Y74.621 E-.08674
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.349 Y76.748 Z4.12 F42000
G1 X101.49 Y78.24 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.49 Y77.743 E.0125
G1 X101.822 Y77.817 E.00855
G3 X102.51 Y78.691 I-.252 J.906 E.02992
G1 X102.51 Y105.305 E.66911
G3 X102.176 Y106.005 I-.954 J-.026 E.02008
G3 X101.49 Y106.261 I-.872 J-1.29 E.01857
G1 X101.49 Y105.76 E.0126
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.056 J-.92 E.03459
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03557
G1 X86.01 Y77.79 E.19146
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.743 E-.19025
G1 X101.822 Y77.817 E-.12924
G1 X102.067 Y77.918 E-.10066
G1 X102.201 Y78.016 E-.06312
G1 X102.301 Y78.118 E-.05428
G1 X102.396 Y78.259 E-.06462
G1 X102.456 Y78.389 E-.05434
G1 X102.498 Y78.553 E-.06459
G1 X102.507 Y78.655 E-.03891
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.931 Y77.732 Z4.12 F42000
G1 X92.29 Y77.41 Z4.12
G1 Z3.72
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I-.011 J1.306 E.05105
G1 X102.89 Y105.297 E.66855
G3 X101.664 Y106.588 I-1.299 J-.006 E.04932
G1 X78.405 Y106.59 E.58475
G3 X77.112 Y105.364 I.004 J-1.299 E.04938
G1 X77.11 Y78.705 E.67023
M73 P52 R4
G3 X78.405 Y77.41 I1.294 J-.001 E.05117
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.12 Y73.414 I2.29 J.312 E.08623
G3 X92.282 Y75.41 I-.132 J2.313 E.08016
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z3.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.649 Z4.12 F42000
G1 X90.889 Y77.631 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.438236
G1 F2506
M204 S6000
G1 X91.478 Y77.427 E.01641
G1 X91.682 Y76.976 E.01304
M204 S10000
G1 X91.682 Y77.369 F42000
; LINE_WIDTH: 0.294292
G1 F2506
M204 S6000
G1 X90.851 Y77.631 E.01475
M204 S10000
G1 X90.848 Y77.615 F42000
; LINE_WIDTH: 0.170349
G1 F2506
M204 S6000
G1 X91.682 Y77.396 E.00764
; WIPE_START
G1 F18000
G1 X90.848 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.581 Y76.235 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.466639
G1 F2506
M204 S6000
G1 X91.858 Y76.059 E.00925
G1 X91.87 Y75.507 E.01557
G1 X91.832 Y75.303 E.00585
G2 X88.13 Y75.897 I-1.835 J.4 E.16036
G1 X88.146 Y76.061 E.00465
; LINE_WIDTH: 0.468526
G1 X88.413 Y76.234 E.00901
; WIPE_START
G1 F10364.129
G1 X88.146 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.099 Y77.631 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.394657
G1 F2506
M204 S6000
G1 X88.318 Y77.356 E.01945
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.251762
G1 F2506
M204 S6000
G1 X89.153 Y77.625 E.01234
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.136088
G1 F2506
M204 S6000
G1 X88.318 Y77.409 E.00571
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z4.12 F42000
G1 X86.21 Y106.174 Z4.12
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2506
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.488 Y100.241 Z4.12 F42000
G1 X80.028 Y82.378 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2506
M204 S5000
G1 X80.058 Y82.375 E.00065
G3 X79.969 Y82.383 I.015 J.688 E.09472
M204 S250
G1 X79.615 Y82.521 F42000
G1 F2506
M204 S5000
G1 X79.714 Y82.448 E.00275
G3 X80.053 Y82.354 I.353 J.614 E.00796
G1 X80.102 Y82.355 E.00109
G3 X79.569 Y82.559 I-.035 J.707 E.0864
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.06944
G1 X79.844 Y82.391 E-.0539
G1 X80.053 Y82.354 E-.08087
G1 X80.102 Y82.355 E-.01858
G1 X80.228 Y82.371 E-.04831
G1 X80.362 Y82.416 E-.05377
G1 X80.485 Y82.487 E-.05387
G1 X80.591 Y82.581 E-.05373
G1 X80.677 Y82.694 E-.05386
G1 X80.738 Y82.822 E-.05383
G1 X80.773 Y82.959 E-.05378
G1 X80.78 Y83.1 E-.05376
G1 X80.759 Y83.24 E-.05382
G1 X80.711 Y83.373 E-.05377
G1 X80.704 Y83.384 E-.00471
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z4.12 F42000
G1 X85.01 Y99.29 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/51
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.12 I1.206 J.166 P1  F42000
G1 X88.387 Y76.621 Z4.12
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2506
M204 S6000
G1 X88.57 Y76.89 E.00881
G2 X91.694 Y76.466 I1.429 J-1.193 E.10191
G1 X91.889 Y76.509 E.00542
G1 X91.889 Y77.839 E.03604
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.356 Y76.57 E.00319
M204 S250
G1 X88.718 Y76.398 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X88.717 Y76.394 E.00009
G3 X89.819 Y74.251 I1.283 J-.695 E.0713
G1 X89.964 Y74.24 E.00364
G3 X88.879 Y76.633 I.036 J1.459 E.14831
G1 X88.752 Y76.447 E.00567
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.394 E-.02413
G1 X88.604 Y76.128 E-.10987
G1 X88.547 Y75.844 E-.10996
G1 X88.546 Y75.561 E-.1077
G1 X88.599 Y75.287 E-.10578
G1 X88.689 Y75.057 E-.09407
G1 X88.841 Y74.812 E-.10944
G1 X89.019 Y74.622 E-.09905
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.349 Y76.748 Z4.28 F42000
G1 X101.49 Y78.24 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.49 Y77.733 E.01274
G1 X101.901 Y77.84 E.01069
G3 X102.51 Y78.694 I-.319 J.871 E.02802
G1 X102.51 Y105.305 E.66903
G3 X102.175 Y106.005 I-.954 J-.026 E.02009
M73 P53 R4
G3 X101.49 Y106.261 I-.872 J-1.289 E.01857
G1 X101.49 Y105.76 E.0126
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.057 J-.92 E.03459
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03557
G1 X86.01 Y77.79 E.19146
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.733 E-.19396
G1 X101.901 Y77.84 E-.16157
G1 X102.141 Y77.967 E-.1029
G1 X102.356 Y78.193 E-.11849
G1 X102.458 Y78.395 E-.08604
G1 X102.492 Y78.519 E-.049
G1 X102.505 Y78.645 E-.04804
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.928 Y77.729 Z4.28 F42000
G1 X92.29 Y77.41 Z4.28
G1 Z3.88
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I-.004 J1.299 E.05112
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.303 J-.007 E.0493
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.002 J-1.297 E.04935
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.118 Y73.414 I2.29 J.312 E.08617
G3 X92.282 Y75.41 I-.139 J2.322 E.08015
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z3.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
M73 P54 R4
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.649 Z4.28 F42000
G1 X90.887 Y77.631 Z4.28
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.438258
G1 F2506
M204 S6000
G1 X91.478 Y77.427 E.01646
G1 X91.682 Y76.977 E.01301
M204 S10000
G1 X91.682 Y77.368 F42000
; LINE_WIDTH: 0.294913
G1 F2506
M204 S6000
G1 X90.851 Y77.631 E.01479
M204 S10000
G1 X90.848 Y77.615 F42000
; LINE_WIDTH: 0.170699
G1 F2506
M204 S6000
G1 X91.682 Y77.397 E.00766
; WIPE_START
G1 F18000
G1 X90.848 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.581 Y76.235 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.466537
G1 F2506
M204 S6000
G1 X91.858 Y76.059 E.00924
G1 X91.87 Y75.508 E.01555
G1 X91.833 Y75.304 E.00585
G2 X88.13 Y75.897 I-1.835 J.399 E.16035
G1 X88.146 Y76.061 E.00465
; LINE_WIDTH: 0.468545
G1 X88.413 Y76.234 E.00902
; WIPE_START
G1 F10363.68
G1 X88.146 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.099 Y77.631 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.394365
G1 F2506
M204 S6000
G1 X88.318 Y77.356 E.01943
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.251325
G1 F2506
M204 S6000
G1 X89.153 Y77.625 E.01231
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.135647
G1 F2506
M204 S6000
G1 X88.318 Y77.408 E.00569
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z4.28 F42000
G1 X86.21 Y106.174 Z4.28
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2506
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.488 Y100.241 Z4.28 F42000
G1 X80.03 Y82.378 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2506
M204 S5000
G1 X80.053 Y82.375 E.00051
G3 X79.916 Y82.392 I.017 J.689 E.0938
G1 X79.97 Y82.385 E.00122
M204 S250
G1 X79.616 Y82.52 F42000
G1 F2506
M204 S5000
G1 X79.714 Y82.448 E.00272
G3 X80.053 Y82.354 I.353 J.617 E.00796
G1 X80.103 Y82.355 E.00112
G3 X79.57 Y82.557 I-.036 J.71 E.08675
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.06889
G1 X79.844 Y82.391 E-.05378
G1 X80.053 Y82.354 E-.08086
G1 X80.103 Y82.355 E-.01901
G1 X80.228 Y82.371 E-.04799
G1 X80.363 Y82.417 E-.05382
G1 X80.485 Y82.487 E-.05373
G1 X80.591 Y82.581 E-.05379
G1 X80.677 Y82.694 E-.05382
G1 X80.738 Y82.821 E-.0538
G1 X80.773 Y82.959 E-.05381
G1 X80.78 Y83.1 E-.05384
G1 X80.759 Y83.24 E-.05375
G1 X80.711 Y83.373 E-.05385
G1 X80.703 Y83.385 E-.00526
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z4.28 F42000
G1 X85.01 Y99.29 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/51
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.28 I1.206 J.166 P1  F42000
G1 X88.387 Y76.621 Z4.28
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2506
M204 S6000
G1 X88.57 Y76.89 E.00881
G2 X91.694 Y76.465 I1.429 J-1.193 E.10191
G1 X91.889 Y76.509 E.00542
G1 X91.889 Y77.839 E.03604
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.356 Y76.57 E.00319
M204 S250
G1 X88.718 Y76.398 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X88.717 Y76.394 E.00009
G3 X89.819 Y74.251 I1.283 J-.695 E.0713
G1 X89.964 Y74.24 E.00364
G3 X88.879 Y76.633 I.036 J1.459 E.14831
G1 X88.752 Y76.447 E.00567
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.394 E-.02406
G1 X88.604 Y76.128 E-.10989
G1 X88.547 Y75.844 E-.10997
G1 X88.546 Y75.56 E-.10785
G1 X88.599 Y75.287 E-.10582
G1 X88.689 Y75.057 E-.09374
G1 X88.84 Y74.812 E-.10951
G1 X89.019 Y74.622 E-.09916
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.349 Y76.748 Z4.44 F42000
G1 X101.49 Y78.24 Z4.44
G1 Z4.04
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.49 Y77.743 E.0125
G1 X101.822 Y77.817 E.00856
G3 X102.51 Y78.695 I-.226 J.885 E.03015
G1 X102.51 Y105.305 E.66901
G3 X102.175 Y106.005 I-.954 J-.025 E.0201
G3 X101.49 Y106.261 I-.871 J-1.287 E.01857
G1 X101.49 Y105.76 E.0126
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.056 J-.92 E.03459
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
M73 P55 R4
G1 F11668.197
M204 S6000
G1 X101.49 Y77.743 E-.19027
G1 X101.822 Y77.817 E-.12935
G1 X102.067 Y77.918 E-.10056
G1 X102.195 Y78.012 E-.06043
G1 X102.303 Y78.121 E-.05843
G1 X102.393 Y78.253 E-.06044
G1 X102.457 Y78.393 E-.05846
G1 X102.497 Y78.546 E-.06043
G1 X102.507 Y78.656 E-.04164
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.93 Y77.732 Z4.44 F42000
G1 X92.29 Y77.41 Z4.44
G1 Z4.04
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.004 J1.291 E.0512
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.294 J.002 E.04939
G1 X78.405 Y106.59 E.58479
G3 X77.112 Y105.365 I-.002 J-1.294 E.04939
G1 X77.11 Y78.705 E.67027
G3 X78.405 Y77.41 I1.294 J-.002 E.05118
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.115 Y73.413 I2.29 J.312 E.08611
G3 X92.282 Y75.41 I-.131 J2.316 E.08025
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z4.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.649 Z4.44 F42000
G1 X90.891 Y77.631 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.438273
G1 F2506
M204 S6000
G1 X91.478 Y77.427 E.01634
G1 X91.682 Y76.979 E.01296
M204 S10000
G1 X91.682 Y77.368 F42000
; LINE_WIDTH: 0.295661
G1 F2506
M204 S6000
G1 X90.851 Y77.631 E.01483
M204 S10000
G1 X90.848 Y77.615 F42000
; LINE_WIDTH: 0.171034
G1 F2506
M204 S6000
G1 X91.682 Y77.396 E.00768
; WIPE_START
G1 F18000
G1 X90.848 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.581 Y76.235 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.466518
G1 F2506
M204 S6000
G1 X91.858 Y76.059 E.00925
G1 X91.87 Y75.508 E.01553
G1 X91.833 Y75.304 E.00585
G2 X88.13 Y75.897 I-1.835 J.399 E.16036
G1 X88.146 Y76.061 E.00465
; LINE_WIDTH: 0.468293
G1 X88.413 Y76.234 E.00901
; WIPE_START
G1 F10369.704
G1 X88.146 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.098 Y77.631 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.394259
G1 F2506
M204 S6000
G1 X88.318 Y77.356 E.01941
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.251143
G1 F2506
M204 S6000
G1 X89.153 Y77.625 E.0123
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.135421
G1 F2506
M204 S6000
G1 X88.318 Y77.408 E.00568
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z4.44 F42000
G1 X86.21 Y106.174 Z4.44
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.462503
G1 F2506
M204 S6000
G1 X101.29 Y106.174 E.4209
; WIPE_START
G1 F10509.927
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.488 Y100.241 Z4.44 F42000
G1 X80.032 Y82.378 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2506
M204 S5000
G1 X80.053 Y82.375 E.00046
G3 X79.917 Y82.392 I.017 J.688 E.09364
G1 X79.973 Y82.385 E.00127
M204 S250
G1 X79.617 Y82.519 F42000
G1 F2506
M204 S5000
G1 X79.714 Y82.448 E.00268
G3 X80.053 Y82.354 I.353 J.616 E.00796
G1 X80.104 Y82.355 E.00114
G3 X79.571 Y82.556 I-.037 J.71 E.08677
; WIPE_START
G1 F12000
M204 S6000
G1 X79.714 Y82.448 E-.06816
G1 X79.844 Y82.391 E-.05384
G1 X80.053 Y82.354 E-.08084
G1 X80.104 Y82.355 E-.0194
G1 X80.228 Y82.371 E-.04761
G1 X80.362 Y82.417 E-.0538
G1 X80.485 Y82.487 E-.0538
G1 X80.591 Y82.581 E-.05374
G1 X80.677 Y82.694 E-.05386
G1 X80.738 Y82.821 E-.05379
G1 X80.773 Y82.959 E-.05383
G1 X80.78 Y83.1 E-.05378
G1 X80.759 Y83.24 E-.05382
G1 X80.711 Y83.373 E-.05381
G1 X80.702 Y83.386 E-.00591
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; LINE_WIDTH: 0.42
M73 P56 R4
G1 F2506
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z4.44 F42000
G1 X85.01 Y99.29 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/51
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.44 I1.206 J.166 P1  F42000
G1 X88.387 Y76.621 Z4.44
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2505
M204 S6000
G1 X88.57 Y76.891 E.00882
G2 X91.694 Y76.465 I1.429 J-1.193 E.1019
G1 X91.889 Y76.509 E.00542
G1 X91.889 Y77.839 E.03604
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.356 Y76.57 E.00319
M204 S250
G1 X88.718 Y76.397 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X88.717 Y76.394 E.00009
G3 X89.819 Y74.251 I1.283 J-.695 E.0713
G1 X89.964 Y74.24 E.00364
G3 X88.879 Y76.633 I.036 J1.459 E.14831
G1 X88.752 Y76.447 E.00568
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.394 E-.02404
G1 X88.604 Y76.128 E-.10984
G1 X88.547 Y75.844 E-.11001
G1 X88.546 Y75.56 E-.10788
G1 X88.609 Y75.256 E-.11794
G1 X88.722 Y74.994 E-.10857
G1 X88.885 Y74.757 E-.10946
G1 X89.019 Y74.621 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.349 Y76.748 Z4.6 F42000
G1 X101.49 Y78.24 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2505
M204 S5000
G1 X101.49 Y77.733 E.01275
G1 X101.902 Y77.841 E.0107
G3 X102.51 Y78.695 I-.306 J.861 E.02808
G1 X102.51 Y105.305 E.66901
G3 X102.176 Y106.005 I-.954 J-.025 E.02009
G3 X101.49 Y106.261 I-.871 J-1.285 E.01857
G1 X101.49 Y105.76 E.01261
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.354 Y106.209 E.19249
G3 X77.49 Y105.305 I.058 J-.92 E.03455
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.733 E-.19399
G1 X101.902 Y77.841 E-.1617
G1 X102.069 Y77.919 E-.07031
G1 X102.175 Y77.994 E-.04908
G1 X102.356 Y78.192 E-.10223
G1 X102.457 Y78.393 E-.08524
G1 X102.497 Y78.546 E-.06004
G1 X102.505 Y78.644 E-.03742
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.928 Y77.728 Z4.6 F42000
G1 X92.29 Y77.41 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2505
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.297 E.66855
G3 X101.666 Y106.588 I-1.299 J-.006 E.04927
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.364 I-.002 J-1.294 E.04943
G1 X77.11 Y78.705 E.67024
M73 P57 R4
G3 X78.405 Y77.41 I1.291 J-.004 E.0512
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.113 Y73.413 I2.295 J.319 E.08599
G3 X92.282 Y75.41 I-.123 J2.31 E.08035
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2505
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.649 Z4.6 F42000
G1 X90.893 Y77.631 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.438307
G1 F2505
M204 S6000
G1 X91.478 Y77.427 E.01631
G1 X91.682 Y76.981 E.01293
M204 S10000
G1 X91.682 Y77.368 F42000
; LINE_WIDTH: 0.296242
G1 F2505
M204 S6000
G1 X90.852 Y77.631 E.01486
M204 S10000
G1 X90.848 Y77.615 F42000
; LINE_WIDTH: 0.171634
G1 F2505
M204 S6000
G1 X91.682 Y77.396 E.00771
; WIPE_START
G1 F18000
G1 X90.848 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.582 Y76.235 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.466655
G1 F2505
M204 S6000
G1 X91.858 Y76.059 E.00923
G1 X91.87 Y75.509 E.01551
G1 X91.833 Y75.305 E.00585
G2 X88.13 Y75.897 I-1.835 J.398 E.16043
G1 X88.147 Y76.061 E.00466
; LINE_WIDTH: 0.467523
G1 X88.413 Y76.234 E.00897
; WIPE_START
G1 F10388.128
G1 X88.147 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.1 Y77.631 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.393474
G1 F2505
M204 S6000
G1 X88.318 Y77.356 E.0194
M204 S10000
G1 X88.318 Y77.376 F42000
; LINE_WIDTH: 0.250945
G1 F2505
M204 S6000
G1 X89.153 Y77.625 E.01229
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.135363
G1 F2505
M204 S6000
G1 X88.318 Y77.407 E.00568
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2505
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z4.6 F42000
G1 X86.21 Y106.174 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2505
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.489 Y100.24 Z4.6 F42000
G1 X80.035 Y82.377 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2505
M204 S5000
G1 X80.053 Y82.375 E.00041
G3 X79.917 Y82.392 I.017 J.688 E.09365
G1 X79.975 Y82.385 E.00132
M204 S250
G1 X79.634 Y82.506 F42000
G1 F2505
M204 S5000
G1 X79.655 Y82.487 E.00062
G3 X80.052 Y82.354 I.415 J.575 E.00951
G1 X80.123 Y82.356 E.00159
G3 X79.549 Y82.581 I-.053 J.707 E.08543
G1 X79.589 Y82.546 E.00121
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y82.487 E-.03338
G1 X79.778 Y82.417 E-.0537
G1 X79.912 Y82.371 E-.05383
G1 X80.052 Y82.354 E-.05377
G1 X80.123 Y82.356 E-.02693
G1 X80.262 Y82.38 E-.05376
G1 X80.394 Y82.432 E-.05388
G1 X80.513 Y82.509 E-.05381
G1 X80.615 Y82.608 E-.05375
G1 X80.725 Y82.788 E-.08054
G1 X80.767 Y82.924 E-.05378
G1 X80.781 Y83.065 E-.05382
G1 X80.75 Y83.272 E-.07964
G1 X80.69 Y83.405 E-.05539
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2505
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z4.6 F42000
G1 X85.01 Y99.29 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2505
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/51
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I1.206 J.166 P1  F42000
G1 X88.387 Y76.621 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2506
M204 S6000
G1 X88.57 Y76.891 E.00884
G2 X91.694 Y76.465 I1.428 J-1.193 E.1019
G1 X91.889 Y76.509 E.00542
G1 X91.889 Y77.839 E.03604
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.00539
G1 X88.356 Y76.57 E.00319
M204 S250
G1 X88.718 Y76.397 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X88.717 Y76.394 E.00008
G3 X89.819 Y74.251 I1.283 J-.696 E.0713
G1 X89.964 Y74.24 E.00365
G3 X88.879 Y76.633 I.036 J1.459 E.1483
G1 X88.751 Y76.447 E.00569
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.394 E-.02391
G1 X88.604 Y76.128 E-.10983
G1 X88.547 Y75.844 E-.11008
G1 X88.546 Y75.56 E-.10798
G1 X88.609 Y75.256 E-.11773
G1 X88.721 Y74.994 E-.10844
G1 X88.885 Y74.757 E-.10956
G1 X89.019 Y74.621 E-.07246
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.349 Y76.748 Z4.76 F42000
G1 X101.49 Y78.24 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.49 Y77.743 E.0125
G1 X101.822 Y77.817 E.00856
G3 X102.51 Y78.695 I-.226 J.885 E.03016
G1 X102.51 Y105.305 E.66901
G3 X102.175 Y106.005 I-.954 J-.026 E.0201
G3 X101.49 Y106.261 I-.869 J-1.282 E.01857
M73 P58 R4
G1 X101.49 Y105.76 E.0126
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.056 J-.92 E.03459
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.743 E-.19025
G1 X101.822 Y77.817 E-.12931
G1 X102.067 Y77.918 E-.10065
G1 X102.194 Y78.011 E-.05982
G1 X102.303 Y78.121 E-.05903
G1 X102.392 Y78.251 E-.05978
G1 X102.457 Y78.393 E-.05911
G1 X102.497 Y78.545 E-.05977
G1 X102.507 Y78.656 E-.04229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.93 Y77.732 Z4.76 F42000
G1 X92.29 Y77.41 Z4.76
G1 Z4.36
G1 E.8 F1800
G1 F2506
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.299 J-.004 E.04933
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.001 J-1.297 E.04936
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.303 J.007 E.05108
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.111 Y73.413 I2.29 J.312 E.08599
G3 X92.282 Y75.41 I-.121 J2.311 E.08041
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z4.36
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.649 Z4.76 F42000
G1 X90.88 Y77.631 Z4.76
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.438364
G1 F2506
M204 S6000
G1 X91.478 Y77.427 E.01663
G1 X91.682 Y76.981 E.01292
M204 S10000
G1 X91.682 Y77.368 F42000
; LINE_WIDTH: 0.296811
G1 F2506
M204 S6000
G1 X90.852 Y77.631 E.0149
M204 S10000
G1 X90.848 Y77.615 F42000
; LINE_WIDTH: 0.172182
G1 F2506
M204 S6000
G1 X91.682 Y77.396 E.00775
; WIPE_START
G1 F18000
G1 X90.848 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.582 Y76.235 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.466477
G1 F2506
M204 S6000
G1 X91.858 Y76.059 E.00922
M73 P59 R4
G1 X91.87 Y75.509 E.01549
G1 X91.833 Y75.305 E.00585
G2 X88.13 Y75.897 I-1.835 J.398 E.16037
G1 X88.147 Y76.061 E.00465
; LINE_WIDTH: 0.467864
G1 X88.413 Y76.234 E.00899
; WIPE_START
G1 F10379.971
G1 X88.147 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.099 Y77.631 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.393579
G1 F2506
M204 S6000
G1 X88.318 Y77.356 E.01938
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.250593
G1 F2506
M204 S6000
G1 X89.153 Y77.625 E.01227
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.135193
G1 F2506
M204 S6000
M73 P59 R3
G1 X88.318 Y77.409 E.00566
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2506
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z4.76 F42000
G1 X86.21 Y106.174 Z4.76
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2506
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.489 Y100.24 Z4.76 F42000
G1 X80.038 Y82.377 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2506
M204 S5000
G1 X80.058 Y82.375 E.00044
G3 X79.978 Y82.382 I.015 J.688 E.09501
M204 S250
G1 X79.636 Y82.504 F42000
G1 F2506
M204 S5000
G1 X79.654 Y82.487 E.00058
G3 X80.053 Y82.354 I.413 J.576 E.00955
G1 X80.106 Y82.355 E.00118
G3 X79.548 Y82.58 I-.038 J.708 E.0858
G1 X79.59 Y82.544 E.00125
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y82.487 E-.03262
G1 X79.778 Y82.417 E-.05391
G1 X79.912 Y82.371 E-.0538
G1 X80.053 Y82.354 E-.05409
G1 X80.106 Y82.355 E-.02012
G1 X80.228 Y82.371 E-.04684
G1 X80.362 Y82.417 E-.05384
G1 X80.485 Y82.487 E-.05383
G1 X80.591 Y82.581 E-.05376
G1 X80.677 Y82.694 E-.05381
G1 X80.738 Y82.822 E-.05387
G1 X80.773 Y82.959 E-.05378
G1 X80.78 Y83.1 E-.05377
G1 X80.759 Y83.24 E-.05378
G1 X80.711 Y83.373 E-.05382
G1 X80.689 Y83.404 E-.01437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z4.76 F42000
G1 X85.01 Y99.29 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2506
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/51
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.76 I1.206 J.165 P1  F42000
G1 X88.375 Y76.605 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2496
M204 S6000
G1 X88.459 Y76.744 E.0044
G2 X91.694 Y76.465 I1.539 J-1.046 E.1069
G1 X91.889 Y76.509 E.00542
G1 X91.889 Y77.839 E.03604
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.0054
G1 X88.347 Y76.552 E.00265
M204 S250
G1 X88.717 Y76.397 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X88.717 Y76.394 E.00007
G3 X89.819 Y74.251 I1.283 J-.696 E.0713
G1 X89.964 Y74.24 E.00365
G3 X88.88 Y76.634 I.036 J1.459 E.14828
G1 X88.751 Y76.447 E.00571
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.394 E-.02377
G1 X88.604 Y76.128 E-.10987
G1 X88.547 Y75.844 E-.11007
G1 X88.546 Y75.56 E-.10807
G1 X88.6 Y75.285 E-.10641
G1 X88.688 Y75.058 E-.09264
G1 X88.84 Y74.813 E-.10945
G1 X89.019 Y74.621 E-.09972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.349 Y76.748 Z4.92 F42000
G1 X101.49 Y78.24 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.49 Y77.743 E.01249
G1 X101.822 Y77.817 E.00856
G3 X102.51 Y78.695 I-.226 J.885 E.03015
G1 X102.51 Y105.305 E.66901
G3 X102.176 Y106.005 I-.954 J-.025 E.02009
G3 X101.49 Y106.261 I-.868 J-1.279 E.01857
G1 X101.49 Y105.76 E.0126
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.354 Y106.209 E.19249
G3 X77.49 Y105.305 I.049 J-.912 E.03463
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.743 E-.1902
M73 P60 R3
G1 X101.822 Y77.817 E-.12935
G1 X102.067 Y77.918 E-.1006
G1 X102.194 Y78.01 E-.05944
G1 X102.303 Y78.122 E-.05943
G1 X102.391 Y78.251 E-.05944
G1 X102.457 Y78.393 E-.05946
G1 X102.496 Y78.544 E-.0594
G1 X102.507 Y78.656 E-.04268
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.93 Y77.732 Z4.92 F42000
G1 X92.29 Y77.41 Z4.92
G1 Z4.52
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.307 J-.011 E.04926
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.294 J-.001 E.05117
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.108 Y73.413 I2.295 J.319 E.08587
G3 X92.282 Y75.41 I-.118 J2.311 E.08048
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z4.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.682 Y77.396 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.17272
G1 F2496
M204 S6000
G1 X90.848 Y77.615 E.00777
M204 S10000
G1 X90.852 Y77.631 F42000
; LINE_WIDTH: 0.297291
G1 F2496
M204 S6000
G1 X91.682 Y77.368 E.01492
; WIPE_START
G1 F17113.225
G1 X90.852 Y77.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.582 Y76.235 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.466496
G1 F2496
M204 S6000
G1 X91.858 Y76.059 E.00922
G1 X91.87 Y75.51 E.01548
G1 X91.833 Y75.305 E.00585
G2 X88.13 Y75.897 I-1.835 J.397 E.16039
G1 X88.147 Y76.061 E.00465
; LINE_WIDTH: 0.467789
G1 X88.413 Y76.234 E.00899
; WIPE_START
G1 F10381.763
G1 X88.147 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.1 Y77.631 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.3932
G1 F2496
M204 S6000
G1 X88.318 Y77.356 E.01938
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.250378
G1 F2496
M204 S6000
G1 X89.153 Y77.625 E.01226
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.13489
G1 F2496
M204 S6000
G1 X88.318 Y77.409 E.00565
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z4.92 F42000
G1 X86.21 Y106.174 Z4.92
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2496
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.489 Y100.24 Z4.92 F42000
G1 X80.039 Y82.377 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2496
M204 S5000
G1 X80.053 Y82.375 E.0003
G3 X79.917 Y82.392 I.017 J.689 E.09378
G1 X79.98 Y82.384 E.00143
M204 S250
G1 X79.637 Y82.503 F42000
G1 F2496
M204 S5000
G1 X79.654 Y82.486 E.00054
G3 X80.053 Y82.354 I.413 J.576 E.00954
G1 X80.107 Y82.355 E.00121
G3 X79.548 Y82.58 I-.039 J.708 E.08579
G1 X79.592 Y82.542 E.00129
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y82.486 E-.03198
G1 X79.778 Y82.417 E-.05383
G1 X79.912 Y82.371 E-.05375
G1 X80.053 Y82.354 E-.05411
G1 X80.107 Y82.355 E-.02049
G1 X80.228 Y82.371 E-.04653
G1 X80.363 Y82.417 E-.05384
G1 X80.485 Y82.487 E-.05372
G1 X80.591 Y82.581 E-.05383
G1 X80.677 Y82.694 E-.05381
G1 X80.738 Y82.821 E-.0538
G1 X80.773 Y82.959 E-.05381
G1 X80.78 Y83.1 E-.0538
G1 X80.738 Y83.308 E-.08055
G1 X80.69 Y83.408 E-.04214
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z4.92 F42000
G1 X85.01 Y99.29 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
M73 P61 R3
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/51
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.92 I1.206 J.166 P1  F42000
G1 X88.387 Y76.621 Z4.92
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2505
M204 S6000
G1 X88.571 Y76.891 E.00887
G2 X91.694 Y76.465 I1.428 J-1.194 E.10188
G1 X91.889 Y76.509 E.00541
G1 X91.889 Y77.839 E.03605
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.00539
G1 X88.355 Y76.57 E.00318
M204 S250
G1 X88.717 Y76.397 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X88.717 Y76.395 E.00006
G3 X89.819 Y74.251 I1.283 J-.696 E.07131
G1 X89.964 Y74.24 E.00365
G3 X88.88 Y76.634 I.036 J1.459 E.14828
G1 X88.751 Y76.446 E.00572
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.395 E-.02354
G1 X88.604 Y76.128 E-.10996
G1 X88.547 Y75.844 E-.11008
G1 X88.547 Y75.56 E-.10818
G1 X88.608 Y75.258 E-.11709
G1 X88.721 Y74.995 E-.10871
G1 X88.885 Y74.757 E-.10962
G1 X89.019 Y74.62 E-.07282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.349 Y76.748 Z5.08 F42000
G1 X101.49 Y78.24 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F2505
M204 S5000
G1 X101.49 Y77.733 E.01275
G1 X101.902 Y77.841 E.0107
G3 X102.51 Y78.695 I-.318 J.87 E.02802
G1 X102.51 Y105.305 E.66901
G3 X102.175 Y106.005 I-.954 J-.025 E.0201
G3 X101.49 Y106.261 I-.869 J-1.28 E.01857
G1 X101.49 Y105.76 E.01261
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.049 J-.913 E.03465
G1 X77.49 Y78.694 E.66903
G3 X78.395 Y77.79 I.92 J.016 E.03557
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.733 E-.194
G1 X101.902 Y77.841 E-.1617
G1 X102.14 Y77.967 E-.10274
G1 X102.244 Y78.056 E-.05169
G1 X102.356 Y78.193 E-.06724
G1 X102.457 Y78.393 E-.08515
G1 X102.496 Y78.543 E-.0591
G1 X102.505 Y78.644 E-.03838
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.928 Y77.728 Z5.08 F42000
G1 X92.29 Y77.41 Z5.08
G1 Z4.68
G1 E.8 F1800
G1 F2505
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I-.004 J1.299 E.05112
G1 X102.89 Y105.297 E.66855
G3 X101.664 Y106.588 I-1.297 J-.004 E.04933
G1 X78.405 Y106.59 E.58476
G3 X77.112 Y105.364 I.004 J-1.299 E.04937
G1 X77.11 Y78.705 E.67024
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
M73 P62 R3
G1 X87.718 Y75.41 E.05028
G3 X90.106 Y73.413 I2.29 J.312 E.08587
G3 X92.282 Y75.41 I-.115 J2.31 E.08055
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z4.68
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2505
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.659 Y77.649 Z5.08 F42000
G1 X90.895 Y77.631 Z5.08
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.438999
G1 F2505
M204 S6000
G1 X91.477 Y77.427 E.01629
G1 X91.682 Y76.979 E.01299
M204 S10000
G1 X91.682 Y77.368 F42000
; LINE_WIDTH: 0.298046
G1 F2505
M204 S6000
G1 X90.852 Y77.631 E.01496
M204 S10000
G1 X90.848 Y77.615 F42000
; LINE_WIDTH: 0.173061
G1 F2505
M204 S6000
G1 X91.682 Y77.396 E.00779
; WIPE_START
G1 F18000
G1 X90.848 Y77.615 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.583 Y76.235 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.466495
G1 F2505
M204 S6000
G1 X91.858 Y76.059 E.00921
G1 X91.87 Y75.51 E.01546
G1 X91.833 Y75.306 E.00585
G2 X88.13 Y75.897 I-1.835 J.398 E.16036
G1 X88.147 Y76.061 E.00465
; LINE_WIDTH: 0.46742
G1 X88.414 Y76.234 E.00897
; WIPE_START
G1 F10390.603
G1 X88.147 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.1 Y77.631 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.39267
G1 F2505
M204 S6000
G1 X88.318 Y77.356 E.01935
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.250044
G1 F2505
M204 S6000
G1 X89.153 Y77.625 E.01224
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.134552
G1 F2505
M204 S6000
G1 X88.318 Y77.409 E.00563
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2505
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z5.08 F42000
G1 X86.21 Y106.174 Z5.08
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2505
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.49 Y100.239 Z5.08 F42000
G1 X80.042 Y82.377 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2505
M204 S5000
G1 X80.053 Y82.375 E.00025
G3 X79.916 Y82.392 I.017 J.688 E.09369
G1 X79.982 Y82.384 E.00148
M204 S250
G1 X79.638 Y82.502 F42000
G1 F2505
M204 S5000
G1 X79.654 Y82.487 E.0005
G3 X80.053 Y82.354 I.413 J.576 E.00954
G1 X80.108 Y82.355 E.00123
G3 X79.548 Y82.58 I-.04 J.708 E.08576
G1 X79.593 Y82.541 E.00133
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y82.487 E-.03123
G1 X79.778 Y82.417 E-.05386
G1 X79.912 Y82.371 E-.05377
G1 X80.053 Y82.354 E-.05407
G1 X80.108 Y82.355 E-.02092
G1 X80.228 Y82.371 E-.04614
G1 X80.362 Y82.417 E-.05383
G1 X80.485 Y82.487 E-.05381
G1 X80.591 Y82.581 E-.05374
G1 X80.677 Y82.694 E-.05381
G1 X80.738 Y82.821 E-.05379
G1 X80.773 Y82.959 E-.05382
G1 X80.78 Y83.1 E-.05381
G1 X80.738 Y83.308 E-.08052
G1 X80.689 Y83.409 E-.04287
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2505
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z5.08 F42000
G1 X85.01 Y99.29 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2505
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/51
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.08 I1.206 J.166 P1  F42000
G1 X88.387 Y76.621 Z5.08
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2496
M204 S6000
G1 X88.571 Y76.891 E.00888
G2 X91.694 Y76.465 I1.428 J-1.194 E.10189
G1 X91.889 Y76.509 E.00541
G1 X91.889 Y77.839 E.03605
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.00539
G1 X88.355 Y76.57 E.00317
M204 S250
G1 X88.717 Y76.397 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X88.717 Y76.395 E.00005
G3 X89.819 Y74.251 I1.283 J-.696 E.07132
G1 X89.964 Y74.24 E.00365
G3 X88.88 Y76.634 I.036 J1.459 E.14828
G1 X88.751 Y76.446 E.00573
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.717 Y76.395 E-.02334
G1 X88.604 Y76.128 E-.11
G1 X88.547 Y75.844 E-.11007
G1 X88.547 Y75.559 E-.1083
G1 X88.6 Y75.283 E-.10679
G1 X88.688 Y75.058 E-.09183
G1 X88.84 Y74.813 E-.10951
G1 X89.02 Y74.621 E-.10017
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.35 Y76.748 Z5.24 F42000
G1 X101.49 Y78.24 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.49 Y77.733 E.01275
G1 X101.902 Y77.841 E.0107
G3 X102.51 Y78.694 I-.318 J.87 E.02801
G1 X102.51 Y105.307 E.66907
G3 X102.176 Y106.005 I-.954 J-.028 E.02004
G3 X101.49 Y106.261 I-.869 J-1.28 E.01858
G1 X101.49 Y105.76 E.01261
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
M73 P63 R3
G3 X77.49 Y105.305 I.047 J-.912 E.03467
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03557
G1 X86.01 Y77.79 E.19146
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.733 E-.19404
G1 X101.902 Y77.841 E-.16177
G1 X102.141 Y77.967 E-.10271
G1 X102.244 Y78.056 E-.05167
G1 X102.356 Y78.193 E-.06722
G1 X102.457 Y78.393 E-.08512
G1 X102.496 Y78.542 E-.05881
G1 X102.505 Y78.644 E-.03866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.928 Y77.728 Z5.24 F42000
G1 X92.29 Y77.41 Z5.24
G1 Z4.84
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I-.001 J1.296 E.05115
G1 X102.89 Y105.297 E.66855
G3 X101.666 Y106.588 I-1.299 J-.006 E.04927
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.011 J-1.307 E.04926
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.291 J-.004 E.0512
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.104 Y73.413 I2.298 J.323 E.08573
G3 X92.282 Y75.41 I-.114 J2.311 E.08059
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z4.84
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.682 Y77.396 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.173713
G1 F2496
M204 S6000
G1 X90.848 Y77.615 E.00783
M204 S10000
G1 X90.852 Y77.631 F42000
; LINE_WIDTH: 0.298622
G1 F2496
M204 S6000
G1 X91.682 Y77.368 E.015
; WIPE_START
G1 F17027.002
G1 X90.852 Y77.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.583 Y76.235 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.46642
G1 F2496
M204 S6000
G1 X91.858 Y76.059 E.00919
G1 X91.87 Y75.511 E.01543
G1 X91.833 Y75.307 E.00585
G2 X88.13 Y75.897 I-1.836 J.396 E.1604
G1 X88.147 Y76.061 E.00466
; LINE_WIDTH: 0.466969
G1 X88.413 Y76.234 E.00895
; WIPE_START
G1 F10401.437
G1 X88.147 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.1 Y77.631 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.392492
G1 F2496
M204 S6000
G1 X88.318 Y77.356 E.01934
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.249813
G1 F2496
M204 S6000
G1 X89.153 Y77.625 E.01223
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.134425
G1 F2496
M204 S6000
G1 X88.318 Y77.407 E.00562
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z5.24 F42000
G1 X86.21 Y106.174 Z5.24
G1 Z4.84
M73 P64 R3
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2496
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.49 Y100.239 Z5.24 F42000
G1 X80.044 Y82.376 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2496
M204 S5000
G1 X80.053 Y82.375 E.0002
G3 X79.917 Y82.392 I.017 J.688 E.09365
G1 X79.984 Y82.384 E.00153
M204 S250
G1 X79.64 Y82.501 F42000
G1 F2496
M204 S5000
G1 X79.654 Y82.486 E.00046
G3 X80.053 Y82.354 I.413 J.578 E.00954
G1 X80.109 Y82.355 E.00126
G3 X79.548 Y82.58 I-.041 J.709 E.08591
G1 X79.594 Y82.54 E.00138
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y82.486 E-.03055
G1 X79.778 Y82.417 E-.05388
G1 X79.912 Y82.371 E-.05374
G1 X80.053 Y82.354 E-.05405
G1 X80.109 Y82.355 E-.02132
G1 X80.228 Y82.371 E-.04576
G1 X80.363 Y82.417 E-.05383
G1 X80.485 Y82.487 E-.05378
G1 X80.591 Y82.581 E-.05376
G1 X80.677 Y82.694 E-.05381
G1 X80.738 Y82.822 E-.05385
G1 X80.773 Y82.959 E-.05377
G1 X80.78 Y83.1 E-.0538
G1 X80.759 Y83.24 E-.05378
G1 X80.711 Y83.373 E-.05388
G1 X80.686 Y83.409 E-.01644
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z5.24 F42000
G1 X85.01 Y99.29 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/51
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.24 I1.206 J.165 P1  F42000
G1 X88.374 Y76.604 Z5.24
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2496
M204 S6000
G1 X88.46 Y76.744 E.00445
G2 X91.694 Y76.465 I1.539 J-1.047 E.10689
G1 X91.889 Y76.509 E.00541
G1 X91.889 Y77.839 E.03605
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.00539
G1 X88.347 Y76.551 E.00262
M204 S250
G1 X88.717 Y76.395 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G3 X89.819 Y74.251 I1.283 J-.696 E.07131
G1 X89.964 Y74.24 E.00364
G3 X88.747 Y76.447 I.036 J1.459 E.15406
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.604 Y76.128 E-.13256
G1 X88.547 Y75.844 E-.11016
G1 X88.547 Y75.559 E-.1084
G1 X88.601 Y75.283 E-.10695
G1 X88.688 Y75.059 E-.09142
G1 X88.839 Y74.813 E-.10954
G1 X89.021 Y74.619 E-.10097
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.351 Y76.747 Z5.4 F42000
G1 X101.49 Y78.24 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.49 Y77.742 E.0125
G1 X101.822 Y77.817 E.00856
G3 X102.51 Y78.695 I-.226 J.885 E.03015
G1 X102.51 Y105.305 E.66901
G3 X102.176 Y106.005 I-.954 J-.026 E.02009
G3 X101.49 Y106.261 I-.867 J-1.275 E.01858
G1 X101.49 Y105.76 E.0126
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.353 Y106.209 E.19251
G3 X77.49 Y105.305 I.05 J-.912 E.03461
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.742 E-.19031
G1 X101.822 Y77.817 E-.12945
G1 X102.067 Y77.918 E-.10061
G1 X102.192 Y78.008 E-.05845
G1 X102.303 Y78.122 E-.06041
G1 X102.39 Y78.248 E-.05843
G1 X102.457 Y78.393 E-.0604
G1 X102.496 Y78.541 E-.05845
G1 X102.506 Y78.655 E-.04349
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.93 Y77.732 Z5.4 F42000
G1 X92.29 Y77.41 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.297 E.66855
G3 X101.666 Y106.588 I-1.294 J-.001 E.04932
G1 X78.405 Y106.59 E.5848
M73 P65 R3
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.291 J-.004 E.0512
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.101 Y73.413 I2.29 J.312 E.08575
G3 X92.282 Y75.41 I-.117 J2.317 E.08061
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.682 Y77.396 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.174049
G1 F2496
M204 S6000
G1 X90.848 Y77.615 E.00785
M204 S10000
G1 X90.852 Y77.631 F42000
; LINE_WIDTH: 0.29931
G1 F2496
M204 S6000
G1 X91.682 Y77.368 E.01503
; WIPE_START
G1 F16982.832
G1 X90.852 Y77.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.583 Y76.235 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.466463
G1 F2496
M204 S6000
G1 X91.858 Y76.059 E.00919
G1 X91.87 Y75.512 E.01542
G1 X91.833 Y75.307 E.00585
G2 X88.13 Y75.897 I-1.836 J.395 E.16043
G1 X88.147 Y76.061 E.00466
; LINE_WIDTH: 0.466683
G1 X88.413 Y76.234 E.00894
; WIPE_START
G1 F10408.32
G1 X88.147 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.1 Y77.631 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.392351
G1 F2496
M204 S6000
G1 X88.318 Y77.356 E.01934
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.249637
G1 F2496
M204 S6000
G1 X89.153 Y77.625 E.01222
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.134307
G1 F2496
M204 S6000
G1 X88.318 Y77.408 E.00562
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z5.4 F42000
G1 X86.21 Y106.174 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2496
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.491 Y100.239 Z5.4 F42000
G1 X80.046 Y82.376 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2496
M204 S5000
G1 X80.053 Y82.375 E.00015
G3 X79.916 Y82.392 I.017 J.688 E.09365
G1 X79.987 Y82.383 E.00159
M204 S250
G1 X79.641 Y82.5 F42000
G1 F2496
M204 S5000
G1 X79.654 Y82.487 E.00041
G3 X80.053 Y82.354 I.414 J.578 E.00954
G1 X80.11 Y82.355 E.00128
G3 X79.548 Y82.58 I-.042 J.709 E.08589
G1 X79.596 Y82.539 E.00142
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y82.487 E-.0298
G1 X79.778 Y82.416 E-.05393
G1 X79.912 Y82.371 E-.05373
G1 X80.053 Y82.354 E-.05403
G1 X80.11 Y82.355 E-.0217
G1 X80.362 Y82.417 E-.09881
G1 X80.485 Y82.487 E-.05374
G1 X80.591 Y82.581 E-.05376
G1 X80.677 Y82.694 E-.0539
G1 X80.738 Y82.821 E-.05378
G1 X80.773 Y82.959 E-.05385
G1 X80.78 Y83.1 E-.05376
G1 X80.759 Y83.24 E-.05376
G1 X80.711 Y83.373 E-.05379
G1 X80.686 Y83.413 E-.01767
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z5.4 F42000
G1 X85.01 Y99.29 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/51
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.4 I1.206 J.166 P1  F42000
G1 X88.386 Y76.62 Z5.4
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2496
M204 S6000
G1 X88.571 Y76.892 E.00892
G2 X91.695 Y76.465 I1.428 J-1.194 E.10188
G1 X91.889 Y76.509 E.00541
G1 X91.889 Y77.839 E.03605
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
M73 P66 R3
G1 X88.305 Y76.464 E.00539
G1 X88.355 Y76.569 E.00315
M204 S250
G1 X88.717 Y76.395 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G3 X89.819 Y74.251 I1.283 J-.696 E.07132
G1 X89.964 Y74.24 E.00365
G3 X88.747 Y76.447 I.036 J1.459 E.15405
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.604 Y76.128 E-.13265
G1 X88.547 Y75.844 E-.11017
G1 X88.547 Y75.559 E-.10849
G1 X88.608 Y75.259 E-.11617
G1 X88.721 Y74.996 E-.10893
G1 X88.884 Y74.758 E-.10969
G1 X89.02 Y74.619 E-.0739
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.35 Y76.747 Z5.56 F42000
G1 X101.49 Y78.24 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.49 Y77.743 E.01249
G1 X101.822 Y77.817 E.00856
G3 X102.51 Y78.695 I-.238 J.895 E.03008
G1 X102.51 Y105.305 E.66901
G3 X102.175 Y106.005 I-.954 J-.026 E.0201
G3 X101.49 Y106.261 I-.865 J-1.272 E.01857
G1 X101.49 Y105.76 E.0126
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.305 I.047 J-.912 E.03467
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.743 E-.19017
G1 X101.822 Y77.817 E-.12939
G1 X102.067 Y77.918 E-.10065
G1 X102.191 Y78.008 E-.05814
G1 X102.303 Y78.122 E-.06069
G1 X102.39 Y78.248 E-.05816
G1 X102.458 Y78.396 E-.06219
G1 X102.495 Y78.535 E-.0546
G1 X102.506 Y78.656 E-.04602
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.93 Y77.732 Z5.56 F42000
G1 X92.29 Y77.41 Z5.56
G1 Z5.16
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I-.004 J1.299 E.05112
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.294 J.002 E.04938
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.011 J-1.307 E.04926
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.293 J-.002 E.05118
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.099 Y73.413 I2.29 J.312 E.08569
M73 P67 R3
G3 X92.282 Y75.41 I-.116 J2.319 E.08066
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z5.16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.682 Y77.396 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.174635
G1 F2496
M204 S6000
G1 X90.848 Y77.615 E.00788
M204 S10000
G1 X90.853 Y77.631 F42000
; LINE_WIDTH: 0.300012
G1 F2496
M204 S6000
G1 X91.682 Y77.367 E.01506
; WIPE_START
G1 F16937.913
G1 X90.853 Y77.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.584 Y76.235 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.46634
G1 F2496
M204 S6000
G1 X91.858 Y76.059 E.00918
G1 X91.87 Y75.512 E.01539
G1 X91.833 Y75.308 E.00585
G2 X88.13 Y75.897 I-1.836 J.395 E.1604
G1 X88.147 Y76.061 E.00465
; LINE_WIDTH: 0.467038
G1 X88.413 Y76.234 E.00895
; WIPE_START
G1 F10399.772
G1 X88.147 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.101 Y77.631 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.392111
G1 F2496
M204 S6000
G1 X88.318 Y77.356 E.01934
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.249349
G1 F2496
M204 S6000
G1 X89.153 Y77.625 E.0122
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.134018
G1 F2496
M204 S6000
G1 X88.318 Y77.41 E.0056
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z5.56 F42000
G1 X86.21 Y106.174 Z5.56
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2496
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.491 Y100.239 Z5.56 F42000
G1 X80.048 Y82.376 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2496
M204 S5000
G1 X80.053 Y82.375 E.0001
G3 X79.917 Y82.392 I.017 J.687 E.09358
G1 X79.989 Y82.383 E.00163
M204 S250
G1 X79.643 Y82.498 F42000
G1 F2496
M204 S5000
G1 X79.654 Y82.487 E.00037
G3 X80.053 Y82.354 I.414 J.578 E.00954
G1 X80.111 Y82.355 E.0013
G3 X79.548 Y82.58 I-.043 J.709 E.08588
G1 X79.597 Y82.538 E.00146
; WIPE_START
G1 F12000
M204 S6000
G1 X79.654 Y82.487 E-.0291
G1 X79.778 Y82.417 E-.05392
G1 X79.912 Y82.371 E-.05378
G1 X80.053 Y82.354 E-.05399
G1 X80.111 Y82.355 E-.02201
G1 X80.362 Y82.417 E-.09847
G1 X80.485 Y82.487 E-.0538
G1 X80.591 Y82.581 E-.05387
G1 X80.677 Y82.694 E-.05377
G1 X80.738 Y82.821 E-.05374
G1 X80.773 Y82.959 E-.0538
G1 X80.78 Y83.1 E-.05384
G1 X80.738 Y83.308 E-.08058
G1 X80.686 Y83.415 E-.04532
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z5.56 F42000
G1 X85.01 Y99.29 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/51
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.56 I1.206 J.164 P1  F42000
G1 X88.355 Y76.568 Z5.56
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2496
M204 S6000
G1 X88.364 Y76.587 E.00056
G2 X91.695 Y76.465 I1.635 J-.889 E.11189
G1 X91.889 Y76.509 E.00541
G1 X91.889 Y77.839 E.03605
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.00539
G1 X88.329 Y76.514 E.00151
M204 S250
G1 X88.718 Y76.395 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G3 X89.819 Y74.251 I1.283 J-.696 E.07131
G1 X89.964 Y74.24 E.00365
G3 X88.747 Y76.447 I.036 J1.459 E.15406
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.604 Y76.129 E-.13265
G1 X88.547 Y75.844 E-.11013
G1 X88.547 Y75.559 E-.10863
G1 X88.601 Y75.281 E-.10733
G1 X88.688 Y75.059 E-.09063
G1 X88.839 Y74.814 E-.1095
G1 X89.021 Y74.619 E-.10113
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.35 Y76.747 Z5.72 F42000
G1 X101.49 Y78.24 Z5.72
G1 Z5.32
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.49 Y77.742 E.0125
G1 X101.823 Y77.817 E.00857
G3 X102.51 Y78.695 I-.252 J.905 E.03
G1 X102.51 Y105.305 E.66901
G3 X102.175 Y106.005 I-.954 J-.026 E.0201
G3 X101.49 Y106.261 I-.866 J-1.273 E.01857
G1 X101.49 Y105.76 E.01261
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.353 Y106.209 E.19249
G3 X77.49 Y105.308 I.059 J-.92 E.03445
G1 X77.49 Y78.695 E.6691
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
M73 P68 R3
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.742 E-.1903
G1 X101.823 Y77.817 E-.12954
G1 X102.07 Y77.92 E-.10193
G1 X102.187 Y78.004 E-.0544
G1 X102.306 Y78.124 E-.06451
G1 X102.387 Y78.242 E-.05438
G1 X102.458 Y78.396 E-.06445
G1 X102.495 Y78.534 E-.05435
G1 X102.506 Y78.655 E-.04615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.93 Y77.732 Z5.72 F42000
G1 X92.29 Y77.41 Z5.72
G1 Z5.32
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.003 J1.293 E.05119
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.298 J-.002 E.04935
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.364 I.001 J-1.296 E.0494
G1 X77.11 Y78.705 E.67025
G3 X78.405 Y77.41 I1.294 J-.001 E.05117
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.097 Y73.412 I2.299 J.323 E.08555
G3 X92.282 Y75.41 I-.107 J2.311 E.08077
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z5.32
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.682 Y77.395 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.175146
G1 F2496
M204 S6000
G1 X90.848 Y77.616 E.00791
M204 S10000
G1 X90.853 Y77.631 F42000
; LINE_WIDTH: 0.300395
G1 F2496
M204 S6000
G1 X91.682 Y77.368 E.01509
; WIPE_START
G1 F16913.567
G1 X90.853 Y77.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.584 Y76.235 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.466396
G1 F2496
M204 S6000
G1 X91.858 Y76.059 E.00917
G1 X91.87 Y75.513 E.01538
G1 X91.834 Y75.308 E.00586
G2 X88.13 Y75.897 I-1.836 J.394 E.16044
G1 X88.147 Y76.061 E.00465
; LINE_WIDTH: 0.466761
G1 X88.413 Y76.234 E.00894
; WIPE_START
G1 F10406.448
G1 X88.147 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.1 Y77.631 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.391869
G1 F2496
M204 S6000
G1 X88.318 Y77.356 E.01931
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.249191
G1 F2496
M204 S6000
G1 X89.153 Y77.625 E.01219
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.133658
G1 F2496
M204 S6000
G1 X88.318 Y77.408 E.00558
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z5.72 F42000
G1 X86.21 Y106.174 Z5.72
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2496
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
M73 P69 R3
G1 E-.04 F1800
M204 S10000
G1 X94.491 Y100.238 Z5.72 F42000
G1 X80.051 Y82.375 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2496
M204 S5000
G1 X80.053 Y82.375 E.00005
G3 X79.918 Y82.392 I.018 J.688 E.09367
G1 X79.991 Y82.383 E.00165
M204 S250
G1 X79.644 Y82.497 F42000
G1 F2496
M204 S5000
G1 X79.655 Y82.487 E.00033
G3 X80.053 Y82.354 I.414 J.576 E.00954
G1 X80.112 Y82.355 E.00132
G3 X79.548 Y82.581 I-.043 J.708 E.08568
G1 X79.599 Y82.537 E.0015
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y82.487 E-.02842
G1 X79.778 Y82.417 E-.05389
G1 X79.912 Y82.371 E-.05377
G1 X80.053 Y82.354 E-.05399
G1 X80.112 Y82.355 E-.02239
G1 X80.362 Y82.417 E-.0981
G1 X80.485 Y82.487 E-.05383
G1 X80.591 Y82.581 E-.05378
G1 X80.677 Y82.694 E-.05384
G1 X80.738 Y82.821 E-.05378
G1 X80.773 Y82.959 E-.0538
G1 X80.78 Y83.1 E-.05379
G1 X80.759 Y83.24 E-.05375
G1 X80.711 Y83.373 E-.05386
G1 X80.682 Y83.414 E-.01902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z5.72 F42000
G1 X85.01 Y99.29 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/51
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.72 I1.206 J.164 P1  F42000
G1 X88.355 Y76.568 Z5.72
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2496
M204 S6000
G1 X88.364 Y76.587 E.00058
G2 X91.695 Y76.465 I1.635 J-.89 E.11189
G1 X91.889 Y76.508 E.00541
G1 X91.889 Y77.839 E.03605
G1 X88.111 Y77.839 E.10239
G1 X88.111 Y76.508 E.03606
G1 X88.305 Y76.464 E.00539
G1 X88.329 Y76.514 E.00149
M204 S250
G1 X88.716 Y76.394 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X88.605 Y76.128 E.00725
G3 X89.819 Y74.251 I1.395 J-.429 E.06403
G1 X89.964 Y74.24 E.00365
G3 X88.746 Y76.446 I.036 J1.459 E.1541
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.128 E-.13199
M73 P69 R2
G1 X88.547 Y75.844 E-.11006
G1 X88.547 Y75.558 E-.10874
G1 X88.601 Y75.281 E-.10756
G1 X88.688 Y75.059 E-.09019
G1 X88.839 Y74.814 E-.10957
G1 X89.022 Y74.618 E-.1019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.351 Y76.747 Z5.88 F42000
G1 X101.49 Y78.24 Z5.88
G1 Z5.48
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.49 Y77.742 E.0125
G1 X101.823 Y77.817 E.00857
G3 X102.51 Y78.692 I-.252 J.905 E.02994
G1 X102.51 Y105.305 E.66907
G3 X102.175 Y106.005 I-.954 J-.026 E.0201
G3 X101.49 Y106.261 I-.865 J-1.271 E.01857
G1 X101.49 Y105.76 E.01261
G1 X86.01 Y105.76 E.38919
G1 X86.01 Y106.21 E.01131
G1 X78.355 Y106.209 E.19245
G3 X77.49 Y105.308 I.057 J-.92 E.03449
G1 X77.49 Y78.695 E.6691
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X86.01 Y77.79 E.19145
G1 X86.01 Y78.24 E.01131
G1 X101.43 Y78.24 E.38768
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.49 Y77.742 E-.19033
G1 X101.823 Y77.817 E-.12956
G1 X102.071 Y77.92 E-.102
G1 X102.186 Y78.003 E-.05403
G1 X102.306 Y78.124 E-.06478
G1 X102.386 Y78.242 E-.05405
G1 X102.457 Y78.393 E-.06336
G1 X102.501 Y78.568 E-.06886
G1 X102.507 Y78.655 E-.03303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.931 Y77.732 Z5.88 F42000
G1 X92.29 Y77.41 Z5.88
G1 Z5.48
G1 E.8 F1800
G1 F2496
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.002 J1.294 E.05118
G1 X102.89 Y105.297 E.66855
G3 X101.666 Y106.588 I-1.307 J-.014 E.0492
G1 X78.405 Y106.59 E.5848
M73 P70 R2
G3 X77.112 Y105.365 I-.002 J-1.294 E.04939
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.291 J-.004 E.0512
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.094 Y73.412 I2.29 J.312 E.08558
G3 X92.282 Y75.41 I-.104 J2.311 E.08083
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.09 Y77.825
G1 Z5.48
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X101.29 Y77.825 E.2575
; WIPE_START
G1 F10480.96
G1 X99.29 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.682 Y77.396 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.17549
G1 F2496
M204 S6000
G1 X90.848 Y77.615 E.00793
M204 S10000
G1 X90.853 Y77.631 F42000
; LINE_WIDTH: 0.301042
G1 F2496
M204 S6000
G1 X91.682 Y77.367 E.01511
; WIPE_START
G1 F16872.503
G1 X90.853 Y77.631 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.584 Y76.234 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.466329
G1 F2496
M204 S6000
G1 X91.858 Y76.059 E.00917
G1 X91.87 Y75.513 E.01536
G1 X91.834 Y75.309 E.00585
G2 X88.13 Y75.897 I-1.836 J.395 E.16038
G1 X88.147 Y76.061 E.00465
; LINE_WIDTH: 0.466345
G1 X88.413 Y76.234 E.00893
; WIPE_START
G1 F10416.449
G1 X88.147 Y76.061 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.1 Y77.631 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.391436
G1 F2496
M204 S6000
G1 X88.318 Y77.356 E.01929
M204 S10000
G1 X88.318 Y77.377 F42000
; LINE_WIDTH: 0.2487
G1 F2496
M204 S6000
G1 X89.153 Y77.625 E.01216
M204 S10000
G1 X89.155 Y77.613 F42000
; LINE_WIDTH: 0.133401
G1 F2496
M204 S6000
G1 X88.318 Y77.409 E.00556
M204 S10000
G1 X87.91 Y77.825 F42000
; LINE_WIDTH: 0.463686
G1 F2496
M204 S6000
G1 X86.21 Y77.825 E.04758
; WIPE_START
G1 F10480.96
G1 X87.91 Y77.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.453 Y85.443 Z5.88 F42000
G1 X86.21 Y106.174 Z5.88
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.462493
G1 F2496
M204 S6000
G1 X101.29 Y106.174 E.42089
; WIPE_START
G1 F10510.173
G1 X99.29 Y106.174 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.492 Y100.238 Z5.88 F42000
G1 X80.053 Y82.375 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2496
M204 S5000
G3 X79.917 Y82.392 I.017 J.688 E.09374
G1 X79.993 Y82.383 E.00173
M204 S250
G1 X79.645 Y82.496 F42000
G1 F2496
M204 S5000
G1 X79.655 Y82.487 E.00029
G3 X80.053 Y82.354 I.414 J.578 E.00953
G1 X80.113 Y82.355 E.00134
G3 X79.548 Y82.58 I-.044 J.709 E.08583
G1 X79.6 Y82.535 E.00154
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y82.487 E-.02779
G1 X79.778 Y82.417 E-.0538
G1 X79.912 Y82.371 E-.05375
G1 X80.053 Y82.354 E-.05402
G1 X80.113 Y82.355 E-.02278
G1 X80.362 Y82.417 E-.09775
G1 X80.485 Y82.487 E-.05375
G1 X80.591 Y82.581 E-.05387
G1 X80.677 Y82.694 E-.05383
G1 X80.738 Y82.821 E-.05376
G1 X80.773 Y82.959 E-.05379
G1 X80.78 Y83.1 E-.05381
G1 X80.738 Y83.308 E-.0805
G1 X80.685 Y83.419 E-.04681
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.01 Y84.71 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.59 Y84.71 E.01458
G1 X85.59 Y86.29 E.03972
G1 X85.01 Y86.29 E.01458
G1 X85.01 Y84.77 E.03822
M204 S10000
G1 X85.3 Y84.91 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y86.089 E.01379
; WIPE_START
G1 F18000
G1 X85.3 Y84.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.146 Y92.541 Z5.88 F42000
G1 X85.01 Y99.29 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2496
M204 S5000
G1 X85.01 Y97.71 E.03972
G1 X85.59 Y97.71 E.01458
G1 X85.59 Y99.29 E.03972
G1 X85.07 Y99.29 E.01307
M204 S10000
G1 X85.3 Y99.089 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213686
G1 F2496
M204 S6000
G1 X85.3 Y97.91 E.01379
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X85.3 Y99.089 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/51
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.88 I1.206 J.164 P1  F42000
G1 X88.354 Y76.567 Z5.88
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2032
M204 S6000
G1 X88.364 Y76.587 E.0006
G2 X89.232 Y77.393 I1.648 J-.906 E.03264
G1 X89.189 Y77.589 E.00545
G1 X88.111 Y77.589 E.02922
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.328 Y76.513 E.00148
M204 S250
G1 X88.716 Y76.394 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2032
M204 S5000
G1 X88.605 Y76.128 E.00723
G3 X89.819 Y74.251 I1.395 J-.43 E.06403
G1 X89.964 Y74.24 E.00365
G3 X88.746 Y76.445 I.036 J1.459 E.15411
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.128 E-.13173
G1 X88.547 Y75.844 E-.11011
G1 X88.547 Y75.558 E-.10881
G1 X88.601 Y75.28 E-.10763
G1 X88.688 Y75.06 E-.09004
G1 X88.839 Y74.814 E-.10948
G1 X89.022 Y74.618 E-.10222
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2032
M204 S6000
G1 X90.808 Y77.589 E.02931
G1 X90.762 Y77.397 E.00534
G2 X91.695 Y76.465 I-.826 J-1.758 E.03646
G1 X91.889 Y76.508 E.00541
G1 X91.889 Y77.529 E.02765
; WIPE_START
M73 P71 R2
G1 F10826.06
G1 X90.808 Y77.589 E-.41161
G1 X90.762 Y77.397 E-.07486
G1 X91.076 Y77.218 E-.13723
G1 X91.347 Y76.983 E-.1363
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.956 Y77.583 Z6.04 F42000
G1 X101.575 Y77.79 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2032
M204 S5000
G1 X101.605 Y77.79 E.00075
G3 X102.51 Y78.695 I-.019 J.924 E.03554
G1 X102.51 Y105.305 E.66901
G3 X101.605 Y106.21 I-.923 J-.017 E.03556
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.305 I.017 J-.923 E.03555
G1 X77.49 Y78.694 E.66903
G3 X78.395 Y77.79 I.92 J.016 E.03557
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.515 Y77.79 E.23193
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y77.79 E-.03409
G1 X101.792 Y77.81 E-.07169
G1 X101.988 Y77.876 E-.0786
G1 X102.155 Y77.978 E-.07407
G1 X102.242 Y78.054 E-.04398
G1 X102.423 Y78.311 E-.11934
G1 X102.495 Y78.533 E-.08873
G1 X102.51 Y78.695 E-.06179
G1 X102.51 Y79.189 E-.18772
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.991 Y77.88 Z6.04 F42000
G1 X92.29 Y77.41 Z6.04
G1 Z5.64
G1 E.8 F1800
G1 F2032
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.297 E.66855
G3 X101.666 Y106.588 I-1.303 J-.009 E.04924
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.009 J-1.305 E.04928
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.294 J-.002 E.05118
G1 X87.71 Y77.41 E.23393
M73 P72 R2
G1 X87.718 Y75.41 E.05028
G3 X90.095 Y73.412 I2.298 J.322 E.08552
G3 X92.282 Y75.41 I-.104 J2.31 E.08082
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z5.64
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.170925
G1 F2032
M204 S6000
G1 X91.259 Y77.367 E.00402
M204 S10000
G1 X91.502 Y77.381 F42000
; LINE_WIDTH: 0.244419
G1 F2032
M204 S6000
G1 X91.671 Y76.961 E.00621
M204 S10000
G1 X91.665 Y76.959 F42000
; LINE_WIDTH: 0.126935
G1 F2032
M204 S6000
G1 X91.514 Y77.381 E.00271
M204 S10000
G1 X90.59 Y77.537 F42000
; LINE_WIDTH: 0.482616
G1 F2032
M204 S6000
G3 X89.407 Y77.53 I-.566 J-4.34 E.03467
M204 S10000
G1 X88.413 Y76.234 F42000
; LINE_WIDTH: 0.465953
G1 F2032
M204 S6000
G1 X88.148 Y76.062 E.00891
; LINE_WIDTH: 0.466195
G1 X88.13 Y75.897 E.00466
G3 X91.834 Y75.309 I1.868 J-.194 E.1604
G1 X91.871 Y75.514 E.00585
G1 X91.858 Y76.059 E.01534
G1 X91.585 Y76.235 E.00915
; WIPE_START
G1 F10420.08
G1 X91.858 Y76.059 E-.12356
G1 X91.871 Y75.514 E-.20702
G1 X91.834 Y75.309 E-.07897
G1 X91.727 Y74.97 E-.13505
G1 X91.551 Y74.648 E-.13972
G1 X91.423 Y74.495 E-.07567
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.151 Y78.843 Z6.04 F42000
G1 X80.055 Y82.375 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2032
M204 S5000
G1 X80.19 Y82.385 E.00302
G3 X79.916 Y82.392 I-.12 J.677 E.09056
G1 X79.996 Y82.382 E.00179
M204 S250
G1 X79.647 Y82.495 F42000
G1 F2032
M204 S5000
G1 X79.655 Y82.487 E.00025
G3 X80.053 Y82.354 I.414 J.576 E.00954
G1 X80.114 Y82.355 E.00137
G3 X79.549 Y82.581 I-.045 J.708 E.08564
G1 X79.601 Y82.534 E.00157
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y82.487 E-.02704
G1 X79.778 Y82.417 E-.05388
G1 X79.912 Y82.371 E-.05376
G1 X80.053 Y82.354 E-.05398
G1 X80.114 Y82.355 E-.02321
G1 X80.363 Y82.417 E-.09738
G1 X80.485 Y82.487 E-.0538
G1 X80.591 Y82.581 E-.05382
G1 X80.677 Y82.694 E-.05375
G1 X80.738 Y82.821 E-.0538
G1 X80.773 Y82.959 E-.05382
G1 X80.78 Y83.1 E-.05376
G1 X80.759 Y83.24 E-.0538
G1 X80.711 Y83.373 E-.05387
G1 X80.683 Y83.419 E-.02034
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/51
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.04 I.811 J.908 P1  F42000
G1 X88.354 Y76.567 Z6.04
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X88.364 Y76.587 E.00062
G2 X89.233 Y77.404 I1.837 J-1.083 E.03277
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.02907
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.328 Y76.512 E.00146
M204 S250
G1 X88.715 Y76.393 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X88.605 Y76.128 E.00721
G3 X89.819 Y74.251 I1.395 J-.43 E.06403
G1 X89.964 Y74.24 E.00365
G3 X88.746 Y76.445 I.036 J1.459 E.15413
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.128 E-.13143
G1 X88.547 Y75.844 E-.11019
G1 X88.547 Y75.558 E-.10889
G1 X88.607 Y75.262 E-.11491
G1 X88.72 Y74.997 E-.10929
G1 X88.884 Y74.758 E-.10991
G1 X89.022 Y74.617 E-.07537
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X90.808 Y77.589 E.02931
G1 X90.762 Y77.397 E.00534
G2 X91.695 Y76.465 I-.825 J-1.758 E.03646
G1 X91.889 Y76.508 E.00541
G1 X91.889 Y77.529 E.02765
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41161
G1 X90.762 Y77.397 E-.07485
G1 X91.076 Y77.218 E-.13734
G1 X91.347 Y76.983 E-.1362
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.956 Y77.583 Z6.2 F42000
G1 X101.579 Y77.79 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X101.605 Y77.79 E.00064
G3 X102.51 Y78.692 I-.02 J.925 E.03548
G1 X102.51 Y105.305 E.66907
G3 X101.605 Y106.21 I-.922 J-.017 E.03556
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.305 I.021 J-.926 E.03551
G1 X77.49 Y78.694 E.66903
G3 X78.395 Y77.79 I.92 J.016 E.03557
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
M73 P73 R2
G1 X92.29 Y77.79 E.00503
G1 X101.519 Y77.79 E.23204
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y77.79 E-.03244
G1 X101.792 Y77.81 E-.07138
G1 X101.988 Y77.876 E-.07883
G1 X102.154 Y77.977 E-.07385
G1 X102.242 Y78.054 E-.04433
G1 X102.423 Y78.311 E-.11926
G1 X102.483 Y78.478 E-.06762
G1 X102.51 Y78.692 E-.08196
G1 X102.51 Y79.193 E-.19033
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.991 Y77.881 Z6.2 F42000
G1 X92.29 Y77.41 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F2029
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I-.003 J1.299 E.05112
G1 X102.89 Y105.295 E.6685
G3 X101.666 Y106.588 I-1.294 J.001 E.04938
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.092 Y73.412 I2.298 J.322 E.08545
G3 X92.282 Y75.41 I-.101 J2.31 E.08089
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.209
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17166
G1 F2029
M204 S6000
G1 X91.259 Y77.366 E.00404
M204 S10000
G1 X91.502 Y77.381 F42000
; LINE_WIDTH: 0.243495
G1 F2029
M204 S6000
G1 X91.671 Y76.961 E.00618
M204 S10000
G1 X91.665 Y76.958 F42000
; LINE_WIDTH: 0.12745
G1 F2029
M204 S6000
G1 X91.515 Y77.381 E.00272
M204 S10000
G1 X90.59 Y77.537 F42000
; LINE_WIDTH: 0.482579
G1 F2029
M204 S6000
G3 X89.407 Y77.531 I-.566 J-4.341 E.03467
M204 S10000
G1 X88.413 Y76.234 F42000
; LINE_WIDTH: 0.465662
G1 F2029
M204 S6000
G1 X88.148 Y76.062 E.0089
; LINE_WIDTH: 0.466204
G1 X88.13 Y75.897 E.00466
G3 X91.834 Y75.31 I1.868 J-.194 E.16041
G1 X91.871 Y75.515 E.00586
G1 X91.858 Y76.058 E.01531
G1 X91.585 Y76.234 E.00915
; WIPE_START
G1 F10419.858
G1 X91.858 Y76.058 E-.12352
G1 X91.871 Y75.515 E-.20671
G1 X91.834 Y75.31 E-.07912
G1 X91.727 Y74.97 E-.13517
G1 X91.548 Y74.641 E-.14247
G1 X91.424 Y74.494 E-.07301
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.152 Y78.843 Z6.2 F42000
G1 X80.057 Y82.375 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2029
M204 S5000
G1 X80.19 Y82.385 E.00297
G3 X79.917 Y82.392 I-.12 J.677 E.09057
G1 X79.998 Y82.382 E.00183
M204 S250
G1 X79.648 Y82.494 F42000
G1 F2029
M204 S5000
G1 X79.655 Y82.487 E.00021
G3 X80.053 Y82.354 I.414 J.577 E.00953
G1 X80.115 Y82.355 E.00139
G3 X79.548 Y82.581 I-.046 J.709 E.08579
G1 X79.603 Y82.533 E.00162
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y82.487 E-.0264
G1 X79.778 Y82.416 E-.05389
G1 X79.912 Y82.371 E-.05375
G1 X80.053 Y82.354 E-.05392
G1 X80.115 Y82.355 E-.02363
G1 X80.363 Y82.417 E-.09705
G1 X80.485 Y82.487 E-.05371
G1 X80.591 Y82.581 E-.05384
G1 X80.677 Y82.694 E-.0538
G1 X80.738 Y82.822 E-.05381
G1 X80.773 Y82.959 E-.05382
G1 X80.78 Y83.1 E-.05377
G1 X80.759 Y83.24 E-.0538
G1 X80.711 Y83.373 E-.05376
G1 X80.679 Y83.419 E-.02107
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/51
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.2 I.811 J.908 P1  F42000
G1 X88.354 Y76.566 Z6.2
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X88.364 Y76.588 E.00065
G2 X89.234 Y77.404 I1.838 J-1.085 E.03277
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.02908
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.328 Y76.512 E.00144
M204 S250
G1 X88.715 Y76.392 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X88.605 Y76.128 E.00719
G3 X89.819 Y74.251 I1.395 J-.43 E.06403
G1 X89.964 Y74.24 E.00365
G3 X88.745 Y76.444 I.036 J1.459 E.15414
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.128 E-.1312
M73 P74 R2
G1 X88.547 Y75.845 E-.11015
G1 X88.547 Y75.558 E-.10901
G1 X88.607 Y75.262 E-.11469
G1 X88.72 Y74.997 E-.10939
G1 X88.884 Y74.758 E-.10995
G1 X89.023 Y74.616 E-.07561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.397 E.00534
G2 X91.695 Y76.465 I-.825 J-1.757 E.03647
G1 X91.889 Y76.508 E.0054
G1 X91.889 Y77.529 E.02766
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.4116
G1 X90.762 Y77.397 E-.07483
G1 X91.077 Y77.218 E-.13773
G1 X91.347 Y76.983 E-.13585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.956 Y77.583 Z6.36 F42000
G1 X101.584 Y77.79 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X101.605 Y77.79 E.00053
G3 X102.51 Y78.692 I-.02 J.925 E.03548
G1 X102.51 Y105.305 E.66908
G3 X101.605 Y106.21 I-.922 J-.017 E.03557
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.308 I.021 J-.926 E.03544
G1 X77.49 Y78.695 E.6691
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.524 Y77.79 E.23215
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y77.79 E-.0308
G1 X101.791 Y77.81 E-.07107
G1 X101.988 Y77.876 E-.07924
G1 X102.153 Y77.977 E-.07348
G1 X102.242 Y78.054 E-.04453
G1 X102.423 Y78.311 E-.11933
G1 X102.483 Y78.478 E-.06765
G1 X102.51 Y78.692 E-.08193
G1 X102.51 Y79.197 E-.19197
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.992 Y77.882 Z6.36 F42000
G1 X92.29 Y77.41 Z6.36
G1 Z5.96
G1 E.8 F1800
G1 F2029
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.002 J1.294 E.05118
G1 X102.89 Y105.297 E.66855
G3 X101.666 Y106.588 I-1.299 J-.006 E.04927
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.011 J-1.307 E.04926
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
M73 P75 R2
G1 X87.718 Y75.41 E.05028
G3 X90.09 Y73.412 I2.298 J.321 E.0854
G3 X92.282 Y75.41 I-.099 J2.311 E.08094
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z5.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.172441
G1 F2029
M204 S6000
G1 X91.259 Y77.366 E.00406
M204 S10000
G1 X91.502 Y77.381 F42000
; LINE_WIDTH: 0.243318
G1 F2029
M204 S6000
G1 X91.671 Y76.961 E.00617
M204 S10000
G1 X91.665 Y76.958 F42000
; LINE_WIDTH: 0.128219
G1 F2029
M204 S6000
G1 X91.515 Y77.381 E.00274
M204 S10000
G1 X90.59 Y77.537 F42000
; LINE_WIDTH: 0.482569
G1 F2029
M204 S6000
G3 X89.407 Y77.53 I-.566 J-4.328 E.03466
M204 S10000
G1 X88.413 Y76.234 F42000
; LINE_WIDTH: 0.466171
G1 F2029
M204 S6000
G1 X88.147 Y76.061 E.00892
; LINE_WIDTH: 0.46626
G1 X88.13 Y75.897 E.00465
G3 X91.834 Y75.31 I1.868 J-.193 E.1604
G1 X91.871 Y75.515 E.00587
G1 X91.858 Y76.058 E.0153
G1 X91.585 Y76.234 E.00915
; WIPE_START
G1 F10418.505
G1 X91.858 Y76.058 E-.12346
G1 X91.871 Y75.515 E-.2065
G1 X91.834 Y75.31 E-.07916
G1 X91.728 Y74.97 E-.13524
G1 X91.548 Y74.641 E-.14251
G1 X91.424 Y74.494 E-.07314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.152 Y78.844 Z6.36 F42000
G1 X80.059 Y82.376 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2029
M204 S5000
G1 X80.19 Y82.385 E.00292
G3 X79.917 Y82.392 I-.12 J.679 E.09077
G1 X80 Y82.382 E.00188
M204 S250
G1 X79.649 Y82.492 F42000
G1 F2029
M204 S5000
G1 X79.655 Y82.487 E.00017
G3 X80.053 Y82.354 I.414 J.576 E.00953
G1 X80.116 Y82.355 E.00141
G3 X79.549 Y82.581 I-.047 J.708 E.0856
G1 X79.604 Y82.532 E.00165
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y82.487 E-.02574
G1 X79.778 Y82.417 E-.0538
G1 X79.912 Y82.371 E-.05378
G1 X80.053 Y82.354 E-.05394
G1 X80.116 Y82.355 E-.024
G1 X80.362 Y82.417 E-.09664
G1 X80.485 Y82.487 E-.05383
G1 X80.591 Y82.581 E-.05367
G1 X80.677 Y82.694 E-.05391
G1 X80.738 Y82.822 E-.0538
G1 X80.773 Y82.959 E-.0538
G1 X80.78 Y83.1 E-.05378
G1 X80.738 Y83.308 E-.08053
G1 X80.682 Y83.423 E-.04879
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/51
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.36 I.806 J.912 P1  F42000
G1 X88.384 Y76.617 Z6.36
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X88.578 Y76.888 E.00904
G2 X89.234 Y77.404 I1.623 J-1.385 E.02276
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.02908
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.353 Y76.565 E.00305
M204 S250
G1 X88.715 Y76.392 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X88.605 Y76.129 E.00716
G3 X89.819 Y74.251 I1.395 J-.43 E.06404
G1 X89.964 Y74.24 E.00365
G3 X88.745 Y76.443 I.036 J1.459 E.15416
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.129 E-.13084
G1 X88.547 Y75.845 E-.11022
G1 X88.547 Y75.557 E-.10915
G1 X88.607 Y75.262 E-.11442
G1 X88.72 Y74.998 E-.10935
G1 X88.883 Y74.759 E-.11007
G1 X89.023 Y74.616 E-.07595
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X90.808 Y77.589 E.02931
G1 X90.762 Y77.397 E.00534
G2 X91.695 Y76.464 I-.824 J-1.757 E.03647
G1 X91.889 Y76.508 E.0054
G1 X91.889 Y77.529 E.02766
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41161
G1 X90.762 Y77.397 E-.07482
G1 X91.077 Y77.217 E-.13796
G1 X91.347 Y76.983 E-.13561
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.956 Y77.582 Z6.52 F42000
G1 X101.588 Y77.79 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X101.605 Y77.79 E.00042
G3 X102.51 Y78.695 I-.02 J.925 E.03554
G1 X102.51 Y105.305 E.66901
G3 X101.605 Y106.21 I-.922 J-.017 E.03557
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.307 I.021 J-.926 E.03546
G1 X77.49 Y78.695 E.66907
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X87.71 Y77.79 E.23419
M73 P76 R2
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.528 Y77.79 E.23226
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.605 Y77.79 E-.0292
G1 X101.79 Y77.809 E-.07078
G1 X101.988 Y77.876 E-.07957
G1 X102.153 Y77.976 E-.07307
G1 X102.242 Y78.054 E-.04497
G1 X102.423 Y78.311 E-.1193
G1 X102.494 Y78.53 E-.08776
G1 X102.51 Y78.695 E-.06274
G1 X102.51 Y79.202 E-.19261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.992 Y77.883 Z6.52 F42000
G1 X92.29 Y77.41 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F2029
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.004 J1.291 E.0512
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.299 J-.004 E.04933
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.011 J-1.307 E.04926
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.088 Y73.412 I2.298 J.321 E.08534
G3 X92.282 Y75.41 I-.097 J2.311 E.081
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.172847
G1 F2029
M204 S6000
G1 X91.259 Y77.367 E.00407
M204 S10000
G1 X91.502 Y77.381 F42000
; LINE_WIDTH: 0.242383
G1 F2029
M204 S6000
G1 X91.671 Y76.961 E.00615
M204 S10000
G1 X91.665 Y76.958 F42000
; LINE_WIDTH: 0.12843
G1 F2029
M204 S6000
G1 X91.515 Y77.381 E.00275
M204 S10000
G1 X90.589 Y77.537 F42000
; LINE_WIDTH: 0.482564
G1 F2029
M204 S6000
G3 X89.407 Y77.53 I-.567 J-4.328 E.03465
M204 S10000
G1 X88.414 Y76.234 F42000
; LINE_WIDTH: 0.465656
G1 F2029
M204 S6000
G1 X88.148 Y76.062 E.0089
; LINE_WIDTH: 0.46617
G1 X88.13 Y75.897 E.00465
G3 X91.834 Y75.311 I1.868 J-.195 E.16044
G1 X91.871 Y75.516 E.00586
G1 X91.858 Y76.058 E.01528
G1 X91.586 Y76.234 E.00913
; WIPE_START
G1 F10420.68
G1 X91.858 Y76.058 E-.12327
G1 X91.871 Y75.516 E-.20622
G1 X91.834 Y75.311 E-.07913
G1 X91.729 Y74.976 E-.13338
G1 X91.548 Y74.642 E-.14446
G1 X91.424 Y74.493 E-.07354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.153 Y78.844 Z6.52 F42000
G1 X80.062 Y82.376 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2029
M204 S5000
G1 X80.19 Y82.385 E.00286
G3 X79.918 Y82.392 I-.119 J.678 E.09068
G1 X80.002 Y82.381 E.0019
M204 S250
G1 X79.65 Y82.491 F42000
G1 F2029
M204 S5000
G1 X79.655 Y82.487 E.00014
G3 X80.053 Y82.354 I.414 J.577 E.00953
G1 X80.117 Y82.355 E.00143
G3 X79.549 Y82.581 I-.047 J.709 E.08576
G1 X79.605 Y82.531 E.00169
; CHANGE_LAYER
; Z_HEIGHT: 6.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y82.487 E-.0251
G1 X79.778 Y82.417 E-.05384
G1 X79.912 Y82.371 E-.05375
G1 X80.053 Y82.354 E-.05392
G1 X80.117 Y82.355 E-.02433
G1 X80.362 Y82.417 E-.09629
G1 X80.485 Y82.487 E-.05381
G1 X80.591 Y82.581 E-.05381
G1 X80.677 Y82.694 E-.05379
G1 X80.738 Y82.822 E-.05386
G1 X80.773 Y82.959 E-.05378
G1 X80.78 Y83.1 E-.05384
G1 X80.759 Y83.24 E-.05371
G1 X80.711 Y83.373 E-.05382
G1 X80.68 Y83.423 E-.02235
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/51
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.52 I.806 J.912 P1  F42000
G1 X88.383 Y76.616 Z6.52
G1 Z6.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X88.578 Y76.888 E.00907
G2 X89.234 Y77.404 I1.622 J-1.385 E.02275
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.02908
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.353 Y76.565 E.00302
M204 S250
G1 X88.714 Y76.391 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X88.605 Y76.129 E.00714
G3 X89.819 Y74.251 I1.395 J-.43 E.06404
G1 X89.964 Y74.24 E.00366
M73 P77 R2
G3 X88.745 Y76.443 I.036 J1.459 E.15418
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.129 E-.13056
G1 X88.547 Y75.844 E-.11025
G1 X88.547 Y75.557 E-.1092
G1 X88.607 Y75.263 E-.11409
G1 X88.719 Y74.998 E-.10944
G1 X88.883 Y74.759 E-.11009
G1 X89.024 Y74.615 E-.07636
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z6.68 F42000
G1 Z6.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X90.808 Y77.589 E.02931
G1 X90.762 Y77.397 E.00533
G2 X91.695 Y76.464 I-.824 J-1.756 E.03648
G1 X91.889 Y76.508 E.0054
G1 X91.889 Y77.529 E.02766
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.4116
G1 X90.762 Y77.397 E-.0748
G1 X91.078 Y77.217 E-.1383
G1 X91.347 Y76.983 E-.13531
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.956 Y77.582 Z6.68 F42000
G1 X101.62 Y77.791 Z6.68
G1 Z6.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X101.789 Y77.812 E.00426
G3 X102.51 Y78.695 I-.204 J.902 E.03088
G1 X102.51 Y105.305 E.66901
G3 X101.605 Y106.21 I-.922 J-.017 E.03557
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.305 I.015 J-.92 E.03558
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.56 Y77.79 E.23307
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.789 Y77.812 E-.08715
G1 X101.989 Y77.876 E-.07981
G1 X102.152 Y77.976 E-.07277
G1 X102.242 Y78.054 E-.04528
G1 X102.423 Y78.31 E-.11915
G1 X102.494 Y78.529 E-.08752
G1 X102.51 Y78.695 E-.06307
G1 X102.51 Y79.235 E-.20525
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.996 Y77.893 Z6.68 F42000
G1 X92.29 Y77.41 Z6.68
G1 Z6.28
G1 E.8 F1800
G1 F2029
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.299 J-.004 E.04933
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.364 I-.002 J-1.294 E.04941
G1 X77.11 Y78.705 E.67025
M73 P78 R2
G3 X78.405 Y77.41 I1.299 J.004 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.086 Y73.412 I2.298 J.321 E.08529
G3 X92.282 Y75.41 I-.095 J2.311 E.08106
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z6.28
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.173478
G1 F2029
M204 S6000
G1 X91.259 Y77.367 E.00409
M204 S10000
G1 X91.503 Y77.381 F42000
; LINE_WIDTH: 0.241767
G1 F2029
M204 S6000
G1 X91.671 Y76.96 E.00613
M204 S10000
G1 X91.665 Y76.958 F42000
; LINE_WIDTH: 0.129017
G1 F2029
M204 S6000
G1 X91.515 Y77.381 E.00277
M204 S10000
G1 X90.589 Y77.537 F42000
; LINE_WIDTH: 0.482563
G1 F2029
M204 S6000
G3 X89.407 Y77.531 I-.567 J-4.329 E.03465
M204 S10000
G1 X88.413 Y76.234 F42000
; LINE_WIDTH: 0.4654
G1 F2029
M204 S6000
G1 X88.148 Y76.062 E.00889
; LINE_WIDTH: 0.466138
G1 X88.13 Y75.897 E.00466
G3 X91.834 Y75.311 I1.868 J-.194 E.16044
G1 X91.871 Y75.516 E.00587
G1 X91.858 Y76.058 E.01526
G1 X91.586 Y76.234 E.00913
; WIPE_START
G1 F10421.439
G1 X91.858 Y76.058 E-.12322
G1 X91.871 Y75.516 E-.20598
G1 X91.834 Y75.311 E-.07919
G1 X91.728 Y74.971 E-.13562
G1 X91.548 Y74.641 E-.14259
G1 X91.423 Y74.493 E-.0734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.153 Y78.845 Z6.68 F42000
G1 X80.064 Y82.376 Z6.68
G1 Z6.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2029
M204 S5000
G1 X80.19 Y82.385 E.00283
G3 X79.917 Y82.392 I-.12 J.677 E.0905
G1 X80.004 Y82.381 E.00197
M204 S250
G1 X79.652 Y82.49 F42000
G1 F2029
M204 S5000
G1 X79.655 Y82.487 E.0001
G3 X80.053 Y82.354 I.414 J.577 E.00953
G1 X80.117 Y82.355 E.00145
G3 X79.548 Y82.581 I-.048 J.709 E.08573
G1 X79.607 Y82.53 E.00173
; CHANGE_LAYER
; Z_HEIGHT: 6.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y82.487 E-.02449
G1 X79.778 Y82.416 E-.05383
G1 X79.912 Y82.371 E-.05379
G1 X80.053 Y82.354 E-.05387
G1 X80.117 Y82.355 E-.02467
G1 X80.362 Y82.417 E-.09591
G1 X80.485 Y82.487 E-.05389
G1 X80.591 Y82.581 E-.05377
G1 X80.677 Y82.694 E-.05381
G1 X80.738 Y82.821 E-.05377
G1 X80.773 Y82.959 E-.05384
G1 X80.78 Y83.1 E-.05378
G1 X80.759 Y83.24 E-.05379
G1 X80.711 Y83.373 E-.05386
G1 X80.677 Y83.423 E-.02293
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/51
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.68 I.811 J.907 P1  F42000
G1 X88.353 Y76.564 Z6.68
G1 Z6.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2023
M204 S6000
G1 X88.364 Y76.588 E.00072
G2 X89.234 Y77.404 I1.836 J-1.084 E.03276
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.02908
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.327 Y76.51 E.00138
M204 S250
G1 X88.714 Y76.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2023
M204 S5000
G1 X88.605 Y76.129 E.00712
G3 X89.819 Y74.251 I1.395 J-.43 E.06404
G1 X89.964 Y74.24 E.00366
G3 X88.744 Y76.442 I.036 J1.459 E.1542
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.129 E-.13023
G1 X88.547 Y75.844 E-.11028
G1 X88.547 Y75.557 E-.10929
G1 X88.606 Y75.263 E-.11377
G1 X88.719 Y74.998 E-.10965
G1 X88.883 Y74.759 E-.11002
G1 X89.024 Y74.615 E-.07677
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z6.84 F42000
G1 Z6.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2023
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.398 E.00533
G2 X91.695 Y76.464 I-.857 J-1.789 E.03645
G1 X91.889 Y76.508 E.0054
G1 X91.889 Y77.529 E.02766
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41158
G1 X90.762 Y77.398 E-.07478
G1 X91.079 Y77.216 E-.13885
G1 X91.346 Y76.983 E-.13479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.955 Y77.582 Z6.84 F42000
G1 X101.624 Y77.792 Z6.84
G1 Z6.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2023
M204 S5000
G1 X101.788 Y77.812 E.00417
G3 X102.51 Y78.695 I-.203 J.903 E.03089
G1 X102.51 Y105.305 E.66901
G3 X101.605 Y106.21 I-.922 J-.017 E.03557
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.308 I.021 J-.926 E.03544
G1 X77.49 Y78.695 E.66909
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X87.71 Y77.79 E.23419
M73 P79 R2
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.564 Y77.79 E.23315
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.788 Y77.812 E-.08571
G1 X101.988 Y77.876 E-.07997
G1 X102.152 Y77.976 E-.07253
G1 X102.242 Y78.054 E-.04544
G1 X102.423 Y78.31 E-.11928
G1 X102.492 Y78.52 E-.08376
G1 X102.51 Y78.695 E-.06688
G1 X102.51 Y79.238 E-.20644
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.997 Y77.894 Z6.84 F42000
G1 X92.29 Y77.41 Z6.84
G1 Z6.44
G1 E.8 F1800
G1 F2023
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.295 E.6685
G3 X101.666 Y106.588 I-1.307 J-.012 E.04925
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
M73 P79 R1
G1 X87.718 Y75.41 E.05028
G3 X90.083 Y73.412 I2.295 J.318 E.08525
G3 X92.282 Y75.41 I-.092 J2.311 E.08112
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z6.44
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17472
G1 F2023
M204 S6000
G1 X91.259 Y77.367 E.00413
M204 S10000
G1 X91.504 Y77.381 F42000
; LINE_WIDTH: 0.233392
G1 F2023
M204 S6000
G1 X91.682 Y76.932 E.00627
M204 S10000
G1 X91.586 Y76.234 F42000
; LINE_WIDTH: 0.466031
G1 F2023
M204 S6000
G1 X91.858 Y76.058 E.00912
G1 X91.871 Y75.517 E.01524
G1 X91.834 Y75.312 E.00586
G2 X88.13 Y75.897 I-1.837 J.391 E.16042
G1 X88.148 Y76.062 E.00466
; LINE_WIDTH: 0.46509
G1 X88.413 Y76.234 E.00888
M204 S10000
G1 X89.407 Y77.531 F42000
; LINE_WIDTH: 0.482562
G1 F2023
M204 S6000
G2 X90.589 Y77.537 I.615 J-4.323 E.03465
; WIPE_START
G1 F10039.575
G1 X90.03 Y77.575 E-.35988
G1 X89.407 Y77.531 E-.40012
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.632 Y81.045 Z6.84 F42000
G1 X80.066 Y82.376 Z6.84
G1 Z6.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2023
M204 S5000
G1 X80.19 Y82.385 E.00278
G3 X79.917 Y82.392 I-.12 J.678 E.0907
G1 X80.006 Y82.381 E.00202
M204 S250
G1 X79.653 Y82.489 F42000
G1 F2023
M204 S5000
G1 X79.655 Y82.487 E.00006
G3 X80.053 Y82.354 I.415 J.577 E.00953
G1 X80.118 Y82.355 E.00147
G3 X79.549 Y82.581 I-.049 J.709 E.08572
G1 X79.608 Y82.529 E.00176
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.655 Y82.487 E-.02382
G1 X79.778 Y82.417 E-.05382
G1 X79.912 Y82.371 E-.05384
G1 X80.053 Y82.354 E-.05388
G1 X80.118 Y82.355 E-.02505
G1 X80.362 Y82.417 E-.09556
G1 X80.485 Y82.487 E-.05379
G1 X80.591 Y82.581 E-.05386
G1 X80.677 Y82.694 E-.05376
G1 X80.738 Y82.821 E-.05377
G1 X80.773 Y82.959 E-.05389
G1 X80.78 Y83.1 E-.05377
G1 X80.759 Y83.24 E-.0538
G1 X80.711 Y83.373 E-.05376
G1 X80.676 Y83.424 E-.02362
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/51
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.84 I.811 J.907 P1  F42000
G1 X88.352 Y76.563 Z6.84
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P80 R1
G1 F2016
M204 S6000
G1 X88.364 Y76.588 E.00075
G2 X89.234 Y77.404 I1.836 J-1.084 E.03275
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.02909
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.326 Y76.509 E.00136
M204 S250
G1 X88.714 Y76.39 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2016
M204 S5000
G1 X88.606 Y76.129 E.0071
G3 X89.819 Y74.251 I1.395 J-.43 E.06404
G1 X89.964 Y74.24 E.00365
G3 X88.744 Y76.441 I.036 J1.459 E.15422
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.606 Y76.129 E-.12989
G1 X88.547 Y75.845 E-.11025
G1 X88.547 Y75.557 E-.10945
G1 X88.606 Y75.264 E-.11347
G1 X88.719 Y74.998 E-.10963
G1 X88.883 Y74.759 E-.11018
G1 X89.025 Y74.614 E-.07713
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2016
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.398 E.00533
G2 X91.695 Y76.464 I-.823 J-1.755 E.03648
G1 X91.889 Y76.508 E.0054
G1 X91.889 Y77.529 E.02766
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41158
G1 X90.762 Y77.398 E-.07477
G1 X91.08 Y77.216 E-.13896
G1 X91.31 Y77.021 E-.11479
G1 X91.344 Y76.981 E-.0199
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.953 Y77.581 Z7 F42000
G1 X101.627 Y77.792 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2016
M204 S5000
G1 X101.787 Y77.812 E.00406
G3 X102.51 Y78.695 I-.202 J.903 E.03091
G1 X102.51 Y105.305 E.66901
G3 X101.605 Y106.21 I-.922 J-.017 E.03557
G1 X78.392 Y106.21 E.58359
G3 X77.49 Y105.308 I.024 J-.926 E.03537
G1 X77.49 Y78.694 E.66911
G3 X78.395 Y77.79 I.92 J.016 E.03557
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.567 Y77.79 E.23323
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.787 Y77.812 E-.08415
G1 X101.989 Y77.877 E-.08047
G1 X102.151 Y77.975 E-.07204
G1 X102.242 Y78.054 E-.04589
G1 X102.423 Y78.311 E-.1193
G1 X102.492 Y78.519 E-.08364
G1 X102.51 Y78.695 E-.06691
G1 X102.51 Y79.241 E-.20761
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.997 Y77.895 Z7 F42000
G1 X92.29 Y77.41 Z7
G1 Z6.6
G1 E.8 F1800
G1 F2016
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.665 Y106.588 I-1.299 J-.004 E.04935
G1 X78.405 Y106.59 E.58478
G3 X77.112 Y105.363 I.003 J-1.299 E.04939
G1 X77.11 Y78.705 E.67022
M73 P81 R1
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.081 Y73.412 I2.295 J.318 E.08519
G3 X92.282 Y75.41 I-.09 J2.311 E.08118
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.586 Y76.234
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.466067
G1 F2016
M204 S6000
G1 X91.858 Y76.058 E.00911
G1 X91.871 Y75.517 E.01522
G1 X91.834 Y75.312 E.00586
G2 X88.13 Y75.897 I-1.837 J.39 E.16045
G1 X88.148 Y76.062 E.00466
; LINE_WIDTH: 0.464792
G1 X88.413 Y76.234 E.00886
M204 S10000
G1 X89.407 Y77.531 F42000
; LINE_WIDTH: 0.482562
G1 F2016
M204 S6000
G2 X90.589 Y77.537 I.615 J-4.327 E.03465
; WIPE_START
G1 F10039.579
G1 X90.03 Y77.575 E-.35951
G1 X89.407 Y77.531 E-.40049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.632 Y81.046 Z7 F42000
G1 X80.068 Y82.376 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2016
M204 S5000
G1 X80.19 Y82.385 E.00274
G3 X79.916 Y82.392 I-.12 J.678 E.09069
G1 X80.008 Y82.381 E.00207
M204 S250
G1 X79.655 Y82.487 F42000
G1 F2016
M204 S5000
G3 X80.052 Y82.354 I.415 J.577 E.00953
G1 X80.119 Y82.355 E.0015
G3 X79.608 Y82.524 I-.05 J.709 E.08753
; CHANGE_LAYER
; Z_HEIGHT: 6.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y82.417 E-.07646
G1 X79.912 Y82.371 E-.05377
G1 X80.052 Y82.354 E-.05391
G1 X80.119 Y82.355 E-.0254
G1 X80.362 Y82.417 E-.09525
G1 X80.485 Y82.487 E-.05385
G1 X80.591 Y82.581 E-.05374
G1 X80.677 Y82.694 E-.05381
G1 X80.738 Y82.821 E-.05379
G1 X80.773 Y82.959 E-.05381
G1 X80.78 Y83.1 E-.05386
G1 X80.759 Y83.24 E-.05377
G1 X80.711 Y83.373 E-.05381
G1 X80.674 Y83.427 E-.02477
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/51
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7 I.811 J.907 P1  F42000
G1 X88.352 Y76.563 Z7
G1 Z6.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2023
M204 S6000
G1 X88.364 Y76.588 E.00078
G2 X89.234 Y77.404 I1.835 J-1.084 E.03274
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.02909
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.326 Y76.508 E.00134
M204 S250
G1 X88.714 Y76.389 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2023
M204 S5000
G1 X88.606 Y76.129 E.00707
G3 X89.819 Y74.251 I1.394 J-.43 E.06404
G1 X89.964 Y74.24 E.00365
G3 X88.743 Y76.441 I.036 J1.459 E.15424
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.606 Y76.129 E-.12953
G1 X88.547 Y75.845 E-.11035
G1 X88.547 Y75.556 E-.10955
G1 X88.603 Y75.275 E-.10886
G1 X88.687 Y75.061 E-.08735
G1 X88.838 Y74.816 E-.1095
G1 X89.026 Y74.614 E-.10488
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z7.16 F42000
G1 Z6.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2023
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.398 E.00533
G2 X91.695 Y76.464 I-.857 J-1.79 E.03645
G1 X91.889 Y76.508 E.0054
G1 X91.889 Y77.529 E.02766
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41158
G1 X90.762 Y77.398 E-.07476
G1 X91.081 Y77.215 E-.13943
G1 X91.346 Y76.983 E-.13423
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.955 Y77.582 Z7.16 F42000
G1 X101.63 Y77.792 Z7.16
G1 Z6.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2023
M204 S5000
G1 X101.786 Y77.812 E.00397
G3 X102.51 Y78.695 I-.202 J.903 E.03093
G1 X102.51 Y105.305 E.66901
G3 X101.605 Y106.21 I-.92 J-.015 E.03558
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.305 I.021 J-.926 E.03552
G1 X77.49 Y78.694 E.66903
G3 X78.395 Y77.79 I.92 J.016 E.03557
G1 X87.71 Y77.79 E.23419
M73 P82 R1
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.57 Y77.79 E.23331
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.786 Y77.812 E-.08271
G1 X101.989 Y77.877 E-.08073
G1 X102.15 Y77.974 E-.07176
G1 X102.242 Y78.054 E-.04614
G1 X102.423 Y78.311 E-.11935
G1 X102.492 Y78.519 E-.08361
G1 X102.51 Y78.695 E-.06695
G1 X102.51 Y79.244 E-.20876
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.998 Y77.896 Z7.16 F42000
G1 X92.29 Y77.41 Z7.16
G1 Z6.76
G1 E.8 F1800
G1 F2023
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.306 J-.01 E.04927
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.003 J-1.298 E.04936
G1 X77.11 Y78.705 E.67026
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.078 Y73.411 I2.295 J.318 E.08513
G3 X92.282 Y75.41 I-.088 J2.311 E.08124
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z6.76
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.176117
G1 F2023
M204 S6000
G1 X91.259 Y77.367 E.00417
M204 S10000
G1 X91.504 Y77.381 F42000
; LINE_WIDTH: 0.231258
G1 F2023
M204 S6000
G1 X91.682 Y76.932 E.0062
M204 S10000
G1 X91.587 Y76.234 F42000
; LINE_WIDTH: 0.466004
G1 F2023
M204 S6000
G1 X91.858 Y76.058 E.00911
G1 X91.871 Y75.518 E.0152
G1 X91.835 Y75.313 E.00585
G2 X88.13 Y75.897 I-1.837 J.391 E.16035
G1 X88.148 Y76.062 E.00466
; LINE_WIDTH: 0.464968
G1 X88.413 Y76.233 E.00887
M204 S10000
G1 X89.407 Y77.531 F42000
; LINE_WIDTH: 0.482561
G1 F2023
M204 S6000
G2 X90.589 Y77.537 I.614 J-4.32 E.03465
; WIPE_START
G1 F10039.613
G1 X90.031 Y77.575 E-.35913
G1 X89.407 Y77.531 E-.40087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.633 Y81.046 Z7.16 F42000
G1 X80.07 Y82.376 Z7.16
G1 Z6.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2023
M204 S5000
G1 X80.19 Y82.385 E.00269
G3 X79.916 Y82.392 I-.12 J.678 E.0907
G1 X80.01 Y82.38 E.00211
M204 S250
G1 X79.655 Y82.487 F42000
G1 F2023
M204 S5000
G3 X80.052 Y82.354 I.415 J.577 E.00952
G1 X80.12 Y82.355 E.00152
G3 X79.608 Y82.524 I-.05 J.709 E.0875
; CHANGE_LAYER
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y82.417 E-.07651
M73 P83 R1
G1 X79.912 Y82.371 E-.05376
G1 X80.052 Y82.354 E-.05387
G1 X80.12 Y82.355 E-.02581
G1 X80.362 Y82.417 E-.0949
G1 X80.485 Y82.487 E-.05373
G1 X80.591 Y82.581 E-.05385
G1 X80.677 Y82.694 E-.05382
G1 X80.738 Y82.822 E-.05381
G1 X80.773 Y82.959 E-.05383
G1 X80.78 Y83.1 E-.05376
G1 X80.759 Y83.24 E-.05375
G1 X80.711 Y83.373 E-.05383
G1 X80.674 Y83.427 E-.02476
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/51
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.16 I.811 J.907 P1  F42000
G1 X88.352 Y76.562 Z7.16
G1 Z6.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X88.364 Y76.588 E.0008
G2 X89.234 Y77.404 I1.835 J-1.085 E.03274
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.02909
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.326 Y76.508 E.00132
M204 S250
G1 X88.713 Y76.388 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X88.606 Y76.129 E.00706
G3 X89.819 Y74.251 I1.394 J-.43 E.06404
G1 X89.964 Y74.24 E.00365
G3 X88.743 Y76.44 I.036 J1.459 E.15426
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.606 Y76.129 E-.12926
G1 X88.547 Y75.845 E-.11022
G1 X88.542 Y75.616 E-.08705
G1 X88.586 Y75.334 E-.10841
G1 X88.686 Y75.064 E-.10942
G1 X88.837 Y74.816 E-.11035
G1 X89.026 Y74.613 E-.10529
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z7.32 F42000
G1 Z6.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.398 E.00533
G2 X91.695 Y76.464 I-.822 J-1.754 E.03649
G1 X91.889 Y76.508 E.0054
G1 X91.889 Y77.529 E.02766
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41156
G1 X90.762 Y77.398 E-.07474
G1 X91.081 Y77.215 E-.13983
G1 X91.347 Y76.983 E-.13387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.955 Y77.582 Z7.32 F42000
G1 X101.633 Y77.793 Z7.32
G1 Z6.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X101.786 Y77.811 E.00388
G3 X102.51 Y78.692 I-.201 J.904 E.03089
G1 X102.51 Y105.305 E.66907
G3 X101.605 Y106.21 I-.922 J-.016 E.03557
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.305 I.015 J-.92 E.03557
G1 X77.49 Y78.694 E.66903
G3 X78.395 Y77.79 I.92 J.016 E.03557
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.573 Y77.79 E.23338
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.786 Y77.811 E-.08129
G1 X101.989 Y77.877 E-.08103
G1 X102.15 Y77.974 E-.07152
G1 X102.242 Y78.054 E-.04638
G1 X102.423 Y78.31 E-.11923
G1 X102.483 Y78.479 E-.06789
G1 X102.51 Y78.692 E-.0818
G1 X102.51 Y79.247 E-.21086
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.998 Y77.896 Z7.32 F42000
G1 X92.29 Y77.41 Z7.32
G1 Z6.92
G1 E.8 F1800
G1 F2029
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.004 J1.291 E.0512
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.299 J-.004 E.04933
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.363 I-.002 J-1.294 E.04945
G1 X77.11 Y78.705 E.67021
M73 P84 R1
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.076 Y73.411 I2.295 J.318 E.08507
G3 X92.282 Y75.41 I-.085 J2.311 E.0813
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z6.92
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.177162
G1 F2029
M204 S6000
G1 X91.259 Y77.367 E.0042
M204 S10000
G1 X91.503 Y77.381 F42000
; LINE_WIDTH: 0.239069
G1 F2029
M204 S6000
G1 X91.671 Y76.96 E.00605
M204 S10000
G1 X91.665 Y76.958 F42000
; LINE_WIDTH: 0.131397
G1 F2029
M204 S6000
G1 X91.514 Y77.381 E.00284
M204 S10000
G1 X90.589 Y77.537 F42000
; LINE_WIDTH: 0.482556
G1 F2029
M204 S6000
G3 X89.407 Y77.531 I-.568 J-4.331 E.03464
M204 S10000
G1 X88.413 Y76.234 F42000
; LINE_WIDTH: 0.465113
G1 F2029
M204 S6000
G1 X88.148 Y76.062 E.00887
; LINE_WIDTH: 0.465972
G1 X88.13 Y75.898 E.00465
G3 X91.87 Y75.497 I1.871 J-.192 E.16574
G1 X91.858 Y76.058 E.01579
G1 X91.587 Y76.234 E.0091
; WIPE_START
G1 F10425.451
G1 X91.858 Y76.058 E-.12288
G1 X91.87 Y75.497 E-.21325
G1 X91.791 Y75.144 E-.13753
G1 X91.645 Y74.8 E-.14177
G1 X91.44 Y74.501 E-.13778
G1 X91.428 Y74.489 E-.00679
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.159 Y78.843 Z7.32 F42000
G1 X80.071 Y82.377 Z7.32
G1 Z6.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2029
M204 S5000
G1 X80.19 Y82.385 E.00265
G3 X79.916 Y82.392 I-.12 J.677 E.0905
G1 X80.012 Y82.38 E.00215
M204 S250
G1 X79.657 Y82.486 F42000
G1 F2029
M204 S5000
G1 X79.778 Y82.417 E.00312
G3 X80.052 Y82.354 I.293 J.646 E.00635
G1 X80.121 Y82.355 E.00154
G3 X79.609 Y82.524 I-.051 J.707 E.08735
; CHANGE_LAYER
; Z_HEIGHT: 7.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y82.417 E-.07571
G1 X79.912 Y82.371 E-.05383
G1 X80.052 Y82.354 E-.05382
G1 X80.121 Y82.355 E-.02619
G1 X80.362 Y82.417 E-.09456
G1 X80.485 Y82.487 E-.05383
G1 X80.591 Y82.581 E-.05368
G1 X80.677 Y82.694 E-.05383
G1 X80.738 Y82.821 E-.0538
G1 X80.773 Y82.959 E-.05384
G1 X80.78 Y83.1 E-.05381
G1 X80.759 Y83.24 E-.05378
G1 X80.711 Y83.373 E-.05378
G1 X80.676 Y83.43 E-.02553
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/51
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.32 I.812 J.907 P1  F42000
G1 X88.351 Y76.561 Z7.32
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X88.365 Y76.589 E.00083
G2 X89.234 Y77.404 I1.835 J-1.084 E.03274
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.02909
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.325 Y76.507 E.0013
M204 S250
G1 X88.713 Y76.387 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X88.605 Y76.129 E.00703
G3 X89.819 Y74.251 I1.394 J-.43 E.06405
G1 X89.964 Y74.24 E.00365
G3 X88.742 Y76.439 I.036 J1.459 E.15428
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.129 E-.1289
G1 X88.547 Y75.845 E-.11028
G1 X88.542 Y75.617 E-.08676
G1 X88.586 Y75.335 E-.10844
G1 X88.685 Y75.064 E-.10961
G1 X88.837 Y74.816 E-.11031
G1 X89.027 Y74.613 E-.1057
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z7.48 F42000
G1 Z7.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.398 E.00533
G2 X91.695 Y76.464 I-.822 J-1.754 E.0365
G1 X91.889 Y76.508 E.0054
G1 X91.889 Y77.529 E.02766
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41155
G1 X90.762 Y77.398 E-.07471
G1 X91.082 Y77.214 E-.14015
G1 X91.347 Y76.983 E-.13359
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.955 Y77.582 Z7.48 F42000
G1 X101.636 Y77.793 Z7.48
G1 Z7.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X101.785 Y77.811 E.00379
G3 X102.51 Y78.695 I-.2 J.904 E.03097
G1 X102.51 Y105.305 E.66901
G3 X101.605 Y106.21 I-.921 J-.016 E.03557
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.307 I.021 J-.926 E.03546
G1 X77.49 Y78.695 E.66907
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X87.71 Y77.79 E.23419
M73 P85 R1
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.576 Y77.79 E.23345
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.785 Y77.811 E-.07995
G1 X101.989 Y77.876 E-.08126
G1 X102.149 Y77.973 E-.07117
G1 X102.242 Y78.054 E-.04681
G1 X102.423 Y78.31 E-.11921
G1 X102.492 Y78.519 E-.08372
G1 X102.51 Y78.695 E-.06691
G1 X102.51 Y79.25 E-.21098
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.998 Y77.897 Z7.48 F42000
G1 X92.29 Y77.41 Z7.48
G1 Z7.08
G1 E.8 F1800
G1 F2029
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.6685
G3 X101.666 Y106.588 I-1.299 J-.004 E.04933
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.074 Y73.411 I2.296 J.318 E.08501
G3 X92.282 Y75.41 I-.083 J2.312 E.08136
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z7.08
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.177925
G1 F2029
M204 S6000
G1 X91.259 Y77.367 E.00422
M204 S10000
G1 X91.502 Y77.381 F42000
; LINE_WIDTH: 0.238377
G1 F2029
M204 S6000
G1 X91.671 Y76.96 E.00603
M204 S10000
G1 X91.665 Y76.958 F42000
; LINE_WIDTH: 0.131912
G1 F2029
M204 S6000
G1 X91.514 Y77.381 E.00285
M204 S10000
G1 X90.589 Y77.537 F42000
; LINE_WIDTH: 0.482547
G1 F2029
M204 S6000
G3 X89.407 Y77.531 I-.568 J-4.33 E.03464
M204 S10000
G1 X88.413 Y76.233 F42000
; LINE_WIDTH: 0.464352
G1 F2029
M204 S6000
G1 X88.149 Y76.062 E.00884
; LINE_WIDTH: 0.465879
G1 X88.13 Y75.898 E.00465
G3 X91.87 Y75.497 I1.871 J-.193 E.16577
G1 X91.858 Y76.058 E.01577
G1 X91.587 Y76.234 E.00909
; WIPE_START
G1 F10427.711
G1 X91.858 Y76.058 E-.12284
G1 X91.87 Y75.497 E-.21304
G1 X91.791 Y75.144 E-.13775
G1 X91.64 Y74.791 E-.14577
G1 X91.428 Y74.487 E-.1406
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.16 Y78.842 Z7.48 F42000
G1 X80.073 Y82.377 Z7.48
G1 Z7.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2029
M204 S5000
G1 X80.19 Y82.386 E.00262
G3 X79.916 Y82.392 I-.12 J.674 E.09005
G1 X80.014 Y82.38 E.00219
M204 S250
G1 X79.658 Y82.486 F42000
M73 P86 R1
G1 F2029
M204 S5000
G1 X79.777 Y82.416 E.0031
G3 X80.052 Y82.354 I.291 J.648 E.00635
G1 X80.117 Y82.355 E.00146
G3 X79.61 Y82.521 I-.049 J.709 E.08764
; CHANGE_LAYER
; Z_HEIGHT: 7.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.777 Y82.416 E-.07516
G1 X79.912 Y82.371 E-.05384
G1 X80.052 Y82.354 E-.05383
G1 X80.117 Y82.355 E-.02472
G1 X80.362 Y82.417 E-.09597
G1 X80.485 Y82.487 E-.05378
G1 X80.591 Y82.581 E-.05383
G1 X80.677 Y82.694 E-.05382
G1 X80.738 Y82.821 E-.05375
G1 X80.773 Y82.959 E-.0538
G1 X80.78 Y83.1 E-.05385
G1 X80.759 Y83.24 E-.05374
G1 X80.711 Y83.373 E-.05382
G1 X80.672 Y83.43 E-.02609
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/51
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.48 I.811 J.907 P1  F42000
G1 X88.351 Y76.56 Z7.48
G1 Z7.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X88.365 Y76.589 E.00085
G2 X89.234 Y77.404 I1.835 J-1.084 E.03273
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.02909
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.325 Y76.506 E.00128
M204 S250
G1 X88.713 Y76.387 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X88.606 Y76.129 E.00701
G3 X89.819 Y74.251 I1.394 J-.43 E.06404
G1 X89.964 Y74.24 E.00366
G3 X88.742 Y76.439 I.036 J1.459 E.1543
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.606 Y76.129 E-.12856
G1 X88.547 Y75.845 E-.11023
G1 X88.542 Y75.618 E-.08632
G1 X88.586 Y75.335 E-.10864
G1 X88.685 Y75.064 E-.10985
G1 X88.837 Y74.817 E-.11029
G1 X89.027 Y74.612 E-.10611
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z7.64 F42000
G1 Z7.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.398 E.00533
G2 X91.695 Y76.464 I-.821 J-1.754 E.0365
G1 X91.889 Y76.508 E.0054
G1 X91.889 Y77.529 E.02766
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41155
G1 X90.762 Y77.398 E-.0747
G1 X91.083 Y77.214 E-.14044
G1 X91.347 Y76.983 E-.13331
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.955 Y77.582 Z7.64 F42000
G1 X101.638 Y77.793 Z7.64
G1 Z7.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X101.784 Y77.811 E.0037
G3 X102.51 Y78.692 I-.2 J.904 E.03092
G1 X102.51 Y105.305 E.66907
G3 X101.605 Y106.21 I-.926 J-.021 E.03553
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.305 I.021 J-.926 E.03552
G1 X77.49 Y78.695 E.66901
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.578 Y77.79 E.23352
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.784 Y77.811 E-.07861
G1 X101.989 Y77.877 E-.0816
G1 X102.148 Y77.973 E-.07084
G1 X102.242 Y78.054 E-.04703
G1 X102.357 Y78.194 E-.06874
G1 X102.456 Y78.39 E-.08371
G1 X102.501 Y78.569 E-.06986
G1 X102.51 Y78.692 E-.04705
G1 X102.51 Y79.251 E-.21256
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.999 Y77.898 Z7.64 F42000
G1 X92.29 Y77.41 Z7.64
G1 Z7.24
G1 E.8 F1800
G1 F2029
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.307 J-.011 E.04926
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.011 J-1.307 E.04926
M73 P87 R1
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.071 Y73.411 I2.297 J.32 E.08494
G3 X92.282 Y75.41 I-.081 J2.312 E.08142
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z7.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.178252
G1 F2029
M204 S6000
G1 X91.259 Y77.367 E.00423
M204 S10000
G1 X91.503 Y77.381 F42000
; LINE_WIDTH: 0.237676
G1 F2029
M204 S6000
G1 X91.671 Y76.96 E.00601
M204 S10000
G1 X91.665 Y76.958 F42000
; LINE_WIDTH: 0.132527
G1 F2029
M204 S6000
G1 X91.515 Y77.381 E.00287
M204 S10000
G1 X90.589 Y77.537 F42000
; LINE_WIDTH: 0.482554
G1 F2029
M204 S6000
G3 X89.407 Y77.531 I-.568 J-4.325 E.03464
M204 S10000
G1 X88.413 Y76.233 F42000
; LINE_WIDTH: 0.464144
G1 F2029
M204 S6000
G1 X88.149 Y76.062 E.00884
; LINE_WIDTH: 0.465886
G1 X88.13 Y75.898 E.00465
G3 X91.87 Y75.498 I1.871 J-.192 E.16574
G1 X91.858 Y76.058 E.01575
G1 X91.587 Y76.234 E.00909
; WIPE_START
G1 F10427.531
G1 X91.858 Y76.058 E-.12284
G1 X91.87 Y75.498 E-.21278
G1 X91.791 Y75.144 E-.13786
G1 X91.645 Y74.8 E-.14183
G1 X91.434 Y74.491 E-.14226
G1 X91.429 Y74.487 E-.00243
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.162 Y78.843 Z7.64 F42000
G1 X80.076 Y82.377 Z7.64
G1 Z7.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2029
M204 S5000
G1 X80.19 Y82.386 E.00254
G3 X79.948 Y82.386 I-.12 J.678 E.0914
G1 X80.017 Y82.379 E.00154
M204 S250
G1 X79.659 Y82.485 F42000
G1 F2029
M204 S5000
G1 X79.777 Y82.416 E.00306
G3 X80.052 Y82.354 I.291 J.648 E.00635
G1 X80.118 Y82.355 E.00148
G3 X79.611 Y82.52 I-.05 J.709 E.08765
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.777 Y82.416 E-.07465
G1 X79.912 Y82.371 E-.0538
G1 X80.052 Y82.354 E-.0539
G1 X80.118 Y82.355 E-.02505
G1 X80.362 Y82.417 E-.0956
G1 X80.485 Y82.487 E-.05381
G1 X80.591 Y82.581 E-.05381
G1 X80.677 Y82.694 E-.05387
G1 X80.738 Y82.821 E-.05372
G1 X80.773 Y82.959 E-.05384
G1 X80.78 Y83.1 E-.05376
G1 X80.759 Y83.24 E-.05382
G1 X80.711 Y83.373 E-.0538
G1 X80.671 Y83.431 E-.02656
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/51
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.64 I.811 J.907 P1  F42000
G1 X88.351 Y76.56 Z7.64
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X88.365 Y76.589 E.00088
G2 X89.234 Y77.404 I1.835 J-1.085 E.03273
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.02909
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.325 Y76.506 E.00126
M204 S250
G1 X88.712 Y76.386 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X88.606 Y76.129 E.00698
G3 X89.819 Y74.251 I1.394 J-.431 E.06405
G1 X89.964 Y74.24 E.00366
G3 X88.742 Y76.438 I.036 J1.459 E.15432
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.606 Y76.129 E-.12819
G1 X88.547 Y75.845 E-.1104
G1 X88.542 Y75.619 E-.08583
G1 X88.586 Y75.336 E-.10881
G1 X88.685 Y75.064 E-.10991
G1 X88.837 Y74.817 E-.11036
G1 X89.028 Y74.611 E-.1065
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2029
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.398 E.00533
G2 X91.695 Y76.464 I-.821 J-1.753 E.03651
G1 X91.889 Y76.508 E.00539
G1 X91.889 Y77.529 E.02766
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41154
G1 X90.762 Y77.398 E-.07469
G1 X91.083 Y77.213 E-.14066
G1 X91.346 Y76.983 E-.13311
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.955 Y77.582 Z7.8 F42000
G1 X101.639 Y77.793 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2029
M204 S5000
G1 X101.777 Y77.809 E.0035
G3 X102.51 Y78.695 I-.188 J.901 E.03121
G1 X102.51 Y105.305 E.66901
G3 X101.605 Y106.21 I-.92 J-.015 E.03558
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.308 I.021 J-.926 E.03545
G1 X77.49 Y78.695 E.66908
M73 P88 R1
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.579 Y77.79 E.23354
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.777 Y77.809 E-.07564
G1 X101.987 Y77.876 E-.08371
G1 X102.243 Y78.056 E-.11897
G1 X102.357 Y78.194 E-.06791
G1 X102.457 Y78.393 E-.08482
G1 X102.493 Y78.524 E-.05143
G1 X102.51 Y78.695 E-.06531
G1 X102.51 Y79.253 E-.21221
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.999 Y77.898 Z7.8 F42000
G1 X92.29 Y77.41 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F2029
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.297 E.66855
G3 X101.666 Y106.588 I-1.299 J-.006 E.04927
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.306 J.011 E.05104
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.069 Y73.411 I2.296 J.319 E.08489
G3 X92.282 Y75.41 I-.078 J2.312 E.08149
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.17884
G1 F2029
M204 S6000
G1 X91.259 Y77.367 E.00425
M204 S10000
G1 X91.503 Y77.381 F42000
; LINE_WIDTH: 0.237208
G1 F2029
M204 S6000
G1 X91.671 Y76.96 E.00599
M204 S10000
G1 X91.665 Y76.958 F42000
; LINE_WIDTH: 0.133214
G1 F2029
M204 S6000
G1 X91.514 Y77.381 E.00289
M204 S10000
G1 X90.589 Y77.537 F42000
; LINE_WIDTH: 0.482547
G1 F2029
M204 S6000
G3 X89.408 Y77.531 I-.568 J-4.318 E.03464
M204 S10000
G1 X88.414 Y76.233 F42000
; LINE_WIDTH: 0.464272
G1 F2029
M204 S6000
G1 X88.149 Y76.062 E.00884
; LINE_WIDTH: 0.465898
G1 X88.13 Y75.898 E.00466
G3 X91.87 Y75.499 I1.871 J-.192 E.16575
G1 X91.858 Y76.058 E.01574
G1 X91.587 Y76.234 E.0091
; WIPE_START
G1 F10427.255
M73 P89 R1
G1 X91.858 Y76.058 E-.12287
G1 X91.87 Y75.499 E-.21255
G1 X91.791 Y75.144 E-.13814
G1 X91.65 Y74.81 E-.13763
G1 X91.441 Y74.502 E-.14145
G1 X91.427 Y74.488 E-.00736
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.16 Y78.844 Z7.8 F42000
G1 X80.078 Y82.377 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F2029
M204 S5000
G1 X80.19 Y82.385 E.00251
G3 X79.919 Y82.392 I-.118 J.679 E.09075
G1 X80.018 Y82.379 E.00223
M204 S250
G1 X79.66 Y82.484 F42000
G1 F2029
M204 S5000
G1 X79.777 Y82.416 E.00303
G3 X80.052 Y82.354 I.291 J.648 E.00635
G1 X80.119 Y82.355 E.0015
G3 X79.612 Y82.52 I-.051 J.709 E.08766
; CHANGE_LAYER
; Z_HEIGHT: 7.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.777 Y82.416 E-.07418
G1 X79.912 Y82.371 E-.05383
G1 X80.052 Y82.354 E-.05381
G1 X80.119 Y82.355 E-.02549
G1 X80.362 Y82.417 E-.09525
G1 X80.485 Y82.487 E-.05377
G1 X80.591 Y82.581 E-.05384
G1 X80.677 Y82.694 E-.05379
G1 X80.738 Y82.821 E-.05374
G1 X80.773 Y82.959 E-.05381
G1 X80.78 Y83.1 E-.05387
G1 X80.759 Y83.24 E-.05377
G1 X80.711 Y83.373 E-.05378
G1 X80.67 Y83.432 E-.02707
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/51
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.8 I.3 J1.179 P1  F42000
G1 X102.125 Y77.972 Z7.8
G1 Z7.56
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F3496
M204 S5000
G1 X102.243 Y78.057 E.00364
G3 X102.509 Y78.652 I-.645 J.646 E.01678
G1 X102.51 Y79.76 E.02784
G1 X102.51 Y80.16 E.01006
G1 X102.51 Y80.56 E.01006
G1 F3030.923
G1 X102.51 Y80.96 E.01006
G1 F747.53
G1 X102.469 Y80.96 E.00103
M106 S255
G1 F600
G1 X102.1 Y80.96 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y80.96 E.01599
G1 X101.51 Y82.04 E.02927
G1 X102.1 Y82.04 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y82.04 E.00928
M106 S201.45
G1 F747.227
G1 X102.51 Y82.04 E.00103
G1 F3030.312
G1 X102.51 Y82.44 E.01006
G1 F3496
G1 X102.51 Y82.84 E.01006
G1 X102.51 Y83.24 E.01006
G1 X102.51 Y98.76 E.39019
G1 X102.51 Y99.16 E.01006
G1 X102.51 Y99.56 E.01006
G1 F3030.312
G1 X102.51 Y99.96 E.01006
G1 F747.227
G1 X102.469 Y99.96 E.00103
M106 S255
G1 F600
G1 X102.1 Y99.96 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X101.51 Y99.96 E.01599
G1 X101.51 Y101.04 E.02927
G1 X102.1 Y101.04 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X102.469 Y101.04 E.00928
M106 S201.45
G1 F747.379
G1 X102.51 Y101.04 E.00103
G1 F3030.618
G1 X102.51 Y101.44 E.01006
G1 F3496
G1 X102.51 Y101.84 E.01006
G1 X102.51 Y102.24 E.01006
G1 X102.509 Y105.344 E.07806
G3 X101.605 Y106.21 I-.92 J-.056 E.03459
G1 X82.74 Y106.21 E.47429
G1 X82.34 Y106.21 E.01006
G1 X81.94 Y106.21 E.01006
G1 F3030.312
G1 X81.54 Y106.21 E.01006
G1 F747.227
G1 X81.54 Y106.169 E.00103
M106 S255
G1 F600
G1 X81.54 Y105.8 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X81.54 Y105.01 E.02141
G1 X80.46 Y105.01 E.02927
G1 X80.46 Y105.8 E.02141
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X80.46 Y106.169 E.00928
M106 S201.45
G1 F747.227
G1 X80.46 Y106.21 E.00103
G1 F3030.312
G1 X80.06 Y106.21 E.01006
G1 F3496
G1 X79.66 Y106.21 E.01006
G1 X79.26 Y106.21 E.01006
G1 X78.395 Y106.21 E.02175
G3 X77.49 Y105.307 I.007 J-.912 E.0356
G1 X77.49 Y88.24 E.4291
G1 X77.49 Y87.84 E.01006
G1 X77.49 Y87.44 E.01006
G1 F3030.312
G1 X77.49 Y87.04 E.01006
G1 F747.227
G1 X77.531 Y87.04 E.00103
M106 S255
G1 F600
G1 X77.9 Y87.04 E.00928
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255

G1 X78.49 Y87.04 E.01599
G1 X78.49 Y85.96 E.02927
G1 X77.9 Y85.96 E.01599
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 X77.531 Y85.96 E.00928
M106 S201.45
G1 F747.227
G1 X77.49 Y85.96 E.00103
G1 F3030.312
G1 X77.49 Y85.56 E.01006
G1 F3496
G1 X77.49 Y85.16 E.01006
G1 X77.49 Y84.76 E.01006
G1 X77.49 Y78.695 E.15248
G3 X78.395 Y77.79 I.92 J.015 E.03558
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.605 Y77.79 E.23419
G3 X101.989 Y77.878 I-.007 J.913 E.00998
G1 X102.076 Y77.938 E.00266
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.243 Y78.057 E-.07779
G1 X102.381 Y78.232 E-.08485
G1 X102.441 Y78.352 E-.05104
G1 X102.493 Y78.524 E-.06839
G1 X102.509 Y78.652 E-.04902
G1 X102.51 Y79.76 E-.42079
G1 X102.51 Y79.781 E-.00812
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.136 Y81.752 Z7.96 F42000
G1 X77.9 Y86.36 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X78.089 Y86.36 E.00513
G1 X78.089 Y86.639 E.00755
M106 S201.45
M106 S255
G1 F3000
G1 X77.9 Y86.639 E.00513
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X77.518 Y86.639 E.01036
M106 S201.45
G1 F1166.154
G1 X77.518 Y86.36 E.00755
M106 S255
G1 F600
G1 X77.84 Y86.36 E.00874
M106 S201.45
; WIPE_START
G1 X78.089 Y86.36 E-.1114
G1 X78.089 Y86.639 E-.12451
G1 X77.9 Y86.639 E-.08459
G1 X77.518 Y86.639 E-.1709
G1 X77.518 Y86.36 E-.12451
G1 X77.84 Y86.36 E-.14409
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I.83 J.89 P1  F42000
G1 X88.35 Y76.559 Z7.96
G1 Z7.56
G1 E.8 F1800
G1 F3496
M204 S6000
G1 X88.365 Y76.589 E.0009
G2 X89.234 Y77.404 I1.834 J-1.085 E.03273
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.0291
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.324 Y76.505 E.00124
M204 S250
G1 X88.712 Y76.385 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
M204 S5000
G1 X88.605 Y76.129 E.00697
G3 X89.819 Y74.251 I1.394 J-.431 E.06405
G1 X89.964 Y74.24 E.00366
G3 X88.741 Y76.437 I.036 J1.459 E.15433
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.605 Y76.129 E-.12797
M73 P89 R0
G1 X88.547 Y75.845 E-.11034
G1 X88.542 Y75.62 E-.08543
G1 X88.584 Y75.342 E-.10704
G1 X88.685 Y75.064 E-.11204
G1 X88.837 Y74.817 E-.11031
G1 X89.028 Y74.611 E-.10687
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z7.96 F42000
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3496
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.398 E.00532
G2 X91.695 Y76.464 I-.86 J-1.792 E.03647
G1 X91.889 Y76.508 E.00539
G1 X91.889 Y77.529 E.02766
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41154
G1 X90.762 Y77.398 E-.07466
G1 X91.083 Y77.213 E-.14087
G1 X91.346 Y76.982 E-.13293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.415 Y79.86 Z7.96 F42000
G1 X102.1 Y81.36 Z7.96
G1 Z7.56
G1 E.8 F1800
M106 S255
G1 F600
M204 S6000
G1 X102.483 Y81.36 E.01036
M106 S201.45
G1 F1182.642
G1 X102.489 Y81.639 E.00755
G1 F623.509
G1 X102.483 Y81.639 E.00019
M106 S255
G1 F600
G1 X102.1 Y81.639 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X101.911 Y81.639 E.00513
G1 X101.911 Y81.36 E.00755
G1 X102.04 Y81.36 E.0035
M106 S201.45
; WIPE_START
M204 S6000
G1 X102.483 Y81.36 E-.1969
G1 X102.489 Y81.639 E-.12405
G1 X102.483 Y81.639 E-.00305
G1 X102.1 Y81.639 E-.1702
G1 X101.911 Y81.639 E-.08425
G1 X101.911 Y81.36 E-.12401
G1 X102.04 Y81.36 E-.05755
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I-1.217 J.004 P1  F42000
G1 X102.1 Y100.36 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X102.483 Y100.36 E.01036
M106 S201.45
M73 P90 R0
G1 F1182.642
G1 X102.489 Y100.639 E.00755
G1 F623.509
G1 X102.483 Y100.639 E.00019
M106 S255
G1 F600
G1 X102.1 Y100.639 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X101.911 Y100.639 E.00513
G1 X101.911 Y100.36 E.00755
G1 X102.04 Y100.36 E.0035
M106 S201.45
; WIPE_START
M204 S6000
G1 X102.483 Y100.36 E-.1969
G1 X102.489 Y100.639 E-.12405
G1 X102.483 Y100.639 E-.00305
G1 X102.1 Y100.639 E-.1702
G1 X101.911 Y100.639 E-.08425
G1 X101.911 Y100.36 E-.12401
G1 X102.04 Y100.36 E-.05755
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I-.307 J-1.178 P1  F42000
G1 X81.139 Y105.8 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X81.139 Y106.182 E.01036
M106 S201.45
G1 F622.61
G1 X81.139 Y106.189 E.00018
G1 F1182.008
G1 X80.861 Y106.182 E.00755
M106 S255
G1 F600
G1 X80.861 Y105.8 E.01036
M106 S201.45
; FEATURE: Overhang wall
M106 S255

M204 S5000
G1 X80.861 Y105.41 E.01055
G1 X81.139 Y105.41 E.00755
G1 X81.139 Y105.74 E.00892
M106 S201.45
; WIPE_START
M204 S6000
G1 X81.139 Y106.182 E-.16815
G1 X81.139 Y106.189 E-.00251
G1 X80.861 Y106.182 E-.10593
G1 X80.861 Y105.8 E-.14535
G1 X80.861 Y105.41 E-.14795
G1 X81.139 Y105.41 E-.1059
G1 X81.139 Y105.632 E-.08421
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.96 I1.132 J.447 P1  F42000
G1 X92.29 Y77.41 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3496
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.297 E.66855
G3 X101.666 Y106.588 I-1.307 J-.014 E.0492
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.004 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.066 Y73.411 I2.296 J.319 E.08483
G3 X92.282 Y75.41 I-.076 J2.312 E.08154
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z7.56
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.179631
G1 F3496
M204 S6000
G1 X91.259 Y77.367 E.00427
M204 S10000
G1 X91.504 Y77.381 F42000
; LINE_WIDTH: 0.227608
G1 F3496
M204 S6000
G1 X91.682 Y76.93 E.0061
M204 S10000
G1 X91.587 Y76.234 F42000
; LINE_WIDTH: 0.469491
G1 F3496
M204 S6000
G1 X91.855 Y76.06 E.00906
; LINE_WIDTH: 0.465741
G1 X91.87 Y75.499 E.01578
G2 X88.13 Y75.898 I-1.869 J.207 E.16571
G1 X88.149 Y76.062 E.00466
; LINE_WIDTH: 0.464125
G1 X88.413 Y76.233 E.00883
M204 S10000
G1 X89.408 Y77.531 F42000
; LINE_WIDTH: 0.482548
G1 F3496
M204 S6000
G2 X90.589 Y77.537 I.613 J-4.321 E.03464
; WIPE_START
G1 F10039.904
G1 X90.034 Y77.575 E-.35725
G1 X89.408 Y77.531 E-.40275
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.634 Y81.049 Z7.96 F42000
G1 X80.078 Y82.377 Z7.96
G1 Z7.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F3496
M204 S5000
G1 X80.189 Y82.385 E.0025
G3 X79.917 Y82.392 I-.12 J.678 E.09065
G1 X80.019 Y82.379 E.0023
M204 S250
G1 X79.646 Y82.501 F42000
G1 F3496
M204 S5000
G1 X79.778 Y82.416 E.0035
G3 X80.052 Y82.354 I.292 J.648 E.00634
G1 X80.123 Y82.356 E.00158
G3 X79.596 Y82.534 I-.053 J.709 E.08711
; CHANGE_LAYER
; Z_HEIGHT: 7.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
M204 S6000
G1 X79.778 Y82.416 E-.08229
G1 X79.912 Y82.371 E-.05377
G1 X80.052 Y82.354 E-.05375
G1 X80.123 Y82.356 E-.02675
G1 X80.365 Y82.418 E-.09492
G1 X80.485 Y82.487 E-.05295
G1 X80.591 Y82.581 E-.05377
G1 X80.677 Y82.694 E-.05374
G1 X80.738 Y82.821 E-.05378
G1 X80.773 Y82.959 E-.05388
G1 X80.78 Y83.1 E-.05379
G1 X80.759 Y83.24 E-.05382
G1 X80.711 Y83.373 E-.0538
G1 X80.684 Y83.416 E-.01899
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/51
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.96 I.811 J.907 P1  F42000
G1 X88.35 Y76.558 Z7.96
G1 Z7.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2176
M204 S6000
G1 X88.365 Y76.589 E.00092
G2 X89.234 Y77.404 I1.834 J-1.085 E.03272
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.0291
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.324 Y76.504 E.00122
M204 S250
G1 X88.712 Y76.384 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2176
M204 S5000
G1 X88.606 Y76.13 E.00694
G3 X89.818 Y74.251 I1.394 J-.431 E.06406
G1 X89.964 Y74.24 E.00366
G3 X88.741 Y76.437 I.036 J1.459 E.15435
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.606 Y76.13 E-.12754
G1 X88.547 Y75.845 E-.11049
G1 X88.542 Y75.621 E-.08511
G1 X88.585 Y75.341 E-.10764
G1 X88.685 Y75.065 E-.11155
G1 X88.837 Y74.817 E-.11043
G1 X89.029 Y74.61 E-.10725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z8.12 F42000
G1 Z7.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2176
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.398 E.00532
G2 X91.702 Y76.462 I-.803 J-1.746 E.03668
G1 X91.889 Y76.51 E.00525
G1 X91.889 Y77.529 E.0276
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41153
G1 X90.762 Y77.398 E-.07466
G1 X91.085 Y77.212 E-.14151
G1 X91.346 Y76.982 E-.13229
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.335 Y81.685 Z8.12 F42000
G1 X78.49 Y87.04 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2176
M204 S5000
G1 X78.49 Y85.96 E.02715
G1 X77.49 Y85.96 E.02514
G1 X77.49 Y78.694 E.18266
G3 X78.395 Y77.79 I.92 J.016 E.03558
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.605 Y77.79 E.23419
G3 X102.509 Y78.652 I-.007 J.913 E.03461
G1 X102.51 Y80.96 E.05801
M73 P91 R0
G1 X101.51 Y80.96 E.02514
G1 X101.51 Y82.04 E.02715
G1 X102.51 Y82.04 E.02514
G1 X102.51 Y99.96 E.45053
G1 X101.51 Y99.96 E.02514
G1 X101.51 Y101.04 E.02715
G1 X102.51 Y101.04 E.02514
G1 X102.509 Y105.347 E.10829
G3 X101.605 Y106.21 I-.92 J-.059 E.03453
G1 X81.54 Y106.21 E.50446
G1 X81.54 Y105.01 E.03017
G1 X80.46 Y105.01 E.02715
G1 X80.46 Y106.21 E.03017
G1 X78.395 Y106.21 E.05192
G3 X77.49 Y105.305 I.007 J-.912 E.03566
G1 X77.49 Y87.04 E.45921
G1 X78.43 Y87.04 E.02363
; WIPE_START
G1 F11668.197
M204 S6000
G1 X78.49 Y85.96 E-.41104
G1 X77.572 Y85.96 E-.34896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I.611 J1.052 P1  F42000
G1 X92.29 Y77.41 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F2176
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.299 J-.003 E.04933
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.3 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.064 Y73.411 I2.297 J.319 E.08477
G3 X92.282 Y75.41 I-.074 J2.312 E.0816
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
; WIPE_END
M73 P92 R0
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

G1 X91.682 Y77.207
G1 Z7.72
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.184465
G1 F2176
M204 S6000
G1 X91.259 Y77.367 E.00442
M204 S10000
G1 X91.504 Y77.381 F42000
; LINE_WIDTH: 0.226013
G1 F2176
M204 S6000
G1 X91.682 Y76.93 E.00605
M204 S10000
G1 X91.588 Y76.227 F42000
; LINE_WIDTH: 0.464324
G1 F2176
M204 S6000
G1 X91.852 Y76.06 E.00874
; LINE_WIDTH: 0.465783
G1 X91.871 Y75.873 E.00529
G1 X91.87 Y75.5 E.01051
G2 X88.13 Y75.898 I-1.869 J.207 E.16569
G1 X88.149 Y76.062 E.00466
; LINE_WIDTH: 0.464221
G1 X88.413 Y76.233 E.00884
M204 S10000
G1 X89.408 Y77.531 F42000
; LINE_WIDTH: 0.482543
G1 F2176
M204 S6000
G2 X90.589 Y77.537 I.613 J-4.318 E.03464
; WIPE_START
G1 F10040.021
G1 X90.034 Y77.575 E-.35681
G1 X89.408 Y77.531 E-.40319
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.646 Y79.95 Z8.12 F42000
G1 X102.263 Y81.828 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2176
M204 S2000
G1 X102.678 Y81.413 E.01475
G1 X102.373 Y81.172
G1 X101.722 Y81.823 E.02316
; WIPE_START
G1 F11668.197
M204 S6000
G1 X102.373 Y81.172 E-.36917
G1 X102.678 Y81.413 E-.15563
G1 X102.263 Y81.828 E-.2352
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I-1.217 J.013 P1  F42000
G1 X102.463 Y100.172 Z8.12
G1 Z7.72
G1 E.8 F1800
G1 F2176
M204 S2000
G1 X101.807 Y100.828 E.02332
M204 S10000
G1 X102.64 Y100.847 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.152375
G1 F2176
M204 S6000
G1 X102.64 Y100.267 E.00446
G1 X102.592 Y100.152 E.00096
; WIPE_START
G1 F18000
G1 X102.64 Y100.267 E-.13443
G1 X102.64 Y100.847 E-.62557
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I-.285 J-1.183 P1  F42000
G1 X80.672 Y106.145 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2176
M204 S2000
G1 X81.328 Y105.49 E.02332
G1 X81.05 Y105.222
G1 X80.672 Y105.6 E.01345
M204 S10000
G1 X81.347 Y106.329 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.170803
G1 F2176
M204 S6000
G1 X80.761 Y106.329 E.00521
G1 X80.653 Y106.285 E.00104
; WIPE_START
G1 F18000
G1 X80.761 Y106.329 E-.12649
G1 X81.347 Y106.329 E-.63351
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.12 I1.203 J-.183 P1  F42000
G1 X78.278 Y86.178 Z8.12
G1 Z7.72
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2176
M204 S2000
G1 X77.628 Y86.828 E.02309
G1 X77.323 Y86.588
G1 X77.739 Y86.172 E.0148
; CHANGE_LAYER
; Z_HEIGHT: 7.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.323 Y86.588 E-.23595
G1 X77.628 Y86.828 E-.15576
G1 X78.278 Y86.178 E-.36829
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/51
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.12 I.841 J.88 P1  F42000
G1 X88.35 Y76.558 Z8.12
G1 Z7.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1951
M204 S6000
G1 X88.365 Y76.589 E.00095
G2 X89.234 Y77.404 I1.834 J-1.085 E.03272
G1 X89.184 Y77.589 E.00518
G1 X88.111 Y77.589 E.0291
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.324 Y76.504 E.0012
M204 S250
G1 X88.712 Y76.384 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1951
M204 S5000
G1 X88.606 Y76.129 E.00693
G3 X89.818 Y74.251 I1.394 J-.431 E.06405
G1 X89.964 Y74.24 E.00366
G3 X88.741 Y76.436 I.036 J1.459 E.15437
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.606 Y76.129 E-.12737
G1 X88.547 Y75.845 E-.11035
G1 X88.542 Y75.622 E-.08473
G1 X88.585 Y75.338 E-.10904
G1 X88.685 Y75.065 E-.1104
G1 X88.836 Y74.817 E-.11047
G1 X89.029 Y74.61 E-.10763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z8.28 F42000
G1 Z7.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1951
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.398 E.00532
G2 X91.701 Y76.462 I-.802 J-1.745 E.03669
G1 X91.889 Y76.51 E.00525
G1 X91.889 Y77.529 E.02761
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41154
G1 X90.762 Y77.398 E-.0746
G1 X91.088 Y77.21 E-.14299
G1 X91.346 Y76.982 E-.13088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.032 Y83.857 Z8.28 F42000
G1 X77.547 Y105.607 Z8.28
G1 Z7.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1951
M204 S5000
G3 X77.49 Y105.308 I.864 J-.318 E.00771
G1 X77.49 Y78.694 E.66909
G3 X78.395 Y77.79 I.92 J.016 E.03557
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.605 Y77.79 E.23419
G3 X102.51 Y78.695 I-.021 J.926 E.03553
G1 X102.51 Y105.305 E.66901
G3 X101.608 Y106.21 I-.92 J-.015 E.03552
G1 X78.395 Y106.21 E.58359
G3 X77.569 Y105.663 I.015 J-.921 E.02629
; WIPE_START
G1 F11668.197
M204 S6000
M73 P93 R0
G1 X77.499 Y105.432 E-.09166
G1 X77.49 Y105.308 E-.04747
G1 X77.49 Y103.674 E-.62087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.237 Y97.024 Z8.28 F42000
G1 X92.29 Y77.41 Z8.28
G1 Z7.88
G1 E.8 F1800
G1 F1951
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.307 J-.011 E.04926
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.011 J-1.307 E.04926
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.299 J.003 E.05112
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.062 Y73.411 I2.296 J.319 E.08472
G3 X92.282 Y75.41 I-.072 J2.312 E.08166
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.208
G1 Z7.88
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.184043
G1 F1951
M204 S6000
G1 X91.26 Y77.367 E.0044
M204 S10000
G1 X91.504 Y77.381 F42000
; LINE_WIDTH: 0.225819
G1 F1951
M204 S6000
G1 X91.682 Y76.93 E.00605
M204 S10000
G1 X91.834 Y76.289 F42000
; LINE_WIDTH: 0.46665
G1 F1951
M204 S6000
G2 X91.76 Y75.056 I-2.368 J-.477 E.03522
G1 X91.723 Y74.961 E.00287
G2 X88.13 Y75.898 I-1.725 J.743 E.15026
G1 X88.149 Y76.062 E.00466
; LINE_WIDTH: 0.464127
G1 X88.414 Y76.233 E.00884
M204 S10000
G1 X89.408 Y77.531 F42000
; LINE_WIDTH: 0.482526
G1 F1951
M204 S6000
G2 X90.589 Y77.537 I.612 J-4.314 E.03463
; CHANGE_LAYER
; Z_HEIGHT: 8.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10040.386
G1 X90.035 Y77.575 E-.35631
G1 X89.408 Y77.531 E-.40369
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/51
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.28 I.824 J-.896 P1  F42000
G1 X88.35 Y76.557 Z8.28
G1 Z8.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1946
M204 S6000
G1 X88.365 Y76.59 E.00098
G2 X89.234 Y77.404 I1.834 J-1.086 E.0327
G1 X89.185 Y77.589 E.00518
G1 X88.111 Y77.589 E.0291
G1 X88.111 Y76.508 E.02929
G1 X88.305 Y76.464 E.00539
G1 X88.324 Y76.503 E.00119
M204 S250
G1 X88.711 Y76.383 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1946
M204 S5000
G1 X88.606 Y76.13 E.00691
G3 X89.818 Y74.251 I1.394 J-.431 E.06405
G1 X89.964 Y74.24 E.00366
G3 X88.74 Y76.436 I.036 J1.459 E.1544
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.606 Y76.13 E-.12705
G1 X88.547 Y75.848 E-.10942
G1 X88.542 Y75.627 E-.08391
G1 X88.585 Y75.339 E-.11051
G1 X88.684 Y75.066 E-.11049
G1 X88.836 Y74.818 E-.11052
G1 X89.03 Y74.609 E-.1081
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.889 Y77.589 Z8.44 F42000
G1 Z8.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1946
M204 S6000
G1 X90.808 Y77.589 E.0293
G1 X90.762 Y77.398 E.00532
G2 X91.701 Y76.462 I-.803 J-1.745 E.03668
G1 X91.889 Y76.51 E.00525
G1 X91.889 Y77.529 E.02761
; WIPE_START
G1 F10826.06
G1 X90.808 Y77.589 E-.41151
G1 X90.762 Y77.398 E-.07463
G1 X91.086 Y77.211 E-.14227
G1 X91.346 Y76.982 E-.13159
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.964 Y84.151 Z8.44 F42000
G1 X101.987 Y106.118 Z8.44
G1 Z8.04
M73 P94 R0
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1946
M204 S5000
G3 X101.605 Y106.21 I-.403 J-.834 E.00995
G1 X78.395 Y106.21 E.58353
G3 X77.49 Y105.305 I.021 J-.926 E.03552
G1 X77.49 Y78.694 E.66903
G3 X78.395 Y77.79 I.92 J.016 E.03557
G1 X87.71 Y77.79 E.23419
G1 X87.71 Y77.99 E.00503
G1 X92.29 Y77.99 E.11515
G1 X92.29 Y77.79 E.00503
G1 X101.605 Y77.79 E.23419
G3 X102.51 Y78.695 I-.021 J.926 E.03553
G1 X102.51 Y105.305 E.66901
G3 X102.04 Y106.09 I-.926 J-.021 E.02407
; WIPE_START
G1 F11668.197
M204 S6000
G1 X101.778 Y106.192 E-.10697
G1 X101.605 Y106.21 E-.06599
G1 X100.06 Y106.21 E-.58705
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.072 Y98.841 Z8.44 F42000
G1 X92.29 Y77.41 Z8.44
G1 Z8.04
G1 E.8 F1800
G1 F1946
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.294 E.66849
G3 X101.666 Y106.588 I-1.307 J-.011 E.04926
G1 X78.405 Y106.59 E.5848
G3 X77.112 Y105.365 I.004 J-1.299 E.04933
G1 X77.11 Y78.705 E.67028
G3 X78.405 Y77.41 I1.306 J.01 E.05104
G1 X87.71 Y77.41 E.23393
M73 P95 R0
G1 X87.718 Y75.41 E.05028
G3 X90.059 Y73.41 I2.296 J.319 E.08465
G3 X92.282 Y75.41 I-.069 J2.313 E.08173
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X91.682 Y77.207
G1 Z8.04
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.183087
G1 F1946
M204 S6000
G1 X91.26 Y77.367 E.00437
M204 S10000
G1 X91.504 Y77.381 F42000
; LINE_WIDTH: 0.223494
G1 F1946
M204 S6000
G1 X91.682 Y76.93 E.00598
M204 S10000
G1 X91.834 Y76.289 F42000
; LINE_WIDTH: 0.466661
G1 F1946
M204 S6000
G2 X91.76 Y75.056 I-2.366 J-.477 E.03521
G1 X91.724 Y74.962 E.00285
G2 X88.13 Y75.903 I-1.726 J.742 E.15044
G1 X88.149 Y76.062 E.00453
; LINE_WIDTH: 0.46333
G1 X88.413 Y76.233 E.0088
M204 S10000
G1 X89.408 Y77.531 F42000
; LINE_WIDTH: 0.482537
G1 F1946
M204 S6000
G2 X90.589 Y77.537 I.611 J-4.315 E.03463
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F10040.142
G1 X90.036 Y77.575 E-.35579
G1 X89.408 Y77.531 E-.40421
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/51
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.44 I1.043 J-.626 P1  F42000
G1 X88.712 Y76.373 Z8.44
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1775
M204 S5000
G1 X88.656 Y76.266 E.00304
G3 X89.818 Y74.251 I1.344 J-.568 E.06771
G1 X89.964 Y74.24 E.00366
G3 X88.795 Y76.521 I.036 J1.459 E.15184
G1 X88.741 Y76.426 E.00275
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.656 Y76.266 E-.06882
G1 X88.569 Y75.989 E-.11038
G1 X88.547 Y75.845 E-.05539
G1 X88.547 Y75.557 E-.10946
G1 X88.585 Y75.339 E-.08393
G1 X88.684 Y75.066 E-.11053
G1 X88.836 Y74.818 E-.1105
G1 X89.034 Y74.605 E-.11052
G1 X89.035 Y74.604 E-.00049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.29 Y77.41 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F1775
M204 S5000
G1 X101.595 Y77.41 E.23393
G3 X102.89 Y78.705 I.001 J1.294 E.05117
G1 X102.89 Y105.297 E.66855
M73 P96 R0
G3 X101.597 Y106.59 I-1.299 J-.006 E.051
G1 X95.21 Y106.59 E.16058
G1 X95.21 Y106.21 E.00956
G1 X101.647 Y106.209 E.16184
G2 X102.51 Y105.308 I-.066 J-.926 E.03439
G1 X102.51 Y78.694 E.6691
G2 X101.608 Y77.79 I-.912 J.008 E.03558
G1 X92.29 Y77.79 E.23427
G1 X92.29 Y77.99 E.00503
G1 X87.71 Y77.99 E.11515
G1 X87.71 Y77.79 E.00503
G1 X78.355 Y77.79 E.23519
G2 X77.49 Y78.695 I.047 J.912 E.03467
G1 X77.49 Y105.305 E.66901
G2 X78.353 Y106.209 I.928 J-.022 E.03447
G1 X84.79 Y106.21 E.16184
G1 X84.79 Y106.59 E.00956
G1 X78.403 Y106.59 E.16058
G3 X77.112 Y105.363 I.014 J-1.307 E.04926
G1 X77.11 Y78.703 E.67028
G3 X78.405 Y77.41 I1.306 J.013 E.05098
G1 X87.71 Y77.41 E.23393
G1 X87.718 Y75.41 E.05028
G3 X90.171 Y73.416 I2.29 J.311 E.08752
M73 P97 R0
G3 X92.282 Y75.41 I-.189 J2.315 E.07886
G1 X92.29 Y77.35 E.04877
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.29 Y77.363 E-.76
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

G1 X92.078 Y77.079
G1 Z8.2
G1 E.8 F1800
; FEATURE: Top surface
G1 F1775
M204 S2000
G1 X91.692 Y76.694 E.01371
G1 X91.255 Y76.802
G1 X92.078 Y77.625 E.02926
G1 X91.685 Y77.778
G1 X90.967 Y77.059 E.02554
M204 S10000
G1 X90.866 Y77.13 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.113452
G1 F1775
M204 S6000
G1 X90.835 Y77.156 E.00021
G2 X90.792 Y77.191 I.077 J.14 E.00029
G1 X90.925 Y77.797 E.0032
M204 S10000
G1 X90.589 Y77.537 F42000
; LINE_WIDTH: 0.482533
G1 F1775
M204 S6000
G3 X89.408 Y77.531 I-.57 J-4.321 E.03463
; WIPE_START
G1 F10040.235
G1 X90.036 Y77.575 E-.40419
G1 X90.589 Y77.537 E-.35581
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.389 Y76.662 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1775
M204 S2000
G1 X89.201 Y77.474 E.02887
G1 X88.958 Y77.778
G1 X87.922 Y76.741 E.03684
G1 X87.922 Y77.287
G1 X88.413 Y77.777 E.01745
; WIPE_START
G1 F11668.197
M204 S6000
G1 X87.922 Y77.287 E-.26372
G1 X87.922 Y76.741 E-.20726
G1 X88.46 Y77.279 E-.28903
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.532 Y76.469 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0890495
G1 F1775
M204 S6000
G1 X88.447 Y76.575 E.00049
M204 S10000
G1 X88.302 Y76.749 F42000
; LINE_WIDTH: 0.13638
G1 F1775
M204 S6000
G2 X88.068 Y76.564 I-.765 J.727 E.00199
; LINE_WIDTH: 0.0996652
G1 X88.071 Y76.542 E.0001
; LINE_WIDTH: 0.0643348
G1 X88.075 Y76.52 E.00004
M204 S10000
G1 X88.413 Y76.233 F42000
; LINE_WIDTH: 0.462909
G1 F1775
M204 S6000
G1 X88.149 Y76.063 E.00878
; LINE_WIDTH: 0.465799
G1 X88.13 Y75.898 E.00467
G3 X91.87 Y75.501 I1.871 J-.191 E.16575
G1 X91.871 Y75.876 E.01053
G1 X91.851 Y76.062 E.00528
; LINE_WIDTH: 0.463377
G1 X91.587 Y76.233 E.0088
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F10488.526
G1 X91.851 Y76.062 E-.76
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


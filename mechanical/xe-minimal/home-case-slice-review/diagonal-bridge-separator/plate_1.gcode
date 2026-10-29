; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 1m 19s; total estimated time: 1m 38s
; total layer number: 7
; total filament length [mm] : 77.34
; total filament volume [cm^3] : 186.02
; total filament weight [g] : 0.23
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 1.10
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
; initial_layer_print_height = 0.14
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
M73 P0 R1
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
M73 P1 R1
G1 X10.1 Y200.0 Z0.28 F1500.0 E15 ;Draw the first line
G1 X10.4 Y200.0 Z0.28 F5000.0 ;Move to side a little
G1 X10.4 Y20 Z0.28 F1500.0 E30 ;Draw the second line
G92 E0 ;Reset Extruder 
M73 P9 R1
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
; Z_HEIGHT: 0.14
; LAYER_HEIGHT: 0.14
G1 E-.8 F1800
; layer num/total_layer_count: 1/7
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
M73 P16 R1
G1 X85.879 Y83.584 F42000
M204 S6000
M73 P19 R1
G1 Z.4
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X77.02 Y88.294 E.26897
G1 X77.02 Y83.37 E.132
G1 X83.02 Y83.37 E.16084
G1 X83.02 Y82.17 E.03217
G1 X83.98 Y82.17 E.02574
M73 P20 R1
G1 X83.98 Y83.37 E.03217
G1 X85.826 Y83.37 E.04948
G1 X85.865 Y83.525 E.0043
; WIPE_START
G1 X84.104 Y84.475 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X87.55 Y82.9 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X87.55 Y81.7 E.03217
G1 X89.45 Y81.7 E.05093
G1 X89.45 Y82.104 E.01083
G1 X89.933 Y81.847 E.01465
G1 X89.979 Y81.936 E.00268
G1 X76.55 Y89.076 E.40773
G1 X76.55 Y82.9 E.16557
G1 X82.55 Y82.9 E.16084
M73 P21 R1
G1 X82.55 Y81.7 E.03217
G1 X84.45 Y81.7 E.05093
G1 X84.45 Y82.9 E.03217
G1 X87.49 Y82.9 E.08149
; WIPE_START
G1 X87.55 Y81.7 E-.45657
G1 X88.349 Y81.7 E-.30343
; WIPE_END
G1 E-.04 F1800
M204 S6000
M73 P22 R1
G1 X83.708 Y87.76 Z.54 F42000
G1 X78.629 Y94.393 Z.54
G1 Z.14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X99.359 Y83.37 E.62939
G1 X100.525 Y83.37 E.03125
G1 X100.525 Y85.465 E.05616
G1 X102.98 Y85.465 E.06581
G1 X102.98 Y97.83 E.33147
G1 X102.17 Y97.83 E.02172
M73 P23 R1
G1 X102.17 Y97.23 E.01608
G1 X98.83 Y97.23 E.08953
G1 X98.83 Y97.83 E.01608
G1 X83.17 Y97.83 E.4198
G1 X83.17 Y97.23 E.01608
G1 X79.83 Y97.23 E.08953
M73 P24 R1
G1 X79.83 Y97.83 E.01608
G1 X77.02 Y97.83 E.07533
G1 X77.02 Y91.822 E.16107
G1 X77.234 Y91.768 E.00591
G1 X78.601 Y94.34 E.07806
M204 S6000
G1 X78.823 Y93.757 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X99.242 Y82.9 E.61993
G1 X100.995 Y82.9 E.04699
G1 X100.995 Y84.995 E.05616
M73 P25 R1
G1 X103.45 Y84.995 E.06581
G1 X103.45 Y98.3 E.35666
G1 X101.7 Y98.3 E.04691
G1 X101.7 Y97.7 E.01608
G1 X99.3 Y97.7 E.06434
G1 X99.3 Y98.3 E.01608
G1 X82.7 Y98.3 E.44499
M73 P26 R1
G1 X82.7 Y97.7 E.01608
G1 X80.3 Y97.7 E.06434
G1 X80.3 Y98.3 E.01608
G1 X76.55 Y98.3 E.10053
G1 X76.55 Y89.481 E.2364
G1 X78.795 Y93.704 E.1282
; WIPE_START
G1 X80.563 Y92.77 E-.76
; WIPE_END
M73 P27 R1
G1 E-.04 F1800
M204 S6000
G17
G3 Z.54 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X83.5 Y83.605
G1 Z.14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.520204
G1 F3000
M204 S500
G1 X83.5 Y82.405 E.03355
; WIPE_START
G1 X83.5 Y83.605 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X84.151 Y83.558 Z.54 F42000
G1 Z.14
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.519834
G1 F6300
M204 S500
G1 X84.472 Y83.879 E.01271
G1 X84.02 Y84.12 E.01431
G1 X83.904 Y84.004 E.00457
G1 X83.212 Y84.004 E.01935
G1 X83.568 Y84.36 E.01407
G1 X83.116 Y84.601 E.01431
M73 P28 R1
G1 X82.284 Y83.769 E.03285
G1 X81.591 Y83.769 E.01935
G1 X82.663 Y84.841 E.04235
G1 X82.211 Y85.082 E.01431
G1 X80.899 Y83.769 E.05185
G1 X80.206 Y83.769 E.01935
G1 X81.759 Y85.322 E.06135
G1 X81.307 Y85.563 E.01431
G1 X79.513 Y83.769 E.07085
G1 X78.821 Y83.769 E.01935
G1 X80.855 Y85.803 E.08035
G1 X80.402 Y86.043 E.01431
G1 X78.128 Y83.769 E.08985
G1 X77.435 Y83.769 E.01935
G1 X79.95 Y86.284 E.09935
M73 P29 R1
G1 X79.498 Y86.524 E.01431
G1 X77.419 Y84.446 E.08213
G1 X77.419 Y85.138 E.01935
G1 X79.046 Y86.765 E.06426
G1 X78.593 Y87.005 E.01431
G1 X77.419 Y85.831 E.04639
G1 X77.419 Y86.524 E.01935
G1 X78.141 Y87.246 E.02852
G1 X77.689 Y87.486 E.01431
G1 X77.208 Y87.005 E.01901
; WIPE_START
G1 X77.689 Y87.486 E-.25859
G1 X78.141 Y87.246 E-.19462
G1 X77.57 Y86.675 E-.30679
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X85.157 Y85.837 Z.54 F42000
G1 X100.337 Y84.16 Z.54
G1 Z.14
M73 P30 R1
G1 E.8 F1800
; LINE_WIDTH: 0.505664
G1 F6300
M204 S500
G1 X99.947 Y83.769 E.01498
G1 X99.459 Y83.769 E.01323
G1 X99.338 Y83.833 E.00371
G1 X100.337 Y84.832 E.03833
; WIPE_START
G1 X99.338 Y83.833 E-.53686
G1 X99.459 Y83.769 E-.05195
G1 X99.909 Y83.769 E-.17119
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X101.83 Y85.653 Z.54 F42000
G1 Z.14
G1 E.8 F1800
G1 F6300
M204 S500
G1 X102.581 Y86.403 E.0288
G1 X102.581 Y87.076 E.01825
G1 X101.158 Y85.653 E.0546
; WIPE_START
G1 X102.572 Y87.067 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X102.792 Y87.96 Z.54 F42000
G1 Z.14
G1 E.8 F1800
G1 F6300
M204 S500
G1 X100.696 Y85.864 E.08041
G1 X100.126 Y85.864 E.01548
G1 X100.126 Y85.294 E.01548
M73 P31 R1
G1 X98.899 Y84.067 E.04706
G1 X98.46 Y84.3 E.01349
G1 X102.581 Y88.421 E.1581
G1 X102.581 Y89.094 E.01825
G1 X98.021 Y84.534 E.17495
G1 X97.582 Y84.767 E.01349
G1 X102.581 Y89.766 E.1918
G1 X102.581 Y90.439 E.01825
G1 X97.143 Y85.001 E.20865
G1 X96.703 Y85.234 E.01349
G1 X102.581 Y91.112 E.2255
M73 P32 R1
G1 X102.581 Y91.784 E.01825
G1 X96.264 Y85.468 E.24235
G1 X95.825 Y85.701 E.01349
G1 X102.581 Y92.457 E.25919
G1 X102.581 Y93.13 E.01825
G1 X95.386 Y85.935 E.27604
M73 P33 R1
G1 X94.947 Y86.168 E.01349
G1 X102.581 Y93.802 E.29289
G1 X102.581 Y94.475 E.01825
G1 X94.508 Y86.402 E.30974
G1 X94.069 Y86.635 E.01349
G1 X102.581 Y95.148 E.32659
G1 X102.581 Y95.82 E.01825
G1 X93.629 Y86.869 E.34344
M73 P34 R1
G1 X93.19 Y87.102 E.01349
G1 X102.581 Y96.493 E.36029
G1 X102.581 Y97.165 E.01825
G1 X92.751 Y87.336 E.37713
G1 X92.312 Y87.569 E.01349
G1 X101.573 Y96.831 E.35534
M73 P35 R1
G1 X100.901 Y96.831 E.01825
G1 X91.873 Y87.803 E.34638
G1 X91.434 Y88.036 E.01349
G1 X100.228 Y96.831 E.33742
G1 X99.556 Y96.831 E.01825
G1 X90.995 Y88.27 E.32846
M73 P36 R1
G1 X90.556 Y88.503 E.01349
G1 X98.883 Y96.831 E.3195
G1 X98.431 Y96.831 E.01227
G1 X98.431 Y97.051 E.00598
G1 X90.116 Y88.737 E.319
G1 X89.677 Y88.97 E.01349
G1 X98.138 Y97.431 E.3246
M73 P37 R1
G1 X97.465 Y97.431 E.01825
G1 X89.238 Y89.204 E.31565
G1 X88.799 Y89.437 E.01349
G1 X96.792 Y97.431 E.30669
G1 X96.12 Y97.431 E.01825
G1 X88.36 Y89.671 E.29773
M73 P38 R1
G1 X87.921 Y89.904 E.01349
G1 X95.447 Y97.431 E.28877
G1 X94.775 Y97.431 E.01825
G1 X87.482 Y90.138 E.27981
G1 X87.042 Y90.371 E.01349
G1 X94.102 Y97.431 E.27085
M73 P39 R1
G1 X93.429 Y97.431 E.01825
G1 X86.603 Y90.605 E.26189
G1 X86.164 Y90.838 E.01349
G1 X92.757 Y97.431 E.25294
M73 P39 R0
G1 X92.084 Y97.431 E.01825
G1 X85.725 Y91.072 E.24398
G1 X85.286 Y91.305 E.01349
G1 X91.411 Y97.431 E.23502
M73 P40 R0
G1 X90.739 Y97.431 E.01825
G1 X84.847 Y91.539 E.22606
G1 X84.408 Y91.772 E.01349
G1 X90.066 Y97.431 E.2171
G1 X89.394 Y97.431 E.01825
G1 X83.969 Y92.006 E.20814
G1 X83.529 Y92.239 E.01349
M73 P41 R0
G1 X88.721 Y97.431 E.19918
G1 X88.048 Y97.431 E.01825
G1 X83.09 Y92.473 E.19023
G1 X82.651 Y92.706 E.01349
G1 X87.376 Y97.431 E.18127
G1 X86.703 Y97.431 E.01825
G1 X82.212 Y92.94 E.17231
G1 X81.773 Y93.173 E.01349
G1 X86.03 Y97.431 E.16335
M73 P42 R0
G1 X85.358 Y97.431 E.01825
G1 X81.334 Y93.407 E.15439
G1 X80.895 Y93.64 E.01349
G1 X84.685 Y97.431 E.14543
G1 X84.012 Y97.431 E.01825
G1 X80.455 Y93.874 E.13648
G1 X80.016 Y94.107 E.01349
G1 X82.74 Y96.831 E.1045
M73 P43 R0
G1 X82.067 Y96.831 E.01825
G1 X79.577 Y94.341 E.09554
G1 X79.138 Y94.574 E.01349
G1 X81.395 Y96.831 E.08658
G1 X80.722 Y96.831 E.01825
G1 X77.419 Y93.528 E.12672
G1 X77.419 Y94.201 E.01825
G1 X80.049 Y96.831 E.10091
G1 X79.431 Y96.831 E.01678
G1 X79.431 Y96.885 E.00146
G1 X77.419 Y94.873 E.07717
G1 X77.419 Y95.546 E.01825
M73 P44 R0
G1 X79.304 Y97.431 E.07232
G1 X78.631 Y97.431 E.01825
G1 X77.419 Y96.219 E.04651
G1 X77.419 Y96.891 E.01825
G1 X78.17 Y97.642 E.02882
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X77.419 Y96.891 E-.40361
G1 X77.419 Y96.219 E-.2556
G1 X77.607 Y96.406 E-.10079
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/7
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S201.45
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.54 I.982 J.718 P1  F42000
G1 X87.51 Y82.86 Z.54
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9673
M204 S5000
G1 X87.51 Y81.66 E.03017
G1 X89.49 Y81.66 E.04978
G1 X89.49 Y82.037 E.00949
G1 X89.949 Y81.793 E.01307
G1 X90.034 Y81.952 E.00453
G1 X76.51 Y89.143 E.38507
G1 X76.51 Y82.86 E.15795
G1 X82.51 Y82.86 E.15084
M73 P45 R0
G1 X82.51 Y81.66 E.03017
G1 X84.49 Y81.66 E.04978
G1 X84.49 Y82.86 E.03017
G1 X87.45 Y82.86 E.07442
; WIPE_START
G1 F11668.197
M204 S6000
G1 X87.51 Y81.66 E-.45657
G1 X88.309 Y81.66 E-.30343
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.591 Y87.66 Z.7 F42000
G1 X78.84 Y93.703 Z.7
G1 Z.3
G1 E.8 F1800
G1 F9673
M204 S5000
G1 X99.232 Y82.86 E.58066
G1 X101.035 Y82.86 E.04532
G1 X101.035 Y84.955 E.05267
G1 X103.49 Y84.955 E.06172
G1 X103.49 Y98.34 E.33651
G1 X101.66 Y98.34 E.04601
G1 X101.66 Y97.74 E.01508
G1 X99.34 Y97.74 E.05833
M73 P46 R0
G1 X99.34 Y98.34 E.01508
G1 X82.66 Y98.34 E.41936
G1 X82.66 Y97.74 E.01508
G1 X80.34 Y97.74 E.05833
G1 X80.34 Y98.34 E.01508
G1 X76.51 Y98.34 E.09628
G1 X76.51 Y89.321 E.22675
G1 X78.812 Y93.65 E.12326
; WIPE_START
G1 F11668.197
M204 S6000
G1 X80.58 Y92.715 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.7 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X86.838 Y83.072
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
G1 F9673
M204 S2000
G1 X86.114 Y83.796 E.02575
; WIPE_START
G1 F11668.197
M204 S6000
G1 X86.838 Y83.072 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.949 Y84.416 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9673
M204 S2000
G1 X86.292 Y83.072 E.04777
G1 X85.747 Y83.072
G1 X83.784 Y85.035 E.06979
; WIPE_START
G1 F11668.197
M204 S6000
M73 P47 R0
G1 X85.198 Y83.621 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.62 Y85.654 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9673
M204 S2000
G1 X85.202 Y83.072 E.0918
G1 X84.656 Y83.072
G1 X81.455 Y86.273 E.11382
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.869 Y84.859 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.29 Y86.893 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9673
M204 S2000
G1 X84.278 Y82.905 E.14178
G1 X84.278 Y82.36
G1 X79.126 Y87.512 E.18319
M204 S10000
G1 X77.961 Y88.131 F42000
G1 F9673
M204 S2000
G1 X84.22 Y81.872 E.22254
G1 X83.675 Y81.872
G1 X82.722 Y82.825 E.03387
G1 X82.722 Y82.279
G1 X83.129 Y81.872 E.01447
; WIPE_START
G1 F11668.197
M204 S6000
M73 P48 R0
G1 X82.722 Y82.279 E-.21876
G1 X82.722 Y82.825 E-.20726
G1 X83.344 Y82.203 E-.33399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.475 Y83.072 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9673
M204 S2000
G1 X76.796 Y88.75 E.20189
G1 X76.722 Y88.279
G1 X81.929 Y83.072 E.18514
G1 X81.384 Y83.072
G1 X76.722 Y87.734 E.16575
G1 X76.722 Y87.188
G1 X80.838 Y83.072 E.14635
G1 X80.293 Y83.072
G1 X76.722 Y86.643 E.12696
G1 X76.722 Y86.098
G1 X79.748 Y83.072 E.10757
G1 X79.202 Y83.072
G1 X76.722 Y85.552 E.08818
G1 X76.722 Y85.007
G1 X78.657 Y83.072 E.06879
M73 P49 R0
G1 X78.111 Y83.072
G1 X76.722 Y84.461 E.04939
G1 X76.722 Y83.916
G1 X77.566 Y83.072 E.03
; WIPE_START
G1 F11668.197
M204 S6000
G1 X76.722 Y83.916 E-.45348
G1 X76.722 Y84.461 E-.20726
G1 X76.907 Y84.277 E-.09927
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.84 Y82.942 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.087016
G1 F9673
M204 S6000
G1 X82.592 Y83.19 E.0012
; WIPE_START
G1 F18000
G1 X82.84 Y82.942 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.898 Y88.068 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192948
G1 F9673
M204 S6000
G1 X77.745 Y88.182 E.00197
; LINE_WIDTH: 0.148012
G1 X77.592 Y88.295 E.00141
; LINE_WIDTH: 0.103077
G1 X77.439 Y88.408 E.00085
M204 S10000
G1 X79.063 Y87.449 F42000
; LINE_WIDTH: 0.192946
G1 F9673
M204 S6000
G1 X78.91 Y87.562 E.00197
; LINE_WIDTH: 0.148011
G1 X78.757 Y87.676 E.00141
; LINE_WIDTH: 0.103076
G1 X78.604 Y87.789 E.00085
; WIPE_START
G1 F18000
G1 X78.757 Y87.676 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.228 Y86.83 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192949
G1 F9673
M204 S6000
G1 X80.075 Y86.943 E.00197
; LINE_WIDTH: 0.148013
G1 X79.922 Y87.056 E.00141
; LINE_WIDTH: 0.103077
G1 X79.769 Y87.169 E.00085
; WIPE_START
G1 F18000
G1 X79.922 Y87.056 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.392 Y86.211 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192949
G1 F9673
M204 S6000
G1 X81.239 Y86.324 E.00197
; LINE_WIDTH: 0.148013
G1 X81.086 Y86.437 E.00141
; LINE_WIDTH: 0.103077
G1 X80.933 Y86.55 E.00085
; WIPE_START
G1 F18000
G1 X81.086 Y86.437 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.557 Y85.591 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192946
M73 P50 R0
G1 F9673
M204 S6000
G1 X82.404 Y85.705 E.00197
; LINE_WIDTH: 0.148011
G1 X82.251 Y85.818 E.00141
; LINE_WIDTH: 0.103076
G1 X82.098 Y85.931 E.00085
; WIPE_START
G1 F18000
G1 X82.251 Y85.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.722 Y84.972 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192952
G1 F9673
M204 S6000
G1 X83.569 Y85.085 E.00197
; LINE_WIDTH: 0.148015
G1 X83.416 Y85.198 E.00141
; LINE_WIDTH: 0.103078
G1 X83.263 Y85.312 E.00085
; WIPE_START
G1 F18000
G1 X83.416 Y85.198 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.886 Y84.353 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192954
G1 F9673
M204 S6000
G1 X84.733 Y84.466 E.00197
; LINE_WIDTH: 0.148016
G1 X84.58 Y84.579 E.00141
; LINE_WIDTH: 0.103078
G1 X84.428 Y84.692 E.00085
; WIPE_START
G1 F18000
G1 X84.58 Y84.579 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.051 Y83.734 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.192955
G1 F9673
M204 S6000
G1 X85.898 Y83.847 E.00197
; LINE_WIDTH: 0.148017
G1 X85.745 Y83.96 E.00141
; LINE_WIDTH: 0.103079
G1 X85.592 Y84.073 E.00085
; WIPE_START
G1 F18000
G1 X85.745 Y83.96 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.988 Y83.283 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.126291
G1 F9673
M204 S6000
G1 X86.872 Y83.368 E.00086
; LINE_WIDTH: 0.095837
G1 X86.757 Y83.454 E.00058
; WIPE_START
G1 F18000
G1 X86.872 Y83.368 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.443 Y82.558 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9673
M204 S2000
G1 X89.129 Y81.872 E.02438
G1 X88.583 Y81.872
G1 X87.722 Y82.733 E.03062
; WIPE_START
G1 F11668.197
M204 S6000
G1 X88.583 Y81.872 E-.46277
G1 X89.129 Y81.872 E-.20725
G1 X88.961 Y82.04 E-.08997
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.248 Y82.096 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100081
G1 F9673
M204 S6000
G1 X89.086 Y82.215 E.00086
M204 S10000
G1 X88.38 Y82.495 F42000
; LINE_WIDTH: 0.192949
G1 F9673
M204 S6000
G1 X88.227 Y82.608 E.00197
; LINE_WIDTH: 0.148013
G1 X88.074 Y82.721 E.00141
; LINE_WIDTH: 0.103077
G1 X87.922 Y82.835 E.00085
; WIPE_START
G1 F18000
G1 X88.074 Y82.721 E-.76
; WIPE_END
M73 P51 R0
G1 E-.04 F1800
M204 S10000
G1 X93.508 Y88.082 Z.7 F42000
G1 X103.278 Y97.72 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9673
M204 S2000
G1 X102.87 Y98.128 E.01449
G1 X102.325 Y98.128
G1 X103.278 Y97.175 E.03389
G1 X103.278 Y96.629
G1 X101.872 Y98.035 E.04998
G1 X101.834 Y97.528
G1 X103.278 Y96.084 E.05134
G1 X103.278 Y95.539
G1 X101.289 Y97.528 E.07073
G1 X100.743 Y97.528
G1 X103.278 Y94.993 E.09013
G1 X103.278 Y94.448
G1 X100.198 Y97.528 E.10952
G1 X99.652 Y97.528
G1 X103.278 Y93.902 E.12891
G1 X103.278 Y93.357
G1 X98.507 Y98.128 E.16963
G1 X97.961 Y98.128
G1 X103.278 Y92.811 E.18903
M73 P52 R0
G1 X103.278 Y92.266
G1 X97.416 Y98.128 E.20842
G1 X96.871 Y98.128
G1 X103.278 Y91.721 E.22781
G1 X103.278 Y91.175
G1 X96.325 Y98.128 E.2472
G1 X95.78 Y98.128
G1 X103.278 Y90.63 E.26659
G1 X103.278 Y90.084
G1 X95.234 Y98.128 E.28599
G1 X94.689 Y98.128
G1 X103.278 Y89.539 E.30538
G1 X103.278 Y88.994
M73 P53 R0
G1 X94.144 Y98.128 E.32477
G1 X93.598 Y98.128
G1 X103.278 Y88.448 E.34416
G1 X103.278 Y87.903
G1 X93.053 Y98.128 E.36355
G1 X92.507 Y98.128
G1 X103.278 Y87.357 E.38295
G1 X103.278 Y86.812
G1 X91.962 Y98.128 E.40234
G1 X91.417 Y98.128
G1 X103.278 Y86.267 E.42173
M73 P54 R0
G1 X103.278 Y85.721
G1 X90.871 Y98.128 E.44112
G1 X90.326 Y98.128
G1 X103.278 Y85.176 E.46052
G1 X102.741 Y85.167
G1 X89.78 Y98.128 E.46083
G1 X89.235 Y98.128
G1 X102.196 Y85.167 E.46083
G1 X101.65 Y85.167
G1 X88.69 Y98.128 E.46083
M73 P55 R0
G1 X88.144 Y98.128
G1 X101.105 Y85.167 E.46083
G1 X100.823 Y84.904
G1 X87.599 Y98.128 E.47019
G1 X87.053 Y98.128
G1 X100.823 Y84.358 E.48958
G1 X100.823 Y83.813
G1 X86.508 Y98.128 E.50897
M73 P56 R0
G1 X85.963 Y98.128
G1 X100.823 Y83.268 E.52836
G1 X100.473 Y83.072
G1 X85.417 Y98.128 E.53531
G1 X84.872 Y98.128
G1 X99.928 Y83.072 E.53531
G1 X99.382 Y83.072
G1 X84.326 Y98.128 E.53531
G1 X83.781 Y98.128
G1 X98.328 Y83.581 E.51721
; WIPE_START
M73 P57 R0
G1 F11668.197
M204 S6000
G1 X96.913 Y84.995 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.163 Y84.2 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9673
M204 S2000
G1 X83.236 Y98.128 E.49519
G1 X82.872 Y97.946
G1 X95.998 Y84.82 E.46671
; WIPE_START
G1 F11668.197
M204 S6000
G1 X94.584 Y86.234 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.834 Y85.439 Z.7 F42000
G1 Z.3
M73 P58 R0
G1 E.8 F1800
G1 F9673
M204 S2000
G1 X82.745 Y97.528 E.42982
G1 X82.199 Y97.528
G1 X93.669 Y86.058 E.40781
; WIPE_START
G1 F11668.197
M204 S6000
G1 X92.255 Y87.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.504 Y86.678 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9673
M204 S2000
G1 X81.654 Y97.528 E.38579
G1 X81.109 Y97.528
G1 X91.34 Y87.297 E.36377
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.925 Y88.711 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.175 Y87.916 Z.7 F42000
G1 Z.3
G1 E.8 F1800
M73 P59 R0
G1 F9673
M204 S2000
G1 X80.563 Y97.528 E.34175
; WIPE_START
G1 F11668.197
M204 S6000
G1 X81.977 Y96.114 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.418 Y98.128 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9673
M204 S2000
G1 X89.01 Y88.535 E.34107
; WIPE_START
G1 F11668.197
M204 S6000
G1 X87.596 Y89.95 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.846 Y89.155 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9673
M204 S2000
G1 X78.872 Y98.128 E.31905
G1 X78.327 Y98.128
G1 X86.681 Y89.774 E.29703
; WIPE_START
G1 F11668.197
M204 S6000
G1 X85.267 Y91.188 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.516 Y90.393 Z.7 F42000
M73 P60 R0
G1 Z.3
G1 E.8 F1800
G1 F9673
M204 S2000
G1 X77.781 Y98.128 E.27501
G1 X77.236 Y98.128
G1 X84.352 Y91.012 E.25299
; WIPE_START
G1 F11668.197
M204 S6000
G1 X82.937 Y92.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.187 Y91.632 Z.7 F42000
G1 Z.3
G1 E.8 F1800
G1 F9673
M204 S2000
G1 X76.722 Y98.096 E.22986
G1 X76.722 Y97.551
G1 X82.022 Y92.251 E.18845
M204 S10000
G1 X80.858 Y92.87 F42000
G1 F9673
M204 S2000
G1 X76.722 Y97.006 E.14704
G1 X76.722 Y96.46
G1 X79.693 Y93.489 E.10563
G1 X78.716 Y93.921
G1 X76.722 Y95.915 E.07088
M73 P61 R0
G1 X76.722 Y95.369
G1 X78.526 Y93.565 E.06415
G1 X78.337 Y93.209
G1 X76.722 Y94.824 E.05742
G1 X76.722 Y94.279
G1 X78.148 Y92.853 E.05069
G1 X77.958 Y92.497
G1 X76.722 Y93.733 E.04396
G1 X76.722 Y93.188
G1 X77.769 Y92.141 E.03723
G1 X77.58 Y91.785
G1 X76.722 Y92.642 E.03049
G1 X76.722 Y92.097
G1 X77.39 Y91.429 E.02376
G1 X77.201 Y91.073
G1 X76.722 Y91.552 E.01703
; WIPE_START
G1 F11668.197
M204 S6000
G1 X77.201 Y91.073 E-.25741
G1 X77.39 Y91.429 E-.15325
G1 X76.74 Y92.079 E-.34935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.214 Y93.213 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103076
G1 F9673
M204 S6000
G1 X80.061 Y93.326 E.00085
; LINE_WIDTH: 0.148009
G1 X79.908 Y93.439 E.00141
; LINE_WIDTH: 0.192942
G1 X79.756 Y93.552 E.00197
; WIPE_START
G1 F18000
G1 X79.908 Y93.439 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.379 Y92.593 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103075
G1 F9673
M204 S6000
G1 X81.226 Y92.707 E.00085
; LINE_WIDTH: 0.148008
M73 P62 R0
G1 X81.073 Y92.82 E.00141
; LINE_WIDTH: 0.192941
G1 X80.92 Y92.933 E.00197
; WIPE_START
G1 F18000
G1 X81.073 Y92.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.544 Y91.974 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F9673
M204 S6000
G1 X82.391 Y92.087 E.00085
; LINE_WIDTH: 0.14801
G1 X82.238 Y92.2 E.00141
; LINE_WIDTH: 0.192943
G1 X82.085 Y92.314 E.00197
; WIPE_START
G1 F18000
G1 X82.238 Y92.2 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.708 Y91.355 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9673
M204 S6000
G1 X83.555 Y91.468 E.00085
; LINE_WIDTH: 0.14801
G1 X83.403 Y91.581 E.00141
; LINE_WIDTH: 0.192943
G1 X83.25 Y91.694 E.00197
; WIPE_START
G1 F18000
G1 X83.403 Y91.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.873 Y90.736 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9673
M204 S6000
G1 X84.72 Y90.849 E.00085
; LINE_WIDTH: 0.14801
G1 X84.567 Y90.962 E.00141
; LINE_WIDTH: 0.192943
G1 X84.414 Y91.075 E.00197
; WIPE_START
G1 F18000
G1 X84.567 Y90.962 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.038 Y90.116 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9673
M204 S6000
G1 X85.885 Y90.23 E.00085
; LINE_WIDTH: 0.148012
G1 X85.732 Y90.343 E.00141
; LINE_WIDTH: 0.192948
G1 X85.579 Y90.456 E.00197
; WIPE_START
G1 F18000
G1 X85.732 Y90.343 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.202 Y89.497 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F9673
M204 S6000
G1 X87.049 Y89.61 E.00085
; LINE_WIDTH: 0.148009
G1 X86.897 Y89.723 E.00141
; LINE_WIDTH: 0.192943
G1 X86.744 Y89.837 E.00197
; WIPE_START
G1 F18000
G1 X86.897 Y89.723 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.367 Y88.878 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9673
M204 S6000
G1 X88.214 Y88.991 E.00085
; LINE_WIDTH: 0.148012
G1 X88.061 Y89.104 E.00141
; LINE_WIDTH: 0.192948
G1 X87.908 Y89.217 E.00197
; WIPE_START
G1 F18000
G1 X88.061 Y89.104 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.532 Y88.259 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F9673
M204 S6000
G1 X89.379 Y88.372 E.00085
; LINE_WIDTH: 0.148011
G1 X89.226 Y88.485 E.00141
; LINE_WIDTH: 0.192945
G1 X89.073 Y88.598 E.00197
; WIPE_START
G1 F18000
G1 X89.226 Y88.485 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.696 Y87.639 Z.7 F42000
M73 P63 R0
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F9673
M204 S6000
G1 X90.543 Y87.752 E.00085
; LINE_WIDTH: 0.148011
G1 X90.391 Y87.866 E.00141
; LINE_WIDTH: 0.192945
G1 X90.238 Y87.979 E.00197
; WIPE_START
G1 F18000
G1 X90.391 Y87.866 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.861 Y87.02 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F9673
M204 S6000
G1 X91.708 Y87.133 E.00085
; LINE_WIDTH: 0.148009
G1 X91.555 Y87.246 E.00141
; LINE_WIDTH: 0.192942
G1 X91.402 Y87.36 E.00197
; WIPE_START
G1 F18000
G1 X91.555 Y87.246 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.026 Y86.401 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9673
M204 S6000
G1 X92.873 Y86.514 E.00085
; LINE_WIDTH: 0.148012
G1 X92.72 Y86.627 E.00141
; LINE_WIDTH: 0.192948
G1 X92.567 Y86.74 E.00197
; WIPE_START
G1 F18000
G1 X92.72 Y86.627 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.19 Y85.782 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9673
M204 S6000
G1 X94.037 Y85.895 E.00085
; LINE_WIDTH: 0.148013
G1 X93.885 Y86.008 E.00141
; LINE_WIDTH: 0.192949
G1 X93.732 Y86.121 E.00197
; WIPE_START
G1 F18000
G1 X93.885 Y86.008 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.355 Y85.162 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9673
M204 S6000
G1 X95.202 Y85.275 E.00085
; LINE_WIDTH: 0.148013
G1 X95.049 Y85.389 E.00141
; LINE_WIDTH: 0.192949
G1 X94.896 Y85.502 E.00197
; WIPE_START
G1 F18000
G1 X95.049 Y85.389 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.52 Y84.543 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9673
M204 S6000
G1 X96.367 Y84.656 E.00085
; LINE_WIDTH: 0.148012
G1 X96.214 Y84.769 E.00141
; LINE_WIDTH: 0.192948
G1 X96.061 Y84.882 E.00197
; WIPE_START
G1 F18000
G1 X96.214 Y84.769 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.684 Y83.924 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9673
M204 S6000
G1 X97.532 Y84.037 E.00085
; LINE_WIDTH: 0.148013
G1 X97.379 Y84.15 E.00141
; LINE_WIDTH: 0.192949
G1 X97.226 Y84.263 E.00197
; WIPE_START
G1 F18000
G1 X97.379 Y84.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.849 Y83.304 Z.7 F42000
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F9673
M204 S6000
M73 P64 R0
G1 X98.696 Y83.418 E.00085
; LINE_WIDTH: 0.148012
G1 X98.543 Y83.531 E.00141
; LINE_WIDTH: 0.192948
G1 X98.39 Y83.644 E.00197
; WIPE_START
G1 F18000
G1 X98.543 Y83.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.256 Y90.969 Z.7 F42000
G1 X101.746 Y97.44 Z.7
G1 Z.3
G1 E.8 F1800
; LINE_WIDTH: 0.106423
G1 F9673
M204 S6000
G1 X101.624 Y97.513 E.00067
; LINE_WIDTH: 0.0875684
G1 X101.632 Y97.53 E.00006
; LINE_WIDTH: 0.058027
G1 X101.639 Y97.547 E.00003
; CHANGE_LAYER
; Z_HEIGHT: 0.46
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F18000
G1 X101.632 Y97.53 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/7
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M106 S204
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.7 I.427 J-1.139 P1  F42000
G1 X77.681 Y88.544 Z.7
G1 Z.46
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.377567
G1 F1200
M204 S5000
G1 X77.577 Y88.348 E.00498
G1 X79.362 Y87.398 E.04525
G1 X79.467 Y87.595 E.00498
G1 X77.734 Y88.516 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X77.577 Y88.348 E-.08755
G1 X79.139 Y87.517 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.065 Y93.027 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X81.851 Y92.078 E.04525
G1 X81.955 Y92.274 E.00498
G1 X80.169 Y93.224 E.04525
M73 P65 R0
G1 X80.093 Y93.08 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X81.83 Y92.089 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.569 Y88.506 Z.86 F42000
G1 X90.66 Y87.394 Z.86
G1 Z.46
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.446 Y86.444 E.04525
G1 X92.55 Y86.641 E.00498
G1 X90.765 Y87.59 E.04525
G1 X90.688 Y87.447 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X92.426 Y86.456 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.277 Y82.911 Z.86 F42000
G1 Z.46
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X88.172 Y82.714 E.00498
G1 X89.958 Y81.765 E.04525
G1 X90.022 Y81.886 E.00306
G1 X90.062 Y81.961 E.00191
G1 X88.33 Y82.882 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X88.172 Y82.714 E-.08756
G1 X89.735 Y81.883 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.86 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.62
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 4/7
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
G1 X77.681 Y88.544 F42000
G1 Z.62
M73 P66 R0
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X77.577 Y88.348 E.00498
G1 X79.362 Y87.398 E.04525
G1 X79.443 Y87.549 E.00383
G1 X79.467 Y87.595 E.00115
G1 X77.734 Y88.516 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X77.577 Y88.348 E-.08755
G1 X79.139 Y87.517 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.065 Y93.027 Z1.02 F42000
G1 Z.62
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X81.851 Y92.078 E.04525
G1 X81.875 Y92.123 E.00115
G1 X81.955 Y92.274 E.00383
G1 X80.169 Y93.224 E.04525
G1 X80.093 Y93.08 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X81.83 Y92.089 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.569 Y88.506 Z1.02 F42000
G1 X90.66 Y87.394 Z1.02
G1 Z.62
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.446 Y86.444 E.04525
M73 P67 R0
G1 X92.47 Y86.49 E.00115
G1 X92.55 Y86.641 E.00383
G1 X90.765 Y87.59 E.04525
G1 X90.688 Y87.447 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X92.426 Y86.456 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.277 Y82.911 Z1.02 F42000
G1 Z.62
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X88.172 Y82.714 E.00498
G1 X89.958 Y81.765 E.04525
G1 X90.062 Y81.961 E.00498
G1 X88.33 Y82.882 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X88.172 Y82.714 E-.08756
G1 X89.735 Y81.883 E-.67245
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.02 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.78
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 5/7
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
G1 X90.66 Y87.394 F42000
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X92.446 Y86.444 E.04525
G1 X92.55 Y86.641 E.00498
G1 X90.765 Y87.59 E.04525
G1 X90.688 Y87.447 E.00363
; WIPE_START
G1 F12000
M204 S6000
M73 P68 R0
G1 X92.426 Y86.456 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.277 Y82.911 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X88.172 Y82.714 E.00498
G1 X89.958 Y81.765 E.04525
G1 X90.062 Y81.961 E.00498
G1 X88.33 Y82.882 E.04391
; WIPE_START
G1 F12000
M204 S6000
G1 X88.172 Y82.714 E-.08756
G1 X89.735 Y81.883 E-.67244
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.995 Y85.467 Z1.18 F42000
G1 X77.577 Y88.348 Z1.18
G1 Z.78
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X79.362 Y87.398 E.04525
G1 X79.467 Y87.595 E.00498
G1 X77.681 Y88.544 E.04525
G1 X77.605 Y88.401 E.00363
; WIPE_START
G1 F12000
M204 S6000
G1 X79.342 Y87.41 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.065 Y93.027 Z1.18 F42000
G1 Z.78
G1 E.8 F1800
M73 P69 R0
G1 F1200
M204 S5000
G1 X81.851 Y92.078 E.04525
G1 X81.955 Y92.274 E.00498
G1 X80.169 Y93.224 E.04525
G1 X80.093 Y93.08 E.00364
; WIPE_START
G1 F12000
M204 S6000
G1 X81.83 Y92.089 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.18 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

; CHANGE_LAYER
; Z_HEIGHT: 0.94
; LAYER_HEIGHT: 0.16
; layer num/total_layer_count: 6/7
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 15
G1 X80.344 Y92.653 F42000
G1 Z.94
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X80.255 Y92.486 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X78.236 Y88.689 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X78.147 Y88.522 E.00513
M106 S204
M106 S255
G1 X79.188 Y87.969 E.03194
M106 S204
M106 S255
G1 X79.277 Y88.136 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X81.296 Y91.933 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X81.385 Y92.1 E.00513
M106 S204
M106 S255
G1 X80.397 Y92.625 E.03031
M106 S204
M204 S250
G1 X80.074 Y93 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
M204 S5000
G1 X79.901 Y92.674 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
M73 P70 R0
G1 F3000
G1 X77.882 Y88.878 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X77.709 Y88.552 E.00928
M106 S204
G1 F1200
G1 X77.605 Y88.357 E.00556
G1 X77.959 Y88.169 E.01006
G1 X78.312 Y87.981 E.01006
G1 X78.665 Y87.793 E.01006
G1 X79 Y87.615 E.00956
G1 X79.354 Y87.427 E.01006
G1 X79.424 Y87.559 E.00377
G1 F865.268
G1 X79.457 Y87.622 E.00179
M106 S255
G1 F600
G1 X79.631 Y87.948 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X81.649 Y91.745 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X81.823 Y92.07 E.00928
M106 S204
G1 F1200
G1 X81.926 Y92.266 E.00556
G1 X81.573 Y92.453 E.01006
G1 X81.22 Y92.641 E.01006
G1 X80.867 Y92.829 E.01006
G1 X80.178 Y93.195 E.01961
G1 X80.103 Y93.053 E.00405
; WIPE_START
G1 F11668.197
M204 S6000
G1 X79.901 Y92.674 E-.16302
G1 X79.164 Y91.287 E-.59698
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X80.591 Y92.333
G1 Z.94
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.476046
M106 S255
G1 F3000
M204 S6000
G1 X78.632 Y88.65 E.12011
G1 X79.022 Y88.442 E.01272
G1 X80.981 Y92.126 E.12011
M106 S204
; WIPE_START
G1 X80.042 Y90.36 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
M73 P71 R0
G3 Z1.34 I.793 J.923 P1  F42000
G1 X88.743 Y82.889 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S6000
G1 X89.783 Y82.335 E.03194
M106 S204
M106 S255
G1 X89.872 Y82.502 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X91.891 Y86.299 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X91.98 Y86.466 E.00513
M106 S204
M106 S255
G1 X90.939 Y87.02 E.03194
M106 S204
M106 S255
G1 X90.85 Y86.852 E.00513
M106 S204
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X88.832 Y83.056 E.11652
M106 S204
; FEATURE: Inner wall
M106 S255
G1 F600
M204 S6000
G1 X88.771 Y82.942 E.00351
M106 S204
M204 S250
G1 X88.305 Y82.918 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X88.201 Y82.723 E.00556
G1 X88.89 Y82.357 E.01961
G1 X89.243 Y82.169 E.01006
G1 X89.596 Y81.981 E.01006
G1 X89.949 Y81.793 E.01006
G1 X90.019 Y81.926 E.00377
G1 F865.213
G1 X90.053 Y81.988 E.00179
M106 S255
G1 F600
G1 X90.226 Y82.314 E.00928
M106 S204
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X92.245 Y86.111 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F720
G1 X92.418 Y86.437 E.00928
M73 P72 R0
G1 F1200
G1 X92.522 Y86.632 E.00556
G1 X92.169 Y86.82 E.01006
G1 X91.815 Y87.007 E.01006
G1 X91.462 Y87.195 E.01006
G1 X91.127 Y87.374 E.00956
G1 X90.774 Y87.561 E.01006
G1 X90.67 Y87.366 E.00556
G1 F720
G1 X90.497 Y87.041 E.00928
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X88.478 Y83.244 E.11652
M106 S204
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X88.333 Y82.971 E.00777
M106 S204
; WIPE_START
M204 S6000
M73 P75 R0
G1 X88.201 Y82.723 E-.10679
G1 X88.89 Y82.357 E-.29642
G1 X89.243 Y82.169 E-.152
G1 X89.596 Y81.981 E-.152
G1 X89.719 Y81.916 E-.0528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.34 I-1.163 J.357 P1  F42000
G1 X91.186 Y86.699 Z1.34
G1 Z.94
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.476056
M106 S255
G1 F3000
M204 S6000
G1 X89.228 Y83.016 E.12012
G1 X89.618 Y82.809 E.01272
G1 X91.576 Y86.492 E.12012
M106 S204
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F3000
G1 X90.637 Y84.726 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/7
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.34 I-.766 J-.946 P1  F42000
M73 P76 R0
G1 X80.178 Y93.195 Z1.34
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X77.605 Y88.357 E.13778
G1 X79.354 Y87.427 E.04978
G1 X81.926 Y92.266 E.13778
G1 X80.231 Y93.167 E.04827
; WIPE_START
G1 F11668.197
M204 S6000
G1 X79.273 Y91.411 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.217 J0 P1  F42000
;========Date 20250206========
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623

G1 X79.892 Y88.891
M73 P77 R0
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X78.906 Y87.905 E.03506
G1 X78.55 Y88.095
G1 X80.511 Y90.056 E.06974
; WIPE_START
G1 F11668.197
M204 S6000
G1 X79.097 Y88.642 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.956 J.754 P1  F42000
G1 X81.131 Y91.221 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X78.194 Y88.284 E.10442
G1 X77.987 Y88.623
G1 X81.576 Y92.212 E.12761
G1 X81.22 Y92.401
G1 X78.606 Y89.787 E.09293
; WIPE_START
M73 P78 R0
G1 F11668.197
M204 S6000
G1 X80.021 Y91.201 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.364 J-1.161 P1  F42000
G1 X79.226 Y90.952 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X80.864 Y92.59 E.05825
G1 X80.508 Y92.78
G1 X79.845 Y92.117 E.02357
; WIPE_START
G1 F11668.197
M204 S6000
G1 X80.508 Y92.78 E-.35625
G1 X80.864 Y92.59 E-.15324
G1 X80.398 Y92.124 E-.2505
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.987 J-.711 P1  F42000
G1 X78.669 Y89.725 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192951
G1 F1200
M204 S6000
G1 X78.556 Y89.572 E.00197
; LINE_WIDTH: 0.148014
G1 X78.443 Y89.419 E.00141
; LINE_WIDTH: 0.103078
G1 X78.33 Y89.266 E.00085
; WIPE_START
G1 F18000
G1 X78.443 Y89.419 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.055 J.607 P1  F42000
M73 P79 R0
G1 X79.288 Y90.889 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192952
G1 F1200
M204 S6000
G1 X79.175 Y90.736 E.00197
; LINE_WIDTH: 0.148015
G1 X79.062 Y90.583 E.00141
; LINE_WIDTH: 0.103078
G1 X78.949 Y90.431 E.00085
; WIPE_START
G1 F18000
G1 X79.062 Y90.583 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.055 J.607 P1  F42000
G1 X79.908 Y92.054 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.192955
G1 F1200
M204 S6000
G1 X79.794 Y91.901 E.00197
; LINE_WIDTH: 0.148017
G1 X79.681 Y91.748 E.00141
; LINE_WIDTH: 0.103079
G1 X79.568 Y91.595 E.00085
; WIPE_START
G1 F18000
G1 X79.681 Y91.748 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.075 J.571 P1  F42000
G1 X80.3 Y92.912 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.0989541
G1 F1200
M204 S6000
G1 X80.187 Y92.76 E.0008
; WIPE_START
G1 F18000
G1 X80.3 Y92.912 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.884 J.837 P1  F42000
G1 X81.407 Y91.742 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F1200
M204 S6000
G1 X81.294 Y91.589 E.00085
; LINE_WIDTH: 0.148013
G1 X81.181 Y91.436 E.00141
; LINE_WIDTH: 0.192949
G1 X81.068 Y91.283 E.00197
M204 S10000
G1 X80.788 Y90.577 F42000
; LINE_WIDTH: 0.103078
G1 F1200
M204 S6000
G1 X80.675 Y90.424 E.00085
; LINE_WIDTH: 0.148014
G1 X80.562 Y90.272 E.00141
; LINE_WIDTH: 0.192951
G1 X80.449 Y90.119 E.00197
M204 S10000
G1 X80.169 Y89.413 F42000
; LINE_WIDTH: 0.103078
G1 F1200
M204 S6000
G1 X80.056 Y89.26 E.00085
; LINE_WIDTH: 0.148015
G1 X79.942 Y89.107 E.00141
; LINE_WIDTH: 0.192952
G1 X79.829 Y88.954 E.00197
M204 S10000
G1 X79.55 Y88.248 F42000
; LINE_WIDTH: 0.099399
G1 F1200
M204 S6000
G1 X79.456 Y88.121 E.00067
; LINE_WIDTH: 0.136978
G1 X79.362 Y87.994 E.00106
; LINE_WIDTH: 0.174558
G1 X79.268 Y87.868 E.00144
; LINE_WIDTH: 0.212137
G1 X79.174 Y87.741 E.00183
; WIPE_START
G1 F18000
G1 X79.268 Y87.868 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.882 Y84.058 Z1.5 F42000
G1 X88.201 Y82.723 Z1.5
G1 Z1.1
M73 P80 R0
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X89.949 Y81.793 E.04978
G1 X92.522 Y86.632 E.13778
G1 X90.774 Y87.561 E.04978
G1 X88.229 Y82.776 E.13627
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.949 Y81.793 E-.75276
G1 X89.958 Y81.81 E-.00725
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.157 J.376 P1  F42000
G1 X90.336 Y82.973 Z1.5
G1 Z1.1
M73 P81 R0
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X89.588 Y82.225 E.02659
G1 X89.232 Y82.415
G1 X90.955 Y84.138 E.06127
; WIPE_START
G1 F11668.197
M204 S6000
G1 X89.541 Y82.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-.956 J.754 P1  F42000
G1 X91.575 Y85.303 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X88.876 Y82.604 E.09595
G1 X88.52 Y82.793
G1 X92.194 Y86.467 E.13063
G1 X91.902 Y86.721
G1 X89.051 Y83.869 E.10139
; WIPE_START
G1 F11668.197
M204 S6000
G1 X90.465 Y85.284 E-.76
; WIPE_END
M73 P82 R0
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.364 J-1.161 P1  F42000
G1 X89.67 Y85.034 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F1200
M204 S2000
G1 X91.546 Y86.91 E.06672
G1 X91.19 Y87.1
G1 X90.289 Y86.199 E.03204
; WIPE_START
G1 F11668.197
M204 S6000
G1 X91.19 Y87.1 E-.48423
G1 X91.546 Y86.91 E-.15325
G1 X91.318 Y86.682 E-.12253
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.966 J-.74 P1  F42000
G1 X89.113 Y83.807 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192949
G1 F1200
M204 S6000
G1 X89 Y83.654 E.00197
; LINE_WIDTH: 0.148013
G1 X88.887 Y83.501 E.00141
; LINE_WIDTH: 0.103077
G1 X88.774 Y83.348 E.00085
; WIPE_START
G1 F18000
G1 X88.887 Y83.501 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I.884 J.836 P1  F42000
G1 X89.994 Y82.33 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.0972538
M73 P83 R0
G1 F1200
M204 S6000
G1 X89.903 Y82.207 E.00063
; LINE_WIDTH: 0.130543
G1 X89.812 Y82.085 E.00096
; WIPE_START
G1 F18000
G1 X89.903 Y82.207 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.066 J.588 P1  F42000
G1 X90.613 Y83.495 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.103078
G1 F1200
M204 S6000
G1 X90.5 Y83.342 E.00085
; LINE_WIDTH: 0.148014
G1 X90.387 Y83.189 E.00141
; LINE_WIDTH: 0.192951
G1 X90.274 Y83.036 E.00197
; WIPE_START
G1 F18000
G1 X90.387 Y83.189 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.055 J.607 P1  F42000
G1 X91.232 Y84.659 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.103077
G1 F1200
M204 S6000
G1 X91.119 Y84.507 E.00085
; LINE_WIDTH: 0.148013
G1 X91.006 Y84.354 E.00141
; LINE_WIDTH: 0.192949
G1 X90.893 Y84.201 E.00197
; WIPE_START
G1 F18000
G1 X91.006 Y84.354 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.055 J.607 P1  F42000
G1 X91.851 Y85.824 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.103076
G1 F1200
M204 S6000
G1 X91.738 Y85.671 E.00085
; LINE_WIDTH: 0.148011
G1 X91.625 Y85.518 E.00141
; LINE_WIDTH: 0.192946
G1 X91.512 Y85.365 E.00197
; WIPE_START
G1 F18000
G1 X91.625 Y85.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I-1.132 J-.448 P1  F42000
G1 X90.938 Y87.256 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.180972
G1 F1200
M204 S6000
G1 X90.836 Y87.118 E.00164
; LINE_WIDTH: 0.140827
G1 X90.734 Y86.98 E.00119
; LINE_WIDTH: 0.100682
G1 X90.632 Y86.842 E.00074
M204 S10000
G1 X90.352 Y86.136 F42000
; LINE_WIDTH: 0.192948
G1 F1200
M204 S6000
G1 X90.239 Y85.983 E.00197
; LINE_WIDTH: 0.148012
G1 X90.125 Y85.83 E.00141
; LINE_WIDTH: 0.103077
G1 X90.012 Y85.677 E.00085
M204 S10000
G1 X89.733 Y84.971 F42000
; LINE_WIDTH: 0.192949
G1 F1200
M204 S6000
G1 X89.619 Y84.818 E.00197
; LINE_WIDTH: 0.148013
M73 P84 R0
G1 X89.506 Y84.665 E.00141
; LINE_WIDTH: 0.103077
G1 X89.393 Y84.513 E.00085
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F18000
G1 X89.506 Y84.665 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.5 I1.217 J0 P1  F42000
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z1.6 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
M73 P85 R0
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
M73 P86 R0
G1 X65 F12000
M73 P87 R0
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

    G1 Z101.1 F600
M73 P89 R0
    G1 Z99.1

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

